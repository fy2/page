package PageApp;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
# -Debug: activates the debug mode for very useful log messages
# ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory
# StackTrace:     You will want to disable StackTrace before you put your application
#                 into production, but it can be helpful during development

use Catalyst qw/
    ConfigLoader
    Static::Simple
    
    Authentication
    Authorization::Roles

    Session
    Session::Store::File
    Session::State::Cookie
/;

extends 'Catalyst';

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in pageapp.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'PageApp',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header
);

# Add root/src to the path, this is where we store the template 
# toolkit *.tt2 files
__PACKAGE__->config(
    'View::HTML' => {
        INCLUDE_PATH => [
            __PACKAGE__->path_to('root', 'src'),
        ],
    },
);

#ignore static serving of any file with the following extensions
#if they are in somewhere in the 'root' app directory
__PACKAGE__->config(
    'Plugin::Statis::Simple' => {
        ignore_extensions => [ qw/pl sql txt db/ ],
        ignore_dirs => [ qw/database/ ],
    }
);

# Configure SimpleDB Authentication
__PACKAGE__->config(
    'Plugin::Authentication' => {
        default => {
            class         => 'SimpleDB',
            user_model    => 'DB::User',
            password_type => 'self_check',
        },
    },
);

# Set the default View. HTML matches the name of the TT view 
# that we created for this PageApp (HTML.pm)
__PACKAGE__->config(default_view => 'HTML');

# Start the application
__PACKAGE__->setup();


=head1 NAME

PageApp - Catalyst based application

=head1 SYNOPSIS

    script/pageapp_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<PageApp::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Feyruz Yalcin

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
