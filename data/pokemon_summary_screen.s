	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 83C0F60
	.include "data/text/nature_names.inc"

	.align 2
gUnknown_083C1068:: @ 83C1068
	.4byte gEmptyString_81E72B0
	.4byte OtherText_PokeInfo
	.4byte OtherText_PokeSkills
	.4byte OtherText_BattleMoves
	.4byte OtherText_ContestMoves
	.4byte OtherText_Switch
	.4byte OtherText_Info
	.4byte gOtherText_CancelNoTerminator

	.align 2
gSpriteAffineAnim_83C1088:: @ 83C1088
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83C1098:: @ 83C1098
	.4byte gSpriteAffineAnim_83C1088

	.align 2
gOamData_83C109C:: @ 83C109C
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_83C10A4:: @ 83C10A4
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C10AC:: @ 83C10AC
	obj_image_anim_frame 8, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C10B4:: @ 83C10B4
	obj_image_anim_frame 16, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C10BC:: @ 83C10BC
	obj_image_anim_frame 24, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C10C4:: @ 83C10C4
	obj_image_anim_frame 32, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C10CC:: @ 83C10CC
	obj_image_anim_frame 40, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C10D4:: @ 83C10D4
	obj_image_anim_frame 48, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C10DC:: @ 83C10DC
	obj_image_anim_frame 56, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C10E4:: @ 83C10E4
	obj_image_anim_frame 64, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C10EC:: @ 83C10EC
	obj_image_anim_frame 72, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C10F4:: @ 83C10F4
	obj_image_anim_frame 80, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C10FC:: @ 83C10FC
	obj_image_anim_frame 88, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1104:: @ 83C1104
	obj_image_anim_frame 96, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C110C:: @ 83C110C
	obj_image_anim_frame 104, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1114:: @ 83C1114
	obj_image_anim_frame 112, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C111C:: @ 83C111C
	obj_image_anim_frame 120, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1124:: @ 83C1124
	obj_image_anim_frame 128, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C112C:: @ 83C112C
	obj_image_anim_frame 136, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1134:: @ 83C1134
	obj_image_anim_frame 144, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C113C:: @ 83C113C
	obj_image_anim_frame 152, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1144:: @ 83C1144
	obj_image_anim_frame 160, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C114C:: @ 83C114C
	obj_image_anim_frame 168, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1154:: @ 83C1154
	obj_image_anim_frame 176, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83C115C:: @ 83C115C
	.4byte gSpriteAnim_83C10A4
	.4byte gSpriteAnim_83C10AC
	.4byte gSpriteAnim_83C10B4
	.4byte gSpriteAnim_83C10BC
	.4byte gSpriteAnim_83C10C4
	.4byte gSpriteAnim_83C10CC
	.4byte gSpriteAnim_83C10D4
	.4byte gSpriteAnim_83C10DC
	.4byte gSpriteAnim_83C10E4
	.4byte gSpriteAnim_83C10EC
	.4byte gSpriteAnim_83C10F4
	.4byte gSpriteAnim_83C10FC
	.4byte gSpriteAnim_83C1104
	.4byte gSpriteAnim_83C110C
	.4byte gSpriteAnim_83C1114
	.4byte gSpriteAnim_83C111C
	.4byte gSpriteAnim_83C1124
	.4byte gSpriteAnim_83C112C
	.4byte gSpriteAnim_83C1134
	.4byte gSpriteAnim_83C113C
	.4byte gSpriteAnim_83C1144
	.4byte gSpriteAnim_83C114C
	.4byte gSpriteAnim_83C1154

	.align 2
gUnknown_083C11B8:: @ 83C11B8
	obj_tiles gMoveTypes_Gfx, 5888, 0x7532

	.align 2
gSpriteTemplate_83C11C0:: @ 83C11C0
	spr_template 30002, 30002, gOamData_83C109C, gSpriteAnimTable_83C115C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_083C11D8:: @ 83C11D8
	.byte 0xD,0xD,0xE,0xE,0xD,0xD,0xF,0xE,0xD,0xF,0xD,0xE,0xF,0xD,0xE,0xE,0xF,0xD,0xD,0xE,0xE,0xF,0xD

	.align 2
gOamData_83C11F0:: @ 83C11F0
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_83C11F8:: @ 83C11F8
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1200:: @ 83C1200
	obj_image_anim_frame 4, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1208:: @ 83C1208
	obj_image_anim_frame 8, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1210:: @ 83C1210
	obj_image_anim_frame 12, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1218:: @ 83C1218
	obj_image_anim_frame 16, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1220:: @ 83C1220
	obj_image_anim_frame 16, 0, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1228:: @ 83C1228
	obj_image_anim_frame 20, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1230:: @ 83C1230
	obj_image_anim_frame 24, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1238:: @ 83C1238
	obj_image_anim_frame 24, 0, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1240:: @ 83C1240
	obj_image_anim_frame 28, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83C1248:: @ 83C1248
	.4byte gSpriteAnim_83C11F8
	.4byte gSpriteAnim_83C1200
	.4byte gSpriteAnim_83C1208
	.4byte gSpriteAnim_83C1210
	.4byte gSpriteAnim_83C1218
	.4byte gSpriteAnim_83C1220
	.4byte gSpriteAnim_83C1228
	.4byte gSpriteAnim_83C1230
	.4byte gSpriteAnim_83C1238
	.4byte gSpriteAnim_83C1240

	.align 2
gUnknown_083C1270:: @ 83C1270
	obj_tiles gMenuSummaryGfx, 1024, 0x7530

	.align 2
gUnknown_083C1278:: @ 83C1278
	obj_pal gMenuSummaryPal, 0x7530

	.align 2
gSpriteTemplate_83C1280:: @ 83C1280
	spr_template 30000, 30000, gOamData_83C11F0, gSpriteAnimTable_83C1248, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_83C1298:: @ 83C1298
	.2byte 0x4000
	.2byte 0x4000
	.2byte 0x0C00

	.align 2
gSpriteAnim_83C12A0:: @ 83C12A0
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C12A8:: @ 83C12A8
	obj_image_anim_frame 4, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C12B0:: @ 83C12B0
	obj_image_anim_frame 8, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C12B8:: @ 83C12B8
	obj_image_anim_frame 12, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C12C0:: @ 83C12C0
	obj_image_anim_frame 16, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C12C8:: @ 83C12C8
	obj_image_anim_frame 20, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83C12D0:: @ 83C12D0
	obj_image_anim_frame 24, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83C12D8:: @ 83C12D8
	.4byte gSpriteAnim_83C12A0
	.4byte gSpriteAnim_83C12A8
	.4byte gSpriteAnim_83C12B0
	.4byte gSpriteAnim_83C12B8
	.4byte gSpriteAnim_83C12C0
	.4byte gSpriteAnim_83C12C8
	.4byte gSpriteAnim_83C12D0

	.align 2
gUnknown_083C12F4:: @ 83C12F4
	obj_tiles gStatusGfx_Icons, 896, 0x7531

	.align 2
gUnknown_083C12FC:: @ 83C12FC
	obj_pal gStatusPal_Icons, 0x7531

	.align 2
gSpriteTemplate_83C1304:: @ 83C1304
	spr_template 30001, 30001, gOamData_83C1298, gSpriteAnimTable_83C12D8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSummaryScreenMonMarkingsPalette:: @ 83C131C
	.incbin "graphics/summary_screen/mon_markings.gbapal"

.ifdef ENGLISH
	.align 2
gSummaryScreenTextTiles:: @ 83C133C
	.incbin "graphics/summary_screen/text.4bpp"
.endif

	.align 2
gSummaryScreenButtonTiles:: @ 83C147C
	.incbin "graphics/summary_screen/buttons.4bpp"

	.align 1
gUnknown_083C157C:: @ 83C157C
	.2byte 0x5F5A @ palette color

	.align 1
gUnknown_083C157E:: @ 83C157E
	.2byte 0x6FDE @ palette color

	.align 2
gUnknown_083C1580:: @ 83C1580
	.4byte sub_809FC0C
	.4byte sub_809FEB8

	.align 2
gUnknown_083C1588:: @ 83C1588
	.4byte sub_809F63C
	.4byte sub_809F650
	.4byte sub_809F664
	.4byte sub_809F664

	.align 2
gUnknown_083C1598:: @ 83C1598
	.4byte sub_809FE6C
	.4byte sub_80A0090
	.4byte sub_80A015C
	.4byte sub_80A015C

gDoubleBattlePartyOrder:: @ 83C15A8
	.byte 0, 2, 3, 1, 4, 5

gUnknown_083C15AE:: @ 83C15AE
	.string "{STR_VAR_1}{CLEAR_TO 64}$"

gUnknown_083C15B4:: @ 83C15B4
	.string "{STR_VAR_1}{CLEAR_TO 72}$"

	.align 2
gUnknown_083C15BC:: @ 83C15BC
	.byte  9,  1, 0,  2
	.byte 10,  3, 0,  4
	.byte  8,  5, 0,  6
	.byte 11,  7, 0,  8
	.byte 14,  9, 0, 10
	.byte 12, 11, 0, 12
	.byte 13, 13, 0, 14
	.byte -1, 15, 0, 10
