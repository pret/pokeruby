	.include "MPlayDef.s"

	.equ	se_use_item_grp, voicegroup110
	.equ	se_use_item_pri, 5
	.equ	se_use_item_rev, reverb_set+50
	.equ	se_use_item_mvl, 127
	.equ	se_use_item_key, 0
	.equ	se_use_item_tbs, 1
	.equ	se_use_item_exg, 0
	.equ	se_use_item_cmp, 1

	.section .rodata
	.global	se_use_item
	.align	2

@********************** Track  1 **********************@

se_use_item_1:
	.byte	KEYSH , se_use_item_key+0
	.byte	TEMPO , 132*se_use_item_tbs/2
	.byte		VOICE , 91
	.byte		VOL   , 100*se_use_item_mvl/mxv
	.byte		BEND  , c_v-6
	.byte		N02   , Cn3 , v112
	.byte	W04
	.byte		N02   
	.byte	W04
	.byte		VOICE , 90
	.byte		N15   
	.byte	W16
	.byte	FINE

@******************************************************@
	.align	2

se_use_item:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_use_item_pri	@ Priority
	.byte	se_use_item_rev	@ Reverb.

	.word	se_use_item_grp

	.word	se_use_item_1

	.end
