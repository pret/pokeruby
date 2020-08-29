	.include "MPlayDef.s"

	.equ	se_vend_grp, voicegroup111
	.equ	se_vend_pri, 4
	.equ	se_vend_rev, reverb_set+50
	.equ	se_vend_mvl, 127
	.equ	se_vend_key, 0
	.equ	se_vend_tbs, 1
	.equ	se_vend_exg, 0
	.equ	se_vend_cmp, 1

	.section .rodata
	.global	se_vend
	.align	2

@********************** Track  1 **********************@

se_vend_1:
	.byte	KEYSH , se_vend_key+0
	.byte	TEMPO , 150*se_vend_tbs/2
	.byte		VOICE , 8
	.byte		VOL   , 110*se_vend_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N01   , Cn4 , v092
	.byte	W03
	.byte		        Cn5 
	.byte	W03
	.byte	W03
	.byte		N02   , En3 , v127
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_vend:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_vend_pri	@ Priority
	.byte	se_vend_rev	@ Reverb.

	.word	se_vend_grp

	.word	se_vend_1

	.end
