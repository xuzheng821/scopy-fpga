/*
 * test_patterns.h
 *
 * This file is part of YAOS and is licensed under the MIT License.
 *
 *  Created on: 26 Apr 2020
 *      Author: Tom
 */

#ifndef SRC_TEST_PATTERNS_H_
#define SRC_TEST_PATTERNS_H_

#define TESTPATT_NORWAY_512X512_SIZE 		262144

#include <stdint.h>

extern const uint8_t __attribute__((aligned(4))) testpatt_norway_512x512_grey[262144];

#endif // SRC_TEST_PATTERNS_H_
