package PageApp::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    # Change default TT extension
    TEMPLATE_EXTENSION => '.tt2',
    render_die => 1,
    INCLUDE_PATH => [
        PageApp->path_to('root', 'src'),
    ],
    # Set to 1 for detailed timer stats in your HTML as comments
    TIMER => 0,

    # This is your wrapper template located in the 'root/src'
    WRAPPER => 'wrapper.tt2',

);

=head1 NAME

PageApp::View::HTML - TT View for PageApp

=head1 DESCRIPTION

TT View for PageApp.

=head1 SEE ALSO

L<PageApp>

=head1 AUTHOR

Feyruz Yalcin

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
