	.include "MPlayDef.s"

	.equ	se_lavaridge_fall_warp_grp, voicegroup110
	.equ	se_lavaridge_fall_warp_pri, 4
	.equ	se_lavaridge_fall_warp_rev, reverb_set+50
	.equ	se_lavaridge_fall_warp_mvl, 127
	.equ	se_lavaridge_fall_warp_key, 0
	.equ	se_lavaridge_fall_warp_tbs, 1
	.equ	se_lavaridge_fall_warp_exg, 0
	.equ	se_lavaridge_fall_warp_cmp, 1

	.section .rodata
	.global	se_lavaridge_fall_warp
	.align	2

@********************** Track  1 **********************@

se_lavaridge_fall_warp_1:
	.byte	KEYSH , se_lavaridge_fall_warp_key+0
	.byte	TEMPO , 120*se_lavaridge_fall_warp_tbs/2
	.byte		VOICE , 126
	.byte		VOL   , 127*se_lavaridge_fall_warp_mvl/mxv
	.byte		N08   , An2 , v112
	.byte	W03
	.byte	W03
	.byte	W02
	.byte		N01   , Gs2 
	.byte	W01
	.byte	W01
	.byte		N08   , An2 , v096
	.byte	W02
	.byte	W03
	.byte	W03
	.byte	W01
	.byte		N01   , Gs2 , v092
	.byte	W01
	.byte		N08   , An2 , v080
	.byte	W01
	.byte	W03
	.byte	W03
	.byte	W02
	.byte		N01   , Gs2 , v076
	.byte	W01
	.byte		N08   , An2 , v064
	.byte	W03
	.byte	W03
	.byte	W03
	.byte		N01   , Gs2 , v060
	.byte	W02
	.byte		N09   , An2 , v048
	.byte	W01
	.byte	W03
	.byte	W03
	.byte	W02
	.byte		N01   , Gs2 , v040
	.byte	W01
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_lavaridge_fall_warp:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_lavaridge_fall_warp_pri	@ Priority
	.byte	se_lavaridge_fall_warp_rev	@ Reverb.

	.word	se_lavaridge_fall_warp_grp

	.word	se_lavaridge_fall_warp_1

	.end
