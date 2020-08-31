	.include "MPlayDef.s"

	.equ	se_click_grp, voicegroup110
	.equ	se_click_pri, 4
	.equ	se_click_rev, reverb_set+50
	.equ	se_click_mvl, 127
	.equ	se_click_key, 0
	.equ	se_click_tbs, 1
	.equ	se_click_exg, 0
	.equ	se_click_cmp, 1

	.section .rodata
	.global	se_click
	.align	2

@********************** Track  1 **********************@

se_click_1:
	.byte	KEYSH , se_click_key+0
	.byte	TEMPO , 150*se_click_tbs/2
	.byte		VOICE , 126
	.byte		VOL   , 110*se_click_mvl/mxv
	.byte		N01   , Gs3 , v127
	.byte	W01
	.byte		        Cn4 , v068
	.byte	W02
	.byte	W02
	.byte		N03   , Gs4 , v127
	.byte	W01
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_click:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_click_pri	@ Priority
	.byte	se_click_rev	@ Reverb.

	.word	se_click_grp

	.word	se_click_1

	.end
