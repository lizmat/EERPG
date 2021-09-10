use v6.*;

role EERPG::Name:ver<0.0.2>:auth<zef:lizmat> {
    has Str $.name is required;

    method name(--> Str:D) { $!name }
    method Str( --> Str:D) { "{self.^name.substr(7)}: $.name" }
}

=begin pod

=head1 NAME

EERPG::Name - role for objects with a name

=head1 SYNOPSIS

    use EERPG::Name;

    class Foo does EERPG::Name {
    }

    Foo.new( name => "Bar" );

=head1 DESCRIPTION

The C<Name> role is a role for C<EERPG> objects that must have a name.
It is B<not> intended to be used as a class.

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
