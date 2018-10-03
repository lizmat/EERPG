use v6.c;
use Test;

plan 6;

use EERPG::Currency;
use EERPG::Price;

my constant Currency = EERPG::Currency;
my constant Price    = EERPG::Price;

my $*CURRENCY = Currency.new( :name<credit> );
my $dollar    = Currency.new( :name<dollar> );

my $p = Price.new(42);
does-ok $p, EERPG::Price;
is $p, 42, 'did we get 42';
is-deeply $p.currency, $*CURRENCY, 'did it get credits';

$p = Price.new(66.6, $dollar);
does-ok $p, EERPG::Price;
is $p, 66.6, 'did we get 66.6';
is-deeply $p.currency, $dollar, 'did it get dollars';

# vim: ft=perl6 expandtab sw=4
