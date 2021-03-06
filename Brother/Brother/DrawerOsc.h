#pragma once

#include "MidiMap.h"

void addDrawerOsc(MidiMap midi, int dirPin, int stepPin, int enableShiftPin, int reversePin);

/////////////////////////////////////////////////////////////////////////
// You don't need to touch anything below this line



struct DrawerOsc
{
    unsigned int uPeriod;
    unsigned int halfPeriod;
    
    int dirPin;
    int stepPin;
    int reversePin;
    int enableShiftPin;
      
    int dir;
    int out;
    int checked;
    
    bool analog;
    
    unsigned long counter;
};


// initializes an oscillator on a pin.
void initDrawerOsc(DrawerOsc *o, int dirPin, int stepPin, int enableShiftPin, int reversePin);

// this starts a midi note playing
void playDrawerOsc(DrawerOsc *o, int note, int vel);

// this stops the sound outputting from an oscillator
void stopDrawerOsc(DrawerOsc *o);

// call this on every osc you want to play in your sound loop
void tickDrawerOsc(DrawerOsc *o);



