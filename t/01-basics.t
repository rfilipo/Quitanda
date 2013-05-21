#!perl -T

use Test::More tests => 5;
use Data::Dumper;
use lib "lib";

BEGIN {
    use_ok( 'Quitanda' ) || print "Bail out!
";
}

# verifica os metodos
can_ok('Quitanda', 'new','setup','estoque', 'encomenda', 'paga', 'recebe', 'entrega');

# cria uma nova loja
my $store = new_ok ('Quitanda');

# setup coloca a loja no estado default definido em quitanda.conf
ok($store->setup, 'Faz o Setup');

print "The new store:\n";
print Dumper $store;

#is_ok ("");

# Armazena mercadorias
ok($store->estoque([
   {
       data => 20121010,
      nome => 'Feijão',
      qt => '60kg',
      preco => 'R$90,00',
      fornecedor => '_id'
   }
   ,
   {
      data => 20121010,
      nome => 'Arroz',
      qt => '80kg',
      preco => 'R$70,00',
      fornecedor => '_id'
   }
   ]),"Armazena Mercadorias");
