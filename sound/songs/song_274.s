	.include "MPlayDef.s"

	.equ	song_274_grp, voicegroup_84549F0
	.equ	song_274_pri, 4
	.equ	song_274_rev, 0
	.equ	song_274_mvl, 127
	.equ	song_274_key, 0
	.equ	song_274_tbs, 1
	.equ	song_274_exg, 0
	.equ	song_274_cmp, 1

	.section .rodata
	.global	song_274
	.align	2

@********************** Track  1 **********************@

song_274_1:
	.byte	KEYSH , song_274_key+0
	.byte	TEMPO , 120*song_274_tbs/2
	.byte		VOICE , 26
	.byte		VOL   , 127*song_274_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_274:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_274_pri	@ Priority
	.byte	song_274_rev	@ Reverb.

	.word	song_274_grp

	.word	song_274_1

	.end
