	.include "MPlayDef.s"

	.equ	se_bang_grp, voicegroup111
	.equ	se_bang_pri, 4
	.equ	se_bang_rev, reverb_set+50
	.equ	se_bang_mvl, 127
	.equ	se_bang_key, 0
	.equ	se_bang_tbs, 1
	.equ	se_bang_exg, 0
	.equ	se_bang_cmp, 1

	.section .rodata
	.global	se_bang
	.align	2

@********************** Track  1 **********************@

se_bang_1:
	.byte	KEYSH , se_bang_key+0
	.byte	TEMPO , 240*se_bang_tbs/2
	.byte		VOICE , 2
	.byte		BENDR , 12
	.byte		VOL   , 110*se_bang_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N03   , En2 , v127
	.byte	W03
	.byte		        Dn2 
	.byte	W03
	.byte		N06   , Gn1 
	.byte	W06
	.byte		N60   , An2 
	.byte	W12
	.byte	W24
	.byte		VOL   , 94*se_bang_mvl/mxv
	.byte		BEND  , c_v-5
	.byte	W03
	.byte		VOL   , 81*se_bang_mvl/mxv
	.byte	W03
	.byte		        71*se_bang_mvl/mxv
	.byte		BEND  , c_v-12
	.byte	W03
	.byte		VOL   , 47*se_bang_mvl/mxv
	.byte	W03
	.byte		        32*se_bang_mvl/mxv
	.byte		BEND  , c_v-19
	.byte	W03
	.byte		VOL   , 20*se_bang_mvl/mxv
	.byte	W03
	.byte		        7*se_bang_mvl/mxv
	.byte		BEND  , c_v-28
	.byte	W03
	.byte		VOL   , 0*se_bang_mvl/mxv
	.byte		BEND  , c_v-37
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_bang:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_bang_pri	@ Priority
	.byte	se_bang_rev	@ Reverb.

	.word	se_bang_grp

	.word	se_bang_1

	.end
