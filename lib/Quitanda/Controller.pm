package Quitanda::Controller;


=pod

=head1 NAME

Quitanda::Controller - Abstract Class
  

=head1 DESCRIPTION

Controlling things in Quitanda

=cut

use Quitanda::Model;
use Moose;
use namespace::autoclean;

our $VERSION = '0.01';

=head2 Atributes

    resultset
    String com o nome da tabela do DBIC Resultset

    config
    Perl structure from quitanda.conf

=cut

has 'resultset' => (
    is  => 'rw'
);

has 'config' => (
    is  => 'rw'
);


=head3 BUILD
     O construtor
=cut

sub BUILD {
	my $self = shift;
        $self->resultset('None') unless $self->{resultset};
	return 1;
}

=head3 search

   Parameters :
      params : HashRef : 

   Return : 
      a HashRef    

   Description : 

=cut

sub search {
    use Carp;
    my (
        $self,
        $params,    # HashRef :
    ) = @_;
    my $model = Quitanda::Model->new; 
    my $tb = lc($self->{resultset});
    my $result = [];
    if ($params->{$tb.'_id'}) {
        $result->[0] = $model->{schema}->resultset($self->{resultset})->find($params->{$tb.'_id'});
    } elsif ($params->{$tb.'_name'}) {
        my $rs = $model->{schema}->resultset($self->{resultset})->search({ $tb.'_name'=>{ 'like' => $params->{$tb.'_name'} } });
        while (my $tup = $rs->next) {
            push (@{$result}, $tup);
        } 
    } elsif ($params) {
        my $rs = $model->{schema}->resultset($self->{resultset})->search( $params );
        while (my $tup = $rs->next) {
            push (@{$result}, $tup);
        } 
    } else {
        croak('Controller need parameters to search. Sorry.');
    }
    return $result;
}

=head3 create

   Parameters :
      params : HashRef : 

   Return : 
      a DBIC Resultset    

   Description : 

=cut

sub create {
    my (
        $self,
        $params,    # HashRef :
    ) = @_;
    my $result = {};
    my $model =  Quitanda::Model->new;
    my $rs = $model->{schema}->resultset($self->{resultset})->create($params);
    foreach my $column ($rs->result_source->columns){
         $result->{$column} = $rs->$column;
    }
    return $result;
}

=head3 update

   Parameters :
      params : HashRef : 

   Return : 
      a DBIC Resultset    

   Description : 

=cut

sub update {
    my (
        $self,
        $params,    # HashRef :
        $change,    # HashRef :
    ) = @_;
    my $result = {};
    my $model = Quitanda::Model->new;
    my $rs = $model->{schema}->resultset($self->{resultset})->search($params)->single;
    $rs->update($change);
    foreach my $column ($rs->result_source->columns){
         $result->{$column} = $rs->$column;
    }
    return $result;
}

=head3 read

   Parameters :
      params : HashRef : 

   Return : 
      HashRef  

   Description : 

=cut


sub read {
    my (
        $self,
        $params,    # HashRef :
    #    $field,     # Scalar
    ) = @_;
    my $model =  Quitanda::Model->new;
    my $result = {};
    my $rs = $model->{schema}->resultset($self->{resultset})->search($params)->single;
    if (!$rs) {
        return undef;
    }
    foreach my $column ($rs->result_source->columns){
         $result->{$column} = $rs->$column;
    }
    return $result;
}

=head3 find

   Parameters :
      id : integer 

   Return : 
      HashRef

   Description : 
for compatibility with DBIC

=cut


sub find {
    my (
        $self,
        $id,    # integer
    ) = @_;
    return $self->read({id => $id});
}



=head3 delete

   Parameters :
      params : HashRef : 

   Return : 
      a DBIC Resultset    

   Description : 

=cut


sub delete {
    my (
        $self,
        $params,    # HashRef :
    ) = @_;
    my $model =  Quitanda::Model->new;
    my $rs = $self->search($params);
    foreach my $r (@{$rs}) {
        $r->delete;
    }
    return $rs;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=pod
      
=head1 SUPPORT

No support is available

=head1 AUTHOR

Copyright 2012 Monsenhor.

=cut
