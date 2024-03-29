use v6.*;

use EERPG;
use EERPG::Amount;
use EERPG::Commodity;

subset Chance of Numeric where 0 < * <= 1;

role EERPG::Action:ver<0.0.2>:auth<zef:lizmat>
  does EERPG
{
    has EERPG::Commodity $.commodity is required;
    has EERPG::Amount    $.amount    is required;
    has Chance           $.chance = 1;

    method do($inventory = $*INVENTORY --> Bool:D) {
        if rand < $!chance {   # should do the action
            $!amount == 0
              ?? ($inventory.commodities{$!commodity} = 0)
              !! ($inventory.commodities{$!commodity} += $!amount);
            True
        }
        else {
            False
        }
    }
}

=begin pod

=head1 NAME

EERPG::Action - EERPG Action role / object

=head1 SYNOPSIS

    use EERPG::Action;

    my $action = EERPG::Action.new(:$commodity, :$price, :$chance);

    $action.do;             # use $*INVENTORY
    $action.do($inventory); # use specific inventory

=head1 DESCRIPTION

The C<Action> role should be consumed by classes that can be used as
one of the C<actions> in a L<Rule>.  It takes a C<Commodity>, an C<Amount>
and a chance of the C<Action> needing to be performed.  The C<Amount> can
be positive, negative or zero: if it is zero, then the commodity should be
removed from the C<Inventory> if the C<Action> is to be done.

Such a class should provide a
C<do> method that performs the action on the given L<Inventory> (defaulting
to the C<$*INVENTORY> dynamic variable).  This method should throw if it
is not capable of doing the update.  A C<Price> of 0 indicates that the
commodity should be zeroed in the inventory.  The chance indicates how
likely this action is to be performed.  By default a chance of B<1> is
assumed, meaning that the actio will always be performed.

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
