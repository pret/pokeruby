	.include "MPlayDef.s"

	.equ	song_287_grp, voicegroup_84549F0
	.equ	song_287_pri, 4
	.equ	song_287_rev, 0
	.equ	song_287_mvl, 127
	.equ	song_287_key, 0
	.equ	song_287_tbs, 1
	.equ	song_287_exg, 0
	.equ	song_287_cmp, 1

	.section .rodata
	.global	song_287
	.align	2

@********************** Track  1 **********************@

song_287_1:
	.byte	KEYSH , song_287_key+0
	.byte	TEMPO , 120*song_287_tbs/2
	.byte		VOICE , 39
	.byte		VOL   , 127*song_287_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_287:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_287_pri	@ Priority
	.byte	song_287_rev	@ Reverb.

	.word	song_287_grp

	.word	song_287_1

	.end
