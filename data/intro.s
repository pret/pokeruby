	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
Palette_406340:: @ 8406340
	.incbin "baserom.gba", 0x406340, 0x20

	.align 2
Palette_406360:: @ 8406360
	.incbin "baserom.gba", 0x406360, 0x20

	.align 2
gIntroTiles::
	.incbin "graphics/intro/intro.4bpp.lz"

	.align 2
gIntro1BGPals:: @ 8406974
	.incbin "graphics/intro/intro1_bgpal1.gbapal"
	.incbin "graphics/intro/intro1_bgpal2.gbapal"
	.incbin "graphics/intro/intro1_bgpal3.gbapal"
	.incbin "graphics/intro/intro1_bgpal4.gbapal"
	.incbin "graphics/intro/intro1_bgpal5.gbapal"
	.incbin "graphics/intro/intro1_bgpal6.gbapal"
	.incbin "graphics/intro/intro1_bgpal7.gbapal"
	.incbin "graphics/intro/intro1_bgpal8.gbapal"
	.incbin "graphics/intro/intro1_bgpal9.gbapal"
	.incbin "graphics/intro/intro1_bgpal10.gbapal"
	.incbin "graphics/intro/intro1_bgpal11.gbapal"
	.incbin "graphics/intro/intro1_bgpal12.gbapal"
	.incbin "graphics/intro/intro1_bgpal13.gbapal"
	.incbin "graphics/intro/intro1_bgpal14.gbapal"
	.incbin "graphics/intro/intro1_bgpal15.gbapal"
	.incbin "graphics/intro/intro1_bgpal16.gbapal"

	.align 2
gIntro1BG0_Tilemap:: @ 8406B74
	.incbin "graphics/intro/intro1_bg0_map.bin.lz"

	.align 2
gIntro1BG1_Tilemap:: @ 8406F28
	.incbin "graphics/intro/intro1_bg1_map.bin.lz"

	.align 2
gIntro1BG2_Tilemap:: @ 840725C
	.incbin "graphics/intro/intro1_bg2_map.bin.lz"

	.align 2
gIntro1BG3_Tilemap:: @ 840754C
	.incbin "graphics/intro/intro1_bg3_map.bin.lz"

	.align 2
gIntro1BGLeavesGfx:: @ 8407764
	.incbin "graphics/intro/introgfx.4bpp.lz"

	.align 2
gIntro3PokeballPal:: @ 84098D4
	.incbin "graphics/intro/intro3_pokeball.gbapal"

	.align 2
gIntro3Pokeball_Tilemap:: @ 8409AD4
	.incbin "graphics/intro/intro3_pokeball_map.bin.lz"

	.align 2
gIntro3Pokeball_Gfx:: @ 8409C04
	.incbin "graphics/intro/intro3_pokeball.8bpp.lz"

	.align 2
gIntro3Streaks_Pal:: @ 840A758
	.incbin "graphics/intro/intro3_streaks.gbapal"

	.align 2
gIntro3Streaks_Gfx:: @ 840A778
	.incbin "graphics/intro/intro3_streaks.4bpp.lz"

	.align 2
gIntro3Streaks_Tilemap:: @ 840A7E4
	.incbin "graphics/intro/intro3_streaks_map.bin.lz"

	.align 2
gIntro3Misc1Palette::
	.incbin "graphics/intro/intro3_misc1.gbapal"

	.align 2
gIntro3Misc2Palette::
	.incbin "graphics/intro/intro3_misc2.gbapal"

	.align 2
gIntro3MiscTiles::
	.incbin "graphics/intro/intro3_misc.4bpp.lz"

	.align 2
gIntro1EonPalette::
	.incbin "graphics/intro/intro1_eon.gbapal"

	.align 2
gIntro1EonTiles::
	.incbin "graphics/intro/intro1_eon.4bpp.lz"

	.align 2
gOamData_840ADE8:: @ 840ADE8
	.2byte 0x00A0
	.2byte 0x8000
	.2byte 0x0000

	.align 2
gSpriteAnim_840ADF0:: @ 840ADF0
	obj_image_anim_frame 16, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840ADF8:: @ 840ADF8
	obj_image_anim_frame 24, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AE00:: @ 840AE00
	obj_image_anim_frame 0, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AE08:: @ 840AE08
	obj_image_anim_frame 48, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840AE10:: @ 840AE10
	.4byte gSpriteAnim_840ADF0
	.4byte gSpriteAnim_840ADF8
	.4byte gSpriteAnim_840AE00
	.4byte gSpriteAnim_840AE08

	.align 2
gSpriteTemplate_840AE20:: @ 840AE20
	spr_template 2000, 2000, gOamData_840ADE8, gSpriteAnimTable_840AE10, NULL, gDummySpriteAffineAnimTable, sub_813D208

	.align 2
Unknown_40AE38: @ 840AE38
	.incbin "baserom.gba", 0x40ae38, 0x14

	.align 2
Unknown_40AE4C: @ 840AE4C
	.incbin "baserom.gba", 0x40ae4c, 0x14

	.align 2
Unknown_40AE60: @ 840AE60
	.incbin "baserom.gba", 0x40ae60, 0x10

	.align 2
Unknown_40AE70: @ 840AE70
	.incbin "baserom.gba", 0x40ae70, 0x10

	.align 2
gUnknown_0840AE80:: @ 840AE80
	.4byte Unknown_40AE38
	.4byte Unknown_40AE4C
	.4byte Unknown_40AE60
	.4byte Unknown_40AE70

	.align 2
gOamData_840AE90:: @ 840AE90
	.2byte 0x00A0
	.2byte 0x4000
	.2byte 0x0000

	.align 2
gOamData_840AE98:: @ 840AE98
	.2byte 0x00A0
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gOamData_840AEA0:: @ 840AEA0
	.2byte 0x80A0
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gSpriteAnim_840AEA8:: @ 840AEA8
	obj_image_anim_frame 80, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AEB0:: @ 840AEB0
	obj_image_anim_frame 84, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AEB8:: @ 840AEB8
	obj_image_anim_frame 88, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AEC0:: @ 840AEC0
	obj_image_anim_frame 92, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AEC8:: @ 840AEC8
	obj_image_anim_frame 96, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AED0:: @ 840AED0
	obj_image_anim_frame 100, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AED8:: @ 840AED8
	obj_image_anim_frame 104, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AEE0:: @ 840AEE0
	obj_image_anim_frame 112, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AEE8:: @ 840AEE8
	obj_image_anim_frame 113, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AEF0:: @ 840AEF0
	obj_image_anim_frame 114, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AEF8:: @ 840AEF8
	obj_image_anim_frame 115, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AF00:: @ 840AF00
	obj_image_anim_frame 116, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AF08:: @ 840AF08
	obj_image_anim_frame 117, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840AF10:: @ 840AF10
	obj_image_anim_frame 128, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840AF18:: @ 840AF18
	.4byte gSpriteAnim_840AEA8
	.4byte gSpriteAnim_840AEB0
	.4byte gSpriteAnim_840AEB8
	.4byte gSpriteAnim_840AEC0
	.4byte gSpriteAnim_840AEC8
	.4byte gSpriteAnim_840AED0
	.4byte gSpriteAnim_840AED8

	.align 2
gSpriteAnimTable_840AF34:: @ 840AF34
	.4byte gSpriteAnim_840AEE0
	.4byte gSpriteAnim_840AEE8
	.4byte gSpriteAnim_840AEF0
	.4byte gSpriteAnim_840AEF8
	.4byte gSpriteAnim_840AF00
	.4byte gSpriteAnim_840AF08

	.align 2
gSpriteAnimTable_840AF4C:: @ 840AF4C
	.4byte gSpriteAnim_840AF10

gUnknown_0840AF50:: @ 840AF50
	.incbin "baserom.gba", 0x0040af50, 0x24

gUnknown_0840AF74:: @ 840AF74
	.incbin "baserom.gba", 0x0040af74, 0x20

	.align 2
gSpriteTemplate_840AF94:: @ 840AF94
	spr_template 2000, 2001, gOamData_840AE90, gSpriteAnimTable_840AF18, NULL, gDummySpriteAffineAnimTable, sub_813D908

	.align 2
gSpriteTemplate_840AFAC:: @ 840AFAC
	spr_template 2000, 2001, gOamData_840AE98, gSpriteAnimTable_840AF34, NULL, gDummySpriteAffineAnimTable, sub_813D908

	.align 2
gSpriteTemplate_840AFC4:: @ 840AFC4
	spr_template 2000, 2001, gOamData_840AEA0, gSpriteAnimTable_840AF4C, NULL, gDummySpriteAffineAnimTable, sub_813D908

	.align 2
gOamData_840AFDC:: @ 840AFDC
	.2byte 0x40A0
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gSpriteAnim_840AFE4:: @ 840AFE4
	obj_image_anim_frame 0, 10
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_840AFEC:: @ 840AFEC
	.4byte gSpriteAnim_840AFE4

	.align 2
gSpriteTemplate_840AFF0:: @ 840AFF0
	spr_template 2002, 2002, gOamData_840AFDC, gSpriteAnimTable_840AFEC, NULL, gDummySpriteAffineAnimTable, sub_813DA64

	.align 2
gUnknown_0840B008:: @ 840B008
	obj_tiles gIntroTiles, 0x1400, 2000
	.space 8

	.align 2
gUnknown_0840B018:: @ 840B018
	obj_tiles gIntro1EonTiles, 0x400, 2002
	.space 8

	.align 2
gUnknown_0840B028:: @ 840B028
	obj_pal Palette_406340, 2000
	obj_pal Palette_406360, 2001
	obj_pal gIntro1EonPalette, 2002
	.space 8

gUnknown_0840B048:: @ 840B048
	.incbin "baserom.gba", 0x40b048, 0x8

gUnknown_0840B050:: @ 840B050
	.incbin "baserom.gba", 0x40b050, 0x8

gUnknown_0840B058:: @ 840B058
	.incbin "baserom.gba", 0x40b058, 0xc

	.align 2
gUnknown_0840B064:: @ 840B064
	.4byte gUnknown_0840B048
	.4byte gUnknown_0840B050
	.4byte gUnknown_0840B058

	.align 2
gOamData_840B070:: @ 840B070
	.2byte 0x00A0
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_840B078:: @ 840B078
	obj_image_anim_frame 0, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840B080:: @ 840B080
	.4byte gSpriteAnim_840B078

	.align 2
gSpriteTemplate_840B084:: @ 840B084
	spr_template 2002, 2002, gOamData_840B070, gSpriteAnimTable_840B080, NULL, gDummySpriteAffineAnimTable, sub_813E30C

	.align 2
gOamData_840B09C:: @ 840B09C
	.2byte 0x00A0
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gSpriteAnim_840B0A4:: @ 840B0A4
	obj_image_anim_frame 1, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840B0AC:: @ 840B0AC
	.4byte gSpriteAnim_840B0A4

	.align 2
gSpriteTemplate_840B0B0:: @ 840B0B0
	spr_template 2003, 2003, gOamData_840B09C, gSpriteAnimTable_840B0AC, NULL, gDummySpriteAffineAnimTable, sub_813E4B8

	.align 2
gOamData_840B0C8:: @ 840B0C8
	.2byte 0x00A0
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gSpriteAnim_840B0D0:: @ 840B0D0
	obj_image_anim_frame 14, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840B0D8:: @ 840B0D8
	.4byte gSpriteAnim_840B0D0

	.align 2
gSpriteTemplate_840B0DC:: @ 840B0DC
	spr_template 2003, 2004, gOamData_840B0C8, gSpriteAnimTable_840B0D8, NULL, gDummySpriteAffineAnimTable, sub_813E5E0

	.align 2
gSpriteTemplate_840B0F4:: @ 840B0F4
	spr_template 2003, 2004, gOamData_840B0C8, gSpriteAnimTable_840B0D8, NULL, gDummySpriteAffineAnimTable, sub_813E6C0

	.align 2
gOamData_840B10C:: @ 840B10C
	.2byte 0x00A0
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_840B114:: @ 840B114
	obj_image_anim_frame 6, 8
	obj_image_anim_frame 6, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_840B120:: @ 840B120
	.4byte gSpriteAnim_840B114

	.align 2
gSpriteTemplate_840B124:: @ 840B124
	spr_template 2003, 2004, gOamData_840B10C, gSpriteAnimTable_840B120, NULL, gDummySpriteAffineAnimTable, sub_813E804

	.align 2
gOamData_840B13C:: @ 840B13C
	.2byte 0x00A0
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_840B144:: @ 840B144
	obj_image_anim_frame 10, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840B14C:: @ 840B14C
	.4byte gSpriteAnim_840B144

	.align 2
gSpriteTemplate_840B150:: @ 840B150
	spr_template 2003, 2004, gOamData_840B13C, gSpriteAnimTable_840B14C, NULL, gDummySpriteAffineAnimTable, sub_813E980

gUnknown_0840B168:: @ 840B168
	.incbin "baserom.gba", 0x0040b168, 0x8

	.align 2
gSpriteTemplate_840B170:: @ 840B170
	spr_template 2003, 2004, gOamData_840B13C, gSpriteAnimTable_840B14C, NULL, gDummySpriteAffineAnimTable, sub_813EA60

gUnknown_0840B188:: @ 840B188
	.incbin "baserom.gba", 0x0040b188, 0x14

	.align 2
gOamData_840B19C:: @ 840B19C
	.2byte 0x00A0
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_840B1A4:: @ 840B1A4
	obj_image_anim_frame 2, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840B1AC:: @ 840B1AC
	.4byte gSpriteAnim_840B1A4

	.align 2
gSpriteTemplate_840B1B0:: @ 840B1B0
	spr_template 2003, 2004, gOamData_840B19C, gSpriteAnimTable_840B1AC, NULL, gDummySpriteAffineAnimTable, sub_813EBBC

	.align 2
gSpriteTemplate_840B1C8:: @ 840B1C8
	spr_template 2003, 2004, gOamData_840B19C, gSpriteAnimTable_840B1AC, NULL, gDummySpriteAffineAnimTable, sub_813EC90

	.align 2
gOamData_840B1E0:: @ 840B1E0
	.2byte 0x00A0
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_840B1E8:: @ 840B1E8
	obj_image_anim_frame 16, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840B1F0:: @ 840B1F0
	.4byte gSpriteAnim_840B1E8

	.align 2
gSpriteTemplate_840B1F4:: @ 840B1F4
	spr_template 2003, 2003, gOamData_840B1E0, gSpriteAnimTable_840B1F0, NULL, gDummySpriteAffineAnimTable, sub_813EDFC

	.align 2
gIntro3PokeballGfx_Table:: @ 840B20C
	obj_tiles gInterfaceGfx_PokeBall, 0x100, 2002
	.space 8

	.align 2
gIntro3MiscGfx_Table:: @ 840B21C
	obj_tiles gIntro3MiscTiles, 0xa00, 2003
	.space 8

	.align 2
gInterfacePokeballPal_Table:: @ 840B22C
	obj_pal gInterfacePal_PokeBall, 2002
	.space 8

	.align 2
gIntro3MiscPal_Table:: @ 840B23C
	obj_pal gIntro3Misc1Palette, 2003
	obj_pal gIntro3Misc2Palette, 2004
	.space 8

	.incbin "baserom.gba", 0x0040b254, 0x4
