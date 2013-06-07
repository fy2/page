use strict;
use warnings;
use Test::More;


use Catalyst::Test 'PageApp';
use PageApp::Controller::Data;

ok( request('/data')->is_success, 'Request should succeed' );
done_testing();
