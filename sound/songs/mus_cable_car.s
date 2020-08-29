	.include "MPlayDef.s"

	.equ	mus_cable_car_grp, voicegroup068
	.equ	mus_cable_car_pri, 0
	.equ	mus_cable_car_rev, reverb_set+50
	.equ	mus_cable_car_mvl, 127
	.equ	mus_cable_car_key, 0
	.equ	mus_cable_car_tbs, 1
	.equ	mus_cable_car_exg, 0
	.equ	mus_cable_car_cmp, 1

	.section .rodata
	.global	mus_cable_car
	.align	2

@********************** Track  1 **********************@

mus_cable_car_1:
	.byte	KEYSH , mus_cable_car_key+0
	.byte	TEMPO , 120*mus_cable_car_tbs/2
	.byte		VOICE , 56
	.byte		VOL   , 55*mus_cable_car_mvl/mxv
	.byte		PAN   , c_v+24
	.byte		N06   , An3 , v112
	.byte	W06
	.byte		N04   , An3 , v036
	.byte	W18
	.byte		N03   , An3 , v112
	.byte	W03
	.byte		        An3 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N02   , Cn4 , v112
	.byte	W02
	.byte		N04   , Cn4 , v036
	.byte	W10
	.byte		VOL   , 25*mus_cable_car_mvl/mxv
	.byte		N24   , As3 , v112
	.byte	W02
	.byte		VOL   , 28*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        33*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        39*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        42*mus_cable_car_mvl/mxv
	.byte	W02
	.byte		        46*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        55*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        58*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        49*mus_cable_car_mvl/mxv
	.byte		N06   , Cn4 
	.byte	W06
	.byte		N04   , Cn4 , v036
	.byte	W06
	.byte		VOL   , 55*mus_cable_car_mvl/mxv
	.byte		N06   , An3 , v112
	.byte	W06
	.byte		N04   , An3 , v036
	.byte	W06
	.byte		N03   , An3 , v112
	.byte	W12
	.byte		N03   
	.byte	W03
	.byte		        An3 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N02   , Cn4 , v112
	.byte	W02
	.byte		N04   , Cn4 , v036
	.byte	W10
	.byte		VOL   , 25*mus_cable_car_mvl/mxv
	.byte		N24   , As3 , v112
	.byte	W02
	.byte		VOL   , 28*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        33*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        39*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        42*mus_cable_car_mvl/mxv
	.byte	W02
	.byte		        46*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        55*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        58*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        49*mus_cable_car_mvl/mxv
	.byte		N06   , Cn4 
	.byte	W06
	.byte		N04   , Cn4 , v036
	.byte	W06
	.byte		VOL   , 55*mus_cable_car_mvl/mxv
	.byte		N06   , Cs4 , v112
	.byte	W06
	.byte		N04   , Cs4 , v036
	.byte	W18
	.byte		N03   , Cs4 , v112
	.byte	W03
	.byte		        Cs4 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N02   , En4 , v112
	.byte	W02
	.byte		N04   , En4 , v036
	.byte	W10
	.byte		VOL   , 25*mus_cable_car_mvl/mxv
	.byte		N24   , Dn4 , v112
	.byte	W02
	.byte		VOL   , 28*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        33*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        39*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        42*mus_cable_car_mvl/mxv
	.byte	W02
	.byte		        46*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        55*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        58*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        49*mus_cable_car_mvl/mxv
	.byte		N06   , En4 
	.byte	W06
	.byte		N04   , En4 , v036
	.byte	W06
	.byte		VOL   , 55*mus_cable_car_mvl/mxv
	.byte		N06   , Cs4 , v112
	.byte	W06
	.byte		N04   , Cs4 , v036
	.byte	W06
	.byte		N03   , Cs4 , v112
	.byte	W12
	.byte		N03   
	.byte	W03
	.byte		        Cs4 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        En4 , v112
	.byte	W03
	.byte		N04   , En4 , v036
	.byte	W09
	.byte		VOL   , 25*mus_cable_car_mvl/mxv
	.byte		N24   , Dn4 , v112
	.byte	W02
	.byte		VOL   , 28*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        33*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        39*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        42*mus_cable_car_mvl/mxv
	.byte	W02
	.byte		        46*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        55*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        58*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        49*mus_cable_car_mvl/mxv
	.byte		N06   , En4 
	.byte	W06
	.byte		N04   , En4 , v036
	.byte	W06
	.byte		VOL   , 55*mus_cable_car_mvl/mxv
	.byte		TIE   , Fs4 , v112
	.byte	W48
	.byte		VOL   , 50*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        49*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        47*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        44*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        44*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        42*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        41*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        39*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        38*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        36*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        33*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        31*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        30*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        29*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        28*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        27*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        25*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        22*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        22*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        21*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        19*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        19*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        17*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        16*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        14*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        14*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        12*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        11*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        9*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        8*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		EOT   
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	FINE

@********************** Track  2 **********************@

mus_cable_car_2:
	.byte	KEYSH , mus_cable_car_key+0
	.byte		VOICE , 58
	.byte		PAN   , c_v+0
	.byte		VOL   , 76*mus_cable_car_mvl/mxv
	.byte		N06   , Dn2 , v112
	.byte	W24
	.byte		        An1 
	.byte	W24
	.byte		        En2 
	.byte	W24
	.byte		        An1 
	.byte	W24
	.byte		        Dn2 
	.byte	W24
	.byte		        An1 
	.byte	W24
	.byte		        En2 
	.byte	W24
	.byte		        An1 
	.byte	W24
	.byte		        Fs2 
	.byte	W24
	.byte		        Cs2 
	.byte	W24
	.byte		        Gs2 
	.byte	W24
	.byte		        Cs2 
	.byte	W24
	.byte		        Fs2 
	.byte	W24
	.byte		        Cs2 
	.byte	W24
	.byte		        Gs2 
	.byte	W24
	.byte		        Cs2 
	.byte	W12
	.byte		        Bn1 
	.byte	W06
	.byte		N03   , As1 
	.byte	W03
	.byte		        Gs1 
	.byte	W03
	.byte		TIE   , Fs1 , v124
	.byte	W72
	.byte		VOL   , 61*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        58*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        56*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        55*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        53*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        50*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        47*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        44*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        44*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        41*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        39*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        36*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        31*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        28*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        28*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        24*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        22*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        19*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        17*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        14*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        12*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        11*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        9*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        8*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        5*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        3*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        1*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		EOT   
	.byte	W96
	.byte		VOL   , 1*mus_cable_car_mvl/mxv
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	FINE

@********************** Track  3 **********************@

mus_cable_car_3:
	.byte	KEYSH , mus_cable_car_key+0
	.byte		VOICE , 60
	.byte		PAN   , c_v-24
	.byte		VOL   , 49*mus_cable_car_mvl/mxv
	.byte		N06   , Fs2 , v112
	.byte	W24
	.byte		N03   
	.byte	W03
	.byte		        Fs2 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        An2 , v112
	.byte	W12
	.byte		VOL   , 25*mus_cable_car_mvl/mxv
	.byte		N24   , Gn2 
	.byte	W02
	.byte		VOL   , 28*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        33*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        39*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        42*mus_cable_car_mvl/mxv
	.byte	W02
	.byte		        46*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        55*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        58*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        49*mus_cable_car_mvl/mxv
	.byte		N06   , An2 
	.byte	W12
	.byte		VOL   , 49*mus_cable_car_mvl/mxv
	.byte		N06   , Fs2 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W03
	.byte		        Fs2 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        An2 , v112
	.byte	W12
	.byte		VOL   , 25*mus_cable_car_mvl/mxv
	.byte		N24   , Gn2 
	.byte	W02
	.byte		VOL   , 28*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        33*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        39*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        42*mus_cable_car_mvl/mxv
	.byte	W02
	.byte		        46*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        55*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        58*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        49*mus_cable_car_mvl/mxv
	.byte		N06   , An2 
	.byte	W12
	.byte		        As2 
	.byte	W24
	.byte		N03   
	.byte	W03
	.byte		        As2 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        Cs3 , v112
	.byte	W12
	.byte		VOL   , 25*mus_cable_car_mvl/mxv
	.byte		N24   , Bn2 
	.byte	W02
	.byte		VOL   , 28*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        33*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        39*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        42*mus_cable_car_mvl/mxv
	.byte	W02
	.byte		        46*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        55*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        58*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        49*mus_cable_car_mvl/mxv
	.byte		N06   , Cs3 
	.byte	W12
	.byte		        As2 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W03
	.byte		        As2 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        Cs3 , v112
	.byte	W12
	.byte		VOL   , 25*mus_cable_car_mvl/mxv
	.byte		N24   , Bn2 
	.byte	W02
	.byte		VOL   , 28*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        33*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        39*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        42*mus_cable_car_mvl/mxv
	.byte	W02
	.byte		        46*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        55*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        58*mus_cable_car_mvl/mxv
	.byte	W03
	.byte		        49*mus_cable_car_mvl/mxv
	.byte		N06   , Cs3 
	.byte	W06
	.byte		N03   , En3 
	.byte	W03
	.byte		        Fn3 
	.byte	W03
	.byte		TIE   , Fs3 
	.byte	W48
	.byte		VOL   , 48*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        47*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        47*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        45*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        44*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        42*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        41*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        39*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        38*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        36*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        33*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        31*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        30*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        29*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        28*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        27*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        25*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        22*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        22*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        21*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        19*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        19*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        17*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        16*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        14*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        14*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        12*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        11*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        9*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        8*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		EOT   
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	FINE

@********************** Track  4 **********************@

mus_cable_car_4:
	.byte	KEYSH , mus_cable_car_key+0
	.byte		VOICE , 127
	.byte		PAN   , c_v+0
	.byte		VOL   , 34*mus_cable_car_mvl/mxv
	.byte		N02   , En4 , v112
	.byte	W24
	.byte		N02   
	.byte	W06
	.byte		        En4 , v064
	.byte	W06
	.byte		        En4 , v112
	.byte	W06
	.byte		        En4 , v060
	.byte	W06
	.byte		        En4 , v112
	.byte	W12
	.byte		N02   
	.byte	W24
	.byte		N03   
	.byte	W03
	.byte		        En4 , v052
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
mus_cable_car_4_000:
	.byte		N02   , En4 , v112
	.byte	W12
	.byte		        En4 , v096
	.byte	W12
	.byte		        En4 , v112
	.byte	W06
	.byte		        En4 , v064
	.byte	W06
	.byte		        En4 , v112
	.byte	W06
	.byte		        En4 , v060
	.byte	W06
	.byte		        En4 , v112
	.byte	W12
	.byte		N02   
	.byte	W24
	.byte		N03   
	.byte	W03
	.byte		        En4 , v052
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte	PEND
	.byte		N02   , En4 , v112
	.byte	W24
	.byte		N02   
	.byte	W06
	.byte		        En4 , v064
	.byte	W06
	.byte		        En4 , v112
	.byte	W06
	.byte		        En4 , v060
	.byte	W06
	.byte		        En4 , v112
	.byte	W12
	.byte		N02   
	.byte	W24
	.byte		N03   
	.byte	W03
	.byte		        En4 , v052
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte	PATT
	 .word	mus_cable_car_4_000
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	FINE

@********************** Track  5 **********************@

mus_cable_car_5:
	.byte	KEYSH , mus_cable_car_key+0
	.byte		VOICE , 60
	.byte		VOL   , 77*mus_cable_car_mvl/mxv
	.byte		MOD   , 2
	.byte		N08   , Dn3 , v112
	.byte	W08
	.byte		        Dn3 , v036
	.byte	W08
	.byte		        Fs3 , v112
	.byte	W08
	.byte		N24   , An3 
	.byte	W24
	.byte		N08   , En3 
	.byte	W08
	.byte		        En3 , v036
	.byte	W08
	.byte		        Gn3 , v112
	.byte	W08
	.byte		N16   , Cn4 
	.byte	W16
	.byte		N04   , Bn3 
	.byte	W04
	.byte		        As3 
	.byte	W04
	.byte		N72   , An3 
	.byte	W48
	.byte		MOD   , 5
	.byte	W24
	.byte		        0
	.byte		N08   , An3 , v036
	.byte	W08
	.byte		        Gn3 , v112
	.byte	W08
	.byte		N04   , An3 
	.byte	W04
	.byte		        An3 , v036
	.byte	W04
	.byte		N08   , Fs3 , v112
	.byte	W08
	.byte		        Fs3 , v036
	.byte	W08
	.byte		        As3 , v112
	.byte	W08
	.byte		N24   , Cs4 
	.byte	W12
	.byte		MOD   , 4
	.byte	W12
	.byte		        0
	.byte		N08   , Gs3 
	.byte	W08
	.byte		        Gs3 , v036
	.byte	W08
	.byte		        Bn3 , v112
	.byte	W08
	.byte		N16   , En4 
	.byte	W16
	.byte		N04   , Ds4 
	.byte	W04
	.byte		        Dn4 
	.byte	W04
	.byte		N48   , Cs4 
	.byte	W24
	.byte		MOD   , 5
	.byte	W24
	.byte		        0
	.byte		N04   , En4 
	.byte	W04
	.byte		        En4 , v036
	.byte	W04
	.byte		        Dn4 , v112
	.byte	W04
	.byte		        Dn4 , v036
	.byte	W04
	.byte		        En4 , v112
	.byte	W04
	.byte		        En4 , v036
	.byte	W04
	.byte		N24   , Fn4 , v112
	.byte	W24
	.byte		TIE   , Fs4 
	.byte	W48
	.byte		MOD   , 5
	.byte	W24
	.byte		VOL   , 61*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        58*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        56*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        55*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        53*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        50*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        47*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        44*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        44*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        41*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        39*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        36*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        31*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        28*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        28*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        24*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        22*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        19*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        17*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        14*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        12*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        11*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        9*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        8*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        5*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        3*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        1*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		EOT   
	.byte	W96
	.byte		VOL   , 1*mus_cable_car_mvl/mxv
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	FINE

@********************** Track  6 **********************@

mus_cable_car_6:
	.byte	KEYSH , mus_cable_car_key+0
	.byte		VOICE , 80
	.byte		VOL   , 36*mus_cable_car_mvl/mxv
	.byte		PAN   , c_v-62
	.byte		N06   , Fs3 , v112
	.byte	W24
	.byte		N03   
	.byte	W03
	.byte		        Fs3 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        An3 , v112
	.byte	W12
	.byte		N24   , Gn3 
	.byte	W24
	.byte		N06   , An3 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W03
	.byte		        Fs3 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        An3 , v112
	.byte	W12
	.byte		N24   , Gn3 
	.byte	W24
	.byte		N06   , An3 
	.byte	W12
	.byte		        As3 
	.byte	W24
	.byte		N03   
	.byte	W03
	.byte		        As3 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        Cs4 , v112
	.byte	W12
	.byte		N24   , Bn3 
	.byte	W24
	.byte		N06   , Cs4 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W03
	.byte		        As3 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        Cs4 , v112
	.byte	W12
	.byte		N24   , Bn3 
	.byte	W24
	.byte		N06   , Gs3 
	.byte	W12
	.byte		TIE   , As3 
	.byte	W48
	.byte		VOL   , 33*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        31*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        28*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        25*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        25*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        24*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        22*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        21*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        19*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        17*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        16*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        14*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        14*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        12*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        11*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        9*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        8*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        7*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        6*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        4*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        3*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        2*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        1*mus_cable_car_mvl/mxv
	.byte	W12
	.byte		        1*mus_cable_car_mvl/mxv
	.byte	W28
	.byte		        2*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		EOT   
	.byte	W96
	.byte		VOL   , 1*mus_cable_car_mvl/mxv
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	FINE

@********************** Track  7 **********************@

mus_cable_car_7:
	.byte	KEYSH , mus_cable_car_key+0
	.byte		VOICE , 81
	.byte		PAN   , c_v+63
	.byte		VOL   , 34*mus_cable_car_mvl/mxv
	.byte		N06   , An3 , v112
	.byte	W24
	.byte		N03   
	.byte	W03
	.byte		        An3 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        Cn4 , v112
	.byte	W12
	.byte		N24   , As3 
	.byte	W24
	.byte		N06   , Cn4 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W03
	.byte		        An3 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        Cn4 , v112
	.byte	W12
	.byte		N24   , As3 
	.byte	W24
	.byte		N06   , Cn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W24
	.byte		N03   
	.byte	W03
	.byte		        Cs4 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        En4 , v112
	.byte	W12
	.byte		N24   , Dn4 
	.byte	W24
	.byte		N06   , En4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		N03   
	.byte	W12
	.byte		N03   
	.byte	W03
	.byte		        Cs4 , v080
	.byte	W03
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        En4 , v112
	.byte	W12
	.byte		N24   , Dn4 
	.byte	W24
	.byte		N06   , En4 
	.byte	W12
	.byte		TIE   , Fs4 
	.byte	W48
	.byte		VOL   , 33*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        31*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        30*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        29*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        28*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        28*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        27*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        25*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        24*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        22*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        19*mus_cable_car_mvl/mxv
	.byte	W04
	.byte	W04
	.byte		        19*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        17*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        16*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        14*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        14*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        11*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        9*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        9*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        8*mus_cable_car_mvl/mxv
	.byte	W08
	.byte		        7*mus_cable_car_mvl/mxv
	.byte	W12
	.byte		        6*mus_cable_car_mvl/mxv
	.byte	W12
	.byte		        5*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        4*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        3*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		        2*mus_cable_car_mvl/mxv
	.byte	W04
	.byte		EOT   
	.byte	W96
	.byte		VOL   , 1*mus_cable_car_mvl/mxv
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	FINE

@********************** Track  8 **********************@

mus_cable_car_8:
	.byte		VOL   , 78*mus_cable_car_mvl/mxv
	.byte	KEYSH , mus_cable_car_key+0
	.byte		VOICE , 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N96   , Bn2 , v112
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	FINE

@********************** Track  9 **********************@

mus_cable_car_9:
	.byte	KEYSH , mus_cable_car_key+0
	.byte		VOICE , 83
	.byte		PAN   , c_v+0
	.byte		VOL   , 47*mus_cable_car_mvl/mxv
	.byte		N06   , Dn2 , v112
	.byte	W24
	.byte		        An1 
	.byte	W24
	.byte		        En2 
	.byte	W24
	.byte		        An1 
	.byte	W24
	.byte		        Dn2 
	.byte	W24
	.byte		        An1 
	.byte	W24
	.byte		        En2 
	.byte	W24
	.byte		        An1 
	.byte	W24
	.byte		        Fs2 
	.byte	W24
	.byte		        Cs2 
	.byte	W24
	.byte		        Gs2 
	.byte	W24
	.byte		        Cs2 
	.byte	W24
	.byte		        Fs2 
	.byte	W24
	.byte		        Cs2 
	.byte	W24
	.byte		        Gs2 
	.byte	W24
	.byte		        Cs2 
	.byte	W12
	.byte		        Bn1 
	.byte	W06
	.byte		N03   , As1 
	.byte	W03
	.byte		        Gs1 
	.byte	W03
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	FINE

@******************************************************@
	.align	2

mus_cable_car:
	.byte	9	@ NumTrks
	.byte	0	@ NumBlks
	.byte	mus_cable_car_pri	@ Priority
	.byte	mus_cable_car_rev	@ Reverb.

	.word	mus_cable_car_grp

	.word	mus_cable_car_1
	.word	mus_cable_car_2
	.word	mus_cable_car_3
	.word	mus_cable_car_4
	.word	mus_cable_car_5
	.word	mus_cable_car_6
	.word	mus_cable_car_7
	.word	mus_cable_car_8
	.word	mus_cable_car_9

	.end
