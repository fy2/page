use strict;
use warnings;
use DBI;
use Data::Dumper;

my $RAW_DATA_DIR = '/Applications/MAMP/page/PageApp/root/rawdata'; 

#rowdata dir contains one highlevel dir for each "role" with a defined tree structure
#├── antonio
#│   ├── annotation
#│   └── crunch
#├── collard
#│   ├── annotation
#│   └── crunch
#├── everett
#│   ├── annotation
#│   └── crunch
#└── gottberg
#    ├── annotation
#    └── crunch

my $db_name = $ARGV[0];
my $meta_tab_file = $ARGV[1];

my $DBH = DBI->connect("dbi:SQLite:dbname=$db_name","","");

#insert the meta_data
my $seen_lane_id_href = insert_meta_data( $meta_tab_file );

#read the directories contents in each role dir and create
#a database link
create_genome_and_role_links_in_db($seen_lane_id_href);

sub insert_meta_data {
    
    my $file_to_load = shift;
    #65 fields...
    my $sth = $DBH->prepare("INSERT INTO genomes(
        sanger_lane_id, sanger_study_id, site, country_contact, mta_agreement, strain_id, strain_id_sanger, top_serotype, top_serotype_perc, second_seotype, second_seotype_perc, mlst, analysis_status, analysis_comment, jusficitation, gender, age_in_years, age_in_months, body_source, meningitis_outbreak_isolate, hiv, date_of_isolation, context, country_of_origin, region, city, hospital, latitude, longitude, location_country, location_city, cd4_count, age_category, no, lab_no, country_st, country, date_received, culture_received, sa_st, sa_penz, sa_eryz, sa_cliz, sa_tetz, sa_chlz, sa_rifz, sa_optz, sa_penmic, sa_amomic, sa_furmic, sa_cromic, sa_taxmic, sa_mermic, sa_vanmic, sa_erymic, sa_telmic, sa_climic, sa_tetmic, sa_cotmic, sa_chlmic, sa_cipmic, sa_levmic, sa_rifmic, sa_linmic, sa_synmic) 
        VALUES (
        ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
    );

    open IN, $file_to_load or die $!;

    my %lane_ids;
    while(<IN>) {

        my @fields = split "\t", $_;
        die "expected 65 fields, but got: " . scalar @fields if scalar @fields != 65;
        $sth->execute(@fields);
        $lane_ids{$fields[0]}= $DBH->sqlite_last_insert_rowid();
        print "inserted", ",", $lane_ids{$fields[0]}, " into genomes\n";

    }

    return \%lane_ids;
}



#
#files have "sanger_lane_id.embl" structure
#
sub _get_annotation_files_for_role {

    my $role = shift;
    my $dir = "$RAW_DATA_DIR/$role/annotation";
    opendir DIR, $dir or die "cannot open dir:$dir $!";
    my @files = grep { $_ ne '.' && $_ ne '..' } readdir DIR;
    closedir DIR;
    return \@files;

}

sub create_genome_and_role_links_in_db {

    my $lane_ids_to_inspect = shift;

    my $sth = $DBH->prepare("SELECT id, role FROM roles");
    $sth->execute;
    
    my @new_lane_ids;
 
    my $sth2 = $DBH->prepare("INSERT INTO genome_roles (genome_id, role_id) values (?, ?)" );
    
   #for each role:
    while (my $role = $sth->fetchrow_hashref) {
        
        #$role->{id}
                 
        #arref to files in role dir
        my $files_in_dir = _get_annotation_files_for_role($role->{role});
        for my $file_in_role_dir (@$files_in_dir) {
            my ($prefix) = $file_in_role_dir =~ /(.+)\./;
            die $file_in_role_dir unless $prefix;
            #see of the genome name is in our hash of last inserted fields
            if ( exists $lane_ids_to_inspect->{$prefix} ) {
                               #primary id of genome,                 #primary id of role
                $sth2->execute($lane_ids_to_inspect->{$prefix}, $role->{id});
                print "inserted", ",", $lane_ids_to_inspect->{$prefix}, ",", $role->{id}, " into genome_roles\n";
            }
        }
    }
}

$DBH->disconnect;  # or call $dbh->rollback; to undo changes
