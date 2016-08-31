	.include "MPlayDef.s"

	.equ	song_286_grp, voicegroup_84549F0
	.equ	song_286_pri, 4
	.equ	song_286_rev, 0
	.equ	song_286_mvl, 127
	.equ	song_286_key, 0
	.equ	song_286_tbs, 1
	.equ	song_286_exg, 0
	.equ	song_286_cmp, 1

	.section .rodata
	.global	song_286
	.align	2

@********************** Track  1 **********************@

song_286_1:
	.byte	KEYSH , song_286_key+0
	.byte	TEMPO , 120*song_286_tbs/2
	.byte		VOICE , 38
	.byte		VOL   , 127*song_286_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_286:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_286_pri	@ Priority
	.byte	song_286_rev	@ Reverb.

	.word	song_286_grp

	.word	song_286_1

	.end
