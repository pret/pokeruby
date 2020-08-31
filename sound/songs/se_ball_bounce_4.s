	.include "MPlayDef.s"

	.equ	se_ball_bounce_4_grp, voicegroup111
	.equ	se_ball_bounce_4_pri, 4
	.equ	se_ball_bounce_4_rev, reverb_set+50
	.equ	se_ball_bounce_4_mvl, 127
	.equ	se_ball_bounce_4_key, 0
	.equ	se_ball_bounce_4_tbs, 1
	.equ	se_ball_bounce_4_exg, 0
	.equ	se_ball_bounce_4_cmp, 1

	.section .rodata
	.global	se_ball_bounce_4
	.align	2

@********************** Track  1 **********************@

se_ball_bounce_4_1:
	.byte	KEYSH , se_ball_bounce_4_key+0
	.byte	TEMPO , 150*se_ball_bounce_4_tbs/2
	.byte		VOICE , 16
	.byte		VOL   , 100*se_ball_bounce_4_mvl/mxv
	.byte		BEND  , c_v+1
	.byte		N12   , Fn4 , v076
	.byte	W12
	.byte	FINE

@********************** Track  2 **********************@

se_ball_bounce_4_2:
	.byte	KEYSH , se_ball_bounce_4_key+0
	.byte		VOICE , 17
	.byte		VOL   , 100*se_ball_bounce_4_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N09   , Fn4 , v056
	.byte	W12
	.byte	FINE

@******************************************************@
	.align	2

se_ball_bounce_4:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_ball_bounce_4_pri	@ Priority
	.byte	se_ball_bounce_4_rev	@ Reverb.

	.word	se_ball_bounce_4_grp

	.word	se_ball_bounce_4_1
	.word	se_ball_bounce_4_2

	.end
