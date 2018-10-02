use v6.c;

use EERPG;
use EERPG::Commodity;

use AccountableBagHash;

role EERPG::Inventory:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG
  does Associative
{
    has %.commodities
      is required
      is AccountableBagHash
      handles <AT-KEY ASSIGN-KEY EXISTS-KEY DELETE-KEY elems>;
}

=begin pod

=head1 NAME

EERPG::Inventory - EERPG Inventory role / class

=head1 SYNOPSIS

    use EERPG::Inventory;

    my $inventory = EERPG::Inventory.new(
      commodities => :{ $food => 42, $drink => 666 }  # needs an object hash
    );

=head1 DESCRIPTION

The C<Inventory> role / class provides the place to store the posessions
of L<Agent>s such as a L<Trader> or a L<Producer>.

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
