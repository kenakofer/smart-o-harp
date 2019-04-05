////////////////////////////////////////////
// CONFIGURATION CONSTANTS

int current_key = 0;            // The key the instrument starts in, with C being 0
const int tick_duration = 5;    // How long (ms) between runs of the loop
const int buffer_length = 10;   // How many ticks the buffer_chord must remain unchanged before it copies into current_chord

const int col_pin_count = 3;                // How many column pins there are
const int col_pin_numbers[] = { 0, 2, 3 };  // Arduino pin numbers for the column pins

const int row_pin_count = 4;                  // How many row pins there are
const int row_pin_numbers[] = { 4, 5, 6, 7 }; // Arduino pin numbers for the row pins

// Key agnostic, chromatic descriptions of major chords on different scale degrees
// They are used as templates to start building the chords. -1 means no note.
const int NONE[] = {-1, -1, -1, -1};
const int IV[] = {5, 9, 0, -1};
const int I[] = {0, 4, 7, -1};
const int V[] = {7, 11, 2, -1};
const int II[] = {2, 6, 9, -1};
const int VI[] = {9, 1, 4, -1};
const int III[] = {4, 8, 11, -1};
const int VII[] = {11, 3, 6, -1};
const int VIIb[] = {10, 2, 5, -1};
const int VIb[] = {8, 0, 3, -1};

const int latchPin = 8;  //Pin connected to latch pin (ST_CP) of 74HC595
const int clockPin = 12; //Pin connected to clock pin (SH_CP) of 74HC595
const int dataPin = 11; //Pin connected to Data in (DS) of 74HC595

// Note names. These should only be used in debugging output.
const char *notes[] = {"C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"};

//
////////////////////////////////////////////
// GLOBAL STATE VARIABLES

int tick_counter = 0;  // Counts up with each loop();

int col_pin_states[]   = { -1, -1, -1 };     // Length of this must agree with col_pin_count
int row_pin_states[]   = { -1, -1, -1, -1 }; // Length of this must agree with row_pin_count

int current_chord[] = {-1, -1, -1, -1};
int prev_chord[] = {-1, -1, -1, -1};
int buffer_chord[] = {-1, -1, -1, -1};
int prev_buffer_chord[] = {-1, -1, -1, -1};

bool just_changed_key = false; // Switches to allow keychange to only happen on new keypresses
int buffer_counter = 0; // Counts up to bufferlength before copying buffer chord to current chord

//
////////////////////////////////////////////
// UTILITY FUNCTIONS

// Hardware utility functions

bool is_pressed(int col, int row) {
    return row_pin_states[row] == LOW && col_pin_states[col] == LOW;
}

int get_col_state(int col) {
    int sum = 0;
    for (int r=0; r<row_pin_count; r++) {
        if (is_pressed(col,r)) {
            int power = row_pin_count - r - 1;
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

// Music utility functions

bool is_same_chord(int chord1[], int chord2[]) {
    for (int i=0; i<4; i++) {
        if (chord1[i] != chord2[i]) {
            return false;
        }
    }
    return true;
}

int mod_key(int amount) {
    current_key = (current_key + amount) % 12;
    return current_key;
}

void update_current_chord() {
    for (int i=0; i<4; i++) {
        current_chord[i] = buffer_chord[i];
    }
}

void update_prev_chord() {
    for (int i=0; i<4; i++) {
        prev_chord[i] = current_chord[i];
    }
}

void update_prev_buffer_chord() {
    for (int i=0; i<4; i++) {
        prev_buffer_chord[i] = buffer_chord[i];
    }
}

void actuate_current_chord() {
    // Get the byte representation of the chord's notes
    int bitsToSend = 0;
    for (int i=0; i<4; i++) {
        if (current_chord[i] >= 0) {
          bitsToSend += 1<<current_chord[i];
          Serial.print("Adding ");
          Serial.println(1<<current_chord[i]);
        }
    }
    if (bitsToSend == 0){
      Serial.println("Will not actuate: Chord is NONE");
    }
    for (int n=0; n<4; n++) {
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
    digitalWrite(latchPin, LOW);
    // shift the bytes out, A to the first, B to the second:
    shiftOut(dataPin, clockPin, MSBFIRST, A);
    shiftOut(dataPin, clockPin, MSBFIRST, B);
    // Stop listening, turn on the outputs
    digitalWrite(latchPin, HIGH);
}

// Copy the specified triad into the buffer_chord
void set_buffer_chord(int triad[]) {
    for (int i=0; i<4; i++) {
        // Only change the fourth note by key if it's a played note
        if (triad[i] >= 0) {
            buffer_chord[i] = (triad[i] + current_key) % 12;
        } else {
            buffer_chord[i] = triad[i];
        }
    }
}

// All these modifiers change the chord in place
void make_sus2(int chord[]) {
    chord[1] = (chord[0] + 2) % 12;
}
void make_minor(int chord[]) {
    chord[1] = (chord[0] + 3) % 12;
}
void make_major(int chord[]) {
    chord[1] = (chord[0] + 4) % 12;
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

void update_pin_states() {
    // Save all the pin states so we only need to read them once each loop()
    for (int i=0; i< col_pin_count; i++) {
        col_pin_states[i] = digitalRead(col_pin_numbers[i]);
    }
    for (int i=0; i< row_pin_count; i++) {
        row_pin_states[i] = digitalRead(row_pin_numbers[i]);
    }
}

////////////////////////////////////////
// SETUP AND LOOP

void setup() {
    delay(100);
    Serial.begin(9600);
    Serial.println("Setting up pins...");
    for (int i=0; i< col_pin_count; i++) {
        pinMode(col_pin_numbers[i], INPUT_PULLUP);
    }
    for (int i=0; i< row_pin_count; i++) {
        pinMode(row_pin_numbers[i], INPUT_PULLUP);
    }

    pinMode(latchPin, OUTPUT);
    pinMode(dataPin, OUTPUT);  
    pinMode(clockPin, OUTPUT);

    Serial.println("Finished with setup()");
}

void loop() {

    delay(tick_duration);
    tick_counter += 1;

    update_pin_states();

    // We reset the buffer_chord to be rebuilt in every loop based on pin inputs.
    // The current_chord, on the other hand, remains constant between loops.
    set_buffer_chord(NONE);

    //////////////////////////////////////////////////////////////////////////////////
    // EXHAUSTIVE CHORD LAYOUT LOGIC (More like "exhausting", amirite?)
    // Change it to suit your needs.
    //
    // Layout (yes its rows and columns are switched, but it's consistent with the code):
    //
    //       row1                  row2                    row3                  row4
    // col3: VIIb (vii°) (vii°7)   IV (IV7) (IVmaj7)       I (I7) (Imaj7)        V (V7) (Vmaj7)
    // col2: v (iv) (i)            ii (II7) (ii7)          vi (VI7) (vi7)        iii (III7) (iii7)
    // col1: mod4                  VIb                     mod5                  +sus4

    // using int for convenience, could just as well be an array of bools or something.
    int c1 = get_col_state(0);
    int c2 = get_col_state(1);
    int c3 = get_col_state(2);

    // Catch ambiguity (presume only the highest column, lowest row in the c1, c2, c3 variables)
    // Though these tests will be true when buttons in a row are pressed, the c states should not change in that case.
    if (c1 && c2) {
        c1 = only_keep_rightmost_bit(c1);
        c2 = only_keep_leftmost_bit(c2);
    } else if (c1 && c3) {
        c1 = only_keep_rightmost_bit(c1);
        c3 = only_keep_leftmost_bit(c3);
    } else if (c2 && c3) {
        c2 = only_keep_rightmost_bit(c2);
        c3 = only_keep_leftmost_bit(c3);
    }

    // Starting with the col3 major chords
    if (c3 == 1) {        // 0001: V chord
        set_buffer_chord(V);
    } else if (c3 == 2) { // 0010: I chord
        set_buffer_chord(I);
    } else if (c3 == 3) { // 0011: V7 chord
        set_buffer_chord(V);
        add_min7(buffer_chord);
    } else if (c3 == 4) { // 0100: IV chord
        set_buffer_chord(IV);
    } else if (c3 == 5) { // 0101: undefined

    } else if (c3 == 6) { // 0110: I7 chord
        set_buffer_chord(I);
        add_min7(buffer_chord);
    } else if (c3 == 7) { // 0111: Vmaj7 chord
        set_buffer_chord(V);
        add_maj7(buffer_chord);
    } else if (c3 == 8) { // 1000: VIIb chord
        set_buffer_chord(VIIb);
    } else if (c3 == 9) { // 1001: vii° chord
        set_buffer_chord(VII);
        make_dim(buffer_chord);
    } else if (c3 == 10) { // 1010: undefined

    } else if (c3 == 11) { // 1011: vii°7 chord (fully diminished)
        set_buffer_chord(VII);
        make_dim(buffer_chord);
        add_dim7(buffer_chord);
    } else if (c3 == 12) { // 1100: IV7 chord
        set_buffer_chord(IV);
        add_min7(buffer_chord);
    } else if (c3 == 13) { // 1101: IVmaj7 chord
        set_buffer_chord(IV);
        add_maj7(buffer_chord);
    } else if (c3 == 14) { // 1110: Imaj7 chord
        set_buffer_chord(I);
        add_maj7(buffer_chord);
    } else if (c3 == 15) { // 1111: undefined

        // Col2 (minors):
    } else if (c2 == 1) { // 0001: iii chord
        set_buffer_chord(III);
        make_minor(buffer_chord);
    } else if (c2 == 2) { // 0010: vi chord
        set_buffer_chord(VI);
        make_minor(buffer_chord);
    } else if (c2 == 3) { // 0011: III7 chord
        set_buffer_chord(III);
        add_min7(buffer_chord);
    } else if (c2 == 4) { // 0100: ii chord
        set_buffer_chord(II);
        make_minor(buffer_chord);
    } else if (c2 == 5) { // 0101: undefined

    } else if (c2 == 6) { // 0110: VI7 chord
        set_buffer_chord(VI);
        add_min7(buffer_chord);
    } else if (c2 == 7) { // 0111: iii7 chord
        set_buffer_chord(III);
        make_minor(buffer_chord);
        add_min7(buffer_chord);
    } else if (c2 == 8) { // 1000: v chord
        set_buffer_chord(V);
        make_minor(buffer_chord);
    } else if (c2 == 9) { // 1001: iv chord
        set_buffer_chord(IV);
        make_minor(buffer_chord);
    } else if (c2 == 10) { // 1010: undefined

    } else if (c2 == 11) { // 1011: i chord
        set_buffer_chord(I);
        make_minor(buffer_chord);
    } else if (c2 == 12) { // 1100: II7 chord
        set_buffer_chord(II);
        add_min7(buffer_chord);
    } else if (c2 == 13) { // 1101: ii7 chord
        set_buffer_chord(II);
        make_minor(buffer_chord);
        add_min7(buffer_chord);
    } else if (c2 == 14) { // 1110: vi7 chord
        set_buffer_chord(VI);
        make_minor(buffer_chord);
        add_min7(buffer_chord);
    } else if (c2 == 15) { // 1111: undefined

        // col1: buttons that should be pressed on their own
        // note that 1<<3 means bin1000, which means checking the FIRST pin. Can be confusing...
    } else if (c1 & 1<<3) { // mod4: Change key up by a fourth (5 half steps)
        if (! just_changed_key) {
            mod_key(5);
            Serial.print("Changed key to ");
            Serial.println(notes[current_key]);
        }
        just_changed_key = true;
    } else if (c1 & 1<<2) { // VIb, because why not.
        set_buffer_chord(VIb);
    } else if (c1 & 1<<1) { // mod5: Change key up by a fifth (7 half steps)
        if (! just_changed_key) {
            mod_key(7);
            Serial.print("Changed key to ");
            Serial.println(notes[current_key]);
        }
        just_changed_key = true;
    }

    // Reset just_changed_key if neither mod button is being pressed.
    if (just_changed_key && (c1 & 1<<3) == 0 && (c1 & 1<<1) == 0) {
        just_changed_key = false;
    }

    // ...and the sus4 is REEEEEEAAAL special as the only one that gets to create ambiguity
    if (c1 & 1<<0) { // sus4
        make_sus4(buffer_chord);
    }

    // END CHORD LAYOUT LOGIC
    //////////////////

    // Buffer chord counter tracking: We want to know once the buffer_chord hasn't changed for a few iterations.
    if (is_same_chord(buffer_chord, prev_buffer_chord)) {
        // If they're the same, we just need to keep track of how long it's been
        buffer_counter += 1;
    } else {
        // Otherwise, reset the counter to 0 set prev_buffer_chord to buffer_chord
        buffer_counter = 0;
        update_prev_buffer_chord();
        Serial.print(tick_counter);
        Serial.print(" ");
        for (int n=0; n<4; n++) {
            if (buffer_chord[n] >= 0) {
                Serial.print(notes[buffer_chord[n]]);
                Serial.print(" ");
            }
        }
        Serial.println();
    }

    // Enact the chord (set current_chord = buffer_chord) iff we've 
    // reached the needed buffer_counter,
    // have more than NONE in the buffer_chord, and
    // buffer_chord is different from the current chord.
    if (buffer_counter == buffer_length 
            && ! is_same_chord(buffer_chord, NONE)
            && ! is_same_chord(buffer_chord, current_chord)
       ) {
        update_prev_chord();
        update_current_chord();
        // This line actually updates the latches to change the solenoids
        actuate_current_chord();
        Serial.println("Set current chord");
    }
}
