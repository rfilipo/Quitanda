package Quitanda::Schema::Result::Cesta;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Quitanda::Schema::Result::Cesta

=cut

__PACKAGE__->table("cesta");

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

=head2 mercadorias_ids

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
  "mercadorias_ids",
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

=head2 entregas

Type: has_many

Related object: L<Quitanda::Schema::Result::Entrega>

=cut

__PACKAGE__->has_many(
  "entregas",
  "Quitanda::Schema::Result::Entrega",
  { "foreign.cesta_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2012-10-16 14:06:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ETORm4+/FQUqYl43+Hpacg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
