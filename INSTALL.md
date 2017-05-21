# Linux

Install [**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM).

Make sure that there is an environment variable called DEVKITARM with the path of the directory before the "bin" directory containing "arm-none-eabi-as", "arm-none-eabi-cpp", "arm-none-eabi-ld" and "arm-none-eabi-objcopy".

Then get the compiler from https://github.com/pret/agbcc and run the following commands.

	build.sh
	install.sh PATH_OF_POKERUBY_DIRECTORY

Then in the pokeruby directory, build the tools.

	build_tools.sh

Finally, build the rom.

	make

# Windows

Install [**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM).

Then get the compiled tools from https://github.com/ProjectRevoTPP/pokeruby-tools. Copy the `tools/` folder over the `tools/` folder in your pokeruby directory.

You can then build pokeruby using `make` in the MSYS environment provided with devkitARM.

# Compiling Sapphire and later revisions

When you simply enter `make` and don't specify a target, then Pokémon Ruby 1.0 will be built. However, Sapphire can also be built, along with revisions 1 and 2 of both Ruby and Sapphire. Here is a listing of each ROM that can be made, along with the command to make the ROM.

Pokémon Ruby 1.0

	make ruby

Pokémon Ruby 1.1

	make ruby_rev1

Pokémon Ruby 1.2

	make ruby_rev2

Pokémon Sapphire 1.0

	make sapphire

Pokémon Sapphire 1.1

	make sapphire_rev1

Pokémon Sapphire 1.2

	make sapphire_rev2
