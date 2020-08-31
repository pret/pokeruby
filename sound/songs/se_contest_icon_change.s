	.include "MPlayDef.s"

	.equ	se_contest_icon_change_grp, voicegroup111
	.equ	se_contest_icon_change_pri, 5
	.equ	se_contest_icon_change_rev, reverb_set+50
	.equ	se_contest_icon_change_mvl, 127
	.equ	se_contest_icon_change_key, 0
	.equ	se_contest_icon_change_tbs, 1
	.equ	se_contest_icon_change_exg, 0
	.equ	se_contest_icon_change_cmp, 1

	.section .rodata
	.global	se_contest_icon_change
	.align	2

@********************** Track  1 **********************@

se_contest_icon_change_1:
	.byte	KEYSH , se_contest_icon_change_key+0
	.byte	TEMPO , 150*se_contest_icon_change_tbs/2
	.byte		VOICE , 2
	.byte		BENDR , 12
	.byte		VOL   , 110*se_contest_icon_change_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		N02   , Gn3 , v112
	.byte	W04
	.byte		        Gn4 , v064
	.byte	W02
	.byte	FINE

@******************************************************@
	.align	2

se_contest_icon_change:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_contest_icon_change_pri	@ Priority
	.byte	se_contest_icon_change_rev	@ Reverb.

	.word	se_contest_icon_change_grp

	.word	se_contest_icon_change_1

	.end
