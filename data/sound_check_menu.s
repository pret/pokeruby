	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2 @ object file boundary?

gDebugText_SoundCheckJap:: @ 83D02C8
	.string "サウンドチェック$" @ Sound Check

gDebugText_BGM:: @ 83D02D1
	.string "BGM$"

gDebugText_SE:: @ 83D02D5
	.string "SE $"

gDebugText_ABDesc:: @ 83D02D9
	.string "A‥さいせい　B‥おわり$"

gDebugText_UpDown:: @ 83D02E6
	.string "L‥UP R‥DOWN$"

gDebugText_DriverTest:: @ 83D02F2
	.string "R‥DRIVER-TEST$"

gUnknown_083D0300:: @ 83D0300
	.byte  1,  1
	.byte  1,  3
	.byte  1,  5
	.byte  1,  7
	.byte  1,  9
	.byte  1, 11
	.byte  1, 13
	.byte  1, 15
	.byte  1, 17

gDebugText_BBack:: @ 83D0312
	.string "Bぼたんで　もどる$" @ back

gDebugText_APlay:: @ 83D031C
	.string "Aぼたんで　さいせい$" @ play

gDebugText_Voice:: @ 83D0327
	.string "VOICE‥‥‥‥$"

gDebugText_Volume:: @ 83D0331
	.string "VOLUME‥‥‥$"

gDebugText_Panpot:: @ 83D033B
	.string "PANPOT‥‥‥$"

gDebugText_Pitch:: @ 83D0345
	.string "PITCH‥‥‥‥$"

gDebugText_Length:: @ 83D034F
	.string "LENGTH‥‥‥$"

gDebugText_Release:: @ 83D0359
	.string "RELEASE‥‥$"

gDebugText_Progress:: @ 83D0363
	.string "PROGRESS‥$"

gDebugText_Chorus:: @ 83D036D
	.string "CHORUS‥‥‥$"

gDebugText_Priority:: @ 83D0377
	.string "PRIORITY‥$"

gDebugText_Playing:: @ 83D0381
	.string "さいせいちゆう‥$" @ 再生中 (playing)

gDebugText_Reverse:: @ 83D038A
	.string "はんてん‥‥‥‥$" @ 反転 (reverse)

gDebugText_Stereo:: @ 83D0393
	.string "すてれお‥‥‥‥$" @ stereo

	.align 2
gUnknown_083D039C:: @ 83D039C
	.4byte    0,   387
	.4byte    0,   127
	.4byte -127,   127
	.4byte -128, 32639
	.4byte    0, 65535
	.4byte    0,   255
	.4byte    0, 65535
	.4byte  -64,    63

gUnknown_083D03DC:: @ 83D03DC
	.string "▶$"

gUnknown_083D03DE:: @ 83D03DE
	.string " $"

	.align 2
gUnknown_083D03E0:: @ 83D03E0
	.4byte      1
	.4byte     10
	.4byte    100
	.4byte   1000
	.4byte  10000
	.4byte 100000

gUnknown_083D03F8:: @ 83D03F8
	.byte 0x3F, 0x00, 0xC0, 0x7F, 0x80 @ stereo panning

gOtherText_SE:: @ 83D03FD
	.string "SE$"

gOtherText_Pan:: @ 83D0400
	.string "PAN$"

gOtherText_LR:: @ 83D0404
	.string "  LR$"

gOtherText_RL:: @ 83D0409
	.string "  RL$"

@ 83D040E
	.include "data/text/song_names.inc"
