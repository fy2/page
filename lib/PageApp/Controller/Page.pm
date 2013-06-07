package PageApp::Controller::Page;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

PageApp::Controller::Page - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched PageApp::Controller::Page in Page.');
}

=head2 consortium

=cut

sub consortium :Path('consortium') {
    my ( $self, $c ) = @_;
    
    $c->stash( active_action => '/page/consortium' );
    
    $c->stash->{template} = 'consortium.tt2';
}

=head2 contact

=cut

sub contact :Path('contact') {
    my ( $self, $c ) = @_;
    
    $c->stash( active_action => '/page/contact' );
    
    $c->stash->{template} = 'contact.tt2';
}

=head1 AUTHOR

Feyruz Yalcin

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
