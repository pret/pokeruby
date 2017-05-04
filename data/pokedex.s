	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_0839F67C:: @ 839F67C
	.incbin "graphics/pokedex/search.gbapal"

	.align 2
gUnknown_0839F73C:: @ 839F73C
	.incbin "graphics/pokedex/national.gbapal"

	.space 0xA4

	.align 2
gUnknown_0839F8A0:: @ 839F8A0
	.incbin "graphics/pokedex/pokedex_cry_layout.bin.lz"

	.align 2
gUnknown_0839F988:: @ 839F988
	.incbin "graphics/pokedex/pokedex_size_layout.bin.lz"

gUnknown_0839FA7C:: @ 839FA7C
	.incbin "graphics/pokedex/noball.4bpp.lz"

@ 839FAC4
	.include "data/pokedex_orders.inc"

	.align 2
gOamData_83A0404:: @ 83A0404
	.2byte 0x00A0
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gOamData_83A040C:: @ 83A040C
	.2byte 0x40A0
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gOamData_83A0414:: @ 83A0414
	.2byte 0x40A0
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gOamData_83A041C:: @ 83A041C
	.2byte 0x08A0
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gOamData_83A0424:: @ 83A0424
	.2byte 0x40A0
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gOamData_83A042C:: @ 83A042C
	.2byte 0x80A0
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gSpriteAnim_83A0434:: @ 83A0434
	obj_image_anim_frame 3, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A043C:: @ 83A043C
	obj_image_anim_frame 1, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A0444:: @ 83A0444
	obj_image_anim_frame 16, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A044C:: @ 83A044C
	obj_image_anim_frame 32, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A0454:: @ 83A0454
	obj_image_anim_frame 64, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A045C:: @ 83A045C
	obj_image_anim_frame 96, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A0464:: @ 83A0464
	obj_image_anim_frame 128, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A046C:: @ 83A046C
	obj_image_anim_frame 160, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A0474:: @ 83A0474
	obj_image_anim_frame 192, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A047C:: @ 83A047C
	obj_image_anim_frame 224, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A0484:: @ 83A0484
	obj_image_anim_frame 226, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A048C:: @ 83A048C
	obj_image_anim_frame 228, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A0494:: @ 83A0494
	obj_image_anim_frame 230, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A049C:: @ 83A049C
	obj_image_anim_frame 232, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A04A4:: @ 83A04A4
	obj_image_anim_frame 234, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A04AC:: @ 83A04AC
	obj_image_anim_frame 236, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A04B4:: @ 83A04B4
	obj_image_anim_frame 238, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A04BC:: @ 83A04BC
	obj_image_anim_frame 240, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A04C4:: @ 83A04C4
	obj_image_anim_frame 242, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83A04CC:: @ 83A04CC
	obj_image_anim_frame 4, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83A04D4:: @ 83A04D4
	.4byte gSpriteAnim_83A0434

	.align 2
gSpriteAnimTable_83A04D8:: @ 83A04D8
	.4byte gSpriteAnim_83A043C

	.align 2
gSpriteAnimTable_83A04DC:: @ 83A04DC
	.4byte gSpriteAnim_83A0444

	.align 2
gSpriteAnimTable_83A04E0:: @ 83A04E0
	.4byte gSpriteAnim_83A044C
	.4byte gSpriteAnim_83A0454
	.4byte gSpriteAnim_83A045C
	.4byte gSpriteAnim_83A0464

	.align 2
gSpriteAnimTable_83A04F0:: @ 83A04F0
	.4byte gSpriteAnim_83A046C
	.4byte gSpriteAnim_83A0474

	.align 2
gSpriteAnimTable_83A04F8:: @ 83A04F8
	.4byte gSpriteAnim_83A047C
	.4byte gSpriteAnim_83A0484
	.4byte gSpriteAnim_83A048C
	.4byte gSpriteAnim_83A0494
	.4byte gSpriteAnim_83A049C
	.4byte gSpriteAnim_83A04A4
	.4byte gSpriteAnim_83A04AC
	.4byte gSpriteAnim_83A04B4
	.4byte gSpriteAnim_83A04BC
	.4byte gSpriteAnim_83A04C4

	.align 2
gSpriteAnimTable_83A0520:: @ 83A0520
	.4byte gSpriteAnim_83A04CC

	.align 2
gSpriteTemplate_83A0524:: @ 83A0524
	spr_template 4096, 4096, gOamData_83A0404, gSpriteAnimTable_83A04D4, NULL, gDummySpriteAffineAnimTable, sub_808EF38

	.align 2
gSpriteTemplate_83A053C:: @ 83A053C
	spr_template 4096, 4096, gOamData_83A040C, gSpriteAnimTable_83A04D8, NULL, gDummySpriteAffineAnimTable, sub_808EF8C

	.align 2
gSpriteTemplate_83A0554:: @ 83A0554
	spr_template 4096, 4096, gOamData_83A0414, gSpriteAnimTable_83A04E0, NULL, gDummySpriteAffineAnimTable, sub_808F08C

	.align 2
gSpriteTemplate_83A056C:: @ 83A056C
	spr_template 4096, 4096, gOamData_83A041C, gSpriteAnimTable_83A04DC, NULL, gDummySpriteAffineAnimTable, sub_808F0B4

	.align 2
gSpriteTemplate_83A0584:: @ 83A0584
	spr_template 4096, 4096, gOamData_83A0424, gSpriteAnimTable_83A04F0, NULL, gDummySpriteAffineAnimTable, sub_808ED94

	.align 2
gSpriteTemplate_83A059C:: @ 83A059C
	spr_template 4096, 4096, gOamData_83A042C, gSpriteAnimTable_83A04F8, NULL, gDummySpriteAffineAnimTable, sub_808ED94

	.align 2
gSpriteTemplate_83A05B4:: @ 83A05B4
	spr_template 4096, 4096, gOamData_83A042C, gSpriteAnimTable_83A0520, NULL, gDummySpriteAffineAnimTable, sub_808F168

	.align 2
gUnknown_083A05CC:: @ 83A05CC
	obj_tiles gPokedexMenu2_Gfx, 0x1F00, 0x1000
	null_obj_tiles

	.align 2
gUnknown_083A05DC:: @ 83A05DC
	obj_pal gPokedexMenu_Pal, 0x1000
	null_obj_pal

gUnknown_083A05EC:: @ 83A05EC
	.byte 2, 4, 8, 16, 32

gUnknown_083A05F1:: @ 83A05F1
	.byte 16, 8, 4, 2, 1

	.align 2
gUnknown_083A05F8:: @ 83A05F8
	.string "$"

@ 83A05F9
	.include "data/pokedex_entries.inc"

gUnknown_083B4EC4:: @ 83B4EC4
	.space 32

@ 83B4EE4
	.include "data/graphics/pokemon/footprint_table.inc"

gUnknown_083B5558:: @ 83B5558
	.string "{CLEAR_TO 0}$"

	.incbin "graphics/unknown/unknown_3B555C.bin"

	.align 2
gOamData_83B557C:: @ 83B557C
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gUnknown_083B5584:: @ 83B5584
	.4byte 0x02008000
	.4byte 0x0200c000
	.4byte 0x02010000
	.4byte 0x02014000

	.align 2
gSpriteImageTable_83B5594:: @ 83B5594
	obj_frame_tiles 0x02008000, 0x800
	obj_frame_tiles 0x02008800, 0x800
	obj_frame_tiles 0x02009000, 0x800
	obj_frame_tiles 0x02009800, 0x800
	obj_frame_tiles 0x0200A000, 0x800
	obj_frame_tiles 0x0200A800, 0x800
	obj_frame_tiles 0x0200B000, 0x800
	obj_frame_tiles 0x0200B800, 0x800
	obj_frame_tiles 0x0200C000, 0x800
	obj_frame_tiles 0x0200C800, 0x800
	obj_frame_tiles 0x0200D000, 0x800
	obj_frame_tiles 0x0200D800, 0x800
	obj_frame_tiles 0x0200E000, 0x800
	obj_frame_tiles 0x0200E800, 0x800
	obj_frame_tiles 0x0200F000, 0x800
	obj_frame_tiles 0x0200F800, 0x800

	.align 2
gSpriteImageTable_83B5614:: @ 83B5614
	obj_frame_tiles 0x0200C000, 0x800
	obj_frame_tiles 0x0200C800, 0x800
	obj_frame_tiles 0x0200D000, 0x800
	obj_frame_tiles 0x0200D800, 0x800
	obj_frame_tiles 0x0200E000, 0x800
	obj_frame_tiles 0x0200E800, 0x800
	obj_frame_tiles 0x0200F000, 0x800
	obj_frame_tiles 0x0200F800, 0x800
	obj_frame_tiles 0x02010000, 0x800
	obj_frame_tiles 0x02010800, 0x800
	obj_frame_tiles 0x02011000, 0x800
	obj_frame_tiles 0x02011800, 0x800
	obj_frame_tiles 0x02012000, 0x800
	obj_frame_tiles 0x02012800, 0x800
	obj_frame_tiles 0x02013000, 0x800
	obj_frame_tiles 0x02013800, 0x800

	.align 2
gSpriteImageTable_83B5694:: @ 83B5694
	obj_frame_tiles 0x02010000, 0x800
	obj_frame_tiles 0x02010800, 0x800
	obj_frame_tiles 0x02011000, 0x800
	obj_frame_tiles 0x02011800, 0x800
	obj_frame_tiles 0x02012000, 0x800
	obj_frame_tiles 0x02012800, 0x800
	obj_frame_tiles 0x02013000, 0x800
	obj_frame_tiles 0x02013800, 0x800
	obj_frame_tiles 0x02014000, 0x800
	obj_frame_tiles 0x02014800, 0x800
	obj_frame_tiles 0x02015000, 0x800
	obj_frame_tiles 0x02015800, 0x800
	obj_frame_tiles 0x02016000, 0x800
	obj_frame_tiles 0x02016800, 0x800
	obj_frame_tiles 0x02017000, 0x800
	obj_frame_tiles 0x02017800, 0x800

	.align 2
gSpriteImageTable_83B5714:: @ 83B5714
	obj_frame_tiles 0x02014000, 0x800
	obj_frame_tiles 0x02014800, 0x800
	obj_frame_tiles 0x02015000, 0x800
	obj_frame_tiles 0x02015800, 0x800
	obj_frame_tiles 0x02016000, 0x800
	obj_frame_tiles 0x02016800, 0x800
	obj_frame_tiles 0x02017000, 0x800
	obj_frame_tiles 0x02017800, 0x800
	obj_frame_tiles 0x02018000, 0x800
	obj_frame_tiles 0x02018800, 0x800
	obj_frame_tiles 0x02019000, 0x800
	obj_frame_tiles 0x02019800, 0x800
	obj_frame_tiles 0x0201A000, 0x800
	obj_frame_tiles 0x0201A800, 0x800
	obj_frame_tiles 0x0201B000, 0x800
	obj_frame_tiles 0x0201B800, 0x800

	.align 2
gUnknown_083B5794:: @ 83B5794
	.4byte gSpriteImageTable_83B5594
	.4byte gSpriteImageTable_83B5614
	.4byte gSpriteImageTable_83B5694
	.4byte gSpriteImageTable_83B5714

	.align 2
gUnknown_083B57A4:: @ 83B57A4
	spr_template 0xFFFF, 0, gOamData_83B557C, NULL, gSpriteImageTable_83B5594, gDummySpriteAffineAnimTable, nullsub_59

gUnknown_083B57BC:: @ 83B57BC
	.byte    0,   0,   0,   0
	.byte  187,   3, 213,   3
	.byte  190,   3, 216,   3
	.byte  193,   3, 219,   3
	.byte  196,   3, 222,   3
	.byte  199,   3, 225,   3
	.byte  202,   3, 228,   3
	.byte  205,   3, 231,   3
	.byte  208,   3, 234,   3
	.byte  211,   2, 237,   2

	.align 2
gUnknown_083B57E4:: @ 83B57E4
	.4byte DexText_SearchForPoke
	.2byte 0, 5
	.4byte DexText_SwitchDex
	.2byte 6, 5
	.4byte DexText_ReturnToDex
	.2byte 12, 5

	.align 2
gUnknown_083B57FC:: @ 83B57FC
	.4byte DexText_ListByABC
	.byte 0, 2, 5, 5, 2, 12, 0, 0
	.4byte DexText_ListByColor
	.byte 0, 4, 5, 5, 4, 12, 0, 0
	.4byte DexText_ListByType
	.byte 0, 6, 5, 5, 6, 6, 0, 0
	.4byte DexText_ListByType
	.byte 0, 6, 5, 11, 6, 6, 0, 0
	.4byte DexText_SelectDexList
	.byte 0, 8, 5, 5, 8, 12, 0, 0
	.4byte DexText_SelectDexMode
	.byte 0, 10, 5, 5, 10, 12, 0, 0
	.4byte DexText_ExecuteSearchSwitch
	.byte 0, 12, 5, 0, 0, 0, 0, 0

gUnknown_083B5850:: @ 83B5850
	.byte 0xFF, 0xFF, 0xFF,    1
	.byte 0xFF, 0xFF,    0,    2
	.byte 0xFF,    3,    1,    4
	.byte    2, 0xFF,    1,    4
	.byte 0xFF, 0xFF,    2,    5
	.byte 0xFF, 0xFF,    4,    6
	.byte 0xFF, 0xFF,    5, 0xFF

gUnknown_083B586C:: @ 83B586C
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF,    5
	.byte 0xFF, 0xFF,    4,    6
	.byte 0xFF, 0xFF,    5, 0xFF

gUnknown_083B5888:: @ 83B5888
	.byte 0xFF, 0xFF, 0xFF,    1
	.byte 0xFF, 0xFF,    0,    2
	.byte 0xFF,    3,    1,    4
	.byte    2, 0xFF,    1,    4
	.byte 0xFF, 0xFF,    2,    6
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF,    4, 0xFF

gUnknown_083B58A4:: @ 83B58A4
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF,    6
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF,    4, 0xFF

	.align 2
gUnknown_083B58C0:: @ 83B58C0
	.4byte DexText_HoennDex2, DexText_HoennDex
	.4byte DexText_NationalDex2, DexText_NationalDex
	.4byte 0x0, 0x0

	.align 2
gUnknown_083B58D8:: @ 83B58D8
	.4byte DexText_ListByNumber, DexText_NumericalMode
	.4byte DexText_ListByABC2, DexText_ABCMode
	.4byte DexText_ListByHeavyToLightest, DexText_HeaviestMode
	.4byte DexText_ListByLightToHeaviest, DexText_LightestMode
	.4byte DexText_ListByTallToSmallest, DexText_TallestMode
	.4byte DexText_ListBySmallToTallest, DexText_SmallestMode
	.4byte 0x0, 0x0

	.align 2
gUnknown_083B5910:: @ 83B5910
	.4byte DexText_Terminator5, DexText_DontSpecify
	.4byte DexText_Terminator5, DexText_ABC
	.4byte DexText_Terminator5, DexText_DEF
	.4byte DexText_Terminator5, DexText_GHI
	.4byte DexText_Terminator5, DexText_JKL
	.4byte DexText_Terminator5, DexText_MNO
	.4byte DexText_Terminator5, DexText_PQR
	.4byte DexText_Terminator5, DexText_STU
	.4byte DexText_Terminator5, DexText_VWX
	.4byte DexText_Terminator5, DexText_YZ
	.4byte 0x0, 0x0

	.align 2
gUnknown_083B5968:: @ 83B5968
	.4byte DexText_Terminator5, DexText_DontSpecify
	.4byte DexText_Terminator5, DexText_Red
	.4byte DexText_Terminator5, DexText_Blue
	.4byte DexText_Terminator5, DexText_Yellow
	.4byte DexText_Terminator5, DexText_Green
	.4byte DexText_Terminator5, DexText_Black
	.4byte DexText_Terminator5, DexText_Brown
	.4byte DexText_Terminator5, DexText_Purple
	.4byte DexText_Terminator5, DexText_Gray
	.4byte DexText_Terminator5, DexText_White
	.4byte DexText_Terminator5, DexText_Pink
	.4byte 0x0, 0x0

	.align 2
gUnknown_083B59C8:: @ 83B59C8
	.4byte DexText_Terminator5, DexText_None
	.4byte DexText_Terminator5, gTypeNames + TYPE_NORMAL * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_FIGHTING * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_FLYING * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_POISON * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_GROUND * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_ROCK * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_BUG * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_GHOST * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_STEEL * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_FIRE * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_WATER * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_GRASS * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_ELECTRIC * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_PSYCHIC * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_ICE * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_DRAGON * 7
	.4byte DexText_Terminator5, gTypeNames + TYPE_DARK * 7
	.4byte 0x0, 0x0

gUnknown_083B5A60:: @ 83B5A60
	.byte 0, 1

gUnknown_083B5A62:: @ 83B5A62
	.byte 0, 1, 2, 3, 4, 5

gUnknown_083B5A68:: @ 83B5A68
	.byte -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15, 16, 17

	.align 2
gUnknown_083B5A7C:: @ 83B5A7C
	.4byte gUnknown_083B5910
	.byte 6, 7, 10, 0
	.4byte gUnknown_083B5968
	.byte 8, 9, 11, 0
	.4byte gUnknown_083B59C8
	.byte 10, 11, 18, 0
	.4byte gUnknown_083B59C8
	.byte 12, 13, 18, 0
	.4byte gUnknown_083B58D8
	.byte 4, 5, 6, 0
	.4byte gUnknown_083B58C0
	.byte 2, 3, 2, 0

gUnknown_083B5AAC:: @ 83B5AAC
	.string "{STR_VAR_1}{CLEAR_TO 43}$"

gUnknown_083B5AB2:: @ 83B5AB2
	.string "{STR_VAR_1}{CLEAR_TO 96}$"
