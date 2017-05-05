	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gBitTable:: @ 820872C
	.4byte 0x00000001
	.4byte 0x00000002
	.4byte 0x00000004
	.4byte 0x00000008
	.4byte 0x00000010
	.4byte 0x00000020
	.4byte 0x00000040
	.4byte 0x00000080
	.4byte 0x00000100
	.4byte 0x00000200
	.4byte 0x00000400
	.4byte 0x00000800
	.4byte 0x00001000
	.4byte 0x00002000
	.4byte 0x00004000
	.4byte 0x00008000
	.4byte 0x00010000
	.4byte 0x00020000
	.4byte 0x00040000
	.4byte 0x00080000
	.4byte 0x00100000
	.4byte 0x00200000
	.4byte 0x00400000
	.4byte 0x00800000
	.4byte 0x01000000
	.4byte 0x02000000
	.4byte 0x04000000
	.4byte 0x08000000
	.4byte 0x10000000
	.4byte 0x20000000
	.4byte 0x40000000
	.4byte 0x80000000

	.align 2
gInvisibleSpriteTemplate:: @ 82087AC
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteDimensions:: @ 82087C4
	@ square
	.byte 1, 1
	.byte 2, 2
	.byte 4, 4
	.byte 8, 8

	@ horizontal rectangle
	.byte 2, 1
	.byte 4, 1
	.byte 4, 2
	.byte 8, 4

	@ vertical rectangle
	.byte 1, 2
	.byte 1, 4
	.byte 2, 4
	.byte 4, 8

@ 82087DC
	.include "data/crc16_table.inc"

	.align 2
gMiscBlank_Gfx:: @ 82089DC
	.incbin "graphics/interface/blank.4bpp"
