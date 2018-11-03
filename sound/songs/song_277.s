	.include "MPlayDef.s"

	.equ	song_277_grp, voicegroup112
	.equ	song_277_pri, 4
	.equ	song_277_rev, 0
	.equ	song_277_mvl, 127
	.equ	song_277_key, 0
	.equ	song_277_tbs, 1
	.equ	song_277_exg, 0
	.equ	song_277_cmp, 1

	.section .rodata
	.global	song_277
	.align	2

@********************** Track  1 **********************@

song_277_1:
	.byte	KEYSH , song_277_key+0
	.byte	TEMPO , 120*song_277_tbs/2
	.byte		VOICE , 29
	.byte		VOL   , 127*song_277_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_277:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_277_pri	@ Priority
	.byte	song_277_rev	@ Reverb.

	.word	song_277_grp

	.word	song_277_1

	.end
