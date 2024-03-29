use v6.*;

use EERPG;
use EERPG::Action;
use EERPG::Condition;
use EERPG::Name;

role EERPG::Rule:ver<0.0.2>:auth<zef:lizmat>
  does EERPG
  does EERPG::Name
{
    has EERPG::Condition @.conditions is required;
    has EERPG::Action    @.actions    is required;

    method apply($inventory = $*INVENTORY --> Bool:D) {
        return False unless .enough-in($inventory) for @!conditions;
        .do($inventory) for @!actions;
        True
    }
}

=begin pod

=head1 NAME

EERPG::Rule - EERPG Rule role / class

=head1 SYNOPSIS

    use EERPG::Rule;

    my $rule = EERPG::Rule.new(:$name, :@conditions, :@actions );

=head1 DESCRIPTION

The C<Rule> role / class contains a list of C<Condition>s that should all
return C<True> before all of the L<Actions> are performed.

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
