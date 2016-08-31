	.include "MPlayDef.s"

	.equ	song_252_grp, voicegroup_84549F0
	.equ	song_252_pri, 4
	.equ	song_252_rev, 0
	.equ	song_252_mvl, 127
	.equ	song_252_key, 0
	.equ	song_252_tbs, 1
	.equ	song_252_exg, 0
	.equ	song_252_cmp, 1

	.section .rodata
	.global	song_252
	.align	2

@********************** Track  1 **********************@

song_252_1:
	.byte	KEYSH , song_252_key+0
	.byte	TEMPO , 120*song_252_tbs/2
	.byte		VOICE , 4
	.byte		VOL   , 127*song_252_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_252_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_252_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_252:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_252_pri	@ Priority
	.byte	song_252_rev	@ Reverb.

	.word	song_252_grp

	.word	song_252_1

	.end
