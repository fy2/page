package PageApp::View::JNLP;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt2',
    render_die => 1,
    INCLUDE_PATH => [
        PageApp->path_to('root', 'src'),
    ],
    TIMER => 0,
);

=head1 NAME

PageApp::View::JNLP - TT View for PageApp

=head1 DESCRIPTION

TT View for PageApp. This will be used to render .JNLP files

=head1 SEE ALSO

L<PageApp>

=head1 AUTHOR

Feyruz Yalcin

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
