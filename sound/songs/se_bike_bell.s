	.include "MPlayDef.s"

	.equ	se_bike_bell_grp, voicegroup111
	.equ	se_bike_bell_pri, 4
	.equ	se_bike_bell_rev, reverb_set+50
	.equ	se_bike_bell_mvl, 127
	.equ	se_bike_bell_key, 0
	.equ	se_bike_bell_tbs, 1
	.equ	se_bike_bell_exg, 0
	.equ	se_bike_bell_cmp, 1

	.section .rodata
	.global	se_bike_bell
	.align	2

@********************** Track  1 **********************@

se_bike_bell_1:
	.byte	KEYSH , se_bike_bell_key+0
	.byte	TEMPO , 120*se_bike_bell_tbs/2
	.byte		VOICE , 0
	.byte		VOL   , 90*se_bike_bell_mvl/mxv
	.byte		N96   , Cn3 , v127
	.byte	W96
	.byte	FINE

@******************************************************@
	.align	2

se_bike_bell:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_bike_bell_pri	@ Priority
	.byte	se_bike_bell_rev	@ Reverb.

	.word	se_bike_bell_grp

	.word	se_bike_bell_1

	.end
