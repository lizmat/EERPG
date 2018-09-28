use v6.c;
use Test;

plan 6;

use EERPG::Currency;
use EERPG::Price;

my constant Currency = EERPG::Currency;
my constant Price    = EERPG::Price;

my $*CURRENCY = Currency.new( :name<Credit>, :nick<dough> );
my $dollar = Currency.new( :name<Dollar> );

my $p = Price.new(42);
does-ok $p, EERPG::Price;
is $p, 42, 'did we get 42';
is-deeply $p.currency, $*CURRENCY, 'did it get credits';

$p = Price.new(666, $dollar);
does-ok $p, EERPG::Price;
is $p, 666, 'did we get 666';
is-deeply $p.currency, $dollar, 'did it get dollars';

# vim: ft=perl6 expandtab sw=4
