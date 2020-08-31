	.include "MPlayDef.s"

	.equ	se_balloon_blue_grp, voicegroup111
	.equ	se_balloon_blue_pri, 4
	.equ	se_balloon_blue_rev, reverb_set+50
	.equ	se_balloon_blue_mvl, 127
	.equ	se_balloon_blue_key, 0
	.equ	se_balloon_blue_tbs, 1
	.equ	se_balloon_blue_exg, 0
	.equ	se_balloon_blue_cmp, 1

	.section .rodata
	.global	se_balloon_blue
	.align	2

@********************** Track  1 **********************@

se_balloon_blue_1:
	.byte	KEYSH , se_balloon_blue_key+0
	.byte	TEMPO , 240*se_balloon_blue_tbs/2
	.byte		VOICE , 2
	.byte		BENDR , 12
	.byte		VOL   , 105*se_balloon_blue_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N03   , Gn4 , v127
	.byte	W04
	.byte		N01   , Gn4 , v112
	.byte	W02
	.byte	W02
	.byte		        Gs3 , v052
	.byte	W04
	.byte		VOICE , 23
	.byte		N02   , Fn3 , v112
	.byte	W04
	.byte		N01   , Cn4 , v072
	.byte	W02
	.byte	FINE

@******************************************************@
	.align	2

se_balloon_blue:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_balloon_blue_pri	@ Priority
	.byte	se_balloon_blue_rev	@ Reverb.

	.word	se_balloon_blue_grp

	.word	se_balloon_blue_1

	.end
