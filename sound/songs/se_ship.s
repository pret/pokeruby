	.include "MPlayDef.s"

	.equ	se_ship_grp, voicegroup110
	.equ	se_ship_pri, 4
	.equ	se_ship_rev, reverb_set+50
	.equ	se_ship_mvl, 127
	.equ	se_ship_key, 0
	.equ	se_ship_tbs, 1
	.equ	se_ship_exg, 0
	.equ	se_ship_cmp, 1

	.section .rodata
	.global	se_ship
	.align	2

@********************** Track  1 **********************@

se_ship_1:
	.byte	KEYSH , se_ship_key+0
	.byte	TEMPO , 220*se_ship_tbs/2
	.byte		VOICE , 123
	.byte		VOL   , 75*se_ship_mvl/mxv
	.byte		N03   , Ds3 , v127
	.byte	W03
	.byte		TIE   , Cn4 
	.byte	W21
	.byte	W24
	.byte	W18
	.byte		VOL   , 75*se_ship_mvl/mxv
	.byte	W06
	.byte		        71*se_ship_mvl/mxv
	.byte	W05
	.byte		        67*se_ship_mvl/mxv
	.byte	W03
	.byte		        62*se_ship_mvl/mxv
	.byte	W04
	.byte		        59*se_ship_mvl/mxv
	.byte	W05
	.byte		        57*se_ship_mvl/mxv
	.byte	W03
	.byte		        54*se_ship_mvl/mxv
	.byte	W04
	.byte	W02
	.byte		        50*se_ship_mvl/mxv
	.byte	W03
	.byte		        49*se_ship_mvl/mxv
	.byte	W03
	.byte		        44*se_ship_mvl/mxv
	.byte	W04
	.byte		        41*se_ship_mvl/mxv
	.byte	W02
	.byte		        38*se_ship_mvl/mxv
	.byte	W03
	.byte		        35*se_ship_mvl/mxv
	.byte	W03
	.byte		        32*se_ship_mvl/mxv
	.byte	W04
	.byte		        28*se_ship_mvl/mxv
	.byte	W02
	.byte		        24*se_ship_mvl/mxv
	.byte	W03
	.byte		        21*se_ship_mvl/mxv
	.byte	W03
	.byte		        18*se_ship_mvl/mxv
	.byte	W04
	.byte		        14*se_ship_mvl/mxv
	.byte	W02
	.byte		        11*se_ship_mvl/mxv
	.byte	W03
	.byte		        9*se_ship_mvl/mxv
	.byte	W03
	.byte		        6*se_ship_mvl/mxv
	.byte	W04
	.byte		        3*se_ship_mvl/mxv
	.byte	W02
	.byte		        1*se_ship_mvl/mxv
	.byte	W22
	.byte		EOT   
	.byte	FINE

@******************************************************@
	.align	2

se_ship:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_ship_pri	@ Priority
	.byte	se_ship_rev	@ Reverb.

	.word	se_ship_grp

	.word	se_ship_1

	.end
