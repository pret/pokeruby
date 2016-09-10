	.include "MPlayDef.s"

	.equ	song_253_grp, voicegroup_84549F0
	.equ	song_253_pri, 4
	.equ	song_253_rev, 0
	.equ	song_253_mvl, 127
	.equ	song_253_key, 0
	.equ	song_253_tbs, 1
	.equ	song_253_exg, 0
	.equ	song_253_cmp, 1

	.section .rodata
	.global	song_253
	.align	2

@********************** Track  1 **********************@

song_253_1:
	.byte	KEYSH , song_253_key+0
	.byte	TEMPO , 120*song_253_tbs/2
	.byte		VOICE , 5
	.byte		VOL   , 127*song_253_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_253:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_253_pri	@ Priority
	.byte	song_253_rev	@ Reverb.

	.word	song_253_grp

	.word	song_253_1

	.end
