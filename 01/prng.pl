#!perl
use v5.12.0;
sub random {
  state $X = 10;
  my $A = 21;
  my $M = 71;
  my $C =  3;

  $X = ($A * $X  +  $C) % $M;
  return $X;
}

while (my $i = random()) {
  say $i;
  last if $i == 1;
}
