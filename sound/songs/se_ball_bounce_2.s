	.include "MPlayDef.s"

	.equ	se_ball_bounce_2_grp, voicegroup111
	.equ	se_ball_bounce_2_pri, 4
	.equ	se_ball_bounce_2_rev, reverb_set+50
	.equ	se_ball_bounce_2_mvl, 127
	.equ	se_ball_bounce_2_key, 0
	.equ	se_ball_bounce_2_tbs, 1
	.equ	se_ball_bounce_2_exg, 0
	.equ	se_ball_bounce_2_cmp, 1

	.section .rodata
	.global	se_ball_bounce_2
	.align	2

@********************** Track  1 **********************@

se_ball_bounce_2_1:
	.byte	KEYSH , se_ball_bounce_2_key+0
	.byte	TEMPO , 150*se_ball_bounce_2_tbs/2
	.byte		VOICE , 16
	.byte		VOL   , 100*se_ball_bounce_2_mvl/mxv
	.byte		BEND  , c_v+1
	.byte		N12   , Fn4 , v100
	.byte	W12
	.byte	FINE

@********************** Track  2 **********************@

se_ball_bounce_2_2:
	.byte	KEYSH , se_ball_bounce_2_key+0
	.byte		VOICE , 17
	.byte		VOL   , 100*se_ball_bounce_2_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N09   , Fn4 , v088
	.byte	W12
	.byte	FINE

@******************************************************@
	.align	2

se_ball_bounce_2:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_ball_bounce_2_pri	@ Priority
	.byte	se_ball_bounce_2_rev	@ Reverb.

	.word	se_ball_bounce_2_grp

	.word	se_ball_bounce_2_1
	.word	se_ball_bounce_2_2

	.end
