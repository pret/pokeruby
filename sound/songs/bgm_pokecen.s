	.include "MPlayDef.s"

	.equ	bgm_pokecen_grp, voicegroup043
	.equ	bgm_pokecen_pri, 0
	.equ	bgm_pokecen_rev, reverb_set+50
	.equ	bgm_pokecen_mvl, 127
	.equ	bgm_pokecen_key, 0
	.equ	bgm_pokecen_tbs, 1
	.equ	bgm_pokecen_exg, 0
	.equ	bgm_pokecen_cmp, 1

	.section .rodata
	.global	bgm_pokecen
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

bgm_pokecen_1:
	.byte	KEYSH , bgm_pokecen_key+0
@ 000   ----------------------------------------
	.byte	TEMPO , 104*bgm_pokecen_tbs/2
	.byte		VOICE , 2
	.byte		PAN   , c_v+0
	.byte		VOL   , 29*bgm_pokecen_mvl/mxv
	.byte	W96
bgm_pokecen_1_B1:
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte		N12   , An3 , v112
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		N24   , Dn3 
	.byte	W24
	.byte		N12   , Fs3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
@ 015   ----------------------------------------
	.byte		N24   , Gs3 
	.byte	W24
	.byte		N12   , Fs3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		N24   , Fn3 
	.byte	W24
	.byte		        Gs3 
	.byte	W24
@ 016   ----------------------------------------
	.byte		N12   , An3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        Cs3 , v100
	.byte	W12
	.byte		        En3 , v096
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte	GOTO
	 .word	bgm_pokecen_1_B1
bgm_pokecen_1_B2:
@ 017   ----------------------------------------
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

bgm_pokecen_2:
	.byte	KEYSH , bgm_pokecen_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 73
	.byte		VOL   , 3*bgm_pokecen_mvl/mxv
	.byte		LFOS  , 44
	.byte		MOD   , 1
	.byte		PAN   , c_v-7
	.byte		N72   , En3 , v120
	.byte	W03
	.byte		VOL   , 8*bgm_pokecen_mvl/mxv
	.byte	W02
	.byte		        9*bgm_pokecen_mvl/mxv
	.byte	W07
	.byte		        10*bgm_pokecen_mvl/mxv
	.byte	W02
	.byte		        10*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        11*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        14*bgm_pokecen_mvl/mxv
	.byte	W04
	.byte		        15*bgm_pokecen_mvl/mxv
	.byte	W02
	.byte		        16*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        17*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        19*bgm_pokecen_mvl/mxv
	.byte	W04
	.byte		        21*bgm_pokecen_mvl/mxv
	.byte	W02
	.byte		        22*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        23*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        26*bgm_pokecen_mvl/mxv
	.byte	W04
	.byte		        28*bgm_pokecen_mvl/mxv
	.byte	W02
	.byte		        34*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        41*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        44*bgm_pokecen_mvl/mxv
	.byte	W01
	.byte		        52*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        60*bgm_pokecen_mvl/mxv
	.byte	W02
	.byte		        62*bgm_pokecen_mvl/mxv
	.byte	W01
	.byte		        73*bgm_pokecen_mvl/mxv
	.byte	W02
	.byte		        70*bgm_pokecen_mvl/mxv
	.byte	W01
	.byte		        80*bgm_pokecen_mvl/mxv
	.byte	W02
	.byte		        76*bgm_pokecen_mvl/mxv
	.byte	W01
	.byte		        86*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        78*bgm_pokecen_mvl/mxv
	.byte		N02   , Gs3 , v112
	.byte	W02
	.byte		        An3 
	.byte	W02
	.byte		N08   , Gs3 
	.byte	W09
	.byte		N06   , Fs3 
	.byte	W05
	.byte		        Gs3 
	.byte	W06
bgm_pokecen_2_B1:
@ 001   ----------------------------------------
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte	W32
	.byte	W01
	.byte		N03   , Ds4 , v072
	.byte	W03
	.byte		N06   , En4 , v112
	.byte	W12
	.byte		        En4 , v016
	.byte	W12
	.byte		        En4 , v108
	.byte	W12
	.byte		N02   , Dn4 , v112
	.byte	W02
	.byte		        En4 
	.byte	W02
	.byte		N08   , Dn4 
	.byte	W09
	.byte		N06   , Cs4 
	.byte	W05
	.byte		        An3 
	.byte	W06
@ 002   ----------------------------------------
	.byte		        Bn3 
	.byte	W12
	.byte		N12   , Gs3 , v092
	.byte	W06
	.byte		MOD   , 5
	.byte	W06
	.byte		        1
	.byte		N12   , Gs3 , v016
	.byte	W48
	.byte		N06   , Fs3 , v112
	.byte	W12
	.byte		        Gn3 
	.byte	W12
@ 003   ----------------------------------------
	.byte	W32
	.byte	W01
	.byte		N03   , Cn4 , v068
	.byte	W03
	.byte		N06   , Cs4 , v112
	.byte	W12
	.byte		        Cs4 , v016
	.byte	W12
	.byte		        Bn3 , v112
	.byte	W12
	.byte		        Bn3 , v016
	.byte	W12
	.byte		        Gs3 , v112
	.byte	W12
@ 004   ----------------------------------------
	.byte		        An3 
	.byte	W12
	.byte		N24   , Cs4 
	.byte	W06
	.byte		MOD   , 5
	.byte	W18
	.byte		        1
	.byte		N06   , En3 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		        Gs3 
	.byte	W09
	.byte		N03   , As3 , v076
	.byte	W03
	.byte		N06   , An3 , v112
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
@ 005   ----------------------------------------
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte	W32
	.byte	W01
	.byte		N03   , Ds5 , v072
	.byte	W03
	.byte		N06   , En5 , v112
	.byte	W12
	.byte		        En5 , v016
	.byte	W12
	.byte		        Dn5 , v092
	.byte	W12
	.byte		        Dn5 , v016
	.byte	W12
	.byte		        Cs5 , v092
	.byte	W12
@ 006   ----------------------------------------
	.byte		        Bn4 , v112
	.byte	W12
	.byte		N12   , Gs4 , v092
	.byte	W12
	.byte		MOD   , 1
	.byte		N12   , Gs4 , v016
	.byte	W48
	.byte		N02   , Bn4 , v112
	.byte	W02
	.byte		        Cs5 
	.byte	W02
	.byte		N08   , Bn4 
	.byte	W09
	.byte		N06   , As4 
	.byte	W05
	.byte		        Bn4 
	.byte	W06
@ 007   ----------------------------------------
	.byte		        Gs4 
	.byte	W24
	.byte		N06   
	.byte	W09
	.byte		N03   , Cn5 , v068
	.byte	W03
	.byte		N06   , Cs5 , v112
	.byte	W12
	.byte		        Cs5 , v016
	.byte	W12
	.byte		        Bn4 , v112
	.byte	W12
	.byte		        Bn4 , v016
	.byte	W12
	.byte		        Gs4 , v112
	.byte	W12
@ 008   ----------------------------------------
	.byte		N24   , An3 
	.byte	W12
	.byte		MOD   , 5
	.byte	W12
	.byte		N03   , Gs3 , v064
	.byte	W03
	.byte		        An3 
	.byte	W03
	.byte		        As3 
	.byte	W03
	.byte		        Bn3 
	.byte	W03
	.byte		        Cn4 
	.byte	W03
	.byte		        Cs4 
	.byte	W03
	.byte		        Dn4 
	.byte	W03
	.byte		        Ds4 
	.byte	W03
	.byte		MOD   , 1
	.byte		N24   , En4 , v088
	.byte	W12
	.byte		MOD   , 5
	.byte	W12
	.byte		N03   , Fn4 , v064
	.byte	W03
	.byte		        Fs4 
	.byte	W03
	.byte		        Gn4 
	.byte	W03
	.byte		        Gs4 
	.byte	W03
	.byte		        An4 , v068
	.byte	W03
	.byte		        As4 , v076
	.byte	W03
	.byte		        Bn4 , v080
	.byte	W03
	.byte		        Cn5 , v092
	.byte	W03
@ 009   ----------------------------------------
	.byte		MOD   , 1
	.byte		VOL   , 69*bgm_pokecen_mvl/mxv
	.byte		PAN   , c_v-2
	.byte		N48   , Cs5 , v112
	.byte	W36
	.byte		MOD   , 7
	.byte	W12
	.byte		        2
	.byte		N36   , En5 
	.byte	W24
	.byte		MOD   , 7
	.byte	W12
	.byte		        0
	.byte		N06   , Cn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
@ 010   ----------------------------------------
	.byte		N12   , Dn5 
	.byte	W12
	.byte		        En5 
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Bn4 
	.byte	W18
	.byte		N06   , Gs4 
	.byte	W06
	.byte		N02   , Cs5 
	.byte	W02
	.byte		        Dn5 
	.byte	W02
	.byte		N08   , Cs5 
	.byte	W09
	.byte		N06   , Bn4 
	.byte	W05
	.byte		        An4 
	.byte	W06
@ 011   ----------------------------------------
	.byte		        Bn4 
	.byte	W06
	.byte		        En4 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        En4 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        An4 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		N12   , Dn5 
	.byte	W12
	.byte		N09   , Gs4 
	.byte	W09
	.byte		N03   , Cn5 
	.byte	W03
@ 012   ----------------------------------------
	.byte		N12   , Cs5 
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		N06   , An4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		N02   , En5 
	.byte	W02
	.byte		        Fs5 
	.byte	W02
	.byte		N08   , En5 
	.byte	W09
	.byte		N06   , Cs5 
	.byte	W05
	.byte		        Bn4 
	.byte	W06
@ 013   ----------------------------------------
	.byte		VOL   , 69*bgm_pokecen_mvl/mxv
	.byte	W06
	.byte		N06   , En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
@ 014   ----------------------------------------
	.byte		VOL   , 60*bgm_pokecen_mvl/mxv
	.byte		N06   , An5 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
@ 015   ----------------------------------------
	.byte		VOL   , 81*bgm_pokecen_mvl/mxv
	.byte		N03   , Ds5 , v096
	.byte	W03
	.byte		N21   , En5 
	.byte	W09
	.byte		MOD   , 6
	.byte	W12
	.byte		        1
	.byte		N12   , Dn5 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		N48   , Dn5 
	.byte	W24
	.byte		MOD   , 7
	.byte	W24
@ 016   ----------------------------------------
	.byte		        1
	.byte		N12   , Cs5 
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		VOL   , 23*bgm_pokecen_mvl/mxv
	.byte		N24   , An4 
	.byte	W03
	.byte		VOL   , 28*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        32*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        40*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        47*bgm_pokecen_mvl/mxv
	.byte		MOD   , 6
	.byte	W03
	.byte		VOL   , 57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        69*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        77*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		MOD   , 1
	.byte		N02   , Gs4 
	.byte	W02
	.byte		        An4 
	.byte	W02
	.byte		N08   , Gs4 
	.byte	W09
	.byte		N06   , Fs4 
	.byte	W05
	.byte		        Gs4 
	.byte	W06
	.byte	GOTO
	 .word	bgm_pokecen_2_B1
bgm_pokecen_2_B2:
@ 017   ----------------------------------------
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

bgm_pokecen_3:
	.byte	KEYSH , bgm_pokecen_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 45
	.byte		PAN   , c_v-32
	.byte		VOL   , 79*bgm_pokecen_mvl/mxv
	.byte		XCMD  , xIECV , 12
	.byte		        xIECL , 8
	.byte		LFOS  , 44
	.byte	W96
bgm_pokecen_3_B1:
@ 001   ----------------------------------------
	.byte		N06   , An3 , v092
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Cs4 , v112
	.byte	W12
	.byte		        Cs4 , v020
	.byte	W60
@ 002   ----------------------------------------
	.byte	W12
	.byte		        Dn4 , v112
	.byte	W12
	.byte		        Dn4 , v016
	.byte	W12
	.byte		        Bn3 , v112
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        En3 
	.byte	W06
	.byte		        Bn2 
	.byte	W30
@ 003   ----------------------------------------
	.byte		        Gs3 , v092
	.byte	W06
	.byte		        Bn2 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Gs3 , v112
	.byte	W12
	.byte		        Gs3 , v016
	.byte	W60
@ 004   ----------------------------------------
	.byte		VOL   , 75*bgm_pokecen_mvl/mxv
	.byte	W12
	.byte		N06   , En4 , v112
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        An4 
	.byte	W12
	.byte		        Gs4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W12
	.byte		        Gs4 
	.byte	W12
@ 005   ----------------------------------------
	.byte		VOL   , 67*bgm_pokecen_mvl/mxv
	.byte		N06   , An3 , v092
	.byte	W06
	.byte		        En3 , v112
	.byte	W06
	.byte		        Gs3 , v092
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Cs4 , v112
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        An4 
	.byte	W12
	.byte		        An4 , v016
	.byte	W12
	.byte		        En5 , v100
	.byte	W12
	.byte		        En5 , v016
	.byte	W12
	.byte		        An4 , v112
	.byte	W12
@ 006   ----------------------------------------
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        Gs4 , v016
	.byte	W12
	.byte		        En4 , v112
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
@ 007   ----------------------------------------
	.byte		        Gs3 , v092
	.byte	W06
	.byte		        Bn2 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Gs3 , v112
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Gs4 
	.byte	W12
	.byte		        Gs4 , v016
	.byte	W12
	.byte		        Dn5 , v112
	.byte	W12
	.byte		        Dn5 , v016
	.byte	W12
	.byte		        Bn4 , v112
	.byte	W12
@ 008   ----------------------------------------
	.byte		        An4 
	.byte	W12
	.byte		        An4 , v016
	.byte	W84
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	bgm_pokecen_3_B1
bgm_pokecen_3_B2:
@ 017   ----------------------------------------
	.byte	FINE

@**************** Track 4 (Midi-Chn.4) ****************@

bgm_pokecen_4:
	.byte	KEYSH , bgm_pokecen_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 48
	.byte		LFOS  , 44
	.byte		VOL   , 82*bgm_pokecen_mvl/mxv
	.byte		PAN   , c_v-32
	.byte	W96
bgm_pokecen_4_B1:
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W72
	.byte		N06   , Cs3 , v056
	.byte	W06
	.byte		        Bn2 
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
@ 005   ----------------------------------------
	.byte		N03   , Dn3 , v048
	.byte	W03
	.byte		N32   , Cs3 , v056
	.byte	W21
	.byte		VOL   , 78*bgm_pokecen_mvl/mxv
	.byte	W02
	.byte		        70*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        62*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        60*bgm_pokecen_mvl/mxv
	.byte	W04
	.byte		        82*bgm_pokecen_mvl/mxv
	.byte		N12   , En2 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Dn3 
	.byte	W12
	.byte		        Cs3 
	.byte	W12
@ 006   ----------------------------------------
	.byte		N36   , Dn3 
	.byte	W24
	.byte		VOL   , 78*bgm_pokecen_mvl/mxv
	.byte	W02
	.byte		        70*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        62*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        60*bgm_pokecen_mvl/mxv
	.byte	W04
	.byte		        82*bgm_pokecen_mvl/mxv
	.byte		N12   , Bn2 
	.byte	W12
	.byte		N02   , Gs2 
	.byte	W02
	.byte		        An2 
	.byte	W02
	.byte		N08   , Gs2 
	.byte	W09
	.byte		N06   , Gn2 
	.byte	W05
	.byte		        Gs2 
	.byte	W06
	.byte		N12   , Ds2 
	.byte	W12
	.byte		        En2 
	.byte	W12
@ 007   ----------------------------------------
	.byte		N03   , Cn3 , v048
	.byte	W03
	.byte		N32   , Bn2 , v056
	.byte	W21
	.byte		VOL   , 78*bgm_pokecen_mvl/mxv
	.byte	W02
	.byte		        70*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        62*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        60*bgm_pokecen_mvl/mxv
	.byte	W04
	.byte		        82*bgm_pokecen_mvl/mxv
	.byte		N12   , Gs2 
	.byte	W12
	.byte		        Dn3 
	.byte	W12
	.byte		        En3 , v060
	.byte	W12
	.byte		        Fs3 , v064
	.byte	W12
	.byte		        Gs3 , v068
	.byte	W12
@ 008   ----------------------------------------
	.byte		PAN   , c_v-44
	.byte		VOL   , 57*bgm_pokecen_mvl/mxv
	.byte		N06   , Dn4 , v064
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
@ 009   ----------------------------------------
	.byte		VOL   , 49*bgm_pokecen_mvl/mxv
	.byte		N06   , Cs4 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Cs4 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        En4 , v096
	.byte	W06
	.byte		        Gs3 , v064
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        En4 , v096
	.byte	W06
	.byte		        Gs3 , v064
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
@ 010   ----------------------------------------
	.byte		        Dn4 , v096
	.byte	W06
	.byte		        An3 , v064
	.byte	W06
	.byte		        En4 , v096
	.byte	W06
	.byte		        An3 , v064
	.byte	W06
	.byte		        Dn4 , v096
	.byte	W06
	.byte		        Fs3 , v064
	.byte	W06
	.byte		        Cs4 , v096
	.byte	W06
	.byte		        Fs3 , v064
	.byte	W06
	.byte		        Bn3 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        En3 
	.byte	W06
@ 011   ----------------------------------------
	.byte		        Bn3 , v096
	.byte	W06
	.byte		        Dn3 , v064
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Bn3 , v096
	.byte	W06
	.byte		        Dn3 , v064
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Dn4 , v096
	.byte	W06
	.byte		        Fn3 , v064
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Dn4 , v096
	.byte	W06
	.byte		        Fn3 , v064
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
@ 012   ----------------------------------------
	.byte		        Cs4 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Dn4 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Cs4 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Bn3 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        An3 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
@ 013   ----------------------------------------
	.byte		        Cs4 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Cs4 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        En4 , v096
	.byte	W06
	.byte		        Gs3 , v064
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        En4 , v096
	.byte	W06
	.byte		        Gs3 , v064
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
@ 014   ----------------------------------------
	.byte		        Dn4 , v096
	.byte	W06
	.byte		        An3 , v064
	.byte	W06
	.byte		        Cs4 , v096
	.byte	W06
	.byte		        An3 , v064
	.byte	W06
	.byte		        Dn4 , v096
	.byte	W06
	.byte		        Fs3 , v064
	.byte	W06
	.byte		        En4 , v096
	.byte	W06
	.byte		        Fs3 , v064
	.byte	W06
	.byte		        Fs4 , v096
	.byte	W06
	.byte		        An3 , v064
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Fs4 , v096
	.byte	W06
	.byte		        An3 , v064
	.byte	W06
@ 015   ----------------------------------------
	.byte		        En4 , v096
	.byte	W06
	.byte		        Dn3 , v064
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Dn4 , v096
	.byte	W06
	.byte		        Dn3 , v064
	.byte	W06
	.byte		        Cs4 , v096
	.byte	W06
	.byte		        Dn3 , v064
	.byte	W06
	.byte		        Dn4 , v096
	.byte	W06
	.byte		        Fn3 , v064
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Dn4 , v096
	.byte	W06
	.byte		        Fn3 , v064
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
@ 016   ----------------------------------------
	.byte		        Cs4 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Dn4 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Cs4 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Bn3 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        An3 , v096
	.byte	W06
	.byte		        En3 , v064
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		VOL   , 81*bgm_pokecen_mvl/mxv
	.byte		N06   , An3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte	GOTO
	 .word	bgm_pokecen_4_B1
bgm_pokecen_4_B2:
@ 017   ----------------------------------------
	.byte	FINE

@**************** Track 5 (Midi-Chn.5) ****************@

bgm_pokecen_5:
	.byte	KEYSH , bgm_pokecen_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte		PAN   , c_v+0
	.byte		LFOS  , 44
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte		MOD   , 2
	.byte		XCMD  , xIECV , 12
	.byte		        xIECL , 8
	.byte		N03   , Cs5 , v068
	.byte	W06
	.byte		        Cs5 , v016
	.byte	W06
	.byte		        En5 , v068
	.byte	W06
	.byte		        En5 , v016
	.byte	W06
	.byte		        An4 , v068
	.byte	W06
	.byte		        An4 , v020
	.byte	W06
	.byte		        Gs4 , v068
	.byte	W06
	.byte		        Gs4 , v016
	.byte	W06
	.byte		        Fs4 , v068
	.byte	W06
	.byte		        Fs4 , v016
	.byte	W06
	.byte		        Gs4 , v068
	.byte	W06
	.byte		        Gs4 , v016
	.byte	W06
	.byte		        An4 , v068
	.byte	W06
	.byte		        An4 , v016
	.byte	W06
	.byte		        Bn4 , v068
	.byte	W06
	.byte		        Bn4 , v016
	.byte	W06
bgm_pokecen_5_B1:
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte		VOICE , 4
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte		VOL   , 46*bgm_pokecen_mvl/mxv
	.byte		N48   , En3 , v076
	.byte	W48
	.byte		N24   , An3 , v088
	.byte	W24
	.byte		N04   , Dn3 , v112
	.byte	W04
	.byte		        En3 
	.byte	W04
	.byte		        Fs3 
	.byte	W04
	.byte		        Gs3 
	.byte	W04
	.byte		        An3 
	.byte	W04
	.byte		        Bn3 
	.byte	W04
@ 009   ----------------------------------------
	.byte		PAN   , c_v+63
	.byte		N48   , Cs4 
	.byte	W24
	.byte		MOD   , 10
	.byte	W24
	.byte		        2
	.byte		N36   , En4 
	.byte	W24
	.byte		MOD   , 10
	.byte	W12
	.byte		        2
	.byte		N06   , Cn4 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
@ 010   ----------------------------------------
	.byte		N12   , Dn4 
	.byte	W12
	.byte		        En4 
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Bn3 
	.byte	W18
	.byte		N06   , Gs3 
	.byte	W06
	.byte		N02   , Cs4 
	.byte	W02
	.byte		        Dn4 
	.byte	W02
	.byte		N08   , Cs4 
	.byte	W09
	.byte		N06   , Bn3 
	.byte	W05
	.byte		        An3 
	.byte	W06
@ 011   ----------------------------------------
	.byte		        Bn3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		N12   , Gs3 
	.byte	W12
	.byte		N06   , Bn3 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		N12   , Bn3 
	.byte	W12
	.byte		N06   , Dn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
@ 012   ----------------------------------------
	.byte		N12   , En4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        En4 
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte		N06   , Cs4 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		N02   , En4 
	.byte	W02
	.byte		        Fs4 
	.byte	W02
	.byte		N08   , En4 
	.byte	W09
	.byte		N06   , Cs4 
	.byte	W05
	.byte		        Bn3 
	.byte	W06
@ 013   ----------------------------------------
	.byte		N48   , Cs4 
	.byte	W24
	.byte		MOD   , 11
	.byte	W24
	.byte		        2
	.byte		N48   , En4 
	.byte	W24
	.byte		MOD   , 11
	.byte	W24
@ 014   ----------------------------------------
	.byte		        2
	.byte		N06   , Dn4 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        An3 
	.byte	W06
@ 015   ----------------------------------------
	.byte		N03   , Gn4 
	.byte	W03
	.byte		N21   , Gs4 
	.byte	W09
	.byte		MOD   , 8
	.byte	W12
	.byte		        2
	.byte		N12   , Fs4 
	.byte	W12
	.byte		        En4 
	.byte	W12
	.byte		VOL   , 34*bgm_pokecen_mvl/mxv
	.byte		N24   , An4 
	.byte	W12
	.byte		MOD   , 9
	.byte	W12
	.byte		        2
	.byte		N24   , Gs4 
	.byte	W12
	.byte		MOD   , 11
	.byte	W12
@ 016   ----------------------------------------
	.byte		        2
	.byte		N12   , En4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        En4 
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte		N24   , Cs4 
	.byte	W12
	.byte		MOD   , 9
	.byte	W12
	.byte		        2
	.byte	W24
	.byte	GOTO
	 .word	bgm_pokecen_5_B1
bgm_pokecen_5_B2:
@ 017   ----------------------------------------
	.byte	FINE

@**************** Track 6 (Midi-Chn.6) ****************@

bgm_pokecen_6:
	.byte	KEYSH , bgm_pokecen_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 3
	.byte		PAN   , c_v-63
	.byte		VOL   , 69*bgm_pokecen_mvl/mxv
	.byte		N03   , En4 , v096
	.byte	W06
	.byte		        En4 , v016
	.byte	W06
	.byte		        An4 , v080
	.byte	W06
	.byte		        An4 , v016
	.byte	W06
	.byte		        Cs4 , v064
	.byte	W06
	.byte		        Cs4 , v020
	.byte	W06
	.byte		        Bn3 , v064
	.byte	W06
	.byte		        Bn3 , v016
	.byte	W06
	.byte		        An3 , v064
	.byte	W06
	.byte		        An3 , v016
	.byte	W06
	.byte		        Bn3 , v064
	.byte	W06
	.byte		        Bn3 , v016
	.byte	W06
	.byte		        Cs4 , v072
	.byte	W06
	.byte		        Cs4 , v016
	.byte	W06
	.byte		        En4 , v080
	.byte	W06
	.byte		        En4 , v016
	.byte	W06
bgm_pokecen_6_B1:
@ 001   ----------------------------------------
	.byte		VOL   , 69*bgm_pokecen_mvl/mxv
	.byte		N06   , An4 , v068
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		VOICE , 6
	.byte		PAN   , c_v+63
	.byte	W03
	.byte		N03   , Ds5 
	.byte	W03
	.byte		N06   , En5 
	.byte	W12
	.byte		        En5 , v016
	.byte	W12
	.byte		        En5 , v064
	.byte	W12
	.byte		N02   , Dn5 , v068
	.byte	W02
	.byte		        En5 
	.byte	W02
	.byte		N08   , Dn5 
	.byte	W09
	.byte		N06   , Cs5 
	.byte	W05
	.byte		        An4 
	.byte	W06
@ 002   ----------------------------------------
	.byte		        Bn4 
	.byte	W06
	.byte		PAN   , c_v-63
	.byte	W03
	.byte		VOICE , 3
	.byte	W03
	.byte		N06   , Dn5 
	.byte	W12
	.byte		        Dn5 , v016
	.byte	W12
	.byte		        Bn4 , v068
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        En4 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		VOICE , 6
	.byte		PAN   , c_v+63
	.byte		N06   , Fs4 
	.byte	W12
	.byte		        Gn4 
	.byte	W12
@ 003   ----------------------------------------
	.byte		VOICE , 3
	.byte		PAN   , c_v-63
	.byte		N06   , Gs4 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		VOICE , 6
	.byte		PAN   , c_v+63
	.byte	W03
	.byte		N03   , Cn5 
	.byte	W03
	.byte		N06   , Cs5 
	.byte	W12
	.byte		        Cs5 , v016
	.byte	W12
	.byte		        Bn4 , v068
	.byte	W12
	.byte		        Bn4 , v016
	.byte	W12
	.byte		        Gs4 , v068
	.byte	W12
@ 004   ----------------------------------------
	.byte		        An4 
	.byte	W12
	.byte		VOICE , 3
	.byte		PAN   , c_v+0
	.byte		N24   , Cs5 
	.byte	W36
	.byte		VOL   , 57*bgm_pokecen_mvl/mxv
	.byte	W21
	.byte		N03   , As4 , v096
	.byte	W03
	.byte		N06   , An4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
@ 005   ----------------------------------------
	.byte		VOL   , 44*bgm_pokecen_mvl/mxv
	.byte		N06   , An3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Cs4 
	.byte	W09
	.byte		N03   , Ds4 
	.byte	W03
	.byte		N06   , En4 
	.byte	W12
	.byte		        En4 , v016
	.byte	W12
	.byte		        Dn4 , v096
	.byte	W12
	.byte		        Dn4 , v016
	.byte	W12
	.byte		        Cs4 , v096
	.byte	W12
@ 006   ----------------------------------------
	.byte		        Bn3 
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte		        Dn4 , v016
	.byte	W12
	.byte		        Bn3 , v096
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        En3 
	.byte	W12
@ 007   ----------------------------------------
	.byte		        Gs3 
	.byte	W06
	.byte		        Bn2 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Gs3 
	.byte	W09
	.byte		N03   , Cn4 
	.byte	W03
	.byte		N06   , Cs4 
	.byte	W12
	.byte		        Cs4 , v016
	.byte	W12
	.byte		        Bn3 , v096
	.byte	W12
	.byte		        Bn3 , v016
	.byte	W12
	.byte		        Gs3 , v096
	.byte	W12
@ 008   ----------------------------------------
	.byte		N12   , An3 , v112
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        An3 , v096
	.byte	W12
	.byte		        Bn3 , v112
	.byte	W12
	.byte		N04   , Cs4 , v080
	.byte	W04
	.byte		        Dn4 , v084
	.byte	W04
	.byte		        En4 , v092
	.byte	W04
	.byte		        Fs4 , v096
	.byte	W04
	.byte		        Gs4 , v100
	.byte	W04
	.byte		        An4 , v108
	.byte	W04
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	bgm_pokecen_6_B1
bgm_pokecen_6_B2:
@ 017   ----------------------------------------
	.byte	FINE

@**************** Track 7 (Midi-Chn.7) ****************@

bgm_pokecen_7:
	.byte	KEYSH , bgm_pokecen_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 5
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte		XCMD  , xIECV , 9
	.byte		        xIECL , 8
	.byte		LFOS  , 44
	.byte		PAN   , c_v+0
	.byte	W96
bgm_pokecen_7_B1:
@ 001   ----------------------------------------
bgm_pokecen_7_001:
	.byte		N06   , An1 , v127
	.byte	W06
	.byte		        An1 , v036
	.byte	W30
	.byte		N03   , An1 , v127
	.byte	W06
	.byte		        En1 
	.byte	W18
	.byte		N06   , En2 
	.byte	W06
	.byte		        En2 , v036
	.byte	W18
	.byte		        An1 , v127
	.byte	W06
	.byte		        An1 , v036
	.byte	W06
	.byte	PEND
@ 002   ----------------------------------------
bgm_pokecen_7_002:
	.byte		N06   , Bn1 , v127
	.byte	W06
	.byte		        Bn1 , v036
	.byte	W30
	.byte		N03   , Bn1 , v127
	.byte	W06
	.byte		        En1 
	.byte	W18
	.byte		N06   , Dn2 
	.byte	W06
	.byte		        Dn2 , v036
	.byte	W18
	.byte		        En1 , v127
	.byte	W06
	.byte		        Fs1 
	.byte	W06
	.byte	PEND
@ 003   ----------------------------------------
	.byte		        Bn1 
	.byte	W06
	.byte		        Bn1 , v036
	.byte	W30
	.byte		N03   , Bn1 , v127
	.byte	W06
	.byte		        Gs1 
	.byte	W18
	.byte		N06   , Dn2 
	.byte	W06
	.byte		        Dn2 , v036
	.byte	W18
	.byte		        Gs1 , v127
	.byte	W06
	.byte		        Gs1 , v036
	.byte	W06
@ 004   ----------------------------------------
	.byte		        An1 , v127
	.byte	W06
	.byte		        An1 , v036
	.byte	W30
	.byte		N03   , An1 , v127
	.byte	W06
	.byte		        En1 
	.byte	W06
	.byte		        An1 
	.byte	W06
	.byte		        En1 
	.byte	W06
	.byte		N06   , Cs2 
	.byte	W06
	.byte		        Cs2 , v036
	.byte	W18
	.byte		        Cs2 , v127
	.byte	W06
	.byte		        Cs2 , v036
	.byte	W06
@ 005   ----------------------------------------
	.byte	PATT
	 .word	bgm_pokecen_7_001
@ 006   ----------------------------------------
	.byte	PATT
	 .word	bgm_pokecen_7_002
@ 007   ----------------------------------------
	.byte		N06   , Bn1 , v127
	.byte	W06
	.byte		        Bn1 , v036
	.byte	W30
	.byte		N03   , Bn1 , v127
	.byte	W06
	.byte		        Gs1 
	.byte	W18
	.byte		N06   , Dn2 
	.byte	W06
	.byte		        Dn2 , v036
	.byte	W18
	.byte		        Dn2 , v127
	.byte	W06
	.byte		        Dn2 , v036
	.byte	W06
@ 008   ----------------------------------------
	.byte		        An1 , v127
	.byte	W06
	.byte		        An1 , v036
	.byte	W30
	.byte		N03   , An1 , v127
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		        En1 
	.byte	W06
	.byte		N06   , En2 
	.byte	W06
	.byte		        En2 , v036
	.byte	W18
	.byte		        En2 , v127
	.byte	W06
	.byte		        Gs1 
	.byte	W06
@ 009   ----------------------------------------
	.byte		N24   , An1 
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        52*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N06   , An1 , v036
	.byte	W09
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		N03   , En1 , v127
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N24   , Cs2 
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        52*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N06   , Cs2 , v036
	.byte	W09
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		N06   , An1 , v127
	.byte	W12
@ 010   ----------------------------------------
	.byte		N24   , Dn2 
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        52*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N06   , Dn2 , v036
	.byte	W09
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		N03   , An1 , v127
	.byte	W06
	.byte		        Dn2 
	.byte	W06
	.byte		N06   , En1 
	.byte	W06
	.byte		N03   , En2 
	.byte	W12
	.byte		N06   , En1 
	.byte	W06
	.byte		        Fs1 
	.byte	W06
	.byte		        Fs1 , v036
	.byte	W06
	.byte		        Gn1 , v127
	.byte	W06
	.byte		        Gn1 , v036
	.byte	W06
@ 011   ----------------------------------------
	.byte		N24   , Gs1 , v127
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        52*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N06   , Gs1 , v036
	.byte	W09
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		N03   , En1 , v127
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N24   , Bn1 
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        92*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N24   , Gs1 
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
@ 012   ----------------------------------------
	.byte		        92*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N24   , An1 
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        52*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N06   , An1 , v036
	.byte	W09
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		N03   , An1 , v127
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Cs2 
	.byte	W06
	.byte		N03   , En2 
	.byte	W12
	.byte		N06   , En1 
	.byte	W06
	.byte		        Fs1 
	.byte	W06
	.byte		        Fs1 , v036
	.byte	W06
	.byte		        Gs1 , v127
	.byte	W06
	.byte		        Gs1 , v036
	.byte	W06
@ 013   ----------------------------------------
	.byte		N24   , An1 , v127
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        52*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N06   , An1 , v036
	.byte	W09
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		N03   , En1 , v127
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N24   , Cs2 
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        52*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N06   , Cs2 , v036
	.byte	W09
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		N03   , An1 , v127
	.byte	W06
	.byte		N03   
	.byte	W06
@ 014   ----------------------------------------
	.byte		N24   , Bn1 
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        52*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N06   , Bn1 , v036
	.byte	W09
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		N06   , En1 , v127
	.byte	W12
	.byte		        Dn1 
	.byte	W06
	.byte		N03   , Dn2 
	.byte	W12
	.byte		N06   , Dn1 
	.byte	W06
	.byte		        Fs1 
	.byte	W12
	.byte		        An1 
	.byte	W12
@ 015   ----------------------------------------
	.byte		N24   , Gs1 
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        52*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N06   , Gs1 , v036
	.byte	W09
	.byte		VOL   , 92*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		N06   , En1 , v127
	.byte	W12
	.byte		N24   , Bn1 
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        92*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N24   , Gs1 
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		MOD   , 8
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
@ 016   ----------------------------------------
	.byte		        92*bgm_pokecen_mvl/mxv
	.byte		MOD   , 0
	.byte		N12   , An1 
	.byte	W06
	.byte		VOL   , 87*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        81*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        75*bgm_pokecen_mvl/mxv
	.byte		N06   , An1 , v036
	.byte	W03
	.byte		VOL   , 68*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        63*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        57*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		        52*bgm_pokecen_mvl/mxv
	.byte	W09
	.byte		        92*bgm_pokecen_mvl/mxv
	.byte	W03
	.byte		N03   , An1 , v127
	.byte	W06
	.byte		        En1 
	.byte	W06
	.byte		N06   , Cs2 
	.byte	W06
	.byte		N03   , En2 
	.byte	W12
	.byte		N06   , En1 
	.byte	W06
	.byte		        Fs1 
	.byte	W06
	.byte		        Fs1 , v036
	.byte	W06
	.byte		        Gs1 , v127
	.byte	W06
	.byte		        Gs1 , v036
	.byte	W06
	.byte	GOTO
	 .word	bgm_pokecen_7_B1
bgm_pokecen_7_B2:
@ 017   ----------------------------------------
	.byte	FINE

@**************** Track 8 (Midi-Chn.8) ****************@

bgm_pokecen_8:
	.byte	KEYSH , bgm_pokecen_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 45
	.byte		VOL   , 75*bgm_pokecen_mvl/mxv
	.byte	W96
bgm_pokecen_8_B1:
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W12
	.byte		N06   , Gs3 , v112
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Bn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        An3 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	bgm_pokecen_8_B1
bgm_pokecen_8_B2:
@ 017   ----------------------------------------
	.byte	FINE

@**************** Track 9 (Midi-Chn.9) ****************@

bgm_pokecen_9:
	.byte	KEYSH , bgm_pokecen_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 127
	.byte		PAN   , c_v+0
	.byte		VOL   , 37*bgm_pokecen_mvl/mxv
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 , v080
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 , v080
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		        Gn4 , v088
	.byte	W04
	.byte		        Gn4 , v064
	.byte	W04
	.byte		N01   
	.byte	W04
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 , v088
	.byte	W04
	.byte		        Gn4 , v064
	.byte	W04
	.byte		N01   
	.byte	W04
	.byte		        Fn3 , v096
	.byte	W06
	.byte		        Gs4 , v112
	.byte	W06
bgm_pokecen_9_B1:
@ 001   ----------------------------------------
bgm_pokecen_9_001:
	.byte		N01   , Gn4 , v112
	.byte	W06
	.byte		        Gn4 , v072
	.byte	W06
	.byte		        Gn4 , v088
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 , v084
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		        Gn4 , v084
	.byte	W12
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		        Gn4 , v080
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte	PEND
@ 002   ----------------------------------------
	.byte	PATT
	 .word	bgm_pokecen_9_001
@ 003   ----------------------------------------
	.byte	PATT
	 .word	bgm_pokecen_9_001
@ 004   ----------------------------------------
	.byte		N01   , Gn4 , v112
	.byte	W06
	.byte		        Gn4 , v072
	.byte	W06
	.byte		        Gn4 , v088
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 , v084
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		        Gn4 , v088
	.byte	W04
	.byte		        Gn4 , v064
	.byte	W04
	.byte		N01   
	.byte	W04
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		N12   , Gs4 , v112
	.byte	W12
@ 005   ----------------------------------------
	.byte	PATT
	 .word	bgm_pokecen_9_001
@ 006   ----------------------------------------
	.byte		N01   , Gn4 , v112
	.byte	W06
	.byte		        Gn4 , v072
	.byte	W06
	.byte		        Gn4 , v088
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 , v084
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		        Gn4 , v088
	.byte	W04
	.byte		        Gn4 , v064
	.byte	W04
	.byte		N01   
	.byte	W04
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N12   
	.byte	W12
	.byte		N01   , Gn4 , v084
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
@ 007   ----------------------------------------
	.byte	PATT
	 .word	bgm_pokecen_9_001
@ 008   ----------------------------------------
	.byte		N01   , Gn4 , v112
	.byte	W06
	.byte		        Gn4 , v072
	.byte	W06
	.byte		        Gn4 , v088
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 , v084
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		        Gn4 , v084
	.byte	W12
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 , v088
	.byte	W04
	.byte		        Gn4 , v064
	.byte	W04
	.byte		N01   
	.byte	W04
	.byte		N06   , Gs4 , v112
	.byte	W06
	.byte		N06   
	.byte	W06
@ 009   ----------------------------------------
bgm_pokecen_9_009:
	.byte		N01   , Gn4 , v112
	.byte	W06
	.byte		        Gn4 , v072
	.byte	W06
	.byte		        Gn4 , v088
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 , v088
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		        Gn4 , v084
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 , v084
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	bgm_pokecen_9_009
@ 011   ----------------------------------------
	.byte	PATT
	 .word	bgm_pokecen_9_009
@ 012   ----------------------------------------
	.byte	PATT
	 .word	bgm_pokecen_9_009
@ 013   ----------------------------------------
	.byte	PATT
	 .word	bgm_pokecen_9_009
@ 014   ----------------------------------------
	.byte	PATT
	 .word	bgm_pokecen_9_009
@ 015   ----------------------------------------
	.byte		N12   , Gs4 , v112
	.byte	W36
	.byte		N01   , Gn4 , v088
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		        Gn4 , v088
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		        Gn4 , v084
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N12   
	.byte	W12
@ 016   ----------------------------------------
	.byte		N12   
	.byte	W48
	.byte		N12   
	.byte	W12
	.byte		N01   , Gn4 , v084
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte		N12   , Gs4 , v112
	.byte	W12
	.byte		N01   , Gn4 , v080
	.byte	W06
	.byte		        Gn4 , v064
	.byte	W06
	.byte	GOTO
	 .word	bgm_pokecen_9_B1
bgm_pokecen_9_B2:
@ 017   ----------------------------------------
	.byte	FINE

@******************************************************@
	.align	2

bgm_pokecen:
	.byte	9	@ NumTrks
	.byte	0	@ NumBlks
	.byte	bgm_pokecen_pri	@ Priority
	.byte	bgm_pokecen_rev	@ Reverb.

	.word	bgm_pokecen_grp

	.word	bgm_pokecen_1
	.word	bgm_pokecen_2
	.word	bgm_pokecen_3
	.word	bgm_pokecen_4
	.word	bgm_pokecen_5
	.word	bgm_pokecen_6
	.word	bgm_pokecen_7
	.word	bgm_pokecen_8
	.word	bgm_pokecen_9

	.end
