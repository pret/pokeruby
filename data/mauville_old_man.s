	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 1
gUnknown_083E537C:: @ 83E537C
	ec_word SISTER
	ec_word EATS
	ec_word SWEETS
	ec_word VORACIOUS
	ec_word AND
	ec_word DROOLING

	.align 2
gUnknown_083E5388:: @ 83E5388
	.4byte OtherText_SoPretty
	.4byte OtherText_SoDarling
	.4byte OtherText_SoRelaxed
	.4byte OtherText_SoSunny
	.4byte OtherText_SoDesirable
	.4byte OtherText_SoExciting
	.4byte OtherText_SoAmusing
	.4byte OtherText_SoMagical

	.align 2
gUnknown_083E53A8:: @ 83E53A8
	.4byte OtherText_WantVacationNicePlace
	.4byte OtherText_BoughtCrayonsIsNice
	.4byte OtherText_IfWeCouldFloat
	.4byte OtherText_SandWashesAwayMakeSad
	.4byte OtherText_WhatsBottomSeaLike
	.4byte OtherText_SeeSettingSun
	.4byte OtherText_LyingInGreenGrass
	.4byte OtherText_SecretBasesWonderful

	.align 1
gUnknown_083E53C8:: @ 83E53C8
	.2byte  0x0, 0
	.2byte  0xC, 0
	.2byte  0xD, 0
	.2byte 0x12, 0
	.2byte 0x13, 0
	.2byte 0x15, 0

	.align 2
gUnknown_083E53E0:: @ 83E53E0
	.4byte 0x132, UnknownString_81AEFFC, UnknownString_81AF013, UnknownString_81AF022
	.4byte 0x102, UnknownString_81AF0A3, UnknownString_81AF0BB, UnknownString_81AF0CA
	.4byte 0x103, UnknownString_81AF149, UnknownString_81AF164, UnknownString_81AF174
	.4byte 0x104, UnknownString_81AF1E5, UnknownString_81AF1FD, UnknownString_81AF20A
	.4byte 0x106, UnknownString_81AF281, UnknownString_81AF299, UnknownString_81AF2A9
	.4byte 0x109, UnknownString_81AF32C, UnknownString_81AF345, UnknownString_81AF34D
	.4byte 0x10b, UnknownString_81AF3D0, UnknownString_81AF3ED, UnknownString_81AF3FC
	.4byte 0x10c, UnknownString_81AF46D, UnknownString_81AF481, UnknownString_81AF49B
	.4byte 0x10d, UnknownString_81AF511, UnknownString_81AF529, UnknownString_81AF536
	.4byte 0x10e, UnknownString_81AF5A9, UnknownString_81AF5BD, UnknownString_81AF5CD
	.4byte 0x10f, UnknownString_81AF63F, UnknownString_81AF661, UnknownString_81AF676
	.4byte 0x110, UnknownString_81AF711, UnknownString_81AF726, UnknownString_81AF73D
	.4byte 0x111, UnknownString_81AF7BF, UnknownString_81AF7D9, UnknownString_81AF7F1
	.4byte 0x112, UnknownString_81AF88A, UnknownString_81AF8A1, UnknownString_81AF8AA
	.4byte 0x113, UnknownString_81AF91B, UnknownString_81AF935, UnknownString_81AF943
	.4byte 0x114, UnknownString_81AF9C8, UnknownString_81AF9E0, UnknownString_81AF9F6
	.4byte 0x11a, UnknownString_81AFA79, UnknownString_81AFA92, UnknownString_81AFA9E
	.4byte 0x11b, UnknownString_81AFB17, UnknownString_81AFB2D, UnknownString_81AFB48
	.4byte 0x11c, UnknownString_81AFBD8, UnknownString_81AFBE7, UnknownString_81AFC04
	.4byte 0x21d, UnknownString_81AFC8A, UnknownString_81AFC9D, UnknownString_81AFCBE
	.4byte 0x11e, UnknownString_81AFD44, UnknownString_81AFD60, UnknownString_81AFD80
	.4byte 0x121, UnknownString_81AFE1D, UnknownString_81AFE36, UnknownString_81AFE42
	.4byte 0x124, UnknownString_81AFEC2, UnknownString_81AFEDD, UnknownString_81AFEEE
	.4byte 0x125, UnknownString_81AFF68, UnknownString_81AFF7B, UnknownString_81AFF88
	.4byte 0x126, UnknownString_81AFFFB, UnknownString_81B000D, UnknownString_81B0015
	.4byte 0x127, UnknownString_81B009D, UnknownString_81B00B6, UnknownString_81B00C9
	.4byte 0x128, UnknownString_81B014D, UnknownString_81B0165, UnknownString_81B0173
	.4byte 0x129, UnknownString_81B01E9, UnknownString_81B0201, UnknownString_81B0213
	.4byte 0x12a, UnknownString_81B0290, UnknownString_81B02A5, UnknownString_81B02B6
	.4byte 0x12b, UnknownString_81B0337, UnknownString_81B0351, UnknownString_81B0364
	.4byte 0x12c, UnknownString_81B03E9, UnknownString_81B0401, UnknownString_81B040C
	.4byte 0x12d, UnknownString_81B046E, UnknownString_81B0489, UnknownString_81B049A
	.4byte 0x12e, UnknownString_81B0523, UnknownString_81B053E, UnknownString_81B0554
	.4byte 0x12f, UnknownString_81B05D8, UnknownString_81B05F3, UnknownString_81B0610
	.4byte 0x130, UnknownString_81B06A9, UnknownString_81B06C6, UnknownString_81B06D9

gUnknown_083E5610:: @ 83E5610
	.4byte 0x131, UnknownString_81B0763, UnknownString_81B0781, UnknownString_81B0797

	.align 2
gUnknown_083E5620:: @ 83E5620
	.4byte 0x24
	.4byte gSaveBlock1 + 0x2D94
	.4byte 0xC
