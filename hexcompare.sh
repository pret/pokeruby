#!/bin/sh
# Compares baserom.gba and pokeruby.gba

# create baserom.txt if necessary
if [ ! -f baserom.txt ]; then
    hexdump -C baserom.gba > baserom.txt
fi

hexdump -C pokeruby.gba > pokeruby.txt

diff -u baserom.txt pokeruby.txt | less
