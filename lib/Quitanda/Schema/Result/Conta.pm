package Quitanda::Schema::Result::Conta;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Quitanda::Schema::Result::Conta

=cut

__PACKAGE__->table("conta");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 nome

  data_type: 'text'
  is_nullable: 1

=head2 cliente_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 saldo

  data_type: 'real'
  is_nullable: 1

=head2 obs

  data_type: 'text'
  is_nullable: 1

=head2 data

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "nome",
  { data_type => "text", is_nullable => 1 },
  "cliente_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "saldo",
  { data_type => "real", is_nullable => 1 },
  "obs",
  { data_type => "text", is_nullable => 1 },
  "data",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 cliente

Type: belongs_to

Related object: L<Quitanda::Schema::Result::Cliente>

=cut

__PACKAGE__->belongs_to(
  "cliente",
  "Quitanda::Schema::Result::Cliente",
  { id => "cliente_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2012-10-15 16:59:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:otcP+WSHcMifzSEgj1qAsw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
