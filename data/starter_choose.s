	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gBirchBagGrassPal:: @ 83F62EC
	.incbin "graphics/misc/birch_bag.gbapal"
	.incbin "graphics/misc/birch_grass.gbapal"

	.align 2
gBirchBallarrow_Pal::
	.incbin "graphics/misc/birch_ballarrow.gbapal"

	.align 2
gBirchCircle_Pal::
	.incbin "graphics/misc/birch_circle.gbapal"

	.align 2
gBirchBagTilemap:: @ 83F636C
	.incbin "graphics/misc/birch_bag_map.bin.lz"

	.align 2
gBirchGrassTilemap:: @ 83F64F8
	.incbin "graphics/misc/birch_grass_map.bin.lz"

	.align 2
gBirchHelpGfx:: @ 83F66F0
	.incbin "graphics/misc/birch_help.4bpp.lz"

	.align 2
gBirchBallarrow_Gfx::
	.incbin "graphics/misc/birch_ballarrow.4bpp.lz"

	.align 2
gBirchCircle_Gfx::
	.incbin "graphics/misc/birch_circle.4bpp.lz"

gStarterChoose_PokeballCoords:: @ 83F76B8
	.byte 60, 64
	.byte 120, 88
	.byte 180, 64

gStarterChoose_LabelCoords:: @ 83F76BE
	.byte 0, 9
	.byte 16, 10
	.byte 8, 4

	.align 1
gStarterMons:: @ 83F76C4
	.2byte SPECIES_TREECKO
	.2byte SPECIES_TORCHIC
	.2byte SPECIES_MUDKIP
	.2byte 0

	.align 2
gOamData_83F76CC:: @ 83F76CC
	.2byte 0x00A0
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gOamData_83F76D4:: @ 83F76D4
	.2byte 0x00A0
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gOamData_83F76DC:: @ 83F76DC
	.2byte 0x03A0
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gUnknown_083F76E4:: @ 83F76E4
	.byte  60, 32
	.byte 120, 56
	.byte 180, 32
	.byte   0,  0

	.align 2
gSpriteAnim_83F76EC:: @ 83F76EC
	obj_image_anim_frame 48, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83F76F4:: @ 83F76F4
	obj_image_anim_frame 0, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83F76FC:: @ 83F76FC
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 0, 32
	obj_image_anim_frame 16, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 32, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 16, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 32, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83F7744:: @ 83F7744
	obj_image_anim_frame 0, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83F774C:: @ 83F774C
	.4byte gSpriteAnim_83F76EC

	.align 2
gSpriteAnimTable_83F7750:: @ 83F7750
	.4byte gSpriteAnim_83F76F4
	.4byte gSpriteAnim_83F76FC

	.align 2
gSpriteAnimTable_83F7758:: @ 83F7758
	.4byte gSpriteAnim_83F7744

	.align 2
gSpriteAffineAnim_83F775C:: @ 83F775C
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83F7774:: @ 83F7774
	obj_rot_scal_anim_frame 0x14, 0x14, 0, 0
	obj_rot_scal_anim_frame 0x14, 0x14, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83F778C:: @ 83F778C
	.4byte gSpriteAffineAnim_83F775C

	.align 2
gSpriteAffineAnimTable_83F7790:: @ 83F7790
	.4byte gSpriteAffineAnim_83F7774

gUnknown_083F7794:: @ 83F7794
	obj_tiles gBirchBallarrow_Gfx, 0x0800, 0x1000
	.space 8

gUnknown_083F77A4:: @ 83F77A4
	obj_tiles gBirchCircle_Gfx, 0x0800, 0x1001
	.space 8

gUnknown_083F77B4:: @ 83F77B4
	obj_pal gBirchBallarrow_Pal, 0x1000
	obj_pal gBirchCircle_Pal, 0x1001
	.space 8

	.align 2
gSpriteTemplate_83F77CC:: @ 83F77CC
	spr_template 4096, 4096, gOamData_83F76CC, gSpriteAnimTable_83F774C, NULL, gDummySpriteAffineAnimTable, sub_810A62C

	.align 2
gSpriteTemplate_83F77E4:: @ 83F77E4
	spr_template 4096, 4096, gOamData_83F76D4, gSpriteAnimTable_83F7750, NULL, gDummySpriteAffineAnimTable, sub_810A68C

	.align 2
gSpriteTemplate_83F77FC:: @ 83F77FC
	spr_template 4097, 4097, gOamData_83F76DC, gSpriteAnimTable_83F7758, NULL, gSpriteAffineAnimTable_83F7790, StarterPokemonSpriteAnimCallback
