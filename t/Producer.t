use v6.c;
use Test;

plan 5;

use EERPG::Amount;
use EERPG::Action;
use EERPG::Availability;
use EERPG::Commodity;
use EERPG::Currency;
use EERPG::Economy;
use EERPG::Inventory;
use EERPG::Market;
use EERPG::Producer;
use EERPG::Rule;
use EERPG::Ruleset;

my constant Amount       = EERPG::Amount;
my constant Action       = EERPG::Action;
my constant Availability = EERPG::Availability;
my constant Commodity    = EERPG::Commodity;
my constant Currency     = EERPG::Currency;
my constant Economy      = EERPG::Economy;
my constant Inventory    = EERPG::Inventory;
my constant Market       = EERPG::Market;
my constant Producer     = EERPG::Producer;
my constant Rule         = EERPG::Rule;
my constant Ruleset      = EERPG::Ruleset;

my $*CURRENCY = Currency.new( name => 'credit' );
my $food = Commodity.new( :name<food> );
my $*ECONOMY = Economy.new( name => "The Economy", commodities => [$food] );

my $av = Availability.new(commodity => $food, required => 5@);
my $ac = Action.new(      commodity => $food, amount   => 5@);
my $rule = Rule.new(:name<Test>, conditions => [$av,$av], actions => [$ac,$ac]);
my $ruleset = Ruleset.new( rules => [$rule,$rule] );

my $*INVENTORY = Inventory.new( commodities => :{ $food => 42 } );
ok $rule.apply, 'did all conditions fire without explicit inventory';
is $*INVENTORY{$food}, 52, 'did the actions fire only once';

ok $rule.apply($*INVENTORY), 'did all conditions fire with explicit inventory';
is $*INVENTORY{$food}, 62, 'did the actions fire only once again';

dies-ok { Ruleset.new() }, 'did creation fail without anything';

# vim: ft=perl6 expandtab sw=4
