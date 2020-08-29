	.include "MPlayDef.s"

	.equ	se_switch_grp, voicegroup110
	.equ	se_switch_pri, 4
	.equ	se_switch_rev, reverb_set+50
	.equ	se_switch_mvl, 127
	.equ	se_switch_key, 0
	.equ	se_switch_tbs, 1
	.equ	se_switch_exg, 0
	.equ	se_switch_cmp, 1

	.section .rodata
	.global	se_switch
	.align	2

@********************** Track  1 **********************@

se_switch_1:
	.byte	KEYSH , se_switch_key+0
	.byte	TEMPO , 150*se_switch_tbs/2
	.byte		VOICE , 122
	.byte		VOL   , 100*se_switch_mvl/mxv
	.byte		N01   , Ds3 , v127
	.byte	W02
	.byte		VOICE , 126
	.byte		N01   , Gs4 
	.byte	W01
	.byte	W03
	.byte	W01
	.byte		        Gs4 , v088
	.byte	W02
	.byte	FINE

@******************************************************@
	.align	2

se_switch:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_switch_pri	@ Priority
	.byte	se_switch_rev	@ Reverb.

	.word	se_switch_grp

	.word	se_switch_1

	.end
