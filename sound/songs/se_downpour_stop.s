	.include "MPlayDef.s"

	.equ	se_downpour_stop_grp, voicegroup111
	.equ	se_downpour_stop_pri, 2
	.equ	se_downpour_stop_rev, reverb_set+50
	.equ	se_downpour_stop_mvl, 127
	.equ	se_downpour_stop_key, 0
	.equ	se_downpour_stop_tbs, 1
	.equ	se_downpour_stop_exg, 0
	.equ	se_downpour_stop_cmp, 1

	.section .rodata
	.global	se_downpour_stop
	.align	2

@********************** Track  1 **********************@

se_downpour_stop_1:
	.byte	KEYSH , se_downpour_stop_key+0
	.byte	TEMPO , 220*se_downpour_stop_tbs/2
	.byte		VOICE , 36
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*se_downpour_stop_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N24   , Cn3 , v060
	.byte	W03
	.byte		VOL   , 96*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        93*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        90*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        85*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        81*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        73*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        62*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        55*se_downpour_stop_mvl/mxv
	.byte		N24   
	.byte	W03
	.byte		VOL   , 48*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        42*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        33*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        25*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        18*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        12*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte		        7*se_downpour_stop_mvl/mxv
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_downpour_stop:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_downpour_stop_pri	@ Priority
	.byte	se_downpour_stop_rev	@ Reverb.

	.word	se_downpour_stop_grp

	.word	se_downpour_stop_1

	.end
