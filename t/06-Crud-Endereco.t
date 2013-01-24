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

# testa CRUD em Endereco.pm
my $obj = new_ok('Quitanda::Endereco');
my $hash_ref = {};

# Create
$hash_ref = $obj->create({
    pais            =>'BR', 
    estado          =>'SP',
    cidade          =>'São Paulo', 
    bairro          =>'Butantã', 
    rua             =>'Rua Fernando Cldas', 
    numero          =>'170', 
    complemento     =>'1707', 
    cep     =>'20230-001', 
    mapa     =>'http://goo.gl/maps/1jtMW', 
});
ok ($hash_ref,'Criou');
print Dumper $hash_ref;

# Read
$hash_ref = $obj->read({id=>1});
ok ($hash_ref,'Leu');
print Dumper $hash_ref;
is ($hash_ref->{mapa},'http://goo.gl/maps/1jtMW','Mapa ok'); 

# Update
$hash_ref = $obj->update(
    { id => 1 },
    {
    mapa => 'http://goo.gl/maps/1jtMe',
    cep  =>'10830-326', 
    }
);
ok ($hash_ref,'Atualizou');
print Dumper $hash_ref;
is ($hash_ref->{cep},qw(10830-326),'Confere cep'); 
# Delete
$hash_ref = $obj->delete({id=>1});
ok ($hash_ref,'Deletou');

