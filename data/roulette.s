	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gOamData_83FA1FC:: @ 83FA1FC
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gOamData_83FA204:: @ 83FA204
	.2byte 0x8000
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gOamData_83FA20C:: @ 83FA20C
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gOamData_83FA214:: @ 83FA214
	.2byte 0x4000
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gUnknown_083FA21C:: @ 83FA21C
	obj_tiles gRouletteCreditTiles, 0x400, 7
	obj_tiles gRouletteNumbersTiles, 0x280, 8
	obj_tiles gRouletteMultiplierTiles, 0x500, 9
	obj_tiles RouletteBallCounterTiles, 0x140, 10
	obj_tiles RouletteCursorTiles, 0x200, 11
	null_obj_tiles

	.align 2
gSpriteAnim_83FA24C:: @ 83FA24C
	obj_image_anim_frame 0, 0  @ ANIMCMD_FRAME(0, 0),
	obj_image_anim_frame 2, 0  @ ANIMCMD_FRAME(2, 0),
	obj_image_anim_frame 4, 0  @ ANIMCMD_FRAME(4, 0),
	obj_image_anim_frame 6, 0  @ ANIMCMD_FRAME(6, 0),
	obj_image_anim_frame 8, 0  @ ANIMCMD_FRAME(8, 0),
	obj_image_anim_frame 10, 0  @ ANIMCMD_FRAME(10, 0),
	obj_image_anim_frame 12, 0  @ ANIMCMD_FRAME(12, 0),
	obj_image_anim_frame 14, 0  @ ANIMCMD_FRAME(14, 0),
	obj_image_anim_frame 16, 0  @ ANIMCMD_FRAME(16, 0),
	obj_image_anim_frame 18, 0  @ ANIMCMD_FRAME(18, 0),

	.align 2
gSpriteAnimTable_83FA274:: @ 83FA274
	.4byte gSpriteAnim_83FA24C

	.align 2
gSpriteAnim_83FA278:: @ 83FA278
	obj_image_anim_frame 0, 0  @ ANIMCMD_FRAME(0, 0),
	obj_image_anim_frame 8, 0  @ ANIMCMD_FRAME(8, 0),
	obj_image_anim_frame 16, 0  @ ANIMCMD_FRAME(16, 0),
	obj_image_anim_frame 24, 0  @ ANIMCMD_FRAME(24, 0),
	obj_image_anim_frame 32, 0  @ ANIMCMD_FRAME(32, 0),
	obj_image_anim_end  @ ANIMCMD_END

	.align 2
gSpriteAnimTable_83FA290:: @ 83FA290
	.4byte gSpriteAnim_83FA278

	.align 2
gSpriteAnim_83FA294:: @ 83FA294
	obj_image_anim_frame 0, 0  @ ANIMCMD_FRAME(0, 0),
	obj_image_anim_frame 2, 0  @ ANIMCMD_FRAME(2, 0),
	obj_image_anim_frame 4, 0  @ ANIMCMD_FRAME(4, 0),
	obj_image_anim_frame 6, 0  @ ANIMCMD_FRAME(6, 0),
	obj_image_anim_frame 8, 0  @ ANIMCMD_FRAME(8, 0),
	obj_image_anim_end  @ ANIMCMD_END

	.align 2
gSpriteAnimTable_83FA2AC:: @ 83FA2AC
	.4byte gSpriteAnim_83FA294

	.align 2
gSpriteTemplate_83FA2B0:: @ 83FA2B0
	spr_template 7, 5, gOamData_83FA1FC, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83FA2C8:: @ 83FA2C8
	spr_template 8, 5, gOamData_83FA204, gSpriteAnimTable_83FA274, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83FA2E0:: @ 83FA2E0
	spr_template 9, 5, gOamData_83FA20C, gSpriteAnimTable_83FA290, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83FA2F8:: @ 83FA2F8
	spr_template 10, 3, gOamData_83FA214, gSpriteAnimTable_83FA2AC, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83FA310:: @ 83FA310
	spr_template 11, 5, gOamData_83F9EB8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_83FA328:: @ 83FA328
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gSpriteImageTable_83FA330:: @ 83FA330
	obj_frame_tiles gSharedMem + 0x17E00, 0x80
	obj_frame_tiles gSharedMem + 0x17E80, 0x80
	obj_frame_tiles gSharedMem + 0x17F00, 0x80
	obj_frame_tiles gSharedMem + 0x17F80, 0x80

	.align 2
gSpriteAnim_83FA350:: @ 83FA350
	obj_image_anim_frame 0, 5  @ ANIMCMD_FRAME(0, 5),
	obj_image_anim_frame 1, 5  @ ANIMCMD_FRAME(1, 5),
	obj_image_anim_frame 2, 5  @ ANIMCMD_FRAME(2, 5),
	obj_image_anim_frame 1, 5  @ ANIMCMD_FRAME(1, 5),
	obj_image_anim_jump 0  @ ANIMCMD_JUMP(0),

	.align 2
gSpriteAnim_83FA364:: @ 83FA364
	obj_image_anim_frame 0, 10  @ ANIMCMD_FRAME(0, 10),
	obj_image_anim_frame 1, 10  @ ANIMCMD_FRAME(1, 10),
	obj_image_anim_frame 2, 10  @ ANIMCMD_FRAME(2, 10),
	obj_image_anim_frame 1, 10  @ ANIMCMD_FRAME(1, 10),
	obj_image_anim_jump 0  @ ANIMCMD_JUMP(0),

	.align 2
gSpriteAnim_83FA378:: @ 83FA378
	obj_image_anim_frame 0, 15  @ ANIMCMD_FRAME(0, 15),
	obj_image_anim_frame 1, 15  @ ANIMCMD_FRAME(1, 15),
	obj_image_anim_frame 2, 15  @ ANIMCMD_FRAME(2, 15),
	obj_image_anim_frame 1, 15  @ ANIMCMD_FRAME(1, 15),
	obj_image_anim_jump 0  @ ANIMCMD_JUMP(0),

	.align 2
gSpriteAnim_83FA38C:: @ 83FA38C
	obj_image_anim_frame 1, 2  @ ANIMCMD_FRAME(1, 2),
	obj_image_anim_frame 2, 5  @ ANIMCMD_FRAME(2, 5),
	obj_image_anim_frame 1, 5  @ ANIMCMD_FRAME(1, 5),
	obj_image_anim_frame 3, 5  @ ANIMCMD_FRAME(3, 5),
	obj_image_anim_end  @ ANIMCMD_END

	.align 2
gSpriteAnim_83FA3A0:: @ 83FA3A0
	obj_image_anim_frame 1, 2  @ ANIMCMD_FRAME(1, 2),
	obj_image_anim_frame 0, 4  @ ANIMCMD_FRAME(0, 4),
	obj_image_anim_frame 1, 4  @ ANIMCMD_FRAME(1, 4),
	obj_image_anim_frame 2, 4  @ ANIMCMD_FRAME(2, 4),
	obj_image_anim_frame 3, 4  @ ANIMCMD_FRAME(3, 4),
	obj_image_anim_end  @ ANIMCMD_END

	.align 2
gSpriteAnim_83FA3B8:: @ 83FA3B8
	obj_image_anim_frame 0, 2  @ ANIMCMD_FRAME(0, 2),
	obj_image_anim_frame 1, 5  @ ANIMCMD_FRAME(1, 5),
	obj_image_anim_frame 2, 5  @ ANIMCMD_FRAME(2, 5),
	obj_image_anim_frame 3, 5  @ ANIMCMD_FRAME(3, 5),
	obj_image_anim_end  @ ANIMCMD_END

	.align 2
gSpriteAnim_83FA3CC:: @ 83FA3CC
	obj_image_anim_frame 3, 0  @ ANIMCMD_FRAME(3, 0),
	obj_image_anim_end  @ ANIMCMD_END

	.align 2
gSpriteAnim_83FA3D4:: @ 83FA3D4
	obj_image_anim_frame 2, 2  @ ANIMCMD_FRAME(2, 2),
	obj_image_anim_frame 1, 5  @ ANIMCMD_FRAME(1, 5),
	obj_image_anim_frame 0, 5  @ ANIMCMD_FRAME(0, 5),
	obj_image_anim_frame 3, 5  @ ANIMCMD_FRAME(3, 5),
	obj_image_anim_end  @ ANIMCMD_END

	.align 2
gSpriteAnimTable_83FA3E8:: @ 83FA3E8
	.4byte gSpriteAnim_83FA350
	.4byte gSpriteAnim_83FA364
	.4byte gSpriteAnim_83FA378
	.4byte gSpriteAnim_83FA38C
	.4byte gSpriteAnim_83FA3D4
	.4byte gSpriteAnim_83FA3A0
	.4byte gSpriteAnim_83FA3B8
	.4byte gSpriteAnim_83FA3B8
	.4byte gSpriteAnim_83FA3CC

	.align 2
gSpriteTemplate_83FA40C:: @ 83FA40C
	spr_template 0xFFFF, 2, gOamData_83FA328, gSpriteAnimTable_83FA3E8, gSpriteImageTable_83FA330, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_83FA424:: @ 83FA424
	.2byte 0x0351
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gUnknown_083FA42C:: @ 83FA42C
	obj_tiles gRouletteCenter_Gfx, 2048, 0x0006

	.align 2
gSpriteTemplate_83FA434:: @ 83FA434
	spr_template 6, 2, gOamData_83FA424, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8118554

	.align 2
gOamData_83FA44C:: @ 83FA44C
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_83FA454:: @ 83FA454
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gSpriteImageTable_83FA45C:: @ 83FA45C
	obj_frame_tiles gSharedMem + 0x17000, 0x200
	obj_frame_tiles gSharedMem + 0x17200, 0x200
	obj_frame_tiles gSharedMem + 0x17400, 0x200
	obj_frame_tiles gSharedMem + 0x17600, 0x200
	obj_frame_tiles gSharedMem + 0x17800, 0x200
	obj_frame_tiles gSharedMem + 0x17A00, 0x200
	obj_frame_tiles gSharedMem + 0x17C00, 0x200

	.align 2
gSpriteAnim_83FA494:: @ 83FA494
	obj_image_anim_frame 0, 6  @ ANIMCMD_FRAME(0, 6),
	obj_image_anim_frame 1, 6  @ ANIMCMD_FRAME(1, 6),
	obj_image_anim_frame 2, 6  @ ANIMCMD_FRAME(2, 6),
	obj_image_anim_frame 3, 6  @ ANIMCMD_FRAME(3, 6),
	obj_image_anim_frame 2, 6  @ ANIMCMD_FRAME(2, 6),
	obj_image_anim_frame 4, 6  @ ANIMCMD_FRAME(4, 6),
	obj_image_anim_jump 2  @ ANIMCMD_JUMP(2),

	.align 2
gSpriteAnim_83FA4B0:: @ 83FA4B0
	obj_image_anim_frame 5, 10  @ ANIMCMD_FRAME(5, 10),
	obj_image_anim_end  @ ANIMCMD_END

	.align 2
gSpriteAnim_83FA4B8:: @ 83FA4B8
	obj_image_anim_frame 5, 10, OBJ_IMAGE_ANIM_H_FLIP  @ ANIMCMD_FRAME(5, 10, OBJ_IMAGE_ANIM_H_FLIP),
	obj_image_anim_end  @ ANIMCMD_END

	.align 2
gSpriteAnim_83FA4C0:: @ 83FA4C0
	obj_image_anim_frame 5, 20  @ ANIMCMD_FRAME(5, 20),
	obj_image_anim_frame 6, 20  @ ANIMCMD_FRAME(6, 20),
	obj_image_anim_jump 0  @ ANIMCMD_JUMP(0),

	.align 2
gSpriteAnim_83FA4CC:: @ 83FA4CC
	obj_image_anim_frame 5, 20, OBJ_IMAGE_ANIM_H_FLIP  @ ANIMCMD_FRAME(5, 20, OBJ_IMAGE_ANIM_H_FLIP),
	obj_image_anim_frame 6, 20, OBJ_IMAGE_ANIM_H_FLIP  @ ANIMCMD_FRAME(6, 20, OBJ_IMAGE_ANIM_H_FLIP),
	obj_image_anim_jump 0  @ ANIMCMD_JUMP(0),

	.align 2
gSpriteAnim_83FA4D8:: @ 83FA4D8
	obj_image_anim_frame 5, 10  @ ANIMCMD_FRAME(5, 10),
	obj_image_anim_frame 6, 10  @ ANIMCMD_FRAME(6, 10),
	obj_image_anim_jump 0  @ ANIMCMD_JUMP(0),

	.align 2
gSpriteAnim_83FA4E4:: @ 83FA4E4
	obj_image_anim_frame 5, 10, OBJ_IMAGE_ANIM_H_FLIP  @ ANIMCMD_FRAME(5, 10, OBJ_IMAGE_ANIM_H_FLIP),
	obj_image_anim_frame 6, 10, OBJ_IMAGE_ANIM_H_FLIP  @ ANIMCMD_FRAME(6, 10, OBJ_IMAGE_ANIM_H_FLIP),
	obj_image_anim_jump 0  @ ANIMCMD_JUMP(0),

	.align 2
gSpriteAnimTable_83FA4F0:: @ 83FA4F0
	.4byte gSpriteAnim_83FA494

	.align 2
gSpriteAnimTable_83FA4F4:: @ 83FA4F4
	.4byte gSpriteAnim_83FA4B0
	.4byte gSpriteAnim_83FA4B8
	.4byte gSpriteAnim_83FA4C0
	.4byte gSpriteAnim_83FA4CC
	.4byte gSpriteAnim_83FA4D8
	.4byte gSpriteAnim_83FA4E4

	.align 2
gSpriteTemplate_83FA50C:: @ 83FA50C
	spr_template 0xFFFF, 6, gOamData_83FA44C, gSpriteAnimTable_83FA4F0, gSpriteImageTable_83FA45C, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83FA524:: @ 83FA524
	spr_template 0xFFFF, 7, gOamData_83FA454, gSpriteAnimTable_83FA4F4, gSpriteImageTable_83FA45C, gDummySpriteAffineAnimTable, sub_8119D80

	.align 2
gOamData_83FA53C:: @ 83FA53C
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gOamData_83FA544:: @ 83FA544
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_83FA54C:: @ 83FA54C
	.2byte 0x4100
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gSpriteImageTable_83FA554: @ 83FA554
	obj_frame_tiles gSharedMem + 0x18000, 0x80

	.align 2
gSpriteImageTable_83FA55C: @ 83FA55C
	obj_frame_tiles gSharedMem + 0x18080, 0x100

	.align 2
gSpriteAffineAnim_83FA564:: @ 83FA564
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0x2, 0x2, 0, 60
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83FA57C:: @ 83FA57C
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFFE, 0x0, 0, 15
	obj_rot_scal_anim_frame 0xFFFF, 0xFFFE, 0, 15
	obj_rot_scal_anim_frame 0xFFFF, 0xFFFB, 0, 24
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83FA5A4:: @ 83FA5A4
	.4byte gSpriteAffineAnim_83FA564

	.align 2
gSpriteAffineAnimTable_83FA5A8:: @ 83FA5A8
	.4byte gSpriteAffineAnim_83FA57C

	.align 2
gSpriteAffineAnim_83FA5AC:: @ 83FA5AC
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83FA5BC:: @ 83FA5BC
	.4byte gSpriteAffineAnim_83FA5AC

	.align 2
gSpriteTemplate_83FA5C0:: @ 83FA5C0
	spr_template 0xFFFF, 1, gOamData_83FA53C, gSpriteAnimTable_83F9ED8, gSpriteImageTable_83FA554, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83FA5D8:: @ 83FA5D8
	spr_template 0xFFFF, 1, gOamData_83FA544, gSpriteAnimTable_83F9ED8, gSpriteImageTable_83FA55C, gDummySpriteAffineAnimTable, sub_8119964

	.align 2
gSpriteTemplate_83FA5F0:: @ 83FA5F0
	spr_template 0xFFFF, 1, gOamData_83FA54C, gSpriteAnimTable_83F9ED8, gSpriteImageTable_83FA55C, gSpriteAffineAnimTable_83FA5A8, sub_8119D80

gUnknown_083FA608:: @ 83FA608
	.byte 0, 1, 2, 3, 4

	.align 1
gUnknown_083FA60E:: @ 83FA60E
	.2byte 0x74, 0x2C
	.2byte 0x74, 0x70

	.align 1
gUnknown_083FA616:: @ 83FA616
	.2byte 256, 84
	.2byte -16, 84

	.align 1
gUnknown_083FA61E:: @ 83FA61E
	.2byte 0x907
	.2byte 0x808
	.2byte 0x709
	.2byte 0x60A
	.2byte 0x50B
	.2byte 0x40C
	.2byte 0x30D
	.2byte 0x20E
	.2byte 0x10F
	.2byte  0x10

	.align 1
gUnknown_083FA632:: @ 83FA632
	.2byte  -1,  0,  1,  0
	.2byte  -2,  0,  2,  0
	.2byte  -3,  0,  3,  0

gUnknown_083FA64A:: @ 83FA64A
	.byte -1, 1

gUnknown_083FA64C:: @ 83FA64C
	.byte   2,  0
	.byte   2,  0
	.byte   2, -1
	.byte   2, -1
	.byte   2, -1
	.byte   2, -1
	.byte   2, -2
	.byte   2, -2
