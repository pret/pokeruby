	.include "MPlayDef.s"

	.equ	song_269_grp, voicegroup_84549F0
	.equ	song_269_pri, 4
	.equ	song_269_rev, 0
	.equ	song_269_mvl, 127
	.equ	song_269_key, 0
	.equ	song_269_tbs, 1
	.equ	song_269_exg, 0
	.equ	song_269_cmp, 1

	.section .rodata
	.global	song_269
	.align	2

@********************** Track  1 **********************@

song_269_1:
	.byte	KEYSH , song_269_key+0
	.byte	TEMPO , 120*song_269_tbs/2
	.byte		VOICE , 21
	.byte		VOL   , 127*song_269_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_269:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_269_pri	@ Priority
	.byte	song_269_rev	@ Reverb.

	.word	song_269_grp

	.word	song_269_1

	.end
