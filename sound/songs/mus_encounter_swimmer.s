	.include "MPlayDef.s"

	.equ	mus_encounter_swimmer_grp, voicegroup033
	.equ	mus_encounter_swimmer_pri, 0
	.equ	mus_encounter_swimmer_rev, reverb_set+50
	.equ	mus_encounter_swimmer_mvl, 127
	.equ	mus_encounter_swimmer_key, 0
	.equ	mus_encounter_swimmer_tbs, 1
	.equ	mus_encounter_swimmer_exg, 0
	.equ	mus_encounter_swimmer_cmp, 1

	.section .rodata
	.global	mus_encounter_swimmer
	.align	2

@********************** Track  1 **********************@

mus_encounter_swimmer_1:
	.byte	KEYSH , mus_encounter_swimmer_key+0
	.byte	TEMPO , 142*mus_encounter_swimmer_tbs/2
	.byte		VOICE , 46
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		PAN   , c_v-9
	.byte	W03
	.byte		N06   , Dn5 , v092
	.byte	W06
	.byte		N24   , Ds5 
	.byte	W24
	.byte	W03
	.byte		VOICE , 45
	.byte		N06   , Fs3 , v068
	.byte	W06
	.byte		        An3 , v076
	.byte	W06
	.byte		        Bn3 , v084
	.byte	W06
	.byte		        Ds4 , v092
	.byte	W06
	.byte		        Fs4 , v100
	.byte	W06
	.byte		        An4 , v108
	.byte	W06
	.byte		N12   , Bn4 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
mus_encounter_swimmer_1_B1:
	.byte		VOICE , 60
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		PAN   , c_v+4
	.byte		N30   , Ds4 , v112
	.byte	W36
	.byte		N12   , Cs4 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        Fs3 
	.byte	W24
	.byte		        An3 
	.byte	W24
	.byte		        Cs4 
	.byte	W24
mus_encounter_swimmer_1_000:
	.byte		N68   , Bn3 , v112
	.byte	W32
	.byte	W01
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        70*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        53*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        42*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        27*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        9*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte	PEND
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N30   , Ds4 
	.byte	W36
	.byte		N12   , En4 
	.byte	W12
	.byte		        Ds4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        Cs4 
	.byte	W24
	.byte		        Ds4 
	.byte	W24
	.byte		        Cs4 
	.byte	W24
	.byte	PATT
	 .word	mus_encounter_swimmer_1_000
	.byte	GOTO
	 .word	mus_encounter_swimmer_1_B1
	.byte	FINE

@********************** Track  2 **********************@

mus_encounter_swimmer_2:
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte	KEYSH , mus_encounter_swimmer_key+0
	.byte		VOICE , 33
	.byte		N72   , Bn0 , v120
	.byte	W72
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		N24   , Fs1 
	.byte	W24
	.byte		        En1 
	.byte	W24
	.byte		        Ds1 
	.byte	W24
mus_encounter_swimmer_2_B1:
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		N48   , En1 , v120
	.byte	W48
	.byte		N12   , Bn0 
	.byte	W24
mus_encounter_swimmer_2_000:
	.byte		N48   , En1 , v120
	.byte	W48
	.byte		N12   , Bn0 
	.byte	W24
	.byte	PEND
mus_encounter_swimmer_2_001:
	.byte		N12   , Fs1 , v120
	.byte	W24
	.byte		N12   
	.byte	W24
	.byte		N24   , Cs1 
	.byte	W24
	.byte	PEND
mus_encounter_swimmer_2_002:
	.byte		N12   , Bn0 , v120
	.byte	W24
	.byte		        Ds1 
	.byte	W24
	.byte		N24   , Fs1 
	.byte	W24
	.byte	PEND
	.byte	PATT
	 .word	mus_encounter_swimmer_2_000
	.byte	PATT
	 .word	mus_encounter_swimmer_2_000
	.byte	PATT
	 .word	mus_encounter_swimmer_2_001
	.byte	PATT
	 .word	mus_encounter_swimmer_2_002
	.byte	GOTO
	 .word	mus_encounter_swimmer_2_B1
	.byte	FINE

@********************** Track  3 **********************@

mus_encounter_swimmer_3:
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte	KEYSH , mus_encounter_swimmer_key+0
	.byte		VOICE , 46
	.byte		PAN   , c_v+9
	.byte		N06   , Cs5 , v092
	.byte	W06
	.byte		N42   , Bn4 
	.byte	W18
	.byte		BEND  , c_v+0
	.byte	W48
	.byte		VOICE , 48
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		PAN   , c_v-8
	.byte		N24   , Fs2 , v072
	.byte	W24
	.byte		        Gs2 
	.byte	W24
	.byte		        An2 
	.byte	W24
mus_encounter_swimmer_3_B1:
	.byte		VOICE , 48
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		N30   , Bn2 , v072
	.byte	W36
	.byte		N12   , Gs2 
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        Cs3 
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        Cs3 
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        Cs3 
	.byte	W24
	.byte		        Fs3 
	.byte	W24
	.byte		        An3 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        En4 
	.byte	W12
	.byte		        Ds4 
	.byte	W12
mus_encounter_swimmer_3_000:
	.byte		VOICE , 60
	.byte		N21   , Bn2 , v072
	.byte	W12
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        47*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        29*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		VOICE , 48
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		N06   , Bn2 , v092
	.byte	W24
	.byte		        Ds3 
	.byte	W24
	.byte	PEND
	.byte	PATT
	 .word	mus_encounter_swimmer_3_000
	.byte		VOICE , 60
	.byte		N21   , An2 , v072
	.byte	W12
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        47*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        29*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		VOICE , 48
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		N06   , An2 , v092
	.byte	W24
	.byte		        Fs3 
	.byte	W24
	.byte		VOICE , 48
	.byte		N12   , Bn2 , v072
	.byte	W12
	.byte		        As2 
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte	GOTO
	 .word	mus_encounter_swimmer_3_B1
	.byte	FINE

@********************** Track  4 **********************@

mus_encounter_swimmer_4:
	.byte	KEYSH , mus_encounter_swimmer_key+0
	.byte		VOICE , 80
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		PAN   , c_v+48
	.byte		XCMD  , xIECV , 13
	.byte		        xIECL , 8
	.byte		N06   , Bn2 , v052
	.byte	W24
	.byte		        Bn3 
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		VOICE , 4
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Ds3 , v060
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , En3 
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Fs3 
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
mus_encounter_swimmer_4_B1:
	.byte		VOICE , 80
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Gs3 , v060
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Gs4 , v052
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Gs3 , v060
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Gs4 , v052
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Gs3 , v060
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N12   , Cs4 , v052
	.byte	W12
	.byte		        Fs2 , v060
	.byte	W12
	.byte		        Fs4 , v052
	.byte	W12
	.byte		        Fs2 , v060
	.byte	W12
	.byte		        An4 , v052
	.byte	W12
	.byte		        Fs2 , v060
	.byte	W12
	.byte		N24   , An4 , v052
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N12   , Fs2 , v060
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        Cs3 
	.byte	W12
	.byte		        Ds3 
	.byte	W12
mus_encounter_swimmer_4_000:
	.byte		N21   , En3 , v060
	.byte	W12
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        47*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N12   , En3 , v040
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        Ds5 
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	mus_encounter_swimmer_4_000
	.byte		N21   , Ds3 , v060
	.byte	W12
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        47*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N12   , Ds3 , v040
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		N21   , Fs4 , v060
	.byte	W12
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        47*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Fs3 
	.byte	W12
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        47*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Bn3 
	.byte	W12
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        47*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte	GOTO
	 .word	mus_encounter_swimmer_4_B1
	.byte	FINE

@********************** Track  5 **********************@

mus_encounter_swimmer_5:
	.byte	KEYSH , mus_encounter_swimmer_key+0
	.byte		VOICE , 81
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		XCMD  , xIECV , 13
	.byte		        xIECL , 8
	.byte		PAN   , c_v+0
	.byte		N06   , Fs2 , v052
	.byte	W24
	.byte		        Fs3 
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		VOICE , 5
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Fs3 , v060
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Gs3 
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , An3 
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
mus_encounter_swimmer_5_B1:
	.byte		VOICE , 81
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Bn3 , v060
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Bn4 , v052
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Bn3 , v060
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Bn4 , v052
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Bn3 , v060
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N12   , Fs4 , v052
	.byte	W12
	.byte		        An2 , v060
	.byte	W12
	.byte		        An4 , v052
	.byte	W12
	.byte		        An2 , v060
	.byte	W12
	.byte		        Cs5 , v052
	.byte	W12
	.byte		        An2 , v060
	.byte	W12
	.byte		N24   , Bn4 , v052
	.byte	W12
	.byte		VOL   , 76*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        65*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        41*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N12   , An2 , v060
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
mus_encounter_swimmer_5_000:
	.byte		N21   , Gs3 , v060
	.byte	W12
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        47*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		N12   , Gs3 , v040
	.byte	W12
	.byte		        Ds4 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		N06   , Gs5 
	.byte	W06
	.byte	PEND
	.byte	PATT
	 .word	mus_encounter_swimmer_5_000
	.byte		N21   , Fs3 , v060
	.byte	W12
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        47*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		N12   , Fs3 , v040
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        An4 
	.byte	W12
	.byte		N06   , Fs5 
	.byte	W06
	.byte		N21   , An4 , v060
	.byte	W12
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        47*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , An3 
	.byte	W12
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        47*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte		        80*mus_encounter_swimmer_mvl/mxv
	.byte		N21   , Ds4 
	.byte	W12
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        62*mus_encounter_swimmer_mvl/mxv
	.byte	W03
	.byte		        47*mus_encounter_swimmer_mvl/mxv
	.byte	W06
	.byte	GOTO
	 .word	mus_encounter_swimmer_5_B1
	.byte	FINE

@********************** Track  6 **********************@

mus_encounter_swimmer_6:
	.byte	KEYSH , mus_encounter_swimmer_key+0
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte	W72
	.byte	W72
mus_encounter_swimmer_6_B1:
	.byte		VOICE , 73
	.byte	W72
	.byte	W72
	.byte	W72
	.byte		N12   , Fs5 , v048
	.byte	W12
	.byte		        En5 
	.byte	W12
	.byte		        Fs5 
	.byte	W12
	.byte		        Bn5 
	.byte	W12
	.byte		        An5 
	.byte	W12
	.byte		        Gs5 
	.byte	W12
	.byte	W72
	.byte	W72
	.byte		        An4 
	.byte	W24
	.byte		        Bn4 
	.byte	W24
	.byte		        An4 
	.byte	W24
	.byte		        Fs5 
	.byte	W12
	.byte		        En5 
	.byte	W12
	.byte		        Fs5 
	.byte	W12
	.byte		        An5 
	.byte	W12
	.byte		        Gs5 
	.byte	W12
	.byte		        Fs5 
	.byte	W12
	.byte	GOTO
	 .word	mus_encounter_swimmer_6_B1
	.byte	FINE

@********************** Track  7 **********************@

mus_encounter_swimmer_7:
	.byte	KEYSH , mus_encounter_swimmer_key+0
	.byte	W72
	.byte		VOICE , 126
	.byte		PAN   , c_v-48
	.byte		VOL   , 75*mus_encounter_swimmer_mvl/mxv
	.byte		N12   , Gs4 , v040
	.byte	W24
	.byte		VOICE , 127
	.byte		N06   , Gs4 , v052
	.byte	W36
	.byte		VOICE , 126
	.byte		N12   , Gs4 , v040
	.byte	W12
mus_encounter_swimmer_7_B1:
mus_encounter_swimmer_7_000:
	.byte		VOICE , 127
	.byte		N06   , Gs4 , v052
	.byte	W12
	.byte		        Gs4 , v040
	.byte	W12
	.byte		        Gs4 , v052
	.byte	W12
	.byte		        Gs4 , v040
	.byte	W12
	.byte		        Gs4 , v052
	.byte	W12
	.byte		        Gs4 , v040
	.byte	W12
	.byte	PEND
mus_encounter_swimmer_7_001:
	.byte		N06   , Gs4 , v052
	.byte	W12
	.byte		        Gs4 , v040
	.byte	W12
	.byte		        Gs4 , v052
	.byte	W12
	.byte		        Gs4 , v040
	.byte	W12
	.byte		        Gs4 , v052
	.byte	W12
	.byte		        Gs4 , v040
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	mus_encounter_swimmer_7_001
mus_encounter_swimmer_7_002:
	.byte		N06   , Gs4 , v052
	.byte	W12
	.byte		        Gs4 , v040
	.byte	W12
	.byte		        Gs4 , v052
	.byte	W12
	.byte		        Gs4 , v040
	.byte	W12
	.byte		        Gs4 , v052
	.byte	W12
	.byte		VOICE , 126
	.byte		N06   , Gs4 , v040
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	mus_encounter_swimmer_7_000
	.byte	PATT
	 .word	mus_encounter_swimmer_7_001
	.byte	PATT
	 .word	mus_encounter_swimmer_7_001
	.byte	PATT
	 .word	mus_encounter_swimmer_7_002
	.byte	GOTO
	 .word	mus_encounter_swimmer_7_B1
	.byte	FINE

@********************** Track  8 **********************@

mus_encounter_swimmer_8:
	.byte	KEYSH , mus_encounter_swimmer_key+0
	.byte		VOL   , 80*mus_encounter_swimmer_mvl/mxv
	.byte	W72
	.byte		N06   , Cn1 , v112
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W06
	.byte		N03   , En1 , v052
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N06   , En1 , v088
	.byte	W12
mus_encounter_swimmer_8_B1:
	.byte		VOICE , 0
	.byte		N06   , Cn1 , v112
	.byte	W24
	.byte		        En1 , v088
	.byte	W24
	.byte		        Cn1 , v112
	.byte	W12
	.byte		        En1 , v088
	.byte	W12
mus_encounter_swimmer_8_000:
	.byte		N06   , Cn1 , v112
	.byte	W24
	.byte		        En1 , v088
	.byte	W24
	.byte		        Cn1 , v112
	.byte	W06
	.byte		N03   , En1 , v052
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N06   , En1 , v088
	.byte	W12
	.byte	PEND
mus_encounter_swimmer_8_001:
	.byte		N06   , Cn1 , v112
	.byte	W24
	.byte		        En1 , v088
	.byte	W12
	.byte		        Cn1 , v112
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        En1 , v088
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	mus_encounter_swimmer_8_000
	.byte		N06   , Cn1 , v112
	.byte	W24
	.byte		        En1 , v088
	.byte	W24
	.byte		        Cn1 , v112
	.byte	W12
	.byte		        En1 , v088
	.byte	W12
	.byte	PATT
	 .word	mus_encounter_swimmer_8_000
	.byte	PATT
	 .word	mus_encounter_swimmer_8_001
	.byte	PATT
	 .word	mus_encounter_swimmer_8_000
	.byte	GOTO
	 .word	mus_encounter_swimmer_8_B1
	.byte	FINE

@******************************************************@
	.align	2

mus_encounter_swimmer:
	.byte	8	@ NumTrks
	.byte	0	@ NumBlks
	.byte	mus_encounter_swimmer_pri	@ Priority
	.byte	mus_encounter_swimmer_rev	@ Reverb.

	.word	mus_encounter_swimmer_grp

	.word	mus_encounter_swimmer_1
	.word	mus_encounter_swimmer_2
	.word	mus_encounter_swimmer_3
	.word	mus_encounter_swimmer_4
	.word	mus_encounter_swimmer_5
	.word	mus_encounter_swimmer_6
	.word	mus_encounter_swimmer_7
	.word	mus_encounter_swimmer_8

	.end
