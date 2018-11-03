	.include "MPlayDef.s"

	.equ	song_248_grp, voicegroup112
	.equ	song_248_pri, 4
	.equ	song_248_rev, 0
	.equ	song_248_mvl, 127
	.equ	song_248_key, 0
	.equ	song_248_tbs, 1
	.equ	song_248_exg, 0
	.equ	song_248_cmp, 1

	.section .rodata
	.global	song_248
	.align	2

@********************** Track  1 **********************@

song_248_1:
	.byte	KEYSH , song_248_key+0
	.byte	TEMPO , 120*song_248_tbs/2
	.byte		VOICE , 0
	.byte		VOL   , 127*song_248_mvl/mxv
	.byte		N44   , Cn3 , v127
	.byte	W44
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

song_248:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_248_pri	@ Priority
	.byte	song_248_rev	@ Reverb.

	.word	song_248_grp

	.word	song_248_1

	.end
