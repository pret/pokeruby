	.include "MPlayDef.s"

	.equ	se_fall_grp, voicegroup111
	.equ	se_fall_pri, 4
	.equ	se_fall_rev, reverb_set+50
	.equ	se_fall_mvl, 127
	.equ	se_fall_key, 0
	.equ	se_fall_tbs, 1
	.equ	se_fall_exg, 0
	.equ	se_fall_cmp, 1

	.section .rodata
	.global	se_fall
	.align	2

@********************** Track  1 **********************@

se_fall_1:
	.byte	KEYSH , se_fall_key+0
	.byte	TEMPO , 170*se_fall_tbs/2
	.byte		VOICE , 22
	.byte		VOL   , 110*se_fall_mvl/mxv
	.byte		BEND  , c_v+60
	.byte		N44   , Gn3 , v080
	.byte	W03
	.byte		BEND  , c_v+57
	.byte	W03
	.byte		        c_v+52
	.byte	W03
	.byte		        c_v+43
	.byte	W03
	.byte		        c_v+36
	.byte	W03
	.byte		        c_v+30
	.byte	W03
	.byte		        c_v+22
	.byte	W03
	.byte		        c_v+16
	.byte	W03
	.byte		VOL   , 104*se_fall_mvl/mxv
	.byte		BEND  , c_v+11
	.byte	W03
	.byte		VOL   , 90*se_fall_mvl/mxv
	.byte		BEND  , c_v+3
	.byte	W03
	.byte		VOL   , 82*se_fall_mvl/mxv
	.byte		BEND  , c_v-8
	.byte	W03
	.byte		VOL   , 71*se_fall_mvl/mxv
	.byte		BEND  , c_v-16
	.byte	W03
	.byte		VOL   , 58*se_fall_mvl/mxv
	.byte		BEND  , c_v-24
	.byte	W03
	.byte		VOL   , 45*se_fall_mvl/mxv
	.byte		BEND  , c_v-36
	.byte	W03
	.byte		VOL   , 36*se_fall_mvl/mxv
	.byte		BEND  , c_v-50
	.byte	W03
	.byte		VOL   , 11*se_fall_mvl/mxv
	.byte		BEND  , c_v-63
	.byte	W03
	.byte		VOL   , 3*se_fall_mvl/mxv
	.byte	FINE

@******************************************************@
	.align	2

se_fall:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_fall_pri	@ Priority
	.byte	se_fall_rev	@ Reverb.

	.word	se_fall_grp

	.word	se_fall_1

	.end
