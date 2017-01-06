	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
CryMeterNeedlePalette: @ 83FA65C
	.incbin "graphics/pokedex/cry_meter_needle.gbapal"

	.align 2
CryMeterNeedleTiles: @ 83FA67C
	.incbin "graphics/pokedex/cry_meter_needle.4bpp"

gUnknown_083FAE7C:: @ 83FAE7C
	.incbin "baserom.gba", 0x003fae7c, 0xa0

gUnknown_083FAF1C:: @ 83FAF1C
	.incbin "graphics/pokedex/cry_meter.gbapal"

gUnknown_083FAF3C:: @ 83FAF3C
	.incbin "graphics/pokedex/cry_meter.4bpp.lz"

	.align 1
gUnknown_083FB274:: @ 83FB274
	.2byte 0x0,0x4,0x8,0xC,0x10,0x14,0x18,0x1C,0x400,0x404,0x408,0x40C,0x410,0x414,0x418,0x41C,0x800,0x804,0x808,0x80C,0x810,0x814,0x818,0x81C,0xC00,0xC04,0xC08,0xC0C,0xC10,0xC14,0xC18,0xC1C,0x1000,0x1004,0x1008,0x100C,0x1010,0x1014,0x1018,0x101C,0x1400,0x1404,0x1408,0x140C,0x1410,0x1414,0x1418,0x141C,0x1800,0x1804,0x1808,0x180C,0x1810,0x1814,0x1818,0x181C,0x1C00,0x1C04,0x1C08,0x1C0C,0x1C10,0x1C14,0x1C18,0x1C1C,0x2000,0x2004,0x2008,0x200C,0x2010,0x2014,0x2018,0x201C
	.2byte 0x0,0x4,0x8,0xC,0x10,0x14,0x18,0x1C,0x400,0x404,0x408,0x40C,0x410,0x414,0x418,0x41C,0x800,0x804,0x808,0x80C,0x810,0x814,0x818,0x81C,0xC00,0xC04,0xC08,0xC0C,0xC10,0xC14,0xC18,0xC1C,0x1000,0x1004,0x1008,0x100C,0x1010,0x1014,0x1018,0x101C,0x1400,0x1404,0x1408,0x140C,0x1410,0x1414,0x1418,0x141C,0x1800,0x1804,0x1808,0x180C,0x1810,0x1814,0x1818,0x181C,0x1C00,0x1C04,0x1C08,0x1C0C,0x1C10,0x1C14,0x1C18,0x1C1C,0x2000,0x2004,0x2008,0x200C,0x2010,0x2014,0x2018,0x201C
	.2byte 0x1,0x5,0x9,0xD,0x11,0x15,0x19,0x1D,0x401,0x405,0x409,0x40D,0x411,0x415,0x419,0x41D,0x801,0x805,0x809,0x80D,0x811,0x815,0x819,0x81D,0xC01,0xC05,0xC09,0xC0D,0xC11,0xC15,0xC19,0xC1D,0x1001,0x1005,0x1009,0x100D,0x1011,0x1015,0x1019,0x101D,0x1401,0x1405,0x1409,0x140D,0x1411,0x1415,0x1419,0x141D,0x1801,0x1805,0x1809,0x180D,0x1811,0x1815,0x1819,0x181D,0x1C01,0x1C05,0x1C09,0x1C0D,0x1C11,0x1C15,0x1C19,0x1C1D,0x2001,0x2005,0x2009,0x200D,0x2011,0x2015,0x2019,0x201D
	.2byte 0x1,0x5,0x9,0xD,0x11,0x15,0x19,0x1D,0x401,0x405,0x409,0x40D,0x411,0x415,0x419,0x41D,0x801,0x805,0x809,0x80D,0x811,0x815,0x819,0x81D,0xC01,0xC05,0xC09,0xC0D,0xC11,0xC15,0xC19,0xC1D,0x1001,0x1005,0x1009,0x100D,0x1011,0x1015,0x1019,0x101D,0x1401,0x1405,0x1409,0x140D,0x1411,0x1415,0x1419,0x141D,0x1801,0x1805,0x1809,0x180D,0x1811,0x1815,0x1819,0x181D,0x1C01,0x1C05,0x1C09,0x1C0D,0x1C11,0x1C15,0x1C19,0x1C1D,0x2001,0x2005,0x2009,0x200D,0x2011,0x2015,0x2019,0x201D
	.2byte 0x2,0x6,0xA,0xE,0x12,0x16,0x1A,0x1E,0x402,0x406,0x40A,0x40E,0x412,0x416,0x41A,0x41E,0x802,0x806,0x80A,0x80E,0x812,0x816,0x81A,0x81E,0xC02,0xC06,0xC0A,0xC0E,0xC12,0xC16,0xC1A,0xC1E,0x1002,0x1006,0x100A,0x100E,0x1012,0x1016,0x101A,0x101E,0x1402,0x1406,0x140A,0x140E,0x1412,0x1416,0x141A,0x141E,0x1802,0x1806,0x180A,0x180E,0x1812,0x1816,0x181A,0x181E,0x1C02,0x1C06,0x1C0A,0x1C0E,0x1C12,0x1C16,0x1C1A,0x1C1E,0x2002,0x2006,0x200A,0x200E,0x2012,0x2016,0x201A,0x201E
	.2byte 0x2,0x6,0xA,0xE,0x12,0x16,0x1A,0x1E,0x402,0x406,0x40A,0x40E,0x412,0x416,0x41A,0x41E,0x802,0x806,0x80A,0x80E,0x812,0x816,0x81A,0x81E,0xC02,0xC06,0xC0A,0xC0E,0xC12,0xC16,0xC1A,0xC1E,0x1002,0x1006,0x100A,0x100E,0x1012,0x1016,0x101A,0x101E,0x1402,0x1406,0x140A,0x140E,0x1412,0x1416,0x141A,0x141E,0x1802,0x1806,0x180A,0x180E,0x1812,0x1816,0x181A,0x181E,0x1C02,0x1C06,0x1C0A,0x1C0E,0x1C12,0x1C16,0x1C1A,0x1C1E,0x2002,0x2006,0x200A,0x200E,0x2012,0x2016,0x201A,0x201E
	.2byte 0x3,0x7,0xB,0xF,0x13,0x17,0x1B,0x1F,0x403,0x407,0x40B,0x40F,0x413,0x417,0x41B,0x41F,0x803,0x807,0x80B,0x80F,0x813,0x817,0x81B,0x81F,0xC03,0xC07,0xC0B,0xC0F,0xC13,0xC17,0xC1B,0xC1F,0x1003,0x1007,0x100B,0x100F,0x1013,0x1017,0x101B,0x101F,0x1403,0x1407,0x140B,0x140F,0x1413,0x1417,0x141B,0x141F,0x1803,0x1807,0x180B,0x180F,0x1813,0x1817,0x181B,0x181F,0x1C03,0x1C07,0x1C0B,0x1C0F,0x1C13,0x1C17,0x1C1B,0x1C1F,0x2003,0x2007,0x200B,0x200F,0x2013,0x2017,0x201B,0x201F
	.2byte 0x3,0x7,0xB,0xF,0x13,0x17,0x1B,0x1F,0x403,0x407,0x40B,0x40F,0x413,0x417,0x41B,0x41F,0x803,0x807,0x80B,0x80F,0x813,0x817,0x81B,0x81F,0xC03,0xC07,0xC0B,0xC0F,0xC13,0xC17,0xC1B,0xC1F,0x1003,0x1007,0x100B,0x100F,0x1013,0x1017,0x101B,0x101F,0x1403,0x1407,0x140B,0x140F,0x1413,0x1417,0x141B,0x141F,0x1803,0x1807,0x180B,0x180F,0x1813,0x1817,0x181B,0x181F,0x1C03,0x1C07,0x1C0B,0x1C0F,0x1C13,0x1C17,0x1C1B,0x1C1F,0x2003,0x2007,0x200B,0x200F,0x2013,0x2017,0x201B,0x201F

	.align 2
	.4byte 0x201C000

gUnknown_083FB6F8:: @ 83FB6F8
	.incbin "baserom.gba", 0x003fb6f8, 0x20

gUnknown_083FB718:: @ 83FB718
	.incbin "baserom.gba", 0x003fb718, 0x20

gUnknown_083FB738:: @ 83FB738
	.byte 0xF0, 0x0F

gUnknown_083FB73A:: @ 83FB73A
	.incbin "baserom.gba", 0x003fb73a, 0x26

	.align 2
gSpriteAnim_83FB760:: @ 83FB760
	obj_image_anim_frame 0, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83FB768:: @ 83FB768
	.4byte gSpriteAnim_83FB760

	.align 2
gOamData_83FB76C:: @ 83FB76C
	.2byte 0x01A0
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteTemplate_83FB774:: @ 83FB774
	spr_template 8192, 8192, gOamData_83FB76C, gSpriteAnimTable_83FB768, NULL, gDummySpriteAffineAnimTable, sub_811A534

	.align 2
gCryMeterNeedleSpriteSheets:: @ 83FB78C
	obj_tiles CryMeterNeedleTiles, 0x800, 8192
	null_obj_tiles

	.align 2
gCryMeterNeedleSpritePalettes:: @ 83FB79C
	obj_pal CryMeterNeedlePalette, 8192
	null_obj_pal
