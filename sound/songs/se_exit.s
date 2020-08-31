	.include "MPlayDef.s"

	.equ	se_exit_grp, voicegroup110
	.equ	se_exit_pri, 5
	.equ	se_exit_rev, reverb_set+50
	.equ	se_exit_mvl, 127
	.equ	se_exit_key, 0
	.equ	se_exit_tbs, 1
	.equ	se_exit_exg, 0
	.equ	se_exit_cmp, 1

	.section .rodata
	.global	se_exit
	.align	2

@********************** Track  1 **********************@

se_exit_1:
	.byte	KEYSH , se_exit_key+0
	.byte	TEMPO , 120*se_exit_tbs/2
	.byte		VOICE , 126
	.byte		VOL   , 120*se_exit_mvl/mxv
	.byte		N02   , An2 , v068
	.byte	W02
	.byte		        Cn3 , v127
	.byte	W01
	.byte	W01
	.byte		        En4 , v068
	.byte	W02
	.byte	W03
	.byte	W03
	.byte		        An2 
	.byte	W02
	.byte		        Cn3 , v100
	.byte	W01
	.byte	W01
	.byte		        En4 , v068
	.byte	W02
	.byte	W03
	.byte	W03
	.byte		        An2 , v032
	.byte	W02
	.byte		        Cn3 , v052
	.byte	W01
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_exit:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_exit_pri	@ Priority
	.byte	se_exit_rev	@ Reverb.

	.word	se_exit_grp

	.word	se_exit_1

	.end
