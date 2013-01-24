package Quitanda::Schema::Result::Fornecedor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Quitanda::Schema::Result::Fornecedor

=cut

__PACKAGE__->table("fornecedor");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 nome

  data_type: 'text'
  is_nullable: 1

=head2 documento

  data_type: 'text'
  is_nullable: 1

=head2 email

  data_type: 'text'
  is_nullable: 1

=head2 endereco_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "nome",
  { data_type => "text", is_nullable => 1 },
  "documento",
  { data_type => "text", is_nullable => 1 },
  "email",
  { data_type => "text", is_nullable => 1 },
  "endereco_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 caixas

Type: has_many

Related object: L<Quitanda::Schema::Result::Caixa>

=cut

__PACKAGE__->has_many(
  "caixas",
  "Quitanda::Schema::Result::Caixa",
  { "foreign.fornecedor_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 endereco

Type: belongs_to

Related object: L<Quitanda::Schema::Result::Endereco>

=cut

__PACKAGE__->belongs_to(
  "endereco",
  "Quitanda::Schema::Result::Endereco",
  { id => "endereco_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2012-10-15 16:59:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PpF5rAYQVpYHO+rEvfHgQw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
