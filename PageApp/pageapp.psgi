use strict;
use warnings;

use PageApp;

my $app = PageApp->apply_default_middlewares(PageApp->psgi_app);
$app;

