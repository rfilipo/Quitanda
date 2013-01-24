#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  quitanda_make_schema.pl
#
#        USAGE:  ./quitanda_make_schema.pl  
#
#  DESCRIPTION:  Make the schema for Quitanda for sqlite at data/quitanda.db
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  monsenhor (monsenhor), monsenhor@cpan.org
#      COMPANY:  studiodesign88.com
#      VERSION:  1.0
#      CREATED:  10/08/2012 09:46:27 PM
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;


use DBIx::Class::Schema::Loader qw/ make_schema_at /;
  make_schema_at(
      'Quitanda::Schema',
      { debug => 1,
        dump_directory => './lib',
      },
      [ 'dbi:SQLite:dbname=data/quitanda.db',
         #{ loader_class => 'Quitanda::SQLiteLoader' } # optionally
      ],
  );
