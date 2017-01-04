	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
Unknown_83760F0:
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1
	.4byte Step1

	.align 2
Unknown_8376130:
	.4byte Step2
	.4byte Step2
	.4byte Step2
	.4byte Step2
	.4byte Step2
	.4byte Step2
	.4byte Step2
	.4byte Step2

	.align 2
Unknown_8376150:
	.4byte Step2
	.4byte Step3
	.4byte Step3
	.4byte Step2
	.4byte Step3
	.4byte Step3

	.align 2
Unknown_8376168:
	.4byte Step4
	.4byte Step4
	.4byte Step4
	.4byte Step4

	.align 2
Unknown_8376178:
	.4byte Step8
	.4byte Step8

	.align 2
gUnknown_08376180:: @ 8376180
	.4byte Unknown_83760F0
	.4byte Unknown_8376130
	.4byte Unknown_8376150
	.4byte Unknown_8376168
	.4byte Unknown_8376178

	.align 1
gUnknown_08376194:: @ 8376194
	.2byte 16, 8, 6, 4, 2
Unknown_837619E:
	.byte  -4,  -6,  -8, -10, -11, -12, -12, -12, -11, -10,  -9,  -8,  -6,  -4,   0,   0
Unknown_83761AE:
	.byte   0,  -2,  -3,  -4,  -5,  -6,  -6,  -6,  -5,  -5,  -4,  -3,  -2,   0,   0,   0
Unknown_83761BE:
	.byte  -2,  -4,  -6,  -8,  -9, -10, -10, -10,  -9,  -8,  -6,  -5,  -3,  -2,   0,   0

	.align 2
gUnknown_083761D0:: @ 83761D0
	.4byte Unknown_837619E
	.4byte Unknown_83761AE
	.4byte Unknown_83761BE

	.align 1
gUnknown_083761DC:: @ 83761DC
	.2byte 0x10, 0x10, 0x20

gUnknown_083761E2:: @ 83761E2
	.byte 0, 0, 1

	.align 1
gUnknown_083761E6:: @ 83761E6
	.2byte 0x20, 0x20, 0x40

gUnknown_083761EC:: @ 83761EC
	.byte 1, 1, 2
