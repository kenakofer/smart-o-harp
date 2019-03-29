## Summary

This site details an ongoing project to improve the chord selection mechanism on chromatic Autoharps/Chromaharps (hereafter called just "autoharps"). An arduino reads inputs from a keypad, computes the desired chord from the keypresses, and mechanically dampens the undesired strings. 

It does **not** strum or pluck for the human, nor does it change chords without human input.

See [Motivations](#motivation) for why this project is useful.

See [Dampening Mechanism](#dampening-mechanism) for an for detailed analysis of dampening mechanism possibilities.

See [Avoiding harmonic nodes](#avoiding-harmonic-nodes) on the importance of considering harmonics when experimenting.

--------

## Motivation
#### Autoharps are limited in number/variety of chords

Most autoharps have between 12 and 21 chord bars, with the ability to play in only some of the 12 musical keys. The chords available are usually major chords, minor chords, major-minor 7 chords, and sometimes a diminished chord.

Thinking just about these 4 types of chords, the maximal manual autoharp can play 21 of them, out of the `12*4=48` possible.

Stepping out of the chord bar paradigm can allow more flexibility.

#### Ergonomics of chord layouts can only go so far, and are not always key agnostic

The best layout I've found with 21 bars is to have each column be of the form (from farthest reach with the left hard to closest): `(Am, C, A7)`. Successive columns just walk this around the circle of fifths. This makes playing most major and minor songs in 5 key signatures ergonomic and *key agnostic* (transposing a song is as simple as shifting your chording hand over). Still, one of several flaws with this layout: When one wants the major/minor version of the minor/major chord, it's a wide reach that may go off the harp.

Stepping out of the 1 button = 1 chord paradigm can allow more flexibility.

#### Playing autoharps for long periods can cause cramping, arthritis, or other joint pain in the chording hand.

Depending on how well tuned the harp is and how the hand is positioned, this may be more or less of an issue. I don't play for more than an hour at a time, due to cramping.

Stepping out of the finger-force dampening paradigm etc.

----------

## Dampening mechanism

3 possibilities for this:

#### One solenoid per string

This is my current favorite. Every string has a small solenoid positioned so that the unpowered state is dampening the string. When powered, the dampener lifts up, allowing that string to sound. The arduino controls the 30-40 solenoids individually, allowing more flexibility than the other two solutions. Cheap solenoids will cost around $1.

**Construction summary**: From a autoharp with exposed chord bars. Remove all bars except for one. Stretch the springs holding that bar so that the bar stays high under more force. Super glue solenoids to the sides of the bar such that the solenoids head is just short of touching the string it should dampen. Padding can then be glued to the head of the solenoid so that the resting state dampens the string effectively. Alternate placing solenoids on each side of the bar to give them enough lateral space.

**Considerations**: Size, shape, material of the dampening pads. Force of dampening. Lower notes' pads need more contact with the string to effectively dampen.

**Pros**: String by string flexibility for chord building, simple construction

**Cons**: Raised solenoids (undampened strings) draw current while remaining raised. (TODO power/battery requirements.)

#### Depress single-note bars with motor push

This is the second simplest solution. There are 12 "chord" bars, but their felts are cut so that one dampens only the `C`s, one dampens only the `C#`s, etc. Now to form an arbitrary chord, press down the set of bars that correspond to the pitch classes you **don't** want in the chord. Each depression will require more force than solenoids can probably supply, so higher torque stepper motors may be better.

**Construction summary**: From an autoharp with exposed chord bars, take 12 bars and cut their felts to only dampen one pitch class. Replace them in a way to avoid damping on harmonic nodes. Get 12 high torque stepper motors with arms that swivel to straight down (to depress a bar). Mount them above the bars somehow, taking into account their difficult dimensions and the point of downward force on the bar relative to the strings being dampened. Given my lack of construction experience, this last task was too daunting for me.

**Considerations**: Force of dampening. Avoiding harmonic nodes.

**Pros**: Minimal power usage when not changing chords. Probably cheaper than the solenoids if done right, but not by much.

**Cons**: Complicated mounting that occupies space in front of chord bars, which may get in the way of the strumming hand.

#### Depress single-note bars with down pulling strings

Like the last in terms of the single note bars. For each bar: Tie a string to each end, run it straight downward and around a pivot point, then pull on both ends to depress the bar. Use a motor head to pull the strings taut to dampen a note.

**Considerations**: Allowing the motors to do no work when not changing chords. Motors need to be about as high torque as previous.

**Pros**: The complicated mounting of the previous can be relocated somewhere less invasive (inside the autoharp body would be really interesting.

**Cons**: Starting to get quite complicated.

--------

## Avoiding harmonic nodes

See the [Wikipedia article](https://en.wikipedia.org/wiki/Harmonic) if you don't know what a harmonic node is. To experience it, place your finger or an eraser exactly halfway along a string, and pluck the string. An octave above the string's note will resonate. Slide along the string to find other points where the string will still sound.

That point on the string is a harmonic node, and is a very bad location for a felt to touch the string to keep it from sounding. There are other harmonic nodes at `(1/3, 2/3, 1/4, 3/4, 1/5, 2/5, ...)` etc. (all the rational numbers between 0 and 1). As the denominator gets bigger, the sound from it gets weaker.

Whenever we mess with positions of bars and felts on the autoharp, we need to keep this consideration a priority to minimize extraneous noise while strumming. Consider marking all the harmonic nodes on the strings (e.g. with a red marker) before deciding on bar/felt placements that avoid those spots.

#### Keypad &rarr; Notes logic

This project has the opportunity for a very consistent, learnable, erganomic, key agnostic chord control mechanism. Optimizing for all these is a real puzzle. We'll start 

In a major key, here are the roman numeral chords I want easy access to, in decreasing order of importance: `(I, V(7), IV, vi, ii, II(7), iii, III(7), vii&deg;, VI, VIIb, ...)`  I have high uncertainty after halfway through that list.

Similarly, in a minor key (using the roman numeral `vi` as the tonic chord for consistency): `(vi, iii, III(7), ii, V(7), I, IV, ...)` I have high enough uncertainty that I won't even try to add more.

Songs with the richest harmonies have both minor and major progressions in them, so it behooves us to not only make the system key agnostic, but also *tonality agnostic* (a term I just made up: a song that starts major and then goes minor or vice versa shouldn't throw us for a loop).

The first 7 elements of each list have 6 in common, which (probably due to some arcane property of (meta-)music-theory) are also six-in-a-row around the circle of fifths: `(IV, I, V, ii, vi, iii)`. 

Or, arranging them in rows as autoharpists typically do:
|     |     |     |
| --- | --- | --- |
| IV  | I   | V   |
| ii  | vi  | iii |

This seems like an optimal arrangement of 6 buttons for playing diatonically, to be key and tonality agnostic. I'll treat these 6 chords as the core chords, which should be accessible through a single button press.

To actually make it key agnostic though, there needs to be a way to play in more than one key. We could do this with static buttons by having 24 buttons that we could arrange in 2 literal circles of fifths. The circles could be one inside the other, and then we literally have a circle of fifths as a control board:

![major minor circle of fifths](https://www.dummies.com/wp-content/uploads/104975.image0.jpg)

24 buttons is a lot to just give us all the major minor keys. We can instead do it by having those 6 buttons plus 2 buttons for changing a programmatic variable that remembers our key. Each button can change the key one direction or another around the circle of fifths. This has the disadvantage of not being able to jump to some arbitrary chord root outside the key: `VIIb` and `VIb` come to mind as somewhat common examples. And the chord vii&deg; is in the key and we can't reach it either. 

The biggest problem is that the II and III chords aren't there. Adding another row can fix that, and also gives us all of the first 7 most important chords in major and minor from above:

|     |     |     |
| --- | --- | --- |
| IV  | I   | V   |
| ii  | vi  | iii |
| II  | VI  | III |

We can expand the possibilities of these chords with modifiers, in decreasing order of importance and increasing order of my excitement: Adding a minor seventh, switching major/minor to minor/major respectively, diminishing the chord, sus4-ing the chord (!!), adding a major seventh to the chord (!!!), augmenting the chord (!!!!). There could be add2, add6 stuff as well.

#### Arduino setup (TODO)
