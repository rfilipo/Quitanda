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

# testa CRUD em Conta.pm
my $obj = new_ok('Quitanda::Conta');
my $hash_ref = {};

# Create
$hash_ref = $obj->create({
    nome            =>'teste', 
    data            =>$now,
    cliente_id      => 1,
    saldo           => 26547.98 ,
    obs             => 'testando a tabela conta' ,
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
    saldo => 2.35,
    nome            =>'teste updated', 
    }
);
ok ($hash_ref,'Atualizou');
print Dumper $hash_ref;
is ($hash_ref->{saldo}, 2.35,'Confere saldo'); 
# Delete
$hash_ref = $obj->delete({id=>1});
ok ($hash_ref,'Deletou');

