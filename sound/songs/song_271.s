	.include "MPlayDef.s"

	.equ	song_271_grp, voicegroup_84549F0
	.equ	song_271_pri, 4
	.equ	song_271_rev, 0
	.equ	song_271_mvl, 127
	.equ	song_271_key, 0
	.equ	song_271_tbs, 1
	.equ	song_271_exg, 0
	.equ	song_271_cmp, 1

	.section .rodata
	.global	song_271
	.align	2

@********************** Track  1 **********************@

song_271_1:
	.byte	KEYSH , song_271_key+0
	.byte	TEMPO , 120*song_271_tbs/2
	.byte		VOICE , 23
	.byte		VOL   , 127*song_271_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_271:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_271_pri	@ Priority
	.byte	song_271_rev	@ Reverb.

	.word	song_271_grp

	.word	song_271_1

	.end
