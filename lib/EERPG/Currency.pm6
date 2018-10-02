use v6.c;

use EERPG;
use EERPG::Commodity;

role EERPG::Currency:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG
  does EERPG::Commodity    # A Currency is a Commodity
{
}

=begin pod

=head1 NAME

EERPG::Currency - EERPG Currency role / object

=head1 SYNOPSIS

    use EERPG::Currency;

    my $credit = Currency.new( name => 'credit' );

=head1 DESCRIPTION

The C<Currency> role / class describes a currency to be used to express
L<Price>s in.  It has a L<Name>.

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
