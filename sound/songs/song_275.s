	.include "MPlayDef.s"

	.equ	song_275_grp, voicegroup_84549F0
	.equ	song_275_pri, 4
	.equ	song_275_rev, 0
	.equ	song_275_mvl, 127
	.equ	song_275_key, 0
	.equ	song_275_tbs, 1
	.equ	song_275_exg, 0
	.equ	song_275_cmp, 1

	.section .rodata
	.global	song_275
	.align	2

@********************** Track  1 **********************@

song_275_1:
	.byte	KEYSH , song_275_key+0
	.byte	TEMPO , 120*song_275_tbs/2
	.byte		VOICE , 27
	.byte		VOL   , 127*song_275_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_275:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_275_pri	@ Priority
	.byte	song_275_rev	@ Reverb.

	.word	song_275_grp

	.word	song_275_1

	.end
