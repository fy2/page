#!/usr/bin/env bash

### BEGIN INIT INFO
# Provides:          www-dev_daemon
# Required-Start:    
# Required-Stop:     
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: This is the page www-dev daemon
# Description:       This is the page www-dev daemon
### END INIT INFO

# Using the lsb functions to perform the operations.
. /lib/lsb/init-functions

function where_am_i_run_from()
{
  local DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  if [[ $DIR =~ www-dev ]]
  then
    echo "www-dev"
  elif [[ $DIR =~ www-live ]]
  then
    echo "www-live"
  else
   echo "This script was supposed to be in '/www/www-(dev|live)/utilities/', but apparently it is not. Thus, I cannot figure out if I am www-dev or www-live!"
   exit 1
  fi
}

export PAGE_DEPLOY=$(where_am_i_run_from) #return 'www-dev' or 'www-live'
export NAME="page_daemon_$PAGE_DEPLOY"
export PAGE_APPNAME="PageApp"
export PAGE_UTILITIES="/www/$PAGE_DEPLOY/utilities/"
export PAGE_APPDIR="/www/$PAGE_DEPLOY"
export STARMAN="$PAGE_UTILITIES/start_starman.sh"
export PAGE_PIDFILE="/www/tmp/$PAGE_DEPLOY/logs/pageapp.pid" # pid file for the daemon
export PAGE_LOGDIR="/www/tmp/$PAGE_DEPLOY/logs"
export PAGE_PSGIAPP="$PAGE_APPDIR/pageapp.psgi"
export PAGE_PERLLIB="/www/perllib"
export PAGE_WORKERS=5
export PAGE_PORT=8000


# If the daemon is not there, then exit.
test -x $STARMAN || exit 5

if [ ! -d $PAGE_APPDIR ]; then
    echo "$PAGE_APPDIR does not exist"
    exit 1
fi

check_running() {

  [ -s $PAGE_PIDFILE ] && kill -0 $(cat $PAGE_PIDFILE) >/dev/null 2>&1
}

check_compile() {

  if ( cd $PAGE_APPDIR ; perl -Ilib -M$PAGE_APPNAME -ce1 ) ; then
    return 1
  else
    return 0
  fi
}

_start() {

  /sbin/start-stop-daemon --start --pidfile $PAGE_PIDFILE \
  --chdir $PAGE_APPDIR --startas $STARMAN --user fy2 -v

  echo ""
  echo "Waiting for $PAGE_APPNAME to start..."

  for i in 1 2 3 4 ; do
    sleep 1
    if check_running ; then
      echo "$PAGE_APPNAME is now starting up"
      return 0
    fi
  done

  # sometimes it takes two tries.
  echo "Failed. Trying again..."
  /sbin/start-stop-daemon --start --pidfile $PAGE_PIDFILE \
  --chdir $PAGE_APPDIR --startas $STARMAN --user fy2 -v

  for i in 1 2 3 4 ; do
    sleep 1
    if check_running ; then
      echo "$PAGE_APPNAME is now starting up"
      return 0
    fi
  done

  return 1
}

start() {
  log_daemon_msg "Starting $PAGE_APPNAME" $STARMAN
  echo ""

  if check_running; then
    log_daemon_msg "Already running, won't do anything."
    log_end_msg 0
    exit 0
  fi

  if check_compile ; then
    log_failure_msg "Error detected; not (re-)starting."
    log_end_msg 1
  exit 1
  fi

  rm -f $PAGE_PIDFILE 2>/dev/null

  _start
  log_end_msg $?
  return $?
}

stop() {
    log_daemon_msg "Stopping $PAGE_APPNAME" $STARMAN
    echo ""

    /sbin/start-stop-daemon --stop --oknodo --pidfile $PAGE_PIDFILE
    sleep 3
    log_end_msg $?
    return $?
}

restart() {
    log_daemon_msg "Restarting $PAGE_APPNAME" $STARMAN
    echo ""

    if check_compile ; then
        log_failure_msg "Error detected; not restarting."
        log_end_msg 1
        exit 1
    fi

    /sbin/start-stop-daemon --stop --oknodo --pidfile $PAGE_PIDFILE
    _start
    log_end_msg $?
    return $?
}

# See how we were called.
case "$1" in
    start)
        start
    ;;
    stop)
        stop
    ;;
    restart|force-reload)
        restart
    ;;
    *)
        echo $"Usage: $0 {start|stop|restart}"
        exit 1
esac

exit $?

