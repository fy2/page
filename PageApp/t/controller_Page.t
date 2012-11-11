use strict;
use warnings;
use Test::More;


use Catalyst::Test 'PageApp';
use PageApp::Controller::Page;

ok( request('/page')->is_success, 'Request should succeed' );
done_testing();
