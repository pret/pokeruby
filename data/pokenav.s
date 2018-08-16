	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083DFEC4:: @ 83DFEC4
	.4byte gSharedMem

	.align 2
gUnknown_083DFEC8:: @ 83DFEC8
	.4byte gTileBuffer

	.align 1
gUnknown_083DFECC:: @ 83DFECC
	.incbin "graphics/pokenav/83DFECC.gbapal"

	.align 1
gUnknown_083DFEEC:: @ 83DFEEC
	.incbin "graphics/pokenav/83DFEEC.4bpp"

	.align 2
gUnknown_083DFF8C:: @ 83DFF8C
	.incbin "graphics/pokenav/83DFF8C.bin.lz"

	.align 1
gUnknown_083E003C:: @ 83E003C
	.incbin "graphics/pokenav/83E003C.gbapal"

	.align 1
gUnknown_083E005C:: @ 83E005C
	.incbin "graphics/pokenav/83E005C.4bpp"

	.align 2
gUnknown_083E007C:: @ 83E007C
	.incbin "graphics/pokenav/83E007C.bin.lz"

	.align 1
gUnknown_083E0124:: @ 83E0124
	.incbin "graphics/pokenav/83E0124_pal.bin"

	.align 1
gUnknown_083E0144:: @ 83E0144
	.incbin "graphics/pokenav/83E0144_pal.bin"

	.align 1
	.incbin "graphics/pokenav/83E0164.bin"

	.align 1
gUnknown_083E01AC:: @ 83E01AC
	.incbin "graphics/pokenav/83E01AC.bin"

	.align 1
gUnknown_083E01F4:: @ 83E01F4
	.incbin "graphics/pokenav/83E01F4.bin"

	.align 1
gUnknown_083E0254:: @ 83E0254
	.incbin "graphics/pokenav/83E0254.gbapal"

	.align 1
gUnknown_083E0274:: @ 83E0274
	.incbin "graphics/pokenav/83E0274.gbapal"

	.align 2
gPokenavConditionSearch2_Pal:: @ 83E0294
	.incbin "graphics/pokenav/condition_search2.gbapal"

	.align 1
gUnknown_083E02B4:: @ 83E02B4
	.incbin "graphics/pokenav/83E02B4.gbapal"

	.align 1
	.incbin "graphics/pokenav/83E02D4.bin"

	.align 1
gUnknown_083E0314:: @ 83E0314
	.incbin "graphics/pokenav/83E0314.gbapal"

	.align 1
gUnknown_083E0334:: @ 83E0334
	.incbin "graphics/pokenav/trainereyes_misc_pal.bin" @ the original bytes have an "FF FF" instance which is incompatible with gbagfx to produce the bytes needed to match the original ROM, so I am forced to include it as a .bin until the lowest bit is properly handled or a better workaround is produced

	.align 2
gUnknown_083E0354:: @ 83E0354
	.incbin "graphics/pokenav/trainereyes_misc.4bpp.lz"

	.align 1
gUnknown_083E039C:: @ 83E039C
	.2byte 0x4280, 0x4282

	.align 1
gUnknown_083E03A0:: @ 83E03A0
	.2byte 0x4000, 0x4000, 0x4281, 0x4283

	.align 1
gUnknown_083E03A8:: @ 83E03A8
	.incbin "graphics/pokenav/83E03A8.gbapal"

	.align 1
	.incbin "graphics/pokenav/83E03C8.bin"

gUnknown_083E040C:: @ 83E040C
	.incbin "graphics/misc/ribbons_half.4bpp.lz"

	.align 2
gPokenavOutlinePalette:: @ 83E05D4
	.incbin "graphics/pokenav/outline.gbapal"

	.align 2
gPokenavOutlineTiles:: @ 83E05F4
	.incbin "graphics/pokenav/outline.4bpp.lz"

	.align 2
gPokenavOutlineTilemap:: @ 83E0804
	.incbin "graphics/pokenav/outline_map.bin.lz"

	.align 2
gPokenavCityMap_Lavaridge_0:: @ 83E096C
	.incbin "graphics/pokenav/city_maps/lavaridge_0.bin.lz"

	.align 2
gPokenavCityMap_Fallarbor_0:: @ 83E09B0
	.incbin "graphics/pokenav/city_maps/fallarbor_0.bin.lz"

	.align 2
gPokenavCityMap_Fortree_0:: @ 83E09F8
	.incbin "graphics/pokenav/city_maps/fortree_0.bin.lz"

	.align 2
gPokenavCityMap_Slateport_0:: @ 83E0A48
	.incbin "graphics/pokenav/city_maps/slateport_0.bin.lz"

	.align 2
gPokenavCityMap_Slateport_1:: @ 83E0AA8
	.incbin "graphics/pokenav/city_maps/slateport_1.bin.lz"

	.align 2
gPokenavCityMap_Rustboro_0:: @ 83E0AF4
	.incbin "graphics/pokenav/city_maps/rustboro_0.bin.lz"

	.align 2
gPokenavCityMap_Rustboro_1:: @ 83E0B48
	.incbin "graphics/pokenav/city_maps/rustboro_1.bin.lz"

	.align 2
gPokenavCityMap_Pacifidlog_0:: @ 83E0B9C
	.incbin "graphics/pokenav/city_maps/pacifidlog_0.bin.lz"

	.align 2
gPokenavCityMap_Mauville_1:: @ 83E0BDC
	.incbin "graphics/pokenav/city_maps/mauville_1.bin.lz"

	.align 2
gPokenavCityMap_Mauville_0:: @ 83E0C34
	.incbin "graphics/pokenav/city_maps/mauville_0.bin.lz"

	.align 2
gPokenavCityMap_Oldale_0:: @ 83E0C88
	.incbin "graphics/pokenav/city_maps/oldale_0.bin.lz"

	.align 2
gPokenavCityMap_Lilycove_1:: @ 83E0CB8
	.incbin "graphics/pokenav/city_maps/lilycove_1.bin.lz"

	.align 2
gPokenavCityMap_Lilycove_0:: @ 83E0D04
	.incbin "graphics/pokenav/city_maps/lilycove_0.bin.lz"

	.align 2
gPokenavCityMap_Littleroot_0:: @ 83E0D5C
	.incbin "graphics/pokenav/city_maps/littleroot_0.bin.lz"

	.align 2
gPokenavCityMap_Dewford_0:: @ 83E0D8C
	.incbin "graphics/pokenav/city_maps/dewford_0.bin.lz"

	.align 2
gPokenavCityMap_Sootopolis_0:: @ 83E0DC4
	.incbin "graphics/pokenav/city_maps/sootopolis_0.bin.lz"

	.align 2
gPokenavCityMap_EverGrande_0:: @ 83E0E04
	.incbin "graphics/pokenav/city_maps/ever_grande_0.bin.lz"

	.align 2
gPokenavCityMap_EverGrande_1:: @ 83E0E4C
	.incbin "graphics/pokenav/city_maps/ever_grande_1.bin.lz"

	.align 2
gPokenavCityMap_Verdanturf_0:: @ 83E0E90
	.incbin "graphics/pokenav/city_maps/verdanturf_0.bin.lz"

	.align 2
gPokenavCityMap_Mossdeep_1:: @ 83E0EC8
	.incbin "graphics/pokenav/city_maps/mossdeep_1.bin.lz"

	.align 2
gPokenavCityMap_Mossdeep_0:: @ 83E0F10
	.incbin "graphics/pokenav/city_maps/mossdeep_0.bin.lz"

	.align 2
gPokenavCityMap_Petalburg_0:: @ 83E0F6C
	.incbin "graphics/pokenav/city_maps/petalburg_0.bin.lz"

@ 83E0FC8
	.include "data/text/ribbon_descriptions.inc"

@ 83E1204
	.include "data/text/gift_ribbon_descriptions.inc"

@ 83E178C
	.include "data/text/trainer_eye_descriptions.inc"

	.align 2
gUnknown_083E31B0:: @ 83E31B0
	.4byte PCText_CheckMap
	.4byte PCText_CheckPoke
	.4byte PCText_CheckTrainer
	.4byte PCText_CheckRibbons
	.4byte PCText_PutAwayNav
	.4byte PCText_NoRibbonWin
	.4byte PCText_NoTrainers

	.align 2
gUnknown_083E31CC:: @ 83E31CC
	.4byte PCText_CheckParty
	.4byte PCText_CheckPokeAll
	.4byte PCText_ReturnToNav

	.align 2
gUnknown_083E31D8:: @ 83E31D8
	.4byte PCText_FindCool
	.4byte PCText_FindBeauty
	.4byte PCText_FindCute
	.4byte PCText_FindSmart
	.4byte PCText_FindTough
	.4byte PCText_ReturnToCondition

	.align 2
gPokenavCityMaps:: @ 83E31F0
	.4byte gPokenavCityMap_Littleroot_0, NULL
	.4byte gPokenavCityMap_Oldale_0, NULL
	.4byte gPokenavCityMap_Dewford_0, NULL
	.4byte gPokenavCityMap_Lavaridge_0, NULL
	.4byte gPokenavCityMap_Fallarbor_0, NULL
	.4byte gPokenavCityMap_Verdanturf_0, NULL
	.4byte gPokenavCityMap_Pacifidlog_0, NULL
	.4byte gPokenavCityMap_Petalburg_0, NULL
	.4byte gPokenavCityMap_Slateport_0, gPokenavCityMap_Slateport_1
	.4byte gPokenavCityMap_Mauville_0, gPokenavCityMap_Mauville_1
	.4byte gPokenavCityMap_Rustboro_0, gPokenavCityMap_Rustboro_1
	.4byte gPokenavCityMap_Fortree_0, NULL
	.4byte gPokenavCityMap_Lilycove_0, gPokenavCityMap_Lilycove_1
	.4byte gPokenavCityMap_Mossdeep_0, gPokenavCityMap_Mossdeep_1
	.4byte gPokenavCityMap_Sootopolis_0, NULL
	.4byte gPokenavCityMap_EverGrande_0, gPokenavCityMap_EverGrande_1

	.align 2
gUnknown_083E3270:: @ 83E3270
	.4byte sub_80F0A24
	.4byte sub_80F0A24
	.4byte sub_80F0A74

	.align 2
gPokenavIconPalette::
	.incbin "graphics/pokenav/icon.gbapal"

	.align 2
gUnknown_083E329C:: @ 83E329C
	.incbin "graphics/pokenav/icon.4bpp.lz"

	.align 2
gPokenavPokeballTiles::
	.incbin "graphics/pokenav/pokeball.4bpp"

	.align 2
gUnknown_083E3780: @ 83E3780
	.incbin "graphics/pokenav/83E3780.4bpp"

	.align 2
gPokenavSparkle_Pal::
	.incbin "graphics/pokenav/sparkle.gbapal"

	.align 2
gPokenavSparkle_Gfx::
	.incbin "graphics/pokenav/sparkle.4bpp"

	.align 2
gPokenavUpDownArrows_Gfx::
	.incbin "graphics/pokenav/arrows.4bpp"

	.align 2
gUnknown_083E3BC0:: @ 83E3BC0
	.incbin "graphics/pokenav/83E3BC0.bin"

	.align 2
gTiles_083E3BE0::
	.incbin "graphics/unknown/unknown_3E3BE0.4bpp"

	.align 2
gUnknown_083E3C60:: @ 83E3C60
	.incbin "graphics/misc/ribbons_cool.gbapal"
	.incbin "graphics/misc/ribbons_beauty.gbapal"
	.incbin "graphics/misc/ribbons_cute.gbapal"
	.incbin "graphics/misc/ribbons_smart.gbapal"
	.incbin "graphics/misc/ribbons_tough.gbapal"

	.align 2
gUnknown_083E3D00:: @ 83E3D00
	.incbin "graphics/misc/ribbons_full.4bpp.lz"

	.align 2
PokenavBlueLightPalette:
	.incbin "graphics/pokenav/blue_light.gbapal"

	.align 2
PokenavBlueLightTiles:
	.incbin "graphics/pokenav/blue_light.4bpp"

	.align 2
Palette_3E42D8: @ 83E42D8
	.incbin "graphics/pokenav/83E42D8.gbapal"

	.align 1
gUnknown_083E42F8:: @ 83E42F8
	.2byte  0x408
	.2byte  0x408
	.2byte  0x507
	.2byte  0x507
	.2byte  0x606
	.2byte  0x606
	.2byte  0x805
	.2byte  0x805
	.2byte  0xA04
	.2byte  0xA04
	.2byte  0xC03
	.2byte  0xC03
	.2byte  0xE02
	.2byte  0xE02
	.2byte 0x1000
	.2byte 0x1000

	.align 2
gOamData_83E4318:: @ 83E4318
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_83E4320:: @ 83E4320
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4328:: @ 83E4328
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4330:: @ 83E4330
	obj_image_anim_frame 16, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4338:: @ 83E4338
	obj_image_anim_frame 24, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4340:: @ 83E4340
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4348:: @ 83E4348
	obj_image_anim_frame 40, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4350:: @ 83E4350
	obj_image_anim_frame 48, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4358:: @ 83E4358
	obj_image_anim_frame 56, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4360:: @ 83E4360
	obj_image_anim_frame 64, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4368:: @ 83E4368
	obj_image_anim_frame 72, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4370:: @ 83E4370
	obj_image_anim_frame 80, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4378:: @ 83E4378
	obj_image_anim_frame 88, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4380:: @ 83E4380
	obj_image_anim_frame 96, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4388:: @ 83E4388
	obj_image_anim_frame 104, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4390:: @ 83E4390
	obj_image_anim_frame 112, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4398:: @ 83E4398
	obj_image_anim_frame 120, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E43A0:: @ 83E43A0
	obj_image_anim_frame 128, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E43A8:: @ 83E43A8
	obj_image_anim_frame 136, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E43B0:: @ 83E43B0
	obj_image_anim_frame 144, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E43B8:: @ 83E43B8
	obj_image_anim_frame 152, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E43C0:: @ 83E43C0
	obj_image_anim_frame 160, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E43C8:: @ 83E43C8
	obj_image_anim_frame 168, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E43D0:: @ 83E43D0
	obj_image_anim_frame 176, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E43D8:: @ 83E43D8
	obj_image_anim_frame 184, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83E43E0:: @ 83E43E0
	.4byte gSpriteAnim_83E4320
	.4byte gSpriteAnim_83E4328
	.4byte gSpriteAnim_83E4330
	.4byte gSpriteAnim_83E4338
	.4byte gSpriteAnim_83E4340
	.4byte gSpriteAnim_83E4348
	.4byte gSpriteAnim_83E4350
	.4byte gSpriteAnim_83E4358
	.4byte gSpriteAnim_83E4360
	.4byte gSpriteAnim_83E4368
	.4byte gSpriteAnim_83E4370
	.4byte gSpriteAnim_83E4378
	.4byte gSpriteAnim_83E4380
	.4byte gSpriteAnim_83E4388
	.4byte gSpriteAnim_83E4390
	.4byte gSpriteAnim_83E4398
	.4byte gSpriteAnim_83E43A0
	.4byte gSpriteAnim_83E43A8
	.4byte gSpriteAnim_83E43B0
	.4byte gSpriteAnim_83E43B8
	.4byte gSpriteAnim_83E43C0
	.4byte gSpriteAnim_83E43C8
	.4byte gSpriteAnim_83E43D0
	.4byte gSpriteAnim_83E43D8

	.align 2
gSpriteAffineAnim_83E4440:: @ 83E4440
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 16
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83E4450:: @ 83E4450
	.4byte gSpriteAffineAnim_83E4440

	.align 2
gSpriteTemplate_83E4454:: @ 83E4454
	spr_template 0, 0, gOamData_83E4318, gSpriteAnimTable_83E43E0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteSheet_PokenavBlueLight:: @ 83E446C
	obj_tiles PokenavBlueLightTiles, 0x100, 25

	.align 2
gSpritePalette_PokenavBlueLight:: @ 83E4474
	obj_pal PokenavBlueLightPalette, 17

	.align 2
gOamData_83E447C:: @ 83E447C
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteTemplate_83E4484:: @ 83E4484
	spr_template 25, 17, gOamData_83E447C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80F2654

gUnknown_083E449C:: @ 83E449C
	obj_pal gPokenavMenuOptions3_Pal, 2
	obj_pal gPokenavCondition5_Pal, 3
	obj_pal 0x0, 0

	.align 2
gOamData_83E44B4:: @ 83E44B4
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_83E44BC:: @ 83E44BC
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E44C4:: @ 83E44C4
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E44CC:: @ 83E44CC
	obj_image_anim_frame 64, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83E44D4:: @ 83E44D4
	.4byte gSpriteAnim_83E44BC
	.4byte gSpriteAnim_83E44C4
	.4byte gSpriteAnim_83E44CC

	.align 2
gSpriteTemplate_83E44E0:: @ 83E44E0
	spr_template 1, 2, gOamData_83E44B4, gSpriteAnimTable_83E44D4, NULL, gDummySpriteAffineAnimTable, sub_80F2BBC

	.align 2
gSpriteTemplate_83E44F8:: @ 83E44F8
	spr_template 1, 3, gOamData_83E44B4, gSpriteAnimTable_83E44D4, NULL, gDummySpriteAffineAnimTable, sub_80F2BBC

	.align 2
gOamData_83E4510:: @ 83E4510
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_83E4518:: @ 83E4518
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4520:: @ 83E4520
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83E4528:: @ 83E4528
	.4byte gSpriteAnim_83E4518
	.4byte gSpriteAnim_83E4520

	.align 2
gSpriteTemplate_83E4530:: @ 83E4530
	spr_template 2, 2, gOamData_83E4510, gSpriteAnimTable_83E4528, NULL, gDummySpriteAffineAnimTable, sub_80F2BBC

	.align 2
gSpriteTemplate_83E4548:: @ 83E4548
	spr_template 2, 3, gOamData_83E4510, gSpriteAnimTable_83E4528, NULL, gDummySpriteAffineAnimTable, sub_80F2BBC

	.align 2
gOamData_83E4560:: @ 83E4560
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gUnknown_083E4568:: @ 83E4568
	obj_tiles NULL, 0x800, 6

	.align 2
gSpriteTemplate_83E4570:: @ 83E4570
	spr_template 6, 6, gOamData_83E4560, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80F2E00

	.align 2
gUnknown_083E4588:: @ 83E4588
	obj_pal NULL, 6

	.align 2
gUnknown_083E4590:: @ 83E4590
	obj_tiles gPokenavArrow_Gfx, 0x40, 9
	obj_tiles gPokenavUpDownArrows_Gfx, 0x80, 10
	null_obj_tiles

	.align 2
gUnknown_083E45A8:: @ 83E45A8
	obj_pal gPokenavArrowsPalette, 9

	.align 2
gOamData_83E45B0:: @ 83E45B0
	.2byte 0x8000
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gSpriteTemplate_83E45B8:: @ 83E45B8
	spr_template 9, 9, gOamData_83E45B0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80F3190

	.align 2
gSpriteAnim_83E45D0:: @ 83E45D0
	obj_image_anim_frame 0, 3
	obj_image_anim_end

	.align 2
gSpriteAnim_83E45D8:: @ 83E45D8
	obj_image_anim_frame 2, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83E45E0:: @ 83E45E0
	.4byte gSpriteAnim_83E45D0
	.4byte gSpriteAnim_83E45D8

	.align 2
gOamData_83E45E8:: @ 83E45E8
	.2byte 0x4000
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gSpriteTemplate_83E45F0:: @ 83E45F0
	spr_template 10, 9, gOamData_83E45E8, gSpriteAnimTable_83E45E0, NULL, gDummySpriteAffineAnimTable, sub_80F31AC

	.align 2
gOamData_83E4608:: @ 83E4608
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gSpriteAnim_83E4610:: @ 83E4610
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E4618:: @ 83E4618
	obj_image_anim_frame 4, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83E4620:: @ 83E4620
	.4byte gSpriteAnim_83E4610
	.4byte gSpriteAnim_83E4618

	.align 2
gUnknown_083E4628:: @ 83E4628
	obj_tiles gPokenavPokeballTiles, 0x100, 3
	obj_tiles gUnknown_083E3780, 0x20, 4
	obj_tiles gPokenavConditionMenuCancel_Gfx, 0x100, 5
	null_obj_tiles

	.align 2
gUnknown_083E4648:: @ 83E4648
	obj_pal gPokenavConditionPokeball_Pal, 4
	obj_pal gPokenavCondition4_Pal, 5
	.space 8

	.align 2
gSpriteTemplate_83E4660:: @ 83E4660
	spr_template 3, 4, gOamData_83E4608, gSpriteAnimTable_83E4620, NULL, gDummySpriteAffineAnimTable, sub_80F3328

	.align 1
gUnknown_083E4678:: @ 83E4678
	.incbin "graphics/pokenav/83E4678.gbapal"

	.align 2
gPokenavRibbonsIconGfx:: @ 83E4698
	.2byte  0, 0
	.2byte  1, 0
	.2byte  2, 0
	.2byte  3, 0
	.2byte  4, 0
	.2byte  1, 1
	.2byte  2, 1
	.2byte  3, 1
	.2byte  4, 1
	.2byte  1, 2
	.2byte  2, 2
	.2byte  3, 2
	.2byte  4, 2
	.2byte  1, 3
	.2byte  2, 3
	.2byte  3, 3
	.2byte  4, 3
	.2byte  1, 4
	.2byte  2, 4
	.2byte  3, 4
	.2byte  4, 4
	.2byte  5, 0
	.2byte  6, 0
	.2byte  7, 1
	.2byte  8, 2
	.2byte  9, 1
	.2byte  9, 3
	.2byte  9, 4
	.2byte 10, 3
	.2byte 10, 4
	.2byte 11, 0
	.2byte 11, 1

	.align 2
gOamData_83E4718:: @ 83E4718
	.2byte 0x0100
	.2byte 0x8000
	.2byte 0x0000

	.align 2
gSpriteAffineAnim_83E4720:: @ 83E4720
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83E4730:: @ 83E4730
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 4
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83E4748:: @ 83E4748
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFE0, 0xFFE0, 0, 4
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83E4760:: @ 83E4760
	.4byte gSpriteAffineAnim_83E4720
	.4byte gSpriteAffineAnim_83E4730
	.4byte gSpriteAffineAnim_83E4748

	.align 2
gSpriteTemplate_83E476C:: @ 83E476C
	spr_template 11, 10, gOamData_83E4718, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83E4760, SpriteCallbackDummy

	.align 2
gUnknown_083E4784:: @ 83E4784
	obj_tiles gPokenavSparkle_Gfx, 896, 0x0017

	.align 2
gUnknown_083E478C:: @ 83E478C
	obj_pal gPokenavSparkle_Pal, 0x000f

	.align 2
gUnknown_083E4794:: @ 83E4794
	.2byte   0, -35
	.2byte  20, -28
	.2byte  33, -10
	.2byte  33,  10
	.2byte  20,  28
	.2byte   0,  35
	.2byte -20,  28
	.2byte -33,  10
	.2byte -33, -10
	.2byte -20, -28

	.align 2
gOamData_83E47BC:: @ 83E47BC
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0000

	.align 2
gSpriteAnim_83E47C4:: @ 83E47C4
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 20, 5
	obj_image_anim_frame 24, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83E47E4:: @ 83E47E4
	.4byte gSpriteAnim_83E47C4
	.4byte gSpriteAnim_83E47C4 + 0x8
	.4byte gSpriteAnim_83E47C4 + 0x10
	.4byte gSpriteAnim_83E47C4 + 0x18

	@ unused?
	.4byte gSpriteAnim_83E47C4 + 0x20
	.4byte gSpriteAnim_83E47C4 + 0x28
	.4byte gSpriteAnim_83E47C4 + 0x30

	.align 2
gSpriteTemplate_83E4800:: @ 83E4800
	spr_template 23, 15, gOamData_83E47BC, gSpriteAnimTable_83E47E4, NULL, gDummySpriteAffineAnimTable, sub_80F3E9C

	.align 2
gUnknown_083E4818:: @ 83E4818
	obj_pal gPokenavIconPalette, 16

	.align 2
gSpriteAnim_83E4820:: @ 83E4820
	obj_image_anim_frame 0, 12
	obj_image_anim_frame 16, 12
	obj_image_anim_frame 32, 12
	obj_image_anim_frame 48, 12
	obj_image_anim_frame 64, 12
	obj_image_anim_frame 80, 12
	obj_image_anim_frame 96, 12
	obj_image_anim_frame 112, 12
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83E4844:: @ 83E4844
	.4byte gSpriteAnim_83E4820

	.align 2
gOamData_83E4848:: @ 83E4848
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0000

	.align 2
gSpriteTemplate_83E4850:: @ 83E4850
	spr_template 24, 16, gOamData_83E4848, gSpriteAnimTable_83E4844, NULL, gDummySpriteAffineAnimTable, sub_80F4138

	.align 2
gUnknown_083E4868:: @ 83E4868
	obj_pal Palette_3E42D8, 18

	.align 2
gOamData_83E4870:: @ 83E4870
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0C00

	.align 2
gSpriteTemplate_83E4878:: @ 83E4878
	spr_template 26, 18, gOamData_83E4870, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_083E4890:: @ 83E4890
	.byte  4
	.byte  5
	.byte  6
	.byte  7
	.byte  8
	.byte  9
	.byte  9
	.byte 10
	.byte 10
	.byte 11
	.byte 11
	.byte 12
	.byte 12
	.byte 13
	.byte 13
	.byte 13
	.byte 13
	.byte 14
	.byte 14
	.byte 14
	.byte 14
	.byte 15
	.byte 15
	.byte 15
	.byte 15
	.byte 16
	.byte 16
	.byte 16
	.byte 16
	.byte 16
	.byte 16
	.byte 17
	.byte 17
	.byte 17
	.byte 17
	.byte 17
	.byte 17
	.byte 18
	.byte 18
	.byte 18
	.byte 18
	.byte 18
	.byte 18
	.byte 19
	.byte 19
	.byte 19
	.byte 19
	.byte 19
	.byte 19
	.byte 19
	.byte 19
	.byte 20
	.byte 20
	.byte 20
	.byte 20
	.byte 20
	.byte 20
	.byte 20
	.byte 20
	.byte 21
	.byte 21
	.byte 21
	.byte 21
	.byte 21
	.byte 21
	.byte 21
	.byte 21
	.byte 22
	.byte 22
	.byte 22
	.byte 22
	.byte 22
	.byte 22
	.byte 22
	.byte 22
	.byte 22
	.byte 22
	.byte 23
	.byte 23
	.byte 23
	.byte 23
	.byte 23
	.byte 23
	.byte 23
	.byte 23
	.byte 23
	.byte 23
	.byte 24
	.byte 24
	.byte 24
	.byte 24
	.byte 24
	.byte 24
	.byte 24
	.byte 24
	.byte 24
	.byte 24
	.byte 25
	.byte 25
	.byte 25
	.byte 25
	.byte 25
	.byte 25
	.byte 25
	.byte 25
	.byte 25
	.byte 25
	.byte 25
	.byte 25
	.byte 26
	.byte 26
	.byte 26
	.byte 26
	.byte 26
	.byte 26
	.byte 26
	.byte 26
	.byte 26
	.byte 26
	.byte 26
	.byte 26
	.byte 27
	.byte 27
	.byte 27
	.byte 27
	.byte 27
	.byte 27
	.byte 27
	.byte 27
	.byte 27
	.byte 27
	.byte 27
	.byte 27
	.byte 27
	.byte 27
	.byte 28
	.byte 28
	.byte 28
	.byte 28
	.byte 28
	.byte 28
	.byte 28
	.byte 28
	.byte 28
	.byte 28
	.byte 28
	.byte 28
	.byte 28
	.byte 28
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 29
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 31
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 33
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 34
	.byte 35

	.align 2
gUnknown_083E4990:: @ 83E4990
	.4byte REG_WIN0H
	.4byte ((DMA_ENABLE | DMA_START_HBLANK | DMA_32BIT | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1
	.4byte 1

	.align 1
gUnknown_083E499C:: @ 83E499C
	.2byte 0x43
	.2byte 0x32
	.2byte 0x33
	.2byte 0x34
	.2byte 0x35
	.2byte 0x36
	.2byte 0x44
	.2byte 0x45
	.2byte 0x46
	.2byte 0x47
	.2byte 0x48
	.2byte 0x49
	.2byte 0x4A
	.2byte 0x4B
	.2byte 0x4C
	.2byte 0x4D
	.2byte 0x4E

	.align 2
gUnknown_083E49C0:: @ 83E49C0
	.2byte 0x109, 0xA
	.2byte 0x10A, 0x2
	.2byte 0x10B, 0x9
	.2byte 0x10C, 0x3
	.2byte 0x10D, 0x7
	.2byte 0x10E, 0xB
	.2byte 0x10F, 0xD
	.2byte 0x110, 0xE
	.2byte 0x105, 0xF
	.2byte 0x106, 0xF
	.2byte 0x107, 0xF
	.2byte 0x108, 0xF
	.2byte 0x14F, 0xF
