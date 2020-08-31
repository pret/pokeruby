	.include "MPlayDef.s"

	.equ	se_ice_crack_grp, voicegroup110
	.equ	se_ice_crack_pri, 4
	.equ	se_ice_crack_rev, reverb_set+50
	.equ	se_ice_crack_mvl, 127
	.equ	se_ice_crack_key, 0
	.equ	se_ice_crack_tbs, 1
	.equ	se_ice_crack_exg, 0
	.equ	se_ice_crack_cmp, 1

	.section .rodata
	.global	se_ice_crack
	.align	2

@********************** Track  1 **********************@

se_ice_crack_1:
	.byte	KEYSH , se_ice_crack_key+0
	.byte	TEMPO , 150*se_ice_crack_tbs/2
	.byte		VOICE , 9
	.byte		VOL   , 100*se_ice_crack_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N01   , Gn5 , v088
	.byte	W01
	.byte		N01   
	.byte	W02
	.byte		        Cn6 , v072
	.byte	W03
	.byte		        Cn6 , v056
	.byte	W03
	.byte	FINE

@********************** Track  2 **********************@

se_ice_crack_2:
	.byte	KEYSH , se_ice_crack_key+0
	.byte		VOICE , 122
	.byte		VOL   , 100*se_ice_crack_mvl/mxv
	.byte		N01   , Gn2 , v112
	.byte	W02
	.byte		VOICE , 123
	.byte	W01
	.byte		N01   , Gs4 , v096
	.byte	W03
	.byte		        Gs4 , v112
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_ice_crack:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_ice_crack_pri	@ Priority
	.byte	se_ice_crack_rev	@ Reverb.

	.word	se_ice_crack_grp

	.word	se_ice_crack_1
	.word	se_ice_crack_2

	.end
