	.include "MPlayDef.s"

	.equ	song_257_grp, voicegroup112
	.equ	song_257_pri, 4
	.equ	song_257_rev, 0
	.equ	song_257_mvl, 127
	.equ	song_257_key, 0
	.equ	song_257_tbs, 1
	.equ	song_257_exg, 0
	.equ	song_257_cmp, 1

	.section .rodata
	.global	song_257
	.align	2

@********************** Track  1 **********************@

song_257_1:
	.byte	KEYSH , song_257_key+0
	.byte	TEMPO , 120*song_257_tbs/2
	.byte		VOICE , 9
	.byte		VOL   , 127*song_257_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_257:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_257_pri	@ Priority
	.byte	song_257_rev	@ Reverb.

	.word	song_257_grp

	.word	song_257_1

	.end
