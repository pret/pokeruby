	.include "MPlayDef.s"

	.equ	se_success_grp, voicegroup110
	.equ	se_success_pri, 4
	.equ	se_success_rev, reverb_set+50
	.equ	se_success_mvl, 127
	.equ	se_success_key, 0
	.equ	se_success_tbs, 1
	.equ	se_success_exg, 0
	.equ	se_success_cmp, 1

	.section .rodata
	.global	se_success
	.align	2

@********************** Track  1 **********************@

se_success_1:
	.byte	KEYSH , se_success_key+0
	.byte	TEMPO , 240*se_success_tbs/2
	.byte		VOICE , 5
	.byte		BENDR , 12
	.byte		VOL   , 80*se_success_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N06   , Gn5 , v127
	.byte	W06
	.byte		N18   , Ds5 
	.byte	W18
	.byte	FINE

@******************************************************@
	.align	2

se_success:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_success_pri	@ Priority
	.byte	se_success_rev	@ Reverb.

	.word	se_success_grp

	.word	se_success_1

	.end
