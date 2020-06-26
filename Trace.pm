package Devel::Trace;

sub DB::DB {
  my ($p, $f, $l) = caller;
  my $code = \@{"::_<$f"}; # @{_<FILE} is the lines of FILE (also crazy)
  print STDERR ">> $f:$l: $code->[$l]";
}

1;
