	.include "MPlayDef.s"

	.equ	se_m_double_slap_grp, voicegroup111
	.equ	se_m_double_slap_pri, 4
	.equ	se_m_double_slap_rev, reverb_set+50
	.equ	se_m_double_slap_mvl, 127
	.equ	se_m_double_slap_key, 0
	.equ	se_m_double_slap_tbs, 1
	.equ	se_m_double_slap_exg, 0
	.equ	se_m_double_slap_cmp, 1

	.section .rodata
	.global	se_m_double_slap
	.align	2

@********************** Track  1 **********************@

se_m_double_slap_1:
	.byte	KEYSH , se_m_double_slap_key+0
	.byte	TEMPO , 150*se_m_double_slap_tbs/2
	.byte		VOICE , 2
	.byte		BENDR , 12
	.byte		VOL   , 110*se_m_double_slap_mvl/mxv
	.byte		PAN   , c_v+9
	.byte		BEND  , c_v+0
	.byte		N02   , Bn3 , v112
	.byte	W04
	.byte		PAN   , c_v-9
	.byte		N02   , Fn5 , v064
	.byte	W02
	.byte		PAN   , c_v+0
	.byte		N02   , Bn3 , v036
	.byte	W03
	.byte		VOICE , 18
	.byte		N02   , Cn6 , v096
	.byte	W15
	.byte	FINE

@******************************************************@
	.align	2

se_m_double_slap:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_m_double_slap_pri	@ Priority
	.byte	se_m_double_slap_rev	@ Reverb.

	.word	se_m_double_slap_grp

	.word	se_m_double_slap_1

	.end
