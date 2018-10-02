use v6.c;
use Test;

plan 2;

use EERPG::Commodity;
my constant Commodity = EERPG::Commodity;

my $food = Commodity.new( :name<food> );
does-ok $food, EERPG::Commodity;
is $food.name, 'food', 'did we get food as name';

# vim: ft=perl6 expandtab sw=4
