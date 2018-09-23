	.include "MPlayDef.s"

	.equ	song_289_grp, voicegroup112
	.equ	song_289_pri, 4
	.equ	song_289_rev, 0
	.equ	song_289_mvl, 127
	.equ	song_289_key, 0
	.equ	song_289_tbs, 1
	.equ	song_289_exg, 0
	.equ	song_289_cmp, 1

	.section .rodata
	.global	song_289
	.align	2

@********************** Track  1 **********************@

song_289_1:
	.byte	KEYSH , song_289_key+0
	.byte	TEMPO , 120*song_289_tbs/2
	.byte		VOICE , 41
	.byte		VOL   , 127*song_289_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_289:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_289_pri	@ Priority
	.byte	song_289_rev	@ Reverb.

	.word	song_289_grp

	.word	song_289_1

	.end
