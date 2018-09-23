	.include "MPlayDef.s"

	.equ	song_298_grp, voicegroup112
	.equ	song_298_pri, 4
	.equ	song_298_rev, 0
	.equ	song_298_mvl, 127
	.equ	song_298_key, 0
	.equ	song_298_tbs, 1
	.equ	song_298_exg, 0
	.equ	song_298_cmp, 1

	.section .rodata
	.global	song_298
	.align	2

@********************** Track  1 **********************@

song_298_1:
	.byte	KEYSH , song_298_key+0
	.byte	TEMPO , 120*song_298_tbs/2
	.byte		VOICE , 50
	.byte		VOL   , 127*song_298_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_298:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_298_pri	@ Priority
	.byte	song_298_rev	@ Reverb.

	.word	song_298_grp

	.word	song_298_1

	.end
