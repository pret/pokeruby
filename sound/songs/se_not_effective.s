	.include "MPlayDef.s"

	.equ	se_not_effective_grp, voicegroup110
	.equ	se_not_effective_pri, 5
	.equ	se_not_effective_rev, reverb_set+50
	.equ	se_not_effective_mvl, 127
	.equ	se_not_effective_key, 0
	.equ	se_not_effective_tbs, 1
	.equ	se_not_effective_exg, 0
	.equ	se_not_effective_cmp, 1

	.section .rodata
	.global	se_not_effective
	.align	2

@********************** Track  1 **********************@

se_not_effective_1:
	.byte	KEYSH , se_not_effective_key+0
	.byte	TEMPO , 90*se_not_effective_tbs/2
	.byte		VOICE , 127
	.byte		VOL   , 110*se_not_effective_mvl/mxv
	.byte		N03   , Gn2 , v100
	.byte	W03
	.byte		N06   , As2 
	.byte	W03
	.byte	W03
	.byte	FINE

@********************** Track  2 **********************@

se_not_effective_2:
	.byte	KEYSH , se_not_effective_key+0
	.byte		VOICE , 0
	.byte		VOL   , 110*se_not_effective_mvl/mxv
	.byte		N09   , As1 , v127
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_not_effective:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_not_effective_pri	@ Priority
	.byte	se_not_effective_rev	@ Reverb.

	.word	se_not_effective_grp

	.word	se_not_effective_1
	.word	se_not_effective_2

	.end
