use v6.c;
use Test;

plan 6;

use EERPG::Belief;
use EERPG::Currency;
use EERPG::Price;

my constant Belief   = EERPG::Belief;
my constant Currency = EERPG::Currency;
my constant Price    = EERPG::Price;

# needed for easy Price creation
my $*CURRENCY = Currency.new(:name<Credit>);

my $belief = Belief.new(
  min        => Price.new(42),
  max        => Price.new(666),
  volatility => 7
);
does-ok $belief, EERPG::Belief;
does-ok $_, EERPG::Price for $belief.min, $belief.max;
is $belief.min,       42, "Did we get the right min";
is $belief.max,      666, "Did we get the right max";
is $belief.volatility, 7, "Did we get the right volatility";

# vim: ft=perl6 expandtab sw=4
