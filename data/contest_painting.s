	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gPictureFramePalettes:: @ 83EF198
	.incbin "graphics/picture_frame/bg0.gbapal"
	.incbin "graphics/picture_frame/bg1.gbapal"
	.incbin "graphics/picture_frame/bg2.gbapal"
	.incbin "graphics/picture_frame/bg3.gbapal"
	.incbin "graphics/picture_frame/bg4.gbapal"
	.incbin "graphics/picture_frame/bg5.gbapal"
	.space 10 * 32

	.align 2
gPictureFrameTiles_0:: @ 83EF398
	.incbin "graphics/picture_frame/frame0.4bpp.rl"

	.align 2
gPictureFrameTiles_1:: @ 83F041C
	.incbin "graphics/picture_frame/frame1.4bpp.rl"

	.align 2
gPictureFrameTiles_2:: @ 83F104C
	.incbin "graphics/picture_frame/frame2.4bpp.rl"

	.align 2
gPictureFrameTiles_3:: @ 83F1B84
	.incbin "graphics/picture_frame/frame3.4bpp.rl"

	.align 2
gPictureFrameTiles_4:: @ 83F2B3C
	.incbin "graphics/picture_frame/frame4.4bpp.rl"

	.align 2
gPictureFrameTiles_5:: @ 83F3C6C
	.incbin "graphics/picture_frame/frame5.4bpp.rl"

	.align 2
gPictureFrameTilemap_0:: @ 83F4260
	.incbin "graphics/picture_frame/frame0_map.bin.rl"

	.align 2
gPictureFrameTilemap_1:: @ 83F476C
	.incbin "graphics/picture_frame/frame1_map.bin.rl"

	.align 2
gPictureFrameTilemap_2:: @ 83F4C78
	.incbin "graphics/picture_frame/frame2_map.bin.rl"

	.align 2
gPictureFrameTilemap_3:: @ 83F5184
	.incbin "graphics/picture_frame/frame3_map.bin.rl"

	.align 2
gPictureFrameTilemap_4:: @ 83F5690
	.incbin "graphics/picture_frame/frame4_map.bin.rl"

	.align 2
gPictureFrameTilemap_5:: @ 83F5B9C
	.incbin "graphics/picture_frame/frame5_map.bin.rl"

	.align 2
gUnknown_083F60AC:: @ 83F60AC
	.4byte OtherText_Cool
	.4byte OtherText_Beauty2
	.4byte OtherText_Cute
	.4byte OtherText_Smart
	.4byte OtherText_Tough

	.align 2
gUnknown_083F60C0:: @ 83F60C0
	.4byte OtherText_NonstopSuperCool, OtherText_Terminator6
	.4byte OtherText_GoodLookingPoke, OtherText_Terminator7
	.4byte OtherText_MarvelousGreat, OtherText_Terminator8

	.4byte OtherText_CenturyLastVenus, OtherText_Terminator9
	.4byte OtherText_Terminator10, OtherText_DazzlingSlime
	.4byte OtherText_PokeCenterIdol, OtherText_Terminator11

	.4byte OtherText_LovelyAndSweet, OtherText_Terminator12
	.4byte OtherText_ThePretty, OtherText_WinningPortrait
	.4byte OtherText_GiveUsWink, OtherText_Terminator13

	.4byte OtherText_SmartnessMaestro, OtherText_Terminator15
	.4byte OtherText_ChosenPokeAmong, OtherText_Terminator15
	.4byte OtherText_TheExcellent, OtherText_ItsMomentOfElegance

	.4byte OtherText_PowerfullyMuscular, OtherText_Terminator16
	.4byte OtherText_StrongErEst, OtherText_Terminator17
	.4byte OtherText_MightyTough, OtherText_Exclamation

	.align 2
gOamData_83F6138:: @ 83F6138
	.2byte 0x3000
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gUnknown_083F6140:: @ 83F6140
	.space 4
