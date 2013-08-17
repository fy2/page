#!/usr/bin/env bash

$PAGEPERLLIB/bin/starman -I$PAGEAPPDIR/lib -I$PAGEPERLLIB/lib/perl5 $PAGEPSGIAPP --workers $PAGEWORKERS --pid $PAGEPIDFILE --port $PAGEPORT --daemonize --error-log $PAGELOGDIR/error.log --access-log $PAGELOGDIR/access.log

