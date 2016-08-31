	.include "MPlayDef.s"

	.equ	song_267_grp, voicegroup_84549F0
	.equ	song_267_pri, 4
	.equ	song_267_rev, 0
	.equ	song_267_mvl, 127
	.equ	song_267_key, 0
	.equ	song_267_tbs, 1
	.equ	song_267_exg, 0
	.equ	song_267_cmp, 1

	.section .rodata
	.global	song_267
	.align	2

@********************** Track  1 **********************@

song_267_1:
	.byte	KEYSH , song_267_key+0
	.byte	TEMPO , 120*song_267_tbs/2
	.byte		VOICE , 19
	.byte		VOL   , 117*song_267_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_267_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_267_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_267:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_267_pri	@ Priority
	.byte	song_267_rev	@ Reverb.

	.word	song_267_grp

	.word	song_267_1

	.end
