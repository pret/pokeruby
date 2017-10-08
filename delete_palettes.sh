#!/bin/bash

palfiles=$(find graphics -type f -name '*.gbapal')

for f in $palfiles
do
    base=$(echo $f | cut -f 1 -d '.')
    if [ -e "$base.png" ] && [ -e "$base.pal" ]
    then
        if tools/gbagfx/gbagfx "$base.png" "$base.new.gbapal"
        then
            if cmp --silent "$f" "$base.new.gbapal"
            then
                rm "$base.pal"
                #echo "deleted $base.pal"
            else
                echo "warning: $base.png contains a nonmatching palette"
            fi
            rm "$base.new.gbapal"
        fi
    fi
done
