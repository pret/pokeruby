	.include "MPlayDef.s"

	.equ	song_296_grp, voicegroup_84549F0
	.equ	song_296_pri, 4
	.equ	song_296_rev, 0
	.equ	song_296_mvl, 127
	.equ	song_296_key, 0
	.equ	song_296_tbs, 1
	.equ	song_296_exg, 0
	.equ	song_296_cmp, 1

	.section .rodata
	.global	song_296
	.align	2

@********************** Track  1 **********************@

song_296_1:
	.byte	KEYSH , song_296_key+0
	.byte	TEMPO , 120*song_296_tbs/2
	.byte		VOICE , 48
	.byte		VOL   , 127*song_296_mvl/mxv
	.byte		N54   , Cn3 , v127
	.byte	W54
	.byte	FINE

@******************************************************@
	.align	2

song_296:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_296_pri	@ Priority
	.byte	song_296_rev	@ Reverb.

	.word	song_296_grp

	.word	song_296_1

	.end
