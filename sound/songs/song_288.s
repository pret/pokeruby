	.include "MPlayDef.s"

	.equ	song_288_grp, voicegroup112
	.equ	song_288_pri, 4
	.equ	song_288_rev, 0
	.equ	song_288_mvl, 127
	.equ	song_288_key, 0
	.equ	song_288_tbs, 1
	.equ	song_288_exg, 0
	.equ	song_288_cmp, 1

	.section .rodata
	.global	song_288
	.align	2

@********************** Track  1 **********************@

song_288_1:
	.byte	KEYSH , song_288_key+0
	.byte	TEMPO , 120*song_288_tbs/2
	.byte		VOICE , 40
	.byte		VOL   , 127*song_288_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_288_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_288_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_288:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_288_pri	@ Priority
	.byte	song_288_rev	@ Reverb.

	.word	song_288_grp

	.word	song_288_1

	.end
