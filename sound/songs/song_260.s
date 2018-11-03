	.include "MPlayDef.s"

	.equ	song_260_grp, voicegroup112
	.equ	song_260_pri, 4
	.equ	song_260_rev, 0
	.equ	song_260_mvl, 127
	.equ	song_260_key, 0
	.equ	song_260_tbs, 1
	.equ	song_260_exg, 0
	.equ	song_260_cmp, 1

	.section .rodata
	.global	song_260
	.align	2

@********************** Track  1 **********************@

song_260_1:
	.byte	KEYSH , song_260_key+0
	.byte	TEMPO , 120*song_260_tbs/2
	.byte		VOICE , 12
	.byte		VOL   , 127*song_260_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_260:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_260_pri	@ Priority
	.byte	song_260_rev	@ Reverb.

	.word	song_260_grp

	.word	song_260_1

	.end
