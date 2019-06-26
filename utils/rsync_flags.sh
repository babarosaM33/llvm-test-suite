RSYNC_FLAGS=""
RSYNC_FLAGS+=" -a"
RSYNC_FLAGS+=" --delete --delete-excluded"
# We cannot easily differentiate between intermediate build results and
# files necessary to run the benchmark, so for now we just exclude based on
# some file extensions...
RSYNC_FLAGS+=" --exclude=\"*.o\""
RSYNC_FLAGS+=" --exclude=\"*.a\""
RSYNC_FLAGS+=" --exclude=\"*.time\""
RSYNC_FLAGS+=" --exclude=\"*.cmake\""
RSYNC_FLAGS+=" --exclude=Output/"
RSYNC_FLAGS+=" --exclude=.ninja_deps"
RSYNC_FLAGS+=" --exclude=.ninja_log"
RSYNC_FLAGS+=" --exclude=build.ninja"
RSYNC_FLAGS+=" --exclude=rules.ninja"
RSYNC_FLAGS+=" --exclude=CMakeFiles/"
RSYNC_FLAGS+=" --exclude=staging/"
