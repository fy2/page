package PageApp::Controller::Data;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

PageApp::Controller::Data - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash( active_action => '/data' );

    #warn $dbix_class_result_set_genome;  
    #while( my $genome = $dbix_class_result_set_genome->next) {
    #    warn $genome->sanger_lane_id;
    #}
    

    
    $c->stash->{template} = 'data.tt2';
}

=head2 artemis

=cut

sub artemis :Path('artemis') {
    my ( $self, $c ) = @_;
    
    #will stash a list of genomes to "genome_list" in context obj
    $self->stash_genome_list_for_user($c);
    
    $c->stash( active_action => '/data' );
    
    $c->stash->{template} = 'artemis.tt2';
}

=head2 act

=cut

sub act :Path('act'){
    my ( $self, $c ) = @_;
    
    #will stash a list of genomes to "genome_list" in context obj
    $self->stash_genome_list_for_user($c);
    
    $c->stash( active_action => '/data' );
    
    $c->stash->{template} = 'act.tt2';
}

=head2 download

=cut

sub download :Path('download'){
    my ( $self, $c ) = @_;
    
    $c->stash( active_action => '/data' );
    
    $c->stash->{template} = 'download.tt2';
}

=head2 resources

=cut

sub resources :Path('resources'){
    my ( $self, $c ) = @_;
    
    $c->stash( active_action => '/data/resources' );
    
    $c->stash->{template} = 'resources.tt2';
}

=head2 stash_genome_list_for_user 

=cut

sub stash_genome_list_for_user {
    
    my ($self, $c) = @_;
    my @dbix_class_result_set_genome = $c->user->user_roles
                                    ->search_related('role')
                                    ->search_related('genome_roles')
                                    ->search_related('genome');

    $c->stash->{genome_list} = \@dbix_class_result_set_genome;
    
    return 1;
}

=head2 auto

Check if there is a user and, if not, forward to login page

=cut

# Note that 'auto' runs after 'begin' but before your actions and that
# 'auto' "chain" (all from application path to most specific class are run)
sub auto : Private {
    my ($self, $c) = @_;

    # Allow unauthenticated users to reach the login page
    if ($c->request->path =~ /login/) {
        return 1;
    }

    # If a user doesn't exist, force login
    if (!$c->user_exists) {
        # Dump a log message to the development server debug output
        $c->log->debug('***Root::auto User not found, forwarding to /login');
        # Redirect the user to the login page
        $c->response->redirect($c->uri_for('/login'));
        # Return 0 to cancel 'post-auto' processing and prevent use of application
        return 0;
    }

    # User found, so return 1 to continue with processing after this 'auto'
    return 1;
}

=head1 AUTHOR

Feyruz Yalcin

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
