	.include "MPlayDef.s"

	.equ	song_280_grp, voicegroup112
	.equ	song_280_pri, 4
	.equ	song_280_rev, 0
	.equ	song_280_mvl, 127
	.equ	song_280_key, 0
	.equ	song_280_tbs, 1
	.equ	song_280_exg, 0
	.equ	song_280_cmp, 1

	.section .rodata
	.global	song_280
	.align	2

@********************** Track  1 **********************@

song_280_1:
	.byte	KEYSH , song_280_key+0
	.byte	TEMPO , 120*song_280_tbs/2
	.byte		VOICE , 32
	.byte		VOL   , 127*song_280_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_280:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_280_pri	@ Priority
	.byte	song_280_rev	@ Reverb.

	.word	song_280_grp

	.word	song_280_1

	.end
