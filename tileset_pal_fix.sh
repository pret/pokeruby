#!/bin/bash

for dir in maps/tilesets/primary/*/palettes/ maps/tilesets/secondary/*/palettes/ maps/tilesets/secondary/secret_base/*/palettes/ ;
do
	echo "$dir"
	cat $dir/00.gbapal $dir/01.gbapal $dir/02.gbapal $dir/03.gbapal $dir/04.gbapal $dir/05.gbapal $dir/06.gbapal $dir/07.gbapal $dir/08.gbapal $dir/09.gbapal $dir/10.gbapal $dir/11.gbapal $dir/12.gbapal $dir/13.gbapal $dir/14.gbapal $dir/15.gbapal > $dir/../tiles.gbapal
	tools/gbagfx/gbagfx.exe $dir/../tiles.gbapal $dir/../tiles.pal
done
