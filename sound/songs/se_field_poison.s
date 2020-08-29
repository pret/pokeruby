	.include "MPlayDef.s"

	.equ	se_field_poison_grp, voicegroup110
	.equ	se_field_poison_pri, 5
	.equ	se_field_poison_rev, reverb_set+50
	.equ	se_field_poison_mvl, 127
	.equ	se_field_poison_key, 0
	.equ	se_field_poison_tbs, 1
	.equ	se_field_poison_exg, 0
	.equ	se_field_poison_cmp, 1

	.section .rodata
	.global	se_field_poison
	.align	2

@********************** Track  1 **********************@

se_field_poison_1:
	.byte	KEYSH , se_field_poison_key+0
	.byte	TEMPO , 150*se_field_poison_tbs/2
	.byte		VOICE , 16
	.byte		BENDR , 12
	.byte		VOL   , 110*se_field_poison_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N02   , Ds3 , v100
	.byte	W04
	.byte		N02   
	.byte	W05
	.byte		N02   
	.byte	W05
	.byte		N02   
	.byte	W05
	.byte		N02   
	.byte	W05
	.byte	FINE

@******************************************************@
	.align	2

se_field_poison:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_field_poison_pri	@ Priority
	.byte	se_field_poison_rev	@ Reverb.

	.word	se_field_poison_grp

	.word	se_field_poison_1

	.end
