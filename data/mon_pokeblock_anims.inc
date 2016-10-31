gNatureToMonPokeblockAnim:: @ 8411A10
	.byte  0, 0 @ HARDY
	.byte  3, 0 @ LONELY
	.byte  4, 1 @ BRAVE
	.byte  5, 0 @ ADAMANT
	.byte 10, 0 @ NAUGHTY
	.byte 13, 0 @ BOLD
	.byte 15, 0 @ DOCILE
	.byte 16, 2 @ RELAXED
	.byte 18, 0 @ IMPISH
	.byte 19, 0 @ LAX
	.byte 20, 0 @ TIMID
	.byte 25, 0 @ HASTY
	.byte 27, 3 @ SERIOUS
	.byte 28, 0 @ JOLLY
	.byte 29, 0 @ NAIVE
	.byte 33, 4 @ MODEST
	.byte 36, 0 @ MILD
	.byte 37, 0 @ QUIET
	.byte 39, 0 @ BASHFUL
	.byte 42, 0 @ RASH
	.byte 45, 0 @ CALM
	.byte 46, 5 @ GENTLE
	.byte 47, 6 @ SASSY
	.byte 48, 0 @ CAREFUL
	.byte 53, 0 @ QUIRKY

	.align 1
gMonPokeblockAnims:: @ 8411A42
	@ HARDY
	.2byte   0,   4,   0,   8,  24,   0,   0,   0,  12,   0
	.2byte   0,   4,   0,  16,  24,   0,   0,   0,  12,   0
	.2byte   0,   4,   0,  32,  32,   0,   0,   0,  16,   1

	@ LONELY
	.2byte   0,   3,   6,   0,  48,   0,   0,   0,  24,   1

	@ BRAVE
	.2byte  64,  16, -24,   0,  32,   0,   0,   0,   0,   1

	@ ADAMANT
	.2byte   0,   4,   8,   0,  16,   0,  -8,   0,   0,   0
	.2byte   0,   0,   0,   0,  16,   0,   0,   0,   0,   0
	.2byte   0,   4,   8,   0,  16,   0,  -8,   0,   0,   0
	.2byte   0,   0,   0,   0,  16,   0,   0,   0,   0,   0
	.2byte   0,   4, -16,   0,   4,   0,  16,   0,   0,   1

	@ NAUGHTY
	.2byte   0,   3,   6,   0,  12,   0,   0,   0,   6,   0
	.2byte   0,   3,  -6,   0,  12,   0,   0,   0,   6,   0
	.2byte   0,  16,  16,   0,  45,   1,   0,   0,   0,   1

	@ BOLD
	.2byte   0,  16,   0,  24,  32,   0,   0,   0,  16,   0
	.2byte   0,  16,   0,  23,  32,   0,   0,   0,  16,   1

	@ DOCILE
	.2byte   0,   0,   0,   0,  80,   0,   0,   0,   0,   1

	@ RELAXED
	.2byte   0,   2,   8,   0,  32,   0,   0,   0,   0,   0
	.2byte   0,   2,  -8,   0,  32,   0,   0,   0,   0,   1

	@ IMPISH
	.2byte   0,  32,   2,   1,  48,   1,   0,   0,  24,   1

	@ LAX
	.2byte   0,   2,  16,  16, 128,   0,   0,   0,   0,   1

	@ TIMID
	.2byte   0,   2,  -8,   0,  48,   0, -24,   0,   0,   0
	.2byte   0,   0,   0,   0,   8,   0,   0,   0,   0,   0
	.2byte  64,  32,   2,   0,  36,   0,   0,   0,   0,   0
	.2byte   0,   0,   0,   0,   8,   0,   0,   0,   0,   0
	.2byte   0,   2,   8,   0,  48,   0,  24,   0,   0,   1

	@ HASTY
	.2byte  64,  24,  16,   0,  32,   0,   0,   0,   0,   0
	.2byte   0,  28,   2,   1,  32,   1,   0,   0,  16,   1

	@ SERIOUS
	.2byte   0,   0,   0,   0,  32,   0,   0,   0,   0,   1

	@ JOLLY
	.2byte  64,  16, -16,   2,  48,   0,   0,   0,  32,   1

	@ NAIVE
	.2byte   0,  12,  -8,   4,  24,   0,   8,   0,  12,   0
	.2byte   0,  12,   8,   8,  24,   0, -16,   0,  12,   0
	.2byte   0,  12,  -8,  16,  24,   0,  16,   0,  12,   0
	.2byte   0,  12,   8,  28,  24,   0,  -8,   0,  12,   1

	@ MODEST
	.2byte   0,   0,   0,   0,   8,   0,   0,   0,   0,   0
	.2byte  64,  16,  -4,   0,  32,   0,   0,   0,   0,   0
	.2byte   0,   0,   0,   0,   8,   0,   0,   0,   0,   1

	@ MILD
	.2byte 128,   4,   0,   8,  64,   0,   0,   0,   0,   1

	@ QUIET
	.2byte   0,   2,  16,   0,  48,   0,   0,   0,   0,   0
	.2byte 128,   2,  16,   0,  48,   0,   0,   0,   0,   1

	@ BASHFUL
	.2byte   0,   2,  -4,   0,  48,   0, -48,   0,   0,   0
	.2byte   0,   0,   0,   0,  80,   0,   0,   0,   0,   0
	.2byte   0,   2,   8,   0,  24,   0,  48,   0,   0,   1

	@ RASH
	.2byte  64,   4,  64,  58,  52,   0, -88,   0,   0,   0
	.2byte   0,   0,   0,   0,  80,   0,   0,   0,   0,   0
	.2byte   0,  24,  80,   0,  32,   0,  88,   0,   0,   1

	@ CALM
	.2byte   0,   2,  16,   4,  64,   0,   0,   0,   0,   1

	@ GENTLE
	.2byte   0,   0,   0,   0,  32,   0,   0,   0,   0,   1

	@ SASSY
	.2byte   0,   0,   0,   0,  42,   0,   0,   0,   0,   1

	@ CAREFUL
	.2byte   0,   4,   0,   8,  24,   0,   0,   0,  12,   0
	.2byte   0,   0,   0,   0,  12,   0,   0,   0,   0,   0
	.2byte   0,   4,   0,  12,  24,   0,   0,   0,  12,   0
	.2byte   0,   0,   0,   0,  12,   0,   0,   0,   0,   0
	.2byte   0,   4,   0,   4,  24,   0,   0,   0,  12,   1

	@ QUIRKY
	.2byte   0,   4,  16,  12,  64,   0,   0,   0,   0,   0
	.2byte   0,  -4,  16,  12,  64,   0,   0,   0,   0,   1
