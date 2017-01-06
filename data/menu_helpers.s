	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteImage_83E5808:: @ 83E5808
	.incbin "graphics/unknown_sprites/83E59A0/0.4bpp"

	.align 2
gSpriteImage_83E5848:: @ 83E5848
	.incbin "graphics/unknown_sprites/83E59A0/1.4bpp"

	.align 2
gSpriteImage_83E5888:: @ 83E5888
	.incbin "graphics/unknown_sprites/83E59B0/0.4bpp"

	.align 2
gSpriteImage_83E58C8:: @ 83E58C8
	.incbin "graphics/unknown_sprites/83E59B0/1.4bpp"

	.align 2
gSpriteImage_83E5908:: @ 83E5908
	.incbin "graphics/unknown_sprites/83E59C0/0.4bpp"

	.align 2
gSpriteImage_83E5928:: @ 83E5928
	.incbin "graphics/unknown_sprites/83E59C0/1.4bpp"

	.align 2
Palette_3E5948: @ 83E5948
	.incbin "baserom.gba", 0x3e5948, 0x20

	.align 2
gUnknown_083E5968:: @ 83E5968
	obj_pal Palette_3E5948, 6

	.align 2
gOamData_83E5970:: @ 83E5970
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0001

	.align 2
gOamData_83E5978:: @ 83E5978
	.2byte 0x4000
	.2byte 0x0000
	.2byte 0x0001

	.align 2
gOamData_83E5980:: @ 83E5980
	.2byte 0x8000
	.2byte 0x0000
	.2byte 0x0001

	.align 2
gSpriteAnim_83E5988:: @ 83E5988
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83E5990:: @ 83E5990
	obj_image_anim_frame 1, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83E5998:: @ 83E5998
	.4byte gSpriteAnim_83E5988
	.4byte gSpriteAnim_83E5990

	.align 2
gSpriteImageTable_83E59A0:: @ 83E59A0
	obj_frame_tiles gSpriteImage_83E5808, 0x40
	obj_frame_tiles gSpriteImage_83E5848, 0x40

	.align 2
gSpriteImageTable_83E59B0:: @ 83E59B0
	obj_frame_tiles gSpriteImage_83E5888, 0x40
	obj_frame_tiles gSpriteImage_83E58C8, 0x40

	.align 2
gSpriteImageTable_83E59C0:: @ 83E59C0
	obj_frame_tiles gSpriteImage_83E5908, 0x20
	obj_frame_tiles gSpriteImage_83E5928, 0x20

	.align 2
gSpriteTemplate_83E59D0:: @ 83E59D0
	spr_template 0xFFFF, 6, gOamData_83E5978, gSpriteAnimTable_83E5998, gSpriteImageTable_83E59A0, gDummySpriteAffineAnimTable, sub_80F9834

	.align 2
gSpriteTemplate_83E59E8:: @ 83E59E8
	spr_template 0xFFFF, 6, gOamData_83E5980, gSpriteAnimTable_83E5998, gSpriteImageTable_83E59B0, gDummySpriteAffineAnimTable, sub_80F9834

	.align 2
gSpriteTemplate_83E5A00:: @ 83E5A00
	spr_template 0xFFFF, 6, gOamData_83E5970, gSpriteAnimTable_83E5998, gSpriteImageTable_83E59C0, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_083E5A18:: @ 83E5A18
	.string "{PALETTE 0}$"

gUnknown_083E5A1C:: @ 83E5A1C
	.string "▶$"
