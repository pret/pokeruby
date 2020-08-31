	.include "MPlayDef.s"

	.equ	se_ding_dong_grp, voicegroup110
	.equ	se_ding_dong_pri, 5
	.equ	se_ding_dong_rev, reverb_set+50
	.equ	se_ding_dong_mvl, 127
	.equ	se_ding_dong_key, 0
	.equ	se_ding_dong_tbs, 1
	.equ	se_ding_dong_exg, 0
	.equ	se_ding_dong_cmp, 1

	.section .rodata
	.global	se_ding_dong
	.align	2

@********************** Track  1 **********************@

se_ding_dong_1:
	.byte	KEYSH , se_ding_dong_key+0
	.byte	TEMPO , 150*se_ding_dong_tbs/2
	.byte		VOICE , 15
	.byte		BENDR , 2
	.byte		VOL   , 90*se_ding_dong_mvl/mxv
	.byte		BEND  , c_v+1
	.byte		N24   , Ds4 , v092
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte		BEND  , c_v+15
	.byte		N36   , Bn3 
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

@********************** Track  2 **********************@

se_ding_dong_2:
	.byte	KEYSH , se_ding_dong_key+0
	.byte		VOICE , 14
	.byte		VOL   , 90*se_ding_dong_mvl/mxv
	.byte		BEND  , c_v+1
	.byte		N24   , Ds4 , v072
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte		BEND  , c_v+15
	.byte		N36   , Bn3 
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

se_ding_dong:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_ding_dong_pri	@ Priority
	.byte	se_ding_dong_rev	@ Reverb.

	.word	se_ding_dong_grp

	.word	se_ding_dong_1
	.word	se_ding_dong_2

	.end
