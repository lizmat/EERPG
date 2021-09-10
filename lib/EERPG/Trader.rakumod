use v6.*;

use EERPG::Agent;

role EERPG::Trader:ver<0.0.2>:auth<zef:lizmat>
  does EERPG::Agent          # Trader is an Agent
{
    multi method TWEAK(::?ROLE:D:) {
        callsame;

        # register ourselves with the Market
        $.market.traders{$.name} = self;
    }
}

=begin pod

=head1 NAME

EERPG::Trader - EERPG Trader role / class

=head1 SYNOPSIS

    use EERPG::Trader;

    my $trader = EERPG::Trader.new(
      name => 'Scrooge McDuck', :$market, :$inventory
    )

=head1 DESCRIPTION

The C<Trader> role / class is an L<Agent> that can trade L<Commodity>.
It takes a L<Name>, a L<Market> with which the C<Trader> is associated,
and an L<Inventory> of L<Commodity>.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

EERPG is an implementation of the "Emergent Economies for Role Playing Games"
white paper by Jonathan Doran and Ian Parberry.

Source can be located at: https://github.com/lizmat/EERPG . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018, 2021 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
