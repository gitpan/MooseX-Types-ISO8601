
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "ISO8601 date and duration string type constraints and coercions for Moose",
  "AUTHOR" => "Tomas Doran (t0m) <bobtfish\@bobtfish.net>",
  "BUILD_REQUIRES" => {
    "DateTime::Format::ISO8601" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "FindBin" => 0,
    "Moose" => 0,
    "Test::CheckDeps" => "0.002",
    "Test::Deep" => 0,
    "Test::Fatal" => 0,
    "Test::More" => "0.88",
    "Test::NoWarnings" => "1.04",
    "Test::Requires" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooseX-Types-ISO8601",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MooseX::Types::ISO8601",
  "PREREQ_PM" => {
    "Class::Load" => 0,
    "DateTime" => "0.41",
    "DateTime::Duration" => 0,
    "DateTime::Format::Duration" => "1.03",
    "DateTime::Format::ISO8601" => 0,
    "DateTime::TimeZone" => 0,
    "List::MoreUtils" => 0,
    "Module::Runtime" => 0,
    "MooseX::Types" => "0.10",
    "MooseX::Types::DateTime" => "0.03",
    "MooseX::Types::Moose" => 0,
    "Safe::Isa" => 0,
    "Scalar::Util" => 0,
    "Try::Tiny" => 0,
    "aliased" => 0,
    "namespace::autoclean" => "0.05",
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.14",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



