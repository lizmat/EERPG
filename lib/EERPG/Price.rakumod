use v6.*;

use EERPG::Currency;

class EERPG::Price:ver<0.0.2>:auth<zef:lizmat> is Rat {
    has EERPG::Currency $.currency;

    method !SET-SELF($!currency) { self }
    method new($value, $currency = $*CURRENCY) {
        $value ~~ Int
          ?? self.Rat::new($value)!SET-SELF($currency)
          !! $value ~~ Rat
            ?? self.Rat::new(
                 $value.numerator, $value.denominator
               )!SET-SELF($currency)
            !! die "Only Rat and Int supported as Price";
    }
    method gist() { self.Str ~ ' ' ~ $!currency.name }
}

=begin pod

=head1 NAME

EERPG::Price - EERPG Price class

=head1 SYNOPSIS

    use EERPG::Price;

    my $price = EERPG::Price.new(42);    # assumes $*CURRENCY

    my $price = EERPG::Price.new(42, $currency);

=head1 DESCRIPTION

The C<Price> class is just a convenient way to make sure we don't mix up
Integers with actual amounts of L<Currency>.

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
