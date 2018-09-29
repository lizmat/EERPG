use v6.c;
use Test;

plan 2;

use EERPG::Amount;
my constant Amount    = EERPG::Amount;

my $p = Amount.new(42);
does-ok $p, EERPG::Amount;
is $p, 42, 'did we get 42';

# vim: ft=perl6 expandtab sw=4
