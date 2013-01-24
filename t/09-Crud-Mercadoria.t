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

# testa CRUD em Mercadoria.pm
my $obj = new_ok('Quitanda::Mercadoria');
my $hash_ref = {};

# Create
$hash_ref = $obj->create({
    nome            =>'teste', 
    valor           => 9.45,
    descricao       => 1,
});
ok ($hash_ref,'Criou');
print Dumper $hash_ref;

# Read
$hash_ref = $obj->read({id=>1});
ok ($hash_ref,'Leu');
print Dumper $hash_ref;
is ($hash_ref->{nome},'teste','Nome certo'); 

# Update
$hash_ref = $obj->update(
    { id => 1 },
    {
        valor => 8.32,
    }
);
ok ($hash_ref,'Atualizou');
print Dumper $hash_ref;
is ($hash_ref->{valor}, 8.32,'Confere valor'); 
# Delete
$hash_ref = $obj->delete({id=>1});
ok ($hash_ref,'Deletou');

