	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata


gSpriteImageTable_83FD950:: @ 83FD950
	obj_frame_tiles gSpriteImage_83FC148, 0x200

	.align 2
gSpriteAnim_83FD958:: @ 83FD958
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83FD960:: @ 83FD960
	.4byte gSpriteAnim_83FD958

	.align 2
gSpriteAffineAnim_83FD964:: @ 83FD964
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83FD974:: @ 83FD974
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83FD984:: @ 83FD984
	.4byte gSpriteAffineAnim_83FD964
	.4byte gSpriteAffineAnim_83FD974

	.align 2
gSpriteTemplate_83FD98C:: @ 83FD98C
	spr_template 0xFFFF, 4105, gFieldOamData_32x32, gSpriteAnimTable_83FD960, gSpriteImageTable_83FD950, gSpriteAffineAnimTable_83FD984, sub_811B720

	.align 2
gOamData_83FD9A4:: @ 83FD9A4
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gSpriteImageTable_83FD9AC:: @ 83FD9AC
	obj_frame_tiles gSpriteImage_83FC528, 0x800

	.align 2
gSpriteImageTable_83FD9B4:: @ 83FD9B4
	obj_frame_tiles gSpriteImage_83FCD28, 0x800

	.align 2
gSpriteAnim_83FD9BC:: @ 83FD9BC
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83FD9C4:: @ 83FD9C4
	.4byte gSpriteAnim_83FD9BC

	.align 2
gSpriteTemplate_83FD9C8:: @ 83FD9C8
	spr_template 0xFFFF, 4106, gOamData_83FD9A4, gSpriteAnimTable_83FD9C4, gSpriteImageTable_83FD9AC, gDummySpriteAffineAnimTable, sub_811C90C

	.align 2
gSpriteTemplate_83FD9E0:: @ 83FD9E0
	spr_template 0xFFFF, 4106, gOamData_83FD9A4, gSpriteAnimTable_83FD9C4, gSpriteImageTable_83FD9B4, gDummySpriteAffineAnimTable, sub_811C90C

	.align 2
gFieldEffectObjectPalette10:: @ 83FD9F8
	.incbin "graphics/field_effect_objects/palettes/10.gbapal"

	.align 2
gFieldEffectObjectPaletteInfo10:: @ 83FDA18
	obj_pal gFieldEffectObjectPalette10, 0x1009

	.align 2
sMugshotPal_Sydney:
	.incbin "graphics/battle_transitions/sidney_bg.gbapal"

	.align 2
sMugshotPal_Phoebe:
	.incbin "graphics/battle_transitions/phoebe_bg.gbapal"

	.align 2
sMugshotPal_Glacia:
	.incbin "graphics/battle_transitions/glacia_bg.gbapal"

	.align 2
sMugshotPal_Drake:
	.incbin "graphics/battle_transitions/drake_bg.gbapal"

	.align 2
sMugshotPal_Steven:
	.incbin "graphics/battle_transitions/steven_bg.gbapal"

	.align 2
sMugshotPal_Brendan:
	.incbin "graphics/battle_transitions/brendan_bg.gbapal"

	.align 2
sMugshotPal_May:
	.incbin "graphics/battle_transitions/may_bg.gbapal"

	.align 2
sOpponentMugshotsPals:: @ 83FDB00
	.4byte sMugshotPal_Sydney
	.4byte sMugshotPal_Phoebe
	.4byte sMugshotPal_Glacia
	.4byte sMugshotPal_Drake
	.4byte sMugshotPal_Steven

	.align 2
sPlayerMugshotsPals:: @ 83FDB14
	.4byte sMugshotPal_Brendan
	.4byte sMugshotPal_May

	.align 2
UnusedTrainerPalette:
	.incbin "graphics/battle_transitions/unused_trainer.gbapal"

	.align 2
gSpritePalette_UnusedTrainer:: @ 83FDB3C
	obj_pal UnusedTrainerPalette, 0x100A

	.align 2
gUnknown_083FDB44:: @ 83FDB44
	.incbin "graphics/battle_transitions/big_pokeball_map.bin"

	.align 2
gUnknown_083FDFF4:: @ 83FDFF4
	.incbin "graphics/battle_transitions/elite_four_bg_map.bin"
