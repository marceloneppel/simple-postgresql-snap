#!/bin/bash

# For security measures, daemons should not be run as sudo. Execute patroni as the non-sudo user: snap_daemon.
export LOCPATH="${SNAP}"/usr/lib/locale
$SNAP/usr/bin/setpriv --clear-groups --reuid snap_daemon \
  --regid snap_daemon -- $SNAP/usr/lib/postgresql/14/bin/postgres -D $SNAP_COMMON/var/lib/postgresql -c unix_socket_directories=$SNAP_COMMON/var/run/postgresql "$@"

