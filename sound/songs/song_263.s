	.include "MPlayDef.s"

	.equ	song_263_grp, voicegroup_84549F0
	.equ	song_263_pri, 4
	.equ	song_263_rev, 0
	.equ	song_263_mvl, 127
	.equ	song_263_key, 0
	.equ	song_263_tbs, 1
	.equ	song_263_exg, 0
	.equ	song_263_cmp, 1

	.section .rodata
	.global	song_263
	.align	2

@********************** Track  1 **********************@

song_263_1:
	.byte	KEYSH , song_263_key+0
	.byte	TEMPO , 120*song_263_tbs/2
	.byte		VOICE , 15
	.byte		VOL   , 127*song_263_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_263:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_263_pri	@ Priority
	.byte	song_263_rev	@ Reverb.

	.word	song_263_grp

	.word	song_263_1

	.end
