	.include "MPlayDef.s"

	.equ	se_ball_throw_grp, voicegroup111
	.equ	se_ball_throw_pri, 5
	.equ	se_ball_throw_rev, reverb_set+50
	.equ	se_ball_throw_mvl, 127
	.equ	se_ball_throw_key, 0
	.equ	se_ball_throw_tbs, 1
	.equ	se_ball_throw_exg, 0
	.equ	se_ball_throw_cmp, 1

	.section .rodata
	.global	se_ball_throw
	.align	2

@********************** Track  1 **********************@

se_ball_throw_1:
	.byte	KEYSH , se_ball_throw_key+0
	.byte	TEMPO , 150*se_ball_throw_tbs/2
	.byte		VOICE , 22
	.byte		BENDR , 12
	.byte		VOL   , 120*se_ball_throw_mvl/mxv
	.byte		BEND  , c_v+12
	.byte		N06   , An2 , v127
	.byte	W03
	.byte		VOL   , 78*se_ball_throw_mvl/mxv
	.byte		BEND  , c_v+20
	.byte	W03
	.byte		VOL   , 120*se_ball_throw_mvl/mxv
	.byte		BEND  , c_v+36
	.byte		N18   , Cn3 
	.byte	W02
	.byte		BEND  , c_v+35
	.byte	W03
	.byte		        c_v+32
	.byte	W02
	.byte		        c_v+26
	.byte	W03
	.byte		VOL   , 102*se_ball_throw_mvl/mxv
	.byte		BEND  , c_v+18
	.byte	W02
	.byte		VOL   , 68*se_ball_throw_mvl/mxv
	.byte		BEND  , c_v+7
	.byte	W03
	.byte		VOL   , 34*se_ball_throw_mvl/mxv
	.byte		BEND  , c_v-9
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_ball_throw:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_ball_throw_pri	@ Priority
	.byte	se_ball_throw_rev	@ Reverb.

	.word	se_ball_throw_grp

	.word	se_ball_throw_1

	.end
