use v6.c;
use Test;

plan 6;

use EERPG::Currency;
my constant Currency = EERPG::Currency;

my $credit = Currency.new( :name<Credit>, :nick<dough> );
does-ok $credit, EERPG::Currency;
is $credit.name, 'Credit', 'did we get Credit as name';
is $credit.nick, 'dough',  'did we get dough as nick';

my $dollar = Currency.new( :name<Dollar> );
does-ok $dollar, EERPG::Currency;
is $dollar.name, 'Dollar', 'did we get Dollar as name';
is $dollar.nick, 'dollar', 'did we get dollar as nick';

# vim: ft=perl6 expandtab sw=4
