	.include "MPlayDef.s"

	.equ	se_m_horn_attack_grp, voicegroup111
	.equ	se_m_horn_attack_pri, 4
	.equ	se_m_horn_attack_rev, reverb_set+50
	.equ	se_m_horn_attack_mvl, 127
	.equ	se_m_horn_attack_key, 0
	.equ	se_m_horn_attack_tbs, 1
	.equ	se_m_horn_attack_exg, 0
	.equ	se_m_horn_attack_cmp, 1

	.section .rodata
	.global	se_m_horn_attack
	.align	2

@********************** Track  1 **********************@

se_m_horn_attack_1:
	.byte	KEYSH , se_m_horn_attack_key+0
	.byte	TEMPO , 150*se_m_horn_attack_tbs/2
	.byte		VOICE , 21
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*se_m_horn_attack_mvl/mxv
	.byte		BEND  , c_v+1
	.byte		N01   , Bn5 , v127
	.byte	W02
	.byte		VOICE , 18
	.byte		N01   , Cn4 
	.byte	W02
	.byte		VOICE , 36
	.byte		N06   , Gn5 , v040
	.byte	W02
	.byte		VOL   , 58*se_m_horn_attack_mvl/mxv
	.byte		PAN   , c_v+16
	.byte		BEND  , c_v+5
	.byte	W01
	.byte		VOL   , 71*se_m_horn_attack_mvl/mxv
	.byte		PAN   , c_v-14
	.byte		BEND  , c_v+13
	.byte	W01
	.byte		VOL   , 84*se_m_horn_attack_mvl/mxv
	.byte		PAN   , c_v+16
	.byte		BEND  , c_v+21
	.byte	W01
	.byte		VOL   , 97*se_m_horn_attack_mvl/mxv
	.byte		PAN   , c_v-14
	.byte		BEND  , c_v+33
	.byte	W01
	.byte		VOL   , 110*se_m_horn_attack_mvl/mxv
	.byte	W14
	.byte	FINE

@******************************************************@
	.align	2

se_m_horn_attack:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_m_horn_attack_pri	@ Priority
	.byte	se_m_horn_attack_rev	@ Reverb.

	.word	se_m_horn_attack_grp

	.word	se_m_horn_attack_1

	.end
