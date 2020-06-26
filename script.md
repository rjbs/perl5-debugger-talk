## 01 prng.pl DEMO

- run program, it fails
- c but then it fails
- BEFORE restart:
  - t random()
  - x random()

- start over and use next -- oops, that terminates
- start over and use step -- here we go!

- on "state $X = 10" show (x $X) do demonstrate it's *before*
- then (n) then (x $X) again

- you can't debug this by adding print to while, because while never entered

## 02 prng.pl DEMO

- mostly, show that it works now

## lookin' around demo

* 02/prng.pl
* list code as we go, showing off: l, l #, l #-#, l sub, v

* REMEMBER:  "v" is code around your current position
* you have to know "current line being viewed"
* "." takes you back to "code that runs next"

* step through until we get to PRNG::random
* list it before we go in "l PRNG::random"
* NOTE: we just changed current file!

## f/ct demo
* "f" our way into PRNG.pm
* "/" to new assignment to X
* "c" to this line

## breakpoints

* c makes a self-destructing breakpoint
* b breakpoints do not self-destruct

## breakpoint/action demo
* 03/prng.pl

* set a breakpoint at current line, list it
* set a breakpoint on PRNG::random, list
* delete the one on current line
* --> demonstrate that you can't just delete the other one by line
  you need to switch file!

* START OVER

* l PRNG::random
* b 11 $X == 10
* L b
* a 11 say "X is $X" if $X != 10
* L a
* L
* c --- several times to get the point across
* n, n --- to start stepping
* l / v -- get bearings
* try to "last" but it fails -- because we're lasting the debugger itself!!
* $i = 1 # to break the loop
* save try-last.db

## try again demo
* edit the history file
* delete from last onward

* debug 04/prng.pl
* source the history file
* last NUM

* COMPLAIN: wait, I wanted to break before the last line runs!
* rerun -1
* L
* B*
* A*
* b 13
* last NUM

# DB::single demo
* debug 05/prng.pl
* c
* that's it!

# alias demo
* debug 06/prng.pl
* f PRNG
* c PRNG::random
* V to show package variable
* n until back in prng.pl
* y to show lexicals
* x %PRNG::CONFIG -- bah, we got a K/V list
* x \%PRNG::CONFIG
* = ZZ x \%PRNG::CONFIG  -- shit doesn't work
* = ZZ x {%PRNG::CONFIG} -- same!!

* first one needs double \
* second one needs + before {

* = ZZ x +{%PRNG::CONFIG}  -- offends me less; demo!

# alias type demo

* debug 06/prng.pl
* = ZZ x +{%PRNG::CONFIG}
* =
* note that one kind of alias has the leading =
* pp \%DB::alias
* **SO** looks unassuming, right?  well, that's the dumper's fault
* **BRACE YOURSELF**
* x $DB::alias{ZZ}

# møøse demo

* debug 07/prng.pl
* |S
* holy crap!
* |M
* yeah okay
* c 15 -- until $prng is defined
* p $prng -- meh
* x $prng -- better
* m $prng
* good: it's short; also, if you worried about "m" and indirect…
* step into random
* OH HOLY HELL
* ABORT ABORT ABORT

* start over
* f WithLog
* l,l
* b 12
* c
* note that we're now inside "CODE(0xDEADBEEF)" because anony sub
* v -- show the enclosing code to demonstrate
* y -- see the lexicals, including code and self
* T -- see our call stack

