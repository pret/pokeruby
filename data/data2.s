@ the second big chunk of data

	.include "asm/macros.s"
	.include "constants/constants.s"

	.section .rodata

	.global gUnknown_081E764C
gUnknown_081E764C: @ 81E764C
	.incbin "graphics/birch_speech/shadow.gbapal"
	.incbin "baserom.gba", 0x001e766c, 0x20

	.global gUnknown_081E768C
gUnknown_081E768C: @ 81E768C
	.incbin "graphics/birch_speech/shadow.4bpp.lz"

	.global gUnknown_081E7834
gUnknown_081E7834: @ 81E7834
	.incbin "baserom.gba", 0x001e7834, 0x128

	.global gUnknown_081E795C
gUnknown_081E795C: @ 81E795C
	.incbin "baserom.gba", 0x001e795c, 0x10

	.global gUnknown_081E796C
gUnknown_081E796C: @ 81E796C
	.space 16

	.global gUnknown_081E797C
gUnknown_081E797C: @ 81E797C
Unknown_081E797C:
	.incbin "baserom.gba", 0x001e797c, 0x20
Unknown_081E799C:
	.incbin "baserom.gba", 0x001e799c, 0x10

	.global gUnknown_081E79AC
gUnknown_081E79AC: @ 81E79AC
	.4byte Unknown_081E799C

	.global gUnknown_081E79B0
gUnknown_081E79B0: @ 81E79B0
	.incbin "baserom.gba", 0x001e79b0, 0x10

	.global gUnknown_081E79C0
gUnknown_081E79C0: @ 81E79C0
	.incbin "baserom.gba", 0x001e79c0, 0x28

	.global gUnknown_081E79E8
gUnknown_081E79E8: @ 81E79E8
Unknown_81E79E8:
	.incbin "baserom.gba", 0x001e79e8, 0xB8
Unknown_81E7AA0:
	.incbin "baserom.gba", 0x001e7aa0, 0x20
Unknown_81E7AC0:
	.incbin "baserom.gba", 0x001e7ac0, 0x18
Unknown_81E7AD8:
	.incbin "baserom.gba", 0x001e7ad8, 0x18
Unknown_81E7AF0:
	.incbin "baserom.gba", 0x001e7af0, 0x20
Unknown_81E7B10:
	.incbin "baserom.gba", 0x001e7b10, 0x10
Unknown_81E7B20:
	.incbin "baserom.gba", 0x001e7b20, 0x10
Unknown_81E7B30:
	.incbin "baserom.gba", 0x001e7b30, 0x64
Unknown_81E7B94:
	.incbin "baserom.gba", 0x001e7b94, 0x10
Unknown_81E7BA4:
	.incbin "baserom.gba", 0x001e7ba4, 0x18
Unknown_81E7BBC:
	.incbin "baserom.gba", 0x001e7bbc, 0x20
Unknown_81E7BDC:
	.incbin "baserom.gba", 0x001e7bdc, 0x10

	.align 2
	.global gUnknown_081E7BEC
gUnknown_081E7BEC: @ 81E7BEC
	.4byte Unknown_81E7AA0
	.4byte Unknown_81E7AC0
	.4byte Unknown_81E7AD8
	.4byte Unknown_81E7AF0
	.4byte Unknown_81E7B10
	.4byte Unknown_81E7B20
	.4byte Unknown_81E7B94
	.4byte Unknown_81E7BA4
	.4byte Unknown_81E7BBC
	.4byte Unknown_81E7B30
	.4byte Unknown_81E7BDC

	.global gUnknown_081E7C18
gUnknown_081E7C18: @ 81E7C18
Unknown_81E7C18:
	.incbin "baserom.gba", 0x001e7c18, 0x2c
Unknown_81E7C44:
	.incbin "baserom.gba", 0x001e7c44, 0x8
Unknown_81E7C4C:
	.incbin "baserom.gba", 0x001e7c4c, 0x8
Unknown_81E7C54:
	.incbin "baserom.gba", 0x001e7c54, 0x8
Unknown_81E7C5C:
	.incbin "baserom.gba", 0x001e7c5c, 0x8

	.align 2
	.global gUnknown_081E7C64
gUnknown_081E7C64: @ 81E7C64
	.4byte Unknown_81E7C44
	.4byte Unknown_81E7C4C
	.4byte Unknown_81E7C54
	.4byte Unknown_81E7C5C

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
Unknown_81EC134:
	.incbin "baserom.gba", 0x001EC134, 0x18
Unknown_81EC14C:
	.incbin "baserom.gba", 0x001EC14C, 0x4
Unknown_81EC150:
	.incbin "baserom.gba", 0x001EC150, 0x4
Unknown_81EC154:
	.incbin "baserom.gba", 0x001EC154, 0x8
Unknown_81EC15C:
	.incbin "baserom.gba", 0x001EC15C, 0x4
Unknown_81EC160:
	.incbin "baserom.gba", 0x001EC160, 0x4
Unknown_81EC164:
	.incbin "baserom.gba", 0x001EC164, 0x4
Unknown_81EC168:
	.incbin "baserom.gba", 0x001EC168, 0x4
Unknown_81EC16C:
	.incbin "baserom.gba", 0x001EC16C, 0x8
Unknown_81EC174:
	.incbin "baserom.gba", 0x001EC174, 0x8
Unknown_81EC17C:
	.incbin "baserom.gba", 0x001EC17C, 0x4
Unknown_81EC180:
	.incbin "baserom.gba", 0x001EC180, 0x4
Unknown_81EC184:
	.incbin "baserom.gba", 0x001EC184, 0x4
Unknown_81EC188:
	.incbin "baserom.gba", 0x001EC188, 0x4
Unknown_81EC18C:
	.incbin "baserom.gba", 0x001EC18C, 0x4
Unknown_81EC190:
	.incbin "baserom.gba", 0x001EC190, 0x4
Unknown_81EC194:
	.incbin "baserom.gba", 0x001EC194, 0x4
Unknown_81EC198:
	.incbin "baserom.gba", 0x001EC198, 0x4
Unknown_81EC19C:
	.incbin "baserom.gba", 0x001EC19C, 0x4
Unknown_81EC1A0:
	.incbin "baserom.gba", 0x001EC1A0, 0x4
Unknown_81EC1A4:
	.incbin "baserom.gba", 0x001EC1A4, 0x4
Unknown_81EC1A8:
	.incbin "baserom.gba", 0x001EC1A8, 0x4
Unknown_81EC1AC:
	.incbin "baserom.gba", 0x001EC1AC, 0x4
Unknown_81EC1B0:
	.incbin "baserom.gba", 0x001EC1B0, 0x4
Unknown_81EC1B4:
	.incbin "baserom.gba", 0x001EC1B4, 0x4
Unknown_81EC1B8:
	.incbin "baserom.gba", 0x001EC1B8, 0x4
Unknown_81EC1BC:
	.incbin "baserom.gba", 0x001EC1BC, 0x4
Unknown_81EC1C0:
	.incbin "baserom.gba", 0x001EC1C0, 0x4
Unknown_81EC1C4:
	.incbin "baserom.gba", 0x001EC1C4, 0x4
Unknown_81EC1C8:
	.incbin "baserom.gba", 0x001EC1C8, 0x4
Unknown_81EC1CC:
	.incbin "baserom.gba", 0x001EC1CC, 0x4
Unknown_81EC1D0:
	.incbin "baserom.gba", 0x001EC1D0, 0x4
Unknown_81EC1D4:
	.incbin "baserom.gba", 0x001EC1D4, 0x4
Unknown_81EC1D8:
	.incbin "baserom.gba", 0x001EC1D8, 0x4
Unknown_81EC1DC:
	.incbin "baserom.gba", 0x001EC1DC, 0x4
Unknown_81EC1E0:
	.incbin "baserom.gba", 0x001EC1E0, 0x4
Unknown_81EC1E4:
	.incbin "baserom.gba", 0x001EC1E4, 0x4
Unknown_81EC1E8:
	.incbin "baserom.gba", 0x001EC1E8, 0x4
Unknown_81EC1EC:
	.incbin "baserom.gba", 0x001EC1EC, 0x4
Unknown_81EC1F0:
	.incbin "baserom.gba", 0x001EC1F0, 0x4
Unknown_81EC1F4:
	.incbin "baserom.gba", 0x001EC1F4, 0x4
Unknown_81EC1F8:
	.incbin "baserom.gba", 0x001EC1F8, 0x4
Unknown_81EC1FC:
	.incbin "baserom.gba", 0x001EC1FC, 0x4
Unknown_81EC200:
	.incbin "baserom.gba", 0x001EC200, 0x4
Unknown_81EC204:
	.incbin "baserom.gba", 0x001EC204, 0x4
Unknown_81EC208:
	.incbin "baserom.gba", 0x001EC208, 0x4
Unknown_81EC20C:
	.incbin "baserom.gba", 0x001EC20C, 0x4
Unknown_81EC210:
	.incbin "baserom.gba", 0x001EC210, 0x4
Unknown_81EC214:
	.incbin "baserom.gba", 0x001EC214, 0x4
Unknown_81EC218:
	.incbin "baserom.gba", 0x001EC218, 0x4
Unknown_81EC21C:
	.incbin "baserom.gba", 0x001EC21C, 0x4
Unknown_81EC220:
	.incbin "baserom.gba", 0x001EC220, 0x4
Unknown_81EC224:
	.incbin "baserom.gba", 0x001EC224, 0x4
Unknown_81EC228:
	.incbin "baserom.gba", 0x001EC228, 0x4
Unknown_81EC22C:
	.incbin "baserom.gba", 0x001EC22C, 0x4
Unknown_81EC230:
	.incbin "baserom.gba", 0x001EC230, 0x4
Unknown_81EC234:
	.incbin "baserom.gba", 0x001EC234, 0x4
Unknown_81EC238:
	.incbin "baserom.gba", 0x001EC238, 0x4
Unknown_81EC23C:
	.incbin "baserom.gba", 0x001EC23C, 0x4
Unknown_81EC240:
	.incbin "baserom.gba", 0x001EC240, 0x4
Unknown_81EC244:
	.incbin "baserom.gba", 0x001EC244, 0x4
Unknown_81EC248:
	.incbin "baserom.gba", 0x001EC248, 0x4
Unknown_81EC24C:
	.incbin "baserom.gba", 0x001EC24C, 0x4
Unknown_81EC250:
	.incbin "baserom.gba", 0x001EC250, 0x4
Unknown_81EC254:
	.incbin "baserom.gba", 0x001EC254, 0x4
Unknown_81EC258:
	.incbin "baserom.gba", 0x001EC258, 0x4
Unknown_81EC25C:
	.incbin "baserom.gba", 0x001EC25C, 0x4
Unknown_81EC260:
	.incbin "baserom.gba", 0x001EC260, 0x4
Unknown_81EC264:
	.incbin "baserom.gba", 0x001EC264, 0x4
Unknown_81EC268:
	.incbin "baserom.gba", 0x001EC268, 0x4
Unknown_81EC26C:
	.incbin "baserom.gba", 0x001EC26C, 0x4
Unknown_81EC270:
	.incbin "baserom.gba", 0x001EC270, 0x4
Unknown_81EC274:
	.incbin "baserom.gba", 0x001EC274, 0x4
Unknown_81EC278:
	.incbin "baserom.gba", 0x001EC278, 0x4
Unknown_81EC27C:
	.incbin "baserom.gba", 0x001EC27C, 0x4
Unknown_81EC280:
	.incbin "baserom.gba", 0x001EC280, 0x4
Unknown_81EC284:
	.incbin "baserom.gba", 0x001EC284, 0x4
Unknown_81EC288:
	.incbin "baserom.gba", 0x001EC288, 0x4
Unknown_81EC28C:
	.incbin "baserom.gba", 0x001EC28C, 0x4
Unknown_81EC290:
	.incbin "baserom.gba", 0x001EC290, 0x4
Unknown_81EC294:
	.incbin "baserom.gba", 0x001EC294, 0x4
Unknown_81EC298:
	.incbin "baserom.gba", 0x001EC298, 0x4
Unknown_81EC29C:
	.incbin "baserom.gba", 0x001EC29C, 0x4
Unknown_81EC2A0:
	.incbin "baserom.gba", 0x001EC2A0, 0x4

	.align 2
	.global gUnknown_081EC2A4
gUnknown_081EC2A4: @ 81EC2A4
	.4byte Unknown_81EC14C
	.4byte Unknown_81EC150
	.4byte Unknown_81EC154
	.4byte Unknown_81EC15C
	.4byte Unknown_81EC160
	.4byte Unknown_81EC164
	.4byte Unknown_81EC168
	.4byte Unknown_81EC16C
	.4byte Unknown_81EC174
	.4byte Unknown_81EC17C
	.4byte Unknown_81EC180
	.4byte Unknown_81EC184
	.4byte Unknown_81EC188
	.4byte Unknown_81EC18C
	.4byte Unknown_81EC190
	.4byte Unknown_81EC194
	.4byte Unknown_81EC198
	.4byte Unknown_81EC19C
	.4byte Unknown_81EC1A0
	.4byte Unknown_81EC1A4
	.4byte Unknown_81EC1A8
	.4byte Unknown_81EC1AC
	.4byte Unknown_81EC1B0
	.4byte Unknown_81EC1B4
	.4byte Unknown_81EC1B8
	.4byte Unknown_81EC1BC
	.4byte Unknown_81EC1C0
	.4byte Unknown_81EC1C4
	.4byte Unknown_81EC1C8
	.4byte Unknown_81EC1CC
	.4byte Unknown_81EC1D0
	.4byte Unknown_81EC1D4
	.4byte Unknown_81EC1D8
	.4byte Unknown_81EC1DC
	.4byte Unknown_81EC1E0
	.4byte Unknown_81EC1E4
	.4byte Unknown_81EC1E8
	.4byte Unknown_81EC1EC
	.4byte Unknown_81EC1F0
	.4byte Unknown_81EC1F4
	.4byte Unknown_81EC1F8
	.4byte Unknown_81EC1FC
	.4byte Unknown_81EC200
	.4byte Unknown_81EC204
	.4byte Unknown_81EC208
	.4byte Unknown_81EC20C
	.4byte Unknown_81EC210
	.4byte Unknown_81EC214
	.4byte Unknown_81EC218
	.4byte Unknown_81EC21C
	.4byte Unknown_81EC220
	.4byte Unknown_81EC224
	.4byte Unknown_81EC228
	.4byte Unknown_81EC22C
	.4byte Unknown_81EC230
	.4byte Unknown_81EC234
	.4byte Unknown_81EC238
	.4byte Unknown_81EC23C
	.4byte Unknown_81EC240
	.4byte Unknown_81EC244
	.4byte Unknown_81EC248
	.4byte Unknown_81EC24C
	.4byte Unknown_81EC250
	.4byte Unknown_81EC254
	.4byte Unknown_81EC258
	.4byte Unknown_81EC25C
	.4byte Unknown_81EC260
	.4byte Unknown_81EC264
	.4byte Unknown_81EC268
	.4byte Unknown_81EC26C
	.4byte Unknown_81EC270
	.4byte Unknown_81EC274
	.4byte Unknown_81EC278
	.4byte Unknown_81EC27C
	.4byte Unknown_81EC280
	.4byte Unknown_81EC284
	.4byte Unknown_81EC288
	.4byte Unknown_81EC28C
	.4byte Unknown_81EC290
	.4byte Unknown_81EC294
	.4byte Unknown_81EC298
	.4byte Unknown_81EC29C
	.4byte Unknown_81EC2A0

	.global gUnknown_081EC3F0
gUnknown_081EC3F0: @ 81EC3F0
	.incbin "baserom.gba", 0x001ec3f0, 0x14c

@ 81EC53C
	.include "data/graphics/trainers/front_pic_table.s"

@ 81EC7D4
	.include "data/graphics/trainers/front_pic_palette_table.s"

@ 81ECA6C
Unknown_81ECA6C:
	.incbin "baserom.gba", 0x1ECA6C, 0x48
Unknown_81ECAB4:
	.incbin "baserom.gba", 0x1ECAB4, 0x8
Unknown_81ECABC:
	.incbin "baserom.gba", 0x1ECABC, 0x8
Unknown_81ECAC4:
	.incbin "baserom.gba", 0x1ECAC4, 0x8

	.align 2
	.global gUnknown_081ECACC
gUnknown_081ECACC: @ 81ECACC
	.4byte Unknown_81ECAB4
	.4byte Unknown_81ECABC
	.4byte Unknown_81ECAC4

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
	obj_tiles 0x08e5dc2c, 4096, 0x2710

	.align 2
	.global gUnknown_081F95AC
gUnknown_081F95AC: @ 81F95AC
	.4byte 0x08e5de3c
	.4byte 0x08e5e424
	.4byte 0x08e639e4
	.4byte 0x08e63f6c
	.4byte 0x08e5e3ec
	.4byte 0x08e5e6d4
	.4byte 0x08e5ed8c
	.4byte 0x08e64128
	.4byte 0x08e64838
	.4byte 0x08e5ed4c
	.4byte 0x08e5f03c
	.4byte 0x08e5f67c
	.4byte 0x08e64a70
	.4byte 0x08e64fb4
	.4byte 0x08e5f634
	.4byte 0x08e5f92c
	.4byte 0x08e5ff2c
	.4byte 0x08e6515c
	.4byte 0x08e65628
	.4byte 0x08e5fee4
	.4byte 0x08e601dc
	.4byte 0x08e607f4
	.4byte 0x08e657b8
	.4byte 0x08e65dc4
	.4byte 0x08e607b0
	.4byte 0x08e60aa4
	.4byte 0x08e6108c
	.4byte 0x08e65f68
	.4byte 0x08e664b4
	.4byte 0x08e6104c
	.4byte 0x08e6133c
	.4byte 0x08e61938
	.4byte 0x08e66600
	.4byte 0x08e66be0
	.4byte 0x08e618fc
	.4byte 0x08e61be8
	.4byte 0x08e62228
	.4byte 0x08e66d74
	.4byte 0x08e67590
	.4byte 0x08e621e0
	.4byte 0x08e62514
	.4byte 0x08e62afc
	.4byte 0x08e67838
	.4byte 0x08e67c48
	.4byte 0x08e63664
	.4byte 0x08e62514
	.4byte 0x08e62afc
	.4byte 0x08e67838
	.4byte 0x08e67c48
	.4byte 0x08e624d8

	.global gUnknown_081F9674
gUnknown_081F9674: @ 81F9674
	.incbin "baserom.gba", 0x001f9674, 0xc

	.global gUnknown_081F9680
gUnknown_081F9680: @ 81F9680
	obj_tiles 0x030041d0, 32, 0x1013

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
	.4byte sub_8013FE8
	.4byte sub_80147A0
	.4byte sub_80146F4
	.4byte sub_8014BF4
	.4byte sub_8014D50
	.4byte sub_8014D98
	.4byte sub_8014DF8
	.4byte sub_8014EBC
	.4byte bs8_exit_by_flight
	.4byte sub_8014FBC
	.4byte sub_801B594
	.4byte bsB_exit_by_move
	.4byte bsC_8016D70
	.4byte sub_8015060

	.align 2
	.global gUnknown_081FA678
gUnknown_081FA678: @ 81FA678
	.4byte bc_8013B1C
	.4byte sub_8013998
	.4byte sub_8013B64
	.4byte sub_8013B64
	.4byte sub_8013BDC
	.4byte sub_8013C9C
	.4byte sub_8013C48
	.4byte sub_8013C9C
	.4byte sub_8013C9C

	.global gStatusConditionString_PoisonJpn
gStatusConditionString_PoisonJpn: @ 81FA69C
	.string "どく$$$$$$"

	.global gStatusConditionString_SleepJpn
gStatusConditionString_SleepJpn: @ 81FA6A4
	.string "ねむり$$$$$"

	.global gStatusConditionString_ParalysisJpn
gStatusConditionString_ParalysisJpn: @ 81FA6AC
	.string "まひ$$$$$$"

	.global gStatusConditionString_BurnJpn
gStatusConditionString_BurnJpn: @ 81FA6B4
	.string "やけど$$$$$"

	.global gStatusConditionString_IceJpn
gStatusConditionString_IceJpn: @ 81FA6BC
	.string "こおり$$$$$"

	.global gStatusConditionString_ConfusionJpn
gStatusConditionString_ConfusionJpn: @ 81FA6C4
	.string "こんらん$$$$"

	.global gStatusConditionString_LoveJpn
gStatusConditionString_LoveJpn: @ 81FA6CC
	.string "メロメロ$$$$"

	.align 2
	.global gUnknown_081FA6D4
gUnknown_081FA6D4: @ 81FA6D4
	.4byte gStatusConditionString_PoisonJpn
	.4byte BattleText_PoisonStatus
	.4byte gStatusConditionString_SleepJpn
	.4byte BattleText_Sleep
	.4byte gStatusConditionString_ParalysisJpn
	.4byte BattleText_Paralysis
	.4byte gStatusConditionString_BurnJpn
	.4byte BattleText_Burn
	.4byte gStatusConditionString_IceJpn
	.4byte BattleText_IceStatus
	.4byte gStatusConditionString_ConfusionJpn
	.4byte BattleText_Confusion
	.4byte gStatusConditionString_LoveJpn
	.4byte BattleText_Love

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

	.align 2
	.global gUnknown_081FA73C
gUnknown_081FA73C: @ 81FA73C
	.4byte atk00_attackcanceler
	.4byte atk01_accuracycheck
	.4byte atk02_attackstring
	.4byte atk03_ppreduce
	.4byte atk04_critcalc
	.4byte atk05_cmd5
	.4byte sub_801CCC4
	.4byte atk07_cmd7
	.4byte atk08_cmd8
	.4byte sub_801D8EC
	.4byte sub_801DA60
	.4byte sub_801DA80
	.4byte atk0C_datahpupdate
	.4byte atk0D_critmessage
	.4byte atk0E_missmessage
	.4byte atk0F_resultmessage
	.4byte atk10_printstring
	.4byte atk11_printstring2
	.4byte atk12_waitmessage
	.4byte atk13_printfromtable
	.4byte atk14_printfromtable2
	.4byte atk15_seteffectwithchancetarget
	.4byte sub_801F708
	.4byte sub_801F718
	.4byte sub_801F728
	.4byte sub_801F7AC
	.4byte sub_801FB34
	.4byte atkE2_cmde2
	.4byte atk1C_jumpifstatus
	.4byte atk1D_jumpifsecondarystatus
	.4byte atk1E_jumpifability
	.4byte sub_801FDB4
	.4byte sub_801FE2C
	.4byte atk21_jumpifspecialstatusflag
	.4byte sub_801FFA8
	.4byte sub_8020004
	.4byte sub_80209B4
	.4byte atk25_cmd25
	.4byte sub_8020BB4
	.4byte atk27_cmd27
	.4byte sub_8020C14
	.4byte atk29_jumpifbyte
	.4byte sub_8020CD4
	.4byte sub_8020D7C
	.4byte sub_8020E30
	.4byte sub_8020EB8
	.4byte sub_8020F3C
	.4byte sub_8020F64
	.4byte sub_8020F90
	.4byte atk31_copyarray
	.4byte atk32_memcpy_with_offset
	.4byte sub_802107C
	.4byte atk34_orhalfword
	.4byte atk35_orword
	.4byte sub_8021124
	.4byte atk37_bichalfword
	.4byte atk38_bicword
	.4byte atk39_pause
	.4byte sub_802120C
	.4byte atk3B_8022C68
	.4byte atk3C_return
	.4byte sub_8021290
	.4byte sub_80212B0
	.4byte atk3F_end3
	.4byte atk40_801DBA0
	.4byte atk41_call
	.4byte atk42_jumpiftype2
	.4byte sub_8021384
	.4byte sub_80213D0
	.4byte atk46_cmd46
	.4byte sub_80214B4
	.4byte sub_8021580
	.4byte atk48_playstatchangeanimation
	.4byte sub_80217F8
	.4byte atk4A_damagecalc2
	.4byte atk4B_cmd4b
	.4byte atk4C_switch1
	.4byte sub_80225F0
	.4byte sub_8022784
	.4byte sub_8022830
	.4byte atk50_openpartyscreen
	.4byte sub_802331C
	.4byte sub_8023524
	.4byte sub_80237CC
	.4byte atk54_802511C
	.4byte sub_8023848
	.4byte atk56_8025194
	.4byte atk57_80251C4_flee
	.4byte atk58_cmd58
	.4byte atk59_8025230
	.4byte sub_8023AF8
	.4byte atk5B_80256E0
	.4byte atk5C_cmd5c
	.4byte sub_8024014
	.4byte atk5E_8025A70
	.4byte atk5F_8025B24
	.4byte atk60_cmd60
	.4byte atk61_8025BA4
	.4byte atk62_08025C6C
	.4byte atk63_jumptoattack
	.4byte atk64_statusanimation
	.4byte atk65_8025D90
	.4byte atk66_8025E38
	.4byte atk67_8025ECC
	.4byte sub_80246A0
	.4byte atk69_8025FE0
	.4byte atk6A_stash_item_for_side
	.4byte sub_80248C0
	.4byte sub_80248FC
	.4byte sub_8024C4C
	.4byte atk6E_state0_side_becomes_attacker
	.4byte atk6F_8026810
	.4byte atk70_record_ability_usage_of_side
	.4byte atk71_80268A0
	.4byte atk72_flee
	.4byte atk73_cmd73
	.4byte atk74_hp_tresholds_2
	.4byte atk75_8026A58
	.4byte sub_8024F40
	.4byte atk77_setprotect
	.4byte atk78_faintifabilitynotdamp
	.4byte atk79_setuserhptozero
	.4byte sub_80253E8
	.4byte sub_802548C
	.4byte sub_8025508
	.4byte sub_80256D0
	.4byte atk7E_setreflect
	.4byte sub_80257DC
	.4byte atk80_manipulatedamage
	.4byte atk81_setrest
	.4byte atk82_jumpifnotfirstturn
	.4byte sub_8025A34
	.4byte sub_8025AE0
	.4byte sub_8025B5C
	.4byte atk86_stockpiletobasedamage
	.4byte sub_8025D00
	.4byte atk88_negativedamage
	.4byte atk89_statbuffchange
	.4byte atk8A_normalisebuffs
	.4byte atk8B_setbide
	.4byte atk8C_confuseifrepeatingattackends
	.4byte atk8D_setloopcounter
	.4byte sub_8026468
	.4byte sub_8026590
	.4byte sub_802688C
	.4byte atk91_givemoney
	.4byte atk92_setlightscreen
	.4byte sub_8026B78
	.4byte atk94_gethalfcurrentenemyhp
	.4byte sub_8026E94
	.4byte sub_8026EEC
	.4byte sub_8027064
	.4byte sub_8027238
	.4byte sub_8027348
	.4byte atk9A_setincreasedcriticalchance
	.4byte atk9B_transformdataexecution
	.4byte sub_80275D8
	.4byte atk9D_copyattack
	.4byte sub_80278B8
	.4byte sub_8027960
	.4byte atkA0_psywavedamageeffect
	.4byte atkA1_counterdamagecalculator
	.4byte atkA2_mirrorcoatdamagecalculator
	.4byte atkA3_disablelastusedattack
	.4byte atkA4_setencore
	.4byte sub_8027E4C
	.4byte sub_8027F44
	.4byte atkA7_setalwayshitflag
	.4byte atkA8_copymovepermanently
	.4byte sub_8028420
	.4byte sub_8028558
	.4byte atkAB_802A458
	.4byte atkAC_remaininghptopower
	.4byte sub_8028668
	.4byte sub_8028858
	.4byte sub_8028AD4
	.4byte sub_8028B70
	.4byte sub_8028BFC
	.4byte atkB2_setperishsong
	.4byte atkB3_rolloutdamagecalculation
	.4byte atkB4_jumpifconfusedandattackmaxed
	.4byte sub_8028EC8
	.4byte atkB6_happinesstodamagecalculation
	.4byte atkB7_presentdamagecalculation
	.4byte sub_80290BC
	.4byte atkB9_magnitudedamagecalculation
	.4byte sub_8029270
	.4byte sub_80293E8
	.4byte atkBC_maxattackhalvehp
	.4byte atkBD_copyfoestats
	.4byte atkBE_breakfree
	.4byte sub_802964C
	.4byte atkC0_recoverbasedonsunlight
	.4byte sub_8029784
	.4byte atkC2_selectnexttarget
	.4byte atkC3_setfutureattack
	.4byte atkC4_802B910
	.4byte atkC5_hidepreattack
	.4byte atkC6_unhidepostattack
	.4byte atkC7_setminimize
	.4byte sub_8029DAC
	.4byte atkC9_jumpifattackandspecialattackcannotfall
	.4byte atkCA_setforcedtarget
	.4byte atkCB_setcharge
	.4byte atkCC_callterrainattack
	.4byte atkCD_cureifburnedparalysedorpoisoned
	.4byte atkCE_settorment
	.4byte atkCF_jumpifnodamage
	.4byte atkD0_settaunt
	.4byte sub_802A170
	.4byte sub_802A218
	.4byte sub_802A4B0
	.4byte atkD4_802C408
	.4byte sub_802A5FC
	.4byte atkD6_doubledamagedealtifdamaged
	.4byte sub_802A6BC
	.4byte atkD8_setdamagetohealthdifference
	.4byte atkD9_scaledamagebyhealthratio
	.4byte atkDA_abilityswap
	.4byte atkDB_imprisoneffect
	.4byte atkDC_setgrudge
	.4byte atkDD_weightdamagecalculation
	.4byte atkDE_asistattackselect
	.4byte atkDF_setmagiccoat
	.4byte atkE0_setstealstatchange
	.4byte atkE1_802CBE4
	.4byte sub_802ADD8
	.4byte atkE3_jumpiffainted
	.4byte sub_802AEB0
	.4byte sub_802AF68
	.4byte atkE6_castform_transform
	.4byte atkE7_castform_switch
	.4byte atkE8_settypebasedhalvers
	.4byte sub_802B1C0
	.4byte atkEA_recycleitem
	.4byte atkEB_settypetoterrain
	.4byte sub_802B3E0
	.4byte sub_802B4B4
	.4byte sub_802B51C
	.4byte sub_802B5B8
	.4byte sub_802B960
	.4byte sub_802B9E0
	.4byte sub_802BA90
	.4byte atkF3_receive_new_pokemon_maybe
	.4byte sub_802BEF0
	.4byte sub_802BF20
	.4byte sub_802BF48
	.4byte sub_802BF54

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

	.align 2
	.global gUnknown_081FAD98
gUnknown_081FAD98: @ 81FAD98
	.4byte dp01t_00_1_getattr
	.4byte sub_802ECF0
	.4byte dp01t_02_1_setattr
	.4byte sub_802F7CC
	.4byte sub_802F840
	.4byte sub_802F8A8
	.4byte sub_802FAA0
	.4byte sub_802FBB4
	.4byte sub_802FCE0
	.4byte sub_802FDBC
	.4byte sub_802FE7C
	.4byte sub_802FF60
	.4byte sub_802FF80
	.4byte sub_802FFD0
	.4byte sub_803002C
	.4byte dp01t_0F_1_move_anim
	.4byte sub_80302F4
	.4byte dp01t_11_1_message_for_player_only
	.4byte sub_803037C
	.4byte nullsub_42
	.4byte sub_8030468
	.4byte sub_8030530
	.4byte sub_8030594
	.4byte sub_8030674
	.4byte sub_8030698
	.4byte sub_8030798
	.4byte sub_8030834
	.4byte sub_80308A8
	.4byte sub_8030910
	.4byte sub_803097C
	.4byte sub_8030988
	.4byte sub_8030A3C
	.4byte sub_8030A6C
	.4byte sub_8030A78
	.4byte sub_8030A8C
	.4byte sub_8030AA0
	.4byte sub_8030AB4
	.4byte sub_8030AC8
	.4byte sub_8030AE4
	.4byte sub_8030B1C
	.4byte sub_8030B34
	.4byte dp01t_29_1_blink
	.4byte sub_8030BCC
	.4byte sub_8030BD8
	.4byte sub_8030C1C
	.4byte sub_8030C4C
	.4byte dp01t_2E_1_battle_intro
	.4byte sub_8030CC0
	.4byte sub_8030FAC
	.4byte sub_80310A4
	.4byte sub_80310F0
	.4byte dp01t_33_1_enemy_move
	.4byte bx_exec_buffer_A_ch0_tbl1
	.4byte dp01t_35_1_link_standby_message_and_free_vram
	.4byte sub_8031238
	.4byte sub_80312A0
	.4byte nullsub_43

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
	obj_tiles 0x08d02410, 384, 0xd6eb

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

	.align 2
	.global gUnknown_081FAF4C
gUnknown_081FAF4C: @ 81FAF4C
	.4byte 0x02008000
	.4byte 0x0200a000
	.4byte 0x0200c000
	.4byte 0x0200e000

	.global gUnknown_081FAF5C
gUnknown_081FAF5C: @ 81FAF5C
	.incbin "baserom.gba", 0x001faf5c, 0xec

	.align 2
	.global gUnknown_081FB048
gUnknown_081FB048: @ 81FB048
	.4byte dp01t_00_4_getattr
	.4byte sub_803889C
	.4byte sub_80388A8
	.4byte sub_8039220
	.4byte sub_8039294
	.4byte sub_80393E4
	.4byte sub_80395B4
	.4byte sub_80396D0
	.4byte sub_80398A4
	.4byte sub_80398B0
	.4byte sub_803995C
	.4byte sub_8039A00
	.4byte sub_8039A0C
	.4byte sub_8039A18
	.4byte sub_8039A24
	.4byte sub_8039A30
	.4byte sub_8039CC8
	.4byte sub_8039D2C
	.4byte sub_8039D38
	.4byte sub_8039D44
	.4byte sub_8039D50
	.4byte sub_8039D5C
	.4byte sub_8039D68
	.4byte sub_8039D74
	.4byte sub_8039D80
	.4byte sub_8039E70
	.4byte sub_8039E7C
	.4byte sub_8039EF0
	.4byte sub_8039F58
	.4byte sub_8039F64
	.4byte sub_8039F70
	.4byte sub_8039F7C
	.4byte sub_8039F88
	.4byte sub_8039F94
	.4byte sub_8039FA0
	.4byte sub_8039FAC
	.4byte sub_8039FB8
	.4byte sub_8039FC4
	.4byte sub_8039FE0
	.4byte sub_803A018
	.4byte sub_803A030
	.4byte dp01t_29_4_blink
	.4byte sub_803A0C8
	.4byte sub_803A0D4
	.4byte sub_803A118
	.4byte sub_803A148
	.4byte dp01t_2E_4_battle_intro
	.4byte sub_803A1B8
	.4byte sub_803A3DC
	.4byte sub_803A520
	.4byte sub_803A56C
	.4byte sub_803A578
	.4byte bx_exec_buffer_A_ch0_tbl4
	.4byte sub_803A640
	.4byte sub_803A64C
	.4byte sub_803A658
	.4byte nullsub_48

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
	.4byte DaycareText_GetAlongVeryWell
	.4byte DaycareText_GetAlong
	.4byte DaycareText_DontLikeOther
	.4byte DaycareText_PlayOther

	.global gUnknown_08209AD4
gUnknown_08209AD4: @ 8209AD4
	.string "タマゴ$"

	.incbin "graphics/pokemon/egg/palette.gbapal"
	.incbin "graphics/pokemon/egg/egg_hatch.4bpp"
	.incbin "graphics/pokemon/egg/egg_crumble.4bpp"
	
	.space 2
	.incbin "baserom.gba", 0x0020A37A, 0x36

	.global gUnknown_0820A3B0
gUnknown_0820A3B0: @ 820A3B0
	obj_tiles 0x08209af8, 2048, 0x3039

	.global gUnknown_0820A3B8
gUnknown_0820A3B8: @ 820A3B8
	obj_tiles 0x0820a2f8, 128, 0x5ba0

	.global gUnknown_0820A3C0
gUnknown_0820A3C0: @ 820A3C0
	obj_pal 0x08209ad8, 0xd431

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
	obj_tiles 0x08d1f52c, 4096, 0xd6ff

	.global gUnknown_0820A484
gUnknown_0820A484: @ 820A484
	obj_tiles 0x08d1f7e0, 4096, 0xd701

	.global gUnknown_0820A48C
gUnknown_0820A48C: @ 820A48C
	obj_tiles 0x08d1f96c, 2048, 0xd6ff

	.global gUnknown_0820A494
gUnknown_0820A494: @ 820A494
	obj_tiles 0x08d1f96c, 2048, 0xd700

	.global gUnknown_0820A49C
gUnknown_0820A49C: @ 820A49C
	obj_tiles 0x08d1fb04, 2048, 0xd701

	.global gUnknown_0820A4A4
gUnknown_0820A4A4: @ 820A4A4
	obj_tiles 0x08d1fb04, 2048, 0xd702

	.global gUnknown_0820A4AC
gUnknown_0820A4AC: @ 820A4AC
	obj_tiles 0x08d1fc94, 4096, 0xd70b

	.global gUnknown_0820A4B4
gUnknown_0820A4B4: @ 820A4B4
	obj_tiles 0x08d0314c, 256, 0xd704
	obj_tiles 0x08d0314c, 288, 0xd705
	obj_tiles 0x08d0314c, 256, 0xd706
	obj_tiles 0x08d0314c, 288, 0xd707

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
	obj_tiles 0x08e6a758, 512, 0xd70c
	obj_tiles 0x08e6a758, 512, 0xd70d

	.global gUnknown_0820A764
gUnknown_0820A764: @ 820A764
	obj_pal 0x08d1212c, 0xd710
	obj_pal 0x08d1212c, 0xd711

	.global gUnknown_0820A774
gUnknown_0820A774: @ 820A774
	obj_pal 0x08d1214c, 0xd712
	obj_pal 0x08d1214c, 0xd713

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
gUnknown_0820A92C: @ 820A92C @ graphics
	obj_tiles gInterfaceGfx_PokeBall, 384, 0xd6d8 @ poke
	obj_tiles gInterfaceGfx_GreatBall, 384, 0xd6d9 @ great
	obj_tiles gInterfaceGfx_SafariBall, 384, 0xd6da @ safari
	obj_tiles gInterfaceGfx_UltraBall, 384, 0xd6db @ ultra
	obj_tiles gInterfaceGfx_MasterBall, 384, 0xd6dc @ master
	obj_tiles gInterfaceGfx_NetBall, 384, 0xd6dd @ net
	obj_tiles gInterfaceGfx_DiveBall, 384, 0xd6de @ dive
	obj_tiles gInterfaceGfx_NestBall, 384, 0xd6df @ nest
	obj_tiles gInterfaceGfx_RepeatBall, 384, 0xd6e0 @ repeat
	obj_tiles gInterfaceGfx_TimerBall, 384, 0xd6e1 @ timer
	obj_tiles gInterfaceGfx_LuxuryBall, 384, 0xd6e2 @ luxury
	obj_tiles gInterfaceGfx_PremierBall, 384, 0xd6e3 @ premier

	.global gUnknown_0820A98C @ palettes
gUnknown_0820A98C: @ 820A98C
	obj_pal gInterfacePal_PokeBall, 0xD6D8 @ poke
	obj_pal gInterfacePal_GreatBall, 0xD6D9 @ great
	obj_pal gInterfacePal_SafariBall, 0xD6DA @ safari
	obj_pal gInterfacePal_UltraBall, 0xD6DB @ ultra
	obj_pal gInterfacePal_MasterBall, 0xD6DC @ master
	obj_pal gInterfacePal_NetBall, 0xD6DD @ net
	obj_pal gInterfacePal_DiveBall, 0xD6DE @ dive
	obj_pal gInterfacePal_NestBall, 0xD6DF @ nest
	obj_pal gInterfacePal_RepeatBall, 0xD6E0 @ repeat
	obj_pal gInterfacePal_TimerBall, 0xD6E1 @ timer
	obj_pal gInterfacePal_LuxuryBall, 0xD6E2 @ luxury
	obj_pal gInterfacePal_PremierBall, 0xD6E3 @ premier
	.incbin "baserom.gba", 0x0020A9EC, 0xC8

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
	obj_tiles 0x0201d000, 256, 0x00c8
	obj_tiles 0x0201d100, 256, 0x00c9
	obj_tiles 0x0201d200, 256, 0x00ca
	obj_tiles 0x0201d300, 256, 0x00cb
	obj_tiles 0x0201d400, 256, 0x00cc
	obj_tiles 0x0201d500, 256, 0x00cd
	obj_tiles 0x0201d600, 256, 0x00ce
	obj_tiles 0x0201d700, 256, 0x00cf
	obj_tiles 0x0201d800, 256, 0x00d0
	obj_tiles 0x0201d900, 256, 0x00d1
	obj_tiles 0x0201da00, 256, 0x00d2
	obj_tiles 0x0201db00, 256, 0x00d3
	obj_tiles 0x0201dc00, 256, 0x00d4

	.global gUnknown_0820C0E4
gUnknown_0820C0E4: @ 820C0E4
	obj_pal 0x0820c03c, 0x133d

	.global gUnknown_0820C0EC
gUnknown_0820C0EC: @ 820C0EC
	.incbin "baserom.gba", 0x0020c0ec, 0x38

	.global gUnknown_0820C124
gUnknown_0820C124: @ 820C124
	obj_tiles 0x08ea1dec, 2048, 0x012c

	.global gUnknown_0820C12C
gUnknown_0820C12C: @ 820C12C
	obj_pal 0x08ea0328, 0x0929

	.global gUnknown_0820C134
gUnknown_0820C134: @ 820C134
	.incbin "baserom.gba", 0x0020c134, 0x18

	.align 2
	.global gUnknown_0820C14C
gUnknown_0820C14C: @ 820C14C
	.4byte TradeText_Cancel
	.4byte TradeText_ChoosePoke
	.4byte TradeText_Summary1
	.4byte TradeText_Trade1
	.4byte TradeText_CancelTradePrompt
	.4byte TradeText_PressBToExit

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

	.align 2
	.global gUnknown_0820C2F0
gUnknown_0820C2F0: @ 820C2F0
	.4byte TradeText_LinkStandby
	.4byte TradeText_TradeCancelled
	.4byte TradeText_OnlyPoke
	.4byte TradeText_NonTradablePoke
	.4byte TradeText_WaitingForFriend
	.4byte TradeText_WantToTrade

	.global gUnknown_0820C308
gUnknown_0820C308: @ 820C308
	.incbin "baserom.gba", 0x0020c308, 0x18

	.align 2
	.global gUnknown_0820C320
gUnknown_0820C320: @ 820C320
	.4byte TradeText_Summary2
	.4byte sub_804A9F4 @unknown
	.4byte TradeText_Trade2
	.4byte sub_804AA00

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
OtherText_MaleSymbol3:
	.string "♂$"

	.global gUnknown_0820C33F
gUnknown_0820C33F: @ 820C33F
OtherText_FemaleSymbol3:
	.string "♀$"

	.global gUnknown_0820C341
gUnknown_0820C341: @ 820C341
	.string "$$"

	.align 2
	.4byte gTileBuffer

@ Unused debug strings?
@ Not labeling these yet
	.string "かいめの そうしん$", 13
	.string "かいめの じゅしん$", 13
	.string "ポケモンアイコンセット$", 13
	.string "OBJテキストセット$", 13
	.string "セルセット$", 13
	.string "OBJテキストADD$", 13
	.string "システムメッセージADD$", 13
	.string "はいけいセット$", 13

 @ Shedinja's Japanese name
 @ sub_8048D44 compares a pokemon name with this string
	.global gUnknown_0820C3B0
gUnknown_0820C3B0: @ 820C3B0
	.string "ヌケニン$"

	.string "こうかんせいりつ     $" @ trade completed
	.string "だめだたらしいよ     $" @ it's no good (trade failed maybe?)

	.global gUnknown_0820C3D1
gUnknown_0820C3D1: @ 820C3D1
	.incbin "baserom.gba", 0x0020c3d1, 0x7
	.incbin "graphics/interface/ball_open.gbapal"
	.incbin "baserom.gba", 0x0020c3f8, 0x600

	.global gUnknown_0820C9F8
gUnknown_0820C9F8: @ 820C9F8
	.incbin "baserom.gba", 0x0020c9f8, 0x20
	.incbin "graphics/interface/gba.gbapal"
	.incbin "graphics/interface/trade_shadow.gbapal"
	.incbin "baserom.gba", 0x0020ca58, 0x20 @ blank
	.incbin "baserom.gba", 0x0020ca78, 0x20

	.global gUnknown_0820CA98
gUnknown_0820CA98: @ 820CA98
	.incbin "graphics/interface/gba.4bpp"
	.incbin "graphics/interface/trade_shadow.4bpp"

	.global gUnknown_0820DD98
gUnknown_0820DD98: @ 820DD98
	.incbin "baserom.gba", 0x0020dd98, 0x1a00 @ unused?

	.global gUnknown_0820F798
gUnknown_0820F798: @ 820F798
	.incbin "baserom.gba", 0x0020f798, 0x1000 

	.global gUnknown_08210798
gUnknown_08210798: @ 8210798
	.incbin "baserom.gba", 0x00210798, 0x1000 @ debug?

	.global gUnknown_08211798
gUnknown_08211798: @ 8211798
	.incbin "baserom.gba", 0x00211798, 0x800

	.global gUnknown_08211F98
gUnknown_08211F98: @ 8211F98
	.incbin "baserom.gba", 0x00211f98, 0x17a0

	.global gUnknown_08213738
gUnknown_08213738: @ 8213738
	.incbin "baserom.gba", 0x00213738, 0x2040 @ copy of gba

	.global gUnknown_08215778
gUnknown_08215778: @ 8215778
	.incbin "baserom.gba", 0x00215778, 0x1d4

	.global gUnknown_0821594C
gUnknown_0821594C: @ 821594C
	obj_tiles 0x0820c3f8, 1536, 0x15b5

	.global gUnknown_08215954
gUnknown_08215954: @ 8215954
	obj_pal 0x0820c3d8, 0x15b6

	.global gUnknown_0821595C
gUnknown_0821595C: @ 821595C
	.incbin "baserom.gba", 0x0021595c, 0x48

	.global gUnknown_082159A4
gUnknown_082159A4: @ 82159A4
	obj_tiles 0x08212138, 512, 0x15ae

	.global gUnknown_082159AC
gUnknown_082159AC: @ 82159AC
	obj_pal 0x08212118, 0x15af

	.global gUnknown_082159B4
gUnknown_082159B4: @ 82159B4
	obj_pal 0x082120b8, 0x15b3

	.global gUnknown_082159BC
gUnknown_082159BC: @ 82159BC
	.incbin "baserom.gba", 0x002159bc, 0x38

	.global gUnknown_082159F4
gUnknown_082159F4: @ 82159F4
	obj_tiles 0x08212338, 768, 0x15b0

	.global gUnknown_082159FC
gUnknown_082159FC: @ 82159FC
	.incbin "baserom.gba", 0x002159fc, 0x2c

	.global gUnknown_08215A28
gUnknown_08215A28: @ 8215A28
	obj_tiles 0x08212538, 256, 0x15b2

	.global gUnknown_08215A30
gUnknown_08215A30: @ 8215A30
	.incbin "baserom.gba", 0x00215a30, 0x48

	.global gUnknown_08215A78
gUnknown_08215A78: @ 8215A78
	obj_tiles 0x08212738, 4096, 0x15b4

	.global gUnknown_08215A80
gUnknown_08215A80: @ 8215A80
	.incbin "baserom.gba", 0x00215a80, 0x18

	.global gUnknown_08215A98
gUnknown_08215A98: @ 8215A98
	.incbin "baserom.gba", 0x00215a98, 0x18
Unknown_08215AB0:
	.incbin "baserom.gba", 0x00215ab0, 0x10

	.global gUnknown_08215AC0
gUnknown_08215AC0: @ 8215AC0
	.4byte Unknown_08215AB0

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
	.byte 0xFB
	.string "$"
	.incbin "baserom.gba", 0x0021624b, 0x28
UnknownText_2Pok:
	.string "2Pok$"
UnknownText_3Pok:
	.string "3Pok$"
UnknownText_4Pok:
	.string "4Pok$"
	.align 2

	.align 2
	.global gUnknown_08216284
gUnknown_08216284: @ 8216284 berry blender helpers?
	.4byte UnknownText_2Pok
	.4byte UnknownText_3Pok
	.4byte UnknownText_4Pok
OtherText_1P:
	.string "1P$"
	.align 2
OtherText_2P:
	.string "2P$"
	.align 2
OtherText_3P:
	.string "3P$"
	.align 2
OtherText_4P:
	.string "4P$"
	.align 2
UnknownText_Mister:
	.string "MISTER$"
UnknownText_Laddie:
	.string "LADDIE$"
UnknownText_Lassie:
	.string "LASSIE$"
	.align 2

	.align 2
	.global gUnknown_082162B8
gUnknown_082162B8: @ 82162B8
	.4byte UnknownText_Mister
	.4byte UnknownText_Laddie
	.4byte UnknownText_Lassie

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
	obj_tiles 0x08e91618, 2048, 0xb5d1

	.global gUnknown_082163E4
gUnknown_082163E4: @ 82163E4
	obj_pal 0x08e920d8, 0xb5d2

	.global gUnknown_082163EC
gUnknown_082163EC: @ 82163EC
	obj_pal 0x08e920f8, 0x3018

	.global gUnknown_082163F4
gUnknown_082163F4: @ 82163F4
	.incbin "baserom.gba", 0x002163f4, 0x60

	.global gUnknown_08216454
gUnknown_08216454: @ 8216454
	obj_tiles 0x08e90618, 512, 0xbef8

	.global gUnknown_0821645C
gUnknown_0821645C: @ 821645C
	.incbin "baserom.gba", 0x0021645c, 0x98

	.global gUnknown_082164F4
gUnknown_082164F4: @ 82164F4
	obj_tiles 0x08e90818, 224, 0x5ba0

	.global gUnknown_082164FC
gUnknown_082164FC: @ 82164FC
	.incbin "baserom.gba", 0x002164fc, 0x44

	.global gUnknown_08216540
gUnknown_08216540: @ 8216540
	obj_tiles 0x08e90a18, 1536, 0x3039

	.global gUnknown_08216548
gUnknown_08216548: @ 8216548
	.incbin "baserom.gba", 0x00216548, 0x2c

	.global gUnknown_08216574
gUnknown_08216574: @ 8216574
	obj_tiles 0x08e91018, 1024, 0x303a

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
OtherText_BPM:
	.string "BPM$"
OtherText_Dash:
	.string "-$"

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

	.align 2
	.global gUnknown_082166A0
gUnknown_082166A0: @ 82166A0
	.4byte sub_8055C68
	.4byte sub_8055C88
	.4byte sub_8055C8C

	.align 2
	.global gUnknown_082166AC
gUnknown_082166AC: @ 82166AC
	.4byte sub_8055CAC
	.4byte sub_8055CB0
	.4byte sub_8055CB0
	.4byte sub_8055CB0
	.4byte sub_8055CB0
	.4byte sub_8055CAC
	.4byte sub_8055CAC
	.4byte sub_8055D18
	.4byte sub_8055D18
	.4byte sub_8055D18
	.4byte sub_8055D18

	.align 2
	.global gUnknown_082166D8
gUnknown_082166D8: @ 82166D8
	.4byte sub_8055D30
	.4byte sub_8055D38

@ 82166E0
	.include "data/tilesets/graphics.s"

@ 8259C1C
	.include "data/tilesets/metatiles.s"

@ 8286CF4
AbandonedShip_CaptainsOffice_Tileset:: @ 8286CF4
AbandonedShip_Corridors_1F_Tileset:: @ 8286CF4
AbandonedShip_Corridors_B1F_Tileset:: @ 8286CF4
AbandonedShip_Deck_Tileset:: @ 8286CF4
AbandonedShip_HiddenFloorCorridors_Tileset:: @ 8286CF4
AbandonedShip_HiddenFloorRooms_Tileset:: @ 8286CF4
AbandonedShip_Room_B1F_Tileset:: @ 8286CF4
AbandonedShip_Rooms2_1F_Tileset:: @ 8286CF4
AbandonedShip_Rooms2_B1F_Tileset:: @ 8286CF4
AbandonedShip_Rooms_1F_Tileset:: @ 8286CF4
AbandonedShip_Rooms_B1F_Tileset:: @ 8286CF4
AbandonedShip_Underwater1_Tileset:: @ 8286CF4
AbandonedShip_Underwater2_Tileset:: @ 8286CF4
AncientTomb_Tileset:: @ 8286CF4
AquaHideout_1F_Tileset:: @ 8286CF4
AquaHideout_B1F_Tileset:: @ 8286CF4
AquaHideout_B2F_Tileset:: @ 8286CF4
BattleTower_Outside_Tileset:: @ 8286CF4
CaveOfOrigin_1F_Tileset:: @ 8286CF4
CaveOfOrigin_B1F_Tileset:: @ 8286CF4
CaveOfOrigin_B2F_Tileset:: @ 8286CF4
CaveOfOrigin_B3F_Tileset:: @ 8286CF4
CaveOfOrigin_B4F_Tileset:: @ 8286CF4
CaveOfOrigin_Entrance_Tileset:: @ 8286CF4
DesertRuins_Tileset:: @ 8286CF4
DewfordTown_Tileset:: @ 8286CF4
EverGrandeCity_Tileset:: @ 8286CF4
FallarborTown_Tileset:: @ 8286CF4
FieryPath_Tileset:: @ 8286CF4
FortreeCity_Tileset:: @ 8286CF4
GraniteCave_1F_Tileset:: @ 8286CF4
GraniteCave_B1F_Tileset:: @ 8286CF4
GraniteCave_B2F_Tileset:: @ 8286CF4
GraniteCave_StevensRoom_Tileset:: @ 8286CF4
InsideOfTruck_Tileset:: @ 8286CF4
IslandCave_Tileset:: @ 8286CF4
JaggedPass_Tileset:: @ 8286CF4
LavaridgeTown_Tileset:: @ 8286CF4
LilycoveCity_EmptyMap_Tileset:: @ 8286CF4
LilycoveCity_Tileset:: @ 8286CF4
LinkContestRoom1_Tileset:: @ 8286CF4
LinkContestRoom2_Tileset:: @ 8286CF4
LinkContestRoom3_Tileset:: @ 8286CF4
LinkContestRoom4_Tileset:: @ 8286CF4
LinkContestRoom5_Tileset:: @ 8286CF4
LinkContestRoom6_Tileset:: @ 8286CF4
LittlerootTown_Tileset:: @ 8286CF4
MagmaHideout_1F_Tileset:: @ 8286CF4
MagmaHideout_B1F_Tileset:: @ 8286CF4
MagmaHideout_B2F_Tileset:: @ 8286CF4
MauvilleCity_BikeShop_Tileset:: @ 8286CF4
MauvilleCity_Tileset:: @ 8286CF4
MeteorFalls_1F_1R_Tileset:: @ 8286CF4
MeteorFalls_1F_2R_Tileset:: @ 8286CF4
MeteorFalls_B1F_1R_Tileset:: @ 8286CF4
MeteorFalls_B1F_2R_Tileset:: @ 8286CF4
MossdeepCity_SpaceCenter_1F_Tileset:: @ 8286CF4
MossdeepCity_SpaceCenter_2F_Tileset:: @ 8286CF4
MossdeepCity_Tileset:: @ 8286CF4
MtChimney_Tileset:: @ 8286CF4
MtPyre_1F_Tileset:: @ 8286CF4
MtPyre_2F_Tileset:: @ 8286CF4
MtPyre_3F_Tileset:: @ 8286CF4
MtPyre_4F_Tileset:: @ 8286CF4
MtPyre_5F_Tileset:: @ 8286CF4
MtPyre_6F_Tileset:: @ 8286CF4
MtPyre_Exterior_Tileset:: @ 8286CF4
MtPyre_Summit_Tileset:: @ 8286CF4
NewMauville_Entrance_Tileset:: @ 8286CF4
NewMauville_Inside_Tileset:: @ 8286CF4
OldaleTown_Tileset:: @ 8286CF4
PacifidlogTown_Tileset:: @ 8286CF4
PetalburgCity_Tileset:: @ 8286CF4
PetalburgWoods_Tileset:: @ 8286CF4
Route101_Tileset:: @ 8286CF4
Route102_Tileset:: @ 8286CF4
Route103_Tileset:: @ 8286CF4
Route104_Prototype_Tileset:: @ 8286CF4
Route104_Tileset:: @ 8286CF4
Route105_Tileset:: @ 8286CF4
Route106_Tileset:: @ 8286CF4
Route107_Tileset:: @ 8286CF4
Route108_Tileset:: @ 8286CF4
Route109_Tileset:: @ 8286CF4
Route110_Tileset:: @ 8286CF4
Route111_Tileset:: @ 8286CF4
Route112_CableCarStation_Tileset:: @ 8286CF4
Route112_Tileset:: @ 8286CF4
Route113_Tileset:: @ 8286CF4
Route114_FossilManiacsTunnel_Tileset:: @ 8286CF4
Route114_Tileset:: @ 8286CF4
Route115_Tileset:: @ 8286CF4
Route116_Tileset:: @ 8286CF4
Route117_Tileset:: @ 8286CF4
Route118_Tileset:: @ 8286CF4
Route119_Tileset:: @ 8286CF4
Route120_Tileset:: @ 8286CF4
Route121_Tileset:: @ 8286CF4
Route122_Tileset:: @ 8286CF4
Route123_Tileset:: @ 8286CF4
Route124_Tileset:: @ 8286CF4
Route125_Tileset:: @ 8286CF4
Route126_Tileset:: @ 8286CF4
Route127_Tileset:: @ 8286CF4
Route128_Tileset:: @ 8286CF4
Route129_Tileset:: @ 8286CF4
Route130_Tileset:: @ 8286CF4
Route131_Tileset:: @ 8286CF4
Route132_Tileset:: @ 8286CF4
Route133_Tileset:: @ 8286CF4
Route134_Tileset:: @ 8286CF4
RustboroCity_DevonCorp_1F_Tileset:: @ 8286CF4
RustboroCity_DevonCorp_2F_Tileset:: @ 8286CF4
RustboroCity_DevonCorp_3F_Tileset:: @ 8286CF4
RustboroCity_Tileset:: @ 8286CF4
RusturfTunnel_Tileset:: @ 8286CF4
SSTidalCorridor_Tileset:: @ 8286CF4
SSTidalLowerDeck_Tileset:: @ 8286CF4
SSTidalRooms_Tileset:: @ 8286CF4
SafariZone_Northeast_Tileset:: @ 8286CF4
SafariZone_Northwest_Tileset:: @ 8286CF4
SafariZone_Southeast_Tileset:: @ 8286CF4
SafariZone_Southwest_Tileset:: @ 8286CF4
ScorchedSlab_Tileset:: @ 8286CF4
SeafloorCavern_Entrance_Tileset:: @ 8286CF4
SeafloorCavern_Room1_Tileset:: @ 8286CF4
SeafloorCavern_Room2_Tileset:: @ 8286CF4
SeafloorCavern_Room3_Tileset:: @ 8286CF4
SeafloorCavern_Room4_Tileset:: @ 8286CF4
SeafloorCavern_Room5_Tileset:: @ 8286CF4
SeafloorCavern_Room6_Tileset:: @ 8286CF4
SeafloorCavern_Room7_Tileset:: @ 8286CF4
SeafloorCavern_Room8_Tileset:: @ 8286CF4
SeafloorCavern_Room9_Tileset:: @ 8286CF4
SealedChamber_InnerRoom_Tileset:: @ 8286CF4
SealedChamber_OuterRoom_Tileset:: @ 8286CF4
ShoalCave_HighTideEntranceRoom_Tileset:: @ 8286CF4
ShoalCave_HighTideInnerRoom_Tileset:: @ 8286CF4
ShoalCave_LowTideEntranceRoom_Tileset:: @ 8286CF4
ShoalCave_LowTideIceRoom_Tileset:: @ 8286CF4
ShoalCave_LowTideInnerRoom_Tileset:: @ 8286CF4
ShoalCave_LowTideLowerRoom_Tileset:: @ 8286CF4
ShoalCave_LowTideStairsRoom_Tileset:: @ 8286CF4
SkyPillar_1F_Tileset:: @ 8286CF4
SkyPillar_2F_Tileset:: @ 8286CF4
SkyPillar_3F_Tileset:: @ 8286CF4
SkyPillar_4F_Tileset:: @ 8286CF4
SkyPillar_5F_Tileset:: @ 8286CF4
SkyPillar_Entrance_Tileset:: @ 8286CF4
SkyPillar_Outside_Tileset:: @ 8286CF4
SkyPillar_Top_Tileset:: @ 8286CF4
SlateportCity_Harbor_Tileset:: @ 8286CF4
SlateportCity_SternsShipyard_1F_Tileset:: @ 8286CF4
SlateportCity_SternsShipyard_2F_Tileset:: @ 8286CF4
SlateportCity_Tileset:: @ 8286CF4
SootopolisCity_Tileset:: @ 8286CF4
SouthernIsland_Exterior_Tileset:: @ 8286CF4
SouthernIsland_Interior_Tileset:: @ 8286CF4
Underwater1_Tileset:: @ 8286CF4
Underwater2_Tileset:: @ 8286CF4
Underwater3_Tileset:: @ 8286CF4
Underwater4_Tileset:: @ 8286CF4
Underwater_Route134_Tileset:: @ 8286CF4
Underwater_SeafloorCavern_Tileset:: @ 8286CF4
Underwater_SealedChamber_Tileset:: @ 8286CF4
Underwater_SootopolisCity_Tileset:: @ 8286CF4
VerdanturfTown_Tileset:: @ 8286CF4
VictoryRoad_1F_Tileset:: @ 8286CF4
VictoryRoad_B1F_Tileset:: @ 8286CF4
VictoryRoad_B2F_Tileset:: @ 8286CF4
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.4byte gTilesetTiles_General
	.4byte gTilesetPalettes_General
	.4byte gMetatiles_General
	.4byte gMetatileAttributes_General
	.4byte TilesetCB_General

LittlerootTown_Tileset2:: @ 8286D0C
OldaleTown_Tileset2:: @ 8286D0C
PetalburgCity_Tileset2:: @ 8286D0C
Route101_Tileset2:: @ 8286D0C
Route102_Tileset2:: @ 8286D0C
Route103_Tileset2:: @ 8286D0C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Petalburg
	.4byte gTilesetPalettes_Petalburg
	.4byte gMetatiles_Petalburg
	.4byte gMetatileAttributes_Petalburg
	.4byte TilesetCB_Petalburg

PetalburgWoods_Tileset2:: @ 8286D24
Route104_Prototype_Tileset2:: @ 8286D24
Route104_Tileset2:: @ 8286D24
Route116_Tileset2:: @ 8286D24
RustboroCity_Tileset2:: @ 8286D24
SouthernIsland_Exterior_Tileset2:: @ 8286D24
SouthernIsland_Interior_Tileset2:: @ 8286D24
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Rustboro
	.4byte gTilesetPalettes_Rustboro
	.4byte gMetatiles_Rustboro
	.4byte gMetatileAttributes_Rustboro
	.4byte TilesetCB_Rustboro

BattleTower_Outside_Tileset2:: @ 8286D3C
DewfordTown_Tileset2:: @ 8286D3C
Route105_Tileset2:: @ 8286D3C
Route106_Tileset2:: @ 8286D3C
Route107_Tileset2:: @ 8286D3C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Dewford
	.4byte gTilesetPalettes_Dewford
	.4byte gMetatiles_Dewford
	.4byte gMetatileAttributes_Dewford
	.4byte TilesetCB_Dewford

Route108_Tileset2:: @ 8286D54
Route109_Tileset2:: @ 8286D54
SlateportCity_Tileset2:: @ 8286D54
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Slateport
	.4byte gTilesetPalettes_Slateport
	.4byte gMetatiles_Slateport
	.4byte gMetatileAttributes_Slateport
	.4byte TilesetCB_Slateport

MauvilleCity_Tileset2:: @ 8286D6C
Route110_Tileset2:: @ 8286D6C
Route111_Tileset2:: @ 8286D6C
Route117_Tileset2:: @ 8286D6C
Route118_Tileset2:: @ 8286D6C
VerdanturfTown_Tileset2:: @ 8286D6C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Mauville
	.4byte gTilesetPalettes_Mauville
	.4byte gMetatiles_Mauville
	.4byte gMetatileAttributes_Mauville
	.4byte TilesetCB_Mauville

FieryPath_Tileset2:: @ 8286D84
JaggedPass_Tileset2:: @ 8286D84
LavaridgeTown_Tileset2:: @ 8286D84
MtChimney_Tileset2:: @ 8286D84
Route112_Tileset2:: @ 8286D84
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Lavaridge
	.4byte gTilesetPalettes_Lavaridge
	.4byte gMetatiles_Lavaridge
	.4byte gMetatileAttributes_Lavaridge
	.4byte TilesetCB_Lavaridge

FallarborTown_Tileset2:: @ 8286D9C
Route113_Tileset2:: @ 8286D9C
Route114_FossilManiacsTunnel_Tileset2:: @ 8286D9C
Route114_Tileset2:: @ 8286D9C
Route115_Tileset2:: @ 8286D9C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Fallarbor
	.4byte gTilesetPalettes_Fallarbor
	.4byte gMetatiles_Fallarbor
	.4byte gMetatileAttributes_Fallarbor
	.4byte TilesetCB_Fallarbor

FortreeCity_Tileset2:: @ 8286DB4
Route119_Tileset2:: @ 8286DB4
Route120_Tileset2:: @ 8286DB4
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Fortree
	.4byte gTilesetPalettes_Fortree
	.4byte gMetatiles_Fortree
	.4byte gMetatileAttributes_Fortree
	.4byte TilesetCB_Fortree

LilycoveCity_Tileset2:: @ 8286DCC
Route121_Tileset2:: @ 8286DCC
Route122_Tileset2:: @ 8286DCC
Route123_Tileset2:: @ 8286DCC
SafariZone_Northeast_Tileset2:: @ 8286DCC
SafariZone_Northwest_Tileset2:: @ 8286DCC
SafariZone_Southeast_Tileset2:: @ 8286DCC
SafariZone_Southwest_Tileset2:: @ 8286DCC
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Lilycove
	.4byte gTilesetPalettes_Lilycove
	.4byte gMetatiles_Lilycove
	.4byte gMetatileAttributes_Lilycove
	.4byte TilesetCB_Lilycove

MossdeepCity_Tileset2:: @ 8286DE4
Route124_Tileset2:: @ 8286DE4
Route125_Tileset2:: @ 8286DE4
Route126_Tileset2:: @ 8286DE4
Route127_Tileset2:: @ 8286DE4
Route128_Tileset2:: @ 8286DE4
Route129_Tileset2:: @ 8286DE4
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Mossdeep
	.4byte gTilesetPalettes_Mossdeep
	.4byte gMetatiles_Mossdeep
	.4byte gMetatileAttributes_Mossdeep
	.4byte TilesetCB_Mossdeep

EverGrandeCity_Tileset2:: @ 8286DFC
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_EverGrande
	.4byte gTilesetPalettes_EverGrande
	.4byte gMetatiles_EverGrande
	.4byte gMetatileAttributes_EverGrande
	.4byte TilesetCB_EverGrande

PacifidlogTown_Tileset2:: @ 8286E14
Route131_Tileset2:: @ 8286E14
Route132_Tileset2:: @ 8286E14
Route133_Tileset2:: @ 8286E14
Route134_Tileset2:: @ 8286E14
SeafloorCavern_Room6_Tileset2:: @ 8286E14
SeafloorCavern_Room7_Tileset2:: @ 8286E14
SkyPillar_1F_Tileset2:: @ 8286E14
SkyPillar_2F_Tileset2:: @ 8286E14
SkyPillar_3F_Tileset2:: @ 8286E14
SkyPillar_4F_Tileset2:: @ 8286E14
SkyPillar_5F_Tileset2:: @ 8286E14
SkyPillar_Outside_Tileset2:: @ 8286E14
SkyPillar_Top_Tileset2:: @ 8286E14
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Pacifidlog
	.4byte gTilesetPalettes_Pacifidlog
	.4byte gMetatiles_Pacifidlog
	.4byte gMetatileAttributes_Pacifidlog
	.4byte TilesetCB_Pacifidlog

SootopolisCity_Tileset2:: @ 8286E2C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Sootopolis
	.4byte gTilesetPalettes_Sootopolis
	.4byte gMetatiles_Sootopolis
	.4byte gMetatileAttributes_Sootopolis
	.4byte TilesetCB_Sootopolis

BattleTower_BattleRoom_Tileset:: @ 8286E44
BattleTower_Corridor_Tileset:: @ 8286E44
BattleTower_Elevator_Tileset:: @ 8286E44
BattleTower_Lobby_Tileset:: @ 8286E44
DewfordTown_Gym_Tileset:: @ 8286E44
DewfordTown_Hall_Tileset:: @ 8286E44
DewfordTown_House1_Tileset:: @ 8286E44
DewfordTown_House2_Tileset:: @ 8286E44
DoubleBattleColosseum_Tileset:: @ 8286E44
EverGrandeCity_ChampionsRoom_Tileset:: @ 8286E44
EverGrandeCity_Corridor1_Tileset:: @ 8286E44
EverGrandeCity_Corridor4_Tileset:: @ 8286E44
EverGrandeCity_DrakesRoom_Tileset:: @ 8286E44
EverGrandeCity_GlaciasRoom_Tileset:: @ 8286E44
EverGrandeCity_HallOfFame_Tileset:: @ 8286E44
EverGrandeCity_PhoebesRoom_Tileset:: @ 8286E44
EverGrandeCity_PokemonLeague_Tileset:: @ 8286E44
EverGrandeCity_SidneysRoom_Tileset:: @ 8286E44
FallarborTown_ContestHall_Tileset:: @ 8286E44
FallarborTown_ContestLobby_Tileset:: @ 8286E44
FortreeCity_DecorationShop_Tileset:: @ 8286E44
FortreeCity_Gym_Tileset:: @ 8286E44
FortreeCity_House1_Tileset:: @ 8286E44
FortreeCity_House2_Tileset:: @ 8286E44
LavaridgeTown_Gym_1F_Tileset:: @ 8286E44
LavaridgeTown_Gym_B1F_Tileset:: @ 8286E44
LavaridgeTown_HerbShop_Tileset:: @ 8286E44
LavaridgeTown_PokemonCenter_1F_Tileset:: @ 8286E44
LilycoveCity_ContestHall_Tileset:: @ 8286E44
LilycoveCity_ContestLobby_Tileset:: @ 8286E44
LilycoveCity_CoveLilyMotel_1F_Tileset:: @ 8286E44
LilycoveCity_CoveLilyMotel_2F_Tileset:: @ 8286E44
LilycoveCity_DepartmentStoreElevator_Tileset:: @ 8286E44
LilycoveCity_DepartmentStoreRooftop_Tileset:: @ 8286E44
LilycoveCity_DepartmentStore_1F_Tileset:: @ 8286E44
LilycoveCity_DepartmentStore_2F_Tileset:: @ 8286E44
LilycoveCity_DepartmentStore_3F_Tileset:: @ 8286E44
LilycoveCity_DepartmentStore_4F_Tileset:: @ 8286E44
LilycoveCity_DepartmentStore_5F_Tileset:: @ 8286E44
LilycoveCity_House2_Tileset:: @ 8286E44
LilycoveCity_LilycoveMuseum_1F_Tileset:: @ 8286E44
LilycoveCity_LilycoveMuseum_2F_Tileset:: @ 8286E44
LilycoveCity_PokemonTrainerFanClub_Tileset:: @ 8286E44
LittlerootTown_BrendansHouse_1F_Tileset:: @ 8286E44
LittlerootTown_BrendansHouse_2F_Tileset:: @ 8286E44
LittlerootTown_MaysHouse_1F_Tileset:: @ 8286E44
LittlerootTown_MaysHouse_2F_Tileset:: @ 8286E44
LittlerootTown_ProfessorBirchsLab_Tileset:: @ 8286E44
MauvilleCity_GameCorner_Tileset:: @ 8286E44
MauvilleCity_Gym_Tileset:: @ 8286E44
MossdeepCity_GameCorner_1F_Tileset:: @ 8286E44
MossdeepCity_GameCorner_B1F_Tileset:: @ 8286E44
MossdeepCity_Gym_Tileset:: @ 8286E44
MossdeepCity_StevensHouse_Tileset:: @ 8286E44
OldaleTown_House1_Tileset:: @ 8286E44
OldaleTown_House2_Tileset:: @ 8286E44
OldaleTown_Mart_Tileset:: @ 8286E44
OldaleTown_PokemonCenter_1F_Tileset:: @ 8286E44
OldaleTown_PokemonCenter_2F_Tileset:: @ 8286E44
PacifidlogTown_House1_Tileset:: @ 8286E44
PacifidlogTown_House2_Tileset:: @ 8286E44
PetalburgCity_Gym_Tileset:: @ 8286E44
PetalburgCity_House2_Tileset:: @ 8286E44
RecordCorner_Tileset:: @ 8286E44
Route104_MrBrineysHouse_Tileset:: @ 8286E44
Route104_PrettyPetalFlowerShop_Tileset:: @ 8286E44
Route109_SeashoreHouse_Tileset:: @ 8286E44
Route110_SeasideCyclingRoadSouthEntrance_Tileset:: @ 8286E44
Route110_TrickHouseCorridor_Tileset:: @ 8286E44
Route110_TrickHouseEnd_Tileset:: @ 8286E44
Route110_TrickHouseEntrance_Tileset:: @ 8286E44
Route110_TrickHousePuzzle1_Tileset:: @ 8286E44
Route110_TrickHousePuzzle2_Tileset:: @ 8286E44
Route110_TrickHousePuzzle3_Tileset:: @ 8286E44
Route110_TrickHousePuzzle4_Tileset:: @ 8286E44
Route110_TrickHousePuzzle5_Tileset:: @ 8286E44
Route110_TrickHousePuzzle6_Tileset:: @ 8286E44
Route110_TrickHousePuzzle7_Tileset:: @ 8286E44
Route110_TrickHousePuzzle8_Tileset:: @ 8286E44
Route114_FossilManiacsHouse_Tileset:: @ 8286E44
Route114_LanettesHouse_Tileset:: @ 8286E44
Route116_TunnelersRestHouse_Tileset:: @ 8286E44
Route117_PokemonDayCare_Tileset:: @ 8286E44
Route119_WeatherInstitute_1F_Tileset:: @ 8286E44
Route119_WeatherInstitute_2F_Tileset:: @ 8286E44
Route121_SafariZoneEntrance_Tileset:: @ 8286E44
Route124_DivingTreasureHuntersHouse_Tileset:: @ 8286E44
RustboroCity_CuttersHouse_Tileset:: @ 8286E44
RustboroCity_Flat1_1F_Tileset:: @ 8286E44
RustboroCity_Flat1_2F_Tileset:: @ 8286E44
RustboroCity_Flat2_1F_Tileset:: @ 8286E44
RustboroCity_Flat2_2F_Tileset:: @ 8286E44
RustboroCity_Flat2_3F_Tileset:: @ 8286E44
RustboroCity_Gym_Tileset:: @ 8286E44
RustboroCity_House1_Tileset:: @ 8286E44
RustboroCity_House2_Tileset:: @ 8286E44
RustboroCity_PokemonSchool_Tileset:: @ 8286E44
SafariZone_RestHouse_Tileset:: @ 8286E44
SingleBattleColosseum_Tileset:: @ 8286E44
SlateportCity_OceanicMuseum_1F_Tileset:: @ 8286E44
SlateportCity_OceanicMuseum_2F_Tileset:: @ 8286E44
SlateportCity_PokemonFanClub_Tileset:: @ 8286E44
SootopolisCity_Gym_1F_Tileset:: @ 8286E44
SootopolisCity_Gym_B1F_Tileset:: @ 8286E44
SootopolisCity_House1_Tileset:: @ 8286E44
SootopolisCity_House2_Tileset:: @ 8286E44
SootopolisCity_House3_Tileset:: @ 8286E44
SootopolisCity_House8_Tileset:: @ 8286E44
TradeCenter_Tileset:: @ 8286E44
UnknownMap_25_29_Tileset:: @ 8286E44
UnknownMap_25_30_Tileset:: @ 8286E44
UnknownMap_25_31_Tileset:: @ 8286E44
UnknownMap_25_32_Tileset:: @ 8286E44
UnknownMap_25_33_Tileset:: @ 8286E44
UnknownMap_25_34_Tileset:: @ 8286E44
VerdanturfTown_WandasHouse_Tileset:: @ 8286E44
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Building
	.4byte gTilesetPalettes_Building
	.4byte gMetatiles_Building
	.4byte gMetatileAttributes_Building
	.4byte TilesetCB_Building

LavaridgeTown_HerbShop_Tileset2:: @ 8286E5C
LilycoveCity_DepartmentStoreRooftop_Tileset2:: @ 8286E5C
LilycoveCity_DepartmentStore_1F_Tileset2:: @ 8286E5C
LilycoveCity_DepartmentStore_2F_Tileset2:: @ 8286E5C
LilycoveCity_DepartmentStore_3F_Tileset2:: @ 8286E5C
LilycoveCity_DepartmentStore_4F_Tileset2:: @ 8286E5C
LilycoveCity_DepartmentStore_5F_Tileset2:: @ 8286E5C
OldaleTown_Mart_Tileset2:: @ 8286E5C
Route110_SeasideCyclingRoadSouthEntrance_Tileset2:: @ 8286E5C
Route121_SafariZoneEntrance_Tileset2:: @ 8286E5C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Shop
	.4byte gTilesetPalettes_Shop
	.4byte gMetatiles_Shop
	.4byte gMetatileAttributes_Shop
	.4byte 0x0

EverGrandeCity_PokemonLeague_Tileset2:: @ 8286E74
LavaridgeTown_PokemonCenter_1F_Tileset2:: @ 8286E74
OldaleTown_PokemonCenter_1F_Tileset2:: @ 8286E74
OldaleTown_PokemonCenter_2F_Tileset2:: @ 8286E74
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_PokemonCenter
	.4byte gTilesetPalettes_PokemonCenter
	.4byte gMetatiles_PokemonCenter
	.4byte gMetatileAttributes_PokemonCenter
	.4byte 0x0

AncientTomb_Tileset2:: @ 8286E8C
CaveOfOrigin_1F_Tileset2:: @ 8286E8C
CaveOfOrigin_B1F_Tileset2:: @ 8286E8C
CaveOfOrigin_B2F_Tileset2:: @ 8286E8C
CaveOfOrigin_B3F_Tileset2:: @ 8286E8C
CaveOfOrigin_B4F_Tileset2:: @ 8286E8C
CaveOfOrigin_Entrance_Tileset2:: @ 8286E8C
DesertRuins_Tileset2:: @ 8286E8C
GraniteCave_1F_Tileset2:: @ 8286E8C
GraniteCave_B1F_Tileset2:: @ 8286E8C
GraniteCave_B2F_Tileset2:: @ 8286E8C
GraniteCave_StevensRoom_Tileset2:: @ 8286E8C
IslandCave_Tileset2:: @ 8286E8C
Route130_Tileset2:: @ 8286E8C
ScorchedSlab_Tileset2:: @ 8286E8C
SeafloorCavern_Entrance_Tileset2:: @ 8286E8C
SeafloorCavern_Room1_Tileset2:: @ 8286E8C
SeafloorCavern_Room2_Tileset2:: @ 8286E8C
SeafloorCavern_Room3_Tileset2:: @ 8286E8C
SeafloorCavern_Room4_Tileset2:: @ 8286E8C
SeafloorCavern_Room5_Tileset2:: @ 8286E8C
SeafloorCavern_Room8_Tileset2:: @ 8286E8C
SeafloorCavern_Room9_Tileset2:: @ 8286E8C
SealedChamber_InnerRoom_Tileset2:: @ 8286E8C
SealedChamber_OuterRoom_Tileset2:: @ 8286E8C
ShoalCave_HighTideEntranceRoom_Tileset2:: @ 8286E8C
ShoalCave_HighTideInnerRoom_Tileset2:: @ 8286E8C
ShoalCave_LowTideEntranceRoom_Tileset2:: @ 8286E8C
ShoalCave_LowTideIceRoom_Tileset2:: @ 8286E8C
ShoalCave_LowTideInnerRoom_Tileset2:: @ 8286E8C
ShoalCave_LowTideLowerRoom_Tileset2:: @ 8286E8C
ShoalCave_LowTideStairsRoom_Tileset2:: @ 8286E8C
SkyPillar_Entrance_Tileset2:: @ 8286E8C
VictoryRoad_1F_Tileset2:: @ 8286E8C
VictoryRoad_B1F_Tileset2:: @ 8286E8C
VictoryRoad_B2F_Tileset2:: @ 8286E8C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Cave
	.4byte gTilesetPalettes_Cave
	.4byte gMetatiles_Cave
	.4byte gMetatileAttributes_Cave
	.4byte TilesetCB_Cave

RustboroCity_PokemonSchool_Tileset2:: @ 8286EA4
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_PokemonSchool
	.4byte gTilesetPalettes_PokemonSchool
	.4byte gMetatiles_PokemonSchool
	.4byte gMetatileAttributes_PokemonSchool
	.4byte 0x0

SlateportCity_PokemonFanClub_Tileset2:: @ 8286EBC
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_PokemonFanClub
	.4byte gTilesetPalettes_PokemonFanClub
	.4byte gMetatiles_PokemonFanClub
	.4byte gMetatileAttributes_PokemonFanClub
	.4byte 0x0

	.incbin "baserom.gba", 0x286ed4, 0x18

MeteorFalls_1F_1R_Tileset2:: @ 8286EEC
MeteorFalls_1F_2R_Tileset2:: @ 8286EEC
MeteorFalls_B1F_1R_Tileset2:: @ 8286EEC
MeteorFalls_B1F_2R_Tileset2:: @ 8286EEC
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_MeteorFalls
	.4byte gTilesetPalettes_MeteorFalls
	.4byte gMetatiles_MeteorFalls
	.4byte gMetatileAttributes_MeteorFalls
	.4byte 0x0

SlateportCity_OceanicMuseum_1F_Tileset2:: @ 8286F04
SlateportCity_OceanicMuseum_2F_Tileset2:: @ 8286F04
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_OceanicMuseum
	.4byte gTilesetPalettes_OceanicMuseum
	.4byte gMetatiles_OceanicMuseum
	.4byte gMetatileAttributes_OceanicMuseum
	.4byte 0x0

DoubleBattleColosseum_Tileset2:: @ 8286F1C
EverGrandeCity_HallOfFame_Tileset2:: @ 8286F1C
RecordCorner_Tileset2:: @ 8286F1C
SingleBattleColosseum_Tileset2:: @ 8286F1C
TradeCenter_Tileset2:: @ 8286F1C
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_CableClub
	.4byte gTilesetPalettes_CableClub
	.4byte gMetatiles_CableClub
	.4byte gMetatileAttributes_CableClub
	.4byte 0x0

Route109_SeashoreHouse_Tileset2:: @ 8286F34
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_SeashoreHouse
	.4byte gTilesetPalettes_SeashoreHouse
	.4byte gMetatiles_SeashoreHouse
	.4byte gMetatileAttributes_SeashoreHouse
	.4byte 0x0

Route104_PrettyPetalFlowerShop_Tileset2:: @ 8286F4C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_PrettyPetalFlowerShop
	.4byte gTilesetPalettes_PrettyPetalFlowerShop
	.4byte gMetatiles_PrettyPetalFlowerShop
	.4byte gMetatileAttributes_PrettyPetalFlowerShop
	.4byte 0x0

Route117_PokemonDayCare_Tileset2:: @ 8286F64
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_PokemonDayCare
	.4byte gTilesetPalettes_PokemonDayCare
	.4byte gMetatiles_PokemonDayCare
	.4byte gMetatileAttributes_PokemonDayCare
	.4byte 0x0

AbandonedShip_CaptainsOffice_Tileset2:: @ 8286F7C
AbandonedShip_Deck_Tileset2:: @ 8286F7C
AquaHideout_1F_Tileset2:: @ 8286F7C
AquaHideout_B1F_Tileset2:: @ 8286F7C
AquaHideout_B2F_Tileset2:: @ 8286F7C
LilycoveCity_EmptyMap_Tileset2:: @ 8286F7C
MagmaHideout_1F_Tileset2:: @ 8286F7C
MagmaHideout_B1F_Tileset2:: @ 8286F7C
MagmaHideout_B2F_Tileset2:: @ 8286F7C
MossdeepCity_SpaceCenter_1F_Tileset2:: @ 8286F7C
MossdeepCity_SpaceCenter_2F_Tileset2:: @ 8286F7C
MtPyre_1F_Tileset2:: @ 8286F7C
MtPyre_2F_Tileset2:: @ 8286F7C
MtPyre_3F_Tileset2:: @ 8286F7C
MtPyre_4F_Tileset2:: @ 8286F7C
MtPyre_5F_Tileset2:: @ 8286F7C
MtPyre_6F_Tileset2:: @ 8286F7C
MtPyre_Exterior_Tileset2:: @ 8286F7C
MtPyre_Summit_Tileset2:: @ 8286F7C
NewMauville_Entrance_Tileset2:: @ 8286F7C
Route112_CableCarStation_Tileset2:: @ 8286F7C
RustboroCity_DevonCorp_1F_Tileset2:: @ 8286F7C
RustboroCity_DevonCorp_2F_Tileset2:: @ 8286F7C
RustboroCity_DevonCorp_3F_Tileset2:: @ 8286F7C
SlateportCity_Harbor_Tileset2:: @ 8286F7C
SlateportCity_SternsShipyard_1F_Tileset2:: @ 8286F7C
SlateportCity_SternsShipyard_2F_Tileset2:: @ 8286F7C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Facility
	.4byte gTilesetPalettes_Facility
	.4byte gMetatiles_Facility
	.4byte gMetatileAttributes_Facility
	.4byte 0x0

MauvilleCity_BikeShop_Tileset2:: @ 8286F94
NewMauville_Inside_Tileset2:: @ 8286F94
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_BikeShop
	.4byte gTilesetPalettes_BikeShop
	.4byte gMetatiles_BikeShop
	.4byte gMetatileAttributes_BikeShop
	.4byte TilesetCB_BikeShop

RusturfTunnel_Tileset2:: @ 8286FAC
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_RusturfTunnel
	.4byte gTilesetPalettes_RusturfTunnel
	.4byte gMetatiles_RusturfTunnel
	.4byte gMetatileAttributes_RusturfTunnel
	.4byte 0x0

SecretBase_BrownCave1_Tileset2:: @ 8286FC4
SecretBase_BrownCave2_Tileset2:: @ 8286FC4
SecretBase_BrownCave3_Tileset2:: @ 8286FC4
SecretBase_BrownCave4_Tileset2:: @ 8286FC4
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_SecretBaseBrownCave
	.4byte gTilesetPalettes_SecretBaseBrownCave
	.4byte gMetatiles_SecretBaseSecondary
	.4byte gMetatileAttributes_SecretBaseSecondary
	.4byte 0x0

SecretBase_Tree1_Tileset2:: @ 8286FDC
SecretBase_Tree2_Tileset2:: @ 8286FDC
SecretBase_Tree3_Tileset2:: @ 8286FDC
SecretBase_Tree4_Tileset2:: @ 8286FDC
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_SecretBaseTree
	.4byte gTilesetPalettes_SecretBaseTree
	.4byte gMetatiles_SecretBaseSecondary
	.4byte gMetatileAttributes_SecretBaseSecondary
	.4byte 0x0

SecretBase_Shrub1_Tileset2:: @ 8286FF4
SecretBase_Shrub2_Tileset2:: @ 8286FF4
SecretBase_Shrub3_Tileset2:: @ 8286FF4
SecretBase_Shrub4_Tileset2:: @ 8286FF4
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_SecretBaseShrub
	.4byte gTilesetPalettes_SecretBaseShrub
	.4byte gMetatiles_SecretBaseSecondary
	.4byte gMetatileAttributes_SecretBaseSecondary
	.4byte 0x0

SecretBase_BlueCave1_Tileset2:: @ 828700C
SecretBase_BlueCave2_Tileset2:: @ 828700C
SecretBase_BlueCave3_Tileset2:: @ 828700C
SecretBase_BlueCave4_Tileset2:: @ 828700C
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_SecretBaseBlueCave
	.4byte gTilesetPalettes_SecretBaseBlueCave
	.4byte gMetatiles_SecretBaseSecondary
	.4byte gMetatileAttributes_SecretBaseSecondary
	.4byte 0x0

SecretBase_YellowCave1_Tileset2:: @ 8287024
SecretBase_YellowCave2_Tileset2:: @ 8287024
SecretBase_YellowCave3_Tileset2:: @ 8287024
SecretBase_YellowCave4_Tileset2:: @ 8287024
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_SecretBaseYellowCave
	.4byte gTilesetPalettes_SecretBaseYellowCave
	.4byte gMetatiles_SecretBaseSecondary
	.4byte gMetatileAttributes_SecretBaseSecondary
	.4byte 0x0

SecretBase_RedCave1_Tileset2:: @ 828703C
SecretBase_RedCave2_Tileset2:: @ 828703C
SecretBase_RedCave3_Tileset2:: @ 828703C
SecretBase_RedCave4_Tileset2:: @ 828703C
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_SecretBaseRedCave
	.4byte gTilesetPalettes_SecretBaseRedCave
	.4byte gMetatiles_SecretBaseSecondary
	.4byte gMetatileAttributes_SecretBaseSecondary
	.4byte 0x0

InsideOfTruck_Tileset2:: @ 8287054
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_InsideOfTruck
	.4byte gTilesetPalettes_InsideOfTruck
	.4byte gMetatiles_InsideOfTruck
	.4byte gMetatileAttributes_InsideOfTruck
	.4byte 0x0

	.incbin "baserom.gba", 0x28706c, 0x18

FallarborTown_ContestHall_Tileset2:: @ 8287084
FallarborTown_ContestLobby_Tileset2:: @ 8287084
LilycoveCity_ContestHall_Tileset2:: @ 8287084
LilycoveCity_ContestLobby_Tileset2:: @ 8287084
LinkContestRoom1_Tileset2:: @ 8287084
LinkContestRoom2_Tileset2:: @ 8287084
LinkContestRoom3_Tileset2:: @ 8287084
LinkContestRoom4_Tileset2:: @ 8287084
LinkContestRoom5_Tileset2:: @ 8287084
LinkContestRoom6_Tileset2:: @ 8287084
UnknownMap_25_29_Tileset2:: @ 8287084
UnknownMap_25_30_Tileset2:: @ 8287084
UnknownMap_25_31_Tileset2:: @ 8287084
UnknownMap_25_32_Tileset2:: @ 8287084
UnknownMap_25_33_Tileset2:: @ 8287084
UnknownMap_25_34_Tileset2:: @ 8287084
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Contest
	.4byte gTilesetPalettes_Contest
	.4byte gMetatiles_Contest
	.4byte gMetatileAttributes_Contest
	.4byte 0x0

LilycoveCity_LilycoveMuseum_1F_Tileset2:: @ 828709C
LilycoveCity_LilycoveMuseum_2F_Tileset2:: @ 828709C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_LilycoveMuseum
	.4byte gTilesetPalettes_LilycoveMuseum
	.4byte gMetatiles_LilycoveMuseum
	.4byte gMetatileAttributes_LilycoveMuseum
	.4byte 0x0

LittlerootTown_BrendansHouse_1F_Tileset2:: @ 82870B4
LittlerootTown_BrendansHouse_2F_Tileset2:: @ 82870B4
LittlerootTown_MaysHouse_1F_Tileset2:: @ 82870B4
LittlerootTown_MaysHouse_2F_Tileset2:: @ 82870B4
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_BrendansMaysHouse
	.4byte gTilesetPalettes_BrendansMaysHouse
	.4byte gMetatiles_BrendansMaysHouse
	.4byte gMetatileAttributes_BrendansMaysHouse
	.4byte 0x0

LittlerootTown_ProfessorBirchsLab_Tileset2:: @ 82870CC
Route114_LanettesHouse_Tileset2:: @ 82870CC
Route119_WeatherInstitute_1F_Tileset2:: @ 82870CC
Route119_WeatherInstitute_2F_Tileset2:: @ 82870CC
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Lab
	.4byte gTilesetPalettes_Lab
	.4byte gMetatiles_Lab
	.4byte gMetatileAttributes_Lab
	.4byte 0x0

Underwater1_Tileset2:: @ 82870E4
Underwater2_Tileset2:: @ 82870E4
Underwater3_Tileset2:: @ 82870E4
Underwater4_Tileset2:: @ 82870E4
Underwater_Route134_Tileset2:: @ 82870E4
Underwater_SeafloorCavern_Tileset2:: @ 82870E4
Underwater_SealedChamber_Tileset2:: @ 82870E4
Underwater_SootopolisCity_Tileset2:: @ 82870E4
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Underwater
	.4byte gTilesetPalettes_Underwater
	.4byte gMetatiles_Underwater
	.4byte gMetatileAttributes_Underwater
	.4byte TilesetCB_Underwater

PetalburgCity_Gym_Tileset2:: @ 82870FC
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_PetalburgGym
	.4byte gTilesetPalettes_PetalburgGym
	.4byte gMetatiles_PetalburgGym
	.4byte gMetatileAttributes_PetalburgGym
	.4byte 0x0

SootopolisCity_Gym_1F_Tileset2:: @ 8287114
SootopolisCity_Gym_B1F_Tileset2:: @ 8287114
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_SootopolisGym
	.4byte gTilesetPalettes_SootopolisGym
	.4byte gMetatiles_SootopolisGym
	.4byte gMetatileAttributes_SootopolisGym
	.4byte TilesetCB_SootopolisGym

DewfordTown_Hall_Tileset2:: @ 828712C
DewfordTown_House1_Tileset2:: @ 828712C
DewfordTown_House2_Tileset2:: @ 828712C
FortreeCity_DecorationShop_Tileset2:: @ 828712C
FortreeCity_House1_Tileset2:: @ 828712C
FortreeCity_House2_Tileset2:: @ 828712C
LilycoveCity_CoveLilyMotel_1F_Tileset2:: @ 828712C
LilycoveCity_CoveLilyMotel_2F_Tileset2:: @ 828712C
LilycoveCity_House2_Tileset2:: @ 828712C
LilycoveCity_PokemonTrainerFanClub_Tileset2:: @ 828712C
MossdeepCity_GameCorner_1F_Tileset2:: @ 828712C
MossdeepCity_GameCorner_B1F_Tileset2:: @ 828712C
MossdeepCity_StevensHouse_Tileset2:: @ 828712C
OldaleTown_House1_Tileset2:: @ 828712C
OldaleTown_House2_Tileset2:: @ 828712C
PacifidlogTown_House1_Tileset2:: @ 828712C
PacifidlogTown_House2_Tileset2:: @ 828712C
PetalburgCity_House2_Tileset2:: @ 828712C
Route104_MrBrineysHouse_Tileset2:: @ 828712C
Route110_TrickHouseCorridor_Tileset2:: @ 828712C
Route110_TrickHouseEnd_Tileset2:: @ 828712C
Route110_TrickHouseEntrance_Tileset2:: @ 828712C
Route114_FossilManiacsHouse_Tileset2:: @ 828712C
Route116_TunnelersRestHouse_Tileset2:: @ 828712C
Route124_DivingTreasureHuntersHouse_Tileset2:: @ 828712C
RustboroCity_CuttersHouse_Tileset2:: @ 828712C
RustboroCity_Flat1_1F_Tileset2:: @ 828712C
RustboroCity_Flat1_2F_Tileset2:: @ 828712C
RustboroCity_Flat2_1F_Tileset2:: @ 828712C
RustboroCity_Flat2_2F_Tileset2:: @ 828712C
RustboroCity_Flat2_3F_Tileset2:: @ 828712C
RustboroCity_House1_Tileset2:: @ 828712C
RustboroCity_House2_Tileset2:: @ 828712C
SafariZone_RestHouse_Tileset2:: @ 828712C
SootopolisCity_House1_Tileset2:: @ 828712C
SootopolisCity_House2_Tileset2:: @ 828712C
SootopolisCity_House3_Tileset2:: @ 828712C
SootopolisCity_House8_Tileset2:: @ 828712C
VerdanturfTown_WandasHouse_Tileset2:: @ 828712C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_GenericBuilding
	.4byte gTilesetPalettes_GenericBuilding
	.4byte gMetatiles_GenericBuilding
	.4byte gMetatileAttributes_GenericBuilding
	.4byte 0x0

MauvilleCity_GameCorner_Tileset2:: @ 8287144
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_MauvilleGameCorner
	.4byte gTilesetPalettes_MauvilleGameCorner
	.4byte gMetatiles_MauvilleGameCorner
	.4byte gMetatileAttributes_MauvilleGameCorner
	.4byte 0x0

RustboroCity_Gym_Tileset2:: @ 828715C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_RustboroGym
	.4byte gTilesetPalettes_RustboroGym
	.4byte gMetatiles_RustboroGym
	.4byte gMetatileAttributes_RustboroGym
	.4byte 0x0

DewfordTown_Gym_Tileset2:: @ 8287174
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_DewfordGym
	.4byte gTilesetPalettes_DewfordGym
	.4byte gMetatiles_DewfordGym
	.4byte gMetatileAttributes_DewfordGym
	.4byte 0x0

MauvilleCity_Gym_Tileset2:: @ 828718C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_MauvilleGym
	.4byte gTilesetPalettes_MauvilleGym
	.4byte gMetatiles_MauvilleGym
	.4byte gMetatileAttributes_MauvilleGym
	.4byte TilesetCB_MauvilleGym

LavaridgeTown_Gym_1F_Tileset2:: @ 82871A4
LavaridgeTown_Gym_B1F_Tileset2:: @ 82871A4
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_LavaridgeGym
	.4byte gTilesetPalettes_LavaridgeGym
	.4byte gMetatiles_LavaridgeGym
	.4byte gMetatileAttributes_LavaridgeGym
	.4byte 0x0

Route110_TrickHousePuzzle1_Tileset2:: @ 82871BC
Route110_TrickHousePuzzle2_Tileset2:: @ 82871BC
Route110_TrickHousePuzzle3_Tileset2:: @ 82871BC
Route110_TrickHousePuzzle4_Tileset2:: @ 82871BC
Route110_TrickHousePuzzle5_Tileset2:: @ 82871BC
Route110_TrickHousePuzzle6_Tileset2:: @ 82871BC
Route110_TrickHousePuzzle7_Tileset2:: @ 82871BC
Route110_TrickHousePuzzle8_Tileset2:: @ 82871BC
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_TrickHousePuzzle
	.4byte gTilesetPalettes_TrickHousePuzzle
	.4byte gMetatiles_TrickHousePuzzle
	.4byte gMetatileAttributes_TrickHousePuzzle
	.4byte 0x0

FortreeCity_Gym_Tileset2:: @ 82871D4
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_FortreeGym
	.4byte gTilesetPalettes_FortreeGym
	.4byte gMetatiles_FortreeGym
	.4byte gMetatileAttributes_FortreeGym
	.4byte 0x0

MossdeepCity_Gym_Tileset2:: @ 82871EC
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_MossdeepGym
	.4byte gTilesetPalettes_MossdeepGym
	.4byte gMetatiles_MossdeepGym
	.4byte gMetatileAttributes_MossdeepGym
	.4byte 0x0

AbandonedShip_Corridors_1F_Tileset2:: @ 8287204
AbandonedShip_Corridors_B1F_Tileset2:: @ 8287204
AbandonedShip_HiddenFloorCorridors_Tileset2:: @ 8287204
AbandonedShip_HiddenFloorRooms_Tileset2:: @ 8287204
AbandonedShip_Room_B1F_Tileset2:: @ 8287204
AbandonedShip_Rooms2_1F_Tileset2:: @ 8287204
AbandonedShip_Rooms2_B1F_Tileset2:: @ 8287204
AbandonedShip_Rooms_1F_Tileset2:: @ 8287204
AbandonedShip_Rooms_B1F_Tileset2:: @ 8287204
AbandonedShip_Underwater1_Tileset2:: @ 8287204
AbandonedShip_Underwater2_Tileset2:: @ 8287204
SSTidalCorridor_Tileset2:: @ 8287204
SSTidalLowerDeck_Tileset2:: @ 8287204
SSTidalRooms_Tileset2:: @ 8287204
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_Ship
	.4byte gTilesetPalettes_Ship
	.4byte gMetatiles_Ship
	.4byte gMetatileAttributes_Ship
	.4byte 0x0

SecretBase_BlueCave1_Tileset:: @ 828721C
SecretBase_BlueCave2_Tileset:: @ 828721C
SecretBase_BlueCave3_Tileset:: @ 828721C
SecretBase_BlueCave4_Tileset:: @ 828721C
SecretBase_BrownCave1_Tileset:: @ 828721C
SecretBase_BrownCave2_Tileset:: @ 828721C
SecretBase_BrownCave3_Tileset:: @ 828721C
SecretBase_BrownCave4_Tileset:: @ 828721C
SecretBase_RedCave1_Tileset:: @ 828721C
SecretBase_RedCave2_Tileset:: @ 828721C
SecretBase_RedCave3_Tileset:: @ 828721C
SecretBase_RedCave4_Tileset:: @ 828721C
SecretBase_Shrub1_Tileset:: @ 828721C
SecretBase_Shrub2_Tileset:: @ 828721C
SecretBase_Shrub3_Tileset:: @ 828721C
SecretBase_Shrub4_Tileset:: @ 828721C
SecretBase_Tree1_Tileset:: @ 828721C
SecretBase_Tree2_Tileset:: @ 828721C
SecretBase_Tree3_Tileset:: @ 828721C
SecretBase_Tree4_Tileset:: @ 828721C
SecretBase_YellowCave1_Tileset:: @ 828721C
SecretBase_YellowCave2_Tileset:: @ 828721C
SecretBase_YellowCave3_Tileset:: @ 828721C
SecretBase_YellowCave4_Tileset:: @ 828721C
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.4byte gTilesetTiles_SecretBase
	.4byte gTilesetPalettes_SecretBase
	.4byte gMetatiles_SecretBasePrimary
	.4byte gMetatileAttributes_SecretBasePrimary
	.4byte 0x0

EverGrandeCity_ChampionsRoom_Tileset2:: @ 8287234
EverGrandeCity_Corridor1_Tileset2:: @ 8287234
EverGrandeCity_Corridor4_Tileset2:: @ 8287234
EverGrandeCity_DrakesRoom_Tileset2:: @ 8287234
EverGrandeCity_GlaciasRoom_Tileset2:: @ 8287234
EverGrandeCity_PhoebesRoom_Tileset2:: @ 8287234
EverGrandeCity_SidneysRoom_Tileset2:: @ 8287234
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_EliteFour
	.4byte gTilesetPalettes_EliteFour
	.4byte gMetatiles_EliteFour
	.4byte gMetatileAttributes_EliteFour
	.4byte TilesetCB_EliteFour

BattleTower_BattleRoom_Tileset2:: @ 828724C
BattleTower_Corridor_Tileset2:: @ 828724C
BattleTower_Elevator_Tileset2:: @ 828724C
BattleTower_Lobby_Tileset2:: @ 828724C
LilycoveCity_DepartmentStoreElevator_Tileset2:: @ 828724C
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.4byte gTilesetTiles_BattleTower
	.4byte gTilesetPalettes_BattleTower
	.4byte gMetatiles_BattleTower
	.4byte gMetatileAttributes_BattleTower
	.4byte 0x0

	.include "data/maps/_assets.s"
	.global gUnknown_08304F18
gUnknown_08304F18: @ 8304F18

	.incbin "baserom.gba", 0x304f18, 0x530

	.include "data/maps/PetalburgCity/header.s"
	.include "data/maps/SlateportCity/header.s"
	.include "data/maps/MauvilleCity/header.s"
	.include "data/maps/RustboroCity/header.s"
	.include "data/maps/FortreeCity/header.s"
	.include "data/maps/LilycoveCity/header.s"
	.include "data/maps/MossdeepCity/header.s"
	.include "data/maps/SootopolisCity/header.s"
	.include "data/maps/EverGrandeCity/header.s"
	.include "data/maps/LittlerootTown/header.s"
	.include "data/maps/OldaleTown/header.s"
	.include "data/maps/DewfordTown/header.s"
	.include "data/maps/LavaridgeTown/header.s"
	.include "data/maps/FallarborTown/header.s"
	.include "data/maps/VerdanturfTown/header.s"
	.include "data/maps/PacifidlogTown/header.s"
	.include "data/maps/Route101/header.s"
	.include "data/maps/Route102/header.s"
	.include "data/maps/Route103/header.s"
	.include "data/maps/Route104/header.s"
	.include "data/maps/Route105/header.s"
	.include "data/maps/Route106/header.s"
	.include "data/maps/Route107/header.s"
	.include "data/maps/Route108/header.s"
	.include "data/maps/Route109/header.s"
	.include "data/maps/Route110/header.s"
	.include "data/maps/Route111/header.s"
	.include "data/maps/Route112/header.s"
	.include "data/maps/Route113/header.s"
	.include "data/maps/Route114/header.s"
	.include "data/maps/Route115/header.s"
	.include "data/maps/Route116/header.s"
	.include "data/maps/Route117/header.s"
	.include "data/maps/Route118/header.s"
	.include "data/maps/Route119/header.s"
	.include "data/maps/Route120/header.s"
	.include "data/maps/Route121/header.s"
	.include "data/maps/Route122/header.s"
	.include "data/maps/Route123/header.s"
	.include "data/maps/Route124/header.s"
	.include "data/maps/Route125/header.s"
	.include "data/maps/Route126/header.s"
	.include "data/maps/Route127/header.s"
	.include "data/maps/Route128/header.s"
	.include "data/maps/Route129/header.s"
	.include "data/maps/Route130/header.s"
	.include "data/maps/Route131/header.s"
	.include "data/maps/Route132/header.s"
	.include "data/maps/Route133/header.s"
	.include "data/maps/Route134/header.s"
	.include "data/maps/Underwater1/header.s"
	.include "data/maps/Underwater2/header.s"
	.include "data/maps/Underwater3/header.s"
	.include "data/maps/Underwater4/header.s"
	.include "data/maps/LittlerootTown_BrendansHouse_1F/header.s"
	.include "data/maps/LittlerootTown_BrendansHouse_2F/header.s"
	.include "data/maps/LittlerootTown_MaysHouse_1F/header.s"
	.include "data/maps/LittlerootTown_MaysHouse_2F/header.s"
	.include "data/maps/LittlerootTown_ProfessorBirchsLab/header.s"
	.include "data/maps/OldaleTown_House1/header.s"
	.include "data/maps/OldaleTown_House2/header.s"
	.include "data/maps/OldaleTown_PokemonCenter_1F/header.s"
	.include "data/maps/OldaleTown_PokemonCenter_2F/header.s"
	.include "data/maps/OldaleTown_Mart/header.s"
	.include "data/maps/DewfordTown_House1/header.s"
	.include "data/maps/DewfordTown_PokemonCenter_1F/header.s"
	.include "data/maps/DewfordTown_PokemonCenter_2F/header.s"
	.include "data/maps/DewfordTown_Gym/header.s"
	.include "data/maps/DewfordTown_Hall/header.s"
	.include "data/maps/DewfordTown_House2/header.s"
	.include "data/maps/LavaridgeTown_HerbShop/header.s"
	.include "data/maps/LavaridgeTown_Gym_1F/header.s"
	.include "data/maps/LavaridgeTown_Gym_B1F/header.s"
	.include "data/maps/LavaridgeTown_House/header.s"
	.include "data/maps/LavaridgeTown_Mart/header.s"
	.include "data/maps/LavaridgeTown_PokemonCenter_1F/header.s"
	.include "data/maps/LavaridgeTown_PokemonCenter_2F/header.s"
	.include "data/maps/FallarborTown_Mart/header.s"
	.include "data/maps/FallarborTown_ContestLobby/header.s"
	.include "data/maps/FallarborTown_ContestHall/header.s"
	.include "data/maps/FallarborTown_PokemonCenter_1F/header.s"
	.include "data/maps/FallarborTown_PokemonCenter_2F/header.s"
	.include "data/maps/FallarborTown_House1/header.s"
	.include "data/maps/FallarborTown_House2/header.s"
	.include "data/maps/VerdanturfTown_ContestLobby/header.s"
	.include "data/maps/VerdanturfTown_ContestHall/header.s"
	.include "data/maps/VerdanturfTown_Mart/header.s"
	.include "data/maps/VerdanturfTown_PokemonCenter_1F/header.s"
	.include "data/maps/VerdanturfTown_PokemonCenter_2F/header.s"
	.include "data/maps/VerdanturfTown_WandasHouse/header.s"
	.include "data/maps/VerdanturfTown_FriendshipRatersHouse/header.s"
	.include "data/maps/VerdanturfTown_House/header.s"
	.include "data/maps/PacifidlogTown_PokemonCenter_1F/header.s"
	.include "data/maps/PacifidlogTown_PokemonCenter_2F/header.s"
	.include "data/maps/PacifidlogTown_House1/header.s"
	.include "data/maps/PacifidlogTown_House2/header.s"
	.include "data/maps/PacifidlogTown_House3/header.s"
	.include "data/maps/PacifidlogTown_House4/header.s"
	.include "data/maps/PacifidlogTown_House5/header.s"
	.include "data/maps/PetalburgCity_WallysHouse/header.s"
	.include "data/maps/PetalburgCity_Gym/header.s"
	.include "data/maps/PetalburgCity_House1/header.s"
	.include "data/maps/PetalburgCity_House2/header.s"
	.include "data/maps/PetalburgCity_PokemonCenter_1F/header.s"
	.include "data/maps/PetalburgCity_PokemonCenter_2F/header.s"
	.include "data/maps/PetalburgCity_Mart/header.s"
	.include "data/maps/SlateportCity_SternsShipyard_1F/header.s"
	.include "data/maps/SlateportCity_SternsShipyard_2F/header.s"
	.include "data/maps/SlateportCity_ContestLobby/header.s"
	.include "data/maps/SlateportCity_ContestHall/header.s"
	.include "data/maps/SlateportCity_House1/header.s"
	.include "data/maps/SlateportCity_PokemonFanClub/header.s"
	.include "data/maps/SlateportCity_OceanicMuseum_1F/header.s"
	.include "data/maps/SlateportCity_OceanicMuseum_2F/header.s"
	.include "data/maps/SlateportCity_Harbor/header.s"
	.include "data/maps/SlateportCity_House2/header.s"
	.include "data/maps/SlateportCity_PokemonCenter_1F/header.s"
	.include "data/maps/SlateportCity_PokemonCenter_2F/header.s"
	.include "data/maps/SlateportCity_Mart/header.s"
	.include "data/maps/MauvilleCity_Gym/header.s"
	.include "data/maps/MauvilleCity_BikeShop/header.s"
	.include "data/maps/MauvilleCity_House1/header.s"
	.include "data/maps/MauvilleCity_GameCorner/header.s"
	.include "data/maps/MauvilleCity_House2/header.s"
	.include "data/maps/MauvilleCity_PokemonCenter_1F/header.s"
	.include "data/maps/MauvilleCity_PokemonCenter_2F/header.s"
	.include "data/maps/MauvilleCity_Mart/header.s"
	.include "data/maps/RustboroCity_DevonCorp_1F/header.s"
	.include "data/maps/RustboroCity_DevonCorp_2F/header.s"
	.include "data/maps/RustboroCity_DevonCorp_3F/header.s"
	.include "data/maps/RustboroCity_Gym/header.s"
	.include "data/maps/RustboroCity_PokemonSchool/header.s"
	.include "data/maps/RustboroCity_PokemonCenter_1F/header.s"
	.include "data/maps/RustboroCity_PokemonCenter_2F/header.s"
	.include "data/maps/RustboroCity_Mart/header.s"
	.include "data/maps/RustboroCity_Flat1_1F/header.s"
	.include "data/maps/RustboroCity_Flat1_2F/header.s"
	.include "data/maps/RustboroCity_House1/header.s"
	.include "data/maps/RustboroCity_CuttersHouse/header.s"
	.include "data/maps/RustboroCity_House2/header.s"
	.include "data/maps/RustboroCity_Flat2_1F/header.s"
	.include "data/maps/RustboroCity_Flat2_2F/header.s"
	.include "data/maps/RustboroCity_Flat2_3F/header.s"
	.include "data/maps/RustboroCity_House3/header.s"
	.include "data/maps/FortreeCity_House1/header.s"
	.include "data/maps/FortreeCity_Gym/header.s"
	.include "data/maps/FortreeCity_PokemonCenter_1F/header.s"
	.include "data/maps/FortreeCity_PokemonCenter_2F/header.s"
	.include "data/maps/FortreeCity_Mart/header.s"
	.include "data/maps/FortreeCity_House2/header.s"
	.include "data/maps/FortreeCity_House3/header.s"
	.include "data/maps/FortreeCity_House4/header.s"
	.include "data/maps/FortreeCity_House5/header.s"
	.include "data/maps/FortreeCity_DecorationShop/header.s"
	.include "data/maps/LilycoveCity_CoveLilyMotel_1F/header.s"
	.include "data/maps/LilycoveCity_CoveLilyMotel_2F/header.s"
	.include "data/maps/LilycoveCity_LilycoveMuseum_1F/header.s"
	.include "data/maps/LilycoveCity_LilycoveMuseum_2F/header.s"
	.include "data/maps/LilycoveCity_ContestLobby/header.s"
	.include "data/maps/LilycoveCity_ContestHall/header.s"
	.include "data/maps/LilycoveCity_PokemonCenter_1F/header.s"
	.include "data/maps/LilycoveCity_PokemonCenter_2F/header.s"
	.include "data/maps/LilycoveCity_UnusedMart/header.s"
	.include "data/maps/LilycoveCity_PokemonTrainerFanClub/header.s"
	.include "data/maps/LilycoveCity_Harbor/header.s"
	.include "data/maps/LilycoveCity_EmptyMap/header.s"
	.include "data/maps/LilycoveCity_MoveDeletersHouse/header.s"
	.include "data/maps/LilycoveCity_House1/header.s"
	.include "data/maps/LilycoveCity_House2/header.s"
	.include "data/maps/LilycoveCity_House3/header.s"
	.include "data/maps/LilycoveCity_House4/header.s"
	.include "data/maps/LilycoveCity_DepartmentStore_1F/header.s"
	.include "data/maps/LilycoveCity_DepartmentStore_2F/header.s"
	.include "data/maps/LilycoveCity_DepartmentStore_3F/header.s"
	.include "data/maps/LilycoveCity_DepartmentStore_4F/header.s"
	.include "data/maps/LilycoveCity_DepartmentStore_5F/header.s"
	.include "data/maps/LilycoveCity_DepartmentStoreRooftop/header.s"
	.include "data/maps/LilycoveCity_DepartmentStoreElevator/header.s"
	.include "data/maps/MossdeepCity_Gym/header.s"
	.include "data/maps/MossdeepCity_House1/header.s"
	.include "data/maps/MossdeepCity_House2/header.s"
	.include "data/maps/MossdeepCity_PokemonCenter_1F/header.s"
	.include "data/maps/MossdeepCity_PokemonCenter_2F/header.s"
	.include "data/maps/MossdeepCity_Mart/header.s"
	.include "data/maps/MossdeepCity_House3/header.s"
	.include "data/maps/MossdeepCity_StevensHouse/header.s"
	.include "data/maps/MossdeepCity_House4/header.s"
	.include "data/maps/MossdeepCity_SpaceCenter_1F/header.s"
	.include "data/maps/MossdeepCity_SpaceCenter_2F/header.s"
	.include "data/maps/MossdeepCity_GameCorner_1F/header.s"
	.include "data/maps/MossdeepCity_GameCorner_B1F/header.s"
	.include "data/maps/SootopolisCity_Gym_1F/header.s"
	.include "data/maps/SootopolisCity_Gym_B1F/header.s"
	.include "data/maps/SootopolisCity_PokemonCenter_1F/header.s"
	.include "data/maps/SootopolisCity_PokemonCenter_2F/header.s"
	.include "data/maps/SootopolisCity_Mart/header.s"
	.include "data/maps/SootopolisCity_House1/header.s"
	.include "data/maps/SootopolisCity_House2/header.s"
	.include "data/maps/SootopolisCity_House3/header.s"
	.include "data/maps/SootopolisCity_House4/header.s"
	.include "data/maps/SootopolisCity_House5/header.s"
	.include "data/maps/SootopolisCity_House6/header.s"
	.include "data/maps/SootopolisCity_House7/header.s"
	.include "data/maps/SootopolisCity_House8/header.s"
	.include "data/maps/EverGrandeCity_SidneysRoom/header.s"
	.include "data/maps/EverGrandeCity_PhoebesRoom/header.s"
	.include "data/maps/EverGrandeCity_GlaciasRoom/header.s"
	.include "data/maps/EverGrandeCity_DrakesRoom/header.s"
	.include "data/maps/EverGrandeCity_ChampionsRoom/header.s"
	.include "data/maps/EverGrandeCity_Corridor1/header.s"
	.include "data/maps/EverGrandeCity_Corridor2/header.s"
	.include "data/maps/EverGrandeCity_Corridor3/header.s"
	.include "data/maps/EverGrandeCity_Corridor4/header.s"
	.include "data/maps/EverGrandeCity_Corridor5/header.s"
	.include "data/maps/EverGrandeCity_PokemonLeague/header.s"
	.include "data/maps/EverGrandeCity_HallOfFame/header.s"
	.include "data/maps/EverGrandeCity_PokemonCenter_1F/header.s"
	.include "data/maps/EverGrandeCity_PokemonCenter_2F/header.s"
	.include "data/maps/Route104_MrBrineysHouse/header.s"
	.include "data/maps/Route104_PrettyPetalFlowerShop/header.s"
	.include "data/maps/Route111_WinstrateFamilysHouse/header.s"
	.include "data/maps/Route111_OldLadysRestStop/header.s"
	.include "data/maps/Route112_CableCarStation/header.s"
	.include "data/maps/MtChimney_CableCarStation/header.s"
	.include "data/maps/Route114_FossilManiacsHouse/header.s"
	.include "data/maps/Route114_FossilManiacsTunnel/header.s"
	.include "data/maps/Route114_LanettesHouse/header.s"
	.include "data/maps/Route116_TunnelersRestHouse/header.s"
	.include "data/maps/Route117_PokemonDayCare/header.s"
	.include "data/maps/Route121_SafariZoneEntrance/header.s"
	.include "data/maps/MeteorFalls_1F_1R/header.s"
	.include "data/maps/MeteorFalls_1F_2R/header.s"
	.include "data/maps/MeteorFalls_B1F_1R/header.s"
	.include "data/maps/MeteorFalls_B1F_2R/header.s"
	.include "data/maps/RusturfTunnel/header.s"
	.include "data/maps/Underwater_SootopolisCity/header.s"
	.include "data/maps/DesertRuins/header.s"
	.include "data/maps/GraniteCave_1F/header.s"
	.include "data/maps/GraniteCave_B1F/header.s"
	.include "data/maps/GraniteCave_B2F/header.s"
	.include "data/maps/GraniteCave_StevensRoom/header.s"
	.include "data/maps/PetalburgWoods/header.s"
	.include "data/maps/MtChimney/header.s"
	.include "data/maps/JaggedPass/header.s"
	.include "data/maps/FieryPath/header.s"
	.include "data/maps/MtPyre_1F/header.s"
	.include "data/maps/MtPyre_2F/header.s"
	.include "data/maps/MtPyre_3F/header.s"
	.include "data/maps/MtPyre_4F/header.s"
	.include "data/maps/MtPyre_5F/header.s"
	.include "data/maps/MtPyre_6F/header.s"
	.include "data/maps/MtPyre_Exterior/header.s"
	.include "data/maps/MtPyre_Summit/header.s"
	.include "data/maps/AquaHideout_1F/header.s"
	.include "data/maps/AquaHideout_B1F/header.s"
	.include "data/maps/AquaHideout_B2F/header.s"
	.include "data/maps/Underwater_SeafloorCavern/header.s"
	.include "data/maps/SeafloorCavern_Entrance/header.s"
	.include "data/maps/SeafloorCavern_Room1/header.s"
	.include "data/maps/SeafloorCavern_Room2/header.s"
	.include "data/maps/SeafloorCavern_Room3/header.s"
	.include "data/maps/SeafloorCavern_Room4/header.s"
	.include "data/maps/SeafloorCavern_Room5/header.s"
	.include "data/maps/SeafloorCavern_Room6/header.s"
	.include "data/maps/SeafloorCavern_Room7/header.s"
	.include "data/maps/SeafloorCavern_Room8/header.s"
	.include "data/maps/SeafloorCavern_Room9/header.s"
	.include "data/maps/CaveOfOrigin_Entrance/header.s"
	.include "data/maps/CaveOfOrigin_1F/header.s"
	.include "data/maps/CaveOfOrigin_B1F/header.s"
	.include "data/maps/CaveOfOrigin_B2F/header.s"
	.include "data/maps/CaveOfOrigin_B3F/header.s"
	.include "data/maps/CaveOfOrigin_B4F/header.s"
	.include "data/maps/VictoryRoad_1F/header.s"
	.include "data/maps/VictoryRoad_B1F/header.s"
	.include "data/maps/VictoryRoad_B2F/header.s"
	.include "data/maps/ShoalCave_LowTideEntranceRoom/header.s"
	.include "data/maps/ShoalCave_LowTideInnerRoom/header.s"
	.include "data/maps/ShoalCave_LowTideStairsRoom/header.s"
	.include "data/maps/ShoalCave_LowTideLowerRoom/header.s"
	.include "data/maps/ShoalCave_HighTideEntranceRoom/header.s"
	.include "data/maps/ShoalCave_HighTideInnerRoom/header.s"
	.include "data/maps/NewMauville_Entrance/header.s"
	.include "data/maps/NewMauville_Inside/header.s"
	.include "data/maps/AbandonedShip_Deck/header.s"
	.include "data/maps/AbandonedShip_Corridors_1F/header.s"
	.include "data/maps/AbandonedShip_Rooms_1F/header.s"
	.include "data/maps/AbandonedShip_Corridors_B1F/header.s"
	.include "data/maps/AbandonedShip_Rooms_B1F/header.s"
	.include "data/maps/AbandonedShip_Rooms2_B1F/header.s"
	.include "data/maps/AbandonedShip_Underwater1/header.s"
	.include "data/maps/AbandonedShip_Room_B1F/header.s"
	.include "data/maps/AbandonedShip_Rooms2_1F/header.s"
	.include "data/maps/AbandonedShip_CaptainsOffice/header.s"
	.include "data/maps/AbandonedShip_Underwater2/header.s"
	.include "data/maps/AbandonedShip_HiddenFloorCorridors/header.s"
	.include "data/maps/AbandonedShip_HiddenFloorRooms/header.s"
	.include "data/maps/IslandCave/header.s"
	.include "data/maps/AncientTomb/header.s"
	.include "data/maps/Underwater_Route134/header.s"
	.include "data/maps/Underwater_SealedChamber/header.s"
	.include "data/maps/SealedChamber_OuterRoom/header.s"
	.include "data/maps/SealedChamber_InnerRoom/header.s"
	.include "data/maps/ScorchedSlab/header.s"
	.include "data/maps/MagmaHideout_1F/header.s"
	.include "data/maps/MagmaHideout_B1F/header.s"
	.include "data/maps/MagmaHideout_B2F/header.s"
	.include "data/maps/SkyPillar_Entrance/header.s"
	.include "data/maps/SkyPillar_Outside/header.s"
	.include "data/maps/SkyPillar_1F/header.s"
	.include "data/maps/SkyPillar_2F/header.s"
	.include "data/maps/SkyPillar_3F/header.s"
	.include "data/maps/SkyPillar_4F/header.s"
	.include "data/maps/ShoalCave_LowTideIceRoom/header.s"
	.include "data/maps/SkyPillar_5F/header.s"
	.include "data/maps/SkyPillar_Top/header.s"
	.include "data/maps/SecretBase_RedCave1/header.s"
	.include "data/maps/SecretBase_BrownCave1/header.s"
	.include "data/maps/SecretBase_BlueCave1/header.s"
	.include "data/maps/SecretBase_YellowCave1/header.s"
	.include "data/maps/SecretBase_Tree1/header.s"
	.include "data/maps/SecretBase_Shrub1/header.s"
	.include "data/maps/SecretBase_RedCave2/header.s"
	.include "data/maps/SecretBase_BrownCave2/header.s"
	.include "data/maps/SecretBase_BlueCave2/header.s"
	.include "data/maps/SecretBase_YellowCave2/header.s"
	.include "data/maps/SecretBase_Tree2/header.s"
	.include "data/maps/SecretBase_Shrub2/header.s"
	.include "data/maps/SecretBase_RedCave3/header.s"
	.include "data/maps/SecretBase_BrownCave3/header.s"
	.include "data/maps/SecretBase_BlueCave3/header.s"
	.include "data/maps/SecretBase_YellowCave3/header.s"
	.include "data/maps/SecretBase_Tree3/header.s"
	.include "data/maps/SecretBase_Shrub3/header.s"
	.include "data/maps/SecretBase_RedCave4/header.s"
	.include "data/maps/SecretBase_BrownCave4/header.s"
	.include "data/maps/SecretBase_BlueCave4/header.s"
	.include "data/maps/SecretBase_YellowCave4/header.s"
	.include "data/maps/SecretBase_Tree4/header.s"
	.include "data/maps/SecretBase_Shrub4/header.s"
	.include "data/maps/SingleBattleColosseum/header.s"
	.include "data/maps/TradeCenter/header.s"
	.include "data/maps/RecordCorner/header.s"
	.include "data/maps/DoubleBattleColosseum/header.s"
	.include "data/maps/LinkContestRoom1/header.s"
	.include "data/maps/UnknownMap_25_29/header.s"
	.include "data/maps/UnknownMap_25_30/header.s"
	.include "data/maps/UnknownMap_25_31/header.s"
	.include "data/maps/UnknownMap_25_32/header.s"
	.include "data/maps/UnknownMap_25_33/header.s"
	.include "data/maps/UnknownMap_25_34/header.s"
	.include "data/maps/LinkContestRoom2/header.s"
	.include "data/maps/LinkContestRoom3/header.s"
	.include "data/maps/LinkContestRoom4/header.s"
	.include "data/maps/LinkContestRoom5/header.s"
	.include "data/maps/LinkContestRoom6/header.s"
	.include "data/maps/InsideOfTruck/header.s"
	.include "data/maps/SSTidalCorridor/header.s"
	.include "data/maps/SSTidalLowerDeck/header.s"
	.include "data/maps/SSTidalRooms/header.s"
	.include "data/maps/SafariZone_Northwest/header.s"
	.include "data/maps/SafariZone_Northeast/header.s"
	.include "data/maps/SafariZone_Southwest/header.s"
	.include "data/maps/SafariZone_Southeast/header.s"
	.include "data/maps/BattleTower_Outside/header.s"
	.include "data/maps/BattleTower_Lobby/header.s"
	.include "data/maps/BattleTower_Elevator/header.s"
	.include "data/maps/BattleTower_Corridor/header.s"
	.include "data/maps/BattleTower_BattleRoom/header.s"
	.include "data/maps/SouthernIsland_Exterior/header.s"
	.include "data/maps/SouthernIsland_Interior/header.s"
	.include "data/maps/SafariZone_RestHouse/header.s"
	.include "data/maps/Route104_Prototype/header.s"
	.include "data/maps/Route104_PrototypePrettyPetalFlowerShop/header.s"
	.include "data/maps/Route109_SeashoreHouse/header.s"
	.include "data/maps/Route110_TrickHouseEntrance/header.s"
	.include "data/maps/Route110_TrickHouseEnd/header.s"
	.include "data/maps/Route110_TrickHouseCorridor/header.s"
	.include "data/maps/Route110_TrickHousePuzzle1/header.s"
	.include "data/maps/Route110_TrickHousePuzzle2/header.s"
	.include "data/maps/Route110_TrickHousePuzzle3/header.s"
	.include "data/maps/Route110_TrickHousePuzzle4/header.s"
	.include "data/maps/Route110_TrickHousePuzzle5/header.s"
	.include "data/maps/Route110_TrickHousePuzzle6/header.s"
	.include "data/maps/Route110_TrickHousePuzzle7/header.s"
	.include "data/maps/Route110_TrickHousePuzzle8/header.s"
	.include "data/maps/Route110_SeasideCyclingRoadSouthEntrance/header.s"
	.include "data/maps/Route110_SeasideCyclingRoadNorthEntrance/header.s"
	.include "data/maps/Route113_GlassWorkshop/header.s"
	.include "data/maps/Route123_BerryMastersHouse/header.s"
	.include "data/maps/Route119_WeatherInstitute_1F/header.s"
	.include "data/maps/Route119_WeatherInstitute_2F/header.s"
	.include "data/maps/Route119_House/header.s"
	.include "data/maps/Route124_DivingTreasureHuntersHouse/header.s"
	.include "data/maps/_groups.s"
	.global gUnknown_08308588
gUnknown_08308588: @ 8308588

	.align 2
gMapGroups:: @ 8308588
	.4byte gMapGroup0
	.4byte gMapGroup1
	.4byte gMapGroup2
	.4byte gMapGroup3
	.4byte gMapGroup4
	.4byte gMapGroup5
	.4byte gMapGroup6
	.4byte gMapGroup7
	.4byte gMapGroup8
	.4byte gMapGroup9
	.4byte gMapGroup10
	.4byte gMapGroup11
	.4byte gMapGroup12
	.4byte gMapGroup13
	.4byte gMapGroup14
	.4byte gMapGroup15
	.4byte gMapGroup16
	.4byte gMapGroup17
	.4byte gMapGroup18
	.4byte gMapGroup19
	.4byte gMapGroup20
	.4byte gMapGroup21
	.4byte gMapGroup22
	.4byte gMapGroup23
	.4byte gMapGroup24
	.4byte gMapGroup25
	.4byte gMapGroup26
	.4byte gMapGroup27
	.4byte gMapGroup28
	.4byte gMapGroup29
	.4byte gMapGroup30
	.4byte gMapGroup31
	.4byte gMapGroup32
	.4byte gMapGroup33

	.include "data/maps/LittlerootTown/connections.s"
	.include "data/maps/OldaleTown/connections.s"
	.include "data/maps/DewfordTown/connections.s"
	.include "data/maps/LavaridgeTown/connections.s"
	.include "data/maps/FallarborTown/connections.s"
	.include "data/maps/VerdanturfTown/connections.s"
	.include "data/maps/PacifidlogTown/connections.s"
	.include "data/maps/PetalburgCity/connections.s"
	.include "data/maps/SlateportCity/connections.s"
	.include "data/maps/MauvilleCity/connections.s"
	.include "data/maps/RustboroCity/connections.s"
	.include "data/maps/FortreeCity/connections.s"
	.include "data/maps/LilycoveCity/connections.s"
	.include "data/maps/MossdeepCity/connections.s"
	.include "data/maps/EverGrandeCity/connections.s"
	.include "data/maps/Route101/connections.s"
	.include "data/maps/Route102/connections.s"
	.include "data/maps/Route103/connections.s"
	.include "data/maps/Route104/connections.s"
	.include "data/maps/Route105/connections.s"
	.include "data/maps/Route106/connections.s"
	.include "data/maps/Route107/connections.s"
	.include "data/maps/Route108/connections.s"
	.include "data/maps/Route109/connections.s"
	.include "data/maps/Route110/connections.s"
	.include "data/maps/Route111/connections.s"
	.include "data/maps/Route112/connections.s"
	.include "data/maps/Route113/connections.s"
	.include "data/maps/Route114/connections.s"
	.include "data/maps/Route115/connections.s"
	.include "data/maps/Route116/connections.s"
	.include "data/maps/Route117/connections.s"
	.include "data/maps/Route118/connections.s"
	.include "data/maps/Route119/connections.s"
	.include "data/maps/Route120/connections.s"
	.include "data/maps/Route121/connections.s"
	.include "data/maps/Route122/connections.s"
	.include "data/maps/Route123/connections.s"
	.include "data/maps/Route124/connections.s"
	.include "data/maps/Route125/connections.s"
	.include "data/maps/Route126/connections.s"
	.include "data/maps/Route127/connections.s"
	.include "data/maps/Route128/connections.s"
	.include "data/maps/Route129/connections.s"
	.include "data/maps/Route130/connections.s"
	.include "data/maps/Route131/connections.s"
	.include "data/maps/Route132/connections.s"
	.include "data/maps/Route133/connections.s"
	.include "data/maps/Route134/connections.s"
	.include "data/maps/Underwater1/connections.s"
	.include "data/maps/Underwater2/connections.s"
	.include "data/maps/Underwater3/connections.s"
	.include "data/maps/Underwater4/connections.s"
	.include "data/maps/SafariZone_Northwest/connections.s"
	.include "data/maps/SafariZone_Northeast/connections.s"
	.include "data/maps/SafariZone_Southwest/connections.s"
	.include "data/maps/SafariZone_Southeast/connections.s"

	.global gUnknown_08308E28
gUnknown_08308E28: @ 8308E28
	.space 4

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

	.align 2
	.global gUnknown_0830FB58
gUnknown_0830FB58: @ 830FB58
	.4byte MetatileBehavior_IsTrickHouseSlipperyFloor
	.4byte MetatileBehavior_IsIce_2
	.4byte MetatileBehavior_IsWalkSouth
	.4byte MetatileBehavior_IsWalkNorth
	.4byte MetatileBehavior_IsWalkWest
	.4byte MetatileBehavior_IsWalkEast
	.4byte MetatileBehavior_IsSouthwardCurrent
	.4byte MetatileBehavior_IsNorthwardCurrent
	.4byte MetatileBehavior_IsWestwardCurrent
	.4byte MetatileBehavior_IsEastwardCurrent
	.4byte MetatileBehavior_IsSlideSouth
	.4byte MetatileBehavior_IsSlideNorth
	.4byte MetatileBehavior_IsSlideWest
	.4byte MetatileBehavior_IsSlideEast
	.4byte MetatileBehavior_IsWaterfall
	.4byte MetatileBehavior_0xBB
	.4byte MetatileBehavior_0xBC
	.4byte MetatileBehavior_IsMuddySlope

	.align 2
	.global gUnknown_0830FBA0
gUnknown_0830FBA0: @ 830FBA0
	.4byte ForcedMovement_None
	.4byte ForcedMovement_Slip
	.4byte ForcedMovement_Slip
	.4byte sub_8058AAC
	.4byte sub_8058AC4
	.4byte sub_8058ADC
	.4byte sub_8058AF4
	.4byte sub_8058B0C
	.4byte sub_8058B24
	.4byte sub_8058B3C
	.4byte sub_8058B54
	.4byte ForcedMovement_SlideSouth
	.4byte ForcedMovement_SlideNorth
	.4byte ForcedMovement_SlideWest
	.4byte ForcedMovement_SlideEast
	.4byte sub_8058B0C
	.4byte sub_8058C04
	.4byte sub_8058C10
	.4byte ForcedMovement_MuddySlope

	.align 2
	.global gUnknown_0830FBEC
gUnknown_0830FBEC: @ 830FBEC
	.4byte PlayerNotOnBikeNotMoving
	.4byte PlayerNotOnBikeTurningInPlace
	.4byte sub_8058D0C

	.align 2
	.global gUnknown_0830FBF8
gUnknown_0830FBF8: @ 830FBF8
	.4byte MetatileBehavior_IsBumpySlope
	.4byte MetatileBehavior_IsIsolatedVerticalRail
	.4byte MetatileBehavior_IsIsolatedHorizontalRail
	.4byte MetatileBehavior_IsVerticalRail
	.4byte MetatileBehavior_IsHorizontalRail

	.global gUnknown_0830FC0C
gUnknown_0830FC0C: @ 830FC0C
	.incbin "baserom.gba", 0x0030fc0c, 0x8

	.align 2
	.global gUnknown_0830FC14
gUnknown_0830FC14: @ 830FC14
	.4byte PlayerAvatarTransition_Normal
	.4byte PlayerAvatarTransition_MachBike
	.4byte PlayerAvatarTransition_AcroBike
	.4byte PlayerAvatarTransition_Surfing
	.4byte PlayerAvatarTransition_Underwater
	.4byte sub_80591F4
	.4byte nullsub_49
	.4byte nullsub_49

	.align 2
	.global gUnknown_0830FC34
gUnknown_0830FC34: @ 830FC34
	.4byte MetatileBehavior_IsSouthArrowWarp
	.4byte MetatileBehavior_IsNorthArrowWarp
	.4byte MetatileBehavior_IsWestArrowWarp
	.4byte MetatileBehavior_IsEastArrowWarp

	.global gUnknown_0830FC44
gUnknown_0830FC44: @ 830FC44
	.incbin "baserom.gba", 0x0030fc44, 0x10

	.global gUnknown_0830FC54
gUnknown_0830FC54: @ 830FC54
	.incbin "baserom.gba", 0x0030fc54, 0x10

	.global gUnknown_0830FC64
gUnknown_0830FC64: @ 830FC64
	.incbin "baserom.gba", 0x0030fc64, 0x14

	.align 2
	.global gUnknown_0830FC78
gUnknown_0830FC78: @ 830FC78
	.4byte MetatileBehavior_IsSouthArrowWarp
	.4byte MetatileBehavior_IsNorthArrowWarp
	.4byte MetatileBehavior_IsWestArrowWarp
	.4byte MetatileBehavior_IsEastArrowWarp

	.align 2
	.global gUnknown_0830FC88
gUnknown_0830FC88: @ 830FC88
	.4byte sub_8059E84
	.4byte sub_8059EA4
	.4byte sub_8059F40

	.global gUnknown_0830FC94
gUnknown_0830FC94: @ 830FC94
	.4byte sub_805A000

	.align 2
	.global gUnknown_0830FC98
gUnknown_0830FC98: @ 830FC98
	.4byte sub_805A0D8
	.4byte sub_805A100
	.4byte sub_805A178
	.4byte sub_805A1B8

	.global gUnknown_0830FCA8
gUnknown_0830FCA8: @ 830FCA8
	.incbin "baserom.gba", 0x0030fca8, 0x4

	.global gUnknown_0830FCAC
gUnknown_0830FCAC: @ 830FCAC
	.incbin "baserom.gba", 0x0030fcac, 0x8

	.align 2
	.global gUnknown_0830FCB4
gUnknown_0830FCB4: @ 830FCB4
	.4byte sub_805A3B4
	.4byte fish1
	.4byte fish2
	.4byte fish3
	.4byte fish4
	.4byte party_menu_update_status_condition_object
	.4byte sub_805A5CC
	.4byte fish7
	.4byte fish8
	.4byte sub_805A6B4
	.4byte sub_805A6DC
	.4byte sub_805A7BC
	.4byte sub_805A808
	.4byte fishD
	.4byte sub_805A874
	.4byte fishF

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

	.align 2
	.global gUnknown_0830FD3C
gUnknown_0830FD3C: @ 830FD3C
	.4byte CameraObject_0
	.4byte CameraObject_1
	.4byte CameraObject_2

@ 830FD48
	.include "data/graphics/field_objects/map_object_graphics.s"

@ 8368528
	.include "data/graphics/field_objects/field_effect_object_graphics.s"

	.align 2
	.global gUnknown_0836DA88
gUnknown_0836DA88: @ 836DA88
	.4byte sub_805C884
	.4byte sub_805CDE8
	.4byte sub_805C8AC
	.4byte sub_805CF28
	.4byte sub_805CF28
	.4byte sub_805D0AC
	.4byte sub_805D0AC
	.4byte sub_805D230
	.4byte sub_805D230
	.4byte sub_805D230
	.4byte sub_805D230
	.4byte sub_80587B4
	.4byte FieldObjectCB_BerryTree
	.4byte sub_805D4F4
	.4byte sub_805D634
	.4byte sub_805D774
	.4byte sub_805D8B4
	.4byte sub_805D9F4
	.4byte sub_805DB34
	.4byte sub_805DC74
	.4byte sub_805DDB4
	.4byte sub_805DEF4
	.4byte sub_805E034
	.4byte sub_805E174
	.4byte sub_805E278
	.4byte sub_805E37C
	.4byte sub_805E37C
	.4byte sub_805E37C
	.4byte sub_805E37C
	.4byte sub_805E5DC
	.4byte sub_805E668
	.4byte sub_805E6F4
	.4byte sub_805E780
	.4byte sub_805E80C
	.4byte sub_805E898
	.4byte sub_805E924
	.4byte sub_805E9B0
	.4byte sub_805EA3C
	.4byte sub_805EAC8
	.4byte sub_805EB54
	.4byte sub_805EBE0
	.4byte sub_805EC6C
	.4byte sub_805ECF8
	.4byte sub_805ED84
	.4byte sub_805EE10
	.4byte sub_805EE9C
	.4byte sub_805EF28
	.4byte sub_805EFB4
	.4byte sub_805F040
	.4byte sub_805F0CC
	.4byte sub_805F158
	.4byte sub_805F1E4
	.4byte sub_805F270
	.4byte sub_805F2FC
	.4byte sub_805F2FC
	.4byte sub_805F2FC
	.4byte sub_805F2FC
	.4byte FieldObjectCB_TreeDisguise
	.4byte FieldObjectCB_MountainDisguise
	.4byte sub_805F8E0
	.4byte sub_805F8E0
	.4byte sub_805F8E0
	.4byte sub_805F8E0
	.4byte FieldObjectCB_Hidden1
	.4byte sub_805FB20
	.4byte sub_805FB20
	.4byte sub_805FB20
	.4byte sub_805FB20
	.4byte sub_805FB90
	.4byte sub_805FB90
	.4byte sub_805FB90
	.4byte sub_805FB90
	.4byte sub_805FC00
	.4byte sub_805FC00
	.4byte sub_805FC00
	.4byte sub_805FC00
	.4byte sub_805FC70

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
Unknown_83738E4:
	.incbin "baserom.gba", 0x003738e4, 0x68
Unknown_837394C:
	.incbin "baserom.gba", 0x0037394C, 0x14
Unknown_8373960:
	.incbin "baserom.gba", 0x00373960, 0x14
Unknown_8373974:
	.incbin "baserom.gba", 0x00373974, 0x14
Unknown_8373988:
	.incbin "baserom.gba", 0x00373988, 0x14

	.align 2
	.global gUnknown_0837399C
gUnknown_0837399C: @ 837399C
	.4byte Unknown_837394C
	.4byte Unknown_8373960
	.4byte Unknown_8373974
	.4byte Unknown_8373988

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

	.align 2
	.global gUnknown_08375224
gUnknown_08375224: @ 8375224
	.4byte sub_805C8F0
	.4byte sub_805C904
	.4byte sub_805C930
	.4byte sub_805C96C
	.4byte sub_805C98C
	.4byte sub_805C9D8
	.4byte sub_805CA08

	.global gUnknown_08375240
gUnknown_08375240: @ 8375240
	.incbin "baserom.gba", 0x00375240, 0x4

	.align 2
	.global gUnknown_08375244
gUnknown_08375244: @ 8375244
	.4byte sub_805CAAC
	.4byte sub_805CADC
	.4byte sub_805CAEC
	.4byte sub_805CB00
	.4byte sub_805CB5C
	.4byte sub_805CBB8
	.4byte sub_805CC14
	.4byte sub_805CC70
	.4byte sub_805CCAC
	.4byte sub_805CCE8
	.4byte sub_805CD24

	.align 2
	.global gUnknown_08375270
gUnknown_08375270: @ 8375270
	.4byte sub_805CE2C
	.4byte sub_805CE40
	.4byte sub_805CE6C
	.4byte sub_805CEB0
	.4byte sub_805CEE0

	.align 2
	.global gUnknown_08375284
gUnknown_08375284: @ 8375284
	.4byte sub_805CF6C
	.4byte sub_805CF80
	.4byte sub_805CFAC
	.4byte sub_805CFE8
	.4byte sub_805D008
	.4byte sub_805D054
	.4byte sub_805D084

	.global gUnknown_083752A0
gUnknown_083752A0: @ 83752A0
	.incbin "baserom.gba", 0x003752a0, 0x4

	.align 2
	.global gUnknown_083752A4
gUnknown_083752A4: @ 83752A4
	.4byte sub_805D0F0
	.4byte sub_805D104
	.4byte sub_805D130
	.4byte sub_805D16C
	.4byte sub_805D18C
	.4byte sub_805D1D8
	.4byte sub_805D208

	.global gUnknown_083752C0
gUnknown_083752C0: @ 83752C0
	.incbin "baserom.gba", 0x003752c0, 0x4

	.align 2
	.global gUnknown_083752C4
gUnknown_083752C4: @ 83752C4
	.4byte sub_805D274
	.4byte sub_805D2A0
	.4byte sub_805D2C0

	.align 2
	.global gUnknown_083752D0
gUnknown_083752D0: @ 83752D0
	.4byte do_berry_tree_growth_sparkle_1
	.4byte sub_805D3EC
	.4byte do_berry_tree_growth_sparkle_2
	.4byte sub_805D458
	.4byte sub_805D4A8

	.align 2
	.global gUnknown_083752E4
gUnknown_083752E4: @ 83752E4
	.4byte sub_805D538
	.4byte sub_805D54C
	.4byte sub_805D578
	.4byte sub_805D5BC
	.4byte sub_805D5EC

	.align 2
	.global gUnknown_083752F8
gUnknown_083752F8: @ 83752F8
	.4byte sub_805D678
	.4byte sub_805D68C
	.4byte sub_805D6B8
	.4byte sub_805D6FC
	.4byte sub_805D72C

	.align 2
	.global gUnknown_0837530C
gUnknown_0837530C: @ 837530C
	.4byte sub_805D7B8
	.4byte sub_805D7CC
	.4byte sub_805D7F8
	.4byte sub_805D83C
	.4byte sub_805D86C

	.global gUnknown_08375320
gUnknown_08375320: @ 8375320
	.incbin "baserom.gba", 0x00375320, 0x4

	.align 2
	.global gUnknown_08375324
gUnknown_08375324: @ 8375324
	.4byte sub_805D8F8
	.4byte sub_805D90C
	.4byte sub_805D938
	.4byte sub_805D97C
	.4byte sub_805D9AC

	.global gUnknown_08375338
gUnknown_08375338: @ 8375338
	.incbin "baserom.gba", 0x00375338, 0x4

	.align 2
	.global gUnknown_0837533C
gUnknown_0837533C: @ 837533C
	.4byte sub_805DA38
	.4byte sub_805DA4C
	.4byte sub_805DA78
	.4byte sub_805DABC
	.4byte sub_805DAEC

	.global gUnknown_08375350
gUnknown_08375350: @ 8375350
	.incbin "baserom.gba", 0x00375350, 0x4

	.align 2
	.global gUnknown_08375354
gUnknown_08375354: @ 8375354
	.4byte sub_805DB78
	.4byte sub_805DB8C
	.4byte sub_805DBB8
	.4byte sub_805DBFC
	.4byte sub_805DC2C

	.global gUnknown_08375368
gUnknown_08375368: @ 8375368
	.incbin "baserom.gba", 0x00375368, 0x4

	.align 2
	.global gUnknown_0837536C
gUnknown_0837536C: @ 837536C
	.4byte sub_805DCB8
	.4byte sub_805DCCC
	.4byte sub_805DCF8
	.4byte sub_805DD3C
	.4byte sub_805DD6C

	.global gUnknown_08375380
gUnknown_08375380: @ 8375380
	.incbin "baserom.gba", 0x00375380, 0x4

	.align 2
	.global gUnknown_08375384
gUnknown_08375384: @ 8375384
	.4byte sub_805DDF8
	.4byte sub_805DE0C
	.4byte sub_805DE38
	.4byte sub_805DE7C
	.4byte sub_805DEAC

	.global gUnknown_08375398
gUnknown_08375398: @ 8375398
	.incbin "baserom.gba", 0x00375398, 0x4

	.align 2
	.global gUnknown_0837539C
gUnknown_0837539C: @ 837539C
	.4byte sub_805DF38
	.4byte sub_805DF4C
	.4byte sub_805DF78
	.4byte sub_805DFBC
	.4byte sub_805DFEC

	.global gUnknown_083753B0
gUnknown_083753B0: @ 83753B0
	.incbin "baserom.gba", 0x003753b0, 0x4

	.align 2
	.global gUnknown_083753B4
gUnknown_083753B4: @ 83753B4
	.4byte sub_805E078
	.4byte sub_805E08C
	.4byte sub_805E0B8
	.4byte sub_805E0FC
	.4byte sub_805E12C

	.global gUnknown_083753C8
gUnknown_083753C8: @ 83753C8
	.incbin "baserom.gba", 0x003753c8, 0x4

	.align 2
	.global gUnknown_083753CC
gUnknown_083753CC: @ 83753CC
	.4byte sub_805E1B8
	.4byte sub_805E1E4
	.4byte sub_805E208
	.4byte sub_805E234

	.global gUnknown_083753DC
gUnknown_083753DC: @ 83753DC
	.incbin "baserom.gba", 0x003753dc, 0x8

	.align 2
	.global gUnknown_083753E4
gUnknown_083753E4: @ 83753E4
	.4byte sub_805E2BC
	.4byte sub_805E2E8
	.4byte sub_805E30C
	.4byte sub_805E338

	.global gUnknown_083753F4
gUnknown_083753F4: @ 83753F4
	.incbin "baserom.gba", 0x003753f4, 0x8

	.align 2
	.global gUnknown_083753FC
gUnknown_083753FC: @ 83753FC
	.4byte sub_805E3C0
	.4byte sub_805E3D4
	.4byte sub_805E40C
	.4byte sub_805E4C4

	.align 2
	.global gUnknown_0837540C
gUnknown_0837540C: @ 837540C
	.4byte sub_805E4EC
	.4byte sub_805E620
	.4byte sub_805E5B4

	.global gUnknown_08375418
gUnknown_08375418: @ 8375418
	.incbin "baserom.gba", 0x00375418, 0x4

	.align 2
	.global gUnknown_0837541C
gUnknown_0837541C: @ 837541C
	.4byte sub_805E4EC
	.4byte sub_805E6AC
	.4byte sub_805E5B4

	.align 2
	.global gUnknown_08375428
gUnknown_08375428: @ 8375428
	.4byte 0x02010304

	.global gUnknown_0837542C
gUnknown_0837542C: @ 837542C
	.4byte sub_805E4EC
	.4byte sub_805E738
	.4byte sub_805E5B4

	.global gUnknown_08375438
gUnknown_08375438: @ 8375438
	.incbin "baserom.gba", 0x00375438, 0x4

	.align 2
	.global gUnknown_0837543C
gUnknown_0837543C: @ 837543C
	.4byte sub_805E4EC
	.4byte sub_805E7C4
	.4byte sub_805E5B4

	.global gUnknown_08375448
gUnknown_08375448: @ 8375448
	.incbin "baserom.gba", 0x00375448, 0x4

	.align 2
	.global gUnknown_0837544C
gUnknown_0837544C: @ 837544C
	.4byte sub_805E4EC
	.4byte sub_805E850
	.4byte sub_805E5B4

	.global gUnknown_08375458
gUnknown_08375458: @ 8375458
	.incbin "baserom.gba", 0x00375458, 0x4

	.align 2
	.global gUnknown_0837545C
gUnknown_0837545C: @ 837545C
	.4byte sub_805E4EC
	.4byte sub_805E8DC
	.4byte sub_805E5B4

	.global gUnknown_08375468
gUnknown_08375468: @ 8375468
	.4byte 0x02010403

	.align 2
	.global gUnknown_0837546C
gUnknown_0837546C: @ 837546C
	.4byte sub_805E4EC
	.4byte sub_805E968
	.4byte sub_805E5B4

	.align 2
	.global gUnknown_08375478
gUnknown_08375478: @ 8375478
	.4byte sub_805E4EC
	.4byte sub_805E9F4
	.4byte sub_805E5B4

	.global gUnknown_08375484
gUnknown_08375484: @ 8375484
	.incbin "baserom.gba", 0x00375484, 0x4

	.align 2
	.global gUnknown_08375488
gUnknown_08375488: @ 8375488
	.4byte sub_805E4EC
	.4byte sub_805EA80
	.4byte sub_805E5B4

	.global gUnknown_08375494
gUnknown_08375494: @ 8375494
	.incbin "baserom.gba", 0x00375494, 0x4

	.align 2
	.global gUnknown_08375498
gUnknown_08375498: @ 8375498
	.4byte sub_805E4EC
	.4byte sub_805EB0C
	.4byte sub_805E5B4

	.global gUnknown_083754A4
gUnknown_083754A4: @ 83754A4
	.incbin "baserom.gba", 0x003754a4, 0x4

	.align 2
	.global gUnknown_083754A8
gUnknown_083754A8: @ 83754A8
	.4byte sub_805E4EC
	.4byte sub_805EB98
	.4byte sub_805E5B4

	.global gUnknown_083754B4
gUnknown_083754B4: @ 83754B4
	.incbin "baserom.gba", 0x003754b4, 0x4

	.align 2
	.global gUnknown_083754B8
gUnknown_083754B8: @ 83754B8
	.4byte sub_805E4EC
	.4byte sub_805EC24
	.4byte sub_805E5B4

	.global gUnknown_083754C4
gUnknown_083754C4: @ 83754C4
	.4byte 0x02030401

	.align 2
	.global gUnknown_083754C8
gUnknown_083754C8: @ 83754C8
	.4byte sub_805E4EC
	.4byte sub_805ECB0
	.4byte sub_805E5B4

	.global gUnknown_083754D4
gUnknown_083754D4: @ 83754D4
	.incbin "baserom.gba", 0x003754d4, 0x4

	.align 2
	.global gUnknown_083754D8
gUnknown_083754D8: @ 83754D8
	.4byte sub_805E4EC
	.4byte sub_805ED3C
	.4byte sub_805E5B4

	.global gUnknown_083754E4
gUnknown_083754E4: @ 83754E4
	.incbin "baserom.gba", 0x003754e4, 0x4

	.align 2
	.global gUnknown_083754E8
gUnknown_083754E8: @ 83754E8
	.4byte sub_805E4EC
	.4byte sub_805EDC8
	.4byte sub_805E5B4

	.global gUnknown_083754F4
gUnknown_083754F4: @ 83754F4
	.incbin "baserom.gba", 0x003754f4, 0x4

	.align 2
	.global gUnknown_083754F8
gUnknown_083754F8: @ 83754F8
	.4byte sub_805E4EC
	.4byte sub_805EE54
	.4byte sub_805E5B4

	.global gUnknown_08375504
gUnknown_08375504: @ 8375504
	.incbin "baserom.gba", 0x00375504, 0x4

	.align 2
	.global gUnknown_08375508
gUnknown_08375508: @ 8375508
	.4byte sub_805E4EC
	.4byte sub_805EEE0
	.4byte sub_805E5B4

	.global gUnknown_08375514
gUnknown_08375514: @ 8375514
	.incbin "baserom.gba", 0x00375514, 0x4

	.align 2
	.global gUnknown_08375518
gUnknown_08375518: @ 8375518
	.4byte sub_805E4EC
	.4byte sub_805EF6C
	.4byte sub_805E5B4

	.global gUnknown_08375524
gUnknown_08375524: @ 8375524
	.incbin "baserom.gba", 0x00375524, 0x4

	.align 2
	.global gUnknown_08375528
gUnknown_08375528: @ 8375528
	.4byte sub_805E4EC
	.4byte sub_805EFF8
	.4byte sub_805E5B4

	.global gUnknown_08375534
gUnknown_08375534: @ 8375534
	.incbin "baserom.gba", 0x00375534, 0x4

	.align 2
	.global gUnknown_08375538
gUnknown_08375538: @ 8375538
	.4byte sub_805E4EC
	.4byte sub_805F084
	.4byte sub_805E5B4

	.global gUnknown_08375544
gUnknown_08375544: @ 8375544
	.incbin "baserom.gba", 0x00375544, 0x4

	.align 2
	.global gUnknown_08375548
gUnknown_08375548: @ 8375548
	.4byte sub_805E4EC
	.4byte sub_805F110
	.4byte sub_805E5B4

	.global gUnknown_08375554
gUnknown_08375554: @ 8375554
	.incbin "baserom.gba", 0x00375554, 0x4

	.align 2
	.global gUnknown_08375558
gUnknown_08375558: @ 8375558
	.4byte sub_805E4EC
	.4byte sub_805F19C
	.4byte sub_805E5B4

	.global gUnknown_08375564
gUnknown_08375564: @ 8375564
	.incbin "baserom.gba", 0x00375564, 0x4

	.align 2
	.global gUnknown_08375568
gUnknown_08375568: @ 8375568
	.4byte sub_805E4EC
	.4byte sub_805F228
	.4byte sub_805E5B4

	.global gUnknown_08375574
gUnknown_08375574: @ 8375574
	.incbin "baserom.gba", 0x00375574, 0x4

	.align 2
	.global gUnknown_08375578
gUnknown_08375578: @ 8375578
	.4byte sub_805E4EC
	.4byte sub_805F2B4
	.4byte sub_805E5B4

	.align 2
	.global gUnknown_08375584
gUnknown_08375584: @ 8375584
	.4byte 0x02030104

	.align 2
	.global gUnknown_08375588
gUnknown_08375588: @ 8375588
	.4byte mss_npc_reset_oampriv3_1_unk2_unk3
	.4byte sub_805F364
	.4byte sub_805F3C4

	.align 2
	.global gUnknown_08375594
gUnknown_08375594: @ 8375594
	.4byte sub_805F3EC
	.4byte sub_805F3F0
	.4byte sub_805F438
	.4byte sub_805F4F0
	.4byte sub_805F5A8
	.4byte sub_805F660
	.4byte cph_IM_DIFFERENT
	.4byte sub_805F760
	.4byte oac_hopping
	.4byte sub_805F3EC
	.4byte sub_805F3EC

	.align 2
	.global gUnknown_083755C0
gUnknown_083755C0: @ 83755C0
	.4byte mss_npc_reset_oampriv3_1_unk2_unk3
	.4byte mss_08062EA4
	.4byte sub_805F3C4

	.align 2
	.global gUnknown_083755CC
gUnknown_083755CC: @ 83755CC
	.4byte sub_805FAF8

	.align 2
	.global gUnknown_083755D0
gUnknown_083755D0: @ 83755D0
	.4byte sub_805FB64
	.4byte sub_805FB04

	.align 2
	.global gUnknown_083755D8
gUnknown_083755D8: @ 83755D8
	.4byte sub_805FBD4
	.4byte sub_805FB04

	.align 2
	.global gUnknown_083755E0
gUnknown_083755E0: @ 83755E0
	.4byte sub_805FC44
	.4byte sub_805FB04

	.align 2
	.global gUnknown_083755E8
gUnknown_083755E8: @ 83755E8
	.4byte sub_805FCB4
	.4byte sub_805FCE8
	.4byte sub_805FD08

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

	.align 2
	.global gUnknown_08375684
gUnknown_08375684: @ 8375684
	.4byte MetatileBehavior_IsSouthBlocked
	.4byte MetatileBehavior_IsNorthBlocked
	.4byte MetatileBehavior_IsWestBlocked
	.4byte MetatileBehavior_IsEastBlocked

	.align 2
	.global gUnknown_08375694
gUnknown_08375694: @ 8375694
	.4byte MetatileBehavior_IsNorthBlocked
	.4byte MetatileBehavior_IsSouthBlocked
	.4byte MetatileBehavior_IsEastBlocked
	.4byte MetatileBehavior_IsWestBlocked

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

	.align 2
	.global gUnknown_08375778
gUnknown_08375778: @ 8375778
	.4byte Unknown_83759A0
	.4byte Unknown_83759A8
	.4byte Unknown_83759B0
	.4byte Unknown_83759B8
	.4byte Unknown_83759D4
	.4byte Unknown_83759E0
	.4byte Unknown_83759EC
	.4byte Unknown_83759F8
	.4byte Unknown_8375A04
	.4byte Unknown_8375A10
	.4byte Unknown_8375A1C
	.4byte Unknown_8375A28
	.4byte Unknown_8375A40
	.4byte Unknown_8375A4C
	.4byte Unknown_8375A58
	.4byte Unknown_8375A64
	.4byte Unknown_8375A70
	.4byte Unknown_8375A7C
	.4byte Unknown_8375A88
	.4byte Unknown_8375A94
	.4byte Unknown_8375AA0
	.4byte Unknown_8375AAC
	.4byte Unknown_8375AB8
	.4byte Unknown_8375AC4
	.4byte Unknown_8375AD0
	.4byte Unknown_8375ADC
	.4byte Unknown_8375AE8
	.4byte Unknown_8375AF4
	.4byte Unknown_8375B00
	.4byte Unknown_8375B0C
	.4byte Unknown_8375B18
	.4byte Unknown_8375B24
	.4byte Unknown_8375B30
	.4byte Unknown_8375B3C
	.4byte Unknown_8375B48
	.4byte Unknown_8375B54
	.4byte Unknown_8375B60
	.4byte Unknown_8375B6C
	.4byte Unknown_8375B78
	.4byte Unknown_8375B84
	.4byte Unknown_8375B90
	.4byte Unknown_8375B9C
	.4byte Unknown_8375BA8
	.4byte Unknown_8375BB4
	.4byte Unknown_8375BC0
	.4byte Unknown_8375BCC
	.4byte Unknown_8375BD8
	.4byte Unknown_8375BE4
	.4byte Unknown_8375BF0
	.4byte Unknown_8375BFC
	.4byte Unknown_8375C08
	.4byte Unknown_8375C14
	.4byte Unknown_8375C20
	.4byte Unknown_8375C2C
	.4byte Unknown_8375C38
	.4byte Unknown_8375C44
	.4byte Unknown_8375C50
	.4byte Unknown_8375C5C
	.4byte Unknown_8375C68
	.4byte Unknown_8375C74
	.4byte Unknown_8375C80
	.4byte Unknown_8375C8C
	.4byte Unknown_8375C98
	.4byte Unknown_8375CA0
	.4byte Unknown_8375CA8
	.4byte Unknown_8375CB0
	.4byte Unknown_8375CB8
	.4byte Unknown_8375CC4
	.4byte Unknown_8375CD0
	.4byte Unknown_8375CDC
	.4byte Unknown_8375CE8
	.4byte Unknown_8375CF4
	.4byte Unknown_8375D00
	.4byte Unknown_8375D0C
	.4byte Unknown_8375D18
	.4byte Unknown_8375D24
	.4byte Unknown_8375D30
	.4byte Unknown_8375D3C
	.4byte Unknown_8375D48
	.4byte Unknown_8375D50
	.4byte Unknown_8375D5C
	.4byte Unknown_8375D64
	.4byte Unknown_8375D6C
	.4byte Unknown_8375D74
	.4byte Unknown_8375D7C
	.4byte Unknown_8375D84
	.4byte Unknown_8375D8C
	.4byte Unknown_8375D94
	.4byte Unknown_8375D9C
	.4byte Unknown_8375DA4
	.4byte Unknown_8375DB0
	.4byte Unknown_8375DC0
	.4byte Unknown_8375DD0
	.4byte Unknown_8375DD8
	.4byte Unknown_8375DE0
	.4byte Unknown_8375DE8
	.4byte Unknown_8375DF0
	.4byte Unknown_8375DFC
	.4byte Unknown_8375E08
	.4byte Unknown_8375E10
	.4byte Unknown_8375E18
	.4byte Unknown_8375E20
	.4byte Unknown_8375E28
	.4byte Unknown_8375E34
	.4byte Unknown_8375E40
	.4byte Unknown_8375E4C
	.4byte Unknown_8375E58
	.4byte Unknown_8375E64
	.4byte Unknown_8375E70
	.4byte Unknown_8375E7C
	.4byte Unknown_8375EB8
	.4byte Unknown_8375EC4
	.4byte Unknown_8375ED0
	.4byte Unknown_8375EDC
	.4byte Unknown_8375EE8
	.4byte Unknown_8375EF4
	.4byte Unknown_8375F00
	.4byte Unknown_8375F0C
	.4byte Unknown_8375F18
	.4byte Unknown_8375F24
	.4byte Unknown_8375F30
	.4byte Unknown_8375F3C
	.4byte Unknown_8375F48
	.4byte Unknown_8375F54
	.4byte Unknown_8375F60
	.4byte Unknown_8375F6C
	.4byte Unknown_8375F78
	.4byte Unknown_8375F84
	.4byte Unknown_8375F90
	.4byte Unknown_8375F9C
	.4byte Unknown_8375FA8
	.4byte Unknown_8375FB4
	.4byte Unknown_8375FC0
	.4byte Unknown_8375FCC
	.4byte Unknown_8375FD8
	.4byte Unknown_8375FE4
	.4byte Unknown_8375FF0
	.4byte Unknown_8375FFC

	.align 2
Unknown_83759A0:
	.4byte sub_8060CE0
	.4byte sub_8063474
Unknown_83759A8:
	.4byte sub_8060CF0
	.4byte sub_8063474
Unknown_83759B0:
	.4byte sub_8060D00
	.4byte sub_8063474
Unknown_83759B8:
	.4byte sub_8060D10
	.4byte sub_8063474

	.align 2
	.global gUnknown_083759C0
gUnknown_083759C0: @ 83759C0
	.4byte get_go_image_anim_num
	.4byte get_go_fast_image_anim_num
	.4byte get_go_fast_image_anim_num
	.4byte get_go_faster_image_anim_num
	.4byte sub_805FD78

Unknown_83759D4:
	.4byte sub_8060F3C
	.4byte sub_8060F5C
	.4byte sub_8063474
Unknown_83759E0:
	.4byte sub_8060F7C
	.4byte sub_8060F9C
	.4byte sub_8063474
Unknown_83759EC:
	.4byte sub_8060FBC
	.4byte sub_8060FDC
	.4byte sub_8063474
Unknown_83759F8:
	.4byte sub_8060FFC
	.4byte sub_806101C
	.4byte sub_8063474
Unknown_8375A04:
	.4byte sub_806103C
	.4byte sub_806105C
	.4byte sub_8063474
Unknown_8375A10:
	.4byte sub_806107C
	.4byte sub_806109C
	.4byte sub_8063474
Unknown_8375A1C:
	.4byte sub_80610BC
	.4byte sub_80610DC
	.4byte sub_8063474
Unknown_8375A28:
	.4byte sub_80610FC
	.4byte sub_806111C
	.4byte sub_8063474

	.global gUnknown_08375A34
gUnknown_08375A34: @ 8375A34
	.incbin "baserom.gba", 0x00375a34, 0x6

	.global gUnknown_08375A3A
gUnknown_08375A3A: @ 8375A3A
	.incbin "baserom.gba", 0x375A3A, 0x6
Unknown_8375A40:
	.incbin "baserom.gba", 0x375A40, 0xC
Unknown_8375A4C:
	.incbin "baserom.gba", 0x375A4C, 0xC
Unknown_8375A58:
	.incbin "baserom.gba", 0x375A58, 0xC
Unknown_8375A64:
	.incbin "baserom.gba", 0x375A64, 0xC
Unknown_8375A70:
	.incbin "baserom.gba", 0x375A70, 0xC
Unknown_8375A7C:
	.incbin "baserom.gba", 0x375A7C, 0xC
Unknown_8375A88:
	.incbin "baserom.gba", 0x375A88, 0xC
Unknown_8375A94:
	.incbin "baserom.gba", 0x375A94, 0xC
Unknown_8375AA0:
	.incbin "baserom.gba", 0x375AA0, 0xC
Unknown_8375AAC:
	.incbin "baserom.gba", 0x375AAC, 0xC
Unknown_8375AB8:
	.incbin "baserom.gba", 0x375AB8, 0xC
Unknown_8375AC4:
	.incbin "baserom.gba", 0x375AC4, 0xC
Unknown_8375AD0:
	.incbin "baserom.gba", 0x375AD0, 0xC
Unknown_8375ADC:
	.incbin "baserom.gba", 0x375ADC, 0xC
Unknown_8375AE8:
	.incbin "baserom.gba", 0x375AE8, 0xC
Unknown_8375AF4:
	.incbin "baserom.gba", 0x375AF4, 0xC
Unknown_8375B00:
	.incbin "baserom.gba", 0x375B00, 0xC
Unknown_8375B0C:
	.incbin "baserom.gba", 0x375B0C, 0xC
Unknown_8375B18:
	.incbin "baserom.gba", 0x375B18, 0xC
Unknown_8375B24:
	.incbin "baserom.gba", 0x375B24, 0xC
Unknown_8375B30:
	.incbin "baserom.gba", 0x375B30, 0xC
Unknown_8375B3C:
	.incbin "baserom.gba", 0x375B3C, 0xC
Unknown_8375B48:
	.incbin "baserom.gba", 0x375B48, 0xC
Unknown_8375B54:
	.incbin "baserom.gba", 0x375B54, 0xC
Unknown_8375B60:
	.incbin "baserom.gba", 0x375B60, 0xC
Unknown_8375B6C:
	.incbin "baserom.gba", 0x375B6C, 0xC
Unknown_8375B78:
	.incbin "baserom.gba", 0x375B78, 0xC
Unknown_8375B84:
	.incbin "baserom.gba", 0x375B84, 0xC
Unknown_8375B90:
	.incbin "baserom.gba", 0x375B90, 0xC
Unknown_8375B9C:
	.incbin "baserom.gba", 0x375B9C, 0xC
Unknown_8375BA8:
	.incbin "baserom.gba", 0x375BA8, 0xC
Unknown_8375BB4:
	.incbin "baserom.gba", 0x375BB4, 0xC
Unknown_8375BC0:
	.incbin "baserom.gba", 0x375BC0, 0xC
Unknown_8375BCC:
	.incbin "baserom.gba", 0x375BCC, 0xC
Unknown_8375BD8:
	.incbin "baserom.gba", 0x375BD8, 0xC
Unknown_8375BE4:
	.incbin "baserom.gba", 0x375BE4, 0xC
Unknown_8375BF0:
	.incbin "baserom.gba", 0x375BF0, 0xC
Unknown_8375BFC:
	.incbin "baserom.gba", 0x375BFC, 0xC
Unknown_8375C08:
	.incbin "baserom.gba", 0x375C08, 0xC
Unknown_8375C14:
	.incbin "baserom.gba", 0x375C14, 0xC
Unknown_8375C20:
	.incbin "baserom.gba", 0x375C20, 0xC
Unknown_8375C2C:
	.incbin "baserom.gba", 0x375C2C, 0xC
Unknown_8375C38:
	.incbin "baserom.gba", 0x375C38, 0xC
Unknown_8375C44:
	.incbin "baserom.gba", 0x375C44, 0xC
Unknown_8375C50:
	.incbin "baserom.gba", 0x375C50, 0xC
Unknown_8375C5C:
	.incbin "baserom.gba", 0x375C5C, 0xC
Unknown_8375C68:
	.incbin "baserom.gba", 0x375C68, 0xC
Unknown_8375C74:
	.incbin "baserom.gba", 0x375C74, 0xC
Unknown_8375C80:
	.incbin "baserom.gba", 0x375C80, 0xC
Unknown_8375C8C:
	.incbin "baserom.gba", 0x375C8C, 0xC
Unknown_8375C98:
	.incbin "baserom.gba", 0x375C98, 0x8
Unknown_8375CA0:
	.incbin "baserom.gba", 0x375CA0, 0x8
Unknown_8375CA8:
	.incbin "baserom.gba", 0x375CA8, 0x8
Unknown_8375CB0:
	.incbin "baserom.gba", 0x375CB0, 0x8
Unknown_8375CB8:
	.incbin "baserom.gba", 0x375CB8, 0xC
Unknown_8375CC4:
	.incbin "baserom.gba", 0x375CC4, 0xC
Unknown_8375CD0:
	.incbin "baserom.gba", 0x375CD0, 0xC
Unknown_8375CDC:
	.incbin "baserom.gba", 0x375CDC, 0xC
Unknown_8375CE8:
	.incbin "baserom.gba", 0x375CE8, 0xC
Unknown_8375CF4:
	.incbin "baserom.gba", 0x375CF4, 0xC
Unknown_8375D00:
	.incbin "baserom.gba", 0x375D00, 0xC
Unknown_8375D0C:
	.incbin "baserom.gba", 0x375D0C, 0xC
Unknown_8375D18:
	.incbin "baserom.gba", 0x375D18, 0xC
Unknown_8375D24:
	.incbin "baserom.gba", 0x375D24, 0xC
Unknown_8375D30:
	.incbin "baserom.gba", 0x375D30, 0xC
Unknown_8375D3C:
	.incbin "baserom.gba", 0x375D3C, 0xC
Unknown_8375D48:
	.incbin "baserom.gba", 0x375D48, 0x8
Unknown_8375D50:
	.incbin "baserom.gba", 0x375D50, 0xC
Unknown_8375D5C:
	.incbin "baserom.gba", 0x375D5C, 0x8
Unknown_8375D64:
	.incbin "baserom.gba", 0x375D64, 0x8
Unknown_8375D6C:
	.incbin "baserom.gba", 0x375D6C, 0x8
Unknown_8375D74:
	.incbin "baserom.gba", 0x375D74, 0x8
Unknown_8375D7C:
	.incbin "baserom.gba", 0x375D7C, 0x8
Unknown_8375D84:
	.incbin "baserom.gba", 0x375D84, 0x8
Unknown_8375D8C:
	.incbin "baserom.gba", 0x375D8C, 0x8
Unknown_8375D94:
	.incbin "baserom.gba", 0x375D94, 0x8
Unknown_8375D9C:
	.incbin "baserom.gba", 0x375D9C, 0x8
Unknown_8375DA4:
	.incbin "baserom.gba", 0x375DA4, 0xC
Unknown_8375DB0:
	.incbin "baserom.gba", 0x375DB0, 0x10
Unknown_8375DC0:
	.incbin "baserom.gba", 0x375DC0, 0x10
Unknown_8375DD0:
	.incbin "baserom.gba", 0x375DD0, 0x8
Unknown_8375DD8:
	.incbin "baserom.gba", 0x375DD8, 0x8
Unknown_8375DE0:
	.incbin "baserom.gba", 0x375DE0, 0x8
Unknown_8375DE8:
	.incbin "baserom.gba", 0x375DE8, 0x8
Unknown_8375DF0:
	.incbin "baserom.gba", 0x375DF0, 0xC
Unknown_8375DFC:
	.incbin "baserom.gba", 0x375DFC, 0xC
Unknown_8375E08:
	.incbin "baserom.gba", 0x375E08, 0x8
Unknown_8375E10:
	.incbin "baserom.gba", 0x375E10, 0x8
Unknown_8375E18:
	.incbin "baserom.gba", 0x375E18, 0x8
Unknown_8375E20:
	.incbin "baserom.gba", 0x375E20, 0x8
Unknown_8375E28:
	.incbin "baserom.gba", 0x375E28, 0xC
Unknown_8375E34:
	.incbin "baserom.gba", 0x375E34, 0xC
Unknown_8375E40:
	.incbin "baserom.gba", 0x375E40, 0xC
Unknown_8375E4C:
	.incbin "baserom.gba", 0x375E4C, 0xC
Unknown_8375E58:
	.incbin "baserom.gba", 0x375E58, 0xC
Unknown_8375E64:
	.incbin "baserom.gba", 0x375E64, 0xC
Unknown_8375E70:
	.incbin "baserom.gba", 0x375E70, 0xC
Unknown_8375E7C:
	.incbin "baserom.gba", 0x375E7C, 0x3C
Unknown_8375EB8:
	.incbin "baserom.gba", 0x375EB8, 0xC
Unknown_8375EC4:
	.incbin "baserom.gba", 0x375EC4, 0xC
Unknown_8375ED0:
	.incbin "baserom.gba", 0x375ED0, 0xC
Unknown_8375EDC:
	.incbin "baserom.gba", 0x375EDC, 0xC
Unknown_8375EE8:
	.incbin "baserom.gba", 0x375EE8, 0xC
Unknown_8375EF4:
	.incbin "baserom.gba", 0x375EF4, 0xC
Unknown_8375F00:
	.incbin "baserom.gba", 0x375F00, 0xC
Unknown_8375F0C:
	.incbin "baserom.gba", 0x375F0C, 0xC
Unknown_8375F18:
	.incbin "baserom.gba", 0x375F18, 0xC
Unknown_8375F24:
	.incbin "baserom.gba", 0x375F24, 0xC
Unknown_8375F30:
	.incbin "baserom.gba", 0x375F30, 0xC
Unknown_8375F3C:
	.incbin "baserom.gba", 0x375F3C, 0xC
Unknown_8375F48:
	.incbin "baserom.gba", 0x375F48, 0xC
Unknown_8375F54:
	.incbin "baserom.gba", 0x375F54, 0xC
Unknown_8375F60:
	.incbin "baserom.gba", 0x375F60, 0xC
Unknown_8375F6C:
	.incbin "baserom.gba", 0x375F6C, 0xC
Unknown_8375F78:
	.incbin "baserom.gba", 0x375F78, 0xC
Unknown_8375F84:
	.incbin "baserom.gba", 0x375F84, 0xC
Unknown_8375F90:
	.incbin "baserom.gba", 0x375F90, 0xC
Unknown_8375F9C:
	.incbin "baserom.gba", 0x375F9C, 0xC
Unknown_8375FA8:
	.incbin "baserom.gba", 0x375FA8, 0xC
Unknown_8375FB4:
	.incbin "baserom.gba", 0x375FB4, 0xC
Unknown_8375FC0:
	.incbin "baserom.gba", 0x375FC0, 0xC
Unknown_8375FCC:
	.incbin "baserom.gba", 0x375FCC, 0xC
Unknown_8375FD8:
	.incbin "baserom.gba", 0x375FD8, 0xC
Unknown_8375FE4:
	.incbin "baserom.gba", 0x375FE4, 0xC
Unknown_8375FF0:
	.incbin "baserom.gba", 0x375FF0, 0xC
Unknown_8375FFC:
	.incbin "baserom.gba", 0x375FFC, 0xC

	.global gUnknown_08376008
gUnknown_08376008: @ 8376008
	.incbin "baserom.gba", 0x00376008, 0x8

	.align 2
	.global gUnknown_08376010
gUnknown_08376010: @ 8376010
	.4byte MetatileBehavior_IsTallGrass
	.4byte MetatileBehavior_IsLongGrass
	.4byte MetatileBehavior_IsPuddle
	.4byte MetatileBehavior_IsSurfableWaterOrUnderwater
	.4byte MetatileBehavior_IsShallowFlowingWater
	.4byte sub_8056D9C

	.global gUnknown_08376028
gUnknown_08376028: @ 8376028
	.incbin "baserom.gba", 0x00376028, 0x18

	.align 2
	.global gUnknown_08376040
gUnknown_08376040: @ 8376040
	.4byte MetatileBehavior_IsJumpSouth
	.4byte MetatileBehavior_IsJumpNorth
	.4byte MetatileBehavior_IsJumpWest
	.4byte MetatileBehavior_IsJumpEast

	.global gUnknown_08376050
gUnknown_08376050: @ 8376050
	.incbin "baserom.gba", 0x00376050, 0x10

	.align 2
	.global gUnknown_08376060
gUnknown_08376060: @ 8376060
	.4byte 0x02020202 @ are these even pointers?
	.4byte 0x02010201
	.4byte 0x02010201
	.4byte 0x02000001

	.global gUnknown_08376070
gUnknown_08376070: @ 8376070
	.incbin "baserom.gba", 0x00376070, 0x10

	.align 2
	.global gUnknown_08376080
gUnknown_08376080: @ 8376080
	.4byte nullsub_50
	.4byte DoTracksGroundEffect_Footprints
	.4byte DoTracksGroundEffect_BikeTireTracks

	.global gUnknown_0837608C
gUnknown_0837608C: @ 837608C
	.incbin "baserom.gba", 0x0037608c, 0x4

	.global gUnknown_08376090
gUnknown_08376090: @ 8376090
	.incbin "baserom.gba", 0x00376090, 0x10

	.align 2
	.global gUnknown_083760A0
gUnknown_083760A0: @ 83760A0
	.4byte GroundEffect_SpawnOnTallGrass
	.4byte sub_8063E94
	.4byte sub_8063EE0
	.4byte sub_8063F2C
	.4byte GroundEffect_WaterReflection
	.4byte GroundEffect_IceReflection
	.4byte GroundEffect_FlowingWater
	.4byte sub_8063FA0
	.4byte sub_8063FCC
	.4byte GroundEffect_Ripple
	.4byte GroundEffect_StepOnPuddle
	.4byte GroundEffect_SandHeap
	.4byte GroundEffect_JumpOnTallGrass
	.4byte GroundEffect_JumpOnLongGrass
	.4byte GroundEffect_JumpOnShallowWater
	.4byte GroundEffect_JumpOnWater
	.4byte GroundEffect_JumpLandingDust
	.4byte GroundEffect_ShortGrass
	.4byte GroundEffect_HotSprings
	.4byte GroundEffect_Seaweed

	.align 2
Unknown_83760F0:
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step

	.align 2
Unknown_8376130:
	.4byte sub_806456C
	.4byte sub_806456C
	.4byte sub_806456C
	.4byte sub_806456C
	.4byte sub_806456C
	.4byte sub_806456C
	.4byte sub_806456C
	.4byte sub_806456C

	.align 2
Unknown_8376150:
	.4byte sub_806456C
	.4byte sub_8064590
	.4byte sub_8064590
	.4byte sub_806456C
	.4byte sub_8064590
	.4byte sub_8064590

	.align 2
Unknown_8376168:
	.4byte sub_80645B8
	.4byte sub_80645B8
	.4byte sub_80645B8
	.4byte sub_80645B8

	.align 2
Unknown_8376178:
	.4byte sub_80645DC
	.4byte sub_80645DC

	.align 2
	.global gUnknown_08376180
gUnknown_08376180: @ 8376180
	.4byte Unknown_83760F0
	.4byte Unknown_8376130
	.4byte Unknown_8376150
	.4byte Unknown_8376168
	.4byte Unknown_8376178

	.global gUnknown_08376194
gUnknown_08376194: @ 8376194
Unknown_8376194:
	.incbin "baserom.gba", 0x00376194, 0xA
Unknown_837619E:
	.incbin "baserom.gba", 0x0037619e, 0x10
Unknown_83761AE:
	.incbin "baserom.gba", 0x003761ae, 0x10
Unknown_83761BE:
	.incbin "baserom.gba", 0x003761be, 0x12

	.align 2
	.global gUnknown_083761D0
gUnknown_083761D0: @ 83761D0
	.4byte Unknown_837619E
	.4byte Unknown_83761AE
	.4byte Unknown_83761BE

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

	.align 2
	.global gUnknown_083761F0
gUnknown_083761F0: @ 83761F0
	.4byte 0x08e9addc
	.4byte 0x08e9aefc
	.4byte 0x08e9af1c
	.4byte 0x08e9b03c
	.4byte 0x08e9b05c
	.4byte 0x08e9b17c
	.4byte 0x08e9b19c
	.4byte 0x08e9b2bc
	.4byte 0x08e9b2dc
	.4byte 0x08e9b3fc
	.4byte 0x08e9b41c
	.4byte 0x08e9b53c
	.4byte 0x08e9b55c
	.4byte 0x08e9b67c
	.4byte 0x08e9b69c
	.4byte 0x08e9b7bc
	.4byte 0x08e9b7dc
	.4byte 0x08e9b8fc
	.4byte 0x08e9b91c
	.4byte 0x08e9ba3c
	.4byte 0x08e9ba5c
	.4byte 0x08e9bb7c
	.4byte 0x08e9bb9c
	.4byte 0x08e9bcbc
	.4byte 0x08e9bcdc
	.4byte 0x08e9bdfc
	.4byte 0x08e9be1c
	.4byte 0x08e9bf3c
	.4byte 0x08e9bf5c
	.4byte 0x08e9c07c
	.4byte 0x08e9c09c
	.4byte 0x08e9c1bc
	.4byte 0x08e9c1dc
	.4byte 0x08e9c2fc
	.4byte 0x08e9c31c
	.4byte 0x08e9c43c
	.4byte 0x08e9c45c
	.4byte 0x08e9c57c
	.4byte 0x08e9c59c
	.4byte 0x08e9c6bc

	.global gUnknown_08376290
gUnknown_08376290: @ 8376290
	.incbin "baserom.gba", 0x00376290, 0x48

	.global gUnknown_083762D8
gUnknown_083762D8: @ 83762D8
	.space 4

	.global gUnknown_083762DC
gUnknown_083762DC: @ 83762DC
	.incbin "baserom.gba", 0x003762dc, 0x14

	.align 2
	.global gUnknown_083762F0
gUnknown_083762F0: @ 83762F0
	.4byte 0x020231cc
	.4byte 0x020232cc
	.4byte 0x020233cc

	.global gUnknown_083762FC
gUnknown_083762FC: @ 83762FC
	.incbin "baserom.gba", 0x003762fc, 0x68

	.align 2
	.global gUnknown_08376364
gUnknown_08376364: @ 8376364
	.4byte nullsub_51
	.4byte sub_8069F64
	.4byte sub_8069AA0
	.4byte sub_8069864
	.4byte sub_8069DD4
	.4byte sub_80C7700
	.4byte sub_80BCF1C
	.4byte sub_806A07C

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
	.space 4

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
	obj_tiles 0x0837657c, 64, 0xd750

	.global gUnknown_083765E4
gUnknown_083765E4: @ 83765E4
	.incbin "baserom.gba", 0x003765e4, 0x28

	.global gUnknown_0837660C
gUnknown_0837660C: @ 837660C
	.incbin "baserom.gba", 0x0037660c, 0x18

	.align 2
	.global gUnknown_08376624
gUnknown_08376624: @ 8376624
	.4byte OtherText_ChoosePoke
	.4byte OtherText_MovePokeTo
	.4byte OtherText_TeachWhat
	.4byte OtherText_UseWhat
	.4byte OtherText_GiveWhat
	.4byte OtherText_DoWhat
	.4byte OtherText_NothingToCut
	.4byte OtherText_CantSurf
	.4byte OtherText_AlreadySurfing
	.4byte OtherText_CantUseThatHere
	.4byte OtherText_RestoreWhatMove
	.4byte OtherText_BoostPP
	.4byte OtherText_Terminator19
	.4byte OtherText_DoWhatWithItem
	.4byte OtherText_NoPokeForBattle
	.4byte OtherText_ChoosePoke2
	.4byte OtherText_NotEnoughHP
	.4byte OtherText_ThreePokeNeeded
	.4byte OtherText_PokeCantBeSame
	.4byte OtherText_NoIdenticalHoldItems
	.4byte OtherText_TeachWhichPoke

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

	.align 2
	.global gUnknown_08376D04
gUnknown_08376D04: @ 8376D04
	.4byte OtherText_HP
	.4byte OtherText_Attack
	.4byte OtherText_Defense
	.4byte OtherText_SpAtk
	.4byte OtherText_SpDef
	.4byte OtherText_Speed

	.global gUnknown_08376D1C
gUnknown_08376D1C: @ 8376D1C
	.incbin "baserom.gba", 0x00376d1c, 0x8

	.align 2
	.global gUnknown_08376D24
gUnknown_08376D24: @ 8376D24
	.4byte SystemText_Pokedex
	.4byte StartMenu_Pokedex
	.4byte SystemText_Pokemon
	.4byte sub_807144C
	.4byte SystemText_BAG
	.4byte sub_8071478
	.4byte SystemText_Pokenav
	.4byte sub_80714A4
	.4byte SystemText_Player
	.4byte sub_80714D0
	.4byte SystemText_Save
	.4byte sub_80714FC
	.4byte SystemText_Option
	.4byte sub_8071518
	.4byte SystemText_Exit
	.4byte sub_8071554
	.4byte SystemText_Retire
	.4byte sub_8071560
	.4byte SystemText_Player @ duplicate?
	.4byte sub_8071570

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
	.incbin "baserom.gba", 0x37ADB4, 0x10
Unknown_837ADC4:
	.incbin "baserom.gba", 0x37ADC4, 0x100
Unknown_837AEC4:
	.incbin "baserom.gba", 0x37AEC4, 0x100
Unknown_837AFC4:
	.incbin "baserom.gba", 0x37AFC4, 0x100
Unknown_837B0C4:
	.incbin "baserom.gba", 0x37B0C4, 0x100
Unknown_837B1C4:
	.incbin "baserom.gba", 0x37B1C4, 0x100
Unknown_837B2C4:
	.incbin "baserom.gba", 0x37B2C4, 0x100
Unknown_837B3C4:
	.incbin "baserom.gba", 0x37B3C4, 0x100
Unknown_837B4C4:
	.incbin "baserom.gba", 0x37B4C4, 0x100

	.align 2
	.global gUnknown_0837B5C4
gUnknown_0837B5C4: @ 837B5C4
Unknown_837B5C4:
	.4byte Unknown_837ADC4
	.4byte Unknown_837AEC4
	.4byte Unknown_837AFC4
	.4byte Unknown_837B0C4
	.4byte Unknown_837B1C4
	.4byte Unknown_837B2C4
	.4byte Unknown_837B3C4
	.4byte Unknown_837B4C4
Unknown_837B5E4:
Unknown_837B5E4:
	.incbin "baserom.gba", 0x37B5E4, 0x80
Unknown_837B664:
	.incbin "baserom.gba", 0x37B664, 0x80
Unknown_837B6E4:
	.incbin "baserom.gba", 0x37B6E4, 0x80
Unknown_837B764:
	.incbin "baserom.gba", 0x37B764, 0x80
Unknown_837B7E4:
	.incbin "baserom.gba", 0x37B7E4, 0x80
Unknown_837B864:
	.incbin "baserom.gba", 0x37B864, 0x80
Unknown_837B8E4:
	.incbin "baserom.gba", 0x37B8E4, 0x80
Unknown_837B964:
	.incbin "baserom.gba", 0x37B964, 0x80
Unknown_837B9E4:
	.incbin "baserom.gba", 0x37B9E4, 0x100

	.global gUnknown_0837BAE4
gUnknown_0837BAE4: @ 837BAE4
	.incbin "baserom.gba", 0x0037bae4, 0x20

	.global gUnknown_0837BB04
gUnknown_0837BB04: @ 837BB04
	.incbin "baserom.gba", 0x0037bb04, 0x20

	.align 2
	.global gUnknown_0837BB24
gUnknown_0837BB24: @ 837BB24
	.4byte Unknown_837B5E4
	.4byte Unknown_837B5E4
	.4byte Unknown_837B664
	.4byte Unknown_837B6E4
	.4byte Unknown_837B764
	.4byte Unknown_837B764
	.4byte Unknown_837B764
	.4byte Unknown_837B764
	.4byte Unknown_837B764
	.4byte Unknown_837B764
	.4byte Unknown_837B6E4
	.4byte Unknown_837B664

	.align 2
	.global gUnknown_0837BB54
gUnknown_0837BB54: @ 837BB54
	.4byte Unknown_837B864
	.4byte Unknown_837B864
	.4byte Unknown_837B8E4
	.4byte Unknown_837B964
	.4byte Unknown_837B9E4
	.4byte Unknown_837B9E4
	.4byte Unknown_837B9E4
	.4byte Unknown_837B9E4
	.4byte Unknown_837B9E4
	.4byte Unknown_837B9E4
	.4byte Unknown_837B964
	.4byte Unknown_837B8E4

	.align 2
	.global gUnknown_0837BB84
gUnknown_0837BB84: @ 837BB84
	.4byte Unknown_837B5E4
	.4byte Unknown_837B5E4
	.4byte Unknown_837B7E4
	.4byte Unknown_837B7E4

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
	.incbin "baserom.gba", 0x37C95C, 0x20
Unknown_837C97C:
	.incbin "baserom.gba", 0x37C97C, 0x80
Unknown_837C9FC:
	.incbin "baserom.gba", 0x37C9FC, 0x80

	.align 2
	.global gUnknown_0837CA7C
gUnknown_0837CA7C: @ 837CA7C
Unknown_837CA7C:
	.4byte Unknown_837C97C
	.4byte Unknown_837C9FC
Unknown_837CA84:
	.incbin "baserom.gba", 0x0037ca84, 0x180
Unknown_837CC04:
	.incbin "baserom.gba", 0x0037cc04, 0x180
Unknown_837CD84:
	.incbin "baserom.gba", 0x0037cd84, 0x900

	.align 2
	.global gUnknown_0837D684
gUnknown_0837D684: @ 837D684
	.4byte Unknown_837CA84
	.4byte Unknown_837CC04
	.4byte Unknown_837CD84

	.global gUnknown_0837D690
gUnknown_0837D690: @ 837D690
Unknown_837D690:
	.incbin "baserom.gba", 0x0037d690, 0x10c
Unknown_837D79C:
	.incbin "baserom.gba", 0x0037d79c, 0x20
Unknown_837D7BC:
	.incbin "baserom.gba", 0x0037d7bc, 0x20
Unknown_837D7DC:
	.incbin "baserom.gba", 0x0037d7dc, 0x20
Unknown_837D7FC:
	.incbin "baserom.gba", 0x0037d7fc, 0x40

	.align 2
	.global gUnknown_0837D83C
gUnknown_0837D83C: @ 837D83C
	.4byte Unknown_837D79C
	.4byte Unknown_837D7BC
	.4byte Unknown_837D7DC
	.4byte Unknown_837D7FC

	.global gUnknown_0837D84C
gUnknown_0837D84C: @ 837D84C
	.incbin "baserom.gba", 0x37D84C, 0x8
Unknown_837D854:
	.incbin "baserom.gba", 0x37D854, 0x200
Unknown_837DA54:
	.incbin "baserom.gba", 0x37DA54, 0x220

	.global gUnknown_0837DC74
gUnknown_0837DC74: @ 837DC74
Unknown_837DC74:
	.4byte Unknown_837D854
	.4byte Unknown_837DA54
Unknown_837DD7C:
	.incbin "baserom.gba", 0x0037dc7c, 0x120
Unknown_837DD9C:
	.incbin "baserom.gba", 0x0037dd9c, 0x140

	.align 2
	.global gUnknown_0837DEDC
gUnknown_0837DEDC: @ 837DEDC
	.4byte Unknown_837DD7C
	.4byte Unknown_837DD9C

	.global gDummyPaletteStructTemplate
gDummyPaletteStructTemplate: @ 837DEE4
	.incbin "baserom.gba", 0x0037dee4, 0x10

	.global gUnknown_0837DEF4
gUnknown_0837DEF4: @ 837DEF4
	.incbin "baserom.gba", 0x0037def4, 0x270

	.global gBattleAnimPicTable
gBattleAnimPicTable: @ 837E164
	obj_tiles 0x08d03308, 512, 0x2710
	obj_tiles 0x08d1ca44, 768, 0x2711
	obj_tiles 0x08d20b30, 512, 0x2712
	obj_tiles 0x08d033b8, 256, 0x2713
	obj_tiles 0x08d0342c, 512, 0x2714
	obj_tiles 0x08d034dc, 1024, 0x2715
	obj_tiles 0x08d035b0, 384, 0x2716
	obj_tiles 0x08d0379c, 2048, 0x2717
	obj_tiles 0x08d03938, 32, 0x2718
	obj_tiles 0x08d03d74, 1024, 0x2719
	obj_tiles 0x08d03994, 4608, 0x271a
	obj_tiles 0x08d0407c, 384, 0x271b
	obj_tiles 0x08d0411c, 128, 0x271c
	obj_tiles 0x08d04208, 128, 0x271d
	obj_tiles 0x08d1ff80, 640, 0x271e
	obj_tiles 0x08d04254, 128, 0x271f
	obj_tiles 0x08d042e8, 256, 0x2720
	obj_tiles 0x08d04368, 32, 0x2721
	obj_tiles 0x08d25128, 128, 0x2722
	obj_tiles 0x08d043c8, 1024, 0x2723
	obj_tiles 0x08d04488, 512, 0x2724
	obj_tiles 0x08d047f8, 2560, 0x2725
	obj_tiles 0x08d047f8, 2560, 0x2726
	obj_tiles 0x08d045a4, 896, 0x2727
	obj_tiles 0x08d04c70, 768, 0x2728
	obj_tiles 0x08d04b80, 2560, 0x2729
	obj_tiles 0x08d05264, 2560, 0x272a
	obj_tiles 0x08d055ec, 2560, 0x272b
	obj_tiles 0x08d05910, 2560, 0x272c
	obj_tiles 0x08d05c60, 2560, 0x272d
	obj_tiles 0x08d05f40, 2560, 0x272e
	obj_tiles 0x08d04d50, 3584, 0x272f
	obj_tiles 0x08d05178, 896, 0x2730
	obj_tiles 0x08d0634c, 4096, 0x2731
	obj_tiles 0x08d06cbc, 2048, 0x2732
	obj_tiles 0x08d07088, 2560, 0x2733
	obj_tiles 0x08d07448, 2048, 0x2734
	obj_tiles 0x08d0781c, 2560, 0x2735
	obj_tiles 0x08d08734, 2560, 0x2736
	obj_tiles 0x08d08958, 2560, 0x2737
	obj_tiles 0x08d08c54, 2560, 0x2738
	obj_tiles 0x08d08e60, 2560, 0x2739
	obj_tiles 0x08d09000, 2560, 0x273a
	obj_tiles 0x08d092f8, 2560, 0x273b
	obj_tiles 0x08d09748, 2560, 0x273c
	obj_tiles 0x08d099dc, 2560, 0x273d
	obj_tiles 0x08d09e5c, 4096, 0x273e
	obj_tiles 0x08d09e5c, 4096, 0x273f
	obj_tiles 0x08d0a280, 4096, 0x2740
	obj_tiles 0x08d0a280, 4096, 0x2741
	obj_tiles 0x08d0a58c, 512, 0x2742
	obj_tiles 0x08d0a62c, 512, 0x2743
	obj_tiles 0x08d0a6d8, 512, 0x2744
	obj_tiles 0x08d2ebdc, 2048, 0x2745
	obj_tiles 0x08d0a938, 128, 0x2746
	obj_tiles 0x08d0ae4c, 512, 0x2747
	obj_tiles 0x08d0a97c, 4096, 0x2748
	obj_tiles 0x08d0af10, 384, 0x2749
	obj_tiles 0x08d0afbc, 3072, 0x274a
	obj_tiles 0x08d0b44c, 256, 0x274b
	obj_tiles 0x08d0b4c8, 64, 0x274c
	obj_tiles 0x08d0b50c, 384, 0x274d
	obj_tiles 0x08d0b5dc, 2048, 0x274e
	obj_tiles 0x08d0b9d4, 1152, 0x274f
	obj_tiles 0x08d234b0, 512, 0x2750
	obj_tiles 0x08d0bc4c, 512, 0x2751
	obj_tiles 0x08d0bd80, 256, 0x2752
	obj_tiles 0x08d0bc4c, 512, 0x2753
	obj_tiles 0x08d0bc4c, 512, 0x2754
	obj_tiles 0x08d0bc4c, 512, 0x2755
	obj_tiles 0x08d0bdf4, 512, 0x2756
	obj_tiles 0x08d0be9c, 2560, 0x2757
	obj_tiles 0x08d0c0c8, 768, 0x2758
	obj_tiles 0x08d0c1b0, 384, 0x2759
	obj_tiles 0x08d1b600, 160, 0x275a
	obj_tiles 0x08d0c2ec, 1792, 0x275b
	obj_tiles 0x08d14e90, 1024, 0x275c
	obj_tiles 0x08d150f4, 512, 0x275d
	obj_tiles 0x08d0c58c, 768, 0x275e
	obj_tiles 0x08d0c74c, 3072, 0x275f
	obj_tiles 0x08d0cb7c, 2560, 0x2760
	obj_tiles 0x08d0cf04, 128, 0x2761
	obj_tiles 0x08d0d120, 64, 0x2762
	obj_tiles 0x08d0d3a8, 3584, 0x2763
	obj_tiles 0x08d0d84c, 3584, 0x2764
	obj_tiles 0x08d0dc10, 640, 0x2765
	obj_tiles 0x08d0dcc8, 512, 0x2766
	obj_tiles 0x08d250a8, 128, 0x2767
	obj_tiles 0x08d0de38, 192, 0x2768
	obj_tiles 0x08d0de88, 2560, 0x2769
	obj_tiles 0x08d0e0fc, 512, 0x276a
	obj_tiles 0x08d0e18c, 384, 0x276b
	obj_tiles 0x08d0e2c0, 128, 0x276c
	obj_tiles 0x08d0e33c, 4096, 0x276d
	obj_tiles 0x08d0ea0c, 2560, 0x276e
	obj_tiles 0x08d0ebb0, 384, 0x276f
	obj_tiles 0x08d0ec60, 896, 0x2770
	obj_tiles 0x08d0edd0, 3072, 0x2771
	obj_tiles 0x08d0efb0, 512, 0x2772
	obj_tiles 0x08d28098, 512, 0x2773
	obj_tiles 0x08d0f0e8, 512, 0x2774
	obj_tiles 0x08d0f1e8, 512, 0x2775
	obj_tiles 0x08d0f318, 1024, 0x2776
	obj_tiles 0x08d0f4b0, 128, 0x2777
	obj_tiles 0x08d0f51c, 1024, 0x2778
	obj_tiles 0x08d0f704, 3072, 0x2779
	obj_tiles 0x08d0fcb0, 512, 0x277a
	obj_tiles 0x08d0fda0, 4096, 0x277b
	obj_tiles 0x08d10174, 2560, 0x277c
	obj_tiles 0x08d104f8, 32, 0x277d
	obj_tiles 0x08d10548, 3584, 0x277e
	obj_tiles 0x08d1092c, 128, 0x277f
	obj_tiles 0x08d10994, 2560, 0x2780
	obj_tiles 0x08d10ce4, 1024, 0x2781
	obj_tiles 0x08d10f78, 512, 0x2782
	obj_tiles 0x08d11b74, 1792, 0x2783
	obj_tiles 0x08d1302c, 2048, 0x2784
	obj_tiles 0x08d13300, 2560, 0x2785
	obj_tiles 0x08d13558, 1536, 0x2786
	obj_tiles 0x08d1370c, 2048, 0x2787
	obj_tiles 0x08d139c4, 512, 0x2788
	obj_tiles 0x08d13ae0, 64, 0x2789
	obj_tiles 0x08d13b30, 384, 0x278a
	obj_tiles 0x08d13c48, 1536, 0x278b
	obj_tiles 0x08d13d84, 1536, 0x278c
	obj_tiles 0x08d14044, 512, 0x278d
	obj_tiles 0x08d14158, 128, 0x278e
	obj_tiles 0x08d141e0, 512, 0x278f
	obj_tiles 0x08d143a4, 2048, 0x2790
	obj_tiles 0x08d14630, 128, 0x2791
	obj_tiles 0x08d14694, 2560, 0x2792
	obj_tiles 0x08d14a8c, 640, 0x2793
	obj_tiles 0x08d14bfc, 640, 0x2794
	obj_tiles 0x08d14d1c, 256, 0x2795
	obj_tiles 0x08d14dc0, 512, 0x2796
	obj_tiles 0x08d1a704, 512, 0x2797
	obj_tiles 0x08d1a8a4, 32, 0x2798
	obj_tiles 0x08d1a8f0, 2560, 0x2799
	obj_tiles 0x08d1aea4, 2048, 0x279a
	obj_tiles 0x08d1aaf4, 2048, 0x279b
	obj_tiles 0x08d1aff0, 192, 0x279c
	obj_tiles 0x08d1b090, 448, 0x279d
	obj_tiles 0x08d1b1b8, 256, 0x279e
	obj_tiles 0x08d2cf58, 2048, 0x279f
	obj_tiles 0x08d1bfc8, 512, 0x27a0
	obj_tiles 0x08d1ad04, 2048, 0x27a1
	obj_tiles 0x08d03248, 384, 0x27a2
	obj_tiles 0x08d1b2d0, 384, 0x27a3
	obj_tiles 0x08d1b4dc, 512, 0x27a4
	obj_tiles 0x08d1b40c, 512, 0x27a5
	obj_tiles 0x08d1b68c, 384, 0x27a6
	obj_tiles 0x08d1b77c, 1024, 0x27a7
	obj_tiles 0x08d0419c, 128, 0x27a8
	obj_tiles 0x08d1b874, 256, 0x27a9
	obj_tiles 0x08d1b8f8, 256, 0x27aa
	obj_tiles 0x08d1b9c4, 320, 0x27ab
	obj_tiles 0x08d1baac, 2048, 0x27ac
	obj_tiles 0x08d1bcec, 512, 0x27ad
	obj_tiles 0x08d1bd68, 256, 0x27ae
	obj_tiles 0x08d1be54, 160, 0x27af
	obj_tiles 0x08d1bef8, 256, 0x27b0
	obj_tiles 0x08d0374c, 128, 0x27b1
	obj_tiles 0x08d1c1a4, 768, 0x27b2
	obj_tiles 0x08d1c248, 256, 0x27b3
	obj_tiles 0x08d1c248, 256, 0x27b4
	obj_tiles 0x08d1c248, 256, 0x27b5
	obj_tiles 0x08d1c308, 2048, 0x27b6
	obj_tiles 0x08d1c308, 2048, 0x27b7
	obj_tiles 0x08d1c308, 2048, 0x27b8
	obj_tiles 0x08d1c308, 2048, 0x27b9
	obj_tiles 0x08d1c308, 2048, 0x27ba
	obj_tiles 0x08d1c6b4, 128, 0x27bb
	obj_tiles 0x08d1bfc8, 512, 0x27bc
	obj_tiles 0x08d1cb20, 512, 0x27bd
	obj_tiles 0x08d1d960, 512, 0x27be
	obj_tiles 0x08d1da28, 128, 0x27bf
	obj_tiles 0x08d1dab4, 512, 0x27c0
	obj_tiles 0x08d1dc34, 1280, 0x27c1
	obj_tiles 0x08d1dd10, 2048, 0x27c2
	obj_tiles 0x08d1dec8, 1024, 0x27c3
	obj_tiles 0x08d1dfa4, 32, 0x27c4
	obj_tiles 0x08d1dfbc, 2048, 0x27c5
	obj_tiles 0x08d1e34c, 256, 0x27c6
	obj_tiles 0x08d1e418, 2048, 0x27c7
	obj_tiles 0x08d1e6b8, 1024, 0x27c8
	obj_tiles 0x08d1e834, 2560, 0x27c9
	obj_tiles 0x08d1f13c, 4096, 0x27ca
	obj_tiles 0x08d1ef2c, 2048, 0x27cb
	obj_tiles 0x08e71228, 1024, 0x27cc
	obj_tiles 0x08d20544, 512, 0x27cd
	obj_tiles 0x08d20030, 2048, 0x27ce
	obj_tiles 0x08d202b0, 2048, 0x27cf
	obj_tiles 0x08d205e8, 2048, 0x27d0
	obj_tiles 0x08d20890, 512, 0x27d1
	obj_tiles 0x08d20ff8, 2048, 0x27d2
	obj_tiles 0x08d21358, 512, 0x27d3
	obj_tiles 0x08d20c3c, 2048, 0x27d4
	obj_tiles 0x08d21430, 512, 0x27d5
	obj_tiles 0x08d215c8, 2048, 0x27d6
	obj_tiles 0x08d219e0, 1024, 0x27d7
	obj_tiles 0x08d21ac4, 512, 0x27d8
	obj_tiles 0x08d21c20, 2688, 0x27d9
	obj_tiles 0x08d22454, 1536, 0x27da
	obj_tiles 0x08d225e0, 2048, 0x27db
	obj_tiles 0x08d222b8, 512, 0x27dc
	obj_tiles 0x08d22a50, 1536, 0x27dd
	obj_tiles 0x08d227b0, 2048, 0x27de
	obj_tiles 0x08d22ca8, 384, 0x27df
	obj_tiles 0x08d22d98, 2048, 0x27e0
	obj_tiles 0x08d23188, 2048, 0x27e1
	obj_tiles 0x08d235c4, 128, 0x27e2
	obj_tiles 0x08d2465c, 128, 0x27e3
	obj_tiles 0x08d24428, 2048, 0x27e4
	obj_tiles 0x08d246ac, 2048, 0x27e5
	obj_tiles 0x08d2493c, 1536, 0x27e6
	obj_tiles 0x08d24bcc, 1536, 0x27e7
	obj_tiles 0x08d235c4, 128, 0x27e8
	obj_tiles 0x08d243a0, 128, 0x27e9
	obj_tiles 0x08d24ffc, 384, 0x27ea
	obj_tiles 0x08d235c4, 128, 0x27eb
	obj_tiles 0x08d251a8, 512, 0x27ec
	obj_tiles 0x08d252f4, 1024, 0x27ed
	obj_tiles 0x08d25558, 2560, 0x27ee
	obj_tiles 0x08d2588c, 2048, 0x27ef
	obj_tiles 0x08d25b40, 512, 0x27f0
	obj_tiles 0x08d27b10, 1024, 0x27f1
	obj_tiles 0x08d27e04, 128, 0x27f2
	obj_tiles 0x08d27cbc, 2048, 0x27f3
	obj_tiles 0x08d25ec8, 512, 0x27f4
	obj_tiles 0x08d27eb4, 768, 0x27f5
	obj_tiles 0x08d25c64, 2048, 0x27f6
	obj_tiles 0x08d28740, 896, 0x27f7
	obj_tiles 0x08d281e0, 2048, 0x27f8
	obj_tiles 0x08d28910, 192, 0x27f9
	obj_tiles 0x08d289bc, 2048, 0x27fa
	obj_tiles 0x08d28c2c, 96, 0x27fb
	obj_tiles 0x08d28c2c, 96, 0x27fc
	obj_tiles 0x08d28c2c, 96, 0x27fd
	obj_tiles 0x08d28ba0, 128, 0x27fe
	obj_tiles 0x08d2ce4c, 384, 0x27ff
	obj_tiles 0x08d2d1a0, 384, 0x2800
	obj_tiles 0x08d2d6f4, 512, 0x2801
	obj_tiles 0x08d2d91c, 512, 0x2802
	obj_tiles 0x08d2da7c, 32, 0x2803
	obj_tiles 0x08d2e900, 1024, 0x2804
	obj_tiles 0x08d2e2b4, 1536, 0x2805
	obj_tiles 0x08d2e458, 4096, 0x2806
	obj_tiles 0x08d2e9f8, 1024, 0x2807
	obj_tiles 0x08d2ef50, 32, 0x2808
	obj_tiles 0x08d2ef80, 128, 0x2809
	obj_tiles 0x08d2eff0, 2048, 0x280a
	obj_tiles 0x08d2f1e4, 128, 0x280b
	obj_tiles 0x08d2f260, 512, 0x280c
	obj_tiles 0x08d2f39c, 1024, 0x280d
	obj_tiles 0x08d2f5a0, 512, 0x280e
	obj_tiles 0x08d2f700, 512, 0x280f
	obj_tiles 0x08d2f89c, 2048, 0x2810
	obj_tiles 0x08d2fc50, 640, 0x2811
	obj_tiles 0x08d2f78c, 512, 0x2812
	obj_tiles 0x08d1b40c, 512, 0x2813
	obj_tiles 0x08e685a8, 1024, 0x2814
	obj_tiles 0x08e67d6c, 512, 0x2815
	obj_tiles 0x08e69308, 512, 0x2816
	obj_tiles 0x08e6e6ac, 128, 0x2817
	obj_tiles 0x08e695b8, 32, 0x2818
	obj_tiles 0x08e695b8, 32, 0x2819
	obj_tiles 0x08e6e704, 128, 0x281a
	obj_tiles 0x08d24428, 2048, 0x281b
	obj_tiles 0x08e695b8, 32, 0x281c
	obj_tiles 0x08e69a94, 128, 0x281d
	obj_tiles 0x08e7e9fc, 1024, 0x281e
	obj_tiles 0x08e7eb3c, 128, 0x281f
	obj_tiles 0x08e6982c, 2048, 0x2820
	obj_tiles 0x08e69a6c, 32, 0x2821
	obj_tiles 0x08e69b00, 2048, 0x2822
	obj_tiles 0x08e69c80, 2048, 0x2823
	obj_tiles 0x08e69dec, 2048, 0x2824
	obj_tiles 0x08e6da54, 4096, 0x2825
	obj_tiles 0x08e6e78c, 2048, 0x2826
	obj_tiles 0x08e6e9b4, 160, 0x2827
	obj_tiles 0x08e6a2e8, 2048, 0x2828
	obj_tiles 0x08e6ea1c, 512, 0x2829
	obj_tiles 0x08e7e7f8, 1536, 0x282a
	obj_tiles 0x08e6dfdc, 512, 0x282b
	obj_tiles 0x08e6f1c0, 2048, 0x282c
	obj_tiles 0x08e6f558, 512, 0x282d
	obj_tiles 0x08d1e418, 2048, 0x282e
	obj_tiles 0x08d0a97c, 4096, 0x282f
	obj_tiles 0x08d1c248, 256, 0x2830

	.global gBattleAnimPaletteTable
gBattleAnimPaletteTable: @ 837EA6C
	obj_pal 0x08d0369c, 0x2710
	obj_pal 0x08d1caf8, 0x2711
	obj_pal 0x08d20c14, 0x2712
	obj_pal 0x08d036c0, 0x2713
	obj_pal 0x08d036e8, 0x2714
	obj_pal 0x08d036fc, 0x2715
	obj_pal 0x08d03724, 0x2716
	obj_pal 0x08d03918, 0x2717
	obj_pal 0x08d03958, 0x2718
	obj_pal 0x08d0405c, 0x2719
	obj_pal 0x08d03974, 0x271a
	obj_pal 0x08d040f4, 0x271b
	obj_pal 0x08d04184, 0x271c
	obj_pal 0x08d0423c, 0x271d
	obj_pal 0x08d20014, 0x271e
	obj_pal 0x08d042c0, 0x271f
	obj_pal 0x08d04358, 0x2720
	obj_pal 0x08d04358, 0x2721
	obj_pal 0x08d25164, 0x2722
	obj_pal 0x08d043ac, 0x2723
	obj_pal 0x08d04554, 0x2724
	obj_pal 0x08d047d0, 0x2725
	obj_pal 0x08d04b30, 0x2726
	obj_pal 0x08d0457c, 0x2727
	obj_pal 0x08d04d3c, 0x2728
	obj_pal 0x08d04b58, 0x2729
	obj_pal 0x08d0559c, 0x272a
	obj_pal 0x08d055c4, 0x272b
	obj_pal 0x08d058e8, 0x272c
	obj_pal 0x08d05f18, 0x272d
	obj_pal 0x08d06300, 0x272e
	obj_pal 0x08d05130, 0x272f
	obj_pal 0x08d05150, 0x2730
	obj_pal 0x08d06324, 0x2731
	obj_pal 0x08d06324, 0x2732
	obj_pal 0x08d06324, 0x2733
	obj_pal 0x08d07420, 0x2734
	obj_pal 0x08d07420, 0x2735
	obj_pal 0x08d086e4, 0x2736
	obj_pal 0x08d0870c, 0x2737
	obj_pal 0x08d086e4, 0x2738
	obj_pal 0x08d086e4, 0x2739
	obj_pal 0x08d092d0, 0x273a
	obj_pal 0x08d096f8, 0x273b
	obj_pal 0x08d09720, 0x273c
	obj_pal 0x08d099b4, 0x273d
	obj_pal 0x08d0a23c, 0x273e
	obj_pal 0x08d0a25c, 0x273e
	obj_pal 0x08d0a518, 0x2740
	obj_pal 0x08d0a540, 0x2741
	obj_pal 0x08d0a568, 0x2742
	obj_pal 0x08d0a568, 0x2743
	obj_pal 0x08d0a568, 0x2744
	obj_pal 0x08d0559c, 0x2745
	obj_pal 0x08d0a964, 0x2746
	obj_pal 0x08d0a568, 0x2747
	obj_pal 0x08d0ae24, 0x2748
	obj_pal 0x08d0af98, 0x2749
	obj_pal 0x08d0b424, 0x274a
	obj_pal 0x08d0b4ac, 0x274b
	obj_pal 0x08d0b4f0, 0x274c
	obj_pal 0x08d0b5bc, 0x274d
	obj_pal 0x08d0b9ac, 0x274e
	obj_pal 0x08d0bb90, 0x274f
	obj_pal 0x08d235a0, 0x2750
	obj_pal 0x08d0bd60, 0x2751
	obj_pal 0x08d0bdcc, 0x2752
	obj_pal 0x08e69608, 0x2753
	obj_pal 0x08e69628, 0x2754
	obj_pal 0x08d0bd60, 0x2755
	obj_pal 0x08d0be74, 0x2756
	obj_pal 0x08d0be74, 0x2757
	obj_pal 0x08d0c198, 0x2758
	obj_pal 0x08d0c2cc, 0x2759
	obj_pal 0x08d1b668, 0x275a
	obj_pal 0x08d0c568, 0x275b
	obj_pal 0x08d150cc, 0x275c
	obj_pal 0x08d150cc, 0x275d
	obj_pal 0x08d0c724, 0x275e
	obj_pal 0x08d0c724, 0x275f
	obj_pal 0x08d0cee0, 0x2760
	obj_pal 0x08d0cf88, 0x2761
	obj_pal 0x08d0d144, 0x2762
	obj_pal 0x08d0d158, 0x2763
	obj_pal 0x08d0d180, 0x2764
	obj_pal 0x08d0d1a8, 0x2765
	obj_pal 0x08d0d1c0, 0x2766
	obj_pal 0x08d25100, 0x2767
	obj_pal 0x08d0d1e8, 0x2768
	obj_pal 0x08d0d204, 0x2769
	obj_pal 0x08d0d22c, 0x276a
	obj_pal 0x08d0bc28, 0x276b
	obj_pal 0x08d0d250, 0x276c
	obj_pal 0x08d0d26c, 0x276d
	obj_pal 0x08d0d294, 0x276e
	obj_pal 0x08d0d2d4, 0x276f
	obj_pal 0x08d0d2fc, 0x2770
	obj_pal 0x08d0d318, 0x2771
	obj_pal 0x08d0d294, 0x2772
	obj_pal 0x08d281b8, 0x2773
	obj_pal 0x08d0d340, 0x2774
	obj_pal 0x08d0d35c, 0x2775
	obj_pal 0x08d0d35c, 0x2776
	obj_pal 0x08d0d384, 0x2777
	obj_pal 0x08d0f6dc, 0x2778
	obj_pal 0x08d0fc88, 0x2779
	obj_pal 0x08d0fc88, 0x277a
	obj_pal 0x08d1014c, 0x277b
	obj_pal 0x08d1014c, 0x277c
	obj_pal 0x08d10520, 0x277d
	obj_pal 0x08d10520, 0x277e
	obj_pal 0x08d10970, 0x277f
	obj_pal 0x08d10cbc, 0x2780
	obj_pal 0x08d10f50, 0x2781
	obj_pal 0x08d1106c, 0x2782
	obj_pal 0x08d0367c, 0x2783
	obj_pal 0x08d132d8, 0x2784
	obj_pal 0x08d1353c, 0x2785
	obj_pal 0x08d136f0, 0x2786
	obj_pal 0x08d1399c, 0x2787
	obj_pal 0x08d13ab8, 0x2788
	obj_pal 0x08d13b0c, 0x2789
	obj_pal 0x08d13c2c, 0x278a
	obj_pal 0x08d13c2c, 0x278b
	obj_pal 0x08d1401c, 0x278c
	obj_pal 0x08d14130, 0x278d
	obj_pal 0x08d141c0, 0x278e
	obj_pal 0x08d14380, 0x278f
	obj_pal 0x08d14610, 0x2790
	obj_pal 0x08d14610, 0x2791
	obj_pal 0x08d14a64, 0x2792
	obj_pal 0x08d14a64, 0x2793
	obj_pal 0x08d14cfc, 0x2794
	obj_pal 0x08d14d98, 0x2795
	obj_pal 0x08d14d98, 0x2796
	obj_pal 0x08d1a7dc, 0x2797
	obj_pal 0x08d1a8c8, 0x2798
	obj_pal 0x08d1a7dc, 0x2799
	obj_pal 0x08d1a7dc, 0x279a
	obj_pal 0x08d1ace4, 0x279b
	obj_pal 0x08d1b070, 0x279c
	obj_pal 0x08d1b198, 0x279d
	obj_pal 0x08d1b198, 0x279e
	obj_pal 0x08d2d188, 0x279f
	obj_pal 0x08d1c040, 0x27a0
	obj_pal 0x08d1ace4, 0x27a1
	obj_pal 0x08d0367c, 0x27a2
	obj_pal 0x08d1b3e4, 0x27a3
	obj_pal 0x08d1b5c0, 0x27a4
	obj_pal 0x08d1b5c0, 0x27a5
	obj_pal 0x08d1b760, 0x27a6
	obj_pal 0x08d1b760, 0x27a7
	obj_pal 0x08d041e4, 0x27a8
	obj_pal 0x08d1b8e0, 0x27a9
	obj_pal 0x08d1b9a4, 0x27aa
	obj_pal 0x08d1ba8c, 0x27ab
	obj_pal 0x08d1bcc4, 0x27ac
	obj_pal 0x08d1bd50, 0x27ad
	obj_pal 0x08d1be30, 0x27ae
	obj_pal 0x08d1bed0, 0x27af
	obj_pal 0x08d1bfa0, 0x27b0
	obj_pal 0x08d03774, 0x27b1
	obj_pal 0x08d1c228, 0x27b2
	obj_pal 0x08d1c2a8, 0x27b3
	obj_pal 0x08d1c2d8, 0x27b4
	obj_pal 0x08d1c2f0, 0x27b5
	obj_pal 0x08d1c614, 0x27b6
	obj_pal 0x08d1c634, 0x27b7
	obj_pal 0x08d1c654, 0x27b8
	obj_pal 0x08d1c674, 0x27b9
	obj_pal 0x08d1c694, 0x27ba
	obj_pal 0x08d1c700, 0x27bb
	obj_pal 0x08d1c728, 0x27bc
	obj_pal 0x08d1caf8, 0x27bd
	obj_pal 0x08d1da00, 0x27be
	obj_pal 0x08d1da8c, 0x27bf
	obj_pal 0x08d1dc0c, 0x27c0
	obj_pal 0x08d1dcf8, 0x27c1
	obj_pal 0x08d1de78, 0x27c2
	obj_pal 0x08d1dea0, 0x27c3
	obj_pal 0x08d1dea0, 0x27c4
	obj_pal 0x08d1dea0, 0x27c5
	obj_pal 0x08d1e3f0, 0x27c6
	obj_pal 0x08d1e690, 0x27c7
	obj_pal 0x08d1e80c, 0x27c8
	obj_pal 0x08d1ec48, 0x27c9
	obj_pal 0x08d1f508, 0x27ca
	obj_pal 0x08d1f11c, 0x27cb
	obj_pal 0x08e7133c, 0x27cc
	obj_pal 0x08d205c8, 0x27cd
	obj_pal 0x08d2028c, 0x27ce
	obj_pal 0x08d2051c, 0x27cf
	obj_pal 0x08d20868, 0x27d0
	obj_pal 0x08d209ec, 0x27d1
	obj_pal 0x08d21330, 0x27d2
	obj_pal 0x08d21410, 0x27d3
	obj_pal 0x08d20fe0, 0x27d4
	obj_pal 0x08d215a0, 0x27d5
	obj_pal 0x08d219b8, 0x27d6
	obj_pal 0x08d21aa8, 0x27d7
	obj_pal 0x08d21c04, 0x27d8
	obj_pal 0x08d22290, 0x27d9
	obj_pal 0x08d225bc, 0x27da
	obj_pal 0x08d2278c, 0x27db
	obj_pal 0x08d2242c, 0x27dc
	obj_pal 0x08d22c84, 0x27dd
	obj_pal 0x08d229bc, 0x27de
	obj_pal 0x08d22d74, 0x27df
	obj_pal 0x08d1c634, 0x27e0
	obj_pal 0x08d23490, 0x27e1
	obj_pal 0x08d2364c, 0x27e2
	obj_pal 0x08d24918, 0x27e3
	obj_pal 0x08d24918, 0x27e4
	obj_pal 0x08d24918, 0x27e5
	obj_pal 0x08d235a0, 0x27e6
	obj_pal 0x08d24d58, 0x27e7
	obj_pal 0x08d2366c, 0x27e8
	obj_pal 0x08d24408, 0x27e9
	obj_pal 0x08d24fd4, 0x27ea
	obj_pal 0x08d2362c, 0x27eb
	obj_pal 0x08d25180, 0x27ec
	obj_pal 0x08d252d4, 0x27ed
	obj_pal 0x08d25844, 0x27ee
	obj_pal 0x08d2586c, 0x27ef
	obj_pal 0x08d25b20, 0x27f0
	obj_pal 0x08d27c94, 0x27f1
	obj_pal 0x08d27e90, 0x27f2
	obj_pal 0x08d27e90, 0x27f3
	obj_pal 0x08d25ea8, 0x27f4
	obj_pal 0x08d28070, 0x27f5
	obj_pal 0x08d25c3c, 0x27f6
	obj_pal 0x08d28718, 0x27f7
	obj_pal 0x08d28718, 0x27f8
	obj_pal 0x08d28994, 0x27f9
	obj_pal 0x08d28b7c, 0x27fa
	obj_pal 0x08d28c7c, 0x27fb
	obj_pal 0x08d28c98, 0x27fc
	obj_pal 0x08d28cb4, 0x27fd
	obj_pal 0x08d28c08, 0x27fe
	obj_pal 0x08d2cf30, 0x27ff
	obj_pal 0x08d2d240, 0x2800
	obj_pal 0x08d2d7b8, 0x2801
	obj_pal 0x08d2da58, 0x2802
	obj_pal 0x08d2daa4, 0x2803
	obj_pal 0x08d2e9dc, 0x2804
	obj_pal 0x08d2e28c, 0x2805
	obj_pal 0x08d2e28c, 0x2806
	obj_pal 0x08d235a0, 0x2807
	obj_pal 0x08d2ef68, 0x2808
	obj_pal 0x08d2efd0, 0x2809
	obj_pal 0x08d2efd0, 0x280a
	obj_pal 0x08d2f248, 0x280b
	obj_pal 0x08d2f378, 0x280c
	obj_pal 0x08d2f578, 0x280d
	obj_pal 0x08d2f6d8, 0x280e
	obj_pal 0x08d2f778, 0x280f
	obj_pal 0x08d2fc28, 0x2810
	obj_pal 0x08d2fd6c, 0x2811
	obj_pal 0x08d2f874, 0x2812
	obj_pal 0x08d1b5e0, 0x2813
	obj_pal 0x08e68764, 0x2814
	obj_pal 0x08e68580, 0x2815
	obj_pal 0x08e693dc, 0x2816
	obj_pal 0x08e6e6ec, 0x2817
	obj_pal 0x08e695d8, 0x2818
	obj_pal 0x08e695f0, 0x2819
	obj_pal 0x08e6e744, 0x281a
	obj_pal 0x08e6e75c, 0x281b
	obj_pal 0x08e6e774, 0x281c
	obj_pal 0x08e69ae8, 0x281d
	obj_pal 0x08e7e9e0, 0x281e
	obj_pal 0x08e7eb24, 0x281f
	obj_pal 0x08e69a48, 0x2820
	obj_pal 0x08e69a48, 0x2821
	obj_pal 0x08e69f54, 0x2822
	obj_pal 0x08e69f54, 0x2823
	obj_pal 0x08e69f54, 0x2824
	obj_pal 0x08e6da2c, 0x2825
	obj_pal 0x08e6e998, 0x2826
	obj_pal 0x08e6ea00, 0x2827
	obj_pal 0x08e6a6e4, 0x2828
	obj_pal 0x08e6eba4, 0x2829
	obj_pal 0x08e7e7d0, 0x282a
	obj_pal 0x08e6dfc0, 0x282b
	obj_pal 0x08e6f53c, 0x282c
	obj_pal 0x08e6f5f8, 0x282d
	obj_pal 0x08e71200, 0x282e
	obj_pal 0x08e6bbb4, 0x282f
	obj_pal 0x08d1c2c0, 0x2830

	.align 2
	.global gUnknown_0837F374
gUnknown_0837F374: @ 837F374
	.4byte 0x08d1cba8
	.4byte 0x08d1d1a0
	.4byte 0x08d1d1c0
	.4byte 0x08d1cba8
	.4byte 0x08d1d1a0
	.4byte 0x08d1d1c0
	.4byte 0x08e6abdc
	.4byte 0x08e6b8a4
	.4byte 0x08e6b8c0
	.4byte 0x08d1ec70
	.4byte 0x08d1ee40
	.4byte 0x08d1ee64
	.4byte 0x08d25f98
	.4byte 0x08d25f70
	.4byte 0x08d26d04
	.4byte 0x08d25f98
	.4byte 0x08d25f70
	.4byte 0x08d27200
	.4byte 0x08d25f98
	.4byte 0x08d25f70
	.4byte 0x08d276d0
	.4byte 0x08d28cd0
	.4byte 0x08d28e78
	.4byte 0x08d28ec8
	.4byte 0x08d28cd0
	.4byte 0x08d28e78
	.4byte 0x08d29058
	.4byte 0x08d2a168
	.4byte 0x08d2a128
	.4byte 0x08d29e30
	.4byte 0x08d2a168
	.4byte 0x08d2a128
	.4byte 0x08d2a6e8
	.4byte 0x08d2c190
	.4byte 0x08d2cb2c
	.4byte 0x08d2cb54
	.4byte 0x08d2b408
	.4byte 0x08d2c170
	.4byte 0x08d2abb4
	.4byte 0x08d2b408
	.4byte 0x08d2c170
	.4byte 0x08d2ae7c
	.4byte 0x08d2b408
	.4byte 0x08d2c170
	.4byte 0x08d2b178
	.4byte 0x08e6877c
	.4byte 0x08e690ec
	.4byte 0x08e69110
	.4byte 0x08e6d690
	.4byte 0x08e6d668
	.4byte 0x08e6d8f0
	.4byte 0x08e69f7c
	.4byte 0x08e6a0d8
	.4byte 0x08e6a100
	.4byte 0x08d28cd0
	.4byte 0x08d28ea0
	.4byte 0x08d28ec8
	.4byte 0x08d28cd0
	.4byte 0x08d28ea0
	.4byte 0x08d29058
	.4byte 0x08d291e4
	.4byte 0x08d29c0c
	.4byte 0x08d29c2c
	.4byte 0x08e6ebc4
	.4byte 0x08e6eeb8
	.4byte 0x08e6eed4
	.4byte 0x08d2a168
	.4byte 0x08d2a148
	.4byte 0x08d29e30
	.4byte 0x08d2a168
	.4byte 0x08d2a148
	.4byte 0x08d2a6e8
	.4byte 0x08d25f98
	.4byte 0x08e6bbdc
	.4byte 0x08d26d04
	.4byte 0x08d25f98
	.4byte 0x08e6bbdc
	.4byte 0x08d27200
	.4byte 0x08d25f98
	.4byte 0x08e6bbdc
	.4byte 0x08d276d0

	.align 2
	.global gUnknown_0837F4B8
gUnknown_0837F4B8: @ 837F4B8
	.4byte ma00_load_graphics
	.4byte ma01_080728D0
	.4byte ma02_instanciate_template
	.4byte sub_8075BB8
	.4byte ma04_wait_countdown
	.4byte sub_8075C74
	.4byte nullsub_53
	.4byte nullsub_88
	.4byte sub_8075CB0
	.4byte ma09_play_sound
	.4byte sub_8075DE0
	.4byte ma0B_0807324C
	.4byte sub_8076A3C
	.4byte sub_8076AA0
	.4byte ma0E_call
	.4byte sub_8076AF0
	.4byte ma10_080736AC
	.4byte ma11_if_else
	.4byte ma12_cond_if
	.4byte sub_8076BBC
	.4byte ma14_load_background
	.4byte ma15_load_battle_screen_elements
	.4byte ma16_wait_for_battle_screen_elements_s2
	.4byte sub_8076F44
	.4byte ma18_load_background_probably
	.4byte ma19_08073BC8
	.4byte ma1A_8073C00
	.4byte ma1B_8073C2C
	.4byte ma1C_8073ED0
	.4byte ma1D_08073FB4
	.4byte sub_8076A78
	.4byte sub_8077610
	.4byte ma20_wait_for_something
	.4byte ma21_08074164
	.4byte sub_80767C4
	.4byte ma23_8073484
	.4byte sub_807775C
	.4byte sub_8076C4C
	.4byte sub_8077320
	.4byte sub_80773B4
	.4byte sub_807779C
	.4byte sub_8077808
	.4byte sub_807784C
	.4byte ma2B_make_side_invisible
	.4byte ma2C_make_side_visible
	.4byte sub_807794C
	.4byte sub_80779FC
	.4byte ma2F_stop_music

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
	.space 4

	.global gUnknown_0837F5B0
gUnknown_0837F5B0: @ 837F5B0
	.incbin "baserom.gba", 0x0037f5b0, 0x30

	.global gUnknown_0837F5E0
gUnknown_0837F5E0: @ 837F5E0
	obj_tiles 0x082089dc, 2048, 0xd755
	obj_tiles 0x082089dc, 2048, 0xd756

	.include "data/maps/events/PetalburgCity.s"
	.include "data/maps/events/SlateportCity.s"
	.include "data/maps/events/MauvilleCity.s"
	.include "data/maps/events/RustboroCity.s"
	.include "data/maps/events/FortreeCity.s"
	.include "data/maps/events/LilycoveCity.s"
	.include "data/maps/events/MossdeepCity.s"
	.include "data/maps/events/SootopolisCity.s"
	.include "data/maps/events/EverGrandeCity.s"
	.include "data/maps/events/LittlerootTown.s"
	.include "data/maps/events/OldaleTown.s"
	.include "data/maps/events/DewfordTown.s"
	.include "data/maps/events/LavaridgeTown.s"
	.include "data/maps/events/FallarborTown.s"
	.include "data/maps/events/VerdanturfTown.s"
	.include "data/maps/events/PacifidlogTown.s"
	.include "data/maps/events/Route101.s"
	.include "data/maps/events/Route102.s"
	.include "data/maps/events/Route103.s"
	.include "data/maps/events/Route104.s"
	.include "data/maps/events/Route105.s"
	.include "data/maps/events/Route106.s"
	.include "data/maps/events/Route107.s"
	.include "data/maps/events/Route108.s"
	.include "data/maps/events/Route109.s"
	.include "data/maps/events/Route110.s"
	.include "data/maps/events/Route111.s"
	.include "data/maps/events/Route112.s"
	.include "data/maps/events/Route113.s"
	.include "data/maps/events/Route114.s"
	.include "data/maps/events/Route115.s"
	.include "data/maps/events/Route116.s"
	.include "data/maps/events/Route117.s"
	.include "data/maps/events/Route118.s"
	.include "data/maps/events/Route119.s"
	.include "data/maps/events/Route120.s"
	.include "data/maps/events/Route121.s"
	.include "data/maps/events/Route122.s"
	.include "data/maps/events/Route123.s"
	.include "data/maps/events/Route124.s"
	.include "data/maps/events/Route125.s"
	.include "data/maps/events/Route126.s"
	.include "data/maps/events/Route127.s"
	.include "data/maps/events/Route128.s"
	.include "data/maps/events/Route129.s"
	.include "data/maps/events/Route130.s"
	.include "data/maps/events/Route131.s"
	.include "data/maps/events/Route132.s"
	.include "data/maps/events/Route133.s"
	.include "data/maps/events/Route134.s"
	.include "data/maps/events/Underwater1.s"
	.include "data/maps/events/Underwater2.s"
	.include "data/maps/events/Underwater3.s"
	.include "data/maps/events/Underwater4.s"
	.include "data/maps/events/LittlerootTown_BrendansHouse_1F.s"
	.include "data/maps/events/LittlerootTown_BrendansHouse_2F.s"
	.include "data/maps/events/LittlerootTown_MaysHouse_1F.s"
	.include "data/maps/events/LittlerootTown_MaysHouse_2F.s"
	.include "data/maps/events/LittlerootTown_ProfessorBirchsLab.s"
	.include "data/maps/events/OldaleTown_House1.s"
	.include "data/maps/events/OldaleTown_House2.s"
	.include "data/maps/events/OldaleTown_PokemonCenter_1F.s"
	.include "data/maps/events/OldaleTown_PokemonCenter_2F.s"
	.include "data/maps/events/OldaleTown_Mart.s"
	.include "data/maps/events/DewfordTown_House1.s"
	.include "data/maps/events/DewfordTown_PokemonCenter_1F.s"
	.include "data/maps/events/DewfordTown_PokemonCenter_2F.s"
	.include "data/maps/events/DewfordTown_Gym.s"
	.include "data/maps/events/DewfordTown_Hall.s"
	.include "data/maps/events/DewfordTown_House2.s"
	.include "data/maps/events/LavaridgeTown_HerbShop.s"
	.include "data/maps/events/LavaridgeTown_Gym_1F.s"
	.include "data/maps/events/LavaridgeTown_Gym_B1F.s"
	.include "data/maps/events/LavaridgeTown_House.s"
	.include "data/maps/events/LavaridgeTown_Mart.s"
	.include "data/maps/events/LavaridgeTown_PokemonCenter_1F.s"
	.include "data/maps/events/LavaridgeTown_PokemonCenter_2F.s"
	.include "data/maps/events/FallarborTown_Mart.s"
	.include "data/maps/events/FallarborTown_ContestLobby.s"
	.include "data/maps/events/FallarborTown_ContestHall.s"
	.include "data/maps/events/FallarborTown_PokemonCenter_1F.s"
	.include "data/maps/events/FallarborTown_PokemonCenter_2F.s"
	.include "data/maps/events/FallarborTown_House1.s"
	.include "data/maps/events/FallarborTown_House2.s"
	.include "data/maps/events/VerdanturfTown_ContestLobby.s"
	.include "data/maps/events/VerdanturfTown_ContestHall.s"
	.include "data/maps/events/VerdanturfTown_Mart.s"
	.include "data/maps/events/VerdanturfTown_PokemonCenter_1F.s"
	.include "data/maps/events/VerdanturfTown_PokemonCenter_2F.s"
	.include "data/maps/events/VerdanturfTown_WandasHouse.s"
	.include "data/maps/events/VerdanturfTown_FriendshipRatersHouse.s"
	.include "data/maps/events/VerdanturfTown_House.s"
	.include "data/maps/events/PacifidlogTown_PokemonCenter_1F.s"
	.include "data/maps/events/PacifidlogTown_PokemonCenter_2F.s"
	.include "data/maps/events/PacifidlogTown_House1.s"
	.include "data/maps/events/PacifidlogTown_House2.s"
	.include "data/maps/events/PacifidlogTown_House3.s"
	.include "data/maps/events/PacifidlogTown_House4.s"
	.include "data/maps/events/PacifidlogTown_House5.s"
	.include "data/maps/events/PetalburgCity_WallysHouse.s"
	.include "data/maps/events/PetalburgCity_Gym.s"
	.include "data/maps/events/PetalburgCity_House1.s"
	.include "data/maps/events/PetalburgCity_House2.s"
	.include "data/maps/events/PetalburgCity_PokemonCenter_1F.s"
	.include "data/maps/events/PetalburgCity_PokemonCenter_2F.s"
	.include "data/maps/events/PetalburgCity_Mart.s"
	.include "data/maps/events/SlateportCity_SternsShipyard_1F.s"
	.include "data/maps/events/SlateportCity_SternsShipyard_2F.s"
	.include "data/maps/events/SlateportCity_ContestLobby.s"
	.include "data/maps/events/SlateportCity_ContestHall.s"
	.include "data/maps/events/SlateportCity_House1.s"
	.include "data/maps/events/SlateportCity_PokemonFanClub.s"
	.include "data/maps/events/SlateportCity_OceanicMuseum_1F.s"
	.include "data/maps/events/SlateportCity_OceanicMuseum_2F.s"
	.include "data/maps/events/SlateportCity_Harbor.s"
	.include "data/maps/events/SlateportCity_House2.s"
	.include "data/maps/events/SlateportCity_PokemonCenter_1F.s"
	.include "data/maps/events/SlateportCity_PokemonCenter_2F.s"
	.include "data/maps/events/SlateportCity_Mart.s"
	.include "data/maps/events/MauvilleCity_Gym.s"
	.include "data/maps/events/MauvilleCity_BikeShop.s"
	.include "data/maps/events/MauvilleCity_House1.s"
	.include "data/maps/events/MauvilleCity_GameCorner.s"
	.include "data/maps/events/MauvilleCity_House2.s"
	.include "data/maps/events/MauvilleCity_PokemonCenter_1F.s"
	.include "data/maps/events/MauvilleCity_PokemonCenter_2F.s"
	.include "data/maps/events/MauvilleCity_Mart.s"
	.include "data/maps/events/RustboroCity_DevonCorp_1F.s"
	.include "data/maps/events/RustboroCity_DevonCorp_2F.s"
	.include "data/maps/events/RustboroCity_DevonCorp_3F.s"
	.include "data/maps/events/RustboroCity_Gym.s"
	.include "data/maps/events/RustboroCity_PokemonSchool.s"
	.include "data/maps/events/RustboroCity_PokemonCenter_1F.s"
	.include "data/maps/events/RustboroCity_PokemonCenter_2F.s"
	.include "data/maps/events/RustboroCity_Mart.s"
	.include "data/maps/events/RustboroCity_Flat1_1F.s"
	.include "data/maps/events/RustboroCity_Flat1_2F.s"
	.include "data/maps/events/RustboroCity_House1.s"
	.include "data/maps/events/RustboroCity_CuttersHouse.s"
	.include "data/maps/events/RustboroCity_House2.s"
	.include "data/maps/events/RustboroCity_Flat2_1F.s"
	.include "data/maps/events/RustboroCity_Flat2_2F.s"
	.include "data/maps/events/RustboroCity_Flat2_3F.s"
	.include "data/maps/events/RustboroCity_House3.s"
	.include "data/maps/events/FortreeCity_House1.s"
	.include "data/maps/events/FortreeCity_Gym.s"
	.include "data/maps/events/FortreeCity_PokemonCenter_1F.s"
	.include "data/maps/events/FortreeCity_PokemonCenter_2F.s"
	.include "data/maps/events/FortreeCity_Mart.s"
	.include "data/maps/events/FortreeCity_House2.s"
	.include "data/maps/events/FortreeCity_House3.s"
	.include "data/maps/events/FortreeCity_House4.s"
	.include "data/maps/events/FortreeCity_House5.s"
	.include "data/maps/events/FortreeCity_DecorationShop.s"
	.include "data/maps/events/LilycoveCity_CoveLilyMotel_1F.s"
	.include "data/maps/events/LilycoveCity_CoveLilyMotel_2F.s"
	.include "data/maps/events/LilycoveCity_LilycoveMuseum_1F.s"
	.include "data/maps/events/LilycoveCity_LilycoveMuseum_2F.s"
	.include "data/maps/events/LilycoveCity_ContestLobby.s"
	.include "data/maps/events/LilycoveCity_ContestHall.s"
	.include "data/maps/events/LilycoveCity_PokemonCenter_1F.s"
	.include "data/maps/events/LilycoveCity_PokemonCenter_2F.s"
	.include "data/maps/events/LilycoveCity_UnusedMart.s"
	.include "data/maps/events/LilycoveCity_PokemonTrainerFanClub.s"
	.include "data/maps/events/LilycoveCity_Harbor.s"
	.include "data/maps/events/LilycoveCity_EmptyMap.s"
	.include "data/maps/events/LilycoveCity_MoveDeletersHouse.s"
	.include "data/maps/events/LilycoveCity_House1.s"
	.include "data/maps/events/LilycoveCity_House2.s"
	.include "data/maps/events/LilycoveCity_House3.s"
	.include "data/maps/events/LilycoveCity_House4.s"
	.include "data/maps/events/LilycoveCity_DepartmentStore_1F.s"
	.include "data/maps/events/LilycoveCity_DepartmentStore_2F.s"
	.include "data/maps/events/LilycoveCity_DepartmentStore_3F.s"
	.include "data/maps/events/LilycoveCity_DepartmentStore_4F.s"
	.include "data/maps/events/LilycoveCity_DepartmentStore_5F.s"
	.include "data/maps/events/LilycoveCity_DepartmentStoreRooftop.s"
	.include "data/maps/events/LilycoveCity_DepartmentStoreElevator.s"
	.include "data/maps/events/MossdeepCity_Gym.s"
	.include "data/maps/events/MossdeepCity_House1.s"
	.include "data/maps/events/MossdeepCity_House2.s"
	.include "data/maps/events/MossdeepCity_PokemonCenter_1F.s"
	.include "data/maps/events/MossdeepCity_PokemonCenter_2F.s"
	.include "data/maps/events/MossdeepCity_Mart.s"
	.include "data/maps/events/MossdeepCity_House3.s"
	.include "data/maps/events/MossdeepCity_StevensHouse.s"
	.include "data/maps/events/MossdeepCity_House4.s"
	.include "data/maps/events/MossdeepCity_SpaceCenter_1F.s"
	.include "data/maps/events/MossdeepCity_SpaceCenter_2F.s"
	.include "data/maps/events/MossdeepCity_GameCorner_1F.s"
	.include "data/maps/events/MossdeepCity_GameCorner_B1F.s"
	.include "data/maps/events/SootopolisCity_Gym_1F.s"
	.include "data/maps/events/SootopolisCity_Gym_B1F.s"
	.include "data/maps/events/SootopolisCity_PokemonCenter_1F.s"
	.include "data/maps/events/SootopolisCity_PokemonCenter_2F.s"
	.include "data/maps/events/SootopolisCity_Mart.s"
	.include "data/maps/events/SootopolisCity_House1.s"
	.include "data/maps/events/SootopolisCity_House2.s"
	.include "data/maps/events/SootopolisCity_House3.s"
	.include "data/maps/events/SootopolisCity_House4.s"
	.include "data/maps/events/SootopolisCity_House5.s"
	.include "data/maps/events/SootopolisCity_House6.s"
	.include "data/maps/events/SootopolisCity_House7.s"
	.include "data/maps/events/SootopolisCity_House8.s"
	.include "data/maps/events/EverGrandeCity_SidneysRoom.s"
	.include "data/maps/events/EverGrandeCity_PhoebesRoom.s"
	.include "data/maps/events/EverGrandeCity_GlaciasRoom.s"
	.include "data/maps/events/EverGrandeCity_DrakesRoom.s"
	.include "data/maps/events/EverGrandeCity_ChampionsRoom.s"
	.include "data/maps/events/EverGrandeCity_Corridor1.s"
	.include "data/maps/events/EverGrandeCity_Corridor2.s"
	.include "data/maps/events/EverGrandeCity_Corridor3.s"
	.include "data/maps/events/EverGrandeCity_Corridor4.s"
	.include "data/maps/events/EverGrandeCity_Corridor5.s"
	.include "data/maps/events/EverGrandeCity_PokemonLeague.s"
	.include "data/maps/events/EverGrandeCity_HallOfFame.s"
	.include "data/maps/events/EverGrandeCity_PokemonCenter_1F.s"
	.include "data/maps/events/EverGrandeCity_PokemonCenter_2F.s"
	.include "data/maps/events/Route104_MrBrineysHouse.s"
	.include "data/maps/events/Route104_PrettyPetalFlowerShop.s"
	.include "data/maps/events/Route111_WinstrateFamilysHouse.s"
	.include "data/maps/events/Route111_OldLadysRestStop.s"
	.include "data/maps/events/Route112_CableCarStation.s"
	.include "data/maps/events/MtChimney_CableCarStation.s"
	.include "data/maps/events/Route114_FossilManiacsHouse.s"
	.include "data/maps/events/Route114_FossilManiacsTunnel.s"
	.include "data/maps/events/Route114_LanettesHouse.s"
	.include "data/maps/events/Route116_TunnelersRestHouse.s"
	.include "data/maps/events/Route117_PokemonDayCare.s"
	.include "data/maps/events/Route121_SafariZoneEntrance.s"
	.include "data/maps/events/MeteorFalls_1F_1R.s"
	.include "data/maps/events/MeteorFalls_1F_2R.s"
	.include "data/maps/events/MeteorFalls_B1F_1R.s"
	.include "data/maps/events/MeteorFalls_B1F_2R.s"
	.include "data/maps/events/RusturfTunnel.s"
	.include "data/maps/events/Underwater_SootopolisCity.s"
	.include "data/maps/events/DesertRuins.s"
	.include "data/maps/events/GraniteCave_1F.s"
	.include "data/maps/events/GraniteCave_B1F.s"
	.include "data/maps/events/GraniteCave_B2F.s"
	.include "data/maps/events/GraniteCave_StevensRoom.s"
	.include "data/maps/events/PetalburgWoods.s"
	.include "data/maps/events/MtChimney.s"
	.include "data/maps/events/JaggedPass.s"
	.include "data/maps/events/FieryPath.s"
	.include "data/maps/events/MtPyre_1F.s"
	.include "data/maps/events/MtPyre_2F.s"
	.include "data/maps/events/MtPyre_3F.s"
	.include "data/maps/events/MtPyre_4F.s"
	.include "data/maps/events/MtPyre_5F.s"
	.include "data/maps/events/MtPyre_6F.s"
	.include "data/maps/events/MtPyre_Exterior.s"
	.include "data/maps/events/MtPyre_Summit.s"
	.include "data/maps/events/AquaHideout_1F.s"
	.include "data/maps/events/AquaHideout_B1F.s"
	.include "data/maps/events/AquaHideout_B2F.s"
	.include "data/maps/events/Underwater_SeafloorCavern.s"
	.include "data/maps/events/SeafloorCavern_Entrance.s"
	.include "data/maps/events/SeafloorCavern_Room1.s"
	.include "data/maps/events/SeafloorCavern_Room2.s"
	.include "data/maps/events/SeafloorCavern_Room3.s"
	.include "data/maps/events/SeafloorCavern_Room4.s"
	.include "data/maps/events/SeafloorCavern_Room5.s"
	.include "data/maps/events/SeafloorCavern_Room6.s"
	.include "data/maps/events/SeafloorCavern_Room7.s"
	.include "data/maps/events/SeafloorCavern_Room8.s"
	.include "data/maps/events/SeafloorCavern_Room9.s"
	.include "data/maps/events/CaveOfOrigin_Entrance.s"
	.include "data/maps/events/CaveOfOrigin_1F.s"
	.include "data/maps/events/CaveOfOrigin_B1F.s"
	.include "data/maps/events/CaveOfOrigin_B2F.s"
	.include "data/maps/events/CaveOfOrigin_B3F.s"
	.include "data/maps/events/CaveOfOrigin_B4F.s"
	.include "data/maps/events/VictoryRoad_1F.s"
	.include "data/maps/events/VictoryRoad_B1F.s"
	.include "data/maps/events/VictoryRoad_B2F.s"
	.include "data/maps/events/ShoalCave_LowTideEntranceRoom.s"
	.include "data/maps/events/ShoalCave_LowTideInnerRoom.s"
	.include "data/maps/events/ShoalCave_LowTideStairsRoom.s"
	.include "data/maps/events/ShoalCave_LowTideLowerRoom.s"
	.include "data/maps/events/ShoalCave_HighTideEntranceRoom.s"
	.include "data/maps/events/ShoalCave_HighTideInnerRoom.s"
	.include "data/maps/events/NewMauville_Entrance.s"
	.include "data/maps/events/NewMauville_Inside.s"
	.include "data/maps/events/AbandonedShip_Deck.s"
	.include "data/maps/events/AbandonedShip_Corridors_1F.s"
	.include "data/maps/events/AbandonedShip_Rooms_1F.s"
	.include "data/maps/events/AbandonedShip_Corridors_B1F.s"
	.include "data/maps/events/AbandonedShip_Rooms_B1F.s"
	.include "data/maps/events/AbandonedShip_Rooms2_B1F.s"
	.include "data/maps/events/AbandonedShip_Underwater1.s"
	.include "data/maps/events/AbandonedShip_Room_B1F.s"
	.include "data/maps/events/AbandonedShip_Rooms2_1F.s"
	.include "data/maps/events/AbandonedShip_CaptainsOffice.s"
	.include "data/maps/events/AbandonedShip_Underwater2.s"
	.include "data/maps/events/AbandonedShip_HiddenFloorCorridors.s"
	.include "data/maps/events/AbandonedShip_HiddenFloorRooms.s"
	.include "data/maps/events/IslandCave.s"
	.include "data/maps/events/AncientTomb.s"
	.include "data/maps/events/Underwater_Route134.s"
	.include "data/maps/events/Underwater_SealedChamber.s"
	.include "data/maps/events/SealedChamber_OuterRoom.s"
	.include "data/maps/events/SealedChamber_InnerRoom.s"
	.include "data/maps/events/ScorchedSlab.s"
	.include "data/maps/events/MagmaHideout_1F.s"
	.include "data/maps/events/MagmaHideout_B1F.s"
	.include "data/maps/events/MagmaHideout_B2F.s"
	.include "data/maps/events/SkyPillar_Entrance.s"
	.include "data/maps/events/SkyPillar_Outside.s"
	.include "data/maps/events/SkyPillar_1F.s"
	.include "data/maps/events/SkyPillar_2F.s"
	.include "data/maps/events/SkyPillar_3F.s"
	.include "data/maps/events/SkyPillar_4F.s"
	.include "data/maps/events/ShoalCave_LowTideIceRoom.s"
	.include "data/maps/events/SkyPillar_5F.s"
	.include "data/maps/events/SkyPillar_Top.s"
	.include "data/maps/events/SecretBase_RedCave1.s"
	.include "data/maps/events/SecretBase_BrownCave1.s"
	.include "data/maps/events/SecretBase_BlueCave1.s"
	.include "data/maps/events/SecretBase_YellowCave1.s"
	.include "data/maps/events/SecretBase_Tree1.s"
	.include "data/maps/events/SecretBase_Shrub1.s"
	.include "data/maps/events/SecretBase_RedCave2.s"
	.include "data/maps/events/SecretBase_BrownCave2.s"
	.include "data/maps/events/SecretBase_BlueCave2.s"
	.include "data/maps/events/SecretBase_YellowCave2.s"
	.include "data/maps/events/SecretBase_Tree2.s"
	.include "data/maps/events/SecretBase_Shrub2.s"
	.include "data/maps/events/SecretBase_RedCave3.s"
	.include "data/maps/events/SecretBase_BrownCave3.s"
	.include "data/maps/events/SecretBase_BlueCave3.s"
	.include "data/maps/events/SecretBase_YellowCave3.s"
	.include "data/maps/events/SecretBase_Tree3.s"
	.include "data/maps/events/SecretBase_Shrub3.s"
	.include "data/maps/events/SecretBase_RedCave4.s"
	.include "data/maps/events/SecretBase_BrownCave4.s"
	.include "data/maps/events/SecretBase_BlueCave4.s"
	.include "data/maps/events/SecretBase_YellowCave4.s"
	.include "data/maps/events/SecretBase_Tree4.s"
	.include "data/maps/events/SecretBase_Shrub4.s"
	.include "data/maps/events/SingleBattleColosseum.s"
	.include "data/maps/events/TradeCenter.s"
	.include "data/maps/events/RecordCorner.s"
	.include "data/maps/events/DoubleBattleColosseum.s"
	.include "data/maps/events/LinkContestRoom1.s"
	.include "data/maps/events/LinkContestRoom2.s"
	.include "data/maps/events/LinkContestRoom3.s"
	.include "data/maps/events/LinkContestRoom4.s"
	.include "data/maps/events/LinkContestRoom5.s"
	.include "data/maps/events/LinkContestRoom6.s"
	.include "data/maps/events/UnknownMap_25_29.s"
	.include "data/maps/events/UnknownMap_25_30.s"
	.include "data/maps/events/UnknownMap_25_31.s"
	.include "data/maps/events/UnknownMap_25_32.s"
	.include "data/maps/events/UnknownMap_25_33.s"
	.include "data/maps/events/UnknownMap_25_34.s"
	.include "data/maps/events/InsideOfTruck.s"
	.include "data/maps/events/SSTidalCorridor.s"
	.include "data/maps/events/SSTidalLowerDeck.s"
	.include "data/maps/events/SSTidalRooms.s"
	.include "data/maps/events/SafariZone_Northwest.s"
	.include "data/maps/events/SafariZone_Northeast.s"
	.include "data/maps/events/SafariZone_Southwest.s"
	.include "data/maps/events/SafariZone_Southeast.s"
	.include "data/maps/events/BattleTower_Outside.s"
	.include "data/maps/events/BattleTower_Lobby.s"
	.include "data/maps/events/BattleTower_Elevator.s"
	.include "data/maps/events/BattleTower_Corridor.s"
	.include "data/maps/events/BattleTower_BattleRoom.s"
	.include "data/maps/events/SouthernIsland_Exterior.s"
	.include "data/maps/events/SouthernIsland_Interior.s"
	.include "data/maps/events/SafariZone_RestHouse.s"
	.include "data/maps/events/Route104_Prototype.s"
	.include "data/maps/events/Route104_PrototypePrettyPetalFlowerShop.s"
	.include "data/maps/events/Route109_SeashoreHouse.s"
	.include "data/maps/events/Route110_TrickHouseEntrance.s"
	.include "data/maps/events/Route110_TrickHouseEnd.s"
	.include "data/maps/events/Route110_TrickHouseCorridor.s"
	.include "data/maps/events/Route110_TrickHousePuzzle1.s"
	.include "data/maps/events/Route110_TrickHousePuzzle2.s"
	.include "data/maps/events/Route110_TrickHousePuzzle3.s"
	.include "data/maps/events/Route110_TrickHousePuzzle4.s"
	.include "data/maps/events/Route110_TrickHousePuzzle5.s"
	.include "data/maps/events/Route110_TrickHousePuzzle6.s"
	.include "data/maps/events/Route110_TrickHousePuzzle7.s"
	.include "data/maps/events/Route110_TrickHousePuzzle8.s"
	.include "data/maps/events/Route110_SeasideCyclingRoadSouthEntrance.s"
	.include "data/maps/events/Route110_SeasideCyclingRoadNorthEntrance.s"
	.include "data/maps/events/Route113_GlassWorkshop.s"
	.include "data/maps/events/Route123_BerryMastersHouse.s"
	.include "data/maps/events/Route119_WeatherInstitute_1F.s"
	.include "data/maps/events/Route119_WeatherInstitute_2F.s"
	.include "data/maps/events/Route119_House.s"
Route124_DivingTreasureHuntersHouse_MapObjects:: @ 839300C
	object_event 1, MAP_OBJ_GFX_MAN_6, 0, 5, 0, 4, 0, 0, 9, 0, 0, 0, 0, 0, 0, Route124_DivingTreasureHuntersHouse_EventScript_163E04, 0, 0, 0

Route124_DivingTreasureHuntersHouse_MapWarps:: @ 8393024
	warp_def 3, 8, 0, 0, Route124
	warp_def 4, 8, 0, 0, Route124

Route124_DivingTreasureHuntersHouse_MapBGEvents:: @ 8393034
	bg_event 7, 1, 0, 0, 0, Route124_DivingTreasureHuntersHouse_EventScript_164335

Route124_DivingTreasureHuntersHouse_MapEvents:: @ 8393040
	map_events Route124_DivingTreasureHuntersHouse_MapObjects, Route124_DivingTreasureHuntersHouse_MapWarps, 0x0, Route124_DivingTreasureHuntersHouse_MapBGEvents

	.incbin "baserom.gba", 0x393054, 0x184

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
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/kyogre_dark.gbapal"
	.incbin "graphics/title_screen/kyogre_glow.gbapal"
	.else
	.incbin "graphics/title_screen/groudon_dark.gbapal"
	.incbin "graphics/title_screen/groudon_glow.gbapal"
	.endif

	.global gUnknown_08393250
gUnknown_08393250: @ 8393250
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/kyogre.4bpp.lz"
	.else
	.incbin "graphics/title_screen/groudon.4bpp.lz"
	.endif

	.global gUnknown_083939EC
gUnknown_083939EC: @ 83939EC
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/kyogre_map.bin.lz"
	.else
	.incbin "graphics/title_screen/groudon_map.bin.lz"
	.endif

	.global gUnknown_08393BF8
gUnknown_08393BF8: @ 8393BF8
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/water_map.bin.lz"
	.else
	.incbin "graphics/title_screen/lava_map.bin.lz"
	.endif

	.incbin "graphics/title_screen/logo_shine.4bpp.lz"

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

	.align 2
	.global gUnknown_08396FC4
gUnknown_08396FC4: @ 8396FC4
	.4byte 0x0202f7e8

	.align 2
	.global gUnknown_08396FC8
gUnknown_08396FC8: @ 8396FC8
	.4byte sub_807CAE8
	.4byte nullsub_38
	.4byte sub_807CAE8
	.4byte sub_807CB0C
	.4byte sub_807DE78
	.4byte sub_807DEF4
	.4byte sub_807DEC4
	.4byte sub_807DF54
	.4byte sub_807DF9C
	.4byte nullsub_55
	.4byte sub_807DFC0
	.4byte sub_807DFD0
	.4byte sub_807E364
	.4byte sub_807E400
	.4byte sub_807E3D0
	.4byte sub_807E460
	.4byte sub_807E9C8
	.4byte snowflakes_progress2
	.4byte sub_807EA18
	.4byte sub_807EAC0
	.4byte sub_807EE80
	.4byte sub_807EFC0
	.4byte sub_807EEF4
	.4byte sub_807F34C
	.4byte sub_807F49C
	.4byte sub_807F52C
	.4byte sub_807F4FC
	.4byte sub_807F5EC
	.4byte sub_807F7F8
	.4byte sub_807F888
	.4byte sub_807F858
	.4byte sub_807F934
	.4byte sub_807FE9C
	.4byte sub_807FF4C
	.4byte sub_807FF1C
	.4byte sub_807FFC8
	.4byte sub_807FB24
	.4byte sub_807FBD8
	.4byte sub_807FBA8
	.4byte sub_807FC3C
	.4byte sub_807F49C
	.4byte sub_807F52C
	.4byte sub_807F4FC
	.4byte sub_807F5EC
	.4byte sub_8080430
	.4byte nullsub_56
	.4byte sub_8080460
	.4byte sub_8080470
	.4byte sub_807E110
	.4byte sub_807E174
	.4byte sub_807E144
	.4byte sub_807E258
	.4byte sub_807EF24
	.4byte sub_807EFC0
	.4byte sub_807EF90
	.4byte sub_807F34C
	.4byte sub_8080474
	.4byte sub_80804F8
	.4byte sub_80804C8
	.4byte sub_808056C

	.align 2
	.global gUnknown_083970B8
gUnknown_083970B8: @ 83970B8
	.4byte sub_807CC24
	.4byte sub_807CCAC
	.4byte nullsub_39
	.4byte nullsub_39

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
	obj_tiles 0x08397948, 2048, 0x1201

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
	obj_tiles 0x08399fc8, 2560, 0x1204

	.global gUnknown_0839AC5C
gUnknown_0839AC5C: @ 839AC5C
	.incbin "baserom.gba", 0x0039ac5c, 0xc

	.global gUnknown_0839AC68
gUnknown_0839AC68: @ 839AC68
	.incbin "baserom.gba", 0x0039ac68, 0x8

	.global gUnknown_0839AC70
gUnknown_0839AC70: @ 839AC70
	obj_tiles 0x08398988, 64, 0x1205

	.global gUnknown_0839AC78
gUnknown_0839AC78: @ 839AC78
	.incbin "baserom.gba", 0x0039ac78, 0x44

	.global gUnknown_0839ACBC
gUnknown_0839ACBC: @ 839ACBC
	.incbin "baserom.gba", 0x0039acbc, 0x18

	.global gUnknown_0839ACD4
gUnknown_0839ACD4: @ 839ACD4
	.incbin "baserom.gba", 0x0039acd4, 0x4

	.align 2
	.global gUnknown_0839ACD8
gUnknown_0839ACD8: @ 839ACD8
	.4byte 0x02030202

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

	.align 2
	.global gUnknown_0839B1F0
gUnknown_0839B1F0: @ 839B1F0
Unknown_839B1F0:
	.4byte 0x08080807
	.4byte 0x080a0809
	.4byte 0x080c080b
	.4byte 0x080e080d
Unknown_839B200:
	.incbin "baserom.gba", 0x0039b200, 0x7
Unknown_839B207:
	.incbin "baserom.gba", 0x0039b207, 0x7
Unknown_839B20E:
	.incbin "baserom.gba", 0x0039b20e, 0x7
Unknown_839B215:
	.incbin "baserom.gba", 0x0039b215, 0x7

	.align 2
	.global gUnknown_0839B21C
gUnknown_0839B21C: @ 839B21C
	.4byte Unknown_839B200
	.4byte Unknown_839B207
	.4byte Unknown_839B20E
	.4byte Unknown_839B215

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

	.align 2
	.global gUnknown_0839B488
gUnknown_0839B488: @ 839B488
	.4byte IsTrainerInRangeSouth
	.4byte IsTrainerInRangeNorth
	.4byte IsTrainerInRangeWest
	.4byte IsTrainerInRangeEast

	.align 2
	.global gUnknown_0839B498
gUnknown_0839B498: @ 839B498
	.4byte sub_8084394
	.4byte sub_8084398
	.4byte sub_80843DC
	.4byte sub_808441C
	.4byte sub_8084478
	.4byte sub_8084534
	.4byte sub_8084578
	.4byte sub_80845AC
	.4byte sub_80845C8
	.4byte sub_80845FC
	.4byte sub_8084654
	.4byte sub_80846C8

	.global gUnknown_0839B4C8
gUnknown_0839B4C8: @ 839B4C8
	.incbin "baserom.gba", 0x0039b4c8, 0x48

	.global gUnknown_0839B510
gUnknown_0839B510: @ 839B510
	.incbin "baserom.gba", 0x0039b510, 0x18

	.global gUnknown_0839B528
gUnknown_0839B528: @ 839B528
	.incbin "baserom.gba", 0x0039b528, 0x18

@ 839B540
	.include "data/wild_mons.s"

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

	.align 2
	.global gUnknown_0839F0D4
gUnknown_0839F0D4: @ 839F0D4
	.4byte FieldEffectCmd_loadtiles
	.4byte FieldEffectCmd_loadfadedpal
	.4byte FieldEffectCmd_loadpal
	.4byte FieldEffectCmd_callnative
	.4byte sub_8085700
	.4byte FieldEffectCmd_loadgfx_callnative
	.4byte FieldEffectCmd_loadtiles_callnative
	.4byte FieldEffectCmd_loadfadedpal_callnative

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

	.align 2
	.global gUnknown_0839F268
gUnknown_0839F268: @ 839F268
	.4byte sub_8085DF4
	.4byte sub_8085E30
	.4byte sub_8085E6C
	.4byte sub_8085E94

	.align 2
	.global gUnknown_0839F278
gUnknown_0839F278: @ 839F278
	.4byte sub_8085F40
	.4byte sub_8085FB4
	.4byte sub_8085FE4
	.4byte sub_808600C

	.align 2
	.global gUnknown_0839F288
gUnknown_0839F288: @ 839F288
	.4byte sub_80860BC
	.4byte sub_8086154
	.4byte sub_8086188
	.4byte sub_80862C8
	.4byte sub_80863BC
	.4byte sub_80863D8
	.4byte sub_80863E0
	.4byte nullsub_57

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
	.space 4

	.align 2
	.global gUnknown_0839F2CC
gUnknown_0839F2CC: @ 839F2CC
	.4byte sub_80867AC
	.4byte sub_8086854
	.4byte sub_8086870
	.4byte sub_80868E4
	.4byte sub_808699C
	.4byte sub_80869B8
	.4byte sub_80869F8

	.align 2
	.global gUnknown_0839F2E8
gUnknown_0839F2E8: @ 839F2E8
	.4byte sub_8086AA0
	.4byte sub_8086AC0
	.4byte sub_8086B30
	.4byte sub_8086B54
	.4byte sub_8086B64
	.4byte sub_8086B88

	.align 2
	.global gUnknown_0839F300
gUnknown_0839F300: @ 839F300
	.4byte sub_8086CF4
	.4byte sub_8086D70
	.4byte sub_8086DB0
	.4byte sub_8086E10
	.4byte sub_8086E50
	.4byte sub_8086EB0
	.4byte sub_8086ED4

	.align 2
	.global gUnknown_0839F31C
gUnknown_0839F31C: @ 839F31C
	.4byte sub_8086FB0
	.4byte waterfall_1_do_anim_probably
	.4byte waterfall_2_wait_anim_finish_probably
	.4byte sub_8087030
	.4byte sub_8087058

	.align 2
	.global gUnknown_0839F330
gUnknown_0839F330: @ 839F330
	.4byte sub_8087124
	.4byte dive_2_unknown
	.4byte dive_3_unknown

	.align 2
	.global gUnknown_0839F33C
gUnknown_0839F33C: @ 839F33C
	.4byte sub_808722C
	.4byte sub_8087264
	.4byte sub_8087298
	.4byte sub_80872E4
	.4byte sub_80873D8
	.4byte sub_80873F4

	.align 2
	.global gUnknown_0839F354
gUnknown_0839F354: @ 839F354
	.4byte sub_80874CC
	.4byte sub_80874FC
	.4byte sub_8087548
	.4byte sub_808759C

	.align 2
	.global gUnknown_0839F364
gUnknown_0839F364: @ 839F364
	.4byte sub_80876C8
	.4byte sub_80876F8
	.4byte sub_8087774
	.4byte sub_80877AC
	.4byte sub_80877D4

	.align 2
	.global gUnknown_0839F378
gUnknown_0839F378: @ 839F378
	.4byte sub_80878F4
	.4byte sub_8087914

	.global gUnknown_0839F380
gUnknown_0839F380: @ 839F380
	.incbin "baserom.gba", 0x0039f380, 0x8

	.align 2
	.global gUnknown_0839F388
gUnknown_0839F388: @ 839F388
	.4byte sub_8087AA4
	.4byte sub_8087AC8

	.align 2
	.global gUnknown_0839F390
gUnknown_0839F390: @ 839F390
	.4byte sub_8087BEC
	.4byte sub_8087C14
	.4byte sub_8087CA4
	.4byte sub_8087D78

	.align 2
	.global gUnknown_0839F3A0
gUnknown_0839F3A0: @ 839F3A0
	.4byte sub_8087E4C
	.4byte sub_8087ED8
	.4byte sub_8087FDC

	.align 2
	.global gUnknown_0839F3AC
gUnknown_0839F3AC: @ 839F3AC
	.4byte sub_8088150
	.4byte sub_80881C0
	.4byte sub_8088228
	.4byte sub_80882B4
	.4byte sub_80882E4
	.4byte sub_8088338
	.4byte sub_8088380

	.align 2
	.global gUnknown_0839F3C8
gUnknown_0839F3C8: @ 839F3C8
	.4byte sub_80884AC
	.4byte sub_80884E8
	.4byte sub_8088554
	.4byte sub_80885A8
	.4byte sub_80885D8
	.4byte sub_808860C
	.4byte sub_808862C

	.align 2
	.global gUnknown_0839F3E4
gUnknown_0839F3E4: @ 839F3E4
	.4byte sub_8088984
	.4byte sub_80889E4
	.4byte sub_8088A30
	.4byte sub_8088A78
	.4byte sub_8088AF4

	.align 2
	.global gUnknown_0839F3F8
gUnknown_0839F3F8: @ 839F3F8
Unknown_839F3F8:
	.4byte sub_8088CA0
	.4byte sub_8088CF8
	.4byte sub_8088D3C
	.4byte sub_8088D94
	.4byte sub_8088DD8
	.4byte sub_8088E2C
	.4byte sub_8088EB4
	.4byte sub_8088F10
	.4byte sub_8088F30
Unknown_839F41C:
	.incbin "baserom.gba", 0x0039f41c, 0x18
Unknown_839F434:
	.incbin "baserom.gba", 0x0039f434, 0x18

	.align 2
	.global gUnknown_0839F44C
gUnknown_0839F44C: @ 839F44C
	.4byte Unknown_839F41C
	.4byte Unknown_839F434

	.align 2
	.global gUnknown_0839F454
gUnknown_0839F454: @ 839F454
	.4byte sub_80892A0
	.4byte sub_8089354
	.4byte sub_80893C0
	.4byte sub_8089414
	.4byte sub_808948C
	.4byte sub_80894C4
	.4byte fishE

	.global gUnknown_0839F470
gUnknown_0839F470: @ 839F470
	.incbin "baserom.gba", 0x0039f470, 0x24

	.align 2
	.global gUnknown_0839F494
gUnknown_0839F494: @ 839F494
	.4byte OtherText_Summary
	.4byte sub_8089FCC
	.4byte OtherText_Switch2
	.4byte sub_808A02C
	.4byte OtherText_Item
	.4byte sub_808A140
	.4byte OtherText_Cancel2
	.4byte sub_808A918
	.4byte OtherText_Give2
	.4byte sub_808A630
	.4byte OtherText_Take2
	.4byte sub_808A688
	.4byte OtherText_Take
	.4byte sub_808A6B8
	.4byte OtherText_Mail
	.4byte sub_808A6E8
	.4byte OtherText_Read2
	.4byte sub_808A810
	.4byte OtherText_Cancel2
	.4byte sub_808A938
	.4byte gMoveNames + 13 * MOVE_CUT
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_FLASH
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_ROCK_SMASH
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_STRENGTH
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_SURF
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_FLY
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_DIVE
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_WATERFALL
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_TELEPORT
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_DIG
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_SECRET_POWER
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_MILK_DRINK
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_SOFT_BOILED
	.4byte sub_808A984
	.4byte gMoveNames + 13 * MOVE_SWEET_SCENT
	.4byte sub_808A984

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
@ not sure if this is even a string, wont label
	.string "$"

@ 83A05F9
	.include "data/pokedex_entries.s"

	.global gUnknown_083B4EC4
gUnknown_083B4EC4: @ 83B4EC4
	.space 32

@ 83B4EE4
	.include "data/graphics/pokemon/footprint_table.s"

	.global gUnknown_083B5558
gUnknown_083B5558: @ 83B5558
	.incbin "baserom.gba", 0x003b5558, 0x2c

	.align 2
	.global gUnknown_083B5584
gUnknown_083B5584: @ 83B5584
Unknown_83B5584:
	.4byte 0x02008000
	.4byte 0x0200c000
	.4byte 0x02010000
	.4byte 0x02014000
Unknown_83B5594:
	.incbin "baserom.gba", 0x003b5594, 0x80
Unknown_83B5614:
	.incbin "baserom.gba", 0x003b5614, 0x80
Unknown_83B5694:
	.incbin "baserom.gba", 0x003b5694, 0x80
Unknown_83B5714:
	.incbin "baserom.gba", 0x003b5714, 0x80

	.align 2
	.global gUnknown_083B5794
gUnknown_083B5794: @ 83B5794
	.4byte Unknown_83B5594
	.4byte Unknown_83B5614
	.4byte Unknown_83B5694
	.4byte Unknown_83B5714

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

	.align 2
	.global gUnknown_083B5EBC
gUnknown_083B5EBC: @ 83B5EBC
	.4byte sub_8093864
	.4byte sub_80938A8
	.4byte rfu_NI_stopReceivingData
	.4byte sub_8093918
	.4byte sub_8093938
	.4byte sub_8093954
	.4byte sub_8093980

	.align 2
	.global gUnknown_083B5ED8
gUnknown_083B5ED8: @ 83B5ED8
	.4byte sub_8093AA0
	.4byte sub_8093AF0
	.4byte sub_8093C0C
	.4byte sub_8093C38
	.4byte sub_8093D50

	.align 2
	.global gUnknown_083B5EEC
gUnknown_083B5EEC: @ 83B5EEC
	.4byte 0x08e8cac0
	.4byte 0x08e8d4c0

	.global gUnknown_083B5EF4
gUnknown_083B5EF4: @ 83B5EF4
	.incbin "baserom.gba", 0x003b5ef4, 0x4

	.align 2
	.global gUnknown_083B5EF8
gUnknown_083B5EF8: @ 83B5EF8
	.4byte 0x08e8c8e0
	.4byte 0x08e8c940
	.4byte 0x08e8c9a0
	.4byte 0x08e8ca00
	.4byte 0x08e8ca60

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

	.align 2
	.global gUnknown_083B6DB8
gUnknown_083B6DB8: @ 83B6DB8
	.4byte 0x02039360

	.global gUnknown_083B6DBC
gUnknown_083B6DBC: @ 83B6DBC
	obj_pal 0x083b6b94, 0xdacd

	.global gUnknown_083B6DC4
gUnknown_083B6DC4: @ 83B6DC4
	obj_tiles 0x083b6bb4, 448, 0x0005

	.global gUnknown_083B6DCC
gUnknown_083B6DCC: @ 83B6DCC
	obj_tiles 0x02002784, 2048, 0x0002

	.global gUnknown_083B6DD4
gUnknown_083B6DD4: @ 83B6DD4
	obj_pal 0x02002704, 0xdac7

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

	.align 2
	.global gUnknown_083B6F5C
gUnknown_083B6F5C: @ 83B6F5C
	.4byte 0x083B6F34
	.4byte 0x083B6F44
	.incbin "graphics/pokemon_storage/box_bg1.gbapal" @ unknown palette, hand?
	.incbin "graphics/pokemon_storage/forest_frame.gbapal"
	.incbin "graphics/pokemon_storage/forest_bg.gbapal"
	.incbin "graphics/pokemon_storage/forest.4bpp.lz" @ forest
	.incbin "graphics/pokemon_storage/forest.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/city_frame.gbapal"
	.incbin "graphics/pokemon_storage/city_bg.gbapal"
	.incbin "graphics/pokemon_storage/city.4bpp.lz" @ city
	.incbin "graphics/pokemon_storage/city.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/desert_frame.gbapal"
	.incbin "graphics/pokemon_storage/desert_bg.gbapal"
	.incbin "graphics/pokemon_storage/desert.4bpp.lz" @ desert
	.incbin "graphics/pokemon_storage/desert.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/savanna_frame.gbapal"
	.incbin "graphics/pokemon_storage/savanna_bg.gbapal"
	.incbin "graphics/pokemon_storage/savanna.4bpp.lz" @ savanna
	.incbin "graphics/pokemon_storage/savanna.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/crag_frame.gbapal"
	.incbin "graphics/pokemon_storage/crag_bg.gbapal"
	.incbin "graphics/pokemon_storage/crag.4bpp.lz" @ crag
	.incbin "graphics/pokemon_storage/crag.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/volcano_frame.gbapal"
	.incbin "graphics/pokemon_storage/volcano_bg.gbapal"
	.incbin "graphics/pokemon_storage/volcano.4bpp.lz" @ volcano
	.4byte 0x00000000 @ why is there padding here?
	.incbin "graphics/pokemon_storage/volcano.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/snow_frame.gbapal"
	.incbin "graphics/pokemon_storage/snow_bg.gbapal"
	.incbin "graphics/pokemon_storage/snow.4bpp.lz" @ snow
	.incbin "graphics/pokemon_storage/snow.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/cave_frame.gbapal"
	.incbin "graphics/pokemon_storage/cave_bg.gbapal"
	.incbin "graphics/pokemon_storage/cave.4bpp.lz" @ cave
	.incbin "graphics/pokemon_storage/cave.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/beach_frame.gbapal"
	.incbin "graphics/pokemon_storage/beach_bg.gbapal"
	.incbin "graphics/pokemon_storage/beach.4bpp.lz" @ beach
	.incbin "graphics/pokemon_storage/beach.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/seafloor_frame.gbapal"
	.incbin "graphics/pokemon_storage/seafloor_bg.gbapal"
	.incbin "graphics/pokemon_storage/seafloor.4bpp.lz" @ seafloor
	.incbin "graphics/pokemon_storage/seafloor.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/river_frame.gbapal"
	.incbin "graphics/pokemon_storage/river_bg.gbapal"
	.incbin "graphics/pokemon_storage/river.4bpp.lz" @ river
	.incbin "graphics/pokemon_storage/river.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/sky_frame.gbapal"
	.incbin "graphics/pokemon_storage/sky_bg.gbapal"
	.incbin "graphics/pokemon_storage/sky.4bpp.lz" @ sky
	.incbin "graphics/pokemon_storage/sky.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg2.gbapal"
	.incbin "graphics/pokemon_storage/polkadot_frame.gbapal"
	.incbin "graphics/pokemon_storage/polkadot_bg.gbapal"
	.incbin "graphics/pokemon_storage/polkadot.4bpp.lz" @ polkadot
	.incbin "graphics/pokemon_storage/polkadot.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg2.gbapal"
	.incbin "graphics/pokemon_storage/pokecenter_frame.gbapal"
	.incbin "graphics/pokemon_storage/pokecenter_bg.gbapal"
	.incbin "graphics/pokemon_storage/pokecenter.4bpp.lz" @ pokecenter
	.incbin "graphics/pokemon_storage/pokecenter.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg3.gbapal"
	.incbin "graphics/pokemon_storage/machine_frame.gbapal"
	.incbin "graphics/pokemon_storage/machine_bg.gbapal"
	.incbin "graphics/pokemon_storage/machine.4bpp.lz" @ machine
	.incbin "graphics/pokemon_storage/machine.bin.lz"
	.incbin "graphics/pokemon_storage/box_bg4.gbapal"
	.incbin "graphics/pokemon_storage/plain_frame.gbapal"
	.incbin "graphics/pokemon_storage/plain_bg.gbapal"
	.incbin "graphics/pokemon_storage/plain.4bpp.lz" @ plain
	.incbin "graphics/pokemon_storage/plain.bin.lz"
	.incbin "baserom.gba", 0x003BAEF8, 0x1B0

	.global gUnknown_083BB0A8
gUnknown_083BB0A8: @ 83BB0A8
	.incbin "baserom.gba", 0x003bb0a8, 0x40

	.global gUnknown_083BB0E8
gUnknown_083BB0E8: @ 83BB0E8
	obj_pal 0x083B6FC4, 0x03D0
	.4byte 0x083B7394
	.4byte 0x083B6F64
	obj_pal 0x083B74D0, 0x0208
	.4byte 0x083B76D8
	.4byte 0x083B7470
	obj_pal 0x083B77E8, 0x02EC
	.4byte 0x083B7AD4
	.4byte 0x083B7788
	obj_pal 0x083B7C18, 0x0220
	.4byte 0x083B7E38
	.4byte 0x083B7BB8
	obj_pal 0x083B7F64, 0x0350
	.4byte 0x083B82B4
	.4byte 0x083B7F04
	obj_pal 0x083B83EC, 0x0334
	.4byte 0x083B8720
	.4byte 0x083B838C
	obj_pal 0x083B8858, 0x02B8
	.4byte 0x083B8B10
	.4byte 0x083B87F8
	obj_pal 0x083B8C3C, 0x0344
	.4byte 0x083B8F80
	.4byte 0x083B8BDC
	obj_pal 0x083B90BC, 0x0384
	.4byte 0x083B9440
	.4byte 0x083B905C
	obj_pal 0x083B9588, 0x02B4
	.4byte 0x083B983C
	.4byte 0x083B9528
	obj_pal 0x083B9978, 0x0294
	.4byte 0x083B9C0C
	.4byte 0x083B9918
	obj_pal 0x083B9D58, 0x0298
	.4byte 0x083B9FF0
	.4byte 0x083B9CF8
	obj_pal 0x083BA130, 0x01FC
	.4byte 0x083BA32C
	.4byte 0x083BA0D0
	obj_pal 0x083BA444, 0x03A4
	.4byte 0x083BA7E8
	.4byte 0x083BA3E4
	obj_pal 0x083BA95C, 0x02F0
	.4byte 0x083BAC4C
	.4byte 0x083BA8FC
	obj_pal 0x083BAD78, 0x00FC
	.4byte 0x083BAE74
	.4byte 0x083BAD18
	.incbin "graphics/pokemon_storage/arrow.gbapal"
	.incbin "graphics/pokemon_storage/arrow.4bpp"

	.global gUnknown_083BB288
gUnknown_083BB288: @ 83BB288
	obj_tiles 0x083bb208, 128, 0x0006

	.global gUnknown_083BB290
gUnknown_083BB290: @ 83BB290
	.incbin "baserom.gba", 0x003bb290, 0x28

	.global gUnknown_083BB2B8
gUnknown_083BB2B8: @ 83BB2B8
	.incbin "baserom.gba", 0x003bb2b8, 0x38

	.global gUnknown_083BB2F0
gUnknown_083BB2F0: @ 83BB2F0
	.incbin "baserom.gba", 0x003bb2f0, 0x8d8

	.align 2
	.global gUnknown_083BBBC8
gUnknown_083BBBC8: @ 83BBBC8
	.4byte sub_809B150
	.4byte sub_809B1D8
	.4byte sub_809B24C

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

	.align 2
	.global gUnknown_083BBCA0
gUnknown_083BBCA0: @ 83BBCA0
	.4byte PCText_Cancel2
	.4byte PCText_Deposit
	.4byte PCText_Withdraw
	.4byte PCText_Move
	.4byte PCText_Switch
	.4byte PCText_Place
	.4byte PCText_Summary
	.4byte PCText_Release
	.4byte PCText_Mark
	.4byte PCText_Jump
	.4byte PCText_Wallpaper
	.4byte PCText_Name
	.4byte PCText_Scenery1
	.4byte PCText_Scenery2
	.4byte PCText_Scenery3
	.4byte PCText_Etc
	.4byte PCText_Forest
	.4byte PCText_City
	.4byte PCText_Desert
	.4byte PCText_Savanna
	.4byte PCText_Crag
	.4byte PCText_Volcano
	.4byte PCText_Snow
	.4byte PCText_Cave
	.4byte PCText_Beach
	.4byte PCText_Seafloor
	.4byte PCText_River
	.4byte PCText_Sky
	.4byte PCText_Polka
	.4byte PCText_PokeCenter
	.4byte PCText_Machine
	.4byte PCText_Plain
	
@ 83BBD20
	.include "data/graphics/pokemon/icon_table.s"

@ 83BC400
	.include "data/graphics/pokemon/icon_palette_indices.s"

@ 83BC5B8
	.include "data/graphics/pokemon/icon_palette_table.s"

	.global gUnknown_083BC5E8
gUnknown_083BC5E8: @ 83BC5E8
	.incbin "baserom.gba", 0x3BC5E8, 0x8
Unknown_83BC5F0:
	.incbin "baserom.gba", 0x3BC5F0, 0xC
Unknown_83BC5FC:
	.incbin "baserom.gba", 0x3BC5FC, 0xC
Unknown_83BC608:
	.incbin "baserom.gba", 0x3BC608, 0xC
Unknown_83BC614:
	.incbin "baserom.gba", 0x3BC614, 0xC
Unknown_83BC620:
	.incbin "baserom.gba", 0x3BC620, 0xC

	.align 2
	.global gUnknown_083BC62C
gUnknown_083BC62C: @ 83BC62C
Unknown_83BC62C:
	.4byte Unknown_83BC5F0
	.4byte Unknown_83BC5FC
	.4byte Unknown_83BC608
	.4byte Unknown_83BC614
	.4byte Unknown_83BC620
Unknown_83BC640:
	.incbin "baserom.gba", 0x003bc640, 0x10
Unknown_83BC650:
	.incbin "baserom.gba", 0x003bc650, 0x10

	.align 2
	.global gUnknown_083BC660
gUnknown_083BC660: @ 83BC660
	.4byte Unknown_83BC640
	.4byte Unknown_83BC650

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
	obj_tiles 0x08e71d10, 5888, 0x7532

	.global gUnknown_083C11C0
gUnknown_083C11C0: @ 83C11C0
	.incbin "baserom.gba", 0x003c11c0, 0x18

	.global gUnknown_083C11D8
gUnknown_083C11D8: @ 83C11D8
	.incbin "baserom.gba", 0x003c11d8, 0x98

	.global gUnknown_083C1270
gUnknown_083C1270: @ 83C1270
	obj_tiles 0x08e7274c, 1024, 0x7530

	.global gUnknown_083C1278
gUnknown_083C1278: @ 83C1278
	obj_pal 0x08e72848, 0x7530

	.global gUnknown_083C1280
gUnknown_083C1280: @ 83C1280
	.incbin "baserom.gba", 0x003c1280, 0x74

	.global gUnknown_083C12F4
gUnknown_083C12F4: @ 83C12F4
	obj_tiles 0x08e72860, 896, 0x7531

	.global gUnknown_083C12FC
gUnknown_083C12FC: @ 83C12FC
	obj_pal 0x08e72a50, 0x7531

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
	.4byte sub_809FC0C
	.4byte sub_809FEB8

	.align 2
	.global gUnknown_083C1588
gUnknown_083C1588: @ 83C1588
	.4byte sub_809F63C
	.4byte sub_809F650
	.4byte sub_809F664
	.4byte sub_809F664

	.align 2
	.global gUnknown_083C1598
gUnknown_083C1598: @ 83C1598
	.4byte sub_809FE6C
	.4byte sub_80A0090
	.4byte sub_80A015C
	.4byte sub_80A015C

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

	.align 2
	.global gUnknown_083C16BC
gUnknown_083C16BC: @ 83C16BC
	.4byte sub_80A59D0
	.4byte sub_80A599C
	.4byte sub_80A7024
	.4byte sub_80A70D8
	.4byte sub_80A6214
	.4byte sub_80A61EC
	.4byte sub_80A6354
	.4byte sub_80A631C
	.4byte sub_80A6918
	.4byte sub_80A68F0
	.4byte sub_80A59D0
	.4byte sub_80A69B8
	.4byte sub_80A6C6C
	.4byte sub_80A6A4C

	.align 2
	.global gUnknown_083C16F4
gUnknown_083C16F4: @ 83C16F4
	.4byte sub_80A5E60
	.4byte sub_80A5E90

	.align 2
	.global gUnknown_083C16FC
gUnknown_083C16FC: @ 83C16FC
	.4byte sub_80A65AC
	.4byte sub_80A6618

	.global gUnknown_083C1704
gUnknown_083C1704: @ 83C1704
	.incbin "baserom.gba", 0x003c1704, 0x4

	.global gUnknown_083C1708
gUnknown_083C1708: @ 83C1708
	.incbin "baserom.gba", 0x003c1708, 0x2

	.global gUnknown_083C170A
gUnknown_083C170A: @ 83C170A
Unknown_83C170A:
	.incbin "baserom.gba", 0x003c170a, 0x592
Unknown_83C1C9C:
	.incbin "baserom.gba", 0x003c1c9c, 0x28

	.global gUnknown_083C1CC4
gUnknown_083C1CC4: @ 83C1CC4
	.4byte Unknown_83C1C9C

	.global gUnknown_083C1CC8
gUnknown_083C1CC8: @ 83C1CC8
	obj_tiles 0x08e75024, 12288, 0x7530

	.global gUnknown_083C1CD0
gUnknown_083C1CD0: @ 83C1CD0
	obj_tiles 0x08e75ba0, 12288, 0x7530

	.global gUnknown_083C1CD8
gUnknown_083C1CD8: @ 83C1CD8
	obj_pal 0x08e76700, 0x7530

	.global gUnknown_083C1CE0
gUnknown_083C1CE0: @ 83C1CE0
Unknown_83C1CE0:
	.incbin "baserom.gba", 0x003c1ce0, 0x20
Unknown_83C1D00:
	.incbin "baserom.gba", 0x003c1d00, 0x20

	.global gUnknown_083C1D20
gUnknown_083C1D20: @ 83C1D20
	.4byte Unknown_83C1D00

	.global gUnknown_083C1D24
gUnknown_083C1D24: @ 83C1D24
	.incbin "baserom.gba", 0x003c1d24, 0xc

	.global gUnknown_083C1D30
gUnknown_083C1D30: @ 83C1D30
	obj_pal 0x083c170c, 0x0008

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
	obj_tiles 0x08e78bb4, 2048, 0x2710

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
	.string "テストです$" @ "test"

Unknown_83C9166:
	.string "Contest$"

Unknown_83C916E:
	.string "Contest results$"

	.string "パラメータへんこう$" @ "Change parameter"

	.string "わざ へんこう$" @ "Change move"

Unknown_83C9190:
	.string "Contest (comm.)$"

Unknown_83C91A0:
	.string "Init comm. data$"

Unknown_83C91B0:
	.string "Set highest score$"

Unknown_83C91C2:
	.string "Reset highest score$"

Unknown_83C91D6:
	.string "Set all art museum items$"

	.align 2
	.global gUnknown_083C91F0
gUnknown_083C91F0: @ 83C91F0
	.4byte Unknown_83C9166
	.4byte sub_80A9C1C
	.4byte Unknown_83C916E
	.4byte sub_80A9BBC
	.4byte Unknown_83C9190
	.4byte sub_80A9C34
	.4byte Unknown_83C91A0
	.4byte sub_80A9C40
	.4byte Unknown_83C91B0
	.4byte sub_80AAFDC
	.4byte Unknown_83C91C2
	.4byte sub_80AAFEC
	.4byte Unknown_83C91D6
	.4byte sub_80AB02C

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
	obj_tiles 0x083c922d, 32, 0x04b0

	.global gUnknown_083C92BC
gUnknown_083C92BC: @ 83C92BC
	.incbin "baserom.gba", 0x003c92bc, 0x10

	.global gUnknown_083C92CC
gUnknown_083C92CC: @ 83C92CC
	.incbin "baserom.gba", 0x003c92cc, 0x18

	.align 2
	.global gUnknown_083C92E4
gUnknown_083C92E4: @ 83C92E4
	.4byte sub_80AA8C8
	.4byte sub_80AA8D8
	.4byte sub_80AA8E8
	.4byte sub_80AA8F8
	.4byte sub_80AAC5C
	.4byte sub_80AAC5C
	.4byte sub_80AA930
	.4byte sub_80AA974
	.4byte sub_80AA9B8
	.4byte sub_80AA9FC
	.4byte sub_80AAA40
	.4byte sub_80AAA84
	.4byte sub_80AAAF0
	.4byte sub_80AAB30
	.4byte sub_80AAB70
	.4byte sub_80AABB0
	.4byte sub_80AABF0
	.4byte sub_80AAD44

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
	.incbin "baserom.gba", 0x3C9364, 0x18
Unknown_83C937C:
	.incbin "baserom.gba", 0x3C937C, 0xB
Unknown_83C9387:
	.incbin "baserom.gba", 0x3C9387, 0xB
Unknown_83C9392:
	.incbin "baserom.gba", 0x3C9392, 0xB
Unknown_83C939D:
	.incbin "baserom.gba", 0x3C939D, 0xB
Unknown_83C93A8:
	.incbin "baserom.gba", 0x3C93A8, 0xC

	.align 2
	.global gUnknown_083C93B4
gUnknown_083C93B4: @ 83C93B4
Unknown_83C93B4:
	.4byte Unknown_83C937C
	.4byte Unknown_83C9387
	.4byte Unknown_83C9392
	.4byte Unknown_83C939D
	.4byte Unknown_83C93A8
Unknown_83C93C8:
	.incbin "baserom.gba", 0x003c93c8, 0xA
Unknown_83C93D2:
	.incbin "baserom.gba", 0x003c93d2, 0xA
Unknown_83C93DC:
	.incbin "baserom.gba", 0x003c93dc, 0xA
Unknown_83C93E6:
	.incbin "baserom.gba", 0x003c93e6, 0xA

	.align 2
	.global gUnknown_083C93F0
gUnknown_083C93F0: @ 83C93F0
	.4byte Unknown_83C93C8
	.4byte Unknown_83C93D2
	.4byte Unknown_83C93DC
	.4byte Unknown_83C93E6

	.global gUnknown_083C9400
gUnknown_083C9400: @ 83C9400
	.incbin "baserom.gba", 0x003c9400, 0x8

	.global gUnknown_083C9408
gUnknown_083C9408: @ 83C9408

	.include "data/contest_opponents.s"

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
	.space 1

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
	obj_tiles 0x08e69404, 256, 0x4e26
	obj_tiles 0x08e69404, 256, 0x4e27
	obj_tiles 0x08e69404, 256, 0x4e28
	obj_tiles 0x08e69404, 256, 0x4e29

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
	obj_tiles 0x08e69648, 1024, 0xabe2

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
	obj_tiles 0x08d1c748, 2048, 0x4e25

	.global gUnknown_083CA4C4
gUnknown_083CA4C4: @ 83CA4C4
	obj_tiles 0x08d19590, 896, 0xabe0

	.global gUnknown_083CA4CC
gUnknown_083CA4CC: @ 83CA4CC
	obj_pal 0x08d19734, 0xabe0

	.include "data/text/contest_strings.s"

	.global gUnknown_083CC330
gUnknown_083CC330: @ 83CC330
	.incbin "baserom.gba", 0x003cc330, 0x1d
@ not labeling until im sure what this is.
	.string "{HIGHLIGHT TRANSPARENT}{COLOR MAGENTA} $"

	.global gUnknown_083CC355
gUnknown_083CC355: @ 83CC355
UnknownText_MissedTurn:
	.string "Missed turn$"

	.global gUnknown_083CC361
gUnknown_083CC361: @ 83CC361
UnknownText_LinkStandby:
	.string "Link standby...$"
UnknownText_UnknownFormatting:
	.string "{COLOR WHITE2}$"
UnknownText_WinnerIs:
	.string "The winner is {STR_VAR_1}’s {STR_VAR_2}!\nCongratulations!$"
	.incbin "baserom.gba", 0x003cc39d, 0x3

	.global gUnknown_083CC3A0
gUnknown_083CC3A0: @ 83CC3A0
UnknownText_UnknownFormatting2:
	.string "{COLOR GREEN}{SHADOW RED}$"

	.global gUnknown_083CC3A7
gUnknown_083CC3A7: @ 83CC3A7
UnknownText_UnknownFormatting3:
	.string "{COLOR LIGHT_GREY}$"

	.align 2
	.global gUnknown_083CC3AC
gUnknown_083CC3AC: @ 83CC3AC
	obj_tiles 0x08d16024, 512, 0x4e20

	.global gUnknown_083CC3B4
gUnknown_083CC3B4: @ 83CC3B4
	.incbin "baserom.gba", 0x003cc3b4, 0xa0

	.global gUnknown_083CC454
gUnknown_083CC454: @ 83CC454
	.incbin "baserom.gba", 0x003cc454, 0x60

	.global gUnknown_083CC4B4
gUnknown_083CC4B4: @ 83CC4B4
	obj_tiles 0x08d0314c, 4096, 0x80e8
	obj_tiles 0x08d0314c, 4096, 0x80e9
	obj_tiles 0x08d0314c, 4096, 0x80ea
	obj_tiles 0x08d0314c, 4096, 0x80eb

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

	.align 2
	.global gUnknown_083CC6D0
gUnknown_083CC6D0: @ 83CC6D0
	.4byte ContestStatsText_Buy
	.4byte sub_80B2EFC
	.4byte ContestStatsText_Sell
	.4byte sub_80B2F30
	.4byte ContestStatsText_Quit2
	.4byte HandleShopMenuQuit

	.global gUnknown_083CC6E8
gUnknown_083CC6E8: @ 83CC6E8
	.incbin "baserom.gba", 0x003cc6e8, 0x3

	.global gUnknown_083CC6EB
gUnknown_083CC6EB: @ 83CC6EB
	.incbin "baserom.gba", 0x003cc6eb, 0x1d

	.align 2
	.global gUnknown_083CC708
gUnknown_083CC708: @ 83CC708
	.4byte sub_80B3BF4
	.4byte sub_80B3D7C

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

	.align 2
	.global gUnknown_083CE218
gUnknown_083CE218: @ 83CE218
	.4byte sub_80B5EA8
	.4byte sub_80B5ED0
	.4byte sub_80B5F00
	.4byte sub_80B5F10
	.4byte sub_80B5F38
	.4byte sub_80B5F70
	.4byte pokemon_store
	.4byte sub_80B604C
	.4byte sub_80B606C
	.4byte sub_80B6094

	.align 2
	.global gUnknown_083CE240
gUnknown_083CE240: @ 83CE240
	.4byte sub_80B6108
	.4byte sub_80B6148
	.4byte sub_80B6170
	.4byte sub_80B6194

	.align 2
	.global gUnknown_083CE250
gUnknown_083CE250: @ 83CE250
	.4byte sub_80B626C
	.4byte sub_80B6274

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

	.align 2
	.global gUnknown_083CE27C
gUnknown_083CE27C: @ 83CE27C
	.4byte sub_80B6668
	.4byte sub_80B6680
	.4byte sub_80B66EC
	.4byte sub_80B6758

	.align 2
	.global gUnknown_083CE28C
gUnknown_083CE28C: @ 83CE28C
	.4byte 0x02000006
	.4byte 0x02000004

	.global gUnknown_083CE294
gUnknown_083CE294: @ 83CE294
	.incbin "baserom.gba", 0x003ce294, 0x1b

	.global gUnknown_083CE2AF
gUnknown_083CE2AF: @ 83CE2AF
	.incbin "baserom.gba", 0x003ce2af, 0x5

	.align 2
	.global gUnknown_083CE2B4
gUnknown_083CE2B4: @ 83CE2B4
	.4byte sub_80B6B5C
	.4byte sub_80B6B98
	.4byte sub_80B6B9C
	.4byte sub_80B6C08

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

	.align 2
	.global gUnknown_083CE2E0
gUnknown_083CE2E0: @ 83CE2E0
	.4byte nullsub_40
	.4byte sub_80B6E68
	.4byte sub_80B6EBC
	.4byte sub_80B6EFC

	.align 2
	.global gUnknown_083CE2F0
gUnknown_083CE2F0: @ 83CE2F0
	.4byte sub_80B7660
	.4byte sub_80B7650
	.4byte sub_80B7650
	.4byte sub_80B7670
	.4byte sub_80B7670
	.4byte sub_80B7660

	.global gUnknown_083CE308
gUnknown_083CE308: @ 83CE308
	.incbin "baserom.gba", 0x003ce308, 0x8

	.align 2
	.global gUnknown_083CE310
gUnknown_083CE310: @ 83CE310
	.4byte sub_80B7844
	.4byte sub_80B7838
	.4byte sub_80B7838
	.4byte sub_80B7850
	.4byte sub_80B7850
	.4byte sub_80B7844

	.align 2
	.global gUnknown_083CE328
gUnknown_083CE328: @ 83CE328
	.4byte 0x081e6edc
	.4byte 0x081e6ef8
	.4byte 0x081e6ea4
	.4byte 0x081e6ec0
	.4byte 0x081e6ea4
	.4byte 0x081e6ec0
	.4byte 0x081e6f14
	.4byte 0x081e6f30
	.4byte 0x081e6f14
	.4byte 0x081e6f30
	.4byte 0x081e6edc
	.4byte 0x081e6ef8

	.align 2
	.global gUnknown_083CE358
gUnknown_083CE358: @ 83CE358
	.4byte nullsub_61
	.4byte nullsub_61
	.4byte sub_80B78F8
	.4byte sub_80B78F8

	.align 2
	.global gUnknown_083CE368
gUnknown_083CE368: @ 83CE368
	.4byte nullsub_62
	.4byte sub_80B7924

	.global gUnknown_083CE370
gUnknown_083CE370: @ 83CE370
Unknown_83CE370:
	.incbin "baserom.gba", 0x003ce370, 0x4
Unknown_83CE374:
	.incbin "baserom.gba", 0x003ce374, 0xC
Unknown_83CE380:
	.incbin "baserom.gba", 0x003ce380, 0xC
Unknown_83CE38C:
	.incbin "baserom.gba", 0x003ce38c, 0xC

	.align 2
	.global gUnknown_083CE398
gUnknown_083CE398: @ 83CE398
	.4byte Unknown_83CE374
	.4byte Unknown_83CE380
	.4byte Unknown_83CE38C
	.4byte Unknown_83CE38C

	.global gUnknown_083CE3A8
gUnknown_083CE3A8: @ 83CE3A8
@ not labeling this yet when its not fully dissassembled
	.string " A B C  D E F    . $"
	.string " G H I  J K L    , $"
	.string " M N O  P Q R S    $"
	.string " T U V  W X Y Z    $"
	.string " a b c  d e f    . $"
	.string " g h i  j k l    , $"
	.string " m n o  p q r s    $"
	.string " t u v  w x y z    $"
	.string " 0  1  2  3  4     $"
	.string " 5  6  7  8  9     $"
	.string " !  ?  ♂  ♀  /  -  $"
	.string " …  “  ”  ‘  ’     $"
	.incbin "baserom.gba", 0x003ce498, 0x1a
	.string ":$"
	.incbin "baserom.gba", 0x003ce4b4, 0xa4

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
	obj_tiles 0x08e77a5c, 256, 0x2722

	.global gUnknown_083CF58C
gUnknown_083CF58C: @ 83CF58C
	obj_pal 0x08e77900, 0x2722

@ 83CF594
	.include "data/contest_moves.s"

@ 83D00AC
	.include "data/contest_effects.s"

@ A lookup table with TRUE for each combo starter ID and FALSE for ID 0,
@ which means "not a combo starter move".
	.global gComboStarterLookupTable
gComboStarterLookupTable: @ 83D016C
	.byte FALSE
	.rept 62
	.byte TRUE
	.endr

@ 83D01AC
	.include "data/contest_effect_funcs.s"

	.align 2
	.global gUnknown_083D026C
gUnknown_083D026C: @ 83D026C
	.4byte 0x0202713c

	.align 2
	.global gUnknown_083D0270
gUnknown_083D0270: @ 83D0270
	.4byte 0x02027e6c

	.align 2
	.global gUnknown_083D0274
gUnknown_083D0274: @ 83D0274
	.4byte 0x020281f0

	.align 2
	.global gUnknown_083D0278
gUnknown_083D0278: @ 83D0278
	.4byte 0x020284c8

	.align 2
	.global gUnknown_083D027C
gUnknown_083D027C: @ 83D027C
	.4byte 0x02028508

	.align 2
	.global gUnknown_083D0280
gUnknown_083D0280: @ 83D0280
	.4byte 0x02038738

	.align 2
	.global gUnknown_083D0284
gUnknown_083D0284: @ 83D0284
	.4byte 0x02024f4c

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
DebugText_SoundCheckJap:
	.string "サウンドチェック$" @ Sound Check

	.global gUnknown_083D02D1
gUnknown_083D02D1: @ 83D02D1
DebugText_BGM:
	.string "BGM$"

	.global gUnknown_083D02D5
gUnknown_083D02D5: @ 83D02D5
DebugText_SE:
	.string "SE $"

	.global gUnknown_083D02D9
gUnknown_083D02D9: @ 83D02D9
	.incbin "baserom.gba", 0x003d02d9, 0xd

	.global gUnknown_083D02E6
gUnknown_083D02E6: @ 83D02E6
DebugText_UpDown:
	.string "L‥UP R‥DOWN$"

	.global gUnknown_083D02F2
gUnknown_083D02F2: @ 83D02F2
DebugText_DriverTest:
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
DebugText_Voice:
	.string "VOICE‥‥‥‥$"

	.global gUnknown_083D0331
gUnknown_083D0331: @ 83D0331
DebugText_Volume:
	.string "VOLUME‥‥‥$"

	.global gUnknown_083D033B
gUnknown_083D033B: @ 83D033B
DebugText_Panpot:
	.string "PANPOT‥‥‥$"

	.global gUnknown_083D0345
gUnknown_083D0345: @ 83D0345
DebugText_Pitch:
	.string "PITCH‥‥‥‥$"

	.global gUnknown_083D034F
gUnknown_083D034F: @ 83D034F
DebugText_Length:
	.string "LENGTH‥‥‥$"

	.global gUnknown_083D0359
gUnknown_083D0359: @ 83D0359
DebugText_Release:
	.string "RELEASE‥‥$"

	.global gUnknown_083D0363
gUnknown_083D0363: @ 83D0363
DebugText_Progress:
	.string "PROGRESS‥$"

	.global gUnknown_083D036D
gUnknown_083D036D: @ 83D036D
DebugText_Chorus:
	.string "CHORUS‥‥‥$"

	.global gUnknown_083D0377
gUnknown_083D0377: @ 83D0377
DebugText_Priority:
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
OtherText_SE:
	.string "SE$"

	.global gUnknown_083D0400
gUnknown_083D0400: @ 83D0400
OtherText_Pan:
	.string "PAN$"

	.global gUnknown_083D0404
gUnknown_083D0404: @ 83D0404
OtherText_LR:
	.string "  LR$"

	.global gUnknown_083D0409
gUnknown_083D0409: @ 83D0409
OtherText_RL:
	.string "  RL$"

@ 83D040E
	.include "data/text/song_names.s"

	.global gUnknown_083D1358
gUnknown_083D1358: @ 83D1358
	.incbin "baserom.gba", 0x003d1358, 0x1c

	.global gUnknown_083D1374
gUnknown_083D1374: @ 83D1374
	.incbin "baserom.gba", 0x003d1374, 0x60

	.align 2
	.global gUnknown_083D13D4
gUnknown_083D13D4: @ 83D13D4
	.4byte SecretBaseText_DelRegist
	.4byte sub_80BCA84
	.4byte UnknownText_Exit
	.4byte sub_80BCBF8

	.align 2
	.global gUnknown_083D13E4
gUnknown_083D13E4: @ 83D13E4
	.4byte sub_80BCB90
	.4byte sub_80BCBC0

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

	.align 2
	.global gUnknown_083D1464
gUnknown_083D1464: @ 83D1464
	.4byte 0x020231cc
	.4byte 0x020232cc
	.4byte 0x020233cc

	.align 2
	.global gUnknown_083D1470
gUnknown_083D1470: @ 83D1470
	.4byte 0x081a8ec9
	.4byte 0x081a9048
	.4byte 0x081a9067
	.4byte 0x081a9088
	.4byte 0x081a90b4
	.4byte 0x081a911f
	.4byte 0x081a9152
	.4byte 0x081a91c6

	.align 2
	.global gUnknown_083D1490
gUnknown_083D1490: @ 83D1490
	.4byte 0x081a9581
	.4byte 0x081a9694
	.4byte 0x081a971b
	.4byte 0x081a974b
	.4byte 0x081a979f
	.4byte 0x081a97d0

	.align 2
	.global gUnknown_083D14A8
gUnknown_083D14A8: @ 83D14A8
	.4byte 0x081a8917
	.4byte 0x081a8ae5
	.4byte 0x081a8b9d
	.4byte 0x081a8c77
	.4byte 0x081a8d45

	.align 2
	.global gUnknown_083D14BC
gUnknown_083D14BC: @ 83D14BC
	.4byte 0x081a986f

	.align 2
	.global gUnknown_083D14C0
gUnknown_083D14C0: @ 83D14C0
	.4byte 0x081aad23
	.4byte 0x081aadd5
	.4byte 0x081aae31
	.4byte 0x081aae9d
	.4byte 0x081aaf03
	.4byte 0x081aaf8a
	.4byte 0x081ab040
	.4byte 0x081ab0c8
	.4byte 0x081ab13d
	.4byte 0x081ab1c6
	.4byte 0x081ab266
	.4byte 0x081ab2db

	.align 2
	.global gUnknown_083D14F0
gUnknown_083D14F0: @ 83D14F0
	.4byte 0x081ab381
	.4byte 0x081ab435
	.4byte 0x081ab507
	.4byte 0x081ab5b8
	.4byte 0x081ab61f
	.4byte 0x081ab6b0
	.4byte 0x081ab78d
	.4byte 0x081ab7fe
	.4byte 0x081ab835
	.4byte 0x081ab873
	.4byte 0x081ab92e
	.4byte 0x081ab95e
	.4byte 0x081abb75

	.align 2
	.global gUnknown_083D1524
gUnknown_083D1524: @ 83D1524
	.4byte 0x081a72de
	.4byte 0x081a736b
	.4byte 0x081a73ca
	.4byte 0x081a744d
	.4byte 0x081a7508
	.4byte 0x081a75ce
	.4byte 0x081a768d
	.4byte 0x081a76c5
	.4byte 0x081a774f

	.align 2
	.global gUnknown_083D1548
gUnknown_083D1548: @ 83D1548
	.4byte 0x081a7b93
	.4byte 0x081a7c26
	.4byte 0x081a7c7d
	.4byte 0x081a7d4a
	.4byte 0x081a7e0c
	.4byte 0x081a7f0e
	.4byte 0x081a8004
	.4byte 0x081a8119
	.4byte 0x081a811e
	.4byte 0x081a8123
	.4byte 0x081a8128
	.4byte 0x081a812d
	.4byte 0x081a8133
	.4byte 0x081a81bc
	.4byte 0x081a8267

	.align 2
	.global gUnknown_083D1584
gUnknown_083D1584: @ 83D1584
	.4byte 0x081a99d9
	.4byte 0x081a9af0
	.4byte 0x081a9b69
	.4byte 0x081a9bef
	.4byte 0x081a9c6a
	.4byte 0x081a9cf8
	.4byte 0x081a9d74
	.4byte 0x081a9df3
	.4byte 0x081a9e75
	.4byte 0x081a9f06
	.4byte 0x081a9f9f
	.4byte 0x081aa01e
	.4byte 0x081aa09d
	.4byte 0x081aa0d7
	.4byte 0x081aa138
	.4byte 0x081aa166
	.4byte 0x081aa1c0
	.4byte 0x081aa1ea
	.4byte 0x081aa28a

	.align 2
	.global gUnknown_083D15D0
gUnknown_083D15D0: @ 83D15D0
	.4byte 0x081aa814
	.4byte 0x081aa8c6
	.4byte 0x081aa9b2
	.4byte 0x081aaa5c
	.4byte 0x081aab11
	.4byte 0x081aabb4
	.4byte 0x081aac47

	.align 2
	.global gUnknown_083D15EC
gUnknown_083D15EC: @ 83D15EC
	.4byte 0x081aa344
	.4byte 0x081aa5f3

	.align 2
	.global gUnknown_083D15F4
gUnknown_083D15F4: @ 83D15F4
	.4byte 0x081abc51
	.4byte 0x081abd94
	.4byte 0x081abdf2

	.align 2
	.global gUnknown_083D1600
gUnknown_083D1600: @ 83D1600
	.4byte 0x081ac90d
	.4byte 0x081aca02
	.4byte 0x081acaaa
	.4byte 0x081acc07
	.4byte 0x081acd13
	.4byte 0x081acdfa
	.4byte 0x081acee7
	.4byte 0x081acf49
	.4byte 0x081ad00a

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
	obj_tiles 0x082089dc, 1024, 0x0bc1
	obj_tiles 0x082089dc, 1024, 0x0bc2
	obj_tiles 0x082089dc, 1024, 0x0bc3
	obj_tiles 0x082089dc, 1024, 0x0bc4
	obj_tiles 0x082089dc, 1024, 0x0bc5
	obj_tiles 0x082089dc, 1024, 0x0bc6
	obj_tiles 0x082089dc, 1024, 0x0bc7
	obj_tiles 0x082089dc, 1024, 0x0bc8

	.global gUnknown_083D17A4
gUnknown_083D17A4: @ 83D17A4
	.incbin "baserom.gba", 0x003d17a4, 0x10

	.global gUnknown_083D17B4
gUnknown_083D17B4: @ 83D17B4
	.incbin "baserom.gba", 0x003d17b4, 0x18

	.global gUnknown_083D17CC
gUnknown_083D17CC: @ 83D17CC
	obj_tiles 0x08d2d7d4, 544, 0x0bc9

	.global gUnknown_083D17D4
gUnknown_083D17D4: @ 83D17D4
	obj_pal 0x08d2d8f4, 0x0bc9

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
	obj_pal 0x083d190c, 0x0080

	.global gUnknown_083D18A0
gUnknown_083D18A0: @ 83D18A0
	obj_pal 0x083d18ec, 0x0000

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
Unknown_83D613C:
	.incbin "baserom.gba", 0x003d613c, 0x60
Unknown_83D619C:
	.incbin "baserom.gba", 0x003d619c, 0x20
Unknown_83D61BC:
	.incbin "baserom.gba", 0x003d61bc, 0x20

	.align 2
	.global gUnknown_083D61DC
gUnknown_083D61DC: @ 83D61DC
	.4byte Unknown_83D619C
	.4byte Unknown_83D61BC

	.align 2
	.global gUnknown_083D61E4
gUnknown_083D61E4: @ 83D61E4
	.4byte sub_808B020
	.4byte c2_exit_to_overworld_2_switch
	.4byte sub_810B96C

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

	.align 2
	.global gUnknown_083DB56C
gUnknown_083DB56C: @ 83DB56C
	.4byte task_battle_intro_80BC47C
	.4byte task_battle_intro_80BC47C
	.4byte task00_battle_intro_80BC6C8
	.4byte task00_battle_intro_80BC6C8
	.4byte task00_battle_intro_80BC6C8
	.4byte task_battle_intro_80BC47C
	.4byte task_battle_intro_80BC47C
	.4byte task_battle_intro_80BC47C
	.4byte task_battle_intro_anim
	.4byte task_battle_intro_anim

	.align 2
	.global gUnknown_083DB594
gUnknown_083DB594: @ 83DB594
	.4byte sub_80E5168
	.4byte sub_80E517C
	.4byte sub_80E51C4
	.4byte sub_80E5270

	.align 2
	.global gUnknown_083DB5A4
gUnknown_083DB5A4: @ 83DB5A4
	.4byte PlayerGoSpeed0
	.4byte sub_80593C4
	.4byte sub_80593F4

	.align 2
	.global gUnknown_083DB5B0
gUnknown_083DB5B0: @ 83DB5B0
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
	.global gUnknown_083DB5E4
gUnknown_083DB5E4: @ 83DB5E4
	.4byte CheckMovementInputAcroBikeNormal
	.4byte CheckMovementInputAcroBikeChangingDirection
	.4byte CheckMovementInputAcroBikeStandingWheelie
	.4byte CheckMovementInputAcroBikeBunnyHop
	.4byte CheckMovementInputAcroBikeMovingWheelie
	.4byte CheckMovementInputAcroBikeUnknownMode5
	.4byte CheckMovementInputAcroBikeUnknownMode6

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
	.4byte 0x02001000

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

	.align 2
	.global gUnknown_083DB7DC
gUnknown_083DB7DC: @ 83DB7DC
	.4byte 0x0200ac80
	.4byte 0x0200acc9
	.4byte 0x0200ad12
	.4byte 0x0200ad5b

	.global gUnknown_083DB7EC
gUnknown_083DB7EC: @ 83DB7EC
	.incbin "baserom.gba", 0x003db7ec, 0x8

	.global gUnknown_083DB7F4
gUnknown_083DB7F4: @ 83DB7F4
	.incbin "baserom.gba", 0x003db7f4, 0x24C
	.incbin "baserom.gba", 0x003dba40, 0x174

	.global gUnknown_083DBBB4
gUnknown_083DBBB4: @ 83DBBB4
	.incbin "baserom.gba", 0x003dbbb4, 0x28

	.global gUnknown_083DBBDC
gUnknown_083DBBDC: @ 83DBBDC
	.incbin "baserom.gba", 0x003dbbdc, 0x20

	.global gUnknown_083DBBFC
gUnknown_083DBBFC: @ 83DBBFC
Unknown_83DBBFC:
	.incbin "baserom.gba", 0x003dbbfc, 0x40
Unknown_83DBC3C:
	.incbin "baserom.gba", 0x003dbc3c, 0x8
Unknown_83DBC44:
	.incbin "baserom.gba", 0x003dbc44, 0x8
Unknown_83DBC4C:
	.incbin "baserom.gba", 0x003dbc4c, 0x8
Unknown_83DBC54:
	.incbin "baserom.gba", 0x003dbc54, 0x8
Unknown_83DBC5C:
	.incbin "baserom.gba", 0x003dbc5c, 0x8
Unknown_83DBC64:
	.incbin "baserom.gba", 0x003dbc64, 0x8
Unknown_83DBC6C:
	.incbin "baserom.gba", 0x003dbc6c, 0x8
Unknown_83DBC74:
	.incbin "baserom.gba", 0x003dbc74, 0x18

	.align 2
	.global gUnknown_083DBC8C
gUnknown_083DBC8C: @ 83DBC8C
	.4byte Unknown_83DBC3C
	.4byte Unknown_83DBC44
	.4byte Unknown_83DBC4C
	.4byte Unknown_83DBC54

	.align 2
	.global gUnknown_083DBC9C
gUnknown_083DBC9C: @ 83DBC9C
	.4byte Unknown_83DBC5C
	.4byte Unknown_83DBC64
	.4byte Unknown_83DBC6C
	.4byte Unknown_83DBC74

	.global gUnknown_083DBCAC
gUnknown_083DBCAC: @ 83DBCAC
	.incbin "baserom.gba", 0x003dbcac, 0x18

	.global gUnknown_083DBCC4
gUnknown_083DBCC4: @ 83DBCC4
Unknown_83DBCC4:
	.incbin "baserom.gba", 0x003dbcc4, 0x3c
Unknown_83DBD00:
	.incbin "baserom.gba", 0x003dbd00, 0x8
Unknown_83DBD08:
	.incbin "baserom.gba", 0x003dbd08, 0x8

	.global gUnknown_083DBD10
gUnknown_083DBD10: @ 83DBD10
	.4byte Unknown_83DBD00
	.4byte Unknown_83DBD08

	.global gUnknown_083DBD18
gUnknown_083DBD18: @ 83DBD18
	.incbin "baserom.gba", 0x003dbd18, 0x18

	.global gUnknown_083DBD30
gUnknown_083DBD30: @ 83DBD30
	obj_tiles 0x083dba60, 2048, 0x0006

	.global gUnknown_083DBD38
gUnknown_083DBD38: @ 83DBD38
	.incbin "baserom.gba", 0x003dbd38, 0x10

	.global gUnknown_083DBD48
gUnknown_083DBD48: @ 83DBD48
	.incbin "baserom.gba", 0x003dbd48, 0x18

	.global gUnknown_083DBD60
gUnknown_083DBD60: @ 83DBD60
	obj_tiles 0x08e8ea98, 4096, 0x0007

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
	.4byte 0x02039360

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
	.incbin "graphics/misc/ribbons_half.4bpp.lz"

	.global gUnknown_083E05D4
gUnknown_083E05D4: @ 83E05D4
	.incbin "graphics/pokenav/glyph.gbapal"

	.global gUnknown_083E05F4
gUnknown_083E05F4: @ 83E05F4
	.incbin "graphics/pokenav/glyph.4bpp.lz"

	.global gUnknown_083E0804
gUnknown_083E0804: @ 83E0804
	.incbin "baserom.gba", 0x003e0804, 0x7C4

@ 83E0FC8
	.include "data/text/ribbon_descriptions.s"

@ 83E1204
	.include "data/text/gift_ribbon_descriptions.s"

@ 83E178C
	.include "data/text/trainer_eye_descriptions.s"

	.align 2
	.global gUnknown_083E31B0
gUnknown_083E31B0: @ 83E31B0
	.4byte PCText_CheckMap
	.4byte PCText_CheckPoke
	.4byte PCText_CheckTrainer
	.4byte PCText_CheckRibbons
	.4byte PCText_PutAwayNav
	.4byte PCText_NoRibbonWin
	.4byte PCText_NoTrainers

	.align 2
	.global gUnknown_083E31CC
gUnknown_083E31CC: @ 83E31CC
	.4byte PCText_CheckParty
	.4byte PCText_CheckPokeAll
	.4byte PCText_ReturnToNav

	.align 2
	.global gUnknown_083E31D8
gUnknown_083E31D8: @ 83E31D8
	.4byte PCText_FindCool
	.4byte PCText_FindBeauty
	.4byte PCText_FindCute
	.4byte PCText_FindSmart
	.4byte PCText_FindTough
	.4byte PCText_ReturnToCondition

	.global gUnknown_083E31F0
gUnknown_083E31F0: @ 83E31F0
	.incbin "baserom.gba", 0x003e31f0, 0x80

	.global gUnknown_083E3270
gUnknown_083E3270: @ 83E3270
	.4byte 0x080F0A25
	.4byte 0x080F0A25
	.4byte 0x080F0A75
	.incbin "graphics/pokenav/icon.gbapal"

	.global gUnknown_083E329C
gUnknown_083E329C: @ 83E329C
	.incbin "graphics/pokenav/icon.4bpp.lz"
	.incbin "graphics/pokenav/contest_pokeball.4bpp"
	.incbin "baserom.gba", 0x003E3780, 0x20
	.incbin "graphics/pokenav/contest_sparkle.gbapal"
	.incbin "graphics/pokenav/contest_sparkle.4bpp"
	.incbin "graphics/pokenav/contest_arrows.4bpp"
	.incbin "baserom.gba", 0x003E3BC0, 0x20
	.incbin "graphics/unknown/unknown_3E3BE0.4bpp"

	.global gUnknown_083E3C60
gUnknown_083E3C60: @ 83E3C60
@ replacing .incbin "baserom.gba", 0x003e3c60, 0xa0
	.incbin "graphics/misc/ribbons_cool.gbapal"
	.incbin "graphics/misc/ribbons_beauty.gbapal"
	.incbin "graphics/misc/ribbons_cute.gbapal"
	.incbin "graphics/misc/ribbons_smart.gbapal"
	.incbin "graphics/misc/ribbons_tough.gbapal"

	.global gUnknown_083E3D00
gUnknown_083E3D00: @ 83E3D00
	.incbin "graphics/misc/ribbons_full.4bpp.lz"
	.incbin "graphics/unknown/unknown_3E41D8.gbapal"
	.incbin "graphics/unknown/unknown_3E41D8.4bpp"
	.incbin "baserom.gba", 0x003e42D8, 0x20

	.global gUnknown_083E42F8
gUnknown_083E42F8: @ 83E42F8
Unknown_83E42F8:
	.incbin "baserom.gba", 0x003e42f8, 0x148
Unknown_83E4440:
	.incbin "baserom.gba", 0x003e4440, 0x10

	.global gUnknown_083E4450
gUnknown_083E4450: @ 83E4450
	.4byte Unknown_83E4440

	.global gUnknown_083E4454
gUnknown_083E4454: @ 83E4454
	.incbin "baserom.gba", 0x003e4454, 0x18

	.global gUnknown_083E446C
gUnknown_083E446C: @ 83E446C
	obj_tiles 0x083e41d8, 256, 0x0019

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
	obj_tiles 0x083e37c0, 896, 0x0017

	.global gUnknown_083E478C
gUnknown_083E478C: @ 83E478C
	obj_pal 0x083e37a0, 0x000f

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
	.space 8
Unknown_83E5224:
	.incbin "baserom.gba", 0x3E5224, 0x8
Unknown_83E522C:
	.incbin "baserom.gba", 0x3E522C, 0x8
Unknown_83E5234:
	.incbin "baserom.gba", 0x3E5234, 0x8
Unknown_83E523C:
	.incbin "baserom.gba", 0x3E523C, 0x8
Unknown_83E5244:
	.incbin "baserom.gba", 0x3E5244, 0x8
Unknown_83E524C:
	.incbin "baserom.gba", 0x3E524C, 0x8
Unknown_83E5254:
	.incbin "baserom.gba", 0x3E5254, 0x8
Unknown_83E525C:
	.incbin "baserom.gba", 0x3E525C, 0x8
Unknown_83E5264:
	.incbin "baserom.gba", 0x3E5264, 0x8
Unknown_83E526C:
	.incbin "baserom.gba", 0x3E526C, 0x8

	.align 2
	.global gUnknown_083E5274
gUnknown_083E5274: @ 83E5274
Unknown_83E5274:
	.4byte Unknown_83E5224
	.4byte Unknown_83E522C
	.4byte Unknown_83E5234
	.4byte Unknown_83E523C
	.4byte Unknown_83E5244
	.4byte Unknown_83E524C
	.4byte Unknown_83E5254
	.4byte Unknown_83E525C
	.4byte Unknown_83E5264
	.4byte Unknown_83E526C
Unknown_83E529C:
	.incbin "baserom.gba", 0x003e529c, 0x8
Unknown_83E52A4:
	.incbin "baserom.gba", 0x003e52a4, 0x8

	.global gUnknown_083E52AC
gUnknown_083E52AC: @ 83E52AC
	.4byte Unknown_83E529C
	.4byte Unknown_83E52A4

	.global gUnknown_083E52B4
gUnknown_083E52B4: @ 83E52B4
	.incbin "baserom.gba", 0x3E52B4, 0x8
Unknown_83E52BC:
	.incbin "baserom.gba", 0x3E52BC, 0x8
Unknown_83E52C4:
	.incbin "baserom.gba", 0x3E52C4, 0x8
Unknown_83E52CC:
	.incbin "baserom.gba", 0x3E52CC, 0x8
Unknown_83E52D4:
	.incbin "baserom.gba", 0x3E52D4, 0x8
Unknown_83E52DC:
	.incbin "baserom.gba", 0x3E52DC, 0x8
Unknown_83E52E4:
	.incbin "baserom.gba", 0x3E52E4, 0x8
Unknown_83E52EC:
	.incbin "baserom.gba", 0x3E52EC, 0x8
Unknown_83E52F4:
	.incbin "baserom.gba", 0x3E52F4, 0x8
Unknown_83E52FC:
	.incbin "baserom.gba", 0x3E52FC, 0x8
Unknown_83E5304:
	.incbin "baserom.gba", 0x3E5304, 0x8
Unknown_83E530C:
	.incbin "baserom.gba", 0x3E530C, 0x8
Unknown_83E5314:
	.incbin "baserom.gba", 0x3E5314, 0x8
Unknown_83E531C:
	.incbin "baserom.gba", 0x3E531C, 0x8
Unknown_83E5324:
	.incbin "baserom.gba", 0x3E5324, 0x8
Unknown_83E532C:
	.incbin "baserom.gba", 0x3E532C, 0x8
Unknown_83E5334:
	.incbin "baserom.gba", 0x3E5334, 0x8

	.align 2
	.global gUnknown_083E533C
gUnknown_083E533C: @ 83E533C
	.4byte Unknown_83E52BC
	.4byte Unknown_83E52C4
	.4byte Unknown_83E52CC
	.4byte Unknown_83E52D4
	.4byte Unknown_83E52DC
	.4byte Unknown_83E52E4
	.4byte Unknown_83E52EC
	.4byte Unknown_83E52F4
	.4byte Unknown_83E52FC
	.4byte Unknown_83E5304
	.4byte Unknown_83E530C
	.4byte Unknown_83E5314
	.4byte Unknown_83E531C
	.4byte Unknown_83E5324
	.4byte Unknown_83E532C
	.4byte Unknown_83E5334

	.global gUnknown_083E537C
gUnknown_083E537C: @ 83E537C
	.incbin "baserom.gba", 0x003e537c, 0xc

	.align 2
	.global gUnknown_083E5388
gUnknown_083E5388: @ 83E5388
	.4byte OtherText_SoPretty
	.4byte OtherText_SoDarling
	.4byte OtherText_SoRelaxed
	.4byte OtherText_SoSunny
	.4byte OtherText_SoDesirable
	.4byte OtherText_SoExciting
	.4byte OtherText_SoAmusing
	.4byte OtherText_SoMagical

	.align 2
	.global gUnknown_083E53A8
gUnknown_083E53A8: @ 83E53A8
	.4byte OtherText_WantVacationNicePlace
	.4byte OtherText_BoughtCrayonsIsNice
	.4byte OtherText_IfWeCouldFloat
	.4byte OtherText_SandWashesAwayMakeSad
	.4byte OtherText_WhatsBottomSeaLike
	.4byte OtherText_SeeSettingSun
	.4byte OtherText_LyingInGreenGrass
	.4byte OtherText_SecretBasesWonderful

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
	.incbin "graphics/interface/map.gbapal", 0xE0, 0x40

	.global gUnknown_083E5DA0
gUnknown_083E5DA0: @ 83E5DA0
@ replacing .incbin "baserom.gba", 0x003e5da0, 0xd64
	.incbin "graphics/interface/map.8bpp.lz"

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
	obj_pal 0x083e5ad0, 0x0000

	.global gUnknown_083E76F0
gUnknown_083E76F0: @ 83E76F0
	.incbin "baserom.gba", 0x003e76f0, 0x18

	.global gUnknown_083E7708
gUnknown_083E7708: @ 83E7708
Unknown_83E7708:
	.incbin "baserom.gba", 0x003e7708, 0x8
Unknown_83E7710:
	.incbin "baserom.gba", 0x003e7710, 0x8

	.global gUnknown_083E7718
gUnknown_083E7718: @ 83E7718
	.4byte Unknown_83E7710

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
	obj_pal 0x083e782c, 0x0002

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
	.space 1

	.global gUnknown_083EB6C5
gUnknown_083EB6C5: @ 83EB6C5
	.incbin "baserom.gba", 0x003eb6c5, 0x1b

	.global gUnknown_083EB6E0
gUnknown_083EB6E0: @ 83EB6E0
	.incbin "baserom.gba", 0x003eb6e0, 0xf04

	.align 2
	.global gUnknown_083EC5E4
gUnknown_083EC5E4: @ 83EC5E4
	.4byte SecretBaseText_Desk
	.4byte SecretBaseText_Chair
	.4byte SecretBaseText_Plant
	.4byte SecretBaseText_Ornament
	.4byte SecretBaseText_Mat
	.4byte SecretBaseText_Poster
	.4byte SecretBaseText_Doll
	.4byte SecretBaseText_Cushion

	.align 2
	.global gUnknown_083EC604
gUnknown_083EC604: @ 83EC604
	.4byte SecretBaseText_Decorate
	.4byte sub_80FF160
	.4byte SecretBaseText_PutAway
	.4byte sub_8100A0C
	.4byte SecretBaseText_Toss
	.4byte sub_8101700
	.4byte UnknownText_Exit
	.4byte gpu_pal_decompress_alloc_tag_and_upload

	.align 2
	.global gUnknown_083EC624
gUnknown_083EC624: @ 83EC624
	.4byte SecretBaseText_PutOutDecor
	.4byte SecretBaseText_StoreChosenDecor
	.4byte SecretBaseText_ThrowAwayDecor
	.4byte MenuText_GoBackToPrev

	.align 2
	.global gUnknown_083EC634
gUnknown_083EC634: @ 83EC634
	.4byte sub_80FF5BC
	.4byte sub_80FF058
	.4byte sub_81017A0
	.4byte sub_80FF058
	.4byte sub_81017A0
	.4byte sub_80FF058
	.4byte sub_8109D04
	.4byte sub_80FF058

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
	obj_pal 0x02039184, 0x0bb8

	.align 2
	.global gUnknown_083EC95C
gUnknown_083EC95C: @ 83EC95C
	.4byte sub_81000C4
	.4byte sub_810065C

	.align 2
	.global gUnknown_083EC964
gUnknown_083EC964: @ 83EC964
	.4byte sub_810026C
	.4byte sub_810065C

	.align 2
	.global gUnknown_083EC96C
gUnknown_083EC96C: @ 83EC96C
	.4byte sub_80FFAB0
	.4byte sub_80FFB08
	.4byte sub_8100F88
	.4byte sub_8100FB4

	.global gUnknown_083EC97C
gUnknown_083EC97C: @ 83EC97C
	.incbin "baserom.gba", 0x003ec97c, 0x8

	.global gUnknown_083EC984
gUnknown_083EC984: @ 83EC984
	.incbin "baserom.gba", 0x003ec984, 0x48

	.align 2
	.global gUnknown_083EC9CC
gUnknown_083EC9CC: @ 83EC9CC
	.4byte sub_810153C
	.4byte sub_8100EEC

	.global gUnknown_083EC9D4
gUnknown_083EC9D4: @ 83EC9D4
	.incbin "baserom.gba", 0x003ec9d4, 0x88

	.global gUnknown_083ECA5C
gUnknown_083ECA5C: @ 83ECA5C
	obj_pal 0x083ec98c, 0x0008

	.global gUnknown_083ECA64
gUnknown_083ECA64: @ 83ECA64
	.incbin "baserom.gba", 0x003eca64, 0x24

	.global gUnknown_083ECA88
gUnknown_083ECA88: @ 83ECA88
	.incbin "baserom.gba", 0x003eca88, 0x18

	.global gUnknown_083ECAA0
gUnknown_083ECAA0: @ 83ECAA0
	.incbin "baserom.gba", 0x003ecaa0, 0xc

	.align 2
	.global gUnknown_083ECAAC
gUnknown_083ECAAC: @ 83ECAAC
	.4byte sub_8101D5C
	.4byte sub_8101D8C
	.4byte sub_8101DB0
	.4byte sub_8101DF4
	.4byte sub_8101E10
	.4byte sub_8101E3C
	.4byte sub_8101F44
	.4byte sub_8101F60
	.4byte sub_8101F88
	.4byte sub_8101FA4
	.4byte sub_8102008
	.4byte sub_8102034
	.4byte sub_8102058
	.4byte sub_8102090
	.4byte sub_81020C8
	.4byte sub_81021E0
	.4byte sub_81021FC
	.4byte sub_8102264
	.4byte sub_81022A0
	.4byte sub_81022CC
	.4byte sub_81022F0
	.4byte sub_8102318
	.4byte sub_8102344
	.4byte sub_810239C
	.4byte sub_81023B8
	.4byte sub_81023E0
	.4byte sub_81023FC
	.4byte sub_8102424
	.4byte sub_8102460

	.align 2
	.global gUnknown_083ECB20
gUnknown_083ECB20: @ 83ECB20
	.4byte sub_8102A9C
	.4byte sub_8102AD0
	.4byte sub_8102B80

	.align 2
	.global gUnknown_083ECB2C
gUnknown_083ECB2C: @ 83ECB2C
	.4byte sub_8102EA0
	.4byte sub_8102EA4
	.4byte sub_8102EC0
	.4byte sub_8102F4C
	.4byte sub_8103008

	.align 2
	.global gUnknown_083ECB40
gUnknown_083ECB40: @ 83ECB40
	.4byte sub_810305C
	.4byte sub_81032C0
	.4byte sub_81033DC

	.align 2
	.global gUnknown_083ECB4C
gUnknown_083ECB4C: @ 83ECB4C
	.4byte sub_81034F4
	.4byte sub_8103540
	.4byte sub_810380C

	.global gUnknown_083ECB58
gUnknown_083ECB58: @ 83ECB58
	.incbin "baserom.gba", 0x003ecb58, 0xc

	.align 2
	.global gUnknown_083ECB64
gUnknown_083ECB64: @ 83ECB64
	.4byte sub_8103154
	.4byte sub_81031B4
	.4byte sub_81031B4

	.align 2
	.global gUnknown_083ECB70
gUnknown_083ECB70: @ 83ECB70
	.4byte sub_81032E8
	.4byte sub_81032E8
	.4byte sub_810333C

	.align 2
	.global gUnknown_083ECB7C
gUnknown_083ECB7C: @ 83ECB7C
	.4byte sub_810341C
	.4byte sub_810341C
	.4byte sub_810347C

	.align 2
	.global gUnknown_083ECB88
gUnknown_083ECB88: @ 83ECB88
	.4byte sub_8103564
	.4byte j5_08111E84
	.4byte sub_8103668

	.align 2
	.global gUnknown_083ECB94
gUnknown_083ECB94: @ 83ECB94
	.4byte sub_8103830
	.4byte sub_8103910
	.4byte sub_8103A78

	.align 2
	.global gUnknown_083ECBA0
gUnknown_083ECBA0: @ 83ECBA0
	.4byte sub_8103C78
	.4byte sub_8103CAC
	.4byte sub_8103CC8

	.global gUnknown_083ECBAC
gUnknown_083ECBAC: @ 83ECBAC
	.incbin "baserom.gba", 0x003ecbac, 0x8

	.align 2
	.global gUnknown_083ECBB4
gUnknown_083ECBB4: @ 83ECBB4
	.4byte nullsub_68
	.4byte sub_810411C
	.4byte sub_8104144
	.4byte sub_81041AC

	.global gUnknown_083ECBC4
gUnknown_083ECBC4: @ 83ECBC4
	.incbin "baserom.gba", 0x003ecbc4, 0x2

	.global gUnknown_083ECBC6
gUnknown_083ECBC6: @ 83ECBC6
	.incbin "baserom.gba", 0x003ecbc6, 0xa

	.align 2
	.global gUnknown_083ECBD0
gUnknown_083ECBD0: @ 83ECBD0
	.4byte sub_810437C
	.4byte sub_81043EC
	.4byte sub_8104468
	.4byte sub_8104498
	.4byte sub_8104548
	.4byte sub_8104598
	.4byte sub_81045CC
	.4byte sub_810463C
	.4byte sub_81046C0
	.4byte sub_8104764
	.4byte sub_8104794
	.4byte sub_81047EC
	.4byte sub_8104860
	.4byte sub_81048A8
	.4byte sub_81048CC
	.4byte sub_8104940
	.4byte sub_81049C8
	.4byte sub_8104794
	.4byte sub_81049F8

	.align 2
	.global gUnknown_083ECC1C
gUnknown_083ECC1C: @ 83ECC1C
	.4byte 0x02020101

	.global gUnknown_083ECC20
gUnknown_083ECC20: @ 83ECC20
	.incbin "baserom.gba", 0x003ecc20, 0x8

	.global gUnknown_083ECC28
gUnknown_083ECC28: @ 83ECC28
	.incbin "baserom.gba", 0x003ecc28, 0x8

	.align 2
	.global gUnknown_083ECC30
gUnknown_083ECC30: @ 83ECC30
	.4byte sub_8104B3C
	.4byte sub_8104B60
	.4byte sub_8104B80
	.4byte sub_8104B60
	.4byte sub_8104BC8
	.4byte sub_8104B60
	.4byte sub_8104BFC
	.4byte sub_8104B60
	.4byte sub_8104C44

	.global gUnknown_083ECC54
gUnknown_083ECC54: @ 83ECC54
	.4byte nullsub_69

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
	obj_pal 0x02030406, 0x0005

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
	.incbin "baserom.gba", 0x3ECF0C, 0x8C
Unknown_83ECF98:
	.incbin "baserom.gba", 0x3ECF98, 0x10
Unknown_83ECFA8:
	.incbin "baserom.gba", 0x3ECFA8, 0x1C
Unknown_83ECFC4:
	.incbin "baserom.gba", 0x3ECFC4, 0xC
Unknown_83ECFD0:
	.incbin "baserom.gba", 0x3ECFD0, 0x18
Unknown_83ECFE8:
	.incbin "baserom.gba", 0x3ECFE8, 0x10
Unknown_83ECFF8:
	.incbin "baserom.gba", 0x3ECFF8, 0x28
Unknown_83ED020:
	.incbin "baserom.gba", 0x3ED020, 0x28

	.align 2
	.global gUnknown_083ED048
gUnknown_083ED048: @ 83ED048
	.4byte Unknown_83ECF98
	.4byte Unknown_83ECFA8
	.4byte Unknown_83ECFC4
	.4byte Unknown_83ECFD0
	.4byte Unknown_83ECFE8
	.4byte Unknown_83ED020
	.4byte Unknown_83ECFF8

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
	.incbin "baserom.gba", 0x3ED564, 0x18
Unknown_83ED57C:
	.incbin "baserom.gba", 0x3ED57C, 0x18
Unknown_83ED594:
	.incbin "baserom.gba", 0x3ED594, 0x18
Unknown_83ED5AC:
	.incbin "baserom.gba", 0x3ED5AC, 0x18
Unknown_83ED5C4:
	.incbin "baserom.gba", 0x3ED5C4, 0x18
Unknown_83ED5DC:
	.incbin "baserom.gba", 0x3ED5DC, 0x18
Unknown_83ED5F4:
	.incbin "baserom.gba", 0x3ED5F4, 0x18
Unknown_83ED60C:
	.incbin "baserom.gba", 0x3ED60C, 0x18
Unknown_83ED624:
	.incbin "baserom.gba", 0x3ED624, 0x18
Unknown_83ED63C:
	.incbin "baserom.gba", 0x3ED63C, 0x18
Unknown_83ED654:
	.incbin "baserom.gba", 0x3ED654, 0x18
Unknown_83ED66C:
	.incbin "baserom.gba", 0x3ED66C, 0x18
Unknown_83ED684:
	.incbin "baserom.gba", 0x3ED684, 0x18
Unknown_83ED69C:
	.incbin "baserom.gba", 0x3ED69C, 0x18
Unknown_83ED6B4:
	.incbin "baserom.gba", 0x3ED6B4, 0x18

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

	.align 2
	.global gUnknown_083EDB5C
gUnknown_083EDB5C: @ 83EDB5C
	.4byte Unknown_83ED57C
	.4byte Unknown_83ED594
	.4byte Unknown_83ED5AC
	.4byte Unknown_83ED5DC
	.4byte Unknown_83ED5F4
	.4byte Unknown_83ED654
	.4byte Unknown_83ED66C
	.4byte Unknown_83ED684
	.4byte Unknown_83ED69C
	.4byte Unknown_83ED6B4
	.4byte Unknown_83ED5C4
	.4byte Unknown_83ED5C4
	.4byte Unknown_83ED5C4
	.4byte Unknown_83ED5C4
	.4byte Unknown_83ED60C
	.4byte Unknown_83ED60C
	.4byte Unknown_83ED60C
	.4byte Unknown_83ED60C
	.4byte Unknown_83ED60C
	.4byte Unknown_83ED624
	.4byte Unknown_83ED624
	.4byte Unknown_83ED624
	.4byte Unknown_83ED63C
	.4byte Unknown_83ED63C
	.4byte Unknown_83ED63C
	.4byte gDummySpriteTemplate

	.global gUnknown_083EDBC4
gUnknown_083EDBC4: @ 83EDBC4
	.incbin "baserom.gba", 0x003edbc4, 0x68

	.global gUnknown_083EDC2C
gUnknown_083EDC2C: @ 83EDC2C
	.incbin "baserom.gba", 0x003edc2c, 0xb0

	.global gUnknown_083EDCDC
gUnknown_083EDCDC: @ 83EDCDC
	obj_tiles 0x02010000, 2048, 0x0011

	.global gUnknown_083EDCE4
gUnknown_083EDCE4: @ 83EDCE4
	.4byte 0x08E997E8

UnknownPalette_83EDCE8:
	.ifdef SAPPHIRE
	.incbin "graphics/unknown/sapphire_83EDD40.gbapal"
	.else
	.incbin "graphics/unknown/ruby_83EDCE8.gbapal"
	.endif

	.align 2
	.global gUnknown_083EDD08
gUnknown_083EDD08: @ 83EDD08
	.4byte UnknownPalette_83EDCE8 + 10 * 2
	.4byte UnknownPalette_83EDCE8 + 11 * 2
	.4byte UnknownPalette_83EDCE8 + 12 * 2
	.4byte UnknownPalette_83EDCE8 + 13 * 2
	.4byte UnknownPalette_83EDCE8 + 14 * 2

	.align 2
	.global gUnknown_083EDD1C
gUnknown_083EDD1C: @ 83EDD1C
	.4byte 0x08e95aac
	.4byte 0x08e95aae
	.4byte 0x08e95ab0
	.4byte 0x08e95ab2
	.4byte 0x08e95ab4

	.global gUnknown_083EDD30
gUnknown_083EDD30: @ 83EDD30
	.incbin "baserom.gba", 0x003edd30, 0x5

	.global gUnknown_083EDD35
gUnknown_083EDD35: @ 83EDD35
	.incbin "baserom.gba", 0x003edd35, 0x6

	.global gUnknown_083EDD3B
gUnknown_083EDD3B: @ 83EDD3B
Unknown_83EDD3B:
	.incbin "baserom.gba", 0x003edd3b, 0x3
Unknown_83EDD3E:
	.incbin "baserom.gba", 0x003edd3e, 0x20
Unknown_83EDD5E:
	.incbin "baserom.gba", 0x003edd5e, 0x20
Unknown_83EDD7E:
	.incbin "baserom.gba", 0x003edd7e, 0x22

	.align 2
	.global gUnknown_083EDDA0
gUnknown_083EDDA0: @ 83EDDA0
	.4byte Unknown_83EDD3E
	.4byte Unknown_83EDD5E
	.4byte Unknown_83EDD7E

	.align 2
	.global gUnknown_083EDDAC
gUnknown_083EDDAC: @ 83EDDAC
Unknown_83EDDAC:
	.4byte 0x08e95a38
Unknown_83EDDB0:
	.incbin "baserom.gba", 0x003eddb0, 0x20
Unknown_83EDDD0:
	.incbin "baserom.gba", 0x003eddd0, 0x20
Unknown_83EDDF0:
	.incbin "baserom.gba", 0x003eddf0, 0x20

	.align 2
	.global gUnknown_083EDE10
gUnknown_083EDE10: @ 83EDE10
	.4byte Unknown_83EDDB0
	.4byte Unknown_83EDDD0
	.4byte Unknown_83EDDF0
	.4byte 0x08e97788

	.align 2
	.global gUnknown_083EDE20
gUnknown_083EDE20: @ 83EDE20
	.4byte 0x08e97788

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

	.align 2
	.global gUnknown_083F60AC
gUnknown_083F60AC: @ 83F60AC
	.4byte OtherText_Cool
	.4byte OtherText_Beauty2
	.4byte OtherText_Cute
	.4byte OtherText_Smart
	.4byte OtherText_Tough

	.align 2
	.global gUnknown_083F60C0
gUnknown_083F60C0: @ 83F60C0
	.4byte OtherText_NonstopSuperCool
	.4byte OtherText_Terminator6
	.4byte OtherText_GoodLookingPoke
	.4byte OtherText_Terminator7
	.4byte OtherText_MarvelousGreat
	.4byte OtherText_Terminator8
	.4byte OtherText_CenturyLastVenus
	.4byte OtherText_Terminator9
	.4byte OtherText_Terminator10
	.4byte OtherText_DazzlingSlime
	.4byte OtherText_PokeCenterIdol
	.4byte OtherText_Terminator11
	.4byte OtherText_LovelyAndSweet
	.4byte OtherText_Terminator12
	.4byte OtherText_ThePretty
	.4byte OtherText_WinningPortrait
	.4byte OtherText_GiveUsWink
	.4byte OtherText_Terminator13
	.4byte OtherText_SmartnessMaestro
	.4byte OtherText_Terminator15
	.4byte OtherText_ChosenPokeAmong
	.4byte OtherText_Terminator15
	.4byte OtherText_TheExcellent
	.4byte OtherText_ItsMomentOfElegance
	.4byte OtherText_PowerfullyMuscular
	.4byte OtherText_Terminator16
	.4byte OtherText_StrongErEst
	.4byte OtherText_Terminator17
	.4byte OtherText_MightyTough
	.4byte OtherText_Exclamation

	.global gUnknown_083F6138
gUnknown_083F6138: @ 83F6138
	.incbin "baserom.gba", 0x003f6138, 0x8

	.global gUnknown_083F6140
gUnknown_083F6140: @ 83F6140
	.space 4

	.align 2
	.global gUnknown_083F6144
gUnknown_083F6144: @ 83F6144
	.4byte sub_810752C
	.4byte sub_810756C
	.4byte sub_81075AC
	.4byte sub_81075EC
	.4byte sub_810762C
	.4byte sub_8107668
	.4byte sub_81076D0
	.4byte sub_8107738
	.4byte sub_81077A0
	.4byte sub_8107808
	.4byte sub_810787C
	.4byte sub_81078F0
	.4byte sub_8107964
	.4byte sub_81079D8
	.4byte sub_8107A48
	.4byte sub_8107AB8
	.4byte sub_8107B34
	.4byte sub_8107BB0
	.4byte sub_8107BE8
	.4byte sub_8107C20
	.4byte sub_8107C58
	.4byte sub_8107C90
	.4byte sub_8107CE0
	.4byte sub_8107D30
	.4byte sub_8107D80
	.4byte sub_8107DD0
	.4byte sub_8107E10
	.4byte sub_8107E50
	.4byte sub_8107EB4
	.4byte sub_8107F1C
	.4byte sub_8107F84
	.4byte sub_8107FF0
	.4byte sub_8108060
	.4byte sub_81080D0
	.4byte sub_81080F0
	.4byte sub_81081CC
	.4byte sub_81081F4
	.4byte sub_81083D4
	.4byte sub_8108424
	.4byte sub_810845C
	.4byte tai28_unk
	.4byte tai29_unk
	.4byte nullsub_25
	.4byte nullsub_26
	.4byte tai2C_unk
	.4byte sub_8108630
	.4byte sub_8108648
	.4byte sub_8108670
	.4byte tai30_unk
	.4byte dp15_simulate_damage_bonus_jump_if_eq
	.4byte nullsub_71
	.4byte nullsub_90
	.4byte sub_8108964
	.4byte sub_8108A28
	.4byte sub_8108AEC
	.4byte sub_8108B48
	.4byte sub_8108B90
	.4byte sub_8108BD8
	.4byte sub_8108C40
	.4byte sub_8108CA8
	.4byte sub_8108D10
	.4byte tai3D_unk
	.4byte dp15_determine_move_damage_jump_if_not_fatal
	.4byte tai40_unk
	.4byte sub_8109010
	.4byte sub_81090E4
	.4byte sub_81091D4
	.4byte tai43_unk
	.4byte sub_8109330
	.4byte sub_81093B8
	.4byte sub_81093C8
	.4byte sub_810942C
	.4byte dp15_get_held_item_x12__8
	.4byte tai49_unk
	.4byte sub_810950C
	.4byte sub_8109554
	.4byte sub_810959C
	.4byte sub_81095C0
	.4byte sub_8109604
	.4byte sub_810962C
	.4byte sub_8109654
	.4byte sub_810967C
	.4byte nullsub_27
	.4byte nullsub_28
	.4byte nullsub_29
	.4byte nullsub_30
	.4byte nullsub_31
	.4byte nullsub_32
	.4byte sub_81096DC
	.4byte sub_810970C
	.4byte sub_810972C
	.4byte dp15_compare_attacker_defender_levels
	.4byte sub_8109824
	.4byte sub_8109874

	.global gUnknown_083F62BC
gUnknown_083F62BC: @ 83F62BC
	.incbin "baserom.gba", 0x003f62bc, 0x1c

	.align 2
	.global gUnknown_083F62D8
gUnknown_083F62D8: @ 83F62D8
	.4byte SecretBaseText_Tristan
	.4byte SecretBaseText_Philip
	.4byte SecretBaseText_Dennis
	.4byte SecretBaseText_Roberto

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
Unknown_83F76E4:
	.incbin "baserom.gba", 0x003f76e4, 0x78
Unknown_83F775C:
	.incbin "baserom.gba", 0x003f775c, 0x18
Unknown_83F7774:
	.incbin "baserom.gba", 0x003f7774, 0x18

	.global gUnknown_083F778C
gUnknown_083F778C: @ 83F778C
	.4byte Unknown_83F775C
	.4byte Unknown_83F7774

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

	.align 2
	.global gUnknown_083F7EA8
gUnknown_083F7EA8: @ 83F7EA8
	.4byte sub_80A5B40
	.4byte c2_exit_to_overworld_2_switch
	.4byte sub_802E424
	.4byte c2_exit_to_overworld_2_switch

	.global gUnknown_083F7EB8
gUnknown_083F7EB8: @ 83F7EB8
	.incbin "baserom.gba", 0x003f7eb8, 0x3c

	.align 2
	.global gUnknown_083F7EF4
gUnknown_083F7EF4: @ 83F7EF4
	.4byte OtherText_Use
	.4byte sub_810C508
	.4byte OtherText_Toss
	.4byte sub_810C5C0
	.4byte OtherText_Cancel2
	.4byte sub_810C748
	.4byte OtherText_Use
	.4byte sub_810C788
	.4byte OtherText_Use
	.4byte sub_810C854

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
Unknown_83F7F24:
	.incbin "baserom.gba", 0x003f7f24, 0x24
Unknown_83F7F48:
	.incbin "baserom.gba", 0x003f7f48, 0x28

	.global gUnknown_083F7F70
gUnknown_083F7F70: @ 83F7F70
	.4byte Unknown_83F7F48

	.global gUnknown_083F7F74
gUnknown_083F7F74: @ 83F7F74
	obj_tiles 0x08e77d90, 2048, 0x39d0

	.global gUnknown_083F7F7C
gUnknown_083F7F7C: @ 83F7F7C
	obj_pal 0x08e78050, 0x39d0

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
	.space 32

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

	.align 2
	.global gUnknown_083F8380
gUnknown_083F8380: @ 83F8380
	.4byte OtherText_1F
	.4byte OtherText_2F
	.4byte OtherText_3F
	.4byte OtherText_4F
	.4byte OtherText_5F
	.4byte OtherText_6F
	.4byte OtherText_7F
	.4byte OtherText_8F
	.4byte OtherText_9F
	.4byte OtherText_10F
	.4byte OtherText_11F
	.4byte OtherText_B1F
	.4byte OtherText_B2F
	.4byte OtherText_B3F
	.4byte OtherText_B4F
	.4byte OtherText_Rooftop

	.align 2
	.global gUnknown_083F83C0
gUnknown_083F83C0: @ 83F83C0
	.4byte OtherText_BlueFlute
	.4byte OtherText_YellowFlute
	.4byte OtherText_RedFlute
	.4byte OtherText_WhiteFlute
	.4byte OtherText_BlackFlute
	.4byte OtherText_PrettyChair
	.4byte OtherText_PrettyDesk
	.4byte OtherText_Cancel2

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
	obj_tiles 0x083f85dc, 128, 0x0002

	.global gUnknown_083F8594
gUnknown_083F8594: @ 83F8594
	.incbin "baserom.gba", 0x003f8594, 0x10

	.global gUnknown_083F85A4
gUnknown_083F85A4: @ 83F85A4
	.incbin "baserom.gba", 0x003f85a4, 0xb8

	.global gUnknown_083F865C
gUnknown_083F865C: @ 83F865C
	obj_pal 0x08e87d90, 0x0003

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

	.align 2
	.global gUnknown_083F8EB4
gUnknown_083F8EB4: @ 83F8EB4
	.4byte sub_811755C
	.4byte sub_81175C0

	.align 2
	.global gUnknown_083F8EBC
gUnknown_083F8EBC: @ 83F8EBC
	.4byte sub_811577C
	.4byte sub_81157AC

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
	obj_tiles 0x08e824bc, 5632, 0x0004

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
	obj_tiles 0x08e82140, 2048, 0x0006

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

	.align 2
	.global gUnknown_083FD708
gUnknown_083FD708: @ 83FD708
	.4byte 0x0200c000

	.align 2
	.global gUnknown_083FD70C
gUnknown_083FD70C: @ 83FD70C
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64
	.4byte sub_811AC64

	.align 2
	.global gUnknown_083FD750
gUnknown_083FD750: @ 83FD750
	.4byte sub_811ACB4
	.4byte sub_811ADAC
	.4byte sub_811AF44
	.4byte sub_811B0F0
	.4byte sub_811B578
	.4byte sub_811B7E8
	.4byte sub_811BCBC
	.4byte sub_811BEA0
	.4byte sub_811CA5C
	.4byte sub_811CCDC
	.4byte sub_811D0B8
	.4byte sub_811D1C8
	.4byte sub_811C08C
	.4byte sub_811C0AC
	.4byte sub_811C0CC
	.4byte sub_811C0EC
	.4byte sub_811C10C

	.align 2
	.global gUnknown_083FD794
gUnknown_083FD794: @ 83FD794
	.4byte sub_811AB88
	.4byte sub_811ABD8
	.4byte sub_811AC0C
	.4byte sub_811AC34

	.align 2
	.global gUnknown_083FD7A4
gUnknown_083FD7A4: @ 83FD7A4
	.4byte sub_811ACEC
	.4byte sub_811AD1C
	.4byte sub_811AD80

	.align 2
	.global gUnknown_083FD7B0
gUnknown_083FD7B0: @ 83FD7B0
	.4byte sub_811ADE4
	.4byte sub_811AE70

	.align 2
	.global gUnknown_083FD7B8
gUnknown_083FD7B8: @ 83FD7B8
	.4byte sub_811AF7C
	.4byte sub_811B000

	.align 2
	.global gUnknown_083FD7C0
gUnknown_083FD7C0: @ 83FD7C0
	.4byte sub_811B128
	.4byte sub_811B1D8
	.4byte sub_811B268
	.4byte sub_811B2F4
	.4byte sub_811B380
	.4byte sub_811B3EC

	.align 2
	.global gUnknown_083FD7D8
gUnknown_083FD7D8: @ 83FD7D8
	.4byte sub_811B5B0
	.4byte sub_811B5FC
	.4byte sub_811B688

	.global gUnknown_083FD7E4
gUnknown_083FD7E4: @ 83FD7E4
	.incbin "baserom.gba", 0x003fd7e4, 0x4

	.global gUnknown_083FD7E8
gUnknown_083FD7E8: @ 83FD7E8
	.incbin "baserom.gba", 0x003fd7e8, 0xa

	.global gUnknown_083FD7F2
gUnknown_083FD7F2: @ 83FD7F2
	.incbin "baserom.gba", 0x003fd7f2, 0x6

	.align 2
	.global gUnknown_083FD7F8
gUnknown_083FD7F8: @ 83FD7F8
	.4byte sub_811B820
	.4byte sub_811B884
	.4byte sub_811B90C
	.4byte sub_811B9F0
	.4byte sub_811BA70
	.4byte sub_811BB60
	.4byte sub_811BBEC

	.align 2
	.global gUnknown_083FD814
gUnknown_083FD814: @ 83FD814
	.4byte sub_811BCF4
	.4byte sub_811BD60

	.align 2
	.global gUnknown_083FD81C
gUnknown_083FD81C: @ 83FD81C
	.4byte sub_811BED8
	.4byte sub_811BF2C
	.4byte sub_811BFC4

	.align 2
	.global gUnknown_083FD828
gUnknown_083FD828: @ 83FD828
	.4byte sub_811C164
	.4byte sub_811C1CC
	.4byte sub_811C2A4
	.4byte sub_811C38C
	.4byte sub_811C400
	.4byte sub_811C43C
	.4byte sub_811C4F0
	.4byte sub_811C5B4
	.4byte sub_811C5E8
	.4byte sub_811C630

	.global gUnknown_083FD850
gUnknown_083FD850: @ 83FD850
	.incbin "baserom.gba", 0x003fd850, 0x6

	.global gUnknown_083FD856
gUnknown_083FD856: @ 83FD856
	.incbin "baserom.gba", 0x003fd856, 0x14

	.global gUnknown_083FD86A
gUnknown_083FD86A: @ 83FD86A
	.incbin "baserom.gba", 0x003fd86a, 0x16

	.align 2
	.global gUnknown_083FD880
gUnknown_083FD880: @ 83FD880
	.4byte sub_811C934
	.4byte sub_811C938
	.4byte sub_811C984
	.4byte sub_811C9B8
	.4byte sub_811C934
	.4byte sub_811C9E4
	.4byte sub_811C934

	.global gUnknown_083FD89C
gUnknown_083FD89C: @ 83FD89C
	.incbin "baserom.gba", 0x003fd89c, 0x4

	.global gUnknown_083FD8A0
gUnknown_083FD8A0: @ 83FD8A0
	.incbin "baserom.gba", 0x003fd8a0, 0x4

	.align 2
	.global gUnknown_083FD8A4
gUnknown_083FD8A4: @ 83FD8A4
	.4byte sub_811CA94
	.4byte sub_811CB20
	.4byte sub_811CBE8

	.align 2
	.global gUnknown_083FD8B0
gUnknown_083FD8B0: @ 83FD8B0
	.4byte sub_811CD14
	.4byte sub_811CDA0
	.4byte sub_811CE14
	.4byte sub_811CE4C
	.4byte sub_811CEB0

	.global gUnknown_083FD8C4
gUnknown_083FD8C4: @ 83FD8C4
	.incbin "baserom.gba", 0x003fd8c4, 0x10

	.align 2
	.global gUnknown_083FD8D4
gUnknown_083FD8D4: @ 83FD8D4
	.4byte sub_811D0F0
	.4byte sub_811D144
	.4byte sub_811D19C

	.align 2
	.global gUnknown_083FD8E0
gUnknown_083FD8E0: @ 83FD8E0
	.4byte sub_811D200
	.4byte sub_811D260
	.4byte sub_811D2D8
	.4byte sub_811D3B0
	.4byte sub_811D41C

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

Unknown_83FDA20:
	.incbin "baserom.gba", 0x3FDA20, 0x20
Unknown_83FDA40:
	.incbin "baserom.gba", 0x3FDA40, 0x20
Unknown_83FDA60:
	.incbin "baserom.gba", 0x3FDA60, 0x20
Unknown_83FDA80:
	.incbin "baserom.gba", 0x3FDA80, 0x20
Unknown_83FDAA0:
	.incbin "baserom.gba", 0x3FDAA0, 0x60

	.align 2
	.global gUnknown_083FDB00
gUnknown_083FDB00: @ 83FDB00
	.4byte Unknown_83FDA20
	.4byte Unknown_83FDA40
	.4byte Unknown_83FDA60
	.4byte Unknown_83FDA80
	.4byte Unknown_83FDAA0

	.global gUnknown_083FDB14
gUnknown_083FDB14: @ 83FDB14
	.incbin "baserom.gba", 0x003fdb14, 0x30

	.global gUnknown_083FDB44
gUnknown_083FDB44: @ 83FDB44
	.incbin "baserom.gba", 0x003fdb44, 0x4b0

	.global gUnknown_083FDFF4
gUnknown_083FDFF4: @ 83FDFF4
	.incbin "baserom.gba", 0x003fdff4, 0x500

	.include "data/text/battle_strings.s"

	.global gUnknown_084016BC
gUnknown_084016BC: @ 84016BC
	.incbin "baserom.gba", 0x004016bc, 0xec

	.global gUnknown_084017A8
gUnknown_084017A8: @ 84017A8
	.incbin "baserom.gba", 0x004017a8, 0x8

	.align 2
	.global gUnknown_084017B0
gUnknown_084017B0: @ 84017B0
	.4byte OtherText_Summary
	.4byte sub_812265C
	.4byte OtherText_Enter2
	.4byte sub_8122694
	.4byte OtherText_NoEntry
	.4byte sub_8122770
	.4byte UnknownText_Exit
	.4byte sub_8122838
	.4byte 0x02030001
	.4byte 0x03000300

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

	.align 2
	.global gUnknown_08401D9C
gUnknown_08401D9C: @ 8401D9C
	.4byte sub_8123EB8
	.4byte sub_8123F44

	.global gUnknown_08401DA4
gUnknown_08401DA4: @ 8401DA4
	.incbin "baserom.gba", 0x00401da4, 0x70

	.global gUnknown_08401E14
gUnknown_08401E14: @ 8401E14
	.incbin "baserom.gba", 0x00401e14, 0x10

	.global gUnknown_08401E24
gUnknown_08401E24: @ 8401E24
	.byte 0x1E, 0x1F @ flash sectors

@ XXX: Unused? And why is this aligned?
	.align 2
	.string "タマゴ$"

	.global gUnknown_08401E2C
gUnknown_08401E2C: @ 8401E2C
	.incbin "baserom.gba", 0x00401e2c, 0x6

	.global gUnknown_08401E32
gUnknown_08401E32: @ 8401E32
	.incbin "baserom.gba", 0x00401e32, 0x4

	.global gUnknown_08401E36
gUnknown_08401E36: @ 8401E36
	.incbin "baserom.gba", 0x00401e36, 0xa

	.align 2
	.global gUnknown_08401E40
gUnknown_08401E40: @ 8401E40
	.4byte sub_81275A0
	.4byte sub_81275C4

	.align 2
	.global gUnknown_08401E48
gUnknown_08401E48: @ 8401E48
	.4byte sub_8127DA0
	.4byte sub_8127DD0
	.4byte sub_8127E30

	.global gUnknown_08401E54
gUnknown_08401E54: @ 8401E54
	.incbin "baserom.gba", 0x00401e54, 0x6

	.global gUnknown_08401E5A
gUnknown_08401E5A: @ 8401E5A
	.incbin "baserom.gba", 0x00401e5a, 0x6

	.align 2
	.global gUnknown_08401E60
gUnknown_08401E60: @ 8401E60
	.4byte sub_8128AA8
	.4byte sub_8128AF0
	.4byte sub_8128B0C
	.4byte sub_8128B4C
	.4byte sub_8128B8C
	.4byte sub_8128BCC
	.4byte sub_8128C0C
	.4byte sub_8128C2C
	.4byte sub_8128C6C
	.4byte sub_8128CAC
	.4byte sub_8128CEC
	.4byte sub_8128D2C
	.4byte sub_8128D50
	.4byte sub_8128D90
	.4byte sub_8128DD0
	.4byte sub_8128E10
	.4byte sub_8128E50
	.4byte sub_8128E90
	.4byte sub_8128ED0
	.4byte sub_8128F10
	.4byte sub_8128F50
	.4byte sub_8128F90
	.4byte sub_8128FBC
	.4byte sub_8129008
	.4byte sub_8129054
	.4byte sub_81290A0
	.4byte sub_81290EC
	.4byte sub_8129114
	.4byte sub_8129160
	.4byte sub_81291AC
	.4byte sub_81291F8
	.4byte sub_8129244
	.4byte sub_8129264
	.4byte sub_81292A4
	.4byte sub_81292E4
	.4byte sub_8129324
	.4byte sub_8129368
	.4byte sub_81293AC
	.4byte sub_81293F0
	.4byte sub_8129434
	.4byte sub_8129470
	.4byte sub_81294B0
	.4byte sub_81294F0
	.4byte sub_8129538
	.4byte sub_8129578
	.4byte sub_81295B8
	.4byte sub_8129638
	.4byte sub_812967C
	.4byte sub_81296FC
	.4byte sub_8129740
	.4byte sub_8129798
	.4byte sub_81297D8
	.4byte sub_8129818
	.4byte sub_8129858
	.4byte sub_8129898
	.4byte sub_81298F0
	.4byte sub_8129930
	.4byte sub_8129970
	.4byte sub_81299B0
	.4byte sub_81299F0
	.4byte sub_8129A44
	.4byte sub_8129A84
	.4byte sub_8129AC4
	.4byte sub_8129B04
	.4byte sub_8129B44
	.4byte sub_8129BB8
	.4byte sub_8129BFC
	.4byte sub_8129C40
	.4byte sub_8129CB4
	.4byte sub_8129CF8
	.4byte sub_8129D3C
	.4byte sub_8129D98
	.4byte sub_8129DDC
	.4byte sub_8129E20
	.4byte sub_8129E64
	.4byte sub_8129EA4
	.4byte sub_8129EE4
	.4byte sub_8129F24
	.4byte sub_8129F64
	.4byte sub_8129FBC
	.4byte sub_8129FFC
	.4byte sub_812A03C
	.4byte sub_812A07C
	.4byte sub_812A0BC
	.4byte sub_812A100
	.4byte sub_812A144
	.4byte sub_812A188
	.4byte sub_812A1C4
	.4byte sub_812A208
	.4byte sub_812A24C
	.4byte sub_812A294
	.4byte sub_812A2D8
	.4byte sub_812A31C
	.4byte sub_812A360
	.4byte sub_812A3A4
	.4byte sub_812A3E4
	.4byte sub_812A428
	.4byte sub_812A46C
	.4byte sub_812A4B0
	.4byte sub_812A4F4
	.4byte sub_812A538
	.4byte sub_812A578
	.4byte sub_812A5B8
	.4byte sub_812A5F8
	.4byte sub_812A638
	.4byte sub_812A674
	.4byte sub_812A6B4
	.4byte sub_812A6F4
	.4byte sub_812A734
	.4byte sub_812A774
	.4byte sub_812A7C4
	.4byte sub_812A804
	.4byte sub_812A844
	.4byte sub_812A86C
	.4byte sub_812A898
	.4byte sub_812A8CC
	.4byte sub_812A8FC
	.4byte sub_812A92C
	.4byte sub_812A978
	.4byte sub_812A9C4
	.4byte sub_812AA10
	.4byte sub_812AA5C
	.4byte sub_812AAAC
	.4byte sub_812AAFC
	.4byte sub_812AB4C
	.4byte sub_812AB9C
	.4byte sub_812ABE8
	.4byte sub_812AC34
	.4byte sub_812AC54
	.4byte sub_812AC84
	.4byte sub_812ACFC
	.4byte sub_812AD50
	.4byte sub_812AD94
	.4byte sub_812ADD8
	.4byte sub_812AE44
	.4byte sub_812AE88

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
	obj_tiles 0x08402b78, 384, 0x1595

	.global gUnknown_08402D88
gUnknown_08402D88: @ 8402D88
	obj_pal 0x08402b58, 0x1596

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
	obj_pal 0x02030400, 0x0001

	.align 2
	.global gUnknown_08406134
gUnknown_08406134: @ 8406134
	.4byte OtherText_Coolness
	.4byte OtherText_Toughness
	.4byte OtherText_Smartness
	.4byte OtherText_Cuteness
	.4byte OtherText_Beauty

	.global gUnknown_08406148
gUnknown_08406148: @ 8406148
	obj_pal 0x08405f18, 0x0200

	.global gUnknown_08406150
gUnknown_08406150: @ 8406150
	obj_pal 0x08405ef8, 0x0000

	.global gUnknown_08406158
gUnknown_08406158: @ 8406158
	.incbin "baserom.gba", 0x00406158, 0x34

	.global gUnknown_0840618C
gUnknown_0840618C: @ 840618C
	.incbin "baserom.gba", 0x0040618c, 0x18

	.align 2
	.global gUnknown_084061A4
gUnknown_084061A4: @ 84061A4
	.4byte dp01t_00_5_getattr
	.4byte sub_8138230
	.4byte sub_813823C
	.4byte sub_8138C90
	.4byte sub_8138C9C
	.4byte sub_8138CA8
	.4byte sub_8138CB4
	.4byte sub_8138D38
	.4byte sub_8138E04
	.4byte sub_8138ED0
	.4byte sub_8138EDC
	.4byte sub_8138EE8
	.4byte sub_8138EF4
	.4byte sub_8138F44
	.4byte sub_8138FA0
	.4byte sub_8138FAC
	.4byte sub_8139208
	.4byte dp01t_11_5_message_for_player_only
	.4byte sub_8139298
	.4byte sub_8139378
	.4byte sub_8139384
	.4byte sub_81393EC
	.4byte sub_813942C
	.4byte sub_8139438
	.4byte sub_8139444
	.4byte sub_8139544
	.4byte sub_8139550
	.4byte sub_813955C
	.4byte sub_8139568
	.4byte sub_8139574
	.4byte sub_8139580
	.4byte sub_813958C
	.4byte sub_8139598
	.4byte sub_81395A4
	.4byte sub_81395B0
	.4byte sub_81395BC
	.4byte sub_81395C8
	.4byte sub_81395D4
	.4byte sub_81395E0
	.4byte sub_81395EC
	.4byte sub_81395F8
	.4byte sub_8139604
	.4byte sub_8139674
	.4byte sub_8139680
	.4byte sub_81396B0
	.4byte sub_81396E0
	.4byte dp01t_2E_5_battle_intro
	.4byte sub_8139750
	.4byte sub_8139AA0
	.4byte sub_8139B20
	.4byte sub_8139B2C
	.4byte sub_8139B38
	.4byte sub_8139B44
	.4byte sub_8139BA0
	.4byte sub_8139BAC
	.4byte sub_8139BB8
	.4byte nullsub_80

	.align 2
	.global gUnknown_08406288
gUnknown_08406288: @ 8406288
	.4byte PCText_TakeOutItems
	.4byte PCText_StoreItems
	.4byte PCText_ThrowAwayItems
	.4byte MenuText_GoBackToPrev

	.align 2
	.global gUnknown_08406298
gUnknown_08406298: @ 8406298
	.4byte SecretBaseText_ItemStorage
	.4byte sub_8139E40
	.4byte PCText_Mailbox
	.4byte sub_8139E6C
	.4byte SecretBaseText_Decoration
	.4byte sub_8139ED8
	.4byte SecretBaseText_TurnOff
	.4byte sub_8139EF8

	.global gUnknown_084062B8
gUnknown_084062B8: @ 84062B8
	.incbin "baserom.gba", 0x004062b8, 0x4

	.global gUnknown_084062BC
gUnknown_084062BC: @ 84062BC
	.incbin "baserom.gba", 0x004062bc, 0x4

	.align 2
	.global gUnknown_084062C0
gUnknown_084062C0: @ 84062C0
	.4byte PCText_WithdrawItem
	.4byte sub_813A118
	.4byte PCText_DepositItem
	.4byte sub_813A0A0
	.4byte PCText_TossItem
	.4byte sub_813A198
	.4byte UnknownText_Exit
	.4byte sub_813A21C

	.align 2
	.global gUnknown_084062E0
gUnknown_084062E0: @ 84062E0
	.4byte sub_813A83C
	.4byte sub_813A878

	.align 2
	.global gUnknown_084062E8
gUnknown_084062E8: @ 84062E8
	.4byte sub_813B578
	.4byte sub_813B610

	.global gUnknown_084062F0
gUnknown_084062F0: @ 84062F0
	.incbin "baserom.gba", 0x004062f0, 0x8

	.align 2
	.global gUnknown_084062F8
gUnknown_084062F8: @ 84062F8
	.4byte OtherText_Read
	.4byte sub_813B428
	.4byte OtherText_MoveToBag
	.4byte sub_813B510
	.4byte OtherText_Give
	.4byte sub_813B630
	.4byte OtherText_Cancel2
	.4byte sub_813B734

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
	.incbin "baserom.gba", 0x0040633a, 0x46
	.incbin "graphics/intro/intro.4bpp.lz"

	.global gUnknown_08406974
gUnknown_08406974: @ 8406974
	.incbin "graphics/intro/intro1_bgpal1.gbapal"
	.incbin "graphics/intro/intro1_bgpal2.gbapal"
	.incbin "graphics/intro/intro1_bgpal3.gbapal"
	.incbin "graphics/intro/intro1_bgpal4.gbapal"
	.incbin "graphics/intro/intro1_bgpal5.gbapal"
	.incbin "graphics/intro/intro1_bgpal6.gbapal"
	.incbin "graphics/intro/intro1_bgpal7.gbapal"
	.incbin "graphics/intro/intro1_bgpal8.gbapal"
	.incbin "graphics/intro/intro1_bgpal9.gbapal"
	.incbin "graphics/intro/intro1_bgpal10.gbapal"
	.incbin "graphics/intro/intro1_bgpal11.gbapal"
	.incbin "graphics/intro/intro1_bgpal12.gbapal"
	.incbin "graphics/intro/intro1_bgpal13.gbapal"
	.incbin "graphics/intro/intro1_bgpal14.gbapal"
	.incbin "graphics/intro/intro1_bgpal15.gbapal"
	.incbin "graphics/intro/intro1_bgpal16.gbapal"

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
@ replacing .incbin "baserom.gba", 0x00407764, 0x2170
	.incbin "graphics/intro/introgfx.4bpp.lz"

	.global gUnknown_084098D4
gUnknown_084098D4: @ 84098D4
	.incbin "graphics/intro/intro3_pokeball.gbapal"

	.global gUnknown_08409AD4
gUnknown_08409AD4: @ 8409AD4
	.incbin "baserom.gba", 0x00409ad4, 0x130

	.global gUnknown_08409C04
gUnknown_08409C04: @ 8409C04
	.incbin "graphics/intro/intro3_pokeball.8bpp.lz"

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
	obj_tiles 0x08d1a7f4, 256, 0xd6ec
	obj_tiles 0x08d1a7f4, 256, 0xd6ed
	obj_tiles 0x08d1a7f4, 256, 0xd6ee
	obj_tiles 0x08d1a7f4, 256, 0xd6ef
	obj_tiles 0x08d1a7f4, 256, 0xd6f0
	obj_tiles 0x08d1a7f4, 256, 0xd6f1
	obj_tiles 0x08d1a7f4, 256, 0xd6f2
	obj_tiles 0x08d1a7f4, 256, 0xd6f3
	obj_tiles 0x08d1a7f4, 256, 0xd6f4
	obj_tiles 0x08d1a7f4, 256, 0xd6f5
	obj_tiles 0x08d1a7f4, 256, 0xd6f6
	obj_tiles 0x08d1a7f4, 256, 0xd6f7

	.global gUnknown_0840B2B8
gUnknown_0840B2B8: @ 840B2B8
	.incbin "baserom.gba", 0x0040b2b8, 0xc0

	.global gUnknown_0840B378
gUnknown_0840B378: @ 840B378
	.incbin "baserom.gba", 0x0040b378, 0xc

	.align 2
	.global gUnknown_0840B384
gUnknown_0840B384: @ 840B384
	.4byte sub_8140930
	.4byte sub_8140DC4
	.4byte sub_8140C14
	.4byte sub_8140CE8
	.4byte sub_8141058
	.4byte sub_8140C14
	.4byte sub_8140B3C
	.4byte sub_8140CE8
	.4byte sub_8140F24
	.4byte sub_8140A64
	.4byte sub_8140DC4
	.4byte sub_8141164

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
Unknown_840B5A0:
	.incbin "baserom.gba", 0x0040b5a0, 0x1C
Unknown_840B5BC:
	.incbin "baserom.gba", 0x0040b5bc, 0x20
Unknown_840B5DC:
	.incbin "baserom.gba", 0x0040b5dc, 0x20
Unknown_840B5FC:
	.incbin "baserom.gba", 0x0040b5fc, 0x20
Unknown_840B61C:
	.incbin "baserom.gba", 0x0040b61c, 0x20
Unknown_840B63C:
	.incbin "baserom.gba", 0x0040b63c, 0x20
Unknown_840B65C:
	.incbin "baserom.gba", 0x0040b65c, 0x20
Unknown_840B67C:
	.incbin "baserom.gba", 0x0040b67c, 0x20

	.align 2
	.global gUnknown_0840B69C
gUnknown_0840B69C: @ 840B69C
	.4byte Unknown_840B5BC
	.4byte Unknown_840B5DC
	.4byte Unknown_840B5FC
	.4byte Unknown_840B61C
	.4byte Unknown_840B63C
	.4byte Unknown_840B65C
	.4byte Unknown_840B67C

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
Unknown_840CA00:
	.incbin "baserom.gba", 0x0040ca00, 0x8
Unknown_840CA08:
	.incbin "baserom.gba", 0x0040ca08, 0x14
Unknown_840CA1C:
	.incbin "baserom.gba", 0x0040ca1c, 0x14
Unknown_840CA30:
	.incbin "baserom.gba", 0x0040ca30, 0x10
Unknown_840CA40:
	.incbin "baserom.gba", 0x0040ca40, 0x14

	.align 2
	.global gUnknown_0840CA54
gUnknown_0840CA54: @ 840CA54
Unknown_840CA54:
	.4byte Unknown_840CA08
	.4byte Unknown_840CA1C
	.4byte Unknown_840CA30
	.4byte Unknown_840CA40
Unknown_840CA64:
	.incbin "baserom.gba", 0x0040ca64, 0x14
Unknown_840CA78:
	.incbin "baserom.gba", 0x0040ca78, 0x14
Unknown_840CA8C:
	.incbin "baserom.gba", 0x0040ca8c, 0x8

	.align 2
	.global gUnknown_0840CA94
gUnknown_0840CA94: @ 840CA94
	.4byte Unknown_840CA64
	.4byte Unknown_840CA78
	.4byte Unknown_840CA8C

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

	.global gExpandedPlaceholder_Kun
gExpandedPlaceholder_Kun: @ 840DC81
	.string "$"

	.global gExpandedPlaceholder_Chan
gExpandedPlaceholder_Chan: @ 840DC82
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
SystemText_Egg:
	.string "EGG$"

	.global gUnknown_0840DCC8
gUnknown_0840DCC8: @ 840DCC8
SystemText_Pokemon2:
	.string "POKéMON$"

	.global gUnknown_0840DCD0
gUnknown_0840DCD0: @ 840DCD0
SystemText_NewGame:
	.string "NEW GAME$"

	.global gUnknown_0840DCD9
gUnknown_0840DCD9: @ 840DCD9
SystemText_Continue:
	.string "CONTINUE$"

	.global gUnknown_0840DCE2
gUnknown_0840DCE2: @ 840DCE2
SystemText_Option2:
	.string "OPTION$"

	.global gUnknown_0840DCE9
gUnknown_0840DCE9: @ 840DCE9
SystemText_MysteryEvents:
	.string "MYSTERY EVENTS$"
SystemText_UpdatingSaveExternal:
	.string "Updating save file using external\ndata. Please wait.$"
SystemText_SaveUpdated:
	.string "The save file has been updated.$"
SystemText_SaveUpdatedExchangeBackup:
	.string "The save file has been updated.\pFurther game data cannot be saved\nto the backup memory.\pPlease exchange the backup memory.\pFor details, please contact the\nNintendo Service Center.$"
SystemText_SaveNotUpdated:
	.string "The save file could not be updated.\pPlease exchange the backup\nmemory.\pFor details, please contact the\nNintendo Service Center.$"

	.global gUnknown_0840DE81
gUnknown_0840DE81: @ 840DE81
SystemText_SaveCorrupt:
	.string "The save file is corrupt. The\nprevious save file will be loaded.$"

	.global gUnknown_0840DEC2
gUnknown_0840DEC2: @ 840DEC2
SystemText_SaveDeleted:
	.string " The save file has been deleted...$" @ there's a blank spot at the beginning of this string. No idea why.

	.global gUnknown_0840DEE5
gUnknown_0840DEE5: @ 840DEE5
SystemText_1MSubCircuitNotInstalled:
	.string "The 1M sub-circuit board is\nnot installed.$"

	.global gUnknown_0840DF10
gUnknown_0840DF10: @ 840DF10
SystemText_InternalBatteryIsDry:
	.string "The internal battery has run dry.\nThe game can be played.\pHowever, clock-based events will\nno longer occur.$"

	.global gUnknown_0840DF7C
gUnknown_0840DF7C: @ 840DF7C
SystemText_Player2:
	.string "PLAYER$"

	.global gUnknown_0840DF83
gUnknown_0840DF83: @ 840DF83
SystemText_Pokedex2:
	.string "POKéDEX$"

	.global gUnknown_0840DF8B
gUnknown_0840DF8B: @ 840DF8B
SystemText_Time:
	.string "TIME$"

	.global gUnknown_0840DF90
gUnknown_0840DF90: @ 840DF90
SystemText_Badges:
	.string "BADGES$"
SystemText_IntroBoy:
	.string "BOY$"
SystemText_IntroGirl:
	.string "GIRL$"
SystemText_IntroNewName:
	.string "NEW NAME$"

gDefaultBoyName1::
	.ifdef SAPPHIRE
	.string "SEAN$"
	.else
	.string "LANDON$"
	.endif
gDefaultBoyName2::
	.string "TERRY$"
gDefaultBoyName3::
	.string "SETH$"
gDefaultBoyName4::
	.string "TOM$"

gDefaultGirlName1::
	.ifdef SAPPHIRE
	.string "MARINA$"
	.else
	.string "TERRA$"
	.endif
gDefaultGirlName2::
	.string "KIMMY$"
gDefaultGirlName3::
	.string "NICOLA$"
gDefaultGirlName4::
	.string "SARA$"

SystemText_IntroWeCall:
	.string "This is what we call\na POKéMON.$"

	.global gUnknown_0840DFF7
gUnknown_0840DFF7: @ 840DFF7
SystemText_NewPara:
	.string "\p$"

	.global gUnknown_0840DFF9
gUnknown_0840DFF9: @ 840DFF9
DexText_UnknownPoke:
	.string "            ????? POKéMON$" @ why 12 spaces?

	.global gUnknown_0840E013
gUnknown_0840E013: @ 840E013
	.incbin "baserom.gba", 0x0040e013, 0xa @ unknown size of dummy pokemon

	.global gUnknown_0840E01D
gUnknown_0840E01D: @ 840E01D
DexText_UnknownWeight:
	.string "????.? lbs.$"
DexText_Terminator4:
	.string "$"

	.global gUnknown_0840E02A
gUnknown_0840E02A: @ 840E02A
	.incbin "baserom.gba", 0x0040e02a, 0xb @ unknown cry of dummy pokemon

	.global gUnknown_0840E035
gUnknown_0840E035: @ 840E035
DexText_SizeComparedTo:
	.string "SIZE COMPARED TO $"

	.global gUnknown_0840E047
gUnknown_0840E047: @ 840E047
DexText_RegisterComplete:
	.string "POKéDEX registration completed.$"

	.global gUnknown_0840E067
gUnknown_0840E067: @ 840E067
DexText_Searching:
	.string "Searching...\nPlease wait.$"

	.global gUnknown_0840E081
gUnknown_0840E081: @ 840E081
DexText_SearchComplete:
	.string "Search completed.$"

	.global gUnknown_0840E093
gUnknown_0840E093: @ 840E093
DexText_NoMatching:
	.string "No matching POKéMON were found.$"
DexText_SearchForPoke:
	.string "Search for POKéMON based on\nselected parameters.$"
DexText_SwitchDex:
	.string "Switch POKéDEX listings.$"
DexText_ReturnToDex:
	.string "Return to the POKéDEX.$"
DexText_SelectDexMode:
	.string "Select the POKéDEX mode.$"
DexText_SelectDexList:
	.string "Select the POKéDEX listing mode.$"
DexText_ListByABC:
	.string "List by the first letter in the name.\n/Spotted POKéMON only.$"
DexText_ListByColor:
	.string "List by body color.\n/Spotted POKéMON only.$"
DexText_ListByType:
	.string "List by type.\n/Owned POKéMON only.$"
DexText_ExecuteSearchSwitch:
	.string "Execute search/switch.$"
DexText_HoennDex:
	.string "HOENN DEX$"
DexText_NationalDex:
	.string "NATIONAL DEX$"
DexText_NumericalMode:
	.string "NUMERICAL MODE$"
DexText_ABCMode:
	.string "A TO Z MODE$"
DexText_HeaviestMode:
	.string "HEAVIEST MODE$"
DexText_LightestMode:
	.string "LIGHTEST MODE$"
DexText_TallestMode:
	.string "TALLEST MODE$"
DexText_SmallestMode:
	.string "SMALLEST MODE$"
DexText_ABC:
	.string "ABC$"
DexText_DEF:
	.string "DEF$"
DexText_GHI:
	.string "GHI$"
DexText_JKL:
	.string "JKL$"
DexText_MNO:
	.string "MNO$"
DexText_PQR:
	.string "PQR$"
DexText_STU:
	.string "STU$"
DexText_VWX:
	.string "VWX$"
DexText_YZ:
	.string "YZ$"
DexText_Red:
	.string "RED$"
DexText_Blue:
	.string "BLUE$"
DexText_Yellow:
	.string "YELLOW$"
DexText_Green:
	.string "GREEN$"
DexText_Black:
	.string "BLACK$"
DexText_Brown:
	.string "BROWN$"
DexText_Purple:
	.string "PURPLE$"
DexText_Gray:
	.string "GRAY$"
DexText_White:
	.string "WHITE$"
DexText_Pink:
	.string "PINK$"
DexText_HoennDex2:
	.string "HOENN region’s POKéDEX$"
DexText_NationalDex2:
	.string "National edition POKéDEX$"
DexText_ListByNumber:
	.string "POKéMON are listed according to their\nnumber.$"
DexText_ListByABC2:
	.string "Spotted and owned POKéMON are listed\nalphabetically.$"
DexText_ListByHeavyToLightest:
	.string "Owned POKéMON are listed from the\nheaviest to the lightest.$"
DexText_ListByLightToHeaviest:
	.string "Owned POKéMON are listed from the\nlightest to the heaviest.$"
DexText_ListByTallToSmallest:
	.string "Owned POKéMON are listed from the\ntallest to the smallest.$"
DexText_ListBySmallToTallest:
	.string "Owned POKéMON are listed from the\nsmallest to the tallest.$"
DexText_Terminator5:
	.string "$"
DexText_DontSpecify:
	.string "DON’T SPECIFY.$"
DexText_None:
	.string "NONE$"
DexText_RightPointingTriangle:
	.string "▶$" @ right-pointing triangle
DexText_Terminator6:
	.string " $"

	.global gUnknown_0840E44F
gUnknown_0840E44F: @ 840E44F
MenuText_WelcomeToHOF:
	.string "Welcome to the HALL OF FAME!$"
MenuText_HOFDexRate:
	.string "Spotted POKéMON: {STR_VAR_1}!\nOwned POKéMON: {STR_VAR_2}!\pPROF. BIRCH’s POKéDEX rating!\pPROF. BIRCH: Let’s see...\p$"

	.global gUnknown_0840E4CD
gUnknown_0840E4CD: @ 840E4CD
MenuText_HOFSaving:
	.string "SAVING...\nDON’T TURN OFF THE POWER.$"

	.global gUnknown_0840E4F1
gUnknown_0840E4F1: @ 840E4F1
MenuText_HOFCorrupt:
	.string "The HALL OF FAME data is corrupt.$"

	.global gUnknown_0840E513
gUnknown_0840E513: @ 840E513
MenuText_HOFNumber:
	.string "HALL OF FAME No. $"

	.global gUnknown_0840E525
gUnknown_0840E525: @ 840E525
MenuText_HOFCongratulations:
	.string "LEAGUE CHAMPION!\nCONGRATULATIONS!$"

	.global gUnknown_0840E547
gUnknown_0840E547: @ 840E547
OtherText_Number2:
	.string "No. $"

	.global gUnknown_0840E54C
gUnknown_0840E54C: @ 840E54C
OtherText_Level3:
	.string "Lv. $"

	.global gUnknown_0840E551
gUnknown_0840E551: @ 840E551
OtherText_IDNumber:
	.string "IDNo. /$"

	.global gUnknown_0840E559
gUnknown_0840E559: @ 840E559
OtherText_Name:
	.string "NAME /$"

	.global gUnknown_0840E560
gUnknown_0840E560: @ 840E560
OtherText_IDNumber2:
	.string "IDNo. /$" @ identical string for no reason?

	.global gUnknown_0840E568
gUnknown_0840E568: @ 840E568
OtherText_BirchInTrouble:
	.string "{HIGHLIGHT WHITE2}{COLOR DARK_GREY}PROF. BIRCH is in trouble!\nRelease a POKéMON and rescue him!$"

	.global gUnknown_0840E5AB
gUnknown_0840E5AB: @ 840E5AB
OtherText_DoYouChoosePoke:
	.string "{HIGHLIGHT WHITE2}{COLOR DARK_GREY}Do you choose this POKéMON?$"

	.global gUnknown_0840E5CD
gUnknown_0840E5CD: @ 840E5CD
OtherText_Poke:
	.string "POKéMON$"

	.global gUnknown_0840E5D5
gUnknown_0840E5D5: @ 840E5D5
SystemText_SaveErrorExchangeBackup:
	.string "Save error.\pPlease exchange the\nbackup memory.$"

	.global gUnknown_0840E604
gUnknown_0840E604: @ 840E604
OtherText_FlyToWhere:
	.string "FLY to where?$"
OtherText_Use:
	.string "USE$"
OtherText_Toss:
	.string "TOSS$"
OtherText_Register:
	.string "REGISTER$"
OtherText_Give2:
	.string "GIVE$"
OtherText_CheckTag:
	.string "CHECK TAG$"
OtherText_Confirm:
	.string "CONFIRM$"

	.global gUnknown_0840E63B
gUnknown_0840E63B: @ 840E63B
OtherText_Walk:
	.string "WALK$"

	.global gUnknown_0840E640
gUnknown_0840E640: @ 840E640
UnknownText_Exit:
	.string "EXIT$"

	.global gUnknown_0840E645
gUnknown_0840E645: @ 840E645
OtherText_Cancel2:
	.string "CANCEL$"

	.global gUnknown_0840E64C
gUnknown_0840E64C: @ 840E64C
OtherText_Terminator19:
	.string "$"
OtherText_Cancel3:
	.string "CANCEL$"
OtherText_Item:
	.string "ITEM$"
OtherText_Mail:
	.string "MAIL$"
OtherText_Take2:
	.string "TAKE$"
OtherText_Store:
	.string "STORE$"

	.global gUnknown_0840E669
gUnknown_0840E669: @ 840E669
OtherText_Check:
	.string "CHECK$"

	.global gUnknown_0840E66F
gUnknown_0840E66F: @ 840E66F
OtherText_None:
	.string "NONE$"

	.global gUnknown_0840E674
gUnknown_0840E674: @ 840E674
OtherText_ThreeQuestions2:
	.string "???$"

	.global gUnknown_0840E678
gUnknown_0840E678: @ 840E678
OtherText_FiveQuestions:
	.string "?????$"
OtherText_Backslash:
	.string "/$"

	.global gUnknown_0840E680
gUnknown_0840E680: @ 840E680
OtherText_OneDash:
	.string "-$"

	.global gUnknown_0840E682
gUnknown_0840E682: @ 840E682
OtherText_TwoDashes:
	.string "--$"

	.global gUnknown_0840E685
gUnknown_0840E685: @ 840E685
OtherText_ThreeDashes2:
	.string "---$"

	.global gUnknown_0840E689
gUnknown_0840E689: @ 840E689
OtherText_MaleSymbol2:
	.string "♂$"

	.global gUnknown_0840E68B
gUnknown_0840E68B: @ 840E68B
OtherText_FemaleSymbol2:
	.string "♀$"
OtherText_Level2:
	.string "Lv.$"

	.global gUnknown_0840E691
gUnknown_0840E691: @ 840E691
OtherText_TallPlus:
	.string "{TALL_PLUS}$"
OtherText_RightArrow:
	.string "{RIGHT_ARROW}$"

	.global gUnknown_0840E697
gUnknown_0840E697: @ 840E697
MenuText_GoBackToPrev:
	.string "Go back to the\nprevious menu.$"

	.global gUnknown_0840E6B5
gUnknown_0840E6B5: @ 840E6B5
OtherText_WhatWillYouDo:
	.string "What would you like to do?$"

	.global gUnknown_0840E6D0
gUnknown_0840E6D0: @ 840E6D0
OtherText_xString1:
	.string "×{STR_VAR_1}$"

	.global gUnknown_0840E6D4
gUnknown_0840E6D4: @ 840E6D4
OtherText_Berry2:
	.string " BERRY$"

	.global gUnknown_0840E6DB
gUnknown_0840E6DB: @ 840E6DB
OtherText_Coins2:
	.string "{STR_VAR_1} COINS$"

	.global gUnknown_0840E6E4
gUnknown_0840E6E4: @ 840E6E4
OtherText_CloseBag:
	.string "CLOSE BAG$"
OtherText_TheField3:
	.string "the field.$"
OtherText_TheBattle:
	.string "the battle.$"
OtherText_ThePokeList:
	.string "the POKéMON LIST.$"
OtherText_TheShop:
	.string "the shop.$"
OtherText_TheField:
	.string "the field.$"
OtherText_TheField2:
	.string "the field.$"
OtherText_ThePC:
	.string "the PC.$"

	.align 2
	.global gUnknown_0840E740
gUnknown_0840E740: @ 840E740
	.4byte OtherText_TheField3
	.4byte OtherText_TheBattle
	.4byte OtherText_ThePokeList
	.4byte OtherText_TheShop
	.4byte OtherText_TheField
	.4byte OtherText_TheField2
	.4byte OtherText_ThePC
	
	.global gUnknown_0840E75C
gUnknown_0840E75C: @ 840E75C
OtherText_ReturnTo:
	.string "Return to$"

	.global gUnknown_0840E766
gUnknown_0840E766: @ 840E766
OtherText_WhatWillYouDo2:
	.string "What would you\nlike to do?$"

	.global gUnknown_0840E781
gUnknown_0840E781: @ 840E781
OtherText_CantWriteMail:
	.string "You can’t write\nMAIL here.$"

	.global gUnknown_0840E79C
gUnknown_0840E79C: @ 840E79C
OtherText_NoPokemon:
	.string "There is no\nPOKéMON.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840E7B3
gUnknown_0840E7B3: @ 840E7B3
OtherText_SwitchWhichItem:
	.string "Switch with which\nitem?$"

	.global gUnknown_0840E7CB
gUnknown_0840E7CB: @ 840E7CB
OtherText_CantBeHeld:
	.string "{STR_VAR_1} can’t be held.$"

	.global gUnknown_0840E7DD
gUnknown_0840E7DD: @ 840E7DD
OtherText_CantBeHeldHere:
	.string "{STR_VAR_1} can’t be held here.$"

	.global gUnknown_0840E7F4
gUnknown_0840E7F4: @ 840E7F4
OtherText_HowManyToDeposit:
	.string "How many do you\nwant to deposit?$"

	.global gUnknown_0840E815
gUnknown_0840E815: @ 840E815
OtherText_DepositedItems:
	.string "Deposited {STR_VAR_2}\n{STR_VAR_1}(s).$"

	.global gUnknown_0840E829
gUnknown_0840E829: @ 840E829
OtherText_NoRoomForItems:
	.string "There’s no room to\nstore items.$"

	.global gUnknown_0840E849
gUnknown_0840E849: @ 840E849
OtherText_CantStoreSomeoneItem:
	.string "You can’t store\nsomeone else’s item\nin the PC.$"

	.global gUnknown_0840E878
gUnknown_0840E878: @ 840E878
OtherText_TooImportant:
	.string "That’s much too\nimportant to toss\nout!$"

	.global gUnknown_0840E89F
gUnknown_0840E89F: @ 840E89F
OtherText_HowManyToToss:
	.string "Toss out how many?$"

	.global gUnknown_0840E8B2
gUnknown_0840E8B2: @ 840E8B2
OtherText_ThrewAwayItem:
	.string "Threw away {STR_VAR_2}\n{STR_VAR_1}(s).$"

	.global gUnknown_0840E8C7
gUnknown_0840E8C7: @ 840E8C7
OtherText_OkayToThrowAwayPrompt:
	.string "Is it okay to\nthrow away {STR_VAR_2}\n{STR_VAR_1}(s)?$"

	.global gUnknown_0840E8EA
gUnknown_0840E8EA: @ 840E8EA
OtherText_DadsAdvice:
	.string "DAD’s advice...\n{PLAYER}, there’s a time and place for\leverything!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840E929
gUnknown_0840E929: @ 840E929
OtherText_CantGetOffBike:
	.string "You can’t dismount your BIKE here.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840E94E
gUnknown_0840E94E: @ 840E94E
OtherText_ItemfinderResponding:
	.string "Oh!\nThe machine’s responding!\pThere’s an item buried around here!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840E992
gUnknown_0840E992: @ 840E992
OtherText_ItemfinderFoundItem:
	.string "The machine’s indicating something\nright underfoot!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840E9C8
gUnknown_0840E9C8: @ 840E9C8
OtherText_NoResponse:
	.string "... ... ... ... Nope!\nThere’s no response.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840E9F5
gUnknown_0840E9F5: @ 840E9F5
OtherText_Coins3:
	.string "Your COINS:\n{STR_VAR_1}{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EA06
gUnknown_0840EA06: @ 840EA06
OtherText_BootedTM:
	.string "Booted up a TM.$"

	.global gUnknown_0840EA16
gUnknown_0840EA16: @ 840EA16
OtherText_BootedHM:
	.string "Booted up an HM.$"

	.global gUnknown_0840EA27
gUnknown_0840EA27: @ 840EA27
OtherText_ContainsMove:
	.string "It contained\n{STR_VAR_1}.\pTeach {STR_VAR_1}\nto a POKéMON?$"

	.global gUnknown_0840EA4F
gUnknown_0840EA4F: @ 840EA4F
OtherText_UsedItem:
	.string "{PLAYER} used the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EA61
gUnknown_0840EA61: @ 840EA61
OtherText_RepelLingers:
	.string "But the effects of a REPEL lingered\nfrom earlier.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EA95
gUnknown_0840EA95: @ 840EA95
OtherText_UsedFlute:
	.string "{PLAYER} used the\n{STR_VAR_2}.\pWild POKéMON will be lured.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EAC3
gUnknown_0840EAC3: @ 840EAC3
OtherText_UsedRepel:
	.string "{PLAYER} used the\n{STR_VAR_2}.\pWild POKéMON will be repelled.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EAF4
gUnknown_0840EAF4: @ 840EAF4
OtherText_BoxIsFull:
	.string "The BOX is full.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EB07
gUnknown_0840EB07: @ 840EB07
OtherText_Size:
	.string "SIZE /$"

	.global gUnknown_0840EB0E
gUnknown_0840EB0E: @ 840EB0E
OtherText_Firm:
	.string "FIRM /$"

	.global gUnknown_0840EB15
gUnknown_0840EB15: @ 840EB15
ContestStatsText_Unknown1:
	.string "{STR_VAR_1}.{STR_VAR_2}”$"
ContestStatsText_VerySoft:
	.string "Very soft$"
ContestStatsText_Soft:
	.string "Soft$"
ContestStatsText_Hard:
	.string "Hard$"
ContestStatsText_VeryHard:
	.string "Very hard$"
ContestStatsText_SuperHard:
	.string "Super hard$"
ContestStatsText_RedPokeBlock:
	.string "RED {POKEBLOCK}$"
ContestStatsText_BluePokeBlock:
	.string "BLUE {POKEBLOCK}$"
ContestStatsText_PinkPokeBlock:
	.string "PINK {POKEBLOCK}$"
ContestStatsText_GreenPokeBlock:
	.string "GREEN {POKEBLOCK}$"
ContestStatsText_YellowPokeBlock:
	.string "YELLOW {POKEBLOCK}$"
ContestStatsText_PurplePokeBlock:
	.string "PURPLE {POKEBLOCK}$"
ContestStatsText_IndigoPokeBlock:
	.string "INDIGO {POKEBLOCK}$"
ContestStatsText_BrownPokeBlock:
	.string "BROWN {POKEBLOCK}$"
ContestStatsText_LiteBluePokeBlock:
	.string "LITEBLUE {POKEBLOCK}$"
ContestStatsText_OlivePokeBlock:
	.string "OLIVE {POKEBLOCK}$"
ContestStatsText_GrayPokeBlock:
	.string "GRAY {POKEBLOCK}$"
ContestStatsText_BlackPokeBlock:
	.string "BLACK {POKEBLOCK}$"
ContestStatsText_WhitePokeBlock:
	.string "WHITE {POKEBLOCK}$"
ContestStatsText_GoldPokeBlock:
	.string "GOLD {POKEBLOCK}$"

	.global gUnknown_0840EBED
gUnknown_0840EBED: @ 840EBED
ContestStatsText_Spicy:
	.string "SPICY$"

	.global gUnknown_0840EBF3
gUnknown_0840EBF3: @ 840EBF3
ContestStatsText_Dry:
	.string "DRY$"

	.global gUnknown_0840EBF7
gUnknown_0840EBF7: @ 840EBF7
ContestStatsText_Sweet:
	.string "SWEET$"

	.global gUnknown_0840EBFD
gUnknown_0840EBFD: @ 840EBFD
ContestStatsText_Bitter:
	.string "BITTER$"

	.global gUnknown_0840EC04
gUnknown_0840EC04: @ 840EC04
ContestStatsText_Sour:
	.string "SOUR$"
ContestStatsText_Tasty:
	.string "TASTY$"
ContestStatsText_Feel:
	.string "FEEL$"

	.global gUnknown_0840EC14
gUnknown_0840EC14: @ 840EC14
ContestStatsText_StowCase:
	.string "Stow CASE.$"

	.global gUnknown_0840EC1F
gUnknown_0840EC1F: @ 840EC1F
ContestStatsText_ThrowAwayPrompt:
	.string "Throw away this\n{STR_VAR_1}?$"

	.global gUnknown_0840EC33
gUnknown_0840EC33: @ 840EC33
ContestStatsText_WasThrownAway:
	.string "The {STR_VAR_1}\nwas thrown away.$"

	.global gUnknown_0840EC4B
gUnknown_0840EC4B: @ 840EC4B
ContestStatsText_NormallyAte:
	.string "{STR_VAR_1} ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EC5C
gUnknown_0840EC5C: @ 840EC5C
ContestStatsText_HappilyAte:
	.string "{STR_VAR_1} happily ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EC75
gUnknown_0840EC75: @ 840EC75
ContestStatsText_DisdainfullyAte:
	.string "{STR_VAR_1} disdainfully ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"
ContestStatsText_Buy: @ i have a feeling contest things still call these
	.string "BUY$"
ContestStatsText_Sell:
	.string "SELL$"
ContestStatsText_Quit2:
	.string "QUIT$"

	.global gUnknown_0840ECA1
gUnknown_0840ECA1: @ 840ECA1
OtherText_QuitShopping:
	.string "Quit shopping.$"

	.global gUnknown_0840ECB0
gUnknown_0840ECB0: @ 840ECB0
OtherText_HowManyYouWant:
	.string "{STR_VAR_1}? Certainly.\nHow many would you like?$"

	.global gUnknown_0840ECD8
gUnknown_0840ECD8: @ 840ECD8
OtherText_ThatWillBe:
	.string "{STR_VAR_1}? And you wanted {STR_VAR_2}?\nThat will be ¥{STR_VAR_3}.$"

	.global gUnknown_0840ED01
gUnknown_0840ED01: @ 840ED01
OtherText_ThatWillBe2:
	.string "{STR_VAR_1}, is it?\nThat’ll be ¥{STR_VAR_2}. Do you want it?$"

	.global gUnknown_0840ED2C
gUnknown_0840ED2C: @ 840ED2C
OtherText_ThatWillBe3:
	.string "You wanted {STR_VAR_1}?\nThat’ll be ¥{STR_VAR_2}. Will that be okay?$"

	.global gUnknown_0840ED5E
gUnknown_0840ED5E: @ 840ED5E
OtherText_HereYouGo:
	.string "Here you go!\nThank you very much.$"

	.global gUnknown_0840ED80
gUnknown_0840ED80: @ 840ED80
OtherText_HereYouGo2:
	.string "Thank you!\nI’ll send it to your home PC.$"

	.global gUnknown_0840EDA9
gUnknown_0840EDA9: @ 840EDA9
OtherText_HereYouGo3:
	.string "Thanks!\nI’ll send it to your PC at home.$"

	.global gUnknown_0840EDD2
gUnknown_0840EDD2: @ 840EDD2
OtherText_NotEnoughMoney:
	.string "You don’t have enough money.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EDF1
gUnknown_0840EDF1: @ 840EDF1
OtherText_NoRoomFor:
	.string "You have no more room for items.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EE14
gUnknown_0840EE14: @ 840EE14
OtherText_SpaceForIsFull:
	.string "The space for {STR_VAR_1} is full.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EE30
gUnknown_0840EE30: @ 840EE30
OtherText_AnythingElse:
	.string "Is there anything else I can help\nyou with?$"

	.global gUnknown_0840EE5C
gUnknown_0840EE5C: @ 840EE5C
OtherText_CanIHelpYou:
	.string "Can I help you with anything else?$"

	.global gUnknown_0840EE7F
gUnknown_0840EE7F: @ 840EE7F
OtherText_FreePremierBall:
	.string "I’ll throw in a PREMIER BALL, too.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EEA4
gUnknown_0840EEA4: @ 840EEA4
OtherText_CantBuyThat:
	.string "{STR_VAR_2}? Oh, no.\nI can’t buy that.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EEC4
gUnknown_0840EEC4: @ 840EEC4
OtherText_HowManyToSell:
	.string "{STR_VAR_2}?\nHow many would you like to sell?$"

	.global gUnknown_0840EEE9
gUnknown_0840EEE9: @ 840EEE9
OtherText_CanPay:
	.string "I can pay ¥{STR_VAR_1}.\nWould that be okay?$"

	.global gUnknown_0840EF0C
gUnknown_0840EF0C: @ 840EF0C
OtherText_SoldItem:
	.string "Turned over the {STR_VAR_2}\nand received ¥{STR_VAR_1}.$"
OtherText_Money:
	.string "¥{STR_VAR_1}$"
OtherText_Shift:
	.string "SHIFT$"
OtherText_SendOut:
	.string "SEND OUT$"
OtherText_Switch2:
	.string "SWITCH$"
OtherText_Summary:
	.string "SUMMARY$"
OtherText_Moves:
	.string "MOVES$"
OtherText_Enter2:
	.string "ENTER$"
OtherText_NoEntry:
	.string "NO ENTRY$"
OtherText_Take:
	.string "TAKE$"
OtherText_Read2:
	.string "READ$"

	.global gUnknown_0840EF72
gUnknown_0840EF72: @ 840EF72
OtherText_Hp2:
	.string "HP$"

	.global gUnknown_0840EF75
gUnknown_0840EF75: @ 840EF75
OtherText_SpAtk2:
	.string "SP. ATK$"

	.global gUnknown_0840EF7D
gUnknown_0840EF7D: @ 840EF7D
OtherText_SpDef2:
	.string "SP. DEF$"

	.global gUnknown_0840EF85
gUnknown_0840EF85: @ 840EF85
OtherText_WontHaveAnyEffect:
	.string "It won’t have any effect.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EFA1
gUnknown_0840EFA1: @ 840EFA1
OtherText_CantUseItemOnPoke:
	.string "This item can’t be used on\nthat POKéMON.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EFCC
gUnknown_0840EFCC: @ 840EFCC
OtherText_CantBeSwitched:
	.string "{STR_VAR_1} can’t be switched\nout!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840EFE8
gUnknown_0840EFE8: @ 840EFE8
OtherText_AlreadyBattle:
	.string "{STR_VAR_1} is already\nin battle!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F003
gUnknown_0840F003: @ 840F003
OtherText_AlreadySelected:
	.string "{STR_VAR_1} has already been\nselected.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F023
gUnknown_0840F023: @ 840F023
OtherText_NoEnergyLeft:
	.string "{STR_VAR_1} has no energy\nleft to battle!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F046
gUnknown_0840F046: @ 840F046
OtherText_CantSwitchPokeWithYours:
	.string "You can’t switch {STR_VAR_1}’s\nPOKéMON with one of yours!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F079
gUnknown_0840F079: @ 840F079
OtherText_EGGCantBattle:
	.string "An EGG can’t battle!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F090
gUnknown_0840F090: @ 840F090
OtherText_CantBeUsedBadge:
	.string "This can’t be used until a new\nBADGE is obtained.$"

	.global gUnknown_0840F0C2
gUnknown_0840F0C2: @ 840F0C2
OtherText_NoMoreThreePoke:
	.string "No more than three POKéMON\nmay enter.$"

	.global gUnknown_0840F0E8
gUnknown_0840F0E8: @ 840F0E8
OtherText_SendRemovedMailPrompt:
	.string "Send the removed MAIL to\nyour PC?$"

	.global gUnknown_0840F10A
gUnknown_0840F10A: @ 840F10A
OtherText_MailWasSent:
	.string "The MAIL was sent to your PC.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F12A
gUnknown_0840F12A: @ 840F12A
OtherText_MailboxIsFull:
	.string "Your PC’s MAILBOX is full.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F147
gUnknown_0840F147: @ 840F147
OtherText_MailRemovedMessageLost:
	.string "If the MAIL is removed, the\nmessage will be lost. Okay?$"

	.global gUnknown_0840F17F
gUnknown_0840F17F: @ 840F17F
OtherText_MailMustBeRemoved:
	.string "MAIL must be removed before\nholding an item.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F1AE
gUnknown_0840F1AE: @ 840F1AE
OtherText_WasGivenToHold:
	.string "{STR_VAR_1} was given the\n{STR_VAR_2} to hold.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F1CD
gUnknown_0840F1CD: @ 840F1CD
OtherText_AlreadyHolding:
	.string "{STR_VAR_1} is already holding\none {STR_VAR_2}.\pWould you like to switch the\ntwo items?$"

	.global gUnknown_0840F213
gUnknown_0840F213: @ 840F213
OtherText_NotHoldingAnything:
	.string "{STR_VAR_1} isn’t\nholding anything.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F230
gUnknown_0840F230: @ 840F230
OtherText_ReceivedTheThingFrom:
	.string "Received the {STR_VAR_2}\nfrom {STR_VAR_1}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F24B
gUnknown_0840F24B: @ 840F24B
OtherText_MailTaken:
	.string "MAIL was taken from the\nPOKéMON.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F26E
gUnknown_0840F26E: @ 840F26E
OtherText_TakenAndReplaced:
	.string "The {STR_VAR_2} was taken and\nreplaced with the {STR_VAR_1}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F29B
gUnknown_0840F29B: @ 840F29B
OtherText_PokeHoldingItemCantMail:
	.string "This POKéMON is holding an item.\nIt cannot hold MAIL.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F2D3
gUnknown_0840F2D3: @ 840F2D3
OtherText_MailTransferredMailbox:
	.string "MAIL was transferred from\nthe MAILBOX.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F2FC
gUnknown_0840F2FC: @ 840F2FC
OtherText_BagFullCannotRemoveItem:
	.string "The BAG is full. The POKéMON’s\nitem could not be removed.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F338
gUnknown_0840F338: @ 840F338
OtherText_LearnedMove:
	.string "{STR_VAR_1} learned\n{STR_VAR_2}!$"

	.global gUnknown_0840F347
gUnknown_0840F347: @ 840F347
OtherText_NotCompatible:
	.string "{STR_VAR_1} and {STR_VAR_2}\nare not compatible.\p{STR_VAR_2} can’t be learned.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F37C
gUnknown_0840F37C: @ 840F37C
OtherText_WantsToLearn:
	.string "{STR_VAR_1} wants to learn the\nmove {STR_VAR_2}.\pHowever, {STR_VAR_1} already\nknows four moves.\pShould a move be deleted and\nreplaced with {STR_VAR_2}?$"

	.global gUnknown_0840F3F0
gUnknown_0840F3F0: @ 840F3F0
OtherText_StopTryingTo:
	.string "Stop trying to teach\n{STR_VAR_2}?$"

	.global gUnknown_0840F409
gUnknown_0840F409: @ 840F409
OtherText_DidNotLearnMove2:
	.string "{STR_VAR_1} did not learn the\nmove {STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F429
gUnknown_0840F429: @ 840F429
OtherText_WhichMoveToForget2:
	.string "Which move should be forgotten?{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F44B
gUnknown_0840F44B: @ 840F44B
OtherText_ForgetMove123_2: @ it might look like its a dupe but one's used in a menu while one's for battle
	.string "{PAUSE 32}1, {PAUSE 15}2, and{PAUSE 15}... {PAUSE 15}... {PAUSE 15}... {PAUSE 15}{PLAY_SE SE_KON}Poof!\p{STR_VAR_1} forgot how to\nuse {STR_VAR_2}.\pAnd...{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F49E
gUnknown_0840F49E: @ 840F49E
OtherText_AlreadyKnows:
	.string "{STR_VAR_1} already knows\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F4B5
gUnknown_0840F4B5: @ 840F4B5
OtherText_HPRestoredBy:
	.string "{STR_VAR_1}’s HP was restored by\n{STR_VAR_2} points.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F4DA
gUnknown_0840F4DA: @ 840F4DA
OtherText_CuredPoisoning:
	.string "{STR_VAR_1} was cured of its\npoisoning.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F4FB
gUnknown_0840F4FB: @ 840F4FB
OtherText_CuredParalysis:
	.string "{STR_VAR_1} was cured of\nparalysis.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F518
gUnknown_0840F518: @ 840F518
OtherText_WokeUp:
	.string "{STR_VAR_1} woke up.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F526
gUnknown_0840F526: @ 840F526
OtherText_BurnHealed:
	.string "{STR_VAR_1}’s burn was healed.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F53E
gUnknown_0840F53E: @ 840F53E
OtherText_ThawedOut:
	.string "{STR_VAR_1} was thawed out.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F553
gUnknown_0840F553: @ 840F553
OtherText_PPRestored:
	.string "PP was restored.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F566
gUnknown_0840F566: @ 840F566
OtherText_RegainedHealth:
	.string "{STR_VAR_1} regained health.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F57C
gUnknown_0840F57C: @ 840F57C
OtherText_BecameHealthy:
	.string "{STR_VAR_1} became healthy.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F591
gUnknown_0840F591: @ 840F591
OtherText_PPIncreased:
	.string "{STR_VAR_1}’s PP increased.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F5A6
gUnknown_0840F5A6: @ 840F5A6
OtherText_ElevatedTo:
	.string "{STR_VAR_1} was elevated to\nLv. {STR_VAR_2}.$"

	.global gUnknown_0840F5C1
gUnknown_0840F5C1: @ 840F5C1
OtherText_WasRaised:
	.string "{STR_VAR_1}’s {STR_VAR_2} was\nraised.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F5D7
gUnknown_0840F5D7: @ 840F5D7
OtherText_SnapConfusion:
	.string "{STR_VAR_1} snapped out of its\nconfusion.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F5FA
gUnknown_0840F5FA: @ 840F5FA
OtherText_GotOverLove:
	.string "{STR_VAR_1} got over its\ninfatuation.{PAUSE_UNTIL_PRESS}$"
OtherText_ChoosePoke:
	.string "Choose a POKéMON.$"
OtherText_MovePokeTo:
	.string "Move to where?$"
OtherText_TeachWhat:
	.string "Teach which POKéMON?$"
OtherText_UseWhat:
	.string "Use on which POKéMON?$"
OtherText_GiveWhat:
	.string "Give to which POKéMON?$"
OtherText_DoWhat:
	.string "Do what with {STR_VAR_1}?$"
OtherText_NothingToCut:
	.string "There’s nothing to CUT.$"
OtherText_CantSurf:
	.string "You can’t SURF here.$"
OtherText_AlreadySurfing:
	.string "You’re already SURFING.$"
OtherText_CantUseThatHere:
	.string "Can’t use that here.$"
OtherText_RestoreWhatMove:
	.string "Restore which move?$"
OtherText_BoostPP:
	.string "Boost PP of which move?$"
OtherText_DoWhatWithItem:
	.string "Do what with an item?$"
OtherText_NoPokeForBattle:
	.string "No POKéMON for battle!$"
OtherText_ChoosePoke2:
	.string "Choose a POKéMON.$"
OtherText_NotEnoughHP:
	.string "Not enough HP...$"
OtherText_ThreePokeNeeded:
	.string "Three POKéMON are needed.$"
OtherText_PokeCantBeSame:
	.string "POKéMON can’t be the same.$"
OtherText_NoIdenticalHoldItems:
	.string "No identical hold items.$"
OtherText_TeachWhichPoke:
	.string "Teach which POKéMON?$"

	.global gUnknown_0840F7C6
gUnknown_0840F7C6: @ 840F7C6
OtherText_Attack:
	.string "ATTACK$"

	.global gUnknown_0840F7CD
gUnknown_0840F7CD: @ 840F7CD
OtherText_Defense:
	.string "DEFENSE$"

	.global gUnknown_0840F7D5
gUnknown_0840F7D5: @ 840F7D5
OtherText_SpAtk:
	.string "SP. ATK$"

	.global gUnknown_0840F7DD
gUnknown_0840F7DD: @ 840F7DD
OtherText_SpDef:
	.string "SP. DEF$"

	.global gUnknown_0840F7E5
gUnknown_0840F7E5: @ 840F7E5
OtherText_Speed:
	.string "SPEED$"

	.global gUnknown_0840F7EB
gUnknown_0840F7EB: @ 840F7EB
OtherText_HP:
	.string "HP$"

	.global gUnknown_0840F7EE
gUnknown_0840F7EE: @ 840F7EE
OtherText_Terminator18:
	.string "$"

	.global gUnknown_0840F7EF
gUnknown_0840F7EF: @ 840F7EF
OtherText_OriginalTrainer:
	.string "OT/$"

	.global gUnknown_0840F7F3
gUnknown_0840F7F3: @ 840F7F3
OtherText_Type2:
	.string "TYPE/$"

	.global gUnknown_0840F7F9
gUnknown_0840F7F9: @ 840F7F9
OtherText_Power2:
	.string "POWER$"

	.global gUnknown_0840F7FF
gUnknown_0840F7FF: @ 840F7FF
OtherText_Accuracy2:
	.string "ACCURACY$"

	.global gUnknown_0840F808
gUnknown_0840F808: @ 840F808
OtherText_Appeal2:
	.string "APPEAL$"

	.global gUnknown_0840F80F
gUnknown_0840F80F: @ 840F80F
OtherText_Jam2:
	.string "JAM$"

	.global gUnknown_0840F813
gUnknown_0840F813: @ 840F813
OtherText_Status:
	.string "STATUS$"

	.global gUnknown_0840F81A
gUnknown_0840F81A: @ 840F81A
OtherText_ExpPoints:
	.string "EXP. POINTS$"

	.global gUnknown_0840F826
gUnknown_0840F826: @ 840F826
OtherText_NextLv:
	.string "NEXT LV.$"

	.global gUnknown_0840F82F
gUnknown_0840F82F: @ 840F82F
OtherText_Ribbons00:
	.string "RIBBONS: 00$"
OtherText_Event:
	.string "EVENT$"
OtherText_Switch:
	.string "SWITCH$"
OtherText_PokeInfo:
	.string "POKéMON INFO$"
OtherText_PokeSkills:
	.string "POKéMON SKILLS$"
OtherText_BattleMoves:
	.string "BATTLE MOVES$"
OtherText_ContestMoves:
	.string "C0NTEST MOVES$" @why the l33t 0, that's stupid
OtherText_Info:
	.string "INFO$"

	.global gUnknown_0840F884
gUnknown_0840F884: @ 840F884
OtherText_EggLong:
	.string "It looks like this EGG will\ntake a long time to hatch.$"

	.global gUnknown_0840F8BB
gUnknown_0840F8BB: @ 840F8BB
OtherText_EggSome:
	.string "What will hatch from this?\nIt will take some time.$"

	.global gUnknown_0840F8EE
gUnknown_0840F8EE: @ 840F8EE
OtherText_EggSoon:
	.string "It moves occasionally.\nIt should hatch soon.$"

	.global gUnknown_0840F91B
gUnknown_0840F91B: @ 840F91B
OtherText_EggAbout:
	.string "It’s making sounds.\nIt’s about to hatch!$"

	.global gUnknown_0840F944
gUnknown_0840F944: @ 840F944
OtherText_CantForgetHMs:
	.string "HM moves can’t be\nforgotten now.$"

	.global gUnknown_0840F965
gUnknown_0840F965: @ 840F965
OtherText_PlayersBase:
	.string "’s BASE$"

	.global gUnknown_0840F96D
gUnknown_0840F96D: @ 840F96D
OtherText_OkayToDeleteFromRegistry:
	.string "Is it okay to delete {STR_VAR_1}\nfrom the REGISTRY?$"

	.global gUnknown_0840F998
gUnknown_0840F998: @ 840F998
OtherText_RegisteredDataDeleted:
	.string "The registered data was deleted.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840F9BB
gUnknown_0840F9BB: @ 840F9BB
SecretBaseText_NoRegistry:
	.string "There is no REGISTRY.{PAUSE_UNTIL_PRESS}$"
SecretBaseText_DelRegist:
	.string "DEL REGIST.$"
SecretBaseText_Decorate:
	.string "DECORATE$"
SecretBaseText_PutAway:
	.string "PUT AWAY$"
SecretBaseText_Toss:
	.string "TOSS$"
SecretBaseText_PutOutDecor:
	.string "Put out the selected decoration item.$"
SecretBaseText_StoreChosenDecor:
	.string "Store the chosen decoration in the PC.$"
SecretBaseText_ThrowAwayDecor:
	.string "Throw away unwanted decorations.$"

	.global gUnknown_0840FA64
gUnknown_0840FA64: @ 840FA64
SecretBaseText_NoDecors:
	.string "There are no decorations.{PAUSE_UNTIL_PRESS}$"
SecretBaseText_Desk:
	.string "DESK$"
SecretBaseText_Chair:
	.string "CHAIR$"
SecretBaseText_Plant:
	.string "PLANT$"
SecretBaseText_Ornament:
	.string "ORNAMENT$"
SecretBaseText_Mat:
	.string "MAT$"
SecretBaseText_Poster:
	.string "POSTER$"
SecretBaseText_Doll:
	.string "DOLL$"
SecretBaseText_Cushion:
	.string "CUSHION$"

	.global gUnknown_0840FAB2
gUnknown_0840FAB2: @ 840FAB2
SecretBaseText_GoldRank:
	.string "GOLD$"

	.global gUnknown_0840FAB7
gUnknown_0840FAB7: @ 840FAB7
SecretBaseText_SilverRank:
	.string "SILVER$"

	.global gUnknown_0840FABE
gUnknown_0840FABE: @ 840FABE
SecretBaseText_PlaceItHere:
	.string "Place it here?$"

	.global gUnknown_0840FACD
gUnknown_0840FACD: @ 840FACD
SecretBaseText_CantBePlacedHere:
	.string "It can’t be placed here.$"

	.global gUnknown_0840FAE6
gUnknown_0840FAE6: @ 840FAE6
SecretBaseText_CancelDecorating:
	.string "Cancel decorating?$"

	.global gUnknown_0840FAF9
gUnknown_0840FAF9: @ 840FAF9
SecretBaseText_InUseAlready:
	.string "This is in use already.$"

	.global gUnknown_0840FB11
gUnknown_0840FB11: @ 840FB11
SecretBaseText_NoMoreDecor:
	.string "No more decorations can be placed.\nThe most that can be placed is {STR_VAR_1}.$"

	.global gUnknown_0840FB57
gUnknown_0840FB57: @ 840FB57
SecretBaseText_NoMoreDecor2:
	.string "No more decorations can be placed.\nThe most that can be placed is {STR_VAR_1}.$"
SecretBaseText_CantBePlacedHere2:
	.string "This can’t be placed here.\nIt must be on a DESK, etc.$"

	.global gUnknown_0840FBD3
gUnknown_0840FBD3: @ 840FBD3
SecretBaseText_DecorCantPlace:
	.string "This decoration can’t be placed in\nyour own room.$"

	.global gUnknown_0840FC05
gUnknown_0840FC05: @ 840FC05
SecretBaseText_DecorInUse:
	.string "This decoration is in use.\nIt can’t be thrown away.$"

	.global gUnknown_0840FC39
gUnknown_0840FC39: @ 840FC39
SecretBaseText_WillBeDiscarded:
	.string "This {STR_VAR_1} will be discarded.\nIs that okay?$"

	.global gUnknown_0840FC62
gUnknown_0840FC62: @ 840FC62
SecretBaseText_DecorThrownAway:
	.string "The decoration item was thrown away.$"

	.global gUnknown_0840FC87
gUnknown_0840FC87: @ 840FC87
SecretBaseText_StopPuttingAwayDecor:
	.string "Stop putting away decorations?$"

	.global gUnknown_0840FCA6
gUnknown_0840FCA6: @ 840FCA6
SecretBaseText_NoDecor:
	.string "There is no decoration item here.$"

	.global gUnknown_0840FCC8
gUnknown_0840FCC8: @ 840FCC8
SecretBaseText_ReturnDecor:
	.string "Return this decoration to the PC?$"

	.global gUnknown_0840FCEA
gUnknown_0840FCEA: @ 840FCEA
SecretBaseText_DecorReturned:
	.string "The decoration was returned to the PC.$"

	.global gUnknown_0840FD11
gUnknown_0840FD11: @ 840FD11
SecretBaseText_NoDecorInUse:
	.string "There are no decorations in use.{PAUSE_UNTIL_PRESS}$"
SecretBaseText_Tristan:
	.string "TRISTAN$"
SecretBaseText_Philip:
	.string "PHILIP$"
SecretBaseText_Dennis:
	.string "DENNIS$"
SecretBaseText_Roberto:
	.string "ROBERTO$"
SecretBaseText_TurnOff:
	.string "TURN OFF$"
SecretBaseText_Decoration:
	.string "DECORATION$"
SecretBaseText_ItemStorage:
	.string "ITEM STORAGE$"

	.global gUnknown_0840FD73
gUnknown_0840FD73: @ 840FD73
PCText_Mailbox:
	.string "MAILBOX$"
PCText_DepositItem:
	.string "DEPOSIT ITEM$"
PCText_WithdrawItem:
	.string "WITHDRAW ITEM$"
PCText_TossItem:
	.string "TOSS ITEM$"
PCText_StoreItems:
	.string "Store items in the PC.$"
PCText_TakeOutItems:
	.string "Take out items from the PC.$"
PCText_ThrowAwayItems:
	.string "Throw away items stored in the PC.$"

	.global gUnknown_0840FDF6
gUnknown_0840FDF6: @ 840FDF6
OtherText_NoItems:
	.string "There are no items.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840FE0C
gUnknown_0840FE0C: @ 840FE0C
OtherText_NoMoreRoom:
	.string "There is no more\nroom in the BAG.$"

	.global gUnknown_0840FE2E
gUnknown_0840FE2E: @ 840FE2E
OtherText_HowManyToWithdraw:
	.string "How many do you\nwant to withdraw?$"

	.global gUnknown_0840FE50
gUnknown_0840FE50: @ 840FE50
OtherText_WithdrewThing:
	.string "Withdrew {STR_VAR_2}\n{STR_VAR_1}(s).$"
OtherText_Read:
	.string "READ$"

	.global gUnknown_0840FE68
gUnknown_0840FE68: @ 840FE68
OtherText_MoveToBag:
	.string "MOVE TO BAG$"
OtherText_Give:
	.string "GIVE$"

	.global gUnknown_0840FE79
gUnknown_0840FE79: @ 840FE79
OtherText_NoMailHere:
	.string "There’s no MAIL here.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840FE91
gUnknown_0840FE91: @ 840FE91
OtherText_WhatWillYouDoMail:
	.string "What would you like to do with\n{STR_VAR_1}’s MAIL?$"

	.global gUnknown_0840FEBB
gUnknown_0840FEBB: @ 840FEBB
OtherText_MessageWillBeLost:
	.string "The message will be lost.\nIs that okay?$"

	.global gUnknown_0840FEE3
gUnknown_0840FEE3: @ 840FEE3
OtherText_BagIsFull:
	.string "The BAG is full.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840FEF6
gUnknown_0840FEF6: @ 840FEF6
OtherText_MailWasReturned:
	.string "The MAIL was returned to the BAG\nwith its message erased.{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0840FF32
gUnknown_0840FF32: @ 840FF32
OtherText_Dad:
	.string "DAD$"

	.global gUnknown_0840FF36
gUnknown_0840FF36: @ 840FF36
OtherText_Mom:
	.string "MOM$"

	.global gUnknown_0840FF3A
gUnknown_0840FF3A: @ 840FF3A
OtherText_Wallace:
	.string "WALLACE$"

	.global gUnknown_0840FF42
gUnknown_0840FF42: @ 840FF42
OtherText_Steven:
	.string "STEVEN$"

	.global gUnknown_0840FF49
gUnknown_0840FF49: @ 840FF49
OtherText_Brawly:
	.string "BRAWLY$"

	.global gUnknown_0840FF50
gUnknown_0840FF50: @ 840FF50
OtherText_Winona:
	.string "WINONA$"

	.global gUnknown_0840FF57
gUnknown_0840FF57: @ 840FF57
OtherText_Phoebe:
	.string "PHOEBE$"

	.global gUnknown_0840FF5E
gUnknown_0840FF5E: @ 840FF5E
OtherText_Glacia:
	.string "GLACIA$"

	.global gUnknown_0840FF65
gUnknown_0840FF65: @ 840FF65
ContestText_ContestWinner:
	.string "CONTEST WINNER\n$"

	.global gUnknown_0840FF75
gUnknown_0840FF75: @ 840FF75
@ come back to this one and clean up
OtherText_Unknown1:
	.string "’s $"
OtherText_Cool:
	.string "COOL $"
OtherText_Beauty2:
	.string "BEAUTY $"
OtherText_Cute:
	.string "CUTE $"
OtherText_Smart:
	.string "SMART $"
OtherText_Tough:
	.string "TOUGH $"
OtherText_NonstopSuperCool:
	.string "Nonstop super-cool -\nthe inestimable $"
OtherText_Terminator6:
	.string "$"
OtherText_GoodLookingPoke:
	.string "Hey, there!\nThe good-looking POKéMON $"
OtherText_Terminator7:
	.string "$"
OtherText_MarvelousGreat:
	.string "The marvelous, wonderful, and\nvery great $"
OtherText_Terminator8:
	.string "$"
OtherText_CenturyLastVenus:
	.string "This century’s last Venus -\nthe beautiful $"
OtherText_Terminator9:
	.string "$"
OtherText_Terminator10:
	.string "$"
OtherText_DazzlingSlime:
	.string "’s dazzling,\nglittering smile$"
OtherText_PokeCenterIdol:
	.string "POKéMON CENTER’s super idol -\nthe incomparable $"
OtherText_Terminator11:
	.string "$"
OtherText_LovelyAndSweet:
	.string "The lovely and sweet $"
OtherText_Terminator12:
	.string "$"
OtherText_ThePretty:
	.string "The pretty $"
OtherText_WinningPortrait:
	.string "’s\nwinning portrait$"
OtherText_GiveUsWink:
	.string "Give us a wink!\nThe cutie POKéMON $"
OtherText_Terminator13:
	.string "$"
OtherText_SmartnessMaestro:
	.string "The smartness maestro -\nThe wise POKéMON $"
OtherText_Terminator14:
	.string "$"
OtherText_ChosenPokeAmong:
	.string "The chosen POKéMON -\nThe one among POKéMON $"
OtherText_Terminator15:
	.string "$"
OtherText_TheExcellent:
	.string "The excellent $"
OtherText_ItsMomentOfElegance:
	.string "’s\nmoment of elegance$"
OtherText_PowerfullyMuscular:
	.string "The powerfully muscular\nspeedster $"
OtherText_Terminator16:
	.string "$"
OtherText_StrongErEst:
	.string "The strong, stronger, and\nstrongest $"
OtherText_Terminator17:
	.string "$"
OtherText_MightyTough:
	.string "The mighty tough\nhyper POKéMON $"
OtherText_Exclamation:
	.string "!$"
OtherText_Petalburg:
	.string "PETALBURG$"
OtherText_Slateport:
	.string "SLATEPORT$"
OtherText_Littleroot:
	.string "LITTLEROOT$"
OtherText_Lilycove:
	.string "LILYCOVE$"
OtherText_Dewford:
	.string "DEWFORD$"
OtherText_Enter:
	.string "ENTER$"
OtherText_Info3:
	.string "INFO$"
OtherText_WhatsAContest:
	.string "What’s a CONTEST?$"
OtherText_TypesOfContest:
	.string "Types of CONTESTS$"
OtherText_Ranks:
	.string "Ranks$"
OtherText_Judging:
	.string "Judging$"
OtherText_CoolContest:
	.string "COOL CONTEST$"
OtherText_BeautyContest:
	.string "BEAUTY CONTEST$"
OtherText_CuteContest:
	.string "CUTE CONTEST$"
OtherText_SmartContest:
	.string "SMART CONTEST$"
OtherText_ToughContest:
	.string "TOUGH CONTEST$"
OtherText_Decoration:
	.string "DECORATION$"
OtherText_PackUp:
	.string "PACK UP$"
OtherText_Count:
	.string "COUNT$"
OtherText_Registry:
	.string "REGISTRY$"
OtherText_Information:
	.string "INFORMATION$"
OtherText_Mach:
	.string "MACH$"
OtherText_Acro:
	.string "ACRO$"
OtherText_Poison:
	.string "PSN$"
OtherText_Paralysis:
	.string "PAR$"
OtherText_Sleep:
	.string "SLP$"
OtherText_Burn:
	.string "BRN$"
OtherText_Frozen:
	.string "FRZ$"
OtherText_Quit:
	.string "QUIT$"
OtherText_SawIt:
	.string "Saw it$"
OtherText_NotYet:
	.string "Not yet$"
OtherText_Yes:
	.string "YES$"
OtherText_No:
	.string "NO$"
OtherText_Info2:
	.string "INFO$"
OtherText_SingleBattle:
	.string "SINGLE BATTLE$"
OtherText_DoubleBattle:
	.string "DOUBLE BATTLE$"
OtherText_MultiBattle:
	.string "MULTI BATTLE$"
OtherText_MrBriney:
	.string "MR. BRINEY$"
OtherText_MakeAChallenge:
	.string "Make a challenge.$"
OtherText_ObtainInformation:
	.string "Obtain information.$"
OtherText_Lv50_2:
	.string "LV. 50$"
OtherText_Lv100_2:
	.string "LV. 100$"
OtherText_Zigzagoon:
	.string "ZIGZAGOON$"
OtherText_Nincada:
	.string "NINCADA$"
OtherText_Poochyena:
	.string "POOCHYENA$"
OtherText_Nincada2:
	.string "NINCADA$"
OtherText_Lotad:
	.string "LOTAD$"
OtherText_Roselia:
	.string "ROSELIA$"
OtherText_Shroomish:
	.string "SHROOMISH$"
OtherText_Nincada3:
	.string "NINCADA$"
OtherText_Surskit:
	.string "SURSKIT$"
OtherText_Treecko:
	.string "TREECKO$"
OtherText_Torchic:
	.string "TORCHIC$"
OtherText_Mudkip:
	.string "MUDKIP$"
OtherText_Seedot:
	.string "SEEDOT$"
OtherText_Shroomish2:
	.string "SHROOMISH$"
OtherText_Spinda:
	.string "SPINDA$"
OtherText_Shroomish3:
	.string "SHROOMISH$"
OtherText_Zigzagoon2:
	.string "ZIGZAGOON$"
OtherText_Wurmple:
	.string "WURMPLE$"
OtherText_PokeBall:
	.string "POKé BALL$"
OtherText_SuperPotion:
	.string "SUPER POTION$"
OtherText_SamePrice:
	.string "Same price$"
OtherText_Yen135:
	.string "¥135$"
OtherText_Yen155:
	.string "¥155$"
OtherText_Yen175:
	.string "¥175$"
OtherText_CostMore:
	.string "They will cost more.$"
OtherText_CostLess:
	.string "They will cost less.$"
OtherText_SamePrice2:
	.string "Same price$"
OtherText_MaleSymbol:
	.string "♂$"
OtherText_FemaleSymbol:
	.string "♀$"
OtherText_Neither:
	.string "Neither$"
OtherText_Males:
	.string "Males$"
OtherText_Females:
	.string "Females$"
OtherText_SameNumber:
	.string "Same number$"
OtherText_Male:
	.string "Male$"
OtherText_Female:
	.string "Female$"
OtherText_ItDepends:
	.string "It depends$"
OtherText_Six2:
	.string "6$"
OtherText_Eight2:
	.string "8$"
OtherText_Ten:
	.string "10$"
OtherText_One:
	.string "1$"
OtherText_Two:
	.string "2$"
OtherText_Three:
	.string "3$"
OtherText_Six:
	.string "6$"
OtherText_Seven:
	.string "7$"
OtherText_Eight:
	.string "8$"
OtherText_FreshWater:
	.string "FRESH WATER{CLEAR_TO 0x48}¥200$"
OtherText_SodaPop:
	.string "SODA POP{CLEAR_TO 0x48}¥300$"
OtherText_Lemonade:
	.string "LEMONADE{CLEAR_TO 0x48}¥350$"
OtherText_HowToRide:
	.string "HOW TO RIDE$"
OtherText_HowToTurn:
	.string "HOW TO TURN$"
OtherText_SandySlopes:
	.string "SANDY SLOPES$"
OtherText_Wheelies:
	.string "WHEELIES$"
OtherText_BunnyHops:
	.string "BUNNY-HOPS$"
OtherText_Jumping:
	.string "JUMPING$"
OtherText_Satisfied:
	.string "Satisfied$"
OtherText_Dissatisfied:
	.string "Dissatisfied$"
OtherText_Deepseatooth:
	.string "DEEPSEATOOTH$"
OtherText_Deepseascale:
	.string "DEEPSEASCALE$"
OtherText_BlueFlute2:
	.string "BLUE FLUTE$"
OtherText_YellowFlute2:
	.string "YELLOW FLUTE$"
OtherText_RedFlute2:
	.string "RED FLUTE$"
OtherText_WhiteFlute2:
	.string "WHITE FLUTE$"
OtherText_BlackFlute2:
	.string "BLACK FLUTE$"
OtherText_GlassChair:
	.string "GLASS CHAIR$"
OtherText_GlassDesk:
	.string "GLASS DESK$"
OtherText_TreeckoDoll:
	.string "TREECKO DOLL 1,000 COINS$"
OtherText_TorchicDoll:
	.string "TORCHIC DOLL 1,000 COINS$"
OtherText_MudkipDoll:
	.string "MUDKIP DOLL   1,000 COINS$"
OtherText_50Coins:
	.string "  50 COINS    ¥1,000$"
OtherText_500Coins:
	.string "500 COINS  ¥10,000$"
OtherText_Excellent:
	.string "Excellent!$"
OtherText_NotSoHot:
	.string "Not so hot$"
OtherText_RedShard:
	.string "RED SHARD$"
OtherText_YellowShard:
	.string "YELLOW SHARD$"
OtherText_BlueShard:
	.string "BLUE SHARD$"
OtherText_GreenShard:
	.string "GREEN SHARD$"
OtherText_BattleTower:
	.string "BATTLE TOWER$"
OtherText_Right:
	.string "Right$"
OtherText_Left:
	.string "Left$"
OtherText_TM32:
	.string "TM32  1,500 COINS$"
OtherText_TM29:
	.string "TM29  3,500 COINS$"
OtherText_TM35:
	.string "TM35  4,000 COINS$"
OtherText_TM24:
	.string "TM24  4,000 COINS$"
OtherText_TM13:
	.string "TM13  4,000 COINS$"
OtherText_1F_2:
	.string "1F$"
OtherText_2F_2:
	.string "2F$"
OtherText_3F_2:
	.string "3F$"
OtherText_4F_2:
	.string "4F$"
OtherText_5F_2:
	.string "5F$"
OtherText_Cool2:
	.string "COOL$"
OtherText_Beauty3:
	.string "BEAUTY$"
OtherText_Cute2:
	.string "CUTE$"
OtherText_Smart2:
	.string "SMART$"
OtherText_Tough2:
	.string "TOUGH$"
OtherText_Normal:
	.string "NORMAL$"
OtherText_Super:
	.string "SUPER$"
OtherText_Hyper:
	.string "HYPER$"
OtherText_Master:
	.string "MASTER$"
OtherText_Cool3:
	.string "COOL$"
OtherText_Beauty4:
	.string "BEAUTY$"
OtherText_Cute3:
	.string "CUTE$"
OtherText_Smart3:
	.string "SMART$"
OtherText_Tough3:
	.string "TOUGH$"
OtherText_Items:
	.string "ITEMS$"
OtherText_KeyItems:
	.string "KEY ITEMS$"
OtherText_Balls:
	.string "BALLS$"
OtherText_TMsHMs:
	.string "TMs & HMs$"
OtherText_Berries:
	.string "BERRIES$"

	.global gUnknown_08410753
gUnknown_08410753: @ 8410753
PCText_SomeonesPC:
	.string "SOMEONE’S PC$"

	.global gUnknown_08410760
gUnknown_08410760: @ 8410760
PCText_LanettesPC:
	.string "LANETTE’S PC$"

	.global gUnknown_0841076D
gUnknown_0841076D: @ 841076D
PCText_PlayersPC:
	.string "{PLAYER}’s PC$"

	.global gUnknown_08410775
gUnknown_08410775: @ 8410775
PCText_HallOfFame:
	.string "HALL OF FAME$"

	.global gUnknown_08410782
gUnknown_08410782: @ 8410782
PCText_LogOff:
	.string "LOG OFF$"

	.global gUnknown_0841078A
gUnknown_0841078A: @ 841078A
OtherText_99Times:
	.string "99 times +$"

	.global gUnknown_08410795
gUnknown_08410795: @ 8410795
OtherText_1Minute:
	.string "1 minute +$"

	.global gUnknown_084107A0
gUnknown_084107A0: @ 84107A0
OtherText_Seconds:
	.string " seconds$"

	.global gUnknown_084107A9
gUnknown_084107A9: @ 84107A9
OtherText_Times:
	.string " times$"
OtherText_Period2:
	.string ".$"

	.global gUnknown_084107B2
gUnknown_084107B2: @ 84107B2
OtherText_BigGuy:
	.string "Big guy$"

	.global gUnknown_084107BA
gUnknown_084107BA: @ 84107BA
OtherText_BigGirl:
	.string "Big girl$"

	.global gUnknown_084107C3
gUnknown_084107C3: @ 84107C3
OtherText_Son:
	.string "son$"

	.global gUnknown_084107C7
gUnknown_084107C7: @ 84107C7
OtherText_Daughter:
	.string "daughter$"
OtherText_BlueFlute:
	.string "BLUE FLUTE$"
OtherText_YellowFlute:
	.string "YELLOW FLUTE$"
OtherText_RedFlute:
	.string "RED FLUTE$"
OtherText_WhiteFlute:
	.string "WHITE FLUTE$"
OtherText_BlackFlute:
	.string "BLACK FLUTE$"
OtherText_PrettyChair:
	.string "PRETTY CHAIR$"
OtherText_PrettyDesk:
	.string "PRETTY DESK$"
OtherText_1F:
	.string "1F$"
OtherText_2F:
	.string "2F$"
OtherText_3F:
	.string "3F$"
OtherText_4F:
	.string "4F$"
OtherText_5F:
	.string "5F$"
OtherText_6F:
	.string "6F$"
OtherText_7F:
	.string "7F$"
OtherText_8F:
	.string "8F$"
OtherText_9F:
	.string "9F$"
OtherText_10F:
	.string "10F$"
OtherText_11F:
	.string "11F$"
OtherText_B1F:
	.string "B1F$"
OtherText_B2F:
	.string "B2F$"
OtherText_B3F:
	.string "B3F$"
OtherText_B4F:
	.string "B4F$"
OtherText_Rooftop:
	.string "ROOFTOP$"

	.global gUnknown_0841085E
gUnknown_0841085E: @ 841085E
OtherText_NowOn:
	.string "Now on:$"

	.global gUnknown_08410866
gUnknown_08410866: @ 8410866
PCText_Cancel:
	.string "CANCEL$"
PCText_ExitBox:
	.string "Exit from the BOX.$"
PCText_WhatYouDo:
	.string "What would you like to do?$"
PCText_PickATheme:
	.string "Please pick a theme.$"
PCText_PickAWallpaper:
	.string "Please pick out wallpaper.$"
PCText_IsSelected:
	.string " is selected.$"
PCText_JumpToBox:
	.string "Jump to which BOX?$"
PCText_DepositToWhichBox:
	.string "Deposit in which BOX?$"
PCText_DepoxitToBox:
	.string " was deposited.$"
PCText_BoxIsFull:
	.string "The BOX is full.$"
PCText_ReleasePoke:
	.string "Release this POKéMON?$"
PCText_WasReleased:
	.string " was released.$"
PCText_ByeBye:
	.string "Bye-bye, !$"
PCText_MarkPoke:
	.string "Mark your POKéMON.$"
PCText_LastPoke:
	.string "That’s your last POKéMON!$"
PCText_PartyFull:
	.string "Your party’s full!$"
PCText_HoldingPoke:
	.string "You’re holding a POKéMON!$"
PCText_WhichOneWillTake:
	.string "Which one will you take?$"
PCText_CantReleaseEgg:
	.string "You can’t release an EGG.$"
PCText_ContinueBox:
	.string "Continue BOX operations?$"
PCText_CameBack:
	.string " came back!$"
PCText_Worried:
	.string "Was it worried about you?$"
PCText_Surprise:
	.string "... ... ... ... ...!$"
PCText_PleaseRemoveMail:
	.string "Please remove the MAIL.$"
PCText_Cancel2:
	.string "CANCEL$"
PCText_Deposit:
	.string "DEPOSIT$"
PCText_Withdraw:
	.string "WITHDRAW$"
PCText_Switch:
	.string "SWITCH$"
PCText_Move:
	.string "MOVE$"
PCText_Place:
	.string "PLACE$"
PCText_Summary:
	.string "SUMMARY$"
PCText_Release:
	.string "RELEASE$"
PCText_Mark:
	.string "MARK$"
PCText_Name:
	.string "NAME$"
PCText_Jump:
	.string "JUMP$"
PCText_Wallpaper:
	.string "WALLPAPER$"
PCText_Scenery1:
	.string "SCENERY 1$"
PCText_Scenery2:
	.string "SCENERY 2$"
PCText_Scenery3:
	.string "SCENERY 3$"
PCText_Etc:
	.string "ETCETERA$"
PCText_Forest:
	.string "FOREST$"
PCText_City:
	.string "CITY$"
PCText_Desert:
	.string "DESERT$"
PCText_Savanna:
	.string "SAVANNA$"
PCText_Crag:
	.string "CRAG$"
PCText_Volcano:
	.string "VOLCANO$"
PCText_Snow:
	.string "SNOW$"
PCText_Cave:
	.string "CAVE$"
PCText_Beach:
	.string "BEACH$"
PCText_Seafloor:
	.string "SEAFLOOR$"
PCText_River:
	.string "RIVER$"
PCText_Sky:
	.string "SKY$"
PCText_Polka:
	.string "POLKA-DOT$"
PCText_PokeCenter:
	.string "POKéCENTER$"
PCText_Machine:
	.string "MACHINE$"
PCText_Plain:
	.string "PLAIN$"
PCText_WhatDoYouWant:
	.string "What do you want?$"
PCText_WithdrawPoke:
	.string "WITHDRAW POKéMON$"
PCText_DepositPoke:
	.string "DEPOSIT POKéMON$"
PCText_MovePoke:
	.string "MOVE POKéMON$"
PCText_SeeYa:
	.string "SEE YA!$"
PCText_MovePokeToBox:
	.string "Move POKéMON stored in BOXES to\nyour party.$"
PCText_StorePokeToBox:
	.string "Store POKéMON in your party in BOXES.$"
PCText_OrganizePokeBox:
	.string "Organize the POKéMON in BOXES and\nin your party.$"
PCText_ReturnToMenu:
	.string "Return to the previous menu.$"

	.global gUnknown_08410C1C
gUnknown_08410C1C: @ 8410C1C
PCText_OnlyOne:
	.string "There is just one POKéMON with you.$"

	.global gUnknown_08410C40
gUnknown_08410C40: @ 8410C40
PCText_PartyFull2:
	.string "Your party is full!$"

	.global gUnknown_08410C54
gUnknown_08410C54: @ 8410C54
PCText_BOX:
	.string "BOX$"
PCText_CheckMap:
	.string "{CLEAR 0}Check the map of the HOENN region.$"
PCText_CheckPoke:
	.string "{CLEAR 0}Check POKéMON in detail.$"
PCText_CheckTrainer:
	.string "{CLEAR 0}Check TRAINER information.$"
PCText_CheckRibbons:
	.string "{CLEAR 0}Check obtained RIBBONS.$"
PCText_PutAwayNav:
	.string "{CLEAR 0}Put away the POKéNAV.$"
PCText_NoRibbonWin:
	.string "{CLEAR 0}There are no RIBBON winners.$"
PCText_NoTrainers:
	.string "{CLEAR 0}No TRAINERS are registered.$"
PCText_CheckParty:
	.string "{CLEAR 0}Check party POKéMON in detail.$"
PCText_CheckPokeAll:
	.string "{CLEAR 0}Check all POKéMON in detail.$"
PCText_ReturnToNav:
	.string "{CLEAR 0}Return to the POKéNAV menu.$"
PCText_FindCool:
	.string "{CLEAR 0}Find cool POKéMON.$"
PCText_FindBeauty:
	.string "{CLEAR 0}Find beautiful POKéMON.$"
PCText_FindCute:
	.string "{CLEAR 0}Find cute POKéMON.$"
PCText_FindSmart:
	.string "{CLEAR 0}Find smart POKéMON.$"
PCText_FindTough:
	.string "{CLEAR 0}Find tough POKéMON.$"
PCText_ReturnToCondition:
	.string "{CLEAR 0}Return to the CONDITION menu.$"

	.global gUnknown_08410E22
gUnknown_08410E22: @ 8410E22
OtherText_NumberRegistered:
	.string "No. registered$"

	.global gUnknown_08410E31
gUnknown_08410E31: @ 8410E31
OtherText_NumberBattles:
	.string "No. of battles$"

	.global gUnknown_08410E40
gUnknown_08410E40: @ 8410E40
OtherText_Strategy:
	.string "{PALETTE 5}STRATEGY$"

	.global gUnknown_08410E4C
gUnknown_08410E4C: @ 8410E4C
OtherText_TrainersPokemon:
	.string "{PALETTE 5}TRAINER’S POKéMON$"

	.global gUnknown_08410E61
gUnknown_08410E61: @ 8410E61
OtherText_SelfIntroduction:
	.string "{PALETTE 5}SELF-INTRODUCTION$"

	.global gUnknown_08410E76
gUnknown_08410E76: @ 8410E76
OtherText_Nature2:
	.string "NATURE/$"

	.global gUnknown_08410E7E
gUnknown_08410E7E: @ 8410E7E
OtherText_InParty:
	.string "IN PARTY$"

	.global gUnknown_08410E87
gUnknown_08410E87: @ 8410E87
OtherText_Number:
	.string "No. $"

	.global gUnknown_08410E8C
gUnknown_08410E8C: @ 8410E8C
OtherText_Ribbons:
	.string "RIBBONS$"
OtherText_MakeProfilePage1:
	.string "Make your profile by combining$"
OtherText_MakeProfilePage2:
	.string "four words or phrases.$"
OtherText_MakeMessagePage1:
	.string "Make a message with 6 phrases.$"
OtherText_MakeMessagePage2:
	.string "Max. two 12-letter phrases/line.$"
OtherText_DescribeFeelingsPage1:
	.string "Find words that describe your$"
OtherText_DescribeFeelingsPage2:
	.string "feelings right now.$"
OtherText_WithFourPhrases:
	.string "With four phrases,$"
OtherText_CombineNinePhrasesPage1:
	.string "Combine nine phrases and$"
OtherText_CombineNinePhrasesPage2:
	.string "make a message.$"
OtherText_ImproveBardSongPage1:
	.string "Change just one word or phrase$"
OtherText_ImproveBardSongPage2:
	.string "and improve the BARD’s song.$"
OtherText_YourProfile:
	.string "Your profile $"
OtherText_YourFeelingBattle:
	.string "Your feeling at the battle’s start$"
OtherText_SetWinMessage:
	.string "What you say if you win a battle$"
OtherText_SetLossMessage:
	.string "What you say if you lose a battle$"
OtherText_TheAnswer:
	.string "The answer$"
OtherText_MailMessage:
	.string "The MAIL message$"
OtherText_MailSalutation:
	.string "The MAIL salutation$"
OtherText_NewSong:
	.string "The new song$"
OtherText_CombineTwoPhrasesPage1:
	.string "Combine two phrases and$"
OtherText_CombineTwoPhrasesPage2:
	.string "make a trendy saying.$"
OtherText_ConfirmTrendyPage1:
	.string "The trendy saying$"
OtherText_ConfirmTrendyPage2:
	.string "is as shown. Okay?$"
OtherText_HipsterPage1:
	.string "I’ll combine two phrases and$"
OtherText_HipsterPage2:
	.string "teach you a good saying.$"

	.global gUnknown_084110EE
gUnknown_084110EE: @ 84110EE
OtherText_TextDeletedConfirmPage1:
	.string "All the text being edited will$"

	.global gUnknown_0841110D
gUnknown_0841110D: @ 841110D
OtherText_TextDeletedConfirmPage2:
	.string "be deleted. Is that okay?$"

	.global gUnknown_08411127
gUnknown_08411127: @ 8411127
OtherText_QuitEditing:
	.string "Quit editing?$"

	.global gUnknown_08411135
gUnknown_08411135: @ 8411135
OtherText_EditedTextNoSavePage1:
	.string "The edited text will not be saved.$"

	.global gUnknown_08411158
gUnknown_08411158: @ 8411158
OtherText_EditedTextNoSavePage2:
	.string "Is that okay?$"

	.global gUnknown_08411166
gUnknown_08411166: @ 8411166
OtherText_EnterAPhraseOrWord:
	.string "Please enter a phrase or word.$"

	.global gUnknown_08411185
gUnknown_08411185: @ 8411185
OtherText_TextNoDelete:
	.string "The entire text can’t be deleted.$"

	.global gUnknown_084111A7
gUnknown_084111A7: @ 84111A7
OtherText_OnlyOnePhrase:
	.string "Only one phrase may be changed.$"

	.global gUnknown_084111C7
gUnknown_084111C7: @ 84111C7
OtherText_OriginalSongRestored:
	.string "The original song will be restored.$"

	.global gUnknown_084111EB
gUnknown_084111EB: @ 84111EB
OtherText_TrendyAlready:
	.string "That’s trendy already!$"

	.global gUnknown_08411202
gUnknown_08411202: @ 8411202
OtherText_CombineTwoPhrases:
	.string "Combine two words or phrases.$"

	.global gUnknown_08411220
gUnknown_08411220: @ 8411220
OtherText_QuitGivingInfo:
	.string "Quit giving information?$"

	.global gUnknown_08411239
gUnknown_08411239: @ 8411239
OtherText_StopGivingMail:
	.string "Stop giving the POKéMON MAIL?$"

	.global gUnknown_08411257
gUnknown_08411257: @ 8411257
OtherText_Profile:
	.string "PROFILE$"

	.global gUnknown_0841125F
gUnknown_0841125F: @ 841125F
OtherText_AtBattleStart:
	.string "At the battle’s start.$"

	.global gUnknown_08411276
gUnknown_08411276: @ 8411276
OtherText_UponWinningBattle:
	.string "Upon winning a battle.$"

	.global gUnknown_0841128D
gUnknown_0841128D: @ 841128D
OtherText_UponLosingBattle:
	.string "Upon losing a battle.$"

	.global gUnknown_084112A3
gUnknown_084112A3: @ 84112A3
OtherText_TheBardsSong:
	.string "The BARD’s Song$"

	.global gUnknown_084112B3
gUnknown_084112B3: @ 84112B3
OtherText_WhatsHipHappening:
	.string "What’s hip and happening?$"

	.global gUnknown_084112CD
gUnknown_084112CD: @ 84112CD
OtherText_Interview:
	.string "Interview$"

	.global gUnknown_084112D7
gUnknown_084112D7: @ 84112D7
OtherText_GoodSaying:
	.string "Good saying$"
OtherText_SoPretty:
	.string " so pretty!$"
OtherText_SoDarling:
	.string " so darling!$"
OtherText_SoRelaxed:
	.string " so relaxed!$"
OtherText_SoSunny:
	.string " so sunny!$"
OtherText_SoDesirable:
	.string " so desirable!$"
OtherText_SoExciting:
	.string " so exciting!$"
OtherText_SoAmusing:
	.string " so amusing!$"
OtherText_SoMagical:
	.string " so magical!$"

	.global gUnknown_0841134B
gUnknown_0841134B: @ 841134B
OtherText_Is:
	.string " is$"

	.global gUnknown_0841134F
gUnknown_0841134F: @ 841134F
OtherText_DontYouAgree:
	.string "\nDon’t you agree?$"
OtherText_WantVacationNicePlace:
	.string "I so want to go on a vacation.\nWould you happen to know a nice place?$"
OtherText_BoughtCrayonsIsNice:
	.string "I bought crayons with 120 colors!\nDon’t you think that’s nice?$"
OtherText_IfWeCouldFloat:
	.string "Wouldn’t it be nice if we could float\naway on a cloud of bubbles?$"
OtherText_SandWashesAwayMakeSad:
	.string "When you write on a sandy beach,\nthey wash away. It makes me sad.$"
OtherText_WhatsBottomSeaLike:
	.string "What’s the bottom of the sea like?\nJust once I would so love to go!$"
OtherText_SeeSettingSun:
	.string "When you see the setting sun, does it\nmake you want to go home?$"
OtherText_LyingInGreenGrass:
	.string "Lying back in the green grass...\nOh, it’s so, so nice!$"
OtherText_SecretBasesWonderful:
	.string "SECRET BASES are so wonderful!\nCan’t you feel the excitement?$"
OtherText_PokeLeague:
	.string "POKéMON LEAGUE$"
OtherText_PokeCenter:
	.string "POKéMON CENTER$"

	.global gUnknown_08411581
gUnknown_08411581: @ 8411581
OtherText_GetAPokeBlock:
	.string " gets a {POKEBLOCK}?$"
OtherText_Coolness:
	.string "Coolness $"
OtherText_Beauty:
	.string "Beauty $"
OtherText_Cuteness:
	.string "Cuteness $"
OtherText_Smartness:
	.string "Smartness $"
OtherText_Toughness:
	.string "Toughness $"

	.global gUnknown_084115C2
gUnknown_084115C2: @ 84115C2
SystemText_WasEnhanced:
	.string "was enhanced!$"

	.global gUnknown_084115D0
gUnknown_084115D0: @ 84115D0
SystemText_NothingChanged:
	.string "Nothing changed!$"

	.global gUnknown_084115E1
gUnknown_084115E1: @ 84115E1
OtherText_WontEat:
	.string "It won’t eat anymore...$"

	.global gUnknown_084115F9
gUnknown_084115F9: @ 84115F9
SystemText_SaveFailedBackupCheck:
	.string "Save failed.\nChecking the backup memory...\nPlease wait.\n{COLOR RED}“Time required: 1 minute”$"

	.global gUnknown_0841164E
gUnknown_0841164E: @ 841164E
SystemText_BackupDamagedGameContinue:
	.string "The backup memory is damaged or\nthe internal battery has run dry.\nThe game can be played. However,\nprogress cannot be saved.$"

	.global gUnknown_084116CB
gUnknown_084116CB: @ 84116CB
SystemText_GameplayEnded:
	.string "{COLOR RED}“Gameplay cannot be continued.\nReturning to the title screen...”$"

	.global gUnknown_0841170F
gUnknown_0841170F: @ 841170F
SystemText_CheckCompleteSaveAttempt:
	.string "Check completed.\nAttempting to save again.\nPlease wait.$"

	.global gUnknown_08411747
gUnknown_08411747: @ 8411747
SystemText_SaveCompletedGameEnd:
	.string "Save completed.\n{COLOR RED}“Gameplay cannot be continued.\nReturning to the title screen.”$"

	.global gUnknown_08411799
gUnknown_08411799: @ 8411799
SystemText_SaveCompletedPressA:
	.string "Save completed.\n{COLOR RED}“Please press the A Button.”$"

	.global gUnknown_084117C9
gUnknown_084117C9: @ 84117C9
OtherText_Ferry:
	.string "FERRY$"

	.global gUnknown_084117CF
gUnknown_084117CF: @ 84117CF
OtherText_SecretBase:
	.string "SECRET BASE$"

	.global gUnknown_084117DB
gUnknown_084117DB: @ 84117DB
OtherText_Hideout:
	.string "HIDEOUT$"

	.global gUnknown_084117E3
gUnknown_084117E3: @ 84117E3
SystemText_ResetRTCPrompt:
	.string "Reset RTC?\nA: Confirm, B: Cancel$"

	.global gUnknown_08411804
gUnknown_08411804: @ 8411804
SystemText_PresentTime:
	.string "Present time in game$"

	.global gUnknown_08411819
gUnknown_08411819: @ 8411819
SystemText_PreviousTime:
	.string "Previous time in game$"

	.global gUnknown_0841182F
gUnknown_0841182F: @ 841182F
SystemText_PleaseResetTime:
	.string "Please reset the time.$"

	.global gUnknown_08411846
gUnknown_08411846: @ 8411846
SystemText_ClockResetDataSave:
	.string "The clock has been reset.\nData will be saved. Please wait.$"

	.global gUnknown_08411881
gUnknown_08411881: @ 8411881
SystemText_SaveCompleted:
	.string "Save completed.$"

	.global gUnknown_08411891
gUnknown_08411891: @ 8411891
SystemText_SaveFailed:
	.string "Save failed...$"

	.global gUnknown_084118A0
gUnknown_084118A0: @ 84118A0
SystemText_NoSaveFileNoTime:
	.string "There is no save file, so the time\ncan’t be set.$"

	.global gUnknown_084118D1
gUnknown_084118D1: @ 84118D1
SystemText_ClockAdjustmentUsable:
	.string "The in-game clock adjustment system\nis now useable.$"

	.global gUnknown_08411905
gUnknown_08411905: @ 8411905
SystemText_Saving:
    .string "SAVING...\nDON’T TURN OFF THE POWER.$"

    .align 2
    .global gUnknown_0841192C
gUnknown_0841192C: @ 841192C
	.4byte ContestStatsText_VerySoft
	.4byte ContestStatsText_Soft
	.4byte ContestStatsText_Hard
	.4byte ContestStatsText_VeryHard
	.4byte ContestStatsText_SuperHard

	.global gUnknown_08411940
gUnknown_08411940: @ 8411940
	.incbin "baserom.gba", 0x00411940, 0x8

	.global gUnknown_08411948
gUnknown_08411948: @ 8411948
	.incbin "baserom.gba", 0x00411948, 0x18

	.global gUnknown_08411960
gUnknown_08411960: @ 8411960
	.incbin "baserom.gba", 0x00411960, 0x20

	.global gUnknown_08411980
gUnknown_08411980: @ 8411980
	.incbin "baserom.gba", 0x00411980, 0x90

	.global gUnknown_08411A10
gUnknown_08411A10: @ 8411A10
	.incbin "baserom.gba", 0x00411a10, 0x32

	.global gUnknown_08411A42
gUnknown_08411A42: @ 8411A42
Unknown_8411A42:
	.incbin "baserom.gba", 0x00411A42, 0x44e
Unknown_8411E90:
	.incbin "baserom.gba", 0x00411E90, 0x10
Unknown_8411EA0:
	.incbin "baserom.gba", 0x00411EA0, 0x20
Unknown_8411EC0:
	.incbin "baserom.gba", 0x00411EC0, 0x28
Unknown_8411EE8:
	.incbin "baserom.gba", 0x00411EE8, 0x20
Unknown_8411F08:
	.incbin "baserom.gba", 0x00411F08, 0x28
Unknown_8411F30:
	.incbin "baserom.gba", 0x00411F30, 0x20
Unknown_8411F50:
	.incbin "baserom.gba", 0x00411F50, 0x28
Unknown_8411F78:
	.incbin "baserom.gba", 0x00411F78, 0x20
Unknown_8411F98:
	.incbin "baserom.gba", 0x00411F98, 0x28
Unknown_8411FC0:
	.incbin "baserom.gba", 0x00411FC0, 0x20
Unknown_8411FE0:
	.incbin "baserom.gba", 0x00411FE0, 0x28
Unknown_8412008:
	.incbin "baserom.gba", 0x00412008, 0x20
Unknown_8412028:
	.incbin "baserom.gba", 0x00412028, 0x28

	.align 2
	.global gUnknown_08412050
gUnknown_08412050: @ 8412050
	.4byte Unknown_8411E90
	.4byte Unknown_8411EA0
	.4byte Unknown_8411EE8
	.4byte Unknown_8411F30
	.4byte Unknown_8411F78
	.4byte Unknown_8411FC0
	.4byte Unknown_8412008
	.4byte Unknown_8411E90
	.4byte Unknown_8411E90
	.4byte Unknown_8411E90
	.4byte Unknown_8411E90
	.4byte Unknown_8411EC0
	.4byte Unknown_8411F08
	.4byte Unknown_8411F50
	.4byte Unknown_8411F98
	.4byte Unknown_8411FE0
	.4byte Unknown_8412028
	.4byte Unknown_8411E90
	.4byte Unknown_8411E90
	.4byte Unknown_8411E90
	.4byte Unknown_8411E90

	.align 2
	.global gUnknown_084120A4
gUnknown_084120A4: @ 84120A4
Unknown_84120A4:
	.4byte 0x08e781e4
	.4byte 0x08e781f8
	.4byte 0x08e7820c
	.4byte 0x08e78220
	.4byte 0x08e78234
	.4byte 0x08e78248
	.4byte 0x08e7825c
	.4byte 0x08e78270
	.4byte 0x08e78284
	.4byte 0x08e78298
	.4byte 0x08e782ac
	.4byte 0x08e782c0
	.4byte 0x08e782d4
	.4byte 0x08e782e8
Unknown_84120DC:
	.incbin "baserom.gba", 0x004120dc, 0x10

	.align 2
	.global gUnknown_084120EC
gUnknown_084120EC: @ 84120EC
Unknown_8412EC:
	.4byte Unknown_84120DC
Unknown_84120F0:
	.incbin "baserom.gba", 0x004120f0, 0xb0

	.align 2
	.global gUnknown_084121A0
gUnknown_084121A0: @ 84121A0
	.4byte Unknown_84120DC

	.align 2
	.global gUnknown_084121A4
gUnknown_084121A4: @ 84121A4
	.4byte Unknown_84120F0

	.global gUnknown_084121A8
gUnknown_084121A8: @ 84121A8
	.incbin "baserom.gba", 0x004121a8, 0x34

	.global gUnknown_084121DC
gUnknown_084121DC: @ 84121DC
	obj_tiles 0x08e781c8, 32, 0x39e2

	.global gUnknown_084121E4
gUnknown_084121E4: @ 84121E4
	.incbin "baserom.gba", 0x004121e4, 0x18

	.global gUnknown_084121FC
gUnknown_084121FC: @ 84121FC
	.incbin "graphics/intro/intro2_grass.gbapal"

	.global gUnknown_0841221C
gUnknown_0841221C: @ 841221C
	.incbin "baserom.gba", 0x0041221c, 0x20

	.global gUnknown_0841223C
gUnknown_0841223C: @ 841223C
	.incbin "baserom.gba", 0x0041223c, 0x20

	.global gUnknown_0841225C
gUnknown_0841225C: @ 841225C
	.incbin "graphics/intro/intro2_grass.4bpp.lz"

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
	.incbin "graphics/intro/intro2_bgclouds.4bpp.lz"

	.global gUnknown_08412EB4
gUnknown_08412EB4: @ 8412EB4
	.incbin "baserom.gba", 0x00412eb4, 0x2d0

	.global gUnknown_08413184
gUnknown_08413184: @ 8413184
	.incbin "graphics/intro/intro2_bgclouds.gbapal"

	.global gUnknown_084131A4
gUnknown_084131A4: @ 84131A4
	.incbin "baserom.gba", 0x004131a4, 0x20

	.global gUnknown_084131C4
gUnknown_084131C4: @ 84131C4
	.incbin "graphics/intro/intro2_bgclouds2.4bpp.lz"

	.global gUnknown_08413300
gUnknown_08413300: @ 8413300
	.incbin "baserom.gba", 0x00413300, 0x20

	.global gUnknown_08413320
gUnknown_08413320: @ 8413320
	.incbin "baserom.gba", 0x00413320, 0x20

	.global gUnknown_08413340
gUnknown_08413340: @ 8413340
	.incbin "graphics/intro/intro2_bgtrees.4bpp.lz"

	.global gUnknown_084139C8
gUnknown_084139C8: @ 84139C8
	.incbin "baserom.gba", 0x004139c8, 0x304

	.global gUnknown_08413CCC
gUnknown_08413CCC: @ 8413CCC
	.incbin "graphics/intro/intro2_bgtrees.gbapal"
	.incbin "graphics/intro/intro2_bgtreessmall.4bpp.lz"

	.global gUnknown_08413E38
gUnknown_08413E38: @ 8413E38
	.incbin "baserom.gba", 0x00413e38, 0x40 @ two palettes?

	.global gUnknown_08413E78
gUnknown_08413E78: @ 8413E78
	.incbin "graphics/intro/intro2_bgnight.4bpp.lz" @ only used in credits, coupled with intro because bicycle sequence

	.global gUnknown_08414064
gUnknown_08414064: @ 8414064
	.incbin "graphics/intro/intro2_bgnight.gbapal"

	.global gUnknown_08414084
gUnknown_08414084: @ 8414084
	.incbin "baserom.gba", 0x00414084, 0x2AC
	.incbin "graphics/intro/intro2_bgnight2.4bpp.lz"
	.incbin "graphics/intro/intro2_brendan.gbapal"
	.incbin "graphics/intro/intro2_brendan.4bpp.lz"
	.incbin "graphics/intro/intro2_may.gbapal"
	.incbin "baserom.gba", 0x00414F90, 0x1E0
	.incbin "graphics/intro/intro2_may.4bpp.lz"
	.incbin "graphics/intro/intro2_bicycle.4bpp.lz"
	.incbin "graphics/intro/intro2_latios.gbapal"
	.incbin "graphics/intro/intro2_latios.4bpp.lz"
	.incbin "graphics/intro/intro2_latias.gbapal"
	.incbin "graphics/intro/intro2_latias.4bpp.lz"

	.global gUnknown_08416B3C
gUnknown_08416B3C: @ 8416B3C
	.incbin "baserom.gba", 0x00416b3c, 0x18

	.global gUnknown_08416B54
gUnknown_08416B54: @ 8416B54
Unknown_8416B54:
	.incbin "baserom.gba", 0x00416b54, 0x10
Unknown_8416B64:
	.incbin "baserom.gba", 0x00416b64, 0x8
Unknown_8416B6C:
	.incbin "baserom.gba", 0x00416b6c, 0x8
Unknown_8416B74:
	.incbin "baserom.gba", 0x00416b74, 0x8
Unknown_8416B7C:
	.incbin "baserom.gba", 0x00416b7c, 0x8

	.align 2
	.global gUnknown_08416B84
gUnknown_08416B84: @ 8416B84
	.4byte Unknown_8416B64
	.4byte Unknown_8416B6C
	.4byte Unknown_8416B74
	.4byte Unknown_8416B7C

	.global gUnknown_08416B94
gUnknown_08416B94: @ 8416B94
	.incbin "baserom.gba", 0x00416b94, 0x48

	.global gUnknown_08416BDC
gUnknown_08416BDC: @ 8416BDC
Unknown_8416BDC:
	.incbin "baserom.gba", 0x00416bdc, 0x10
Unknown_8416BEC:
	.incbin "baserom.gba", 0x00416bec, 0x8
Unknown_8416BF4:
	.incbin "baserom.gba", 0x00416bf4, 0x8
Unknown_8416BFC:
	.incbin "baserom.gba", 0x00416bfc, 0x8

	.align 2
	.global gUnknown_08416C04
gUnknown_08416C04: @ 8416C04
	.4byte Unknown_8416BEC
	.4byte Unknown_8416BF4
	.4byte Unknown_8416BFC

	.global gUnknown_08416C10
gUnknown_08416C10: @ 8416C10
	.incbin "baserom.gba", 0x00416c10, 0x60

	.global gUnknown_08416C70
gUnknown_08416C70: @ 8416C70
Unknown_8416C70:
	.incbin "baserom.gba", 0x00416c70, 0x10
Unknown_8416C80:
	.incbin "baserom.gba", 0x00416c80, 0x8

	.global gUnknown_08416C88
gUnknown_08416C88: @ 8416C88
	.4byte Unknown_8416C80

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
Unknown_8416ED0:
	.incbin "baserom.gba", 0x00416ed0, 0x38
Unknown_8416F08:
	.incbin "baserom.gba", 0x00416f08, 0x4
Unknown_8416F0C:
	.incbin "baserom.gba", 0x00416f0c, 0x4
Unknown_8416F10:
	.incbin "baserom.gba", 0x00416f10, 0x4
Unknown_8416F14:
	.incbin "baserom.gba", 0x00416f14, 0x4
Unknown_8416F18:
	.incbin "baserom.gba", 0x00416f18, 0x4
Unknown_8416F1C:
	.incbin "baserom.gba", 0x00416f1c, 0x6
Unknown_8416F22:
	.incbin "baserom.gba", 0x00416f22, 0x6
Unknown_8416F28:
	.incbin "baserom.gba", 0x00416f28, 0x6
Unknown_8416F2E:
	.incbin "baserom.gba", 0x00416f2e, 0x6
Unknown_8416F34:
	.incbin "baserom.gba", 0x00416f34, 0x6
Unknown_8416F3A:
	.incbin "baserom.gba", 0x00416f3a, 0x8
Unknown_8416F42:
	.incbin "baserom.gba", 0x00416f42, 0x8
Unknown_8416F4A:
	obj_tiles 0x08000900, 1536, 0x1800
Unknown_8416F52:
	obj_tiles 0x02000100, 1024, 0x1800
Unknown_8416F5A:
	.incbin "baserom.gba", 0x00416f5a, 0x8
Unknown_8416F62:
	.incbin "baserom.gba", 0x00416f62, 0xA
Unknown_8416F6C:
	.incbin "baserom.gba", 0x00416f6c, 0xA
Unknown_8416F76:
	.incbin "baserom.gba", 0x00416f76, 0xA
Unknown_8416F80:
	.incbin "baserom.gba", 0x00416f80, 0xA
Unknown_8416F8A:
	.incbin "baserom.gba", 0x00416f8a, 0xA
Unknown_8416F94:
	.incbin "baserom.gba", 0x00416f94, 0xC
Unknown_8416FA0:
	.incbin "baserom.gba", 0x00416fa0, 0xC
Unknown_8416FAC:
	.incbin "baserom.gba", 0x00416fac, 0xC
Unknown_8416FB8:
	.incbin "baserom.gba", 0x00416fb8, 0xC
Unknown_8416FC4:
	.incbin "baserom.gba", 0x00416fc4, 0xC
Unknown_8416FD0:
	.incbin "baserom.gba", 0x00416fd0, 0xE
Unknown_8416FDE:
	.incbin "baserom.gba", 0x00416fde, 0xE
Unknown_8416FEC:
	.incbin "baserom.gba", 0x00416fec, 0xE
Unknown_8416FFA:
	.incbin "baserom.gba", 0x00416ffa, 0xE
Unknown_8417008:
	.incbin "baserom.gba", 0x00417008, 0xE
Unknown_8417016:
	.incbin "baserom.gba", 0x00417016, 0x10
Unknown_8417026:
	.incbin "baserom.gba", 0x00417026, 0x10
Unknown_8417036:
	.incbin "baserom.gba", 0x00417036, 0x10
Unknown_8417046:
	.incbin "baserom.gba", 0x00417046, 0x10
Unknown_8417056:
	.incbin "baserom.gba", 0x00417056, 0x12

	.align 2
	.global gUnknown_08417068
gUnknown_08417068: @ 8417068
	.4byte Unknown_8416F08
	.4byte Unknown_8416F0C
	.4byte Unknown_8416F10
	.4byte Unknown_8416F14
	.4byte Unknown_8416F18
	.4byte Unknown_8416F1C
	.4byte Unknown_8416F22
	.4byte Unknown_8416F28
	.4byte Unknown_8416F2E
	.4byte Unknown_8416F34
	.4byte Unknown_8416F3A
	.4byte Unknown_8416F42
	.4byte Unknown_8416F4A
	.4byte Unknown_8416F52
	.4byte Unknown_8416F5A
	.4byte Unknown_8416F62
	.4byte Unknown_8416F6C
	.4byte Unknown_8416F76
	.4byte Unknown_8416F80
	.4byte Unknown_8416F8A
	.4byte Unknown_8416F94
	.4byte Unknown_8416FA0
	.4byte Unknown_8416FAC
	.4byte Unknown_8416FB8
	.4byte Unknown_8416FC4
	.4byte Unknown_8416FD0
	.4byte Unknown_8416FDE
	.4byte Unknown_8416FEC
	.4byte Unknown_8416FFA
	.4byte Unknown_8417008
	.4byte Unknown_8417016
	.4byte Unknown_8417026
	.4byte Unknown_8417036
	.4byte Unknown_8417046
	.4byte Unknown_8417056

	.global gUnknown_084170F4
gUnknown_084170F4: @ 84170F4
	.incbin "baserom.gba", 0x004170f4, 0xD0

__unknown_84171C4:
	.incbin "baserom.gba", 0x4171C4, 0x25E0

__unknown_84197A4:
	.incbin "baserom.gba", 0x4197A4, 0x390

__unknown_8419B34:
	.incbin "baserom.gba", 0x419B34, 0x1470

__unknown_841AFA4:
	.incbin "baserom.gba", 0x41AFA4, 0xBD0

__unknown_841BB74:
	.incbin "baserom.gba", 0x41BB74, 0x7E0

__unknown_841C354:
	.incbin "baserom.gba", 0x41C354, 0xE10

__unknown_841D164:
	.incbin "baserom.gba", 0x41D164, 0xBD0

__unknown_841DD34:
	.incbin "baserom.gba", 0x41DD34, 0xB40

__unknown_841E874:
	.incbin "baserom.gba", 0x41E874, 0xCF0

__unknown_841F564:
	.incbin "baserom.gba", 0x41F564, 0xCF0

__unknown_8420254:
	.incbin "baserom.gba", 0x420254, 0xCF0

__unknown_8420F44:
	.incbin "baserom.gba", 0x420F44, 0xEA0

__unknown_8421DE4:
	.incbin "baserom.gba", 0x421DE4, 0x870

__unknown_8422654:
	.incbin "baserom.gba", 0x422654, 0xA20

__unknown_8423074:
	.incbin "baserom.gba", 0x423074, 0x870

__unknown_84238E4:
	.incbin "baserom.gba", 0x4238E4, 0x7E0

__unknown_84240C4:
	.incbin "baserom.gba", 0x4240C4, 0x6C0

__unknown_8424784:
	.incbin "baserom.gba", 0x424784, 0x420

__unknown_8424BA4:
	.incbin "baserom.gba", 0x424BA4, 0x1CB0

__unknown_8426854:
	.incbin "baserom.gba", 0x426854, 0x2460

__unknown_8428CB4:
	.incbin "baserom.gba", 0x428CB4, 0x630

__unknown_84292E4:
	.incbin "baserom.gba", 0x4292E4, 0x2F10

	.align 2
	.global gUnknown_0842C1F4
gUnknown_0842C1F4: @ 842C1F4
	.4byte __unknown_84171C4
	.4byte __unknown_84197A4
	.4byte __unknown_8419B34
	.4byte __unknown_841AFA4
	.4byte __unknown_841BB74
	.4byte __unknown_841C354
	.4byte __unknown_841D164
	.4byte __unknown_841DD34
	.4byte __unknown_841E874
	.4byte __unknown_841F564
	.4byte __unknown_8420254
	.4byte __unknown_8420F44
	.4byte __unknown_8421DE4
	.4byte __unknown_8422654
	.4byte __unknown_8423074
	.4byte __unknown_84238E4
	.4byte __unknown_84240C4
	.4byte __unknown_8424784
	.4byte __unknown_8424BA4
	.4byte __unknown_8426854
	.4byte __unknown_8428CB4
	.4byte __unknown_84292E4

__unknown_string_1stRound:
	.string "1st round$"

__unknown_string_2ndRound:
	.string "2nd round$"

__unknown_string_3rdRound:
	.string "3rd round$"

__unknown_string_4thRound:
	.string "4th round$"

__unknown_string_5thRound:
	.string "5th round$"

__unknown_string_6thRound:
	.string "6th round$"

__unknown_string_7thRound:
	.string "7th round$"

__unknown_string_8thRound:
	.string "8th round$"

	.align 2
	.global gUnknown_0842C29C
gUnknown_0842C29C: @ 842C29C
	.4byte __unknown_string_1stRound, sub_814A4B8
	.4byte __unknown_string_2ndRound, sub_814A4B8
	.4byte __unknown_string_3rdRound, sub_814A4B8
	.4byte __unknown_string_4thRound, sub_814A4B8
	.4byte __unknown_string_5thRound, sub_814A4B8
	.4byte __unknown_string_6thRound, sub_814A4B8
	.4byte __unknown_string_7thRound, sub_814A4B8
	.4byte __unknown_string_8thRound, sub_814A4B8
OtherText_TopSpeed:
	.string "TOP SPEED$"

	.global gUnknown_0842C2E6
gUnknown_0842C2E6: @ 842C2E6
MultiText_BerryBlenderMaxSpeedRecord:
	.string "BERRY BLENDER\nMAXIMUM SPEED RECORD!$"

	.global gUnknown_0842C30A
gUnknown_0842C30A: @ 842C30A
MultiText_2P3P4P:
	.string "2 PLAYERS\n3 PLAYERS\n4 PLAYERS$"

	.global gUnknown_0842C328
gUnknown_0842C328: @ 842C328
MultiText_Saving:
	.string "SAVING...\nDON’T TURN OFF THE POWER.$"

	.global gUnknown_0842C34C
gUnknown_0842C34C: @ 842C34C
MultiText_LinkError:
	.string "{HIGHLIGHT TRANSPARENT}{COLOR WHITE2}Link error...\nCheck your Game Link cable connection,\nand turn the power off and on.$"

	.global gUnknown_0842C3A6
gUnknown_0842C3A6: @ 842C3A6
SystemText_OptionMenu:
	.string "{PALETTE 9}OPTION$"

	.global gUnknown_0842C3B0
gUnknown_0842C3B0: @ 842C3B0
SystemText_TextSpeed:
	.string "{PALETTE 9}TEXT SPEED$"

	.global gUnknown_0842C3BE
gUnknown_0842C3BE: @ 842C3BE
SystemText_BattleScene:
	.string "{PALETTE 9}BATTLE SCENE$"

	.global gUnknown_0842C3CE
gUnknown_0842C3CE: @ 842C3CE
SystemText_BattleStyle:
	.string "{PALETTE 9}BATTLE STYLE$"

	.global gUnknown_0842C3DE
gUnknown_0842C3DE: @ 842C3DE
SystemText_Sound:
	.string "{PALETTE 9}SOUND$"

	.global gUnknown_0842C3E7
gUnknown_0842C3E7: @ 842C3E7
SystemText_Frame:
	.string "{PALETTE 9}FRAME$"

	.global gUnknown_0842C3F0
gUnknown_0842C3F0: @ 842C3F0
SystemText_Cancel:
	.string "{PALETTE 9}CANCEL$"

	.global gUnknown_0842C3FA
gUnknown_0842C3FA: @ 842C3FA
SystemText_ButtonMode:
	.string "{PALETTE 9}BUTTON MODE$"

	.global gUnknown_0842C409
gUnknown_0842C409: @ 842C409
SystemText_TextSpeedSlow:
	.string "{PALETTE 15}SLOW$"

	.global gUnknown_0842C411
gUnknown_0842C411: @ 842C411
SystemText_Mid:
	.string "{PALETTE 15}MID$"

	.global gUnknown_0842C418
gUnknown_0842C418: @ 842C418
SystemText_Fast:
	.string "{PALETTE 15}FAST$"

	.global gUnknown_0842C420
gUnknown_0842C420: @ 842C420
SystemText_On:
	.string "{PALETTE 15}ON$"

	.global gUnknown_0842C426
gUnknown_0842C426: @ 842C426
SystemText_Off:
	.string "{PALETTE 15}OFF$"

	.global gUnknown_0842C42D
gUnknown_0842C42D: @ 842C42D
SystemText_Shift:
	.string "{PALETTE 15}SHIFT$"

	.global gUnknown_0842C436
gUnknown_0842C436: @ 842C436
SystemText_Set:
	.string "{PALETTE 15}SET$"

	.global gUnknown_0842C43D
gUnknown_0842C43D: @ 842C43D
SystemText_Mono:
	.string "{PALETTE 15}MONO$"

	.global gUnknown_0842C445
gUnknown_0842C445: @ 842C445
SystemText_Stereo:
	.string "{PALETTE 15}STEREO$"

	.global gUnknown_0842C44F
gUnknown_0842C44F: @ 842C44F
SystemText_Type:
	.string "{PALETTE 15}TYPE$"

	.global gUnknown_0842C457
gUnknown_0842C457: @ 842C457
SystemText_Terminator:
	.string "{PALETTE 8}$"

	.global gUnknown_0842C45B
gUnknown_0842C45B: @ 842C45B
SystemText_Normal:
	.string "{PALETTE 15}NORMAL$"

	.global gUnknown_0842C465
gUnknown_0842C465: @ 842C465
SystemText_LR:
	.string "{PALETTE 15}LR$"

	.global gUnknown_0842C46B
gUnknown_0842C46B: @ 842C46B
SystemText_LA:
	.string "{PALETTE 15}L=A$"
SystemText_Pokedex:
	.string "POKéDEX$"
SystemText_Pokemon:
	.string "POKéMON$"
SystemText_BAG:
	.string "BAG$"
SystemText_Pokenav:
	.string "POKéNAV$"
SystemText_Player:
	.string "{PLAYER}$"
SystemText_Save:
	.string "SAVE$"
SystemText_Option:
	.string "OPTION$"
SystemText_Exit:
	.string "EXIT$"
SystemText_Retire: @ safari zone?
	.string "RETIRE$"

	.global gUnknown_0842C4A9
gUnknown_0842C4A9: @ 842C4A9
OtherText_SafariStock:
	.string "SAFARI BALLS\nStock: {STR_VAR_1}$"

	.global gUnknown_0842C4C0
gUnknown_0842C4C0: @ 842C4C0
SystemText_LinkStandby:
	.string "Link standby...\n... ... B Button: Cancel$"

	.global gUnknown_0842C4E9
gUnknown_0842C4E9: @ 842C4E9
SystemText_LoadEventPressA:
	.string "Press the A Button to load event.\n... ... B Button: Cancel$"

	.global gUnknown_0842C524
gUnknown_0842C524: @ 842C524
SystemText_LoadingEvent:
	.string "Loading event...$"

	.global gUnknown_0842C535
gUnknown_0842C535: @ 842C535
SystemText_DontCutLink:
	.string "Don’t remove the Game Link cable.\nDon’t turn off the power.$"

	.global gUnknown_0842C571
gUnknown_0842C571: @ 842C571
SystemText_EventLoadSuccess:
	.string "The event was safely loaded.$"
SystemText_Terminator2:
	.string "$"

	.global gUnknown_0842C58F
gUnknown_0842C58F: @ 842C58F
SystemText_LoadingError:
	.string "Loading error.\nEnding session.$"
SystemText_Terminator3:
	.string "$$$$$$$"

	.global gUnknown_0842C5B5
gUnknown_0842C5B5: @ 842C5B5
OtherText_Hoenn:
	.string "HOENN$"

	.global gUnknown_0842C5BB
gUnknown_0842C5BB: @ 842C5BB
OtherText_OhABite:
	.string "Oh! A bite!$"

	.global gUnknown_0842C5C7
gUnknown_0842C5C7: @ 842C5C7
OtherText_PokeOnHook:
	.string "A POKéMON’s on the hook!{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0842C5E2
gUnknown_0842C5E2: @ 842C5E2
OtherText_NotANibble:
	.string "Not even a nibble...{PAUSE_UNTIL_PRESS}$"

	.global gUnknown_0842C5F9
gUnknown_0842C5F9: @ 842C5F9
OtherText_ItGotAway:
	.string "It got away...{PAUSE_UNTIL_PRESS}$"
OtherText_Terminator:
	.string "$"

	.global gUnknown_0842C60B
gUnknown_0842C60B: @ 842C60B
TradeText_WillBeSent:
	.string "{STR_VAR_2} will be sent to {STR_VAR_1}.$"

	.global gUnknown_0842C622
gUnknown_0842C622: @ 842C622
TradeText_ByeBye:
	.string "Bye-bye, {STR_VAR_2}!$"

	.global gUnknown_0842C62F
gUnknown_0842C62F: @ 842C62F
TradeText_SentOverPoke:
	.string "{STR_VAR_1} sent over {STR_VAR_3}.$"

	.global gUnknown_0842C640
gUnknown_0842C640: @ 842C640
TradeText_TakeGoodCare:
	.string "Take good care of {STR_VAR_3}!$"
TradeText_Cancel:
	.string "CANCEL$"
TradeText_ChoosePoke:
	.string "Choose a POKéMON.$"
TradeText_Summary1:
	.string "SUMMARY$"
TradeText_Trade1:
	.string "TRADE$"
TradeText_CancelTradePrompt:
	.string "Cancel trade?$"
TradeText_PressBToExit:
	.string "Press the B Button to exit.$"
TradeText_Summary2:
	.string "SUMMARY$"
TradeText_Trade2:
	.string "TRADE$"
TradeText_LinkStandby:
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Link standby...\nPlease wait.$"
TradeText_TradeCancelled:
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}The trade has\nbeen canceled.$"
TradeText_OnlyPoke:
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}That’s your only\nPOKéMON for battle.$"
TradeText_NonTradablePoke:
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Your friend can’t\ntrade that one.$"
TradeText_WaitingForFriend:
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Waiting for your\nfriend to finish...$"
TradeText_WantToTrade:
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Your friend wants\nto trade POKéMON.$"
TradeText_Terminator:
	.string "$"

	.global gUnknown_0842C7B6 @ trade functions? could be in-game as well
gUnknown_0842C7B6:
TradeText_TradeOkayPrompt:
	.string "Is this trade okay?$"

	.global gUnknown_0842C7CA
gUnknown_0842C7CA:
OtherText_Terminator2:
	.string "$"

	.global gUnknown_0842C7CB @ this is probably related to battle
gUnknown_0842C7CB:
OtherText_NewLine:
	.string "\n$"
OtherText_Escape:
	.string "/$"
OtherText_Level:
	.string "Lv$"
OtherText_ThreeDashes:
	.string "---$"

	.global gUnknown_0842C7D6
gUnknown_0842C7D6:
OtherText_FourQuestions:
	.string "????$"

@ 842C7DB
	.include "data/text/easy_chat/group_name_strings.s"

	.global gUnknown_0842C890
gUnknown_0842C890: @ 842C890
OtherText_ThreeQuestions:
	.string "???$"

	.global gUnknown_0842C894
gUnknown_0842C894: @ 842C894
OtherText_From:
	.string "From $"

	.global gUnknown_0842C89A
gUnknown_0842C89A: @ 842C89A
OtherText_MixingRecordsWithFriend:
	.string "Mixing records...$"

	.global gUnknown_0842C8AC
gUnknown_0842C8AC: @ 842C8AC
OtherText_MixingComplete:
	.string "Record mixing completed.\nThank you for waiting.$"

	.global gUnknown_0842C8DC
gUnknown_0842C8DC: @ 842C8DC
OtherText_TrainersTrainerCard: @ redundant but couldnt think of a better desc
	.string "’s TRAINER CARD$"

	.global gUnknown_0842C8EC
gUnknown_0842C8EC: @ 842C8EC
OtherText_FirstHOF:
	.string "FIRST HALL OF FAME$"

	.global gUnknown_0842C8FF
gUnknown_0842C8FF: @ 842C8FF
OtherText_LinkCableBattles:
	.string "LINK CABLE BATTLES  W/            L/$"

	.global gUnknown_0842C924
gUnknown_0842C924: @ 842C924
OtherText_BattleTowerWinRecord:
	.string "BATTLE TOWER W/{CLEAR_TO 0x72}&{CLEAR_TO 0x98}STRAIGHT$"

	.global gUnknown_0842C943
gUnknown_0842C943: @ 842C943
OtherText_ContestRecord:
	.string "CONTESTS W/FRIENDS W/$"

	.global gUnknown_0842C959
gUnknown_0842C959: @ 842C959
OtherText_MixingRecord:
	.string "{POKEBLOCK}S W/FRIENDS$"

	.global gUnknown_0842C96A
gUnknown_0842C96A: @ 842C96A
OtherText_TradeRecord:
	.string "POKéMON TRADES$"

	.global gUnknown_0842C979
gUnknown_0842C979: @ 842C979
OtherText_Boy:
	.string "BOY$"

	.global gUnknown_0842C97D
gUnknown_0842C97D: @ 842C97D
OtherText_Girl:
	.string "GIRL$"
OtherText_Terminator3:
	.string "$"

	.global gUnknown_0842C983
gUnknown_0842C983: @ 842C983
OtherText_Player:
	.string "PLAYER$"

	.global gUnknown_0842C98A
gUnknown_0842C98A: @ 842C98A
OtherText_Badges:
	.string "BADGES$"
	.string "$"

	.global gUnknown_0842C992
gUnknown_0842C992: @ 842C992
OtherText_Pokedex:
	.string "POKéDEX$"

	.global gUnknown_0842C99A
gUnknown_0842C99A: @ 842C99A
OtherText_PlayTime:
	.string "PLAY TIME$"

	.global gUnknown_0842C9A4
gUnknown_0842C9A4: @ 842C9A4
OtherText_SentToPc:
	.string "{STR_VAR_1} was sent to\nthe PC.{PAUSE_UNTIL_PRESS}$"
OtherText_YourName:
	.string "YOUR NAME?$"
OtherText_BoxName:
	.string "BOX NAME?$"
OtherText_PokeName:
	.string "{STR_VAR_1}’s nickname?$"

	.global gUnknown_0842C9E1
gUnknown_0842C9E1: @ 842C9E1
OtherText_Marco:
	.string "MARCO$" @ polo

	.global gUnknown_0842C9E7
gUnknown_0842C9E7: @ 842C9E7
OtherText_Coins:
	.string "{STR_VAR_1} COINS$"

	.global gUnknown_0842C9F0
gUnknown_0842C9F0: @ 842C9F0
OtherText_BattleResults:
	.string "{PLAYER}’s BATTLE RESULTS$"

	.global gUnknown_0842CA04
gUnknown_0842CA04: @ 842CA04
OtherText_WinRecord:
	.string "TOTAL RECORD W/{STR_VAR_1} L/{STR_VAR_2} D/{STR_VAR_3}$"

	.global gUnknown_0842CA20
gUnknown_0842CA20: @ 842CA20
OtherText_WinLoseDraw:
	.string "WIN        LOSE        DRAW$"

	.global gUnknown_0842CA3C
gUnknown_0842CA3C: @ 842CA3C
OtherText_SevenDashes:
	.string "-------$"

	.global gUnknown_0842CA44
gUnknown_0842CA44: @ 842CA44
OtherText_FourDashes:
	.string "----$"

	.global gUnknown_0842CA49
gUnknown_0842CA49: @ 842CA49
OtherText_BattleTowerResults:
	.string "{PLAYER}’s BATTLE TOWER RESULTS$"

	.global gUnknown_0842CA63
gUnknown_0842CA63: @ 842CA63
OtherText_Lv50:
	.string "LV 50$"

	.global gUnknown_0842CA69
gUnknown_0842CA69: @ 842CA69
OtherText_Lv100:
	.string "LV 100$"

	.global gUnknown_0842CA70
gUnknown_0842CA70: @ 842CA70
OtherText_WinStreak:
	.string "{STR_VAR_1}W STREAK$"

	.global gUnknown_0842CA7B
gUnknown_0842CA7B: @ 842CA7B
OtherText_Current:
	.string "CURRENT$"

	.global gUnknown_0842CA83
gUnknown_0842CA83: @ 842CA83
OtherText_Record:
	.string "RECORD$"

	.global gUnknown_0842CA8A
gUnknown_0842CA8A: @ 842CA8A
OtherText_Prev:
	.string "PREV.$"

	.global gUnknown_0842CA90
gUnknown_0842CA90: @ 842CA90
OtherText_QuitGamePrompt:
	.string "Quit the game?$"

	.global gUnknown_0842CA9F
gUnknown_0842CA9F: @ 842CA9F
OtherText_MaxCoins:
	.string "You’ve got 9,999 COINS.$"

	.global gUnknown_0842CAB7
gUnknown_0842CAB7: @ 842CAB7
OtherText_OutOfCoins:
	.string "You’ve run out of COINS.\nGame over!$"

	.global gUnknown_0842CADB
gUnknown_0842CADB: @ 842CADB
OtherText_DontHaveThreeCoins:
	.string "You don’t have three COINS.$"

	.global gUnknown_0842CAF7
gUnknown_0842CAF7: @ 842CAF7
OtherText_ReelTime:
	.string "REEL TIME\nHere’s your chance to take\naim and nail marks!\nThe Reel Time continues for\nas often as the drawn number.\nIt all ends on a Big Bonus.$"
DaycareText_GetAlongVeryWell:
	.string "The two seem to get along very well.$"
DaycareText_GetAlong:
	.string "The two seem to get along.$"
DaycareText_DontLikeOther:
	.string "The two don’t seem to like each other.$"
DaycareText_PlayOther:
	.string "The two prefer to play with other\nPOKéMON than each other.$"

	.global gUnknown_0842CC28
gUnknown_0842CC28: @ 842CC28
OtherText_NewLine2:
	.string "\n$"

	.global gUnknown_0842CC2A
gUnknown_0842CC2A: @ 842CC2A
OtherText_Cancel:
	.string "CANCEL$"
OtherText_Lv:
	.string "LV$"

	.global gUnknown_0842CC34
gUnknown_0842CC34: @ 842CC34
OtherText_Egg:
	.string "EGG$"

	.global gUnknown_0842CC38
gUnknown_0842CC38: @ 842CC38
OtherText_HatchedFromEgg:
	.string "{COLOR WHITE2}{HIGHLIGHT TRANSPARENT}{SHADOW DARK_GREY}{STR_VAR_1} hatched from the EGG!$"

	.global gUnknown_0842CC5A
gUnknown_0842CC5A: @ 842CC5A
OtherText_NickHatchPrompt:
	.string "{COLOR WHITE2}{HIGHLIGHT TRANSPARENT}{SHADOW DARK_GREY}Would you like to nickname the newly\nhatched {STR_VAR_1}?$"
OtherText_Battle:
	.string "BATTLE$"
OtherText_Contest:
	.string "CONTEST$"
OtherText_Type:
	.string "TYPE/$"
OtherText_PP:
	.string "PP/$"
OtherText_Power:
	.string "POWER$"
OtherText_Accuracy:
	.string "ACCURACY$"
OtherText_Appeal:
	.string "APPEAL$"
OtherText_Jam:
	.string "JAM$"

	.global gUnknown_0842CCC7
gUnknown_0842CCC7: @ 842CCC7
OtherText_TeachWhichMove:
	.string "Teach which move to {STR_VAR_1}?$"

	.global gUnknown_0842CCDF
gUnknown_0842CCDF: @ 842CCDF
OtherText_TeachSpecificMove:
	.string "Teach {STR_VAR_2}?$"

	.global gUnknown_0842CCE9
gUnknown_0842CCE9: @ 842CCE9
OtherText_PokeLearnedMove:
	.string "{STR_VAR_1} learned {STR_VAR_2}.$"

	.global gUnknown_0842CCF8
gUnknown_0842CCF8: @ 842CCF8
OtherText_DeleteOlderMove:
	.string "{STR_VAR_1} is trying to learn\n{STR_VAR_2}.\pBut {STR_VAR_1} can’t learn more\nthan four moves.\pDelete an older move to make\nroom for {STR_VAR_2}?$"

	.global gUnknown_0842CD65
gUnknown_0842CD65: @ 842CD65
OtherText_StopLearningMove:
	.string "Stop learning {STR_VAR_2}?$"

	.global gUnknown_0842CD77
gUnknown_0842CD77: @ 842CD77
OtherText_ForgotMove123:
	.string "{PAUSE 32}1, {PAUSE 15}2 {PAUSE 15}...{PAUSE 15}...{PAUSE 15}...{PAUSE 15} {PLAY_SE 0x0038}Poof!\p$"

	.global gUnknown_0842CDA3
gUnknown_0842CDA3: @ 842CDA3
OtherText_ForgotMove:
	.string "{STR_VAR_1} forgot {STR_VAR_3}.\pAnd...\p{STR_VAR_1} learned {STR_VAR_2}.$"
OtherText_DidNotLearnMove:
	.string "{STR_VAR_1} did not learn\n{STR_VAR_2}.$"

	.global gUnknown_0842CDDC
gUnknown_0842CDDC: @ 842CDDC
OtherText_GiveUpTeachingMove:
	.string "Give up trying to teach a new move\nto {STR_VAR_1}?$"

	.global gUnknown_0842CE06
gUnknown_0842CE06: @ 842CE06
OtherText_WhichMoveToForget:
	.string "Which move should be forgotten?\p$"

	.global gUnknown_0842CE27
gUnknown_0842CE27: @ 842CE27
OtherText_ClearAllSaveDataPrompt:
	.string "Clear all save data areas?$"

	.global gUnknown_0842CE42
gUnknown_0842CE42: @ 842CE42
OtherText_ClearingData:
	.string "Clearing data...\nPlease wait.$"

	.global gUnknown_0842CE60
gUnknown_0842CE60: @ 842CE60
ContestText_AnnounceResults:
	.string "Announcing the results!$"

	.global gUnknown_0842CE78
gUnknown_0842CE78: @ 842CE78
ContestText_PreliminaryResults:
	.string "The preliminary results!$"

	.global gUnknown_0842CE91
gUnknown_0842CE91: @ 842CE91
ContestText_Round2Results:
	.string "Round 2 results!$"

	.global gUnknown_0842CEA2
gUnknown_0842CEA2: @ 842CEA2
ContestText_PokeWon:
	.string "{STR_VAR_1}’s {STR_VAR_2} won!$"

	.global gUnknown_0842CEAF
gUnknown_0842CEAF: @ 842CEAF
OtherText_LinkStandby:
	.string "Link standby...$"
OtherText_FlowerShop:
	.string "FLOWER SHOP$"
OtherText_PetalburgWoods:
	.string "PETALBURG WOODS$"
OtherText_BrineysCottage:
	.string "MR. BRINEY’S COTTAGE$"
OtherText_AbandonedShip:
	.string "ABANDONED SHIP$"
OtherText_SeashoreHouse:
	.string "SEASHORE HOUSE$"
OtherText_SlateportBeach:
	.string "SLATEPORT BEACH$"
OtherText_CyclingRoad:
	.string "CYCLING ROAD$"
OtherText_NewMauville:
	.string "NEW MAUVILLE$"
OtherText_TrickHouse:
	.string "TRICK HOUSE$"
OtherText_OldLadyRestShop:
	.string "OLD LADY’S REST STOP$"
OtherText_Desert:
	.string "DESERT$"
OtherText_WinstrateFamily:
	.string "THE WINSTRATE FAMILY$"
OtherText_CableCar:
	.string "CABLE CAR$"
OtherText_GlassWorkshop:
	.string "GLASS WORKSHOP$"
OtherText_WeatherInstitute:
	.string "WEATHER INSTITUTE$"
OtherText_MeteorFalls:
	.string "METEOR FALLS$"
OtherText_TunnelersRestHouse:
	.string "TUNNELER’S REST HOUSE$"
OtherText_RusturfTunnel:
	.string "RUSTURF TUNNEL$"
OtherText_PokemonDayCare:
	.string "POKéMON DAY CARE$"
OtherText_SafariZoneEntrance:
	.string "SAFARI ZONE ENTRANCE$"
OtherText_MtPyre:
	.string "MT. PYRE$"
OtherText_ShoalCave:
	.string "SHOAL CAVE$"
OtherText_SeafloorCavern:
	.string "SEAFLOOR CAVERN$"
OtherText_GraniteCave:
	.string "GRANITE CAVE$"
OtherText_OceanCurrent:
	.string "OCEAN CURRENT$"
OtherText_LanetteHouse:
	.string "LANETTE’S HOUSE$"
OtherText_FieryPath:
	.string "FIERY PATH$"
OtherText_JaggedPass:
	.string "JAGGED PASS$"
OtherText_SkyPillar:
	.string "SKY PILLAR$"
OtherText_BerryMasterHouse:
	.string "BERRY MASTER’S HOUSE$"
OtherText_IslandCave:
	.string "ISLAND CAVE$"
OtherText_DesertRuins:
	.string "DESERT RUINS$"
OtherText_ScorchedSlab:
	.string "SCORCHED SLAB$"
OtherText_AncientTomb:
	.string "ANCIENT TOMB$"
OtherText_SealedChamber:
	.string "SEALED CHAMBER$"
OtherText_FossilManiacsHouse:
	.string "FOSSIL MANIAC’S HOUSE$"
OtherText_HuntersHouse:
	.string "HUNTER’S HOUSE$"

	.global gUnknown_0842D0E6
gUnknown_0842D0E6: @ 842D0E6
OtherText_Terminator4:
	.string "$"

	.global gUnknown_0842D0E7
gUnknown_0842D0E7: @ 842D0E7
OtherText_Nature:
	.string " nature, $"

	.global gUnknown_0842D0F1
gUnknown_0842D0F1: @ 842D0F1
OtherText_Comma:
	.string ",$"

	.global gUnknown_0842D0F3
gUnknown_0842D0F3: @ 842D0F3
OtherText_Met:
	.string " (met).$"

	.global gUnknown_0842D0FB
gUnknown_0842D0FB: @ 842D0FB
OtherText_Egg2:
	.string " (EGG).$"

	.global gUnknown_0842D103
gUnknown_0842D103: @ 842D103
OtherText_ObtainedInTrade:
	.string "obtained in a trade.$"

	.global gUnknown_0842D118
gUnknown_0842D118: @ 842D118
OtherText_FatefulEncounter:
	.string "fateful encounter.$"

	.global gUnknown_0842D12B
gUnknown_0842D12B: @ 842D12B
OtherText_Met2:
	.string " (met).$"

	.global gUnknown_0842D133
gUnknown_0842D133: @ 842D133
OtherText_EggDayCare:
	.string "An odd POKéMON EGG found\nby the DAY CARE couple.$"

	.global gUnknown_0842D164
gUnknown_0842D164: @ 842D164
OtherText_EggNicePlace:
	.string "A peculiar POKéMON EGG\nobtained at the nice place.$"

	.global gUnknown_0842D197
gUnknown_0842D197: @ 842D197
OtherText_EggObtainedInTrade:
	.string "A peculiar POKéMON EGG\nobtained in a trade.$"

	.global gUnknown_0842D1C3
gUnknown_0842D1C3: @ 842D1C3
OtherText_EggHotSprings:
	.string "A POKéMON EGG obtained\nat the hot springs.$"

	.global gUnknown_0842D1EE
gUnknown_0842D1EE: @ 842D1EE
OtherText_LinkStandby2:
	.string "Link standby...$"

	.global gUnknown_0842D1FE
gUnknown_0842D1FE: @ 842D1FE
OtherText_YesNo:
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}YES\nNO$"
OtherText_Player2:
	.string "{HIGHLIGHT TRANSPARENT}PLAYER$"
OtherText_Terminator5:
	.string "{HIGHLIGHT TRANSPARENT}$"

	.global gUnknown_0842D21C
gUnknown_0842D21C: @ 842D21C
OtherText_HoennDex:
	.string "HOENN$"

	.global gUnknown_0842D222
gUnknown_0842D222: @ 842D222
OtherText_NationalDex:
	.string "NATIONAL$"

	.global gUnknown_0842D22B
gUnknown_0842D22B: @ 842D22B
OtherText_DiplomaCertification:
	.string "{HIGHLIGHT TRANSPARENT}Player: {CLEAR 0x10}{COLOR RED}{PLAYER}\n\n{COLOR DARK_GREY}{STR_VAR_1} POKéDEX\nThis document certifies\nthat you have successfully\ncompleted your POKéDEX.\n\n{CLEAR_TO 0x42}{COLOR RED}GAME FREAK$"
OtherText_DiplomaGameFreak:
	.string "{COLOR RED}{HIGHLIGHT TRANSPARENT}GAME FREAK$"

	.global gUnknown_0842D2BC
gUnknown_0842D2BC: @ 842D2BC
OtherText_PLink:
	.string "{STR_VAR_1}P LINK$"

	.global gUnknown_0842D2C5
gUnknown_0842D2C5: @ 842D2C5
OtherText_YesNo2:
	.string "YES\nNO$"
OtherText_Terminating:
	.string "Terminating.$"

	.global gUnknown_0842D2D9
gUnknown_0842D2D9: @ 842D2D9
OtherText_LinkNotFound:
	.string "Link partner(s) not found.\nPlease try again.\p$"

	.global gUnknown_0842D307
gUnknown_0842D307: @ 842D307
OtherText_BerryBlenderChoose:
	.string "Starting up the BERRY BLENDER.\pPlease select a BERRY from your BAG\nto put in the BERRY BLENDER.\p$"

	.global gUnknown_0842D368
gUnknown_0842D368: @ 842D368
OtherText_PokeBlockMade:
	.string " was made!$"

	.global gUnknown_0842D373
gUnknown_0842D373: @ 842D373
OtherText_PressAToStart:
	.string "Press the A Button to start.$"

	.global gUnknown_0842D390
gUnknown_0842D390: @ 842D390
OtherText_PleaseWait:
	.string "Please wait a while.$"

	.global gUnknown_0842D3A5
gUnknown_0842D3A5: @ 842D3A5
OtherText_LinkStandby3:
	.string "Link standby...$"

	.global gUnknown_0842D3B5
gUnknown_0842D3B5: @ 842D3B5
OtherText_BlendAnotherBerryPrompt:
	.string "Would you like to blend another BERRY?$"

	.global gUnknown_0842D3DC
gUnknown_0842D3DC: @ 842D3DC
OtherText_OutOfBerries:
	.string "You’ve run out of BERRIES for\nblending in the BERRY BLENDER.\p$"

	.global gUnknown_0842D41A
gUnknown_0842D41A: @ 842D41A
OtherText_CaseIsFull:
	.string "Your {POKEBLOCK} CASE is full.\p$"

	.global gUnknown_0842D434
gUnknown_0842D434: @ 842D434
OtherText_NoBerriesForBlend:
	.string " has no BERRIES to put in\nthe BERRY BLENDER.$"

	.global gUnknown_0842D461
gUnknown_0842D461: @ 842D461
OtherText_OtherCaseIsFull:
	.string "’s {POKEBLOCK} CASE is full.\p$"

	.global gUnknown_0842D479
gUnknown_0842D479: @ 842D479
OtherText_ResultOfBlending:
	.string "RESULTS OF BLENDING$"
OtherText_BerryUsed:
	.string "BERRY USED$"

	.global gUnknown_0842D498
gUnknown_0842D498: @ 842D498
OtherText_Berry:
	.string " BERRY$"

	.global gUnknown_0842D49F
gUnknown_0842D49F: @ 842D49F
OtherText_RequiredTime:
	.string "REQUIRED TIME$"

	.global gUnknown_0842D4AD
gUnknown_0842D4AD: @ 842D4AD
OtherText_Min:
	.string "MIN.$"

	.global gUnknown_0842D4B2
gUnknown_0842D4B2: @ 842D4B2
OtherText_Sec:
	.string "SEC.$"

	.global gUnknown_0842D4B7
gUnknown_0842D4B7: @ 842D4B7
OtherText_MaxSpeed:
	.string "MAXIMUM SPEED$"

	.global gUnknown_0842D4C5
gUnknown_0842D4C5: @ 842D4C5
OtherText_RPM:
	.string "RPM$"
OtherText_RPMPeriod:
	.string ".$"

	.global gUnknown_0842D4CB
gUnknown_0842D4CB: @ 842D4CB
OtherText_Ranking:
	.string "RANKING$"

	.global gUnknown_0842D4D3
gUnknown_0842D4D3: @ 842D4D3
OtherText_BlockLevelIs:
	.string "The level is $"

	.global gUnknown_0842D4E1
gUnknown_0842D4E1: @ 842D4E1
OtherText_BlockFeelIs:
	.string ", and the feel is $"

	.global gUnknown_0842D4F4
gUnknown_0842D4F4: @ 842D4F4
OtherText_Period:
	.string ".$"

	.global gUnknown_0842D4F6
gUnknown_0842D4F6: @ 842D4F6
OtherText_Day:
	.string "DAY$"
OtherText_DayColon:
	.string ":$"

	.global gUnknown_0842D4FC
gUnknown_0842D4FC: @ 842D4FC
OtherText_OK:
	.string "OK$"

	.global gUnknown_0842D4FF
gUnknown_0842D4FF: @ 842D4FF
OtherText_CorrectTimePrompt:
	.string "Is this the correct time?$"

	.align 2
OutlineCursorTiles_00:
	.incbin "graphics/interface/outline_cursor_00.4bpp"

	.align 2
OutlineCursorTiles_01:
	.incbin "graphics/interface/outline_cursor_01.4bpp"

	.align 2
OutlineCursorTiles_02:
	.incbin "graphics/interface/outline_cursor_02.4bpp"

	.align 2
OutlineCursorTiles_03:
	.incbin "graphics/interface/outline_cursor_03.4bpp"

	.align 2
OutlineCursorTiles_04:
	.incbin "graphics/interface/outline_cursor_04.4bpp"

	.align 2
OutlineCursorTiles_05:
	.incbin "graphics/interface/outline_cursor_05.4bpp"

	.align 2
OutlineCursorTiles_06:
	.incbin "graphics/interface/outline_cursor_06.4bpp"

	.align 2
OutlineCursorTiles_07:
	.incbin "graphics/interface/outline_cursor_07.4bpp"

	.align 2
OutlineCursorTiles_08:
	.incbin "graphics/interface/outline_cursor_08.4bpp"

	.align 2
OutlineCursorTiles_09:
	.incbin "graphics/interface/outline_cursor_09.4bpp"

	.align 2
OutlineCursorTiles_10:
	.incbin "graphics/interface/outline_cursor_10.4bpp"

	.align 2
OutlineCursorTiles_11:
	.incbin "graphics/interface/outline_cursor_11.4bpp"

	.align 2
OutlineCursorTiles_12:
	.incbin "graphics/interface/outline_cursor_12.4bpp"

	.align 2
OutlineCursorTiles_13:
	.incbin "graphics/interface/outline_cursor_13.4bpp"

	.align 2
OutlineCursorTiles_14:
	.incbin "graphics/interface/outline_cursor_14.4bpp"

	.align 2
OutlineCursorTiles_15:
	.incbin "graphics/interface/outline_cursor_15.4bpp"

	.incbin "baserom.gba", 0x42F11C, 0x24

	.global gUnknown_0842F140
gUnknown_0842F140: @ 842F140
	obj_tiles OutlineCursorTiles_00, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_01, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_02, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_03, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_04, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_05, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_06, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_07, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_08, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_09, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_10, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_11, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_12, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_13, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_14, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_15, 0x1C0, 0xFFF0

	.global gUnknown_0842F1C0
gUnknown_0842F1C0: @ 842F1C0
	.incbin "baserom.gba", 0x0042f1c0, 0x80

	.global gUnknown_0842F240
gUnknown_0842F240: @ 842F240
	obj_pal 0x0203a360, 0xfff0

	.global gUnknown_0842F248
gUnknown_0842F248: @ 842F248
	obj_pal 0x0203a360, 0xfff1

	.global gUnknown_0842F250
gUnknown_0842F250: @ 842F250
	.incbin "baserom.gba", 0x0042f250, 0x48

	.global gUnknown_0842F298
gUnknown_0842F298: @ 842F298
Unknown_842F298:
	.incbin "baserom.gba", 0x0042f298, 0x2C0
Unknown_842F558:
	.incbin "baserom.gba", 0x0042f558, 0x64

	.global gUnknown_0842F5BC
gUnknown_0842F5BC: @ 842F5BC
	.4byte Unknown_842F558

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
OtherText_BerryObtainedDadHasIt:
	.string "Obtained a {STR_VAR_2} BERRY!\nDad has it at PETALBURG GYM.$"

	.global gUnknown_0842F7CA
gUnknown_0842F7CA: @ 842F7CA
OtherText_BerryTransformed:
	.string "The {STR_VAR_1} BERRY transformed into\none {STR_VAR_2} BERRY.$"

	.global gUnknown_0842F7F6
gUnknown_0842F7F6: @ 842F7F6
OtherText_BerryAlreadyObtained:
	.string "The {STR_VAR_1} BERRY has already been\nobtained.$"

	.global gUnknown_0842F81E
gUnknown_0842F81E: @ 842F81E
OtherText_SpecialRibbonReceived:
	.string "A special RIBBON was awarded to your\nparty POKéMON.$"

	.global gUnknown_0842F852
gUnknown_0842F852: @ 842F852
OtherText_DexUpgraded:
	.string "The POKéDEX has been upgraded with\nthe NATIONAL MODE.$"

	.global gUnknown_0842F888
gUnknown_0842F888: @ 842F888
OtherText_RareWordAdded:
	.string "A rare word has been added.$"

	.global gUnknown_0842F8A4
gUnknown_0842F8A4: @ 842F8A4
OtherText_PokeWasSentOver:
	.string "{STR_VAR_1} was sent over!$"

	.global gUnknown_0842F8B6
gUnknown_0842F8B6: @ 842F8B6
OtherText_PartyIsFull:
	.string "Your party is full.\n{STR_VAR_1} could not be sent over.$"

	.global gUnknown_0842F8E5
gUnknown_0842F8E5: @ 842F8E5
OtherText_NewTrainerInHoenn:
	.string "A new TRAINER has arrived in HOENN.$"
OtherText_BattleTowerNewAdversary:
	.string "A new adversary has arrived in the\nBATTLE TOWER.$"

	.global gUnknown_0842F93A
gUnknown_0842F93A: @ 842F93A
OtherText_DataCannotUseVersion:
	.string "This data cannot be used in\nthis version.$"
