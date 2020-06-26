#!perl
use v5.12.0;
package PRNG;
use Moose;

has x => (is => 'rw', required => 1);
has a => (is => 'ro');
has m => (is => 'ro');
has c => (is => 'ro');

sub random {
  my ($self) = @_;
  my $next = ($self->a * $self->x  + $self->c) % $self->m;

  $self->x($next);
  return $next;
}

no Moose;
1;
