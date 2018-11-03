	.include "MPlayDef.s"

	.equ	song_258_grp, voicegroup112
	.equ	song_258_pri, 4
	.equ	song_258_rev, 0
	.equ	song_258_mvl, 127
	.equ	song_258_key, 0
	.equ	song_258_tbs, 1
	.equ	song_258_exg, 0
	.equ	song_258_cmp, 1

	.section .rodata
	.global	song_258
	.align	2

@********************** Track  1 **********************@

song_258_1:
	.byte	KEYSH , song_258_key+0
	.byte	TEMPO , 120*song_258_tbs/2
	.byte		VOICE , 10
	.byte		VOL   , 127*song_258_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_258_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_258_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_258:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_258_pri	@ Priority
	.byte	song_258_rev	@ Reverb.

	.word	song_258_grp

	.word	song_258_1

	.end
