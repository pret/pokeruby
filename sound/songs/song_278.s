	.include "MPlayDef.s"

	.equ	song_278_grp, voicegroup_84549F0
	.equ	song_278_pri, 4
	.equ	song_278_rev, 0
	.equ	song_278_mvl, 127
	.equ	song_278_key, 0
	.equ	song_278_tbs, 1
	.equ	song_278_exg, 0
	.equ	song_278_cmp, 1

	.section .rodata
	.global	song_278
	.align	2

@********************** Track  1 **********************@

song_278_1:
	.byte	KEYSH , song_278_key+0
	.byte	TEMPO , 120*song_278_tbs/2
	.byte		VOICE , 30
	.byte		VOL   , 127*song_278_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_278:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_278_pri	@ Priority
	.byte	song_278_rev	@ Reverb.

	.word	song_278_grp

	.word	song_278_1

	.end
