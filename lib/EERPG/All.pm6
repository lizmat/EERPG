use v6.c;

use EERPG;
use EERPG::Action;
use EERPG::Agent;
use EERPG::Amount;
use EERPG::Ask;
use EERPG::Availability;
use EERPG::Belief;
use EERPG::Bid;
use EERPG::Commodity;
use EERPG::Condition;
use EERPG::Currency;
use EERPG::Economy;
use EERPG::Inventory;
use EERPG::Market;
use EERPG::Name;
use EERPG::Price;;
use EERPG::Producer;
use EERPG::Resource;
use EERPG::Rule;
use EERPG::Ruleset;
use EERPG::Trader;

# Set up the EXPORT hash
my %EXPORT;
%EXPORT<EERPG> := EERPG;  # need to export the root of the hierarchy also
%EXPORT{"EERPG::$_"} := %EXPORT{~$_} := EERPG::{$_} for EERPG::.keys;

# Mark the EXPORT hash for export
sub EXPORT() { %EXPORT }

=begin pod

=head1 NAME

EERPG::All - export all EERPG entities with shortcuts

=head1 SYNOPSIS

    use EERPG::All;

    my $action = Action.new;  # instead of EERPG::Action.new

=head1 DESCRIPTION

This is not a module by itself.  Instead, it loads all modules of the EERPG
distribution and exports all entities B<with> and B<without> the C<EERPG::>
prefix.

=head1 AUTHOR

Elizabeth Mattijsen <liz@wenzperl.nl>

EERPG is an implementation of the "Emergent Economies for Role Playing Games"
white paper by Jonathan Doran and Ian Parberry.

Source can be located at: https://github.com/lizmat/EERPG . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
