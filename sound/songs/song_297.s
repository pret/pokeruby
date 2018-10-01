	.include "MPlayDef.s"

	.equ	song_297_grp, voicegroup112
	.equ	song_297_pri, 4
	.equ	song_297_rev, 0
	.equ	song_297_mvl, 127
	.equ	song_297_key, 0
	.equ	song_297_tbs, 1
	.equ	song_297_exg, 0
	.equ	song_297_cmp, 1

	.section .rodata
	.global	song_297
	.align	2

@********************** Track  1 **********************@

song_297_1:
	.byte	KEYSH , song_297_key+0
	.byte	TEMPO , 120*song_297_tbs/2
	.byte		VOICE , 49
	.byte		VOL   , 127*song_297_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_297_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_297_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_297:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_297_pri	@ Priority
	.byte	song_297_rev	@ Reverb.

	.word	song_297_grp

	.word	song_297_1

	.end
