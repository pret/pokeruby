	.include "MPlayDef.s"

	.equ	mus_caught_grp, voicegroup022
	.equ	mus_caught_pri, 0
	.equ	mus_caught_rev, reverb_set+50
	.equ	mus_caught_mvl, 127
	.equ	mus_caught_key, 0
	.equ	mus_caught_tbs, 1
	.equ	mus_caught_exg, 0
	.equ	mus_caught_cmp, 1

	.section .rodata
	.global	mus_caught
	.align	2

@********************** Track  1 **********************@

mus_caught_1:
	.byte	KEYSH , mus_caught_key+0
	.byte	TEMPO , 140*mus_caught_tbs/2
	.byte	W12
mus_caught_1_B1:
	.byte		VOICE , 73
	.byte		PAN   , c_v+0
	.byte		MOD   , 0
	.byte		VOL   , 80*mus_caught_mvl/mxv
	.byte		N06   , Bn4 , v112
	.byte	W12
	.byte		        An4 
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        An4 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte		        Cs5 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N24   
	.byte	W12
	.byte		MOD   , 5
	.byte	W12
	.byte		        0
	.byte		N06   , Bn4 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W12
	.byte		        An4 
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        An4 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte		        Cs5 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N24   
	.byte	W12
	.byte		MOD   , 5
	.byte	W12
	.byte		        0
	.byte		N06   , Bn4 
	.byte	W24
	.byte		        Cn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
mus_caught_1_000:
	.byte		N06   , Cn5 , v112
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        An4 
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Cn5 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte	PEND
	.byte		        Dn5 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N24   
	.byte	W12
	.byte		MOD   , 5
	.byte	W12
	.byte		        0
	.byte		N06   , Cn5 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte	PATT
	 .word	mus_caught_1_000
	.byte		N06   , Dn5 , v112
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N24   
	.byte	W12
	.byte		MOD   , 5
	.byte	W12
	.byte		        0
	.byte		N06   , Cn5 
	.byte	W24
	.byte		        Bn3 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte	GOTO
	 .word	mus_caught_1_B1
	.byte	FINE

@********************** Track  2 **********************@

mus_caught_2:
	.byte	KEYSH , mus_caught_key+0
	.byte	W12
mus_caught_2_B1:
	.byte		VOICE , 56
	.byte		PAN   , c_v+0
	.byte		MOD   , 0
	.byte		VOL   , 80*mus_caught_mvl/mxv
	.byte	W12
	.byte		N06   , En3 , v092
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W36
	.byte		VOICE , 47
	.byte		PAN   , c_v+10
	.byte		N12   , An1 , v112
	.byte	W12
	.byte		        Bn1 
	.byte	W48
	.byte		VOICE , 56
	.byte		PAN   , c_v+0
	.byte	W12
	.byte		N06   , En3 , v092
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte		VOICE , 47
	.byte		PAN   , c_v+10
	.byte		N12   , An1 , v112
	.byte	W24
	.byte		        Bn1 
	.byte	W48
mus_caught_2_000:
	.byte		VOICE , 56
	.byte		PAN   , c_v+0
	.byte	W12
	.byte		N06   , Fn3 , v092
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W12
	.byte	PEND
	.byte		N06   
	.byte	W36
	.byte		VOICE , 47
	.byte		PAN   , c_v+10
	.byte		N12   , As1 , v112
	.byte	W12
	.byte		        Cn2 
	.byte	W48
	.byte	PATT
	 .word	mus_caught_2_000
	.byte		N06   , Fn3 , v092
	.byte	W24
	.byte		VOICE , 47
	.byte		PAN   , c_v+10
	.byte		N12   , As1 , v112
	.byte	W24
	.byte		        Cn2 
	.byte	W48
	.byte	GOTO
	 .word	mus_caught_2_B1
	.byte	FINE

@********************** Track  3 **********************@

mus_caught_3:
	.byte	KEYSH , mus_caught_key+0
	.byte	W12
mus_caught_3_B1:
	.byte		VOICE , 58
	.byte		VOL   , 80*mus_caught_mvl/mxv
	.byte		N21   , En1 , v127
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , Bn0 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , En1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , Bn0 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N48   , An1 
	.byte	W06
	.byte		VOL   , 67*mus_caught_mvl/mxv
	.byte	W03
	.byte		        58*mus_caught_mvl/mxv
	.byte	W06
	.byte		        54*mus_caught_mvl/mxv
	.byte	W06
	.byte		        57*mus_caught_mvl/mxv
	.byte	W06
	.byte		        64*mus_caught_mvl/mxv
	.byte	W03
	.byte		        69*mus_caught_mvl/mxv
	.byte	W03
	.byte		        76*mus_caught_mvl/mxv
	.byte	W06
	.byte		        80*mus_caught_mvl/mxv
	.byte	W09
	.byte		        62*mus_caught_mvl/mxv
	.byte		N48   , Bn1 
	.byte	W06
	.byte		VOL   , 65*mus_caught_mvl/mxv
	.byte	W06
	.byte		        67*mus_caught_mvl/mxv
	.byte	W06
	.byte		        69*mus_caught_mvl/mxv
	.byte	W06
	.byte		        73*mus_caught_mvl/mxv
	.byte	W09
	.byte		        76*mus_caught_mvl/mxv
	.byte	W06
	.byte		        80*mus_caught_mvl/mxv
	.byte	W09
	.byte		N21   , En1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , Bn0 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , En1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , Bn0 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N24   , An1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W30
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , En1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , Cn1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , Fn1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , Cn1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , Fn1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , Cn1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N48   , As1 
	.byte	W06
	.byte		VOL   , 67*mus_caught_mvl/mxv
	.byte	W03
	.byte		        58*mus_caught_mvl/mxv
	.byte	W06
	.byte		        54*mus_caught_mvl/mxv
	.byte	W06
	.byte		        57*mus_caught_mvl/mxv
	.byte	W06
	.byte		        64*mus_caught_mvl/mxv
	.byte	W03
	.byte		        69*mus_caught_mvl/mxv
	.byte	W03
	.byte		        76*mus_caught_mvl/mxv
	.byte	W06
	.byte		        80*mus_caught_mvl/mxv
	.byte	W09
	.byte		        62*mus_caught_mvl/mxv
	.byte		N48   , Cn2 
	.byte	W06
	.byte		VOL   , 65*mus_caught_mvl/mxv
	.byte	W06
	.byte		        67*mus_caught_mvl/mxv
	.byte	W06
	.byte		        69*mus_caught_mvl/mxv
	.byte	W06
	.byte		        73*mus_caught_mvl/mxv
	.byte	W09
	.byte		        76*mus_caught_mvl/mxv
	.byte	W06
	.byte		        80*mus_caught_mvl/mxv
	.byte	W09
	.byte		N21   , Fn1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , Cn1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , Fn1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N21   , Cn1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N24   , As1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W30
	.byte		        80*mus_caught_mvl/mxv
	.byte		N24   , Fn1 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte		        80*mus_caught_mvl/mxv
	.byte		N24   , Bn0 
	.byte	W12
	.byte		VOL   , 73*mus_caught_mvl/mxv
	.byte	W03
	.byte		        61*mus_caught_mvl/mxv
	.byte	W03
	.byte		        37*mus_caught_mvl/mxv
	.byte	W03
	.byte		        25*mus_caught_mvl/mxv
	.byte	W03
	.byte	GOTO
	 .word	mus_caught_3_B1
	.byte	FINE

@********************** Track  4 **********************@

mus_caught_4:
	.byte	KEYSH , mus_caught_key+0
	.byte	W12
mus_caught_4_B1:
	.byte		VOICE , 82
	.byte		PAN   , c_v+0
	.byte		VOL   , 80*mus_caught_mvl/mxv
	.byte	W12
	.byte		N06   , Bn2 , v060
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W12
	.byte		        Cs3 
	.byte	W96
	.byte	W12
	.byte		        Bn2 
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W12
	.byte		        Cs3 
	.byte	W96
mus_caught_4_000:
	.byte	W12
	.byte		N06   , Cn3 , v060
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W12
	.byte	PEND
	.byte		        Dn3 
	.byte	W96
	.byte	PATT
	 .word	mus_caught_4_000
	.byte		N06   , Dn3 , v060
	.byte	W96
	.byte	GOTO
	 .word	mus_caught_4_B1
	.byte	FINE

@********************** Track  5 **********************@

mus_caught_5:
	.byte	KEYSH , mus_caught_key+0
	.byte	W12
mus_caught_5_B1:
	.byte		VOICE , 83
	.byte		PAN   , c_v+48
	.byte		VOL   , 80*mus_caught_mvl/mxv
	.byte		N03   , Bn5 , v032
	.byte	W12
	.byte		        An5 
	.byte	W12
	.byte		        Gs5 
	.byte	W12
	.byte		        An5 
	.byte	W12
	.byte		        Bn5 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W24
	.byte		        Cs6 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W24
	.byte		        Bn5 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W24
	.byte		N03   
	.byte	W12
	.byte		        An5 
	.byte	W12
	.byte		        Gs5 
	.byte	W12
	.byte		        An5 
	.byte	W12
	.byte		        Bn5 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W24
	.byte		        Cs6 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W24
	.byte		        Bn5 
	.byte	W48
mus_caught_5_000:
	.byte		N03   , Cn6 , v032
	.byte	W12
	.byte		        As5 
	.byte	W12
	.byte		        An5 
	.byte	W12
	.byte		        As5 
	.byte	W12
	.byte		        Cn6 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W24
	.byte	PEND
	.byte		        Dn6 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W24
	.byte		        Cn6 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W24
	.byte	PATT
	 .word	mus_caught_5_000
	.byte		N03   , Dn6 , v032
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W24
	.byte		        Cn6 
	.byte	W48
	.byte	GOTO
	 .word	mus_caught_5_B1
	.byte	FINE

@********************** Track  6 **********************@

mus_caught_6:
	.byte	KEYSH , mus_caught_key+0
	.byte	W12
mus_caught_6_B1:
	.byte		VOICE , 81
	.byte		MOD   , 0
	.byte		VOL   , 80*mus_caught_mvl/mxv
	.byte		BEND  , c_v+0
	.byte	W96
	.byte		N06   , An4 , v048
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N24   
	.byte	W12
	.byte		MOD   , 5
	.byte	W12
	.byte		        0
	.byte		N06   , Fs4 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte	W96
	.byte		        An4 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N24   
	.byte	W12
	.byte		MOD   , 5
	.byte	W12
	.byte		        0
	.byte		N06   , Gs4 
	.byte	W48
	.byte	W96
	.byte		        As4 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N24   
	.byte	W12
	.byte		MOD   , 5
	.byte	W12
	.byte		        0
	.byte		N06   , Gn4 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte	W96
	.byte		        As4 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N24   
	.byte	W12
	.byte		MOD   , 5
	.byte	W12
	.byte		        0
	.byte		N06   , An4 
	.byte	W48
	.byte	GOTO
	 .word	mus_caught_6_B1
	.byte	FINE

@********************** Track  7 **********************@

mus_caught_7:
	.byte	KEYSH , mus_caught_key+0
	.byte	W12
mus_caught_7_B1:
	.byte		VOICE , 0
	.byte		VOL   , 80*mus_caught_mvl/mxv
	.byte		N06   , En1 , v076
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		        En1 , v064
	.byte	W06
	.byte		        En1 , v112
	.byte		N06   , Fs2 , v064
	.byte	W12
	.byte		        En1 , v076
	.byte	W06
	.byte		        En1 , v064
	.byte	W06
	.byte		        En1 , v076
	.byte	W12
	.byte		        En1 , v084
	.byte	W06
	.byte		        En1 , v064
	.byte	W06
	.byte		        En1 , v112
	.byte		N06   , Fs2 , v064
	.byte	W06
	.byte		        En1 
	.byte	W06
	.byte		        En1 , v076
	.byte	W06
	.byte		        En1 , v064
	.byte	W06
mus_caught_7_000:
	.byte		N06   , En1 , v112
	.byte	W24
	.byte		        Fs2 , v064
	.byte	W24
	.byte		N12   , Bn2 , v092
	.byte	W24
	.byte		N06   , En1 , v112
	.byte		N03   , Fs2 , v064
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N06   , Fs2 , v040
	.byte	W06
	.byte		        En1 , v112
	.byte		N06   , Fs2 , v052
	.byte	W06
	.byte		        En1 , v088
	.byte		N06   , Fs2 , v060
	.byte	W06
	.byte	PEND
mus_caught_7_001:
	.byte		N06   , En1 , v076
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		        En1 , v064
	.byte	W06
	.byte		        En1 , v112
	.byte		N06   , Fs2 , v064
	.byte	W12
	.byte		        En1 , v076
	.byte	W06
	.byte		        En1 , v064
	.byte	W06
	.byte		        En1 , v076
	.byte	W12
	.byte		        En1 , v084
	.byte	W06
	.byte		        En1 , v064
	.byte	W06
	.byte		        En1 , v112
	.byte		N06   , Fs2 , v064
	.byte	W06
	.byte		        En1 
	.byte	W06
	.byte		        En1 , v076
	.byte	W06
	.byte		        En1 , v064
	.byte	W06
	.byte	PEND
	.byte	PATT
	 .word	mus_caught_7_000
	.byte	PATT
	 .word	mus_caught_7_001
	.byte	PATT
	 .word	mus_caught_7_000
	.byte	PATT
	 .word	mus_caught_7_001
	.byte	PATT
	 .word	mus_caught_7_000
	.byte	GOTO
	 .word	mus_caught_7_B1
	.byte	FINE

@******************************************************@
	.align	2

mus_caught:
	.byte	7	@ NumTrks
	.byte	0	@ NumBlks
	.byte	mus_caught_pri	@ Priority
	.byte	mus_caught_rev	@ Reverb.

	.word	mus_caught_grp

	.word	mus_caught_1
	.word	mus_caught_2
	.word	mus_caught_3
	.word	mus_caught_4
	.word	mus_caught_5
	.word	mus_caught_6
	.word	mus_caught_7

	.end
