	.include "MPlayDef.s"

	.equ	se_ball_tray_exit_grp, voicegroup110
	.equ	se_ball_tray_exit_pri, 5
	.equ	se_ball_tray_exit_rev, reverb_set+50
	.equ	se_ball_tray_exit_mvl, 127
	.equ	se_ball_tray_exit_key, 0
	.equ	se_ball_tray_exit_tbs, 1
	.equ	se_ball_tray_exit_exg, 0
	.equ	se_ball_tray_exit_cmp, 1

	.section .rodata
	.global	se_ball_tray_exit
	.align	2

@********************** Track  1 **********************@

se_ball_tray_exit_1:
	.byte	KEYSH , se_ball_tray_exit_key+0
	.byte	TEMPO , 150*se_ball_tray_exit_tbs/2
	.byte		VOICE , 119
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*se_ball_tray_exit_mvl/mxv
	.byte		BEND  , c_v+1
	.byte		N02   , Gs4 , v040
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_ball_tray_exit:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_ball_tray_exit_pri	@ Priority
	.byte	se_ball_tray_exit_rev	@ Reverb.

	.word	se_ball_tray_exit_grp

	.word	se_ball_tray_exit_1

	.end
