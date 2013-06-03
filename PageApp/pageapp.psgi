use strict;
use warnings;
use lib '/www/perllib/lib/perl5';
use lib '/www/page/PageApp/lib';
#use lib '/Users/fy2/PageApplication/page/PageApp/lib';
use PageApp;

my $app = PageApp->apply_default_middlewares(PageApp->psgi_app);
$app;

