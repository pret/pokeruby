	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 8411A10
	.include "data/mon_pokeblock_anims.inc"

	.align 2
gSpriteAffineAnim_8411E90:: @ 8411E90
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8411EA0:: @ 8411EA0
	obj_rot_scal_anim_frame 0x0, 0x0, 12, 1
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 30
	obj_rot_scal_anim_frame 0x0, 0x0, -12, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8411EC0:: @ 8411EC0
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 12, 1
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 28
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 3
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8411EE8:: @ 8411EE8
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 16
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 32
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 16
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8411F08:: @ 8411F08
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 16
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 32
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 16
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8411F30:: @ 8411F30
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 8
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 16
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8411F50:: @ 8411F50
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 8
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 16
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8411F78:: @ 8411F78
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 8
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 32
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8411F98:: @ 8411F98
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 8
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 32
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8411FC0:: @ 8411FC0
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 24
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 4
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8411FE0:: @ 8411FE0
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 24
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 4
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8412008:: @ 8412008
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 24
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 16
	obj_rot_scal_anim_frame 0x0, 0x0, -12, 2
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8412028:: @ 8412028
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 24
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 16
	obj_rot_scal_anim_frame 0x0, 0x0, -12, 2
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_8412050:: @ 8412050
	.4byte gSpriteAffineAnim_8411E90
	.4byte gSpriteAffineAnim_8411EA0
	.4byte gSpriteAffineAnim_8411EE8
	.4byte gSpriteAffineAnim_8411F30
	.4byte gSpriteAffineAnim_8411F78
	.4byte gSpriteAffineAnim_8411FC0
	.4byte gSpriteAffineAnim_8412008
	.4byte gSpriteAffineAnim_8411E90
	.4byte gSpriteAffineAnim_8411E90
	.4byte gSpriteAffineAnim_8411E90
	.4byte gSpriteAffineAnim_8411E90
	.4byte gSpriteAffineAnim_8411EC0
	.4byte gSpriteAffineAnim_8411F08
	.4byte gSpriteAffineAnim_8411F50
	.4byte gSpriteAffineAnim_8411F98
	.4byte gSpriteAffineAnim_8411FE0
	.4byte gSpriteAffineAnim_8412028
	.4byte gSpriteAffineAnim_8411E90
	.4byte gSpriteAffineAnim_8411E90
	.4byte gSpriteAffineAnim_8411E90
	.4byte gSpriteAffineAnim_8411E90

	.align 2
gUnknown_084120A4:: @ 84120A4
	.4byte gPokeblockRed_Pal
	.4byte gPokeblockBlue_Pal
	.4byte gPokeblockPink_Pal
	.4byte gPokeblockGreen_Pal
	.4byte gPokeblockYellow_Pal
	.4byte gPokeblockPurple_Pal
	.4byte gPokeblockIndigo_Pal
	.4byte gPokeblockBrown_Pal
	.4byte gPokeblockLiteBlue_Pal
	.4byte gPokeblockOlive_Pal
	.4byte gPokeblockGray_Pal
	.4byte gPokeblockBlack_Pal
	.4byte gPokeblockWhite_Pal
	.4byte gPokeblockGold_Pal

	.align 2
gSpriteAffineAnim_84120DC:: @ 84120DC
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_84120EC:: @ 84120EC
	.4byte gSpriteAffineAnim_84120DC

	.align 2
gSpriteAffineAnim_84120F0:: @ 84120F0
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 1
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 1
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 1
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 1
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_frame 0x0, 0x0, 16, 1
	obj_rot_scal_anim_frame 0x0, 0x0, 16, 1
	obj_rot_scal_anim_frame 0x0, 0x0, 16, 1
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8412148:: @ 8412148
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 1
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 1
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 1
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 1
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_frame 0x0, 0x0, -16, 1
	obj_rot_scal_anim_frame 0x0, 0x0, -16, 1
	obj_rot_scal_anim_frame 0x0, 0x0, -16, 1
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_84121A0:: @ 84121A0
	.4byte gSpriteAffineAnim_84120DC

	.align 2
gSpriteAffineAnimTable_84121A4:: @ 84121A4
	.4byte gSpriteAffineAnim_84120F0

	.align 2
gSpriteAffineAnimTable_84121A8:: @ 84121A8
	.4byte gSpriteAffineAnim_8412148

	.align 2
gOamData_84121AC:: @ 84121AC
	.2byte 0x0300
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gSpriteAnim_84121B4:: @ 84121B4
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_84121BC:: @ 84121BC
	.4byte gSpriteAnim_84121B4

	.align 2
gSpriteAffineAnim_84121C0:: @ 84121C0
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_84121D8:: @ 84121D8
	.4byte gSpriteAffineAnim_84121C0

	.align 2
gUnknown_084121DC:: @ 84121DC
	obj_tiles gPokeblock_Gfx, 0x20, 14818

	.align 2
gSpriteTemplate_84121E4:: @ 84121E4
	spr_template 14818, 14818, gOamData_84121AC, gSpriteAnimTable_84121BC, NULL, gSpriteAffineAnimTable_84121D8, sub_81481B0
