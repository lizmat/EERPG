use v6.c;

use EERPG;
use EERPG::Amount;
use EERPG::Price;

role EERPG::Bid:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG
{
    has EERPG::Price  $.price is required;
    has EERPG::Amount $.ideal is required;
}

=begin pod

=head1 NAME

EERPG::Bid - EERPG Bid role / class

=head1 SYNOPSIS

    use EERPG::Bid;

=head1 DESCRIPTION

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
