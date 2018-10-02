use v6.c;
use Test;

plan 2;

use EERPG::Currency;
my constant Currency = EERPG::Currency;

my $credit = Currency.new( :name<credit> );
does-ok $credit, EERPG::Currency;
is $credit.name, 'credit', 'did we get credit as name';

# vim: ft=perl6 expandtab sw=4
