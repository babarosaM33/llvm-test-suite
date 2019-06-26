#!/bin/bash
# Sync a build directory to remote device for running.
set -eu
DEVICE="$1"
BUILDDIR="$2"

. $(dirname $0)/rsync_flags.sh

case $BUILDDIR in
    /*) ;;
    *)
        echo 1>&2 "Builddir path must be absolute!"
        exit 1
        ;;
esac

set -x
ssh $DEVICE mkdir -p "$BUILDDIR"
eval rsync $RSYNC_FLAGS $BUILDDIR/ $DEVICE:$BUILDDIR/
