use strict;
use warnings;
use LWP::Simple;

my @pages = qw(consortium contact cookiespolicy index);
foreach my $page (@pages) {

    my $suffixed = $page. ".html";
    print "Fetching $suffixed\n";
    getstore("http://fy2-pagegenomes.sandbox.sanger.ac.uk/$suffixed", $suffixed ) or die "Unable to get page $suffixed";

}
    getstore("http://fy2-pagegenomes.sandbox.sanger.ac.uk/data/data.html", "data.html" ) or die "Unable to get page";
    getstore("http://fy2-pagegenomes.sandbox.sanger.ac.uk/pg/act", "act.html" ) or die "Unable to get page";
    getstore("http://fy2-pagegenomes.sandbox.sanger.ac.uk/pg/artemis", "artemis.html" ) or die "Unable to get page";

exit 0;
