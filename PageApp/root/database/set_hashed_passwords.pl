#!/usr/bin/env perl
 
use strict;
use warnings;
use lib './lib';
use PageApp::Schema;
 
my $schema = PageApp::Schema->connect('dbi:SQLite:pageapp.db');
 
my @users = $schema->resultset('User')->all;
foreach my $user (@users) {
    next unless ($user->username eq 'guest');
    my $existing_password = $user->get_column('password');
    $user->password($existing_password); #will implicitly hash and salt it (see User.pm)
    $user->update; #commit
}
