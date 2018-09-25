use v6.c;

use EERPG::Agent;

role EERPG::Trader:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG::Agent          # Trader is an Agent
{
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

Elizabeth Mattijsen <liz@wenzperl.nl>

EERPG is an implementation of the "Emergent Economies for Role Playing Games"
white paper by Jonathan Doran and Ian Parberry.

Source can be located at: https://github.com/lizmat/EERPG . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
