	.include "MPlayDef.s"

	.equ	song_273_grp, voicegroup_84549F0
	.equ	song_273_pri, 4
	.equ	song_273_rev, 0
	.equ	song_273_mvl, 127
	.equ	song_273_key, 0
	.equ	song_273_tbs, 1
	.equ	song_273_exg, 0
	.equ	song_273_cmp, 1

	.section .rodata
	.global	song_273
	.align	2

@********************** Track  1 **********************@

song_273_1:
	.byte	KEYSH , song_273_key+0
	.byte	TEMPO , 120*song_273_tbs/2
	.byte		VOICE , 25
	.byte		VOL   , 127*song_273_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_273_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_273_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_273:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_273_pri	@ Priority
	.byte	song_273_rev	@ Reverb.

	.word	song_273_grp

	.word	song_273_1

	.end
