#!perl
use v5.12.0;
package PRNG;

sub random {
  state $X = 10;
  my $A = 21;
  my $M = 20;
  my $C =  4;

  $X = ($A * $X  +  $C) % $M;
  return $X;
}

1;
