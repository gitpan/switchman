
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "flock-style distributed locks and semaphores",
  "AUTHOR" => "Oleg Komarov <komarov\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "switchman",
  "EXE_FILES" => [
    "bin/switchman",
    "bin/check_switchman_groups",
    "bin/check_switchman_hosts"
  ],
  "LICENSE" => "perl",
  "NAME" => "switchman",
  "PREREQ_PM" => {
    "File::Basename" => 0,
    "File::Slurp" => 0,
    "Getopt::Long" => 0,
    "JSON" => 0,
    "Linux::MemInfo" => 0,
    "List::MoreUtils" => 0,
    "List::Util" => 0,
    "Log::Dispatch" => "2.35",
    "Moo" => "1.002000",
    "Net::Ping" => 0,
    "Net::ZooKeeper" => 0,
    "Net::ZooKeeper::Lock" => "0.03",
    "Net::ZooKeeper::Semaphore" => 0,
    "POSIX" => 0,
    "Parse::Crontab" => 0,
    "Pod::Usage" => 0,
    "Sys::CPU" => 0,
    "Sys::Hostname::FQDN" => 0,
    "Text::ParseWords" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.01",
  "test" => {
    "TESTS" => ""
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



