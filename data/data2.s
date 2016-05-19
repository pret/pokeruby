@ the second big chunk of data

	.include "asm/macros.s"
	.include "constants/constants.s"

	.section .rodata

@ Unreferenced error message.
@ It means "The DMA transfer request table has exceeded its limit."
	.string "DMA OVER\n"
	.string "DMAてんそう\n"
	.string "リクエストテーブルが\n"
	.string "オーバーしました$"

@ 81E2881
	.incbin "baserom.gba", 0x1E2881, 0x18

	.global gUnknown_081E2899
gUnknown_081E2899: @ 81E2899
	.incbin "baserom.gba", 0x001e2899, 0x1b

	.global gUnknown_081E28B4
gUnknown_081E28B4: @ 81E28B4
	.incbin "baserom.gba", 0x001e28b4, 0x44

@ off-screen and low priority relative to background
	.align 2
	.global gDummyBaseOam
gDummyBaseOam: @ 81E28F8
	.2byte 160 @ Y
	.2byte 304 @ X
	.2byte 3 << 10 @ priority

	.align 2
gDummyObjectImageAnim: @ 81E2900
	obj_image_anim_end

	.align 2
	.global gDummyObjectImageAnimTable
gDummyObjectImageAnimTable: @ 81E2904
	.4byte gDummyObjectImageAnim

	.align 2
gDummyObjectRotScalAnim: @ 81E2908
	obj_rot_scal_anim_end

	.align 2
	.global gDummyObjectRotScalAnimTable
gDummyObjectRotScalAnimTable: @ 81E2910
	.4byte gDummyObjectRotScalAnim

	.global gUnknown_081E2914
gUnknown_081E2914: @ 81E2914
	.incbin "baserom.gba", 0x001e2914, 0x18

	.global gUnknown_081E292C
gUnknown_081E292C: @ 81E292C
	.incbin "baserom.gba", 0x001e292c, 0x14

	.global gUnknown_081E2940
gUnknown_081E2940: @ 81E2940
	.incbin "baserom.gba", 0x001e2940, 0x8

	.global gUnknown_081E2948
gUnknown_081E2948: @ 81E2948
	.incbin "baserom.gba", 0x001e2948, 0x8

	.global gUnknown_081E2950
gUnknown_081E2950: @ 81E2950
	.incbin "baserom.gba", 0x001e2950, 0x10

	.global gUnknown_081E2960
gUnknown_081E2960: @ 81E2960
	.incbin "baserom.gba", 0x001e2960, 0x10

	.global gUnknown_081E2970
gUnknown_081E2970: @ 81E2970
	.incbin "baserom.gba", 0x001e2970, 0x38

	.global gUnknown_081E29A8
gUnknown_081E29A8: @ 81E29A8
	.incbin "baserom.gba", 0x001e29a8, 0x10

	.global gUnknown_081E29B8
gUnknown_081E29B8: @ 81E29B8
	.incbin "baserom.gba", 0x001e29b8, 0x10

	.global gUnknown_081E29C8
gUnknown_081E29C8: @ 81E29C8
	.incbin "baserom.gba", 0x001e29c8, 0x10

	.global gUnknown_081E29D8
gUnknown_081E29D8: @ 81E29D8
	.incbin "baserom.gba", 0x001e29d8, 0x8

	.global gUnknown_081E29E0
gUnknown_081E29E0: @ 81E29E0
	.incbin "baserom.gba", 0x001e29e0, 0x8

	.global gUnknown_081E29E8
gUnknown_081E29E8: @ 81E29E8
	.incbin "baserom.gba", 0x001e29e8, 0x1008

	.global gUnknown_081E39F0
gUnknown_081E39F0: @ 81E39F0
	.incbin "baserom.gba", 0x001e39f0, 0x370

	.global gUnknown_081E3D60
gUnknown_081E3D60: @ 81E3D60
	.incbin "baserom.gba", 0x001e3d60, 0x1b90

	.global gUnknown_081E58F0
gUnknown_081E58F0: @ 81E58F0
	.incbin "baserom.gba", 0x001e58f0, 0x600

	.global gUnknown_081E5EF0
gUnknown_081E5EF0: @ 81E5EF0
	.incbin "baserom.gba", 0x001e5ef0, 0x100

	.global gUnknown_081E5FF0
gUnknown_081E5FF0: @ 81E5FF0
	.incbin "baserom.gba", 0x001e5ff0, 0x1ee

	.global gUnknown_081E61DE
gUnknown_081E61DE: @ 81E61DE
	.incbin "baserom.gba", 0x001e61de, 0x100

	.global gUnknown_081E62DE
gUnknown_081E62DE: @ 81E62DE
	.incbin "baserom.gba", 0x001e62de, 0xdc

	.global gUnknown_081E63BA
gUnknown_081E63BA: @ 81E63BA
	.incbin "baserom.gba", 0x001e63ba, 0xdc

	.global gUnknown_081E6496
gUnknown_081E6496: @ 81E6496
	.incbin "baserom.gba", 0x001e6496, 0xfe

	.global gUnknown_081E6594
gUnknown_081E6594: @ 81E6594
	.incbin "baserom.gba", 0x001e6594, 0xfe

	.global gUnknown_081E6692
gUnknown_081E6692: @ 81E6692
	.incbin "baserom.gba", 0x001e6692, 0x2

	.global gUnknown_081E6694
gUnknown_081E6694: @ 81E6694
	.incbin "baserom.gba", 0x001e6694, 0x1a

	.global gUnknown_081E66AE
gUnknown_081E66AE: @ 81E66AE
	.incbin "baserom.gba", 0x001e66ae, 0x4

	.global gUnknown_081E66B2
gUnknown_081E66B2: @ 81E66B2
	.incbin "baserom.gba", 0x001e66b2, 0x20

	.global gUnknown_081E66D2
gUnknown_081E66D2: @ 81E66D2
	.incbin "baserom.gba", 0x001e66d2, 0xa

	.global gUnknown_081E66DC
gUnknown_081E66DC: @ 81E66DC
	.incbin "baserom.gba", 0x001e66dc, 0x300

	.global gUnknown_081E69DC
gUnknown_081E69DC: @ 81E69DC
	.incbin "baserom.gba", 0x001e69dc, 0x60

	.global gUnknown_081E6A3C
gUnknown_081E6A3C: @ 81E6A3C
	.incbin "baserom.gba", 0x001e6a3c, 0x40

	.global gUnknown_081E6A7C
gUnknown_081E6A7C: @ 81E6A7C
	.incbin "baserom.gba", 0x001e6a7c, 0xc

	.global gUnknown_081E6A88
gUnknown_081E6A88: @ 81E6A88
	.incbin "baserom.gba", 0x001e6a88, 0x1c

	.global gUnknown_081E6AA4
gUnknown_081E6AA4: @ 81E6AA4
	.incbin "baserom.gba", 0x001e6aa4, 0x30

	.global gUnknown_081E6AD4
gUnknown_081E6AD4: @ 81E6AD4
	.incbin "baserom.gba", 0x001e6ad4, 0x5c

	.global gUnknown_081E6B30
gUnknown_081E6B30: @ 81E6B30
	.incbin "baserom.gba", 0x001e6b30, 0xa8

	.global gUnknown_081E6BD8
gUnknown_081E6BD8: @ 81E6BD8
	.incbin "baserom.gba", 0x001e6bd8, 0x3

	.global gUnknown_081E6BDB
gUnknown_081E6BDB: @ 81E6BDB
	.incbin "baserom.gba", 0x001e6bdb, 0x19

	.global gUnknown_081E6BF4
gUnknown_081E6BF4: @ 81E6BF4
	.incbin "baserom.gba", 0x001e6bf4, 0x24

	.global gUnknown_081E6C18
gUnknown_081E6C18: @ 81E6C18
	.incbin "baserom.gba", 0x001e6c18, 0x24

	.global gUnknown_081E6C3C
gUnknown_081E6C3C: @ 81E6C3C
	.incbin "baserom.gba", 0x001e6c3c, 0x1c

	.global gUnknown_081E6C58
gUnknown_081E6C58: @ 81E6C58
	.incbin "baserom.gba", 0x001e6c58, 0x1c

	.global gUnknown_081E6C74
gUnknown_081E6C74: @ 81E6C74
	.incbin "baserom.gba", 0x001e6c74, 0x1c

	.global gUnknown_081E6C90
gUnknown_081E6C90: @ 81E6C90
	.incbin "baserom.gba", 0x001e6c90, 0x1c

	.global gUnknown_081E6CAC
gUnknown_081E6CAC: @ 81E6CAC
	.incbin "baserom.gba", 0x001e6cac, 0x1c

	.global gUnknown_081E6CC8
gUnknown_081E6CC8: @ 81E6CC8
	.incbin "baserom.gba", 0x001e6cc8, 0x1c

	.global gUnknown_081E6CE4
gUnknown_081E6CE4: @ 81E6CE4
	.incbin "baserom.gba", 0x001e6ce4, 0x1c

	.global gUnknown_081E6D00
gUnknown_081E6D00: @ 81E6D00
	.incbin "baserom.gba", 0x001e6d00, 0x38

	.global gUnknown_081E6D38
gUnknown_081E6D38: @ 81E6D38
	.incbin "baserom.gba", 0x001e6d38, 0x1c

	.global gUnknown_081E6D54
gUnknown_081E6D54: @ 81E6D54
	.incbin "baserom.gba", 0x001e6d54, 0x1c

	.global gUnknown_081E6D70
gUnknown_081E6D70: @ 81E6D70
	.incbin "baserom.gba", 0x001e6d70, 0x1c

	.global gUnknown_081E6D8C
gUnknown_081E6D8C: @ 81E6D8C
	.incbin "baserom.gba", 0x001e6d8c, 0x1c

	.global gUnknown_081E6DA8
gUnknown_081E6DA8: @ 81E6DA8
	.incbin "baserom.gba", 0x001e6da8, 0x1c

	.global gUnknown_081E6DC4
gUnknown_081E6DC4: @ 81E6DC4
	.incbin "baserom.gba", 0x001e6dc4, 0x1c

	.global gUnknown_081E6DE0
gUnknown_081E6DE0: @ 81E6DE0
	.incbin "baserom.gba", 0x001e6de0, 0x1c

	.global gUnknown_081E6DFC
gUnknown_081E6DFC: @ 81E6DFC
	.incbin "baserom.gba", 0x001e6dfc, 0x1c

	.global gUnknown_081E6E18
gUnknown_081E6E18: @ 81E6E18
	.incbin "baserom.gba", 0x001e6e18, 0x1c

	.global gUnknown_081E6E34
gUnknown_081E6E34: @ 81E6E34
	.incbin "baserom.gba", 0x001e6e34, 0x1c

	.global gUnknown_081E6E50
gUnknown_081E6E50: @ 81E6E50
	.incbin "baserom.gba", 0x001e6e50, 0x1c

	.global gUnknown_081E6E6C
gUnknown_081E6E6C: @ 81E6E6C
	.incbin "baserom.gba", 0x001e6e6c, 0x1c

	.global gUnknown_081E6E88
gUnknown_081E6E88: @ 81E6E88
	.incbin "baserom.gba", 0x001e6e88, 0xc4

	.global gUnknown_081E6F4C
gUnknown_081E6F4C: @ 81E6F4C
	.incbin "baserom.gba", 0x001e6f4c, 0x1c

	.global gUnknown_081E6F68
gUnknown_081E6F68: @ 81E6F68
	.incbin "baserom.gba", 0x001e6f68, 0x1c

	.global gUnknown_081E6F84
gUnknown_081E6F84: @ 81E6F84
	.incbin "baserom.gba", 0x001e6f84, 0x1c

	.global gUnknown_081E6FA0
gUnknown_081E6FA0: @ 81E6FA0
	.incbin "baserom.gba", 0x001e6fa0, 0x38

	.global gUnknown_081E6FD8
gUnknown_081E6FD8: @ 81E6FD8
	.incbin "baserom.gba", 0x001e6fd8, 0x1c

	.global gUnknown_081E6FF4
gUnknown_081E6FF4: @ 81E6FF4
	.incbin "baserom.gba", 0x001e6ff4, 0x38

	.global gUnknown_081E702C
gUnknown_081E702C: @ 81E702C
	.incbin "baserom.gba", 0x001e702c, 0x1c

	.global gUnknown_081E7048
gUnknown_081E7048: @ 81E7048
	.incbin "baserom.gba", 0x001e7048, 0x1c

	.global gUnknown_081E7064
gUnknown_081E7064: @ 81E7064
	.incbin "baserom.gba", 0x001e7064, 0x1c

	.global gUnknown_081E7080
gUnknown_081E7080: @ 81E7080
	.incbin "baserom.gba", 0x001e7080, 0x1c

	.global gUnknown_081E709C
gUnknown_081E709C: @ 81E709C
	.incbin "baserom.gba", 0x001e709c, 0x1c

	.global gUnknown_081E70B8
gUnknown_081E70B8: @ 81E70B8
	.incbin "baserom.gba", 0x001e70b8, 0x1c

	.global gUnknown_081E70D4
gUnknown_081E70D4: @ 81E70D4
	.incbin "baserom.gba", 0x001e70d4, 0x1c

	.global gUnknown_081E70F0
gUnknown_081E70F0: @ 81E70F0
	.incbin "baserom.gba", 0x001e70f0, 0x1c

	.global gUnknown_081E710C
gUnknown_081E710C: @ 81E710C
	.incbin "baserom.gba", 0x001e710c, 0x1c

	.global gUnknown_081E7128
gUnknown_081E7128: @ 81E7128
	.incbin "baserom.gba", 0x001e7128, 0x1c

	.global gUnknown_081E7144
gUnknown_081E7144: @ 81E7144
	.incbin "baserom.gba", 0x001e7144, 0x1c

	.global gUnknown_081E7160
gUnknown_081E7160: @ 81E7160
	.incbin "baserom.gba", 0x001e7160, 0x1c

	.global gUnknown_081E717C
gUnknown_081E717C: @ 81E717C
	.incbin "baserom.gba", 0x001e717c, 0x1c

	.global gUnknown_081E7198
gUnknown_081E7198: @ 81E7198
	.incbin "baserom.gba", 0x001e7198, 0x1c

	.global gUnknown_081E71B4
gUnknown_081E71B4: @ 81E71B4
	.incbin "baserom.gba", 0x001e71b4, 0x1c

	.global gUnknown_081E71D0
gUnknown_081E71D0: @ 81E71D0
	.incbin "baserom.gba", 0x001e71d0, 0x1c

	.global gUnknown_081E71EC
gUnknown_081E71EC: @ 81E71EC
	.incbin "baserom.gba", 0x001e71ec, 0x1c

	.global gUnknown_081E7208
gUnknown_081E7208: @ 81E7208
	.incbin "baserom.gba", 0x001e7208, 0x1c

	.global gUnknown_081E7224
gUnknown_081E7224: @ 81E7224
	.incbin "baserom.gba", 0x001e7224, 0x1c

	.global gUnknown_081E7240
gUnknown_081E7240: @ 81E7240
	.incbin "baserom.gba", 0x001e7240, 0x1c

	.global gUnknown_081E725C
gUnknown_081E725C: @ 81E725C
	.incbin "baserom.gba", 0x001e725c, 0x1c

	.global gUnknown_081E7278
gUnknown_081E7278: @ 81E7278
	.incbin "baserom.gba", 0x001e7278, 0x1c

	.global gUnknown_081E7294
gUnknown_081E7294: @ 81E7294
	.incbin "baserom.gba", 0x001e7294, 0x1c

	.global gUnknown_081E72B0
gUnknown_081E72B0: @ 81E72B0
	.incbin "baserom.gba", 0x001e72b0, 0x3

@ 81E72B3
	.include "data/string_util.s"

	.global gUnknown_081E7330
gUnknown_081E7330: @ 81E7330
	.incbin "baserom.gba", 0x001e7330, 0x20

	.global gUnknown_081E7350
gUnknown_081E7350: @ 81E7350
	.incbin "baserom.gba", 0x001e7350, 0x27c

	.global gUnknown_081E75CC
gUnknown_081E75CC: @ 81E75CC
	.incbin "baserom.gba", 0x001e75cc, 0x30

	.global gUnknown_081E75FC
gUnknown_081E75FC: @ 81E75FC
	.incbin "baserom.gba", 0x001e75fc, 0x14

@ 81E7610
	.include "data/rtc.s"

	.global gUnknown_081E764C
gUnknown_081E764C: @ 81E764C
	.incbin "baserom.gba", 0x001e764c, 0x40

	.global gUnknown_081E768C
gUnknown_081E768C: @ 81E768C
	.incbin "baserom.gba", 0x001e768c, 0x1a8

	.global gUnknown_081E7834
gUnknown_081E7834: @ 81E7834
	.incbin "baserom.gba", 0x001e7834, 0x128

	.global gUnknown_081E795C
gUnknown_081E795C: @ 81E795C
	.incbin "baserom.gba", 0x001e795c, 0x10

	.global gUnknown_081E796C
gUnknown_081E796C: @ 81E796C
	.incbin "baserom.gba", 0x001e796c, 0x10

	.global gUnknown_081E797C
gUnknown_081E797C: @ 81E797C
	.incbin "baserom.gba", 0x001e797c, 0x30

	.global gUnknown_081E79AC
gUnknown_081E79AC: @ 81E79AC
	.incbin "baserom.gba", 0x001e79ac, 0x4

	.global gUnknown_081E79B0
gUnknown_081E79B0: @ 81E79B0
	.incbin "baserom.gba", 0x001e79b0, 0x10

	.global gUnknown_081E79C0
gUnknown_081E79C0: @ 81E79C0
	.incbin "baserom.gba", 0x001e79c0, 0x28

	.global gUnknown_081E79E8
gUnknown_081E79E8: @ 81E79E8
	.incbin "baserom.gba", 0x001e79e8, 0x204

	.global gUnknown_081E7BEC
gUnknown_081E7BEC: @ 81E7BEC
	.incbin "baserom.gba", 0x001e7bec, 0x2c

	.global gUnknown_081E7C18
gUnknown_081E7C18: @ 81E7C18
	.incbin "baserom.gba", 0x001e7c18, 0x4c

	.global gUnknown_081E7C64
gUnknown_081E7C64: @ 81E7C64
	.incbin "baserom.gba", 0x001e7c64, 0x10

	.global gUnknown_081E7C74
gUnknown_081E7C74: @ 81E7C74
	.incbin "baserom.gba", 0x001e7c74, 0x6e0

@ 81E8354
	.include "data/graphics/pokemon/front_pic_table.s"

	.global gUnknown_081E9114
gUnknown_081E9114: @ 81E9114
	.incbin "baserom.gba", 0x001e9114, 0x6e0

@ 81E97F4
	.include "data/graphics/pokemon/back_pic_table.s"

@ 81EA5B4
	.include "data/graphics/pokemon/palette_table.s"

@ 81EB374
	.include "data/graphics/pokemon/shiny_palette_table.s"

@ 81EC134
	.incbin "baserom.gba", 0x001EC134, 0x170

	.global gUnknown_081EC2A4
gUnknown_081EC2A4: @ 81EC2A4
	.incbin "baserom.gba", 0x001ec2a4, 0x14c

	.global gUnknown_081EC3F0
gUnknown_081EC3F0: @ 81EC3F0
	.incbin "baserom.gba", 0x001ec3f0, 0x14c

@ 81EC53C
	.include "data/graphics/trainers/front_pic_table.s"

@ 81EC7D4
	.include "data/graphics/trainers/front_pic_palette_table.s"

@ 81ECA6C
	.incbin "baserom.gba", 0x1ECA6C, 0x60

	.global gUnknown_081ECACC
gUnknown_081ECACC: @ 81ECACC
	.incbin "baserom.gba", 0x001ecacc, 0xc

	.global gUnknown_081ECAD8
gUnknown_081ECAD8: @ 81ECAD8
	.incbin "baserom.gba", 0x001ecad8, 0xc

@ 81ECAE4
	.include "data/graphics/trainers/back_pic_table.s"

@ 81ECAFC
	.include "data/graphics/trainers/back_pic_palette_table.s"

	.global gUnknown_081ECB14
gUnknown_081ECB14: @ 81ECB14
	.incbin "baserom.gba", 0x001ecb14, 0x19C

@ 81ECCB0
	.include "data/trainer_parties.s"

@ 81F0208
	.include "data/text/trainer_class_names.s"

@ 81F04FC
	.include "data/trainers.s"

@ 81F716C
	.include "data/text/species_names.s"

@ 81F8320
	.include "data/text/move_names.s"

@ 81F9527
	.incbin "baserom.gba", 0x001F9527, 0x4D

	.global gUnknown_081F9574
gUnknown_081F9574: @ 81F9574
	.incbin "baserom.gba", 0x001f9574, 0x18

	.global gUnknown_081F958C
gUnknown_081F958C: @ 81F958C
	.incbin "baserom.gba", 0x001f958c, 0x18

	.global gUnknown_081F95A4
gUnknown_081F95A4: @ 81F95A4
	.incbin "baserom.gba", 0x001f95a4, 0x8

	.global gUnknown_081F95AC
gUnknown_081F95AC: @ 81F95AC
	.incbin "baserom.gba", 0x001f95ac, 0xc8

	.global gUnknown_081F9674
gUnknown_081F9674: @ 81F9674
	.incbin "baserom.gba", 0x001f9674, 0xc

	.global gUnknown_081F9680
gUnknown_081F9680: @ 81F9680
	.incbin "baserom.gba", 0x001f9680, 0x8

	.global gUnknown_081F9688
gUnknown_081F9688: @ 81F9688
	.incbin "baserom.gba", 0x001f9688, 0x40

	.global gUnknown_081F96C8
gUnknown_081F96C8: @ 81F96C8
	.incbin "baserom.gba", 0x001f96c8, 0x8

	.global gUnknown_081F96D0
gUnknown_081F96D0: @ 81F96D0
	.incbin "baserom.gba", 0x001f96d0, 0x50

	.global gUnknown_081F9720
gUnknown_081F9720: @ 81F9720
	.incbin "baserom.gba", 0x001f9720, 0x150

@ 81F9870
	.include "data/text/type_names.s"

	.align 2
	.global gUnknown_081F98F0
gUnknown_081F98F0: @ 81F98F0
	.incbin "baserom.gba", 0x001f98f0, 0xdc

@ 81F99CC
	.include "data/text/ability_descriptions.s"

@ 81FA248
	.include "data/text/ability_names.s"

	.align 2
	.global gUnknown_081FA640
gUnknown_081FA640: @ 81FA640
	.incbin "baserom.gba", 0x001fa640, 0x38

	.global gUnknown_081FA678
gUnknown_081FA678: @ 81FA678
	.incbin "baserom.gba", 0x001fa678, 0x24

	.global gUnknown_081FA69C
gUnknown_081FA69C: @ 81FA69C
	.incbin "baserom.gba", 0x001fa69c, 0x8

	.global gUnknown_081FA6A4
gUnknown_081FA6A4: @ 81FA6A4
	.incbin "baserom.gba", 0x001fa6a4, 0x8

	.global gUnknown_081FA6AC
gUnknown_081FA6AC: @ 81FA6AC
	.incbin "baserom.gba", 0x001fa6ac, 0x8

	.global gUnknown_081FA6B4
gUnknown_081FA6B4: @ 81FA6B4
	.incbin "baserom.gba", 0x001fa6b4, 0x8

	.global gUnknown_081FA6BC
gUnknown_081FA6BC: @ 81FA6BC
	.incbin "baserom.gba", 0x001fa6bc, 0x8

	.global gUnknown_081FA6C4
gUnknown_081FA6C4: @ 81FA6C4
	.incbin "baserom.gba", 0x001fa6c4, 0x8

	.global gUnknown_081FA6CC
gUnknown_081FA6CC: @ 81FA6CC
	.incbin "baserom.gba", 0x001fa6cc, 0x8

	.global gUnknown_081FA6D4
gUnknown_081FA6D4: @ 81FA6D4
	.incbin "baserom.gba", 0x001fa6d4, 0x38

	.global gUnknown_081FA70C
gUnknown_081FA70C: @ 81FA70C
	.incbin "baserom.gba", 0x001fa70c, 0xf

	.global gUnknown_081FA71B
gUnknown_081FA71B: @ 81FA71B
	.incbin "baserom.gba", 0x001fa71b, 0x4

	.global gUnknown_081FA71F
gUnknown_081FA71F: @ 81FA71F
	.incbin "baserom.gba", 0x001fa71f, 0x5

	.global gUnknown_081FA724
gUnknown_081FA724: @ 81FA724
	.incbin "baserom.gba", 0x001fa724, 0x18

	.global gUnknown_081FA73C
gUnknown_081FA73C: @ 81FA73C
	.incbin "baserom.gba", 0x001fa73c, 0x3e0

	.global gUnknown_081FAB1C
gUnknown_081FAB1C: @ 81FAB1C
	.incbin "baserom.gba", 0x001fab1c, 0x34

	.global gUnknown_081FAB50
gUnknown_081FAB50: @ 81FAB50
	.incbin "baserom.gba", 0x001fab50, 0xc

	.global gUnknown_081FAB5C
gUnknown_081FAB5C: @ 81FAB5C
	.incbin "baserom.gba", 0x001fab5c, 0xf0

	.global gUnknown_081FAC4C
gUnknown_081FAC4C: @ 81FAC4C
	.incbin "baserom.gba", 0x001fac4c, 0xa3

	.global gUnknown_081FACEF
gUnknown_081FACEF: @ 81FACEF
	.incbin "baserom.gba", 0x001facef, 0x7

	.global gUnknown_081FACF6
gUnknown_081FACF6: @ 81FACF6
	.incbin "baserom.gba", 0x001facf6, 0x8

	.global gUnknown_081FACFE
gUnknown_081FACFE: @ 81FACFE
	.incbin "baserom.gba", 0x001facfe, 0x28

	.global gUnknown_081FAD26
gUnknown_081FAD26: @ 81FAD26
	.incbin "baserom.gba", 0x001fad26, 0xc

	.global gUnknown_081FAD32
gUnknown_081FAD32: @ 81FAD32
	.incbin "baserom.gba", 0x001fad32, 0x14

	.global gUnknown_081FAD46
gUnknown_081FAD46: @ 81FAD46
	.incbin "baserom.gba", 0x001fad46, 0x18

	.global gUnknown_081FAD5E
gUnknown_081FAD5E: @ 81FAD5E
	.incbin "baserom.gba", 0x001fad5e, 0x28

	.global gUnknown_081FAD86
gUnknown_081FAD86: @ 81FAD86
	.incbin "baserom.gba", 0x001fad86, 0xa

	.global gUnknown_081FAD90
gUnknown_081FAD90: @ 81FAD90
	.incbin "baserom.gba", 0x001fad90, 0x8

	.global gUnknown_081FAD98
gUnknown_081FAD98: @ 81FAD98
	.incbin "baserom.gba", 0x001fad98, 0xe4

	.global gUnknown_081FAE7C
gUnknown_081FAE7C: @ 81FAE7C
	.incbin "baserom.gba", 0x001fae7c, 0x4

	.global gUnknown_081FAE80
gUnknown_081FAE80: @ 81FAE80
	.incbin "baserom.gba", 0x001fae80, 0x9

	.global gUnknown_081FAE89
gUnknown_081FAE89: @ 81FAE89
	.incbin "baserom.gba", 0x001fae89, 0x8

	.global gUnknown_081FAE91
gUnknown_081FAE91: @ 81FAE91
	.incbin "baserom.gba", 0x001fae91, 0x13

	.global gUnknown_081FAEA4
gUnknown_081FAEA4: @ 81FAEA4
	.incbin "baserom.gba", 0x001faea4, 0x8

	.global gUnknown_081FAEAC
gUnknown_081FAEAC: @ 81FAEAC
	.incbin "baserom.gba", 0x001faeac, 0x60

	.global gUnknown_081FAF0C
gUnknown_081FAF0C: @ 81FAF0C
	.incbin "baserom.gba", 0x001faf0c, 0x18

	.global gUnknown_081FAF24
gUnknown_081FAF24: @ 81FAF24
	.incbin "baserom.gba", 0x001faf24, 0x10

	.global gUnknown_081FAF34
gUnknown_081FAF34: @ 81FAF34
	.incbin "baserom.gba", 0x001faf34, 0x18

	.global gUnknown_081FAF4C
gUnknown_081FAF4C: @ 81FAF4C
	.incbin "baserom.gba", 0x001faf4c, 0x10

	.global gUnknown_081FAF5C
gUnknown_081FAF5C: @ 81FAF5C
	.incbin "baserom.gba", 0x001faf5c, 0xec

	.global gUnknown_081FB048
gUnknown_081FB048: @ 81FB048
	.incbin "baserom.gba", 0x001fb048, 0xe4

@ 81FB12C
	.include "data/battle_moves.s"

	.global gUnknown_081FC1D0
gUnknown_081FC1D0: @ 81FC1D0
	.incbin "baserom.gba", 0x001fc1d0, 0x10

@ 81FC1E0
	.include "data/pokedex_order.s"

@ 81FCB84
	.include "data/spinda_spot_graphics.s"

@ 81FCC14
	.include "data/item_effects.s"

@ 81FD070
	.include "data/nature_stat_table.s"

@ 81FD0F0
	.include "data/tm_hm_learnsets.s"

@ 81FDDD0
	.include "data/trainer_class_index_tables.s"

@ 81FDE6A
	.include "data/cry_id_table.s"

@ 81FDF78
	.include "data/experience_tables/tables.s"

@ 81FEC18
	.include "data/base_stats.s"

@ 8201928
	.include "data/level_up_learnsets.s"

@ 8203B68
	.include "data/evolution_table.s"

@ 8207BC8
	.include "data/level_up_learnset_pointers.s"

	.global gUnknown_08208238
gUnknown_08208238: @ 8208238
	.incbin "baserom.gba", 0x00208238, 0x4

	.global gUnknown_0820823C
gUnknown_0820823C: @ 820823C
	.incbin "baserom.gba", 0x0020823c, 0x4

	.global gUnknown_08208240
gUnknown_08208240: @ 8208240
	.incbin "baserom.gba", 0x00208240, 0x4

	.global gUnknown_08208244
gUnknown_08208244: @ 8208244
	.incbin "baserom.gba", 0x00208244, 0x1f

	.global gUnknown_08208263
gUnknown_08208263: @ 8208263
	.incbin "baserom.gba", 0x00208263, 0x25

	.global gUnknown_08208288
gUnknown_08208288: @ 8208288
	.incbin "baserom.gba", 0x00208288, 0x60

	.global gUnknown_082082E8
gUnknown_082082E8: @ 82082E8
	.incbin "baserom.gba", 0x002082e8, 0xa

	.global gUnknown_082082F2
gUnknown_082082F2: @ 82082F2
	.incbin "baserom.gba", 0x002082f2, 0x6

	.global gUnknown_082082F8
gUnknown_082082F8: @ 82082F8
	.incbin "baserom.gba", 0x002082f8, 0x6

	.global gUnknown_082082FE
gUnknown_082082FE: @ 82082FE
	.incbin "baserom.gba", 0x002082fe, 0x1c

	.global gUnknown_0820831A
gUnknown_0820831A: @ 820831A
	.incbin "baserom.gba", 0x0020831a, 0x1d

	.global gUnknown_08208337
gUnknown_08208337: @ 8208337
	.incbin "baserom.gba", 0x00208337, 0xd

	.global gUnknown_08208344
gUnknown_08208344: @ 8208344
	.incbin "baserom.gba", 0x00208344, 0x280

	.global gUnknown_082085C4
gUnknown_082085C4: @ 82085C4
	.incbin "baserom.gba", 0x002085c4, 0x168

	.global gUnknown_0820872C
gUnknown_0820872C: @ 820872C
	.incbin "baserom.gba", 0x0020872c, 0x80

	.global gUnknown_082087AC
gUnknown_082087AC: @ 82087AC
	.incbin "baserom.gba", 0x002087ac, 0x18

	.global gUnknown_082087C4
gUnknown_082087C4: @ 82087C4
	.incbin "baserom.gba", 0x002087c4, 0x18

	.global gUnknown_082087DC
gUnknown_082087DC: @ 82087DC
	.incbin "baserom.gba", 0x002087dc, 0xa00

@ 82091DC
	.include "data/egg_moves.s"

	.align 2
	.global gUnknown_08209AC4
gUnknown_08209AC4: @ 8209AC4
	.incbin "baserom.gba", 0x00209ac4, 0x10

	.global gUnknown_08209AD4
gUnknown_08209AD4: @ 8209AD4
	.incbin "baserom.gba", 0x00209ad4, 0x8dc

	.global gUnknown_0820A3B0
gUnknown_0820A3B0: @ 820A3B0
	.incbin "baserom.gba", 0x0020a3b0, 0x8

	.global gUnknown_0820A3B8
gUnknown_0820A3B8: @ 820A3B8
	.incbin "baserom.gba", 0x0020a3b8, 0x8

	.global gUnknown_0820A3C0
gUnknown_0820A3C0: @ 820A3C0
	.incbin "baserom.gba", 0x0020a3c0, 0x8

	.global gUnknown_0820A3C8
gUnknown_0820A3C8: @ 820A3C8
	.incbin "baserom.gba", 0x0020a3c8, 0x50

	.global gUnknown_0820A418
gUnknown_0820A418: @ 820A418
	.incbin "baserom.gba", 0x0020a418, 0x18

	.global gUnknown_0820A430
gUnknown_0820A430: @ 820A430
	.incbin "baserom.gba", 0x0020a430, 0x4c

	.global gUnknown_0820A47C
gUnknown_0820A47C: @ 820A47C
	.incbin "baserom.gba", 0x0020a47c, 0x8

	.global gUnknown_0820A484
gUnknown_0820A484: @ 820A484
	.incbin "baserom.gba", 0x0020a484, 0x8

	.global gUnknown_0820A48C
gUnknown_0820A48C: @ 820A48C
	.incbin "baserom.gba", 0x0020a48c, 0x8

	.global gUnknown_0820A494
gUnknown_0820A494: @ 820A494
	.incbin "baserom.gba", 0x0020a494, 0x8

	.global gUnknown_0820A49C
gUnknown_0820A49C: @ 820A49C
	.incbin "baserom.gba", 0x0020a49c, 0x8

	.global gUnknown_0820A4A4
gUnknown_0820A4A4: @ 820A4A4
	.incbin "baserom.gba", 0x0020a4a4, 0x8

	.global gUnknown_0820A4AC
gUnknown_0820A4AC: @ 820A4AC
	.incbin "baserom.gba", 0x0020a4ac, 0x8

	.global gUnknown_0820A4B4
gUnknown_0820A4B4: @ 820A4B4
	.incbin "baserom.gba", 0x0020a4b4, 0x20

	.global gUnknown_0820A4D4
gUnknown_0820A4D4: @ 820A4D4
	.incbin "baserom.gba", 0x0020a4d4, 0x18

	.global gUnknown_0820A4EC
gUnknown_0820A4EC: @ 820A4EC
	.incbin "baserom.gba", 0x0020a4ec, 0x30

	.global gUnknown_0820A51C
gUnknown_0820A51C: @ 820A51C
	.incbin "baserom.gba", 0x0020a51c, 0x30

	.global gUnknown_0820A54C
gUnknown_0820A54C: @ 820A54C
	.incbin "baserom.gba", 0x0020a54c, 0x20

	.global gUnknown_0820A56C
gUnknown_0820A56C: @ 820A56C
	.incbin "baserom.gba", 0x0020a56c, 0x118

	.global gUnknown_0820A684
gUnknown_0820A684: @ 820A684
	.incbin "baserom.gba", 0x0020a684, 0x60

	.global gUnknown_0820A6E4
gUnknown_0820A6E4: @ 820A6E4
	.incbin "baserom.gba", 0x0020a6e4, 0x8

	.global gUnknown_0820A6EC
gUnknown_0820A6EC: @ 820A6EC
	.incbin "baserom.gba", 0x0020a6ec, 0x68

	.global gUnknown_0820A754
gUnknown_0820A754: @ 820A754
	.incbin "baserom.gba", 0x0020a754, 0x10

	.global gUnknown_0820A764
gUnknown_0820A764: @ 820A764
	.incbin "baserom.gba", 0x0020a764, 0x10

	.global gUnknown_0820A774
gUnknown_0820A774: @ 820A774
	.incbin "baserom.gba", 0x0020a774, 0x10

	.global gUnknown_0820A784
gUnknown_0820A784: @ 820A784
	.incbin "baserom.gba", 0x0020a784, 0x20

	.global gUnknown_0820A7A4
gUnknown_0820A7A4: @ 820A7A4
	.incbin "baserom.gba", 0x0020a7a4, 0x30

	.global gUnknown_0820A7D4
gUnknown_0820A7D4: @ 820A7D4
	.incbin "baserom.gba", 0x0020a7d4, 0x30

	.global gUnknown_0820A804
gUnknown_0820A804: @ 820A804
	.incbin "baserom.gba", 0x0020a804, 0x8

	.global gUnknown_0820A80C
gUnknown_0820A80C: @ 820A80C
	.incbin "baserom.gba", 0x0020a80c, 0x8

	.global gUnknown_0820A814
gUnknown_0820A814: @ 820A814
	.incbin "baserom.gba", 0x0020a814, 0x8

	.global gUnknown_0820A81C
gUnknown_0820A81C: @ 820A81C
	.incbin "baserom.gba", 0x0020a81c, 0x20

	.global gUnknown_0820A83C
gUnknown_0820A83C: @ 820A83C
	.incbin "baserom.gba", 0x0020a83c, 0xc

	.global gUnknown_0820A848
gUnknown_0820A848: @ 820A848
	.incbin "baserom.gba", 0x0020a848, 0xc

	.global gUnknown_0820A854
gUnknown_0820A854: @ 820A854
	.incbin "baserom.gba", 0x0020a854, 0x8

	.global gUnknown_0820A85C
gUnknown_0820A85C: @ 820A85C
	.incbin "baserom.gba", 0x0020a85c, 0x8

	.global gUnknown_0820A864
gUnknown_0820A864: @ 820A864
	.incbin "baserom.gba", 0x0020a864, 0x18

	.global gUnknown_0820A87C
gUnknown_0820A87C: @ 820A87C
	.incbin "baserom.gba", 0x0020a87c, 0x18

	.global gUnknown_0820A894
gUnknown_0820A894: @ 820A894
	.incbin "baserom.gba", 0x0020a894, 0x8

	.global gUnknown_0820A89C
gUnknown_0820A89C: @ 820A89C
	.incbin "baserom.gba", 0x0020a89c, 0x14

	.global gUnknown_0820A8B0
gUnknown_0820A8B0: @ 820A8B0
	.incbin "baserom.gba", 0x0020a8b0, 0x4

	.global gUnknown_0820A8B4
gUnknown_0820A8B4: @ 820A8B4
	.incbin "baserom.gba", 0x0020a8b4, 0x28

	.global gUnknown_0820A8DC
gUnknown_0820A8DC: @ 820A8DC
	.incbin "baserom.gba", 0x0020a8dc, 0x28

	.global gUnknown_0820A904
gUnknown_0820A904: @ 820A904
	.incbin "baserom.gba", 0x0020a904, 0x28

	.global gUnknown_0820A92C
gUnknown_0820A92C: @ 820A92C
	.incbin "baserom.gba", 0x0020a92c, 0x60

	.global gUnknown_0820A98C
gUnknown_0820A98C: @ 820A98C
	.incbin "baserom.gba", 0x0020a98c, 0x128

	.global gUnknown_0820AAB4
gUnknown_0820AAB4: @ 820AAB4
	.incbin "baserom.gba", 0x0020aab4, 0x13c

	.global gUnknown_0820ABF0
gUnknown_0820ABF0: @ 820ABF0
	.incbin "baserom.gba", 0x0020abf0, 0x1fe

	.global gUnknown_0820ADEE
gUnknown_0820ADEE: @ 820ADEE
	.incbin "baserom.gba", 0x0020adee, 0x1fe

	.global gUnknown_0820AFEC
gUnknown_0820AFEC: @ 820AFEC
	.incbin "baserom.gba", 0x0020afec, 0x800

	.global gUnknown_0820B7EC
gUnknown_0820B7EC: @ 820B7EC
	.incbin "baserom.gba", 0x0020b7ec, 0x890

	.global gUnknown_0820C07C
gUnknown_0820C07C: @ 820C07C
	.incbin "baserom.gba", 0x0020c07c, 0x68

	.global gUnknown_0820C0E4
gUnknown_0820C0E4: @ 820C0E4
	.incbin "baserom.gba", 0x0020c0e4, 0x8

	.global gUnknown_0820C0EC
gUnknown_0820C0EC: @ 820C0EC
	.incbin "baserom.gba", 0x0020c0ec, 0x38

	.global gUnknown_0820C124
gUnknown_0820C124: @ 820C124
	.incbin "baserom.gba", 0x0020c124, 0x8

	.global gUnknown_0820C12C
gUnknown_0820C12C: @ 820C12C
	.incbin "baserom.gba", 0x0020c12c, 0x8

	.global gUnknown_0820C134
gUnknown_0820C134: @ 820C134
	.incbin "baserom.gba", 0x0020c134, 0x18

	.global gUnknown_0820C14C
gUnknown_0820C14C: @ 820C14C
	.incbin "baserom.gba", 0x0020c14c, 0x18

	.global gUnknown_0820C164
gUnknown_0820C164: @ 820C164
	.incbin "baserom.gba", 0x0020c164, 0x138

	.global gUnknown_0820C29C
gUnknown_0820C29C: @ 820C29C
	.incbin "baserom.gba", 0x0020c29c, 0x1a

	.global gUnknown_0820C2B6
gUnknown_0820C2B6: @ 820C2B6
	.incbin "baserom.gba", 0x0020c2b6, 0x18

	.global gUnknown_0820C2CE
gUnknown_0820C2CE: @ 820C2CE
	.incbin "baserom.gba", 0x0020c2ce, 0x18

	.global gUnknown_0820C2E6
gUnknown_0820C2E6: @ 820C2E6
	.incbin "baserom.gba", 0x0020c2e6, 0x3

	.global gUnknown_0820C2E9
gUnknown_0820C2E9: @ 820C2E9
	.incbin "baserom.gba", 0x0020c2e9, 0x7

	.global gUnknown_0820C2F0
gUnknown_0820C2F0: @ 820C2F0
	.incbin "baserom.gba", 0x0020c2f0, 0x18

	.global gUnknown_0820C308
gUnknown_0820C308: @ 820C308
	.incbin "baserom.gba", 0x0020c308, 0x18

	.global gUnknown_0820C320
gUnknown_0820C320: @ 820C320
	.incbin "baserom.gba", 0x0020c320, 0x10

	.global gUnknown_0820C330
gUnknown_0820C330: @ 820C330
	.incbin "baserom.gba", 0x0020c330, 0x4

	.global gUnknown_0820C334
gUnknown_0820C334: @ 820C334
	.incbin "baserom.gba", 0x0020c334, 0x1

	.global gUnknown_0820C335
gUnknown_0820C335: @ 820C335
	.incbin "baserom.gba", 0x0020c335, 0x7

	.global gUnknown_0820C33C
gUnknown_0820C33C:
	.string "$"

	.global gUnknown_0820C33D
gUnknown_0820C33D: @ 820C33D
	.string "♂$"

	.global gUnknown_0820C33F
gUnknown_0820C33F: @ 820C33F
	.string "♀$"

	.global gUnknown_0820C341
gUnknown_0820C341: @ 820C341
	.incbin "baserom.gba", 0x0020c341, 0x6f

	.global gUnknown_0820C3B0
gUnknown_0820C3B0: @ 820C3B0
	.incbin "baserom.gba", 0x0020c3b0, 0x21

	.global gUnknown_0820C3D1
gUnknown_0820C3D1: @ 820C3D1
	.incbin "baserom.gba", 0x0020c3d1, 0x627

	.global gUnknown_0820C9F8
gUnknown_0820C9F8: @ 820C9F8
	.incbin "baserom.gba", 0x0020c9f8, 0xa0

	.global gUnknown_0820CA98
gUnknown_0820CA98: @ 820CA98
	.incbin "baserom.gba", 0x0020ca98, 0x1300

	.global gUnknown_0820DD98
gUnknown_0820DD98: @ 820DD98
	.incbin "baserom.gba", 0x0020dd98, 0x1a00

	.global gUnknown_0820F798
gUnknown_0820F798: @ 820F798
	.incbin "baserom.gba", 0x0020f798, 0x1000

	.global gUnknown_08210798
gUnknown_08210798: @ 8210798
	.incbin "baserom.gba", 0x00210798, 0x1000

	.global gUnknown_08211798
gUnknown_08211798: @ 8211798
	.incbin "baserom.gba", 0x00211798, 0x800

	.global gUnknown_08211F98
gUnknown_08211F98: @ 8211F98
	.incbin "baserom.gba", 0x00211f98, 0x17a0

	.global gUnknown_08213738
gUnknown_08213738: @ 8213738
	.incbin "baserom.gba", 0x00213738, 0x2040

	.global gUnknown_08215778
gUnknown_08215778: @ 8215778
	.incbin "baserom.gba", 0x00215778, 0x1d4

	.global gUnknown_0821594C
gUnknown_0821594C: @ 821594C
	.incbin "baserom.gba", 0x0021594c, 0x8

	.global gUnknown_08215954
gUnknown_08215954: @ 8215954
	.incbin "baserom.gba", 0x00215954, 0x8

	.global gUnknown_0821595C
gUnknown_0821595C: @ 821595C
	.incbin "baserom.gba", 0x0021595c, 0x48

	.global gUnknown_082159A4
gUnknown_082159A4: @ 82159A4
	.incbin "baserom.gba", 0x002159a4, 0x8

	.global gUnknown_082159AC
gUnknown_082159AC: @ 82159AC
	.incbin "baserom.gba", 0x002159ac, 0x8

	.global gUnknown_082159B4
gUnknown_082159B4: @ 82159B4
	.incbin "baserom.gba", 0x002159b4, 0x8

	.global gUnknown_082159BC
gUnknown_082159BC: @ 82159BC
	.incbin "baserom.gba", 0x002159bc, 0x38

	.global gUnknown_082159F4
gUnknown_082159F4: @ 82159F4
	.incbin "baserom.gba", 0x002159f4, 0x8

	.global gUnknown_082159FC
gUnknown_082159FC: @ 82159FC
	.incbin "baserom.gba", 0x002159fc, 0x2c

	.global gUnknown_08215A28
gUnknown_08215A28: @ 8215A28
	.incbin "baserom.gba", 0x00215a28, 0x8

	.global gUnknown_08215A30
gUnknown_08215A30: @ 8215A30
	.incbin "baserom.gba", 0x00215a30, 0x48

	.global gUnknown_08215A78
gUnknown_08215A78: @ 8215A78
	.incbin "baserom.gba", 0x00215a78, 0x8

	.global gUnknown_08215A80
gUnknown_08215A80: @ 8215A80
	.incbin "baserom.gba", 0x00215a80, 0x18

	.global gUnknown_08215A98
gUnknown_08215A98: @ 8215A98
	.incbin "baserom.gba", 0x00215a98, 0x28

	.global gUnknown_08215AC0
gUnknown_08215AC0: @ 8215AC0
	.incbin "baserom.gba", 0x00215ac0, 0x4

	.global gUnknown_08215AC4
gUnknown_08215AC4: @ 8215AC4
	.incbin "baserom.gba", 0x00215ac4, 0xb4

	.global gUnknown_08215B78
gUnknown_08215B78: @ 8215B78
	.incbin "baserom.gba", 0x00215b78, 0x28

	.global gUnknown_08215BA0
gUnknown_08215BA0: @ 8215BA0
	.incbin "baserom.gba", 0x00215ba0, 0x6c

	.global gUnknown_08215C0C
gUnknown_08215C0C: @ 8215C0C
	.incbin "baserom.gba", 0x00215c0c, 0x20

	.global gUnknown_08215C2C
gUnknown_08215C2C: @ 8215C2C
	.incbin "baserom.gba", 0x00215c2c, 0x400

	.global gUnknown_0821602C
gUnknown_0821602C: @ 821602C
	.incbin "baserom.gba", 0x0021602c, 0x21d

	.global gUnknown_08216249
gUnknown_08216249: @ 8216249
	.incbin "baserom.gba", 0x00216249, 0x3b

	.global gUnknown_08216284
gUnknown_08216284: @ 8216284
	.incbin "baserom.gba", 0x00216284, 0x34

	.global gUnknown_082162B8
gUnknown_082162B8: @ 82162B8
	.incbin "baserom.gba", 0x002162b8, 0xc

	.global gUnknown_082162C4
gUnknown_082162C4: @ 82162C4
	.incbin "baserom.gba", 0x002162c4, 0x4

	.global gUnknown_082162C8
gUnknown_082162C8: @ 82162C8
	.incbin "baserom.gba", 0x002162c8, 0x4

	.global gUnknown_082162CC
gUnknown_082162CC: @ 82162CC
	.incbin "baserom.gba", 0x002162cc, 0x8

	.global gUnknown_082162D4
gUnknown_082162D4: @ 82162D4
	.incbin "baserom.gba", 0x002162d4, 0x10

	.global gUnknown_082162E4
gUnknown_082162E4: @ 82162E4
	.incbin "baserom.gba", 0x002162e4, 0x8

	.global gUnknown_082162EC
gUnknown_082162EC: @ 82162EC
	.incbin "baserom.gba", 0x002162ec, 0xc

	.global gUnknown_082162F8
gUnknown_082162F8: @ 82162F8
	.incbin "baserom.gba", 0x002162f8, 0x8

	.global gUnknown_08216300
gUnknown_08216300: @ 8216300
	.incbin "baserom.gba", 0x00216300, 0x3

	.global gUnknown_08216303
gUnknown_08216303: @ 8216303
	.incbin "baserom.gba", 0x00216303, 0x5

	.global gUnknown_08216308
gUnknown_08216308: @ 8216308
	.incbin "baserom.gba", 0x00216308, 0xd4

	.global gUnknown_082163DC
gUnknown_082163DC: @ 82163DC
	.incbin "baserom.gba", 0x002163dc, 0x8

	.global gUnknown_082163E4
gUnknown_082163E4: @ 82163E4
	.incbin "baserom.gba", 0x002163e4, 0x8

	.global gUnknown_082163EC
gUnknown_082163EC: @ 82163EC
	.incbin "baserom.gba", 0x002163ec, 0x8

	.global gUnknown_082163F4
gUnknown_082163F4: @ 82163F4
	.incbin "baserom.gba", 0x002163f4, 0x60

	.global gUnknown_08216454
gUnknown_08216454: @ 8216454
	.incbin "baserom.gba", 0x00216454, 0x8

	.global gUnknown_0821645C
gUnknown_0821645C: @ 821645C
	.incbin "baserom.gba", 0x0021645c, 0x98

	.global gUnknown_082164F4
gUnknown_082164F4: @ 82164F4
	.incbin "baserom.gba", 0x002164f4, 0x8

	.global gUnknown_082164FC
gUnknown_082164FC: @ 82164FC
	.incbin "baserom.gba", 0x002164fc, 0x44

	.global gUnknown_08216540
gUnknown_08216540: @ 8216540
	.incbin "baserom.gba", 0x00216540, 0x8

	.global gUnknown_08216548
gUnknown_08216548: @ 8216548
	.incbin "baserom.gba", 0x00216548, 0x2c

	.global gUnknown_08216574
gUnknown_08216574: @ 8216574
	.incbin "baserom.gba", 0x00216574, 0x8

	.global gUnknown_0821657C
gUnknown_0821657C: @ 821657C
	.incbin "baserom.gba", 0x0021657c, 0x18

	.global gUnknown_08216594
gUnknown_08216594: @ 8216594
	.incbin "baserom.gba", 0x00216594, 0x28

	.global gUnknown_082165BC
gUnknown_082165BC: @ 82165BC
	.incbin "baserom.gba", 0x002165bc, 0x1e

	.global gUnknown_082165DA
gUnknown_082165DA: @ 82165DA
	.incbin "baserom.gba", 0x002165da, 0x5

	.global gUnknown_082165DF
gUnknown_082165DF: @ 82165DF
	.incbin "baserom.gba", 0x002165df, 0xa

	.global gUnknown_082165E9
gUnknown_082165E9: @ 82165E9
	.incbin "baserom.gba", 0x002165e9, 0x5

	.global gUnknown_082165EE
gUnknown_082165EE: @ 82165EE
	.incbin "baserom.gba", 0x002165ee, 0x5

	.global gUnknown_082165F3
gUnknown_082165F3: @ 82165F3
	.incbin "baserom.gba", 0x002165f3, 0x5

	.global gUnknown_082165F8
gUnknown_082165F8: @ 82165F8
	.incbin "baserom.gba", 0x002165f8, 0x2

	.global gUnknown_082165FA
gUnknown_082165FA: @ 82165FA
	.incbin "baserom.gba", 0x002165fa, 0x6

	.global gUnknown_08216600
gUnknown_08216600: @ 8216600
	.incbin "baserom.gba", 0x00216600, 0x4

	.global gUnknown_08216604
gUnknown_08216604: @ 8216604
	.incbin "baserom.gba", 0x00216604, 0x20

	.global gUnknown_08216624
gUnknown_08216624: @ 8216624
	.incbin "baserom.gba", 0x00216624, 0x28

	.global gUnknown_0821664C
gUnknown_0821664C: @ 821664C
	.incbin "baserom.gba", 0x0021664c, 0x48

	.global gUnknown_08216694
gUnknown_08216694: @ 8216694
	.incbin "baserom.gba", 0x00216694, 0xc

	.global gUnknown_082166A0
gUnknown_082166A0: @ 82166A0
	.incbin "baserom.gba", 0x002166a0, 0xc

	.global gUnknown_082166AC
gUnknown_082166AC: @ 82166AC
	.incbin "baserom.gba", 0x002166ac, 0x2c

	.global gUnknown_082166D8
gUnknown_082166D8: @ 82166D8
	.incbin "baserom.gba", 0x002166d8, 0x8

@ 82166E0
	.include "data/tilesets/graphics.s"

@ 8259C1C
	.include "data/tilesets/metatiles.s"

@ 8286CF4
	.incbin "baserom.gba", 0x286CF4, 0x7E224

	.global gUnknown_08304F18
gUnknown_08304F18: @ 8304F18
	.incbin "baserom.gba", 0x00304f18, 0x3670

	.global gUnknown_08308588
gUnknown_08308588: @ 8308588
	.incbin "baserom.gba", 0x00308588, 0x8a0

	.global gUnknown_08308E28
gUnknown_08308E28: @ 8308E28
	.incbin "baserom.gba", 0x00308e28, 0x4

	.global gUnknown_08308E2C
gUnknown_08308E2C: @ 8308E2C
	.incbin "baserom.gba", 0x00308e2c, 0x6a50

	.global gUnknown_0830F87C
gUnknown_0830F87C: @ 830F87C
	.incbin "baserom.gba", 0x0030f87c, 0x14

	.global gUnknown_0830F890
gUnknown_0830F890: @ 830F890
	.incbin "baserom.gba", 0x0030f890, 0x124

	.global gUnknown_0830F9B4
gUnknown_0830F9B4: @ 830F9B4
	.incbin "baserom.gba", 0x0030f9b4, 0x1a4

	.global gUnknown_0830FB58
gUnknown_0830FB58: @ 830FB58
	.incbin "baserom.gba", 0x0030fb58, 0x48

	.global gUnknown_0830FBA0
gUnknown_0830FBA0: @ 830FBA0
	.incbin "baserom.gba", 0x0030fba0, 0x4c

	.global gUnknown_0830FBEC
gUnknown_0830FBEC: @ 830FBEC
	.incbin "baserom.gba", 0x0030fbec, 0xc

	.global gUnknown_0830FBF8
gUnknown_0830FBF8: @ 830FBF8
	.incbin "baserom.gba", 0x0030fbf8, 0x14

	.global gUnknown_0830FC0C
gUnknown_0830FC0C: @ 830FC0C
	.incbin "baserom.gba", 0x0030fc0c, 0x8

	.global gUnknown_0830FC14
gUnknown_0830FC14: @ 830FC14
	.incbin "baserom.gba", 0x0030fc14, 0x20

	.global gUnknown_0830FC34
gUnknown_0830FC34: @ 830FC34
	.incbin "baserom.gba", 0x0030fc34, 0x10

	.global gUnknown_0830FC44
gUnknown_0830FC44: @ 830FC44
	.incbin "baserom.gba", 0x0030fc44, 0x10

	.global gUnknown_0830FC54
gUnknown_0830FC54: @ 830FC54
	.incbin "baserom.gba", 0x0030fc54, 0x10

	.global gUnknown_0830FC64
gUnknown_0830FC64: @ 830FC64
	.incbin "baserom.gba", 0x0030fc64, 0x14

	.global gUnknown_0830FC78
gUnknown_0830FC78: @ 830FC78
	.incbin "baserom.gba", 0x0030fc78, 0x10

	.global gUnknown_0830FC88
gUnknown_0830FC88: @ 830FC88
	.incbin "baserom.gba", 0x0030fc88, 0xc

	.global gUnknown_0830FC94
gUnknown_0830FC94: @ 830FC94
	.incbin "baserom.gba", 0x0030fc94, 0x4

	.global gUnknown_0830FC98
gUnknown_0830FC98: @ 830FC98
	.incbin "baserom.gba", 0x0030fc98, 0x10

	.global gUnknown_0830FCA8
gUnknown_0830FCA8: @ 830FCA8
	.incbin "baserom.gba", 0x0030fca8, 0x4

	.global gUnknown_0830FCAC
gUnknown_0830FCAC: @ 830FCAC
	.incbin "baserom.gba", 0x0030fcac, 0x8

	.global gUnknown_0830FCB4
gUnknown_0830FCB4: @ 830FCB4
	.incbin "baserom.gba", 0x0030fcb4, 0x40

	.global gUnknown_0830FCF4
gUnknown_0830FCF4: @ 830FCF4
	.incbin "baserom.gba", 0x0030fcf4, 0x6

	.global gUnknown_0830FCFA
gUnknown_0830FCFA: @ 830FCFA
	.incbin "baserom.gba", 0x0030fcfa, 0x6

	.global gUnknown_0830FD00
gUnknown_0830FD00: @ 830FD00
	.incbin "baserom.gba", 0x0030fd00, 0x2

	.global gUnknown_0830FD02
gUnknown_0830FD02: @ 830FD02
	.incbin "baserom.gba", 0x0030fd02, 0x6

	.global gUnknown_0830FD08
gUnknown_0830FD08: @ 830FD08
	.incbin "baserom.gba", 0x0030fd08, 0xc

	.global gUnknown_0830FD14
gUnknown_0830FD14: @ 830FD14
	.incbin "baserom.gba", 0x0030fd14, 0x10

	.global gUnknown_0830FD24
gUnknown_0830FD24: @ 830FD24
	.incbin "baserom.gba", 0x0030fd24, 0x18

	.global gUnknown_0830FD3C
gUnknown_0830FD3C: @ 830FD3C
	.incbin "baserom.gba", 0x0030fd3c, 0xc

@ 830FD48
	.include "data/graphics/field_objects/map_object_graphics.s"

@ 8368528
	.include "data/graphics/field_objects/field_effect_object_graphics.s"

	.global gUnknown_0836DA88
gUnknown_0836DA88: @ 836DA88
	.incbin "baserom.gba", 0x0036da88, 0x134

	.global gUnknown_0836DBBC
gUnknown_0836DBBC: @ 836DBBC
	.incbin "baserom.gba", 0x0036dbbc, 0x4d

	.global gUnknown_0836DC09
gUnknown_0836DC09: @ 836DC09
	.incbin "baserom.gba", 0x0036dc09, 0x4f

@ 836DC58
	.include "data/graphics/field_objects/map_object_graphics_info_pointers.s"

@ 836DFC0
	.include "data/graphics/field_objects/field_effect_object_template_pointers.s"

@ 836E050
	.include "data/graphics/field_objects/map_object_pic_tables.s"

@ 83708C8
	.include "data/graphics/field_objects/map_object_anims.s"

@ 83711C4
	.include "data/graphics/field_objects/base_oam.s"

@ 8371204
	.include "data/graphics/field_objects/map_object_subsprites.s"

@ 83718D4
	.include "data/graphics/field_objects/map_object_graphics_info.s"

	.global gUnknown_0837377C
gUnknown_0837377C: @ 837377C
	.incbin "baserom.gba", 0x0037377c, 0xf8

	.global gUnknown_08373874
gUnknown_08373874: @ 8373874
	.incbin "baserom.gba", 0x00373874, 0x70

	.global gUnknown_083738E4
gUnknown_083738E4: @ 83738E4
	.incbin "baserom.gba", 0x003738e4, 0xb8

	.global gUnknown_0837399C
gUnknown_0837399C: @ 837399C
	.incbin "baserom.gba", 0x0037399c, 0x10

@ 83739AC
	.include "data/graphics/field_objects/berry_tree_graphics_tables.s"

@ 8374524
	.include "data/graphics/field_objects/field_effect_objects.s"

	.global gUnknown_0837520C
gUnknown_0837520C: @ 837520C
	.incbin "baserom.gba", 0x0037520c, 0x10

	.global gUnknown_0837521C
gUnknown_0837521C: @ 837521C
	.incbin "baserom.gba", 0x0037521c, 0x8

	.global gUnknown_08375224
gUnknown_08375224: @ 8375224
	.incbin "baserom.gba", 0x00375224, 0x1c

	.global gUnknown_08375240
gUnknown_08375240: @ 8375240
	.incbin "baserom.gba", 0x00375240, 0x4

	.global gUnknown_08375244
gUnknown_08375244: @ 8375244
	.incbin "baserom.gba", 0x00375244, 0x2c

	.global gUnknown_08375270
gUnknown_08375270: @ 8375270
	.incbin "baserom.gba", 0x00375270, 0x14

	.global gUnknown_08375284
gUnknown_08375284: @ 8375284
	.incbin "baserom.gba", 0x00375284, 0x1c

	.global gUnknown_083752A0
gUnknown_083752A0: @ 83752A0
	.incbin "baserom.gba", 0x003752a0, 0x4

	.global gUnknown_083752A4
gUnknown_083752A4: @ 83752A4
	.incbin "baserom.gba", 0x003752a4, 0x1c

	.global gUnknown_083752C0
gUnknown_083752C0: @ 83752C0
	.incbin "baserom.gba", 0x003752c0, 0x4

	.global gUnknown_083752C4
gUnknown_083752C4: @ 83752C4
	.incbin "baserom.gba", 0x003752c4, 0xc

	.global gUnknown_083752D0
gUnknown_083752D0: @ 83752D0
	.incbin "baserom.gba", 0x003752d0, 0x14

	.global gUnknown_083752E4
gUnknown_083752E4: @ 83752E4
	.incbin "baserom.gba", 0x003752e4, 0x14

	.global gUnknown_083752F8
gUnknown_083752F8: @ 83752F8
	.incbin "baserom.gba", 0x003752f8, 0x14

	.global gUnknown_0837530C
gUnknown_0837530C: @ 837530C
	.incbin "baserom.gba", 0x0037530c, 0x14

	.global gUnknown_08375320
gUnknown_08375320: @ 8375320
	.incbin "baserom.gba", 0x00375320, 0x4

	.global gUnknown_08375324
gUnknown_08375324: @ 8375324
	.incbin "baserom.gba", 0x00375324, 0x14

	.global gUnknown_08375338
gUnknown_08375338: @ 8375338
	.incbin "baserom.gba", 0x00375338, 0x4

	.global gUnknown_0837533C
gUnknown_0837533C: @ 837533C
	.incbin "baserom.gba", 0x0037533c, 0x14

	.global gUnknown_08375350
gUnknown_08375350: @ 8375350
	.incbin "baserom.gba", 0x00375350, 0x4

	.global gUnknown_08375354
gUnknown_08375354: @ 8375354
	.incbin "baserom.gba", 0x00375354, 0x14

	.global gUnknown_08375368
gUnknown_08375368: @ 8375368
	.incbin "baserom.gba", 0x00375368, 0x4

	.global gUnknown_0837536C
gUnknown_0837536C: @ 837536C
	.incbin "baserom.gba", 0x0037536c, 0x14

	.global gUnknown_08375380
gUnknown_08375380: @ 8375380
	.incbin "baserom.gba", 0x00375380, 0x4

	.global gUnknown_08375384
gUnknown_08375384: @ 8375384
	.incbin "baserom.gba", 0x00375384, 0x14

	.global gUnknown_08375398
gUnknown_08375398: @ 8375398
	.incbin "baserom.gba", 0x00375398, 0x4

	.global gUnknown_0837539C
gUnknown_0837539C: @ 837539C
	.incbin "baserom.gba", 0x0037539c, 0x14

	.global gUnknown_083753B0
gUnknown_083753B0: @ 83753B0
	.incbin "baserom.gba", 0x003753b0, 0x4

	.global gUnknown_083753B4
gUnknown_083753B4: @ 83753B4
	.incbin "baserom.gba", 0x003753b4, 0x14

	.global gUnknown_083753C8
gUnknown_083753C8: @ 83753C8
	.incbin "baserom.gba", 0x003753c8, 0x4

	.global gUnknown_083753CC
gUnknown_083753CC: @ 83753CC
	.incbin "baserom.gba", 0x003753cc, 0x10

	.global gUnknown_083753DC
gUnknown_083753DC: @ 83753DC
	.incbin "baserom.gba", 0x003753dc, 0x8

	.global gUnknown_083753E4
gUnknown_083753E4: @ 83753E4
	.incbin "baserom.gba", 0x003753e4, 0x10

	.global gUnknown_083753F4
gUnknown_083753F4: @ 83753F4
	.incbin "baserom.gba", 0x003753f4, 0x8

	.global gUnknown_083753FC
gUnknown_083753FC: @ 83753FC
	.incbin "baserom.gba", 0x003753fc, 0x10

	.global gUnknown_0837540C
gUnknown_0837540C: @ 837540C
	.incbin "baserom.gba", 0x0037540c, 0xc

	.global gUnknown_08375418
gUnknown_08375418: @ 8375418
	.incbin "baserom.gba", 0x00375418, 0x4

	.global gUnknown_0837541C
gUnknown_0837541C: @ 837541C
	.incbin "baserom.gba", 0x0037541c, 0xc

	.global gUnknown_08375428
gUnknown_08375428: @ 8375428
	.incbin "baserom.gba", 0x00375428, 0x4

	.global gUnknown_0837542C
gUnknown_0837542C: @ 837542C
	.incbin "baserom.gba", 0x0037542c, 0xc

	.global gUnknown_08375438
gUnknown_08375438: @ 8375438
	.incbin "baserom.gba", 0x00375438, 0x4

	.global gUnknown_0837543C
gUnknown_0837543C: @ 837543C
	.incbin "baserom.gba", 0x0037543c, 0xc

	.global gUnknown_08375448
gUnknown_08375448: @ 8375448
	.incbin "baserom.gba", 0x00375448, 0x4

	.global gUnknown_0837544C
gUnknown_0837544C: @ 837544C
	.incbin "baserom.gba", 0x0037544c, 0xc

	.global gUnknown_08375458
gUnknown_08375458: @ 8375458
	.incbin "baserom.gba", 0x00375458, 0x4

	.global gUnknown_0837545C
gUnknown_0837545C: @ 837545C
	.incbin "baserom.gba", 0x0037545c, 0xc

	.global gUnknown_08375468
gUnknown_08375468: @ 8375468
	.incbin "baserom.gba", 0x00375468, 0x4

	.global gUnknown_0837546C
gUnknown_0837546C: @ 837546C
	.incbin "baserom.gba", 0x0037546c, 0xc

	.global gUnknown_08375478
gUnknown_08375478: @ 8375478
	.incbin "baserom.gba", 0x00375478, 0xc

	.global gUnknown_08375484
gUnknown_08375484: @ 8375484
	.incbin "baserom.gba", 0x00375484, 0x4

	.global gUnknown_08375488
gUnknown_08375488: @ 8375488
	.incbin "baserom.gba", 0x00375488, 0xc

	.global gUnknown_08375494
gUnknown_08375494: @ 8375494
	.incbin "baserom.gba", 0x00375494, 0x4

	.global gUnknown_08375498
gUnknown_08375498: @ 8375498
	.incbin "baserom.gba", 0x00375498, 0xc

	.global gUnknown_083754A4
gUnknown_083754A4: @ 83754A4
	.incbin "baserom.gba", 0x003754a4, 0x4

	.global gUnknown_083754A8
gUnknown_083754A8: @ 83754A8
	.incbin "baserom.gba", 0x003754a8, 0xc

	.global gUnknown_083754B4
gUnknown_083754B4: @ 83754B4
	.incbin "baserom.gba", 0x003754b4, 0x4

	.global gUnknown_083754B8
gUnknown_083754B8: @ 83754B8
	.incbin "baserom.gba", 0x003754b8, 0xc

	.global gUnknown_083754C4
gUnknown_083754C4: @ 83754C4
	.incbin "baserom.gba", 0x003754c4, 0x4

	.global gUnknown_083754C8
gUnknown_083754C8: @ 83754C8
	.incbin "baserom.gba", 0x003754c8, 0xc

	.global gUnknown_083754D4
gUnknown_083754D4: @ 83754D4
	.incbin "baserom.gba", 0x003754d4, 0x4

	.global gUnknown_083754D8
gUnknown_083754D8: @ 83754D8
	.incbin "baserom.gba", 0x003754d8, 0xc

	.global gUnknown_083754E4
gUnknown_083754E4: @ 83754E4
	.incbin "baserom.gba", 0x003754e4, 0x4

	.global gUnknown_083754E8
gUnknown_083754E8: @ 83754E8
	.incbin "baserom.gba", 0x003754e8, 0xc

	.global gUnknown_083754F4
gUnknown_083754F4: @ 83754F4
	.incbin "baserom.gba", 0x003754f4, 0x4

	.global gUnknown_083754F8
gUnknown_083754F8: @ 83754F8
	.incbin "baserom.gba", 0x003754f8, 0xc

	.global gUnknown_08375504
gUnknown_08375504: @ 8375504
	.incbin "baserom.gba", 0x00375504, 0x4

	.global gUnknown_08375508
gUnknown_08375508: @ 8375508
	.incbin "baserom.gba", 0x00375508, 0xc

	.global gUnknown_08375514
gUnknown_08375514: @ 8375514
	.incbin "baserom.gba", 0x00375514, 0x4

	.global gUnknown_08375518
gUnknown_08375518: @ 8375518
	.incbin "baserom.gba", 0x00375518, 0xc

	.global gUnknown_08375524
gUnknown_08375524: @ 8375524
	.incbin "baserom.gba", 0x00375524, 0x4

	.global gUnknown_08375528
gUnknown_08375528: @ 8375528
	.incbin "baserom.gba", 0x00375528, 0xc

	.global gUnknown_08375534
gUnknown_08375534: @ 8375534
	.incbin "baserom.gba", 0x00375534, 0x4

	.global gUnknown_08375538
gUnknown_08375538: @ 8375538
	.incbin "baserom.gba", 0x00375538, 0xc

	.global gUnknown_08375544
gUnknown_08375544: @ 8375544
	.incbin "baserom.gba", 0x00375544, 0x4

	.global gUnknown_08375548
gUnknown_08375548: @ 8375548
	.incbin "baserom.gba", 0x00375548, 0xc

	.global gUnknown_08375554
gUnknown_08375554: @ 8375554
	.incbin "baserom.gba", 0x00375554, 0x4

	.global gUnknown_08375558
gUnknown_08375558: @ 8375558
	.incbin "baserom.gba", 0x00375558, 0xc

	.global gUnknown_08375564
gUnknown_08375564: @ 8375564
	.incbin "baserom.gba", 0x00375564, 0x4

	.global gUnknown_08375568
gUnknown_08375568: @ 8375568
	.incbin "baserom.gba", 0x00375568, 0xc

	.global gUnknown_08375574
gUnknown_08375574: @ 8375574
	.incbin "baserom.gba", 0x00375574, 0x4

	.global gUnknown_08375578
gUnknown_08375578: @ 8375578
	.incbin "baserom.gba", 0x00375578, 0xc

	.global gUnknown_08375584
gUnknown_08375584: @ 8375584
	.incbin "baserom.gba", 0x00375584, 0x4

	.global gUnknown_08375588
gUnknown_08375588: @ 8375588
	.incbin "baserom.gba", 0x00375588, 0xc

	.global gUnknown_08375594
gUnknown_08375594: @ 8375594
	.incbin "baserom.gba", 0x00375594, 0x2c

	.global gUnknown_083755C0
gUnknown_083755C0: @ 83755C0
	.incbin "baserom.gba", 0x003755c0, 0xc

	.global gUnknown_083755CC
gUnknown_083755CC: @ 83755CC
	.incbin "baserom.gba", 0x003755cc, 0x4

	.global gUnknown_083755D0
gUnknown_083755D0: @ 83755D0
	.incbin "baserom.gba", 0x003755d0, 0x8

	.global gUnknown_083755D8
gUnknown_083755D8: @ 83755D8
	.incbin "baserom.gba", 0x003755d8, 0x8

	.global gUnknown_083755E0
gUnknown_083755E0: @ 83755E0
	.incbin "baserom.gba", 0x003755e0, 0x8

	.global gUnknown_083755E8
gUnknown_083755E8: @ 83755E8
	.incbin "baserom.gba", 0x003755e8, 0xc

	.global gUnknown_083755F4
gUnknown_083755F4: @ 83755F4
	.incbin "baserom.gba", 0x003755f4, 0x9

	.global gUnknown_083755FD
gUnknown_083755FD: @ 83755FD
	.incbin "baserom.gba", 0x003755fd, 0x9

	.global gUnknown_08375606
gUnknown_08375606: @ 8375606
	.incbin "baserom.gba", 0x00375606, 0x9

	.global gUnknown_0837560F
gUnknown_0837560F: @ 837560F
	.incbin "baserom.gba", 0x0037560f, 0x9

	.global gUnknown_08375618
gUnknown_08375618: @ 8375618
	.incbin "baserom.gba", 0x00375618, 0x9

	.global gUnknown_08375621
gUnknown_08375621: @ 8375621
	.incbin "baserom.gba", 0x00375621, 0x9

	.global gUnknown_0837562A
gUnknown_0837562A: @ 837562A
	.incbin "baserom.gba", 0x0037562a, 0x9

	.global gUnknown_08375633
gUnknown_08375633: @ 8375633
	.incbin "baserom.gba", 0x00375633, 0x9

	.global gUnknown_0837563C
gUnknown_0837563C: @ 837563C
	.incbin "baserom.gba", 0x0037563c, 0x9

	.global gUnknown_08375645
gUnknown_08375645: @ 8375645
	.incbin "baserom.gba", 0x00375645, 0x9

	.global gUnknown_0837564E
gUnknown_0837564E: @ 837564E
	.incbin "baserom.gba", 0x0037564e, 0x9

	.global gUnknown_08375657
gUnknown_08375657: @ 8375657
	.incbin "baserom.gba", 0x00375657, 0x9

	.global gUnknown_08375660
gUnknown_08375660: @ 8375660
	.incbin "baserom.gba", 0x00375660, 0x9

	.global gUnknown_08375669
gUnknown_08375669: @ 8375669
	.incbin "baserom.gba", 0x00375669, 0x9

	.global gUnknown_08375672
gUnknown_08375672: @ 8375672
	.incbin "baserom.gba", 0x00375672, 0x9

	.global gUnknown_0837567B
gUnknown_0837567B: @ 837567B
	.incbin "baserom.gba", 0x0037567b, 0x9

	.global gUnknown_08375684
gUnknown_08375684: @ 8375684
	.incbin "baserom.gba", 0x00375684, 0x10

	.global gUnknown_08375694
gUnknown_08375694: @ 8375694
	.incbin "baserom.gba", 0x00375694, 0x10

	.global gUnknown_083756A4
gUnknown_083756A4: @ 83756A4
	.incbin "baserom.gba", 0x003756a4, 0x24

	.global gUnknown_083756C8
gUnknown_083756C8: @ 83756C8
	.incbin "baserom.gba", 0x003756c8, 0x5

	.global gUnknown_083756CD
gUnknown_083756CD: @ 83756CD
	.incbin "baserom.gba", 0x003756cd, 0x5

	.global gUnknown_083756D2
gUnknown_083756D2: @ 83756D2
	.incbin "baserom.gba", 0x003756d2, 0x5

	.global gUnknown_083756D7
gUnknown_083756D7: @ 83756D7
	.incbin "baserom.gba", 0x003756d7, 0x5

	.global gUnknown_083756DC
gUnknown_083756DC: @ 83756DC
	.incbin "baserom.gba", 0x003756dc, 0x5

	.global gUnknown_083756E1
gUnknown_083756E1: @ 83756E1
	.incbin "baserom.gba", 0x003756e1, 0x5

	.global gUnknown_083756E6
gUnknown_083756E6: @ 83756E6
	.incbin "baserom.gba", 0x003756e6, 0x5

	.global gUnknown_083756EB
gUnknown_083756EB: @ 83756EB
	.incbin "baserom.gba", 0x003756eb, 0x5

	.global gUnknown_083756F0
gUnknown_083756F0: @ 83756F0
	.incbin "baserom.gba", 0x003756f0, 0x5

	.global gUnknown_083756F5
gUnknown_083756F5: @ 83756F5
	.incbin "baserom.gba", 0x003756f5, 0x5

	.global gUnknown_083756FA
gUnknown_083756FA: @ 83756FA
	.incbin "baserom.gba", 0x003756fa, 0x5

	.global gUnknown_083756FF
gUnknown_083756FF: @ 83756FF
	.incbin "baserom.gba", 0x003756ff, 0x5

	.global gUnknown_08375704
gUnknown_08375704: @ 8375704
	.incbin "baserom.gba", 0x00375704, 0x5

	.global gUnknown_08375709
gUnknown_08375709: @ 8375709
	.incbin "baserom.gba", 0x00375709, 0x5

	.global gUnknown_0837570E
gUnknown_0837570E: @ 837570E
	.incbin "baserom.gba", 0x0037570e, 0x5

	.global gUnknown_08375713
gUnknown_08375713: @ 8375713
	.incbin "baserom.gba", 0x00375713, 0x5

	.global gUnknown_08375718
gUnknown_08375718: @ 8375718
	.incbin "baserom.gba", 0x00375718, 0x5

	.global gUnknown_0837571D
gUnknown_0837571D: @ 837571D
	.incbin "baserom.gba", 0x0037571d, 0x5

	.global gUnknown_08375722
gUnknown_08375722: @ 8375722
	.incbin "baserom.gba", 0x00375722, 0x5

	.global gUnknown_08375727
gUnknown_08375727: @ 8375727
	.incbin "baserom.gba", 0x00375727, 0x5

	.global gUnknown_0837572C
gUnknown_0837572C: @ 837572C
	.incbin "baserom.gba", 0x0037572c, 0x5

	.global gUnknown_08375731
gUnknown_08375731: @ 8375731
	.incbin "baserom.gba", 0x00375731, 0x5

	.global gUnknown_08375736
gUnknown_08375736: @ 8375736
	.incbin "baserom.gba", 0x00375736, 0x5

	.global gUnknown_0837573B
gUnknown_0837573B: @ 837573B
	.incbin "baserom.gba", 0x0037573b, 0x5

	.global gUnknown_08375740
gUnknown_08375740: @ 8375740
	.incbin "baserom.gba", 0x00375740, 0x5

	.global gUnknown_08375745
gUnknown_08375745: @ 8375745
	.incbin "baserom.gba", 0x00375745, 0x5

	.global gUnknown_0837574A
gUnknown_0837574A: @ 837574A
	.incbin "baserom.gba", 0x0037574a, 0x5

	.global gUnknown_0837574F
gUnknown_0837574F: @ 837574F
	.incbin "baserom.gba", 0x0037574f, 0x8

	.global gUnknown_08375757
gUnknown_08375757: @ 8375757
	.incbin "baserom.gba", 0x00375757, 0x10

	.global gUnknown_08375767
gUnknown_08375767: @ 8375767
	.incbin "baserom.gba", 0x00375767, 0x11

	.global gUnknown_08375778
gUnknown_08375778: @ 8375778
	.incbin "baserom.gba", 0x00375778, 0x248

	.global gUnknown_083759C0
gUnknown_083759C0: @ 83759C0
	.incbin "baserom.gba", 0x003759c0, 0x74

	.global gUnknown_08375A34
gUnknown_08375A34: @ 8375A34
	.incbin "baserom.gba", 0x00375a34, 0x6

	.global gUnknown_08375A3A
gUnknown_08375A3A: @ 8375A3A
	.incbin "baserom.gba", 0x00375a3a, 0x5ce

	.global gUnknown_08376008
gUnknown_08376008: @ 8376008
	.incbin "baserom.gba", 0x00376008, 0x8

	.global gUnknown_08376010
gUnknown_08376010: @ 8376010
	.incbin "baserom.gba", 0x00376010, 0x18

	.global gUnknown_08376028
gUnknown_08376028: @ 8376028
	.incbin "baserom.gba", 0x00376028, 0x18

	.global gUnknown_08376040
gUnknown_08376040: @ 8376040
	.incbin "baserom.gba", 0x00376040, 0x10

	.global gUnknown_08376050
gUnknown_08376050: @ 8376050
	.incbin "baserom.gba", 0x00376050, 0x10

	.global gUnknown_08376060
gUnknown_08376060: @ 8376060
	.incbin "baserom.gba", 0x00376060, 0x10

	.global gUnknown_08376070
gUnknown_08376070: @ 8376070
	.incbin "baserom.gba", 0x00376070, 0x10

	.global gUnknown_08376080
gUnknown_08376080: @ 8376080
	.incbin "baserom.gba", 0x00376080, 0xc

	.global gUnknown_0837608C
gUnknown_0837608C: @ 837608C
	.incbin "baserom.gba", 0x0037608c, 0x4

	.global gUnknown_08376090
gUnknown_08376090: @ 8376090
	.incbin "baserom.gba", 0x00376090, 0x10

	.global gUnknown_083760A0
gUnknown_083760A0: @ 83760A0
	.incbin "baserom.gba", 0x003760a0, 0xe0

	.global gUnknown_08376180
gUnknown_08376180: @ 8376180
	.incbin "baserom.gba", 0x00376180, 0x14

	.global gUnknown_08376194
gUnknown_08376194: @ 8376194
	.incbin "baserom.gba", 0x00376194, 0x3c

	.global gUnknown_083761D0
gUnknown_083761D0: @ 83761D0
	.incbin "baserom.gba", 0x003761d0, 0xc

	.global gUnknown_083761DC
gUnknown_083761DC: @ 83761DC
	.incbin "baserom.gba", 0x003761dc, 0x6

	.global gUnknown_083761E2
gUnknown_083761E2: @ 83761E2
	.incbin "baserom.gba", 0x003761e2, 0x4

	.global gUnknown_083761E6
gUnknown_083761E6: @ 83761E6
	.incbin "baserom.gba", 0x003761e6, 0x6

	.global gUnknown_083761EC
gUnknown_083761EC: @ 83761EC
	.incbin "baserom.gba", 0x003761ec, 0x4

	.global gUnknown_083761F0
gUnknown_083761F0: @ 83761F0
	.incbin "baserom.gba", 0x003761f0, 0xa0

	.global gUnknown_08376290
gUnknown_08376290: @ 8376290
	.incbin "baserom.gba", 0x00376290, 0x48

	.global gUnknown_083762D8
gUnknown_083762D8: @ 83762D8
	.incbin "baserom.gba", 0x003762d8, 0x4

	.global gUnknown_083762DC
gUnknown_083762DC: @ 83762DC
	.incbin "baserom.gba", 0x003762dc, 0x14

	.global gUnknown_083762F0
gUnknown_083762F0: @ 83762F0
	.incbin "baserom.gba", 0x003762f0, 0xc

	.global gUnknown_083762FC
gUnknown_083762FC: @ 83762FC
	.incbin "baserom.gba", 0x003762fc, 0x68

	.global gUnknown_08376364
gUnknown_08376364: @ 8376364
	.incbin "baserom.gba", 0x00376364, 0x20

	.global gUnknown_08376384
gUnknown_08376384: @ 8376384
	.incbin "baserom.gba", 0x00376384, 0x20

	.global gUnknown_083763A4
gUnknown_083763A4: @ 83763A4
	.incbin "baserom.gba", 0x003763a4, 0x20

	.global gUnknown_083763C4
gUnknown_083763C4: @ 83763C4
	.incbin "baserom.gba", 0x003763c4, 0x20

	.global gUnknown_083763E4
gUnknown_083763E4: @ 83763E4
	.incbin "baserom.gba", 0x003763e4, 0x30

	.global gUnknown_08376414
gUnknown_08376414: @ 8376414
	.incbin "baserom.gba", 0x00376414, 0x4

	.global gUnknown_08376418
gUnknown_08376418: @ 8376418
	.incbin "baserom.gba", 0x00376418, 0xa4

	.global gUnknown_083764BC
gUnknown_083764BC: @ 83764BC
	.incbin "baserom.gba", 0x003764bc, 0x2c

	.global gUnknown_083764E8
gUnknown_083764E8: @ 83764E8
	.incbin "baserom.gba", 0x003764e8, 0x18

	.global gUnknown_08376500
gUnknown_08376500: @ 8376500
	.incbin "baserom.gba", 0x00376500, 0x4

	.global gUnknown_08376504
gUnknown_08376504: @ 8376504
	.incbin "baserom.gba", 0x00376504, 0xd8

	.global gUnknown_083765DC
gUnknown_083765DC: @ 83765DC
	.incbin "baserom.gba", 0x003765dc, 0x8

	.global gUnknown_083765E4
gUnknown_083765E4: @ 83765E4
	.incbin "baserom.gba", 0x003765e4, 0x28

	.global gUnknown_0837660C
gUnknown_0837660C: @ 837660C
	.incbin "baserom.gba", 0x0037660c, 0x18

	.global gUnknown_08376624
gUnknown_08376624: @ 8376624
	.incbin "baserom.gba", 0x00376624, 0x54

	.global gUnknown_08376678
gUnknown_08376678: @ 8376678
	.incbin "baserom.gba", 0x00376678, 0xc0

	.global gUnknown_08376738
gUnknown_08376738: @ 8376738
	.incbin "baserom.gba", 0x00376738, 0x120

	.global gUnknown_08376858
gUnknown_08376858: @ 8376858
	.incbin "baserom.gba", 0x00376858, 0x60

	.global gUnknown_083768B8
gUnknown_083768B8: @ 83768B8
	.incbin "baserom.gba", 0x003768b8, 0x60

	.global gUnknown_08376918
gUnknown_08376918: @ 8376918
	.incbin "baserom.gba", 0x00376918, 0x30

	.global gUnknown_08376948
gUnknown_08376948: @ 8376948
	.incbin "baserom.gba", 0x00376948, 0x30

	.global gUnknown_08376978
gUnknown_08376978: @ 8376978
	.incbin "baserom.gba", 0x00376978, 0x30

	.global gUnknown_083769A8
gUnknown_083769A8: @ 83769A8
	.incbin "baserom.gba", 0x003769a8, 0x18

	.global gUnknown_083769C0
gUnknown_083769C0: @ 83769C0
	.incbin "baserom.gba", 0x003769c0, 0x18

	.global gUnknown_083769D8
gUnknown_083769D8: @ 83769D8
	.incbin "baserom.gba", 0x003769d8, 0x4d

	.global gUnknown_08376A25
gUnknown_08376A25: @ 8376A25
	.incbin "baserom.gba", 0x00376a25, 0x39

	.global gUnknown_08376A5E
gUnknown_08376A5E: @ 8376A5E
	.incbin "baserom.gba", 0x00376a5e, 0xf6

	.global gUnknown_08376B54
gUnknown_08376B54: @ 8376B54
	.incbin "baserom.gba", 0x00376b54, 0x60

	.global gUnknown_08376BB4
gUnknown_08376BB4: @ 8376BB4
	.incbin "baserom.gba", 0x00376bb4, 0xc0

	.global gUnknown_08376C74
gUnknown_08376C74: @ 8376C74
	.incbin "baserom.gba", 0x00376c74, 0x60

	.global gUnknown_08376CD4
gUnknown_08376CD4: @ 8376CD4
	.incbin "baserom.gba", 0x00376cd4, 0x18

	.global gUnknown_08376CEC
gUnknown_08376CEC: @ 8376CEC
	.incbin "baserom.gba", 0x00376cec, 0x18

	.global gUnknown_08376D04
gUnknown_08376D04: @ 8376D04
	.incbin "baserom.gba", 0x00376d04, 0x18

	.global gUnknown_08376D1C
gUnknown_08376D1C: @ 8376D1C
	.incbin "baserom.gba", 0x00376d1c, 0x8

	.global gUnknown_08376D24
gUnknown_08376D24: @ 8376D24
	.incbin "baserom.gba", 0x00376d24, 0x50

	.global gUnknown_08376D74
gUnknown_08376D74: @ 8376D74
	.incbin "baserom.gba", 0x00376d74, 0x1b0

	.global gUnknown_08376F24
gUnknown_08376F24: @ 8376F24
	.incbin "baserom.gba", 0x00376f24, 0x1e10

	.global gUnknown_08378D34
gUnknown_08378D34: @ 8378D34
	.incbin "baserom.gba", 0x00378d34, 0x8e0

	.global gUnknown_08379614
gUnknown_08379614: @ 8379614
	.incbin "baserom.gba", 0x00379614, 0x320

	.global gUnknown_08379934
gUnknown_08379934: @ 8379934
	.incbin "baserom.gba", 0x00379934, 0x510

	.global gUnknown_08379E44
gUnknown_08379E44: @ 8379E44
	.incbin "baserom.gba", 0x00379e44, 0x210

	.global gUnknown_0837A054
gUnknown_0837A054: @ 837A054
	.incbin "baserom.gba", 0x0037a054, 0xb50

	.global gUnknown_0837ABA4
gUnknown_0837ABA4: @ 837ABA4
	.incbin "baserom.gba", 0x0037aba4, 0x210

	.global gUnknown_0837ADB4
gUnknown_0837ADB4: @ 837ADB4
	.incbin "baserom.gba", 0x0037adb4, 0x810

	.global gUnknown_0837B5C4
gUnknown_0837B5C4: @ 837B5C4
	.incbin "baserom.gba", 0x0037b5c4, 0x520

	.global gUnknown_0837BAE4
gUnknown_0837BAE4: @ 837BAE4
	.incbin "baserom.gba", 0x0037bae4, 0x20

	.global gUnknown_0837BB04
gUnknown_0837BB04: @ 837BB04
	.incbin "baserom.gba", 0x0037bb04, 0x20

	.global gUnknown_0837BB24
gUnknown_0837BB24: @ 837BB24
	.incbin "baserom.gba", 0x0037bb24, 0x30

	.global gUnknown_0837BB54
gUnknown_0837BB54: @ 837BB54
	.incbin "baserom.gba", 0x0037bb54, 0x30

	.global gUnknown_0837BB84
gUnknown_0837BB84: @ 837BB84
	.incbin "baserom.gba", 0x0037bb84, 0x10

	.global gUnknown_0837BB94
gUnknown_0837BB94: @ 837BB94
	.incbin "baserom.gba", 0x0037bb94, 0x410

	.global gUnknown_0837BFA4
gUnknown_0837BFA4: @ 837BFA4
	.incbin "baserom.gba", 0x0037bfa4, 0x20

	.global gUnknown_0837BFC4
gUnknown_0837BFC4: @ 837BFC4
	.incbin "baserom.gba", 0x0037bfc4, 0x120

	.global gUnknown_0837C0E4
gUnknown_0837C0E4: @ 837C0E4
	.incbin "baserom.gba", 0x0037c0e4, 0x428

	.global gUnknown_0837C50C
gUnknown_0837C50C: @ 837C50C
	.incbin "baserom.gba", 0x0037c50c, 0x430

	.global gUnknown_0837C93C
gUnknown_0837C93C: @ 837C93C
	.incbin "baserom.gba", 0x0037c93c, 0x20

	.global gUnknown_0837C95C
gUnknown_0837C95C: @ 837C95C
	.incbin "baserom.gba", 0x0037c95c, 0x120

	.global gUnknown_0837CA7C
gUnknown_0837CA7C: @ 837CA7C
	.incbin "baserom.gba", 0x0037ca7c, 0xc08

	.global gUnknown_0837D684
gUnknown_0837D684: @ 837D684
	.incbin "baserom.gba", 0x0037d684, 0xc

	.global gUnknown_0837D690
gUnknown_0837D690: @ 837D690
	.incbin "baserom.gba", 0x0037d690, 0x1ac

	.global gUnknown_0837D83C
gUnknown_0837D83C: @ 837D83C
	.incbin "baserom.gba", 0x0037d83c, 0x10

	.global gUnknown_0837D84C
gUnknown_0837D84C: @ 837D84C
	.incbin "baserom.gba", 0x0037d84c, 0x428

	.global gUnknown_0837DC74
gUnknown_0837DC74: @ 837DC74
	.incbin "baserom.gba", 0x0037dc74, 0x268

	.global gUnknown_0837DEDC
gUnknown_0837DEDC: @ 837DEDC
	.incbin "baserom.gba", 0x0037dedc, 0x8

	.global gUnknown_0837DEE4
gUnknown_0837DEE4: @ 837DEE4
	.incbin "baserom.gba", 0x0037dee4, 0x10

	.global gUnknown_0837DEF4
gUnknown_0837DEF4: @ 837DEF4
	.incbin "baserom.gba", 0x0037def4, 0x270

	.global gBattleAnimPicTable
gBattleAnimPicTable: @ 837E164
	.incbin "baserom.gba", 0x0037e164, 0x908

	.global gBattleAnimPaletteTable
gBattleAnimPaletteTable: @ 837EA6C
	.incbin "baserom.gba", 0x37EA6C, 0x908

	.global gUnknown_0837F374
gUnknown_0837F374: @ 837F374
	.incbin "baserom.gba", 0x0037f374, 0x144

	.global gUnknown_0837F4B8
gUnknown_0837F4B8: @ 837F4B8
	.incbin "baserom.gba", 0x0037f4b8, 0xc0

	.global gUnknown_0837F578
gUnknown_0837F578: @ 837F578
	.incbin "baserom.gba", 0x0037f578, 0x20

	.global gUnknown_0837F598
gUnknown_0837F598: @ 837F598
	.incbin "baserom.gba", 0x0037f598, 0x10

	.global gUnknown_0837F5A8
gUnknown_0837F5A8: @ 837F5A8
	.incbin "baserom.gba", 0x0037f5a8, 0x4

	.global gUnknown_0837F5AC
gUnknown_0837F5AC: @ 837F5AC
	.incbin "baserom.gba", 0x0037f5ac, 0x4

	.global gUnknown_0837F5B0
gUnknown_0837F5B0: @ 837F5B0
	.incbin "baserom.gba", 0x0037f5b0, 0x30

	.global gUnknown_0837F5E0
gUnknown_0837F5E0: @ 837F5E0
	.incbin "baserom.gba", 0x0037f5e0, 0x13bf8

	.global gUnknown_083931D8
gUnknown_083931D8: @ 83931D8
	.incbin "baserom.gba", 0x003931d8, 0x8

	.global gUnknown_083931E0
gUnknown_083931E0: @ 83931E0
	.incbin "baserom.gba", 0x003931e0, 0x18

	.global gUnknown_083931F8
gUnknown_083931F8: @ 83931F8
	.incbin "baserom.gba", 0x003931f8, 0x18

	.global gUnknown_08393210
gUnknown_08393210: @ 8393210
	.incbin "baserom.gba", 0x00393210, 0x40

	.global gUnknown_08393250
gUnknown_08393250: @ 8393250
	.incbin "baserom.gba", 0x00393250, 0x79c

	.global gUnknown_083939EC
gUnknown_083939EC: @ 83939EC
	.incbin "baserom.gba", 0x003939ec, 0x20c

	.global gUnknown_08393BF8
gUnknown_08393BF8: @ 8393BF8
	.incbin "baserom.gba", 0x00393bf8, 0x26c

	.global gUnknown_08393E64
gUnknown_08393E64: @ 8393E64
	.incbin "baserom.gba", 0x00393e64, 0x68

	.global gUnknown_08393ECC
gUnknown_08393ECC: @ 8393ECC
	.incbin "baserom.gba", 0x00393ecc, 0x18

	.global gUnknown_08393EE4
gUnknown_08393EE4: @ 8393EE4
	.incbin "baserom.gba", 0x00393ee4, 0x18

	.global gUnknown_08393EFC
gUnknown_08393EFC: @ 8393EFC
	.incbin "baserom.gba", 0x00393efc, 0x78

	.global gUnknown_08393F74
gUnknown_08393F74: @ 8393F74
	.incbin "baserom.gba", 0x00393f74, 0x18

	.global gUnknown_08393F8C
gUnknown_08393F8C: @ 8393F8C
	.incbin "baserom.gba", 0x00393f8c, 0x10

	.global gUnknown_08393F9C
gUnknown_08393F9C: @ 8393F9C
	.incbin "baserom.gba", 0x00393f9c, 0x24

	.global gUnknown_08393FC0
gUnknown_08393FC0: @ 8393FC0
	.incbin "baserom.gba", 0x00393fc0, 0x18

	.global gUnknown_08393FD8
gUnknown_08393FD8: @ 8393FD8
	.incbin "baserom.gba", 0x00393fd8, 0x2fd0

	.global gUnknown_08396FA8
gUnknown_08396FA8: @ 8396FA8
	.incbin "baserom.gba", 0x00396fa8, 0x1c

	.global gUnknown_08396FC4
gUnknown_08396FC4: @ 8396FC4
	.incbin "baserom.gba", 0x00396fc4, 0x4

	.global gUnknown_08396FC8
gUnknown_08396FC8: @ 8396FC8
	.incbin "baserom.gba", 0x00396fc8, 0xf0

	.global gUnknown_083970B8
gUnknown_083970B8: @ 83970B8
	.incbin "baserom.gba", 0x003970b8, 0x10

	.global gUnknown_083970C8
gUnknown_083970C8: @ 83970C8
	.incbin "baserom.gba", 0x003970c8, 0x20

	.global gUnknown_083970E8
gUnknown_083970E8: @ 83970E8
	.incbin "baserom.gba", 0x003970e8, 0x20

	.global gUnknown_08397108
gUnknown_08397108: @ 8397108
	.incbin "baserom.gba", 0x00397108, 0x20

	.global gUnknown_08397128
gUnknown_08397128: @ 8397128
	.incbin "baserom.gba", 0x00397128, 0x820

	.global gUnknown_08397948
gUnknown_08397948: @ 8397948
	.incbin "baserom.gba", 0x00397948, 0x3080

	.global gUnknown_0839A9C8
gUnknown_0839A9C8: @ 839A9C8
	.incbin "baserom.gba", 0x0039a9c8, 0xc

	.global gUnknown_0839A9D4
gUnknown_0839A9D4: @ 839A9D4
	.incbin "baserom.gba", 0x0039a9d4, 0x1c

	.global gUnknown_0839A9F0
gUnknown_0839A9F0: @ 839A9F0
	.incbin "baserom.gba", 0x0039a9f0, 0x18

	.global gUnknown_0839AA08
gUnknown_0839AA08: @ 839AA08
	.incbin "baserom.gba", 0x0039aa08, 0x9c

	.global gUnknown_0839AAA4
gUnknown_0839AAA4: @ 839AAA4
	.incbin "baserom.gba", 0x0039aaa4, 0x18

	.global gUnknown_0839AABC
gUnknown_0839AABC: @ 839AABC
	.incbin "baserom.gba", 0x0039aabc, 0x8

	.global gUnknown_0839AAC4
gUnknown_0839AAC4: @ 839AAC4
	.incbin "baserom.gba", 0x0039aac4, 0x8

	.global gUnknown_0839AACC
gUnknown_0839AACC: @ 839AACC
	.incbin "baserom.gba", 0x0039aacc, 0x38

	.global gUnknown_0839AB04
gUnknown_0839AB04: @ 839AB04
	.incbin "baserom.gba", 0x0039ab04, 0x8c

	.global gUnknown_0839AB90
gUnknown_0839AB90: @ 839AB90
	.incbin "baserom.gba", 0x0039ab90, 0x18

	.global gUnknown_0839ABA8
gUnknown_0839ABA8: @ 839ABA8
	.incbin "baserom.gba", 0x0039aba8, 0x8

	.global gUnknown_0839ABB0
gUnknown_0839ABB0: @ 839ABB0
	.incbin "baserom.gba", 0x0039abb0, 0x20

	.global gUnknown_0839ABD0
gUnknown_0839ABD0: @ 839ABD0
	.incbin "baserom.gba", 0x0039abd0, 0x18

	.global gUnknown_0839ABE8
gUnknown_0839ABE8: @ 839ABE8
	.incbin "baserom.gba", 0x0039abe8, 0x1c

	.global gUnknown_0839AC04
gUnknown_0839AC04: @ 839AC04
	.incbin "baserom.gba", 0x0039ac04, 0x38

	.global gUnknown_0839AC3C
gUnknown_0839AC3C: @ 839AC3C
	.incbin "baserom.gba", 0x0039ac3c, 0x18

	.global gUnknown_0839AC54
gUnknown_0839AC54: @ 839AC54
	.incbin "baserom.gba", 0x0039ac54, 0x8

	.global gUnknown_0839AC5C
gUnknown_0839AC5C: @ 839AC5C
	.incbin "baserom.gba", 0x0039ac5c, 0xc

	.global gUnknown_0839AC68
gUnknown_0839AC68: @ 839AC68
	.incbin "baserom.gba", 0x0039ac68, 0x8

	.global gUnknown_0839AC70
gUnknown_0839AC70: @ 839AC70
	.incbin "baserom.gba", 0x0039ac70, 0x8

	.global gUnknown_0839AC78
gUnknown_0839AC78: @ 839AC78
	.incbin "baserom.gba", 0x0039ac78, 0x44

	.global gUnknown_0839ACBC
gUnknown_0839ACBC: @ 839ACBC
	.incbin "baserom.gba", 0x0039acbc, 0x18

	.global gUnknown_0839ACD4
gUnknown_0839ACD4: @ 839ACD4
	.incbin "baserom.gba", 0x0039acd4, 0x4

	.global gUnknown_0839ACD8
gUnknown_0839ACD8: @ 839ACD8
	.incbin "baserom.gba", 0x0039acd8, 0x4

	.global gUnknown_0839ACDC
gUnknown_0839ACDC: @ 839ACDC
	.incbin "baserom.gba", 0x0039acdc, 0xc

	.global gUnknown_0839ACE8
gUnknown_0839ACE8: @ 839ACE8
	.incbin "baserom.gba", 0x0039ace8, 0x4

	.global gUnknown_0839ACEC
gUnknown_0839ACEC: @ 839ACEC
	.incbin "baserom.gba", 0x0039acec, 0xc

	.global gUnknown_0839ACF8
gUnknown_0839ACF8: @ 839ACF8
	.incbin "baserom.gba", 0x0039acf8, 0x8

	.global gUnknown_0839AD00
gUnknown_0839AD00: @ 839AD00
	.incbin "baserom.gba", 0x0039ad00, 0x8

	.global gUnknown_0839AD08
gUnknown_0839AD08: @ 839AD08
	.incbin "baserom.gba", 0x0039ad08, 0x48

	.global gUnknown_0839AD50
gUnknown_0839AD50: @ 839AD50
	.incbin "baserom.gba", 0x0039ad50, 0x48

	.global gUnknown_0839AD98
gUnknown_0839AD98: @ 839AD98
	.incbin "baserom.gba", 0x0039ad98, 0x48

	.global gUnknown_0839ADE0
gUnknown_0839ADE0: @ 839ADE0
	.incbin "baserom.gba", 0x0039ade0, 0x48

	.global gUnknown_0839AE28
gUnknown_0839AE28: @ 839AE28
	.incbin "baserom.gba", 0x0039ae28, 0x48

	.global gUnknown_0839AE70
gUnknown_0839AE70: @ 839AE70
	.incbin "baserom.gba", 0x0039ae70, 0x380

	.global gUnknown_0839B1F0
gUnknown_0839B1F0: @ 839B1F0
	.incbin "baserom.gba", 0x0039b1f0, 0x2c

	.global gUnknown_0839B21C
gUnknown_0839B21C: @ 839B21C
	.incbin "baserom.gba", 0x0039b21c, 0x10

	.global gUnknown_0839B22C
gUnknown_0839B22C: @ 839B22C
	.incbin "baserom.gba", 0x0039b22c, 0x1e

	.global gUnknown_0839B24A
gUnknown_0839B24A: @ 839B24A
	.incbin "baserom.gba", 0x0039b24a, 0x3

	.global gUnknown_0839B24D
gUnknown_0839B24D: @ 839B24D
	.incbin "baserom.gba", 0x0039b24d, 0x8

	.global gUnknown_0839B255
gUnknown_0839B255: @ 839B255
	.incbin "baserom.gba", 0x0039b255, 0x2

	.global gUnknown_0839B257
gUnknown_0839B257: @ 839B257
	.incbin "baserom.gba", 0x0039b257, 0x69

	.global gUnknown_0839B2C0
gUnknown_0839B2C0: @ 839B2C0
	.incbin "baserom.gba", 0x0039b2c0, 0x1c8

	.global gUnknown_0839B488
gUnknown_0839B488: @ 839B488
	.incbin "baserom.gba", 0x0039b488, 0x10

	.global gUnknown_0839B498
gUnknown_0839B498: @ 839B498
	.incbin "baserom.gba", 0x0039b498, 0x30

	.global gUnknown_0839B4C8
gUnknown_0839B4C8: @ 839B4C8
	.incbin "baserom.gba", 0x0039b4c8, 0x48

	.global gUnknown_0839B510
gUnknown_0839B510: @ 839B510
	.incbin "baserom.gba", 0x0039b510, 0x18

	.global gUnknown_0839B528
gUnknown_0839B528: @ 839B528
	.incbin "baserom.gba", 0x0039b528, 0x1f2c

	.global gUnknown_0839D454
gUnknown_0839D454: @ 839D454
	.incbin "baserom.gba", 0x0039d454, 0x7a8

	.global gUnknown_0839DBFC
gUnknown_0839DBFC: @ 839DBFC
	.incbin "baserom.gba", 0x0039dbfc, 0x4

	.global gUnknown_0839DC00
gUnknown_0839DC00: @ 839DC00
	.incbin "baserom.gba", 0x0039dc00, 0x854

	.align 2
gFieldEffectObjectPalette4: @ 839E454
	.incbin "graphics/field_effect_objects/palettes/04.gbapal"

	.incbin "baserom.gba", 0x39e474, 0x480

	.align 2
gFieldEffectObjectPalette5: @ 839E8F4
	.incbin "graphics/field_effect_objects/palettes/05.gbapal"

	.global gUnknown_0839E914
gUnknown_0839E914: @ 839E914
	.incbin "baserom.gba", 0x0039e914, 0x200

	.global gUnknown_0839EB14
gUnknown_0839EB14: @ 839EB14
	.incbin "baserom.gba", 0x0039eb14, 0x20

	.global gUnknown_0839EB34
gUnknown_0839EB34: @ 839EB34
	.incbin "baserom.gba", 0x0039eb34, 0x280

	.global gUnknown_0839EDB4
gUnknown_0839EDB4: @ 839EDB4
	.incbin "baserom.gba", 0x0039edb4, 0x80

	.global gUnknown_0839EE34
gUnknown_0839EE34: @ 839EE34
	.incbin "baserom.gba", 0x0039ee34, 0x20

	.global gUnknown_0839EE54
gUnknown_0839EE54: @ 839EE54
	.incbin "baserom.gba", 0x0039ee54, 0x280

	.global gUnknown_0839F0D4
gUnknown_0839F0D4: @ 839F0D4
	.incbin "baserom.gba", 0x0039f0d4, 0x20

	.global gUnknown_0839F0F4
gUnknown_0839F0F4: @ 839F0F4
	.incbin "baserom.gba", 0x0039f0f4, 0x20

	.global gUnknown_0839F114
gUnknown_0839F114: @ 839F114
	.incbin "baserom.gba", 0x0039f114, 0x14

	.global gUnknown_0839F128
gUnknown_0839F128: @ 839F128
	.incbin "baserom.gba", 0x0039f128, 0x18

	.align 2
	.global gFieldEffectObjectPaletteInfo4
gFieldEffectObjectPaletteInfo4: @ 839F140
	obj_pal gFieldEffectObjectPalette4, 0x1007

	.align 2
	.global gFieldEffectObjectPaletteInfo5
gFieldEffectObjectPaletteInfo5: @ 839F148
	obj_pal gFieldEffectObjectPalette5, 0x1010

	.incbin "baserom.gba", 0x39F150, 0x50

	.global gUnknown_0839F1A0
gUnknown_0839F1A0: @ 839F1A0
	.incbin "baserom.gba", 0x0039f1a0, 0x28

	.global gUnknown_0839F1C8
gUnknown_0839F1C8: @ 839F1C8
	.incbin "baserom.gba", 0x0039f1c8, 0x40

	.global gUnknown_0839F208
gUnknown_0839F208: @ 839F208
	.incbin "baserom.gba", 0x0039f208, 0x18

	.global gUnknown_0839F220
gUnknown_0839F220: @ 839F220
	.incbin "baserom.gba", 0x0039f220, 0x18

	.global gUnknown_0839F238
gUnknown_0839F238: @ 839F238
	.incbin "baserom.gba", 0x0039f238, 0x18

	.global gUnknown_0839F250
gUnknown_0839F250: @ 839F250
	.incbin "baserom.gba", 0x0039f250, 0x18

	.global gUnknown_0839F268
gUnknown_0839F268: @ 839F268
	.incbin "baserom.gba", 0x0039f268, 0x10

	.global gUnknown_0839F278
gUnknown_0839F278: @ 839F278
	.incbin "baserom.gba", 0x0039f278, 0x10

	.global gUnknown_0839F288
gUnknown_0839F288: @ 839F288
	.incbin "baserom.gba", 0x0039f288, 0x20

	.global gUnknown_0839F2A8
gUnknown_0839F2A8: @ 839F2A8
	.incbin "baserom.gba", 0x0039f2a8, 0x18

	.global gUnknown_0839F2C0
gUnknown_0839F2C0: @ 839F2C0
	.incbin "baserom.gba", 0x0039f2c0, 0x4

	.global gUnknown_0839F2C4
gUnknown_0839F2C4: @ 839F2C4
	.incbin "baserom.gba", 0x0039f2c4, 0x4

	.global gUnknown_0839F2C8
gUnknown_0839F2C8: @ 839F2C8
	.incbin "baserom.gba", 0x0039f2c8, 0x4

	.global gUnknown_0839F2CC
gUnknown_0839F2CC: @ 839F2CC
	.incbin "baserom.gba", 0x0039f2cc, 0x1c

	.global gUnknown_0839F2E8
gUnknown_0839F2E8: @ 839F2E8
	.incbin "baserom.gba", 0x0039f2e8, 0x18

	.global gUnknown_0839F300
gUnknown_0839F300: @ 839F300
	.incbin "baserom.gba", 0x0039f300, 0x1c

	.global gUnknown_0839F31C
gUnknown_0839F31C: @ 839F31C
	.incbin "baserom.gba", 0x0039f31c, 0x14

	.global gUnknown_0839F330
gUnknown_0839F330: @ 839F330
	.incbin "baserom.gba", 0x0039f330, 0xc

	.global gUnknown_0839F33C
gUnknown_0839F33C: @ 839F33C
	.incbin "baserom.gba", 0x0039f33c, 0x18

	.global gUnknown_0839F354
gUnknown_0839F354: @ 839F354
	.incbin "baserom.gba", 0x0039f354, 0x10

	.global gUnknown_0839F364
gUnknown_0839F364: @ 839F364
	.incbin "baserom.gba", 0x0039f364, 0x14

	.global gUnknown_0839F378
gUnknown_0839F378: @ 839F378
	.incbin "baserom.gba", 0x0039f378, 0x8

	.global gUnknown_0839F380
gUnknown_0839F380: @ 839F380
	.incbin "baserom.gba", 0x0039f380, 0x8

	.global gUnknown_0839F388
gUnknown_0839F388: @ 839F388
	.incbin "baserom.gba", 0x0039f388, 0x8

	.global gUnknown_0839F390
gUnknown_0839F390: @ 839F390
	.incbin "baserom.gba", 0x0039f390, 0x10

	.global gUnknown_0839F3A0
gUnknown_0839F3A0: @ 839F3A0
	.incbin "baserom.gba", 0x0039f3a0, 0xc

	.global gUnknown_0839F3AC
gUnknown_0839F3AC: @ 839F3AC
	.incbin "baserom.gba", 0x0039f3ac, 0x1c

	.global gUnknown_0839F3C8
gUnknown_0839F3C8: @ 839F3C8
	.incbin "baserom.gba", 0x0039f3c8, 0x1c

	.global gUnknown_0839F3E4
gUnknown_0839F3E4: @ 839F3E4
	.incbin "baserom.gba", 0x0039f3e4, 0x14

	.global gUnknown_0839F3F8
gUnknown_0839F3F8: @ 839F3F8
	.incbin "baserom.gba", 0x0039f3f8, 0x54

	.global gUnknown_0839F44C
gUnknown_0839F44C: @ 839F44C
	.incbin "baserom.gba", 0x0039f44c, 0x8

	.global gUnknown_0839F454
gUnknown_0839F454: @ 839F454
	.incbin "baserom.gba", 0x0039f454, 0x1c

	.global gUnknown_0839F470
gUnknown_0839F470: @ 839F470
	.incbin "baserom.gba", 0x0039f470, 0x24

	.global gUnknown_0839F494
gUnknown_0839F494: @ 839F494
	.incbin "baserom.gba", 0x0039f494, 0xc0

	.global gUnknown_0839F554
gUnknown_0839F554: @ 839F554
	.incbin "baserom.gba", 0x0039f554, 0x24

	.global gUnknown_0839F578
gUnknown_0839F578: @ 839F578
	.incbin "baserom.gba", 0x0039f578, 0xc

	.global gUnknown_0839F584
gUnknown_0839F584: @ 839F584
	.incbin "baserom.gba", 0x0039f584, 0x8

	.global gUnknown_0839F58C
gUnknown_0839F58C: @ 839F58C
	.incbin "baserom.gba", 0x0039f58c, 0x70

	.global gUnknown_0839F5FC
gUnknown_0839F5FC: @ 839F5FC
	.incbin "baserom.gba", 0x0039f5fc, 0x40

	.global gUnknown_0839F63C
gUnknown_0839F63C: @ 839F63C
	.incbin "baserom.gba", 0x0039f63c, 0x42

	.global gUnknown_0839F67E
gUnknown_0839F67E: @ 839F67E
	.incbin "baserom.gba", 0x0039f67e, 0xc0

	.global gUnknown_0839F73E
gUnknown_0839F73E: @ 839F73E
	.incbin "baserom.gba", 0x0039f73e, 0x162

	.global gUnknown_0839F8A0
gUnknown_0839F8A0: @ 839F8A0
	.incbin "baserom.gba", 0x0039f8a0, 0xe8

	.global gUnknown_0839F988
gUnknown_0839F988: @ 839F988
	.incbin "baserom.gba", 0x0039f988, 0xf4

	.global gUnknown_0839FA7C
gUnknown_0839FA7C: @ 839FA7C
	.incbin "baserom.gba", 0x0039fa7c, 0x48

	.global gUnknown_0839FAC4
gUnknown_0839FAC4: @ 839FAC4
	.incbin "baserom.gba", 0x0039fac4, 0x336

	.global gUnknown_0839FDFA
gUnknown_0839FDFA: @ 839FDFA
	.incbin "baserom.gba", 0x0039fdfa, 0x304

	.global gUnknown_083A00FE
gUnknown_083A00FE: @ 83A00FE
	.incbin "baserom.gba", 0x003a00fe, 0x426

	.global gUnknown_083A0524
gUnknown_083A0524: @ 83A0524
	.incbin "baserom.gba", 0x003a0524, 0x18

	.global gUnknown_083A053C
gUnknown_083A053C: @ 83A053C
	.incbin "baserom.gba", 0x003a053c, 0x18

	.global gUnknown_083A0554
gUnknown_083A0554: @ 83A0554
	.incbin "baserom.gba", 0x003a0554, 0x18

	.global gUnknown_083A056C
gUnknown_083A056C: @ 83A056C
	.incbin "baserom.gba", 0x003a056c, 0x18

	.global gUnknown_083A0584
gUnknown_083A0584: @ 83A0584
	.incbin "baserom.gba", 0x003a0584, 0x18

	.global gUnknown_083A059C
gUnknown_083A059C: @ 83A059C
	.incbin "baserom.gba", 0x003a059c, 0x18

	.global gUnknown_083A05B4
gUnknown_083A05B4: @ 83A05B4
	.incbin "baserom.gba", 0x003a05b4, 0x18

	.global gUnknown_083A05CC
gUnknown_083A05CC: @ 83A05CC
	.incbin "baserom.gba", 0x003a05cc, 0x10

	.global gUnknown_083A05DC
gUnknown_083A05DC: @ 83A05DC
	.incbin "baserom.gba", 0x003a05dc, 0x10

	.global gUnknown_083A05EC
gUnknown_083A05EC: @ 83A05EC
	.incbin "baserom.gba", 0x003a05ec, 0x5

	.global gUnknown_083A05F1
gUnknown_083A05F1: @ 83A05F1
	.incbin "baserom.gba", 0x003a05f1, 0x7

	.global gUnknown_083A05F8
gUnknown_083A05F8: @ 83A05F8
	.string "$"

@ 83A05F9
	.include "data/pokedex_entries.s"

	.global gUnknown_083B4EC4
gUnknown_083B4EC4: @ 83B4EC4
	.incbin "baserom.gba", 0x003b4ec4, 0x20

@ 83B4EE4
	.include "data/graphics/pokemon/footprint_table.s"

	.global gUnknown_083B5558
gUnknown_083B5558: @ 83B5558
	.incbin "baserom.gba", 0x003b5558, 0x2c

	.global gUnknown_083B5584
gUnknown_083B5584: @ 83B5584
	.incbin "baserom.gba", 0x003b5584, 0x210

	.global gUnknown_083B5794
gUnknown_083B5794: @ 83B5794
	.incbin "baserom.gba", 0x003b5794, 0x10

	.global gUnknown_083B57A4
gUnknown_083B57A4: @ 83B57A4
	.incbin "baserom.gba", 0x003b57a4, 0x18

	.global gUnknown_083B57BC
gUnknown_083B57BC: @ 83B57BC
	.incbin "baserom.gba", 0x003b57bc, 0x28

	.global gUnknown_083B57E4
gUnknown_083B57E4: @ 83B57E4
	.incbin "baserom.gba", 0x003b57e4, 0x18

	.global gUnknown_083B57FC
gUnknown_083B57FC: @ 83B57FC
	.incbin "baserom.gba", 0x003b57fc, 0x54

	.global gUnknown_083B5850
gUnknown_083B5850: @ 83B5850
	.incbin "baserom.gba", 0x003b5850, 0x1c

	.global gUnknown_083B586C
gUnknown_083B586C: @ 83B586C
	.incbin "baserom.gba", 0x003b586c, 0x1c

	.global gUnknown_083B5888
gUnknown_083B5888: @ 83B5888
	.incbin "baserom.gba", 0x003b5888, 0x1c

	.global gUnknown_083B58A4
gUnknown_083B58A4: @ 83B58A4
	.incbin "baserom.gba", 0x003b58a4, 0x1c

	.global gUnknown_083B58C0
gUnknown_083B58C0: @ 83B58C0
	.incbin "baserom.gba", 0x003b58c0, 0x18

	.global gUnknown_083B58D8
gUnknown_083B58D8: @ 83B58D8
	.incbin "baserom.gba", 0x003b58d8, 0x38

	.global gUnknown_083B5910
gUnknown_083B5910: @ 83B5910
	.incbin "baserom.gba", 0x003b5910, 0x58

	.global gUnknown_083B5968
gUnknown_083B5968: @ 83B5968
	.incbin "baserom.gba", 0x003b5968, 0x60

	.global gUnknown_083B59C8
gUnknown_083B59C8: @ 83B59C8
	.incbin "baserom.gba", 0x003b59c8, 0x98

	.global gUnknown_083B5A60
gUnknown_083B5A60: @ 83B5A60
	.incbin "baserom.gba", 0x003b5a60, 0x2

	.global gUnknown_083B5A62
gUnknown_083B5A62: @ 83B5A62
	.incbin "baserom.gba", 0x003b5a62, 0x6

	.global gUnknown_083B5A68
gUnknown_083B5A68: @ 83B5A68
	.incbin "baserom.gba", 0x003b5a68, 0x14

	.global gUnknown_083B5A7C
gUnknown_083B5A7C: @ 83B5A7C
	.incbin "baserom.gba", 0x003b5a7c, 0x30

	.global gUnknown_083B5AAC
gUnknown_083B5AAC: @ 83B5AAC
	.incbin "baserom.gba", 0x003b5aac, 0x6

	.global gUnknown_083B5AB2
gUnknown_083B5AB2: @ 83B5AB2
	.incbin "baserom.gba", 0x003b5ab2, 0x6

	.global gUnknown_083B5AB8
gUnknown_083B5AB8: @ 83B5AB8
	.incbin "baserom.gba", 0x003b5ab8, 0x404

	.global gUnknown_083B5EBC
gUnknown_083B5EBC: @ 83B5EBC
	.incbin "baserom.gba", 0x003b5ebc, 0x1c

	.global gUnknown_083B5ED8
gUnknown_083B5ED8: @ 83B5ED8
	.incbin "baserom.gba", 0x003b5ed8, 0x14

	.global gUnknown_083B5EEC
gUnknown_083B5EEC: @ 83B5EEC
	.incbin "baserom.gba", 0x003b5eec, 0x8

	.global gUnknown_083B5EF4
gUnknown_083B5EF4: @ 83B5EF4
	.incbin "baserom.gba", 0x003b5ef4, 0x4

	.global gUnknown_083B5EF8
gUnknown_083B5EF8: @ 83B5EF8
	.incbin "baserom.gba", 0x003b5ef8, 0x14

	.global gUnknown_083B5F0C
gUnknown_083B5F0C: @ 83B5F0C
	.incbin "baserom.gba", 0x003b5f0c, 0x20

	.global gUnknown_083B5F2C
gUnknown_083B5F2C: @ 83B5F2C
	.incbin "baserom.gba", 0x003b5f2c, 0x20

	.global gUnknown_083B5F4C
gUnknown_083B5F4C: @ 83B5F4C
	.incbin "baserom.gba", 0x003b5f4c, 0x20

	.global gUnknown_083B5F6C
gUnknown_083B5F6C: @ 83B5F6C
	.incbin "baserom.gba", 0x003b5f6c, 0x20

	.global gUnknown_083B5F8C
gUnknown_083B5F8C: @ 83B5F8C
	.incbin "baserom.gba", 0x003b5f8c, 0x40

	.global gUnknown_083B5FCC
gUnknown_083B5FCC: @ 83B5FCC
	.incbin "baserom.gba", 0x003b5fcc, 0x28

	.global gUnknown_083B5FF4
gUnknown_083B5FF4: @ 83B5FF4
	.incbin "baserom.gba", 0x003b5ff4, 0x18

	.global gUnknown_083B600C
gUnknown_083B600C: @ 83B600C
	.incbin "baserom.gba", 0x003b600c, 0x40

	.global gUnknown_083B604C
gUnknown_083B604C: @ 83B604C
	.incbin "baserom.gba", 0x003b604c, 0x24

	.global gUnknown_083B6070
gUnknown_083B6070: @ 83B6070
	.incbin "baserom.gba", 0x003b6070, 0x20

	.global gUnknown_083B6090
gUnknown_083B6090: @ 83B6090
	.incbin "baserom.gba", 0x003b6090, 0x800

	.global gUnknown_083B6890
gUnknown_083B6890: @ 83B6890
	.incbin "baserom.gba", 0x003b6890, 0x180

	.global gUnknown_083B6A10
gUnknown_083B6A10: @ 83B6A10
	.incbin "baserom.gba", 0x003b6a10, 0x20

	.global gUnknown_083B6A30
gUnknown_083B6A30: @ 83B6A30
	.incbin "baserom.gba", 0x003b6a30, 0x20

	.global gUnknown_083B6A50
gUnknown_083B6A50: @ 83B6A50
	.incbin "baserom.gba", 0x003b6a50, 0x324

	.global gUnknown_083B6D74
gUnknown_083B6D74: @ 83B6D74
	.incbin "baserom.gba", 0x003b6d74, 0x20

	.global gUnknown_083B6D94
gUnknown_083B6D94: @ 83B6D94
	.incbin "baserom.gba", 0x003b6d94, 0x20

	.global gUnknown_083B6DB4
gUnknown_083B6DB4: @ 83B6DB4
	.incbin "baserom.gba", 0x003b6db4, 0x4

	.global gUnknown_083B6DB8
gUnknown_083B6DB8: @ 83B6DB8
	.incbin "baserom.gba", 0x003b6db8, 0x4

	.global gUnknown_083B6DBC
gUnknown_083B6DBC: @ 83B6DBC
	.incbin "baserom.gba", 0x003b6dbc, 0x8

	.global gUnknown_083B6DC4
gUnknown_083B6DC4: @ 83B6DC4
	.incbin "baserom.gba", 0x003b6dc4, 0x8

	.global gUnknown_083B6DCC
gUnknown_083B6DCC: @ 83B6DCC
	.incbin "baserom.gba", 0x003b6dcc, 0x8

	.global gUnknown_083B6DD4
gUnknown_083B6DD4: @ 83B6DD4
	.incbin "baserom.gba", 0x003b6dd4, 0x8

	.global gUnknown_083B6DDC
gUnknown_083B6DDC: @ 83B6DDC
	.incbin "baserom.gba", 0x003b6ddc, 0x18

	.global gUnknown_083B6DF4
gUnknown_083B6DF4: @ 83B6DF4
	.incbin "baserom.gba", 0x003b6df4, 0x108

	.global gUnknown_083B6EFC
gUnknown_083B6EFC: @ 83B6EFC
	.incbin "baserom.gba", 0x003b6efc, 0x18

	.global gUnknown_083B6F14
gUnknown_083B6F14: @ 83B6F14
	.incbin "baserom.gba", 0x003b6f14, 0x48

	.global gUnknown_083B6F5C
gUnknown_083B6F5C: @ 83B6F5C
	.incbin "baserom.gba", 0x003b6f5c, 0x414c

	.global gUnknown_083BB0A8
gUnknown_083BB0A8: @ 83BB0A8
	.incbin "baserom.gba", 0x003bb0a8, 0x40

	.global gUnknown_083BB0E8
gUnknown_083BB0E8: @ 83BB0E8
	.incbin "baserom.gba", 0x003bb0e8, 0x1a0

	.global gUnknown_083BB288
gUnknown_083BB288: @ 83BB288
	.incbin "baserom.gba", 0x003bb288, 0x8

	.global gUnknown_083BB290
gUnknown_083BB290: @ 83BB290
	.incbin "baserom.gba", 0x003bb290, 0x28

	.global gUnknown_083BB2B8
gUnknown_083BB2B8: @ 83BB2B8
	.incbin "baserom.gba", 0x003bb2b8, 0x38

	.global gUnknown_083BB2F0
gUnknown_083BB2F0: @ 83BB2F0
	.incbin "baserom.gba", 0x003bb2f0, 0x8d8

	.global gUnknown_083BBBC8
gUnknown_083BBBC8: @ 83BBBC8
	.incbin "baserom.gba", 0x003bbbc8, 0xc

	.global gUnknown_083BBBD4
gUnknown_083BBBD4: @ 83BBBD4
	.incbin "baserom.gba", 0x003bbbd4, 0x28

	.global gUnknown_083BBBFC
gUnknown_083BBBFC: @ 83BBBFC
	.incbin "baserom.gba", 0x003bbbfc, 0x18

	.global gUnknown_083BBC14
gUnknown_083BBC14: @ 83BBC14
	.incbin "baserom.gba", 0x003bbc14, 0x5c

	.global gUnknown_083BBC70
gUnknown_083BBC70: @ 83BBC70
	.incbin "baserom.gba", 0x003bbc70, 0x18

	.global gUnknown_083BBC88
gUnknown_083BBC88: @ 83BBC88
	.incbin "baserom.gba", 0x003bbc88, 0x18

	.global gUnknown_083BBCA0
gUnknown_083BBCA0: @ 83BBCA0
	.incbin "baserom.gba", 0x003bbca0, 0x80

@ 83BBD20
	.include "data/graphics/pokemon/icon_table.s"

@ 83BC400
	.include "data/graphics/pokemon/icon_palette_indices.s"

@ 83BC5B8
	.include "data/graphics/pokemon/icon_palette_table.s"

	.global gUnknown_083BC5E8
gUnknown_083BC5E8: @ 83BC5E8
	.incbin "baserom.gba", 0x003bc5e8, 0x44

	.global gUnknown_083BC62C
gUnknown_083BC62C: @ 83BC62C
	.incbin "baserom.gba", 0x003bc62c, 0x34

	.global gUnknown_083BC660
gUnknown_083BC660: @ 83BC660
	.incbin "baserom.gba", 0x003bc660, 0x8

	.global gUnknown_083BC668
gUnknown_083BC668: @ 83BC668
	.incbin "baserom.gba", 0x003bc668, 0x18

@ 83BC680
	.include "data/text/move_descriptions.s"

@ 83C0F60
	.include "data/text/nature_names.s"

	.global gUnknown_083C1068
gUnknown_083C1068: @ 83C1068
	.incbin "baserom.gba", 0x003c1068, 0x150

	.global gUnknown_083C11B8
gUnknown_083C11B8: @ 83C11B8
	.incbin "baserom.gba", 0x003c11b8, 0x8

	.global gUnknown_083C11C0
gUnknown_083C11C0: @ 83C11C0
	.incbin "baserom.gba", 0x003c11c0, 0x18

	.global gUnknown_083C11D8
gUnknown_083C11D8: @ 83C11D8
	.incbin "baserom.gba", 0x003c11d8, 0x98

	.global gUnknown_083C1270
gUnknown_083C1270: @ 83C1270
	.incbin "baserom.gba", 0x003c1270, 0x8

	.global gUnknown_083C1278
gUnknown_083C1278: @ 83C1278
	.incbin "baserom.gba", 0x003c1278, 0x8

	.global gUnknown_083C1280
gUnknown_083C1280: @ 83C1280
	.incbin "baserom.gba", 0x003c1280, 0x74

	.global gUnknown_083C12F4
gUnknown_083C12F4: @ 83C12F4
	.incbin "baserom.gba", 0x003c12f4, 0x8

	.global gUnknown_083C12FC
gUnknown_083C12FC: @ 83C12FC
	.incbin "baserom.gba", 0x003c12fc, 0x8

	.global gUnknown_083C1304
gUnknown_083C1304: @ 83C1304
	.incbin "baserom.gba", 0x003c1304, 0x18

	.global gUnknown_083C131C
gUnknown_083C131C: @ 83C131C
	.incbin "baserom.gba", 0x003c131c, 0x20

	.global gUnknown_083C133C
gUnknown_083C133C: @ 83C133C
	.incbin "baserom.gba", 0x003c133c, 0x140

	.global gUnknown_083C147C
gUnknown_083C147C: @ 83C147C
	.incbin "baserom.gba", 0x003c147c, 0x100

	.global gUnknown_083C157C
gUnknown_083C157C: @ 83C157C
	.incbin "baserom.gba", 0x003c157c, 0x2

	.global gUnknown_083C157E
gUnknown_083C157E: @ 83C157E
	.incbin "baserom.gba", 0x003c157e, 0x2

	.global gUnknown_083C1580
gUnknown_083C1580: @ 83C1580
	.incbin "baserom.gba", 0x003c1580, 0x8

	.global gUnknown_083C1588
gUnknown_083C1588: @ 83C1588
	.incbin "baserom.gba", 0x003c1588, 0x10

	.global gUnknown_083C1598
gUnknown_083C1598: @ 83C1598
	.incbin "baserom.gba", 0x003c1598, 0x10

	.global gUnknown_083C15A8
gUnknown_083C15A8: @ 83C15A8
	.incbin "baserom.gba", 0x003c15a8, 0x6

	.global gUnknown_083C15AE
gUnknown_083C15AE: @ 83C15AE
	.incbin "baserom.gba", 0x003c15ae, 0x6

	.global gUnknown_083C15B4
gUnknown_083C15B4: @ 83C15B4
	.incbin "baserom.gba", 0x003c15b4, 0x8

	.global gUnknown_083C15BC
gUnknown_083C15BC: @ 83C15BC
	.incbin "baserom.gba", 0x003c15bc, 0x3C

	.align 2
	.global gFieldEffectObjectPaletteInfo6
gFieldEffectObjectPaletteInfo6: @ 83C15F8
	obj_pal gFieldEffectObjectPalette6, 0x1000

	.global gUnknown_083C1600
gUnknown_083C1600: @ 83C1600
	.incbin "baserom.gba", 0x003c1600, 0x18

	.global gUnknown_083C1618
gUnknown_083C1618: @ 83C1618
	.incbin "baserom.gba", 0x003c1618, 0x28

	.global gUnknown_083C1640
gUnknown_083C1640: @ 83C1640
	.incbin "baserom.gba", 0x003c1640, 0x50

	.global gUnknown_083C1690
gUnknown_083C1690: @ 83C1690
	.incbin "baserom.gba", 0x003c1690, 0x1e

	.global gUnknown_083C16AE
gUnknown_083C16AE: @ 83C16AE
	.incbin "baserom.gba", 0x003c16ae, 0xa

	.global gUnknown_083C16B8
gUnknown_083C16B8: @ 83C16B8
	.incbin "baserom.gba", 0x003c16b8, 0x4

	.global gUnknown_083C16BC
gUnknown_083C16BC: @ 83C16BC
	.incbin "baserom.gba", 0x003c16bc, 0x38

	.global gUnknown_083C16F4
gUnknown_083C16F4: @ 83C16F4
	.incbin "baserom.gba", 0x003c16f4, 0x8

	.global gUnknown_083C16FC
gUnknown_083C16FC: @ 83C16FC
	.incbin "baserom.gba", 0x003c16fc, 0x8

	.global gUnknown_083C1704
gUnknown_083C1704: @ 83C1704
	.incbin "baserom.gba", 0x003c1704, 0x4

	.global gUnknown_083C1708
gUnknown_083C1708: @ 83C1708
	.incbin "baserom.gba", 0x003c1708, 0x2

	.global gUnknown_083C170A
gUnknown_083C170A: @ 83C170A
	.incbin "baserom.gba", 0x003c170a, 0x5ba

	.global gUnknown_083C1CC4
gUnknown_083C1CC4: @ 83C1CC4
	.incbin "baserom.gba", 0x003c1cc4, 0x4

	.global gUnknown_083C1CC8
gUnknown_083C1CC8: @ 83C1CC8
	.incbin "baserom.gba", 0x003c1cc8, 0x8

	.global gUnknown_083C1CD0
gUnknown_083C1CD0: @ 83C1CD0
	.incbin "baserom.gba", 0x003c1cd0, 0x8

	.global gUnknown_083C1CD8
gUnknown_083C1CD8: @ 83C1CD8
	.incbin "baserom.gba", 0x003c1cd8, 0x8

	.global gUnknown_083C1CE0
gUnknown_083C1CE0: @ 83C1CE0
	.incbin "baserom.gba", 0x003c1ce0, 0x40

	.global gUnknown_083C1D20
gUnknown_083C1D20: @ 83C1D20
	.incbin "baserom.gba", 0x003c1d20, 0x4

	.global gUnknown_083C1D24
gUnknown_083C1D24: @ 83C1D24
	.incbin "baserom.gba", 0x003c1d24, 0xc

	.global gUnknown_083C1D30
gUnknown_083C1D30: @ 83C1D30
	.incbin "baserom.gba", 0x003c1d30, 0x8

	.global gUnknown_083C1D38
gUnknown_083C1D38: @ 83C1D38
	.incbin "baserom.gba", 0x003c1d38, 0x3c

	.global gUnknown_083C1D74
gUnknown_083C1D74: @ 83C1D74
	.incbin "baserom.gba", 0x003c1d74, 0x90

	.global gUnknown_083C1E04
gUnknown_083C1E04: @ 83C1E04
	.incbin "baserom.gba", 0x003c1e04, 0x18

@ 83C1E1C
	.include "data/graphics/berries/graphics_table.s"

	.global gUnknown_083C1F74
gUnknown_083C1F74: @ 83C1F74
	.incbin "baserom.gba", 0x003c1f74, 0x8

	.global gUnknown_083C1F7C
gUnknown_083C1F7C: @ 83C1F7C
	.incbin "baserom.gba", 0x003c1f7c, 0x1c

	.global gUnknown_083C1F98
gUnknown_083C1F98: @ 83C1F98
	.incbin "baserom.gba", 0x003c1f98, 0x90

@ 83C2028
	.include "data/text/item_descriptions.s"

@ 83C5564
	.include "data/items.s"

@ 83C9150
@ Unreferenced debug strings.
	.string "テストです$" @ "test"
	.string "Contest$"
	.string "Contest results$"
	.string "パラメータへんこう$" @ "Change parameter"
	.string "わざ へんこう$" @ "Change move"
	.string "Contest (comm.)$"
	.string "Init comm. data$"
	.string "Set highest score$"
	.string "Reset highest score$"
	.string "Set all art museum items$"

	.align 2
	.global gUnknown_083C91F0
gUnknown_083C91F0: @ 83C91F0
	.incbin "baserom.gba", 0x003c91f0, 0x38

	.global gUnknown_083C9228
gUnknown_083C9228: @ 83C9228
	.incbin "baserom.gba", 0x003c9228, 0x46

	.global gUnknown_083C926E
gUnknown_083C926E: @ 83C926E
	.incbin "baserom.gba", 0x003c926e, 0x8

	.global gUnknown_083C9276
gUnknown_083C9276: @ 83C9276
	.incbin "baserom.gba", 0x003c9276, 0xc

	.global gUnknown_083C9282
gUnknown_083C9282: @ 83C9282
	.incbin "baserom.gba", 0x003c9282, 0xc

	.global gUnknown_083C928E
gUnknown_083C928E: @ 83C928E
	.incbin "baserom.gba", 0x003c928e, 0x8

	.global gUnknown_083C9296
gUnknown_083C9296: @ 83C9296
	.incbin "baserom.gba", 0x003c9296, 0x12

	.global gUnknown_083C92A8
gUnknown_083C92A8: @ 83C92A8
	.incbin "baserom.gba", 0x003c92a8, 0xc

	.global gUnknown_083C92B4
gUnknown_083C92B4: @ 83C92B4
	.incbin "baserom.gba", 0x003c92b4, 0x8

	.global gUnknown_083C92BC
gUnknown_083C92BC: @ 83C92BC
	.incbin "baserom.gba", 0x003c92bc, 0x10

	.global gUnknown_083C92CC
gUnknown_083C92CC: @ 83C92CC
	.incbin "baserom.gba", 0x003c92cc, 0x18

	.global gUnknown_083C92E4
gUnknown_083C92E4: @ 83C92E4
	.incbin "baserom.gba", 0x003c92e4, 0x48

	.global gUnknown_083C932C
gUnknown_083C932C: @ 83C932C
	.incbin "baserom.gba", 0x003c932c, 0xb

	.global gUnknown_083C9337
gUnknown_083C9337: @ 83C9337
	.incbin "baserom.gba", 0x003c9337, 0x4

	.global gUnknown_083C933B
gUnknown_083C933B: @ 83C933B
	.incbin "baserom.gba", 0x003c933b, 0x29

	.global gUnknown_083C9364
gUnknown_083C9364: @ 83C9364
	.incbin "baserom.gba", 0x003c9364, 0x50

	.global gUnknown_083C93B4
gUnknown_083C93B4: @ 83C93B4
	.incbin "baserom.gba", 0x003c93b4, 0x3c

	.global gUnknown_083C93F0
gUnknown_083C93F0: @ 83C93F0
	.incbin "baserom.gba", 0x003c93f0, 0x10

	.global gUnknown_083C9400
gUnknown_083C9400: @ 83C9400
	.incbin "baserom.gba", 0x003c9400, 0x8

	.global gUnknown_083C9408
gUnknown_083C9408: @ 83C9408
	.incbin "baserom.gba", 0x003c9408, 0xf00

	.global gUnknown_083CA308
gUnknown_083CA308: @ 83CA308
	.incbin "baserom.gba", 0x003ca308, 0x8

	.global gUnknown_083CA310
gUnknown_083CA310: @ 83CA310
	.incbin "baserom.gba", 0x003ca310, 0x8

	.global gUnknown_083CA318
gUnknown_083CA318: @ 83CA318
	.incbin "baserom.gba", 0x003ca318, 0x18

	.global gUnknown_083CA330
gUnknown_083CA330: @ 83CA330
	.incbin "baserom.gba", 0x003ca330, 0x8

	.global gUnknown_083CA338
gUnknown_083CA338: @ 83CA338
	.incbin "baserom.gba", 0x003ca338, 0x4

	.global gUnknown_083CA33C
gUnknown_083CA33C: @ 83CA33C
	.incbin "baserom.gba", 0x003ca33c, 0x4

	.global gUnknown_083CA340
gUnknown_083CA340: @ 83CA340
	.incbin "baserom.gba", 0x003ca340, 0x1

	.global gUnknown_083CA341
gUnknown_083CA341: @ 83CA341
	.incbin "baserom.gba", 0x003ca341, 0xf

	.global gUnknown_083CA350
gUnknown_083CA350: @ 83CA350
	.incbin "baserom.gba", 0x003ca350, 0x5c

	.global gUnknown_083CA3AC
gUnknown_083CA3AC: @ 83CA3AC
	.incbin "baserom.gba", 0x003ca3ac, 0x18

	.global gUnknown_083CA3C4
gUnknown_083CA3C4: @ 83CA3C4
	.incbin "baserom.gba", 0x003ca3c4, 0x20

	.global gUnknown_083CA3E4
gUnknown_083CA3E4: @ 83CA3E4
	.incbin "baserom.gba", 0x003ca3e4, 0x10

	.global gUnknown_083CA3F4
gUnknown_083CA3F4: @ 83CA3F4
	.incbin "baserom.gba", 0x003ca3f4, 0x70

	.global gUnknown_083CA464
gUnknown_083CA464: @ 83CA464
	.incbin "baserom.gba", 0x003ca464, 0x8

	.global gUnknown_083CA46C
gUnknown_083CA46C: @ 83CA46C
	.incbin "baserom.gba", 0x003ca46c, 0x8

	.global gUnknown_083CA474
gUnknown_083CA474: @ 83CA474
	.incbin "baserom.gba", 0x003ca474, 0x10

	.global gUnknown_083CA484
gUnknown_083CA484: @ 83CA484
	.incbin "baserom.gba", 0x003ca484, 0x20

	.global gUnknown_083CA4A4
gUnknown_083CA4A4: @ 83CA4A4
	.incbin "baserom.gba", 0x003ca4a4, 0x18

	.global gUnknown_083CA4BC
gUnknown_083CA4BC: @ 83CA4BC
	.incbin "baserom.gba", 0x003ca4bc, 0x8

	.global gUnknown_083CA4C4
gUnknown_083CA4C4: @ 83CA4C4
	.incbin "baserom.gba", 0x003ca4c4, 0x8

	.global gUnknown_083CA4CC
gUnknown_083CA4CC: @ 83CA4CC
	.incbin "baserom.gba", 0x003ca4cc, 0x8

	.global gUnknown_083CA4D4
gUnknown_083CA4D4: @ 83CA4D4
	.incbin "baserom.gba", 0x003ca4d4, 0x900

	.global gUnknown_083CADD4
gUnknown_083CADD4: @ 83CADD4
	.incbin "baserom.gba", 0x003cadd4, 0x19c

	.global gUnknown_083CAF70
gUnknown_083CAF70: @ 83CAF70
	.incbin "baserom.gba", 0x003caf70, 0x14

	.global gUnknown_083CAF84
gUnknown_083CAF84: @ 83CAF84
	.incbin "baserom.gba", 0x003caf84, 0x2a

	.global gUnknown_083CAFAE
gUnknown_083CAFAE: @ 83CAFAE
	.incbin "baserom.gba", 0x003cafae, 0x29

	.global gUnknown_083CAFD7
gUnknown_083CAFD7: @ 83CAFD7
	.incbin "baserom.gba", 0x003cafd7, 0x36

	.global gUnknown_083CB00D
gUnknown_083CB00D: @ 83CB00D
	.incbin "baserom.gba", 0x003cb00d, 0x1f

	.global gUnknown_083CB02C
gUnknown_083CB02C: @ 83CB02C
	.incbin "baserom.gba", 0x003cb02c, 0x2c4

	.global gUnknown_083CB2F0
gUnknown_083CB2F0: @ 83CB2F0
	.incbin "baserom.gba", 0x003cb2f0, 0xa62

	.global gUnknown_083CBD52
gUnknown_083CBD52: @ 83CBD52
	.incbin "baserom.gba", 0x003cbd52, 0x27

	.global gUnknown_083CBD79
gUnknown_083CBD79: @ 83CBD79
	.incbin "baserom.gba", 0x003cbd79, 0x24

	.global gUnknown_083CBD9D
gUnknown_083CBD9D: @ 83CBD9D
	.incbin "baserom.gba", 0x003cbd9d, 0x29

	.global gUnknown_083CBDC6
gUnknown_083CBDC6: @ 83CBDC6
	.incbin "baserom.gba", 0x003cbdc6, 0x19a

	.global gUnknown_083CBF60
gUnknown_083CBF60: @ 83CBF60
	.incbin "baserom.gba", 0x003cbf60, 0x115

	.global gUnknown_083CC075
gUnknown_083CC075: @ 83CC075
	.incbin "baserom.gba", 0x003cc075, 0x2b

	.global gUnknown_083CC0A0
gUnknown_083CC0A0: @ 83CC0A0
	.incbin "baserom.gba", 0x003cc0a0, 0x1c

	.global gUnknown_083CC0BC
gUnknown_083CC0BC: @ 83CC0BC
	.incbin "baserom.gba", 0x003cc0bc, 0x27

	.global gUnknown_083CC0E3
gUnknown_083CC0E3: @ 83CC0E3
	.incbin "baserom.gba", 0x003cc0e3, 0x20

	.global gUnknown_083CC103
gUnknown_083CC103: @ 83CC103
	.incbin "baserom.gba", 0x003cc103, 0x47

	.global gUnknown_083CC14A
gUnknown_083CC14A: @ 83CC14A
	.incbin "baserom.gba", 0x003cc14a, 0x24

	.global gUnknown_083CC16E
gUnknown_083CC16E: @ 83CC16E
	.incbin "baserom.gba", 0x003cc16e, 0x1a

	.global gUnknown_083CC188
gUnknown_083CC188: @ 83CC188
	.incbin "baserom.gba", 0x003cc188, 0xf8

	.global gUnknown_083CC280
gUnknown_083CC280: @ 83CC280
	.incbin "baserom.gba", 0x003cc280, 0x8

	.global gUnknown_083CC288
gUnknown_083CC288: @ 83CC288
	.incbin "baserom.gba", 0x003cc288, 0x8

	.global gUnknown_083CC290
gUnknown_083CC290: @ 83CC290
	.incbin "baserom.gba", 0x003cc290, 0x9

	.global gUnknown_083CC299
gUnknown_083CC299: @ 83CC299
	.incbin "baserom.gba", 0x003cc299, 0xa

	.global gUnknown_083CC2A3
gUnknown_083CC2A3: @ 83CC2A3
	.incbin "baserom.gba", 0x003cc2a3, 0x35

	.global gUnknown_083CC2D8
gUnknown_083CC2D8: @ 83CC2D8
	.incbin "baserom.gba", 0x003cc2d8, 0x14

	.global gUnknown_083CC2EC
gUnknown_083CC2EC: @ 83CC2EC
	.incbin "baserom.gba", 0x003cc2ec, 0x44

	.global gUnknown_083CC330
gUnknown_083CC330: @ 83CC330
	.incbin "baserom.gba", 0x003cc330, 0x25

	.global gUnknown_083CC355
gUnknown_083CC355: @ 83CC355
	.incbin "baserom.gba", 0x003cc355, 0xc

	.global gUnknown_083CC361
gUnknown_083CC361: @ 83CC361
	.incbin "baserom.gba", 0x003cc361, 0x3f

	.global gUnknown_083CC3A0
gUnknown_083CC3A0: @ 83CC3A0
	.incbin "baserom.gba", 0x003cc3a0, 0x7

	.global gUnknown_083CC3A7
gUnknown_083CC3A7: @ 83CC3A7
	.incbin "baserom.gba", 0x003cc3a7, 0x5

	.global gUnknown_083CC3AC
gUnknown_083CC3AC: @ 83CC3AC
	.incbin "baserom.gba", 0x003cc3ac, 0x8

	.global gUnknown_083CC3B4
gUnknown_083CC3B4: @ 83CC3B4
	.incbin "baserom.gba", 0x003cc3b4, 0xa0

	.global gUnknown_083CC454
gUnknown_083CC454: @ 83CC454
	.incbin "baserom.gba", 0x003cc454, 0x60

	.global gUnknown_083CC4B4
gUnknown_083CC4B4: @ 83CC4B4
	.incbin "baserom.gba", 0x003cc4b4, 0x20

	.global gUnknown_083CC4D4
gUnknown_083CC4D4: @ 83CC4D4
	.incbin "baserom.gba", 0x003cc4d4, 0x68

	.global gUnknown_083CC53C
gUnknown_083CC53C: @ 83CC53C
	.incbin "baserom.gba", 0x003cc53c, 0x60

	.global gUnknown_083CC59C
gUnknown_083CC59C: @ 83CC59C
	.incbin "baserom.gba", 0x003cc59c, 0x6

	.global gUnknown_083CC5A2
gUnknown_083CC5A2: @ 83CC5A2
	.incbin "baserom.gba", 0x003cc5a2, 0x2

	.global gUnknown_083CC5A4
gUnknown_083CC5A4: @ 83CC5A4
	.incbin "baserom.gba", 0x003cc5a4, 0x10

	.global gUnknown_083CC5B4
gUnknown_083CC5B4: @ 83CC5B4
	.incbin "baserom.gba", 0x003cc5b4, 0x1c

	.global gUnknown_083CC5D0
gUnknown_083CC5D0: @ 83CC5D0
	.incbin "baserom.gba", 0x003cc5d0, 0x100

	.global gUnknown_083CC6D0
gUnknown_083CC6D0: @ 83CC6D0
	.incbin "baserom.gba", 0x003cc6d0, 0x18

	.global gUnknown_083CC6E8
gUnknown_083CC6E8: @ 83CC6E8
	.incbin "baserom.gba", 0x003cc6e8, 0x3

	.global gUnknown_083CC6EB
gUnknown_083CC6EB: @ 83CC6EB
	.incbin "baserom.gba", 0x003cc6eb, 0x1d

	.global gUnknown_083CC708
gUnknown_083CC708: @ 83CC708
	.incbin "baserom.gba", 0x003cc708, 0x8

	.global gUnknown_083CC710
gUnknown_083CC710: @ 83CC710
	.incbin "baserom.gba", 0x003cc710, 0x4

	.global gUnknown_083CC714
gUnknown_083CC714: @ 83CC714
	.incbin "baserom.gba", 0x003cc714, 0x6

	.global gUnknown_083CC71A
gUnknown_083CC71A: @ 83CC71A
	.incbin "baserom.gba", 0x003cc71a, 0x6

	.global gUnknown_083CC720
gUnknown_083CC720: @ 83CC720
	.incbin "baserom.gba", 0x003cc720, 0x6

	.global gUnknown_083CC726
gUnknown_083CC726: @ 83CC726
	.incbin "baserom.gba", 0x003cc726, 0x6

	.global gUnknown_083CC72C
gUnknown_083CC72C: @ 83CC72C
	.incbin "baserom.gba", 0x003cc72c, 0x6

	.global gUnknown_083CC732
gUnknown_083CC732: @ 83CC732
	.incbin "baserom.gba", 0x003cc732, 0x6

	.global gUnknown_083CC738
gUnknown_083CC738: @ 83CC738
	.incbin "baserom.gba", 0x003cc738, 0x8

@ 83CC740
	.include "data/text/berry_descriptions.s"

@ 83CD2CC
	.include "data/berries.s"

	.global gUnknown_083CD780
gUnknown_083CD780: @ 83CD780
	.incbin "baserom.gba", 0x003cd780, 0x680

	.global gUnknown_083CDE00
gUnknown_083CDE00: @ 83CDE00
	.incbin "baserom.gba", 0x003cde00, 0x248

	.global gUnknown_083CE048
gUnknown_083CE048: @ 83CE048
	.incbin "baserom.gba", 0x003ce048, 0x1d0

	.global gUnknown_083CE218
gUnknown_083CE218: @ 83CE218
	.incbin "baserom.gba", 0x003ce218, 0x28

	.global gUnknown_083CE240
gUnknown_083CE240: @ 83CE240
	.incbin "baserom.gba", 0x003ce240, 0x10

	.global gUnknown_083CE250
gUnknown_083CE250: @ 83CE250
	.incbin "baserom.gba", 0x003ce250, 0x8

	.global gUnknown_083CE258
gUnknown_083CE258: @ 83CE258
	.incbin "baserom.gba", 0x003ce258, 0xa

	.global gUnknown_083CE262
gUnknown_083CE262: @ 83CE262
	.incbin "baserom.gba", 0x003ce262, 0xa

	.global gUnknown_083CE26C
gUnknown_083CE26C: @ 83CE26C
	.incbin "baserom.gba", 0x003ce26c, 0x8

	.global gUnknown_083CE274
gUnknown_083CE274: @ 83CE274
	.incbin "baserom.gba", 0x003ce274, 0x8

	.global gUnknown_083CE27C
gUnknown_083CE27C: @ 83CE27C
	.incbin "baserom.gba", 0x003ce27c, 0x10

	.global gUnknown_083CE28C
gUnknown_083CE28C: @ 83CE28C
	.incbin "baserom.gba", 0x003ce28c, 0x8

	.global gUnknown_083CE294
gUnknown_083CE294: @ 83CE294
	.incbin "baserom.gba", 0x003ce294, 0x1b

	.global gUnknown_083CE2AF
gUnknown_083CE2AF: @ 83CE2AF
	.incbin "baserom.gba", 0x003ce2af, 0x5

	.global gUnknown_083CE2B4
gUnknown_083CE2B4: @ 83CE2B4
	.incbin "baserom.gba", 0x003ce2b4, 0x10

	.global gUnknown_083CE2C4
gUnknown_083CE2C4: @ 83CE2C4
	.incbin "baserom.gba", 0x003ce2c4, 0x6

	.global gUnknown_083CE2CA
gUnknown_083CE2CA: @ 83CE2CA
	.incbin "baserom.gba", 0x003ce2ca, 0x6

	.global gUnknown_083CE2D0
gUnknown_083CE2D0: @ 83CE2D0
	.incbin "baserom.gba", 0x003ce2d0, 0x8

	.global gUnknown_083CE2D8
gUnknown_083CE2D8: @ 83CE2D8
	.incbin "baserom.gba", 0x003ce2d8, 0x8

	.global gUnknown_083CE2E0
gUnknown_083CE2E0: @ 83CE2E0
	.incbin "baserom.gba", 0x003ce2e0, 0x10

	.global gUnknown_083CE2F0
gUnknown_083CE2F0: @ 83CE2F0
	.incbin "baserom.gba", 0x003ce2f0, 0x18

	.global gUnknown_083CE308
gUnknown_083CE308: @ 83CE308
	.incbin "baserom.gba", 0x003ce308, 0x8

	.global gUnknown_083CE310
gUnknown_083CE310: @ 83CE310
	.incbin "baserom.gba", 0x003ce310, 0x18

	.global gUnknown_083CE328
gUnknown_083CE328: @ 83CE328
	.incbin "baserom.gba", 0x003ce328, 0x30

	.global gUnknown_083CE358
gUnknown_083CE358: @ 83CE358
	.incbin "baserom.gba", 0x003ce358, 0x10

	.global gUnknown_083CE368
gUnknown_083CE368: @ 83CE368
	.incbin "baserom.gba", 0x003ce368, 0x8

	.global gUnknown_083CE370
gUnknown_083CE370: @ 83CE370
	.incbin "baserom.gba", 0x003ce370, 0x28

	.global gUnknown_083CE398
gUnknown_083CE398: @ 83CE398
	.incbin "baserom.gba", 0x003ce398, 0x10

	.global gUnknown_083CE3A8
gUnknown_083CE3A8: @ 83CE3A8
	.incbin "baserom.gba", 0x003ce3a8, 0x1b0

	.global gUnknown_083CE558
gUnknown_083CE558: @ 83CE558
	.incbin "baserom.gba", 0x003ce558, 0x8

	.global gUnknown_083CE560
gUnknown_083CE560: @ 83CE560
	.incbin "baserom.gba", 0x003ce560, 0x18

	.global gUnknown_083CE578
gUnknown_083CE578: @ 83CE578
	.incbin "baserom.gba", 0x003ce578, 0x8

	.global gUnknown_083CE580
gUnknown_083CE580: @ 83CE580
	.incbin "baserom.gba", 0x003ce580, 0x48

	.global gUnknown_083CE5C8
gUnknown_083CE5C8: @ 83CE5C8
	.incbin "baserom.gba", 0x003ce5c8, 0x18

	.global gUnknown_083CE5E0
gUnknown_083CE5E0: @ 83CE5E0
	.incbin "baserom.gba", 0x003ce5e0, 0x18

	.global gUnknown_083CE5F8
gUnknown_083CE5F8: @ 83CE5F8
	.incbin "baserom.gba", 0x003ce5f8, 0x18

	.global gUnknown_083CE610
gUnknown_083CE610: @ 83CE610
	.incbin "baserom.gba", 0x003ce610, 0x18

	.global gUnknown_083CE628
gUnknown_083CE628: @ 83CE628
	.incbin "baserom.gba", 0x003ce628, 0x18

	.global gUnknown_083CE640
gUnknown_083CE640: @ 83CE640
	.incbin "baserom.gba", 0x003ce640, 0x18

	.global gUnknown_083CE658
gUnknown_083CE658: @ 83CE658
	.incbin "baserom.gba", 0x003ce658, 0x18

	.global gUnknown_083CE670
gUnknown_083CE670: @ 83CE670
	.incbin "baserom.gba", 0x003ce670, 0x18

	.global gUnknown_083CE688
gUnknown_083CE688: @ 83CE688
	.incbin "baserom.gba", 0x003ce688, 0x18

	.global gUnknown_083CE6A0
gUnknown_083CE6A0: @ 83CE6A0
	.incbin "baserom.gba", 0x003ce6a0, 0x68

	.global gUnknown_083CE708
gUnknown_083CE708: @ 83CE708
	.incbin "baserom.gba", 0x003ce708, 0x40

	.global gUnknown_083CE748
gUnknown_083CE748: @ 83CE748
	.incbin "baserom.gba", 0x003ce748, 0x4b0

	.global gUnknown_083CEBF8
gUnknown_083CEBF8: @ 83CEBF8
	.incbin "baserom.gba", 0x003cebf8, 0x4b0

	.global gUnknown_083CF0A8
gUnknown_083CF0A8: @ 83CF0A8
	.incbin "baserom.gba", 0x003cf0a8, 0x4c4

	.global gUnknown_083CF56C
gUnknown_083CF56C: @ 83CF56C
	.incbin "baserom.gba", 0x003cf56c, 0x18

	.global gUnknown_083CF584
gUnknown_083CF584: @ 83CF584
	.incbin "baserom.gba", 0x003cf584, 0x8

	.global gUnknown_083CF58C
gUnknown_083CF58C: @ 83CF58C
	.incbin "baserom.gba", 0x003cf58c, 0x8

	.global gUnknown_083CF594
gUnknown_083CF594: @ 83CF594
	.incbin "baserom.gba", 0x003cf594, 0xb18

	.global gUnknown_083D00AC
gUnknown_083D00AC: @ 83D00AC
	.incbin "baserom.gba", 0x003d00ac, 0xc0

	.global gUnknown_083D016C
gUnknown_083D016C: @ 83D016C
	.incbin "baserom.gba", 0x003d016c, 0x40

	.global gUnknown_083D01AC
gUnknown_083D01AC: @ 83D01AC
	.incbin "baserom.gba", 0x003d01ac, 0xc0

	.global gUnknown_083D026C
gUnknown_083D026C: @ 83D026C
	.incbin "baserom.gba", 0x003d026c, 0x4

	.global gUnknown_083D0270
gUnknown_083D0270: @ 83D0270
	.incbin "baserom.gba", 0x003d0270, 0x4

	.global gUnknown_083D0274
gUnknown_083D0274: @ 83D0274
	.incbin "baserom.gba", 0x003d0274, 0x4

	.global gUnknown_083D0278
gUnknown_083D0278: @ 83D0278
	.incbin "baserom.gba", 0x003d0278, 0x4

	.global gUnknown_083D027C
gUnknown_083D027C: @ 83D027C
	.incbin "baserom.gba", 0x003d027c, 0x4

	.global gUnknown_083D0280
gUnknown_083D0280: @ 83D0280
	.incbin "baserom.gba", 0x003d0280, 0x4

	.global gUnknown_083D0284
gUnknown_083D0284: @ 83D0284
	.incbin "baserom.gba", 0x003d0284, 0x4

	.global gUnknown_083D0288
gUnknown_083D0288: @ 83D0288
	.incbin "baserom.gba", 0x003d0288, 0x2

	.global gUnknown_083D028A
gUnknown_083D028A: @ 83D028A
	.incbin "baserom.gba", 0x003d028a, 0x6

	.global gUnknown_083D0290
gUnknown_083D0290: @ 83D0290
	.incbin "baserom.gba", 0x003d0290, 0x24

	.global gUnknown_083D02B4
gUnknown_083D02B4: @ 83D02B4
	.incbin "baserom.gba", 0x003d02b4, 0x6

	.global gUnknown_083D02BA
gUnknown_083D02BA: @ 83D02BA
	.incbin "baserom.gba", 0x003d02ba, 0xe

	.global gUnknown_083D02C8
gUnknown_083D02C8: @ 83D02C8
	.incbin "baserom.gba", 0x003d02c8, 0x9

	.global gUnknown_083D02D1
gUnknown_083D02D1: @ 83D02D1
	.string "BGM$"

	.global gUnknown_083D02D5
gUnknown_083D02D5: @ 83D02D5
	.string "SE $"

	.global gUnknown_083D02D9
gUnknown_083D02D9: @ 83D02D9
	.incbin "baserom.gba", 0x003d02d9, 0xd

	.global gUnknown_083D02E6
gUnknown_083D02E6: @ 83D02E6
	.string "L‥UP R‥DOWN$"

	.global gUnknown_083D02F2
gUnknown_083D02F2: @ 83D02F2
	.string "R‥DRIVER-TEST$"

	.global gUnknown_083D0300
gUnknown_083D0300: @ 83D0300
	.incbin "baserom.gba", 0x003d0300, 0x12

	.global gUnknown_083D0312
gUnknown_083D0312: @ 83D0312
	.incbin "baserom.gba", 0x003d0312, 0xa

	.global gUnknown_083D031C
gUnknown_083D031C: @ 83D031C
	.incbin "baserom.gba", 0x003d031c, 0xb

	.global gUnknown_083D0327
gUnknown_083D0327: @ 83D0327
	.string "VOICE‥‥‥‥$"

	.global gUnknown_083D0331
gUnknown_083D0331: @ 83D0331
	.string "VOLUME‥‥‥$"

	.global gUnknown_083D033B
gUnknown_083D033B: @ 83D033B
	.string "PANPOT‥‥‥$"

	.global gUnknown_083D0345
gUnknown_083D0345: @ 83D0345
	.string "PITCH‥‥‥‥$"

	.global gUnknown_083D034F
gUnknown_083D034F: @ 83D034F
	.string "LENGTH‥‥‥$"

	.global gUnknown_083D0359
gUnknown_083D0359: @ 83D0359
	.string "RELEASE‥‥$"

	.global gUnknown_083D0363
gUnknown_083D0363: @ 83D0363
	.string "PROGRESS‥$"

	.global gUnknown_083D036D
gUnknown_083D036D: @ 83D036D
	.string "CHORUS‥‥‥$"

	.global gUnknown_083D0377
gUnknown_083D0377: @ 83D0377
	.string "PRIORITY‥$"

	.global gUnknown_083D0381
gUnknown_083D0381: @ 83D0381
	.incbin "baserom.gba", 0x003d0381, 0x9

	.global gUnknown_083D038A
gUnknown_083D038A: @ 83D038A
	.incbin "baserom.gba", 0x003d038a, 0x9

	.global gUnknown_083D0393
gUnknown_083D0393: @ 83D0393
	.incbin "baserom.gba", 0x003d0393, 0x9

	.global gUnknown_083D039C
gUnknown_083D039C: @ 83D039C
	.incbin "baserom.gba", 0x003d039c, 0x40

	.global gUnknown_083D03DC
gUnknown_083D03DC: @ 83D03DC
	.incbin "baserom.gba", 0x003d03dc, 0x2

	.global gUnknown_083D03DE
gUnknown_083D03DE: @ 83D03DE
	.incbin "baserom.gba", 0x003d03de, 0x2

	.global gUnknown_083D03E0
gUnknown_083D03E0: @ 83D03E0
	.incbin "baserom.gba", 0x003d03e0, 0x18

	.global gUnknown_083D03F8
gUnknown_083D03F8: @ 83D03F8
	.incbin "baserom.gba", 0x003d03f8, 0x5

	.global gUnknown_083D03FD
gUnknown_083D03FD: @ 83D03FD
	.string "SE$"

	.global gUnknown_083D0400
gUnknown_083D0400: @ 83D0400
	.string "PAN$"

	.global gUnknown_083D0404
gUnknown_083D0404: @ 83D0404
	.string "  LR$"

	.global gUnknown_083D0409
gUnknown_083D0409: @ 83D0409
	.string "  RL$"

@ 83D040E
	.include "data/text/song_names.s"

	.global gUnknown_083D1358
gUnknown_083D1358: @ 83D1358
	.incbin "baserom.gba", 0x003d1358, 0x1c

	.global gUnknown_083D1374
gUnknown_083D1374: @ 83D1374
	.incbin "baserom.gba", 0x003d1374, 0x60

	.global gUnknown_083D13D4
gUnknown_083D13D4: @ 83D13D4
	.incbin "baserom.gba", 0x003d13d4, 0x10

	.global gUnknown_083D13E4
gUnknown_083D13E4: @ 83D13E4
	.incbin "baserom.gba", 0x003d13e4, 0x8

	.global gUnknown_083D13EC
gUnknown_083D13EC: @ 83D13EC
	.incbin "baserom.gba", 0x003d13ec, 0xc

	.global gUnknown_083D13F8
gUnknown_083D13F8: @ 83D13F8
	.incbin "baserom.gba", 0x003d13f8, 0x3c

	.global gUnknown_083D1434
gUnknown_083D1434: @ 83D1434
	.incbin "baserom.gba", 0x003d1434, 0x10

	.global gUnknown_083D1444
gUnknown_083D1444: @ 83D1444
	.incbin "baserom.gba", 0x003d1444, 0x10

	.global gUnknown_083D1454
gUnknown_083D1454: @ 83D1454
	.incbin "baserom.gba", 0x003d1454, 0x10

	.global gUnknown_083D1464
gUnknown_083D1464: @ 83D1464
	.incbin "baserom.gba", 0x003d1464, 0xc

	.global gUnknown_083D1470
gUnknown_083D1470: @ 83D1470
	.incbin "baserom.gba", 0x003d1470, 0x20

	.global gUnknown_083D1490
gUnknown_083D1490: @ 83D1490
	.incbin "baserom.gba", 0x003d1490, 0x18

	.global gUnknown_083D14A8
gUnknown_083D14A8: @ 83D14A8
	.incbin "baserom.gba", 0x003d14a8, 0x14

	.global gUnknown_083D14BC
gUnknown_083D14BC: @ 83D14BC
	.incbin "baserom.gba", 0x003d14bc, 0x4

	.global gUnknown_083D14C0
gUnknown_083D14C0: @ 83D14C0
	.incbin "baserom.gba", 0x003d14c0, 0x30

	.global gUnknown_083D14F0
gUnknown_083D14F0: @ 83D14F0
	.incbin "baserom.gba", 0x003d14f0, 0x34

	.global gUnknown_083D1524
gUnknown_083D1524: @ 83D1524
	.incbin "baserom.gba", 0x003d1524, 0x24

	.global gUnknown_083D1548
gUnknown_083D1548: @ 83D1548
	.incbin "baserom.gba", 0x003d1548, 0x3c

	.global gUnknown_083D1584
gUnknown_083D1584: @ 83D1584
	.incbin "baserom.gba", 0x003d1584, 0x4c

	.global gUnknown_083D15D0
gUnknown_083D15D0: @ 83D15D0
	.incbin "baserom.gba", 0x003d15d0, 0x1c

	.global gUnknown_083D15EC
gUnknown_083D15EC: @ 83D15EC
	.incbin "baserom.gba", 0x003d15ec, 0x8

	.global gUnknown_083D15F4
gUnknown_083D15F4: @ 83D15F4
	.incbin "baserom.gba", 0x003d15f4, 0xc

	.global gUnknown_083D1600
gUnknown_083D1600: @ 83D1600
	.incbin "baserom.gba", 0x003d1600, 0x24

	.global gUnknown_083D1624
gUnknown_083D1624: @ 83D1624
	.incbin "baserom.gba", 0x003d1624, 0x20

	.global gUnknown_083D1644
gUnknown_083D1644: @ 83D1644
	.incbin "baserom.gba", 0x003d1644, 0xa0

	.global gUnknown_083D16E4
gUnknown_083D16E4: @ 83D16E4
	.incbin "baserom.gba", 0x003d16e4, 0x68

	.global gUnknown_083D174C
gUnknown_083D174C: @ 83D174C
	.incbin "baserom.gba", 0x003d174c, 0x18

	.global gUnknown_083D1764
gUnknown_083D1764: @ 83D1764
	.incbin "baserom.gba", 0x003d1764, 0x40

	.global gUnknown_083D17A4
gUnknown_083D17A4: @ 83D17A4
	.incbin "baserom.gba", 0x003d17a4, 0x10

	.global gUnknown_083D17B4
gUnknown_083D17B4: @ 83D17B4
	.incbin "baserom.gba", 0x003d17b4, 0x18

	.global gUnknown_083D17CC
gUnknown_083D17CC: @ 83D17CC
	.incbin "baserom.gba", 0x003d17cc, 0x8

	.global gUnknown_083D17D4
gUnknown_083D17D4: @ 83D17D4
	.incbin "baserom.gba", 0x003d17d4, 0x8

	.global gUnknown_083D17DC
gUnknown_083D17DC: @ 83D17DC
	.incbin "baserom.gba", 0x003d17dc, 0x4

	.global gUnknown_083D17E0
gUnknown_083D17E0: @ 83D17E0
	.incbin "baserom.gba", 0x003d17e0, 0x2

	.global gUnknown_083D17E2
gUnknown_083D17E2: @ 83D17E2
	.incbin "baserom.gba", 0x003d17e2, 0x2a

	.global gUnknown_083D180C
gUnknown_083D180C: @ 83D180C
	.incbin "baserom.gba", 0x003d180c, 0x80

	.global gUnknown_083D188C
gUnknown_083D188C: @ 83D188C
	.incbin "baserom.gba", 0x003d188c, 0x2

	.global gUnknown_083D188E
gUnknown_083D188E: @ 83D188E
	.incbin "baserom.gba", 0x003d188e, 0xa

	.global gUnknown_083D1898
gUnknown_083D1898: @ 83D1898
	.incbin "baserom.gba", 0x003d1898, 0x8

	.global gUnknown_083D18A0
gUnknown_083D18A0: @ 83D18A0
	.incbin "baserom.gba", 0x003d18a0, 0x8

	.global gUnknown_083D18A8
gUnknown_083D18A8: @ 83D18A8
	.incbin "baserom.gba", 0x003d18a8, 0x18

	.global gUnknown_083D18C0
gUnknown_083D18C0: @ 83D18C0
	.incbin "baserom.gba", 0x003d18c0, 0x36C

	.align 2
gFieldEffectObjectPalette7: @ 83D1C2C
	.incbin "graphics/field_effect_objects/palettes/07.gbapal"

	.incbin "baserom.gba", 0x3d1c4c, 0x580

	.align 2
gFieldEffectObjectPalette8: @ 83D21CC
	.incbin "graphics/field_effect_objects/palettes/08.gbapal"

	.incbin "baserom.gba", 0x3d21ec, 0x428

	.global gUnknown_083D2614
gUnknown_083D2614: @ 83D2614
	.incbin "baserom.gba", 0x003d2614, 0x18

	.global gUnknown_083D262C
gUnknown_083D262C: @ 83D262C
	.incbin "baserom.gba", 0x003d262c, 0x18

	.global gUnknown_083D2644
gUnknown_083D2644: @ 83D2644
	.incbin "baserom.gba", 0x003d2644, 0x18

	.align 2
	.global gFieldEffectObjectPaletteInfo7
gFieldEffectObjectPaletteInfo7: @ 83D265C
	obj_pal gFieldEffectObjectPalette7, 0x1003

	.align 2
	.global gFieldEffectObjectPaletteInfo8
gFieldEffectObjectPaletteInfo8: @ 83D2664
	obj_pal gFieldEffectObjectPalette8, 0x1008

	.incbin "baserom.gba", 0x3d266c, 0x34

	.global gUnknown_083D26A0
gUnknown_083D26A0: @ 83D26A0
	.incbin "baserom.gba", 0x003d26a0, 0x18

@ This uses one of the secret base palettes, so there is no "09.pal" file.
	.align 2
	.global gFieldEffectObjectPaletteInfo9
gFieldEffectObjectPaletteInfo9: @ 83D26B8
	obj_pal gTilesetPalettes_SecretBase + 5 * 0x20, 0x100E

	.incbin "baserom.gba", 0x3d26c0, 0x1b8

	.global gUnknown_083D2878
gUnknown_083D2878: @ 83D2878
	.incbin "baserom.gba", 0x003d2878, 0x1c

	.global gUnknown_083D2894
gUnknown_083D2894: @ 83D2894
	.incbin "baserom.gba", 0x003d2894, 0x18

	.align 2
gMapObjectPic_MovingBox: @ 83D28AC
	.incbin "graphics/map_objects/pics/misc/moving_box.4bpp"

	.align 2
gMapObjectPalette19: @ 83D292C
	.incbin "graphics/map_objects/palettes/19.gbapal"

	.global gUnknown_083D294C
gUnknown_083D294C: @ 83D294C
	.incbin "baserom.gba", 0x003d294c, 0x13

	.global gUnknown_083D295F
gUnknown_083D295F: @ 83D295F
	.incbin "baserom.gba", 0x003d295f, 0x2

	.global gUnknown_083D2961
gUnknown_083D2961: @ 83D2961
	.incbin "baserom.gba", 0x003d2961, 0x3

	.global gUnknown_083D2964
gUnknown_083D2964: @ 83D2964
	.incbin "baserom.gba", 0x003d2964, 0x38

	.global gUnknown_083D299C
gUnknown_083D299C: @ 83D299C
	.incbin "baserom.gba", 0x003d299c, 0x3480

	.global gUnknown_083D5E1C
gUnknown_083D5E1C: @ 83D5E1C
	.incbin "baserom.gba", 0x003d5e1c, 0x270

	.global gUnknown_083D608C
gUnknown_083D608C: @ 83D608C
	.incbin "baserom.gba", 0x003d608c, 0x18

	.global gUnknown_083D60A4
gUnknown_083D60A4: @ 83D60A4
	.incbin "baserom.gba", 0x003d60a4, 0x18

	.global gUnknown_083D60BC
gUnknown_083D60BC: @ 83D60BC
	.incbin "baserom.gba", 0x003d60bc, 0x10

	.global gUnknown_083D60CC
gUnknown_083D60CC: @ 83D60CC
	.incbin "baserom.gba", 0x003d60cc, 0x10

	.global gUnknown_083D60DC
gUnknown_083D60DC: @ 83D60DC
	.incbin "baserom.gba", 0x003d60dc, 0x10

	.global gUnknown_083D60EC
gUnknown_083D60EC: @ 83D60EC
	.incbin "baserom.gba", 0x003d60ec, 0x10

	.global gUnknown_083D60FC
gUnknown_083D60FC: @ 83D60FC
	.incbin "baserom.gba", 0x003d60fc, 0x20

	.global gUnknown_083D611C
gUnknown_083D611C: @ 83D611C
	.incbin "baserom.gba", 0x003d611c, 0x20

	.global gUnknown_083D613C
gUnknown_083D613C: @ 83D613C
	.incbin "baserom.gba", 0x003d613c, 0xa0

	.global gUnknown_083D61DC
gUnknown_083D61DC: @ 83D61DC
	.incbin "baserom.gba", 0x003d61dc, 0x8

	.global gUnknown_083D61E4
gUnknown_083D61E4: @ 83D61E4
	.incbin "baserom.gba", 0x003d61e4, 0xc

	.global gUnknown_083D61F0
gUnknown_083D61F0: @ 83D61F0
	.incbin "baserom.gba", 0x003d61f0, 0x4

	.global gUnknown_083D61F4
gUnknown_083D61F4: @ 83D61F4
	.incbin "baserom.gba", 0x003d61f4, 0x128

	.global gUnknown_083D631C
gUnknown_083D631C: @ 83D631C
	.incbin "baserom.gba", 0x003d631c, 0x4f0

	.global gUnknown_083D680C
gUnknown_083D680C: @ 83D680C
	.incbin "baserom.gba", 0x003d680c, 0x78

	.global gUnknown_083D6884
gUnknown_083D6884: @ 83D6884
	.incbin "baserom.gba", 0x003d6884, 0x100

	.global gUnknown_083D6984
gUnknown_083D6984: @ 83D6984
	.incbin "baserom.gba", 0x003d6984, 0x458

	.global gUnknown_083D6DDC
gUnknown_083D6DDC: @ 83D6DDC
	.incbin "baserom.gba", 0x003d6ddc, 0x1ec

	.global gUnknown_083D6FC8
gUnknown_083D6FC8: @ 83D6FC8
	.incbin "baserom.gba", 0x003d6fc8, 0x30

	.global gUnknown_083D6FF8
gUnknown_083D6FF8: @ 83D6FF8
	.incbin "baserom.gba", 0x003d6ff8, 0x134

	.global gUnknown_083D712C
gUnknown_083D712C: @ 83D712C
	.incbin "baserom.gba", 0x003d712c, 0xf4

	.global gUnknown_083D7220
gUnknown_083D7220: @ 83D7220
	.incbin "baserom.gba", 0x003d7220, 0x29c

	.global gUnknown_083D74BC
gUnknown_083D74BC: @ 83D74BC
	.incbin "baserom.gba", 0x003d74bc, 0xf0

	.global gUnknown_083D75AC
gUnknown_083D75AC: @ 83D75AC
	.incbin "baserom.gba", 0x003d75ac, 0x148

	.global gUnknown_083D76F4
gUnknown_083D76F4: @ 83D76F4
	.incbin "baserom.gba", 0x003d76f4, 0x20

	.global gUnknown_083D7714
gUnknown_083D7714: @ 83D7714
	.incbin "baserom.gba", 0x003d7714, 0x9c

	.global gUnknown_083D77B0
gUnknown_083D77B0: @ 83D77B0
	.incbin "baserom.gba", 0x003d77b0, 0x20c

	.global gUnknown_083D79BC
gUnknown_083D79BC: @ 83D79BC
	.incbin "baserom.gba", 0x003d79bc, 0x2c

	.global gUnknown_083D79E8
gUnknown_083D79E8: @ 83D79E8
	.incbin "baserom.gba", 0x003d79e8, 0x18

	.global gUnknown_083D7A00
gUnknown_083D7A00: @ 83D7A00
	.incbin "baserom.gba", 0x003d7a00, 0x5c

	.global gUnknown_083D7A5C
gUnknown_083D7A5C: @ 83D7A5C
	.incbin "baserom.gba", 0x003d7a5c, 0x3c

	.global gUnknown_083D7A98
gUnknown_083D7A98: @ 83D7A98
	.incbin "baserom.gba", 0x003d7a98, 0x210

	.global gUnknown_083D7CA8
gUnknown_083D7CA8: @ 83D7CA8
	.incbin "baserom.gba", 0x003d7ca8, 0x1488

	.global gUnknown_083D9130
gUnknown_083D9130: @ 83D9130
	.incbin "baserom.gba", 0x003d9130, 0x248

	.global gUnknown_083D9378
gUnknown_083D9378: @ 83D9378
	.incbin "baserom.gba", 0x003d9378, 0xa8

	.global gUnknown_083D9420
gUnknown_083D9420: @ 83D9420
	.incbin "baserom.gba", 0x003d9420, 0x2a4

	.global gUnknown_083D96C4
gUnknown_083D96C4: @ 83D96C4
	.incbin "baserom.gba", 0x003d96c4, 0x18

	.global gUnknown_083D96DC
gUnknown_083D96DC: @ 83D96DC
	.incbin "baserom.gba", 0x003d96dc, 0x2

	.global gUnknown_083D96DE
gUnknown_083D96DE: @ 83D96DE
	.incbin "baserom.gba", 0x003d96de, 0xb6

	.global gUnknown_083D9794
gUnknown_083D9794: @ 83D9794
	.incbin "baserom.gba", 0x003d9794, 0x10

	.global gUnknown_083D97A4
gUnknown_083D97A4: @ 83D97A4
	.incbin "baserom.gba", 0x003d97a4, 0x2c

	.global gUnknown_083D97D0
gUnknown_083D97D0: @ 83D97D0
	.incbin "baserom.gba", 0x003d97d0, 0x168

	.global gUnknown_083D9938
gUnknown_083D9938: @ 83D9938
	.incbin "baserom.gba", 0x003d9938, 0x18

	.global gUnknown_083D9950
gUnknown_083D9950: @ 83D9950
	.incbin "baserom.gba", 0x003d9950, 0x18

	.global gUnknown_083D9968
gUnknown_083D9968: @ 83D9968
	.incbin "baserom.gba", 0x003d9968, 0x50

	.global gUnknown_083D99B8
gUnknown_083D99B8: @ 83D99B8
	.incbin "baserom.gba", 0x003d99b8, 0x158

	.global gUnknown_083D9B10
gUnknown_083D9B10: @ 83D9B10
	.incbin "baserom.gba", 0x003d9b10, 0x30

	.global gUnknown_083D9B40
gUnknown_083D9B40: @ 83D9B40
	.incbin "baserom.gba", 0x003d9b40, 0x138

	.global gUnknown_083D9C78
gUnknown_083D9C78: @ 83D9C78
	.incbin "baserom.gba", 0x003d9c78, 0xf4

	.global gUnknown_083D9D6C
gUnknown_083D9D6C: @ 83D9D6C
	.incbin "baserom.gba", 0x003d9d6c, 0x2c

	.global gUnknown_083D9D98
gUnknown_083D9D98: @ 83D9D98
	.incbin "baserom.gba", 0x003d9d98, 0x2c

	.global gUnknown_083D9DC4
gUnknown_083D9DC4: @ 83D9DC4
	.incbin "baserom.gba", 0x003d9dc4, 0x78

	.global gUnknown_083D9E3C
gUnknown_083D9E3C: @ 83D9E3C
	.incbin "baserom.gba", 0x003d9e3c, 0xa4c

	.global gUnknown_083DA888
gUnknown_083DA888: @ 83DA888
	.incbin "baserom.gba", 0x003da888, 0x1c

	.global gUnknown_083DA8A4
gUnknown_083DA8A4: @ 83DA8A4
	.incbin "baserom.gba", 0x003da8a4, 0x20

	.global gUnknown_083DA8C4
gUnknown_083DA8C4: @ 83DA8C4
	.incbin "baserom.gba", 0x003da8c4, 0x18

	.global gUnknown_083DA8DC
gUnknown_083DA8DC: @ 83DA8DC
	.incbin "baserom.gba", 0x003da8dc, 0xd0

	.global gUnknown_083DA9AC
gUnknown_083DA9AC: @ 83DA9AC
	.incbin "baserom.gba", 0x003da9ac, 0x364

	.global gUnknown_083DAD10
gUnknown_083DAD10: @ 83DAD10
	.incbin "baserom.gba", 0x003dad10, 0x68

	.global gUnknown_083DAD78
gUnknown_083DAD78: @ 83DAD78
	.incbin "baserom.gba", 0x003dad78, 0x18

	.global gUnknown_083DAD90
gUnknown_083DAD90: @ 83DAD90
	.incbin "baserom.gba", 0x003dad90, 0x178

	.global gUnknown_083DAF08
gUnknown_083DAF08: @ 83DAF08
	.incbin "baserom.gba", 0x003daf08, 0x78

	.global gUnknown_083DAF80
gUnknown_083DAF80: @ 83DAF80
	.incbin "baserom.gba", 0x003daf80, 0x528

	.global gUnknown_083DB4A8
gUnknown_083DB4A8: @ 83DB4A8
	.incbin "baserom.gba", 0x003db4a8, 0x30

	.global gUnknown_083DB4D8
gUnknown_083DB4D8: @ 83DB4D8
	.incbin "baserom.gba", 0x003db4d8, 0x60

	.global gUnknown_083DB538
gUnknown_083DB538: @ 83DB538
	.incbin "baserom.gba", 0x003db538, 0x30

	.global gUnknown_083DB568
gUnknown_083DB568: @ 83DB568
	.incbin "baserom.gba", 0x003db568, 0x4

	.global gUnknown_083DB56C
gUnknown_083DB56C: @ 83DB56C
	.incbin "baserom.gba", 0x003db56c, 0x28

	.global gUnknown_083DB594
gUnknown_083DB594: @ 83DB594
	.incbin "baserom.gba", 0x003db594, 0x10

	.global gUnknown_083DB5A4
gUnknown_083DB5A4: @ 83DB5A4
	.incbin "baserom.gba", 0x003db5a4, 0xc

	.global gUnknown_083DB5B0
gUnknown_083DB5B0: @ 83DB5B0
	.incbin "baserom.gba", 0x003db5b0, 0x34

	.global gUnknown_083DB5E4
gUnknown_083DB5E4: @ 83DB5E4
	.incbin "baserom.gba", 0x003db5e4, 0x1c

	.global gUnknown_083DB600
gUnknown_083DB600: @ 83DB600
	.incbin "baserom.gba", 0x003db600, 0x8

	.global gUnknown_083DB608
gUnknown_083DB608: @ 83DB608
	.incbin "baserom.gba", 0x003db608, 0x70

	.global gUnknown_083DB678
gUnknown_083DB678: @ 83DB678
	.incbin "baserom.gba", 0x003db678, 0x8

	.global gUnknown_083DB680
gUnknown_083DB680: @ 83DB680
	.incbin "baserom.gba", 0x003db680, 0x2

	.global gUnknown_083DB682
gUnknown_083DB682: @ 83DB682
	.incbin "baserom.gba", 0x003db682, 0x12

	.global gUnknown_083DB694
gUnknown_083DB694: @ 83DB694
	.incbin "baserom.gba", 0x003db694, 0x4

	.global gUnknown_083DB698
gUnknown_083DB698: @ 83DB698
	.incbin "baserom.gba", 0x003db698, 0xc

	.global gUnknown_083DB6A4
gUnknown_083DB6A4: @ 83DB6A4
	.incbin "baserom.gba", 0x003db6a4, 0xe

	.global gUnknown_083DB6B2
gUnknown_083DB6B2: @ 83DB6B2
	.incbin "baserom.gba", 0x003db6b2, 0x42

	.global gUnknown_083DB6F4
gUnknown_083DB6F4: @ 83DB6F4
	.incbin "baserom.gba", 0x003db6f4, 0xcc

	.global gUnknown_083DB7C0
gUnknown_083DB7C0: @ 83DB7C0
	.incbin "baserom.gba", 0x003db7c0, 0x1c

	.global gUnknown_083DB7DC
gUnknown_083DB7DC: @ 83DB7DC
	.incbin "baserom.gba", 0x003db7dc, 0x10

	.global gUnknown_083DB7EC
gUnknown_083DB7EC: @ 83DB7EC
	.incbin "baserom.gba", 0x003db7ec, 0x8

	.global gUnknown_083DB7F4
gUnknown_083DB7F4: @ 83DB7F4
	.incbin "baserom.gba", 0x003db7f4, 0x3c0

	.global gUnknown_083DBBB4
gUnknown_083DBBB4: @ 83DBBB4
	.incbin "baserom.gba", 0x003dbbb4, 0x28

	.global gUnknown_083DBBDC
gUnknown_083DBBDC: @ 83DBBDC
	.incbin "baserom.gba", 0x003dbbdc, 0x20

	.global gUnknown_083DBBFC
gUnknown_083DBBFC: @ 83DBBFC
	.incbin "baserom.gba", 0x003dbbfc, 0x90

	.global gUnknown_083DBC8C
gUnknown_083DBC8C: @ 83DBC8C
	.incbin "baserom.gba", 0x003dbc8c, 0x10

	.global gUnknown_083DBC9C
gUnknown_083DBC9C: @ 83DBC9C
	.incbin "baserom.gba", 0x003dbc9c, 0x10

	.global gUnknown_083DBCAC
gUnknown_083DBCAC: @ 83DBCAC
	.incbin "baserom.gba", 0x003dbcac, 0x18

	.global gUnknown_083DBCC4
gUnknown_083DBCC4: @ 83DBCC4
	.incbin "baserom.gba", 0x003dbcc4, 0x4c

	.global gUnknown_083DBD10
gUnknown_083DBD10: @ 83DBD10
	.incbin "baserom.gba", 0x003dbd10, 0x8

	.global gUnknown_083DBD18
gUnknown_083DBD18: @ 83DBD18
	.incbin "baserom.gba", 0x003dbd18, 0x18

	.global gUnknown_083DBD30
gUnknown_083DBD30: @ 83DBD30
	.incbin "baserom.gba", 0x003dbd30, 0x8

	.global gUnknown_083DBD38
gUnknown_083DBD38: @ 83DBD38
	.incbin "baserom.gba", 0x003dbd38, 0x10

	.global gUnknown_083DBD48
gUnknown_083DBD48: @ 83DBD48
	.incbin "baserom.gba", 0x003dbd48, 0x18

	.global gUnknown_083DBD60
gUnknown_083DBD60: @ 83DBD60
	.incbin "baserom.gba", 0x003dbd60, 0x8

	.global gUnknown_083DBD68
gUnknown_083DBD68: @ 83DBD68
	.incbin "baserom.gba", 0x003dbd68, 0x7c

	.global gUnknown_083DBDE4
gUnknown_083DBDE4: @ 83DBDE4
	.incbin "baserom.gba", 0x003dbde4, 0x18

	.global gUnknown_083DBDFC
gUnknown_083DBDFC: @ 83DBDFC
	.incbin "baserom.gba", 0x003dbdfc, 0x20

	.global gUnknown_083DBE1C
gUnknown_083DBE1C: @ 83DBE1C
	.incbin "baserom.gba", 0x003dbe1c, 0x24

	.global gUnknown_083DBE40
gUnknown_083DBE40: @ 83DBE40
	.incbin "baserom.gba", 0x003dbe40, 0x68

	.global gUnknown_083DBEA8
gUnknown_083DBEA8: @ 83DBEA8
	.incbin "baserom.gba", 0x003dbea8, 0x4

	.global gUnknown_083DBEAC
gUnknown_083DBEAC: @ 83DBEAC
	.incbin "baserom.gba", 0x003dbeac, 0x80

@ 83DBF2C
	.include "data/text/easy_chat/group_words.s"

@ 83DE138
	.include "data/text/easy_chat/words_by_letter.s"

@ 83DEFFA
	.include "data/text/easy_chat/group_sizes.s"

@ 83DF010
	.include "data/text/easy_chat/group_orders.s"

@ 83DFE6C
	.include "data/text/easy_chat/group_name_table.s"

	.global gUnknown_083DFEC4
gUnknown_083DFEC4: @ 83DFEC4
	.incbin "baserom.gba", 0x003dfec4, 0x4

	.global gUnknown_083DFEC8
gUnknown_083DFEC8: @ 83DFEC8
	.incbin "baserom.gba", 0x003dfec8, 0x4

	.global gUnknown_083DFECC
gUnknown_083DFECC: @ 83DFECC
	.incbin "baserom.gba", 0x003dfecc, 0x20

	.global gUnknown_083DFEEC
gUnknown_083DFEEC: @ 83DFEEC
	.incbin "baserom.gba", 0x003dfeec, 0xa0

	.global gUnknown_083DFF8C
gUnknown_083DFF8C: @ 83DFF8C
	.incbin "baserom.gba", 0x003dff8c, 0xb0

	.global gUnknown_083E003C
gUnknown_083E003C: @ 83E003C
	.incbin "baserom.gba", 0x003e003c, 0x20

	.global gUnknown_083E005C
gUnknown_083E005C: @ 83E005C
	.incbin "baserom.gba", 0x003e005c, 0x20

	.global gUnknown_083E007C
gUnknown_083E007C: @ 83E007C
	.incbin "baserom.gba", 0x003e007c, 0xa8

	.global gUnknown_083E0124
gUnknown_083E0124: @ 83E0124
	.incbin "baserom.gba", 0x003e0124, 0x20

	.global gUnknown_083E0144
gUnknown_083E0144: @ 83E0144
	.incbin "baserom.gba", 0x003e0144, 0x68

	.global gUnknown_083E01AC
gUnknown_083E01AC: @ 83E01AC
	.incbin "baserom.gba", 0x003e01ac, 0x48

	.global gUnknown_083E01F4
gUnknown_083E01F4: @ 83E01F4
	.incbin "baserom.gba", 0x003e01f4, 0x60

	.global gUnknown_083E0254
gUnknown_083E0254: @ 83E0254
	.incbin "baserom.gba", 0x003e0254, 0x20

	.global gUnknown_083E0274
gUnknown_083E0274: @ 83E0274
	.incbin "baserom.gba", 0x003e0274, 0x20

	.global gUnknown_083E0294
gUnknown_083E0294: @ 83E0294
	.incbin "baserom.gba", 0x003e0294, 0x20

	.global gUnknown_083E02B4
gUnknown_083E02B4: @ 83E02B4
	.incbin "baserom.gba", 0x003e02b4, 0x60

	.global gUnknown_083E0314
gUnknown_083E0314: @ 83E0314
	.incbin "baserom.gba", 0x003e0314, 0x20

	.global gUnknown_083E0334
gUnknown_083E0334: @ 83E0334
	.incbin "baserom.gba", 0x003e0334, 0x20

	.global gUnknown_083E0354
gUnknown_083E0354: @ 83E0354
	.incbin "baserom.gba", 0x003e0354, 0x48

	.global gUnknown_083E039C
gUnknown_083E039C: @ 83E039C
	.incbin "baserom.gba", 0x003e039c, 0x4

	.global gUnknown_083E03A0
gUnknown_083E03A0: @ 83E03A0
	.incbin "baserom.gba", 0x003e03a0, 0x8

	.global gUnknown_083E03A8
gUnknown_083E03A8: @ 83E03A8
	.incbin "baserom.gba", 0x003e03a8, 0x64

	.global gUnknown_083E040C
gUnknown_083E040C: @ 83E040C
	.incbin "baserom.gba", 0x003e040c, 0x1c8

	.global gUnknown_083E05D4
gUnknown_083E05D4: @ 83E05D4
	.incbin "baserom.gba", 0x003e05d4, 0x20

	.global gUnknown_083E05F4
gUnknown_083E05F4: @ 83E05F4
	.incbin "baserom.gba", 0x003e05f4, 0x210

	.global gUnknown_083E0804
gUnknown_083E0804: @ 83E0804
	.incbin "baserom.gba", 0x003e0804, 0x7C4

@ 83E0FC8
	.include "data/text/ribbon_descriptions.s"

@ 83E1204
	.include "data/text/gift_ribbon_descriptions.s"

@ 83E178C
	.include "data/text/trainer_eye_descriptions.s"

	.global gUnknown_083E309C
gUnknown_083E309C: @ 83E309C
	.incbin "baserom.gba", 0x003e309c, 0x114

	.global gUnknown_083E31B0
gUnknown_083E31B0: @ 83E31B0
	.incbin "baserom.gba", 0x003e31b0, 0x1c

	.global gUnknown_083E31CC
gUnknown_083E31CC: @ 83E31CC
	.incbin "baserom.gba", 0x003e31cc, 0xc

	.global gUnknown_083E31D8
gUnknown_083E31D8: @ 83E31D8
	.incbin "baserom.gba", 0x003e31d8, 0x18

	.global gUnknown_083E31F0
gUnknown_083E31F0: @ 83E31F0
	.incbin "baserom.gba", 0x003e31f0, 0x80

	.global gUnknown_083E3270
gUnknown_083E3270: @ 83E3270
	.incbin "baserom.gba", 0x003e3270, 0x2c

	.global gUnknown_083E329C
gUnknown_083E329C: @ 83E329C
	.incbin "baserom.gba", 0x003e329c, 0x9c4

	.global gUnknown_083E3C60
gUnknown_083E3C60: @ 83E3C60
	.incbin "baserom.gba", 0x003e3c60, 0xa0

	.global gUnknown_083E3D00
gUnknown_083E3D00: @ 83E3D00
	.incbin "baserom.gba", 0x003e3d00, 0x5f8

	.global gUnknown_083E42F8
gUnknown_083E42F8: @ 83E42F8
	.incbin "baserom.gba", 0x003e42f8, 0x158

	.global gUnknown_083E4450
gUnknown_083E4450: @ 83E4450
	.incbin "baserom.gba", 0x003e4450, 0x4

	.global gUnknown_083E4454
gUnknown_083E4454: @ 83E4454
	.incbin "baserom.gba", 0x003e4454, 0x18

	.global gUnknown_083E446C
gUnknown_083E446C: @ 83E446C
	.incbin "baserom.gba", 0x003e446c, 0x8

	.global gUnknown_083E4474
gUnknown_083E4474: @ 83E4474
	.incbin "baserom.gba", 0x003e4474, 0x10

	.global gUnknown_083E4484
gUnknown_083E4484: @ 83E4484
	.incbin "baserom.gba", 0x003e4484, 0x18

	.global gUnknown_083E449C
gUnknown_083E449C: @ 83E449C
	.incbin "baserom.gba", 0x003e449c, 0x44

	.global gUnknown_083E44E0
gUnknown_083E44E0: @ 83E44E0
	.incbin "baserom.gba", 0x003e44e0, 0x18

	.global gUnknown_083E44F8
gUnknown_083E44F8: @ 83E44F8
	.incbin "baserom.gba", 0x003e44f8, 0x38

	.global gUnknown_083E4530
gUnknown_083E4530: @ 83E4530
	.incbin "baserom.gba", 0x003e4530, 0x18

	.global gUnknown_083E4548
gUnknown_083E4548: @ 83E4548
	.incbin "baserom.gba", 0x003e4548, 0x20

	.global gUnknown_083E4568
gUnknown_083E4568: @ 83E4568
	.incbin "baserom.gba", 0x003e4568, 0x8

	.global gUnknown_083E4570
gUnknown_083E4570: @ 83E4570
	.incbin "baserom.gba", 0x003e4570, 0x18

	.global gUnknown_083E4588
gUnknown_083E4588: @ 83E4588
	.incbin "baserom.gba", 0x003e4588, 0x8

	.global gUnknown_083E4590
gUnknown_083E4590: @ 83E4590
	.incbin "baserom.gba", 0x003e4590, 0x18

	.global gUnknown_083E45A8
gUnknown_083E45A8: @ 83E45A8
	.incbin "baserom.gba", 0x003e45a8, 0x10

	.global gUnknown_083E45B8
gUnknown_083E45B8: @ 83E45B8
	.incbin "baserom.gba", 0x003e45b8, 0x38

	.global gUnknown_083E45F0
gUnknown_083E45F0: @ 83E45F0
	.incbin "baserom.gba", 0x003e45f0, 0x38

	.global gUnknown_083E4628
gUnknown_083E4628: @ 83E4628
	.incbin "baserom.gba", 0x003e4628, 0x20

	.global gUnknown_083E4648
gUnknown_083E4648: @ 83E4648
	.incbin "baserom.gba", 0x003e4648, 0x18

	.global gUnknown_083E4660
gUnknown_083E4660: @ 83E4660
	.incbin "baserom.gba", 0x003e4660, 0x18

	.global gUnknown_083E4678
gUnknown_083E4678: @ 83E4678
	.incbin "baserom.gba", 0x003e4678, 0x20

	.global gUnknown_083E4698
gUnknown_083E4698: @ 83E4698
	.incbin "baserom.gba", 0x003e4698, 0xd4

	.global gUnknown_083E476C
gUnknown_083E476C: @ 83E476C
	.incbin "baserom.gba", 0x003e476c, 0x18

	.global gUnknown_083E4784
gUnknown_083E4784: @ 83E4784
	.incbin "baserom.gba", 0x003e4784, 0x8

	.global gUnknown_083E478C
gUnknown_083E478C: @ 83E478C
	.incbin "baserom.gba", 0x003e478c, 0x8

	.global gUnknown_083E4794
gUnknown_083E4794: @ 83E4794
	.incbin "baserom.gba", 0x003e4794, 0x6c

	.global gUnknown_083E4800
gUnknown_083E4800: @ 83E4800
	.incbin "baserom.gba", 0x003e4800, 0x18

	.global gUnknown_083E4818
gUnknown_083E4818: @ 83E4818
	.incbin "baserom.gba", 0x003e4818, 0x38

	.global gUnknown_083E4850
gUnknown_083E4850: @ 83E4850
	.incbin "baserom.gba", 0x003e4850, 0x18

	.global gUnknown_083E4868
gUnknown_083E4868: @ 83E4868
	.incbin "baserom.gba", 0x003e4868, 0x10

	.global gUnknown_083E4878
gUnknown_083E4878: @ 83E4878
	.incbin "baserom.gba", 0x003e4878, 0x18

	.global gUnknown_083E4890
gUnknown_083E4890: @ 83E4890
	.incbin "baserom.gba", 0x003e4890, 0x100

	.global gUnknown_083E4990
gUnknown_083E4990: @ 83E4990
	.incbin "baserom.gba", 0x003e4990, 0xc

	.global gUnknown_083E499C
gUnknown_083E499C: @ 83E499C
	.incbin "baserom.gba", 0x003e499c, 0x24

	.global gUnknown_083E49C0
gUnknown_083E49C0: @ 83E49C0
	.incbin "baserom.gba", 0x003e49c0, 0x34

	.global gUnknown_083E49F4
gUnknown_083E49F4: @ 83E49F4
	.incbin "baserom.gba", 0x003e49f4, 0x20

	.global gUnknown_083E4A14
gUnknown_083E4A14: @ 83E4A14
	.incbin "baserom.gba", 0x003e4a14, 0x800

	.global gUnknown_083E5214
gUnknown_083E5214: @ 83E5214
	.incbin "baserom.gba", 0x003e5214, 0x8

	.global gUnknown_083E521C
gUnknown_083E521C: @ 83E521C
	.incbin "baserom.gba", 0x003e521c, 0x58

	.global gUnknown_083E5274
gUnknown_083E5274: @ 83E5274
	.incbin "baserom.gba", 0x003e5274, 0x38

	.global gUnknown_083E52AC
gUnknown_083E52AC: @ 83E52AC
	.incbin "baserom.gba", 0x003e52ac, 0x8

	.global gUnknown_083E52B4
gUnknown_083E52B4: @ 83E52B4
	.incbin "baserom.gba", 0x003e52b4, 0x88

	.global gUnknown_083E533C
gUnknown_083E533C: @ 83E533C
	.incbin "baserom.gba", 0x003e533c, 0x40

	.global gUnknown_083E537C
gUnknown_083E537C: @ 83E537C
	.incbin "baserom.gba", 0x003e537c, 0xc

	.global gUnknown_083E5388
gUnknown_083E5388: @ 83E5388
	.incbin "baserom.gba", 0x003e5388, 0x20

	.global gUnknown_083E53A8
gUnknown_083E53A8: @ 83E53A8
	.incbin "baserom.gba", 0x003e53a8, 0x20

	.global gUnknown_083E53C8
gUnknown_083E53C8: @ 83E53C8
	.incbin "baserom.gba", 0x003e53c8, 0x18

	.global gUnknown_083E53E0
gUnknown_083E53E0: @ 83E53E0
	.incbin "baserom.gba", 0x003e53e0, 0x230

	.global gUnknown_083E5610
gUnknown_083E5610: @ 83E5610
	.incbin "baserom.gba", 0x003e5610, 0x10

	.global gUnknown_083E5620
gUnknown_083E5620: @ 83E5620
	.incbin "baserom.gba", 0x003e5620, 0xc

	.global gUnknown_083E562C
gUnknown_083E562C: @ 83E562C
	.incbin "baserom.gba", 0x003e562c, 0x8

	.global gUnknown_083E5634
gUnknown_083E5634: @ 83E5634
	.incbin "baserom.gba", 0x003e5634, 0xfc

	.global gUnknown_083E5730
gUnknown_083E5730: @ 83E5730
	.incbin "baserom.gba", 0x003e5730, 0x74

	.global gUnknown_083E57A4
gUnknown_083E57A4: @ 83E57A4
	.incbin "baserom.gba", 0x003e57a4, 0x1c4

	.global gUnknown_083E5968
gUnknown_083E5968: @ 83E5968
	.incbin "baserom.gba", 0x003e5968, 0x68

	.global gUnknown_083E59D0
gUnknown_083E59D0: @ 83E59D0
	.incbin "baserom.gba", 0x003e59d0, 0x18

	.global gUnknown_083E59E8
gUnknown_083E59E8: @ 83E59E8
	.incbin "baserom.gba", 0x003e59e8, 0x18

	.global gUnknown_083E5A00
gUnknown_083E5A00: @ 83E5A00
	.incbin "baserom.gba", 0x003e5a00, 0x18

	.global gUnknown_083E5A18
gUnknown_083E5A18: @ 83E5A18
	.incbin "baserom.gba", 0x003e5a18, 0x4

	.global gUnknown_083E5A1C
gUnknown_083E5A1C: @ 83E5A1C
	.incbin "baserom.gba", 0x003e5a1c, 0x4

	.global gUnknown_083E5A20
gUnknown_083E5A20: @ 83E5A20
	.incbin "baserom.gba", 0x003e5a20, 0xd0

	.global gUnknown_083E5AF0
gUnknown_083E5AF0: @ 83E5AF0
	.incbin "baserom.gba", 0x003e5af0, 0x44

	.global gUnknown_083E5B34
gUnknown_083E5B34: @ 83E5B34
	.incbin "baserom.gba", 0x003e5b34, 0xec

	.global gUnknown_083E5C20
gUnknown_083E5C20: @ 83E5C20
	.incbin "baserom.gba", 0x003e5c20, 0x20

	.global gUnknown_083E5C40
gUnknown_083E5C40: @ 83E5C40
	.incbin "baserom.gba", 0x003e5c40, 0x80

	.global gUnknown_083E5CC0
gUnknown_083E5CC0: @ 83E5CC0
	.incbin "baserom.gba", 0x003e5cc0, 0x20

	.global gUnknown_083E5CE0
gUnknown_083E5CE0: @ 83E5CE0
	.incbin "baserom.gba", 0x003e5ce0, 0x80

	.global gUnknown_083E5D60
gUnknown_083E5D60: @ 83E5D60
	.incbin "baserom.gba", 0x003e5d60, 0x40

	.global gUnknown_083E5DA0
gUnknown_083E5DA0: @ 83E5DA0
	.incbin "baserom.gba", 0x003e5da0, 0xd64

	.global gUnknown_083E6B04
gUnknown_083E6B04: @ 83E6B04
	.incbin "baserom.gba", 0x003e6b04, 0x34c

	.global gUnknown_083E6E50
gUnknown_083E6E50: @ 83E6E50
	.incbin "baserom.gba", 0x003e6e50, 0x1A4

@ 83E6FF4
	.include "data/region_map_locations.s"

	.global gUnknown_083E7684
gUnknown_083E7684: @ 83E7684
	.incbin "baserom.gba", 0x003e7684, 0x64

	.global gUnknown_083E76E8
gUnknown_083E76E8: @ 83E76E8
	.incbin "baserom.gba", 0x003e76e8, 0x8

	.global gUnknown_083E76F0
gUnknown_083E76F0: @ 83E76F0
	.incbin "baserom.gba", 0x003e76f0, 0x18

	.global gUnknown_083E7708
gUnknown_083E7708: @ 83E7708
	.incbin "baserom.gba", 0x003e7708, 0x10

	.global gUnknown_083E7718
gUnknown_083E7718: @ 83E7718
	.incbin "baserom.gba", 0x003e7718, 0x4

	.global gUnknown_083E771C
gUnknown_083E771C: @ 83E771C
	.incbin "baserom.gba", 0x003e771c, 0x20

	.global gUnknown_083E773C
gUnknown_083E773C: @ 83E773C
	.incbin "baserom.gba", 0x003e773c, 0x38

	.global gUnknown_083E7774
gUnknown_083E7774: @ 83E7774
	.incbin "baserom.gba", 0x003e7774, 0xd8

	.global gUnknown_083E784C
gUnknown_083E784C: @ 83E784C
	.incbin "baserom.gba", 0x003e784c, 0xd4

	.global gUnknown_083E7920
gUnknown_083E7920: @ 83E7920
	.incbin "baserom.gba", 0x003e7920, 0xa0

	.global gUnknown_083E79C0
gUnknown_083E79C0: @ 83E79C0
	.incbin "baserom.gba", 0x003e79c0, 0xc

	.global gUnknown_083E79CC
gUnknown_083E79CC: @ 83E79CC
	.incbin "baserom.gba", 0x003e79cc, 0x8

	.global gUnknown_083E79D4
gUnknown_083E79D4: @ 83E79D4
	.incbin "baserom.gba", 0x003e79d4, 0x64

	.global gUnknown_083E7A38
gUnknown_083E7A38: @ 83E7A38
	.incbin "baserom.gba", 0x003e7a38, 0x18

	.global gUnknown_083E7A50
gUnknown_083E7A50: @ 83E7A50
	.incbin "baserom.gba", 0x003e7a50, 0x3c74

	.global gUnknown_083EB6C4
gUnknown_083EB6C4: @ 83EB6C4
	.incbin "baserom.gba", 0x003eb6c4, 0x1

	.global gUnknown_083EB6C5
gUnknown_083EB6C5: @ 83EB6C5
	.incbin "baserom.gba", 0x003eb6c5, 0x1b

	.global gUnknown_083EB6E0
gUnknown_083EB6E0: @ 83EB6E0
	.incbin "baserom.gba", 0x003eb6e0, 0xf04

	.global gUnknown_083EC5E4
gUnknown_083EC5E4: @ 83EC5E4
	.incbin "baserom.gba", 0x003ec5e4, 0x20

	.global gUnknown_083EC604
gUnknown_083EC604: @ 83EC604
	.incbin "baserom.gba", 0x003ec604, 0x20

	.global gUnknown_083EC624
gUnknown_083EC624: @ 83EC624
	.incbin "baserom.gba", 0x003ec624, 0x10

	.global gUnknown_083EC634
gUnknown_083EC634: @ 83EC634
	.incbin "baserom.gba", 0x003ec634, 0x20

	.global gUnknown_083EC654
gUnknown_083EC654: @ 83EC654
	.incbin "baserom.gba", 0x003ec654, 0x6

	.global gUnknown_083EC65A
gUnknown_083EC65A: @ 83EC65A
	.incbin "baserom.gba", 0x003ec65a, 0x206

	.global gUnknown_083EC860
gUnknown_083EC860: @ 83EC860
	.incbin "baserom.gba", 0x003ec860, 0xa0

	.global gUnknown_083EC900
gUnknown_083EC900: @ 83EC900
	.incbin "baserom.gba", 0x003ec900, 0x3c

	.global gUnknown_083EC93C
gUnknown_083EC93C: @ 83EC93C
	.incbin "baserom.gba", 0x003ec93c, 0x18

	.global gUnknown_083EC954
gUnknown_083EC954: @ 83EC954
	.incbin "baserom.gba", 0x003ec954, 0x8

	.global gUnknown_083EC95C
gUnknown_083EC95C: @ 83EC95C
	.incbin "baserom.gba", 0x003ec95c, 0x8

	.global gUnknown_083EC964
gUnknown_083EC964: @ 83EC964
	.incbin "baserom.gba", 0x003ec964, 0x8

	.global gUnknown_083EC96C
gUnknown_083EC96C: @ 83EC96C
	.incbin "baserom.gba", 0x003ec96c, 0x10

	.global gUnknown_083EC97C
gUnknown_083EC97C: @ 83EC97C
	.incbin "baserom.gba", 0x003ec97c, 0x8

	.global gUnknown_083EC984
gUnknown_083EC984: @ 83EC984
	.incbin "baserom.gba", 0x003ec984, 0x48

	.global gUnknown_083EC9CC
gUnknown_083EC9CC: @ 83EC9CC
	.incbin "baserom.gba", 0x003ec9cc, 0x8

	.global gUnknown_083EC9D4
gUnknown_083EC9D4: @ 83EC9D4
	.incbin "baserom.gba", 0x003ec9d4, 0x88

	.global gUnknown_083ECA5C
gUnknown_083ECA5C: @ 83ECA5C
	.incbin "baserom.gba", 0x003eca5c, 0x8

	.global gUnknown_083ECA64
gUnknown_083ECA64: @ 83ECA64
	.incbin "baserom.gba", 0x003eca64, 0x24

	.global gUnknown_083ECA88
gUnknown_083ECA88: @ 83ECA88
	.incbin "baserom.gba", 0x003eca88, 0x18

	.global gUnknown_083ECAA0
gUnknown_083ECAA0: @ 83ECAA0
	.incbin "baserom.gba", 0x003ecaa0, 0xc

	.global gUnknown_083ECAAC
gUnknown_083ECAAC: @ 83ECAAC
	.incbin "baserom.gba", 0x003ecaac, 0x74

	.global gUnknown_083ECB20
gUnknown_083ECB20: @ 83ECB20
	.incbin "baserom.gba", 0x003ecb20, 0xc

	.global gUnknown_083ECB2C
gUnknown_083ECB2C: @ 83ECB2C
	.incbin "baserom.gba", 0x003ecb2c, 0x14

	.global gUnknown_083ECB40
gUnknown_083ECB40: @ 83ECB40
	.incbin "baserom.gba", 0x003ecb40, 0xc

	.global gUnknown_083ECB4C
gUnknown_083ECB4C: @ 83ECB4C
	.incbin "baserom.gba", 0x003ecb4c, 0xc

	.global gUnknown_083ECB58
gUnknown_083ECB58: @ 83ECB58
	.incbin "baserom.gba", 0x003ecb58, 0xc

	.global gUnknown_083ECB64
gUnknown_083ECB64: @ 83ECB64
	.incbin "baserom.gba", 0x003ecb64, 0xc

	.global gUnknown_083ECB70
gUnknown_083ECB70: @ 83ECB70
	.incbin "baserom.gba", 0x003ecb70, 0xc

	.global gUnknown_083ECB7C
gUnknown_083ECB7C: @ 83ECB7C
	.incbin "baserom.gba", 0x003ecb7c, 0xc

	.global gUnknown_083ECB88
gUnknown_083ECB88: @ 83ECB88
	.incbin "baserom.gba", 0x003ecb88, 0xc

	.global gUnknown_083ECB94
gUnknown_083ECB94: @ 83ECB94
	.incbin "baserom.gba", 0x003ecb94, 0xc

	.global gUnknown_083ECBA0
gUnknown_083ECBA0: @ 83ECBA0
	.incbin "baserom.gba", 0x003ecba0, 0xc

	.global gUnknown_083ECBAC
gUnknown_083ECBAC: @ 83ECBAC
	.incbin "baserom.gba", 0x003ecbac, 0x8

	.global gUnknown_083ECBB4
gUnknown_083ECBB4: @ 83ECBB4
	.incbin "baserom.gba", 0x003ecbb4, 0x10

	.global gUnknown_083ECBC4
gUnknown_083ECBC4: @ 83ECBC4
	.incbin "baserom.gba", 0x003ecbc4, 0x2

	.global gUnknown_083ECBC6
gUnknown_083ECBC6: @ 83ECBC6
	.incbin "baserom.gba", 0x003ecbc6, 0xa

	.global gUnknown_083ECBD0
gUnknown_083ECBD0: @ 83ECBD0
	.incbin "baserom.gba", 0x003ecbd0, 0x4c

	.global gUnknown_083ECC1C
gUnknown_083ECC1C: @ 83ECC1C
	.incbin "baserom.gba", 0x003ecc1c, 0x4

	.global gUnknown_083ECC20
gUnknown_083ECC20: @ 83ECC20
	.incbin "baserom.gba", 0x003ecc20, 0x8

	.global gUnknown_083ECC28
gUnknown_083ECC28: @ 83ECC28
	.incbin "baserom.gba", 0x003ecc28, 0x8

	.global gUnknown_083ECC30
gUnknown_083ECC30: @ 83ECC30
	.incbin "baserom.gba", 0x003ecc30, 0x24

	.global gUnknown_083ECC54
gUnknown_083ECC54: @ 83ECC54
	.incbin "baserom.gba", 0x003ecc54, 0x4

	.global gUnknown_083ECC58
gUnknown_083ECC58: @ 83ECC58
	.incbin "baserom.gba", 0x003ecc58, 0x2

	.global gUnknown_083ECC5A
gUnknown_083ECC5A: @ 83ECC5A
	.incbin "baserom.gba", 0x003ecc5a, 0x8

	.global gUnknown_083ECC62
gUnknown_083ECC62: @ 83ECC62
	.incbin "baserom.gba", 0x003ecc62, 0x8

	.global gUnknown_083ECC6A
gUnknown_083ECC6A: @ 83ECC6A
	.incbin "baserom.gba", 0x003ecc6a, 0x8

	.global gUnknown_083ECC72
gUnknown_083ECC72: @ 83ECC72
	.incbin "baserom.gba", 0x003ecc72, 0x10

	.global gUnknown_083ECC82
gUnknown_083ECC82: @ 83ECC82
	.incbin "baserom.gba", 0x003ecc82, 0x10

	.global gUnknown_083ECC92
gUnknown_083ECC92: @ 83ECC92
	.incbin "baserom.gba", 0x003ecc92, 0x10

	.global gUnknown_083ECCA2
gUnknown_083ECCA2: @ 83ECCA2
	.incbin "baserom.gba", 0x003ecca2, 0x10

	.global gUnknown_083ECCB2
gUnknown_083ECCB2: @ 83ECCB2
	.incbin "baserom.gba", 0x003eccb2, 0x3f

	.global gUnknown_083ECCF1
gUnknown_083ECCF1: @ 83ECCF1
	.incbin "baserom.gba", 0x003eccf1, 0x7

	.global gUnknown_083ECCF8
gUnknown_083ECCF8: @ 83ECCF8
	.incbin "baserom.gba", 0x003eccf8, 0xc

	.global gUnknown_083ECD04
gUnknown_083ECD04: @ 83ECD04
	.incbin "baserom.gba", 0x003ecd04, 0x12

	.global gUnknown_083ECD16
gUnknown_083ECD16: @ 83ECD16
	.incbin "baserom.gba", 0x003ecd16, 0x12

	.global gUnknown_083ECD28
gUnknown_083ECD28: @ 83ECD28
	.incbin "baserom.gba", 0x003ecd28, 0x1e

	.global gUnknown_083ECD46
gUnknown_083ECD46: @ 83ECD46
	.incbin "baserom.gba", 0x003ecd46, 0x66

	.global gUnknown_083ECDAC
gUnknown_083ECDAC: @ 83ECDAC
	.incbin "baserom.gba", 0x003ecdac, 0x66

	.global gUnknown_083ECE12
gUnknown_083ECE12: @ 83ECE12
	.incbin "baserom.gba", 0x003ece12, 0xa

	.global gUnknown_083ECE1C
gUnknown_083ECE1C: @ 83ECE1C
	.incbin "baserom.gba", 0x003ece1c, 0x14

	.global gUnknown_083ECE30
gUnknown_083ECE30: @ 83ECE30
	.incbin "baserom.gba", 0x003ece30, 0xa

	.global gUnknown_083ECE3A
gUnknown_083ECE3A: @ 83ECE3A
	.incbin "baserom.gba", 0x003ece3a, 0x8

	.global gUnknown_083ECE42
gUnknown_083ECE42: @ 83ECE42
	.incbin "baserom.gba", 0x003ece42, 0x6

	.global gUnknown_083ECE48
gUnknown_083ECE48: @ 83ECE48
	.incbin "baserom.gba", 0x003ece48, 0xa

	.global gUnknown_083ECE52
gUnknown_083ECE52: @ 83ECE52
	.incbin "baserom.gba", 0x003ece52, 0x8

	.global gUnknown_083ECE5A
gUnknown_083ECE5A: @ 83ECE5A
	.incbin "baserom.gba", 0x003ece5a, 0x12

	.global gUnknown_083ECE6C
gUnknown_083ECE6C: @ 83ECE6C
	.incbin "baserom.gba", 0x003ece6c, 0x12

	.global gUnknown_083ECE7E
gUnknown_083ECE7E: @ 83ECE7E
	.incbin "baserom.gba", 0x003ece7e, 0x8e

	.global gUnknown_083ECF0C
gUnknown_083ECF0C: @ 83ECF0C
	.incbin "baserom.gba", 0x003ecf0c, 0x13c

	.global gUnknown_083ED048
gUnknown_083ED048: @ 83ED048
	.incbin "baserom.gba", 0x003ed048, 0x1c

	.global gUnknown_083ED064
gUnknown_083ED064: @ 83ED064
	.incbin "baserom.gba", 0x003ed064, 0x3b0

	.global gUnknown_083ED414
gUnknown_083ED414: @ 83ED414
	.incbin "baserom.gba", 0x003ed414, 0x18

	.global gUnknown_083ED42C
gUnknown_083ED42C: @ 83ED42C
	.incbin "baserom.gba", 0x003ed42c, 0x18

	.global gUnknown_083ED444
gUnknown_083ED444: @ 83ED444
	.incbin "baserom.gba", 0x003ed444, 0x18

	.global gUnknown_083ED45C
gUnknown_083ED45C: @ 83ED45C
	.incbin "baserom.gba", 0x003ed45c, 0x18

	.global gUnknown_083ED474
gUnknown_083ED474: @ 83ED474
	.incbin "baserom.gba", 0x003ed474, 0x18

	.global gUnknown_083ED48C
gUnknown_083ED48C: @ 83ED48C
	.incbin "baserom.gba", 0x003ed48c, 0x18

	.global gUnknown_083ED4A4
gUnknown_083ED4A4: @ 83ED4A4
	.incbin "baserom.gba", 0x003ed4a4, 0x18

	.global gUnknown_083ED4BC
gUnknown_083ED4BC: @ 83ED4BC
	.incbin "baserom.gba", 0x003ed4bc, 0x18

	.global gUnknown_083ED4D4
gUnknown_083ED4D4: @ 83ED4D4
	.incbin "baserom.gba", 0x003ed4d4, 0x18

	.global gUnknown_083ED4EC
gUnknown_083ED4EC: @ 83ED4EC
	.incbin "baserom.gba", 0x003ed4ec, 0x18

	.global gUnknown_083ED504
gUnknown_083ED504: @ 83ED504
	.incbin "baserom.gba", 0x003ed504, 0x18

	.global gUnknown_083ED51C
gUnknown_083ED51C: @ 83ED51C
	.incbin "baserom.gba", 0x003ed51c, 0x18

	.global gUnknown_083ED534
gUnknown_083ED534: @ 83ED534
	.incbin "baserom.gba", 0x003ed534, 0x18

	.global gUnknown_083ED54C
gUnknown_083ED54C: @ 83ED54C
	.incbin "baserom.gba", 0x003ed54c, 0x18

	.global gUnknown_083ED564
gUnknown_083ED564: @ 83ED564
	.incbin "baserom.gba", 0x003ed564, 0x168

	.global gUnknown_083ED6CC
gUnknown_083ED6CC: @ 83ED6CC
	.incbin "baserom.gba", 0x003ed6cc, 0x38

	.global gUnknown_083ED704
gUnknown_083ED704: @ 83ED704
	.incbin "baserom.gba", 0x003ed704, 0x38

	.global gUnknown_083ED73C
gUnknown_083ED73C: @ 83ED73C
	.incbin "baserom.gba", 0x003ed73c, 0x20

	.global gUnknown_083ED75C
gUnknown_083ED75C: @ 83ED75C
	.incbin "baserom.gba", 0x003ed75c, 0x30

	.global gUnknown_083ED78C
gUnknown_083ED78C: @ 83ED78C
	.incbin "baserom.gba", 0x003ed78c, 0x28

	.global gUnknown_083ED7B4
gUnknown_083ED7B4: @ 83ED7B4
	.incbin "baserom.gba", 0x003ed7b4, 0x20

	.global gUnknown_083ED7D4
gUnknown_083ED7D4: @ 83ED7D4
	.incbin "baserom.gba", 0x003ed7d4, 0x388

	.global gUnknown_083EDB5C
gUnknown_083EDB5C: @ 83EDB5C
	.incbin "baserom.gba", 0x003edb5c, 0x68

	.global gUnknown_083EDBC4
gUnknown_083EDBC4: @ 83EDBC4
	.incbin "baserom.gba", 0x003edbc4, 0x68

	.global gUnknown_083EDC2C
gUnknown_083EDC2C: @ 83EDC2C
	.incbin "baserom.gba", 0x003edc2c, 0xb0

	.global gUnknown_083EDCDC
gUnknown_083EDCDC: @ 83EDCDC
	.incbin "baserom.gba", 0x003edcdc, 0x8

	.global gUnknown_083EDCE4
gUnknown_083EDCE4: @ 83EDCE4
	.incbin "baserom.gba", 0x003edce4, 0x24

	.global gUnknown_083EDD08
gUnknown_083EDD08: @ 83EDD08
	.incbin "baserom.gba", 0x003edd08, 0x14

	.global gUnknown_083EDD1C
gUnknown_083EDD1C: @ 83EDD1C
	.incbin "baserom.gba", 0x003edd1c, 0x14

	.global gUnknown_083EDD30
gUnknown_083EDD30: @ 83EDD30
	.incbin "baserom.gba", 0x003edd30, 0x5

	.global gUnknown_083EDD35
gUnknown_083EDD35: @ 83EDD35
	.incbin "baserom.gba", 0x003edd35, 0x6

	.global gUnknown_083EDD3B
gUnknown_083EDD3B: @ 83EDD3B
	.incbin "baserom.gba", 0x003edd3b, 0x65

	.global gUnknown_083EDDA0
gUnknown_083EDDA0: @ 83EDDA0
	.incbin "baserom.gba", 0x003edda0, 0xc

	.global gUnknown_083EDDAC
gUnknown_083EDDAC: @ 83EDDAC
	.incbin "baserom.gba", 0x003eddac, 0x64

	.global gUnknown_083EDE10
gUnknown_083EDE10: @ 83EDE10
	.incbin "baserom.gba", 0x003ede10, 0x10

	.global gUnknown_083EDE20
gUnknown_083EDE20: @ 83EDE20
	.incbin "baserom.gba", 0x003ede20, 0x4

	.global gUnknown_083EDE24
gUnknown_083EDE24: @ 83EDE24
	.incbin "baserom.gba", 0x003ede24, 0x20

	.global gUnknown_083EDE44
gUnknown_083EDE44: @ 83EDE44
	.incbin "baserom.gba", 0x003ede44, 0x48

	.global gUnknown_083EDE8C
gUnknown_083EDE8C: @ 83EDE8C
	.incbin "baserom.gba", 0x003ede8c, 0x1154

	.global gUnknown_083EEFE0
gUnknown_083EEFE0: @ 83EEFE0
	.incbin "baserom.gba", 0x003eefe0, 0x1b8

	.global gUnknown_083EF198
gUnknown_083EF198: @ 83EF198
	.incbin "baserom.gba", 0x003ef198, 0x200

	.global gUnknown_083EF398
gUnknown_083EF398: @ 83EF398
	.incbin "baserom.gba", 0x003ef398, 0x1084

	.global gUnknown_083F041C
gUnknown_083F041C: @ 83F041C
	.incbin "baserom.gba", 0x003f041c, 0xc30

	.global gUnknown_083F104C
gUnknown_083F104C: @ 83F104C
	.incbin "baserom.gba", 0x003f104c, 0xb38

	.global gUnknown_083F1B84
gUnknown_083F1B84: @ 83F1B84
	.incbin "baserom.gba", 0x003f1b84, 0xfb8

	.global gUnknown_083F2B3C
gUnknown_083F2B3C: @ 83F2B3C
	.incbin "baserom.gba", 0x003f2b3c, 0x1130

	.global gUnknown_083F3C6C
gUnknown_083F3C6C: @ 83F3C6C
	.incbin "baserom.gba", 0x003f3c6c, 0x5f4

	.global gUnknown_083F4260
gUnknown_083F4260: @ 83F4260
	.incbin "baserom.gba", 0x003f4260, 0x50c

	.global gUnknown_083F476C
gUnknown_083F476C: @ 83F476C
	.incbin "baserom.gba", 0x003f476c, 0x50c

	.global gUnknown_083F4C78
gUnknown_083F4C78: @ 83F4C78
	.incbin "baserom.gba", 0x003f4c78, 0x50c

	.global gUnknown_083F5184
gUnknown_083F5184: @ 83F5184
	.incbin "baserom.gba", 0x003f5184, 0x50c

	.global gUnknown_083F5690
gUnknown_083F5690: @ 83F5690
	.incbin "baserom.gba", 0x003f5690, 0x50c

	.global gUnknown_083F5B9C
gUnknown_083F5B9C: @ 83F5B9C
	.incbin "baserom.gba", 0x003f5b9c, 0x510

	.global gUnknown_083F60AC
gUnknown_083F60AC: @ 83F60AC
	.incbin "baserom.gba", 0x003f60ac, 0x14

	.global gUnknown_083F60C0
gUnknown_083F60C0: @ 83F60C0
	.incbin "baserom.gba", 0x003f60c0, 0x78

	.global gUnknown_083F6138
gUnknown_083F6138: @ 83F6138
	.incbin "baserom.gba", 0x003f6138, 0x8

	.global gUnknown_083F6140
gUnknown_083F6140: @ 83F6140
	.incbin "baserom.gba", 0x003f6140, 0x4

	.global gUnknown_083F6144
gUnknown_083F6144: @ 83F6144
	.incbin "baserom.gba", 0x003f6144, 0x178

	.global gUnknown_083F62BC
gUnknown_083F62BC: @ 83F62BC
	.incbin "baserom.gba", 0x003f62bc, 0x1c

	.global gUnknown_083F62D8
gUnknown_083F62D8: @ 83F62D8
	.incbin "baserom.gba", 0x003f62d8, 0x10

	.global gUnknown_083F62E8
gUnknown_083F62E8: @ 83F62E8
	.incbin "baserom.gba", 0x003f62e8, 0x4

	.global gUnknown_083F62EC
gUnknown_083F62EC: @ 83F62EC
	.incbin "baserom.gba", 0x003f62ec, 0x2

	.global gUnknown_083F62EE
gUnknown_083F62EE: @ 83F62EE
	.incbin "baserom.gba", 0x003f62ee, 0x7e

	.global gUnknown_083F636C
gUnknown_083F636C: @ 83F636C
	.incbin "baserom.gba", 0x003f636c, 0x18c

	.global gUnknown_083F64F8
gUnknown_083F64F8: @ 83F64F8
	.incbin "baserom.gba", 0x003f64f8, 0x1f8

	.global gUnknown_083F66F0
gUnknown_083F66F0: @ 83F66F0
	.incbin "baserom.gba", 0x003f66f0, 0xfc8

	.global gUnknown_083F76B8
gUnknown_083F76B8: @ 83F76B8
	.incbin "baserom.gba", 0x003f76b8, 0x6

	.global gUnknown_083F76BE
gUnknown_083F76BE: @ 83F76BE
	.incbin "baserom.gba", 0x003f76be, 0x6

	.global gUnknown_083F76C4
gUnknown_083F76C4: @ 83F76C4
	.incbin "baserom.gba", 0x003f76c4, 0x20

	.global gUnknown_083F76E4
gUnknown_083F76E4: @ 83F76E4
	.incbin "baserom.gba", 0x003f76e4, 0xa8

	.global gUnknown_083F778C
gUnknown_083F778C: @ 83F778C
	.incbin "baserom.gba", 0x003f778c, 0x8

	.global gUnknown_083F7794
gUnknown_083F7794: @ 83F7794
	.incbin "baserom.gba", 0x003f7794, 0x10

	.global gUnknown_083F77A4
gUnknown_083F77A4: @ 83F77A4
	.incbin "baserom.gba", 0x003f77a4, 0x10

	.global gUnknown_083F77B4
gUnknown_083F77B4: @ 83F77B4
	.incbin "baserom.gba", 0x003f77b4, 0x18

	.global gUnknown_083F77CC
gUnknown_083F77CC: @ 83F77CC
	.incbin "baserom.gba", 0x003f77cc, 0x18

	.global gUnknown_083F77E4
gUnknown_083F77E4: @ 83F77E4
	.incbin "baserom.gba", 0x003f77e4, 0x18

	.global gUnknown_083F77FC
gUnknown_083F77FC: @ 83F77FC
	.incbin "baserom.gba", 0x003f77fc, 0x294

	.global gUnknown_083F7A90
gUnknown_083F7A90: @ 83F7A90
	.incbin "baserom.gba", 0x003f7a90, 0x10

	.global gUnknown_083F7AA0
gUnknown_083F7AA0: @ 83F7AA0
	.incbin "baserom.gba", 0x003f7aa0, 0x38

	.global gUnknown_083F7AD8
gUnknown_083F7AD8: @ 83F7AD8
	.incbin "baserom.gba", 0x003f7ad8, 0x18

	.global gUnknown_083F7AF0
gUnknown_083F7AF0: @ 83F7AF0
	.incbin "baserom.gba", 0x003f7af0, 0x38

	.global gUnknown_083F7B28
gUnknown_083F7B28: @ 83F7B28
	.incbin "baserom.gba", 0x003f7b28, 0x18

	.global gUnknown_083F7B40
gUnknown_083F7B40: @ 83F7B40
	.incbin "baserom.gba", 0x003f7b40, 0x18

	.global gUnknown_083F7B58
gUnknown_083F7B58: @ 83F7B58
	.incbin "baserom.gba", 0x003f7b58, 0x2d0

	.global gUnknown_083F7E28
gUnknown_083F7E28: @ 83F7E28
	.incbin "baserom.gba", 0x003f7e28, 0x80

	.global gUnknown_083F7EA8
gUnknown_083F7EA8: @ 83F7EA8
	.incbin "baserom.gba", 0x003f7ea8, 0x10

	.global gUnknown_083F7EB8
gUnknown_083F7EB8: @ 83F7EB8
	.incbin "baserom.gba", 0x003f7eb8, 0x3c

	.global gUnknown_083F7EF4
gUnknown_083F7EF4: @ 83F7EF4
	.incbin "baserom.gba", 0x003f7ef4, 0x28

	.global gUnknown_083F7F1C
gUnknown_083F7F1C: @ 83F7F1C
	.incbin "baserom.gba", 0x003f7f1c, 0x3

	.global gUnknown_083F7F1F
gUnknown_083F7F1F: @ 83F7F1F
	.incbin "baserom.gba", 0x003f7f1f, 0x2

	.global gUnknown_083F7F21
gUnknown_083F7F21: @ 83F7F21
	.incbin "baserom.gba", 0x003f7f21, 0x3

	.global gUnknown_083F7F24
gUnknown_083F7F24: @ 83F7F24
	.incbin "baserom.gba", 0x003f7f24, 0x4c

	.global gUnknown_083F7F70
gUnknown_083F7F70: @ 83F7F70
	.incbin "baserom.gba", 0x003f7f70, 0x4

	.global gUnknown_083F7F74
gUnknown_083F7F74: @ 83F7F74
	.incbin "baserom.gba", 0x003f7f74, 0x8

	.global gUnknown_083F7F7C
gUnknown_083F7F7C: @ 83F7F7C
	.incbin "baserom.gba", 0x003f7f7c, 0x8

	.global gUnknown_083F7F84
gUnknown_083F7F84: @ 83F7F84
	.incbin "baserom.gba", 0x003f7f84, 0x18

	.global gUnknown_083F7F9C
gUnknown_083F7F9C: @ 83F7F9C
	.incbin "baserom.gba", 0x003f7f9c, 0x28

	.global gUnknown_083F7FC4
gUnknown_083F7FC4: @ 83F7FC4
	.incbin "baserom.gba", 0x003f7fc4, 0x88

	.global gUnknown_083F804C
gUnknown_083F804C: @ 83F804C
	.incbin "baserom.gba", 0x003f804c, 0x20

	.global gUnknown_083F806C
gUnknown_083F806C: @ 83F806C
	.incbin "baserom.gba", 0x003f806c, 0x20

	.global gUnknown_083F808C
gUnknown_083F808C: @ 83F808C
	.incbin "baserom.gba", 0x003f808c, 0x10

	.global gUnknown_083F809C
gUnknown_083F809C: @ 83F809C
	.incbin "baserom.gba", 0x003f809c, 0x10

	.global gUnknown_083F80AC
gUnknown_083F80AC: @ 83F80AC
	.incbin "baserom.gba", 0x003f80ac, 0x1e0

	.global gUnknown_083F828C
gUnknown_083F828C: @ 83F828C
	.incbin "baserom.gba", 0x003f828c, 0xb4

	.global gUnknown_083F8340
gUnknown_083F8340: @ 83F8340
	.incbin "baserom.gba", 0x003f8340, 0x18

	.global gUnknown_083F8358
gUnknown_083F8358: @ 83F8358
	.incbin "baserom.gba", 0x003f8358, 0x4

	.global gUnknown_083F835C
gUnknown_083F835C: @ 83F835C
	.incbin "baserom.gba", 0x003f835c, 0x8

	.global gUnknown_083F8364
gUnknown_083F8364: @ 83F8364
	.incbin "baserom.gba", 0x003f8364, 0xc

	.global gUnknown_083F8370
gUnknown_083F8370: @ 83F8370
	.incbin "baserom.gba", 0x003f8370, 0x6

	.global gUnknown_083F8376
gUnknown_083F8376: @ 83F8376
	.incbin "baserom.gba", 0x003f8376, 0xa

	.global gUnknown_083F8380
gUnknown_083F8380: @ 83F8380
	.incbin "baserom.gba", 0x003f8380, 0x40

	.global gUnknown_083F83C0
gUnknown_083F83C0: @ 83F83C0
	.incbin "baserom.gba", 0x003f83c0, 0x20

	.global gUnknown_083F83E0
gUnknown_083F83E0: @ 83F83E0
	.incbin "baserom.gba", 0x003f83e0, 0xc

	.global gUnknown_083F83EC
gUnknown_083F83EC: @ 83F83EC
	.incbin "baserom.gba", 0x003f83ec, 0xc

	.global gUnknown_083F83F8
gUnknown_083F83F8: @ 83F83F8
	.incbin "baserom.gba", 0x003f83f8, 0xc

	.global gUnknown_083F8404
gUnknown_083F8404: @ 83F8404
	.incbin "baserom.gba", 0x003f8404, 0x4

	.global gUnknown_083F8408
gUnknown_083F8408: @ 83F8408
	.incbin "baserom.gba", 0x003f8408, 0x8

	.global gUnknown_083F8410
gUnknown_083F8410: @ 83F8410
	.incbin "baserom.gba", 0x003f8410, 0x8

	.global gUnknown_083F8418
gUnknown_083F8418: @ 83F8418
	.incbin "baserom.gba", 0x003f8418, 0x20

	.global gUnknown_083F8438
gUnknown_083F8438: @ 83F8438
	.incbin "baserom.gba", 0x003f8438, 0x134

	.global gUnknown_083F856C
gUnknown_083F856C: @ 83F856C
	.incbin "baserom.gba", 0x003f856c, 0x2

	.global gUnknown_083F856E
gUnknown_083F856E: @ 83F856E
	.incbin "baserom.gba", 0x003f856e, 0xc

	.global gUnknown_083F857A
gUnknown_083F857A: @ 83F857A
	.incbin "baserom.gba", 0x003f857a, 0x12

	.global gUnknown_083F858C
gUnknown_083F858C: @ 83F858C
	.incbin "baserom.gba", 0x003f858c, 0x8

	.global gUnknown_083F8594
gUnknown_083F8594: @ 83F8594
	.incbin "baserom.gba", 0x003f8594, 0x10

	.global gUnknown_083F85A4
gUnknown_083F85A4: @ 83F85A4
	.incbin "baserom.gba", 0x003f85a4, 0xb8

	.global gUnknown_083F865C
gUnknown_083F865C: @ 83F865C
	.incbin "baserom.gba", 0x003f865c, 0x8

	.global gUnknown_083F8664
gUnknown_083F8664: @ 83F8664
	.incbin "baserom.gba", 0x003f8664, 0x10

	.global gUnknown_083F8674
gUnknown_083F8674: @ 83F8674
	.incbin "baserom.gba", 0x003f8674, 0x18

	.global gUnknown_083F868C
gUnknown_083F868C: @ 83F868C
	.incbin "baserom.gba", 0x003f868c, 0x30

	.global gUnknown_083F86BC
gUnknown_083F86BC: @ 83F86BC
	.incbin "baserom.gba", 0x003f86bc, 0x200

	.global gUnknown_083F88BC
gUnknown_083F88BC: @ 83F88BC
	.incbin "baserom.gba", 0x003f88bc, 0x1a4

	.global gUnknown_083F8A60
gUnknown_083F8A60: @ 83F8A60
	.incbin "baserom.gba", 0x003f8a60, 0x1a0

	.global gUnknown_083F8C00
gUnknown_083F8C00: @ 83F8C00
	.incbin "baserom.gba", 0x003f8c00, 0xc

	.global gUnknown_083F8C0C
gUnknown_083F8C0C: @ 83F8C0C
	.incbin "baserom.gba", 0x003f8c0c, 0x184

	.global gUnknown_083F8D90
gUnknown_083F8D90: @ 83F8D90
	.incbin "baserom.gba", 0x003f8d90, 0x4

	.global gUnknown_083F8D94
gUnknown_083F8D94: @ 83F8D94
	.incbin "baserom.gba", 0x003f8d94, 0x5c

	.global gUnknown_083F8DF0
gUnknown_083F8DF0: @ 83F8DF0
	.incbin "baserom.gba", 0x003f8df0, 0x4

	.global gUnknown_083F8DF4
gUnknown_083F8DF4: @ 83F8DF4
	.incbin "baserom.gba", 0x003f8df4, 0x40

	.global gUnknown_083F8E34
gUnknown_083F8E34: @ 83F8E34
	.incbin "baserom.gba", 0x003f8e34, 0x68

	.global gUnknown_083F8E9C
gUnknown_083F8E9C: @ 83F8E9C
	.incbin "baserom.gba", 0x003f8e9c, 0x18

	.global gUnknown_083F8EB4
gUnknown_083F8EB4: @ 83F8EB4
	.incbin "baserom.gba", 0x003f8eb4, 0x8

	.global gUnknown_083F8EBC
gUnknown_083F8EBC: @ 83F8EBC
	.incbin "baserom.gba", 0x003f8ebc, 0x8

	.global gUnknown_083F8EC4
gUnknown_083F8EC4: @ 83F8EC4
	.incbin "baserom.gba", 0x003f8ec4, 0x6

	.global gUnknown_083F8ECA
gUnknown_083F8ECA: @ 83F8ECA
	.incbin "baserom.gba", 0x003f8eca, 0x4

	.global gUnknown_083F8ECE
gUnknown_083F8ECE: @ 83F8ECE
	.incbin "baserom.gba", 0x003f8ece, 0xa

	.global gUnknown_083F8ED8
gUnknown_083F8ED8: @ 83F8ED8
	.incbin "baserom.gba", 0x003f8ed8, 0x10

	.global gUnknown_083F8EE8
gUnknown_083F8EE8: @ 83F8EE8
	.incbin "baserom.gba", 0x003f8ee8, 0xc

	.global gUnknown_083F8EF4
gUnknown_083F8EF4: @ 83F8EF4
	.incbin "baserom.gba", 0x003f8ef4, 0x208

	.global gUnknown_083F90FC
gUnknown_083F90FC: @ 83F90FC
	.incbin "baserom.gba", 0x003f90fc, 0x1ac

	.global gUnknown_083F92A8
gUnknown_083F92A8: @ 83F92A8
	.incbin "baserom.gba", 0x003f92a8, 0xa94

	.global gUnknown_083F9D3C
gUnknown_083F9D3C: @ 83F9D3C
	.incbin "baserom.gba", 0x003f9d3c, 0xf4

	.global gUnknown_083F9E30
gUnknown_083F9E30: @ 83F9E30
	.incbin "baserom.gba", 0x003f9e30, 0xb8

	.global gUnknown_083F9EE8
gUnknown_083F9EE8: @ 83F9EE8
	.incbin "baserom.gba", 0x003f9ee8, 0x6c

	.global gUnknown_083F9F54
gUnknown_083F9F54: @ 83F9F54
	.incbin "baserom.gba", 0x003f9f54, 0x8

	.global gUnknown_083F9F5C
gUnknown_083F9F5C: @ 83F9F5C
	.incbin "baserom.gba", 0x003f9f5c, 0x78

	.global gUnknown_083F9FD4
gUnknown_083F9FD4: @ 83F9FD4
	.incbin "baserom.gba", 0x003f9fd4, 0x60

	.global gUnknown_083FA034
gUnknown_083FA034: @ 83FA034
	.incbin "baserom.gba", 0x003fa034, 0x48

	.global gUnknown_083FA07C
gUnknown_083FA07C: @ 83FA07C
	.incbin "baserom.gba", 0x003fa07c, 0x60

	.global gUnknown_083FA0DC
gUnknown_083FA0DC: @ 83FA0DC
	.incbin "baserom.gba", 0x003fa0dc, 0x140

	.global gUnknown_083FA21C
gUnknown_083FA21C: @ 83FA21C
	.incbin "baserom.gba", 0x003fa21c, 0x94

	.global gUnknown_083FA2B0
gUnknown_083FA2B0: @ 83FA2B0
	.incbin "baserom.gba", 0x003fa2b0, 0x18

	.global gUnknown_083FA2C8
gUnknown_083FA2C8: @ 83FA2C8
	.incbin "baserom.gba", 0x003fa2c8, 0x18

	.global gUnknown_083FA2E0
gUnknown_083FA2E0: @ 83FA2E0
	.incbin "baserom.gba", 0x003fa2e0, 0x18

	.global gUnknown_083FA2F8
gUnknown_083FA2F8: @ 83FA2F8
	.incbin "baserom.gba", 0x003fa2f8, 0x18

	.global gUnknown_083FA310
gUnknown_083FA310: @ 83FA310
	.incbin "baserom.gba", 0x003fa310, 0xfc

	.global gUnknown_083FA40C
gUnknown_083FA40C: @ 83FA40C
	.incbin "baserom.gba", 0x003fa40c, 0x20

	.global gUnknown_083FA42C
gUnknown_083FA42C: @ 83FA42C
	.incbin "baserom.gba", 0x003fa42c, 0x8

	.global gUnknown_083FA434
gUnknown_083FA434: @ 83FA434
	.incbin "baserom.gba", 0x003fa434, 0xd8

	.global gUnknown_083FA50C
gUnknown_083FA50C: @ 83FA50C
	.incbin "baserom.gba", 0x003fa50c, 0x18

	.global gUnknown_083FA524
gUnknown_083FA524: @ 83FA524
	.incbin "baserom.gba", 0x003fa524, 0x9c

	.global gUnknown_083FA5C0
gUnknown_083FA5C0: @ 83FA5C0
	.incbin "baserom.gba", 0x003fa5c0, 0x30

	.global gUnknown_083FA5F0
gUnknown_083FA5F0: @ 83FA5F0
	.incbin "baserom.gba", 0x003fa5f0, 0x18

	.global gUnknown_083FA608
gUnknown_083FA608: @ 83FA608
	.incbin "baserom.gba", 0x003fa608, 0x6

	.global gUnknown_083FA60E
gUnknown_083FA60E: @ 83FA60E
	.incbin "baserom.gba", 0x003fa60e, 0x8

	.global gUnknown_083FA616
gUnknown_083FA616: @ 83FA616
	.incbin "baserom.gba", 0x003fa616, 0x8

	.global gUnknown_083FA61E
gUnknown_083FA61E: @ 83FA61E
	.incbin "baserom.gba", 0x003fa61e, 0x14

	.global gUnknown_083FA632
gUnknown_083FA632: @ 83FA632
	.incbin "baserom.gba", 0x003fa632, 0x18

	.global gUnknown_083FA64A
gUnknown_083FA64A: @ 83FA64A
	.incbin "baserom.gba", 0x003fa64a, 0x2

	.global gUnknown_083FA64C
gUnknown_083FA64C: @ 83FA64C
	.incbin "baserom.gba", 0x003fa64c, 0x830

	.global gUnknown_083FAE7C
gUnknown_083FAE7C: @ 83FAE7C
	.incbin "baserom.gba", 0x003fae7c, 0xa0

	.global gUnknown_083FAF1C
gUnknown_083FAF1C: @ 83FAF1C
	.incbin "baserom.gba", 0x003faf1c, 0x20

	.global gUnknown_083FAF3C
gUnknown_083FAF3C: @ 83FAF3C
	.incbin "baserom.gba", 0x003faf3c, 0x338

	.global gUnknown_083FB274
gUnknown_083FB274: @ 83FB274
	.incbin "baserom.gba", 0x003fb274, 0x484

	.global gUnknown_083FB6F8
gUnknown_083FB6F8: @ 83FB6F8
	.incbin "baserom.gba", 0x003fb6f8, 0x20

	.global gUnknown_083FB718
gUnknown_083FB718: @ 83FB718
	.incbin "baserom.gba", 0x003fb718, 0x20

	.global gUnknown_083FB738
gUnknown_083FB738: @ 83FB738
	.incbin "baserom.gba", 0x003fb738, 0x2

	.global gUnknown_083FB73A
gUnknown_083FB73A: @ 83FB73A
	.incbin "baserom.gba", 0x003fb73a, 0x3a

	.global gUnknown_083FB774
gUnknown_083FB774: @ 83FB774
	.incbin "baserom.gba", 0x003fb774, 0x18

	.global gUnknown_083FB78C
gUnknown_083FB78C: @ 83FB78C
	.incbin "baserom.gba", 0x003fb78c, 0x10

	.global gUnknown_083FB79C
gUnknown_083FB79C: @ 83FB79C
	.incbin "baserom.gba", 0x003fb79c, 0x27c

	.global gUnknown_083FBA18
gUnknown_083FBA18: @ 83FBA18
	.incbin "baserom.gba", 0x003fba18, 0x170

	.global gUnknown_083FBB88
gUnknown_083FBB88: @ 83FBB88
	.incbin "baserom.gba", 0x003fbb88, 0x580

	.global gUnknown_083FC108
gUnknown_083FC108: @ 83FC108
	.incbin "baserom.gba", 0x003fc108, 0x240

	.global gUnknown_083FC348
gUnknown_083FC348: @ 83FC348
	.incbin "baserom.gba", 0x003fc348, 0x11e0

	.global gUnknown_083FD528
gUnknown_083FD528: @ 83FD528
	.incbin "baserom.gba", 0x003fd528, 0x1e0

	.global gUnknown_083FD708
gUnknown_083FD708: @ 83FD708
	.incbin "baserom.gba", 0x003fd708, 0x4

	.global gUnknown_083FD70C
gUnknown_083FD70C: @ 83FD70C
	.incbin "baserom.gba", 0x003fd70c, 0x44

	.global gUnknown_083FD750
gUnknown_083FD750: @ 83FD750
	.incbin "baserom.gba", 0x003fd750, 0x44

	.global gUnknown_083FD794
gUnknown_083FD794: @ 83FD794
	.incbin "baserom.gba", 0x003fd794, 0x10

	.global gUnknown_083FD7A4
gUnknown_083FD7A4: @ 83FD7A4
	.incbin "baserom.gba", 0x003fd7a4, 0xc

	.global gUnknown_083FD7B0
gUnknown_083FD7B0: @ 83FD7B0
	.incbin "baserom.gba", 0x003fd7b0, 0x8

	.global gUnknown_083FD7B8
gUnknown_083FD7B8: @ 83FD7B8
	.incbin "baserom.gba", 0x003fd7b8, 0x8

	.global gUnknown_083FD7C0
gUnknown_083FD7C0: @ 83FD7C0
	.incbin "baserom.gba", 0x003fd7c0, 0x18

	.global gUnknown_083FD7D8
gUnknown_083FD7D8: @ 83FD7D8
	.incbin "baserom.gba", 0x003fd7d8, 0xc

	.global gUnknown_083FD7E4
gUnknown_083FD7E4: @ 83FD7E4
	.incbin "baserom.gba", 0x003fd7e4, 0x4

	.global gUnknown_083FD7E8
gUnknown_083FD7E8: @ 83FD7E8
	.incbin "baserom.gba", 0x003fd7e8, 0xa

	.global gUnknown_083FD7F2
gUnknown_083FD7F2: @ 83FD7F2
	.incbin "baserom.gba", 0x003fd7f2, 0x6

	.global gUnknown_083FD7F8
gUnknown_083FD7F8: @ 83FD7F8
	.incbin "baserom.gba", 0x003fd7f8, 0x1c

	.global gUnknown_083FD814
gUnknown_083FD814: @ 83FD814
	.incbin "baserom.gba", 0x003fd814, 0x8

	.global gUnknown_083FD81C
gUnknown_083FD81C: @ 83FD81C
	.incbin "baserom.gba", 0x003fd81c, 0xc

	.global gUnknown_083FD828
gUnknown_083FD828: @ 83FD828
	.incbin "baserom.gba", 0x003fd828, 0x28

	.global gUnknown_083FD850
gUnknown_083FD850: @ 83FD850
	.incbin "baserom.gba", 0x003fd850, 0x6

	.global gUnknown_083FD856
gUnknown_083FD856: @ 83FD856
	.incbin "baserom.gba", 0x003fd856, 0x14

	.global gUnknown_083FD86A
gUnknown_083FD86A: @ 83FD86A
	.incbin "baserom.gba", 0x003fd86a, 0x16

	.global gUnknown_083FD880
gUnknown_083FD880: @ 83FD880
	.incbin "baserom.gba", 0x003fd880, 0x1c

	.global gUnknown_083FD89C
gUnknown_083FD89C: @ 83FD89C
	.incbin "baserom.gba", 0x003fd89c, 0x4

	.global gUnknown_083FD8A0
gUnknown_083FD8A0: @ 83FD8A0
	.incbin "baserom.gba", 0x003fd8a0, 0x4

	.global gUnknown_083FD8A4
gUnknown_083FD8A4: @ 83FD8A4
	.incbin "baserom.gba", 0x003fd8a4, 0xc

	.global gUnknown_083FD8B0
gUnknown_083FD8B0: @ 83FD8B0
	.incbin "baserom.gba", 0x003fd8b0, 0x14

	.global gUnknown_083FD8C4
gUnknown_083FD8C4: @ 83FD8C4
	.incbin "baserom.gba", 0x003fd8c4, 0x10

	.global gUnknown_083FD8D4
gUnknown_083FD8D4: @ 83FD8D4
	.incbin "baserom.gba", 0x003fd8d4, 0xc

	.global gUnknown_083FD8E0
gUnknown_083FD8E0: @ 83FD8E0
	.incbin "baserom.gba", 0x003fd8e0, 0x14

	.global gUnknown_083FD8F4
gUnknown_083FD8F4: @ 83FD8F4
	.incbin "baserom.gba", 0x003fd8f4, 0x46

	.global gUnknown_083FD93A
gUnknown_083FD93A: @ 83FD93A
	.incbin "baserom.gba", 0x003fd93a, 0xe

	.global gUnknown_083FD948
gUnknown_083FD948: @ 83FD948
	.incbin "baserom.gba", 0x003fd948, 0x44

	.global gUnknown_083FD98C
gUnknown_083FD98C: @ 83FD98C
	.incbin "baserom.gba", 0x003fd98c, 0x6c

	.align 2
	.global gFieldEffectObjectPalette10
gFieldEffectObjectPalette10: @ 83FD9F8
	.incbin "graphics/field_effect_objects/palettes/10.gbapal"

	.align 2
	.global gFieldEffectObjectPaletteInfo10
gFieldEffectObjectPaletteInfo10: @ 83FDA18
	obj_pal gFieldEffectObjectPalette10, 0x1009

	.incbin "baserom.gba", 0x3FDA20, 0xE0

	.global gUnknown_083FDB00
gUnknown_083FDB00: @ 83FDB00
	.incbin "baserom.gba", 0x003fdb00, 0x14

	.global gUnknown_083FDB14
gUnknown_083FDB14: @ 83FDB14
	.incbin "baserom.gba", 0x003fdb14, 0x30

	.global gUnknown_083FDB44
gUnknown_083FDB44: @ 83FDB44
	.incbin "baserom.gba", 0x003fdb44, 0x4b0

	.global gUnknown_083FDFF4
gUnknown_083FDFF4: @ 83FDFF4
	.incbin "baserom.gba", 0x003fdff4, 0x500

	.global gUnknown_083FE4F4
gUnknown_083FE4F4: @ 83FE4F4
@ replacing .incbin "baserom.gba", 0x003fe4f4, 0x969
	.incbin "baserom.gba", 0x003fe4f4, 0xe7
	.string "{STRING 0} gained{PLAYER}\n{STRING 42} EXP. Points!\p$"
	.string "$"
	.string " a boosted$"
	.string "{STRING 0} grew to\nLV. {PLAYER}!{UNKNOWN_A}\p$"
	.string "{STRING 0} learned\n{PLAYER}!{UNKNOWN_A}\p$"
	.string "{STRING 0} is trying to\nlearn {PLAYER}.\p$"
	.string "But, {STRING 0} can’t learn\nmore than four moves.\p$"
	.string "Delete a move to make\nroom for {PLAYER}?$"
	.string "{STRING 0} forgot\n{PLAYER}.\p$"
	.string "{PAUSE 32}Stop learning\n{PLAYER}?$"
	.string "{STRING 0} did not learn\n{PLAYER}.\p$"
	.string "Use next POKéMON?$"
	.string "{ATTACKING_MON}’s\nattack missed!$"
	.string "{DEFENDING_MON}\nprotected itself!$"
	.string "{DEFENDING_MON} avoided\ndamage with {STRING 22}!$"
	.string "{DEFENDING_MON} makes GROUND\nmoves miss with {STRING 22}!$"
	.string "{DEFENDING_MON} avoided\nthe attack!$"
	.string "It doesn’t affect\n{DEFENDING_MON}...$"
	.string "{ATTACKING_MON}\nfainted!\p$"
	.string "{DEFENDING_MON}\nfainted!\p$"
	.string "{STRING 32} got ¥{STRING 0}\nfor winning!\p$"
	.string "{STRING 32} is out of\nuseable POKéMON!\p$"
	.string "{STRING 32} whited out!{PAUSE_UNTIL_PRESS}$"
	.string "{STRING 16} prevents\nescape with {STRING 23}!\p$"
	.string "Can’t escape!\p$"
	.string "{ATTACKING_MON}\ncan’t escape!$"
	.string "Hit {STRING 0} time(s)!$"
	.string "{STRING 14}\nfell asleep!$"
	.string "{STRING 16}’s {STRING 23}\nmade {STRING 14} sleep!$"
	.string "{DEFENDING_MON} is\nalready asleep!$"
	.string "{ATTACKING_MON} is\nalready asleep!$"
	.string "{DEFENDING_MON}\nwasn’t affected!$"
	.string "{STRING 14}\nwas poisoned!$"
	.string "{STRING 16}’s {STRING 23}\npoisoned {STRING 14}!$"
	.string "{ATTACKING_MON} is hurt\nby poison!$"
	.string "{DEFENDING_MON} is already\npoisoned.$"
	.string "{STRING 14} is badly\npoisoned!$"
	.string "{DEFENDING_MON} had its\nenergy drained!$"
	.string "{STRING 14} was burned!$"
	.string "{STRING 16}’s {STRING 23}\nburned {STRING 14}!$"
	.string "{ATTACKING_MON} is hurt\nby its burn!$"
	.string "{DEFENDING_MON} already\nhas a burn.$"
	.string "{STRING 14} was\nfrozen solid!$"
	.string "{STRING 16}’s {STRING 23}\nfroze {STRING 14} solid!$"
	.string "{ATTACKING_MON} is\nfrozen solid!$"
	.string "{DEFENDING_MON} was\ndefrosted!$"
	.string "{ATTACKING_MON} was\ndefrosted!$"
	.string "{ATTACKING_MON} was\ndefrosted by {STRING 17}!$"
	.string "{STRING 14} is paralyzed!\nIt may be unable to move!$"
	.string "{STRING 16}’s {STRING 23}\nparalyzed {STRING 14}!\lIt may be unable to move!$"
	.string "{ATTACKING_MON} is paralyzed!\nIt can’t move!$"
	.string "{DEFENDING_MON} is\nalready paralyzed!$"
	.string "{DEFENDING_MON} was\nhealed of paralysis!$"
	.string "{DEFENDING_MON}’s\ndream was eaten!$"
	.string "{ATTACKING_MON}’s {STRING 0}\nwon’t go higher!$"
	.string "{DEFENDING_MON}’s {STRING 0}\nwon’t go lower!$"
	.string "Your team’s {STRING 0}\nstopped working!$"
	.string "The foe’s {STRING 0}\nstopped working!$"
	.string "{ATTACKING_MON} is\nconfused!$"
	.string "{ATTACKING_MON} snapped\nout of confusion!$"
	.string "{STRING 14} became\nconfused!$"
	.string "{DEFENDING_MON} is\nalready confused!$"
	.string "{DEFENDING_MON}\nfell in love!$"
	.string "{ATTACKING_MON} is in love\nwith {STRING 16}!$"
	.string "{ATTACKING_MON} is\nimmobilized by love!$"
	.string "{DEFENDING_MON} was\nblown away!$"
	.string "{ATTACKING_MON} transformed\ninto the {STRING 0} type!$"
	.string "{ATTACKING_MON} flinched!$"
	.string "{DEFENDING_MON} regained\nhealth!$"
	.string "{DEFENDING_MON}’s\nHP is full!$"
	.string "{STRING 38}’s {STRING 17}\nraised SP. DEF!$"
	.string "{STRING 38}’s {STRING 17}\nraised SP. DEF a little!$"
	.string "{STRING 38}’s {STRING 17}\nraised DEFENSE!$"
	.string "{STRING 38}’s {STRING 17}\nraised DEFENSE a little!$"
	.string "{STRING 38} is covered\nby a veil!$"
	.string "{DEFENDING_MON} is protected\nby SAFEGUARD!$"
	.string "{STRING 40}’s SAFEGUARD\nfaded!$"
	.string "{ATTACKING_MON} went\nto sleep!$"
	.string "{ATTACKING_MON} slept and\nbecame healthy!$"
	.string "{ATTACKING_MON} whipped\nup a whirlwind!$"
	.string "{ATTACKING_MON} took\nin sunlight!$"
	.string "{ATTACKING_MON} lowered\nits head!$"
	.string "{ATTACKING_MON} is glowing!$"
	.string "{ATTACKING_MON} flew\nup high!$"
	.string "{ATTACKING_MON} dug a hole!$"
	.string "{ATTACKING_MON} hid\nunderwater!$"
	.string "{ATTACKING_MON} sprang up!$"
	.string "{DEFENDING_MON} was squeezed by\n{ATTACKING_MON}’s BIND!$"
	.string "{DEFENDING_MON} was trapped\nin the vortex!$"
	.string "{DEFENDING_MON} was trapped\nby SAND TOMB!$"
	.string "{DEFENDING_MON} was WRAPPED by\n{ATTACKING_MON}!$"
	.string "{ATTACKING_MON} CLAMPED\n{DEFENDING_MON}!$"
	.string "{ATTACKING_MON} is hurt\nby {STRING 0}!$"
	.string "{ATTACKING_MON} was freed\nfrom {STRING 0}!$"
	.string "{ATTACKING_MON} kept going\nand crashed!$"

	.global gUnknown_083FEE5D
gUnknown_083FEE5D: @ 83FEE5D
@ replacing .incbin "baserom.gba", 0x003fee5d, 0x35
	.string "{STRING 38} became\nshrouded in MIST!$"
	.string "{STRING 16} is protected\nby MIST!$"

	.global gUnknown_083FEE92
gUnknown_083FEE92: @ 83FEE92
@ replacing .incbin "baserom.gba", 0x003fee92, 0xe38
	.string "{ATTACKING_MON} is getting\npumped!$"
	.string "{ATTACKING_MON} is hit\nwith recoil!$"
	.string "{ATTACKING_MON} protected\nitself!$"
	.string "{ATTACKING_MON} is buffeted\nby the sandstorm!$"
	.string "{ATTACKING_MON} is stricken\nby HAIL!$"
	.string "{STRING 36}’s {STRING 0}\nwore off!$"
	.string "{DEFENDING_MON} was seeded!$"
	.string "{DEFENDING_MON} evaded\nthe attack!$"
	.string "{ATTACKING_MON}’s health is\nsapped by LEECH SEED!$"
	.string "{ATTACKING_MON} is fast\nasleep.$"
	.string "{ATTACKING_MON} woke up!$"
	.string "But {STRING 16}’s UPROAR\nkept it awake!$"
	.string "{ATTACKING_MON} woke up\nin the UPROAR!$"
	.string "{ATTACKING_MON} caused\nan UPROAR!$"
	.string "{ATTACKING_MON} is making\nan UPROAR!$"
	.string "{ATTACKING_MON} calmed down.$"
	.string "But {DEFENDING_MON} can’t\nsleep in an UPROAR!$"
	.string "{ATTACKING_MON} STOCKPILED\n{STRING 0}!$"
	.string "{ATTACKING_MON} can’t\nSTOCKPILE any more!$"
	.string "But {DEFENDING_MON} can’t\nsleep in an UPROAR!$"
	.string "But the UPROAR kept\n{DEFENDING_MON} awake!$"
	.string "{DEFENDING_MON} stayed awake\nusing its {STRING 22}!$"
	.string "{ATTACKING_MON} is storing\nenergy!$"
	.string "{ATTACKING_MON} unleashed\nenergy!$"
	.string "{ATTACKING_MON} became\nconfused out of fatigue!$"
	.string "{STRING 32} picked up\n¥{STRING 0}!\p$"
	.string "{DEFENDING_MON} is\nunaffected!$"
	.string "{ATTACKING_MON} transformed\ninto {STRING 0}!$"
	.string "{ATTACKING_MON} made\na SUBSTITUTE!$"
	.string "{ATTACKING_MON} already\nhas a SUBSTITUTE!$"
	.string "The SUBSTITUTE took damage\nfor {DEFENDING_MON}!\p$"
	.string "{DEFENDING_MON}’s\nSUBSTITUTE faded!\p$"
	.string "{ATTACKING_MON} must\nrecharge!$"
	.string "{DEFENDING_MON}’s RAGE\nis building!$"
	.string "{DEFENDING_MON}’s {STRING 0}\nwas disabled!$"
	.string "{ATTACKING_MON} is disabled\nno more!$"
	.string "{DEFENDING_MON} got\nan ENCORE!$"
	.string "{ATTACKING_MON}’s ENCORE\nended!$"
	.string "{ATTACKING_MON} took aim\nat {DEFENDING_MON}!$"
	.string "{ATTACKING_MON} SKETCHED\n{STRING 0}!$"
	.string "{ATTACKING_MON} is trying\nto take its foe with it!$"
	.string "{DEFENDING_MON} took\n{ATTACKING_MON} with it!$"
	.string "Reduced {DEFENDING_MON}’s\n{STRING 0} by {PLAYER}!$"
	.string "{ATTACKING_MON} stole\n{DEFENDING_MON}’s {STRING 19}!$"
	.string "{DEFENDING_MON} can’t\nescape now!$"
	.string "{DEFENDING_MON} fell into\na NIGHTMARE!$"
	.string "{ATTACKING_MON} is locked\nin a NIGHTMARE!$"
	.string "{ATTACKING_MON} cut its own HP\nand laid a CURSE on\l{DEFENDING_MON}!$"
	.string "{ATTACKING_MON} is afflicted\nby the CURSE!$"
	.string "{STRING 37} POKéMON team had SPIKES\nscattered around it!$"
	.string "{STRING 16} is hurt\nby SPIKES!$"
	.string "{ATTACKING_MON} identified\n{DEFENDING_MON}!$"
	.string "{ATTACKING_MON}’s PERISH count\nfell to {STRING 0}!$"
	.string "{ATTACKING_MON} braced\nitself!$"
	.string "{DEFENDING_MON} ENDURED\nthe hit!$"
	.string "MAGNITUDE {STRING 0}!$"
	.string "{ATTACKING_MON} cut its own HP\nand maximized ATTACK!$"
	.string "{ATTACKING_MON} copied\n{DEFENDING_MON}’s stat changes!$"
	.string "{ATTACKING_MON} got free of\n{DEFENDING_MON}’s {STRING 0}!$"
	.string "{ATTACKING_MON} shed\nLEECH SEED!$"
	.string "{ATTACKING_MON} blew away\nSPIKES!$"
	.string "{ATTACKING_MON} fled from\nbattle!$"
	.string "{ATTACKING_MON} foresaw\nan attack!$"
	.string "{DEFENDING_MON} took\n{STRING 0}’s attack!$"
	.string "{ATTACKING_MON} chose\n{STRING 17} as its destiny!$"
	.string "{STRING 0}’s attack!$"
	.string "{ATTACKING_MON} became the\ncenter of attention!$"
	.string "{ATTACKING_MON} began\ncharging power!$"
	.string "NATURE POWER turned into\n{STRING 17}!$"
	.string "{ATTACKING_MON}’s status\nreturned to normal!$"
	.string "{DEFENDING_MON} was subjected\nto TORMENT!$"
	.string "{ATTACKING_MON} is tightening\nits focus!$"
	.string "{DEFENDING_MON} fell for\nthe TAUNT!$"
	.string "{ATTACKING_MON} is ready to\nhelp {DEFENDING_MON}!$"
	.string "{ATTACKING_MON} switched\nitems with its opponent!$"
	.string "{ATTACKING_MON} obtained\n{STRING 0}.$"
	.string "{DEFENDING_MON} obtained\n{PLAYER}.$"
	.string "{ATTACKING_MON} obtained\n{STRING 0}.\p{DEFENDING_MON} obtained\n{PLAYER}.$"
	.string "{ATTACKING_MON} copied\n{DEFENDING_MON}’s {STRING 22}!$"
	.string "{ATTACKING_MON} made a WISH!$"
	.string "{STRING 0}’s WISH\ncame true!$"
	.string "{ATTACKING_MON} planted its roots!$"
	.string "{ATTACKING_MON} absorbed\nnutrients with its roots!$"
	.string "{DEFENDING_MON} anchored\nitself with its roots!$"
	.string "{ATTACKING_MON} made\n{DEFENDING_MON} drowsy!$"
	.string "{ATTACKING_MON} knocked off\n{DEFENDING_MON}’s {STRING 19}!$"
	.string "{ATTACKING_MON} swapped abilities\nwith its opponent!$"
	.string "{ATTACKING_MON} sealed the\nopponent’s move(s)!$"
	.string "{ATTACKING_MON} wants the\nopponent to bear a GRUDGE!$"
	.string "{ATTACKING_MON}’s {STRING 0}\nlost all its PP due to\lthe GRUDGE!$"
	.string "{ATTACKING_MON} shrouded\nitself in {STRING 17}!$"
	.string "{ATTACKING_MON}’s {STRING 17}\nwas bounced back by MAGIC COAT!$"
	.string "{ATTACKING_MON} awaits its foe\nto make a move!$"
	.string "{DEFENDING_MON} SNATCHED\n{STRING 16}’s move!$"
	.string "Electricity’s power was\nweakened!$"
	.string "Fire’s power was\nweakened!$"
	.string "{ATTACKING_MON} found\none {STRING 19}!$"
	.string "A soothing aroma wafted\nthrough the area!$"
	.string "Items can’t be used now.{PAUSE 64}$"
	.string "For {STRING 16},\n{STRING 19} {STRING 0}$"
	.string "{STRING 16} used\n{STRING 19} to hustle!$"
	.string "{ATTACKING_MON} lost its\nfocus and couldn’t move!$"
	.string "{DEFENDING_MON} was\ndragged out!\p$"
	.string "The wall shattered!$"
	.string "But it had no effect!$"
	.string "{STRING 15} has no\nmoves left!\p$"
	.string "{STRING 15}’s {STRING 17}\nis disabled!\p$"
	.string "{STRING 15} can’t use the same\nmove twice in a row due to the TORMENT!\p$"
	.string "{STRING 15} can’t use\n{STRING 17} after the TAUNT!\p$"
	.string "{STRING 15} can’t use the\nsealed {STRING 17}!\p$"
	.string "{STRING 16}’s {STRING 23}\nmade it rain!$"
	.string "{STRING 16}’s {STRING 23}\nraised its SPEED!$"
	.string "{DEFENDING_MON} was protected\nby {STRING 22}!$"
	.string "{DEFENDING_MON}’s {STRING 22}\nprevents {ATTACKING_MON}\lfrom using {STRING 17}!$"
	.string "{DEFENDING_MON} restored HP\nusing its {STRING 22}!$"
	.string "{DEFENDING_MON}’s {STRING 22}\nmade {STRING 17} useless!$"
	.string "{DEFENDING_MON}’s {STRING 22}\nmade it the {STRING 0} type!$"
	.string "{STRING 14}’s {STRING 22}\nprevents paralysis!$"
	.string "{DEFENDING_MON}’s {STRING 22}\nprevents romance!$"
	.string "{STRING 14}’s {STRING 22}\nprevents poisoning!$"
	.string "{DEFENDING_MON}’s {STRING 22}\nprevents confusion!$"
	.string "{DEFENDING_MON}’s {STRING 22}\nraised its FIRE power!$"
	.string "{DEFENDING_MON} anchors\nitself with {STRING 22}!$"
	.string "{STRING 16}’s {STRING 23}\ncuts {DEFENDING_MON}’s ATTACK!$"
	.string "{STRING 16}’s {STRING 23}\nprevents stat loss!$"
	.string "{DEFENDING_MON}’s {STRING 22}\nhurt {ATTACKING_MON}!$"
	.string "{STRING 16} TRACED\n{STRING 0}’s {PLAYER}!$"
	.string "{STRING 14}’s {STRING 24}\nprevents burns!$"
	.string "{DEFENDING_MON}’s {STRING 22}\nblocks {STRING 17}!$"
	.string "{STRING 16}’s {STRING 23}\nblocks {STRING 17}!$"
	.string "{ATTACKING_MON}’s {STRING 21}\nrestored some HP!$"
	.string "{STRING 16}’s {STRING 23}\nwhipped up a sandstorm!$"
	.string "{STRING 16}’s {STRING 23}\nintensified the sun’s rays!$"
	.string "{STRING 16}’s {STRING 23}\nprevents {STRING 0} loss!$"
	.string "{DEFENDING_MON}’s {STRING 22}\ninfatuated {ATTACKING_MON}!$"
	.string "{DEFENDING_MON}’s {STRING 22}\nmade {STRING 17} ineffective!$"
	.string "{STRING 16}’s {STRING 23}\ncured its {STRING 0} problem!$"
	.string "It sucked up the\nLIQUID OOZE!$"
	.string "{STRING 16} transformed!$"
	.string "{DEFENDING_MON}’s {STRING 22}\ntook the attack!$"

	.global gUnknown_083FFCCA
gUnknown_083FFCCA: @ 83FFCCA
@ replacing .incbin "baserom.gba", 0x003ffcca, 0xe9
	.string "{STRING 0}’s {STRING 20}\nprevents switching!\p$"
	.string "{DEFENDING_MON}’s {STRING 22}\nprevented {STRING 16}’s\l{STRING 0} from working!$"
	.string "{STRING 16}’s {STRING 23}\nmade it ineffective!$"
	.string "{STRING 14}’s {STRING 24}\nprevents flinching!$"
	.string "{ATTACKING_MON}’s {STRING 21}\nprevents {DEFENDING_MON}’s\l{STRING 22} from working!$"
	.string "{STRING 16}’s {STRING 23}\ncured its {STRING 0} problem!$"
	.string "{STRING 16}’s {STRING 23}\nhad no effect on {STRING 14}!$"
	.string "sharply $"

	.global gUnknown_083FFDB3
gUnknown_083FFDB3: @ 83FFDB3
@ replacing .incbin "baserom.gba", 0x003ffdb3, 0x20
	.string "rose!$"
	.string "harshly $"
	.string "fell!$"
	.string "{ATTACKING_MON}’s {STRING 0}\n{PLAYER}$"

	.global gUnknown_083FFDD3
gUnknown_083FFDD3: @ 83FFDD3
@ replacing .incbin "baserom.gba", 0x003ffdd3, 0x129
	.string "{DEFENDING_MON}’s {STRING 0}\n{PLAYER}$"
	.string "Using {STRING 19}, the {STRING 0}\nof {STRING 16} {PLAYER}$"
	.string "{ATTACKING_MON}’s {STRING 0}\n{PLAYER}$"
	.string "{DEFENDING_MON}’s {STRING 0}\n{PLAYER}$"
	.string "{ATTACKING_MON}’s stats won’t\ngo any higher!$"
	.string "{DEFENDING_MON}’s stats won’t\ngo any lower!$"
	.string "A critical hit!$"
	.string "It’s a one-hit KO!$"
	.string "{PAUSE 32}1, {PAUSE 15}2 and...{PAUSE 15} ...{PAUSE 15} ...{PAUSE 15}\n{PAUSE 15}{PLAY_SE SE_KON}Poof!\p$"
	.string "And...\p$"
	.string "HM moves can’t be\nforgotten now.\p$"
	.string "It’s not very effective...$"
	.string "It’s super effective!$"

	.global gUnknown_083FFEFC
gUnknown_083FFEFC: @ 83FFEFC
@ replacing .incbin "baserom.gba", 0x003ffefc, 0x5a
	.string "{PLAY_SE SE_NIGERU}Got away safely!\p$"
	.string "{PLAY_SE SE_NIGERU}{ATTACKING_MON} fled\nusing its {STRING 19}!\p$"
	.string "{PLAY_SE SE_NIGERU}{ATTACKING_MON} fled\nusing {STRING 21}!\p$"
	.string "{PLAY_SE SE_NIGERU}Wild {STRING 0} fled!$"

	.global gUnknown_083FFF56
gUnknown_083FFF56: @ 83FFF56
@ replacing .incbin "baserom.gba", 0x003fff56, 0x14
	.string "Player defeated\n{STRING 29}!$"

	.global gUnknown_083FFF6A
gUnknown_083FFF6A: @ 83FFF6A
@ replacing .incbin "baserom.gba", 0x003fff6a, 0x17
	.string "Player beat {STRING 30}\nand {STRING 29}!$"

	.global gUnknown_083FFF81
gUnknown_083FFF81: @ 83FFF81
@ replacing .incbin "baserom.gba", 0x003fff81, 0x18
	.string "Player lost against\n{STRING 29}!$"

	.global gUnknown_083FFF99
gUnknown_083FFF99: @ 83FFF99
@ replacing .incbin "baserom.gba", 0x003fff99, 0x1a
	.string "Player lost to {STRING 30}\nand {STRING 29}!$"

	.global gUnknown_083FFFB3
gUnknown_083FFFB3: @ 83FFFB3
@ replacing .incbin "baserom.gba", 0x003fffb3, 0x18
	.string "Player tied against\n{STRING 29}!$"

	.global gUnknown_083FFFCB
gUnknown_083FFFCB: @ 83FFFCB
@ replacing .incbin "baserom.gba", 0x003fffcb, 0x1f
	.string "Player tied against {STRING 30}\nand {STRING 29}!$"

	.global gUnknown_083FFFEA
gUnknown_083FFFEA: @ 83FFFEA
@ replacing .incbin "baserom.gba", 0x003fffea, 0xd
	.string "{PLAY_SE SE_NIGERU}{STRING 29} fled!$"

	.global gUnknown_083FFFF7
gUnknown_083FFFF7: @ 83FFFF7
@ replacing .incbin "baserom.gba", 0x003ffff7, 0x55e
	.string "{PLAY_SE SE_NIGERU}{STRING 29} and\n{STRING 30} fled!$"
	.string "No! There’s no running\nfrom a TRAINER battle!\p$"
	.string "Can’t escape!\p$"
	.string "PROF. BIRCH: D-don’t leave\nme here like this!\p$"
	.string "But nothing happened!$"
	.string "But it failed!$"
	.string "It hurt itself in its\nconfusion!$"
	.string "The MIRROR MOVE failed!$"
	.string "It started to rain!$"
	.string "A downpour started!$"
	.string "Rain continues to fall.$"
	.string "The downpour continues.$"
	.string "The rain stopped.$"
	.string "A sandstorm brewed!$"
	.string "The sandstorm rages.$"
	.string "The sandstorm subsided.$"
	.string "The sunlight got bright!$"
	.string "The sunlight is strong.$"
	.string "The sunlight faded.$"
	.string "It started to hail!$"
	.string "Hail continues to fall.$"
	.string "The hail  stopped.$"
	.string "But it failed to SPIT UP\na thing!$"
	.string "But it failed to SWALLOW\na thing!$"
	.string "The wind turned into a\nHEAT WAVE!$"
	.string "All stat changes were\neliminated!$"
	.string "Coins scattered everywhere!$"
	.string "It was too weak to make\na SUBSTITUTE!$"
	.string "The battlers shared\ntheir pain!$"
	.string "A bell chimed!$"
	.string "All affected POKéMON will\nfaint in 3 turns!$"
	.string "There’s no PP left for\nthis move!\p$"
	.string "But there was no PP left\nfor the move!$"
	.string "{ATTACKING_MON} ignored\norders while asleep!$"
	.string "{ATTACKING_MON} ignored\norders!$"
	.string "{ATTACKING_MON} began to nap!$"
	.string "{ATTACKING_MON} is\nloafing around!$"
	.string "{ATTACKING_MON} won’t\nobey!$"
	.string "{ATTACKING_MON} turned away!$"
	.string "{ATTACKING_MON} pretended\nto not notice!$"
	.string "{STRING 25} {STRING 26} is\nabout to use {PLAYER}.\pWill {STRING 32} change\nPOKéMON?$"
	.string "{ATTACKING_MON} learned\n{STRING 0}!$"
	.string "Player defeated\n{STRING 25} {STRING 26}!\p$"
	.string "{STRING 32} crept closer to\n{STR_VAR_2}!$"
	.string "{STRING 32} can’t get any closer!$"
	.string "{STR_VAR_2} is watching\ncarefully!$"
	.string "{STR_VAR_2} is curious about\nthe {STRING 0}!$"
	.string "{STR_VAR_2} is enthralled by\nthe {STRING 0}!$"
	.string "{STR_VAR_2} completely ignored\nthe {STRING 0}!$"
	.string "{STRING 32} threw a {POKEBLOCK}\nat the {STR_VAR_2}!$"
	.string "{PLAY_SE SE_PINPON}ANNOUNCER: You’re out of\nSAFARI BALLS! Game over!\p$"

	.global gUnknown_08400555
gUnknown_08400555: @ 8400555
@ replacing .incbin "baserom.gba", 0x00400555, 0x13
	.string "Wild {STR_VAR_2} appeared!\p$"

	.global gUnknown_08400568
gUnknown_08400568: @ 8400568
@ replacing .incbin "baserom.gba", 0x00400568, 0x13
	.string "Wild {STR_VAR_2} appeared!\p$"

	.global gUnknown_0840057B
gUnknown_0840057B: @ 840057B
@ replacing .incbin "baserom.gba", 0x0040057b, 0x15
	.string "Wild {STR_VAR_2} appeared!{PAUSE 127}$"

	.global gUnknown_08400590
gUnknown_08400590: @ 8400590
@ replacing .incbin "baserom.gba", 0x00400590, 0x1a
	.string "Wild {STRING 5} and\n{STR_VAR_2} appeared!\p$"

	.global gUnknown_084005AA
gUnknown_084005AA: @ 84005AA
@ replacing .incbin "baserom.gba", 0x004005aa, 0x1d
	.string "{STRING 25} {STRING 26}\nwould like to battle!\p$"

	.global gUnknown_084005C7
gUnknown_084005C7: @ 84005C7
@ replacing .incbin "baserom.gba", 0x004005c7, 0x14
	.string "{STRING 29}\nwants to battle!$"

	.global gUnknown_084005DB
gUnknown_084005DB: @ 84005DB
@ replacing .incbin "baserom.gba", 0x004005db, 0x1a
	.string "{STRING 29} and {STRING 30}\nwant to battle!$"

	.global gUnknown_084005F5
gUnknown_084005F5: @ 84005F5
@ replacing .incbin "baserom.gba", 0x004005f5, 0x13
	.string "{STRING 25} {STRING 26} sent\nout {STR_VAR_2}!$"

	.global gUnknown_08400608
gUnknown_08400608: @ 8400608
@ replacing .incbin "baserom.gba", 0x00400608, 0x1a
	.string "{STRING 25} {STRING 26} sent\nout {STR_VAR_2} and {STRING 5}!$"

	.global gUnknown_08400622
gUnknown_08400622: @ 8400622
@ replacing .incbin "baserom.gba", 0x00400622, 0x13
	.string "{STRING 25} {STRING 26} sent\nout {STRING 0}!$"

	.global gUnknown_08400635
gUnknown_08400635: @ 8400635
@ replacing .incbin "baserom.gba", 0x00400635, 0x10
	.string "{STRING 29} sent\nout {STR_VAR_2}!$"

	.global gUnknown_08400645
gUnknown_08400645: @ 8400645
@ replacing .incbin "baserom.gba", 0x00400645, 0x17
	.string "{STRING 29} sent out\n{STR_VAR_2} and {STRING 5}!$"

	.global gUnknown_0840065C
gUnknown_0840065C: @ 840065C
@ replacing .incbin "baserom.gba", 0x0040065c, 0x20
	.string "{STRING 29} sent out\n{VERSION}!\p{STRING 30} sent out\n{GOOD_TEAM}!$"

	.global gUnknown_0840067C
gUnknown_0840067C: @ 840067C
@ replacing .incbin "baserom.gba", 0x0040067c, 0x10
	.string "{STRING 29} sent out\n{STRING 0}!$"

	.global gUnknown_0840068C
gUnknown_0840068C: @ 840068C
@ replacing .incbin "baserom.gba", 0x0040068c, 0x10
	.string "{STRING 31} sent out\n{STRING 0}!$"

	.global gUnknown_0840069C
gUnknown_0840069C: @ 840069C
@ replacing .incbin "baserom.gba", 0x0040069c, 0x8
	.string "Go! {STR_VAR_1}!$"

	.global gUnknown_084006A4
gUnknown_084006A4: @ 84006A4
@ replacing .incbin "baserom.gba", 0x004006a4, 0xf
	.string "Go! {STR_VAR_1} and\n{STR_VAR_3}!$"

	.global gUnknown_084006B3
gUnknown_084006B3: @ 84006B3
@ replacing .incbin "baserom.gba", 0x004006b3, 0x8
	.string "Go! {STRING 0}!$"

	.global gUnknown_084006BB
gUnknown_084006BB: @ 84006BB
@ replacing .incbin "baserom.gba", 0x004006bb, 0xb
	.string "Do it! {STRING 0}!$"

	.global gUnknown_084006C6
gUnknown_084006C6: @ 84006C6
@ replacing .incbin "baserom.gba", 0x004006c6, 0xf
	.string "Go for it, {STRING 0}!$"

	.global gUnknown_084006D5
gUnknown_084006D5: @ 84006D5
@ replacing .incbin "baserom.gba", 0x004006d5, 0x1c
	.string "Your foe’s weak!\nGet’m, {STRING 0}!$"

	.global gUnknown_084006F1
gUnknown_084006F1: @ 84006F1
@ replacing .incbin "baserom.gba", 0x004006f1, 0x18
	.string "{STRING 28} sent out\n{EVIL_TEAM}!\pGo! {RIVAL}!$"

	.global gUnknown_08400709
gUnknown_08400709: @ 8400709
@ replacing .incbin "baserom.gba", 0x00400709, 0x1e
	.string "{STRING 0}, that’s enough!\nCome back!$"

	.global gUnknown_08400727
gUnknown_08400727: @ 8400727
@ replacing .incbin "baserom.gba", 0x00400727, 0xf
	.string "{STRING 0}, come back!$"

	.global gUnknown_08400736
gUnknown_08400736: @ 8400736
@ replacing .incbin "baserom.gba", 0x00400736, 0x13
	.string "{STRING 0}, OK!\nCome back!$"

	.global gUnknown_08400749
gUnknown_08400749: @ 8400749
@ replacing .incbin "baserom.gba", 0x00400749, 0x15
	.string "{STRING 0}, good!\nCome back!$"

	.global gUnknown_0840075E
gUnknown_0840075E: @ 840075E
@ replacing .incbin "baserom.gba", 0x0040075e, 0x13
	.string "{STRING 25} {STRING 26}\nwithdrew {STRING 0}!$"

	.global gUnknown_08400771
gUnknown_08400771: @ 8400771
@ replacing .incbin "baserom.gba", 0x00400771, 0x10
	.string "{STRING 29} withdrew\n{STRING 0}!$"

	.global gUnknown_08400781
gUnknown_08400781: @ 8400781
@ replacing .incbin "baserom.gba", 0x00400781, 0x10
	.string "{STRING 31} withdrew\n{STRING 0}!$"

	.global gUnknown_08400791
gUnknown_08400791: @ 8400791
@ replacing .incbin "baserom.gba", 0x00400791, 0x6
	.string "Wild $"

	.global gUnknown_08400797
gUnknown_08400797: @ 8400797
@ replacing .incbin "baserom.gba", 0x00400797, 0x5
	.string "Foe $"

	.global gUnknown_0840079C
gUnknown_0840079C: @ 840079C
@ replacing .incbin "baserom.gba", 0x0040079c, 0x5
	.string "Foe $"

	.global gUnknown_084007A1
gUnknown_084007A1: @ 84007A1
@ replacing .incbin "baserom.gba", 0x004007a1, 0x6
	.string "Ally $"

	.global gUnknown_084007A7
gUnknown_084007A7: @ 84007A7
@ replacing .incbin "baserom.gba", 0x004007a7, 0x5
	.string "Foe $"

	.global gUnknown_084007AC
gUnknown_084007AC: @ 84007AC
@ replacing .incbin "baserom.gba", 0x004007ac, 0x6
	.string "Ally $"

	.global gUnknown_084007B2
gUnknown_084007B2: @ 84007B2
@ replacing .incbin "baserom.gba", 0x004007b2, 0x5
	.string "Foe $"

	.global gUnknown_084007B7
gUnknown_084007B7: @ 84007B7
@ replacing .incbin "baserom.gba", 0x004007b7, 0x6
	.string "Ally $"

	.global gUnknown_084007BD
gUnknown_084007BD: @ 84007BD
@ replacing .incbin "baserom.gba", 0x004007bd, 0xb
	.string "{ATTACKING_MON} used\n{PLAYER}$"

	.global gUnknown_084007C8
gUnknown_084007C8: @ 84007C8
@ replacing .incbin "baserom.gba", 0x004007c8, 0x2
	.string "!$"

	.global gUnknown_084007CA
gUnknown_084007CA: @ 84007CA
@ replacing .incbin "baserom.gba", 0x004007ca, 0x2
	.string "!$"

	.global gUnknown_084007CC
gUnknown_084007CC: @ 84007CC
@ replacing .incbin "baserom.gba", 0x004007cc, 0x2
	.string "!$"

	.global gUnknown_084007CE
gUnknown_084007CE: @ 84007CE
@ replacing .incbin "baserom.gba", 0x004007ce, 0x2
	.string "!$"

	.global gUnknown_084007D0
gUnknown_084007D0: @ 84007D0
@ replacing .incbin "baserom.gba", 0x004007d0, 0x21d
	.string "!$"
	.string "HP$"
	.string "ATTACK$"
	.string "DEFENSE$"
	.string "SPEED$"
	.string "SP. ATK$"
	.string "SP. DEF$"
	.string "accuracy$"
	.string "evasiveness$"
	.string "was too spicy!$"
	.string "was too dry!$"
	.string "was too sweet!$"
	.string "was too bitter!$"
	.string "was too sour!$"
	.string "{STRING 32} used\n{STRING 19}!$"
	.string "WALLY used\n{STRING 19}!$"
	.string "{STRING 25} {STRING 26}\nused {STRING 19}!$"
	.string "The TRAINER blocked the BALL!$"
	.string "Don’t be a thief!$"
	.string "It dodged the thrown BALL!\nThis POKéMON can’t be caught!$"
	.string "You missed the POKéMON!$"
	.string "Oh, no!\nThe POKéMON broke free!$"
	.string "Aww!\nIt appeared to be caught!$"
	.string "Aargh!\nAlmost had it!$"
	.string "Shoot!\nIt was so close, too!$"
	.string "Gotcha!\n{STR_VAR_2} was caught!{UNKNOWN_A}{PLAY_BGM BGM_KACHI22}\p$"
	.string "Gotcha!\n{STR_VAR_2} was caught!{UNKNOWN_A}{PLAY_BGM BGM_KACHI22}{PAUSE 127}$"
	.string "Give a nickname to the\ncaptured {STR_VAR_2}?$"
	.string "{STR_VAR_2} was sent to\n{STRING 35} PC.$"

	.global gUnknown_084009ED
gUnknown_084009ED: @ 84009ED
@ replacing .incbin "baserom.gba", 0x004009ed, 0xa
	.string "someone’s$"

	.global gUnknown_084009F7
gUnknown_084009F7: @ 84009F7
@ replacing .incbin "baserom.gba", 0x004009f7, 0x81
	.string "LANETTE’s$"
	.string "{STR_VAR_2}’s data was\nadded to the POKéDEX.\p$"
	.string "It is raining.$"
	.string "A sandstorm is raging.$"
	.string "The BOX is full!\nYou can’t catch any more!\p$"

	.global gUnknown_08400A78
gUnknown_08400A78: @ 8400A78
@ replacing .incbin "baserom.gba", 0x00400a78, 0xd
	.string "ENIGMA BERRY$"

	.global gUnknown_08400A85
gUnknown_08400A85: @ 8400A85
@ replacing .incbin "baserom.gba", 0x00400a85, 0x1c5
	.string " BERRY$"
	.string "{STRING 16}’s {STRING 19}\ncured paralysis!$"
	.string "{STRING 16}’s {STRING 19}\ncured poison!$"
	.string "{STRING 16}’s {STRING 19}\nhealed its burn!$"
	.string "{STRING 16}’s {STRING 19}\ndefrosted it!$"
	.string "{STRING 16}’s {STRING 19}\nwoke it from its sleep!$"
	.string "{STRING 16}’s {STRING 19}\nsnapped it out of confusion!$"
	.string "{STRING 16}’s {STRING 19}\ncured its {STRING 0} problem!$"
	.string "{STRING 16}’s {STRING 19}\nnormalized its status!$"
	.string "{STRING 16}’s {STRING 19}\nrestored health!$"
	.string "{STRING 16}’s {STRING 19}\nrestored {STRING 0}’s PP!$"
	.string "{STRING 16}’s {STRING 19}\nrestored its status!$"
	.string "{STRING 16}’s {STRING 19}\nrestored its HP a little!$"
	.string "{STRING 19} allows the\nuse of only {STRING 17}!\p$"
	.string "{DEFENDING_MON} hung on\nusing its {STRING 19}!$"
	.string "$"
	.string "You throw a BALL now, right?\nI... I’ll do my best!$"

	.global gUnknown_08400C4A
gUnknown_08400C4A: @ 8400C4A
@ replacing .incbin "baserom.gba", 0x00400c4a, 0x16
	.string "What?\n{STR_VAR_1} is evolving!$"

	.global gUnknown_08400C60
gUnknown_08400C60: @ 8400C60
@ replacing .incbin "baserom.gba", 0x00400c60, 0x2d
	.string "Congratulations! Your {STR_VAR_1}\nevolved into {STR_VAR_2}!{UNKNOWN_A}\p$"

	.global gUnknown_08400C8D
gUnknown_08400C8D: @ 8400C8D
@ replacing .incbin "baserom.gba", 0x00400c8d, 0x1b
	.string "Huh? {STR_VAR_1}\nstopped evolving!\p$"

	.global gUnknown_08400CA8
gUnknown_08400CA8: @ 8400CA8
@ replacing .incbin "baserom.gba", 0x00400ca8, 0x13
	.string "What should\n{STRING 15} do?$"

	.global gUnknown_08400CBB
gUnknown_08400CBB: @ 8400CBB
@ replacing .incbin "baserom.gba", 0x00400cbb, 0x11
	.string "What will\n{STRING 32} do?$"

	.global gUnknown_08400CCC
gUnknown_08400CCC: @ 8400CCC
@ replacing .incbin "baserom.gba", 0x00400ccc, 0x14
	.string "What will\nWALLY do?$"

	.global gUnknown_08400CE0
gUnknown_08400CE0: @ 8400CE0
@ replacing .incbin "baserom.gba", 0x00400ce0, 0x13
	.string "{PAUSE 16}Link standby...$"

	.global gUnknown_08400CF3
gUnknown_08400CF3: @ 8400CF3
@ replacing .incbin "baserom.gba", 0x00400cf3, 0x22
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}FIGHT{CLEAR_TO 0x2E}BAG\nPOKéMON{CLEAR_TO 0x2E}RUN$"

	.global gUnknown_08400D15
gUnknown_08400D15: @ 8400D15
@ replacing .incbin "baserom.gba", 0x00400d15, 0x23
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}BALL{CLEAR_TO 0x2E}{POKEBLOCK}\nGO NEAR{CLEAR_TO 0x2E}RUN$"

	.global gUnknown_08400D38
gUnknown_08400D38: @ 8400D38
@ replacing .incbin "baserom.gba", 0x00400d38, 0x11
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}PP\nTYPE/$"

	.global gUnknown_08400D49
gUnknown_08400D49: @ 8400D49
@ replacing .incbin "baserom.gba", 0x00400d49, 0x9
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}$"

	.global gUnknown_08400D52
gUnknown_08400D52: @ 8400D52
@ replacing .incbin "baserom.gba", 0x00400d52, 0x28
	.string "{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}{PALETTE 5}Which move should\nbe forgotten?$"

	.global gUnknown_08400D7A
gUnknown_08400D7A: @ 8400D7A
@ replacing .incbin "baserom.gba", 0x00400d7a, 0xf
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}Yes\nNo$"

	.global gUnknown_08400D89
gUnknown_08400D89: @ 8400D89
@ replacing .incbin "baserom.gba", 0x00400d89, 0x16
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}Switch\nwhich?$"

	.global gUnknown_08400D9F
gUnknown_08400D9F: @ 8400D9F
@ replacing .incbin "baserom.gba", 0x00400d9f, 0xb
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}$"
	.string "{RIGHT_ARROW}$"

	.global gUnknown_08400DAA
gUnknown_08400DAA: @ 8400DAA
@ replacing .incbin "baserom.gba", 0x00400daa, 0x2
	.string "+$"

	.global gUnknown_08400DAC
gUnknown_08400DAC: @ 8400DAC
@ replacing .incbin "baserom.gba", 0x00400dac, 0x2a
	.string "-$"
	.string "HP     $"
	.string "ATTACK $"
	.string "DEFENSE$"
	.string "SP. ATK$"
	.string "SP. DEF$"

	.global gUnknown_08400DD6
gUnknown_08400DD6: @ 8400DD6
@ replacing .incbin "baserom.gba", 0x00400dd6, 0x10
	.string "{HIGHLIGHT RED}SAFARI BALLS$"

	.global gUnknown_08400DE6
gUnknown_08400DE6: @ 8400DE6
@ replacing .incbin "baserom.gba", 0x00400de6, 0xa
	.string "{HIGHLIGHT RED}Left: $"

	.global gUnknown_08400DF0
gUnknown_08400DF0: @ 8400DF0
@ replacing .incbin "baserom.gba", 0x00400df0, 0x33
	.string "{HIGHLIGHT RED}$"
	.string "sleep$"
	.string "poison$"
	.string "burn$"
	.string "paralysis$"
	.string "ice$"
	.string "confusion$"
	.string "love$"

	.global gUnknown_08400E23
gUnknown_08400E23: @ 8400E23
@ replacing .incbin "baserom.gba", 0x00400e23, 0x6
	.string " and $"

	.global gUnknown_08400E29
gUnknown_08400E29: @ 8400E29
@ replacing .incbin "baserom.gba", 0x00400e29, 0x3
	.string ", $"

	.global gUnknown_08400E2C
gUnknown_08400E2C: @ 8400E2C
@ replacing .incbin "baserom.gba", 0x00400e2c, 0x2
	.string " $"

	.global gUnknown_08400E2E
gUnknown_08400E2E: @ 8400E2E
@ replacing .incbin "baserom.gba", 0x00400e2e, 0x2
	.string "\l$"

	.global gUnknown_08400E30
gUnknown_08400E30: @ 8400E30
@ replacing .incbin "baserom.gba", 0x00400e30, 0x2
	.string "\n$"

	.global gUnknown_08400E32
gUnknown_08400E32: @ 8400E32
@ replacing .incbin "baserom.gba", 0x00400e32, 0x4
	.string "are$"

	.global gUnknown_08400E36
gUnknown_08400E36: @ 8400E36
@ replacing .incbin "baserom.gba", 0x00400e36, 0x4
	.string "are$"

	.global gUnknown_08400E3A
gUnknown_08400E3A: @ 8400E3A
@ replacing .incbin "baserom.gba", 0x00400e3a, 0x8
	.string "Bad EGG$"

	.global gUnknown_08400E42
gUnknown_08400E42: @ 8400E42
@ replacing .incbin "baserom.gba", 0x00400e42, 0x6
	.string "WALLY$"

	.global gUnknown_08400E48
gUnknown_08400E48: @ 8400E48
@ replacing .incbin "baserom.gba", 0x00400e48, 0x7
	.string "{HIGHLIGHT TRANSPARENT}Win$"

	.global gUnknown_08400E4F
gUnknown_08400E4F: @ 8400E4F
@ replacing .incbin "baserom.gba", 0x00400e4f, 0x8
	.string "{HIGHLIGHT TRANSPARENT}Loss$"

	.global gUnknown_08400E57
gUnknown_08400E57: @ 8400E57
@ replacing .incbin "baserom.gba", 0x00400e57, 0x7
	.string "{HIGHLIGHT TRANSPARENT}Tie$"

	.global gUnknown_08400E5E
gUnknown_08400E5E: @ 8400E5E
@ replacing .incbin "baserom.gba", 0x00400e5e, 0x4
	.string " is$"

	.global gUnknown_08400E62
gUnknown_08400E62: @ 8400E62
@ replacing .incbin "baserom.gba", 0x00400e62, 0xf6
	.string "’s$"
	.string "a NORMAL move$"
	.string "a FIGHTING move$"
	.string "a FLYING move$"
	.string "a POISON move$"
	.string "a GROUND move$"
	.string "a ROCK move$"
	.string "a BUG move$"
	.string "a GHOST move$"
	.string "a STEEL move$"
	.string "a ??? move$"
	.string "a FIRE move$"
	.string "a WATER move$"
	.string "a GRASS move$"
	.string "an ELECTRIC move$"
	.string "a PSYCHIC move$"
	.string "an ICE move$"
	.string "a DRAGON move$"
	.string "a DARK move$"
	.string "   "

	.global gUnknown_08400F58
gUnknown_08400F58: @ 8400F58
	.incbin "baserom.gba", 0x00400f58, 0x20

	.global gUnknown_08400F78
gUnknown_08400F78: @ 8400F78
	.incbin "baserom.gba", 0x00400f78, 0x14

	.global gUnknown_08400F8C
gUnknown_08400F8C: @ 8400F8C
	.incbin "baserom.gba", 0x00400f8c, 0x57c

	.global gUnknown_08401508
gUnknown_08401508: @ 8401508
	.incbin "baserom.gba", 0x00401508, 0x144

	.global gUnknown_0840164C
gUnknown_0840164C: @ 840164C
	.incbin "baserom.gba", 0x0040164c, 0x10

	.global gUnknown_0840165C
gUnknown_0840165C: @ 840165C
	.incbin "baserom.gba", 0x0040165c, 0x18

	.global gUnknown_08401674
gUnknown_08401674: @ 8401674
	.incbin "baserom.gba", 0x00401674, 0x48

	.global gUnknown_084016BC
gUnknown_084016BC: @ 84016BC
	.incbin "baserom.gba", 0x004016bc, 0xec

	.global gUnknown_084017A8
gUnknown_084017A8: @ 84017A8
	.incbin "baserom.gba", 0x004017a8, 0x8

	.global gUnknown_084017B0
gUnknown_084017B0: @ 84017B0
	.incbin "baserom.gba", 0x004017b0, 0x28

	.global gUnknown_084017D8
gUnknown_084017D8: @ 84017D8
	.incbin "baserom.gba", 0x004017d8, 0x18

	.global gUnknown_084017F0
gUnknown_084017F0: @ 84017F0
	.incbin "baserom.gba", 0x004017f0, 0x20

	.global gUnknown_08401810
gUnknown_08401810: @ 8401810
	.incbin "baserom.gba", 0x00401810, 0x10

	.global gUnknown_08401820
gUnknown_08401820: @ 8401820
	.incbin "baserom.gba", 0x00401820, 0x158

	.global gUnknown_08401978
gUnknown_08401978: @ 8401978
	.incbin "baserom.gba", 0x00401978, 0x184

	.global gUnknown_08401AFC
gUnknown_08401AFC: @ 8401AFC
	.incbin "baserom.gba", 0x00401afc, 0x1c4

	.global gUnknown_08401CC0
gUnknown_08401CC0: @ 8401CC0
	.incbin "baserom.gba", 0x00401cc0, 0x4

	.global gUnknown_08401CC4
gUnknown_08401CC4: @ 8401CC4
	.incbin "baserom.gba", 0x00401cc4, 0x4

	.global gUnknown_08401CC8
gUnknown_08401CC8: @ 8401CC8
	.incbin "baserom.gba", 0x00401cc8, 0xc

	.global gUnknown_08401CD4
gUnknown_08401CD4: @ 8401CD4
	.incbin "baserom.gba", 0x00401cd4, 0x24

	.global gUnknown_08401CF8
gUnknown_08401CF8: @ 8401CF8
	.incbin "baserom.gba", 0x00401cf8, 0x20

	.global gUnknown_08401D18
gUnknown_08401D18: @ 8401D18
	.incbin "baserom.gba", 0x00401d18, 0x28

	.global gUnknown_08401D40
gUnknown_08401D40: @ 8401D40
	.incbin "baserom.gba", 0x00401d40, 0x30

	.global gUnknown_08401D70
gUnknown_08401D70: @ 8401D70
	.incbin "baserom.gba", 0x00401d70, 0x18

	.global gUnknown_08401D88
gUnknown_08401D88: @ 8401D88
	.incbin "baserom.gba", 0x00401d88, 0x2

	.global gUnknown_08401D8A
gUnknown_08401D8A: @ 8401D8A
	.incbin "baserom.gba", 0x00401d8a, 0x4

	.global gUnknown_08401D8E
gUnknown_08401D8E: @ 8401D8E
	.incbin "baserom.gba", 0x00401d8e, 0x8

	.global gUnknown_08401D96
gUnknown_08401D96: @ 8401D96
	.incbin "baserom.gba", 0x00401d96, 0x6

	.global gUnknown_08401D9C
gUnknown_08401D9C: @ 8401D9C
	.incbin "baserom.gba", 0x00401d9c, 0x8

	.global gUnknown_08401DA4
gUnknown_08401DA4: @ 8401DA4
	.incbin "baserom.gba", 0x00401da4, 0x70

	.global gUnknown_08401E14
gUnknown_08401E14: @ 8401E14
	.incbin "baserom.gba", 0x00401e14, 0x10

	.global gUnknown_08401E24
gUnknown_08401E24: @ 8401E24
	.incbin "baserom.gba", 0x00401e24, 0x8

	.global gUnknown_08401E2C
gUnknown_08401E2C: @ 8401E2C
	.incbin "baserom.gba", 0x00401e2c, 0x6

	.global gUnknown_08401E32
gUnknown_08401E32: @ 8401E32
	.incbin "baserom.gba", 0x00401e32, 0x4

	.global gUnknown_08401E36
gUnknown_08401E36: @ 8401E36
	.incbin "baserom.gba", 0x00401e36, 0xa

	.global gUnknown_08401E40
gUnknown_08401E40: @ 8401E40
	.incbin "baserom.gba", 0x00401e40, 0x8

	.global gUnknown_08401E48
gUnknown_08401E48: @ 8401E48
	.incbin "baserom.gba", 0x00401e48, 0xc

	.global gUnknown_08401E54
gUnknown_08401E54: @ 8401E54
	.incbin "baserom.gba", 0x00401e54, 0x6

	.global gUnknown_08401E5A
gUnknown_08401E5A: @ 8401E5A
	.incbin "baserom.gba", 0x00401e5a, 0x6

	.global gUnknown_08401E60
gUnknown_08401E60: @ 8401E60
	.incbin "baserom.gba", 0x00401e60, 0x220

	.global gUnknown_08402080
gUnknown_08402080: @ 8402080
	.incbin "baserom.gba", 0x00402080, 0x380

	.global gUnknown_08402400
gUnknown_08402400: @ 8402400
	.incbin "baserom.gba", 0x00402400, 0xb0

	.global gUnknown_084024B0
gUnknown_084024B0: @ 84024B0
	.incbin "baserom.gba", 0x004024b0, 0x38

	.global gUnknown_084024E8
gUnknown_084024E8: @ 84024E8
	.incbin "baserom.gba", 0x004024e8, 0x18

	.global gUnknown_08402500
gUnknown_08402500: @ 8402500
	.incbin "baserom.gba", 0x00402500, 0x18

	.global gUnknown_08402518
gUnknown_08402518: @ 8402518
	.incbin "baserom.gba", 0x00402518, 0x28

	.global gUnknown_08402540
gUnknown_08402540: @ 8402540
	.incbin "baserom.gba", 0x00402540, 0x50

	.global gUnknown_08402590
gUnknown_08402590: @ 8402590
	.incbin "baserom.gba", 0x00402590, 0x30

	.global gUnknown_084025C0
gUnknown_084025C0: @ 84025C0
	.incbin "baserom.gba", 0x004025c0, 0x2c

	.global gUnknown_084025EC
gUnknown_084025EC: @ 84025EC
	.incbin "baserom.gba", 0x004025ec, 0x18

	.global gUnknown_08402604
gUnknown_08402604: @ 8402604
	.incbin "baserom.gba", 0x00402604, 0x4

	.global gUnknown_08402608
gUnknown_08402608: @ 8402608
	.incbin "baserom.gba", 0x00402608, 0x8

	.global gUnknown_08402610
gUnknown_08402610: @ 8402610
	.incbin "baserom.gba", 0x00402610, 0x140

	.global gUnknown_08402750
gUnknown_08402750: @ 8402750
	.incbin "baserom.gba", 0x00402750, 0x15c

	.global gUnknown_084028AC
gUnknown_084028AC: @ 84028AC
	.incbin "baserom.gba", 0x004028ac, 0x20

	.global gUnknown_084028CC
gUnknown_084028CC: @ 84028CC
	.incbin "baserom.gba", 0x004028cc, 0x18

	.global gUnknown_084028E4
gUnknown_084028E4: @ 84028E4
	.incbin "baserom.gba", 0x004028e4, 0x68

	.global gUnknown_0840294C
gUnknown_0840294C: @ 840294C
	.incbin "baserom.gba", 0x0040294c, 0x60

	.global gUnknown_084029AC
gUnknown_084029AC: @ 84029AC
	.incbin "baserom.gba", 0x004029ac, 0x30

	.global gUnknown_084029DC
gUnknown_084029DC: @ 84029DC
	.incbin "baserom.gba", 0x004029dc, 0x14c

	.global gUnknown_08402B28
gUnknown_08402B28: @ 8402B28
	.incbin "baserom.gba", 0x00402b28, 0x1d0

	.global gUnknown_08402CF8
gUnknown_08402CF8: @ 8402CF8
	.incbin "baserom.gba", 0x00402cf8, 0x10

	.global gUnknown_08402D08
gUnknown_08402D08: @ 8402D08
	.incbin "baserom.gba", 0x00402d08, 0x78

	.global gUnknown_08402D80
gUnknown_08402D80: @ 8402D80
	.incbin "baserom.gba", 0x00402d80, 0x8

	.global gUnknown_08402D88
gUnknown_08402D88: @ 8402D88
	.incbin "baserom.gba", 0x00402d88, 0x8

	.global gUnknown_08402D90
gUnknown_08402D90: @ 8402D90
	.incbin "baserom.gba", 0x00402d90, 0x30

	.global gUnknown_08402DC0
gUnknown_08402DC0: @ 8402DC0
	.incbin "baserom.gba", 0x00402dc0, 0x48

	.global gUnknown_08402E08
gUnknown_08402E08: @ 8402E08
	.incbin "baserom.gba", 0x00402e08, 0x1c

	.global gUnknown_08402E24
gUnknown_08402E24: @ 8402E24
	.incbin "baserom.gba", 0x00402e24, 0x15

	.global gUnknown_08402E39
gUnknown_08402E39: @ 8402E39
	.incbin "baserom.gba", 0x00402e39, 0x4

	.global gUnknown_08402E3D
gUnknown_08402E3D: @ 8402E3D
	.incbin "baserom.gba", 0x00402e3d, 0x3

	.global gUnknown_08402E40
gUnknown_08402E40: @ 8402E40
	.incbin "baserom.gba", 0x00402e40, 0x40

	.global gUnknown_08402E80
gUnknown_08402E80: @ 8402E80
	.incbin "baserom.gba", 0x00402e80, 0x80

@ 8402F00
	.include "data/battle_tower/trainers.s"

@ 8403860
	.include "data/battle_tower/held_items.s"

@ 84038E0
	.include "data/battle_tower/level_50_mons.s"

@ 8404BA0
	.include "data/battle_tower/level_100_mons.s"

	.global gUnknown_08405E60
gUnknown_08405E60: @ 8405E60
	.incbin "baserom.gba", 0x00405e60, 0x1e

	.global gUnknown_08405E7E
gUnknown_08405E7E: @ 8405E7E
	.incbin "baserom.gba", 0x00405e7e, 0x14

	.global gUnknown_08405E92
gUnknown_08405E92: @ 8405E92
	.incbin "baserom.gba", 0x00405e92, 0x1e

	.global gUnknown_08405EB0
gUnknown_08405EB0: @ 8405EB0
	.incbin "baserom.gba", 0x00405eb0, 0x14

	.global gUnknown_08405EC4
gUnknown_08405EC4: @ 8405EC4
	.incbin "baserom.gba", 0x00405ec4, 0x16

	.global gUnknown_08405EDA
gUnknown_08405EDA: @ 8405EDA
	.incbin "baserom.gba", 0x00405eda, 0xc

	.global gUnknown_08405EE6
gUnknown_08405EE6: @ 8405EE6
	.incbin "baserom.gba", 0x00405ee6, 0x232

	.global gUnknown_08406118
gUnknown_08406118: @ 8406118
	.incbin "baserom.gba", 0x00406118, 0x14

	.global gUnknown_0840612C
gUnknown_0840612C: @ 840612C
	.incbin "baserom.gba", 0x0040612c, 0x8

	.global gUnknown_08406134
gUnknown_08406134: @ 8406134
	.incbin "baserom.gba", 0x00406134, 0x14

	.global gUnknown_08406148
gUnknown_08406148: @ 8406148
	.incbin "baserom.gba", 0x00406148, 0x8

	.global gUnknown_08406150
gUnknown_08406150: @ 8406150
	.incbin "baserom.gba", 0x00406150, 0x8

	.global gUnknown_08406158
gUnknown_08406158: @ 8406158
	.incbin "baserom.gba", 0x00406158, 0x34

	.global gUnknown_0840618C
gUnknown_0840618C: @ 840618C
	.incbin "baserom.gba", 0x0040618c, 0x18

	.global gUnknown_084061A4
gUnknown_084061A4: @ 84061A4
	.incbin "baserom.gba", 0x004061a4, 0xe4

	.global gUnknown_08406288
gUnknown_08406288: @ 8406288
	.incbin "baserom.gba", 0x00406288, 0x10

	.global gUnknown_08406298
gUnknown_08406298: @ 8406298
	.incbin "baserom.gba", 0x00406298, 0x20

	.global gUnknown_084062B8
gUnknown_084062B8: @ 84062B8
	.incbin "baserom.gba", 0x004062b8, 0x4

	.global gUnknown_084062BC
gUnknown_084062BC: @ 84062BC
	.incbin "baserom.gba", 0x004062bc, 0x4

	.global gUnknown_084062C0
gUnknown_084062C0: @ 84062C0
	.incbin "baserom.gba", 0x004062c0, 0x20

	.global gUnknown_084062E0
gUnknown_084062E0: @ 84062E0
	.incbin "baserom.gba", 0x004062e0, 0x8

	.global gUnknown_084062E8
gUnknown_084062E8: @ 84062E8
	.incbin "baserom.gba", 0x004062e8, 0x8

	.global gUnknown_084062F0
gUnknown_084062F0: @ 84062F0
	.incbin "baserom.gba", 0x004062f0, 0x8

	.global gUnknown_084062F8
gUnknown_084062F8: @ 84062F8
	.incbin "baserom.gba", 0x004062f8, 0x20

	.global gUnknown_08406318
gUnknown_08406318: @ 8406318
	.incbin "baserom.gba", 0x00406318, 0x6

	.global gUnknown_0840631E
gUnknown_0840631E: @ 840631E
	.incbin "baserom.gba", 0x0040631e, 0x9

	.global gUnknown_08406327
gUnknown_08406327: @ 8406327
	.incbin "baserom.gba", 0x00406327, 0x3

	.global gUnknown_0840632A
gUnknown_0840632A: @ 840632A
	.incbin "baserom.gba", 0x0040632a, 0x6

	.global gUnknown_08406330
gUnknown_08406330: @ 8406330
	.incbin "baserom.gba", 0x00406330, 0x4

	.global gUnknown_08406334
gUnknown_08406334: @ 8406334
	.incbin "baserom.gba", 0x00406334, 0x6

	.global gUnknown_0840633A
gUnknown_0840633A: @ 840633A
	.incbin "baserom.gba", 0x0040633a, 0x63a

	.global gUnknown_08406974
gUnknown_08406974: @ 8406974
	.incbin "baserom.gba", 0x00406974, 0x200

	.global gUnknown_08406B74
gUnknown_08406B74: @ 8406B74
	.incbin "baserom.gba", 0x00406b74, 0x3b4

	.global gUnknown_08406F28
gUnknown_08406F28: @ 8406F28
	.incbin "baserom.gba", 0x00406f28, 0x334

	.global gUnknown_0840725C
gUnknown_0840725C: @ 840725C
	.incbin "baserom.gba", 0x0040725c, 0x2f0

	.global gUnknown_0840754C
gUnknown_0840754C: @ 840754C
	.incbin "baserom.gba", 0x0040754c, 0x218

	.global gUnknown_08407764
gUnknown_08407764: @ 8407764
	.incbin "baserom.gba", 0x00407764, 0x2170

	.global gUnknown_084098D4
gUnknown_084098D4: @ 84098D4
	.incbin "baserom.gba", 0x004098d4, 0x200

	.global gUnknown_08409AD4
gUnknown_08409AD4: @ 8409AD4
	.incbin "baserom.gba", 0x00409ad4, 0x130

	.global gUnknown_08409C04
gUnknown_08409C04: @ 8409C04
	.incbin "baserom.gba", 0x00409c04, 0xb54

	.global gUnknown_0840A758
gUnknown_0840A758: @ 840A758
	.incbin "baserom.gba", 0x0040a758, 0x20

	.global gUnknown_0840A778
gUnknown_0840A778: @ 840A778
	.incbin "baserom.gba", 0x0040a778, 0x6c

	.global gUnknown_0840A7E4
gUnknown_0840A7E4: @ 840A7E4
	.incbin "baserom.gba", 0x0040a7e4, 0x63c

	.global gUnknown_0840AE20
gUnknown_0840AE20: @ 840AE20
	.incbin "baserom.gba", 0x0040ae20, 0x60

	.global gUnknown_0840AE80
gUnknown_0840AE80: @ 840AE80
	.incbin "baserom.gba", 0x0040ae80, 0xd0

	.global gUnknown_0840AF50
gUnknown_0840AF50: @ 840AF50
	.incbin "baserom.gba", 0x0040af50, 0x24

	.global gUnknown_0840AF74
gUnknown_0840AF74: @ 840AF74
	.incbin "baserom.gba", 0x0040af74, 0x20

	.global gUnknown_0840AF94
gUnknown_0840AF94: @ 840AF94
	.incbin "baserom.gba", 0x0040af94, 0x18

	.global gUnknown_0840AFAC
gUnknown_0840AFAC: @ 840AFAC
	.incbin "baserom.gba", 0x0040afac, 0x18

	.global gUnknown_0840AFC4
gUnknown_0840AFC4: @ 840AFC4
	.incbin "baserom.gba", 0x0040afc4, 0x2c

	.global gUnknown_0840AFF0
gUnknown_0840AFF0: @ 840AFF0
	.incbin "baserom.gba", 0x0040aff0, 0x18

	.global gUnknown_0840B008
gUnknown_0840B008: @ 840B008
	.incbin "baserom.gba", 0x0040b008, 0x10

	.global gUnknown_0840B018
gUnknown_0840B018: @ 840B018
	.incbin "baserom.gba", 0x0040b018, 0x10

	.global gUnknown_0840B028
gUnknown_0840B028: @ 840B028
	.incbin "baserom.gba", 0x0040b028, 0x3c

	.global gUnknown_0840B064
gUnknown_0840B064: @ 840B064
	.incbin "baserom.gba", 0x0040b064, 0x20

	.global gUnknown_0840B084
gUnknown_0840B084: @ 840B084
	.incbin "baserom.gba", 0x0040b084, 0x2c

	.global gUnknown_0840B0B0
gUnknown_0840B0B0: @ 840B0B0
	.incbin "baserom.gba", 0x0040b0b0, 0x2c

	.global gUnknown_0840B0DC
gUnknown_0840B0DC: @ 840B0DC
	.incbin "baserom.gba", 0x0040b0dc, 0x18

	.global gUnknown_0840B0F4
gUnknown_0840B0F4: @ 840B0F4
	.incbin "baserom.gba", 0x0040b0f4, 0x30

	.global gUnknown_0840B124
gUnknown_0840B124: @ 840B124
	.incbin "baserom.gba", 0x0040b124, 0x2c

	.global gUnknown_0840B150
gUnknown_0840B150: @ 840B150
	.incbin "baserom.gba", 0x0040b150, 0x18

	.global gUnknown_0840B168
gUnknown_0840B168: @ 840B168
	.incbin "baserom.gba", 0x0040b168, 0x8

	.global gUnknown_0840B170
gUnknown_0840B170: @ 840B170
	.incbin "baserom.gba", 0x0040b170, 0x18

	.global gUnknown_0840B188
gUnknown_0840B188: @ 840B188
	.incbin "baserom.gba", 0x0040b188, 0x28

	.global gUnknown_0840B1B0
gUnknown_0840B1B0: @ 840B1B0
	.incbin "baserom.gba", 0x0040b1b0, 0x18

	.global gUnknown_0840B1C8
gUnknown_0840B1C8: @ 840B1C8
	.incbin "baserom.gba", 0x0040b1c8, 0x2c

	.global gUnknown_0840B1F4
gUnknown_0840B1F4: @ 840B1F4
	.incbin "baserom.gba", 0x0040b1f4, 0x18

	.global gUnknown_0840B20C
gUnknown_0840B20C: @ 840B20C
	.incbin "baserom.gba", 0x0040b20c, 0x10

	.global gUnknown_0840B21C
gUnknown_0840B21C: @ 840B21C
	.incbin "baserom.gba", 0x0040b21c, 0x10

	.global gUnknown_0840B22C
gUnknown_0840B22C: @ 840B22C
	.incbin "baserom.gba", 0x0040b22c, 0x10

	.global gUnknown_0840B23C
gUnknown_0840B23C: @ 840B23C
	.incbin "baserom.gba", 0x0040b23c, 0x1c

	.global gUnknown_0840B258
gUnknown_0840B258: @ 840B258
	.incbin "baserom.gba", 0x0040b258, 0x60

	.global gUnknown_0840B2B8
gUnknown_0840B2B8: @ 840B2B8
	.incbin "baserom.gba", 0x0040b2b8, 0xc0

	.global gUnknown_0840B378
gUnknown_0840B378: @ 840B378
	.incbin "baserom.gba", 0x0040b378, 0xc

	.global gUnknown_0840B384
gUnknown_0840B384: @ 840B384
	.incbin "baserom.gba", 0x0040b384, 0x30

	.global gUnknown_0840B3B4
gUnknown_0840B3B4: @ 840B3B4
	.incbin "baserom.gba", 0x0040b3b4, 0x120

	.global gUnknown_0840B4D4
gUnknown_0840B4D4: @ 840B4D4
	.incbin "baserom.gba", 0x0040b4d4, 0x40

	.global gUnknown_0840B514
gUnknown_0840B514: @ 840B514
	.incbin "baserom.gba", 0x0040b514, 0x10

	.global gUnknown_0840B524
gUnknown_0840B524: @ 840B524
	.incbin "baserom.gba", 0x0040b524, 0x10

	.global gUnknown_0840B534
gUnknown_0840B534: @ 840B534
	.incbin "baserom.gba", 0x0040b534, 0x6

	.global gUnknown_0840B53A
gUnknown_0840B53A: @ 840B53A
	.incbin "baserom.gba", 0x0040b53a, 0x2a

	.global gUnknown_0840B564
gUnknown_0840B564: @ 840B564
	.incbin "baserom.gba", 0x0040b564, 0x6

	.global gUnknown_0840B56A
gUnknown_0840B56A: @ 840B56A
	.incbin "baserom.gba", 0x0040b56a, 0x12

	.global gUnknown_0840B57C
gUnknown_0840B57C: @ 840B57C
	.incbin "baserom.gba", 0x0040b57c, 0x24

	.global gUnknown_0840B5A0
gUnknown_0840B5A0: @ 840B5A0
	.incbin "baserom.gba", 0x0040b5a0, 0xfc

	.global gUnknown_0840B69C
gUnknown_0840B69C: @ 840B69C
	.incbin "baserom.gba", 0x0040b69c, 0x1c

	.global gUnknown_0840B6B8
gUnknown_0840B6B8: @ 840B6B8
	.incbin "baserom.gba", 0x0040b6b8, 0xec

	.global gUnknown_0840B7A4
gUnknown_0840B7A4: @ 840B7A4
	.incbin "baserom.gba", 0x0040b7a4, 0x18

	.global gUnknown_0840B7BC
gUnknown_0840B7BC: @ 840B7BC
	.incbin "baserom.gba", 0x0040b7bc, 0x40

	.global gUnknown_0840B7FC
gUnknown_0840B7FC: @ 840B7FC
	.incbin "baserom.gba", 0x0040b7fc, 0x40

	.global gUnknown_0840B83C
gUnknown_0840B83C: @ 840B83C
	.incbin "baserom.gba", 0x0040b83c, 0xf

	.global gUnknown_0840B84B
gUnknown_0840B84B: @ 840B84B
	.incbin "baserom.gba", 0x0040b84b, 0xf

	.global gUnknown_0840B85A
gUnknown_0840B85A: @ 840B85A
	.incbin "baserom.gba", 0x0040b85a, 0xf

	.global gUnknown_0840B869
gUnknown_0840B869: @ 840B869
	.incbin "baserom.gba", 0x0040b869, 0xf

		.global gUnknown_0840B878
gUnknown_0840B878:
	.incbin "baserom.gba", 0x0040B878, 0xF @ unknown

	.include "data/text/credits.s"

	.global gUnknown_0840C5F0
gUnknown_0840C5F0: @ 840C5F0
	.incbin "baserom.gba", 0x0040c5f0, 0x410 @ pointer table to something

	.global gUnknown_0840CA00
gUnknown_0840CA00: @ 840CA00
	.incbin "baserom.gba", 0x0040ca00, 0x54

	.global gUnknown_0840CA54
gUnknown_0840CA54: @ 840CA54
	.incbin "baserom.gba", 0x0040ca54, 0x40

	.global gUnknown_0840CA94
gUnknown_0840CA94: @ 840CA94
	.incbin "baserom.gba", 0x0040ca94, 0xc

	.global gUnknown_0840CAA0
gUnknown_0840CAA0: @ 840CAA0
	.incbin "baserom.gba", 0x0040caa0, 0x10

	.global gUnknown_0840CAB0
gUnknown_0840CAB0: @ 840CAB0
	.incbin "baserom.gba", 0x0040cab0, 0x3c

	.global gUnknown_0840CAEC
gUnknown_0840CAEC: @ 840CAEC
	.incbin "baserom.gba", 0x0040caec, 0x18

	.global gUnknown_0840CB04
gUnknown_0840CB04: @ 840CB04
	.incbin "baserom.gba", 0x0040cb04, 0x8

	.global gUnknown_0840CB0C
gUnknown_0840CB0C: @ 840CB0C
	.incbin "baserom.gba", 0x0040cb0c, 0x40

	.global gUnknown_0840CB4C
gUnknown_0840CB4C: @ 840CB4C
	.incbin "baserom.gba", 0x0040cb4c, 0x73c

	.global gUnknown_0840D288
gUnknown_0840D288: @ 840D288
	.incbin "baserom.gba", 0x0040d288, 0x9f8

	.global gExpandedPlaceholder_Empty
gExpandedPlaceholder_Empty: @ 840DC80
	.string "$"

	.global gExpandedPlaceholder_MaleEmpty
gExpandedPlaceholder_MaleEmpty: @ 840DC81
	.string "$"

	.global gExpandedPlaceholder_FemaleEmpty
gExpandedPlaceholder_FemaleEmpty: @ 840DC82
	.string "$"

	.global gExpandedPlaceholder_Sapphire
gExpandedPlaceholder_Sapphire: @ 840DC83
	.string "SAPPHIRE$"

	.global gExpandedPlaceholder_Ruby
gExpandedPlaceholder_Ruby: @ 840DC8C
	.string "RUBY$"

	.global gExpandedPlaceholder_Aqua
gExpandedPlaceholder_Aqua: @ 840DC91
	.string "AQUA$"

	.global gExpandedPlaceholder_Magma
gExpandedPlaceholder_Magma: @ 840DC96
	.string "MAGMA$"

	.global gExpandedPlaceholder_Archie
gExpandedPlaceholder_Archie: @ 840DC9C
	.string "ARCHIE$"

	.global gExpandedPlaceholder_Maxie
gExpandedPlaceholder_Maxie: @ 840DCA3
	.string "MAXIE$"

	.global gExpandedPlaceholder_Kyogre
gExpandedPlaceholder_Kyogre: @ 840DCA9
	.string "KYOGRE$"

	.global gExpandedPlaceholder_Groudon
gExpandedPlaceholder_Groudon: @ 840DCB0
	.string "GROUDON$"

	.global gExpandedPlaceholder_Brendan
gExpandedPlaceholder_Brendan: @ 840DCB8
	.string "BRENDAN$"

	.global gExpandedPlaceholder_May
gExpandedPlaceholder_May: @ 840DCC0
	.string "MAY$"

	.global gUnknown_0840DCC4
gUnknown_0840DCC4: @ 840DCC4
	.string "EGG$"

	.global gUnknown_0840DCC8
gUnknown_0840DCC8: @ 840DCC8
	.string "POKéMON$"

	.global gUnknown_0840DCD0
gUnknown_0840DCD0: @ 840DCD0
	.string "NEW GAME$"

	.global gUnknown_0840DCD9
gUnknown_0840DCD9: @ 840DCD9
	.string "CONTINUE$"

	.global gUnknown_0840DCE2
gUnknown_0840DCE2: @ 840DCE2
	.string "OPTION$"

	.global gUnknown_0840DCE9
gUnknown_0840DCE9: @ 840DCE9
	.string "MYSTERY EVENTS$"
	.string "Updating save file using external\ndata. Please wait.$"
	.string "The save file has been updated.$"
	.string "The save file has been updated.\pFurther game data cannot be saved\nto the backup memory.\pPlease exchange the backup memory.\pFor details, please contact the\nNintendo Service Center.$"
	.string "The save file could not be updated.\pPlease exchange the backup\nmemory.\pFor details, please contact the\nNintendo Service Center.$"

	.global gUnknown_0840DE81
gUnknown_0840DE81: @ 840DE81
	.string "The save file is corrupt. The\nprevious save file will be loaded.$"

	.global gUnknown_0840DEC2
gUnknown_0840DEC2: @ 840DEC2
	.string " The save file has been deleted...$" @ there's a blank spot at the beginning of this string. No idea why.

	.global gUnknown_0840DEE5
gUnknown_0840DEE5: @ 840DEE5
	.string "The 1M sub-circuit board is\nnot installed.$"

	.global gUnknown_0840DF10
gUnknown_0840DF10: @ 840DF10
	.string "The internal battery has run dry.\nThe game can be played.\pHowever, clock-based events will\nno longer occur.$"

	.global gUnknown_0840DF7C
gUnknown_0840DF7C: @ 840DF7C
	.string "PLAYER$"

	.global gUnknown_0840DF83
gUnknown_0840DF83: @ 840DF83
	.string "POKéDEX$"

	.global gUnknown_0840DF8B
gUnknown_0840DF8B: @ 840DF8B
	.string "TIME$"

	.global gUnknown_0840DF90
gUnknown_0840DF90: @ 840DF90
	.string "BADGES$"
	.string "BOY$"
	.string "GIRL$"
	.string "NEW NAME$"
	.string "LANDON$"
	.string "TERRY$"
	.string "SETH$"
	.string "TOM$"
	.string "TERRA$"
	.string "KIMMY$"
	.string "NICOLA$"
	.string "SARA$"
	.string "This is what we call\na POKéMON.$"

	.global gUnknown_0840DFF7
gUnknown_0840DFF7: @ 840DFF7 @ replacing .incbin "baserom.gba", 0x0040dff7, 0x2
	.string "\p$"

	.global gUnknown_0840DFF9
gUnknown_0840DFF9: @ 840DFF9
	.string "            ????? POKéMON$" @ why 12 spaces?

	.global gUnknown_0840E013
gUnknown_0840E013: @ 840E013
	.incbin "baserom.gba", 0x0040e013, 0xa @ unknown size of dummy pokemon

	.global gUnknown_0840E01D
gUnknown_0840E01D: @ 840E01D
	.string "????.? lbs.$"
	.string "$"

	.global gUnknown_0840E02A
gUnknown_0840E02A: @ 840E02A
	.incbin "baserom.gba", 0x0040e02a, 0xb @ unknown cry of dummy pokemon

	.global gUnknown_0840E035
gUnknown_0840E035: @ 840E035
	.string "SIZE COMPARED TO $"

	.global gUnknown_0840E047
gUnknown_0840E047: @ 840E047
	.string "POKéDEX registration completed.$"

	.global gUnknown_0840E067
gUnknown_0840E067: @ 840E067
	.string "Searching...\nPlease wait.$"

	.global gUnknown_0840E081
gUnknown_0840E081: @ 840E081
	.string "Search completed.$"

	.global gUnknown_0840E093
gUnknown_0840E093: @ 840E093
	.string "No matching POKéMON were found.$"
	.string "Search for POKéMON based on\nselected parameters.$"
	.string "Switch POKéDEX listings.$"
	.string "Return to the POKéDEX.$"
	.string "Select the POKéDEX mode.$"
	.string "Select the POKéDEX listing mode.$"
	.string "List by the first letter in the name.\n/Spotted POKéMON only.$"
	.string "List by body color.\n/Spotted POKéMON only.$"
	.string "List by type.\n/Owned POKéMON only.$"
	.string "Execute search/switch.$"
	.string "HOENN DEX$"
	.string "NATIONAL DEX$"
	.string "NUMERICAL MODE$"
	.string "A TO Z MODE$"
	.string "HEAVIEST MODE$"
	.string "LIGHTEST MODE$"
	.string "TALLEST MODE$"
	.string "SMALLEST MODE$"
	.string "ABC$"
	.string "DEF$"
	.string "GHI$"
	.string "JKL$"
	.string "MNO$"
	.string "PQR$"
	.string "STU$"
	.string "VWX$"
	.string "YZ$"
	.string "RED$"
	.string "BLUE$"
	.string "YELLOW$"
	.string "GREEN$"
	.string "BLACK$"
	.string "BROWN$"
	.string "PURPLE$"
	.string "GRAY$"
	.string "WHITE$"
	.string "PINK$"
	.string "HOENN region’s POKéDEX$"
	.string "National edition POKéDEX$"
	.string "POKéMON are listed according to their\nnumber.$"
	.string "Spotted and owned POKéMON are listed\nalphabetically.$"
	.string "Owned POKéMON are listed from the\nheaviest to the lightest.$"
	.string "Owned POKéMON are listed from the\nlightest to the heaviest.$"
	.string "Owned POKéMON are listed from the\ntallest to the smallest.$"
	.string "Owned POKéMON are listed from the\nsmallest to the tallest.$"
	.string "$"
	.string "DON’T SPECIFY.$"
	.string "NONE$"
	.string "{RIGHT_TRIANGLE_ARROW}$" @ its a black arrow pointing right
	.string " $"

	.global gUnknown_0840E44F
gUnknown_0840E44F: @ 840E44F
	.string "Welcome to the HALL OF FAME!$"
	.string "Spotted POKéMON: {STR_VAR_1}!\nOwned POKéMON: {STR_VAR_2}!\pPROF. BIRCH’s POKéDEX rating!\pPROF. BIRCH: Let’s see...\p$"

	.global gUnknown_0840E4CD
gUnknown_0840E4CD: @ 840E4CD
	.string "SAVING...\nDON’T TURN OFF THE POWER.$"

	.global gUnknown_0840E4F1
gUnknown_0840E4F1: @ 840E4F1
	.string "The HALL OF FAME data is corrupt.$"

	.global gUnknown_0840E513
gUnknown_0840E513: @ 840E513
	.string "HALL OF FAME No. $"

	.global gUnknown_0840E525
gUnknown_0840E525: @ 840E525
	.string "LEAGUE CHAMPION!\nCONGRATULATIONS!$"

	.global gUnknown_0840E547
gUnknown_0840E547: @ 840E547
	.string "No. $"

	.global gUnknown_0840E54C
gUnknown_0840E54C: @ 840E54C
	.string "Lv. $"

	.global gUnknown_0840E551
gUnknown_0840E551: @ 840E551
	.string "IDNo. /$"

	.global gUnknown_0840E559
gUnknown_0840E559: @ 840E559
	.string "NAME /$"

	.global gUnknown_0840E560
gUnknown_0840E560: @ 840E560
	.string "IDNo. /$" @ identical string for no reason?

	.global gUnknown_0840E568
gUnknown_0840E568: @ 840E568
	.string "{HIGHLIGHT WHITE2}{COLOR DARK_GREY}PROF. BIRCH is in trouble!\nRelease a POKéMON and rescue him!$"

	.global gUnknown_0840E5AB
gUnknown_0840E5AB: @ 840E5AB
	.string "{HIGHLIGHT WHITE2}{COLOR DARK_GREY}Do you choose this POKéMON?$"

	.global gUnknown_0840E5CD
gUnknown_0840E5CD: @ 840E5CD
	.string "POKéMON$"

	.global gUnknown_0840E5D5
gUnknown_0840E5D5: @ 840E5D5
	.string "Save error.\pPlease exchange the\nbackup memory.$"

	.global gUnknown_0840E604
gUnknown_0840E604: @ 840E604
	.string "FLY to where?$"
	.string "USE$"
	.string "TOSS$"
	.string "REGISTER$"
	.string "GIVE$"
	.string "CHECK TAG$"
	.string "CONFIRM$"

	.global gUnknown_0840E63B
gUnknown_0840E63B: @ 840E63B
	.string "WALK$"

	.global gUnknown_0840E640
gUnknown_0840E640: @ 840E640
	.string "EXIT$"

	.global gUnknown_0840E645
gUnknown_0840E645: @ 840E645
	.string "CANCEL$"

	.global gUnknown_0840E64C
gUnknown_0840E64C: @ 840E64C
	.string "$"
	.string "CANCEL$"
	.string "ITEM$"
	.string "MAIL$"
	.string "TAKE$"
	.string "STORE$"

	.global gUnknown_0840E669
gUnknown_0840E669: @ 840E669
	.string "CHECK$"

	.global gUnknown_0840E66F
gUnknown_0840E66F: @ 840E66F
	.string "NONE$"

	.global gUnknown_0840E674
gUnknown_0840E674: @ 840E674
	.string "???$"

	.global gUnknown_0840E678
gUnknown_0840E678: @ 840E678
	.string "?????$"
	.string "/$"

	.global gUnknown_0840E680
gUnknown_0840E680: @ 840E680
	.string "-$"

	.global gUnknown_0840E682
gUnknown_0840E682: @ 840E682
	.string "--$"

	.global gUnknown_0840E685
gUnknown_0840E685: @ 840E685
	.string "---$"

	.global gUnknown_0840E689
gUnknown_0840E689: @ 840E689
	.string "♂$"

	.global gUnknown_0840E68B
gUnknown_0840E68B: @ 840E68B
	.string "♀$"
	.string "Lv.$"

	.global gUnknown_0840E691
gUnknown_0840E691: @ 840E691 @ replacing .incbin "baserom.gba", 0x0040e691, 0x6
	.string "{ESCAPE}"
	.byte 0xFB
	.string "$"
	.string "{RIGHT_ARROW}$"

	.global gUnknown_0840E697
gUnknown_0840E697: @ 840E697
	.string "Go back to the\nprevious menu.$"

	.global gUnknown_0840E6B5
gUnknown_0840E6B5: @ 840E6B5
	.string "What would you like to do?$"

	.global gUnknown_0840E6D0
gUnknown_0840E6D0: @ 840E6D0
	.string "×{STR_VAR_1}$"

	.global gUnknown_0840E6D4
gUnknown_0840E6D4: @ 840E6D4
	.string " BERRY$"

	.global gUnknown_0840E6DB
gUnknown_0840E6DB: @ 840E6DB
	.string "{STR_VAR_1} COINS$"

	.global gUnknown_0840E6E4
gUnknown_0840E6E4: @ 840E6E4
	.string "CLOSE BAG$"
	.string "the field.$"
	.string "the battle.$"
	.string "the POKéMON LIST.$"
	.string "the shop.$"
	.string "the field.$"
	.string "the field.$"
	.string "the PC.$"
	.string " "

	.global gUnknown_0840E740
gUnknown_0840E740: @ 840E740
	.incbin "baserom.gba", 0x0040e740, 0x1c @ not text, probably pointers?

	.global gUnknown_0840E75C
gUnknown_0840E75C: @ 840E75C
	.string "Return to$"

	.global gUnknown_0840E766
gUnknown_0840E766: @ 840E766
	.string "What would you\nlike to do?$"

	.global gUnknown_0840E781
gUnknown_0840E781: @ 840E781
	.string "You can’t write\nMAIL here.$"

	.global gUnknown_0840E79C
gUnknown_0840E79C: @ 840E79C
	.string "There is no\nPOKéMON.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840E7B3
gUnknown_0840E7B3: @ 840E7B3
	.string "Switch with which\nitem?$"

	.global gUnknown_0840E7CB
gUnknown_0840E7CB: @ 840E7CB
	.string "{STR_VAR_1} can’t be held.$"

	.global gUnknown_0840E7DD
gUnknown_0840E7DD: @ 840E7DD
	.string "{STR_VAR_1} can’t be held here.$"

	.global gUnknown_0840E7F4
gUnknown_0840E7F4: @ 840E7F4
	.string "How many do you\nwant to deposit?$"

	.global gUnknown_0840E815
gUnknown_0840E815: @ 840E815
	.string "Deposited {STR_VAR_2}\n{STR_VAR_1}(s).$"

	.global gUnknown_0840E829
gUnknown_0840E829: @ 840E829
	.string "There’s no room to\nstore items.$"

	.global gUnknown_0840E849
gUnknown_0840E849: @ 840E849
	.string "You can’t store\nsomeone else’s item\nin the PC.$"

	.global gUnknown_0840E878
gUnknown_0840E878: @ 840E878
	.string "That’s much too\nimportant to toss\nout!$"

	.global gUnknown_0840E89F
gUnknown_0840E89F: @ 840E89F
	.string "Toss out how many?$"

	.global gUnknown_0840E8B2
gUnknown_0840E8B2: @ 840E8B2
	.string "Threw away {STR_VAR_2}\n{STR_VAR_1}(s).$"

	.global gUnknown_0840E8C7
gUnknown_0840E8C7: @ 840E8C7
	.string "Is it okay to\nthrow away {STR_VAR_2}\n{STR_VAR_1}(s)?$"

	.global gUnknown_0840E8EA
gUnknown_0840E8EA: @ 840E8EA
	.string "DAD’s advice...\n{PLAYER}, there’s a time and place for\leverything!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840E929
gUnknown_0840E929: @ 840E929
	.string "You can’t dismount your BIKE here.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840E94E
gUnknown_0840E94E: @ 840E94E
	.string "Oh!\nThe machine’s responding!\pThere’s an item buried around here!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840E992
gUnknown_0840E992: @ 840E992
	.string "The machine’s indicating something\nright underfoot!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840E9C8
gUnknown_0840E9C8: @ 840E9C8
	.string "... ... ... ... Nope!\nThere’s no response.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840E9F5
gUnknown_0840E9F5: @ 840E9F5
	.string "Your COINS:\n{STR_VAR_1}{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EA06
gUnknown_0840EA06: @ 840EA06
	.string "Booted up a TM.$"

	.global gUnknown_0840EA16
gUnknown_0840EA16: @ 840EA16
	.string "Booted up an HM.$"

	.global gUnknown_0840EA27
gUnknown_0840EA27: @ 840EA27
	.string "It contained\n{STR_VAR_1}.\pTeach {STR_VAR_1}\nto a POKéMON?$"

	.global gUnknown_0840EA4F
gUnknown_0840EA4F: @ 840EA4F
	.string "{PLAYER} used the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EA61
gUnknown_0840EA61: @ 840EA61
	.string "But the effects of a REPEL lingered\nfrom earlier.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EA95
gUnknown_0840EA95: @ 840EA95
	.string "{PLAYER} used the\n{STR_VAR_2}.\pWild POKéMON will be lured.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EAC3
gUnknown_0840EAC3: @ 840EAC3
	.string "{PLAYER} used the\n{STR_VAR_2}.\pWild POKéMON will be repelled.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EAF4
gUnknown_0840EAF4: @ 840EAF4
	.string "The BOX is full.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EB07
gUnknown_0840EB07: @ 840EB07
	.string "SIZE /$"

	.global gUnknown_0840EB0E
gUnknown_0840EB0E: @ 840EB0E
	.string "FIRM /$"

	.global gUnknown_0840EB15
gUnknown_0840EB15: @ 840EB15
	.string "{STR_VAR_1}.{STR_VAR_2}”$"
	.string "Very soft$"
	.string "Soft$"
	.string "Hard$"
	.string "Very hard$"
	.string "Super hard$"
	.string "RED {POKEBLOCK}$"
	.string "BLUE {POKEBLOCK}$"
	.string "PINK {POKEBLOCK}$"
	.string "GREEN {POKEBLOCK}$"
	.string "YELLOW {POKEBLOCK}$"
	.string "PURPLE {POKEBLOCK}$"
	.string "INDIGO {POKEBLOCK}$"
	.string "BROWN {POKEBLOCK}$"
	.string "LITEBLUE {POKEBLOCK}$"
	.string "OLIVE {POKEBLOCK}$"
	.string "GRAY {POKEBLOCK}$"
	.string "BLACK {POKEBLOCK}$"
	.string "WHITE {POKEBLOCK}$"
	.string "GOLD {POKEBLOCK}$"

	.global gUnknown_0840EBED
gUnknown_0840EBED: @ 840EBED
	.string "SPICY$"

	.global gUnknown_0840EBF3
gUnknown_0840EBF3: @ 840EBF3
	.string "DRY$"

	.global gUnknown_0840EBF7
gUnknown_0840EBF7: @ 840EBF7
	.string "SWEET$"

	.global gUnknown_0840EBFD
gUnknown_0840EBFD: @ 840EBFD
	.string "BITTER$"

	.global gUnknown_0840EC04
gUnknown_0840EC04: @ 840EC04
	.string "SOUR$"
	.string "TASTY$"
	.string "FEEL$"

	.global gUnknown_0840EC14
gUnknown_0840EC14: @ 840EC14
	.string "Stow CASE.$"

	.global gUnknown_0840EC1F
gUnknown_0840EC1F: @ 840EC1F
	.string "Throw away this\n{STR_VAR_1}?$"

	.global gUnknown_0840EC33
gUnknown_0840EC33: @ 840EC33
	.string "The {STR_VAR_1}\nwas thrown away.$"

	.global gUnknown_0840EC4B
gUnknown_0840EC4B: @ 840EC4B
	.string "{STR_VAR_1} ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EC5C
gUnknown_0840EC5C: @ 840EC5C
	.string "{STR_VAR_1} happily ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EC75
gUnknown_0840EC75: @ 840EC75
	.string "{STR_VAR_1} disdainfully ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"
	.string "BUY$"
	.string "SELL$"
	.string "QUIT$"

	.global gUnknown_0840ECA1
gUnknown_0840ECA1: @ 840ECA1
	.string "Quit shopping.$"

	.global gUnknown_0840ECB0
gUnknown_0840ECB0: @ 840ECB0
	.string "{STR_VAR_1}? Certainly.\nHow many would you like?$"

	.global gUnknown_0840ECD8
gUnknown_0840ECD8: @ 840ECD8
	.string "{STR_VAR_1}? And you wanted {STR_VAR_2}?\nThat will be ¥{STR_VAR_3}.$"

	.global gUnknown_0840ED01
gUnknown_0840ED01: @ 840ED01
	.string "{STR_VAR_1}, is it?\nThat’ll be ¥{STR_VAR_2}. Do you want it?$"

	.global gUnknown_0840ED2C
gUnknown_0840ED2C: @ 840ED2C
	.string "You wanted {STR_VAR_1}?\nThat’ll be ¥{STR_VAR_2}. Will that be okay?$"

	.global gUnknown_0840ED5E
gUnknown_0840ED5E: @ 840ED5E
	.string "Here you go!\nThank you very much.$"

	.global gUnknown_0840ED80
gUnknown_0840ED80: @ 840ED80
	.string "Thank you!\nI’ll send it to your home PC.$"

	.global gUnknown_0840EDA9
gUnknown_0840EDA9: @ 840EDA9
	.string "Thanks!\nI’ll send it to your PC at home.$"

	.global gUnknown_0840EDD2
gUnknown_0840EDD2: @ 840EDD2
	.string "You don’t have enough money.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EDF1
gUnknown_0840EDF1: @ 840EDF1
	.string "You have no more room for items.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EE14
gUnknown_0840EE14: @ 840EE14
	.string "The space for {STR_VAR_1} is full.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EE30
gUnknown_0840EE30: @ 840EE30
	.string "Is there anything else I can help\nyou with?$"

	.global gUnknown_0840EE5C
gUnknown_0840EE5C: @ 840EE5C
	.string "Can I help you with anything else?$"

	.global gUnknown_0840EE7F
gUnknown_0840EE7F: @ 840EE7F
	.string "I’ll throw in a PREMIER BALL, too.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EEA4
gUnknown_0840EEA4: @ 840EEA4
	.string "{STR_VAR_2}? Oh, no.\nI can’t buy that.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EEC4
gUnknown_0840EEC4: @ 840EEC4
	.string "{STR_VAR_2}?\nHow many would you like to sell?$"

	.global gUnknown_0840EEE9
gUnknown_0840EEE9: @ 840EEE9
	.string "I can pay ¥{STR_VAR_1}.\nWould that be okay?$"

	.global gUnknown_0840EF0C
gUnknown_0840EF0C: @ 840EF0C
	.string "Turned over the {STR_VAR_2}\nand received ¥{STR_VAR_1}.$"
	.string "¥{STR_VAR_1}$"
	.string "SHIFT$"
	.string "SEND OUT$"
	.string "SWITCH$"
	.string "SUMMARY$"
	.string "MOVES$"
	.string "ENTER$"
	.string "NO ENTRY$"
	.string "TAKE$"
	.string "READ$"

	.global gUnknown_0840EF72
gUnknown_0840EF72: @ 840EF72
	.string "HP$"

	.global gUnknown_0840EF75
gUnknown_0840EF75: @ 840EF75
	.string "SP. ATK$"

	.global gUnknown_0840EF7D
gUnknown_0840EF7D: @ 840EF7D
	.string "SP. DEF$"

	.global gUnknown_0840EF85
gUnknown_0840EF85: @ 840EF85
	.string "It won’t have any effect.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EFA1
gUnknown_0840EFA1: @ 840EFA1
	.string "This item can’t be used on\nthat POKéMON.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EFCC
gUnknown_0840EFCC: @ 840EFCC
	.string "{STR_VAR_1} can’t be switched\nout!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EFE8
gUnknown_0840EFE8: @ 840EFE8
	.string "{STR_VAR_1} is already\nin battle!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F003
gUnknown_0840F003: @ 840F003
	.string "{STR_VAR_1} has already been\nselected.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F023
gUnknown_0840F023: @ 840F023
	.string "{STR_VAR_1} has no energy\nleft to battle!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F046
gUnknown_0840F046: @ 840F046
	.string "You can’t switch {STR_VAR_1}’s\nPOKéMON with one of yours!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F079
gUnknown_0840F079: @ 840F079
	.string "An EGG can’t battle!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F090
gUnknown_0840F090: @ 840F090
	.string "This can’t be used until a new\nBADGE is obtained.$"

	.global gUnknown_0840F0C2
gUnknown_0840F0C2: @ 840F0C2
	.string "No more than three POKéMON\nmay enter.$"

	.global gUnknown_0840F0E8
gUnknown_0840F0E8: @ 840F0E8
	.string "Send the removed MAIL to\nyour PC?$"

	.global gUnknown_0840F10A
gUnknown_0840F10A: @ 840F10A
	.string "The MAIL was sent to your PC.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F12A
gUnknown_0840F12A: @ 840F12A
	.string "Your PC’s MAILBOX is full.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F147
gUnknown_0840F147: @ 840F147
	.string "If the MAIL is removed, the\nmessage will be lost. Okay?$"

	.global gUnknown_0840F17F
gUnknown_0840F17F: @ 840F17F
	.string "MAIL must be removed before\nholding an item.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F1AE
gUnknown_0840F1AE: @ 840F1AE
	.string "{STR_VAR_1} was given the\n{STR_VAR_2} to hold.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F1CD
gUnknown_0840F1CD: @ 840F1CD
	.string "{STR_VAR_1} is already holding\none {STR_VAR_2}.\pWould you like to switch the\ntwo items?$"

	.global gUnknown_0840F213
gUnknown_0840F213: @ 840F213
	.string "{STR_VAR_1} isn’t\nholding anything.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F230
gUnknown_0840F230: @ 840F230
	.string "Received the {STR_VAR_2}\nfrom {STR_VAR_1}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F24B
gUnknown_0840F24B: @ 840F24B
	.string "MAIL was taken from the\nPOKéMON.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F26E
gUnknown_0840F26E: @ 840F26E
	.string "The {STR_VAR_2} was taken and\nreplaced with the {STR_VAR_1}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F29B
gUnknown_0840F29B: @ 840F29B
	.string "This POKéMON is holding an item.\nIt cannot hold MAIL.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F2D3
gUnknown_0840F2D3: @ 840F2D3
	.string "MAIL was transferred from\nthe MAILBOX.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F2FC
gUnknown_0840F2FC: @ 840F2FC
	.string "The BAG is full. The POKéMON’s\nitem could not be removed.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F338
gUnknown_0840F338: @ 840F338
	.string "{STR_VAR_1} learned\n{STR_VAR_2}!$"

	.global gUnknown_0840F347
gUnknown_0840F347: @ 840F347
	.string "{STR_VAR_1} and {STR_VAR_2}\nare not compatible.\p{STR_VAR_2} can’t be learned.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F37C
gUnknown_0840F37C: @ 840F37C
	.string "{STR_VAR_1} wants to learn the\nmove {STR_VAR_2}.\pHowever, {STR_VAR_1} already\nknows four moves.\pShould a move be deleted and\nreplaced with {STR_VAR_2}?$"

	.global gUnknown_0840F3F0
gUnknown_0840F3F0: @ 840F3F0
	.string "Stop trying to teach\n{STR_VAR_2}?$"

	.global gUnknown_0840F409
gUnknown_0840F409: @ 840F409
	.string "{STR_VAR_1} did not learn the\nmove {STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F429
gUnknown_0840F429: @ 840F429
	.string "Which move should be forgotten?{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F44B
gUnknown_0840F44B: @ 840F44B
	.string "{PAUSE 32}1, {PAUSE 15}2, and{PAUSE 15}... {PAUSE 15}... {PAUSE 15}... {PAUSE 15}{PLAY_SE SE_KON}Poof!\p{STR_VAR_1} forgot how to\nuse {STR_VAR_2}.\pAnd...{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F49E
gUnknown_0840F49E: @ 840F49E
	.string "{STR_VAR_1} already knows\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F4B5
gUnknown_0840F4B5: @ 840F4B5
	.string "{STR_VAR_1}’s HP was restored by\n{STR_VAR_2} points.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F4DA
gUnknown_0840F4DA: @ 840F4DA
	.string "{STR_VAR_1} was cured of its\npoisoning.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F4FB
gUnknown_0840F4FB: @ 840F4FB
	.string "{STR_VAR_1} was cured of\nparalysis.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F518
gUnknown_0840F518: @ 840F518
	.string "{STR_VAR_1} woke up.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F526
gUnknown_0840F526: @ 840F526
	.string "{STR_VAR_1}’s burn was healed.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F53E
gUnknown_0840F53E: @ 840F53E
	.string "{STR_VAR_1} was thawed out.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F553
gUnknown_0840F553: @ 840F553
	.string "PP was restored.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F566
gUnknown_0840F566: @ 840F566
	.string "{STR_VAR_1} regained health.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F57C
gUnknown_0840F57C: @ 840F57C
	.string "{STR_VAR_1} became healthy.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F591
gUnknown_0840F591: @ 840F591
	.string "{STR_VAR_1}’s PP increased.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F5A6
gUnknown_0840F5A6: @ 840F5A6
	.string "{STR_VAR_1} was elevated to\nLv. {STR_VAR_2}.$"

	.global gUnknown_0840F5C1
gUnknown_0840F5C1: @ 840F5C1
	.string "{STR_VAR_1}’s {STR_VAR_2} was\nraised.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F5D7
gUnknown_0840F5D7: @ 840F5D7
	.string "{STR_VAR_1} snapped out of its\nconfusion.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F5FA
gUnknown_0840F5FA: @ 840F5FA
	.string "{STR_VAR_1} got over its\ninfatuation.{PAUSE_UNTIL_PRESS}$"
	.string "Choose a POKéMON.$"
	.string "Move to where?$"
	.string "Teach which POKéMON?$"
	.string "Use on which POKéMON?$"
	.string "Give to which POKéMON?$"
	.string "Do what with {STR_VAR_1}?$"
	.string "There’s nothing to CUT.$"
	.string "You can’t SURF here.$"
	.string "You’re already SURFING.$"
	.string "Can’t use that here.$"
	.string "Restore which move?$"
	.string "Boost PP of which move?$"
	.string "Do what with an item?$"
	.string "No POKéMON for battle!$"
	.string "Choose a POKéMON.$"
	.string "Not enough HP...$"
	.string "Three POKéMON are needed.$"
	.string "POKéMON can’t be the same.$"
	.string "No identical hold items.$"
	.string "Teach which POKéMON?$"

	.global gUnknown_0840F7C6
gUnknown_0840F7C6: @ 840F7C6
	.string "ATTACK$"

	.global gUnknown_0840F7CD
gUnknown_0840F7CD: @ 840F7CD
	.string "DEFENSE$"

	.global gUnknown_0840F7D5
gUnknown_0840F7D5: @ 840F7D5
	.string "SP. ATK$"

	.global gUnknown_0840F7DD
gUnknown_0840F7DD: @ 840F7DD
	.string "SP. DEF$"

	.global gUnknown_0840F7E5
gUnknown_0840F7E5: @ 840F7E5
	.string "SPEED$"

	.global gUnknown_0840F7EB
gUnknown_0840F7EB: @ 840F7EB
	.string "HP$"

	.global gUnknown_0840F7EE
gUnknown_0840F7EE: @ 840F7EE
	.string "$"

	.global gUnknown_0840F7EF
gUnknown_0840F7EF: @ 840F7EF
	.string "OT/$"

	.global gUnknown_0840F7F3
gUnknown_0840F7F3: @ 840F7F3
	.string "TYPE/$"

	.global gUnknown_0840F7F9
gUnknown_0840F7F9: @ 840F7F9
	.string "POWER$"

	.global gUnknown_0840F7FF
gUnknown_0840F7FF: @ 840F7FF
	.string "ACCURACY$"

	.global gUnknown_0840F808
gUnknown_0840F808: @ 840F808
	.string "APPEAL$"

	.global gUnknown_0840F80F
gUnknown_0840F80F: @ 840F80F
	.string "JAM$"

	.global gUnknown_0840F813
gUnknown_0840F813: @ 840F813
	.string "STATUS$"

	.global gUnknown_0840F81A
gUnknown_0840F81A: @ 840F81A
	.string "EXP. POINTS$"

	.global gUnknown_0840F826
gUnknown_0840F826: @ 840F826
	.string "NEXT LV.$"

	.global gUnknown_0840F82F
gUnknown_0840F82F: @ 840F82F
	.string "RIBBONS: 00$"
	.string "EVENT$"
	.string "SWITCH$"
	.string "POKéMON INFO$"
	.string "POKéMON SKILLS$"
	.string "BATTLE MOVES$"
	.string "C0NTEST MOVES$" @why the l33t 0, that's stupid
	.string "INFO$"

	.global gUnknown_0840F884
gUnknown_0840F884: @ 840F884
	.string "It looks like this EGG will\ntake a long time to hatch.$"

	.global gUnknown_0840F8BB
gUnknown_0840F8BB: @ 840F8BB
	.string "What will hatch from this?\nIt will take some time.$"

	.global gUnknown_0840F8EE
gUnknown_0840F8EE: @ 840F8EE
	.string "It moves occasionally.\nIt should hatch soon.$"

	.global gUnknown_0840F91B
gUnknown_0840F91B: @ 840F91B
	.string "It’s making sounds.\nIt’s about to hatch!$"

	.global gUnknown_0840F944
gUnknown_0840F944: @ 840F944
	.string "HM moves can’t be\nforgotten now.$"

	.global gUnknown_0840F965
gUnknown_0840F965: @ 840F965
	.string "’s BASE$"

	.global gUnknown_0840F96D
gUnknown_0840F96D: @ 840F96D
	.string "Is it okay to delete {STR_VAR_1}\nfrom the REGISTRY?$"

	.global gUnknown_0840F998
gUnknown_0840F998: @ 840F998
	.string "The registered data was deleted.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F9BB
gUnknown_0840F9BB: @ 840F9BB
	.string "There is no REGISTRY.{PAUSE_UNTIL_PRESS}$"
	.string "DEL REGIST.$"
	.string "DECORATE$"
	.string "PUT AWAY$"
	.string "TOSS$"
	.string "Put out the selected decoration item.$"
	.string "Store the chosen decoration in the PC.$"
	.string "Throw away unwanted decorations.$"

	.global gUnknown_0840FA64
gUnknown_0840FA64: @ 840FA64
	.string "There are no decorations.{PAUSE_UNTIL_PRESS}$"
	.string "DESK$"
	.string "CHAIR$"
	.string "PLANT$"
	.string "ORNAMENT$"
	.string "MAT$"
	.string "POSTER$"
	.string "DOLL$"
	.string "CUSHION$"

	.global gUnknown_0840FAB2
gUnknown_0840FAB2: @ 840FAB2
	.string "GOLD$"

	.global gUnknown_0840FAB7
gUnknown_0840FAB7: @ 840FAB7
	.string "SILVER$"

	.global gUnknown_0840FABE
gUnknown_0840FABE: @ 840FABE
	.string "Place it here?$"

	.global gUnknown_0840FACD
gUnknown_0840FACD: @ 840FACD @ replacing .incbin "baserom.gba", 0x0040facd, 0x19
	.string "It can’t be placed here.$"

	.global gUnknown_0840FAE6
gUnknown_0840FAE6: @ 840FAE6 @ replacing .incbin "baserom.gba", 0x0040fae6, 0x13
	.string "Cancel decorating?$"

	.global gUnknown_0840FAF9
gUnknown_0840FAF9: @ 840FAF9 @ replacing .incbin "baserom.gba", 0x0040faf9, 0x18
	.string "This is in use already.$"

	.global gUnknown_0840FB11
gUnknown_0840FB11: @ 840FB11 @ replacing .incbin "baserom.gba", 0x0040fb11, 0x46
	.string "No more decorations can be placed.\nThe most that can be placed is {STR_VAR_1}.$"

	.global gUnknown_0840FB57
gUnknown_0840FB57: @ 840FB57 @ replacing .incbin "baserom.gba", 0x0040fb57, 0x7c
	.string "No more decorations can be placed.\nThe most that can be placed is {STR_VAR_1}.$"
	.string "This can’t be placed here.\nIt must be on a DESK, etc.$"

	.global gUnknown_0840FBD3
gUnknown_0840FBD3: @ 840FBD3 @ replacing .incbin "baserom.gba", 0x0040fbd3, 0x32
	.string "This decoration can’t be placed in\nyour own room.$"

	.global gUnknown_0840FC05
gUnknown_0840FC05: @ 840FC05 @ replacing .incbin "baserom.gba", 0x0040fc05, 0x34
	.string "This decoration is in use.\nIt can’t be thrown away.$"

	.global gUnknown_0840FC39
gUnknown_0840FC39: @ 840FC39 @ replacing .incbin "baserom.gba", 0x0040fc39, 0x29
	.string "This {STR_VAR_1} will be discarded.\nIs that okay?$"

	.global gUnknown_0840FC62
gUnknown_0840FC62: @ 840FC62 @ replacing .incbin "baserom.gba", 0x0040fc62, 0x25
	.string "The decoration item was thrown away.$"

	.global gUnknown_0840FC87
gUnknown_0840FC87: @ 840FC87 @ replacing .incbin "baserom.gba", 0x0040fc87, 0x1f
	.string "Stop putting away decorations?$"

	.global gUnknown_0840FCA6
gUnknown_0840FCA6: @ 840FCA6 @ replacing .incbin "baserom.gba", 0x0040fca6, 0x22
	.string "There is no decoration item here.$"

	.global gUnknown_0840FCC8
gUnknown_0840FCC8: @ 840FCC8 @ replacing .incbin "baserom.gba", 0x0040fcc8, 0x22
	.string "Return this decoration to the PC?$"

	.global gUnknown_0840FCEA
gUnknown_0840FCEA: @ 840FCEA @ replacing .incbin "baserom.gba", 0x0040fcea, 0x27
	.string "The decoration was returned to the PC.$"

	.global gUnknown_0840FD11
gUnknown_0840FD11: @ 840FD11 @ replacing .incbin "baserom.gba", 0x0040fd11, 0x62
	.string "There are no decorations in use.{PAUSE_UNTIL_PRESS}$"
	.string "TRISTAN$"
	.string "PHILIP$"
	.string "DENNIS$"
	.string "ROBERTO$"
	.string "TURN OFF$"
	.string "DECORATION$"
	.string "ITEM STORAGE$"

	.global gUnknown_0840FD73
gUnknown_0840FD73: @ 840FD73 @ replacing .incbin "baserom.gba", 0x0040fd73, 0x83
	.string "MAILBOX$"
	.string "DEPOSIT ITEM$"
	.string "WITHDRAW ITEM$"
	.string "TOSS ITEM$"
	.string "Store items in the PC.$"
	.string "Take out items from the PC.$"
	.string "Throw away items stored in the PC.$"

	.global gUnknown_0840FDF6
gUnknown_0840FDF6: @ 840FDF6 @ replacing .incbin "baserom.gba", 0x0040fdf6, 0x16
	.string "There are no items.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840FE0C
gUnknown_0840FE0C: @ 840FE0C @ replacing .incbin "baserom.gba", 0x0040fe0c, 0x22
	.string "There is no more\nroom in the BAG.$"

	.global gUnknown_0840FE2E
gUnknown_0840FE2E: @ 840FE2E @ replacing .incbin "baserom.gba", 0x0040fe2e, 0x22
	.string "How many do you\nwant to withdraw?$"

	.global gUnknown_0840FE50
gUnknown_0840FE50: @ 840FE50 @ replacing .incbin "baserom.gba", 0x0040fe50, 0x18
	.string "Withdrew {STR_VAR_2}\n{STR_VAR_1}(s).$"
	.string "READ$"

	.global gUnknown_0840FE68
gUnknown_0840FE68: @ 840FE68 @ replacing .incbin "baserom.gba", 0x0040fe68, 0x11
	.string "MOVE TO BAG$"
	.string "GIVE$"

	.global gUnknown_0840FE79
gUnknown_0840FE79: @ 840FE79 @ replacing .incbin "baserom.gba", 0x0040fe79, 0x18
	.string "There’s no MAIL here.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840FE91
gUnknown_0840FE91: @ 840FE91 @ replacing .incbin "baserom.gba", 0x0040fe91, 0x2a
	.string "What would you like to do with\n{STR_VAR_1}’s MAIL?$"

	.global gUnknown_0840FEBB
gUnknown_0840FEBB: @ 840FEBB @ replacing .incbin "baserom.gba", 0x0040febb, 0x28
	.string "The message will be lost.\nIs that okay?$"

	.global gUnknown_0840FEE3
gUnknown_0840FEE3: @ 840FEE3 @ replacing .incbin "baserom.gba", 0x0040fee3, 0x13
	.string "The BAG is full.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840FEF6
gUnknown_0840FEF6: @ 840FEF6 @ replacing .incbin "baserom.gba", 0x0040fef6, 0x3c
	.string "The MAIL was returned to the BAG\nwith its message erased.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840FF32
gUnknown_0840FF32: @ 840FF32 @ replacing .incbin "baserom.gba", 0x0040ff32, 0x4
	.string "DAD$"

	.global gUnknown_0840FF36
gUnknown_0840FF36: @ 840FF36 @ replacing .incbin "baserom.gba", 0x0040ff36, 0x4
	.string "MOM$"

	.global gUnknown_0840FF3A
gUnknown_0840FF3A: @ 840FF3A @ replacing .incbin "baserom.gba", 0x0040ff3a, 0x8
	.string "WALLACE$"

	.global gUnknown_0840FF42
gUnknown_0840FF42: @ 840FF42 @ replacing .incbin "baserom.gba", 0x0040ff42, 0x7
	.string "STEVEN$"

	.global gUnknown_0840FF49
gUnknown_0840FF49: @ 840FF49 @ replacing .incbin "baserom.gba", 0x0040ff49, 0x7
	.string "BRAWLY$"

	.global gUnknown_0840FF50
gUnknown_0840FF50: @ 840FF50 @ replacing .incbin "baserom.gba", 0x0040ff50, 0x7
	.string "WINONA$"

	.global gUnknown_0840FF57
gUnknown_0840FF57: @ 840FF57 @ replacing .incbin "baserom.gba", 0x0040ff57, 0x7
	.string "PHOEBE$"

	.global gUnknown_0840FF5E
gUnknown_0840FF5E: @ 840FF5E @ replacing .incbin "baserom.gba", 0x0040ff5e, 0x7
	.string "GLACIA$"

	.global gUnknown_0840FF65
gUnknown_0840FF65: @ 840FF65 @ replacing .incbin "baserom.gba", 0x0040ff65, 0x10
	.string "CONTEST WINNER\n$"

	.global gUnknown_0840FF75
gUnknown_0840FF75: @ 840FF75 @ replacing .incbin "baserom.gba", 0x0040ff75, 0x7de
	.string "’s $"
	.string "COOL $"
	.string "BEAUTY $"
	.string "CUTE $"
	.string "SMART $"
	.string "TOUGH $"
	.string "Nonstop super-cool -\nthe inestimable $"
	.string "$"
	.string "Hey, there!\nThe good-looking POKéMON $"
	.string "$"
	.string "The marvelous, wonderful, and\nvery great $"
	.string "$"
	.string "This century’s last Venus -\nthe beautiful $"
	.string "$"
	.string "$"
	.string "’s dazzling,\nglittering smile$"
	.string "POKéMON CENTER’s super idol -\nthe incomparable $"
	.string "$"
	.string "The lovely and sweet $"
	.string "$"
	.string "The pretty $"
	.string "’s\nwinning portrait$"
	.string "Give us a wink!\nThe cutie POKéMON $"
	.string "$"
	.string "The smartness maestro -\nThe wise POKéMON $"
	.string "$"
	.string "The chosen POKéMON -\nThe one among POKéMON $"
	.string "$"
	.string "The excellent $"
	.string "’s\nmoment of elegance$"
	.string "The powerfully muscular\nspeedster $"
	.string "$"
	.string "The strong, stronger, and\nstrongest $"
	.string "$"
	.string "The mighty tough\nhyper POKéMON $"
	.string "!$"
	.string "PETALBURG$"
	.string "SLATEPORT$"
	.string "LITTLEROOT$"
	.string "LILYCOVE$"
	.string "DEWFORD$"
	.string "ENTER$"
	.string "INFO$"
	.string "What’s a CONTEST?$"
	.string "Types of CONTESTS$"
	.string "Ranks$"
	.string "Judging$"
	.string "COOL CONTEST$"
	.string "BEAUTY CONTEST$"
	.string "CUTE CONTEST$"
	.string "SMART CONTEST$"
	.string "TOUGH CONTEST$"
	.string "DECORATION$"
	.string "PACK UP$"
	.string "COUNT$"
	.string "REGISTRY$"
	.string "INFORMATION$"
	.string "MACH$"
	.string "ACRO$"
	.string "PSN$"
	.string "PAR$"
	.string "SLP$"
	.string "BRN$"
	.string "FRZ$"
	.string "QUIT$"
	.string "Saw it$"
	.string "Not yet$"
	.string "YES$"
	.string "NO$"
	.string "INFO$"
	.string "SINGLE BATTLE$"
	.string "DOUBLE BATTLE$"
	.string "MULTI BATTLE$"
	.string "MR. BRINEY$"
	.string "Make a challenge.$"
	.string "Obtain information.$"
	.string "LV. 50$"
	.string "LV. 100$"
	.string "ZIGZAGOON$"
	.string "NINCADA$"
	.string "POOCHYENA$"
	.string "NINCADA$"
	.string "LOTAD$"
	.string "ROSELIA$"
	.string "SHROOMISH$"
	.string "NINCADA$"
	.string "SURSKIT$"
	.string "TREECKO$"
	.string "TORCHIC$"
	.string "MUDKIP$"
	.string "SEEDOT$"
	.string "SHROOMISH$"
	.string "SPINDA$"
	.string "SHROOMISH$"
	.string "ZIGZAGOON$"
	.string "WURMPLE$"
	.string "POKé BALL$"
	.string "SUPER POTION$"
	.string "Same price$"
	.string "¥135$"
	.string "¥155$"
	.string "¥175$"
	.string "They will cost more.$"
	.string "They will cost less.$"
	.string "Same price$"
	.string "♂$"
	.string "♀$"
	.string "Neither$"
	.string "Males$"
	.string "Females$"
	.string "Same number$"
	.string "Male$"
	.string "Female$"
	.string "It depends$"
	.string "6$"
	.string "8$"
	.string "10$"
	.string "1$"
	.string "2$"
	.string "3$"
	.string "6$"
	.string "7$"
	.string "8$"
	.string "FRESH WATER{CLEAR_TO 0x48}¥200$"
	.string "SODA POP{CLEAR_TO 0x48}¥300$"
	.string "LEMONADE{CLEAR_TO 0x48}¥350$"
	.string "HOW TO RIDE$"
	.string "HOW TO TURN$"
	.string "SANDY SLOPES$"
	.string "WHEELIES$"
	.string "BUNNY-HOPS$"
	.string "JUMPING$"
	.string "Satisfied$"
	.string "Dissatisfied$"
	.string "DEEPSEATOOTH$"
	.string "DEEPSEASCALE$"
	.string "BLUE FLUTE$"
	.string "YELLOW FLUTE$"
	.string "RED FLUTE$"
	.string "WHITE FLUTE$"
	.string "BLACK FLUTE$"
	.string "GLASS CHAIR$"
	.string "GLASS DESK$"
	.string "TREECKO DOLL 1,000 COINS$"
	.string "TORCHIC DOLL 1,000 COINS$"
	.string "MUDKIP DOLL   1,000 COINS$"
	.string "  50 COINS    ¥1,000$"
	.string "500 COINS  ¥10,000$"
	.string "Excellent!$"
	.string "Not so hot$"
	.string "RED SHARD$"
	.string "YELLOW SHARD$"
	.string "BLUE SHARD$"
	.string "GREEN SHARD$"
	.string "BATTLE TOWER$"
	.string "Right$"
	.string "Left$"
	.string "TM32  1,500 COINS$"
	.string "TM29  3,500 COINS$"
	.string "TM35  4,000 COINS$"
	.string "TM24  4,000 COINS$"
	.string "TM13  4,000 COINS$"
	.string "1F$"
	.string "2F$"
	.string "3F$"
	.string "4F$"
	.string "5F$"
	.string "COOL$"
	.string "BEAUTY$"
	.string "CUTE$"
	.string "SMART$"
	.string "TOUGH$"
	.string "NORMAL$"
	.string "SUPER$"
	.string "HYPER$"
	.string "MASTER$"
	.string "COOL$"
	.string "BEAUTY$"
	.string "CUTE$"
	.string "SMART$"
	.string "TOUGH$"
	.string "ITEMS$"
	.string "KEY ITEMS$"
	.string "BALLS$"
	.string "TMs & HMs$"
	.string "BERRIES$"

	.global gUnknown_08410753
gUnknown_08410753: @ 8410753 @ replacing .incbin "baserom.gba", 0x00410753, 0xd
	.string "SOMEONE’S PC$"

	.global gUnknown_08410760
gUnknown_08410760: @ 8410760 @ replacing .incbin "baserom.gba", 0x00410760, 0xd
	.string "LANETTE’S PC$"

	.global gUnknown_0841076D
gUnknown_0841076D: @ 841076D @ replacing .incbin "baserom.gba", 0x0041076d, 0x8
	.string "{PLAYER}’s PC$"

	.global gUnknown_08410775
gUnknown_08410775: @ 8410775 @ replacing .incbin "baserom.gba", 0x00410775, 0xd
	.string "HALL OF FAME$"

	.global gUnknown_08410782
gUnknown_08410782: @ 8410782 @ replacing .incbin "baserom.gba", 0x00410782, 0x8
	.string "LOG OFF$"

	.global gUnknown_0841078A
gUnknown_0841078A: @ 841078A @ replacing .incbin "baserom.gba", 0x0041078a, 0xb
	.string "99 times +$"

	.global gUnknown_08410795
gUnknown_08410795: @ 8410795 @ replacing .incbin "baserom.gba", 0x00410795, 0xb
	.string "1 minute +$"

	.global gUnknown_084107A0
gUnknown_084107A0: @ 84107A0 @ replacing .incbin "baserom.gba", 0x004107a0, 0x9
	.string " seconds$"

	.global gUnknown_084107A9
gUnknown_084107A9: @ 84107A9 @ replacing .incbin "baserom.gba", 0x004107a9, 0x9
	.string " times$"
	.string ".$"

	.global gUnknown_084107B2
gUnknown_084107B2: @ 84107B2 @ replacing .incbin "baserom.gba", 0x004107b2, 0x8
	.string "Big guy$"

	.global gUnknown_084107BA
gUnknown_084107BA: @ 84107BA @ replacing .incbin "baserom.gba", 0x004107ba, 0x9
	.string "Big girl$"

	.global gUnknown_084107C3
gUnknown_084107C3: @ 84107C3 @ replacing .incbin "baserom.gba", 0x004107c3, 0x4
	.string "son$"

	.global gUnknown_084107C7
gUnknown_084107C7: @ 84107C7 @ replacing .incbin "baserom.gba", 0x004107c7, 0x97
	.string "daughter$"
	.string "BLUE FLUTE$"
	.string "YELLOW FLUTE$"
	.string "RED FLUTE$"
	.string "WHITE FLUTE$"
	.string "BLACK FLUTE$"
	.string "PRETTY CHAIR$"
	.string "PRETTY DESK$"
	.string "1F$"
	.string "2F$"
	.string "3F$"
	.string "4F$"
	.string "5F$"
	.string "6F$"
	.string "7F$"
	.string "8F$"
	.string "9F$"
	.string "10F$"
	.string "11F$"
	.string "B1F$"
	.string "B2F$"
	.string "B3F$"
	.string "B4F$"
	.string "ROOFTOP$"

	.global gUnknown_0841085E
gUnknown_0841085E: @ 841085E @ replacing .incbin "baserom.gba", 0x0041085e, 0x8
	.string "Now on:$"

	.global gUnknown_08410866
gUnknown_08410866: @ 8410866 @ replacing .incbin "baserom.gba", 0x00410866, 0x3b6
	.string "CANCEL$"
	.string "Exit from the BOX.$"
	.string "What would you like to do?$"
	.string "Please pick a theme.$"
	.string "Please pick out wallpaper.$"
	.string " is selected.$"
	.string "Jump to which BOX?$"
	.string "Deposit in which BOX?$"
	.string " was deposited.$"
	.string "The BOX is full.$"
	.string "Release this POKéMON?$"
	.string " was released.$"
	.string "Bye-bye, !$"
	.string "Mark your POKéMON.$"
	.string "That’s your last POKéMON!$"
	.string "Your party’s full!$"
	.string "You’re holding a POKéMON!$"
	.string "Which one will you take?$"
	.string "You can’t release an EGG.$"
	.string "Continue BOX operations?$"
	.string " came back!$"
	.string "Was it worried about you?$"
	.string "... ... ... ... ...!$"
	.string "Please remove the MAIL.$"
	.string "CANCEL$"
	.string "DEPOSIT$"
	.string "WITHDRAW$"
	.string "SWITCH$"
	.string "MOVE$"
	.string "PLACE$"
	.string "SUMMARY$"
	.string "RELEASE$"
	.string "MARK$"
	.string "NAME$"
	.string "JUMP$"
	.string "WALLPAPER$"
	.string "SCENERY 1$"
	.string "SCENERY 2$"
	.string "SCENERY 3$"
	.string "ETCETERA$"
	.string "FOREST$"
	.string "CITY$"
	.string "DESERT$"
	.string "SAVANNA$"
	.string "CRAG$"
	.string "VOLCANO$"
	.string "SNOW$"
	.string "CAVE$"
	.string "BEACH$"
	.string "SEAFLOOR$"
	.string "RIVER$"
	.string "SKY$"
	.string "POLKA-DOT$"
	.string "POKéCENTER$"
	.string "MACHINE$"
	.string "PLAIN$"
	.string "What do you want?$"
	.string "WITHDRAW POKéMON$"
	.string "DEPOSIT POKéMON$"
	.string "MOVE POKéMON$"
	.string "SEE YA!$"
	.string "Move POKéMON stored in BOXES to\nyour party.$"
	.string "Store POKéMON in your party in BOXES.$"
	.string "Organize the POKéMON in BOXES and\nin your party.$"
	.string "Return to the previous menu.$"

	.global gUnknown_08410C1C
gUnknown_08410C1C: @ 8410C1C @ replacing .incbin "baserom.gba", 0x00410c1c, 0x24
	.string "There is just one POKéMON with you.$"

	.global gUnknown_08410C40
gUnknown_08410C40: @ 8410C40 @ replacing .incbin "baserom.gba", 0x00410c40, 0x14
	.string "Your party is full!$"

	.global gUnknown_08410C54
gUnknown_08410C54: @ 8410C54 @ replacing .incbin "baserom.gba", 0x00410c54, 0x1ce
	.string "BOX$"
	.string "{CLEAR} Check the map of the HOENN region.$"
	.string "{CLEAR} Check POKéMON in detail.$"
	.string "{CLEAR} Check TRAINER information.$"
	.string "{CLEAR} Check obtained RIBBONS.$"
	.string "{CLEAR} Put away the POKéNAV.$"
	.string "{CLEAR} There are no RIBBON winners.$"
	.string "{CLEAR} No TRAINERS are registered.$"
	.string "{CLEAR} Check party POKéMON in detail.$"
	.string "{CLEAR} Check all POKéMON in detail.$"
	.string "{CLEAR} Return to the POKéNAV menu.$"
	.string "{CLEAR} Find cool POKéMON.$"
	.string "{CLEAR} Find beautiful POKéMON.$"
	.string "{CLEAR} Find cute POKéMON.$"
	.string "{CLEAR} Find smart POKéMON.$"
	.string "{CLEAR} Find tough POKéMON.$"
	.string "{CLEAR} Return to the CONDITION menu.$"

	.global gUnknown_08410E22
gUnknown_08410E22: @ 8410E22 @ replacing .incbin "baserom.gba", 0x00410e22, 0xf
	.string "No. registered$"

	.global gUnknown_08410E31
gUnknown_08410E31: @ 8410E31 @ replacing .incbin "baserom.gba", 0x00410e31, 0xf
	.string "No. of battles$"

	.global gUnknown_08410E40
gUnknown_08410E40: @ 8410E40 @ replacing .incbin "baserom.gba", 0x00410e40, 0xc
	.string "{PALETTE 5}"
	.string "STRATEGY$"

	.global gUnknown_08410E4C
gUnknown_08410E4C: @ 8410E4C @ replacing .incbin "baserom.gba", 0x00410e4c, 0x15
	.string "{PALETTE 5}"
	.string "TRAINER’S POKéMON$"

	.global gUnknown_08410E61
gUnknown_08410E61: @ 8410E61 @ replacing .incbin "baserom.gba", 0x00410e61, 0x15
	.string "{PALETTE 5}"
	.string "SELF-INTRODUCTION$"

	.global gUnknown_08410E76
gUnknown_08410E76: @ 8410E76 @ replacing .incbin "baserom.gba", 0x00410e76, 0x8
	.string "NATURE/$"

	.global gUnknown_08410E7E
gUnknown_08410E7E: @ 8410E7E @ replacing .incbin "baserom.gba", 0x00410e7e, 0x9
	.string "IN PARTY$"

	.global gUnknown_08410E87
gUnknown_08410E87: @ 8410E87 @ replacing .incbin "baserom.gba", 0x00410e87, 0x5
	.string "No. $"

	.global gUnknown_08410E8C
gUnknown_08410E8C: @ 8410E8C @ replacing .incbin "baserom.gba", 0x00410e8c, 0x262
	.string "RIBBONS$"
	.string "Make your profile by combining$"
	.string "four words or phrases.$"
	.string "Make a message with 6 phrases.$"
	.string "Max. two 12-letter phrases/line.$"
	.string "Find words that describe your$"
	.string "feelings right now.$"
	.string "With four phrases,$"
	.string "Combine nine phrases and$"
	.string "make a message.$"
	.string "Change just one word or phrase$"
	.string "and improve the BARD’s song.$"
	.string "Your profile $"
	.string "Your feeling at the battle’s start$"
	.string "What you say if you win a battle$"
	.string "What you say if you lose a battle$"
	.string "The answer$"
	.string "The MAIL message$"
	.string "The MAIL salutation$"
	.string "The new song$"
	.string "Combine two phrases and$"
	.string "make a trendy saying.$"
	.string "The trendy saying$"
	.string "is as shown. Okay?$"
	.string "I’ll combine two phrases and$"
	.string "teach you a good saying.$"

	.global gUnknown_084110EE
gUnknown_084110EE: @ 84110EE @ replacing .incbin "baserom.gba", 0x004110ee, 0x1f
	.string "All the text being edited will$"

	.global gUnknown_0841110D
gUnknown_0841110D: @ 841110D @ replacing .incbin "baserom.gba", 0x0041110d, 0x1a
	.string "be deleted. Is that okay?$"

	.global gUnknown_08411127
gUnknown_08411127: @ 8411127 @ replacing .incbin "baserom.gba", 0x00411127, 0xe
	.string "Quit editing?$"

	.global gUnknown_08411135
gUnknown_08411135: @ 8411135 @ replacing .incbin "baserom.gba", 0x00411135, 0x23
	.string "The edited text will not be saved.$"

	.global gUnknown_08411158
gUnknown_08411158: @ 8411158 @ replacing .incbin "baserom.gba", 0x00411158, 0xe
	.string "Is that okay?$"

	.global gUnknown_08411166
gUnknown_08411166: @ 8411166 @ replacing .incbin "baserom.gba", 0x00411166, 0x1f
	.string "Please enter a phrase or word.$"

	.global gUnknown_08411185
gUnknown_08411185: @ 8411185 @ replacing .incbin "baserom.gba", 0x00411185, 0x22
	.string "The entire text can’t be deleted.$"

	.global gUnknown_084111A7
gUnknown_084111A7: @ 84111A7 @ replacing .incbin "baserom.gba", 0x004111a7, 0x20
	.string "Only one phrase may be changed.$"

	.global gUnknown_084111C7
gUnknown_084111C7: @ 84111C7 @ replacing .incbin "baserom.gba", 0x004111c7, 0x24
	.string "The original song will be restored.$"

	.global gUnknown_084111EB
gUnknown_084111EB: @ 84111EB @ replacing .incbin "baserom.gba", 0x004111eb, 0x17
	.string "That’s trendy already!$"

	.global gUnknown_08411202
gUnknown_08411202: @ 8411202 @ replacing .incbin "baserom.gba", 0x00411202, 0x1e
	.string "Combine two words or phrases.$"

	.global gUnknown_08411220
gUnknown_08411220: @ 8411220 @ replacing .incbin "baserom.gba", 0x00411220, 0x19
	.string "Quit giving information?$"

	.global gUnknown_08411239
gUnknown_08411239: @ 8411239 @ replacing .incbin "baserom.gba", 0x00411239, 0x1e
	.string "Stop giving the POKéMON MAIL?$"

	.global gUnknown_08411257
gUnknown_08411257: @ 8411257 @ replacing .incbin "baserom.gba", 0x00411257, 0x8
	.string "PROFILE$"

	.global gUnknown_0841125F
gUnknown_0841125F: @ 841125F @ replacing .incbin "baserom.gba", 0x0041125f, 0x17
	.string "At the battle’s start.$"

	.global gUnknown_08411276
gUnknown_08411276: @ 8411276 @ replacing .incbin "baserom.gba", 0x00411276, 0x17
	.string "Upon winning a battle.$"

	.global gUnknown_0841128D
gUnknown_0841128D: @ 841128D @ replacing .incbin "baserom.gba", 0x0041128d, 0x16
	.string "Upon losing a battle.$"

	.global gUnknown_084112A3
gUnknown_084112A3: @ 84112A3 @ replacing .incbin "baserom.gba", 0x004112a3, 0x10
	.string "The BARD’s Song$"

	.global gUnknown_084112B3
gUnknown_084112B3: @ 84112B3 @ replacing .incbin "baserom.gba", 0x004112b3, 0x1a
	.string "What’s hip and happening?$"

	.global gUnknown_084112CD
gUnknown_084112CD: @ 84112CD @ replacing .incbin "baserom.gba", 0x004112cd, 0xa
	.string "Interview$"

	.global gUnknown_084112D7
gUnknown_084112D7: @ 84112D7 @ replacing .incbin "baserom.gba", 0x004112d7, 0x74
	.string "Good saying$"
	.string " so pretty!$"
	.string " so darling!$"
	.string " so relaxed!$"
	.string " so sunny!$"
	.string " so desirable!$"
	.string " so exciting!$"
	.string " so amusing!$"
	.string " so magical!$"

	.global gUnknown_0841134B
gUnknown_0841134B: @ 841134B @ replacing .incbin "baserom.gba", 0x0041134b, 0x4
	.string " is$"

	.global gUnknown_0841134F
gUnknown_0841134F: @ 841134F @ replacing .incbin "baserom.gba", 0x0041134f, 0x232
	.string "\nDon’t you agree?$"
	.string "I so want to go on a vacation.\nWould you happen to know a nice place?$"
	.string "I bought crayons with 120 colors!\nDon’t you think that’s nice?$"
	.string "Wouldn’t it be nice if we could float\naway on a cloud of bubbles?$"
	.string "When you write on a sandy beach,\nthey wash away. It makes me sad.$"
	.string "What’s the bottom of the sea like?\nJust once I would so love to go!$"
	.string "When you see the setting sun, does it\nmake you want to go home?$"
	.string "Lying back in the green grass...\nOh, it’s so, so nice!$"
	.string "SECRET BASES are so wonderful!\nCan’t you feel the excitement?$"
	.string "POKéMON LEAGUE$"
	.string "POKéMON CENTER$"

	.global gUnknown_08411581
gUnknown_08411581: @ 8411581 @ replacing .incbin "baserom.gba", 0x00411581, 0x41
	.string " gets a {POKEBLOCK}?$"
	.string "Coolness $"
	.string "Beauty $"
	.string "Cuteness $"
	.string "Smartness $"
	.string "Toughness $"

	.global gUnknown_084115C2
gUnknown_084115C2: @ 84115C2 @ replacing .incbin "baserom.gba", 0x004115c2, 0xe
	.string "was enhanced!$"

	.global gUnknown_084115D0
gUnknown_084115D0: @ 84115D0 @ replacing .incbin "baserom.gba", 0x004115d0, 0x11
	.string "Nothing changed!$"

	.global gUnknown_084115E1
gUnknown_084115E1: @ 84115E1 @ replacing .incbin "baserom.gba", 0x004115e1, 0x18
	.string "It won’t eat anymore...$"

	.global gUnknown_084115F9
gUnknown_084115F9: @ 84115F9 @ replacing .incbin "baserom.gba", 0x004115f9, 0x55
	.string "Save failed.\nChecking the backup memory...\nPlease wait.\n{COLOR RED}“Time required: 1 minute”$"

	.global gUnknown_0841164E
gUnknown_0841164E: @ 841164E @ replacing .incbin "baserom.gba", 0x0041164e, 0x7d
	.string "The backup memory is damaged or\nthe internal battery has run dry.\nThe game can be played. However,\nprogress cannot be saved.$"

	.global gUnknown_084116CB
gUnknown_084116CB: @ 84116CB @ replacing .incbin "baserom.gba", 0x004116cb, 0x44
	.string "{COLOR RED}“Gameplay cannot be continued.\nReturning to the title screen...”$"

	.global gUnknown_0841170F
gUnknown_0841170F: @ 841170F @ replacing .incbin "baserom.gba", 0x0041170f, 0x38
	.string "Check completed.\nAttempting to save again.\nPlease wait.$"

	.global gUnknown_08411747
gUnknown_08411747: @ 8411747 @ replacing .incbin "baserom.gba", 0x00411747, 0x52
	.string "Save completed.\n{COLOR RED}“Gameplay cannot be continued.\nReturning to the title screen.”$"

	.global gUnknown_08411799
gUnknown_08411799: @ 8411799 @ replacing .incbin "baserom.gba", 0x00411799, 0x30
	.string "Save completed.\n{COLOR RED}“Please press the A Button.”$"

	.global gUnknown_084117C9
gUnknown_084117C9: @ 84117C9 @ replacing .incbin "baserom.gba", 0x004117c9, 0x6
	.string "FERRY$"

	.global gUnknown_084117CF
gUnknown_084117CF: @ 84117CF @ replacing .incbin "baserom.gba", 0x004117cf, 0xc
	.string "SECRET BASE$"

	.global gUnknown_084117DB
gUnknown_084117DB: @ 84117DB @ replacing .incbin "baserom.gba", 0x004117db, 0x8
	.string "HIDEOUT$"

	.global gUnknown_084117E3
gUnknown_084117E3: @ 84117E3 @ replacing .incbin "baserom.gba", 0x004117e3, 0x21
	.string "Reset RTC?\nA: Confirm, B: Cancel$"

	.global gUnknown_08411804
gUnknown_08411804: @ 8411804 @ replacing .incbin "baserom.gba", 0x00411804, 0x15
	.string "Present time in game$"

	.global gUnknown_08411819
gUnknown_08411819: @ 8411819 @ replacing .incbin "baserom.gba", 0x00411819, 0x16
	.string "Previous time in game$"

	.global gUnknown_0841182F
gUnknown_0841182F: @ 841182F @ replacing .incbin "baserom.gba", 0x0041182f, 0x17
	.string "Please reset the time.$"

	.global gUnknown_08411846
gUnknown_08411846: @ 8411846 @ replacing .incbin "baserom.gba", 0x00411846, 0x3b
	.string "The clock has been reset.\nData will be saved. Please wait.$"

	.global gUnknown_08411881
gUnknown_08411881: @ 8411881 @ replacing .incbin "baserom.gba", 0x00411881, 0x10
	.string "Save completed.$"

	.global gUnknown_08411891
gUnknown_08411891: @ 8411891 @ replacing .incbin "baserom.gba", 0x00411891, 0xf
	.string "Save failed...$"

	.global gUnknown_084118A0
gUnknown_084118A0: @ 84118A0 @ replacing .incbin "baserom.gba", 0x004118a0, 0x31
	.string "There is no save file, so the time\ncan’t be set.$"

	.global gUnknown_084118D1
gUnknown_084118D1: @ 84118D1 @ replacing .incbin "baserom.gba", 0x004118d1, 0x34
	.string "The in-game clock adjustment system\nis now useable.$"

	.global gUnknown_08411905
	gUnknown_08411905: @ 8411905 @ replacing .incbin "baserom.gba", 0x00411905, 0x27
    .string "SAVING...\nDON’T TURN OFF THE POWER.$"

    .align 2
    .global gUnknown_0841192C
gUnknown_0841192C: @ 841192C
  @ replacing .incbin "baserom.gba", 0x0041192c, 0x14
	.incbin "baserom.gba", 0x0041192c, 0x14

	.global gUnknown_08411940
gUnknown_08411940: @ 8411940 @ replacing .incbin "baserom.gba", 0x00411940, 0x8
	.incbin "baserom.gba", 0x00411940, 0x8

	.global gUnknown_08411948
gUnknown_08411948: @ 8411948 @ replacing .incbin "baserom.gba", 0x00411948, 0x18
	.incbin "baserom.gba", 0x00411948, 0x18

	.global gUnknown_08411960
gUnknown_08411960: @ 8411960 @ replacing .incbin "baserom.gba", 0x00411960, 0x20
	.incbin "baserom.gba", 0x00411960, 0x20

	.global gUnknown_08411980
gUnknown_08411980: @ 8411980 @ replacing .incbin "baserom.gba", 0x00411980, 0x90
	.incbin "baserom.gba", 0x00411980, 0x90

	.global gUnknown_08411A10
gUnknown_08411A10: @ 8411A10 @ replacing .incbin "baserom.gba", 0x00411a10, 0x32
	.incbin "baserom.gba", 0x00411a10, 0x32

	.global gUnknown_08411A42
gUnknown_08411A42: @ 8411A42 @ replacing .incbin "baserom.gba", 0x00411a42, 0x60e
	.incbin "baserom.gba", 0x00411a42, 0x60e

	.global gUnknown_08412050
gUnknown_08412050: @ 8412050 @ replacing .incbin "baserom.gba", 0x00412050, 0x54
	.incbin "baserom.gba", 0x00412050, 0x54

	.global gUnknown_084120A4
gUnknown_084120A4: @ 84120A4 @ replacing .incbin "baserom.gba", 0x004120a4, 0x48
	.incbin "baserom.gba", 0x004120a4, 0x48

	.global gUnknown_084120EC
gUnknown_084120EC: @ 84120EC @ replacing .incbin "baserom.gba", 0x004120ec, 0xb4
	.incbin "baserom.gba", 0x004120ec, 0xb4

	.global gUnknown_084121A0
gUnknown_084121A0: @ 84121A0 @ replacing .incbin "baserom.gba", 0x004121a0, 0x4
	.incbin "baserom.gba", 0x004121a0, 0x4

	.global gUnknown_084121A4
gUnknown_084121A4: @ 84121A4 @ replacing .incbin "baserom.gba", 0x004121a4, 0x4
	.incbin "baserom.gba", 0x004121a4, 0x4

	.global gUnknown_084121A8
gUnknown_084121A8: @ 84121A8 @ replacing .incbin "baserom.gba", 0x004121a8, 0x34
	.incbin "baserom.gba", 0x004121a8, 0x34

	.global gUnknown_084121DC
gUnknown_084121DC: @ 84121DC
	.incbin "baserom.gba", 0x004121dc, 0x8

	.global gUnknown_084121E4
gUnknown_084121E4: @ 84121E4
	.incbin "baserom.gba", 0x004121e4, 0x18

	.global gUnknown_084121FC
gUnknown_084121FC: @ 84121FC
	.incbin "baserom.gba", 0x004121fc, 0x20

	.global gUnknown_0841221C
gUnknown_0841221C: @ 841221C
	.incbin "baserom.gba", 0x0041221c, 0x20

	.global gUnknown_0841223C
gUnknown_0841223C: @ 841223C
	.incbin "baserom.gba", 0x0041223c, 0x20

	.global gUnknown_0841225C
gUnknown_0841225C: @ 841225C
	.incbin "baserom.gba", 0x0041225c, 0x480

	.global gUnknown_084126DC
gUnknown_084126DC: @ 84126DC
	.incbin "baserom.gba", 0x004126dc, 0x13c

	.global gUnknown_08412818
gUnknown_08412818: @ 8412818
	.incbin "baserom.gba", 0x00412818, 0x60

	.global gUnknown_08412878
gUnknown_08412878: @ 8412878
	.incbin "baserom.gba", 0x00412878, 0x60

	.global gUnknown_084128D8
gUnknown_084128D8: @ 84128D8
	.incbin "baserom.gba", 0x004128d8, 0x5dc

	.global gUnknown_08412EB4
gUnknown_08412EB4: @ 8412EB4
	.incbin "baserom.gba", 0x00412eb4, 0x2d0

	.global gUnknown_08413184
gUnknown_08413184: @ 8413184
	.incbin "baserom.gba", 0x00413184, 0x20

	.global gUnknown_084131A4
gUnknown_084131A4: @ 84131A4
	.incbin "baserom.gba", 0x004131a4, 0x20

	.global gUnknown_084131C4
gUnknown_084131C4: @ 84131C4
	.incbin "baserom.gba", 0x004131c4, 0x13c

	.global gUnknown_08413300
gUnknown_08413300: @ 8413300
	.incbin "baserom.gba", 0x00413300, 0x20

	.global gUnknown_08413320
gUnknown_08413320: @ 8413320
	.incbin "baserom.gba", 0x00413320, 0x20

	.global gUnknown_08413340
gUnknown_08413340: @ 8413340
	.incbin "baserom.gba", 0x00413340, 0x688

	.global gUnknown_084139C8
gUnknown_084139C8: @ 84139C8
	.incbin "baserom.gba", 0x004139c8, 0x304

	.global gUnknown_08413CCC
gUnknown_08413CCC: @ 8413CCC
	.incbin "baserom.gba", 0x00413ccc, 0x16c

	.global gUnknown_08413E38
gUnknown_08413E38: @ 8413E38
	.incbin "baserom.gba", 0x00413e38, 0x40

	.global gUnknown_08413E78
gUnknown_08413E78: @ 8413E78
	.incbin "baserom.gba", 0x00413e78, 0x1ec

	.global gUnknown_08414064
gUnknown_08414064: @ 8414064
	.incbin "baserom.gba", 0x00414064, 0x20

	.global gUnknown_08414084
gUnknown_08414084: @ 8414084
	.incbin "baserom.gba", 0x00414084, 0x2ab8

	.global gUnknown_08416B3C
gUnknown_08416B3C: @ 8416B3C
	.incbin "baserom.gba", 0x00416b3c, 0x18

	.global gUnknown_08416B54
gUnknown_08416B54: @ 8416B54
	.incbin "baserom.gba", 0x00416b54, 0x30

	.global gUnknown_08416B84
gUnknown_08416B84: @ 8416B84
	.incbin "baserom.gba", 0x00416b84, 0x10

	.global gUnknown_08416B94
gUnknown_08416B94: @ 8416B94
	.incbin "baserom.gba", 0x00416b94, 0x48

	.global gUnknown_08416BDC
gUnknown_08416BDC: @ 8416BDC
	.incbin "baserom.gba", 0x00416bdc, 0x28

	.global gUnknown_08416C04
gUnknown_08416C04: @ 8416C04
	.incbin "baserom.gba", 0x00416c04, 0xc

	.global gUnknown_08416C10
gUnknown_08416C10: @ 8416C10
	.incbin "baserom.gba", 0x00416c10, 0x60

	.global gUnknown_08416C70
gUnknown_08416C70: @ 8416C70
	.incbin "baserom.gba", 0x00416c70, 0x18

	.global gUnknown_08416C88
gUnknown_08416C88: @ 8416C88
	.incbin "baserom.gba", 0x00416c88, 0x4

	.global gUnknown_08416C8C
gUnknown_08416C8C: @ 8416C8C
	.incbin "baserom.gba", 0x00416c8c, 0x50

	.global gUnknown_08416CDC
gUnknown_08416CDC: @ 8416CDC
	.incbin "baserom.gba", 0x00416cdc, 0x18

	.global gUnknown_08416CF4
gUnknown_08416CF4: @ 8416CF4
	.incbin "baserom.gba", 0x00416cf4, 0x38

	.global gUnknown_08416D2C
gUnknown_08416D2C: @ 8416D2C
	.incbin "baserom.gba", 0x00416d2c, 0x18

	.global gUnknown_08416D44
gUnknown_08416D44: @ 8416D44
	.incbin "baserom.gba", 0x00416d44, 0x38

	.global gUnknown_08416D7C
gUnknown_08416D7C: @ 8416D7C
	.incbin "baserom.gba", 0x00416d7c, 0x18

	.global gUnknown_08416D94
gUnknown_08416D94: @ 8416D94
	.incbin "baserom.gba", 0x00416d94, 0x18

	.global gUnknown_08416DAC
gUnknown_08416DAC: @ 8416DAC
	.incbin "baserom.gba", 0x00416dac, 0x10

	.global gUnknown_08416DBC
gUnknown_08416DBC: @ 8416DBC
	.incbin "baserom.gba", 0x00416dbc, 0x10

	.global gUnknown_08416DCC
gUnknown_08416DCC: @ 8416DCC
	.incbin "baserom.gba", 0x00416dcc, 0x10

	.global gUnknown_08416DDC
gUnknown_08416DDC: @ 8416DDC
	.incbin "baserom.gba", 0x00416ddc, 0x20

	.global gUnknown_08416DFC
gUnknown_08416DFC: @ 8416DFC
	.incbin "baserom.gba", 0x00416dfc, 0x28

	.global gUnknown_08416E24
gUnknown_08416E24: @ 8416E24
	.incbin "baserom.gba", 0x00416e24, 0x10

	.global gUnknown_08416E34
gUnknown_08416E34: @ 8416E34
	.incbin "baserom.gba", 0x00416e34, 0x50

	.global gUnknown_08416E84
gUnknown_08416E84: @ 8416E84
	.incbin "baserom.gba", 0x00416e84, 0x10

	.global gUnknown_08416E94
gUnknown_08416E94: @ 8416E94
	.incbin "baserom.gba", 0x00416e94, 0x24

	.global gUnknown_08416EB8
gUnknown_08416EB8: @ 8416EB8
	.incbin "baserom.gba", 0x00416eb8, 0x18

	.global gUnknown_08416ED0
gUnknown_08416ED0: @ 8416ED0
	.incbin "baserom.gba", 0x00416ed0, 0x198

	.global gUnknown_08417068
gUnknown_08417068: @ 8417068
	.incbin "baserom.gba", 0x00417068, 0x8c

	.global gUnknown_084170F4
gUnknown_084170F4: @ 84170F4
	.incbin "baserom.gba", 0x004170f4, 0x15100

	.global gUnknown_0842C1F4
gUnknown_0842C1F4: @ 842C1F4
	.incbin "baserom.gba", 0x0042c1f4, 0xa8

	.global gUnknown_0842C29C
gUnknown_0842C29C: @ 842C29C
	.incbin "baserom.gba", 0x0042c29c, 0x4a

	.global gUnknown_0842C2E6
gUnknown_0842C2E6: @ 842C2E6
	.incbin "baserom.gba", 0x0042c2e6, 0x24

	.global gUnknown_0842C30A
gUnknown_0842C30A: @ 842C30A
	.incbin "baserom.gba", 0x0042c30a, 0x1e

	.global gUnknown_0842C328
gUnknown_0842C328: @ 842C328
	.incbin "baserom.gba", 0x0042c328, 0x24

	.global gUnknown_0842C34C
gUnknown_0842C34C: @ 842C34C
	.incbin "baserom.gba", 0x0042c34c, 0x5a

	.global gUnknown_0842C3A6
gUnknown_0842C3A6: @ 842C3A6
	.incbin "baserom.gba", 0x0042c3a6, 0xa

	.global gUnknown_0842C3B0
gUnknown_0842C3B0: @ 842C3B0
	.incbin "baserom.gba", 0x0042c3b0, 0xe

	.global gUnknown_0842C3BE
gUnknown_0842C3BE: @ 842C3BE
	.incbin "baserom.gba", 0x0042c3be, 0x10

	.global gUnknown_0842C3CE
gUnknown_0842C3CE: @ 842C3CE
	.incbin "baserom.gba", 0x0042c3ce, 0x10

	.global gUnknown_0842C3DE
gUnknown_0842C3DE: @ 842C3DE
	.incbin "baserom.gba", 0x0042c3de, 0x9

	.global gUnknown_0842C3E7
gUnknown_0842C3E7: @ 842C3E7
	.incbin "baserom.gba", 0x0042c3e7, 0x9

	.global gUnknown_0842C3F0
gUnknown_0842C3F0: @ 842C3F0
	.incbin "baserom.gba", 0x0042c3f0, 0xa

	.global gUnknown_0842C3FA
gUnknown_0842C3FA: @ 842C3FA
	.incbin "baserom.gba", 0x0042c3fa, 0xf

	.global gUnknown_0842C409
gUnknown_0842C409: @ 842C409
	.incbin "baserom.gba", 0x0042c409, 0x8

	.global gUnknown_0842C411
gUnknown_0842C411: @ 842C411
	.incbin "baserom.gba", 0x0042c411, 0x7

	.global gUnknown_0842C418
gUnknown_0842C418: @ 842C418
	.incbin "baserom.gba", 0x0042c418, 0x8

	.global gUnknown_0842C420
gUnknown_0842C420: @ 842C420
	.incbin "baserom.gba", 0x0042c420, 0x6

	.global gUnknown_0842C426
gUnknown_0842C426: @ 842C426
	.incbin "baserom.gba", 0x0042c426, 0x7

	.global gUnknown_0842C42D
gUnknown_0842C42D: @ 842C42D
	.incbin "baserom.gba", 0x0042c42d, 0x9

	.global gUnknown_0842C436
gUnknown_0842C436: @ 842C436
	.incbin "baserom.gba", 0x0042c436, 0x7

	.global gUnknown_0842C43D
gUnknown_0842C43D: @ 842C43D
	.incbin "baserom.gba", 0x0042c43d, 0x8

	.global gUnknown_0842C445
gUnknown_0842C445: @ 842C445
	.incbin "baserom.gba", 0x0042c445, 0xa

	.global gUnknown_0842C44F
gUnknown_0842C44F: @ 842C44F
	.incbin "baserom.gba", 0x0042c44f, 0x8

	.global gUnknown_0842C457
gUnknown_0842C457: @ 842C457
	.incbin "baserom.gba", 0x0042c457, 0x4

	.global gUnknown_0842C45B
gUnknown_0842C45B: @ 842C45B
	.incbin "baserom.gba", 0x0042c45b, 0xa

	.global gUnknown_0842C465
gUnknown_0842C465: @ 842C465
	.incbin "baserom.gba", 0x0042c465, 0x6

	.global gUnknown_0842C46B
gUnknown_0842C46B: @ 842C46B
	.incbin "baserom.gba", 0x0042c46b, 0x3e

	.global gUnknown_0842C4A9
gUnknown_0842C4A9: @ 842C4A9
	.incbin "baserom.gba", 0x0042c4a9, 0x17

	.global gUnknown_0842C4C0
gUnknown_0842C4C0: @ 842C4C0
	.incbin "baserom.gba", 0x0042c4c0, 0x29

	.global gUnknown_0842C4E9
gUnknown_0842C4E9: @ 842C4E9
	.incbin "baserom.gba", 0x0042c4e9, 0x3b

	.global gUnknown_0842C524
gUnknown_0842C524: @ 842C524
	.incbin "baserom.gba", 0x0042c524, 0x11

	.global gUnknown_0842C535
gUnknown_0842C535: @ 842C535
	.incbin "baserom.gba", 0x0042c535, 0x3c

	.global gUnknown_0842C571
gUnknown_0842C571: @ 842C571
	.incbin "baserom.gba", 0x0042c571, 0x1e

	.global gUnknown_0842C58F
gUnknown_0842C58F: @ 842C58F
	.incbin "baserom.gba", 0x0042c58f, 0x26

	.global gUnknown_0842C5B5
gUnknown_0842C5B5: @ 842C5B5
	.incbin "baserom.gba", 0x0042c5b5, 0x6

	.global gUnknown_0842C5BB
gUnknown_0842C5BB: @ 842C5BB
	.incbin "baserom.gba", 0x0042c5bb, 0xc

	.global gUnknown_0842C5C7
gUnknown_0842C5C7: @ 842C5C7
	.incbin "baserom.gba", 0x0042c5c7, 0x1b

	.global gUnknown_0842C5E2
gUnknown_0842C5E2: @ 842C5E2
	.incbin "baserom.gba", 0x0042c5e2, 0x17

	.global gUnknown_0842C5F9
gUnknown_0842C5F9: @ 842C5F9
	.incbin "baserom.gba", 0x0042c5f9, 0x12

	.global gUnknown_0842C60B
gUnknown_0842C60B: @ 842C60B
	.incbin "baserom.gba", 0x0042c60b, 0x17

	.global gUnknown_0842C622
gUnknown_0842C622: @ 842C622
	.incbin "baserom.gba", 0x0042c622, 0xd

	.global gUnknown_0842C62F
gUnknown_0842C62F: @ 842C62F
	.incbin "baserom.gba", 0x0042c62f, 0x11

	.global gUnknown_0842C640
gUnknown_0842C640: @ 842C640
	.string "Take good care of {STR_VAR_3}!$"
	.string "CANCEL$"
	.string "Choose a POKéMON.$"
	.string "SUMMARY$"
	.string "TRADE$"
	.string "Cancel trade?$"
	.string "Press the B Button to exit.$"
	.string "SUMMARY$"
	.string "TRADE$"
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Link standby...\nPlease wait.$"
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}The trade has\nbeen canceled.$"
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}That’s your only\nPOKéMON for battle.$"
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Your friend can’t\ntrade that one.$"
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Waiting for your\nfriend to finish...$"
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Your friend wants\nto trade POKéMON.$"
	.string "$"

	.global gUnknown_0842C7B6 @ trade functions? could be in-game as well
gUnknown_0842C7B6:
	.string "Is this trade okay?$"

	.global gUnknown_0842C7CA
gUnknown_0842C7CA:
	.string "$"

	.global gUnknown_0842C7CB @ this is probably related to battle
gUnknown_0842C7CB:
	.string "\n$"
	.string "/$"
	.string "Lv$"
	.string "---$"

	.global gUnknown_0842C7D6
gUnknown_0842C7D6:
	.string "????$"

@ 842C7DB
	.include "data/text/easy_chat/group_name_strings.s"

	.global gUnknown_0842C890
gUnknown_0842C890: @ 842C890
	.incbin "baserom.gba", 0x0042c890, 0x4

	.global gUnknown_0842C894
gUnknown_0842C894: @ 842C894
	.incbin "baserom.gba", 0x0042c894, 0x6

	.global gUnknown_0842C89A
gUnknown_0842C89A: @ 842C89A
	.incbin "baserom.gba", 0x0042c89a, 0x12

	.global gUnknown_0842C8AC
gUnknown_0842C8AC: @ 842C8AC
	.incbin "baserom.gba", 0x0042c8ac, 0x30

	.global gUnknown_0842C8DC
gUnknown_0842C8DC: @ 842C8DC
	.incbin "baserom.gba", 0x0042c8dc, 0x10

	.global gUnknown_0842C8EC
gUnknown_0842C8EC: @ 842C8EC
	.incbin "baserom.gba", 0x0042c8ec, 0x13

	.global gUnknown_0842C8FF
gUnknown_0842C8FF: @ 842C8FF
	.incbin "baserom.gba", 0x0042c8ff, 0x25

	.global gUnknown_0842C924
gUnknown_0842C924: @ 842C924
	.incbin "baserom.gba", 0x0042c924, 0x1f

	.global gUnknown_0842C943
gUnknown_0842C943: @ 842C943
	.incbin "baserom.gba", 0x0042c943, 0x16

	.global gUnknown_0842C959
gUnknown_0842C959: @ 842C959
	.incbin "baserom.gba", 0x0042c959, 0x11

	.global gUnknown_0842C96A
gUnknown_0842C96A: @ 842C96A
	.incbin "baserom.gba", 0x0042c96a, 0xf

	.global gUnknown_0842C979
gUnknown_0842C979: @ 842C979
	.incbin "baserom.gba", 0x0042c979, 0x4

	.global gUnknown_0842C97D
gUnknown_0842C97D: @ 842C97D
	.incbin "baserom.gba", 0x0042c97d, 0x6

	.global gUnknown_0842C983
gUnknown_0842C983: @ 842C983
	.incbin "baserom.gba", 0x0042c983, 0x7

	.global gUnknown_0842C98A
gUnknown_0842C98A: @ 842C98A
	.incbin "baserom.gba", 0x0042c98a, 0x8

	.global gUnknown_0842C992
gUnknown_0842C992: @ 842C992
	.incbin "baserom.gba", 0x0042c992, 0x8

	.global gUnknown_0842C99A
gUnknown_0842C99A: @ 842C99A
	.incbin "baserom.gba", 0x0042c99a, 0xa

	.global gUnknown_0842C9A4
gUnknown_0842C9A4: @ 842C9A4
	.incbin "baserom.gba", 0x0042c9a4, 0x3d

	.global gUnknown_0842C9E1
gUnknown_0842C9E1: @ 842C9E1
	.incbin "baserom.gba", 0x0042c9e1, 0x6

	.global gUnknown_0842C9E7
gUnknown_0842C9E7: @ 842C9E7
	.incbin "baserom.gba", 0x0042c9e7, 0x9

	.global gUnknown_0842C9F0
gUnknown_0842C9F0: @ 842C9F0
	.incbin "baserom.gba", 0x0042c9f0, 0x14

	.global gUnknown_0842CA04
gUnknown_0842CA04: @ 842CA04
	.incbin "baserom.gba", 0x0042ca04, 0x1c

	.global gUnknown_0842CA20
gUnknown_0842CA20: @ 842CA20
	.incbin "baserom.gba", 0x0042ca20, 0x1c

	.global gUnknown_0842CA3C
gUnknown_0842CA3C: @ 842CA3C
	.incbin "baserom.gba", 0x0042ca3c, 0x8

	.global gUnknown_0842CA44
gUnknown_0842CA44: @ 842CA44
	.incbin "baserom.gba", 0x0042ca44, 0x5

	.global gUnknown_0842CA49
gUnknown_0842CA49: @ 842CA49
	.incbin "baserom.gba", 0x0042ca49, 0x1a

	.global gUnknown_0842CA63
gUnknown_0842CA63: @ 842CA63
	.incbin "baserom.gba", 0x0042ca63, 0x6

	.global gUnknown_0842CA69
gUnknown_0842CA69: @ 842CA69
	.incbin "baserom.gba", 0x0042ca69, 0x7

	.global gUnknown_0842CA70
gUnknown_0842CA70: @ 842CA70
	.incbin "baserom.gba", 0x0042ca70, 0xb

	.global gUnknown_0842CA7B
gUnknown_0842CA7B: @ 842CA7B
	.incbin "baserom.gba", 0x0042ca7b, 0x8

	.global gUnknown_0842CA83
gUnknown_0842CA83: @ 842CA83
	.incbin "baserom.gba", 0x0042ca83, 0x7

	.global gUnknown_0842CA8A
gUnknown_0842CA8A: @ 842CA8A
	.incbin "baserom.gba", 0x0042ca8a, 0x6

	.global gUnknown_0842CA90
gUnknown_0842CA90: @ 842CA90
	.incbin "baserom.gba", 0x0042ca90, 0xf

	.global gUnknown_0842CA9F
gUnknown_0842CA9F: @ 842CA9F
	.incbin "baserom.gba", 0x0042ca9f, 0x18

	.global gUnknown_0842CAB7
gUnknown_0842CAB7: @ 842CAB7
	.incbin "baserom.gba", 0x0042cab7, 0x24

	.global gUnknown_0842CADB
gUnknown_0842CADB: @ 842CADB
	.incbin "baserom.gba", 0x0042cadb, 0x1c

	.global gUnknown_0842CAF7
gUnknown_0842CAF7: @ 842CAF7
	.incbin "baserom.gba", 0x0042caf7, 0x131

	.global gUnknown_0842CC28
gUnknown_0842CC28: @ 842CC28
	.incbin "baserom.gba", 0x0042cc28, 0x2

	.global gUnknown_0842CC2A
gUnknown_0842CC2A: @ 842CC2A
	.incbin "baserom.gba", 0x0042cc2a, 0xa

	.global gUnknown_0842CC34
gUnknown_0842CC34: @ 842CC34
	.incbin "baserom.gba", 0x0042cc34, 0x4

	.global gUnknown_0842CC38
gUnknown_0842CC38: @ 842CC38
	.incbin "baserom.gba", 0x0042cc38, 0x22

	.global gUnknown_0842CC5A
gUnknown_0842CC5A: @ 842CC5A
	.incbin "baserom.gba", 0x0042cc5a, 0x6d

	.global gUnknown_0842CCC7
gUnknown_0842CCC7: @ 842CCC7
	.incbin "baserom.gba", 0x0042ccc7, 0x18

	.global gUnknown_0842CCDF
gUnknown_0842CCDF: @ 842CCDF
	.incbin "baserom.gba", 0x0042ccdf, 0xa

	.global gUnknown_0842CCE9
gUnknown_0842CCE9: @ 842CCE9
	.incbin "baserom.gba", 0x0042cce9, 0xf

	.global gUnknown_0842CCF8
gUnknown_0842CCF8: @ 842CCF8
	.incbin "baserom.gba", 0x0042ccf8, 0x6d

	.global gUnknown_0842CD65
gUnknown_0842CD65: @ 842CD65
	.incbin "baserom.gba", 0x0042cd65, 0x12

	.global gUnknown_0842CD77
gUnknown_0842CD77: @ 842CD77
	.incbin "baserom.gba", 0x0042cd77, 0x2c

	.global gUnknown_0842CDA3
gUnknown_0842CDA3: @ 842CDA3
	.incbin "baserom.gba", 0x0042cda3, 0x39

	.global gUnknown_0842CDDC
gUnknown_0842CDDC: @ 842CDDC
	.incbin "baserom.gba", 0x0042cddc, 0x2a

	.global gUnknown_0842CE06
gUnknown_0842CE06: @ 842CE06
	.incbin "baserom.gba", 0x0042ce06, 0x21

	.global gUnknown_0842CE27
gUnknown_0842CE27: @ 842CE27
	.incbin "baserom.gba", 0x0042ce27, 0x1b

	.global gUnknown_0842CE42
gUnknown_0842CE42: @ 842CE42
	.incbin "baserom.gba", 0x0042ce42, 0x1e

	.global gUnknown_0842CE60
gUnknown_0842CE60: @ 842CE60
	.incbin "baserom.gba", 0x0042ce60, 0x18

	.global gUnknown_0842CE78
gUnknown_0842CE78: @ 842CE78
	.incbin "baserom.gba", 0x0042ce78, 0x19

	.global gUnknown_0842CE91
gUnknown_0842CE91: @ 842CE91
	.incbin "baserom.gba", 0x0042ce91, 0x11

	.global gUnknown_0842CEA2
gUnknown_0842CEA2: @ 842CEA2
	.incbin "baserom.gba", 0x0042cea2, 0xd

	.global gUnknown_0842CEAF
gUnknown_0842CEAF: @ 842CEAF
	.incbin "baserom.gba", 0x0042ceaf, 0x237

	.global gUnknown_0842D0E6
gUnknown_0842D0E6: @ 842D0E6
	.incbin "baserom.gba", 0x0042d0e6, 0x1

	.global gUnknown_0842D0E7
gUnknown_0842D0E7: @ 842D0E7
	.incbin "baserom.gba", 0x0042d0e7, 0xa

	.global gUnknown_0842D0F1
gUnknown_0842D0F1: @ 842D0F1
	.incbin "baserom.gba", 0x0042d0f1, 0x2

	.global gUnknown_0842D0F3
gUnknown_0842D0F3: @ 842D0F3
	.incbin "baserom.gba", 0x0042d0f3, 0x8

	.global gUnknown_0842D0FB
gUnknown_0842D0FB: @ 842D0FB
	.incbin "baserom.gba", 0x0042d0fb, 0x8

	.global gUnknown_0842D103
gUnknown_0842D103: @ 842D103
	.incbin "baserom.gba", 0x0042d103, 0x15

	.global gUnknown_0842D118
gUnknown_0842D118: @ 842D118
	.incbin "baserom.gba", 0x0042d118, 0x13

	.global gUnknown_0842D12B
gUnknown_0842D12B: @ 842D12B
	.incbin "baserom.gba", 0x0042d12b, 0x8

	.global gUnknown_0842D133
gUnknown_0842D133: @ 842D133
	.incbin "baserom.gba", 0x0042d133, 0x31

	.global gUnknown_0842D164
gUnknown_0842D164: @ 842D164
	.incbin "baserom.gba", 0x0042d164, 0x33

	.global gUnknown_0842D197
gUnknown_0842D197: @ 842D197
	.incbin "baserom.gba", 0x0042d197, 0x2c

	.global gUnknown_0842D1C3
gUnknown_0842D1C3: @ 842D1C3
	.incbin "baserom.gba", 0x0042d1c3, 0x2b

	.global gUnknown_0842D1EE
gUnknown_0842D1EE: @ 842D1EE
	.incbin "baserom.gba", 0x0042d1ee, 0x10

	.global gUnknown_0842D1FE
gUnknown_0842D1FE: @ 842D1FE
	.incbin "baserom.gba", 0x0042d1fe, 0x1e

	.global gUnknown_0842D21C
gUnknown_0842D21C: @ 842D21C
	.incbin "baserom.gba", 0x0042d21c, 0x6

	.global gUnknown_0842D222
gUnknown_0842D222: @ 842D222
	.incbin "baserom.gba", 0x0042d222, 0x9

	.global gUnknown_0842D22B
gUnknown_0842D22B: @ 842D22B
	.incbin "baserom.gba", 0x0042d22b, 0x91

	.global gUnknown_0842D2BC
gUnknown_0842D2BC: @ 842D2BC
	.incbin "baserom.gba", 0x0042d2bc, 0x9

	.global gUnknown_0842D2C5
gUnknown_0842D2C5: @ 842D2C5
	.incbin "baserom.gba", 0x0042d2c5, 0x14

	.global gUnknown_0842D2D9
gUnknown_0842D2D9: @ 842D2D9
	.incbin "baserom.gba", 0x0042d2d9, 0x2e

	.global gUnknown_0842D307
gUnknown_0842D307: @ 842D307
	.incbin "baserom.gba", 0x0042d307, 0x61

	.global gUnknown_0842D368
gUnknown_0842D368: @ 842D368
	.incbin "baserom.gba", 0x0042d368, 0xb

	.global gUnknown_0842D373
gUnknown_0842D373: @ 842D373
	.incbin "baserom.gba", 0x0042d373, 0x1d

	.global gUnknown_0842D390
gUnknown_0842D390: @ 842D390
	.incbin "baserom.gba", 0x0042d390, 0x15

	.global gUnknown_0842D3A5
gUnknown_0842D3A5: @ 842D3A5
	.incbin "baserom.gba", 0x0042d3a5, 0x10

	.global gUnknown_0842D3B5
gUnknown_0842D3B5: @ 842D3B5
	.incbin "baserom.gba", 0x0042d3b5, 0x27

	.global gUnknown_0842D3DC
gUnknown_0842D3DC: @ 842D3DC
	.incbin "baserom.gba", 0x0042d3dc, 0x3e

	.global gUnknown_0842D41A
gUnknown_0842D41A: @ 842D41A
	.incbin "baserom.gba", 0x0042d41a, 0x1a

	.global gUnknown_0842D434
gUnknown_0842D434: @ 842D434
	.incbin "baserom.gba", 0x0042d434, 0x2d

	.global gUnknown_0842D461
gUnknown_0842D461: @ 842D461
	.incbin "baserom.gba", 0x0042d461, 0x18

	.global gUnknown_0842D479
gUnknown_0842D479: @ 842D479
	.incbin "baserom.gba", 0x0042d479, 0x1f

	.global gUnknown_0842D498
gUnknown_0842D498: @ 842D498
	.incbin "baserom.gba", 0x0042d498, 0x7

	.global gUnknown_0842D49F
gUnknown_0842D49F: @ 842D49F
	.incbin "baserom.gba", 0x0042d49f, 0xe

	.global gUnknown_0842D4AD
gUnknown_0842D4AD: @ 842D4AD
	.incbin "baserom.gba", 0x0042d4ad, 0x5

	.global gUnknown_0842D4B2
gUnknown_0842D4B2: @ 842D4B2
	.incbin "baserom.gba", 0x0042d4b2, 0x5

	.global gUnknown_0842D4B7
gUnknown_0842D4B7: @ 842D4B7
	.incbin "baserom.gba", 0x0042d4b7, 0xe

	.global gUnknown_0842D4C5
gUnknown_0842D4C5: @ 842D4C5
	.incbin "baserom.gba", 0x0042d4c5, 0x6

	.global gUnknown_0842D4CB
gUnknown_0842D4CB: @ 842D4CB
	.incbin "baserom.gba", 0x0042d4cb, 0x8

	.global gUnknown_0842D4D3
gUnknown_0842D4D3: @ 842D4D3
	.incbin "baserom.gba", 0x0042d4d3, 0xe

	.global gUnknown_0842D4E1
gUnknown_0842D4E1: @ 842D4E1
	.incbin "baserom.gba", 0x0042d4e1, 0x13

	.global gUnknown_0842D4F4
gUnknown_0842D4F4: @ 842D4F4
	.incbin "baserom.gba", 0x0042d4f4, 0x2

	.global gUnknown_0842D4F6
gUnknown_0842D4F6: @ 842D4F6
	.incbin "baserom.gba", 0x0042d4f6, 0x6

	.global gUnknown_0842D4FC
gUnknown_0842D4FC: @ 842D4FC
	.incbin "baserom.gba", 0x0042d4fc, 0x3

	.global gUnknown_0842D4FF
gUnknown_0842D4FF: @ 842D4FF
	.incbin "baserom.gba", 0x0042d4ff, 0x1c41

	.global gUnknown_0842F140
gUnknown_0842F140: @ 842F140
	.incbin "baserom.gba", 0x0042f140, 0x80

	.global gUnknown_0842F1C0
gUnknown_0842F1C0: @ 842F1C0
	.incbin "baserom.gba", 0x0042f1c0, 0x80

	.global gUnknown_0842F240
gUnknown_0842F240: @ 842F240
	.incbin "baserom.gba", 0x0042f240, 0x8

	.global gUnknown_0842F248
gUnknown_0842F248: @ 842F248
	.incbin "baserom.gba", 0x0042f248, 0x8

	.global gUnknown_0842F250
gUnknown_0842F250: @ 842F250
	.incbin "baserom.gba", 0x0042f250, 0x48

	.global gUnknown_0842F298
gUnknown_0842F298: @ 842F298
	.incbin "baserom.gba", 0x0042f298, 0x324

	.global gUnknown_0842F5BC
gUnknown_0842F5BC: @ 842F5BC
	.incbin "baserom.gba", 0x0042f5bc, 0x4

	.global gUnknown_0842F5C0
gUnknown_0842F5C0: @ 842F5C0
	.incbin "baserom.gba", 0x0042f5c0, 0x100

	.global gUnknown_0842F6C0
gUnknown_0842F6C0: @ 842F6C0
	.incbin "baserom.gba", 0x0042f6c0, 0x98

	.global gUnknown_0842F758
gUnknown_0842F758: @ 842F758
	.incbin "baserom.gba", 0x0042f758, 0x28

	.global gUnknown_0842F780
gUnknown_0842F780: @ 842F780
	.incbin "baserom.gba", 0x0042f780, 0x8

	.global gUnknown_0842F788
gUnknown_0842F788: @ 842F788
	.incbin "baserom.gba", 0x0042f788, 0x8

	.global gUnknown_0842F790
gUnknown_0842F790: @ 842F790
	.incbin "baserom.gba", 0x0042f790, 0x8

	.global gUnknown_0842F798
gUnknown_0842F798: @ 842F798
	.incbin "baserom.gba", 0x0042f798, 0x32

	.global gUnknown_0842F7CA
gUnknown_0842F7CA: @ 842F7CA
	.incbin "baserom.gba", 0x0042f7ca, 0x2c

	.global gUnknown_0842F7F6
gUnknown_0842F7F6: @ 842F7F6
	.incbin "baserom.gba", 0x0042f7f6, 0x28

	.global gUnknown_0842F81E
gUnknown_0842F81E: @ 842F81E
	.incbin "baserom.gba", 0x0042f81e, 0x34

	.global gUnknown_0842F852
gUnknown_0842F852: @ 842F852
	.incbin "baserom.gba", 0x0042f852, 0x36

	.global gUnknown_0842F888
gUnknown_0842F888: @ 842F888
	.incbin "baserom.gba", 0x0042f888, 0x1c

	.global gUnknown_0842F8A4
gUnknown_0842F8A4: @ 842F8A4
	.incbin "baserom.gba", 0x0042f8a4, 0x12

	.global gUnknown_0842F8B6
gUnknown_0842F8B6: @ 842F8B6
	.incbin "baserom.gba", 0x0042f8b6, 0x2f

	.global gUnknown_0842F8E5
gUnknown_0842F8E5: @ 842F8E5
	.incbin "baserom.gba", 0x0042f8e5, 0x55

	.global gUnknown_0842F93A
gUnknown_0842F93A: @ 842F93A
	.incbin "baserom.gba", 0x0042f93a, 0x2a
