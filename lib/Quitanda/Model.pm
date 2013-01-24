package Quitanda::Model;


=pod

=head1 NAME

Quitanda::Model
  

=head1 DESCRIPTION

Connects to data/press.db SQlite database
Can be overrided at creation time

=head1 Attr

rs : The DBIC column

column : The class name

schema: The DBIC Schema class

=cut

use Quitanda::Schema;
use Moose;
use namespace::autoclean;
use utf8;

our $VERSION = '0.01';

=head2


=cut

has 'rs' => (
    is  => 'rw'
);
has 'column' => (
    is  => 'rw'
);
has 'schema' => (
    is  => 'rw'
);

=head3 BUILD

   O Construtor

   Parameters :
      params : HashRef : 

   Return : 
      a HashRef    

   Description : 

=cut

sub BUILD {
	my $self = shift;
	$self->schema(Quitanda::Schema->connect('dbi:SQLite:data/quitanda.db')) unless $self->{schema};
        $self->column('None') unless $self->{column};
	return 1;
}

# some proxy methods, see also SchemaProxy

=head3 resultset

   The resultset table

   Parameters :
      params : HashRef : 

   Return : 
      a HashRef    

   Description : 

=cut

sub resultset { shift->schema->resultset(@_); }

=head3 txn_do

   Do some transformation

   Parameters :
      params : HashRef : 

   Return : 
      a HashRef    

   Description : 

=cut

sub txn_do { shift->schema->txn_do(@_); }

=head3 txn_scope_guard

   Proxy to Schema

   Parameters :
      params : HashRef : 

   Return : 
      a HashRef    

   Description : 

=cut

sub txn_scope_guard { shift->schema->txn_scope_guard(@_); }

=head3 storage

   Proxy to Schema

   Parameters :
      params : HashRef : 

   Return : 
      a HashRef    

   Description : 

=cut

sub storage { shift->schema->storage(@_); }

=head3 find

   Parameters :
      params : HashRef : 

   Return : 
      a HashRef    

   Description : 

=cut

sub find {
     my (
        $self,
        $id,    # HashRef :
    ) = @_;
    return $self->{schema}->resultset($self->{column})->find($id);
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
    my $tb = lc($self->{column});
    my $result = [];
    if ($params->{$tb.'_id'}) {
        $result->[0] = $self->{schema}->column($self->{column})->find($params->{$tb.'_id'});
    } elsif ($params->{$tb.'_name'}) {
        my $rs = $self->{schema}->column($self->{column})->search({ $tb.'_name' => { 'like' => $params->{$tb.'_name'} } });
        while (my $tup = $rs->next) {
            push (@{$result}, $tup);
        } 
    } elsif ($params) {
        my $rs = $self->{schema}->column($self->{column})->search( $params );
        while (my $tup = $rs->next) {
            push (@{$result}, $tup);
        } 
    } else {
        croak('Model need parameters to search. Sorry.');
    }
    return $result;
}

sub create {
    my (
        $self,
        $params,    # HashRef :
    ) = @_;
    my $tb = $self->{column};
    return $self->{schema}->column($tb)->create($params);
    #return $params;
}

sub update {
    my (
        $self,
        $params,    # HashRef :
        $change,    # HashRef
    ) = @_;
    my $rs = $self->search($params);
    foreach my $r (@{$rs}) {
        $r->update($change);
    }
    return $rs;
}

sub read {
    my (
        $self,
        $params,    # HashRef :
        $field,     # Scalar
    ) = @_;
    my $result;
    my $rs = $self->search($params)->[0];
    if ($rs) {
        $result = $rs->$field;
    } else {
        $result = undef;
    }
    return $result;
}

sub delete {
    my (
        $self,
        $params,    # HashRef :
    ) = @_;
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

      
=head3 create

   Parameters :

   Return : 
      

   Description : 
      

=head3 update

   Parameters :

   Return : 
      

   Description : 
      

=head3 read

   Parameters :

   Return : 
      

   Description : 
      

=head3 delete

   Parameters :

   Return : 
      

   Description : 
      

=cut

=head1 SUPPORT

No support is available

=head1 AUTHOR

Copyright 2012 Monsenhor.

=cut
