use v6.c;
use Test;

plan 9;

use EERPG::Amount;
use EERPG::Availability;
use EERPG::Commodity;
use EERPG::Inventory;

my constant Amount       = EERPG::Amount;
my constant Availability = EERPG::Availability;
my constant Commodity    = EERPG::Commodity;
my constant Inventory    = EERPG::Inventory;

my $food = Commodity.new( :name<food> );
my $av   = Availability.new(commodity => $food, required => 5@);
does-ok $av, EERPG::Availability;
is-deeply $av.commodity, $food     ,    'did we get the commodity back';
is-deeply $av.required,  Amount.new(5), 'did we get the required back';

my $*INVENTORY = Inventory.new( commodities => :{ $food => 42 } );
ok $av.enough-in, 'do we have enough availability using default inventory';
ok $av.Bool,      'do we have enough availability using default inventory';
ok $av.enough-in($*INVENTORY), 'enough availability using  inventory';

dies-ok { Availability.new(required => 5@) },     'dies without commodity';
dies-ok { Availability.new(commodity => $food) }, 'dies without required';
dies-ok { Availability.new() },                   'dies without anything';

# vim: ft=perl6 expandtab sw=4
