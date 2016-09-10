	.include "MPlayDef.s"

	.equ	song_256_grp, voicegroup_84549F0
	.equ	song_256_pri, 4
	.equ	song_256_rev, 0
	.equ	song_256_mvl, 127
	.equ	song_256_key, 0
	.equ	song_256_tbs, 1
	.equ	song_256_exg, 0
	.equ	song_256_cmp, 1

	.section .rodata
	.global	song_256
	.align	2

@********************** Track  1 **********************@

song_256_1:
	.byte	KEYSH , song_256_key+0
	.byte	TEMPO , 120*song_256_tbs/2
	.byte		VOICE , 8
	.byte		VOL   , 127*song_256_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_256:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_256_pri	@ Priority
	.byte	song_256_rev	@ Reverb.

	.word	song_256_grp

	.word	song_256_1

	.end
