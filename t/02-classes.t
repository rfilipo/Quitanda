#!perl -T

use Test::More tests => 12;
use Data::Dumper;

BEGIN {
    use_ok( 'Quitanda' ) || print "Bail out!
";
}

# testa as classes, os controllers de Quitanda:
#Cesta.pm
new_ok('Quitanda::Cesta');
#Cliente.pm
new_ok('Quitanda::Cliente');
#Conta.pm
new_ok('Quitanda::Conta');
#Endereco.pm
new_ok('Quitanda::Endereco');
#Entrega.pm
new_ok('Quitanda::Entrega');
#Fornecedor.pm
new_ok('Quitanda::Fornecedor');
#Mercadoria.pm
new_ok('Quitanda::Mercadoria');
#Model.pm
new_ok('Quitanda::Model');
#Promocao.pm
new_ok('Quitanda::Promocao');
#Stack.pm
new_ok('Quitanda::Stack');
#User.pm
new_ok('Quitanda::User');
