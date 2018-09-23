	.include "MPlayDef.s"

	.equ	song_251_grp, voicegroup112
	.equ	song_251_pri, 4
	.equ	song_251_rev, 0
	.equ	song_251_mvl, 127
	.equ	song_251_key, 0
	.equ	song_251_tbs, 1
	.equ	song_251_exg, 0
	.equ	song_251_cmp, 1

	.section .rodata
	.global	song_251
	.align	2

@********************** Track  1 **********************@

song_251_1:
	.byte	KEYSH , song_251_key+0
	.byte	TEMPO , 120*song_251_tbs/2
	.byte		VOICE , 3
	.byte		VOL   , 127*song_251_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_251:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_251_pri	@ Priority
	.byte	song_251_rev	@ Reverb.

	.word	song_251_grp

	.word	song_251_1

	.end
