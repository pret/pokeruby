	.include "MPlayDef.s"

	.equ	song_264_grp, voicegroup112
	.equ	song_264_pri, 4
	.equ	song_264_rev, 0
	.equ	song_264_mvl, 127
	.equ	song_264_key, 0
	.equ	song_264_tbs, 1
	.equ	song_264_exg, 0
	.equ	song_264_cmp, 1

	.section .rodata
	.global	song_264
	.align	2

@********************** Track  1 **********************@

song_264_1:
	.byte	KEYSH , song_264_key+0
	.byte	TEMPO , 120*song_264_tbs/2
	.byte		VOICE , 16
	.byte		VOL   , 127*song_264_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_264_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_264_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_264:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_264_pri	@ Priority
	.byte	song_264_rev	@ Reverb.

	.word	song_264_grp

	.word	song_264_1

	.end
