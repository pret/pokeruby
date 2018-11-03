	.include "MPlayDef.s"

	.equ	song_295_grp, voicegroup112
	.equ	song_295_pri, 4
	.equ	song_295_rev, 0
	.equ	song_295_mvl, 127
	.equ	song_295_key, 0
	.equ	song_295_tbs, 1
	.equ	song_295_exg, 0
	.equ	song_295_cmp, 1

	.section .rodata
	.global	song_295
	.align	2

@********************** Track  1 **********************@

song_295_1:
	.byte	KEYSH , song_295_key+0
	.byte	TEMPO , 120*song_295_tbs/2
	.byte		VOICE , 47
	.byte		VOL   , 127*song_295_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_295:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_295_pri	@ Priority
	.byte	song_295_rev	@ Reverb.

	.word	song_295_grp

	.word	song_295_1

	.end
