	.include "MPlayDef.s"

	.equ	song_272_grp, voicegroup112
	.equ	song_272_pri, 4
	.equ	song_272_rev, 0
	.equ	song_272_mvl, 127
	.equ	song_272_key, 0
	.equ	song_272_tbs, 1
	.equ	song_272_exg, 0
	.equ	song_272_cmp, 1

	.section .rodata
	.global	song_272
	.align	2

@********************** Track  1 **********************@

song_272_1:
	.byte	KEYSH , song_272_key+0
	.byte	TEMPO , 120*song_272_tbs/2
	.byte		VOICE , 24
	.byte		VOL   , 127*song_272_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_272:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_272_pri	@ Priority
	.byte	song_272_rev	@ Reverb.

	.word	song_272_grp

	.word	song_272_1

	.end
