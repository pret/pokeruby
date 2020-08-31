	.include "MPlayDef.s"

	.equ	se_contest_place_grp, voicegroup110
	.equ	se_contest_place_pri, 4
	.equ	se_contest_place_rev, reverb_set+50
	.equ	se_contest_place_mvl, 127
	.equ	se_contest_place_key, 0
	.equ	se_contest_place_tbs, 1
	.equ	se_contest_place_exg, 0
	.equ	se_contest_place_cmp, 1

	.section .rodata
	.global	se_contest_place
	.align	2

@********************** Track  1 **********************@

se_contest_place_1:
	.byte	KEYSH , se_contest_place_key+0
	.byte	TEMPO , 144*se_contest_place_tbs/2
	.byte		VOICE , 48
	.byte		PAN   , c_v+1
	.byte		VOL   , 110*se_contest_place_mvl/mxv
	.byte		N06   , Cn3 , v060
	.byte	W06
	.byte		N13   , Gn3 
	.byte	W06
	.byte	W01
	.byte		VOL   , 105*se_contest_place_mvl/mxv
	.byte	W01
	.byte		        100*se_contest_place_mvl/mxv
	.byte	W01
	.byte		        89*se_contest_place_mvl/mxv
	.byte	W01
	.byte		        72*se_contest_place_mvl/mxv
	.byte	W02
	.byte		        55*se_contest_place_mvl/mxv
	.byte	W01
	.byte		        38*se_contest_place_mvl/mxv
	.byte	W01
	.byte		        22*se_contest_place_mvl/mxv
	.byte	W01
	.byte		        110*se_contest_place_mvl/mxv
	.byte		N12   , Gn3 , v032
	.byte	W03
	.byte	W01
	.byte		VOL   , 100*se_contest_place_mvl/mxv
	.byte	W01
	.byte		        91*se_contest_place_mvl/mxv
	.byte	W01
	.byte		        75*se_contest_place_mvl/mxv
	.byte	W01
	.byte		        43*se_contest_place_mvl/mxv
	.byte	W02
	.byte		        24*se_contest_place_mvl/mxv
	.byte	W01
	.byte		        9*se_contest_place_mvl/mxv
	.byte	W05
	.byte	FINE

@********************** Track  2 **********************@

se_contest_place_2:
	.byte	KEYSH , se_contest_place_key+0
	.byte		VOICE , 80
	.byte		VOL   , 110*se_contest_place_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N06   , Cn3 , v060
	.byte	W06
	.byte		N13   , Gn3 
	.byte	W06
	.byte	W09
	.byte		PAN   , c_v-48
	.byte		N12   , Gn3 , v032
	.byte	W03
	.byte	W12
	.byte	FINE

@********************** Track  3 **********************@

se_contest_place_3:
	.byte	KEYSH , se_contest_place_key+0
	.byte		VOICE , 81
	.byte		VOL   , 110*se_contest_place_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N06   , Gn2 , v060
	.byte	W06
	.byte		N13   , Cn3 
	.byte	W06
	.byte	W09
	.byte		PAN   , c_v+48
	.byte		N12   , Cn3 , v032
	.byte	W03
	.byte	W12
	.byte	FINE

@********************** Track  4 **********************@

se_contest_place_4:
	.byte	KEYSH , se_contest_place_key+0
	.byte		VOICE , 47
	.byte		VOL   , 110*se_contest_place_mvl/mxv
	.byte		N06   , Gn1 , v127
	.byte	W06
	.byte		N13   , Cn2 
	.byte	W06
	.byte	W12
	.byte	W12
	.byte	FINE

@******************************************************@
	.align	2

se_contest_place:
	.byte	4	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_contest_place_pri	@ Priority
	.byte	se_contest_place_rev	@ Reverb.

	.word	se_contest_place_grp

	.word	se_contest_place_1
	.word	se_contest_place_2
	.word	se_contest_place_3
	.word	se_contest_place_4

	.end
