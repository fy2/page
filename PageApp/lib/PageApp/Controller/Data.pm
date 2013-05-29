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

    $c->stash->{template} = 'data.tt2';
}

=head2 artemis

=cut

sub artemis :Path('artemis') {
    my ( $self, $c ) = @_;

    push @{$c->stash->{add_js_files}}, '/static/core/js/jquery.js';
    push @{$c->stash->{add_js_files}}, '/static/core/js/jquery.dataTables.min.js';
        
    #will stash a list of genomes to "genome_list_inc" in context obj
    $self->stash_genomes_by_role($c);
    
    push @{$c->stash->{add_js_end}}, '/static/page/js/artemis_act_checks.js';
    $c->stash( active_action => '/data' );
    
    $c->stash->{template} = 'artemis.tt2';
}

=head2 artemisjnlp

=cut

sub artemisjnlp :Path('artemisjnlp'){
    my ( $self, $c ) = @_;
    
      
    # Get the param argument for the selected genome and stash it so that 
    #artemis_jnlp.tt2 can access it and render a JNLP
 
    my $file_argument = 
                join '/', (  
                           $c->config->{data}->{root}
                           
                           #This does not take into account that a user might have 
                           #more than one role! (see the "ToDo" file in the main app dir)
                         , $c->user->user_roles->search_related('role')->next->role
                         
                         , $c->config->{data}->{dir_name_of_annotation}
                         
                           #field is defined as "genome1" in the artemis.tt2 template
                         , $c->request->param('checkbox') . $c->config->{data}->{file_extension_of_annotation}
                         );
    
    # Non-alphanumeric char '#' in sanger lane ids are replaced with underscore.
    # They cause problems in JNLP files' http links arguments.
    # Make sure that the files in the data dir (.embl etc have '_' instead of '#').
    $file_argument =~ s/#/_/g;
     
    #this will prepend the web sites root URL
    $c->stash->{selected_genome} = $c->uri_for($file_argument); 
    
    $c->stash( active_action => '/data' );
        
    $c->res->content_type('application/x-java-jnlp-file'); 
   
    $c->stash->{template} = 'artemis_jnlp.tt2';
    
    $c->forward( $c->view('JNLP') );
}

=head2 act

=cut

sub act :Path('act'){
    my ( $self, $c ) = @_;
    
    push @{$c->stash->{add_js_files}}, '/static/core/js/jquery.js';
    push @{$c->stash->{add_js_files}}, '/static/core/js/jquery.dataTables.min.js';
    
    #will stash a list of genomes to "genome_list_inc" in context obj
    $self->stash_genomes_by_role($c);
    

    push @{$c->stash->{add_js_end}}, '/static/page/js/artemis_act_checks.js';
    $c->stash( active_action => '/data' );
    
    $c->stash->{template} = 'act.tt2';
}

=head2 actjnlp

=cut

sub actjnlp :Path('actjnlp'){
    my ( $self, $c ) = @_;
      
    my @genome_selection = $c->request->param('checkbox');

    my $rearranged_list = rearrange_act_arguments(
    
                             $c,
                                
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
          $c
        , $genome_selection
        , $data_root
        , $role
        , $dir_name_of_crunch
        , $crunch_file_extension
        , $embl_dir
        , $embl_file_extension
        ) = @_;
    
    my @jnlp_args;
    my $is_first_genome = 1;
    my $prev;
    foreach my $genome ( sort { $b cmp $a } @{$genome_selection} ) 
    {
        
        # Non-alphanumeric char '#' in sanger lane ids are replaced with underscore.
        # They cause problems in JNLP files' http links arguments.
        # Make sure that the files in the data dir (.embl etc have '_' instead of '#').
        $genome =~ s/#/_/g;
        
        if ($is_first_genome) {
            #this will prepend the web sites root URL
            push @jnlp_args, $c->uri_for( join '/', (  $data_root, $role, $embl_dir, $genome . $embl_file_extension) );
            $is_first_genome = 0;

        }
        else {
            #this will prepend the web sites root URL    
            push @jnlp_args, $c->uri_for( join '/', (  $data_root, $role, $dir_name_of_crunch, "$genome.$prev" . $crunch_file_extension) );
            #this will prepend the web sites root URL
            push @jnlp_args, $c->uri_for( join '/', ( $data_root, $role, $embl_dir, $genome . $embl_file_extension) );
               
        }
        $prev = $genome;
    }
    
    return \@jnlp_args;
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
    
    if ($c->user->username eq 'guest') {
        $c->stash( active_action => '/data/resources' );
        $c->stash->{template} = 'resources_thin.tt2';
    }
    else {
        $c->stash( active_action => '/data/resources' );
        $c->stash->{template} = 'resources.tt2';
    }
}

=head2 fetchfile

=cut

sub fetchfile :Path('fetchfile'){
    my ( $self, $c, $file_name ) = @_;
     
    #dont fetch if 'guest' user asks for data
    if ($c->user->username eq 'guest') {
         $c->res->redirect($c->uri_for('/notfound'));
    }
    
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

=head2 stash_genomes_by_role 

=cut

sub stash_genomes_by_role {
    
    my ($self, $c) = @_;
    my @genomes_rs = sort { $b->sanger_id cmp $a->sanger_id } 
                                       $c->user->user_roles
                                       ->search_related('role')
                                       ->search_related('genome_roles')
                                       ->search_related('genome');
    
    $c->stash->{genome_list_inc} = \@genomes_rs;
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
        # $c->log->debug('***Root::auto User not found, forwarding to /login');
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
