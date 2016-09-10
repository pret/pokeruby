	.include "MPlayDef.s"

	.equ	song_262_grp, voicegroup_84549F0
	.equ	song_262_pri, 4
	.equ	song_262_rev, 0
	.equ	song_262_mvl, 127
	.equ	song_262_key, 0
	.equ	song_262_tbs, 1
	.equ	song_262_exg, 0
	.equ	song_262_cmp, 1

	.section .rodata
	.global	song_262
	.align	2

@********************** Track  1 **********************@

song_262_1:
	.byte	KEYSH , song_262_key+0
	.byte	TEMPO , 120*song_262_tbs/2
	.byte		VOICE , 14
	.byte		VOL   , 127*song_262_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_262:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_262_pri	@ Priority
	.byte	song_262_rev	@ Reverb.

	.word	song_262_grp

	.word	song_262_1

	.end
