use v6.c;
use Test;

plan 6;

use EERPG::Commodity;
my constant Commodity = EERPG::Commodity;

my $food = Commodity.new( :name<Food>, :nick<grub> );
does-ok $food, EERPG::Commodity;
is $food.name, 'Food', 'did we get Food as name';
is $food.nick, 'grub', 'did we get grub as nick';

my $drink = Commodity.new( :name<Drink> );
does-ok $drink, EERPG::Commodity;
is $drink.name, 'Drink', 'did we get Drink as name';
is $drink.nick, 'drink', 'did we get drink as nick';

# vim: ft=perl6 expandtab sw=4
