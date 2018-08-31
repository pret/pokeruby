#!/bin/sh

# check for _setjmp, on BSD/macOS and Bionic, it is faster.
$* -Wall -Werror -c -o /dev/null -x c - >/dev/null 2>/dev/null <<EOF || echo "-D_setjmp=setjmp"
#define _XOPEN_SOURCE_EXTENDED
#include <setjmp.h>
int main() {
    jmp_buf buf;
    if (_setjmp(buf))
        return 0;
    return 1;
}
EOF
