package PageApp::Schema::Result::PageFile;

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

PageApp::Schema::Result::PageFile

=cut

__PACKAGE__->table("page_files");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 content_type

  data_type: 'text'
  is_nullable: 1

=head2 size_in_bytes

  data_type: 'integer'
  is_nullable: 1

=head2 file_blob

  data_type: 'blob'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "content_type",
  { data_type => "text", is_nullable => 1 },
  "size_in_bytes",
  { data_type => "integer", is_nullable => 1 },
  "file_blob",
  { data_type => "blob", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("name_unique", ["name"]);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2013-04-17 12:08:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IFswd7wExK7HEuXdgILUCQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
