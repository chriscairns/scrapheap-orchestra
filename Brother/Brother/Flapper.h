
#include "MidiMap.h"

void addFlapper(MidiMap midiMap, int flapPin, int relayPin);

struct Flapper
{
    int flapPin;
    int relayPin;
    
    int relayOut;
    int flapOut;
    
    long counter;
};


// initializes an oscillator on a pin.
void initFlapper(Flapper *o, int flapPin, int relayPin);

// this starts a midi note playing
void playFlapper(Flapper *o, int note, int vel);

// this stops the sound outputting from an oscillator
void stopFlapper(Flapper *o);

// call this on every osc you want to play in your sound loop
void tickFlapper(Flapper *o);
