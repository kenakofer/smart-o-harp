const int TICK_DURATION = 5; //How long (ms) between runs of the loop

const char *notes[] = {"C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"};
const int CHORD_LENGTH = 5;

// -1 means no note. The other indices can be looked up in the notes[] array
// above, for each of these triads in the key of C. For example, a value of 2
// in the key of C would be D, but a value of 2 in the key of G would be A.
const int NONE[] = {-1, -1, -1, -1, -1};
const int IV[] = {5, 9, 0, -1, -1};
const int I[] = {0, 4, 7, -1, -1};
const int V[] = {7, 11, 2, -1, -1};
const int II[] = {2, 6, 9, -1, -1};
const int VI[] = {9, 1, 4, -1, -1};
const int III[] = {4, 8, 11, -1, -1};
const int VII[] = {11, 3, 6, -1, -1};
const int VIIb[] = {10, 2, 5, -1, -1};
const int VIb[] = {8, 0, 3, -1, -1};
const int IIIb[] = {3, 7, 10, -1, -1};

const int NOTE_SOLENOID_ORDER[] = {0, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1}; // From closest to arduino to farthest away, what semitone scale degree is on the pin. 0 is C, 1 is Db, etc. as seen in notes[]

const int FULL_POWER = 0; // The PWM_POWER_PIN => OE pin duty cycle to get full power to the active solenoids. This means grounding the OE pin, letting the shift regitsers operate full-time
const int MID_POWER = 200; // By only having the 8-bit registers active some of the time, we use less power. Less power is needed to hold the solenoids in place.
const int LOW_POWER = 235; // This is the lowest level of power that can maybe hold the solenoids. Only used in opening all strings.
const int NO_POWER = 255; // Keeping the OE pin high disables the 8 bit shift registers
const int TICKS_AT_FULL_POWER = 5; // How long before decreasing power after chord change.

const int PWM_POWER_PIN = 10; // Available PWM pins (uno and nano): 3, 5, 6, 9, 10, 11
const int LATCH_PIN = 13;  //Pin connected to latch pin (ST_CP) of 74HC595
const int CLOCK_PIN = 12; //Pin connected to clock pin (SH_CP) of 74HC595
const int DATA_PIN = 11; //Pin connected to Data in (DS) of 74HC595

const int TICKS_BETWEEN_KEY_CHANGES = 2; // Ticks over which a key change combo must NOT be pressed before another key change is allowed

const int COL_PIN_COUNT = 4;
const int COL_PIN_NUMBERS[] = { 9, 8, 7, 6 };

const int ROW_PIN_COUNT = 4;
const int ROW_PIN_NUMBERS[] = { 5, 4, 3, 2 };


int current_key = 0; // The key the instrument starts in, with C being 0

int current_power = FULL_POWER; // can go up and down incrementally between ticks
int tick_counter = 0;  // Counts up with each loop();
int last_chord_change_tick = 0; // The tick at which the last chord change happened.
int last_key_change_tick = 0; // The tick at which the last key change happened.
int current_chord[] = {-1, -1, -1, -1, -1}; // The chord actually actuated on the solenoids now or by the end of loop(). Starts as a nothing chord
int prev_chord[] = {-1, -1, -1, -1, -1}; // Last tick's current_chord. Used to tell if, in the current tick, we need to change the shift registers' states.

int pin_states[COL_PIN_COUNT][ROW_PIN_COUNT];


bool is_same_chord(const int chord1[], const int chord2[]) {
    for (int i=0; i<CHORD_LENGTH; i++) {
        if (chord1[i] != chord2[i]) {
            return false;
        }
    }
    return true;
}

bool is_minor(const int chord[]) {
    return (chord[1] == (chord[0] + 3) % 12);
}

bool is_major(const int chord[]) {
    return (chord[1] == (chord[0] + 4) % 12);
}

void update_prev_chord() {
    for (int i=0; i<CHORD_LENGTH; i++) {
        prev_chord[i] = current_chord[i];
    }
}

void actuate_current_chord() {
    // Get the byte representation of the chord's notes
    int bitsToSend = 0;
    for (int i=0; i<CHORD_LENGTH; i++) {
        if (current_chord[i] >= 0) {
          bitsToSend += 1<<NOTE_SOLENOID_ORDER[current_chord[i]];
          Serial.print("Adding ");
          Serial.println(1<<NOTE_SOLENOID_ORDER[current_chord[i]]);
        }
    }
    /*if (bitsToSend == 0){
      Serial.println("Will not actuate: Chord is NONE");
      return;
    }*/
    for (int n=0; n<CHORD_LENGTH; n++) {
      Serial.print(current_chord[n]);
      Serial.print(" ");
    }
    Serial.println();

    send_bits(bitsToSend);
}

void send_bits(const int bits) {
    byte A = bits & 0x00ff;
    byte B = (bits & 0xff00) >> 8;

    // Start the shift register listening
    digitalWrite(LATCH_PIN, LOW);
    // shift the bytes out, B to the first, A to the second:
    shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, B);
    shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, A);
    // Stop listening, turn on the outputs
    digitalWrite(LATCH_PIN, HIGH);
}

// Copy the specified triad into the current_chord
void set_current_chord_in_current_key(const int chord[]) {
    for (int i=0; i<CHORD_LENGTH; i++) {
        // Only change the note by key if it's a played note. Otherwise, it's
        // -1 and shouldn't be changed.
        if (chord[i] >= 0) {
            current_chord[i] = (chord[i] + current_key) % 12;
        } else {
            current_chord[i] = chord[i];
        }
    }
}

void set_current_chord(const int chord[]) {
    for (int i=0; i<CHORD_LENGTH; i++) {
            current_chord[i] = chord[i];
    }
}

// This function takes control for a (hopefully small) period of time. It doesn't really work, and should not be used in its current state.
void open_all_strings() {
    Serial.println("open_all_strings()");
    const int MICROSECOND_DELAY = 100;
    const int DELAYS_TO_RAISE = 400;
    const int LOW_POWER_INTERVAL = 8;
    const int ALL_BITS = (1<<13) - 1; // => 111 111 111 111 I think

    // Set to full power so communication goes correctly
    current_power = FULL_POWER;
    set_solenoid_power(current_power);

    // For each note needing to be opened
    for (int i=0; i<12; i++) {
        for (int count=0; count < DELAYS_TO_RAISE; count++) {
            // All pins get power this iteration
            if (count % LOW_POWER_INTERVAL == 0) {
                send_bits(ALL_BITS);
            } else {
                // Only the to-be-raised notes gets full power this time.
                send_bits(1<<i);
            }
            delayMicroseconds(MICROSECOND_DELAY);
        }
    }
    // Now all notes should be raised.
    // Leave all bits on, and LOW_POWER
    send_bits(ALL_BITS);
    current_power = LOW_POWER;
    set_solenoid_power(current_power);

    // Change both current chord and prev_chord to NONE so it isn't overwritten.
    set_current_chord(NONE);
    update_prev_chord();

    Serial.println("Finished open_all_strings()");
}

// All the modifiers change the chord in place
void make_sus2(int chord[]) {
    chord[1] = (chord[0] + 2) % 12;
}
void make_minor(int chord[]) {
    chord[1] = (chord[0] + 3) % 12;
}
void make_major(int chord[]) {
    chord[1] = (chord[0] + 4) % 12;
}
void swap_major_minor(int chord[]) {
    if (is_minor(chord)) {
        make_major(chord);
    } else {
        make_minor(chord);
    }
}
void make_sus4(int chord[]) {
    chord[1] = (chord[0] + 5) % 12;
}
void make_dim(int chord[]) {
    chord[1] = (chord[0] + 3) % 12;
    chord[2] = (chord[0] + 6) % 12;
}
void make_aug(int chord[]) {
    chord[1] = (chord[0] + 4) % 12;
    chord[2] = (chord[0] + 8) % 12;
}
void add_dim7(int chord[]) {
    chord[3] = (chord[0] + 9) % 12;
}
void add_min7(int chord[]) {
    chord[3] = (chord[0] + 10) % 12;
}
void add_maj7(int chord[]) {
    chord[3] = (chord[0] + 11) % 12;
}
void add_maj9(int chord[]) {
    chord[4] = (chord[0] + 14) % 12;
}

bool set_solenoid_power(const int amount) {
  analogWrite(PWM_POWER_PIN, amount);
}

void update_pin_states() {
    // Pins are low until we see them high
    for (int j=0; j< ROW_PIN_COUNT; j++) {
        for (int i=0; i< COL_PIN_COUNT; i++) {
          pin_states[i][j] = 0;
        }
    }

    // Save all the pin states
    for (int i=0; i< COL_PIN_COUNT; i++) {
        pinMode(COL_PIN_NUMBERS[i], OUTPUT);
        digitalWrite(COL_PIN_NUMBERS[i], LOW);
        for (int j=0; j< ROW_PIN_COUNT; j++) {
          if (digitalRead(ROW_PIN_NUMBERS[j]) == LOW) {
            pin_states[i][j] = 1;
          }
        }
        digitalWrite(COL_PIN_NUMBERS[i], HIGH);
        pinMode(COL_PIN_NUMBERS[i], INPUT);
    }
   /* Serial.println();
     // Print the pressed button array
    for (int j=0; j< ROW_PIN_COUNT; j++) {
        for (int i=0; i< COL_PIN_COUNT; i++) {
            Serial.print(is_pressed(i, j));
        }
        Serial.println();
    }
    Serial.println();*/
}

bool is_pressed(int row, int col) {
    return pin_states[row][3-col];
}

void setup() {
    delay(100);
    Serial.begin(9600);
    Serial.println("Setting up pins...");
    setPwmFrequency(PWM_POWER_PIN, 1);
    for (int i=0; i< COL_PIN_COUNT; i++) {
        pinMode(COL_PIN_NUMBERS[i], OUTPUT);
    }
    for (int i=0; i< ROW_PIN_COUNT; i++) {
        pinMode(ROW_PIN_NUMBERS[i], INPUT_PULLUP);
    }

    pinMode(LATCH_PIN, OUTPUT);
    pinMode(DATA_PIN, OUTPUT);
    pinMode(CLOCK_PIN, OUTPUT);

    set_solenoid_power(current_power);

    Serial.println("Finished with setup()");
}

int get_col_state(int col) {
    int sum = 0;
    for (int r=0; r<ROW_PIN_COUNT; r++) {
        if (is_pressed(col,r)) {
            int power = ROW_PIN_COUNT - r - 1;
            sum += 1<<power;
        }
    }
    return sum;
}

int only_keep_rightmost_bit(int num) {
    for (int i=0; i<=7; i--) {
        if (1<<i & num)
            return 1<<i;
    }
}

int only_keep_leftmost_bit(int num) {
    for (int i=7; i>=0; i--) {
        if (1<<i & num)
            return 1<<i;
    }
}

void loop() {
    delay(TICK_DURATION);
    tick_counter += 1;
    update_pin_states();

    // Exhaustive chord layout 16 button edition
    //
    // Single press with single modifier:
    //
    //       col1       col2        col3        col4
    // row1: VIIb       IV          I           V
    // row2: ii         vi          iii         vii°
    // row3: Make Do    Dom9        Sus4        Maj/Min
    // row4: mM7        MM7         mm7         Mm7
    //
    // Single press with double modifier (vertical combo):
    //
    //       col1       col2        col3        col4
    // row1: VIIb       IV          I           V
    // row2: ii         vi          iii         vii°
    // row3: Dim        Aug         Dim7        1/2 Dim 7
    // row4: (^^^)      (^^^)       (^^^)       (^^^)
    //
    // Single press with double modifier (diagonal combo) (None currently):
    //
    //       col1       col2        col3        col4
    // row1: VIIb       IV          I           V
    // row2: ii         vi          iii         vii°
    // row3:
    // row4:
    //
    // Double modifier as actuator (horizontal):
    //
    //       col1       col2        col3        col4
    // row1:
    // row2:
    // row3:                        VIb         (<<<)
    // row4: NONE       (<<<)       IIIb        (<<<)

    bool check_modifiers = false;

    if (is_pressed(0,0)) {
        set_current_chord_in_current_key(V);
        make_major(current_chord);
        check_modifiers = true;
    } else if (is_pressed(1,0)) {
        set_current_chord_in_current_key(I);
        make_major(current_chord);
        check_modifiers = true;
    } else if (is_pressed(2,0)) {
        set_current_chord_in_current_key(IV);
        make_major(current_chord);
        check_modifiers = true;
    } else if (is_pressed(3,0)) {
        set_current_chord_in_current_key(VIIb);
        make_major(current_chord);
        check_modifiers = true;
    } else if (is_pressed(0,1)) {
        set_current_chord_in_current_key(VII);
        make_dim(current_chord);
        check_modifiers = true;
    } else if (is_pressed(1,1)) {
        set_current_chord_in_current_key(III);
        make_minor(current_chord);
        check_modifiers = true;
    } else if (is_pressed(2,1)) {
        set_current_chord_in_current_key(VI);
        make_minor(current_chord);
        check_modifiers = true;
    } else if (is_pressed(3,1)) {
        set_current_chord_in_current_key(II);
        make_minor(current_chord);
        check_modifiers = true;
    } else if (is_pressed(0,2) && is_pressed(1,2)) {
        set_current_chord_in_current_key(VIb);
        make_major(current_chord);
    } else if (is_pressed(0,3) && is_pressed(1,3)) {
        set_current_chord_in_current_key(IIIb);
        make_major(current_chord);
    } else if (is_pressed(2,3) && is_pressed(3,3)) {
        set_current_chord(NONE);
    }


    if (check_modifiers) {
        if (is_pressed(0,2) && is_pressed(0,3)) {
            make_dim(current_chord);
            add_min7(current_chord);
        } else if (is_pressed(1,2) && is_pressed(1,3)) {
            make_dim(current_chord);
            add_dim7(current_chord);
        } else if (is_pressed(2,2) && is_pressed(2,3)) {
            make_aug(current_chord);
        } else if (is_pressed(3,2) && is_pressed(3,3)) {
            make_dim(current_chord);
        } else if (is_pressed(0,2)) {
            swap_major_minor(current_chord);
        } else if (is_pressed(1,2)) {
            make_sus4(current_chord);
        } else if (is_pressed(2,2)) {
            make_major(current_chord);
            add_min7(current_chord);
            add_maj9(current_chord);
        } else if (is_pressed(0,3)) {
            make_major(current_chord);
            add_min7(current_chord);
        } else if (is_pressed(1,3)) {
            make_minor(current_chord);
            add_min7(current_chord);
        } else if (is_pressed(2,3)) {
            make_major(current_chord);
            add_maj7(current_chord);
        } else if (is_pressed(3,3)) {
            make_minor(current_chord);
            add_maj7(current_chord);
        } else if (is_pressed(3,2)) {
            if (tick_counter - last_key_change_tick > TICKS_BETWEEN_KEY_CHANGES) {
                Serial.print("Changing key to: ");
                Serial.print(notes[current_chord[0]]);
                current_key = current_chord[0] % 12;
            }
            last_key_change_tick = tick_counter;
            set_current_chord(prev_chord); // Use of the change key button means no change in chord
        }
    }

    if (is_same_chord(current_chord, prev_chord)) {
      if (tick_counter - last_chord_change_tick > TICKS_AT_FULL_POWER) {
        if (current_power != MID_POWER && !is_same_chord(current_chord, NONE)) {
          Serial.println("Setting MID_POWER");
          current_power = MID_POWER;
          set_solenoid_power(current_power);
        }
      }
    } else {
        last_chord_change_tick = tick_counter;

        Serial.print(tick_counter);
        Serial.print(" ");
        for (int n=0; n<4; n++) {
            if (current_chord[n] >= 0) {
                Serial.print(notes[current_chord[n]]);
                Serial.print(" ");
            }
        }
        Serial.println();

        // It seems to be very important that we are set to full power (0 PWM
        // cycle) during the chord change. Otherwise, sometimes when we call
        // actuate_current_chord(), the 8 bit shift registers will get the
        // wrong data somehow.
        current_power = FULL_POWER;
        set_solenoid_power(current_power);

        actuate_current_chord();
        Serial.println("Set current chord");
        update_prev_chord();
    }
}

/**
 * Divides a given PWM pin frequency by a divisor.
 *
 * The resulting frequency is equal to the base frequency divided by
 * the given divisor:
 *   - Base frequencies:
 *      o The base frequency for pins 3, 9, 10, and 11 is 31250 Hz.
 *      o The base frequency for pins 5 and 6 is 62500 Hz.
 *   - Divisors:
 *      o The divisors available on pins 5, 6, 9 and 10 are: 1, 8, 64,
 *        256, and 1024.
 *      o The divisors available on pins 3 and 11 are: 1, 8, 32, 64,
 *        128, 256, and 1024.
 *
 * PWM frequencies are tied together in pairs of pins. If one in a
 * pair is changed, the other is also changed to match:
 *   - Pins 5 and 6 are paired on timer0
 *   - Pins 9 and 10 are paired on timer1
 *   - Pins 3 and 11 are paired on timer2
 *
 * Note that this function will have side effects on anything else
 * that uses timers:
 *   - Changes on pins 3, 5, 6, or 11 may cause the delay() and
 *     millis() functions to stop working. Other timing-related
 *     functions may also be affected.
 *   - Changes on pins 9 or 10 will cause the Servo library to function
 *     incorrectly.
 *
 * Thanks to macegr of the Arduino forums for his documentation of the
 * PWM frequency divisors. His post can be viewed at:
 *   https://forum.arduino.cc/index.php?topic=16612#msg121031
 */
void setPwmFrequency(int pin, int divisor) {
  byte mode;
  if(pin == 5 || pin == 6 || pin == 9 || pin == 10) {
    switch(divisor) {
      case 1: mode = 0x01; break;
      case 8: mode = 0x02; break;
      case 64: mode = 0x03; break;
      case 256: mode = 0x04; break;
      case 1024: mode = 0x05; break;
      default: return;
    }
    if(pin == 5 || pin == 6) {
      TCCR0B = TCCR0B & 0b11111000 | mode;
    } else {
      TCCR1B = TCCR1B & 0b11111000 | mode;
    }
  } else if(pin == 3 || pin == 11) {
    switch(divisor) {
      case 1: mode = 0x01; break;
      case 8: mode = 0x02; break;
      case 32: mode = 0x03; break;
      case 64: mode = 0x04; break;
      case 128: mode = 0x05; break;
      case 256: mode = 0x06; break;
      case 1024: mode = 0x07; break;
      default: return;
    }
    TCCR2B = TCCR2B & 0b11111000 | mode;
  }
}
