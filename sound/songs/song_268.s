	.include "MPlayDef.s"

	.equ	song_268_grp, voicegroup_84549F0
	.equ	song_268_pri, 4
	.equ	song_268_rev, 0
	.equ	song_268_mvl, 127
	.equ	song_268_key, 0
	.equ	song_268_tbs, 1
	.equ	song_268_exg, 0
	.equ	song_268_cmp, 1

	.section .rodata
	.global	song_268
	.align	2

@********************** Track  1 **********************@

song_268_1:
	.byte	KEYSH , song_268_key+0
	.byte	TEMPO , 120*song_268_tbs/2
	.byte		VOICE , 20
	.byte		VOL   , 127*song_268_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_268:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_268_pri	@ Priority
	.byte	song_268_rev	@ Reverb.

	.word	song_268_grp

	.word	song_268_1

	.end
