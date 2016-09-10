	.include "MPlayDef.s"

	.equ	song_266_grp, voicegroup_84549F0
	.equ	song_266_pri, 4
	.equ	song_266_rev, 0
	.equ	song_266_mvl, 127
	.equ	song_266_key, 0
	.equ	song_266_tbs, 1
	.equ	song_266_exg, 0
	.equ	song_266_cmp, 1

	.section .rodata
	.global	song_266
	.align	2

@********************** Track  1 **********************@

song_266_1:
	.byte	KEYSH , song_266_key+0
	.byte	TEMPO , 120*song_266_tbs/2
	.byte		VOICE , 18
	.byte		VOL   , 127*song_266_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_266:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_266_pri	@ Priority
	.byte	song_266_rev	@ Reverb.

	.word	song_266_grp

	.word	song_266_1

	.end
