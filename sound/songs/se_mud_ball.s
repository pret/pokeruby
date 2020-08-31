	.include "MPlayDef.s"

	.equ	se_mud_ball_grp, voicegroup111
	.equ	se_mud_ball_pri, 4
	.equ	se_mud_ball_rev, reverb_set+50
	.equ	se_mud_ball_mvl, 127
	.equ	se_mud_ball_key, 0
	.equ	se_mud_ball_tbs, 1
	.equ	se_mud_ball_exg, 0
	.equ	se_mud_ball_cmp, 1

	.section .rodata
	.global	se_mud_ball
	.align	2

@********************** Track  1 **********************@

se_mud_ball_1:
	.byte	KEYSH , se_mud_ball_key+0
	.byte	TEMPO , 150*se_mud_ball_tbs/2
	.byte		VOICE , 36
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*se_mud_ball_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N01   , Cn4 , v112
	.byte	W01
	.byte		VOICE , 26
	.byte	W01
	.byte		N01   , Fn4 , v127
	.byte	W01
	.byte	W01
	.byte		VOICE , 36
	.byte	W02
	.byte		N01   , Cn3 , v056
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_mud_ball:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_mud_ball_pri	@ Priority
	.byte	se_mud_ball_rev	@ Reverb.

	.word	se_mud_ball_grp

	.word	se_mud_ball_1

	.end
