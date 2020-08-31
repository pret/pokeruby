	.include "MPlayDef.s"

	.equ	se_thunderstorm_stop_grp, voicegroup111
	.equ	se_thunderstorm_stop_pri, 2
	.equ	se_thunderstorm_stop_rev, reverb_set+50
	.equ	se_thunderstorm_stop_mvl, 127
	.equ	se_thunderstorm_stop_key, 0
	.equ	se_thunderstorm_stop_tbs, 1
	.equ	se_thunderstorm_stop_exg, 0
	.equ	se_thunderstorm_stop_cmp, 1

	.section .rodata
	.global	se_thunderstorm_stop
	.align	2

@********************** Track  1 **********************@

se_thunderstorm_stop_1:
	.byte	KEYSH , se_thunderstorm_stop_key+0
	.byte	TEMPO , 220*se_thunderstorm_stop_tbs/2
	.byte		VOICE , 36
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 80*se_thunderstorm_stop_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N24   , Gn3 , v060
	.byte	W03
	.byte		VOL   , 76*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        74*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        72*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        68*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        64*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        58*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        50*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        44*se_thunderstorm_stop_mvl/mxv
	.byte		N24   
	.byte	W03
	.byte		VOL   , 38*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        34*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        27*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        20*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        15*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        10*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte		        6*se_thunderstorm_stop_mvl/mxv
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_thunderstorm_stop:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_thunderstorm_stop_pri	@ Priority
	.byte	se_thunderstorm_stop_rev	@ Reverb.

	.word	se_thunderstorm_stop_grp

	.word	se_thunderstorm_stop_1

	.end
