	.include "MPlayDef.s"

	.equ	song_284_grp, voicegroup_84549F0
	.equ	song_284_pri, 4
	.equ	song_284_rev, 0
	.equ	song_284_mvl, 127
	.equ	song_284_key, 0
	.equ	song_284_tbs, 1
	.equ	song_284_exg, 0
	.equ	song_284_cmp, 1

	.section .rodata
	.global	song_284
	.align	2

@********************** Track  1 **********************@

song_284_1:
	.byte	KEYSH , song_284_key+0
	.byte	TEMPO , 120*song_284_tbs/2
	.byte		VOICE , 36
	.byte		VOL   , 127*song_284_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_284:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_284_pri	@ Priority
	.byte	song_284_rev	@ Reverb.

	.word	song_284_grp

	.word	song_284_1

	.end
