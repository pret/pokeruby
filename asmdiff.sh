#!/bin/bash

OBJDUMP="$DEVKITARM/bin/arm-none-eabi-objdump -D -bbinary -marmv4t -Mforce-thumb"
OPTIONS="--start-address=$(($1)) --stop-address=$(($1 + $2))"
$OBJDUMP $OPTIONS baserom.gba > baserom.dump
$OBJDUMP $OPTIONS pokeruby.gba > pokeruby.dump
diff baserom.dump pokeruby.dump
