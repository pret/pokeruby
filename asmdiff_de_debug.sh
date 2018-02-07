#!/bin/bash

OBJDUMP="$DEVKITARM/bin/arm-none-eabi-objdump -D -bbinary -marmv4t -Mforce-thumb"
OPTIONS="--start-address=$(($1)) --stop-address=$(($1 + $2))"
$OBJDUMP $OPTIONS baserom_de_debug.gba > baserom_de_debug.dump
$OBJDUMP $OPTIONS pokeruby_de_debug.gba > pokeruby_de_debug.dump
diff baserom_de_debug.dump pokeruby_de_debug.dump
