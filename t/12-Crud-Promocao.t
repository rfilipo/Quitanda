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

# testa CRUD em Promocao.pm
my $obj = new_ok('Quitanda::Promocao');
my $hash_ref = {};

# Create
$hash_ref = $obj->create({
    descricao       =>'testando promocao', 
    valor           => 345.67,
    promo_url       => '/promo/34',
    mercadoria_id  => 7 ,
});
ok ($hash_ref,'Criou');
print Dumper $hash_ref;

# Read
$hash_ref = $obj->read({id=>1});
ok ($hash_ref,'Leu');
print Dumper $hash_ref;
is ($hash_ref->{valor},345.67,'Preco certo'); 

# Update
$hash_ref = $obj->update(
    { id => 1 },
    {
        valor => 12.75, 
    }
);
ok ($hash_ref,'Atualizou');
print Dumper $hash_ref;
is ($hash_ref->{valor},12.75,'Confere preco'); 
# Delete
$hash_ref = $obj->delete({id=>1});
ok ($hash_ref,'Deletou');

