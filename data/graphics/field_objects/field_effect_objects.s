	.align 2
gFieldEffectObjectPaletteInfo0:: @ 8374524
	obj_pal gFieldEffectObjectPalette0, 0x1004

	.align 2
gFieldEffectObjectPaletteInfo1:: @ 837452C
	obj_pal gFieldEffectObjectPalette1, 0x1005

	.align 2
gFieldEffectObjectImageAnim_8374534: @ 8374534
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_Shadow: @ 837453C
	.4byte gFieldEffectObjectImageAnim_8374534

	.align 2
gFieldEffectObjectPicTable_ShadowSmall: @ 8374540
	obj_frame_tiles gFieldEffectObjectPic_ShadowSmall, 0x20

	.align 2
gFieldEffectObjectPicTable_ShadowMedium: @ 8374548
	obj_frame_tiles gFieldEffectObjectPic_ShadowMedium, 0x40

	.align 2
gFieldEffectObjectPicTable_ShadowLarge: @ 8374550
	obj_frame_tiles gFieldEffectObjectPic_ShadowLarge, 0x80

	.align 2
gFieldEffectObjectPicTable_ShadowExtraLarge: @ 8374558
	obj_frame_tiles gFieldEffectObjectPic_ShadowExtraLarge, 0x400

	.align 2
gFieldEffectObjectTemplate_ShadowSmall: @ 8374560
	spr_template 0xFFFF, 0xFFFF, gFieldObjectBaseOam_8x8, gFieldEffectObjectImageAnimTable_Shadow, gFieldEffectObjectPicTable_ShadowSmall, gDummySpriteAffineAnimTable, oamc_shadow

	.align 2
gFieldEffectObjectTemplate_ShadowMedium: @ 8374578
	spr_template 0xFFFF, 0xFFFF, gFieldObjectBaseOam_16x8, gFieldEffectObjectImageAnimTable_Shadow, gFieldEffectObjectPicTable_ShadowMedium, gDummySpriteAffineAnimTable, oamc_shadow

	.align 2
gFieldEffectObjectTemplate_ShadowLarge: @ 8374590
	spr_template 0xFFFF, 0xFFFF, gFieldObjectBaseOam_32x8, gFieldEffectObjectImageAnimTable_Shadow, gFieldEffectObjectPicTable_ShadowLarge, gDummySpriteAffineAnimTable, oamc_shadow

	.align 2
gFieldEffectObjectTemplate_ShadowExtraLarge: @ 83745A8
	spr_template 0xFFFF, 0xFFFF, gFieldObjectBaseOam_64x32, gFieldEffectObjectImageAnimTable_Shadow, gFieldEffectObjectPicTable_ShadowExtraLarge, gDummySpriteAffineAnimTable, oamc_shadow

	.align 2
gFieldEffectObjectPicTable_TallGrass: @ 83745C0
	obj_frame_tiles gFieldEffectObjectPic_TallGrass_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_TallGrass_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_TallGrass_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_TallGrass_3, 0x80
	obj_frame_tiles gFieldEffectObjectPic_TallGrass_4, 0x80

	.align 2
gFieldEffectObjectImageAnim_83745E8: @ 83745E8
	obj_image_anim_frame 1, 10
	obj_image_anim_frame 2, 10
	obj_image_anim_frame 3, 10
	obj_image_anim_frame 4, 10
	obj_image_anim_frame 0, 10
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_TallGrass: @ 8374600
	.4byte gFieldEffectObjectImageAnim_83745E8

	.align 2
gFieldEffectObjectTemplate_TallGrass: @ 8374604
	spr_template 0xFFFF, 0x1005, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_TallGrass, gFieldEffectObjectPicTable_TallGrass, gDummySpriteAffineAnimTable, unc_grass_normal

	.align 2
gFieldEffectObjectPicTable_Ripple: @ 837461C
	obj_frame_tiles gFieldEffectObjectPic_Ripple_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Ripple_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Ripple_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Ripple_3, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Ripple_4, 0x80

	.align 2
gFieldEffectObjectImageAnim_8374644: @ 8374644
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
gFieldEffectObjectImageAnimTable_Ripple: @ 8374668
	.4byte gFieldEffectObjectImageAnim_8374644

	.align 2
gFieldEffectObjectTemplate_Ripple: @ 837466C
	spr_template 0xFFFF, 0x1005, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_Ripple, gFieldEffectObjectPicTable_Ripple, gDummySpriteAffineAnimTable, sub_8128800

	.align 2
gFieldEffectObjectPicTable_Ash: @ 8374684
	obj_frame_tiles gFieldEffectObjectPic_Ash_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Ash_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Ash_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Ash_3, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Ash_4, 0x80

	.align 2
gFieldEffectObjectImageAnim_83746AC: @ 83746AC
	obj_image_anim_frame 0, 12
	obj_image_anim_frame 1, 12
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 12
	obj_image_anim_frame 4, 12
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_Ash: @ 83746C4
	.4byte gFieldEffectObjectImageAnim_83746AC

	.align 2
gFieldEffectObjectTemplate_Ash: @ 83746C8
	spr_template 0xFFFF, 0x1005, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_Ash, gFieldEffectObjectPicTable_Ash, gDummySpriteAffineAnimTable, sub_8127D84

	.align 2
gFieldEffectObjectPicTable_SurfBlob: @ 83746E0
	obj_frame_tiles gFieldEffectObjectPic_SurfBlob_0, 0x200
	obj_frame_tiles gFieldEffectObjectPic_SurfBlob_1, 0x200
	obj_frame_tiles gFieldEffectObjectPic_SurfBlob_2, 0x200

	.align 2
gFieldEffectObjectImageAnim_83746F8: @ 83746F8
	obj_image_anim_frame 0, 1
	obj_image_anim_jump 0

	.align 2
gFieldEffectObjectImageAnim_8374700: @ 8374700
	obj_image_anim_frame 1, 1
	obj_image_anim_jump 0

	.align 2
gFieldEffectObjectImageAnim_8374708: @ 8374708
	obj_image_anim_frame 2, 1
	obj_image_anim_jump 0

	.align 2
gFieldEffectObjectImageAnim_8374710: @ 8374710
	obj_image_anim_frame 2, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gFieldEffectObjectImageAnimTable_SurfBlob: @ 8374718
	.4byte gFieldEffectObjectImageAnim_83746F8
	.4byte gFieldEffectObjectImageAnim_8374700
	.4byte gFieldEffectObjectImageAnim_8374708
	.4byte gFieldEffectObjectImageAnim_8374710

	.align 2
gFieldEffectObjectTemplate_SurfBlob: @ 8374728
	spr_template 0xFFFF, 0xFFFF, gFieldObjectBaseOam_32x32, gFieldEffectObjectImageAnimTable_SurfBlob, gFieldEffectObjectPicTable_SurfBlob, gDummySpriteAffineAnimTable, sub_8127F7C

	.align 2
gFieldEffectObjectPicTable_Arrow: @ 8374740
	obj_frame_tiles gFieldEffectObjectPic_Arrow_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Arrow_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Arrow_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Arrow_3, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Arrow_4, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Arrow_5, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Arrow_6, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Arrow_7, 0x80

	.align 2
gFieldEffectObjectImageAnim_8374780: @ 8374780
	obj_image_anim_frame 3, 32
	obj_image_anim_frame 7, 32
	obj_image_anim_jump 0

	.align 2
gFieldEffectObjectImageAnim_837478C: @ 837478C
	obj_image_anim_frame 0, 32
	obj_image_anim_frame 4, 32
	obj_image_anim_jump 0

	.align 2
gFieldEffectObjectImageAnim_8374798: @ 8374798
	obj_image_anim_frame 1, 32
	obj_image_anim_frame 5, 32
	obj_image_anim_jump 0

	.align 2
gFieldEffectObjectImageAnim_83747A4: @ 83747A4
	obj_image_anim_frame 2, 32
	obj_image_anim_frame 6, 32
	obj_image_anim_jump 0

	.align 2
gFieldEffectObjectImageAnimTable_Arrow: @ 83747B0
	.4byte gFieldEffectObjectImageAnim_8374780
	.4byte gFieldEffectObjectImageAnim_837478C
	.4byte gFieldEffectObjectImageAnim_8374798
	.4byte gFieldEffectObjectImageAnim_83747A4

	.align 2
gFieldEffectObjectTemplate_Arrow: @ 83747C0
	spr_template 0xFFFF, 0xFFFF, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_Arrow, gFieldEffectObjectPicTable_Arrow, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gFieldEffectObjectPicTable_Dust: @ 83747D8
	obj_frame_tiles gFieldEffectObjectPic_Dust_0, 0x40
	obj_frame_tiles gFieldEffectObjectPic_Dust_1, 0x40
	obj_frame_tiles gFieldEffectObjectPic_Dust_2, 0x40

	.align 2
gFieldEffectObjectImageAnim_83747F0: @ 83747F0
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_Dust: @ 8374800
	.4byte gFieldEffectObjectImageAnim_83747F0

	.align 2
gFieldEffectObjectTemplate_Dust: @ 8374804
	spr_template 0xFFFF, 0x1004, gFieldObjectBaseOam_16x8, gFieldEffectObjectImageAnimTable_Dust, gFieldEffectObjectPicTable_Dust, gDummySpriteAffineAnimTable, sub_81287C4

	.align 2
gFieldEffectObjectPicTable_JumpTallGrass: @ 837481C
	obj_frame_tiles gFieldEffectObjectPic_JumpTallGrass_0, 0x40
	obj_frame_tiles gFieldEffectObjectPic_JumpTallGrass_1, 0x40
	obj_frame_tiles gFieldEffectObjectPic_JumpTallGrass_2, 0x40
	obj_frame_tiles gFieldEffectObjectPic_JumpTallGrass_3, 0x40

	.align 2
gFieldEffectObjectImageAnim_837483C: @ 837483C
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_JumpTallGrass: @ 8374850
	.4byte gFieldEffectObjectImageAnim_837483C

	.align 2
gFieldEffectObjectTemplate_JumpTallGrass: @ 8374854
	spr_template 0xFFFF, 0x1005, gFieldObjectBaseOam_16x8, gFieldEffectObjectImageAnimTable_JumpTallGrass, gFieldEffectObjectPicTable_JumpTallGrass, gDummySpriteAffineAnimTable, sub_81287C4

	.align 2
gFieldEffectObjectPicTable_SandFootprints: @ 837486C
	obj_frame_tiles gFieldEffectObjectPic_SandFootprints_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_SandFootprints_1, 0x80

	.align 2
gFieldEffectObjectImageAnim_837487C: @ 837487C
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_8374884: @ 8374884
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_837488C: @ 837488C
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_8374894: @ 8374894
	obj_image_anim_frame 1, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_SandFootprints: @ 837489C
	.4byte gFieldEffectObjectImageAnim_837487C
	.4byte gFieldEffectObjectImageAnim_837487C
	.4byte gFieldEffectObjectImageAnim_8374884
	.4byte gFieldEffectObjectImageAnim_837488C
	.4byte gFieldEffectObjectImageAnim_8374894

	.align 2
gFieldEffectObjectTemplate_SandFootprints: @ 83748B0
	spr_template 0xFFFF, 0x1004, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_SandFootprints, gFieldEffectObjectPicTable_SandFootprints, gDummySpriteAffineAnimTable, sub_8127584

	.align 2
gFieldEffectObjectPicTable_DeepSandFootprints: @ 83748C8
	obj_frame_tiles gFieldEffectObjectPic_DeepSandFootprints_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_DeepSandFootprints_1, 0x80

	.align 2
gFieldEffectObjectImageAnim_83748D8: @ 83748D8
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_83748E0: @ 83748E0
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_83748E8: @ 83748E8
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_83748F0: @ 83748F0
	obj_image_anim_frame 1, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_DeepSandFootprints: @ 83748F8
	.4byte gFieldEffectObjectImageAnim_83748D8
	.4byte gFieldEffectObjectImageAnim_83748D8
	.4byte gFieldEffectObjectImageAnim_83748E0
	.4byte gFieldEffectObjectImageAnim_83748E8
	.4byte gFieldEffectObjectImageAnim_83748F0

	.align 2
gFieldEffectObjectTemplate_DeepSandFootprints: @ 837490C
	spr_template 0xFFFF, 0x1004, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_DeepSandFootprints, gFieldEffectObjectPicTable_DeepSandFootprints, gDummySpriteAffineAnimTable, sub_8127584

	.align 2
gFieldEffectObjectPicTable_BikeTireTracks: @ 8374924
	obj_frame_tiles gFieldEffectObjectPic_BikeTireTracks_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_BikeTireTracks_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_BikeTireTracks_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_BikeTireTracks_3, 0x80

	.align 2
gFieldEffectObjectImageAnim_8374944: @ 8374944
	obj_image_anim_frame 2, 1
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_837494C: @ 837494C
	obj_image_anim_frame 2, 1
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_8374954: @ 8374954
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_837495C: @ 837495C
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_8374964: @ 8374964
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_837496C: @ 837496C
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_8374974: @ 8374974
	obj_image_anim_frame 3, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_837497C: @ 837497C
	obj_image_anim_frame 3, 1
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_BikeTireTracks: @ 8374984
	.4byte gFieldEffectObjectImageAnim_8374944
	.4byte gFieldEffectObjectImageAnim_8374944
	.4byte gFieldEffectObjectImageAnim_837494C
	.4byte gFieldEffectObjectImageAnim_8374954
	.4byte gFieldEffectObjectImageAnim_837495C
	.4byte gFieldEffectObjectImageAnim_8374964
	.4byte gFieldEffectObjectImageAnim_837496C
	.4byte gFieldEffectObjectImageAnim_8374974
	.4byte gFieldEffectObjectImageAnim_837497C

	.align 2
gFieldEffectObjectTemplate_BikeTireTracks: @ 83749A8
	spr_template 0xFFFF, 0x1004, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_BikeTireTracks, gFieldEffectObjectPicTable_BikeTireTracks, gDummySpriteAffineAnimTable, sub_8127584

	.align 2
gFieldEffectObjectPicTable_JumpBigSplash: @ 83749C0
	obj_frame_tiles gFieldEffectObjectPic_JumpBigSplash_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_JumpBigSplash_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_JumpBigSplash_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_JumpBigSplash_3, 0x80

	.align 2
gFieldEffectObjectImageAnim_83749E0: @ 83749E0
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_JumpBigSplash: @ 83749F4
	.4byte gFieldEffectObjectImageAnim_83749E0

	.align 2
gFieldEffectObjectTemplate_JumpBigSplash: @ 83749F8
	spr_template 0xFFFF, 0x1004, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_JumpBigSplash, gFieldEffectObjectPicTable_JumpBigSplash, gDummySpriteAffineAnimTable, sub_81287C4

	.align 2
gFieldEffectObjectPicTable_Splash: @ 8374A10
	obj_frame_tiles gFieldEffectObjectPic_Splash_0, 0x40
	obj_frame_tiles gFieldEffectObjectPic_Splash_1, 0x40

	.align 2
gFieldEffectObjectImageAnim_8374A20: @ 8374A20
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_8374A2C: @ 8374A2C
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
gFieldEffectObjectImageAnimTable_Splash: @ 8374A50
	.4byte gFieldEffectObjectImageAnim_8374A20
	.4byte gFieldEffectObjectImageAnim_8374A2C

	.align 2
gFieldEffectObjectTemplate_Splash: @ 8374A58
	spr_template 0xFFFF, 0x1004, gFieldObjectBaseOam_16x8, gFieldEffectObjectImageAnimTable_Splash, gFieldEffectObjectPicTable_Splash, gDummySpriteAffineAnimTable, sub_81276B4

	.align 2
gFieldEffectObjectPicTable_JumpSmallSplash: @ 8374A70
	obj_frame_tiles gFieldEffectObjectPic_JumpSmallSplash_0, 0x40
	obj_frame_tiles gFieldEffectObjectPic_JumpSmallSplash_1, 0x40
	obj_frame_tiles gFieldEffectObjectPic_JumpSmallSplash_2, 0x40

	.align 2
gFieldEffectObjectImageAnim_8374A88: @ 8374A88
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_JumpSmallSplash: @ 8374A98
	.4byte gFieldEffectObjectImageAnim_8374A88

	.align 2
gFieldEffectObjectTemplate_JumpSmallSplash: @ 8374A9C
	spr_template 0xFFFF, 0x1004, gFieldObjectBaseOam_16x8, gFieldEffectObjectImageAnimTable_JumpSmallSplash, gFieldEffectObjectPicTable_JumpSmallSplash, gDummySpriteAffineAnimTable, sub_81287C4

	.align 2
gFieldEffectObjectPicTable_LongGrass: @ 8374AB4
	obj_frame_tiles gFieldEffectObjectPic_LongGrass_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_LongGrass_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_LongGrass_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_LongGrass_3, 0x80

	.align 2
gFieldEffectObjectImageAnim_8374AD4: @ 8374AD4
	obj_image_anim_frame 1, 3
	obj_image_anim_frame 2, 3
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_LongGrass: @ 8374AF4
	.4byte gFieldEffectObjectImageAnim_8374AD4

	.align 2
gFieldEffectObjectTemplate_LongGrass: @ 8374AF8
	spr_template 0xFFFF, 0x1005, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_LongGrass, gFieldEffectObjectPicTable_LongGrass, gDummySpriteAffineAnimTable, unc_grass_tall

	.align 2
gFieldEffectObjectPicTable_JumpLongGrass: @ 8374B10
	obj_frame_tiles gFieldEffectObjectPic_JumpLongGrass_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_JumpLongGrass_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_JumpLongGrass_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_JumpLongGrass_3, 0x80
	obj_frame_tiles gFieldEffectObjectPic_JumpLongGrass_4, 0x80
	obj_frame_tiles gFieldEffectObjectPic_JumpLongGrass_5, 0x80

	.align 2
gFieldEffectObjectImageAnim_8374B40: @ 8374B40
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 5, 8
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_JumpLongGrass: @ 8374B5C
	.4byte gFieldEffectObjectImageAnim_8374B40

	.align 2
gFieldEffectObjectTemplate_JumpLongGrass: @ 8374B60
	spr_template 0xFFFF, 0x1005, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_JumpLongGrass, gFieldEffectObjectPicTable_JumpLongGrass, gDummySpriteAffineAnimTable, sub_81287C4

	.align 2
gFieldEffectObjectPicTable_Unknown17: @ 8374B78
	obj_frame_tiles gFieldEffectObjectPic_JumpLongGrass_5, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown17_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown17_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown17_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown17_3, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown17_4, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown17_5, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown17_6, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown17_7, 0x80

	.align 2
gFieldEffectObjectImageAnim_8374BC0: @ 8374BC0
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
gFieldEffectObjectImageAnimTable_Unknown17: @ 8374BE8
	.4byte gFieldEffectObjectImageAnim_8374BC0

	.align 2
gFieldEffectObjectTemplate_Unknown17: @ 8374BEC
	spr_template 0xFFFF, 0x1005, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_Unknown17, gFieldEffectObjectPicTable_Unknown17, gDummySpriteAffineAnimTable, sub_8128800

	.align 2
gFieldEffectObjectPicTable_Unknown18: @ 8374C04
	obj_frame_tiles gFieldEffectObjectPic_Unknown18_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown18_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown18_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown18_3, 0x80

	.align 2
gFieldEffectObjectImageAnim_8374C24: @ 8374C24
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_jump 0

	.align 2
gFieldEffectObjectImageAnimTable_Unknown18: @ 8374C40
	.4byte gFieldEffectObjectImageAnim_8374C24

	.align 2
gFieldEffectObjectTemplate_Unknown18: @ 8374C44
	spr_template 0xFFFF, 0x1005, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_Unknown18, gFieldEffectObjectPicTable_Unknown18, gDummySpriteAffineAnimTable, sub_8128800

	.align 2
gFieldEffectObjectPicTable_Unknown19: @ 8374C5C
	obj_frame_tiles gFieldEffectObjectPic_Unknown19_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown19_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown19_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown19_3, 0x80

	.align 2
gFieldEffectObjectImageAnim_8374C7C: @ 8374C7C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_jump 0

	.align 2
gFieldEffectObjectImageAnimTable_Unknown19: @ 8374C90
	.4byte gFieldEffectObjectImageAnim_8374C7C

	.align 2
gFieldEffectObjectTemplate_Unknown19: @ 8374C94
	spr_template 0xFFFF, 0x1004, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_Unknown19, gFieldEffectObjectPicTable_Unknown19, gDummySpriteAffineAnimTable, sub_8128800

	.align 2
gFieldEffectObjectPicTable_Unknown29: @ 8374CAC
	obj_frame_tiles gFieldEffectObjectPic_Unknown29_0, 0x40
	obj_frame_tiles gFieldEffectObjectPic_Unknown29_1, 0x40
	obj_frame_tiles gFieldEffectObjectPic_Unknown29_2, 0x40

	.align 2
gFieldEffectObjectImageAnim_8374CC4: @ 8374CC4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_Unknown29: @ 8374CD4
	.4byte gFieldEffectObjectImageAnim_8374CC4

	.align 2
gFieldEffectObjectTemplate_Unknown29: @ 8374CD8
	spr_template 0xFFFF, 0x1004, gFieldObjectBaseOam_16x8, gFieldEffectObjectImageAnimTable_Unknown29, gFieldEffectObjectPicTable_Unknown29, gDummySpriteAffineAnimTable, sub_81282E0

	.align 2
gFieldEffectObjectPicTable_Unknown20: @ 8374CF0
	obj_frame_tiles gFieldEffectObjectPic_Unknown20_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown20_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown20_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown20_3, 0x80

	.align 2
gFieldEffectObjectImageAnim_8374D10: @ 8374D10
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_jump 0

	.align 2
gFieldEffectObjectImageAnimTable_Unknown20: @ 8374D2C
	.4byte gFieldEffectObjectImageAnim_8374D10

	.align 2
gFieldEffectObjectTemplate_Unknown20: @ 8374D30
	spr_template 0xFFFF, 0x1004, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_Unknown20, gFieldEffectObjectPicTable_Unknown20, gDummySpriteAffineAnimTable, sub_8128800

	.align 2
gFieldEffectObjectRotScalAnim_8374D48: @ 8374D48
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
gFieldEffectObjectRotScalAnim_8374D98: @ 8374D98
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
gFieldEffectObjectRotScalAnimTable_Unknown21: @ 8374DE8
	.4byte gFieldEffectObjectRotScalAnim_8374D48
	.4byte gFieldEffectObjectRotScalAnim_8374D98

	.align 2
gFieldEffectObjectTemplate_Unknown21: @ 8374DF0
	spr_template 0x0, 0xFFFF, gDummyOamData, gDummySpriteAnimTable, NULL, gFieldEffectObjectRotScalAnimTable_Unknown21, SpriteCallbackDummy

	.align 2
gFieldEffectObjectPicTable_BerryTreeGrowthSparkle: @ 8374E08
	obj_frame_tiles gFieldEffectObjectPic_BerryTreeGrowthSparkle_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_BerryTreeGrowthSparkle_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_BerryTreeGrowthSparkle_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_BerryTreeGrowthSparkle_3, 0x80
	obj_frame_tiles gFieldEffectObjectPic_BerryTreeGrowthSparkle_4, 0x80
	obj_frame_tiles gFieldEffectObjectPic_BerryTreeGrowthSparkle_5, 0x80

	.align 2
gFieldEffectObjectImageAnim_8374E38: @ 8374E38
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
gFieldEffectObjectImageAnimTable_BerryTreeGrowthSparkle: @ 8374E8C
	.4byte gFieldEffectObjectImageAnim_8374E38

	.align 2
gFieldEffectObjectTemplate_BerryTreeGrowthSparkle: @ 8374E90
	spr_template 0xFFFF, 0xFFFF, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_BerryTreeGrowthSparkle, gFieldEffectObjectPicTable_BerryTreeGrowthSparkle, gDummySpriteAffineAnimTable, sub_8128800

	.align 2
gFieldEffectObjectPicTable_TreeDisguise: @ 8374EA8
	obj_frame_tiles gFieldEffectObjectPic_TreeDisguise_0, 0x100
	obj_frame_tiles gFieldEffectObjectPic_TreeDisguise_1, 0x100
	obj_frame_tiles gFieldEffectObjectPic_TreeDisguise_2, 0x100
	obj_frame_tiles gFieldEffectObjectPic_TreeDisguise_3, 0x100
	obj_frame_tiles gFieldEffectObjectPic_TreeDisguise_4, 0x100
	obj_frame_tiles gFieldEffectObjectPic_TreeDisguise_5, 0x100
	obj_frame_tiles gFieldEffectObjectPic_TreeDisguise_6, 0x100

	.align 2
gFieldEffectObjectImageAnim_8374EE0: @ 8374EE0
	obj_image_anim_frame 0, 16
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_8374EE8: @ 8374EE8
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_TreeDisguise: @ 8374F08
	.4byte gFieldEffectObjectImageAnim_8374EE0
	.4byte gFieldEffectObjectImageAnim_8374EE8

	.align 2
gFieldEffectObjectTemplate_TreeDisguise: @ 8374F10
	spr_template 0xFFFF, 0xFFFF, gFieldObjectBaseOam_16x32, gFieldEffectObjectImageAnimTable_TreeDisguise, gFieldEffectObjectPicTable_TreeDisguise, gDummySpriteAffineAnimTable, sub_81285AC

	.align 2
gFieldEffectObjectPicTable_MountainDisguise: @ 8374F28
	obj_frame_tiles gFieldEffectObjectPic_MountainDisguise_0, 0x100
	obj_frame_tiles gFieldEffectObjectPic_MountainDisguise_1, 0x100
	obj_frame_tiles gFieldEffectObjectPic_MountainDisguise_2, 0x100
	obj_frame_tiles gFieldEffectObjectPic_MountainDisguise_3, 0x100
	obj_frame_tiles gFieldEffectObjectPic_MountainDisguise_4, 0x100
	obj_frame_tiles gFieldEffectObjectPic_MountainDisguise_5, 0x100
	obj_frame_tiles gFieldEffectObjectPic_MountainDisguise_6, 0x100

	.align 2
gFieldEffectObjectImageAnim_8374F60: @ 8374F60
	obj_image_anim_frame 0, 16
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnim_8374F68: @ 8374F68
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_MountainDisguise: @ 8374F88
	.4byte gFieldEffectObjectImageAnim_8374F60
	.4byte gFieldEffectObjectImageAnim_8374F68

	.align 2
gFieldEffectObjectTemplate_MountainDisguise: @ 8374F90
	spr_template 0xFFFF, 0xFFFF, gFieldObjectBaseOam_16x32, gFieldEffectObjectImageAnimTable_MountainDisguise, gFieldEffectObjectPicTable_MountainDisguise, gDummySpriteAffineAnimTable, sub_81285AC

	.align 2
gFieldEffectObjectPicTable_SandDisguise: @ 8374FA8
	obj_frame_tiles gFieldEffectObjectPic_SandDisguise_0, 0x100
	obj_frame_tiles gFieldEffectObjectPic_SandDisguise_1, 0x100
	obj_frame_tiles gFieldEffectObjectPic_SandDisguise_2, 0x100
	obj_frame_tiles gFieldEffectObjectPic_SandDisguise_3, 0x100
	obj_frame_tiles gFieldEffectObjectPic_SandDisguise_4, 0x100
	obj_frame_tiles gFieldEffectObjectPic_SandDisguise_5, 0x100
	obj_frame_tiles gFieldEffectObjectPic_SandDisguise_6, 0x100

	.align 2
gFieldEffectObjectTemplate_SandDisguise: @ 8374FE0
	spr_template 0xFFFF, 0xFFFF, gFieldObjectBaseOam_16x32, gFieldEffectObjectImageAnimTable_TreeDisguise, gFieldEffectObjectPicTable_SandDisguise, gDummySpriteAffineAnimTable, sub_81285AC

	.align 2
gFieldEffectObjectPicTable_Bird: @ 8374FF8
	obj_frame_tiles gFieldEffectObjectPic_Bird, 0x200

	.align 2
gFieldEffectObjectImageAnim_8375000: @ 8375000
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_Bird: @ 8375008
	.4byte gFieldEffectObjectImageAnim_8375000

	.align 2
gFieldEffectObjectTemplate_Bird: @ 837500C
	spr_template 0xFFFF, 0xFFFF, gFieldObjectBaseOam_32x32, gFieldEffectObjectImageAnimTable_Bird, gFieldEffectObjectPicTable_Bird, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gFieldEffectObjectPicTable_ShortGrass: @ 8375024
	obj_frame_tiles gFieldEffectObjectPic_ShortGrass_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_ShortGrass_1, 0x80

	.align 2
gFieldEffectObjectImageAnim_8375034: @ 8375034
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_ShortGrass: @ 8375040
	.4byte gFieldEffectObjectImageAnim_8375034

	.align 2
gFieldEffectObjectTemplate_ShortGrass: @ 8375044
	spr_template 0xFFFF, 0x1005, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_ShortGrass, gFieldEffectObjectPicTable_ShortGrass, gDummySpriteAffineAnimTable, sub_8127334

	.align 2
gFieldEffectObjectPicTable_HotSpringsWater: @ 837505C
	obj_frame_tiles gFieldEffectObjectPic_HotSpringsWater, 0x80

	.align 2
gFieldEffectObjectImageAnim_8375064: @ 8375064
	obj_image_anim_frame 0, 4
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_HotSpringsWater: @ 837506C
	.4byte gFieldEffectObjectImageAnim_8375064

	.align 2
gFieldEffectObjectTemplate_HotSpringsWater: @ 8375070
	spr_template 0xFFFF, 0x1005, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_HotSpringsWater, gFieldEffectObjectPicTable_HotSpringsWater, gDummySpriteAffineAnimTable, sub_8127A7C

	.align 2
gFieldEffectObjectPicTable_PopOutOfAsh: @ 8375088
	obj_frame_tiles gFieldEffectObjectPic_PopOutOfAsh_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_PopOutOfAsh_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_PopOutOfAsh_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_PopOutOfAsh_3, 0x80
	obj_frame_tiles gFieldEffectObjectPic_PopOutOfAsh_4, 0x80

	.align 2
gFieldEffectObjectImageAnim_83750B0: @ 83750B0
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_frame 2, 6
	obj_image_anim_frame 3, 6
	obj_image_anim_frame 4, 6
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_PopOutOfAsh: @ 83750C8
	.4byte gFieldEffectObjectImageAnim_83750B0

	.align 2
gFieldEffectObjectTemplate_PopOutOfAsh: @ 83750CC
	spr_template 0xFFFF, 0x100D, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_PopOutOfAsh, gFieldEffectObjectPicTable_PopOutOfAsh, gDummySpriteAffineAnimTable, sub_808788C

	.align 2
gFieldEffectObjectPaletteInfo2:: @ 83750E4
	obj_pal gFieldEffectObjectPalette2, 0x100D

	.align 2
gFieldEffectObjectPicTable_Unknown33: @ 83750EC
	obj_frame_tiles gFieldEffectObjectPic_Unknown33_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown33_1, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown33_2, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown33_3, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown33_4, 0x80

	.align 2
gFieldEffectObjectImageAnim_8375114: @ 8375114
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_frame 2, 6
	obj_image_anim_frame 3, 6
	obj_image_anim_frame 4, 6
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_Unknown33: @ 837512C
	.4byte gFieldEffectObjectImageAnim_8375114

	.align 2
gFieldEffectObjectTemplate_Unknown33: @ 8375130
	spr_template 0xFFFF, 0x100D, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_Unknown33, gFieldEffectObjectPicTable_Unknown33, gDummySpriteAffineAnimTable, sub_8087638

	.align 2
gFieldEffectObjectPicTable_Bubbles: @ 8375148
	obj_frame_tiles gFieldEffectObjectPic_Bubbles_0, 0x100
	obj_frame_tiles gFieldEffectObjectPic_Bubbles_1, 0x100
	obj_frame_tiles gFieldEffectObjectPic_Bubbles_2, 0x100
	obj_frame_tiles gFieldEffectObjectPic_Bubbles_3, 0x100
	obj_frame_tiles gFieldEffectObjectPic_Bubbles_4, 0x100
	obj_frame_tiles gFieldEffectObjectPic_Bubbles_5, 0x100
	obj_frame_tiles gFieldEffectObjectPic_Bubbles_6, 0x100
	obj_frame_tiles gFieldEffectObjectPic_Bubbles_7, 0x100

	.align 2
gFieldEffectObjectImageAnim_8375188: @ 8375188
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
gFieldEffectObjectImageAnimTable_Bubbles: @ 83751AC
	.4byte gFieldEffectObjectImageAnim_8375188

	.align 2
gFieldEffectObjectTemplate_Bubbles: @ 83751B0
	spr_template 0xFFFF, 0x1004, gFieldObjectBaseOam_16x32, gFieldEffectObjectImageAnimTable_Bubbles, gFieldEffectObjectPicTable_Bubbles, gDummySpriteAffineAnimTable, sub_8128410

	.align 2
gFieldEffectObjectPicTable_Unknown35: @ 83751C8
	obj_frame_tiles gFieldEffectObjectPic_Unknown35_0, 0x80
	obj_frame_tiles gFieldEffectObjectPic_Unknown35_1, 0x80

	.align 2
gFieldEffectObjectImageAnim_83751D8: @ 83751D8
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gFieldEffectObjectImageAnimTable_Unknown35: @ 83751E8
	.4byte gFieldEffectObjectImageAnim_83751D8

	.align 2
gFieldEffectObjectTemplate_Unknown35: @ 83751EC
	spr_template 0xFFFF, 0x100F, gFieldObjectBaseOam_16x16, gFieldEffectObjectImageAnimTable_Unknown35, gFieldEffectObjectPicTable_Unknown35, gDummySpriteAffineAnimTable, sub_8128774

	.align 2
gFieldEffectObjectPaletteInfo3:: @ 8375204
	obj_pal gFieldEffectObjectPalette3, 0x100F
