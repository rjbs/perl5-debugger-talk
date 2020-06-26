#!perl
use v5.12.0;
package PRNG::WithLog;
use Moose;

extends 'PRNG';
with 'KeepsLog';

around random => sub {
  my ($orig, $self) = @_;
  my $new = $self->$orig;
  $self->log_value($new);
  return $new;
};

no Moose;
1;
