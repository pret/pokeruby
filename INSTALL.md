First, you must put a Pokémon Ruby 1.0 (US) ROM in the root directory of the repository and name it `baserom.gba`. It should have a SHA1 checksum of `f28b6ffc97847e94a6c21a63cacf633ee5c8df1e`. Then, follow the OS-specific instructions below.

# Linux

Install [**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM).

Make sure that there is an environment variable called DEVKITARM with the path of the directory before the "bin" directory containing "arm-none-eabi-as", "arm-none-eabi-cpp", "arm-none-eabi-ld" and "arm-none-eabi-objcopy".

Then get the compiler from https://github.com/YamaArashi/agbcc and run the following commands.

	build.sh
	install.sh PATH_OF_POKERUBY_DIRECTORY

Then in the pokeruby directory, build the tools.

	build_tools.sh

Finally, build the rom.

	make

# Windows

Install [**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM).

Then get the compiled tools from https://github.com/YamaArashi/pokeruby-tools. Copy the "tools" folder over the "tools" folder in your pokeruby directory.

You can then build pokeruby using "make" in the MSYS environment provided with devkitARM.
