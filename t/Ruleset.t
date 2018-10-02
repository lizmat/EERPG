use v6.c;
use Test;

plan 8;

use EERPG::Amount;
use EERPG::Action;
use EERPG::Availability;
use EERPG::Commodity;
use EERPG::Inventory;
use EERPG::Rule;
use EERPG::Ruleset;

my constant Amount       = EERPG::Amount;
my constant Action       = EERPG::Action;
my constant Availability = EERPG::Availability;
my constant Commodity    = EERPG::Commodity;
my constant Inventory    = EERPG::Inventory;
my constant Rule         = EERPG::Rule;
my constant Ruleset      = EERPG::Ruleset;

my $food = Commodity.new( :name<food> );
my $*INVENTORY = Inventory.new( commodities => :{ $food => 42 } );

my $av = Availability.new(commodity => $food, required => 5@);
my $ac = Action.new(      commodity => $food, amount   => 5@);
my $rule = Rule.new(:name<Test>, conditions => [$av,$av], actions => [$ac,$ac]);

my $ruleset = Ruleset.new( rules => [$rule,$rule] );
is-deeply [|$ruleset.rules], [$rule,$rule], 'did the conditions arrive';
is-deeply $ruleset[0], $rule, 'can we assume ruleset is an array 0';
is-deeply $ruleset[1], $rule, 'can we assume ruleset is an array 1';

ok $rule.apply, 'did all conditions fire without explicit inventory';
is $*INVENTORY{$food}, 52, 'did the actions fire only once';

ok $rule.apply($*INVENTORY), 'did all conditions fire with explicit inventory';
is $*INVENTORY{$food}, 62, 'did the actions fire only once again';

dies-ok { Ruleset.new() }, 'did creation fail without anything';

# vim: ft=perl6 expandtab sw=4
