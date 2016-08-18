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
	contest_23 0x00 AI_contest09_081DC2AB
	contest_25 0x00 AI_contest7D_4_081DC2AB
	contest_25 0x01 AI_contest3D_081DC2AB
	end
AI_contest09_081DC2AB:
	contest_09 0x04 AI_contest0F_1_081DC2AB
	contest_09 0x03 AI_contest0F_2_081DC2AB
	contest_83 AI_end_081DC2AB
	score 0x0F 
	end
AI_contest0F_1_081DC2AB:
	contest_0F 0x00 AI_contest7D_1_081DC2AB
	contest_7D 0x33 AI_end_081DC2AB
	score 0x14 
	end
AI_contest7D_1_081DC2AB:
	contest_7D 0x7F AI_end_081DC2AB
	score 0xF6 
	end
AI_contest0F_2_081DC2AB:
	contest_0F 0x00 AI_contest7D_3_081DC2AB
	contest_04 0x04 AI_score_081DC2AB
AI_contest7D_2_081DC2AB:
	contest_7D 0x33 AI_end_081DC2AB
	score 0x0A 
	end
AI_score_081DC2AB:
	score 0x0F 
	end
AI_contest7D_3_081DC2AB:
	contest_7D 0x7F AI_end_081DC2AB
	score 0x0A 
	end
AI_contest7D_4_081DC2AB:
	contest_7D 0x7F AI_end_081DC2AB
	score 0x0A 
	end
AI_contest3D_081DC2AB:
	contest_3D 0x00 AI_contest29_081DC2AB
	contest_0F 0x00 AI_contest7D_5_081DC2AB
	contest_0A 0x04 AI_contest7D_5_081DC2AB
	score 0x1E 
	end
AI_contest7D_5_081DC2AB:
	contest_7D 0x64 AI_end_081DC2AB
	score 0x0A 
	end
AI_contest29_081DC2AB:
	contest_29 0x03 AI_end_081DC2AB
	contest_0F 0x00 AI_contest7D_5_081DC2AB
	contest_0A 0x04 AI_contest7D_5_081DC2AB
	score 0x1E 
	end
AI_end_081DC2AB:
	end
Unknown_081DC348:
	contest_47 AI_score_081DC348
	contest_80 AI_contest3F_081DC348
	contest_80 AI_contest45_081DC348
	end
AI_contest3F_081DC348:
	contest_3F 0x00 AI_end_081DC348
	contest_42 AI_end_081DC348
	contest_0E 0x00 AI_contest04_1_081DC348
	contest_0E 0x01 AI_contest04_2_081DC348
	contest_0E 0x02 AI_contest04_3_081DC348
	contest_0E 0x03 AI_contest04_4_081DC348
	end
AI_contest45_081DC348:
	contest_45 AI_end_081DC348
	score 0xF6
	end
AI_score_081DC348:
	score 0x19
	end
AI_contest04_1_081DC348:
	contest_04 0x04 AI_contest7D_081DC348
	contest_7D 0x96 AI_end_081DC348
	score 0x0A
	end
AI_contest04_2_081DC348:
	contest_04 0x04 AI_contest7D_081DC348
	contest_7D 0x7D AI_end_081DC348
	score 0x0A
	end
AI_contest04_3_081DC348:
	contest_04 0x04 AI_contest7D_081DC348
	contest_7D 0x32 AI_end_081DC348
	score 0x0A
	end
AI_contest04_4_081DC348:
	contest_04 0x04 AI_contest7D_081DC348
	score 0x0A
	end
AI_contest7D_081DC348:
	contest_7D 0x7D AI_end_081DC348
	score 0xF1
	end
AI_end_081DC348:
	end
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
