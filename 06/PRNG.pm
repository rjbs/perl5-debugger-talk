#!perl
use v5.12.0;
package PRNG;

our %CONFIG = (
  X => 10,
  A => 21,
  M => 20,
  C =>  4,
);

sub random {
  $CONFIG{X} = ($CONFIG{A} * $CONFIG{X}  +  $CONFIG{C}) % $CONFIG{M};
  return $CONFIG{X};
}

1;
