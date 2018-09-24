use v6.c;
use Test;

plan 1;

use EERPG::Action;
use EERPG::Agent;
use EERPG::Ask;
use EERPG::Bid;
use EERPG::Commodity;
use EERPG::Condition;
use EERPG::Currency;
use EERPG::Economy;
use EERPG::Inventory;
use EERPG::Market;
use EERPG::Produce;
use EERPG::Producer;
use EERPG::Resource;
use EERPG::Rule;
use EERPG::Ruleset;
use EERPG::Trader;

my @currencies = EERPG::Currency.new( name => 'Credit', nick => 'credit' );

my @commodities = (
  Armor       => 'armor',
  Cloth       => 'cloth',
  Fertilizer  => 'fertilizer',
  Food        => 'food',
  Hydroponics => 'hydroponics',
  Leather     => 'leather',
  Metal       => 'metal',
  Ore         => 'ore',
  Weapon      => 'weapon',
  Water       => 'water',
).map: { EERPG::Commodity.new( name => .key, nick => .value ) }

my @markets = (
  "Tau Station",
  "København",
  "Daedalus",
  "Taungoo Station",
  "Nouveau Limoges",
  "Sol Jump Gate",
  "Alpha Centauri Jump Gate	7",
  "Moissan Station",
  "Paris Spatiale",
  "The Ghost of Mali",
  "Cirque Centauri",
  "Spirit of Botswana",
  "Bordeaux Station",
  "Yards of Gadani",
).map: { EERPG::Market.new( name => $_ ) }

my $economy = EERPG::Economy.new(
  name => "After Catastrophe", :@markets, :@currencies, :@commodities
);

dd $economy;

# vim: ft=perl6 expandtab sw=4
