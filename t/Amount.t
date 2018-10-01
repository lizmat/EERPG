use v6.c;
use Test;

plan 6;

use EERPG::Amount;
my constant Amount    = EERPG::Amount;

my $p = Amount.new(42);
does-ok $p, EERPG::Amount;
is $p, 42, 'did we get 42';

$p = 666@;
does-ok $p, EERPG::Amount;
is $p, 666, 'did we get 666';

my $foo = 314;
$p = $foo@;
does-ok $p, EERPG::Amount;
is $p, 314, 'did we get 314';

# vim: ft=perl6 expandtab sw=4
