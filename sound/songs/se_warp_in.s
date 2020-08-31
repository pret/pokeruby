	.include "MPlayDef.s"

	.equ	se_warp_in_grp, voicegroup110
	.equ	se_warp_in_pri, 4
	.equ	se_warp_in_rev, reverb_set+50
	.equ	se_warp_in_mvl, 127
	.equ	se_warp_in_key, 0
	.equ	se_warp_in_tbs, 1
	.equ	se_warp_in_exg, 0
	.equ	se_warp_in_cmp, 1

	.section .rodata
	.global	se_warp_in
	.align	2

@********************** Track  1 **********************@

se_warp_in_1:
	.byte	KEYSH , se_warp_in_key+0
	.byte	TEMPO , 110*se_warp_in_tbs/2
	.byte		VOICE , 90
	.byte		VOL   , 90*se_warp_in_mvl/mxv
	.byte		N06   , En4 , v127
	.byte	W03
	.byte	W03
	.byte		N03   , En4 , v016
	.byte	W03
	.byte		N06   , En4 , v112
	.byte	W03
	.byte	W03
	.byte		N03   , En4 , v016
	.byte	W03
	.byte		N06   , En4 , v088
	.byte	W03
	.byte	W03
	.byte		N03   , En4 , v016
	.byte	W03
	.byte		N06   , En4 , v064
	.byte	W03
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_warp_in:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_warp_in_pri	@ Priority
	.byte	se_warp_in_rev	@ Reverb.

	.word	se_warp_in_grp

	.word	se_warp_in_1

	.end
