## Summary

This site details an ongoing project to improve the chord selection mechanism on chromatic Autoharps/Chromaharps (hereafter called just "autoharps"). An arduino reads inputs from a keypad, computes the desired chord from the keypresses, and mechanically dampens the undesired strings. 

It does **not** strum or pluck for the human, nor does it change chords without human input.

See [Motivations](#motivation) for why this project is useful.

See [Dampening Mechanism](#dampening-mechanism) for an for detailed analysis of dampening mechanism possibilities.

See [Avoiding harmonic nodes](#avoiding-harmonic-nodes) on the importance of considering harmonics when experimenting.

See [Keypad → Notes logic](#keypad--notes-logic) for more discussion than you wanted about sensible chord setups.

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

This is my current pursuit. Every string has a small solenoid positioned so that the unpowered state is dampening the string. When powered, the dampener lifts up, allowing that string to sound. The arduino controls the 30-40 solenoids individually, allowing more flexibility than the other two solutions. Cheap solenoids will cost around $1. The batteries I've tried cannot deliver the amps needed, so I'm trying a 12V, 5A laptop charger for now.

**Construction summary**: From a autoharp with exposed chord bars. Remove all bars except for one. Stretch the springs holding that bar so that the bar stays high under more force. Super glue solenoids to the sides of the bar such that the solenoids head is just short of touching the string it should dampen. Padding can then be glued to the head of the solenoid so that the resting state dampens the string effectively. Alternate placing solenoids on each side of the bar to give them enough lateral space.

**Considerations**: Size, shape, material of the dampening pads. Force of dampening. Lower notes' pads need more contact with the string to effectively dampen.

**Pros**: String by string flexibility for chord building, simple construction

**Cons**: Raised solenoids (undampened strings) draw current while remaining raised (one of my tiny $1 solenoids needs at least 70 mA to start lifting, and will continue to draw that while raised).

#### Depress single-note bars with motor push

This is the second simplest solution. There are 12 "chord" bars, but their felts are cut so that one dampens only the `C`s, one dampens only the `C#`s, etc. Now to form an arbitrary chord, press down the set of bars that correspond to the pitch classes you **don't** want in the chord. Each depression will require more force than solenoids can probably supply, so higher torque stepper motors may be better.

**Construction summary**: From an autoharp with exposed chord bars, take 12 bars and cut their felts to only dampen one pitch class. Replace them in a way to avoid damping on harmonic nodes. Get 12 high torque stepper motors with arms that swivel to straight down (to depress a bar). Mount them above the bars somehow, taking into account their difficult dimensions and the point of downward force on the bar relative to the strings being dampened. Given my lack of construction experience, this last task was too daunting for me.

**Considerations**: Force of dampening. Avoiding harmonic nodes.

**Pros**: Minimal power usage when not changing chords. Probably cheaper than the solenoids if done right, but not by much. Probably can be powered by a battery.

**Cons**: Complicated mounting that occupies space in front of chord bars, which may get in the way of the strumming hand.

#### Depress single-note bars with down pulling strings

Like the last in terms of the single note bars. For each bar: Tie a string to each end, run it straight downward and around a pivot point, then pull on both ends to depress the bar. Use a motor head to pull the strings taut to dampen a note.

**Considerations**: Allowing the motors to do no work when not changing chords. Motors need to be about as high torque as previous.

**Pros**: The complicated mounting of the previous can be relocated somewhere less invasive (inside the autoharp body would be really interesting. Probably can be powered by a battery.

**Cons**: Starting to get quite complicated.

--------

## Avoiding harmonic nodes

See the [Wikipedia article](https://en.wikipedia.org/wiki/Harmonic) if you don't know what a harmonic node is. To experience it, place your finger or an eraser exactly halfway along a string, and pluck the string. An octave above the string's note will resonate. Slide along the string to find other points where the string will still sound.

That point on the string is a harmonic node, and is a very bad location for a felt to touch the string to keep it from sounding. There are other harmonic nodes at `(1/3, 2/3, 1/4, 3/4, 1/5, 2/5, ...)` etc. (all the rational numbers between 0 and 1). As the denominator gets bigger, the sound from it gets weaker.

Whenever we mess with positions of bars and felts on the autoharp, we need to keep this consideration a priority to minimize extraneous noise while strumming. Consider marking all the harmonic nodes on the strings (e.g. with a red marker) before deciding on bar/felt placements that avoid those spots.

-------------

## Keypad &rarr; Notes logic

This project has the opportunity for a very consistent, learnable, ergonomic, key agnostic chord control mechanism. Optimizing for all these is a real puzzle, and different musicians will have different opinions and desires in this area.

In this section, there will be tension between 1) incorporating more buttons/controls/physical complexity into the design, so that the amount of interaction needed to change to arbitrary chords is minimized, and 2) having fewer buttons/controls, so that the size/cost/physical complexity is minimized, but more interaction is needed to specify arbitrary chords. Each person probably has their own balance, but I lean more toward the fewer buttons/controls because I'm bad at electronics.

#### Music Theory Considerations for important triads

In a major key, here are the roman numeral chords I want easy access to, in decreasing order of importance: `(I, V(7), IV, vi, ii, II(7), iii, III(7), vii°, VI, VIIb, ...)`  I have high uncertainty after halfway through that list.

Similarly, in a minor key (using the roman numeral `vi` as the tonic chord for consistency): `(vi, iii, III(7), ii, V(7), I, IV, ...)` I have high enough uncertainty that I won't try to add more.

Songs with the richest harmonies have both minor and major progressions in them, so it behooves us to not only make the system key agnostic, but also *tonality agnostic* (a term I just made up: a song that starts major and then goes minor or vice versa shouldn't throw us for a loop).

The first 7 elements of each list have 6 in common, which (probably due to some arcane property of (meta-)music-theory) are also six-in-a-row around the circle of fifths: `(IV, I, V, ii, vi, iii)`. 

Or, arranging them in rows as autoharpists typically do:

|     |     |     |
| --- | --- | --- |
| IV  | I   | V   |
| ii  | vi  | iii |

This seems like an optimal arrangement of 6 buttons for playing diatonically, to be key and tonality agnostic. I'll treat these 6 chords as the core chords, which should be accessible through a single button press.

To actually make it key agnostic though, there needs to be a way to play in more than one key. 

**Fixed chord root buttons**: We could do this with static buttons by having 24 buttons that we could arrange in 2 literal circles of fifths. The circles could be one inside the other, and then we literally have a circle of fifths as a control board:

![major minor circle of fifths](https://www.dummies.com/wp-content/uploads/104975.image0.jpg)

24 buttons feels like a lot, but it gives us every major/minor triad, and it could make for a really attractive circular keypad, which could rotate to "switch" keys, and have modifier keys inside or outside the main circle. You would have to construct this yourself, as I can't find such a circular keypad online, even just for one row.

If your thumb is used to joysticks, another idea is to map the sectors of a joystick's movement to the circle of fifths. The lack of tactile feedback on the boundaries between chords, or the small 30&deg; sectors might be issues.

**Dynamic chord root buttons**: We can try to use program state to do it with fewer buttons: 6 buttons could code for `(IV, I, V, ii, vi, iii)` as in the table above, and 2 buttons could be used to change our key. Each button can change the key one direction or another around the circle of fifths. This has the disadvantage of not being able to jump to some arbitrary chord root outside the key: `VIIb` and `VIb` come to mind as somewhat common examples. And the chord `vii°` is entirely in the key and we can't reach it either. 

The biggest problem is that the II and III chords aren't there. Adding another row can fix that, and also gives us all of the first 7 most important chords in major and minor from above:

|     |     |     |
| --- | --- | --- |
| IV  | I   | V   |
| ii  | vi  | iii |
| II  | VI  | III |

This third row looks a little redundant next to the second row; especially if the "Swapping major/minor triad" modifier below is convenient to use.

#### Music Theory considerations for chord modifiers

We can expand the possibilities of these chords with modifiers. A modifier is a way to add or modify the notes in the 24 basic triads. Ideally, several modifiers could be added to one triad without much hassle. Each player will probably have a different preference for how these are arranged and which are included, or may even desire to change layouts between songs.

Here's my list of modifiers in decreasing order of importance and increasing order of my excitement: Adding a minor seventh, switching major/minor to minor/major triad respectively, diminishing the chord, sus4-ing the chord (!!), adding a major seventh to the chord (!!!), augmenting the chord (!!!!). There could be add2, add6, 9, 11, 13 stuff as well.

**Adding sevenths**: The major point of contention with having a `+7` modifier button is whether that 7 should be major or minor or context dependent. Chords with a major 7th above the root are rare, and seldom used outside of jazz. [Mechanical autoharps aren't great for jazz](http://jazzmando.com/new/archives/001511.shtml) (Only view if you aren't easily offended), and the possibility for major sevenths would help.

It isn't usually possible to predict the presence of major sevenths from the key signature, and chord sheets are explicit about when the 7 is major: `FM7` or `Fmaj7`. For this reason, it seems most best to use two separate modifiers: A `+min7` button that is in very easy reach for frequent use, and a `+maj7` button if the player wants it.

Alternatively, consider that a single button could be double tapped to get a different behavior, e.g. `+7` once for `+min7` and twice for `+maj7`.

**Swapping major/minor triads**: A `ii` becomes a `II`. A `iii` becomes a `III`. A common progression at the end of songs: `(I - IV - iv - I)`. The `IV` and `V` in a major key get swapped out with their parallel minor counterparts for a more edgy harmony. The [Picardy third](https://en.wikipedia.org/wiki/Picardy_third) makes the last chord of a minor song (un)expectedly major.

Though a minor button and a major button separately are simpler to understand, the minor button would only be useful on major chords, and the major button only on minor chords. Combining them into a single button saves a button for something else.

**Diminished chords**: Three chords of interest: a [diminished triad](https://en.wikipedia.org/wiki/Diminished_triad) (3 notes with minor thirds between them), [fully diminished seventh chord] (https://en.wikipedia.org/wiki/Diminished_seventh_chord) (4 notes with minor thirds between them), and [half-diminished seventh chord](https://en.wikipedia.org/wiki/Half-diminished_seventh_chord) (a diminished triad with a minor seventh on top). The logic I've used thus far does not fit diminished chords well: We don't have `vii°` the most common diminished triad in our base triads; if we did, we still don't have a modifier to add a minor sixth to the chord for the fully diminished seventh. The most comprehensible solution is simply to add a modifier for each variation.

There are a few inelegant hacks we can use if we don't want to add so many buttons for these relatively rare chords. We could add one modifier button, a `dim` button, but have the button work in coordination with our `V` triad to produce the `vii°`. Why `V`? The diminished triad has a (dominant function)[https://en.wikipedia.org/wiki/Dominant_(music)] just like the `V`, and a `V7` can be thought of as a `vii°` with an added fifth scale degree.

We can co-opt other buttons that will not be much use in diminished chords, such as the `+maj7`, to be a `+min6` for the fully diminished chord. We can use the `+min7` as is to produce a half-diminished chord. Each of these chords would require 3 button presses: the `V`, the `dim`, and whichever `+7` button.

**Augmented chords**: These are a piece of proverbial cake relative to the diminished chords. An [augmented triad](https://en.wikipedia.org/wiki/Augmented_triad) is 3 notes separated by major thirds. Ignoring enharmonics (as we do) there are only 3 different augmented chords. So throw on an `aug` button, hit it with `I` or `iii` and you'll get the same effect. The `+7` modifiers are still there if you want to play a really exotic chord.

**Sus4 chords**: In a [sus4 chord](https://en.wikipedia.org/wiki/Suspended_chord) the 3rd is removed and a perfect 4th added. Pretty straightforward unless you want to hack together a more general system to get `sus2` without extra buttons, but I'm cool with just a `sus4` for now.

**You get the idea**: Other modifier ideas: removing the third to make open fifths, removing third and fifth to make octaves (yawn). "Scale" modifiers could be used for allowing playing any notes inside the scale by damping the ones outside the scale. Diatonic scale, pentatonic scale, various minor scales, or other less common scales.

#### Misc. operator buttons


**Left/Right around the circle of fifths**: 2 buttons, `mod5` and `mod4` to allow the instrument to change keys in two directions: `V` becomes `I`; and `IV` becomes `I`. Modulating by minor thirds might also be useful to go quickly between parallel major/minor keys.

**Previous chord**: There are frequently times when you are walking a melody up a scale and have to go back and forth between passing chords. Having a `prev` button to go to the chord just before the one currently playing could save 1 or 2 key presses depending on how complicated the chords are.

#### Keypress timing considerations

Timing is very important and has not yet been discussed. Many keypads do not support detecting multiple keys pressed at the same time, so combinations of keys pressed to produce a chord cannot happen at once. We will call this a _sequential_ keypad system. A system that can detect any number of simultaneous keypresses correctly is a _simultaneous_ keypad system. We'll start with thinking sequentially for simplicity's sake.

Most of the time when you press the `IV` button, you just want to play that chord as is. But suppose one time in the middle of a song it's a minor `iv` chord, requiring the major/minor modifier plus the `IV` button. Thinking sequentially, one button press has to come before the other. 

If the `IV` is first, the arduino can either 1) wait for more input, or 2) immediately make the chord available with possibly the wrong tonality.

If the `maj/min` is first, the arduino can either 3) wait for more input, or 4) immediately change the current chord to the opposite tonality.

Of these 4 scenarios, I like 3 best. Immediate changes mean the instrument will be in states of the wrong tonality. If the arduino is to wait for something, it's best that the "something" be definite. We've talked about the 6 fundamental triad controls, and one reason they are so fundamental is that they are the common element, and thus can safely be the element that actuates the changing of the chords in one quick motion.

Say we're in C major, and we want to play `E7`, which is `III7`. So the order of the sequential presses would be `maj/min`, `+m7`, `iii`. Only pressing the final button would cause the dampened strings to change. Not gonna lie: this sounds painful given how often I use `III7`.

#### Sequential layout ideas

Given the above, here are some of my ideas for "good" sequential keypad layouts

**12 button sequential keypad A (fast and simple):**

|     |     |     |
| --- | --- | --- |
| IV  | I   | V   |
| ii  | vi  | iii |
| II7 | VI7 | III7|
| mod4|+min7| mod5|

This layout should play melodies quickly and efficiently. The presence of the third triad row (with 7s already added because of their nearly universal use on secondary dominants) allows us to leave out `maj/min` modifier. We can play most chords with a single keypress, with the exception of the `V7` (this is a real downer). Even with just these 12 buttons, the player can play in all 12 key signatures, major and minor, with the most common chords, have minor chords with minor sevenths, major sevenths if you use a double-tap logic, and modulate keys mid song without fuss. 

Some players might like swapping out the `+min7` for a `V7` button, or have the double tap behavior provide the `V7`, or some variation on that.

**12 button sequential keypad B (slower and deeper):**

|     |     |     |
| --- | --- | --- |
| IV  | I   | V   |
| ii  | vi  | iii |
|+min7|maj/min|sus4|
| mod4|prev | mod5|

We remove our convenience row of chords to add more cool modifiers to show off with. Double taps would open open up more possibilities `+min7`  &rarr; `+maj7`; `maj/min` &rarr; `dim`; `sus4`  &rarr; `sus2`. But here the secondary dominants with sevenths require 3 presses. This could be fine for chording and slower melodies, but not faster ones. The `prev` button recovers some speed between alternating chords.

--------

## Arduino setup (TODO)
