use v6.*;

use EERPG;

class EERPG::Amount:ver<0.0.2>:auth<zef:lizmat>
    is Int
  does EERPG
{
}

sub postfix:<@>(\a) is looser(&infix:<->) is export { EERPG::Amount.new(a) }

=begin pod

=head1 NAME

EERPG::Amount - EERPG Amount class

=head1 SYNOPSIS

    use EERPG::Amount;

    my $amount = EERPG::Amount.new(42);

=head1 DESCRIPTION

The C<Amount> class is just a convenient way to make sure we don't mix up
Integers with actual amounts of e.g. L<Commodity>.

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
