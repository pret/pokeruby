	.include "MPlayDef.s"

	.equ	song_291_grp, voicegroup112
	.equ	song_291_pri, 4
	.equ	song_291_rev, 0
	.equ	song_291_mvl, 127
	.equ	song_291_key, 0
	.equ	song_291_tbs, 1
	.equ	song_291_exg, 0
	.equ	song_291_cmp, 1

	.section .rodata
	.global	song_291
	.align	2

@********************** Track  1 **********************@

song_291_1:
	.byte	KEYSH , song_291_key+0
	.byte	TEMPO , 120*song_291_tbs/2
	.byte		VOICE , 43
	.byte		VOL   , 127*song_291_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_291_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_291_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_291:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_291_pri	@ Priority
	.byte	song_291_rev	@ Reverb.

	.word	song_291_grp

	.word	song_291_1

	.end
