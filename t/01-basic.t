use v6.c;
use Test;

plan 1;

use EERPG::All;
pass "All modules compiled";

my $*CURRENCY = Currency.new( name => 'Credit', nick => 'credit' );

my $price = Price.new(42);
say $price;

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
).map: { Commodity.new( name => .key, nick => .value ) }

my @markets = (
  "Tau Station",
  "København",
  "Daedalus",
  "Taungoo Station",
  "Nouveau Limoges",
  "Sol Jump Gate",
  "Alpha Centauri Jump Gate 7",
  "Moissan Station",
  "Paris Spatiale",
  "The Ghost of Mali",
  "Cirque Centauri",
  "Spirit of Botswana",
  "Bordeaux Station",
  "Yards of Gadani",
).map: { Market.new( name => $_ ) }

my $economy = Economy.new(
  name => "After Catastrophe", :@markets, :@commodities
);

put $economy;

# vim: ft=perl6 expandtab sw=4
