#!/bin/sh
# Compares baserom-sapphire.gba and pokesapphire.gba

# create baserom.txt if necessary
if [ ! -f baserom-sapphire.txt ]; then
	hexdump -C baserom-sapphire.gba > baserom-sapphire.txt
fi

hexdump -C pokesapphire.gba > pokesapphire.txt

diff -u baserom-sapphire.txt pokesapphire.txt | less
