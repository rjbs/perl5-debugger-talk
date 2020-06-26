#!perl
use v5.12.0;
package PRNG;

sub random {
  state $X = 10;
  my $A = 21;
  my $M = 20;
  my $C =  4;

  $DB::single = 1 if $X == 10; # when $DB::single true, break

  $X = ($A * $X  +  $C) % $M;

  return $X;
}

1;
