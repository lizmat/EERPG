use v6.c;

use EERPG;
use EERPG::Currency;
use EERPG::Price;

role EERPG::Belief:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG
{
    has EERPG::Price $.min        is required;
    has EERPG::Price $.max        is required;
    has Int          $.volatility is required;

    method estimate-price(
      EERPG::Currency $currency = $*CURRENCY
      --> EERPG::Price
    ) {
        EERPG::Price.new( ($!min .. $!max).pick, $currency)
    }

    method failed-ask(    EERPG::Price $price --> Nil) { ... }
    method successful-ask(EERPG::Price $price --> Nil) { ... }
    method failed-bid(    EERPG::Price $price --> Nil) { ... }
    method successful-bid(EERPG::Price $price --> Nil) { ... }
}

=begin pod

=head1 NAME

EERPG::Belief - EERPG Belief role / class

=head1 SYNOPSIS

    use EERPG::Belief;

    my $b = Belief.new(min => 20, max => 40, volatility = > 5);
    my $price = $b.estimate-price;

    $b.failed-ask($price);    # update belief after failed ask
    $b.succesful-ask($price); # update belief after successful ask
    $b.failed-bid($price);    # update belief after failed bid
    $b.succesful-bid($price); # update belief after successful bid
  
=head1 DESCRIPTION

The C<Belief> role / class is used to hold information about the C<Belief>
of a L<Price> of a L<Commodity>.  It takes a min / max and a amount of
volatility, which indicates the maximum change in the range of the belief
to be applied after a failed / successful ask / bid.

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
