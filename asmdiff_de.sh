#!/bin/bash

OBJDUMP="$DEVKITARM/bin/arm-none-eabi-objdump -D -bbinary -marmv4t -Mforce-thumb"
OPTIONS="--start-address=$(($1)) --stop-address=$(($1 + $2))"
$OBJDUMP $OPTIONS baserom_de.gba > baserom_de.dump
$OBJDUMP $OPTIONS pokeruby_de.gba > pokeruby_de.dump
diff baserom_de.dump pokeruby_de.dump
