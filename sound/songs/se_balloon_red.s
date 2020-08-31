	.include "MPlayDef.s"

	.equ	se_balloon_red_grp, voicegroup111
	.equ	se_balloon_red_pri, 4
	.equ	se_balloon_red_rev, reverb_set+50
	.equ	se_balloon_red_mvl, 127
	.equ	se_balloon_red_key, 0
	.equ	se_balloon_red_tbs, 1
	.equ	se_balloon_red_exg, 0
	.equ	se_balloon_red_cmp, 1

	.section .rodata
	.global	se_balloon_red
	.align	2

@********************** Track  1 **********************@

se_balloon_red_1:
	.byte	KEYSH , se_balloon_red_key+0
	.byte	TEMPO , 240*se_balloon_red_tbs/2
	.byte		VOICE , 2
	.byte		BENDR , 12
	.byte		VOL   , 105*se_balloon_red_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N06   , Cn4 , v127
	.byte	W06
	.byte		VOICE , 23
	.byte		N02   , Cn3 , v112
	.byte	W07
	.byte		N01   , Cn4 
	.byte	W05
	.byte		        Cn3 , v100
	.byte	W02
	.byte		        Gn3 , v092
	.byte	W02
	.byte		        Cn3 , v072
	.byte	W02
	.byte	FINE

@******************************************************@
	.align	2

se_balloon_red:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_balloon_red_pri	@ Priority
	.byte	se_balloon_red_rev	@ Reverb.

	.word	se_balloon_red_grp

	.word	se_balloon_red_1

	.end
