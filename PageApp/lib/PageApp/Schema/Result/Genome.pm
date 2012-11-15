use utf8;
package PageApp::Schema::Result::Genome;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PageApp::Schema::Result::Genome

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

=head1 TABLE: C<genomes>

=cut

__PACKAGE__->table("genomes");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 sanger_lane_id

  data_type: 'text'
  is_nullable: 1

=head2 sanger_study_id

  data_type: 'integer'
  is_nullable: 1

=head2 site

  data_type: 'text'
  is_nullable: 1

=head2 country_contact

  data_type: 'text'
  is_nullable: 1

=head2 mta_agreement

  data_type: 'text'
  is_nullable: 1

=head2 strain_id

  data_type: 'text'
  is_nullable: 1

=head2 strain_id_sanger

  data_type: 'text'
  is_nullable: 1

=head2 top_serotype

  data_type: 'text'
  is_nullable: 1

=head2 top_serotype_perc

  data_type: 'real'
  is_nullable: 1

=head2 second_seotype

  data_type: 'text'
  is_nullable: 1

=head2 second_seotype_perc

  data_type: 'real'
  is_nullable: 1

=head2 mlst

  data_type: 'text'
  is_nullable: 1

=head2 analysis_status

  data_type: 'text'
  is_nullable: 1

=head2 analysis_comment

  data_type: 'text'
  is_nullable: 1

=head2 jusficitation

  data_type: 'text'
  is_nullable: 1

=head2 gender

  data_type: 'text'
  is_nullable: 1

=head2 age_in_years

  data_type: 'integer'
  is_nullable: 1

=head2 age_in_months

  data_type: 'integer'
  is_nullable: 1

=head2 body_source

  data_type: 'text'
  is_nullable: 1

=head2 meningitis_outbreak_isolate

  data_type: 'text'
  is_nullable: 1

=head2 hiv

  data_type: 'text'
  is_nullable: 1

=head2 date_of_isolation

  data_type: 'text'
  is_nullable: 1

=head2 context

  data_type: 'text'
  is_nullable: 1

=head2 country_of_origin

  data_type: 'text'
  is_nullable: 1

=head2 region

  data_type: 'text'
  is_nullable: 1

=head2 city

  data_type: 'text'
  is_nullable: 1

=head2 hospital

  data_type: 'text'
  is_nullable: 1

=head2 latitude

  data_type: 'text'
  is_nullable: 1

=head2 longitude

  data_type: 'text'
  is_nullable: 1

=head2 location_country

  data_type: 'text'
  is_nullable: 1

=head2 location_city

  data_type: 'text'
  is_nullable: 1

=head2 cd4_count

  data_type: 'text'
  is_nullable: 1

=head2 age_category

  data_type: 'text'
  is_nullable: 1

=head2 no

  data_type: 'text'
  is_nullable: 1

=head2 lab_no

  data_type: 'text'
  is_nullable: 1

=head2 country_st

  data_type: 'text'
  is_nullable: 1

=head2 country

  data_type: 'text'
  is_nullable: 1

=head2 date_received

  data_type: 'text'
  is_nullable: 1

=head2 culture_received

  data_type: 'text'
  is_nullable: 1

=head2 sa_st

  data_type: 'number'
  is_nullable: 1

=head2 sa_penz

  data_type: 'number'
  is_nullable: 1

=head2 sa_eryz

  data_type: 'number'
  is_nullable: 1

=head2 sa_cliz

  data_type: 'number'
  is_nullable: 1

=head2 sa_tetz

  data_type: 'number'
  is_nullable: 1

=head2 sa_chlz

  data_type: 'number'
  is_nullable: 1

=head2 sa_rifz

  data_type: 'number'
  is_nullable: 1

=head2 sa_optz

  data_type: 'number'
  is_nullable: 1

=head2 sa_penmic

  data_type: 'real'
  is_nullable: 1

=head2 sa_amomic

  data_type: 'real'
  is_nullable: 1

=head2 sa_furmic

  data_type: 'real'
  is_nullable: 1

=head2 sa_cromic

  data_type: 'real'
  is_nullable: 1

=head2 sa_taxmic

  data_type: 'real'
  is_nullable: 1

=head2 sa_mermic

  data_type: 'real'
  is_nullable: 1

=head2 sa_vanmic

  data_type: 'real'
  is_nullable: 1

=head2 sa_erymic

  data_type: 'real'
  is_nullable: 1

=head2 sa_telmic

  data_type: 'real'
  is_nullable: 1

=head2 sa_climic

  data_type: 'real'
  is_nullable: 1

=head2 sa_tetmic

  data_type: 'integer'
  is_nullable: 1

=head2 sa_cotmic

  data_type: 'integer'
  is_nullable: 1

=head2 sa_chlmic

  data_type: 'integer'
  is_nullable: 1

=head2 sa_cipmic

  data_type: 'integer'
  is_nullable: 1

=head2 sa_levmic

  data_type: 'real'
  is_nullable: 1

=head2 sa_rifmic

  data_type: 'integer'
  is_nullable: 1

=head2 sa_linmic

  data_type: 'integer'
  is_nullable: 1

=head2 sa_synmic

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "sanger_lane_id",
  { data_type => "text", is_nullable => 1 },
  "sanger_study_id",
  { data_type => "integer", is_nullable => 1 },
  "site",
  { data_type => "text", is_nullable => 1 },
  "country_contact",
  { data_type => "text", is_nullable => 1 },
  "mta_agreement",
  { data_type => "text", is_nullable => 1 },
  "strain_id",
  { data_type => "text", is_nullable => 1 },
  "strain_id_sanger",
  { data_type => "text", is_nullable => 1 },
  "top_serotype",
  { data_type => "text", is_nullable => 1 },
  "top_serotype_perc",
  { data_type => "real", is_nullable => 1 },
  "second_seotype",
  { data_type => "text", is_nullable => 1 },
  "second_seotype_perc",
  { data_type => "real", is_nullable => 1 },
  "mlst",
  { data_type => "text", is_nullable => 1 },
  "analysis_status",
  { data_type => "text", is_nullable => 1 },
  "analysis_comment",
  { data_type => "text", is_nullable => 1 },
  "jusficitation",
  { data_type => "text", is_nullable => 1 },
  "gender",
  { data_type => "text", is_nullable => 1 },
  "age_in_years",
  { data_type => "integer", is_nullable => 1 },
  "age_in_months",
  { data_type => "integer", is_nullable => 1 },
  "body_source",
  { data_type => "text", is_nullable => 1 },
  "meningitis_outbreak_isolate",
  { data_type => "text", is_nullable => 1 },
  "hiv",
  { data_type => "text", is_nullable => 1 },
  "date_of_isolation",
  { data_type => "text", is_nullable => 1 },
  "context",
  { data_type => "text", is_nullable => 1 },
  "country_of_origin",
  { data_type => "text", is_nullable => 1 },
  "region",
  { data_type => "text", is_nullable => 1 },
  "city",
  { data_type => "text", is_nullable => 1 },
  "hospital",
  { data_type => "text", is_nullable => 1 },
  "latitude",
  { data_type => "text", is_nullable => 1 },
  "longitude",
  { data_type => "text", is_nullable => 1 },
  "location_country",
  { data_type => "text", is_nullable => 1 },
  "location_city",
  { data_type => "text", is_nullable => 1 },
  "cd4_count",
  { data_type => "text", is_nullable => 1 },
  "age_category",
  { data_type => "text", is_nullable => 1 },
  "no",
  { data_type => "text", is_nullable => 1 },
  "lab_no",
  { data_type => "text", is_nullable => 1 },
  "country_st",
  { data_type => "text", is_nullable => 1 },
  "country",
  { data_type => "text", is_nullable => 1 },
  "date_received",
  { data_type => "text", is_nullable => 1 },
  "culture_received",
  { data_type => "text", is_nullable => 1 },
  "sa_st",
  { data_type => "number", is_nullable => 1 },
  "sa_penz",
  { data_type => "number", is_nullable => 1 },
  "sa_eryz",
  { data_type => "number", is_nullable => 1 },
  "sa_cliz",
  { data_type => "number", is_nullable => 1 },
  "sa_tetz",
  { data_type => "number", is_nullable => 1 },
  "sa_chlz",
  { data_type => "number", is_nullable => 1 },
  "sa_rifz",
  { data_type => "number", is_nullable => 1 },
  "sa_optz",
  { data_type => "number", is_nullable => 1 },
  "sa_penmic",
  { data_type => "real", is_nullable => 1 },
  "sa_amomic",
  { data_type => "real", is_nullable => 1 },
  "sa_furmic",
  { data_type => "real", is_nullable => 1 },
  "sa_cromic",
  { data_type => "real", is_nullable => 1 },
  "sa_taxmic",
  { data_type => "real", is_nullable => 1 },
  "sa_mermic",
  { data_type => "real", is_nullable => 1 },
  "sa_vanmic",
  { data_type => "real", is_nullable => 1 },
  "sa_erymic",
  { data_type => "real", is_nullable => 1 },
  "sa_telmic",
  { data_type => "real", is_nullable => 1 },
  "sa_climic",
  { data_type => "real", is_nullable => 1 },
  "sa_tetmic",
  { data_type => "integer", is_nullable => 1 },
  "sa_cotmic",
  { data_type => "integer", is_nullable => 1 },
  "sa_chlmic",
  { data_type => "integer", is_nullable => 1 },
  "sa_cipmic",
  { data_type => "integer", is_nullable => 1 },
  "sa_levmic",
  { data_type => "real", is_nullable => 1 },
  "sa_rifmic",
  { data_type => "integer", is_nullable => 1 },
  "sa_linmic",
  { data_type => "integer", is_nullable => 1 },
  "sa_synmic",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<sanger_lane_id_unique>

=over 4

=item * L</sanger_lane_id>

=back

=cut

__PACKAGE__->add_unique_constraint("sanger_lane_id_unique", ["sanger_lane_id"]);

=head1 RELATIONS

=head2 genome_roles

Type: has_many

Related object: L<PageApp::Schema::Result::GenomeRole>

=cut

__PACKAGE__->has_many(
  "genome_roles",
  "PageApp::Schema::Result::GenomeRole",
  { "foreign.genome_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 roles

Type: many_to_many

Composing rels: L</genome_roles> -> role

=cut

__PACKAGE__->many_to_many("roles", "genome_roles", "role");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-11-15 12:00:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+7mWTcUjP38LGEv0DSvBFg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
