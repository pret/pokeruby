	.include "MPlayDef.s"

	.equ	song_290_grp, voicegroup_84549F0
	.equ	song_290_pri, 4
	.equ	song_290_rev, 0
	.equ	song_290_mvl, 127
	.equ	song_290_key, 0
	.equ	song_290_tbs, 1
	.equ	song_290_exg, 0
	.equ	song_290_cmp, 1

	.section .rodata
	.global	song_290
	.align	2

@********************** Track  1 **********************@

song_290_1:
	.byte	KEYSH , song_290_key+0
	.byte	TEMPO , 120*song_290_tbs/2
	.byte		VOICE , 42
	.byte		VOL   , 127*song_290_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_290:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_290_pri	@ Priority
	.byte	song_290_rev	@ Reverb.

	.word	song_290_grp

	.word	song_290_1

	.end
