	.include "MPlayDef.s"

	.equ	song_283_grp, voicegroup_84549F0
	.equ	song_283_pri, 4
	.equ	song_283_rev, 0
	.equ	song_283_mvl, 127
	.equ	song_283_key, 0
	.equ	song_283_tbs, 1
	.equ	song_283_exg, 0
	.equ	song_283_cmp, 1

	.section .rodata
	.global	song_283
	.align	2

@********************** Track  1 **********************@

song_283_1:
	.byte	KEYSH , song_283_key+0
	.byte	TEMPO , 120*song_283_tbs/2
	.byte		VOICE , 35
	.byte		VOL   , 127*song_283_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_283:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_283_pri	@ Priority
	.byte	song_283_rev	@ Reverb.

	.word	song_283_grp

	.word	song_283_1

	.end
