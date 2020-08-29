	.include "MPlayDef.s"

	.equ	se_m_razor_wind2_grp, voicegroup111
	.equ	se_m_razor_wind2_pri, 4
	.equ	se_m_razor_wind2_rev, reverb_set+50
	.equ	se_m_razor_wind2_mvl, 127
	.equ	se_m_razor_wind2_key, 0
	.equ	se_m_razor_wind2_tbs, 1
	.equ	se_m_razor_wind2_exg, 0
	.equ	se_m_razor_wind2_cmp, 1

	.section .rodata
	.global	se_m_razor_wind2
	.align	2

@********************** Track  1 **********************@

se_m_razor_wind2_1:
	.byte	KEYSH , se_m_razor_wind2_key+0
	.byte	TEMPO , 250*se_m_razor_wind2_tbs/2
	.byte		VOICE , 22
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 90*se_m_razor_wind2_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N14   , An4 , v108
	.byte	W03
	.byte		PAN   , c_v+5
	.byte		BEND  , c_v+6
	.byte	W01
	.byte		VOL   , 80*se_m_razor_wind2_mvl/mxv
	.byte	W02
	.byte		PAN   , c_v+15
	.byte		BEND  , c_v+1
	.byte	W01
	.byte		VOL   , 64*se_m_razor_wind2_mvl/mxv
	.byte	W02
	.byte		PAN   , c_v+6
	.byte		VOL   , 38*se_m_razor_wind2_mvl/mxv
	.byte		BEND  , c_v-9
	.byte	W02
	.byte		        c_v-34
	.byte	W01
	.byte		PAN   , c_v-1
	.byte		VOL   , 11*se_m_razor_wind2_mvl/mxv
	.byte	W12
	.byte	FINE

@******************************************************@
	.align	2

se_m_razor_wind2:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_m_razor_wind2_pri	@ Priority
	.byte	se_m_razor_wind2_rev	@ Reverb.

	.word	se_m_razor_wind2_grp

	.word	se_m_razor_wind2_1

	.end
