use v6.c;

use EERPG::Commodity;
use EERPG::Condition;
use EERPG::Inventory;

unit class EERPG::Availability:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG::Condition
;
has EERPG::Commodity $.commodity;
has Int              $.required;

method enough-in(EERPG::Inventory:D $inventory = $*INVENTORY --> Bool:D) {
    $inventory.commodoties{$!commodity.name} >= $!required
}

=begin pod

=head1 NAME

EERPG::Availability - EERPG Availability object

=head1 SYNOPSIS

    use EERPG::Availability;

    my $availability = EERPG::Availability.new(:$commodity, required => 5);

    say "enough $availability.commodity()"
      if $availability;  # assumes $*INVENTORY

    say "enough $availability.commodity()"
      if $availability.enough-in($inventory);

=head1 DESCRIPTION

The C<Availability> class consumes the L<Condition> role and as such is
usually one the C<conditions> of a L<Rule>.  It takes a L<Commodity> and
a C<required> amount.

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
