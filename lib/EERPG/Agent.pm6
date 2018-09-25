use v6.c;

use EERPG;
use EERPG::Inventory;

role EERPG::Agent:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG
{
    # cannot enforce EERPG::Market here because of circularity
    has                  $.market    is required; # Agent belongs to a Market
    has EERPG::Inventory $.inventory is required; # Agent has an Inventory
}

=begin pod

=head1 NAME

EERPG::Agent - EERPG Agent role

=head1 SYNOPSIS

    use EERPG::Agent;

    class Person does EERPG::Agent {
    }

=head1 DESCRIPTION

The C<Agent> role should be consumed by classes that can be used as one
of the C<NPC>'s (Non-Playing Characters), such as a L<Trader> or a L<Producer>.
Such an object should always provide the L<Market> it belongs to, as well
as an L<Inventory>.

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
