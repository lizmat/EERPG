use v6.c;
use Test;

plan 1;

use EERPG::All;
pass "All modules compiled";

my $*CURRENCY = Currency.new( name => 'credit' );

my $price = Price.new(42);
#say $price;

my @commodities = <
  armor cloth fertilizer food hydroponics leather metal ore weapon water
>.map: -> $name { Commodity.new(:$name) }

my $*ECONOMY = Economy.new(name => "After Catastrophe", :@commodities);
#dd $*ECONOMY;

Market.new( name => $_ ) for
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
;

#dd $*ECONOMY;

# vim: ft=perl6 expandtab sw=4
