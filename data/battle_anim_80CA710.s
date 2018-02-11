	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteAnim_83D61FC:: @ 83D61FC
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 6, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 10, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_frame 14, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D6220:: @ 83D6220
	.4byte gSpriteAnim_83D61FC

	.align 2
gSleepPowderParticleSpriteTemplate:: @ 83D6224
	spr_template 10067, 10067, gOamData_837DF64, gSpriteAnimTable_83D6220, NULL, gDummySpriteAffineAnimTable, AnimMovePowderParticle

	.align 2
gStunSporeParticleSpriteTemplate:: @ 83D623C
	spr_template 10068, 10068, gOamData_837DF64, gSpriteAnimTable_83D6220, NULL, gDummySpriteAffineAnimTable, AnimMovePowderParticle

	.align 2
gPoisonPowderParticleSpriteTemplate:: @ 83D6254
	spr_template 10065, 10065, gOamData_837DF64, gSpriteAnimTable_83D6220, NULL, gDummySpriteAffineAnimTable, AnimMovePowderParticle

	.align 2
gSpriteAnim_83D626C:: @ 83D626C
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6274:: @ 83D6274
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D627C:: @ 83D627C
	obj_image_anim_frame 2, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6284:: @ 83D6284
	obj_image_anim_frame 3, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D628C:: @ 83D628C
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6294:: @ 83D6294
	obj_image_anim_frame 5, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D629C:: @ 83D629C
	obj_image_anim_frame 6, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D62A4:: @ 83D62A4
	obj_image_anim_frame 7, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D62AC:: @ 83D62AC
	obj_image_anim_frame 8, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D62B4:: @ 83D62B4
	.4byte gSpriteAnim_83D626C
	.4byte gSpriteAnim_83D6274
	.4byte gSpriteAnim_83D627C
	.4byte gSpriteAnim_83D6284
	.4byte gSpriteAnim_83D628C
	.4byte gSpriteAnim_83D6294
	.4byte gSpriteAnim_83D629C

	.align 2
gSpriteAnimTable_83D62D0:: @ 83D62D0
	.4byte gSpriteAnim_83D62A4

	.align 2
gSpriteAnimTable_83D62D4:: @ 83D62D4
	.4byte gSpriteAnim_83D62AC

	.align 2
gSpriteAffineAnim_83D62D8:: @ 83D62D8
	obj_rot_scal_anim_frame 0xFFFB, 0xFFFB, 0, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D62E8:: @ 83D62E8
	.4byte gSpriteAffineAnim_83D62D8

	.align 2
gBattleAnimSpriteTemplate_83D62EC:: @ 83D62EC
	spr_template 10147, 10147, gOamData_837E0AC, gSpriteAnimTable_83D62D4, NULL, gSpriteAffineAnimTable_83D62E8, sub_80CA7B0

	.align 2
gBattleAnimSpriteTemplate_83D6304:: @ 83D6304
	spr_template 10147, 10147, gOamData_837DF24, gSpriteAnimTable_83D62B4, NULL, gDummySpriteAffineAnimTable, sub_80CA800

	.align 2
gSpriteTemplate_83D631C:: @ 83D631C
	spr_template 10147, 10147, gOamData_837DF24, gSpriteAnimTable_83D62D0, NULL, gDummySpriteAffineAnimTable, sub_80CA858

	.align 2
gSpriteAffineAnim_83D6334:: @ 83D6334
	obj_rot_scal_anim_frame 0x140, 0x140, 0, 0
	obj_rot_scal_anim_frame 0xFFF2, 0xFFF2, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D634C:: @ 83D634C
	.4byte gSpriteAffineAnim_83D6334

	.align 2
gBattleAnimSpriteTemplate_83D6350:: @ 83D6350
	spr_template 10235, 10235, gOamData_837DFE4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D634C, sub_80CA7B0

	.align 2
gSpriteAffineAnim_83D6368:: @ 83D6368
	obj_rot_scal_anim_frame 0xFFFB, 0xFFFB, 0, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D6378:: @ 83D6378
	.4byte gSpriteAffineAnim_83D6368

	.align 2
gBattleAnimSpriteTemplate_83D637C:: @ 83D637C
	spr_template 10147, 10147, gOamData_837E0AC, gSpriteAnimTable_83D62D4, NULL, gSpriteAffineAnimTable_83D6378, sub_80CA9A8

	.align 2
gBattleAnimSpriteTemplate_83D6394:: @ 83D6394
	spr_template 10147, 10147, gOamData_837DF24, gSpriteAnimTable_83D62B4, NULL, gDummySpriteAffineAnimTable, sub_80CAA14

	.align 2
gSpriteAnim_83D63AC:: @ 83D63AC
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D63B4:: @ 83D63B4
	obj_image_anim_frame 4, 7
	obj_image_anim_frame 8, 7
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D63C0:: @ 83D63C0
	.4byte gSpriteAnim_83D63AC
	.4byte gSpriteAnim_83D63B4

	.align 2
gBattleAnimSpriteTemplate_83D63C8:: @ 83D63C8
	spr_template 10006, 10006, gOamData_837DF2C, gSpriteAnimTable_83D63C0, NULL, gDummySpriteAffineAnimTable, sub_80CAB18

	.align 2
gSpriteAnim_83D63E0:: @ 83D63E0
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D63E8:: @ 83D63E8
	obj_image_anim_frame 4, 7
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D63F0:: @ 83D63F0
	.4byte gSpriteAnim_83D63E0
	.4byte gSpriteAnim_83D63E8

	.align 2
gBattleAnimSpriteTemplate_83D63F8:: @ 83D63F8
	spr_template 10158, 10158, gOamData_837DF2C, gSpriteAnimTable_83D63F0, NULL, gDummySpriteAffineAnimTable, sub_80CABF8

	.align 2
gSpriteAnim_83D6410:: @ 83D6410
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6418:: @ 83D6418
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6420:: @ 83D6420
	.4byte gSpriteAnim_83D6410

	.align 2
gSpriteAnimTable_83D6424:: @ 83D6424
	.4byte gSpriteAnim_83D6418

	.align 2
gBattleAnimSpriteTemplate_83D6428:: @ 83D6428
	spr_template 10159, 10159, gOamData_837DF2C, gSpriteAnimTable_83D6420, NULL, gDummySpriteAffineAnimTable, sub_80CAD54

	.align 2
gBattleAnimSpriteTemplate_83D6440:: @ 83D6440
	spr_template 10159, 10159, gOamData_837DF24, gSpriteAnimTable_83D6424, NULL, gDummySpriteAffineAnimTable, sub_80CAE20

	.align 2
gSpriteAnim_83D6458:: @ 83D6458
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 20, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83D6484:: @ 83D6484
	obj_image_anim_frame 24, 5
	obj_image_anim_frame 28, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6494:: @ 83D6494
	.4byte gSpriteAnim_83D6458
	.4byte gSpriteAnim_83D6484

	.align 2
gBattleAnimSpriteTemplate_83D649C:: @ 83D649C
	spr_template 10063, 10063, gOamData_837DF2C, gSpriteAnimTable_83D6494, NULL, gDummySpriteAffineAnimTable, sub_80CAED8

	.align 2
gBattleAnimSpriteTemplate_83D64B4:: @ 83D64B4
	spr_template 10063, 10063, gOamData_837DF2C, gSpriteAnimTable_83D6494, NULL, gDummySpriteAffineAnimTable, AnimMoveTwisterParticle

	.align 2
gSpriteAnim_83D64CC:: @ 83D64CC
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D64E0:: @ 83D64E0
	.4byte gSpriteAnim_83D64CC

	.align 2
gBattleAnimSpriteTemplate_83D64E4:: @ 83D64E4
	spr_template 10160, 10160, gOamData_837DF54, gSpriteAnimTable_83D64E0, NULL, gDummySpriteAffineAnimTable, AnimTranslateLinearSingleSineWave

	.align 2
gSpriteAffineAnim_83D64FC:: @ 83D64FC
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D650C:: @ 83D650C
	.4byte gSpriteAffineAnim_83D64FC

	.align 2
gSwiftStarSpriteTemplate:: @ 83D6510
	spr_template 10174, 10174, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D650C, AnimTranslateLinearSingleSineWave

	.align 2
gSpriteAnim_83D6528:: @ 83D6528
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 96, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83D653C:: @ 83D653C
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 96, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6550:: @ 83D6550
	.4byte gSpriteAnim_83D6528
	.4byte gSpriteAnim_83D653C

	.align 2
gSpriteAffineAnim_83D6558:: @ 83D6558
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFF5, 0x0, 0, 6
	obj_rot_scal_anim_frame 0xB, 0x0, 0, 6
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D6578:: @ 83D6578
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xB, 0x0, 0, 6
	obj_rot_scal_anim_frame 0xFFF5, 0x0, 0, 6
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D6598:: @ 83D6598
	.4byte gSpriteAffineAnim_83D6558
	.4byte gSpriteAffineAnim_83D6578

	.align 2
gBattleAnimSpriteTemplate_83D65A0:: @ 83D65A0
	spr_template 10186, 10186, gOamData_837DFBC, gSpriteAnimTable_83D6550, NULL, gSpriteAffineAnimTable_83D6598, sub_80CB25C

	.align 2
gSpriteAffineAnim_83D65B8:: @ 83D65B8
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 0
	obj_rot_scal_anim_frame 0x30, 0x30, 0, 14
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D65D0:: @ 83D65D0
	obj_rot_scal_anim_frame 0xFFF0, 0xFFF0, 0, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D65E0:: @ 83D65E0
	.4byte gSpriteAffineAnim_83D65B8
	.4byte gSpriteAffineAnim_83D65D0

	.align 2
gBattleAnimSpriteTemplate_83D65E8:: @ 83D65E8
	spr_template 10147, 10147, gOamData_837DFEC, gSpriteAnimTable_83D62D4, NULL, gSpriteAffineAnimTable_83D65E0, sub_80CB4CC

	.align 2
gSpriteAnim_83D6600:: @ 83D6600
	obj_image_anim_frame 0, 7
	obj_image_anim_frame 16, 7
	obj_image_anim_frame 32, 7
	obj_image_anim_frame 48, 7
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6614:: @ 83D6614
	obj_image_anim_frame 0, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6628:: @ 83D6628
	obj_image_anim_frame 0, 7
	obj_image_anim_frame 16, 7
	obj_image_anim_frame 32, 7
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6638:: @ 83D6638
	obj_image_anim_frame 0, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6648:: @ 83D6648
	.4byte gSpriteAnim_83D6600
	.4byte gSpriteAnim_83D6614
	.4byte gSpriteAnim_83D6628
	.4byte gSpriteAnim_83D6638

	.align 2
gBattleAnimSpriteTemplate_83D6658:: @ 83D6658
	spr_template 10223, 10223, gOamData_837DF34, gSpriteAnimTable_83D6648, NULL, gDummySpriteAffineAnimTable, sub_80CB59C

	.align 2
gBattleAnimSpriteTemplate_83D6670:: @ 83D6670
	spr_template 10223, 10223, gOamData_837DF34, gSpriteAnimTable_83D6648, NULL, gDummySpriteAffineAnimTable, sub_80CB620

	.align 2
gSpriteAnim_83D6688:: @ 83D6688
	obj_image_anim_frame 3, 3
	obj_image_anim_frame 0, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D6694:: @ 83D6694
	.4byte gSpriteAnim_83D6688

	.align 2
gBattleAnimSpriteTemplate_83D6698:: @ 83D6698
	spr_template 10147, 10147, gOamData_837DF24, gSpriteAnimTable_83D6694, NULL, gDummySpriteAffineAnimTable, sub_80CB768

	.align 2
gSpriteAnim_83D66B0:: @ 83D66B0
	obj_image_anim_frame 0, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D66B8:: @ 83D66B8
	.4byte gSpriteAnim_83D66B0

	.align 2
gSpriteAffineAnim_83D66BC:: @ 83D66BC
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 10
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 20
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 10
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D66DC:: @ 83D66DC
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 2
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 4
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 4
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 2
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D6714:: @ 83D6714
	.4byte gSpriteAffineAnim_83D66BC
	.4byte gSpriteAffineAnim_83D66DC

	.align 2
gBattleAnimSpriteTemplate_83D671C:: @ 83D671C
	spr_template 10224, 10224, gOamData_837DF94, gSpriteAnimTable_83D66B8, NULL, gSpriteAffineAnimTable_83D6714, sub_80CB94C

	.align 2
gBattleAnimSpriteTemplate_83D6734:: @ 83D6734
	spr_template 10224, 10224, gOamData_837DF94, gSpriteAnimTable_83D66B8, NULL, gSpriteAffineAnimTable_83D6714, sub_80CBA28

	.align 2
gSpriteAnim_83D674C:: @ 83D674C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 12, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6760:: @ 83D6760
	.4byte gSpriteAnim_83D674C

	.align 2
gBattleAnimSpriteTemplate_83D6764:: @ 83D6764
	spr_template 10195, 10195, gOamData_837DF2C, gSpriteAnimTable_83D6760, NULL, gDummySpriteAffineAnimTable, sub_80CBAA4

	.align 2
gBattleAnimSpriteTemplate_83D677C:: @ 83D677C
	spr_template 10224, 10224, gOamData_837DF94, gSpriteAnimTable_83D66B8, NULL, gSpriteAffineAnimTable_83D6714, sub_80CBAE8

	.align 2
gSpriteAffineAnim_83D6794:: @ 83D6794
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 3
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D67A4:: @ 83D67A4
	obj_rot_scal_anim_frame 0x0, 0xFFF6, 0, 3
	obj_rot_scal_anim_frame 0x0, 0xFFFA, 0, 3
	obj_rot_scal_anim_frame 0x0, 0xFFFE, 0, 3
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 3
	obj_rot_scal_anim_frame 0x0, 0x2, 0, 3
	obj_rot_scal_anim_frame 0x0, 0x6, 0, 3
	obj_rot_scal_anim_frame 0x0, 0xA, 0, 3
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D67E4:: @ 83D67E4
	.4byte gSpriteAffineAnim_83D6794
	.4byte gSpriteAffineAnim_83D67A4
	.4byte gSpriteAffineAnim_83D66BC
	.4byte gSpriteAffineAnim_83D66DC

	.align 2
gBattleAnimSpriteTemplate_83D67F4:: @ 83D67F4
	spr_template 10224, 10224, gOamData_837DF94, gSpriteAnimTable_83D66B8, NULL, gSpriteAffineAnimTable_83D67E4, sub_80CBBF0

gUnknown_083D680C:: @ 83D680C
	.byte   5, 24,   1
	.byte   0,  4,   0
	.byte   8, 16,  -1
	.byte   0,  2,   0
	.byte   8, 16,   1
	.byte   0,  2,   0
	.byte   8, 16,   1
	.byte   0,  2,   0
	.byte   8, 16,   1
	.byte   0, 16,   0
	.byte   0,  0, 127

	.align 2
gSpriteAnim_83D6830:: @ 83D6830
	obj_image_anim_frame 28, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6838:: @ 83D6838
	obj_image_anim_frame 32, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6840:: @ 83D6840
	obj_image_anim_frame 20, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6848:: @ 83D6848
	obj_image_anim_frame 28, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6850:: @ 83D6850
	obj_image_anim_frame 16, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6858:: @ 83D6858
	obj_image_anim_frame 16, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6860:: @ 83D6860
	obj_image_anim_frame 28, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6868:: @ 83D6868
	.4byte gSpriteAnim_83D6830
	.4byte gSpriteAnim_83D6838
	.4byte gSpriteAnim_83D6840
	.4byte gSpriteAnim_83D6848
	.4byte gSpriteAnim_83D6850
	.4byte gSpriteAnim_83D6858
	.4byte gSpriteAnim_83D6860

	.align 2
gSpriteTemplate_83D6884:: @ 83D6884
	spr_template 10063, 10063, gOamData_837DF2C, gSpriteAnimTable_83D6868, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteAffineAnim_83D689C:: @ 83D689C
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D68B4:: @ 83D68B4
	.4byte gSpriteAffineAnim_83D689C

	.align 2
gBattleAnimSpriteTemplate_83D68B8:: @ 83D68B8
	spr_template 10159, 10159, gOamData_837DF24, gSpriteAnimTable_83D6424, NULL, gDummySpriteAffineAnimTable, sub_80CC474

	.align 2
gBattleAnimSpriteTemplate_83D68D0:: @ 83D68D0
	spr_template 10159, 10159, gOamData_837DF8C, gSpriteAnimTable_83D6420, NULL, gSpriteAffineAnimTable_83D68B4, sub_80CC474

	.align 2
gSpriteAffineAnim_83D68E8:: @ 83D68E8
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -10, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnim_83D6900:: @ 83D6900
	obj_rot_scal_anim_frame 0xC0, 0xC0, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -12, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnim_83D6918:: @ 83D6918
	obj_rot_scal_anim_frame 0x8F, 0x8F, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -15, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D6930:: @ 83D6930
	.4byte gSpriteAffineAnim_83D68E8

	.align 2
gSpriteAffineAnimTable_83D6934:: @ 83D6934
	.4byte gSpriteAffineAnim_83D6900

	.align 2
gSpriteAffineAnimTable_83D6938:: @ 83D6938
	.4byte gSpriteAffineAnim_83D6918

	.align 2
gBattleAnimSpriteTemplate_83D693C:: @ 83D693C
	spr_template 10271, 10271, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D6930, sub_80CC474

	.align 2
gBattleAnimSpriteTemplate_83D6954:: @ 83D6954
	spr_template 10271, 10271, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D6934, sub_80CC474

	.align 2
gBattleAnimSpriteTemplate_83D696C:: @ 83D696C
	spr_template 10271, 10271, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D6938, sub_80CC474

	.align 1
gUnknown_083D6984:: @ 83D6984
	.2byte 0x1F
	.2byte 0x27F
	.2byte 0x3FF
	.2byte 0x3E0
	.2byte 0x7DC5
	.2byte 0x7D56
	.2byte 0x7EB6

	.align 2
gBattleAnimSpriteTemplate_83D6994:: @ 83D6994
	spr_template 10266, 10266, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CC6CC

	.align 2
gSpriteAnim_83D69AC:: @ 83D69AC
	obj_image_anim_frame 64, 3
	obj_image_anim_frame 80, 3
	obj_image_anim_frame 96, 3
	obj_image_anim_frame 112, 6
	obj_image_anim_end

	.align 2
gSpriteAnim_83D69C0:: @ 83D69C0
	obj_image_anim_frame 64, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 80, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 96, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 112, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D69D4:: @ 83D69D4
	.4byte gSpriteAnim_83D69AC
	.4byte gSpriteAnim_83D69C0

	.align 2
gBattleAnimSpriteTemplate_83D69DC:: @ 83D69DC
	spr_template 10056, 10056, gOamData_837DF34, gSpriteAnimTable_83D69D4, NULL, gDummySpriteAffineAnimTable, sub_80CC884

	.align 2
gBattleAnimSpriteTemplate_83D69F4:: @ 83D69F4
	spr_template 10287, 10287, gOamData_837DF34, gSpriteAnimTable_83D69D4, NULL, gDummySpriteAffineAnimTable, sub_80CC884

	.align 2
gSpriteAnim_83D6A0C:: @ 83D6A0C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_frame 64, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6A24:: @ 83D6A24
	.4byte gSpriteAnim_83D6A0C

	.align 2
gSpriteTemplate_83D6A28:: @ 83D6A28
	spr_template 10021, 10021, gOamData_837DF34, gSpriteAnimTable_83D6A24, NULL, gDummySpriteAffineAnimTable, sub_80CC82C

	.align 2
gSpriteTemplate_83D6A40:: @ 83D6A40
	spr_template 10022, 10022, gOamData_837DF34, gSpriteAnimTable_83D6A24, NULL, gDummySpriteAffineAnimTable, sub_80CC82C

	.align 2
gSpriteAffineAnim_83D6A58:: @ 83D6A58
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D6A68:: @ 83D6A68
	obj_rot_scal_anim_frame 0x100, 0x100, 32, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D6A78:: @ 83D6A78
	obj_rot_scal_anim_frame 0x100, 0x100, 64, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D6A88:: @ 83D6A88
	obj_rot_scal_anim_frame 0x100, 0x100, 96, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D6A98:: @ 83D6A98
	obj_rot_scal_anim_frame 0x100, 0x100, -128, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D6AA8:: @ 83D6AA8
	obj_rot_scal_anim_frame 0x100, 0x100, -96, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D6AB8:: @ 83D6AB8
	obj_rot_scal_anim_frame 0x100, 0x100, -64, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D6AC8:: @ 83D6AC8
	obj_rot_scal_anim_frame 0x100, 0x100, -32, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D6AD8:: @ 83D6AD8
	.4byte gSpriteAffineAnim_83D6A58
	.4byte gSpriteAffineAnim_83D6A68
	.4byte gSpriteAffineAnim_83D6A78
	.4byte gSpriteAffineAnim_83D6A88
	.4byte gSpriteAffineAnim_83D6A98
	.4byte gSpriteAffineAnim_83D6AA8
	.4byte gSpriteAffineAnim_83D6AB8
	.4byte gSpriteAffineAnim_83D6AC8

	.align 2
gSpriteTemplate_83D6AF8:: @ 83D6AF8
	spr_template 10143, 10143, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D6AD8, sub_80CC8C8

	.align 2
gSpriteAnim_83D6B10:: @ 83D6B10
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6B24:: @ 83D6B24
	.4byte gSpriteAnim_83D6B10

	.align 2
gBattleAnimSpriteTemplate_83D6B28:: @ 83D6B28
	spr_template 10138, 10138, gOamData_837E054, gSpriteAnimTable_83D6B24, NULL, gDummySpriteAffineAnimTable, sub_80CC914

	.align 2
gBattleAnimSpriteTemplate_83D6B40:: @ 83D6B40
	spr_template 10138, 10138, gOamData_837E054, gSpriteAnimTable_83D6B24, NULL, gDummySpriteAffineAnimTable, sub_80CC9BC

	.align 2
gSpriteAnim_83D6B58:: @ 83D6B58
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6B60:: @ 83D6B60
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6B68:: @ 83D6B68
	obj_image_anim_frame 8, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6B70:: @ 83D6B70
	obj_image_anim_frame 12, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6B78:: @ 83D6B78
	obj_image_anim_frame 16, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6B80:: @ 83D6B80
	obj_image_anim_frame 20, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6B88:: @ 83D6B88
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6B90:: @ 83D6B90
	obj_image_anim_frame 4, 1, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6B98:: @ 83D6B98
	obj_image_anim_frame 8, 1, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6BA0:: @ 83D6BA0
	obj_image_anim_frame 12, 1, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6BA8:: @ 83D6BA8
	.4byte gSpriteAnim_83D6B58
	.4byte gSpriteAnim_83D6B60
	.4byte gSpriteAnim_83D6B68
	.4byte gSpriteAnim_83D6B70
	.4byte gSpriteAnim_83D6B78
	.4byte gSpriteAnim_83D6B80
	.4byte gSpriteAnim_83D6B88
	.4byte gSpriteAnim_83D6B90
	.4byte gSpriteAnim_83D6B98
	.4byte gSpriteAnim_83D6BA0

	.align 2
gSpriteTemplate_83D6BD0:: @ 83D6BD0
	spr_template 10072, 10072, gOamData_837DF2C, gSpriteAnimTable_83D6BA8, NULL, gDummySpriteAffineAnimTable, sub_80CCC50

	.align 2
gBattleAnimSpriteTemplate_83D6BE8:: @ 83D6BE8
	spr_template 10280, 10280, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CCD24

	.align 2
gSpriteAffineAnim_83D6C00:: @ 83D6C00
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D6C10:: @ 83D6C10
	obj_rot_scal_anim_frame 0x0, 0x0, 2, 12
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 6
	obj_rot_scal_anim_frame 0x0, 0x0, -2, 24
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 6
	obj_rot_scal_anim_frame 0x0, 0x0, 2, 12
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D6C40:: @ 83D6C40
	.4byte gSpriteAffineAnim_83D6C00
	.4byte gSpriteAffineAnim_83D6C10

	.align 2
gBattleAnimSpriteTemplate_83D6C48:: @ 83D6C48
	spr_template 10099, 10099, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D6C40, sub_80CCF04

	.align 2
gSpriteAnim_83D6C60:: @ 83D6C60
	obj_image_anim_frame 0, 7
	obj_image_anim_frame 16, 7
	obj_image_anim_frame 32, 7
	obj_image_anim_frame 48, 7
	obj_image_anim_frame 64, 7
	obj_image_anim_frame 80, 7
	obj_image_anim_frame 96, 7
	obj_image_anim_frame 112, 7
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D6C84:: @ 83D6C84
	.4byte gSpriteAnim_83D6C60

	.align 2
gBattleAnimSpriteTemplate_83D6C88:: @ 83D6C88
	spr_template 10049, 10049, gOamData_837DF34, gSpriteAnimTable_83D6C84, NULL, gDummySpriteAffineAnimTable, sub_80CD140

	.align 2
gBattleAnimSpriteTemplate_83D6CA0:: @ 83D6CA0
	spr_template 10049, 10049, gOamData_837DF34, gSpriteAnimTable_83D6C84, NULL, gDummySpriteAffineAnimTable, sub_80CD190

	.align 2
gSpriteAnim_83D6CB8:: @ 83D6CB8
	obj_image_anim_frame 0, 10
	obj_image_anim_frame 4, 10
	obj_image_anim_frame 8, 10
	obj_image_anim_frame 12, 10
	obj_image_anim_frame 16, 26
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 20, 5
	obj_image_anim_frame 24, 15
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6CDC:: @ 83D6CDC
	obj_image_anim_frame 0, 10, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 4, 10, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 10, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 12, 10, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 26, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 20, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 24, 15, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6D00:: @ 83D6D00
	.4byte gSpriteAnim_83D6CB8
	.4byte gSpriteAnim_83D6CDC

	.align 2
gSpriteTemplate_83D6D08:: @ 83D6D08
	spr_template 10032, 10032, gOamData_837DF2C, gSpriteAnimTable_83D6D00, NULL, gDummySpriteAffineAnimTable, sub_80CD274

	.align 2
gSpriteAnim_83D6D20:: @ 83D6D20
	obj_image_anim_frame 0, 40
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6D28:: @ 83D6D28
	.4byte gSpriteAnim_83D6D20

	.align 2
gSpriteAffineAnim_83D6D2C:: @ 83D6D2C
	obj_rot_scal_anim_frame 0x14, 0x14, -30, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 1, 24
	obj_rot_scal_anim_end

@ unused
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 24
	obj_rot_scal_anim_loop 10

	.align 2
gSpriteAffineAnim_83D6D5C:: @ 83D6D5C
	obj_rot_scal_anim_frame 0x14, 0x14, 30, 0
	obj_rot_scal_anim_frame 0x8, 0x8, -1, 24
	obj_rot_scal_anim_end

@ unused
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 24
	obj_rot_scal_anim_loop 10

	.align 2
gSpriteAffineAnimTable_83D6D8C:: @ 83D6D8C
	.4byte gSpriteAffineAnim_83D6D2C
	.4byte gSpriteAffineAnim_83D6D5C

	.align 2
gBattleAnimSpriteTemplate_83D6D94:: @ 83D6D94
	spr_template 10228, 10228, gOamData_837DF94, gSpriteAnimTable_83D6D28, NULL, gSpriteAffineAnimTable_83D6D8C, sub_80CD328

	.align 2
gBattleAnimSpriteTemplate_83D6DAC:: @ 83D6DAC
	spr_template 10014, 10014, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CD3E0

	.align 2
gBattleAnimSpriteTemplate_83D6DC4:: @ 83D6DC4
	spr_template 10014, 10014, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CD6CC

gUnknown_083D6DDC:: @ 83D6DDC
	.byte  64, 64
	.byte   0,-64
	.byte -64, 64
	.byte  32,-32

	.align 2
gBattleAnimSpriteTemplate_83D6DE4:: @ 83D6DE4
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CD774

	.align 2
gSpriteTemplate_83D6DFC:: @ 83D6DFC
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CD9C4

	.align 2
gSpriteAnim_83D6E14:: @ 83D6E14
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6E28:: @ 83D6E28
	obj_image_anim_frame 48, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6E30:: @ 83D6E30
	.4byte gSpriteAnim_83D6E14
	.4byte gSpriteAnim_83D6E28

	.align 2
gBattleAnimSpriteTemplate_83D6E38:: @ 83D6E38
	spr_template 10183, 10183, gOamData_837DF34, gSpriteAnimTable_83D6E30, NULL, gDummySpriteAffineAnimTable, sub_80CDD74

	.align 2
gBattleAnimSpriteTemplate_83D6E50:: @ 83D6E50
	spr_template 10286, 10286, gOamData_837DF34, gSpriteAnimTable_83D6E30, NULL, gDummySpriteAffineAnimTable, sub_80CDDDC

	.align 2
gBattleAnimSpriteTemplate_83D6E68:: @ 83D6E68
	spr_template 10286, 10286, gOamData_837DF34, gSpriteAnimTable_83D6E30, NULL, gDummySpriteAffineAnimTable, sub_80CDE24

	.align 2
gSpriteAnim_83D6E80:: @ 83D6E80
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 8, 12
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 24, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6E94:: @ 83D6E94
	.4byte gSpriteAnim_83D6E80

	.align 2
gBattleAnimSpriteTemplate_EndureFlame:: @ 83D6E98
	spr_template 10184, 10184, gOamData_837DF74, gSpriteAnimTable_83D6E94, NULL, gDummySpriteAffineAnimTable, sub_80CDF0C

	.align 2
gSpriteAnim_83D6EB0:: @ 83D6EB0
	obj_image_anim_frame 0, 18
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 18
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 18
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 6
	obj_image_anim_frame 48, 18
	obj_image_anim_frame 32, 6
	obj_image_anim_frame 48, 6
	obj_image_anim_frame 64, 18
	obj_image_anim_frame 48, 6
	obj_image_anim_frame 64, 54
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6EEC:: @ 83D6EEC
	.4byte gSpriteAnim_83D6EB0

	.align 2
gBattleAnimSpriteTemplate_83D6EF0:: @ 83D6EF0
	spr_template 10185, 10185, gOamData_837DF34, gSpriteAnimTable_83D6EEC, NULL, gDummySpriteAffineAnimTable, sub_80CDFB0

	.align 2
gBattleAnimSpriteTemplate_83D6F08:: @ 83D6F08
	spr_template 10017, 10017, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_807941C

	.align 2
gSpriteAnim_83D6F20:: @ 83D6F20
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6F38:: @ 83D6F38
	.4byte gSpriteAnim_83D6F20

	.align 2
gBattleAnimSpriteTemplate_83D6F3C:: @ 83D6F3C
	spr_template 10030, 10030, gOamData_837DF34, gSpriteAnimTable_83D6F38, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gSpriteAnim_83D6F54:: @ 83D6F54
	obj_image_anim_frame 3, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6F68:: @ 83D6F68
	.4byte gSpriteAnim_83D6F54

	.align 2
gSpriteAffineAnim_83D6F6C:: @ 83D6F6C
	obj_rot_scal_anim_frame 0x200, 0x200, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D6F7C:: @ 83D6F7C
	.4byte gSpriteAffineAnim_83D6F6C

	.align 2
gBattleAnimSpriteTemplate_83D6F80:: @ 83D6F80
	spr_template 10018, 10018, gOamData_837E104, gSpriteAnimTable_83D6F68, NULL, gSpriteAffineAnimTable_83D6F7C, sub_80CE09C

	.align 2
gSpriteAnim_83D6F98:: @ 83D6F98
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 3, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6FAC:: @ 83D6FAC
	.4byte gSpriteAnim_83D6F98

	.align 2
gBattleAnimSpriteTemplate_83D6FB0:: @ 83D6FB0
	spr_template 10018, 10018, gOamData_837E104, gSpriteAnimTable_83D6FAC, NULL, gSpriteAffineAnimTable_83D6F7C, sub_80CE17C

	.align 2
gBattleAnimSpriteTemplate_83D6FC8:: @ 83D6FC8
	spr_template 10194, 10194, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CE30C

	.align 2
gSpriteAnim_83D6FE0:: @ 83D6FE0
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 8, 8
	obj_image_anim_frame 12, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D6FF4:: @ 83D6FF4
	.4byte gSpriteAnim_83D6FE0

	.align 2
gBattleAnimSpriteTemplate_83D6FF8:: @ 83D6FF8
	spr_template 10195, 10195, gOamData_837DF2C, gSpriteAnimTable_83D6FF4, NULL, gDummySpriteAffineAnimTable, sub_80CE36C

	.align 2
gSpriteAnim_83D7010:: @ 83D7010
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 5
	obj_image_anim_frame 80, 3
	obj_image_anim_frame 96, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7034:: @ 83D7034
	.4byte gSpriteAnim_83D7010

	.align 2
gBattleAnimSpriteTemplate_83D7038:: @ 83D7038
	spr_template 10031, 10031, gOamData_837DF34, gSpriteAnimTable_83D7034, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gBattleAnimSpriteTemplate_83D7050:: @ 83D7050
	spr_template 10020, 10020, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CE670

	.align 2
gSpriteAnim_83D7068:: @ 83D7068
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 48, 2
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D707C:: @ 83D707C
	.4byte gSpriteAnim_83D7068

	.align 2
gBattleAnimSpriteTemplate_83D7080:: @ 83D7080
	spr_template 10192, 10192, gOamData_837DF34, gSpriteAnimTable_83D707C, NULL, gDummySpriteAffineAnimTable, sub_80CEA04

	.align 2
gSpriteAnim_83D7098:: @ 83D7098
	obj_image_anim_frame 0, 10
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70A0:: @ 83D70A0
	obj_image_anim_frame 4, 10
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70A8:: @ 83D70A8
	obj_image_anim_frame 8, 41
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70B0:: @ 83D70B0
	obj_image_anim_frame 12, 10
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70B8:: @ 83D70B8
	obj_image_anim_frame 16, 10
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70C0:: @ 83D70C0
	obj_image_anim_frame 20, 10
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70C8:: @ 83D70C8
	obj_image_anim_frame 0, 10, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70D0:: @ 83D70D0
	obj_image_anim_frame 4, 10, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D70D8:: @ 83D70D8
	.4byte gSpriteAnim_83D7098
	.4byte gSpriteAnim_83D70A0
	.4byte gSpriteAnim_83D70A8
	.4byte gSpriteAnim_83D70B0
	.4byte gSpriteAnim_83D70B8
	.4byte gSpriteAnim_83D70C0
	.4byte gSpriteAnim_83D70C8
	.4byte gSpriteAnim_83D70D0

	.align 2
gSpriteAffineAnim_83D70F8:: @ 83D70F8
	obj_rot_scal_anim_frame 0xC, 0xC, 0, 16
	obj_rot_scal_anim_frame 0xFFF4, 0xFFF4, 0, 16
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D7110:: @ 83D7110
	.4byte gSpriteAffineAnim_83D70F8

	.align 2
gBattleAnimSpriteTemplate_83D7114:: @ 83D7114
	spr_template 10072, 10072, gOamData_837DFEC, gSpriteAnimTable_83D70D8, NULL, gSpriteAffineAnimTable_83D7110, sub_80CEB0C

	.align 2
gUnknown_083D712C:: @ 83D712C
	.2byte 10072,0x7FFF,0x735F,0x6ADF,0x623F,0x59BF
	.2byte 10097,0x7FFF,0x6BF9,0x57F4,0x43EF,0x33EA
	.2byte 10185,0x7FFF,0x63FF,0x47FF,0x2BFF,0x0FFF
	.2byte 10175,0x7FFF,0x7F9A,0x7F55,0x7F10,0x7ECC

	.align 2
gBattleAnimSpriteTemplate_83D715C:: @ 83D715C
	spr_template 10072, 10072, gOamData_837DFEC, gSpriteAnimTable_83D70D8, NULL, gSpriteAffineAnimTable_83D7110, sub_80CECE8

	.align 2
gBattleAnimSpriteTemplate_83D7174:: @ 83D7174
	spr_template 10193, 10193, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CEDF0

	.align 2
gSpriteAffineAnim_83D718C:: @ 83D718C
	obj_rot_scal_anim_frame 0xA0, 0xA0, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D71A4:: @ 83D71A4
	.4byte gSpriteAffineAnim_83D718C

	.align 2
gBattleAnimSpriteTemplate_83D71A8:: @ 83D71A8
	spr_template 10072, 10072, gOamData_837DFEC, gSpriteAnimTable_83D70D8, NULL, gSpriteAffineAnimTable_83D71A4, sub_80CEE60

	.align 2
gSpriteAnim_83D71C0:: @ 83D71C0
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D71D4:: @ 83D71D4
	obj_image_anim_frame 48, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D71E8:: @ 83D71E8
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 48, 2
	obj_image_anim_end

	.align 2
gSpriteAnim_83D71FC:: @ 83D71FC
	obj_image_anim_frame 48, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7210:: @ 83D7210
	.4byte gSpriteAnim_83D71C0
	.4byte gSpriteAnim_83D71E8
	.4byte gSpriteAnim_83D71D4
	.4byte gSpriteAnim_83D71FC

	.align 2
gBattleAnimSpriteTemplate_83D7220:: @ 83D7220
	spr_template 10209, 10209, gOamData_837DF34, gSpriteAnimTable_83D7210, NULL, gDummySpriteAffineAnimTable, sub_80CEF9C

	.align 2
gSpriteAffineAnim_83D7238:: @ 83D7238
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x1E, 0x1E, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D7250:: @ 83D7250
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 11
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 11
	obj_rot_scal_anim_loop 2
	obj_rot_scal_anim_frame 0xFFE2, 0xFFE2, 0, 8
	obj_rot_scal_anim_end

	.align 2
@ unused
	obj_rot_scal_anim_frame 16, 16, 0, 0
	obj_rot_scal_anim_frame 30, 30, 0, 8
	obj_rot_scal_anim_frame 0, 0, 0, 16
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0, 0, 4, 11
	obj_rot_scal_anim_frame 0, 0, -4, 11
	obj_rot_scal_anim_loop 2
	obj_rot_scal_anim_frame -30, -30, 0, 8
	obj_rot_scal_anim_end 0

	.align 2
gSpriteAffineAnimTable_83D72C0:: @ 83D72C0
	.4byte gSpriteAffineAnim_83D7238
	.4byte gSpriteAffineAnim_83D7250

	.align 2
gBattleAnimSpriteTemplate_83D72C8:: @ 83D72C8
	spr_template 10064, 10064, gOamData_837DFF4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D72C0, sub_80CF040

	.align 2
gBattleAnimSpriteTemplate_83D72E0:: @ 83D72E0
	spr_template 10064, 10064, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D72C0, sub_80CF0BC

	.align 2
gSpriteAnim_83D72F8:: @ 83D72F8
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7300:: @ 83D7300
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7308:: @ 83D7308
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7328:: @ 83D7328
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7348:: @ 83D7348
	.4byte gSpriteAnim_83D72F8
	.4byte gSpriteAnim_83D7300
	.4byte gSpriteAnim_83D7308
	.4byte gSpriteAnim_83D7328

	.align 2
gBattleAnimSpriteTemplate_83D7358:: @ 83D7358
	spr_template 10214, 10214, gOamData_837DF34, gSpriteAnimTable_83D7348, NULL, gDummySpriteAffineAnimTable, sub_80CF1C8

	.align 2
gSpriteTemplate_83D7370:: @ 83D7370
	spr_template 10064, 10064, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CF280

	.align 2
gSpriteAnim_83D7388:: @ 83D7388
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7390:: @ 83D7390
	.4byte gSpriteAnim_83D7388

	.align 2
gSpriteTemplate_83D7394:: @ 83D7394
	spr_template 10072, 10072, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CF2D0

	.align 2
gSpriteTemplate_83D73AC:: @ 83D73AC
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CF3C4

	.align 2
gSpriteTemplate_83D73C4:: @ 83D73C4
	spr_template 10145, 10145, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB1B0, sub_80CF458

	.align 2
gSpriteAnim_83D73DC:: @ 83D73DC
	obj_image_anim_frame 0, 9
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D73F0:: @ 83D73F0
	.4byte gSpriteAnim_83D73DC

	.align 2
gSpriteAffineAnim_83D73F4:: @ 83D73F4
	obj_rot_scal_anim_frame 0x50, 0x50, 0, 0
	obj_rot_scal_anim_frame 0x9, 0x9, 0, 18
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D740C:: @ 83D740C
	.4byte gSpriteAffineAnim_83D73F4

	.align 2
gSpriteTemplate_83D7410:: @ 83D7410
	spr_template 10007, 10007, gOamData_837DF94, gSpriteAnimTable_83D73F0, NULL, gSpriteAffineAnimTable_83D740C, sub_80793C4

	.align 2
gSpriteAnim_83D7428:: @ 83D7428
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 24, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 40, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_loop 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D744C:: @ 83D744C
	.4byte gSpriteAnim_83D7428

	.align 2
gBattleAnimSpriteTemplate_83D7450:: @ 83D7450
	spr_template 10075, 10075, gOamData_837DF54, gSpriteAnimTable_83D744C, NULL, gDummySpriteAffineAnimTable, sub_80CF610

	.align 2
gSpriteAffineAnim_83D7468:: @ 83D7468
	obj_rot_scal_anim_frame 0x10, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x14, 0x0, 0, 12
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 32
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D7488:: @ 83D7488
	.4byte gSpriteAffineAnim_83D7468

	.align 2
gBattleAnimSpriteTemplate_83D748C:: @ 83D748C
	spr_template 10005, 10005, gOamData_837E0FC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7488, sub_80CF690

	.align 2
gBattleAnimSpriteTemplate_83D74A4:: @ 83D74A4
	spr_template 10003, 10003, gOamData_837E134, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CF6DC

	.align 2
gSpriteTemplate_83D74BC:: @ 83D74BC
	spr_template 10003, 10003, gOamData_837E074, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CF8B8

	.align 2
gSpriteAffineAnim_83D74D4:: @ 83D74D4
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 0
	obj_rot_scal_anim_frame 0x7, 0x7, 0, -56
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D74EC:: @ 83D74EC
	obj_rot_scal_anim_frame 0x5, 0x5, 0, 10
	obj_rot_scal_anim_frame 0xFFF6, 0xFFF6, 0, 10
	obj_rot_scal_anim_frame 0xA, 0xA, 0, 10
	obj_rot_scal_anim_frame 0xFFF6, 0xFFF6, 0, 10
	obj_rot_scal_anim_frame 0xA, 0xA, 0, 10
	obj_rot_scal_anim_frame 0xFFF6, 0xFFF6, 0, 10
	obj_rot_scal_anim_frame 0xA, 0xA, 0, 10
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D752C:: @ 83D752C
	.4byte gSpriteAffineAnim_83D74D4

	.align 2
gSpriteAffineAnimTable_83D7530:: @ 83D7530
	.4byte gSpriteAffineAnim_83D74EC

	.align 2
gBattleAnimSpriteTemplate_83D7534:: @ 83D7534
	spr_template 10163, 10163, gOamData_837E034, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D752C, sub_807941C

	.align 2
gBattleAnimSpriteTemplate_83D754C:: @ 83D754C
	spr_template 10164, 10164, gOamData_837E034, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D752C, sub_807941C

	.align 2
gBattleAnimSpriteTemplate_83D7564:: @ 83D7564
	spr_template 10260, 10260, gOamData_837E03C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D752C, sub_807941C

	.align 2
gBattleAnimSpriteTemplate_83D757C:: @ 83D757C
	spr_template 10288, 10288, gOamData_837E034, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7530, sub_80D4CA4

	.align 2
gBattleAnimSpriteTemplate_83D7594:: @ 83D7594
	spr_template 10175, 10175, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80794A8

	.align 2
gSpriteTemplate_83D75AC:: @ 83D75AC
	spr_template 10178, 10178, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CFDFC

	.align 2
gSpriteAnim_83D75C4:: @ 83D75C4
	obj_image_anim_frame 8, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D75CC:: @ 83D75CC
	.4byte gSpriteAnim_83D75C4

	.align 2
gSpriteAffineAnim_83D75D0:: @ 83D75D0
	obj_rot_scal_anim_frame 0x0, 0x0, 10, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D75E0:: @ 83D75E0
	.4byte gSpriteAffineAnim_83D75D0

	.align 2
gBattleAnimSpriteTemplate_83D75E4:: @ 83D75E4
	spr_template 10100, 10100, gOamData_837DF8C, gSpriteAnimTable_83D75CC, NULL, gDummySpriteAffineAnimTable, sub_80CFE9C

	.align 2
gBattleAnimSpriteTemplate_83D75FC:: @ 83D75FC
	spr_template 10100, 10100, gOamData_837DF8C, gSpriteAnimTable_83D75CC, NULL, gSpriteAffineAnimTable_83D75E0, sub_80CFF50

	.align 2
gSpriteAffineAnim_83D7614:: @ 83D7614
	obj_rot_scal_anim_frame 0x0, 0x0, 20, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D7624:: @ 83D7624
	.4byte gSpriteAffineAnim_83D7614

	.align 2
gBattleAnimSpriteTemplate_83D7628:: @ 83D7628
	spr_template 10006, 10006, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7624, sub_80CFFD8

	.align 2
gSpriteAffineAnim_83D7640:: @ 83D7640
	obj_rot_scal_anim_frame 0x10, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x0, 0, 40
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D7658:: @ 83D7658
	.4byte gSpriteAffineAnim_83D7640

	.align 2
gBattleAnimSpriteTemplate_83D765C:: @ 83D765C
	spr_template 10009, 10009, gOamData_837DFDC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7658, sub_80D0118

	.align 2
gSpriteAnim_83D7674:: @ 83D7674
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 20
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7684:: @ 83D7684
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 20, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7694:: @ 83D7694
	.4byte gSpriteAnim_83D7674
	.4byte gSpriteAnim_83D7684

	.align 2
gBattleAnimSpriteTemplate_83D769C:: @ 83D769C
	spr_template 10138, 10138, gOamData_837E054, gSpriteAnimTable_83D7694, NULL, gDummySpriteAffineAnimTable, sub_80D0178

	.align 2
gSpriteAnim_83D76B4:: @ 83D76B4
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D76C4:: @ 83D76C4
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 1, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D76D4:: @ 83D76D4
	.4byte gSpriteAnim_83D76B4
	.4byte gSpriteAnim_83D76C4

	.align 2
gBattleAnimSpriteTemplate_83D76DC:: @ 83D76DC
	spr_template 10138, 10138, gOamData_837E054, gSpriteAnimTable_83D76D4, NULL, gDummySpriteAffineAnimTable, sub_80D0228

	.align 2
gUnknown_083D76F4:: @ 83D76F4
	obj_rot_scal_anim_frame -6, 4, 0, 8
	obj_rot_scal_anim_frame 10, -10, 0, 8
	obj_rot_scal_anim_frame -4, 6, 0, 8
	obj_rot_scal_anim_end 0

	.align 2
gUnknown_083D7714:: @ 83D7714
	obj_rot_scal_anim_frame -4, -5, 0, 12
	obj_rot_scal_anim_frame 0, 0, 0, 24
	obj_rot_scal_anim_frame 4, 5, 0, 12
	obj_rot_scal_anim_end 0

	.align 2
gSpriteAnim_83D7734:: @ 83D7734
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 4, 40, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 12, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7748:: @ 83D7748
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 40
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 12, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D775C:: @ 83D775C
	.4byte gSpriteAnim_83D7734
	.4byte gSpriteAnim_83D7748

	.align 2
gBattleAnimSpriteTemplate_83D7764:: @ 83D7764
	spr_template 10086, 10086, gOamData_837DF2C, gSpriteAnimTable_83D775C, NULL, gDummySpriteAffineAnimTable, sub_80D0930

	.align 2
gSpriteAffineAnim_83D777C:: @ 83D777C
	obj_rot_scal_anim_frame 0xB, 0xB, 0, 8
	obj_rot_scal_anim_frame 0xFFF5, 0xFFF5, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D7794:: @ 83D7794
	.4byte gSpriteAffineAnim_83D777C

	.align 2
gBattleAnimSpriteTemplate_83D7798:: @ 83D7798
	spr_template 10087, 10087, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7794, sub_80D09C0

	.align 2
gUnknown_083D77B0:: @ 83D77B0
	obj_rot_scal_anim_frame -10, 9, 0, 7
	obj_rot_scal_anim_frame 20, -20, 0, 7
	obj_rot_scal_anim_frame -20, 20, 0, 7
	obj_rot_scal_anim_frame 10, -9, 0, 7
	obj_rot_scal_anim_loop 2
	obj_rot_scal_anim_end 0

	.align 2
gBattleAnimSpriteTemplate_83D77E0:: @ 83D77E0
	spr_template 10002, 10002, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D0E30

	.align 2
gBattleAnimSpriteTemplate_83D77F8:: @ 83D77F8
	spr_template 10197, 10197, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8079534

	.align 2
gSpriteAnim_83D7810:: @ 83D7810
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7824:: @ 83D7824
	.4byte gSpriteAnim_83D7810

	.align 2
gBattleAnimSpriteTemplate_83D7828:: @ 83D7828
	spr_template 10198, 10198, gOamData_837DF34, gSpriteAnimTable_83D7824, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gSpriteAffineAnim_83D7840:: @ 83D7840
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 2
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 4
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 2
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83D7860:: @ 83D7860
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D7870:: @ 83D7870
	obj_rot_scal_anim_frame 0xFFF8, 0x4, 0, 8
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0x10, 0xFFF8, 0, 8
	obj_rot_scal_anim_frame 0xFFF0, 0x8, 0, 8
	obj_rot_scal_anim_loop 1
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D78B0:: @ 83D78B0
	.4byte gSpriteAffineAnim_83D7840
	.4byte gSpriteAffineAnim_83D7860
	.4byte gSpriteAffineAnim_83D7870

	.align 2
gBattleAnimSpriteTemplate_83D78BC:: @ 83D78BC
	spr_template 10202, 10202, gOamData_837E114, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D78B0, sub_80D1368

	.align 2
gSpriteAffineAnim_83D78D4:: @ 83D78D4
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 30
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnim_83D78EC:: @ 83D78EC
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 15
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnim_83D7904:: @ 83D7904
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0xB, 0xB, 0, 45
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnimTable_83D791C:: @ 83D791C
	.4byte gSpriteAffineAnim_83D78D4
	.4byte gSpriteAffineAnim_83D78EC

	.align 2
gSpriteAffineAnimTable_83D7924:: @ 83D7924
	.4byte gSpriteAffineAnim_83D7904

	.align 2
gBattleAnimSpriteTemplate_83D7928:: @ 83D7928
	spr_template 10203, 10203, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D791C, sub_80793C4

	.align 2
gSpriteAffineAnim_83D7940:: @ 83D7940
	obj_rot_scal_anim_frame 0x200, 0x200, 0, 0
	obj_rot_scal_anim_frame 0xFFF0, 0xFFF0, 0, 30
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnimTable_83D7958:: @ 83D7958
	.4byte gSpriteAffineAnim_83D7940

	.align 2
gBattleAnimSpriteTemplate_83D795C:: @ 83D795C
	spr_template 10203, 10203, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7958, sub_80793C4

	.align 2
gBattleAnimSpriteTemplate_83D7974:: @ 83D7974
	spr_template 10203, 10203, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D791C, sub_80D0FD8

	.align 2
gBattleAnimSpriteTemplate_83D798C:: @ 83D798C
	spr_template 10203, 10203, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7924, sub_80D10B8

	.align 2
gBattleAnimSpriteTemplate_83D79A4:: @ 83D79A4
	spr_template 10203, 10203, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D791C, sub_80D1318

	.align 2
gUnknown_083D79BC:: @ 83D79BC
	obj_rot_scal_anim_frame 96, -13, 0, 8
	obj_rot_scal_anim_end 0

	.align 2
gSpriteAnim_83D79CC:: @ 83D79CC
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 4, 3
	obj_image_anim_frame 8, 3
	obj_image_anim_frame 4, 3
	obj_image_anim_frame 0, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D79E4:: @ 83D79E4
	.4byte gSpriteAnim_83D79CC

	.align 2
gSpriteTemplate_83D79E8:: @ 83D79E8
	spr_template 10207, 10207, gOamData_837DF2C, gSpriteAnimTable_83D79E4, NULL, gDummySpriteAffineAnimTable, sub_80D1A70

gUnknown_083D7A00:: @ 83D7A00
	.byte 30, 28
	.byte -20, 24
	.byte 16, 26
	.byte -10, 28

	.align 2
gSpriteAnim_83D7A08:: @ 83D7A08
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 15
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 15, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 15
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 0, 6
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7A40:: @ 83D7A40
	.4byte gSpriteAnim_83D7A08

	.align 2
gBattleAnimSpriteTemplate_83D7A44:: @ 83D7A44
	spr_template 10205, 10205, gOamData_837DF34, gSpriteAnimTable_83D7A40, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gUnknown_083D7A5C:: @ 83D7A5C
	.2byte 10206
	.2byte 9999
	.2byte 9998
	.2byte 9997
	.2byte 9996
	.2byte 0

	.align 2
gBattleAnimSpriteTemplate_83D7A68:: @ 83D7A68
	spr_template 10206, 10206, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D1C08

	.align 2
gBattleAnimSpriteTemplate_83D7A80:: @ 83D7A80
	spr_template 10210, 10210, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D1C80

	.align 2
gUnknown_083D7A98:: @ 83D7A98
	obj_rot_scal_anim_frame 0x000A, 0xFFF3, 0x00, 0x0A
	obj_rot_scal_anim_frame 0xFFF6, 0x000D, 0x00, 0x0A
	obj_rot_scal_anim_end

	.align 2
gBattleAnimSpriteTemplate_83D7AB0:: @ 83D7AB0
	spr_template 10216, 10216, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D1F58

	.align 2
gBattleAnimSpriteTemplate_83D7AC8:: @ 83D7AC8
	spr_template 10216, 10216, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D1FDC

	.align 2
gBattleAnimSpriteTemplate_83D7AE0:: @ 83D7AE0
	spr_template 10216, 10216, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D2064

	.align 2
gSpriteAffineAnim_83D7AF8:: @ 83D7AF8
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D7B10:: @ 83D7B10
	.4byte gSpriteAffineAnim_83D7AF8

	.align 2
gBattleAnimSpriteTemplate_83D7B14:: @ 83D7B14
	spr_template 10217, 10217, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7B10, sub_80D26A4

	.align 2
gBattleAnimSpriteTemplate_83D7B2C:: @ 83D7B2C
	spr_template 10217, 10217, gOamData_837DFEC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7B10, sub_80D27E0

	.align 2
gSpriteAffineAnim_83D7B44:: @ 83D7B44
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D7B5C:: @ 83D7B5C
	.4byte gSpriteAffineAnim_83D7B44

	.align 2
gBattleAnimSpriteTemplate_83D7B60:: @ 83D7B60
	spr_template 10237, 10237, gOamData_837DFE4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7B5C, sub_80D28AC

	.align 2
gSpriteAnim_83D7B78:: @ 83D7B78
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7B90:: @ 83D7B90
	.4byte gSpriteAnim_83D7B78

	.align 2
gBattleAnimSpriteTemplate_83D7B94:: @ 83D7B94
	spr_template 10218, 10218, gOamData_837DF2C, gSpriteAnimTable_83D7B90, NULL, gDummySpriteAffineAnimTable, sub_80D2920

	.align 2
gSpriteAnim_83D7BAC:: @ 83D7BAC
	obj_image_anim_frame 0, 24
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7BB4:: @ 83D7BB4
	.4byte gSpriteAnim_83D7BAC

	.align 2
gBattleAnimSpriteTemplate_83D7BB8:: @ 83D7BB8
	spr_template 10220, 10220, gOamData_837DF34, gSpriteAnimTable_83D7BB4, NULL, gDummySpriteAffineAnimTable, sub_80D2938

	.align 2
gBattleAnimSpriteTemplate_83D7BD0:: @ 83D7BD0
	spr_template 10219, 10219, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D2A38

	.align 2
gSpriteAnim_83D7BE8:: @ 83D7BE8
	obj_image_anim_frame 0, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83D7BF0:: @ 83D7BF0
	obj_image_anim_frame 16, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D7BF8:: @ 83D7BF8
	.4byte gSpriteAnim_83D7BE8
	.4byte gSpriteAnim_83D7BF0

	.align 2
gBattleAnimSpriteTemplate_83D7C00:: @ 83D7C00
	spr_template 10221, 10221, gOamData_837DF34, gSpriteAnimTable_83D7BF8, NULL, gDummySpriteAffineAnimTable, sub_80D2ABC

	.align 2
gSpriteAnim_83D7C18:: @ 83D7C18
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7C2C:: @ 83D7C2C
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7C40:: @ 83D7C40
	.4byte gSpriteAnim_83D7C18
	.4byte gSpriteAnim_83D7C2C

	.align 2
gBattleAnimSpriteTemplate_83D7C48:: @ 83D7C48
	spr_template 10222, 10222, gOamData_837DF34, gSpriteAnimTable_83D7C40, NULL, gDummySpriteAffineAnimTable, sub_80D2BE8

	.align 2
gSpriteAnim_83D7C60:: @ 83D7C60
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 16, 8
	obj_image_anim_frame 32, 8
	obj_image_anim_frame 16, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7C74:: @ 83D7C74
	obj_image_anim_frame 16, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7C88:: @ 83D7C88
	.4byte gSpriteAnim_83D7C60
	.4byte gSpriteAnim_83D7C74

	.align 2
gBattleAnimSpriteTemplate_83D7C90:: @ 83D7C90
	spr_template 10215, 10215, gOamData_837DF34, gSpriteAnimTable_83D7C88, NULL, gDummySpriteAffineAnimTable, sub_80D2C38

	.align 2
gUnknown_083D7CA8:: @ 83D7CA8
	obj_rot_scal_anim_frame -12, 8, 0, 4
	obj_rot_scal_anim_frame 20, -20, 0, 4
	obj_rot_scal_anim_frame -8, 12, 0, 4
	obj_rot_scal_anim_end 0

	.align 2
gBattleAnimSpriteTemplate_83D7CC8:: @ 83D7CC8
	spr_template 10225, 10225, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D2D68

	.align 2
gSpriteAffineAnim_83D7CE0:: @ 83D7CE0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 5
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D7CF0:: @ 83D7CF0
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 16
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnim_83D7D00:: @ 83D7D00
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 16
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnimTable_83D7D10:: @ 83D7D10
	.4byte gSpriteAffineAnim_83D7CE0
	.4byte gSpriteAffineAnim_83D7CF0
	.4byte gSpriteAffineAnim_83D7D00

	.align 2
gBattleAnimSpriteTemplate_83D7D1C:: @ 83D7D1C
	spr_template 10206, 10206, gOamData_837DF8C, gSpriteAnimTable_83D70D8, NULL, gSpriteAffineAnimTable_83D7D10, sub_80D2EC8

	.align 2
gBattleAnimSpriteTemplate_83D7D34:: @ 83D7D34
	spr_template 10206, 10206, gOamData_837DF8C, gSpriteAnimTable_83D70D8, NULL, gSpriteAffineAnimTable_83D7D10, sub_80D2E68

	.align 2
gSpriteAffineAnim_83D7D4C:: @ 83D7D4C
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D7D5C:: @ 83D7D5C
	obj_rot_scal_anim_frame 0x200, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D7D6C:: @ 83D7D6C
	.4byte gSpriteAffineAnim_83D7D4C
	.4byte gSpriteAffineAnim_83D7D5C

	.align 2
gBattleAnimSpriteTemplate_83D7D74:: @ 83D7D74
	spr_template 10244, 10244, gOamData_837E13C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7D6C, sub_80D3014

	.align 2
	.incbin "graphics/unknown/unknown_3D7D8C.4bpp"
	.incbin "graphics/unknown/unknown_3D810C.bin"

	.align 2
gSpriteAnim_83D910C:: @ 83D910C
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 8, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 24, 6
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 40, 2
	obj_image_anim_frame 48, 2
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D912C:: @ 83D912C
	.4byte gSpriteAnim_83D910C

	.align 2
gSpriteTemplate_83D9130:: @ 83D9130
	spr_template 10115, 10115, gOamData_837DF74, gSpriteAnimTable_83D912C, NULL, gDummySpriteAffineAnimTable, SetAnimRaindropCallback

	.align 2
gSpriteAffineAnim_83D9148:: @ 83D9148
	obj_rot_scal_anim_frame 0xFFFB, 0xFFFB, 0, 10
	obj_rot_scal_anim_frame 0x5, 0x5, 0, 10
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D9160:: @ 83D9160
	.4byte gSpriteAffineAnim_83D9148

	.align 2
gSpriteAnim_83D9164:: @ 83D9164
	obj_image_anim_frame 0, 1
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9174:: @ 83D9174
	.4byte gSpriteAnim_83D9164

	.align 2
gBattleAnimSpriteTemplate_83D9178:: @ 83D9178
	spr_template 10146, 10146, gOamData_837E0AC, gSpriteAnimTable_83D9174, NULL, gSpriteAffineAnimTable_83D9160, sub_80D31C8

	.align 2
gSpriteAnim_83D9190:: @ 83D9190
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9198:: @ 83D9198
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D91A0:: @ 83D91A0
	.4byte gSpriteAnim_83D9190
	.4byte gSpriteAnim_83D9198

	.align 2
gSpriteAffineAnim_83D91A8:: @ 83D91A8
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 1
	obj_rot_scal_anim_frame 0x60, 0x60, 0, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D91C0:: @ 83D91C0
	.4byte gSpriteAffineAnim_83D91A8

	.align 2
gBattleAnimSpriteTemplate_83D91C4:: @ 83D91C4
	spr_template 10140, 10140, gOamData_837E024, gSpriteAnimTable_83D91A0, NULL, gSpriteAffineAnimTable_83D91C0, sub_80D33B4

	.align 2
gSpriteAnim_83D91DC:: @ 83D91DC
	obj_image_anim_frame 0, 1
	obj_image_anim_frame 4, 1
	obj_image_anim_frame 8, 1
	obj_image_anim_frame 12, 1
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D91F0:: @ 83D91F0
	.4byte gSpriteAnim_83D91DC

	.align 2
gBattleAnimSpriteTemplate_83D91F4:: @ 83D91F4
	spr_template 10149, 10149, gOamData_837E04C, gSpriteAnimTable_83D91F0, NULL, gDummySpriteAffineAnimTable, sub_80D3554

	.align 2
gBattleAnimSpriteTemplate_83D920C:: @ 83D920C
	spr_template 10259, 10259, gOamData_837E04C, gSpriteAnimTable_83D91F0, NULL, gDummySpriteAffineAnimTable, sub_80D3554

	.align 2
gBattleAnimSpriteTemplate_83D9224:: @ 83D9224
	spr_template 10264, 10264, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D3554

	.align 2
gBattleAnimSpriteTemplate_83D923C:: @ 83D923C
	spr_template 10265, 10265, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D3554

	.align 2
gSpriteAnim_83D9254:: @ 83D9254
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 48, 2
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9264:: @ 83D9264
	.4byte gSpriteAnim_83D9254

	.align 2
gBattleAnimSpriteTemplate_83D9268:: @ 83D9268
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D9264, NULL, gDummySpriteAffineAnimTable, sub_80D3554

	.align 2
gBattleAnimSpriteTemplate_83D9280:: @ 83D9280
	spr_template 10165, 10165, gOamData_837E034, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D752C, sub_80D3554

	.align 2
gSpriteAffineAnim_83D9298:: @ 83D9298
	obj_rot_scal_anim_frame 0x3, 0x3, 10, 50
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 10
	obj_rot_scal_anim_frame 0xFFEC, 0xFFEC, -10, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D92B8:: @ 83D92B8
	obj_rot_scal_anim_frame 0x150, 0x150, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D92C8:: @ 83D92C8
	.4byte gSpriteAffineAnim_83D9298

	.align 2
gSpriteAffineAnimTable_83D92CC:: @ 83D92CC
	.4byte gSpriteAffineAnim_83D92B8

	.align 2
gBattleAnimSpriteTemplate_83D92D0:: @ 83D92D0
	spr_template 10149, 10149, gOamData_837E10C, gSpriteAnimTable_83D91F0, NULL, gSpriteAffineAnimTable_83D92C8, sub_80D3698

	.align 2
gBattleAnimSpriteTemplate_83D92E8:: @ 83D92E8
	spr_template 10149, 10149, gOamData_837E10C, gSpriteAnimTable_83D91F0, NULL, gSpriteAffineAnimTable_83D92CC, sub_80D3728

	.align 2
gSpriteAnim_83D9300:: @ 83D9300
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9308:: @ 83D9308
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9310:: @ 83D9310
	.4byte gSpriteAnim_83D9300

	.align 2
gSpriteAnimTable_83D9314:: @ 83D9314
	.4byte gSpriteAnim_83D9308

	.align 2
gBattleAnimSpriteTemplate_83D9318:: @ 83D9318
	spr_template 10155, 10155, gOamData_837E04C, gSpriteAnimTable_83D9310, NULL, gDummySpriteAffineAnimTable, sub_80794A8

	.align 2
gBattleAnimSpriteTemplate_83D9330:: @ 83D9330
	spr_template 10155, 10155, gOamData_837E10C, gSpriteAnimTable_83D9314, NULL, gSpriteAffineAnimTable_83DA318, sub_80D37FC

	.align 2
gBattleAnimSpriteTemplate_83D9348:: @ 83D9348
	spr_template 10141, 10141, gOamData_837DF24, gSpriteAnimTable_83D9BC8, NULL, gDummySpriteAffineAnimTable, sub_80D3838

	.align 2
gBattleAnimSpriteTemplate_83D9360:: @ 83D9360
	spr_template 10155, 10155, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D4044

	.align 2
gSpriteTemplate_83D9378:: @ 83D9378
	spr_template 10268, 10268, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D452C

	.align 2
gSpriteAnim_83D9390:: @ 83D9390
	obj_image_anim_frame 8, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9398:: @ 83D9398
	obj_image_anim_frame 9, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D93A0:: @ 83D93A0
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D93A8:: @ 83D93A8
	.4byte gSpriteAnim_83D9390
	.4byte gSpriteAnim_83D9398

	.align 2
gSpriteAnimTable_83D93B0:: @ 83D93B0
	.4byte gSpriteAnim_83D93A0

	.align 2
gSpriteAffineAnim_83D93B4:: @ 83D93B4
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFF6, 0xFFF6, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D93CC:: @ 83D93CC
	obj_rot_scal_anim_frame 0xE0, 0xE0, 0, 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D93E4:: @ 83D93E4
	obj_rot_scal_anim_frame 0x150, 0x150, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D93FC:: @ 83D93FC
	.4byte gSpriteAffineAnim_83D93B4
	.4byte gSpriteAffineAnim_83D93CC

	.align 2
gSpriteAffineAnimTable_83D9404:: @ 83D9404
	.4byte gSpriteAffineAnim_83D93E4

	.align 2
gBattleAnimSpriteTemplate_83D9408:: @ 83D9408
	spr_template 10155, 10155, gOamData_837DF24, gSpriteAnimTable_83D93A8, NULL, gDummySpriteAffineAnimTable, sub_80D4BF0

	.align 2
gSpriteTemplate_83D9420:: @ 83D9420
	spr_template 10155, 10155, gOamData_837DF84, gSpriteAnimTable_83D93A8, NULL, gSpriteAffineAnimTable_83D93FC, sub_80D4C64

	.align 2
gBattleAnimSpriteTemplate_83D9438:: @ 83D9438
	spr_template 10155, 10155, gOamData_837DF8C, gSpriteAnimTable_83D93B0, NULL, gSpriteAffineAnimTable_83D9404, sub_807A9BC

	.align 2
gSpriteAnim_83D9450:: @ 83D9450
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83D9460:: @ 83D9460
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 4, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9470:: @ 83D9470
	.4byte gSpriteAnim_83D9450
	.4byte gSpriteAnim_83D9460

	.align 2
gBattleAnimSpriteTemplate_83D9478:: @ 83D9478
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D9470, NULL, gDummySpriteAffineAnimTable, sub_80D4ED8

	.align 2
gBattleAnimSpriteTemplate_83D9490:: @ 83D9490
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D9470, NULL, gDummySpriteAffineAnimTable, sub_80D4F18

	.align 2
gSpriteAnim_83D94A8:: @ 83D94A8
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 3
	obj_image_anim_frame 80, 3
	obj_image_anim_frame 96, 3
	obj_image_anim_frame 112, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D94CC:: @ 83D94CC
	.4byte gSpriteAnim_83D94A8

	.align 2
gSpriteAnim_83D94D0:: @ 83D94D0
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_frame 64, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D94E8:: @ 83D94E8
	.4byte gSpriteAnim_83D94D0

	.align 2
gSpriteAffineAnim_83D94EC:: @ 83D94EC
	obj_rot_scal_anim_frame 0x32, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x20, 0x0, 0, 7
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D9504:: @ 83D9504
	.4byte gSpriteAffineAnim_83D94EC

	.align 2
gBattleAnimSpriteTemplate_83D9508:: @ 83D9508
	spr_template 10033, 10033, gOamData_837DF94, gSpriteAnimTable_83D94CC, NULL, gSpriteAffineAnimTable_83D9504, sub_80D4FCC

	.align 2
gBattleAnimSpriteTemplate_83D9520:: @ 83D9520
	spr_template 10033, 10033, gOamData_837DF34, gSpriteAnimTable_83D94CC, NULL, gDummySpriteAffineAnimTable, sub_80D4FCC

	.align 2
gBattleAnimSpriteTemplate_83D9538:: @ 83D9538
	spr_template 10035, 10035, gOamData_837DF34, gSpriteAnimTable_83D94E8, NULL, gDummySpriteAffineAnimTable, sub_80D4F5C

	.align 2
gSpriteTemplate_83D9550:: @ 83D9550
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D94E8, NULL, gDummySpriteAffineAnimTable, sub_80D4F5C

	.align 2
gSpriteAnim_83D9568:: @ 83D9568
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 6
	obj_image_anim_frame 48, 6
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9578:: @ 83D9578
	.4byte gSpriteAnim_83D9568

	.align 2
gSpriteTemplate_83D957C:: @ 83D957C
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D9578, NULL, gDummySpriteAffineAnimTable, sub_80D5074

	.align 2
gSpriteAffineAnim_83D9594:: @ 83D9594
	obj_rot_scal_anim_frame 0x50, 0x50, 0, 0
	obj_rot_scal_anim_frame 0x2, 0x2, 10, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D95AC:: @ 83D95AC
	.4byte gSpriteAffineAnim_83D9594

	.align 2
gBattleAnimSpriteTemplate_83D95B0:: @ 83D95B0
	spr_template 10157, 10157, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D95AC, sub_80D517C

	.align 2
gSpriteAnim_83D95C8:: @ 83D95C8
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D95E0:: @ 83D95E0
	.4byte gSpriteAnim_83D95C8

	.align 2
gBattleAnimSpriteTemplate_83D95E4:: @ 83D95E4
	spr_template 10029, 10029, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_807941C

	.align 2
gBattleAnimSpriteTemplate_83D95FC:: @ 83D95FC
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D95E0, NULL, gDummySpriteAffineAnimTable, sub_80D51A8

	.align 2
gBattleAnimSpriteTemplate_83D9614:: @ 83D9614
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D95E0, NULL, gDummySpriteAffineAnimTable, sub_80D5210

	.align 2
gBattleAnimSpriteTemplate_83D962C:: @ 83D962C
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D95E0, NULL, gDummySpriteAffineAnimTable, sub_80D522C

	.align 2
gSpriteAnim_83D9644:: @ 83D9644
	obj_image_anim_frame 32, 6
	obj_image_anim_frame 48, 6
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9650:: @ 83D9650
	.4byte gSpriteAnim_83D9644

	.align 2
gSpriteAffineAnim_83D9654:: @ 83D9654
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9664:: @ 83D9664
	obj_rot_scal_anim_frame 0xA0, 0xA0, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D9674:: @ 83D9674
	.4byte gSpriteAffineAnim_83D9654
	.4byte gSpriteAffineAnim_83D9664

	.align 2
gBattleAnimSpriteTemplate_83D967C:: @ 83D967C
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D9650, NULL, gDummySpriteAffineAnimTable, sub_80D5374

	.align 2
gBattleAnimSpriteTemplate_83D9694:: @ 83D9694
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D95E0, NULL, gDummySpriteAffineAnimTable, sub_80D53B4

	.align 2
gBattleAnimSpriteTemplate_83D96AC:: @ 83D96AC
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D95E0, NULL, gDummySpriteAffineAnimTable, sub_807A9BC

	.align 2
gSpriteTemplate_83D96C4:: @ 83D96C4
	spr_template 10201, 10201, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D58FC

	.align 1
gHeatedRockCoords:: @ 83D96DC
	.2byte -2, -5
	.2byte -1, -1
	.2byte  3, -6
	.2byte  4, -2
	.2byte  2, -8
	.2byte -5, -5
	.2byte  4, -7

	.align 2
gBattleAnimSpriteTemplate_83D96F8:: @ 83D96F8
	spr_template 10201, 10201, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D5A20

	.align 2
gSpriteAnim_83D9710:: @ 83D9710
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83D9724:: @ 83D9724
	obj_image_anim_frame 16, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83D972C:: @ 83D972C
	obj_image_anim_frame 20, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9734:: @ 83D9734
	obj_image_anim_frame 20, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D973C:: @ 83D973C
	.4byte gSpriteAnim_83D9710
	.4byte gSpriteAnim_83D9724
	.4byte gSpriteAnim_83D972C
	.4byte gSpriteAnim_83D9734

	.align 2
gBattleAnimSpriteTemplate_83D974C:: @ 83D974C
	spr_template 10231, 10231, gOamData_837DF2C, gSpriteAnimTable_83D973C, NULL, gDummySpriteAffineAnimTable, sub_80D5B0C

	.align 2
gSpriteAnim_83D9764:: @ 83D9764
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9778:: @ 83D9778
	.4byte gSpriteAnim_83D9764

	.align 2
gBattleAnimSpriteTemplate_83D977C:: @ 83D977C
	spr_template 10232, 10232, gOamData_837DF34, gSpriteAnimTable_83D9778, NULL, gDummySpriteAffineAnimTable, sub_80D5CC0

	.align 2
gUnknown_083D9794:: @ 83D9794
	.byte -1, -1, 0, 1, 1, 0, 0, -1, -1, 1, 1, 0, 0, -1, 0, 1

gUnknown_083D97A4:: @ 83D97A4
	.byte -1, 0, 1, 0, -1, 1, 0, -1, 0, 1, 0, -1, 0, 1, 0, 1

	.align 2
gSpriteAnim_83D97B4:: @ 83D97B4
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 8
	obj_image_anim_frame 48, 5
	obj_image_anim_frame 64, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D97CC:: @ 83D97CC
	.4byte gSpriteAnim_83D97B4

	.align 2
gBattleAnimSpriteTemplate_83D97D0:: @ 83D97D0
	spr_template 10037, 10037, gOamData_837DF34, gSpriteAnimTable_83D97CC, NULL, gDummySpriteAffineAnimTable, sub_80D61C8

	.align 2
gSpriteAffineAnim_83D97E8:: @ 83D97E8
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 20
	obj_rot_scal_anim_frame 0x0, 0x0, -16, 60
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D9808:: @ 83D9808
	.4byte gSpriteAffineAnim_83D97E8

	.align 2
gSpriteTemplate_83D980C:: @ 83D980C
	spr_template 10143, 10143, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D9808, sub_80D6234

	.align 2
gSpriteAnim_83D9824:: @ 83D9824
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_frame 64, 5
	obj_image_anim_frame 80, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9840:: @ 83D9840
	.4byte gSpriteAnim_83D9824

	.align 2
gSpriteTemplate_83D9844:: @ 83D9844
	spr_template 10079, 10079, gOamData_837DF34, gSpriteAnimTable_83D9840, NULL, gDummySpriteAffineAnimTable, sub_80D6294

	.align 2
gBattleAnimSpriteTemplate_83D985C:: @ 83D985C
	spr_template 10011, 10011, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D6328

	.align 2
gBattleAnimSpriteTemplate_83D9874:: @ 83D9874
	spr_template 10171, 10171, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_807941C

	.align 2
gSpriteAffineAnim_83D988C:: @ 83D988C
	obj_rot_scal_anim_frame 0x0, 0x0, 20, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D989C:: @ 83D989C
	.4byte gSpriteAffineAnim_83D988C

	.align 2
gBattleAnimSpriteTemplate_83D98A0:: @ 83D98A0
	spr_template 10011, 10011, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D989C, sub_80D648C

	.align 2
gSpriteAnim_83D98B8:: @ 83D98B8
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 6
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D98C8:: @ 83D98C8
	.4byte gSpriteAnim_83D98B8

	.align 2
gSpriteAffineAnim_83D98CC:: @ 83D98CC
	obj_rot_scal_anim_frame 0xE8, 0xE8, 0, 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 10
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 10
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D98EC:: @ 83D98EC
	.4byte gSpriteAffineAnim_83D98CC

	.align 2
gBattleAnimSpriteTemplate_83D98F0:: @ 83D98F0
	spr_template 10282, 10282, gOamData_837DF94, gSpriteAnimTable_83D98C8, NULL, gSpriteAffineAnimTable_83D98EC, sub_80D65DC

	.align 2
gBattleAnimSpriteTemplate_83D9908:: @ 83D9908
	spr_template 10011, 10011, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D989C, sub_80D6658

	.align 2
gBattleAnimSpriteTemplate_83D9920:: @ 83D9920
	spr_template 10011, 10011, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D679C

	.align 2
gSpriteTemplate_83D9938:: @ 83D9938
	spr_template 10001, 10001, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D6A1C

	.align 2
gBattleAnimSpriteTemplate_83D9950:: @ 83D9950
	spr_template 10173, 10173, gOamData_837DF54, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D6A6C

	.align 2
gUnknown_083D9968:: @ 83D9968
	.byte  58, -60
	.byte -56, -36
	.byte   8, -56
	.byte -16,  56
	.byte  58, -10
	.byte -58,  10
	.byte  48, -18
	.byte  -8,  56
	.byte  16, -56
	.byte -58, -42
	.byte  58,  30
	.byte -48,  40
	.byte  12, -48
	.byte  48, -12
	.byte -56,  18
	.byte  48,  48

	.align 2
gSpriteAnim_83D9988:: @ 83D9988
	obj_image_anim_frame 3, 1
	obj_image_anim_frame 2, 1
	obj_image_anim_frame 1, 1
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D999C:: @ 83D999C
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 3, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D99B0:: @ 83D99B0
	.4byte gSpriteAnim_83D9988
	.4byte gSpriteAnim_83D999C

	.align 2
gSpriteTemplate_83D99B8:: @ 83D99B8
	spr_template 10211, 10211, gOamData_837DF24, gSpriteAnimTable_83D99B0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteAffineAnim_83D99D0:: @ 83D99D0
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 60
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFC, 0, 5
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 5
	obj_rot_scal_anim_loop 10
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9A10:: @ 83D9A10
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 30
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFC, 0, 5
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 5
	obj_rot_scal_anim_jump 3

	.align 2
gSpriteAffineAnim_83D9A40:: @ 83D9A40
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 30
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 30
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D9A60:: @ 83D9A60
	.4byte gSpriteAffineAnim_83D99D0
	.4byte gSpriteAffineAnim_83D9A10
	.4byte gSpriteAffineAnim_83D9A40

	.align 2
gBattleAnimSpriteTemplate_83D9A6C:: @ 83D9A6C
	spr_template 10212, 10212, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D9A60, sub_80D6D18

	.align 2
gSpriteAnim_83D9A84:: @ 83D9A84
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9A98:: @ 83D9A98
	.4byte gSpriteAnim_83D9A84

	.align 2
gBattleAnimSpriteTemplate_83D9A9C:: @ 83D9A9C
	spr_template 10213, 10213, gOamData_837DF34, gSpriteAnimTable_83D9A98, NULL, gDummySpriteAffineAnimTable, sub_80D6D70

	.align 2
gBattleAnimSpriteTemplate_83D9AB4:: @ 83D9AB4
	spr_template 10212, 10212, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D9A60, sub_80D6DD8

	.align 2
gSpriteAnim_83D9ACC:: @ 83D9ACC
	obj_image_anim_frame 0, 3
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9AD4:: @ 83D9AD4
	obj_image_anim_frame 2, 3
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9ADC:: @ 83D9ADC
	obj_image_anim_frame 4, 3
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9AE4:: @ 83D9AE4
	obj_image_anim_frame 6, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9AEC:: @ 83D9AEC
	.4byte gSpriteAnim_83D9ACC
	.4byte gSpriteAnim_83D9AD4
	.4byte gSpriteAnim_83D9ADC
	.4byte gSpriteAnim_83D9AE4

	.align 2
gSpriteAffineAnim_83D9AFC:: @ 83D9AFC
	obj_rot_scal_anim_frame 0x100, 0x100, 64, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D9B0C:: @ 83D9B0C
	.4byte gSpriteAffineAnim_83D9AFC

	.align 2
gSpriteTemplate_83D9B10:: @ 83D9B10
	spr_template 10001, 10001, gOamData_837E024, gSpriteAnimTable_83D9AEC, NULL, gSpriteAffineAnimTable_83D9B0C, sub_80D7230

	.align 2
gBattleAnimSpriteTemplate_83D9B28:: @ 83D9B28
	spr_template 10212, 10212, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D9A60, sub_80D727C

	.align 2
gSpriteTemplate_83D9B40:: @ 83D9B40
	spr_template 10001, 10001, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D755C

	.align 2
gSpriteAnim_83D9B58:: @ 83D9B58
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 1, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9B64:: @ 83D9B64
	.4byte gSpriteAnim_83D9B58

	.align 2
gSpriteTemplate_83D9B68:: @ 83D9B68
	spr_template 10141, 10141, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D7704

	.align 2
gSpriteAnim_83D9B80:: @ 83D9B80
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9B88:: @ 83D9B88
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9B90:: @ 83D9B90
	obj_image_anim_frame 6, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9B98:: @ 83D9B98
	obj_image_anim_frame 7, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9BA0:: @ 83D9BA0
	obj_image_anim_frame 8, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9BA8:: @ 83D9BA8
	obj_image_anim_frame 12, 6
	obj_image_anim_frame 13, 6
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9BB4:: @ 83D9BB4
	.4byte gSpriteAnim_83D9B80

	.align 2
gSpriteAnimTable_83D9BB8:: @ 83D9BB8
	.4byte gSpriteAnim_83D9B88

	.align 2
gSpriteAnimTable_83D9BBC:: @ 83D9BBC
	.4byte gSpriteAnim_83D9B90

	.align 2
gSpriteAnimTable_83D9BC0:: @ 83D9BC0
	.4byte gSpriteAnim_83D9B98

	.align 2
gSpriteAnimTable_83D9BC4:: @ 83D9BC4
	.4byte gSpriteAnim_83D9BA0

	.align 2
gSpriteAnimTable_83D9BC8:: @ 83D9BC8
	.4byte gSpriteAnim_83D9BA8

	.align 2
gSpriteAffineAnim_83D9BCC:: @ 83D9BCC
	obj_rot_scal_anim_frame 0x0, 0x0, 40, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D9BDC:: @ 83D9BDC
	.4byte gSpriteAffineAnim_83D9BCC

	.align 2
gBattleAnimSpriteTemplate_83D9BE0:: @ 83D9BE0
	spr_template 10141, 10141, gOamData_837E144, gSpriteAnimTable_83D9BB8, NULL, gSpriteAffineAnimTable_83D9BDC, sub_80D78EC

	.align 2
gBattleAnimSpriteTemplate_83D9BF8:: @ 83D9BF8
	spr_template 10141, 10141, gOamData_837E044, gSpriteAnimTable_83D9BBC, NULL, gDummySpriteAffineAnimTable, sub_80D78EC

	.align 2
gSpriteAffineAnim_83D9C10:: @ 83D9C10
	obj_rot_scal_anim_frame 0x0, 0x0, 10, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D9C20:: @ 83D9C20
	.4byte gSpriteAffineAnim_83D9C10

	.align 2
gBattleAnimSpriteTemplate_83D9C24:: @ 83D9C24
	spr_template 10141, 10141, gOamData_837E0E4, gSpriteAnimTable_83D9BB8, NULL, gSpriteAffineAnimTable_83D9C20, sub_80D792C

	.align 2
gBattleAnimSpriteTemplate_83D9C3C:: @ 83D9C3C
	spr_template 10141, 10141, gOamData_837E044, gSpriteAnimTable_83D9BBC, NULL, gDummySpriteAffineAnimTable, sub_80D792C

	.align 2
gSpriteAffineAnim_83D9C54:: @ 83D9C54
	obj_rot_scal_anim_frame 0xCE, 0xCE, 0, 0
	obj_rot_scal_anim_frame 0x5, 0x5, 0, 10
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 6
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D9C74:: @ 83D9C74
	.4byte gSpriteAffineAnim_83D9C54

	.align 2
gBattleAnimSpriteTemplate_83D9C78:: @ 83D9C78
	spr_template 10141, 10141, gOamData_837E0E4, gSpriteAnimTable_83D9BB8, NULL, gSpriteAffineAnimTable_83D9C74, sub_80D79B4

	.align 2
gBattleAnimSpriteTemplate_83D9C90:: @ 83D9C90
	spr_template 10141, 10141, gOamData_837E0A4, gSpriteAnimTable_83D9BBC, NULL, gSpriteAffineAnimTable_83D9C74, sub_80D79B4

	.align 2
gBattleAnimSpriteTemplate_83D9CA8:: @ 83D9CA8
	spr_template 10141, 10141, gOamData_837DF24, gSpriteAnimTable_83D9BC0, NULL, gDummySpriteAffineAnimTable, sub_80D7A64

	.align 2
gBattleAnimSpriteTemplate_83D9CC0:: @ 83D9CC0
	spr_template 10141, 10141, gOamData_837DF2C, gSpriteAnimTable_83D9BC4, NULL, gDummySpriteAffineAnimTable, sub_80D7CD4

	.align 2
gBattleAnimSpriteTemplate_83D9CD8:: @ 83D9CD8
	spr_template 10141, 10141, gOamData_837DF24, gSpriteAnimTable_83D9BC0, NULL, gDummySpriteAffineAnimTable, sub_80D7CD4

	.align 2
gSpriteAnim_83D9CF0:: @ 83D9CF0
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 6, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9D10:: @ 83D9D10
	.4byte gSpriteAnim_83D9CF0

	.align 2
gBattleAnimSpriteTemplate_83D9D14:: @ 83D9D14
	spr_template 10142, 10142, gOamData_837E084, gSpriteAnimTable_83D9D10, NULL, gDummySpriteAffineAnimTable, sub_80D7E88

	.align 2
gSpriteAnim_83D9D2C:: @ 83D9D2C
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 8, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9D38:: @ 83D9D38
	.4byte gSpriteAnim_83D9D2C

	.align 2
gBattleAnimSpriteTemplate_83D9D3C:: @ 83D9D3C
	spr_template 10144, 10144, gOamData_837E074, gSpriteAnimTable_83D9D38, NULL, gDummySpriteAffineAnimTable, sub_80D7F10

	.align 2
gBattleAnimSpriteTemplate_83D9D54:: @ 83D9D54
	spr_template 10172, 10172, gOamData_837E074, gSpriteAnimTable_83D9D38, NULL, gDummySpriteAffineAnimTable, sub_80D7F10

	.align 2
gUnknown_083D9D6C:: @ 83D9D6C
	.byte 0, 1, 2, 2, 2, 2, 3, 4, 4, 4, 5, 6, 6, 6, 6, 7, 8, 8, 8, 9

	.align 2
gBattleAnimSpriteTemplate_83D9D80:: @ 83D9D80
	spr_template 10155, 10155, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D83E0

	.align 2
gUnknown_083D9D98:: @ 83D9D98
	.byte 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5

	.align 2
gBattleAnimSpriteTemplate_83D9DAC:: @ 83D9DAC
	spr_template 10172, 10172, gOamData_837E074, gSpriteAnimTable_83D9D38, NULL, gDummySpriteAffineAnimTable, sub_80D8700

@ bitfield array
	.align 2
gUnknown_083D9DC4:: @ 83D9DC4
	.4byte 0x2001E064
	.4byte 0x0001E055
	.4byte 0x1011E0F2
	.4byte 0x1021E042
	.4byte 0x0031E0B6
	.4byte 0x2001E03C
	.4byte 0x0011E0D6
	.4byte 0x1001E071
	.4byte 0x1031E0D2
	.4byte 0x0021E026

	.align 2
gSpriteAffineAnim_83D9DEC:: @ 83D9DEC
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9DFC:: @ 83D9DFC
	obj_rot_scal_anim_frame 0xF0, 0xF0, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9E0C:: @ 83D9E0C
	obj_rot_scal_anim_frame 0xE0, 0xE0, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9E1C:: @ 83D9E1C
	obj_rot_scal_anim_frame 0x150, 0x150, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D9E2C:: @ 83D9E2C
	.4byte gSpriteAffineAnim_83D9DEC
	.4byte gSpriteAffineAnim_83D9DFC
	.4byte gSpriteAffineAnim_83D9E0C

	.align 2
gSpriteAffineAnimTable_83D9E38:: @ 83D9E38
	.4byte gSpriteAffineAnim_83D9E1C

	.align 2
gSpriteTemplate_83D9E3C:: @ 83D9E3C
	spr_template 10263, 10263, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D9E2C, sub_80D8D1C

	.align 2
gBattleAnimSpriteTemplate_83D9E54:: @ 83D9E54
	spr_template 10263, 10263, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D9E38, sub_807A9BC

	.align 2
gSpriteAnim_83D9E6C:: @ 83D9E6C
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9E74:: @ 83D9E74
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9E88:: @ 83D9E88
	.4byte gSpriteAnim_83D9E6C
	.4byte gSpriteAnim_83D9E74

	.align 2
gSpriteAffineAnim_83D9E90:: @ 83D9E90
	obj_rot_scal_anim_frame 0xE0, 0xE0, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9EA0:: @ 83D9EA0
	obj_rot_scal_anim_frame 0x118, 0x118, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9EB0:: @ 83D9EB0
	obj_rot_scal_anim_frame 0x150, 0x150, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9EC0:: @ 83D9EC0
	obj_rot_scal_anim_frame 0x180, 0x180, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9ED0:: @ 83D9ED0
	obj_rot_scal_anim_frame 0x1C0, 0x1C0, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D9EE0:: @ 83D9EE0
	.4byte gSpriteAffineAnim_83D9E90
	.4byte gSpriteAffineAnim_83D9EA0
	.4byte gSpriteAffineAnim_83D9EB0
	.4byte gSpriteAffineAnim_83D9EC0
	.4byte gSpriteAffineAnim_83D9ED0

	.align 2
gBattleAnimSpriteTemplate_83D9EF4:: @ 83D9EF4
	spr_template 10043, 10043, gOamData_837DFF4, gSpriteAnimTable_83D9E88, NULL, gSpriteAffineAnimTable_83D9EE0, unc_080B06FC

	.align 2
gBattleAnimSpriteTemplate_83D9F0C:: @ 83D9F0C
	spr_template 10141, 10141, gOamData_837DF24, gSpriteAnimTable_83D9BBC, NULL, gDummySpriteAffineAnimTable, sub_80D8F10

	.align 2
gSpriteTemplate_83D9F24:: @ 83D9F24
	spr_template 10050, 10050, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_080B08A0

	.align 2
gSpriteAnim_83D9F3C:: @ 83D9F3C
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9F44:: @ 83D9F44
	obj_image_anim_frame 16, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9F4C:: @ 83D9F4C
	obj_image_anim_frame 32, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9F54:: @ 83D9F54
	obj_image_anim_frame 48, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9F5C:: @ 83D9F5C
	obj_image_anim_frame 48, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9F64:: @ 83D9F64
	.4byte gSpriteAnim_83D9F3C

	.align 2
gSpriteAnimTable_83D9F68:: @ 83D9F68
	.4byte gSpriteAnim_83D9F44
	.4byte gSpriteAnim_83D9F4C

	.align 2
gSpriteAnimTable_83D9F70:: @ 83D9F70
	.4byte gSpriteAnim_83D9F54
	.4byte gSpriteAnim_83D9F5C

	.align 2
gBattleAnimSpriteTemplate_83D9F78:: @ 83D9F78
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F64, NULL, gDummySpriteAffineAnimTable, sub_80D902C

	.align 2
gBattleAnimSpriteTemplate_83D9F90:: @ 83D9F90
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F64, NULL, gDummySpriteAffineAnimTable, sub_80D9078

	.align 2
gBattleAnimSpriteTemplate_83D9FA8:: @ 83D9FA8
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F64, NULL, gDummySpriteAffineAnimTable, sub_80D90A4

	.align 2
gBattleAnimSpriteTemplate_83D9FC0:: @ 83D9FC0
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F64, NULL, gDummySpriteAffineAnimTable, sub_80D90F4

	.align 2
gBattleAnimSpriteTemplate_83D9FD8:: @ 83D9FD8
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F70, NULL, gDummySpriteAffineAnimTable, sub_80D92D0

	.align 2
gBattleAnimSpriteTemplate_83D9FF0:: @ 83D9FF0
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F68, NULL, gDummySpriteAffineAnimTable, sub_80D9378

	.align 2
gSpriteAffineAnim_83DA008:: @ 83DA008
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 20, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83DA020:: @ 83DA020
	.4byte gSpriteAffineAnim_83DA008

	.align 2
gBattleAnimSpriteTemplate_83DA024:: @ 83DA024
	spr_template 10143, 10143, gOamData_837DFF4, gSpriteAnimTable_83D9F64, NULL, gSpriteAffineAnimTable_83DA020, sub_80D943C

	.align 2
gSpriteAffineAnim_83DA03C:: @ 83DA03C
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFC, 20, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83DA054:: @ 83DA054
	.4byte gSpriteAffineAnim_83DA03C

	.align 2
gBattleAnimSpriteTemplate_83DA058:: @ 83DA058
	spr_template 10143, 10143, gOamData_837DFF4, gSpriteAnimTable_83D9F64, NULL, gSpriteAffineAnimTable_83DA054, sub_80D943C

	.align 2
gBattleAnimSpriteTemplate_83DA070:: @ 83DA070
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F68, NULL, gDummySpriteAffineAnimTable, sub_80D94A8

	.align 2
gBattleAnimSpriteTemplate_83DA088:: @ 83DA088
	spr_template 10073, 10073, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D9540

	.align 2
gBattleAnimSpriteTemplate_83DA0A0:: @ 83DA0A0
	spr_template 10167, 10167, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D95D0

	.align 2
gBattleAnimSpriteTemplate_83DA0B8:: @ 83DA0B8
	spr_template 10208, 10208, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D96B8

	.align 2
gSpriteAffineAnim_83DA0D0:: @ 83DA0D0
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 64
	obj_rot_scal_anim_frame 0xFFFA, 0xFFFA, 0, 8
	obj_rot_scal_anim_frame 0x6, 0x6, 0, 8
	obj_rot_scal_anim_jump 2

	.align 2
gSpriteAffineAnimTable_83DA0F8:: @ 83DA0F8
	.4byte gSpriteAffineAnim_83DA0D0

	.align 2
gBattleAnimSpriteTemplate_83DA0FC:: @ 83DA0FC
	spr_template 10212, 10212, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA0F8, sub_80D97CC

	.align 2
gBattleAnimSpriteTemplate_83DA114:: @ 83DA114
	spr_template 10257, 10257, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D98D8

	.align 2
gBattleAnimSpriteTemplate_83DA12C:: @ 83DA12C
	spr_template 10256, 10256, gOamData_837DF3C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D9A38

	.align 2
gBattleAnimSpriteTemplate_83DA144:: @ 83DA144
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F64, NULL, gDummySpriteAffineAnimTable, sub_80D9B48

	.align 2
gSpriteAnim_83DA15C:: @ 83DA15C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA16C:: @ 83DA16C
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA17C:: @ 83DA17C
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA18C:: @ 83DA18C
	.4byte gSpriteAnim_83DA15C
	.4byte gSpriteAnim_83DA16C
	.4byte gSpriteAnim_83DA17C

	.align 2
gBattleAnimSpriteTemplate_83DA198:: @ 83DA198
	spr_template 10245, 10245, gOamData_837DF34, gSpriteAnimTable_83DA18C, NULL, gDummySpriteAffineAnimTable, sub_80D9BD4

	.align 2
gSpriteAnim_83DA1B0:: @ 83DA1B0
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 64, 6
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA1BC:: @ 83DA1BC
	obj_image_anim_frame 0, 6, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 6, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA1C8:: @ 83DA1C8
	obj_image_anim_frame 0, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA1D4:: @ 83DA1D4
	.4byte gSpriteAnim_83DA1B0
	.4byte gSpriteAnim_83DA1BC
	.4byte gSpriteAnim_83DA1C8

	.align 2
gBattleAnimSpriteTemplate_83DA1E0:: @ 83DA1E0
	spr_template 10246, 10246, gOamData_837DF3C, gSpriteAnimTable_83DA1D4, NULL, gDummySpriteAffineAnimTable, sub_80D9BD4

	.align 2
gSpriteAffineAnim_83DA1F8:: @ 83DA1F8
	obj_rot_scal_anim_frame 0x200, 0x200, 0, 0
	obj_rot_scal_anim_frame 0xFFE0, 0xFFE0, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA210:: @ 83DA210
	.4byte gSpriteAffineAnim_83DA1F8

	.align 2
gBattleAnimSpriteTemplate_83DA214:: @ 83DA214
	spr_template 10143, 10143, gOamData_837DFF4, gSpriteAnimTable_83D9F64, NULL, gSpriteAffineAnimTable_83DA210, sub_80D9C40

	.align 2
gSpriteAnim_83DA22C:: @ 83DA22C
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 24, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA240:: @ 83DA240
	.4byte gSpriteAnim_83DA22C

	.align 2
gBattleAnimSpriteTemplate_83DA244:: @ 83DA244
	spr_template 10151, 10151, gOamData_837DF74, gSpriteAnimTable_83DA240, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gSpriteAnim_83DA25C:: @ 83DA25C
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA264:: @ 83DA264
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA26C:: @ 83DA26C
	obj_image_anim_frame 8, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA274:: @ 83DA274
	.4byte gSpriteAnim_83DA25C

	.align 2
gSpriteAnimTable_83DA278:: @ 83DA278
	.4byte gSpriteAnim_83DA264

	.align 2
gSpriteAnimTable_83DA27C:: @ 83DA27C
	.4byte gSpriteAnim_83DA26C

	.align 2
gSpriteAffineAnim_83DA280:: @ 83DA280
	obj_rot_scal_anim_frame 0x160, 0x160, 0, 0
	obj_rot_scal_anim_frame 0xFFF6, 0xFFF6, 0, 10
	obj_rot_scal_anim_frame 0xA, 0xA, 0, 10
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83DA2A0:: @ 83DA2A0
	obj_rot_scal_anim_frame 0xEC, 0xEC, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA2B0:: @ 83DA2B0
	.4byte gSpriteAffineAnim_83DA280

	.align 2
gSpriteAffineAnimTable_83DA2B4:: @ 83DA2B4
	.4byte gSpriteAffineAnim_83DA2A0

	.align 2
gBattleAnimSpriteTemplate_83DA2B8:: @ 83DA2B8
	spr_template 10150, 10150, gOamData_837DFEC, gSpriteAnimTable_83DA274, NULL, gSpriteAffineAnimTable_83DA2B0, sub_80D9D70

	.align 2
gBattleAnimSpriteTemplate_83DA2D0:: @ 83DA2D0
	spr_template 10150, 10150, gOamData_837DFEC, gSpriteAnimTable_83DA274, NULL, gSpriteAffineAnimTable_83DA2B0, sub_80D9DF0

	.align 2
gBattleAnimSpriteTemplate_83DA2E8:: @ 83DA2E8
	spr_template 10150, 10150, gOamData_837DF8C, gSpriteAnimTable_83DA27C, NULL, gSpriteAffineAnimTable_83DA2B4, sub_80D9E94

	.align 2
gSpriteAffineAnim_83DA300:: @ 83DA300
	obj_rot_scal_anim_frame 0xFFF0, 0x10, 0, 6
	obj_rot_scal_anim_frame 0x10, 0xFFF0, 0, 6
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83DA318:: @ 83DA318
	.4byte gSpriteAffineAnim_83DA300

	.align 2
gBattleAnimSpriteTemplate_83DA31C:: @ 83DA31C
	spr_template 10150, 10150, gOamData_837DFEC, gSpriteAnimTable_83DA278, NULL, gSpriteAffineAnimTable_83DA318, sub_80D9F14

	.align 2
gSpriteAffineAnim_83DA334:: @ 83DA334
	obj_rot_scal_anim_frame 0x9C, 0x9C, 0, 0
	obj_rot_scal_anim_frame 0x5, 0x5, 0, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA34C:: @ 83DA34C
	.4byte gSpriteAffineAnim_83DA334

	.align 2
gBattleAnimSpriteTemplate_83DA350:: @ 83DA350
	spr_template 10150, 10150, gOamData_837DF8C, gSpriteAnimTable_83DA274, NULL, gSpriteAffineAnimTable_83DA34C, sub_80D9F88

	.align 2
gBattleAnimSpriteTemplate_83DA368:: @ 83DA368
	spr_template 10155, 10155, gOamData_837E0AC, gSpriteAnimTable_83D9310, NULL, gSpriteAffineAnimTable_83DA34C, sub_80D9F88

	.align 2
gBattleAnimSpriteTemplate_83DA380:: @ 83DA380
	spr_template 10009, 10009, gOamData_837DF7C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DA034

	.align 2
gSpriteAffineAnim_83DA398:: @ 83DA398
	obj_rot_scal_anim_frame 0x10, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xA, 0x0, 0, 24
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA3B0:: @ 83DA3B0
	.4byte gSpriteAffineAnim_83DA398

	.align 2
gBattleAnimSpriteTemplate_83DA3B4:: @ 83DA3B4
	spr_template 10009, 10009, gOamData_837DFDC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA3B0, sub_80DA16C

	.align 2
gSpriteAnim_83DA3CC:: @ 83DA3CC
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83DA3E0:: @ 83DA3E0
	.4byte gSpriteAnim_83DA3CC

	.align 2
gBattleAnimSpriteTemplate_83DA3E4:: @ 83DA3E4
	spr_template 10154, 10154, gOamData_837DF54, gSpriteAnimTable_83DA3E0, NULL, gDummySpriteAffineAnimTable, sub_80DA208

	.align 2
gSpriteAffineAnim_83DA3FC:: @ 83DA3FC
	obj_rot_scal_anim_frame 0x10, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x28, 0x0, 0, 6
	obj_rot_scal_anim_frame 0x0, 0xFFE0, 0, 5
	obj_rot_scal_anim_frame 0xFFF0, 0x20, 0, 10
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA424:: @ 83DA424
	.4byte gSpriteAffineAnim_83DA3FC

	.align 2
gSpriteAffineAnim_83DA428:: @ 83DA428
	obj_rot_scal_anim_frame 0x0, 0x0, 50, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DA438:: @ 83DA438
	obj_rot_scal_anim_frame 0x0, 0x0, -40, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA448:: @ 83DA448
	.4byte gSpriteAffineAnim_83DA428
	.4byte gSpriteAffineAnim_83DA438

	.align 2
gBattleAnimSpriteTemplate_83DA450:: @ 83DA450
	spr_template 10156, 10156, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA424, sub_80DA300

	.align 2
gBattleAnimSpriteTemplate_83DA468:: @ 83DA468
	spr_template 10156, 10156, gOamData_837DF9C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA448, sub_80DA38C

	.align 2
gSpriteAnim_83DA480:: @ 83DA480
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA488:: @ 83DA488
	obj_image_anim_frame 16, 0, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA490:: @ 83DA490
	.4byte gSpriteAnim_83DA480
	.4byte gSpriteAnim_83DA488

	.align 2
gBattleAnimSpriteTemplate_83DA498:: @ 83DA498
	spr_template 10270, 10270, gOamData_837DF94, gSpriteAnimTable_83DA490, NULL, gDummySpriteAffineAnimTable, sub_80DA4D8

	.align 2
@ unused palette
	.incbin "graphics/unknown/unknown_3DA4B0.gbapal"

	.align 2
gSpriteTemplate_83DA4D0:: @ 83DA4D0
	spr_template 10155, 10155, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DAD30

	.align 2
gSpriteTemplate_83DA4E8:: @ 83DA4E8
	spr_template 10270, 10270, gOamData_837DF94, gSpriteAnimTable_83DA490, NULL, gDummySpriteAffineAnimTable, sub_80DAD84

	.align 2
gSpriteAnim_83DA500:: @ 83DA500
	obj_image_anim_frame 0, 1
	obj_image_anim_frame 8, 1
	obj_image_anim_frame 16, 1
	obj_image_anim_frame 8, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA518:: @ 83DA518
	.4byte gSpriteAnim_83DA500

	.align 2
gBattleAnimSpriteTemplate_83DA51C:: @ 83DA51C
	spr_template 10162, 10162, gOamData_837DF54, gSpriteAnimTable_83DA518, NULL, gDummySpriteAffineAnimTable, sub_80DB000

	.align 2
gSpriteAffineAnim_83DA534:: @ 83DA534
	obj_rot_scal_anim_frame 0x10, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x28, 0x0, 0, 6
	obj_rot_scal_anim_frame 0x0, 0xFFE0, 0, 5
	obj_rot_scal_anim_frame 0xFFEC, 0x0, 0, 7
	obj_rot_scal_anim_frame 0xFFEC, 0xFFEC, 0, 5
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA564:: @ 83DA564
	.4byte gSpriteAffineAnim_83DA534

	.align 2
gBattleAnimSpriteTemplate_83DA568:: @ 83DA568
	spr_template 10156, 10156, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA564, sub_80DB194

	.align 2
gSpriteAffineAnim_83DA580:: @ 83DA580
	obj_rot_scal_anim_frame 0xA0, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA590:: @ 83DA590
	.4byte gSpriteAffineAnim_83DA580

	.align 2
gBattleAnimSpriteTemplate_83DA594:: @ 83DA594
	spr_template 10156, 10156, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA590, sub_80DB1F4

	.align 2
gSpriteAffineAnim_83DA5AC:: @ 83DA5AC
	obj_rot_scal_anim_frame 0x10, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x28, 0x0, 0, 6
	obj_rot_scal_anim_frame 0x0, 0xFFE0, 0, 5
	obj_rot_scal_anim_frame 0xFFF0, 0x20, 0, 10
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA5D4:: @ 83DA5D4
	.4byte gSpriteAffineAnim_83DA5AC

	.align 2
gBattleAnimSpriteTemplate_83DA5D8:: @ 83DA5D8
	spr_template 10156, 10156, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA5D4, sub_80DB288

	.align 2
gSpriteAffineAnim_83DA5F0:: @ 83DA5F0
	obj_rot_scal_anim_frame 0x100, 0x0, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x20, 0, 12
	obj_rot_scal_anim_frame 0x0, 0xFFE0, 0, 11
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA610:: @ 83DA610
	.4byte gSpriteAffineAnim_83DA5F0

	.align 2
gBattleAnimSpriteTemplate_83DA614:: @ 83DA614
	spr_template 10272, 10272, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB374

	.align 2
gBattleAnimSpriteTemplate_83DA62C:: @ 83DA62C
	spr_template 10273, 10273, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB458

	.align 2
gSpriteTemplate_83DA644:: @ 83DA644
	spr_template 10212, 10212, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB564

	.align 2
gBattleAnimSpriteTemplate_83DA65C:: @ 83DA65C
	spr_template 10284, 10284, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB5E4

	.align 2
gSpriteAffineAnim_83DA674:: @ 83DA674
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFFE, 0xFFFE, -10, 120
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA68C:: @ 83DA68C
	.4byte gSpriteAffineAnim_83DA674

	.align 2
gBattleAnimSpriteTemplate_83DA690:: @ 83DA690
	spr_template 10196, 10196, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA68C, sub_80793C4

	.align 2
gBattleAnimSpriteTemplate_83DA6A8:: @ 83DA6A8
	spr_template 10166, 10166, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB74C

	.align 2
gBattleAnimSpriteTemplate_83DA6C0:: @ 83DA6C0
	spr_template 10167, 10167, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB74C

	.align 2
gBattleAnimSpriteTemplate_83DA6D8:: @ 83DA6D8
	spr_template 10168, 10168, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB74C

	.align 2
gBattleAnimSpriteTemplate_83DA6F0:: @ 83DA6F0
	spr_template 10169, 10169, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB74C

	.align 2
gBattleAnimSpriteTemplate_83DA708:: @ 83DA708
	spr_template 10170, 10170, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB74C

	.align 2
gSpriteAnim_83DA720:: @ 83DA720
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA738:: @ 83DA738
	.4byte gSpriteAnim_83DA720

	.align 2
gBattleAnimSpriteTemplate_83DA73C:: @ 83DA73C
	spr_template 10071, 10071, gOamData_837DF34, gSpriteAnimTable_83DA738, NULL, gDummySpriteAffineAnimTable, sub_80DBA4C

	.align 2
gSpriteAnim_83DA754:: @ 83DA754
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA768:: @ 83DA768
	.4byte gSpriteAnim_83DA754

	.align 2
gBattleAnimSpriteTemplate_83DA76C:: @ 83DA76C
	spr_template 10070, 10070, gOamData_837DF2C, gSpriteAnimTable_83DA768, NULL, gDummySpriteAffineAnimTable, sub_80DBA4C

	.align 2
gBattleAnimSpriteTemplate_83DA784:: @ 83DA784
	spr_template 10163, 10163, gOamData_837DF74, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_807941C

	.align 2
gSpriteAnim_83DA79C:: @ 83DA79C
	obj_image_anim_frame 8, 60, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 22, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_loop 0
	obj_image_anim_frame 16, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_loop 1
	obj_image_anim_frame 8, 22, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 24, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 40, 22, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA7DC:: @ 83DA7DC
	obj_image_anim_frame 8, 60
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 8, 22
	obj_image_anim_loop 0
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_loop 1
	obj_image_anim_frame 8, 22
	obj_image_anim_frame 24, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 40, 22
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA81C:: @ 83DA81C
	.4byte gSpriteAnim_83DA79C
	.4byte gSpriteAnim_83DA7DC

	.align 2
gBattleAnimSpriteTemplate_83DA824:: @ 83DA824
	spr_template 10097, 10097, gOamData_837DF74, gSpriteAnimTable_83DA81C, NULL, gDummySpriteAffineAnimTable, sub_80DBAF4

	.align 2
gSpriteAnim_83DA83C:: @ 83DA83C
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 6
	obj_image_anim_frame 48, 6
	obj_image_anim_frame 64, 6
	obj_image_anim_frame 80, 6
	obj_image_anim_frame 96, 18
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA85C:: @ 83DA85C
	.4byte gSpriteAnim_83DA83C

	.align 2
Unknown_3DA860:: @ 83DA860
	obj_rot_scal_anim_frame 0, 0, 4, 4
	obj_rot_scal_anim_frame 0, 0, -4, 8
	obj_rot_scal_anim_frame 0, 0, 4, 4
	obj_rot_scal_anim_loop 2
	obj_rot_scal_anim_end 0

	.align 2
gUnknown_083DA888:: @ 83DA888
	.4byte Unknown_3DA860

	.align 2
gBattleAnimSpriteTemplate_83DA88C:: @ 83DA88C
	spr_template 10093, 10093, gOamData_837DF34, gSpriteAnimTable_83DA85C, NULL, gDummySpriteAffineAnimTable, sub_80DBB70

	.align 2
gUnknown_083DA8A4:: @ 83DA8A4
	obj_rot_scal_anim_frame -8, 10, 0, 16
	obj_rot_scal_anim_frame 18, -18, 0, 16
	obj_rot_scal_anim_frame -20, 16, 0, 8
	obj_rot_scal_anim_end 0

	.align 2
gUnknown_083DA8C4:: @ 83DA8C4
	obj_rot_scal_anim_frame 64, -4, 0, 20
	obj_rot_scal_anim_frame 0, 0, 0, -56
	obj_rot_scal_anim_end 0

	.align 2
gSpriteTemplate_83DA8DC:: @ 83DA8DC
	spr_template 10249, 10249, gOamData_837E04C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gBattleAnimSpriteTemplate_83DA8F4:: @ 83DA8F4
	spr_template 10250, 10250, gOamData_837DF3C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DC068

	.align 2
gSpriteAffineAnim_83DA90C:: @ 83DA90C
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 8
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 8
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83DA924:: @ 83DA924
	obj_rot_scal_anim_frame 0xF0, 0xF0, 0, 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 6
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 8
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 2
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnim_83DA94C:: @ 83DA94C
	obj_rot_scal_anim_frame 0xD0, 0xD0, 0, 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 4
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 8
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 4
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnim_83DA974:: @ 83DA974
	obj_rot_scal_anim_frame 0xB0, 0xB0, 0, 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 2
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 8
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 6
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83DA99C:: @ 83DA99C
	.4byte gSpriteAffineAnim_83DA90C
	.4byte gSpriteAffineAnim_83DA924
	.4byte gSpriteAffineAnim_83DA94C
	.4byte gSpriteAffineAnim_83DA974

	.align 2
gSpriteTemplate_83DA9AC:: @ 83DA9AC
	spr_template 10251, 10251, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA99C, sub_80DC2B0

	.align 2
gSpriteAffineAnim_83DA9C4:: @ 83DA9C4
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 120
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnimTable_83DA9DC:: @ 83DA9DC
	.4byte gSpriteAffineAnim_83DA9C4

	.align 2
gBattleAnimSpriteTemplate_83DA9E0:: @ 83DA9E0
	spr_template 10267, 10267, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA9DC, sub_80793C4

	.align 2
gSpriteAffineAnim_83DA9F8:: @ 83DA9F8
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 0
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 17
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 10
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 10
	obj_rot_scal_anim_loop 4
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0xFFF0, 0xFFF0, 0, 5
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 5
	obj_rot_scal_anim_loop 7
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DAA50:: @ 83DAA50
	obj_rot_scal_anim_frame 0xFFEC, 0x18, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DAA60:: @ 83DAA60
	.4byte gSpriteAffineAnim_83DA9F8
	.4byte gSpriteAffineAnim_83DAA50

	.align 2
gBattleAnimSpriteTemplate_83DAA68:: @ 83DAA68
	spr_template 10212, 10212, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAA60, sub_80DC700

	.align 2
gSpriteAffineAnim_83DAA80:: @ 83DAA80
	obj_rot_scal_anim_frame 0x100, 0x100, 30, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DAA90:: @ 83DAA90
	obj_rot_scal_anim_frame 0x100, 0x100, -99, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DAAA0:: @ 83DAAA0
	obj_rot_scal_anim_frame 0x100, 0x100, 94, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DAAB0:: @ 83DAAB0
	.4byte gSpriteAffineAnim_83DAA80
	.4byte gSpriteAffineAnim_83DAA90
	.4byte gSpriteAffineAnim_83DAAA0

	.align 2
gBattleAnimSpriteTemplate_83DAABC:: @ 83DAABC
	spr_template 10153, 10153, gOamData_837E014, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAAB0, sub_80DC824

	.align 2
gSpriteAffineAnim_83DAAD4:: @ 83DAAD4
	obj_rot_scal_anim_frame 0x0, 0x0, -33, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DAAE4:: @ 83DAAE4
	obj_rot_scal_anim_frame 0x0, 0x0, 96, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DAAF4:: @ 83DAAF4
	obj_rot_scal_anim_frame 0x0, 0x0, -96, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DAB04:: @ 83DAB04
	.4byte gSpriteAffineAnim_83DAAD4
	.4byte gSpriteAffineAnim_83DAAE4
	.4byte gSpriteAffineAnim_83DAAF4

	.align 2
gBattleAnimSpriteTemplate_83DAB10:: @ 83DAB10
	spr_template 10161, 10161, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAB04, sub_80DC8F4

	.align 2
gBattleAnimSpriteTemplate_83DAB28:: @ 83DAB28
	spr_template 10180, 10180, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DC9A0

	.align 2
gBattleAnimSpriteTemplate_83DAB40:: @ 83DAB40
	spr_template 10179, 10179, gOamData_837DF5C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DCA70

	.align 2
gSpriteAffineAnim_83DAB58:: @ 83DAB58
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x6, 0x6, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83DAB70:: @ 83DAB70
	.4byte gSpriteAffineAnim_83DAB58

	.align 2
gBattleAnimSpriteTemplate_83DAB74:: @ 83DAB74
	spr_template 10181, 10181, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAB70, sub_80DCB38

	.align 2
gBattleAnimSpriteTemplate_83DAB8C:: @ 83DAB8C
	spr_template 10161, 10161, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DCBCC

	.align 2
gBattleAnimSpriteTemplate_83DABA4:: @ 83DABA4
	spr_template 10161, 10161, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DCCFC

	.align 2
gBattleAnimSpriteTemplate_83DABBC:: @ 83DABBC
	spr_template 10262, 10262, gOamData_837DF94, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DCCFC

	.align 2
gSpriteAffineAnim_83DABD4:: @ 83DABD4
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 18
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0xFFFB, 0xFFFB, 0, 8
	obj_rot_scal_anim_frame 0x5, 0x5, 0, 8
	obj_rot_scal_anim_loop 5
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DAC0C:: @ 83DAC0C
	.4byte gSpriteAffineAnim_83DABD4

	.align 2
gBattleAnimSpriteTemplate_83DAC10:: @ 83DAC10
	spr_template 10212, 10212, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAC0C, sub_80DCE40

	.align 2
gSpriteAnim_83DAC28:: @ 83DAC28
	obj_image_anim_frame 32, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAC30:: @ 83DAC30
	obj_image_anim_frame 48, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAC38:: @ 83DAC38
	obj_image_anim_frame 64, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DAC40:: @ 83DAC40
	.4byte gSpriteAnim_83DAC28
	.4byte gSpriteAnim_83DAC30
	.4byte gSpriteAnim_83DAC38

	.align 2
gBattleAnimSpriteTemplate_83DAC4C:: @ 83DAC4C
	spr_template 10058, 10058, gOamData_837DF34, gSpriteAnimTable_83DAC40, NULL, gDummySpriteAffineAnimTable, sub_80DCE9C

	.align 2
gBattleAnimSpriteTemplate_83DAC64:: @ 83DAC64
	spr_template 10058, 10058, gOamData_837DF34, gSpriteAnimTable_83DAC40, NULL, gDummySpriteAffineAnimTable, sub_80DCF60

	.align 2
gBattleAnimSpriteTemplate_83DAC7C:: @ 83DAC7C
	spr_template 10074, 10074, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DCFE4

	.align 2
gSpriteAffineAnim_83DAC94:: @ 83DAC94
	obj_rot_scal_anim_frame 0xC0, 0xC0, 0, 0
	obj_rot_scal_anim_frame 0x2, 0xFFFD, 0, 5
	obj_rot_scal_anim_frame 0xFFFE, 0x3, 0, 5
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83DACB4:: @ 83DACB4
	.4byte gSpriteAffineAnim_83DAC94

	.align 2
gBattleAnimSpriteTemplate_83DACB8:: @ 83DACB8
	spr_template 10149, 10149, gOamData_837E0AC, gSpriteAnimTable_83D91F0, NULL, gSpriteAffineAnimTable_83DACB4, sub_80DCFE4

	.align 2
gBattleAnimSpriteTemplate_83DACD0:: @ 83DACD0
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D95E0, NULL, gDummySpriteAffineAnimTable, sub_80DCFE4

	.align 2
gBattleAnimSpriteTemplate_83DACE8:: @ 83DACE8
	spr_template 10261, 10261, gOamData_837DF54, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DD3AC

	.align 2
Unknown_3DAD00:: @ 83DAD00
	subsprite -16,   0, 1,   0, 32x16
	subsprite  16,   0, 1,   8, 32x16

	.align 2
gUnknown_083DAD10:: @ 83DAD10
@ the first argument is likely the amount of structs there are in the pointed data.
	.4byte 0x2, Unknown_3DAD00

	.align 2
gSpriteAnim_83DAD18:: @ 83DAD18
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAD20:: @ 83DAD20
	obj_image_anim_frame 16, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAD28:: @ 83DAD28
	obj_image_anim_frame 32, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAD30:: @ 83DAD30
	obj_image_anim_frame 48, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAD38:: @ 83DAD38
	obj_image_anim_frame 64, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAD40:: @ 83DAD40
	obj_image_anim_frame 80, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DAD48:: @ 83DAD48
	.4byte gSpriteAnim_83DAD18
	.4byte gSpriteAnim_83DAD20

	.align 2
gSpriteAnimTable_83DAD50:: @ 83DAD50
	.4byte gSpriteAnim_83DAD28
	.4byte gSpriteAnim_83DAD30

	.align 2
gSpriteAnimTable_83DAD58:: @ 83DAD58
	.4byte gSpriteAnim_83DAD38
	.4byte gSpriteAnim_83DAD40

	.align 2
gBattleAnimSpriteTemplate_83DAD60:: @ 83DAD60
	spr_template 10058, 10058, gOamData_837DF34, gSpriteAnimTable_83DAD48, NULL, gDummySpriteAffineAnimTable, sub_80DD490

	.align 2
gSpriteTemplate_83DAD78:: @ 83DAD78
	spr_template 10074, 10074, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DD87C

	.align 2
gSpriteTemplate_83DAD90:: @ 83DAD90
	spr_template 10058, 10058, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DD87C

	.align 2
gBattleAnimSpriteTemplate_83DADA8:: @ 83DADA8
	spr_template 10058, 10058, gOamData_837DF34, gSpriteAnimTable_83DAD48, NULL, gDummySpriteAffineAnimTable, sub_80DD8E8

	.align 2
gSpriteAffineAnim_83DADC0:: @ 83DADC0
	obj_rot_scal_anim_frame 0x0, 0x0, -5, 5
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83DADD0:: @ 83DADD0
	obj_rot_scal_anim_frame 0x0, 0x0, 5, 5
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83DADE0:: @ 83DADE0
	.4byte gSpriteAffineAnim_83DADC0
	.4byte gSpriteAffineAnim_83DADD0

	.align 2
gBattleAnimSpriteTemplate_83DADE8:: @ 83DADE8
	spr_template 10058, 10058, gOamData_837DF94, gSpriteAnimTable_83DAD48, NULL, gSpriteAffineAnimTable_83DADE0, sub_80DD978

	.align 2
gBattleAnimSpriteTemplate_83DAE00:: @ 83DAE00
	spr_template 10058, 10058, gOamData_837DF94, gSpriteAnimTable_83DAD48, NULL, gSpriteAffineAnimTable_83DADE0, sub_80DD9A4

	.align 2
gBattleAnimSpriteTemplate_83DAE18:: @ 83DAE18
	spr_template 10058, 10058, gOamData_837DF34, gSpriteAnimTable_83DAD58, NULL, gSpriteAffineAnimTable_83DADE0, AnimMoveTwisterParticle

	.align 2
gBattleAnimSpriteTemplate_83DAE30:: @ 83DAE30
	spr_template 10058, 10058, gOamData_837DF94, gSpriteAnimTable_83DAD50, NULL, gSpriteAffineAnimTable_83DADE0, sub_807A9BC

	.align 2
gSpriteAffineAnim_83DAE48:: @ 83DAE48
	obj_rot_scal_anim_frame 0x1E, 0x1E, 10, 5
	obj_rot_scal_anim_frame 0xFFE2, 0xFFE2, 10, 5
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83DAE60:: @ 83DAE60
	.4byte gSpriteAffineAnim_83DAE48

	.align 2
gBattleAnimSpriteTemplate_83DAE64:: @ 83DAE64
	spr_template 10013, 10013, gOamData_837DFEC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAE60, sub_80DDB6C

	.align 2
gBattleAnimSpriteTemplate_83DAE7C:: @ 83DAE7C
	spr_template 10013, 10013, gOamData_837E04C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DDD58

	.align 2
gSpriteAffineAnim_83DAE94:: @ 83DAE94
	obj_rot_scal_anim_frame 0x0, 0x0, 10, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83DAEA4:: @ 83DAEA4
	.4byte gSpriteAffineAnim_83DAE94

	.align 2
gBattleAnimSpriteTemplate_83DAEA8:: @ 83DAEA8
	spr_template 10176, 10176, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAEA4, sub_80DDF40

	.align 2
gSpriteAnim_83DAEC0:: @ 83DAEC0
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 8, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 24, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DAED8:: @ 83DAED8
	.4byte gSpriteAnim_83DAEC0

	.align 2
gBattleAnimSpriteTemplate_83DAEDC:: @ 83DAEDC
	spr_template 10177, 10177, gOamData_837DF74, gSpriteAnimTable_83DAED8, NULL, gDummySpriteAffineAnimTable, sub_80DE0FC

	.align 2
gSpriteAffineAnim_83DAEF4:: @ 83DAEF4
	obj_rot_scal_anim_frame 0x200, 0x200, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DAF04:: @ 83DAF04
	.4byte gSpriteAffineAnim_83DAEF4

	.align 2
gSpriteTemplate_83DAF08:: @ 83DAF08
	spr_template 10188, 10188, gOamData_837E07C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DE7B8

	.align 2
gBattleAnimSpriteTemplate_83DAF20:: @ 83DAF20
	spr_template 10199, 10199, gOamData_837E074, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DEF3C

	.align 2
gBattleAnimSpriteTemplate_83DAF38:: @ 83DAF38
	spr_template 10200, 10200, gOamData_837E054, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DF0B8

	.align 2
gBattleAnimSpriteTemplate_83DAF50:: @ 83DAF50
	spr_template 10221, 10221, gOamData_837E054, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DF0B8

	.align 2
gSpriteAnim_83DAF68:: @ 83DAF68
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 24, 4
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83DAF7C:: @ 83DAF7C
	.4byte gSpriteAnim_83DAF68

	.align 2
gSpriteTemplate_83DAF80:: @ 83DAF80
	spr_template 10253, 10253, gOamData_837E094, gSpriteAnimTable_83DAF7C, NULL, gDummySpriteAffineAnimTable, sub_80DF3D8

	.align 2
gSpriteTemplate_83DAF98:: @ 83DAF98
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DF49C

	.align 2
gSpriteAnim_83DAFB0:: @ 83DAFB0
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83DAFC8:: @ 83DAFC8
	.4byte gSpriteAnim_83DAFB0

	.align 2
gBattleAnimSpriteTemplate_83DAFCC:: @ 83DAFCC
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83DAFC8, NULL, gDummySpriteAffineAnimTable, sub_80DF5A0

	.align 2
gSpriteAnim_83DAFE4:: @ 83DAFE4
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83DAFF4:: @ 83DAFF4
	obj_image_anim_frame 16, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83DB004:: @ 83DB004
	.4byte gSpriteAnim_83DAFE4
	.4byte gSpriteAnim_83DAFF4

	.align 2
gSpriteAffineAnim_83DB00C:: @ 83DB00C
	obj_rot_scal_anim_frame 0x50, 0x50, 127, 0
	obj_rot_scal_anim_frame 0xD, 0xD, 0, 100
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB024:: @ 83DB024
	obj_rot_scal_anim_frame 0x50, 0x50, 0, 0
	obj_rot_scal_anim_frame 0xD, 0xD, 0, 100
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DB03C:: @ 83DB03C
	.4byte gSpriteAffineAnim_83DB00C
	.4byte gSpriteAffineAnim_83DB024

	.align 2
gBattleAnimSpriteTemplate_83DB044:: @ 83DB044
	spr_template 10029, 10029, gOamData_837DFF4, gSpriteAnimTable_83DB004, NULL, gSpriteAffineAnimTable_83DB03C, sub_80DF760

	.align 2
gSpriteAnim_83DB05C:: @ 83DB05C
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_frame 64, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DB074:: @ 83DB074
	.4byte gSpriteAnim_83DB05C

	.align 2
gBattleAnimSpriteTemplate_83DB078:: @ 83DB078
	spr_template 10035, 10035, gOamData_837DF34, gSpriteAnimTable_83DB074, NULL, gDummySpriteAffineAnimTable, sub_80DF6F0

	.align 2
gSpriteAnim_83DB090:: @ 83DB090
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83DB0A0:: @ 83DB0A0
	.4byte gSpriteAnim_83DB090
	.4byte gSpriteAnim_83DB090

	.align 2
gSpriteAffineAnim_83DB0A8:: @ 83DB0A8
	obj_rot_scal_anim_frame 0x64, 0x64, 127, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB0B8:: @ 83DB0B8
	obj_rot_scal_anim_frame 0x64, 0x64, 0, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DB0C8:: @ 83DB0C8
	.4byte gSpriteAffineAnim_83DB0A8
	.4byte gSpriteAffineAnim_83DB0B8

	.align 2
gBattleAnimSpriteTemplate_83DB0D0:: @ 83DB0D0
	spr_template 10029, 10029, gOamData_837DFF4, gSpriteAnimTable_83DB0A0, NULL, gSpriteAffineAnimTable_83DB0C8, sub_80DF760

	.align 2
gBattleAnimSpriteTemplate_83DB0E8:: @ 83DB0E8
	spr_template 10249, 10249, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DF78C

	.align 2
gBattleAnimSpriteTemplate_83DB100:: @ 83DB100
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83DAFC8, NULL, gDummySpriteAffineAnimTable, sub_80DFB28

	.align 2
gSpriteTemplate_83DB118:: @ 83DB118
	spr_template 10015, 10015, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DFE14

	.align 2
gSpriteAffineAnim_83DB130:: @ 83DB130
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB140:: @ 83DB140
	obj_rot_scal_anim_frame 0x0, 0x0, 32, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB150:: @ 83DB150
	obj_rot_scal_anim_frame 0x0, 0x0, 64, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB160:: @ 83DB160
	obj_rot_scal_anim_frame 0x0, 0x0, 96, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB170:: @ 83DB170
	obj_rot_scal_anim_frame 0x0, 0x0, -128, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB180:: @ 83DB180
	obj_rot_scal_anim_frame 0x0, 0x0, -96, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB190:: @ 83DB190
	obj_rot_scal_anim_frame 0x0, 0x0, -64, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB1A0:: @ 83DB1A0
	obj_rot_scal_anim_frame 0x0, 0x0, -32, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DB1B0:: @ 83DB1B0
	.4byte gSpriteAffineAnim_83DB130
	.4byte gSpriteAffineAnim_83DB140
	.4byte gSpriteAffineAnim_83DB150
	.4byte gSpriteAffineAnim_83DB160
	.4byte gSpriteAffineAnim_83DB170
	.4byte gSpriteAffineAnim_83DB180
	.4byte gSpriteAffineAnim_83DB190
	.4byte gSpriteAffineAnim_83DB1A0

	.align 2
gBattleAnimSpriteTemplate_83DB1D0:: @ 83DB1D0
	spr_template 10139, 10139, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB1B0, sub_80DFF1C

	.align 2
gBattleAnimSpriteTemplate_83DB1E8:: @ 83DB1E8
	spr_template 10145, 10145, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB1B0, sub_80DFF1C

	.align 2
gSpriteAffineAnim_83DB200:: @ 83DB200
	obj_rot_scal_anim_frame 0xC0, 0xC0, 80, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -2, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB218:: @ 83DB218
	obj_rot_scal_anim_frame 0xC0, 0xC0, -80, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 2, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DB230:: @ 83DB230
	.4byte gSpriteAffineAnim_83DB200
	.4byte gSpriteAffineAnim_83DB218

	.align 2
gBattleAnimSpriteTemplate_83DB238:: @ 83DB238
	spr_template 10155, 10155, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB230, sub_80DFFD0

	.align 2
gSpriteAnim_83DB250:: @ 83DB250
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83DB268:: @ 83DB268
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DB280:: @ 83DB280
	.4byte gSpriteAnim_83DB250
	.4byte gSpriteAnim_83DB268

	.align 2
gBattleAnimSpriteTemplate_83DB288:: @ 83DB288
	spr_template 10039, 10039, gOamData_837DF34, gSpriteAnimTable_83DB280, NULL, gDummySpriteAffineAnimTable, sub_80E0A10

	.align 2
gSpriteAffineAnim_83DB2A0:: @ 83DB2A0
	obj_rot_scal_anim_frame 0x0, 0x0, 15, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83DB2B0:: @ 83DB2B0
	obj_rot_scal_anim_frame 0x0, 0x0, 20, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83DB2C0:: @ 83DB2C0
	.4byte gSpriteAffineAnim_83DB2A0

	.align 2
gSpriteAffineAnimTable_83DB2C4:: @ 83DB2C4
	.4byte gSpriteAffineAnim_83DB2B0

	.align 2
gBattleAnimSpriteTemplate_83DB2C8:: @ 83DB2C8
	spr_template 10000, 10000, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB2C0, sub_80E0F1C

	.align 2
gBattleAnimSpriteTemplate_83DB2E0:: @ 83DB2E0
	spr_template 10000, 10000, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB2C4, sub_80E1004

	.align 2
gBattleAnimSpriteTemplate_83DB2F8:: @ 83DB2F8
	spr_template 10074, 10074, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E1078

	.align 2
gSpriteAnim_83DB310:: @ 83DB310
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DB318:: @ 83DB318
	.4byte gSpriteAnim_83DB310

	.align 2
gBattleAnimSpriteTemplate_83DB31C:: @ 83DB31C
	spr_template 10074, 10074, gOamData_837DF2C, gSpriteAnimTable_83DB318, NULL, gDummySpriteAffineAnimTable, sub_80E1078

	.align 2
gBattleAnimSpriteTemplate_83DB334:: @ 83DB334
	spr_template 10074, 10074, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E1108

	.align 2
gBattleAnimSpriteTemplate_83DB34C:: @ 83DB34C
	spr_template 10074, 10074, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E1728

	.align 2
gBattleAnimSpriteTemplate_83DB364:: @ 83DB364
	spr_template 10281, 10281, gOamData_837DF54, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E17CC

	.align 2
gSpriteAnim_83DB37C:: @ 83DB37C
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83DB390:: @ 83DB390
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 8, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83DB3A4:: @ 83DB3A4
	.4byte gSpriteAnim_83DB37C
	.4byte gSpriteAnim_83DB390

	.align 2
gBattleAnimSpriteTemplate_83DB3AC:: @ 83DB3AC
	spr_template 10073, 10073, gOamData_837DF2C, gSpriteAnimTable_83DB3A4, NULL, gDummySpriteAffineAnimTable, sub_80E1CB4

	.align 2
gBattleAnimSpriteTemplate_83DB3C4:: @ 83DB3C4
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E1D84

	.align 2
gBattleAnimSpriteTemplate_83DB3DC:: @ 83DB3DC
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E1E2C

	.align 2
gSpriteAnim_83DB3F4:: @ 83DB3F4
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83DB40C:: @ 83DB40C
	.4byte gSpriteAnim_83DB3F4

	.align 2
gSpriteTemplate_83DB410:: @ 83DB410
	spr_template 10071, 10071, gOamData_837DF34, gSpriteAnimTable_83DB40C, NULL, gDummySpriteAffineAnimTable, sub_80E1F3C

	.align 2
gBattleAnimSpriteTemplate_83DB428:: @ 83DB428
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E24B8

	.align 2
gSpriteAffineAnim_83DB440:: @ 83DB440
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB450:: @ 83DB450
	obj_rot_scal_anim_frame 0xD8, 0xD8, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB468:: @ 83DB468
	obj_rot_scal_anim_frame 0xB0, 0xB0, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB480:: @ 83DB480
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DB498:: @ 83DB498
	.4byte gSpriteAffineAnim_83DB440
	.4byte gSpriteAffineAnim_83DB450
	.4byte gSpriteAffineAnim_83DB468
	.4byte gSpriteAffineAnim_83DB480

	.align 2
gBasicHitSplatSpriteTemplate:: @ 83DB4A8
	spr_template 10135, 10135, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E27A0

	.align 2
gBattleAnimSpriteTemplate_83DB4C0:: @ 83DB4C0
	spr_template 10135, 10135, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E2838

	.align 2
gBattleAnimSpriteTemplate_83DB4D8:: @ 83DB4D8
	spr_template 10148, 10148, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E27A0

	.align 2
gBattleAnimSpriteTemplate_83DB4F0:: @ 83DB4F0
	spr_template 10135, 10135, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E2870

	.align 2
gBattleAnimSpriteTemplate_83DB508:: @ 83DB508
	spr_template 10135, 10135, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E2908

	.align 2
gBattleAnimSpriteTemplate_83DB520:: @ 83DB520
	spr_template 10285, 10285, gOamData_837E054, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E2978

	.align 2
gBattleAnimSpriteTemplate_83DB538:: @ 83DB538
	spr_template 10135, 10135, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E29C0

	.align 2
gBattleAnimSpriteTemplate_83DB550:: @ 83DB550
	spr_template 10135, 10135, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E27E8

	.align 2
gUnknown_083DB568:: @ 83DB568
@ seems to be a src element in a LoadPalette call.
	.2byte 0x7FFF
