#!perl
use v5.12.0;
use lib '/Users/rjbs/Dropbox/talks/perl5db/07'; # Yeah, yeah.
use PRNG::WithLog;

my %seen;

my $prng = PRNG::WithLog->new({
  x => 10,
  a => 21,
  m => 71,
  c =>  3,
});

NUM: while (defined (my $i = $prng->random())) {
  last if $i == 1;
}

use Data::Dumper;
print Dumper( $prng->log );
