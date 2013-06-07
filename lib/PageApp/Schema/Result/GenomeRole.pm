package PageApp::Schema::Result::GenomeRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 NAME

PageApp::Schema::Result::GenomeRole

=cut

__PACKAGE__->table("genome_roles");

=head1 ACCESSORS

=head2 genome_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 role_id

  data_type: 'role_id integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "genome_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "role_id",
  { data_type => "role_id integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("genome_id", "role_id");

=head1 RELATIONS

=head2 role

Type: belongs_to

Related object: L<PageApp::Schema::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "role",
  "PageApp::Schema::Result::Role",
  { id => "role_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 genome

Type: belongs_to

Related object: L<PageApp::Schema::Result::Genome>

=cut

__PACKAGE__->belongs_to(
  "genome",
  "PageApp::Schema::Result::Genome",
  { id => "genome_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2013-04-17 12:08:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:51YC9XdFhazyvCfcFUWn6g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
