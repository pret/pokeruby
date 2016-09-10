	.include "MPlayDef.s"

	.equ	song_281_grp, voicegroup_84549F0
	.equ	song_281_pri, 4
	.equ	song_281_rev, 0
	.equ	song_281_mvl, 127
	.equ	song_281_key, 0
	.equ	song_281_tbs, 1
	.equ	song_281_exg, 0
	.equ	song_281_cmp, 1

	.section .rodata
	.global	song_281
	.align	2

@********************** Track  1 **********************@

song_281_1:
	.byte	KEYSH , song_281_key+0
	.byte	TEMPO , 120*song_281_tbs/2
	.byte		VOICE , 33
	.byte		VOL   , 127*song_281_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_281:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_281_pri	@ Priority
	.byte	song_281_rev	@ Reverb.

	.word	song_281_grp

	.word	song_281_1

	.end
