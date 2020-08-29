	.include "MPlayDef.s"

	.equ	se_ball_trade_grp, voicegroup110
	.equ	se_ball_trade_pri, 5
	.equ	se_ball_trade_rev, reverb_set+50
	.equ	se_ball_trade_mvl, 127
	.equ	se_ball_trade_key, 0
	.equ	se_ball_trade_tbs, 1
	.equ	se_ball_trade_exg, 0
	.equ	se_ball_trade_cmp, 1

	.section .rodata
	.global	se_ball_trade
	.align	2

@********************** Track  1 **********************@

se_ball_trade_1:
	.byte	KEYSH , se_ball_trade_key+0
	.byte		VOICE , 13
	.byte		BENDR , 12
	.byte		VOL   , 12*se_ball_trade_mvl/mxv
	.byte		BEND  , c_v+49
	.byte		N06   , Gn4 , v080
	.byte	W01
	.byte		VOL   , 44*se_ball_trade_mvl/mxv
	.byte		BEND  , c_v+22
	.byte	W01
	.byte		VOL   , 75*se_ball_trade_mvl/mxv
	.byte		BEND  , c_v+20
	.byte	W01
	.byte		VOL   , 87*se_ball_trade_mvl/mxv
	.byte		BEND  , c_v+33
	.byte	W01
	.byte		VOL   , 100*se_ball_trade_mvl/mxv
	.byte		BEND  , c_v+54
	.byte	W01
	.byte		        c_v+63
	.byte	W01
	.byte	W03
	.byte		N03   , Gn4 , v040
	.byte	W03
	.byte	FINE

@********************** Track  2 **********************@

se_ball_trade_2:
	.byte	KEYSH , se_ball_trade_key+0
	.byte		VOICE , 123
	.byte		VOL   , 59*se_ball_trade_mvl/mxv
	.byte		N06   , Gs4 , v052
	.byte	W01
	.byte		VOL   , 72*se_ball_trade_mvl/mxv
	.byte	W01
	.byte		        90*se_ball_trade_mvl/mxv
	.byte	W01
	.byte		        100*se_ball_trade_mvl/mxv
	.byte	W03
	.byte	W03
	.byte		N03   , Gs4 , v024
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_ball_trade:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_ball_trade_pri	@ Priority
	.byte	se_ball_trade_rev	@ Reverb.

	.word	se_ball_trade_grp

	.word	se_ball_trade_1
	.word	se_ball_trade_2

	.end
