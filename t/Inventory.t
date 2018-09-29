use v6.c;
use Test;

plan 5;

use EERPG::Commodity;
use EERPG::Inventory;

my constant Commodity = EERPG::Commodity;
my constant Inventory = EERPG::Inventory;

my $food  = Commodity.new( :name<Food>  );
my $drink = Commodity.new( :name<Drink> );

my $inventory = Inventory.new(
  commodities => :{ $food => 42, $drink => 666 }
);
does-ok $inventory, EERPG::Inventory;
is $inventory.commodities{$food},   42, 'do we have the right amount of food';
is $inventory.commodities{$drink}, 666, 'do we have the right amount of drink';

is $inventory.commodities{$food} += 18, 60, 'can we increment food';
is $inventory.commodities{$food} -= 20, 40, 'can we decrement food';

# vim: ft=perl6 expandtab sw=4
