	.include "MPlayDef.s"

	.equ	se_thunder_grp, voicegroup111
	.equ	se_thunder_pri, 3
	.equ	se_thunder_rev, reverb_set+50
	.equ	se_thunder_mvl, 127
	.equ	se_thunder_key, 0
	.equ	se_thunder_tbs, 1
	.equ	se_thunder_exg, 0
	.equ	se_thunder_cmp, 1

	.section .rodata
	.global	se_thunder
	.align	2

@********************** Track  1 **********************@

se_thunder_1:
	.byte	KEYSH , se_thunder_key+0
	.byte	TEMPO , 220*se_thunder_tbs/2
	.byte		VOICE , 18
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*se_thunder_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N09   , En3 , v112
	.byte	W03
	.byte		BEND  , c_v+21
	.byte	W03
	.byte		        c_v+0
	.byte	W03
	.byte		        c_v+6
	.byte		N15   , En3 , v120
	.byte	W03
	.byte		BEND  , c_v+2
	.byte	W03
	.byte		        c_v-9
	.byte	W03
	.byte		        c_v-29
	.byte	W06
	.byte		        c_v+0
	.byte		N09   , Gn2 
	.byte	W06
	.byte		BEND  , c_v-8
	.byte	W03
	.byte		        c_v-15
	.byte		TIE   , Gs2 , v112
	.byte	W03
	.byte		BEND  , c_v-4
	.byte	W09
	.byte		        c_v-8
	.byte	W03
	.byte	W06
	.byte		        c_v-13
	.byte	W03
	.byte		        c_v-22
	.byte	W09
	.byte		        c_v-32
	.byte	W06
	.byte		VOL   , 102*se_thunder_mvl/mxv
	.byte		BEND  , c_v-38
	.byte	W09
	.byte		VOL   , 97*se_thunder_mvl/mxv
	.byte	W09
	.byte		        92*se_thunder_mvl/mxv
	.byte		BEND  , c_v-45
	.byte	W06
	.byte	W03
	.byte		VOL   , 83*se_thunder_mvl/mxv
	.byte	W06
	.byte		BEND  , c_v-52
	.byte	W03
	.byte		VOL   , 72*se_thunder_mvl/mxv
	.byte	W09
	.byte		        63*se_thunder_mvl/mxv
	.byte	W03
	.byte	W06
	.byte		        57*se_thunder_mvl/mxv
	.byte	W06
	.byte		        46*se_thunder_mvl/mxv
	.byte	W12
	.byte		EOT   
	.byte	FINE

@******************************************************@
	.align	2

se_thunder:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_thunder_pri	@ Priority
	.byte	se_thunder_rev	@ Reverb.

	.word	se_thunder_grp

	.word	se_thunder_1

	.end
