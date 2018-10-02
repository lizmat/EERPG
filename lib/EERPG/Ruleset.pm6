use v6.c;

use EERPG;
use EERPG::Rule;

role EERPG::Ruleset:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG
  does Positional
{
    has EERPG::Rule @.rules
      is required
      handles <AT-POS ASSIGN-POS EXISTS-POS DELETE-POS elems>;

    method apply($inventory = $*INVENTORY --> Bool:D) {
        return True if .apply($inventory) for @!rules;
        False
    }
}

=begin pod

=head1 NAME

EERPG::Ruleset - EERPG Ruleset role / class

=head1 SYNOPSIS

    use EERPG::Ruleset;

    my $ruleset = EERPG::Ruleset.new( :@rules );

=head1 DESCRIPTION

The C<Ruleset> role / class store a set of L<Rule>s to be used by a
L<Producer> to produce L<Commodity>.

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
