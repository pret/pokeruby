	.include "MPlayDef.s"

	.equ	song_279_grp, voicegroup112
	.equ	song_279_pri, 4
	.equ	song_279_rev, 0
	.equ	song_279_mvl, 127
	.equ	song_279_key, 0
	.equ	song_279_tbs, 1
	.equ	song_279_exg, 0
	.equ	song_279_cmp, 1

	.section .rodata
	.global	song_279
	.align	2

@********************** Track  1 **********************@

song_279_1:
	.byte	KEYSH , song_279_key+0
	.byte	TEMPO , 120*song_279_tbs/2
	.byte		VOICE , 31
	.byte		VOL   , 127*song_279_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_279_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_279_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_279:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_279_pri	@ Priority
	.byte	song_279_rev	@ Reverb.

	.word	song_279_grp

	.word	song_279_1

	.end
