#!/usr/bin/perl
 
use strict;
use warnings;
 
use PageApp::Schema;
 
my $schema = PageApp::Schema->connect('dbi:SQLite:pageapp.db');
 
my @users = $schema->resultset('User')->all;
 
foreach my $user (@users) {
    my $existing_password = $user->get_column('password');
    $user->password($existing_password);
    $user->update;
}
