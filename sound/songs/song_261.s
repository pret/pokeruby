	.include "MPlayDef.s"

	.equ	song_261_grp, voicegroup_84549F0
	.equ	song_261_pri, 4
	.equ	song_261_rev, 0
	.equ	song_261_mvl, 127
	.equ	song_261_key, 0
	.equ	song_261_tbs, 1
	.equ	song_261_exg, 0
	.equ	song_261_cmp, 1

	.section .rodata
	.global	song_261
	.align	2

@********************** Track  1 **********************@

song_261_1:
	.byte	KEYSH , song_261_key+0
	.byte	TEMPO , 120*song_261_tbs/2
	.byte		VOICE , 13
	.byte		VOL   , 127*song_261_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_261_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_261_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_261:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_261_pri	@ Priority
	.byte	song_261_rev	@ Reverb.

	.word	song_261_grp

	.word	song_261_1

	.end
