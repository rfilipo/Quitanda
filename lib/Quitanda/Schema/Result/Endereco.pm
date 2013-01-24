package Quitanda::Schema::Result::Endereco;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Quitanda::Schema::Result::Endereco

=cut

__PACKAGE__->table("endereco");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 pais

  data_type: 'text'
  is_nullable: 1

=head2 estado

  data_type: 'text'
  is_nullable: 1

=head2 cidade

  data_type: 'text'
  is_nullable: 1

=head2 bairro

  data_type: 'text'
  is_nullable: 1

=head2 rua

  data_type: 'text'
  is_nullable: 1

=head2 numero

  data_type: 'text'
  is_nullable: 1

=head2 complemento

  data_type: 'text'
  is_nullable: 1

=head2 cep

  data_type: 'text'
  is_nullable: 1

=head2 mapa

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "pais",
  { data_type => "text", is_nullable => 1 },
  "estado",
  { data_type => "text", is_nullable => 1 },
  "cidade",
  { data_type => "text", is_nullable => 1 },
  "bairro",
  { data_type => "text", is_nullable => 1 },
  "rua",
  { data_type => "text", is_nullable => 1 },
  "numero",
  { data_type => "text", is_nullable => 1 },
  "complemento",
  { data_type => "text", is_nullable => 1 },
  "cep",
  { data_type => "text", is_nullable => 1 },
  "mapa",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 clientes

Type: has_many

Related object: L<Quitanda::Schema::Result::Cliente>

=cut

__PACKAGE__->has_many(
  "clientes",
  "Quitanda::Schema::Result::Cliente",
  { "foreign.endereco_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fornecedors

Type: has_many

Related object: L<Quitanda::Schema::Result::Fornecedor>

=cut

__PACKAGE__->has_many(
  "fornecedors",
  "Quitanda::Schema::Result::Fornecedor",
  { "foreign.endereco_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 entregas

Type: has_many

Related object: L<Quitanda::Schema::Result::Entrega>

=cut

__PACKAGE__->has_many(
  "entregas",
  "Quitanda::Schema::Result::Entrega",
  { "foreign.endereco_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2012-10-16 14:35:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LmQFaxNrck8iV/SVdDGs0w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
