	.include "MPlayDef.s"

	.equ	se_rain_grp, voicegroup111
	.equ	se_rain_pri, 2
	.equ	se_rain_rev, reverb_set+50
	.equ	se_rain_mvl, 127
	.equ	se_rain_key, 0
	.equ	se_rain_tbs, 1
	.equ	se_rain_stopxg, 0
	.equ	se_rain_cmp, 1

	.section .rodata
	.global	se_rain
	.align	2

@********************** Track  1 **********************@

se_rain_1:
	.byte	KEYSH , se_rain_key+0
	.byte	TEMPO , 220*se_rain_tbs/2
	.byte		VOICE , 36
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 15*se_rain_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N24   , Bn3 , v052
	.byte	W03
	.byte		VOL   , 27*se_rain_mvl/mxv
	.byte	W03
	.byte		        39*se_rain_mvl/mxv
	.byte	W03
	.byte		        44*se_rain_mvl/mxv
	.byte	W03
	.byte		        52*se_rain_mvl/mxv
	.byte	W03
	.byte		        59*se_rain_mvl/mxv
	.byte	W03
	.byte		        68*se_rain_mvl/mxv
	.byte	W03
	.byte		        80*se_rain_mvl/mxv
	.byte	W03
se_rain_1_B1:
	.byte		N60   , Bn3 , v052
	.byte	W24
	.byte	W24
	.byte	W12
	.byte	GOTO
	 .word	se_rain_1_B1
	.byte	W12
	.byte	FINE

@******************************************************@
	.align	2

se_rain:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_rain_pri	@ Priority
	.byte	se_rain_rev	@ Reverb.

	.word	se_rain_grp

	.word	se_rain_1

	.end
