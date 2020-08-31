	.include "MPlayDef.s"

	.equ	se_contest_heart_grp, voicegroup111
	.equ	se_contest_heart_pri, 5
	.equ	se_contest_heart_rev, reverb_set+50
	.equ	se_contest_heart_mvl, 127
	.equ	se_contest_heart_key, 0
	.equ	se_contest_heart_tbs, 1
	.equ	se_contest_heart_exg, 0
	.equ	se_contest_heart_cmp, 1

	.section .rodata
	.global	se_contest_heart
	.align	2

@********************** Track  1 **********************@

se_contest_heart_1:
	.byte	KEYSH , se_contest_heart_key+0
	.byte	TEMPO , 150*se_contest_heart_tbs/2
	.byte		VOICE , 14
	.byte		VOL   , 90*se_contest_heart_mvl/mxv
	.byte		BEND  , c_v-7
	.byte		N02   , Cn5 , v112
	.byte	W02
	.byte		N09   , Gn4 
	.byte	W04
	.byte	W06
	.byte	FINE

@******************************************************@
	.align	2

se_contest_heart:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_contest_heart_pri	@ Priority
	.byte	se_contest_heart_rev	@ Reverb.

	.word	se_contest_heart_grp

	.word	se_contest_heart_1

	.end
