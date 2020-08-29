	.include "MPlayDef.s"

	.equ	se_m_bind_grp, voicegroup111
	.equ	se_m_bind_pri, 4
	.equ	se_m_bind_rev, reverb_set+50
	.equ	se_m_bind_mvl, 127
	.equ	se_m_bind_key, 0
	.equ	se_m_bind_tbs, 1
	.equ	se_m_bind_exg, 0
	.equ	se_m_bind_cmp, 1

	.section .rodata
	.global	se_m_bind
	.align	2

@********************** Track  1 **********************@

se_m_bind_1:
	.byte	KEYSH , se_m_bind_key+0
	.byte	TEMPO , 150*se_m_bind_tbs/2
	.byte		VOICE , 38
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*se_m_bind_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N05   , Fs2 , v127
	.byte	W01
	.byte		PAN   , c_v-5
	.byte		BEND  , c_v-3
	.byte	W01
	.byte		PAN   , c_v+4
	.byte		BEND  , c_v-5
	.byte	W01
	.byte		PAN   , c_v-8
	.byte		BEND  , c_v-9
	.byte	W01
	.byte		PAN   , c_v+11
	.byte		BEND  , c_v-12
	.byte	W06
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		N11   
	.byte	W02
	.byte		BEND  , c_v-10
	.byte	W01
	.byte		        c_v-6
	.byte	W01
	.byte		PAN   , c_v-5
	.byte		BEND  , c_v-4
	.byte	W01
	.byte		        c_v+0
	.byte	W01
	.byte		PAN   , c_v+4
	.byte		BEND  , c_v-3
	.byte	W02
	.byte		        c_v+3
	.byte	W01
	.byte		PAN   , c_v-8
	.byte		BEND  , c_v-9
	.byte	W01
	.byte		        c_v-21
	.byte	W01
	.byte		PAN   , c_v+11
	.byte		BEND  , c_v-28
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_m_bind:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_m_bind_pri	@ Priority
	.byte	se_m_bind_rev	@ Reverb.

	.word	se_m_bind_grp

	.word	se_m_bind_1

	.end
