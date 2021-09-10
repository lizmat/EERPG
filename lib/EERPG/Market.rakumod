use v6.*;

use WriteOnceHash:ver<0.0.6>:auth<zef:lizmat>;

use EERPG;
use EERPG::Name;
use EERPG::Producer;
use EERPG::Trader;

role EERPG::Market:ver<0.0.2>:auth<zef:lizmat>
  does EERPG
  does EERPG::Name
{
    # cannot enforce EERPG::Economy here because of circularity
    has                 $.economy = $*ECONOMY;  # Market belongs to an Economy
    has EERPG::Producer %.producers does WriteOnce;
    has EERPG::Trader   %.traders   does WriteOnce;

    multi method TWEAK(::?ROLE:D:) {
        callsame;

        # register ourselves with the economy
        $.economy.markets{$.name} = self;
    }
}

=begin pod

=head1 NAME

EERPG::Market - EERPG Market role / class

=head1 SYNOPSIS

    use EERPG::Market;

    my $market = EERPG::Market.new(
      name => 'Bazar', :@producers, :@traders
    );

=head1 DESCRIPTION

The C<Market> role / class contains the information needed to run a local
market.  It requires a L<Name>, and should have L<Producers>s and L<Trader>s.

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
