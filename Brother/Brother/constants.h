/**     ___           ___           ___                         ___           ___     
 *     /__/\         /  /\         /  /\         _____         /  /\         /__/|    
 *    |  |::\       /  /::\       /  /::|       /  /::\       /  /::\       |  |:|    
 *    |  |:|:\     /  /:/\:\     /  /:/:|      /  /:/\:\     /  /:/\:\      |  |:|    
 *  __|__|:|\:\   /  /:/~/::\   /  /:/|:|__   /  /:/~/::\   /  /:/  \:\   __|__|:|    
 * /__/::::| \:\ /__/:/ /:/\:\ /__/:/ |:| /\ /__/:/ /:/\:| /__/:/ \__\:\ /__/::::\____
 * \  \:\~~\__\/ \  \:\/:/__\/ \__\/  |:|/:/ \  \:\/:/~/:/ \  \:\ /  /:/    ~\~~\::::/
 *  \  \:\        \  \::/          |  |:/:/   \  \::/ /:/   \  \:\  /:/      |~~|:|~~ 
 *   \  \:\        \  \:\          |  |::/     \  \:\/:/     \  \:\/:/       |  |:|   
 *    \  \:\        \  \:\         |  |:/       \  \::/       \  \::/        |  |:|   
 *     \__\/         \__\/         |__|/         \__\/         \__\/         |__|/   
 *
 *  Description: 
 *				 
 *  constants.h, created by Marek Bereza on 30/07/2012.
 */

#pragma once

// some pin defs

// the tx pin (digital pin 1)
#define TXD 1


#define STEP1 A1
#define STEP2 A3
#define STEP3 A5
#define STEP4 4

#define DIR1 A0
#define DIR2 A2
#define DIR3 A4
#define DIR4 7



#define FET1 5
#define FET2 6
#define FET3 9
#define FET4 10

// these are on shift register pins
#define EN1 7
#define EN2 6
#define EN3 5
#define EN4 4

// likewise these are shift
#define LED1 15
#define LED2 14
#define LED3 13
#define LED4 12
#define LED5 11
#define LED6 10
#define LED7 9
#define LED8 8

// optoisolators
#define OP1	3
#define OP2	2
#define OP3	1
#define OP4	0
//These are the pins that will talk to the shift register through SPI
#define SDI    11    //Data
#define CLK    13    //Clock
#define LE     12    //Latch

#define LEDEN 8 // active low (activate shift register enble)


// convenience enumeration for things like DirStepOsc
// which will let you define EN1, DIR1 and STEP1 all at once.
#define STEPPER_1 1
#define STEPPER_2 2
#define STEPPER_3 3
#define STEPPER_4 4


#define LIMIT1 2
#define LIMIT2 3
#define ANA1 A7
#define ANA2 A6


// 20000 micros = 1/50th second
const unsigned long LIMIT_CHECK = 20000;
const unsigned long HALF_LIMIT_CHECK = LIMIT_CHECK / 2;
const unsigned long DISABLED_PERIOD = 1e6;
const unsigned long FLAP_TIME = 100000;
const unsigned long FLAP_COUNT = 10000;
const unsigned long HALF_FLAP_COUNT = FLAP_COUNT / 2;
const int DRAWER_START_DIR = 1;
const unsigned long DRAWER_STEPS = 200;