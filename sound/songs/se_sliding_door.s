	.include "MPlayDef.s"

	.equ	se_sliding_door_grp, voicegroup111
	.equ	se_sliding_door_pri, 4
	.equ	se_sliding_door_rev, reverb_set+50
	.equ	se_sliding_door_mvl, 127
	.equ	se_sliding_door_key, 0
	.equ	se_sliding_door_tbs, 1
	.equ	se_sliding_door_exg, 0
	.equ	se_sliding_door_cmp, 1

	.section .rodata
	.global	se_sliding_door
	.align	2

@********************** Track  1 **********************@

se_sliding_door_1:
	.byte	KEYSH , se_sliding_door_key+0
	.byte	TEMPO , 120*se_sliding_door_tbs/2
	.byte		VOICE , 1
	.byte		VOL   , 95*se_sliding_door_mvl/mxv
	.byte		N12   , Cn2 , v127
	.byte	W12
	.byte		VOL   , 0*se_sliding_door_mvl/mxv
	.byte	FINE

@******************************************************@
	.align	2

se_sliding_door:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_sliding_door_pri	@ Priority
	.byte	se_sliding_door_rev	@ Reverb.

	.word	se_sliding_door_grp

	.word	se_sliding_door_1

	.end
