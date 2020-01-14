int current_key = 0; // The key the instrument starts in, with C being 0
const int TICK_DURATION = 5; //How long (ms) between runs of the loop
//const int TICK_DURATION = 500; //How long (ms) between runs of the loop

const int CHORD_LENGTH = 5;
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
const char *notes[] = {"C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"};

const int FULL_POWER = 0;
const int NO_POWER = 255;
const int LOW_POWER = 200;

const int PWM_POWER_PIN = 10; // Available PWM pins (uno and nano): 3, 5, 6, 9, 10, 11
const int LATCH_PIN = 13;  //Pin connected to latch pin (ST_CP) of 74HC595
const int CLOCK_PIN = 12; //Pin connected to clock pin (SH_CP) of 74HC595
const int DATA_PIN = 11; //Pin connected to Data in (DS) of 74HC595

const int TICKS_AT_FULL_POWER = 100;
const int TICKS_BETWEEN_KEY_CHANGES = 2; // Ticks over which a key change combo must NOT be pressed before another key change is allowed

int tick_counter = 0;  // Counts up with each loop();
int last_chord_change_tick = 0; // The tick at which the last chord change happened.
int last_key_change_tick = 0; // The tick at which the last key change happened.

int current_chord[] = {-1, -1, -1, -1, -1};
int prev_chord[] = {-1, -1, -1, -1, -1};

bool just_changed_key = false; // Switches to allow keychange to only happen on new keypresses

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

void change_key_to(int note) {
    current_key = note % 12;
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
          bitsToSend += 1<<current_chord[i];
          Serial.print("Adding ");
          Serial.println(1<<current_chord[i]);
        }
    }
    if (bitsToSend == 0){
      Serial.println("Will not actuate: Chord is NONE");
      return;
    }
    for (int n=0; n<CHORD_LENGTH; n++) {
      Serial.print(current_chord[n]);
      Serial.print(" ");
    }
    Serial.println();

    byte A = bitsToSend & 0x00ff;
    byte B = (bitsToSend & 0xff00) >> 8;

    Serial.print("Actuating chord with bytes: ");
    Serial.println(A);
    Serial.println(B);

    // Start the shift register listening
    digitalWrite(LATCH_PIN, LOW);
    // shift the bytes out, A to the first, B to the second:
    shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, A);
    shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, B);
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

const int COL_PIN_COUNT = 4;
const int COL_PIN_NUMBERS[] = { 9, 8, 7, 6 };


const int ROW_PIN_COUNT = 4;
const int ROW_PIN_NUMBERS[] = { 5, 4, 3, 2 };

int pin_states[COL_PIN_COUNT][ROW_PIN_COUNT];

bool set_solenoid_power(const int amount) {
  setPwmFrequency(PWM_POWER_PIN, 1);
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
    return pin_states[col][row];
}

void setup() {
    delay(100);
    Serial.begin(9600);
    Serial.println("Setting up pins...");
    for (int i=0; i< COL_PIN_COUNT; i++) {
        pinMode(COL_PIN_NUMBERS[i], OUTPUT);
    }
    for (int i=0; i< ROW_PIN_COUNT; i++) {
        pinMode(ROW_PIN_NUMBERS[i], INPUT_PULLUP);
    }

    pinMode(LATCH_PIN, OUTPUT);
    pinMode(DATA_PIN, OUTPUT);
    pinMode(CLOCK_PIN, OUTPUT);

    set_solenoid_power(FULL_POWER);

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
    // row3: Make Do    Sus2        Sus4        Maj/Min
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
    // Single press with double modifier (diagonal combo):
    //
    //       col1       col2        col3        col4
    // row1: VIIb       IV          I           V
    // row2: ii         vi          iii         vii°
    // row3:                        Dom9
    // row4:                                    (Dom9)
    //
    // Double modifier as actuator (horizontal):
    //
    //       col1       col2        col3        col4
    // row1:
    // row2:
    // row3:                        VIb         (<<<)
    // row4:                        IIIb        (<<<)

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
        } else if (is_pressed(1,2) && is_pressed(0,3)) {
            make_major(current_chord);
            add_min7(current_chord);
            add_maj9(current_chord);
        } else if (is_pressed(0,2)) {
            swap_major_minor(current_chord);
        } else if (is_pressed(1,2)) {
            make_sus4(current_chord);
        } else if (is_pressed(2,2)) {
            make_sus2(current_chord);
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
                change_key_to(current_chord[0]); // Change key to the current chord's root
            }
            last_key_change_tick = tick_counter;
            set_current_chord(prev_chord); // Use of the change key button means no change in chord
        }
    }

    if (is_same_chord(current_chord, prev_chord)) {
      if (tick_counter - last_chord_change_tick > TICKS_AT_FULL_POWER) {
        set_solenoid_power(LOW_POWER);
      }
    } else {
        last_chord_change_tick = tick_counter;
        set_solenoid_power(FULL_POWER);
        Serial.print(tick_counter);
        Serial.print(" ");
        for (int n=0; n<4; n++) {
            if (current_chord[n] >= 0) {
                Serial.print(notes[current_chord[n]]);
                Serial.print(" ");
            }
        }
        Serial.println();

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
