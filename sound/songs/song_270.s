	.include "MPlayDef.s"

	.equ	song_270_grp, voicegroup112
	.equ	song_270_pri, 4
	.equ	song_270_rev, 0
	.equ	song_270_mvl, 127
	.equ	song_270_key, 0
	.equ	song_270_tbs, 1
	.equ	song_270_exg, 0
	.equ	song_270_cmp, 1

	.section .rodata
	.global	song_270
	.align	2

@********************** Track  1 **********************@

song_270_1:
	.byte	KEYSH , song_270_key+0
	.byte	TEMPO , 120*song_270_tbs/2
	.byte		VOICE , 22
	.byte		VOL   , 127*song_270_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_270_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_270_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_270:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_270_pri	@ Priority
	.byte	song_270_rev	@ Reverb.

	.word	song_270_grp

	.word	song_270_1

	.end
