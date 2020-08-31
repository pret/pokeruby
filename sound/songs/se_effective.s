	.include "MPlayDef.s"

	.equ	se_effective_grp, voicegroup110
	.equ	se_effective_pri, 5
	.equ	se_effective_rev, reverb_set+50
	.equ	se_effective_mvl, 127
	.equ	se_effective_key, 0
	.equ	se_effective_tbs, 1
	.equ	se_effective_exg, 0
	.equ	se_effective_cmp, 1

	.section .rodata
	.global	se_effective
	.align	2

@********************** Track  1 **********************@

se_effective_1:
	.byte	KEYSH , se_effective_key+0
	.byte	TEMPO , 90*se_effective_tbs/2
	.byte		VOICE , 125
	.byte		VOL   , 110*se_effective_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N03   , As2 , v100
	.byte	W03
	.byte		BEND  , c_v-33
	.byte		N36   , Ds3 
	.byte	W03
	.byte		BEND  , c_v+0
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	FINE

@********************** Track  2 **********************@

se_effective_2:
	.byte	KEYSH , se_effective_key+0
	.byte		VOICE , 0
	.byte		VOL   , 110*se_effective_mvl/mxv
	.byte		N03   , Cn3 , v127
	.byte	W03
	.byte		N18   
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_effective:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_effective_pri	@ Priority
	.byte	se_effective_rev	@ Reverb.

	.word	se_effective_grp

	.word	se_effective_1
	.word	se_effective_2

	.end
