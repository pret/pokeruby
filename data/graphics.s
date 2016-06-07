@ This is where most of the graphics is stored.

	.section gfx_data, "aw", %progbits

	.global gUnknown_08D00000
gUnknown_08D00000: @ 8D00000
	.incbin "graphics/interface/menu.lz" @ menu window and arrows

	.global gUnknown_08D004E0
gUnknown_08D004E0: @ 8D004E0
	.incbin "graphics/interface/menupal.lz"

	.global gUnknown_08D00524
gUnknown_08D00524: @ 8D00524
	.incbin "baserom.gba", 0x00d00524, 0x1000

@ 8D01524
	.include "data/graphics/pokemon/circled_question_mark_graphics.s"

@ 8D019E4
	.incbin "baserom.gba", 0xd019e4, 0x16EC @ japanese table

	.global gUnknown_08D030D0
gUnknown_08D030D0: @ 8D030D0
	.incbin "baserom.gba", 0x00d030d0, 0x6b78

	.global gUnknown_08D09C48
gUnknown_08D09C48: @ 8D09C48
	.incbin "baserom.gba", 0x00d09c48, 0x8524

	.global gUnknown_08D1216C
gUnknown_08D1216C: @ 8D1216C
	.incbin "baserom.gba", 0x00d1216c, 0x4fd8

	.global gUnknown_08D17144
gUnknown_08D17144: @ 8D17144
	.incbin "baserom.gba", 0x00d17144, 0x118

	.global gUnknown_08D1725C
gUnknown_08D1725C: @ 8D1725C
	.incbin "baserom.gba", 0x00d1725c, 0x1c8

	.global gUnknown_08D17424
gUnknown_08D17424: @ 8D17424
	.incbin "baserom.gba", 0x00d17424, 0x818

	.global gUnknown_08D17C3C
gUnknown_08D17C3C: @ 8D17C3C
	.incbin "baserom.gba", 0x00d17c3c, 0x130

	.global gUnknown_08D17D6C
gUnknown_08D17D6C: @ 8D17D6C
	.incbin "baserom.gba", 0x00d17d6c, 0xaac

	.global gUnknown_08D18818
gUnknown_08D18818: @ 8D18818
	.incbin "baserom.gba", 0x00d18818, 0xf64

	.global gUnknown_08D1977C
gUnknown_08D1977C: @ 8D1977C
	.incbin "baserom.gba", 0x00d1977c, 0xad4

	.global gUnknown_08D1A250
gUnknown_08D1A250: @ 8D1A250
	.incbin "baserom.gba", 0x00d1a250, 0x114

	.global gUnknown_08D1A364
gUnknown_08D1A364: @ 8D1A364
	.incbin "baserom.gba", 0x00d1a364, 0x12c

	.global gUnknown_08D1A490
gUnknown_08D1A490: @ 8D1A490
	.incbin "baserom.gba", 0x00d1a490, 0x188

	.global gUnknown_08D1A618
gUnknown_08D1A618: @ 8D1A618
	.incbin "baserom.gba", 0x00d1a618, 0x2404

	.global gUnknown_08D1CA1C
gUnknown_08D1CA1C: @ 8D1CA1C
	.incbin "baserom.gba", 0x00d1ca1c, 0x9f4

	.global gUnknown_08D1D410
gUnknown_08D1D410: @ 8D1D410
	.incbin "baserom.gba", 0x00d1d410, 0x13c

	.global gUnknown_08D1D54C
gUnknown_08D1D54C: @ 8D1D54C
	.incbin "baserom.gba", 0x00d1d54c, 0x28

	.global gUnknown_08D1D574
gUnknown_08D1D574: @ 8D1D574
	.incbin "baserom.gba", 0x00d1d574, 0x34a0

	.global gUnknown_08D20A14
gUnknown_08D20A14: @ 8D20A14
	.incbin "baserom.gba", 0x00d20a14, 0x1c

	.global gUnknown_08D20A30
gUnknown_08D20A30: @ 8D20A30
	.incbin "baserom.gba", 0x00d20a30, 0x1f8c

	.global gUnknown_08D229BC
gUnknown_08D229BC: @ 8D229BC
	.incbin "baserom.gba", 0x00d229bc, 0xcd0

	.global gUnknown_08D2368C
gUnknown_08D2368C: @ 8D2368C
	.incbin "baserom.gba", 0x00d2368c, 0xa70

	.global gUnknown_08D240FC
gUnknown_08D240FC: @ 8D240FC
	.incbin "baserom.gba", 0x00d240fc, 0x28

	.global gUnknown_08D24124
gUnknown_08D24124: @ 8D24124
	.incbin "baserom.gba", 0x00d24124, 0xc58

	.global gUnknown_08D24D7C
gUnknown_08D24D7C: @ 8D24D7C
	.incbin "baserom.gba", 0x00d24d7c, 0x28

	.global gUnknown_08D24DA4
gUnknown_08D24DA4: @ 8D24DA4
	.incbin "baserom.gba", 0x00d24da4, 0x5c3c

	.global gUnknown_08D2A9E0
gUnknown_08D2A9E0: @ 8D2A9E0
	.incbin "baserom.gba", 0x00d2a9e0, 0xa0

	.global gUnknown_08D2AA80
gUnknown_08D2AA80: @ 8D2AA80
	.incbin "baserom.gba", 0x00d2aa80, 0x18

	.global gUnknown_08D2AA98
gUnknown_08D2AA98: @ 8D2AA98
	.incbin "baserom.gba", 0x00d2aa98, 0x27d0

	.global gUnknown_08D2D268
gUnknown_08D2D268: @ 8D2D268
	.incbin "baserom.gba", 0x00d2d268, 0x24

	.global gUnknown_08D2D28C
gUnknown_08D2D28C: @ 8D2D28C
	.incbin "baserom.gba", 0x00d2d28c, 0x240

	.global gUnknown_08D2D4CC
gUnknown_08D2D4CC: @ 8D2D4CC
	.incbin "baserom.gba", 0x00d2d4cc, 0x600

	.global gUnknown_08D2DACC
gUnknown_08D2DACC: @ 8D2DACC
	.incbin "baserom.gba", 0x00d2dacc, 0x210

	.global gUnknown_08D2DCDC
gUnknown_08D2DCDC: @ 8D2DCDC
	.incbin "baserom.gba", 0x00d2dcdc, 0x11c

	.global gUnknown_08D2DDF8
gUnknown_08D2DDF8: @ 8D2DDF8
	.incbin "baserom.gba", 0x00d2ddf8, 0x11c

	.global gUnknown_08D2DF14
gUnknown_08D2DF14: @ 8D2DF14
	.incbin "baserom.gba", 0x00d2df14, 0x20

	.global gUnknown_08D2DF34
gUnknown_08D2DF34: @ 8D2DF34
	.incbin "baserom.gba", 0x00d2df34, 0x20

	.global gUnknown_08D2DF54
gUnknown_08D2DF54: @ 8D2DF54
	.incbin "baserom.gba", 0x00d2df54, 0x20

	.global gUnknown_08D2DF74
gUnknown_08D2DF74: @ 8D2DF74
	.incbin "baserom.gba", 0x00d2df74, 0x20

	.global gUnknown_08D2DF94
gUnknown_08D2DF94: @ 8D2DF94
	.incbin "baserom.gba", 0x00d2df94, 0x20

	.global gUnknown_08D2DFB4
gUnknown_08D2DFB4: @ 8D2DFB4
	.incbin "baserom.gba", 0x00d2dfb4, 0x20

	.global gUnknown_08D2DFD4
gUnknown_08D2DFD4: @ 8D2DFD4
	.incbin "baserom.gba", 0x00d2dfd4, 0x20

	.global gUnknown_08D2DFF4
gUnknown_08D2DFF4: @ 8D2DFF4
	.incbin "baserom.gba", 0x00d2dff4, 0x20

	.global gUnknown_08D2E014
gUnknown_08D2E014: @ 8D2E014
	.incbin "baserom.gba", 0x00d2e014, 0x13c

	.global gUnknown_08D2E150
gUnknown_08D2E150: @ 8D2E150
	.incbin "baserom.gba", 0x00d2e150, 0x20

	.global gUnknown_08D2E170
gUnknown_08D2E170: @ 8D2E170
	.incbin "baserom.gba", 0x00d2e170, 0xc8c

	.global gUnknown_08D2EDFC
gUnknown_08D2EDFC: @ 8D2EDFC
	.incbin "baserom.gba", 0x00d2edfc, 0x4c

	.global gUnknown_08D2EE48
gUnknown_08D2EE48: @ 8D2EE48
	.incbin "baserom.gba", 0x00d2ee48, 0xF44

@ 8D2FD8C
	.include "data/graphics/pokemon/graphics.s"

@ 8E48D38
	.include "data/graphics/trainers/graphics.s"

	.align 2
	.global gMonIcon_QuestionMark
gMonIcon_QuestionMark: @ 8E5D5F0
	.incbin "graphics/pokemon/question_mark/icon.4bpp"

	.align 2
	.global gMonFootprint_QuestionMark
gMonFootprint_QuestionMark: @ 8E5D9F0
	.incbin "graphics/pokemon/question_mark/footprint.1bpp"

	.global gUnknown_08E5DA10
gUnknown_08E5DA10: @ 8E5DA10
	.incbin "baserom.gba", 0x00e5da10, 0xe8

	.global gUnknown_08E5DAF8
gUnknown_08E5DAF8: @ 8E5DAF8
	.incbin "baserom.gba", 0x00e5daf8, 0x10c

	.global gUnknown_08E5DC04
gUnknown_08E5DC04: @ 8E5DC04
	.incbin "baserom.gba", 0x00e5dc04, 0x28

	.global gUnknown_08E5DC2C
gUnknown_08E5DC2C: @ 8E5DC2C
	.incbin "baserom.gba", 0x00e5dc2c, 0x25b0

	.global gUnknown_08E601DC
gUnknown_08E601DC: @ 8E601DC
	.incbin "baserom.gba", 0x00e601dc, 0x618

	.global gUnknown_08E607F4
gUnknown_08E607F4: @ 8E607F4
	.incbin "baserom.gba", 0x00e607f4, 0x13f4

	.global gUnknown_08E61BE8
gUnknown_08E61BE8: @ 8E61BE8
	.incbin "baserom.gba", 0x00e61be8, 0x640

	.global gUnknown_08E62228
gUnknown_08E62228: @ 8E62228
	.incbin "baserom.gba", 0x00e62228, 0x2ec

	.global gUnknown_08E62514
gUnknown_08E62514: @ 8E62514
	.incbin "baserom.gba", 0x00e62514, 0x5ac

	.global gUnknown_08E62AC0
gUnknown_08E62AC0: @ 8E62AC0
	.incbin "baserom.gba", 0x00e62ac0, 0x3c

	.global gUnknown_08E62AFC
gUnknown_08E62AFC: @ 8E62AFC
	.incbin "baserom.gba", 0x00e62afc, 0x2b0

	.global gUnknown_08E62DAC
gUnknown_08E62DAC: @ 8E62DAC
	.incbin "baserom.gba", 0x00e62dac, 0x608

	.global gUnknown_08E633B4
gUnknown_08E633B4: @ 8E633B4
	.incbin "baserom.gba", 0x00e633b4, 0x2f0

	.global gUnknown_08E636A4
gUnknown_08E636A4: @ 8E636A4
	.incbin "baserom.gba", 0x00e636a4, 0x3c

	.global gUnknown_08E636E0
gUnknown_08E636E0: @ 8E636E0
	.incbin "baserom.gba", 0x00e636e0, 0x58

	.global gUnknown_08E63738
gUnknown_08E63738: @ 8E63738
	.incbin "baserom.gba", 0x00e63738, 0x3c

	.global gUnknown_08E63774
gUnknown_08E63774: @ 8E63774
	.incbin "baserom.gba", 0x00e63774, 0x3c

	.global gUnknown_08E637B0
gUnknown_08E637B0: @ 8E637B0
	.incbin "baserom.gba", 0x00e637b0, 0x60

	.global gUnknown_08E63810
gUnknown_08E63810: @ 8E63810
	.incbin "baserom.gba", 0x00e63810, 0x6c

	.global gUnknown_08E6387C
gUnknown_08E6387C: @ 8E6387C
	.incbin "baserom.gba", 0x00e6387c, 0x50

	.global gUnknown_08E638CC
gUnknown_08E638CC: @ 8E638CC
	.incbin "baserom.gba", 0x00e638cc, 0x48

	.global gUnknown_08E63914
gUnknown_08E63914: @ 8E63914
	.incbin "baserom.gba", 0x00e63914, 0x44

	.global gUnknown_08E63958
gUnknown_08E63958: @ 8E63958
	.incbin "baserom.gba", 0x00e63958, 0x50

	.global gUnknown_08E639A8
gUnknown_08E639A8: @ 8E639A8
	.incbin "baserom.gba", 0x00e639a8, 0x17b4

	.global gUnknown_08E6515C
gUnknown_08E6515C: @ 8E6515C
	.incbin "baserom.gba", 0x00e6515c, 0x4cc

	.global gUnknown_08E65628
gUnknown_08E65628: @ 8E65628
	.incbin "baserom.gba", 0x00e65628, 0x174c

	.global gUnknown_08E66D74
gUnknown_08E66D74: @ 8E66D74
	.incbin "baserom.gba", 0x00e66d74, 0x81c

	.global gUnknown_08E67590
gUnknown_08E67590: @ 8E67590
	.incbin "baserom.gba", 0x00e67590, 0x2a8

	.global gUnknown_08E67838
gUnknown_08E67838: @ 8E67838
	.incbin "baserom.gba", 0x00e67838, 0x410

	.global gUnknown_08E67C48
gUnknown_08E67C48: @ 8E67C48
	.incbin "baserom.gba", 0x00e67c48, 0x290

	.global gUnknown_08E67ED8
gUnknown_08E67ED8: @ 8E67ED8
	.incbin "baserom.gba", 0x00e67ed8, 0x17c

	.global gUnknown_08E68054
gUnknown_08E68054: @ 8E68054
	.incbin "baserom.gba", 0x00e68054, 0x52c

	.global gUnknown_08E68580
gUnknown_08E68580: @ 8E68580
	.incbin "baserom.gba", 0x00e68580, 0xef8

	.global gUnknown_08E69478
gUnknown_08E69478: @ 8E69478
	.incbin "baserom.gba", 0x00e69478, 0x100

	.global gUnknown_08E69578
gUnknown_08E69578: @ 8E69578
	.incbin "baserom.gba", 0x00e69578, 0x214

	.global gUnknown_08E6978C
gUnknown_08E6978C: @ 8E6978C
	.incbin "baserom.gba", 0x00e6978c, 0xf78

	.global gUnknown_08E6A704
gUnknown_08E6A704: @ 8E6A704
	.incbin "baserom.gba", 0x00e6a704, 0xD8

	.align 2
	.global gMonIcon_Egg
gMonIcon_Egg: @ 8E6A7DC
	.incbin "graphics/pokemon/egg/icon.4bpp"

@ 8E6ABDC
	.incbin "baserom.gba", 0x00E6ABDC, 0x1524

	.global gUnknown_08E6C100
gUnknown_08E6C100: @ 8E6C100
	.incbin "baserom.gba", 0x00e6c100, 0x820

	.global gUnknown_08E6C920
gUnknown_08E6C920: @ 8E6C920
	.incbin "baserom.gba", 0x00e6c920, 0xa34

	.global gUnknown_08E6D354
gUnknown_08E6D354: @ 8E6D354
	.incbin "baserom.gba", 0x00e6d354, 0xaf4

	.global gUnknown_08E6DE48
gUnknown_08E6DE48: @ 8E6DE48
	.incbin "baserom.gba", 0x00e6de48, 0x2b8

	.global gUnknown_08E6E100
gUnknown_08E6E100: @ 8E6E100
	.incbin "baserom.gba", 0x00e6e100, 0x1e4

	.global gUnknown_08E6E2E4
gUnknown_08E6E2E4: @ 8E6E2E4
	.incbin "baserom.gba", 0x00e6e2e4, 0x1e4

	.global gUnknown_08E6E4C8
gUnknown_08E6E4C8: @ 8E6E4C8
	.incbin "baserom.gba", 0x00e6e4c8, 0x1158

	.global gUnknown_08E6F620
gUnknown_08E6F620: @ 8E6F620
	.incbin "baserom.gba", 0x00e6f620, 0x1320

	.global gUnknown_08E70940
gUnknown_08E70940: @ 8E70940
	.incbin "baserom.gba", 0x00e70940, 0x28

	.global gUnknown_08E70968
gUnknown_08E70968: @ 8E70968
	.incbin "baserom.gba", 0x00e70968, 0x2d0

	.global gUnknown_08E70C38
gUnknown_08E70C38: @ 8E70C38
	.incbin "baserom.gba", 0x00e70c38, 0x2d4

	.global gUnknown_08E70F0C
gUnknown_08E70F0C: @ 8E70F0C
	.incbin "baserom.gba", 0x00e70f0c, 0x448

	.global gUnknown_08E71354
gUnknown_08E71354: @ 8E71354
	.incbin "baserom.gba", 0x00e71354, 0x34c

	.global gUnknown_08E716A0
gUnknown_08E716A0: @ 8E716A0
	.incbin "baserom.gba", 0x00e716a0, 0xe8

	.global gUnknown_08E71788
gUnknown_08E71788: @ 8E71788
	.incbin "baserom.gba", 0x00e71788, 0x10c

	.global gUnknown_08E71894
gUnknown_08E71894: @ 8E71894
	.incbin "baserom.gba", 0x00e71894, 0xa0

	.global gUnknown_08E71934
gUnknown_08E71934: @ 8E71934
	.incbin "baserom.gba", 0x00e71934, 0xdb0

	.global gUnknown_08E726E4
gUnknown_08E726E4: @ 8E726E4
	.incbin "baserom.gba", 0x00e726e4, 0x17c

	.global gUnknown_08E72860
gUnknown_08E72860: @ 8E72860
	.incbin "baserom.gba", 0x00e72860, 0x1f0

	.global gUnknown_08E72A50
gUnknown_08E72A50: @ 8E72A50
	.incbin "baserom.gba", 0x00e72a50, 0x28

	.global gUnknown_08E72A78
gUnknown_08E72A78: @ 8E72A78
	.incbin "baserom.gba", 0x00e72a78, 0x9f0

	.global gUnknown_08E73468
gUnknown_08E73468: @ 8E73468
	.incbin "baserom.gba", 0x00e73468, 0xa0

	.global gUnknown_08E73508
gUnknown_08E73508: @ 8E73508
	.incbin "baserom.gba", 0x00e73508, 0x800

	.global gUnknown_08E73D08
gUnknown_08E73D08: @ 8E73D08
	.incbin "baserom.gba", 0x00e73d08, 0x180

	.global gUnknown_08E73E88
gUnknown_08E73E88: @ 8E73E88
	.incbin "baserom.gba", 0x00e73e88, 0x800

	.global gUnknown_08E74688
gUnknown_08E74688: @ 8E74688
	.incbin "baserom.gba", 0x00e74688, 0x800

	.global gUnknown_08E74E88
gUnknown_08E74E88: @ 8E74E88
	.incbin "baserom.gba", 0x00e74e88, 0x18a0

	.global gUnknown_08E76728
gUnknown_08E76728: @ 8E76728
	.incbin "baserom.gba", 0x00e76728, 0x86c

	.global gUnknown_08E76F94
gUnknown_08E76F94: @ 8E76F94
	.incbin "baserom.gba", 0x00e76f94, 0x38

	.global gUnknown_08E76FCC
gUnknown_08E76FCC: @ 8E76FCC
	.incbin "baserom.gba", 0x00e76fcc, 0x38

	.global gUnknown_08E77004
gUnknown_08E77004: @ 8E77004
	.incbin "baserom.gba", 0x00e77004, 0x800

	.global gUnknown_08E77804
gUnknown_08E77804: @ 8E77804
	.incbin "baserom.gba", 0x00e77804, 0xfc

	.global gUnknown_08E77900
gUnknown_08E77900: @ 8E77900
	.incbin "baserom.gba", 0x00e77900, 0x28

	.global gUnknown_08E77928
gUnknown_08E77928: @ 8E77928
	.incbin "baserom.gba", 0x00e77928, 0x1bc

	.global gUnknown_08E77AE4
gUnknown_08E77AE4: @ 8E77AE4
	.incbin "baserom.gba", 0x00e77ae4, 0x23c

	.global gUnknown_08E77D20
gUnknown_08E77D20: @ 8E77D20
	.incbin "baserom.gba", 0x00e77d20, 0x358

	.global gUnknown_08E78078
gUnknown_08E78078: @ 8E78078
	.incbin "baserom.gba", 0x00e78078, 0x284

	.global gUnknown_08E782FC
gUnknown_08E782FC: @ 8E782FC
	.incbin "baserom.gba", 0x00e782fc, 0x100

	.global gUnknown_08E783FC
gUnknown_08E783FC: @ 8E783FC
	.incbin "baserom.gba", 0x00e783fc, 0x440

	.global gUnknown_08E7883C
gUnknown_08E7883C: @ 8E7883C
	.incbin "baserom.gba", 0x00e7883c, 0xa8

	.global gUnknown_08E788E4
gUnknown_08E788E4: @ 8E788E4
	.incbin "baserom.gba", 0x00e788e4, 0x1a0

	.global gUnknown_08E78A84
gUnknown_08E78A84: @ 8E78A84
	.incbin "baserom.gba", 0x00e78a84, 0x27c

@ 8E78D00
	.include "data/graphics/berries/graphics.s"

@ 8E7E7D0
	.incbin "baserom.gba", 0xE7E7D0, 0x3CC

	.global gUnknown_08E7EB9C
gUnknown_08E7EB9C: @ 8E7EB9C
	.incbin "baserom.gba", 0x00e7eb9c, 0xa0

	.global gUnknown_08E7EC3C
gUnknown_08E7EC3C: @ 8E7EC3C
	.incbin "baserom.gba", 0x00e7ec3c, 0x1d30

	.global gUnknown_08E8096C
gUnknown_08E8096C: @ 8E8096C
	.incbin "baserom.gba", 0x00e8096c, 0x72c

	.global gUnknown_08E81098
gUnknown_08E81098: @ 8E81098
	.incbin "baserom.gba", 0x00e81098, 0x4900

	.global gUnknown_08E85998
gUnknown_08E85998: @ 8E85998
	.incbin "baserom.gba", 0x00e85998, 0x800

	.global gUnknown_08E86198
gUnknown_08E86198: @ 8E86198
	.incbin "baserom.gba", 0x00e86198, 0xc0

	.global gUnknown_08E86258
gUnknown_08E86258: @ 8E86258
	.incbin "baserom.gba", 0x00e86258, 0x500

	.global gUnknown_08E86758
gUnknown_08E86758: @ 8E86758
	.incbin "baserom.gba", 0x00e86758, 0x139e

	.global gUnknown_08E87AF6
gUnknown_08E87AF6: @ 8E87AF6
	.incbin "baserom.gba", 0x00e87af6, 0x60

	.global gUnknown_08E87B56
gUnknown_08E87B56: @ 8E87B56
	.incbin "baserom.gba", 0x00e87b56, 0x5e

	.global gUnknown_08E87BB4
gUnknown_08E87BB4: @ 8E87BB4
	.incbin "baserom.gba", 0x00e87bb4, 0x1fc

	.global gUnknown_08E87DB0
gUnknown_08E87DB0: @ 8E87DB0
	.incbin "baserom.gba", 0x00e87db0, 0x52a

	.global gUnknown_08E882DA
gUnknown_08E882DA: @ 8E882DA
	.incbin "baserom.gba", 0x00e882da, 0x7e

	.global gUnknown_08E88358
gUnknown_08E88358: @ 8E88358
	.incbin "baserom.gba", 0x00e88358, 0x174

	.global gUnknown_08E884CC
gUnknown_08E884CC: @ 8E884CC
	.incbin "baserom.gba", 0x00e884cc, 0x55c

	.global gUnknown_08E88A28
gUnknown_08E88A28: @ 8E88A28
	.incbin "baserom.gba", 0x00e88a28, 0x20

	.global gUnknown_08E88A48
gUnknown_08E88A48: @ 8E88A48
	.incbin "baserom.gba", 0x00e88a48, 0x40

	.global gUnknown_08E88A88
gUnknown_08E88A88: @ 8E88A88
	.incbin "baserom.gba", 0x00e88a88, 0x2c4

	.global gUnknown_08E88D4C
gUnknown_08E88D4C: @ 8E88D4C
	.incbin "baserom.gba", 0x00e88d4c, 0x578

	.global gUnknown_08E892C4
gUnknown_08E892C4: @ 8E892C4
	.incbin "baserom.gba", 0x00e892c4, 0x364

	.global gUnknown_08E89628
gUnknown_08E89628: @ 8E89628
	.incbin "baserom.gba", 0x00e89628, 0x20

	.global gUnknown_08E89648
gUnknown_08E89648: @ 8E89648
	.incbin "baserom.gba", 0x00e89648, 0x20

	.global gUnknown_08E89668
gUnknown_08E89668: @ 8E89668
	.incbin "baserom.gba", 0x00e89668, 0x2f0

	.global gUnknown_08E89958
gUnknown_08E89958: @ 8E89958
	.incbin "baserom.gba", 0x00e89958, 0x20

	.global gUnknown_08E89978
gUnknown_08E89978: @ 8E89978
	.incbin "baserom.gba", 0x00e89978, 0x160

	.global gUnknown_08E89AD8
gUnknown_08E89AD8: @ 8E89AD8
	.incbin "baserom.gba", 0x00e89ad8, 0x6e8

	.global gUnknown_08E8A1C0
gUnknown_08E8A1C0: @ 8E8A1C0
	.incbin "baserom.gba", 0x00e8a1c0, 0x2

	.global gUnknown_08E8A1C2
gUnknown_08E8A1C2: @ 8E8A1C2
	.incbin "baserom.gba", 0x00e8a1c2, 0x1e

	.global gUnknown_08E8A1E0
gUnknown_08E8A1E0: @ 8E8A1E0
	.incbin "baserom.gba", 0x00e8a1e0, 0x3f8

	.global gUnknown_08E8A5D8
gUnknown_08E8A5D8: @ 8E8A5D8
	.incbin "baserom.gba", 0x00e8a5d8, 0x1ec

	.global gUnknown_08E8A7C4
gUnknown_08E8A7C4: @ 8E8A7C4
	.incbin "baserom.gba", 0x00e8a7c4, 0x540

	.global gUnknown_08E8AD04
gUnknown_08E8AD04: @ 8E8AD04
	.incbin "baserom.gba", 0x00e8ad04, 0x4c0

	.global gUnknown_08E8B1C4
gUnknown_08E8B1C4: @ 8E8B1C4
	.incbin "baserom.gba", 0x00e8b1c4, 0x20

	.global gUnknown_08E8B1E4
gUnknown_08E8B1E4: @ 8E8B1E4
	.incbin "baserom.gba", 0x00e8b1e4, 0x20

	.global gUnknown_08E8B204
gUnknown_08E8B204: @ 8E8B204
	.incbin "baserom.gba", 0x00e8b204, 0x19c

	.global gUnknown_08E8B3A0
gUnknown_08E8B3A0: @ 8E8B3A0
	.incbin "baserom.gba", 0x00e8b3a0, 0x140

	.global gUnknown_08E8B4E0
gUnknown_08E8B4E0: @ 8E8B4E0
	.incbin "baserom.gba", 0x00e8b4e0, 0x1ae0

	.global gUnknown_08E8CFC0
gUnknown_08E8CFC0: @ 8E8CFC0
	.incbin "baserom.gba", 0x00e8cfc0, 0xa00

	.global gUnknown_08E8D9C0
gUnknown_08E8D9C0: @ 8E8D9C0
	.incbin "baserom.gba", 0x00e8d9c0, 0x500

	.global gUnknown_08E8DEC0
gUnknown_08E8DEC0: @ 8E8DEC0
	.incbin "baserom.gba", 0x00e8dec0, 0x228

	.global gUnknown_08E8E0E8
gUnknown_08E8E0E8: @ 8E8E0E8
	.incbin "baserom.gba", 0x00e8e0e8, 0x20

	.global gUnknown_08E8E108
gUnknown_08E8E108: @ 8E8E108
	.incbin "baserom.gba", 0x00e8e108, 0x20

	.global gUnknown_08E8E128
gUnknown_08E8E128: @ 8E8E128
	.incbin "baserom.gba", 0x00e8e128, 0x11c

	.global gUnknown_08E8E244
gUnknown_08E8E244: @ 8E8E244
	.incbin "baserom.gba", 0x00e8e244, 0x464

	.global gUnknown_08E8E6A8
gUnknown_08E8E6A8: @ 8E8E6A8
	.incbin "baserom.gba", 0x00e8e6a8, 0x20

	.global gUnknown_08E8E6C8
gUnknown_08E8E6C8: @ 8E8E6C8
	.incbin "baserom.gba", 0x00e8e6c8, 0x20

	.global gUnknown_08E8E6E8
gUnknown_08E8E6E8: @ 8E8E6E8
	.incbin "baserom.gba", 0x00e8e6e8, 0x1c8

	.global gUnknown_08E8E8B0
gUnknown_08E8E8B0: @ 8E8E8B0
	.incbin "baserom.gba", 0x00e8e8b0, 0x1c8

	.global gUnknown_08E8EA78
gUnknown_08E8EA78: @ 8E8EA78
	.incbin "baserom.gba", 0x00e8ea78, 0x3a0

	.global gUnknown_08E8EE18
gUnknown_08E8EE18: @ 8E8EE18
	.incbin "baserom.gba", 0x00e8ee18, 0x360

	.global gUnknown_08E8F178
gUnknown_08E8F178: @ 8E8F178
	.incbin "baserom.gba", 0x00e8f178, 0x22

	.global gUnknown_08E8F19A
gUnknown_08E8F19A: @ 8E8F19A
	.incbin "baserom.gba", 0x00e8f19a, 0x6

	.global gUnknown_08E8F1A0
gUnknown_08E8F1A0: @ 8E8F1A0
	.incbin "baserom.gba", 0x00e8f1a0, 0x18

	.global gUnknown_08E8F1B8
gUnknown_08E8F1B8: @ 8E8F1B8
	.incbin "baserom.gba", 0x00e8f1b8, 0x64c

	.global gUnknown_08E8F804
gUnknown_08E8F804: @ 8E8F804
	.incbin "baserom.gba", 0x00e8f804, 0x20

	.global gUnknown_08E8F824
gUnknown_08E8F824: @ 8E8F824
	.incbin "baserom.gba", 0x00e8f824, 0x20

	.global gUnknown_08E8F844
gUnknown_08E8F844: @ 8E8F844
	.incbin "baserom.gba", 0x00e8f844, 0xbb4

	.global gUnknown_08E903F8
gUnknown_08E903F8: @ 8E903F8
	.incbin "baserom.gba", 0x00e903f8, 0x1D20

	.align 2
	.global gTilesetTiles_General
gTilesetTiles_General: @ 8E92118
	.incbin "data/tilesets/primary/general/tiles.4bpp.lz"

	.align 2
	.global gTilesetPalettes_General
gTilesetPalettes_General: @ 8E94310
	.incbin "data/tilesets/primary/general/palettes/00.gbapal"
	.incbin "data/tilesets/primary/general/palettes/01.gbapal"
	.incbin "data/tilesets/primary/general/palettes/02.gbapal"
	.incbin "data/tilesets/primary/general/palettes/03.gbapal"
	.incbin "data/tilesets/primary/general/palettes/04.gbapal"
	.incbin "data/tilesets/primary/general/palettes/05.gbapal"
	.incbin "data/tilesets/primary/general/palettes/06.gbapal"
	.incbin "data/tilesets/primary/general/palettes/07.gbapal"
	.incbin "data/tilesets/primary/general/palettes/08.gbapal"
	.incbin "data/tilesets/primary/general/palettes/09.gbapal"
	.incbin "data/tilesets/primary/general/palettes/10.gbapal"
	.incbin "data/tilesets/primary/general/palettes/11.gbapal"
	.incbin "data/tilesets/primary/general/palettes/12.gbapal"
	.incbin "data/tilesets/primary/general/palettes/13.gbapal"
	.incbin "data/tilesets/primary/general/palettes/14.gbapal"
	.incbin "data/tilesets/primary/general/palettes/15.gbapal"

	.global gUnknown_08E94510
gUnknown_08E94510: @ 8E94510
	.incbin "baserom.gba", 0x00e94510, 0x40

	.global gUnknown_08E94550
gUnknown_08E94550: @ 8E94550
	.incbin "baserom.gba", 0x00e94550, 0x80

	.global gUnknown_08E945D0
gUnknown_08E945D0: @ 8E945D0
	.incbin "baserom.gba", 0x00e945d0, 0x500

	.global gUnknown_08E94AD0
gUnknown_08E94AD0: @ 8E94AD0
	.incbin "baserom.gba", 0x00e94ad0, 0x900

	.global gUnknown_08E953D0
gUnknown_08E953D0: @ 8E953D0
	.incbin "baserom.gba", 0x00e953d0, 0xe0

	.global gUnknown_08E954B0
gUnknown_08E954B0: @ 8E954B0
	.incbin "baserom.gba", 0x00e954b0, 0x2c4

	.global gUnknown_08E95774
gUnknown_08E95774: @ 8E95774
	.incbin "baserom.gba", 0x00e95774, 0x2a4

	.global gUnknown_08E95A18
gUnknown_08E95A18: @ 8E95A18
	.incbin "baserom.gba", 0x00e95a18, 0xa0

	.global gUnknown_08E95AB8
gUnknown_08E95AB8: @ 8E95AB8
	.incbin "baserom.gba", 0x00e95ab8, 0x500

	.global gUnknown_08E95FB8
gUnknown_08E95FB8: @ 8E95FB8
	.incbin "baserom.gba", 0x00e95fb8, 0x500

	.global gUnknown_08E964B8
gUnknown_08E964B8: @ 8E964B8
	.incbin "baserom.gba", 0x00e964b8, 0x200

	.global gUnknown_08E966B8
gUnknown_08E966B8: @ 8E966B8
	.incbin "baserom.gba", 0x00e966b8, 0x20

	.global gMonIconPalettes
gMonIconPalettes: @ 8E966D8
	.incbin "graphics/pokemon_icon_palettes/0.gbapal"
	.incbin "graphics/pokemon_icon_palettes/1.gbapal"
	.incbin "graphics/pokemon_icon_palettes/2.gbapal"

	.global gUnknown_08E96738
gUnknown_08E96738: @ 8E96738
	.incbin "baserom.gba", 0x00e96738, 0x150

	.global gUnknown_08E96888
gUnknown_08E96888: @ 8E96888
	.incbin "baserom.gba", 0x00e96888, 0x10c

	.global gUnknown_08E96994
gUnknown_08E96994: @ 8E96994
	.incbin "baserom.gba", 0x00e96994, 0x138

	.global gUnknown_08E96ACC
gUnknown_08E96ACC: @ 8E96ACC
	.incbin "baserom.gba", 0x00e96acc, 0x8c

	.global gUnknown_08E96B58
gUnknown_08E96B58: @ 8E96B58
	.incbin "baserom.gba", 0x00e96b58, 0x7c

	.global gUnknown_08E96BD4
gUnknown_08E96BD4: @ 8E96BD4
	.incbin "baserom.gba", 0x00e96bd4, 0x158

	.global gUnknown_08E96D2C
gUnknown_08E96D2C: @ 8E96D2C
	.incbin "baserom.gba", 0x00e96d2c, 0x19c

	.global gUnknown_08E96EC8
gUnknown_08E96EC8: @ 8E96EC8
	.incbin "baserom.gba", 0x00e96ec8, 0x2980

	.global gUnknown_08E99848
gUnknown_08E99848: @ 8E99848
	.incbin "baserom.gba", 0x00e99848, 0x768

	.global gUnknown_08E99FB0
gUnknown_08E99FB0: @ 8E99FB0
	.incbin "baserom.gba", 0x00e99fb0, 0x150

	.global gUnknown_08E9A100
gUnknown_08E9A100: @ 8E9A100
	.incbin "baserom.gba", 0x00e9a100, 0x200

	.global gUnknown_08E9A300
gUnknown_08E9A300: @ 8E9A300
	.incbin "baserom.gba", 0x00e9a300, 0x800

	.global gUnknown_08E9AB00
gUnknown_08E9AB00: @ 8E9AB00
	.incbin "baserom.gba", 0x00e9ab00, 0x40

	.global gUnknown_08E9AB40
gUnknown_08E9AB40: @ 8E9AB40
	.incbin "baserom.gba", 0x00e9ab40, 0x20

	.global gUnknown_08E9AB60
gUnknown_08E9AB60: @ 8E9AB60
	.incbin "baserom.gba", 0x00e9ab60, 0x54

	.global gUnknown_08E9ABB4
gUnknown_08E9ABB4: @ 8E9ABB4
	.incbin "baserom.gba", 0x00e9abb4, 0x78

	.global gUnknown_08E9AC2C
gUnknown_08E9AC2C: @ 8E9AC2C
	.incbin "baserom.gba", 0x00e9ac2c, 0x20

	.global gUnknown_08E9AC4C
gUnknown_08E9AC4C: @ 8E9AC4C
	.incbin "baserom.gba", 0x00e9ac4c, 0x1a90

	.global gUnknown_08E9C6DC
gUnknown_08E9C6DC: @ 8E9C6DC
	.incbin "baserom.gba", 0x00e9c6dc, 0xbc

	.global gUnknown_08E9C798
gUnknown_08E9C798: @ 8E9C798
	.incbin "baserom.gba", 0x00e9c798, 0x28c

	.global gUnknown_08E9CA24
gUnknown_08E9CA24: @ 8E9CA24
	.incbin "baserom.gba", 0x00e9ca24, 0x20

	.global gUnknown_08E9CA44
gUnknown_08E9CA44: @ 8E9CA44
	.incbin "baserom.gba", 0x00e9ca44, 0xe88

	.global gUnknown_08E9D8CC
gUnknown_08E9D8CC: @ 8E9D8CC
	.incbin "baserom.gba", 0x00e9d8cc, 0x1d58

	.global gUnknown_08E9F624
gUnknown_08E9F624: @ 8E9F624
	.incbin "baserom.gba", 0x00e9f624, 0x1c0

	.global gUnknown_08E9F7E4
gUnknown_08E9F7E4: @ 8E9F7E4
	.incbin "baserom.gba", 0x00e9f7e4, 0x1a4

	.global gUnknown_08E9F988
gUnknown_08E9F988: @ 8E9F988
	.incbin "baserom.gba", 0x00e9f988, 0x60

	.global gUnknown_08E9F9E8
gUnknown_08E9F9E8: @ 8E9F9E8
	.incbin "baserom.gba", 0x00e9f9e8, 0x20

	.global gUnknown_08E9FA08
gUnknown_08E9FA08: @ 8E9FA08
	.incbin "baserom.gba", 0x00e9fa08, 0xf4

	.global gUnknown_08E9FAFC
gUnknown_08E9FAFC: @ 8E9FAFC
	.incbin "baserom.gba", 0x00e9fafc, 0x1c

	.global gUnknown_08E9FB18
gUnknown_08E9FB18: @ 8E9FB18
	.incbin "baserom.gba", 0x00e9fb18, 0x4

	.global gUnknown_08E9FB1C
gUnknown_08E9FB1C: @ 8E9FB1C
	.incbin "baserom.gba", 0x00e9fb1c, 0x84

	.global gUnknown_08E9FBA0
gUnknown_08E9FBA0: @ 8E9FBA0
	.incbin "baserom.gba", 0x00e9fba0, 0xc4

	.global gUnknown_08E9FC64
gUnknown_08E9FC64: @ 8E9FC64
	.incbin "baserom.gba", 0x00e9fc64, 0xb8

	.global gUnknown_08E9FD1C
gUnknown_08E9FD1C: @ 8E9FD1C
	.incbin "baserom.gba", 0x00e9fd1c, 0x48

	.global gUnknown_08E9FD64
gUnknown_08E9FD64: @ 8E9FD64
	.incbin "baserom.gba", 0x00e9fd64, 0xf0

	.global gUnknown_08E9FE54
gUnknown_08E9FE54: @ 8E9FE54
	.incbin "baserom.gba", 0x00e9fe54, 0x60

	.global gUnknown_08E9FEB4
gUnknown_08E9FEB4: @ 8E9FEB4
	.incbin "baserom.gba", 0x00e9feb4, 0xa4

	.global gUnknown_08E9FF58
gUnknown_08E9FF58: @ 8E9FF58
	.incbin "baserom.gba", 0x00e9ff58, 0xd0

	.global gUnknown_08EA0028
gUnknown_08EA0028: @ 8EA0028
	.incbin "baserom.gba", 0x00ea0028, 0xe0

	.global gUnknown_08EA0108
gUnknown_08EA0108: @ 8EA0108
	.incbin "baserom.gba", 0x00ea0108, 0x1c0

	.global gUnknown_08EA02C8
gUnknown_08EA02C8: @ 8EA02C8
	.incbin "baserom.gba", 0x00ea02c8, 0x80

	.global gUnknown_08EA0348
gUnknown_08EA0348: @ 8EA0348
	.incbin "baserom.gba", 0x00ea0348, 0x1280

	.global gUnknown_08EA15C8
gUnknown_08EA15C8: @ 8EA15C8
	.incbin "baserom.gba", 0x00ea15c8, 0x800

	.global gUnknown_08EA1DC8
gUnknown_08EA1DC8: @ 8EA1DC8
	.incbin "baserom.gba", 0x00ea1dc8, 0x844

	.global gUnknown_08EA260C
gUnknown_08EA260C: @ 8EA260C
	.incbin "baserom.gba", 0x00ea260c, 0x438

	.global gUnknown_08EA2A44
gUnknown_08EA2A44: @ 8EA2A44
	.incbin "baserom.gba", 0x00ea2a44, 0x200

	.global gFont3LatinGlyphs
gFont3LatinGlyphs: @ 8EA2C44
	.incbin "graphics/fonts/font3_lat.4bpp"

	.global gFont4LatinGlyphs
gFont4LatinGlyphs: @ 8EA6BC4
	.incbin "graphics/fonts/font4_lat.4bpp"

	.global gFont3JapaneseGlyphs
gFont3JapaneseGlyphs: @ 8EA8744
	.incbin "graphics/fonts/font3_jpn.4bpp"

	.global gFont4JapaneseGlyphs
gFont4JapaneseGlyphs: @ 8EAC6C4
	.incbin "graphics/fonts/font4_jpn.4bpp"
