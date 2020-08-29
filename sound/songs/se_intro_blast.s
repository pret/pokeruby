	.include "MPlayDef.s"

	.equ	se_intro_blast_grp, voicegroup110
	.equ	se_intro_blast_pri, 5
	.equ	se_intro_blast_rev, reverb_set+50
	.equ	se_intro_blast_mvl, 127
	.equ	se_intro_blast_key, 0
	.equ	se_intro_blast_tbs, 1
	.equ	se_intro_blast_exg, 0
	.equ	se_intro_blast_cmp, 1

	.section .rodata
	.global	se_intro_blast
	.align	2

@********************** Track  1 **********************@

se_intro_blast_1:
	.byte	KEYSH , se_intro_blast_key+0
	.byte	TEMPO , 110*se_intro_blast_tbs/2
	.byte		VOICE , 123
	.byte		BENDR , 12
	.byte		VOL   , 100*se_intro_blast_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		N60   , Gs2 , v052
	.byte	W06
	.byte	W06
	.byte		BEND  , c_v+0
	.byte	W02
	.byte		        c_v+1
	.byte	W04
	.byte		        c_v+2
	.byte	W02
	.byte		        c_v+3
	.byte	W02
	.byte		        c_v+5
	.byte	W02
	.byte	W01
	.byte		        c_v+6
	.byte	W02
	.byte		        c_v+8
	.byte	W03
	.byte		        c_v+9
	.byte	W02
	.byte		        c_v+11
	.byte	W02
	.byte		        c_v+13
	.byte	W02
	.byte	W01
	.byte		        c_v+15
	.byte	W02
	.byte		        c_v+17
	.byte	W03
	.byte		        c_v+19
	.byte	W02
	.byte		        c_v+24
	.byte	W02
	.byte		        c_v+27
	.byte	W02
	.byte	W01
	.byte		        c_v+30
	.byte	W02
	.byte		        c_v+38
	.byte	W03
	.byte		        c_v+43
	.byte	W02
	.byte		        c_v+56
	.byte	W02
	.byte		        c_v+63
	.byte	W02
	.byte		        c_v+0
	.byte		N72   , Gs3 
	.byte	W04
	.byte		BEND  , c_v+0
	.byte	W02
	.byte	W01
	.byte		        c_v+1
	.byte	W03
	.byte		        c_v+2
	.byte	W02
	.byte	W01
	.byte		        c_v+3
	.byte	W02
	.byte		        c_v+5
	.byte	W03
	.byte		        c_v+6
	.byte	W02
	.byte		        c_v+8
	.byte	W02
	.byte		        c_v+9
	.byte	W02
	.byte		VOL   , 98*se_intro_blast_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v+11
	.byte	W01
	.byte		VOL   , 96*se_intro_blast_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v+13
	.byte	W01
	.byte		VOL   , 92*se_intro_blast_mvl/mxv
	.byte	W02
	.byte		BEND  , c_v+15
	.byte	W01
	.byte		VOL   , 92*se_intro_blast_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v+17
	.byte	W01
	.byte		VOL   , 85*se_intro_blast_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v+19
	.byte	W02
	.byte		VOL   , 81*se_intro_blast_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v+24
	.byte	W01
	.byte		VOL   , 74*se_intro_blast_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v+27
	.byte	W01
	.byte		VOL   , 66*se_intro_blast_mvl/mxv
	.byte	W02
	.byte		BEND  , c_v+30
	.byte	W01
	.byte		VOL   , 62*se_intro_blast_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v+38
	.byte	W01
	.byte		VOL   , 56*se_intro_blast_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v+43
	.byte	W02
	.byte		VOL   , 50*se_intro_blast_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v+56
	.byte	W01
	.byte		VOL   , 42*se_intro_blast_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v+63
	.byte	W01
	.byte		VOL   , 34*se_intro_blast_mvl/mxv
	.byte	W02
	.byte	W01
	.byte		        29*se_intro_blast_mvl/mxv
	.byte	W02
	.byte		        25*se_intro_blast_mvl/mxv
	.byte	W03
	.byte		        23*se_intro_blast_mvl/mxv
	.byte	W02
	.byte		        19*se_intro_blast_mvl/mxv
	.byte	W02
	.byte		        14*se_intro_blast_mvl/mxv
	.byte	W02
	.byte	W01
	.byte		        11*se_intro_blast_mvl/mxv
	.byte	W02
	.byte		        5*se_intro_blast_mvl/mxv
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_intro_blast:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_intro_blast_pri	@ Priority
	.byte	se_intro_blast_rev	@ Reverb.

	.word	se_intro_blast_grp

	.word	se_intro_blast_1

	.end
