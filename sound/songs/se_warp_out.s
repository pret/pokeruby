	.include "MPlayDef.s"

	.equ	se_warp_out_grp, voicegroup110
	.equ	se_warp_out_pri, 4
	.equ	se_warp_out_rev, reverb_set+50
	.equ	se_warp_out_mvl, 127
	.equ	se_warp_out_key, 0
	.equ	se_warp_out_tbs, 1
	.equ	se_warp_out_exg, 0
	.equ	se_warp_out_cmp, 1

	.section .rodata
	.global	se_warp_out
	.align	2

@********************** Track  1 **********************@

se_warp_out_1:
	.byte	KEYSH , se_warp_out_key+0
	.byte	TEMPO , 110*se_warp_out_tbs/2
	.byte		VOICE , 93
	.byte		XCMD  , xIECV , 9
	.byte		        xIECL , 8
	.byte		VOL   , 90*se_warp_out_mvl/mxv
	.byte		N06   , En5 , v064
	.byte	W03
	.byte	W03
	.byte		N03   , En5 , v016
	.byte	W03
	.byte		N06   , En5 , v088
	.byte	W03
	.byte	W03
	.byte		N03   , En5 , v016
	.byte	W03
	.byte		N06   , En5 , v112
	.byte	W03
	.byte	W03
	.byte		N03   , En5 , v016
	.byte	W03
	.byte		N06   , En5 , v127
	.byte	W03
	.byte	W03
	.byte		N03   , En5 , v016
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_warp_out:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_warp_out_pri	@ Priority
	.byte	se_warp_out_rev	@ Reverb.

	.word	se_warp_out_grp

	.word	se_warp_out_1

	.end
