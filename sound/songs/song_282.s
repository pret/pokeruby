	.include "MPlayDef.s"

	.equ	song_282_grp, voicegroup_84549F0
	.equ	song_282_pri, 4
	.equ	song_282_rev, 0
	.equ	song_282_mvl, 127
	.equ	song_282_key, 0
	.equ	song_282_tbs, 1
	.equ	song_282_exg, 0
	.equ	song_282_cmp, 1

	.section .rodata
	.global	song_282
	.align	2

@********************** Track  1 **********************@

song_282_1:
	.byte	KEYSH , song_282_key+0
	.byte	TEMPO , 120*song_282_tbs/2
	.byte		VOICE , 34
	.byte		VOL   , 127*song_282_mvl/mxv
	.byte		TIE   , Cn3 , v127
	.byte	W96
song_282_1_B1:
	.byte	W96
	.byte	GOTO
	 .word	song_282_1_B1
	.byte	W48
	.byte		EOT   , Cn3 
	.byte	FINE

@******************************************************@
	.align	2

song_282:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song_282_pri	@ Priority
	.byte	song_282_rev	@ Reverb.

	.word	song_282_grp

	.word	song_282_1

	.end
