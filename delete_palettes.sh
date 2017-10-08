#!/bin/bash

palfiles=$(find graphics -type f -name '*.gbapal')

for f in $palfiles
do
    base=$(echo $f | cut -f 1 -d '.')
    if [ -e "$base.png" ]
    then
        tools/gbagfx/gbagfx "$base.png" "$base.new.gbapal"
        cmp "$f" "$base.new.gbapal"
        if [ $? ]
        then
            echo "warning: $base.png contains a nonmatching palette"
        else
            rm "$base.pal"
        fi
        rm "$base.new.gbapal"
    fi
done
