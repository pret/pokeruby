	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteImage_839DC14:: @ 839DC14
	.incbin "graphics/birch_speech/birch.4bpp"

	.align 2
gBirchPalette:: @ 839E414
	.incbin "graphics/birch_speech/birch.gbapal"

	.align 2
gSpriteImage_839E434:: @ 839E434
	.incbin "graphics/misc/pokeball_glow.4bpp"

	.align 2
gFieldEffectObjectPalette4: @ 839E454
	.incbin "graphics/field_effect_objects/palettes/04.gbapal"

	.align 2
gSpriteImage_839E474:: @ 839E474
	.incbin "graphics/misc/pokecenter_monitor/0.4bpp"

	.align 2
gSpriteImage_839E534:: @ 839E534
	.incbin "graphics/misc/pokecenter_monitor/1.4bpp"

	.align 2
gSpriteImage_839E5F4:: @ 839E5F4
	.incbin "graphics/misc/big_hof_monitor.4bpp"

	.align 2
gSpriteImage_839E7F4:: @ 839E7F4
	.incbin "graphics/misc/small_hof_monitor.4bpp"

	.align 2
gFieldEffectObjectPalette5: @ 839E8F4
	.incbin "graphics/field_effect_objects/palettes/05.gbapal"

@ Graphics for the lights streaking past your Pokémon when it uses a field move.

	.align 2
gFieldMoveStreaksTiles:: @ 839E914
	.incbin "graphics/misc/field_move_streaks.4bpp"

	.align 2
gFieldMoveStreaksPalette:: @ 839EB14
	.incbin "graphics/misc/field_move_streaks.gbapal"

	.align 2
gFieldMoveStreaksTilemap:: @ 839EB34
	.incbin "graphics/misc/field_move_streaks_map.bin"

@ The following light streaks effect is used when the map is dark (e.g. a cave).

	.align 2
gDarknessFieldMoveStreaksTiles:: @ 839EDB4
	.incbin "graphics/misc/darkness_field_move_streaks.4bpp"

	.align 2
gDarknessFieldMoveStreaksPalette:: @ 839EE34
	.incbin "graphics/misc/darkness_field_move_streaks.gbapal"

	.align 2
gDarknessFieldMoveStreaksTilemap:: @ 839EE54
	.incbin "graphics/misc/darkness_field_move_streaks_map.bin"

	.align 2
gFieldEffectScriptFuncs:: @ 839F0D4
	.4byte FieldEffectCmd_loadtiles
	.4byte FieldEffectCmd_loadfadedpal
	.4byte FieldEffectCmd_loadpal
	.4byte FieldEffectCmd_callnative
	.4byte FieldEffectCmd_end
	.4byte FieldEffectCmd_loadgfx_callnative
	.4byte FieldEffectCmd_loadtiles_callnative
	.4byte FieldEffectCmd_loadfadedpal_callnative

	.align 2
gOamData_839F0F4:: @ 839F0F4
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gOamData_839F0FC:: @ 839F0FC
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gOamData_839F104:: @ 839F104
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0000

	.align 2
gSpriteImageTable_839F10C:: @ 839F10C
	obj_frame_tiles gSpriteImage_839DC14, 0x800

	.align 2
gUnknown_0839F114:: @ 839F114
	obj_pal gBirchPalette, 0x1006

	.align 2
gSpriteAnim_839F11C:: @ 839F11C
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_839F124:: @ 839F124
	.4byte gSpriteAnim_839F11C

	.align 2
gSpriteTemplate_839F128:: @ 839F128
	spr_template 0xFFFF, 4102, gOamData_839F0F4, gSpriteAnimTable_839F124, gSpriteImageTable_839F10C, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gFieldEffectObjectPaletteInfo4:: @ 839F140
	obj_pal gFieldEffectObjectPalette4, 0x1007

	.align 2
gFieldEffectObjectPaletteInfo5:: @ 839F148
	obj_pal gFieldEffectObjectPalette5, 0x1010

	.align 2
gOamData_839F150:: @ 839F150
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0000

	.align 2
gSpriteImageTable_839F158:: @ 839F158
	obj_frame_tiles gSpriteImage_839E434, 0x20

	.align 2
gSpriteImageTable_839F160:: @ 839F160
	obj_frame_tiles gSpriteImage_839E474, 0xc0
	obj_frame_tiles gSpriteImage_839E534, 0xc0

	.align 2
gSpriteImageTable_839F170:: @ 839F170
	obj_frame_tiles gSpriteImage_839E5F4, 0x200

	.align 2
gSpriteImageTable_839F178:: @ 839F178
	obj_frame_tiles gSpriteImage_839E7F4, 0x200

	.align 2
Unknown_39F180:: @ 839F180
	subsprite -12,  -8, 2,   0, 16x8
	subsprite   4,  -8, 2,   2, 8x8
	subsprite -12,   0, 2,   3, 16x8
	subsprite   4,   0, 2,   5, 8x8

	.align 2
gUnknown_0839F1A0:: @ 839F1A0
	.4byte 4, Unknown_39F180

	.align 2
Unknown_39F1A8:: @ 39F1A8
	subsprite -32,  -8, 2,   0, 32x8
	subsprite   0,  -8, 2,   4, 32x8
	subsprite -32,   0, 2,   8, 32x8
	subsprite   0,   0, 2,  12, 32x8

	.align 2
gUnknown_0839F1C8:: @ 839F1C8
	.4byte 4, Unknown_39F1A8

	.align 2
gSpriteAnim_839F1D0:: @ 839F1D0
	obj_image_anim_frame 0, 1
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_839F1D8:: @ 839F1D8
	obj_image_anim_frame 0, 16
	obj_image_anim_frame 1, 16
	obj_image_anim_frame 0, 16
	obj_image_anim_frame 1, 16
	obj_image_anim_frame 0, 16
	obj_image_anim_frame 1, 16
	obj_image_anim_frame 0, 16
	obj_image_anim_frame 1, 16
	obj_image_anim_end

	.align 2
gSpriteAnimTable_839F1FC:: @ 839F1FC
	.4byte gSpriteAnim_839F1D0
	.4byte gSpriteAnim_839F1D8

	.align 2
gSpriteAnimTable_839F204:: @ 839F204
	.4byte gSpriteAnim_839F1D0

	.align 2
gSpriteTemplate_839F208:: @ 839F208
	spr_template 0xFFFF, 4103, gOamData_839F0FC, gSpriteAnimTable_839F1FC, gSpriteImageTable_839F158, gDummySpriteAffineAnimTable, SpriteCB_PokeballGlow

	.align 2
gSpriteTemplate_839F220:: @ 839F220
	spr_template 0xFFFF, 4100, gOamData_839F104, gSpriteAnimTable_839F1FC, gSpriteImageTable_839F160, gDummySpriteAffineAnimTable, SpriteCB_PokecenterMonitor

	.align 2
gSpriteTemplate_839F238:: @ 839F238
	spr_template 0xFFFF, 4112, gOamData_839F104, gSpriteAnimTable_839F204, gSpriteImageTable_839F170, gDummySpriteAffineAnimTable, SpriteCB_HallOfFameMonitor

	.align 2
gSpriteTemplate_839F250:: @ 839F250
	spr_template 0xFFFF, 4112, gOamData_839F150, gSpriteAnimTable_839F204, gSpriteImageTable_839F178, gDummySpriteAffineAnimTable, SpriteCB_HallOfFameMonitor

	.align 2
gUnknown_0839F268:: @ 839F268
	.4byte PokecenterHealEffect_0
	.4byte PokecenterHealEffect_1
	.4byte PokecenterHealEffect_2
	.4byte PokecenterHealEffect_3

	.align 2
gUnknown_0839F278:: @ 839F278
	.4byte HallOfFameRecordEffect_0
	.4byte HallOfFameRecordEffect_1
	.4byte HallOfFameRecordEffect_2
	.4byte HallOfFameRecordEffect_3

	.align 2
gUnknown_0839F288:: @ 839F288
	.4byte PokeballGlowEffect_0
	.4byte PokeballGlowEffect_1
	.4byte PokeballGlowEffect_2
	.4byte PokeballGlowEffect_3
	.4byte PokeballGlowEffect_4
	.4byte PokeballGlowEffect_5
	.4byte PokeballGlowEffect_6
	.4byte PokeballGlowEffect_7

gUnknown_0839F2A8:: @ 839F2A8
	.2byte 0, 0
	.2byte 6, 0
	.2byte 0, 4
	.2byte 6, 4
	.2byte 0, 8
	.2byte 6, 8

gUnknown_0839F2C0:: @ 839F2C0
	.byte 16, 12, 8, 0

gUnknown_0839F2C4:: @ 839F2C4
	.byte 16, 12, 8, 0

gUnknown_0839F2C8:: @ 839F2C8
	.space 4

	.align 2
gUnknown_0839F2CC:: @ 839F2CC
	.4byte sub_80867AC
	.4byte sub_8086854
	.4byte sub_8086870
	.4byte sub_80868E4
	.4byte sub_808699C
	.4byte sub_80869B8
	.4byte sub_80869F8

	.align 2
gUnknown_0839F2E8:: @ 839F2E8
	.4byte sub_8086AA0
	.4byte sub_8086AC0
	.4byte sub_8086B30
	.4byte sub_8086B54
	.4byte sub_8086B64
	.4byte sub_8086B88

	.align 2
gUnknown_0839F300:: @ 839F300
	.4byte sub_8086CF4
	.4byte sub_8086D70
	.4byte sub_8086DB0
	.4byte sub_8086E10
	.4byte sub_8086E50
	.4byte sub_8086EB0
	.4byte sub_8086ED4

	.align 2
gUnknown_0839F31C:: @ 839F31C
	.4byte sub_8086FB0
	.4byte waterfall_1_do_anim_probably
	.4byte waterfall_2_wait_anim_finish_probably
	.4byte sub_8087030
	.4byte sub_8087058

	.align 2
gUnknown_0839F330:: @ 839F330
	.4byte sub_8087124
	.4byte dive_2_unknown
	.4byte dive_3_unknown

	.align 2
gUnknown_0839F33C:: @ 839F33C
	.4byte sub_808722C
	.4byte sub_8087264
	.4byte sub_8087298
	.4byte sub_80872E4
	.4byte sub_80873D8
	.4byte sub_80873F4

	.align 2
gUnknown_0839F354:: @ 839F354
	.4byte sub_80874CC
	.4byte sub_80874FC
	.4byte sub_8087548
	.4byte sub_808759C

	.align 2
gUnknown_0839F364:: @ 839F364
	.4byte sub_80876C8
	.4byte sub_80876F8
	.4byte sub_8087774
	.4byte sub_80877AC
	.4byte sub_80877D4

	.align 2
gUnknown_0839F378:: @ 839F378
	.4byte sub_80878F4
	.4byte sub_8087914

gUnknown_0839F380:: @ 839F380
	.byte 1, 3, 4, 2, 1

	.align 2
gUnknown_0839F388:: @ 839F388
	.4byte sub_8087AA4
	.4byte sub_8087AC8

	.align 2
gUnknown_0839F390:: @ 839F390
	.4byte sub_8087BEC
	.4byte sub_8087C14
	.4byte sub_8087CA4
	.4byte sub_8087D78

	.align 2
gUnknown_0839F3A0:: @ 839F3A0
	.4byte sub_8087E4C
	.4byte sub_8087ED8
	.4byte sub_8087FDC

	.align 2
gUnknown_0839F3AC:: @ 839F3AC
	.4byte sub_8088150
	.4byte sub_80881C0
	.4byte sub_8088228
	.4byte sub_80882B4
	.4byte sub_80882E4
	.4byte sub_8088338
	.4byte sub_8088380

	.align 2
gUnknown_0839F3C8:: @ 839F3C8
	.4byte sub_80884AC
	.4byte sub_80884E8
	.4byte sub_8088554
	.4byte sub_80885A8
	.4byte sub_80885D8
	.4byte sub_808860C
	.4byte sub_808862C

	.align 2
gUnknown_0839F3E4:: @ 839F3E4
	.4byte sub_8088984
	.4byte sub_80889E4
	.4byte sub_8088A30
	.4byte sub_8088A78
	.4byte sub_8088AF4

	.align 2
gUnknown_0839F3F8:: @ 839F3F8
	.4byte sub_8088CA0
	.4byte sub_8088CF8
	.4byte sub_8088D3C
	.4byte sub_8088D94
	.4byte sub_8088DD8
	.4byte sub_8088E2C
	.4byte sub_8088EB4
	.4byte sub_8088F10
	.4byte sub_8088F30

SpriteAffineAnim_839F41C:
	obj_rot_scal_anim_frame 8, 8, -30, 0
	obj_rot_scal_anim_frame 28, 28, 0, 30
	obj_rot_scal_anim_end

SpriteAffineAnim_839F434:
	obj_rot_scal_anim_frame 256, 256, 64, 0
	obj_rot_scal_anim_frame -10, -10, 0, 22
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_0839F44C:: @ 839F44C
	.4byte SpriteAffineAnim_839F41C
	.4byte SpriteAffineAnim_839F434

	.align 2
gUnknown_0839F454:: @ 839F454
	.4byte sub_80892A0
	.4byte sub_8089354
	.4byte sub_80893C0
	.4byte sub_8089414
	.4byte sub_808948C
	.4byte sub_80894C4
	.4byte fishE

gUnknown_0839F470:: @ 839F470
	.2byte -2
	.2byte -4
	.2byte -5
	.2byte -6
	.2byte -7
	.2byte -8
	.2byte -8
	.2byte -8
	.2byte -7
	.2byte -7
	.2byte -6
	.2byte -5
	.2byte -3
	.2byte -2
	.2byte 0
	.2byte 2
	.2byte 4
	.2byte 8
