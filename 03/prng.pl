#!perl
use v5.12.0;
use lib '/Users/rjbs/Dropbox/talks/perl5db/03'; # Yeah, yeah.
use PRNG;

my %seen;

while (defined (my $i = PRNG::random())) {
  $seen{$i}++;
  last if $i == 1;
}

say for sort keys %seen;
