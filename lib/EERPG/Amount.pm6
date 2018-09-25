use v6.c;

class EERPG::Amount:ver<0.0.1>:auth<cpan:ELIZABETH> is Int {
}

=begin pod

=head1 NAME

EERPG::Amount - EERPG Amount object

=head1 SYNOPSIS

    use EERPG::Amount;

    my $amount = EERPG::Amount.new(42);

=head1 DESCRIPTION

The C<Amount> class is just a convenient way to make sure we don't mix up
Integers with actual amounts of e.g. L<Commodity>.

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
