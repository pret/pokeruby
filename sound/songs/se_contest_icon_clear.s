	.include "MPlayDef.s"

	.equ	se_contest_icon_clear_grp, voicegroup111
	.equ	se_contest_icon_clear_pri, 5
	.equ	se_contest_icon_clear_rev, reverb_set+50
	.equ	se_contest_icon_clear_mvl, 127
	.equ	se_contest_icon_clear_key, 0
	.equ	se_contest_icon_clear_tbs, 1
	.equ	se_contest_icon_clear_exg, 0
	.equ	se_contest_icon_clear_cmp, 1

	.section .rodata
	.global	se_contest_icon_clear
	.align	2

@********************** Track  1 **********************@

se_contest_icon_clear_1:
	.byte	KEYSH , se_contest_icon_clear_key+0
	.byte	TEMPO , 150*se_contest_icon_clear_tbs/2
	.byte		VOICE , 36
	.byte		VOL   , 49*se_contest_icon_clear_mvl/mxv
	.byte		BEND  , c_v-64
	.byte		N03   , Cn6 , v112
	.byte	W01
	.byte		VOL   , 68*se_contest_icon_clear_mvl/mxv
	.byte		BEND  , c_v-1
	.byte	W01
	.byte		VOL   , 90*se_contest_icon_clear_mvl/mxv
	.byte		BEND  , c_v+63
	.byte	W01
	.byte		VOL   , 69*se_contest_icon_clear_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N02   , Cn6 , v040
	.byte	W01
	.byte		VOL   , 90*se_contest_icon_clear_mvl/mxv
	.byte		BEND  , c_v+63
	.byte	W02
	.byte	FINE

@******************************************************@
	.align	2

se_contest_icon_clear:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_contest_icon_clear_pri	@ Priority
	.byte	se_contest_icon_clear_rev	@ Reverb.

	.word	se_contest_icon_clear_grp

	.word	se_contest_icon_clear_1

	.end
