use utf8;
package PageApp::Schema::Result::GenomeRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PageApp::Schema::Result::GenomeRole

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::PassphraseColumn>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 TABLE: C<genome_roles>

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

=head1 PRIMARY KEY

=over 4

=item * L</genome_id>

=item * L</role_id>

=back

=cut

__PACKAGE__->set_primary_key("genome_id", "role_id");

=head1 RELATIONS

=head2 genome

Type: belongs_to

Related object: L<PageApp::Schema::Result::Genome>

=cut

__PACKAGE__->belongs_to(
  "genome",
  "PageApp::Schema::Result::Genome",
  { id => "genome_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 role

Type: belongs_to

Related object: L<PageApp::Schema::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "role",
  "PageApp::Schema::Result::Role",
  { id => "role_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-11-15 12:00:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BKPk11v+Ln0BXi2l02gSFQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
