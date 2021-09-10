use v6.*;

use EERPG;
use EERPG::Inventory;

role EERPG::Condition:ver<0.0.2>:auth<zef:lizmat>
  does EERPG
{
    method enough-in(EERPG::Inventory:D $ = $*INVENTORY --> Bool:D) { ... }
    method Bool(--> Bool:D) { self.enough-in }
}

=begin pod

=head1 NAME

EERPG::Condition - EERPG Condition role / class

=head1 SYNOPSIS

    use EERPG::Condition;

    class Foo does EERPG::Condition {
        method enough-in(EERPG::Inventory:D $ = $*INVENTORY --> Bool:D) {
            ...
        }
    }

=head1 DESCRIPTION

The C<Condition> role should be consumed by classes that can be used as
one of the C<conditions> in a L<Rule>.  Such a class should provide a
C<enough-in> method that returns a Bool indicating there is enough in the given
L<Inventory> (defaulting to the C<$*INVENTORY> dynamic variable).

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
