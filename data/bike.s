	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083DB594:: @ 83DB594
	.4byte sub_80E5168
	.4byte sub_80E517C
	.4byte sub_80E51C4
	.4byte sub_80E5270

	.align 2
gUnknown_083DB5A4:: @ 83DB5A4
	.4byte PlayerGoSpeed0
	.4byte sub_80593C4
	.4byte sub_80593F4

	.align 2
gUnknown_083DB5B0:: @ 83DB5B0
	.4byte sub_80E56F8
	.4byte sub_80E5708
	.4byte sub_80E5744
	.4byte sub_80E57BC
	.4byte sub_80E57F8
	.4byte sub_80E5834
	.4byte sub_80E5870
	.4byte sub_80E58AC
	.4byte sub_80E5920
	.4byte sub_80E5990
	.4byte sub_80E59A0
	.4byte sub_80E5A30
	.4byte sub_80E5AC0

	.align 2
gUnknown_083DB5E4:: @ 83DB5E4
	.4byte CheckMovementInputAcroBikeNormal
	.4byte CheckMovementInputAcroBikeChangingDirection
	.4byte CheckMovementInputAcroBikeStandingWheelie
	.4byte CheckMovementInputAcroBikeBunnyHop
	.4byte CheckMovementInputAcroBikeMovingWheelie
	.4byte CheckMovementInputAcroBikeUnknownMode5
	.4byte CheckMovementInputAcroBikeUnknownMode6

	.align 1
gUnknown_083DB600:: @ 83DB600
	.2byte 1, 2, 4

Unknown_3DB606:: @ 83DB606
	.byte 4, 0

	.align 2
gUnknown_083DB608:: @ 83DB608
	.4byte 0x1, 0x2, 0xf, 0xf, Unknown_3DB606, Unknown_3DB606, 0x1
	.4byte 0x2, 0x2, 0xf, 0xf, Unknown_3DB606, Unknown_3DB606, 0x2
	.4byte 0x3, 0x2, 0xf, 0xf, Unknown_3DB606, Unknown_3DB606, 0x3
	.4byte 0x4, 0x2, 0xf, 0xf, Unknown_3DB606, Unknown_3DB606, 0x4
