	.include "MPlayDef.s"

	.equ	se_shop_grp, voicegroup110
	.equ	se_shop_pri, 5
	.equ	se_shop_rev, reverb_set+50
	.equ	se_shop_mvl, 127
	.equ	se_shop_key, 0
	.equ	se_shop_tbs, 1
	.equ	se_shop_exg, 0
	.equ	se_shop_cmp, 1

	.section .rodata
	.global	se_shop
	.align	2

@********************** Track  1 **********************@

se_shop_1:
	.byte	KEYSH , se_shop_key+0
	.byte	TEMPO , 128*se_shop_tbs/2
	.byte		VOICE , 6
	.byte		BENDR , 12
	.byte		VOL   , 90*se_shop_mvl/mxv
	.byte		BEND  , c_v-1
	.byte		N01   , Ds3 , v127
	.byte	W02
	.byte		N03   , Gs3 , v100
	.byte	W05
	.byte		N16   , Fn5 , v072
	.byte	W05
	.byte	W12
	.byte	FINE

@********************** Track  2 **********************@

se_shop_2:
	.byte	KEYSH , se_shop_key+0
	.byte		VOICE , 14
	.byte		VOL   , 90*se_shop_mvl/mxv
	.byte		BEND  , c_v-8
	.byte	W02
	.byte		N03   , Gs3 , v060
	.byte	W05
	.byte		N16   , Fn5 
	.byte	W05
	.byte	W12
	.byte	FINE

@******************************************************@
	.align	2

se_shop:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_shop_pri	@ Priority
	.byte	se_shop_rev	@ Reverb.

	.word	se_shop_grp

	.word	se_shop_1
	.word	se_shop_2

	.end
