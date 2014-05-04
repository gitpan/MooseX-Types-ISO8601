# NAME

MooseX::Types::ISO8601 - ISO8601 date and duration string type constraints and coercions for Moose

# VERSION

version 0.15

# SYNOPSIS

    use MooseX::Types::ISO8601 qw/
        ISO8601DateTimeStr
        ISO8601TimeDurationStr
    /;

    has datetime => (
        is => 'ro',
        isa => ISO8601DateTimeStr,
    );

    has duration => (
        is => 'ro',
        isa => ISO8601TimeDurationStr,
        coerce => 1,
    );

    Class->new( datetime => '2012-01-01T00:00:00' );

    Class->new( duration => 60 ); # 60s => PT00H01M00S
    Class->new( duration => DateTime::Duration->new(%args) )

# DESCRIPTION

This module packages several [TypeConstraints](https://metacpan.org/pod/Moose::Util::TypeConstraints) with
coercions for working with ISO8601 date strings and the DateTime suite of objects.

# NAME

MooseX::Types::ISO8601 - ISO8601 date and duration string type constraints and coercions for Moose

# DATE CONSTRAINTS

## ISO8601DateStr

An ISO8601 date string. E.g. `2009-06-11`

## ISO8601TimeStr

An ISO8601 time string. E.g. `12:06:34Z`

## ISO8601DateTimeStr

An ISO8601 combined datetime string. E.g. `2009-06-11T12:06:34Z`

## ISO8601DateTimeTZStr

An ISO8601 combined datetime string with a fully specified timezone. E.g. `2009-06-11T12:06:34+00:00`

## ISO8601StrictDateStr

## ISO8601StrictTimeStr

## ISO8601StrictDateTimeStr

## ISO8601StrictDateTimeTZStr

As above, only in addition to validating the strings against regular
expressions, an attempt is made to actually parse the data into a [DateTime](https://metacpan.org/pod/DateTime)
object.  This will catch cases like `2013-02-31` which look correct but do not
correspond to real-world values.  Note that this bears a computation
penalty.

## COERCIONS

The date types will coerce from:

- ` Num `

    The number is treated as a time in seconds since the unix epoch

- ` DateTime `

    The duration represented as a [DateTime](https://metacpan.org/pod/DateTime) object.

- ` Str `

    Non-expanded date and time string representations.

    e.g.:-

    20120113         => 2012-01-13
    170500Z          => 17:05:00Z
    20120113T170500Z => 2012-01-13T17:05:00Z

    Representations of UTC time zone (only an offset of zero is supported)

    e.g.:-

    17:05:00+00:00 => 17:05:00Z
    17:05:00+00    => 17:05:00Z
    170500+0000    => 17:05:00Z

    2012-01-13T17:05:00+00:00 => 2012-01-13T17:05:00Z
    2012-01-13T17:05:00+00    => 2012-01-13T17:05:00Z
    20120113T170500+0000      => 2012-01-13T17:05:00Z

    Also supports non-standards mixing of expanded and non-expanded representations

    e.g.:-

    2012-01-13T170500Z => 2012-01-13T17:05:00Z
    20120113T17:05:00Z => 2012-01-13T17:05:00Z

    In addition, there are coercions from these string types to [DateTime](https://metacpan.org/pod/DateTime).

# DURATION CONSTRAINTS

## ISO8601DateDurationStr

An ISO8601 date duration string. E.g. `P01Y01M01D`

## ISO8601TimeDurationStr

An ISO8601 time duration string. E.g. `PT01H01M01S`

## ISO8601DateTimeDurationStr

An ISO8601 combined date and time duration string. E.g. `P01Y01M01DT01H01M01S`

## COERCIONS

The duration types will coerce from:

- ` Num `

    The number is treated as a time in seconds

- ` DateTime::Duration `

    The duration represented as a [DateTime::Duration](https://metacpan.org/pod/DateTime::Duration) object.

The duration types will coerce to:

- ` Duration `

    A [DateTime::Duration](https://metacpan.org/pod/DateTime::Duration), i.e. the ` Duration ` constraint from
    [MooseX::Types::DateTime](https://metacpan.org/pod/MooseX::Types::DateTime).

# FEATURES

## Fractional seconds

If provided, the number of seconds in time types is represented to microsecond
accuracy. A full stop character is used as the decimal separator, which is
allowed, but deprecated in preference to the comma character in
_ISO 8601:2004_.

# BUGS

Probably full of them, patches are very welcome.

Specifically missing features:

- No timezone support - all times are assumed UTC
- No week number type
- "Basic format", which lacks separator characters, is not supported for
reading or writing.
- Tests are rubbish.

# SEE ALSO

- [MooseX::Types::DateTime](https://metacpan.org/pod/MooseX::Types::DateTime)
- [DateTime](https://metacpan.org/pod/DateTime)
- [DateTime::Duration](https://metacpan.org/pod/DateTime::Duration)
- [DateTime::Format::ISO8601](https://metacpan.org/pod/DateTime::Format::ISO8601)
- [DateTime::Format::Duration](https://metacpan.org/pod/DateTime::Format::Duration)
- [http://en.wikipedia.org/wiki/ISO\_8601](http://en.wikipedia.org/wiki/ISO_8601)
- [http://dotat.at/tmp/ISO\_8601-2004\_E.pdf](http://dotat.at/tmp/ISO_8601-2004_E.pdf)

# VERSION CONTROL

    http://github.com/bobtfish/moosex-types-iso8601/tree/master

Patches are welcome.

# AUTHOR

- Tomas Doran (t0m) `<bobtfish@bobtfish.net>`
- Dave Lambley `<davel@state51.co.uk>`

The development of this code was sponsored by my employer [http://www.state51.co.uk](http://www.state51.co.uk).

## Contributors

- Aaron Moses

# COPYRIGHT

    Copyright (c) 2009 Tomas Doran. Some rights reserved.
    This program is free software; you can redistribute
    it and/or modify it under the same terms as Perl itself.

# AUTHOR

Tomas Doran (t0m) <bobtfish@bobtfish.net>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Tomas Doran.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

# CONTRIBUTORS

- Aaron Moses <zebardy@gmail.com>
- Dave Lambley <dave@lambley.me.uk>
- Dave Lambley <davel@isosceles.(none)>
- Dave Lambley <davel@state51.co.uk>
- Karen Etheridge <ether@cpan.org>
- Tomas Doran (t0m) <t0m@state51.co.uk>
- Tomas Doran <bobtfish@bobtfish.net>
- t0m <bobtfish@bobtfish.net>
- zebardy <zebardy@gmail.com>
