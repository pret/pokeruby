	.align 2
gFieldEffectObjectPaletteInfo0:: @ 8374524
	obj_pal gFieldEffectObjectPalette0, 0x1004

	.align 2
gFieldEffectObjectPaletteInfo1:: @ 837452C
	obj_pal gFieldEffectObjectPalette1, 0x1005

	.align 2
gFieldEffectAnim_8374534: @ 8374534
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_Shadow: @ 837453C
	.4byte gFieldEffectAnim_8374534

	.align 2
gFieldEffectPicTable_ShadowSmall: @ 8374540
	obj_frame_tiles gFieldEffectPic_ShadowSmall, 0x20

	.align 2
gFieldEffectPicTable_ShadowMedium: @ 8374548
	obj_frame_tiles gFieldEffectPic_ShadowMedium, 0x40

	.align 2
gFieldEffectPicTable_ShadowLarge: @ 8374550
	obj_frame_tiles gFieldEffectPic_ShadowLarge, 0x80

	.align 2
gFieldEffectPicTable_ShadowExtraLarge: @ 8374558
	obj_frame_tiles gFieldEffectPic_ShadowExtraLarge, 0x400

	.align 2
gFieldEffectSpriteTemplate_ShadowSmall: @ 8374560
	spr_template 0xFFFF, 0xFFFF, gFieldOamData_8x8, gFieldEffectAnimTable_Shadow, gFieldEffectPicTable_ShadowSmall, gDummySpriteAffineAnimTable, oamc_shadow

	.align 2
gFieldEffectSpriteTemplate_ShadowMedium: @ 8374578
	spr_template 0xFFFF, 0xFFFF, gFieldOamData_16x8, gFieldEffectAnimTable_Shadow, gFieldEffectPicTable_ShadowMedium, gDummySpriteAffineAnimTable, oamc_shadow

	.align 2
gFieldEffectSpriteTemplate_ShadowLarge: @ 8374590
	spr_template 0xFFFF, 0xFFFF, gFieldOamData_32x8, gFieldEffectAnimTable_Shadow, gFieldEffectPicTable_ShadowLarge, gDummySpriteAffineAnimTable, oamc_shadow

	.align 2
gFieldEffectSpriteTemplate_ShadowExtraLarge: @ 83745A8
	spr_template 0xFFFF, 0xFFFF, gFieldOamData_64x32, gFieldEffectAnimTable_Shadow, gFieldEffectPicTable_ShadowExtraLarge, gDummySpriteAffineAnimTable, oamc_shadow

	.align 2
gFieldEffectPicTable_TallGrass: @ 83745C0
	obj_frame_tiles gFieldEffectPic_TallGrass_0, 0x80
	obj_frame_tiles gFieldEffectPic_TallGrass_1, 0x80
	obj_frame_tiles gFieldEffectPic_TallGrass_2, 0x80
	obj_frame_tiles gFieldEffectPic_TallGrass_3, 0x80
	obj_frame_tiles gFieldEffectPic_TallGrass_4, 0x80

	.align 2
gFieldEffectAnim_83745E8: @ 83745E8
	obj_image_anim_frame 1, 10
	obj_image_anim_frame 2, 10
	obj_image_anim_frame 3, 10
	obj_image_anim_frame 4, 10
	obj_image_anim_frame 0, 10
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_TallGrass: @ 8374600
	.4byte gFieldEffectAnim_83745E8

	.align 2
gFieldEffectSpriteTemplate_TallGrass: @ 8374604
	spr_template 0xFFFF, 0x1005, gFieldOamData_16x16, gFieldEffectAnimTable_TallGrass, gFieldEffectPicTable_TallGrass, gDummySpriteAffineAnimTable, unc_grass_normal

	.align 2
gFieldEffectPicTable_Ripple: @ 837461C
	obj_frame_tiles gFieldEffectPic_Ripple_0, 0x80
	obj_frame_tiles gFieldEffectPic_Ripple_1, 0x80
	obj_frame_tiles gFieldEffectPic_Ripple_2, 0x80
	obj_frame_tiles gFieldEffectPic_Ripple_3, 0x80
	obj_frame_tiles gFieldEffectPic_Ripple_4, 0x80

	.align 2
gFieldEffectAnim_8374644: @ 8374644
	obj_image_anim_frame 0, 12
	obj_image_anim_frame 1, 9
	obj_image_anim_frame 2, 9
	obj_image_anim_frame 3, 9
	obj_image_anim_frame 0, 9
	obj_image_anim_frame 1, 9
	obj_image_anim_frame 2, 11
	obj_image_anim_frame 4, 11
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_Ripple: @ 8374668
	.4byte gFieldEffectAnim_8374644

	.align 2
gFieldEffectSpriteTemplate_Ripple: @ 837466C
	spr_template 0xFFFF, 0x1005, gFieldOamData_16x16, gFieldEffectAnimTable_Ripple, gFieldEffectPicTable_Ripple, gDummySpriteAffineAnimTable, sub_8128800

	.align 2
gFieldEffectPicTable_Ash: @ 8374684
	obj_frame_tiles gFieldEffectPic_Ash_0, 0x80
	obj_frame_tiles gFieldEffectPic_Ash_1, 0x80
	obj_frame_tiles gFieldEffectPic_Ash_2, 0x80
	obj_frame_tiles gFieldEffectPic_Ash_3, 0x80
	obj_frame_tiles gFieldEffectPic_Ash_4, 0x80

	.align 2
gFieldEffectAnim_83746AC: @ 83746AC
	obj_image_anim_frame 0, 12
	obj_image_anim_frame 1, 12
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 12
	obj_image_anim_frame 4, 12
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_Ash: @ 83746C4
	.4byte gFieldEffectAnim_83746AC

	.align 2
gFieldEffectSpriteTemplate_Ash: @ 83746C8
	spr_template 0xFFFF, 0x1005, gFieldOamData_16x16, gFieldEffectAnimTable_Ash, gFieldEffectPicTable_Ash, gDummySpriteAffineAnimTable, sub_8127D84

	.align 2
gFieldEffectPicTable_SurfBlob: @ 83746E0
	obj_frame_tiles gFieldEffectPic_SurfBlob_0, 0x200
	obj_frame_tiles gFieldEffectPic_SurfBlob_1, 0x200
	obj_frame_tiles gFieldEffectPic_SurfBlob_2, 0x200

	.align 2
gFieldEffectAnim_83746F8: @ 83746F8
	obj_image_anim_frame 0, 1
	obj_image_anim_jump 0

	.align 2
gFieldEffectAnim_8374700: @ 8374700
	obj_image_anim_frame 1, 1
	obj_image_anim_jump 0

	.align 2
gFieldEffectAnim_8374708: @ 8374708
	obj_image_anim_frame 2, 1
	obj_image_anim_jump 0

	.align 2
gFieldEffectAnim_8374710: @ 8374710
	obj_image_anim_frame 2, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gFieldEffectAnimTable_SurfBlob: @ 8374718
	.4byte gFieldEffectAnim_83746F8
	.4byte gFieldEffectAnim_8374700
	.4byte gFieldEffectAnim_8374708
	.4byte gFieldEffectAnim_8374710

	.align 2
gFieldEffectSpriteTemplate_SurfBlob: @ 8374728
	spr_template 0xFFFF, 0xFFFF, gFieldOamData_32x32, gFieldEffectAnimTable_SurfBlob, gFieldEffectPicTable_SurfBlob, gDummySpriteAffineAnimTable, sub_8127F7C

	.align 2
gFieldEffectPicTable_Arrow: @ 8374740
	obj_frame_tiles gFieldEffectPic_Arrow_0, 0x80
	obj_frame_tiles gFieldEffectPic_Arrow_1, 0x80
	obj_frame_tiles gFieldEffectPic_Arrow_2, 0x80
	obj_frame_tiles gFieldEffectPic_Arrow_3, 0x80
	obj_frame_tiles gFieldEffectPic_Arrow_4, 0x80
	obj_frame_tiles gFieldEffectPic_Arrow_5, 0x80
	obj_frame_tiles gFieldEffectPic_Arrow_6, 0x80
	obj_frame_tiles gFieldEffectPic_Arrow_7, 0x80

	.align 2
gFieldEffectAnim_8374780: @ 8374780
	obj_image_anim_frame 3, 32
	obj_image_anim_frame 7, 32
	obj_image_anim_jump 0

	.align 2
gFieldEffectAnim_837478C: @ 837478C
	obj_image_anim_frame 0, 32
	obj_image_anim_frame 4, 32
	obj_image_anim_jump 0

	.align 2
gFieldEffectAnim_8374798: @ 8374798
	obj_image_anim_frame 1, 32
	obj_image_anim_frame 5, 32
	obj_image_anim_jump 0

	.align 2
gFieldEffectAnim_83747A4: @ 83747A4
	obj_image_anim_frame 2, 32
	obj_image_anim_frame 6, 32
	obj_image_anim_jump 0

	.align 2
gFieldEffectAnimTable_Arrow: @ 83747B0
	.4byte gFieldEffectAnim_8374780
	.4byte gFieldEffectAnim_837478C
	.4byte gFieldEffectAnim_8374798
	.4byte gFieldEffectAnim_83747A4

	.align 2
gFieldEffectSpriteTemplate_Arrow: @ 83747C0
	spr_template 0xFFFF, 0xFFFF, gFieldOamData_16x16, gFieldEffectAnimTable_Arrow, gFieldEffectPicTable_Arrow, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gFieldEffectPicTable_Dust: @ 83747D8
	obj_frame_tiles gFieldEffectPic_Dust_0, 0x40
	obj_frame_tiles gFieldEffectPic_Dust_1, 0x40
	obj_frame_tiles gFieldEffectPic_Dust_2, 0x40

	.align 2
gFieldEffectAnim_83747F0: @ 83747F0
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_Dust: @ 8374800
	.4byte gFieldEffectAnim_83747F0

	.align 2
gFieldEffectSpriteTemplate_Dust: @ 8374804
	spr_template 0xFFFF, 0x1004, gFieldOamData_16x8, gFieldEffectAnimTable_Dust, gFieldEffectPicTable_Dust, gDummySpriteAffineAnimTable, sub_81287C4

	.align 2
gFieldEffectPicTable_JumpTallGrass: @ 837481C
	obj_frame_tiles gFieldEffectPic_JumpTallGrass_0, 0x40
	obj_frame_tiles gFieldEffectPic_JumpTallGrass_1, 0x40
	obj_frame_tiles gFieldEffectPic_JumpTallGrass_2, 0x40
	obj_frame_tiles gFieldEffectPic_JumpTallGrass_3, 0x40

	.align 2
gFieldEffectAnim_837483C: @ 837483C
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_JumpTallGrass: @ 8374850
	.4byte gFieldEffectAnim_837483C

	.align 2
gFieldEffectSpriteTemplate_JumpTallGrass: @ 8374854
	spr_template 0xFFFF, 0x1005, gFieldOamData_16x8, gFieldEffectAnimTable_JumpTallGrass, gFieldEffectPicTable_JumpTallGrass, gDummySpriteAffineAnimTable, sub_81287C4

	.align 2
gFieldEffectPicTable_SandFootprints: @ 837486C
	obj_frame_tiles gFieldEffectPic_SandFootprints_0, 0x80
	obj_frame_tiles gFieldEffectPic_SandFootprints_1, 0x80

	.align 2
gFieldEffectAnim_837487C: @ 837487C
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gFieldEffectAnim_8374884: @ 8374884
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gFieldEffectAnim_837488C: @ 837488C
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gFieldEffectAnim_8374894: @ 8374894
	obj_image_anim_frame 1, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_SandFootprints: @ 837489C
	.4byte gFieldEffectAnim_837487C
	.4byte gFieldEffectAnim_837487C
	.4byte gFieldEffectAnim_8374884
	.4byte gFieldEffectAnim_837488C
	.4byte gFieldEffectAnim_8374894

	.align 2
gFieldEffectSpriteTemplate_SandFootprints: @ 83748B0
	spr_template 0xFFFF, 0x1004, gFieldOamData_16x16, gFieldEffectAnimTable_SandFootprints, gFieldEffectPicTable_SandFootprints, gDummySpriteAffineAnimTable, sub_8127584

	.align 2
gFieldEffectPicTable_DeepSandFootprints: @ 83748C8
	obj_frame_tiles gFieldEffectPic_DeepSandFootprints_0, 0x80
	obj_frame_tiles gFieldEffectPic_DeepSandFootprints_1, 0x80

	.align 2
gFieldEffectAnim_83748D8: @ 83748D8
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gFieldEffectAnim_83748E0: @ 83748E0
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gFieldEffectAnim_83748E8: @ 83748E8
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gFieldEffectAnim_83748F0: @ 83748F0
	obj_image_anim_frame 1, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_DeepSandFootprints: @ 83748F8
	.4byte gFieldEffectAnim_83748D8
	.4byte gFieldEffectAnim_83748D8
	.4byte gFieldEffectAnim_83748E0
	.4byte gFieldEffectAnim_83748E8
	.4byte gFieldEffectAnim_83748F0

	.align 2
gFieldEffectSpriteTemplate_DeepSandFootprints: @ 837490C
	spr_template 0xFFFF, 0x1004, gFieldOamData_16x16, gFieldEffectAnimTable_DeepSandFootprints, gFieldEffectPicTable_DeepSandFootprints, gDummySpriteAffineAnimTable, sub_8127584

	.align 2
gFieldEffectPicTable_BikeTireTracks: @ 8374924
	obj_frame_tiles gFieldEffectPic_BikeTireTracks_0, 0x80
	obj_frame_tiles gFieldEffectPic_BikeTireTracks_1, 0x80
	obj_frame_tiles gFieldEffectPic_BikeTireTracks_2, 0x80
	obj_frame_tiles gFieldEffectPic_BikeTireTracks_3, 0x80

	.align 2
gFieldEffectAnim_8374944: @ 8374944
	obj_image_anim_frame 2, 1
	obj_image_anim_end

	.align 2
gFieldEffectAnim_837494C: @ 837494C
	obj_image_anim_frame 2, 1
	obj_image_anim_end

	.align 2
gFieldEffectAnim_8374954: @ 8374954
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gFieldEffectAnim_837495C: @ 837495C
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gFieldEffectAnim_8374964: @ 8374964
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gFieldEffectAnim_837496C: @ 837496C
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gFieldEffectAnim_8374974: @ 8374974
	obj_image_anim_frame 3, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gFieldEffectAnim_837497C: @ 837497C
	obj_image_anim_frame 3, 1
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_BikeTireTracks: @ 8374984
	.4byte gFieldEffectAnim_8374944
	.4byte gFieldEffectAnim_8374944
	.4byte gFieldEffectAnim_837494C
	.4byte gFieldEffectAnim_8374954
	.4byte gFieldEffectAnim_837495C
	.4byte gFieldEffectAnim_8374964
	.4byte gFieldEffectAnim_837496C
	.4byte gFieldEffectAnim_8374974
	.4byte gFieldEffectAnim_837497C

	.align 2
gFieldEffectSpriteTemplate_BikeTireTracks: @ 83749A8
	spr_template 0xFFFF, 0x1004, gFieldOamData_16x16, gFieldEffectAnimTable_BikeTireTracks, gFieldEffectPicTable_BikeTireTracks, gDummySpriteAffineAnimTable, sub_8127584

	.align 2
gFieldEffectPicTable_JumpBigSplash: @ 83749C0
	obj_frame_tiles gFieldEffectPic_JumpBigSplash_0, 0x80
	obj_frame_tiles gFieldEffectPic_JumpBigSplash_1, 0x80
	obj_frame_tiles gFieldEffectPic_JumpBigSplash_2, 0x80
	obj_frame_tiles gFieldEffectPic_JumpBigSplash_3, 0x80

	.align 2
gFieldEffectAnim_83749E0: @ 83749E0
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_JumpBigSplash: @ 83749F4
	.4byte gFieldEffectAnim_83749E0

	.align 2
gFieldEffectSpriteTemplate_JumpBigSplash: @ 83749F8
	spr_template 0xFFFF, 0x1004, gFieldOamData_16x16, gFieldEffectAnimTable_JumpBigSplash, gFieldEffectPicTable_JumpBigSplash, gDummySpriteAffineAnimTable, sub_81287C4

	.align 2
gFieldEffectPicTable_Splash: @ 8374A10
	obj_frame_tiles gFieldEffectPic_Splash_0, 0x40
	obj_frame_tiles gFieldEffectPic_Splash_1, 0x40

	.align 2
gFieldEffectAnim_8374A20: @ 8374A20
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_end

	.align 2
gFieldEffectAnim_8374A2C: @ 8374A2C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_jump 0

	.align 2
gFieldEffectAnimTable_Splash: @ 8374A50
	.4byte gFieldEffectAnim_8374A20
	.4byte gFieldEffectAnim_8374A2C

	.align 2
gFieldEffectSpriteTemplate_Splash: @ 8374A58
	spr_template 0xFFFF, 0x1004, gFieldOamData_16x8, gFieldEffectAnimTable_Splash, gFieldEffectPicTable_Splash, gDummySpriteAffineAnimTable, sub_81276B4

	.align 2
gFieldEffectPicTable_JumpSmallSplash: @ 8374A70
	obj_frame_tiles gFieldEffectPic_JumpSmallSplash_0, 0x40
	obj_frame_tiles gFieldEffectPic_JumpSmallSplash_1, 0x40
	obj_frame_tiles gFieldEffectPic_JumpSmallSplash_2, 0x40

	.align 2
gFieldEffectAnim_8374A88: @ 8374A88
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_JumpSmallSplash: @ 8374A98
	.4byte gFieldEffectAnim_8374A88

	.align 2
gFieldEffectSpriteTemplate_JumpSmallSplash: @ 8374A9C
	spr_template 0xFFFF, 0x1004, gFieldOamData_16x8, gFieldEffectAnimTable_JumpSmallSplash, gFieldEffectPicTable_JumpSmallSplash, gDummySpriteAffineAnimTable, sub_81287C4

	.align 2
gFieldEffectPicTable_LongGrass: @ 8374AB4
	obj_frame_tiles gFieldEffectPic_LongGrass_0, 0x80
	obj_frame_tiles gFieldEffectPic_LongGrass_1, 0x80
	obj_frame_tiles gFieldEffectPic_LongGrass_2, 0x80
	obj_frame_tiles gFieldEffectPic_LongGrass_3, 0x80

	.align 2
gFieldEffectAnim_8374AD4: @ 8374AD4
	obj_image_anim_frame 1, 3
	obj_image_anim_frame 2, 3
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_LongGrass: @ 8374AF4
	.4byte gFieldEffectAnim_8374AD4

	.align 2
gFieldEffectSpriteTemplate_LongGrass: @ 8374AF8
	spr_template 0xFFFF, 0x1005, gFieldOamData_16x16, gFieldEffectAnimTable_LongGrass, gFieldEffectPicTable_LongGrass, gDummySpriteAffineAnimTable, unc_grass_tall

	.align 2
gFieldEffectPicTable_JumpLongGrass: @ 8374B10
	obj_frame_tiles gFieldEffectPic_JumpLongGrass_0, 0x80
	obj_frame_tiles gFieldEffectPic_JumpLongGrass_1, 0x80
	obj_frame_tiles gFieldEffectPic_JumpLongGrass_2, 0x80
	obj_frame_tiles gFieldEffectPic_JumpLongGrass_3, 0x80
	obj_frame_tiles gFieldEffectPic_JumpLongGrass_4, 0x80
	obj_frame_tiles gFieldEffectPic_JumpLongGrass_5, 0x80

	.align 2
gFieldEffectAnim_8374B40: @ 8374B40
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 5, 8
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_JumpLongGrass: @ 8374B5C
	.4byte gFieldEffectAnim_8374B40

	.align 2
gFieldEffectSpriteTemplate_JumpLongGrass: @ 8374B60
	spr_template 0xFFFF, 0x1005, gFieldOamData_16x16, gFieldEffectAnimTable_JumpLongGrass, gFieldEffectPicTable_JumpLongGrass, gDummySpriteAffineAnimTable, sub_81287C4

	.align 2
gFieldEffectPicTable_Unknown17: @ 8374B78
	obj_frame_tiles gFieldEffectPic_JumpLongGrass_5, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown17_0, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown17_1, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown17_2, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown17_3, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown17_4, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown17_5, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown17_6, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown17_7, 0x80

	.align 2
gFieldEffectAnim_8374BC0: @ 8374BC0
	obj_image_anim_frame 0, 10
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_frame 7, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_jump 7

	.align 2
gFieldEffectAnimTable_Unknown17: @ 8374BE8
	.4byte gFieldEffectAnim_8374BC0

	.align 2
gFieldEffectSpriteTemplate_Unknown17: @ 8374BEC
	spr_template 0xFFFF, 0x1005, gFieldOamData_16x16, gFieldEffectAnimTable_Unknown17, gFieldEffectPicTable_Unknown17, gDummySpriteAffineAnimTable, sub_8128800

	.align 2
gFieldEffectPicTable_Unknown18: @ 8374C04
	obj_frame_tiles gFieldEffectPic_Unknown18_0, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown18_1, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown18_2, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown18_3, 0x80

	.align 2
gFieldEffectAnim_8374C24: @ 8374C24
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_jump 0

	.align 2
gFieldEffectAnimTable_Unknown18: @ 8374C40
	.4byte gFieldEffectAnim_8374C24

	.align 2
gFieldEffectSpriteTemplate_Unknown18: @ 8374C44
	spr_template 0xFFFF, 0x1005, gFieldOamData_16x16, gFieldEffectAnimTable_Unknown18, gFieldEffectPicTable_Unknown18, gDummySpriteAffineAnimTable, sub_8128800

	.align 2
gFieldEffectPicTable_Unknown19: @ 8374C5C
	obj_frame_tiles gFieldEffectPic_Unknown19_0, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown19_1, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown19_2, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown19_3, 0x80

	.align 2
gFieldEffectAnim_8374C7C: @ 8374C7C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_jump 0

	.align 2
gFieldEffectAnimTable_Unknown19: @ 8374C90
	.4byte gFieldEffectAnim_8374C7C

	.align 2
gFieldEffectSpriteTemplate_Unknown19: @ 8374C94
	spr_template 0xFFFF, 0x1004, gFieldOamData_16x16, gFieldEffectAnimTable_Unknown19, gFieldEffectPicTable_Unknown19, gDummySpriteAffineAnimTable, sub_8128800

	.align 2
gFieldEffectPicTable_SandPile: @ 8374CAC
	obj_frame_tiles gFieldEffectPic_SandPile_0, 0x40
	obj_frame_tiles gFieldEffectPic_SandPile_1, 0x40
	obj_frame_tiles gFieldEffectPic_SandPile_2, 0x40

	.align 2
gFieldEffectAnim_8374CC4: @ 8374CC4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_SandPile: @ 8374CD4
	.4byte gFieldEffectAnim_8374CC4

	.align 2
gFieldEffectSpriteTemplate_SandPile: @ 8374CD8
	spr_template 0xFFFF, 0x1004, gFieldOamData_16x8, gFieldEffectAnimTable_SandPile, gFieldEffectPicTable_SandPile, gDummySpriteAffineAnimTable, sub_81282E0

	.align 2
gFieldEffectPicTable_Unknown20: @ 8374CF0
	obj_frame_tiles gFieldEffectPic_Unknown20_0, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown20_1, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown20_2, 0x80
	obj_frame_tiles gFieldEffectPic_Unknown20_3, 0x80

	.align 2
gFieldEffectAnim_8374D10: @ 8374D10
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_jump 0

	.align 2
gFieldEffectAnimTable_Unknown20: @ 8374D2C
	.4byte gFieldEffectAnim_8374D10

	.align 2
gFieldEffectSpriteTemplate_Unknown20: @ 8374D30
	spr_template 0xFFFF, 0x1004, gFieldOamData_16x16, gFieldEffectAnimTable_Unknown20, gFieldEffectPicTable_Unknown20, gDummySpriteAffineAnimTable, sub_8128800

	.align 2
gFieldEffectAffineAnim_8374D48: @ 8374D48
	obj_rot_scal_anim_frame 0xFF00, 0x100, -128, 0
	obj_rot_scal_anim_frame 0x1, 0x0, 0, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_frame 0xFFFF, 0x0, 0, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_frame 0xFFFF, 0x0, 0, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_frame 0x1, 0x0, 0, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_jump 1

	.align 2
gFieldEffectAffineAnim_8374D98: @ 8374D98
	obj_rot_scal_anim_frame 0x100, 0x100, -128, 0
	obj_rot_scal_anim_frame 0xFFFF, 0x0, 0, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_frame 0x1, 0x0, 0, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_frame 0x1, 0x0, 0, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_frame 0xFFFF, 0x0, 0, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_jump 1

	.align 2
gFieldEffectAffineAnimTable_Unknown21: @ 8374DE8
	.4byte gFieldEffectAffineAnim_8374D48
	.4byte gFieldEffectAffineAnim_8374D98

	.align 2
gFieldEffectSpriteTemplate_Unknown21: @ 8374DF0
	spr_template 0x0, 0xFFFF, gDummyOamData, gDummySpriteAnimTable, NULL, gFieldEffectAffineAnimTable_Unknown21, SpriteCallbackDummy

	.align 2
gFieldEffectPicTable_BerryTreeGrowthSparkle: @ 8374E08
	obj_frame_tiles gFieldEffectPic_BerryTreeGrowthSparkle_0, 0x80
	obj_frame_tiles gFieldEffectPic_BerryTreeGrowthSparkle_1, 0x80
	obj_frame_tiles gFieldEffectPic_BerryTreeGrowthSparkle_2, 0x80
	obj_frame_tiles gFieldEffectPic_BerryTreeGrowthSparkle_3, 0x80
	obj_frame_tiles gFieldEffectPic_BerryTreeGrowthSparkle_4, 0x80
	obj_frame_tiles gFieldEffectPic_BerryTreeGrowthSparkle_5, 0x80

	.align 2
gFieldEffectAnim_8374E38: @ 8374E38
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 5, 8
	obj_image_anim_loop 0
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_loop 3
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 5, 8
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_BerryTreeGrowthSparkle: @ 8374E8C
	.4byte gFieldEffectAnim_8374E38

	.align 2
gFieldEffectSpriteTemplate_BerryTreeGrowthSparkle: @ 8374E90
	spr_template 0xFFFF, 0xFFFF, gFieldOamData_16x16, gFieldEffectAnimTable_BerryTreeGrowthSparkle, gFieldEffectPicTable_BerryTreeGrowthSparkle, gDummySpriteAffineAnimTable, sub_8128800

	.align 2
gFieldEffectPicTable_TreeDisguise: @ 8374EA8
	obj_frame_tiles gFieldEffectPic_TreeDisguise_0, 0x100
	obj_frame_tiles gFieldEffectPic_TreeDisguise_1, 0x100
	obj_frame_tiles gFieldEffectPic_TreeDisguise_2, 0x100
	obj_frame_tiles gFieldEffectPic_TreeDisguise_3, 0x100
	obj_frame_tiles gFieldEffectPic_TreeDisguise_4, 0x100
	obj_frame_tiles gFieldEffectPic_TreeDisguise_5, 0x100
	obj_frame_tiles gFieldEffectPic_TreeDisguise_6, 0x100

	.align 2
gFieldEffectAnim_8374EE0: @ 8374EE0
	obj_image_anim_frame 0, 16
	obj_image_anim_end

	.align 2
gFieldEffectAnim_8374EE8: @ 8374EE8
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_TreeDisguise: @ 8374F08
	.4byte gFieldEffectAnim_8374EE0
	.4byte gFieldEffectAnim_8374EE8

	.align 2
gFieldEffectSpriteTemplate_TreeDisguise: @ 8374F10
	spr_template 0xFFFF, 0xFFFF, gFieldOamData_16x32, gFieldEffectAnimTable_TreeDisguise, gFieldEffectPicTable_TreeDisguise, gDummySpriteAffineAnimTable, sub_81285AC

	.align 2
gFieldEffectPicTable_MountainDisguise: @ 8374F28
	obj_frame_tiles gFieldEffectPic_MountainDisguise_0, 0x100
	obj_frame_tiles gFieldEffectPic_MountainDisguise_1, 0x100
	obj_frame_tiles gFieldEffectPic_MountainDisguise_2, 0x100
	obj_frame_tiles gFieldEffectPic_MountainDisguise_3, 0x100
	obj_frame_tiles gFieldEffectPic_MountainDisguise_4, 0x100
	obj_frame_tiles gFieldEffectPic_MountainDisguise_5, 0x100
	obj_frame_tiles gFieldEffectPic_MountainDisguise_6, 0x100

	.align 2
gFieldEffectAnim_8374F60: @ 8374F60
	obj_image_anim_frame 0, 16
	obj_image_anim_end

	.align 2
gFieldEffectAnim_8374F68: @ 8374F68
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_MountainDisguise: @ 8374F88
	.4byte gFieldEffectAnim_8374F60
	.4byte gFieldEffectAnim_8374F68

	.align 2
gFieldEffectSpriteTemplate_MountainDisguise: @ 8374F90
	spr_template 0xFFFF, 0xFFFF, gFieldOamData_16x32, gFieldEffectAnimTable_MountainDisguise, gFieldEffectPicTable_MountainDisguise, gDummySpriteAffineAnimTable, sub_81285AC

	.align 2
gFieldEffectPicTable_SandDisguise: @ 8374FA8
	obj_frame_tiles gFieldEffectPic_SandDisguise_0, 0x100
	obj_frame_tiles gFieldEffectPic_SandDisguise_1, 0x100
	obj_frame_tiles gFieldEffectPic_SandDisguise_2, 0x100
	obj_frame_tiles gFieldEffectPic_SandDisguise_3, 0x100
	obj_frame_tiles gFieldEffectPic_SandDisguise_4, 0x100
	obj_frame_tiles gFieldEffectPic_SandDisguise_5, 0x100
	obj_frame_tiles gFieldEffectPic_SandDisguise_6, 0x100

	.align 2
gFieldEffectSpriteTemplate_SandDisguise: @ 8374FE0
	spr_template 0xFFFF, 0xFFFF, gFieldOamData_16x32, gFieldEffectAnimTable_TreeDisguise, gFieldEffectPicTable_SandDisguise, gDummySpriteAffineAnimTable, sub_81285AC

	.align 2
gFieldEffectPicTable_Bird: @ 8374FF8
	obj_frame_tiles gFieldEffectPic_Bird, 0x200

	.align 2
gFieldEffectAnim_8375000: @ 8375000
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_Bird: @ 8375008
	.4byte gFieldEffectAnim_8375000

	.align 2
gFieldEffectSpriteTemplate_Bird: @ 837500C
	spr_template 0xFFFF, 0xFFFF, gFieldOamData_32x32, gFieldEffectAnimTable_Bird, gFieldEffectPicTable_Bird, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gFieldEffectPicTable_ShortGrass: @ 8375024
	obj_frame_tiles gFieldEffectPic_ShortGrass_0, 0x80
	obj_frame_tiles gFieldEffectPic_ShortGrass_1, 0x80

	.align 2
gFieldEffectAnim_8375034: @ 8375034
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_ShortGrass: @ 8375040
	.4byte gFieldEffectAnim_8375034

	.align 2
gFieldEffectSpriteTemplate_ShortGrass: @ 8375044
	spr_template 0xFFFF, 0x1005, gFieldOamData_16x16, gFieldEffectAnimTable_ShortGrass, gFieldEffectPicTable_ShortGrass, gDummySpriteAffineAnimTable, sub_8127334

	.align 2
gFieldEffectPicTable_HotSpringsWater: @ 837505C
	obj_frame_tiles gFieldEffectPic_HotSpringsWater, 0x80

	.align 2
gFieldEffectAnim_8375064: @ 8375064
	obj_image_anim_frame 0, 4
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_HotSpringsWater: @ 837506C
	.4byte gFieldEffectAnim_8375064

	.align 2
gFieldEffectSpriteTemplate_HotSpringsWater: @ 8375070
	spr_template 0xFFFF, 0x1005, gFieldOamData_16x16, gFieldEffectAnimTable_HotSpringsWater, gFieldEffectPicTable_HotSpringsWater, gDummySpriteAffineAnimTable, sub_8127A7C

	.align 2
gFieldEffectPicTable_PopOutOfAsh: @ 8375088
	obj_frame_tiles gFieldEffectPic_PopOutOfAsh_0, 0x80
	obj_frame_tiles gFieldEffectPic_PopOutOfAsh_1, 0x80
	obj_frame_tiles gFieldEffectPic_PopOutOfAsh_2, 0x80
	obj_frame_tiles gFieldEffectPic_PopOutOfAsh_3, 0x80
	obj_frame_tiles gFieldEffectPic_PopOutOfAsh_4, 0x80

	.align 2
gFieldEffectAnim_83750B0: @ 83750B0
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_frame 2, 6
	obj_image_anim_frame 3, 6
	obj_image_anim_frame 4, 6
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_PopOutOfAsh: @ 83750C8
	.4byte gFieldEffectAnim_83750B0

	.align 2
gFieldEffectSpriteTemplate_PopOutOfAsh: @ 83750CC
	spr_template 0xFFFF, 0x100D, gFieldOamData_16x16, gFieldEffectAnimTable_PopOutOfAsh, gFieldEffectPicTable_PopOutOfAsh, gDummySpriteAffineAnimTable, sub_808788C

	.align 2
gFieldEffectObjectPaletteInfo2:: @ 83750E4
	obj_pal gFieldEffectObjectPalette2, 0x100D

	.align 2
gFieldEffectPicTable_LavaridgeGymWarp: @ 83750EC
	obj_frame_tiles gFieldEffectPic_LavaridgeGymWarp_0, 0x80
	obj_frame_tiles gFieldEffectPic_LavaridgeGymWarp_1, 0x80
	obj_frame_tiles gFieldEffectPic_LavaridgeGymWarp_2, 0x80
	obj_frame_tiles gFieldEffectPic_LavaridgeGymWarp_3, 0x80
	obj_frame_tiles gFieldEffectPic_LavaridgeGymWarp_4, 0x80

	.align 2
gFieldEffectAnim_8375114: @ 8375114
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_frame 2, 6
	obj_image_anim_frame 3, 6
	obj_image_anim_frame 4, 6
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_LavaridgeGymWarp: @ 837512C
	.4byte gFieldEffectAnim_8375114

	.align 2
gFieldEffectSpriteTemplate_LavaridgeGymWarp: @ 8375130
	spr_template 0xFFFF, 0x100D, gFieldOamData_16x16, gFieldEffectAnimTable_LavaridgeGymWarp, gFieldEffectPicTable_LavaridgeGymWarp, gDummySpriteAffineAnimTable, sub_8087638

	.align 2
gFieldEffectPicTable_Bubbles: @ 8375148
	obj_frame_tiles gFieldEffectPic_Bubbles_0, 0x100
	obj_frame_tiles gFieldEffectPic_Bubbles_1, 0x100
	obj_frame_tiles gFieldEffectPic_Bubbles_2, 0x100
	obj_frame_tiles gFieldEffectPic_Bubbles_3, 0x100
	obj_frame_tiles gFieldEffectPic_Bubbles_4, 0x100
	obj_frame_tiles gFieldEffectPic_Bubbles_5, 0x100
	obj_frame_tiles gFieldEffectPic_Bubbles_6, 0x100
	obj_frame_tiles gFieldEffectPic_Bubbles_7, 0x100

	.align 2
gFieldEffectAnim_8375188: @ 8375188
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 6
	obj_image_anim_frame 4, 6
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_frame 7, 4
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_Bubbles: @ 83751AC
	.4byte gFieldEffectAnim_8375188

	.align 2
gFieldEffectSpriteTemplate_Bubbles: @ 83751B0
	spr_template 0xFFFF, 0x1004, gFieldOamData_16x32, gFieldEffectAnimTable_Bubbles, gFieldEffectPicTable_Bubbles, gDummySpriteAffineAnimTable, sub_8128410

	.align 2
gFieldEffectPicTable_Sparkle: @ 83751C8
	obj_frame_tiles gFieldEffectPic_Sparkle_0, 0x80
	obj_frame_tiles gFieldEffectPic_Sparkle_1, 0x80

	.align 2
gFieldEffectAnim_83751D8: @ 83751D8
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gFieldEffectAnimTable_Sparkle: @ 83751E8
	.4byte gFieldEffectAnim_83751D8

	.align 2
gFieldEffectSpriteTemplate_Sparkle: @ 83751EC
	spr_template 0xFFFF, 0x100F, gFieldOamData_16x16, gFieldEffectAnimTable_Sparkle, gFieldEffectPicTable_Sparkle, gDummySpriteAffineAnimTable, sub_8128774

	.align 2
gFieldEffectObjectPaletteInfo3:: @ 8375204
	obj_pal gFieldEffectObjectPalette3, 0x100F
