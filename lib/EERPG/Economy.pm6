use v6.c;

use EERPG;
use EERPG::Commodity;
use EERPG::Currency;
use EERPG::Market;

unit role EERPG::Economy:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG
;
has EERPG::Currency  @.currencies;
has EERPG::Market    @.markets;
has EERPG::Commodity @.commodities;

method TWEAK() {
    @!currencies.push($*CURRENCY) unless @!currencies;
}
method currency() { @!currencies[0] }

=begin pod

=head1 NAME

EERPG::Economy - EERPG Economy object

=head1 SYNOPSIS

  use EERPG;

=head1 DESCRIPTION

EERPG is an implementation of the "Emergent Economies for Role Playing Games"
white paper by Jonathan Doran and Ian Parberry.

The "Economy" object is only hinted at at the end of the white paper when
a interconnected set of markets is mentioned.  The noun "Economy" seemed to
be a good name for such an interconnected set of Markets.

=head1 AUTHOR

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/EERPG . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
