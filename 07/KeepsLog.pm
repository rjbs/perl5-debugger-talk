#!perl
use v5.12.0;
package KeepsLog;
use Moose::Role;

has log => (
  default => sub {  {}  },
  is => 'ro',
);

sub log_value {
  my ($self, $value) = @_;
  $self->log->{ $value }++;
}

no Moose::Role;
1;
