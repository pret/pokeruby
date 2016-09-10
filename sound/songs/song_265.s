	.include "MPlayDef.s"

	.equ	song_265_grp, voicegroup_84549F0
	.equ	song_265_pri, 4
	.equ	song_265_rev, 0
	.equ	song_265_mvl, 127
	.equ	song_265_key, 0
	.equ	song_265_tbs, 1
	.equ	song_265_exg, 0
	.equ	song_265_cmp, 1

	.section .rodata
	.global	song_265
	.align	2

@********************** Track  1 **********************@

song_265_1:
	.byte	KEYSH , song_265_key+0
	.byte	TEMPO , 120*song_265_tbs/2
	.byte		VOICE , 17
	.byte		VOL   , 127*song_265_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_265:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_265_pri	@ Priority
	.byte	song_265_rev	@ Reverb.

	.word	song_265_grp

	.word	song_265_1

	.end
