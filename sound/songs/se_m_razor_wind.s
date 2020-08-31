	.include "MPlayDef.s"

	.equ	se_m_razor_wind_grp, voicegroup111
	.equ	se_m_razor_wind_pri, 4
	.equ	se_m_razor_wind_rev, reverb_set+50
	.equ	se_m_razor_wind_mvl, 127
	.equ	se_m_razor_wind_key, 0
	.equ	se_m_razor_wind_tbs, 1
	.equ	se_m_razor_wind_exg, 0
	.equ	se_m_razor_wind_cmp, 1

	.section .rodata
	.global	se_m_razor_wind
	.align	2

@********************** Track  1 **********************@

se_m_razor_wind_1:
	.byte	KEYSH , se_m_razor_wind_key+0
	.byte	TEMPO , 220*se_m_razor_wind_tbs/2
	.byte		VOICE , 18
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*se_m_razor_wind_mvl/mxv
	.byte		PAN   , c_v+14
	.byte		BEND  , c_v+0
	.byte		N09   , Cn5 , v092
	.byte	W03
	.byte		PAN   , c_v-15
	.byte		BEND  , c_v-32
	.byte	W03
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+28
	.byte	W03
	.byte		VOICE , 2
	.byte		BEND  , c_v-64
	.byte		N21   , Bn2 , v108
	.byte	W03
	.byte		BEND  , c_v-55
	.byte	W03
	.byte		PAN   , c_v+4
	.byte		BEND  , c_v-45
	.byte	W03
	.byte		PAN   , c_v-5
	.byte		BEND  , c_v+30
	.byte	W03
	.byte		PAN   , c_v+15
	.byte		BEND  , c_v+39
	.byte	W03
	.byte		PAN   , c_v-15
	.byte		BEND  , c_v+54
	.byte	W03
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+63
	.byte	W21
	.byte	FINE

@********************** Track  2 **********************@

se_m_razor_wind_2:
	.byte	KEYSH , se_m_razor_wind_key+0
	.byte		VOICE , 5
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*se_m_razor_wind_mvl/mxv
	.byte		N06   , Fn3 , v040
	.byte	W09
	.byte		N24   , Gn3 
	.byte	W15
	.byte	W24
	.byte	FINE

@******************************************************@
	.align	2

se_m_razor_wind:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_m_razor_wind_pri	@ Priority
	.byte	se_m_razor_wind_rev	@ Reverb.

	.word	se_m_razor_wind_grp

	.word	se_m_razor_wind_1
	.word	se_m_razor_wind_2

	.end
