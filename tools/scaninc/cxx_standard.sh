#!/bin/sh

CXX="$1"
$CXX -x c++-cpp-output - -fsyntax-only -std=gnu++1z -nostdinc -ffreestanding  <<EOF 2>/dev/null >/dev/null
int main() {
    return 0;
}
EOF
STATUS="$?"
if [ "$STATUS" -eq "0" ]; then
    printf "%s" "-std=gnu++1z"
else
    printf "%s" "-std=gnu++11"
fi
