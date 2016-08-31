	.include "MPlayDef.s"

	.equ	song_259_grp, voicegroup_84549F0
	.equ	song_259_pri, 4
	.equ	song_259_rev, 0
	.equ	song_259_mvl, 127
	.equ	song_259_key, 0
	.equ	song_259_tbs, 1
	.equ	song_259_exg, 0
	.equ	song_259_cmp, 1

	.section .rodata
	.global	song_259
	.align	2

@********************** Track  1 **********************@

song_259_1:
	.byte	KEYSH , song_259_key+0
	.byte	TEMPO , 120*song_259_tbs/2
	.byte		VOICE , 11
	.byte		VOL   , 127*song_259_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_259:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_259_pri	@ Priority
	.byte	song_259_rev	@ Reverb.

	.word	song_259_grp

	.word	song_259_1

	.end
