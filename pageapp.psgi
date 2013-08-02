use strict;
use warnings;
use PageApp;
use Plack::Builder;

my $app = PageApp->apply_default_middlewares(PageApp->psgi_app);

builder {
    # replace 172.17.200.84 with our public IP
    enable_if { $_[0]->{REMOTE_ADDR} eq '127.0.0.1'
                    || $_[0]->{REMOTE_ADDR} eq '172.17.200.84'
                    || $_[0]->{REMOTE_ADDR} eq '172.17.200.196'  }
    "Plack::Middleware::ReverseProxy";

    return $app;
};
