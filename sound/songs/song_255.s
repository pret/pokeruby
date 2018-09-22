	.include "MPlayDef.s"

	.equ	song_255_grp, voicegroup112
	.equ	song_255_pri, 4
	.equ	song_255_rev, 0
	.equ	song_255_mvl, 127
	.equ	song_255_key, 0
	.equ	song_255_tbs, 1
	.equ	song_255_exg, 0
	.equ	song_255_cmp, 1

	.section .rodata
	.global	song_255
	.align	2

@********************** Track  1 **********************@

song_255_1:
	.byte	KEYSH , song_255_key+0
	.byte	TEMPO , 120*song_255_tbs/2
	.byte		VOICE , 7
	.byte		VOL   , 127*song_255_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_255_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_255_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_255:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_255_pri	@ Priority
	.byte	song_255_rev	@ Reverb.

	.word	song_255_grp

	.word	song_255_1

	.end
