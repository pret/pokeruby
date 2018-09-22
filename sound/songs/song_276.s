	.include "MPlayDef.s"

	.equ	song_276_grp, voicegroup112
	.equ	song_276_pri, 4
	.equ	song_276_rev, 0
	.equ	song_276_mvl, 127
	.equ	song_276_key, 0
	.equ	song_276_tbs, 1
	.equ	song_276_exg, 0
	.equ	song_276_cmp, 1

	.section .rodata
	.global	song_276
	.align	2

@********************** Track  1 **********************@

song_276_1:
	.byte	KEYSH , song_276_key+0
	.byte	TEMPO , 120*song_276_tbs/2
	.byte		VOICE , 28
	.byte		VOL   , 127*song_276_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_276_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_276_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_276:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_276_pri	@ Priority
	.byte	song_276_rev	@ Reverb.

	.word	song_276_grp

	.word	song_276_1

	.end
