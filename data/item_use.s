	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_083D613C:: @ 83D613C
	.incbin "baserom.gba", 0x003d613c, 0x60

Unknown_83D619C::
	.incbin "baserom.gba", 0x003d619c, 0x20
Unknown_83D61BC::
	.incbin "baserom.gba", 0x003d61bc, 0x20

	.align 2
gUnknown_083D61DC:: @ 83D61DC
	.4byte Unknown_83D619C
	.4byte Unknown_83D61BC

	.align 2
gExitToOverworldFuncList:: @ 83D61E4
	.4byte sub_808B020
	.4byte c2_exit_to_overworld_2_switch
	.4byte sub_810B96C

gItemFinderDirections:: @ 83D61F0
	.byte DIR_NORTH, DIR_EAST, DIR_SOUTH, DIR_WEST

	.align 2
gUnknown_083D61F4:: @ 83D61F4
	.4byte sub_80C9FC0
	.4byte CleanUpItemMenuMessage
