#!/Users/fy2/perl5/perlbrew/perls/perl-5.16.0/bin/perl
# Wed Nov 21 16:03:44 2012
# insert_role_on_metadata.pl
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
  'role|r=s'       => \$opt_ROLE,
  'sqlitedb|s=s'   => \$opt_SQLITE_DB,
) or pod2usage(-verbose => 1) && exit;

pod2usage(-verbose => 1) && exit if defined $opt_help;
pod2usage(-verbose => 2) && exit if defined $opt_man;
pod2usage(-verbose => 1) && exit unless 
                           (
                           defined $opt_METADATA 
                           and 
                           defined $opt_ROLE
                           and 
                           defined $opt_SQLITE_DB
                           );



my $DBH = DBI->connect("dbi:SQLite:dbname=$opt_SQLITE_DB",
                        '',
                        '',
                        { RaiseError => 1, AutoCommit => 0}
                      ) or die $DBI::errstr;

insert_role_on_meta_data();

$DBH->commit;
$DBH->disconnect;

sub insert_role_on_meta_data {
    
    my $role_id   = get_db_id_for_userrole();
    die "no role id could be found for role:\n$opt_ROLE\n" unless $role_id;
    
    
    open IN, $opt_METADATA or die $!;
    my $i =1;
    
    my $sth = $DBH->prepare("INSERT INTO genome_roles (genome_id, role_id) values (?, $role_id)" );
    
    while(<IN>) {
        
        my ($sanger_lane_id, undef, undef, undef, undef,$strain_id) = split "\t", $_;
        
        my $genome_id = get_db_id_for_genome($sanger_lane_id, $strain_id);
        die "no genome id could be found for genome:\n$_\n" unless $genome_id;
        
        $sth->execute($genome_id) or die "Rolling back all inserts for this file:\n". $DBI::errstr;

        print "Linked $strain_id with $opt_ROLE. Total number of created links:", $i++, "\n";
        
    }
    
}

sub get_db_id_for_userrole {

    my $sth = $DBH->prepare("SELECT id FROM roles WHERE role  = '$opt_ROLE'") or die $DBI::errstr;
    $sth->execute;
    my ($id) = $sth->fetchrow_array;
    return $id; 
}

sub get_db_id_for_genome {
    
    my ($sanger_lane_id, $strain_id) = @_;
    
    my $sth = $DBH->prepare("SELECT id FROM genomes WHERE sanger_lane_id = '$sanger_lane_id' and strain_id = '$strain_id'") or die $DBI::errstr;
    $sth->execute;
    my ($id) = $sth->fetchrow_array;
    
    return $id;
} 



__END__

=head1 NAME

 insert_role_metadata.pl

=head1 SYNOPSIS

B<insert_role_metadata.pl> [options...]

 Arguments:
   -metadata|d    directory for the embl files
   -role|r        name of the role to assign these embl files
   -sqlitedb|s    path to the sqlite db file   
   
 Options:
   -help|h        brief help message
   -man|m         full documentation

=head1 DESCRIPTION

B<insert_role_metadata.pl> will create necessary file links 
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
