	.include "MPlayDef.s"

	.equ	song_292_grp, voicegroup_84549F0
	.equ	song_292_pri, 4
	.equ	song_292_rev, 0
	.equ	song_292_mvl, 127
	.equ	song_292_key, 0
	.equ	song_292_tbs, 1
	.equ	song_292_exg, 0
	.equ	song_292_cmp, 1

	.section .rodata
	.global	song_292
	.align	2

@********************** Track  1 **********************@

song_292_1:
	.byte	KEYSH , song_292_key+0
	.byte	TEMPO , 120*song_292_tbs/2
	.byte		VOICE , 44
	.byte		VOL   , 127*song_292_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_292:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_292_pri	@ Priority
	.byte	song_292_rev	@ Reverb.

	.word	song_292_grp

	.word	song_292_1

	.end
