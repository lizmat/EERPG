use v6.c;

use EERPG::Agent;
use EERPG::Ruleset;

role EERPG::Producer:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG::Agent          # Producer is an Agent
{
    has EERPG::Ruleset $.ruleset is required;

    multi method TWEAK(::?ROLE:D:) { 
        callsame;

        # register ourselves with the Market
        $.market.producers{$.name} = self;
    }

    method produce(--> Bool:D) { $!ruleset.apply($.inventory) }
}

=begin pod

=head1 NAME

EERPG::Producer - EERPG Producer role / class

=head1 SYNOPSIS

    use EERPG::Producer;

    my $producer = EERPG::Producer.new(
      name => 'Old McDonalds', :$market, :$inventory, :$ruleset
    )

=head1 DESCRIPTION

The C<Producer> role / class is an L<Agent> that can produce L<Commodity>
according to a given L<Ruleset>.  It takes a L<Name>, a L<Market> with which
the C<Producer> is associated, an L<Inventory> of L<Commodity> and a
L<Ruleset> for producing L<Commodity>.

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
