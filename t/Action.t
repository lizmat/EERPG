use v6.c;
use Test;

plan 12;

use EERPG::Amount;
use EERPG::Action;
use EERPG::Commodity;
use EERPG::Inventory;

my constant Amount    = EERPG::Amount;
my constant Action    = EERPG::Action;
my constant Commodity = EERPG::Commodity;
my constant Inventory = EERPG::Inventory;

my $food = Commodity.new( :name<Food>, :nick<grub> );
my $ac = Action.new(commodity => $food, amount => 5@);
does-ok $ac, EERPG::Action;
is-deeply $ac.commodity, $food,         'did we get the commodity back';
is-deeply $ac.amount,    Amount.new(5), 'did we get the amount back';
is-deeply $ac.chance,    1,             'did we get the chance back';

my $*INVENTORY = Inventory.new( commodities => :{ $food => 42 } );
ok $ac.do, 'did we do the action';
is $*INVENTORY.commodities{$food}, 47, 'did we add food';
ok $ac.do($*INVENTORY), 'did we do the action again';
is $*INVENTORY.commodities{$food}, 52, 'did we add food again';

$ac = Action.new(commodity => $food, amount => -1@, chance => 0.1);
my $done = 0;
++$done if $ac.do for ^40;
ok $done > 0, 'did we at least see one done';
is $*INVENTORY.commodities{$food}, 52 - $done, 'right amount got deducted';

$ac = Action.new(commodity => $food, amount => 0@);
ok $ac.do, 'did we do the action';
nok $*INVENTORY.commodities{$food}:exists, 'did food get removed';

# vim: ft=perl6 expandtab sw=4
