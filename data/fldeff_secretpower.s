	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteImage_83D198C:: @ 83D198C
	.incbin "graphics/unknown_sprites/83D259C/0.4bpp"

	.align 2
gSpriteImage_83D1A0C:: @ 83D1A0C
	.incbin "graphics/unknown_sprites/83D259C/1.4bpp"

	.align 2
gSpriteImage_83D1A8C:: @ 83D1A8C
	.incbin "graphics/unknown_sprites/83D259C/2.4bpp"

	.align 2
gSpriteImage_83D1B0C:: @ 83D1B0C
	.incbin "graphics/unknown_sprites/83D259C/3.4bpp"

	.align 2
gSpriteImage_83D1B8C:: @ 83D1B8C
	.incbin "graphics/unknown_sprites/83D259C/4.4bpp"

	.space 32

	.align 2
gFieldEffectObjectPalette7: @ 83D1C2C
	.incbin "graphics/field_effect_objects/palettes/07.gbapal"

	.align 2
gSpriteImage_83D1C4C:: @ 83D1C4C
	.incbin "graphics/unknown_sprites/83D25EC/0.4bpp"

	.align 2
gSpriteImage_83D1CCC:: @ 83D1CCC
	.incbin "graphics/unknown_sprites/83D25EC/1.4bpp"

	.align 2
gSpriteImage_83D1D4C:: @ 83D1D4C
	.incbin "graphics/unknown_sprites/83D25EC/2.4bpp"

	.align 2
gSpriteImage_83D1DCC:: @ 83D1DCC
	.incbin "graphics/unknown_sprites/83D25EC/3.4bpp"

	.align 2
gSpriteImage_83D1E4C:: @ 83D1E4C
	.incbin "graphics/unknown_sprites/83D25EC/4.4bpp"

	.align 2
gSpriteImage_83D1ECC:: @ 83D1ECC
	.incbin "graphics/unknown_sprites/83D25C4/0.4bpp"

	.align 2
gSpriteImage_83D1F4C:: @ 83D1F4C
	.incbin "graphics/unknown_sprites/83D25C4/1.4bpp"

	.align 2
gSpriteImage_83D1FCC:: @ 83D1FCC
	.incbin "graphics/unknown_sprites/83D25C4/2.4bpp"

	.align 2
gSpriteImage_83D204C:: @ 83D204C
	.incbin "graphics/unknown_sprites/83D25C4/3.4bpp"

	.align 2
gSpriteImage_83D20CC:: @ 83D20CC
	.incbin "graphics/unknown_sprites/83D25C4/4.4bpp"

	.align 2
	.incbin "graphics/unknown_sprites/83D25C4/5.4bpp"

	.align 2
gFieldEffectObjectPalette8: @ 83D21CC
	.incbin "graphics/field_effect_objects/palettes/08.gbapal"

	.align 2
gSpriteImage_83D21EC:: @ 83D21EC
	.incbin "graphics/unknown_sprites/83D2688/0.4bpp"

	.align 2
gSpriteImage_83D22EC:: @ 83D22EC
	.incbin "graphics/unknown_sprites/83D2688/1.4bpp"

	.align 2
gSpriteImage_83D23EC:: @ 83D23EC
	.incbin "graphics/unknown_sprites/83D2688/2.4bpp"

	.align 2
gOamData_83D24EC:: @ 83D24EC
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gSpriteAnim_83D24F4:: @ 83D24F4
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_83D250C:: @ 83D250C
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_83D2524:: @ 83D2524
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_83D253C:: @ 83D253C
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 1, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 2, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 3, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 4, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D2554:: @ 83D2554
	obj_image_anim_frame 4, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 3, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 2, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 1, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D256C:: @ 83D256C
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D2584:: @ 83D2584
	.4byte gSpriteAnim_83D24F4

	.align 2
gSpriteAnimTable_83D2588:: @ 83D2588
	.4byte gSpriteAnim_83D250C
	.4byte gSpriteAnim_83D2524
	.4byte gSpriteAnim_83D253C
	.4byte gSpriteAnim_83D2554

	.align 2
gSpriteAnimTable_83D2598:: @ 83D2598
	.4byte gSpriteAnim_83D256C

	.align 2
gSpriteImageTable_83D259C:: @ 83D259C
	obj_frame_tiles gSpriteImage_83D198C, 0x80
	obj_frame_tiles gSpriteImage_83D1A0C, 0x80
	obj_frame_tiles gSpriteImage_83D1A8C, 0x80
	obj_frame_tiles gSpriteImage_83D1B0C, 0x80
	obj_frame_tiles gSpriteImage_83D1B8C, 0x80

	.align 2
gSpriteImageTable_83D25C4:: @ 83D25C4
	obj_frame_tiles gSpriteImage_83D1ECC, 0x80
	obj_frame_tiles gSpriteImage_83D1F4C, 0x80
	obj_frame_tiles gSpriteImage_83D1FCC, 0x80
	obj_frame_tiles gSpriteImage_83D204C, 0x80
	obj_frame_tiles gSpriteImage_83D20CC, 0x80

	.align 2
gSpriteImageTable_83D25EC:: @ 83D25EC
	obj_frame_tiles gSpriteImage_83D1C4C, 0x80
	obj_frame_tiles gSpriteImage_83D1CCC, 0x80
	obj_frame_tiles gSpriteImage_83D1D4C, 0x80
	obj_frame_tiles gSpriteImage_83D1DCC, 0x80
	obj_frame_tiles gSpriteImage_83D1E4C, 0x80

	.align 2
gSpriteTemplate_83D2614:: @ 83D2614
	spr_template 0xFFFF, 4099, gOamData_83D24EC, gSpriteAnimTable_83D2584, gSpriteImageTable_83D259C, gDummySpriteAffineAnimTable, sub_80C644C

	.align 2
gSpriteTemplate_83D262C:: @ 83D262C
	spr_template 0xFFFF, 4104, gOamData_83D24EC, gSpriteAnimTable_83D2588, gSpriteImageTable_83D25C4, gDummySpriteAffineAnimTable, sub_80C6598

	.align 2
gSpriteTemplate_83D2644:: @ 83D2644
	spr_template 0xFFFF, 4104, gOamData_83D24EC, gSpriteAnimTable_83D2598, gSpriteImageTable_83D25EC, gDummySpriteAffineAnimTable, sub_80C66BC

	.align 2
gFieldEffectObjectPaletteInfo7:: @ 83D265C
	obj_pal gFieldEffectObjectPalette7, 0x1003

	.align 2
gFieldEffectObjectPaletteInfo8:: @ 83D2664
	obj_pal gFieldEffectObjectPalette8, 0x1008
