#!/usr/bin/env bash

#All variables are set in "pageapp_init.sh" file, in this directory.
$PAGE_PERLLIB/bin/starman --preload-app -I$PAGE_APPDIR/lib -I$PAGE_PERLLIB/lib/perl5 $PAGE_PSGIAPP \
 --workers $PAGE_WORKERS --pid $PAGE_PIDFILE --port $PAGE_PORT --daemonize \
 --error-log $PAGE_LOGDIR/error.log --access-log $PAGE_LOGDIR/access.log
