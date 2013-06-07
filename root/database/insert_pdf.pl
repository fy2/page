use strict;
use warnings;
use DBI qw(:sql_types);

my $db   = $ARGV[0];
my $file = $ARGV[1];

my $dbh = DBI->connect("dbi:SQLite:$db","","", {
          PrintError => 1,
            RaiseError => 1
          });

my $blob = `cat $file`;
my $sth = $dbh->prepare("INSERT INTO page_files 
    (name, content_type, file_blob) VALUES
    ('$file', 'application/pdf', ?)");
$sth->bind_param(1, $blob, SQL_BLOB);
$sth->execute() or die "$DBI::errstr";

