	.include "asm/macros.s"
	.include "asm/macros/contest_ai_script.s"
	.include "constants/constants.s"

	.section script_data, "aw", %progbits

	.align 2
gUnknown_081DC118:: @ 81DC118
	.4byte Unknown_081DC7FB
	.4byte Unknown_081DC348
	.4byte Unknown_081DC27F
	.4byte Unknown_081DC2AB
	.4byte Unknown_081DCA4C
	.4byte Unknown_081DC3C7
	.4byte Unknown_081DC7DE
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.incbin "baserom.gba", 0x001dc198, 0xE7 @ unreferenced?
Unknown_081DC27F:
	contest_28 0x03 AI_end_081DC27F
	contest_3E 0x01 AI_score1_081DC27F
	contest_3E 0x02 AI_score2_081DC27F
	contest_3E 0x03 AI_score3_081DC27F
	contest_3E 0x04 AI_score4_081DC27F
	end
AI_score1_081DC27F:
	score 0xFB
	end
AI_score2_081DC27F:
	score 0xF1
	end
AI_score3_081DC27F:
	score 0xEC
	end
AI_score4_081DC27F:
	score 0xE7
	end
AI_end_081DC27F:
	end
Unknown_081DC2AB:
	.incbin "baserom.gba", 0x001dc2ab, 0x9D
Unknown_081DC348:
	.incbin "baserom.gba", 0x001dc348, 0x7F
Unknown_081DC3C7:
	.incbin "baserom.gba", 0x001dc3c7, 0x417
Unknown_081DC7DE:
	contest_20 0x02 AI_contest7D_081DC7DE
	contest_20 0x03 AI_contest7D_081DC7DE
	contest_20 0x04 AI_contest7D_081DC7DE
	end
AI_contest7D_081DC7DE:
	contest_7D 0x7D AI_end_081DC7DE
	score 0x0A
	end
AI_end_081DC7DE:
	end
Unknown_081DC7FB:
	.incbin "baserom.gba", 0x001dc7fb, 0x251
Unknown_081DCA4C:
	.incbin "baserom.gba", 0x001dca4c, 0xA7
Unknown_081DCAF3:
	end
