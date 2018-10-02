use v6.c;
use Test;

plan 11;

use EERPG::Amount;
use EERPG::Action;
use EERPG::Availability;
use EERPG::Commodity;
use EERPG::Inventory;
use EERPG::Rule;

my constant Amount       = EERPG::Amount;
my constant Action       = EERPG::Action;
my constant Availability = EERPG::Availability;
my constant Commodity    = EERPG::Commodity;
my constant Inventory    = EERPG::Inventory;
my constant Rule         = EERPG::Rule;

my $food = Commodity.new( :name<food> );
my $*INVENTORY = Inventory.new( commodities => :{ $food => 42 } );

my $av = Availability.new(commodity => $food, required => 5@);
my $ac = Action.new(      commodity => $food, amount   => 5@);

my $rule = Rule.new(
  name       => "Test",
  conditions => [$av,$av],
  actions    => [$ac,$ac]
);
is $rule.name,              "Test",    'did the name arrive';
is-deeply [|$rule.conditions], [$av,$av], 'did the conditions arrive';
is-deeply [|$rule.actions],    [$ac,$ac], 'did the actions arrive';

ok $rule.apply, 'did all conditions fire without explicit inventory';
is $*INVENTORY{$food}, 52, 'did the actions fire twice';

ok $rule.apply($*INVENTORY), 'did all conditions fire with explicit inventory';
is $*INVENTORY{$food}, 62, 'did the actions fire twice';

dies-ok { Rule.new( conditions => [], actions => [] ) },
  'did creation fail without name';
dies-ok { Rule.new( name => "Test", actions => [] ) },
  'did creation fail without conditions';
dies-ok { Rule.new( name => "Test", conditions => [] ) },
  'did creation fail without actions';
dies-ok { Rule.new() }, 'did creation fail without anything';

# vim: ft=perl6 expandtab sw=4
