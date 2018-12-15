#!/bin/bash
# $1: phrase to find
# $2: phrase to replace $1
sed -i 's/\<'$1'\>/'$2'/' $(grep -lwr --include="*.s" --include="*.h" --include="*.inc" --include="*.c" --exclude-dir="tools" --exclude-dir="build" --exclude-dir="graphics" --exclude-dir=".git" $1)
