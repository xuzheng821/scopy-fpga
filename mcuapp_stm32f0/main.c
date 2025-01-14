#include "hal.h"
#include "hmcad151x.h"
#include "adf435x.h"
#include "shell.h"

void main()
{
    hal_init();
    
    /*
     * Test application.
     */
    main_psu_power_on();
    raspi_power_on();
    zynq_power_on();
    hmcad151x_init();
    adf435x_init();
    adf435x_rf_on();
    
    // XXX: We should load a profile instead
    adf435x_change_frequency(1000);
    
    shell_init(); 
    shell_run();
}