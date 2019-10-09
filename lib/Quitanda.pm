package Quitanda;

use warnings;
use strict;

use Moose;
use namespace::autoclean;

use Quitanda::Cesta;     
use Quitanda::Conta;    
use Quitanda::Entrega;   
use Quitanda::Mercadoria;
use Quitanda::Stack;     
use Quitanda::Cliente;   
use Quitanda::Endereco;  
use Quitanda::Fornecedor;
use Quitanda::Promocao;  
use Quitanda::User;  
use Config::General;

=head1 NAME

Quitanda - The great new Quitanda!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

has 'cesta' => (is => 'rw', isa      => 'Quitanda::Cesta');
has 'conta' => (is => 'rw', isa      => 'Quitanda::Conta');
has 'entrega' => (is => 'rw', isa    => 'Quitanda::Entrega');
has 'mercadoria' => (is => 'rw', isa => 'Quitanda::Mercadoria');
has 'stack' => (is => 'rw', isa      => 'Quitanda::Stack');
has 'cliente' => (is => 'rw', isa    => 'Quitanda::Cliente');
has 'endereco' => (is => 'rw', isa   => 'Quitanda::Endereco');
has 'fornecedor' => (is => 'rw', isa => 'Quitanda::Fornecedor');
has 'promocao' => (is => 'rw', isa   => 'Quitanda::Promocao');
has 'configuration' => (is => 'rw', isa     => 'HashRef');

=head1 NAME

Quitanda - Catalyst based application

=head1 SYNOPSIS

    use Quitanda;

    my $store = new Quitanda;

    # must setup the store.
    Quitanda->setup();  # use default values from quitanda.conf
    
    # setup with custom values
    Quitanda->setup({
          cesta => new Quitanda::Cesta({}), 
          conta => new Quitanda::Conta({}), 
          entrega => new Quitanda::Entrega({}), 
          mercadoria => new Quitanda::Mercadoria({}),           
          stack => new Quitanda::Stack({}), 
          cliente => new Quitanda::Cliente({}), 
          endereco => new Quitanda::Endereco({}), 
          fornecedor => new Quitanda::Fornecedor({})
          promocao => new Quitanda::Promocao({}), 
          db => 'dbi:SQLite:dbname=data/quitanda.db' 
    });
    # all model classes are DBIC or DBIx::Simple

    # But we can setup just something
    Quitanda->setup({
      cliente => new Quitanda::Cliente({ id => 1 }) 
    });

    # we have some facade to internal classes procedures
    Quitanda->encomenda({
           mercadorias => [
                 {id => 12, qt  => 8 }, 
                 {id => 18, qt => 2 }, 
                 {id => 567, qt => 1 }
           ],
           cliente => [{ id => 3 }]
    });
    Quitanda->paga({
           fornecedor => [{id => 23}],
           value      => 300;
    });
    Quitanda->recebe({ 
           cliente => [{id => 23}],
           value      => 900;
    });
    Quitanda->entrega({ 
           cesta => [{id => 23}],
    });
    Quitanda->estoque({ 
           mercadorias =>  [
                 {id => 12, qt => 8 }, 
                 {id => 18, qt => 2 }, 
                 {id => 567, qt => 1 }
           ],
           op => 'out'; 
    });

    # relatorio return data for client as perl structures 
    my $id = Quitanda->cliente->id;
    my $rel = Quitanda->relatorio({
        classes => 'Quitanda::Conta', 'Quitanda::Cliente';
        sql => 'select * from cliente, conta where cliente.id = '.$id.'
    });
    # this will return a structure like:
    $rel = {
        reltype => 'sql';
        result  => {contas=> /@mycontaclasses, clientes=>  /@myclienteclasses};
        message => "returned 2 arrays: contas / clientes"
    }


=head1 DESCRIPTION

Quitanda implements a ecommerce server. 
All data is returned as perl hash refs.
The system uses a configuration file for db and 

=cut

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=cut 

=head2 BUILD

=cut

sub BUILD {
    my $self  = shift;
    my $param = shift;

}

=head2 setup

=cut

sub setup {
    my $self  = shift;
    my $param = shift;

    my $config = $self->configuration({ Config::General->new("quitanda.conf")->getall });
    my @components = qw(cliente cesta conta mercadoria stack endereco fornecedor promocao);
    foreach my $comp_name (@components) {
        next unless $self->can($comp_name);
	my $module_name = join '::', 'Quitanda', ucfirst $comp_name;
        $self->$comp_name(
	    $param->{ $comp_name } || $module_name->new($config)
	);
    }
    return $self;
}

=head2 estoque

Coloca mercadorias no almoxerifado, na forma abaixo.
efetua o pagamento no valor para o fornecedor

$store->estoque([
   {
      data => 20121010,
      nome => 'Feijao',
      qt => '60kg',
      preco => 'R$90,00',
      fornecedor => '$id'
   }
   ,
   {
      data => 20121010,
      nome => 'Arroz',
      qt => '80kg',
      preco => 'R$70,00',
      fornecedor => '$id'
   }
   ]);

=cut

sub estoque {
    my $self = shift;
    my $thing = shift;
    # the thing need to be a ListRef
    foreach my $piece (@{$thing}){
         if ($piece->{data} &&  $piece->{nome} && 
              $piece->{qt} && $piece->{preco} && $piece->{fornecedor} ) {
            #print $piece->{nome};
            # Coloca mercadoria no almoxarifado
            # soma o valor para efetuar pagamento
            # prepara relatorio de pagamento
         }
    }
    #efetua o pagamento no valor para o fornecedor
    1;
}

=head2 encomenda

Coloca mercadorias na Cesta do cliente.

=cut

sub encomenda {
    my $self = shift;
    my $thing = shift;
    #if $self
    #
    1;
}

=head2 paga

Coloca mercadorias no almoxerifado, na forma abaixo.
efetua o pagamento no valor para o fornecedor

=cut

sub paga {
    my $self = shift;
    my $thing = shift;
    1;
}


=head2 recebe

Coloca mercadorias no almoxerifado, na forma abaixo.
efetua o pagamento no valor para o fornecedor

=cut

sub recebe {
    my $self = shift;
    my $thing = shift;
    1;
}




=head1 SEE ALSO

L<Quitanda::>,
L<Quitanda::Cesta>, 
L<Quitanda::Conta>, 
L<Quitanda::Entrega>, 
L<Quitanda::Mercadoria>,
L<Quitanda::Stack>, 
L<Quitanda::Cliente>, 
L<Quitanda::Endereco>, 
L<Quitanda::Fornecedor>, 
L<Quitanda::Promocao>, 
L<Quitanda::User>          


=head1 AUTHOR

Monsenhor, C<< <monsenhor at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-quitanda at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Quitanda>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Quitanda


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Quitanda>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Quitanda>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Quitanda>

=item * Search CPAN

L<http://search.cpan.org/dist/Quitanda/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Monsenhor.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Quitanda
