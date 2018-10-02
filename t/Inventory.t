use v6.c;
use Test;

plan 7;

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
is $inventory{$food},   42, 'do we have the right amount of food';
is $inventory{$drink}, 666, 'do we have the right amount of drink';

is $inventory{$food} += 18, 60, 'can we increment food';
is $inventory{$food} -= 20, 40, 'can we decrement food';

#dies-ok { Inventory.new() }, 'must specify commodities';  R#2338
dies-ok { $inventory{$food}  = -1 }, 'not allowed to reduce < 0';
dies-ok { $inventory{$food} -= 42 }, 'not allowed sub too much';

# vim: ft=perl6 expandtab sw=4
