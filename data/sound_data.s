	.section .rodata

	.include "asm/macros/m4a.s"

	.include "sound/voice_groups.s"

	.incbin "baserom.gba", 0x455224, 0x238

	.include "sound/music_player_table.s"
	.include "sound/song_table.s"

	.incbin "baserom.gba", 0x456330, 0x655FF0 - 0x456330
