#!perl
use v5.12.0;
use lib '/Users/rjbs/Dropbox/talks/perl5db/06'; # Yeah, yeah.
use PRNG;

my %seen;

NUM: while (defined (my $i = PRNG::random())) {
  $seen{$i}++;
  last if $i == 1;
}

say for sort keys %seen;
