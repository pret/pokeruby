	.align 2

gFieldObjectBaseOam_8x8: @ 83711C4
	.4byte OAM_SIZE_8x8
	.2byte 2 << 10 @ priority

	.align 2

gFieldObjectBaseOam_16x8: @ 83711CC
	.4byte OAM_SIZE_16x8
	.2byte 2 << 10 @ priority

	.align 2

gFieldObjectBaseOam_16x16: @ 83711D4
	.4byte OAM_SIZE_16x16
	.2byte 2 << 10 @ priority

	.align 2

gFieldObjectBaseOam_32x8: @ 83711DC
	.4byte OAM_SIZE_32x8
	.2byte 2 << 10 @ priority

	.align 2

gFieldObjectBaseOam_64x32: @ 83711E4
	.4byte OAM_SIZE_64x32
	.2byte 2 << 10 @ priority

	.align 2

gFieldObjectBaseOam_16x32: @ 83711EC
	.4byte OAM_SIZE_16x32
	.2byte 2 << 10 @ priority

	.align 2

gFieldObjectBaseOam_32x32: @ 83711F4
	.4byte OAM_SIZE_32x32
	.2byte 2 << 10 @ priority

	.align 2

gFieldObjectBaseOam_64x64: @ 83711FC
	.4byte OAM_SIZE_64x64
	.2byte 2 << 10 @ priority
