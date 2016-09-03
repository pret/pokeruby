#!/bin/sh
# Compares baserom-ruby.gba and pokeruby.gba

# create baserom.txt if necessary
if [ ! -f baserom-ruby.txt ]; then
	hexdump -C baserom-ruby.gba > baserom-ruby.txt
fi

hexdump -C pokeruby.gba > pokeruby.txt

diff -u baserom-ruby.txt pokeruby.txt | less
