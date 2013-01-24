package Quitanda::Schema::Result::Stack;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Quitanda::Schema::Result::Stack

=cut

__PACKAGE__->table("stack");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 conteudo

  data_type: 'text'
  is_nullable: 1

=head2 titulo

  data_type: 'text'
  is_nullable: 1

=head2 url

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "conteudo",
  { data_type => "text", is_nullable => 1 },
  "titulo",
  { data_type => "text", is_nullable => 1 },
  "url",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2012-10-16 16:48:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:H9i941DQeLSDfdQGNfmq+g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
