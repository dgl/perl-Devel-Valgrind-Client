use Test::More tests => 2;

use Devel::Valgrind::Client qw(is_in_memcheck leak_check);

ok is_in_memcheck();

my $leaks = leak_check {
  my $x = "a" x 1_000_000;
  Internals::SvREFCNT($x, 2); # Don't do this in real code, please
};

use Data::Dumper;diag Dumper $leaks;
