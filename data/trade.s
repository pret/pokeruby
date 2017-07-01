	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
	.byte 0x90, 0x08, 0x00, 0x00
	.byte 0xC0, 0x3A, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00
	.byte 0x30, 0x05, 0x00, 0x00
	.byte 0x24, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00
	.byte 0xD8, 0x04, 0x00, 0x00

	.align 1
gTradeMovesBoxTilemap:: @ 820ABF0
	.incbin "graphics/trade/moves_box_map.bin"

	.align 1
gTradePartyBoxTilemap:: @ 820ADEE
	.incbin "graphics/trade/party_box_map.bin"

	.align 2
gTradeStripesBG2Tilemap:: @ 820AFEC
	.incbin "graphics/trade/stripes_bg2_map.bin"

	.align 2
gTradeStripesBG3Tilemap:: @ 820B7EC
	.incbin "graphics/trade/stripes_bg3_map.bin"

	.align 2
gOamData_820BFEC:: @ 820BFEC
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_820BFF4:: @ 820BFF4
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820BFFC:: @ 820BFFC
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820C004:: @ 820C004
	obj_image_anim_frame 16, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820C00C:: @ 820C00C
	obj_image_anim_frame 24, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820C014:: @ 820C014
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820C01C:: @ 820C01C
	obj_image_anim_frame 40, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_820C024:: @ 820C024
	.4byte gSpriteAnim_820BFF4
	.4byte gSpriteAnim_820BFFC
	.4byte gSpriteAnim_820C004
	.4byte gSpriteAnim_820C00C
	.4byte gSpriteAnim_820C014
	.4byte gSpriteAnim_820C01C

	.align 2
TradeScreenTextPalette: @ 820C03C
	.incbin "graphics/trade/text1.gbapal"
	.incbin "graphics/trade/text2.gbapal" @ unused?

	.align 2
gUnknown_0820C07C:: @ 820C07C
	obj_tiles 0x0201d000, 256, 0x00c8
	obj_tiles 0x0201d100, 256, 0x00c9
	obj_tiles 0x0201d200, 256, 0x00ca
	obj_tiles 0x0201d300, 256, 0x00cb
	obj_tiles 0x0201d400, 256, 0x00cc
	obj_tiles 0x0201d500, 256, 0x00cd
	obj_tiles 0x0201d600, 256, 0x00ce
	obj_tiles 0x0201d700, 256, 0x00cf
	obj_tiles 0x0201d800, 256, 0x00d0
	obj_tiles 0x0201d900, 256, 0x00d1
	obj_tiles 0x0201da00, 256, 0x00d2
	obj_tiles 0x0201db00, 256, 0x00d3
	obj_tiles 0x0201dc00, 256, 0x00d4

	.align 2
gSpritePalette_TradeScreenText:: @ 820C0E4
	obj_pal TradeScreenTextPalette, 4925

	.align 2
gSpriteTemplate_820C0EC:: @ 820C0EC
	spr_template 200, 4925, gOamData_820BFEC, gSpriteAnimTable_820C024, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_820C104:: @ 820C104
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_820C10C:: @ 820C10C
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820C114:: @ 820C114
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_820C11C:: @ 820C11C
	.4byte gSpriteAnim_820C10C
	.4byte gSpriteAnim_820C114

	.align 2
gUnknown_0820C124:: @ 820C124
	obj_tiles gUnknown_08EA1DEC, 0x800, 300

	.align 2
gUnknown_0820C12C:: @ 820C12C
	obj_pal gUnknown_08EA0328, 2345

	.align 2
gSpriteTemplate_820C134:: @ 820C134
	spr_template 300, 2345, gOamData_820C104, gSpriteAnimTable_820C11C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gUnknown_0820C14C:: @ 820C14C
	.4byte TradeText_Cancel
	.4byte TradeText_ChoosePoke
	.4byte TradeText_Summary1
	.4byte TradeText_Trade1
	.4byte TradeText_CancelTradePrompt
	.4byte TradeText_PressBToExit

@ This is used to determine the next mon to select when the D-Pad is
@ pressed in a given direction.
@ Note that the mons are laid out like this.
@ 0-5 are the player's party and 6-11 are the trading partner's party.
@ 12 is the cancel button.
@  0  1  6  7
@  2  3  8  9
@  4  5 10 11
@          12
gTradeNextSelectedMonTable:: @ 820C164
	@ 0
	.byte  4,  2, 12, 12,  0,  0 @ up
	.byte  2,  4, 12, 12,  0,  0 @ down
	.byte  7,  6,  1,  0,  0,  0 @ left
	.byte  1,  6,  7,  0,  0,  0 @ right
	@ 1
	.byte  5,  3, 12, 12,  0,  0 @ up
	.byte  3,  5, 12, 12,  0,  0 @ down
	.byte  0,  7,  6,  1,  0,  0 @ left
	.byte  6,  7,  0,  1,  0,  0 @ right
	@ 2
	.byte  0,  0,  0,  0,  0,  0 @ up
	.byte  4,  0,  0,  0,  0,  0 @ down
	.byte  9,  8,  7,  6,  0,  0 @ left
	.byte  3,  1,  0,  0,  0,  0 @ right
	@ 3
	.byte  1,  1,  1,  1,  0,  0 @ up
	.byte  5,  1,  1,  1,  0,  0 @ down
	.byte  2,  9,  8,  7,  0,  0 @ left
	.byte  8,  9,  6,  6,  0,  0 @ right
	@ 4
	.byte  2,  2,  2,  2,  0,  0 @ up
	.byte  0,  0,  0,  0,  0,  0 @ down
	.byte 11, 10,  9,  8,  7,  6 @ left
	.byte  5,  3,  1,  0,  0,  0 @ right
	@ 5
	.byte  3,  3,  3,  3,  0,  0 @ up
	.byte  1,  1,  1,  1,  0,  0 @ down
	.byte  4,  4,  4,  4,  0,  0 @ left
	.byte 10,  8,  6,  0,  0,  0 @ right
	@ 6
	.byte 10,  8, 12,  0,  0,  0 @ up
	.byte  8, 10, 12,  0,  0,  0 @ down
	.byte  1,  0,  0,  0,  0,  0 @ left
	.byte  7,  0,  1,  0,  0,  0 @ right
	@ 7
	.byte 12,  0,  0,  0,  0,  0 @ up
	.byte  9, 12,  0,  0,  0,  0 @ down
	.byte  6,  0,  0,  0,  0,  0 @ left
	.byte  0,  0,  0,  0,  0,  0 @ right
	@ 8
	.byte  6,  0,  0,  0,  0,  0 @ up
	.byte 10,  6,  0,  0,  0,  0 @ down
	.byte  3,  2,  1,  0,  0,  0 @ left
	.byte  9,  7,  0,  0,  0,  0 @ right
	@ 9
	.byte  7,  0,  0,  0,  0,  0 @ up
	.byte 11, 12,  0,  0,  0,  0 @ down
	.byte  8,  0,  0,  0,  0,  0 @ left
	.byte  2,  1,  0,  0,  0,  0 @ right
	@ 10
	.byte  8,  0,  0,  0,  0,  0 @ up
	.byte  6,  0,  0,  0,  0,  0 @ down
	.byte  5,  4,  3,  2,  1,  0 @ left
	.byte 11,  9,  7,  0,  0,  0 @ right
	@ 11
	.byte  9,  0,  0,  0,  0,  0 @ up
	.byte 12,  0,  0,  0,  0,  0 @ down
	.byte 10,  0,  0,  0,  0,  0 @ left
	.byte  4,  2,  0,  0,  0,  0 @ right
	@ 12
	.byte 11,  9,  7,  6,  0,  0 @ up
	.byte  7,  6,  0,  0,  0,  0 @ down
	.byte 12,  0,  0,  0,  0,  0 @ left
	.byte 12,  0,  0,  0,  0,  0 @ right

@ The coordinates are in units of tiles.
@ These are used for both mon icons and the selected mon cursor,
@ but the origins of the coordinates differ.
gTradeMonSpriteCoords:: @ 820C29C
	@ left-side party
	.byte  1,  5
	.byte  8,  5
	.byte  1, 10
	.byte  8, 10
	.byte  1, 15
	.byte  8, 15

	@ right-side party
	.byte 16,  5
	.byte 23,  5
	.byte 16, 10
	.byte 23, 10
	.byte 16, 15
	.byte 23, 15

	@ cancel button
	.byte 23, 18

gTradeLevelDisplayCoords:: @ 820C2B6
	@ left-side party
	.byte  5,  4
	.byte 12,  4
	.byte  5,  9
	.byte 12,  9
	.byte  5, 14
	.byte 12, 14

	@ right-side party
	.byte 20,  4
	.byte 27,  4
	.byte 20,  9
	.byte 27,  9
	.byte 20, 14
	.byte 27, 14

gTradeMonBoxCoords:: @ 820C2CE
	@ left-side party
	.byte  1,  3
	.byte  8,  3
	.byte  1,  8
	.byte  8,  8
	.byte  1, 13
	.byte  8, 13

	@ right-side party
	.byte 16,  3
	.byte 23,  3
	.byte 16,  8
	.byte 23,  8
	.byte 16, 13
	.byte 23, 13

gTradeUnknownSpriteCoords:: @ 820C2E6
	.byte  59, 10
	.byte 179, 10
	.byte  59, 10
	.byte 179, 10

	.align 2
gUnknown_0820C2F0:: @ 820C2F0
	.4byte TradeText_LinkStandby
	.4byte TradeText_TradeCancelled
	.4byte TradeText_OnlyPoke
	.4byte TradeText_NonTradablePoke
	.4byte TradeText_WaitingForFriend
	.4byte TradeText_WantToTrade

gTradeMessageWindowRects:: @ 820C308
	.byte 8, 7, 22, 12
	.byte 8, 7, 22, 12
	.byte 6, 7, 24, 12
	.byte 6, 7, 24, 12
	.byte 8, 7, 22, 12
	.byte 7, 7, 23, 12

	.align 2
gUnknown_0820C320:: @ 820C320
	.4byte TradeText_Summary2, sub_804A9F4 @unknown
	.4byte TradeText_Trade2, sub_804AA00

gUnknown_0820C330:: @ 820C330
	.byte 0, 14
	.byte 15, 29

gUnknown_0820C334:: @ 820C334
	.byte 3, 5
	.byte 3, 7
	.byte 18, 5
	.byte 18, 7

gOtherText_Terminator::
	.string "$"

gOtherText_MaleSymbol3:: @ 820C33D
	.string "♂$"

gOtherText_FemaleSymbol3:: @ 820C33F
	.string "♀$"

gOtherText_GenderlessSymbol:: @ 820C341
	.string "$$"

	.align 2
	.4byte gTileBuffer

@ Unused debug strings?
	.string "かいめの そうしん$", 13
	.string "かいめの じゅしん$", 13
	.string "ポケモンアイコンセット$", 13
	.string "OBJテキストセット$", 13
	.string "セルセット$", 13
	.string "OBJテキストADD$", 13
	.string "システムメッセージADD$", 13
	.string "はいけいセット$", 13

@ Shedinja's Japanese name
@ sub_8048D44 compares a pokemon name with this string
gUnknown_0820C3B0:: @ 820C3B0
	.string "ヌケニン$"

	.string "こうかんせいりつ     $" @ trade completed
	.string "だめだたらしいよ     $" @ it's no good (trade failed maybe?)

gUnknown_0820C3D1:: @ 820C3D1
	.byte 4, 3
	.byte 19, 3

	.align 2
gTradeBallPalette:: @ 820C3D8
	.incbin "graphics/trade/ball.gbapal"

	.align 2
gTradeBallTiles:: @ 820C3F8
	.incbin "graphics/trade/ball.4bpp"

	.align 2
gUnknown_0820C9F8:: @ 820C9F8
	.incbin "graphics/trade/unknown.gbapal"
	.incbin "graphics/trade/gba.gbapal"
	.incbin "graphics/trade/shadow.gbapal"
	.space 32
	.incbin "graphics/trade/misc.gbapal"

	.align 2
gUnknown_0820CA98:: @ 820CA98
	.incbin "graphics/trade/gba.4bpp"
	.incbin "graphics/trade/shadow.4bpp"

	.align 2
gUnknown_0820DD98:: @ 820DD98
	.incbin "graphics/trade/pokeball_symbol.8bpp"

	.align 2
gUnknown_0820F798:: @ 820F798
	.incbin "graphics/trade/shadow_map.bin"

	.align 2
gUnknown_08210798:: @ 8210798
	.incbin "graphics/trade/gba_map.bin"

	.align 2
gUnknown_08211798:: @ 8211798
	.incbin "graphics/trade/cable_closeup_map.bin"

	.align 2
gUnknown_08211F98:: @ 8211F98
	.incbin "graphics/trade/pokeball_symbol_map.bin"

	.incbin "graphics/unused/unknown/8212098.gbapal"

	.align 2
gTradeCableEndPalette:: @ 82120B8
	.incbin "graphics/trade/cable_end.gbapal"

	.incbin "graphics/unused/unknown/82120D8.gbapal"

	.space 32

	.align 2
gTradeGlowPalette:: @ 8212118
	.incbin "graphics/trade/glow.gbapal"

	.align 2
gTradeGlow1Tiles:: @ 8212138
	.incbin "graphics/trade/glow1.4bpp"

	.align 2
gTradeGlow2Tiles:: @ 8212338
	.incbin "graphics/trade/glow2.4bpp"

	.align 2
gTradeCableEndTiles:: @ 8212538
	.incbin "graphics/trade/cable_end.4bpp"

	.align 2
gTradeGBAScreenTiles:: @ 8212738
	.incbin "graphics/trade/gba_screen.4bpp"

	.align 2
gUnknown_08213738:: @ 8213738
	.incbin "graphics/trade/gba_affine.8bpp"

	.align 2
gUnknown_08215778:: @ 8215778
	.incbin "graphics/trade/gba_affine_map.bin"

	.align 2
gOamData_8215878:: @ 8215878
	.2byte 0x0100
	.2byte 0x4000
	.2byte 0x0000

	.align 2
gSpriteAnim_8215880:: @ 8215880
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 4, 3
	obj_image_anim_frame 8, 3
	obj_image_anim_frame 12, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 20, 3
	obj_image_anim_frame 24, 3
	obj_image_anim_frame 28, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 36, 3
	obj_image_anim_frame 40, 3
	obj_image_anim_frame 44, 3
	obj_image_anim_loop 1
	obj_image_anim_frame 0, 3
	obj_image_anim_end

	.align 2
gSpriteAnim_82158BC:: @ 82158BC
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 4, 3
	obj_image_anim_frame 8, 3
	obj_image_anim_frame 12, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 20, 3
	obj_image_anim_frame 24, 3
	obj_image_anim_frame 28, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 36, 3
	obj_image_anim_frame 40, 3
	obj_image_anim_frame 44, 3
	obj_image_anim_loop 2
	obj_image_anim_frame 0, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_82158F8:: @ 82158F8
	.4byte gSpriteAnim_8215880
	.4byte gSpriteAnim_82158BC

	.align 2
gSpriteAffineAnim_8215900:: @ 8215900
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8215910:: @ 8215910
	obj_rot_scal_anim_frame 0xFFF8, 0x0, 0, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8215920:: @ 8215920
	obj_rot_scal_anim_frame 0x60, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 5
	obj_rot_scal_anim_frame 0x8, 0x0, 0, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_8215940:: @ 8215940
	.4byte gSpriteAffineAnim_8215900
	.4byte gSpriteAffineAnim_8215910
	.4byte gSpriteAffineAnim_8215920

	.align 2
gUnknown_0821594C:: @ 821594C
	obj_tiles gTradeBallTiles, 0x600, 5557

	.align 2
gUnknown_08215954:: @ 8215954
	obj_pal gTradeBallPalette, 5558

	.align 2
gSpriteTemplate_821595C:: @ 821595C
	spr_template 5557, 5558, gOamData_8215878, gSpriteAnimTable_82158F8, NULL, gSpriteAffineAnimTable_8215940, sub_804D6BC

	.align 2
gOamData_8215974:: @ 8215974
	.2byte 0x0500
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_821597C:: @ 821597C
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8215984:: @ 8215984
	.4byte gSpriteAnim_821597C

	.align 2
gSpriteAffineAnim_8215988:: @ 8215988
	obj_rot_scal_anim_frame 0xFFF6, 0xFFF6, 0, 5
	obj_rot_scal_anim_frame 0xA, 0xA, 0, 5
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_82159A0:: @ 82159A0
	.4byte gSpriteAffineAnim_8215988

	.align 2
gUnknown_082159A4:: @ 82159A4
	obj_tiles gTradeGlow1Tiles, 0x200, 5550

	.align 2
gUnknown_082159AC:: @ 82159AC
	obj_pal gTradeGlowPalette, 5551

	.align 2
gUnknown_082159B4:: @ 82159B4
	obj_pal gTradeCableEndPalette, 5555

	.align 2
gSpriteTemplate_82159BC:: @ 82159BC
	spr_template 5550, 5551, gOamData_8215974, gSpriteAnimTable_8215984, NULL, gSpriteAffineAnimTable_82159A0, sub_804B058

	.align 2
gOamData_82159D4:: @ 82159D4
	.2byte 0x8000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_82159DC:: @ 82159DC
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_82159E4:: @ 82159E4
	obj_image_anim_frame 8, 5, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_82159EC:: @ 82159EC
	.4byte gSpriteAnim_82159DC
	.4byte gSpriteAnim_82159E4

	.align 2
gUnknown_082159F4:: @ 82159F4
	obj_tiles gTradeGlow2Tiles, 0x300, 5552

	.align 2
gSpriteTemplate_82159FC:: @ 82159FC
	spr_template 5552, 5551, gOamData_82159D4, gSpriteAnimTable_82159EC, NULL, gDummySpriteAffineAnimTable, sub_804B07C

	.align 2
gOamData_8215A14:: @ 8215A14
	.2byte 0x8000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_8215A1C:: @ 8215A1C
	obj_image_anim_frame 0, 10
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8215A24:: @ 8215A24
	.4byte gSpriteAnim_8215A1C

	.align 2
gUnknown_08215A28:: @ 8215A28
	obj_tiles gTradeCableEndTiles, 0x100, 5554

	.align 2
gSpriteTemplate_8215A30:: @ 8215A30
	spr_template 5554, 5555, gOamData_8215A14, gSpriteAnimTable_8215A24, NULL, gDummySpriteAffineAnimTable, sub_804B0BC

	.align 2
gOamData_8215A48:: @ 8215A48
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_8215A50:: @ 8215A50
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 96, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_loop 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8215A74:: @ 8215A74
	.4byte gSpriteAnim_8215A50

	.align 2
gUnknown_08215A78:: @ 8215A78
	obj_tiles gTradeGBAScreenTiles, 0x1000, 5556

	.align 2
gSpriteTemplate_8215A80:: @ 8215A80
	spr_template 5556, 5555, gOamData_8215A48, gSpriteAnimTable_8215A74, NULL, gDummySpriteAffineAnimTable, sub_804B104

	.align 1
gTradeGlow2PaletteAnimTable:: @ 8215A98
	.2byte 0x7F12
	.2byte 0x7F12
	.2byte 0x7F12
	.2byte 0x7FFF
	.2byte 0x7FFF
	.2byte 0x7FFF
	.2byte 0x7F12
	.2byte 0x7F12
	.2byte 0x7F12
	.2byte 0x7FFF
	.2byte 0x7FFF
	.2byte 0x7FFF

	.align 2
gSpriteAffineAnim_8215AB0:: @ 8215AB0
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_8215AC0:: @ 8215AC0
	.4byte gSpriteAffineAnim_8215AB0

@ 8215AC4
	.include "data/ingame_trades.inc"

gTradeBallVerticalVelocityTable:: @ 8215BA0
	.byte  0
	.byte  0
	.byte  1
	.byte  0
	.byte  1
	.byte  0
	.byte  1
	.byte  1
	.byte  1
	.byte  1
	.byte  2
	.byte  2
	.byte  2
	.byte  2
	.byte  3
	.byte  3
	.byte  3
	.byte  3
	.byte  4
	.byte  4
	.byte  4
	.byte  4
	.byte -4
	.byte -4
	.byte -4
	.byte -3
	.byte -3
	.byte -3
	.byte -3
	.byte -2
	.byte -2
	.byte -2
	.byte -2
	.byte -1
	.byte -1
	.byte -1
	.byte -1
	.byte  0
	.byte -1
	.byte  0
	.byte -1
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  1
	.byte  0
	.byte  1
	.byte  0
	.byte  1
	.byte  1
	.byte  1
	.byte  1
	.byte  2
	.byte  2
	.byte  2
	.byte  2
	.byte  3
	.byte  3
	.byte  3
	.byte  3
	.byte  4
	.byte  4
	.byte  4
	.byte  4
	.byte -4
	.byte -3
	.byte -3
	.byte -2
	.byte -2
	.byte -1
	.byte -1
	.byte -1
	.byte  0
	.byte -1
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  1
	.byte  0
	.byte  1
	.byte  1
	.byte  1
	.byte  2
	.byte  2
	.byte  3
	.byte  3
	.byte  4
	.byte -4
	.byte -3
	.byte -2
	.byte -1
	.byte -1
	.byte -1
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  1
	.byte  0
	.byte  1
	.byte  1
	.byte  2
	.byte  3
