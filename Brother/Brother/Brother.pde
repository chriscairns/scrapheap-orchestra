/// 
/// @mainpage	Brother 
/// @details	details
/// @n 
/// @n 
/// @n @a	Developed with [embedXcode]( http://embedXcode.weebly.com )
/// 
/// @author	Neil Mendoza
/// @author	__MyCompanyName__
/// @date	27/07/2012 11:34
/// @version	version
/// 
/// @copyright	© Neil Mendoza, 2012
/// @copyright	CC = BY NC SA
///
/// @see	ReadMe.txt for references
///


#include "Arduino.h"
#include "EEPROM.h"

// Include application, user and local libraries
#include "LocalLibrary.h"
#include "OscUtils.h"
#include "Osc.h"
#include "Runner.h"
#include "MidiMap.h"
#include "PWMOsc.h"
#include "RandOsc.h"
#include "Midi.h"
#include "VelOsc.h"
#include "Switcher.h"
#include "ShiftRegister.h"
#include "constants.h"
#include "ShiftSwitcher.h"
#include "FloppyOsc.h"
#include "LimitMotorOsc.h"
#include "LimitStepOsc.h"
#include "ControlMotorOsc.h"
#include "ControlStepOsc.h"
#include "Flapper.h"
#include "DrawerOsc.h"



void addLeds123() {
	addShiftSwitcher(midimap(CHANNEL_1), LED1);
	addShiftSwitcher(midimap(CHANNEL_1), LED2);
	addShiftSwitcher(midimap(CHANNEL_1), LED3);
	addShiftSwitcher(midimap(CHANNEL_2), LED4);
	addShiftSwitcher(midimap(CHANNEL_2), LED5);
	addShiftSwitcher(midimap(CHANNEL_3), LED6);
	addShiftSwitcher(midimap(CHANNEL_3), LED7);
	addShiftSwitcher(midimap(CHANNEL_3), LED8);
}

void addFets(int midiChannel) {
	addOsc(midimap(midiChannel), FET1);
	addOsc(midimap(midiChannel), FET2);
	addOsc(midimap(midiChannel), FET3);
	addOsc(midimap(midiChannel), FET4);
}
void setup()
{
    initRunner();
	//EEPROM.write(0, 45);//, <#uint8_t#>)
	int id = EEPROM.read(0);
    
    switch (id)
    {   
        //////////////////////////////////////////
        // PORT 1
        // oki 3410 group 1
        case 1:
        case 46:
        case 4:
        case 5:
        case 6:
        case 40:
            // heads
            addLimitMotorOsc(midimap(CHANNEL_1), DIR1, STEP1, EN1, LIMIT1, FET1);
            // pins
            addOsc(midimap(CHANNEL_2), FET2);
            // form feed
            addControlStepOsc(midimap(CHANNEL_3), DIR2, STEP2, EN2);
			
            addLeds123();
            break;
		
			

        case 59://case 2:
            // heads
            addLimitMotorOsc(midimap(CHANNEL_1), DIR1, STEP1, EN1, LIMIT1, FET3);
            // pins
            addOsc(midimap(CHANNEL_2), FET2);
            // form feed
            addControlStepOsc(midimap(CHANNEL_3), DIR2, STEP2, EN2);
            
            addLeds123();
            break;
            
        //////////////////////////////////////////
        // PORT 2
        // oki 3410 group 2
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
            // heads
            addLimitMotorOsc(midimap(CHANNEL_1), DIR1, STEP1, EN1, LIMIT1, FET1);
            // pins
            addOsc(midimap(CHANNEL_2), FET2);
            // form feed
            addControlStepOsc(midimap(CHANNEL_3), DIR2, STEP2, EN2);
            
            addLeds123();
            break;
        
        //////////////////////////////////////////
        // PORT 3
        // manisman tallys
        case 13:
            // heads
            addControlStepOsc(midimap(CHANNEL_1), DIR1, STEP1, EN1);
            addControlStepOsc(midimap(CHANNEL_1), DIR2, STEP2, EN2);
            
            // form feeds
            addControlStepOsc(midimap(CHANNEL_2), DIR3, STEP3, EN3);
            addControlStepOsc(midimap(CHANNEL_2), DIR4, STEP4, EN4);
            break;
        
        // design jets
        case 14:
        case 15:
            // head
            addLimitMotorOsc(midimap(CHANNEL_3), DIR1, STEP1, EN1, LIMIT1, FET1);
            // form feed
            addControlMotorOsc(midimap(CHANNEL_4), FET2, FET3);
            break;
            
        // dpx group 1
        case 16:
        case 17:
            // solenoid
            addSwitcher(midimap(CHANNEL_5), FET1);
            // head
            addLimitMotorOsc(midimap(CHANNEL_6), DIR3, STEP3, EN3, LIMIT1, FET2);
            // ff
            addControlStepOsc(midimap(CHANNEL_7), DIR2, STEP2, EN2);
            // leds - 12v
            addSwitcher(midimap(CHANNEL_6), FET3);
            break;
            
        // dpx group 2
        case 18:
        case 19:
            // solenoid
            addSwitcher(midimap(CHANNEL_8), FET1);
            // head
            addLimitMotorOsc(midimap(CHANNEL_9), DIR1, STEP1, EN1, LIMIT1, FET2);
            // ff
            addControlStepOsc(midimap(CHANNEL_10), DIR2, STEP2, EN2);
            // leds - 12v
            addSwitcher(midimap(CHANNEL_9), FET3);
            break;break;
            
        // faxes
        case 20:
            addFlapper(midimap(CHANNEL_11, mC3, mCx3), FET1, FET2);
            addFlapper(midimap(CHANNEL_11, mD3, mDx3), FET3, FET4);
            break;
        
        case 21:
            addFlapper(midimap(CHANNEL_11, mF3, mFx3), FET1, FET2);
            addFlapper(midimap(CHANNEL_11, mG3, mGx3), FET3, FET4);
            break;
            
   //     case 22:
     //       addFlapper(midimap(CHANNEL_11, mG3), FET1, FET2);
       //     break;
            
        //////////////////////////////////////////
        // PORT 4
        // digital senders
        case 23:
            addFlapper(midimap(CHANNEL_1), FET1, FET2);
            addFlapper(midimap(CHANNEL_1), FET3, FET4);
            break;
        
        // brother lasers
        case 24:
        case 25:
        case 26:
            // clicker
            addSwitcher(midimap(CHANNEL_5), FET1);
            // flap
            addShiftSwitcher(midimap(CHANNEL_5), LED1);
            addShiftSwitcher(midimap(CHANNEL_5), LED2);
            addShiftSwitcher(midimap(CHANNEL_5), LED3);
            break;
        
			
        // HDDs
        case 27:
			addFets(CHANNEL_2);
			
            
            break;
            
        case 28:
            addFets(CHANNEL_3);
           
            break;
            
        case 29:
            addFets(CHANNEL_4);
            break;
            
        //////////////////////////////////////////
        // PORT 5
        // ibm big box
        case 30:
            // form feed
            addControlStepOsc(midimap(CHANNEL_1), DIR1, STEP1, EN1);
            // belt
            addSwitcher(midimap(CHANNEL_2), FET1);
            // leds
            addShiftSwitcher(midimap(CHANNEL_1), LED1);
            addShiftSwitcher(midimap(CHANNEL_1), LED2);
            addShiftSwitcher(midimap(CHANNEL_2), LED3);
            addShiftSwitcher(midimap(CHANNEL_2), LED4);
            break;
        
        // photocopier 1
        case 31:
            // drawers
            addDrawerOsc(midimap(CHANNEL_4), DIR1, STEP1, EN1, LIMIT1);
            addDrawerOsc(midimap(CHANNEL_5), DIR2, STEP2, EN2, LIMIT2);
            addDrawerOsc(midimap(CHANNEL_6), DIR3, STEP3, EN3, ANA1);
            addDrawerOsc(midimap(CHANNEL_7), DIR4, STEP4, EN4, ANA2);
            break;
        case 32:
            // head
            addLimitStepOsc(midimap(CHANNEL_3), DIR1, STEP1, EN1, LIMIT1);
            // light
            addSwitcher(midimap(CHANNEL_3), FET1);
            // lid
            addFlapper(midimap(CHANNEL_8), FET2, FET3);
            break;
        
        // photocopier 2
        case 33:
            // drawers
            addDrawerOsc(midimap(CHANNEL_10), DIR1, STEP1, EN1, LIMIT1);
            addDrawerOsc(midimap(CHANNEL_11), DIR2, STEP2, EN2, LIMIT2);
            addDrawerOsc(midimap(CHANNEL_12), DIR3, STEP3, EN3, ANA1);
            addDrawerOsc(midimap(CHANNEL_13), DIR4, STEP4, EN4, ANA2);
            break;
        case 34:
            // head
            addLimitStepOsc(midimap(CHANNEL_9), DIR1, STEP1, EN1, LIMIT1);
            // light
            addSwitcher(midimap(CHANNEL_9), FET1);
            // lid
            addFlapper(midimap(CHANNEL_14), FET2, FET3);
            break;
            
            
        //////////////////////////////////////////
        // PORT 6
        // photocopier 3
        case 35:
            // drawers
            addDrawerOsc(midimap(CHANNEL_2), DIR1, STEP1, EN1, LIMIT1);
            addDrawerOsc(midimap(CHANNEL_3), DIR2, STEP2, EN2, LIMIT2);
            addDrawerOsc(midimap(CHANNEL_4), DIR3, STEP3, EN3, ANA1);
            addDrawerOsc(midimap(CHANNEL_5), DIR4, STEP4, EN4, ANA2);
            break;
        case 36:
            // head
            addLimitStepOsc(midimap(CHANNEL_1), DIR1, STEP1, EN1, LIMIT1);
            // light
            addSwitcher(midimap(CHANNEL_1), FET1);
            // lid
            addFlapper(midimap(CHANNEL_6), FET2, FET3);
            break;
            
        // photocopier 4
        case 37:
            // drawers
            addDrawerOsc(midimap(CHANNEL_8), DIR1, STEP1, EN1, LIMIT1);
            addDrawerOsc(midimap(CHANNEL_9), DIR2, STEP2, EN2, LIMIT2);
            addDrawerOsc(midimap(CHANNEL_10), DIR3, STEP3, EN3, ANA1);
            addDrawerOsc(midimap(CHANNEL_11), DIR4, STEP4, EN4, ANA2);
            break;
        case 38:
            // head
            addLimitStepOsc(midimap(CHANNEL_7), DIR1, STEP1, EN1, LIMIT1);
            // light
            addSwitcher(midimap(CHANNEL_7), FET1);
            // lid
            addFlapper(midimap(CHANNEL_12), FET2, FET3);
            break;
            
        //////////////////////////////////////////
        // PORT 7
        // i80 group 1
       /* case 39:
            //motor
            addLimitStepOsc(midimap(CHANNEL_1), DIR1, STEP1, EN1, LIMIT1);
            // light
            addSwitcher(midimap(CHANNEL_1), FET1);
            break;
		*/
        // i80 group 2
        /*case 40:
            // motor
            addLimitStepOsc(midimap(CHANNEL_2), DIR1, STEP1, EN1, LIMIT1);
            // light
            addSwitcher(midimap(CHANNEL_2), FET1);
            break;
          */  
        // floppies
        case 60:
            addFloppyOsc(midimap(CHANNEL_3), FET3, FET4);
            break;
        case 43:
            addFloppyOsc(midimap(CHANNEL_4), FET3, FET4);
            break;
			case 42:
            addFloppyOsc(midimap(CHANNEL_5), FET3, FET4);
            break;
		case 41:
            addFloppyOsc(midimap(CHANNEL_6), FET3, FET4);
            break;
			
		case 58:
            addFloppyOsc(midimap(CHANNEL_7), FET3, FET4);
            break;
		case 45:
            addFloppyOsc(midimap(CHANNEL_8), FET3, FET4);
			addSwitcher(midimap(CHANNEL_8), 13);//, <#int pin#>)
            break;
			
			/*
        case 43:
            addFloppyOsc(midimap(CHANNEL_5), FET3, FET4);
            break;
        
        case 57:
            addFloppyOsc(midimap(CHANNEL_7), FET3, FET4);
            break;
        case 58:
            addFloppyOsc(midimap(CHANNEL_8), FET3, FET4);
            break;*/
            
        /*case 41:
            addFloppyOsc(midimap(CHANNEL_3), FET1, FET2);
            addFloppyOsc(midimap(CHANNEL_4), FET3, FET4);
            break;
        case 42:
            addFloppyOsc(midimap(CHANNEL_5), FET1, FET2);
            addFloppyOsc(midimap(CHANNEL_6), FET3, FET4);
            break;
        case 43:
            addFloppyOsc(midimap(CHANNEL_7), FET1, FET2);
            addFloppyOsc(midimap(CHANNEL_8), FET3, FET4);
            break;
        case 44:
            addFloppyOsc(midimap(CHANNEL_9), FET1, FET2);
            addFloppyOsc(midimap(CHANNEL_10), FET3, FET4);
            break;
        case 58:
            addFloppyOsc(midimap(CHANNEL_11), FET1, FET2);
            addFloppyOsc(midimap(CHANNEL_12), FET3, FET4);
            //addSwitcher(midimap(CHANNEL_11), 13);
            //addFloppyOsc(midimap(CHANNEL_12), FET3, FET4);
            break;*/
        /*case 60:
            addFloppyOsc(midimap(CHANNEL_13), FET1, FET2);
            addFloppyOsc(midimap(CHANNEL_14), FET3, FET4);
            break;*/
            
        //////////////////////////////////////////
        // PORT 8
        // modems
        case 56:
			

            addRandOsc(midimap(CHANNEL_6), FET1);
			addRandOsc(midimap(CHANNEL_7), FET2);
			addSwitcher(midimap(CHANNEL_6), FET3);
			addSwitcher(midimap(CHANNEL_7), FET4);
			
            break;
        case 39:
            addRandOsc(midimap(CHANNEL_5), FET1);
			addRandOsc(midimap(CHANNEL_5), FET2);
			addSwitcher(midimap(CHANNEL_5), FET3);
			addSwitcher(midimap(CHANNEL_5), FET4);
            break;
        // hero modems
        case 22:
            addShiftSwitcher(midimap(CHANNEL_12, mC2, mD2), LED1);
            addShiftSwitcher(midimap(CHANNEL_12, mE2, mFx2), LED2);
            addShiftSwitcher(midimap(CHANNEL_12, mG2, mA2), LED3);
            addShiftSwitcher(midimap(CHANNEL_12, mAx2, mB2), LED4);
            addShiftSwitcher(midimap(CHANNEL_12, mAx2, mB2), LED5);
            addShiftSwitcher(midimap(CHANNEL_12, mG2, mA2), LED6);
            addShiftSwitcher(midimap(CHANNEL_12, mE2, mFx2), LED7);
            addShiftSwitcher(midimap(CHANNEL_12, mC2, mD2), LED8);
            break;
            
		
        case 48:
        case 49:
            addLimitStepOsc(midimap(CHANNEL_1), DIR1, STEP1, EN1, LIMIT1);
            addLimitStepOsc(midimap(CHANNEL_1), DIR2, STEP2, EN2, LIMIT2);
            addSwitcher(midimap(CHANNEL_1), FET1);
            addSwitcher(midimap(CHANNEL_1), FET2);
            break;
        case 50:
        case 51:
            addLimitStepOsc(midimap(CHANNEL_2), DIR1, STEP1, EN1, LIMIT1);
            addLimitStepOsc(midimap(CHANNEL_2), DIR2, STEP2, EN2, LIMIT2);
            addSwitcher(midimap(CHANNEL_2), FET1);
            addSwitcher(midimap(CHANNEL_2), FET2);
            break;
           
		// receipt printers
        case 52:
        case 53:
        case 54:
        case 61://case 55:
            addLimitStepOsc(midimap(CHANNEL_3), DIR1, STEP1, EN1, LIMIT1);
            addLimitStepOsc(midimap(CHANNEL_4), DIR2, STEP2, EN2, LIMIT2);
			addShiftSwitcher(midimap(CHANNEL_3), LED1);
			addShiftSwitcher(midimap(CHANNEL_4), LED2);
            break;
           
        /////////////////////////////////////////////////////////////////////////////////
        // test board
        case 62:
            addFlapper(midimap(CHANNEL_1), FET4, FET3);
            break;
			
		//case 60:
		//	addFloppyOsc(midimap(CHANNEL_1), FET3, FET4);
		//	break;
            
 
    }
}

void loop()
{
	runRunner();

	
}
