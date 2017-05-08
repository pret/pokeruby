#!/bin/sh

if grep -Enr "\s+\$" src; then
    # Trailing whitespace detected
    exit 1
fi
