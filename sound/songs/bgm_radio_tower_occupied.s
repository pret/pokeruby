	.include "MPlayDef.s"

	.equ	bgm_radio_tower_occupied_grp, voicegroup_8454C54
	.equ	bgm_radio_tower_occupied_pri, 0
	.equ	bgm_radio_tower_occupied_rev, reverb_set+50
	.equ	bgm_radio_tower_occupied_mvl, 127
	.equ	bgm_radio_tower_occupied_key, 0
	.equ	bgm_radio_tower_occupied_tbs, 1
	.equ	bgm_radio_tower_occupied_exg, 0
	.equ	bgm_radio_tower_occupied_cmp, 1

	.section .rodata
	.global	bgm_radio_tower_occupied
	.align	2

@********************** Track  1 **********************@

bgm_radio_tower_occupied_1:
	.byte	KEYSH , bgm_radio_tower_occupied_key+0
	.byte	TEMPO , 152*bgm_radio_tower_occupied_tbs/2
	.byte		VOICE , 21
	.byte		VOL   , 79*bgm_radio_tower_occupied_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N06   , Cn4 , v112
	.byte	W06
	.byte		        Dn4 
	.byte	W06
bgm_radio_tower_occupied_1_B1:
	.byte		N06   , Ds4 , v112
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Cn4 
	.byte	W24
	.byte		        Fn2 
	.byte	W06
	.byte		        Gs2 
	.byte	W06
	.byte		        Bn2 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte	W12
	.byte		        Ds3 
	.byte	W36
	.byte		N24   
	.byte	W24
	.byte		N12   , An2 
	.byte	W12
	.byte		N06   , Ds3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		N36   , Fs3 
	.byte	W36
	.byte		N06   , Ds3 
	.byte	W24
	.byte		        Fs3 
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte	W12
	.byte		        Ds4 
	.byte	W36
	.byte		N48   , An3 
	.byte	W48
	.byte		N36   , As3 
	.byte	W36
	.byte		N06   , An3 
	.byte	W24
	.byte		        As3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
bgm_radio_tower_occupied_1_000:
	.byte	W12
	.byte		N06   , Bn2 , v112
	.byte	W48
	.byte		        Cn3 
	.byte	W36
	.byte	PEND
	.byte	PATT
	 .word	bgm_radio_tower_occupied_1_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_1_000
	.byte	W96
bgm_radio_tower_occupied_1_001:
	.byte	W21
	.byte		N03   , Bn3 , v112
	.byte	W03
	.byte		N06   , Cn4 
	.byte	W24
	.byte		N06   
	.byte	W12
	.byte		        Gn3 
	.byte	W24
	.byte		N36   , Ds4 
	.byte	W12
	.byte	PEND
bgm_radio_tower_occupied_1_002:
	.byte	W24
	.byte		N24   , Dn4 , v112
	.byte	W24
	.byte		N06   , As3 
	.byte	W24
	.byte		        Gn3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte	PEND
	.byte		        As3 
	.byte	W36
	.byte		N03   , Fn4 
	.byte	W03
	.byte		N09   , Fs4 
	.byte	W09
	.byte		N06   , Fn4 
	.byte	W12
	.byte		        Ds4 
	.byte	W12
	.byte		        Cn4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Cn4 
	.byte	W18
	.byte		N12   , Dn4 
	.byte	W24
	.byte		        Ds4 
	.byte	W24
	.byte		N06   
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte	PATT
	 .word	bgm_radio_tower_occupied_1_001
	.byte	PATT
	 .word	bgm_radio_tower_occupied_1_002
	.byte		N06   , As3 , v112
	.byte	W36
	.byte		N03   , Fs3 
	.byte	W03
	.byte		N09   , Gn3 
	.byte	W09
	.byte		N06   , Fn3 
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        Cn3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        As2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        As2 
	.byte	W06
	.byte		        Cn3 
	.byte	W18
	.byte		N12   , Dn3 
	.byte	W24
	.byte		        Ds3 
	.byte	W12
	.byte		N06   , Fn3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
bgm_radio_tower_occupied_1_003:
	.byte	W12
	.byte		N06   , Fn3 , v112
	.byte	W48
	.byte		        Fs3 
	.byte	W36
	.byte	PEND
	.byte	PATT
	 .word	bgm_radio_tower_occupied_1_003
	.byte	PATT
	 .word	bgm_radio_tower_occupied_1_003
	.byte	W12
	.byte		N06   , Fn3 , v112
	.byte	W48
	.byte		        Fs3 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        Ds3 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte	W96
	.byte	W72
	.byte		N12   , Fn4 
	.byte	W12
	.byte		N06   , Cn4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte	GOTO
	 .word	bgm_radio_tower_occupied_1_B1
	.byte	FINE

@********************** Track  2 **********************@

bgm_radio_tower_occupied_2:
	.byte	KEYSH , bgm_radio_tower_occupied_key+0
	.byte		VOICE , 21
	.byte		VOL   , 79*bgm_radio_tower_occupied_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N06   , Cn5 , v112
	.byte	W06
	.byte		        Dn5 
	.byte	W06
bgm_radio_tower_occupied_2_B1:
	.byte		N06   , Ds5 , v112
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Cn5 
	.byte	W24
	.byte		N36   , Bn3 
	.byte	W36
	.byte	W12
	.byte		N06   , Gn3 
	.byte	W36
	.byte		N48   , An3 
	.byte	W48
	.byte		N36   , As3 
	.byte	W36
	.byte		N06   , An3 
	.byte	W24
	.byte		        As3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Cn5 
	.byte	W12
	.byte	W12
	.byte		        Gn3 
	.byte	W36
	.byte		N24   , Fn4 
	.byte	W24
	.byte		N06   , Cn4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		N36   , Fs4 
	.byte	W36
	.byte		N06   , Ds4 
	.byte	W24
	.byte		        Fs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W12
	.byte		        Ds5 
	.byte	W12
bgm_radio_tower_occupied_2_000:
	.byte	W12
	.byte		N06   , Fn3 , v112
	.byte	W48
	.byte		        Fs3 
	.byte	W36
	.byte	PEND
	.byte	PATT
	 .word	bgm_radio_tower_occupied_2_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_2_000
	.byte		N06   , Gs3 , v112
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Bn2 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Cs3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
bgm_radio_tower_occupied_2_001:
	.byte	W21
	.byte		N03   , Dn4 , v112
	.byte	W03
	.byte		N06   , Ds4 
	.byte	W24
	.byte		N06   
	.byte	W12
	.byte		        Cn4 
	.byte	W24
	.byte		N36   , Fs4 
	.byte	W12
	.byte	PEND
bgm_radio_tower_occupied_2_002:
	.byte	W24
	.byte		N24   , Fn4 , v112
	.byte	W24
	.byte		N06   , Ds4 
	.byte	W24
	.byte		        Cn4 
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte	PEND
	.byte		        Ds4 
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N03   , An4 
	.byte	W03
	.byte		TIE   , As4 
	.byte	W56
	.byte	W01
	.byte	W72
	.byte		EOT   
	.byte	W12
	.byte		N06   , Cn5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte	PATT
	 .word	bgm_radio_tower_occupied_2_001
	.byte	PATT
	 .word	bgm_radio_tower_occupied_2_002
	.byte		N06   , Ds4 , v112
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N03   , Bn3 
	.byte	W03
	.byte		TIE   , Cn4 
	.byte	W56
	.byte	W01
	.byte	W72
	.byte		EOT   
	.byte		N06   , As3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		N03   , Bn3 
	.byte	W03
	.byte		N09   , Cn4 
	.byte	W09
	.byte		N12   , Ds4 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		N24   , Fs4 
	.byte	W24
	.byte		        Fn4 
	.byte	W24
	.byte		N12   , Cn4 
	.byte	W12
	.byte		N03   , Dn4 
	.byte	W03
	.byte		N24   , Ds4 
	.byte	W24
	.byte	W03
	.byte		N03   , Dn4 
	.byte	W03
	.byte		        Cs4 
	.byte	W03
	.byte		N36   , Cn4 
	.byte	W36
	.byte		N06   , Fn4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		N12   , Cn4 
	.byte	W12
	.byte		        Ds4 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		N24   , Fn4 
	.byte	W24
	.byte		        Fs4 
	.byte	W24
	.byte		N12   , Cn4 
	.byte	W12
	.byte		N06   , Bn3 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte		N24   , Ds4 
	.byte	W36
	.byte		N06   , Dn4 
	.byte	W12
	.byte		        Cn4 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		N03   , Bn3 
	.byte	W03
	.byte		N44   , Cn4 
	.byte	W44
	.byte	W01
	.byte		N48   , Cs4 
	.byte	W48
	.byte		        Dn4 
	.byte	W48
	.byte		        Ds4 
	.byte	W48
	.byte		N06   , En4 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		N12   , Bn4 
	.byte	W12
	.byte		N06   , Cn5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte	GOTO
	 .word	bgm_radio_tower_occupied_2_B1
	.byte	FINE

@********************** Track  3 **********************@

bgm_radio_tower_occupied_3:
	.byte	KEYSH , bgm_radio_tower_occupied_key+0
	.byte		VOICE , 21
	.byte		VOL   , 79*bgm_radio_tower_occupied_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W12
bgm_radio_tower_occupied_3_B1:
	.byte		N06   , Fn2 , v112
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		        Cn3 
	.byte	W12
	.byte		        Dn3 
	.byte	W24
	.byte		N36   , Dn2 
	.byte	W36
bgm_radio_tower_occupied_3_000:
	.byte		N06   , Cn2 , v112
	.byte	W12
	.byte		        Cn3 
	.byte	W12
	.byte		        Cn2 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        Cn3 
	.byte	W12
	.byte		        Cn2 
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte	PEND
bgm_radio_tower_occupied_3_001:
	.byte		N06   , Cn2 , v112
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        Fs2 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_001
bgm_radio_tower_occupied_3_002:
	.byte		N06   , Gs1 , v112
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        Gs2 
	.byte	W06
	.byte		        Fs2 
	.byte	W06
	.byte		        Ds2 
	.byte	W06
	.byte		        Cn2 
	.byte	W06
	.byte	PEND
bgm_radio_tower_occupied_3_003:
	.byte		N06   , Gs1 , v112
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        Cn2 
	.byte	W12
	.byte		        Fs2 
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_002
	.byte		N06   , Gs1 , v112
	.byte	W12
	.byte		        Fn2 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        Fs2 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_001
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_001
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_001
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_000
	.byte		N06   , Cn2 , v112
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        Dn2 
	.byte	W06
	.byte		        Ds2 
	.byte	W06
	.byte		        En2 
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_002
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_003
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_002
	.byte	PATT
	 .word	bgm_radio_tower_occupied_3_003
	.byte		N06   , Cn2 , v112
	.byte	W12
	.byte		        Cn3 
	.byte	W12
	.byte		        Cn2 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        Cs2 
	.byte	W12
	.byte		        Cs3 
	.byte	W12
	.byte		        As2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        En2 
	.byte	W06
	.byte		        Cs2 
	.byte	W06
	.byte		        Dn2 
	.byte	W12
	.byte		        Dn3 
	.byte	W12
	.byte		        Dn2 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        Cn3 
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		        Fs2 
	.byte	W06
	.byte		        Ds2 
	.byte	W06
	.byte		        En2 
	.byte	W12
	.byte		        Cs3 
	.byte	W12
	.byte		        Fn2 
	.byte	W12
	.byte		        Dn3 
	.byte	W12
	.byte		        Fs2 
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		        As2 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte		N12   , Bn2 
	.byte	W12
	.byte		N06   , Gs3 
	.byte	W12
	.byte	GOTO
	 .word	bgm_radio_tower_occupied_3_B1
	.byte	FINE

@********************** Track  4 **********************@

bgm_radio_tower_occupied_4:
	.byte	KEYSH , bgm_radio_tower_occupied_key+0
	.byte		VOICE , 126
	.byte		PAN   , c_v+0
	.byte		VOL   , 41*bgm_radio_tower_occupied_mvl/mxv
	.byte	W12
bgm_radio_tower_occupied_4_B1:
	.byte	W96
bgm_radio_tower_occupied_4_000:
	.byte	W12
	.byte		N12   , Gn5 , v032
	.byte	W24
	.byte		        Gn5 , v040
	.byte	W24
	.byte		        Gn5 , v036
	.byte	W24
	.byte		N12   
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	W96
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	W12
	.byte		N12   , Gn5 , v032
	.byte	W24
	.byte		        Gn5 , v040
	.byte	W24
	.byte		        Gn5 , v036
	.byte	W36
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_4_000
	.byte	W96
	.byte	W96
	.byte	GOTO
	 .word	bgm_radio_tower_occupied_4_B1
	.byte	FINE

@********************** Track  5 **********************@

bgm_radio_tower_occupied_5:
	.byte	KEYSH , bgm_radio_tower_occupied_key+0
	.byte		VOICE , 0
	.byte		VOL   , 79*bgm_radio_tower_occupied_mvl/mxv
	.byte		PAN   , c_v+4
	.byte	W12
bgm_radio_tower_occupied_5_B1:
	.byte		N48   , An2 , v112
	.byte	W48
	.byte		N12   , En1 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		N06   , En1 , v056
	.byte	W06
	.byte		N06   
	.byte	W06
	.byte		        En1 , v068
	.byte	W06
	.byte		N06   
	.byte	W06
bgm_radio_tower_occupied_5_000:
	.byte		N12   , Cn1 , v112
	.byte	W24
	.byte		        En1 
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		        En1 
	.byte	W24
	.byte	PEND
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte		N48   , An2 , v112
	.byte	W48
	.byte		N12   , En1 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		N06   , En1 
	.byte	W06
	.byte		N06   
	.byte	W06
	.byte		N06   
	.byte	W06
	.byte		N06   
	.byte	W06
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte		N12   , Cn1 , v112
	.byte	W24
	.byte		        En1 
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		N06   , En1 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		N06   
	.byte	W06
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte	PATT
	 .word	bgm_radio_tower_occupied_5_000
	.byte		N48   , An2 , v112
	.byte	W48
	.byte		N12   , En1 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		N06   , En1 , v048
	.byte	W06
	.byte		N06   
	.byte	W06
	.byte		        En1 , v072
	.byte	W06
	.byte		N06   
	.byte	W06
	.byte		N48   , An2 , v108
	.byte	W48
	.byte		N12   , En1 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		N06   , En1 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		N06   
	.byte	W06
	.byte	GOTO
	 .word	bgm_radio_tower_occupied_5_B1
	.byte	FINE

@******************************************************@
	.align	2

bgm_radio_tower_occupied:
	.byte	5	@ NumTrks
	.byte	0	@ NumBlks
	.byte	bgm_radio_tower_occupied_pri	@ Priority
	.byte	bgm_radio_tower_occupied_rev	@ Reverb.

	.word	bgm_radio_tower_occupied_grp

	.word	bgm_radio_tower_occupied_1
	.word	bgm_radio_tower_occupied_2
	.word	bgm_radio_tower_occupied_3
	.word	bgm_radio_tower_occupied_4
	.word	bgm_radio_tower_occupied_5

	.end
