	.include "MPlayDef.s"

	.equ	se_super_effective_grp, voicegroup110
	.equ	se_super_effective_pri, 5
	.equ	se_super_effective_rev, reverb_set+50
	.equ	se_super_effective_mvl, 127
	.equ	se_super_effective_key, 0
	.equ	se_super_effective_tbs, 1
	.equ	se_super_effective_exg, 0
	.equ	se_super_effective_cmp, 1

	.section .rodata
	.global	se_super_effective
	.align	2

@********************** Track  1 **********************@

se_super_effective_1:
	.byte	KEYSH , se_super_effective_key+0
	.byte	TEMPO , 90*se_super_effective_tbs/2
	.byte		VOICE , 125
	.byte		VOL   , 110*se_super_effective_mvl/mxv
	.byte		N03   , Cn3 , v100
	.byte	W03
	.byte		        An2 
	.byte	W03
	.byte		        Cn3 
	.byte	W03
	.byte		N06   , Gn3 , v072
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v052
	.byte	W03
	.byte		N06   , Gn3 , v048
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v028
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v012
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte	FINE

@********************** Track  2 **********************@

se_super_effective_2:
	.byte	KEYSH , se_super_effective_key+0
	.byte		VOICE , 0
	.byte		VOL   , 110*se_super_effective_mvl/mxv
	.byte		N03   , Cn4 , v127
	.byte	W03
	.byte		        Cn3 
	.byte	W03
	.byte		        Cn4 
	.byte	W03
	.byte		N06   , Gn3 , v088
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v064
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v044
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v028
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v012
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_super_effective:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_super_effective_pri	@ Priority
	.byte	se_super_effective_rev	@ Reverb.

	.word	se_super_effective_grp

	.word	se_super_effective_1
	.word	se_super_effective_2

	.end
