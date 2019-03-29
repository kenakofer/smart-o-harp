This site details an ongoing project to improve the chord selection mechanism on chromatic Autoharps/Chromaharps (hereafter called just "autoharps"). An arduino reads inputs from a keypad, computes the desired chord from the keypresses, and mechanically dampens the undesired strings. 

It does *not* strum or pluck for the human, nor does it change chords without human input.

See [Motivations](#motivation) for why this project is useful.

See [Project Details](#project-details) for an outline of project considerations in more depth.

### Motivation
#### Autoharps are limited in number/variety of chords

Most autoharps have between 12 and 21 chord bars, with the ability to play in only some of the 12 musical keys. The chords available are usually major chords, minor chords, major-minor 7 chords, and sometimes a diminished chord.

Thinking just about these 4 types of chords, the maximal manual autoharp can play 21 of them, out of the `12*4=48` possible.

Stepping out of the chord bar paradigm can allow more flexibility.

#### Ergonomics of chord layouts can only go so far, and are not always key agnostic

The best layout I've found with 21 bars is to have each column be of the form (from farthest reach with the left hard to closest): `(Am, C, A7)`. Successive columns just walk this around the circle of fifths. This makes playing most major and minor songs in 5 key signatures ergonomic and *key agnostic* (transposing a song is as simple as shifting your chording hand over). Still, one of several flaws with this layout: When one wants the major/minor version of the minor/major chord, it's a wide reach that may go off the harp.

Stepping out of the 1 button = 1 chord paradigm can allow more flexibility.

#### Playing autoharps for long periods can cause cramping, arthritis, or other joint pain in the chording hand.

Depending on how well tuned the harp is and how the hand is positioned, this may be more or less of an issue. I don't play for more than an hour at a time, due to cramping.

Stepping out of the finger-force dampening paradigm...

### Project Details

#### Dampening mechanism

#### Keypad logic

#### Arduino setup
