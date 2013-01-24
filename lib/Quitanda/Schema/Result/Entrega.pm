package Quitanda::Schema::Result::Entrega;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Quitanda::Schema::Result::Entrega

=cut

__PACKAGE__->table("entrega");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 endereco_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 cliente_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 obs

  data_type: 'text'
  is_nullable: 1

=head2 valor

  data_type: 'real'
  is_nullable: 1

=head2 cesta_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 data

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "endereco_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "cliente_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "obs",
  { data_type => "text", is_nullable => 1 },
  "valor",
  { data_type => "real", is_nullable => 1 },
  "cesta_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "data",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 cesta

Type: belongs_to

Related object: L<Quitanda::Schema::Result::Cesta>

=cut

__PACKAGE__->belongs_to(
  "cesta",
  "Quitanda::Schema::Result::Cesta",
  { id => "cesta_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

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


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2012-10-16 14:06:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Hw8La5fC2xHwn6gkQfvZqA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
