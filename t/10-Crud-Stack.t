#!perl -T

use Test::More tests => 8;
use Data::Dumper;
use POSIX qw(strftime);

BEGIN {
    use_ok( 'Quitanda' ) || print "Bail out!
";
}

# the time

$now = strftime "%a %b %e %H:%M:%S %Y", localtime;

# testa CRUD em Stack.pm
my $obj = new_ok('Quitanda::Stack');
my $hash_ref = {};

# Create
$hash_ref = $obj->create({
    titulo    => 'stack teste',
    conteudo  => '<p>teste</p>',
    url       => '/stack/teste.html' ,
});
ok ($hash_ref,'Criou');
print Dumper $hash_ref;

# Read
$hash_ref = $obj->read({id=>1});
ok ($hash_ref,'Leu');
print Dumper $hash_ref;
is ($hash_ref->{url},'/stack/teste.html','Url certo'); 

# Update
$hash_ref = $obj->update(
    { id => 1 },
    {
        url  =>'/stack/teste1.html', 
    }
);
ok ($hash_ref,'Atualizou');
print Dumper $hash_ref;
is ($hash_ref->{url},qw(/stack/teste1.html),'Confere Url'); 
# Delete
$hash_ref = $obj->delete({id=>1});
ok ($hash_ref,'Deletou');

