#!/usr/bin/env perl
 
use strict;
use warnings;
use lib './lib';
use PageApp::Schema;

my $db = $ARGV[0] or die "I need the path to the 'pageapp.db'"; 

my $schema = PageApp::Schema->connect("dbi:SQLite:$db");
 
my @users = $schema->resultset('User')->all;
foreach my $user (@users) {

    my $existing_password = $user->get_column('password');
    
    #dont encrypt if already encrypted
    next if $existing_password =~ /^\{SSHA\}/; 
    
    #This will hash and salt it (see User.pm)
    $user->password($existing_password); 

    $user->update; #commits
}

print "Encryption succeded\n";
