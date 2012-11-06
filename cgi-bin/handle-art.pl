#!/usr/bin/env perl

use CGI;
use Data::Dumper;
use strict;
use warnings;
use CGI::Carp qw(fatalsToBrowser);
use Readonly;

Readonly::Scalar my $NUMBER_OF_OPTIONS => 5;

my $q = CGI->new;

generate_art_jnlp();

sub generate_art_jnlp {

    my $genome_name  =  $q->param('genome1') or croak 'No Genome Selected';
    my $embl_arg      = get_embl_argument($genome_name) or croak 'EMBL argument could not be found';

    my $JNLP_STRING          = <<"END";
<jnlp spec="1.0+" codebase="http://www.sanger.ac.uk/resources/software/artemis/java/">
  <information>
    <title>Artemis</title>
    <vendor>Sanger Institute</vendor>
    <homepage href="http://www.sanger.ac.uk/Software/Artemis/"/>
    <description>Artemis</description>
    <description kind="short">DNA sequence viewer and annotation tool.</description>
    <offline-allowed/>
  </information>
  <security>
    <all-permissions/>
  </security>
  <resources>
    <j2se version="1.5+" initial-heap-size="32m" max-heap-size="512m"/>
    <jar href="sartemis.jar"/>
    <property name="com.apple.mrj.application.apple.menu.about.name" value="Artemis" />
    <property name="artemis.environment" value="UNIX" />
    <property name="apple.laf.useScreenMenuBar" value="true" />
  </resources>
  <application-desc main-class="uk.ac.sanger.artemis.components.ArtemisMain">
   $embl_arg
  </application-desc>
</jnlp>

END

    print "Content-Type: application/x-java-jnlp-file \n\n";
    print $JNLP_STRING;

    return 1;
}


sub get_embl_argument {
    my ($file) = @_;

    return
        '<argument>/Applications/MAMP/page-genome-data/embl/everett_embl/'
      . "$file.automated_annotation.embl.gz"
      . '</argument>';

}
