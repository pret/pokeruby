	.include "MPlayDef.s"

	.equ	mus_heal_grp, voicegroup009
	.equ	mus_heal_pri, 5
	.equ	mus_heal_rev, reverb_set+50
	.equ	mus_heal_mvl, 127
	.equ	mus_heal_key, 0
	.equ	mus_heal_tbs, 1
	.equ	mus_heal_exg, 0
	.equ	mus_heal_cmp, 1

	.section .rodata
	.global	mus_heal
	.align	2

@********************** Track  1 **********************@

mus_heal_1:
	.byte	KEYSH , mus_heal_key+0
	.byte	TEMPO , 132*mus_heal_tbs/2
	.byte		VOICE , 46
	.byte		VOL   , 90*mus_heal_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N12   , Bn4 , v112
	.byte	W12
	.byte		N06   , Bn4 , v052
	.byte	W12
	.byte		N12   , Bn4 , v112
	.byte	W12
	.byte		N06   , Bn4 , v052
	.byte	W12
	.byte		N12   , Bn4 , v112
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        En5 
	.byte	W12
	.byte		N06   , En5 , v052
	.byte	W12
	.byte	W24
	.byte	FINE

@********************** Track  2 **********************@

mus_heal_2:
	.byte	KEYSH , mus_heal_key+0
	.byte		VOICE , 46
	.byte		VOL   , 90*mus_heal_mvl/mxv
	.byte		PAN   , c_v+48
	.byte		N06   , En4 , v080
	.byte	W12
	.byte		        En4 , v020
	.byte	W12
	.byte		        En4 , v080
	.byte	W12
	.byte		        En4 , v020
	.byte	W12
	.byte		        En4 , v080
	.byte	W12
	.byte		        En4 , v020
	.byte	W12
	.byte		        Bn4 , v080
	.byte	W12
	.byte		        Bn4 , v020
	.byte	W12
	.byte	W24
	.byte	FINE

@********************** Track  3 **********************@

mus_heal_3:
	.byte	KEYSH , mus_heal_key+0
	.byte		VOICE , 46
	.byte		VOL   , 90*mus_heal_mvl/mxv
	.byte		PAN   , c_v-47
	.byte	W12
	.byte		N06   , Gs3 , v080
	.byte	W12
	.byte		        Gs3 , v024
	.byte	W12
	.byte		        Gs3 , v080
	.byte	W12
	.byte		        Gs3 , v024
	.byte	W12
	.byte		        Gs3 , v080
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        En3 , v024
	.byte	W12
	.byte	W24
	.byte	FINE

@********************** Track  4 **********************@

mus_heal_4:
	.byte		VOL   , 90*mus_heal_mvl/mxv
	.byte	KEYSH , mus_heal_key+0
	.byte		VOICE , 100
	.byte		PAN   , c_v+0
	.byte	W12
	.byte		N03   , En5 , v080
	.byte	W06
	.byte		PAN   , c_v-48
	.byte		N03   , En5 , v024
	.byte	W06
	.byte		PAN   , c_v+0
	.byte		N03   , En5 , v080
	.byte	W06
	.byte		PAN   , c_v+48
	.byte		N03   , En5 , v024
	.byte	W06
	.byte		VOICE , 101
	.byte		PAN   , c_v+0
	.byte		N03   , En4 , v080
	.byte	W06
	.byte		PAN   , c_v-48
	.byte		N03   , En4 , v024
	.byte	W30
	.byte		VOICE , 100
	.byte		PAN   , c_v+0
	.byte		N03   , En5 , v080
	.byte	W06
	.byte		PAN   , c_v+48
	.byte		N03   , En5 , v024
	.byte	W18
	.byte		PAN   , c_v+0
	.byte		N03   , En5 , v072
	.byte	W06
	.byte		        En5 , v028
	.byte	W18
	.byte	FINE

@******************************************************@
	.align	2

mus_heal:
	.byte	4	@ NumTrks
	.byte	0	@ NumBlks
	.byte	mus_heal_pri	@ Priority
	.byte	mus_heal_rev	@ Reverb.

	.word	mus_heal_grp

	.word	mus_heal_1
	.word	mus_heal_2
	.word	mus_heal_3
	.word	mus_heal_4

	.end
