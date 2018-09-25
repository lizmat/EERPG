use v6.c;

use EERPG;
use EERPG::Rule;

unit role EERPG::Ruleset:ver<0.0.1>:auth<cpan:ELIZABETH>
  does EERPG
;
has EERPG::Rule @.rules;

=begin pod

=head1 NAME

EERPG::Ruleset - EERPG Ruleset object

=head1 SYNOPSIS

  use EERPG;

=head1 DESCRIPTION

EERPG is an implementation of the "Emergent Economies for Role Playing Games"
white paper by Jonathan Doran and Ian Parberry.

=head1 AUTHOR

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/EERPG . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod