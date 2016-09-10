	.include "MPlayDef.s"

	.equ	song_285_grp, voicegroup_84549F0
	.equ	song_285_pri, 4
	.equ	song_285_rev, 0
	.equ	song_285_mvl, 127
	.equ	song_285_key, 0
	.equ	song_285_tbs, 1
	.equ	song_285_exg, 0
	.equ	song_285_cmp, 1

	.section .rodata
	.global	song_285
	.align	2

@********************** Track  1 **********************@

song_285_1:
	.byte	KEYSH , song_285_key+0
	.byte	TEMPO , 120*song_285_tbs/2
	.byte		VOICE , 37
	.byte		VOL   , 127*song_285_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_285_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_285_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_285:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_285_pri	@ Priority
	.byte	song_285_rev	@ Reverb.

	.word	song_285_grp

	.word	song_285_1

	.end
