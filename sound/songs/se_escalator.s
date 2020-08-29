	.include "MPlayDef.s"

	.equ	se_escalator_grp, voicegroup111
	.equ	se_escalator_pri, 4
	.equ	se_escalator_rev, reverb_set+50
	.equ	se_escalator_mvl, 127
	.equ	se_escalator_key, 0
	.equ	se_escalator_tbs, 1
	.equ	se_escalator_exg, 0
	.equ	se_escalator_cmp, 1

	.section .rodata
	.global	se_escalator
	.align	2

@********************** Track  1 **********************@

se_escalator_1:
	.byte	KEYSH , se_escalator_key+0
	.byte	TEMPO , 150*se_escalator_tbs/2
	.byte		VOICE , 38
	.byte		BENDR , 2
	.byte		VOL   , 51*se_escalator_mvl/mxv
	.byte		BEND  , c_v-32
	.byte		TIE   , En5 , v080
	.byte	W01
	.byte		BEND  , c_v-26
	.byte	W01
	.byte		VOL   , 56*se_escalator_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v-21
	.byte	W01
	.byte		VOL   , 62*se_escalator_mvl/mxv
	.byte	W02
	.byte		BEND  , c_v-15
	.byte	W01
	.byte		VOL   , 69*se_escalator_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v-7
	.byte	W01
	.byte		VOL   , 75*se_escalator_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v+0
	.byte	W02
	.byte		VOL   , 85*se_escalator_mvl/mxv
	.byte	W02
	.byte		        92*se_escalator_mvl/mxv
	.byte	W02
	.byte		        100*se_escalator_mvl/mxv
	.byte	W08
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W03
	.byte		        96*se_escalator_mvl/mxv
	.byte	W03
	.byte		        88*se_escalator_mvl/mxv
	.byte	W03
	.byte		        81*se_escalator_mvl/mxv
	.byte		BEND  , c_v-5
	.byte	W03
	.byte		VOL   , 74*se_escalator_mvl/mxv
	.byte		BEND  , c_v-8
	.byte	W02
	.byte		VOL   , 62*se_escalator_mvl/mxv
	.byte		BEND  , c_v-12
	.byte	W02
	.byte		VOL   , 49*se_escalator_mvl/mxv
	.byte		BEND  , c_v-21
	.byte	W03
	.byte		VOL   , 39*se_escalator_mvl/mxv
	.byte		BEND  , c_v-26
	.byte	W02
	.byte		VOL   , 25*se_escalator_mvl/mxv
	.byte		BEND  , c_v-32
	.byte	W03
	.byte		EOT   
	.byte	FINE

@******************************************************@
	.align	2

se_escalator:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_escalator_pri	@ Priority
	.byte	se_escalator_rev	@ Reverb.

	.word	se_escalator_grp

	.word	se_escalator_1

	.end
