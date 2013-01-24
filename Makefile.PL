use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Quitanda',
    AUTHOR              => q{Monsenhor <monsenhor@cpan.org>},
    VERSION_FROM        => 'lib/Quitanda.pm',
    ABSTRACT_FROM       => 'lib/Quitanda.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Quitanda-*' },
);
