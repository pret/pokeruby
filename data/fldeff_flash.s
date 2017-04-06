	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083F7FC4:: @ 83F7FC4
	.byte 1, 4, 1, 0
	.4byte sub_810CFF8
	.byte 2, 4, 1, 0
	.4byte sub_810CFF8
	.byte 3, 4, 1, 0
	.4byte sub_810CFF8
	.byte 5, 4, 1, 0
	.4byte sub_810CFF8
	.byte 6, 4, 1, 0
	.4byte sub_810CFF8
	.byte 7, 4, 1, 0
	.4byte sub_810CFF8
	.byte 8, 4, 1, 0
	.4byte sub_810CFF8
	.byte 9, 4, 1, 0
	.4byte sub_810CFF8

	.byte 4, 1, 0, 1
	.4byte sub_810CE48
	.byte 4, 2, 0, 1
	.4byte sub_810CE48
	.byte 4, 3, 0, 1
	.4byte sub_810CE48
	.byte 4, 5, 0, 1
	.4byte sub_810CE48
	.byte 4, 6, 0, 1
	.4byte sub_810CE48
	.byte 4, 7, 0, 1
	.4byte sub_810CE48
	.byte 4, 8, 0, 1
	.4byte sub_810CE48
	.byte 4, 9, 0, 1
	.4byte sub_810CE48

	.byte 0, 0, 0, 0
	.4byte NULL

	.align 2
gCaveTransitionPalette_White:: @ 83F804C
	.rept 16
	.2byte 0x7FFF
	.endr

	.align 2
gCaveTransitionPalette_Black:: @ 83F806C
	.rept 16
	.2byte 0x0000
	.endr

	.align 1
gUnknown_083F808C:: @ 83F808C
	.incbin "graphics/misc/83F808C.gbapal"

	.align 1
gUnknown_083F809C:: @ 83F809C
	.incbin "graphics/misc/83F809C.gbapal"

	.align 2
gCaveTransitionTilemap:: @ 83F80AC
	.incbin "graphics/misc/cave_transition_map.bin.lz"

	.align 2
gCaveTransitionTiles:: @ 83F828C
	.incbin "graphics/misc/cave_transition.4bpp.lz"
