#!/bin/sh
echo "Checking Ruby 1.0"
make tidy >/dev/null
make ruby >/dev/null 2>/dev/null
sha1sum -c ruby.sha1

echo "Checking Ruby 1.1"
make tidy >/dev/null
make ruby_rev1 >/dev/null 2>/dev/null
sha1sum -c ruby_rev1.sha1

echo "Checking Ruby 1.2"
make tidy >/dev/null
make ruby_rev2 >/dev/null 2>/dev/null
sha1sum -c ruby_rev2.sha1

echo "Checking Sapphire 1.0"
make tidy >/dev/null
make sapphire >/dev/null 2>/dev/null
sha1sum -c sapphire.sha1

echo "Checking Sapphire 1.1"
make tidy >/dev/null
make sapphire_rev1 >/dev/null 2>/dev/null
sha1sum -c sapphire_rev1.sha1

echo "Checking Sapphire 1.2"
make tidy >/dev/null
make sapphire_rev2 >/dev/null 2>/dev/null
sha1sum -c sapphire_rev2.sha1
