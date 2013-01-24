#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Quitanda' ) || print "Bail out!
";
}

diag( "Testing Quitanda $Quitanda::VERSION, Perl $], $^X" );
