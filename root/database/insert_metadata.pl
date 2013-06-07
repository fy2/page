#!/Users/fy2/perl5/perlbrew/perls/perl-5.16.0/bin/perl
# Wed Nov 21 16:03:44 2012
# insert_metadata.pl
# 

use vars qw($VERSION);

$VERSION="0.01";

use strict;
use warnings;
use Getopt::Long;
use Pod::Usage;
use DBI;

my ($opt_help, $opt_man);
my ($opt_METADATA, $opt_ROLE, $opt_SQLITE_DB);
GetOptions(
  'help|h'         => \$opt_help,
  'man|m'          => \$opt_man,
  'metadata|d=s'   => \$opt_METADATA,
  'sqlitedb|s=s'   => \$opt_SQLITE_DB,
) or pod2usage(-verbose => 1) && exit;

pod2usage(-verbose => 1) && exit if defined $opt_help;
pod2usage(-verbose => 2) && exit if defined $opt_man;
pod2usage(-verbose => 1) && exit unless 
                           (
                           defined $opt_METADATA 
                           and 
                           defined $opt_SQLITE_DB
                           );



my $DBH = DBI->connect("dbi:SQLite:dbname=$opt_SQLITE_DB",
                        '',
                        '',
                        { RaiseError => 1, AutoCommit => 0}
                        ) or die $DBI::errstr;;

insert_meta_data();

$DBH->commit();
$DBH->disconnect;


sub insert_meta_data {
    
    
    my $sth = $DBH->prepare("INSERT INTO genomes(sanger_lane_id, sanger_study_id, site, country_contact, mta_agreement, strain_id, strain_id_sanger, top_serotype, top_serotype_perc, second_seotype, second_seotype_perc, mlst, analysis_status, analysis_comment, jusficitation, gender, age_in_years, age_in_months, body_source, meningitis_outbreak_isolate, hiv, date_of_isolation, context, country_of_origin, region, city, hospital, latitude, longitude, location_country, location_city, cd4_count, age_category, no, lab_no, country_st, country, date_received, culture_received, sa_st, sa_penz, sa_eryz, sa_cliz, sa_tetz, sa_chlz, sa_rifz, sa_optz, sa_penmic, sa_amomic, sa_furmic, sa_cromic, sa_taxmic, sa_mermic, sa_vanmic, sa_erymic, sa_telmic, sa_climic, sa_tetmic, sa_cotmic, sa_chlmic, sa_cipmic, sa_levmic, sa_rifmic, sa_linmic, sa_synmic) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    open IN, $opt_METADATA or die $!;
    my $i =1;
    while(<IN>) {
        
        my @fields = split "\t", $_;
        
        #dont chomp the whole line but chomp the last element as 
        #the excel file has some empty fields towards the end
        chomp $fields[$#fields];
        
        if (scalar @fields != 65) {
            die "Rolling back all inserts for this file! I expected 65 fields for each isolate but got:" . scalar @fields ;    
        }
                                     
                                    
        $sth->execute(@fields);        
        print "Inserted ", $i++, " rows into database\n";
    }

}



__END__

=head1 NAME

 insert_metadata.pl

=head1 SYNOPSIS

B<insert_metadata.pl> [options...]

 Arguments:
   -metadata|d    meta data file with 65 fields for each isolate
   -sqlitedb|s    path to the sqlite db file   
   
 Options:
   -help|h        brief help message
   -man|m         full documentation

=head1 DESCRIPTION

B<insert_metadata.pl> will create necessary file links 
in PageApp's database for a given set of files and a role.

=head1 OPTIONS

=over 8

=item B<-help>

Print a brief help message and exit.

=item B<-man>

Print the manual page and exit.

=back

=head1 VERSION

Version 0.01

=cut
