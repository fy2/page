use strict;
use warnings;
use Template;
use Readonly;
Readonly::Scalar my $USER => 'everett';
Readonly::Scalar my $DATA_ROOT => '/Applications/MAMP/page/genome-data/embl/';


my $template_file = $ARGV[0] or die "No template argument supplied";

my $template_vars = {
    'genome_list' => \&get_genome_list,
};


sub get_genome_list {

    opendir DIR, "$DATA_ROOT/$USER" or die "cannot open dir $DATA_ROOT: $!";
    my @files = grep { $_ ne '.' && $_ ne '..' } readdir DIR;
    closedir DIR;

    my @sorted;
    my $i = 0;
    foreach my $file (sort { $a cmp $b } @files) {
        my ($name) = $file =~ /^(.+?)\./;

        push @sorted, {'name' => $name, 'number' => ++$i } ;
    }

    return \@sorted;
}

my $template_object = Template->new();

$template_object->process($template_file, $template_vars) or die $template_object->error();
