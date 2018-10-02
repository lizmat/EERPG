use v6.c;

use WriteOnceHash;

use EERPG;
use EERPG::Commodity;
use EERPG::Currency;
use EERPG::Market;
use EERPG::Name;

role EERPG::Economy:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG
  does EERPG::Name
{
    has EERPG::Currency  @.currencies;
    has EERPG::Market    %.markets does WriteOnce;
    has EERPG::Commodity %!commodities
      does WriteOnce
      handles <AT-KEY ASSIGN-KEY BIND-KEY EXISTS-KEY DELETE-KEY elems>;

    method TWEAK(:@commodities) {
        @!currencies.push($*CURRENCY) unless @!currencies;

        %!commodities{.name} = $_ for @commodities;
    }
    method currency()    { @!currencies[0] }
    method commodities() { %!commodities }
}

=begin pod

=head1 NAME

EERPG::Economy - EERPG Economy role / class

=head1 SYNOPSIS

    use EERPG::Economy;

    my $economy = EERPG::Economy.new(name => 'The World', :@commodities);

=head1 DESCRIPTION

EERPG is an implementation of the "Emergent Economies for Role Playing Games"
white paper by Jonathan Doran and Ian Parberry.

The "Economy" object is only hinted at at the end of the white paper when
a interconnected set of markets is mentioned.  The noun "Economy" seemed to
be a good name for such an interconnected set of Markets.

In this implementation, the C<Economy> is also the place to keep shared
C<Currency>, C<Market> and C<Commidity> information.

=head1 AUTHOR

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/EERPG . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
