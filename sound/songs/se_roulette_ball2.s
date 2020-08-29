	.include "MPlayDef.s"

	.equ	se_roulette_ball2_grp, voicegroup111
	.equ	se_roulette_ball2_pri, 2
	.equ	se_roulette_ball2_rev, reverb_set+50
	.equ	se_roulette_ball2_mvl, 127
	.equ	se_roulette_ball2_key, 0
	.equ	se_roulette_ball2_tbs, 1
	.equ	se_roulette_ball2_exg, 0
	.equ	se_roulette_ball2_cmp, 1

	.section .rodata
	.global	se_roulette_ball2
	.align	2

@********************** Track  1 **********************@

se_roulette_ball2_1:
	.byte	KEYSH , se_roulette_ball2_key+0
	.byte	TEMPO , 150*se_roulette_ball2_tbs/2
	.byte		VOICE , 63
	.byte		BENDR , 6
	.byte		VOL   , 110*se_roulette_ball2_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N72   , Dn3 , v127
	.byte	W06
	.byte		VOL   , 107*se_roulette_ball2_mvl/mxv
	.byte		BEND  , c_v-3
	.byte	W06
	.byte		VOL   , 106*se_roulette_ball2_mvl/mxv
	.byte		BEND  , c_v-5
	.byte	W06
	.byte		VOL   , 104*se_roulette_ball2_mvl/mxv
	.byte		BEND  , c_v-7
	.byte	W06
	.byte		VOL   , 102*se_roulette_ball2_mvl/mxv
	.byte		BEND  , c_v-10
	.byte	W06
	.byte		VOL   , 97*se_roulette_ball2_mvl/mxv
	.byte		BEND  , c_v-12
	.byte	W06
	.byte		VOL   , 90*se_roulette_ball2_mvl/mxv
	.byte		BEND  , c_v-14
	.byte	W06
	.byte		VOL   , 73*se_roulette_ball2_mvl/mxv
	.byte		BEND  , c_v-19
	.byte	W06
	.byte		VOL   , 58*se_roulette_ball2_mvl/mxv
	.byte		BEND  , c_v-24
	.byte	W06
	.byte		VOL   , 40*se_roulette_ball2_mvl/mxv
	.byte		BEND  , c_v-29
	.byte	W06
	.byte		VOL   , 25*se_roulette_ball2_mvl/mxv
	.byte		BEND  , c_v-35
	.byte	W06
	.byte		VOL   , 12*se_roulette_ball2_mvl/mxv
	.byte		BEND  , c_v-46
	.byte	W06
	.byte	FINE

@******************************************************@
	.align	2

se_roulette_ball2:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_roulette_ball2_pri	@ Priority
	.byte	se_roulette_ball2_rev	@ Reverb.

	.word	se_roulette_ball2_grp

	.word	se_roulette_ball2_1

	.end
