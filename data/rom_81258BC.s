	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_08402080:: @ 8402080
	.4byte sub_812B864
	.4byte sub_812B870
	.4byte sub_812B87C
	.4byte sub_812B888
	.4byte sub_812B894
	.4byte sub_812B8A0
	.4byte sub_812B8AC
	.4byte sub_812B8B8
	.4byte sub_812B994
	.4byte sub_812B9A0
	.4byte sub_812B9AC
	.4byte sub_812B9B8
	.4byte sub_812B9C4
	.4byte sub_812BA14
	.4byte sub_812BA70
	.4byte sub_812BA7C
	.4byte dp01t_10_6_message
	.4byte dp01t_11_6_message_for_player_only
	.4byte sub_812BB10
	.4byte sub_812BBFC
	.4byte sub_812BC08
	.4byte sub_812BC14
	.4byte sub_812BC54
	.4byte sub_812BC60
	.4byte sub_812BC6C
	.4byte sub_812BC78
	.4byte sub_812BC84
	.4byte sub_812BCC0
	.4byte sub_812BCCC
	.4byte sub_812BCD8
	.4byte sub_812BCE4
	.4byte sub_812BCF0
	.4byte sub_812BCFC
	.4byte sub_812BD08
	.4byte sub_812BD14
	.4byte sub_812BD20
	.4byte sub_812BD2C
	.4byte sub_812BD38
	.4byte sub_812BD44
	.4byte sub_812BD50
	.4byte sub_812BD5C
	.4byte sub_812BD68
	.4byte sub_812BD74
	.4byte sub_812BD80
	.4byte sub_812BDC4
	.4byte sub_812BDF4
	.4byte dp01t_2E_6_battle_intro
	.4byte sub_812BE64
	.4byte sub_812BEB0
	.4byte sub_812BEBC
	.4byte sub_812BEC8
	.4byte sub_812BED4
	.4byte sub_812BEE0
	.4byte sub_812BF3C
	.4byte sub_812BF48
	.4byte sub_812BF54
	.4byte nullsub_78

	.align 2
gSpriteAnim_8402164:: @ 8402164
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840217C:: @ 840217C
	.4byte gSpriteAnim_8402164

	.align 2
gBattleAnimSpriteTemplate_8402180:: @ 8402180
	spr_template 10137, 10137, gOamData_837E054, gSpriteAnimTable_840217C, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gBattleAnimSpriteTemplate_8402198:: @ 8402198
	spr_template 10016, 10016, gOamData_837DF54, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812C144

	.align 2
gBattleAnimSpriteTemplate_84021B0:: @ 84021B0
	spr_template 10017, 10017, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80794A8

	.align 2
gSpriteAnim_84021C8:: @ 84021C8
	obj_image_anim_frame 0, 40
	obj_image_anim_frame 16, 8
	obj_image_anim_frame 32, 40
	obj_image_anim_end

	.align 2
gSpriteAnimTable_84021D8:: @ 84021D8
	.4byte gSpriteAnim_84021C8

	.align 2
gBattleAnimSpriteTemplate_84021DC:: @ 84021DC
	spr_template 10190, 10190, gOamData_837DF34, gSpriteAnimTable_84021D8, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gBattleAnimSpriteTemplate_84021F4:: @ 84021F4
	spr_template 10191, 10191, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812C220

	.align 2
gBattleAnimSpriteTemplate_840220C:: @ 840220C
	spr_template 10189, 10189, gOamData_837DF94, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812C2BC

	.align 2
gSpriteAffineAnim_8402224:: @ 8402224
	obj_rot_scal_anim_frame 0x180, 0x180, 0, 0
	obj_rot_scal_anim_frame 0xFFE0, 0x18, 0, 5
	obj_rot_scal_anim_frame 0x18, 0xFFE0, 0, 5
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnim_8402244:: @ 8402244
	obj_rot_scal_anim_frame 0x30, 0x30, 0, 0
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 6
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_840225C:: @ 840225C
	.4byte gSpriteAffineAnim_8402224
	.4byte gSpriteAffineAnim_8402244

	.align 2
gBattleAnimSpriteTemplate_8402264:: @ 8402264
	spr_template 10187, 10187, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_840225C, sub_812C358

	.align 2
gBattleAnimSpriteTemplate_840227C:: @ 840227C
	spr_template 10152, 10152, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812C720

	.align 2
gSpriteAnim_8402294:: @ 8402294
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_84022AC:: @ 84022AC
	.4byte gSpriteAnim_8402294

	.align 2
gBattleAnimSpriteTemplate_84022B0:: @ 84022B0
	spr_template 10027, 10027, gOamData_837DF34, gSpriteAnimTable_84022AC, NULL, gDummySpriteAffineAnimTable, sub_812C80C

	.align 2
gSpriteAnim_84022C8:: @ 84022C8
	obj_image_anim_frame 0, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_84022D0:: @ 84022D0
	.4byte gSpriteAnim_84022C8

	.align 2
gSpriteAffineAnim_84022D4:: @ 84022D4
	obj_rot_scal_anim_frame 0xFFF9, 0xFFF9, -3, 16
	obj_rot_scal_anim_frame 0x7, 0x7, 3, 16
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_84022EC:: @ 84022EC
	.4byte gSpriteAffineAnim_84022D4

	.align 2
gBattleAnimSpriteTemplate_84022F0:: @ 84022F0
	spr_template 10228, 10228, gOamData_837DF94, gSpriteAnimTable_84022D0, NULL, gSpriteAffineAnimTable_84022EC, sub_812C848

	.align 2
gSpriteAnim_8402308:: @ 8402308
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 16, 16
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840231C:: @ 840231C
	.4byte gSpriteAnim_8402308

	.align 2
gSpriteAffineAnim_8402320:: @ 8402320
	obj_rot_scal_anim_frame 0x200, 0x200, 0, 0
	obj_rot_scal_anim_frame 0xFFE0, 0xFFE0, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_8402338:: @ 8402338
	.4byte gSpriteAffineAnim_8402320

	.align 2
gBattleAnimSpriteTemplate_840233C:: @ 840233C
	spr_template 10192, 10192, gOamData_837DFF4, gSpriteAnimTable_840231C, NULL, gSpriteAffineAnimTable_8402338, sub_812C908

	.align 2
gSpriteAffineAnim_8402354:: @ 8402354
	obj_rot_scal_anim_frame 0x0, 0x180, 0, 0
	obj_rot_scal_anim_frame 0x10, 0x0, 0, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_840236C:: @ 840236C
	obj_rot_scal_anim_frame 0x140, 0x180, 0, 0
	obj_rot_scal_anim_frame 0xFFF0, 0x0, 0, 19
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_8402384:: @ 8402384
	.4byte gSpriteAffineAnim_8402354
	.4byte gSpriteAffineAnim_840236C

	.align 2
gBattleAnimSpriteTemplate_840238C:: @ 840238C
	spr_template 10227, 10227, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_8402384, sub_812C990

	.align 2
gBattleAnimSpriteTemplate_84023A4:: @ 84023A4
	spr_template 10247, 10247, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812CAFC

	.align 2
gBattleAnimSpriteTemplate_84023BC:: @ 84023BC
	spr_template 10247, 10247, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812CC28

	.align 2
gSpriteAnim_84023D4:: @ 84023D4
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 8, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_84023E4:: @ 84023E4
	.4byte gSpriteAnim_84023D4

	.align 2
gBattleAnimSpriteTemplate_84023E8:: @ 84023E8
	spr_template 10229, 10229, gOamData_837DF54, gSpriteAnimTable_84023E4, NULL, gDummySpriteAffineAnimTable, sub_812CCE8

	.align 2
gUnknown_08402400:: @ 8402400
	.incbin "baserom.gba", 0x00402400, 0x20

	.align 2
gSpriteAnim_8402420:: @ 8402420
	obj_image_anim_frame 0, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402428:: @ 8402428
	.4byte gSpriteAnim_8402420

	.align 2
gSpriteAffineAnim_840242C:: @ 840242C
	obj_rot_scal_anim_frame 0x0, 0x0, 5, 40
	obj_rot_scal_anim_frame 0x0, 0x0, 10, 10
	obj_rot_scal_anim_frame 0x0, 0x0, 15, 10
	obj_rot_scal_anim_frame 0x0, 0x0, 20, 40
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_8402454:: @ 8402454
	.4byte gSpriteAffineAnim_840242C

	.align 2
gBattleAnimSpriteTemplate_8402458:: @ 8402458
	spr_template 10230, 10230, gOamData_837DFFC, gSpriteAnimTable_8402428, NULL, gSpriteAffineAnimTable_8402454, sub_812D294

	.align 2
gSpriteAnim_8402470:: @ 8402470
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 32, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_loop 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402494:: @ 8402494
	.4byte gSpriteAnim_8402470

	.align 2
gBattleAnimSpriteTemplate_8402498:: @ 8402498
	spr_template 10234, 10234, gOamData_837DF34, gSpriteAnimTable_8402494, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gUnknown_084024B0:: @ 84024B0
	.incbin "baserom.gba", 0x004024b0, 0x20

	.align 2
gBattleAnimSpriteTemplate_84024D0:: @ 84024D0
	spr_template 10226, 10226, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812D3AC

	.align 2
gBattleAnimSpriteTemplate_84024E8:: @ 84024E8
	spr_template 10233, 10233, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812D4B4

	.align 2
gSpriteTemplate_8402500:: @ 8402500
	spr_template 10233, 10233, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812D588

	.align 2
gUnknown_08402518:: @ 8402518
	.incbin "baserom.gba", 0x00402518, 0x28

	.align 2
gUnknown_08402540:: @ 8402540
	.incbin "baserom.gba", 0x00402540, 0x38

	.align 2
gBattleAnimSpriteTemplate_8402578:: @ 8402578
	spr_template 10236, 10236, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812D724

	.align 2
gUnknown_08402590:: @ 8402590
	.incbin "baserom.gba", 0x00402590, 0x30

	.align 2
gUnknown_084025C0:: @ 84025C0
	.incbin "baserom.gba", 0x004025c0, 0x4

	.align 2
gSpriteAnim_84025C4:: @ 84025C4
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 4, 6
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_84025D0:: @ 84025D0
	obj_image_anim_frame 8, 6
	obj_image_anim_end

	.align 2
gSpriteAnim_84025D8:: @ 84025D8
	obj_image_anim_frame 12, 6
	obj_image_anim_end

	.align 2
gSpriteAnimTable_84025E0:: @ 84025E0
	.4byte gSpriteAnim_84025C4
	.4byte gSpriteAnim_84025D0
	.4byte gSpriteAnim_84025D8

	.align 2
gBattleAnimSpriteTemplate_84025EC:: @ 84025EC
	spr_template 10241, 10241, gOamData_837DF2C, gSpriteAnimTable_84025E0, NULL, gDummySpriteAffineAnimTable, sub_812DEAC

	.align 2
gUnknown_08402604:: @ 8402604
	.incbin "baserom.gba", 0x00402604, 0x4

gUnknown_08402608:: @ 8402608
	.incbin "baserom.gba", 0x00402608, 0x8

gUnknown_08402610:: @ 8402610
	.incbin "baserom.gba", 0x00402610, 0x20

	.align 2
gBattleAnimSpriteTemplate_8402630:: @ 8402630
	spr_template 10087, 10087, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812E4F0

	.align 2
gSpriteAnim_8402648:: @ 8402648
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 3, 8, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 2, 8, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 1, 8, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_840266C:: @ 840266C
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 1, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 2, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 3, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 3, 8, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 2, 8, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 1, 8, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_8402690:: @ 8402690
	obj_image_anim_frame 0, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402698:: @ 8402698
	.4byte gSpriteAnim_8402648
	.4byte gSpriteAnim_840266C
	.4byte gSpriteAnim_8402690

	.align 2
gBattleAnimSpriteTemplate_84026A4:: @ 84026A4
	spr_template 10238, 10238, gOamData_837DF24, gSpriteAnimTable_8402698, NULL, gDummySpriteAffineAnimTable, sub_812E7A0

	.align 2
	.incbin "baserom.gba", 0x004026bc, 0x20

	.align 2
gSpriteAnim_84026DC:: @ 84026DC
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 4, 9
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_84026EC:: @ 84026EC
	.4byte gSpriteAnim_84026DC

	.align 2
gBattleAnimSpriteTemplate_84026F0:: @ 84026F0
	spr_template 10239, 10239, gOamData_837DF2C, gSpriteAnimTable_84026EC, NULL, gDummySpriteAffineAnimTable, sub_812EA4C

	.align 2
gBattleAnimSpriteTemplate_8402708:: @ 8402708
	spr_template 10240, 10240, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812EC78

	.align 2
gBattleAnimSpriteTemplate_8402720:: @ 8402720
	spr_template 10227, 10227, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_8402384, sub_812ED84

	.align 2
gBattleAnimSpriteTemplate_8402738:: @ 8402738
	spr_template 10236, 10236, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812EEA4

	.align 2
gUnknown_08402750:: @ 8402750
	.incbin "baserom.gba", 0x00402750, 0x30

	.align 2
gSpriteAffineAnim_8402780:: @ 8402780
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 8
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 8
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_84027A0:: @ 84027A0
	obj_rot_scal_anim_frame 0xC0, 0xC0, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 8
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 8
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_84027C0:: @ 84027C0
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 8
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 8
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_84027E0:: @ 84027E0
	.4byte gSpriteAffineAnim_8402780
	.4byte gSpriteAffineAnim_84027A0
	.4byte gSpriteAffineAnim_84027C0

	.align 2
gBattleAnimSpriteTemplate_84027EC:: @ 84027EC
	spr_template 10242, 10242, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_84027E0, sub_812F88C

	.align 2
gSpriteAffineAnim_8402804:: @ 8402804
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFA, 0, 16
	obj_rot_scal_anim_frame 0x4, 0x6, 0, 16
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_8402824:: @ 8402824
	obj_rot_scal_anim_frame 0xC0, 0xC0, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x6, 0, 16
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFA, 0, 16
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_8402844:: @ 8402844
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x6, 0, 16
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFA, 0, 16
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_8402864:: @ 8402864
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x8, 0xA, 0, 30
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF6, 0, 16
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_8402884:: @ 8402884
	.4byte gSpriteAffineAnim_8402804
	.4byte gSpriteAffineAnim_8402824
	.4byte gSpriteAffineAnim_8402844
	.4byte gSpriteAffineAnim_8402864

	.align 2
gBattleAnimSpriteTemplate_8402894:: @ 8402894
	spr_template 10242, 10242, gOamData_837DFF4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_8402884, sub_812F948

	.align 2
gUnknown_084028AC:: @ 84028AC
	.incbin "baserom.gba", 0x004028ac, 0x20

	.align 2
gSpriteTemplate_84028CC:: @ 84028CC
	spr_template 10243, 10243, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812FF94

gUnknown_084028E4:: @ 84028E4
	.incbin "baserom.gba", 0x004028e4, 0x30

	.align 2
gSpriteAnim_8402914:: @ 8402914
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_8402920:: @ 8402920
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_840292C:: @ 840292C
	.4byte gSpriteAnim_8402914
	.4byte gSpriteAnim_8402920

	.align 2
gBattleAnimSpriteTemplate_8402934:: @ 8402934
	spr_template 10053, 10053, gOamData_837DF34, gSpriteAnimTable_840292C, NULL, gDummySpriteAffineAnimTable, sub_81300F4

	.align 2
gSpriteTemplate_840294C:: @ 840294C
	spr_template 10248, 10248, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_81304DC

	.align 2
gBattleAnimSpriteTemplate_8402964:: @ 8402964
	spr_template 10252, 10252, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_813051C

	.align 2
gSpriteAffineAnim_840297C:: @ 840297C
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 24
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_840298C:: @ 840298C
	obj_rot_scal_anim_frame 0x100, 0x100, -64, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 24
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_84029A4:: @ 84029A4
	.4byte gSpriteAffineAnim_840297C
	.4byte gSpriteAffineAnim_840298C

	.align 2
gSpriteTemplate_84029AC:: @ 84029AC
	spr_template 10254, 10254, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_84029A4, SpriteCallbackDummy

	.align 2
gBattleAnimSpriteTemplate_84029C4:: @ 84029C4
	spr_template 10247, 10247, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_81307B0

	.align 2
gUnknown_084029DC:: @ 84029DC
	.incbin "baserom.gba", 0x004029dc, 0x18

	.align 2
gBattleAnimSpriteTemplate_84029F4:: @ 84029F4
	spr_template 10255, 10255, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8130A2C

	.align 2
gBattleAnimSpriteTemplate_8402A0C:: @ 8402A0C
	spr_template 10247, 10247, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8130AEC

	.align 2
gBattleAnimSpriteTemplate_8402A24:: @ 8402A24
	spr_template 10258, 10258, gOamData_837E054, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8130F5C

	.align 2
gBattleAnimSpriteTemplate_8402A3C:: @ 8402A3C
	spr_template 10233, 10233, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8131264

	.align 2
gSpriteTemplate_8402A54:: @ 8402A54
	spr_template 10233, 10233, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D1FDC

	.align 2
gBattleAnimSpriteTemplate_8402A6C:: @ 8402A6C
	spr_template 10250, 10250, gOamData_837DF3C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8131564

	.align 2
gSpriteTemplate_8402A84:: @ 8402A84
	spr_template 10224, 10224, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8131EB8

	.align 2
gSpriteAnim_8402A9C:: @ 8402A9C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402AA8:: @ 8402AA8
	.4byte gSpriteAnim_8402A9C

	.align 2
gSpriteAffineAnim_8402AAC:: @ 8402AAC
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8402AC4:: @ 8402AC4
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_8402ADC:: @ 8402ADC
	.4byte gSpriteAffineAnim_8402AAC
	.4byte gSpriteAffineAnim_8402AC4

	.align 2
gBattleAnimSpriteTemplate_8402AE4:: @ 8402AE4
	spr_template 10277, 10277, gOamData_837DF9C, gSpriteAnimTable_8402AA8, NULL, gSpriteAffineAnimTable_8402ADC, sub_8132370

	.align 2
gSpriteAffineAnim_8402AFC:: @ 8402AFC
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 64
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_8402B0C:: @ 8402B0C
	.4byte gSpriteAffineAnim_8402AFC

	.align 2
gBattleAnimSpriteTemplate_8402B10:: @ 8402B10
	spr_template 10278, 10278, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_8402B0C, sub_81323E0

	.align 2
gUnknown_08402B28:: @ 8402B28
	.incbin "baserom.gba", 0x00402b28, 0x30

	.align 2
gDexArrows_Pal::
	.incbin "graphics/pokedex/arrows.gbapal"

	.align 2
gDexArrows_Gfx::
	.incbin "graphics/pokedex/arrows.4bpp"

	.incbin "baserom.gba", 0x00402c78, 0x80

gUnknown_08402CF8:: @ 8402CF8
	.incbin "baserom.gba", 0x00402cf8, 0x10

gUnknown_08402D08:: @ 8402D08
	.4byte OtherText_Battle
	.byte 1, 1, 0, 0
	.4byte OtherText_Power
	.byte 1, 4, 1, 0
	.4byte OtherText_Accuracy
	.byte 1, 9, 2, 0
	.space 8

	.4byte OtherText_Contest
	.byte 1, 1, 0, 0
	.4byte OtherText_Appeal
	.byte 1, 4, 1, 0
	.4byte OtherText_Jam
	.byte 1, 9, 2, 0
	.space 8

	.4byte 0xFF00FFEF
	.4byte gTileBuffer

	.align 2
gOamData_8402D50:: @ 8402D50
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gOamData_8402D58:: @ 8402D58
	.2byte 0x8000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gOamData_8402D60:: @ 8402D60
	.2byte 0x4000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gSpriteAnim_8402D68:: @ 8402D68
	obj_image_anim_frame 2, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_8402D70:: @ 8402D70
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402D78:: @ 8402D78
	.4byte gSpriteAnim_8402D68
	.4byte gSpriteAnim_8402D70

	.align 2
gUnknown_08402D80:: @ 8402D80
	obj_tiles gDexArrows_Gfx, 384, 0x1595

	.align 2
gUnknown_08402D88:: @ 8402D88
	obj_pal gDexArrows_Pal, 0x1596

	.align 2
gSpriteTemplate_8402D90:: @ 8402D90
	spr_template 5525, 5526, gOamData_8402D58, gSpriteAnimTable_8402D78, NULL, gDummySpriteAffineAnimTable, sub_8133300

	.align 2
gSpriteAnim_8402DA8:: @ 8402DA8
	obj_image_anim_frame 4, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_8402DB0:: @ 8402DB0
	obj_image_anim_frame 6, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402DB8:: @ 8402DB8
	.4byte gSpriteAnim_8402DA8
	.4byte gSpriteAnim_8402DB0

	.align 2
gSpriteTemplate_8402DC0:: @ 8402DC0
	spr_template 5525, 5526, gOamData_8402D60, gSpriteAnimTable_8402DB8, NULL, gDummySpriteAffineAnimTable, sub_8133300

	.align 2
gSpriteAnim_8402DD8:: @ 8402DD8
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_8402DE0:: @ 8402DE0
	obj_image_anim_frame 9, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_8402DE8:: @ 8402DE8
	obj_image_anim_frame 10, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_8402DF0:: @ 8402DF0
	obj_image_anim_frame 11, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402DF8:: @ 8402DF8
	.4byte gSpriteAnim_8402DD8
	.4byte gSpriteAnim_8402DE0
	.4byte gSpriteAnim_8402DE8
	.4byte gSpriteAnim_8402DF0

	.align 2
gSpriteTemplate_8402E08:: @ 8402E08
	spr_template 5525, 5526, gOamData_8402D50, gSpriteAnimTable_8402DF8, NULL, gDummySpriteAffineAnimTable, sub_8133300

	.align 2
	.incbin "baserom.gba", 0x00402e20, 0x4

gUnknown_08402E24:: @ 8402E24
	.incbin "baserom.gba", 0x00402e24, 0x15

gUnknown_08402E39:: @ 8402E39
	.byte 0, 1, 2, 3

gUnknown_08402E3D:: @ 8402E3D
	.byte 4, 5, 6

@ pointer to decorations, capacity
	.align 2
gDecorationInventories:: @ 8402E40
	.4byte gSaveBlock1 + 0x26A0, 10 @ DESK
	.4byte gSaveBlock1 + 0x26AA, 10 @ CHAIR
	.4byte gSaveBlock1 + 0x26B4, 10 @ PLANT
	.4byte gSaveBlock1 + 0x26BE, 30 @ ORNAMENT
	.4byte gSaveBlock1 + 0x26DC, 30 @ MAT
	.4byte gSaveBlock1 + 0x26FA, 10 @ POSTER
	.4byte gSaveBlock1 + 0x2704, 40 @ DOLL
	.4byte gSaveBlock1 + 0x272C, 10 @ CUSHION
