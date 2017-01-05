	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 1
gUnknown_08376504:: @ 8376504
	.2byte MOVE_FOCUS_PUNCH
	.2byte MOVE_DRAGON_CLAW
	.2byte MOVE_WATER_PULSE
	.2byte MOVE_CALM_MIND
	.2byte MOVE_ROAR
	.2byte MOVE_TOXIC
	.2byte MOVE_HAIL
	.2byte MOVE_BULK_UP
	.2byte MOVE_BULLET_SEED
	.2byte MOVE_HIDDEN_POWER
	.2byte MOVE_SUNNY_DAY
	.2byte MOVE_TAUNT
	.2byte MOVE_ICE_BEAM
	.2byte MOVE_BLIZZARD
	.2byte MOVE_HYPER_BEAM
	.2byte MOVE_LIGHT_SCREEN
	.2byte MOVE_PROTECT
	.2byte MOVE_RAIN_DANCE
	.2byte MOVE_GIGA_DRAIN
	.2byte MOVE_SAFEGUARD
	.2byte MOVE_FRUSTRATION
	.2byte MOVE_SOLAR_BEAM
	.2byte MOVE_IRON_TAIL
	.2byte MOVE_THUNDERBOLT
	.2byte MOVE_THUNDER
	.2byte MOVE_EARTHQUAKE
	.2byte MOVE_RETURN
	.2byte MOVE_DIG
	.2byte MOVE_PSYCHIC
	.2byte MOVE_SHADOW_BALL
	.2byte MOVE_BRICK_BREAK
	.2byte MOVE_DOUBLE_TEAM
	.2byte MOVE_REFLECT
	.2byte MOVE_SHOCK_WAVE
	.2byte MOVE_FLAMETHROWER
	.2byte MOVE_SLUDGE_BOMB
	.2byte MOVE_SANDSTORM
	.2byte MOVE_FIRE_BLAST
	.2byte MOVE_ROCK_TOMB
	.2byte MOVE_AERIAL_ACE
	.2byte MOVE_TORMENT
	.2byte MOVE_FACADE
	.2byte MOVE_SECRET_POWER
	.2byte MOVE_REST
	.2byte MOVE_ATTRACT
	.2byte MOVE_THIEF
	.2byte MOVE_STEEL_WING
	.2byte MOVE_SKILL_SWAP
	.2byte MOVE_SNATCH
	.2byte MOVE_OVERHEAT
	.2byte MOVE_CUT
	.2byte MOVE_FLY
	.2byte MOVE_SURF
	.2byte MOVE_STRENGTH
	.2byte MOVE_FLASH
	.2byte MOVE_ROCK_SMASH
	.2byte MOVE_WATERFALL
	.2byte MOVE_DIVE

	.4byte gTileBuffer @ unreferenced?

MenuGfx_HoldIcons:
	.incbin "graphics/interface/hold_icons.4bpp"
MenuPal_HoldIcons:
	.incbin "graphics/interface/hold_icons.gbapal"

	.align 2
gUnknown_083765DC:: @ 83765DC
	obj_tiles MenuGfx_HoldIcons, 64, 0xd750

	.align 2
gUnknown_083765E4:: @ 83765E4
	obj_pal MenuPal_HoldIcons, 0xd750

	.align 2
gOamData_83765EC:: @ 83765EC
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gSpriteAnim_83765F4:: @ 83765F4
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83765FC:: @ 83765FC
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8376604:: @ 8376604
	.4byte gSpriteAnim_83765F4
	.4byte gSpriteAnim_83765FC

	.align 2
gSpriteTemplate_837660C:: @ 837660C
	spr_template 55120, 55120, gOamData_83765EC, gSpriteAnimTable_8376604, NULL, gDummySpriteAffineAnimTable, SpriteCB_HeldItemIcon_806DD7C

	.align 2
gUnknown_08376624:: @ 8376624
	.4byte OtherText_ChoosePoke
	.4byte OtherText_MovePokeTo
	.4byte OtherText_TeachWhat
	.4byte OtherText_UseWhat
	.4byte OtherText_GiveWhat
	.4byte OtherText_DoWhat
	.4byte OtherText_NothingToCut
	.4byte OtherText_CantSurf
	.4byte OtherText_AlreadySurfing
	.4byte OtherText_CantUseThatHere
	.4byte OtherText_RestoreWhatMove
	.4byte OtherText_BoostPP
	.4byte gOtherText_CancelWithTerminator
	.4byte OtherText_DoWhatWithItem
	.4byte OtherText_NoPokeForBattle
	.4byte OtherText_ChoosePoke2
	.4byte OtherText_NotEnoughHP
	.4byte OtherText_ThreePokeNeeded
	.4byte OtherText_PokeCantBeSame
	.4byte OtherText_NoIdenticalHoldItems
	.4byte OtherText_TeachWhichPoke

	.align 2
gUnknown_08376678:: @ 8376678
	.byte  16,  40, 0, 0
	.byte 104,  18, 0, 0
	.byte 104,  42, 0, 0
	.byte 104,  66, 0, 0
	.byte 104,  90, 0, 0
	.byte 104, 114, 0, 0
	.byte  16,  24, 0, 0
	.byte  16,  80, 0, 0
	.byte 104,  18, 0, 0
	.byte 104,  50, 0, 0
	.byte 104,  82, 0, 0
	.byte 104, 114, 0, 0
	.byte  16,  24, 0, 0
	.byte  16,  80, 0, 0
	.byte 104,  26, 0, 0
	.byte 104,  50, 0, 0
	.byte 104,  82, 0, 0
	.byte 104, 106, 0, 0
	.byte  16,  24, 0, 0
	.byte 104,  26, 0, 0
	.byte 104,  50, 0, 0
	.byte  16,  80, 0, 0
	.byte 104,  82, 0, 0
	.byte 104, 106, 0, 0
	.byte   5,   4, 0, 0
	.byte  16,   1, 0, 0
	.byte  16,   4, 0, 0
	.byte  16,   7, 0, 0
	.byte  16,  10, 0, 0
	.byte  16,  13, 0, 0
	.byte   5,   2, 0, 0
	.byte   5,   9, 0, 0
	.byte  16,   1, 0, 0
	.byte  16,   5, 0, 0
	.byte  16,   9, 0, 0
	.byte  16,  13, 0, 0
	.byte   5,   2, 0, 0
	.byte   5,   9, 0, 0
	.byte  16,   2, 0, 0
	.byte  16,   5, 0, 0
	.byte  16,   9, 0, 0
	.byte  16,  12, 0, 0
	.byte   5,   2, 0, 0
	.byte  16,   2, 0, 0
	.byte  16,   5, 0, 0
	.byte   5,   9, 0, 0
	.byte  16,   9, 0, 0
	.byte  16,  12, 0, 0

	.align 2
gUnknown_08376738:: @ 8376738
	.byte  6,  5, 0, 0
	.byte 17,  2, 0, 0
	.byte 17,  5, 0, 0
	.byte 17,  8, 0, 0
	.byte 17, 11, 0, 0
	.byte 17, 14, 0, 0
	.byte  6,  3, 0, 0
	.byte  6, 10, 0, 0
	.byte 17,  2, 0, 0
	.byte 17,  6, 0, 0
	.byte 17, 10, 0, 0
	.byte 17, 14, 0, 0
	.byte  6,  3, 0, 0
	.byte  6, 10, 0, 0
	.byte 17,  3, 0, 0
	.byte 17,  6, 0, 0
	.byte 17, 10, 0, 0
	.byte 17, 13, 0, 0
	.byte  6,  3, 0, 0
	.byte 17,  3, 0, 0
	.byte 17,  6, 0, 0
	.byte  6, 10, 0, 0
	.byte 17, 10, 0, 0
	.byte 17, 13, 0, 0
	.byte  3,  7, 0, 0
	.byte 22,  2, 0, 0
	.byte 22,  5, 0, 0
	.byte 22,  8, 0, 0
	.byte 22, 11, 0, 0
	.byte 22, 14, 0, 0
	.byte  3,  5, 0, 0
	.byte  3, 12, 0, 0
	.byte 22,  2, 0, 0
	.byte 22,  6, 0, 0
	.byte 22, 10, 0, 0
	.byte 22, 14, 0, 0
	.byte  3,  5, 0, 0
	.byte  3, 12, 0, 0
	.byte 22,  3, 0, 0
	.byte 22,  6, 0, 0
	.byte 22, 10, 0, 0
	.byte 22, 13, 0, 0
	.byte  3,  5, 0, 0
	.byte 22,  3, 0, 0
	.byte 22,  6, 0, 0
	.byte  3, 12, 0, 0
	.byte 22, 10, 0, 0
	.byte 22, 13, 0, 0
	.byte  7,  7, 0, 0
	.byte 26,  2, 0, 0
	.byte 26,  5, 0, 0
	.byte 26,  8, 0, 0
	.byte 26, 11, 0, 0
	.byte 26, 14, 0, 0
	.byte  7,  5, 0, 0
	.byte  7, 12, 0, 0
	.byte 26,  2, 0, 0
	.byte 26,  6, 0, 0
	.byte 26, 10, 0, 0
	.byte 26, 14, 0, 0
	.byte  7,  5, 0, 0
	.byte  7, 12, 0, 0
	.byte 26,  3, 0, 0
	.byte 26,  6, 0, 0
	.byte 26, 10, 0, 0
	.byte 26, 13, 0, 0
	.byte  7,  5, 0, 0
	.byte 26,  3, 0, 0
	.byte 26,  6, 0, 0
	.byte  7, 12, 0, 0
	.byte 26, 10, 0, 0
	.byte 26, 13, 0, 0

	.align 2
gUnknown_08376858:: @ 8376858
	.4byte BG_VRAM + 0xF1C8
	.4byte BG_VRAM + 0xF0AE
	.4byte BG_VRAM + 0xF16E
	.4byte BG_VRAM + 0xF22E
	.4byte BG_VRAM + 0xF2EE
	.4byte BG_VRAM + 0xF3AE
	.4byte BG_VRAM + 0xF148
	.4byte BG_VRAM + 0xF308
	.4byte BG_VRAM + 0xF0AE
	.4byte BG_VRAM + 0xF1AE
	.4byte BG_VRAM + 0xF2AE
	.4byte BG_VRAM + 0xF3AE
	.4byte BG_VRAM + 0xF148
	.4byte BG_VRAM + 0xF308
	.4byte BG_VRAM + 0xF0EE
	.4byte BG_VRAM + 0xF1AE
	.4byte BG_VRAM + 0xF2AE
	.4byte BG_VRAM + 0xF36E
	.4byte BG_VRAM + 0xF148
	.4byte BG_VRAM + 0xF0EE
	.4byte BG_VRAM + 0xF1AE
	.4byte BG_VRAM + 0xF308
	.4byte BG_VRAM + 0xF2AE
	.4byte BG_VRAM + 0xF36E

	.align 2
gUnknown_083768B8:: @ 83768B8
	.byte   8,  44, 0, 0
	.byte  92,  22, 0, 0
	.byte  92,  46, 0, 0
	.byte  92,  70, 0, 0
	.byte  92,  94, 0, 0
	.byte  92, 118, 0, 0
	.byte 196, 136, 0, 0
	.byte 196, 152, 0, 0
	.byte   8,  28, 0, 0
	.byte   8,  84, 0, 0
	.byte  92,  22, 0, 0
	.byte  92,  54, 0, 0
	.byte  92,  86, 0, 0
	.byte  92, 118, 0, 0
	.byte 196, 136, 0, 0
	.byte 196, 152, 0, 0
	.byte   8,  28, 0, 0
	.byte   8,  84, 0, 0
	.byte  92,  30, 0, 0
	.byte  92,  54, 0, 0
	.byte  92,  86, 0, 0
	.byte  92, 110, 0, 0
	.byte 196, 136, 0, 0
	.byte 196, 152, 0, 0

	.align 2
gUnknown_08376918:: @ 8376918
	.4byte BG_VRAM + 0xF1C6
	.4byte BG_VRAM + 0xF06C
	.4byte BG_VRAM + 0xF12C
	.4byte BG_VRAM + 0xF1EC
	.4byte BG_VRAM + 0xF2AC
	.4byte BG_VRAM + 0xF36C
	.4byte BG_VRAM + 0xF148
	.4byte BG_VRAM + 0xF308
	.4byte BG_VRAM + 0xF0AE
	.4byte BG_VRAM + 0xF1AE
	.4byte BG_VRAM + 0xF2AE
	.4byte BG_VRAM + 0xF3AE

	.align 2
gUnknown_08376948:: @ 8376948
	.byte  2,  4, 10,  9
	.byte 16,  1, 29,  3
	.byte 16,  4, 29,  6
	.byte 16,  7, 29,  9
	.byte 16, 10, 29, 12
	.byte 16, 13, 29, 15
	.byte  2,  2, 10,  7
	.byte  2,  9, 10, 14
	.byte 16,  1, 29,  3
	.byte 16,  5, 29,  7
	.byte 16,  9, 29, 11
	.byte 16, 13, 29, 15

	.align 2
gUnknown_08376978:: @ 8376978
	.byte  2,  7, 10,  9
	.byte 21,  1, 29,  3
	.byte 21,  4, 29,  6
	.byte 21,  7, 29,  9
	.byte 21, 10, 29, 12
	.byte 21, 13, 29, 15
	.byte  2,  2, 10,  7
	.byte  2,  9, 10, 14
	.byte 16,  1, 29,  3
	.byte 16,  5, 29,  7
	.byte 16,  9, 29, 11
	.byte 16, 13, 29, 15

	.align 2
gUnknown_083769A8:: @ 83769A8
	.byte  0,  3, 11,  1, 11,  4, 11,  7, 11, 10, 11, 13
	.byte  0,  1,  0,  8, 11,  1, 11,  5, 11,  9, 11, 13

	.align 2
gUnknown_083769C0:: @ 83769C0
	.byte  0,  1
	.byte  0,  8
	.byte 11,  2
	.byte 11,  5
	.byte 11,  9
	.byte 11, 12
	.byte  0,  1
	.byte  0,  8
	.byte 11,  2
	.byte 11,  5
	.byte 11,  9
	.byte 11, 12

gUnknown_083769D8:: @ 83769D8
	.byte 0x24,0x25,0x25,0x25,0x25,0x25,0x25,0x25,0x25,0x25,0x27
	.byte 0x34,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x37
	.byte 0x34,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x37
	.byte 0x34,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x37
	.byte 0x44,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x47
	.byte 0x44,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x47
	.byte 0x54,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x57

gUnknown_08376A25:: @ 8376A25
	.byte 0x50,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x53
	.byte 0x60,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x63
	.byte 0x70,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x73

gUnknown_08376A5E:: @ 8376A5E
	.byte 0x20,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x23
	.byte 0x30,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x33
	.byte 0x40,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x43

@ unknown, unreferenced data
	.byte 0x0C
	.byte 0x0D
	.byte 0x0E
	.byte 0x0F
	.byte 0x00
	.byte 0x01
	.byte 0x02
	.byte 0x03
	.byte 0x04
	.byte 0x05
	.byte 0x0F
	.byte 0x10
	.byte 0x11
	.byte 0x12
	.byte 0x13
	.byte 0x14
	.byte 0x15
	.byte 0x0F
	.byte 0x06
	.byte 0x05
	.byte 0x01
	.byte 0x07
	.byte 0x08
	.byte 0x09
	.byte 0x0F
	.byte 0x16
	.byte 0x15
	.byte 0x11
	.byte 0x17
	.byte 0x18
	.byte 0x19
	.byte 0x0F
	.byte 0x09
	.byte 0x0A
	.byte 0x0B
	.byte 0x05
	.byte 0x0C
	.byte 0x0F
	.byte 0x0F
	.byte 0x19
	.byte 0x1A
	.byte 0x1B
	.byte 0x15
	.byte 0x1C
	.byte 0x0F
	.byte 0x0F
	.byte 0x0D
	.byte 0x0B
	.byte 0x05
	.byte 0x0C
	.byte 0x0F
	.byte 0x0F
	.byte 0x0F
	.byte 0x1D
	.byte 0x1B
	.byte 0x15
	.byte 0x1C
	.byte 0x0F
	.byte 0x0F
	.byte 0x0F
	.byte 0x06
	.byte 0x05
	.byte 0x0B
	.byte 0x05
	.byte 0x0C
	.byte 0x0F
	.byte 0x0F
	.byte 0x16
	.byte 0x15
	.byte 0x1B
	.byte 0x15
	.byte 0x1C
	.byte 0x0F
	.byte 0x0F
	.byte 0x0F
	.byte 0x0F
	.byte 0x20
	.byte 0x0C
	.byte 0x09
	.byte 0x0F
	.byte 0x0F
	.byte 0x0F
	.byte 0x1F
	.byte 0x30
	.byte 0x1C
	.byte 0x19
	.byte 0x0F
	.byte 0x0F
	.byte 0x0F
	.byte 0x25
	.byte 0x0F
	.byte 0x22
	.byte 0x24
	.byte 0x0F
	.byte 0x0F
	.byte 0x0F
	.byte 0x35
	.byte 0x41
	.byte 0x32
	.byte 0x34
	.byte 0x0F
	.byte 0x0F
	.byte 0x0F
	.byte 0x26
	.byte 0x0F
	.byte 0x23
	.byte 0x0E
	.byte 0x0F
	.byte 0x0F
	.byte 0x0F
	.byte 0x36
	.byte 0x43
	.byte 0x33
	.byte 0x1E
	.byte 0x0F
	.byte 0x0F
	.byte 0x27
	.byte 0x28
	.byte 0x29
	.byte 0x03
	.byte 0x2A
	.byte 0x0F
	.byte 0x0F
	.byte 0x37
	.byte 0x38
	.byte 0x39
	.byte 0x13
	.byte 0x3A
	.byte 0x0F
	.byte 0x0F
	.byte 0x27
	.byte 0x28
	.byte 0x29
	.byte 0x03
	.byte 0x04
	.byte 0x05
	.byte 0x0F
	.byte 0x37
	.byte 0x38
	.byte 0x39
	.byte 0x13
	.byte 0x14
	.byte 0x15
	.byte 0x0F
	.byte 0x2B
	.byte 0x2C
	.byte 0x02
	.byte 0x28
	.byte 0x29
	.byte 0x2D
	.byte 0x21
	.byte 0x3B
	.byte 0x3C
	.byte 0x12
	.byte 0x38
	.byte 0x39
	.byte 0x3D
	.byte 0x31
	.byte 0x2B
	.byte 0x2C
	.byte 0x02
	.byte 0x28
	.byte 0x29
	.byte 0x08
	.byte 0x09
	.byte 0x3B
	.byte 0x3C
	.byte 0x12
	.byte 0x38
	.byte 0x39
	.byte 0x18
	.byte 0x19
	.byte 0x2E
	.byte 0x2F
	.byte 0x2B
	.byte 0x2C
	.byte 0x02
	.byte 0x27
	.byte 0x2D
	.byte 0x3E
	.byte 0x3F
	.byte 0x3B
	.byte 0x3C
	.byte 0x12
	.byte 0x45
	.byte 0x3D

	.align 2
gUnknown_08376B54:: @ 8376B54
	.4byte ItemUseMoveMenu_HandleMoveSelection
	.4byte ItemUseMoveMenu_HandleCancel

	.align 1
Unknown_08376B5C:
	.2byte 0x4000, 0x4018, 0xF400
	.2byte 0x4000, 0x4038, 0xF404
	.2byte 0x4008, 0x4018, 0xF408
	.2byte 0x4008, 0x4038, 0xF40C
	.2byte 0x4010, 0x4020, 0xF410
	.2byte 0x4020, 0x4025, 0xF418
	.2byte 0x4020, 0x4045, 0xF41C
	.2byte -1

	.align 1
Unknown_08376B88:
	.2byte 0x4000, 0x4018, 0xF400
	.2byte 0x4000, 0x4038, 0xF404
	.2byte 0x4008, 0x4018, 0xF408
	.2byte 0x4008, 0x4038, 0xF40C
	.2byte 0x4010, 0x4020, 0xF410
	.2byte 0x4010, 0x4065, 0xF418
	.2byte 0x4010, 0x4085, 0xF41C
	.2byte -1

	.align 2
gUnknown_08376BB4:: @ 8376BB4
	.byte 0x1, 0x4
	.space 2
	.4byte Unknown_08376B5C

	.byte 0xC, 0x1
	.space 2
	.4byte Unknown_08376B88

	.byte 0xC, 0x4
	.space 2
	.4byte Unknown_08376B88

	.byte 0xC, 0x7
	.space 2
	.4byte Unknown_08376B88

	.byte 0xC, 0xA
	.space 2
	.4byte Unknown_08376B88

	.byte 0xC, 0xD
	.space 2
	.4byte Unknown_08376B88

	.byte 0x1, 0x2
	.space 2
	.4byte Unknown_08376B5C

	.byte 0x1, 0x9
	.space 2
	.4byte Unknown_08376B5C

	.byte 0xC, 0x1
	.space 2
	.4byte Unknown_08376B88

	.byte 0xC, 0x5
	.space 2
	.4byte Unknown_08376B88

	.byte 0xC, 0x9
	.space 2
	.4byte Unknown_08376B88

	.byte 0xC, 0xD
	.space 2
	.4byte Unknown_08376B88

	.byte 0x1, 0x2
	.space 2
	.4byte Unknown_08376B5C

	.byte 0x1, 0x9
	.space 2
	.4byte Unknown_08376B5C

	.byte 0xC, 0x2
	.space 2
	.4byte Unknown_08376B88

	.byte 0xC, 0x5
	.space 2
	.4byte Unknown_08376B88

	.byte 0xC, 0x9
	.space 2
	.4byte Unknown_08376B88

	.byte 0xC, 0xC
	.space 2
	.4byte Unknown_08376B88

	.byte 0x1, 0x2
	.space 2
	.4byte Unknown_08376B5C

	.byte 0xC, 0x2
	.space 2
	.4byte Unknown_08376B88

	.byte 0xC, 0x5
	.space 2
	.4byte Unknown_08376B88

	.byte 0x1, 0x9
	.space 2
	.4byte Unknown_08376B5C

	.byte 0xC, 0x9
	.space 2
	.4byte Unknown_08376B88

	.byte 0xC, 0xC
	.space 2
	.4byte Unknown_08376B88

	.align 2
gUnknown_08376C74:: @ 8376C74
	.4byte sub_8089CD4, sub_806AFD0, 0
	.4byte SetUpBattlePokemonMenu, SetUpBattlePartyMenu, 0
	.4byte sub_80F9C6C, sub_80F9ACC, 0
	.4byte sub_80F9C6C, sub_806AFD0, 0
	.4byte sub_81222B0, sub_8121E78, 0
	.4byte sub_8122A48, sub_8122854, 0xFF
	.4byte sub_8122E0C, sub_806AFD0, 0x0F
	.4byte sub_80F9E64, sub_80F9CE8, 0

	.align 2
gUnknown_08376CD4:: @ 8376CD4
	.2byte 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F
	.2byte 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F

	.align 2
gUnknown_08376CEC:: @ 8376CEC
	.2byte 0x2A, 0x0B, 0x0C, 0x0D, 0x0E, 0x2F
	.2byte 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F

	.align 2
gUnknown_08376D04:: @ 8376D04
	.4byte gOtherText_HP
	.4byte gOtherText_Attack
	.4byte gOtherText_Defense
	.4byte gOtherText_SpAtk
	.4byte gOtherText_SpDef
	.4byte gOtherText_Speed

gUnknown_08376D1C:: @ 8376D1C
	.byte 0x3A @ HP
	.byte 0x3B @ Attack
	.byte 0x3C @ Defense
	.byte 0x3E @ Sp. Attack
	.byte 0x3F @ Sp. Defense
	.byte 0x3D @ Speed
