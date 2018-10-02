use v6.c;

use EERPG;
use EERPG::Belief;
use EERPG::Commodity;
use EERPG::Inventory;
use EERPG::Name;
use EERPG::Resource;

role EERPG::Agent:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG
  does EERPG::Name      # Agent must have a name
  does EERPG::Resource  # Agents are a Resource
{
    # cannot enforce EERPG::Market here because of circularity
    has                  $.market = $*MARKET;      # Agent belongs to a Market
    has EERPG::Inventory $.inventory is required;  # Agent has an Inventory
    has Int              $.default-volatility = 3; # default price volatility
    has EERPG::Belief    %.beliefs{EERPG::Commodity};

    multi method TWEAK(::?ROLE:D:) {
        callsame;
        # local tweaks
    }
}

=begin pod

=head1 NAME

EERPG::Agent - EERPG Agent role

=head1 SYNOPSIS

    use EERPG::Agent;

    class Person does EERPG::Agent {
    }

    Person.new(:$name, :$market, :$inventory, :%beliefs, :$default-volatility);

=head1 DESCRIPTION

The C<Agent> role should be consumed by classes that can be used as one
of the C<NPC>'s (Non-Playing Characters), such as a L<Trader> or a L<Producer>.
Such an object should always provide the L<Name> of the agent, the L<Market>
it belongs to, as well as an L<Inventory>.

An optional C<default-volatility> can be specified to be used as a default
for adapting C<Price> C<Belief>s on successful / failed trades.  By default
a value of B<3> will be assumed.

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
