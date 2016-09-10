	.include "MPlayDef.s"

	.equ	song_254_grp, voicegroup_84549F0
	.equ	song_254_pri, 4
	.equ	song_254_rev, 0
	.equ	song_254_mvl, 127
	.equ	song_254_key, 0
	.equ	song_254_tbs, 1
	.equ	song_254_exg, 0
	.equ	song_254_cmp, 1

	.section .rodata
	.global	song_254
	.align	2

@********************** Track  1 **********************@

song_254_1:
	.byte	KEYSH , song_254_key+0
	.byte	TEMPO , 120*song_254_tbs/2
	.byte		VOICE , 6
	.byte		VOL   , 127*song_254_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_254:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_254_pri	@ Priority
	.byte	song_254_rev	@ Reverb.

	.word	song_254_grp

	.word	song_254_1

	.end
