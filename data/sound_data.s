	.section .rodata

	.include "asm/macros/music_voice.s"

gUnknown_0842FC88:: @ 842FC88
@ Percussion 842FC88
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 842FC94
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 842FCA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FCAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FCB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FCC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 842FCD0
	voice_square_2 2, 0, 0, 9, 2

@ SquareWave1 842FCDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FCE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 842FCF4
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 255, 165, 51, 235

@ SquareWave1 842FD00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FD0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FD18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FD24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FD30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FD3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FD48
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 842FD54
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 127

@ SquareWave1 842FD60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FD6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FD78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FD84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FD90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FD9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FDA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FDB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FDC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FDCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FDD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FDE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FDF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FDFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 842FE08
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 149

@ SquareWave1 842FE14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FE20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FE2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 842FE38
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 115

@ SquareWave1 842FE44
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 842FE50
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 842FE5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FE68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FE74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FE80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FE8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FE98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FEA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FEB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 842FEBC
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 204, 193, 239

@ Key-Split 842FEC8
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 842FED4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FEE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FEEC
	voice_square_1 0, 2, 0, 0, 15, 0

VoiceGroupTable_842FEF8: @ 842FEF8

@ SquareWave1 842FEF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FF04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FF10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FF1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 842FF28
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 842FF34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FF40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FF4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FF58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FF64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FF70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FF7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FF88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FF94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FFA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FFAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FFB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FFC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FFD0
	voice_square_1 0, 2, 0, 1, 6, 0

@ SquareWave1 842FFDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 842FFE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 842FFF4
	voice_programmable_wave ProgrammableWaveData_84553BC, 0, 7, 15, 1

@ SquareWave1 8430000
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843000C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430018
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430024
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430030
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843003C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8430048
	voice_square_2 2, 0, 1, 6, 0

@ WaveMemory 8430054
	voice_programmable_wave ProgrammableWaveData_84553DC, 0, 7, 15, 1

@ SquareWave1 8430060
	voice_square_1 0, 2, 0, 1, 6, 0

@ SquareWave2 843006C
	voice_square_2 3, 0, 1, 6, 0

@ SquareWave1 8430078
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430084
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430090
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843009C
	voice_square_1 0, 0, 0, 1, 6, 0

@ Direct Sound 84300A8
	voice_directsound_no_resample 60, 0x40, DirectSoundWaveData_845AE14, 255, 0, 255, 242

@ SquareWave1 84300B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84300C0
	voice_directsound_no_resample 60, 192, DirectSoundWaveData_845B2B4, 255, 0, 255, 242

@ Direct Sound 84300CC
	voice_directsound_no_resample 60, 192, DirectSoundWaveData_845B9A8, 255, 255, 255, 127

@ Direct Sound 84300D8
	voice_directsound_no_resample 60, 192, DirectSoundWaveData_845C238, 255, 0, 255, 242

@ Direct Sound 84300E4
	voice_directsound 48, 172, DirectSoundWaveData_845CAB0, 255, 210, 77, 204

@ Direct Sound 84300F0
	voice_directsound_no_resample 60, 207, DirectSoundWaveData_845DAF0, 255, 127, 0, 188

@ Direct Sound 84300FC
	voice_directsound 51, 0x31, DirectSoundWaveData_845CAB0, 255, 216, 77, 204

@ SquareWave1 8430108
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8430114
	voice_directsound 54, 187, DirectSoundWaveData_845CAB0, 255, 216, 77, 204

@ Direct Sound 8430120
	voice_directsound_no_resample 60, 207, DirectSoundWaveData_845DF04, 255, 242, 141, 0

@ Direct Sound 843012C
	voice_directsound 57, 197, DirectSoundWaveData_845CAB0, 255, 210, 77, 204

@ Direct Sound 8430138
	voice_directsound 60, 207, DirectSoundWaveData_845CAB0, 255, 204, 77, 204

@ SquareWave1 8430144
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8430150
	voice_directsound 62, 212, DirectSoundWaveData_845CAB0, 255, 204, 77, 204

@ SquareWave1 843015C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430168
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8430174
	voice_directsound_no_resample 70, 177, DirectSoundWaveData_845ED34, 255, 165, 103, 231

@ Direct Sound 8430180
	voice_directsound_no_resample 32, 162, DirectSoundWaveData_845FCC8, 255, 127, 77, 204

@ Direct Sound 843018C
	voice_directsound_no_resample 60, 142, DirectSoundWaveData_846057C, 255, 235, 0, 165

@ SquareWave1 8430198
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84301A4
	voice_directsound_no_resample 30, 182, DirectSoundWaveData_8460E60, 255, 246, 0, 216

@ SquareWave1 84301B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84301BC
	voice_directsound_no_resample 30, 182, DirectSoundWaveData_8460E60, 255, 246, 0, 216

@ Direct Sound 84301C8
	voice_directsound_no_resample 30, 182, DirectSoundWaveData_8460E60, 8, 0, 255, 216

@ SquareWave1 84301D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84301E0
	voice_directsound_no_resample 72, 232, DirectSoundWaveData_8461D8C, 255, 0, 255, 0

@ SquareWave1 84301EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84301F8
	voice_directsound_no_resample 72, 222, DirectSoundWaveData_84622A4, 255, 0, 255, 0

VoiceGroupTable_8430204: @ 8430204

@ Direct Sound 8430204
	voice_directsound 60, 0, DirectSoundWaveData_846286C, 255, 252, 0, 239

@ Direct Sound 8430210
	voice_directsound 60, 0, DirectSoundWaveData_84637CC, 255, 250, 0, 221

@ Direct Sound 843021C
	voice_directsound 60, 0, DirectSoundWaveData_8464E2C, 255, 250, 0, 221

@ Direct Sound 8430228
	voice_directsound 60, 0, DirectSoundWaveData_8466388, 255, 247, 0, 221

VoiceGroupTable_8430234: @ 8430234

@ Direct Sound 8430234
	voice_directsound 60, 0, DirectSoundWaveData_8466F14, 255, 0, 255, 196

@ Direct Sound 8430240
	voice_directsound 60, 0, DirectSoundWaveData_846A4B8, 255, 0, 255, 196

@ Direct Sound 843024C
	voice_directsound 60, 0, DirectSoundWaveData_846C7D4, 255, 0, 255, 196

VoiceGroupTable_8430258: @ 8430258

@ Direct Sound 8430258
	voice_directsound 60, 0, DirectSoundWaveData_846FEA0, 255, 0, 193, 127

@ Direct Sound 8430264
	voice_directsound 60, 0, DirectSoundWaveData_84711F0, 255, 0, 193, 127

@ Direct Sound 8430270
	voice_directsound 60, 0, DirectSoundWaveData_8472700, 255, 0, 193, 127

@ SquareWave1 843027C
	voice_square_1_alt 38, 2, 1, 0, 0, 0

@ SquareWave1 8430288
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430294
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84302A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84302AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84302B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84302C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84302D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84302DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84302E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84302F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430300
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843030C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430318
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430324
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430330
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843033C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430348
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430354
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430360
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843036C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430378
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430384
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430390
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843039C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84303A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84303B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84303C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84303CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84303D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84303E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84303F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84303FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430408
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430414
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430420
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843042C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430438
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430444
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430450
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843045C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430468
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430474
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430480
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843048C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430498
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84304A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84304B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84304BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84304C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84304D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84304E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84304EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84304F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430504
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430510
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843051C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430528
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430534
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430540
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843054C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430558
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430564
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430570
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843057C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430588
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430594
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84305A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84305AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84305B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84305C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84305D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84305DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84305E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84305F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430600
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843060C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430618
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430624
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430630
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843063C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430648
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430654
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430660
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843066C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430678
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430684
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430690
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843069C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84306A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84306B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84306C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84306CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84306D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84306E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84306F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84306FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430708
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430714
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430720
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843072C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430738
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430744
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430750
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843075C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430768
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430774
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430780
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843078C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430798
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84307A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84307B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84307BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84307C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84307D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84307E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84307EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84307F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430804
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430810
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843081C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430828
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430834
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430840
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843084C
	voice_square_1 0, 2, 0, 0, 15, 0

	.incbin "baserom.gba", 0x00430858, 0x24

VoiceGroupTable_843087C: @ 843087C
@ Direct Sound 843087C
	voice_directsound 60, 0, DirectSoundWaveData_8473B20, 255, 0, 255, 165

@ Direct Sound 8430888
	voice_directsound 60, 0, DirectSoundWaveData_8474BBC, 255, 0, 255, 165

VoiceGroupTable_8430894: @ 8430894

@ Direct Sound 8430894
	voice_directsound 60, 0, DirectSoundWaveData_8475C18, 255, 0, 224, 165

@ Direct Sound 84308A0
	voice_directsound 60, 0, DirectSoundWaveData_847CBAC, 255, 0, 218, 165

VoiceGroupTable_84308AC: @ 84308AC

@ Percussion 84308AC
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_8435FAC
	.4byte 0x00000000

@ SquareWave1 84308B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84308C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84308D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 84308DC
	voice_square_2 3, 0, 4, 0, 1

@ SquareWave1 84308E8
	voice_square_1 0, 3, 0, 4, 0, 1

@ SquareWave1 84308F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430900
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843090C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430918
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430924
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430930
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843093C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430948
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8430954
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 216, 90, 242

@ SquareWave1 8430960
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843096C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430978
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430984
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430990
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843099C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84309A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84309B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84309C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84309CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84309D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84309E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84309F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84309FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430A98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430AA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430AB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430ABC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430AC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8430AD4
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 204

@ Direct Sound 8430AE0
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 8430AEC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8430AF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430B04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430B10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430B1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430B28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430B34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430B40
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8430B4C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8430B58
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8430B64
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 8430B70
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8430B7C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8430B88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430B94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430BA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430BAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430BB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430BC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430BD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430BDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430BE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430BF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430C00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430C0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430C18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430C24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430C30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430C3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430C48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430C54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430C60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8430C6C
	voice_square_2 3, 0, 1, 7, 1

@ WaveMemory 8430C78
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 2

@ SquareWave1 8430C84
	voice_square_1 0, 3, 0, 1, 7, 1

@ SquareWave1 8430C90
	voice_square_1 0, 3, 0, 0, 7, 1

VoiceGroupTable_8430C9C: @ 8430C9C

@ Percussion 8430C9C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_8433BAC
	.4byte 0x00000000

@ SquareWave1 8430CA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430CB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430CC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430CCC
	voice_square_1_alt 0, 3, 0, 2, 4, 0

@ SquareWave2 8430CD8
	voice_square_2_alt 3, 0, 2, 4, 0

@ SquareWave2 8430CE4
	voice_square_2_alt 2, 0, 3, 0, 0

@ SquareWave2 8430CF0
	voice_square_2_alt 2, 0, 3, 0, 0

@ SquareWave1 8430CFC
	voice_square_1_alt 0, 2, 0, 3, 0, 0

@ SquareWave1 8430D08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430D14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430D20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430D2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430D38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430D44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430D50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430D5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430D68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430D74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430D80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430D8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430D98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430DA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430DB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8430DBC
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 149

@ SquareWave1 8430DC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430DD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430DE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430DEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430DF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430E04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430E10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430E1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430E28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430E34
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8430E40
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 149

@ SquareWave1 8430E4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430E58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430E64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430E70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430E7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430E88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430E94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430EA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430EAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430EB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430EC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430ED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8430EDC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8430EE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430EF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430F9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430FA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430FB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430FC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430FCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430FD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430FE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430FF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8430FFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8431008
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ WaveMemory 8431014
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 15, 1

@ SquareWave1 8431020
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843102C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431038
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431044
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431050
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843105C
	voice_square_2_alt 2, 1, 1, 7, 1

@ SquareWave1 8431068
	voice_square_1_alt 0, 2, 1, 1, 7, 1

@ SquareWave1 8431074
	voice_square_1_alt 0, 2, 0, 0, 7, 1

@ SquareWave1 8431080
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843108C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431098
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84310A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84310B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84310BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84310C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84310D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84310E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84310EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84310F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431104
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431110
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843111C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431128
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431134
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431140
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843114C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431158
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431164
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431170
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843117C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431188
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431194
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84311A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84311AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84311B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84311C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84311D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84311DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84311E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84311F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431200
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843120C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431218
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431224
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431230
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843123C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431248
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431254
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431260
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843126C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431278
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431284
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8431290
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843129C: @ 843129C

@ Percussion 843129C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 84312A8
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ Direct Sound 84312B4
	voice_directsound 60, 0, DirectSoundWaveData_8497134, 255, 178, 180, 165

@ SquareWave1 84312C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84312CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84312D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84312E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84312F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84312FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8431308
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 255, 165, 51, 235

@ SquareWave1 8431314
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431320
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843132C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8431338
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 8431344
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431350
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843135C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431368
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431374
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431380
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843138C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431398
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84313A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84313B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84313BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84313C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84313D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84313E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84313EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84313F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431404
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431410
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843141C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431428
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431434
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431440
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843144C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431458
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8431464
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 8431470
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843147C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431488
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431494
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84314A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84314AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84314B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84314C4
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 204

@ Direct Sound 84314D0
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 84314DC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 84314E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84314F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431500
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843150C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431518
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431524
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431530
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843153C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8431548
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8431554
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 8431560
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843156C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8431578
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431584
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431590
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843159C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84315A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84315B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84315C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84315CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84315D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84315E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84315F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84315FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8431608
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ SquareWave1 8431614
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431620
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843162C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431638
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431644
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431650
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843165C
	voice_square_2_alt 2, 0, 1, 7, 1

@ SquareWave1 8431668
	voice_square_1_alt 0, 2, 0, 1, 7, 1

@ SquareWave2 8431674
	voice_square_2_alt 3, 0, 1, 7, 1

@ SquareWave1 8431680
	voice_square_1_alt 0, 3, 0, 1, 7, 1

@ SquareWave2 843168C
	voice_square_2_alt 2, 0, 1, 4, 1

@ SquareWave1 8431698
	voice_square_1_alt 0, 2, 0, 1, 4, 1

@ SquareWave1 84316A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 84316B0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 2

@ WaveMemory 84316BC
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 2

@ SquareWave1 84316C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 84316D4
	voice_square_2 2, 0, 1, 4, 1

@ SquareWave1 84316E0
	voice_square_1 0, 2, 0, 1, 4, 1

@ SquareWave1 84316EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84316F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431704
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431710
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843171C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431728
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431734
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431740
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843174C
	voice_square_1_alt 29, 2, 0, 2, 0, 0

@ SquareWave1 8431758
	voice_square_1_alt 22, 2, 0, 2, 0, 0

VoiceGroupTable_8431764: @ 8431764

@ Percussion 8431764
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8431770
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843177C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431788
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431794
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84317A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84317AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84317B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84317C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84317D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84317DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84317E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84317F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431800
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843180C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431818
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431824
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431830
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843183C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431848
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431854
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431860
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843186C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431878
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431884
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431890
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843189C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84318A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84318B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84318C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84318CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84318D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84318E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84318F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84318FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431908
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431914
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431920
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843192C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431938
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431944
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431950
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843195C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431968
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431974
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431980
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843198C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8431998
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 84319A4
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 84319B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84319BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84319C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84319D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84319E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84319EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84319F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8431A04
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8431A10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431A1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431A28
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8431A34
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8431A40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431A4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431A58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431A64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431A70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431A7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431A88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431A94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431AA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431AAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431AB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431AC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431AD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431ADC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431AE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431AF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431B00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431B0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431B18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8431B24
	voice_square_2_alt 1, 0, 1, 7, 1

@ SquareWave1 8431B30
	voice_square_1_alt 0, 1, 0, 1, 7, 1

@ SquareWave1 8431B3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431B48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8431B54
	voice_square_2_alt 3, 0, 1, 7, 1

@ SquareWave1 8431B60
	voice_square_1_alt 0, 3, 0, 1, 7, 1

@ SquareWave1 8431B6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8431B78
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 1

@ SquareWave1 8431B84
	voice_square_1_alt 0, 1, 0, 0, 7, 1

@ SquareWave1 8431B90
	voice_square_1_alt 0, 3, 0, 0, 7, 1

VoiceGroupTable_8431B9C: @ 8431B9C

@ Percussion 8431B9C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 8431BA8
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8431BB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431BC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8431BCC
	voice_square_2_alt 3, 0, 1, 6, 1

@ SquareWave1 8431BD8
	voice_square_1_alt 0, 3, 0, 1, 6, 1

@ SquareWave2 8431BE4
	voice_square_2_alt 2, 0, 1, 6, 1

@ SquareWave1 8431BF0
	voice_square_1_alt 0, 2, 0, 1, 6, 1

@ SquareWave1 8431BFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431C98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431CA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431CB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8431CBC
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 149

@ SquareWave1 8431CC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431CD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431CE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431CEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431CF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431D94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431DA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431DAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431DB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8431DC4
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 246, 0, 235

@ Direct Sound 8431DD0
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 8431DDC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8431DE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431DF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431E00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431E0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431E18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431E24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431E30
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8431E3C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8431E48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431E54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431E60
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8431E6C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8431E78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431E84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431E90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431E9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431EA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431EB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431EC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431ECC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431ED8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431EE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431EF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431EFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8431F08
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ SquareWave1 8431F14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431F20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431F2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431F38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431F44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431F50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8431F5C
	voice_square_2_alt 3, 0, 1, 7, 1

@ WaveMemory 8431F68
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 1

@ SquareWave1 8431F74
	voice_square_1_alt 0, 3, 0, 1, 7, 1

@ WaveMemory 8431F80
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 0

@ SquareWave1 8431F8C
	voice_square_1_alt 0, 3, 0, 0, 7, 0

VoiceGroupTable_8431F98: @ 8431F98

@ Percussion 8431F98
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_84323E8
	.4byte 0x00000000

@ Key-Split 8431FA4
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8431FB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431FBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431FC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431FD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431FE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431FEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8431FF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432004
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432010
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843201C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432028
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432034
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432040
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843204C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432058
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432064
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432070
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843207C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432088
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432094
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84320A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84320AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 84320B8
	voice_square_2 3, 0, 2, 0, 0

@ SquareWave1 84320C4
	voice_square_1 0, 3, 0, 2, 0, 0

@ SquareWave2 84320D0
	voice_square_2 3, 0, 6, 0, 0

@ SquareWave1 84320DC
	voice_square_1 0, 3, 0, 6, 0, 0

@ SquareWave1 84320E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84320F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432100
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843210C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432118
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432124
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432130
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843213C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 149

@ SquareWave1 8432148
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432154
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432160
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843216C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432178
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432184
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432190
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843219C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84321A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84321B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84321C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84321CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84321D8
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 84321E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84321F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84321FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432208
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432214
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432220
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843222C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8432238
	voice_directsound 60, 0, DirectSoundWaveData_84A5F58, 255, 0, 255, 165

@ SquareWave1 8432244
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432250
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843225C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432268
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432274
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432280
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843228C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432298
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84322A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84322B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84322BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84322C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84322D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84322E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84322EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84322F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8432304
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ WaveMemory 8432310
	voice_programmable_wave ProgrammableWaveData_84553BC, 0, 7, 15, 1

@ SquareWave1 843231C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432328
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432334
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432340
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843234C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432358
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8432364
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 2

@ SquareWave1 8432370
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843237C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432388
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432394
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84323A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84323AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84323B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84323C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84323D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84323DC
	voice_square_1 0, 2, 0, 0, 15, 0

VoiceGroupTable_84323E8: @ 84323E8

@ SquareWave1 84323E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84323F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432400
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843240C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432418
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432424
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432430
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843243C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432448
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432454
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432460
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843246C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432478
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432484
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432490
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843249C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84324A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84324B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84324C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84324CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84324D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84324E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84324F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84324FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432508
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432514
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432520
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843252C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432538
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432544
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432550
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843255C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432568
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432574
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8432580
	voice_noise_alt 0, 0, 2, 0, 2

@ Noise 843258C
	voice_noise_alt 0, 0, 1, 0, 1

@ Direct Sound 8432598
	voice_directsound_no_resample 60, 192, DirectSoundWaveData_845AE14, 255, 0, 255, 242

@ SquareWave1 84325A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84325B0
	voice_directsound_no_resample 60, 192, DirectSoundWaveData_845B2B4, 255, 0, 255, 242

@ SquareWave1 84325BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84325C8
	voice_directsound_no_resample 60, 192, DirectSoundWaveData_845C238, 255, 0, 255, 242

@ SquareWave1 84325D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84325E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84325EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84325F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432604
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432610
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843261C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432628
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432634
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432640
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843264C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432658
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432664
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8432670
	voice_directsound_no_resample 32, 202, DirectSoundWaveData_845FCC8, 255, 127, 77, 204

@ SquareWave1 843267C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432688
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432694
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84326A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84326AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84326B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84326C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84326D0
	voice_directsound_no_resample 72, 194, DirectSoundWaveData_8461D8C, 255, 0, 255, 0

@ SquareWave1 84326DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84326E8
	voice_directsound_no_resample 72, 190, DirectSoundWaveData_84622A4, 255, 0, 255, 0

VoiceGroupTable_84326F4: @ 84326F4

@ Percussion 84326F4
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave2 8432700
	voice_square_2_alt 2, 0, 3, 3, 1

@ SquareWave1 843270C
	voice_square_1_alt 0, 2, 0, 3, 3, 1

@ SquareWave1 8432718
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8432724
	voice_square_2_alt 2, 0, 1, 7, 2

@ SquareWave1 8432730
	voice_square_1_alt 0, 2, 0, 1, 7, 2

@ SquareWave2 843273C
	voice_square_2_alt 2, 1, 1, 0, 0

@ SquareWave1 8432748
	voice_square_1_alt 0, 2, 1, 1, 0, 0

@ SquareWave1 8432754
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432760
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843276C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432778
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432784
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432790
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843279C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84327A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84327B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84327C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84327CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84327D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84327E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84327F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84327FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432808
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432814
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432820
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843282C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432838
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432844
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432850
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843285C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432868
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432874
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432880
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843288C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432898
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84328A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84328B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84328BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84328C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84328D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84328E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84328EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84328F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432904
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8432910
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 216, 0, 165

@ Direct Sound 843291C
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 204

@ SquareWave1 8432928
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8432934
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8432940
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843294C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432958
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432964
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432970
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843297C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432988
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432994
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84329A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84329AC
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 84329B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84329C4
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 84329D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84329DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84329E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84329F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432A00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432A0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432A18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432A24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432A30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432A3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432A48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432A54
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8432A60
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ WaveMemory 8432A6C
	voice_programmable_wave ProgrammableWaveData_84553BC, 0, 7, 15, 0

@ SquareWave1 8432A78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432A84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432A90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432A9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432AA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8432AB4
	voice_square_2_alt 2, 1, 1, 7, 2

@ WaveMemory 8432AC0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 2

@ SquareWave1 8432ACC
	voice_square_1_alt 0, 2, 1, 1, 7, 2

@ SquareWave2 8432AD8
	voice_square_2_alt 3, 1, 1, 7, 2

@ SquareWave1 8432AE4
	voice_square_1_alt 0, 3, 1, 1, 7, 2

@ WaveMemory 8432AF0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 3

@ SquareWave1 8432AFC
	voice_square_1_alt 0, 2, 0, 0, 7, 2

@ SquareWave1 8432B08
	voice_square_1_alt 0, 3, 0, 0, 7, 2

@ SquareWave2 8432B14
	voice_square_2_alt 1, 1, 2, 6, 2

@ SquareWave1 8432B20
	voice_square_1_alt 0, 1, 1, 2, 6, 2

@ SquareWave1 8432B2C
	voice_square_1_alt 0, 1, 0, 0, 6, 2

VoiceGroupTable_8432B38: @ 8432B38

@ Percussion 8432B38
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 8432B44
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8432B50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432B5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8432B68
	voice_square_2_alt 0, 0, 1, 7, 1

@ SquareWave1 8432B74
	voice_square_1_alt 0, 0, 0, 1, 7, 1

@ SquareWave1 8432B80
	voice_square_1_alt 0, 0, 0, 0, 7, 1

@ SquareWave1 8432B8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432B98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432BA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432BB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432BBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432BC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432BD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432BE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432BEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432BF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432C94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432CA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432CAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432CB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432CC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432CD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432CDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432CE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432CF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432D00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432D0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432D18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432D24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432D30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432D3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432D48
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8432D54
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 216, 0, 165

@ SquareWave1 8432D60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432D6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8432D78
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8432D84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432D90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432D9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432DA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432DB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432DC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432DCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432DD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432DE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432DF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432DFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432E98
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8432EA4
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ SquareWave1 8432EB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432EBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432EC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432ED4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432EE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432EEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8432EF8
	voice_square_2_alt 2, 0, 1, 7, 1

@ WaveMemory 8432F04
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 2

@ SquareWave1 8432F10
	voice_square_1_alt 0, 2, 0, 1, 7, 1

@ SquareWave1 8432F1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432F28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432F34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432F40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432F4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432F58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432F64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432F70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432F7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432F88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432F94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432FA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432FAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432FB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432FC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432FD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432FDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432FE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8432FF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433000
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843300C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433018
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433024
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433030
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843303C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433048
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433054
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433060
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843306C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433078
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433084
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433090
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843309C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84330A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84330B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84330C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84330CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84330D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84330E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84330F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84330FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433108
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433114
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433120
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843312C
	voice_noise_alt 1, 0, 1, 0, 3

VoiceGroupTable_8433138: @ 8433138

@ SquareWave1 8433138
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433144
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433150
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843315C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8433168
	voice_square_2_alt 1, 0, 1, 7, 1

@ SquareWave1 8433174
	voice_square_1_alt 0, 1, 0, 1, 7, 1

@ SquareWave2 8433180
	voice_square_2_alt 2, 0, 2, 6, 1

@ SquareWave1 843318C
	voice_square_1_alt 0, 2, 0, 2, 6, 1

@ SquareWave1 8433198
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84331A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84331B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84331BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84331C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84331D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84331E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84331EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84331F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433204
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433210
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843321C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433228
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433234
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433240
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843324C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433258
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433264
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433270
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843327C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433288
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433294
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84332A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84332AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84332B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84332C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84332D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84332DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84332E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84332F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433300
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843330C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433318
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433324
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433330
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843333C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433348
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8433354
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 216, 0, 165

@ SquareWave1 8433360
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843336C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8433378
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8433384
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433390
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843339C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84333A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84333B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84333C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84333CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84333D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84333E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84333F0
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 84333FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8433408
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8433414
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433420
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843342C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433438
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433444
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433450
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843345C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433468
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433474
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433480
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843348C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433498
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84334A4
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ SquareWave1 84334B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84334BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84334C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84334D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84334E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84334EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 84334F8
	voice_square_2_alt 2, 0, 1, 7, 1

@ WaveMemory 8433504
	voice_programmable_wave_alt ProgrammableWaveData_84553FC, 0, 7, 15, 2

@ SquareWave1 8433510
	voice_square_1_alt 0, 2, 0, 1, 7, 1

@ SquareWave1 843351C
	voice_square_1_alt 0, 2, 0, 0, 7, 1

@ SquareWave1 8433528
	voice_square_1_alt 0, 1, 0, 0, 7, 1

VoiceGroupTable_8433534: @ 8433534

@ Key-Split 8433534
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8433540
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843354C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433558
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433564
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433570
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843357C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433588
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433594
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84335A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84335AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84335B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84335C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84335D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84335DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84335E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84335F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433600
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843360C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433618
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433624
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433630
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843363C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433648
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433654
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433660
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843366C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433678
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433684
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433690
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843369C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84336A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84336B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84336C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84336CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84336D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84336E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84336F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84336FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433708
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433714
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433720
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843372C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433738
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433744
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8433750
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 216, 0, 165

@ SquareWave1 843375C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433768
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8433774
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8433780
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843378C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433798
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84337A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84337B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84337BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84337C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84337D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84337E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84337EC
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 84337F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433804
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433810
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843381C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433828
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433834
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433840
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843384C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433858
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433864
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433870
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843387C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433888
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433894
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84338A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84338AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84338B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84338C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84338D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84338DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84338E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 84338F4
	voice_square_2 2, 0, 1, 7, 1

@ SquareWave1 8433900
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843390C
	voice_square_1 0, 2, 0, 1, 7, 1

@ SquareWave2 8433918
	voice_square_2_alt 1, 0, 1, 6, 2

@ SquareWave1 8433924
	voice_square_1_alt 0, 1, 0, 1, 6, 2

@ SquareWave1 8433930
	voice_square_1_alt 0, 1, 0, 0, 6, 2

@ SquareWave1 843393C
	voice_square_1 0, 2, 0, 0, 7, 1

VoiceGroupTable_8433948: @ 8433948

@ Percussion 8433948
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8433954
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8433960
	voice_square_2_alt 3, 0, 2, 0, 0

@ SquareWave1 843396C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8433978
	voice_square_2_alt 3, 0, 1, 6, 0

@ SquareWave1 8433984
	voice_square_1_alt 0, 3, 0, 1, 6, 0

@ SquareWave1 8433990
	voice_square_1_alt 0, 3, 0, 0, 6, 0

@ SquareWave1 843399C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84339A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84339B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84339C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84339CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84339D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84339E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84339F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84339FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433A98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433AA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433AB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433ABC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433AC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433AD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433AE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433AEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433AF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433B04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433B10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433B1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433B28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433B34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433B40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433B4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433B58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433B64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433B70
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8433B7C
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 8433B88
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8433B94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433BA0
	voice_square_1 0, 2, 0, 0, 15, 0

VoiceGroupTable_8433BAC: @ 8433BAC

@ SquareWave1 8433BAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433BB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433BC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433BD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433BDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8433BE8
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8433BF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8433C00
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 8433C0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8433C18
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8433C24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433C30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433C3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433C48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433C54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433C60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433C6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433C78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433C84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433C90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433C9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433CA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8433CB4
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ SquareWave1 8433CC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433CCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433CD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433CE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433CF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433CFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8433D08
	voice_square_2_alt 0, 0, 1, 7, 0

@ WaveMemory 8433D14
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 1

@ SquareWave1 8433D20
	voice_square_1_alt 0, 0, 0, 1, 7, 0

@ WaveMemory 8433D2C
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 0

@ WaveMemory 8433D38
	voice_programmable_wave_alt ProgrammableWaveData_84553FC, 0, 7, 15, 0

@ WaveMemory 8433D44
	voice_programmable_wave_alt ProgrammableWaveData_84553FC, 0, 7, 15, 1

@ SquareWave1 8433D50
	voice_square_1_alt 0, 0, 0, 0, 7, 0

@ Direct Sound 8433D5C
	voice_directsound_no_resample 60, 192, DirectSoundWaveData_845AE14, 255, 0, 255, 242

@ SquareWave1 8433D68
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8433D74
	voice_directsound_no_resample 60, 192, DirectSoundWaveData_845B2B4, 255, 0, 255, 242

@ SquareWave1 8433D80
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8433D8C
	voice_directsound_no_resample 60, 192, DirectSoundWaveData_845C238, 255, 0, 255, 242

@ SquareWave1 8433D98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433DA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433DB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433DBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433DC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433DD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433DE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433DEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433DF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433E04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433E10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433E1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433E28
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8433E34
	voice_directsound_no_resample 32, 162, DirectSoundWaveData_845FCC8, 255, 127, 77, 204

@ SquareWave1 8433E40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433E4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433E58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433E64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433E70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433E7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433E88
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8433E94
	voice_directsound_no_resample 72, 195, DirectSoundWaveData_8461D8C, 255, 0, 255, 0

@ SquareWave1 8433EA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8433EAC
	voice_directsound_no_resample 72, 189, DirectSoundWaveData_84622A4, 255, 0, 255, 0

VoiceGroupTable_8433EB8: @ 8433EB8

@ Key-Split 8433EB8
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ Percussion 8433EC4
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8433ED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433EDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433EE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433EF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433F9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433FA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433FB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433FC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433FCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433FD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433FE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433FF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8433FFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434008
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434014
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434020
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843402C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434038
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434044
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434050
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843405C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 149

@ SquareWave1 8434068
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434074
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434080
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843408C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434098
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84340A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84340B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84340BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84340C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84340D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84340E0
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 246, 0, 235

@ SquareWave1 84340EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84340F8
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8434104
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434110
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843411C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434128
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434134
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434140
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843414C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8434158
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8434164
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434170
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843417C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434188
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434194
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84341A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84341AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84341B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84341C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84341D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84341DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84341E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84341F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434200
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843420C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434218
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434224
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434230
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843423C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434248
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434254
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434260
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843426C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8434278
	voice_square_2_alt 2, 0, 1, 7, 0

@ WaveMemory 8434284
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 1

@ SquareWave1 8434290
	voice_square_1_alt 0, 2, 0, 1, 7, 0

@ SquareWave2 843429C
	voice_square_2_alt 2, 0, 1, 6, 1

@ SquareWave1 84342A8
	voice_square_1_alt 0, 2, 0, 1, 6, 1

@ SquareWave2 84342B4
	voice_square_2_alt 3, 0, 1, 7, 0

@ SquareWave1 84342C0
	voice_square_1_alt 0, 3, 0, 1, 7, 0

@ SquareWave1 84342CC
	voice_square_1_alt 0, 2, 0, 0, 7, 0

@ SquareWave1 84342D8
	voice_square_1_alt 0, 3, 0, 0, 7, 0

VoiceGroupTable_84342E4: @ 84342E4

@ Percussion 84342E4
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84342F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84342FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434308
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434314
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434320
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843432C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434338
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434344
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434350
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843435C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434368
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434374
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434380
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843438C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434398
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84343A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84343B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84343BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84343C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84343D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84343E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84343EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84343F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434404
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434410
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843441C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434428
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434434
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434440
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843444C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434458
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434464
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434470
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843447C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434488
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434494
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84344A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84344AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84344B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84344C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84344D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84344DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84344E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84344F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8434500
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 216, 0, 165

@ SquareWave1 843450C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8434518
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 8434524
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8434530
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843453C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434548
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434554
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434560
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843456C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434578
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8434584
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8434590
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843459C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84345A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84345B4
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 84345C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84345CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84345D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84345E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84345F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84345FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434608
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434614
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434620
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843462C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434638
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434644
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8434650
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ SquareWave1 843465C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434668
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434674
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434680
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843468C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434698
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 84346A4
	voice_square_2_alt 2, 0, 1, 7, 0

@ WaveMemory 84346B0
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 1

@ SquareWave1 84346BC
	voice_square_1_alt 0, 2, 0, 1, 7, 0

@ SquareWave2 84346C8
	voice_square_2_alt 2, 0, 2, 0, 0

@ SquareWave2 84346D4
	voice_square_2_alt 3, 0, 1, 7, 0

@ SquareWave1 84346E0
	voice_square_1_alt 0, 3, 0, 1, 7, 0

@ SquareWave1 84346EC
	voice_square_1_alt 0, 2, 0, 2, 0, 0

@ SquareWave1 84346F8
	voice_square_1_alt 0, 3, 0, 0, 7, 0

@ SquareWave1 8434704
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8434710
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 0

@ WaveMemory 843471C
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 1

VoiceGroupTable_8434728: @ 8434728

@ Percussion 8434728
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8434734
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434740
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843474C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434758
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434764
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434770
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843477C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434788
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434794
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84347A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84347AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84347B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84347C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84347D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84347DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84347E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84347F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434800
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843480C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434818
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434824
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434830
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843483C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434848
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434854
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434860
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843486C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434878
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434884
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434890
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843489C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84348A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84348B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84348C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84348CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84348D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84348E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84348F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84348FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434908
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434914
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434920
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843492C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434938
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434944
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434950
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843495C
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ SquareWave1 8434968
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434974
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434980
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843498C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434998
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84349A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84349B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84349BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84349C8
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 84349D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84349E0
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 84349EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84349F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434A04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434A10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434A1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434A28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434A34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434A40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434A4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434A58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434A64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434A70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434A7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434A88
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8434A94
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ SquareWave1 8434AA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434AAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434AB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434AC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434AD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434ADC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8434AE8
	voice_square_2_alt 1, 0, 1, 7, 1

@ WaveMemory 8434AF4
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 15, 1

@ SquareWave1 8434B00
	voice_square_1_alt 0, 1, 0, 1, 7, 1

@ SquareWave2 8434B0C
	voice_square_2_alt 2, 0, 1, 0, 0

VoiceGroupTable_8434B18: @ 8434B18

@ Percussion 8434B18
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8434B24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434B30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434B3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434B48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434B54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434B60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434B6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434B78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434B84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434B90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434B9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434BA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434BB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434BC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434BCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434BD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434BE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434BF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434BFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434C98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434CA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434CB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434CBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434CC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434CD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434CE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434CEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434CF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434D04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434D10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434D1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434D28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434D34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434D40
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8434D4C
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ SquareWave1 8434D58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434D64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434D70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434D7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434D88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434D94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434DA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434DAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434DB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434DC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434DD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434DDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8434DE8
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8434DF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434E9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434EA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434EB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434EC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434ECC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8434ED8
	voice_square_2_alt 2, 0, 1, 9, 0

@ WaveMemory 8434EE4
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 0

@ SquareWave1 8434EF0
	voice_square_1_alt 0, 2, 0, 1, 9, 0

@ SquareWave2 8434EFC
	voice_square_2_alt 3, 0, 1, 7, 0

@ SquareWave1 8434F08
	voice_square_1_alt 0, 3, 0, 1, 7, 0

VoiceGroupTable_8434F14: @ 8434F14

@ Percussion 8434F14
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 8434F20
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8434F2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434F38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434F44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434F50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434F5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434F68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434F74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434F80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434F8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434F98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434FA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8434FB0
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 8434FBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434FC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434FD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434FE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434FEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8434FF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435004
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435010
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843501C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435028
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8435034
	voice_square_2 1, 0, 2, 0, 0

@ SquareWave1 8435040
	voice_square_1 0, 1, 0, 2, 0, 0

@ SquareWave2 843504C
	voice_square_2 1, 0, 6, 0, 0

@ SquareWave1 8435058
	voice_square_1 0, 1, 0, 6, 0, 0

@ SquareWave1 8435064
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435070
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843507C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435088
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435094
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84350A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84350AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84350B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84350C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84350D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84350DC
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 84350E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84350F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435100
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843510C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435118
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435124
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435130
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843513C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435148
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435154
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435160
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843516C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435178
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435184
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435190
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843519C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84351A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84351B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84351C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84351CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84351D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84351E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84351F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84351FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435208
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435214
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435220
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843522C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435238
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435244
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435250
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843525C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435268
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435274
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8435280
	voice_programmable_wave ProgrammableWaveData_84553BC, 0, 7, 15, 0

@ SquareWave1 843528C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435298
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84352A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84352B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84352BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84352C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84352D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 84352E0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 84352EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84352F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435304
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435310
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843531C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435328
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435334
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435340
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843534C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435358
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435364
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435370
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843537C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435388
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435394
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84353A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84353AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84353B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84353C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84353D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84353DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84353E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84353F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435400
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843540C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435418
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435424
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435430
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843543C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435448
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435454
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435460
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843546C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435478
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435484
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435490
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843549C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84354A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84354B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84354C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84354CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84354D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84354E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84354F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84354FC
	voice_noise_alt 0, 0, 4, 1, 4

@ Noise 8435508
	voice_noise_alt 0, 0, 1, 0, 2

VoiceGroupTable_8435514: @ 8435514

@ Percussion 8435514
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8435520
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843552C
	voice_square_1 0, 3, 0, 1, 0, 0

@ SquareWave1 8435538
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435544
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435550
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843555C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8435568
	voice_square_2 0, 0, 2, 0, 0

@ SquareWave1 8435574
	voice_square_1 0, 0, 0, 2, 0, 0

@ SquareWave2 8435580
	voice_square_2 0, 0, 6, 0, 0

@ SquareWave1 843558C
	voice_square_1 0, 0, 0, 6, 0, 0

@ SquareWave1 8435598
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84355A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84355B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84355BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84355C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84355D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84355E0
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 127

@ SquareWave1 84355EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84355F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435604
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435610
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843561C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435628
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435634
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435640
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843564C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435658
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435664
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435670
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843567C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435688
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435694
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84356A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84356AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84356B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84356C4
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 84356D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84356DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84356E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84356F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435700
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843570C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435718
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435724
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435730
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843573C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435748
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435754
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435760
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843576C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435778
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435784
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435790
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843579C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84357A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84357B4
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 84357C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84357CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84357D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84357E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84357F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84357FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435808
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435814
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435820
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843582C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435838
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435844
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435850
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843585C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435868
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435874
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435880
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843588C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435898
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84358A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84358B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84358BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84358C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 84358D4
	voice_square_2 2, 0, 2, 0, 0

@ WaveMemory 84358E0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave2 84358EC
	voice_square_2 3, 0, 4, 0, 0

VoiceGroupTable_84358F8: @ 84358F8

@ Percussion 84358F8
	voice_keysplit_all VoiceGroupTable_842FEF8

@ SquareWave1 8435904
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435910
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843591C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435928
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435934
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435940
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843594C
	voice_square_2_alt 1, 0, 2, 4, 0

@ SquareWave1 8435958
	voice_square_1_alt 0, 1, 0, 2, 7, 0

@ SquareWave1 8435964
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435970
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843597C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8435988
	voice_square_2_alt 2, 0, 2, 0, 0

@ SquareWave1 8435994
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84359A0
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 216, 90, 242

@ SquareWave1 84359AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84359B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84359C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84359D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84359DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84359E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84359F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435A9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435AA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435AB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435AC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435ACC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435AD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435AE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435AF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435AFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435B08
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8435B14
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 216, 0, 165

@ SquareWave1 8435B20
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8435B2C
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 8435B38
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8435B44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435B50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435B5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435B68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435B74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435B80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435B8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8435B98
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8435BA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435BB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435BBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8435BC8
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8435BD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435BE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435BEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435BF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435C04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435C10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435C1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435C28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435C34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435C40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435C4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435C58
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8435C64
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ SquareWave1 8435C70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435C7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435C88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435C94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435CA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435CAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8435CB8
	voice_square_2_alt 3, 0, 1, 7, 0

@ WaveMemory 8435CC4
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 1

@ SquareWave1 8435CD0
	voice_square_1_alt 0, 3, 0, 1, 7, 0

@ SquareWave2 8435CDC
	voice_square_2_alt 3, 0, 1, 0, 0

@ SquareWave1 8435CE8
	voice_square_1_alt 0, 3, 0, 1, 0, 0

@ SquareWave1 8435CF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435D00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435D0C
	voice_square_1_alt 0, 0, 0, 1, 7, 0

VoiceGroupTable_8435D18: @ 8435D18

@ Percussion 8435D18
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_8435FAC
	.4byte 0x00000000

@ Key-Split 8435D24
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8435D30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435D3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435D48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435D54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435D60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8435D6C
	voice_square_2_alt 3, 0, 2, 4, 0

@ SquareWave1 8435D78
	voice_square_1_alt 0, 3, 0, 2, 4, 0

@ SquareWave1 8435D84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435D90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435D9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435DA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435DB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8435DC0
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 216, 90, 242

@ SquareWave1 8435DCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435DD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8435DE4
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 37, 165, 180, 127

@ SquareWave1 8435DF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435DFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435E98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435EA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435EB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435EBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435EC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435ED4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435EE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435EEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435EF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435F04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435F10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435F1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435F28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435F34
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8435F40
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 246, 0, 235

@ Direct Sound 8435F4C
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ SquareWave1 8435F58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435F64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435F70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435F7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435F88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435F94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435FA0
	voice_square_1 0, 2, 0, 0, 15, 0

VoiceGroupTable_8435FAC: @ 8435FAC

@ SquareWave1 8435FAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435FB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435FC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435FD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8435FDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8435FE8
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8435FF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436000
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843600C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436018
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436024
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436030
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843603C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436048
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436054
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436060
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843606C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436078
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436084
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436090
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843609C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84360A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84360B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84360C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84360CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84360D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 84360E4
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 1

@ SquareWave1 84360F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84360FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436108
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436114
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436120
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843612C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436138
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436144
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8436150
	voice_directsound 60, 0, DirectSoundWaveData_849F40C, 255, 165, 154, 127

@ SquareWave1 843615C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436168
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436174
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436180
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843618C
	voice_directsound_no_resample 60, 192, DirectSoundWaveData_845C238, 255, 0, 255, 242

@ SquareWave1 8436198
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84361A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84361B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84361BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84361C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84361D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84361E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84361EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84361F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436204
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436210
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843621C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436228
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8436234
	voice_directsound_no_resample 32, 177, DirectSoundWaveData_845FCC8, 255, 127, 77, 204

@ SquareWave1 8436240
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843624C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8436258
	voice_directsound_no_resample 30, 182, DirectSoundWaveData_8460E60, 8, 0, 255, 216

@ SquareWave1 8436264
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8436270
	voice_directsound_no_resample 30, 182, DirectSoundWaveData_8460E60, 255, 246, 0, 216

@ SquareWave1 843627C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436288
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8436294
	voice_directsound_no_resample 72, 207, DirectSoundWaveData_8461D8C, 255, 0, 255, 0

@ SquareWave1 84362A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84362AC
	voice_directsound_no_resample 72, 202, DirectSoundWaveData_84622A4, 255, 0, 255, 0

VoiceGroupTable_84362B8: @ 84362B8

@ Percussion 84362B8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_84323E8
	.4byte 0x00000000

@ Key-Split 84362C4
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 84362D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84362DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84362E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84362F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436300
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843630C
	voice_square_2_alt 3, 0, 3, 4, 0

@ SquareWave1 8436318
	voice_square_1_alt 0, 3, 0, 3, 4, 0

@ SquareWave1 8436324
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436330
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843633C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436348
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436354
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436360
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843636C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436378
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436384
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436390
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843639C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84363A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84363B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84363C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84363CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84363D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84363E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84363F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84363FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436408
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436414
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436420
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843642C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436438
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436444
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436450
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843645C
	voice_directsound 60, 0, DirectSoundWaveData_8483804, 255, 250, 0, 149

@ SquareWave1 8436468
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436474
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436480
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843648C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436498
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84364A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84364B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84364BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84364C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84364D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84364E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84364EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84364F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436504
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436510
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843651C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436528
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436534
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436540
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843654C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436558
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436564
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436570
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843657C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436588
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436594
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84365A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84365AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84365B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84365C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84365D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84365DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84365E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84365F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436600
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843660C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436618
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8436624
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ WaveMemory 8436630
	voice_programmable_wave ProgrammableWaveData_84553BC, 0, 7, 15, 1

@ SquareWave1 843663C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436648
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436654
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436660
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843666C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436678
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8436684
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 2

@ SquareWave1 8436690
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843669C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84366A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84366B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84366C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84366CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84366D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84366E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84366F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84366FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436708
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436714
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436720
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843672C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436738
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436744
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436750
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843675C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436768
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436774
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436780
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843678C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436798
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84367A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84367B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84367BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84367C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84367D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84367E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84367EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84367F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436804
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436810
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843681C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436828
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436834
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436840
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843684C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436858
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436864
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436870
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843687C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436888
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8436894
	voice_noise_alt 0, 0, 1, 0, 0

@ Noise 84368A0
	voice_noise_alt 0, 0, 4, 1, 4

@ Noise 84368AC
	voice_noise_alt 0, 0, 1, 0, 2

VoiceGroupTable_84368B8: @ 84368B8

@ Percussion 84368B8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84368C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84368D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84368DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84368E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84368F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436900
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843690C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436918
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436924
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436930
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843693C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436948
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436954
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436960
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843696C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436978
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436984
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436990
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843699C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84369A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84369B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84369C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84369CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84369D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84369E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84369F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84369FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436A08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436A14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436A20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436A2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436A38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436A44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436A50
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8436A5C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 149

@ SquareWave1 8436A68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436A74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436A80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436A8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436A98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436AA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436AB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436ABC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436AC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436AD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8436AE0
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 246, 0, 235

@ SquareWave1 8436AEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8436AF8
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8436B04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436B10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436B1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436B28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436B34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436B40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436B4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436B58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436B64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436B70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436B7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8436B88
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8436B94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436BA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436BAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436BB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436BC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436BD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436BDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436BE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436BF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436C00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436C0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436C18
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8436C24
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 127, 231, 127

@ SquareWave1 8436C30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436C3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436C48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436C54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436C60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436C6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8436C78
	voice_square_2_alt 2, 0, 1, 4, 1

@ SquareWave1 8436C84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436C90
	voice_square_1_alt 0, 2, 0, 1, 4, 1

VoiceGroupTable_8436C9C: @ 8436C9C

@ Percussion 8436C9C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 8436CA8
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8436CB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436CC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8436CCC
	voice_square_2 2, 0, 1, 4, 2

@ SquareWave1 8436CD8
	voice_square_1 0, 2, 0, 1, 4, 1

@ SquareWave1 8436CE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436CF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436CFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436D98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436DA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436DB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436DBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436DC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436DD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436DE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436DEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436DF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436E04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436E10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436E1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436E28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436E34
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8436E40
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 8436E4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436E58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436E64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436E70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436E7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436E88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436E94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436EA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436EAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8436EB8
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ SquareWave1 8436EC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436ED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8436EDC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8436EE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436EF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436F9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436FA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436FB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436FC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436FCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436FD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436FE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436FF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8436FFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8437008
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 8437014
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437020
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843702C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437038
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437044
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437050
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843705C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437068
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437074
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8437080
	voice_programmable_wave ProgrammableWaveData_845544C, 0, 7, 15, 2

VoiceGroupTable_843708C: @ 843708C

@ Percussion 843708C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_8435FAC
	.4byte 0x00000000

@ Key-Split 8437098
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 84370A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84370B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 84370BC
	voice_square_2_alt 2, 0, 1, 7, 1

@ SquareWave1 84370C8
	voice_square_1_alt 0, 2, 0, 1, 7, 1

@ SquareWave1 84370D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84370E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84370EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84370F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437104
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437110
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843711C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437128
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437134
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437140
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843714C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437158
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437164
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437170
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843717C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437188
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437194
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84371A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84371AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84371B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84371C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84371D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84371DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84371E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84371F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437200
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843720C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437218
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437224
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437230
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843723C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437248
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437254
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437260
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843726C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437278
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437284
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437290
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843729C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84372A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84372B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84372C0
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 84372CC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 84372D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84372E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84372F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84372FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437308
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437314
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437320
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843732C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8437338
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437344
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437350
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843735C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8437368
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437374
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437380
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843738C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437398
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84373A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84373B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84373BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84373C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84373D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84373E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84373EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84373F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437404
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437410
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843741C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437428
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437434
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437440
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843744C
	voice_square_2_alt 3, 0, 1, 6, 1

@ WaveMemory 8437458
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 2

@ SquareWave1 8437464
	voice_square_1_alt 0, 3, 0, 1, 6, 1

@ WaveMemory 8437470
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 0

@ SquareWave1 843747C
	voice_square_1_alt 0, 3, 0, 0, 6, 1

VoiceGroupTable_8437488: @ 8437488

@ Percussion 8437488
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8437494
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84374A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84374AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 84374B8
	voice_square_2_alt 2, 0, 1, 6, 1

@ SquareWave1 84374C4
	voice_square_1_alt 0, 2, 0, 1, 6, 1

@ SquareWave1 84374D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84374DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84374E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84374F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437500
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843750C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437518
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437524
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437530
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843753C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437548
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437554
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437560
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843756C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437578
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437584
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437590
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843759C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84375A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84375B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84375C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84375CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84375D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84375E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84375F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84375FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437608
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8437614
	voice_directsound 60, 0, DirectSoundWaveData_8483804, 255, 253, 0, 149

@ SquareWave1 8437620
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843762C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437638
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437644
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437650
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843765C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437668
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437674
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437680
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843768C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437698
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84376A4
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 216, 0, 165

@ Direct Sound 84376B0
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 246, 0, 235

@ SquareWave1 84376BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84376C8
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 84376D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84376E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84376EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84376F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437704
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437710
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843771C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437728
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437734
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437740
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843774C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8437758
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8437764
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437770
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843777C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437788
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437794
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84377A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84377AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84377B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84377C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84377D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84377DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84377E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 84377F4
	voice_programmable_wave ProgrammableWaveData_84553BC, 0, 7, 15, 0

@ SquareWave1 8437800
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843780C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437818
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437824
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437830
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843783C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8437848
	voice_square_2_alt 2, 0, 2, 4, 1

@ SquareWave1 8437854
	voice_square_1_alt 0, 2, 0, 2, 4, 1

@ SquareWave1 8437860
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843786C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437878
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437884
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437890
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843789C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84378A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84378B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84378C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84378CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84378D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84378E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84378F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84378FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437908
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437914
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437920
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843792C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437938
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437944
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437950
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843795C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437968
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437974
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437980
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843798C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437998
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84379A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84379B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84379BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84379C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84379D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84379E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84379EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84379F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437A04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437A10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437A1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437A28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437A34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437A40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437A4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437A58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437A64
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8437A70
	voice_noise_alt 0, 0, 4, 1, 4

@ Noise 8437A7C
	voice_noise_alt 0, 0, 1, 0, 2

VoiceGroupTable_8437A88: @ 8437A88

@ Percussion 8437A88
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_8435FAC
	.4byte 0x00000000

@ SquareWave1 8437A94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437AA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437AAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8437AB8
	voice_square_2_alt 2, 0, 2, 4, 1

@ SquareWave1 8437AC4
	voice_square_1_alt 0, 2, 0, 2, 4, 1

@ SquareWave1 8437AD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437ADC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437AE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437AF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437B00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437B0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437B18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437B24
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8437B30
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 216, 90, 242

@ SquareWave1 8437B3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437B48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437B54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437B60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437B6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437B78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437B84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437B90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437B9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437BA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437BB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437BC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437BCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437BD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437BE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437BF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437BFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437C98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437CA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8437CB0
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 246, 0, 235

@ Direct Sound 8437CBC
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 8437CC8
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8437CD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437CE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437CEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437CF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437D04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437D10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437D1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437D28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437D34
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8437D40
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 8437D4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8437D58
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8437D64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437D70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437D7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437D88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437D94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437DA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437DAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437DB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437DC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437DD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437DDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437DE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437DF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437E00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437E0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437E18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437E24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437E30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437E3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8437E48
	voice_square_2_alt 0, 0, 1, 7, 1

@ WaveMemory 8437E54
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 2

@ SquareWave1 8437E60
	voice_square_1_alt 0, 0, 0, 1, 7, 1

@ SquareWave1 8437E6C
	voice_square_1_alt 0, 0, 0, 0, 7, 1

@ SquareWave1 8437E78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437E84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437E90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437E9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8437EA8
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 2

VoiceGroupTable_8437EB4: @ 8437EB4

@ Percussion 8437EB4
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8437EC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437ECC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437ED8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8437EE4
	voice_square_2 2, 0, 1, 4, 1

@ SquareWave1 8437EF0
	voice_square_1 0, 2, 0, 1, 4, 1

@ SquareWave1 8437EFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437F08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437F14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437F20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437F2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437F38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437F44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437F50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437F5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437F68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437F74
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8437F80
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 127

@ SquareWave1 8437F8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437F98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437FA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437FB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437FBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437FC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437FD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437FE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437FEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8437FF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438004
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438010
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843801C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438028
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438034
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438040
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843804C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438058
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438064
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438070
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843807C
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 8438088
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438094
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84380A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84380AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84380B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84380C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84380D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84380DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84380E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84380F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438100
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843810C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438118
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438124
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438130
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843813C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438148
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438154
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438160
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843816C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438178
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438184
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438190
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843819C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84381A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84381B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84381C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84381CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84381D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84381E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84381F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84381FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438208
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438214
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438220
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843822C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438238
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438244
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438250
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843825C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438268
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438274
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8438280
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 0

VoiceGroupTable_843828C: @ 843828C

@ Percussion 843828C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8438298
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84382A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84382B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84382BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84382C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84382D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84382E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84382EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84382F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438304
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438310
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843831C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438328
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438334
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438340
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843834C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8438358
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 165

@ SquareWave1 8438364
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438370
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843837C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438388
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438394
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84383A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84383AC
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 84383B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84383C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84383D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84383DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84383E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84383F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438400
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843840C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438418
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438424
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438430
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843843C
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 8438448
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438454
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438460
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843846C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438478
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438484
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438490
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843849C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84384A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84384B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84384C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84384CC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 84384D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84384E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84384F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84384FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438508
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438514
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438520
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843852C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8438538
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438544
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438550
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843855C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8438568
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438574
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438580
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843858C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438598
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84385A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84385B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84385BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84385C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84385D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84385E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84385EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84385F8
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8438604
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438610
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843861C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438628
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438634
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438640
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843864C
	voice_square_1_alt 0, 2, 0, 2, 4, 0

@ SquareWave2 8438658
	voice_square_2_alt 1, 0, 2, 4, 0

@ SquareWave1 8438664
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8438670
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 843867C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438688
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438694
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84386A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84386AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84386B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84386C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84386D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84386DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84386E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84386F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438700
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843870C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438718
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438724
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438730
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843873C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438748
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438754
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438760
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843876C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438778
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438784
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438790
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843879C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84387A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84387B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84387C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84387CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84387D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84387E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84387F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84387FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438808
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438814
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438820
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843882C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438838
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438844
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438850
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843885C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438868
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8438874
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 8438880
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843888C: @ 843888C

@ Percussion 843888C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8438898
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84388A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84388B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84388BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84388C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84388D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84388E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84388EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84388F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438904
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438910
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843891C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438928
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438934
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438940
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843894C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8438958
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 165

@ SquareWave1 8438964
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438970
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843897C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438988
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438994
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84389A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84389AC
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 84389B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84389C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84389D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84389DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84389E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84389F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438A00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438A0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438A18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438A24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438A30
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8438A3C
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 8438A48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438A54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438A60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438A6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438A78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438A84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438A90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438A9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438AA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438AB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438AC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8438ACC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8438AD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438AE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438AF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438AFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438B08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438B14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438B20
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8438B2C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8438B38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438B44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438B50
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8438B5C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8438B68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438B74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438B80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438B8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438B98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438BA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438BB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438BBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438BC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438BD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438BE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438BEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8438BF8
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8438C04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438C10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438C1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438C28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438C34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438C40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438C4C
	voice_square_1_alt 0, 2, 0, 2, 4, 0

@ SquareWave2 8438C58
	voice_square_2_alt 1, 0, 2, 4, 0

@ SquareWave1 8438C64
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8438C70
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 8438C7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438C88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438C94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438CA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438CAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438CB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438CC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438CD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438CDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438CE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438CF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438D9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438DA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438DB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438DC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438DCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438DD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438DE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438DF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438DFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438E08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438E14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438E20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438E2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438E38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438E44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438E50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438E5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438E68
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8438E74
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 8438E80
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_8438E8C: @ 8438E8C

@ Percussion 8438E8C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8438E98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438EA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438EB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438EBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438EC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438ED4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438EE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438EEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438EF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438F04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438F10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438F1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438F28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438F34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438F40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438F4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8438F58
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 165

@ SquareWave1 8438F64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438F70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438F7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438F88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438F94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438FA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8438FAC
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8438FB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438FC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438FD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438FDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438FE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8438FF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439000
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843900C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439018
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439024
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439030
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843903C
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 8439048
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439054
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439060
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843906C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439078
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439084
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439090
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843909C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84390A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84390B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84390C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84390CC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 84390D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84390E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84390F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84390FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439108
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439114
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439120
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843912C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8439138
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439144
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439150
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843915C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8439168
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439174
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439180
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843918C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439198
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84391A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84391B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84391BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84391C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84391D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84391E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84391EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84391F8
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8439204
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439210
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843921C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439228
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439234
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439240
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843924C
	voice_square_1_alt 0, 2, 0, 2, 4, 0

@ SquareWave2 8439258
	voice_square_2_alt 1, 0, 2, 4, 0

@ SquareWave1 8439264
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8439270
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 843927C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439288
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439294
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84392A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84392AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84392B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84392C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84392D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84392DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84392E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84392F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439300
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843930C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439318
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439324
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439330
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843933C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439348
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439354
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439360
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843936C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439378
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439384
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439390
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843939C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84393A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84393B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84393C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84393CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84393D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84393E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84393F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84393FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439408
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439414
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439420
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843942C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439438
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439444
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439450
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843945C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439468
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8439474
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 8439480
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843948C: @ 843948C

@ Percussion 843948C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8439498
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84394A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84394B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84394BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84394C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84394D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84394E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84394EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84394F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439504
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439510
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843951C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439528
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439534
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439540
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843954C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8439558
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 165

@ SquareWave1 8439564
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439570
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843957C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439588
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439594
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84395A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84395AC
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 84395B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84395C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84395D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84395DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84395E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84395F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439600
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843960C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439618
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439624
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439630
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843963C
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 8439648
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439654
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439660
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843966C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439678
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439684
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439690
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843969C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84396A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84396B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84396C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84396CC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 84396D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84396E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84396F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84396FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439708
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439714
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439720
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843972C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8439738
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439744
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439750
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843975C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8439768
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439774
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439780
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843978C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439798
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84397A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84397B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84397BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84397C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84397D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84397E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84397EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84397F8
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8439804
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439810
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843981C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439828
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439834
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439840
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843984C
	voice_square_1_alt 0, 2, 0, 2, 4, 0

@ SquareWave2 8439858
	voice_square_2_alt 1, 0, 2, 4, 0

@ SquareWave1 8439864
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8439870
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 843987C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439888
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439894
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84398A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84398AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84398B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84398C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84398D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84398DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84398E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84398F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439900
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843990C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439918
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439924
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439930
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843993C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439948
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439954
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439960
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843996C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439978
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439984
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439990
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843999C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84399A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84399B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84399C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84399CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84399D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84399E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84399F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84399FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439A08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439A14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439A20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439A2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439A38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439A44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439A50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439A5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439A68
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8439A74
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 8439A80
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_8439A8C: @ 8439A8C

@ SquareWave1 8439A8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8439A98
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8439AA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439AB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439ABC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439AC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439AD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439AE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439AEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439AF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439B94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439BA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439BAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439BB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439BC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439BD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439BDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439BE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439BF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439C00
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8439C0C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 149

@ SquareWave1 8439C18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439C24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439C30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439C3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439C48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439C54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439C60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439C6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439C78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439C84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439C90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439C9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439CA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439CB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439CC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8439CCC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8439CD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439CE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439CF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439CFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439D08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439D14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439D20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439D2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439D38
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8439D44
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 8439D50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439D5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439D68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439D74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439D80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439D8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439D98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439DA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439DB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439DBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439DC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439DD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439DE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439DEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8439DF8
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 8439E04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439E10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439E1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439E28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439E34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439E40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8439E4C
	voice_square_2_alt 1, 0, 2, 4, 0

VoiceGroupTable_8439E58: @ 8439E58

@ Key-Split 8439E58
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8439E64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439E70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439E7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439E88
	voice_square_1_alt 0, 2, 0, 5, 1, 7

@ SquareWave2 8439E94
	voice_square_2_alt 3, 0, 4, 3, 6

@ SquareWave2 8439EA0
	voice_square_2_alt 2, 1, 1, 4, 0

@ SquareWave1 8439EAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439EB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439EC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439ED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439EDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439EE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439EF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439F9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439FA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439FB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439FC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439FCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439FD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439FE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8439FF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8439FFC
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 224

@ SquareWave1 843A008
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A014
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A020
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A02C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A038
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A044
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A050
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A05C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A068
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843A074
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ SquareWave1 843A080
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A08C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843A098
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843A0A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A0B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A0BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A0C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A0D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A0E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A0EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A0F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A104
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A110
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A11C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A128
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A134
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A140
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A14C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A158
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A164
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A170
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A17C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A188
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A194
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A1A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A1AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A1B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843A1C4
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 843A1D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A1DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A1E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A1F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A200
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A20C
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 843A218
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 1

VoiceGroupTable_843A224: @ 843A224

@ Percussion 843A224
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 843A230
	voice_square_1_alt 0, 1, 0, 2, 0, 1

@ SquareWave1 843A23C
	voice_square_1_alt 0, 3, 1, 2, 6, 0

@ SquareWave2 843A248
	voice_square_2_alt 3, 1, 2, 6, 0

@ WaveMemory 843A254
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 15, 1

@ SquareWave1 843A260
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843A26C
	voice_square_2_alt 1, 0, 2, 0, 1

@ WaveMemory 843A278
	voice_programmable_wave_alt ProgrammableWaveData_84553EC, 1, 7, 15, 1

@ SquareWave1 843A284
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A290
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843A29C
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 843A2A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A2B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A2C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A2CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A2D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A2E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843A2F0
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 843A2FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A308
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A314
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A320
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A32C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A338
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A344
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A350
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A35C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A368
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A374
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A380
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A38C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A398
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A3A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A3B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A3BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A3C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A3D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A3E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843A3EC
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 216

@ SquareWave1 843A3F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A404
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A410
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A41C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A428
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A434
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A440
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A44C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A458
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843A464
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843A470
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A47C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A488
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A494
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A4A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A4AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A4B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A4C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A4D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A4DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A4E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A4F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A500
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A50C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A518
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A524
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A530
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A53C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A548
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A554
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A560
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A56C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A578
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A584
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843A590
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 843A59C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A5A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A5B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A5C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A5CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A5D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A5E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A5F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A5FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A608
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A614
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A620
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A62C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A638
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A644
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A650
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A65C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A668
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A674
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A680
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A68C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A698
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A6A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A6B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A6BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A6C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A6D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A6E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A6EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A6F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A704
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A710
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A71C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A728
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A734
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A740
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A74C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A758
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A764
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A770
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A77C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A788
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A794
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A7A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A7AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A7B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A7C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A7D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A7DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A7E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A7F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A800
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A80C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843A818
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843A824: @ 843A824

@ Key-Split 843A824
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ WaveMemory 843A830
	voice_programmable_wave_alt ProgrammableWaveData_845542C, 0, 1, 12, 0

@ SquareWave1 843A83C
	voice_square_1_alt 0, 0, 1, 1, 9, 0

@ SquareWave2 843A848
	voice_square_2_alt 2, 0, 2, 6, 3

@ WaveMemory 843A854
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 1

@ Direct Sound 843A860
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 216

@ SquareWave2 843A86C
	voice_square_2_alt 1, 0, 2, 6, 3

@ SquareWave1 843A878
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A884
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A890
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A89C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A8A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A8B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A8C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A8CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A8D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A8E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A8F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A8FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A908
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A914
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A920
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A92C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A938
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A944
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A950
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A95C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A968
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A974
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A980
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A98C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A998
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A9A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A9B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A9BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A9C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A9D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A9E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A9EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843A9F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AA04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AA10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AA1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AA28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AA34
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843AA40
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 165

@ SquareWave1 843AA4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AA58
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843AA64
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843AA70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AA7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AA88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AA94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AAA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AAAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AAB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AAC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AAD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AADC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AAE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AAF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AB00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AB0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AB18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AB24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AB30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AB3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AB48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AB54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AB60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AB6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AB78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AB84
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843AB90
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 843AB9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ABA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ABB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ABC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ABCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ABD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ABE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ABF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ABFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AC98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ACA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ACB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ACBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ACC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ACD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ACE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ACEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ACF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AD94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ADA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ADAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ADB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ADC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ADD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ADDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ADE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ADF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AE00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AE0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843AE18
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843AE24: @ 843AE24

@ Percussion 843AE24
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 843AE30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AE3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AE48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AE54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AE60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AE6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AE78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AE84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AE90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AE9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AEA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AEB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AEC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AECC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AED8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AEE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AEF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AEFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AF98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AFA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AFB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AFBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AFC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AFD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843AFE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843AFEC
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 843AFF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B004
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B010
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B01C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B028
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B034
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B040
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843B04C
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 204

@ Direct Sound 843B058
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 204, 193, 239

@ Key-Split 843B064
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843B070
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B07C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B088
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B094
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B0A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B0AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B0B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843B0C4
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 843B0D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843B0DC
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 843B0E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843B0F4
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 843B100
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B10C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B118
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B124
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B130
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B13C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B148
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B154
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B160
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B16C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B178
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B184
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B190
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B19C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B1A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B1B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B1C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B1CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B1D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843B1E4
	voice_square_2_alt 2, 0, 1, 6, 2

@ WaveMemory 843B1F0
	voice_programmable_wave_alt ProgrammableWaveData_845544C, 0, 7, 15, 0

@ SquareWave2 843B1FC
	voice_square_2_alt 3, 0, 1, 4, 1

@ WaveMemory 843B208
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 1, 7, 15, 2

@ SquareWave2 843B214
	voice_square_2_alt 1, 1, 1, 4, 1

@ SquareWave1 843B220
	voice_square_1_alt 0, 1, 1, 2, 4, 1

@ SquareWave1 843B22C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843B238
	voice_square_2_alt 2, 0, 1, 6, 1

@ SquareWave1 843B244
	voice_square_1_alt 0, 2, 0, 1, 6, 1

@ SquareWave1 843B250
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B25C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B268
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B274
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B280
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B28C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B298
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B2A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B2B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B2BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B2C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B2D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B2E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B2EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B2F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B304
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B310
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B31C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B328
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B334
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B340
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B34C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B358
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B364
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B370
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B37C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B388
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B394
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B3A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B3AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B3B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B3C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B3D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B3DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B3E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B3F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B400
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B40C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843B418
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843B424: @ 843B424

@ Percussion 843B424
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 843B430
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B43C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B448
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B454
	voice_square_1_alt 0, 2, 0, 7, 3, 3

@ SquareWave1 843B460
	voice_square_1_alt 0, 2, 0, 1, 4, 1

@ SquareWave1 843B46C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B478
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B484
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843B490
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 255, 204, 51, 242

@ SquareWave1 843B49C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B4A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B4B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B4C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B4CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B4D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B4E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B4F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B4FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B508
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B514
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B520
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B52C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B538
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B544
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B550
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B55C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B568
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B574
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B580
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B58C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B598
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B5A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B5B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B5BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B5C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B5D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B5E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B5EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B5F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B604
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B610
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B61C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B628
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B634
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B640
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843B64C
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 242

@ Direct Sound 843B658
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 193, 239

@ Key-Split 843B664
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843B670
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B67C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B688
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B694
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B6A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B6AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B6B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843B6C4
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 843B6D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843B6DC
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 843B6E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843B6F4
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 843B700
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B70C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B718
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B724
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B730
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B73C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B748
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B754
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B760
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B76C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B778
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B784
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 843B790
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ SquareWave1 843B79C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B7A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B7B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B7C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B7CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B7D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843B7E4
	voice_square_2_alt 3, 0, 4, 4, 0

@ SquareWave1 843B7F0
	voice_square_1_alt 0, 3, 0, 3, 6, 0

@ SquareWave1 843B7FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B808
	voice_square_1_alt 0, 0, 0, 3, 3, 0

@ WaveMemory 843B814
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 12, 1

@ SquareWave2 843B820
	voice_square_2_alt 1, 0, 1, 4, 3

@ SquareWave1 843B82C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843B838
	voice_square_2_alt 0, 0, 2, 4, 0

VoiceGroupTable_843B844: @ 843B844

@ Percussion 843B844
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 843B850
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 843B85C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B868
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B874
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B880
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B88C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B898
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B8A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843B8B0
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 255, 165, 51, 242

@ SquareWave1 843B8BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B8C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B8D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B8E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B8EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B8F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B904
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B910
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B91C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B928
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B934
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B940
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B94C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B958
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B964
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B970
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B97C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B988
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B994
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B9A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B9AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B9B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B9C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B9D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843B9DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843B9E8
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 843B9F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BA00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BA0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BA18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BA24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BA30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BA3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BA48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BA54
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843BA60
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ Direct Sound 843BA6C
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 242

@ Direct Sound 843BA78
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 193, 226

@ Key-Split 843BA84
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843BA90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BA9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BAA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BAB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BAC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BACC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BAD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843BAE4
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 843BAF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BAFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BB08
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843BB14
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 843BB20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BB2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BB38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BB44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BB50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BB5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BB68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BB74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BB80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BB8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BB98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BBA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843BBB0
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 843BBBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BBC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BBD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BBE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BBEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BBF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BC04
	voice_square_1_alt 0, 2, 0, 2, 4, 1

@ SquareWave2 843BC10
	voice_square_2_alt 1, 1, 3, 4, 2

@ SquareWave1 843BC1C
	voice_square_1_alt 0, 3, 0, 1, 4, 1

@ WaveMemory 843BC28
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 1, 7, 15, 0

@ SquareWave2 843BC34
	voice_square_2_alt 2, 0, 2, 4, 2

@ SquareWave2 843BC40
	voice_square_2_alt 1, 1, 3, 4, 2

@ SquareWave1 843BC4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BC58
	voice_square_1_alt 0, 2, 1, 4, 4, 2

@ SquareWave1 843BC64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BC70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BC7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BC88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BC94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BCA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BCAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BCB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BCC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BCD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BCDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BCE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BCF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BD9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BDA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BDB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BDC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BDCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BDD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BDE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BDF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BDFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BE08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BE14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BE20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BE2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843BE38
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843BE44: @ 843BE44

@ Percussion 843BE44
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 843BE50
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 843BE5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BE68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BE74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BE80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BE8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BE98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BEA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BEB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BEBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BEC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BED4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BEE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BEEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BEF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BF04
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843BF10
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 843BF1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BF28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BF34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BF40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BF4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BF58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BF64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BF70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BF7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BF88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BF94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BFA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BFAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BFB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BFC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BFD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843BFDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843BFE8
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 843BFF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C000
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C00C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C018
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C024
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C030
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C03C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C048
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C054
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C060
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843C06C
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 242

@ SquareWave1 843C078
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C084
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C090
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C09C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C0A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C0B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C0C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C0CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C0D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C0E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C0F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C0FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C108
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C114
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C120
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C12C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C138
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C144
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C150
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C15C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C168
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C174
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C180
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C18C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C198
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C1A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C1B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C1BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C1C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C1D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C1E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C1EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C1F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843C204
	voice_square_2_alt 3, 0, 1, 4, 1

@ SquareWave1 843C210
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C21C
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 843C228
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 1

@ SquareWave1 843C234
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C240
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C24C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C258
	voice_square_1_alt 0, 1, 0, 2, 4, 1

@ SquareWave1 843C264
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C270
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C27C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C288
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C294
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C2A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C2AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C2B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C2C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C2D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C2DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C2E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C2F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C300
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C30C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C318
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C324
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C330
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C33C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C348
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C354
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C360
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C36C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C378
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C384
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C390
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C39C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C3A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C3B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C3C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C3CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C3D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C3E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C3F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C3FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C408
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C414
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C420
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C42C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843C438
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843C444: @ 843C444

@ Percussion 843C444
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 843C450
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 843C45C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C468
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843C474
	voice_square_2_alt 2, 1, 4, 4, 2

@ SquareWave1 843C480
	voice_square_1_alt 0, 2, 0, 3, 4, 1

@ SquareWave2 843C48C
	voice_square_2_alt 2, 1, 3, 4, 2

@ SquareWave1 843C498
	voice_square_1_alt 0, 2, 0, 3, 4, 1

@ SquareWave1 843C4A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C4B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C4BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C4C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C4D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C4E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C4EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C4F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C504
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C510
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C51C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C528
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C534
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C540
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C54C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C558
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C564
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C570
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C57C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C588
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C594
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C5A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C5AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C5B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C5C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C5D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C5DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843C5E8
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 843C5F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C600
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C60C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C618
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C624
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C630
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C63C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C648
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C654
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843C660
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 99

@ SquareWave1 843C66C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C678
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843C684
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843C690
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C69C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C6A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C6B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C6C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C6CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C6D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C6E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C6F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C6FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C708
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C714
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C720
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C72C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C738
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C744
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C750
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C75C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C768
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C774
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C780
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C78C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C798
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C7A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843C7B0
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

VoiceGroupTable_843C7BC: @ 843C7BC

@ Percussion 843C7BC
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 843C7C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C7D4
	voice_square_1 0, 3, 1, 2, 6, 0

@ SquareWave2 843C7E0
	voice_square_2 3, 1, 2, 6, 0

@ SquareWave1 843C7EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C7F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C804
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C810
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C81C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C828
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C834
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C840
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C84C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C858
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C864
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C870
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C87C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C888
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C894
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C8A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C8AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C8B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C8C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C8D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C8DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C8E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C8F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C900
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C90C
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 843C918
	voice_programmable_wave_alt ProgrammableWaveData_84553EC, 0, 7, 15, 0

@ SquareWave1 843C924
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C930
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C93C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C948
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C954
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C960
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C96C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C978
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C984
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C990
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C99C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C9A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C9B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C9C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C9CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C9D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843C9E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843C9F0
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 193, 226

@ Key-Split 843C9FC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843CA08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CA14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CA20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CA2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CA38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CA44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CA50
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843CA5C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 843CA68
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843CA74
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 843CA80
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843CA8C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 843CA98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CAA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CAB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CABC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CAC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CAD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CAE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CAEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CAF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CB04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CB10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CB1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CB28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CB34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CB40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CB4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CB58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CB64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CB70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843CB7C
	voice_square_2_alt 1, 0, 1, 6, 1

@ SquareWave1 843CB88
	voice_square_1_alt 0, 0, 0, 1, 7, 1

@ WaveMemory 843CB94
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 1

@ SquareWave2 843CBA0
	voice_square_2_alt 0, 0, 1, 4, 2

@ WaveMemory 843CBAC
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 1

@ SquareWave1 843CBB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CBC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CBD0
	voice_square_1_alt 0, 1, 0, 7, 6, 1

@ SquareWave2 843CBDC
	voice_square_2_alt 2, 0, 1, 6, 1

@ SquareWave1 843CBE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CBF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CC9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CCA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CCB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CCC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CCCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CCD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CCE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CCF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CCFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CD08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CD14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CD20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CD2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CD38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CD44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CD50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CD5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CD68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CD74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CD80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CD8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843CD98
	voice_noise_alt 0, 0, 1, 9, 4

@ Noise 843CDA4
	voice_noise_alt 0, 3, 1, 10, 0

@ Noise 843CDB0
	voice_noise_alt 0, 0, 2, 0, 0

VoiceGroupTable_843CDBC: @ 843CDBC

@ Percussion 843CDBC
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 843CDC8
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 843CDD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CDE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CDEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CDF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CE94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CEA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CEAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CEB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CEC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CEDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CEE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CEF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CF00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CF0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CF18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CF24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CF30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CF3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CF48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CF54
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843CF60
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 843CF6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CF78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CF84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CF90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CF9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CFA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CFB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CFC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CFCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843CFD8
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ SquareWave1 843CFE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843CFF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843CFFC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843D008
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D014
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D020
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D02C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D038
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D044
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D050
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D05C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D068
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D074
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D080
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D08C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D098
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D0A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D0B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D0BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D0C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D0D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D0E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D0EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D0F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D104
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D110
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D11C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843D128
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 843D134
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D140
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D14C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D158
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D164
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D170
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843D17C
	voice_square_2_alt 2, 0, 1, 4, 2

@ SquareWave1 843D188
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D194
	voice_square_1_alt 0, 3, 0, 1, 4, 1

@ WaveMemory 843D1A0
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 12, 0

@ SquareWave1 843D1AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D1B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D1C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D1D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D1DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D1E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D1F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D200
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D20C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D218
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D224
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D230
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D23C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D248
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D254
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D260
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D26C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D278
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D284
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D290
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D29C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D2A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D2B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D2C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D2CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D2D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D2E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D2F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D2FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D308
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D314
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D320
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D32C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D338
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D344
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D350
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D35C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D368
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D374
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D380
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D38C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D398
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D3A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843D3B0
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843D3BC: @ 843D3BC

@ Percussion 843D3BC
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 843D3C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D3D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D3E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D3EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D3F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D404
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D410
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D41C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D428
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D434
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D440
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D44C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D458
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D464
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D470
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D47C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D488
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D494
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D4A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D4AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D4B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D4C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D4D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D4DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D4E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D4F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D500
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D50C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D518
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D524
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D530
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D53C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D548
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D554
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D560
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D56C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D578
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D584
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D590
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D59C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D5A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D5B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D5C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D5CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843D5D8
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ Direct Sound 843D5E4
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 242

@ SquareWave1 843D5F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843D5FC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843D608
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D614
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D620
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D62C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D638
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D644
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D650
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D65C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D668
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843D674
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 843D680
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843D68C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 843D698
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D6A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D6B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D6BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D6C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D6D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D6E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D6EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D6F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D704
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D710
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D71C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843D728
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 843D734
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D740
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D74C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D758
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D764
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D770
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843D77C
	voice_square_2_alt 2, 0, 1, 5, 2

@ SquareWave1 843D788
	voice_square_1_alt 0, 3, 0, 1, 4, 1

@ WaveMemory 843D794
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 15, 0

@ SquareWave1 843D7A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D7AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D7B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D7C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D7D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D7DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D7E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D7F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D800
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D80C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D818
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D824
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D830
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D83C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D848
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D854
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D860
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D86C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D878
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D884
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D890
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D89C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D8A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D8B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D8C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D8CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D8D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D8E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D8F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D8FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D908
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D914
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D920
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D92C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D938
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D944
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D950
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D95C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D968
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D974
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D980
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D98C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D998
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D9A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843D9B0
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843D9BC: @ 843D9BC

@ Percussion 843D9BC
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 843D9C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D9D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D9E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D9EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843D9F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DA94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DAA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DAAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DAB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DAC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DAD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DADC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DAE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DAF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DB00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DB0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DB18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DB24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DB30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DB3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DB48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DB54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DB60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DB6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DB78
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843DB84
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 843DB90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DB9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DBA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DBB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DBC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DBCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DBD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843DBE4
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 204

@ Direct Sound 843DBF0
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 204, 193, 239

@ Key-Split 843DBFC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843DC08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DC14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DC20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DC2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DC38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DC44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DC50
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843DC5C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 843DC68
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843DC74
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 843DC80
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843DC8C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 843DC98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DCA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DCB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DCBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DCC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DCD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DCE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DCEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DCF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DD04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DD10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DD1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DD28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DD34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DD40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DD4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DD58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DD64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DD70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843DD7C
	voice_square_2_alt 2, 0, 1, 4, 1

@ SquareWave1 843DD88
	voice_square_1_alt 0, 3, 0, 1, 6, 0

@ WaveMemory 843DD94
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ WaveMemory 843DDA0
	voice_programmable_wave_alt ProgrammableWaveData_84553EC, 0, 7, 15, 2

@ SquareWave2 843DDAC
	voice_square_2_alt 1, 1, 1, 4, 1

@ SquareWave1 843DDB8
	voice_square_1_alt 0, 1, 0, 1, 4, 2

@ SquareWave1 843DDC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843DDD0
	voice_square_2_alt 2, 0, 1, 6, 1

@ SquareWave1 843DDDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DDE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DDF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DE9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DEA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DEB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DEC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DECC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DED8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DEE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DEF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DEFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DF98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DFA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843DFB0
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843DFBC: @ 843DFBC

@ Percussion 843DFBC
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 843DFC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DFD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DFE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DFEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843DFF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E004
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E010
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E01C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E028
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E034
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E040
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E04C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E058
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E064
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E070
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E07C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E088
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E094
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E0A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E0AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E0B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E0C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E0D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E0DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E0E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E0F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E100
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E10C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E118
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E124
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E130
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E13C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E148
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E154
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E160
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E16C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E178
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843E184
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 843E190
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E19C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E1A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E1B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E1C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E1CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E1D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E1E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E1F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843E1FC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843E208
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E214
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E220
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E22C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E238
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E244
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E250
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E25C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E268
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E274
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E280
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843E28C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 843E298
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E2A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E2B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E2BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E2C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E2D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E2E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E2EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E2F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E304
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E310
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E31C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843E328
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 843E334
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E340
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E34C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E358
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E364
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E370
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843E37C
	voice_square_2_alt 0, 0, 1, 4, 1

@ SquareWave1 843E388
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E394
	voice_square_1_alt 0, 0, 0, 1, 4, 1

@ SquareWave1 843E3A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E3AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E3B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E3C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 843E3D0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 1

@ SquareWave1 843E3DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E3E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E3F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E400
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E40C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E418
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E424
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E430
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E43C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E448
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E454
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E460
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E46C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E478
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E484
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E490
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E49C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E4A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E4B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E4C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E4CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E4D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E4E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E4F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E4FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E508
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E514
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E520
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E52C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E538
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E544
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E550
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E55C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E568
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E574
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E580
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E58C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E598
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E5A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843E5B0
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843E5BC: @ 843E5BC

@ Percussion 843E5BC
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 843E5C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E5D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E5E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E5EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E5F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E604
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E610
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E61C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843E628
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 255, 188, 51, 242

@ SquareWave1 843E634
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E640
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E64C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E658
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843E664
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 128, 165, 90, 216

@ SquareWave1 843E670
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E67C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E688
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E694
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E6A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E6AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E6B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E6C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843E6D0
	voice_directsound 60, 0, DirectSoundWaveData_8492D10, 255, 0, 255, 127

@ SquareWave1 843E6DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E6E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E6F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E700
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E70C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E718
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E724
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E730
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E73C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E748
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E754
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843E760
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 843E76C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E778
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E784
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E790
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E79C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E7A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E7B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E7C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E7CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843E7D8
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ Direct Sound 843E7E4
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 242

@ Direct Sound 843E7F0
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 193, 226

@ Key-Split 843E7FC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843E808
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E814
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E820
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E82C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E838
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E844
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E850
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E85C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E868
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E874
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E880
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E88C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E898
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E8A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E8B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E8BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E8C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E8D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E8E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E8EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E8F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E904
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E910
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E91C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843E928
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 843E934
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E940
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E94C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E958
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E964
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E970
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E97C
	voice_square_1_alt 0, 2, 0, 1, 4, 1

@ SquareWave1 843E988
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 843E994
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 1, 4, 10, 1

@ SquareWave1 843E9A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E9AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E9B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E9C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E9D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E9DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E9E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843E9F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EA00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843EA0C
	voice_square_2_alt 2, 1, 5, 9, 1

@ SquareWave1 843EA18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EA24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EA30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EA3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EA48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EA54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EA60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EA6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EA78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EA84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EA90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EA9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EAA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EAB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EAC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EACC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EAD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EAE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EAF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EAFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EB98
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843EBA4
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 843EBB0
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843EBBC: @ 843EBBC

@ Percussion 843EBBC
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 843EBC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EBD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EBE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EBEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EBF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EC04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EC10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EC1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EC28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EC34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EC40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EC4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EC58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EC64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EC70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EC7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843EC88
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 843EC94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ECA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ECAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ECB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ECC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ECD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ECDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ECE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ECF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ED00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ED0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ED18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ED24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ED30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ED3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ED48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ED54
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843ED60
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 843ED6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ED78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ED84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ED90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843ED9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EDA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EDB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EDC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EDCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EDD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EDE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EDF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EDFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EE08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EE14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EE20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EE2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EE38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EE44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EE50
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843EE5C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 843EE68
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843EE74
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 843EE80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EE8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EE98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EEA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EEB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EEBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EEC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EED4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EEE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EEEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EEF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EF04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EF10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EF1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EF28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EF34
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 843EF40
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ SquareWave1 843EF4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EF58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EF64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EF70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EF7C
	voice_square_1_alt 0, 2, 0, 1, 4, 1

@ SquareWave2 843EF88
	voice_square_2_alt 2, 0, 1, 4, 1

@ SquareWave2 843EF94
	voice_square_2_alt 0, 0, 1, 4, 1

@ SquareWave1 843EFA0
	voice_square_1_alt 0, 0, 0, 1, 4, 1

@ SquareWave1 843EFAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EFB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EFC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EFD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EFDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EFE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843EFF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F000
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F00C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F018
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F024
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F030
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F03C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F048
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F054
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F060
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F06C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F078
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F084
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F090
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F09C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F0A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F0B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F0C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F0CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F0D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F0E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F0F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F0FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F108
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F114
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F120
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F12C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F138
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F144
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F150
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F15C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F168
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F174
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F180
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F18C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F198
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843F1A4
	voice_noise_alt 0, 0, 2, 4, 0

@ Noise 843F1B0
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843F1BC: @ 843F1BC

@ Percussion 843F1BC
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 843F1C8
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 843F1D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F1E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843F1EC
	voice_square_2_alt 1, 1, 1, 6, 2

@ WaveMemory 843F1F8
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 15, 0

@ WaveMemory 843F204
	voice_programmable_wave_alt ProgrammableWaveData_84553FC, 0, 7, 15, 0

@ SquareWave1 843F210
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F21C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843F228
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 255, 165, 51, 242

@ SquareWave1 843F234
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F240
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F24C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F258
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843F264
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 843F270
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F27C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F288
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F294
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F2A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F2AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F2B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F2C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F2D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F2DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F2E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F2F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F300
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F30C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F318
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F324
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F330
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F33C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F348
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F354
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F360
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F36C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F378
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F384
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F390
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F39C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F3A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F3B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F3C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F3CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F3D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843F3E4
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ Direct Sound 843F3F0
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 239

@ Key-Split 843F3FC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843F408
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F414
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F420
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F42C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F438
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F444
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F450
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843F45C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 843F468
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843F474
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 843F480
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843F48C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 843F498
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F4A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F4B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F4BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F4C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F4D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F4E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F4EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F4F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F504
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F510
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F51C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843F528
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 843F534
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F540
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F54C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F558
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F564
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F570
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F57C
	voice_square_1_alt 0, 2, 0, 1, 6, 2

@ SquareWave2 843F588
	voice_square_2_alt 2, 0, 1, 6, 0

@ WaveMemory 843F594
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ SquareWave1 843F5A0
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave1 843F5AC
	voice_square_1_alt 0, 1, 1, 2, 4, 0

@ SquareWave1 843F5B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F5C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 843F5D0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave2 843F5DC
	voice_square_2_alt 3, 0, 1, 6, 2

VoiceGroupTable_843F5E8: @ 843F5E8

@ Percussion 843F5E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 843F5F4
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 843F600
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F60C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F618
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F624
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F630
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F63C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F648
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F654
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F660
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F66C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F678
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843F684
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 843F690
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F69C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F6A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F6B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F6C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F6CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F6D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F6E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F6F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F6FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F708
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F714
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F720
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F72C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F738
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F744
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F750
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F75C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F768
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F774
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F780
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F78C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F798
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F7A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F7B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F7BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F7C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F7D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F7E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F7EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F7F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843F804
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 128, 226, 0, 38

@ Direct Sound 843F810
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ Direct Sound 843F81C
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ Key-Split 843F828
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 843F834
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F840
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F84C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F858
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F864
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F870
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F87C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843F888
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 843F894
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843F8A0
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 843F8AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843F8B8
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 843F8C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F8D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F8DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F8E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F8F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F900
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F90C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F918
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F924
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F930
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F93C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F948
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843F954
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 843F960
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F96C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F978
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F984
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F990
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843F99C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843F9A8
	voice_square_2_alt 1, 1, 1, 6, 1

@ SquareWave1 843F9B4
	voice_square_1_alt 0, 1, 0, 4, 4, 1

@ SquareWave1 843F9C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 843F9CC
	voice_square_2_alt 2, 0, 7, 3, 3

@ SquareWave1 843F9D8
	voice_square_1_alt 0, 2, 0, 7, 3, 3

@ SquareWave1 843F9E4
	voice_square_1_alt 0, 3, 2, 2, 7, 0

@ SquareWave2 843F9F0
	voice_square_2_alt 1, 1, 2, 3, 0

@ SquareWave1 843F9FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FA98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FAA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FAB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FABC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FAC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FAD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FAE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FAEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FAF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FB94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FBA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FBAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FBB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FBC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FBD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 843FBDC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_843FBE8: @ 843FBE8

@ Percussion 843FBE8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 843FBF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FC9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FCA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843FCB4
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 843FCC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FCCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FCD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FCE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FCF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FCFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FD08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FD14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FD20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FD2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FD38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FD44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FD50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FD5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FD68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FD74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FD80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FD8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843FD98
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 115

@ SquareWave1 843FDA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FDB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FDBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FDC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FDD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FDE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FDEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FDF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FE04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FE10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FE1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FE28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FE34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FE40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FE4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FE58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FE64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FE70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FE7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 843FE88
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 843FE94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FEA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FEAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FEB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FEC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FEDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FEE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FEF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FF00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FF0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FF18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FF24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FF30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FF3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FF48
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 843FF54
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 843FF60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FF6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FF78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FF84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FF90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FF9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FFA8
	voice_square_1_alt 0, 2, 0, 1, 4, 1

@ SquareWave2 843FFB4
	voice_square_2_alt 2, 0, 1, 4, 1

@ SquareWave2 843FFC0
	voice_square_2_alt 0, 0, 1, 4, 1

@ WaveMemory 843FFCC
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ WaveMemory 843FFD8
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 843FFE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FFF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 843FFFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440008
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440014
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440020
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844002C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440038
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440044
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440050
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844005C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440068
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440074
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440080
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844008C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440098
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84400A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84400B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84400BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84400C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84400D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84400E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84400EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84400F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440104
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440110
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844011C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440128
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440134
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440140
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844014C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440158
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440164
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440170
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844017C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440188
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440194
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84401A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84401AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84401B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84401C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84401D0
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 84401DC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84401E8: @ 84401E8

@ Percussion 84401E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84401F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440200
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844020C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440218
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440224
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440230
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844023C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440248
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440254
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440260
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844026C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440278
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440284
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440290
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844029C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84402A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84402B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84402C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84402CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84402D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84402E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84402F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84402FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440308
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440314
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440320
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844032C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440338
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8440344
	voice_programmable_wave_alt ProgrammableWaveData_845543C, 0, 7, 15, 0

@ SquareWave1 8440350
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844035C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440368
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440374
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440380
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844038C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440398
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84403A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84403B0
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 84403BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84403C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84403D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84403E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84403EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84403F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440404
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440410
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844041C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440428
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440434
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440440
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844044C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440458
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440464
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440470
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844047C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8440488
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8440494
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84404A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84404AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84404B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84404C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84404D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84404DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84404E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84404F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440500
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844050C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440518
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440524
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440530
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844053C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440548
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440554
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440560
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844056C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440578
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440584
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440590
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844059C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84405A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 84405B4
	voice_square_2_alt 0, 0, 1, 4, 1

@ SquareWave1 84405C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84405CC
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave1 84405D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84405E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84405F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84405FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440608
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440614
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440620
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844062C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440638
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440644
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440650
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844065C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440668
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440674
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440680
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844068C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440698
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84406A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84406B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84406BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84406C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84406D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84406E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84406EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84406F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440704
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440710
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844071C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440728
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440734
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440740
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844074C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440758
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440764
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440770
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844077C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440788
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440794
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84407A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84407AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84407B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84407C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84407D0
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 84407DC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84407E8: @ 84407E8

@ Percussion 84407E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84407F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440800
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844080C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440818
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440824
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440830
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844083C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440848
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440854
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440860
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844086C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440878
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440884
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440890
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844089C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84408A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84408B4
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 165

@ SquareWave1 84408C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84408CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84408D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84408E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84408F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84408FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440908
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440914
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440920
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844092C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440938
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440944
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440950
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844095C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440968
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440974
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440980
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844098C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8440998
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 84409A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84409B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84409BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84409C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84409D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84409E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84409EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84409F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440A04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440A10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440A1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440A28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440A34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440A40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440A4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440A58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440A64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440A70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440A7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8440A88
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8440A94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440AA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440AAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440AB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440AC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440AD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440ADC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440AE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440AF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440B9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440BA8
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave2 8440BB4
	voice_square_2_alt 1, 0, 1, 4, 1

@ SquareWave2 8440BC0
	voice_square_2_alt 0, 0, 1, 4, 1

@ WaveMemory 8440BCC
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ WaveMemory 8440BD8
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 8440BE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440BF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440BFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440C98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440CA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440CB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440CBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440CC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440CD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440CE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440CEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440CF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440D94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440DA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440DAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440DB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440DC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8440DD0
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 8440DDC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_8440DE8: @ 8440DE8

@ Percussion 8440DE8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8440DF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440E9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440EA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440EB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440EC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440ECC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440ED8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440EE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440EF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440EFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8440F08
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8440F14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440F20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440F2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440F38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440F44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440F50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440F5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440F68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440F74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440F80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440F8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440F98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440FA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440FB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440FBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440FC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440FD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440FE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440FEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8440FF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441004
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8441010
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ Direct Sound 844101C
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ Key-Split 8441028
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8441034
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441040
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844104C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441058
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441064
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441070
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844107C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441088
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441094
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84410A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84410AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84410B8
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 84410C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84410D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84410DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84410E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84410F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441100
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844110C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441118
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441124
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441130
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844113C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441148
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8441154
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8441160
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844116C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441178
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441184
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441190
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844119C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84411A8
	voice_square_1_alt 0, 0, 0, 1, 4, 1

@ SquareWave2 84411B4
	voice_square_2_alt 0, 0, 1, 4, 1

@ WaveMemory 84411C0
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 15, 0

@ SquareWave2 84411CC
	voice_square_2_alt 3, 0, 1, 4, 1

@ SquareWave1 84411D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84411E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84411F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84411FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441208
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441214
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441220
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844122C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441238
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441244
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441250
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844125C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441268
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441274
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441280
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844128C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441298
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84412A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84412B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84412BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84412C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84412D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84412E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84412EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84412F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441304
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441310
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844131C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441328
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441334
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441340
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844134C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441358
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441364
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441370
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844137C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441388
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441394
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84413A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84413AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84413B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84413C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84413D0
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 84413DC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84413E8: @ 84413E8

@ Percussion 84413E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 84413F4
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8441400
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844140C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441418
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441424
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441430
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844143C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441448
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441454
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441460
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844146C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441478
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441484
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441490
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844149C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84414A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84414B4
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 165

@ SquareWave1 84414C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84414CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84414D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84414E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84414F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84414FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441508
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441514
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441520
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844152C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441538
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441544
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441550
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844155C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441568
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441574
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441580
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844158C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8441598
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 84415A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84415B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84415BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84415C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84415D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84415E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84415EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84415F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441604
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441610
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844161C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441628
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441634
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441640
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844164C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441658
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441664
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441670
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844167C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8441688
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8441694
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84416A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84416AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84416B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84416C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84416D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84416DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84416E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84416F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441700
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844170C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441718
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441724
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441730
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844173C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441748
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441754
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441760
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844176C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441778
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441784
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441790
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844179C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84417A8
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave2 84417B4
	voice_square_2_alt 1, 0, 1, 4, 1

@ SquareWave2 84417C0
	voice_square_2_alt 0, 0, 1, 4, 1

@ WaveMemory 84417CC
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 0

@ WaveMemory 84417D8
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 84417E4
	voice_square_1_alt 0, 2, 0, 1, 4, 1

@ SquareWave2 84417F0
	voice_square_2_alt 2, 0, 1, 4, 1

@ WaveMemory 84417FC
	voice_programmable_wave_alt ProgrammableWaveData_845544C, 0, 7, 15, 0

@ SquareWave1 8441808
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441814
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441820
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844182C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441838
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441844
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441850
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844185C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441868
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441874
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441880
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844188C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441898
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84418A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84418B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84418BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84418C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84418D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84418E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84418EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84418F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441904
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441910
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844191C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441928
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441934
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441940
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844194C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441958
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441964
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441970
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844197C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441988
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441994
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84419A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84419AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84419B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84419C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84419D0
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 84419DC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84419E8: @ 84419E8

@ Percussion 84419E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84419F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441A9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441AA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441AB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441AC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441ACC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441AD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441AE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441AF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441AFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8441B08
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8441B14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441B20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441B2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441B38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441B44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441B50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441B5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441B68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441B74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441B80
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8441B8C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 8441B98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441BA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8441BB0
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 8441BBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441BC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441BD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441BE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441BEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441BF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8441C04
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ SquareWave1 8441C10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441C1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441C28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441C34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441C40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441C4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441C58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441C64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441C70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441C7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441C88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441C94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441CA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441CAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441CB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441CC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441CD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441CDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441CE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441CF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441D00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441D0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441D18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441D24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441D30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441D3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441D48
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8441D54
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8441D60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441D6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441D78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441D84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441D90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441D9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441DA8
	voice_square_1 0, 1, 0, 1, 4, 1

@ SquareWave2 8441DB4
	voice_square_2_alt 1, 0, 1, 4, 1

@ WaveMemory 8441DC0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 3

@ SquareWave2 8441DCC
	voice_square_2_alt 3, 0, 1, 4, 1

@ SquareWave1 8441DD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441DE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441DF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441DFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441E98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441EA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441EB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441EBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441EC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441ED4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441EE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441EEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441EF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441F94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441FA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441FAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441FB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8441FC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8441FD0
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 8441FDC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_8441FE8: @ 8441FE8

@ Percussion 8441FE8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 8441FF4
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8442000
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844200C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442018
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442024
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442030
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844203C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442048
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442054
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442060
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844206C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442078
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442084
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442090
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844209C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84420A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84420B4
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 84420C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84420CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84420D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84420E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84420F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84420FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8442108
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8442114
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442120
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844212C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442138
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442144
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442150
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844215C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442168
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442174
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442180
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844218C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442198
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84421A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84421B0
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 84421BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84421C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84421D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84421E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84421EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84421F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442204
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442210
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844221C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442228
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442234
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442240
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844224C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442258
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442264
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442270
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844227C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8442288
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8442294
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84422A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84422AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84422B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84422C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84422D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84422DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84422E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84422F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442300
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844230C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442318
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442324
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442330
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844233C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442348
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8442354
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8442360
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844236C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442378
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442384
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442390
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844239C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84423A8
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave2 84423B4
	voice_square_2_alt 1, 0, 1, 4, 1

@ SquareWave2 84423C0
	voice_square_2_alt 0, 0, 1, 4, 1

@ WaveMemory 84423CC
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ WaveMemory 84423D8
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 84423E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84423F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84423FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442408
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442414
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442420
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844242C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442438
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442444
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442450
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844245C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442468
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442474
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442480
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844248C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442498
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84424A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84424B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84424BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84424C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84424D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84424E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84424EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84424F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442504
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442510
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844251C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442528
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442534
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442540
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844254C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442558
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442564
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442570
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844257C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442588
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442594
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84425A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84425AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84425B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84425C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84425D0
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 84425DC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84425E8: @ 84425E8

@ Percussion 84425E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 84425F4
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8442600
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844260C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442618
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442624
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442630
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844263C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442648
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442654
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442660
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844266C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442678
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442684
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8442690
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 844269C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84426A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84426B4
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 84426C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84426CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84426D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84426E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84426F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84426FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8442708
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8442714
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442720
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844272C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442738
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442744
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442750
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844275C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442768
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442774
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442780
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844278C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 8442798
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84427A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84427B0
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 84427BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84427C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84427D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84427E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84427EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84427F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442804
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442810
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844281C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442828
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442834
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442840
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844284C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442858
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442864
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442870
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844287C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8442888
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8442894
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84428A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84428AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84428B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84428C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84428D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84428DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84428E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84428F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442900
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844290C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442918
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442924
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442930
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844293C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442948
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8442954
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8442960
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844296C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442978
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442984
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442990
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844299C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84429A8
	voice_square_1 0, 2, 0, 2, 3, 1

@ SquareWave2 84429B4
	voice_square_2_alt 2, 0, 2, 3, 1

@ SquareWave2 84429C0
	voice_square_2_alt 0, 0, 1, 4, 1

@ WaveMemory 84429CC
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ WaveMemory 84429D8
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 84429E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84429F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84429FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442A98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442AA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442AB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442ABC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442AC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442AD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442AE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442AEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442AF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442B94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442BA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442BAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442BB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442BC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8442BD0
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 8442BDC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_8442BE8: @ 8442BE8

@ Percussion 8442BE8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8442BF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442C9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442CA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8442CB4
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 8442CC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442CCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442CD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442CE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442CF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442CFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8442D08
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8442D14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442D20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442D2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442D38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442D44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442D50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442D5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442D68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442D74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442D80
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8442D8C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 8442D98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442DA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8442DB0
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 8442DBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442DC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442DD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442DE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442DEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442DF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8442E04
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ SquareWave1 8442E10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442E1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8442E28
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8442E34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442E40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442E4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442E58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442E64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442E70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442E7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442E88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442E94
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8442EA0
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 8442EAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442EB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442EC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442ED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442EDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442EE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442EF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442F00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442F0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442F18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442F24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442F30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442F3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442F48
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8442F54
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8442F60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442F6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442F78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442F84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442F90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442F9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442FA8
	voice_square_1_alt 0, 0, 0, 1, 4, 1

@ SquareWave2 8442FB4
	voice_square_2_alt 0, 0, 1, 4, 1

@ SquareWave1 8442FC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8442FCC
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 3

@ SquareWave1 8442FD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442FE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442FF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8442FFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443008
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443014
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443020
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844302C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443038
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443044
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443050
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844305C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443068
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443074
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443080
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844308C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443098
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84430A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84430B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84430BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84430C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84430D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84430E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84430EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84430F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443104
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443110
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844311C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443128
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443134
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443140
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844314C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443158
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443164
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443170
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844317C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443188
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443194
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84431A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84431AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84431B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84431C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84431D0
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 84431DC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84431E8: @ 84431E8

@ Percussion 84431E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84431F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443200
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844320C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443218
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443224
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443230
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844323C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443248
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443254
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443260
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844326C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443278
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443284
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443290
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844329C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84432A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84432B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84432C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84432CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84432D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84432E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84432F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84432FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8443308
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8443314
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443320
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844332C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443338
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443344
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443350
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844335C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443368
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443374
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443380
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844338C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 8443398
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84433A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84433B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84433BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84433C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84433D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84433E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84433EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84433F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443404
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8443410
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ Direct Sound 844341C
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ Key-Split 8443428
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8443434
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443440
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844344C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443458
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443464
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443470
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844347C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8443488
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8443494
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84434A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84434AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84434B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84434C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84434D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84434DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84434E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84434F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443500
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844350C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443518
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443524
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443530
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844353C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443548
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443554
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443560
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844356C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443578
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443584
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443590
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844359C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84435A8
	voice_square_1_alt 0, 0, 0, 1, 4, 1

@ SquareWave2 84435B4
	voice_square_2_alt 2, 0, 1, 4, 1

@ SquareWave2 84435C0
	voice_square_2_alt 0, 0, 1, 4, 1

@ WaveMemory 84435CC
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ SquareWave1 84435D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84435E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84435F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84435FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443608
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443614
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443620
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844362C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443638
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443644
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443650
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844365C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443668
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443674
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443680
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844368C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443698
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84436A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84436B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84436BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84436C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84436D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84436E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84436EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84436F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443704
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443710
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844371C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443728
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443734
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443740
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844374C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443758
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443764
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443770
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844377C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443788
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443794
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84437A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84437AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84437B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84437C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84437D0
	voice_noise_alt 0, 0, 2, 4, 0

@ Noise 84437DC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84437E8: @ 84437E8

@ Percussion 84437E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84437F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443800
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844380C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443818
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443824
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443830
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844383C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443848
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443854
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443860
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844386C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443878
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443884
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443890
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844389C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84438A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84438B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84438C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84438CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84438D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84438E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84438F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84438FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443908
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443914
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443920
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844392C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443938
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443944
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443950
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844395C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443968
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443974
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443980
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844398C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443998
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84439A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84439B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84439BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84439C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84439D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84439E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84439EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84439F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443A04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443A10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443A1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443A28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443A34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443A40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443A4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443A58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443A64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443A70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443A7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8443A88
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8443A94
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8443AA0
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 8443AAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8443AB8
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8443AC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443AD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443ADC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443AE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443AF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443B9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443BA8
	voice_square_1_alt 0, 0, 0, 1, 4, 1

@ SquareWave2 8443BB4
	voice_square_2_alt 0, 0, 1, 4, 1

@ SquareWave1 8443BC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8443BCC
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 2

@ SquareWave1 8443BD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443BE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443BF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443BFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443C98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443CA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443CB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443CBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443CC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443CD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443CE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443CEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443CF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443D94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443DA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443DAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443DB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443DC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443DD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8443DDC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_8443DE8: @ 8443DE8

@ Percussion 8443DE8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 8443DF4
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8443E00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443E0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443E18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443E24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443E30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443E3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443E48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443E54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443E60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443E6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443E78
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8443E84
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 8443E90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443E9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443EA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8443EB4
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 8443EC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443ECC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443ED8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443EE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443EF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443EFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8443F08
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8443F14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443F20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443F2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443F38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443F44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443F50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443F5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443F68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443F74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443F80
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8443F8C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 8443F98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443FA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443FB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443FBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443FC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443FD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443FE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443FEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8443FF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444004
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8444010
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ SquareWave1 844401C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8444028
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8444034
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444040
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844404C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444058
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444064
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444070
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844407C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8444088
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8444094
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84440A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84440AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84440B8
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 84440C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84440D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84440DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84440E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84440F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444100
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844410C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444118
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444124
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444130
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844413C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444148
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444154
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444160
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844416C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444178
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444184
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444190
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844419C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84441A8
	voice_square_1_alt 0, 2, 0, 1, 4, 1

@ SquareWave2 84441B4
	voice_square_2_alt 2, 0, 1, 4, 1

@ WaveMemory 84441C0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ WaveMemory 84441CC
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ SquareWave2 84441D8
	voice_square_2_alt 0, 0, 1, 4, 0

@ SquareWave1 84441E4
	voice_square_1_alt 0, 0, 0, 1, 4, 0

@ SquareWave1 84441F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84441FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444208
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444214
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444220
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844422C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444238
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444244
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444250
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844425C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444268
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444274
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444280
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844428C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444298
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84442A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84442B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84442BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84442C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84442D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84442E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84442EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84442F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444304
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444310
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844431C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444328
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444334
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444340
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844434C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444358
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444364
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444370
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844437C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444388
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444394
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84443A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84443AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84443B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84443C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84443D0
	voice_noise_alt 0, 0, 2, 4, 0

@ Noise 84443DC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84443E8: @ 84443E8

@ Percussion 84443E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 84443F4
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8444400
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844440C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444418
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444424
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444430
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844443C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444448
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444454
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444460
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844446C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444478
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8444484
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 8444490
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844449C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84444A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84444B4
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 84444C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84444CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84444D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84444E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84444F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84444FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8444508
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8444514
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444520
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844452C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444538
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444544
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444550
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844455C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444568
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444574
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444580
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844458C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 8444598
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84445A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84445B0
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 84445BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84445C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84445D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84445E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84445EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84445F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444604
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8444610
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ SquareWave1 844461C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8444628
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8444634
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444640
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844464C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444658
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444664
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444670
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844467C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8444688
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8444694
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84446A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84446AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84446B8
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 84446C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84446D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84446DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84446E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84446F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444700
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844470C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444718
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444724
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444730
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844473C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444748
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8444754
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8444760
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844476C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444778
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444784
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444790
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844479C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84447A8
	voice_square_1_alt 0, 2, 0, 2, 4, 1

@ SquareWave2 84447B4
	voice_square_2_alt 2, 0, 2, 4, 1

@ WaveMemory 84447C0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave2 84447CC
	voice_square_2_alt 0, 0, 1, 4, 0

@ SquareWave1 84447D8
	voice_square_1_alt 0, 0, 0, 1, 4, 0

@ SquareWave1 84447E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84447F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84447FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444808
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444814
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444820
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844482C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444838
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444844
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444850
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844485C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444868
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444874
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444880
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844488C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444898
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84448A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84448B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84448BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84448C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84448D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84448E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84448EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84448F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444904
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444910
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844491C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444928
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444934
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444940
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844494C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444958
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444964
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444970
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844497C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444988
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444994
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84449A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84449AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84449B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84449C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84449D0
	voice_noise_alt 0, 0, 2, 4, 0

@ Noise 84449DC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84449E8: @ 84449E8

@ Percussion 84449E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84449F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444A00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444A0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444A18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444A24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444A30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444A3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444A48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444A54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444A60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444A6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444A78
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8444A84
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 8444A90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444A9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444AA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444AB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444AC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444ACC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444AD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444AE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444AF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444AFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444B08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444B14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444B20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444B2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444B38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444B44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444B50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444B5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444B68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444B74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444B80
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8444B8C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 8444B98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444BA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444BB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444BBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444BC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444BD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444BE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444BEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444BF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444C04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444C10
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8444C1C
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 216

@ SquareWave1 8444C28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444C34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444C40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444C4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444C58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444C64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444C70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444C7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444C88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444C94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444CA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444CAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444CB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444CC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444CD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444CDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444CE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444CF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444D9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444DA8
	voice_square_1_alt 0, 2, 0, 1, 4, 0

@ SquareWave2 8444DB4
	voice_square_2_alt 2, 0, 1, 4, 0

@ WaveMemory 8444DC0
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ SquareWave2 8444DCC
	voice_square_2_alt 0, 0, 1, 4, 1

@ SquareWave1 8444DD8
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave1 8444DE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444DF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8444DFC
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 8444E08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444E14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444E20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444E2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444E38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444E44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444E50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444E5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444E68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444E74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444E80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444E8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444E98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444EA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444EB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444EBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444EC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444ED4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444EE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444EEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444EF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444F94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444FA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444FAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444FB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8444FC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8444FD0
	voice_noise_alt 0, 0, 2, 4, 0

@ Noise 8444FDC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_8444FE8: @ 8444FE8

@ Percussion 8444FE8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 8444FF4
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8445000
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844500C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445018
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445024
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445030
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844503C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445048
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445054
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445060
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844506C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445078
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445084
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8445090
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 844509C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84450A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84450B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84450C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84450CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84450D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84450E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84450F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84450FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445108
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445114
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445120
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844512C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445138
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445144
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445150
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844515C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445168
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445174
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445180
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844518C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ Direct Sound 8445198
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 84451A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84451B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84451BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84451C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84451D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84451E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84451EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84451F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445204
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445210
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844521C
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ Key-Split 8445228
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8445234
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445240
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844524C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445258
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445264
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445270
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844527C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8445288
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8445294
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84452A0
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 84452AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84452B8
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 84452C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84452D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84452DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84452E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84452F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445300
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844530C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445318
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445324
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445330
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844533C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445348
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8445354
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8445360
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844536C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445378
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445384
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445390
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844539C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84453A8
	voice_square_1_alt 0, 1, 0, 2, 3, 1

@ SquareWave2 84453B4
	voice_square_2_alt 2, 0, 1, 4, 1

@ WaveMemory 84453C0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ WaveMemory 84453CC
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 0

@ SquareWave2 84453D8
	voice_square_2_alt 1, 0, 1, 4, 1

@ WaveMemory 84453E4
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 1

@ SquareWave1 84453F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84453FC
	voice_square_1_alt 0, 0, 0, 2, 3, 1

@ SquareWave1 8445408
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445414
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445420
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844542C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445438
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445444
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445450
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844545C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445468
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445474
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445480
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844548C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445498
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84454A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84454B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84454BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84454C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84454D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84454E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84454EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84454F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445504
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445510
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844551C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445528
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445534
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445540
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844554C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445558
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445564
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445570
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844557C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445588
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445594
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84455A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84455AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84455B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84455C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84455D0
	voice_noise_alt 0, 0, 3, 4, 0

@ Noise 84455DC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84455E8: @ 84455E8

@ Percussion 84455E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84455F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445600
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844560C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445618
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445624
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445630
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844563C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445648
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445654
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445660
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844566C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445678
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445684
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445690
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844569C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84456A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84456B4
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 165

@ SquareWave1 84456C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84456CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84456D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84456E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84456F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84456FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445708
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445714
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445720
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844572C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445738
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445744
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445750
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844575C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445768
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445774
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445780
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844578C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ Direct Sound 8445798
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 84457A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84457B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84457BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84457C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84457D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84457E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84457EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84457F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445804
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445810
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844581C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445828
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445834
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445840
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844584C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445858
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445864
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445870
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844587C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8445888
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8445894
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84458A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84458AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84458B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84458C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84458D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84458DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84458E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84458F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445900
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844590C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445918
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445924
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445930
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844593C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445948
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445954
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445960
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844596C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445978
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445984
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445990
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844599C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84459A8
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave2 84459B4
	voice_square_2_alt 1, 0, 1, 4, 1

@ WaveMemory 84459C0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ WaveMemory 84459CC
	voice_programmable_wave_alt ProgrammableWaveData_845543C, 0, 7, 15, 0

@ SquareWave1 84459D8
	voice_square_1_alt 0, 0, 0, 1, 4, 1

@ SquareWave1 84459E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84459F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84459FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445A98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445AA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445AB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445ABC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445AC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445AD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445AE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445AEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445AF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445B94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445BA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445BAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445BB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445BC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8445BD0
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 8445BDC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_8445BE8: @ 8445BE8

@ Percussion 8445BE8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8445BF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445C00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445C0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445C18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445C24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445C30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445C3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445C48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445C54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445C60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445C6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445C78
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8445C84
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 8445C90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445C9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445CA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8445CB4
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 8445CC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445CCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445CD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445CE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445CF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445CFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8445D08
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8445D14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445D20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445D2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445D38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445D44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445D50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445D5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445D68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445D74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445D80
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8445D8C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 196

@ SquareWave1 8445D98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445DA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445DB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445DBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445DC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445DD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445DE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445DEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445DF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445E04
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8445E10
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ SquareWave1 8445E1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8445E28
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8445E34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445E40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445E4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445E58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445E64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445E70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445E7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445E88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445E94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445EA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445EAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445EB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445EC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445ED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445EDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445EE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445EF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445F00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445F0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445F18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445F24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445F30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445F3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445F48
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8445F54
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8445F60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445F6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445F78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445F84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445F90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445F9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445FA8
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave2 8445FB4
	voice_square_2_alt 1, 0, 1, 4, 1

@ WaveMemory 8445FC0
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ SquareWave1 8445FCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445FD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445FE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445FF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8445FFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446008
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446014
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446020
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844602C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446038
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446044
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446050
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844605C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446068
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446074
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446080
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844608C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446098
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84460A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84460B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84460BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84460C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84460D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84460E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84460EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84460F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446104
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446110
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844611C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446128
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446134
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446140
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844614C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446158
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446164
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446170
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844617C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446188
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446194
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84461A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84461AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84461B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84461C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84461D0
	voice_noise_alt 0, 0, 2, 4, 0

@ Noise 84461DC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84461E8: @ 84461E8

@ Percussion 84461E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84461F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446200
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844620C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446218
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446224
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446230
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844623C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446248
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446254
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446260
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844626C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446278
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446284
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8446290
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 844629C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84462A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84462B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84462C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84462CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84462D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84462E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84462F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84462FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8446308
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8446314
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446320
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844632C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446338
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446344
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446350
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844635C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446368
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446374
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446380
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844638C
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 196

@ SquareWave1 8446398
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84463A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84463B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84463BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84463C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84463D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84463E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84463EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84463F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8446404
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ SquareWave1 8446410
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844641C
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ Key-Split 8446428
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8446434
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446440
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844644C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446458
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446464
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446470
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844647C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446488
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446494
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84464A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84464AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84464B8
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 84464C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84464D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84464DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84464E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84464F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446500
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844650C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446518
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446524
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446530
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844653C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446548
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446554
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446560
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844656C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446578
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446584
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446590
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844659C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84465A8
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave2 84465B4
	voice_square_2_alt 1, 0, 1, 4, 1

@ WaveMemory 84465C0
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 15, 0

@ SquareWave1 84465CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84465D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84465E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84465F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84465FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446608
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446614
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446620
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844662C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446638
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446644
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446650
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844665C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446668
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446674
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446680
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844668C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446698
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84466A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84466B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84466BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84466C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84466D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84466E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84466EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84466F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446704
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446710
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844671C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446728
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446734
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446740
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844674C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446758
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446764
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446770
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844677C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446788
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446794
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84467A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84467AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84467B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84467C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84467D0
	voice_noise_alt 0, 0, 2, 4, 0

@ Noise 84467DC
	voice_noise_alt 0, 0, 2, 0, 2

VoiceGroupTable_84467E8: @ 84467E8

@ Percussion 84467E8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 84467F4
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8446800
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844680C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446818
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8446824
	voice_square_2_alt 3, 0, 2, 4, 1

@ SquareWave2 8446830
	voice_square_2_alt 0, 0, 1, 6, 2

@ SquareWave1 844683C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446848
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446854
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446860
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844686C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446878
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446884
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8446890
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 844689C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84468A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84468B4
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 84468C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84468CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84468D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84468E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84468F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84468FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8446908
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8446914
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446920
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844692C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446938
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446944
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446950
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844695C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446968
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446974
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446980
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844698C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446998
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84469A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84469B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 84469BC
	voice_programmable_wave_alt ProgrammableWaveData_84553FC, 0, 7, 6, 2

@ SquareWave1 84469C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84469D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84469E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84469EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84469F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8446A04
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ Direct Sound 8446A10
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ SquareWave1 8446A1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8446A28
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8446A34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446A40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446A4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446A58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446A64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446A70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446A7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446A88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446A94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446AA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446AAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446AB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446AC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446AD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446ADC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446AE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446AF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446B00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446B0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446B18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446B24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446B30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446B3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446B48
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8446B54
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8446B60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446B6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446B78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446B84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446B90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446B9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446BA8
	voice_square_1_alt 0, 3, 0, 2, 4, 1

@ SquareWave2 8446BB4
	voice_square_2_alt 3, 0, 1, 6, 2

@ WaveMemory 8446BC0
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 0

@ SquareWave1 8446BCC
	voice_square_1_alt 0, 2, 0, 2, 6, 5

@ WaveMemory 8446BD8
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 4, 4

@ SquareWave1 8446BE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446BF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8446BFC
	voice_square_2_alt 2, 0, 1, 6, 2

@ SquareWave1 8446C08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446C14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446C20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446C2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446C38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446C44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446C50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446C5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446C68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446C74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446C80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446C8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446C98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446CA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446CB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446CBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446CC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446CD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446CE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446CEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446CF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446D94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446DA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446DAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446DB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446DC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8446DD0
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 8446DDC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_8446DE8: @ 8446DE8

@ Percussion 8446DE8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8446DF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446E9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446EA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446EB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446EC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446ECC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446ED8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446EE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446EF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446EFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8446F08
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8446F14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446F20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446F2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446F38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446F44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446F50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446F5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446F68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446F74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446F80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446F8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446F98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446FA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8446FB0
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 8446FBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446FC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446FD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446FE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446FEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8446FF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8447004
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ Direct Sound 8447010
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ Direct Sound 844701C
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ Key-Split 8447028
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8447034
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447040
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844704C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447058
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447064
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447070
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844707C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447088
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447094
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84470A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84470AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84470B8
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 84470C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84470D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84470DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84470E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84470F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447100
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844710C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447118
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447124
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447130
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844713C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447148
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8447154
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8447160
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844716C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447178
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447184
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447190
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844719C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84471A8
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave2 84471B4
	voice_square_2_alt 1, 0, 1, 4, 1

@ WaveMemory 84471C0
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 15, 0

@ SquareWave2 84471CC
	voice_square_2_alt 3, 0, 1, 4, 1

@ SquareWave1 84471D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84471E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84471F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84471FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447208
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447214
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447220
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844722C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447238
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447244
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447250
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844725C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447268
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447274
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447280
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844728C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447298
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84472A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84472B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84472BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84472C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84472D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84472E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84472EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84472F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447304
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447310
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844731C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447328
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447334
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447340
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844734C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447358
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447364
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447370
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844737C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447388
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447394
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84473A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84473AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84473B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84473C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84473D0
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 84473DC
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84473E8: @ 84473E8

@ SquareWave1 84473E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84473F4
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

VoiceGroupTable_8447400: @ 8447400

@ Percussion 8447400
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 844740C
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8447418
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447424
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447430
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844743C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447448
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447454
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447460
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844746C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447478
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447484
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447490
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844749C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84474A8
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 84474B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84474C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84474CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84474D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84474E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84474F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84474FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447508
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447514
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8447520
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 844752C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447538
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447544
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447550
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844755C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447568
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447574
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447580
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844758C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447598
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84475A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84475B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84475BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84475C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84475D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84475E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84475EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84475F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447604
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447610
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844761C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447628
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8447634
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ Key-Split 8447640
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 844764C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447658
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447664
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447670
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844767C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447688
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447694
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84476A0
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 84476AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84476B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84476C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84476D0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 84476DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84476E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84476F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447700
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844770C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447718
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447724
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447730
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844773C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447748
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447754
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447760
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844776C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447778
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447784
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447790
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844779C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84477A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84477B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84477C0
	voice_square_1_alt 0, 3, 0, 2, 4, 1

@ SquareWave2 84477CC
	voice_square_2_alt 3, 0, 1, 6, 2

@ WaveMemory 84477D8
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ WaveMemory 84477E4
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 4, 4

@ SquareWave1 84477F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84477FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447808
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447814
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447820
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844782C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447838
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447844
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447850
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844785C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447868
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447874
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447880
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844788C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447898
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84478A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84478B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84478BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84478C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84478D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84478E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84478EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84478F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447904
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447910
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844791C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447928
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447934
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447940
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844794C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447958
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447964
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447970
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844797C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447988
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447994
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84479A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84479AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84479B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84479C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84479D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84479DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84479E8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 84479F4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_8447A00: @ 8447A00

@ Percussion 8447A00
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 8447A0C
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8447A18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447A24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447A30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447A3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447A48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447A54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447A60
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8447A6C
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 255, 165, 72, 249

@ SquareWave1 8447A78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447A84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447A90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447A9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447AA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447AB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447AC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447ACC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447AD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447AE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447AF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447AFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447B08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447B14
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8447B20
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 128, 249, 25, 76

@ SquareWave1 8447B2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447B38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447B44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447B50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447B5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447B68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447B74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447B80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447B8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447B98
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8447BA4
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 8447BB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447BBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447BC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447BD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447BE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447BEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447BF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447C04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447C10
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8447C1C
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ Direct Sound 8447C28
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 242

@ SquareWave1 8447C34
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8447C40
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8447C4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447C58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447C64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447C70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447C7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447C88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447C94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447CA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447CAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8447CB8
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 8447CC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8447CD0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8447CDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447CE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447CF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447D00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447D0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447D18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447D24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447D30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447D3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447D48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447D54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447D60
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8447D6C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 8447D78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447D84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447D90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447D9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447DA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447DB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447DC0
	voice_square_1_alt 0, 2, 0, 1, 4, 1

@ SquareWave2 8447DCC
	voice_square_2_alt 2, 0, 1, 4, 2

@ WaveMemory 8447DD8
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 6, 4

@ WaveMemory 8447DE4
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 2, 6, 1

VoiceGroupTable_8447DF0: @ 8447DF0

@ Percussion 8447DF0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8447DFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447E08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447E14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447E20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447E2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447E38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447E44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447E50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447E5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447E68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447E74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447E80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447E8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8447E98
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 8447EA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447EB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447EBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447EC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447ED4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447EE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447EEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447EF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447F04
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8447F10
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8447F1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447F28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447F34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447F40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447F4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447F58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447F64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447F70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447F7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447F88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447F94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447FA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447FAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447FB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447FC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447FD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447FDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447FE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8447FF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448000
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844800C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8448018
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ Direct Sound 8448024
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ Key-Split 8448030
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 844803C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448048
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448054
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448060
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844806C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448078
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448084
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448090
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844809C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84480A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84480B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84480C0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 84480CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84480D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84480E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84480F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84480FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448108
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448114
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448120
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844812C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448138
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448144
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448150
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844815C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8448168
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448174
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448180
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844818C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448198
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84481A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84481B0
	voice_square_1_alt 0, 1, 0, 2, 4, 0

@ SquareWave2 84481BC
	voice_square_2_alt 1, 0, 2, 4, 0

@ SquareWave1 84481C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84481D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84481E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84481EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84481F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8448204
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 1

@ SquareWave1 8448210
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844821C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448228
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448234
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448240
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844824C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448258
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448264
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448270
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844827C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448288
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448294
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84482A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84482AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84482B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84482C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84482D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84482DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84482E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84482F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448300
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844830C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448318
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448324
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448330
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844833C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448348
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448354
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448360
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844836C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448378
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448384
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448390
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844839C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84483A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84483B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84483C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84483CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84483D8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 84483E4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84483F0: @ 84483F0

@ Percussion 84483F0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84483FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448408
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448414
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448420
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844842C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448438
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448444
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448450
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844845C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448468
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448474
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448480
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844848C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448498
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84484A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84484B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84484BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84484C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84484D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84484E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84484EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84484F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448504
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8448510
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 844851C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448528
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448534
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448540
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844854C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448558
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448564
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448570
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844857C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448588
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448594
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84485A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84485AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84485B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84485C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84485D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84485DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84485E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84485F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448600
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844860C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8448618
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ Direct Sound 8448624
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ SquareWave1 8448630
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844863C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448648
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448654
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448660
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844866C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448678
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448684
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8448690
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 844869C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84486A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84486B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84486C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84486CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84486D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84486E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84486F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84486FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448708
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448714
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448720
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844872C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448738
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448744
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448750
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844875C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8448768
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448774
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448780
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844878C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448798
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84487A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84487B0
	voice_square_1_alt 0, 2, 1, 2, 4, 0

@ SquareWave2 84487BC
	voice_square_2_alt 1, 0, 2, 4, 0

@ SquareWave1 84487C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 84487D4
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 15, 1

@ WaveMemory 84487E0
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 13, 1

@ SquareWave1 84487EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84487F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448804
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448810
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844881C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448828
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448834
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448840
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844884C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448858
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448864
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448870
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844887C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448888
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448894
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84488A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84488AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84488B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84488C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84488D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84488DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84488E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84488F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448900
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844890C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448918
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448924
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448930
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844893C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448948
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448954
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448960
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844896C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448978
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448984
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448990
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844899C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84489A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84489B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84489C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84489CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84489D8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 84489E4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84489F0: @ 84489F0

@ Percussion 84489F0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84489FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448A08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448A14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448A20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448A2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448A38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448A44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448A50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448A5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448A68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448A74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448A80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448A8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8448A98
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 8448AA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448AB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8448ABC
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 165

@ SquareWave1 8448AC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448AD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448AE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448AEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448AF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448B04
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8448B10
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 8448B1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448B28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448B34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448B40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448B4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448B58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448B64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448B70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448B7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448B88
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8448B94
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ Direct Sound 8448BA0
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 8448BAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448BB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448BC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448BD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448BDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448BE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448BF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448C00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448C0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8448C18
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ SquareWave1 8448C24
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8448C30
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8448C3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448C48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448C54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448C60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448C6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448C78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448C84
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8448C90
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8448C9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448CA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448CB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8448CC0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8448CCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448CD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448CE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448CF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448CFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448D08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448D14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448D20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448D2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448D38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448D44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448D50
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8448D5C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8448D68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448D74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448D80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448D8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448D98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448DA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448DB0
	voice_square_1_alt 0, 2, 0, 2, 4, 0

@ SquareWave2 8448DBC
	voice_square_2_alt 1, 0, 2, 4, 0

@ SquareWave1 8448DC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8448DD4
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 8448DE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448DEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448DF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448E94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448EA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448EAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448EB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448EC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448ED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448EDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448EE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448EF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448F9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448FA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448FB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448FC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8448FCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8448FD8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 8448FE4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_8448FF0: @ 8448FF0

@ Percussion 8448FF0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8448FFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449008
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449014
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449020
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844902C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449038
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449044
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449050
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844905C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449068
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449074
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449080
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844908C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449098
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84490A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84490B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84490BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84490C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84490D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84490E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84490EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84490F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449104
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449110
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844911C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449128
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449134
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449140
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 844914C
	voice_programmable_wave_alt ProgrammableWaveData_845543C, 0, 7, 15, 0

@ SquareWave1 8449158
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449164
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449170
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844917C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449188
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449194
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84491A0
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 84491AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84491B8
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 84491C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84491D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84491DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84491E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84491F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449200
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844920C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449218
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8449224
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ SquareWave1 8449230
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844923C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449248
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449254
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449260
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844926C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449278
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449284
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8449290
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 844929C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84492A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84492B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84492C0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 84492CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84492D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84492E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84492F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84492FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449308
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449314
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449320
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844932C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449338
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449344
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449350
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844935C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449368
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449374
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449380
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844938C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449398
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84493A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84493B0
	voice_square_1_alt 0, 0, 0, 1, 4, 1

@ SquareWave2 84493BC
	voice_square_2_alt 0, 0, 1, 4, 1

@ SquareWave1 84493C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 84493D4
	voice_programmable_wave_alt ProgrammableWaveData_845544C, 0, 7, 15, 0

@ SquareWave1 84493E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84493EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84493F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449404
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449410
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844941C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449428
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449434
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449440
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844944C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449458
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449464
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449470
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844947C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449488
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449494
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84494A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84494AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84494B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84494C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84494D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84494DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84494E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84494F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449500
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844950C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449518
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449524
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449530
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844953C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449548
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449554
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449560
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844956C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449578
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449584
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449590
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844959C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84495A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84495B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84495C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84495CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 84495D8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 84495E4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_84495F0: @ 84495F0

@ Percussion 84495F0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 84495FC
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8449608
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449614
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8449620
	voice_square_2_alt 1, 1, 1, 6, 2

@ SquareWave1 844962C
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8449638
	voice_programmable_wave_alt ProgrammableWaveData_84553FC, 0, 7, 15, 0

@ SquareWave1 8449644
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449650
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844965C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449668
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449674
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449680
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844968C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8449698
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 84496A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84496B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84496BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84496C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84496D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84496E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84496EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84496F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449704
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449710
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844971C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449728
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449734
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449740
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844974C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449758
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449764
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449770
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844977C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449788
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449794
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84497A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84497AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84497B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84497C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84497D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84497DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84497E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84497F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449800
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844980C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8449818
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ Direct Sound 8449824
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 239

@ Key-Split 8449830
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 844983C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449848
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449854
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449860
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844986C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449878
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449884
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8449890
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 844989C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84498A8
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 84498B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 84498C0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 84498CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84498D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84498E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84498F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84498FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449908
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449914
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449920
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844992C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449938
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449944
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449950
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844995C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 8449968
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449974
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449980
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844998C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449998
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84499A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84499B0
	voice_square_1_alt 0, 1, 0, 1, 6, 2

@ SquareWave2 84499BC
	voice_square_2_alt 1, 0, 2, 4, 0

@ WaveMemory 84499C8
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ SquareWave1 84499D4
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave1 84499E0
	voice_square_1_alt 0, 1, 1, 1, 6, 0

@ SquareWave1 84499EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84499F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8449A04
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 0

@ SquareWave2 8449A10
	voice_square_2_alt 3, 0, 1, 6, 2

@ SquareWave1 8449A1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449A28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449A34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449A40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449A4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449A58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449A64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449A70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449A7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449A88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449A94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449AA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449AAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449AB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449AC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449AD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449ADC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449AE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449AF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449B9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449BA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449BB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449BC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449BCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449BD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8449BE4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_8449BF0: @ 8449BF0

@ Percussion 8449BF0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8449BFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449C08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449C14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449C20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449C2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449C38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449C44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449C50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449C5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449C68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449C74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449C80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449C8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8449C98
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 8449CA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449CB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449CBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449CC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449CD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449CE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449CEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449CF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449D94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449DA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449DAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449DB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449DC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449DD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449DDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449DE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449DF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449E00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449E0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449E18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449E24
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8449E30
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8449E3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449E48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449E54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449E60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449E6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449E78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449E84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449E90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449E9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449EA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449EB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8449EC0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8449ECC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449ED8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449EE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449EF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449EFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449F08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449F14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449F20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449F2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449F38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449F44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449F50
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8449F5C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 8449F68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449F74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449F80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449F8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449F98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449FA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449FB0
	voice_square_1_alt 0, 1, 0, 2, 4, 0

@ SquareWave2 8449FBC
	voice_square_2_alt 2, 0, 2, 4, 0

@ WaveMemory 8449FC8
	voice_programmable_wave_alt ProgrammableWaveData_84553FC, 0, 7, 15, 0

@ WaveMemory 8449FD4
	voice_programmable_wave_alt ProgrammableWaveData_845544C, 0, 7, 15, 0

@ WaveMemory 8449FE0
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 15, 0

@ SquareWave1 8449FEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8449FF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A004
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A010
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A01C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A028
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A034
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A040
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A04C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A058
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A064
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A070
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A07C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A088
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A094
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A0A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A0AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A0B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A0C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A0D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A0DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A0E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A0F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A100
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A10C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A118
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A124
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A130
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A13C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A148
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A154
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A160
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A16C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A178
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A184
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A190
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A19C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A1A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A1B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A1C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A1CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 844A1D8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 844A1E4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_844A1F0: @ 844A1F0

@ Percussion 844A1F0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 844A1FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A208
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A214
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A220
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A22C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A238
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A244
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A250
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A25C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A268
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A274
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A280
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A28C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A298
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A2A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A2B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A2BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A2C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A2D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A2E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A2EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A2F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A304
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A310
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A31C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A328
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A334
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A340
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A34C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A358
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A364
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A370
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A37C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A388
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A394
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A3A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A3AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A3B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A3C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A3D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A3DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A3E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A3F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A400
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A40C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A418
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A424
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A430
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A43C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A448
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A454
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A460
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A46C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A478
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A484
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A490
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A49C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A4A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A4B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A4C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A4CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A4D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A4E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A4F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A4FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A508
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A514
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A520
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A52C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A538
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A544
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A550
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A55C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A568
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A574
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A580
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A58C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A598
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A5A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A5B0
	voice_square_1_alt 0, 0, 0, 2, 4, 1

@ SquareWave2 844A5BC
	voice_square_2_alt 0, 0, 2, 4, 1

@ WaveMemory 844A5C8
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 844A5D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A5E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A5EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A5F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A604
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A610
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A61C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A628
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A634
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A640
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A64C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A658
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A664
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A670
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A67C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A688
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A694
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A6A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A6AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A6B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A6C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A6D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A6DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A6E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A6F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A700
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A70C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A718
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A724
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A730
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A73C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A748
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A754
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A760
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A76C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A778
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A784
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A790
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A79C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A7A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A7B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A7C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A7CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 844A7D8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 844A7E4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_844A7F0: @ 844A7F0

@ Percussion 844A7F0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 844A7FC
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 844A808
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A814
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A820
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A82C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A838
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A844
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A850
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844A85C
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 255, 165, 72, 249

@ SquareWave1 844A868
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A874
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A880
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844A88C
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 844A898
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A8A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A8B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844A8BC
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 165

@ SquareWave1 844A8C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A8D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A8E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A8EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A8F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A904
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844A910
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 128, 249, 25, 76

@ SquareWave1 844A91C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A928
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A934
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A940
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A94C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A958
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A964
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A970
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A97C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A988
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844A994
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 253, 0, 188

@ SquareWave1 844A9A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A9AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A9B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A9C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A9D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A9DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A9E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844A9F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AA00
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844AA0C
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 226, 0, 38

@ Direct Sound 844AA18
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 242

@ SquareWave1 844AA24
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844AA30
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 844AA3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AA48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AA54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AA60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AA6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AA78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AA84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AA90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AA9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844AAA8
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 844AAB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844AAC0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 844AACC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AAD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AAE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AAF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AAFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AB08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AB14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AB20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AB2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AB38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AB44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AB50
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844AB5C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 844AB68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AB74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AB80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AB8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AB98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ABA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ABB0
	voice_square_1_alt 0, 2, 0, 1, 5, 2

@ SquareWave2 844ABBC
	voice_square_2_alt 2, 0, 1, 5, 2

@ WaveMemory 844ABC8
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 7, 0

@ WaveMemory 844ABD4
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 2, 6, 1

@ SquareWave1 844ABE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ABEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ABF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AC94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ACA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ACAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ACB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ACC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ACD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ACDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ACE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ACF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AD9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ADA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ADB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ADC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ADCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 844ADD8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 844ADE4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_844ADF0: @ 844ADF0

@ Percussion 844ADF0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 844ADFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AE08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AE14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AE20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AE2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AE38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AE44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AE50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AE5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AE68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AE74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AE80
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844AE8C
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 844AE98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AEA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AEB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AEBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AEC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AED4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AEE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AEEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AEF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AF04
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844AF10
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 128, 249, 25, 76

@ SquareWave1 844AF1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AF28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AF34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AF40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AF4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AF58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AF64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AF70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AF7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AF88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AF94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AFA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AFAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844AFB8
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 844AFC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AFD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AFDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AFE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844AFF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B000
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B00C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844B018
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 242

@ SquareWave1 844B024
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B030
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B03C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B048
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B054
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B060
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B06C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B078
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B084
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B090
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B09C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B0A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B0B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B0C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B0CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B0D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B0E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B0F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B0FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B108
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B114
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B120
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B12C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B138
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B144
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B150
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B15C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B168
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B174
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B180
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B18C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B198
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B1A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B1B0
	voice_square_1_alt 0, 2, 0, 1, 4, 1

@ SquareWave2 844B1BC
	voice_square_2_alt 2, 0, 1, 4, 2

@ WaveMemory 844B1C8
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 7, 0

@ SquareWave1 844B1D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B1E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B1EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B1F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B204
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B210
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B21C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B228
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B234
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B240
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B24C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B258
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B264
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B270
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B27C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B288
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B294
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B2A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B2AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B2B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B2C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B2D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B2DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B2E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B2F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B300
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B30C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B318
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B324
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B330
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B33C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B348
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B354
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B360
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B36C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B378
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B384
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B390
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B39C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B3A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B3B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B3C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B3CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 844B3D8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 844B3E4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_844B3F0: @ 844B3F0

@ Percussion 844B3F0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 844B3FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B408
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B414
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B420
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B42C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B438
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B444
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B450
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B45C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B468
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B474
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B480
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844B48C
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 844B498
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B4A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B4B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B4BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B4C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B4D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B4E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B4EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B4F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B504
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844B510
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 128, 249, 25, 76

@ SquareWave1 844B51C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B528
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B534
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B540
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B54C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B558
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B564
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B570
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B57C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B588
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B594
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844B5A0
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 844B5AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844B5B8
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 844B5C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B5D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B5DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B5E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B5F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B600
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B60C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844B618
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 0, 242

@ SquareWave1 844B624
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844B630
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 844B63C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B648
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B654
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B660
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B66C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B678
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B684
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B690
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B69C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844B6A8
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 844B6B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844B6C0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 844B6CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B6D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B6E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B6F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B6FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B708
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B714
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B720
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B72C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B738
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B744
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B750
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844B75C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 844B768
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B774
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B780
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B78C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B798
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B7A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B7B0
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave2 844B7BC
	voice_square_2_alt 1, 0, 1, 4, 1

@ WaveMemory 844B7C8
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 7, 0

@ SquareWave1 844B7D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B7E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B7EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B7F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B804
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B810
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B81C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B828
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B834
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B840
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B84C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B858
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B864
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B870
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B87C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B888
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B894
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B8A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B8AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B8B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B8C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B8D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B8DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B8E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B8F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B900
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B90C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B918
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B924
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B930
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B93C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B948
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B954
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B960
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B96C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B978
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B984
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B990
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B99C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B9A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B9B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B9C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844B9CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 844B9D8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 844B9E4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_844B9F0: @ 844B9F0

@ Percussion 844B9F0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 844B9FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BA08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BA14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BA20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BA2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BA38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BA44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BA50
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844BA5C
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 255, 165, 72, 249

@ SquareWave1 844BA68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BA74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BA80
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844BA8C
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ Direct Sound 844BA98
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 844BAA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BAB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844BABC
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 844BAC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BAD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BAE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844BAEC
	voice_directsound 60, 0, DirectSoundWaveData_84A5F58, 255, 0, 255, 165

@ SquareWave1 844BAF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BB04
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844BB10
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 128, 249, 25, 76

@ SquareWave1 844BB1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BB28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BB34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BB40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BB4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BB58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BB64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BB70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BB7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BB88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BB94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BBA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BBAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BBB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BBC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BBD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BBDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BBE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BBF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BC00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BC0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BC18
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844BC24
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ Key-Split 844BC30
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 844BC3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BC48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BC54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BC60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BC6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BC78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BC84
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844BC90
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 844BC9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BCA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BCB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844BCC0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 844BCCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BCD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BCE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BCF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BCFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BD08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BD14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BD20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BD2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BD38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BD44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BD50
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844BD5C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 844BD68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BD74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BD80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BD8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BD98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BDA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BDB0
	voice_square_1_alt 0, 0, 0, 1, 4, 1

@ SquareWave2 844BDBC
	voice_square_2_alt 0, 0, 1, 4, 1

@ WaveMemory 844BDC8
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 7, 0

@ SquareWave1 844BDD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BDE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BDEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BDF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BE94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BEA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BEAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BEB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BEC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BEDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BEE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BEF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BF9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BFA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BFB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BFC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844BFCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 844BFD8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 844BFE4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_844BFF0: @ 844BFF0

@ Percussion 844BFF0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 844BFFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C008
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C014
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C020
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C02C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C038
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C044
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C050
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C05C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C068
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C074
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C080
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C08C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C098
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C0A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C0B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844C0BC
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 844C0C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C0D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C0E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C0EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C0F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C104
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844C110
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 844C11C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C128
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C134
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C140
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C14C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C158
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C164
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C170
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C17C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C188
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C194
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C1A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C1AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844C1B8
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 844C1C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C1D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C1DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C1E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C1F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C200
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C20C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C218
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C224
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C230
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C23C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C248
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C254
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C260
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C26C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C278
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C284
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C290
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C29C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C2A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C2B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C2C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C2CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C2D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C2E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C2F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C2FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C308
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C314
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C320
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C32C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C338
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C344
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C350
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844C35C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 844C368
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C374
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C380
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C38C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C398
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C3A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C3B0
	voice_square_1_alt 0, 1, 0, 1, 4, 1

@ SquareWave2 844C3BC
	voice_square_2_alt 1, 0, 1, 4, 1

@ WaveMemory 844C3C8
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 3

@ SquareWave2 844C3D4
	voice_square_2_alt 3, 0, 1, 4, 1

@ SquareWave1 844C3E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C3EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C3F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C404
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C410
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C41C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C428
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C434
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C440
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C44C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C458
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C464
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C470
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C47C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C488
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C494
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C4A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C4AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C4B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C4C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C4D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C4DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C4E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C4F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C500
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C50C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C518
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C524
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C530
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C53C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C548
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C554
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C560
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C56C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C578
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C584
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C590
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C59C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C5A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C5B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C5C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C5CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 844C5D8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 844C5E4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_844C5F0: @ 844C5F0

@ Percussion 844C5F0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 844C5FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C608
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C614
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C620
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C62C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C638
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C644
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C650
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C65C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C668
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C674
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C680
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844C68C
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 844C698
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C6A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C6B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844C6BC
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 844C6C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C6D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C6E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C6EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C6F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C704
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844C710
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 844C71C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C728
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C734
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C740
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C74C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C758
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C764
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C770
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C77C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C788
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C794
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844C7A0
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 844C7AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844C7B8
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 844C7C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C7D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C7DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C7E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C7F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C800
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C80C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C818
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844C824
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ SquareWave1 844C830
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C83C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C848
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C854
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C860
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C86C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C878
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C884
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844C890
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 844C89C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C8A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C8B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C8C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C8CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C8D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C8E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C8F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C8FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C908
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C914
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C920
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C92C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C938
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C944
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C950
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C95C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C968
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C974
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C980
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C98C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C998
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C9A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C9B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844C9BC
	voice_square_2_alt 0, 0, 1, 4, 1

@ SquareWave1 844C9C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C9D4
	voice_square_1_alt 0, 0, 0, 1, 4, 1

@ WaveMemory 844C9E0
	voice_programmable_wave_alt ProgrammableWaveData_845543C, 0, 7, 15, 0

@ SquareWave1 844C9EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844C9F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CA94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CAA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CAAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CAB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CAC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CAD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CADC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CAE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CAF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CB9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CBA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CBB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CBC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CBCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 844CBD8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 844CBE4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_844CBF0: @ 844CBF0

@ Percussion 844CBF0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 844CBFC
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 844CC08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CC14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CC20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CC2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CC38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CC44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CC50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CC5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CC68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CC74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CC80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CC8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844CC98
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 844CCA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CCB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CCBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CCC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CCD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CCE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CCEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CCF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CD94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CDA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CDAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CDB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CDC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CDD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CDDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CDE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CDF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CE00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CE0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CE18
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844CE24
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 249

@ SquareWave1 844CE30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CE3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CE48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CE54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CE60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CE6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CE78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CE84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CE90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CE9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844CEA8
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 844CEB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844CEC0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 844CECC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CED8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CEE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CEF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CEFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CF98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CFA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CFB0
	voice_square_1_alt 0, 3, 0, 1, 4, 1

@ SquareWave2 844CFBC
	voice_square_2_alt 3, 0, 1, 4, 1

@ WaveMemory 844CFC8
	voice_programmable_wave_alt ProgrammableWaveData_84553FC, 0, 7, 7, 0

@ SquareWave1 844CFD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CFE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CFEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844CFF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D004
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D010
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D01C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D028
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D034
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D040
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D04C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D058
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D064
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D070
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D07C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D088
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D094
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D0A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D0AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D0B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D0C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D0D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D0DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D0E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D0F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D100
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D10C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D118
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D124
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D130
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D13C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D148
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D154
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D160
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D16C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D178
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D184
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D190
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D19C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D1A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D1B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D1C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D1CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 844D1D8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 844D1E4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_844D1F0: @ 844D1F0

@ Percussion 844D1F0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 844D1FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D208
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D214
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D220
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D22C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D238
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D244
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D250
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D25C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D268
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D274
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D280
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D28C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D298
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D2A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D2B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D2BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D2C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D2D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D2E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D2EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D2F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D304
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D310
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D31C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D328
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D334
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D340
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D34C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D358
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D364
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D370
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D37C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D388
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D394
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D3A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D3AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D3B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D3C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D3D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D3DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D3E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D3F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D400
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D40C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D418
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D424
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D430
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D43C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D448
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D454
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D460
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D46C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D478
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D484
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844D490
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 844D49C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844D4A8
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 844D4B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D4C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D4CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D4D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D4E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D4F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D4FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D508
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D514
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D520
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D52C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D538
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D544
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D550
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844D55C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 844D568
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D574
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D580
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D58C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D598
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D5A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D5B0
	voice_square_1_alt 0, 0, 0, 1, 4, 0

@ SquareWave2 844D5BC
	voice_square_2_alt 0, 0, 1, 4, 0

@ WaveMemory 844D5C8
	voice_programmable_wave_alt ProgrammableWaveData_84553FC, 0, 7, 7, 0

@ SquareWave1 844D5D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D5E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D5EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D5F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D604
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D610
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D61C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D628
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D634
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D640
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D64C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D658
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D664
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D670
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D67C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D688
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D694
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D6A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D6AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D6B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D6C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D6D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D6DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D6E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D6F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D700
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D70C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D718
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D724
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D730
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D73C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D748
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D754
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D760
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D76C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D778
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D784
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D790
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D79C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D7A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D7B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D7C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844D7CC
	voice_directsound 60, 0, DirectSoundWaveData_84A3B50, 255, 255, 255, 127

@ Direct Sound 844D7D8
	voice_directsound 60, 0, DirectSoundWaveData_845B9A8, 255, 255, 255, 127

@ Noise 844D7E4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_844D7F0: @ 844D7F0

@ Percussion 844D7F0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 844D7FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D808
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D814
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D820
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D82C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D838
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D844
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D850
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D85C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D868
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D874
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D880
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844D88C
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 844D898
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D8A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D8B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D8BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D8C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D8D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D8E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D8EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D8F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D904
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D910
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D91C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D928
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D934
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D940
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D94C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D958
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D964
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D970
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D97C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D988
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D994
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844D9A0
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 844D9AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844D9B8
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 844D9C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D9D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D9DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D9E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844D9F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DA00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DA0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DA18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DA24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DA30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DA3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DA48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DA54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DA60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DA6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DA78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DA84
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844DA90
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 844DA9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DAA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DAB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DAC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DACC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DAD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DAE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DAF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DAFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DB98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DBA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DBB0
	voice_square_1_alt 0, 0, 0, 1, 4, 0

@ SquareWave2 844DBBC
	voice_square_2_alt 0, 0, 1, 4, 0

@ WaveMemory 844DBC8
	voice_programmable_wave_alt ProgrammableWaveData_84553FC, 0, 7, 7, 0

@ SquareWave1 844DBD4
	voice_square_1_alt 0, 1, 2, 1, 5, 0

@ SquareWave2 844DBE0
	voice_square_2_alt 1, 2, 1, 5, 0

@ SquareWave1 844DBEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DBF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DC94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DCA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DCAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DCB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DCC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DCD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DCDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DCE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DCF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DD9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DDA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DDB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DDC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DDCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 844DDD8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 844DDE4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_844DDF0: @ 844DDF0

@ Percussion 844DDF0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 844DDFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DE08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DE14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DE20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DE2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DE38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DE44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DE50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DE5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DE68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DE74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DE80
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844DE8C
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 844DE98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DEA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DEB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844DEBC
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 210

@ SquareWave1 844DEC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DED4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DEE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DEEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DEF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DF04
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844DF10
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 76

@ SquareWave1 844DF1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DF28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DF34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DF40
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 844DF4C
	voice_programmable_wave_alt ProgrammableWaveData_845543C, 0, 7, 15, 0

@ SquareWave1 844DF58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DF64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DF70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DF7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DF88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DF94
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844DFA0
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 844DFAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844DFB8
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 844DFC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DFD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DFDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DFE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844DFF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E000
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E00C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E018
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844E024
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 246

@ SquareWave1 844E030
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E03C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E048
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E054
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E060
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E06C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E078
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E084
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844E090
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 844E09C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E0A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E0B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E0C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E0CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E0D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E0E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E0F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E0FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E108
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E114
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E120
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E12C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E138
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E144
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E150
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844E15C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 127

@ SquareWave1 844E168
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E174
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E180
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E18C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E198
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E1A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E1B0
	voice_square_1_alt 0, 0, 0, 1, 4, 1

@ SquareWave1 844E1BC
	voice_square_1_alt 0, 2, 1, 1, 4, 1

@ SquareWave2 844E1C8
	voice_square_2_alt 2, 1, 1, 4, 1

@ SquareWave2 844E1D4
	voice_square_2_alt 1, 0, 1, 4, 1

@ SquareWave1 844E1E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 844E1EC
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 15, 0

@ SquareWave1 844E1F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E204
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E210
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E21C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E228
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E234
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E240
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E24C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E258
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E264
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E270
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E27C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E288
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E294
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E2A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E2AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E2B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E2C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E2D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E2DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E2E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E2F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E300
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E30C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E318
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E324
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E330
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E33C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E348
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E354
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E360
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E36C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E378
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E384
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E390
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E39C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E3A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E3B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E3C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E3CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 844E3D8
	voice_noise_alt 0, 0, 1, 7, 1

@ Noise 844E3E4
	voice_noise_alt 0, 0, 1, 0, 0

VoiceGroupTable_844E3F0: @ 844E3F0

@ Percussion 844E3F0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 844E3FC
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 844E408
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E414
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E420
	voice_square_1_alt 0, 1, 1, 5, 2, 4

@ SquareWave2 844E42C
	voice_square_2_alt 1, 1, 5, 2, 4

@ WaveMemory 844E438
	voice_programmable_wave_alt ProgrammableWaveData_84553BC, 0, 7, 15, 0

@ SquareWave1 844E444
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E450
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E45C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E468
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E474
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E480
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E48C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844E498
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ SquareWave1 844E4A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E4B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E4BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E4C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E4D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E4E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E4EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E4F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E504
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E510
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E51C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E528
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E534
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E540
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E54C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E558
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E564
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E570
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E57C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E588
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E594
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E5A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E5AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E5B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E5C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E5D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E5DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E5E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E5F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E600
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E60C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844E618
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 242

@ Direct Sound 844E624
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 180, 239

@ Key-Split 844E630
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 844E63C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E648
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E654
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E660
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E66C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E678
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E684
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844E690
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 844E69C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844E6A8
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 844E6B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844E6C0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 844E6CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E6D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E6E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E6F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E6FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E708
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E714
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E720
	voice_square_1_alt 0, 1, 1, 2, 4, 1

@ SquareWave1 844E72C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E738
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E744
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E750
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844E75C
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ WaveMemory 844E768
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 844E774
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E780
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E78C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E798
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E7A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844E7B0
	voice_square_2_alt 1, 1, 1, 6, 0

@ SquareWave1 844E7BC
	voice_square_1_alt 0, 0, 0, 4, 6, 2

@ WaveMemory 844E7C8
	voice_programmable_wave_alt ProgrammableWaveData_84553CC, 0, 7, 15, 0

@ SquareWave1 844E7D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E7E0
	voice_square_1_alt 0, 0, 0, 1, 6, 0

@ SquareWave1 844E7EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844E7F8
	voice_square_2_alt 1, 1, 4, 6, 1

@ WaveMemory 844E804
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 0

@ SquareWave1 844E810
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E81C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E828
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E834
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E840
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E84C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E858
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E864
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E870
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E87C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E888
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E894
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E8A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E8AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E8B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E8C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E8D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844E8DC
	voice_square_2_alt 0, 1, 2, 4, 1

@ SquareWave1 844E8E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E8F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E900
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844E90C
	voice_square_2_alt 0, 1, 1, 6, 1

VoiceGroupTable_844E918: @ 844E918

@ SquareWave1 844E918
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E924
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E930
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E93C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E948
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E954
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E960
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E96C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E978
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E984
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E990
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E99C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E9A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E9B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E9C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E9CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E9D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E9E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E9F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844E9FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EA08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EA14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EA20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EA2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844EA38
	voice_directsound 60, 0, DirectSoundWaveData_8481130, 255, 249, 25, 248

@ SquareWave1 844EA44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EA50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EA5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EA68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EA74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EA80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EA8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EA98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EAA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EAB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EABC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EAC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EAD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EAE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EAEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EAF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EB04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EB10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EB1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EB28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EB34
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844EB40
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 242, 51, 165

@ SquareWave1 844EB4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EB58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EB64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EB70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EB7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EB88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EB94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EBA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EBAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EBB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EBC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EBD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EBDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EBE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EBF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EC9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ECA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ECB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ECC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ECCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ECD8
	voice_square_1_alt 0, 2, 0, 6, 0, 6

@ SquareWave2 844ECE4
	voice_square_2_alt 2, 0, 6, 0, 6

VoiceGroupTable_844ECF0: @ 844ECF0

@ Percussion 844ECF0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 844ECFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ED08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ED14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844ED20
	voice_square_2 2, 0, 1, 1, 1

@ SquareWave1 844ED2C
	voice_square_1 0, 2, 0, 1, 1, 1

@ SquareWave1 844ED38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ED44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ED50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ED5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ED68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ED74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ED80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ED8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844ED98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EDA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EDB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EDBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EDC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EDD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EDE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EDEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EDF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EE04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EE10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EE1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EE28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EE34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EE40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EE4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EE58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EE64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EE70
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844EE7C
	voice_directsound 60, 0, DirectSoundWaveData_8483804, 255, 253, 0, 149

@ SquareWave1 844EE88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EE94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EEA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EEAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EEB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EEC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EEDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EEE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EEF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EF00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EF0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844EF18
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 246, 0, 235

@ Direct Sound 844EF24
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 844EF30
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 844EF3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EF48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EF54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EF60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EF6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EF78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EF84
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844EF90
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 844EF9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844EFA8
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 844EFB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844EFC0
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 844EFCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EFD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EFE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EFF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844EFFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F008
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F014
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F020
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F02C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F038
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F044
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F050
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F05C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F068
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F074
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F080
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F08C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F098
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F0A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844F0B0
	voice_square_2 3, 0, 1, 7, 1

@ WaveMemory 844F0BC
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 2

VoiceGroupTable_844F0C8: @ 844F0C8

@ Percussion 844F0C8
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 844F0D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F0E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F0EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844F0F8
	voice_square_2 0, 0, 1, 7, 1

@ SquareWave1 844F104
	voice_square_1 0, 0, 0, 1, 7, 1

@ SquareWave1 844F110
	voice_square_1 0, 0, 0, 0, 7, 1

@ SquareWave1 844F11C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F128
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F134
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F140
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F14C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F158
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F164
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844F170
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 250, 0, 242

@ SquareWave1 844F17C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F188
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844F194
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 127

@ SquareWave1 844F1A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F1AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F1B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844F1C4
	voice_directsound 60, 0, DirectSoundWaveData_84A5F58, 255, 0, 255, 165

@ SquareWave1 844F1D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F1DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F1E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F1F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F200
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F20C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F218
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F224
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F230
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F23C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F248
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844F254
	voice_directsound 60, 0, DirectSoundWaveData_8483804, 255, 253, 0, 149

@ SquareWave1 844F260
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F26C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F278
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F284
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844F290
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 844F29C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F2A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F2B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F2C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F2CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F2D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F2E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844F2F0
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 246, 0, 235

@ Direct Sound 844F2FC
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 844F308
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 844F314
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F320
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F32C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F338
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F344
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F350
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F35C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F368
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F374
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844F380
	voice_keysplit VoiceGroupTable_843087C, KeySplitTable_8455308

@ SquareWave1 844F38C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844F398
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 844F3A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F3B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F3BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F3C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F3D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F3E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F3EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F3F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F404
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F410
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F41C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F428
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F434
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F440
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F44C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F458
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F464
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F470
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F47C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844F488
	voice_square_2 2, 0, 1, 7, 1

@ WaveMemory 844F494
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 2

@ SquareWave1 844F4A0
	voice_square_1 0, 2, 0, 1, 7, 1

@ SquareWave1 844F4AC
	voice_square_1 0, 2, 0, 0, 7, 1

@ WaveMemory 844F4B8
	voice_programmable_wave_alt ProgrammableWaveData_845540C, 0, 7, 15, 2

@ SquareWave1 844F4C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F4D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F4DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F4E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F4F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844F500
	voice_directsound 60, 0, DirectSoundWaveData_849F40C, 255, 0, 255, 127

VoiceGroupTable_844F50C: @ 844F50C

@ Percussion 844F50C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 844F518
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 844F524
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F530
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844F53C
	voice_square_2 0, 0, 2, 4, 1

@ SquareWave1 844F548
	voice_square_1 0, 0, 0, 2, 4, 1

@ SquareWave2 844F554
	voice_square_2 3, 0, 1, 7, 1

@ SquareWave1 844F560
	voice_square_1 0, 3, 0, 1, 7, 1

@ SquareWave1 844F56C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F578
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F584
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F590
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F59C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F5A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F5B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F5C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F5CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844F5D8
	voice_directsound 60, 0, DirectSoundWaveData_84569D4, 255, 0, 255, 127

@ SquareWave1 844F5E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F5F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F5FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F608
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F614
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F620
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F62C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F638
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F644
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F650
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F65C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F668
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F674
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F680
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F68C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844F698
	voice_directsound 60, 0, DirectSoundWaveData_8483804, 255, 253, 0, 149

@ SquareWave1 844F6A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F6B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F6BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F6C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F6D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F6E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F6EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F6F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F704
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F710
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F71C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F728
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844F734
	voice_directsound_no_resample 60, 0, DirectSoundWaveData_8485454, 255, 246, 0, 226

@ Direct Sound 844F740
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 844F74C
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 844F758
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F764
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F770
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F77C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F788
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F794
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F7A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844F7AC
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 844F7B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F7C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F7D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844F7DC
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 844F7E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F7F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F800
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F80C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F818
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F824
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F830
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F83C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F848
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F854
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F860
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F86C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F878
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F884
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F890
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F89C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F8A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F8B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F8C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844F8CC
	voice_square_2 2, 0, 1, 7, 1

@ WaveMemory 844F8D8
	voice_programmable_wave_alt ProgrammableWaveData_84553FC, 0, 7, 15, 2

@ SquareWave1 844F8E4
	voice_square_1 0, 2, 0, 1, 7, 1

@ SquareWave2 844F8F0
	voice_square_2 1, 0, 1, 9, 1

@ SquareWave1 844F8FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F908
	voice_square_1 0, 2, 0, 0, 7, 1

@ SquareWave1 844F914
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F920
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F92C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F938
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 844F944
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 2

VoiceGroupTable_844F950: @ 844F950

@ Percussion 844F950
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 844F95C
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 844F968
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F974
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844F980
	voice_square_2 2, 0, 2, 6, 1

@ SquareWave1 844F98C
	voice_square_1 0, 2, 0, 2, 6, 1

@ SquareWave2 844F998
	voice_square_2 3, 0, 2, 4, 1

@ SquareWave1 844F9A4
	voice_square_1 0, 3, 0, 2, 4, 1

@ SquareWave1 844F9B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F9BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F9C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F9D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F9E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F9EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844F9F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FA94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FAA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FAAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FAB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FAC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FAD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844FADC
	voice_directsound 60, 0, DirectSoundWaveData_8483804, 255, 253, 0, 149

@ SquareWave1 844FAE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FAF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FB00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FB0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FB18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FB24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FB30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FB3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FB48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FB54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FB60
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844FB6C
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 216, 0, 165

@ SquareWave1 844FB78
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844FB84
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 844FB90
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 844FB9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FBA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FBB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FBC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FBCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FBD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FBE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844FBF0
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 844FBFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FC08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FC14
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 844FC20
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 844FC2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FC38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FC44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FC50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FC5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FC68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FC74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FC80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FC8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FC98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FCA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FCB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FCBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FCC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FCD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FCE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FCEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FCF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FD04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 844FD10
	voice_square_2 2, 0, 1, 7, 1

@ WaveMemory 844FD1C
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 2

@ SquareWave1 844FD28
	voice_square_1 0, 2, 0, 1, 7, 1

@ SquareWave1 844FD34
	voice_square_1 0, 2, 0, 0, 7, 1

@ SquareWave2 844FD40
	voice_square_2 3, 0, 1, 7, 1

@ SquareWave1 844FD4C
	voice_square_1 0, 3, 0, 1, 7, 1

@ SquareWave1 844FD58
	voice_square_1 0, 3, 0, 0, 7, 1

@ SquareWave1 844FD64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FD70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FD7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 844FD88
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 2

VoiceGroupTable_844FD94: @ 844FD94

@ Percussion 844FD94
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 844FDA0
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 844FDAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FDB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FDC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FDD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FDDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FDE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FDF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FE9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FEA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FEB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FEC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FECC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FED8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FEE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FEF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FEFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FF08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FF14
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844FF20
	voice_directsound 60, 0, DirectSoundWaveData_8483804, 255, 253, 0, 149

@ SquareWave1 844FF2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FF38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FF44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FF50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FF5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FF68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FF74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FF80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FF8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FF98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FFA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844FFB0
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 216, 0, 165

@ SquareWave1 844FFBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 844FFC8
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 844FFD4
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 844FFE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FFEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 844FFF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450004
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450010
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845001C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450028
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8450034
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8450040
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845004C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450058
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8450064
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8450070
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845007C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450088
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450094
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84500A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84500AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84500B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84500C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84500D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84500DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84500E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84500F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8450100
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 845010C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450118
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450124
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450130
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845013C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450148
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8450154
	voice_square_2 2, 0, 1, 7, 1

@ WaveMemory 8450160
	voice_programmable_wave_alt ProgrammableWaveData_845541C, 0, 7, 15, 2

@ SquareWave1 845016C
	voice_square_1 0, 2, 0, 1, 7, 1

@ SquareWave2 8450178
	voice_square_2 0, 0, 1, 7, 1

@ SquareWave1 8450184
	voice_square_1 0, 0, 0, 1, 7, 1

@ SquareWave1 8450190
	voice_square_1 0, 0, 0, 0, 7, 1

VoiceGroupTable_845019C: @ 845019C

@ Percussion 845019C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 84501A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84501B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84501C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 84501CC
	voice_square_2 1, 0, 1, 6, 1

@ SquareWave1 84501D8
	voice_square_1 0, 1, 0, 1, 6, 1

@ SquareWave2 84501E4
	voice_square_2 2, 0, 1, 6, 1

@ SquareWave1 84501F0
	voice_square_1 0, 2, 0, 1, 6, 1

@ SquareWave1 84501FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450208
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450214
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450220
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845022C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450238
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450244
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450250
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845025C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450268
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450274
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450280
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845028C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450298
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84502A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84502B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84502BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84502C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84502D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84502E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84502EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84502F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450304
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450310
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845031C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450328
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450334
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450340
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 845034C
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 8450358
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450364
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450370
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845037C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450388
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450394
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84503A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84503AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84503B8
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 216, 0, 165

@ SquareWave1 84503C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84503D0
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 84503DC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 84503E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84503F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450400
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845040C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450418
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450424
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450430
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 845043C
	voice_directsound 60, 0, DirectSoundWaveData_849F40C, 255, 165, 154, 127

@ SquareWave1 8450448
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450454
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450460
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 845046C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8450478
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450484
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450490
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845049C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84504A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84504B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84504C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84504CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84504D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84504E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84504F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84504FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450508
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450514
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450520
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845052C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450538
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450544
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450550
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845055C
	voice_square_1 0, 2, 0, 0, 15, 0

@ WaveMemory 8450568
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 2

@ SquareWave1 8450574
	voice_square_1 0, 3, 0, 1, 9, 1

@ SquareWave1 8450580
	voice_square_1 0, 3, 0, 0, 9, 1

VoiceGroupTable_845058C: @ 845058C

@ Percussion 845058C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8450598
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84505A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84505B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84505BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84505C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84505D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84505E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84505EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84505F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450604
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450610
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845061C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450628
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8450634
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 216, 90, 242

@ SquareWave1 8450640
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845064C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450658
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450664
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450670
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845067C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450688
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450694
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84506A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84506AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84506B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84506C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84506D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84506DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84506E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84506F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450700
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845070C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8450718
	voice_directsound 60, 0, DirectSoundWaveData_8483804, 255, 253, 0, 149

@ SquareWave1 8450724
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450730
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845073C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450748
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450754
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450760
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845076C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450778
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450784
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450790
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845079C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84507A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84507B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84507C0
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 84507CC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 84507D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84507E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84507F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84507FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450808
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450814
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450820
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 845082C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8450838
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450844
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450850
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 845085C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8450868
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450874
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450880
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845088C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450898
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84508A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84508B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84508BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84508C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84508D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84508E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84508EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84508F8
	voice_directsound 60, 0, DirectSoundWaveData_84830A0, 255, 0, 255, 165

@ SquareWave1 8450904
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450910
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845091C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450928
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450934
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450940
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 845094C
	voice_square_2 3, 0, 1, 7, 1

@ SquareWave1 8450958
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450964
	voice_square_1 0, 3, 0, 1, 7, 1

@ SquareWave1 8450970
	voice_square_1 0, 3, 0, 0, 7, 1

@ SquareWave1 845097C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450988
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450994
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84509A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84509AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84509B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84509C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84509D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84509DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84509E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84509F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450A9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450AA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450AB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450AC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450ACC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450AD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450AE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450AF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450AFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450B08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450B14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450B20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450B2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450B38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450B44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450B50
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450B5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450B68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450B74
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8450B80
	voice_directsound 60, 0, DirectSoundWaveData_8460E60, 255, 246, 0, 216

VoiceGroupTable_8450B8C: @ 8450B8C

@ Percussion 8450B8C
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ Key-Split 8450B98
	voice_keysplit VoiceGroupTable_8430204, KeySplitTable_8455224

@ SquareWave1 8450BA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450BB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8450BBC
	voice_square_2 2, 0, 2, 3, 1

@ SquareWave1 8450BC8
	voice_square_1 0, 2, 0, 2, 3, 1

@ SquareWave1 8450BD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450BE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450BEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450BF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450C94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450CA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450CAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450CB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450CC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450CD0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450CDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450CE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450CF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450D00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450D0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8450D18
	voice_directsound 60, 0, DirectSoundWaveData_8483804, 255, 253, 0, 149

@ SquareWave1 8450D24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450D30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450D3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450D48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450D54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450D60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450D6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450D78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450D84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450D90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450D9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450DA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8450DB4
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 246, 0, 235

@ Direct Sound 8450DC0
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 8450DCC
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8450DD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450DE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450DF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450DFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450E08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450E14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450E20
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8450E2C
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 8450E38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450E44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450E50
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8450E5C
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 8450E68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450E74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450E80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450E8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450E98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450EA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450EB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450EBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450EC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450ED4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450EE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450EEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450EF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450F04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450F10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450F1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450F28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450F34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450F40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8450F4C
	voice_square_2 3, 0, 1, 7, 1

@ WaveMemory 8450F58
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 2

@ SquareWave1 8450F64
	voice_square_1 0, 3, 0, 1, 7, 1

@ SquareWave1 8450F70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8450F7C
	voice_square_2 2, 0, 1, 7, 1

@ SquareWave1 8450F88
	voice_square_1 0, 2, 0, 1, 7, 1

@ SquareWave2 8450F94
	voice_square_2 3, 0, 2, 7, 1

VoiceGroupTable_8450FA0: @ 8450FA0

@ Percussion 8450FA0
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8450FAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450FB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450FC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8450FD0
	voice_square_2 2, 0, 2, 3, 1

@ SquareWave1 8450FDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450FE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8450FF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451000
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845100C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451018
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451024
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451030
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845103C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451048
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451054
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451060
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845106C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451078
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451084
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451090
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845109C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84510A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84510B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84510C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84510CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84510D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84510E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84510F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84510FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451108
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451114
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451120
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845112C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451138
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451144
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451150
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845115C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8451168
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 252, 0, 115

@ SquareWave1 8451174
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451180
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845118C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451198
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84511A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84511B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84511BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84511C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84511D4
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 84511E0
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 84511EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84511F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451204
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451210
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845121C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451228
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451234
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8451240
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 845124C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451258
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451264
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8451270
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 845127C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451288
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451294
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84512A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84512AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84512B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84512C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84512D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84512DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84512E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84512F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451300
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845130C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451318
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451324
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451330
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845133C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451348
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451354
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8451360
	voice_square_2 3, 0, 1, 7, 1

@ WaveMemory 845136C
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 2

@ SquareWave1 8451378
	voice_square_1 0, 3, 0, 1, 7, 1

@ SquareWave1 8451384
	voice_square_1 0, 3, 0, 0, 7, 1

VoiceGroupTable_8451390: @ 8451390

@ Percussion 8451390
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 845139C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84513A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84513B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 84513C0
	voice_square_2 0, 1, 1, 7, 1

@ SquareWave1 84513CC
	voice_square_1 0, 0, 1, 1, 7, 1

@ SquareWave1 84513D8
	voice_square_1 0, 0, 0, 0, 7, 1

@ SquareWave1 84513E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84513F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84513FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451408
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451414
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451420
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845142C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451438
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451444
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451450
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845145C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451468
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451474
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451480
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845148C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451498
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84514A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84514B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84514BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84514C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84514D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84514E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84514EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84514F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451504
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451510
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 845151C
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 235, 128, 99

@ SquareWave1 8451528
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451534
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451540
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845154C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451558
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451564
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451570
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845157C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451588
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451594
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84515A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84515AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84515B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84515C4
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 84515D0
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 84515DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84515E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84515F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451600
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845160C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451618
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451624
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8451630
	voice_keysplit VoiceGroupTable_8430258, KeySplitTable_84552B4

@ SquareWave1 845163C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451648
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451654
	voice_square_1 0, 2, 0, 0, 15, 0

@ Key-Split 8451660
	voice_keysplit VoiceGroupTable_8430894, KeySplitTable_8455350

@ SquareWave1 845166C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451678
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451684
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451690
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845169C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84516A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84516B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84516C0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84516CC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84516D8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84516E4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84516F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84516FC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451708
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451714
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451720
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845172C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451738
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451744
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8451750
	voice_square_2 3, 1, 1, 6, 1

@ WaveMemory 845175C
	voice_programmable_wave_alt ProgrammableWaveData_84553DC, 0, 7, 15, 2

@ SquareWave1 8451768
	voice_square_1 0, 3, 1, 1, 6, 1

@ SquareWave1 8451774
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451780
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845178C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451798
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84517A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84517B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84517BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84517C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84517D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84517E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84517EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84517F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451804
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451810
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845181C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451828
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451834
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451840
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845184C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451858
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451864
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451870
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845187C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451888
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451894
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84518A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84518AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84518B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84518C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84518D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84518DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84518E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84518F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451900
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845190C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451918
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451924
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451930
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845193C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451948
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451954
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451960
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845196C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8451978
	voice_directsound 60, 0, DirectSoundWaveData_8460E60, 255, 235, 0, 216

@ Direct Sound 8451984
	voice_directsound 60, 0, DirectSoundWaveData_8460E60, 255, 246, 0, 216

VoiceGroupTable_8451990: @ 8451990

@ Direct Sound 8451990
	voice_directsound 60, 0, DirectSoundWaveData_8486924, 255, 249, 103, 165

@ SquareWave1 845199C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84519A8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84519B4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84519C0
	voice_square_1_alt 0, 2, 0, 2, 0, 0

@ SquareWave1 84519CC
	voice_square_1_alt 0, 0, 0, 2, 0, 1

@ SquareWave1 84519D8
	voice_square_1_alt 0, 2, 0, 4, 0, 1

@ SquareWave1 84519E4
	voice_square_1_alt 44, 2, 0, 4, 0, 0

@ SquareWave1 84519F0
	voice_square_1_alt 38, 0, 0, 4, 0, 0

@ SquareWave1 84519FC
	voice_square_1_alt 0, 0, 0, 7, 0, 0

@ SquareWave1 8451A08
	voice_square_1_alt 0, 2, 2, 0, 15, 0

@ SquareWave1 8451A14
	voice_square_1_alt 0, 1, 2, 0, 15, 0

@ SquareWave1 8451A20
	voice_square_1_alt 23, 1, 0, 1, 9, 0

@ Direct Sound 8451A2C
	voice_directsound 60, 0, DirectSoundWaveData_8487330, 255, 0, 255, 165

@ Direct Sound 8451A38
	voice_directsound 60, 0, DirectSoundWaveData_8487330, 255, 226, 0, 165

@ SquareWave1 8451A44
	voice_square_1_alt 0, 2, 0, 6, 0, 1

@ SquareWave1 8451A50
	voice_square_1_alt 36, 0, 0, 2, 0, 0

@ SquareWave1 8451A5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451A68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451A74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451A80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451A8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451A98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451AA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451AB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451ABC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451AC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451AD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451AE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451AEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451AF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451B94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451BA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451BAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451BB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8451BC4
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 246, 0, 226

@ Key-Split 8451BD0
	voice_keysplit VoiceGroupTable_8430234, KeySplitTable_845526C

@ SquareWave1 8451BDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451BE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451BF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451C9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451CA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451CB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451CC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451CCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451CD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451CE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451CF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451CFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451D08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451D14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451D20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451D2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451D38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451D44
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave2 8451D50
	voice_square_2_alt 3, 0, 1, 0, 1

@ SquareWave1 8451D5C
	voice_square_1_alt 0, 3, 0, 1, 0, 1

@ SquareWave1 8451D68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451D74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451D80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451D8C
	voice_square_1_alt 46, 2, 0, 4, 0, 0

@ SquareWave1 8451D98
	voice_square_1_alt 38, 2, 0, 4, 0, 0

@ SquareWave1 8451DA4
	voice_square_1_alt 119, 2, 0, 0, 15, 1

@ SquareWave1 8451DB0
	voice_square_1_alt 0, 2, 0, 0, 15, 1

@ SquareWave1 8451DBC
	voice_square_1_alt 106, 2, 0, 2, 0, 0

@ SquareWave1 8451DC8
	voice_square_1_alt 23, 2, 0, 1, 9, 0

@ SquareWave1 8451DD4
	voice_square_1_alt 21, 2, 0, 1, 9, 0

@ SquareWave1 8451DE0
	voice_square_1_alt 0, 0, 0, 0, 15, 1

@ SquareWave1 8451DEC
	voice_square_1_alt 47, 2, 0, 2, 6, 0

@ SquareWave1 8451DF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451E94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451EA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451EAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451EB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451EC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451ED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451EDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451EE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451EF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451F00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451F0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8451F18
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 8451F24
	voice_noise 0, 0, 7, 15, 0

@ Noise 8451F30
	voice_noise 0, 2, 7, 15, 0

@ Noise 8451F3C
	voice_noise_alt 0, 2, 0, 15, 0

@ Noise 8451F48
	voice_noise_alt 1, 0, 0, 15, 0

@ Noise 8451F54
	voice_noise_alt 0, 0, 0, 15, 0

@ Noise 8451F60
	voice_noise_alt 0, 0, 3, 0, 0

@ Noise 8451F6C
	voice_noise_alt 0, 0, 2, 0, 0

@ Noise 8451F78
	voice_noise_alt 0, 0, 1, 0, 0

@ Noise 8451F84
	voice_noise_alt 0, 0, 1, 0, 1

VoiceGroupTable_8451F90: @ 8451F90

@ Direct Sound 8451F90
	voice_directsound_no_resample 60, 0, DirectSoundWaveData_8488F44, 255, 249, 0, 165

@ Direct Sound 8451F9C
	voice_directsound_alt 60, 0, DirectSoundWaveData_8488F44, 255, 0, 255, 165

@ Direct Sound 8451FA8
	voice_directsound 60, 0, DirectSoundWaveData_8486924, 255, 0, 255, 165

@ Direct Sound 8451FB4
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 255, 242, 0, 127

@ Noise 8451FC0
	voice_noise_alt 0, 0, 1, 0, 1

@ Noise 8451FCC
	voice_noise_alt 1, 0, 1, 0, 1

@ Direct Sound 8451FD8
	voice_directsound 60, 0, DirectSoundWaveData_8459944, 255, 0, 255, 165

@ SquareWave1 8451FE4
	voice_square_1_alt 0, 2, 0, 2, 0, 1

@ Direct Sound 8451FF0
	voice_directsound 60, 0, DirectSoundWaveData_848A8A4, 255, 0, 255, 165

@ Direct Sound 8451FFC
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 0, 255, 127

@ Direct Sound 8452008
	voice_directsound 60, 0, DirectSoundWaveData_848C4A4, 255, 0, 255, 127

@ Noise 8452014
	voice_noise_alt 1, 0, 2, 0, 0

@ SquareWave1 8452020
	voice_square_1 0x67, 3, 2, 7, 0, 0

@ SquareWave2 845202C
	voice_square_2 3, 2, 7, 0, 0

@ Direct Sound 8452038
	voice_directsound 60, 0, DirectSoundWaveData_8487330, 255, 226, 0, 127

@ Direct Sound 8452044
	voice_directsound 60, 0, DirectSoundWaveData_848E094, 255, 0, 255, 0

@ Direct Sound 8452050
	voice_directsound 60, 0, DirectSoundWaveData_8487330, 255, 204, 0, 127

@ SquareWave1 845205C
	voice_square_1_alt 0, 2, 0, 2, 0, 1

@ Direct Sound 8452068
	voice_directsound 60, 0, DirectSoundWaveData_848F448, 255, 0, 255, 127

@ Direct Sound 8452074
	voice_directsound 60, 0, DirectSoundWaveData_8487330, 255, 0, 255, 127

@ SquareWave1 8452080
	voice_square_1 103, 0, 0, 7, 0, 0

@ Direct Sound 845208C
	voice_directsound 60, 0, DirectSoundWaveData_845C238, 255, 0, 255, 127

@ Direct Sound 8452098
	voice_directsound 60, 0, DirectSoundWaveData_8491ACC, 255, 0, 255, 127

@ Direct Sound 84520A4
	voice_directsound 60, 0, DirectSoundWaveData_8492D10, 255, 0, 255, 127

@ Direct Sound 84520B0
	voice_directsound 60, 0, DirectSoundWaveData_845B2B4, 255, 0, 255, 127

@ Noise 84520BC
	voice_noise_alt 0, 0, 7, 15, 1

@ Direct Sound 84520C8
	voice_directsound 60, 0, DirectSoundWaveData_8493D20, 255, 0, 255, 127

@ Noise 84520D4
	voice_noise_alt 1, 0, 7, 15, 1

@ Direct Sound 84520E0
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 255, 246, 0, 127

@ Direct Sound 84520EC
	voice_directsound 60, 0, DirectSoundWaveData_8495028, 255, 0, 255, 127

@ SquareWave1 84520F8
	voice_square_1_alt 19, 2, 0, 2, 0, 0

@ Direct Sound 8452104
	voice_directsound 60, 0, DirectSoundWaveData_8497134, 255, 0, 255, 127

@ SquareWave1 8452110
	voice_square_1 103, 0, 0, 0, 15, 0

@ Direct Sound 845211C
	voice_directsound_alt 60, 0, DirectSoundWaveData_8495028, 255, 0, 255, 127

@ Direct Sound 8452128
	voice_directsound 60, 0, DirectSoundWaveData_84571CC, 255, 255, 255, 127

@ Direct Sound 8452134
	voice_directsound 60, 0, DirectSoundWaveData_8458CD0, 255, 0, 255, 127

@ Direct Sound 8452140
	voice_directsound 60, 0, DirectSoundWaveData_8499110, 255, 0, 255, 127

@ Direct Sound 845214C
	voice_directsound 60, 0, DirectSoundWaveData_8497134, 255, 242, 0, 0

@ Direct Sound 8452158
	voice_directsound 60, 0, DirectSoundWaveData_849B320, 255, 0, 255, 0

@ Direct Sound 8452164
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 165, 90, 216

@ Direct Sound 8452170
	voice_directsound 60, 0, DirectSoundWaveData_845DAF0, 255, 127, 0, 188

@ Direct Sound 845217C
	voice_directsound 60, 0, DirectSoundWaveData_849D45C, 255, 249, 0, 165

@ SquareWave1 8452188
	voice_square_1 0, 0, 4, 6, 0, 0

@ Direct Sound 8452194
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 13, 0, 255, 127

@ Direct Sound 84521A0
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 13, 0, 255, 127

@ Direct Sound 84521AC
	voice_directsound 60, 0, DirectSoundWaveData_849F40C, 255, 0, 255, 127

@ Direct Sound 84521B8
	voice_directsound 60, 0, DirectSoundWaveData_84A26EC, 255, 252, 0, 204

@ SquareWave1 84521C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84521D0
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 235, 0, 204

@ SquareWave1 84521DC
	voice_square_1 0, 0, 4, 0, 15, 0

@ Direct Sound 84521E8
	voice_directsound 60, 0, DirectSoundWaveData_84A311C, 255, 188, 0, 0

@ Direct Sound 84521F4
	voice_directsound 60, 0, DirectSoundWaveData_849BAEC, 255, 226, 0, 127

@ Direct Sound 8452200
	voice_directsound 60, 0, DirectSoundWaveData_8460E60, 26, 0, 255, 127

@ SquareWave1 845220C
	voice_square_1_alt 0, 2, 0, 1, 0, 0

@ Direct Sound 8452218
	voice_directsound 60, 0, DirectSoundWaveData_8456330, 255, 252, 0, 127

@ SquareWave1 8452224
	voice_square_1_alt 0, 1, 0, 2, 0, 0

@ Direct Sound 8452230
	voice_directsound 60, 0, DirectSoundWaveData_848BD68, 255, 127, 0, 127

@ Noise 845223C
	voice_noise_alt 0, 1, 6, 0, 0

@ Direct Sound 8452248
	voice_directsound 60, 0, DirectSoundWaveData_8457D98, 255, 255, 255, 127

@ Direct Sound 8452254
	voice_directsound 60, 0, DirectSoundWaveData_845B9A8, 255, 255, 255, 127

@ Direct Sound 8452260
	voice_directsound 60, 0, DirectSoundWaveData_84A3B50, 255, 255, 255, 127

@ Direct Sound 845226C
	voice_directsound 60, 0, DirectSoundWaveData_847CBAC, 11, 242, 0, 127

@ SquareWave1 8452278
	voice_square_1_alt 0, 2, 4, 6, 0, 0

@ Direct Sound 8452284
	voice_directsound 60, 0, DirectSoundWaveData_84A5690, 255, 255, 255, 127

@ Direct Sound 8452290
	voice_directsound 60, 0, DirectSoundWaveData_84A5F58, 255, 0, 255, 165

@ Direct Sound 845229C
	voice_directsound 60, 0, DirectSoundWaveData_845CAB0, 255, 0, 255, 165

@ Noise 84522A8
	voice_noise_alt 0, 5, 7, 15, 1

@ Direct Sound 84522B4
	voice_directsound 60, 0, DirectSoundWaveData_8487330, 128, 242, 0, 165

@ Direct Sound 84522C0
	voice_directsound 60, 0, DirectSoundWaveData_846A4B8, 255, 0, 255, 165

@ SquareWave1 84522CC
	voice_square_1 0, 0, 1, 5, 0, 0

@ Noise 84522D8
	voice_noise_alt 0, 6, 6, 0, 1

@ Noise 84522E4
	voice_noise_alt 0, 3, 6, 0, 1

@ SquareWave1 84522F0
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 84522FC
	voice_directsound 60, 0, DirectSoundWaveData_8497134, 15, 127, 231, 127

@ SquareWave1 8452308
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452314
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452320
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845232C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452338
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452344
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452350
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845235C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452368
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452374
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452380
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845238C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452398
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84523A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84523B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84523BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84523C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84523D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84523E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84523EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84523F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452404
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452410
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845241C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452428
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452434
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452440
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845244C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452458
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452464
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452470
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845247C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452488
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452494
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84524A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84524AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84524B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84524C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84524D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84524DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84524E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84524F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452500
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845250C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452518
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452524
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8452530
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845253C
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8452548
	voice_directsound 60, 0, DirectSoundWaveData_84A7328, 255, 0, 255, 165

@ Direct Sound 8452554
	voice_directsound 60, 0, DirectSoundWaveData_84A7F38, 255, 0, 255, 165

@ Direct Sound 8452560
	voice_directsound 60, 0, DirectSoundWaveData_84A8AC8, 255, 0, 255, 165

@ Direct Sound 845256C
	voice_directsound 60, 0, DirectSoundWaveData_84A9564, 255, 0, 255, 165

@ Direct Sound 8452578
	voice_directsound 60, 0, DirectSoundWaveData_84A9EAC, 255, 0, 255, 165

@ Direct Sound 8452584
	voice_directsound 60, 0, DirectSoundWaveData_84AA8F4, 255, 0, 255, 165

gUnknown_08452590:: @ 8452590
	.incbin "baserom.gba", 0x00452590, 0x600

gUnknown_08452B90:: @ 8452B90
	.incbin "baserom.gba", 0x00452b90, 0x600

gUnknown_08453190:: @ 8453190
	.incbin "baserom.gba", 0x00453190, 0x600

gUnknown_08453790:: @ 8453790
	.incbin "baserom.gba", 0x00453790, 0x30

gUnknown_084537C0:: @ 84537C0
	.incbin "baserom.gba", 0x004537c0, 0x600

gUnknown_08453DC0:: @ 8453DC0
	.incbin "baserom.gba", 0x00453dc0, 0x600

gUnknown_084543C0:: @ 84543C0
	.incbin "baserom.gba", 0x004543c0, 0x600

gUnknown_084549C0:: @ 84549C0
	.incbin "baserom.gba", 0x004549c0, 0x30

VoiceGroupTable_84549F0: @ 84549F0

@ Direct Sound 84549F0
	voice_directsound 60, 0, DirectSoundWaveData_8639898, 255, 0, 255, 0

@ Direct Sound 84549FC
	voice_directsound 60, 0, DirectSoundWaveData_8639EF8, 255, 0, 255, 0

@ Direct Sound 8454A08
	voice_directsound 60, 0, DirectSoundWaveData_863A3DC, 255, 0, 255, 0

@ Direct Sound 8454A14
	voice_directsound 60, 0, DirectSoundWaveData_863AD2C, 255, 0, 255, 0

@ Direct Sound 8454A20
	voice_directsound 60, 0, DirectSoundWaveData_863B79C, 255, 0, 255, 0

@ Direct Sound 8454A2C
	voice_directsound 60, 0, DirectSoundWaveData_863BABC, 255, 0, 255, 0

@ Direct Sound 8454A38
	voice_directsound 60, 0, DirectSoundWaveData_863C744, 255, 0, 255, 0

@ Direct Sound 8454A44
	voice_directsound 60, 0, DirectSoundWaveData_863CD64, 255, 0, 255, 0

@ Direct Sound 8454A50
	voice_directsound 60, 0, DirectSoundWaveData_863D0EC, 255, 0, 255, 0

@ Direct Sound 8454A5C
	voice_directsound 60, 0, DirectSoundWaveData_863DED0, 255, 0, 255, 0

@ Direct Sound 8454A68
	voice_directsound 60, 0, DirectSoundWaveData_863E840, 255, 0, 255, 0

@ Direct Sound 8454A74
	voice_directsound 60, 0, DirectSoundWaveData_863EBDC, 255, 0, 255, 0

@ Direct Sound 8454A80
	voice_directsound 60, 0, DirectSoundWaveData_863F390, 255, 0, 255, 0

@ Direct Sound 8454A8C
	voice_directsound 60, 0, DirectSoundWaveData_86400EC, 255, 0, 255, 0

@ Direct Sound 8454A98
	voice_directsound 60, 0, DirectSoundWaveData_8640330, 255, 0, 255, 0

@ Direct Sound 8454AA4
	voice_directsound 60, 0, DirectSoundWaveData_8641170, 255, 0, 255, 0

@ Direct Sound 8454AB0
	voice_directsound 60, 0, DirectSoundWaveData_8641AC4, 255, 0, 255, 0

@ Direct Sound 8454ABC
	voice_directsound 60, 0, DirectSoundWaveData_8641E18, 255, 0, 255, 0

@ Direct Sound 8454AC8
	voice_directsound 60, 0, DirectSoundWaveData_864244C, 255, 0, 255, 0

@ Direct Sound 8454AD4
	voice_directsound 60, 0, DirectSoundWaveData_86430B8, 255, 0, 255, 0

@ Direct Sound 8454AE0
	voice_directsound 60, 0, DirectSoundWaveData_8643650, 255, 0, 255, 0

@ Direct Sound 8454AEC
	voice_directsound 60, 0, DirectSoundWaveData_8644154, 255, 0, 255, 0

@ Direct Sound 8454AF8
	voice_directsound 60, 0, DirectSoundWaveData_8644758, 255, 0, 255, 0

@ Direct Sound 8454B04
	voice_directsound 60, 0, DirectSoundWaveData_8644950, 255, 0, 255, 0

@ Direct Sound 8454B10
	voice_directsound 60, 0, DirectSoundWaveData_86452B4, 255, 0, 255, 0

@ Direct Sound 8454B1C
	voice_directsound 60, 0, DirectSoundWaveData_8646240, 255, 0, 255, 0

@ Direct Sound 8454B28
	voice_directsound 60, 0, DirectSoundWaveData_8646878, 255, 0, 255, 0

@ Direct Sound 8454B34
	voice_directsound 60, 0, DirectSoundWaveData_864734C, 255, 0, 255, 0

@ Direct Sound 8454B40
	voice_directsound 60, 0, DirectSoundWaveData_8648290, 255, 0, 255, 0

@ Direct Sound 8454B4C
	voice_directsound 60, 0, DirectSoundWaveData_8648808, 255, 0, 255, 0

@ Direct Sound 8454B58
	voice_directsound 60, 0, DirectSoundWaveData_8649654, 255, 0, 255, 0

@ Direct Sound 8454B64
	voice_directsound 60, 0, DirectSoundWaveData_864A55C, 255, 0, 255, 0

@ Direct Sound 8454B70
	voice_directsound 60, 0, DirectSoundWaveData_864B030, 255, 0, 255, 0

@ Direct Sound 8454B7C
	voice_directsound 60, 0, DirectSoundWaveData_864BBC4, 255, 0, 255, 0

@ Direct Sound 8454B88
	voice_directsound 60, 0, DirectSoundWaveData_864C59C, 255, 0, 255, 0

@ Direct Sound 8454B94
	voice_directsound 60, 0, DirectSoundWaveData_864CBDC, 255, 0, 255, 0

@ Direct Sound 8454BA0
	voice_directsound 60, 0, DirectSoundWaveData_864D6BC, 255, 0, 255, 0

@ Direct Sound 8454BAC
	voice_directsound 60, 0, DirectSoundWaveData_864DCF8, 255, 0, 255, 0

@ Direct Sound 8454BB8
	voice_directsound 60, 0, DirectSoundWaveData_864E410, 255, 0, 255, 0

@ Direct Sound 8454BC4
	voice_directsound 60, 0, DirectSoundWaveData_864ED4C, 255, 0, 255, 0

@ Direct Sound 8454BD0
	voice_directsound 60, 0, DirectSoundWaveData_864F508, 255, 0, 255, 0

@ Direct Sound 8454BDC
	voice_directsound 60, 0, DirectSoundWaveData_864FA6C, 255, 0, 255, 0

@ Direct Sound 8454BE8
	voice_directsound 60, 0, DirectSoundWaveData_86507E0, 255, 0, 255, 0

@ Direct Sound 8454BF4
	voice_directsound 60, 0, DirectSoundWaveData_8650C5C, 255, 0, 255, 0

@ Direct Sound 8454C00
	voice_directsound 60, 0, DirectSoundWaveData_8651148, 255, 0, 255, 0

@ Direct Sound 8454C0C
	voice_directsound 60, 0, DirectSoundWaveData_8651910, 255, 0, 255, 0

@ Direct Sound 8454C18
	voice_directsound 60, 0, DirectSoundWaveData_865250C, 255, 0, 255, 0

@ Direct Sound 8454C24
	voice_directsound 60, 0, DirectSoundWaveData_8652884, 255, 0, 255, 0

@ Direct Sound 8454C30
	voice_directsound 60, 0, DirectSoundWaveData_8653040, 255, 0, 255, 0

@ Direct Sound 8454C3C
	voice_directsound 60, 0, DirectSoundWaveData_8653CA4, 255, 0, 255, 0

@ Direct Sound 8454C48
	voice_directsound 60, 0, DirectSoundWaveData_8654170, 255, 0, 255, 0

VoiceGroupTable_8454C54: @ 8454C54

@ Percussion 8454C54
	.byte 0x80, 0, 0, 0
	.4byte VoiceGroupTable_842FEF8
	.4byte 0x00000000

@ SquareWave1 8454C60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454C6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454C78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454C84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454C90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454C9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454CA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454CB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454CC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454CCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454CD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454CE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454CF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454CFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454D08
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454D14
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454D20
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454D2C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454D38
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454D44
	voice_square_1 0, 2, 0, 0, 15, 0

@ Direct Sound 8454D50
	voice_directsound 60, 0, DirectSoundWaveData_8654C20, 255, 249, 25, 248

@ SquareWave1 8454D5C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454D68
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454D74
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454D80
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454D8C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454D98
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454DA4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454DB0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454DBC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454DC8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454DD4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454DE0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454DEC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454DF8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E04
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E10
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E1C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E28
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E34
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E40
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E4C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E58
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E64
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E70
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E7C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E88
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454E94
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454EA0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454EAC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454EB8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454EC4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454ED0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454EDC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454EE8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454EF4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F00
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F0C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F18
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F24
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F30
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F3C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F48
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F54
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F60
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F6C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F78
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F84
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F90
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454F9C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454FA8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454FB4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454FC0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454FCC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454FD8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454FE4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454FF0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8454FFC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455008
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455014
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455020
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845502C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455038
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455044
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455050
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845505C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455068
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455074
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455080
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845508C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455098
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84550A4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84550B0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84550BC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84550C8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84550D4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84550E0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84550EC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84550F8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455104
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455110
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845511C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455128
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455134
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455140
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845514C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455158
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455164
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455170
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845517C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455188
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455194
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84551A0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84551AC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84551B8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84551C4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84551D0
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84551DC
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84551E8
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 84551F4
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455200
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 845520C
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455218
	voice_square_1 0, 2, 0, 0, 15, 0

KeySplitTable_8455224: @ 8455224
@ SquareWave1 8455224
	voice_square_1 0, 2, 0, 0, 15, 0

@ SquareWave1 8455230
	voice_square_1 0, 2, 0, 0, 15, 0

@ Noise 845523C
	voice_noise_alt 0, 0, 1, 7, 1

	.incbin "baserom.gba", 0x00455248, 0x24

KeySplitTable_845526C: @ 845526C
	.incbin "data/music/key_split_tables/845526C.bin"

KeySplitTable_84552B4: @ 84552B4
	.incbin "data/music/key_split_tables/84552B4.bin"

KeySplitTable_8455308: @ 8455308
	.incbin "data/music/key_split_tables/8455308.bin"

KeySplitTable_8455350: @ 8455350
	.incbin "data/music/key_split_tables/8455350.bin"

ProgrammableWaveData_84553BC: @ 84553BC
	.incbin "data/music/programmable_wave_samples/84553BC.pcm"

ProgrammableWaveData_84553CC: @ 84553CC
	.incbin "data/music/programmable_wave_samples/84553CC.pcm"

ProgrammableWaveData_84553DC: @ 84553DC
	.incbin "data/music/programmable_wave_samples/84553DC.pcm"

ProgrammableWaveData_84553EC: @ 84553EC
	.incbin "data/music/programmable_wave_samples/84553EC.pcm"

ProgrammableWaveData_84553FC: @ 84553FC
	.incbin "data/music/programmable_wave_samples/84553FC.pcm"

ProgrammableWaveData_845540C: @ 845540C
	.incbin "data/music/programmable_wave_samples/845540C.pcm"

ProgrammableWaveData_845541C: @ 845541C
	.incbin "data/music/programmable_wave_samples/845541C.pcm"

ProgrammableWaveData_845542C: @ 845542C
	.incbin "data/music/programmable_wave_samples/845542C.pcm"

ProgrammableWaveData_845543C: @ 845543C
	.incbin "data/music/programmable_wave_samples/845543C.pcm"

ProgrammableWaveData_845544C: @ 845544C
	.incbin "data/music/programmable_wave_samples/845544C.pcm"

gMPlayTable:: @ 845545C
	.incbin "baserom.gba", 0x0045545c, 0x30

	.include "data/music/music_pointers.s" @ 845548C

BlankMusic_Header: @ 845632C
	.byte 0 @ number of tracks
	.byte 0, 0, 0 @ unknown

DirectSoundWaveData_8456330: @ 8456330
	.4byte 0x40000000
	.4byte 0x344300
	.4byte 0x2bb
	.4byte 0x692
	.incbin "data/music/direct_sound_samples/8456330.pcm"
	.align 2

DirectSoundWaveData_84569D4: @ 84569D4
	.4byte 0x40000000
	.4byte 0x688600
	.4byte 0x47e
	.4byte 0x7e7
	.incbin "data/music/direct_sound_samples/84569D4.pcm"
	.align 2

DirectSoundWaveData_84571CC: @ 84571CC
	.4byte 0x40000000
	.4byte 0x3443000
	.4byte 0x482
	.4byte 0xbb8
	.incbin "data/music/direct_sound_samples/84571CC.pcm"
	.align 2

DirectSoundWaveData_8457D98: @ 8457D98
	.4byte 0x40000000
	.4byte 0x2b11000
	.4byte 0x9dc
	.4byte 0xf26
	.incbin "data/music/direct_sound_samples/8457D98.pcm"
	.align 2

DirectSoundWaveData_8458CD0: @ 8458CD0
	.4byte 0x40000000
	.4byte 0x1588800
	.4byte 0x71a
	.4byte 0xc61
	.incbin "data/music/direct_sound_samples/8458CD0.pcm"
	.align 2

DirectSoundWaveData_8459944: @ 8459944
	.4byte 0x40000000
	.4byte 0x1a21800
	.4byte 0xed5
	.4byte 0x14bd
	.incbin "data/music/direct_sound_samples/8459944.pcm"
	.align 2

DirectSoundWaveData_845AE14: @ 845AE14
	.4byte 0x0
	.4byte 0xd10c00
	.4byte 0x0
	.4byte 0x48e
	.incbin "data/music/direct_sound_samples/845AE14.pcm"
	.align 2

DirectSoundWaveData_845B2B4: @ 845B2B4
	.4byte 0x0
	.4byte 0xac4400
	.4byte 0x0
	.4byte 0x6e1
	.incbin "data/music/direct_sound_samples/845B2B4.pcm"
	.align 2

DirectSoundWaveData_845B9A8: @ 845B9A8
	.4byte 0x0
	.4byte 0xd10c00
	.4byte 0x0
	.4byte 0x87f
	.incbin "data/music/direct_sound_samples/845B9A8.pcm"
	.align 2

DirectSoundWaveData_845C238: @ 845C238
	.4byte 0x0
	.4byte 0xd10c00
	.4byte 0x0
	.4byte 0x864
	.incbin "data/music/direct_sound_samples/845C238.pcm"
	.align 2

DirectSoundWaveData_845CAB0: @ 845CAB0
	.4byte 0x40000000
	.4byte 0xac4400
	.4byte 0x8c6
	.4byte 0x102d
	.incbin "data/music/direct_sound_samples/845CAB0.pcm"
	.align 2

DirectSoundWaveData_845DAF0: @ 845DAF0
	.4byte 0x0
	.4byte 0xd10c00
	.4byte 0x0
	.4byte 0x400
	.incbin "data/music/direct_sound_samples/845DAF0.pcm"
	.align 2

DirectSoundWaveData_845DF04: @ 845DF04
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0x8c7
	.4byte 0xe1d
	.incbin "data/music/direct_sound_samples/845DF04.pcm"
	.align 2

DirectSoundWaveData_845ED34: @ 845ED34
	.4byte 0x40000000
	.4byte 0xac4400
	.4byte 0xa45
	.4byte 0xf83
	.incbin "data/music/direct_sound_samples/845ED34.pcm"
	.align 2

DirectSoundWaveData_845FCC8: @ 845FCC8
	.4byte 0x0
	.4byte 0xd10c00
	.4byte 0x0
	.4byte 0x8a3
	.incbin "data/music/direct_sound_samples/845FCC8.pcm"
	.align 2

DirectSoundWaveData_846057C: @ 846057C
	.4byte 0x40000000
	.4byte 0xac4400
	.4byte 0x628
	.4byte 0x8d1
	.incbin "data/music/direct_sound_samples/846057C.pcm"
	.align 2

DirectSoundWaveData_8460E60: @ 8460E60
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0x8d5
	.4byte 0xf18
	.incbin "data/music/direct_sound_samples/8460E60.pcm"
	.align 2

DirectSoundWaveData_8461D8C: @ 8461D8C
	.4byte 0x0
	.4byte 0xd10c00
	.4byte 0x0
	.4byte 0x507
	.incbin "data/music/direct_sound_samples/8461D8C.pcm"
	.align 2

DirectSoundWaveData_84622A4: @ 84622A4
	.4byte 0x0
	.4byte 0xd10c00
	.4byte 0x0
	.4byte 0x5b7
	.incbin "data/music/direct_sound_samples/84622A4.pcm"
	.align 2

DirectSoundWaveData_846286C: @ 846286C
	.4byte 0x40000000
	.4byte 0x1a21800
	.4byte 0x9b4
	.4byte 0xf4c
	.incbin "data/music/direct_sound_samples/846286C.pcm"
	.align 2

DirectSoundWaveData_84637CC: @ 84637CC
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0xc50
	.4byte 0x164d
	.incbin "data/music/direct_sound_samples/84637CC.pcm"
	.align 2

DirectSoundWaveData_8464E2C: @ 8464E2C
	.4byte 0x40000000
	.4byte 0x688600
	.4byte 0xae8
	.4byte 0x1549
	.incbin "data/music/direct_sound_samples/8464E2C.pcm"
	.align 2

DirectSoundWaveData_8466388: @ 8466388
	.4byte 0x40000000
	.4byte 0x1a2180
	.4byte 0x600
	.4byte 0xb79
	.incbin "data/music/direct_sound_samples/8466388.pcm"
	.align 2

DirectSoundWaveData_8466F14: @ 8466F14
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0x10cd
	.4byte 0x3593
	.incbin "data/music/direct_sound_samples/8466F14.pcm"
	.align 2

DirectSoundWaveData_846A4B8: @ 846A4B8
	.4byte 0x40000000
	.4byte 0x688600
	.4byte 0x1151
	.4byte 0x230a
	.incbin "data/music/direct_sound_samples/846A4B8.pcm"
	.align 2

DirectSoundWaveData_846C7D4: @ 846C7D4
	.4byte 0x40000000
	.4byte 0x344300
	.4byte 0x1f9b
	.4byte 0x36b8
	.incbin "data/music/direct_sound_samples/846C7D4.pcm"
	.align 2

DirectSoundWaveData_846FEA0: @ 846FEA0
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0xf0b
	.4byte 0x133d
	.incbin "data/music/direct_sound_samples/846FEA0.pcm"
	.align 2

DirectSoundWaveData_84711F0: @ 84711F0
	.4byte 0x40000000
	.4byte 0x688600
	.4byte 0xe34
	.4byte 0x14fe
	.incbin "data/music/direct_sound_samples/84711F0.pcm"
	.align 2

DirectSoundWaveData_8472700: @ 8472700
	.4byte 0x40000000
	.4byte 0x344300
	.4byte 0x121a
	.4byte 0x140c
	.incbin "data/music/direct_sound_samples/8472700.pcm"
	.align 2

DirectSoundWaveData_8473B20: @ 8473B20
	.4byte 0x40000000
	.4byte 0x2b11000
	.4byte 0xe8c
	.4byte 0x1088
	.incbin "data/music/direct_sound_samples/8473B20.pcm"
	.align 2

DirectSoundWaveData_8474BBC: @ 8474BBC
	.4byte 0x40000000
	.4byte 0x1588800
	.4byte 0x75d
	.4byte 0x1048
	.incbin "data/music/direct_sound_samples/8474BBC.pcm"
	.align 2

DirectSoundWaveData_8475C18: @ 8475C18
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0x216e
	.4byte 0x6f83
	.incbin "data/music/direct_sound_samples/8475C18.pcm"
	.align 2

DirectSoundWaveData_847CBAC: @ 847CBAC
	.4byte 0x40000000
	.4byte 0x688600
	.4byte 0x2624
	.4byte 0x4571
	.incbin "data/music/direct_sound_samples/847CBAC.pcm"
	.align 2

DirectSoundWaveData_8481130: @ 8481130
	.4byte 0x40000000
	.4byte 0x688600
	.4byte 0x1693
	.4byte 0x1f5d
	.incbin "data/music/direct_sound_samples/8481130.pcm"
	.align 2

DirectSoundWaveData_84830A0: @ 84830A0
	.4byte 0x40000000
	.4byte 0x344300
	.4byte 0x520
	.4byte 0x752
	.incbin "data/music/direct_sound_samples/84830A0.pcm"
	.align 2

DirectSoundWaveData_8483804: @ 8483804
	.4byte 0x40000000
	.4byte 0x3443000
	.4byte 0x1037
	.4byte 0x1c3d
	.incbin "data/music/direct_sound_samples/8483804.pcm"
	.align 2

DirectSoundWaveData_8485454: @ 8485454
	.4byte 0x40000000
	.4byte 0x1a21800
	.4byte 0xed5
	.4byte 0x14bd
	.incbin "data/music/direct_sound_samples/8485454.pcm"
	.align 2

DirectSoundWaveData_8486924: @ 8486924
	.4byte 0x40000000
	.4byte 0xac4400
	.4byte 0x667
	.4byte 0x9fa
	.incbin "data/music/direct_sound_samples/8486924.pcm"
	.align 2

DirectSoundWaveData_8487330: @ 8487330
	.4byte 0x40000000
	.4byte 0x688600
	.4byte 0xcb1
	.4byte 0x1c03
	.incbin "data/music/direct_sound_samples/8487330.pcm"
	.align 2

DirectSoundWaveData_8488F44: @ 8488F44
	.4byte 0x0
	.4byte 0xd10c00
	.4byte 0x0
	.4byte 0x194e
	.incbin "data/music/direct_sound_samples/8488F44.pcm"
	.align 2

DirectSoundWaveData_848A8A4: @ 848A8A4
	.4byte 0x0
	.4byte 0xd10c00
	.4byte 0x0
	.4byte 0x14b3
	.incbin "data/music/direct_sound_samples/848A8A4.pcm"
	.align 2

DirectSoundWaveData_848BD68: @ 848BD68
	.4byte 0x40000000
	.4byte 0x688600
	.4byte 0x309
	.4byte 0x728
	.incbin "data/music/direct_sound_samples/848BD68.pcm"
	.align 2

DirectSoundWaveData_848C4A4: @ 848C4A4
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0x0
	.4byte 0x1bdf
	.incbin "data/music/direct_sound_samples/848C4A4.pcm"
	.align 2

DirectSoundWaveData_848E094: @ 848E094
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0x0
	.4byte 0x13a2
	.incbin "data/music/direct_sound_samples/848E094.pcm"
	.align 2

DirectSoundWaveData_848F448: @ 848F448
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0x1998
	.4byte 0x2670
	.incbin "data/music/direct_sound_samples/848F448.pcm"
	.align 2

DirectSoundWaveData_8491ACC: @ 8491ACC
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0x8c6
	.4byte 0x1231
	.incbin "data/music/direct_sound_samples/8491ACC.pcm"
	.align 2

DirectSoundWaveData_8492D10: @ 8492D10
	.4byte 0x0
	.4byte 0xd10c00
	.4byte 0x0
	.4byte 0xfff
	.incbin "data/music/direct_sound_samples/8492D10.pcm"
	.align 2

DirectSoundWaveData_8493D20: @ 8493D20
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0x2cd
	.4byte 0x12f4
	.incbin "data/music/direct_sound_samples/8493D20.pcm"
	.align 2

DirectSoundWaveData_8495028: @ 8495028
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0x67c
	.4byte 0x20f8
	.incbin "data/music/direct_sound_samples/8495028.pcm"
	.align 2

DirectSoundWaveData_8497134: @ 8497134
	.4byte 0x40000000
	.4byte 0x688600
	.4byte 0x1a98
	.4byte 0x1fca
	.incbin "data/music/direct_sound_samples/8497134.pcm"
	.align 2

DirectSoundWaveData_8499110: @ 8499110
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0xb45
	.4byte 0x21ff
	.incbin "data/music/direct_sound_samples/8499110.pcm"
	.align 2

DirectSoundWaveData_849B320: @ 849B320
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0xd5
	.4byte 0x7ba
	.incbin "data/music/direct_sound_samples/849B320.pcm"
	.align 2

DirectSoundWaveData_849BAEC: @ 849BAEC
	.4byte 0x40000000
	.4byte 0x688600
	.4byte 0x107a
	.4byte 0x195f
	.incbin "data/music/direct_sound_samples/849BAEC.pcm"
	.align 2

DirectSoundWaveData_849D45C: @ 849D45C
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0xc79
	.4byte 0x1f9c
	.incbin "data/music/direct_sound_samples/849D45C.pcm"
	.align 2

DirectSoundWaveData_849F40C: @ 849F40C
	.4byte 0x40000000
	.4byte 0x1a21800
	.4byte 0x1577
	.4byte 0x32ce
	.incbin "data/music/direct_sound_samples/849F40C.pcm"
	.align 2

DirectSoundWaveData_84A26EC: @ 84A26EC
	.4byte 0x40000000
	.4byte 0x344300
	.4byte 0x461
	.4byte 0xa1f
	.incbin "data/music/direct_sound_samples/84A26EC.pcm"
	.align 2

DirectSoundWaveData_84A311C: @ 84A311C
	.4byte 0x40000000
	.4byte 0x344300
	.4byte 0x5b1
	.4byte 0xa22
	.incbin "data/music/direct_sound_samples/84A311C.pcm"
	.align 2

DirectSoundWaveData_84A3B50: @ 84A3B50
	.4byte 0x40000000
	.4byte 0xd10c00
	.4byte 0xb87
	.4byte 0x1b2c
	.incbin "data/music/direct_sound_samples/84A3B50.pcm"
	.align 2

DirectSoundWaveData_84A5690: @ 84A5690
	.4byte 0x40000000
	.4byte 0xac4400
	.4byte 0x0
	.4byte 0x8b7
	.incbin "data/music/direct_sound_samples/84A5690.pcm"
	.align 2

DirectSoundWaveData_84A5F58: @ 84A5F58
	.4byte 0x40000000
	.4byte 0x688600
	.4byte 0x7c2
	.4byte 0x13be
	.incbin "data/music/direct_sound_samples/84A5F58.pcm"
	.align 2

DirectSoundWaveData_84A7328: @ 84A7328
	.4byte 0x40000000
	.4byte 0xa44000
	.4byte 0x628
	.4byte 0xbff
	.incbin "data/music/direct_sound_samples/84A7328.pcm"
	.align 2

DirectSoundWaveData_84A7F38: @ 84A7F38
	.4byte 0x40000000
	.4byte 0xa44000
	.4byte 0x54d
	.4byte 0xb7e
	.incbin "data/music/direct_sound_samples/84A7F38.pcm"
	.align 2

DirectSoundWaveData_84A8AC8: @ 84A8AC8
	.4byte 0x40000000
	.4byte 0xa44000
	.4byte 0x4cd
	.4byte 0xa8b
	.incbin "data/music/direct_sound_samples/84A8AC8.pcm"
	.align 2

DirectSoundWaveData_84A9564: @ 84A9564
	.4byte 0x40000000
	.4byte 0xa44000
	.4byte 0x48a
	.4byte 0x937
	.incbin "data/music/direct_sound_samples/84A9564.pcm"
	.align 2

DirectSoundWaveData_84A9EAC: @ 84A9EAC
	.4byte 0x40000000
	.4byte 0xa44000
	.4byte 0x56b
	.4byte 0xa36
	.incbin "data/music/direct_sound_samples/84A9EAC.pcm"
	.align 2

DirectSoundWaveData_84AA8F4: @ 84AA8F4
	.4byte 0x40000000
	.4byte 0xa44000
	.4byte 0x5d6
	.4byte 0xc76
	.incbin "data/music/direct_sound_samples/84AA8F4.pcm"
	.align 2

	.incbin "baserom.gba", 0x004ab57c, 0x18e31c

DirectSoundWaveData_8639898: @ 8639898
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x64e
	.incbin "data/music/direct_sound_samples/8639898.pcm"
	.align 2

DirectSoundWaveData_8639EF8: @ 8639EF8
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x49f
	.4byte 0x4d3
	.incbin "data/music/direct_sound_samples/8639EF8.pcm"
	.align 2

DirectSoundWaveData_863A3DC: @ 863A3DC
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x93c
	.incbin "data/music/direct_sound_samples/863A3DC.pcm"
	.align 2

DirectSoundWaveData_863AD2C: @ 863AD2C
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xa5f
	.incbin "data/music/direct_sound_samples/863AD2C.pcm"
	.align 2

DirectSoundWaveData_863B79C: @ 863B79C
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x2db
	.4byte 0x30e
	.incbin "data/music/direct_sound_samples/863B79C.pcm"
	.align 2

DirectSoundWaveData_863BABC: @ 863BABC
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xc76
	.incbin "data/music/direct_sound_samples/863BABC.pcm"
	.align 2

DirectSoundWaveData_863C744: @ 863C744
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x60f
	.incbin "data/music/direct_sound_samples/863C744.pcm"
	.align 2

DirectSoundWaveData_863CD64: @ 863CD64
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x347
	.4byte 0x374
	.incbin "data/music/direct_sound_samples/863CD64.pcm"
	.align 2

DirectSoundWaveData_863D0EC: @ 863D0EC
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xdd0
	.incbin "data/music/direct_sound_samples/863D0EC.pcm"
	.align 2

DirectSoundWaveData_863DED0: @ 863DED0
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x95e
	.incbin "data/music/direct_sound_samples/863DED0.pcm"
	.align 2

DirectSoundWaveData_863E840: @ 863E840
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x352
	.4byte 0x38a
	.incbin "data/music/direct_sound_samples/863E840.pcm"
	.align 2

DirectSoundWaveData_863EBDC: @ 863EBDC
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x7a0
	.incbin "data/music/direct_sound_samples/863EBDC.pcm"
	.align 2

DirectSoundWaveData_863F390: @ 863F390
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xd48
	.incbin "data/music/direct_sound_samples/863F390.pcm"
	.align 2

DirectSoundWaveData_86400EC: @ 86400EC
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x202
	.4byte 0x233
	.incbin "data/music/direct_sound_samples/86400EC.pcm"
	.align 2

DirectSoundWaveData_8640330: @ 8640330
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xe2c
	.incbin "data/music/direct_sound_samples/8640330.pcm"
	.align 2

DirectSoundWaveData_8641170: @ 8641170
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x940
	.incbin "data/music/direct_sound_samples/8641170.pcm"
	.align 2

DirectSoundWaveData_8641AC4: @ 8641AC4
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x30e
	.4byte 0x341
	.incbin "data/music/direct_sound_samples/8641AC4.pcm"
	.align 2

DirectSoundWaveData_8641E18: @ 8641E18
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x620
	.incbin "data/music/direct_sound_samples/8641E18.pcm"
	.align 2

DirectSoundWaveData_864244C: @ 864244C
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xc58
	.incbin "data/music/direct_sound_samples/864244C.pcm"
	.align 2

DirectSoundWaveData_86430B8: @ 86430B8
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x556
	.4byte 0x586
	.incbin "data/music/direct_sound_samples/86430B8.pcm"
	.align 2

DirectSoundWaveData_8643650: @ 8643650
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xaf0
	.incbin "data/music/direct_sound_samples/8643650.pcm"
	.align 2

DirectSoundWaveData_8644154: @ 8644154
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x5f2
	.incbin "data/music/direct_sound_samples/8644154.pcm"
	.align 2

DirectSoundWaveData_8644758: @ 8644758
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x1b0
	.4byte 0x1e4
	.incbin "data/music/direct_sound_samples/8644758.pcm"
	.align 2

DirectSoundWaveData_8644950: @ 8644950
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x950
	.incbin "data/music/direct_sound_samples/8644950.pcm"
	.align 2

DirectSoundWaveData_86452B4: @ 86452B4
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xf78
	.incbin "data/music/direct_sound_samples/86452B4.pcm"
	.align 2

DirectSoundWaveData_8646240: @ 8646240
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x5f9
	.4byte 0x624
	.incbin "data/music/direct_sound_samples/8646240.pcm"
	.align 2

DirectSoundWaveData_8646878: @ 8646878
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xac0
	.incbin "data/music/direct_sound_samples/8646878.pcm"
	.align 2

DirectSoundWaveData_864734C: @ 864734C
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xf33
	.incbin "data/music/direct_sound_samples/864734C.pcm"
	.align 2

DirectSoundWaveData_8648290: @ 8648290
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x535
	.4byte 0x567
	.incbin "data/music/direct_sound_samples/8648290.pcm"
	.align 2

DirectSoundWaveData_8648808: @ 8648808
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xe38
	.incbin "data/music/direct_sound_samples/8648808.pcm"
	.align 2

DirectSoundWaveData_8649654: @ 8649654
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xef4
	.incbin "data/music/direct_sound_samples/8649654.pcm"
	.align 2

DirectSoundWaveData_864A55C: @ 864A55C
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0xa94
	.4byte 0xac3
	.incbin "data/music/direct_sound_samples/864A55C.pcm"
	.align 2

DirectSoundWaveData_864B030: @ 864B030
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xb80
	.incbin "data/music/direct_sound_samples/864B030.pcm"
	.align 2

DirectSoundWaveData_864BBC4: @ 864BBC4
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x9c4
	.incbin "data/music/direct_sound_samples/864BBC4.pcm"
	.align 2

DirectSoundWaveData_864C59C: @ 864C59C
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x5f4
	.4byte 0x62d
	.incbin "data/music/direct_sound_samples/864C59C.pcm"
	.align 2

DirectSoundWaveData_864CBDC: @ 864CBDC
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xacc
	.incbin "data/music/direct_sound_samples/864CBDC.pcm"
	.align 2

DirectSoundWaveData_864D6BC: @ 864D6BC
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x629
	.incbin "data/music/direct_sound_samples/864D6BC.pcm"
	.align 2

DirectSoundWaveData_864DCF8: @ 864DCF8
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x6ce
	.4byte 0x705
	.incbin "data/music/direct_sound_samples/864DCF8.pcm"
	.align 2

DirectSoundWaveData_864E410: @ 864E410
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x928
	.incbin "data/music/direct_sound_samples/864E410.pcm"
	.align 2

DirectSoundWaveData_864ED4C: @ 864ED4C
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x7a8
	.incbin "data/music/direct_sound_samples/864ED4C.pcm"
	.align 2

DirectSoundWaveData_864F508: @ 864F508
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x51c
	.4byte 0x553
	.incbin "data/music/direct_sound_samples/864F508.pcm"
	.align 2

DirectSoundWaveData_864FA6C: @ 864FA6C
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xd60
	.incbin "data/music/direct_sound_samples/864FA6C.pcm"
	.align 2

DirectSoundWaveData_86507E0: @ 86507E0
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x46a
	.incbin "data/music/direct_sound_samples/86507E0.pcm"
	.align 2

DirectSoundWaveData_8650C5C: @ 8650C5C
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x4a7
	.4byte 0x4db
	.incbin "data/music/direct_sound_samples/8650C5C.pcm"
	.align 2

DirectSoundWaveData_8651148: @ 8651148
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x7b4
	.incbin "data/music/direct_sound_samples/8651148.pcm"
	.align 2

DirectSoundWaveData_8651910: @ 8651910
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xbea
	.incbin "data/music/direct_sound_samples/8651910.pcm"
	.align 2

DirectSoundWaveData_865250C: @ 865250C
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x335
	.4byte 0x365
	.incbin "data/music/direct_sound_samples/865250C.pcm"
	.align 2

DirectSoundWaveData_8652884: @ 8652884
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0x7a8
	.incbin "data/music/direct_sound_samples/8652884.pcm"
	.align 2

DirectSoundWaveData_8653040: @ 8653040
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xc50
	.incbin "data/music/direct_sound_samples/8653040.pcm"
	.align 2

DirectSoundWaveData_8653CA4: @ 8653CA4
	.4byte 0x40000000
	.4byte 0x7b3000
	.4byte 0x482
	.4byte 0x4bb
	.incbin "data/music/direct_sound_samples/8653CA4.pcm"
	.align 2

DirectSoundWaveData_8654170: @ 8654170
	.4byte 0x0
	.4byte 0x7b3000
	.4byte 0x0
	.4byte 0xa9c
	.incbin "data/music/direct_sound_samples/8654170.pcm"
	.align 2

DirectSoundWaveData_8654C20: @ 8654C20
	.4byte 0x40000000
	.4byte 0x688600
	.4byte 0x7c2
	.4byte 0x13be
	.incbin "data/music/direct_sound_samples/8654C20.pcm"
	.align 2

	.include "data/music/music_headers.s"
