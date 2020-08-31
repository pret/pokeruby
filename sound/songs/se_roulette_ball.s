	.include "MPlayDef.s"

	.equ	se_roulette_ball_grp, voicegroup111
	.equ	se_roulette_ball_pri, 2
	.equ	se_roulette_ball_rev, reverb_set+50
	.equ	se_roulette_ball_mvl, 127
	.equ	se_roulette_ball_key, 0
	.equ	se_roulette_ball_tbs, 1
	.equ	se_roulette_ball2xg, 0
	.equ	se_roulette_ball_cmp, 1

	.section .rodata
	.global	se_roulette_ball
	.align	2

@********************** Track  1 **********************@

se_roulette_ball_1:
	.byte	KEYSH , se_roulette_ball_key+0
	.byte	TEMPO , 150*se_roulette_ball_tbs/2
	.byte		VOICE , 63
	.byte		VOL   , 110*se_roulette_ball_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		TIE   , Dn3 , v127
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		EOT   
	.byte	FINE

@******************************************************@
	.align	2

se_roulette_ball:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_roulette_ball_pri	@ Priority
	.byte	se_roulette_ball_rev	@ Reverb.

	.word	se_roulette_ball_grp

	.word	se_roulette_ball_1

	.end
