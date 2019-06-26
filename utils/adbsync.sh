#!/bin/bash -eux

BUILDDIR="$1"

. $(dirname $0)/rsync_flags.sh

rsync $RSYNC_FLAGS --copy-links $BUILDDIR/ $BUILDDIR/staging/
adb shell mkdir -p /data/local/tmp/llvm-test-suite
adb push --sync $BUILDDIR/staging /data/local/tmp/llvm-test-suite/
