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
    
    $c->stash( active_action => '/data' );
    
    $c->stash->{template} = 'artemis.tt2';
}

=head2 act

=cut

sub act :Path('act'){
    my ( $self, $c ) = @_;
    
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

=head1 AUTHOR

Feyruz Yalcin

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
