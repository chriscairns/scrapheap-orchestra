#define FET1 5
#define FET2 6
#define FET3 9
#define FET4 10

int midiByte0 = -1;
int midiByte1  = -1;
int midiByte2  = -1;

#define HI_NIBBLE(b) (((b)>>4) & 0x0F)
#define LO_NIBBLE(b) ((b) & 0x0F)

#define NOTE_ON_STATUS  B1001
#define NOTE_OFF_STATUS B1000
#define CC_STATUS       B1011
#define PITCHBEND_STATUS B1110

#define MIDI_BAUD_RATE 31250

int led = 13;

void setup()
{                
  pinMode(led, OUTPUT);     
  
  Serial.begin(MIDI_BAUD_RATE);
}

void loop()
{
  updateMidi();  
}

void noteOn(int channel, int note, int vel)
{
  digitalWrite(led, HIGH);
}

void noteOff(int channel, int note)
{
  digitalWrite(led, LOW);
}

void updateMidi() {
  int b = Serial.read();
  if(b!=-1) {
   
    midiByte2 = midiByte1;
    midiByte1 = midiByte0;
    midiByte0 = b;
    
    
    // only work if we've got a status byte
    // of some sort
    if(!(midiByte2 & B10000000)) return;
    
    int st = HI_NIBBLE(midiByte2);
    int channel = LO_NIBBLE(midiByte2);
   
    // channel += 1; // we're doing this with defines
   
    // now check to see if we have a midi
    if(st==NOTE_ON_STATUS) {
      if(midiByte0==0) { // if the volume is zero, it's a note off
        noteOff(channel, midiByte1);
      } else {
        noteOn(channel, midiByte1, midiByte0);  
      }
    } else if(st==NOTE_OFF_STATUS) {
      noteOff(channel, midiByte1);
#ifdef USING_CC
    } else if(st==CC_STATUS) {
      cc(channel, midiByte1, midiByte0);
    } else if(st==PITCHBEND_STATUS) {
      cc(channel, -1, midiByte0);
#endif
    }
    
  }
}

