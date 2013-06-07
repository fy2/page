package PageApp::Schema::Result::Genome;

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

PageApp::Schema::Result::Genome

=cut

__PACKAGE__->table("genomes");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 remarks

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 sanger_id

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 sanger_study_id

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 species

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 serotype

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 site

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 country_contact

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 mta_agreement

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 strain_id

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 strain_id_sanger

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 top_serotype

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 top_serotype_perc

  data_type: 'varchar'
  is_nullable: 1
  size: 25

=head2 second_serotype

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 second_serotype_perc

  data_type: 'varchar'
  is_nullable: 1
  size: 25

=head2 mlst

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 analysis_status

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 analysis_comment

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 gender

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 age_in_years

  data_type: 'text'
  is_nullable: 1

=head2 age_in_months

  data_type: 'text'
  is_nullable: 1

=head2 body_source

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 meningitis_outbreak_isolate

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 hiv

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 date_of_isolation

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 context

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 country_of_origin

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 region

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 city

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 hospital

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 latitude

  data_type: 'float   '-1''
  is_nullable: 1

=head2 longitude

  data_type: 'float   '-1''
  is_nullable: 1

=head2 location_country

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 location_city

  data_type: 'varchar'
  is_nullable: 1
  size: 45

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

  data_type: 'text'
  is_nullable: 1

=head2 sa_penz

  data_type: 'text'
  is_nullable: 1

=head2 sa_eryz

  data_type: 'text'
  is_nullable: 1

=head2 sa_cliz

  data_type: 'text'
  is_nullable: 1

=head2 sa_tetz

  data_type: 'text'
  is_nullable: 1

=head2 sa_chlz

  data_type: 'text'
  is_nullable: 1

=head2 sa_rifz

  data_type: 'text'
  is_nullable: 1

=head2 sa_optz

  data_type: 'text'
  is_nullable: 1

=head2 sa_penmic

  data_type: 'text'
  is_nullable: 1

=head2 sa_amomic

  data_type: 'text'
  is_nullable: 1

=head2 sa_furmic

  data_type: 'text'
  is_nullable: 1

=head2 sa_cromic

  data_type: 'text'
  is_nullable: 1

=head2 sa_taxmic

  data_type: 'text'
  is_nullable: 1

=head2 sa_mermic

  data_type: 'text'
  is_nullable: 1

=head2 sa_vanmic

  data_type: 'text'
  is_nullable: 1

=head2 sa_erymic

  data_type: 'text'
  is_nullable: 1

=head2 sa_telmic

  data_type: 'text'
  is_nullable: 1

=head2 sa_climic

  data_type: 'text'
  is_nullable: 1

=head2 sa_tetmic

  data_type: 'text'
  is_nullable: 1

=head2 sa_cotmic

  data_type: 'text'
  is_nullable: 1

=head2 sa_chlmic

  data_type: 'text'
  is_nullable: 1

=head2 sa_cipmic

  data_type: 'text'
  is_nullable: 1

=head2 sa_levmic

  data_type: 'text'
  is_nullable: 1

=head2 sa_rifmic

  data_type: 'text'
  is_nullable: 1

=head2 sa_linmic

  data_type: 'text'
  is_nullable: 1

=head2 sa_synmic

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "remarks",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "sanger_id",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "sanger_study_id",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "species",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "serotype",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "site",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "country_contact",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "mta_agreement",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "strain_id",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "strain_id_sanger",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "top_serotype",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "top_serotype_perc",
  { data_type => "varchar", is_nullable => 1, size => 25 },
  "second_serotype",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "second_serotype_perc",
  { data_type => "varchar", is_nullable => 1, size => 25 },
  "mlst",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "analysis_status",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "analysis_comment",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "gender",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "age_in_years",
  { data_type => "text", is_nullable => 1 },
  "age_in_months",
  { data_type => "text", is_nullable => 1 },
  "body_source",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "meningitis_outbreak_isolate",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "hiv",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "date_of_isolation",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "context",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "country_of_origin",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "region",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "city",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "hospital",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "latitude",
  { data_type => "float   '-1'", is_nullable => 1 },
  "longitude",
  { data_type => "float   '-1'", is_nullable => 1 },
  "location_country",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "location_city",
  { data_type => "varchar", is_nullable => 1, size => 45 },
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
  { data_type => "text", is_nullable => 1 },
  "sa_penz",
  { data_type => "text", is_nullable => 1 },
  "sa_eryz",
  { data_type => "text", is_nullable => 1 },
  "sa_cliz",
  { data_type => "text", is_nullable => 1 },
  "sa_tetz",
  { data_type => "text", is_nullable => 1 },
  "sa_chlz",
  { data_type => "text", is_nullable => 1 },
  "sa_rifz",
  { data_type => "text", is_nullable => 1 },
  "sa_optz",
  { data_type => "text", is_nullable => 1 },
  "sa_penmic",
  { data_type => "text", is_nullable => 1 },
  "sa_amomic",
  { data_type => "text", is_nullable => 1 },
  "sa_furmic",
  { data_type => "text", is_nullable => 1 },
  "sa_cromic",
  { data_type => "text", is_nullable => 1 },
  "sa_taxmic",
  { data_type => "text", is_nullable => 1 },
  "sa_mermic",
  { data_type => "text", is_nullable => 1 },
  "sa_vanmic",
  { data_type => "text", is_nullable => 1 },
  "sa_erymic",
  { data_type => "text", is_nullable => 1 },
  "sa_telmic",
  { data_type => "text", is_nullable => 1 },
  "sa_climic",
  { data_type => "text", is_nullable => 1 },
  "sa_tetmic",
  { data_type => "text", is_nullable => 1 },
  "sa_cotmic",
  { data_type => "text", is_nullable => 1 },
  "sa_chlmic",
  { data_type => "text", is_nullable => 1 },
  "sa_cipmic",
  { data_type => "text", is_nullable => 1 },
  "sa_levmic",
  { data_type => "text", is_nullable => 1 },
  "sa_rifmic",
  { data_type => "text", is_nullable => 1 },
  "sa_linmic",
  { data_type => "text", is_nullable => 1 },
  "sa_synmic",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");

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


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2013-04-17 12:08:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lt4i1r9odX95bhHAqg4ndg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
