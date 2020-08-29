	.include "MPlayDef.s"

	.equ	se_ball_bounce_1_grp, voicegroup111
	.equ	se_ball_bounce_1_pri, 4
	.equ	se_ball_bounce_1_rev, reverb_set+50
	.equ	se_ball_bounce_1_mvl, 127
	.equ	se_ball_bounce_1_key, 0
	.equ	se_ball_bounce_1_tbs, 1
	.equ	se_ball_bounce_1_exg, 0
	.equ	se_ball_bounce_1_cmp, 1

	.section .rodata
	.global	se_ball_bounce_1
	.align	2

@********************** Track  1 **********************@

se_ball_bounce_1_1:
	.byte	KEYSH , se_ball_bounce_1_key+0
	.byte	TEMPO , 150*se_ball_bounce_1_tbs/2
	.byte		VOICE , 16
	.byte		VOL   , 100*se_ball_bounce_1_mvl/mxv
	.byte		BEND  , c_v+1
	.byte		N12   , Fn4 , v112
	.byte	W12
	.byte	FINE

@********************** Track  2 **********************@

se_ball_bounce_1_2:
	.byte	KEYSH , se_ball_bounce_1_key+0
	.byte		VOICE , 17
	.byte		VOL   , 100*se_ball_bounce_1_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N09   , Fn4 , v100
	.byte	W12
	.byte	FINE

@******************************************************@
	.align	2

se_ball_bounce_1:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_ball_bounce_1_pri	@ Priority
	.byte	se_ball_bounce_1_rev	@ Reverb.

	.word	se_ball_bounce_1_grp

	.word	se_ball_bounce_1_1
	.word	se_ball_bounce_1_2

	.end
