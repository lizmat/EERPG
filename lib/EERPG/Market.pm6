use v6.c;

use WriteOnceHash;

use EERPG;
use EERPG::Name;
use EERPG::Producer;
use EERPG::Trader;

role EERPG::Market:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG
  does EERPG::Name
{
    has EERPG::Producer %.producers does WriteOnce;
    has EERPG::Trader   %.traders   does WriteOnce;


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

Elizabeth Mattijsen <liz@wenzperl.nl>

EERPG is an implementation of the "Emergent Economies for Role Playing Games"
white paper by Jonathan Doran and Ian Parberry.

Source can be located at: https://github.com/lizmat/EERPG . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
