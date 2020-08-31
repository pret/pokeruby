	.include "MPlayDef.s"

	.equ	se_ball_grp, voicegroup110
	.equ	se_ball_pri, 4
	.equ	se_ball_rev, reverb_set+50
	.equ	se_ball_mvl, 127
	.equ	se_ball_key, 0
	.equ	se_ball_tbs, 1
	.equ	se_ball_exg, 0
	.equ	se_ball_cmp, 1

	.section .rodata
	.global	se_ball
	.align	2

@********************** Track  1 **********************@

se_ball_1:
	.byte	KEYSH , se_ball_key+0
	.byte	TEMPO , 128*se_ball_tbs/2
	.byte		VOICE , 7
	.byte		BENDR , 12
	.byte		VOL   , 70*se_ball_mvl/mxv
	.byte		BEND  , c_v+2
	.byte		N04   , Fn2 , v127
	.byte	W04
	.byte		N01   , Dn3 
	.byte	W02
	.byte		VOICE , 8
	.byte	FINE

@******************************************************@
	.align	2

se_ball:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_ball_pri	@ Priority
	.byte	se_ball_rev	@ Reverb.

	.word	se_ball_grp

	.word	se_ball_1

	.end
