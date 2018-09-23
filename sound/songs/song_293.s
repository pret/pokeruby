	.include "MPlayDef.s"

	.equ	song_293_grp, voicegroup112
	.equ	song_293_pri, 4
	.equ	song_293_rev, 0
	.equ	song_293_mvl, 127
	.equ	song_293_key, 0
	.equ	song_293_tbs, 1
	.equ	song_293_exg, 0
	.equ	song_293_cmp, 1

	.section .rodata
	.global	song_293
	.align	2

@********************** Track  1 **********************@

song_293_1:
	.byte	KEYSH , song_293_key+0
	.byte	TEMPO , 120*song_293_tbs/2
	.byte		VOICE , 45
	.byte		VOL   , 127*song_293_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_293:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_293_pri	@ Priority
	.byte	song_293_rev	@ Reverb.

	.word	song_293_grp

	.word	song_293_1

	.end
