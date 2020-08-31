	.include "MPlayDef.s"

	.equ	se_low_health_grp, voicegroup110
	.equ	se_low_health_pri, 3
	.equ	se_low_health_rev, reverb_set+50
	.equ	se_low_health_mvl, 127
	.equ	se_low_health_key, 0
	.equ	se_low_health_tbs, 1
	.equ	se_low_health_exg, 0
	.equ	se_low_health_cmp, 1

	.section .rodata
	.global	se_low_health
	.align	2

@********************** Track  1 **********************@

se_low_health_1:
	.byte	KEYSH , se_low_health_key+0
se_low_health_1_B1:
	.byte	TEMPO , 150*se_low_health_tbs/2
	.byte		VOICE , 15
	.byte		XCMD  , xIECV , 10
	.byte		        xIECL , 8
	.byte		VOL   , 100*se_low_health_mvl/mxv
	.byte		BEND  , c_v+17
	.byte		N12   , Dn4 , v080
	.byte	W12
	.byte		BEND  , c_v+31
	.byte		N12   , An3 
	.byte	W12
	.byte	W12
	.byte	GOTO
	 .word	se_low_health_1_B1
	.byte	FINE

@******************************************************@
	.align	2

se_low_health:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_low_health_pri	@ Priority
	.byte	se_low_health_rev	@ Reverb.

	.word	se_low_health_grp

	.word	se_low_health_1

	.end
