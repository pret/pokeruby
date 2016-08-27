	.section .rodata

	.include "asm/macros/music_voice.s"

	.include "data/music/voice_groups.s"
	.include "data/music/keysplit_tables.s"
	.include "data/music/programmable_wave_data.s"

gMPlayTable:: @ 845545C
	.incbin "baserom.gba", 0x0045545c, 0x30

	.include "data/music/music_pointers.s" @ 845548C

BlankMusic_Header: @ 845632C
	.byte 0 @ number of tracks
	.byte 0, 0, 0 @ unknown

	.include "data/music/direct_sound_data.s"
	.include "data/music/music_headers.s"
