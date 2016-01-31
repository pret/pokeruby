	.align 2

gMapObjectSubspriteTable_16x16_0: ; 8371204
	subsprite  -8,  -8, 2,  0, 16x16

	.align 2

gMapObjectSubspriteTable_16x16_1: ; 837120C
	subsprite  -8,  -8, 1,  0, 16x16

	.align 2

gMapObjectSubspriteTable_16x16_2: ; 8371214
	subsprite  -8,  -8, 2,  0, 16x8
	subsprite  -8,   0, 3,  2, 16x8

	.align 2

gMapObjectSubspriteTable_16x16_3: ; 8371224
	subsprite  -8,  -8, 2,  0, 16x16
	subsprite  -8,  -8, 3,  0, 16x16

	.align 2

gMapObjectSubspriteTable_16x16_4: ; 8371234
	subsprite  -8,  -8, 1,  0, 16x16
	subsprite  -8,  -8, 3,  0, 16x16

	.align 2

gMapObjectSubspriteTables_16x16: ; 8371244
	.4byte 0 ; number of subsprites
	.4byte NULL ; unknown

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_16x16_0 ; below high bridge

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_16x16_1 ; above high bridge

	.4byte 2 ; number of subsprites
	.4byte gMapObjectSubspriteTable_16x16_2 ; unknown

	.4byte 2 ; number of subsprites
	.4byte gMapObjectSubspriteTable_16x16_3 ; long grass below high bridge

	.4byte 2 ; number of subsprites
	.4byte gMapObjectSubspriteTable_16x16_4 ; long grass above high bridge

	.align 2

gMapObjectSubspriteTable_16x32_0: ; 8371274
	subsprite  -8, -16, 2,  0, 16x32

	.align 2

gMapObjectSubspriteTable_16x32_1: ; 837127C
	subsprite  -8, -16, 1,  0, 16x32

	.align 2

gMapObjectSubspriteTable_16x32_2: ; 8371284
	subsprite  -8, -16, 2,  0, 16x16
	subsprite  -8,   0, 2,  4, 16x8
	subsprite  -8,   8, 3,  6, 16x8

	.align 2

gMapObjectSubspriteTable_16x32_3: ; 837129C
	subsprite  -8, -16, 2,  0, 16x16
	subsprite  -8,   0, 3,  4, 16x16

	.align 2

gMapObjectSubspriteTable_16x32_4: ; 83712AC
	subsprite  -8, -16, 1,  0, 16x16
	subsprite  -8,   0, 3,  4, 16x16

	.align 2

gMapObjectSubspriteTables_16x32: ; 83712BC
	.4byte 0 ; number of subsprites
	.4byte NULL ; unknown

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_16x32_0 ; below high bridge

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_16x32_1 ; above high bridge

	.4byte 3 ; number of subsprites
	.4byte gMapObjectSubspriteTable_16x32_2 ; unknown

	.4byte 2 ; number of subsprites
	.4byte gMapObjectSubspriteTable_16x32_3 ; long grass below high bridge

	.4byte 2 ; number of subsprites
	.4byte gMapObjectSubspriteTable_16x32_4 ; long grass above high bridge

	.align 2

gMapObjectSubspriteTable_32x32_0: ; 83712EC
	subsprite -16, -16, 2,  0, 32x32

	.align 2

gMapObjectSubspriteTable_32x32_1: ; 83712F4
	subsprite -16, -16, 1,  0, 32x32

	.align 2

gMapObjectSubspriteTable_32x32_2: ; 83712FC
	subsprite -16, -16, 2,  0, 32x16
	subsprite -16,   0, 2,  8, 32x8
	subsprite -16,   8, 3, 12, 32x8

	.align 2

gMapObjectSubspriteTable_32x32_3: ; 8371314
	subsprite -16, -16, 2,  0, 32x16
	subsprite -16,   0, 3,  8, 32x16

	.align 2

gMapObjectSubspriteTable_32x32_4: ; 8371324
	subsprite -16, -16, 1,  0, 32x16
	subsprite -16,   0, 3,  8, 32x16

	.align 2

gMapObjectSubspriteTables_32x32: ; 8371334
	.4byte 0 ; number of subsprites
	.4byte NULL ; unknown

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_32x32_0 ; below high bridge

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_32x32_1 ; above high bridge

	.4byte 3 ; number of subsprites
	.4byte gMapObjectSubspriteTable_32x32_2 ; unknown

	.4byte 2 ; number of subsprites
	.4byte gMapObjectSubspriteTable_32x32_3 ; long grass below high bridge

	.4byte 2 ; number of subsprites
	.4byte gMapObjectSubspriteTable_32x32_4 ; long grass above high bridge

	.align 2

gMapObjectSubspriteTable_Truck_0: ; 8371364
	subsprite -24, -24, 2,  0, 32x8
	subsprite   8, -24, 2,  4, 16x8
	subsprite -24, -16, 2,  6, 32x8
	subsprite   8, -16, 2, 10, 16x8
	subsprite -24,  -8, 2, 12, 32x8
	subsprite   8,  -8, 2, 16, 16x8
	subsprite -24,   0, 2, 18, 32x8
	subsprite   8,   0, 2, 22, 16x8
	subsprite -24,   8, 2, 24, 32x8
	subsprite   8,   8, 2, 28, 16x8
	subsprite -24,  16, 2, 30, 32x8
	subsprite   8,  16, 2, 34, 16x8

	.align 2

gMapObjectSubspriteTables_Truck: ; 83713C4
	.4byte 12 ; number of subsprites
	.4byte gMapObjectSubspriteTable_Truck_0 ; unknown

	.4byte 12 ; number of subsprites
	.4byte gMapObjectSubspriteTable_Truck_0 ; below high bridge

	.4byte 12 ; number of subsprites
	.4byte gMapObjectSubspriteTable_Truck_0 ; above high bridge

	.4byte 12 ; number of subsprites
	.4byte gMapObjectSubspriteTable_Truck_0 ; unknown

	.4byte 12 ; number of subsprites
	.4byte gMapObjectSubspriteTable_Truck_0 ; long grass below high bridge

	.4byte 12 ; number of subsprites
	.4byte gMapObjectSubspriteTable_Truck_0 ; long grass above high bridge

	.align 2

gMapObjectSubspriteTable_Unused_0: ; 83713F4
	subsprite -32, -16, 2,  0, 64x32

	.align 2

gMapObjectSubspriteTable_Unused_1: ; 83713FC
	subsprite -32, -16, 1,  0, 64x32

	.align 2

gMapObjectSubspriteTable_Unused_2: ; 8371404
	subsprite -32, -16, 2,  0, 64x32

	.align 2

gMapObjectSubspriteTable_Unused_3: ; 837140C
	subsprite -32, -16, 2,  0, 64x32

	.align 2

gMapObjectSubspriteTables_Unused: ; 8371414
	.4byte 0 ; number of subsprites
	.4byte NULL ; unknown

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_Unused_0 ; below high bridge

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_Unused_1 ; above high bridge

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_Unused_2 ; unknown

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_Unused_3 ; long grass below high bridge

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_Unused_3 ; long grass above high bridge

	.align 2

gMapObjectSubspriteTable_CableCar_0: ; 8371444
	subsprite -32, -32, 2,  0, 64x64

	.align 2

gMapObjectSubspriteTable_CableCar_1: ; 837144C
	subsprite -32, -32, 1,  0, 64x64

	.align 2

gMapObjectSubspriteTable_CableCar_2: ; 8371454
	subsprite -32, -32, 2,  0, 64x64

	.align 2

gMapObjectSubspriteTable_CableCar_3: ; 837145C
	subsprite -32, -32, 2,  0, 64x64

	.align 2

gMapObjectSubspriteTables_CableCar: ; 8371464
	.4byte 0 ; number of subsprites
	.4byte NULL ; unknown

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_CableCar_0 ; below high bridge

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_CableCar_1 ; above high bridge

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_CableCar_2 ; unknown

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_CableCar_3 ; long grass below high bridge

	.4byte 1 ; number of subsprites
	.4byte gMapObjectSubspriteTable_CableCar_3 ; long grass above high bridge

	.align 2

gMapObjectSubspriteTable_SSTidal_0: ; 8371494
	subsprite -48, -20, 2,  0, 32x8
	subsprite -16, -20, 2,  4, 32x8
	subsprite  16, -20, 2,  8, 32x8
	subsprite -48, -12, 2, 12, 32x8
	subsprite -16, -12, 2, 16, 32x8
	subsprite  16, -12, 2, 20, 32x8
	subsprite -48,  -4, 2, 24, 32x8
	subsprite -16,  -4, 2, 28, 32x8
	subsprite  16,  -4, 2, 32, 32x8
	subsprite -48,   4, 2, 36, 32x8
	subsprite -16,   4, 2, 40, 32x8
	subsprite  16,   4, 2, 44, 32x8
	subsprite -48,  12, 2, 48, 32x8
	subsprite -16,  12, 2, 52, 32x8
	subsprite  16,  12, 2, 56, 32x8

	.align 2

gMapObjectSubspriteTable_SSTidal_1: ; 837150C
	subsprite -48, -20, 1,  0, 32x8
	subsprite -16, -20, 1,  4, 32x8
	subsprite  16, -20, 1,  8, 32x8
	subsprite -48, -12, 1, 12, 32x8
	subsprite -16, -12, 1, 16, 32x8
	subsprite  16, -12, 1, 20, 32x8
	subsprite -48,  -4, 1, 24, 32x8
	subsprite -16,  -4, 1, 28, 32x8
	subsprite  16,  -4, 1, 32, 32x8
	subsprite -48,   4, 1, 36, 32x8
	subsprite -16,   4, 1, 40, 32x8
	subsprite  16,   4, 1, 44, 32x8
	subsprite -48,  12, 1, 48, 32x8
	subsprite -16,  12, 1, 52, 32x8
	subsprite  16,  12, 1, 56, 32x8

	.align 2

gMapObjectSubspriteTable_SSTidal_2: ; 8371584
	subsprite -48, -20, 2,  0, 32x8
	subsprite -16, -20, 2,  4, 32x8
	subsprite  16, -20, 2,  8, 32x8
	subsprite -48, -12, 2, 12, 32x8
	subsprite -16, -12, 2, 16, 32x8
	subsprite  16, -12, 2, 20, 32x8
	subsprite -48,  -4, 2, 24, 32x8
	subsprite -16,  -4, 2, 28, 32x8
	subsprite  16,  -4, 2, 32, 32x8
	subsprite -48,   4, 2, 36, 32x8
	subsprite -16,   4, 2, 40, 32x8
	subsprite  16,   4, 2, 44, 32x8
	subsprite -48,  12, 2, 48, 32x8
	subsprite -16,  12, 2, 52, 32x8
	subsprite  16,  12, 2, 56, 32x8

	.align 2

gMapObjectSubspriteTable_SSTidal_3: ; 83715FC
	subsprite -48, -20, 1,  0, 32x8
	subsprite -16, -20, 1,  4, 32x8
	subsprite  16, -20, 1,  8, 32x8
	subsprite -48, -12, 1, 12, 32x8
	subsprite -16, -12, 1, 16, 32x8
	subsprite  16, -12, 1, 20, 32x8
	subsprite -48,  -4, 2, 24, 32x8
	subsprite -16,  -4, 2, 28, 32x8
	subsprite  16,  -4, 2, 32, 32x8
	subsprite -48,   4, 2, 36, 32x8
	subsprite -16,   4, 2, 40, 32x8
	subsprite  16,   4, 2, 44, 32x8
	subsprite -48,  12, 2, 48, 32x8
	subsprite -16,  12, 2, 52, 32x8
	subsprite  16,  12, 2, 56, 32x8

	.align 2

gMapObjectSubspriteTables_SSTidal: ; 8371674
	.4byte 15 ; number of subsprites
	.4byte gMapObjectSubspriteTable_SSTidal_0 ; unknown

	.4byte 15 ; number of subsprites
	.4byte gMapObjectSubspriteTable_SSTidal_0 ; below high bridge

	.4byte 15 ; number of subsprites
	.4byte gMapObjectSubspriteTable_SSTidal_1 ; above high bridge

	.4byte 15 ; number of subsprites
	.4byte gMapObjectSubspriteTable_SSTidal_2 ; unknown

	.4byte 15 ; number of subsprites
	.4byte gMapObjectSubspriteTable_SSTidal_3 ; long grass below high bridge

	.4byte 15 ; number of subsprites
	.4byte gMapObjectSubspriteTable_SSTidal_3 ; long grass above high bridge

	.align 2

gMapObjectSubspriteTable_SubmarineShadow_0: ; 83716A4
	subsprite -48, -20, 2,  0, 32x8
	subsprite -16, -20, 2,  4, 32x8
	subsprite  16, -20, 2,  8, 16x8
	subsprite  32, -20, 2, 10,  8x8
	subsprite -48, -12, 2, 11, 32x8
	subsprite -16, -12, 2, 15, 32x8
	subsprite  16, -12, 2, 19, 16x8
	subsprite  32, -12, 2, 21,  8x8
	subsprite -48,  -4, 2, 22, 32x8
	subsprite -16,  -4, 2, 26, 32x8
	subsprite  16,  -4, 2, 30, 16x8
	subsprite  32,  -4, 2, 32,  8x8
	subsprite -48,   4, 2, 33, 32x8
	subsprite -16,   4, 2, 37, 32x8
	subsprite  16,   4, 2, 41, 16x8
	subsprite  32,   4, 2, 43,  8x8

	.align 2

gMapObjectSubspriteTable_SubmarineShadow_1: ; 8371724
	subsprite -48, -20, 1,  0, 32x8
	subsprite -16, -20, 1,  4, 32x8
	subsprite  16, -20, 1,  8, 16x8
	subsprite  32, -20, 1, 10,  8x8
	subsprite -48, -12, 1, 11, 32x8
	subsprite -16, -12, 1, 15, 32x8
	subsprite  16, -12, 1, 19, 16x8
	subsprite  32, -12, 1, 21,  8x8
	subsprite -48,  -4, 1, 22, 32x8
	subsprite -16,  -4, 1, 26, 32x8
	subsprite  16,  -4, 1, 30, 16x8
	subsprite  32,  -4, 1, 32,  8x8
	subsprite -48,   4, 1, 33, 32x8
	subsprite -16,   4, 1, 37, 32x8
	subsprite  16,   4, 1, 41, 16x8
	subsprite  32,   4, 1, 43,  8x8

	.align 2

gMapObjectSubspriteTable_SubmarineShadow_2: ; 83717A4
	subsprite -48, -20, 2,  0, 32x8
	subsprite -16, -20, 2,  4, 32x8
	subsprite  16, -20, 2,  8, 16x8
	subsprite  32, -20, 2, 10,  8x8
	subsprite -48, -12, 2, 11, 32x8
	subsprite -16, -12, 2, 15, 32x8
	subsprite  16, -12, 2, 19, 16x8
	subsprite  32, -12, 2, 21,  8x8
	subsprite -48,  -4, 2, 22, 32x8
	subsprite -16,  -4, 2, 26, 32x8
	subsprite  16,  -4, 2, 30, 16x8
	subsprite  32,  -4, 2, 32,  8x8
	subsprite -48,   4, 2, 33, 32x8
	subsprite -16,   4, 2, 37, 32x8
	subsprite  16,   4, 2, 41, 16x8
	subsprite  32,   4, 2, 43,  8x8

	.align 2

gMapObjectSubspriteTable_SubmarineShadow_3: ; 8371824
	subsprite -48, -20, 1,  0, 32x8
	subsprite -16, -20, 1,  4, 32x8
	subsprite  16, -20, 1,  8, 16x8
	subsprite  32, -20, 1, 10,  8x8
	subsprite -48, -12, 1, 11, 32x8
	subsprite -16, -12, 1, 15, 32x8
	subsprite  16, -12, 1, 19, 16x8
	subsprite  32, -12, 1, 21,  8x8
	subsprite -48,  -4, 2, 22, 32x8
	subsprite -16,  -4, 2, 26, 32x8
	subsprite  16,  -4, 2, 30, 16x8
	subsprite  32,  -4, 2, 32,  8x8
	subsprite -48,   4, 2, 33, 32x8
	subsprite -16,   4, 2, 37, 32x8
	subsprite  16,   4, 2, 41, 16x8
	subsprite  32,   4, 2, 43,  8x8

	.align 2

gMapObjectSubspriteTables_SubmarineShadow: ; 83718A4
	.4byte 16 ; number of subsprites
	.4byte gMapObjectSubspriteTable_SubmarineShadow_0 ; unknown

	.4byte 16 ; number of subsprites
	.4byte gMapObjectSubspriteTable_SubmarineShadow_0 ; below high bridge

	.4byte 16 ; number of subsprites
	.4byte gMapObjectSubspriteTable_SubmarineShadow_1 ; above high bridge

	.4byte 16 ; number of subsprites
	.4byte gMapObjectSubspriteTable_SubmarineShadow_2 ; unknown

	.4byte 16 ; number of subsprites
	.4byte gMapObjectSubspriteTable_SubmarineShadow_3 ; long grass below high bridge

	.4byte 16 ; number of subsprites
	.4byte gMapObjectSubspriteTable_SubmarineShadow_3 ; long grass above high bridge
