#!/usr/bin/env bash

#echo "cd $PAGE_APPDIR ; $PAGE_PERLLIB/bin/starman -I$PAGE_APPDIR/lib -I$PAGE_PERLLIB/lib/perl5 $PAGE_PSGIAPP --workers $PAGE_WORKERS --pid $PAGE_PIDFILE --port $PAGE_PORT --daemonize --error-log $PAGE_LOGDIR/error.log --access-log $PAGE_LOGDIR/access.log"
$PAGE_PERLLIB/bin/starman -I$PAGE_APPDIR/lib -I$PAGE_PERLLIB/lib/perl5 $PAGE_PSGIAPP --workers $PAGE_WORKERS --pid $PAGE_PIDFILE --port $PAGE_PORT --daemonize --error-log $PAGE_LOGDIR/error.log --access-log $PAGE_LOGDIR/access.log

