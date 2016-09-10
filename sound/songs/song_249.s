	.include "MPlayDef.s"

	.equ	song_249_grp, voicegroup_84549F0
	.equ	song_249_pri, 4
	.equ	song_249_rev, 0
	.equ	song_249_mvl, 127
	.equ	song_249_key, 0
	.equ	song_249_tbs, 1
	.equ	song_249_exg, 0
	.equ	song_249_cmp, 1

	.section .rodata
	.global	song_249
	.align	2

@********************** Track  1 **********************@

song_249_1:
	.byte	KEYSH , song_249_key+0
	.byte	TEMPO , 120*song_249_tbs/2
	.byte		VOICE , 1
	.byte		VOL   , 117*song_249_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_249_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_249_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_249:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_249_pri	@ Priority
	.byte	song_249_rev	@ Reverb.

	.word	song_249_grp

	.word	song_249_1

	.end
