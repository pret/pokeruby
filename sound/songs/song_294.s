	.include "MPlayDef.s"

	.equ	song_294_grp, voicegroup_84549F0
	.equ	song_294_pri, 4
	.equ	song_294_rev, 0
	.equ	song_294_mvl, 127
	.equ	song_294_key, 0
	.equ	song_294_tbs, 1
	.equ	song_294_exg, 0
	.equ	song_294_cmp, 1

	.section .rodata
	.global	song_294
	.align	2

@********************** Track  1 **********************@

song_294_1:
	.byte	KEYSH , song_294_key+0
	.byte	TEMPO , 120*song_294_tbs/2
	.byte		VOICE , 46
	.byte		VOL   , 127*song_294_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_294_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_294_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_294:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_294_pri	@ Priority
	.byte	song_294_rev	@ Reverb.

	.word	song_294_grp

	.word	song_294_1

	.end
