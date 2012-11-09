package PageApp::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

PageApp::Controller::Root - Root Controller for PageApp

=head1 DESCRIPTION

Demo. web application for the Gates' foundations PAGe project.

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    #we stash a variable called "active action", which is inspected
    #by our wrapper template toolkit "wrapper.tt2". Template toolkit
    #looks which menu item in our pageapp.yaml has the same value as 
    #our "active_action", and when found, it highlights the title of 
    #that menu in our website.
    $c->stash( active_action => '/' );
    
    #index.tt2 will be wrapped automatically by "wrapper.tt2" file
    #because we set this up PageApp::View::HTML.
    $c->stash->{template} = 'index.tt2';
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Feyruz Yalcin

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
