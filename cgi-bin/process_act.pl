#!/usr/bin/env perl

use CGI;
use Data::Dumper;
use strict;
use warnings;
use CGI::Carp qw(fatalsToBrowser);
use Readonly;

Readonly::Scalar my $NUMBER_OF_OPTIONS => 5;
Readonly::Scalar my $LOGGED_IN_USER => 'everett';
Readonly::Scalar my $DATA_ROOT_DIR => '/Applications/MAMP/page/genome-data';

my $q = CGI->new;

generate_act_jnlp();

sub generate_act_jnlp {

    my $input_arguments_in_jnlp_format = get_file_arguments();

    my $input_args_as_string = join "\n", @{$input_arguments_in_jnlp_format};
    my $JNLP_STRING          = <<"END";
<?xml version="1.0" encoding="UTF-8"?>
<jnlp spec="1.0+" codebase="http://www.sanger.ac.uk/resources/software/act/java/">
  <information>
    <title>Artemis Comparison Tool - ACT</title>
    <vendor>Sanger Institute</vendor>
    <homepage href="http://www.sanger.ac.uk/resources/software/act/"/>
    <description>ACT (current)</description>
    <description kind="short">DNA sequence viewer and annotation tool.</description>
    <offline-allowed/>
  </information>
  <security>
    <all-permissions/>
  </security>
  <resources>
    <j2se version="1.5+" initial-heap-size="60m" max-heap-size="510m"/>
    <jar href="sact_current.jar"/>
    <property name="com.apple.mrj.application.apple.menu.about.name" value="ACT" />
    <property name="artemis.environment" value="UNIX" />
    <property name="j2ssh" value="" />
  </resources>
  <application-desc main-class="uk.ac.sanger.artemis.components.ActMain">

   $input_args_as_string

  </application-desc>
</jnlp>
END

    print "Content-Type: application/x-java-jnlp-file \n\n";
    print $JNLP_STRING;

    return;
}

sub get_file_arguments {

    my @genome_selection;
    foreach my $enum ( 1 .. $NUMBER_OF_OPTIONS ) {
        my $param_name = 'genome' . $enum;
        my $value      = $q->param($param_name);
        if ($value) {
            push @genome_selection, $value;
        }
    }

    my @all_arguments;
    my $first_file = 1;
    my $previous_file;

    foreach my $file ( sort { $a cmp $b } @genome_selection )
    {    #sorts alphabetically, same order in crunch [first.second.crunch.gz]

        if ($first_file) {

            push @all_arguments, get_embl_argument($file);
            $first_file = 0;

        }
        else {

            push @all_arguments,
                get_crunch_argument( $file, $previous_file );
            push @all_arguments, get_embl_argument($file);

        }

        $previous_file = $file;
    }
    
    my @reversed_arguments = reverse @all_arguments; #in order to avoid, artemis, giving the flipping genome warning.
    return \@reversed_arguments;

}

sub get_crunch_argument {

    my ( $alphabetically_second, $alphabetically_first ) = @_;

    return
        "<argument>$DATA_ROOT_DIR/crunch/$LOGGED_IN_USER/"
      . "$alphabetically_first.$alphabetically_second.crunch.gz"
      . '</argument>';

}

sub get_embl_argument {
    my ($file) = @_;

    return
        "<argument>$DATA_ROOT_DIR/embl/$LOGGED_IN_USER/"
      . "$file.automated_annotation.embl.gz"
      . '</argument>';

}
