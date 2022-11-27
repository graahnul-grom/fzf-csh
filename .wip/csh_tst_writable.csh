#!/usr/bin/env csh

# NOTE: "File inquiry operators" -d, -w, etc.,
#       see man csh(1) tests file permissions ONLY
#       (no test for e.g. if file is ACTUALLY writable)

set DDD = $1
echo ".. DDD: [$DDD]"

# NOTE:  -d <=> `filetest -d`:
#
test -d $DDD
if ( $? == 0 ) then
# if ( `test -d $DDD` ) then     # FAIL
# if ( `filetest -d $DDD` ) then # OK
# if ( -d $DDD ) then            # OK
    echo ".. d"
else
    echo ".. \!d" # WARNING: '!' expands to smth. in history
endif

if ( -w "$DDD" ) then
    echo ".. w"
else
    echo ".. \!w"
endif

if ( -dw $DDD ) then
    echo ".. dw"
else
    echo ".. \!dw"
endif

unset DDD

