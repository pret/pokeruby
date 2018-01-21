    .section .rodata

	.align 2

@ Is this actually sJapaneseEggNickname?
Str_842E238: @ 0x842E238
	.string "タマゴ$"

.if DEBUG

Str_842E23C: @ 0x842E23C
	.string "ガイブ$"

Str_842E240: @ 0x842E240
	.string "ENGLISH$"

Str_842E248: @ 0x842E248
	.string "TOURNAMENT$"

Str_842E253: @ 0x842E253
	.string "　そら　　カードイー$"

Str_842E25E: @ 0x842E25E
	.string "ポケコッコ$"

Str_842E264: @ 0x842E264
	.string "ticket$"

Str_842E26B: @ 0x842E26B
	.string "{PKMN}$"

Str_842E26E: @ 0x842E26E
	.string "wrong　{PKMN}$"

Str_842E277: @ 0x842E277
	.string "ribbon$"

Str_842E27E: @ 0x842E27E
	.string "DEX$"

Str_842E282: @ 0x842E282
	.string "message$"

Str_842E28A: @ 0x842E28A
	.string "egg$"

Str_842E28E: @ 0x842E28E
	.string "RAM　seed$"

Str_842E297: @ 0x842E297
	.string "trainer$"

Str_842E29F: @ 0x842E29F
	.string "clock$"

Str_842E2A5: @ 0x842E2A5
	.string "item$"

Str_842E2AA: @ 0x842E2AA
	.string "goods$"

Str_842E2B0: @ 0x842E2B0
	.string "potion$"

Str_842E2B7: @ 0x842E2B7
	.string "ball$"

Str_842E2BC: @ 0x842E2BC
	.string "cheri　berry$"

Str_842E2C8: @ 0x842E2C8
	.string "TM01$"

	.align 2
_842E2D0::
	.4byte Str_842E264, debug_sub_813C404+1
	.4byte Str_842E26B, debug_sub_813C810+1
	.4byte Str_842E26E, debug_sub_813C888+1
	.4byte Str_842E277, debug_sub_813C430+1
	.4byte Str_842E27E, debug_sub_813C488+1
	.4byte Str_842E282, debug_sub_813C45C+1
	.4byte Str_842E28A, debug_sub_813C740+1
	.4byte Str_842E28E, debug_sub_813C5B4+1
	.4byte Str_842E297, debug_sub_813C93C+1
	.4byte Str_842E29F, debug_sub_813C4B4+1
	.4byte Str_842E2A5, debug_sub_813C4D4+1
	.4byte Str_842E2AA, debug_sub_813C500+1
	.4byte Str_842E2B0, debug_sub_813C580+1
	.4byte Str_842E2B7, debug_sub_813C58C+1
	.4byte Str_842E2BC, debug_sub_813C598+1
	.4byte Str_842E2C8, debug_sub_813C5A4+1

_842E350::
	.4byte 0x10
	.4byte _845DAE1
	.4byte _845DDB2
	.4byte _845E306
	.4byte _845E3E0
	.4byte _845E3E0
	.4byte _845E402
	.4byte _845E402
	.4byte _845E422
	.4byte _845E422
	.4byte _845E443

.endif
