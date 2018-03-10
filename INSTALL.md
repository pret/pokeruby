# Linux

Install [**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM).

Make sure that there is an environment variable called DEVKITARM with the path of the directory before the "bin" directory containing "arm-none-eabi-as", "arm-none-eabi-cpp", "arm-none-eabi-ld" and "arm-none-eabi-objcopy".

Then run the following commands.

	git clone https://github.com/pret/pokeruby
	git clone https://github.com/pret/agbcc

	cd agbcc
	./build.sh
	./install.sh ../pokeruby

	cd ../pokeruby

To build **pokeruby.gba**:

	make -j4


# Mac

In **Terminal**, run the following command:

	xcode-select --install

Then follow the Linux instructions.


# Windows

Install [**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM) to the default directory (C:/devkitpro).

Then download [**Cygwin**](http://cygwin.com/install.html): **setup-x86_64.exe** for 64-bit Windows, **setup-x86.exe** for 32-bit.

Run the Cygwin setup and leave the default settings. At "Select Packages", set the view to "Full" and choose to install the following:

- `make`
- `git`
- `gcc-core`
- `gcc-g++`
- `libpng-dev`

In the **Cygwin terminal**, enter these commands:

	export DEVKITARM=/cygdrive/c/devkitpro/devkitARM
	echo export DEVKITARM=/cygdrive/c/devkitpro/devkitARM >> ~/.bashrc

	git clone https://github.com/pret/pokeruby
	git clone https://github.com/pret/agbcc

	cd agbcc
	./build.sh
	./install.sh ../pokeruby

	cd ../pokeruby

To build **pokeruby.gba**:

	make -j4


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


# Faster builds

After the first build, subsequent builds are faster. You can further speed up the build:

## Parallel build

This significantly speeds up the build on modern machines.

By default `make` only runs a single thread. You can tell `make` to run on multiple threads with `make -j`. See the manfile for usage (`man make`).

The optimal value for `-j` is the number of logical cores on your machine. You can run `nproc` to see the exact number.

	$ nproc
	8

If you have 8 cores, run:

	make -j8

`-j` on its own will spawn a new thread for each job. A clean build will have thousands of jobs, which will be slower than not using -j at all.

## Disable the dependency scanning

If you've only changed `.c` or `.s` files, you can turn off the dependency scanning temporarily. Changes to any other files will be ignored, and the build will either fail or not reflect those changes.

	make NODEP=1
