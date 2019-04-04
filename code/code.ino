int current_key = 0; // The key the instrument is currently in, with C being 0

void change_key_by(int half_steps) {
    current_key = current_key + half_steps % 12;
}

// Just the basic chords. Modifiers, including minor should all be applied as functions
// -1 indicates no note
/*const Chord triad_list[] = {
    {"IV", {5, 9, 0, -1}},
    {"I", {0, 4, 7, -1}},
    {"V", {7, 11, 2, -1}},
    {"II", {2, 6, 9, -1}},
    {"VI", {9, 1, 4, -1}},
    {"III", {4, 8, 11, -1}},
    {"VII", {11, 3, 6, -1}},
};*/

/* Key agnostic chord */
/*typedef struct {
    String name;
    int scale_degrees[];
} Chord */

const int IV[] = {5, 9, 0, -1};
const int I[] = {0, 4, 7, -1};
const int V[] = {7, 11, 2, -1};
const int II[] = {2, 6, 9, -1};
const int VI[] = {9, 1, 4, -1};
const int III[] = {4, 8, 11, -1};
const int VII[] = {11, 3, 6, -1};
int current_chord[] = {-1, -1, -1, -1};

// Copy the specified triad into the current_chord
void set_current_chord(int triad[]) {
    current_chord[0] = (triad[0] + current_key) % 12;
    current_chord[1] = (triad[1] + current_key) % 12;
    current_chord[2] = (triad[2] + current_key) % 12;
}

// All the modifiers, change the chord in place
void make_sus2(int chord[]) {
    chord[1] = (chord[0] + 2) % 12;
    //chord.name = String(chord.name + "_sus2")
}
void make_minor(int chord[]) {
    chord[1] = (chord[0] + 3) % 12;
    //chord.name = String(chord.name + "_min")
}
void make_major(int chord[]) {
    chord[1] = (chord[0] + 4) % 12;
    //chord.name = String(chord.name + "_maj")
}
void make_sus4(int chord[]) {
    chord[1] = (chord[0] + 5) % 12;
    //chord.name = String(chord.name + "_sus4")
}
void make_dim(int chord[]) {
    chord[1] = (chord[0] + 3) % 12;
    chord[2] = (chord[0] + 6) % 12;
    //chord.name = String(chord.name + "_dim")
}
void make_aug(int chord[]) {
    chord[1] = (chord[0] + 4) % 12;
    chord[2] = (chord[0] + 8) % 12;
    //chord.name = String(chord.name + "_aug")
}
void add_dim7(int chord[]) {
    chord[3] = (chord[0] + 9) % 12;
    //chord.name = String(chord.name + "_dim7")
}
void add_min7(int chord[]) {
    chord[3] = (chord[0] + 10) % 12;
    //chord.name = String(chord.name + "_min7")
}
void add_maj7(int chord[]) {
    chord[3] = (chord[0] + 11) % 12;
    //chord.name = String(chord.name + "_maj7")
}

const int col_pin_count = 3;
const int col_pin_numbers[] = { 0, 2, 3 };
int col_pin_states[]   = { -1, -1, -1 };

const int row_pin_count = 4;
const int row_pin_numbers[] = { 4, 5, 6, 7 };
int row_pin_states[]   = { -1, -1, -1, -1 };

void update_pin_states() {
    // Save all the pin states
    for (int i=0; i< col_pin_count; i++) {
        col_pin_states[i] = digitalRead(col_pin_numbers[i]);
    }
    for (int i=0; i< row_pin_count; i++) {
        row_pin_states[i] = digitalRead(row_pin_numbers[i]);
    }
}

bool is_pressed(int col, int row) {
  return row_pin_states[row] == LOW && col_pin_states[col] == LOW;
}

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
    
    Serial.println("Finished with setup()");
}

void loop() {

    delay(500);

    Serial.println("Running loop...");

    update_pin_states();

    // Debug print the buttons pushed
    for (int r=0; r<row_pin_count; r++) {
        for (int c=0; c<col_pin_count; c++) {
            if (is_pressed(c,r)) {
                Serial.print("1");
            } else {
                Serial.print("0");
            }
        }
        Serial.println();
    }
    Serial.println();
}
