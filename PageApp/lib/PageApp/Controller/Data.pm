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

=head2 artemisjnlp

=cut

sub artemisjnlp :Path('artemisjnlp'){
    my ( $self, $c ) = @_;
    
      
    # Get the param argument for the selected genome and stash it so that 
    #artemis_jnlp.tt2 can access it and render a JNLP
    $c->stash->{selected_genome} = 
                join '/', (  
                           $c->config->{data}->{root}
                           
                           #This does not take into account that a user might have 
                           #more than one role! (see the "ToDo" file in the main app dir)
                         , $c->user->user_roles->search_related('role')->next->role
                         
                         , $c->config->{data}->{dir_name_of_annotation}
                         
                           #field is defined as "genome1" in the artemis.tt2 template
                         , $c->request->param('genome1') . $c->config->{data}->{file_extension_of_annotation}
                         );
    
    $c->stash( active_action => '/data' );
        
    $c->res->content_type('application/x-java-jnlp-file'); 
   
    $c->stash->{template} = 'artemis_jnlp.tt2';
    
    $c->forward( $c->view('JNLP') );
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

=head2 actjnlp

=cut

sub actjnlp :Path('actjnlp'){
    my ( $self, $c ) = @_;
      

    my @genome_selection;
    foreach my $param_name ( $c->request->param ) {
        my $value = $c->request->param($param_name);
        push @genome_selection, $value if ($value);
    }
    #use Data::Dumper;
    #die Dumper @genome_selection;
    my $rearranged_list = rearrange_act_arguments(  
                              \@genome_selection
                            , $c->config->{data}->{root}
                            
                              #wont make sense if user has more than one role. See "ToDo"file in main dir.                            
                            , $c->user->user_roles->search_related('role')->next->role
                            
                            , $c->config->{data}->{dir_name_of_crunch}
                            , $c->config->{data}->{file_extension_of_crunch}
                            
                            , $c->config->{data}->{dir_name_of_annotation}
                            , $c->config->{data}->{file_extension_of_annotation}
                          );
       
    $c->stash->{act_arguments} = $rearranged_list;
    
    
    
    $c->stash( active_action => '/data' );
        
    $c->res->content_type('application/x-java-jnlp-file'); 
   
    $c->stash->{template} = 'act_jnlp.tt2';
    
    $c->forward( $c->view('JNLP') );
}

=head2 rearrange_act_arguments

=cut

sub rearrange_act_arguments{
    my (  
          $genome_selection
        , $data_root
        , $role
        , $dir_name_of_crunch
        , $file_extension_of_crunch
        , $dir_name_of_annotation
        , $file_extension_of_annotation
        ) = @_;
    
    my @jnlp_compatible_arguments;
    my $is_first_genome = 1;
    my $previous_genome;
    foreach my $genome ( sort { $b cmp $a } @{$genome_selection} ) 
    {
        if ($is_first_genome) {

            push @jnlp_compatible_arguments, join '/', (  
                                                          $data_root
                                                        , $role
                                                        , $dir_name_of_annotation
                                                        , $genome . $file_extension_of_annotation
                                                       );
            $is_first_genome = 0;

        }
        else {
            
            push @jnlp_compatible_arguments, join '/', (  $data_root
                                                        , $role
                                                        , $dir_name_of_crunch
                                                        , "$genome.$previous_genome" . $file_extension_of_crunch
                                                       );
            
            push @jnlp_compatible_arguments, join '/', ( 
                                                          $data_root
                                                        , $role
                                                        , $dir_name_of_annotation
                                                        , $genome . $file_extension_of_annotation
                                                       );
               
        }
        $previous_genome = $genome;
    }
    
    return \@jnlp_compatible_arguments;
}

=head2 resources

=cut

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

=head2 fetchfile

=cut

sub fetchfile :Path('fetchfile'){
    my ( $self, $c, $file_name ) = @_;
     
    $c->stash( active_action => '/data/resources' );
     
    my ($file) = $c->model('DB::PageFile')->search({ name => $file_name });
    
    
    if (!$file) {
        #forward to an error page, about non existing file
        $c->res->redirect($c->uri_for('/notfound'));
    } else {
        $c->res->content_type($file->content_type);
        $c->response->body($file->file_blob);
    }
}

=head2 stash_genome_list_for_user 

=cut

sub stash_genome_list_for_user {
    
    my ($self, $c) = @_;
    my @dbix_class_result_set_genome = $c->user->user_roles
                                    ->search_related('role')
                                    ->search_related('genome_roles')
                                    ->search_related('genome');
    my @genomes;
    my $i = 1;
    {
        no warnings;
        foreach my $genome ( sort { $b->sanger_lane_id cmp $a->sanger_lane_id } @dbix_class_result_set_genome ) {
            
            push @genomes, {  sanger_lane_id => $genome->sanger_lane_id
                            , counter        => $i++
                            , strain_id      => $genome->strain_id  
                           };
        }
    }  
    $c->stash->{genome_list} = \@genomes;
    
    return 1;
}

sub inspect :Path('inspect'){
    my ($self, $c) = @_;
    
 
    push @{$c->stash->{add_js_files}}, '/static/core/js/jquery.js';
    push @{$c->stash->{add_js_files}}, '/static/core/js/jquery.dataTables.min.js';


    my @dbix_class_result_set_genome = $c->user->user_roles
                                ->search_related('role')
                                ->search_related('genome_roles')
                                ->search_related('genome');
    
    $c->stash->{genomes} = \@dbix_class_result_set_genome;
    $c->stash( active_action => '/data' );
    $c->stash->{template} = 'inspect.tt2';
    
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
