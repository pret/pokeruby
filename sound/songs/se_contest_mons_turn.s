	.include "MPlayDef.s"

	.equ	se_contest_mons_turn_grp, voicegroup111
	.equ	se_contest_mons_turn_pri, 5
	.equ	se_contest_mons_turn_rev, reverb_set+50
	.equ	se_contest_mons_turn_mvl, 127
	.equ	se_contest_mons_turn_key, 0
	.equ	se_contest_mons_turn_tbs, 1
	.equ	se_contest_mons_turn_exg, 0
	.equ	se_contest_mons_turn_cmp, 1

	.section .rodata
	.global	se_contest_mons_turn
	.align	2

@********************** Track  1 **********************@

se_contest_mons_turn_1:
	.byte	KEYSH , se_contest_mons_turn_key+0
	.byte	TEMPO , 150*se_contest_mons_turn_tbs/2
	.byte		VOICE , 14
	.byte		VOL   , 90*se_contest_mons_turn_mvl/mxv
	.byte		BEND  , c_v-7
	.byte		N02   , Cn5 , v112
	.byte	W02
	.byte		        Cn6 
	.byte	W04
	.byte	W01
	.byte		        Cn6 , v060
	.byte	W05
	.byte	W02
	.byte		        Cn5 , v112
	.byte	W02
	.byte		        Cn6 
	.byte	W02
	.byte	W03
	.byte		        Cn6 , v060
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_contest_mons_turn:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_contest_mons_turn_pri	@ Priority
	.byte	se_contest_mons_turn_rev	@ Reverb.

	.word	se_contest_mons_turn_grp

	.word	se_contest_mons_turn_1

	.end
