	.include "MPlayDef.s"

	.equ	se_flee_grp, voicegroup110
	.equ	se_flee_pri, 5
	.equ	se_flee_rev, reverb_set+50
	.equ	se_flee_mvl, 127
	.equ	se_flee_key, 0
	.equ	se_flee_tbs, 1
	.equ	se_flee_exg, 0
	.equ	se_flee_cmp, 1

	.section .rodata
	.global	se_flee
	.align	2

@********************** Track  1 **********************@

se_flee_1:
	.byte	KEYSH , se_flee_key+0
	.byte	TEMPO , 150*se_flee_tbs/2
	.byte		VOICE , 126
	.byte		VOL   , 90*se_flee_mvl/mxv
	.byte		N03   , Fn4 , v120
	.byte	W03
	.byte		        Gs4 , v112
	.byte	W03
	.byte		N02   , Fs3 
	.byte	W03
	.byte		N03   , Gs4 , v072
	.byte	W03
	.byte		N02   , Fs3 , v096
	.byte	W03
	.byte		N03   , Gs4 , v056
	.byte	W03
	.byte		N02   , Fs3 , v080
	.byte	W03
	.byte		N03   , Gs4 , v040
	.byte	W03
	.byte		N02   , Fs3 , v064
	.byte	W03
	.byte		N03   , Gs4 , v024
	.byte	W03
	.byte		N02   , Fs3 , v048
	.byte	W03
	.byte		N03   , Gs4 , v020
	.byte	W03
	.byte		        Fs3 , v028
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_flee:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_flee_pri	@ Priority
	.byte	se_flee_rev	@ Reverb.

	.word	se_flee_grp

	.word	se_flee_1

	.end
