	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_0820A92C:: @ 820A92C
	obj_tiles gInterfaceGfx_PokeBall, 384, 0xd6d8 @ poke
	obj_tiles gInterfaceGfx_GreatBall, 384, 0xd6d9 @ great
	obj_tiles gInterfaceGfx_SafariBall, 384, 0xd6da @ safari
	obj_tiles gInterfaceGfx_UltraBall, 384, 0xd6db @ ultra
	obj_tiles gInterfaceGfx_MasterBall, 384, 0xd6dc @ master
	obj_tiles gInterfaceGfx_NetBall, 384, 0xd6dd @ net
	obj_tiles gInterfaceGfx_DiveBall, 384, 0xd6de @ dive
	obj_tiles gInterfaceGfx_NestBall, 384, 0xd6df @ nest
	obj_tiles gInterfaceGfx_RepeatBall, 384, 0xd6e0 @ repeat
	obj_tiles gInterfaceGfx_TimerBall, 384, 0xd6e1 @ timer
	obj_tiles gInterfaceGfx_LuxuryBall, 384, 0xd6e2 @ luxury
	obj_tiles gInterfaceGfx_PremierBall, 384, 0xd6e3 @ premier

	.align 2
gUnknown_0820A98C:: @ 820A98C
	obj_pal gInterfacePal_PokeBall, 0xD6D8 @ poke
	obj_pal gInterfacePal_GreatBall, 0xD6D9 @ great
	obj_pal gInterfacePal_SafariBall, 0xD6DA @ safari
	obj_pal gInterfacePal_UltraBall, 0xD6DB @ ultra
	obj_pal gInterfacePal_MasterBall, 0xD6DC @ master
	obj_pal gInterfacePal_NetBall, 0xD6DD @ net
	obj_pal gInterfacePal_DiveBall, 0xD6DE @ dive
	obj_pal gInterfacePal_NestBall, 0xD6DF @ nest
	obj_pal gInterfacePal_RepeatBall, 0xD6E0 @ repeat
	obj_pal gInterfacePal_TimerBall, 0xD6E1 @ timer
	obj_pal gInterfacePal_LuxuryBall, 0xD6E2 @ luxury
	obj_pal gInterfacePal_PremierBall, 0xD6E3 @ premier

	.align 2
gOamData_820A9EC:: @ 820A9EC
	.2byte 0x0300
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gSpriteAnim_820A9F4: @ 820A9F4
	obj_image_anim_frame 0, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_820A9FC: @ 820A9FC
	obj_image_anim_frame 4, 1
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_820AA04: @ 820AA04
	obj_image_anim_frame 8, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_820AA0C: @ 820AA0C
	obj_image_anim_frame 12, 1
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_820AA14:: @ 820AA14
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_820AA1C:: @ 820AA1C
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820AA28:: @ 820AA28
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_820AA34:: @ 820AA34
	.4byte gSpriteAnim_820AA14
	.4byte gSpriteAnim_820AA1C
	.4byte gSpriteAnim_820AA28

	@ unused?
	.4byte gSpriteAnim_820A9F4
	.4byte gSpriteAnim_820AA04
	.4byte gSpriteAnim_820A9FC
	.4byte gSpriteAnim_820AA0C

	.align 2
gSpriteAffineAnim_820AA50:: @ 820AA50
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_820AA60:: @ 820AA60
	obj_rot_scal_anim_frame 0x0, 0x0, -3, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_820AA70:: @ 820AA70
	obj_rot_scal_anim_frame 0x0, 0x0, 3, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_820AA80:: @ 820AA80
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_820AA90:: @ 820AA90
	obj_rot_scal_anim_frame 0x0, 0x0, 25, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_820AAA0:: @ 820AAA0
	.4byte gSpriteAffineAnim_820AA50
	.4byte gSpriteAffineAnim_820AA60
	.4byte gSpriteAffineAnim_820AA70
	.4byte gSpriteAffineAnim_820AA80
	.4byte gSpriteAffineAnim_820AA90

	.align 2
gSpriteTemplate_820AAB4:: @ 820AAB4
	spr_template 55000, 55000, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55001, 55001, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55002, 55002, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55003, 55003, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55004, 55004, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55005, 55005, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55006, 55006, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55007, 55007, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55008, 55008, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55009, 55009, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55010, 55010, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55011, 55011, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
