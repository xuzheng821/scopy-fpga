/*
 * spi.h
 *
 * This file is part of YAOS and is licensed under the MIT License.
 *
 *  Created on: 3 Apr 2020
 *      Author: Tom
 */

#ifndef SRC_SPI_H_
#define SRC_SPI_H_

#include <stdint.h>
#include <stdbool.h>

#include "Collections-C/src/include/deque.h"

#include "xspips.h"

#define SPI_DEVICE_ID					XPAR_PS7_SPI_0_DEVICE_ID

#define SPI_QUEUE_ALLOC_MAX				127								// Allowed to enqueue up to 127 commands; must be one less than a power-of-two
#define SPI_QUEUE_ALLOC_BITMASK_SIZE	((SPI_QUEUE_ALLOC_MAX / 32) + 1)

#define SPI_QUEUE_SIZE					(SPI_QUEUE_ALLOC_MAX + 1)		// Total of 128 slots in the deque; must be power-of-two

#define SPI_COMMAND_MAX_ARGS			16								// Max 16 arguments per command
#define SPI_COMMAND_SHORT_NAME_MAX		15								// Maximum 15 characters (plus NUL) in the short name
#define SPI_COMMAND_TOTAL_COUNT			256								// 256 possible commands (8-bit command ID)

#define SPI_SHORTEST_MESSAGE			2								// Shortest message is cmd byte + CRC8

#define SPI_CRC8_POLY					0x9b							// P.Koopman, CMU

#define SPI_STATE_UNINIT				0
#define SPI_STATE_CMD_HEADER			1
#define SPI_STATE_ARGS					2
#define SPI_STATE_CHECKSUM				3
#define SPI_STATE_RESPONSE_WAIT			4
#define SPI_STATE_RESPONSE_SIZE			5
#define SPI_STATE_RESPONSE				6

#define SPIPROC_STATE_UNPACK			1
#define SPIPROC_STATE_SPIN_RESPONSE		2

#define SPI_RESPONSE_1BYTE_MAX			127
#define SPI_RESPONSE_2BYTE_MAX			32640
#define SPI_RESPONSE_PACK_SIZE			24								// How many bytes we pack at a time into the TX FIFO
#define SPI_TX_OVERWATER_DEFAULT		(128 - SPI_RESPONSE_PACK_SIZE)	// 128 byte FIFO - 24 byte pack size

#define SPIRET_OK						0
#define SPIRET_MEM_ERROR				-1

extern struct spi_state_t g_spi_state;
extern struct spi_version_resp_t g_version_resp;

#define SPI_IS_TX_FULL()				(!!(XSpiPs_ReadReg(g_spi_state.spi.Config.BaseAddress, XSPIPS_SR_OFFSET) & XSPIPS_IXR_TXFULL_MASK))
#define SPI_IS_TX_OVERWATER()			(!!(XSpiPs_ReadReg(g_spi_state.spi.Config.BaseAddress, XSPIPS_SR_OFFSET) & XSPIPS_IXR_TXOW_MASK))

#define SPI_RST_CTRL_MASK				0x00000005
#define SPI_RST_CTRL_REG_SLCR			0xF800021C

/*
 * Statistics.
 */
struct spi_stats_t {
	uint64_t num_bytes_rxtx;				// Raw read bytes/raw transmit bytes (TX 0x00 = mostly unused)
	uint64_t num_bytes_tx_valid;			// Useful transmitted bytes
	uint64_t num_bytes_rx_valid;			// Read bytes that were valid (state was useful)
	uint64_t num_command_ok;				// Bytes received that were valid command IDs
	uint64_t num_command_errors;			// Errors that have occurred due to an invalid command in the queue
	uint64_t num_command_accepted;			// Commands accepted and packed into the queue
	uint64_t num_command_processed;			// Commands actually processed
	uint64_t num_command_lost_full_alloc;	// Commands lost because allocation table was full
	uint64_t num_command_lost_full_deque;	// Commands lost because deque failed to alloc
	uint64_t num_crc_errors;				// Commands lost because CRC8 check failed
	uint64_t num_resp_aborts_byte_rec;		// Number of response aborts due to wrong byte received
	uint64_t num_resps;						// Number of responses completed
};

/*
 * This struct stores a decoded command as received from the SPI port
 * and packed into the command queue.
 */
struct spi_command_alloc_t {
	int alloc_idx, nargs;
	uint8_t cmd;
	uint8_t args[SPI_COMMAND_MAX_ARGS];
	int resp_size;
	uint8_t *resp_data;
	unsigned int resp_ready : 1;
	unsigned int resp_done : 1;
	unsigned int resp_error : 1;
	unsigned int free_resp_reqd : 1;
	unsigned int crc_valid : 1;
};

/*
 * This struct stores the state of the command processor and contains
 * pointers to the SPI peripheral.
 */
struct spi_state_t {
	XSpiPs spi;
	XSpiPs_Config *spi_config;

	// Deque for command task list (Collections-C)
	Deque *command_dq;

	// State of command processor
	int cmd_state;
	uint8_t cmd_id;
	uint8_t cmd_argdata[SPI_COMMAND_MAX_ARGS];
	int cmd_argpop;
	int cmd_argidx;
	bool has_response;
	uint8_t crc;

	// Last command allocated
	struct spi_command_alloc_t *last_cmd;
	uint8_t *resp_data_ptr;
	int resp_bytes;

	// Command being processed by the main thread
	struct spi_command_alloc_t *proc_cmd;
	int proc_state;

	// Byte from previous cycle to be transmitted
	uint8_t byte_tx;
	int byte_send : 1;

	/*
	 * Look-up table for CRC calculation.
	 */
	uint8_t crc_table[256];

	/*
	 * Allocation table for the command task list.  Commands are packed into the Deque
	 * from this table.  Once a command is processed, the allocation is freed again.
	 *
	 * A bitmask is stored to allow entries in the table to be found quickly.
	 */
	uint32_t cmd_free_bitmask[SPI_QUEUE_ALLOC_BITMASK_SIZE];
	struct spi_command_alloc_t cmd_alloc_table[SPI_QUEUE_ALLOC_MAX];
	int commands_queued;

	/*
	 * Statistics counters.
	 */
	struct spi_stats_t stats;
};

/*
 * This struct stores one const reference to a command in the command
 * definition table.
 */
struct spi_command_def_t {
	uint8_t cmd_id;
	char *short_name;
	int nargs;
	bool has_response;
	void (*cmd_processor)(struct spi_command_alloc_t *);
};

/*
 * This struct stores a transformed version of the above, copied into
 * RAM in a dictionary-style format.
 */
struct spi_command_lut_t {
	uint8_t valid;
	char short_name[SPI_COMMAND_SHORT_NAME_MAX + 1];
	int nargs;
	bool has_response;
	void (*cmd_processor)(struct spi_command_alloc_t *);
};

/*
 * Response to the "VERSION" command.
 */
struct spi_version_resp_t {
	uint32_t bitstream_id;
	uint32_t usraccess;
	uint32_t ps_app_id;
	uint32_t build_timestamp;
};


void spi_init();
void spi_reset_hw();
void spi_crc_lut_gen();
void spi_command_lut_gen();
void spi_isr_handler(void *unused);
int spi_command_find_free_slot();
int spi_command_pack_response_simple(struct spi_command_alloc_t *cmd, uint8_t *resp, int respsz);
int spi_transmit_packet_nonblock(uint8_t *pkt, int bytes);
void spi_command_tick();

/*
 * Receive a byte via the SPI port (without checking if it is available.)  May return
 * stale data if overrun occurs.
 */
inline uint8_t spi_receive_no_wait()
{
	return XSpiPs_ReadReg(g_spi_state.spi_config->BaseAddress, XSPIPS_RXD_OFFSET);
}

/*
 * Transmit a byte via the SPI port (without checking if space is available.)  May return
 * stale data if overrun occurs.
 */
inline void spi_transmit_no_wait(uint8_t byte)
{
	XSpiPs_WriteReg(g_spi_state.spi_config->BaseAddress, XSPIPS_TXD_OFFSET, byte);
}

/*
 * Transmit a byte via the SPI port IF there is space free in the transmit FIFO.
 */
inline int spi_transmit(uint8_t byte)
{
	if(!SPI_IS_TX_FULL()) {
		XSpiPs_WriteReg(g_spi_state.spi_config->BaseAddress, XSPIPS_TXD_OFFSET, byte);
		return 1;
	} else {
		return 0;
	}
}

/*
 * Transmit a byte via the SPI port, blocking until there is space free.
 */
inline void spi_transmit_wait_free(uint8_t byte)
{
	while(!spi_transmit(byte)) ;
}

/*
 * Mark a slot as occupied in the bitmask.  Slots are occupied when their bit is zero.
 */
inline void spi_command_mark_slot_occupied(unsigned int slot)
{
	g_spi_state.cmd_free_bitmask[slot / 32] &= ~(1 << (slot % 32));
}

/*
 * Free a slot in the bitmask.  Slots are free when their bit is set.
 */
inline void spi_command_mark_slot_free(unsigned int slot)
{
	g_spi_state.cmd_free_bitmask[slot / 32] |= (1 << (slot % 32));
}

#endif // SRC_SPI_H_