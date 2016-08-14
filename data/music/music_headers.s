Music299_Header:: @ 845632C
	.byte 0 @ number of tracks
	.byte 0, 0, 0 @ unknown
	.4byte 0x40000000 @ voice group pointer

	.incbin "baserom.gba", 0x456334, 0x1FFCBC

Music0_Header:: @ 8655FF0
	.byte 0 @ number of tracks
	.byte 0, 0, 168 @ unknown
	.4byte 0x0842FC88 @ voice group pointer

Music1_Track0:: @ 8655FF8
	.incbin "data/music/tracks/music1_track0.bin"

Music1_Header:: @ 8656010
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music1_Track0

Music2_Track0:: @ 865601C
	.incbin "data/music/tracks/music2_track0.bin"

Music2_Header:: @ 865603C
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music2_Track0

Music3_Track0:: @ 8656048
	.incbin "data/music/tracks/music3_track0.bin"

Music3_Header:: @ 8656060
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music3_Track0

Music4_Track0:: @ 865606C
	.incbin "data/music/tracks/music4_track0.bin"

Music4_Header:: @ 86560A4
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music4_Track0

Music5_Track0:: @ 86560B0
	.incbin "data/music/tracks/music5_track0.bin"

Music5_Header:: @ 86560D0
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music5_Track0

Music6_Track0:: @ 86560DC
	.incbin "data/music/tracks/music6_track0.bin"

Music6_Header:: @ 86560EC
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music6_Track0

Music7_Track0:: @ 86560F8
	.incbin "data/music/tracks/music7_track0.bin"

Music7_Header:: @ 8656108
	.byte 1 @ number of tracks
	.byte 0, 2, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music7_Track0

Music8_Track0:: @ 8656114
	.incbin "data/music/tracks/music8_track0.bin"

Music8_Header:: @ 8656124
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music8_Track0

Music9_Track0:: @ 8656130
	.incbin "data/music/tracks/music9_track0.bin"

Music9_Header:: @ 8656158
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music9_Track0

Music10_Track0:: @ 8656164
	.incbin "data/music/tracks/music10_track0.bin"

Music10_Header:: @ 865617C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music10_Track0

Music11_Track0:: @ 8656188
	.incbin "data/music/tracks/music11_track0.bin"

Music11_Header:: @ 8656198
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music11_Track0

Music12_Track0:: @ 86561A4
	.incbin "data/music/tracks/music12_track0.bin"

Music12_Track1:: @ 86561B5
	.incbin "data/music/tracks/music12_track1.bin"

Music12_Header:: @ 86561C4
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music12_Track0
	.4byte Music12_Track1

Music13_Track0:: @ 86561D4
	.incbin "data/music/tracks/music13_track0.bin"

Music13_Track1:: @ 86561F6
	.incbin "data/music/tracks/music13_track1.bin"

Music13_Header:: @ 8656210
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music13_Track0
	.4byte Music13_Track1

Music14_Track0:: @ 8656220
	.incbin "data/music/tracks/music14_track0.bin"

Music14_Track1:: @ 8656256
	.incbin "data/music/tracks/music14_track1.bin"

Music14_Header:: @ 865628C
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music14_Track0
	.4byte Music14_Track1

Music15_Track0:: @ 865629C
	.incbin "data/music/tracks/music15_track0.bin"

Music15_Track1:: @ 86562B4
	.incbin "data/music/tracks/music15_track1.bin"

Music15_Track2:: @ 86562CB
	.incbin "data/music/tracks/music15_track2.bin"

Music15_Header:: @ 86562E0
	.byte 3 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music15_Track0
	.4byte Music15_Track1
	.4byte Music15_Track2

Music16_Track0:: @ 86562F4
	.incbin "data/music/tracks/music16_track0.bin"

Music16_Track1:: @ 8656307
	.incbin "data/music/tracks/music16_track1.bin"

Music16_Track2:: @ 8656322
	.incbin "data/music/tracks/music16_track2.bin"

Music16_Header:: @ 8656334
	.byte 3 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music16_Track0
	.4byte Music16_Track1
	.4byte Music16_Track2

Music17_Track0:: @ 8656348
	.incbin "data/music/tracks/music17_track0.bin"

Music17_Header:: @ 8656384
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music17_Track0

Music18_Track0:: @ 8656390
	.incbin "data/music/tracks/music18_track0.bin"

Music18_Header:: @ 86563A0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music18_Track0

Music19_Track0:: @ 86563AC
	.incbin "data/music/tracks/music19_track0.bin"

Music19_Header:: @ 86563F4
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music19_Track0

Music20_Track0:: @ 8656400
	.incbin "data/music/tracks/music20_track0.bin"

Music20_Header:: @ 865643C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music20_Track0

Music21_Track0:: @ 8656448
	.incbin "data/music/tracks/music21_track0.bin"

Music21_Header:: @ 8656468
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music21_Track0

Music22_Track0:: @ 8656474
	.incbin "data/music/tracks/music22_track0.bin"

Music22_Header:: @ 865648C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music22_Track0

Music23_Track0:: @ 8656498
	.incbin "data/music/tracks/music23_track0.bin"

Music23_Header:: @ 86564B0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music23_Track0

Music24_Track0:: @ 86564BC
	.incbin "data/music/tracks/music24_track0.bin"

Music24_Track1:: @ 86564F1
	.incbin "data/music/tracks/music24_track1.bin"

Music24_Track2:: @ 8656509
	.incbin "data/music/tracks/music24_track2.bin"

Music24_Track3:: @ 8656521
	.incbin "data/music/tracks/music24_track3.bin"

Music24_Header:: @ 8656534
	.byte 4 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music24_Track0
	.4byte Music24_Track1
	.4byte Music24_Track2
	.4byte Music24_Track3

Music25_Track0:: @ 865654C
	.incbin "data/music/tracks/music25_track0.bin"

Music25_Header:: @ 8656560
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music25_Track0

Music26_Track0:: @ 865656C
	.incbin "data/music/tracks/music26_track0.bin"

Music26_Header:: @ 8656580
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music26_Track0

Music27_Track0:: @ 865658C
	.incbin "data/music/tracks/music27_track0.bin"

Music27_Header:: @ 86565A0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music27_Track0

Music28_Track0:: @ 86565AC
	.incbin "data/music/tracks/music28_track0.bin"

Music28_Header:: @ 86565C0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music28_Track0

Music29_Track0:: @ 86565CC
	.incbin "data/music/tracks/music29_track0.bin"

Music29_Header:: @ 86565E0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music29_Track0

Music30_Track0:: @ 86565EC
	.incbin "data/music/tracks/music30_track0.bin"

Music30_Header:: @ 8656600
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music30_Track0

Music31_Track0:: @ 865660C
	.incbin "data/music/tracks/music31_track0.bin"

Music31_Header:: @ 8656620
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music31_Track0

Music32_Track0:: @ 865662C
	.incbin "data/music/tracks/music32_track0.bin"

Music32_Header:: @ 8656650
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music32_Track0

Music33_Track0:: @ 865665C
	.incbin "data/music/tracks/music33_track0.bin"

Music33_Header:: @ 86567D0
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music33_Track0

Music34_Track0:: @ 86567DC
	.incbin "data/music/tracks/music34_track0.bin"

Music34_Header:: @ 86567F4
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music34_Track0

Music35_Track0:: @ 8656800
	.incbin "data/music/tracks/music35_track0.bin"

Music35_Header:: @ 8656818
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music35_Track0

Music36_Track0:: @ 8656824
	.incbin "data/music/tracks/music36_track0.bin"

Music36_Header:: @ 865683C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music36_Track0

Music37_Track0:: @ 8656848
	.incbin "data/music/tracks/music37_track0.bin"

Music37_Header:: @ 865686C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music37_Track0

Music38_Track0:: @ 8656878
	.incbin "data/music/tracks/music38_track0.bin"

Music38_Header:: @ 8656890
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music38_Track0

Music39_Track0:: @ 865689C
	.incbin "data/music/tracks/music39_track0.bin"

Music39_Header:: @ 86568DC
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music39_Track0

Music40_Track0:: @ 86568E8
	.incbin "data/music/tracks/music40_track0.bin"

Music40_Track1:: @ 8656901
	.incbin "data/music/tracks/music40_track1.bin"

Music40_Header:: @ 8656914
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music40_Track0
	.4byte Music40_Track1

Music41_Track0:: @ 8656924
	.incbin "data/music/tracks/music41_track0.bin"

Music41_Track1:: @ 8656952
	.incbin "data/music/tracks/music41_track1.bin"

Music41_Header:: @ 8656968
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music41_Track0
	.4byte Music41_Track1

Music42_Track0:: @ 8656978
	.incbin "data/music/tracks/music42_track0.bin"

Music42_Track1:: @ 865698F
	.incbin "data/music/tracks/music42_track1.bin"

Music42_Header:: @ 86569A4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music42_Track0
	.4byte Music42_Track1

Music43_Track0:: @ 86569B4
	.incbin "data/music/tracks/music43_track0.bin"

Music43_Header:: @ 86569FC
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music43_Track0

Music44_Track0:: @ 8656A08
	.incbin "data/music/tracks/music44_track0.bin"

Music44_Track1:: @ 8656A2E
	.incbin "data/music/tracks/music44_track1.bin"

Music44_Header:: @ 8656A40
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music44_Track0
	.4byte Music44_Track1

Music45_Track0:: @ 8656A50
	.incbin "data/music/tracks/music45_track0.bin"

Music45_Header:: @ 8656A7C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music45_Track0

Music46_Track0:: @ 8656A88
	.incbin "data/music/tracks/music46_track0.bin"

Music46_Header:: @ 8656ABC
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music46_Track0

Music47_Track0:: @ 8656AC8
	.incbin "data/music/tracks/music47_track0.bin"

Music47_Header:: @ 8656AE8
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music47_Track0

Music48_Track0:: @ 8656AF4
	.incbin "data/music/tracks/music48_track0.bin"

Music48_Header:: @ 8656B24
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music48_Track0

Music49_Track0:: @ 8656B30
	.incbin "data/music/tracks/music49_track0.bin"

Music49_Track1:: @ 8656B5C
	.incbin "data/music/tracks/music49_track1.bin"

Music49_Header:: @ 8656BD0
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music49_Track0
	.4byte Music49_Track1

Music50_Track0:: @ 8656BE0
	.incbin "data/music/tracks/music50_track0.bin"

Music50_Track1:: @ 8656C21
	.incbin "data/music/tracks/music50_track1.bin"

Music50_Track2:: @ 8656C34
	.incbin "data/music/tracks/music50_track2.bin"

Music50_Header:: @ 8656C48
	.byte 3 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music50_Track0
	.4byte Music50_Track1
	.4byte Music50_Track2

Music51_Track0:: @ 8656C5C
	.incbin "data/music/tracks/music51_track0.bin"

Music51_Header:: @ 8656C74
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music51_Track0

Music52_Track0:: @ 8656C80
	.incbin "data/music/tracks/music52_track0.bin"

Music52_Track1:: @ 8656C95
	.incbin "data/music/tracks/music52_track1.bin"

Music52_Header:: @ 8656CA8
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music52_Track0
	.4byte Music52_Track1

Music53_Track0:: @ 8656CB8
	.incbin "data/music/tracks/music53_track0.bin"

Music53_Header:: @ 8656CD4
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music53_Track0

Music54_Track0:: @ 8656CE0
	.incbin "data/music/tracks/music54_track0.bin"

Music54_Header:: @ 8656D34
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music54_Track0

Music55_Track0:: @ 8656D40
	.incbin "data/music/tracks/music55_track0.bin"

Music55_Track1:: @ 8656D5E
	.incbin "data/music/tracks/music55_track1.bin"

Music55_Header:: @ 8656D78
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music55_Track0
	.4byte Music55_Track1

Music56_Track0:: @ 8656D88
	.incbin "data/music/tracks/music56_track0.bin"

Music56_Track1:: @ 8656D97
	.incbin "data/music/tracks/music56_track1.bin"

Music56_Header:: @ 8656DA4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music56_Track0
	.4byte Music56_Track1

Music57_Track0:: @ 8656DB4
	.incbin "data/music/tracks/music57_track0.bin"

Music57_Track1:: @ 8656DC3
	.incbin "data/music/tracks/music57_track1.bin"

Music57_Header:: @ 8656DD0
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music57_Track0
	.4byte Music57_Track1

Music58_Track0:: @ 8656DE0
	.incbin "data/music/tracks/music58_track0.bin"

Music58_Track1:: @ 8656DEF
	.incbin "data/music/tracks/music58_track1.bin"

Music58_Header:: @ 8656DFC
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music58_Track0
	.4byte Music58_Track1

Music59_Track0:: @ 8656E0C
	.incbin "data/music/tracks/music59_track0.bin"

Music59_Track1:: @ 8656E1B
	.incbin "data/music/tracks/music59_track1.bin"

Music59_Header:: @ 8656E28
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music59_Track0
	.4byte Music59_Track1

Music60_Track0:: @ 8656E38
	.incbin "data/music/tracks/music60_track0.bin"

Music60_Track1:: @ 8656E62
	.incbin "data/music/tracks/music60_track1.bin"

Music60_Header:: @ 8656E7C
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music60_Track0
	.4byte Music60_Track1

Music61_Track0:: @ 8656E8C
	.incbin "data/music/tracks/music61_track0.bin"

Music61_Header:: @ 8656EC0
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music61_Track0

Music62_Track0:: @ 8656ECC
	.incbin "data/music/tracks/music62_track0.bin"

Music62_Track1:: @ 8656EE0
	.incbin "data/music/tracks/music62_track1.bin"

Music62_Header:: @ 8656EF4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music62_Track0
	.4byte Music62_Track1

Music63_Track0:: @ 8656F04
	.incbin "data/music/tracks/music63_track0.bin"

Music63_Track1:: @ 8656F18
	.incbin "data/music/tracks/music63_track1.bin"

Music63_Header:: @ 8656F2C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music63_Track0
	.4byte Music63_Track1

Music64_Track0:: @ 8656F3C
	.incbin "data/music/tracks/music64_track0.bin"

Music64_Track1:: @ 8656F50
	.incbin "data/music/tracks/music64_track1.bin"

Music64_Header:: @ 8656F64
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music64_Track0
	.4byte Music64_Track1

Music65_Track0:: @ 8656F74
	.incbin "data/music/tracks/music65_track0.bin"

Music65_Track1:: @ 8656F88
	.incbin "data/music/tracks/music65_track1.bin"

Music65_Header:: @ 8656F9C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music65_Track0
	.4byte Music65_Track1

Music66_Track0:: @ 8656FAC
	.incbin "data/music/tracks/music66_track0.bin"

Music66_Track1:: @ 8656FC0
	.incbin "data/music/tracks/music66_track1.bin"

Music66_Header:: @ 8656FD4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music66_Track0
	.4byte Music66_Track1

Music67_Track0:: @ 8656FE4
	.incbin "data/music/tracks/music67_track0.bin"

Music67_Track1:: @ 8656FF8
	.incbin "data/music/tracks/music67_track1.bin"

Music67_Header:: @ 865700C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music67_Track0
	.4byte Music67_Track1

Music68_Track0:: @ 865701C
	.incbin "data/music/tracks/music68_track0.bin"

Music68_Track1:: @ 8657030
	.incbin "data/music/tracks/music68_track1.bin"

Music68_Header:: @ 8657044
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music68_Track0
	.4byte Music68_Track1

Music69_Track0:: @ 8657054
	.incbin "data/music/tracks/music69_track0.bin"

Music69_Track1:: @ 8657068
	.incbin "data/music/tracks/music69_track1.bin"

Music69_Header:: @ 865707C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music69_Track0
	.4byte Music69_Track1

Music70_Track0:: @ 865708C
	.incbin "data/music/tracks/music70_track0.bin"

Music70_Header:: @ 86570B0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music70_Track0

Music71_Track0:: @ 86570BC
	.incbin "data/music/tracks/music71_track0.bin"

Music71_Header:: @ 86570D4
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music71_Track0

Music72_Track0:: @ 86570E0
	.incbin "data/music/tracks/music72_track0.bin"

Music72_Track1:: @ 8657105
	.incbin "data/music/tracks/music72_track1.bin"

Music72_Header:: @ 8657120
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music72_Track0
	.4byte Music72_Track1

Music73_Track0:: @ 8657130
	.incbin "data/music/tracks/music73_track0.bin"

Music73_Track1:: @ 8657159
	.incbin "data/music/tracks/music73_track1.bin"

Music73_Header:: @ 8657180
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music73_Track0
	.4byte Music73_Track1

Music74_Track0:: @ 8657190
	.incbin "data/music/tracks/music74_track0.bin"

Music74_Header:: @ 86571B4
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music74_Track0

Music75_Track0:: @ 86571C0
	.incbin "data/music/tracks/music75_track0.bin"

Music75_Header:: @ 86571E4
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music75_Track0

Music76_Track0:: @ 86571F0
	.incbin "data/music/tracks/music76_track0.bin"

Music76_Header:: @ 865721C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music76_Track0

Music77_Track0:: @ 8657228
	.incbin "data/music/tracks/music77_track0.bin"

Music77_Header:: @ 8657260
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music77_Track0

Music78_Track0:: @ 865726C
	.incbin "data/music/tracks/music78_track0.bin"

Music78_Header:: @ 8657290
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music78_Track0

Music79_Track0:: @ 865729C
	.incbin "data/music/tracks/music79_track0.bin"

Music79_Header:: @ 86572B8
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music79_Track0

Music80_Track0:: @ 86572C4
	.incbin "data/music/tracks/music80_track0.bin"

Music80_Header:: @ 8657320
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music80_Track0

Music81_Track0:: @ 865732C
	.incbin "data/music/tracks/music81_track0.bin"

Music81_Header:: @ 865735C
	.byte 1 @ number of tracks
	.byte 0, 2, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music81_Track0

Music82_Track0:: @ 8657368
	.incbin "data/music/tracks/music82_track0.bin"

Music82_Header:: @ 865739C
	.byte 1 @ number of tracks
	.byte 0, 2, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music82_Track0

Music83_Track0:: @ 86573A8
	.incbin "data/music/tracks/music83_track0.bin"

Music83_Header:: @ 86573D8
	.byte 1 @ number of tracks
	.byte 0, 2, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music83_Track0

Music84_Track0:: @ 86573E4
	.incbin "data/music/tracks/music84_track0.bin"

Music84_Header:: @ 8657418
	.byte 1 @ number of tracks
	.byte 0, 2, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music84_Track0

Music85_Track0:: @ 8657424
	.incbin "data/music/tracks/music85_track0.bin"

Music85_Header:: @ 8657454
	.byte 1 @ number of tracks
	.byte 0, 2, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music85_Track0

Music86_Track0:: @ 8657460
	.incbin "data/music/tracks/music86_track0.bin"

Music86_Header:: @ 8657494
	.byte 1 @ number of tracks
	.byte 0, 2, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music86_Track0

Music87_Track0:: @ 86574A0
	.incbin "data/music/tracks/music87_track0.bin"

Music87_Header:: @ 86574FC
	.byte 1 @ number of tracks
	.byte 0, 3, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music87_Track0

Music88_Track0:: @ 8657508
	.incbin "data/music/tracks/music88_track0.bin"

Music88_Header:: @ 865754C
	.byte 1 @ number of tracks
	.byte 0, 3, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music88_Track0

Music89_Track0:: @ 8657558
	.incbin "data/music/tracks/music89_track0.bin"

Music89_Track1:: @ 8657572
	.incbin "data/music/tracks/music89_track1.bin"

Music89_Header:: @ 8657588
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music89_Track0
	.4byte Music89_Track1

Music90_Track0:: @ 8657598
	.incbin "data/music/tracks/music90_track0.bin"

Music90_Header:: @ 86575B8
	.byte 1 @ number of tracks
	.byte 0, 3, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music90_Track0

Music91_Track0:: @ 86575C4
	.incbin "data/music/tracks/music91_track0.bin"

Music91_Track1:: @ 86575E7
	.incbin "data/music/tracks/music91_track1.bin"

Music91_Header:: @ 8657604
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music91_Track0
	.4byte Music91_Track1

Music92_Track0:: @ 8657614
	.incbin "data/music/tracks/music92_track0.bin"

Music92_Header:: @ 8657628
	.byte 1 @ number of tracks
	.byte 0, 2, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music92_Track0

Music93_Track0:: @ 8657634
	.incbin "data/music/tracks/music93_track0.bin"

Music93_Header:: @ 865767C
	.byte 1 @ number of tracks
	.byte 0, 2, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music93_Track0

Music94_Track0:: @ 8657688
	.incbin "data/music/tracks/music94_track0.bin"

Music94_Track1:: @ 86576E3
	.incbin "data/music/tracks/music94_track1.bin"

Music94_Header:: @ 8657710
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music94_Track0
	.4byte Music94_Track1

Music95_Track0:: @ 8657720
	.incbin "data/music/tracks/music95_track0.bin"

Music95_Track1:: @ 865773A
	.incbin "data/music/tracks/music95_track1.bin"

Music95_Header:: @ 865774C
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music95_Track0
	.4byte Music95_Track1

Music96_Track0:: @ 865775C
	.incbin "data/music/tracks/music96_track0.bin"

Music96_Header:: @ 8657770
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music96_Track0

Music97_Track0:: @ 865777C
	.incbin "data/music/tracks/music97_track0.bin"

Music97_Track1:: @ 865779C
	.incbin "data/music/tracks/music97_track1.bin"

Music97_Header:: @ 86577D4
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music97_Track0
	.4byte Music97_Track1

Music98_Track0:: @ 86577E4
	.incbin "data/music/tracks/music98_track0.bin"

Music98_Track1:: @ 8657804
	.incbin "data/music/tracks/music98_track1.bin"

Music98_Header:: @ 865783C
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music98_Track0
	.4byte Music98_Track1

Music99_Track0:: @ 865784C
	.incbin "data/music/tracks/music99_track0.bin"

Music99_Header:: @ 8657864
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music99_Track0

Music100_Track0:: @ 8657870
	.incbin "data/music/tracks/music100_track0.bin"

Music100_Header:: @ 8657898
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music100_Track0

Music101_Track0:: @ 86578A4
	.incbin "data/music/tracks/music101_track0.bin"

Music101_Header:: @ 86578C4
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music101_Track0

Music102_Track0:: @ 86578D0
	.incbin "data/music/tracks/music102_track0.bin"

Music102_Header:: @ 8657940
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music102_Track0

Music103_Track0:: @ 865794C
	.incbin "data/music/tracks/music103_track0.bin"

Music103_Header:: @ 8657A00
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music103_Track0

Music104_Track0:: @ 8657A0C
	.incbin "data/music/tracks/music104_track0.bin"

Music104_Track1:: @ 8657A56
	.incbin "data/music/tracks/music104_track1.bin"

Music104_Header:: @ 8657AE8
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music104_Track0
	.4byte Music104_Track1

Music105_Track0:: @ 8657AF8
	.incbin "data/music/tracks/music105_track0.bin"

Music105_Header:: @ 8657C00
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music105_Track0

Music106_Track0:: @ 8657C0C
	.incbin "data/music/tracks/music106_track0.bin"

Music106_Header:: @ 8657C24
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music106_Track0

Music107_Track0:: @ 8657C30
	.incbin "data/music/tracks/music107_track0.bin"

Music107_Track1:: @ 8657CB4
	.incbin "data/music/tracks/music107_track1.bin"

Music107_Header:: @ 8657D38
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music107_Track0
	.4byte Music107_Track1

Music108_Track0:: @ 8657D48
	.incbin "data/music/tracks/music108_track0.bin"

Music108_Header:: @ 8657D64
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music108_Track0

Music109_Track0:: @ 8657D70
	.incbin "data/music/tracks/music109_track0.bin"

Music109_Header:: @ 8657D98
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music109_Track0

Music110_Track0:: @ 8657DA4
	.incbin "data/music/tracks/music110_track0.bin"

Music110_Track1:: @ 8657DD1
	.incbin "data/music/tracks/music110_track1.bin"

Music110_Header:: @ 8657DFC
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music110_Track0
	.4byte Music110_Track1

Music111_Track0:: @ 8657E0C
	.incbin "data/music/tracks/music111_track0.bin"

Music111_Track1:: @ 8657E39
	.incbin "data/music/tracks/music111_track1.bin"

Music111_Header:: @ 8657E64
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music111_Track0
	.4byte Music111_Track1

Music112_Track0:: @ 8657E74
	.incbin "data/music/tracks/music112_track0.bin"

Music112_Track1:: @ 8657F6D
	.incbin "data/music/tracks/music112_track1.bin"

Music112_Header:: @ 8658060
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music112_Track0
	.4byte Music112_Track1

Music113_Track0:: @ 8658070
	.incbin "data/music/tracks/music113_track0.bin"

Music113_Track1:: @ 86580B7
	.incbin "data/music/tracks/music113_track1.bin"

Music113_Header:: @ 86580EC
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music113_Track0
	.4byte Music113_Track1

Music114_Track0:: @ 86580FC
	.incbin "data/music/tracks/music114_track0.bin"

Music114_Track1:: @ 8658129
	.incbin "data/music/tracks/music114_track1.bin"

Music114_Header:: @ 865813C
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music114_Track0
	.4byte Music114_Track1

Music115_Track0:: @ 865814C
	.incbin "data/music/tracks/music115_track0.bin"

Music115_Header:: @ 8658168
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music115_Track0

Music116_Track0:: @ 8658174
	.incbin "data/music/tracks/music116_track0.bin"

Music116_Header:: @ 8658188
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451990 @ voice group pointer
	.4byte Music116_Track0

Music117_Track0:: @ 8658194
	.incbin "data/music/tracks/music117_track0.bin"

Music117_Header:: @ 86581C4
	.byte 1 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music117_Track0

Music118_Track0:: @ 86581D0
	.incbin "data/music/tracks/music118_track0.bin"

Music118_Track1:: @ 8658230
	.incbin "data/music/tracks/music118_track1.bin"

Music118_Header:: @ 8658258
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music118_Track0
	.4byte Music118_Track1

Music119_Track0:: @ 8658268
	.incbin "data/music/tracks/music119_track0.bin"

Music119_Track1:: @ 8658299
	.incbin "data/music/tracks/music119_track1.bin"

Music119_Header:: @ 86582C4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music119_Track0
	.4byte Music119_Track1

Music120_Track0:: @ 86582D4
	.incbin "data/music/tracks/music120_track0.bin"

Music120_Track1:: @ 86582FB
	.incbin "data/music/tracks/music120_track1.bin"

Music120_Header:: @ 865830C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music120_Track0
	.4byte Music120_Track1

Music121_Track0:: @ 865831C
	.incbin "data/music/tracks/music121_track0.bin"

Music121_Track1:: @ 865836E
	.incbin "data/music/tracks/music121_track1.bin"

Music121_Header:: @ 86583D0
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music121_Track0
	.4byte Music121_Track1

Music122_Track0:: @ 86583E0
	.incbin "data/music/tracks/music122_track0.bin"

Music122_Track1:: @ 865840F
	.incbin "data/music/tracks/music122_track1.bin"

Music122_Header:: @ 8658424
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music122_Track0
	.4byte Music122_Track1

Music123_Track0:: @ 8658434
	.incbin "data/music/tracks/music123_track0.bin"

Music123_Track1:: @ 8658489
	.incbin "data/music/tracks/music123_track1.bin"

Music123_Header:: @ 86584A4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music123_Track0
	.4byte Music123_Track1

Music124_Track0:: @ 86584B4
	.incbin "data/music/tracks/music124_track0.bin"

Music124_Header:: @ 86584DC
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music124_Track0

Music125_Track0:: @ 86584E8
	.incbin "data/music/tracks/music125_track0.bin"

Music125_Track1:: @ 8658501
	.incbin "data/music/tracks/music125_track1.bin"

Music125_Header:: @ 8658510
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music125_Track0
	.4byte Music125_Track1

Music126_Track0:: @ 8658520
	.incbin "data/music/tracks/music126_track0.bin"

Music126_Header:: @ 8658550
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music126_Track0

Music127_Track0:: @ 865855C
	.incbin "data/music/tracks/music127_track0.bin"

Music127_Header:: @ 86585C8
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music127_Track0

Music128_Track0:: @ 86585D4
	.incbin "data/music/tracks/music128_track0.bin"

Music128_Track1:: @ 8658632
	.incbin "data/music/tracks/music128_track1.bin"

Music128_Header:: @ 8658648
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music128_Track0
	.4byte Music128_Track1

Music129_Track0:: @ 8658658
	.incbin "data/music/tracks/music129_track0.bin"

Music129_Header:: @ 86586A0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music129_Track0

Music130_Track0:: @ 86586AC
	.incbin "data/music/tracks/music130_track0.bin"

Music130_Track1:: @ 865871B
	.incbin "data/music/tracks/music130_track1.bin"

Music130_Header:: @ 8658744
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music130_Track0
	.4byte Music130_Track1

Music131_Track0:: @ 8658754
	.incbin "data/music/tracks/music131_track0.bin"

Music131_Header:: @ 8658790
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music131_Track0

Music132_Track0:: @ 865879C
	.incbin "data/music/tracks/music132_track0.bin"

Music132_Header:: @ 865880C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music132_Track0

Music133_Track0:: @ 8658818
	.incbin "data/music/tracks/music133_track0.bin"

Music133_Header:: @ 8658858
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music133_Track0

Music134_Track0:: @ 8658864
	.incbin "data/music/tracks/music134_track0.bin"

Music134_Header:: @ 865888C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music134_Track0

Music135_Track0:: @ 8658898
	.incbin "data/music/tracks/music135_track0.bin"

Music135_Header:: @ 86588D8
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music135_Track0

Music136_Track0:: @ 86588E4
	.incbin "data/music/tracks/music136_track0.bin"

Music136_Track1:: @ 8658927
	.incbin "data/music/tracks/music136_track1.bin"

Music136_Header:: @ 8658938
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music136_Track0
	.4byte Music136_Track1

Music137_Track0:: @ 8658948
	.incbin "data/music/tracks/music137_track0.bin"

Music137_Track1:: @ 8658968
	.incbin "data/music/tracks/music137_track1.bin"

Music137_Header:: @ 8658984
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music137_Track0
	.4byte Music137_Track1

Music138_Track0:: @ 8658994
	.incbin "data/music/tracks/music138_track0.bin"

Music138_Track1:: @ 86589E0
	.incbin "data/music/tracks/music138_track1.bin"

Music138_Header:: @ 8658A08
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music138_Track0
	.4byte Music138_Track1

Music139_Track0:: @ 8658A18
	.incbin "data/music/tracks/music139_track0.bin"

Music139_Track1:: @ 8658A42
	.incbin "data/music/tracks/music139_track1.bin"

Music139_Header:: @ 8658A5C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music139_Track0
	.4byte Music139_Track1

Music140_Track0:: @ 8658A6C
	.incbin "data/music/tracks/music140_track0.bin"

Music140_Header:: @ 8658B28
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music140_Track0

Music141_Track0:: @ 8658B34
	.incbin "data/music/tracks/music141_track0.bin"

Music141_Track1:: @ 8658B9C
	.incbin "data/music/tracks/music141_track1.bin"

Music141_Header:: @ 8658BC8
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music141_Track0
	.4byte Music141_Track1

Music142_Track0:: @ 8658BD8
	.incbin "data/music/tracks/music142_track0.bin"

Music142_Header:: @ 8658C04
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music142_Track0

Music143_Track0:: @ 8658C10
	.incbin "data/music/tracks/music143_track0.bin"

Music143_Header:: @ 8658C50
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music143_Track0

Music144_Track0:: @ 8658C5C
	.incbin "data/music/tracks/music144_track0.bin"

Music144_Track1:: @ 8658CA9
	.incbin "data/music/tracks/music144_track1.bin"

Music144_Header:: @ 8658CD4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music144_Track0
	.4byte Music144_Track1

Music145_Track0:: @ 8658CE4
	.incbin "data/music/tracks/music145_track0.bin"

Music145_Track1:: @ 8658D2B
	.incbin "data/music/tracks/music145_track1.bin"

Music145_Header:: @ 8658D44
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music145_Track0
	.4byte Music145_Track1

Music146_Track0:: @ 8658D54
	.incbin "data/music/tracks/music146_track0.bin"

Music146_Track1:: @ 8658DFB
	.incbin "data/music/tracks/music146_track1.bin"

Music146_Header:: @ 8658E18
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music146_Track0
	.4byte Music146_Track1

Music147_Track0:: @ 8658E28
	.incbin "data/music/tracks/music147_track0.bin"

Music147_Track1:: @ 8658E9E
	.incbin "data/music/tracks/music147_track1.bin"

Music147_Header:: @ 8658EBC
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music147_Track0
	.4byte Music147_Track1

Music148_Track0:: @ 8658ECC
	.incbin "data/music/tracks/music148_track0.bin"

Music148_Header:: @ 8658F2C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music148_Track0

Music149_Track0:: @ 8658F38
	.incbin "data/music/tracks/music149_track0.bin"

Music149_Track1:: @ 8658F80
	.incbin "data/music/tracks/music149_track1.bin"

Music149_Header:: @ 8658FA0
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music149_Track0
	.4byte Music149_Track1

Music150_Track0:: @ 8658FB0
	.incbin "data/music/tracks/music150_track0.bin"

Music150_Track1:: @ 865905D
	.incbin "data/music/tracks/music150_track1.bin"

Music150_Header:: @ 8659080
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music150_Track0
	.4byte Music150_Track1

Music151_Track0:: @ 8659090
	.incbin "data/music/tracks/music151_track0.bin"

Music151_Header:: @ 86590BC
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music151_Track0

Music152_Track0:: @ 86590C8
	.incbin "data/music/tracks/music152_track0.bin"

Music152_Header:: @ 8659124
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music152_Track0

Music153_Track0:: @ 8659130
	.incbin "data/music/tracks/music153_track0.bin"

Music153_Header:: @ 86591A0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music153_Track0

Music154_Track0:: @ 86591AC
	.incbin "data/music/tracks/music154_track0.bin"

Music154_Header:: @ 86591EC
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music154_Track0

Music155_Track0:: @ 86591F8
	.incbin "data/music/tracks/music155_track0.bin"

Music155_Header:: @ 8659234
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music155_Track0

Music156_Track0:: @ 8659240
	.incbin "data/music/tracks/music156_track0.bin"

Music156_Track1:: @ 865928A
	.incbin "data/music/tracks/music156_track1.bin"

Music156_Header:: @ 865929C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music156_Track0
	.4byte Music156_Track1

Music157_Track0:: @ 86592AC
	.incbin "data/music/tracks/music157_track0.bin"

Music157_Track1:: @ 865930D
	.incbin "data/music/tracks/music157_track1.bin"

Music157_Header:: @ 8659338
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music157_Track0
	.4byte Music157_Track1

Music158_Track0:: @ 8659348
	.incbin "data/music/tracks/music158_track0.bin"

Music158_Track1:: @ 865943C
	.incbin "data/music/tracks/music158_track1.bin"

Music158_Header:: @ 865949C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music158_Track0
	.4byte Music158_Track1

Music159_Track0:: @ 86594AC
	.incbin "data/music/tracks/music159_track0.bin"

Music159_Track1:: @ 86594F5
	.incbin "data/music/tracks/music159_track1.bin"

Music159_Header:: @ 8659504
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music159_Track0
	.4byte Music159_Track1

Music160_Track0:: @ 8659514
	.incbin "data/music/tracks/music160_track0.bin"

Music160_Header:: @ 8659548
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music160_Track0

Music161_Track0:: @ 8659554
	.incbin "data/music/tracks/music161_track0.bin"

Music161_Track1:: @ 86595B2
	.incbin "data/music/tracks/music161_track1.bin"

Music161_Header:: @ 86595C4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music161_Track0
	.4byte Music161_Track1

Music162_Track0:: @ 86595D4
	.incbin "data/music/tracks/music162_track0.bin"

Music162_Header:: @ 8659630
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music162_Track0

Music163_Track0:: @ 865963C
	.incbin "data/music/tracks/music163_track0.bin"

Music163_Header:: @ 86596B0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music163_Track0

Music164_Track0:: @ 86596BC
	.incbin "data/music/tracks/music164_track0.bin"

Music164_Track1:: @ 865970F
	.incbin "data/music/tracks/music164_track1.bin"

Music164_Header:: @ 8659730
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music164_Track0
	.4byte Music164_Track1

Music165_Track0:: @ 8659740
	.incbin "data/music/tracks/music165_track0.bin"

Music165_Header:: @ 86597CC
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music165_Track0

Music166_Track0:: @ 86597D8
	.incbin "data/music/tracks/music166_track0.bin"

Music166_Header:: @ 8659818
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music166_Track0

Music167_Track0:: @ 8659824
	.incbin "data/music/tracks/music167_track0.bin"

Music167_Header:: @ 8659858
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music167_Track0

Music168_Track0:: @ 8659864
	.incbin "data/music/tracks/music168_track0.bin"

Music168_Header:: @ 86598D0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music168_Track0

Music169_Track0:: @ 86598DC
	.incbin "data/music/tracks/music169_track0.bin"

Music169_Header:: @ 865990C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music169_Track0

Music170_Track0:: @ 8659918
	.incbin "data/music/tracks/music170_track0.bin"

Music170_Header:: @ 8659964
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music170_Track0

Music171_Track0:: @ 8659970
	.incbin "data/music/tracks/music171_track0.bin"

Music171_Header:: @ 8659A2C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music171_Track0

Music172_Track0:: @ 8659A38
	.incbin "data/music/tracks/music172_track0.bin"

Music172_Track1:: @ 8659AA6
	.incbin "data/music/tracks/music172_track1.bin"

Music172_Header:: @ 8659B20
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music172_Track0
	.4byte Music172_Track1

Music173_Track0:: @ 8659B30
	.incbin "data/music/tracks/music173_track0.bin"

Music173_Track1:: @ 8659BCF
	.incbin "data/music/tracks/music173_track1.bin"

Music173_Header:: @ 8659C30
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music173_Track0
	.4byte Music173_Track1

Music174_Track0:: @ 8659C40
	.incbin "data/music/tracks/music174_track0.bin"

Music174_Header:: @ 8659CB8
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music174_Track0

Music175_Track0:: @ 8659CC4
	.incbin "data/music/tracks/music175_track0.bin"

Music175_Header:: @ 8659D00
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music175_Track0

Music176_Track0:: @ 8659D0C
	.incbin "data/music/tracks/music176_track0.bin"

Music176_Header:: @ 8659D60
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music176_Track0

Music177_Track0:: @ 8659D6C
	.incbin "data/music/tracks/music177_track0.bin"

Music177_Header:: @ 8659DAC
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music177_Track0

Music178_Track0:: @ 8659DB8
	.incbin "data/music/tracks/music178_track0.bin"

Music178_Track1:: @ 8659E17
	.incbin "data/music/tracks/music178_track1.bin"

Music178_Header:: @ 8659E34
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music178_Track0
	.4byte Music178_Track1

Music179_Track0:: @ 8659E44
	.incbin "data/music/tracks/music179_track0.bin"

Music179_Track1:: @ 8659EA3
	.incbin "data/music/tracks/music179_track1.bin"

Music179_Header:: @ 8659EF0
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music179_Track0
	.4byte Music179_Track1

Music180_Track0:: @ 8659F00
	.incbin "data/music/tracks/music180_track0.bin"

Music180_Header:: @ 8659F48
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music180_Track0

Music181_Track0:: @ 8659F54
	.incbin "data/music/tracks/music181_track0.bin"

Music181_Track1:: @ 8659FA6
	.incbin "data/music/tracks/music181_track1.bin"

Music181_Header:: @ 8659FC4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music181_Track0
	.4byte Music181_Track1

Music182_Track0:: @ 8659FD4
	.incbin "data/music/tracks/music182_track0.bin"

Music182_Header:: @ 865A08C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music182_Track0

Music183_Track0:: @ 865A098
	.incbin "data/music/tracks/music183_track0.bin"

Music183_Header:: @ 865A148
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music183_Track0

Music184_Track0:: @ 865A154
	.incbin "data/music/tracks/music184_track0.bin"

Music184_Header:: @ 865A234
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music184_Track0

Music185_Track0:: @ 865A240
	.incbin "data/music/tracks/music185_track0.bin"

Music185_Header:: @ 865A274
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music185_Track0

Music186_Track0:: @ 865A280
	.incbin "data/music/tracks/music186_track0.bin"

Music186_Header:: @ 865A2D0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music186_Track0

Music187_Track0:: @ 865A2DC
	.incbin "data/music/tracks/music187_track0.bin"

Music187_Header:: @ 865A308
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music187_Track0

Music188_Track0:: @ 865A314
	.incbin "data/music/tracks/music188_track0.bin"

Music188_Header:: @ 865A3BC
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music188_Track0

Music189_Track0:: @ 865A3C8
	.incbin "data/music/tracks/music189_track0.bin"

Music189_Track1:: @ 865A42F
	.incbin "data/music/tracks/music189_track1.bin"

Music189_Header:: @ 865A45C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music189_Track0
	.4byte Music189_Track1

Music190_Track0:: @ 865A46C
	.incbin "data/music/tracks/music190_track0.bin"

Music190_Header:: @ 865A4C4
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music190_Track0

Music191_Track0:: @ 865A4D0
	.incbin "data/music/tracks/music191_track0.bin"

Music191_Track1:: @ 865A5CA
	.incbin "data/music/tracks/music191_track1.bin"

Music191_Header:: @ 865A5E8
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music191_Track0
	.4byte Music191_Track1

Music192_Track0:: @ 865A5F8
	.incbin "data/music/tracks/music192_track0.bin"

Music192_Track1:: @ 865A64B
	.incbin "data/music/tracks/music192_track1.bin"

Music192_Header:: @ 865A664
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music192_Track0
	.4byte Music192_Track1

Music193_Track0:: @ 865A674
	.incbin "data/music/tracks/music193_track0.bin"

Music193_Header:: @ 865A6C0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music193_Track0

Music194_Track0:: @ 865A6CC
	.incbin "data/music/tracks/music194_track0.bin"

Music194_Header:: @ 865A6F8
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music194_Track0

Music195_Track0:: @ 865A704
	.incbin "data/music/tracks/music195_track0.bin"

Music195_Header:: @ 865A748
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music195_Track0

Music196_Track0:: @ 865A754
	.incbin "data/music/tracks/music196_track0.bin"

Music196_Header:: @ 865A7D4
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music196_Track0

Music197_Track0:: @ 865A7E0
	.incbin "data/music/tracks/music197_track0.bin"

Music197_Track1:: @ 865A815
	.incbin "data/music/tracks/music197_track1.bin"

Music197_Header:: @ 865A838
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music197_Track0
	.4byte Music197_Track1

Music198_Track0:: @ 865A848
	.incbin "data/music/tracks/music198_track0.bin"

Music198_Track1:: @ 865A889
	.incbin "data/music/tracks/music198_track1.bin"

Music198_Header:: @ 865A8B0
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music198_Track0
	.4byte Music198_Track1

Music199_Track0:: @ 865A8C0
	.incbin "data/music/tracks/music199_track0.bin"

Music199_Header:: @ 865A918
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music199_Track0

Music200_Track0:: @ 865A924
	.incbin "data/music/tracks/music200_track0.bin"

Music200_Header:: @ 865AA6C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music200_Track0

Music201_Track0:: @ 865AA78
	.incbin "data/music/tracks/music201_track0.bin"

Music201_Header:: @ 865AB40
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music201_Track0

Music202_Track0:: @ 865AB4C
	.incbin "data/music/tracks/music202_track0.bin"

Music202_Track1:: @ 865ABE9
	.incbin "data/music/tracks/music202_track1.bin"

Music202_Header:: @ 865AC50
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music202_Track0
	.4byte Music202_Track1

Music203_Track0:: @ 865AC60
	.incbin "data/music/tracks/music203_track0.bin"

Music203_Header:: @ 865AD34
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music203_Track0

Music204_Track0:: @ 865AD40
	.incbin "data/music/tracks/music204_track0.bin"

Music204_Header:: @ 865AE14
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music204_Track0

Music205_Track0:: @ 865AE20
	.incbin "data/music/tracks/music205_track0.bin"

Music205_Header:: @ 865AE60
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music205_Track0

Music206_Track0:: @ 865AE6C
	.incbin "data/music/tracks/music206_track0.bin"

Music206_Track1:: @ 865AED9
	.incbin "data/music/tracks/music206_track1.bin"

Music206_Header:: @ 865AEEC
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music206_Track0
	.4byte Music206_Track1

Music207_Track0:: @ 865AEFC
	.incbin "data/music/tracks/music207_track0.bin"

Music207_Track1:: @ 865B014
	.incbin "data/music/tracks/music207_track1.bin"

Music207_Header:: @ 865B07C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music207_Track0
	.4byte Music207_Track1

Music208_Track0:: @ 865B08C
	.incbin "data/music/tracks/music208_track0.bin"

Music208_Track1:: @ 865B1B4
	.incbin "data/music/tracks/music208_track1.bin"

Music208_Header:: @ 865B21C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music208_Track0
	.4byte Music208_Track1

Music209_Track0:: @ 865B22C
	.incbin "data/music/tracks/music209_track0.bin"

Music209_Header:: @ 865B28C
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music209_Track0

Music210_Track0:: @ 865B298
	.incbin "data/music/tracks/music210_track0.bin"

Music210_Header:: @ 865B2DC
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music210_Track0

Music211_Track0:: @ 865B2E8
	.incbin "data/music/tracks/music211_track0.bin"

Music211_Track1:: @ 865B37E
	.incbin "data/music/tracks/music211_track1.bin"

Music211_Header:: @ 865B400
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music211_Track0
	.4byte Music211_Track1

Music212_Track0:: @ 865B410
	.incbin "data/music/tracks/music212_track0.bin"

Music212_Header:: @ 865B480
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music212_Track0

Music213_Track0:: @ 865B48C
	.incbin "data/music/tracks/music213_track0.bin"

Music213_Header:: @ 865B570
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music213_Track0

Music214_Track0:: @ 865B57C
	.incbin "data/music/tracks/music214_track0.bin"

Music214_Track1:: @ 865B5AD
	.incbin "data/music/tracks/music214_track1.bin"

Music214_Header:: @ 865B5D4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music214_Track0
	.4byte Music214_Track1

Music215_Track0:: @ 865B5E4
	.incbin "data/music/tracks/music215_track0.bin"

Music215_Track1:: @ 865B612
	.incbin "data/music/tracks/music215_track1.bin"

Music215_Header:: @ 865B630
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music215_Track0
	.4byte Music215_Track1

Music216_Track0:: @ 865B640
	.incbin "data/music/tracks/music216_track0.bin"

Music216_Track1:: @ 865B6BD
	.incbin "data/music/tracks/music216_track1.bin"

Music216_Header:: @ 865B6E4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music216_Track0
	.4byte Music216_Track1

Music217_Track0:: @ 865B6F4
	.incbin "data/music/tracks/music217_track0.bin"

Music217_Track1:: @ 865B85B
	.incbin "data/music/tracks/music217_track1.bin"

Music217_Header:: @ 865B8E0
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music217_Track0
	.4byte Music217_Track1

Music218_Track0:: @ 865B8F0
	.incbin "data/music/tracks/music218_track0.bin"

Music218_Header:: @ 865BA00
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music218_Track0

Music219_Track0:: @ 865BA0C
	.incbin "data/music/tracks/music219_track0.bin"

Music219_Track1:: @ 865BAD7
	.incbin "data/music/tracks/music219_track1.bin"

Music219_Header:: @ 865BB70
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music219_Track0
	.4byte Music219_Track1

Music220_Track0:: @ 865BB80
	.incbin "data/music/tracks/music220_track0.bin"

Music220_Track1:: @ 865BBC6
	.incbin "data/music/tracks/music220_track1.bin"

Music220_Header:: @ 865BBE0
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music220_Track0
	.4byte Music220_Track1

Music221_Track0:: @ 865BBF0
	.incbin "data/music/tracks/music221_track0.bin"

Music221_Track1:: @ 865BC67
	.incbin "data/music/tracks/music221_track1.bin"

Music221_Header:: @ 865BC78
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music221_Track0
	.4byte Music221_Track1

Music222_Track0:: @ 865BC88
	.incbin "data/music/tracks/music222_track0.bin"

Music222_Header:: @ 865BCB0
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music222_Track0

Music223_Track0:: @ 865BCBC
	.incbin "data/music/tracks/music223_track0.bin"

Music223_Header:: @ 865BD88
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music223_Track0

Music224_Track0:: @ 865BD94
	.incbin "data/music/tracks/music224_track0.bin"

Music224_Track1:: @ 865BE3D
	.incbin "data/music/tracks/music224_track1.bin"

Music224_Header:: @ 865BE60
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music224_Track0
	.4byte Music224_Track1

Music225_Track0:: @ 865BE70
	.incbin "data/music/tracks/music225_track0.bin"

Music225_Track1:: @ 865BEF5
	.incbin "data/music/tracks/music225_track1.bin"

Music225_Header:: @ 865BF0C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music225_Track0
	.4byte Music225_Track1

Music226_Track0:: @ 865BF1C
	.incbin "data/music/tracks/music226_track0.bin"

Music226_Track1:: @ 865BF68
	.incbin "data/music/tracks/music226_track1.bin"

Music226_Header:: @ 865BFA4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music226_Track0
	.4byte Music226_Track1

Music227_Track0:: @ 865BFB4
	.incbin "data/music/tracks/music227_track0.bin"

Music227_Track1:: @ 865BFF7
	.incbin "data/music/tracks/music227_track1.bin"

Music227_Header:: @ 865C03C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music227_Track0
	.4byte Music227_Track1

Music228_Track0:: @ 865C04C
	.incbin "data/music/tracks/music228_track0.bin"

Music228_Track1:: @ 865C0A5
	.incbin "data/music/tracks/music228_track1.bin"

Music228_Header:: @ 865C0E4
	.byte 2 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music228_Track0
	.4byte Music228_Track1

Music229_Track0:: @ 865C0F4
	.incbin "data/music/tracks/music229_track0.bin"

Music229_Header:: @ 865C130
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music229_Track0

Music230_Track0:: @ 865C13C
	.incbin "data/music/tracks/music230_track0.bin"

Music230_Track1:: @ 865C1D2
	.incbin "data/music/tracks/music230_track1.bin"

Music230_Header:: @ 865C22C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music230_Track0
	.4byte Music230_Track1

Music231_Track0:: @ 865C23C
	.incbin "data/music/tracks/music231_track0.bin"

Music231_Track1:: @ 865C27B
	.incbin "data/music/tracks/music231_track1.bin"

Music231_Header:: @ 865C2C0
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music231_Track0
	.4byte Music231_Track1

Music232_Track0:: @ 865C2D0
	.incbin "data/music/tracks/music232_track0.bin"

Music232_Track1:: @ 865C311
	.incbin "data/music/tracks/music232_track1.bin"

Music232_Header:: @ 865C324
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music232_Track0
	.4byte Music232_Track1

Music233_Track0:: @ 865C334
	.incbin "data/music/tracks/music233_track0.bin"

Music233_Track1:: @ 865C3A2
	.incbin "data/music/tracks/music233_track1.bin"

Music233_Header:: @ 865C3C0
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music233_Track0
	.4byte Music233_Track1

Music234_Track0:: @ 865C3D0
	.incbin "data/music/tracks/music234_track0.bin"

Music234_Track1:: @ 865C521
	.incbin "data/music/tracks/music234_track1.bin"

Music234_Header:: @ 865C5C8
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music234_Track0
	.4byte Music234_Track1

Music235_Track0:: @ 865C5D8
	.incbin "data/music/tracks/music235_track0.bin"

Music235_Track1:: @ 865C696
	.incbin "data/music/tracks/music235_track1.bin"

Music235_Header:: @ 865C6C4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music235_Track0
	.4byte Music235_Track1

Music236_Track0:: @ 865C6D4
	.incbin "data/music/tracks/music236_track0.bin"

Music236_Track1:: @ 865C747
	.incbin "data/music/tracks/music236_track1.bin"

Music236_Header:: @ 865C7B4
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music236_Track0
	.4byte Music236_Track1

Music237_Track0:: @ 865C7C4
	.incbin "data/music/tracks/music237_track0.bin"

Music237_Track1:: @ 865C818
	.incbin "data/music/tracks/music237_track1.bin"

Music237_Header:: @ 865C838
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music237_Track0
	.4byte Music237_Track1

Music238_Track0:: @ 865C848
	.incbin "data/music/tracks/music238_track0.bin"

Music238_Track1:: @ 865C895
	.incbin "data/music/tracks/music238_track1.bin"

Music238_Header:: @ 865C8AC
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music238_Track0
	.4byte Music238_Track1

Music239_Track0:: @ 865C8BC
	.incbin "data/music/tracks/music239_track0.bin"

Music239_Track1:: @ 865C9E6
	.incbin "data/music/tracks/music239_track1.bin"

Music239_Header:: @ 865CA2C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music239_Track0
	.4byte Music239_Track1

Music240_Track0:: @ 865CA3C
	.incbin "data/music/tracks/music240_track0.bin"

Music240_Track1:: @ 865CB01
	.incbin "data/music/tracks/music240_track1.bin"

Music240_Header:: @ 865CB30
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music240_Track0
	.4byte Music240_Track1

Music241_Track0:: @ 865CB40
	.incbin "data/music/tracks/music241_track0.bin"

Music241_Header:: @ 865CB90
	.byte 1 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music241_Track0

Music242_Track0:: @ 865CB9C
	.incbin "data/music/tracks/music242_track0.bin"

Music242_Track1:: @ 865CBE1
	.incbin "data/music/tracks/music242_track1.bin"

Music242_Header:: @ 865CC00
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music242_Track0
	.4byte Music242_Track1

Music243_Track0:: @ 865CC10
	.incbin "data/music/tracks/music243_track0.bin"

Music243_Track1:: @ 865CCAE
	.incbin "data/music/tracks/music243_track1.bin"

Music243_Header:: @ 865CD1C
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music243_Track0
	.4byte Music243_Track1

Music244_Track0:: @ 865CD2C
	.incbin "data/music/tracks/music244_track0.bin"

Music244_Track1:: @ 865CD85
	.incbin "data/music/tracks/music244_track1.bin"

Music244_Header:: @ 865CDC0
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music244_Track0
	.4byte Music244_Track1

Music245_Track0:: @ 865CDD0
	.incbin "data/music/tracks/music245_track0.bin"

Music245_Track1:: @ 865CEE8
	.incbin "data/music/tracks/music245_track1.bin"

Music245_Header:: @ 865CF30
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music245_Track0
	.4byte Music245_Track1

Music246_Track0:: @ 865CF40
	.incbin "data/music/tracks/music246_track0.bin"

Music246_Track1:: @ 865D026
	.incbin "data/music/tracks/music246_track1.bin"

Music246_Header:: @ 865D064
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music246_Track0
	.4byte Music246_Track1

Music247_Track0:: @ 865D074
	.incbin "data/music/tracks/music247_track0.bin"

Music247_Track1:: @ 865D0CB
	.incbin "data/music/tracks/music247_track1.bin"

Music247_Header:: @ 865D0E8
	.byte 2 @ number of tracks
	.byte 0, 4, 178 @ unknown
	.4byte 0x08451F90 @ voice group pointer
	.4byte Music247_Track0
	.4byte Music247_Track1

Music248_Track0:: @ 865D0F8
	.incbin "data/music/tracks/music248_track0.bin"

Music248_Header:: @ 865D108
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music248_Track0

Music249_Track0:: @ 865D114
	.incbin "data/music/tracks/music249_track0.bin"

Music249_Header:: @ 865D12C
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music249_Track0

Music250_Track0:: @ 865D138
	.incbin "data/music/tracks/music250_track0.bin"

Music250_Header:: @ 865D148
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music250_Track0

Music251_Track0:: @ 865D154
	.incbin "data/music/tracks/music251_track0.bin"

Music251_Header:: @ 865D164
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music251_Track0

Music252_Track0:: @ 865D170
	.incbin "data/music/tracks/music252_track0.bin"

Music252_Header:: @ 865D188
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music252_Track0

Music253_Track0:: @ 865D194
	.incbin "data/music/tracks/music253_track0.bin"

Music253_Header:: @ 865D1A4
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music253_Track0

Music254_Track0:: @ 865D1B0
	.incbin "data/music/tracks/music254_track0.bin"

Music254_Header:: @ 865D1C0
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music254_Track0

Music255_Track0:: @ 865D1CC
	.incbin "data/music/tracks/music255_track0.bin"

Music255_Header:: @ 865D1E4
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music255_Track0

Music256_Track0:: @ 865D1F0
	.incbin "data/music/tracks/music256_track0.bin"

Music256_Header:: @ 865D200
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music256_Track0

Music257_Track0:: @ 865D20C
	.incbin "data/music/tracks/music257_track0.bin"

Music257_Header:: @ 865D21C
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music257_Track0

Music258_Track0:: @ 865D228
	.incbin "data/music/tracks/music258_track0.bin"

Music258_Header:: @ 865D240
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music258_Track0

Music259_Track0:: @ 865D24C
	.incbin "data/music/tracks/music259_track0.bin"

Music259_Header:: @ 865D25C
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music259_Track0

Music260_Track0:: @ 865D268
	.incbin "data/music/tracks/music260_track0.bin"

Music260_Header:: @ 865D278
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music260_Track0

Music261_Track0:: @ 865D284
	.incbin "data/music/tracks/music261_track0.bin"

Music261_Header:: @ 865D29C
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music261_Track0

Music262_Track0:: @ 865D2A8
	.incbin "data/music/tracks/music262_track0.bin"

Music262_Header:: @ 865D2B8
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music262_Track0

Music263_Track0:: @ 865D2C4
	.incbin "data/music/tracks/music263_track0.bin"

Music263_Header:: @ 865D2D4
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music263_Track0

Music264_Track0:: @ 865D2E0
	.incbin "data/music/tracks/music264_track0.bin"

Music264_Header:: @ 865D2F8
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music264_Track0

Music265_Track0:: @ 865D304
	.incbin "data/music/tracks/music265_track0.bin"

Music265_Header:: @ 865D314
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music265_Track0

Music266_Track0:: @ 865D320
	.incbin "data/music/tracks/music266_track0.bin"

Music266_Header:: @ 865D330
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music266_Track0

Music267_Track0:: @ 865D33C
	.incbin "data/music/tracks/music267_track0.bin"

Music267_Header:: @ 865D354
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music267_Track0

Music268_Track0:: @ 865D360
	.incbin "data/music/tracks/music268_track0.bin"

Music268_Header:: @ 865D370
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music268_Track0

Music269_Track0:: @ 865D37C
	.incbin "data/music/tracks/music269_track0.bin"

Music269_Header:: @ 865D38C
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music269_Track0

Music270_Track0:: @ 865D398
	.incbin "data/music/tracks/music270_track0.bin"

Music270_Header:: @ 865D3B0
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music270_Track0

Music271_Track0:: @ 865D3BC
	.incbin "data/music/tracks/music271_track0.bin"

Music271_Header:: @ 865D3CC
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music271_Track0

Music272_Track0:: @ 865D3D8
	.incbin "data/music/tracks/music272_track0.bin"

Music272_Header:: @ 865D3E8
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music272_Track0

Music273_Track0:: @ 865D3F4
	.incbin "data/music/tracks/music273_track0.bin"

Music273_Header:: @ 865D40C
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music273_Track0

Music274_Track0:: @ 865D418
	.incbin "data/music/tracks/music274_track0.bin"

Music274_Header:: @ 865D428
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music274_Track0

Music275_Track0:: @ 865D434
	.incbin "data/music/tracks/music275_track0.bin"

Music275_Header:: @ 865D444
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music275_Track0

Music276_Track0:: @ 865D450
	.incbin "data/music/tracks/music276_track0.bin"

Music276_Header:: @ 865D468
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music276_Track0

Music277_Track0:: @ 865D474
	.incbin "data/music/tracks/music277_track0.bin"

Music277_Header:: @ 865D484
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music277_Track0

Music278_Track0:: @ 865D490
	.incbin "data/music/tracks/music278_track0.bin"

Music278_Header:: @ 865D4A0
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music278_Track0

Music279_Track0:: @ 865D4AC
	.incbin "data/music/tracks/music279_track0.bin"

Music279_Header:: @ 865D4C4
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music279_Track0

Music280_Track0:: @ 865D4D0
	.incbin "data/music/tracks/music280_track0.bin"

Music280_Header:: @ 865D4E0
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music280_Track0

Music281_Track0:: @ 865D4EC
	.incbin "data/music/tracks/music281_track0.bin"

Music281_Header:: @ 865D4FC
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music281_Track0

Music282_Track0:: @ 865D508
	.incbin "data/music/tracks/music282_track0.bin"

Music282_Header:: @ 865D520
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music282_Track0

Music283_Track0:: @ 865D52C
	.incbin "data/music/tracks/music283_track0.bin"

Music283_Header:: @ 865D53C
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music283_Track0

Music284_Track0:: @ 865D548
	.incbin "data/music/tracks/music284_track0.bin"

Music284_Header:: @ 865D558
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music284_Track0

Music285_Track0:: @ 865D564
	.incbin "data/music/tracks/music285_track0.bin"

Music285_Header:: @ 865D57C
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music285_Track0

Music286_Track0:: @ 865D588
	.incbin "data/music/tracks/music286_track0.bin"

Music286_Header:: @ 865D598
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music286_Track0

Music287_Track0:: @ 865D5A4
	.incbin "data/music/tracks/music287_track0.bin"

Music287_Header:: @ 865D5B4
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music287_Track0

Music288_Track0:: @ 865D5C0
	.incbin "data/music/tracks/music288_track0.bin"

Music288_Header:: @ 865D5D8
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music288_Track0

Music289_Track0:: @ 865D5E4
	.incbin "data/music/tracks/music289_track0.bin"

Music289_Header:: @ 865D5F4
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music289_Track0

Music290_Track0:: @ 865D600
	.incbin "data/music/tracks/music290_track0.bin"

Music290_Header:: @ 865D610
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music290_Track0

Music291_Track0:: @ 865D61C
	.incbin "data/music/tracks/music291_track0.bin"

Music291_Header:: @ 865D634
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music291_Track0

Music292_Track0:: @ 865D640
	.incbin "data/music/tracks/music292_track0.bin"

Music292_Header:: @ 865D650
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music292_Track0

Music293_Track0:: @ 865D65C
	.incbin "data/music/tracks/music293_track0.bin"

Music293_Header:: @ 865D66C
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music293_Track0

Music294_Track0:: @ 865D678
	.incbin "data/music/tracks/music294_track0.bin"

Music294_Header:: @ 865D690
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music294_Track0

Music295_Track0:: @ 865D69C
	.incbin "data/music/tracks/music295_track0.bin"

Music295_Header:: @ 865D6AC
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music295_Track0

Music296_Track0:: @ 865D6B8
	.incbin "data/music/tracks/music296_track0.bin"

Music296_Header:: @ 865D6C8
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music296_Track0

Music297_Track0:: @ 865D6D4
	.incbin "data/music/tracks/music297_track0.bin"

Music297_Header:: @ 865D6EC
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music297_Track0

Music298_Track0:: @ 865D6F8
	.incbin "data/music/tracks/music298_track0.bin"

Music298_Header:: @ 865D708
	.byte 1 @ number of tracks
	.byte 0, 4, 0 @ unknown
	.4byte 0x084549F0 @ voice group pointer
	.4byte Music298_Track0

Music350_Track0:: @ 865D714
	.incbin "data/music/tracks/music350_track0.bin"

Music350_Track1:: @ 865D797
	.incbin "data/music/tracks/music350_track1.bin"

Music350_Track2:: @ 865D919
	.incbin "data/music/tracks/music350_track2.bin"

Music350_Track3:: @ 865DB5D
	.incbin "data/music/tracks/music350_track3.bin"

Music350_Track4:: @ 865DB8C
	.incbin "data/music/tracks/music350_track4.bin"

Music350_Track5:: @ 865DC41
	.incbin "data/music/tracks/music350_track5.bin"

Music350_Track6:: @ 865DC7E
	.incbin "data/music/tracks/music350_track6.bin"

Music350_Track7:: @ 865DF71
	.incbin "data/music/tracks/music350_track7.bin"

Music350_Track8:: @ 865E076
	.incbin "data/music/tracks/music350_track8.bin"

Music350_Header:: @ 865E100
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08436C9C @ voice group pointer
	.4byte Music350_Track0
	.4byte Music350_Track1
	.4byte Music350_Track2
	.4byte Music350_Track3
	.4byte Music350_Track4
	.4byte Music350_Track5
	.4byte Music350_Track6
	.4byte Music350_Track7
	.4byte Music350_Track8

Music351_Track0:: @ 865E12C
	.incbin "data/music/tracks/music351_track0.bin"

Music351_Track1:: @ 865E255
	.incbin "data/music/tracks/music351_track1.bin"

Music351_Track2:: @ 865E33C
	.incbin "data/music/tracks/music351_track2.bin"

Music351_Track3:: @ 865E417
	.incbin "data/music/tracks/music351_track3.bin"

Music351_Header:: @ 865E4D8
	.byte 4 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0842FC88 @ voice group pointer
	.4byte Music351_Track0
	.4byte Music351_Track1
	.4byte Music351_Track2
	.4byte Music351_Track3

Music352_Track0:: @ 865E4F0
	.incbin "data/music/tracks/music352_track0.bin"

Music352_Track1:: @ 865E585
	.incbin "data/music/tracks/music352_track1.bin"

Music352_Track2:: @ 865E5F7
	.incbin "data/music/tracks/music352_track2.bin"

Music352_Track3:: @ 865E768
	.incbin "data/music/tracks/music352_track3.bin"

Music352_Track4:: @ 865E7A6
	.incbin "data/music/tracks/music352_track4.bin"

Music352_Track5:: @ 865E813
	.incbin "data/music/tracks/music352_track5.bin"

Music352_Track6:: @ 865E866
	.incbin "data/music/tracks/music352_track6.bin"

Music352_Header:: @ 865E90C
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08434728 @ voice group pointer
	.4byte Music352_Track0
	.4byte Music352_Track1
	.4byte Music352_Track2
	.4byte Music352_Track3
	.4byte Music352_Track4
	.4byte Music352_Track5
	.4byte Music352_Track6

Music353_Track0:: @ 865E930
	.incbin "data/music/tracks/music353_track0.bin"

Music353_Track1:: @ 865E9F3
	.incbin "data/music/tracks/music353_track1.bin"

Music353_Track2:: @ 865EA92
	.incbin "data/music/tracks/music353_track2.bin"

Music353_Track3:: @ 865EC2D
	.incbin "data/music/tracks/music353_track3.bin"

Music353_Track4:: @ 865EC96
	.incbin "data/music/tracks/music353_track4.bin"

Music353_Track5:: @ 865ED30
	.incbin "data/music/tracks/music353_track5.bin"

Music353_Track6:: @ 865ED9A
	.incbin "data/music/tracks/music353_track6.bin"

Music353_Header:: @ 865EE3C
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08434728 @ voice group pointer
	.4byte Music353_Track0
	.4byte Music353_Track1
	.4byte Music353_Track2
	.4byte Music353_Track3
	.4byte Music353_Track4
	.4byte Music353_Track5
	.4byte Music353_Track6

Music354_Track0:: @ 865EE60
	.incbin "data/music/tracks/music354_track0.bin"

Music354_Track1:: @ 865F089
	.incbin "data/music/tracks/music354_track1.bin"

Music354_Track2:: @ 865F33A
	.incbin "data/music/tracks/music354_track2.bin"

Music354_Track3:: @ 865F4A3
	.incbin "data/music/tracks/music354_track3.bin"

Music354_Track4:: @ 865F6D1
	.incbin "data/music/tracks/music354_track4.bin"

Music354_Track5:: @ 865F917
	.incbin "data/music/tracks/music354_track5.bin"

Music354_Track6:: @ 865FA85
	.incbin "data/music/tracks/music354_track6.bin"

Music354_Track7:: @ 865FBA5
	.incbin "data/music/tracks/music354_track7.bin"

Music354_Header:: @ 865FD2C
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084342E4 @ voice group pointer
	.4byte Music354_Track0
	.4byte Music354_Track1
	.4byte Music354_Track2
	.4byte Music354_Track3
	.4byte Music354_Track4
	.4byte Music354_Track5
	.4byte Music354_Track6
	.4byte Music354_Track7

Music355_Track0:: @ 865FD54
	.incbin "data/music/tracks/music355_track0.bin"

Music355_Track1:: @ 865FF39
	.incbin "data/music/tracks/music355_track1.bin"

Music355_Track2:: @ 86600EE
	.incbin "data/music/tracks/music355_track2.bin"

Music355_Track3:: @ 86601F7
	.incbin "data/music/tracks/music355_track3.bin"

Music355_Track4:: @ 86603D2
	.incbin "data/music/tracks/music355_track4.bin"

Music355_Track5:: @ 866059B
	.incbin "data/music/tracks/music355_track5.bin"

Music355_Track6:: @ 86606C7
	.incbin "data/music/tracks/music355_track6.bin"

Music355_Track7:: @ 86607B3
	.incbin "data/music/tracks/music355_track7.bin"

Music355_Header:: @ 86608C0
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084358F8 @ voice group pointer
	.4byte Music355_Track0
	.4byte Music355_Track1
	.4byte Music355_Track2
	.4byte Music355_Track3
	.4byte Music355_Track4
	.4byte Music355_Track5
	.4byte Music355_Track6
	.4byte Music355_Track7

Music356_Track0:: @ 86608E8
	.incbin "data/music/tracks/music356_track0.bin"

Music356_Track1:: @ 86609FA
	.incbin "data/music/tracks/music356_track1.bin"

Music356_Track2:: @ 8660AD8
	.incbin "data/music/tracks/music356_track2.bin"

Music356_Header:: @ 8660BA4
	.byte 3 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0842FC88 @ voice group pointer
	.4byte Music356_Track0
	.4byte Music356_Track1
	.4byte Music356_Track2

Music357_Track0:: @ 8660BB8
	.incbin "data/music/tracks/music357_track0.bin"

Music357_Track1:: @ 8660D59
	.incbin "data/music/tracks/music357_track1.bin"

Music357_Track2:: @ 8660EC5
	.incbin "data/music/tracks/music357_track2.bin"

Music357_Track3:: @ 8661002
	.incbin "data/music/tracks/music357_track3.bin"

Music357_Header:: @ 8661164
	.byte 4 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0842FC88 @ voice group pointer
	.4byte Music357_Track0
	.4byte Music357_Track1
	.4byte Music357_Track2
	.4byte Music357_Track3

Music358_Track0:: @ 866117C
	.incbin "data/music/tracks/music358_track0.bin"

Music358_Track1:: @ 866142F
	.incbin "data/music/tracks/music358_track1.bin"

Music358_Track2:: @ 86617A9
	.incbin "data/music/tracks/music358_track2.bin"

Music358_Header:: @ 8661B3C
	.byte 3 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0842FC88 @ voice group pointer
	.4byte Music358_Track0
	.4byte Music358_Track1
	.4byte Music358_Track2

Music359_Track0:: @ 8661B50
	.incbin "data/music/tracks/music359_track0.bin"

Music359_Track1:: @ 8661C89
	.incbin "data/music/tracks/music359_track1.bin"

Music359_Track2:: @ 8661DAE
	.incbin "data/music/tracks/music359_track2.bin"

Music359_Track3:: @ 8661EBF
	.incbin "data/music/tracks/music359_track3.bin"

Music359_Track4:: @ 8662069
	.incbin "data/music/tracks/music359_track4.bin"

Music359_Track5:: @ 86621B8
	.incbin "data/music/tracks/music359_track5.bin"

Music359_Track6:: @ 8662251
	.incbin "data/music/tracks/music359_track6.bin"

Music359_Track7:: @ 86622F6
	.incbin "data/music/tracks/music359_track7.bin"

Music359_Header:: @ 8662408
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08430C9C @ voice group pointer
	.4byte Music359_Track0
	.4byte Music359_Track1
	.4byte Music359_Track2
	.4byte Music359_Track3
	.4byte Music359_Track4
	.4byte Music359_Track5
	.4byte Music359_Track6
	.4byte Music359_Track7

Music360_Track0:: @ 8662430
	.incbin "data/music/tracks/music360_track0.bin"

Music360_Track1:: @ 8662623
	.incbin "data/music/tracks/music360_track1.bin"

Music360_Track2:: @ 86627E4
	.incbin "data/music/tracks/music360_track2.bin"

Music360_Track3:: @ 8662909
	.incbin "data/music/tracks/music360_track3.bin"

Music360_Track4:: @ 8662ABA
	.incbin "data/music/tracks/music360_track4.bin"

Music360_Track5:: @ 8662C8B
	.incbin "data/music/tracks/music360_track5.bin"

Music360_Track6:: @ 8662DB7
	.incbin "data/music/tracks/music360_track6.bin"

Music360_Track7:: @ 8662E88
	.incbin "data/music/tracks/music360_track7.bin"

Music360_Track8:: @ 8662EE6
	.incbin "data/music/tracks/music360_track8.bin"

Music360_Header:: @ 8662F80
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084308AC @ voice group pointer
	.4byte Music360_Track0
	.4byte Music360_Track1
	.4byte Music360_Track2
	.4byte Music360_Track3
	.4byte Music360_Track4
	.4byte Music360_Track5
	.4byte Music360_Track6
	.4byte Music360_Track7
	.4byte Music360_Track8

Music361_Track0:: @ 8662FAC
	.incbin "data/music/tracks/music361_track0.bin"

Music361_Track1:: @ 86630D6
	.incbin "data/music/tracks/music361_track1.bin"

Music361_Track2:: @ 8663414
	.incbin "data/music/tracks/music361_track2.bin"

Music361_Track3:: @ 866378C
	.incbin "data/music/tracks/music361_track3.bin"

Music361_Track4:: @ 8663A0F
	.incbin "data/music/tracks/music361_track4.bin"

Music361_Track5:: @ 8663A43
	.incbin "data/music/tracks/music361_track5.bin"

Music361_Track6:: @ 8663D35
	.incbin "data/music/tracks/music361_track6.bin"

Music361_Track7:: @ 8664051
	.incbin "data/music/tracks/music361_track7.bin"

Music361_Header:: @ 866421C
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08431B9C @ voice group pointer
	.4byte Music361_Track0
	.4byte Music361_Track1
	.4byte Music361_Track2
	.4byte Music361_Track3
	.4byte Music361_Track4
	.4byte Music361_Track5
	.4byte Music361_Track6
	.4byte Music361_Track7

Music362_Track0:: @ 8664244
	.incbin "data/music/tracks/music362_track0.bin"

Music362_Track1:: @ 86643D2
	.incbin "data/music/tracks/music362_track1.bin"

Music362_Track2:: @ 86644C5
	.incbin "data/music/tracks/music362_track2.bin"

Music362_Track3:: @ 86645A9
	.incbin "data/music/tracks/music362_track3.bin"

Music362_Track4:: @ 8664739
	.incbin "data/music/tracks/music362_track4.bin"

Music362_Track5:: @ 86649F4
	.incbin "data/music/tracks/music362_track5.bin"

Music362_Track6:: @ 8664AA5
	.incbin "data/music/tracks/music362_track6.bin"

Music362_Track7:: @ 8664BA4
	.incbin "data/music/tracks/music362_track7.bin"

Music362_Header:: @ 8664CE0
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08431F98 @ voice group pointer
	.4byte Music362_Track0
	.4byte Music362_Track1
	.4byte Music362_Track2
	.4byte Music362_Track3
	.4byte Music362_Track4
	.4byte Music362_Track5
	.4byte Music362_Track6
	.4byte Music362_Track7

Music363_Track0:: @ 8664D08
	.incbin "data/music/tracks/music363_track0.bin"

Music363_Track1:: @ 8664ED0
	.incbin "data/music/tracks/music363_track1.bin"

Music363_Track2:: @ 866501F
	.incbin "data/music/tracks/music363_track2.bin"

Music363_Track3:: @ 86651DF
	.incbin "data/music/tracks/music363_track3.bin"

Music363_Track4:: @ 8665308
	.incbin "data/music/tracks/music363_track4.bin"

Music363_Track5:: @ 8665471
	.incbin "data/music/tracks/music363_track5.bin"

Music363_Track6:: @ 866557C
	.incbin "data/music/tracks/music363_track6.bin"

Music363_Header:: @ 86655CC
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08433138 @ voice group pointer
	.4byte Music363_Track0
	.4byte Music363_Track1
	.4byte Music363_Track2
	.4byte Music363_Track3
	.4byte Music363_Track4
	.4byte Music363_Track5
	.4byte Music363_Track6

Music364_Track0:: @ 86655F0
	.incbin "data/music/tracks/music364_track0.bin"

Music364_Track1:: @ 8665785
	.incbin "data/music/tracks/music364_track1.bin"

Music364_Track2:: @ 866587A
	.incbin "data/music/tracks/music364_track2.bin"

Music364_Track3:: @ 8665A5D
	.incbin "data/music/tracks/music364_track3.bin"

Music364_Track4:: @ 8665BE5
	.incbin "data/music/tracks/music364_track4.bin"

Music364_Track5:: @ 8665CEB
	.incbin "data/music/tracks/music364_track5.bin"

Music364_Track6:: @ 8665DCE
	.incbin "data/music/tracks/music364_track6.bin"

Music364_Header:: @ 8665FCC
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08431764 @ voice group pointer
	.4byte Music364_Track0
	.4byte Music364_Track1
	.4byte Music364_Track2
	.4byte Music364_Track3
	.4byte Music364_Track4
	.4byte Music364_Track5
	.4byte Music364_Track6

Music365_Track0:: @ 8665FF0
	.incbin "data/music/tracks/music365_track0.bin"

Music365_Track1:: @ 86662AF
	.incbin "data/music/tracks/music365_track1.bin"

Music365_Track2:: @ 86664BE
	.incbin "data/music/tracks/music365_track2.bin"

Music365_Track3:: @ 8666692
	.incbin "data/music/tracks/music365_track3.bin"

Music365_Track4:: @ 86668FC
	.incbin "data/music/tracks/music365_track4.bin"

Music365_Track5:: @ 8666BDF
	.incbin "data/music/tracks/music365_track5.bin"

Music365_Header:: @ 8666E70
	.byte 6 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084326F4 @ voice group pointer
	.4byte Music365_Track0
	.4byte Music365_Track1
	.4byte Music365_Track2
	.4byte Music365_Track3
	.4byte Music365_Track4
	.4byte Music365_Track5

Music366_Track0:: @ 8666E90
	.incbin "data/music/tracks/music366_track0.bin"

Music366_Track1:: @ 8666F1A
	.incbin "data/music/tracks/music366_track1.bin"

Music366_Track2:: @ 8666FF9
	.incbin "data/music/tracks/music366_track2.bin"

Music366_Track3:: @ 8667385
	.incbin "data/music/tracks/music366_track3.bin"

Music366_Track4:: @ 8667456
	.incbin "data/music/tracks/music366_track4.bin"

Music366_Track5:: @ 8667550
	.incbin "data/music/tracks/music366_track5.bin"

Music366_Track6:: @ 86675F3
	.incbin "data/music/tracks/music366_track6.bin"

Music366_Track7:: @ 86676B4
	.incbin "data/music/tracks/music366_track7.bin"

Music366_Track8:: @ 8667749
	.incbin "data/music/tracks/music366_track8.bin"

Music366_Header:: @ 8667790
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08432B38 @ voice group pointer
	.4byte Music366_Track0
	.4byte Music366_Track1
	.4byte Music366_Track2
	.4byte Music366_Track3
	.4byte Music366_Track4
	.4byte Music366_Track5
	.4byte Music366_Track6
	.4byte Music366_Track7
	.4byte Music366_Track8

Music367_Track0:: @ 86677BC
	.incbin "data/music/tracks/music367_track0.bin"

Music367_Track1:: @ 86677DC
	.incbin "data/music/tracks/music367_track1.bin"

Music367_Track2:: @ 8667800
	.incbin "data/music/tracks/music367_track2.bin"

Music367_Track3:: @ 866781E
	.incbin "data/music/tracks/music367_track3.bin"

Music367_Track4:: @ 8667850
	.incbin "data/music/tracks/music367_track4.bin"

Music367_Header:: @ 8667884
	.byte 5 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x0843129C @ voice group pointer
	.4byte Music367_Track0
	.4byte Music367_Track1
	.4byte Music367_Track2
	.4byte Music367_Track3
	.4byte Music367_Track4

Music368_Track0:: @ 86678A0
	.incbin "data/music/tracks/music368_track0.bin"

Music368_Track1:: @ 86678C8
	.incbin "data/music/tracks/music368_track1.bin"

Music368_Track2:: @ 86678EB
	.incbin "data/music/tracks/music368_track2.bin"

Music368_Track3:: @ 866790B
	.incbin "data/music/tracks/music368_track3.bin"

Music368_Header:: @ 8667950
	.byte 4 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x0843129C @ voice group pointer
	.4byte Music368_Track0
	.4byte Music368_Track1
	.4byte Music368_Track2
	.4byte Music368_Track3

Music369_Track0:: @ 8667968
	.incbin "data/music/tracks/music369_track0.bin"

Music369_Track1:: @ 86679F3
	.incbin "data/music/tracks/music369_track1.bin"

Music369_Track2:: @ 8667A69
	.incbin "data/music/tracks/music369_track2.bin"

Music369_Track3:: @ 8667A9C
	.incbin "data/music/tracks/music369_track3.bin"

Music369_Track4:: @ 8667AD4
	.incbin "data/music/tracks/music369_track4.bin"

Music369_Track5:: @ 8667B7F
	.incbin "data/music/tracks/music369_track5.bin"

Music369_Track6:: @ 8667BA0
	.incbin "data/music/tracks/music369_track6.bin"

Music369_Header:: @ 8667C1C
	.byte 7 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x0843129C @ voice group pointer
	.4byte Music369_Track0
	.4byte Music369_Track1
	.4byte Music369_Track2
	.4byte Music369_Track3
	.4byte Music369_Track4
	.4byte Music369_Track5
	.4byte Music369_Track6

Music370_Track0:: @ 8667C40
	.incbin "data/music/tracks/music370_track0.bin"

Music370_Track1:: @ 8667C75
	.incbin "data/music/tracks/music370_track1.bin"

Music370_Track2:: @ 8667CA7
	.incbin "data/music/tracks/music370_track2.bin"

Music370_Track3:: @ 8667CCD
	.incbin "data/music/tracks/music370_track3.bin"

Music370_Track4:: @ 8667D05
	.incbin "data/music/tracks/music370_track4.bin"

Music370_Track5:: @ 8667D3D
	.incbin "data/music/tracks/music370_track5.bin"

Music370_Header:: @ 8667D70
	.byte 6 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x0843129C @ voice group pointer
	.4byte Music370_Track0
	.4byte Music370_Track1
	.4byte Music370_Track2
	.4byte Music370_Track3
	.4byte Music370_Track4
	.4byte Music370_Track5

Music371_Track0:: @ 8667D90
	.incbin "data/music/tracks/music371_track0.bin"

Music371_Track1:: @ 8667DD0
	.incbin "data/music/tracks/music371_track1.bin"

Music371_Track2:: @ 8667E11
	.incbin "data/music/tracks/music371_track2.bin"

Music371_Track3:: @ 8667E31
	.incbin "data/music/tracks/music371_track3.bin"

Music371_Track4:: @ 8667E6C
	.incbin "data/music/tracks/music371_track4.bin"

Music371_Track5:: @ 8667EAA
	.incbin "data/music/tracks/music371_track5.bin"

Music371_Track6:: @ 8667EC9
	.incbin "data/music/tracks/music371_track6.bin"

Music371_Header:: @ 8667F0C
	.byte 7 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x0843129C @ voice group pointer
	.4byte Music371_Track0
	.4byte Music371_Track1
	.4byte Music371_Track2
	.4byte Music371_Track3
	.4byte Music371_Track4
	.4byte Music371_Track5
	.4byte Music371_Track6

Music372_Track0:: @ 8667F30
	.incbin "data/music/tracks/music372_track0.bin"

Music372_Track1:: @ 8667F5B
	.incbin "data/music/tracks/music372_track1.bin"

Music372_Track2:: @ 8667F84
	.incbin "data/music/tracks/music372_track2.bin"

Music372_Track3:: @ 8667F9B
	.incbin "data/music/tracks/music372_track3.bin"

Music372_Track4:: @ 8667FDF
	.incbin "data/music/tracks/music372_track4.bin"

Music372_Track5:: @ 8668028
	.incbin "data/music/tracks/music372_track5.bin"

Music372_Track6:: @ 8668045
	.incbin "data/music/tracks/music372_track6.bin"

Music372_Header:: @ 8668098
	.byte 7 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x0843129C @ voice group pointer
	.4byte Music372_Track0
	.4byte Music372_Track1
	.4byte Music372_Track2
	.4byte Music372_Track3
	.4byte Music372_Track4
	.4byte Music372_Track5
	.4byte Music372_Track6

Music373_Track0:: @ 86680BC
	.incbin "data/music/tracks/music373_track0.bin"

Music373_Track1:: @ 8668411
	.incbin "data/music/tracks/music373_track1.bin"

Music373_Track2:: @ 866856B
	.incbin "data/music/tracks/music373_track2.bin"

Music373_Track3:: @ 866878F
	.incbin "data/music/tracks/music373_track3.bin"

Music373_Track4:: @ 86688FF
	.incbin "data/music/tracks/music373_track4.bin"

Music373_Track5:: @ 8668A2D
	.incbin "data/music/tracks/music373_track5.bin"

Music373_Header:: @ 8668B5C
	.byte 6 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08433534 @ voice group pointer
	.4byte Music373_Track0
	.4byte Music373_Track1
	.4byte Music373_Track2
	.4byte Music373_Track3
	.4byte Music373_Track4
	.4byte Music373_Track5

Music374_Track0:: @ 8668B7C
	.incbin "data/music/tracks/music374_track0.bin"

Music374_Track1:: @ 8668D66
	.incbin "data/music/tracks/music374_track1.bin"

Music374_Track2:: @ 8668F0E
	.incbin "data/music/tracks/music374_track2.bin"

Music374_Track3:: @ 866906C
	.incbin "data/music/tracks/music374_track3.bin"

Music374_Track4:: @ 86693A7
	.incbin "data/music/tracks/music374_track4.bin"

Music374_Track5:: @ 8669641
	.incbin "data/music/tracks/music374_track5.bin"

Music374_Track6:: @ 8669798
	.incbin "data/music/tracks/music374_track6.bin"

Music374_Track7:: @ 86697F8
	.incbin "data/music/tracks/music374_track7.bin"

Music374_Header:: @ 8669A04
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08433948 @ voice group pointer
	.4byte Music374_Track0
	.4byte Music374_Track1
	.4byte Music374_Track2
	.4byte Music374_Track3
	.4byte Music374_Track4
	.4byte Music374_Track5
	.4byte Music374_Track6
	.4byte Music374_Track7

Music375_Track0:: @ 8669A2C
	.incbin "data/music/tracks/music375_track0.bin"

Music375_Track1:: @ 8669DE6
	.incbin "data/music/tracks/music375_track1.bin"

Music375_Track2:: @ 8669F1E
	.incbin "data/music/tracks/music375_track2.bin"

Music375_Track3:: @ 866A0CD
	.incbin "data/music/tracks/music375_track3.bin"

Music375_Track4:: @ 866A2BC
	.incbin "data/music/tracks/music375_track4.bin"

Music375_Track5:: @ 866A494
	.incbin "data/music/tracks/music375_track5.bin"

Music375_Track6:: @ 866A6F4
	.incbin "data/music/tracks/music375_track6.bin"

Music375_Header:: @ 866A860
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08433EB8 @ voice group pointer
	.4byte Music375_Track0
	.4byte Music375_Track1
	.4byte Music375_Track2
	.4byte Music375_Track3
	.4byte Music375_Track4
	.4byte Music375_Track5
	.4byte Music375_Track6

Music376_Track0:: @ 866A884
	.incbin "data/music/tracks/music376_track0.bin"

Music376_Track1:: @ 866A893
	.incbin "data/music/tracks/music376_track1.bin"

Music376_Track2:: @ 866A8AB
	.incbin "data/music/tracks/music376_track2.bin"

Music376_Track3:: @ 866A8C4
	.incbin "data/music/tracks/music376_track3.bin"

Music376_Header:: @ 866A8D4
	.byte 4 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08434B18 @ voice group pointer
	.4byte Music376_Track0
	.4byte Music376_Track1
	.4byte Music376_Track2
	.4byte Music376_Track3

Music377_Track0:: @ 866A8EC
	.incbin "data/music/tracks/music377_track0.bin"

Music377_Track1:: @ 866A99E
	.incbin "data/music/tracks/music377_track1.bin"

Music377_Track2:: @ 866AA50
	.incbin "data/music/tracks/music377_track2.bin"

Music377_Track3:: @ 866AAE8
	.incbin "data/music/tracks/music377_track3.bin"

Music377_Track4:: @ 866ABBB
	.incbin "data/music/tracks/music377_track4.bin"

Music377_Track5:: @ 866AC4C
	.incbin "data/music/tracks/music377_track5.bin"

Music377_Track6:: @ 866ACDF
	.incbin "data/music/tracks/music377_track6.bin"

Music377_Header:: @ 866AE44
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08434B18 @ voice group pointer
	.4byte Music377_Track0
	.4byte Music377_Track1
	.4byte Music377_Track2
	.4byte Music377_Track3
	.4byte Music377_Track4
	.4byte Music377_Track5
	.4byte Music377_Track6

Music378_Track0:: @ 866AE68
	.incbin "data/music/tracks/music378_track0.bin"

Music378_Track1:: @ 866AE8F
	.incbin "data/music/tracks/music378_track1.bin"

Music378_Track2:: @ 866AEB5
	.incbin "data/music/tracks/music378_track2.bin"

Music378_Track3:: @ 866AED5
	.incbin "data/music/tracks/music378_track3.bin"

Music378_Track4:: @ 866AEF5
	.incbin "data/music/tracks/music378_track4.bin"

Music378_Track5:: @ 866AF0F
	.incbin "data/music/tracks/music378_track5.bin"

Music378_Header:: @ 866AF28
	.byte 6 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x0843129C @ voice group pointer
	.4byte Music378_Track0
	.4byte Music378_Track1
	.4byte Music378_Track2
	.4byte Music378_Track3
	.4byte Music378_Track4
	.4byte Music378_Track5

Music379_Track0:: @ 866AF48
	.incbin "data/music/tracks/music379_track0.bin"

Music379_Track1:: @ 866B09F
	.incbin "data/music/tracks/music379_track1.bin"

Music379_Track2:: @ 866B11E
	.incbin "data/music/tracks/music379_track2.bin"

Music379_Track3:: @ 866B1A9
	.incbin "data/music/tracks/music379_track3.bin"

Music379_Track4:: @ 866B250
	.incbin "data/music/tracks/music379_track4.bin"

Music379_Track5:: @ 866B30F
	.incbin "data/music/tracks/music379_track5.bin"

Music379_Track6:: @ 866B386
	.incbin "data/music/tracks/music379_track6.bin"

Music379_Track7:: @ 866B42B
	.incbin "data/music/tracks/music379_track7.bin"

Music379_Header:: @ 866B4B0
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08434F14 @ voice group pointer
	.4byte Music379_Track0
	.4byte Music379_Track1
	.4byte Music379_Track2
	.4byte Music379_Track3
	.4byte Music379_Track4
	.4byte Music379_Track5
	.4byte Music379_Track6
	.4byte Music379_Track7

Music380_Track0:: @ 866B4D8
	.incbin "data/music/tracks/music380_track0.bin"

Music380_Track1:: @ 866B5B0
	.incbin "data/music/tracks/music380_track1.bin"

Music380_Track2:: @ 866B684
	.incbin "data/music/tracks/music380_track2.bin"

Music380_Track3:: @ 866B70F
	.incbin "data/music/tracks/music380_track3.bin"

Music380_Track4:: @ 866B801
	.incbin "data/music/tracks/music380_track4.bin"

Music380_Track5:: @ 866B945
	.incbin "data/music/tracks/music380_track5.bin"

Music380_Track6:: @ 866BA0D
	.incbin "data/music/tracks/music380_track6.bin"

Music380_Header:: @ 866BB0C
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08435514 @ voice group pointer
	.4byte Music380_Track0
	.4byte Music380_Track1
	.4byte Music380_Track2
	.4byte Music380_Track3
	.4byte Music380_Track4
	.4byte Music380_Track5
	.4byte Music380_Track6

Music381_Track0:: @ 866BB30
	.incbin "data/music/tracks/music381_track0.bin"

Music381_Track1:: @ 866BCDB
	.incbin "data/music/tracks/music381_track1.bin"

Music381_Track2:: @ 866BE69
	.incbin "data/music/tracks/music381_track2.bin"

Music381_Track3:: @ 866BF13
	.incbin "data/music/tracks/music381_track3.bin"

Music381_Track4:: @ 866C0E7
	.incbin "data/music/tracks/music381_track4.bin"

Music381_Track5:: @ 866C1F7
	.incbin "data/music/tracks/music381_track5.bin"

Music381_Track6:: @ 866C291
	.incbin "data/music/tracks/music381_track6.bin"

Music381_Track7:: @ 866C33E
	.incbin "data/music/tracks/music381_track7.bin"

Music381_Header:: @ 866C448
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08435D18 @ voice group pointer
	.4byte Music381_Track0
	.4byte Music381_Track1
	.4byte Music381_Track2
	.4byte Music381_Track3
	.4byte Music381_Track4
	.4byte Music381_Track5
	.4byte Music381_Track6
	.4byte Music381_Track7

Music382_Track0:: @ 866C470
	.incbin "data/music/tracks/music382_track0.bin"

Music382_Track1:: @ 866C623
	.incbin "data/music/tracks/music382_track1.bin"

Music382_Track2:: @ 866C72C
	.incbin "data/music/tracks/music382_track2.bin"

Music382_Track3:: @ 866C81D
	.incbin "data/music/tracks/music382_track3.bin"

Music382_Track4:: @ 866C923
	.incbin "data/music/tracks/music382_track4.bin"

Music382_Track5:: @ 866CA27
	.incbin "data/music/tracks/music382_track5.bin"

Music382_Track6:: @ 866CB05
	.incbin "data/music/tracks/music382_track6.bin"

Music382_Track7:: @ 866CC4C
	.incbin "data/music/tracks/music382_track7.bin"

Music382_Header:: @ 866CD7C
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084362B8 @ voice group pointer
	.4byte Music382_Track0
	.4byte Music382_Track1
	.4byte Music382_Track2
	.4byte Music382_Track3
	.4byte Music382_Track4
	.4byte Music382_Track5
	.4byte Music382_Track6
	.4byte Music382_Track7

Music383_Track0:: @ 866CDA4
	.incbin "data/music/tracks/music383_track0.bin"

Music383_Track1:: @ 866CEC1
	.incbin "data/music/tracks/music383_track1.bin"

Music383_Track2:: @ 866CF8F
	.incbin "data/music/tracks/music383_track2.bin"

Music383_Track3:: @ 866D0EC
	.incbin "data/music/tracks/music383_track3.bin"

Music383_Track4:: @ 866D20C
	.incbin "data/music/tracks/music383_track4.bin"

Music383_Track5:: @ 866D2E1
	.incbin "data/music/tracks/music383_track5.bin"

Music383_Track6:: @ 866D3C5
	.incbin "data/music/tracks/music383_track6.bin"

Music383_Header:: @ 866D42C
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084368B8 @ voice group pointer
	.4byte Music383_Track0
	.4byte Music383_Track1
	.4byte Music383_Track2
	.4byte Music383_Track3
	.4byte Music383_Track4
	.4byte Music383_Track5
	.4byte Music383_Track6

Music384_Track0:: @ 866D450
	.incbin "data/music/tracks/music384_track0.bin"

Music384_Track1:: @ 866D676
	.incbin "data/music/tracks/music384_track1.bin"

Music384_Track2:: @ 866D7CD
	.incbin "data/music/tracks/music384_track2.bin"

Music384_Track3:: @ 866D8DE
	.incbin "data/music/tracks/music384_track3.bin"

Music384_Track4:: @ 866DAA9
	.incbin "data/music/tracks/music384_track4.bin"

Music384_Track5:: @ 866DCA0
	.incbin "data/music/tracks/music384_track5.bin"

Music384_Track6:: @ 866DDFC
	.incbin "data/music/tracks/music384_track6.bin"

Music384_Track7:: @ 866DE7E
	.incbin "data/music/tracks/music384_track7.bin"

Music384_Track8:: @ 866DEC1
	.incbin "data/music/tracks/music384_track8.bin"

Music384_Header:: @ 866DFB4
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843708C @ voice group pointer
	.4byte Music384_Track0
	.4byte Music384_Track1
	.4byte Music384_Track2
	.4byte Music384_Track3
	.4byte Music384_Track4
	.4byte Music384_Track5
	.4byte Music384_Track6
	.4byte Music384_Track7
	.4byte Music384_Track8

Music385_Track0:: @ 866DFE0
	.incbin "data/music/tracks/music385_track0.bin"

Music385_Track1:: @ 866E075
	.incbin "data/music/tracks/music385_track1.bin"

Music385_Track2:: @ 866E0C7
	.incbin "data/music/tracks/music385_track2.bin"

Music385_Track3:: @ 866E164
	.incbin "data/music/tracks/music385_track3.bin"

Music385_Track4:: @ 866E26A
	.incbin "data/music/tracks/music385_track4.bin"

Music385_Track5:: @ 866E374
	.incbin "data/music/tracks/music385_track5.bin"

Music385_Track6:: @ 866E3A7
	.incbin "data/music/tracks/music385_track6.bin"

Music385_Track7:: @ 866E420
	.incbin "data/music/tracks/music385_track7.bin"

Music385_Header:: @ 866E494
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08437488 @ voice group pointer
	.4byte Music385_Track0
	.4byte Music385_Track1
	.4byte Music385_Track2
	.4byte Music385_Track3
	.4byte Music385_Track4
	.4byte Music385_Track5
	.4byte Music385_Track6
	.4byte Music385_Track7

Music386_Track0:: @ 866E4BC
	.incbin "data/music/tracks/music386_track0.bin"

Music386_Track1:: @ 866E63F
	.incbin "data/music/tracks/music386_track1.bin"

Music386_Track2:: @ 866E6A8
	.incbin "data/music/tracks/music386_track2.bin"

Music386_Track3:: @ 866E78F
	.incbin "data/music/tracks/music386_track3.bin"

Music386_Track4:: @ 866E92A
	.incbin "data/music/tracks/music386_track4.bin"

Music386_Track5:: @ 866EB10
	.incbin "data/music/tracks/music386_track5.bin"

Music386_Track6:: @ 866EC29
	.incbin "data/music/tracks/music386_track6.bin"

Music386_Track7:: @ 866ECD6
	.incbin "data/music/tracks/music386_track7.bin"

Music386_Track8:: @ 866ED7F
	.incbin "data/music/tracks/music386_track8.bin"

Music386_Header:: @ 866EDB8
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08437A88 @ voice group pointer
	.4byte Music386_Track0
	.4byte Music386_Track1
	.4byte Music386_Track2
	.4byte Music386_Track3
	.4byte Music386_Track4
	.4byte Music386_Track5
	.4byte Music386_Track6
	.4byte Music386_Track7
	.4byte Music386_Track8

Music387_Track0:: @ 866EDE4
	.incbin "data/music/tracks/music387_track0.bin"

Music387_Track1:: @ 866EE11
	.incbin "data/music/tracks/music387_track1.bin"

Music387_Track2:: @ 866EE27
	.incbin "data/music/tracks/music387_track2.bin"

Music387_Track3:: @ 866EE3F
	.incbin "data/music/tracks/music387_track3.bin"

Music387_Track4:: @ 866EE57
	.incbin "data/music/tracks/music387_track4.bin"

Music387_Header:: @ 866EE98
	.byte 5 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x0843129C @ voice group pointer
	.4byte Music387_Track0
	.4byte Music387_Track1
	.4byte Music387_Track2
	.4byte Music387_Track3
	.4byte Music387_Track4

Music388_Track0:: @ 866EEB4
	.incbin "data/music/tracks/music388_track0.bin"

Music388_Track1:: @ 866EF23
	.incbin "data/music/tracks/music388_track1.bin"

Music388_Track2:: @ 866EF90
	.incbin "data/music/tracks/music388_track2.bin"

Music388_Track3:: @ 866F061
	.incbin "data/music/tracks/music388_track3.bin"

Music388_Track4:: @ 866F0BD
	.incbin "data/music/tracks/music388_track4.bin"

Music388_Track5:: @ 866F199
	.incbin "data/music/tracks/music388_track5.bin"

Music388_Track6:: @ 866F1BF
	.incbin "data/music/tracks/music388_track6.bin"

Music388_Header:: @ 866F1FC
	.byte 7 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x0843129C @ voice group pointer
	.4byte Music388_Track0
	.4byte Music388_Track1
	.4byte Music388_Track2
	.4byte Music388_Track3
	.4byte Music388_Track4
	.4byte Music388_Track5
	.4byte Music388_Track6

Music389_Track0:: @ 866F220
	.incbin "data/music/tracks/music389_track0.bin"

Music389_Track1:: @ 866F27E
	.incbin "data/music/tracks/music389_track1.bin"

Music389_Track2:: @ 866F2C5
	.incbin "data/music/tracks/music389_track2.bin"

Music389_Track3:: @ 866F30F
	.incbin "data/music/tracks/music389_track3.bin"

Music389_Track4:: @ 866F351
	.incbin "data/music/tracks/music389_track4.bin"

Music389_Track5:: @ 866F393
	.incbin "data/music/tracks/music389_track5.bin"

Music389_Track6:: @ 866F3BA
	.incbin "data/music/tracks/music389_track6.bin"

Music389_Header:: @ 866F428
	.byte 7 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x0843129C @ voice group pointer
	.4byte Music389_Track0
	.4byte Music389_Track1
	.4byte Music389_Track2
	.4byte Music389_Track3
	.4byte Music389_Track4
	.4byte Music389_Track5
	.4byte Music389_Track6

Music390_Track0:: @ 866F44C
	.incbin "data/music/tracks/music390_track0.bin"

Music390_Track1:: @ 866F483
	.incbin "data/music/tracks/music390_track1.bin"

Music390_Track2:: @ 866F49F
	.incbin "data/music/tracks/music390_track2.bin"

Music390_Track3:: @ 866F4C3
	.incbin "data/music/tracks/music390_track3.bin"

Music390_Track4:: @ 866F4E9
	.incbin "data/music/tracks/music390_track4.bin"

Music390_Track5:: @ 866F519
	.incbin "data/music/tracks/music390_track5.bin"

Music390_Track6:: @ 866F532
	.incbin "data/music/tracks/music390_track6.bin"

Music390_Header:: @ 866F568
	.byte 7 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x0843129C @ voice group pointer
	.4byte Music390_Track0
	.4byte Music390_Track1
	.4byte Music390_Track2
	.4byte Music390_Track3
	.4byte Music390_Track4
	.4byte Music390_Track5
	.4byte Music390_Track6

Music391_Track0:: @ 866F58C
	.incbin "data/music/tracks/music391_track0.bin"

Music391_Track1:: @ 866F5CF
	.incbin "data/music/tracks/music391_track1.bin"

Music391_Track2:: @ 866F604
	.incbin "data/music/tracks/music391_track2.bin"

Music391_Track3:: @ 866F62E
	.incbin "data/music/tracks/music391_track3.bin"

Music391_Track4:: @ 866F64B
	.incbin "data/music/tracks/music391_track4.bin"

Music391_Header:: @ 866F664
	.byte 5 @ number of tracks
	.byte 0, 5, 178 @ unknown
	.4byte 0x0843129C @ voice group pointer
	.4byte Music391_Track0
	.4byte Music391_Track1
	.4byte Music391_Track2
	.4byte Music391_Track3
	.4byte Music391_Track4

Music392_Track0:: @ 866F680
	.incbin "data/music/tracks/music392_track0.bin"

Music392_Track1:: @ 866F724
	.incbin "data/music/tracks/music392_track1.bin"

Music392_Track2:: @ 866F7F2
	.incbin "data/music/tracks/music392_track2.bin"

Music392_Track3:: @ 866F8BC
	.incbin "data/music/tracks/music392_track3.bin"

Music392_Track4:: @ 866F990
	.incbin "data/music/tracks/music392_track4.bin"

Music392_Track5:: @ 866FAC9
	.incbin "data/music/tracks/music392_track5.bin"

Music392_Track6:: @ 866FBE9
	.incbin "data/music/tracks/music392_track6.bin"

Music392_Header:: @ 866FC78
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08437EB4 @ voice group pointer
	.4byte Music392_Track0
	.4byte Music392_Track1
	.4byte Music392_Track2
	.4byte Music392_Track3
	.4byte Music392_Track4
	.4byte Music392_Track5
	.4byte Music392_Track6

Music393_Track0:: @ 866FC9C
	.incbin "data/music/tracks/music393_track0.bin"

Music393_Track1:: @ 866FDEB
	.incbin "data/music/tracks/music393_track1.bin"

Music393_Track2:: @ 866FF36
	.incbin "data/music/tracks/music393_track2.bin"

Music393_Track3:: @ 867003B
	.incbin "data/music/tracks/music393_track3.bin"

Music393_Track4:: @ 86700F3
	.incbin "data/music/tracks/music393_track4.bin"

Music393_Track5:: @ 86701A2
	.incbin "data/music/tracks/music393_track5.bin"

Music393_Track6:: @ 86703F6
	.incbin "data/music/tracks/music393_track6.bin"

Music393_Header:: @ 8670500
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843828C @ voice group pointer
	.4byte Music393_Track0
	.4byte Music393_Track1
	.4byte Music393_Track2
	.4byte Music393_Track3
	.4byte Music393_Track4
	.4byte Music393_Track5
	.4byte Music393_Track6

Music394_Track0:: @ 8670524
	.incbin "data/music/tracks/music394_track0.bin"

Music394_Track1:: @ 8670570
	.incbin "data/music/tracks/music394_track1.bin"

Music394_Track2:: @ 867075A
	.incbin "data/music/tracks/music394_track2.bin"

Music394_Track3:: @ 867082D
	.incbin "data/music/tracks/music394_track3.bin"

Music394_Track4:: @ 8670914
	.incbin "data/music/tracks/music394_track4.bin"

Music394_Track5:: @ 86709FC
	.incbin "data/music/tracks/music394_track5.bin"

Music394_Track6:: @ 8670C50
	.incbin "data/music/tracks/music394_track6.bin"

Music394_Header:: @ 8670E44
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843888C @ voice group pointer
	.4byte Music394_Track0
	.4byte Music394_Track1
	.4byte Music394_Track2
	.4byte Music394_Track3
	.4byte Music394_Track4
	.4byte Music394_Track5
	.4byte Music394_Track6

Music395_Track0:: @ 8670E68
	.incbin "data/music/tracks/music395_track0.bin"

Music395_Track1:: @ 8670FAE
	.incbin "data/music/tracks/music395_track1.bin"

Music395_Track2:: @ 86710EC
	.incbin "data/music/tracks/music395_track2.bin"

Music395_Track3:: @ 86711AD
	.incbin "data/music/tracks/music395_track3.bin"

Music395_Track4:: @ 8671270
	.incbin "data/music/tracks/music395_track4.bin"

Music395_Track5:: @ 86714C4
	.incbin "data/music/tracks/music395_track5.bin"

Music395_Track6:: @ 867167C
	.incbin "data/music/tracks/music395_track6.bin"

Music395_Header:: @ 86717C0
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08438E8C @ voice group pointer
	.4byte Music395_Track0
	.4byte Music395_Track1
	.4byte Music395_Track2
	.4byte Music395_Track3
	.4byte Music395_Track4
	.4byte Music395_Track5
	.4byte Music395_Track6

Music396_Track0:: @ 86717E4
	.incbin "data/music/tracks/music396_track0.bin"

Music396_Track1:: @ 8671926
	.incbin "data/music/tracks/music396_track1.bin"

Music396_Track2:: @ 8671ABA
	.incbin "data/music/tracks/music396_track2.bin"

Music396_Track3:: @ 8671C59
	.incbin "data/music/tracks/music396_track3.bin"

Music396_Track4:: @ 8671EAD
	.incbin "data/music/tracks/music396_track4.bin"

Music396_Header:: @ 8672064
	.byte 5 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843948C @ voice group pointer
	.4byte Music396_Track0
	.4byte Music396_Track1
	.4byte Music396_Track2
	.4byte Music396_Track3
	.4byte Music396_Track4

Music397_Track0:: @ 8672080
	.incbin "data/music/tracks/music397_track0.bin"

Music397_Track1:: @ 867223F
	.incbin "data/music/tracks/music397_track1.bin"

Music397_Track2:: @ 86723B4
	.incbin "data/music/tracks/music397_track2.bin"

Music397_Track3:: @ 86724A0
	.incbin "data/music/tracks/music397_track3.bin"

Music397_Track4:: @ 86725AD
	.incbin "data/music/tracks/music397_track4.bin"

Music397_Header:: @ 86726A8
	.byte 5 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08439A8C @ voice group pointer
	.4byte Music397_Track0
	.4byte Music397_Track1
	.4byte Music397_Track2
	.4byte Music397_Track3
	.4byte Music397_Track4

Music398_Track0:: @ 86726C4
	.incbin "data/music/tracks/music398_track0.bin"

Music398_Track1:: @ 8672758
	.incbin "data/music/tracks/music398_track1.bin"

Music398_Track2:: @ 8672993
	.incbin "data/music/tracks/music398_track2.bin"

Music398_Track3:: @ 8672AC3
	.incbin "data/music/tracks/music398_track3.bin"

Music398_Track4:: @ 8672B76
	.incbin "data/music/tracks/music398_track4.bin"

Music398_Track5:: @ 8672C45
	.incbin "data/music/tracks/music398_track5.bin"

Music398_Track6:: @ 8672D0D
	.incbin "data/music/tracks/music398_track6.bin"

Music398_Track7:: @ 8672E2F
	.incbin "data/music/tracks/music398_track7.bin"

Music398_Track8:: @ 8672F54
	.incbin "data/music/tracks/music398_track8.bin"

Music398_Track9:: @ 86730B0
	.incbin "data/music/tracks/music398_track9.bin"

Music398_Header:: @ 8673158
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08439E58 @ voice group pointer
	.4byte Music398_Track0
	.4byte Music398_Track1
	.4byte Music398_Track2
	.4byte Music398_Track3
	.4byte Music398_Track4
	.4byte Music398_Track5
	.4byte Music398_Track6
	.4byte Music398_Track7
	.4byte Music398_Track8
	.4byte Music398_Track9

Music399_Track0:: @ 8673188
	.incbin "data/music/tracks/music399_track0.bin"

Music399_Track1:: @ 86734B2
	.incbin "data/music/tracks/music399_track1.bin"

Music399_Track2:: @ 8673878
	.incbin "data/music/tracks/music399_track2.bin"

Music399_Track3:: @ 8673B7B
	.incbin "data/music/tracks/music399_track3.bin"

Music399_Track4:: @ 8673D39
	.incbin "data/music/tracks/music399_track4.bin"

Music399_Track5:: @ 8673E99
	.incbin "data/music/tracks/music399_track5.bin"

Music399_Track6:: @ 867413F
	.incbin "data/music/tracks/music399_track6.bin"

Music399_Track7:: @ 8674276
	.incbin "data/music/tracks/music399_track7.bin"

Music399_Header:: @ 8674454
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843A224 @ voice group pointer
	.4byte Music399_Track0
	.4byte Music399_Track1
	.4byte Music399_Track2
	.4byte Music399_Track3
	.4byte Music399_Track4
	.4byte Music399_Track5
	.4byte Music399_Track6
	.4byte Music399_Track7

Music400_Track0:: @ 867447C
	.incbin "data/music/tracks/music400_track0.bin"

Music400_Track1:: @ 86744CC
	.incbin "data/music/tracks/music400_track1.bin"

Music400_Track2:: @ 867470C
	.incbin "data/music/tracks/music400_track2.bin"

Music400_Track3:: @ 86747C1
	.incbin "data/music/tracks/music400_track3.bin"

Music400_Track4:: @ 86749B7
	.incbin "data/music/tracks/music400_track4.bin"

Music400_Track5:: @ 8674AEE
	.incbin "data/music/tracks/music400_track5.bin"

Music400_Track6:: @ 8674C31
	.incbin "data/music/tracks/music400_track6.bin"

Music400_Track7:: @ 8674EE0
	.incbin "data/music/tracks/music400_track7.bin"

Music400_Track8:: @ 8674F0F
	.incbin "data/music/tracks/music400_track8.bin"

Music400_Header:: @ 8675094
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843A824 @ voice group pointer
	.4byte Music400_Track0
	.4byte Music400_Track1
	.4byte Music400_Track2
	.4byte Music400_Track3
	.4byte Music400_Track4
	.4byte Music400_Track5
	.4byte Music400_Track6
	.4byte Music400_Track7
	.4byte Music400_Track8

Music401_Track0:: @ 86750C0
	.incbin "data/music/tracks/music401_track0.bin"

Music401_Track1:: @ 86753E7
	.incbin "data/music/tracks/music401_track1.bin"

Music401_Track2:: @ 8675508
	.incbin "data/music/tracks/music401_track2.bin"

Music401_Track3:: @ 8675652
	.incbin "data/music/tracks/music401_track3.bin"

Music401_Track4:: @ 867598F
	.incbin "data/music/tracks/music401_track4.bin"

Music401_Track5:: @ 8675A65
	.incbin "data/music/tracks/music401_track5.bin"

Music401_Track6:: @ 8675BEE
	.incbin "data/music/tracks/music401_track6.bin"

Music401_Track7:: @ 8675ED7
	.incbin "data/music/tracks/music401_track7.bin"

Music401_Track8:: @ 8676087
	.incbin "data/music/tracks/music401_track8.bin"

Music401_Track9:: @ 8676278
	.incbin "data/music/tracks/music401_track9.bin"

Music401_Header:: @ 867645C
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843AE24 @ voice group pointer
	.4byte Music401_Track0
	.4byte Music401_Track1
	.4byte Music401_Track2
	.4byte Music401_Track3
	.4byte Music401_Track4
	.4byte Music401_Track5
	.4byte Music401_Track6
	.4byte Music401_Track7
	.4byte Music401_Track8
	.4byte Music401_Track9

Music402_Track0:: @ 867648C
	.incbin "data/music/tracks/music402_track0.bin"

Music402_Track1:: @ 86766CA
	.incbin "data/music/tracks/music402_track1.bin"

Music402_Track2:: @ 8676AFA
	.incbin "data/music/tracks/music402_track2.bin"

Music402_Track3:: @ 8676E0F
	.incbin "data/music/tracks/music402_track3.bin"

Music402_Track4:: @ 867734C
	.incbin "data/music/tracks/music402_track4.bin"

Music402_Track5:: @ 8677772
	.incbin "data/music/tracks/music402_track5.bin"

Music402_Track6:: @ 8677BAC
	.incbin "data/music/tracks/music402_track6.bin"

Music402_Track7:: @ 8677DB9
	.incbin "data/music/tracks/music402_track7.bin"

Music402_Track8:: @ 8677FBC
	.incbin "data/music/tracks/music402_track8.bin"

Music402_Header:: @ 8678164
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843B424 @ voice group pointer
	.4byte Music402_Track0
	.4byte Music402_Track1
	.4byte Music402_Track2
	.4byte Music402_Track3
	.4byte Music402_Track4
	.4byte Music402_Track5
	.4byte Music402_Track6
	.4byte Music402_Track7
	.4byte Music402_Track8

Music403_Track0:: @ 8678190
	.incbin "data/music/tracks/music403_track0.bin"

Music403_Track1:: @ 867846E
	.incbin "data/music/tracks/music403_track1.bin"

Music403_Track2:: @ 8678766
	.incbin "data/music/tracks/music403_track2.bin"

Music403_Track3:: @ 8678AD6
	.incbin "data/music/tracks/music403_track3.bin"

Music403_Track4:: @ 8678CA0
	.incbin "data/music/tracks/music403_track4.bin"

Music403_Track5:: @ 8679031
	.incbin "data/music/tracks/music403_track5.bin"

Music403_Track6:: @ 8679397
	.incbin "data/music/tracks/music403_track6.bin"

Music403_Track7:: @ 867975F
	.incbin "data/music/tracks/music403_track7.bin"

Music403_Track8:: @ 86797D3
	.incbin "data/music/tracks/music403_track8.bin"

Music403_Header:: @ 8679948
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843B844 @ voice group pointer
	.4byte Music403_Track0
	.4byte Music403_Track1
	.4byte Music403_Track2
	.4byte Music403_Track3
	.4byte Music403_Track4
	.4byte Music403_Track5
	.4byte Music403_Track6
	.4byte Music403_Track7
	.4byte Music403_Track8

Music404_Track0:: @ 8679974
	.incbin "data/music/tracks/music404_track0.bin"

Music404_Track1:: @ 8679CF4
	.incbin "data/music/tracks/music404_track1.bin"

Music404_Track2:: @ 8679F9E
	.incbin "data/music/tracks/music404_track2.bin"

Music404_Track3:: @ 867A426
	.incbin "data/music/tracks/music404_track3.bin"

Music404_Track4:: @ 867A4B7
	.incbin "data/music/tracks/music404_track4.bin"

Music404_Track5:: @ 867A781
	.incbin "data/music/tracks/music404_track5.bin"

Music404_Track6:: @ 867A86A
	.incbin "data/music/tracks/music404_track6.bin"

Music404_Track7:: @ 867A902
	.incbin "data/music/tracks/music404_track7.bin"

Music404_Header:: @ 867AC08
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843BE44 @ voice group pointer
	.4byte Music404_Track0
	.4byte Music404_Track1
	.4byte Music404_Track2
	.4byte Music404_Track3
	.4byte Music404_Track4
	.4byte Music404_Track5
	.4byte Music404_Track6
	.4byte Music404_Track7

Music405_Track0:: @ 867AC30
	.incbin "data/music/tracks/music405_track0.bin"

Music405_Track1:: @ 867AD59
	.incbin "data/music/tracks/music405_track1.bin"

Music405_Track2:: @ 867B0CE
	.incbin "data/music/tracks/music405_track2.bin"

Music405_Track3:: @ 867B59E
	.incbin "data/music/tracks/music405_track3.bin"

Music405_Track4:: @ 867B64C
	.incbin "data/music/tracks/music405_track4.bin"

Music405_Track5:: @ 867B709
	.incbin "data/music/tracks/music405_track5.bin"

Music405_Track6:: @ 867B8BF
	.incbin "data/music/tracks/music405_track6.bin"

Music405_Track7:: @ 867BCD4
	.incbin "data/music/tracks/music405_track7.bin"

Music405_Track8:: @ 867BDDF
	.incbin "data/music/tracks/music405_track8.bin"

Music405_Header:: @ 867BE5C
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843C444 @ voice group pointer
	.4byte Music405_Track0
	.4byte Music405_Track1
	.4byte Music405_Track2
	.4byte Music405_Track3
	.4byte Music405_Track4
	.4byte Music405_Track5
	.4byte Music405_Track6
	.4byte Music405_Track7
	.4byte Music405_Track8

Music406_Track0:: @ 867BE88
	.incbin "data/music/tracks/music406_track0.bin"

Music406_Track1:: @ 867C390
	.incbin "data/music/tracks/music406_track1.bin"

Music406_Track2:: @ 867C56A
	.incbin "data/music/tracks/music406_track2.bin"

Music406_Track3:: @ 867CBE2
	.incbin "data/music/tracks/music406_track3.bin"

Music406_Track4:: @ 867D340
	.incbin "data/music/tracks/music406_track4.bin"

Music406_Track5:: @ 867D49B
	.incbin "data/music/tracks/music406_track5.bin"

Music406_Track6:: @ 867D72E
	.incbin "data/music/tracks/music406_track6.bin"

Music406_Track7:: @ 867DC6A
	.incbin "data/music/tracks/music406_track7.bin"

Music406_Track8:: @ 867E1B6
	.incbin "data/music/tracks/music406_track8.bin"

Music406_Header:: @ 867E31C
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843C7BC @ voice group pointer
	.4byte Music406_Track0
	.4byte Music406_Track1
	.4byte Music406_Track2
	.4byte Music406_Track3
	.4byte Music406_Track4
	.4byte Music406_Track5
	.4byte Music406_Track6
	.4byte Music406_Track7
	.4byte Music406_Track8

Music407_Track0:: @ 867E348
	.incbin "data/music/tracks/music407_track0.bin"

Music407_Track1:: @ 867E40B
	.incbin "data/music/tracks/music407_track1.bin"

Music407_Track2:: @ 867E53A
	.incbin "data/music/tracks/music407_track2.bin"

Music407_Track3:: @ 867E5E9
	.incbin "data/music/tracks/music407_track3.bin"

Music407_Track4:: @ 867E623
	.incbin "data/music/tracks/music407_track4.bin"

Music407_Track5:: @ 867E6E1
	.incbin "data/music/tracks/music407_track5.bin"

Music407_Track6:: @ 867E7E9
	.incbin "data/music/tracks/music407_track6.bin"

Music407_Track7:: @ 867E842
	.incbin "data/music/tracks/music407_track7.bin"

Music407_Track8:: @ 867E8CF
	.incbin "data/music/tracks/music407_track8.bin"

Music407_Header:: @ 867E98C
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843CDBC @ voice group pointer
	.4byte Music407_Track0
	.4byte Music407_Track1
	.4byte Music407_Track2
	.4byte Music407_Track3
	.4byte Music407_Track4
	.4byte Music407_Track5
	.4byte Music407_Track6
	.4byte Music407_Track7
	.4byte Music407_Track8

Music408_Track0:: @ 867E9B8
	.incbin "data/music/tracks/music408_track0.bin"

Music408_Track1:: @ 867EC94
	.incbin "data/music/tracks/music408_track1.bin"

Music408_Track2:: @ 867F090
	.incbin "data/music/tracks/music408_track2.bin"

Music408_Track3:: @ 867F451
	.incbin "data/music/tracks/music408_track3.bin"

Music408_Track4:: @ 867F759
	.incbin "data/music/tracks/music408_track4.bin"

Music408_Track5:: @ 867F847
	.incbin "data/music/tracks/music408_track5.bin"

Music408_Header:: @ 867FB80
	.byte 6 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843D3BC @ voice group pointer
	.4byte Music408_Track0
	.4byte Music408_Track1
	.4byte Music408_Track2
	.4byte Music408_Track3
	.4byte Music408_Track4
	.4byte Music408_Track5

Music409_Track0:: @ 867FBA0
	.incbin "data/music/tracks/music409_track0.bin"

Music409_Track1:: @ 867FDBD
	.incbin "data/music/tracks/music409_track1.bin"

Music409_Track2:: @ 8680019
	.incbin "data/music/tracks/music409_track2.bin"

Music409_Track3:: @ 8680218
	.incbin "data/music/tracks/music409_track3.bin"

Music409_Track4:: @ 868042D
	.incbin "data/music/tracks/music409_track4.bin"

Music409_Track5:: @ 86806D8
	.incbin "data/music/tracks/music409_track5.bin"

Music409_Track6:: @ 8680877
	.incbin "data/music/tracks/music409_track6.bin"

Music409_Track7:: @ 8680920
	.incbin "data/music/tracks/music409_track7.bin"

Music409_Header:: @ 8680AFC
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843D9BC @ voice group pointer
	.4byte Music409_Track0
	.4byte Music409_Track1
	.4byte Music409_Track2
	.4byte Music409_Track3
	.4byte Music409_Track4
	.4byte Music409_Track5
	.4byte Music409_Track6
	.4byte Music409_Track7

Music410_Track0:: @ 8680B24
	.incbin "data/music/tracks/music410_track0.bin"

Music410_Track1:: @ 8680BBC
	.incbin "data/music/tracks/music410_track1.bin"

Music410_Track2:: @ 8680C2E
	.incbin "data/music/tracks/music410_track2.bin"

Music410_Track3:: @ 8680C82
	.incbin "data/music/tracks/music410_track3.bin"

Music410_Track4:: @ 8680CFF
	.incbin "data/music/tracks/music410_track4.bin"

Music410_Track5:: @ 8680DBD
	.incbin "data/music/tracks/music410_track5.bin"

Music410_Track6:: @ 8680E0D
	.incbin "data/music/tracks/music410_track6.bin"

Music410_Header:: @ 8680ED0
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843DFBC @ voice group pointer
	.4byte Music410_Track0
	.4byte Music410_Track1
	.4byte Music410_Track2
	.4byte Music410_Track3
	.4byte Music410_Track4
	.4byte Music410_Track5
	.4byte Music410_Track6

Music411_Track0:: @ 8680EF4
	.incbin "data/music/tracks/music411_track0.bin"

Music411_Track1:: @ 8681268
	.incbin "data/music/tracks/music411_track1.bin"

Music411_Track2:: @ 8681335
	.incbin "data/music/tracks/music411_track2.bin"

Music411_Track3:: @ 868152A
	.incbin "data/music/tracks/music411_track3.bin"

Music411_Track4:: @ 86815C3
	.incbin "data/music/tracks/music411_track4.bin"

Music411_Track5:: @ 868183A
	.incbin "data/music/tracks/music411_track5.bin"

Music411_Track6:: @ 8681BA2
	.incbin "data/music/tracks/music411_track6.bin"

Music411_Track7:: @ 8681EA3
	.incbin "data/music/tracks/music411_track7.bin"

Music411_Track8:: @ 86821FF
	.incbin "data/music/tracks/music411_track8.bin"

Music411_Track9:: @ 86823CA
	.incbin "data/music/tracks/music411_track9.bin"

Music411_Header:: @ 86824D4
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843E5BC @ voice group pointer
	.4byte Music411_Track0
	.4byte Music411_Track1
	.4byte Music411_Track2
	.4byte Music411_Track3
	.4byte Music411_Track4
	.4byte Music411_Track5
	.4byte Music411_Track6
	.4byte Music411_Track7
	.4byte Music411_Track8
	.4byte Music411_Track9

Music412_Track0:: @ 8682504
	.incbin "data/music/tracks/music412_track0.bin"

Music412_Track1:: @ 8682588
	.incbin "data/music/tracks/music412_track1.bin"

Music412_Track2:: @ 8682909
	.incbin "data/music/tracks/music412_track2.bin"

Music412_Track3:: @ 8682B79
	.incbin "data/music/tracks/music412_track3.bin"

Music412_Track4:: @ 8682ED6
	.incbin "data/music/tracks/music412_track4.bin"

Music412_Track5:: @ 868300C
	.incbin "data/music/tracks/music412_track5.bin"

Music412_Track6:: @ 8683253
	.incbin "data/music/tracks/music412_track6.bin"

Music412_Track7:: @ 8683498
	.incbin "data/music/tracks/music412_track7.bin"

Music412_Track8:: @ 8683581
	.incbin "data/music/tracks/music412_track8.bin"

Music412_Header:: @ 8683660
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843EBBC @ voice group pointer
	.4byte Music412_Track0
	.4byte Music412_Track1
	.4byte Music412_Track2
	.4byte Music412_Track3
	.4byte Music412_Track4
	.4byte Music412_Track5
	.4byte Music412_Track6
	.4byte Music412_Track7
	.4byte Music412_Track8

Music413_Track0:: @ 868368C
	.incbin "data/music/tracks/music413_track0.bin"

Music413_Track1:: @ 8683A37
	.incbin "data/music/tracks/music413_track1.bin"

Music413_Track2:: @ 8684052
	.incbin "data/music/tracks/music413_track2.bin"

Music413_Track3:: @ 8684440
	.incbin "data/music/tracks/music413_track3.bin"

Music413_Track4:: @ 8684ABA
	.incbin "data/music/tracks/music413_track4.bin"

Music413_Track5:: @ 8684C94
	.incbin "data/music/tracks/music413_track5.bin"

Music413_Track6:: @ 86853DD
	.incbin "data/music/tracks/music413_track6.bin"

Music413_Track7:: @ 8685950
	.incbin "data/music/tracks/music413_track7.bin"

Music413_Track8:: @ 8685F14
	.incbin "data/music/tracks/music413_track8.bin"

Music413_Track9:: @ 8686099
	.incbin "data/music/tracks/music413_track9.bin"

Music413_Header:: @ 8686464
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843F1BC @ voice group pointer
	.4byte Music413_Track0
	.4byte Music413_Track1
	.4byte Music413_Track2
	.4byte Music413_Track3
	.4byte Music413_Track4
	.4byte Music413_Track5
	.4byte Music413_Track6
	.4byte Music413_Track7
	.4byte Music413_Track8
	.4byte Music413_Track9

Music414_Track0:: @ 8686494
	.incbin "data/music/tracks/music414_track0.bin"

Music414_Track1:: @ 86865CA
	.incbin "data/music/tracks/music414_track1.bin"

Music414_Track2:: @ 8686856
	.incbin "data/music/tracks/music414_track2.bin"

Music414_Track3:: @ 8686A7C
	.incbin "data/music/tracks/music414_track3.bin"

Music414_Track4:: @ 8686D5A
	.incbin "data/music/tracks/music414_track4.bin"

Music414_Track5:: @ 8686EE3
	.incbin "data/music/tracks/music414_track5.bin"

Music414_Track6:: @ 868707F
	.incbin "data/music/tracks/music414_track6.bin"

Music414_Track7:: @ 868727E
	.incbin "data/music/tracks/music414_track7.bin"

Music414_Track8:: @ 86874BD
	.incbin "data/music/tracks/music414_track8.bin"

Music414_Track9:: @ 8687531
	.incbin "data/music/tracks/music414_track9.bin"

Music414_Header:: @ 8687600
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843F5E8 @ voice group pointer
	.4byte Music414_Track0
	.4byte Music414_Track1
	.4byte Music414_Track2
	.4byte Music414_Track3
	.4byte Music414_Track4
	.4byte Music414_Track5
	.4byte Music414_Track6
	.4byte Music414_Track7
	.4byte Music414_Track8
	.4byte Music414_Track9

Music415_Track0:: @ 8687630
	.incbin "data/music/tracks/music415_track0.bin"

Music415_Track1:: @ 8687814
	.incbin "data/music/tracks/music415_track1.bin"

Music415_Track2:: @ 868788B
	.incbin "data/music/tracks/music415_track2.bin"

Music415_Track3:: @ 8687A79
	.incbin "data/music/tracks/music415_track3.bin"

Music415_Track4:: @ 8687BA5
	.incbin "data/music/tracks/music415_track4.bin"

Music415_Track5:: @ 8687BF8
	.incbin "data/music/tracks/music415_track5.bin"

Music415_Track6:: @ 8687CC3
	.incbin "data/music/tracks/music415_track6.bin"

Music415_Track7:: @ 8687E73
	.incbin "data/music/tracks/music415_track7.bin"

Music415_Track8:: @ 8688037
	.incbin "data/music/tracks/music415_track8.bin"

Music415_Track9:: @ 8688157
	.incbin "data/music/tracks/music415_track9.bin"

Music415_Header:: @ 8688304
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0843FBE8 @ voice group pointer
	.4byte Music415_Track0
	.4byte Music415_Track1
	.4byte Music415_Track2
	.4byte Music415_Track3
	.4byte Music415_Track4
	.4byte Music415_Track5
	.4byte Music415_Track6
	.4byte Music415_Track7
	.4byte Music415_Track8
	.4byte Music415_Track9

Music416_Track0:: @ 8688334
	.incbin "data/music/tracks/music416_track0.bin"

Music416_Track1:: @ 86883A6
	.incbin "data/music/tracks/music416_track1.bin"

Music416_Track2:: @ 86883CC
	.incbin "data/music/tracks/music416_track2.bin"

Music416_Track3:: @ 8688569
	.incbin "data/music/tracks/music416_track3.bin"

Music416_Track4:: @ 86886DE
	.incbin "data/music/tracks/music416_track4.bin"

Music416_Track5:: @ 8688856
	.incbin "data/music/tracks/music416_track5.bin"

Music416_Track6:: @ 86889A0
	.incbin "data/music/tracks/music416_track6.bin"

Music416_Track7:: @ 8688AE6
	.incbin "data/music/tracks/music416_track7.bin"

Music416_Header:: @ 8688C38
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084401E8 @ voice group pointer
	.4byte Music416_Track0
	.4byte Music416_Track1
	.4byte Music416_Track2
	.4byte Music416_Track3
	.4byte Music416_Track4
	.4byte Music416_Track5
	.4byte Music416_Track6
	.4byte Music416_Track7

Music417_Track0:: @ 8688C60
	.incbin "data/music/tracks/music417_track0.bin"

Music417_Track1:: @ 8688D50
	.incbin "data/music/tracks/music417_track1.bin"

Music417_Track2:: @ 8688D85
	.incbin "data/music/tracks/music417_track2.bin"

Music417_Track3:: @ 8688FEE
	.incbin "data/music/tracks/music417_track3.bin"

Music417_Track4:: @ 86892F0
	.incbin "data/music/tracks/music417_track4.bin"

Music417_Track5:: @ 86895DC
	.incbin "data/music/tracks/music417_track5.bin"

Music417_Track6:: @ 8689628
	.incbin "data/music/tracks/music417_track6.bin"

Music417_Track7:: @ 868971F
	.incbin "data/music/tracks/music417_track7.bin"

Music417_Track8:: @ 8689816
	.incbin "data/music/tracks/music417_track8.bin"

Music417_Header:: @ 8689908
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084407E8 @ voice group pointer
	.4byte Music417_Track0
	.4byte Music417_Track1
	.4byte Music417_Track2
	.4byte Music417_Track3
	.4byte Music417_Track4
	.4byte Music417_Track5
	.4byte Music417_Track6
	.4byte Music417_Track7
	.4byte Music417_Track8

Music418_Track0:: @ 8689934
	.incbin "data/music/tracks/music418_track0.bin"

Music418_Track1:: @ 8689A52
	.incbin "data/music/tracks/music418_track1.bin"

Music418_Track2:: @ 8689E0B
	.incbin "data/music/tracks/music418_track2.bin"

Music418_Track3:: @ 868A1D0
	.incbin "data/music/tracks/music418_track3.bin"

Music418_Track4:: @ 868A240
	.incbin "data/music/tracks/music418_track4.bin"

Music418_Track5:: @ 868A4A7
	.incbin "data/music/tracks/music418_track5.bin"

Music418_Track6:: @ 868A74C
	.incbin "data/music/tracks/music418_track6.bin"

Music418_Track7:: @ 868AB6E
	.incbin "data/music/tracks/music418_track7.bin"

Music418_Track8:: @ 868ADFC
	.incbin "data/music/tracks/music418_track8.bin"

Music418_Header:: @ 868B04C
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08440DE8 @ voice group pointer
	.4byte Music418_Track0
	.4byte Music418_Track1
	.4byte Music418_Track2
	.4byte Music418_Track3
	.4byte Music418_Track4
	.4byte Music418_Track5
	.4byte Music418_Track6
	.4byte Music418_Track7
	.4byte Music418_Track8

Music419_Track0:: @ 868B078
	.incbin "data/music/tracks/music419_track0.bin"

Music419_Track1:: @ 868B0FA
	.incbin "data/music/tracks/music419_track1.bin"

Music419_Track2:: @ 868B17B
	.incbin "data/music/tracks/music419_track2.bin"

Music419_Track3:: @ 868B3D9
	.incbin "data/music/tracks/music419_track3.bin"

Music419_Track4:: @ 868B5A2
	.incbin "data/music/tracks/music419_track4.bin"

Music419_Track5:: @ 868B78C
	.incbin "data/music/tracks/music419_track5.bin"

Music419_Track6:: @ 868B7E0
	.incbin "data/music/tracks/music419_track6.bin"

Music419_Track7:: @ 868B9CF
	.incbin "data/music/tracks/music419_track7.bin"

Music419_Track8:: @ 868BBEE
	.incbin "data/music/tracks/music419_track8.bin"

Music419_Track9:: @ 868BCD2
	.incbin "data/music/tracks/music419_track9.bin"

Music419_Header:: @ 868BE88
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084413E8 @ voice group pointer
	.4byte Music419_Track0
	.4byte Music419_Track1
	.4byte Music419_Track2
	.4byte Music419_Track3
	.4byte Music419_Track4
	.4byte Music419_Track5
	.4byte Music419_Track6
	.4byte Music419_Track7
	.4byte Music419_Track8
	.4byte Music419_Track9

Music420_Track0:: @ 868BEB8
	.incbin "data/music/tracks/music420_track0.bin"

Music420_Track1:: @ 868BF9F
	.incbin "data/music/tracks/music420_track1.bin"

Music420_Track2:: @ 868C05C
	.incbin "data/music/tracks/music420_track2.bin"

Music420_Track3:: @ 868C110
	.incbin "data/music/tracks/music420_track3.bin"

Music420_Track4:: @ 868C1BE
	.incbin "data/music/tracks/music420_track4.bin"

Music420_Track5:: @ 868C26B
	.incbin "data/music/tracks/music420_track5.bin"

Music420_Track6:: @ 868C318
	.incbin "data/music/tracks/music420_track6.bin"

Music420_Track7:: @ 868C3F9
	.incbin "data/music/tracks/music420_track7.bin"

Music420_Header:: @ 868C4C0
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084419E8 @ voice group pointer
	.4byte Music420_Track0
	.4byte Music420_Track1
	.4byte Music420_Track2
	.4byte Music420_Track3
	.4byte Music420_Track4
	.4byte Music420_Track5
	.4byte Music420_Track6
	.4byte Music420_Track7

Music421_Track0:: @ 868C4E8
	.incbin "data/music/tracks/music421_track0.bin"

Music421_Track1:: @ 868C6CE
	.incbin "data/music/tracks/music421_track1.bin"

Music421_Track2:: @ 868C745
	.incbin "data/music/tracks/music421_track2.bin"

Music421_Track3:: @ 868C933
	.incbin "data/music/tracks/music421_track3.bin"

Music421_Track4:: @ 868CA60
	.incbin "data/music/tracks/music421_track4.bin"

Music421_Track5:: @ 868CAB3
	.incbin "data/music/tracks/music421_track5.bin"

Music421_Track6:: @ 868CB7E
	.incbin "data/music/tracks/music421_track6.bin"

Music421_Track7:: @ 868CD2E
	.incbin "data/music/tracks/music421_track7.bin"

Music421_Track8:: @ 868CEF2
	.incbin "data/music/tracks/music421_track8.bin"

Music421_Track9:: @ 868D012
	.incbin "data/music/tracks/music421_track9.bin"

Music421_Header:: @ 868D1BC
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08441FE8 @ voice group pointer
	.4byte Music421_Track0
	.4byte Music421_Track1
	.4byte Music421_Track2
	.4byte Music421_Track3
	.4byte Music421_Track4
	.4byte Music421_Track5
	.4byte Music421_Track6
	.4byte Music421_Track7
	.4byte Music421_Track8
	.4byte Music421_Track9

Music422_Track0:: @ 868D1EC
	.incbin "data/music/tracks/music422_track0.bin"

Music422_Track1:: @ 868D419
	.incbin "data/music/tracks/music422_track1.bin"

Music422_Track2:: @ 868D5AA
	.incbin "data/music/tracks/music422_track2.bin"

Music422_Track3:: @ 868D85D
	.incbin "data/music/tracks/music422_track3.bin"

Music422_Track4:: @ 868DA68
	.incbin "data/music/tracks/music422_track4.bin"

Music422_Track5:: @ 868DBA5
	.incbin "data/music/tracks/music422_track5.bin"

Music422_Track6:: @ 868DCE8
	.incbin "data/music/tracks/music422_track6.bin"

Music422_Track7:: @ 868DE2E
	.incbin "data/music/tracks/music422_track7.bin"

Music422_Header:: @ 868DFC4
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084425E8 @ voice group pointer
	.4byte Music422_Track0
	.4byte Music422_Track1
	.4byte Music422_Track2
	.4byte Music422_Track3
	.4byte Music422_Track4
	.4byte Music422_Track5
	.4byte Music422_Track6
	.4byte Music422_Track7

Music423_Track0:: @ 868DFEC
	.incbin "data/music/tracks/music423_track0.bin"

Music423_Track1:: @ 868E16F
	.incbin "data/music/tracks/music423_track1.bin"

Music423_Track2:: @ 868E1C1
	.incbin "data/music/tracks/music423_track2.bin"

Music423_Track3:: @ 868E29C
	.incbin "data/music/tracks/music423_track3.bin"

Music423_Track4:: @ 868E386
	.incbin "data/music/tracks/music423_track4.bin"

Music423_Track5:: @ 868E45C
	.incbin "data/music/tracks/music423_track5.bin"

Music423_Track6:: @ 868E597
	.incbin "data/music/tracks/music423_track6.bin"

Music423_Track7:: @ 868E62C
	.incbin "data/music/tracks/music423_track7.bin"

Music423_Track8:: @ 868E717
	.incbin "data/music/tracks/music423_track8.bin"

Music423_Header:: @ 868E88C
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08442BE8 @ voice group pointer
	.4byte Music423_Track0
	.4byte Music423_Track1
	.4byte Music423_Track2
	.4byte Music423_Track3
	.4byte Music423_Track4
	.4byte Music423_Track5
	.4byte Music423_Track6
	.4byte Music423_Track7
	.4byte Music423_Track8

Music424_Track0:: @ 868E8B8
	.incbin "data/music/tracks/music424_track0.bin"

Music424_Track1:: @ 868E967
	.incbin "data/music/tracks/music424_track1.bin"

Music424_Track2:: @ 868EA28
	.incbin "data/music/tracks/music424_track2.bin"

Music424_Track3:: @ 868EAE6
	.incbin "data/music/tracks/music424_track3.bin"

Music424_Track4:: @ 868EB4F
	.incbin "data/music/tracks/music424_track4.bin"

Music424_Track5:: @ 868EBAE
	.incbin "data/music/tracks/music424_track5.bin"

Music424_Track6:: @ 868EC1B
	.incbin "data/music/tracks/music424_track6.bin"

Music424_Track7:: @ 868EC62
	.incbin "data/music/tracks/music424_track7.bin"

Music424_Track8:: @ 868ECB1
	.incbin "data/music/tracks/music424_track8.bin"

Music424_Header:: @ 868ED5C
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084431E8 @ voice group pointer
	.4byte Music424_Track0
	.4byte Music424_Track1
	.4byte Music424_Track2
	.4byte Music424_Track3
	.4byte Music424_Track4
	.4byte Music424_Track5
	.4byte Music424_Track6
	.4byte Music424_Track7
	.4byte Music424_Track8

Music425_Track0:: @ 868ED88
	.incbin "data/music/tracks/music425_track0.bin"

Music425_Track1:: @ 868EEE3
	.incbin "data/music/tracks/music425_track1.bin"

Music425_Track2:: @ 868EF6E
	.incbin "data/music/tracks/music425_track2.bin"

Music425_Track3:: @ 868F081
	.incbin "data/music/tracks/music425_track3.bin"

Music425_Track4:: @ 868F108
	.incbin "data/music/tracks/music425_track4.bin"

Music425_Track5:: @ 868F1DD
	.incbin "data/music/tracks/music425_track5.bin"

Music425_Track6:: @ 868F298
	.incbin "data/music/tracks/music425_track6.bin"

Music425_Track7:: @ 868F356
	.incbin "data/music/tracks/music425_track7.bin"

Music425_Track8:: @ 868F381
	.incbin "data/music/tracks/music425_track8.bin"

Music425_Header:: @ 868F3D0
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084437E8 @ voice group pointer
	.4byte Music425_Track0
	.4byte Music425_Track1
	.4byte Music425_Track2
	.4byte Music425_Track3
	.4byte Music425_Track4
	.4byte Music425_Track5
	.4byte Music425_Track6
	.4byte Music425_Track7
	.4byte Music425_Track8

Music426_Track0:: @ 868F3FC
	.incbin "data/music/tracks/music426_track0.bin"

Music426_Track1:: @ 868F5D5
	.incbin "data/music/tracks/music426_track1.bin"

Music426_Track2:: @ 868F77F
	.incbin "data/music/tracks/music426_track2.bin"

Music426_Track3:: @ 868F932
	.incbin "data/music/tracks/music426_track3.bin"

Music426_Track4:: @ 868FDA0
	.incbin "data/music/tracks/music426_track4.bin"

Music426_Track5:: @ 86901A3
	.incbin "data/music/tracks/music426_track5.bin"

Music426_Track6:: @ 86903CC
	.incbin "data/music/tracks/music426_track6.bin"

Music426_Track7:: @ 86905FE
	.incbin "data/music/tracks/music426_track7.bin"

Music426_Track8:: @ 86906AA
	.incbin "data/music/tracks/music426_track8.bin"

Music426_Track9:: @ 8690969
	.incbin "data/music/tracks/music426_track9.bin"

Music426_Header:: @ 8690AF4
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08443DE8 @ voice group pointer
	.4byte Music426_Track0
	.4byte Music426_Track1
	.4byte Music426_Track2
	.4byte Music426_Track3
	.4byte Music426_Track4
	.4byte Music426_Track5
	.4byte Music426_Track6
	.4byte Music426_Track7
	.4byte Music426_Track8
	.4byte Music426_Track9

Music427_Track0:: @ 8690B24
	.incbin "data/music/tracks/music427_track0.bin"

Music427_Track1:: @ 8690CC1
	.incbin "data/music/tracks/music427_track1.bin"

Music427_Track2:: @ 8690E69
	.incbin "data/music/tracks/music427_track2.bin"

Music427_Track3:: @ 8690FC5
	.incbin "data/music/tracks/music427_track3.bin"

Music427_Track4:: @ 869119A
	.incbin "data/music/tracks/music427_track4.bin"

Music427_Track5:: @ 86911DC
	.incbin "data/music/tracks/music427_track5.bin"

Music427_Track6:: @ 86913D0
	.incbin "data/music/tracks/music427_track6.bin"

Music427_Track7:: @ 86915CA
	.incbin "data/music/tracks/music427_track7.bin"

Music427_Track8:: @ 869169C
	.incbin "data/music/tracks/music427_track8.bin"

Music427_Track9:: @ 86917FF
	.incbin "data/music/tracks/music427_track9.bin"

Music427_Header:: @ 8691940
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084443E8 @ voice group pointer
	.4byte Music427_Track0
	.4byte Music427_Track1
	.4byte Music427_Track2
	.4byte Music427_Track3
	.4byte Music427_Track4
	.4byte Music427_Track5
	.4byte Music427_Track6
	.4byte Music427_Track7
	.4byte Music427_Track8
	.4byte Music427_Track9

Music428_Track0:: @ 8691970
	.incbin "data/music/tracks/music428_track0.bin"

Music428_Track1:: @ 86919D7
	.incbin "data/music/tracks/music428_track1.bin"

Music428_Track2:: @ 8691A2C
	.incbin "data/music/tracks/music428_track2.bin"

Music428_Track3:: @ 8691AA8
	.incbin "data/music/tracks/music428_track3.bin"

Music428_Track4:: @ 8691C83
	.incbin "data/music/tracks/music428_track4.bin"

Music428_Track5:: @ 8691CFD
	.incbin "data/music/tracks/music428_track5.bin"

Music428_Track6:: @ 8691DC0
	.incbin "data/music/tracks/music428_track6.bin"

Music428_Track7:: @ 8691E83
	.incbin "data/music/tracks/music428_track7.bin"

Music428_Track8:: @ 8692032
	.incbin "data/music/tracks/music428_track8.bin"

Music428_Header:: @ 86920D0
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084449E8 @ voice group pointer
	.4byte Music428_Track0
	.4byte Music428_Track1
	.4byte Music428_Track2
	.4byte Music428_Track3
	.4byte Music428_Track4
	.4byte Music428_Track5
	.4byte Music428_Track6
	.4byte Music428_Track7
	.4byte Music428_Track8

Music429_Track0:: @ 86920FC
	.incbin "data/music/tracks/music429_track0.bin"

Music429_Track1:: @ 8692257
	.incbin "data/music/tracks/music429_track1.bin"

Music429_Track2:: @ 869241D
	.incbin "data/music/tracks/music429_track2.bin"

Music429_Track3:: @ 86926AB
	.incbin "data/music/tracks/music429_track3.bin"

Music429_Track4:: @ 869293A
	.incbin "data/music/tracks/music429_track4.bin"

Music429_Track5:: @ 8692C1D
	.incbin "data/music/tracks/music429_track5.bin"

Music429_Track6:: @ 8692EF2
	.incbin "data/music/tracks/music429_track6.bin"

Music429_Track7:: @ 86931BE
	.incbin "data/music/tracks/music429_track7.bin"

Music429_Track8:: @ 8693228
	.incbin "data/music/tracks/music429_track8.bin"

Music429_Track9:: @ 86933E3
	.incbin "data/music/tracks/music429_track9.bin"

Music429_Header:: @ 869346C
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08444FE8 @ voice group pointer
	.4byte Music429_Track0
	.4byte Music429_Track1
	.4byte Music429_Track2
	.4byte Music429_Track3
	.4byte Music429_Track4
	.4byte Music429_Track5
	.4byte Music429_Track6
	.4byte Music429_Track7
	.4byte Music429_Track8
	.4byte Music429_Track9

Music430_Track0:: @ 869349C
	.incbin "data/music/tracks/music430_track0.bin"

Music430_Track1:: @ 8693543
	.incbin "data/music/tracks/music430_track1.bin"

Music430_Track2:: @ 8693643
	.incbin "data/music/tracks/music430_track2.bin"

Music430_Track3:: @ 8693747
	.incbin "data/music/tracks/music430_track3.bin"

Music430_Track4:: @ 8693860
	.incbin "data/music/tracks/music430_track4.bin"

Music430_Track5:: @ 8693909
	.incbin "data/music/tracks/music430_track5.bin"

Music430_Track6:: @ 8693A1F
	.incbin "data/music/tracks/music430_track6.bin"

Music430_Track7:: @ 8693AEF
	.incbin "data/music/tracks/music430_track7.bin"

Music430_Track8:: @ 8693BF9
	.incbin "data/music/tracks/music430_track8.bin"

Music430_Header:: @ 8693D7C
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084455E8 @ voice group pointer
	.4byte Music430_Track0
	.4byte Music430_Track1
	.4byte Music430_Track2
	.4byte Music430_Track3
	.4byte Music430_Track4
	.4byte Music430_Track5
	.4byte Music430_Track6
	.4byte Music430_Track7
	.4byte Music430_Track8

Music431_Track0:: @ 8693DA8
	.incbin "data/music/tracks/music431_track0.bin"

Music431_Track1:: @ 8693F4F
	.incbin "data/music/tracks/music431_track1.bin"

Music431_Track2:: @ 8694024
	.incbin "data/music/tracks/music431_track2.bin"

Music431_Track3:: @ 86942C0
	.incbin "data/music/tracks/music431_track3.bin"

Music431_Track4:: @ 86943EE
	.incbin "data/music/tracks/music431_track4.bin"

Music431_Track5:: @ 869465E
	.incbin "data/music/tracks/music431_track5.bin"

Music431_Track6:: @ 86947AF
	.incbin "data/music/tracks/music431_track6.bin"

Music431_Track7:: @ 86948FD
	.incbin "data/music/tracks/music431_track7.bin"

Music431_Track8:: @ 8694A96
	.incbin "data/music/tracks/music431_track8.bin"

Music431_Header:: @ 8694B84
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08445BE8 @ voice group pointer
	.4byte Music431_Track0
	.4byte Music431_Track1
	.4byte Music431_Track2
	.4byte Music431_Track3
	.4byte Music431_Track4
	.4byte Music431_Track5
	.4byte Music431_Track6
	.4byte Music431_Track7
	.4byte Music431_Track8

Music432_Track0:: @ 8694BB0
	.incbin "data/music/tracks/music432_track0.bin"

Music432_Track1:: @ 8694CD1
	.incbin "data/music/tracks/music432_track1.bin"

Music432_Track2:: @ 8694DDF
	.incbin "data/music/tracks/music432_track2.bin"

Music432_Track3:: @ 8694ED0
	.incbin "data/music/tracks/music432_track3.bin"

Music432_Track4:: @ 8695065
	.incbin "data/music/tracks/music432_track4.bin"

Music432_Track5:: @ 86951CF
	.incbin "data/music/tracks/music432_track5.bin"

Music432_Track6:: @ 8695382
	.incbin "data/music/tracks/music432_track6.bin"

Music432_Track7:: @ 8695535
	.incbin "data/music/tracks/music432_track7.bin"

Music432_Track8:: @ 869555B
	.incbin "data/music/tracks/music432_track8.bin"

Music432_Track9:: @ 869561C
	.incbin "data/music/tracks/music432_track9.bin"

Music432_Header:: @ 8695834
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084461E8 @ voice group pointer
	.4byte Music432_Track0
	.4byte Music432_Track1
	.4byte Music432_Track2
	.4byte Music432_Track3
	.4byte Music432_Track4
	.4byte Music432_Track5
	.4byte Music432_Track6
	.4byte Music432_Track7
	.4byte Music432_Track8
	.4byte Music432_Track9

Music433_Track0:: @ 8695864
	.incbin "data/music/tracks/music433_track0.bin"

Music433_Track1:: @ 86959E1
	.incbin "data/music/tracks/music433_track1.bin"

Music433_Track2:: @ 8695CE6
	.incbin "data/music/tracks/music433_track2.bin"

Music433_Track3:: @ 8696065
	.incbin "data/music/tracks/music433_track3.bin"

Music433_Track4:: @ 869621D
	.incbin "data/music/tracks/music433_track4.bin"

Music433_Track5:: @ 86962DC
	.incbin "data/music/tracks/music433_track5.bin"

Music433_Track6:: @ 869681F
	.incbin "data/music/tracks/music433_track6.bin"

Music433_Track7:: @ 8696D2B
	.incbin "data/music/tracks/music433_track7.bin"

Music433_Track8:: @ 8697118
	.incbin "data/music/tracks/music433_track8.bin"

Music433_Track9:: @ 8697476
	.incbin "data/music/tracks/music433_track9.bin"

Music433_Header:: @ 8697670
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084467E8 @ voice group pointer
	.4byte Music433_Track0
	.4byte Music433_Track1
	.4byte Music433_Track2
	.4byte Music433_Track3
	.4byte Music433_Track4
	.4byte Music433_Track5
	.4byte Music433_Track6
	.4byte Music433_Track7
	.4byte Music433_Track8
	.4byte Music433_Track9

Music434_Track0:: @ 86976A0
	.incbin "data/music/tracks/music434_track0.bin"

Music434_Track1:: @ 869782B
	.incbin "data/music/tracks/music434_track1.bin"

Music434_Track2:: @ 8697B50
	.incbin "data/music/tracks/music434_track2.bin"

Music434_Track3:: @ 8697D74
	.incbin "data/music/tracks/music434_track3.bin"

Music434_Track4:: @ 8698307
	.incbin "data/music/tracks/music434_track4.bin"

Music434_Track5:: @ 8698671
	.incbin "data/music/tracks/music434_track5.bin"

Music434_Track6:: @ 8698BB6
	.incbin "data/music/tracks/music434_track6.bin"

Music434_Track7:: @ 8698F72
	.incbin "data/music/tracks/music434_track7.bin"

Music434_Track8:: @ 86993D5
	.incbin "data/music/tracks/music434_track8.bin"

Music434_Track9:: @ 8699745
	.incbin "data/music/tracks/music434_track9.bin"

Music434_Header:: @ 86998C4
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08446DE8 @ voice group pointer
	.4byte Music434_Track0
	.4byte Music434_Track1
	.4byte Music434_Track2
	.4byte Music434_Track3
	.4byte Music434_Track4
	.4byte Music434_Track5
	.4byte Music434_Track6
	.4byte Music434_Track7
	.4byte Music434_Track8
	.4byte Music434_Track9

Music435_Track0:: @ 86998F4
	.incbin "data/music/tracks/music435_track0.bin"

Music435_Track1:: @ 869992F
	.incbin "data/music/tracks/music435_track1.bin"

Music435_Track2:: @ 8699A91
	.incbin "data/music/tracks/music435_track2.bin"

Music435_Track3:: @ 8699B81
	.incbin "data/music/tracks/music435_track3.bin"

Music435_Header:: @ 8699C24
	.byte 4 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084473E8 @ voice group pointer
	.4byte Music435_Track0
	.4byte Music435_Track1
	.4byte Music435_Track2
	.4byte Music435_Track3

Music436_Track0:: @ 8699C3C
	.incbin "data/music/tracks/music436_track0.bin"

Music436_Track1:: @ 8699CC1
	.incbin "data/music/tracks/music436_track1.bin"

Music436_Track2:: @ 8699D34
	.incbin "data/music/tracks/music436_track2.bin"

Music436_Track3:: @ 8699DC9
	.incbin "data/music/tracks/music436_track3.bin"

Music436_Track4:: @ 8699F58
	.incbin "data/music/tracks/music436_track4.bin"

Music436_Track5:: @ 869A181
	.incbin "data/music/tracks/music436_track5.bin"

Music436_Track6:: @ 869A360
	.incbin "data/music/tracks/music436_track6.bin"

Music436_Track7:: @ 869A503
	.incbin "data/music/tracks/music436_track7.bin"

Music436_Track8:: @ 869A536
	.incbin "data/music/tracks/music436_track8.bin"

Music436_Track9:: @ 869A6C0
	.incbin "data/music/tracks/music436_track9.bin"

Music436_Header:: @ 869A7BC
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08447400 @ voice group pointer
	.4byte Music436_Track0
	.4byte Music436_Track1
	.4byte Music436_Track2
	.4byte Music436_Track3
	.4byte Music436_Track4
	.4byte Music436_Track5
	.4byte Music436_Track6
	.4byte Music436_Track7
	.4byte Music436_Track8
	.4byte Music436_Track9

Music437_Track0:: @ 869A7EC
	.incbin "data/music/tracks/music437_track0.bin"

Music437_Track1:: @ 869AA96
	.incbin "data/music/tracks/music437_track1.bin"

Music437_Track2:: @ 869AB48
	.incbin "data/music/tracks/music437_track2.bin"

Music437_Track3:: @ 869ABB7
	.incbin "data/music/tracks/music437_track3.bin"

Music437_Track4:: @ 869AD7D
	.incbin "data/music/tracks/music437_track4.bin"

Music437_Track5:: @ 869AFEB
	.incbin "data/music/tracks/music437_track5.bin"

Music437_Track6:: @ 869B1D8
	.incbin "data/music/tracks/music437_track6.bin"

Music437_Track7:: @ 869B3C1
	.incbin "data/music/tracks/music437_track7.bin"

Music437_Track8:: @ 869B4EE
	.incbin "data/music/tracks/music437_track8.bin"

Music437_Header:: @ 869B678
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08447A00 @ voice group pointer
	.4byte Music437_Track0
	.4byte Music437_Track1
	.4byte Music437_Track2
	.4byte Music437_Track3
	.4byte Music437_Track4
	.4byte Music437_Track5
	.4byte Music437_Track6
	.4byte Music437_Track7
	.4byte Music437_Track8

Music438_Track0:: @ 869B6A4
	.incbin "data/music/tracks/music438_track0.bin"

Music438_Track1:: @ 869B786
	.incbin "data/music/tracks/music438_track1.bin"

Music438_Track2:: @ 869B93C
	.incbin "data/music/tracks/music438_track2.bin"

Music438_Track3:: @ 869BA92
	.incbin "data/music/tracks/music438_track3.bin"

Music438_Track4:: @ 869BB48
	.incbin "data/music/tracks/music438_track4.bin"

Music438_Track5:: @ 869BBF8
	.incbin "data/music/tracks/music438_track5.bin"

Music438_Track6:: @ 869BC23
	.incbin "data/music/tracks/music438_track6.bin"

Music438_Track7:: @ 869BD3B
	.incbin "data/music/tracks/music438_track7.bin"

Music438_Header:: @ 869BE8C
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08447DF0 @ voice group pointer
	.4byte Music438_Track0
	.4byte Music438_Track1
	.4byte Music438_Track2
	.4byte Music438_Track3
	.4byte Music438_Track4
	.4byte Music438_Track5
	.4byte Music438_Track6
	.4byte Music438_Track7

Music439_Track0:: @ 869BEB4
	.incbin "data/music/tracks/music439_track0.bin"

Music439_Track1:: @ 869BF22
	.incbin "data/music/tracks/music439_track1.bin"

Music439_Track2:: @ 869C025
	.incbin "data/music/tracks/music439_track2.bin"

Music439_Track3:: @ 869C09B
	.incbin "data/music/tracks/music439_track3.bin"

Music439_Track4:: @ 869C18D
	.incbin "data/music/tracks/music439_track4.bin"

Music439_Track5:: @ 869C270
	.incbin "data/music/tracks/music439_track5.bin"

Music439_Track6:: @ 869C2F8
	.incbin "data/music/tracks/music439_track6.bin"

Music439_Track7:: @ 869C3D3
	.incbin "data/music/tracks/music439_track7.bin"

Music439_Header:: @ 869C498
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084483F0 @ voice group pointer
	.4byte Music439_Track0
	.4byte Music439_Track1
	.4byte Music439_Track2
	.4byte Music439_Track3
	.4byte Music439_Track4
	.4byte Music439_Track5
	.4byte Music439_Track6
	.4byte Music439_Track7

Music440_Track0:: @ 869C4C0
	.incbin "data/music/tracks/music440_track0.bin"

Music440_Track1:: @ 869C643
	.incbin "data/music/tracks/music440_track1.bin"

Music440_Track2:: @ 869C77F
	.incbin "data/music/tracks/music440_track2.bin"

Music440_Track3:: @ 869C863
	.incbin "data/music/tracks/music440_track3.bin"

Music440_Track4:: @ 869CB1C
	.incbin "data/music/tracks/music440_track4.bin"

Music440_Track5:: @ 869CDE0
	.incbin "data/music/tracks/music440_track5.bin"

Music440_Track6:: @ 869D034
	.incbin "data/music/tracks/music440_track6.bin"

Music440_Track7:: @ 869D215
	.incbin "data/music/tracks/music440_track7.bin"

Music440_Header:: @ 869D35C
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084489F0 @ voice group pointer
	.4byte Music440_Track0
	.4byte Music440_Track1
	.4byte Music440_Track2
	.4byte Music440_Track3
	.4byte Music440_Track4
	.4byte Music440_Track5
	.4byte Music440_Track6
	.4byte Music440_Track7

Music441_Track0:: @ 869D384
	.incbin "data/music/tracks/music441_track0.bin"

Music441_Track1:: @ 869D5C7
	.incbin "data/music/tracks/music441_track1.bin"

Music441_Track2:: @ 869D689
	.incbin "data/music/tracks/music441_track2.bin"

Music441_Track3:: @ 869D855
	.incbin "data/music/tracks/music441_track3.bin"

Music441_Track4:: @ 869D92F
	.incbin "data/music/tracks/music441_track4.bin"

Music441_Track5:: @ 869D9D5
	.incbin "data/music/tracks/music441_track5.bin"

Music441_Track6:: @ 869DB11
	.incbin "data/music/tracks/music441_track6.bin"

Music441_Track7:: @ 869DC81
	.incbin "data/music/tracks/music441_track7.bin"

Music441_Track8:: @ 869DCC2
	.incbin "data/music/tracks/music441_track8.bin"

Music441_Track9:: @ 869DE11
	.incbin "data/music/tracks/music441_track9.bin"

Music441_Header:: @ 869DEBC
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08448FF0 @ voice group pointer
	.4byte Music441_Track0
	.4byte Music441_Track1
	.4byte Music441_Track2
	.4byte Music441_Track3
	.4byte Music441_Track4
	.4byte Music441_Track5
	.4byte Music441_Track6
	.4byte Music441_Track7
	.4byte Music441_Track8
	.4byte Music441_Track9

Music442_Track0:: @ 869DEEC
	.incbin "data/music/tracks/music442_track0.bin"

Music442_Track1:: @ 869DFA0
	.incbin "data/music/tracks/music442_track1.bin"

Music442_Track2:: @ 869E10F
	.incbin "data/music/tracks/music442_track2.bin"

Music442_Track3:: @ 869E18D
	.incbin "data/music/tracks/music442_track3.bin"

Music442_Track4:: @ 869E30F
	.incbin "data/music/tracks/music442_track4.bin"

Music442_Track5:: @ 869E4CC
	.incbin "data/music/tracks/music442_track5.bin"

Music442_Track6:: @ 869E63D
	.incbin "data/music/tracks/music442_track6.bin"

Music442_Track7:: @ 869E7D6
	.incbin "data/music/tracks/music442_track7.bin"

Music442_Track8:: @ 869E9C9
	.incbin "data/music/tracks/music442_track8.bin"

Music442_Header:: @ 869EAE0
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x084495F0 @ voice group pointer
	.4byte Music442_Track0
	.4byte Music442_Track1
	.4byte Music442_Track2
	.4byte Music442_Track3
	.4byte Music442_Track4
	.4byte Music442_Track5
	.4byte Music442_Track6
	.4byte Music442_Track7
	.4byte Music442_Track8

Music443_Track0:: @ 869EB0C
	.incbin "data/music/tracks/music443_track0.bin"

Music443_Track1:: @ 869EBF9
	.incbin "data/music/tracks/music443_track1.bin"

Music443_Track2:: @ 869EC7D
	.incbin "data/music/tracks/music443_track2.bin"

Music443_Track3:: @ 869EDE1
	.incbin "data/music/tracks/music443_track3.bin"

Music443_Track4:: @ 869EF02
	.incbin "data/music/tracks/music443_track4.bin"

Music443_Track5:: @ 869EF7A
	.incbin "data/music/tracks/music443_track5.bin"

Music443_Header:: @ 869F140
	.byte 6 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08449BF0 @ voice group pointer
	.4byte Music443_Track0
	.4byte Music443_Track1
	.4byte Music443_Track2
	.4byte Music443_Track3
	.4byte Music443_Track4
	.4byte Music443_Track5

Music444_Track0:: @ 869F160
	.incbin "data/music/tracks/music444_track0.bin"

Music444_Track1:: @ 869F235
	.incbin "data/music/tracks/music444_track1.bin"

Music444_Track2:: @ 869F371
	.incbin "data/music/tracks/music444_track2.bin"

Music444_Header:: @ 869F41C
	.byte 3 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844A1F0 @ voice group pointer
	.4byte Music444_Track0
	.4byte Music444_Track1
	.4byte Music444_Track2

Music445_Track0:: @ 869F430
	.incbin "data/music/tracks/music445_track0.bin"

Music445_Track1:: @ 869F53D
	.incbin "data/music/tracks/music445_track1.bin"

Music445_Track2:: @ 869F92D
	.incbin "data/music/tracks/music445_track2.bin"

Music445_Track3:: @ 869F96F
	.incbin "data/music/tracks/music445_track3.bin"

Music445_Track4:: @ 869FBD7
	.incbin "data/music/tracks/music445_track4.bin"

Music445_Track5:: @ 869FE4B
	.incbin "data/music/tracks/music445_track5.bin"

Music445_Track6:: @ 869FE97
	.incbin "data/music/tracks/music445_track6.bin"

Music445_Track7:: @ 86A0103
	.incbin "data/music/tracks/music445_track7.bin"

Music445_Header:: @ 86A04F8
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844A7F0 @ voice group pointer
	.4byte Music445_Track0
	.4byte Music445_Track1
	.4byte Music445_Track2
	.4byte Music445_Track3
	.4byte Music445_Track4
	.4byte Music445_Track5
	.4byte Music445_Track6
	.4byte Music445_Track7

Music446_Track0:: @ 86A0520
	.incbin "data/music/tracks/music446_track0.bin"

Music446_Track1:: @ 86A059D
	.incbin "data/music/tracks/music446_track1.bin"

Music446_Track2:: @ 86A0623
	.incbin "data/music/tracks/music446_track2.bin"

Music446_Track3:: @ 86A06B1
	.incbin "data/music/tracks/music446_track3.bin"

Music446_Track4:: @ 86A079F
	.incbin "data/music/tracks/music446_track4.bin"

Music446_Track5:: @ 86A0803
	.incbin "data/music/tracks/music446_track5.bin"

Music446_Track6:: @ 86A0867
	.incbin "data/music/tracks/music446_track6.bin"

Music446_Track7:: @ 86A08E2
	.incbin "data/music/tracks/music446_track7.bin"

Music446_Header:: @ 86A095C
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844ADF0 @ voice group pointer
	.4byte Music446_Track0
	.4byte Music446_Track1
	.4byte Music446_Track2
	.4byte Music446_Track3
	.4byte Music446_Track4
	.4byte Music446_Track5
	.4byte Music446_Track6
	.4byte Music446_Track7

Music447_Track0:: @ 86A0984
	.incbin "data/music/tracks/music447_track0.bin"

Music447_Track1:: @ 86A0D48
	.incbin "data/music/tracks/music447_track1.bin"

Music447_Track2:: @ 86A0D94
	.incbin "data/music/tracks/music447_track2.bin"

Music447_Track3:: @ 86A0E9B
	.incbin "data/music/tracks/music447_track3.bin"

Music447_Track4:: @ 86A0F44
	.incbin "data/music/tracks/music447_track4.bin"

Music447_Track5:: @ 86A0FE7
	.incbin "data/music/tracks/music447_track5.bin"

Music447_Track6:: @ 86A1093
	.incbin "data/music/tracks/music447_track6.bin"

Music447_Header:: @ 86A1118
	.byte 7 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844B3F0 @ voice group pointer
	.4byte Music447_Track0
	.4byte Music447_Track1
	.4byte Music447_Track2
	.4byte Music447_Track3
	.4byte Music447_Track4
	.4byte Music447_Track5
	.4byte Music447_Track6

Music448_Track0:: @ 86A113C
	.incbin "data/music/tracks/music448_track0.bin"

Music448_Track1:: @ 86A11F6
	.incbin "data/music/tracks/music448_track1.bin"

Music448_Track2:: @ 86A1484
	.incbin "data/music/tracks/music448_track2.bin"

Music448_Track3:: @ 86A17E6
	.incbin "data/music/tracks/music448_track3.bin"

Music448_Track4:: @ 86A19B7
	.incbin "data/music/tracks/music448_track4.bin"

Music448_Track5:: @ 86A1B64
	.incbin "data/music/tracks/music448_track5.bin"

Music448_Track6:: @ 86A1C24
	.incbin "data/music/tracks/music448_track6.bin"

Music448_Track7:: @ 86A1DD6
	.incbin "data/music/tracks/music448_track7.bin"

Music448_Header:: @ 86A1FF8
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844B9F0 @ voice group pointer
	.4byte Music448_Track0
	.4byte Music448_Track1
	.4byte Music448_Track2
	.4byte Music448_Track3
	.4byte Music448_Track4
	.4byte Music448_Track5
	.4byte Music448_Track6
	.4byte Music448_Track7

Music449_Track0:: @ 86A2020
	.incbin "data/music/tracks/music449_track0.bin"

Music449_Track1:: @ 86A20CB
	.incbin "data/music/tracks/music449_track1.bin"

Music449_Track2:: @ 86A20F1
	.incbin "data/music/tracks/music449_track2.bin"

Music449_Track3:: @ 86A2191
	.incbin "data/music/tracks/music449_track3.bin"

Music449_Track4:: @ 86A2239
	.incbin "data/music/tracks/music449_track4.bin"

Music449_Track5:: @ 86A225A
	.incbin "data/music/tracks/music449_track5.bin"

Music449_Track6:: @ 86A231A
	.incbin "data/music/tracks/music449_track6.bin"

Music449_Track7:: @ 86A2391
	.incbin "data/music/tracks/music449_track7.bin"

Music449_Track8:: @ 86A240A
	.incbin "data/music/tracks/music449_track8.bin"

Music449_Track9:: @ 86A2465
	.incbin "data/music/tracks/music449_track9.bin"

Music449_Header:: @ 86A2500
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844BFF0 @ voice group pointer
	.4byte Music449_Track0
	.4byte Music449_Track1
	.4byte Music449_Track2
	.4byte Music449_Track3
	.4byte Music449_Track4
	.4byte Music449_Track5
	.4byte Music449_Track6
	.4byte Music449_Track7
	.4byte Music449_Track8
	.4byte Music449_Track9

Music450_Track0:: @ 86A2530
	.incbin "data/music/tracks/music450_track0.bin"

Music450_Track1:: @ 86A2580
	.incbin "data/music/tracks/music450_track1.bin"

Music450_Track2:: @ 86A2756
	.incbin "data/music/tracks/music450_track2.bin"

Music450_Track3:: @ 86A2A3C
	.incbin "data/music/tracks/music450_track3.bin"

Music450_Track4:: @ 86A2A81
	.incbin "data/music/tracks/music450_track4.bin"

Music450_Track5:: @ 86A2C0C
	.incbin "data/music/tracks/music450_track5.bin"

Music450_Track6:: @ 86A2D9A
	.incbin "data/music/tracks/music450_track6.bin"

Music450_Track7:: @ 86A2E62
	.incbin "data/music/tracks/music450_track7.bin"

Music450_Track8:: @ 86A3008
	.incbin "data/music/tracks/music450_track8.bin"

Music450_Header:: @ 86A3188
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844C5F0 @ voice group pointer
	.4byte Music450_Track0
	.4byte Music450_Track1
	.4byte Music450_Track2
	.4byte Music450_Track3
	.4byte Music450_Track4
	.4byte Music450_Track5
	.4byte Music450_Track6
	.4byte Music450_Track7
	.4byte Music450_Track8

Music451_Track0:: @ 86A31B4
	.incbin "data/music/tracks/music451_track0.bin"

Music451_Track1:: @ 86A31E3
	.incbin "data/music/tracks/music451_track1.bin"

Music451_Track2:: @ 86A32E0
	.incbin "data/music/tracks/music451_track2.bin"

Music451_Track3:: @ 86A3360
	.incbin "data/music/tracks/music451_track3.bin"

Music451_Track4:: @ 86A3450
	.incbin "data/music/tracks/music451_track4.bin"

Music451_Track5:: @ 86A351B
	.incbin "data/music/tracks/music451_track5.bin"

Music451_Track6:: @ 86A35E5
	.incbin "data/music/tracks/music451_track6.bin"

Music451_Track7:: @ 86A3664
	.incbin "data/music/tracks/music451_track7.bin"

Music451_Header:: @ 86A370C
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844CBF0 @ voice group pointer
	.4byte Music451_Track0
	.4byte Music451_Track1
	.4byte Music451_Track2
	.4byte Music451_Track3
	.4byte Music451_Track4
	.4byte Music451_Track5
	.4byte Music451_Track6
	.4byte Music451_Track7

Music452_Track0:: @ 86A3734
	.incbin "data/music/tracks/music452_track0.bin"

Music452_Track1:: @ 86A37DE
	.incbin "data/music/tracks/music452_track1.bin"

Music452_Track2:: @ 86A3865
	.incbin "data/music/tracks/music452_track2.bin"

Music452_Track3:: @ 86A396F
	.incbin "data/music/tracks/music452_track3.bin"

Music452_Track4:: @ 86A3A50
	.incbin "data/music/tracks/music452_track4.bin"

Music452_Track5:: @ 86A3B31
	.incbin "data/music/tracks/music452_track5.bin"

Music452_Track6:: @ 86A3C64
	.incbin "data/music/tracks/music452_track6.bin"

Music452_Track7:: @ 86A3CEE
	.incbin "data/music/tracks/music452_track7.bin"

Music452_Header:: @ 86A3D94
	.byte 8 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844D1F0 @ voice group pointer
	.4byte Music452_Track0
	.4byte Music452_Track1
	.4byte Music452_Track2
	.4byte Music452_Track3
	.4byte Music452_Track4
	.4byte Music452_Track5
	.4byte Music452_Track6
	.4byte Music452_Track7

Music453_Track0:: @ 86A3DBC
	.incbin "data/music/tracks/music453_track0.bin"

Music453_Track1:: @ 86A3EB4
	.incbin "data/music/tracks/music453_track1.bin"

Music453_Track2:: @ 86A3F47
	.incbin "data/music/tracks/music453_track2.bin"

Music453_Track3:: @ 86A3FAC
	.incbin "data/music/tracks/music453_track3.bin"

Music453_Track4:: @ 86A403F
	.incbin "data/music/tracks/music453_track4.bin"

Music453_Track5:: @ 86A4067
	.incbin "data/music/tracks/music453_track5.bin"

Music453_Track6:: @ 86A4144
	.incbin "data/music/tracks/music453_track6.bin"

Music453_Track7:: @ 86A4221
	.incbin "data/music/tracks/music453_track7.bin"

Music453_Track8:: @ 86A4285
	.incbin "data/music/tracks/music453_track8.bin"

Music453_Header:: @ 86A4318
	.byte 9 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844D7F0 @ voice group pointer
	.4byte Music453_Track0
	.4byte Music453_Track1
	.4byte Music453_Track2
	.4byte Music453_Track3
	.4byte Music453_Track4
	.4byte Music453_Track5
	.4byte Music453_Track6
	.4byte Music453_Track7
	.4byte Music453_Track8

Music454_Track0:: @ 86A4344
	.incbin "data/music/tracks/music454_track0.bin"

Music454_Track1:: @ 86A447B
	.incbin "data/music/tracks/music454_track1.bin"

Music454_Track2:: @ 86A471E
	.incbin "data/music/tracks/music454_track2.bin"

Music454_Track3:: @ 86A49B9
	.incbin "data/music/tracks/music454_track3.bin"

Music454_Track4:: @ 86A4B96
	.incbin "data/music/tracks/music454_track4.bin"

Music454_Track5:: @ 86A4C25
	.incbin "data/music/tracks/music454_track5.bin"

Music454_Track6:: @ 86A4DCA
	.incbin "data/music/tracks/music454_track6.bin"

Music454_Track7:: @ 86A4FAD
	.incbin "data/music/tracks/music454_track7.bin"

Music454_Track8:: @ 86A50DC
	.incbin "data/music/tracks/music454_track8.bin"

Music454_Track9:: @ 86A52CA
	.incbin "data/music/tracks/music454_track9.bin"

Music454_Header:: @ 86A53FC
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844DDF0 @ voice group pointer
	.4byte Music454_Track0
	.4byte Music454_Track1
	.4byte Music454_Track2
	.4byte Music454_Track3
	.4byte Music454_Track4
	.4byte Music454_Track5
	.4byte Music454_Track6
	.4byte Music454_Track7
	.4byte Music454_Track8
	.4byte Music454_Track9

Music455_Track0:: @ 86A542C
	.incbin "data/music/tracks/music455_track0.bin"

Music455_Track1:: @ 86A5762
	.incbin "data/music/tracks/music455_track1.bin"

Music455_Track2:: @ 86A5D79
	.incbin "data/music/tracks/music455_track2.bin"

Music455_Track3:: @ 86A6032
	.incbin "data/music/tracks/music455_track3.bin"

Music455_Track4:: @ 86A65BC
	.incbin "data/music/tracks/music455_track4.bin"

Music455_Track5:: @ 86A6A4E
	.incbin "data/music/tracks/music455_track5.bin"

Music455_Track6:: @ 86A6F54
	.incbin "data/music/tracks/music455_track6.bin"

Music455_Track7:: @ 86A72DF
	.incbin "data/music/tracks/music455_track7.bin"

Music455_Track8:: @ 86A7349
	.incbin "data/music/tracks/music455_track8.bin"

Music455_Track9:: @ 86A7585
	.incbin "data/music/tracks/music455_track9.bin"

Music455_Header:: @ 86A7A28
	.byte 10 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844E3F0 @ voice group pointer
	.4byte Music455_Track0
	.4byte Music455_Track1
	.4byte Music455_Track2
	.4byte Music455_Track3
	.4byte Music455_Track4
	.4byte Music455_Track5
	.4byte Music455_Track6
	.4byte Music455_Track7
	.4byte Music455_Track8
	.4byte Music455_Track9

Music456_Track0:: @ 86A7A58
	.incbin "data/music/tracks/music456_track0.bin"

Music456_Track1:: @ 86A7D7D
	.incbin "data/music/tracks/music456_track1.bin"

Music456_Header:: @ 86A7F4C
	.byte 2 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x0844E918 @ voice group pointer
	.4byte Music456_Track0
	.4byte Music456_Track1

Music457_Track0:: @ 86A7F5C
	.incbin "data/music/tracks/music457_track0.bin"

Music457_Track1:: @ 86A8155
	.incbin "data/music/tracks/music457_track1.bin"

Music457_Track2:: @ 86A8389
	.incbin "data/music/tracks/music457_track2.bin"

Music457_Track3:: @ 86A8577
	.incbin "data/music/tracks/music457_track3.bin"

Music457_Track4:: @ 86A86C0
	.incbin "data/music/tracks/music457_track4.bin"

Music457_Track5:: @ 86A8794
	.incbin "data/music/tracks/music457_track5.bin"

Music457_Track6:: @ 86A8830
	.incbin "data/music/tracks/music457_track6.bin"

Music457_Track7:: @ 86A891A
	.incbin "data/music/tracks/music457_track7.bin"

Music457_Header:: @ 86A8A04
	.byte 8 @ number of tracks
	.byte 0, 1, 178 @ unknown
	.4byte 0x0844ECF0 @ voice group pointer
	.4byte Music457_Track0
	.4byte Music457_Track1
	.4byte Music457_Track2
	.4byte Music457_Track3
	.4byte Music457_Track4
	.4byte Music457_Track5
	.4byte Music457_Track6
	.4byte Music457_Track7

Music458_Track0:: @ 86A8A2C
	.incbin "data/music/tracks/music458_track0.bin"

Music458_Track1:: @ 86A8CFD
	.incbin "data/music/tracks/music458_track1.bin"

Music458_Track2:: @ 86A9043
	.incbin "data/music/tracks/music458_track2.bin"

Music458_Track3:: @ 86A92D1
	.incbin "data/music/tracks/music458_track3.bin"

Music458_Track4:: @ 86A9541
	.incbin "data/music/tracks/music458_track4.bin"

Music458_Track5:: @ 86A9766
	.incbin "data/music/tracks/music458_track5.bin"

Music458_Track6:: @ 86A9915
	.incbin "data/music/tracks/music458_track6.bin"

Music458_Track7:: @ 86A9AC8
	.incbin "data/music/tracks/music458_track7.bin"

Music458_Header:: @ 86A9C6C
	.byte 8 @ number of tracks
	.byte 0, 1, 178 @ unknown
	.4byte 0x0844F0C8 @ voice group pointer
	.4byte Music458_Track0
	.4byte Music458_Track1
	.4byte Music458_Track2
	.4byte Music458_Track3
	.4byte Music458_Track4
	.4byte Music458_Track5
	.4byte Music458_Track6
	.4byte Music458_Track7

Music459_Track0:: @ 86A9C94
	.incbin "data/music/tracks/music459_track0.bin"

Music459_Track1:: @ 86A9F20
	.incbin "data/music/tracks/music459_track1.bin"

Music459_Track2:: @ 86AA238
	.incbin "data/music/tracks/music459_track2.bin"

Music459_Track3:: @ 86AA483
	.incbin "data/music/tracks/music459_track3.bin"

Music459_Track4:: @ 86AA644
	.incbin "data/music/tracks/music459_track4.bin"

Music459_Track5:: @ 86AA903
	.incbin "data/music/tracks/music459_track5.bin"

Music459_Track6:: @ 86AA993
	.incbin "data/music/tracks/music459_track6.bin"

Music459_Track7:: @ 86AAAFE
	.incbin "data/music/tracks/music459_track7.bin"

Music459_Header:: @ 86AAD10
	.byte 8 @ number of tracks
	.byte 0, 1, 178 @ unknown
	.4byte 0x0844F50C @ voice group pointer
	.4byte Music459_Track0
	.4byte Music459_Track1
	.4byte Music459_Track2
	.4byte Music459_Track3
	.4byte Music459_Track4
	.4byte Music459_Track5
	.4byte Music459_Track6
	.4byte Music459_Track7

Music460_Track0:: @ 86AAD38
	.incbin "data/music/tracks/music460_track0.bin"

Music460_Track1:: @ 86AAF06
	.incbin "data/music/tracks/music460_track1.bin"

Music460_Track2:: @ 86AB0E5
	.incbin "data/music/tracks/music460_track2.bin"

Music460_Track3:: @ 86AB2E6
	.incbin "data/music/tracks/music460_track3.bin"

Music460_Track4:: @ 86AB636
	.incbin "data/music/tracks/music460_track4.bin"

Music460_Track5:: @ 86AB7BC
	.incbin "data/music/tracks/music460_track5.bin"

Music460_Track6:: @ 86AB89B
	.incbin "data/music/tracks/music460_track6.bin"

Music460_Track7:: @ 86AB9E3
	.incbin "data/music/tracks/music460_track7.bin"

Music460_Header:: @ 86ABB40
	.byte 8 @ number of tracks
	.byte 0, 1, 178 @ unknown
	.4byte 0x0844F950 @ voice group pointer
	.4byte Music460_Track0
	.4byte Music460_Track1
	.4byte Music460_Track2
	.4byte Music460_Track3
	.4byte Music460_Track4
	.4byte Music460_Track5
	.4byte Music460_Track6
	.4byte Music460_Track7

Music461_Track0:: @ 86ABB68
	.incbin "data/music/tracks/music461_track0.bin"

Music461_Track1:: @ 86ABDF2
	.incbin "data/music/tracks/music461_track1.bin"

Music461_Track2:: @ 86AC086
	.incbin "data/music/tracks/music461_track2.bin"

Music461_Track3:: @ 86AC2F0
	.incbin "data/music/tracks/music461_track3.bin"

Music461_Track4:: @ 86AC5BE
	.incbin "data/music/tracks/music461_track4.bin"

Music461_Track5:: @ 86AC6DC
	.incbin "data/music/tracks/music461_track5.bin"

Music461_Track6:: @ 86AC753
	.incbin "data/music/tracks/music461_track6.bin"

Music461_Track7:: @ 86AC896
	.incbin "data/music/tracks/music461_track7.bin"

Music461_Header:: @ 86ACA30
	.byte 8 @ number of tracks
	.byte 0, 1, 178 @ unknown
	.4byte 0x0844FD94 @ voice group pointer
	.4byte Music461_Track0
	.4byte Music461_Track1
	.4byte Music461_Track2
	.4byte Music461_Track3
	.4byte Music461_Track4
	.4byte Music461_Track5
	.4byte Music461_Track6
	.4byte Music461_Track7

Music462_Track0:: @ 86ACA58
	.incbin "data/music/tracks/music462_track0.bin"

Music462_Track1:: @ 86ACBAF
	.incbin "data/music/tracks/music462_track1.bin"

Music462_Track2:: @ 86ACCD1
	.incbin "data/music/tracks/music462_track2.bin"

Music462_Track3:: @ 86ACE26
	.incbin "data/music/tracks/music462_track3.bin"

Music462_Track4:: @ 86ACF7E
	.incbin "data/music/tracks/music462_track4.bin"

Music462_Track5:: @ 86AD13A
	.incbin "data/music/tracks/music462_track5.bin"

Music462_Track6:: @ 86AD1AD
	.incbin "data/music/tracks/music462_track6.bin"

Music462_Track7:: @ 86AD261
	.incbin "data/music/tracks/music462_track7.bin"

Music462_Header:: @ 86AD344
	.byte 8 @ number of tracks
	.byte 0, 1, 178 @ unknown
	.4byte 0x0845019C @ voice group pointer
	.4byte Music462_Track0
	.4byte Music462_Track1
	.4byte Music462_Track2
	.4byte Music462_Track3
	.4byte Music462_Track4
	.4byte Music462_Track5
	.4byte Music462_Track6
	.4byte Music462_Track7

Music463_Track0:: @ 86AD36C
	.incbin "data/music/tracks/music463_track0.bin"

Music463_Track1:: @ 86AD47A
	.incbin "data/music/tracks/music463_track1.bin"

Music463_Track2:: @ 86AD5CF
	.incbin "data/music/tracks/music463_track2.bin"

Music463_Track3:: @ 86AD6E4
	.incbin "data/music/tracks/music463_track3.bin"

Music463_Track4:: @ 86AD799
	.incbin "data/music/tracks/music463_track4.bin"

Music463_Track5:: @ 86AD87C
	.incbin "data/music/tracks/music463_track5.bin"

Music463_Header:: @ 86ADA34
	.byte 6 @ number of tracks
	.byte 0, 1, 178 @ unknown
	.4byte 0x0845058C @ voice group pointer
	.4byte Music463_Track0
	.4byte Music463_Track1
	.4byte Music463_Track2
	.4byte Music463_Track3
	.4byte Music463_Track4
	.4byte Music463_Track5

Music464_Track0:: @ 86ADA54
	.incbin "data/music/tracks/music464_track0.bin"

Music464_Track1:: @ 86ADC67
	.incbin "data/music/tracks/music464_track1.bin"

Music464_Track2:: @ 86ADF74
	.incbin "data/music/tracks/music464_track2.bin"

Music464_Track3:: @ 86AE1B0
	.incbin "data/music/tracks/music464_track3.bin"

Music464_Track4:: @ 86AE339
	.incbin "data/music/tracks/music464_track4.bin"

Music464_Track5:: @ 86AE402
	.incbin "data/music/tracks/music464_track5.bin"

Music464_Track6:: @ 86AE49B
	.incbin "data/music/tracks/music464_track6.bin"

Music464_Track7:: @ 86AE5C0
	.incbin "data/music/tracks/music464_track7.bin"

Music464_Header:: @ 86AE6DC
	.byte 8 @ number of tracks
	.byte 0, 1, 178 @ unknown
	.4byte 0x08450B8C @ voice group pointer
	.4byte Music464_Track0
	.4byte Music464_Track1
	.4byte Music464_Track2
	.4byte Music464_Track3
	.4byte Music464_Track4
	.4byte Music464_Track5
	.4byte Music464_Track6
	.4byte Music464_Track7

Music465_Track0:: @ 86AE704
	.incbin "data/music/tracks/music465_track0.bin"

Music465_Track1:: @ 86AE87E
	.incbin "data/music/tracks/music465_track1.bin"

Music465_Track2:: @ 86AEA90
	.incbin "data/music/tracks/music465_track2.bin"

Music465_Track3:: @ 86AEC84
	.incbin "data/music/tracks/music465_track3.bin"

Music465_Track4:: @ 86AEE6C
	.incbin "data/music/tracks/music465_track4.bin"

Music465_Track5:: @ 86AF01D
	.incbin "data/music/tracks/music465_track5.bin"

Music465_Track6:: @ 86AF09E
	.incbin "data/music/tracks/music465_track6.bin"

Music465_Track7:: @ 86AF1D5
	.incbin "data/music/tracks/music465_track7.bin"

Music465_Header:: @ 86AF30C
	.byte 8 @ number of tracks
	.byte 0, 1, 178 @ unknown
	.4byte 0x08450FA0 @ voice group pointer
	.4byte Music465_Track0
	.4byte Music465_Track1
	.4byte Music465_Track2
	.4byte Music465_Track3
	.4byte Music465_Track4
	.4byte Music465_Track5
	.4byte Music465_Track6
	.4byte Music465_Track7

Music466_Track0:: @ 86AF334
	.incbin "data/music/tracks/music466_track0.bin"

Music466_Track1:: @ 86AF4F0
	.incbin "data/music/tracks/music466_track1.bin"

Music466_Track2:: @ 86AF79E
	.incbin "data/music/tracks/music466_track2.bin"

Music466_Track3:: @ 86AFA84
	.incbin "data/music/tracks/music466_track3.bin"

Music466_Track4:: @ 86AFC62
	.incbin "data/music/tracks/music466_track4.bin"

Music466_Track5:: @ 86AFDC6
	.incbin "data/music/tracks/music466_track5.bin"

Music466_Track6:: @ 86AFEC8
	.incbin "data/music/tracks/music466_track6.bin"

Music466_Track7:: @ 86B001F
	.incbin "data/music/tracks/music466_track7.bin"

Music466_Header:: @ 86B01A4
	.byte 8 @ number of tracks
	.byte 0, 1, 178 @ unknown
	.4byte 0x08451390 @ voice group pointer
	.4byte Music466_Track0
	.4byte Music466_Track1
	.4byte Music466_Track2
	.4byte Music466_Track3
	.4byte Music466_Track4
	.4byte Music466_Track5
	.4byte Music466_Track6
	.4byte Music466_Track7

Music467_Track0:: @ 86B01CC
	.incbin "data/music/tracks/music467_track0.bin"

Music467_Track1:: @ 86B0319
	.incbin "data/music/tracks/music467_track1.bin"

Music467_Track2:: @ 86B0488
	.incbin "data/music/tracks/music467_track2.bin"

Music467_Track3:: @ 86B05AE
	.incbin "data/music/tracks/music467_track3.bin"

Music467_Track4:: @ 86B0639
	.incbin "data/music/tracks/music467_track4.bin"

Music467_Header:: @ 86B070C
	.byte 5 @ number of tracks
	.byte 0, 0, 178 @ unknown
	.4byte 0x08454C54 @ voice group pointer
	.4byte Music467_Track0
	.4byte Music467_Track1
	.4byte Music467_Track2
	.4byte Music467_Track3
	.4byte Music467_Track4
