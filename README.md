1 Welcome to Sonic Pi

# Welcome friend :-)

Welcome to Sonic Pi. Hopefully you're as excited to get started making
crazy sounds as I am to show you. It's going to be a really *fun* ride
where you'll learn all about music, synthesis, programming, composition,
performance and more.

But wait, how rude of me! Let me introduce myself - I'm
[Sam Aaron](http://twitter.com/samaaron) - the chap that created Sonic
Pi. You can find me at [@samaaron](http://twitter.com/samaaron) on
Twitter and I'd be more than happy to say hello to you.  You might also
be interested in finding out more about my
[Live Coding Performances](http://facebook.com/livecodersamaaron) where
I code with Sonic Pi live in front of audiences.

If you have any thoughts, or ideas for improving Sonic Pi - please pass
them on - feedback is so helpful. You never know, your idea might be the
next big feature!

This tutorial is divided up into sections grouped by category. Whilst
I've written it to have an easy learning progression from start to
finish, feel very free just to dip in and out of sections as you see
fit. If you feel that there's something missing, do let me know and I'll
consider it for a future version.

Finally, watching others live code is a really great way to learn. I
regularly stream live on
[livecoding.tv/samaaron](http://youtube.com/samaaron) so please do
drop by, say hi and ask me lots of questions :-)

OK, let's get started...

1.1 Live Coding

# Live Coding

One of the most exciting aspects of Sonic Pi is that it enables you to
write and *modify code live* to make music, just like you might perform
live with a guitar. This means that given some practice you can take
Sonic Pi on stage and gig with it.

## Free your mind

Before we get into the real details of how Sonic Pi works in the rest of
this tutorial, I'd like to give you an experience of what it's like to
live code. Don't worry if you don't understand much (or any) of
this. Just try to hold onto your seats and enjoy...

## A live loop

Let's get started, copy the following code into an empty buffer above:

```
live_loop :flibble do
  sample :bd_haus, rate: 1
  sleep 0.5
end
```

Now, press the `Run` button and you'll hear a nice fast bass drum
beating away. If at any time you wish to stop the sound just hit the
`Stop` button. Although don't hit it just yet... Instead, follow these steps:

1. Make sure the bass drum sound is still running
2. Change the `sleep` value from `0.5` to something higher like `1`.
3. Press the `Run` button again
4. Notice how the drum speed has changed.
5. Finally, *remember this moment*, this is the first time you've live
   coded with Sonic Pi and it's unlikely to be your last...

Ok, that was simple enough. Let's add something else into the mix. Above
`sample :bd_haus` add the line `sample :ambi_choir, rate: 0.3`. Your
code should look like this:

```
live_loop :flibble do
  sample :ambi_choir, rate: 0.3
  sample :bd_haus, rate: 1
  sleep 1
end
```

Now, play around. Change the rates - what happens when you use high
values, or small values or negative values? See what happens when you
change the `rate:` value for the `:ambi_choir` sample just slightly (say
to `0.29`). What happens if you choose a really small `sleep` value? See
if you can make it go so fast your computer will stop with an error
because it can't keep up (if that happens, just choose a bigger `sleep`
time and hit `Run` again).

Try commenting one of the `sample` lines out by adding a `#` to the
beginning:

```
live_loop :flibble do
  sample :ambi_choir, rate: 0.3
#  sample :bd_haus, rate: 1
  sleep 1
end
```

Notice how it tells the computer to ignore it, so we don't hear it. This
is called a comment. In Sonic Pi we can use comments to remove and add
things into the mix.

Finally, let me leave you something fun to play with. Take the code below,
and copy it into a spare buffer. Now, don't try to understand it too
much other than see that there are two loops - so two things going round
at the same time. Now, do what you do best - experiment and play
around. Here are some suggestions:

* Try changing the blue `rate:` values to hear the sample sound change.
* Try changing the `sleep` times and hear that both loops can spin round
  at different rates.
* Try uncommenting the sample line (remove the `#`) and enjoy the sound
  of the guitar played backwards.
* Try changing any of the blue `mix:` values to numbers between `0` (not
  in the mix) and `1` (fully in the mix).

Remember to press `Run` and you'll hear the change next time the loop
goes round. If you end up in a pickle, don't worry - hit `Stop`, delete
the code in the buffer and paste a fresh copy in and you're ready to
jam again. Making mistakes is how you'll learn the quickest...


```
live_loop :guit do
  with_fx :echo, mix: 0.3, phase: 0.25 do
    sample :guit_em9, rate: 0.5
  end
#  sample :guit_em9, rate: -0.5
  sleep 8
end

live_loop :boom do
  with_fx :reverb, room: 1 do
    sample :bd_boom, amp: 10, rate: 1
  end
  sleep 8
end
```

Now, keep playing and experimenting until your curiosity about how this
all actually works kicks in and you start wondering what else you can do
with this. You're now ready to read the rest of the tutorial.

So what are you waiting for...

1.2 Exploring the Interface

# The Sonic Pi Interface

Sonic Pi has a very simple interface for coding music. Let's spend a
little time exploring it.

![Sonic Pi Interface](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/GUI.png)


* *A* - Play Controls
* *B* - Editor Controls
* *C* - Info and Help
* *D* - Code Editor
* *E* - Prefs Panel
* *F* - Log Viewer
* *G* - Help System
* *H* - Scope Viewer

## A. Play Controls

These pink buttons are the main controls for starting and stopping
sounds. There's the *Run* button for running the code in the editor,
*Stop* for stopping all running code, *Save* for saving the code to an
external file and *Record* to create a recording (a WAV file) of the
sound playing.

## B. Editor Controls

These orange buttons allow you to manipulate the code editor. The *Size
+* and *Size -* buttons allow you to make the text bigger and
smaller. The *Align* button will neaten the code for you to make it look
more professional.

## C. Info and Help

These blue buttons give you access to information, help and
preferences. The *Info* button will open up the information window which
contains information about Sonic Pi itself - the core team, history,
contributors and community. The *Help* button toggles the help system
(*G*) and the *Prefs* button toggles the preferences window which allows
you to control some basic system parameters.

## D. Code Editor

This is the area where you'll write your code and compose/perform
music. It's a simple text editor where you can write code, delete it,
cut and paste, etc. Think of it like a very basic version of Word or
Google Docs. The editor will automatically colour words based on their
meaning in the code. This may seem strange at first, but you'll soon
find it very useful. For example, you'll know something is a number
because it is blue.

## E. Prefs Panel

Sonic Pi supports a number of tweakable preferences which can be
accessed by toggling the *prefs* button in the Info and Help button
set. This will toggle the visibility of the Prefs Panel which includes a
number of options to be changed. Examples are forcing mono mode,
inverting stereo, toggling log output verbosity and also a volume slider
and audio selector on the Raspberry Pi.

## F. Log Viewer

When you run your code, information about what the program is doing will
be displayed in the log viewer. By default, you'll see a message for
every sound you create with the exact time the sound was triggered. This
is very useful for debugging your code and understanding what your code
is doing.

## G. Help System

One of the most important parts of the Sonic Pi interface is
the help system which appears at the bottom of the window. This can be
toggled on and off by clicking on the blue *Help* button. The help
system contains help and information about all aspects of Sonic Pi
including this tutorial, a list of available synths, samples, examples,
FX and a full list of all the functions Sonic Pi provides for coding
music.

## H. Scope Viewer

The scope viewer allows you to see the sound you're hearing. You can
easily see that the saw wave looks like a saw and that the basic beep is
a curvey sine wave. You can also see the difference between loud and
quiet sounds by the size of the lines. There are 3 scopes to play with -
the default is a combined scope for the left and right channels, there
is a stereo scope which draws a separate scope for each channel. Finally
there is a Lissajous curve scope which will show the phase relationship
between the left and right channels and allows you to draw pretty
pictures with sound (https://en.wikipedia.org/wiki/Lissajous_curve).

1.3 Learning through Play

# Learning through Play

Sonic Pi encourages you to learn about both computing and music through
play and experimentation. The most important thing is that you're having
fun, and before you know it you'll have accidentally learned how to
code, compose and perform.

## There are no mistakes

Whilst we're on this subject, let me just give you one piece of advice
I've learned over my years of live coding with music - *there are no
mistakes, only opportunities*. This is something I've often heard in
relation to jazz but it works equally well with live coding. No matter
how experienced you are - from a complete beginner to a seasoned
Algoraver, you'll run some code that has a completely unexpected
outcome. It might sound insanely cool - in which case run with
it. However, it might sound totally jarring and out of place. It doesn't
matter that it happened - what matters is what you do next with it. Take
the sound, manipulate it and morph it into something awesome. The crowd
will go *wild*.

## Start Simple

When you're learning, it's tempting to want to do amazing things
*now*. However, just hold that thought and see it as a distant goal to
reach *later*. For now, instead think of the *simplest* thing you could
write which would be fun and rewarding that's a small step towards the
amazing thing you have in your head. Once you have an idea about that
simple step, then try and build it, play with it and then see what new
ideas it gives you. Before long you'll be too busy having fun and making
real progress.

Just make sure to share your work with others!

2 Synths

# Synths

OK, enough of the intros - let's get into some sound.

In this section we'll cover the basics of triggering and manipulating
synths. Synth is short for synthesiser which is a fancy word for
something which creates sounds. Typically synths are quite complicated
to use - especially analog synths such as Eurorack modules connected
together by a mess of wires. However, Sonic Pi gives you much of that
power in a very simple and approachable manner.

Don't be fooled by the immediate simplicity of Sonic Pi's interface. You
can get very deep into very sophisticated sound manipulation if that's
your thing. Hold on to your hats...

2.1 Your First Beeps

# Your First Beeps

Take a look at the following code:

```
play 70
```

This is where it all starts. Go ahead, copy and paste it into the code
window at the top of the app (the big white space under the Run
button). Now, press Run...

## Beep!

Intense. Press it again. And again. *And again...*

Woah, crazy, I'm sure you could keep doing that all day. But wait,
before you lose yourself in an infinite stream of beeps, try changing
the number:

```
play 75
```

Can you hear the difference? Try a lower number:

```
play 60
```

So, lower numbers make lower pitched beeps and higher numbers make
higher pitched beeps. Just like on a piano, the keys at the lower part
of the piano (the left hand side) play lower notes and the keys on the
higher part of the piano (the right hand side) play higher notes. In
fact, the numbers actually relate to notes on the piano. `play 47`
actually means play the 47th note on the piano. Which means that `play 48`
is one note up (the next note to the right). It just so happens that
the 4th octave C is number 60. Go ahead and play it: `play 60`.

*Don't worry* if this means nothing to you - it didn't to me when I
first started. All that matters right now is that you know that *low
numbers make lower beeps* and *high numbers make higher beeps*.

## Chords

Playing a note is quite fun, but playing many at the same time can be
even better. Try it:

```
play 72
play 75
play 79
```

Jazzy! So, when you write multiple `play`s, they all play at the same
time. Try it for yourself - which numbers sound good together? Which
sound terrible? Experiment, explore and find out for yourself.

## Melody

So, playing notes and chords is fun - but how about a melody? What if
you wanted to play one note after another and not at the same time?
Well, that's easy, you just need to `sleep` between the notes:

```
play 72
sleep 1
play 75
sleep 1
play 79
```

How lovely, a little arpeggio. So what does the `1` mean in `sleep 1`?
Well it means the *duration of the sleep*. It actually means sleep for
one beat, but for now we can think about it as sleeping for 1
second. So, what if we wanted to make our arpeggio a little faster?
Well, we need to use shorter sleep values. What about a half i.e. `0.5`:

```
play 72
sleep 0.5
play 75
sleep 0.5
play 79
```

Notice how it plays faster. Now, try for yourself, change the times -
use different times and notes.

One thing to try is in-between notes such as `play 52.3` and `play 52.63`.
There's absolutely no need to stick to standard whole notes. Play
around and have fun.


## Traditional Note Names

For those of you that already know some musical notation (don't worry if
you don't - you don't need it to have fun) you might want to write a
melody using note names such as C and F# rather than numbers. Sonic Pi
has you covered. You can do the following:

```
play :C
sleep 0.5
play :D
sleep 0.5
play :E
```

Remember to put the colon `:` in front of your note name so that it
goes pink. Also, you can specify the octave by adding a number after
the note name:

```
play :C3
sleep 0.5
play :D3
sleep 0.5
play :E4
```

If you want to make a note sharp, add an `s` after the note name such as
`play :Fs3` and if you want to make a note flat, add a `b` such as `play :Eb3`.

Now go *crazy* and have fun making your own tunes.

2.2 Synth Options

# Synth Options: Amp and Pan

As well as allowing you to control which note to play or which sample to
trigger, Sonic Pi provides a whole range of options to craft and
control the sounds. We'll be covering many of these in this tutorial and
there's extensive documentation for each in the help system. However,
for now we'll introduce two of the most useful: *amplitude* and *pan*.
First, let's look at what options actually are.


## Options

Sonic Pi supports the notion of options (or opts for short) for its
synths. Opts are controls you pass to `play` which modify and
control aspects of the sound you hear. Each synth has its own set of
opts for finely tuning its sound. However, there are common sets
of opts shared by many sounds such as `amp:` and envelope
opts (covered in another section).

Opts have two major parts, their name (the name of the control) and
their value (the value you want to set the control at). For example, you
might have a opt called `cheese:` and want to set it with a value
of `1`.

Opts are passed to calls to `play` by using a comma
`,` and then the name of the opt such as `amp:` (don't forget the
colon `:`) and then a space and the value of the opt. For example:

```
play 50, cheese: 1
```

(Note that `cheese:` isn't a valid opt, we're just using it as an example).

You can pass multiple opts by separating them with a comma:

```
play 50, cheese: 1, beans: 0.5
```

The order of the opts doesn't matter, so the following is identical:

```
play 50, beans: 0.5, cheese: 1
```

Opts that aren't recognised by the synth are just ignored (like
`cheese` and `beans` which are clearly ridiculous opt names!)

If you accidentally use the same opt twice with different values, the
last one wins. For example, `beans:` here will have the value 2 rather
than 0.5:

```
play 50, beans: 0.5, cheese: 3, eggs: 0.1, beans: 2
```

Many things in Sonic Pi accept opts, so just spend a little time
learning how to use them and you'll be set! Let's play with our first
opt: `amp:`.

## Amplitude

Amplitude is a computer representation of the loudness of a sound. A
*high amplitude produces a loud sound* and a *low amplitude produces a
quiet sound*. Just as Sonic Pi uses numbers to represent time and notes,
it uses numbers to represent amplitude. An amplitude of 0 is silent
(you'll hear nothing) whereas an amplitude of 1 is normal volume. You
can even crank up the amplitude higher to 2, 10, 100. However, you
should note that when the overall amplitude of all the sounds gets too
high, Sonic Pi uses what's called a compressor to squash them all to
make sure things aren't too loud for your ears. This can often make the
sound muddy and strange. So try to use low amplitudes, i.e. in the range
0 to 0.5 to avoid compression.


## Amp it up

To change the amplitude of a sound, you can use the `amp:`
opt. For example, to play at half amplitude pass 0.5:

```
play 60, amp: 0.5
```

To play at double amplitude pass 2:

```
play 60, amp: 2
```

The `amp:` opt only modifies the call to `play` it's associated
with. So, in this example, the first call to play is at half volume and
the second is back to the default (1):

```
play 60, amp: 0.5
sleep 0.5
play 65
```

Of course, you can use different `amp:` values for each call to play:

```
play 50, amp: 0.1
sleep 0.25
play 55, amp: 0.2
sleep 0.25
play 57, amp: 0.4
sleep 0.25
play 62, amp: 1
```

## Panning

Another fun opt to use is `pan:` which controls the panning of a
sound in stereo. Panning a sound to the left means that you hear it out
of the left speaker, and panning it to the right means you hear it out
of your right speaker. For our values, we use a -1 to represent fully
left, 0 to represent center and 1 to represent fully right in the stereo
field. Of course, we're free to use any value between -1 and 1 to
control the exact positioning of our sound.

Let's play a beep out of the left speaker:

```
play 60, pan: -1
```

Now, let's play it out of the right speaker:

```
play 60, pan: 1
```

Finally let's play it back out of the center of both (the default
position):

```
play 60, pan: 0
```

Now, go and have fun changing the amplitude and panning of your sounds!

2.3 Switching Synths

# Switching Synths

So far we've had quite a lot of fun making beeps. However, you're
probably starting to get bored of the basic beep noise. Is that all
Sonic Pi has to offer? Surely there's more to live coding than just
playing beeps? Yes there is, and in this section we'll explore the
exciting range of sounds that Sonic Pi has to offer.

## Synths

Sonic Pi has a range of instruments it calls synths which is *short for
synthesisers*. Whereas samples represent pre-recorded sounds, synths are
capable of generating new sounds depending on how you control them
(which we'll explore later in this tutorial). Sonic Pi's synths are very
powerful and expressive and you'll have a lot of fun exploring and
playing with them. First, let's learn how to select the current synth to
use.

## Buzzy saws and prophets

A fun sound is the *saw wave* - let's give it a try:

```
use_synth :saw
play 38
sleep 0.25
play 50
sleep 0.25
play 62
sleep 0.25
```

Let's try another sound - the *prophet*:

```
use_synth :prophet
play 38
sleep 0.25
play 50
sleep 0.25
play 62
sleep 0.25
```

How about combining two sounds. First one after another:

```
use_synth :saw
play 38
sleep 0.25
play 50
sleep 0.25
use_synth :prophet
play 57
sleep 0.25
```

Now at the same time:

```
use_synth :tb303
play 38
sleep 0.25
use_synth :dsaw
play 50
sleep 0.25
use_synth :prophet
play 57
sleep 0.25
```

Notice that the `use_synth` command only affects the following calls to
`play`. Think of it like a *big switch* - new calls to `play` will play
whatever synth it's currently pointing to. You can move the switch to a
new synth with `use_synth`.


## Discovering Synths

To see which synths Sonic Pi has for you to play with take a look at the
Synths option in the far left vertical menu (above Fx). There are
over 20 to choose from. Here are a few of my favourites:

* `:prophet`
* `:dsaw`
* `:fm`
* `:tb303`
* `:pulse`

Now play around with *switching synths during your music*. Have fun
combining synths to make new sounds as well as using different synths
for different sections of your music.

2.4 Duration with Envelopes

# Duration with Envelopes

In an earlier section, we looked at how we can use the `sleep` command
to control when to trigger our sounds. However, we haven't yet been able
to control the duration of our sounds.

In order to give us a simple, yet powerful means of *controlling the
duration* of our sounds, Sonic Pi provides the notion of an *ADSR
amplitude envelope* (we'll cover what ADSR means later in this
section). An amplitude envelope offers two useful aspects of control:

* control over the duration of a sound
* control over the amplitude of a sound

## Duration

The duration is the length the sound lasts for. A longer duration means
that you hear the sound for longer. Sonic Pi's sounds all have a
controllable amplitude envelope, and the total duration of that envelope
is the duration of the sound. Therefore, by controlling the envelope you
control the duration.

## Amplitude

The ADSR envelope not only controls duration, it also gives you *fine
control over the amplitude of the sound*. All audible sounds start and
end silent and contain some non-silent part in-between. Envelopes allow
you to slide and hold the amplitude of non-silent parts of the
sound. It's like giving someone instructions on how to turn up and down
the volume of a guitar amplifier. For example you might ask someone to
"start at silence, slowly move up to full volume, hold it for a bit,
then quickly fall back to silence." Sonic Pi allows you to program
exactly this behaviour with envelopes.

Just to recap, as we have seen before, an amplitude of 0 is silence and
an amplitude of 1 is normal volume.

Now, let us look at each of the parts of the envelopes in turn.

## Release Phase

The only part of the envelope that's used by default is the release
time. This is the time it takes for the synth's sound to fade out. All
synths have a release time of 1 which means that by default they have a
duration of 1 beat (which at the default BPM of 60 is 1 second):

```
play 70
```

The note will be audible for 1 second.  Go ahead and time it :-) This is
short hand for the longer more explicit version:

```
play 70, release: 1
```

Notice how this sounds exactly the same (the sound lasts for one
second). However, it's now very easy to change the duration by modifying
the value of the `release:` opt:

```
play 60, release: 2
```

We can make the synth sound for a very short amount of time by using a
very small release time:

```
play 60, release: 0.2
```

The duration of the release of the sound is called the *release phase*
and by default is a linear transition (i.e. a straight line). The
following diagram illustrates this transition:

![release envelope](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/env-release.png)

The vertical line at the far left of the diagram shows that the sound
starts at 0 amplitude, but goes up to full amplitude immediately (this
is the attack phase which we'll cover next). Once at full amplitude it
then moves in a straight line down to zero taking the amount of time
specified by `release:`.  *Longer release times produce longer synth
fade outs.*

You can therefore change the duration of your sound by changing the
release time. Have a play adding release times to your music.

## Attack Phase

By default, the *attack phase* is 0 for all synths which means they move
from 0 amplitude to 1 immediately. This gives the synth an initial
percussive sound. However, you may wish to fade your sound in. This can
be achieved with the `attack:` opt. Try fading in some sounds:

```
play 60, attack: 2
sleep 3
play 65, attack: 0.5
```

You may use multiple opts at the same time. For example for a short
attack and a long release try:

```
play 60, attack: 0.7, release: 4
```

This short attack and long release envelope is illustrated in the
following diagram:

![attack release envelope](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/env-attack-release.png)

Of course, you may switch things around. Try a long attack and a short
release:

```
play 60, attack: 4, release: 0.7
```

![long attack short release envelope](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/env-long-attack-short-release.png)

Finally, you can also have both short attack and release times for
shorter sounds.

```
play 60, attack: 0.5, release: 0.5
```

![short attack short release envelope](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/env-short-attack-short-release.png)

## Sustain Phase

In addition to specifying attack and release times, you may also specify
a sustain time to control the *sustain phase*. This is the time for
which the sound is maintained at full amplitude between the attack and
release phases.

```
play 60, attack: 0.3, sustain: 1, release: 1
```

![ASR envelope](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/env-attack-sustain-release.png)

The sustain time is useful for important sounds you wish to give full
presence in the mix before entering an optional release phase. Of
course, it's totally valid to set both the `attack:` and `release:` opts
to 0 and just use the sustain to have absolutely no fade in or fade out
to the sound. However, be warned, a release of 0 can produce clicks in
the audio and it's often better to use a very small value such as 0.2.

## Decay Phase

For an extra level of control, you can also specify a decay time. This
is a phase of the envelope that fits between the attack and sustain
phases and specifies a time where the amplitude will drop from the
`attack_level:` to the `decay_level:` (which unless you explicitly set
it will be set to the `sustain_level:`). By default, the `decay:` opt is
0 and both the attack and sustain levels are 1 so you'll need to specify
them for the decay time to have any effect:

```
play 60, attack: 0.1, attack_level: 1, decay: 0.2, sustain_level: 0.4, sustain: 1, release: 0.5
```

![ADSR envelope](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/env-attack-decay-sustain-release.png)

## Decay Level

One last trick is that although the `decay_level:` opt defaults to be
the same value as `sustain_level:` you can explicitly set them to
different values for full control over the envelope. This allows you to
to create envelopes such as the following:

```
play 60, attack: 0.1, attack_level: 1, decay: 0.2, decay_level: 0.3, sustain: 1, sustain_level: 0.4, release: 0.5
```

![ASR envelope](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/env-decay-level.png)

It's also possible to set the `decay_level:` to be higher than `sustain_level:`:

```
play 60, attack: 0.1, attack_level: 0.1, decay: 0.2, decay_level: 1, sustain: 0.5, sustain_level: 0.8, release: 1.5
```

![ASR envelope](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/env-decay-level-2.png)

## ADSR Envelopes

So to summarise, Sonic Pi's ADSR envelopes have the following phases:

1. *attack* - time from 0 amplitude to the `attack_level`,
2. *decay* - time to move amplitude from `attack_level` to `decay_level`,
3. *sustain* - time to move the amplitude from `decay_level` to `sustain_level`,
4. *release* - time to move amplitude from `sustain_level` to 0

It's important to note that the duration of a sound is the summation of
the times of each of these phases. Therefore the following sound will
have a duration of 0.5 + 1 + 2 + 0.5 = 4 beats:

```
play 60, attack: 0.5, attack_level: 1, decay: 1, sustain_level: 0.4, sustain: 2, release: 0.5
```

Now go and have a play adding envelopes to your sounds...

3 Samples

# Samples

Another great way to develop your music is to use pre-recorded
sounds. In great hip-hop tradition, we call these pre-recorded sounds
*samples*. So, if you take a microphone outside, go and record the gentle
sound of rain hitting canvas, you've just created a sample.

Sonic Pi lets you do lots of fun things with samples. Not only does it
ship with 130 public domain samples ready for you to jam with, it
lets you play and manipulate your own. Let's get to it...

3.1 Triggering Samples

# Triggering Samples

Playing beeps is only the beginning. Something that's a lot of fun is
triggering pre-recorded samples. Try it:

```
sample :ambi_lunar_land
```

Sonic Pi includes many samples for you to play with. You can use them
just like you use the `play` command. To play multiple samples and notes
just write them one after another:

```
play 36
play 48
sample :ambi_lunar_land
sample :ambi_drone
```

If you want to space them out in time, use the `sleep` command:

```
sample :ambi_lunar_land
sleep 1
play 48
sleep 0.5
play 36
sample :ambi_drone
sleep 1
play 36
```

Notice how Sonic Pi doesn't wait for a sound to finish before starting
the next sound. The `sleep` command only describes the separation of the
*triggering* of the sounds. This allows you to easily layer sounds
together creating interesting overlap effects. Later in this tutorial
we'll take a look at controlling the *duration* of sounds with
envelopes.


## Discovering Samples

There are two ways to discover the range of samples provided in Sonic
Pi. First, you can use this help system. Click on Samples in the far
left vertical menu, choose your category and then you'll see a list of
available sounds.

Alternatively you can use the *auto-completion system*. Simply type the
start of a sample group such as: `sample :ambi_` and you'll see a
drop-down of sample names appear for you to select. Try the following
category prefixes:

* `:ambi_`
* `:bass_`
* `:elec_`
* `:perc_`
* `:guit_`
* `:drum_`
* `:misc_`
* `:bd_`

Now start mixing samples into your compositions!

3.2 Sample Parameters

# Sample Parameters: Amp and Pan

As we saw with synths, we can easily control our sounds with
parameters. Samples support exactly the same parameterisation
mechanism. Let's revisit our friends `amp:` and `pan:`.

## Amping samples

You can change the amplitude of samples with exactly the same
approach you used for synths:

```
sample :ambi_lunar_land, amp: 0.5
```

## Panning samples

We're also able to use the `pan:` parameter on samples. For example,
here's how we'd play the amen break in the left ear and then half way
through play it again through the right ear:

```
sample :loop_amen, pan: -1
sleep 0.877
sample :loop_amen, pan: 1
```

Note that 0.877 is half the duration of the `:loop_amen` sample in
seconds.

Finally, note that if you set some synth defaults with
`use_synth_defaults` (which we will discuss later), these will be
ignored by `sample`.

3.3 Stretching Samples

# Stretching Samples

Now that we can play a variety of synths and samples to create some music,
it's time to learn how to modify both the synths and samples to make the
music even more unique and interesting. First, let's explore the ability
to *stretch* and *squash* samples.

## Sample Representation

Samples are pre-recorded sounds stored as numbers which represent how to
move the speaker cone to reproduce the sound. The speaker cone can move
in and out, and so the numbers just need to represent how far in and out
the cone needs to be for each moment in time. To be able to faithfully
reproduce a recorded sound the sample typically needs to store many
thousands of numbers per second! Sonic Pi takes this list of numbers and
feeds them at the right speed to move your computer's speaker in and out
in just the right way to reproduce the sound. However, it's also fun to
change the speed with which the numbers are fed to the speaker to change
the sound.

## Changing Rate

Let's play with one of the ambient sounds: `:ambi_choir`. To play it
with the default rate, you can pass a `rate:` opt to `sample`:

```
sample :ambi_choir, rate: 1
```

This plays it at normal rate (1), so nothing special yet. However, we're
free to change that number to something else. How about `0.5`:

```
sample :ambi_choir, rate: 0.5
```

Woah! What's going on here? Well, two things. Firstly, the sample takes
twice as long to play, secondly the sound is an octave lower. Let's
explore these things in a little more detail.

## Let's stretch

A sample that's fun to stretch and compress is the Amen Break. At normal
rate, we might imagine throwing it into a *drum 'n' bass* track:

```
sample :loop_amen
```

However by changing the rate we can switch up genres. Try half speed for
*old school hip-hop*:

```
sample :loop_amen, rate: 0.5
```

If we speed it up, we enter *jungle* territory:

```
sample :loop_amen, rate: 1.5
```

Now for our final party trick - let's see what happens if we use a
negative rate:

```
sample :loop_amen, rate: -1
```

Woah! It plays it *backwards*! Now try playing with lots of different
samples at different rates. Try very fast rates. Try crazy slow
rates. See what interesting sounds you can produce.

## A Simple Explanation of Sample Rate

A useful way to think of samples is as springs. Playback rate is like
squashing and stretching the spring. If you play the sample at rate 2,
you're *squashing the spring* to half its normal length. The sample
therefore takes half the amount of time to play as it's shorter. If you
play the sample at half rate, you're *stretching the spring* to double
its length. The sample therefore takes twice the amount of time to play
as it's longer. The more you squash (higher rate), the shorter it gets,
the more you stretch (lower rate), the longer it gets.

Compressing a spring increases its density (the number of coils per cm)
- this is similar to the sample sounding *higher pitched*. Stretching
the spring decreases its density and is similar to the sound having a
*lower pitch*.


## The Maths Behind Sample Rate

(This section is provided for those that are interested in the
details. Please feel free to skip it...)

As we saw above, a sample is represented by a big long list of numbers
representing where the speaker should be through time. We can take this
list of numbers and use it to draw a graph which would look similar to
this:

![sample graph](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/sample.png)

You might have seen pictures like this before. It's called the
*waveform* of a sample. It's just a graph of numbers. Typically a
waveform like this will have 44100 points of data per second (this is
due to the Nyquist-Shannon sampling theorem). So, if the sample lasts
for 2 seconds, the waveform will be represented by 88200 numbers which
we would feed to the speaker at a rate of 44100 points per second. Of
course, we could feed it at double rate which would be 88200 points per
second. This would therefore take only 1 second to play back. We could
also play it back at half rate which would be 22050 points per second
taking 4 seconds to play back.

The duration of the sample is affected by the playback rate:

* Doubling the playback rate halves the playback time,
* Halving the playback rate doubles the playback time,
* Using a playback rate of one fourth quadruples the playback time,
* Using a playback rate of 1/10 makes playback last 10 times longer.

We can represent this with the formula:

```
new_sample_duration = (1 / rate) * sample_duration
```

Changing the playback rate also affects the pitch of the sample. The
frequency or pitch of a waveform is determined by how fast it moves up
and down. Our brains somehow turn fast movement of speakers into high
notes and slow movement of speakers into low notes. This is why you can
sometimes even see a big bass speaker move as it pumps out super low
bass - it's actually moving a lot slower in and out than a speaker
producing higher notes.

If you take a waveform and squash it it will move up and down more times
per second. This will make it sound higher pitched. It turns out that
doubling the amount of up and down movements (oscillations) doubles the
frequency. So, *playing your sample at double rate will double the
frequency you hear it*. Also, *halving the rate will halve the
frequency*. Other rates will affect the frequency accordingly.

3.4 Enveloped Samples

# Enveloped Samples

It is also possible to modify the *duration* and *amplitude* of a sample
using an ADSR envelope. However, this works slightly differently to the
ADSR envelope available on synths. Sample envelopes only allow you to
reduce the amplitude and duration of a sample - and never to increase
it. The sample will stop when either the sample has finished playing or
the envelope has completed - whichever is first. So, if you use a very
long `release:`, it won't extend the duration of the sample.

## Amen Envelopes

Let's return to our trusty friend the Amen Break:

```
sample :loop_amen
```

With no opts, we hear the full sample at full amplitude. If we
want to fade this in over 1 second we can use the `attack:` param:

```
sample :loop_amen, attack: 1
```

For a shorter fade in, choose a shorter attack value:

```
sample :loop_amen, attack: 0.3
```

## Auto Sustain

Where the ADSR envelope's behaviour differs from the standard synth
envelope is in the *sustain* value. In the standard synth envelope, the
sustain defaulted to 0 unless you set it manually. With samples, the
sustain value defaults to an *automagical* value - the time left to play
the rest of the sample. This is why we hear the full sample when we pass
no defaults. If the attack, decay, sustain and release values were all 0
we'd never hear a peep. Sonic Pi therefore calculates how long the
sample is, deducts any attack, decay and release times and uses the
result as your sustain time. If the attack, decay and release values add
up to more than the duration of the sample, the sustain is simply set to
0.

## Fade Outs

To explore this, let's consider our Amen break in more detail. If we ask
Sonic Pi how long the sample is:

```
print sample_duration :loop_amen
```

It will print out `1.753310657596372` which is the length of the sample
in seconds. Let's just round that to `1.75` for convenience here. Now,
if we set the release to `0.75`, something surprising will happen:

```
sample :loop_amen, release: 0.75
```

It will play the first second of the sample at full amplitude before
then fading out over a period of 0.75 seconds. This is the *auto
sustain* in action. By default, the release always works from the end of
the sample. If our sample was 10.75 seconds long, it would play the
first 10 seconds at full amplitude before fading out over 0.75s.

Remember: by default, `release:` fades out at the end of a sample.

## Fade In and Out

We can use both `attack:` and `release:` together with the auto sustain
behaviour to fade both in and out over the duration of the sample:

```
sample :loop_amen, attack: 0.75, release: 0.75
```

As the full duration of the sample is 1.75s and our attack and release
phases add up to 1.5s, the sustain is automatically set to 0.25s. This
allows us to easily fade the sample in and out.

## Explicit sustain

We can easily get back to our normal synth ADSR behaviour by manually
setting `sustain:` to a value such as 0:

```
sample :loop_amen, sustain: 0, release: 0.75
```

Now, our sample only plays for 0.75 seconds in total. With the default
for `attack:` and `decay:` at 0, the sample jumps straight to full
amplitude, sustains there for 0s then releases back down to 0 amplitude
over the release period - 0.75s.

## Percussive cymbals

We can use this behaviour to good effect to turn longer sounding samples
into shorter, more percussive versions. Consider the sample
`:drum_cymbal_open`:

```
sample :drum_cymbal_open
```

You can hear the cymbal sound ringing out over a period of
time. However, we can use our envelope to make it more percussive:

```
sample :drum_cymbal_open, attack: 0.01, sustain: 0, release: 0.1
```

You can then emulate hitting the cymbal and then dampening it by
increasing the sustain period:

```
sample :drum_cymbal_open, attack: 0.01, sustain: 0.3, release: 0.1
```

Now go and have fun putting envelopes over the samples. Try changing the
rate too for really interesting results.

3.5 Partial Samples

# Partial Samples

This section will conclude our exploration of Sonic Pi's sample
player. Let's do a quick recap. So far we've looked at how we can
trigger samples:

```
sample :loop_amen
```

We then looked at how we can change the rate of samples such as
playing them at half speed:

```
sample :loop_amen, rate: 0.5
```

Next, we looked at how we could fade a sample in (let's do it at half
speed):

```
sample :loop_amen, rate: 0.5, attack: 1
```

We also looked at how we could use the start of a sample percussively
by giving `sustain:` an explicit value and setting both the attack and
release to be short values:

```
sample :loop_amen, rate: 2, attack: 0.01, sustain: 0, release: 0.35
```

However, wouldn't it be nice if we didn't have to always start at the
beginning of the sample? Wouldn't it also be nice if we didn't have to
always finish at the end of the sample?

## Choosing a starting point

It is possible to choose an arbitrary starting point in the sample as a
value between 0 and 1 where 0 is the start of the sample, 1 is the end
and 0.5 is half way through the sample. Let's try playing only the last
half of the amen break:

```
sample :loop_amen, start: 0.5
```

How about the last quarter of the sample:

```
sample :loop_amen, start: 0.75
```

## Choosing a finish point

Similarly, it is possible to choose an arbitrary finish point in the
sample as a value between 0 and 1. Let's finish the amen break half way
through:

```
sample :loop_amen, finish: 0.5
```

## Specifying start and finish

Of course, we can combine these two to play arbitrary segments of the
audio file. How about only a small section in the middle:

```
sample :loop_amen, start: 0.4, finish: 0.6
```

What happens if we choose a start position after the finish position?


```
sample :loop_amen, start: 0.6, finish: 0.4
```

Cool! It plays it backwards!

## Combining with rate

We can combine this new ability to play arbitrary segments of audio with
our friend `rate:`. For example, we can play a very small section of the
middle of the amen break very slowly:

```
sample :loop_amen, start: 0.5, finish: 0.7, rate: 0.2
```

## Combining with envelopes

Finally, we can combine all of this with our ADSR envelopes to produce
interesting results:

```
sample :loop_amen, start: 0.5, finish: 0.8, rate: -0.2, attack: 0.3, release: 1
```

Now go and have a play mashing up samples with all of this fun stuff...

3.6 External Samples

# External Samples

Whilst the built-in samples can get you up and started quickly, you
might wish to experiment with other recorded sounds in your music. Sonic
Pi totally supports this. First though, let's have a quick discussion on
the portability of your piece.

## Portability

When you compose your piece purely with built-in synths and samples, the
code is all you need to faithfully reproduce your music. Think about
that for a moment - that's amazing! A simple piece of text you can email
around or stick in a [Gist](https://gist.github.com) represents
everything you need to reproduce your sounds. That makes it *really easy
to share* with your friends as they just need to get hold of the code.

However, if you start using your own pre-recorded samples, you lose this
portability. This is because to reproduce your music other people not
only need your code, they need your samples too. This limits the ability
for others to manipulate, mash-up and experiment with your work. Of
course this shouldn't stop you from using your own samples, it's just
something to consider.

## Local Samples

So how do you play any arbitrary WAV, AIFF or FLAC file on your computer?
All you need to do is pass the path of that file to `sample`:

```
# Raspberry Pi, Mac, Linux
sample "/Users/sam/Desktop/my-sound.wav"
# Windows
sample "C:/Users/sam/Desktop/my-sound.wav"
```

Sonic Pi will automatically load and play the sample. You can also pass
all the standard params you're used to passing `sample`:

```
# Raspberry Pi, Mac, Linux
sample "/Users/sam/Desktop/my-sound.wav", rate: 0.5, amp: 0.3
# Windows
sample "C:/Users/sam/Desktop/my-sound.wav", rate: 0.5, amp: 0.3
```


3.7 Sample Packs

# Sample Packs

**Note: this section of the tutorial covers the advanced topic of
working with large directories of your own samples. This will be the
case if you've downloaded or bought your own sample packs and wish to
use them within Sonic Pi.**

**Feel free to skip this if you're happy working with the built-in
samples.**

When working with large folders of external samples it can be cumbersome
to have to type the whole path every time to trigger an individual
sample.

For example, say you have the following folder on your machine:

```
/path/to/my/samples/
```

When we look inside that folder we find the following samples:

* `100_A#_melody1.wav`
* `100_A#_melody2.wav`
* `100_A#_melody3.wav`
* `120_A#_melody4.wav`
* `120_Bb_guit1.wav`
* `120_Bb_piano1.wav`

Typically in order to play the piano sample we can use the full path:

```
sample "/path/to/my/samples/120_Bb_piano1.wav"
```

If we want to then play the guitar sample we can use its full path too:

```
sample "/path/to/my/samples/120_Bb_guit.wav"
```

However, both of these calls to sample requires us to *know* the names
of the samples within our directory. What if we just want to listen to
each sample in turn quickly?

## Indexing Sample Packs

If we want to play the first sample in a directory we just need to pass
the directory's name to `sample` and the index `0` as follows:

```
sample "/path/to/my/samples/", 0
```

We can even make a shortcut to our directory path using a variable:

```
samps = "/path/to/my/samples/"
sample samps, 0
```

Now, if we want to play the second sample in our directory, we just need
to add 1 to our index:

```
samps = "/path/to/my/samples/"
sample samps, 1
```

Notice that we no longer need to know the names of the samples in the
directory - we just need to know the directory itself (or have a
shortcut to it). If we ask for an index which is larger than the number
of samples, it simply wraps round just like Rings. Therefore, whatever
number we use we're guaranteed to get one of the samples in that
directory.

## Filtering Sample Packs

Usually indexing is enough, but sometimes we need more power to sort
and organise our samples. Luckily many sample packs add useful
information in the filenames. Let's take another look at the sample file
names in our directory:

* `100_A#_melody1.wav`
* `100_A#_melody2.wav`
* `100_A#_melody3.wav`
* `120_A#_melody4.wav`
* `120_Bb_guit1.wav`
* `120_Bb_piano1.wav`

Notice that in these filenames we have quite a bit of
information. Firstly, we have the BPM of the sample (beats per minute)
at the start. So, the piano sample is at 120 BPM and our first three
melodies are at 100 BPM. Also, our sample names contain the key. So the
guitar sample is in Bb and the melodies are in A#. This information is
very useful for mixing in these samples with our other code. For
example, we know we can only play the piano sample with code that's in
120 BPM and in the key of Bb.

It turns out that we can use this particular naming convention of our
sample sets in the code to help us filter out the ones we want. For
example, if we're working at 120 BPM, we can filter down to all the
samples that contain the string `"120"` with the following:

```
samps = "/path/to/my/samples/"
sample samps, "120"
```

This will play us the first match. If we want the second match we just
need to use the index:

```
samps = "/path/to/my/samples/"
sample samps, "120", 1
```

We can even use multiple filters at the same time. For example, if we
want a sample whose filename contains both the substrings "120" and "A#"
we can find it easily with the following code:

```
samps = "/path/to/my/samples/"
sample samps, "120", "A#"
```

Finally, we're still free to add our usual opts to the call to `sample`:

```
samps = "/path/to/my/samples/"
sample samps, "120", "Bb", 1, lpf: 70, amp: 2
```

## Sources

The sample filter pre-arg system understands two types of information:
sources and filters. Sources are information used to create the list of
potential candidates. A source can take two forms:

1. "/path/to/samples" - a string representing a valid path to a directory
2. "/path/to/samples/foo.wav" - a string representing a valid path to a sample

The `sample` fn will first gather all sources and use them to create a
large list of candidates. This list is constructed by first adding all
valid paths and then by adding all the valid `.flac`, `.aif`, `.aiff`,
`.wav`, `.wave` files contained within the directories.

For example, take a look at the following code:

```
samps = "/path/to/my/samples/"
samps2 = "/path/to/my/samples2/"
path = "/path/to/my/samples3/foo.wav"

sample samps, samps2, path, 0
```

Here, we're combining the contents of the samples within two directories
and adding a specific sample. If `"/path/to/my/samples/"` contained 3
samples and `"/path/to/my/samples2/"` contained 12, we'd have 16
potential samples to index and filter (3 + 12 + 1).

By default, only the sample files within a directory are gathered into
the candidate list. Sometimes you might have a number of nested folders of
samples you wish to search and filter within. You can therefore do a
recursive search for all samples within all subfolders of a particular
folder by adding `**` to the end of the path:

```
samps = "/path/to/nested/samples/**"
sample samps, 0
```

Take care though as searching through a very large set of folders may
take a long time. However, the contents of all folder sources are
cached, so the delay will only happen the first time.

Finally, note that the sources *must go first*. If no source is given,
then the set of built-in samples will be selected as the default list of
candidates to work with.

## Filters

Once you have a list of candidates you may use the following filtering
types to further reduce the selection:

* `"foo"` Strings will filter on substring occurrence within file name (minus directory path and extension).
* `/fo[oO]/` Regular Expressions will filter on pattern matching of file name (minus directory path and extension).
* `:foo` - Keywords will filter candidates on whether the keyword is a direct match of the filename (minus directory path and extension).
* `lambda{|a| ... }` - Procs with one argument will be treated as a candidate filter or generator function. It will be passed the list of current candidates and must return a new list of candidates (a list of valid paths to sample files).
* `1` - Numbers will select the candidate with that index (wrapping round like a ring if necessary).

For example, we can filter over all the samples in a directory
containing the string `"foo"` and play the first matching sample at half
speed:

```
sample "/path/to/samples", "foo", rate: 0.5
```

See the help for `sample` for many detailed usage examples. Note that
the ordering of the filters is honoured.

## Composites

Finally, you may use lists wherever you may place a source or
filter. The list will be automatically flattened and the contents will
be treated as regular sources and filters. Therefore the following calls
to `sample` are semantically equivalent:

```
sample "/path/to/dir", "100", "C#"
sample ["/path/to/dir", "100", "C#"]
sample "/path/to/dir", ["100", "C#"]
sample ["/path/to/dir", ["100", ["C#"]]]
```

## Wrapping Up

This was an advanced section for people that need real power to
manipulate and use sample packs. If most of this section didn't make too
much sense, don't worry. It's likely you don't need any of this
functionality just yet. However, you'll know when you do need it and you
can come back and re-read this when you start working with large
directories of samples.

4 Randomisation

# Randomisation

A great way to add some interest into your music is using some random
numbers. Sonic Pi has some great functionality for adding randomness to
your music, but before we start we need to learn a shocking truth: in
Sonic Pi *random is not truly random*. What on earth does this mean?
Well, let's see.

## Repeatability

A really useful random function is `rrand` which will give you a random
value between two numbers - a *min* and a *max*. (`rrand` is short for
ranged random). Let's try playing a random note:

```
play rrand(50, 95)
```

Ooh, it played a random note. It played note `83.7527`. A nice random
note between 50 and 95. Woah, wait, did I just predict the exact random
note you got too? Something fishy is going on here. Try running the code
again. What? It chose `83.7527` again? That can't be random!

The answer is that it is not truly random, it's pseudo-random. Sonic Pi
will give you random-like numbers in a repeatable manner. This is very
useful for ensuring that the music you create on your machine sounds
identical on everybody else's machine - even if you use some randomness
in your composition.

Of course, in a given piece of music, if it 'randomly' chose `83.7527`
every time, then it wouldn't be very interesting. However, it
doesn't. Try the following:

```
loop do
  play rrand(50, 95)
  sleep 0.5
end
```

Yes! It finally sounds random. Within a given *run* subsequent calls
to random functions will return random values. However, the next run
will produce exactly the same sequence of random values and sound
exactly the same. It's as if all Sonic Pi code went back in time to
exactly the same point every time the Run button was pressed. It's the
Groundhog Day of music synthesis!

## Haunted Bells

A lovely illustration of randomisation in action is the haunted bells
example which loops the `:perc_bell` sample with a random rate and sleep
time between bell sounds:

```
loop do
  sample :perc_bell, rate: (rrand 0.125, 1.5)
  sleep rrand(0.2, 2)
end
```

## Random cutoff

Another fun example of randomisation is to modify the cutoff of a
synth randomly. A great synth to try this out on is the `:tb303`
emulator:

```
use_synth :tb303

loop do
  play 50, release: 0.1, cutoff: rrand(60, 120)
  sleep 0.125
end
```

## Random seeds

So, what if you don't like this particular sequence of random numbers
Sonic Pi provides? Well it's totally possible to choose a different
starting point via `use_random_seed`. The default seed happens to be
0, so choose a different seed for a different random experience!

Consider the following:

```
5.times do
  play rrand(50, 100)
  sleep 0.5
end
```

Every time you run this code, you'll hear the same sequence of 5
notes. To get a different sequence simply change the seed:

```
use_random_seed 40
5.times do
  play rrand(50, 100)
  sleep 0.5
end
```

This will produce a different sequence of 5 notes. By changing the seed
and listening to the results you can find something that you like - and
when you share it with others, they will hear exactly what you heard
too.

Let's have a look at some other useful random functions.


## choose

A very common thing to do is to choose an item randomly from a list of
known items. For example, I may want to play one note from the
following: 60, 65 or 72. I can achieve this with `choose` which lets
me choose an item from a list. First, I need to put my numbers in a list
which is done by wrapping them in square brackets and separating them
with commas: `[60, 65, 72]`. Next I just need to pass them to `choose`:

```
choose([60, 65, 72])
```

Let's hear what that sounds like:

```
loop do
  play choose([60, 65, 72])
  sleep 1
end
```

## rrand

We've already seen `rrand`, but let's run over it again. It returns a
random number between two values exclusively. That means it will never
return either the top or bottom number - always something in between the
two. The number will always be a float - meaning it's not a whole number
but a fraction of a number. Examples of floats returned by
`rrand(20, 110)`:

* 87.5054931640625
* 86.05255126953125
* 61.77825927734375

## rrand_i

Occasionally you'll want a whole random number, not a float. This is
where `rrand_i` comes to the rescue. It works similarly to `rrand`
except it may return the min and max values as potential random values
(which means it's inclusive rather than exclusive of the
range). Examples of numbers returned by `rrand_i(20, 110)` are:

* 88
* 86
* 62

## rand

This will return a random float between 0 (inclusive) and the max
value you specify (exclusive). By default it will return a value
between 0 and one. It's therefore useful for choosing random `amp:`
values:

```
loop do
  play 60, amp: rand
  sleep 0.25
end
```

## rand_i

Similar to the relationship between `rrand_i` and `rrand`, `rand_i` will
return a random whole number between 0 and the max value you specify.

## dice

Sometimes you want to emulate a dice throw - this is a special case of
`rrand_i` where the lower value is always 1. A call to `dice` requires
you to specify the number of sides on the dice. A standard dice has 6
sides, so `dice(6)` will act very similarly - returning values of either
1, 2, 3, 4, 5, or 6. However, just like fantasy role-play games, you
might find value in a 4 sided dice, or a 12 sided dice, or a 20 sided
dice - perhaps even a 120 sided dice!

## one_in

Finally you may wish to emulate throwing the top score of a dice such
as a 6 in a standard dice. `one_in` therefore returns true with a
probability of one in the number of sides on the dice. Therefore
`one_in(6)` will return true with a probability of 1 in 6 or false
otherwise. True and false values are very useful for `if` statements
which we will cover in a subsequent section of this tutorial.

Now, go and jumble up your code with some randomness!

5 Programming Structures

# Programming Structures

Now that you've learned the basics of creating sounds with `play` and
`sample` and creating simple melodies and rhythms by `sleep`ing between
sounds, you might be wondering what else the world of code can offer
you...

Well, you're in for an exciting treat! It turns out that basic
programming structures such as looping, conditionals, functions and
threads give you amazingly powerful tools to express your musical ideas.

Let's get stuck in with the basics...

5.1 Blocks

# Blocks

A structure you'll see a lot in Sonic Pi is the block. Blocks allow us
to do useful things with large chunks of code. For example, with synth
and sample parameters we were able to change something that happened on
a single line. However, sometimes we want to do something meaningful to
a number of lines of code. For example, we may wish to loop it, to add
reverb to it, to only run it 1 time out of 5, etc. Consider the
following code:

```
play 50
sleep 0.5
sample :elec_plip
sleep 0.5
play 62
```

To do something with a chunk of code, we need to tell Sonic Pi where
the code block *starts* and where it *ends*. We use `do` for start and
`end` for end. For example:

```
do
  play 50
  sleep 0.5
  sample :elec_plip
  sleep 0.5
  play 62
end
```

However, this isn't yet complete and won't work (try it and you'll get
an error) as we haven't told Sonic Pi what we want to do with this
*do/end block*. We tell Sonic Pi this by writing some special code
before the `do`. We'll see a number of these special pieces of code
later on in this tutorial. For now, it's important to know that wrapping
your code within `do` and `end` tells Sonic Pi you wish to do something
special with that chunk of code.

5.2 Iteration and Loops

# Iteration and Loops

So far we've spent a lot of time looking at the different sounds you
can make with `play` and `sample` blocks. We've also learned how to
trigger these sounds through time using `sleep`.

As you've probably found out, there's a *lot* of fun you can have with
these basic building blocks. However, a whole new dimension of fun opens
up when you start using the power of code to structure your music and
compositions. In the next few sections we'll explore some of these
powerful new tools. First up is iteration and loops.

## Repetition

Have you written some code you'd like to repeat a few times? For
example, you might have something like this:

```
play 50
sleep 0.5
sample :elec_blup
sleep 0.5
play 62
sleep 0.25
```

What if we wished to repeat this 3 times? Well, we could do something
simple and just copy and paste it three times:

```
play 50
sleep 0.5
sample :elec_blup
sleep 0.5
play 62
sleep 0.25

play 50
sleep 0.5
sample :elec_blup
sleep 0.5
play 62
sleep 0.25

play 50
sleep 0.5
sample :elec_blup
sleep 0.5
play 62
sleep 0.25
```

Now that's a lot of code! What happens if you want to change the
sample to `:elec_plip`? You're going to have to find all the places
with the original `:elec_blup` and switch them over. More importantly,
what if you wanted to repeat the original piece of code 50 times or
1000? Now that would be a lot of code, and a lot of lines of code to
alter if you wanted to make a change.

## Iteration

In fact, repeating the code should be as easy as saying *do this three
times*. Well, it pretty much is. Remember our old friend the code
block? We can use it to mark the start and end of the code we'd like
to repeat three times. We then use the special code `3.times`. So,
instead of writing *do this three times*, we write `3.times do` -
that's not too hard. Just remember to write `end` at the end of the
code you'd like to repeat:

```
3.times do
  play 50
  sleep 0.5
  sample :elec_blup
  sleep 0.5
  play 62
  sleep 0.25
end
```

Now isn't that much neater than cutting and pasting! We can use this to
create lots of nice repeating structures:

```
4.times do
  play 50
  sleep 0.5
end

8.times do
  play 55, release: 0.2
  sleep 0.25
end

4.times do
  play 50
  sleep 0.5
end
```

## Nesting Iterations

We can put iterations inside other iterations to create interesting
patterns. For example:

```
4.times do
  sample :drum_heavy_kick
  2.times do
    sample :elec_blip2, rate: 2
    sleep 0.25
  end
  sample :elec_snare
  4.times do
    sample :drum_tom_mid_soft
    sleep 0.125
  end
end
```

## Looping

If you want something to repeat a lot of times, you might find yourself
using really large numbers such as `1000.times do`. In this case, you're
probably better off asking Sonic Pi to repeat forever (at least until
you press the stop button!). Let's loop the amen break forever:

```
loop do
  sample :loop_amen
  sleep sample_duration :loop_amen
end
```

The important thing to know about loops is that they act like black
holes for code. Once the code enters a loop it can never leave until you
press stop - it will just go round and round the loop forever. This
means if you have code after the loop you will *never* hear it. For
example, the cymbal after this loop will never play:

```
loop do
  play 50
  sleep 1
end

sample :drum_cymbal_open
```

Now, get structuring your code with iteration and loops!

5.3 Conditionals

# Conditionals

A common thing you'll likely find yourself wanting to do is to not only
play a random note (see the previous section on randomness) but also
make a random decision and based on the outcome run some code or some
other code. For example, you might want to randomly play a drum or a
cymbal. We can achieve this with an `if` statement.

## Flipping a Coin

So, let's flip a coin: if it's heads, play a drum, if it's tails, play a
cymbal. Easy. We can emulate a coin flip with our `one_in` function
(introduced in the section on randomness) specifying a probability of 1
in 2: `one_in(2)`. We can then use the result of this to decide between
two pieces of code, the code to play the drum and the code to play the
cymbal:

```
loop do

  if one_in(2)
    sample :drum_heavy_kick
  else
    sample :drum_cymbal_closed
  end

  sleep 0.5

end
```

Notice that `if` statements have three parts:

* The question to ask
* The first choice of code to run (if the answer to the question is yes)
* The second choice of code to run (if the answer to the question is no)

Typically in programming languages, the notion of yes is represented by
the term `true` and the notion of no is represented by the term
`false`. So we need to find a question that will give us a `true` or
`false` answer which is exactly what `one_in` does.

Notice how the first choice is wrapped between the `if` and the `else`
and the second choice is wrapped between the `else` and the `end`. Just
like do/end blocks you can put multiple lines of code in either
place. For example:

```
loop do

  if one_in(2)
    sample :drum_heavy_kick
    sleep 0.5
  else
    sample :drum_cymbal_closed
    sleep 0.25
  end

end
```

This time we're sleeping for a different amount of time depending on
which choice we make.


## Simple if

Sometimes you want to optionally execute just one line of code. This is
possible by placing `if` and then the question at the end. For example:

```
use_synth :dsaw

loop do
  play 50, amp: 0.3, release: 2
  play 53, amp: 0.3, release: 2 if one_in(2)
  play 57, amp: 0.3, release: 2 if one_in(3)
  play 60, amp: 0.3, release: 2 if one_in(4)
  sleep 1.5
end
```

This will play chords of different numbers with the chance of each note
playing having a different probability.

5.4 Threads

# Threads

So you've made your killer bassline and a phat beat. How do you play
them at the same time? One solution is to weave them together manually -
play some bass, then a bit of drums, then more bass... However, the
timing soon gets hard to think about, especially when you start weaving
in more elements.

What if Sonic Pi could weave things for you automatically? Well, it can,
and you do it with a special thing called a *thread*.

## Infinite Loops

To keep this example simple, you'll have to imagine that this is a
phat beat and a killer bassline:

```
loop do
  sample :drum_heavy_kick
  sleep 1
end

loop do
  use_synth :fm
  play 40, release: 0.2
  sleep 0.5
end
```

As we've discussed previously, loops are like *black holes* for the
program. Once you enter a loop you can never exit from it until you hit
stop. How do we play both loops at the same time? We have to tell Sonic
Pi that we want to start something at the same time as the rest of the
code. This is where threads come to the rescue.

## Threads to the Rescue

```
in_thread do
  loop do
    sample :drum_heavy_kick
    sleep 1
  end
end

loop do
  use_synth :fm
  play 40, release: 0.2
  sleep 0.5
end
```

By wrapping the first loop in an `in_thread` do/end block we tell Sonic
Pi to run the contents of the do/end block at *exactly* the same time as
the next statement after the do/end block (which happens to be the
second loop). Try it and you'll hear both the drums and the bassline
weaved together!

Now, what if we wanted to add a synth on top. Something like:

```
in_thread do
  loop do
    sample :drum_heavy_kick
    sleep 1
  end
end

loop do
  use_synth :fm
  play 40, release: 0.2
  sleep 0.5
end

loop do
  use_synth :zawa
  play 52, release: 2.5, phase: 2, amp: 0.5
  sleep 2
end
```

Now we have the same problem as before. The first loop is played at the
same time as the second loop due to the `in_thread`. However, *the third
loop is never reached*. We therefore need another thread:

```
in_thread do
  loop do
    sample :drum_heavy_kick
    sleep 1
  end
end

in_thread do
  loop do
    use_synth :fm
    play 40, release: 0.2
    sleep 0.5
  end
end

loop do
  use_synth :zawa
  play 52, release: 2.5, phase: 2, amp: 0.5
  sleep 2
end
```

## Runs as threads

What may surprise you is that when you press the Run button, you're
actually creating a new thread for the code to run. This is why pressing
it multiple times will layer sounds over each other. As the runs
themselves are threads, they will automatically weave the sounds
together for you.

## Scope

As you learn how to master Sonic Pi, you'll learn that threads are the
most important building blocks for your music. One of the important jobs
they have is to isolate the notion of *current settings* from other
threads. What does this mean? Well, when you switch synths using
`use_synth` you're actually just switching the synth in the *current
thread* - no other thread will have their synth switched. Let's see this
in action:

```
play 50
sleep 1

in_thread do
  use_synth :tb303
  play 50
end

sleep 1
play 50
```

Notice how the middle sound was different to the others? The `use_synth`
statement only affected the thread it was in and not the outer main run
thread.

## Inheritance

When you create a new thread with `in_thread`, the new thread will
automatically inherit all of the current settings from the current
thread. Let's see that:

```
use_synth :tb303
play 50
sleep 1

in_thread do
  play 55
end
```

Notice how the second note is played with the `:tb303` synth even though
it was played from a separate thread? Any of the settings modified with
the various `use_*` functions will behave in the same way.

When threads are created, they inherit all the settings from their
parent but they don't share any changes back.

## Naming Threads

Finally, we can give our threads names:

```
in_thread(name: :bass) do
  loop do
    use_synth :prophet
    play chord(:e2, :m7).choose, release: 0.6
    sleep 0.5
  end
end

in_thread(name: :drums) do
  loop do
    sample :elec_snare
    sleep 1
  end
end
```

Look at the log pane when you run this code. See how the log reports the
name of the thread with the message?

```
[Run 36, Time 4.0, Thread :bass]
 |- synth :prophet, {release: 0.6, note: 47}
```

## Only One Thread per Name Allowed

One last thing to know about named threads is that only one thread of
a given name may be running at the same time. Let's explore this.
Consider the following code:

```
in_thread do
  loop do
    sample :loop_amen
    sleep sample_duration :loop_amen
  end
end
```

Go ahead and paste that into a buffer and press the Run button. Press
it again a couple of times. Listen to the cacophony of multiple amen
breaks looping out of time with each other. Ok, you can press Stop now.

This is the behaviour we've seen again and again - if you press the Run
button, sound layers on top of any existing sound. Therefore if you have
a loop and press the Run button three times, you'll have three layers of
loops playing simultaneously.

However, with named threads it is different:

```
in_thread(name: :amen) do
  loop do
    sample :loop_amen
    sleep sample_duration :loop_amen
  end
end
```

Try pressing the Run button multiple times with this code. You'll only
ever hear one amen break loop. You'll also see this in the log:

```
==> Skipping thread creation: thread with name :amen already exists.
```

Sonic Pi is telling you that a thread with the name `:amen` is already
playing, so it's not creating another.

This behaviour may not seem immediately useful to you now - but it will
be very handy when we start to live code...

5.5 Functions

# Functions

Once you start writing lots of code, you may wish to find a way to
organise and structure things to make them tidier and easier to
understand. Functions are a very powerful way to do this. They give us
the ability to give a name to a bunch of code. Let's take a look.

## Defining functions

```
define :foo do
  play 50
  sleep 1
  play 55
  sleep 2
end
```

Here, we've defined a new function called `foo`. We do this with our old
friend the do/end block and the magic word `define` followed by the name
we wish to give to our function. We didn't have to call it `foo`, we could
have called it anything we want such as `bar`, `baz` or ideally
something meaningful to you like `main_section` or `lead_riff`.

Remember to prepend a colon `:` to the name of your function when you define
it.

## Calling functions

Once we have defined our function we can call it by just writing its
name:

```
define :foo do
  play 50
  sleep 1
  play 55
  sleep 0.5
end

foo

sleep 1

2.times do
  foo
end
```

We can even use `foo` inside iteration blocks or anywhere we may have
written `play` or `sample`. This gives us a great way to express
ourselves and to create new meaningful words for use in our compositions.

## Functions are remembered across runs

So far, every time you've pressed the Run button, Sonic Pi has started
from a completely blank slate. It knows nothing except for what is in
the buffer. You can't reference code in another buffer or another
thread. However, functions change that. When you define a function,
Sonic Pi *remembers* it. Let's try it. Delete all the code in your
buffer and replace it with:

```
foo
```

Press the Run button - and hear your function play. Where did the code
go? How did Sonic Pi know what to play? Sonic Pi just remembered your
function - so even after you deleted it from the buffer, it
remembered what you had typed. This behaviour only works with functions
created using `define` (and `defonce`).

## Parameterised functions

You might be interested in knowing that just like you can pass min and
max values to `rrand`, you can teach your functions to accept
arguments. Let's take a look:

```
define :my_player do |n|
  play n
end

my_player 80
sleep 0.5
my_player 90
```

This isn't very exciting, but it illustrates the point. We've created
our own version of `play` called `my_player` which is parameterised.

The parameters need to go after the `do` of the `define` do/end block,
surrounded by vertical goalposts `|` and separated by commas `,`. You
may use any words you want for the parameter names.

The magic happens inside the `define` do/end block. You may use the
parameter names as if they were real values. In this example I'm playing
note `n`.  You can consider the parameters as a kind of promise that
when the code runs, they will be replaced with actual values. You do
this by passing a parameter to the function when you call it. I do this
with `my_player 80` to play note 80. Inside the function definition, `n`
is now replaced with 80, so `play n` turns into `play 80`. When I call
it again with `my_player 90`, `n` is now replaced with 90, so `play n`
turns into `play 90`.

Let's see a more interesting example:

```
define :chord_player do |root, repeats|
  repeats.times do
    play chord(root, :minor), release: 0.3
    sleep 0.5
  end
end

chord_player :e3, 2
sleep 0.5
chord_player :a3, 3
chord_player :g3, 4
sleep 0.5
chord_player :e3, 3
```

Here I used `repeats` as if it was a number in the line `repeats.times
do`. I also used `root` as if it was a note name in my call to `play`.

See how we're able to write something very expressive and easy to read
by moving a lot of our logic into a function!

5.6 Variables

# Variables

A useful thing to do in your code is to create names for things. Sonic
Pi makes this very easy, you write the name you wish to use, an equal
sign (`=`), then the thing you want to remember:

```
sample_name = :loop_amen
```

Here, we've 'remembered' the symbol `:loop_amen` in the variable
`sample_name`. We can now use `sample_name` everywhere we might have
used `:loop_amen`. For example:

```
sample_name = :loop_amen
sample sample_name
```

There are three main reasons for using variables in Sonic Pi:
communicating meaning, managing repetition and capturing the results
of things.

## Communicating Meaning

When you write code it's easy to just think you're telling the computer
how to do stuff - as long as the computer understands it's OK. However,
it's important to remember that it's not just the computer that reads
the code. Other people may read it too and try to understand what's going
on. Also, you're likely to read your own code in the future and try to
understand what's going on. Although it might seem obvious to you now -
it might not be so obvious to others or even your future self!

One way to help others understand what your code is doing is to write
comments (as we saw in a previous section). Another is to use meaningful
variable names. Look at this code:

```
sleep 1.7533
```

Why does it use the number `1.7533`? Where did this number come from?
What does it mean? However, look at this code:

```
loop_amen_duration = 1.7533
sleep loop_amen_duration
```

Now, it's much clearer what `1.7533` means: it's the duration of the
sample `:loop_amen`! Of course, you might say why not simply write:

```
sleep sample_duration(:loop_amen)
```

Which, of course, is a very nice way of communicating the intent of the
code.

## Managing Repetition

Often you see a lot of repetition in your code and when you want to
change things, you have to change it in a lot of places. Take a look at
this code:

```
sample :loop_amen
sleep sample_duration(:loop_amen)
sample :loop_amen, rate: 0.5
sleep sample_duration(:loop_amen, rate: 0.5)
sample :loop_amen
sleep sample_duration(:loop_amen)
```

We're doing a lot of things with `:loop_amen`! What if we wanted to
hear what it sounded like with another loop sample such as
`:loop_garzul`? We'd have to find and replace all `:loop_amen`s with
`:loop_garzul`. That might be fine if you have lots of time - but what
if you're performing on stage? Sometimes you don't have the luxury of
time - especially if you want to keep people dancing.

What if you'd written your code like this:

```
sample_name = :loop_amen
sample sample_name
sleep sample_duration(sample_name)
sample sample_name, rate: 0.5
sleep sample_duration(sample_name, rate: 0.5)
sample sample_name
sleep sample_duration(sample_name)
```

Now, that does exactly the same as above (try it). It also gives us
the ability to just change one line `sample_name = :loop_amen` to
`sample_name = :loop_garzul` and we change it in many places through
the magic of variables.

## Capturing Results

Finally, a good motivation for using variables is to capture the results
of things. For example, you may wish to do things with the duration of a
sample:

```
sd = sample_duration(:loop_amen)
```

We can now use `sd` anywhere we need the duration of the `:loop_amen`
sample.

Perhaps more importantly, a variable allows us to capture the result
of a call to `play` or `sample`:

```
s = play 50, release: 8
```

Now we have caught and remembered `s` as a variable, which allows us
to control the synth as it is running:

```
s = play 50, release: 8
sleep 2
control s, note: 62
```

We'll look into controlling synths in more detail in a later section.

5.7 Thread Synchronisation

# Thread Synchronisation

Once you have become sufficiently advanced live coding with a number of
functions and threads simultaneously, you've probably noticed that it's
pretty easy to make a mistake in one of the threads which kills
it. That's no big deal, because you can easily restart the thread by
hitting Run. However, when you restart the thread it is now *out of
time* with the original threads.

## Inherited Time

As we discussed earlier, new threads created with `in_thread` inherit
all of the settings from the parent thread. This includes the current
time. This means that threads are always in time with each other when
started simultaneously.

However, when you start a thread on its own it starts with its own
time which is unlikely to be in sync with any of the other currently
running threads.

## Cue and Sync

Sonic Pi provides a solution to this problem with the functions `cue`
and `sync`.

`cue` allows us to send out heartbeat messages to all other threads. By
default the other threads aren't interested and ignore these heartbeat
messages. However, you can easily register interest with the `sync`
function.

The important thing to be aware of is that `sync` is similar to
`sleep` in that it stops the current thread from doing anything for a
period of time. However, with `sleep` you specify how long you want to
wait while with `sync` you don't know how long you will wait - as
`sync` waits for the next `cue` from another thread which may be soon
or a long time away.

Let's explore this in a little more detail:

```
in_thread do
  loop do
    cue :tick
    sleep 1
  end
end

in_thread do
  loop do
    sync :tick
    sample :drum_heavy_kick
  end
end
```

Here we have two threads - one acting like a metronome, not playing any
sounds but sending out `:tick` heartbeat messages every beat. The
second thread is synchronising on `tick` messages and when it receives
one it inherits the time of the `cue` thread and continues running.

As a result, we will hear the `:drum_heavy_kick` sample exactly when
the other thread sends the `:tick` message, even if the two threads
didn't start their execution at the same time:

```
in_thread do
  loop do
    cue :tick
    sleep 1
  end
end

sleep(0.3)

in_thread do
  loop do
    sync :tick
    sample :drum_heavy_kick
  end
end
```

That naughty `sleep` call would typically make the second thread out
of phase with the first. However, as we're using `cue` and `sync`, we
automatically sync the threads bypassing any accidental timing
offsets.

## Cue Names

You are free to use whatever name you'd like for your `cue` messages -
not just `:tick`. You just need to ensure that any other threads are
`sync`ing on the correct name - otherwise they'll be waiting for ever
(or at least until you press the Stop button).

Let's play with a few `cue` names:

```
in_thread do
  loop do
    cue [:foo, :bar, :baz].choose
    sleep 0.5
  end
end

in_thread do
  loop do
    sync :foo
    sample :elec_beep
  end
end

in_thread do
  loop do
    sync :bar
    sample :elec_flip
  end
end

in_thread do
  loop do
    sync :baz
    sample :elec_blup
  end
end
```

Here we have a main `cue` loop which is randomly sending one of the
heartbeat names `:foo`, `:bar` or `:baz`. We then also have three loop
threads syncing on each of those names independently and then playing a
different sample. The net effect is that we hear a sound every 0.5
beats as each of the `sync` threads is randomly synced with the `cue`
thread and plays its sample.

This of course also works if you order the threads in reverse as the
`sync` threads will simply sit and wait for the next `cue`.

6 FX

# Studio FX

One of the most rewarding and fun aspects of Sonic Pi is the ability to
easily add studio effects to your sounds. For example, you may wish to
add some reverb to parts of your piece, or some echo or perhaps even
distort or wobble your basslines.

Sonic Pi provides a very simple yet powerful way of adding FX. It even
allows you to chain them (so you can pass your sounds through
distortion, then echo and then reverb) and also control each individual
FX unit with opts (in a similar way to giving params to synths and
samples). You can even modify the opts of the FX whilst it's still
running. So, for example, you could increase the reverb on your bass
throughout the track...

## Guitar Pedals

If all of this sounds a bit complicated, don't worry. Once you play
around with it a little, it will all become quite clear. Before you do
though, a simple analogy is that of guitar FX pedals. There are many
kinds of FX pedals you can buy. Some add reverb, others distort etc. A
guitarist will plug his or her guitar into one FX pedal -
i.e. distortion -, then take another cable and connect (chain) a
reverb pedal. The output of the reverb pedal can then be plugged into
the amplifier:

```
Guitar -> Distortion -> Reverb -> Amplifier
```

This is called FX chaining. Sonic Pi supports exactly
this. Additionally, each pedal often has dials and sliders to allow
you to control how much distortion, reverb, echo etc. to apply. Sonic
Pi also supports this kind of control. Finally, you can imagine a
guitarist playing whilst someone plays with the FX controls whilst
they're playing. Sonic Pi also supports this - but instead of needing
someone else to control things for you, that's where the computer
steps in.

Let's explore FX!

6.1 Adding FX

# Adding FX

In this section we'll look at a couple of FX: reverb and echo. We'll
see how to use them, how to control their opts and how to chain
them.

Sonic Pi's FX system uses blocks. So if you haven't read section 5.1 you
might want to take a quick look and then head back.

## Reverb

If we want to use reverb we write `with_fx :reverb` as the special code
to our block like this:

```
with_fx :reverb do
  play 50
  sleep 0.5
  sample :elec_plip
  sleep 0.5
  play 62
end
```

Now play this code and you'll hear it played with reverb. It sounds
good, doesn't it! Everything sounds pretty nice with reverb.

Now let's look what happens if we have code outside the do/end block:

```
with_fx :reverb do
  play 50
  sleep 0.5
  sample :elec_plip
  sleep 0.5
  play 62
end

sleep 1
play 55
```

Notice how the final `play 55` isn't played with reverb. This is because
it is *outside* the do/end block, so it isn't captured by the reverb FX.

Similarly, if you make sounds before the do/end block, they also won't
be captured:

```
play 55
sleep 1

with_fx :reverb do
  play 50
  sleep 0.5
  sample :elec_plip
  sleep 0.5
  play 62
end

sleep 1
play 55
```

## Echo

There are many FX to choose from. How about some echo?

```
with_fx :echo do
  play 50
  sleep 0.5
  sample :elec_plip
  sleep 0.5
  play 62
end
```

One of the powerful aspects of Sonic Pi's FX blocks is that they may be
passed opts similar to opts we've already seen with `play`
and `sample`. For example a fun echo opt to play with is `phase:`
which represents the duration of a given echo in beats. Let's make the
echo slower:

```
with_fx :echo, phase: 0.5 do
  play 50
  sleep 0.5
  sample :elec_plip
  sleep 0.5
  play 62
end
```

Let's also make the echo faster:

```
with_fx :echo, phase: 0.125 do
  play 50
  sleep 0.5
  sample :elec_plip
  sleep 0.5
  play 62
end
```

Let's make the echo take longer to fade away by setting the `decay:`
time to 8 beats:

```
with_fx :echo, phase: 0.5, decay: 8 do
  play 50
  sleep 0.5
  sample :elec_plip
  sleep 0.5
  play 62
end
```

## Nesting FX

One of the most powerful aspects of the FX blocks is that you can nest
them. This allows you to very easily chain FX together. For example,
what if you wanted to play some code with echo and then with reverb?
Easy, just put one inside the other:

```
with_fx :reverb do
  with_fx :echo, phase: 0.5, decay: 8 do
    play 50
    sleep 0.5
    sample :elec_blup
    sleep 0.5
    play 62
  end
end
```

Think about the audio flowing from the inside out. The sound of all
the code within the inner do/end block such as `play 50` is first sent
to the echo FX and the sound of the echo FX is in turn sent out to the
reverb FX.

We may use very deep nestings for crazy results. However, be warned, the
FX can use a lot of resources and when you nest them you're effectively
running multiple FX simultaneously. So be sparing with your use of FX
especially on low powered platforms such as the Raspberry Pi.

## Discovering FX

Sonic Pi ships with a large number of FX for you to play with. To find
out which ones are available, click on FX in the far left of this help
system and you'll see a list of available options. Here's a list of
some of my favourites:

* wobble,
* reverb,
* echo,
* distortion,
* slicer

Now go crazy and add FX everywhere for some amazing new sounds!

6.2 FX in Practice

# FX in Practice

Although they look deceptively simple on the outside, FX are actually
quite complex beasts internally. Their simplicity often entices people
to overuse them in their pieces. This may be fine if you have a
powerful machine, but if - like me - you use a Raspberry Pi to jam
with, you need to be careful about how much work you ask it to do if
you want to ensure the beats keep flowing.

Consider this code:

```
loop do
  with_fx :reverb do
    play 60, release: 0.1
    sleep 0.125
  end
end
```

In this code we're playing note 60 with a very short release time, so
it's a short note. We also want reverb so we've wrapped it in a reverb
block. All good so far. Except...

Let's look at what the code does. First we have a `loop` which means
everything inside of it is repeated forever. Next we have a `with_fx`
block. This means we will create a new reverb FX *every time we
loop*. This is like having a separate FX reverb pedal for every time you
pluck a string on a guitar. It's cool that you can do this, but it's not
always what you want. For example, this code will struggle to run nicely
on a Raspberry Pi. All the work of creating the reverb and then waiting
until it needs to be stopped and removed is all handled by `with_fx` for
you, but this takes CPU power which may be precious.

How do we make it more similar to a traditional setup where our
guitarist has just *one* reverb pedal which all sounds pass through?
Simple:

```
with_fx :reverb do
  loop do
    play 60, release: 0.1
    sleep 0.125
  end
end
```

We put our loop *inside* the `with_fx` block. This way we only create
a single reverb for all notes played in our loop. This code is a lot
more efficient and would work fine on a Raspberry Pi.

A compromise is to use `with_fx` over an iteration within a loop:

```
loop do
  with_fx :reverb do
    16.times do
      play 60, release: 0.1
      sleep 0.125
    end
  end
end
```

This way we've lifted the `with_fx` out of the inner part of the `loop`
and we're now creating a new reverb every 16 notes.

This is such a common pattern that `with_fx` supports an opt to do
exactly this but without having to write the `16.times` block:

```
loop do
  with_fx :reverb, reps: 16 do
    play 60, release: 0.1
    sleep 0.125
  end
end
```

Both the `reps: 16` and `16.times do` examples will behave
identically. The `reps: 16` essentially repeats the code in the `do/end`
block 16 times so you can use them both interchangeably and choose the
one that feels best for you.

Remember, there are no mistakes, just possibilities. However, some of
these approaches will have a different sound and also different
performance characteristics. So play around and use the approach that
sounds best to you whilst also working within the performance
constraints of your platform.

7 Control

# Controlling running sounds

So far we've looked at how you can trigger synths and samples, and
also how to change their default opts such as amplitude, pan,
envelope settings and more. Each sound triggered is essentially its
own sound with its own list of options set for the duration of the
sound.

Wouldn't it also be cool if you could change a sound's opts whilst it's
still playing, just like you might bend a string of a guitar whilst it's
still vibrating?

You're in luck - this section will show you how to do exactly this.

7.1 Controlling Running Synths

# Controlling Running Synths

So far we've only concerned ourselves with triggering new sounds and
FX. However, Sonic Pi gives us the ability to manipulate and control
currently running sounds. We do this by using a variable to capture a
reference to a synth:

```
s = play 60, release: 5
```

Here, we have a run-local variable `s` which represents the synth
playing note 60. Note that this is *run-local* - you can't access it
from other runs like functions.

Once we have `s`, we can start controlling it via the `control`
function:

```
s = play 60, release: 5
sleep 0.5
control s, note: 65
sleep 0.5
control s, note: 67
sleep 3
control s, note: 72
```

The thing to notice is that we're not triggering 4 different synths here
- we're just triggering one synth and then change the pitch 3 times
afterwards, while it's playing.

We can pass any of the standard opts to `control`, so you can
control things like `amp:`, `cutoff:` or `pan:`.

## Non-controllable Options

Some of the opts can't be controlled once the synth has started. This is
the case for all the ADSR envelope parameters. You can find out which
opts are controllable by looking at their documentation in the
help system. If the documentation says *Can not be changed once set*,
you know it's not possible to control the opt after the synth has
started.

7.2 Controlling FX

# Controlling FX

It is also possible to control FX, although this is achieved in a
slightly different way:

```
with_fx :reverb do |r|
  play 50
  sleep 0.5
  control r, mix: 0.7
  play 55
  sleep 1
  control r, mix: 0.9
  sleep 1
  play 62
end
```

Instead of using a variable, we use the goalpost parameters of the
do/end block. Inside the `|` bars, we need to specify a unique name
for our running FX which we then reference from the containing do/end
block. This behaviour is identical to using parameterised functions.

Now go and control some synths and FX!

7.3 Sliding Options

# Sliding Opts

Whilst exploring the synth and FX opts, you might have noticed that
there are a number of opts ending with `_slide`. You might have
even tried calling them and seeing no effect. This is because they're
not normal parameters, they're special opts that only work when
you control synths as introduced in the previous section.

Consider the following example:

```
s = play 60, release: 5
sleep 0.5
control s, note: 65
sleep 0.5
control s, note: 67
sleep 3
control s, note: 72
```

Here, you can hear the synth pitch changing immediately on each
`control` call. However, we might want the pitch to slide between
changes. As we're controlling the `note:` parameter, to add slide, we
need to set the `note_slide` parameter of the synth:

```
s = play 60, release: 5, note_slide: 1
sleep 0.5
control s, note: 65
sleep 0.5
control s, note: 67
sleep 3
control s, note: 72
```

Now we hear the notes being bent between the `control` calls. It
sounds nice, doesn't it? You can speed up the slide by using a shorter
time such as `note_slide: 0.2` or slow it down by using a longer slide
time.

Every parameter that can be controlled has a corresponding `_slide`
parameter for you to play with.

## Sliding is sticky

Once you've set a `_slide` parameter on a running synth, it will be
remembered and used every time you slide the corresponding
parameter. To stop sliding you must set the `_slide` value to 0 before
the next `control` call.

## Sliding FX Opts

It is also possible to slide FX opts:

```
with_fx :wobble, phase: 1, phase_slide: 5 do |e|
  use_synth :dsaw
  play 50, release: 5
  control e, phase: 0.025
end
```

Now have fun sliding things around for smooth transitions and flowing
control...

8 Data Structures

# Data Structures

A very useful tool in a programmer's toolkit is a data structure.

Sometimes you may wish to represent and use more than one thing. For
example, you may find it useful to have a series of notes to play one
after another. Programming languages have data structures to allow you
do exactly this.

There are many exciting and exotic data structures available to
programmers - and people are always inventing new ones. However, for now
we only really need to consider a very simple data structure - the list.

Let's look at it in more detail. We'll cover its basic form and then
also how lists can be used to represent scales and chords.

8.1 Lists

# Lists

In this section we'll take a look at a data structure which is very
useful - the list. We met it very briefly before in the section on
randomisation when we randomly chose from a list of notes to play:

```
play choose([50, 55, 62])
```

In this section we'll explore using lists to also represent chords
and scales. First let's recap how we might play a chord. Remember that
if we don't use `sleep`, sounds all happen at the same time:

```
play 52
play 55
play 59
```

Let's look at other ways to represent this code.

## Playing a List

One option is to place all the notes in a list: `[52, 55, 59]`. Our
friendly `play` function is smart enough to know how to play a list of
notes. Try it:

```
play [52, 55, 59]
```

Ooh, that's already nicer to read. Playing a list of notes doesn't stop
you from using any of the parameters as normal:

```
play [52, 55, 59], amp: 0.3
```

Of course, you can also use the traditional note names instead of the
MIDI numbers:

```
play [:E3, :G3, :B3]
```

Now those of you lucky enough to have studied some music theory might
recognise that chord as *E Minor* played in the 3rd octave.

## Accessing a List

Another very useful feature of a list is the ability to get information
out of it. This may sound a bit strange, but it's no more complicated
than someone asking you to turn a book to page 23. With a list, you'd
say, what's the element at index 23? The only strange thing is that in
programming indexes usually start at 0 not 1.

With list indexes we don't count 1, 2, 3... Instead we count 0, 1, 2...

Let's look at this in a little more detail. Take a look at this list:

```
[52, 55, 59]
```

There's nothing especially scary about this. Now, what's the second
element in that list? Yes, of course, it's `55`. That was easy. Let's
see if we can get the computer to answer it for us too:

```
puts [52, 55, 59][1]
```

OK, that looks a bit weird if you've never seen anything like it
before. Trust me though, it's not too hard. There are three parts to the
line above: the word `puts` , our list `52, 55, 59` and our index
`[1]`. Firstly we're saying `puts` because we want Sonic Pi to print the
answer out for us in the log. Next, we're giving it our list, and
finally our index is asking for the second element. We need to surround
our index with square brackets and because counting starts at `0`, the
index for the second element is `1`. Look:

```
# indexes:  0   1   2
           [52, 55, 59]
```

Try running the code `puts [52, 55, 59][1]` and you'll see `55` pop up
in the log. Change the index `1` to other indexes, try longer lists and
think about how you might use a list in your next code jam. For example,
what musical structures might be represented as a series of numbers...






8.2 Chords

# Chords

Sonic Pi has built-in support for chord names which will return
lists. Try it for yourself:

```
play chord(:E3, :minor)
```

Now, we're really getting somewhere. That looks a lot more pretty than
the raw lists (and is easier to read for other people). So what other
chords does Sonic Pi support? Well, a *lot*. Try some of these:

* `chord(:E3, :m7)`
* `chord(:E3, :minor)`
* `chord(:E3, :dim7)`
* `chord(:E3, :dom7)`

## Arpeggios

We can easily turn chords into arpeggios with the function
`play_pattern`:

```
play_pattern chord(:E3, :m7)
```

Ok, that's not so fun - it played it really slowly. `play_pattern` will
play each note in the list separated with a call to `sleep 1` between
each call to `play`. We can use another function `play_pattern_timed` to
specify our own timings and speed things up:

```
play_pattern_timed chord(:E3, :m7), 0.25
```

We can even pass a list of times which it will treat as a circle of
times:

```
play_pattern_timed chord(:E3, :m13), [0.25, 0.5]
```

This is the equivalent to:

```
play 52
sleep 0.25
play 55
sleep 0.5
play 59
sleep 0.25
play 62
sleep 0.5
play 66
sleep 0.25
play 69
sleep 0.5
play 73
```

Which would you prefer to write?

8.3 Scales

# Scales

Sonic Pi has support for a wide range of scales. How about
playing a C3 major scale?

```
play_pattern_timed scale(:c3, :major), 0.125, release: 0.1
```

We can even ask for more octaves:

```
play_pattern_timed scale(:c3, :major, num_octaves: 3), 0.125, release: 0.1
```

How about all the notes in a pentatonic scale?

```
play_pattern_timed scale(:c3, :major_pentatonic, num_octaves: 3), 0.125, release: 0.1
```

## Random notes

Chords and scales are great ways of constraining a random choice to
something meaningful. Have a play with this example which picks random
notes from the chord E3 minor:

```
use_synth :tb303
loop do
  play choose(chord(:E3, :minor)), release: 0.3, cutoff: rrand(60, 120)
  sleep 0.25
end
```

Try switching in different chord names and cutoff ranges.

## Discovering Chords and Scales

To find out which scales and chords are supported by Sonic Pi simply
click the Lang button on the far left of this tutorial and then choose
either chord or scale in the API list. In the information in the main
panel, scroll down until you see a long list of chords or scales
(depending on which you're looking at).

Have fun and remember: there are no mistakes, only opportunities.

8.4 Rings

# Rings

An interesting spin on standard lists are rings. If you know some
programming, you might have come across ring buffers or ring
arrays. Here, we'll just go for ring - it's short and simple.

In the previous section on lists we saw how we could fetch elements out
of them by using the indexing mechanism:

```
puts [52, 55, 59][1]
```

Now, what happens if you want index `100`? Well, there's clearly no
element at index 100 as the list has only three elements in it. So Sonic
Pi will return you `nil` which means nothing.

However, consider you have a counter such as the current beat which
continually increases. Let's create our counter and our list:

```
counter = 0
notes = [52, 55, 59]
```

We can now use our counter to access a note in our list:

```
puts notes[counter]
```

Great, we got `52`. Now, let's increment our counter and get another
note:

```
counter = (inc counter)
puts notes[counter]
```

Super, we now get `55` and if we do it again we get `59`. However, if we
do it again, we'll run out of numbers in our list and get `nil`. What if
we wanted to just loop back round and start at the beginning of the list
again? This is what rings are for.

## Creating Rings

We can create rings one of two ways. Either we use the `ring` function
with the elements of the ring as parameters:

```
(ring 52, 55, 59)
```

Or we can take a normal list and convert it to a ring by sending it the
`.ring` message:

```
[52, 55, 59].ring
```

## Indexing Rings

Once we have a ring, you can use it in exactly the same way you would
use a normal list with the exception that you can use indexes that are
negative or larger than the size of the ring and they'll wrap round to
always point at one of the ring's elements:

```
(ring 52, 55, 59)[0] #=> 52
(ring 52, 55, 59)[1] #=> 55
(ring 52, 55, 59)[2] #=> 59
(ring 52, 55, 59)[3] #=> 52
(ring 52, 55, 59)[-1] #=> 59
```

## Using Rings

Let's say we're using a variable to represent the current beat
number. We can use this as an index into our ring to fetch notes to
play, or release times or anything useful we've stored in our ring
regardless of the beat number we're currently on.

## Scales and Chords are Rings

A useful thing to know is that the lists returned by `scale` and `chord`
are also rings and allow you to access them with arbitrary indexes.

## Ring Constructors

In addition to `ring` there are a number of other functions which will
construct a ring for us.

* `range` invites you specify a starting point, end point and step size.
* `bools` allows you to use `1`s and `0`s to succinctly represent booleans.
* `knit` allows you to knit a sequence of repeated values.
* `spread` creates a ring of bools with a Euclidean distribution.

Take a look at their respective documentation for more information.


8.5 Ring Chains

# Ring Chains

In addition to the constructors such as `range` and `spread` another way
of creating new rings is to manipulate existing rings.


## Chain Commands

To explore this, take a simple ring:

```
(ring 10, 20, 30, 40, 50)
```

What if we wanted it backwards? Well we'd use the chain command
`.reverse` to take the ring and turn it around:

```
(ring 10, 20, 30, 40, 50).reverse  #=> (ring 50, 40, 30, 20, 10)
```

Now, what if we wanted the first three values from the ring?

```
(ring 10, 20, 30, 40, 50).take(3)  #=> (ring 10, 20, 30)
```

Finally, what if we wanted to shuffle the ring?

```
(ring 10, 20, 30, 40, 50).shuffle  #=> (ring 40, 30, 10, 50, 20)
```

## Multiple Chains

This is already a powerful way of creating new rings. However, the
*real* power comes when you chain a few of these commands together.

How about shuffling the ring, dropping 1 element and then taking the next 3?

Let's take this in stages:

1. `(ring 10, 20, 30, 40, 50)` - our initial ring
2. `(ring 10, 20, 30, 40, 50).shuffle` - shuffles - `(ring 40, 30, 10, 50, 20)`
3. `(ring 10, 20, 30, 40, 50).shuffle.drop(1)` - drop 1 - `(ring 30, 10, 50, 20)`
4. `(ring 10, 20, 30, 40, 50).shuffle.drop(1).take(3)` - take 3 - `(ring 30, 10, 50)`

Can you see how we can just create a long chain of these methods by just
*sticking them together*. We can combine these in any order we want
creating an extremely rich and powerful way of generating new rings from
existing ones.

## Immutability

These rings have a powerful and important property. They are immutable
which means that they can not change. This means that the chaining
methods described in this section *do not change rings* rather they
*create new rings*. This means you're free to share rings across threads
and start chaining them within a thread knowing you won't be affecting
any other thread using the same ring.

## Available Chain Methods

Here's a list of the available chain methods for you to play with:

* `.reverse` - returns a reversed version of the ring
* `.sort`    - creates a sorted version of the ring
* `.shuffle` - creates a shuffled version of the ring
* `.pick(3)` - returns a ring with the results of calling `.choose` 3 times
* `.pick`    - similar to `.pick(3)` only the size defaults to the same as the original ring
* `.take(5)` - returns a new ring containing only the first 5 elements
* `.drop(3)` - returns a new ring with everything but the first 3 elements
* `.butlast` - returns a new ring with the last element missing
* `.drop_last(3)` - returns a new ring with the last 3 elements missing
* `.take_last(6)`- returns a new ring with only the last 6 elements
* `.stretch(2)` - repeats each element in the ring twice
* `.repeat(3)` - repeats the entire ring 3 times
* `.mirror` - adds the ring to a reversed version of itself
* `.reflect` - same as mirror but doesn't duplicate middle value

Of course, those chain methods that take numbers can take other numbers
too! So feel free to call `.drop(5)` instead of `.drop(3)` if you want
to drop the first 5 elements.

9 Live Coding

# Live Coding

One of the most exciting aspects of Sonic Pi is that it enables you to
write and modify code live to make music, just like you might perform
live with a guitar. One advantage of this approach is to give you more
feedback whilst composing (get a simple loop running and keep tweaking
it till it sounds just perfect). However, the main advantage is that you
can take Sonic Pi on stage and gig with it.

In this section we'll cover the fundamentals of turning your static code
compositions into dynamic performances.

Hold on to your seats...

9.1 Live Coding Fundamentals

# Live Coding

Now we've learned enough to really start having some fun. In this
section we'll draw from all the previous sections and show you how you
can start making your music compositions live and turning them into a
performance. For that we'll need 3 main ingredients:

* An ability to write code that makes sounds - CHECK!
* An ability to write functions - CHECK!
* An ability to use (named) threads - CHECK!

Alrighty, let's get started. Let's live code our first sounds. We first
need a function containing the code we want to play. Let's start
simple. We also want to loop calls to that function in a thread:

```
define :my_loop do
  play 50
  sleep 1
end

in_thread(name: :looper) do
  loop do
    my_loop
  end
end
```

If that looks a little too complicated to you, go back and re-read the
sections on functions and threads. It's not too complicated if you've
already wrapped your head around these things.

What we have here is a function definition which just plays note 50 and
sleeps for a beat. We then define a named thread called `:looper`
which just loops around calling `my_loop` repeatedly.

If you run this code, you'll hear note 50 repeating again and again...

## Changing it up

Now, this is where the fun starts. Whilst the code is *still running*
change 50 to another number, say 55, then press the Run button
again. Woah! It changed! Live!

It didn't add a new layer because we're using named threads which only
allow one thread for each name. Also, the sound changed because we
*redefined* the function. We gave `:my_loop` a new definition. When the
`:looper` thread looped around it simply called the new definition.

Try changing it again, change the note, change the sleep time. How about
adding a `use_synth` statement? For example, change it to:

```
define :my_loop do
  use_synth :tb303
  play 50, release: 0.3
  sleep 0.25
end
```

Now it sounds pretty interesting, but we can spice it up
further. Instead of playing the same note again and again, try playing
a chord:

```
define :my_loop do
  use_synth :tb303
  play chord(:e3, :minor), release: 0.3
  sleep 0.5
end
```

How about playing random notes from the chord:

```
define :my_loop do
  use_synth :tb303
  play choose(chord(:e3, :minor)), release: 0.3
  sleep 0.25
end
```

Or using a random cutoff value:

```
define :my_loop do
  use_synth :tb303
  play choose(chord(:e3, :minor)), release: 0.2, cutoff: rrand(60, 130)
  sleep 0.25
end
```

Finally, add some drums:

```
define :my_loop do
  use_synth :tb303
  sample :drum_bass_hard, rate: rrand(0.5, 2)
  play choose(chord(:e3, :minor)), release: 0.2, cutoff: rrand(60, 130)
  sleep 0.25
end
```

Now things are getting exciting!

However, before you jump up and start live coding with functions and
threads, stop what you're doing and read the next section on
`live_loop` which will change the way you code in Sonic Pi forever...

9.2 Live Loops

# Live Loops

Ok, so this section of the tutorial is the real gem. If you only read
one section, it should be this one. If you read the previous section
on Live Coding Fundamentals, `live_loop` is a simple way of doing
exactly that but without having to write so much.

If you didn't read the previous section, `live_loop` is the best way to
jam with Sonic Pi.

Let's play. Write the following in a new buffer:

```
live_loop :foo do
  play 60
  sleep 1
end
```

Now press the Run button. You hear a basic beep every beat. Nothing
fun there. However, don't press Stop just yet. Change the `60` to `65`
and press Run again.

Woah! It changed *automatically* without missing a beat. This is live coding.

Why not change it to be more bass like? Just update your code whilst it's playing:

```
live_loop :foo do
  use_synth :prophet
  play :e1, release: 8
  sleep 8
end
```

Then hit Run.

Let's make the cutoff move around:

```
live_loop :foo do
  use_synth :prophet
  play :e1, release: 8, cutoff: rrand(70, 130)
  sleep 8
end
```

Hit Run again.

Add some drums:

```
live_loop :foo do
  sample :loop_garzul
  use_synth :prophet
  play :e1, release: 8, cutoff: rrand(70, 130)
  sleep 8
end
```

Change the note from `e1` to `c1`:

```
live_loop :foo do
  sample :loop_garzul
  use_synth :prophet
  play :c1, release: 8, cutoff: rrand(70, 130)
  sleep 8
end
```

Now stop listening to me and play around yourself! Have fun!

9.3 Multiple Live Loops

# Multiple Live Loops

Consider the following live loop:

```
live_loop :foo do
  play 50
  sleep 1
end
```

You may have wondered why it needs the name `:foo`. This name is
important because it signifies that this live loop is different from all
other live loops.

*There can never be two live loops running with the same name*.

This means that if we want multiple concurrently running live loops, we
just need to give them different names:

```
live_loop :foo do
  use_synth :prophet
  play :c1, release: 8, cutoff: rrand(70, 130)
  sleep 8
end

live_loop :bar do
  sample :bd_haus
  sleep 0.5
end
```

You can now update and change each live loop independently and it all
just works.

## Syncing Live Loops

One thing you might have already noticed is that live loops work
automatically with the thread cue mechanism we explored
previously. Every time the live loop loops, it generates a new `cue`
event with the name of the live loop. We can therefore `sync` on these
cues to ensure our loops are in sync without having to stop anything.

Consider this badly synced code:

```
live_loop :foo do
  play :e4, release: 0.5
  sleep 0.4
end

live_loop :bar do
  sample :bd_haus
  sleep 1
end
```

Let's see if we can fix the timing and sync without stopping it. First,
let's fix the `:foo` loop to make the sleep a factor of 1 - something like
`0.5` will do:

```
live_loop :foo do
  play :e4, release: 0.5
  sleep 0.5
end

live_loop :bar do
  sample :bd_haus
  sleep 1
end
```

We're not quite finished yet though - you'll notice that the beats don't
quite line up correctly. This is because the loops are *out of
phase*. Let's fix that by syncing one to the other:

```
live_loop :foo do
  play :e4, release: 0.5
  sleep 0.5
end

live_loop :bar do
  sync :foo
  sample :bd_haus
  sleep 1
end
```

Wow, everything is now perfectly in time - all without stopping.

Now, go forth and live code with live loops!

9.4 Ticking

# Ticking

Something you'll likely find yourself doing a lot when live coding is
looping through rings. You'll be putting notes into rings for melodies,
sleeps for rhythms, chord progressions, timbral variations, etc. etc.

## Ticking Rings

Sonic Pi provides a *very* handy tool for working with rings within
`live_loop`s. It's called the tick system. In the section about the
rings we were talking about the counter that is constantly increasing,
like a current beat number. Tick just implements this idea. It provides
you with the ability to *tick through rings*. Let's look at an example:

```
counter = 0
live_loop :arp do
  play (scale :e3, :minor_pentatonic)[counter], release: 0.1
  counter += 1
  sleep 0.125
end
```

This is equivalent to:

```
live_loop :arp do
  play (scale :e3, :minor_pentatonic).tick, release: 0.1
  sleep 0.125
end
```

Here, we're just grabbing the scale E3 minor pentatonic and ticking
through each element. This is done by adding `.tick` to the end of the
scale declaration. This tick is local to the live loop, so each live
loop can have its own independent tick:

```
live_loop :arp do
  play (scale :e3, :minor_pentatonic).tick, release: 0.1
  sleep 0.125
end

live_loop :arp2 do
  use_synth :dsaw
  play (scale :e2, :minor_pentatonic, num_octaves: 3).tick, release: 0.25
  sleep 0.25
end
```

## Tick

You can also call `tick` as a standard fn and use the value as an index:

```
live_loop :arp do
  idx = tick
  play (scale :e3, :minor_pentatonic)[idx], release: 0.1
  sleep 0.125
end
```

However, it is much nicer to call `.tick` at the end. The `tick` fn is
for when you want to do fancy things with the tick value and for when
you want to use ticks for other things than indexing into rings.


## Look

The magical thing about tick is that not only does it return a new index
(or the value of the ring at that index) it also makes sure that next
time you call tick, it's the next value. Take a look at the examples in
the docs for `tick` for many ways of working with this. However, for
now, it's important to point out that sometimes you'll want to just look
at the current tick value and *not increase* it. This is available via
the `look` fn. You can call `look` as a standard fn or by adding `.look`
to the end of a ring.

## Naming Ticks

Finally, sometimes you'll need more than one tick per live loop. This
is achieved by giving your tick a name:

```
live_loop :arp do
  play (scale :e3, :minor_pentatonic).tick(:foo), release: 0.1
  sleep (ring 0.125, 0.25).tick(:bar)
end
```

Here we're using two ticks one for the note to play and another for the
sleep time. As they're both in the same live loop, to keep them separate
we need to give them unique names. This is exactly the same kind of
thing as naming `live_loop`s - we just pass a symbol prefixed with a
`:`. In the example above we called one tick `:foo` and the other
`:bar`. If we want to `look` at these we also need to pass the name of
the tick to `look`.

## Don't make it too complicated

Most of the power in the tick system isn't useful when you get
started. Don't try and learn everything in this section. Just focus on
ticking through a single ring. That'll give you most of the joy and
simplicity of ticking through rings in your `live_loop`s.

Take a look at the documentation for `tick` where there are many useful
examples and happy ticking!

10 Essential Knowledge

# Essential Knowledge

This section will cover some very useful - in fact *essential* - knowledge
for getting the most out of your Sonic Pi experience.

We'll cover how to take advantage of the many keyboard shortcuts
available to you, how to share your work and some tips on performing
with Sonic Pi.

10.1 Using Shortcuts

# Using Shortcuts

Sonic Pi is as much an instrument as a coding environment. Shortcuts can
therefore make playing Sonic Pi much more *efficient and natural* -
especially when you're playing live in front of an audience.

Much of Sonic Pi can be controlled through the keyboard. As you gain
more familiarity working and performing with Sonic Pi, you'll likely
start using the shortcuts more and more. *I personally touch-type* (I
recommend you consider learning too) and find myself frustrated whenever
I need to reach for the mouse as it slows me down. I therefore use all
of these shortcuts on a very regular basis!

Therefore, if you learn the shortcuts, you'll learn to use your keyboard
effectively and you'll be live coding like a pro in no time.

However, *don't try and learn them all at once*, just try and remember the
ones you use most and then keep adding more to your practice.

## Consistency across Platforms

Imagine you're learning the clarinet. You'd expect all clarinets of
all makes to have similar controls and fingerings. If they didn't, you'd
have a tough time switching between different clarinets and you'd be
stuck to using just one make.

Unfortunately the three major operating systems (Linux, Mac OS X and
Windows) come with their own standard defaults for actions such as cut
and paste etc. Sonic Pi will try and honour these standards. However
*priority is placed on consistency across platforms* within Sonic Pi
rather than attempting to conform to a given platform's standards. This
means that when you learn the shortcuts whilst playing with Sonic Pi on
your Raspberry Pi, you can move to the Mac or PC and feel right at home.

## Control and Meta

Part of the notion of consistency is the naming of shortcuts. In Sonic
Pi we use the names *Control* and *Meta* to refer to the two main
combination keys. On all platforms *Control* is the same. However, on
Linux and Windows, *Meta* is actually the *Alt* key while on Mac *Meta* is
the *Command* key. For consistency we'll use the term *Meta* - just
remember to map that to the appropriate key on your operating system.

## Abbreviations

To help keep things simple and readable, we'll use the abbreviations *C-*
for *Control* plus another key and *M-* for *Meta* plus another key. For
example, if a shortcut requires you to hold down both *Meta* and *r*
we'll write that as `M-r`. The *-* just means "at the same time as."

The following are some of the shortcuts I find most useful.

## Stopping and starting

Instead of always reaching for the mouse to run your code, you can
simply press `M-r`. Similarly, to stop running code you can press `M-s`.

## Navigation

I'm really lost without the navigation shortcuts. I therefore highly
recommend you spend the time to learn them. These shortcuts also work
extremely well when you've learned to touch type as they use the
standard letters rather than requiring you to move your hand to the
mouse or the arrow keys on your keyboard.

You can move to the beginning of the line with `C-a`, the end of the
line with `C-e`, up a line with `C-p`, down a line with `C-n`, forward a
character with `C-f`, and back a character with `C-b`. You can even
delete all the characters from the cursor to the end of the line with
`C-k`.

## Tidy Code

To auto-align your code simply press `M-m`.

## Help System

To toggle the help system you can press `M-i`. However, a much more
useful shortcut to know is `C-i` which will look up the word underneath
the cursor and display the docs if it finds anything. Instant help!

For a full list take a look at section 10.2 Shortcut Cheatsheet.

10.2 Shortcut Cheatsheet

# Shortcut Cheatsheet

The following is a summary of the main shortcuts available within Sonic
Pi. Please see Section 10.1 for motivation and background.

## Conventions

In this list, we use the following conventions (where *Meta* is one of *Alt* on
Windows/Linux or *Cmd* on Mac):

* `C-a`   means hold the *Control* key then press the *a* key whilst holding them both at the same time, then releasing.
* `M-r`   means hold the *Meta* key and then press the *r* key whilst holding them both at the same time, then releasing.
* `S-M-z` means hold the *Shift* key, then the *Meta* key, then finally the *z* key all at the same time, then releasing.
* `C-M-f` means hold the *Control* key, then press *Meta* key, finally the *f* key all at the same time, then releasing.

## Main Application Manipulation

* `M-r`     - Run code
* `M-s`     - Stop code
* `M-i`     - Toggle Help System
* `M-p`     - Toggle Preferences
* `M-{`     - Switch buffer to the left
* `M-}`     - Switch buffer to the right
* `M-+`     - Increase text size of current buffer
* `M--`     - Decrease text size of current buffer


## Selection/Copy/Paste

* `M-a`     - Select all
* `M-c`     - Copy selection to paste buffer
* `M-]`     - Copy selection to paste buffer
* `M-x`     - Cut selection to paste buffer
* `C-]`     - Cut selection to paste buffer
* `C-k`     - Cut to the end of the line
* `M-v`     - Paste from paste buffer to editor
* `C-y`     - Paste from paste buffer to editor
* `C-SPACE` - Set mark. Navigation will now manipulate highlighted region. Use `C-g` to escape.

## Text Manipulation

* `M-m`     - Align all text
* `Tab`     - Align current line or selection (or select autocompletion)
* `C-l`     - Centre editor
* `M-/`     - Comment/Uncomment current line or selection
* `C-t`     - Transpose/swap characters
* `M-u`     - Convert next word (or selection) to upper case.
* `M-l`     - Convert next word (or selection) to lower case.

## Navigation

* `C-a`     - Move to beginning of line
* `C-e`     - Move to end of line
* `C-p`     - Move to previous line
* `C-n`     - Move to next line
* `C-f`     - Move forward one character
* `C-b`     - Move backward one character
* `M-f`     - Move forward one word
* `M-b`     - Move backward one word
* `C-M-n`   - Move line or selection down
* `C-M-p`   - Move line or selection up
* `S-M-u`   - Move up 10 lines
* `S-M-d`   - Move down 10 lines
* `M-<`     - Move to beginning of buffer
* `M->`     - Move to end of buffer

## Deletion

* `C-h`     - Delete previous character
* `C-d`     - Delete next character

## Advanced Editor Features

* `C-i`     - Show docs for word under cursor
* `M-z`     - Undo
* `S-M-z`   - Redo
* `C-g`     - Escape
* `S-M-f`   - Toggle fullscreen mode
* `S-M-b`   - Toggle visibility of buttons
* `S-M-l`   - Toggle visibility of log
* `S-M-m`   - Toggle between light/dark modes
* `S-M-s`   - Save contents of buffer to a file
* `S-M-o`   - Load contents of buffer from a file

10.3 Sharing

# Sharing

Sonic Pi is all about sharing and learning with each other.

Once you've learned how to code music, sharing your compositions is as
simple as sending an email containing your code. Please do *share* your
code with others so they can *learn* from your work and even use parts
in a new *mash-up*.

If you're unsure of the best way to share your work with others I
recommend putting your code on [GitHub](https://github.com) and your
music on [SoundCloud](https://soundcloud.com). That way you'll be able
to easily reach a large audience.

## Code -> GitHub

[GitHub](https://github.com) is a site for sharing and working with
code. It's used by professional developers as well as artists for
sharing and collaborating with code. The simplest way to share a new piece
of code (or even an unfinished piece) is to create a
[Gist](https://gist.github.com). A [Gist](https://gist.github.com) is a
simple way of uploading your code in a simple way that others can see,
copy and share.

## Audio -> SoundCloud

Another important way of sharing your work is to record the audio and
upload it to [SoundCloud](https://soundcloud.com). Once you've uploaded
your piece, other users can comment and discuss your work. I also
recommend placing a link to a [Gist](https://gist.github.com) of your
code in the track description.

To record your work, hit the `Rec` button in the toolbar, and
recording starts immediately.  Hit `Run` to start your code if
it isn't already in progress.  When you're done recording, press the
flashing `Rec` button again, and you'll be prompted to enter a
filename.  The recording will be saved as a WAV file, which can be
edited and converted to MP3 by any number of free programs (try
Audacity for instance).

## Hope

I encourage you to share your work and really hope that we'll all teach
each other new tricks and moves with Sonic Pi. I'm really excited by
what you'll have to show me.

10.4 Performing

# Performing

One of the most exciting aspects of Sonic Pi is that it enables you to
use code as a *musical instrument*. This means that writing code live can
now be seen as a new way of performing music.

We call this *Live Coding*.

## Show Your Screen

When you live code I recommend you *show your screen* to your
audience. Otherwise it's like playing a guitar but hiding your fingers
and the strings. When I practice at home I use a Raspberry Pi and a
little mini projector on my living room wall. You could use your TV or
one of your school/work projectors to give a show. Try it, it's a lot of
fun.

## Form a Band

Don't just play on your own - form a live coding band! It's a lot of fun
jamming with others. One person could do beats, another ambient
background, etc. See what interesting combinations of sounds you can
have together.

## TOPLAP

Live coding isn't completely new - a small number of people have been
doing it for a few years now, typically using bespoke systems they've
built for themselves. A great place to go and find out more about other
live coders and systems is [TOPLAP](http://toplap.org).

## Algorave

Another great resource for exploring the live coding world is
[Algorave](http://algorave.com). Here you can find all about a specific
strand of live coding for making music in nightclubs.

11 Minecraft Pi

# Minecraft Pi

Sonic Pi now supports a simple API for interacting with Minecraft Pi -
the special edition of Minecraft which is installed by default on the
Raspberry Pi's Raspbian Linux-based operating system.

## No need to import libraries

The Minecraft Pi integration has been designed to be insanely easy to
use. All you need to do is to launch Minecraft Pi and create a
world. You're then free to use the `mc_*` fns just like you might use
`play` and `synth`. There's no need to import anything or install any
libraries - it's all ready to go and works out of the box.

## Automatic Connection

The Minecraft Pi API takes care of managing your connection to the
Minecraft Pi application. This means you don't need to worry about a
thing. If you try and use the Minecraft Pi API when Minecraft Pi isn't
open, Sonic Pi will politely tell you. Similarly, if you close Minecraft
Pi whilst you're still running a `live_loop` that uses the API, the live
loop will stop and politely tell you that it can't connect. To
reconnect, just launch Minecraft Pi again and Sonic Pi will
automatically detect and re-create the connection for you.

## Designed to be Live Coded

The Minecraft Pi API has been designed to work seamlessly within
`live_loop`s. This means it's possible to synchronise modifications in
your Minecraft Pi worlds with modifications in your Sonic Pi
sounds. Instant Minecraft-based music videos! Note however that
Minecraft Pi is alpha software and is known to be slightly buggy. If you
encounter any problems simply restart Minecraft Pi and carry on as
before. Sonic Pi's automatic connection functionality will take care of
things for you.

## Requires a Raspberry Pi 2.0

It is highly recommended that you use a Raspberry Pi 2 if you wish to
run both Sonic Pi and Minecraft at the same time - especially if you
want to use Sonic Pi's sound capabilities.

## API Support

At this stage, Sonic Pi supports basic block and player manipulations
which are detailed in Section 11.1. Support for event callbacks
triggered by player interactions in the world is planned for a future
release.

11.1 Basic API

# Basic Minecraft Pi API

Sonic Pi currently supports the following basic interactions with Minecraft Pi:

* Displaying chat messages
* Setting the position of the user
* Getting the position of the user
* Setting the block type at a given coordinate
* Getting the block type at a given coordinate


Let's look at each of these in turn.

## Displaying chat messages

Let's see just how easy it is to control Minecraft Pi from Sonic
Pi. First, make sure you have both Minecraft Pi and Sonic Pi open at the
same time and also make sure you've entered a Minecraft world and can
walk around.

In a fresh Sonic Pi buffer simply enter the following code:

```
mc_message "Hello from Sonic Pi"
```

When you hit the *Run* button, you'll see your message flash up on the
Minecraft window. Congratulations, you've written your first Minecraft
code! That was easy wasn't it.

## Setting the position of the user

Now, let's try a little magic. Let's teleport ourselves somewhere! Try
the following:

```
mc_teleport 50, 50, 50
```

When you hit *Run* - boom! You're instantantly transported to a new
place. Most likely it was somewhere in the sky and you fell down either
to dry land or into water. Now, what are those numbers: `50, 50, 50`?
They're the coordinates of the location you're trying to teleport
to. Let's take a brief moment to explore what coordinates are and how
they work because they're really, really important for programming
Minecraft.

## Coordinates

Imagine a pirate's map with a big `X` marking the location of some
treasure. The exact location of the `X` can be described with two
numbers - how far along the map from left to right and how far along the
map from bottom to top. For example `10cm` across and `8cm` up. These
two numbers `10` and `8` are coordinates. You could easily imagine
describing the locations of other stashes of treasure with other pairs
of numbers. Perhaps there's a big chest of gold at `2` across and `9`
up...

Now, in Minecraft two numbers isn't quite enough. We also need to know
how high we are. We therefore need three numbers:

* How far from right to left in the world - `x`
* How far from front to back in the world - `z`
* How high up we are in the world - `y`

One more thing - we typically describe these coordinates in this order
`x`, `y`, `z`.

## Finding your current coordinates

Let's have a play with coordinates. Navigate to a nice place in the
Minecraft map and then switch over to Sonic Pi. Now enter the following:

```
puts mc_location
```

When you hit the *Run* button you'll see the coordinates of your current
position displayed in the log window. Take a note of them, then move
forward in the world and try again. Notice how the coordinates changed!
Now, I recommend you spend some time repeating exactly this - move a bit
in the world, take a look at the coordinates and repeat. Do this until
you start to get a feel for how the coordinates change when you
move. Once you've understood how coordinates work, programming with the
Minecraft API will be a complete breeze.

## Let's Build!

Now that you know how to find the current position and to teleport using
coordinates, you have all the tools you need to start building things in
Minecraft with code. Let's say you want to make the block with
coordinates `40`, `50`, `60` to be glass. That's super easy:

```
mc_set_block :glass, 40, 50, 60
```

Haha, it really was that easy. To see your handywork just teleport
nearby and take a look:

```
mc_teleport 35, 50, 60
```

Now turn around and you should see your glass block! Try changing it to
diamond:

```
mc_set_block :diamond, 40, 50, 60
```

If you were looking in the right direction you might have even seen it
change in front of your eyes! This is the start of something exciting...

## Looking at blocks

Let's look at one last thing before we move onto something a bit more
involved. Given a set of coordinates we can ask Minecraft what the type
of a specific block is. Let's try it with the diamond block you just
created:

```
puts mc_get_block 40, 50, 60
```

Yey! It's `:diamond`. Try changing it back to glass and asking again -
does it now say `:glass`? I'm sure it does :-)

## Available block types

Before you go on a Minecraft Pi coding rampage, you might find this list
of available block types useful:

        :air
        :stone
        :grass
        :dirt
        :cobblestone
        :wood_plank
        :sapling
        :bedrock
        :water_flowing
        :water
        :water_stationary
        :lava_flowing
        :lava
        :lava_stationary
        :sand
        :gravel
        :gold_ore
        :iron_ore
        :coal_ore
        :wood
        :leaves
        :glass
        :lapis
        :lapis_lazuli_block
        :sandstone
        :bed
        :cobweb
        :grass_tall
        :flower_yellow
        :flower_cyan
        :mushroom_brown
        :mushroom_red
        :gold_block
        :gold
        :iron_block
        :iron
        :stone_slab_double
        :stone_slab
        :brick
        :brick_block
        :tnt
        :bookshelf
        :moss_stone
        :obsidian
        :torch
        :fire
        :stairs_wood
        :chest
        :diamond_ore
        :diamond_block
        :diamond
        :crafting_table
        :farmland
        :furnace_inactive
        :furnace_active
        :door_wood
        :ladder
        :stairs_cobblestone
        :door_iron
        :redstone_ore
        :snow
        :ice
        :snow_block
        :cactus
        :clay
        :sugar_cane
        :fence
        :glowstone_block
        :bedrock_invisible
        :stone_brick
        :glass_pane
        :melon
        :fence_gate
        :glowing_obsidian
        :nether_reactor_core

12 Conclusions

# Conclusions

This concludes the Sonic Pi introductory tutorial. Hopefully you've
learned something along the way. Don't worry if you feel you didn't
understand everything - just play and have fun and you'll pick things up
in your own time. Feel free to dive back in when you have a question that
might be covered in one of the sections.

If you have any questions that haven't been covered in the tutorial,
then please jump onto the [Sonic Pi forums](http://groups.google.com/group/sonic-pi/)
and ask your question there. You'll find someone friendly and willing to
lend a hand.

Finally, I also invite you to take a deeper look at the rest of the
documentation in this help system. There are a number of features that
haven't been covered in this tutorial that are waiting for your
discovery.

So play, have fun, share your code, perform for your friends, show your
screens and remember:

*There are no mistakes, only opportunities.*

[Sam Aaron](http://twitter.com/samaaron)

A Appendix A - MagPi Articles

# MagPi Articles

Appendix A collects all the Sonic Pi articles written for the MagPi
magazine.

## Dive into Topics

These articles aren't meant to be read in any strict order and contain a
lot of cross-over material from the tutorial itself. Rather than try and
teach you all of Sonic Pi, they instead each focus on a specific aspect
of Sonic Pi and cover it in a fun and accessible way.

## Read the MagPi

You can see them in their glorious professionally typeset form in the
free PDF downloads of The MagPi here: https://www.raspberrypi.org/magpi/

## Suggest a Topic

If you don't see a topic that interests you covered in these articles -
why not suggest one? The easiest way to do that is to tweet your
suggestion to [@Sonic_Pi](http://twitter.com/sonic_pi). You never know -
your suggestion might be the subject of the next article!

A.1 Tips for Sonic Pi

# Five Top Tips

## 1. There are no mistakes

The most important lesson to learn with Sonic Pi is that there really
are no mistakes. The best way to learn is to just try and try and
try. Try lots of different things out, stop worrying whether your code
sounds good or not and start experimenting with as many different
synths, notes, FX and opts as possible. You'll discover a lot of things
that make you laugh because they sound just awful and some real gems
that sound truly amazing. Simply drop the things you don't like and keep
the things you do. The more 'mistakes' you allow yourself to make the
quicker you'll learn and discover your personal coding sound.


## 2. Use the FX

Say you've already mastered the Sonic Pi basics of making sounds with
`sample`, `play`? What's next? Did you know that Sonic Pi supports over
27 studio FX to change the sound of your code? FX are like fancy image
filters in drawing programs except that instead of blurring or making
something black and white, you can add things like reverb, distortion
and echo to your sound. Think of it like sticking the cable from your
guitar to an effects pedal of your choice and then into the
amplifier. Luckily, Sonic Pi makes using FX really easy and requires no
cables! All you need to do is to choose which section of your code you'd
like the FX added to and wrap it with the FX code. Let's look at an
example. Say you had the following code:

```
sample :loop_garzul

16.times do
  sample :bd_haus
  sleep 0.5
end
```

If you wanted to add FX to the `:loop_garzul` sample, you'd just tuck it
inside a `with_fx` block like this:

```
with_fx :flanger do
  sample :loop_garzul
end

16.times do
  sample :bd_haus
  sleep 0.5
end
```

Now, if you wanted to add FX to the bass drum, go and wrap that with
`with_fx` too:

```
with_fx :flanger do
  sample :loop_garzul
end

with_fx :echo do
  16.times do
    sample :bd_haus
    sleep 0.5
  end
end
```

Remember, you can wrap *any* code within `with_fx` and any sounds
created will pass through that FX.


## 3. Parameterise your synths

In order to really discover your coding sound you'll soon want to know
how to modify and control synths and FX. For example, you might want to
change the duration of a note, add more reverb, or change the time
between echoes. Luckily, Sonic Pi gives you an amazing level of control
to do exactly this with special things called optional parameters or
opts for short. Let's take a quick look. Copy this code into a workspace
and hit run:

```
sample :guit_em9
```

Ooh, a lovely guitar sound! Now, let's start playing with it. How about
changing its rate?

```
sample :guit_em9, rate: 0.5
```

Hey, what's that `rate: 0.5` bit I just added at the end? That's called
an opt. All of Sonic Pi's synths and FX support them and there's loads
to play around with. They're also available for FX too. Try this:

```
with_fx :flanger, feedback: 0.6 do
  sample :guit_em9
end
```

Now, try increasing that feedback to 1 to hear some crazy sounds! Read the
docs for full details on all the many opts available to you.


## 5. Live Code

The best way to quickly experiment and explore Sonic Pi is to live
code. This allows you to start off some code and continually change and
tweak it whilst it's still playing. For example, if you don't know what
the cutoff parameter does to a sample, just play around. Let's have a try!
Copy this code into one of your Sonic Pi workspaces:

```
live_loop :experiment do
  sample :loop_amen, cutoff: 70
  sleep 1.75
end
```

Now, hit run and you'll hear a slightly muffled drum break. Now, change
the `cutoff:` value to `80` and hit run again. Can you hear the
difference? Try `90`, `100`, `110`...

Once you get the hang of using `live_loop`s you'll not turn
back. Whenever I do a live coding gig I rely on `live_loop` as much as a
drummer relies on their sticks. For more information about live coding
check out Section 9 of the built-in tutorial.

## 5. Surf the random streams

Finally, one thing I love doing is cheating by getting Sonic Pi to
compose things for me.  A really great way to do this is using
randomisation. It might sound complicated but it really isn't. Let's
take a look. Copy this into a spare workspace:

```
live_loop :rand_surfer do
  use_synth :dsaw
  notes = (scale :e2, :minor_pentatonic, num_octaves: 2)
  16.times do
    play notes.choose, release: 0.1, cutoff: rrand(70, 120)
    sleep 0.125
  end
end
```

Now, when you play this, you'll hear a constant stream of random notes
from the scale `:e2 :minor_pentatonic` played with the `:dsaw`
synth. "Wait, wait! That's not a melody", I hear you shout! Well, here's
the first part of the magic trick. Every time we go round the
`live_loop` we can tell Sonic Pi to reset the random stream to a known
point. This is a bit like going back in time in the TARDIS with the
Doctor to a particular point in time and space. Let's try it - add the
line `use_random_seed 1` to the `live_loop`:

```
live_loop :rand_surfer do
  use_random_seed 1
  use_synth :dsaw
  notes = (scale :e2, :minor_pentatonic, num_octaves: 2)
  16.times do
    play notes.choose, release: 0.1, cutoff: rrand(70, 120)
    sleep 0.125
  end
end
```

Now, every time the `live_loop` loops around, the random stream is
reset. This means it chooses the same 16 notes every time. Hey presto!
An instant melody. Now, here's the really exciting bit. Change the seed
value from `1` to another number. Say `4923`. Wow! Another melody! So,
just by changing one number (the random seed), you can explore as many
melodic combinations as you can imagine! Now, that's the magic of code.

A.2 Live Coding

# Live Coding

The laser beams sliced through the wafts of smoke as the subwoofer
pumped bass deep into the bodies of the crowd. The atmosphere was ripe
with a heady mix of synths and dancing. However something wasn't quite
right in this nightclub. Projected in bright colours above the DJ booth
was futuristic text, moving, dancing, flashing. This wasn't fancy
visuals, it was merely a projection of Sonic Pi running on a Raspberry
Pi. The occupant of the DJ booth wasn't spinning disks, he was writing,
editing and evaluating code. Live. This is Live Coding.

![Sam Aaron Live Coding](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.02-live-coding/sam-aaron-live-coding.png)

This may sound like a far fetched story from a futuristic night club but
coding music like this is a growing trend and is often described as Live
Coding (http://toplap.org). One of the recent directions this approach
to music making has taken is the Algorave (http://algorave.com) - events
where artists like myself code music for people to dance to. However,
you don't need to be in a nightclub to Live Code - with Sonic Pi v2.6+
you can do it anywhere you can take your Raspberry Pi and a pair of
headphones or some speakers.  Once you reach the end of this article,
you'll be programming your own beats and modifying them live. Where you
go afterwards will only be constrained by your imagination.

## Live Loop

The key to live coding with Sonic Pi is mastering the `live_loop`. Let's
look at one:

```
live_loop :beats do
  sample :bd_haus
  sleep 0.5
end
```

There are 4 core ingredients to a `live_loop`. The first is its
name. Our `live_loop` above is called `:beats`. You're free to call your
`live_loop` anything you want. Go crazy. Be creative. I often use names
that communicate something about the music they're making to the
audience. The second ingredient is the `do` word which marks where the
`live_loop` starts. The third is the `end` word which marks where the
`live_loop` finishes, and finally there is the body of the `live_loop`
which describes what the loop is going to repeat - that's the bit
between the `do` and `end`. In this case we're repeatedly playing a bass
drum sample and waiting for half a beat. This produces a nice regular
bass beat. Go ahead, copy it into an empty Sonic Pi buffer and hit
run. Boom, Boom, Boom!.

## Redefining On-the-fly

Ok, so what's so special about the `live_loop`? So far it just seems
like a glorified `loop`! Well, the beauty of `live_loop`s is that you
can redefine them on-the-fly. This means that whilst they're still
running, you can change what they do. This is the secret to live coding
with Sonic Pi. Let's have a play:

```
live_loop :choral_drone do
  sample :ambi_choir, rate: 0.4
  sleep 1
end
```

Now press the Run button or hit `alt-r`. You're now listening to
some gorgeous choir sounds. Now, whilst it's still playing, change the
rate from `0.4` to `0.38`. Hit run again. Woah! Did you hear the choir
change note? Change it back up to `0.4` to return back to how it
was. Now, drop it to `0.2`, down to `0.19` and then back up to
`0.4`. See how changing just one parameter on the fly can give you real
control of the music? Now play around with the rate yourself - choose
your own values. Try negative numbers, really small numbers and large
numbers. Have fun!

## Sleeping is important

One of the most important lessons about `live_loop`s is that they need
rest. Consider the following `live_loop`:

```
live_loop :infinite_impossibilities do
  sample :ambi_choir
end
```

If you try running this code, you'll immediately see Sonic Pi
complaining that the `live_loop` did not sleep. This is a safety system
kicking in! Take a moment to think about what this code is asking the
computer to do. That's right, it's asking the computer to play an
infinite amount of choir samples in zero time. Without the safety system
the poor computer will try and do this and crash and burn in the
process. So remember, your `live_loop`s must contain a `sleep`.


## Combining Sounds

Music is full of things happening at the same time. Drums at the same
time as bass at the same time as vocals at the same time as
guitars... In computing we call this concurrency and Sonic Pi provides
us with an amazingly simple way of playing things at the same
time. Simply use more than one `live_loop`!

```
live_loop :beats do
  sample :bd_tek
  with_fx :echo, phase: 0.125, mix: 0.4 do
    sample  :drum_cymbal_soft, sustain: 0, release: 0.1
    sleep 0.5
  end
end

live_loop :bass do
  use_synth :tb303
  synth :tb303, note: :e1, release: 4, cutoff: 120, cutoff_attack: 1
  sleep 4
end
```

Here, we have two `live_loop`s, one looping quickly making beats and
another looping slowly making a crazy bass sound.

One of the interesting things about using multiple `live_loop`s is that
they each manage their own time. This means it's really easy to create
interesting polyrhythmical structures and even play with phasing Steve
Reich style. Check this out:

```
# Steve Reich's Piano Phase

notes = (ring :E4, :Fs4, :B4, :Cs5, :D5, :Fs4, :E4, :Cs5, :B4, :Fs4, :D5, :Cs5)

live_loop :slow do
  play notes.tick, release: 0.1
  sleep 0.3
end

live_loop :faster do
  play notes.tick, release: 0.1
  sleep 0.295
end
```

## Bringing it all together

In each of these tutorials, we'll end with a final example in the form
of a new piece of music which draws from all of the ideas
introduced. Read this code and see if you can imagine what it's
doing. Then, copy it into a fresh Sonic Pi buffer and hit Run and
actually hear what it sounds like. Finally, change one of the numbers or
comment and uncomment things out. See if you can use this as a starting
point for a new performance, and most of all have fun! See you next
time...

```
with_fx :reverb, room: 1 do
  live_loop :time do
    synth :prophet, release: 8, note: :e1, cutoff: 90, amp: 3
    sleep 8
  end
end

live_loop :machine do
  sample :loop_garzul, rate: 0.5, finish: 0.25
  sample :loop_industrial, beat_stretch: 4, amp: 1
  sleep 4
end

live_loop :kik do
  sample :bd_haus, amp: 2
  sleep 0.5
end

with_fx :echo do
  live_loop :vortex do
    # use_random_seed 800
    notes = (scale :e3, :minor_pentatonic, num_octaves: 3)
    16.times do
      play notes.choose, release: 0.1, amp: 1.5
      sleep 0.125
    end
  end
end
```

A.3 Coded Beats

# Coded Beats

One of the most exciting and disrupting technical developments in modern
music was the invention of samplers. These were boxes that allowed you
to record any sound into them and then manipulate and play back those
sounds in many interesting ways. For example, you could take an old
record, find a drum solo (or break), record it into your sampler and
then play it back on repeat at half-speed to provide the foundation for
your latest beats. This is how early hip-hop music was born and today
it's almost impossible to find electronic music that doesn't incorporate
samples of some kind. Using samples is a really great way of easily
introducing new and interesting elements into your live coded
performances.

So where can you get a sampler? Well you already have one - it's your
Raspberry Pi! The built-in live coding app Sonic Pi has an extremely
powerful sampler built into its core. Let's play with it!

## The Amen Break

One of the most classic and recognisable drum break samples is called
the Amen Break. It was first performed in 1969 in the song "Amen
Brother" by the Winstons as part of a drum break. However, it was when
it was discovered by early hip-hop musicians in the 80s and used in
samplers that it started being heavily used in a wide variety of other
styles such as drum and bass, breakbeat, hardcore techno and breakcore.

I'm sure you're excited to hear that it's also built right into Sonic
Pi. Clear up a buffer and throw in the following code:

```
sample :loop_amen
```

Hit *Run* and boom! You're listening to one of the most influential
drum breaks in the history of dance music. However, this sample wasn't famous
for being played as a one-shot, it was built for being looped.


## Beat Stretching

Let's loop the Amen Break by using our old friend the `live_loop`
introduced in this tutorial last month:

```
live_loop :amen_break do
  sample :loop_amen
  sleep 2
end
```

OK, so it is looping, but there's an annoying pause every time
round. That is because we asked it to sleep for `2` beats and with
the default BPM of 60 the `:loop_amen` sample only lasts for `1.753`
beats. We therefore have a silence of `2 - 1.753 = 0.247` beats. Even
though it's short, it's still noticeable.

To fix this issue we can use the `beat_stretch:` opt to ask Sonic Pi to
stretch (or shrink) the sample to match the specified number of beats.

Sonic Pi's `sample` and `synth` fns give you a lot
of control via optional parameters such as `amp:`, `cutoff:` and
`release:`. However, the term optional parameter is a real mouthful so
we just call them *opts* to keep things nice and simple.

```
live_loop :amen_break do
  sample :loop_amen, beat_stretch: 2
  sleep 2
end
```

Now we're dancing! Although, perhaps we want to speed it up or slow it down
to suit the mood.

## Playing with Time

OK, so what if we want to change styles to old school hip hop or
breakcore? One simple way of doing this is to play with time - or in
other words mess with the tempo. This is super easy in Sonic Pi - just
throw in a `use_bpm` into your live loop:

```
live_loop :amen_break do
  use_bpm 30
  sample :loop_amen, beat_stretch: 2
  sleep 2
end
```

Whilst you're rapping over those slow beats, notice that we're still
sleeping for 2 and our BPM is 30, yet everything is in time. The
`beat_stretch` opt works with the current BPM to make sure everything just works.

Now, here's the fun part. Whilst the loop is still live, change the `30`
in the `use_bpm 30` line to `50`. Woah, everything just got faster yet *kept
in time*! Try going faster - up to 80, to 120, now go crazy and punch in
200!


## Filtering

Now we can live loop samples, let's look at some of the most fun opts
provided by the `sample` synth. First up is `cutoff:` which controls the
cutoff filter of the sampler. By default this is disabled but you can
easily turn it on:

```
live_loop :amen_break do
  use_bpm 50
  sample :loop_amen, beat_stretch: 2, cutoff: 70
  sleep 2
end
```

Go ahead and change the `cutoff:` opt. For example, increase it to 100,
hit *Run* and wait for the loop to cycle round to hear the change in the
sound. Notice that low values like 50 sound mellow and bassy and high
values like 100 and 120 are more full-sounding and raspy. This is
because the `cutoff:` opt will chop out the high frequency parts of the
sound just like a lawn-mower chops off the top of the grass. The
`cutoff:` opt is like the length setting - determining how much grass is
left over.


## Slicing

Another great tool to play with is the slicer FX. This will chop (slice)
the sound up. Wrap the `sample` line with the FX code like this:

```
live_loop :amen_break do
  use_bpm 50
  with_fx :slicer, phase: 0.25, wave: 0, mix: 1 do
    sample :loop_amen, beat_stretch: 2, cutoff: 100
  end
  sleep 2
end
```

Notice how the sound bounces up and down a little more. (You can hear
the original sound without the FX by changing the `mix:` opt to `0`.)
Now, try playing around with the `phase:` opt. This is the rate (in
beats) of the slicing effect. A smaller value like `0.125` will slice
faster and larger values like `0.5` will slice more slowly. Notice that
successively halving or doubling the `phase:` opts val tends to always
sound good. Finally, change the `wave:` opt to one of 0, 1, or 2 and
hear how it changes the sound. These are the various wave shapes. 0 is a
saw wave, (hard in, fade out) 1 is a square wave (hard in, hard out) and
2 is a triangle wave (fade in, fade out).


## Bringing it all together

Finally, let's go back in time and revisit the early Bristol drum and
bass scene with this month's example. Don't worry too much about what
all this means, just type it in, hit Run, then start live coding it by
changing opt numbers and see where you can take it. Please do share what
you create! See you next time...

```
use_bpm 100

live_loop :amen_break do
  p = [0.125, 0.25, 0.5].choose
  with_fx :slicer, phase: p, wave: 0, mix: rrand(0.7, 1) do
    r = [1, 1, 1, -1].choose
    sample :loop_amen, beat_stretch: 2, rate: r, amp: 2
  end
  sleep 2
end

live_loop :bass_drum do
  sample :bd_haus, cutoff: 70, amp: 1.5
  sleep 0.5
end

live_loop :landing do
  bass_line = (knit :e1, 3, [:c1, :c2].choose, 1)
  with_fx :slicer, phase: [0.25, 0.5].choose, invert_wave: 1, wave: 0 do
    s = synth :square, note: bass_line.tick, sustain: 4, cutoff: 60
    control s, cutoff_slide: 4, cutoff: 120
  end
  sleep 4
end
```

A.4 Synth Riffs

# Synth Riffs

Whether it's the haunting drift of rumbling oscillators or the detuned
punch of saw waves piercing through the mix, the lead synth plays an
essential role on any electronic track. In last month's edition of this
tutorial series we covered how to code our beats. In this tutorial we'll
cover how to code up the three core components of a synth riff - the
timbre, melody and rhythm.

OK, so power up your Raspberry Pi, crack open Sonic Pi v2.6+ and let's
make some noise!


## Timbral Possibilities

An essential part of any synth riff is changing and playing with the
timbre of the sounds.  We can control the timbre in Sonic Pi in two ways
- choosing different synths for a dramatic change and setting the
various synth opts for more subtle modifications. We can also use FX,
but that's for another tutorial...

Let's create a simple live loop where we continually change the current
synth:

```
live_loop :timbre do
  use_synth (ring :tb303, :blade, :prophet, :saw, :beep, :tri).tick
  play :e2, attack: 0, release: 0.5, cutoff: 100
  sleep 0.5
end
```

Take a look at the code. We're simply ticking through a ring of synth
names (this will cycle through each of these in turn repeating the list
over and over). We pass this synth name to the `use_synth` fn (function)
which will change the `live_loop`'s current synth. We also play note
`:e2` (E at the second octave), with a release time of 0.5 beats (half a
second at the default BPM of 60) and with the `cutoff:` opt set to 100.

Hear how the different synths have very different sounds even though
they're all playing the same note. Now experiment and have a
play. Change the release time to bigger and smaller values. For example,
change the `attack:` and `release:` opts to see how different fade
in/out times have a huge impact on the sound. Finally change the
`cutoff:` opt to see how different cutoff values also massively
influence the timbre (values between 60 and 130 are good). See how many
different sounds you can create by just changing a few values. Once
you've mastered that, just head to the Synths tab in the Help system for
a full list of all the synths and all the available opts each individual
synth supports to see just how much power you have under your coding
fingertips.

## Timbre

Timbre is just a fancy word describing the sound of a sound. If you play
the same note with different instruments such as a violin, guitar, or
piano, the pitch (how high or low it sounds) would be the same, but the
sound quality would be different. That sound quality - the thing which
allows you to tell the difference between a piano and a guitar is the
timbre.


## Melodic Composition

Another important aspect to our lead synth is the choice of notes we
want to play. If you already have a good idea, then you can simply
create a ring with your notes in and tick through them:

```
live_loop :riff do
  use_synth :prophet
  riff = (ring :e3, :e3, :r, :g3, :r, :r, :r, :a3)
  play riff.tick, release: 0.5, cutoff: 80
  sleep 0.25
end
```

Here, we've defined our melody with a ring which includes both notes
such as `:e3` and rests represented by `:r`. We're then using `.tick` to
cycle through each note to give us a repeating riff.

## Auto Melody

It's not always easy to come up with a nice riff from scratch. Instead
it's often easier to ask Sonic Pi for a selection of random riffs and to
choose the one you like the best. To do that we need to combine three
things: rings, randomisation and random seeds. Let's look at an example:

```
live_loop :random_riff do
  use_synth :dsaw
  use_random_seed 3
  notes = (scale :e3, :minor_pentatonic).shuffle
  play notes.tick, release: 0.25, cutoff: 80
  sleep 0.25
end
```

There's a few things going on - let's look at them in turn. First, we
specify that we're using random seed 3. What does this mean? Well, the
useful thing is that when we set the seed, we can predict what the next
random value is going to be - it's the same as it was last time we set
the seed to 3! Another useful thing to know is that shuffling a ring of
notes works in the same way. In the example above we're essentially
asking for the 'third shuffle' in the standard list of shuffles - which
is also the same every time as we're always setting the random seed to
the same value right before the shuffle. Finally we're just ticking
through our shuffled notes to play the riff.

Now, here's where the fun starts. If we change the random seed value to
another number, say 3000, we get an entirely different shuffling of the
notes. So now it's extremely easy to explore new melodies. Simply choose
the list of notes we want to shuffle (scales are a great starting point)
and then choose the seed we want to shuffle with. If we don't like the
melody, just change one of those two things and try again. Repeat until
you like what you hear!


## Pseudo Randomisation

Sonic Pi's randomisation is not actually random it's what's called
pseudo random.  Imagine if you were to roll a dice 100 times and write
down the result of each roll onto a piece of paper. Sonic Pi has the
equivalent of this list of results which it uses when you ask for a
random value. Instead of rolling an actual dice, it just picks the next
value from the list. Setting the random seed is just jumping to a
specific point in that list.

## Finding your Rhythm

Another important aspect to our riff is the rhythm - when to play a note
and when not to. As we saw above we can use `:r` in our rings to insert
rests. Another very powerful way is to use spreads which we'll cover in
a future tutorial. Today we'll use randomisation to help us find our
rhythm. Instead of playing every note we can use a conditional to play a
note with a given probability. Let's take a look:

```
live_loop :random_riff do
  use_synth :dsaw
  use_random_seed 30
  notes = (scale :e3, :minor_pentatonic).shuffle
  16.times do
    play notes.tick, release: 0.2, cutoff: 90 if one_in(2)
    sleep 0.125
  end
end
```

A really useful fn to know is `one_in` which will give us a
`true` or `false` value with the specified probability. Here, we're
using a value of 2 so on average one time every two calls to `one_in` it
will return `true`. In other words, 50% of the time it will return
`true`. Using higher values will make it return `false` more often
introducing more space into the riff.

Notice that we've added some iteration in here with `16.times`. This is
because we only want to reset our random seed value every 16 notes so
our rhythm repeats every 16 times. This doesn't affect the shuffling as
that is still done immediately after the seed is set. We can use the
iteration size to alter the length of the riff. Try changing the 16 to 8
or even 4 or 3 and see how it affects the rhythm of the riff.

## Bringing it all together

OK, so let's combine everything we've learned together into one final
example. See you next time!

```
live_loop :random_riff do
  #  uncomment to bring in:
  #  synth :blade, note: :e4, release: 4, cutoff: 100, amp: 1.5
  use_synth :dsaw
  use_random_seed 43
  notes = (scale :e3, :minor_pentatonic, num_octaves: 2).shuffle.take(8)
  8.times do
    play notes.tick, release: rand(0.5), cutoff: rrand(60, 130) if one_in(2)
    sleep 0.125
  end
end

live_loop :drums do
  use_random_seed 500
  16.times do
    sample :bd_haus, rate: 2, cutoff: 110 if rand < 0.35
    sleep 0.125
  end
end

live_loop :bd do
  sample :bd_haus, cutoff: 100, amp: 3
  sleep 0.5
end
```

A.5 Acid Bass

# Acid Bass

It's impossible to look through the history of electronic dance music
without seeing the enormous impact of the tiny Roland TB-303
synthesiser. It's the secret sauce behind the original acid bass
sound. Those classic squealing and squelching TB-303 bass riffs can be
heard from the early Chicago House scene through to more recent
electronic artists such as Plastikman, Squarepusher and Aphex Twin.

Interestingly, Roland never intended for the TB-303 to be used in dance
music. It was originally created as a practice aid for guitarists. They
imagined that people would program them to play bass lines to jam along
to. Unfortunately there were a number of problems: they were a little
fiddly to program, didn't sound particularly good as a bass-guitar
replacement and were pretty expensive to buy. Deciding to cut their
losses, Roland stopped making them after 10,000 units were sold and
after a number of years sitting on guitarist's shelves, they soon could
be found in the windows of second hand shops. These lonely discarded
TB-303s were waiting to be discovered by a new generation of
experimenters who started using them in ways that Roland didn't imagine
to create new crazy sounds. Acid House was born.

Although getting your hands on an original TB-303 is not so easy you
will be pleased to know that you can turn your Raspberry Pi into one
using the power of Sonic Pi. Behold, fire up Sonic Pi and throw this
code into an empty buffer and hit Run:

```
use_synth :tb303
play :e1
```

Instant acid bass! Let's play around...

# Squelch that Bass

First, let's build a live arpeggiator to make things fun. In the last
tutorial we looked at how riffs can just be a ring of notes that we tick
through one after another, repeating when we get to the end. Let's
create a live loop that does exactly that:

```
use_synth :tb303
live_loop :squelch do
  n = (ring :e1, :e2, :e3).tick
  play n, release: 0.125, cutoff: 100, res: 0.8, wave: 0
  sleep 0.125
end
```

Take a look at each line.

1. On the first line we set the default synth to be `tb303` with the
  `use_synth` fn.

2. On line two we create a live loop called `:squelch` which will just
   loop round and round.

3. Line three is where we create our riff - a ring of notes (E in
   octaves 1, 2, and 3) which we simply tick through with `.tick`. We
   define `n` to represent the current note in the riff. The equals sign
   just means to assign the value on the right to the name on the
   left. This will be different every time round the loop. The first
   time round, `n` will be set to `:e1`. The second time round it will
   be `:e2`, followed by `:e3`, and then back to `:e1`, cycling round
   forever.

4. Line four is where we actually trigger our `:tb303` synth. We're
   passing a few interesting opts here: `release:`, `cutoff:`, `res:`
   and `wave:` which we'll discuss below.

5. Line five is our `sleep` - we're asking the live loop to loop round
   every `0.125`s or 8 times a second at the default BPM of 60.

6. Line six is the `end` to the live loop. This just tells Sonic Pi
   where the end of the live loop is.

Whilst you're still figuring out what's going on, type in the code above
and hit the Run button. You should hear the `:tb303` kick into
action. Now, this is where the action is: let's start live coding.

Whilst the loop is still live, change the `cutoff:` opt to `110`. Now
hit the Run button again. You should hear the sound become a little
harsher and more squelchy. Dial in `120` and hit run. Now `130`. Listen
how higher cutoff values make it sound more piercing and
intense. Finally, drop it down to `80` when you feel like a rest. Then
repeat as many times as you want. Don't worry, I'll still be here...

Another opt worth playing with is `res:`. This controls the level of
resonance of the filter. A high resonance is characteristic of acid bass
sounds. We currently have our `res:` set to `0.8`. Try cranking it up to
`0.85`, then `0.9`, and finally `0.95`. You might find that a cutoff
such as `110` or higher will make the differences easier to
hear. Finally go crazy and dial in `0.999` for some insane sounds. At a
`res` this high, you're hearing the cutoff filter resonate so much it
starts to make sounds of its own!

Finally, for a big impact on the timbre try changing the `wave:` opt to
`1`. This is the choice of source oscillator. The default is `0` which
is a sawtooth wave. `1` is a pulse wave and `2` is a triangle wave.

Of course, try different riffs by changing the notes in the ring or even
picking notes from scales or chords. Have fun with your first acid bass
synth.

# Deconstructing the TB-303

The design of the original TB-303 is actually pretty simple. As you can
see from the following diagram there's only 4 core parts.

![TB-303 Design](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.05-acid-bass/tb303-design.png)

First is the oscillator wave - the raw ingredients of the sound. In this
case we have a square wave. Next there's the oscillator's amplitude
envelope which controls the amp of the square wave through time. These
are accessed in Sonic Pi by the `attack:`, `decay:`, `sustain:` and
`release:` opts along with their level counterparts. For more
information read Section 2.4 'Duration with Envelopes' in the built-in
tutorial. We then pass our enveloped square wave through a resonant low
pass filter. This chops off the higher frequencies as well as having
that nice resonance effect. Now this is where the fun starts. The cutoff
value of this filter is also controlled by its own envelope! This means
we have amazing control over the timbre of the sound by playing with
both of these envelopes. Let's take a look:

```
use_synth :tb303
with_fx :reverb, room: 1 do
  live_loop :space_scanner do
    play :e1, cutoff: 100, release: 7, attack: 1, cutoff_attack: 4, cutoff_release: 4
    sleep 8
  end
end
```

For each standard envelope opt, there's a `cutoff_` equivalent opt in
the `:tb303` synth. So, to change the cutoff attack time we can use the
`cutoff_attack:` opt. Copy the code above into an empty buffer and hit
Run. You'll hear a crazy sound warble in and out. Now start to play. Try
changing the `cutoff_attack:` time to `1` and then `0.5`. Now try `8`.

Notice that I've passed everything through a `:reverb` FX for extra
atmosphere - try other FX to see what works!

# Bringing it all together

Finally, here's a piece I composed using the ideas in this
tutorial. Copy it into an empty buffer, listen for a while and then
start live coding your own changes. See what crazy sounds you can make
with it! See you next time...

```
use_synth :tb303
use_debug false

with_fx :reverb, room: 0.8 do
  live_loop :space_scanner do
    with_fx :slicer, phase: 0.25, amp: 1.5 do
      co = (line 70, 130, steps: 8).tick
      play :e1, cutoff: co, release: 7, attack: 1, cutoff_attack: 4, cutoff_release: 4
      sleep 8
    end
  end

  live_loop :squelch do
    use_random_seed 3000
    16.times do
      n = (ring :e1, :e2, :e3).tick
      play n, release: 0.125, cutoff: rrand(70, 130), res: 0.9, wave: 1, amp: 0.8
      sleep 0.125
    end
  end
end
```

A.6 Musical Minecraft

# Musical Minecraft



Hello and welcome back! In the previous tutorials we've focussed purely
on the music possibilities of Sonic Pi - (turning your Raspberry Pi into
a performance ready musical instrument). So far we've learned how to:

* Live Code - changing the sounds on-the-fly,
* Code some huge beats,
* Generate powerful synth leads,
* Re-create the famous TB-303 acid-bass sound.

There's so much more to show you (which we will explore in future
editions). However, this month, let's look at something Sonic Pi can do
that you probably didn't realise: control Minecraft.

# Hello Minecraft World

OK, let's get started. Boot up your Raspberry Pi, fire up Minecraft Pi
and create a new world. Now start up Sonic Pi and re-size and move your
windows so you can see both Sonic Pi and Minecraft Pi at the same time.

In a fresh buffer type the following:

```
mc_message "Hello Minecraft from Sonic Pi!"
```

Now, hit Run. Boom! Your message appeared in Minecraft! How easy was
that? Now, stop reading this for a moment and play about with your own
messages. Have fun!

![Screen 0](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.06-minecraft/Musical-Minecraft-0-small.png)

# Sonic Teleporter

Now let's do some exploring. The standard option is to reach for the
mouse and keyboard and start walking around. That works, but it's pretty
slow and boring. It would be far better if we had some sort of teleport
machine. Well, thanks to Sonic Pi, we have one. Try this:

```
mc_teleport 80, 40, 100
```

Crikey! That was a long way up. If you weren't in flying-mode then you
would have fallen back down all the way to the ground. If you double-tap
space to enter flying-mode and teleport again, you'll stay hovering at
the location you zap to.

Now, what do those numbers mean? We have three numbers which describe
the coordinates of where in the world we want to go. We give each number
a name - x, y and z:

* x - how far left and right (80 in our example)
* y - how high we want to be (40 in our example)
* z - how far forward and back (100 in our example)

By choosing different values for x, y and z we can teleport *anywhere*
in our world. Try it! Choose different numbers and see where you can end
up. If the screen goes black it's because you've teleported yourself
under the ground or into a mountain. Just choose a higher y value to get
back out above land. Keep on exploring until you find somewhere you
like...

Using the ideas so far, let's build a Sonic Teleporter which makes a fun
teleport sound whilst it whizzes us across the Minecraft world:

```
mc_message "Preparing to teleport...."
sample :ambi_lunar_land, rate: -1
sleep 1
mc_message "3"
sleep 1
mc_message "2"
sleep 1
mc_message "1"
sleep 1
mc_teleport 90, 20, 10
mc_message "Whoooosh!"
```

![Screen 1](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.06-minecraft/Musical-Minecraft-1-small.png)

# Magic Blocks

Now you've found a nice spot, let's start building. You could do what
you're used to and start clicking the mouse furiously to place blocks
under the cursor. Or you could use the magic of Sonic Pi. Try this:

```
x, y, z = mc_location
mc_set_block :melon, x, y + 5, z
```

Now look up! There's a melon in the sky! Take a moment to look at the
code. What did we do? On line one we grabbed the current location of
Steve as the variables x, y and z. These correspond to our coordinates
described above. We use these coordinates in the fn `mc_set_block` which
will place the block of your choosing at the specified coordinates. In
order to make something higher up in the sky we just need to increase
the y value which is why we add 5 to it. Let's make a long trail of them:

```
live_loop :melon_trail do
  x, y, z = mc_location
  mc_set_block :melon, x, y-1, z
  sleep 0.125
end
```

Now, jump over to Minecraft, make sure you're in flying-mode (double tap
space if not) and fly all around the world. Look behind you to see a
pretty trail of melon blocks! See what kind of twisty patterns you can
make in the sky.

# Live Coding Minecraft

Those of you that have been following this tutorial over the last few
months will probably have your minds blown at this point. The trail of
melons is pretty cool, but the most exciting part of the previous
example is that you can use `live_loop` with Minecraft! For those that
don't know, `live_loop` is Sonic Pi's special magic ability that no
other programming language has. It lets you run multiple loops at the
same time and allows you to change them whilst they run. They are
incredibly powerful and amazing fun. I use `live_loop`s to perform music
in nightclubs with Sonic Pi - DJs use discs and I use `live_loop`s :-)
However, today we're going to live code both music and Minecraft.

Let's get started. Run the code above and start making your melon
trail again. Now, without stopping the code, just simply change `:melon` to
`:brick` and hit run. Hey presto, you're now making a brick trail. How
simple was that! Fancy some music to go with it? Easy. Try this:

```
live_loop :bass_trail do
  tick
  x, y, z = mc_location
  b = (ring :melon, :brick, :glass).look
  mc_set_block b, x, y -1, z
  note = (ring :e1, :e2, :e3).look
  use_synth :tb303
  play note, release: 0.1, cutoff: 70
  sleep 0.125
end
```

Now, whilst that's playing start changing the code. Change the block
types - try `:water`, `:grass` or your favourite block type. Also, try
changing the cutoff value from `70` to `80` and then up to `100`. Isn't
this fun?

# Bringing it all together

![Screen 2](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.06-minecraft/Musical-Minecraft-2-small.png)

Let's combine everything we've seen so far with a little extra
magic. Let's combine our teleportation ability with block placing and
music to make a Minecraft Music Video. Don't worry if you don't
understand it all, just type it in and have a play by changing some of
the values whilst it's running live. Have fun and see you next time...

```
live_loop :note_blocks do
  mc_message "This is Sonic Minecraft"
  with_fx :reverb do
    with_fx :echo, phase: 0.125, reps: 32 do
      tick
      x = (range 30, 90, step: 0.1).look
      y = 20
      z = -10
      mc_teleport x, y, z
      ns = (scale :e3, :minor_pentatonic)
      n = ns.shuffle.choose
      bs = (knit :glass, 3, :sand, 1)
      b = bs.look
      synth :beep, note: n, release: 0.1
      mc_set_block b, x+20, n-60+y, z+10
      mc_set_block b, x+20, n-60+y, z-10
      sleep 0.25
    end
  end
end

live_loop :beats do
  sample :bd_haus, cutoff: 100
  sleep 0.5
end
```

A.7 Bizet Beats

# Bizet Beats

After our brief excursion to the fantastic world of coding Minecraft
with Sonic Pi last month, let's get musical again. Today we're going to
bring a classical operatic dance piece straight into the 21st century
using the awesome power of code.

# Outrageous and Disruptive

Let's jump into a time machine back to the year 1875. A composer called
Bizet had just finished his latest opera Carmen.  Unfortunately like
many exciting and disruptive new pieces of music people initially
didn't like it at all because it was too outrageous and different. Sadly
Bizet died ten years before the opera gained huge international success
and became one of the most famous and frequently performed operas
of all time. In sympathy with this tragedy let's take one of the main
themes from Carmen and convert it to a modern format of music that is
also too outrageous and different for most people in our time - live
coded music!

# Decoding the Habanera

Trying to live code the whole opera would be a bit of a challenge for
this tutorial, so let's focus on one of the most famous parts - the bass
line to the Habanera:

![Habanera Riff](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.07-bizet/habanera.png)

This may look extremely unreadable to you if you haven't yet studied
music notation.  However, as programmers we see music notation as just
another form of code - only it represents instructions to a musician instead
of a computer. We therefore need to figure out a way of decoding it.

# Notes

The notes are arranged from left to right like the words in this
magazine but also have different heights. *The height on the score
represents the pitch of the note.* The higher the note on the score, the
higher the pitch of the note.

In Sonic Pi we already know how to change the pitch of a note - we
either use high or low numbers such as `play 75` and `play 80` or we use
the note names: `play :E` and `play :F`. Luckily each of the vertical
positions of the musical score represents a specific note name. Take a
look at this handy look up table:

![Notes](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.07-bizet/notes.png)

# Rests

Music scores are an extremely rich and expressive kind of code capable
of communicating many things. It therefore shouldn't come as much of a
surprise that musical scores can not only tell you what notes to play but
also when *not* to play notes. In programming this is pretty much
equivalent to the idea of `nil` or `null` - the absence of a value. In
other words not playing a note is like the absence of a note.

If you look closely at the score you'll see that it's actually a
combination of black dots with lines which represent notes to play and
squiggly things which represent the rests. Luckily Sonic Pi has a very
handy representation for a rest: `:r`, so if we run: `play :r` it
actually plays silence! We could also write `play :rest`, `play nil` or
`play false` which are all equivalent ways of representing rests.

# Rhythm

Finally, there's one last thing to learn how to decode in the notation -
the timings of the notes. In the original notation you'll see that the
notes are connected with thick lines called beams. The second note has
two of these beams which means it lasts for a 16th of a beat. The other
notes have a single beam which means they last for an 8th of a beat. The
rest has two squiggly beams which means it also represents a 16th of the
beat.

When we attempt to decode and explore new things a very handy trick is
to make everything as similar as possible to try and see any
relationships or patterns. For example, when we re-write our notation
purely in 16ths you can see that our notation just turns into a nice
sequence of notes and rests.

![Habanera Riff 2](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.07-bizet/habanera2.png)

# Re-coding the Habanera

We're now in a position to start translating this bass line to Sonic
Pi. Let's encode these notes and rests in a ring:

```
(ring :d, :r, :r, :a, :f5, :r, :a, :r)
```

Let's see what this sounds like. Throw it in a live loop and tick
through it:

```
live_loop :habanera do
  play (ring :d, :r, :r, :a, :f5, :r, :a, :r).tick
  sleep 0.25
end
```

Fabulous, that instantly recognisable riff springs to life through your
speakers. It took a lot of effort to get here, but it was worth it -
high five!

# Moody Synths

Now we have the bass line, let's re-create some of the ambience of the
operatic scene. One synth to try out is `:blade` which is a moody 80s
style synth lead.  Let's try it with the starting note `:d` passed
through a slicer and reverb:

```
live_loop :habanera do
  use_synth :fm
  use_transpose -12
  play (ring :d, :r, :r, :a, :f5, :r, :a, :r).tick
  sleep 0.25
end

with_fx :reverb do
  live_loop :space_light do
    with_fx :slicer, phase: 0.25 do
      synth :blade, note: :d, release: 8, cutoff: 100, amp: 2
    end
    sleep 8
  end
end
```

Now, try the other notes in the bass line: `:a` and `:f5`. Remember, you
don't need to hit stop, just modify the code whilst the music is playing
and hit run again. Also, try different values for the slicer's `phase:`
opt such as `0.5`, `0.75` and `1`.

# Bringing it all together

Finally, let's combine all the ideas so far into a new remix of the
Habanera. You might notice that I've included another part of the bass
line as a comment. Once you've typed it all into a fresh buffer hit Run
to hear the composition. Now, without hitting stop, *uncomment* the
second line by removing the `#` and hit run again - how marvellous is
that! Now, start mashing it around yourself and have fun.

```
use_debug false
bizet_bass = (ring :d, :r, :r, :a, :f5, :r, :a, :r)
#bizet_bass = (ring :d, :r, :r, :Bb, :g5, :r, :Bb, :r)

with_fx :reverb, room: 1, mix: 0.3 do
  live_loop :bizet do
    with_fx :slicer, phase: 0.125 do
      synth :blade, note: :d4, release: 8,
        cutoff: 100, amp: 1.5
    end
    16.times do
      tick
      play bizet_bass.look, release: 0.1
      play bizet_bass.look - 12, release: 0.3
      sleep 0.125
    end
  end
end

live_loop :ind do
  sample :loop_industrial, beat_stretch: 1,
    cutoff: 100, rate: 1
  sleep 1
end

live_loop :drums do
  sample :bd_haus, cutoff: 110
  synth :beep, note: 49, attack: 0,
    release: 0.1
  sleep 0.5
end
```

A.8 Become a Minecraft VJ

# Become a Minecraft VJ

![Screen 0](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.08-minecraft-vj/minecraft-vj-0-small.png)

Everyone has played Minecraft. You will all have built amazing
structures, designed cunning traps and even created elaborate cart lines
controlled by redstone switches. How many of you have performed with
Minecraft? We bet you didn't know that you could use Minecraft to create
amazing visuals just like a professional VJ.

If your only way of modifying Minecraft was with the mouse, you'd have a
tough time changing things fast enough. Luckily for you your Raspberry
Pi comes with a version of Minecraft that can be controlled with
code. It also comes with an app called Sonic Pi which makes coding
Minecraft not only easy but also incredibly fun.

In today's article we'll be showing you some of the tips and tricks that
we've used to create performances in night clubs and music venues around
the world.

Let's get started...

# Getting Started

Let's start with a simple warm up exercise to refresh ourselves with the
basics.  First up, crack open your Raspberry Pi and then fire up both
Minecraft and Sonic Pi. In Minecraft, create a new world, and in Sonic
Pi choose a fresh buffer and write in this code:

```
mc_message "Let's get started..."
```

Hit the Run button and you'll see the message over in the Minecraft
window. OK, we're ready to start, let's have some fun......

# Sand Storms

When we're using Minecraft to create visuals we try and think about what
will both look interesting and also be easy to generate from code. One
nice trick is to create a sand storm by dropping sand blocks from the
sky. For that all we need are a few basic fns:

* `sleep` - for inserting a delay between actions
* `mc_location` - to find our current location
* `mc_set_block`-  to place sand blocks at a specific location
* `rrand` - to allow us to generate random values within a range
* `live_loop` - to allow us to continually make it rain sand

If you're unfamiliar with any of the built-in fns such as `rrand`, just
type the word into your buffer, click on it and then hit the keyboard
combo `Control-i` to bring up the built-in documentation. Alternatively
you can navigate to the *lang* tab in the Help system and then look up
the fns directly along with all the other exciting things you can do.

Let's make it rain a little first before unleashing the full power of
the storm. Grab your current location and use it to create a few sand
blocks up in the sky nearby:

```
x, y, z = mc_location
mc_set_block :sand, x, y + 20, z + 5
sleep 2
mc_set_block :sand, x, y + 20, z + 6
sleep 2
mc_set_block :sand, x, y + 20, z + 7
sleep 2
mc_set_block :sand, x, y + 20, z + 8
```

When you hit Run, you might have to look around a little as the blocks
may start falling down behind you depending on which direction you're
currently facing. Don't worry, if you missed them just hit Run again for
another batch of sand rain - just make sure you're looking the right
way!

Let's quickly review what's going on here. On the first line we grabbed
Steve's location as coordinates with the fn `mc_location` and placed
them into the vars `x`, `y`, and `z`. Then on the next lines we used the
`mc_set_block` fn to place some sand at the same coordinates as Steve
but with some modifications. We chose the same x coordinate, a y
coordinate 20 blocks higher and then successively larger z coordinates
so the sand dropped in a line away from Steve.

Why don't you take that code and start playing around with it yourself?
Try adding more lines, changing the sleep times, try mixing `:sand` with
`:gravel` and choose different coordinates. Just experiment and have fun!

# Live Loops Unleashed

OK, it's time to get the storm raging by unleashing the full power of
the `live_loop` - Sonic Pi's magical ability which unleashes the full
power of live coding - changing code on-the-fly whilst it's running!

```
live_loop :sand_storm do
  x, y, z = mc_location
  xd = rrand(-10, 10)
  zd = rrand(-10, 10)
  co = rrand(70, 130)
  synth :cnoise, attack: 0, release: 0.125, cutoff: co
  mc_set_block :sand, x + xd, y+20, z+zd
  sleep 0.125
end
```

What fun! We're looping round pretty quickly (8 times a second) and
during each loop we're finding Steve's location like before but then
generating 3 random values:

* `xd` - the difference for x which will be between -10 and 10
* `zd` - the difference for z also between -10 and 10
* `co` - a cutoff value for the low pass filter between 70 and 130

We then use those random values in the fns `synth` and `mc_set_block`
giving us sand falling in random locations around Steve along with a
percussive rain-like sound from the `:cnoise` synth.

For those of you new to live loops - this is where the fun really starts
with Sonic Pi. Whilst the code is running and the sand is pouring down,
try changing one of the values, perhaps the sleep time to `0.25` or the
`:sand` block type to `:gravel`. Now hit run *again*. Hey Presto! Things
changed without the code stopping. This is your gateway to performing
like a real VJ. Keep practising and changing things around. How
different can you make the visuals without stopping the code?

# Epic Block Patterns

![Screen 1](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.08-minecraft-vj/minecraft-vj-1-small.png)

Finally, another great way of generating interesting visuals is to
generate huge patterned walls to fly towards and close by. For this
effect we'll need to move from placing the blocks randomly to placing
them in an ordered manner. We can do this by nesting two sets of
iteration (hit the Help button and navigate to section 5.2 of the
tutorial "Iteration and Loops" for more background on iteration). The
funny `|xd|` after the do means that `xd` will be set for each value of
the iteration. So the first time it will be 0, then 1, then 2... etc. By
nesting two lots of iteration together like this we can generate all the
coordinates for a square. We can then randomly choose block types from a
ring of blocks for an interesting effect:

```
x, y, z = mc_location
bs = (ring :gold, :diamond, :glass)
10.times do |xd|
  10.times do |yd|
    mc_set_block bs.choose, x + xd, y + yd, z
  end
end
```

Pretty neat. Whilst we're having fun here, try changing `bs.choose` to
`bs.tick` to move from a random pattern to a more regular one. Try
changing the block types and the more adventurous of you might want to
try sticking this within a `live_loop` so that the patterns keep changing
automatically.

Now, for the VJ finale - change the two `10.times` to `100.times` and
hit Run. Kaboom! A Huge gigantic wall of randomly placed bricks. Imagine
how long it would take you to build that manually with your mouse!
Double-tap space to enter fly-mode and start swooping by for some great
visual effects. Don't stop here though - use your imagination to conjure
up some cool ideas and then use the coding power of Sonic Pi to make it
real. When you've practised enough dim the lights and put on a VJ show
for your friends!

A.9 Randomisation

# Surfing Random Streams

Back in episode 4 of this tutorial series we took a brief look at
randomisation whilst coding up some sizzling synth riffs. Given that
randomisation is such an important part of my live coding DJ sets I
thought it would be useful to cover the fundamentals in much greater
detail. So, get your lucky hat on and let's surf some random streams!

# There is no random

The first thing to learn which might really surprise you when playing
with Sonic Pi's randomisation functions is that they're not actually
really random. What does this actually mean? Well, let's try a couple of
tests. First, imagine a number in your head between 0 and 1. Keep it
there and don't tell me. Now let me guess... was it `0.321567`? No? Bah,
I'm clearly no good at this. Let me have another go, but let's ask Sonic
Pi to choose a number this time. Fire up Sonic Pi v2.7+ and ask it for a
random number but again don't tell me:

```
print rand
```

Now for the reveal... was it `0.75006103515625`? Yes! Ha, I can see
you're a little sceptical. Perhaps it was just a lucky guess. Let's try
again. Press the Run button again and see what we get... What?
`0.75006103515625` again? This clearly can't be random! You're right,
it's not.

What's going on here? The fancy computer science word here is
determinism. This just means that nothing is by chance and everything is
destined to be. Your version of Sonic Pi is destined to always return
`0.75006103515625` in the program above. This might sound pretty
useless, but let me assure you that it's one of the most powerful parts
of Sonic Pi. If you stick at it you'll learn how to rely on the
deterministic nature of Sonic Pi's randomisation as a fundamental
building block for your compositions and live coded DJ sets.

# A Random Melody

When Sonic Pi boots it actually loads into memory a sequence of 441,000
pre-generated random values. When you call a random function such as
`rand` or `rrand`, this random stream is used to generate your
result. Each call to a random function consumes a value from this
stream. Therefore the 10th call to a random function will use the 10th
value from the stream. Also, every time you press the Run button, the
stream is reset for that run. This is why I could predict the result to
`rand` and why the 'random' melody was the same every time. Everybody's
version of Sonic Pi uses the exact same random stream which is very
important when we start sharing our pieces with each other.

Let's use this knowledge to generate a repeatable random melody:

```
8.times do
 play rrand_i(50, 95)
 sleep 0.125
end
```

Type this into a spare buffer and hit Run. You'll hear a melody
consisting of 'random' notes between 50 and 95. When it's finished, hit
Run again to hear exactly the same melody again.

## Handy Randomisation Functions

Sonic Pi comes with a number of useful functions for working with the
random stream. Here's a list of some of the most useful:

* `rand` - Simply returns the next value in the random stream
* `rrand` - Returns a random value within a range
* `rrand_i` - Returns a random whole number within a range
* `one_in` - Returns true or false with the given probability
* `dice` - Imitates rolling a dice and returns a value between 1 and 6
* `choose` - Chooses a random value from a list

Check out their documentation in the Help system for detailed
information and examples.

# Resetting the Stream

Whilst the ability to repeat a sequence of chosen notes is essential to
allow you to replay a riff on the dance floor, it might not be exactly
the riff you want. Wouldn't it be great if we could try a number of
different riffs and choose the one we liked best? This is where the real
magic starts.

We can manually set the stream with the fn `use_random_seed`. In
Computer Science, a random seed is the starting point from which a new
stream of random values can sprout out and blossom. Let's try it:

```
use_random_seed 0
3.times do
  play rrand_i(50, 95)
  sleep 0.125
end
```

Great, we get the first three notes of our random melody above: `84`,
`83` and `71`. However, we can now change the seed to something
else. How about this:

```
use_random_seed 1
3.times do
  play rrand_i(50, 95)
  sleep 0.125
end
```

Interesting, we get `83`, `71` and `61` . You might notice that the
first two numbers here are the same as the last two numbers before -
this isn't a coincidence.

Remember that the random stream is just a giant list of 'pre-rolled'
values. Using a random seed simply jumps us to a point in that
list. Another way of thinking about it is to imagine a huge deck of
pre-shuffled cards. Using a random seed is cutting the deck at a
particular point. The fabulous part of this is that it's precisely this
ability to jump around the random stream which gives us huge power when making
music.

Let's revisit our random melody of 8 notes with this new stream
resetting power, but let's also throw in a live loop so we can
experiment live whilst it's playing:

```
live_loop :random_riff do
  use_random_seed 0
  8.times do
    play rrand_i(50, 95), release: 0.1
    sleep 0.125
  end
end
```

Now, whilst it's still playing, change the seed value from `0` to
something else. Try `100`, what about `999`. Try your own values,
experiment and play around - see which seed generates the riff you like
best.

# Bringing it all together

This month's tutorial has been quite a technical dive into the workings
of Sonic Pi's randomisation functionality. Hopefully it has given you
some insight into how it works and how you can start using randomisation
in a reliable way to create repeatable patterns within your music. It's
important to stress that you can use repeatable randomisation *anywhere*
you want. For example, you can randomise the amplitude of notes, the
timing of the rhythm, the amount of reverb, the current synth, the mix
of an FX, etc. etc. In the future we'll take a close look at some of
these applications, but for now let me leave you with a short example.

Type the following into a spare buffer, hit Run, and then start changing
the seeds around, hit Run again (whilst it's still playing) and explore
the different sounds, rhythms and melodies you can make. When you find a
nice one, remember the seed number so you can get back to it. Finally,
when you've found a few seeds you like, put on a live coded performance
for your friends by simply switching between your favourite seeds to
create a full piece.

```
live_loop :random_riff do
  use_random_seed 10300
  use_synth :prophet
  s = [0.125, 0.25, 0.5].choose
  8.times do
    r = [0.125, 0.25, 1, 2].choose
    n = (scale :e3, :minor).choose
    co = rrand(30, 100)
    play n, release: r, cutoff: co
    sleep s
  end
end

live_loop :drums do
  use_random_seed 2001
  16.times do
    r = rrand(0.5, 10)
    sample :drum_bass_hard, rate: r, amp: rand
    sleep 0.125
  end
end
```

A.10 Control

# Controlling Your Sound

So far during this series we've focussed on triggering sounds. We've
discovered that we can trigger the many synths built into Sonic Pi with
`play` or `synth` and how to trigger pre-recorded samples with
`sample`. We've also looked at how we can wrap these triggered sounds
within studio FX such as reverb and distortion using the `with_fx`
command. Combine this with Sonic Pi's incredibly accurate timing system
and you can produce a vast array of sounds, beats and riffs. However,
once you've carefully selected a particular sound's options and
triggered it, there's no ability to mess with it whilst it's playing
right? Wrong! Today you're going to learn something very powerful - how
to control running synths.

## A Basic Sound

Let's create a nice simple sound. Fire up Sonic Pi and in a fresh buffer
type the following:

```
synth :prophet, note: :e1, release: 8, cutoff: 100
```

Now press the Run button at the top left to hear a lovely rumbling synth
sound. Go ahead, press it again a few times to get a feel for it. OK,
done? Let's start controlling it!

## Synth Nodes

A little known feature in Sonic Pi is that the fns `play`, `synth` and
`sample`, return something called a `SynthNode` which represents a
running sound. You can capture one of these `SynthNode`s using a
standard variable and then **control** it at a later point in time. For
example, let's change the value of the `cutoff:` opt after 1 beat:

```
sn = synth :prophet, note: :e1, release: 8, cutoff: 100
sleep 1
control sn, cutoff: 130
```

Let's look at each line in turn:

Firstly we trigger the `:prophet` synth using the `synth` fn as
normal. However we also capture the result in a variable called `sn`. We
could have called this variable something completely different such as
`synth_node` or `jane` - the name doesn't matter. However, it's
important to choose a name that's meaningful to you for your
performances and for people reading your code. I chose `sn` as it's a nice
short mnemonic for synth node.

On line 2 we have a standard `sleep` command. This does nothing special
- it just asks the computer to wait for 1 beat before moving onto the
next line.

Line 3 is where the control fun starts. Here, we use the `control` fn to
tell our running `SynthNode` to change the cutoff value to `130`. If you
hit the **Run** button, you'll hear the `:prophet` synth start playing
as before, but after 1 beat it will shift to sound a lot brighter.

Modulatable Options

Most of Sonic Pi's synths and FX opts may be changed after being
triggered. However, this isn't the case for all of them. For example,
the envelope opts `attack:`, `decay:`, `sustain:` and `release:` can
only be set when triggering the synth. Figuring out which opts can and
can't be changed is simple - just head to the documentation for a given
synth or FX and then scroll down to the individual option documentation
and look for the phrases "May be changed whilst playing" or "Can not be
changed once set". For example, the documentation for the `:beep`
synth's `attack:` opt makes it clear that it's not possible to change
it:

* Default: 0
* Must be zero or greater
* Can not be changed once set
* Scaled with current BPM value

## Multiple Changes

Whilst a synth is running you're not limited to changing it only once -
you're free to change it as many times as you like. For example, we can
turn our `:prophet` into a mini arpeggiator with the following:

```
notes = (scale :e3, :minor_pentatonic)
sn = synth :prophet, note: :e1, release: 8, cutoff: 100
sleep 1
16.times do
  control sn, note: notes.tick
  sleep 0.125
end
```

In this snippet of code we just added a couple of extra things. First we
defined a new variable called `notes` which contains the notes we'd like
to cycle through (an arpeggiator is just a fancy name for something that
cycles through a list of notes in order). Secondly we replaced our
single call to `control` with an iteration calling it 16 times. In each
call to `control` we `.tick` through our ring of `notes` which will
automatically repeat once we get to the end (thanks to the fabulous power
of Sonic Pi's rings). For a bit of variety try replacing `.tick` with
`.choose` and see if you can hear the difference.

Note that we can change multiple opts simultaneously. Try changing the
control line to the following and listen for the difference:

```
control sn, note: notes.tick, cutoff: rrand(70, 130)
```

## Sliding

When we control a `SynthNode`, it responds exactly on time and instantly
changes the value of the opt to the new one as if you'd pressed a button
or flicked a switch requesting the change. This can sound rhythmical and percussive -
especially if the opt controls an aspect of the timbre such as
`cutoff:`. However, sometimes you don't want the change to happen
instantaneously. Instead, you might want to smoothly move from the
current value to the new one as if you'd moved a slider or dial. Of
course, Sonic Pi can also do this too using the `_slide:` opts.

Each opt that can be modified also has a special corresponding `_slide:`
opt that allows you to specify a slide time. For example, `amp:` has
`amp_slide:` and `cutoff:` has `cutoff_slide:`. These slide opts work
slightly differently than all the other opts in that they tell the synth
note how to behave **next time they are controlled**. Let's take a look:

```
sn = synth :prophet, note: :e1, release: 8, cutoff: 70, cutoff_slide: 2
sleep 1
control sn, cutoff: 130
```

Notice how this example is exactly the same as before except with the
addition of `cutoff_slide:`. This is saying that next time this synth
has its `cutoff:` opt controlled, it will take 2 beats to slide from the
current value to the new one. Therefore, when we use `control` you can
hear the cutoff slide from 70 to 130. It creates an interesting dynamic
feel to the sound. Now, try changing the `cutoff_slide:` time to a
shorter value such as 0.5 or a longer value such as 4 to see how it
changes the sound. Remember, you can slide any of the modifiable opts in
exactly this way and each `_slide:` value can be totally different so
you can have the cutoff sliding slowly, the amp sliding fast and the pan
sliding somewhere in between if that's what you're looking to create...

## Bringing it all together

Let's look at a short example which demonstrates the power of
controlling synths after they've been triggered. Notice that you can
also slide FX just like synths although with a slightly different
syntax. Check out section 7.2 of the built-in tutorial for more
information on controlling FX.

Copy the code into a spare buffer and take a listen. Don't stop there
though - play around with the code. Change the slide times, change the
notes, the synth, the FX and the sleep times and see if you can turn it
into something completely different!

```
live_loop :moon_rise do
  with_fx :echo, mix: 0, mix_slide: 8 do |fx|
    control fx, mix: 1
    notes = (scale :e3, :minor_pentatonic, num_octaves: 2).shuffle
    sn = synth :prophet , sustain: 8, note: :e1, cutoff: 70, cutoff_slide: 8
    control sn, cutoff: 130
    sleep 2
    32.times do
      control sn, note: notes.tick, pan: rrand(-1, 1)
      sleep 0.125
    end
  end
end
```

A.11 Tick Tock

# Tracking the Beat

Last month in this series we took a deep technical dive into the
randomisation system underpinning Sonic Pi. We explored how we can use
it to deterministically add new levels of dynamic control over our
code. This month we're going to continue our technical dive and turn our
attention to Sonic Pi's unique tick system. By the end of this article
you'll be ticking your way through rhythms and riffs on your way to
being a live coding DJ.

# Beat Counting

When making music we often want to do a different thing depending on
which beat it is. Sonic Pi has a special beat counting system called
`tick` to give you precise control over when a beat actually occurs and
even supports multiple beats with their own tempos.

Let's have a play - to advance the beat we just need to call
`tick`. Open up a fresh buffer, type in the following and hit Run:

```
puts tick #=> 0
```

This will return the current beat: `0`. Notice that even if you press
the Run button a few times it will always return `0`. This is because
each run starts a fresh beat counting from 0.  However, whilst the run
is still active, we can advance the beat as many times as we want:

```
puts tick #=> 0
puts tick #=> 1
puts tick #=> 2
```

Whenever you see the symbol `#=>` at the end of a line of
code it means that that line will log the text on the
right-hand-side. For example, `puts foo #=> 0` means the code `puts foo`
prints `0` to the log at that point in the program.

# Checking the Beat

We've seen that `tick` does two things. It increments (adds one)
and returns the current beat. Sometimes we just want to look at the
current beat without having to increment it which we can do via `look`:

```
puts tick #=> 0
puts tick #=> 1
puts look #=> 1
puts look #=> 1
```

In this code we tick the beat up twice and then call `look` twice. We'll
see the following values in the log: `0`, `1`, `1`, `1`. The first two
`tick`s returned `0`, then `1` as expected, then the two `look`s just
returned the last beat value twice which was `1`.


# Rings

So now we can advance the beat with `tick` and check the beat with
`look`. What next? We need something to tick over. Sonic Pi uses rings
for representing riffs, melodies and rhythms and the tick system has
been specifically designed to work very closely with them. In fact,
rings have their own dot version of `tick` which does two things. Firstly,
it acts like a regular tick and increments the beat. Secondly it looks
up the ring value using the beat as the index. Let's take a look:

```
puts (ring :a, :b, :c).tick #=> :a
```

`.tick` is a special dot version of `tick` which will return the first
value of the ring `:a`. We can grab each of the values in the ring by
calling `.tick` multiple times:

```
puts (ring :a, :b, :c).tick #=> :a
puts (ring :a, :b, :c).tick #=> :b
puts (ring :a, :b, :c).tick #=> :c
puts (ring :a, :b, :c).tick #=> :a
puts look                   #=> 3
```

Take a look at the log and you'll see `:a`, `:b`, `:c` and then `:a`
again. Notice that `look` returns `3`. Calls to `.tick` act just like
they are regular calls to `tick` - they increment the local beat.


# A Live Loop Arpeggiator

The real power comes when you mix `tick` with rings and
`live_loop`s. When combined we have all the tools we need to both build
and understand a simple arpegiator. We need just four things:

1. A ring containing the notes we want to loop over.
2. A means of incrementing and obtaining the beat.
3. The ability to play a note based on the current beat.
4. A loop structure to keep the arpegiator repeating.

These concepts can all be found in the following code:

```
notes = (ring 57, 62, 55, 59, 64)

live_loop :arp do
  use_synth :dpulse
  play notes.tick, release: 0.2
  sleep 0.125
end
```

Let's look at each of these lines. First we define our ring of notes
which we'll continually play. We then create a `live_loop` called `:arp`
which loops round for us. Each time round the `live_loop` we set our
synth to `:dpulse` and then play the next note in our ring using
`.tick`. Remember that this will increment our beat counter and use the
latest beat value as an index into our notes ring. Finally, we wait for
an eighth of a beat before looping round again.

# Multiple Simultaneous Beats

A really important thing to know is that `tick`s are local to the
`live_loop`. This means that each `live_loop` has its own independent
beat counter. This is much more powerful than having a global metronome
and beat. Let's take a look at this in action:

```
notes = (ring 57, 62, 55, 59, 64)

with_fx :reverb do
  live_loop :arp do
    use_synth :dpulse
    play notes.tick + 12, release: 0.1
    sleep 0.125
  end
end

live_loop :arp2 do
  use_synth :dsaw
  play notes.tick - 12, release: 0.2
  sleep 0.75
end
```

# Clashing Beats

A big cause of confusion with Sonic Pi's tick system is when people want
to tick over multiple rings in the same `live_loop`:

```
use_bpm 300
use_synth :blade
live_loop :foo do
  play (ring :e1, :e2, :e3).tick
  play (scale :e3, :minor_pentatonic).tick
  sleep 1
end
```

Even though each `live_loop` has its own independent beat counter, we're
calling `.tick` twice within the same `live_loop`. This means that the
beat will be incremented twice every time round. This can produce some
interesting polyrhythms but is often not what you want. There are two
solutions to this problem. One option is to manually call `tick` at the
start of the `live_loop` and then use `.look` to look up the current
beat in each `live_loop`. The second solution is to pass a unique name
to each call to `.tick` such as `.tick(:foo)`. Sonic Pi will then create
and track a separate beat counter for each named tick you use. That way
you can work with as many beats as you need! See the section on named
ticks in 9.4 of the built-in tutorial for more information.

# Bringing it all together

Let's bring all this knowledge of `tick`s, `ring`s and `live_loop`s
together for a final fun example. As usual, don't treat this as a
finished piece. Start changing things and play around with it and see
what you can turn it into. See you next time...

```
use_bpm 240
notes = (scale :e3, :minor_pentatonic).shuffle

live_loop :foo do
  use_synth :blade
  with_fx :reverb, reps: 8, room: 1 do
    tick
    co = (line 70, 130, steps: 32).tick(:cutoff)
    play (octs :e3, 3).look, cutoff: co, amp: 2
    play notes.look, amp: 4
    sleep 1
  end
end

live_loop :bar do
  tick
  sample :bd_ada if (spread 1, 4).look
  use_synth :tb303
  co = (line 70, 130, steps: 16).look
  r = (line 0.1, 0.5, steps: 64).mirror.look
  play notes.look, release: r, cutoff: co
  sleep 0.5
end
```

A.12 Sample Slicing

# Sample Slicing

Way back in episode 3 of this Sonic Pi series we looked at how to loop,
stretch and filter one of the most famous drum breaks of all time - the
Amen Break. In this tutorial we're going to take this one step further
and learn how to slice it up, shuffle the slices and glue it back
together in a completely new order. If that sounds a bit crazy to you,
don't worry, it will all become clear and you'll soon master a powerful
new tool for your live coded sets.

# Sound as Data

Before we get started let's just take a brief moment to understand how
to work with samples. By now, you've all hopefully played with Sonic
Pi's powerful sampler. If not, there's no time like the present! Boot up
your Raspberry Pi, launch Sonic Pi from the Programming menu, type the
following into a fresh buffer and then hit the Run button to hear a
pre-recorded drum beat:

```
sample :loop_amen
```

A recording of a sound is simply represented as data - lots of numbers
between -1 and 1 which represent the peaks and troughs of the sound
wave. If we play those numbers back in order, we get the original
sound. However, what's to stop us from playing them back in a different
order and creating a new sound?

How are samples actually recorded? It's actually pretty simple once you
understand the basic physics of sound. When you make a sound - for
example by hitting a drum, the noise travels through the air in a
similar fashion to how the surface of a lake ripples when you throw a
pebble into it. When those ripples reach your ears, your eardrum moves
sympathetically and converts those movements into the sound you hear.
If we wish to record and play back the sound, we therefore need a way
of capturing, storing and reproducing those ripples. One way is to use
a microphone which acts like an eardrum and moves back and forth as the
sound ripples hit it. The microphone then converts its position into a
tiny electric signal which is then measured many times a second. These
measurements are then represented as a series of numbers between -1 and
1.

If we were to plot a visualisation of the sound it would be a simple
graph of data with time on the x axis and microphone/speaker position
as a value between -1 and 1 on the y axis. You can see an example of
such a graph at the top of the diagram.

# Playing Part of a Sample

So, how do we code Sonic Pi to play a sample back in a different order?
To answer this question we need to take a look at the `start:` and
`finish:` opts for `sample`. These let us control the start and finish
positions of our playback of the numbers which represent the sound. The
values for both of these opts are represented as a number between `0` and
`1` where `0` represents the start of the sample and `1` is the end. So,
to play the first half of the Amen Break, we just need to specify a
`finish:` of `0.5`:

```
sample :loop_amen, finish: 0.5
```

We can add in a `start:` value to play an even smaller section of the sample:

```
sample :loop_amen, start: 0.25, finish: 0.5
```

For fun, you can even have the `finish:` opt's value be *before*
`start:` and it will play the section backwards:

```
sample :loop_amen, start: 0.5, finish: 0.25
```

# Re-ordering Sample Playback

Now that we know that a sample is simply a list of numbers that can be
played back in any order and also how to play a specific part of a
sample we can now start having fun playing a sample back in the 'wrong'
order.

![Amen Slices](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.12-sample-slicing/amen_slice.png)

Let's take our Amen Break and chop it up into 8 equally-sized slices and
then shuffle the pieces around. Take a look at the diagram: at the top
A) represents the graph of our original sample data. Chopping it into 8
slices gives us B) - notice that we've given each slice a different
colour to help distinguish them. You can see each slice's start and
finish values at the top. Finally C) is one possible re-ordering of the
slices. We can then play this back to create a new beat. Take a look at
the code to do this:

```
live_loop :beat_slicer do
  slice_idx = rand_i(8)
  slice_size = 0.125
  s = slice_idx * slice_size
  f = s + slice_size
  sample :loop_amen, start: s, finish: f
  sleep sample_duration :loop_amen, start: s, finish: f
end
```

1. we choose a random slice to play which should be a random number
   between 0 and 7 (remember that we start counting at 0). Sonic Pi has
   a handy function for exactly this: `rand_i(8)`. We then store this
   random slice index in the variable `slice_idx`.

2. We define our `slice_size` which is 1/8 or 0.125. The `slice_size` is
   necessary for us to convert our `slice_idx` into a value between 0
   and 1 so we can use it as our `start:` opt.

3. We calculate the start position `s` by multiplying the `slice_idx` by
   the `slice_size`.

4. We calculate the finish position `f` by adding the `slice_size` to
   the start position `s`.

5. We can now play the sample slice by plugging in the `s` and `f`
   values into the `start:` and `finish:` opts for `sample`.

6. Before we play the next slice we need to know how long to `sleep`
   which should be the duration of the sample slice.  Luckily, Sonic Pi
   has us covered with `sample_duration` which accepts all the same opts
   as `sample` and simply returns the duration. Therefore, by passing
   `sample_duration` our `start:` and `finish:` opts, we can find out
   the duration of a single slice.

7. We wrap all of this code in a `live_loop` so that we continue to pick
   new random slices to play.


## Bringing it all together

Let's combine everything we've seen so far into a final example which
demonstrates how we can take a similar approach to combine randomly
sliced beats with some bass to create the start of an interesting
track. Now it's your turn - take the code below as a starting point and
see if you can take it in your own direction and create something new...

```
live_loop :sliced_amen do
  n = 8
  s =  line(0, 1, steps: n).choose
  f = s + (1.0 / n)
  sample :loop_amen, beat_stretch: 2, start: s, finish: f
  sleep 2.0  / n
end

live_loop :acid_bass do
  with_fx :reverb, room: 1, reps: 32, amp: 0.6 do
    tick
    n = (octs :e0, 3).look - (knit 0, 3 * 8, -4, 3 * 8).look
    co = rrand(70, 110)
    synth :beep, note: n + 36, release: 0.1, wave: 0, cutoff: co
    synth :tb303, note: n, release: 0.2, wave: 0, cutoff: co
    sleep (ring 0.125, 0.25).look
  end
end
```

A.13 Code a Probabilistic Sequencer

# Code a Probabilistic Sequencer

In a previous episode of this Sonic Pi series we explored the power of
randomisation to introduce variety, surprise and change into our live
coded tracks and performances. For example, we randomly picked notes
from a scale to create never-ending melodies. Today we're going to learn
a new technique which uses randomisation for rhythm - probabilistic
beats!

# Probability

Before we can start making new beats and synth rhythms we need to take a
quick dive into the basics of probability. This might sound daunting and
complicated, but really it's just as simple as rolling a dice -
honestly!  When you take a regular 6 sided board game dice and roll it
what's actually happening? Well, firstly you'll roll either a 1, 2, 3,
4, 5 or 6 with exactly the same chance of getting any of the numbers. In
fact, given that it's a 6 sided dice, on average (if you roll lots and
lots of times) you'll throw a 1 every 6 throws. This means you have a 1
in 6 chance of throwing a 1. We can emulate dice rolls in Sonic Pi with
the fn `dice`. Let's roll one 8 times:

```
8.times do
  puts dice
  sleep 1
end
```

Notice how the log prints values between 1 and 6 just as if we'd rolled
a real dice ourselves.

# Random Beats

Now imagine you had a drum and every time you were about to hit it you
rolled a dice. If you rolled a 1, you hit the drum and if you rolled any
other number you didn't. You now have a probabilistic drum machine
working with a probability of 1/6! Let's hear what that sounds like:

```
live_loop :random_beat do
  sample :drum_snare_hard if dice == 1
  sleep 0.125
end
```


Let's quickly go over each line to make sure everything is very
clear. First we create a new `live_loop` called `:random_beat` which
will continually repeat the two lines between `do` and `end`. The first
of these lines is a call to `sample` which will play a pre-recorded
sound (the `:drum_snare_hard` sound in this case). However, this line
has a special conditional `if` ending. This means that the line will
only be executed if the statement on the right hand side of the `if` is
`true`. The statement in this case is `dice == 1`. This calls our `dice`
function which, as we have seen, returns a value between 1 and 6. We
then use the equality operator `==` to check to see if this value is
`1`. If it is `1`, then the statement resolves to `true` and our snare
drum sounds, if it isn't `1` then the statement resolves to `false` and
the snare is skipped. The second line simply waits for `0.125` seconds
before rolling the dice again.

# Changing Probabilities

Those of you that have played role play games will be familiar with lots
of strangely shaped dice with different ranges. For example there is the
tetrahedron shaped dice which has 4 sides and even a 20 sided dice in
the shape of a icosahedron. The number of sides on the dice changes the
chance, or probability of rolling a 1. The fewer sides, the more likely
you are to roll a 1 and the more sides the less likely. For example,
with a 4 sided dice, there's a one in 4 chance of rolling a 1 and with a
20 sided dice there's a one in 20 chance. Luckily, Sonic Pi has the
handy `one_in` fn for describing exactly this. Let's play:

```
live_loop :different_probabilities do
  sample :drum_snare_hard if one_in(6)
  sleep 0.125
end
```

Start the live loop above and you'll hear the familiar random
rhythm. However, don't stop the code running. Instead, change the `6` to
a different value such as `2` or `20` and hit the `Run` button
again. Notice that lower numbers mean the snare drum sounds more
frequently and higher numbers mean the snare triggers fewer
times. You're making music with probabilities!

# Combining Probabilities

Things get really exciting when you combine multiple samples being
triggered with different probabilities. For example:

```
live_loop :multi_beat do
  sample :elec_hi_snare if one_in(6)
  sample :drum_cymbal_closed if one_in(2)
  sample :drum_cymbal_pedal if one_in(3)
  sample :bd_haus if one_in(4)
  sleep 0.125
end
```

Again, run the code above and then start changing the probabilities to
modify the rhythm. Also, try changing the samples to create an entirely
new feel. For example try changing `:drum_cymbal_closed` to
`:bass_hit_c` for extra bass!


# Repeatable Rhythms

Next, we can use our old friend `use_random_seed` to reset the random
stream after 8 iterations to create a regular beat. Type the following
code to hear a much more regular and repeating rhythm. Once you hear the
beat, try changing the seed value from `1000` to another number. Notice
how different numbers generate different beats.

```
live_loop :multi_beat do
  use_random_seed 1000
  8.times do
    sample :elec_hi_snare if one_in(6)
    sample :drum_cymbal_closed if one_in(2)
    sample :drum_cymbal_pedal if one_in(3)
    sample :bd_haus if one_in(4)
    sleep 0.125
  end
end
```

One thing I tend to do with this kind of structure is to remember which
seeds sound good and make a note of them. That way I can easily
re-create my rhythms in future practice sessions or performances.

# Bringing it all together

Finally, we can throw in some random bass to give it some nice melodic
content. Notice that we can also use our newly discovered probabilistic
sequencing method on synths just as well as samples. Don't leave it at
that though - tweak the numbers and make your own track with the power
of probabilities!

```
live_loop :multi_beat do
  use_random_seed 2000
  8.times do
    c = rrand(70, 130)
    n = (scale :e1, :minor_pentatonic).take(3).choose
    synth :tb303, note: n, release: 0.1, cutoff: c if rand < 0.9
    sample :elec_hi_snare if one_in(6)
    sample :drum_cymbal_closed if one_in(2)
    sample :drum_cymbal_pedal if one_in(3)
    sample :bd_haus, amp: 1.5 if one_in(4)
    sleep 0.125
  end
end
```

A.14 Amplitude Modulation

# Amplitude Modulation

This month we're going to take a deep dive into one of Sonic Pi's most
powerful and flexible audio FX - the `:slicer`. By the end of this
article you will have learned how to manipulate the overall volume of
parts of our live coded sound in powerful new ways. This will allow you
to create new rhythmic and timbral structures and broaden your sonic
possibilities.

## Slice that Amp

So, what does the `:slicer` FX actually do?  One way to think about it
is that it's just like having someone play around with the volume
control on your TV or home hi-fi. Let's take a look but first, listen to
the deep growl of the following code which triggers the `:prophet`
synth:

```
synth :prophet, note: :e1, release: 8, cutoff: 70
synth :prophet, note: :e1 + 4, release: 8, cutoff: 80
```

Now, let's pipe it through the `:slicer` FX:

```

with_fx :slicer do
  synth :prophet, note: :e1, release: 8, cutoff: 70
  synth :prophet, note: :e1 + 4, release: 8, cutoff: 80
end
```

Hear how the slicer acts like it's muting and unmuting the audio with a
regular beat. Also, notice how the `:slicer` affects all the audio
generated between the `do`/`end` blocks. You can control the speed at which
it turns the audio on and off with the `phase:` opt which is short for
phase duration. Its default value is `0.25` which means 4 times a second
at the default BPM of 60. Let's make it faster:

```
with_fx :slicer, phase: 0.125 do
  synth :prophet, note: :e1, release: 8, cutoff: 70
  synth :prophet, note: :e1 + 4, release: 8, cutoff: 80
end
```

Now, play with different `phase:` durations yourself. Try longer and
shorter values. See what happens when you choose a really short
value. Also, try different synths such as `:beep` or `:dsaw` and
different notes. Take a look at the following diagram to see how
different `phase:` values change the number of amplitude changes per
beat.

![Phase Durations](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.14-amplitude-modulation/slicer_phase_durations.png)

Phase duration is the length of time for one on/off cycle. Therefore
smaller values will make the FX switch on and off much faster than
larger values. Good values to start playing with are `0.125`, `0.25`,
`0.5` and `1`.


## Control Waves

By default, the `:slicer` FX uses a square wave to manipulate the
amplitude through time. This is why we hear the amplitude on for a
period, then immediately off for a period, then back on again. It turns
out that the square wave is just one of 4 different control waves that
are supported by `:slicer`. The others are saw, triangle and
(co)sine. Take a look at the diagram below to see what these look
like. We can also hear what they sound like. For example, the following
code uses (co)sine as the control wave. Hear how the sound doesn't turn
on and off abruptly but instead smoothly fades in and out:

```
with_fx :slicer, phase: 0.5, wave: 3 do
  synth :dsaw, note: :e3, release: 8, cutoff: 120
  synth :dsaw, note: :e2, release: 8, cutoff: 100
end
```

Have a play with the different wave forms by changing the `wave:` opt to
`0` for saw, `1` for square, `2` for triangle and `3` for sine. See how
different waves sound with different `phase:` opts too.

Each of these waves can be inverted with the `invert_wave:` opt which
flips it on the y axis. For example, in a single phase the saw wave
typically starts high, and slowly goes down before jumping back to the
top. With `invert_wave: 1` it will start low and slowly go up before
jumping back down again. Additionally, the control wave can be started
at different points with the `phase_offset:` opt which should be a value
between `0` and `1`. By playing around with `phase:`, `wave:`,
`invert_wave:` and `phase_offset` opts you can dramatically change how
the amplitude is modified through time.

![Phase Durations](https://raw.githubusercontent.com/samaaron/sonic-pi/master/etc/doc/images/tutorial/articles/A.14-amplitude-modulation/slicer_control_waves.png)


## Setting your levels

By default, `:slicer` switches between amplitude values `1` (fully loud)
and `0` (silent). This can be changed with the `amp_min:` and `amp_max:`
opts. You can use this alongside the sine wave setting to create a
simple tremolo effect:

```
with_fx :slicer, amp_min: 0.25, amp_max: 0.75, wave: 3, phase: 0.25 do
  synth :saw, release: 8
end
```

This is just like grabbing the volume knob on your hi-fi and moving it
up and down just a little so the sound 'wobbles' in and out.


## Probabilities

One of `:slicer`'s powerful features is its ability to use probability
to choose whether or not to turn the slicer on or off. Before the
`:slicer` FX starts a new phase it rolls a dice and based on the result
either uses the selected control wave or keeps the amplitude off. Let's
take a listen:

```
with_fx :slicer, phase: 0.125, probability: 0.6  do
  synth :tb303, note: :e1, cutoff_attack: 8, release: 8
  synth :tb303, note: :e2, cutoff_attack: 4, release: 8
  synth :tb303, note: :e3, cutoff_attack: 2, release: 8
end
```

Hear how we now have an interesting rhythm of pulses. Try changing the
`probability:` opt to a different value between `0` and `1`. Values
closer to `0` will have more space between each sound due to the
likelihood of the sound being triggered being much lower.

Another thing to notice is that the probability system in the FX is just
like the randomisation system accessible via fns such as `rand` and
`shuffle`. They are both completely deterministic. This means that each
time you hit Run you'll hear exactly the same rhythm of pulses for a
given probability. If you would like to change things around you can use
the `seed:` opt to select a different starting seed. This works exactly
the same as `use_random_seed` but only affects that particular FX.

Finally, you can change the 'resting' position of the control wave when
the probability test fails from `0` to any other position with the
`prob_pos:` opt:

```
with_fx :slicer, phase: 0.125, probability: 0.6, prob_pos: 1  do
  synth :tb303, note: :e1, cutoff_attack: 8, release: 8
  synth :tb303, note: :e2, cutoff_attack: 4, release: 8
  synth :tb303, note: :e3, cutoff_attack: 2, release: 8
end
```

## Slicing Beats

One really fun thing to do is to use `:slicer` to chop a drum beat in
and out:

```
with_fx :slicer, phase: 0.125 do
  sample :loop_mika
end
```

This allows us to take any sample and create new rhythmical possibilites
which is a lot of fun. However, one thing to be careful about is to make
sure that the tempo of the sample matches the current BPM in Sonic Pi
otherwise the slicing will sound totally off. For example, try swapping
`:loop_mika` with the `loop_amen` sample to hear how bad this can sound
when the tempos don't align.

## Changing tempo

As we have already seen, changing the default BPM with `use_bpm` will
make all the sleep times and synth envelope durations grow or shrink to
match the beat. The `:slicer` FX honours this too, as the `phase:` opt
is actually measured in beats not seconds. We can therefore fix the
issue with `loop_amen` above by changing the BPM to match the sample:

```
use_sample_bpm :loop_amen

with_fx :slicer, phase: 0.125 do
  sample :loop_amen
end
```

## Bringing it all together

Let's apply all these ideas into a final example that only uses the
`:slicer` FX to create an interesting combination. Go ahead, start
changing it and make it into your own piece!

```
live_loop :dark_mist do
  co = (line 70, 130, steps: 8).tick
  with_fx :slicer, probability: 0.7, prob_pos: 1 do
    synth :prophet, note: :e1, release: 8, cutoff: co
  end

  with_fx :slicer, phase: [0.125, 0.25].choose do
    sample :guit_em9, rate: 0.5
  end
  sleep 8
end

live_loop :crashing_waves do
  with_fx :slicer, wave: 0, phase: 0.25 do
    sample :loop_mika, rate: 0.5
  end
  sleep 16
end
```





A.15 Five Live Coding Techniques

# Five Live Coding Techniques

In this month's Sonic Pi tutorial we're going to take a look at how you
can start treating Sonic Pi like a real instrument. We therefore need to
start thinking of code in a completely different way. Live coders think
of code in a similar way to how violinists think of their bow. In fact,
just like a violinist can apply various bowing techniques to create
different sounds (long slow motions vs short fast hits) we will explore
five of the basic live coding techniques that Sonic Pi enables. By the
end of this article you'll be able to start practicing for your own live
coded performances.

## 1. Memorise the Shortcuts

The first tip to live coding with Sonic Pi is to start using the
shortcuts. For example, instead of wasting valuable time reaching for
the mouse, moving it over to the Run button and clicking, you can simply
press `alt` and `r` at the same time which is much faster and keeps your
fingers at the keyboard ready for the next edit. You can find out the
shortcuts for the main buttons at the top by hovering the mouse
over them. See section 10.2 of the built-in tutorial for the full list of
shortcuts.

When performing, one fun thing to do is to add a bit of flair with your
arm motion when hitting shortcuts. For example, it's often good to
communicate to the audience when you're about to make a change - so
embellish your movement when hitting `alt-r` just like a guitarist would
do when hitting a big power chord.

## 2. Manually Layer your Sounds

Now you can trigger code instantly with the keyboard, you can instantly
apply this skill for our second technique which is to layer your sounds
manually. Instead of 'composing' using lots of calls to `play`, and
`sample` separated by calls to `sleep` we will have one call to `play`
which we will manually trigger using `alt-r`. Let's try it. Type the
following code into a fresh buffer:

```
synth :tb303, note: :e2 - 0, release: 12, cutoff: 90

```

Now, hit `Run` and whilst the sound is playing, modify the code in order
to drop down four notes by changing it to the following:


```
synth :tb303, note: :e2 - 4, release: 12, cutoff: 90

```

Now, hit `Run` again, to hear both sounds playing at the same time. This
is because Sonic Pi's `Run` button doesn't wait for any previous code to
finish, but instead starts the code running at the same time. This means
you can easily layer lots of sounds manually with minor or major
modifications between each trigger. For example, try changing both the
`note:` and the `cutoff:` opts and then re-trigger.


You can also try this technique with long abstract samples. For example:

```
sample :ambi_lunar_land, rate: 1
```

Try starting the sample off, and then progressively halving the `rate:`
opt between hitting `Run` from `1` to `0.5` to `0.25` to `0.125` and then
even try some negative values such as `-0.5`. Layer the sounds together
and see where you can take it. Finally, try adding some FX.

When performing, working with simple lines of code in this way means
that an audience new to Sonic Pi has a good chance to follow what you're
doing and relate the code that they can read to the sounds they are
hearing.


## 3. Master Live Loops

When working with more rhythmic music, it can often be hard to manually
trigger everything and keep good time. Instead, it is often better to
use a `live_loop`. This provides repetition for your code whilst also
giving the ability to edit the code for the next time round the
loop. They also will run at the same time as other `live_loop`s which
means you can layer them together both with each other and manual code
triggers. Take a look at section 9.2 of the built-in tutorial for more
information about working with live loops.

When performing, remember to make use of `live_loop`'s `sync:` opt to
allow you to recover from accidental runtime mistakes which stop the
live loop running due to an error. If you already have the `sync:` opt
pointing to another valid `live_loop`, then you can quickly fix the
error and re-run the code to re-start things without missing a beat.

## 4. Use the Master Mixer

One of Sonic Pi's best kept secrets is that it has a master mixer
through which all sound flows. This mixer has both a low pass filter and
a high pass filter built-in, so you can easily perform global
modifications to the sound. The master mixer's functionality can be
accessed via the fn `set_mixer_control!`. For example, whilst some code
is running and making sound, enter this into a spare buffer and hit
`Run`:

`
set_mixer_control! lpf: 50
`

After you run this code, all existing and new sounds will have a low
pass filter applied to them and will therefore sound more muffled. Note
that this means that the new mixer values stick until they are changed
again. However, if you want, you can always reset the mixer back to its
default state with `reset_mixer!`. Some of the currently supported opts
are: `pre_amp:`, `lpf:` `hpf:`, and `amp:`. For the full list, see the
built-in docs for `set_mixer_control!`.

Use the mixer's `*_slide` opts to slide one or many opts values over
time. For example, to slowly slide the mixer's low pass filter down from
the current value to 30, use the following:

```
set_mixer_control! lpf_slide: 16, lpf: 30
```

You can then slide quickly back to a high value with:

```
set_mixer_control! lpf_slide: 1, lpf: 130
```

When performing, it's often useful to keep a buffer free for working
with the mixer like this.

## 5. Practice

The most important technique for live coding is practice. The most
common attribute across professional musicians of all kinds is that they
practice playing with their instruments - often for many hours a
day. Practice is just as important for a live coder as a
guitarist. Practice allows your fingers to memorise certain patterns and
common edits so you can type and work with them more fluently. Practice
also gives you opportunities to explore new sounds and code constructs.

When performing, you'll find the more practice you do, the easier it
will be for you to relax into the gig. Practice will also give you a
wealth of experience to draw from. This can help you understand which
kinds of modifications will be interesting and also work well with the
current sounds.

## Bringing it all together

This month, instead of giving you a final example that combines all the
things discussed, let's part by setting down a challenge. See if you can
spend a week practicing one of these ideas every day. For example, one
day practice manual triggers, the next do some basic `live_loop` work
and the following day play around with the master mixer. Then
repeat. Don't worry if things feel slow and clunky at first - just keep
practicing and before you know it you'll be live coding for a real
audience.

A.16 How to Practice Live Coding

# 8 Tips for Live Coding Practice

Last month we took a look at five important techniques for mastering
live coding - in other words, we explored how we could use Sonic Pi to
approach code in the same way we would approach a musical instrument. One
of the important concepts that we discussed was practice. This month
we're going to take a deeper dive into understanding why live coding
practice is important and how you might start.


## Practice regularly

The most important piece of advice is to make sure you practice
regularly. As a rule I typically practice for 1-2 hours a day, but 20
mins is just fine when you're starting out. Little but often is what
you're aiming for - so if you can only manage 10 minutes, that's a great
start.

Practice tip #1 - start to develop a practice routine. Find a nice time
in the day that works for you and try and practice at that time as many
days of the week as you can. Before long you'll be looking forward to your
regular session.


## Learn to Touch Type

If you watch a professional musician performing on stage you'll likely
notice a few things. Firstly, when they play they don't stare at their
instrument. Their fingers, arms and bodies know which keys to press,
strings to pluck or drums to hit without them having to think about it
too much. This is known as "muscle memory" and although it might sound
like something only professionals can do - it's just the same as when
you first learned to walk or ride a bike - practicing through
repetition. Live coders use muscle memory to free their minds from
having to think about where to move their fingers so they can focus on
the music. This is called touch-typing - typing without having to look
at the keyboard.

Practice tip #2 - learn how to touch type. There are many apps, websites
and even games which can help you achieve this. Find one you like the
look of and stick at it until you can code without looking down.


## Code whilst standing

The body of a musician is conditioned for playing their instrument. For
example, a trumpet player needs to be able to blow hard, a guitar player
needs to be able to grip the fretboard with strength and a drummer needs
to be able to continually hit the drums for long periods of time. So,
what's physical about live coding? Just like DJs, live coders typically
perform whilst standing up and some even dance whilst they code! If you
practice live coding whilst sitting at a desk and then have to get up
and stand at a gig, you'll likely find the difference very difficult and
frustrating.

Practice tip #3 - stand whilst you practice. The easiest way to do this
is to use a standing height desk. However, if like me you don't have one
at home, there's a couple of low-fi options. The approach I take is to
use an ironing board which happens to work rather well. Another is to
stack some boxes or large books on a normal desk and place your keyboard
on top of that. Also, make sure you stretch before you start practicing
and try and dance a little during the session. Remember, nobody is
watching you, so have fun and you'll feel much more natural on stage.


## Practice setting up

Most instruments require some assembly and tuning before they can be
played. Unless you're a rockstar with a bus full of roadies, you'll have
to set up your own instrument before your gig. This is often a stressful
time and it is easy for problems to occur. One way to help with this is
to incorporate the setup process into your practice sessions.

Practice tip #4 - treat setting up as an important part of your
practice. For example, have a box or bag that you can keep your
Raspberry Pi and keyboard in etc. Before each practice session, take out
all the parts, connect everything, and work through the boot process
until you have Sonic Pi running and can make sounds. Once you've
finished practicing, take the time to carefully pack everything away
afterwards. This may take some time at first, but before long you'll be
able to setup and pack everything away incredibly quickly without having
to think about it.


## Experiment Musically

Once you've set up and are ready to start making music, you might find
yourself struggling to know where to start.  One problem many people
face is that they might have a good idea of the kinds of sounds they
want to make, but are frustrated that they can't produce them. Some
people don't even know what kind of sounds they want to make! The first
thing to do is not to worry - this is very common and happens to every
musician - even if they've been practicing for a long time. It is much
more important to be making sounds you don't like than not making any
sounds at all.

Practice tip #5 - spend time making sounds and music you don't like. Try
to make time to explore new sounds and ideas. Don't worry that it might
sound terrible if it's not the style you're looking for. When you're
experimenting like this you increase the chance of stumbling over a
sound or combination of sounds which you love! Even if 99% of the sounds
you make are bad, that 1% might be the riff or intro to your new
track. Forget the things you don't like and remember the parts you
do. This is even easier when you're making music with code - just hit
save!


## Hear the Code

Many musicians can look at a musical score and hear the music in their
head without having to play it. This is a very useful skill and it's
well worth incorporating into your live coding practice sessions. The
imporant point is to be able to have some understanding of what the code
is going to sound like. You don't need to be able to hear it exactly in
your head, but instead it's useful to know if the code is going to be
fast, slow, loud, rhythmic, melodic, random, etc. The final goal is then
to be able to reverse this process - to be able to hear music in your
head and know what code to write to make it. It may take you a long time
to master this, but once you do, you'll be able to improvise on stage
and express your ideas fluently.

Practice tip #6 - write some code into Sonic Pi but don't hit the Run
button. Instead, try to imagine what sound it is going to produce. Then,
hit Run, listen, and think about what you got right and what you
didn't. Keep repeating this until it become a natural part of your
coding process. When I practice I normally have a good idea of what the
code will sound like. However, I still am occasionally surprised, and
then I'll stop and spend some time thinking about why I was wrong. Each
time this happens, I learn new tricks which allow me to express myself
in new ways.

## Remove all distractions

A common problem when practicing is to become distracted with other
things. Practicing is hard and requires real discipline regardless of
the kind of music you're making - from jazz to classical to EDM. If
you're struggling to get started or make progress, it's often too easy
to hop on social media, or look something up on the internet etc. If
you've set yourself a target of 20 minutes of practice, it's important
to try and spend all that time being as productive as possible.

Practice tip #7 - before you start practicing remove as many
distractions as possible. For example, disconnect from the internet, put
your phone in another room and try to practice in a quiet place where
you're unlikely to be disturbed. Try to focus on coding music and you
can return to your distractions when you've finished.


## Keep a practice diary

When you are practicing, you'll often find your mind is full of new
exciting ideas - new musical directions, new sounds to try out, new
functions to write, etc. These ideas are often so interesting that you
might stop what you're doing and start working on the idea. This is
another form of distraction!

Practice tip #8 - keep a practice diary by your keyboard. When you get
an exciting new idea, temporarily pause your practice session, quickly
jot the idea down, then forget about it and carry on practicing. You can
then spend some quality time thinking about and working on your ideas
after you've finished practicing.


## Bringing it all together

Try to establish a practice routine which incorporates as many of these
ideas as possible. Try to keep the sessions as fun as possible but be
aware that some practice sessions will be hard and feel a little like
work. However, it will all be worth it once you've created your first
piece or given your first performance. Remember, practice is the key to
success!
