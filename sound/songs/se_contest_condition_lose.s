	.include "MPlayDef.s"

	.equ	se_contest_condition_lose_grp, voicegroup110
	.equ	se_contest_condition_lose_pri, 4
	.equ	se_contest_condition_lose_rev, reverb_set+50
	.equ	se_contest_condition_lose_mvl, 127
	.equ	se_contest_condition_lose_key, 0
	.equ	se_contest_condition_lose_tbs, 1
	.equ	se_contest_condition_lose_exg, 0
	.equ	se_contest_condition_lose_cmp, 1

	.section .rodata
	.global	se_contest_condition_lose
	.align	2

@********************** Track  1 **********************@

se_contest_condition_lose_1:
	.byte	KEYSH , se_contest_condition_lose_key+0
	.byte	TEMPO , 150*se_contest_condition_lose_tbs/2
	.byte		VOICE , 126
	.byte		VOL   , 110*se_contest_condition_lose_mvl/mxv
	.byte		N01   , An2 , v112
	.byte	W01
	.byte		        En3 
	.byte	W01
	.byte		        Gn3 
	.byte	W01
	.byte	W02
	.byte		N02   , Cn3 , v092
	.byte	W01
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_contest_condition_lose:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_contest_condition_lose_pri	@ Priority
	.byte	se_contest_condition_lose_rev	@ Reverb.

	.word	se_contest_condition_lose_grp

	.word	se_contest_condition_lose_1

	.end
