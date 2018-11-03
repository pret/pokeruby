	.include "MPlayDef.s"

	.equ	song_250_grp, voicegroup112
	.equ	song_250_pri, 4
	.equ	song_250_rev, 0
	.equ	song_250_mvl, 127
	.equ	song_250_key, 0
	.equ	song_250_tbs, 1
	.equ	song_250_exg, 0
	.equ	song_250_cmp, 1

	.section .rodata
	.global	song_250
	.align	2

@********************** Track  1 **********************@

song_250_1:
	.byte	KEYSH , song_250_key+0
	.byte	TEMPO , 120*song_250_tbs/2
	.byte		VOICE , 2
	.byte		VOL   , 127*song_250_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_250:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_250_pri	@ Priority
	.byte	song_250_rev	@ Reverb.

	.word	song_250_grp

	.word	song_250_1

	.end
