use v6.*;

use EERPG;
use EERPG::Name;
use EERPG::Resource;

role EERPG::Commodity:ver<0.0.2>:auth<zef:lizmat>
  does EERPG
  does EERPG::Name        # A Commodity has a name
  does EERPG::Resource    # A Commodity is a Resource
{
}

=begin pod

=head1 NAME

EERPG::Commodity - EERPG Commodity role / class

=head1 SYNOPSIS

    use EERPG::Commodity;

    my $commodity = EERPG::Commodity.new( name => "food" );

=head1 DESCRIPTION

The C<Commodity> role / class describes a commodity.  It takes a L<Name>;

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
