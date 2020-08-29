	.include "MPlayDef.s"

	.equ	se_m_tail_whip_grp, voicegroup111
	.equ	se_m_tail_whip_pri, 4
	.equ	se_m_tail_whip_rev, reverb_set+50
	.equ	se_m_tail_whip_mvl, 127
	.equ	se_m_tail_whip_key, 0
	.equ	se_m_tail_whip_tbs, 1
	.equ	se_m_tail_whip_exg, 0
	.equ	se_m_tail_whip_cmp, 1

	.section .rodata
	.global	se_m_tail_whip
	.align	2

@********************** Track  1 **********************@

se_m_tail_whip_1:
	.byte	KEYSH , se_m_tail_whip_key+0
	.byte	TEMPO , 150*se_m_tail_whip_tbs/2
	.byte		VOICE , 15
	.byte		BENDR , 12
	.byte		PAN   , c_v+18
	.byte		VOL   , 48*se_m_tail_whip_mvl/mxv
	.byte		BEND  , c_v-48
	.byte		N04   , Gn2 , v127
	.byte	W01
	.byte		VOL   , 81*se_m_tail_whip_mvl/mxv
	.byte		BEND  , c_v-16
	.byte	W01
	.byte		VOL   , 110*se_m_tail_whip_mvl/mxv
	.byte		BEND  , c_v+16
	.byte	W01
	.byte		        c_v+0
	.byte	W04
	.byte		VOL   , 48*se_m_tail_whip_mvl/mxv
	.byte		PAN   , c_v-16
	.byte		BEND  , c_v-48
	.byte		N04   , An2 
	.byte	W01
	.byte		VOL   , 81*se_m_tail_whip_mvl/mxv
	.byte		BEND  , c_v-16
	.byte	W01
	.byte		VOL   , 110*se_m_tail_whip_mvl/mxv
	.byte		BEND  , c_v+16
	.byte	W15
	.byte		VOL   , 110*se_m_tail_whip_mvl/mxv
	.byte	FINE

@******************************************************@
	.align	2

se_m_tail_whip:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_m_tail_whip_pri	@ Priority
	.byte	se_m_tail_whip_rev	@ Reverb.

	.word	se_m_tail_whip_grp

	.word	se_m_tail_whip_1

	.end
