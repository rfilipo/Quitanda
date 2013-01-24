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

# testa CRUD em Entrega.pm
my $obj = new_ok('Quitanda::Entrega');
my $hash_ref = {};

# Create
$hash_ref = $obj->create({
    endereco_id  => 5, 
    data         => $now,
    valor        => 345.00,
    cliente_id   => 1,
    cesta_id     => 7 ,
    obs          => qw(teste) ,
});
ok ($hash_ref,'Criou');
print Dumper $hash_ref;

# Read
$hash_ref = $obj->read({id=>1});
ok ($hash_ref,'Leu');
print Dumper $hash_ref;
is ($hash_ref->{valor}, 345.00, 'Valor certo'); 

# Update
$hash_ref = $obj->update(
    { id => 1 },
    {
    valor       => 234.98,
    endereco_id => 3, 
    }
);
ok ($hash_ref,'Atualizou');
print Dumper $hash_ref;
is ($hash_ref->{valor},234.98,'Confere valor'); 
# Delete
$hash_ref = $obj->delete({id=>1});
ok ($hash_ref,'Deletou');

