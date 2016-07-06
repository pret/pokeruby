@ the second big chunk of data

	.include "asm/macros.s"
	.include "constants/constants.s"

	.section .rodata

gUnknown_081E764C:: @ 81E764C
	.incbin "graphics/birch_speech/shadow.gbapal"
	.incbin "baserom.gba", 0x001e766c, 0x20

gUnknown_081E768C:: @ 81E768C
	.incbin "graphics/birch_speech/shadow.4bpp.lz"

gUnknown_081E7834:: @ 81E7834
	.incbin "baserom.gba", 0x001e7834, 0x128

gUnknown_081E795C:: @ 81E795C
	.incbin "baserom.gba", 0x001e795c, 0x10

gUnknown_081E796C:: @ 81E796C
	.space 16

gUnknown_081E797C:: @ 81E797C
Unknown_081E797C:
	.incbin "baserom.gba", 0x001e797c, 0x20
Unknown_081E799C:
	.incbin "baserom.gba", 0x001e799c, 0x10

gUnknown_081E79AC:: @ 81E79AC
	.4byte Unknown_081E799C

gUnknown_081E79B0:: @ 81E79B0
	.incbin "baserom.gba", 0x001e79b0, 0x10

gUnknown_081E79C0:: @ 81E79C0
	.incbin "baserom.gba", 0x001e79c0, 0x28

gUnknown_081E79E8:: @ 81E79E8
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
gUnknown_081E7BEC:: @ 81E7BEC
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

gUnknown_081E7C18:: @ 81E7C18
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
gUnknown_081E7C64:: @ 81E7C64
	.4byte Unknown_81E7C44
	.4byte Unknown_81E7C4C
	.4byte Unknown_81E7C54
	.4byte Unknown_81E7C5C

gUnknown_081E7C74:: @ 81E7C74
	.incbin "baserom.gba", 0x001e7c74, 0x6e0

@ 81E8354
	.include "data/graphics/pokemon/front_pic_table.s"

gUnknown_081E9114:: @ 81E9114
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
gUnknown_081EC2A4:: @ 81EC2A4
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

gUnknown_081EC3F0:: @ 81EC3F0
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
gUnknown_081ECACC:: @ 81ECACC
	.4byte Unknown_81ECAB4
	.4byte Unknown_81ECABC
	.4byte Unknown_81ECAC4

gUnknown_081ECAD8:: @ 81ECAD8
	.incbin "baserom.gba", 0x001ecad8, 0xc

@ 81ECAE4
	.include "data/graphics/trainers/back_pic_table.s"

@ 81ECAFC
	.include "data/graphics/trainers/back_pic_palette_table.s"

gUnknown_081ECB14:: @ 81ECB14
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

gUnknown_081F9574:: @ 81F9574
	.incbin "baserom.gba", 0x001f9574, 0x18

gUnknown_081F958C:: @ 81F958C
	.incbin "baserom.gba", 0x001f958c, 0x18

gUnknown_081F95A4:: @ 81F95A4
	obj_tiles 0x08e5dc2c, 4096, 0x2710

	.align 2
gUnknown_081F95AC:: @ 81F95AC
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

gUnknown_081F9674:: @ 81F9674
	.incbin "baserom.gba", 0x001f9674, 0xc

gUnknown_081F9680:: @ 81F9680
	obj_tiles 0x030041d0, 32, 0x1013

gUnknown_081F9688:: @ 81F9688
	.incbin "baserom.gba", 0x001f9688, 0x40

gUnknown_081F96C8:: @ 81F96C8
	.incbin "baserom.gba", 0x001f96c8, 0x8

gUnknown_081F96D0:: @ 81F96D0
	.incbin "baserom.gba", 0x001f96d0, 0x50

gUnknown_081F9720:: @ 81F9720
	.incbin "baserom.gba", 0x001f9720, 0x150

@ 81F9870
	.include "data/text/type_names.s"

	.align 2
gUnknown_081F98F0:: @ 81F98F0
	.incbin "baserom.gba", 0x001f98f0, 0xdc

@ 81F99CC
	.include "data/text/ability_descriptions.s"

@ 81FA248
	.include "data/text/ability_names.s"

	.align 2
gUnknown_081FA640:: @ 81FA640
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
gUnknown_081FA678:: @ 81FA678
	.4byte bc_8013B1C
	.4byte sub_8013998
	.4byte sub_8013B64
	.4byte sub_8013B64
	.4byte sub_8013BDC
	.4byte sub_8013C9C
	.4byte sub_8013C48
	.4byte sub_8013C9C
	.4byte sub_8013C9C

gStatusConditionString_PoisonJpn:: @ 81FA69C
	.string "どく$$$$$$"

gStatusConditionString_SleepJpn:: @ 81FA6A4
	.string "ねむり$$$$$"

gStatusConditionString_ParalysisJpn:: @ 81FA6AC
	.string "まひ$$$$$$"

gStatusConditionString_BurnJpn:: @ 81FA6B4
	.string "やけど$$$$$"

gStatusConditionString_IceJpn:: @ 81FA6BC
	.string "こおり$$$$$"

gStatusConditionString_ConfusionJpn:: @ 81FA6C4
	.string "こんらん$$$$"

gStatusConditionString_LoveJpn:: @ 81FA6CC
	.string "メロメロ$$$$"

	.align 2
gUnknown_081FA6D4:: @ 81FA6D4
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

gUnknown_081FA70C:: @ 81FA70C
	.incbin "baserom.gba", 0x001fa70c, 0xf

gUnknown_081FA71B:: @ 81FA71B
	.incbin "baserom.gba", 0x001fa71b, 0x4

gUnknown_081FA71F:: @ 81FA71F
	.incbin "baserom.gba", 0x001fa71f, 0x5

gUnknown_081FA724:: @ 81FA724
	.incbin "baserom.gba", 0x001fa724, 0x18

	.align 2
gUnknown_081FA73C:: @ 81FA73C
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

gUnknown_081FAB1C:: @ 81FAB1C
	.incbin "baserom.gba", 0x001fab1c, 0x34

gUnknown_081FAB50:: @ 81FAB50
	.incbin "baserom.gba", 0x001fab50, 0xc

gUnknown_081FAB5C:: @ 81FAB5C
	.incbin "baserom.gba", 0x001fab5c, 0xf0

gUnknown_081FAC4C:: @ 81FAC4C
	.incbin "baserom.gba", 0x001fac4c, 0xa3

gUnknown_081FACEF:: @ 81FACEF
	.incbin "baserom.gba", 0x001facef, 0x7

gUnknown_081FACF6:: @ 81FACF6
	.incbin "baserom.gba", 0x001facf6, 0x8

gUnknown_081FACFE:: @ 81FACFE
	.incbin "baserom.gba", 0x001facfe, 0x28

gUnknown_081FAD26:: @ 81FAD26
	.incbin "baserom.gba", 0x001fad26, 0xc

gUnknown_081FAD32:: @ 81FAD32
	.incbin "baserom.gba", 0x001fad32, 0x14

gUnknown_081FAD46:: @ 81FAD46
	.incbin "baserom.gba", 0x001fad46, 0x18

gUnknown_081FAD5E:: @ 81FAD5E
	.incbin "baserom.gba", 0x001fad5e, 0x28

gUnknown_081FAD86:: @ 81FAD86
	.incbin "baserom.gba", 0x001fad86, 0xa

gUnknown_081FAD90:: @ 81FAD90
	.incbin "baserom.gba", 0x001fad90, 0x8

	.align 2
gUnknown_081FAD98:: @ 81FAD98
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

gUnknown_081FAE7C:: @ 81FAE7C
	.incbin "baserom.gba", 0x001fae7c, 0x4

gUnknown_081FAE80:: @ 81FAE80
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW WHITE LIGHT_BLUE WHITE2}$"

gUnknown_081FAE89:: @ 81FAE89
	.incbin "baserom.gba", 0x001fae89, 0x8

gUnknown_081FAE91:: @ 81FAE91
	.incbin "baserom.gba", 0x001fae91, 0x10

	.align 2
gUnknown_081FAEA4:: @ 81FAEA4
	obj_tiles 0x08d02410, 384, 0xd6eb

gUnknown_081FAEAC:: @ 81FAEAC
	.incbin "baserom.gba", 0x001faeac, 0x60

gUnknown_081FAF0C:: @ 81FAF0C
	.incbin "baserom.gba", 0x001faf0c, 0x18

gUnknown_081FAF24:: @ 81FAF24
	.incbin "baserom.gba", 0x001faf24, 0x10

gUnknown_081FAF34:: @ 81FAF34
	.incbin "baserom.gba", 0x001faf34, 0x18

	.align 2
gUnknown_081FAF4C:: @ 81FAF4C
	.4byte 0x02008000
	.4byte 0x0200a000
	.4byte 0x0200c000
	.4byte 0x0200e000

gUnknown_081FAF5C:: @ 81FAF5C
	.incbin "baserom.gba", 0x001faf5c, 0xec

	.align 2
gUnknown_081FB048:: @ 81FB048
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

gUnknown_081FC1D0:: @ 81FC1D0
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

gUnknown_08208238:: @ 8208238
	.incbin "baserom.gba", 0x00208238, 0x4

gUnknown_0820823C:: @ 820823C
	.incbin "baserom.gba", 0x0020823c, 0x4

gUnknown_08208240:: @ 8208240
	.incbin "baserom.gba", 0x00208240, 0x4

gUnknown_08208244:: @ 8208244
	.incbin "baserom.gba", 0x00208244, 0x1f

gUnknown_08208263:: @ 8208263
	.incbin "baserom.gba", 0x00208263, 0x25

gUnknown_08208288:: @ 8208288
	.incbin "baserom.gba", 0x00208288, 0x60

gUnknown_082082E8:: @ 82082E8
	.incbin "baserom.gba", 0x002082e8, 0xa

gUnknown_082082F2:: @ 82082F2
	.incbin "baserom.gba", 0x002082f2, 0x6

gUnknown_082082F8:: @ 82082F8
	.incbin "baserom.gba", 0x002082f8, 0x6

gUnknown_082082FE:: @ 82082FE
	.incbin "baserom.gba", 0x002082fe, 0x1c

gUnknown_0820831A:: @ 820831A
	.incbin "baserom.gba", 0x0020831a, 0x1d

gUnknown_08208337:: @ 8208337
	.incbin "baserom.gba", 0x00208337, 0xd

gUnknown_08208344:: @ 8208344
	.incbin "baserom.gba", 0x00208344, 0x280

gUnknown_082085C4:: @ 82085C4
	.incbin "baserom.gba", 0x002085c4, 0x168

gUnknown_0820872C:: @ 820872C
	.incbin "baserom.gba", 0x0020872c, 0x80

gUnknown_082087AC:: @ 82087AC
	.incbin "baserom.gba", 0x002087ac, 0x18

gUnknown_082087C4:: @ 82087C4
	.incbin "baserom.gba", 0x002087c4, 0x18

gUnknown_082087DC:: @ 82087DC
	.incbin "baserom.gba", 0x002087dc, 0xa00

@ 82091DC
	.include "data/egg_moves.s"

	.align 2
gUnknown_08209AC4:: @ 8209AC4
	.4byte DaycareText_GetAlongVeryWell
	.4byte DaycareText_GetAlong
	.4byte DaycareText_DontLikeOther
	.4byte DaycareText_PlayOther

gUnknown_08209AD4:: @ 8209AD4
	.string "タマゴ$"

EggPalette:: @ 8209AD8
	.incbin "graphics/pokemon/egg/palette.gbapal"

EggHatchTiles: @ 8209AF8
	.incbin "graphics/misc/egg_hatch.4bpp"

EggShardTiles:: @ 820A2F8
	.incbin "graphics/misc/egg_shard.4bpp"

	.incbin "baserom.gba", 0x0020A378, 0x38

	.align 2
gUnknown_0820A3B0:: @ 820A3B0
	obj_tiles EggHatchTiles, 2048, 12345

	.align 2
gUnknown_0820A3B8:: @ 820A3B8
	obj_tiles EggShardTiles, 128, 23456

	.align 2
gUnknown_0820A3C0:: @ 820A3C0
	obj_pal EggPalette, 54321

gUnknown_0820A3C8:: @ 820A3C8
	.incbin "baserom.gba", 0x0020a3c8, 0x50

gUnknown_0820A418:: @ 820A418
	.incbin "baserom.gba", 0x0020a418, 0x18

gUnknown_0820A430:: @ 820A430
	.incbin "baserom.gba", 0x0020a430, 0x4c

gUnknown_0820A47C:: @ 820A47C
	obj_tiles 0x08d1f52c, 4096, 0xd6ff

gUnknown_0820A484:: @ 820A484
	obj_tiles 0x08d1f7e0, 4096, 0xd701

gUnknown_0820A48C:: @ 820A48C
	obj_tiles 0x08d1f96c, 2048, 0xd6ff

gUnknown_0820A494:: @ 820A494
	obj_tiles 0x08d1f96c, 2048, 0xd700

gUnknown_0820A49C:: @ 820A49C
	obj_tiles 0x08d1fb04, 2048, 0xd701

gUnknown_0820A4A4:: @ 820A4A4
	obj_tiles 0x08d1fb04, 2048, 0xd702

gUnknown_0820A4AC:: @ 820A4AC
	obj_tiles 0x08d1fc94, 4096, 0xd70b

gUnknown_0820A4B4:: @ 820A4B4
	obj_tiles 0x08d0314c, 256, 0xd704
	obj_tiles 0x08d0314c, 288, 0xd705
	obj_tiles 0x08d0314c, 256, 0xd706
	obj_tiles 0x08d0314c, 288, 0xd707

gUnknown_0820A4D4:: @ 820A4D4
	.incbin "baserom.gba", 0x0020a4d4, 0x18

gUnknown_0820A4EC:: @ 820A4EC
	.incbin "baserom.gba", 0x0020a4ec, 0x30

gUnknown_0820A51C:: @ 820A51C
	.incbin "baserom.gba", 0x0020a51c, 0x30

gUnknown_0820A54C:: @ 820A54C
	.incbin "baserom.gba", 0x0020a54c, 0x20

gUnknown_0820A56C:: @ 820A56C
	.incbin "baserom.gba", 0x0020a56c, 0x118

gUnknown_0820A684:: @ 820A684
	.incbin "baserom.gba", 0x0020a684, 0x60

gUnknown_0820A6E4:: @ 820A6E4
	.incbin "baserom.gba", 0x0020a6e4, 0x8

gUnknown_0820A6EC:: @ 820A6EC
	.incbin "baserom.gba", 0x0020a6ec, 0x68

gUnknown_0820A754:: @ 820A754
	obj_tiles 0x08e6a758, 512, 0xd70c
	obj_tiles 0x08e6a758, 512, 0xd70d

gUnknown_0820A764:: @ 820A764
	obj_pal 0x08d1212c, 0xd710
	obj_pal 0x08d1212c, 0xd711

gUnknown_0820A774:: @ 820A774
	obj_pal 0x08d1214c, 0xd712
	obj_pal 0x08d1214c, 0xd713

gUnknown_0820A784:: @ 820A784
	.incbin "baserom.gba", 0x0020a784, 0x20

gUnknown_0820A7A4:: @ 820A7A4
	.incbin "baserom.gba", 0x0020a7a4, 0x30

gUnknown_0820A7D4:: @ 820A7D4
	.incbin "baserom.gba", 0x0020a7d4, 0x30

gUnknown_0820A804:: @ 820A804
	.incbin "baserom.gba", 0x0020a804, 0x8

gUnknown_0820A80C:: @ 820A80C
	.incbin "baserom.gba", 0x0020a80c, 0x8

gUnknown_0820A814:: @ 820A814
	.incbin "baserom.gba", 0x0020a814, 0x8

gUnknown_0820A81C:: @ 820A81C
	.incbin "baserom.gba", 0x0020a81c, 0x20

gUnknown_0820A83C:: @ 820A83C
	.incbin "baserom.gba", 0x0020a83c, 0xc

gUnknown_0820A848:: @ 820A848
	.incbin "baserom.gba", 0x0020a848, 0xc

gUnknown_0820A854:: @ 820A854
	.incbin "baserom.gba", 0x0020a854, 0x8

gUnknown_0820A85C:: @ 820A85C
	.incbin "baserom.gba", 0x0020a85c, 0x8

gUnknown_0820A864:: @ 820A864
	.incbin "baserom.gba", 0x0020a864, 0x18

gUnknown_0820A87C:: @ 820A87C
	.incbin "baserom.gba", 0x0020a87c, 0x18

gUnknown_0820A894:: @ 820A894
	.incbin "baserom.gba", 0x0020a894, 0x8

gUnknown_0820A89C:: @ 820A89C
	.incbin "baserom.gba", 0x0020a89c, 0x14

gUnknown_0820A8B0:: @ 820A8B0
	.incbin "baserom.gba", 0x0020a8b0, 0x4

gUnknown_0820A8B4:: @ 820A8B4
	.incbin "baserom.gba", 0x0020a8b4, 0x28

gUnknown_0820A8DC:: @ 820A8DC
	.incbin "baserom.gba", 0x0020a8dc, 0x28

gUnknown_0820A904:: @ 820A904
	.incbin "baserom.gba", 0x0020a904, 0x28

gUnknown_0820A92C:: @ 820A92C @ graphics
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

gUnknown_0820A98C:: @ 820A98C
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

gUnknown_0820AAB4:: @ 820AAB4
	.incbin "baserom.gba", 0x0020aab4, 0x13c

gUnknown_0820ABF0:: @ 820ABF0
	.incbin "baserom.gba", 0x0020abf0, 0x1fe

gUnknown_0820ADEE:: @ 820ADEE
	.incbin "baserom.gba", 0x0020adee, 0x1fe

gUnknown_0820AFEC:: @ 820AFEC
	.incbin "baserom.gba", 0x0020afec, 0x800

gUnknown_0820B7EC:: @ 820B7EC
	.incbin "baserom.gba", 0x0020b7ec, 0x890

gUnknown_0820C07C:: @ 820C07C
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

gUnknown_0820C0E4:: @ 820C0E4
	obj_pal 0x0820c03c, 0x133d

gUnknown_0820C0EC:: @ 820C0EC
	.incbin "baserom.gba", 0x0020c0ec, 0x38

gUnknown_0820C124:: @ 820C124
	obj_tiles 0x08ea1dec, 2048, 0x012c

gUnknown_0820C12C:: @ 820C12C
	obj_pal 0x08ea0328, 0x0929

gUnknown_0820C134:: @ 820C134
	.incbin "baserom.gba", 0x0020c134, 0x18

	.align 2
gUnknown_0820C14C:: @ 820C14C
	.4byte TradeText_Cancel
	.4byte TradeText_ChoosePoke
	.4byte TradeText_Summary1
	.4byte TradeText_Trade1
	.4byte TradeText_CancelTradePrompt
	.4byte TradeText_PressBToExit

gUnknown_0820C164:: @ 820C164
	.incbin "baserom.gba", 0x0020c164, 0x138

gUnknown_0820C29C:: @ 820C29C
	.incbin "baserom.gba", 0x0020c29c, 0x1a

gUnknown_0820C2B6:: @ 820C2B6
	.incbin "baserom.gba", 0x0020c2b6, 0x18

gUnknown_0820C2CE:: @ 820C2CE
	.incbin "baserom.gba", 0x0020c2ce, 0x18

gUnknown_0820C2E6:: @ 820C2E6
	.incbin "baserom.gba", 0x0020c2e6, 0x3

gUnknown_0820C2E9:: @ 820C2E9
	.incbin "baserom.gba", 0x0020c2e9, 0x7

	.align 2
gUnknown_0820C2F0:: @ 820C2F0
	.4byte TradeText_LinkStandby
	.4byte TradeText_TradeCancelled
	.4byte TradeText_OnlyPoke
	.4byte TradeText_NonTradablePoke
	.4byte TradeText_WaitingForFriend
	.4byte TradeText_WantToTrade

gUnknown_0820C308:: @ 820C308
	.incbin "baserom.gba", 0x0020c308, 0x18

	.align 2
gUnknown_0820C320:: @ 820C320
	.4byte TradeText_Summary2
	.4byte sub_804A9F4 @unknown
	.4byte TradeText_Trade2
	.4byte sub_804AA00

gUnknown_0820C330:: @ 820C330
	.incbin "baserom.gba", 0x0020c330, 0x4

gUnknown_0820C334:: @ 820C334
	.incbin "baserom.gba", 0x0020c334, 0x1

gUnknown_0820C335:: @ 820C335
	.incbin "baserom.gba", 0x0020c335, 0x7

gUnknown_0820C33C::
	.string "$"

gUnknown_0820C33D:: @ 820C33D
OtherText_MaleSymbol3:
	.string "♂$"

gUnknown_0820C33F:: @ 820C33F
OtherText_FemaleSymbol3:
	.string "♀$"

gUnknown_0820C341:: @ 820C341
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
gUnknown_0820C3B0:: @ 820C3B0
	.string "ヌケニン$"

	.string "こうかんせいりつ     $" @ trade completed
	.string "だめだたらしいよ     $" @ it's no good (trade failed maybe?)

gUnknown_0820C3D1:: @ 820C3D1
	.incbin "baserom.gba", 0x0020c3d1, 0x7
	.incbin "graphics/interface/ball_open.gbapal"
	.incbin "graphics/interface/rolling_ball.4bpp"

gUnknown_0820C9F8:: @ 820C9F8
	.incbin "baserom.gba", 0x0020c9f8, 0x20
	.incbin "graphics/interface/gba.gbapal"
	.incbin "graphics/interface/trade_shadow.gbapal"
	.incbin "baserom.gba", 0x0020ca58, 0x20 @ blank
	.incbin "graphics/interface/trade_misc.gbapal"

gUnknown_0820CA98:: @ 820CA98
	.incbin "graphics/interface/gba.4bpp"
	.incbin "graphics/interface/trade_shadow.4bpp"

gUnknown_0820DD98:: @ 820DD98
	.incbin "graphics/unknown/unknown_20DD98.8bpp" @ unused?

gUnknown_0820F798:: @ 820F798
	.incbin "baserom.gba", 0x0020f798, 0x1000

gUnknown_08210798:: @ 8210798
	.incbin "baserom.gba", 0x00210798, 0x1000 @ debug?

gUnknown_08211798:: @ 8211798
	.incbin "baserom.gba", 0x00211798, 0x800

gUnknown_08211F98:: @ 8211F98
	.incbin "baserom.gba", 0x00211f98, 0x20 @ bunch of palettes?
	.incbin "baserom.gba", 0x00211fb8, 0x20
	.incbin "baserom.gba", 0x00211fd8, 0x20
	.incbin "baserom.gba", 0x00211FF8, 0x20
	.incbin "baserom.gba", 0x00212018, 0x20
	.incbin "baserom.gba", 0x00212038, 0x20
	.incbin "baserom.gba", 0x00212058, 0x20
	.incbin "graphics/interface/gba2.gbapal"
	.incbin "graphics/interface/trade_glow.4bpp"
	.incbin "graphics/interface/trade_glow2.4bpp"
	.incbin "graphics/interface/trade_cableend.4bpp"
	.incbin "graphics/interface/trade_gbascreen.4bpp"

gUnknown_08213738:: @ 8213738
	.incbin "graphics/interface/gba2.8bpp"

gUnknown_08215778:: @ 8215778
	.incbin "baserom.gba", 0x00215778, 0x1d4

gUnknown_0821594C:: @ 821594C
	obj_tiles 0x0820c3f8, 1536, 0x15b5

gUnknown_08215954:: @ 8215954
	obj_pal 0x0820c3d8, 0x15b6

gUnknown_0821595C:: @ 821595C
	.incbin "baserom.gba", 0x0021595c, 0x48

gUnknown_082159A4:: @ 82159A4
	obj_tiles 0x08212138, 512, 0x15ae

gUnknown_082159AC:: @ 82159AC
	obj_pal 0x08212118, 0x15af

gUnknown_082159B4:: @ 82159B4
	obj_pal 0x082120b8, 0x15b3

gUnknown_082159BC:: @ 82159BC
	.incbin "baserom.gba", 0x002159bc, 0x38

gUnknown_082159F4:: @ 82159F4
	obj_tiles 0x08212338, 768, 0x15b0

gUnknown_082159FC:: @ 82159FC
	.incbin "baserom.gba", 0x002159fc, 0x2c

gUnknown_08215A28:: @ 8215A28
	obj_tiles 0x08212538, 256, 0x15b2

gUnknown_08215A30:: @ 8215A30
	.incbin "baserom.gba", 0x00215a30, 0x48

gUnknown_08215A78:: @ 8215A78
	obj_tiles 0x08212738, 4096, 0x15b4

gUnknown_08215A80:: @ 8215A80
	.incbin "baserom.gba", 0x00215a80, 0x18

gUnknown_08215A98:: @ 8215A98
	.incbin "baserom.gba", 0x00215a98, 0x18
Unknown_08215AB0:
	.incbin "baserom.gba", 0x00215ab0, 0x10

gUnknown_08215AC0:: @ 8215AC0
	.4byte Unknown_08215AB0

gUnknown_08215AC4:: @ 8215AC4
	.incbin "baserom.gba", 0x00215ac4, 0xb4

gUnknown_08215B78:: @ 8215B78
	.incbin "baserom.gba", 0x00215b78, 0x28

gUnknown_08215BA0:: @ 8215BA0
	.incbin "baserom.gba", 0x00215ba0, 0x6c

gUnknown_08215C0C:: @ 8215C0C
	.incbin "baserom.gba", 0x00215c0c, 0x20

gUnknown_08215C2C:: @ 8215C2C
	.incbin "baserom.gba", 0x00215c2c, 0x400

gUnknown_0821602C:: @ 821602C
	.incbin "baserom.gba", 0x0021602c, 0x21d

gUnknown_08216249:: @ 8216249
	.string "\p$"

@ unreferenced
@ These appear to be the first names of four people who worked on the game.
	.string "てつじ$", 10 @ Tetsuji (Ohta)
	.string "あきと$", 10 @ Akito (Mori)
	.string "シゲル$", 10 @ Shigeru (Ohmori)
	.string "ヨシノリ$", 10 @ Yoshinori (Matsuda)

UnknownText_2Pok:
	.string "2Pok$"
UnknownText_3Pok:
	.string "3Pok$"
UnknownText_4Pok:
	.string "4Pok$"

	.align 2
gUnknown_08216284:: @ 8216284
	.4byte UnknownText_2Pok
	.4byte UnknownText_3Pok
	.4byte UnknownText_4Pok

@ unreferenced
	.string "1P$", 4
	.string "2P$", 4
	.string "3P$", 4
	.string "4P$", 4

UnknownText_Mister:
	.string "MISTER$"
UnknownText_Laddie:
	.string "LADDIE$"
UnknownText_Lassie:
	.string "LASSIE$"

	.align 2
gUnknown_082162B8:: @ 82162B8
	.4byte UnknownText_Mister
	.4byte UnknownText_Laddie
	.4byte UnknownText_Lassie

gUnknown_082162C4:: @ 82162C4
	.string "{COLOR RED}$"

gUnknown_082162C8:: @ 82162C8
	.string "\n$"

	.string " $"

gUnknown_082162CC:: @ 82162CC
	.byte -1, -1
	.byte  1, -1
	.byte -1,  1
	.byte  1,  1

gUnknown_082162D4:: @ 82162D4
	.byte  2,  6
	.byte 23,  6
	.byte  2, 12
	.byte 23, 12
	.byte  1,  6
	.byte 22,  6
	.byte  1, 12
	.byte 22, 12

gUnknown_082162E4:: @ 82162E4
	.byte  72,  32
	.byte 168,  32
	.byte  72, 128
	.byte 168, 128

gUnknown_082162EC:: @ 82162EC
	.incbin "baserom.gba", 0x002162ec, 0xc

gUnknown_082162F8:: @ 82162F8
	.incbin "baserom.gba", 0x002162f8, 0x8

gUnknown_08216300:: @ 8216300
	.incbin "baserom.gba", 0x00216300, 0x3

gUnknown_08216303:: @ 8216303
	.incbin "baserom.gba", 0x00216303, 0x5

gUnknown_08216308:: @ 8216308
	.incbin "baserom.gba", 0x00216308, 0xd4

gUnknown_082163DC:: @ 82163DC
	obj_tiles 0x08e91618, 2048, 0xb5d1

gUnknown_082163E4:: @ 82163E4
	obj_pal 0x08e920d8, 0xb5d2

gUnknown_082163EC:: @ 82163EC
	obj_pal 0x08e920f8, 0x3018

gUnknown_082163F4:: @ 82163F4
	.incbin "baserom.gba", 0x002163f4, 0x60

gUnknown_08216454:: @ 8216454
	obj_tiles 0x08e90618, 512, 0xbef8

gUnknown_0821645C:: @ 821645C
	.incbin "baserom.gba", 0x0021645c, 0x98

gUnknown_082164F4:: @ 82164F4
	obj_tiles 0x08e90818, 224, 0x5ba0

gUnknown_082164FC:: @ 82164FC
	.incbin "baserom.gba", 0x002164fc, 0x44

gUnknown_08216540:: @ 8216540
	obj_tiles 0x08e90a18, 1536, 0x3039

gUnknown_08216548:: @ 8216548
	.incbin "baserom.gba", 0x00216548, 0x2c

gUnknown_08216574:: @ 8216574
	obj_tiles 0x08e91018, 1024, 0x303a

gUnknown_0821657C:: @ 821657C
	.incbin "baserom.gba", 0x0021657c, 0x18

gUnknown_08216594:: @ 8216594
	.incbin "baserom.gba", 0x00216594, 0x28

gUnknown_082165BC:: @ 82165BC
	.incbin "baserom.gba", 0x002165bc, 0x1e

gUnknown_082165DA:: @ 82165DA
	.incbin "baserom.gba", 0x002165da, 0x5

gUnknown_082165DF:: @ 82165DF
	.incbin "baserom.gba", 0x002165df, 0xa

gUnknown_082165E9:: @ 82165E9
	.incbin "baserom.gba", 0x002165e9, 0x5

gUnknown_082165EE:: @ 82165EE
	.incbin "baserom.gba", 0x002165ee, 0x5

gUnknown_082165F3:: @ 82165F3
	.incbin "baserom.gba", 0x002165f3, 0x5

gUnknown_082165F8:: @ 82165F8
	.incbin "baserom.gba", 0x002165f8, 0x2

gUnknown_082165FA:: @ 82165FA
OtherText_BPM:
	.string "BPM$"
OtherText_Dash:
	.string "-$"

gUnknown_08216600:: @ 8216600
	.incbin "baserom.gba", 0x00216600, 0x4

gUnknown_08216604:: @ 8216604
	.incbin "baserom.gba", 0x00216604, 0x20

gUnknown_08216624:: @ 8216624
	.incbin "baserom.gba", 0x00216624, 0x28

gUnknown_0821664C:: @ 821664C
	.incbin "baserom.gba", 0x0021664c, 0x48

gUnknown_08216694:: @ 8216694
	.incbin "baserom.gba", 0x00216694, 0xc

	.align 2
gUnknown_082166A0:: @ 82166A0
	.4byte sub_8055C68
	.4byte sub_8055C88
	.4byte sub_8055C8C

	.align 2
gUnknown_082166AC:: @ 82166AC
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
gUnknown_082166D8:: @ 82166D8
	.4byte sub_8055D30
	.4byte sub_8055D38

@ 82166E0
	.include "data/tilesets/graphics.s"

@ 8259C1C
	.include "data/tilesets/metatiles.s"

@ 8286CF4
	.include "data/tilesets/headers.s"

	.include "data/maps/_assets.s"

gUnknown_08304F18:: @ 8304F18
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

	.align 2
gUnknown_08308588:: @ 8308588
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
	.include "data/maps/SootopolisCity/connections.s"
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

gUnknown_08308E28:: @ 8308E28
	.space 4

gUnknown_08308E2C:: @ 8308E2C
	.incbin "baserom.gba", 0x00308e2c, 0x6a50

gUnknown_0830F87C:: @ 830F87C
	.incbin "baserom.gba", 0x0030f87c, 0x14

gUnknown_0830F890:: @ 830F890
	.incbin "baserom.gba", 0x0030f890, 0x124

gUnknown_0830F9B4:: @ 830F9B4
	.incbin "baserom.gba", 0x0030f9b4, 0x1a4

	.align 2
gUnknown_0830FB58:: @ 830FB58
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
gUnknown_0830FBA0:: @ 830FBA0
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
gUnknown_0830FBEC:: @ 830FBEC
	.4byte PlayerNotOnBikeNotMoving
	.4byte PlayerNotOnBikeTurningInPlace
	.4byte sub_8058D0C

	.align 2
gUnknown_0830FBF8:: @ 830FBF8
	.4byte MetatileBehavior_IsBumpySlope
	.4byte MetatileBehavior_IsIsolatedVerticalRail
	.4byte MetatileBehavior_IsIsolatedHorizontalRail
	.4byte MetatileBehavior_IsVerticalRail
	.4byte MetatileBehavior_IsHorizontalRail

gUnknown_0830FC0C:: @ 830FC0C
	.incbin "baserom.gba", 0x0030fc0c, 0x8

	.align 2
gUnknown_0830FC14:: @ 830FC14
	.4byte PlayerAvatarTransition_Normal
	.4byte PlayerAvatarTransition_MachBike
	.4byte PlayerAvatarTransition_AcroBike
	.4byte PlayerAvatarTransition_Surfing
	.4byte PlayerAvatarTransition_Underwater
	.4byte sub_80591F4
	.4byte nullsub_49
	.4byte nullsub_49

	.align 2
gUnknown_0830FC34:: @ 830FC34
	.4byte MetatileBehavior_IsSouthArrowWarp
	.4byte MetatileBehavior_IsNorthArrowWarp
	.4byte MetatileBehavior_IsWestArrowWarp
	.4byte MetatileBehavior_IsEastArrowWarp

gUnknown_0830FC44:: @ 830FC44
	.incbin "baserom.gba", 0x0030fc44, 0x10

gUnknown_0830FC54:: @ 830FC54
	.incbin "baserom.gba", 0x0030fc54, 0x10

gUnknown_0830FC64:: @ 830FC64
	.incbin "baserom.gba", 0x0030fc64, 0x14

	.align 2
gUnknown_0830FC78:: @ 830FC78
	.4byte MetatileBehavior_IsSouthArrowWarp
	.4byte MetatileBehavior_IsNorthArrowWarp
	.4byte MetatileBehavior_IsWestArrowWarp
	.4byte MetatileBehavior_IsEastArrowWarp

	.align 2
gUnknown_0830FC88:: @ 830FC88
	.4byte sub_8059E84
	.4byte sub_8059EA4
	.4byte sub_8059F40

gUnknown_0830FC94:: @ 830FC94
	.4byte sub_805A000

	.align 2
gUnknown_0830FC98:: @ 830FC98
	.4byte sub_805A0D8
	.4byte sub_805A100
	.4byte sub_805A178
	.4byte sub_805A1B8

gUnknown_0830FCA8:: @ 830FCA8
	.incbin "baserom.gba", 0x0030fca8, 0x4

gUnknown_0830FCAC:: @ 830FCAC
	.incbin "baserom.gba", 0x0030fcac, 0x8

	.align 2
gUnknown_0830FCB4:: @ 830FCB4
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

gUnknown_0830FCF4:: @ 830FCF4
	.incbin "baserom.gba", 0x0030fcf4, 0x6

gUnknown_0830FCFA:: @ 830FCFA
	.incbin "baserom.gba", 0x0030fcfa, 0x6

gUnknown_0830FD00:: @ 830FD00
	.incbin "baserom.gba", 0x0030fd00, 0x2

gUnknown_0830FD02:: @ 830FD02
	.incbin "baserom.gba", 0x0030fd02, 0x6

gUnknown_0830FD08:: @ 830FD08
	.incbin "baserom.gba", 0x0030fd08, 0xc

gUnknown_0830FD14:: @ 830FD14
	.incbin "baserom.gba", 0x0030fd14, 0x10

gUnknown_0830FD24:: @ 830FD24
	.incbin "baserom.gba", 0x0030fd24, 0x18

	.align 2
gUnknown_0830FD3C:: @ 830FD3C
	.4byte CameraObject_0
	.4byte CameraObject_1
	.4byte CameraObject_2

@ 830FD48
	.include "data/graphics/field_objects/map_object_graphics.s"

@ 8368528
	.include "data/graphics/field_objects/field_effect_object_graphics.s"

	.align 2
gUnknown_0836DA88:: @ 836DA88
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

gUnknown_0836DBBC:: @ 836DBBC
	.incbin "baserom.gba", 0x0036dbbc, 0x4d

gUnknown_0836DC09:: @ 836DC09
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

gUnknown_0837377C:: @ 837377C
	.incbin "baserom.gba", 0x0037377c, 0xf8

gUnknown_08373874:: @ 8373874
	.incbin "baserom.gba", 0x00373874, 0x70

gUnknown_083738E4:: @ 83738E4
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
gUnknown_0837399C:: @ 837399C
	.4byte Unknown_837394C
	.4byte Unknown_8373960
	.4byte Unknown_8373974
	.4byte Unknown_8373988

@ 83739AC
	.include "data/graphics/field_objects/berry_tree_graphics_tables.s"

@ 8374524
	.include "data/graphics/field_objects/field_effect_objects.s"

gUnknown_0837520C:: @ 837520C
	.incbin "baserom.gba", 0x0037520c, 0x10

gUnknown_0837521C:: @ 837521C
	.incbin "baserom.gba", 0x0037521c, 0x8

	.align 2
gUnknown_08375224:: @ 8375224
	.4byte sub_805C8F0
	.4byte sub_805C904
	.4byte sub_805C930
	.4byte sub_805C96C
	.4byte sub_805C98C
	.4byte sub_805C9D8
	.4byte sub_805CA08

gUnknown_08375240:: @ 8375240
	.incbin "baserom.gba", 0x00375240, 0x4

	.align 2
gUnknown_08375244:: @ 8375244
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
gUnknown_08375270:: @ 8375270
	.4byte sub_805CE2C
	.4byte sub_805CE40
	.4byte sub_805CE6C
	.4byte sub_805CEB0
	.4byte sub_805CEE0

	.align 2
gUnknown_08375284:: @ 8375284
	.4byte sub_805CF6C
	.4byte sub_805CF80
	.4byte sub_805CFAC
	.4byte sub_805CFE8
	.4byte sub_805D008
	.4byte sub_805D054
	.4byte sub_805D084

gUnknown_083752A0:: @ 83752A0
	.incbin "baserom.gba", 0x003752a0, 0x4

	.align 2
gUnknown_083752A4:: @ 83752A4
	.4byte sub_805D0F0
	.4byte sub_805D104
	.4byte sub_805D130
	.4byte sub_805D16C
	.4byte sub_805D18C
	.4byte sub_805D1D8
	.4byte sub_805D208

gUnknown_083752C0:: @ 83752C0
	.incbin "baserom.gba", 0x003752c0, 0x4

	.align 2
gUnknown_083752C4:: @ 83752C4
	.4byte sub_805D274
	.4byte sub_805D2A0
	.4byte sub_805D2C0

	.align 2
gUnknown_083752D0:: @ 83752D0
	.4byte do_berry_tree_growth_sparkle_1
	.4byte sub_805D3EC
	.4byte do_berry_tree_growth_sparkle_2
	.4byte sub_805D458
	.4byte sub_805D4A8

	.align 2
gUnknown_083752E4:: @ 83752E4
	.4byte sub_805D538
	.4byte sub_805D54C
	.4byte sub_805D578
	.4byte sub_805D5BC
	.4byte sub_805D5EC

	.align 2
gUnknown_083752F8:: @ 83752F8
	.4byte sub_805D678
	.4byte sub_805D68C
	.4byte sub_805D6B8
	.4byte sub_805D6FC
	.4byte sub_805D72C

	.align 2
gUnknown_0837530C:: @ 837530C
	.4byte sub_805D7B8
	.4byte sub_805D7CC
	.4byte sub_805D7F8
	.4byte sub_805D83C
	.4byte sub_805D86C

gUnknown_08375320:: @ 8375320
	.incbin "baserom.gba", 0x00375320, 0x4

	.align 2
gUnknown_08375324:: @ 8375324
	.4byte sub_805D8F8
	.4byte sub_805D90C
	.4byte sub_805D938
	.4byte sub_805D97C
	.4byte sub_805D9AC

gUnknown_08375338:: @ 8375338
	.incbin "baserom.gba", 0x00375338, 0x4

	.align 2
gUnknown_0837533C:: @ 837533C
	.4byte sub_805DA38
	.4byte sub_805DA4C
	.4byte sub_805DA78
	.4byte sub_805DABC
	.4byte sub_805DAEC

gUnknown_08375350:: @ 8375350
	.incbin "baserom.gba", 0x00375350, 0x4

	.align 2
gUnknown_08375354:: @ 8375354
	.4byte sub_805DB78
	.4byte sub_805DB8C
	.4byte sub_805DBB8
	.4byte sub_805DBFC
	.4byte sub_805DC2C

gUnknown_08375368:: @ 8375368
	.incbin "baserom.gba", 0x00375368, 0x4

	.align 2
gUnknown_0837536C:: @ 837536C
	.4byte sub_805DCB8
	.4byte sub_805DCCC
	.4byte sub_805DCF8
	.4byte sub_805DD3C
	.4byte sub_805DD6C

gUnknown_08375380:: @ 8375380
	.incbin "baserom.gba", 0x00375380, 0x4

	.align 2
gUnknown_08375384:: @ 8375384
	.4byte sub_805DDF8
	.4byte sub_805DE0C
	.4byte sub_805DE38
	.4byte sub_805DE7C
	.4byte sub_805DEAC

gUnknown_08375398:: @ 8375398
	.incbin "baserom.gba", 0x00375398, 0x4

	.align 2
gUnknown_0837539C:: @ 837539C
	.4byte sub_805DF38
	.4byte sub_805DF4C
	.4byte sub_805DF78
	.4byte sub_805DFBC
	.4byte sub_805DFEC

gUnknown_083753B0:: @ 83753B0
	.incbin "baserom.gba", 0x003753b0, 0x4

	.align 2
gUnknown_083753B4:: @ 83753B4
	.4byte sub_805E078
	.4byte sub_805E08C
	.4byte sub_805E0B8
	.4byte sub_805E0FC
	.4byte sub_805E12C

gUnknown_083753C8:: @ 83753C8
	.incbin "baserom.gba", 0x003753c8, 0x4

	.align 2
gUnknown_083753CC:: @ 83753CC
	.4byte sub_805E1B8
	.4byte sub_805E1E4
	.4byte sub_805E208
	.4byte sub_805E234

gUnknown_083753DC:: @ 83753DC
	.incbin "baserom.gba", 0x003753dc, 0x8

	.align 2
gUnknown_083753E4:: @ 83753E4
	.4byte sub_805E2BC
	.4byte sub_805E2E8
	.4byte sub_805E30C
	.4byte sub_805E338

gUnknown_083753F4:: @ 83753F4
	.incbin "baserom.gba", 0x003753f4, 0x8

	.align 2
gUnknown_083753FC:: @ 83753FC
	.4byte sub_805E3C0
	.4byte sub_805E3D4
	.4byte sub_805E40C
	.4byte sub_805E4C4

	.align 2
gUnknown_0837540C:: @ 837540C
	.4byte sub_805E4EC
	.4byte sub_805E620
	.4byte sub_805E5B4

gUnknown_08375418:: @ 8375418
	.incbin "baserom.gba", 0x00375418, 0x4

	.align 2
gUnknown_0837541C:: @ 837541C
	.4byte sub_805E4EC
	.4byte sub_805E6AC
	.4byte sub_805E5B4

	.align 2
gUnknown_08375428:: @ 8375428
	.4byte 0x02010304

gUnknown_0837542C:: @ 837542C
	.4byte sub_805E4EC
	.4byte sub_805E738
	.4byte sub_805E5B4

gUnknown_08375438:: @ 8375438
	.incbin "baserom.gba", 0x00375438, 0x4

	.align 2
gUnknown_0837543C:: @ 837543C
	.4byte sub_805E4EC
	.4byte sub_805E7C4
	.4byte sub_805E5B4

gUnknown_08375448:: @ 8375448
	.incbin "baserom.gba", 0x00375448, 0x4

	.align 2
gUnknown_0837544C:: @ 837544C
	.4byte sub_805E4EC
	.4byte sub_805E850
	.4byte sub_805E5B4

gUnknown_08375458:: @ 8375458
	.incbin "baserom.gba", 0x00375458, 0x4

	.align 2
gUnknown_0837545C:: @ 837545C
	.4byte sub_805E4EC
	.4byte sub_805E8DC
	.4byte sub_805E5B4

gUnknown_08375468:: @ 8375468
	.4byte 0x02010403

	.align 2
gUnknown_0837546C:: @ 837546C
	.4byte sub_805E4EC
	.4byte sub_805E968
	.4byte sub_805E5B4

	.align 2
gUnknown_08375478:: @ 8375478
	.4byte sub_805E4EC
	.4byte sub_805E9F4
	.4byte sub_805E5B4

gUnknown_08375484:: @ 8375484
	.incbin "baserom.gba", 0x00375484, 0x4

	.align 2
gUnknown_08375488:: @ 8375488
	.4byte sub_805E4EC
	.4byte sub_805EA80
	.4byte sub_805E5B4

gUnknown_08375494:: @ 8375494
	.incbin "baserom.gba", 0x00375494, 0x4

	.align 2
gUnknown_08375498:: @ 8375498
	.4byte sub_805E4EC
	.4byte sub_805EB0C
	.4byte sub_805E5B4

gUnknown_083754A4:: @ 83754A4
	.incbin "baserom.gba", 0x003754a4, 0x4

	.align 2
gUnknown_083754A8:: @ 83754A8
	.4byte sub_805E4EC
	.4byte sub_805EB98
	.4byte sub_805E5B4

gUnknown_083754B4:: @ 83754B4
	.incbin "baserom.gba", 0x003754b4, 0x4

	.align 2
gUnknown_083754B8:: @ 83754B8
	.4byte sub_805E4EC
	.4byte sub_805EC24
	.4byte sub_805E5B4

gUnknown_083754C4:: @ 83754C4
	.4byte 0x02030401

	.align 2
gUnknown_083754C8:: @ 83754C8
	.4byte sub_805E4EC
	.4byte sub_805ECB0
	.4byte sub_805E5B4

gUnknown_083754D4:: @ 83754D4
	.incbin "baserom.gba", 0x003754d4, 0x4

	.align 2
gUnknown_083754D8:: @ 83754D8
	.4byte sub_805E4EC
	.4byte sub_805ED3C
	.4byte sub_805E5B4

gUnknown_083754E4:: @ 83754E4
	.incbin "baserom.gba", 0x003754e4, 0x4

	.align 2
gUnknown_083754E8:: @ 83754E8
	.4byte sub_805E4EC
	.4byte sub_805EDC8
	.4byte sub_805E5B4

gUnknown_083754F4:: @ 83754F4
	.incbin "baserom.gba", 0x003754f4, 0x4

	.align 2
gUnknown_083754F8:: @ 83754F8
	.4byte sub_805E4EC
	.4byte sub_805EE54
	.4byte sub_805E5B4

gUnknown_08375504:: @ 8375504
	.incbin "baserom.gba", 0x00375504, 0x4

	.align 2
gUnknown_08375508:: @ 8375508
	.4byte sub_805E4EC
	.4byte sub_805EEE0
	.4byte sub_805E5B4

gUnknown_08375514:: @ 8375514
	.incbin "baserom.gba", 0x00375514, 0x4

	.align 2
gUnknown_08375518:: @ 8375518
	.4byte sub_805E4EC
	.4byte sub_805EF6C
	.4byte sub_805E5B4

gUnknown_08375524:: @ 8375524
	.incbin "baserom.gba", 0x00375524, 0x4

	.align 2
gUnknown_08375528:: @ 8375528
	.4byte sub_805E4EC
	.4byte sub_805EFF8
	.4byte sub_805E5B4

gUnknown_08375534:: @ 8375534
	.incbin "baserom.gba", 0x00375534, 0x4

	.align 2
gUnknown_08375538:: @ 8375538
	.4byte sub_805E4EC
	.4byte sub_805F084
	.4byte sub_805E5B4

gUnknown_08375544:: @ 8375544
	.incbin "baserom.gba", 0x00375544, 0x4

	.align 2
gUnknown_08375548:: @ 8375548
	.4byte sub_805E4EC
	.4byte sub_805F110
	.4byte sub_805E5B4

gUnknown_08375554:: @ 8375554
	.incbin "baserom.gba", 0x00375554, 0x4

	.align 2
gUnknown_08375558:: @ 8375558
	.4byte sub_805E4EC
	.4byte sub_805F19C
	.4byte sub_805E5B4

gUnknown_08375564:: @ 8375564
	.incbin "baserom.gba", 0x00375564, 0x4

	.align 2
gUnknown_08375568:: @ 8375568
	.4byte sub_805E4EC
	.4byte sub_805F228
	.4byte sub_805E5B4

gUnknown_08375574:: @ 8375574
	.incbin "baserom.gba", 0x00375574, 0x4

	.align 2
gUnknown_08375578:: @ 8375578
	.4byte sub_805E4EC
	.4byte sub_805F2B4
	.4byte sub_805E5B4

	.align 2
gUnknown_08375584:: @ 8375584
	.4byte 0x02030104

	.align 2
gUnknown_08375588:: @ 8375588
	.4byte mss_npc_reset_oampriv3_1_unk2_unk3
	.4byte sub_805F364
	.4byte sub_805F3C4

	.align 2
gUnknown_08375594:: @ 8375594
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
gUnknown_083755C0:: @ 83755C0
	.4byte mss_npc_reset_oampriv3_1_unk2_unk3
	.4byte mss_08062EA4
	.4byte sub_805F3C4

	.align 2
gUnknown_083755CC:: @ 83755CC
	.4byte sub_805FAF8

	.align 2
gUnknown_083755D0:: @ 83755D0
	.4byte sub_805FB64
	.4byte sub_805FB04

	.align 2
gUnknown_083755D8:: @ 83755D8
	.4byte sub_805FBD4
	.4byte sub_805FB04

	.align 2
gUnknown_083755E0:: @ 83755E0
	.4byte sub_805FC44
	.4byte sub_805FB04

	.align 2
gUnknown_083755E8:: @ 83755E8
	.4byte sub_805FCB4
	.4byte sub_805FCE8
	.4byte sub_805FD08

gUnknown_083755F4:: @ 83755F4
	.incbin "baserom.gba", 0x003755f4, 0x9

gUnknown_083755FD:: @ 83755FD
	.incbin "baserom.gba", 0x003755fd, 0x9

gUnknown_08375606:: @ 8375606
	.incbin "baserom.gba", 0x00375606, 0x9

gUnknown_0837560F:: @ 837560F
	.incbin "baserom.gba", 0x0037560f, 0x9

gUnknown_08375618:: @ 8375618
	.incbin "baserom.gba", 0x00375618, 0x9

gUnknown_08375621:: @ 8375621
	.incbin "baserom.gba", 0x00375621, 0x9

gUnknown_0837562A:: @ 837562A
	.incbin "baserom.gba", 0x0037562a, 0x9

gUnknown_08375633:: @ 8375633
	.incbin "baserom.gba", 0x00375633, 0x9

gUnknown_0837563C:: @ 837563C
	.incbin "baserom.gba", 0x0037563c, 0x9

gUnknown_08375645:: @ 8375645
	.incbin "baserom.gba", 0x00375645, 0x9

gUnknown_0837564E:: @ 837564E
	.incbin "baserom.gba", 0x0037564e, 0x9

gUnknown_08375657:: @ 8375657
	.incbin "baserom.gba", 0x00375657, 0x9

gUnknown_08375660:: @ 8375660
	.incbin "baserom.gba", 0x00375660, 0x9

gUnknown_08375669:: @ 8375669
	.incbin "baserom.gba", 0x00375669, 0x9

gUnknown_08375672:: @ 8375672
	.incbin "baserom.gba", 0x00375672, 0x9

gUnknown_0837567B:: @ 837567B
	.incbin "baserom.gba", 0x0037567b, 0x9

	.align 2
gUnknown_08375684:: @ 8375684
	.4byte MetatileBehavior_IsSouthBlocked
	.4byte MetatileBehavior_IsNorthBlocked
	.4byte MetatileBehavior_IsWestBlocked
	.4byte MetatileBehavior_IsEastBlocked

	.align 2
gUnknown_08375694:: @ 8375694
	.4byte MetatileBehavior_IsNorthBlocked
	.4byte MetatileBehavior_IsSouthBlocked
	.4byte MetatileBehavior_IsEastBlocked
	.4byte MetatileBehavior_IsWestBlocked

gUnknown_083756A4:: @ 83756A4
	.incbin "baserom.gba", 0x003756a4, 0x24

gUnknown_083756C8:: @ 83756C8
	.incbin "baserom.gba", 0x003756c8, 0x5

gUnknown_083756CD:: @ 83756CD
	.incbin "baserom.gba", 0x003756cd, 0x5

gUnknown_083756D2:: @ 83756D2
	.incbin "baserom.gba", 0x003756d2, 0x5

gUnknown_083756D7:: @ 83756D7
	.incbin "baserom.gba", 0x003756d7, 0x5

gUnknown_083756DC:: @ 83756DC
	.incbin "baserom.gba", 0x003756dc, 0x5

gUnknown_083756E1:: @ 83756E1
	.incbin "baserom.gba", 0x003756e1, 0x5

gUnknown_083756E6:: @ 83756E6
	.incbin "baserom.gba", 0x003756e6, 0x5

gUnknown_083756EB:: @ 83756EB
	.incbin "baserom.gba", 0x003756eb, 0x5

gUnknown_083756F0:: @ 83756F0
	.incbin "baserom.gba", 0x003756f0, 0x5

gUnknown_083756F5:: @ 83756F5
	.incbin "baserom.gba", 0x003756f5, 0x5

gUnknown_083756FA:: @ 83756FA
	.incbin "baserom.gba", 0x003756fa, 0x5

gUnknown_083756FF:: @ 83756FF
	.incbin "baserom.gba", 0x003756ff, 0x5

gUnknown_08375704:: @ 8375704
	.incbin "baserom.gba", 0x00375704, 0x5

gUnknown_08375709:: @ 8375709
	.incbin "baserom.gba", 0x00375709, 0x5

gUnknown_0837570E:: @ 837570E
	.incbin "baserom.gba", 0x0037570e, 0x5

gUnknown_08375713:: @ 8375713
	.incbin "baserom.gba", 0x00375713, 0x5

gUnknown_08375718:: @ 8375718
	.incbin "baserom.gba", 0x00375718, 0x5

gUnknown_0837571D:: @ 837571D
	.incbin "baserom.gba", 0x0037571d, 0x5

gUnknown_08375722:: @ 8375722
	.incbin "baserom.gba", 0x00375722, 0x5

gUnknown_08375727:: @ 8375727
	.incbin "baserom.gba", 0x00375727, 0x5

gUnknown_0837572C:: @ 837572C
	.incbin "baserom.gba", 0x0037572c, 0x5

gUnknown_08375731:: @ 8375731
	.incbin "baserom.gba", 0x00375731, 0x5

gUnknown_08375736:: @ 8375736
	.incbin "baserom.gba", 0x00375736, 0x5

gUnknown_0837573B:: @ 837573B
	.incbin "baserom.gba", 0x0037573b, 0x5

gUnknown_08375740:: @ 8375740
	.incbin "baserom.gba", 0x00375740, 0x5

gUnknown_08375745:: @ 8375745
	.incbin "baserom.gba", 0x00375745, 0x5

gUnknown_0837574A:: @ 837574A
	.incbin "baserom.gba", 0x0037574a, 0x5

gUnknown_0837574F:: @ 837574F
	.incbin "baserom.gba", 0x0037574f, 0x8

gUnknown_08375757:: @ 8375757
	.incbin "baserom.gba", 0x00375757, 0x10

gUnknown_08375767:: @ 8375767
	.incbin "baserom.gba", 0x00375767, 0x11

	.align 2
gUnknown_08375778:: @ 8375778
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
gUnknown_083759C0:: @ 83759C0
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

gUnknown_08375A34:: @ 8375A34
	.incbin "baserom.gba", 0x00375a34, 0x6

gUnknown_08375A3A:: @ 8375A3A
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

gUnknown_08376008:: @ 8376008
	.incbin "baserom.gba", 0x00376008, 0x8

	.align 2
gUnknown_08376010:: @ 8376010
	.4byte MetatileBehavior_IsTallGrass
	.4byte MetatileBehavior_IsLongGrass
	.4byte MetatileBehavior_IsPuddle
	.4byte MetatileBehavior_IsSurfableWaterOrUnderwater
	.4byte MetatileBehavior_IsShallowFlowingWater
	.4byte sub_8056D9C

gUnknown_08376028:: @ 8376028
	.incbin "baserom.gba", 0x00376028, 0x18

	.align 2
gUnknown_08376040:: @ 8376040
	.4byte MetatileBehavior_IsJumpSouth
	.4byte MetatileBehavior_IsJumpNorth
	.4byte MetatileBehavior_IsJumpWest
	.4byte MetatileBehavior_IsJumpEast

gUnknown_08376050:: @ 8376050
	.incbin "baserom.gba", 0x00376050, 0x10

	.align 2
gUnknown_08376060:: @ 8376060
	.4byte 0x02020202 @ are these even pointers?
	.4byte 0x02010201
	.4byte 0x02010201
	.4byte 0x02000001

gUnknown_08376070:: @ 8376070
	.incbin "baserom.gba", 0x00376070, 0x10

	.align 2
gUnknown_08376080:: @ 8376080
	.4byte nullsub_50
	.4byte DoTracksGroundEffect_Footprints
	.4byte DoTracksGroundEffect_BikeTireTracks

gUnknown_0837608C:: @ 837608C
	.incbin "baserom.gba", 0x0037608c, 0x4

gUnknown_08376090:: @ 8376090
	.incbin "baserom.gba", 0x00376090, 0x10

	.align 2
gUnknown_083760A0:: @ 83760A0
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
gUnknown_08376180:: @ 8376180
	.4byte Unknown_83760F0
	.4byte Unknown_8376130
	.4byte Unknown_8376150
	.4byte Unknown_8376168
	.4byte Unknown_8376178

gUnknown_08376194:: @ 8376194
Unknown_8376194:
	.incbin "baserom.gba", 0x00376194, 0xA
Unknown_837619E:
	.incbin "baserom.gba", 0x0037619e, 0x10
Unknown_83761AE:
	.incbin "baserom.gba", 0x003761ae, 0x10
Unknown_83761BE:
	.incbin "baserom.gba", 0x003761be, 0x12

	.align 2
gUnknown_083761D0:: @ 83761D0
	.4byte Unknown_837619E
	.4byte Unknown_83761AE
	.4byte Unknown_83761BE

gUnknown_083761DC:: @ 83761DC
	.incbin "baserom.gba", 0x003761dc, 0x6

gUnknown_083761E2:: @ 83761E2
	.incbin "baserom.gba", 0x003761e2, 0x4

gUnknown_083761E6:: @ 83761E6
	.incbin "baserom.gba", 0x003761e6, 0x6

gUnknown_083761EC:: @ 83761EC
	.incbin "baserom.gba", 0x003761ec, 0x4

	.align 2
gUnknown_083761F0:: @ 83761F0
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

gUnknown_08376290:: @ 8376290
	.incbin "baserom.gba", 0x00376290, 0x48

gUnknown_083762D8:: @ 83762D8
	.space 4

gUnknown_083762DC:: @ 83762DC
	.incbin "baserom.gba", 0x003762dc, 0x14

	.align 2
gUnknown_083762F0:: @ 83762F0
	.4byte 0x020231cc
	.4byte 0x020232cc
	.4byte 0x020233cc

gUnknown_083762FC:: @ 83762FC
	.incbin "baserom.gba", 0x003762fc, 0x68

	.align 2
gUnknown_08376364:: @ 8376364
	.4byte nullsub_51
	.4byte sub_8069F64
	.4byte sub_8069AA0
	.4byte sub_8069864
	.4byte sub_8069DD4
	.4byte sub_80C7700
	.4byte sub_80BCF1C
	.4byte sub_806A07C

gUnknown_08376384:: @ 8376384
	.incbin "baserom.gba", 0x00376384, 0x20

gUnknown_083763A4:: @ 83763A4
	.incbin "baserom.gba", 0x003763a4, 0x20

gUnknown_083763C4:: @ 83763C4
	.incbin "baserom.gba", 0x003763c4, 0x20

gUnknown_083763E4:: @ 83763E4
	.incbin "baserom.gba", 0x003763e4, 0x30

gUnknown_08376414:: @ 8376414
	.space 4

gUnknown_08376418:: @ 8376418
	.incbin "baserom.gba", 0x00376418, 0xa4

gUnknown_083764BC:: @ 83764BC
	.incbin "baserom.gba", 0x003764bc, 0x2c

gUnknown_083764E8:: @ 83764E8
	.incbin "baserom.gba", 0x003764e8, 0x18

gUnknown_08376500:: @ 8376500
	.incbin "baserom.gba", 0x00376500, 0x4

gUnknown_08376504:: @ 8376504
	.incbin "baserom.gba", 0x00376504, 0xd8

gUnknown_083765DC:: @ 83765DC
	obj_tiles 0x0837657c, 64, 0xd750

gUnknown_083765E4:: @ 83765E4
	.incbin "baserom.gba", 0x003765e4, 0x28

gUnknown_0837660C:: @ 837660C
	.incbin "baserom.gba", 0x0037660c, 0x18

	.align 2
gUnknown_08376624:: @ 8376624
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

gUnknown_08376678:: @ 8376678
	.incbin "baserom.gba", 0x00376678, 0xc0

gUnknown_08376738:: @ 8376738
	.incbin "baserom.gba", 0x00376738, 0x120

gUnknown_08376858:: @ 8376858
	.incbin "baserom.gba", 0x00376858, 0x60

gUnknown_083768B8:: @ 83768B8
	.incbin "baserom.gba", 0x003768b8, 0x60

gUnknown_08376918:: @ 8376918
	.incbin "baserom.gba", 0x00376918, 0x30

gUnknown_08376948:: @ 8376948
	.incbin "baserom.gba", 0x00376948, 0x30

gUnknown_08376978:: @ 8376978
	.incbin "baserom.gba", 0x00376978, 0x30

gUnknown_083769A8:: @ 83769A8
	.incbin "baserom.gba", 0x003769a8, 0x18

gUnknown_083769C0:: @ 83769C0
	.incbin "baserom.gba", 0x003769c0, 0x18

gUnknown_083769D8:: @ 83769D8
	.incbin "baserom.gba", 0x003769d8, 0x4d

gUnknown_08376A25:: @ 8376A25
	.incbin "baserom.gba", 0x00376a25, 0x39

gUnknown_08376A5E:: @ 8376A5E
	.incbin "baserom.gba", 0x00376a5e, 0xf6

gUnknown_08376B54:: @ 8376B54
	.incbin "baserom.gba", 0x00376b54, 0x60

gUnknown_08376BB4:: @ 8376BB4
	.incbin "baserom.gba", 0x00376bb4, 0xc0

gUnknown_08376C74:: @ 8376C74
	.incbin "baserom.gba", 0x00376c74, 0x60

gUnknown_08376CD4:: @ 8376CD4
	.incbin "baserom.gba", 0x00376cd4, 0x18

gUnknown_08376CEC:: @ 8376CEC
	.incbin "baserom.gba", 0x00376cec, 0x18

	.align 2
gUnknown_08376D04:: @ 8376D04
	.4byte OtherText_HP
	.4byte OtherText_Attack
	.4byte OtherText_Defense
	.4byte OtherText_SpAtk
	.4byte OtherText_SpDef
	.4byte OtherText_Speed

gUnknown_08376D1C:: @ 8376D1C
	.incbin "baserom.gba", 0x00376d1c, 0x8

	.align 2
gUnknown_08376D24:: @ 8376D24
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

gUnknown_08376D74:: @ 8376D74
	.incbin "baserom.gba", 0x00376d74, 0x1b0

gUnknown_08376F24:: @ 8376F24
	.incbin "baserom.gba", 0x00376f24, 0x1e10

gUnknown_08378D34:: @ 8378D34
	.incbin "baserom.gba", 0x00378d34, 0x8e0

gUnknown_08379614:: @ 8379614
	.incbin "baserom.gba", 0x00379614, 0x320

gUnknown_08379934:: @ 8379934
	.incbin "baserom.gba", 0x00379934, 0x510

gUnknown_08379E44:: @ 8379E44
	.incbin "baserom.gba", 0x00379e44, 0x210

gUnknown_0837A054:: @ 837A054
	.incbin "baserom.gba", 0x0037a054, 0xb50

gUnknown_0837ABA4:: @ 837ABA4
	.incbin "baserom.gba", 0x0037aba4, 0x210

gUnknown_0837ADB4:: @ 837ADB4
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
gUnknown_0837B5C4:: @ 837B5C4
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

gUnknown_0837BAE4:: @ 837BAE4
	.incbin "baserom.gba", 0x0037bae4, 0x20

gUnknown_0837BB04:: @ 837BB04
	.incbin "baserom.gba", 0x0037bb04, 0x20

	.align 2
gUnknown_0837BB24:: @ 837BB24
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
gUnknown_0837BB54:: @ 837BB54
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
gUnknown_0837BB84:: @ 837BB84
	.4byte Unknown_837B5E4
	.4byte Unknown_837B5E4
	.4byte Unknown_837B7E4
	.4byte Unknown_837B7E4

gUnknown_0837BB94:: @ 837BB94
	.incbin "baserom.gba", 0x0037bb94, 0x410

gUnknown_0837BFA4:: @ 837BFA4
	.incbin "baserom.gba", 0x0037bfa4, 0x20

gUnknown_0837BFC4:: @ 837BFC4
	.incbin "baserom.gba", 0x0037bfc4, 0x120

gUnknown_0837C0E4:: @ 837C0E4
	.incbin "baserom.gba", 0x0037c0e4, 0x428

gUnknown_0837C50C:: @ 837C50C
	.incbin "baserom.gba", 0x0037c50c, 0x430

gUnknown_0837C93C:: @ 837C93C
	.incbin "baserom.gba", 0x0037c93c, 0x20

gUnknown_0837C95C:: @ 837C95C
	.incbin "baserom.gba", 0x37C95C, 0x20
Unknown_837C97C:
	.incbin "baserom.gba", 0x37C97C, 0x80
Unknown_837C9FC:
	.incbin "baserom.gba", 0x37C9FC, 0x80

	.align 2
gUnknown_0837CA7C:: @ 837CA7C
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
gUnknown_0837D684:: @ 837D684
	.4byte Unknown_837CA84
	.4byte Unknown_837CC04
	.4byte Unknown_837CD84

gUnknown_0837D690:: @ 837D690
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
gUnknown_0837D83C:: @ 837D83C
	.4byte Unknown_837D79C
	.4byte Unknown_837D7BC
	.4byte Unknown_837D7DC
	.4byte Unknown_837D7FC

gUnknown_0837D84C:: @ 837D84C
	.incbin "baserom.gba", 0x37D84C, 0x8
Unknown_837D854:
	.incbin "baserom.gba", 0x37D854, 0x200
Unknown_837DA54:
	.incbin "baserom.gba", 0x37DA54, 0x220

gUnknown_0837DC74:: @ 837DC74
Unknown_837DC74:
	.4byte Unknown_837D854
	.4byte Unknown_837DA54
Unknown_837DD7C:
	.incbin "baserom.gba", 0x0037dc7c, 0x120
Unknown_837DD9C:
	.incbin "baserom.gba", 0x0037dd9c, 0x140

	.align 2
gUnknown_0837DEDC:: @ 837DEDC
	.4byte Unknown_837DD7C
	.4byte Unknown_837DD9C

gDummyPaletteStructTemplate:: @ 837DEE4
	.incbin "baserom.gba", 0x0037dee4, 0x10

gUnknown_0837DEF4:: @ 837DEF4
	.incbin "baserom.gba", 0x0037def4, 0x30

	.align 2
gOamData_837DF24:: @ 837DF24
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gOamData_837DF2C:: @ 837DF2C
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gOamData_837DF34:: @ 837DF34
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_837DF3C:: @ 837DF3C
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37df44, 0x10

	.align 2
gOamData_837DF54:: @ 837DF54
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_837DF5C:: @ 837DF5C
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gOamData_837DF64:: @ 837DF64
	.2byte 0x8000
	.2byte 0x0000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37df6c, 0x8

	.align 2
gOamData_837DF74:: @ 837DF74
	.2byte 0x8000
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_837DF7C:: @ 837DF7C
	.2byte 0x8000
	.2byte 0xC000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37df84, 0x8

	.align 2
gOamData_837DF8C:: @ 837DF8C
	.2byte 0x0100
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gOamData_837DF94:: @ 837DF94
	.2byte 0x0100
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_837DF9C:: @ 837DF9C
	.2byte 0x0100
	.2byte 0xC000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37dfa4, 0x18

	.align 2
gOamData_837DFBC:: @ 837DFBC
	.2byte 0x4100
	.2byte 0xC000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37dfc4, 0x18

	.align 2
gOamData_837DFDC:: @ 837DFDC
	.2byte 0x8100
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gOamData_837DFE4:: @ 837DFE4
	.2byte 0x0300
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gOamData_837DFEC:: @ 837DFEC
	.2byte 0x0300
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gOamData_837DFF4:: @ 837DFF4
	.2byte 0x0300
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_837DFFC:: @ 837DFFC
	.2byte 0x0300
	.2byte 0xC000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37e004, 0x10

	.align 2
gOamData_837E014:: @ 837E014
	.2byte 0x4300
	.2byte 0x8000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37e01c, 0x8

	.align 2
gOamData_837E024:: @ 837E024
	.2byte 0x8300
	.2byte 0x0000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37e02c, 0x8

	.align 2
gOamData_837E034:: @ 837E034
	.2byte 0x8300
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_837E03C:: @ 837E03C
	.2byte 0x8300
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gOamData_837E044:: @ 837E044
	.2byte 0x0400
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gOamData_837E04C:: @ 837E04C
	.2byte 0x0400
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gOamData_837E054:: @ 837E054
	.2byte 0x0400
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_837E05C:: @ 837E05C
	.2byte 0x0400
	.2byte 0xC000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37e064, 0x10

	.align 2
gOamData_837E074:: @ 837E074
	.2byte 0x4400
	.2byte 0x8000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37e07c, 0x8

	.align 2
gOamData_837E084:: @ 837E084
	.2byte 0x8400
	.2byte 0x0000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37e08c, 0x18

	.align 2
gOamData_837E0A4:: @ 837E0A4
	.2byte 0x0500
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gOamData_837E0AC:: @ 837E0AC
	.2byte 0x0500
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gOamData_837E0B4:: @ 837E0B4
	.2byte 0x0500
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_837E0BC:: @ 837E0BC
	.2byte 0x0500
	.2byte 0xC000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37e0c4, 0x20

	.align 2
gOamData_837E0E4:: @ 837E0E4
	.2byte 0x8500
	.2byte 0x0000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37e0ec, 0x10

	.align 2
gOamData_837E0FC:: @ 837E0FC
	.2byte 0x8500
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gOamData_837E104:: @ 837E104
	.2byte 0x0700
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gOamData_837E10C:: @ 837E10C
	.2byte 0x0700
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gOamData_837E114:: @ 837E114
	.2byte 0x0700
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_837E11C:: @ 837E11C
	.2byte 0x0700
	.2byte 0xC000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37e124, 0x10

	.align 2
gOamData_837E134:: @ 837E134
	.2byte 0x4700
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_837E13C:: @ 837E13C
	.2byte 0x4700
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gOamData_837E144:: @ 837E144
	.2byte 0x8700
	.2byte 0x0000
	.2byte 0x0800

	.align 2
	.incbin "baserom.gba", 0x37e14c, 0x18

	.align 2
gBattleAnimPicTable:: @ 837E164
	obj_tiles gBattleAnimSpriteSheet_000,  0x200, 10000
	obj_tiles gBattleAnimSpriteSheet_001,  0x300, 10001
	obj_tiles gBattleAnimSpriteSheet_002,  0x200, 10002
	obj_tiles gBattleAnimSpriteSheet_003,  0x100, 10003
	obj_tiles gBattleAnimSpriteSheet_004,  0x200, 10004
	obj_tiles gBattleAnimSpriteSheet_005,  0x400, 10005
	obj_tiles gBattleAnimSpriteSheet_006,  0x180, 10006
	obj_tiles gBattleAnimSpriteSheet_007,  0x800, 10007
	obj_tiles gBattleAnimSpriteSheet_008,   0x20, 10008
	obj_tiles gBattleAnimSpriteSheet_009,  0x400, 10009
	obj_tiles gBattleAnimSpriteSheet_010, 0x1200, 10010
	obj_tiles gBattleAnimSpriteSheet_011,  0x180, 10011
	obj_tiles gBattleAnimSpriteSheet_012,   0x80, 10012
	obj_tiles gBattleAnimSpriteSheet_013,   0x80, 10013
	obj_tiles gBattleAnimSpriteSheet_014,  0x280, 10014
	obj_tiles gBattleAnimSpriteSheet_015,   0x80, 10015
	obj_tiles gBattleAnimSpriteSheet_016,  0x100, 10016
	obj_tiles gBattleAnimSpriteSheet_017,   0x20, 10017
	obj_tiles gBattleAnimSpriteSheet_018,   0x80, 10018
	obj_tiles gBattleAnimSpriteSheet_019,  0x400, 10019
	obj_tiles gBattleAnimSpriteSheet_020,  0x200, 10020
	obj_tiles gBattleAnimSpriteSheet_021,  0xA00, 10021
	obj_tiles gBattleAnimSpriteSheet_021,  0xA00, 10022
	obj_tiles gBattleAnimSpriteSheet_023,  0x380, 10023
	obj_tiles gBattleAnimSpriteSheet_024,  0x300, 10024
	obj_tiles gBattleAnimSpriteSheet_025,  0xA00, 10025
	obj_tiles gBattleAnimSpriteSheet_026,  0xA00, 10026
	obj_tiles gBattleAnimSpriteSheet_027,  0xA00, 10027
	obj_tiles gBattleAnimSpriteSheet_028,  0xA00, 10028
	obj_tiles gBattleAnimSpriteSheet_029,  0xA00, 10029
	obj_tiles gBattleAnimSpriteSheet_030,  0xA00, 10030
	obj_tiles gBattleAnimSpriteSheet_031,  0xE00, 10031
	obj_tiles gBattleAnimSpriteSheet_032,  0x380, 10032
	obj_tiles gBattleAnimSpriteSheet_033, 0x1000, 10033
	obj_tiles gBattleAnimSpriteSheet_034,  0x800, 10034
	obj_tiles gBattleAnimSpriteSheet_035,  0xA00, 10035
	obj_tiles gBattleAnimSpriteSheet_036,  0x800, 10036
	obj_tiles gBattleAnimSpriteSheet_037,  0xA00, 10037
	obj_tiles gBattleAnimSpriteSheet_038,  0xA00, 10038
	obj_tiles gBattleAnimSpriteSheet_039,  0xA00, 10039
	obj_tiles gBattleAnimSpriteSheet_040,  0xA00, 10040
	obj_tiles gBattleAnimSpriteSheet_041,  0xA00, 10041
	obj_tiles gBattleAnimSpriteSheet_042,  0xA00, 10042
	obj_tiles gBattleAnimSpriteSheet_043,  0xA00, 10043
	obj_tiles gBattleAnimSpriteSheet_044,  0xA00, 10044
	obj_tiles gBattleAnimSpriteSheet_045,  0xA00, 10045
	obj_tiles gBattleAnimSpriteSheet_046, 0x1000, 10046
	obj_tiles gBattleAnimSpriteSheet_046, 0x1000, 10047
	obj_tiles gBattleAnimSpriteSheet_048, 0x1000, 10048
	obj_tiles gBattleAnimSpriteSheet_048, 0x1000, 10049
	obj_tiles gBattleAnimSpriteSheet_050,  0x200, 10050
	obj_tiles gBattleAnimSpriteSheet_051,  0x200, 10051
	obj_tiles gBattleAnimSpriteSheet_052,  0x200, 10052
	obj_tiles gBattleAnimSpriteSheet_053,  0x800, 10053
	obj_tiles gBattleAnimSpriteSheet_054,   0x80, 10054
	obj_tiles gBattleAnimSpriteSheet_055,  0x200, 10055
	obj_tiles gBattleAnimSpriteSheet_056, 0x1000, 10056
	obj_tiles gBattleAnimSpriteSheet_057,  0x180, 10057
	obj_tiles gBattleAnimSpriteSheet_058,  0xC00, 10058
	obj_tiles gBattleAnimSpriteSheet_059,  0x100, 10059
	obj_tiles gBattleAnimSpriteSheet_060,   0x40, 10060
	obj_tiles gBattleAnimSpriteSheet_061,  0x180, 10061
	obj_tiles gBattleAnimSpriteSheet_062,  0x800, 10062
	obj_tiles gBattleAnimSpriteSheet_063,  0x480, 10063
	obj_tiles gBattleAnimSpriteSheet_064,  0x200, 10064
	obj_tiles gBattleAnimSpriteSheet_065,  0x200, 10065
	obj_tiles gBattleAnimSpriteSheet_066,  0x100, 10066
	obj_tiles gBattleAnimSpriteSheet_065,  0x200, 10067
	obj_tiles gBattleAnimSpriteSheet_065,  0x200, 10068
	obj_tiles gBattleAnimSpriteSheet_065,  0x200, 10069
	obj_tiles gBattleAnimSpriteSheet_070,  0x200, 10070
	obj_tiles gBattleAnimSpriteSheet_071,  0xA00, 10071
	obj_tiles gBattleAnimSpriteSheet_072,  0x300, 10072
	obj_tiles gBattleAnimSpriteSheet_073,  0x180, 10073
	obj_tiles gBattleAnimSpriteSheet_074,   0xA0, 10074
	obj_tiles gBattleAnimSpriteSheet_075,  0x700, 10075
	obj_tiles gBattleAnimSpriteSheet_076,  0x400, 10076
	obj_tiles gBattleAnimSpriteSheet_077,  0x200, 10077
	obj_tiles gBattleAnimSpriteSheet_078,  0x300, 10078
	obj_tiles gBattleAnimSpriteSheet_079,  0xC00, 10079
	obj_tiles gBattleAnimSpriteSheet_080,  0xA00, 10080
	obj_tiles gBattleAnimSpriteSheet_081,   0x80, 10081
	obj_tiles gBattleAnimSpriteSheet_082,   0x40, 10082
	obj_tiles gBattleAnimSpriteSheet_083,  0xE00, 10083
	obj_tiles gBattleAnimSpriteSheet_084,  0xE00, 10084
	obj_tiles gBattleAnimSpriteSheet_085,  0x280, 10085
	obj_tiles gBattleAnimSpriteSheet_086,  0x200, 10086
	obj_tiles gBattleAnimSpriteSheet_087,   0x80, 10087
	obj_tiles gBattleAnimSpriteSheet_088,   0xC0, 10088
	obj_tiles gBattleAnimSpriteSheet_089,  0xA00, 10089
	obj_tiles gBattleAnimSpriteSheet_090,  0x200, 10090
	obj_tiles gBattleAnimSpriteSheet_091,  0x180, 10091
	obj_tiles gBattleAnimSpriteSheet_092,   0x80, 10092
	obj_tiles gBattleAnimSpriteSheet_093, 0x1000, 10093
	obj_tiles gBattleAnimSpriteSheet_094,  0xA00, 10094
	obj_tiles gBattleAnimSpriteSheet_095,  0x180, 10095
	obj_tiles gBattleAnimSpriteSheet_096,  0x380, 10096
	obj_tiles gBattleAnimSpriteSheet_097,  0xC00, 10097
	obj_tiles gBattleAnimSpriteSheet_098,  0x200, 10098
	obj_tiles gBattleAnimSpriteSheet_099,  0x200, 10099
	obj_tiles gBattleAnimSpriteSheet_100,  0x200, 10100
	obj_tiles gBattleAnimSpriteSheet_101,  0x200, 10101
	obj_tiles gBattleAnimSpriteSheet_102,  0x400, 10102
	obj_tiles gBattleAnimSpriteSheet_103,   0x80, 10103
	obj_tiles gBattleAnimSpriteSheet_104,  0x400, 10104
	obj_tiles gBattleAnimSpriteSheet_105,  0xC00, 10105
	obj_tiles gBattleAnimSpriteSheet_106,  0x200, 10106
	obj_tiles gBattleAnimSpriteSheet_107, 0x1000, 10107
	obj_tiles gBattleAnimSpriteSheet_108,  0xA00, 10108
	obj_tiles gBattleAnimSpriteSheet_109,   0x20, 10109
	obj_tiles gBattleAnimSpriteSheet_110,  0xE00, 10110
	obj_tiles gBattleAnimSpriteSheet_111,   0x80, 10111
	obj_tiles gBattleAnimSpriteSheet_112,  0xA00, 10112
	obj_tiles gBattleAnimSpriteSheet_113,  0x400, 10113
	obj_tiles gBattleAnimSpriteSheet_114,  0x200, 10114
	obj_tiles gBattleAnimSpriteSheet_115,  0x700, 10115
	obj_tiles gBattleAnimSpriteSheet_116,  0x800, 10116
	obj_tiles gBattleAnimSpriteSheet_117,  0xA00, 10117
	obj_tiles gBattleAnimSpriteSheet_118,  0x600, 10118
	obj_tiles gBattleAnimSpriteSheet_119,  0x800, 10119
	obj_tiles gBattleAnimSpriteSheet_120,  0x200, 10120
	obj_tiles gBattleAnimSpriteSheet_121,   0x40, 10121
	obj_tiles gBattleAnimSpriteSheet_122,  0x180, 10122
	obj_tiles gBattleAnimSpriteSheet_123,  0x600, 10123
	obj_tiles gBattleAnimSpriteSheet_124,  0x600, 10124
	obj_tiles gBattleAnimSpriteSheet_125,  0x200, 10125
	obj_tiles gBattleAnimSpriteSheet_126,   0x80, 10126
	obj_tiles gBattleAnimSpriteSheet_127,  0x200, 10127
	obj_tiles gBattleAnimSpriteSheet_128,  0x800, 10128
	obj_tiles gBattleAnimSpriteSheet_129,   0x80, 10129
	obj_tiles gBattleAnimSpriteSheet_130,  0xA00, 10130
	obj_tiles gBattleAnimSpriteSheet_131,  0x280, 10131
	obj_tiles gBattleAnimSpriteSheet_132,  0x280, 10132
	obj_tiles gBattleAnimSpriteSheet_133,  0x100, 10133
	obj_tiles gBattleAnimSpriteSheet_134,  0x200, 10134
	obj_tiles gBattleAnimSpriteSheet_135,  0x200, 10135
	obj_tiles gBattleAnimSpriteSheet_136,   0x20, 10136
	obj_tiles gBattleAnimSpriteSheet_137,  0xA00, 10137
	obj_tiles gBattleAnimSpriteSheet_138,  0x800, 10138
	obj_tiles gBattleAnimSpriteSheet_139,  0x800, 10139
	obj_tiles gBattleAnimSpriteSheet_140,   0xC0, 10140
	obj_tiles gBattleAnimSpriteSheet_141,  0x1C0, 10141
	obj_tiles gBattleAnimSpriteSheet_142,  0x100, 10142
	obj_tiles gBattleAnimSpriteSheet_143,  0x800, 10143
	obj_tiles gBattleAnimSpriteSheet_144,  0x200, 10144
	obj_tiles gBattleAnimSpriteSheet_145,  0x800, 10145
	obj_tiles gBattleAnimSpriteSheet_146,  0x180, 10146
	obj_tiles gBattleAnimSpriteSheet_147,  0x180, 10147
	obj_tiles gBattleAnimSpriteSheet_148,  0x200, 10148
	obj_tiles gBattleAnimSpriteSheet_149,  0x200, 10149
	obj_tiles gBattleAnimSpriteSheet_150,  0x180, 10150
	obj_tiles gBattleAnimSpriteSheet_151,  0x400, 10151
	obj_tiles gBattleAnimSpriteSheet_152,   0x80, 10152
	obj_tiles gBattleAnimSpriteSheet_153,  0x100, 10153
	obj_tiles gBattleAnimSpriteSheet_154,  0x100, 10154
	obj_tiles gBattleAnimSpriteSheet_155,  0x140, 10155
	obj_tiles gBattleAnimSpriteSheet_156,  0x800, 10156
	obj_tiles gBattleAnimSpriteSheet_157,  0x200, 10157
	obj_tiles gBattleAnimSpriteSheet_158,  0x100, 10158
	obj_tiles gBattleAnimSpriteSheet_159,   0xA0, 10159
	obj_tiles gBattleAnimSpriteSheet_160,  0x100, 10160
	obj_tiles gBattleAnimSpriteSheet_161,   0x80, 10161
	obj_tiles gBattleAnimSpriteSheet_162,  0x300, 10162
	obj_tiles gBattleAnimSpriteSheet_163,  0x100, 10163
	obj_tiles gBattleAnimSpriteSheet_163,  0x100, 10164
	obj_tiles gBattleAnimSpriteSheet_163,  0x100, 10165
	obj_tiles gBattleAnimSpriteSheet_166,  0x800, 10166
	obj_tiles gBattleAnimSpriteSheet_166,  0x800, 10167
	obj_tiles gBattleAnimSpriteSheet_166,  0x800, 10168
	obj_tiles gBattleAnimSpriteSheet_166,  0x800, 10169
	obj_tiles gBattleAnimSpriteSheet_166,  0x800, 10170
	obj_tiles gBattleAnimSpriteSheet_171,   0x80, 10171
	obj_tiles gBattleAnimSpriteSheet_144,  0x200, 10172
	obj_tiles gBattleAnimSpriteSheet_173,  0x200, 10173
	obj_tiles gBattleAnimSpriteSheet_174,  0x200, 10174
	obj_tiles gBattleAnimSpriteSheet_175,   0x80, 10175
	obj_tiles gBattleAnimSpriteSheet_176,  0x200, 10176
	obj_tiles gBattleAnimSpriteSheet_177,  0x500, 10177
	obj_tiles gBattleAnimSpriteSheet_178,  0x800, 10178
	obj_tiles gBattleAnimSpriteSheet_179,  0x400, 10179
	obj_tiles gBattleAnimSpriteSheet_180,   0x20, 10180
	obj_tiles gBattleAnimSpriteSheet_181,  0x800, 10181
	obj_tiles gBattleAnimSpriteSheet_182,  0x100, 10182
	obj_tiles gBattleAnimSpriteSheet_183,  0x800, 10183
	obj_tiles gBattleAnimSpriteSheet_184,  0x400, 10184
	obj_tiles gBattleAnimSpriteSheet_185,  0xA00, 10185
	obj_tiles gBattleAnimSpriteSheet_186, 0x1000, 10186
	obj_tiles gBattleAnimSpriteSheet_187,  0x800, 10187
	obj_tiles gBattleAnimSpriteSheet_188,  0x400, 10188
	obj_tiles gBattleAnimSpriteSheet_189,  0x200, 10189
	obj_tiles gBattleAnimSpriteSheet_190,  0x800, 10190
	obj_tiles gBattleAnimSpriteSheet_191,  0x800, 10191
	obj_tiles gBattleAnimSpriteSheet_192,  0x800, 10192
	obj_tiles gBattleAnimSpriteSheet_193,  0x200, 10193
	obj_tiles gBattleAnimSpriteSheet_194,  0x800, 10194
	obj_tiles gBattleAnimSpriteSheet_195,  0x200, 10195
	obj_tiles gBattleAnimSpriteSheet_196,  0x800, 10196
	obj_tiles gBattleAnimSpriteSheet_197,  0x200, 10197
	obj_tiles gBattleAnimSpriteSheet_198,  0x800, 10198
	obj_tiles gBattleAnimSpriteSheet_199,  0x400, 10199
	obj_tiles gBattleAnimSpriteSheet_200,  0x200, 10200
	obj_tiles gBattleAnimSpriteSheet_201,  0xA80, 10201
	obj_tiles gBattleAnimSpriteSheet_202,  0x600, 10202
	obj_tiles gBattleAnimSpriteSheet_203,  0x800, 10203
	obj_tiles gBattleAnimSpriteSheet_204,  0x200, 10204
	obj_tiles gBattleAnimSpriteSheet_205,  0x600, 10205
	obj_tiles gBattleAnimSpriteSheet_206,  0x800, 10206
	obj_tiles gBattleAnimSpriteSheet_207,  0x180, 10207
	obj_tiles gBattleAnimSpriteSheet_208,  0x800, 10208
	obj_tiles gBattleAnimSpriteSheet_209,  0x800, 10209
	obj_tiles gBattleAnimSpriteSheet_210,   0x80, 10210
	obj_tiles gBattleAnimSpriteSheet_211,   0x80, 10211
	obj_tiles gBattleAnimSpriteSheet_212,  0x800, 10212
	obj_tiles gBattleAnimSpriteSheet_213,  0x800, 10213
	obj_tiles gBattleAnimSpriteSheet_214,  0x600, 10214
	obj_tiles gBattleAnimSpriteSheet_215,  0x600, 10215
	obj_tiles gBattleAnimSpriteSheet_210,   0x80, 10216
	obj_tiles gBattleAnimSpriteSheet_217,   0x80, 10217
	obj_tiles gBattleAnimSpriteSheet_218,  0x180, 10218
	obj_tiles gBattleAnimSpriteSheet_210,   0x80, 10219
	obj_tiles gBattleAnimSpriteSheet_220,  0x200, 10220
	obj_tiles gBattleAnimSpriteSheet_221,  0x400, 10221
	obj_tiles gBattleAnimSpriteSheet_222,  0xA00, 10222
	obj_tiles gBattleAnimSpriteSheet_223,  0x800, 10223
	obj_tiles gBattleAnimSpriteSheet_224,  0x200, 10224
	obj_tiles gBattleAnimSpriteSheet_225,  0x400, 10225
	obj_tiles gBattleAnimSpriteSheet_226,   0x80, 10226
	obj_tiles gBattleAnimSpriteSheet_227,  0x800, 10227
	obj_tiles gBattleAnimSpriteSheet_228,  0x200, 10228
	obj_tiles gBattleAnimSpriteSheet_229,  0x300, 10229
	obj_tiles gBattleAnimSpriteSheet_230,  0x800, 10230
	obj_tiles gBattleAnimSpriteSheet_231,  0x380, 10231
	obj_tiles gBattleAnimSpriteSheet_232,  0x800, 10232
	obj_tiles gBattleAnimSpriteSheet_233,   0xC0, 10233
	obj_tiles gBattleAnimSpriteSheet_234,  0x800, 10234
	obj_tiles gBattleAnimSpriteSheet_235,   0x60, 10235
	obj_tiles gBattleAnimSpriteSheet_235,   0x60, 10236
	obj_tiles gBattleAnimSpriteSheet_235,   0x60, 10237
	obj_tiles gBattleAnimSpriteSheet_238,   0x80, 10238
	obj_tiles gBattleAnimSpriteSheet_239,  0x180, 10239
	obj_tiles gBattleAnimSpriteSheet_240,  0x180, 10240
	obj_tiles gBattleAnimSpriteSheet_241,  0x200, 10241
	obj_tiles gBattleAnimSpriteSheet_242,  0x200, 10242
	obj_tiles gBattleAnimSpriteSheet_243,   0x20, 10243
	obj_tiles gBattleAnimSpriteSheet_244,  0x400, 10244
	obj_tiles gBattleAnimSpriteSheet_245,  0x600, 10245
	obj_tiles gBattleAnimSpriteSheet_246, 0x1000, 10246
	obj_tiles gBattleAnimSpriteSheet_247,  0x400, 10247
	obj_tiles gBattleAnimSpriteSheet_248,   0x20, 10248
	obj_tiles gBattleAnimSpriteSheet_249,   0x80, 10249
	obj_tiles gBattleAnimSpriteSheet_250,  0x800, 10250
	obj_tiles gBattleAnimSpriteSheet_251,   0x80, 10251
	obj_tiles gBattleAnimSpriteSheet_252,  0x200, 10252
	obj_tiles gBattleAnimSpriteSheet_253,  0x400, 10253
	obj_tiles gBattleAnimSpriteSheet_254,  0x200, 10254
	obj_tiles gBattleAnimSpriteSheet_255,  0x200, 10255
	obj_tiles gBattleAnimSpriteSheet_256,  0x800, 10256
	obj_tiles gBattleAnimSpriteSheet_257,  0x280, 10257
	obj_tiles gBattleAnimSpriteSheet_258,  0x200, 10258
	obj_tiles gBattleAnimSpriteSheet_149,  0x200, 10259
	obj_tiles gBattleAnimSpriteSheet_260,  0x400, 10260
	obj_tiles gBattleAnimSpriteSheet_261,  0x200, 10261
	obj_tiles gBattleAnimSpriteSheet_262,  0x200, 10262
	obj_tiles gBattleAnimSpriteSheet_263,   0x80, 10263
	obj_tiles gBattleAnimSpriteSheet_264,   0x20, 10264
	obj_tiles gBattleAnimSpriteSheet_264,   0x20, 10265
	obj_tiles gBattleAnimSpriteSheet_266,   0x80, 10266
	obj_tiles gBattleAnimSpriteSheet_212,  0x800, 10267
	obj_tiles gBattleAnimSpriteSheet_264,   0x20, 10268
	obj_tiles gBattleAnimSpriteSheet_269,   0x80, 10269
	obj_tiles gBattleAnimSpriteSheet_270,  0x400, 10270
	obj_tiles gBattleAnimSpriteSheet_271,   0x80, 10271
	obj_tiles gBattleAnimSpriteSheet_272,  0x800, 10272
	obj_tiles gBattleAnimSpriteSheet_273,   0x20, 10273
	obj_tiles gBattleAnimSpriteSheet_274,  0x800, 10274
	obj_tiles gBattleAnimSpriteSheet_275,  0x800, 10275
	obj_tiles gBattleAnimSpriteSheet_276,  0x800, 10276
	obj_tiles gBattleAnimSpriteSheet_277, 0x1000, 10277
	obj_tiles gBattleAnimSpriteSheet_278,  0x800, 10278
	obj_tiles gBattleAnimSpriteSheet_279,   0xA0, 10279
	obj_tiles gBattleAnimSpriteSheet_280,  0x800, 10280
	obj_tiles gBattleAnimSpriteSheet_281,  0x200, 10281
	obj_tiles gBattleAnimSpriteSheet_282,  0x600, 10282
	obj_tiles gBattleAnimSpriteSheet_283,  0x200, 10283
	obj_tiles gBattleAnimSpriteSheet_284,  0x800, 10284
	obj_tiles gBattleAnimSpriteSheet_285,  0x200, 10285
	obj_tiles gBattleAnimSpriteSheet_183,  0x800, 10286
	obj_tiles gBattleAnimSpriteSheet_056, 0x1000, 10287
	obj_tiles gBattleAnimSpriteSheet_163,  0x100, 10288

	.align 2
gBattleAnimPaletteTable:: @ 837EA6C
	obj_pal gBattleAnimSpritePalette_000, 10000
	obj_pal gBattleAnimSpritePalette_001, 10001
	obj_pal gBattleAnimSpritePalette_002, 10002
	obj_pal gBattleAnimSpritePalette_003, 10003
	obj_pal gBattleAnimSpritePalette_004, 10004
	obj_pal gBattleAnimSpritePalette_005, 10005
	obj_pal gBattleAnimSpritePalette_006, 10006
	obj_pal gBattleAnimSpritePalette_007, 10007
	obj_pal gBattleAnimSpritePalette_008, 10008
	obj_pal gBattleAnimSpritePalette_009, 10009
	obj_pal gBattleAnimSpritePalette_010, 10010
	obj_pal gBattleAnimSpritePalette_011, 10011
	obj_pal gBattleAnimSpritePalette_012, 10012
	obj_pal gBattleAnimSpritePalette_013, 10013
	obj_pal gBattleAnimSpritePalette_014, 10014
	obj_pal gBattleAnimSpritePalette_015, 10015
	obj_pal gBattleAnimSpritePalette_016, 10016
	obj_pal gBattleAnimSpritePalette_016, 10017
	obj_pal gBattleAnimSpritePalette_018, 10018
	obj_pal gBattleAnimSpritePalette_019, 10019
	obj_pal gBattleAnimSpritePalette_020, 10020
	obj_pal gBattleAnimSpritePalette_021, 10021
	obj_pal gBattleAnimSpritePalette_022, 10022
	obj_pal gBattleAnimSpritePalette_023, 10023
	obj_pal gBattleAnimSpritePalette_024, 10024
	obj_pal gBattleAnimSpritePalette_025, 10025
	obj_pal gBattleAnimSpritePalette_026, 10026
	obj_pal gBattleAnimSpritePalette_027, 10027
	obj_pal gBattleAnimSpritePalette_028, 10028
	obj_pal gBattleAnimSpritePalette_029, 10029
	obj_pal gBattleAnimSpritePalette_030, 10030
	obj_pal gBattleAnimSpritePalette_031, 10031
	obj_pal gBattleAnimSpritePalette_032, 10032
	obj_pal gBattleAnimSpritePalette_033, 10033
	obj_pal gBattleAnimSpritePalette_033, 10034
	obj_pal gBattleAnimSpritePalette_033, 10035
	obj_pal gBattleAnimSpritePalette_036, 10036
	obj_pal gBattleAnimSpritePalette_036, 10037
	obj_pal gBattleAnimSpritePalette_038, 10038
	obj_pal gBattleAnimSpritePalette_039, 10039
	obj_pal gBattleAnimSpritePalette_038, 10040
	obj_pal gBattleAnimSpritePalette_038, 10041
	obj_pal gBattleAnimSpritePalette_042, 10042
	obj_pal gBattleAnimSpritePalette_043, 10043
	obj_pal gBattleAnimSpritePalette_044, 10044
	obj_pal gBattleAnimSpritePalette_045, 10045
	obj_pal gBattleAnimSpritePalette_046, 10046
	obj_pal gBattleAnimSpritePalette_047, 10046
	obj_pal gBattleAnimSpritePalette_048, 10048
	obj_pal gBattleAnimSpritePalette_049, 10049
	obj_pal gBattleAnimSpritePalette_050, 10050
	obj_pal gBattleAnimSpritePalette_050, 10051
	obj_pal gBattleAnimSpritePalette_050, 10052
	obj_pal gBattleAnimSpritePalette_026, 10053
	obj_pal gBattleAnimSpritePalette_054, 10054
	obj_pal gBattleAnimSpritePalette_050, 10055
	obj_pal gBattleAnimSpritePalette_056, 10056
	obj_pal gBattleAnimSpritePalette_057, 10057
	obj_pal gBattleAnimSpritePalette_058, 10058
	obj_pal gBattleAnimSpritePalette_059, 10059
	obj_pal gBattleAnimSpritePalette_060, 10060
	obj_pal gBattleAnimSpritePalette_061, 10061
	obj_pal gBattleAnimSpritePalette_062, 10062
	obj_pal gBattleAnimSpritePalette_063, 10063
	obj_pal gBattleAnimSpritePalette_064, 10064
	obj_pal gBattleAnimSpritePalette_065, 10065
	obj_pal gBattleAnimSpritePalette_066, 10066
	obj_pal gBattleAnimSpritePalette_067, 10067
	obj_pal gBattleAnimSpritePalette_068, 10068
	obj_pal gBattleAnimSpritePalette_065, 10069
	obj_pal gBattleAnimSpritePalette_070, 10070
	obj_pal gBattleAnimSpritePalette_070, 10071
	obj_pal gBattleAnimSpritePalette_072, 10072
	obj_pal gBattleAnimSpritePalette_073, 10073
	obj_pal gBattleAnimSpritePalette_074, 10074
	obj_pal gBattleAnimSpritePalette_075, 10075
	obj_pal gBattleAnimSpritePalette_076, 10076
	obj_pal gBattleAnimSpritePalette_076, 10077
	obj_pal gBattleAnimSpritePalette_078, 10078
	obj_pal gBattleAnimSpritePalette_078, 10079
	obj_pal gBattleAnimSpritePalette_080, 10080
	obj_pal gBattleAnimSpritePalette_081, 10081
	obj_pal gBattleAnimSpritePalette_082, 10082
	obj_pal gBattleAnimSpritePalette_083, 10083
	obj_pal gBattleAnimSpritePalette_084, 10084
	obj_pal gBattleAnimSpritePalette_085, 10085
	obj_pal gBattleAnimSpritePalette_086, 10086
	obj_pal gBattleAnimSpritePalette_087, 10087
	obj_pal gBattleAnimSpritePalette_088, 10088
	obj_pal gBattleAnimSpritePalette_089, 10089
	obj_pal gBattleAnimSpritePalette_090, 10090
	obj_pal gBattleAnimSpritePalette_091, 10091
	obj_pal gBattleAnimSpritePalette_092, 10092
	obj_pal gBattleAnimSpritePalette_093, 10093
	obj_pal gBattleAnimSpritePalette_094, 10094
	obj_pal gBattleAnimSpritePalette_095, 10095
	obj_pal gBattleAnimSpritePalette_096, 10096
	obj_pal gBattleAnimSpritePalette_097, 10097
	obj_pal gBattleAnimSpritePalette_094, 10098
	obj_pal gBattleAnimSpritePalette_099, 10099
	obj_pal gBattleAnimSpritePalette_100, 10100
	obj_pal gBattleAnimSpritePalette_101, 10101
	obj_pal gBattleAnimSpritePalette_101, 10102
	obj_pal gBattleAnimSpritePalette_103, 10103
	obj_pal gBattleAnimSpritePalette_104, 10104
	obj_pal gBattleAnimSpritePalette_105, 10105
	obj_pal gBattleAnimSpritePalette_105, 10106
	obj_pal gBattleAnimSpritePalette_107, 10107
	obj_pal gBattleAnimSpritePalette_107, 10108
	obj_pal gBattleAnimSpritePalette_109, 10109
	obj_pal gBattleAnimSpritePalette_109, 10110
	obj_pal gBattleAnimSpritePalette_111, 10111
	obj_pal gBattleAnimSpritePalette_112, 10112
	obj_pal gBattleAnimSpritePalette_113, 10113
	obj_pal gBattleAnimSpritePalette_114, 10114
	obj_pal gBattleAnimSpritePalette_115, 10115
	obj_pal gBattleAnimSpritePalette_116, 10116
	obj_pal gBattleAnimSpritePalette_117, 10117
	obj_pal gBattleAnimSpritePalette_118, 10118
	obj_pal gBattleAnimSpritePalette_119, 10119
	obj_pal gBattleAnimSpritePalette_120, 10120
	obj_pal gBattleAnimSpritePalette_121, 10121
	obj_pal gBattleAnimSpritePalette_122, 10122
	obj_pal gBattleAnimSpritePalette_122, 10123
	obj_pal gBattleAnimSpritePalette_124, 10124
	obj_pal gBattleAnimSpritePalette_125, 10125
	obj_pal gBattleAnimSpritePalette_126, 10126
	obj_pal gBattleAnimSpritePalette_127, 10127
	obj_pal gBattleAnimSpritePalette_128, 10128
	obj_pal gBattleAnimSpritePalette_128, 10129
	obj_pal gBattleAnimSpritePalette_130, 10130
	obj_pal gBattleAnimSpritePalette_130, 10131
	obj_pal gBattleAnimSpritePalette_132, 10132
	obj_pal gBattleAnimSpritePalette_133, 10133
	obj_pal gBattleAnimSpritePalette_133, 10134
	obj_pal gBattleAnimSpritePalette_135, 10135
	obj_pal gBattleAnimSpritePalette_136, 10136
	obj_pal gBattleAnimSpritePalette_135, 10137
	obj_pal gBattleAnimSpritePalette_135, 10138
	obj_pal gBattleAnimSpritePalette_139, 10139
	obj_pal gBattleAnimSpritePalette_140, 10140
	obj_pal gBattleAnimSpritePalette_141, 10141
	obj_pal gBattleAnimSpritePalette_141, 10142
	obj_pal gBattleAnimSpritePalette_143, 10143
	obj_pal gBattleAnimSpritePalette_144, 10144
	obj_pal gBattleAnimSpritePalette_139, 10145
	obj_pal gBattleAnimSpritePalette_115, 10146
	obj_pal gBattleAnimSpritePalette_147, 10147
	obj_pal gBattleAnimSpritePalette_148, 10148
	obj_pal gBattleAnimSpritePalette_148, 10149
	obj_pal gBattleAnimSpritePalette_150, 10150
	obj_pal gBattleAnimSpritePalette_150, 10151
	obj_pal gBattleAnimSpritePalette_152, 10152
	obj_pal gBattleAnimSpritePalette_153, 10153
	obj_pal gBattleAnimSpritePalette_154, 10154
	obj_pal gBattleAnimSpritePalette_155, 10155
	obj_pal gBattleAnimSpritePalette_156, 10156
	obj_pal gBattleAnimSpritePalette_157, 10157
	obj_pal gBattleAnimSpritePalette_158, 10158
	obj_pal gBattleAnimSpritePalette_159, 10159
	obj_pal gBattleAnimSpritePalette_160, 10160
	obj_pal gBattleAnimSpritePalette_161, 10161
	obj_pal gBattleAnimSpritePalette_162, 10162
	obj_pal gBattleAnimSpritePalette_163, 10163
	obj_pal gBattleAnimSpritePalette_164, 10164
	obj_pal gBattleAnimSpritePalette_165, 10165
	obj_pal gBattleAnimSpritePalette_166, 10166
	obj_pal gBattleAnimSpritePalette_167, 10167
	obj_pal gBattleAnimSpritePalette_168, 10168
	obj_pal gBattleAnimSpritePalette_169, 10169
	obj_pal gBattleAnimSpritePalette_170, 10170
	obj_pal gBattleAnimSpritePalette_171, 10171
	obj_pal gBattleAnimSpritePalette_172, 10172
	obj_pal gBattleAnimSpritePalette_001, 10173
	obj_pal gBattleAnimSpritePalette_174, 10174
	obj_pal gBattleAnimSpritePalette_175, 10175
	obj_pal gBattleAnimSpritePalette_176, 10176
	obj_pal gBattleAnimSpritePalette_177, 10177
	obj_pal gBattleAnimSpritePalette_178, 10178
	obj_pal gBattleAnimSpritePalette_179, 10179
	obj_pal gBattleAnimSpritePalette_179, 10180
	obj_pal gBattleAnimSpritePalette_179, 10181
	obj_pal gBattleAnimSpritePalette_182, 10182
	obj_pal gBattleAnimSpritePalette_183, 10183
	obj_pal gBattleAnimSpritePalette_184, 10184
	obj_pal gBattleAnimSpritePalette_185, 10185
	obj_pal gBattleAnimSpritePalette_186, 10186
	obj_pal gBattleAnimSpritePalette_187, 10187
	obj_pal gBattleAnimSpritePalette_188, 10188
	obj_pal gBattleAnimSpritePalette_189, 10189
	obj_pal gBattleAnimSpritePalette_190, 10190
	obj_pal gBattleAnimSpritePalette_191, 10191
	obj_pal gBattleAnimSpritePalette_192, 10192
	obj_pal gBattleAnimSpritePalette_193, 10193
	obj_pal gBattleAnimSpritePalette_194, 10194
	obj_pal gBattleAnimSpritePalette_195, 10195
	obj_pal gBattleAnimSpritePalette_196, 10196
	obj_pal gBattleAnimSpritePalette_197, 10197
	obj_pal gBattleAnimSpritePalette_198, 10198
	obj_pal gBattleAnimSpritePalette_199, 10199
	obj_pal gBattleAnimSpritePalette_200, 10200
	obj_pal gBattleAnimSpritePalette_201, 10201
	obj_pal gBattleAnimSpritePalette_202, 10202
	obj_pal gBattleAnimSpritePalette_203, 10203
	obj_pal gBattleAnimSpritePalette_204, 10204
	obj_pal gBattleAnimSpritePalette_205, 10205
	obj_pal gBattleAnimSpritePalette_206, 10206
	obj_pal gBattleAnimSpritePalette_207, 10207
	obj_pal gBattleAnimSpritePalette_167, 10208
	obj_pal gBattleAnimSpritePalette_209, 10209
	obj_pal gBattleAnimSpritePalette_210, 10210
	obj_pal gBattleAnimSpritePalette_211, 10211
	obj_pal gBattleAnimSpritePalette_211, 10212
	obj_pal gBattleAnimSpritePalette_211, 10213
	obj_pal gBattleAnimSpritePalette_064, 10214
	obj_pal gBattleAnimSpritePalette_215, 10215
	obj_pal gBattleAnimSpritePalette_216, 10216
	obj_pal gBattleAnimSpritePalette_217, 10217
	obj_pal gBattleAnimSpritePalette_218, 10218
	obj_pal gBattleAnimSpritePalette_219, 10219
	obj_pal gBattleAnimSpritePalette_220, 10220
	obj_pal gBattleAnimSpritePalette_221, 10221
	obj_pal gBattleAnimSpritePalette_222, 10222
	obj_pal gBattleAnimSpritePalette_223, 10223
	obj_pal gBattleAnimSpritePalette_224, 10224
	obj_pal gBattleAnimSpritePalette_225, 10225
	obj_pal gBattleAnimSpritePalette_226, 10226
	obj_pal gBattleAnimSpritePalette_226, 10227
	obj_pal gBattleAnimSpritePalette_228, 10228
	obj_pal gBattleAnimSpritePalette_229, 10229
	obj_pal gBattleAnimSpritePalette_230, 10230
	obj_pal gBattleAnimSpritePalette_231, 10231
	obj_pal gBattleAnimSpritePalette_231, 10232
	obj_pal gBattleAnimSpritePalette_233, 10233
	obj_pal gBattleAnimSpritePalette_234, 10234
	obj_pal gBattleAnimSpritePalette_235, 10235
	obj_pal gBattleAnimSpritePalette_236, 10236
	obj_pal gBattleAnimSpritePalette_237, 10237
	obj_pal gBattleAnimSpritePalette_238, 10238
	obj_pal gBattleAnimSpritePalette_239, 10239
	obj_pal gBattleAnimSpritePalette_240, 10240
	obj_pal gBattleAnimSpritePalette_241, 10241
	obj_pal gBattleAnimSpritePalette_242, 10242
	obj_pal gBattleAnimSpritePalette_243, 10243
	obj_pal gBattleAnimSpritePalette_244, 10244
	obj_pal gBattleAnimSpritePalette_245, 10245
	obj_pal gBattleAnimSpritePalette_245, 10246
	obj_pal gBattleAnimSpritePalette_064, 10247
	obj_pal gBattleAnimSpritePalette_248, 10248
	obj_pal gBattleAnimSpritePalette_249, 10249
	obj_pal gBattleAnimSpritePalette_249, 10250
	obj_pal gBattleAnimSpritePalette_251, 10251
	obj_pal gBattleAnimSpritePalette_252, 10252
	obj_pal gBattleAnimSpritePalette_253, 10253
	obj_pal gBattleAnimSpritePalette_254, 10254
	obj_pal gBattleAnimSpritePalette_255, 10255
	obj_pal gBattleAnimSpritePalette_256, 10256
	obj_pal gBattleAnimSpritePalette_257, 10257
	obj_pal gBattleAnimSpritePalette_258, 10258
	obj_pal gBattleAnimSpritePalette_259, 10259
	obj_pal gBattleAnimSpritePalette_260, 10260
	obj_pal gBattleAnimSpritePalette_261, 10261
	obj_pal gBattleAnimSpritePalette_262, 10262
	obj_pal gBattleAnimSpritePalette_263, 10263
	obj_pal gBattleAnimSpritePalette_264, 10264
	obj_pal gBattleAnimSpritePalette_265, 10265
	obj_pal gBattleAnimSpritePalette_266, 10266
	obj_pal gBattleAnimSpritePalette_267, 10267
	obj_pal gBattleAnimSpritePalette_268, 10268
	obj_pal gBattleAnimSpritePalette_269, 10269
	obj_pal gBattleAnimSpritePalette_270, 10270
	obj_pal gBattleAnimSpritePalette_271, 10271
	obj_pal gBattleAnimSpritePalette_272, 10272
	obj_pal gBattleAnimSpritePalette_272, 10273
	obj_pal gBattleAnimSpritePalette_274, 10274
	obj_pal gBattleAnimSpritePalette_274, 10275
	obj_pal gBattleAnimSpritePalette_274, 10276
	obj_pal gBattleAnimSpritePalette_277, 10277
	obj_pal gBattleAnimSpritePalette_278, 10278
	obj_pal gBattleAnimSpritePalette_279, 10279
	obj_pal gBattleAnimSpritePalette_280, 10280
	obj_pal gBattleAnimSpritePalette_281, 10281
	obj_pal gBattleAnimSpritePalette_282, 10282
	obj_pal gBattleAnimSpritePalette_283, 10283
	obj_pal gBattleAnimSpritePalette_284, 10284
	obj_pal gBattleAnimSpritePalette_285, 10285
	obj_pal gBattleAnimSpritePalette_286, 10286
	obj_pal gBattleAnimSpritePalette_287, 10287
	obj_pal gBattleAnimSpritePalette_288, 10288

	.align 2
gBattleAnimBackgroundTable:: @ 837F374
	.4byte gBattleAnimBackgroundImage_00, gBattleAnimBackgroundPalette_00, gBattleAnimBackgroundTilemap_00
	.4byte gBattleAnimBackgroundImage_00, gBattleAnimBackgroundPalette_00, gBattleAnimBackgroundTilemap_00
	.4byte gBattleAnimBackgroundImage_02, gBattleAnimBackgroundPalette_02, gBattleAnimBackgroundTilemap_02
	.4byte gBattleAnimBackgroundImage_03, gBattleAnimBackgroundPalette_03, gBattleAnimBackgroundTilemap_03
	.4byte gBattleAnimBackgroundImage_04, gBattleAnimBackgroundPalette_04, gBattleAnimBackgroundTilemap_04
	.4byte gBattleAnimBackgroundImage_04, gBattleAnimBackgroundPalette_04, gBattleAnimBackgroundTilemap_05
	.4byte gBattleAnimBackgroundImage_04, gBattleAnimBackgroundPalette_04, gBattleAnimBackgroundTilemap_06
	.4byte gBattleAnimBackgroundImage_07, gBattleAnimBackgroundPalette_07, gBattleAnimBackgroundTilemap_07
	.4byte gBattleAnimBackgroundImage_07, gBattleAnimBackgroundPalette_07, gBattleAnimBackgroundTilemap_08
	.4byte gBattleAnimBackgroundImage_09, gBattleAnimBackgroundPalette_09, gBattleAnimBackgroundTilemap_09
	.4byte gBattleAnimBackgroundImage_09, gBattleAnimBackgroundPalette_09, gBattleAnimBackgroundTilemap_10
	.4byte gBattleAnimBackgroundImage_11, gBattleAnimBackgroundPalette_11, gBattleAnimBackgroundTilemap_11
	.4byte gBattleAnimBackgroundImage_12, gBattleAnimBackgroundPalette_12, gBattleAnimBackgroundTilemap_12
	.4byte gBattleAnimBackgroundImage_12, gBattleAnimBackgroundPalette_12, gBattleAnimBackgroundTilemap_13
	.4byte gBattleAnimBackgroundImage_12, gBattleAnimBackgroundPalette_12, gBattleAnimBackgroundTilemap_14
	.4byte gBattleAnimBackgroundImage_15, gBattleAnimBackgroundPalette_15, gBattleAnimBackgroundTilemap_15
	.4byte gBattleAnimBackgroundImage_16, gBattleAnimBackgroundPalette_16, gBattleAnimBackgroundTilemap_16
	.4byte gBattleAnimBackgroundImage_17, gBattleAnimBackgroundPalette_17, gBattleAnimBackgroundTilemap_17
	.4byte gBattleAnimBackgroundImage_07, gBattleAnimBackgroundPalette_18, gBattleAnimBackgroundTilemap_07
	.4byte gBattleAnimBackgroundImage_07, gBattleAnimBackgroundPalette_18, gBattleAnimBackgroundTilemap_08
	.4byte gBattleAnimBackgroundImage_20, gBattleAnimBackgroundPalette_20, gBattleAnimBackgroundTilemap_20
	.4byte gBattleAnimBackgroundImage_21, gBattleAnimBackgroundPalette_21, gBattleAnimBackgroundTilemap_21
	.4byte gBattleAnimBackgroundImage_09, gBattleAnimBackgroundPalette_22, gBattleAnimBackgroundTilemap_09
	.4byte gBattleAnimBackgroundImage_09, gBattleAnimBackgroundPalette_22, gBattleAnimBackgroundTilemap_10
	.4byte gBattleAnimBackgroundImage_04, gBattleAnimBackgroundPalette_24, gBattleAnimBackgroundTilemap_04
	.4byte gBattleAnimBackgroundImage_04, gBattleAnimBackgroundPalette_24, gBattleAnimBackgroundTilemap_05
	.4byte gBattleAnimBackgroundImage_04, gBattleAnimBackgroundPalette_24, gBattleAnimBackgroundTilemap_06

	.align 2
gUnknown_0837F4B8:: @ 837F4B8
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

gUnknown_0837F578:: @ 837F578
	.incbin "baserom.gba", 0x0037f578, 0x20

gUnknown_0837F598:: @ 837F598
	.incbin "baserom.gba", 0x0037f598, 0x10

gUnknown_0837F5A8:: @ 837F5A8
	.incbin "baserom.gba", 0x0037f5a8, 0x4

gUnknown_0837F5AC:: @ 837F5AC
	.space 4

gUnknown_0837F5B0:: @ 837F5B0
	.incbin "baserom.gba", 0x0037f5b0, 0x30

gUnknown_0837F5E0:: @ 837F5E0
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

	.incbin "baserom.gba", 0x393054, 0x48

	.align 2
gSpriteAnim_839309C:: @ 839309C
	obj_image_anim_frame 0, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83930A4:: @ 83930A4
	.4byte gSpriteAnim_839309C

	.align 2
gBattleAnimSpriteTemplate_83930A8:: @ 83930A8
	spr_template 10283, 10283, gOamData_837DF34, gSpriteAnimTable_83930A4, NULL, gDummySpriteAffineAnimTable, sub_807A908

	.align 2
gBattleAnimSpriteTemplate_83930C0:: @ 83930C0
	spr_template 10283, 10283, gOamData_837DF34, gSpriteAnimTable_83930A4, NULL, gDummySpriteAffineAnimTable, sub_807A9BC

	.align 2
gSpriteAnim_83930D8:: @ 83930D8
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83930F0:: @ 83930F0
	.4byte gSpriteAnim_83930D8

	.align 2
gBattleAnimSpriteTemplate_83930F4:: @ 83930F4
	spr_template 10071, 10071, gOamData_837DF34, gSpriteAnimTable_83930F0, NULL, gDummySpriteAffineAnimTable, sub_807A63C

	.incbin "baserom.gba", 0x39310c, 0xcc

gUnknown_083931D8:: @ 83931D8
	.incbin "baserom.gba", 0x003931d8, 0x8

gUnknown_083931E0:: @ 83931E0
	.incbin "baserom.gba", 0x003931e0, 0x18

gUnknown_083931F8:: @ 83931F8
	.incbin "baserom.gba", 0x003931f8, 0x18

gUnknown_08393210:: @ 8393210
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/kyogre_dark.gbapal"
	.incbin "graphics/title_screen/kyogre_glow.gbapal"
	.else
	.incbin "graphics/title_screen/groudon_dark.gbapal"
	.incbin "graphics/title_screen/groudon_glow.gbapal"
	.endif

gUnknown_08393250:: @ 8393250
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/kyogre.4bpp.lz"
	.else
	.incbin "graphics/title_screen/groudon.4bpp.lz"
	.endif

gUnknown_083939EC:: @ 83939EC
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/kyogre_map.bin.lz"
	.else
	.incbin "graphics/title_screen/groudon_map.bin.lz"
	.endif

gUnknown_08393BF8:: @ 8393BF8
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/water_map.bin.lz"
	.else
	.incbin "graphics/title_screen/lava_map.bin.lz"
	.endif

	.incbin "graphics/title_screen/logo_shine.4bpp.lz"

gUnknown_08393E64:: @ 8393E64
	.incbin "baserom.gba", 0x00393e64, 0x68

gUnknown_08393ECC:: @ 8393ECC
	.incbin "baserom.gba", 0x00393ecc, 0x18

gUnknown_08393EE4:: @ 8393EE4
	.incbin "baserom.gba", 0x00393ee4, 0x18

gUnknown_08393EFC:: @ 8393EFC
	.incbin "baserom.gba", 0x00393efc, 0x78

gUnknown_08393F74:: @ 8393F74
	.incbin "baserom.gba", 0x00393f74, 0x18

gUnknown_08393F8C:: @ 8393F8C
	.incbin "baserom.gba", 0x00393f8c, 0x10

gUnknown_08393F9C:: @ 8393F9C
	.incbin "baserom.gba", 0x00393f9c, 0x24

gUnknown_08393FC0:: @ 8393FC0
	.incbin "baserom.gba", 0x00393fc0, 0x18

gUnknown_08393FD8:: @ 8393FD8
	.incbin "baserom.gba", 0x00393fd8, 0x2fd0

gUnknown_08396FA8:: @ 8396FA8
	.incbin "baserom.gba", 0x00396fa8, 0x1c

	.align 2
gUnknown_08396FC4:: @ 8396FC4
	.4byte 0x0202f7e8

	.align 2
gUnknown_08396FC8:: @ 8396FC8
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
gUnknown_083970B8:: @ 83970B8
	.4byte sub_807CC24
	.4byte sub_807CCAC
	.4byte nullsub_39
	.4byte nullsub_39

gUnknown_083970C8:: @ 83970C8
	.incbin "baserom.gba", 0x003970c8, 0x20

gUnknown_083970E8:: @ 83970E8
	.incbin "baserom.gba", 0x003970e8, 0x20

gUnknown_08397108:: @ 8397108
	.incbin "baserom.gba", 0x00397108, 0x20

gUnknown_08397128:: @ 8397128
	.incbin "baserom.gba", 0x00397128, 0x820

gUnknown_08397948:: @ 8397948
	.incbin "baserom.gba", 0x00397948, 0x3080

gUnknown_0839A9C8:: @ 839A9C8
	.incbin "baserom.gba", 0x0039a9c8, 0xc

gUnknown_0839A9D4:: @ 839A9D4
	.incbin "baserom.gba", 0x0039a9d4, 0x1c

gUnknown_0839A9F0:: @ 839A9F0
	.incbin "baserom.gba", 0x0039a9f0, 0x18

gUnknown_0839AA08:: @ 839AA08
	.incbin "baserom.gba", 0x0039aa08, 0x9c

gUnknown_0839AAA4:: @ 839AAA4
	.incbin "baserom.gba", 0x0039aaa4, 0x18

gUnknown_0839AABC:: @ 839AABC
	.incbin "baserom.gba", 0x0039aabc, 0x8

gUnknown_0839AAC4:: @ 839AAC4
	.incbin "baserom.gba", 0x0039aac4, 0x8

gUnknown_0839AACC:: @ 839AACC
	.incbin "baserom.gba", 0x0039aacc, 0x38

gUnknown_0839AB04:: @ 839AB04
	.incbin "baserom.gba", 0x0039ab04, 0x8c

gUnknown_0839AB90:: @ 839AB90
	.incbin "baserom.gba", 0x0039ab90, 0x18

gUnknown_0839ABA8:: @ 839ABA8
	obj_tiles 0x08397948, 2048, 0x1201

gUnknown_0839ABB0:: @ 839ABB0
	.incbin "baserom.gba", 0x0039abb0, 0x20

gUnknown_0839ABD0:: @ 839ABD0
	.incbin "baserom.gba", 0x0039abd0, 0x18

gUnknown_0839ABE8:: @ 839ABE8
	.incbin "baserom.gba", 0x0039abe8, 0x1c

gUnknown_0839AC04:: @ 839AC04
	.incbin "baserom.gba", 0x0039ac04, 0x38

gUnknown_0839AC3C:: @ 839AC3C
	.incbin "baserom.gba", 0x0039ac3c, 0x18

gUnknown_0839AC54:: @ 839AC54
	obj_tiles 0x08399fc8, 2560, 0x1204

gUnknown_0839AC5C:: @ 839AC5C
	.incbin "baserom.gba", 0x0039ac5c, 0xc

gUnknown_0839AC68:: @ 839AC68
	.incbin "baserom.gba", 0x0039ac68, 0x8

gUnknown_0839AC70:: @ 839AC70
	obj_tiles 0x08398988, 64, 0x1205

gUnknown_0839AC78:: @ 839AC78
	.incbin "baserom.gba", 0x0039ac78, 0x44

gUnknown_0839ACBC:: @ 839ACBC
	.incbin "baserom.gba", 0x0039acbc, 0x18

gUnknown_0839ACD4:: @ 839ACD4
	.incbin "baserom.gba", 0x0039acd4, 0x4

	.align 2
gUnknown_0839ACD8:: @ 839ACD8
	.4byte 0x02030202

gUnknown_0839ACDC:: @ 839ACDC
	.incbin "baserom.gba", 0x0039acdc, 0xc

gUnknown_0839ACE8:: @ 839ACE8
	.incbin "baserom.gba", 0x0039ace8, 0x4

gUnknown_0839ACEC:: @ 839ACEC
	.incbin "baserom.gba", 0x0039acec, 0xc

gUnknown_0839ACF8:: @ 839ACF8
	.incbin "baserom.gba", 0x0039acf8, 0x8

gUnknown_0839AD00:: @ 839AD00
	.incbin "baserom.gba", 0x0039ad00, 0x8

gUnknown_0839AD08:: @ 839AD08
	.incbin "baserom.gba", 0x0039ad08, 0x48

gUnknown_0839AD50:: @ 839AD50
	.incbin "baserom.gba", 0x0039ad50, 0x48

gUnknown_0839AD98:: @ 839AD98
	.incbin "baserom.gba", 0x0039ad98, 0x48

gUnknown_0839ADE0:: @ 839ADE0
	.incbin "baserom.gba", 0x0039ade0, 0x48

gUnknown_0839AE28:: @ 839AE28
	.incbin "baserom.gba", 0x0039ae28, 0x48

gUnknown_0839AE70:: @ 839AE70
	.incbin "baserom.gba", 0x0039ae70, 0x380

	.align 2
gUnknown_0839B1F0:: @ 839B1F0
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
gUnknown_0839B21C:: @ 839B21C
	.4byte Unknown_839B200
	.4byte Unknown_839B207
	.4byte Unknown_839B20E
	.4byte Unknown_839B215

gUnknown_0839B22C:: @ 839B22C
	.incbin "baserom.gba", 0x0039b22c, 0x1e

gUnknown_0839B24A:: @ 839B24A
	.incbin "baserom.gba", 0x0039b24a, 0x3

gUnknown_0839B24D:: @ 839B24D
	.incbin "baserom.gba", 0x0039b24d, 0x8

gUnknown_0839B255:: @ 839B255
	.incbin "baserom.gba", 0x0039b255, 0x2

gUnknown_0839B257:: @ 839B257
	.incbin "baserom.gba", 0x0039b257, 0x69

gUnknown_0839B2C0:: @ 839B2C0
	.incbin "baserom.gba", 0x0039b2c0, 0x1c8

	.align 2
gUnknown_0839B488:: @ 839B488
	.4byte IsTrainerInRangeSouth
	.4byte IsTrainerInRangeNorth
	.4byte IsTrainerInRangeWest
	.4byte IsTrainerInRangeEast

	.align 2
gUnknown_0839B498:: @ 839B498
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

gUnknown_0839B4C8:: @ 839B4C8
	.incbin "baserom.gba", 0x0039b4c8, 0x48

gUnknown_0839B510:: @ 839B510
	.incbin "baserom.gba", 0x0039b510, 0x18

gUnknown_0839B528:: @ 839B528
	.incbin "baserom.gba", 0x0039b528, 0x18

@ 839B540
	.include "data/wild_mons.s"

gUnknown_0839DBFC:: @ 839DBFC
	.incbin "baserom.gba", 0x0039dbfc, 0x4

gUnknown_0839DC00:: @ 839DC00
	.incbin "baserom.gba", 0x0039dc00, 0x14
	.incbin "graphics/birch_speech/birch.4bpp"
	.incbin "graphics/birch_speech/birch.gbapal"
	.incbin "baserom.gba", 0x0039e434, 0x20 @ another palette, unknown?

	.align 2
gFieldEffectObjectPalette4: @ 839E454
	.incbin "graphics/field_effect_objects/palettes/04.gbapal"

	.incbin "graphics/misc/center_monitor.4bpp"
	.incbin "baserom.gba", 0x39e5F4, 0x200
	.incbin "baserom.gba", 0x39e7F4, 0x100

	.align 2
gFieldEffectObjectPalette5: @ 839E8F4
	.incbin "graphics/field_effect_objects/palettes/05.gbapal"

gUnknown_0839E914:: @ 839E914
	.incbin "baserom.gba", 0x0039e914, 0x200

gUnknown_0839EB14:: @ 839EB14
	.incbin "baserom.gba", 0x0039eb14, 0x20

gUnknown_0839EB34:: @ 839EB34
	.incbin "baserom.gba", 0x0039eb34, 0x280

gUnknown_0839EDB4:: @ 839EDB4
	.incbin "baserom.gba", 0x0039edb4, 0x80

gUnknown_0839EE34:: @ 839EE34
	.incbin "baserom.gba", 0x0039ee34, 0x20

gUnknown_0839EE54:: @ 839EE54
	.incbin "baserom.gba", 0x0039ee54, 0x280

	.align 2
gUnknown_0839F0D4:: @ 839F0D4
	.4byte FieldEffectCmd_loadtiles
	.4byte FieldEffectCmd_loadfadedpal
	.4byte FieldEffectCmd_loadpal
	.4byte FieldEffectCmd_callnative
	.4byte sub_8085700
	.4byte FieldEffectCmd_loadgfx_callnative
	.4byte FieldEffectCmd_loadtiles_callnative
	.4byte FieldEffectCmd_loadfadedpal_callnative

gUnknown_0839F0F4:: @ 839F0F4
	.incbin "baserom.gba", 0x0039f0f4, 0x20

gUnknown_0839F114:: @ 839F114
	.incbin "baserom.gba", 0x0039f114, 0x14

gUnknown_0839F128:: @ 839F128
	.incbin "baserom.gba", 0x0039f128, 0x18

	.align 2
gFieldEffectObjectPaletteInfo4:: @ 839F140
	obj_pal gFieldEffectObjectPalette4, 0x1007

	.align 2
gFieldEffectObjectPaletteInfo5:: @ 839F148
	obj_pal gFieldEffectObjectPalette5, 0x1010

	.incbin "baserom.gba", 0x39F150, 0x50

gUnknown_0839F1A0:: @ 839F1A0
	.incbin "baserom.gba", 0x0039f1a0, 0x28

gUnknown_0839F1C8:: @ 839F1C8
	.incbin "baserom.gba", 0x0039f1c8, 0x40

gUnknown_0839F208:: @ 839F208
	.incbin "baserom.gba", 0x0039f208, 0x18

gUnknown_0839F220:: @ 839F220
	.incbin "baserom.gba", 0x0039f220, 0x18

gUnknown_0839F238:: @ 839F238
	.incbin "baserom.gba", 0x0039f238, 0x18

gUnknown_0839F250:: @ 839F250
	.incbin "baserom.gba", 0x0039f250, 0x18

	.align 2
gUnknown_0839F268:: @ 839F268
	.4byte sub_8085DF4
	.4byte sub_8085E30
	.4byte sub_8085E6C
	.4byte sub_8085E94

	.align 2
gUnknown_0839F278:: @ 839F278
	.4byte sub_8085F40
	.4byte sub_8085FB4
	.4byte sub_8085FE4
	.4byte sub_808600C

	.align 2
gUnknown_0839F288:: @ 839F288
	.4byte sub_80860BC
	.4byte sub_8086154
	.4byte sub_8086188
	.4byte sub_80862C8
	.4byte sub_80863BC
	.4byte sub_80863D8
	.4byte sub_80863E0
	.4byte nullsub_57

gUnknown_0839F2A8:: @ 839F2A8
	.incbin "baserom.gba", 0x0039f2a8, 0x18

gUnknown_0839F2C0:: @ 839F2C0
	.incbin "baserom.gba", 0x0039f2c0, 0x4

gUnknown_0839F2C4:: @ 839F2C4
	.incbin "baserom.gba", 0x0039f2c4, 0x4

gUnknown_0839F2C8:: @ 839F2C8
	.space 4

	.align 2
gUnknown_0839F2CC:: @ 839F2CC
	.4byte sub_80867AC
	.4byte sub_8086854
	.4byte sub_8086870
	.4byte sub_80868E4
	.4byte sub_808699C
	.4byte sub_80869B8
	.4byte sub_80869F8

	.align 2
gUnknown_0839F2E8:: @ 839F2E8
	.4byte sub_8086AA0
	.4byte sub_8086AC0
	.4byte sub_8086B30
	.4byte sub_8086B54
	.4byte sub_8086B64
	.4byte sub_8086B88

	.align 2
gUnknown_0839F300:: @ 839F300
	.4byte sub_8086CF4
	.4byte sub_8086D70
	.4byte sub_8086DB0
	.4byte sub_8086E10
	.4byte sub_8086E50
	.4byte sub_8086EB0
	.4byte sub_8086ED4

	.align 2
gUnknown_0839F31C:: @ 839F31C
	.4byte sub_8086FB0
	.4byte waterfall_1_do_anim_probably
	.4byte waterfall_2_wait_anim_finish_probably
	.4byte sub_8087030
	.4byte sub_8087058

	.align 2
gUnknown_0839F330:: @ 839F330
	.4byte sub_8087124
	.4byte dive_2_unknown
	.4byte dive_3_unknown

	.align 2
gUnknown_0839F33C:: @ 839F33C
	.4byte sub_808722C
	.4byte sub_8087264
	.4byte sub_8087298
	.4byte sub_80872E4
	.4byte sub_80873D8
	.4byte sub_80873F4

	.align 2
gUnknown_0839F354:: @ 839F354
	.4byte sub_80874CC
	.4byte sub_80874FC
	.4byte sub_8087548
	.4byte sub_808759C

	.align 2
gUnknown_0839F364:: @ 839F364
	.4byte sub_80876C8
	.4byte sub_80876F8
	.4byte sub_8087774
	.4byte sub_80877AC
	.4byte sub_80877D4

	.align 2
gUnknown_0839F378:: @ 839F378
	.4byte sub_80878F4
	.4byte sub_8087914

gUnknown_0839F380:: @ 839F380
	.incbin "baserom.gba", 0x0039f380, 0x8

	.align 2
gUnknown_0839F388:: @ 839F388
	.4byte sub_8087AA4
	.4byte sub_8087AC8

	.align 2
gUnknown_0839F390:: @ 839F390
	.4byte sub_8087BEC
	.4byte sub_8087C14
	.4byte sub_8087CA4
	.4byte sub_8087D78

	.align 2
gUnknown_0839F3A0:: @ 839F3A0
	.4byte sub_8087E4C
	.4byte sub_8087ED8
	.4byte sub_8087FDC

	.align 2
gUnknown_0839F3AC:: @ 839F3AC
	.4byte sub_8088150
	.4byte sub_80881C0
	.4byte sub_8088228
	.4byte sub_80882B4
	.4byte sub_80882E4
	.4byte sub_8088338
	.4byte sub_8088380

	.align 2
gUnknown_0839F3C8:: @ 839F3C8
	.4byte sub_80884AC
	.4byte sub_80884E8
	.4byte sub_8088554
	.4byte sub_80885A8
	.4byte sub_80885D8
	.4byte sub_808860C
	.4byte sub_808862C

	.align 2
gUnknown_0839F3E4:: @ 839F3E4
	.4byte sub_8088984
	.4byte sub_80889E4
	.4byte sub_8088A30
	.4byte sub_8088A78
	.4byte sub_8088AF4

	.align 2
gUnknown_0839F3F8:: @ 839F3F8
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
gUnknown_0839F44C:: @ 839F44C
	.4byte Unknown_839F41C
	.4byte Unknown_839F434

	.align 2
gUnknown_0839F454:: @ 839F454
	.4byte sub_80892A0
	.4byte sub_8089354
	.4byte sub_80893C0
	.4byte sub_8089414
	.4byte sub_808948C
	.4byte sub_80894C4
	.4byte fishE

gUnknown_0839F470:: @ 839F470
	.incbin "baserom.gba", 0x0039f470, 0x24

	.align 2
gUnknown_0839F494:: @ 839F494
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

gUnknown_0839F554:: @ 839F554
	.incbin "baserom.gba", 0x0039f554, 0x24

gUnknown_0839F578:: @ 839F578
	.incbin "baserom.gba", 0x0039f578, 0xc

gUnknown_0839F584:: @ 839F584
	.incbin "baserom.gba", 0x0039f584, 0x8

gUnknown_0839F58C:: @ 839F58C
	.incbin "baserom.gba", 0x0039f58c, 0x70

gUnknown_0839F5FC:: @ 839F5FC
	.incbin "baserom.gba", 0x0039f5fc, 0x40

gUnknown_0839F63C:: @ 839F63C
	.incbin "baserom.gba", 0x0039f63c, 0x42

gUnknown_0839F67E:: @ 839F67E
	.incbin "baserom.gba", 0x0039f67e, 0xc0

gUnknown_0839F73E:: @ 839F73E
	.incbin "baserom.gba", 0x0039f73e, 0x162

gUnknown_0839F8A0:: @ 839F8A0
	.incbin "baserom.gba", 0x0039f8a0, 0xe8

gUnknown_0839F988:: @ 839F988
	.incbin "baserom.gba", 0x0039f988, 0xf4

gUnknown_0839FA7C:: @ 839FA7C
	.incbin "graphics/pokedex/noball.4bpp.lz"

gUnknown_0839FAC4:: @ 839FAC4
	.incbin "baserom.gba", 0x0039fac4, 0x336

gUnknown_0839FDFA:: @ 839FDFA
	.incbin "baserom.gba", 0x0039fdfa, 0x304

gUnknown_083A00FE:: @ 83A00FE
	.incbin "baserom.gba", 0x003a00fe, 0x426

gUnknown_083A0524:: @ 83A0524
	.incbin "baserom.gba", 0x003a0524, 0x18

gUnknown_083A053C:: @ 83A053C
	.incbin "baserom.gba", 0x003a053c, 0x18

gUnknown_083A0554:: @ 83A0554
	.incbin "baserom.gba", 0x003a0554, 0x18

gUnknown_083A056C:: @ 83A056C
	.incbin "baserom.gba", 0x003a056c, 0x18

gUnknown_083A0584:: @ 83A0584
	.incbin "baserom.gba", 0x003a0584, 0x18

gUnknown_083A059C:: @ 83A059C
	.incbin "baserom.gba", 0x003a059c, 0x18

gUnknown_083A05B4:: @ 83A05B4
	.incbin "baserom.gba", 0x003a05b4, 0x18

gUnknown_083A05CC:: @ 83A05CC
	.incbin "baserom.gba", 0x003a05cc, 0x10

gUnknown_083A05DC:: @ 83A05DC
	.incbin "baserom.gba", 0x003a05dc, 0x10

gUnknown_083A05EC:: @ 83A05EC
	.incbin "baserom.gba", 0x003a05ec, 0x5

gUnknown_083A05F1:: @ 83A05F1
	.incbin "baserom.gba", 0x003a05f1, 0x7

gUnknown_083A05F8:: @ 83A05F8
@ not sure if this is even a string, wont label
	.string "$"

@ 83A05F9
	.include "data/pokedex_entries.s"

gUnknown_083B4EC4:: @ 83B4EC4
	.space 32

@ 83B4EE4
	.include "data/graphics/pokemon/footprint_table.s"

gUnknown_083B5558:: @ 83B5558
	.incbin "baserom.gba", 0x003b5558, 0x2c

	.align 2
gUnknown_083B5584:: @ 83B5584
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
gUnknown_083B5794:: @ 83B5794
	.4byte Unknown_83B5594
	.4byte Unknown_83B5614
	.4byte Unknown_83B5694
	.4byte Unknown_83B5714

gUnknown_083B57A4:: @ 83B57A4
	.incbin "baserom.gba", 0x003b57a4, 0x18

gUnknown_083B57BC:: @ 83B57BC
	.incbin "baserom.gba", 0x003b57bc, 0x28

gUnknown_083B57E4:: @ 83B57E4
	.incbin "baserom.gba", 0x003b57e4, 0x18

gUnknown_083B57FC:: @ 83B57FC
	.incbin "baserom.gba", 0x003b57fc, 0x54

gUnknown_083B5850:: @ 83B5850
	.incbin "baserom.gba", 0x003b5850, 0x1c

gUnknown_083B586C:: @ 83B586C
	.incbin "baserom.gba", 0x003b586c, 0x1c

gUnknown_083B5888:: @ 83B5888
	.incbin "baserom.gba", 0x003b5888, 0x1c

gUnknown_083B58A4:: @ 83B58A4
	.incbin "baserom.gba", 0x003b58a4, 0x1c

gUnknown_083B58C0:: @ 83B58C0
	.incbin "baserom.gba", 0x003b58c0, 0x18

gUnknown_083B58D8:: @ 83B58D8
	.incbin "baserom.gba", 0x003b58d8, 0x38

gUnknown_083B5910:: @ 83B5910
	.incbin "baserom.gba", 0x003b5910, 0x58

gUnknown_083B5968:: @ 83B5968
	.incbin "baserom.gba", 0x003b5968, 0x60

gUnknown_083B59C8:: @ 83B59C8
	.incbin "baserom.gba", 0x003b59c8, 0x98

gUnknown_083B5A60:: @ 83B5A60
	.incbin "baserom.gba", 0x003b5a60, 0x2

gUnknown_083B5A62:: @ 83B5A62
	.incbin "baserom.gba", 0x003b5a62, 0x6

gUnknown_083B5A68:: @ 83B5A68
	.incbin "baserom.gba", 0x003b5a68, 0x14

gUnknown_083B5A7C:: @ 83B5A7C
	.incbin "baserom.gba", 0x003b5a7c, 0x30

gUnknown_083B5AAC:: @ 83B5AAC
	.incbin "baserom.gba", 0x003b5aac, 0x6

gUnknown_083B5AB2:: @ 83B5AB2
	.incbin "baserom.gba", 0x003b5ab2, 0x6

gUnknown_083B5AB8:: @ 83B5AB8
	.incbin "baserom.gba", 0x003b5ab8, 0x404

	.align 2
gUnknown_083B5EBC:: @ 83B5EBC
	.4byte sub_8093864
	.4byte sub_80938A8
	.4byte rfu_NI_stopReceivingData
	.4byte sub_8093918
	.4byte sub_8093938
	.4byte sub_8093954
	.4byte sub_8093980

	.align 2
gUnknown_083B5ED8:: @ 83B5ED8
	.4byte sub_8093AA0
	.4byte sub_8093AF0
	.4byte sub_8093C0C
	.4byte sub_8093C38
	.4byte sub_8093D50

	.align 2
gUnknown_083B5EEC:: @ 83B5EEC
	.4byte 0x08e8cac0
	.4byte 0x08e8d4c0

gUnknown_083B5EF4:: @ 83B5EF4
	.incbin "baserom.gba", 0x003b5ef4, 0x4

	.align 2
gUnknown_083B5EF8:: @ 83B5EF8
	.4byte 0x08e8c8e0
	.4byte 0x08e8c940
	.4byte 0x08e8c9a0
	.4byte 0x08e8ca00
	.4byte 0x08e8ca60

gUnknown_083B5F0C:: @ 83B5F0C
	.incbin "baserom.gba", 0x003b5f0c, 0x20

gUnknown_083B5F2C:: @ 83B5F2C
	.incbin "baserom.gba", 0x003b5f2c, 0x20

gUnknown_083B5F4C:: @ 83B5F4C
	.incbin "baserom.gba", 0x003b5f4c, 0x20

gUnknown_083B5F6C:: @ 83B5F6C
	.incbin "baserom.gba", 0x003b5f6c, 0x20

gUnknown_083B5F8C:: @ 83B5F8C
	.incbin "baserom.gba", 0x003b5f8c, 0x40

gUnknown_083B5FCC:: @ 83B5FCC
	.incbin "baserom.gba", 0x003b5fcc, 0x28

gUnknown_083B5FF4:: @ 83B5FF4
	.incbin "baserom.gba", 0x003b5ff4, 0x18

gUnknown_083B600C:: @ 83B600C
	.incbin "baserom.gba", 0x003b600c, 0x40

gUnknown_083B604C:: @ 83B604C
	.incbin "baserom.gba", 0x003b604c, 0x24

gUnknown_083B6070:: @ 83B6070
	.incbin "baserom.gba", 0x003b6070, 0x20

gUnknown_083B6090:: @ 83B6090
	.incbin "baserom.gba", 0x003b6090, 0x800

gUnknown_083B6890:: @ 83B6890
	.incbin "baserom.gba", 0x003b6890, 0x180

gUnknown_083B6A10:: @ 83B6A10
	.incbin "baserom.gba", 0x003b6a10, 0x20

gUnknown_083B6A30:: @ 83B6A30
	.incbin "baserom.gba", 0x003b6a30, 0x20

gUnknown_083B6A50:: @ 83B6A50
	.incbin "baserom.gba", 0x003b6a50, 0x324

gUnknown_083B6D74:: @ 83B6D74
	.incbin "baserom.gba", 0x003b6d74, 0x20

gUnknown_083B6D94:: @ 83B6D94
	.incbin "baserom.gba", 0x003b6d94, 0x20

gUnknown_083B6DB4:: @ 83B6DB4
	.incbin "baserom.gba", 0x003b6db4, 0x4

	.align 2
gUnknown_083B6DB8:: @ 83B6DB8
	.4byte 0x02039360

gUnknown_083B6DBC:: @ 83B6DBC
	obj_pal 0x083b6b94, 0xdacd

gUnknown_083B6DC4:: @ 83B6DC4
	obj_tiles 0x083b6bb4, 448, 0x0005

gUnknown_083B6DCC:: @ 83B6DCC
	obj_tiles 0x02002784, 2048, 0x0002

gUnknown_083B6DD4:: @ 83B6DD4
	obj_pal 0x02002704, 0xdac7

gUnknown_083B6DDC:: @ 83B6DDC
	.incbin "baserom.gba", 0x003b6ddc, 0x18

gUnknown_083B6DF4:: @ 83B6DF4
	.incbin "baserom.gba", 0x003b6df4, 0x108

gUnknown_083B6EFC:: @ 83B6EFC
	.incbin "baserom.gba", 0x003b6efc, 0x18

gUnknown_083B6F14:: @ 83B6F14
	.incbin "baserom.gba", 0x003b6f14, 0x48

	.align 2
gUnknown_083B6F5C:: @ 83B6F5C
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

gUnknown_083BB0A8:: @ 83BB0A8
	.incbin "baserom.gba", 0x003bb0a8, 0x40

gUnknown_083BB0E8:: @ 83BB0E8
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

gUnknown_083BB288:: @ 83BB288
	obj_tiles 0x083bb208, 128, 0x0006

gUnknown_083BB290:: @ 83BB290
	.incbin "baserom.gba", 0x003bb290, 0x28

gUnknown_083BB2B8:: @ 83BB2B8
	.incbin "baserom.gba", 0x003bb2b8, 0x38

gUnknown_083BB2F0:: @ 83BB2F0
	.incbin "baserom.gba", 0x003bb2f0, 0x8d8

	.align 2
gUnknown_083BBBC8:: @ 83BBBC8
	.4byte sub_809B150
	.4byte sub_809B1D8
	.4byte sub_809B24C

gUnknown_083BBBD4:: @ 83BBBD4
	.incbin "baserom.gba", 0x003bbbd4, 0x28

gUnknown_083BBBFC:: @ 83BBBFC
	.incbin "baserom.gba", 0x003bbbfc, 0x18

gUnknown_083BBC14:: @ 83BBC14
	.incbin "baserom.gba", 0x003bbc14, 0x5c

gUnknown_083BBC70:: @ 83BBC70
	.incbin "baserom.gba", 0x003bbc70, 0x18

gUnknown_083BBC88:: @ 83BBC88
	.incbin "baserom.gba", 0x003bbc88, 0x18

	.align 2
gUnknown_083BBCA0:: @ 83BBCA0
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

gUnknown_083BC5E8:: @ 83BC5E8
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
gUnknown_083BC62C:: @ 83BC62C
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
gUnknown_083BC660:: @ 83BC660
	.4byte Unknown_83BC640
	.4byte Unknown_83BC650

gUnknown_083BC668:: @ 83BC668
	.incbin "baserom.gba", 0x003bc668, 0x18

@ 83BC680
	.include "data/text/move_descriptions.s"

@ 83C0F60
	.include "data/text/nature_names.s"

gUnknown_083C1068:: @ 83C1068
	.incbin "baserom.gba", 0x003c1068, 0x150

gUnknown_083C11B8:: @ 83C11B8
	obj_tiles 0x08e71d10, 5888, 0x7532

gUnknown_083C11C0:: @ 83C11C0
	.incbin "baserom.gba", 0x003c11c0, 0x18

gUnknown_083C11D8:: @ 83C11D8
	.incbin "baserom.gba", 0x003c11d8, 0x98

gUnknown_083C1270:: @ 83C1270
	obj_tiles 0x08e7274c, 1024, 0x7530

gUnknown_083C1278:: @ 83C1278
	obj_pal 0x08e72848, 0x7530

gUnknown_083C1280:: @ 83C1280
	.incbin "baserom.gba", 0x003c1280, 0x74

gUnknown_083C12F4:: @ 83C12F4
	obj_tiles 0x08e72860, 896, 0x7531

gUnknown_083C12FC:: @ 83C12FC
	obj_pal 0x08e72a50, 0x7531

gUnknown_083C1304:: @ 83C1304
	.incbin "baserom.gba", 0x003c1304, 0x18

gUnknown_083C131C:: @ 83C131C
	.incbin "baserom.gba", 0x003c131c, 0x20

gUnknown_083C133C:: @ 83C133C
	.incbin "baserom.gba", 0x003c133c, 0x140

gUnknown_083C147C:: @ 83C147C
	.incbin "baserom.gba", 0x003c147c, 0x100

gUnknown_083C157C:: @ 83C157C
	.incbin "baserom.gba", 0x003c157c, 0x2

gUnknown_083C157E:: @ 83C157E
	.incbin "baserom.gba", 0x003c157e, 0x2

gUnknown_083C1580:: @ 83C1580
	.4byte sub_809FC0C
	.4byte sub_809FEB8

	.align 2
gUnknown_083C1588:: @ 83C1588
	.4byte sub_809F63C
	.4byte sub_809F650
	.4byte sub_809F664
	.4byte sub_809F664

	.align 2
gUnknown_083C1598:: @ 83C1598
	.4byte sub_809FE6C
	.4byte sub_80A0090
	.4byte sub_80A015C
	.4byte sub_80A015C

gUnknown_083C15A8:: @ 83C15A8
	.incbin "baserom.gba", 0x003c15a8, 0x6

gUnknown_083C15AE:: @ 83C15AE
	.incbin "baserom.gba", 0x003c15ae, 0x6

gUnknown_083C15B4:: @ 83C15B4
	.incbin "baserom.gba", 0x003c15b4, 0x8

	.align 2
gUnknown_083C15BC:: @ 83C15BC
	.byte  9,  1, 0,  2
	.byte 10,  3, 0,  4
	.byte  8,  5, 0,  6
	.byte 11,  7, 0,  8
	.byte 14,  9, 0, 10
	.byte 12, 11, 0, 12
	.byte 13, 13, 0, 14
	.byte -1, 15, 0, 10

	.align 2
gOamData_CutGrass:: @ 83C15DC
	.2byte 0
	.2byte 0
	.2byte 0x1401

	.align 2
gSpriteAnim_CutGrass:: @ 83C15E4
	obj_image_anim_frame 0, 30
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_CutGrass:: @ 83C15EC
	.4byte gSpriteAnim_CutGrass

	.align 2
gSpriteImageTable_CutGrass:: @ 83C15F0
	obj_frame_tiles gFieldEffectPic_CutGrass, 0x20

	.align 2
gFieldEffectObjectPaletteInfo6:: @ 83C15F8
	obj_pal gFieldEffectObjectPalette6, 0x1000

	.align 2
gSpriteTemplate_CutGrass:: @ 83C1600
	spr_template 0xFFFF, 0x1000, gOamData_CutGrass, gSpriteAnimTable_CutGrass, gSpriteImageTable_CutGrass, gDummySpriteAffineAnimTable, sub_80A2A48

gUnknown_083C1618:: @ 83C1618
	.incbin "baserom.gba", 0x003c1618, 0x28

gUnknown_083C1640:: @ 83C1640
	.incbin "baserom.gba", 0x003c1640, 0x50

gUnknown_083C1690:: @ 83C1690
	.incbin "baserom.gba", 0x003c1690, 0x1e

gUnknown_083C16AE:: @ 83C16AE
	.incbin "baserom.gba", 0x003c16ae, 0xa

gUnknown_083C16B8:: @ 83C16B8
	.incbin "baserom.gba", 0x003c16b8, 0x4

	.align 2
gUnknown_083C16BC:: @ 83C16BC
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
gUnknown_083C16F4:: @ 83C16F4
	.4byte sub_80A5E60
	.4byte sub_80A5E90

	.align 2
gUnknown_083C16FC:: @ 83C16FC
	.4byte sub_80A65AC
	.4byte sub_80A6618

gUnknown_083C1704:: @ 83C1704
	.incbin "baserom.gba", 0x003c1704, 0x4

gUnknown_083C1708:: @ 83C1708
	.incbin "baserom.gba", 0x003c1708, 0x2

gUnknown_083C170A:: @ 83C170A
Unknown_83C170A:
	.incbin "baserom.gba", 0x003c170a, 0x592
Unknown_83C1C9C:
	.incbin "baserom.gba", 0x003c1c9c, 0x28

gUnknown_083C1CC4:: @ 83C1CC4
	.4byte Unknown_83C1C9C

gUnknown_083C1CC8:: @ 83C1CC8
	obj_tiles 0x08e75024, 12288, 0x7530

gUnknown_083C1CD0:: @ 83C1CD0
	obj_tiles 0x08e75ba0, 12288, 0x7530

gUnknown_083C1CD8:: @ 83C1CD8
	obj_pal 0x08e76700, 0x7530

gUnknown_083C1CE0:: @ 83C1CE0
Unknown_83C1CE0:
	.incbin "baserom.gba", 0x003c1ce0, 0x20
Unknown_83C1D00:
	.incbin "baserom.gba", 0x003c1d00, 0x20

gUnknown_083C1D20:: @ 83C1D20
	.4byte Unknown_83C1D00

gUnknown_083C1D24:: @ 83C1D24
	.incbin "baserom.gba", 0x003c1d24, 0xc

gUnknown_083C1D30:: @ 83C1D30
	obj_pal 0x083c170c, 0x0008

gUnknown_083C1D38:: @ 83C1D38
	.incbin "baserom.gba", 0x003c1d38, 0x3c

gUnknown_083C1D74:: @ 83C1D74
	.incbin "baserom.gba", 0x003c1d74, 0x90

gUnknown_083C1E04:: @ 83C1E04
	.incbin "baserom.gba", 0x003c1e04, 0x18

@ 83C1E1C
	.include "data/graphics/berries/graphics_table.s"

gUnknown_083C1F74:: @ 83C1F74
	obj_tiles 0x08e78bb4, 2048, 0x2710

gUnknown_083C1F7C:: @ 83C1F7C
	.incbin "baserom.gba", 0x003c1f7c, 0x1c

gUnknown_083C1F98:: @ 83C1F98
	.incbin "baserom.gba", 0x003c1f98, 0x18

	.align 2
gBattleAnimSpriteTemplate_83C1FB0:: @ 83C1FB0
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A8530

	.align 2
gBattleAnimSpriteTemplate_83C1FC8:: @ 83C1FC8
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A85C8

	.align 2
gBattleAnimSpriteTemplate_83C1FE0:: @ 83C1FE0
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A8638

	.align 2
gBattleAnimSpriteTemplate_83C1FF8:: @ 83C1FF8
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A8764

	.align 2
gBattleAnimSpriteTemplate_83C2010:: @ 83C2010
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A8818

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
gUnknown_083C91F0:: @ 83C91F0
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

gUnknown_083C9228:: @ 83C9228
	.incbin "baserom.gba", 0x003c9228, 0x46

gUnknown_083C926E:: @ 83C926E
	.incbin "baserom.gba", 0x003c926e, 0x8

gUnknown_083C9276:: @ 83C9276
	.incbin "baserom.gba", 0x003c9276, 0xc

gUnknown_083C9282:: @ 83C9282
	.incbin "baserom.gba", 0x003c9282, 0xc

gUnknown_083C928E:: @ 83C928E
	.incbin "baserom.gba", 0x003c928e, 0x8

gUnknown_083C9296:: @ 83C9296
	.incbin "baserom.gba", 0x003c9296, 0x12

gUnknown_083C92A8:: @ 83C92A8
	.incbin "baserom.gba", 0x003c92a8, 0xc

gUnknown_083C92B4:: @ 83C92B4
	obj_tiles 0x083c922d, 32, 0x04b0

gUnknown_083C92BC:: @ 83C92BC
	.incbin "baserom.gba", 0x003c92bc, 0x10

gUnknown_083C92CC:: @ 83C92CC
	.incbin "baserom.gba", 0x003c92cc, 0x18

	.align 2
gUnknown_083C92E4:: @ 83C92E4
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

gUnknown_083C932C:: @ 83C932C
	.incbin "baserom.gba", 0x003c932c, 0xb

gUnknown_083C9337:: @ 83C9337
	.incbin "baserom.gba", 0x003c9337, 0x4

gUnknown_083C933B:: @ 83C933B
	.incbin "baserom.gba", 0x003c933b, 0x29

gUnknown_083C9364:: @ 83C9364
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
gUnknown_083C93B4:: @ 83C93B4
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
gUnknown_083C93F0:: @ 83C93F0
	.4byte Unknown_83C93C8
	.4byte Unknown_83C93D2
	.4byte Unknown_83C93DC
	.4byte Unknown_83C93E6

gUnknown_083C9400:: @ 83C9400
	.incbin "baserom.gba", 0x003c9400, 0x8

gUnknown_083C9408:: @ 83C9408

	.include "data/contest_opponents.s"

gUnknown_083CA308:: @ 83CA308
	.incbin "baserom.gba", 0x003ca308, 0x8

gUnknown_083CA310:: @ 83CA310
	.incbin "baserom.gba", 0x003ca310, 0x8

gUnknown_083CA318:: @ 83CA318
	.incbin "baserom.gba", 0x003ca318, 0x18

gUnknown_083CA330:: @ 83CA330
	.incbin "baserom.gba", 0x003ca330, 0x8

gUnknown_083CA338:: @ 83CA338
	.incbin "baserom.gba", 0x003ca338, 0x4

gUnknown_083CA33C:: @ 83CA33C
	.incbin "baserom.gba", 0x003ca33c, 0x4

gUnknown_083CA340:: @ 83CA340
	.space 1

gUnknown_083CA341:: @ 83CA341
	.incbin "baserom.gba", 0x003ca341, 0xf

gUnknown_083CA350:: @ 83CA350
	.incbin "baserom.gba", 0x003ca350, 0x5c

gUnknown_083CA3AC:: @ 83CA3AC
	.incbin "baserom.gba", 0x003ca3ac, 0x18

gUnknown_083CA3C4:: @ 83CA3C4
	obj_tiles 0x08e69404, 256, 0x4e26
	obj_tiles 0x08e69404, 256, 0x4e27
	obj_tiles 0x08e69404, 256, 0x4e28
	obj_tiles 0x08e69404, 256, 0x4e29

gUnknown_083CA3E4:: @ 83CA3E4
	.incbin "baserom.gba", 0x003ca3e4, 0x10

gUnknown_083CA3F4:: @ 83CA3F4
	.incbin "baserom.gba", 0x003ca3f4, 0x70

gUnknown_083CA464:: @ 83CA464
	.incbin "baserom.gba", 0x003ca464, 0x8

gUnknown_083CA46C:: @ 83CA46C
	obj_tiles 0x08e69648, 1024, 0xabe2

gUnknown_083CA474:: @ 83CA474
	.incbin "baserom.gba", 0x003ca474, 0x10

gUnknown_083CA484:: @ 83CA484
	.incbin "baserom.gba", 0x003ca484, 0x20

gUnknown_083CA4A4:: @ 83CA4A4
	.incbin "baserom.gba", 0x003ca4a4, 0x18

gUnknown_083CA4BC:: @ 83CA4BC
	obj_tiles 0x08d1c748, 2048, 0x4e25

gUnknown_083CA4C4:: @ 83CA4C4
	obj_tiles 0x08d19590, 896, 0xabe0

gUnknown_083CA4CC:: @ 83CA4CC
	obj_pal 0x08d19734, 0xabe0

	.include "data/text/contest_strings.s"

gUnknown_083CC330:: @ 83CC330
	.incbin "baserom.gba", 0x003cc330, 0x1d
@ not labeling until im sure what this is.
	.string "{HIGHLIGHT TRANSPARENT}{COLOR MAGENTA} $"

gUnknown_083CC355:: @ 83CC355
UnknownText_MissedTurn:
	.string "Missed turn$"

gUnknown_083CC361:: @ 83CC361
UnknownText_LinkStandby:
	.string "Link standby...$"
UnknownText_UnknownFormatting:
	.string "{COLOR WHITE2}$"
UnknownText_WinnerIs:
	.string "The winner is {STR_VAR_1}’s {STR_VAR_2}!\nCongratulations!$"
	.incbin "baserom.gba", 0x003cc39d, 0x3

gUnknown_083CC3A0:: @ 83CC3A0
UnknownText_UnknownFormatting2:
	.string "{COLOR GREEN}{SHADOW RED}$"

gUnknown_083CC3A7:: @ 83CC3A7
UnknownText_UnknownFormatting3:
	.string "{COLOR LIGHT_GREY}$"

	.align 2
gUnknown_083CC3AC:: @ 83CC3AC
	obj_tiles 0x08d16024, 512, 0x4e20

gUnknown_083CC3B4:: @ 83CC3B4
	.incbin "baserom.gba", 0x003cc3b4, 0xa0

gUnknown_083CC454:: @ 83CC454
	.incbin "baserom.gba", 0x003cc454, 0x60

gUnknown_083CC4B4:: @ 83CC4B4
	obj_tiles 0x08d0314c, 4096, 0x80e8
	obj_tiles 0x08d0314c, 4096, 0x80e9
	obj_tiles 0x08d0314c, 4096, 0x80ea
	obj_tiles 0x08d0314c, 4096, 0x80eb

gUnknown_083CC4D4:: @ 83CC4D4
	.incbin "baserom.gba", 0x003cc4d4, 0x68

gUnknown_083CC53C:: @ 83CC53C
	.incbin "baserom.gba", 0x003cc53c, 0x60

gUnknown_083CC59C:: @ 83CC59C
	.incbin "baserom.gba", 0x003cc59c, 0x6

gUnknown_083CC5A2:: @ 83CC5A2
	.incbin "baserom.gba", 0x003cc5a2, 0x2

gUnknown_083CC5A4:: @ 83CC5A4
	.incbin "baserom.gba", 0x003cc5a4, 0x10

gUnknown_083CC5B4:: @ 83CC5B4
	.incbin "baserom.gba", 0x003cc5b4, 0x1c

gUnknown_083CC5D0:: @ 83CC5D0
	.incbin "baserom.gba", 0x003cc5d0, 0x100

	.align 2
gUnknown_083CC6D0:: @ 83CC6D0
	.4byte ContestStatsText_Buy
	.4byte sub_80B2EFC
	.4byte ContestStatsText_Sell
	.4byte sub_80B2F30
	.4byte ContestStatsText_Quit2
	.4byte HandleShopMenuQuit

gUnknown_083CC6E8:: @ 83CC6E8
	.incbin "baserom.gba", 0x003cc6e8, 0x3

gUnknown_083CC6EB:: @ 83CC6EB
	.incbin "baserom.gba", 0x003cc6eb, 0x1d

	.align 2
gUnknown_083CC708:: @ 83CC708
	.4byte sub_80B3BF4
	.4byte sub_80B3D7C

gUnknown_083CC710:: @ 83CC710
	.incbin "baserom.gba", 0x003cc710, 0x4

gUnknown_083CC714:: @ 83CC714
	.incbin "baserom.gba", 0x003cc714, 0x6

gUnknown_083CC71A:: @ 83CC71A
	.incbin "baserom.gba", 0x003cc71a, 0x6

gUnknown_083CC720:: @ 83CC720
	.incbin "baserom.gba", 0x003cc720, 0x6

gUnknown_083CC726:: @ 83CC726
	.incbin "baserom.gba", 0x003cc726, 0x6

gUnknown_083CC72C:: @ 83CC72C
	.incbin "baserom.gba", 0x003cc72c, 0x6

gUnknown_083CC732:: @ 83CC732
	.incbin "baserom.gba", 0x003cc732, 0x6

gUnknown_083CC738:: @ 83CC738
	.incbin "baserom.gba", 0x003cc738, 0x8

@ 83CC740
	.include "data/text/berry_descriptions.s"

@ 83CD2CC
	.include "data/berries.s"

gUnknown_083CD780:: @ 83CD780
	.incbin "baserom.gba", 0x003cd780, 0x680

gUnknown_083CDE00:: @ 83CDE00
	.incbin "baserom.gba", 0x003cde00, 0x248

gUnknown_083CE048:: @ 83CE048
	.incbin "baserom.gba", 0x003ce048, 0x1d0

	.align 2
gUnknown_083CE218:: @ 83CE218
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
gUnknown_083CE240:: @ 83CE240
	.4byte sub_80B6108
	.4byte sub_80B6148
	.4byte sub_80B6170
	.4byte sub_80B6194

	.align 2
gUnknown_083CE250:: @ 83CE250
	.4byte sub_80B626C
	.4byte sub_80B6274

gUnknown_083CE258:: @ 83CE258
	.incbin "baserom.gba", 0x003ce258, 0xa

gUnknown_083CE262:: @ 83CE262
	.incbin "baserom.gba", 0x003ce262, 0xa

gUnknown_083CE26C:: @ 83CE26C
	.incbin "baserom.gba", 0x003ce26c, 0x8

gUnknown_083CE274:: @ 83CE274
	.incbin "baserom.gba", 0x003ce274, 0x8

	.align 2
gUnknown_083CE27C:: @ 83CE27C
	.4byte sub_80B6668
	.4byte sub_80B6680
	.4byte sub_80B66EC
	.4byte sub_80B6758

	.align 2
gUnknown_083CE28C:: @ 83CE28C
	.4byte 0x02000006
	.4byte 0x02000004

gUnknown_083CE294:: @ 83CE294
	.incbin "baserom.gba", 0x003ce294, 0x1b

gUnknown_083CE2AF:: @ 83CE2AF
	.incbin "baserom.gba", 0x003ce2af, 0x5

	.align 2
gUnknown_083CE2B4:: @ 83CE2B4
	.4byte sub_80B6B5C
	.4byte sub_80B6B98
	.4byte sub_80B6B9C
	.4byte sub_80B6C08

gUnknown_083CE2C4:: @ 83CE2C4
	.incbin "baserom.gba", 0x003ce2c4, 0x6

gUnknown_083CE2CA:: @ 83CE2CA
	.incbin "baserom.gba", 0x003ce2ca, 0x6

gUnknown_083CE2D0:: @ 83CE2D0
	.incbin "baserom.gba", 0x003ce2d0, 0x8

gUnknown_083CE2D8:: @ 83CE2D8
	.incbin "baserom.gba", 0x003ce2d8, 0x8

	.align 2
gUnknown_083CE2E0:: @ 83CE2E0
	.4byte nullsub_40
	.4byte sub_80B6E68
	.4byte sub_80B6EBC
	.4byte sub_80B6EFC

	.align 2
gUnknown_083CE2F0:: @ 83CE2F0
	.4byte sub_80B7660
	.4byte sub_80B7650
	.4byte sub_80B7650
	.4byte sub_80B7670
	.4byte sub_80B7670
	.4byte sub_80B7660

gUnknown_083CE308:: @ 83CE308
	.incbin "baserom.gba", 0x003ce308, 0x8

	.align 2
gUnknown_083CE310:: @ 83CE310
	.4byte sub_80B7844
	.4byte sub_80B7838
	.4byte sub_80B7838
	.4byte sub_80B7850
	.4byte sub_80B7850
	.4byte sub_80B7844

	.align 2
gUnknown_083CE328:: @ 83CE328
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
gUnknown_083CE358:: @ 83CE358
	.4byte nullsub_61
	.4byte nullsub_61
	.4byte sub_80B78F8
	.4byte sub_80B78F8

	.align 2
gUnknown_083CE368:: @ 83CE368
	.4byte nullsub_62
	.4byte sub_80B7924

gUnknown_083CE370:: @ 83CE370
Unknown_83CE370:
	.incbin "baserom.gba", 0x003ce370, 0x4
Unknown_83CE374:
	.incbin "baserom.gba", 0x003ce374, 0xC
Unknown_83CE380:
	.incbin "baserom.gba", 0x003ce380, 0xC
Unknown_83CE38C:
	.incbin "baserom.gba", 0x003ce38c, 0xC

	.align 2
gUnknown_083CE398:: @ 83CE398
	.4byte Unknown_83CE374
	.4byte Unknown_83CE380
	.4byte Unknown_83CE38C
	.4byte Unknown_83CE38C

gUnknown_083CE3A8:: @ 83CE3A8
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

gUnknown_083CE558:: @ 83CE558
	.incbin "baserom.gba", 0x003ce558, 0x8

gUnknown_083CE560:: @ 83CE560
	.incbin "baserom.gba", 0x003ce560, 0x18

gUnknown_083CE578:: @ 83CE578
	.incbin "baserom.gba", 0x003ce578, 0x8

gUnknown_083CE580:: @ 83CE580
	.incbin "baserom.gba", 0x003ce580, 0x48

gUnknown_083CE5C8:: @ 83CE5C8
	.incbin "baserom.gba", 0x003ce5c8, 0x18

gUnknown_083CE5E0:: @ 83CE5E0
	.incbin "baserom.gba", 0x003ce5e0, 0x18

gUnknown_083CE5F8:: @ 83CE5F8
	.incbin "baserom.gba", 0x003ce5f8, 0x18

gUnknown_083CE610:: @ 83CE610
	.incbin "baserom.gba", 0x003ce610, 0x18

gUnknown_083CE628:: @ 83CE628
	.incbin "baserom.gba", 0x003ce628, 0x18

gUnknown_083CE640:: @ 83CE640
	.incbin "baserom.gba", 0x003ce640, 0x18

gUnknown_083CE658:: @ 83CE658
	.incbin "baserom.gba", 0x003ce658, 0x18

gUnknown_083CE670:: @ 83CE670
	.incbin "baserom.gba", 0x003ce670, 0x18

gUnknown_083CE688:: @ 83CE688
	.incbin "baserom.gba", 0x003ce688, 0x18

gUnknown_083CE6A0:: @ 83CE6A0
	.incbin "baserom.gba", 0x003ce6a0, 0x68

gUnknown_083CE708:: @ 83CE708
	.incbin "baserom.gba", 0x003ce708, 0x40

gUnknown_083CE748:: @ 83CE748
	.incbin "baserom.gba", 0x003ce748, 0x4b0

gUnknown_083CEBF8:: @ 83CEBF8
	.incbin "baserom.gba", 0x003cebf8, 0x4b0

gUnknown_083CF0A8:: @ 83CF0A8
	.incbin "baserom.gba", 0x003cf0a8, 0x4c4

gUnknown_083CF56C:: @ 83CF56C
	.incbin "baserom.gba", 0x003cf56c, 0x18

gUnknown_083CF584:: @ 83CF584
	obj_tiles 0x08e77a5c, 256, 0x2722

gUnknown_083CF58C:: @ 83CF58C
	obj_pal 0x08e77900, 0x2722

@ 83CF594
	.include "data/contest_moves.s"

@ 83D00AC
	.include "data/contest_effects.s"

@ A lookup table with TRUE for each combo starter ID and FALSE for ID 0,
@ which means "not a combo starter move".
gComboStarterLookupTable:: @ 83D016C
	.byte FALSE
	.rept 62
	.byte TRUE
	.endr

@ 83D01AC
	.include "data/contest_effect_funcs.s"

	.align 2
gUnknown_083D026C:: @ 83D026C
	.4byte 0x0202713c

	.align 2
gUnknown_083D0270:: @ 83D0270
	.4byte 0x02027e6c

	.align 2
gUnknown_083D0274:: @ 83D0274
	.4byte 0x020281f0

	.align 2
gUnknown_083D0278:: @ 83D0278
	.4byte 0x020284c8

	.align 2
gUnknown_083D027C:: @ 83D027C
	.4byte 0x02028508

	.align 2
gUnknown_083D0280:: @ 83D0280
	.4byte 0x02038738

	.align 2
gUnknown_083D0284:: @ 83D0284
	.4byte 0x02024f4c

gUnknown_083D0288:: @ 83D0288
	.incbin "baserom.gba", 0x003d0288, 0x2

gUnknown_083D028A:: @ 83D028A
	.incbin "baserom.gba", 0x003d028a, 0x6

gUnknown_083D0290:: @ 83D0290
	.incbin "baserom.gba", 0x003d0290, 0x24

gUnknown_083D02B4:: @ 83D02B4
	.incbin "baserom.gba", 0x003d02b4, 0x6

gUnknown_083D02BA:: @ 83D02BA
	.incbin "baserom.gba", 0x003d02ba, 0xe

gUnknown_083D02C8:: @ 83D02C8
DebugText_SoundCheckJap:
	.string "サウンドチェック$" @ Sound Check

gUnknown_083D02D1:: @ 83D02D1
DebugText_BGM:
	.string "BGM$"

gUnknown_083D02D5:: @ 83D02D5
DebugText_SE:
	.string "SE $"

gUnknown_083D02D9:: @ 83D02D9
	.incbin "baserom.gba", 0x003d02d9, 0xd

gUnknown_083D02E6:: @ 83D02E6
DebugText_UpDown:
	.string "L‥UP R‥DOWN$"

gUnknown_083D02F2:: @ 83D02F2
DebugText_DriverTest:
	.string "R‥DRIVER-TEST$"

gUnknown_083D0300:: @ 83D0300
	.incbin "baserom.gba", 0x003d0300, 0x12

gUnknown_083D0312:: @ 83D0312
	.incbin "baserom.gba", 0x003d0312, 0xa

gUnknown_083D031C:: @ 83D031C
	.incbin "baserom.gba", 0x003d031c, 0xb

gUnknown_083D0327:: @ 83D0327
DebugText_Voice:
	.string "VOICE‥‥‥‥$"

gUnknown_083D0331:: @ 83D0331
DebugText_Volume:
	.string "VOLUME‥‥‥$"

gUnknown_083D033B:: @ 83D033B
DebugText_Panpot:
	.string "PANPOT‥‥‥$"

gUnknown_083D0345:: @ 83D0345
DebugText_Pitch:
	.string "PITCH‥‥‥‥$"

gUnknown_083D034F:: @ 83D034F
DebugText_Length:
	.string "LENGTH‥‥‥$"

gUnknown_083D0359:: @ 83D0359
DebugText_Release:
	.string "RELEASE‥‥$"

gUnknown_083D0363:: @ 83D0363
DebugText_Progress:
	.string "PROGRESS‥$"

gUnknown_083D036D:: @ 83D036D
DebugText_Chorus:
	.string "CHORUS‥‥‥$"

gUnknown_083D0377:: @ 83D0377
DebugText_Priority:
	.string "PRIORITY‥$"

gUnknown_083D0381:: @ 83D0381
	.incbin "baserom.gba", 0x003d0381, 0x9

gUnknown_083D038A:: @ 83D038A
	.incbin "baserom.gba", 0x003d038a, 0x9

gUnknown_083D0393:: @ 83D0393
	.incbin "baserom.gba", 0x003d0393, 0x9

gUnknown_083D039C:: @ 83D039C
	.incbin "baserom.gba", 0x003d039c, 0x40

gUnknown_083D03DC:: @ 83D03DC
	.incbin "baserom.gba", 0x003d03dc, 0x2

gUnknown_083D03DE:: @ 83D03DE
	.incbin "baserom.gba", 0x003d03de, 0x2

gUnknown_083D03E0:: @ 83D03E0
	.incbin "baserom.gba", 0x003d03e0, 0x18

gUnknown_083D03F8:: @ 83D03F8
	.incbin "baserom.gba", 0x003d03f8, 0x5

gUnknown_083D03FD:: @ 83D03FD
OtherText_SE:
	.string "SE$"

gUnknown_083D0400:: @ 83D0400
OtherText_Pan:
	.string "PAN$"

gUnknown_083D0404:: @ 83D0404
OtherText_LR:
	.string "  LR$"

gUnknown_083D0409:: @ 83D0409
OtherText_RL:
	.string "  RL$"

@ 83D040E
	.include "data/text/song_names.s"

gUnknown_083D1358:: @ 83D1358
	.incbin "baserom.gba", 0x003d1358, 0x1c

gUnknown_083D1374:: @ 83D1374
	.incbin "baserom.gba", 0x003d1374, 0x60

	.align 2
gUnknown_083D13D4:: @ 83D13D4
	.4byte SecretBaseText_DelRegist
	.4byte sub_80BCA84
	.4byte UnknownText_Exit
	.4byte sub_80BCBF8

	.align 2
gUnknown_083D13E4:: @ 83D13E4
	.4byte sub_80BCB90
	.4byte sub_80BCBC0

gUnknown_083D13EC:: @ 83D13EC
	.incbin "baserom.gba", 0x003d13ec, 0xc

gUnknown_083D13F8:: @ 83D13F8
	.incbin "baserom.gba", 0x003d13f8, 0x3c

gUnknown_083D1434:: @ 83D1434
	.incbin "baserom.gba", 0x003d1434, 0x10

gUnknown_083D1444:: @ 83D1444
	.incbin "baserom.gba", 0x003d1444, 0x10

gUnknown_083D1454:: @ 83D1454
	.incbin "baserom.gba", 0x003d1454, 0x10

	.align 2
gUnknown_083D1464:: @ 83D1464
	.4byte 0x020231cc
	.4byte 0x020232cc
	.4byte 0x020233cc

	.align 2
gUnknown_083D1470:: @ 83D1470
	.4byte 0x081a8ec9
	.4byte 0x081a9048
	.4byte 0x081a9067
	.4byte 0x081a9088
	.4byte 0x081a90b4
	.4byte 0x081a911f
	.4byte 0x081a9152
	.4byte 0x081a91c6

	.align 2
gUnknown_083D1490:: @ 83D1490
	.4byte 0x081a9581
	.4byte 0x081a9694
	.4byte 0x081a971b
	.4byte 0x081a974b
	.4byte 0x081a979f
	.4byte 0x081a97d0

	.align 2
gUnknown_083D14A8:: @ 83D14A8
	.4byte 0x081a8917
	.4byte 0x081a8ae5
	.4byte 0x081a8b9d
	.4byte 0x081a8c77
	.4byte 0x081a8d45

	.align 2
gUnknown_083D14BC:: @ 83D14BC
	.4byte 0x081a986f

	.align 2
gUnknown_083D14C0:: @ 83D14C0
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
gUnknown_083D14F0:: @ 83D14F0
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
gUnknown_083D1524:: @ 83D1524
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
gUnknown_083D1548:: @ 83D1548
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
gUnknown_083D1584:: @ 83D1584
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
gUnknown_083D15D0:: @ 83D15D0
	.4byte 0x081aa814
	.4byte 0x081aa8c6
	.4byte 0x081aa9b2
	.4byte 0x081aaa5c
	.4byte 0x081aab11
	.4byte 0x081aabb4
	.4byte 0x081aac47

	.align 2
gUnknown_083D15EC:: @ 83D15EC
	.4byte 0x081aa344
	.4byte 0x081aa5f3

	.align 2
gUnknown_083D15F4:: @ 83D15F4
	.4byte 0x081abc51
	.4byte 0x081abd94
	.4byte 0x081abdf2

	.align 2
gUnknown_083D1600:: @ 83D1600
	.4byte 0x081ac90d
	.4byte 0x081aca02
	.4byte 0x081acaaa
	.4byte 0x081acc07
	.4byte 0x081acd13
	.4byte 0x081acdfa
	.4byte 0x081acee7
	.4byte 0x081acf49
	.4byte 0x081ad00a

gUnknown_083D1624:: @ 83D1624
	.incbin "baserom.gba", 0x003d1624, 0x20

gUnknown_083D1644:: @ 83D1644
	.incbin "baserom.gba", 0x003d1644, 0xa0

gUnknown_083D16E4:: @ 83D16E4
	.incbin "baserom.gba", 0x003d16e4, 0x68

gUnknown_083D174C:: @ 83D174C
	.incbin "baserom.gba", 0x003d174c, 0x18

gUnknown_083D1764:: @ 83D1764
	obj_tiles 0x082089dc, 1024, 0x0bc1
	obj_tiles 0x082089dc, 1024, 0x0bc2
	obj_tiles 0x082089dc, 1024, 0x0bc3
	obj_tiles 0x082089dc, 1024, 0x0bc4
	obj_tiles 0x082089dc, 1024, 0x0bc5
	obj_tiles 0x082089dc, 1024, 0x0bc6
	obj_tiles 0x082089dc, 1024, 0x0bc7
	obj_tiles 0x082089dc, 1024, 0x0bc8

gUnknown_083D17A4:: @ 83D17A4
	.incbin "baserom.gba", 0x003d17a4, 0x10

gUnknown_083D17B4:: @ 83D17B4
	.incbin "baserom.gba", 0x003d17b4, 0x18

gUnknown_083D17CC:: @ 83D17CC
	obj_tiles 0x08d2d7d4, 544, 0x0bc9

gUnknown_083D17D4:: @ 83D17D4
	obj_pal 0x08d2d8f4, 0x0bc9

gUnknown_083D17DC:: @ 83D17DC
	.incbin "baserom.gba", 0x003d17dc, 0x4

gUnknown_083D17E0:: @ 83D17E0
	.incbin "baserom.gba", 0x003d17e0, 0x2

gUnknown_083D17E2:: @ 83D17E2
	.incbin "baserom.gba", 0x003d17e2, 0x2a

gUnknown_083D180C:: @ 83D180C
	.incbin "baserom.gba", 0x003d180c, 0x80

gUnknown_083D188C:: @ 83D188C
	.incbin "baserom.gba", 0x003d188c, 0x2

gUnknown_083D188E:: @ 83D188E
	.incbin "baserom.gba", 0x003d188e, 0xa

gUnknown_083D1898:: @ 83D1898
	obj_pal 0x083d190c, 0x0080

gUnknown_083D18A0:: @ 83D18A0
	obj_pal 0x083d18ec, 0x0000

gUnknown_083D18A8:: @ 83D18A8
	.incbin "baserom.gba", 0x003d18a8, 0x18

gUnknown_083D18C0:: @ 83D18C0
	.incbin "baserom.gba", 0x003d18c0, 0x36C

	.align 2
gFieldEffectObjectPalette7: @ 83D1C2C
	.incbin "graphics/field_effect_objects/palettes/07.gbapal"

	.incbin "baserom.gba", 0x3d1c4c, 0x580

	.align 2
gFieldEffectObjectPalette8: @ 83D21CC
	.incbin "graphics/field_effect_objects/palettes/08.gbapal"

	.incbin "baserom.gba", 0x3d21ec, 0x428

gUnknown_083D2614:: @ 83D2614
	.incbin "baserom.gba", 0x003d2614, 0x18

gUnknown_083D262C:: @ 83D262C
	.incbin "baserom.gba", 0x003d262c, 0x18

gUnknown_083D2644:: @ 83D2644
	.incbin "baserom.gba", 0x003d2644, 0x18

	.align 2
gFieldEffectObjectPaletteInfo7:: @ 83D265C
	obj_pal gFieldEffectObjectPalette7, 0x1003

	.align 2
gFieldEffectObjectPaletteInfo8:: @ 83D2664
	obj_pal gFieldEffectObjectPalette8, 0x1008

	.incbin "baserom.gba", 0x3d266c, 0x34

gUnknown_083D26A0:: @ 83D26A0
	.incbin "baserom.gba", 0x003d26a0, 0x18

@ This uses one of the secret base palettes, so there is no "09.pal" file.
	.align 2
gFieldEffectObjectPaletteInfo9:: @ 83D26B8
	obj_pal gTilesetPalettes_SecretBase + 5 * 0x20, 0x100E

	.incbin "baserom.gba", 0x3d26c0, 0x1b8

gUnknown_083D2878:: @ 83D2878
	.incbin "baserom.gba", 0x003d2878, 0x1c

gUnknown_083D2894:: @ 83D2894
	.incbin "baserom.gba", 0x003d2894, 0x18

	.align 2
gMapObjectPic_MovingBox: @ 83D28AC
	.incbin "graphics/map_objects/pics/misc/moving_box.4bpp"

	.align 2
gMapObjectPalette19: @ 83D292C
	.incbin "graphics/map_objects/palettes/19.gbapal"

gUnknown_083D294C:: @ 83D294C
	.incbin "baserom.gba", 0x003d294c, 0x13

gUnknown_083D295F:: @ 83D295F
	.incbin "baserom.gba", 0x003d295f, 0x2

gUnknown_083D2961:: @ 83D2961
	.incbin "baserom.gba", 0x003d2961, 0x3

gUnknown_083D2964:: @ 83D2964
	.incbin "baserom.gba", 0x003d2964, 0x38

gUnknown_083D299C:: @ 83D299C
	.incbin "baserom.gba", 0x003d299c, 0x3480

gUnknown_083D5E1C:: @ 83D5E1C
	.incbin "baserom.gba", 0x003d5e1c, 0x270

gUnknown_083D608C:: @ 83D608C
	.incbin "baserom.gba", 0x003d608c, 0x18

gUnknown_083D60A4:: @ 83D60A4
	.incbin "baserom.gba", 0x003d60a4, 0x18

gUnknown_083D60BC:: @ 83D60BC
	.incbin "baserom.gba", 0x003d60bc, 0x10

gUnknown_083D60CC:: @ 83D60CC
	.incbin "baserom.gba", 0x003d60cc, 0x10

gUnknown_083D60DC:: @ 83D60DC
	.incbin "baserom.gba", 0x003d60dc, 0x10

gUnknown_083D60EC:: @ 83D60EC
	.incbin "baserom.gba", 0x003d60ec, 0x10

gUnknown_083D60FC:: @ 83D60FC
	.incbin "baserom.gba", 0x003d60fc, 0x20

gUnknown_083D611C:: @ 83D611C
	.incbin "baserom.gba", 0x003d611c, 0x20

gUnknown_083D613C:: @ 83D613C
Unknown_83D613C:
	.incbin "baserom.gba", 0x003d613c, 0x60
Unknown_83D619C:
	.incbin "baserom.gba", 0x003d619c, 0x20
Unknown_83D61BC:
	.incbin "baserom.gba", 0x003d61bc, 0x20

	.align 2
gUnknown_083D61DC:: @ 83D61DC
	.4byte Unknown_83D619C
	.4byte Unknown_83D61BC

	.align 2
gUnknown_083D61E4:: @ 83D61E4
	.4byte sub_808B020
	.4byte c2_exit_to_overworld_2_switch
	.4byte sub_810B96C

gUnknown_083D61F0:: @ 83D61F0
	.incbin "baserom.gba", 0x003d61f0, 0x4

gUnknown_083D61F4:: @ 83D61F4
	.incbin "baserom.gba", 0x003d61f4, 0x8

	.align 2
gSpriteAnim_83D61FC:: @ 83D61FC
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 6, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 10, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_frame 14, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D6220:: @ 83D6220
	.4byte gSpriteAnim_83D61FC

	.align 2
gBattleAnimSpriteTemplate_83D6224:: @ 83D6224
	spr_template 10067, 10067, gOamData_837DF64, gSpriteAnimTable_83D6220, NULL, gDummySpriteAffineAnimTable, sub_80CA710

	.align 2
gBattleAnimSpriteTemplate_83D623C:: @ 83D623C
	spr_template 10068, 10068, gOamData_837DF64, gSpriteAnimTable_83D6220, NULL, gDummySpriteAffineAnimTable, sub_80CA710

	.align 2
gBattleAnimSpriteTemplate_83D6254:: @ 83D6254
	spr_template 10065, 10065, gOamData_837DF64, gSpriteAnimTable_83D6220, NULL, gDummySpriteAffineAnimTable, sub_80CA710

	.align 2
gSpriteAnim_83D626C:: @ 83D626C
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6274:: @ 83D6274
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D627C:: @ 83D627C
	obj_image_anim_frame 2, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6284:: @ 83D6284
	obj_image_anim_frame 3, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D628C:: @ 83D628C
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6294:: @ 83D6294
	obj_image_anim_frame 5, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D629C:: @ 83D629C
	obj_image_anim_frame 6, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D62A4:: @ 83D62A4
	obj_image_anim_frame 7, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D62AC:: @ 83D62AC
	obj_image_anim_frame 8, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D62B4:: @ 83D62B4
	.4byte gSpriteAnim_83D626C
	.4byte gSpriteAnim_83D6274
	.4byte gSpriteAnim_83D627C
	.4byte gSpriteAnim_83D6284
	.4byte gSpriteAnim_83D628C
	.4byte gSpriteAnim_83D6294
	.4byte gSpriteAnim_83D629C
	.4byte gSpriteAnim_83D62A4

	.align 2
gSpriteAnimTable_83D62D4:: @ 83D62D4
	.4byte gSpriteAnim_83D62AC

	.align 2
gSpriteAffineAnim_83D62D8:: @ 83D62D8
	obj_rot_scal_anim_frame 0xFFFB, 0xFFFB, 0, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D62E8:: @ 83D62E8
	.4byte gSpriteAffineAnim_83D62D8

	.align 2
gBattleAnimSpriteTemplate_83D62EC:: @ 83D62EC
	spr_template 10147, 10147, gOamData_837E0AC, gSpriteAnimTable_83D62D4, NULL, gSpriteAffineAnimTable_83D62E8, sub_80CA7B0

	.align 2
gBattleAnimSpriteTemplate_83D6304:: @ 83D6304
	spr_template 10147, 10147, gOamData_837DF24, gSpriteAnimTable_83D62B4, NULL, gDummySpriteAffineAnimTable, sub_80CA800

	.align 2
gUnknown_083D631C:: @ 83D631C
	.incbin "baserom.gba", 0x003d631c, 0x18

	.align 2
gSpriteAffineAnim_83D6334:: @ 83D6334
	obj_rot_scal_anim_frame 0x140, 0x140, 0, 0
	obj_rot_scal_anim_frame 0xFFF2, 0xFFF2, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D634C:: @ 83D634C
	.4byte gSpriteAffineAnim_83D6334

	.align 2
gBattleAnimSpriteTemplate_83D6350:: @ 83D6350
	spr_template 10235, 10235, gOamData_837DFE4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D634C, sub_80CA7B0

	.align 2
gSpriteAffineAnim_83D6368:: @ 83D6368
	obj_rot_scal_anim_frame 0xFFFB, 0xFFFB, 0, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D6378:: @ 83D6378
	.4byte gSpriteAffineAnim_83D6368

	.align 2
gBattleAnimSpriteTemplate_83D637C:: @ 83D637C
	spr_template 10147, 10147, gOamData_837E0AC, gSpriteAnimTable_83D62D4, NULL, gSpriteAffineAnimTable_83D6378, sub_80CA9A8

	.align 2
gBattleAnimSpriteTemplate_83D6394:: @ 83D6394
	spr_template 10147, 10147, gOamData_837DF24, gSpriteAnimTable_83D62B4, NULL, gDummySpriteAffineAnimTable, sub_80CAA14

	.align 2
gSpriteAnim_83D63AC:: @ 83D63AC
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D63B4:: @ 83D63B4
	obj_image_anim_frame 4, 7
	obj_image_anim_frame 8, 7
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D63C0:: @ 83D63C0
	.4byte gSpriteAnim_83D63AC
	.4byte gSpriteAnim_83D63B4

	.align 2
gBattleAnimSpriteTemplate_83D63C8:: @ 83D63C8
	spr_template 10006, 10006, gOamData_837DF2C, gSpriteAnimTable_83D63C0, NULL, gDummySpriteAffineAnimTable, sub_80CAB18

	.align 2
gSpriteAnim_83D63E0:: @ 83D63E0
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D63E8:: @ 83D63E8
	obj_image_anim_frame 4, 7
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D63F0:: @ 83D63F0
	.4byte gSpriteAnim_83D63E0
	.4byte gSpriteAnim_83D63E8

	.align 2
gBattleAnimSpriteTemplate_83D63F8:: @ 83D63F8
	spr_template 10158, 10158, gOamData_837DF2C, gSpriteAnimTable_83D63F0, NULL, gDummySpriteAffineAnimTable, sub_80CABF8

	.align 2
gSpriteAnim_83D6410:: @ 83D6410
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6418:: @ 83D6418
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6420:: @ 83D6420
	.4byte gSpriteAnim_83D6410

	.align 2
gSpriteAnimTable_83D6424:: @ 83D6424
	.4byte gSpriteAnim_83D6418

	.align 2
gBattleAnimSpriteTemplate_83D6428:: @ 83D6428
	spr_template 10159, 10159, gOamData_837DF2C, gSpriteAnimTable_83D6420, NULL, gDummySpriteAffineAnimTable, sub_80CAD54

	.align 2
gBattleAnimSpriteTemplate_83D6440:: @ 83D6440
	spr_template 10159, 10159, gOamData_837DF24, gSpriteAnimTable_83D6424, NULL, gDummySpriteAffineAnimTable, sub_80CAE20

	.align 2
gSpriteAnim_83D6458:: @ 83D6458
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 20, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83D6484:: @ 83D6484
	obj_image_anim_frame 24, 5
	obj_image_anim_frame 28, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6494:: @ 83D6494
	.4byte gSpriteAnim_83D6458
	.4byte gSpriteAnim_83D6484

	.align 2
gBattleAnimSpriteTemplate_83D649C:: @ 83D649C
	spr_template 10063, 10063, gOamData_837DF2C, gSpriteAnimTable_83D6494, NULL, gDummySpriteAffineAnimTable, sub_80CAED8

	.align 2
gBattleAnimSpriteTemplate_83D64B4:: @ 83D64B4
	spr_template 10063, 10063, gOamData_837DF2C, gSpriteAnimTable_83D6494, NULL, gDummySpriteAffineAnimTable, sub_80CB144

	.align 2
gSpriteAnim_83D64CC:: @ 83D64CC
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D64E0:: @ 83D64E0
	.4byte gSpriteAnim_83D64CC

	.align 2
gBattleAnimSpriteTemplate_83D64E4:: @ 83D64E4
	spr_template 10160, 10160, gOamData_837DF54, gSpriteAnimTable_83D64E0, NULL, gDummySpriteAffineAnimTable, sub_80CAFD0

	.align 2
gSpriteAffineAnim_83D64FC:: @ 83D64FC
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D650C:: @ 83D650C
	.4byte gSpriteAffineAnim_83D64FC

	.align 2
gBattleAnimSpriteTemplate_83D6510:: @ 83D6510
	spr_template 10174, 10174, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D650C, sub_80CAFD0

	.align 2
gSpriteAnim_83D6528:: @ 83D6528
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 96, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83D653C:: @ 83D653C
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 96, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6550:: @ 83D6550
	.4byte gSpriteAnim_83D6528
	.4byte gSpriteAnim_83D653C

	.align 2
gSpriteAffineAnim_83D6558:: @ 83D6558
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFF5, 0x0, 0, 6
	obj_rot_scal_anim_frame 0xB, 0x0, 0, 6
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D6578:: @ 83D6578
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xB, 0x0, 0, 6
	obj_rot_scal_anim_frame 0xFFF5, 0x0, 0, 6
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D6598:: @ 83D6598
	.4byte gSpriteAffineAnim_83D6558
	.4byte gSpriteAffineAnim_83D6578

	.align 2
gBattleAnimSpriteTemplate_83D65A0:: @ 83D65A0
	spr_template 10186, 10186, gOamData_837DFBC, gSpriteAnimTable_83D6550, NULL, gSpriteAffineAnimTable_83D6598, sub_80CB25C

	.align 2
gSpriteAffineAnim_83D65B8:: @ 83D65B8
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 0
	obj_rot_scal_anim_frame 0x30, 0x30, 0, 14
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D65D0:: @ 83D65D0
	obj_rot_scal_anim_frame 0xFFF0, 0xFFF0, 0, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D65E0:: @ 83D65E0
	.4byte gSpriteAffineAnim_83D65B8
	.4byte gSpriteAffineAnim_83D65D0

	.align 2
gBattleAnimSpriteTemplate_83D65E8:: @ 83D65E8
	spr_template 10147, 10147, gOamData_837DFEC, gSpriteAnimTable_83D62D4, NULL, gSpriteAffineAnimTable_83D65E0, sub_80CB4CC

	.align 2
gSpriteAnim_83D6600:: @ 83D6600
	obj_image_anim_frame 0, 7
	obj_image_anim_frame 16, 7
	obj_image_anim_frame 32, 7
	obj_image_anim_frame 48, 7
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6614:: @ 83D6614
	obj_image_anim_frame 0, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6628:: @ 83D6628
	obj_image_anim_frame 0, 7
	obj_image_anim_frame 16, 7
	obj_image_anim_frame 32, 7
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6638:: @ 83D6638
	obj_image_anim_frame 0, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6648:: @ 83D6648
	.4byte gSpriteAnim_83D6600
	.4byte gSpriteAnim_83D6614
	.4byte gSpriteAnim_83D6628
	.4byte gSpriteAnim_83D6638

	.align 2
gBattleAnimSpriteTemplate_83D6658:: @ 83D6658
	spr_template 10223, 10223, gOamData_837DF34, gSpriteAnimTable_83D6648, NULL, gDummySpriteAffineAnimTable, sub_80CB59C

	.align 2
gBattleAnimSpriteTemplate_83D6670:: @ 83D6670
	spr_template 10223, 10223, gOamData_837DF34, gSpriteAnimTable_83D6648, NULL, gDummySpriteAffineAnimTable, sub_80CB620

	.align 2
gSpriteAnim_83D6688:: @ 83D6688
	obj_image_anim_frame 3, 3
	obj_image_anim_frame 0, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D6694:: @ 83D6694
	.4byte gSpriteAnim_83D6688

	.align 2
gBattleAnimSpriteTemplate_83D6698:: @ 83D6698
	spr_template 10147, 10147, gOamData_837DF24, gSpriteAnimTable_83D6694, NULL, gDummySpriteAffineAnimTable, sub_80CB768

	.align 2
gSpriteAnim_83D66B0:: @ 83D66B0
	obj_image_anim_frame 0, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D66B8:: @ 83D66B8
	.4byte gSpriteAnim_83D66B0

	.align 2
gSpriteAffineAnim_83D66BC:: @ 83D66BC
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 10
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 20
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 10
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D66DC:: @ 83D66DC
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 2
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 4
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 4
	obj_rot_scal_anim_frame 0x0, 0x0, -1, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 1, 2
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D6714:: @ 83D6714
	.4byte gSpriteAffineAnim_83D66BC
	.4byte gSpriteAffineAnim_83D66DC

	.align 2
gBattleAnimSpriteTemplate_83D671C:: @ 83D671C
	spr_template 10224, 10224, gOamData_837DF94, gSpriteAnimTable_83D66B8, NULL, gSpriteAffineAnimTable_83D6714, sub_80CB94C

	.align 2
gBattleAnimSpriteTemplate_83D6734:: @ 83D6734
	spr_template 10224, 10224, gOamData_837DF94, gSpriteAnimTable_83D66B8, NULL, gSpriteAffineAnimTable_83D6714, sub_80CBA28

	.align 2
gSpriteAnim_83D674C:: @ 83D674C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 12, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6760:: @ 83D6760
	.4byte gSpriteAnim_83D674C

	.align 2
gBattleAnimSpriteTemplate_83D6764:: @ 83D6764
	spr_template 10195, 10195, gOamData_837DF2C, gSpriteAnimTable_83D6760, NULL, gDummySpriteAffineAnimTable, sub_80CBAA4

	.align 2
gBattleAnimSpriteTemplate_83D677C:: @ 83D677C
	spr_template 10224, 10224, gOamData_837DF94, gSpriteAnimTable_83D66B8, NULL, gSpriteAffineAnimTable_83D6714, sub_80CBAE8

	.align 2
gSpriteAffineAnim_83D6794:: @ 83D6794
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 3
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D67A4:: @ 83D67A4
	obj_rot_scal_anim_frame 0x0, 0xFFF6, 0, 3
	obj_rot_scal_anim_frame 0x0, 0xFFFA, 0, 3
	obj_rot_scal_anim_frame 0x0, 0xFFFE, 0, 3
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 3
	obj_rot_scal_anim_frame 0x0, 0x2, 0, 3
	obj_rot_scal_anim_frame 0x0, 0x6, 0, 3
	obj_rot_scal_anim_frame 0x0, 0xA, 0, 3
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D67E4:: @ 83D67E4
	.4byte gSpriteAffineAnim_83D6794
	.4byte gSpriteAffineAnim_83D67A4
	.4byte gSpriteAffineAnim_83D66BC
	.4byte gSpriteAffineAnim_83D66DC

	.align 2
gBattleAnimSpriteTemplate_83D67F4:: @ 83D67F4
	spr_template 10224, 10224, gOamData_837DF94, gSpriteAnimTable_83D66B8, NULL, gSpriteAffineAnimTable_83D67E4, sub_80CBBF0

	.align 2
gUnknown_083D680C:: @ 83D680C
	.incbin "baserom.gba", 0x003d680c, 0x78

gUnknown_083D6884:: @ 83D6884
	.incbin "baserom.gba", 0x003d6884, 0x18

	.align 2
gSpriteAffineAnim_83D689C:: @ 83D689C
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D68B4:: @ 83D68B4
	.4byte gSpriteAffineAnim_83D689C

	.align 2
gBattleAnimSpriteTemplate_83D68B8:: @ 83D68B8
	spr_template 10159, 10159, gOamData_837DF24, gSpriteAnimTable_83D6424, NULL, gDummySpriteAffineAnimTable, sub_80CC474

	.align 2
gBattleAnimSpriteTemplate_83D68D0:: @ 83D68D0
	spr_template 10159, 10159, gOamData_837DF8C, gSpriteAnimTable_83D6420, NULL, gSpriteAffineAnimTable_83D68B4, sub_80CC474

	.align 2
gSpriteAffineAnim_83D68E8:: @ 83D68E8
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -10, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnim_83D6900:: @ 83D6900
	obj_rot_scal_anim_frame 0xC0, 0xC0, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -12, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnim_83D6918:: @ 83D6918
	obj_rot_scal_anim_frame 0x8F, 0x8F, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -15, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D6930:: @ 83D6930
	.4byte gSpriteAffineAnim_83D68E8

	.align 2
gSpriteAffineAnimTable_83D6934:: @ 83D6934
	.4byte gSpriteAffineAnim_83D6900

	.align 2
gSpriteAffineAnimTable_83D6938:: @ 83D6938
	.4byte gSpriteAffineAnim_83D6918

	.align 2
gBattleAnimSpriteTemplate_83D693C:: @ 83D693C
	spr_template 10271, 10271, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D6930, sub_80CC474

	.align 2
gBattleAnimSpriteTemplate_83D6954:: @ 83D6954
	spr_template 10271, 10271, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D6934, sub_80CC474

	.align 2
gBattleAnimSpriteTemplate_83D696C:: @ 83D696C
	spr_template 10271, 10271, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D6938, sub_80CC474

	.align 2
gUnknown_083D6984:: @ 83D6984
	.incbin "baserom.gba", 0x003d6984, 0x10

	.align 2
gBattleAnimSpriteTemplate_83D6994:: @ 83D6994
	spr_template 10266, 10266, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CC6CC

	.align 2
gSpriteAnim_83D69AC:: @ 83D69AC
	obj_image_anim_frame 64, 3
	obj_image_anim_frame 80, 3
	obj_image_anim_frame 96, 3
	obj_image_anim_frame 112, 6
	obj_image_anim_end

	.align 2
gSpriteAnim_83D69C0:: @ 83D69C0
	obj_image_anim_frame 64, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 80, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 96, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 112, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D69D4:: @ 83D69D4
	.4byte gSpriteAnim_83D69AC
	.4byte gSpriteAnim_83D69C0

	.align 2
gBattleAnimSpriteTemplate_83D69DC:: @ 83D69DC
	spr_template 10056, 10056, gOamData_837DF34, gSpriteAnimTable_83D69D4, NULL, gDummySpriteAffineAnimTable, sub_80CC884

	.align 2
gBattleAnimSpriteTemplate_83D69F4:: @ 83D69F4
	spr_template 10287, 10287, gOamData_837DF34, gSpriteAnimTable_83D69D4, NULL, gDummySpriteAffineAnimTable, sub_80CC884

	.align 2
	.incbin "baserom.gba", 0x3d6a0c, 0x104

	.align 2
gSpriteAnim_83D6B10:: @ 83D6B10
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6B24:: @ 83D6B24
	.4byte gSpriteAnim_83D6B10

	.align 2
gBattleAnimSpriteTemplate_83D6B28:: @ 83D6B28
	spr_template 10138, 10138, gOamData_837E054, gSpriteAnimTable_83D6B24, NULL, gDummySpriteAffineAnimTable, sub_80CC914

	.align 2
gBattleAnimSpriteTemplate_83D6B40:: @ 83D6B40
	spr_template 10138, 10138, gOamData_837E054, gSpriteAnimTable_83D6B24, NULL, gDummySpriteAffineAnimTable, sub_80CC9BC

	.align 2
	.incbin "baserom.gba", 0x3d6b58, 0x90

	.align 2
gBattleAnimSpriteTemplate_83D6BE8:: @ 83D6BE8
	spr_template 10280, 10280, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CCD24

	.align 2
gSpriteAffineAnim_83D6C00:: @ 83D6C00
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D6C10:: @ 83D6C10
	obj_rot_scal_anim_frame 0x0, 0x0, 2, 12
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 6
	obj_rot_scal_anim_frame 0x0, 0x0, -2, 24
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 6
	obj_rot_scal_anim_frame 0x0, 0x0, 2, 12
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D6C40:: @ 83D6C40
	.4byte gSpriteAffineAnim_83D6C00
	.4byte gSpriteAffineAnim_83D6C10

	.align 2
gBattleAnimSpriteTemplate_83D6C48:: @ 83D6C48
	spr_template 10099, 10099, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D6C40, sub_80CCF04

	.align 2
gSpriteAnim_83D6C60:: @ 83D6C60
	obj_image_anim_frame 0, 7
	obj_image_anim_frame 16, 7
	obj_image_anim_frame 32, 7
	obj_image_anim_frame 48, 7
	obj_image_anim_frame 64, 7
	obj_image_anim_frame 80, 7
	obj_image_anim_frame 96, 7
	obj_image_anim_frame 112, 7
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D6C84:: @ 83D6C84
	.4byte gSpriteAnim_83D6C60

	.align 2
gBattleAnimSpriteTemplate_83D6C88:: @ 83D6C88
	spr_template 10049, 10049, gOamData_837DF34, gSpriteAnimTable_83D6C84, NULL, gDummySpriteAffineAnimTable, sub_80CD140

	.align 2
gBattleAnimSpriteTemplate_83D6CA0:: @ 83D6CA0
	spr_template 10049, 10049, gOamData_837DF34, gSpriteAnimTable_83D6C84, NULL, gDummySpriteAffineAnimTable, sub_80CD190

	.align 2
	.incbin "baserom.gba", 0x3d6cb8, 0x68

	.align 2
gSpriteAnim_83D6D20:: @ 83D6D20
	obj_image_anim_frame 0, 40
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6D28:: @ 83D6D28
	.4byte gSpriteAnim_83D6D20

	.align 2
gSpriteAffineAnim_83D6D2C:: @ 83D6D2C
	obj_rot_scal_anim_frame 0x14, 0x14, -30, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 1, 24
	obj_rot_scal_anim_end

	.align 2
	.incbin "baserom.gba", 0x3d6d44, 0x18

	.align 2
gSpriteAffineAnim_83D6D5C:: @ 83D6D5C
	obj_rot_scal_anim_frame 0x14, 0x14, 30, 0
	obj_rot_scal_anim_frame 0x8, 0x8, -1, 24
	obj_rot_scal_anim_end

	.align 2
	.incbin "baserom.gba", 0x3d6d74, 0x18

	.align 2
gSpriteAffineAnimTable_83D6D8C:: @ 83D6D8C
	.4byte gSpriteAffineAnim_83D6D2C
	.4byte gSpriteAffineAnim_83D6D5C

	.align 2
gBattleAnimSpriteTemplate_83D6D94:: @ 83D6D94
	spr_template 10228, 10228, gOamData_837DF94, gSpriteAnimTable_83D6D28, NULL, gSpriteAffineAnimTable_83D6D8C, sub_80CD328

	.align 2
gBattleAnimSpriteTemplate_83D6DAC:: @ 83D6DAC
	spr_template 10014, 10014, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CD3E0

	.align 2
gBattleAnimSpriteTemplate_83D6DC4:: @ 83D6DC4
	spr_template 10014, 10014, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CD6CC

	.align 2
gUnknown_083D6DDC:: @ 83D6DDC
	.incbin "baserom.gba", 0x003d6ddc, 0x8

	.align 2
gBattleAnimSpriteTemplate_83D6DE4:: @ 83D6DE4
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CD774

	.align 2
	.incbin "baserom.gba", 0x3d6dfc, 0x18

	.align 2
gSpriteAnim_83D6E14:: @ 83D6E14
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83D6E28:: @ 83D6E28
	obj_image_anim_frame 48, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6E30:: @ 83D6E30
	.4byte gSpriteAnim_83D6E14
	.4byte gSpriteAnim_83D6E28

	.align 2
gBattleAnimSpriteTemplate_83D6E38:: @ 83D6E38
	spr_template 10183, 10183, gOamData_837DF34, gSpriteAnimTable_83D6E30, NULL, gDummySpriteAffineAnimTable, sub_80CDD74

	.align 2
gBattleAnimSpriteTemplate_83D6E50:: @ 83D6E50
	spr_template 10286, 10286, gOamData_837DF34, gSpriteAnimTable_83D6E30, NULL, gDummySpriteAffineAnimTable, sub_80CDDDC

	.align 2
gBattleAnimSpriteTemplate_83D6E68:: @ 83D6E68
	spr_template 10286, 10286, gOamData_837DF34, gSpriteAnimTable_83D6E30, NULL, gDummySpriteAffineAnimTable, sub_80CDE24

	.align 2
gSpriteAnim_83D6E80:: @ 83D6E80
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 8, 12
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 24, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6E94:: @ 83D6E94
	.4byte gSpriteAnim_83D6E80

	.align 2
gBattleAnimSpriteTemplate_83D6E98:: @ 83D6E98
	spr_template 10184, 10184, gOamData_837DF74, gSpriteAnimTable_83D6E94, NULL, gDummySpriteAffineAnimTable, sub_80CDF0C

	.align 2
gSpriteAnim_83D6EB0:: @ 83D6EB0
	obj_image_anim_frame 0, 18
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 18
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 18
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 6
	obj_image_anim_frame 48, 18
	obj_image_anim_frame 32, 6
	obj_image_anim_frame 48, 6
	obj_image_anim_frame 64, 18
	obj_image_anim_frame 48, 6
	obj_image_anim_frame 64, 54
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6EEC:: @ 83D6EEC
	.4byte gSpriteAnim_83D6EB0

	.align 2
gBattleAnimSpriteTemplate_83D6EF0:: @ 83D6EF0
	spr_template 10185, 10185, gOamData_837DF34, gSpriteAnimTable_83D6EEC, NULL, gDummySpriteAffineAnimTable, sub_80CDFB0

	.align 2
gBattleAnimSpriteTemplate_83D6F08:: @ 83D6F08
	spr_template 10017, 10017, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_807941C

	.align 2
gSpriteAnim_83D6F20:: @ 83D6F20
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6F38:: @ 83D6F38
	.4byte gSpriteAnim_83D6F20

	.align 2
gBattleAnimSpriteTemplate_83D6F3C:: @ 83D6F3C
	spr_template 10030, 10030, gOamData_837DF34, gSpriteAnimTable_83D6F38, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gSpriteAnim_83D6F54:: @ 83D6F54
	obj_image_anim_frame 3, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6F68:: @ 83D6F68
	.4byte gSpriteAnim_83D6F54

	.align 2
gSpriteAffineAnim_83D6F6C:: @ 83D6F6C
	obj_rot_scal_anim_frame 0x200, 0x200, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D6F7C:: @ 83D6F7C
	.4byte gSpriteAffineAnim_83D6F6C

	.align 2
gBattleAnimSpriteTemplate_83D6F80:: @ 83D6F80
	spr_template 10018, 10018, gOamData_837E104, gSpriteAnimTable_83D6F68, NULL, gSpriteAffineAnimTable_83D6F7C, sub_80CE09C

	.align 2
gSpriteAnim_83D6F98:: @ 83D6F98
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 3, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D6FAC:: @ 83D6FAC
	.4byte gSpriteAnim_83D6F98

	.align 2
gBattleAnimSpriteTemplate_83D6FB0:: @ 83D6FB0
	spr_template 10018, 10018, gOamData_837E104, gSpriteAnimTable_83D6FAC, NULL, gSpriteAffineAnimTable_83D6F7C, sub_80CE17C

	.align 2
gBattleAnimSpriteTemplate_83D6FC8:: @ 83D6FC8
	spr_template 10194, 10194, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CE30C

	.align 2
gSpriteAnim_83D6FE0:: @ 83D6FE0
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 8, 8
	obj_image_anim_frame 12, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D6FF4:: @ 83D6FF4
	.4byte gSpriteAnim_83D6FE0

	.align 2
gBattleAnimSpriteTemplate_83D6FF8:: @ 83D6FF8
	spr_template 10195, 10195, gOamData_837DF2C, gSpriteAnimTable_83D6FF4, NULL, gDummySpriteAffineAnimTable, sub_80CE36C

	.align 2
gSpriteAnim_83D7010:: @ 83D7010
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 5
	obj_image_anim_frame 80, 3
	obj_image_anim_frame 96, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7034:: @ 83D7034
	.4byte gSpriteAnim_83D7010

	.align 2
gBattleAnimSpriteTemplate_83D7038:: @ 83D7038
	spr_template 10031, 10031, gOamData_837DF34, gSpriteAnimTable_83D7034, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gBattleAnimSpriteTemplate_83D7050:: @ 83D7050
	spr_template 10020, 10020, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CE670

	.align 2
gSpriteAnim_83D7068:: @ 83D7068
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 48, 2
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D707C:: @ 83D707C
	.4byte gSpriteAnim_83D7068

	.align 2
gBattleAnimSpriteTemplate_83D7080:: @ 83D7080
	spr_template 10192, 10192, gOamData_837DF34, gSpriteAnimTable_83D707C, NULL, gDummySpriteAffineAnimTable, sub_80CEA04

	.align 2
gSpriteAnim_83D7098:: @ 83D7098
	obj_image_anim_frame 0, 10
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70A0:: @ 83D70A0
	obj_image_anim_frame 4, 10
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70A8:: @ 83D70A8
	obj_image_anim_frame 8, 41
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70B0:: @ 83D70B0
	obj_image_anim_frame 12, 10
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70B8:: @ 83D70B8
	obj_image_anim_frame 16, 10
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70C0:: @ 83D70C0
	obj_image_anim_frame 20, 10
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70C8:: @ 83D70C8
	obj_image_anim_frame 0, 10, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D70D0:: @ 83D70D0
	obj_image_anim_frame 4, 10, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D70D8:: @ 83D70D8
	.4byte gSpriteAnim_83D7098
	.4byte gSpriteAnim_83D70A0
	.4byte gSpriteAnim_83D70A8
	.4byte gSpriteAnim_83D70B0
	.4byte gSpriteAnim_83D70B8
	.4byte gSpriteAnim_83D70C0
	.4byte gSpriteAnim_83D70C8
	.4byte gSpriteAnim_83D70D0

	.align 2
gSpriteAffineAnim_83D70F8:: @ 83D70F8
	obj_rot_scal_anim_frame 0xC, 0xC, 0, 16
	obj_rot_scal_anim_frame 0xFFF4, 0xFFF4, 0, 16
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D7110:: @ 83D7110
	.4byte gSpriteAffineAnim_83D70F8

	.align 2
gBattleAnimSpriteTemplate_83D7114:: @ 83D7114
	spr_template 10072, 10072, gOamData_837DFEC, gSpriteAnimTable_83D70D8, NULL, gSpriteAffineAnimTable_83D7110, sub_80CEB0C

	.align 2
gUnknown_083D712C:: @ 83D712C
	.incbin "baserom.gba", 0x003d712c, 0x30

	.align 2
gBattleAnimSpriteTemplate_83D715C:: @ 83D715C
	spr_template 10072, 10072, gOamData_837DFEC, gSpriteAnimTable_83D70D8, NULL, gSpriteAffineAnimTable_83D7110, sub_80CECE8

	.align 2
gBattleAnimSpriteTemplate_83D7174:: @ 83D7174
	spr_template 10193, 10193, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CEDF0

	.align 2
gSpriteAffineAnim_83D718C:: @ 83D718C
	obj_rot_scal_anim_frame 0xA0, 0xA0, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D71A4:: @ 83D71A4
	.4byte gSpriteAffineAnim_83D718C

	.align 2
gBattleAnimSpriteTemplate_83D71A8:: @ 83D71A8
	spr_template 10072, 10072, gOamData_837DFEC, gSpriteAnimTable_83D70D8, NULL, gSpriteAffineAnimTable_83D71A4, sub_80CEE60

	.align 2
gSpriteAnim_83D71C0:: @ 83D71C0
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D71D4:: @ 83D71D4
	obj_image_anim_frame 48, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D71E8:: @ 83D71E8
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 48, 2
	obj_image_anim_end

	.align 2
gSpriteAnim_83D71FC:: @ 83D71FC
	obj_image_anim_frame 48, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7210:: @ 83D7210
	.4byte gSpriteAnim_83D71C0
	.4byte gSpriteAnim_83D71E8
	.4byte gSpriteAnim_83D71D4
	.4byte gSpriteAnim_83D71FC

	.align 2
gBattleAnimSpriteTemplate_83D7220:: @ 83D7220
	spr_template 10209, 10209, gOamData_837DF34, gSpriteAnimTable_83D7210, NULL, gDummySpriteAffineAnimTable, sub_80CEF9C

	.align 2
gSpriteAffineAnim_83D7238:: @ 83D7238
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x1E, 0x1E, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D7250:: @ 83D7250
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 11
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 11
	obj_rot_scal_anim_loop 2
	obj_rot_scal_anim_frame 0xFFE2, 0xFFE2, 0, 8
	obj_rot_scal_anim_end

	.align 2
	.incbin "baserom.gba", 0x3d7278, 0x48

	.align 2
gSpriteAffineAnimTable_83D72C0:: @ 83D72C0
	.4byte gSpriteAffineAnim_83D7238
	.4byte gSpriteAffineAnim_83D7250

	.align 2
gBattleAnimSpriteTemplate_83D72C8:: @ 83D72C8
	spr_template 10064, 10064, gOamData_837DFF4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D72C0, sub_80CF040

	.align 2
gBattleAnimSpriteTemplate_83D72E0:: @ 83D72E0
	spr_template 10064, 10064, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D72C0, sub_80CF0BC

	.align 2
gSpriteAnim_83D72F8:: @ 83D72F8
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7300:: @ 83D7300
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7308:: @ 83D7308
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7328:: @ 83D7328
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7348:: @ 83D7348
	.4byte gSpriteAnim_83D72F8
	.4byte gSpriteAnim_83D7300
	.4byte gSpriteAnim_83D7308
	.4byte gSpriteAnim_83D7328

	.align 2
gBattleAnimSpriteTemplate_83D7358:: @ 83D7358
	spr_template 10214, 10214, gOamData_837DF34, gSpriteAnimTable_83D7348, NULL, gDummySpriteAffineAnimTable, sub_80CF1C8

	.align 2
	.incbin "baserom.gba", 0x3d7370, 0xb8

	.align 2
gSpriteAnim_83D7428:: @ 83D7428
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 24, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 40, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_loop 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D744C:: @ 83D744C
	.4byte gSpriteAnim_83D7428

	.align 2
gBattleAnimSpriteTemplate_83D7450:: @ 83D7450
	spr_template 10075, 10075, gOamData_837DF54, gSpriteAnimTable_83D744C, NULL, gDummySpriteAffineAnimTable, sub_80CF610

	.align 2
gSpriteAffineAnim_83D7468:: @ 83D7468
	obj_rot_scal_anim_frame 0x10, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x14, 0x0, 0, 12
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 32
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D7488:: @ 83D7488
	.4byte gSpriteAffineAnim_83D7468

	.align 2
gBattleAnimSpriteTemplate_83D748C:: @ 83D748C
	spr_template 10005, 10005, gOamData_837E0FC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7488, sub_80CF690

	.align 2
gBattleAnimSpriteTemplate_83D74A4:: @ 83D74A4
	spr_template 10003, 10003, gOamData_837E134, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80CF6DC

	.align 2
gUnknown_083D74BC:: @ 83D74BC
	.incbin "baserom.gba", 0x003d74bc, 0x18

	.align 2
gSpriteAffineAnim_83D74D4:: @ 83D74D4
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 0
	obj_rot_scal_anim_frame 0x7, 0x7, 0, -56
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D74EC:: @ 83D74EC
	obj_rot_scal_anim_frame 0x5, 0x5, 0, 10
	obj_rot_scal_anim_frame 0xFFF6, 0xFFF6, 0, 10
	obj_rot_scal_anim_frame 0xA, 0xA, 0, 10
	obj_rot_scal_anim_frame 0xFFF6, 0xFFF6, 0, 10
	obj_rot_scal_anim_frame 0xA, 0xA, 0, 10
	obj_rot_scal_anim_frame 0xFFF6, 0xFFF6, 0, 10
	obj_rot_scal_anim_frame 0xA, 0xA, 0, 10
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D752C:: @ 83D752C
	.4byte gSpriteAffineAnim_83D74D4

	.align 2
gSpriteAffineAnimTable_83D7530:: @ 83D7530
	.4byte gSpriteAffineAnim_83D74EC

	.align 2
gBattleAnimSpriteTemplate_83D7534:: @ 83D7534
	spr_template 10163, 10163, gOamData_837E034, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D752C, sub_807941C

	.align 2
gBattleAnimSpriteTemplate_83D754C:: @ 83D754C
	spr_template 10164, 10164, gOamData_837E034, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D752C, sub_807941C

	.align 2
gBattleAnimSpriteTemplate_83D7564:: @ 83D7564
	spr_template 10260, 10260, gOamData_837E03C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D752C, sub_807941C

	.align 2
gBattleAnimSpriteTemplate_83D757C:: @ 83D757C
	spr_template 10288, 10288, gOamData_837E034, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7530, sub_80D4CA4

	.align 2
gBattleAnimSpriteTemplate_83D7594:: @ 83D7594
	spr_template 10175, 10175, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80794A8

	.align 2
gUnknown_083D75AC:: @ 83D75AC
	.incbin "baserom.gba", 0x003d75ac, 0x18

	.align 2
gSpriteAnim_83D75C4:: @ 83D75C4
	obj_image_anim_frame 8, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D75CC:: @ 83D75CC
	.4byte gSpriteAnim_83D75C4

	.align 2
gSpriteAffineAnim_83D75D0:: @ 83D75D0
	obj_rot_scal_anim_frame 0x0, 0x0, 10, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D75E0:: @ 83D75E0
	.4byte gSpriteAffineAnim_83D75D0

	.align 2
gBattleAnimSpriteTemplate_83D75E4:: @ 83D75E4
	spr_template 10100, 10100, gOamData_837DF8C, gSpriteAnimTable_83D75CC, NULL, gDummySpriteAffineAnimTable, sub_80CFE9C

	.align 2
gBattleAnimSpriteTemplate_83D75FC:: @ 83D75FC
	spr_template 10100, 10100, gOamData_837DF8C, gSpriteAnimTable_83D75CC, NULL, gSpriteAffineAnimTable_83D75E0, sub_80CFF50

	.align 2
gSpriteAffineAnim_83D7614:: @ 83D7614
	obj_rot_scal_anim_frame 0x0, 0x0, 20, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D7624:: @ 83D7624
	.4byte gSpriteAffineAnim_83D7614

	.align 2
gBattleAnimSpriteTemplate_83D7628:: @ 83D7628
	spr_template 10006, 10006, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7624, sub_80CFFD8

	.align 2
gSpriteAffineAnim_83D7640:: @ 83D7640
	obj_rot_scal_anim_frame 0x10, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x0, 0, 40
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D7658:: @ 83D7658
	.4byte gSpriteAffineAnim_83D7640

	.align 2
gBattleAnimSpriteTemplate_83D765C:: @ 83D765C
	spr_template 10009, 10009, gOamData_837DFDC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7658, sub_80D0118

	.align 2
gSpriteAnim_83D7674:: @ 83D7674
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 20
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7684:: @ 83D7684
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 20, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7694:: @ 83D7694
	.4byte gSpriteAnim_83D7674
	.4byte gSpriteAnim_83D7684

	.align 2
gBattleAnimSpriteTemplate_83D769C:: @ 83D769C
	spr_template 10138, 10138, gOamData_837E054, gSpriteAnimTable_83D7694, NULL, gDummySpriteAffineAnimTable, sub_80D0178

	.align 2
gSpriteAnim_83D76B4:: @ 83D76B4
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D76C4:: @ 83D76C4
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 1, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D76D4:: @ 83D76D4
	.4byte gSpriteAnim_83D76B4
	.4byte gSpriteAnim_83D76C4

	.align 2
gBattleAnimSpriteTemplate_83D76DC:: @ 83D76DC
	spr_template 10138, 10138, gOamData_837E054, gSpriteAnimTable_83D76D4, NULL, gDummySpriteAffineAnimTable, sub_80D0228

	.align 2
gUnknown_083D76F4:: @ 83D76F4
	.incbin "baserom.gba", 0x003d76f4, 0x20

gUnknown_083D7714:: @ 83D7714
	.incbin "baserom.gba", 0x003d7714, 0x20

	.align 2
gSpriteAnim_83D7734:: @ 83D7734
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 4, 40, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 12, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7748:: @ 83D7748
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 40
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 12, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D775C:: @ 83D775C
	.4byte gSpriteAnim_83D7734
	.4byte gSpriteAnim_83D7748

	.align 2
gBattleAnimSpriteTemplate_83D7764:: @ 83D7764
	spr_template 10086, 10086, gOamData_837DF2C, gSpriteAnimTable_83D775C, NULL, gDummySpriteAffineAnimTable, sub_80D0930

	.align 2
gSpriteAffineAnim_83D777C:: @ 83D777C
	obj_rot_scal_anim_frame 0xB, 0xB, 0, 8
	obj_rot_scal_anim_frame 0xFFF5, 0xFFF5, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D7794:: @ 83D7794
	.4byte gSpriteAffineAnim_83D777C

	.align 2
gBattleAnimSpriteTemplate_83D7798:: @ 83D7798
	spr_template 10087, 10087, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7794, sub_80D09C0

	.align 2
gUnknown_083D77B0:: @ 83D77B0
	.incbin "baserom.gba", 0x003d77b0, 0x30

	.align 2
gBattleAnimSpriteTemplate_83D77E0:: @ 83D77E0
	spr_template 10002, 10002, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D0E30

	.align 2
gBattleAnimSpriteTemplate_83D77F8:: @ 83D77F8
	spr_template 10197, 10197, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8079534

	.align 2
gSpriteAnim_83D7810:: @ 83D7810
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7824:: @ 83D7824
	.4byte gSpriteAnim_83D7810

	.align 2
gBattleAnimSpriteTemplate_83D7828:: @ 83D7828
	spr_template 10198, 10198, gOamData_837DF34, gSpriteAnimTable_83D7824, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gSpriteAffineAnim_83D7840:: @ 83D7840
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 2
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 4
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 2
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83D7860:: @ 83D7860
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D7870:: @ 83D7870
	obj_rot_scal_anim_frame 0xFFF8, 0x4, 0, 8
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0x10, 0xFFF8, 0, 8
	obj_rot_scal_anim_frame 0xFFF0, 0x8, 0, 8
	obj_rot_scal_anim_loop 1
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D78B0:: @ 83D78B0
	.4byte gSpriteAffineAnim_83D7840
	.4byte gSpriteAffineAnim_83D7860
	.4byte gSpriteAffineAnim_83D7870

	.align 2
gBattleAnimSpriteTemplate_83D78BC:: @ 83D78BC
	spr_template 10202, 10202, gOamData_837E114, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D78B0, sub_80D1368

	.align 2
gSpriteAffineAnim_83D78D4:: @ 83D78D4
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 30
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnim_83D78EC:: @ 83D78EC
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 15
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnim_83D7904:: @ 83D7904
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0xB, 0xB, 0, 45
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnimTable_83D791C:: @ 83D791C
	.4byte gSpriteAffineAnim_83D78D4
	.4byte gSpriteAffineAnim_83D78EC

	.align 2
gSpriteAffineAnimTable_83D7924:: @ 83D7924
	.4byte gSpriteAffineAnim_83D7904

	.align 2
gBattleAnimSpriteTemplate_83D7928:: @ 83D7928
	spr_template 10203, 10203, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D791C, sub_80793C4

	.align 2
gSpriteAffineAnim_83D7940:: @ 83D7940
	obj_rot_scal_anim_frame 0x200, 0x200, 0, 0
	obj_rot_scal_anim_frame 0xFFF0, 0xFFF0, 0, 30
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnimTable_83D7958:: @ 83D7958
	.4byte gSpriteAffineAnim_83D7940

	.align 2
gBattleAnimSpriteTemplate_83D795C:: @ 83D795C
	spr_template 10203, 10203, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7958, sub_80793C4

	.align 2
gBattleAnimSpriteTemplate_83D7974:: @ 83D7974
	spr_template 10203, 10203, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D791C, sub_80D0FD8

	.align 2
gBattleAnimSpriteTemplate_83D798C:: @ 83D798C
	spr_template 10203, 10203, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7924, sub_80D10B8

	.align 2
gBattleAnimSpriteTemplate_83D79A4:: @ 83D79A4
	spr_template 10203, 10203, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D791C, sub_80D1318

	.align 2
gUnknown_083D79BC:: @ 83D79BC
	.incbin "baserom.gba", 0x003d79bc, 0x2c

gUnknown_083D79E8:: @ 83D79E8
	.incbin "baserom.gba", 0x003d79e8, 0x18

gUnknown_083D7A00:: @ 83D7A00
	.incbin "baserom.gba", 0x003d7a00, 0x8

	.align 2
gSpriteAnim_83D7A08:: @ 83D7A08
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 15
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 15, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 15
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 0, 6
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7A40:: @ 83D7A40
	.4byte gSpriteAnim_83D7A08

	.align 2
gBattleAnimSpriteTemplate_83D7A44:: @ 83D7A44
	spr_template 10205, 10205, gOamData_837DF34, gSpriteAnimTable_83D7A40, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gUnknown_083D7A5C:: @ 83D7A5C
	.incbin "baserom.gba", 0x003d7a5c, 0xc

	.align 2
gBattleAnimSpriteTemplate_83D7A68:: @ 83D7A68
	spr_template 10206, 10206, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D1C08

	.align 2
gBattleAnimSpriteTemplate_83D7A80:: @ 83D7A80
	spr_template 10210, 10210, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D1C80

	.align 2
gUnknown_083D7A98:: @ 83D7A98
	.incbin "baserom.gba", 0x003d7a98, 0x18

	.align 2
gBattleAnimSpriteTemplate_83D7AB0:: @ 83D7AB0
	spr_template 10216, 10216, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D1F58

	.align 2
gBattleAnimSpriteTemplate_83D7AC8:: @ 83D7AC8
	spr_template 10216, 10216, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D1FDC

	.align 2
gBattleAnimSpriteTemplate_83D7AE0:: @ 83D7AE0
	spr_template 10216, 10216, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D2064

	.align 2
gSpriteAffineAnim_83D7AF8:: @ 83D7AF8
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D7B10:: @ 83D7B10
	.4byte gSpriteAffineAnim_83D7AF8

	.align 2
gBattleAnimSpriteTemplate_83D7B14:: @ 83D7B14
	spr_template 10217, 10217, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7B10, sub_80D26A4

	.align 2
gBattleAnimSpriteTemplate_83D7B2C:: @ 83D7B2C
	spr_template 10217, 10217, gOamData_837DFEC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7B10, sub_80D27E0

	.align 2
gSpriteAffineAnim_83D7B44:: @ 83D7B44
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D7B5C:: @ 83D7B5C
	.4byte gSpriteAffineAnim_83D7B44

	.align 2
gBattleAnimSpriteTemplate_83D7B60:: @ 83D7B60
	spr_template 10237, 10237, gOamData_837DFE4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7B5C, sub_80D28AC

	.align 2
gSpriteAnim_83D7B78:: @ 83D7B78
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7B90:: @ 83D7B90
	.4byte gSpriteAnim_83D7B78

	.align 2
gBattleAnimSpriteTemplate_83D7B94:: @ 83D7B94
	spr_template 10218, 10218, gOamData_837DF2C, gSpriteAnimTable_83D7B90, NULL, gDummySpriteAffineAnimTable, sub_80D2920

	.align 2
gSpriteAnim_83D7BAC:: @ 83D7BAC
	obj_image_anim_frame 0, 24
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7BB4:: @ 83D7BB4
	.4byte gSpriteAnim_83D7BAC

	.align 2
gBattleAnimSpriteTemplate_83D7BB8:: @ 83D7BB8
	spr_template 10220, 10220, gOamData_837DF34, gSpriteAnimTable_83D7BB4, NULL, gDummySpriteAffineAnimTable, sub_80D2938

	.align 2
gBattleAnimSpriteTemplate_83D7BD0:: @ 83D7BD0
	spr_template 10219, 10219, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D2A38

	.align 2
gSpriteAnim_83D7BE8:: @ 83D7BE8
	obj_image_anim_frame 0, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83D7BF0:: @ 83D7BF0
	obj_image_anim_frame 16, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D7BF8:: @ 83D7BF8
	.4byte gSpriteAnim_83D7BE8
	.4byte gSpriteAnim_83D7BF0

	.align 2
gBattleAnimSpriteTemplate_83D7C00:: @ 83D7C00
	spr_template 10221, 10221, gOamData_837DF34, gSpriteAnimTable_83D7BF8, NULL, gDummySpriteAffineAnimTable, sub_80D2ABC

	.align 2
gSpriteAnim_83D7C18:: @ 83D7C18
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7C2C:: @ 83D7C2C
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7C40:: @ 83D7C40
	.4byte gSpriteAnim_83D7C18
	.4byte gSpriteAnim_83D7C2C

	.align 2
gBattleAnimSpriteTemplate_83D7C48:: @ 83D7C48
	spr_template 10222, 10222, gOamData_837DF34, gSpriteAnimTable_83D7C40, NULL, gDummySpriteAffineAnimTable, sub_80D2BE8

	.align 2
gSpriteAnim_83D7C60:: @ 83D7C60
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 16, 8
	obj_image_anim_frame 32, 8
	obj_image_anim_frame 16, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_83D7C74:: @ 83D7C74
	obj_image_anim_frame 16, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D7C88:: @ 83D7C88
	.4byte gSpriteAnim_83D7C60
	.4byte gSpriteAnim_83D7C74

	.align 2
gBattleAnimSpriteTemplate_83D7C90:: @ 83D7C90
	spr_template 10215, 10215, gOamData_837DF34, gSpriteAnimTable_83D7C88, NULL, gDummySpriteAffineAnimTable, sub_80D2C38

	.align 2
gUnknown_083D7CA8:: @ 83D7CA8
	.incbin "baserom.gba", 0x003d7ca8, 0x20

	.align 2
gBattleAnimSpriteTemplate_83D7CC8:: @ 83D7CC8
	spr_template 10225, 10225, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D2D68

	.align 2
gSpriteAffineAnim_83D7CE0:: @ 83D7CE0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 5
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D7CF0:: @ 83D7CF0
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 16
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnim_83D7D00:: @ 83D7D00
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 16
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnimTable_83D7D10:: @ 83D7D10
	.4byte gSpriteAffineAnim_83D7CE0
	.4byte gSpriteAffineAnim_83D7CF0
	.4byte gSpriteAffineAnim_83D7D00

	.align 2
gBattleAnimSpriteTemplate_83D7D1C:: @ 83D7D1C
	spr_template 10206, 10206, gOamData_837DF8C, gSpriteAnimTable_83D70D8, NULL, gSpriteAffineAnimTable_83D7D10, sub_80D2EC8

	.align 2
gBattleAnimSpriteTemplate_83D7D34:: @ 83D7D34
	spr_template 10206, 10206, gOamData_837DF8C, gSpriteAnimTable_83D70D8, NULL, gSpriteAffineAnimTable_83D7D10, sub_80D2E68

	.align 2
gSpriteAffineAnim_83D7D4C:: @ 83D7D4C
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D7D5C:: @ 83D7D5C
	obj_rot_scal_anim_frame 0x200, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D7D6C:: @ 83D7D6C
	.4byte gSpriteAffineAnim_83D7D4C
	.4byte gSpriteAffineAnim_83D7D5C

	.align 2
gBattleAnimSpriteTemplate_83D7D74:: @ 83D7D74
	spr_template 10244, 10244, gOamData_837E13C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D7D6C, sub_80D3014

	.align 2
	.incbin "baserom.gba", 0x3d7d8c, 0x13a4

gUnknown_083D9130:: @ 83D9130
	.incbin "baserom.gba", 0x003d9130, 0x18

	.align 2
gSpriteAffineAnim_83D9148:: @ 83D9148
	obj_rot_scal_anim_frame 0xFFFB, 0xFFFB, 0, 10
	obj_rot_scal_anim_frame 0x5, 0x5, 0, 10
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D9160:: @ 83D9160
	.4byte gSpriteAffineAnim_83D9148

	.align 2
gSpriteAnim_83D9164:: @ 83D9164
	obj_image_anim_frame 0, 1
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9174:: @ 83D9174
	.4byte gSpriteAnim_83D9164

	.align 2
gBattleAnimSpriteTemplate_83D9178:: @ 83D9178
	spr_template 10146, 10146, gOamData_837E0AC, gSpriteAnimTable_83D9174, NULL, gSpriteAffineAnimTable_83D9160, sub_80D31C8

	.align 2
gSpriteAnim_83D9190:: @ 83D9190
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9198:: @ 83D9198
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D91A0:: @ 83D91A0
	.4byte gSpriteAnim_83D9190
	.4byte gSpriteAnim_83D9198

	.align 2
gSpriteAffineAnim_83D91A8:: @ 83D91A8
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 1
	obj_rot_scal_anim_frame 0x60, 0x60, 0, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D91C0:: @ 83D91C0
	.4byte gSpriteAffineAnim_83D91A8

	.align 2
gBattleAnimSpriteTemplate_83D91C4:: @ 83D91C4
	spr_template 10140, 10140, gOamData_837E024, gSpriteAnimTable_83D91A0, NULL, gSpriteAffineAnimTable_83D91C0, sub_80D33B4

	.align 2
gSpriteAnim_83D91DC:: @ 83D91DC
	obj_image_anim_frame 0, 1
	obj_image_anim_frame 4, 1
	obj_image_anim_frame 8, 1
	obj_image_anim_frame 12, 1
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D91F0:: @ 83D91F0
	.4byte gSpriteAnim_83D91DC

	.align 2
gBattleAnimSpriteTemplate_83D91F4:: @ 83D91F4
	spr_template 10149, 10149, gOamData_837E04C, gSpriteAnimTable_83D91F0, NULL, gDummySpriteAffineAnimTable, sub_80D3554

	.align 2
gBattleAnimSpriteTemplate_83D920C:: @ 83D920C
	spr_template 10259, 10259, gOamData_837E04C, gSpriteAnimTable_83D91F0, NULL, gDummySpriteAffineAnimTable, sub_80D3554

	.align 2
gBattleAnimSpriteTemplate_83D9224:: @ 83D9224
	spr_template 10264, 10264, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D3554

	.align 2
gBattleAnimSpriteTemplate_83D923C:: @ 83D923C
	spr_template 10265, 10265, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D3554

	.align 2
gSpriteAnim_83D9254:: @ 83D9254
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 48, 2
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9264:: @ 83D9264
	.4byte gSpriteAnim_83D9254

	.align 2
gBattleAnimSpriteTemplate_83D9268:: @ 83D9268
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D9264, NULL, gDummySpriteAffineAnimTable, sub_80D3554

	.align 2
gBattleAnimSpriteTemplate_83D9280:: @ 83D9280
	spr_template 10165, 10165, gOamData_837E034, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D752C, sub_80D3554

	.align 2
gSpriteAffineAnim_83D9298:: @ 83D9298
	obj_rot_scal_anim_frame 0x3, 0x3, 10, 50
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 10
	obj_rot_scal_anim_frame 0xFFEC, 0xFFEC, -10, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D92B8:: @ 83D92B8
	obj_rot_scal_anim_frame 0x150, 0x150, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D92C8:: @ 83D92C8
	.4byte gSpriteAffineAnim_83D9298

	.align 2
gSpriteAffineAnimTable_83D92CC:: @ 83D92CC
	.4byte gSpriteAffineAnim_83D92B8

	.align 2
gBattleAnimSpriteTemplate_83D92D0:: @ 83D92D0
	spr_template 10149, 10149, gOamData_837E10C, gSpriteAnimTable_83D91F0, NULL, gSpriteAffineAnimTable_83D92C8, sub_80D3698

	.align 2
gBattleAnimSpriteTemplate_83D92E8:: @ 83D92E8
	spr_template 10149, 10149, gOamData_837E10C, gSpriteAnimTable_83D91F0, NULL, gSpriteAffineAnimTable_83D92CC, sub_80D3728

	.align 2
gSpriteAnim_83D9300:: @ 83D9300
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9308:: @ 83D9308
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9310:: @ 83D9310
	.4byte gSpriteAnim_83D9300

	.align 2
gSpriteAnimTable_83D9314:: @ 83D9314
	.4byte gSpriteAnim_83D9308

	.align 2
gBattleAnimSpriteTemplate_83D9318:: @ 83D9318
	spr_template 10155, 10155, gOamData_837E04C, gSpriteAnimTable_83D9310, NULL, gDummySpriteAffineAnimTable, sub_80794A8

	.align 2
gBattleAnimSpriteTemplate_83D9330:: @ 83D9330
	spr_template 10155, 10155, gOamData_837E10C, gSpriteAnimTable_83D9314, NULL, gSpriteAffineAnimTable_83DA318, sub_80D37FC

	.align 2
gBattleAnimSpriteTemplate_83D9348:: @ 83D9348
	spr_template 10141, 10141, gOamData_837DF24, gSpriteAnimTable_83D9BC8, NULL, gDummySpriteAffineAnimTable, sub_80D3838

	.align 2
gBattleAnimSpriteTemplate_83D9360:: @ 83D9360
	spr_template 10155, 10155, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D4044

	.align 2
gUnknown_083D9378:: @ 83D9378
	.incbin "baserom.gba", 0x003d9378, 0x18

	.align 2
gSpriteAnim_83D9390:: @ 83D9390
	obj_image_anim_frame 8, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9398:: @ 83D9398
	obj_image_anim_frame 9, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D93A0:: @ 83D93A0
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D93A8:: @ 83D93A8
	.4byte gSpriteAnim_83D9390
	.4byte gSpriteAnim_83D9398

	.align 2
gSpriteAnimTable_83D93B0:: @ 83D93B0
	.4byte gSpriteAnim_83D93A0

	.align 2
	.incbin "baserom.gba", 0x3d93b4, 0x30

	.align 2
gSpriteAffineAnim_83D93E4:: @ 83D93E4
	obj_rot_scal_anim_frame 0x150, 0x150, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 15
	obj_rot_scal_anim_end

	.align 2
	.incbin "baserom.gba", 0x3d93fc, 0x8

	.align 2
gSpriteAffineAnimTable_83D9404:: @ 83D9404
	.4byte gSpriteAffineAnim_83D93E4

	.align 2
gBattleAnimSpriteTemplate_83D9408:: @ 83D9408
	spr_template 10155, 10155, gOamData_837DF24, gSpriteAnimTable_83D93A8, NULL, gDummySpriteAffineAnimTable, sub_80D4BF0

	.align 2
gUnknown_083D9420:: @ 83D9420
	.incbin "baserom.gba", 0x003d9420, 0x18

	.align 2
gBattleAnimSpriteTemplate_83D9438:: @ 83D9438
	spr_template 10155, 10155, gOamData_837DF8C, gSpriteAnimTable_83D93B0, NULL, gSpriteAffineAnimTable_83D9404, sub_807A9BC

	.align 2
gSpriteAnim_83D9450:: @ 83D9450
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83D9460:: @ 83D9460
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 4, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9470:: @ 83D9470
	.4byte gSpriteAnim_83D9450
	.4byte gSpriteAnim_83D9460

	.align 2
gBattleAnimSpriteTemplate_83D9478:: @ 83D9478
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D9470, NULL, gDummySpriteAffineAnimTable, sub_80D4ED8

	.align 2
gBattleAnimSpriteTemplate_83D9490:: @ 83D9490
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D9470, NULL, gDummySpriteAffineAnimTable, sub_80D4F18

	.align 2
gSpriteAnim_83D94A8:: @ 83D94A8
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 3
	obj_image_anim_frame 80, 3
	obj_image_anim_frame 96, 3
	obj_image_anim_frame 112, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D94CC:: @ 83D94CC
	.4byte gSpriteAnim_83D94A8

	.align 2
gSpriteAnim_83D94D0:: @ 83D94D0
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_frame 64, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D94E8:: @ 83D94E8
	.4byte gSpriteAnim_83D94D0

	.align 2
gSpriteAffineAnim_83D94EC:: @ 83D94EC
	obj_rot_scal_anim_frame 0x32, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x20, 0x0, 0, 7
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D9504:: @ 83D9504
	.4byte gSpriteAffineAnim_83D94EC

	.align 2
gBattleAnimSpriteTemplate_83D9508:: @ 83D9508
	spr_template 10033, 10033, gOamData_837DF94, gSpriteAnimTable_83D94CC, NULL, gSpriteAffineAnimTable_83D9504, sub_80D4FCC

	.align 2
gBattleAnimSpriteTemplate_83D9520:: @ 83D9520
	spr_template 10033, 10033, gOamData_837DF34, gSpriteAnimTable_83D94CC, NULL, gDummySpriteAffineAnimTable, sub_80D4FCC

	.align 2
gBattleAnimSpriteTemplate_83D9538:: @ 83D9538
	spr_template 10035, 10035, gOamData_837DF34, gSpriteAnimTable_83D94E8, NULL, gDummySpriteAffineAnimTable, sub_80D4F5C

	.align 2
	.incbin "baserom.gba", 0x3d9550, 0x44

	.align 2
gSpriteAffineAnim_83D9594:: @ 83D9594
	obj_rot_scal_anim_frame 0x50, 0x50, 0, 0
	obj_rot_scal_anim_frame 0x2, 0x2, 10, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D95AC:: @ 83D95AC
	.4byte gSpriteAffineAnim_83D9594

	.align 2
gBattleAnimSpriteTemplate_83D95B0:: @ 83D95B0
	spr_template 10157, 10157, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D95AC, sub_80D517C

	.align 2
gSpriteAnim_83D95C8:: @ 83D95C8
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D95E0:: @ 83D95E0
	.4byte gSpriteAnim_83D95C8

	.align 2
gBattleAnimSpriteTemplate_83D95E4:: @ 83D95E4
	spr_template 10029, 10029, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_807941C

	.align 2
gBattleAnimSpriteTemplate_83D95FC:: @ 83D95FC
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D95E0, NULL, gDummySpriteAffineAnimTable, sub_80D51A8

	.align 2
gBattleAnimSpriteTemplate_83D9614:: @ 83D9614
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D95E0, NULL, gDummySpriteAffineAnimTable, sub_80D5210

	.align 2
gBattleAnimSpriteTemplate_83D962C:: @ 83D962C
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D95E0, NULL, gDummySpriteAffineAnimTable, sub_80D522C

	.align 2
gSpriteAnim_83D9644:: @ 83D9644
	obj_image_anim_frame 32, 6
	obj_image_anim_frame 48, 6
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9650:: @ 83D9650
	.4byte gSpriteAnim_83D9644

	.align 2
	.incbin "baserom.gba", 0x3d9654, 0x28

	.align 2
gBattleAnimSpriteTemplate_83D967C:: @ 83D967C
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D9650, NULL, gDummySpriteAffineAnimTable, sub_80D5374

	.align 2
gBattleAnimSpriteTemplate_83D9694:: @ 83D9694
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D95E0, NULL, gDummySpriteAffineAnimTable, sub_80D53B4

	.align 2
gBattleAnimSpriteTemplate_83D96AC:: @ 83D96AC
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D95E0, NULL, gDummySpriteAffineAnimTable, sub_807A9BC

	.align 2
gUnknown_083D96C4:: @ 83D96C4
	.incbin "baserom.gba", 0x003d96c4, 0x18

gUnknown_083D96DC:: @ 83D96DC
	.incbin "baserom.gba", 0x003d96dc, 0x2

gUnknown_083D96DE:: @ 83D96DE
	.incbin "baserom.gba", 0x003d96de, 0x1A

	.align 2
gBattleAnimSpriteTemplate_83D96F8:: @ 83D96F8
	spr_template 10201, 10201, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D5A20

	.align 2
gSpriteAnim_83D9710:: @ 83D9710
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83D9724:: @ 83D9724
	obj_image_anim_frame 16, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83D972C:: @ 83D972C
	obj_image_anim_frame 20, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9734:: @ 83D9734
	obj_image_anim_frame 20, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D973C:: @ 83D973C
	.4byte gSpriteAnim_83D9710
	.4byte gSpriteAnim_83D9724
	.4byte gSpriteAnim_83D972C
	.4byte gSpriteAnim_83D9734

	.align 2
gBattleAnimSpriteTemplate_83D974C:: @ 83D974C
	spr_template 10231, 10231, gOamData_837DF2C, gSpriteAnimTable_83D973C, NULL, gDummySpriteAffineAnimTable, sub_80D5B0C

	.align 2
gSpriteAnim_83D9764:: @ 83D9764
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9778:: @ 83D9778
	.4byte gSpriteAnim_83D9764

	.align 2
gBattleAnimSpriteTemplate_83D977C:: @ 83D977C
	spr_template 10232, 10232, gOamData_837DF34, gSpriteAnimTable_83D9778, NULL, gDummySpriteAffineAnimTable, sub_80D5CC0

	.align 2
gUnknown_083D9794:: @ 83D9794
	.incbin "baserom.gba", 0x003d9794, 0x10

gUnknown_083D97A4:: @ 83D97A4
	.incbin "baserom.gba", 0x003d97a4, 0x10

	.align 2
gSpriteAnim_83D97B4:: @ 83D97B4
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 8
	obj_image_anim_frame 48, 5
	obj_image_anim_frame 64, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D97CC:: @ 83D97CC
	.4byte gSpriteAnim_83D97B4

	.align 2
gBattleAnimSpriteTemplate_83D97D0:: @ 83D97D0
	spr_template 10037, 10037, gOamData_837DF34, gSpriteAnimTable_83D97CC, NULL, gDummySpriteAffineAnimTable, sub_80D61C8

	.align 2
	.incbin "baserom.gba", 0x3d97e8, 0x74

	.align 2
gBattleAnimSpriteTemplate_83D985C:: @ 83D985C
	spr_template 10011, 10011, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D6328

	.align 2
gBattleAnimSpriteTemplate_83D9874:: @ 83D9874
	spr_template 10171, 10171, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_807941C

	.align 2
gSpriteAffineAnim_83D988C:: @ 83D988C
	obj_rot_scal_anim_frame 0x0, 0x0, 20, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D989C:: @ 83D989C
	.4byte gSpriteAffineAnim_83D988C

	.align 2
gBattleAnimSpriteTemplate_83D98A0:: @ 83D98A0
	spr_template 10011, 10011, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D989C, sub_80D648C

	.align 2
gSpriteAnim_83D98B8:: @ 83D98B8
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 6
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D98C8:: @ 83D98C8
	.4byte gSpriteAnim_83D98B8

	.align 2
gSpriteAffineAnim_83D98CC:: @ 83D98CC
	obj_rot_scal_anim_frame 0xE8, 0xE8, 0, 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 10
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 10
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83D98EC:: @ 83D98EC
	.4byte gSpriteAffineAnim_83D98CC

	.align 2
gBattleAnimSpriteTemplate_83D98F0:: @ 83D98F0
	spr_template 10282, 10282, gOamData_837DF94, gSpriteAnimTable_83D98C8, NULL, gSpriteAffineAnimTable_83D98EC, sub_80D65DC

	.align 2
gBattleAnimSpriteTemplate_83D9908:: @ 83D9908
	spr_template 10011, 10011, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D989C, sub_80D6658

	.align 2
gBattleAnimSpriteTemplate_83D9920:: @ 83D9920
	spr_template 10011, 10011, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D679C

	.align 2
gUnknown_083D9938:: @ 83D9938
	.incbin "baserom.gba", 0x003d9938, 0x18

	.align 2
gBattleAnimSpriteTemplate_83D9950:: @ 83D9950
	spr_template 10173, 10173, gOamData_837DF54, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D6A6C

	.align 2
gUnknown_083D9968:: @ 83D9968
	.incbin "baserom.gba", 0x003d9968, 0x50

gUnknown_083D99B8:: @ 83D99B8
	.incbin "baserom.gba", 0x003d99b8, 0x18

	.align 2
gSpriteAffineAnim_83D99D0:: @ 83D99D0
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 60
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFC, 0, 5
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 5
	obj_rot_scal_anim_loop 10
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9A10:: @ 83D9A10
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 30
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFC, 0, 5
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 5
	obj_rot_scal_anim_jump 3

	.align 2
gSpriteAffineAnim_83D9A40:: @ 83D9A40
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 30
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 30
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D9A60:: @ 83D9A60
	.4byte gSpriteAffineAnim_83D99D0
	.4byte gSpriteAffineAnim_83D9A10
	.4byte gSpriteAffineAnim_83D9A40

	.align 2
gBattleAnimSpriteTemplate_83D9A6C:: @ 83D9A6C
	spr_template 10212, 10212, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D9A60, sub_80D6D18

	.align 2
gSpriteAnim_83D9A84:: @ 83D9A84
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9A98:: @ 83D9A98
	.4byte gSpriteAnim_83D9A84

	.align 2
gBattleAnimSpriteTemplate_83D9A9C:: @ 83D9A9C
	spr_template 10213, 10213, gOamData_837DF34, gSpriteAnimTable_83D9A98, NULL, gDummySpriteAffineAnimTable, sub_80D6D70

	.align 2
gBattleAnimSpriteTemplate_83D9AB4:: @ 83D9AB4
	spr_template 10212, 10212, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D9A60, sub_80D6DD8

	.align 2
	.incbin "baserom.gba", 0x3d9acc, 0x44

gUnknown_083D9B10:: @ 83D9B10
	.incbin "baserom.gba", 0x003d9b10, 0x18

	.align 2
gBattleAnimSpriteTemplate_83D9B28:: @ 83D9B28
	spr_template 10212, 10212, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D9A60, sub_80D727C

	.align 2
gUnknown_083D9B40:: @ 83D9B40
	.incbin "baserom.gba", 0x003d9b40, 0x48

	.align 2
gSpriteAnim_83D9B88:: @ 83D9B88
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9B90:: @ 83D9B90
	obj_image_anim_frame 6, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9B98:: @ 83D9B98
	obj_image_anim_frame 7, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9BA0:: @ 83D9BA0
	obj_image_anim_frame 8, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9BA8:: @ 83D9BA8
	obj_image_anim_frame 12, 6
	obj_image_anim_frame 13, 6
	obj_image_anim_jump 0

	.align 2
	.incbin "baserom.gba", 0x3d9bb4, 0x4

	.align 2
gSpriteAnimTable_83D9BB8:: @ 83D9BB8
	.4byte gSpriteAnim_83D9B88

	.align 2
gSpriteAnimTable_83D9BBC:: @ 83D9BBC
	.4byte gSpriteAnim_83D9B90

	.align 2
gSpriteAnimTable_83D9BC0:: @ 83D9BC0
	.4byte gSpriteAnim_83D9B98

	.align 2
gSpriteAnimTable_83D9BC4:: @ 83D9BC4
	.4byte gSpriteAnim_83D9BA0

	.align 2
gSpriteAnimTable_83D9BC8:: @ 83D9BC8
	.4byte gSpriteAnim_83D9BA8

	.align 2
gSpriteAffineAnim_83D9BCC:: @ 83D9BCC
	obj_rot_scal_anim_frame 0x0, 0x0, 40, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D9BDC:: @ 83D9BDC
	.4byte gSpriteAffineAnim_83D9BCC

	.align 2
gBattleAnimSpriteTemplate_83D9BE0:: @ 83D9BE0
	spr_template 10141, 10141, gOamData_837E144, gSpriteAnimTable_83D9BB8, NULL, gSpriteAffineAnimTable_83D9BDC, sub_80D78EC

	.align 2
gBattleAnimSpriteTemplate_83D9BF8:: @ 83D9BF8
	spr_template 10141, 10141, gOamData_837E044, gSpriteAnimTable_83D9BBC, NULL, gDummySpriteAffineAnimTable, sub_80D78EC

	.align 2
gSpriteAffineAnim_83D9C10:: @ 83D9C10
	obj_rot_scal_anim_frame 0x0, 0x0, 10, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83D9C20:: @ 83D9C20
	.4byte gSpriteAffineAnim_83D9C10

	.align 2
gBattleAnimSpriteTemplate_83D9C24:: @ 83D9C24
	spr_template 10141, 10141, gOamData_837E0E4, gSpriteAnimTable_83D9BB8, NULL, gSpriteAffineAnimTable_83D9C20, sub_80D792C

	.align 2
gBattleAnimSpriteTemplate_83D9C3C:: @ 83D9C3C
	spr_template 10141, 10141, gOamData_837E044, gSpriteAnimTable_83D9BBC, NULL, gDummySpriteAffineAnimTable, sub_80D792C

	.align 2
gSpriteAffineAnim_83D9C54:: @ 83D9C54
	obj_rot_scal_anim_frame 0xCE, 0xCE, 0, 0
	obj_rot_scal_anim_frame 0x5, 0x5, 0, 10
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 6
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D9C74:: @ 83D9C74
	.4byte gSpriteAffineAnim_83D9C54

	.align 2
gBattleAnimSpriteTemplate_83D9C78:: @ 83D9C78
	spr_template 10141, 10141, gOamData_837E0E4, gSpriteAnimTable_83D9BB8, NULL, gSpriteAffineAnimTable_83D9C74, sub_80D79B4

	.align 2
gBattleAnimSpriteTemplate_83D9C90:: @ 83D9C90
	spr_template 10141, 10141, gOamData_837E0A4, gSpriteAnimTable_83D9BBC, NULL, gSpriteAffineAnimTable_83D9C74, sub_80D79B4

	.align 2
gBattleAnimSpriteTemplate_83D9CA8:: @ 83D9CA8
	spr_template 10141, 10141, gOamData_837DF24, gSpriteAnimTable_83D9BC0, NULL, gDummySpriteAffineAnimTable, sub_80D7A64

	.align 2
gBattleAnimSpriteTemplate_83D9CC0:: @ 83D9CC0
	spr_template 10141, 10141, gOamData_837DF2C, gSpriteAnimTable_83D9BC4, NULL, gDummySpriteAffineAnimTable, sub_80D7CD4

	.align 2
gBattleAnimSpriteTemplate_83D9CD8:: @ 83D9CD8
	spr_template 10141, 10141, gOamData_837DF24, gSpriteAnimTable_83D9BC0, NULL, gDummySpriteAffineAnimTable, sub_80D7CD4

	.align 2
gSpriteAnim_83D9CF0:: @ 83D9CF0
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 6, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9D10:: @ 83D9D10
	.4byte gSpriteAnim_83D9CF0

	.align 2
gBattleAnimSpriteTemplate_83D9D14:: @ 83D9D14
	spr_template 10142, 10142, gOamData_837E084, gSpriteAnimTable_83D9D10, NULL, gDummySpriteAffineAnimTable, sub_80D7E88

	.align 2
gSpriteAnim_83D9D2C:: @ 83D9D2C
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 8, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D9D38:: @ 83D9D38
	.4byte gSpriteAnim_83D9D2C

	.align 2
gBattleAnimSpriteTemplate_83D9D3C:: @ 83D9D3C
	spr_template 10144, 10144, gOamData_837E074, gSpriteAnimTable_83D9D38, NULL, gDummySpriteAffineAnimTable, sub_80D7F10

	.align 2
gBattleAnimSpriteTemplate_83D9D54:: @ 83D9D54
	spr_template 10172, 10172, gOamData_837E074, gSpriteAnimTable_83D9D38, NULL, gDummySpriteAffineAnimTable, sub_80D7F10

	.align 2
gUnknown_083D9D6C:: @ 83D9D6C
	.incbin "baserom.gba", 0x003d9d6c, 0x14

	.align 2
gBattleAnimSpriteTemplate_83D9D80:: @ 83D9D80
	spr_template 10155, 10155, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D83E0

	.align 2
gUnknown_083D9D98:: @ 83D9D98
	.incbin "baserom.gba", 0x003d9d98, 0x14

	.align 2
gBattleAnimSpriteTemplate_83D9DAC:: @ 83D9DAC
	spr_template 10172, 10172, gOamData_837E074, gSpriteAnimTable_83D9D38, NULL, gDummySpriteAffineAnimTable, sub_80D8700

	.align 2
gUnknown_083D9DC4:: @ 83D9DC4
	.incbin "baserom.gba", 0x003d9dc4, 0x58

	.align 2
gSpriteAffineAnim_83D9E1C:: @ 83D9E1C
	obj_rot_scal_anim_frame 0x150, 0x150, 0, 0
	obj_rot_scal_anim_end

	.align 2
	.incbin "baserom.gba", 0x3d9e2c, 0xc

	.align 2
gSpriteAffineAnimTable_83D9E38:: @ 83D9E38
	.4byte gSpriteAffineAnim_83D9E1C

	.align 2
gUnknown_083D9E3C:: @ 83D9E3C
	.incbin "baserom.gba", 0x003d9e3c, 0x18

	.align 2
gBattleAnimSpriteTemplate_83D9E54:: @ 83D9E54
	spr_template 10263, 10263, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83D9E38, sub_807A9BC

	.align 2
gSpriteAnim_83D9E6C:: @ 83D9E6C
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9E74:: @ 83D9E74
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9E88:: @ 83D9E88
	.4byte gSpriteAnim_83D9E6C
	.4byte gSpriteAnim_83D9E74

	.align 2
gSpriteAffineAnim_83D9E90:: @ 83D9E90
	obj_rot_scal_anim_frame 0xE0, 0xE0, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9EA0:: @ 83D9EA0
	obj_rot_scal_anim_frame 0x118, 0x118, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9EB0:: @ 83D9EB0
	obj_rot_scal_anim_frame 0x150, 0x150, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9EC0:: @ 83D9EC0
	obj_rot_scal_anim_frame 0x180, 0x180, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D9ED0:: @ 83D9ED0
	obj_rot_scal_anim_frame 0x1C0, 0x1C0, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D9EE0:: @ 83D9EE0
	.4byte gSpriteAffineAnim_83D9E90
	.4byte gSpriteAffineAnim_83D9EA0
	.4byte gSpriteAffineAnim_83D9EB0
	.4byte gSpriteAffineAnim_83D9EC0
	.4byte gSpriteAffineAnim_83D9ED0

	.align 2
gBattleAnimSpriteTemplate_83D9EF4:: @ 83D9EF4
	spr_template 10043, 10043, gOamData_837DFF4, gSpriteAnimTable_83D9E88, NULL, gSpriteAffineAnimTable_83D9EE0, unc_080B06FC

	.align 2
gBattleAnimSpriteTemplate_83D9F0C:: @ 83D9F0C
	spr_template 10141, 10141, gOamData_837DF24, gSpriteAnimTable_83D9BBC, NULL, gDummySpriteAffineAnimTable, sub_80D8F10

	.align 2
	.incbin "baserom.gba", 0x3d9f24, 0x18

	.align 2
gSpriteAnim_83D9F3C:: @ 83D9F3C
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9F44:: @ 83D9F44
	obj_image_anim_frame 16, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9F4C:: @ 83D9F4C
	obj_image_anim_frame 32, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9F54:: @ 83D9F54
	obj_image_anim_frame 48, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83D9F5C:: @ 83D9F5C
	obj_image_anim_frame 48, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D9F64:: @ 83D9F64
	.4byte gSpriteAnim_83D9F3C

	.align 2
gSpriteAnimTable_83D9F68:: @ 83D9F68
	.4byte gSpriteAnim_83D9F44
	.4byte gSpriteAnim_83D9F4C

	.align 2
gSpriteAnimTable_83D9F70:: @ 83D9F70
	.4byte gSpriteAnim_83D9F54
	.4byte gSpriteAnim_83D9F5C

	.align 2
gBattleAnimSpriteTemplate_83D9F78:: @ 83D9F78
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F64, NULL, gDummySpriteAffineAnimTable, sub_80D902C

	.align 2
gBattleAnimSpriteTemplate_83D9F90:: @ 83D9F90
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F64, NULL, gDummySpriteAffineAnimTable, sub_80D9078

	.align 2
gBattleAnimSpriteTemplate_83D9FA8:: @ 83D9FA8
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F64, NULL, gDummySpriteAffineAnimTable, sub_80D90A4

	.align 2
gBattleAnimSpriteTemplate_83D9FC0:: @ 83D9FC0
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F64, NULL, gDummySpriteAffineAnimTable, sub_80D90F4

	.align 2
gBattleAnimSpriteTemplate_83D9FD8:: @ 83D9FD8
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F70, NULL, gDummySpriteAffineAnimTable, sub_80D92D0

	.align 2
gBattleAnimSpriteTemplate_83D9FF0:: @ 83D9FF0
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F68, NULL, gDummySpriteAffineAnimTable, sub_80D9378

	.align 2
gSpriteAffineAnim_83DA008:: @ 83DA008
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 20, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83DA020:: @ 83DA020
	.4byte gSpriteAffineAnim_83DA008

	.align 2
gBattleAnimSpriteTemplate_83DA024:: @ 83DA024
	spr_template 10143, 10143, gOamData_837DFF4, gSpriteAnimTable_83D9F64, NULL, gSpriteAffineAnimTable_83DA020, sub_80D943C

	.align 2
gSpriteAffineAnim_83DA03C:: @ 83DA03C
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFC, 20, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83DA054:: @ 83DA054
	.4byte gSpriteAffineAnim_83DA03C

	.align 2
gBattleAnimSpriteTemplate_83DA058:: @ 83DA058
	spr_template 10143, 10143, gOamData_837DFF4, gSpriteAnimTable_83D9F64, NULL, gSpriteAffineAnimTable_83DA054, sub_80D943C

	.align 2
gBattleAnimSpriteTemplate_83DA070:: @ 83DA070
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F68, NULL, gDummySpriteAffineAnimTable, sub_80D94A8

	.align 2
gBattleAnimSpriteTemplate_83DA088:: @ 83DA088
	spr_template 10073, 10073, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D9540

	.align 2
gBattleAnimSpriteTemplate_83DA0A0:: @ 83DA0A0
	spr_template 10167, 10167, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D95D0

	.align 2
gBattleAnimSpriteTemplate_83DA0B8:: @ 83DA0B8
	spr_template 10208, 10208, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D96B8

	.align 2
gSpriteAffineAnim_83DA0D0:: @ 83DA0D0
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 64
	obj_rot_scal_anim_frame 0xFFFA, 0xFFFA, 0, 8
	obj_rot_scal_anim_frame 0x6, 0x6, 0, 8
	obj_rot_scal_anim_jump 2

	.align 2
gSpriteAffineAnimTable_83DA0F8:: @ 83DA0F8
	.4byte gSpriteAffineAnim_83DA0D0

	.align 2
gBattleAnimSpriteTemplate_83DA0FC:: @ 83DA0FC
	spr_template 10212, 10212, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA0F8, sub_80D97CC

	.align 2
gBattleAnimSpriteTemplate_83DA114:: @ 83DA114
	spr_template 10257, 10257, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D98D8

	.align 2
gBattleAnimSpriteTemplate_83DA12C:: @ 83DA12C
	spr_template 10256, 10256, gOamData_837DF3C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80D9A38

	.align 2
gBattleAnimSpriteTemplate_83DA144:: @ 83DA144
	spr_template 10143, 10143, gOamData_837DF34, gSpriteAnimTable_83D9F64, NULL, gDummySpriteAffineAnimTable, sub_80D9B48

	.align 2
gSpriteAnim_83DA15C:: @ 83DA15C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA16C:: @ 83DA16C
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA17C:: @ 83DA17C
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA18C:: @ 83DA18C
	.4byte gSpriteAnim_83DA15C
	.4byte gSpriteAnim_83DA16C
	.4byte gSpriteAnim_83DA17C

	.align 2
gBattleAnimSpriteTemplate_83DA198:: @ 83DA198
	spr_template 10245, 10245, gOamData_837DF34, gSpriteAnimTable_83DA18C, NULL, gDummySpriteAffineAnimTable, sub_80D9BD4

	.align 2
gSpriteAnim_83DA1B0:: @ 83DA1B0
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 64, 6
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA1BC:: @ 83DA1BC
	obj_image_anim_frame 0, 6, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 6, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA1C8:: @ 83DA1C8
	obj_image_anim_frame 0, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA1D4:: @ 83DA1D4
	.4byte gSpriteAnim_83DA1B0
	.4byte gSpriteAnim_83DA1BC
	.4byte gSpriteAnim_83DA1C8

	.align 2
gBattleAnimSpriteTemplate_83DA1E0:: @ 83DA1E0
	spr_template 10246, 10246, gOamData_837DF3C, gSpriteAnimTable_83DA1D4, NULL, gDummySpriteAffineAnimTable, sub_80D9BD4

	.align 2
gSpriteAffineAnim_83DA1F8:: @ 83DA1F8
	obj_rot_scal_anim_frame 0x200, 0x200, 0, 0
	obj_rot_scal_anim_frame 0xFFE0, 0xFFE0, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA210:: @ 83DA210
	.4byte gSpriteAffineAnim_83DA1F8

	.align 2
gBattleAnimSpriteTemplate_83DA214:: @ 83DA214
	spr_template 10143, 10143, gOamData_837DFF4, gSpriteAnimTable_83D9F64, NULL, gSpriteAffineAnimTable_83DA210, sub_80D9C40

	.align 2
gSpriteAnim_83DA22C:: @ 83DA22C
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 24, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA240:: @ 83DA240
	.4byte gSpriteAnim_83DA22C

	.align 2
gBattleAnimSpriteTemplate_83DA244:: @ 83DA244
	spr_template 10151, 10151, gOamData_837DF74, gSpriteAnimTable_83DA240, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gSpriteAnim_83DA25C:: @ 83DA25C
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA264:: @ 83DA264
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA26C:: @ 83DA26C
	obj_image_anim_frame 8, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA274:: @ 83DA274
	.4byte gSpriteAnim_83DA25C

	.align 2
gSpriteAnimTable_83DA278:: @ 83DA278
	.4byte gSpriteAnim_83DA264

	.align 2
gSpriteAnimTable_83DA27C:: @ 83DA27C
	.4byte gSpriteAnim_83DA26C

	.align 2
gSpriteAffineAnim_83DA280:: @ 83DA280
	obj_rot_scal_anim_frame 0x160, 0x160, 0, 0
	obj_rot_scal_anim_frame 0xFFF6, 0xFFF6, 0, 10
	obj_rot_scal_anim_frame 0xA, 0xA, 0, 10
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83DA2A0:: @ 83DA2A0
	obj_rot_scal_anim_frame 0xEC, 0xEC, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA2B0:: @ 83DA2B0
	.4byte gSpriteAffineAnim_83DA280

	.align 2
gSpriteAffineAnimTable_83DA2B4:: @ 83DA2B4
	.4byte gSpriteAffineAnim_83DA2A0

	.align 2
gBattleAnimSpriteTemplate_83DA2B8:: @ 83DA2B8
	spr_template 10150, 10150, gOamData_837DFEC, gSpriteAnimTable_83DA274, NULL, gSpriteAffineAnimTable_83DA2B0, sub_80D9D70

	.align 2
gBattleAnimSpriteTemplate_83DA2D0:: @ 83DA2D0
	spr_template 10150, 10150, gOamData_837DFEC, gSpriteAnimTable_83DA274, NULL, gSpriteAffineAnimTable_83DA2B0, sub_80D9DF0

	.align 2
gBattleAnimSpriteTemplate_83DA2E8:: @ 83DA2E8
	spr_template 10150, 10150, gOamData_837DF8C, gSpriteAnimTable_83DA27C, NULL, gSpriteAffineAnimTable_83DA2B4, sub_80D9E94

	.align 2
gSpriteAffineAnim_83DA300:: @ 83DA300
	obj_rot_scal_anim_frame 0xFFF0, 0x10, 0, 6
	obj_rot_scal_anim_frame 0x10, 0xFFF0, 0, 6
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83DA318:: @ 83DA318
	.4byte gSpriteAffineAnim_83DA300

	.align 2
gBattleAnimSpriteTemplate_83DA31C:: @ 83DA31C
	spr_template 10150, 10150, gOamData_837DFEC, gSpriteAnimTable_83DA278, NULL, gSpriteAffineAnimTable_83DA318, sub_80D9F14

	.align 2
gSpriteAffineAnim_83DA334:: @ 83DA334
	obj_rot_scal_anim_frame 0x9C, 0x9C, 0, 0
	obj_rot_scal_anim_frame 0x5, 0x5, 0, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA34C:: @ 83DA34C
	.4byte gSpriteAffineAnim_83DA334

	.align 2
gBattleAnimSpriteTemplate_83DA350:: @ 83DA350
	spr_template 10150, 10150, gOamData_837DF8C, gSpriteAnimTable_83DA274, NULL, gSpriteAffineAnimTable_83DA34C, sub_80D9F88

	.align 2
gBattleAnimSpriteTemplate_83DA368:: @ 83DA368
	spr_template 10155, 10155, gOamData_837E0AC, gSpriteAnimTable_83D9310, NULL, gSpriteAffineAnimTable_83DA34C, sub_80D9F88

	.align 2
gBattleAnimSpriteTemplate_83DA380:: @ 83DA380
	spr_template 10009, 10009, gOamData_837DF7C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DA034

	.align 2
gSpriteAffineAnim_83DA398:: @ 83DA398
	obj_rot_scal_anim_frame 0x10, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xA, 0x0, 0, 24
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA3B0:: @ 83DA3B0
	.4byte gSpriteAffineAnim_83DA398

	.align 2
gBattleAnimSpriteTemplate_83DA3B4:: @ 83DA3B4
	spr_template 10009, 10009, gOamData_837DFDC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA3B0, sub_80DA16C

	.align 2
gSpriteAnim_83DA3CC:: @ 83DA3CC
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83DA3E0:: @ 83DA3E0
	.4byte gSpriteAnim_83DA3CC

	.align 2
gBattleAnimSpriteTemplate_83DA3E4:: @ 83DA3E4
	spr_template 10154, 10154, gOamData_837DF54, gSpriteAnimTable_83DA3E0, NULL, gDummySpriteAffineAnimTable, sub_80DA208

	.align 2
gSpriteAffineAnim_83DA3FC:: @ 83DA3FC
	obj_rot_scal_anim_frame 0x10, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x28, 0x0, 0, 6
	obj_rot_scal_anim_frame 0x0, 0xFFE0, 0, 5
	obj_rot_scal_anim_frame 0xFFF0, 0x20, 0, 10
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA424:: @ 83DA424
	.4byte gSpriteAffineAnim_83DA3FC

	.align 2
gSpriteAffineAnim_83DA428:: @ 83DA428
	obj_rot_scal_anim_frame 0x0, 0x0, 50, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DA438:: @ 83DA438
	obj_rot_scal_anim_frame 0x0, 0x0, -40, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA448:: @ 83DA448
	.4byte gSpriteAffineAnim_83DA428
	.4byte gSpriteAffineAnim_83DA438

	.align 2
gBattleAnimSpriteTemplate_83DA450:: @ 83DA450
	spr_template 10156, 10156, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA424, sub_80DA300

	.align 2
gBattleAnimSpriteTemplate_83DA468:: @ 83DA468
	spr_template 10156, 10156, gOamData_837DF9C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA448, sub_80DA38C

	.align 2
gSpriteAnim_83DA480:: @ 83DA480
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA488:: @ 83DA488
	obj_image_anim_frame 16, 0, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA490:: @ 83DA490
	.4byte gSpriteAnim_83DA480
	.4byte gSpriteAnim_83DA488

	.align 2
gBattleAnimSpriteTemplate_83DA498:: @ 83DA498
	spr_template 10270, 10270, gOamData_837DF94, gSpriteAnimTable_83DA490, NULL, gDummySpriteAffineAnimTable, sub_80DA4D8

	.align 2
	.incbin "baserom.gba", 0x3da4b0, 0x50

	.align 2
gSpriteAnim_83DA500:: @ 83DA500
	obj_image_anim_frame 0, 1
	obj_image_anim_frame 8, 1
	obj_image_anim_frame 16, 1
	obj_image_anim_frame 8, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA518:: @ 83DA518
	.4byte gSpriteAnim_83DA500

	.align 2
gBattleAnimSpriteTemplate_83DA51C:: @ 83DA51C
	spr_template 10162, 10162, gOamData_837DF54, gSpriteAnimTable_83DA518, NULL, gDummySpriteAffineAnimTable, sub_80DB000

	.align 2
gSpriteAffineAnim_83DA534:: @ 83DA534
	obj_rot_scal_anim_frame 0x10, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x28, 0x0, 0, 6
	obj_rot_scal_anim_frame 0x0, 0xFFE0, 0, 5
	obj_rot_scal_anim_frame 0xFFEC, 0x0, 0, 7
	obj_rot_scal_anim_frame 0xFFEC, 0xFFEC, 0, 5
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA564:: @ 83DA564
	.4byte gSpriteAffineAnim_83DA534

	.align 2
gBattleAnimSpriteTemplate_83DA568:: @ 83DA568
	spr_template 10156, 10156, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA564, sub_80DB194

	.align 2
gSpriteAffineAnim_83DA580:: @ 83DA580
	obj_rot_scal_anim_frame 0xA0, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA590:: @ 83DA590
	.4byte gSpriteAffineAnim_83DA580

	.align 2
gBattleAnimSpriteTemplate_83DA594:: @ 83DA594
	spr_template 10156, 10156, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA590, sub_80DB1F4

	.align 2
gSpriteAffineAnim_83DA5AC:: @ 83DA5AC
	obj_rot_scal_anim_frame 0x10, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x28, 0x0, 0, 6
	obj_rot_scal_anim_frame 0x0, 0xFFE0, 0, 5
	obj_rot_scal_anim_frame 0xFFF0, 0x20, 0, 10
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA5D4:: @ 83DA5D4
	.4byte gSpriteAffineAnim_83DA5AC

	.align 2
gBattleAnimSpriteTemplate_83DA5D8:: @ 83DA5D8
	spr_template 10156, 10156, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA5D4, sub_80DB288

	.align 2
	.incbin "baserom.gba", 0x3da5f0, 0x24

	.align 2
gBattleAnimSpriteTemplate_83DA614:: @ 83DA614
	spr_template 10272, 10272, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB374

	.align 2
gBattleAnimSpriteTemplate_83DA62C:: @ 83DA62C
	spr_template 10273, 10273, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB458

	.align 2
	.incbin "baserom.gba", 0x3da644, 0x18

	.align 2
gBattleAnimSpriteTemplate_83DA65C:: @ 83DA65C
	spr_template 10284, 10284, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB5E4

	.align 2
gSpriteAffineAnim_83DA674:: @ 83DA674
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFFE, 0xFFFE, -10, 120
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DA68C:: @ 83DA68C
	.4byte gSpriteAffineAnim_83DA674

	.align 2
gBattleAnimSpriteTemplate_83DA690:: @ 83DA690
	spr_template 10196, 10196, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA68C, sub_80793C4

	.align 2
gBattleAnimSpriteTemplate_83DA6A8:: @ 83DA6A8
	spr_template 10166, 10166, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB74C

	.align 2
gBattleAnimSpriteTemplate_83DA6C0:: @ 83DA6C0
	spr_template 10167, 10167, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB74C

	.align 2
gBattleAnimSpriteTemplate_83DA6D8:: @ 83DA6D8
	spr_template 10168, 10168, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB74C

	.align 2
gBattleAnimSpriteTemplate_83DA6F0:: @ 83DA6F0
	spr_template 10169, 10169, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB74C

	.align 2
gBattleAnimSpriteTemplate_83DA708:: @ 83DA708
	spr_template 10170, 10170, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DB74C

	.align 2
gSpriteAnim_83DA720:: @ 83DA720
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA738:: @ 83DA738
	.4byte gSpriteAnim_83DA720

	.align 2
gBattleAnimSpriteTemplate_83DA73C:: @ 83DA73C
	spr_template 10071, 10071, gOamData_837DF34, gSpriteAnimTable_83DA738, NULL, gDummySpriteAffineAnimTable, sub_80DBA4C

	.align 2
gSpriteAnim_83DA754:: @ 83DA754
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA768:: @ 83DA768
	.4byte gSpriteAnim_83DA754

	.align 2
gBattleAnimSpriteTemplate_83DA76C:: @ 83DA76C
	spr_template 10070, 10070, gOamData_837DF2C, gSpriteAnimTable_83DA768, NULL, gDummySpriteAffineAnimTable, sub_80DBA4C

	.align 2
gBattleAnimSpriteTemplate_83DA784:: @ 83DA784
	spr_template 10163, 10163, gOamData_837DF74, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_807941C

	.align 2
gSpriteAnim_83DA79C:: @ 83DA79C
	obj_image_anim_frame 8, 60, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 22, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_loop 0
	obj_image_anim_frame 16, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_loop 1
	obj_image_anim_frame 8, 22, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 24, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 40, 22, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83DA7DC:: @ 83DA7DC
	obj_image_anim_frame 8, 60
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 8, 22
	obj_image_anim_loop 0
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_loop 1
	obj_image_anim_frame 8, 22
	obj_image_anim_frame 24, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 40, 22
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA81C:: @ 83DA81C
	.4byte gSpriteAnim_83DA79C
	.4byte gSpriteAnim_83DA7DC

	.align 2
gBattleAnimSpriteTemplate_83DA824:: @ 83DA824
	spr_template 10097, 10097, gOamData_837DF74, gSpriteAnimTable_83DA81C, NULL, gDummySpriteAffineAnimTable, sub_80DBAF4

	.align 2
gSpriteAnim_83DA83C:: @ 83DA83C
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 6
	obj_image_anim_frame 48, 6
	obj_image_anim_frame 64, 6
	obj_image_anim_frame 80, 6
	obj_image_anim_frame 96, 18
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DA85C:: @ 83DA85C
	.4byte gSpriteAnim_83DA83C

	.align 2
	.incbin "baserom.gba", 0x3da860, 0x28

gUnknown_083DA888:: @ 83DA888
	.incbin "baserom.gba", 0x003da888, 0x4

	.align 2
gBattleAnimSpriteTemplate_83DA88C:: @ 83DA88C
	spr_template 10093, 10093, gOamData_837DF34, gSpriteAnimTable_83DA85C, NULL, gDummySpriteAffineAnimTable, sub_80DBB70

	.align 2
gUnknown_083DA8A4:: @ 83DA8A4
	.incbin "baserom.gba", 0x003da8a4, 0x20

gUnknown_083DA8C4:: @ 83DA8C4
	.incbin "baserom.gba", 0x003da8c4, 0x18

gUnknown_083DA8DC:: @ 83DA8DC
	.incbin "baserom.gba", 0x003da8dc, 0x18

	.align 2
gBattleAnimSpriteTemplate_83DA8F4:: @ 83DA8F4
	spr_template 10250, 10250, gOamData_837DF3C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DC068

	.align 2
	.incbin "baserom.gba", 0x3da90c, 0xa0

gUnknown_083DA9AC:: @ 83DA9AC
	.incbin "baserom.gba", 0x003da9ac, 0x18

	.align 2
gSpriteAffineAnim_83DA9C4:: @ 83DA9C4
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 120
	obj_rot_scal_anim_end 1

	.align 2
gSpriteAffineAnimTable_83DA9DC:: @ 83DA9DC
	.4byte gSpriteAffineAnim_83DA9C4

	.align 2
gBattleAnimSpriteTemplate_83DA9E0:: @ 83DA9E0
	spr_template 10267, 10267, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DA9DC, sub_80793C4

	.align 2
gSpriteAffineAnim_83DA9F8:: @ 83DA9F8
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 0
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 17
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 10
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 10
	obj_rot_scal_anim_loop 4
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0xFFF0, 0xFFF0, 0, 5
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 5
	obj_rot_scal_anim_loop 7
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DAA50:: @ 83DAA50
	obj_rot_scal_anim_frame 0xFFEC, 0x18, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DAA60:: @ 83DAA60
	.4byte gSpriteAffineAnim_83DA9F8
	.4byte gSpriteAffineAnim_83DAA50

	.align 2
gBattleAnimSpriteTemplate_83DAA68:: @ 83DAA68
	spr_template 10212, 10212, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAA60, sub_80DC700

	.align 2
gSpriteAffineAnim_83DAA80:: @ 83DAA80
	obj_rot_scal_anim_frame 0x100, 0x100, 30, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DAA90:: @ 83DAA90
	obj_rot_scal_anim_frame 0x100, 0x100, -99, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DAAA0:: @ 83DAAA0
	obj_rot_scal_anim_frame 0x100, 0x100, 94, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DAAB0:: @ 83DAAB0
	.4byte gSpriteAffineAnim_83DAA80
	.4byte gSpriteAffineAnim_83DAA90
	.4byte gSpriteAffineAnim_83DAAA0

	.align 2
gBattleAnimSpriteTemplate_83DAABC:: @ 83DAABC
	spr_template 10153, 10153, gOamData_837E014, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAAB0, sub_80DC824

	.align 2
gSpriteAffineAnim_83DAAD4:: @ 83DAAD4
	obj_rot_scal_anim_frame 0x0, 0x0, -33, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DAAE4:: @ 83DAAE4
	obj_rot_scal_anim_frame 0x0, 0x0, 96, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DAAF4:: @ 83DAAF4
	obj_rot_scal_anim_frame 0x0, 0x0, -96, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DAB04:: @ 83DAB04
	.4byte gSpriteAffineAnim_83DAAD4
	.4byte gSpriteAffineAnim_83DAAE4
	.4byte gSpriteAffineAnim_83DAAF4

	.align 2
gBattleAnimSpriteTemplate_83DAB10:: @ 83DAB10
	spr_template 10161, 10161, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAB04, sub_80DC8F4

	.align 2
gBattleAnimSpriteTemplate_83DAB28:: @ 83DAB28
	spr_template 10180, 10180, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DC9A0

	.align 2
gBattleAnimSpriteTemplate_83DAB40:: @ 83DAB40
	spr_template 10179, 10179, gOamData_837DF5C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DCA70

	.align 2
gSpriteAffineAnim_83DAB58:: @ 83DAB58
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x6, 0x6, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83DAB70:: @ 83DAB70
	.4byte gSpriteAffineAnim_83DAB58

	.align 2
gBattleAnimSpriteTemplate_83DAB74:: @ 83DAB74
	spr_template 10181, 10181, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAB70, sub_80DCB38

	.align 2
gBattleAnimSpriteTemplate_83DAB8C:: @ 83DAB8C
	spr_template 10161, 10161, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DCBCC

	.align 2
gBattleAnimSpriteTemplate_83DABA4:: @ 83DABA4
	spr_template 10161, 10161, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DCCFC

	.align 2
gBattleAnimSpriteTemplate_83DABBC:: @ 83DABBC
	spr_template 10262, 10262, gOamData_837DF94, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DCCFC

	.align 2
gSpriteAffineAnim_83DABD4:: @ 83DABD4
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 18
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0xFFFB, 0xFFFB, 0, 8
	obj_rot_scal_anim_frame 0x5, 0x5, 0, 8
	obj_rot_scal_anim_loop 5
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DAC0C:: @ 83DAC0C
	.4byte gSpriteAffineAnim_83DABD4

	.align 2
gBattleAnimSpriteTemplate_83DAC10:: @ 83DAC10
	spr_template 10212, 10212, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAC0C, sub_80DCE40

	.align 2
gSpriteAnim_83DAC28:: @ 83DAC28
	obj_image_anim_frame 32, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAC30:: @ 83DAC30
	obj_image_anim_frame 48, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAC38:: @ 83DAC38
	obj_image_anim_frame 64, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DAC40:: @ 83DAC40
	.4byte gSpriteAnim_83DAC28
	.4byte gSpriteAnim_83DAC30
	.4byte gSpriteAnim_83DAC38

	.align 2
gBattleAnimSpriteTemplate_83DAC4C:: @ 83DAC4C
	spr_template 10058, 10058, gOamData_837DF34, gSpriteAnimTable_83DAC40, NULL, gDummySpriteAffineAnimTable, sub_80DCE9C

	.align 2
gBattleAnimSpriteTemplate_83DAC64:: @ 83DAC64
	spr_template 10058, 10058, gOamData_837DF34, gSpriteAnimTable_83DAC40, NULL, gDummySpriteAffineAnimTable, sub_80DCF60

	.align 2
gBattleAnimSpriteTemplate_83DAC7C:: @ 83DAC7C
	spr_template 10074, 10074, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DCFE4

	.align 2
gSpriteAffineAnim_83DAC94:: @ 83DAC94
	obj_rot_scal_anim_frame 0xC0, 0xC0, 0, 0
	obj_rot_scal_anim_frame 0x2, 0xFFFD, 0, 5
	obj_rot_scal_anim_frame 0xFFFE, 0x3, 0, 5
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_83DACB4:: @ 83DACB4
	.4byte gSpriteAffineAnim_83DAC94

	.align 2
gBattleAnimSpriteTemplate_83DACB8:: @ 83DACB8
	spr_template 10149, 10149, gOamData_837E0AC, gSpriteAnimTable_83D91F0, NULL, gSpriteAffineAnimTable_83DACB4, sub_80DCFE4

	.align 2
gBattleAnimSpriteTemplate_83DACD0:: @ 83DACD0
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83D95E0, NULL, gDummySpriteAffineAnimTable, sub_80DCFE4

	.align 2
gBattleAnimSpriteTemplate_83DACE8:: @ 83DACE8
	spr_template 10261, 10261, gOamData_837DF54, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DD3AC

	.align 2
	.incbin "baserom.gba", 0x3dad00, 0x10

gUnknown_083DAD10:: @ 83DAD10
	.incbin "baserom.gba", 0x003dad10, 0x8

	.align 2
gSpriteAnim_83DAD18:: @ 83DAD18
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAD20:: @ 83DAD20
	obj_image_anim_frame 16, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAD28:: @ 83DAD28
	obj_image_anim_frame 32, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAD30:: @ 83DAD30
	obj_image_anim_frame 48, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAD38:: @ 83DAD38
	obj_image_anim_frame 64, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83DAD40:: @ 83DAD40
	obj_image_anim_frame 80, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DAD48:: @ 83DAD48
	.4byte gSpriteAnim_83DAD18
	.4byte gSpriteAnim_83DAD20

	.align 2
gSpriteAnimTable_83DAD50:: @ 83DAD50
	.4byte gSpriteAnim_83DAD28
	.4byte gSpriteAnim_83DAD30

	.align 2
gSpriteAnimTable_83DAD58:: @ 83DAD58
	.4byte gSpriteAnim_83DAD38
	.4byte gSpriteAnim_83DAD40

	.align 2
gBattleAnimSpriteTemplate_83DAD60:: @ 83DAD60
	spr_template 10058, 10058, gOamData_837DF34, gSpriteAnimTable_83DAD48, NULL, gDummySpriteAffineAnimTable, sub_80DD490

	.align 2
gUnknown_083DAD78:: @ 83DAD78
	.incbin "baserom.gba", 0x003dad78, 0x18

gUnknown_083DAD90:: @ 83DAD90
	.incbin "baserom.gba", 0x003dad90, 0x18

	.align 2
gBattleAnimSpriteTemplate_83DADA8:: @ 83DADA8
	spr_template 10058, 10058, gOamData_837DF34, gSpriteAnimTable_83DAD48, NULL, gDummySpriteAffineAnimTable, sub_80DD8E8

	.align 2
gSpriteAffineAnim_83DADC0:: @ 83DADC0
	obj_rot_scal_anim_frame 0x0, 0x0, -5, 5
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83DADD0:: @ 83DADD0
	obj_rot_scal_anim_frame 0x0, 0x0, 5, 5
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83DADE0:: @ 83DADE0
	.4byte gSpriteAffineAnim_83DADC0
	.4byte gSpriteAffineAnim_83DADD0

	.align 2
gBattleAnimSpriteTemplate_83DADE8:: @ 83DADE8
	spr_template 10058, 10058, gOamData_837DF94, gSpriteAnimTable_83DAD48, NULL, gSpriteAffineAnimTable_83DADE0, sub_80DD978

	.align 2
gBattleAnimSpriteTemplate_83DAE00:: @ 83DAE00
	spr_template 10058, 10058, gOamData_837DF94, gSpriteAnimTable_83DAD48, NULL, gSpriteAffineAnimTable_83DADE0, sub_80DD9A4

	.align 2
gBattleAnimSpriteTemplate_83DAE18:: @ 83DAE18
	spr_template 10058, 10058, gOamData_837DF34, gSpriteAnimTable_83DAD58, NULL, gSpriteAffineAnimTable_83DADE0, sub_80CB144

	.align 2
gBattleAnimSpriteTemplate_83DAE30:: @ 83DAE30
	spr_template 10058, 10058, gOamData_837DF94, gSpriteAnimTable_83DAD50, NULL, gSpriteAffineAnimTable_83DADE0, sub_807A9BC

	.align 2
gSpriteAffineAnim_83DAE48:: @ 83DAE48
	obj_rot_scal_anim_frame 0x1E, 0x1E, 10, 5
	obj_rot_scal_anim_frame 0xFFE2, 0xFFE2, 10, 5
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83DAE60:: @ 83DAE60
	.4byte gSpriteAffineAnim_83DAE48

	.align 2
gBattleAnimSpriteTemplate_83DAE64:: @ 83DAE64
	spr_template 10013, 10013, gOamData_837DFEC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAE60, sub_80DDB6C

	.align 2
gBattleAnimSpriteTemplate_83DAE7C:: @ 83DAE7C
	spr_template 10013, 10013, gOamData_837E04C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DDD58

	.align 2
gSpriteAffineAnim_83DAE94:: @ 83DAE94
	obj_rot_scal_anim_frame 0x0, 0x0, 10, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83DAEA4:: @ 83DAEA4
	.4byte gSpriteAffineAnim_83DAE94

	.align 2
gBattleAnimSpriteTemplate_83DAEA8:: @ 83DAEA8
	spr_template 10176, 10176, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DAEA4, sub_80DDF40

	.align 2
gSpriteAnim_83DAEC0:: @ 83DAEC0
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 8, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 24, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DAED8:: @ 83DAED8
	.4byte gSpriteAnim_83DAEC0

	.align 2
gBattleAnimSpriteTemplate_83DAEDC:: @ 83DAEDC
	spr_template 10177, 10177, gOamData_837DF74, gSpriteAnimTable_83DAED8, NULL, gDummySpriteAffineAnimTable, sub_80DE0FC

	.align 2
	.incbin "baserom.gba", 0x3daef4, 0x14

	.align 2
gUnknown_083DAF08:: @ 83DAF08
	.incbin "baserom.gba", 0x003daf08, 0x18

	.align 2
gBattleAnimSpriteTemplate_83DAF20:: @ 83DAF20
	spr_template 10199, 10199, gOamData_837E074, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DEF3C

	.align 2
gBattleAnimSpriteTemplate_83DAF38:: @ 83DAF38
	spr_template 10200, 10200, gOamData_837E054, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DF0B8

	.align 2
gBattleAnimSpriteTemplate_83DAF50:: @ 83DAF50
	spr_template 10221, 10221, gOamData_837E054, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DF0B8

	.align 2
	.incbin "baserom.gba", 0x3daf68, 0x18

gUnknown_083DAF80:: @ 83DAF80
	.incbin "baserom.gba", 0x003daf80, 0x30

	.align 2
gSpriteAnim_83DAFB0:: @ 83DAFB0
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83DAFC8:: @ 83DAFC8
	.4byte gSpriteAnim_83DAFB0

	.align 2
gBattleAnimSpriteTemplate_83DAFCC:: @ 83DAFCC
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83DAFC8, NULL, gDummySpriteAffineAnimTable, sub_80DF5A0

	.align 2
gSpriteAnim_83DAFE4:: @ 83DAFE4
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83DAFF4:: @ 83DAFF4
	obj_image_anim_frame 16, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83DB004:: @ 83DB004
	.4byte gSpriteAnim_83DAFE4
	.4byte gSpriteAnim_83DAFF4

	.align 2
gSpriteAffineAnim_83DB00C:: @ 83DB00C
	obj_rot_scal_anim_frame 0x50, 0x50, 127, 0
	obj_rot_scal_anim_frame 0xD, 0xD, 0, 100
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB024:: @ 83DB024
	obj_rot_scal_anim_frame 0x50, 0x50, 0, 0
	obj_rot_scal_anim_frame 0xD, 0xD, 0, 100
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DB03C:: @ 83DB03C
	.4byte gSpriteAffineAnim_83DB00C
	.4byte gSpriteAffineAnim_83DB024

	.align 2
gBattleAnimSpriteTemplate_83DB044:: @ 83DB044
	spr_template 10029, 10029, gOamData_837DFF4, gSpriteAnimTable_83DB004, NULL, gSpriteAffineAnimTable_83DB03C, sub_80DF760

	.align 2
gSpriteAnim_83DB05C:: @ 83DB05C
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_frame 64, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DB074:: @ 83DB074
	.4byte gSpriteAnim_83DB05C

	.align 2
gBattleAnimSpriteTemplate_83DB078:: @ 83DB078
	spr_template 10035, 10035, gOamData_837DF34, gSpriteAnimTable_83DB074, NULL, gDummySpriteAffineAnimTable, sub_80DF6F0

	.align 2
gSpriteAnim_83DB090:: @ 83DB090
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83DB0A0:: @ 83DB0A0
	.4byte gSpriteAnim_83DB090
	.4byte gSpriteAnim_83DB090

	.align 2
gSpriteAffineAnim_83DB0A8:: @ 83DB0A8
	obj_rot_scal_anim_frame 0x64, 0x64, 127, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB0B8:: @ 83DB0B8
	obj_rot_scal_anim_frame 0x64, 0x64, 0, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DB0C8:: @ 83DB0C8
	.4byte gSpriteAffineAnim_83DB0A8
	.4byte gSpriteAffineAnim_83DB0B8

	.align 2
gBattleAnimSpriteTemplate_83DB0D0:: @ 83DB0D0
	spr_template 10029, 10029, gOamData_837DFF4, gSpriteAnimTable_83DB0A0, NULL, gSpriteAffineAnimTable_83DB0C8, sub_80DF760

	.align 2
gBattleAnimSpriteTemplate_83DB0E8:: @ 83DB0E8
	spr_template 10249, 10249, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80DF78C

	.align 2
gBattleAnimSpriteTemplate_83DB100:: @ 83DB100
	spr_template 10029, 10029, gOamData_837DF34, gSpriteAnimTable_83DAFC8, NULL, gDummySpriteAffineAnimTable, sub_80DFB28

	.align 2
	.incbin "baserom.gba", 0x3db118, 0x18

	.align 2
gSpriteAffineAnim_83DB130:: @ 83DB130
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB140:: @ 83DB140
	obj_rot_scal_anim_frame 0x0, 0x0, 32, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB150:: @ 83DB150
	obj_rot_scal_anim_frame 0x0, 0x0, 64, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB160:: @ 83DB160
	obj_rot_scal_anim_frame 0x0, 0x0, 96, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB170:: @ 83DB170
	obj_rot_scal_anim_frame 0x0, 0x0, -128, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB180:: @ 83DB180
	obj_rot_scal_anim_frame 0x0, 0x0, -96, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB190:: @ 83DB190
	obj_rot_scal_anim_frame 0x0, 0x0, -64, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB1A0:: @ 83DB1A0
	obj_rot_scal_anim_frame 0x0, 0x0, -32, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DB1B0:: @ 83DB1B0
	.4byte gSpriteAffineAnim_83DB130
	.4byte gSpriteAffineAnim_83DB140
	.4byte gSpriteAffineAnim_83DB150
	.4byte gSpriteAffineAnim_83DB160
	.4byte gSpriteAffineAnim_83DB170
	.4byte gSpriteAffineAnim_83DB180
	.4byte gSpriteAffineAnim_83DB190
	.4byte gSpriteAffineAnim_83DB1A0

	.align 2
gBattleAnimSpriteTemplate_83DB1D0:: @ 83DB1D0
	spr_template 10139, 10139, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB1B0, sub_80DFF1C

	.align 2
gBattleAnimSpriteTemplate_83DB1E8:: @ 83DB1E8
	spr_template 10145, 10145, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB1B0, sub_80DFF1C

	.align 2
gSpriteAffineAnim_83DB200:: @ 83DB200
	obj_rot_scal_anim_frame 0xC0, 0xC0, 80, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -2, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB218:: @ 83DB218
	obj_rot_scal_anim_frame 0xC0, 0xC0, -80, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 2, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DB230:: @ 83DB230
	.4byte gSpriteAffineAnim_83DB200
	.4byte gSpriteAffineAnim_83DB218

	.align 2
gBattleAnimSpriteTemplate_83DB238:: @ 83DB238
	spr_template 10155, 10155, gOamData_837DF8C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB230, sub_80DFFD0

	.align 2
gSpriteAnim_83DB250:: @ 83DB250
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83DB268:: @ 83DB268
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DB280:: @ 83DB280
	.4byte gSpriteAnim_83DB250
	.4byte gSpriteAnim_83DB268

	.align 2
gBattleAnimSpriteTemplate_83DB288:: @ 83DB288
	spr_template 10039, 10039, gOamData_837DF34, gSpriteAnimTable_83DB280, NULL, gDummySpriteAffineAnimTable, sub_80E0A10

	.align 2
gSpriteAffineAnim_83DB2A0:: @ 83DB2A0
	obj_rot_scal_anim_frame 0x0, 0x0, 15, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83DB2B0:: @ 83DB2B0
	obj_rot_scal_anim_frame 0x0, 0x0, 20, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83DB2C0:: @ 83DB2C0
	.4byte gSpriteAffineAnim_83DB2A0

	.align 2
gSpriteAffineAnimTable_83DB2C4:: @ 83DB2C4
	.4byte gSpriteAffineAnim_83DB2B0

	.align 2
gBattleAnimSpriteTemplate_83DB2C8:: @ 83DB2C8
	spr_template 10000, 10000, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB2C0, sub_80E0F1C

	.align 2
gBattleAnimSpriteTemplate_83DB2E0:: @ 83DB2E0
	spr_template 10000, 10000, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB2C4, sub_80E1004

	.align 2
gBattleAnimSpriteTemplate_83DB2F8:: @ 83DB2F8
	spr_template 10074, 10074, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E1078

	.align 2
gSpriteAnim_83DB310:: @ 83DB310
	obj_image_anim_frame 1, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DB318:: @ 83DB318
	.4byte gSpriteAnim_83DB310

	.align 2
gBattleAnimSpriteTemplate_83DB31C:: @ 83DB31C
	spr_template 10074, 10074, gOamData_837DF2C, gSpriteAnimTable_83DB318, NULL, gDummySpriteAffineAnimTable, sub_80E1078

	.align 2
gBattleAnimSpriteTemplate_83DB334:: @ 83DB334
	spr_template 10074, 10074, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E1108

	.align 2
gBattleAnimSpriteTemplate_83DB34C:: @ 83DB34C
	spr_template 10074, 10074, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E1728

	.align 2
gBattleAnimSpriteTemplate_83DB364:: @ 83DB364
	spr_template 10281, 10281, gOamData_837DF54, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E17CC

	.align 2
gSpriteAnim_83DB37C:: @ 83DB37C
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83DB390:: @ 83DB390
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 8, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83DB3A4:: @ 83DB3A4
	.4byte gSpriteAnim_83DB37C
	.4byte gSpriteAnim_83DB390

	.align 2
gBattleAnimSpriteTemplate_83DB3AC:: @ 83DB3AC
	spr_template 10073, 10073, gOamData_837DF2C, gSpriteAnimTable_83DB3A4, NULL, gDummySpriteAffineAnimTable, sub_80E1CB4

	.align 2
gBattleAnimSpriteTemplate_83DB3C4:: @ 83DB3C4
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E1D84

	.align 2
gBattleAnimSpriteTemplate_83DB3DC:: @ 83DB3DC
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E1E2C

	.align 2
	.incbin "baserom.gba", 0x3db3f4, 0x34

	.align 2
gBattleAnimSpriteTemplate_83DB428:: @ 83DB428
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E24B8

	.align 2
gSpriteAffineAnim_83DB440:: @ 83DB440
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB450:: @ 83DB450
	obj_rot_scal_anim_frame 0xD8, 0xD8, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB468:: @ 83DB468
	obj_rot_scal_anim_frame 0xB0, 0xB0, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83DB480:: @ 83DB480
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83DB498:: @ 83DB498
	.4byte gSpriteAffineAnim_83DB440
	.4byte gSpriteAffineAnim_83DB450
	.4byte gSpriteAffineAnim_83DB468
	.4byte gSpriteAffineAnim_83DB480

	.align 2
gBattleAnimSpriteTemplate_83DB4A8:: @ 83DB4A8
	spr_template 10135, 10135, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E27A0

	.align 2
gBattleAnimSpriteTemplate_83DB4C0:: @ 83DB4C0
	spr_template 10135, 10135, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E2838

	.align 2
gBattleAnimSpriteTemplate_83DB4D8:: @ 83DB4D8
	spr_template 10148, 10148, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E27A0

	.align 2
gBattleAnimSpriteTemplate_83DB4F0:: @ 83DB4F0
	spr_template 10135, 10135, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E2870

	.align 2
gBattleAnimSpriteTemplate_83DB508:: @ 83DB508
	spr_template 10135, 10135, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E2908

	.align 2
gBattleAnimSpriteTemplate_83DB520:: @ 83DB520
	spr_template 10285, 10285, gOamData_837E054, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E2978

	.align 2
gBattleAnimSpriteTemplate_83DB538:: @ 83DB538
	spr_template 10135, 10135, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E29C0

	.align 2
gBattleAnimSpriteTemplate_83DB550:: @ 83DB550
	spr_template 10135, 10135, gOamData_837E0B4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83DB498, sub_80E27E8

	.align 2
gUnknown_083DB568:: @ 83DB568
	.incbin "baserom.gba", 0x003db568, 0x4

	.align 2
gUnknown_083DB56C:: @ 83DB56C
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

gUnknown_083DB600:: @ 83DB600
	.incbin "baserom.gba", 0x003db600, 0x8

gUnknown_083DB608:: @ 83DB608
	.incbin "baserom.gba", 0x003db608, 0x70

gUnknown_083DB678:: @ 83DB678
	.incbin "baserom.gba", 0x003db678, 0x8

gUnknown_083DB680:: @ 83DB680
	.incbin "baserom.gba", 0x003db680, 0x2

gUnknown_083DB682:: @ 83DB682
	.incbin "baserom.gba", 0x003db682, 0x12

gUnknown_083DB694:: @ 83DB694
	.4byte 0x02001000

gUnknown_083DB698:: @ 83DB698
	.incbin "baserom.gba", 0x003db698, 0xc

gUnknown_083DB6A4:: @ 83DB6A4
	.incbin "baserom.gba", 0x003db6a4, 0xe

gUnknown_083DB6B2:: @ 83DB6B2
	.incbin "baserom.gba", 0x003db6b2, 0x42

gUnknown_083DB6F4:: @ 83DB6F4
	.incbin "baserom.gba", 0x003db6f4, 0xcc

gUnknown_083DB7C0:: @ 83DB7C0
	.incbin "baserom.gba", 0x003db7c0, 0x1c

	.align 2
gUnknown_083DB7DC:: @ 83DB7DC
	.4byte 0x0200ac80
	.4byte 0x0200acc9
	.4byte 0x0200ad12
	.4byte 0x0200ad5b

gUnknown_083DB7EC:: @ 83DB7EC
	.incbin "baserom.gba", 0x003db7ec, 0x8

gUnknown_083DB7F4:: @ 83DB7F4
	.incbin "baserom.gba", 0x003db7f4, 0x24C
	.incbin "graphics/misc/interview_frame.gbapal"
	.incbin "graphics/misc/interview_frame.4bpp.lz"
	.incbin "baserom.gba", 0x003dbb94, 0x20

gUnknown_083DBBB4:: @ 83DBBB4
	.incbin "baserom.gba", 0x003dbbb4, 0x28

gUnknown_083DBBDC:: @ 83DBBDC
	.incbin "baserom.gba", 0x003dbbdc, 0x20

gUnknown_083DBBFC:: @ 83DBBFC
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
gUnknown_083DBC8C:: @ 83DBC8C
	.4byte Unknown_83DBC3C
	.4byte Unknown_83DBC44
	.4byte Unknown_83DBC4C
	.4byte Unknown_83DBC54

	.align 2
gUnknown_083DBC9C:: @ 83DBC9C
	.4byte Unknown_83DBC5C
	.4byte Unknown_83DBC64
	.4byte Unknown_83DBC6C
	.4byte Unknown_83DBC74

gUnknown_083DBCAC:: @ 83DBCAC
	.incbin "baserom.gba", 0x003dbcac, 0x18

gUnknown_083DBCC4:: @ 83DBCC4
Unknown_83DBCC4:
	.incbin "baserom.gba", 0x003dbcc4, 0x3c
Unknown_83DBD00:
	.incbin "baserom.gba", 0x003dbd00, 0x8
Unknown_83DBD08:
	.incbin "baserom.gba", 0x003dbd08, 0x8

gUnknown_083DBD10:: @ 83DBD10
	.4byte Unknown_83DBD00
	.4byte Unknown_83DBD08

gUnknown_083DBD18:: @ 83DBD18
	.incbin "baserom.gba", 0x003dbd18, 0x18

gUnknown_083DBD30:: @ 83DBD30
	obj_tiles 0x083dba60, 2048, 0x0006

gUnknown_083DBD38:: @ 83DBD38
	.incbin "baserom.gba", 0x003dbd38, 0x10

gUnknown_083DBD48:: @ 83DBD48
	.incbin "baserom.gba", 0x003dbd48, 0x18

gUnknown_083DBD60:: @ 83DBD60
	obj_tiles 0x08e8ea98, 4096, 0x0007

gUnknown_083DBD68:: @ 83DBD68
	.incbin "baserom.gba", 0x003dbd68, 0x7c

gUnknown_083DBDE4:: @ 83DBDE4
	.incbin "baserom.gba", 0x003dbde4, 0x18

gUnknown_083DBDFC:: @ 83DBDFC
	.incbin "baserom.gba", 0x003dbdfc, 0x20

gUnknown_083DBE1C:: @ 83DBE1C
	.incbin "baserom.gba", 0x003dbe1c, 0x24

gUnknown_083DBE40:: @ 83DBE40
	.incbin "baserom.gba", 0x003dbe40, 0x68

gUnknown_083DBEA8:: @ 83DBEA8
	.incbin "baserom.gba", 0x003dbea8, 0x4

gUnknown_083DBEAC:: @ 83DBEAC
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

gUnknown_083DFEC4:: @ 83DFEC4
	.incbin "baserom.gba", 0x003dfec4, 0x4

gUnknown_083DFEC8:: @ 83DFEC8
	.4byte 0x02039360

gUnknown_083DFECC:: @ 83DFECC
	.incbin "baserom.gba", 0x003dfecc, 0x20

gUnknown_083DFEEC:: @ 83DFEEC
	.incbin "baserom.gba", 0x003dfeec, 0xa0

gUnknown_083DFF8C:: @ 83DFF8C
	.incbin "baserom.gba", 0x003dff8c, 0xb0

gUnknown_083E003C:: @ 83E003C
	.incbin "baserom.gba", 0x003e003c, 0x20

gUnknown_083E005C:: @ 83E005C
	.incbin "baserom.gba", 0x003e005c, 0x20

gUnknown_083E007C:: @ 83E007C
	.incbin "baserom.gba", 0x003e007c, 0xa8

gUnknown_083E0124:: @ 83E0124
	.incbin "baserom.gba", 0x003e0124, 0x20

gUnknown_083E0144:: @ 83E0144
	.incbin "baserom.gba", 0x003e0144, 0x68

gUnknown_083E01AC:: @ 83E01AC
	.incbin "baserom.gba", 0x003e01ac, 0x48

gUnknown_083E01F4:: @ 83E01F4
	.incbin "baserom.gba", 0x003e01f4, 0x60

gUnknown_083E0254:: @ 83E0254
	.incbin "baserom.gba", 0x003e0254, 0x20

gUnknown_083E0274:: @ 83E0274
	.incbin "baserom.gba", 0x003e0274, 0x20

gUnknown_083E0294:: @ 83E0294
	.incbin "baserom.gba", 0x003e0294, 0x20

gUnknown_083E02B4:: @ 83E02B4
	.incbin "baserom.gba", 0x003e02b4, 0x60

gUnknown_083E0314:: @ 83E0314
	.incbin "baserom.gba", 0x003e0314, 0x20

gUnknown_083E0334:: @ 83E0334
	.incbin "graphics/pokenav/trainereyes_misc_pal.bin" @ the original bytes have an "FF FF" instance which is incompatible with gbagfx to produce the bytes needed to match the original ROM, so I am forced to include it as a .bin until the lowest bit is properly handled or a better workaround is produced

gUnknown_083E0354:: @ 83E0354
	.incbin "graphics/pokenav/trainereyes_misc.4bpp.lz"

gUnknown_083E039C:: @ 83E039C
	.incbin "baserom.gba", 0x003e039c, 0x4

gUnknown_083E03A0:: @ 83E03A0
	.incbin "baserom.gba", 0x003e03a0, 0x8

gUnknown_083E03A8:: @ 83E03A8
	.incbin "baserom.gba", 0x003e03a8, 0x64

gUnknown_083E040C:: @ 83E040C
	.incbin "graphics/misc/ribbons_half.4bpp.lz"

gUnknown_083E05D4:: @ 83E05D4
	.incbin "graphics/pokenav/glyph.gbapal"

gUnknown_083E05F4:: @ 83E05F4
	.incbin "graphics/pokenav/glyph.4bpp.lz"

gUnknown_083E0804:: @ 83E0804
	.incbin "baserom.gba", 0x003e0804, 0x7C4

@ 83E0FC8
	.include "data/text/ribbon_descriptions.s"

@ 83E1204
	.include "data/text/gift_ribbon_descriptions.s"

@ 83E178C
	.include "data/text/trainer_eye_descriptions.s"

	.align 2
gUnknown_083E31B0:: @ 83E31B0
	.4byte PCText_CheckMap
	.4byte PCText_CheckPoke
	.4byte PCText_CheckTrainer
	.4byte PCText_CheckRibbons
	.4byte PCText_PutAwayNav
	.4byte PCText_NoRibbonWin
	.4byte PCText_NoTrainers

	.align 2
gUnknown_083E31CC:: @ 83E31CC
	.4byte PCText_CheckParty
	.4byte PCText_CheckPokeAll
	.4byte PCText_ReturnToNav

	.align 2
gUnknown_083E31D8:: @ 83E31D8
	.4byte PCText_FindCool
	.4byte PCText_FindBeauty
	.4byte PCText_FindCute
	.4byte PCText_FindSmart
	.4byte PCText_FindTough
	.4byte PCText_ReturnToCondition

gUnknown_083E31F0:: @ 83E31F0
	.incbin "baserom.gba", 0x003e31f0, 0x80

gUnknown_083E3270:: @ 83E3270
	.4byte 0x080F0A25
	.4byte 0x080F0A25
	.4byte 0x080F0A75
	.incbin "graphics/pokenav/icon.gbapal"

gUnknown_083E329C:: @ 83E329C
	.incbin "graphics/pokenav/icon.4bpp.lz"
	.incbin "graphics/pokenav/contest_pokeball.4bpp"
	.incbin "baserom.gba", 0x003E3780, 0x20
	.incbin "graphics/pokenav/contest_sparkle.gbapal"
	.incbin "graphics/pokenav/contest_sparkle.4bpp"
	.incbin "graphics/pokenav/contest_arrows.4bpp"
	.incbin "baserom.gba", 0x003E3BC0, 0x20
	.incbin "graphics/unknown/unknown_3E3BE0.4bpp"

gUnknown_083E3C60:: @ 83E3C60
@ replacing .incbin "baserom.gba", 0x003e3c60, 0xa0
	.incbin "graphics/misc/ribbons_cool.gbapal"
	.incbin "graphics/misc/ribbons_beauty.gbapal"
	.incbin "graphics/misc/ribbons_cute.gbapal"
	.incbin "graphics/misc/ribbons_smart.gbapal"
	.incbin "graphics/misc/ribbons_tough.gbapal"

gUnknown_083E3D00:: @ 83E3D00
	.incbin "graphics/misc/ribbons_full.4bpp.lz"
	.incbin "graphics/unknown/unknown_3E41D8.gbapal"
	.incbin "graphics/unknown/unknown_3E41D8.4bpp"
	.incbin "baserom.gba", 0x003e42D8, 0x20

gUnknown_083E42F8:: @ 83E42F8
Unknown_83E42F8:
	.incbin "baserom.gba", 0x003e42f8, 0x148
Unknown_83E4440:
	.incbin "baserom.gba", 0x003e4440, 0x10

gUnknown_083E4450:: @ 83E4450
	.4byte Unknown_83E4440

gUnknown_083E4454:: @ 83E4454
	.incbin "baserom.gba", 0x003e4454, 0x18

gUnknown_083E446C:: @ 83E446C
	obj_tiles 0x083e41d8, 256, 0x0019

gUnknown_083E4474:: @ 83E4474
	.incbin "baserom.gba", 0x003e4474, 0x10

gUnknown_083E4484:: @ 83E4484
	.incbin "baserom.gba", 0x003e4484, 0x18

gUnknown_083E449C:: @ 83E449C
	.incbin "baserom.gba", 0x003e449c, 0x44

gUnknown_083E44E0:: @ 83E44E0
	.incbin "baserom.gba", 0x003e44e0, 0x18

gUnknown_083E44F8:: @ 83E44F8
	.incbin "baserom.gba", 0x003e44f8, 0x38

gUnknown_083E4530:: @ 83E4530
	.incbin "baserom.gba", 0x003e4530, 0x18

gUnknown_083E4548:: @ 83E4548
	.incbin "baserom.gba", 0x003e4548, 0x20

gUnknown_083E4568:: @ 83E4568
	.incbin "baserom.gba", 0x003e4568, 0x8

gUnknown_083E4570:: @ 83E4570
	.incbin "baserom.gba", 0x003e4570, 0x18

gUnknown_083E4588:: @ 83E4588
	.incbin "baserom.gba", 0x003e4588, 0x8

gUnknown_083E4590:: @ 83E4590
	.incbin "baserom.gba", 0x003e4590, 0x18

gUnknown_083E45A8:: @ 83E45A8
	.incbin "baserom.gba", 0x003e45a8, 0x10

gUnknown_083E45B8:: @ 83E45B8
	.incbin "baserom.gba", 0x003e45b8, 0x38

gUnknown_083E45F0:: @ 83E45F0
	.incbin "baserom.gba", 0x003e45f0, 0x38

gUnknown_083E4628:: @ 83E4628
	.incbin "baserom.gba", 0x003e4628, 0x20

gUnknown_083E4648:: @ 83E4648
	.incbin "baserom.gba", 0x003e4648, 0x18

gUnknown_083E4660:: @ 83E4660
	.incbin "baserom.gba", 0x003e4660, 0x18

gUnknown_083E4678:: @ 83E4678
	.incbin "baserom.gba", 0x003e4678, 0x20

gUnknown_083E4698:: @ 83E4698
	.incbin "baserom.gba", 0x003e4698, 0xd4

gUnknown_083E476C:: @ 83E476C
	.incbin "baserom.gba", 0x003e476c, 0x18

gUnknown_083E4784:: @ 83E4784
	obj_tiles 0x083e37c0, 896, 0x0017

gUnknown_083E478C:: @ 83E478C
	obj_pal 0x083e37a0, 0x000f

gUnknown_083E4794:: @ 83E4794
	.incbin "baserom.gba", 0x003e4794, 0x6c

gUnknown_083E4800:: @ 83E4800
	.incbin "baserom.gba", 0x003e4800, 0x18

gUnknown_083E4818:: @ 83E4818
	.incbin "baserom.gba", 0x003e4818, 0x38

gUnknown_083E4850:: @ 83E4850
	.incbin "baserom.gba", 0x003e4850, 0x18

gUnknown_083E4868:: @ 83E4868
	.incbin "baserom.gba", 0x003e4868, 0x10

gUnknown_083E4878:: @ 83E4878
	.incbin "baserom.gba", 0x003e4878, 0x18

gUnknown_083E4890:: @ 83E4890
	.incbin "baserom.gba", 0x003e4890, 0x100

gUnknown_083E4990:: @ 83E4990
	.incbin "baserom.gba", 0x003e4990, 0xc

gUnknown_083E499C:: @ 83E499C
	.incbin "baserom.gba", 0x003e499c, 0x24

gUnknown_083E49C0:: @ 83E49C0
	.incbin "baserom.gba", 0x003e49c0, 0x34

gUnknown_083E49F4:: @ 83E49F4
	.incbin "baserom.gba", 0x003e49f4, 0x20

gUnknown_083E4A14:: @ 83E4A14
	.incbin "baserom.gba", 0x003e4a14, 0x800

gUnknown_083E5214:: @ 83E5214
	.incbin "baserom.gba", 0x003e5214, 0x8

gUnknown_083E521C:: @ 83E521C
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
gUnknown_083E5274:: @ 83E5274
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

gUnknown_083E52AC:: @ 83E52AC
	.4byte Unknown_83E529C
	.4byte Unknown_83E52A4

gUnknown_083E52B4:: @ 83E52B4
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
gUnknown_083E533C:: @ 83E533C
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

gUnknown_083E537C:: @ 83E537C
	.incbin "baserom.gba", 0x003e537c, 0xc

	.align 2
gUnknown_083E5388:: @ 83E5388
	.4byte OtherText_SoPretty
	.4byte OtherText_SoDarling
	.4byte OtherText_SoRelaxed
	.4byte OtherText_SoSunny
	.4byte OtherText_SoDesirable
	.4byte OtherText_SoExciting
	.4byte OtherText_SoAmusing
	.4byte OtherText_SoMagical

	.align 2
gUnknown_083E53A8:: @ 83E53A8
	.4byte OtherText_WantVacationNicePlace
	.4byte OtherText_BoughtCrayonsIsNice
	.4byte OtherText_IfWeCouldFloat
	.4byte OtherText_SandWashesAwayMakeSad
	.4byte OtherText_WhatsBottomSeaLike
	.4byte OtherText_SeeSettingSun
	.4byte OtherText_LyingInGreenGrass
	.4byte OtherText_SecretBasesWonderful

gUnknown_083E53C8:: @ 83E53C8
	.incbin "baserom.gba", 0x003e53c8, 0x18

gUnknown_083E53E0:: @ 83E53E0
	.incbin "baserom.gba", 0x003e53e0, 0x230

gUnknown_083E5610:: @ 83E5610
	.incbin "baserom.gba", 0x003e5610, 0x10

gUnknown_083E5620:: @ 83E5620
	.incbin "baserom.gba", 0x003e5620, 0xc

gUnknown_083E562C:: @ 83E562C
	.incbin "baserom.gba", 0x003e562c, 0x8

gUnknown_083E5634:: @ 83E5634
	.incbin "baserom.gba", 0x003e5634, 0xfc

gUnknown_083E5730:: @ 83E5730
	.incbin "baserom.gba", 0x003e5730, 0x74

gUnknown_083E57A4:: @ 83E57A4
	.incbin "baserom.gba", 0x003e57a4, 0x1c4

gUnknown_083E5968:: @ 83E5968
	.incbin "baserom.gba", 0x003e5968, 0x68

gUnknown_083E59D0:: @ 83E59D0
	.incbin "baserom.gba", 0x003e59d0, 0x18

gUnknown_083E59E8:: @ 83E59E8
	.incbin "baserom.gba", 0x003e59e8, 0x18

gUnknown_083E5A00:: @ 83E5A00
	.incbin "baserom.gba", 0x003e5a00, 0x18

gUnknown_083E5A18:: @ 83E5A18
	.incbin "baserom.gba", 0x003e5a18, 0x4

gUnknown_083E5A1C:: @ 83E5A1C
	.incbin "baserom.gba", 0x003e5a1c, 0x4

gUnknown_083E5A20:: @ 83E5A20
	.incbin "baserom.gba", 0x003E5A20, 0xB0
	.incbin "graphics/pokenav/cursor.gbapal"

gUnknown_083E5AF0:: @ 83E5AF0
	.incbin "graphics/pokenav/cursor_small.4bpp.lz"

gUnknown_083E5B34:: @ 83E5B34
	.incbin "graphics/pokenav/cursor_large.4bpp.lz"

gUnknown_083E5C20:: @ 83E5C20
	.incbin "baserom.gba", 0x003e5c20, 0x20

gUnknown_083E5C40:: @ 83E5C40
	.incbin "baserom.gba", 0x003e5c40, 0x80

gUnknown_083E5CC0:: @ 83E5CC0
	.incbin "baserom.gba", 0x003e5cc0, 0x20

gUnknown_083E5CE0:: @ 83E5CE0
	.incbin "baserom.gba", 0x003e5ce0, 0x80

gUnknown_083E5D60:: @ 83E5D60
	.incbin "graphics/interface/map.gbapal", 0xE0, 0x40

gUnknown_083E5DA0:: @ 83E5DA0
@ replacing .incbin "baserom.gba", 0x003e5da0, 0xd64
	.incbin "graphics/interface/map.8bpp.lz"

gUnknown_083E6B04:: @ 83E6B04
	.incbin "baserom.gba", 0x003e6b04, 0x34c

gUnknown_083E6E50:: @ 83E6E50
	.incbin "baserom.gba", 0x003e6e50, 0x1A4

@ 83E6FF4
	.include "data/region_map_locations.s"

gUnknown_083E7684:: @ 83E7684
	.incbin "baserom.gba", 0x003e7684, 0x64

gUnknown_083E76E8:: @ 83E76E8
	obj_pal 0x083e5ad0, 0x0000

gUnknown_083E76F0:: @ 83E76F0
	.incbin "baserom.gba", 0x003e76f0, 0x18

gUnknown_083E7708:: @ 83E7708
Unknown_83E7708:
	.incbin "baserom.gba", 0x003e7708, 0x8
Unknown_83E7710:
	.incbin "baserom.gba", 0x003e7710, 0x8

gUnknown_083E7718:: @ 83E7718
	.4byte Unknown_83E7710

gUnknown_083E771C:: @ 83E771C
	.incbin "graphics/pokenav/map_frame.gbapal"

gUnknown_083E773C:: @ 83E773C
	.incbin "graphics/pokenav/map_frame.4bpp.lz"

gUnknown_083E7774:: @ 83E7774
	.incbin "baserom.gba", 0x003e7774, 0xb8
	.incbin "graphics/pokenav/map_misc.gbapal"

gUnknown_083E784C:: @ 83E784C
	.incbin "graphics/pokenav/map_misc.4bpp.lz"

gUnknown_083E7920:: @ 83E7920
	.incbin "baserom.gba", 0x003e7920, 0xa0

gUnknown_083E79C0:: @ 83E79C0
	.incbin "baserom.gba", 0x003e79c0, 0xc

gUnknown_083E79CC:: @ 83E79CC
	obj_pal 0x083e782c, 0x0002

gUnknown_083E79D4:: @ 83E79D4
	.incbin "baserom.gba", 0x003e79d4, 0x64

gUnknown_083E7A38:: @ 83E7A38
	.incbin "baserom.gba", 0x003e7a38, 0x18

gUnknown_083E7A50:: @ 83E7A50
	.incbin "baserom.gba", 0x003e7a50, 0x3c74

gUnknown_083EB6C4:: @ 83EB6C4
	.space 1

gUnknown_083EB6C5:: @ 83EB6C5
	.incbin "baserom.gba", 0x003eb6c5, 0x1b

gUnknown_083EB6E0:: @ 83EB6E0
	.incbin "baserom.gba", 0x003eb6e0, 0xf04

	.align 2
gUnknown_083EC5E4:: @ 83EC5E4
	.4byte SecretBaseText_Desk
	.4byte SecretBaseText_Chair
	.4byte SecretBaseText_Plant
	.4byte SecretBaseText_Ornament
	.4byte SecretBaseText_Mat
	.4byte SecretBaseText_Poster
	.4byte SecretBaseText_Doll
	.4byte SecretBaseText_Cushion

	.align 2
gUnknown_083EC604:: @ 83EC604
	.4byte SecretBaseText_Decorate
	.4byte sub_80FF160
	.4byte SecretBaseText_PutAway
	.4byte sub_8100A0C
	.4byte SecretBaseText_Toss
	.4byte sub_8101700
	.4byte UnknownText_Exit
	.4byte gpu_pal_decompress_alloc_tag_and_upload

	.align 2
gUnknown_083EC624:: @ 83EC624
	.4byte SecretBaseText_PutOutDecor
	.4byte SecretBaseText_StoreChosenDecor
	.4byte SecretBaseText_ThrowAwayDecor
	.4byte MenuText_GoBackToPrev

	.align 2
gUnknown_083EC634:: @ 83EC634
	.4byte sub_80FF5BC
	.4byte sub_80FF058
	.4byte sub_81017A0
	.4byte sub_80FF058
	.4byte sub_81017A0
	.4byte sub_80FF058
	.4byte sub_8109D04
	.4byte sub_80FF058

gUnknown_083EC654:: @ 83EC654
	.incbin "baserom.gba", 0x003ec654, 0x6

gUnknown_083EC65A:: @ 83EC65A
	.incbin "baserom.gba", 0x003ec65a, 0x206

gUnknown_083EC860:: @ 83EC860
	.incbin "baserom.gba", 0x003ec860, 0xa0

gUnknown_083EC900:: @ 83EC900
	.incbin "baserom.gba", 0x003ec900, 0x3c

gUnknown_083EC93C:: @ 83EC93C
	.incbin "baserom.gba", 0x003ec93c, 0x18

gUnknown_083EC954:: @ 83EC954
	obj_pal 0x02039184, 0x0bb8

	.align 2
gUnknown_083EC95C:: @ 83EC95C
	.4byte sub_81000C4
	.4byte sub_810065C

	.align 2
gUnknown_083EC964:: @ 83EC964
	.4byte sub_810026C
	.4byte sub_810065C

	.align 2
gUnknown_083EC96C:: @ 83EC96C
	.4byte sub_80FFAB0
	.4byte sub_80FFB08
	.4byte sub_8100F88
	.4byte sub_8100FB4

gUnknown_083EC97C:: @ 83EC97C
	.incbin "baserom.gba", 0x003ec97c, 0x8

gUnknown_083EC984:: @ 83EC984
	.incbin "baserom.gba", 0x003ec984, 0x48

	.align 2
gUnknown_083EC9CC:: @ 83EC9CC
	.4byte sub_810153C
	.4byte sub_8100EEC

gUnknown_083EC9D4:: @ 83EC9D4
	.incbin "baserom.gba", 0x003ec9d4, 0x88

gUnknown_083ECA5C:: @ 83ECA5C
	obj_pal 0x083ec98c, 0x0008

gUnknown_083ECA64:: @ 83ECA64
	.incbin "baserom.gba", 0x003eca64, 0x24

gUnknown_083ECA88:: @ 83ECA88
	.incbin "baserom.gba", 0x003eca88, 0x18

gUnknown_083ECAA0:: @ 83ECAA0
	.incbin "baserom.gba", 0x003ecaa0, 0xc

	.align 2
gUnknown_083ECAAC:: @ 83ECAAC
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
gUnknown_083ECB20:: @ 83ECB20
	.4byte sub_8102A9C
	.4byte sub_8102AD0
	.4byte sub_8102B80

	.align 2
gUnknown_083ECB2C:: @ 83ECB2C
	.4byte sub_8102EA0
	.4byte sub_8102EA4
	.4byte sub_8102EC0
	.4byte sub_8102F4C
	.4byte sub_8103008

	.align 2
gUnknown_083ECB40:: @ 83ECB40
	.4byte sub_810305C
	.4byte sub_81032C0
	.4byte sub_81033DC

	.align 2
gUnknown_083ECB4C:: @ 83ECB4C
	.4byte sub_81034F4
	.4byte sub_8103540
	.4byte sub_810380C

gUnknown_083ECB58:: @ 83ECB58
	.incbin "baserom.gba", 0x003ecb58, 0xc

	.align 2
gUnknown_083ECB64:: @ 83ECB64
	.4byte sub_8103154
	.4byte sub_81031B4
	.4byte sub_81031B4

	.align 2
gUnknown_083ECB70:: @ 83ECB70
	.4byte sub_81032E8
	.4byte sub_81032E8
	.4byte sub_810333C

	.align 2
gUnknown_083ECB7C:: @ 83ECB7C
	.4byte sub_810341C
	.4byte sub_810341C
	.4byte sub_810347C

	.align 2
gUnknown_083ECB88:: @ 83ECB88
	.4byte sub_8103564
	.4byte j5_08111E84
	.4byte sub_8103668

	.align 2
gUnknown_083ECB94:: @ 83ECB94
	.4byte sub_8103830
	.4byte sub_8103910
	.4byte sub_8103A78

	.align 2
gUnknown_083ECBA0:: @ 83ECBA0
	.4byte sub_8103C78
	.4byte sub_8103CAC
	.4byte sub_8103CC8

gUnknown_083ECBAC:: @ 83ECBAC
	.incbin "baserom.gba", 0x003ecbac, 0x8

	.align 2
gUnknown_083ECBB4:: @ 83ECBB4
	.4byte nullsub_68
	.4byte sub_810411C
	.4byte sub_8104144
	.4byte sub_81041AC

gUnknown_083ECBC4:: @ 83ECBC4
	.incbin "baserom.gba", 0x003ecbc4, 0x2

gUnknown_083ECBC6:: @ 83ECBC6
	.incbin "baserom.gba", 0x003ecbc6, 0xa

	.align 2
gUnknown_083ECBD0:: @ 83ECBD0
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
gUnknown_083ECC1C:: @ 83ECC1C
	.4byte 0x02020101

gUnknown_083ECC20:: @ 83ECC20
	.incbin "baserom.gba", 0x003ecc20, 0x8

gUnknown_083ECC28:: @ 83ECC28
	.incbin "baserom.gba", 0x003ecc28, 0x8

	.align 2
gUnknown_083ECC30:: @ 83ECC30
	.4byte sub_8104B3C
	.4byte sub_8104B60
	.4byte sub_8104B80
	.4byte sub_8104B60
	.4byte sub_8104BC8
	.4byte sub_8104B60
	.4byte sub_8104BFC
	.4byte sub_8104B60
	.4byte sub_8104C44

gUnknown_083ECC54:: @ 83ECC54
	.4byte nullsub_69

gUnknown_083ECC58:: @ 83ECC58
	.incbin "baserom.gba", 0x003ecc58, 0x2

gUnknown_083ECC5A:: @ 83ECC5A
	.incbin "baserom.gba", 0x003ecc5a, 0x8

gUnknown_083ECC62:: @ 83ECC62
	.incbin "baserom.gba", 0x003ecc62, 0x8

gUnknown_083ECC6A:: @ 83ECC6A
	.incbin "baserom.gba", 0x003ecc6a, 0x8

gUnknown_083ECC72:: @ 83ECC72
	.incbin "baserom.gba", 0x003ecc72, 0x10

gUnknown_083ECC82:: @ 83ECC82
	.incbin "baserom.gba", 0x003ecc82, 0x10

gUnknown_083ECC92:: @ 83ECC92
	.incbin "baserom.gba", 0x003ecc92, 0x10

gUnknown_083ECCA2:: @ 83ECCA2
	.incbin "baserom.gba", 0x003ecca2, 0x10

gUnknown_083ECCB2:: @ 83ECCB2
	.incbin "baserom.gba", 0x003eccb2, 0x3f

gUnknown_083ECCF1:: @ 83ECCF1
	.incbin "baserom.gba", 0x003eccf1, 0x7

gUnknown_083ECCF8:: @ 83ECCF8
	.incbin "baserom.gba", 0x003eccf8, 0xc

gUnknown_083ECD04:: @ 83ECD04
	.incbin "baserom.gba", 0x003ecd04, 0x12

gUnknown_083ECD16:: @ 83ECD16
	.incbin "baserom.gba", 0x003ecd16, 0x12

gUnknown_083ECD28:: @ 83ECD28
	.incbin "baserom.gba", 0x003ecd28, 0x1e

gUnknown_083ECD46:: @ 83ECD46
	.incbin "baserom.gba", 0x003ecd46, 0x66

gUnknown_083ECDAC:: @ 83ECDAC
	.incbin "baserom.gba", 0x003ecdac, 0x66

gUnknown_083ECE12:: @ 83ECE12
	.incbin "baserom.gba", 0x003ece12, 0xa

gUnknown_083ECE1C:: @ 83ECE1C
	.incbin "baserom.gba", 0x003ece1c, 0x14

gUnknown_083ECE30:: @ 83ECE30
	.incbin "baserom.gba", 0x003ece30, 0xa

gUnknown_083ECE3A:: @ 83ECE3A
	obj_pal 0x02030406, 0x0005

gUnknown_083ECE42:: @ 83ECE42
	.incbin "baserom.gba", 0x003ece42, 0x6

gUnknown_083ECE48:: @ 83ECE48
	.incbin "baserom.gba", 0x003ece48, 0xa

gUnknown_083ECE52:: @ 83ECE52
	.incbin "baserom.gba", 0x003ece52, 0x8

gUnknown_083ECE5A:: @ 83ECE5A
	.incbin "baserom.gba", 0x003ece5a, 0x12

gUnknown_083ECE6C:: @ 83ECE6C
	.incbin "baserom.gba", 0x003ece6c, 0x12

gUnknown_083ECE7E:: @ 83ECE7E
	.incbin "baserom.gba", 0x003ece7e, 0x8e

gUnknown_083ECF0C:: @ 83ECF0C
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
gUnknown_083ED048:: @ 83ED048
	.4byte Unknown_83ECF98
	.4byte Unknown_83ECFA8
	.4byte Unknown_83ECFC4
	.4byte Unknown_83ECFD0
	.4byte Unknown_83ECFE8
	.4byte Unknown_83ED020
	.4byte Unknown_83ECFF8

gUnknown_083ED064:: @ 83ED064
	.incbin "baserom.gba", 0x003ed064, 0x3b0

gUnknown_083ED414:: @ 83ED414
	.incbin "baserom.gba", 0x003ed414, 0x18

gUnknown_083ED42C:: @ 83ED42C
	.incbin "baserom.gba", 0x003ed42c, 0x18

gUnknown_083ED444:: @ 83ED444
	.incbin "baserom.gba", 0x003ed444, 0x18

gUnknown_083ED45C:: @ 83ED45C
	.incbin "baserom.gba", 0x003ed45c, 0x18

gUnknown_083ED474:: @ 83ED474
	.incbin "baserom.gba", 0x003ed474, 0x18

gUnknown_083ED48C:: @ 83ED48C
	.incbin "baserom.gba", 0x003ed48c, 0x18

gUnknown_083ED4A4:: @ 83ED4A4
	.incbin "baserom.gba", 0x003ed4a4, 0x18

gUnknown_083ED4BC:: @ 83ED4BC
	.incbin "baserom.gba", 0x003ed4bc, 0x18

gUnknown_083ED4D4:: @ 83ED4D4
	.incbin "baserom.gba", 0x003ed4d4, 0x18

gUnknown_083ED4EC:: @ 83ED4EC
	.incbin "baserom.gba", 0x003ed4ec, 0x18

gUnknown_083ED504:: @ 83ED504
	.incbin "baserom.gba", 0x003ed504, 0x18

gUnknown_083ED51C:: @ 83ED51C
	.incbin "baserom.gba", 0x003ed51c, 0x18

gUnknown_083ED534:: @ 83ED534
	.incbin "baserom.gba", 0x003ed534, 0x18

gUnknown_083ED54C:: @ 83ED54C
	.incbin "baserom.gba", 0x003ed54c, 0x18

gUnknown_083ED564:: @ 83ED564
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

gUnknown_083ED6CC:: @ 83ED6CC
	.incbin "baserom.gba", 0x003ed6cc, 0x38

gUnknown_083ED704:: @ 83ED704
	.incbin "baserom.gba", 0x003ed704, 0x38

gUnknown_083ED73C:: @ 83ED73C
	.incbin "baserom.gba", 0x003ed73c, 0x20

gUnknown_083ED75C:: @ 83ED75C
	.incbin "baserom.gba", 0x003ed75c, 0x30

gUnknown_083ED78C:: @ 83ED78C
	.incbin "baserom.gba", 0x003ed78c, 0x28

gUnknown_083ED7B4:: @ 83ED7B4
	.incbin "baserom.gba", 0x003ed7b4, 0x20

gUnknown_083ED7D4:: @ 83ED7D4
	.incbin "baserom.gba", 0x003ed7d4, 0x388

	.align 2
gUnknown_083EDB5C:: @ 83EDB5C
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

gUnknown_083EDBC4:: @ 83EDBC4
	.incbin "baserom.gba", 0x003edbc4, 0x68

gUnknown_083EDC2C:: @ 83EDC2C
	.incbin "baserom.gba", 0x003edc2c, 0xb0

gUnknown_083EDCDC:: @ 83EDCDC
	obj_tiles 0x02010000, 2048, 0x0011

gUnknown_083EDCE4:: @ 83EDCE4
	.4byte 0x08E997E8

UnknownPalette_83EDCE8:
	.ifdef SAPPHIRE
	.incbin "graphics/unknown/sapphire_83EDD40.gbapal"
	.else
	.incbin "graphics/unknown/ruby_83EDCE8.gbapal"
	.endif

	.align 2
gUnknown_083EDD08:: @ 83EDD08
	.4byte UnknownPalette_83EDCE8 + 10 * 2
	.4byte UnknownPalette_83EDCE8 + 11 * 2
	.4byte UnknownPalette_83EDCE8 + 12 * 2
	.4byte UnknownPalette_83EDCE8 + 13 * 2
	.4byte UnknownPalette_83EDCE8 + 14 * 2

	.align 2
gUnknown_083EDD1C:: @ 83EDD1C
	.4byte 0x08e95aac
	.4byte 0x08e95aae
	.4byte 0x08e95ab0
	.4byte 0x08e95ab2
	.4byte 0x08e95ab4

gUnknown_083EDD30:: @ 83EDD30
	.incbin "baserom.gba", 0x003edd30, 0x5

gUnknown_083EDD35:: @ 83EDD35
	.incbin "baserom.gba", 0x003edd35, 0x6

gUnknown_083EDD3B:: @ 83EDD3B
Unknown_83EDD3B:
	.incbin "baserom.gba", 0x003edd3b, 0x3
Unknown_83EDD3E:
	.incbin "baserom.gba", 0x003edd3e, 0x20
Unknown_83EDD5E:
	.incbin "baserom.gba", 0x003edd5e, 0x20
Unknown_83EDD7E:
	.incbin "baserom.gba", 0x003edd7e, 0x22

	.align 2
gUnknown_083EDDA0:: @ 83EDDA0
	.4byte Unknown_83EDD3E
	.4byte Unknown_83EDD5E
	.4byte Unknown_83EDD7E

	.align 2
gUnknown_083EDDAC:: @ 83EDDAC
Unknown_83EDDAC:
	.4byte 0x08e95a38
Unknown_83EDDB0:
	.incbin "baserom.gba", 0x003eddb0, 0x20
Unknown_83EDDD0:
	.incbin "baserom.gba", 0x003eddd0, 0x20
Unknown_83EDDF0:
	.incbin "baserom.gba", 0x003eddf0, 0x20

	.align 2
gUnknown_083EDE10:: @ 83EDE10
	.4byte Unknown_83EDDB0
	.4byte Unknown_83EDDD0
	.4byte Unknown_83EDDF0
	.4byte 0x08e97788

	.align 2
gUnknown_083EDE20:: @ 83EDE20
	.4byte 0x08e97788

gUnknown_083EDE24:: @ 83EDE24
	.incbin "baserom.gba", 0x003ede24, 0x20

gUnknown_083EDE44:: @ 83EDE44
	.incbin "baserom.gba", 0x003ede44, 0x48

gUnknown_083EDE8C:: @ 83EDE8C
	.incbin "graphics/slot_machine/reel_time.4bpp.lz"

gUnknown_083EEFE0:: @ 83EEFE0
	.incbin "baserom.gba", 0x003eefe0, 0x1b8

gUnknown_083EF198:: @ 83EF198
	.incbin "baserom.gba", 0x003ef198, 0x200

gUnknown_083EF398:: @ 83EF398
	.incbin "baserom.gba", 0x003ef398, 0x1084

gUnknown_083F041C:: @ 83F041C
	.incbin "baserom.gba", 0x003f041c, 0xc30

gUnknown_083F104C:: @ 83F104C
	.incbin "baserom.gba", 0x003f104c, 0xb38

gUnknown_083F1B84:: @ 83F1B84
	.incbin "baserom.gba", 0x003f1b84, 0xfb8

gUnknown_083F2B3C:: @ 83F2B3C
	.incbin "baserom.gba", 0x003f2b3c, 0x1130

gUnknown_083F3C6C:: @ 83F3C6C
	.incbin "baserom.gba", 0x003f3c6c, 0x5f4

gUnknown_083F4260:: @ 83F4260
	.incbin "baserom.gba", 0x003f4260, 0x50c

gUnknown_083F476C:: @ 83F476C
	.incbin "baserom.gba", 0x003f476c, 0x50c

gUnknown_083F4C78:: @ 83F4C78
	.incbin "baserom.gba", 0x003f4c78, 0x50c

gUnknown_083F5184:: @ 83F5184
	.incbin "baserom.gba", 0x003f5184, 0x50c

gUnknown_083F5690:: @ 83F5690
	.incbin "baserom.gba", 0x003f5690, 0x50c

gUnknown_083F5B9C:: @ 83F5B9C
	.incbin "baserom.gba", 0x003f5b9c, 0x510

	.align 2
gUnknown_083F60AC:: @ 83F60AC
	.4byte OtherText_Cool
	.4byte OtherText_Beauty2
	.4byte OtherText_Cute
	.4byte OtherText_Smart
	.4byte OtherText_Tough

	.align 2
gUnknown_083F60C0:: @ 83F60C0
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

gUnknown_083F6138:: @ 83F6138
	.incbin "baserom.gba", 0x003f6138, 0x8

gUnknown_083F6140:: @ 83F6140
	.space 4

	.align 2
gUnknown_083F6144:: @ 83F6144
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

gUnknown_083F62BC:: @ 83F62BC
	.incbin "baserom.gba", 0x003f62bc, 0x1c

	.align 2
gUnknown_083F62D8:: @ 83F62D8
	.4byte SecretBaseText_Tristan
	.4byte SecretBaseText_Philip
	.4byte SecretBaseText_Dennis
	.4byte SecretBaseText_Roberto

gUnknown_083F62E8:: @ 83F62E8
	.incbin "baserom.gba", 0x003f62e8, 0x4

gUnknown_083F62EC:: @ 83F62EC
	.incbin "graphics/misc/birch_bag.gbapal"
	.incbin "graphics/misc/birch_grass.gbapal"
	.incbin "graphics/misc/birch_ballarrow.gbapal"
	.incbin "graphics/misc/birch_circle.gbapal"

gUnknown_083F636C:: @ 83F636C
	.incbin "baserom.gba", 0x003f636c, 0x18c

gUnknown_083F64F8:: @ 83F64F8
	.incbin "baserom.gba", 0x003f64f8, 0x1f8

gUnknown_083F66F0:: @ 83F66F0
	.incbin "graphics/misc/birch_help.4bpp.lz"
	.incbin "graphics/misc/birch_ballarrow.4bpp.lz"
	.incbin "graphics/misc/birch_circle.4bpp.lz"

gUnknown_083F76B8:: @ 83F76B8
	.incbin "baserom.gba", 0x003f76b8, 0x6

gUnknown_083F76BE:: @ 83F76BE
	.incbin "baserom.gba", 0x003f76be, 0x6

gUnknown_083F76C4:: @ 83F76C4
	.incbin "baserom.gba", 0x003f76c4, 0x20

gUnknown_083F76E4:: @ 83F76E4
Unknown_83F76E4:
	.incbin "baserom.gba", 0x003f76e4, 0x78
Unknown_83F775C:
	.incbin "baserom.gba", 0x003f775c, 0x18
Unknown_83F7774:
	.incbin "baserom.gba", 0x003f7774, 0x18

gUnknown_083F778C:: @ 83F778C
	.4byte Unknown_83F775C
	.4byte Unknown_83F7774

gUnknown_083F7794:: @ 83F7794
	.incbin "baserom.gba", 0x003f7794, 0x10

gUnknown_083F77A4:: @ 83F77A4
	.incbin "baserom.gba", 0x003f77a4, 0x10

gUnknown_083F77B4:: @ 83F77B4
	.incbin "baserom.gba", 0x003f77b4, 0x18

gUnknown_083F77CC:: @ 83F77CC
	.incbin "baserom.gba", 0x003f77cc, 0x18

gUnknown_083F77E4:: @ 83F77E4
	.incbin "baserom.gba", 0x003f77e4, 0x18

gUnknown_083F77FC:: @ 83F77FC
	.incbin "baserom.gba", 0x003f77fc, 0x18
	.incbin "graphics/misc/clock_misc.4bpp.lz"

gUnknown_083F7A90:: @ 83F7A90
	.incbin "baserom.gba", 0x003f7a90, 0x10

gUnknown_083F7AA0:: @ 83F7AA0
	.incbin "baserom.gba", 0x003f7aa0, 0x38

gUnknown_083F7AD8:: @ 83F7AD8
	.incbin "baserom.gba", 0x003f7ad8, 0x18

gUnknown_083F7AF0:: @ 83F7AF0
	.incbin "baserom.gba", 0x003f7af0, 0x38

gUnknown_083F7B28:: @ 83F7B28
	.incbin "baserom.gba", 0x003f7b28, 0x18

gUnknown_083F7B40:: @ 83F7B40
	.incbin "baserom.gba", 0x003f7b40, 0x18

gUnknown_083F7B58:: @ 83F7B58
	.incbin "baserom.gba", 0x003f7b58, 0x2d0

gUnknown_083F7E28:: @ 83F7E28
	.incbin "baserom.gba", 0x003f7e28, 0x80

	.align 2
gUnknown_083F7EA8:: @ 83F7EA8
	.4byte sub_80A5B40
	.4byte c2_exit_to_overworld_2_switch
	.4byte sub_802E424
	.4byte c2_exit_to_overworld_2_switch

gUnknown_083F7EB8:: @ 83F7EB8
	.incbin "baserom.gba", 0x003f7eb8, 0x3c

	.align 2
gUnknown_083F7EF4:: @ 83F7EF4
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

gUnknown_083F7F1C:: @ 83F7F1C
	.incbin "baserom.gba", 0x003f7f1c, 0x3

gUnknown_083F7F1F:: @ 83F7F1F
	.incbin "baserom.gba", 0x003f7f1f, 0x2

gUnknown_083F7F21:: @ 83F7F21
	.incbin "baserom.gba", 0x003f7f21, 0x3

gUnknown_083F7F24:: @ 83F7F24
Unknown_83F7F24:
	.incbin "baserom.gba", 0x003f7f24, 0x24
Unknown_83F7F48:
	.incbin "baserom.gba", 0x003f7f48, 0x28

gUnknown_083F7F70:: @ 83F7F70
	.4byte Unknown_83F7F48

gUnknown_083F7F74:: @ 83F7F74
	obj_tiles 0x08e77d90, 2048, 0x39d0

gUnknown_083F7F7C:: @ 83F7F7C
	obj_pal 0x08e78050, 0x39d0

gUnknown_083F7F84:: @ 83F7F84
	.incbin "baserom.gba", 0x003f7f84, 0x18

gUnknown_083F7F9C:: @ 83F7F9C
	.incbin "baserom.gba", 0x003f7f9c, 0x28

gUnknown_083F7FC4:: @ 83F7FC4
	.incbin "baserom.gba", 0x003f7fc4, 0x88

gUnknown_083F804C:: @ 83F804C
	.incbin "baserom.gba", 0x003f804c, 0x20

gUnknown_083F806C:: @ 83F806C
	.space 32

gUnknown_083F808C:: @ 83F808C
	.incbin "baserom.gba", 0x003f808c, 0x10

gUnknown_083F809C:: @ 83F809C
	.incbin "baserom.gba", 0x003f809c, 0x10

gUnknown_083F80AC:: @ 83F80AC
	.incbin "baserom.gba", 0x003f80ac, 0x1e0

gUnknown_083F828C:: @ 83F828C
	.incbin "graphics/pokenav/map_squares.4bpp.lz"

gUnknown_083F8340:: @ 83F8340
	.incbin "baserom.gba", 0x003f8340, 0x18

gUnknown_083F8358:: @ 83F8358
	.incbin "baserom.gba", 0x003f8358, 0x4

gUnknown_083F835C:: @ 83F835C
	.incbin "baserom.gba", 0x003f835c, 0x8

gUnknown_083F8364:: @ 83F8364
	.incbin "baserom.gba", 0x003f8364, 0xc

gUnknown_083F8370:: @ 83F8370
	.incbin "baserom.gba", 0x003f8370, 0x6

gUnknown_083F8376:: @ 83F8376
	.incbin "baserom.gba", 0x003f8376, 0xa

	.align 2
gUnknown_083F8380:: @ 83F8380
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
gUnknown_083F83C0:: @ 83F83C0
	.4byte OtherText_BlueFlute
	.4byte OtherText_YellowFlute
	.4byte OtherText_RedFlute
	.4byte OtherText_WhiteFlute
	.4byte OtherText_BlackFlute
	.4byte OtherText_PrettyChair
	.4byte OtherText_PrettyDesk
	.4byte OtherText_Cancel2

gUnknown_083F83E0:: @ 83F83E0
	.incbin "baserom.gba", 0x003f83e0, 0xc

gUnknown_083F83EC:: @ 83F83EC
	.incbin "baserom.gba", 0x003f83ec, 0xc

gUnknown_083F83F8:: @ 83F83F8
	.incbin "baserom.gba", 0x003f83f8, 0xc

gUnknown_083F8404:: @ 83F8404
	.incbin "baserom.gba", 0x003f8404, 0x4

gUnknown_083F8408:: @ 83F8408
	.incbin "baserom.gba", 0x003f8408, 0x8

gUnknown_083F8410:: @ 83F8410
	.incbin "baserom.gba", 0x003f8410, 0x8

gUnknown_083F8418:: @ 83F8418
	.incbin "graphics/pokedex/area_glow.gbapal"

gUnknown_083F8438:: @ 83F8438
	.incbin "graphics/pokedex/area_glow.4bpp.lz"

gUnknown_083F856C:: @ 83F856C
	.incbin "baserom.gba", 0x003f856c, 0x2

gUnknown_083F856E:: @ 83F856E
	.incbin "baserom.gba", 0x003f856e, 0xc

gUnknown_083F857A:: @ 83F857A
	.incbin "baserom.gba", 0x003f857a, 0x12

gUnknown_083F858C:: @ 83F858C
	obj_tiles 0x083f85dc, 128, 0x0002

gUnknown_083F8594:: @ 83F8594
	.incbin "baserom.gba", 0x003f8594, 0x10

gUnknown_083F85A4:: @ 83F85A4
	.incbin "baserom.gba", 0x003f85a4, 0xb8

gUnknown_083F865C:: @ 83F865C
	obj_pal 0x08e87d90, 0x0003

gUnknown_083F8664:: @ 83F8664
	.incbin "baserom.gba", 0x003f8664, 0x10

gUnknown_083F8674:: @ 83F8674
	.incbin "baserom.gba", 0x003f8674, 0x18

gUnknown_083F868C:: @ 83F868C
	.incbin "baserom.gba", 0x003f868c, 0x30

gUnknown_083F86BC:: @ 83F86BC
	.incbin "baserom.gba", 0x003f86bc, 0x200

gUnknown_083F88BC:: @ 83F88BC
	.incbin "baserom.gba", 0x003f88bc, 0x1a4

gUnknown_083F8A60:: @ 83F8A60
	.incbin "baserom.gba", 0x003f8a60, 0x1a0

gUnknown_083F8C00:: @ 83F8C00
	.incbin "baserom.gba", 0x003f8c00, 0xc

gUnknown_083F8C0C:: @ 83F8C0C
	.incbin "baserom.gba", 0x003f8c0c, 0x184

gUnknown_083F8D90:: @ 83F8D90
	.incbin "baserom.gba", 0x003f8d90, 0x4

gUnknown_083F8D94:: @ 83F8D94
	.incbin "baserom.gba", 0x003f8d94, 0x5c

gUnknown_083F8DF0:: @ 83F8DF0
	.incbin "baserom.gba", 0x003f8df0, 0x4

gUnknown_083F8DF4:: @ 83F8DF4
	.incbin "baserom.gba", 0x003f8df4, 0x40

gUnknown_083F8E34:: @ 83F8E34
	.incbin "baserom.gba", 0x003f8e34, 0x68

gUnknown_083F8E9C:: @ 83F8E9C
	.incbin "baserom.gba", 0x003f8e9c, 0x18

	.align 2
gUnknown_083F8EB4:: @ 83F8EB4
	.4byte sub_811755C
	.4byte sub_81175C0

	.align 2
gUnknown_083F8EBC:: @ 83F8EBC
	.4byte sub_811577C
	.4byte sub_81157AC

gUnknown_083F8EC4:: @ 83F8EC4
	.incbin "baserom.gba", 0x003f8ec4, 0x6

gUnknown_083F8ECA:: @ 83F8ECA
	.incbin "baserom.gba", 0x003f8eca, 0x4

gUnknown_083F8ECE:: @ 83F8ECE
	.incbin "baserom.gba", 0x003f8ece, 0xa

gUnknown_083F8ED8:: @ 83F8ED8
	.incbin "baserom.gba", 0x003f8ed8, 0x10

gUnknown_083F8EE8:: @ 83F8EE8
	.incbin "baserom.gba", 0x003f8ee8, 0xc

gUnknown_083F8EF4:: @ 83F8EF4
	.incbin "baserom.gba", 0x003f8ef4, 0x8
	.incbin "graphics/roulette/shadow.gbapal"
	.incbin "graphics/roulette/ball.gbapal"
	.incbin "graphics/roulette/ball_counter.gbapal"
	.incbin "graphics/roulette/cursor.gbapal"
	.incbin "baserom.gba", 0x003F8F7C, 0x20
	.incbin "graphics/roulette/shroomish.gbapal"
	.incbin "graphics/roulette/tailow.gbapal"
	.incbin "graphics/roulette/poke_icons.gbapal"
	.incbin "graphics/roulette/wynaut.gbapal"
	.incbin "graphics/roulette/azurill.gbapal"
	.incbin "graphics/roulette/skitty.gbapal"
	.incbin "graphics/roulette/makuhita.gbapal"
	.incbin "baserom.gba", 0x003F907C, 0x20
	.incbin "baserom.gba", 0x003F909C, 0x20
	.incbin "baserom.gba", 0x003F90BC, 0x20
	.incbin "baserom.gba", 0x003F90DC, 0x20

gUnknown_083F90FC:: @ 83F90FC
	.incbin "graphics/roulette/ball.4bpp.lz"
	.incbin "graphics/roulette/ball_counter.4bpp.lz"

gUnknown_083F92A8:: @ 83F92A8
	.incbin "graphics/roulette/roulette_tilt.4bpp.lz"
	.incbin "graphics/roulette/poke_icons.4bpp.lz"
	.incbin "graphics/roulette/poke_icons2.4bpp.lz"

gUnknown_083F9D3C:: @ 83F9D3C
	.incbin "graphics/roulette/shadow.4bpp.lz"
	.incbin "graphics/roulette/cursor.4bpp.lz"

gUnknown_083F9E30:: @ 83F9E30
	.incbin "baserom.gba", 0x003f9e30, 0xb8

gUnknown_083F9EE8:: @ 83F9EE8
	.incbin "baserom.gba", 0x003f9ee8, 0x6c

gUnknown_083F9F54:: @ 83F9F54
	obj_tiles 0x08e824bc, 5632, 0x0004

gUnknown_083F9F5C:: @ 83F9F5C
	.incbin "baserom.gba", 0x003f9f5c, 0x78

gUnknown_083F9FD4:: @ 83F9FD4
	.incbin "baserom.gba", 0x003f9fd4, 0x60

gUnknown_083FA034:: @ 83FA034
	.incbin "baserom.gba", 0x003fa034, 0x48

gUnknown_083FA07C:: @ 83FA07C
	.incbin "baserom.gba", 0x003fa07c, 0x60

gUnknown_083FA0DC:: @ 83FA0DC
	.incbin "baserom.gba", 0x003fa0dc, 0x140

gUnknown_083FA21C:: @ 83FA21C
	.incbin "baserom.gba", 0x003fa21c, 0x94

gUnknown_083FA2B0:: @ 83FA2B0
	.incbin "baserom.gba", 0x003fa2b0, 0x18

gUnknown_083FA2C8:: @ 83FA2C8
	.incbin "baserom.gba", 0x003fa2c8, 0x18

gUnknown_083FA2E0:: @ 83FA2E0
	.incbin "baserom.gba", 0x003fa2e0, 0x18

gUnknown_083FA2F8:: @ 83FA2F8
	.incbin "baserom.gba", 0x003fa2f8, 0x18

gUnknown_083FA310:: @ 83FA310
	.incbin "baserom.gba", 0x003fa310, 0xfc

gUnknown_083FA40C:: @ 83FA40C
	.incbin "baserom.gba", 0x003fa40c, 0x20

gUnknown_083FA42C:: @ 83FA42C
	obj_tiles 0x08e82140, 2048, 0x0006

gUnknown_083FA434:: @ 83FA434
	.incbin "baserom.gba", 0x003fa434, 0xd8

gUnknown_083FA50C:: @ 83FA50C
	.incbin "baserom.gba", 0x003fa50c, 0x18

gUnknown_083FA524:: @ 83FA524
	.incbin "baserom.gba", 0x003fa524, 0x9c

gUnknown_083FA5C0:: @ 83FA5C0
	.incbin "baserom.gba", 0x003fa5c0, 0x30

gUnknown_083FA5F0:: @ 83FA5F0
	.incbin "baserom.gba", 0x003fa5f0, 0x18

gUnknown_083FA608:: @ 83FA608
	.incbin "baserom.gba", 0x003fa608, 0x6

gUnknown_083FA60E:: @ 83FA60E
	.incbin "baserom.gba", 0x003fa60e, 0x8

gUnknown_083FA616:: @ 83FA616
	.incbin "baserom.gba", 0x003fa616, 0x8

gUnknown_083FA61E:: @ 83FA61E
	.incbin "baserom.gba", 0x003fa61e, 0x14

gUnknown_083FA632:: @ 83FA632
	.incbin "baserom.gba", 0x003fa632, 0x18

gUnknown_083FA64A:: @ 83FA64A
	.incbin "baserom.gba", 0x003fa64a, 0x2

gUnknown_083FA64C:: @ 83FA64C
	.incbin "baserom.gba", 0x003fa64c, 0x830

gUnknown_083FAE7C:: @ 83FAE7C
	.incbin "baserom.gba", 0x003fae7c, 0xa0

gUnknown_083FAF1C:: @ 83FAF1C
	.incbin "graphics/pokedex/cry_meter.gbapal"

gUnknown_083FAF3C:: @ 83FAF3C
	.incbin "graphics/pokedex/cry_meter.4bpp.lz"

gUnknown_083FB274:: @ 83FB274
	.incbin "baserom.gba", 0x003fb274, 0x484

gUnknown_083FB6F8:: @ 83FB6F8
	.incbin "baserom.gba", 0x003fb6f8, 0x20

gUnknown_083FB718:: @ 83FB718
	.incbin "baserom.gba", 0x003fb718, 0x20

gUnknown_083FB738:: @ 83FB738
	.incbin "baserom.gba", 0x003fb738, 0x2

gUnknown_083FB73A:: @ 83FB73A
	.incbin "baserom.gba", 0x003fb73a, 0x3a

gUnknown_083FB774:: @ 83FB774
	.incbin "baserom.gba", 0x003fb774, 0x18

gUnknown_083FB78C:: @ 83FB78C
	.incbin "baserom.gba", 0x003fb78c, 0x10

gUnknown_083FB79C:: @ 83FB79C
	.incbin "baserom.gba", 0x003fb79c, 0x27c

gUnknown_083FBA18:: @ 83FBA18
	.incbin "baserom.gba", 0x003fba18, 0x170

gUnknown_083FBB88:: @ 83FBB88
	.incbin "baserom.gba", 0x003fbb88, 0x580

gUnknown_083FC108:: @ 83FC108
	.incbin "baserom.gba", 0x003fc108, 0x240

gUnknown_083FC348:: @ 83FC348
	.incbin "baserom.gba", 0x003fc348, 0x11e0

gUnknown_083FD528:: @ 83FD528
	.incbin "baserom.gba", 0x003fd528, 0x1e0

	.align 2
gUnknown_083FD708:: @ 83FD708
	.4byte 0x0200c000

	.align 2
gUnknown_083FD70C:: @ 83FD70C
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
gUnknown_083FD750:: @ 83FD750
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
gUnknown_083FD794:: @ 83FD794
	.4byte sub_811AB88
	.4byte sub_811ABD8
	.4byte sub_811AC0C
	.4byte sub_811AC34

	.align 2
gUnknown_083FD7A4:: @ 83FD7A4
	.4byte sub_811ACEC
	.4byte sub_811AD1C
	.4byte sub_811AD80

	.align 2
gUnknown_083FD7B0:: @ 83FD7B0
	.4byte sub_811ADE4
	.4byte sub_811AE70

	.align 2
gUnknown_083FD7B8:: @ 83FD7B8
	.4byte sub_811AF7C
	.4byte sub_811B000

	.align 2
gUnknown_083FD7C0:: @ 83FD7C0
	.4byte sub_811B128
	.4byte sub_811B1D8
	.4byte sub_811B268
	.4byte sub_811B2F4
	.4byte sub_811B380
	.4byte sub_811B3EC

	.align 2
gUnknown_083FD7D8:: @ 83FD7D8
	.4byte sub_811B5B0
	.4byte sub_811B5FC
	.4byte sub_811B688

gUnknown_083FD7E4:: @ 83FD7E4
	.incbin "baserom.gba", 0x003fd7e4, 0x4

gUnknown_083FD7E8:: @ 83FD7E8
	.incbin "baserom.gba", 0x003fd7e8, 0xa

gUnknown_083FD7F2:: @ 83FD7F2
	.incbin "baserom.gba", 0x003fd7f2, 0x6

	.align 2
gUnknown_083FD7F8:: @ 83FD7F8
	.4byte sub_811B820
	.4byte sub_811B884
	.4byte sub_811B90C
	.4byte sub_811B9F0
	.4byte sub_811BA70
	.4byte sub_811BB60
	.4byte sub_811BBEC

	.align 2
gUnknown_083FD814:: @ 83FD814
	.4byte sub_811BCF4
	.4byte sub_811BD60

	.align 2
gUnknown_083FD81C:: @ 83FD81C
	.4byte sub_811BED8
	.4byte sub_811BF2C
	.4byte sub_811BFC4

	.align 2
gUnknown_083FD828:: @ 83FD828
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

gUnknown_083FD850:: @ 83FD850
	.incbin "baserom.gba", 0x003fd850, 0x6

gUnknown_083FD856:: @ 83FD856
	.incbin "baserom.gba", 0x003fd856, 0x14

gUnknown_083FD86A:: @ 83FD86A
	.incbin "baserom.gba", 0x003fd86a, 0x16

	.align 2
gUnknown_083FD880:: @ 83FD880
	.4byte sub_811C934
	.4byte sub_811C938
	.4byte sub_811C984
	.4byte sub_811C9B8
	.4byte sub_811C934
	.4byte sub_811C9E4
	.4byte sub_811C934

gUnknown_083FD89C:: @ 83FD89C
	.incbin "baserom.gba", 0x003fd89c, 0x4

gUnknown_083FD8A0:: @ 83FD8A0
	.incbin "baserom.gba", 0x003fd8a0, 0x4

	.align 2
gUnknown_083FD8A4:: @ 83FD8A4
	.4byte sub_811CA94
	.4byte sub_811CB20
	.4byte sub_811CBE8

	.align 2
gUnknown_083FD8B0:: @ 83FD8B0
	.4byte sub_811CD14
	.4byte sub_811CDA0
	.4byte sub_811CE14
	.4byte sub_811CE4C
	.4byte sub_811CEB0

gUnknown_083FD8C4:: @ 83FD8C4
	.incbin "baserom.gba", 0x003fd8c4, 0x10

	.align 2
gUnknown_083FD8D4:: @ 83FD8D4
	.4byte sub_811D0F0
	.4byte sub_811D144
	.4byte sub_811D19C

	.align 2
gUnknown_083FD8E0:: @ 83FD8E0
	.4byte sub_811D200
	.4byte sub_811D260
	.4byte sub_811D2D8
	.4byte sub_811D3B0
	.4byte sub_811D41C

gUnknown_083FD8F4:: @ 83FD8F4
	.incbin "baserom.gba", 0x003fd8f4, 0x46

gUnknown_083FD93A:: @ 83FD93A
	.incbin "baserom.gba", 0x003fd93a, 0xe

gUnknown_083FD948:: @ 83FD948
	.incbin "baserom.gba", 0x003fd948, 0x44

gUnknown_083FD98C:: @ 83FD98C
	.incbin "baserom.gba", 0x003fd98c, 0x6c

	.align 2
gFieldEffectObjectPalette10:: @ 83FD9F8
	.incbin "graphics/field_effect_objects/palettes/10.gbapal"

	.align 2
gFieldEffectObjectPaletteInfo10:: @ 83FDA18
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
gUnknown_083FDB00:: @ 83FDB00
	.4byte Unknown_83FDA20
	.4byte Unknown_83FDA40
	.4byte Unknown_83FDA60
	.4byte Unknown_83FDA80
	.4byte Unknown_83FDAA0

gUnknown_083FDB14:: @ 83FDB14
	.incbin "baserom.gba", 0x003fdb14, 0x30

gUnknown_083FDB44:: @ 83FDB44
	.incbin "baserom.gba", 0x003fdb44, 0x4b0

gUnknown_083FDFF4:: @ 83FDFF4
	.incbin "baserom.gba", 0x003fdff4, 0x500

	.include "data/text/battle_strings.s"

gUnknown_084016BC:: @ 84016BC
	.incbin "baserom.gba", 0x004016bc, 0xec

gUnknown_084017A8:: @ 84017A8
	.incbin "baserom.gba", 0x004017a8, 0x8

	.align 2
gUnknown_084017B0:: @ 84017B0
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

gUnknown_084017D8:: @ 84017D8
	.incbin "baserom.gba", 0x004017d8, 0x18

gUnknown_084017F0:: @ 84017F0
	.incbin "baserom.gba", 0x004017f0, 0x20

gUnknown_08401810:: @ 8401810
	.incbin "baserom.gba", 0x00401810, 0x10

gUnknown_08401820:: @ 8401820
	.incbin "baserom.gba", 0x00401820, 0x158

gUnknown_08401978:: @ 8401978
	.incbin "baserom.gba", 0x00401978, 0x184

gUnknown_08401AFC:: @ 8401AFC
	.incbin "baserom.gba", 0x00401afc, 0x1c4

gUnknown_08401CC0:: @ 8401CC0
	.incbin "baserom.gba", 0x00401cc0, 0x4

gUnknown_08401CC4:: @ 8401CC4
	.incbin "baserom.gba", 0x00401cc4, 0x4

gUnknown_08401CC8:: @ 8401CC8
	.incbin "baserom.gba", 0x00401cc8, 0xc

gUnknown_08401CD4:: @ 8401CD4
	.incbin "baserom.gba", 0x00401cd4, 0x24

gUnknown_08401CF8:: @ 8401CF8
	.incbin "baserom.gba", 0x00401cf8, 0x20

gUnknown_08401D18:: @ 8401D18
	.incbin "baserom.gba", 0x00401d18, 0x28

gUnknown_08401D40:: @ 8401D40
	.incbin "baserom.gba", 0x00401d40, 0x30

gUnknown_08401D70:: @ 8401D70
	.incbin "baserom.gba", 0x00401d70, 0x18

gUnknown_08401D88:: @ 8401D88
	.incbin "baserom.gba", 0x00401d88, 0x2

gUnknown_08401D8A:: @ 8401D8A
	.incbin "baserom.gba", 0x00401d8a, 0x4

gUnknown_08401D8E:: @ 8401D8E
	.incbin "baserom.gba", 0x00401d8e, 0x8

gUnknown_08401D96:: @ 8401D96
	.incbin "baserom.gba", 0x00401d96, 0x6

	.align 2
gUnknown_08401D9C:: @ 8401D9C
	.4byte sub_8123EB8
	.4byte sub_8123F44

gUnknown_08401DA4:: @ 8401DA4
	.incbin "baserom.gba", 0x00401da4, 0x70

gUnknown_08401E14:: @ 8401E14
	.incbin "baserom.gba", 0x00401e14, 0x10

gUnknown_08401E24:: @ 8401E24
	.byte 0x1E, 0x1F @ flash sectors

@ XXX: Unused? And why is this aligned?
	.align 2
	.string "タマゴ$"

gUnknown_08401E2C:: @ 8401E2C
	.incbin "baserom.gba", 0x00401e2c, 0x6

gUnknown_08401E32:: @ 8401E32
	.incbin "baserom.gba", 0x00401e32, 0x4

gUnknown_08401E36:: @ 8401E36
	.incbin "baserom.gba", 0x00401e36, 0xa

	.align 2
gUnknown_08401E40:: @ 8401E40
	.4byte sub_81275A0
	.4byte sub_81275C4

	.align 2
gUnknown_08401E48:: @ 8401E48
	.4byte sub_8127DA0
	.4byte sub_8127DD0
	.4byte sub_8127E30

gUnknown_08401E54:: @ 8401E54
	.incbin "baserom.gba", 0x00401e54, 0x6

gUnknown_08401E5A:: @ 8401E5A
	.incbin "baserom.gba", 0x00401e5a, 0x6

	.align 2
gUnknown_08401E60:: @ 8401E60
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

gUnknown_08402080:: @ 8402080
	.incbin "baserom.gba", 0x00402080, 0xE4

	.align 2
gSpriteAnim_8402164:: @ 8402164
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840217C:: @ 840217C
	.4byte gSpriteAnim_8402164

	.align 2
gBattleAnimSpriteTemplate_8402180:: @ 8402180
	spr_template 10137, 10137, gOamData_837E054, gSpriteAnimTable_840217C, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gBattleAnimSpriteTemplate_8402198:: @ 8402198
	spr_template 10016, 10016, gOamData_837DF54, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812C144

	.align 2
gBattleAnimSpriteTemplate_84021B0:: @ 84021B0
	spr_template 10017, 10017, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80794A8

	.align 2
gSpriteAnim_84021C8:: @ 84021C8
	obj_image_anim_frame 0, 40
	obj_image_anim_frame 16, 8
	obj_image_anim_frame 32, 40
	obj_image_anim_end

	.align 2
gSpriteAnimTable_84021D8:: @ 84021D8
	.4byte gSpriteAnim_84021C8

	.align 2
gBattleAnimSpriteTemplate_84021DC:: @ 84021DC
	spr_template 10190, 10190, gOamData_837DF34, gSpriteAnimTable_84021D8, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gBattleAnimSpriteTemplate_84021F4:: @ 84021F4
	spr_template 10191, 10191, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812C220

	.align 2
gBattleAnimSpriteTemplate_840220C:: @ 840220C
	spr_template 10189, 10189, gOamData_837DF94, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812C2BC

	.align 2
gSpriteAffineAnim_8402224:: @ 8402224
	obj_rot_scal_anim_frame 0x180, 0x180, 0, 0
	obj_rot_scal_anim_frame 0xFFE0, 0x18, 0, 5
	obj_rot_scal_anim_frame 0x18, 0xFFE0, 0, 5
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnim_8402244:: @ 8402244
	obj_rot_scal_anim_frame 0x30, 0x30, 0, 0
	obj_rot_scal_anim_frame 0x20, 0x20, 0, 6
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_840225C:: @ 840225C
	.4byte gSpriteAffineAnim_8402224
	.4byte gSpriteAffineAnim_8402244

	.align 2
gBattleAnimSpriteTemplate_8402264:: @ 8402264
	spr_template 10187, 10187, gOamData_837E11C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_840225C, sub_812C358

	.align 2
gBattleAnimSpriteTemplate_840227C:: @ 840227C
	spr_template 10152, 10152, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812C720

	.align 2
gSpriteAnim_8402294:: @ 8402294
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_84022AC:: @ 84022AC
	.4byte gSpriteAnim_8402294

	.align 2
gBattleAnimSpriteTemplate_84022B0:: @ 84022B0
	spr_template 10027, 10027, gOamData_837DF34, gSpriteAnimTable_84022AC, NULL, gDummySpriteAffineAnimTable, sub_812C80C

	.align 2
gSpriteAnim_84022C8:: @ 84022C8
	obj_image_anim_frame 0, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_84022D0:: @ 84022D0
	.4byte gSpriteAnim_84022C8

	.align 2
gSpriteAffineAnim_84022D4:: @ 84022D4
	obj_rot_scal_anim_frame 0xFFF9, 0xFFF9, -3, 16
	obj_rot_scal_anim_frame 0x7, 0x7, 3, 16
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_84022EC:: @ 84022EC
	.4byte gSpriteAffineAnim_84022D4

	.align 2
gBattleAnimSpriteTemplate_84022F0:: @ 84022F0
	spr_template 10228, 10228, gOamData_837DF94, gSpriteAnimTable_84022D0, NULL, gSpriteAffineAnimTable_84022EC, sub_812C848

	.align 2
gSpriteAnim_8402308:: @ 8402308
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 16, 16
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840231C:: @ 840231C
	.4byte gSpriteAnim_8402308

	.align 2
gSpriteAffineAnim_8402320:: @ 8402320
	obj_rot_scal_anim_frame 0x200, 0x200, 0, 0
	obj_rot_scal_anim_frame 0xFFE0, 0xFFE0, 0, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_8402338:: @ 8402338
	.4byte gSpriteAffineAnim_8402320

	.align 2
gBattleAnimSpriteTemplate_840233C:: @ 840233C
	spr_template 10192, 10192, gOamData_837DFF4, gSpriteAnimTable_840231C, NULL, gSpriteAffineAnimTable_8402338, sub_812C908

	.align 2
gSpriteAffineAnim_8402354:: @ 8402354
	obj_rot_scal_anim_frame 0x0, 0x180, 0, 0
	obj_rot_scal_anim_frame 0x10, 0x0, 0, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_840236C:: @ 840236C
	obj_rot_scal_anim_frame 0x140, 0x180, 0, 0
	obj_rot_scal_anim_frame 0xFFF0, 0x0, 0, 19
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_8402384:: @ 8402384
	.4byte gSpriteAffineAnim_8402354
	.4byte gSpriteAffineAnim_840236C

	.align 2
gBattleAnimSpriteTemplate_840238C:: @ 840238C
	spr_template 10227, 10227, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_8402384, sub_812C990

	.align 2
gBattleAnimSpriteTemplate_84023A4:: @ 84023A4
	spr_template 10247, 10247, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812CAFC

	.align 2
gBattleAnimSpriteTemplate_84023BC:: @ 84023BC
	spr_template 10247, 10247, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812CC28

	.align 2
gSpriteAnim_84023D4:: @ 84023D4
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 8, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_84023E4:: @ 84023E4
	.4byte gSpriteAnim_84023D4

	.align 2
gBattleAnimSpriteTemplate_84023E8:: @ 84023E8
	spr_template 10229, 10229, gOamData_837DF54, gSpriteAnimTable_84023E4, NULL, gDummySpriteAffineAnimTable, sub_812CCE8

	.align 2
gUnknown_08402400:: @ 8402400
	.incbin "baserom.gba", 0x00402400, 0x20

	.align 2
gSpriteAnim_8402420:: @ 8402420
	obj_image_anim_frame 0, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402428:: @ 8402428
	.4byte gSpriteAnim_8402420

	.align 2
gSpriteAffineAnim_840242C:: @ 840242C
	obj_rot_scal_anim_frame 0x0, 0x0, 5, 40
	obj_rot_scal_anim_frame 0x0, 0x0, 10, 10
	obj_rot_scal_anim_frame 0x0, 0x0, 15, 10
	obj_rot_scal_anim_frame 0x0, 0x0, 20, 40
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_8402454:: @ 8402454
	.4byte gSpriteAffineAnim_840242C

	.align 2
gBattleAnimSpriteTemplate_8402458:: @ 8402458
	spr_template 10230, 10230, gOamData_837DFFC, gSpriteAnimTable_8402428, NULL, gSpriteAffineAnimTable_8402454, sub_812D294

	.align 2
gSpriteAnim_8402470:: @ 8402470
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 32, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_loop 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402494:: @ 8402494
	.4byte gSpriteAnim_8402470

	.align 2
gBattleAnimSpriteTemplate_8402498:: @ 8402498
	spr_template 10234, 10234, gOamData_837DF34, gSpriteAnimTable_8402494, NULL, gDummySpriteAffineAnimTable, sub_80793C4

	.align 2
gUnknown_084024B0:: @ 84024B0
	.incbin "baserom.gba", 0x004024b0, 0x20

	.align 2
gBattleAnimSpriteTemplate_84024D0:: @ 84024D0
	spr_template 10226, 10226, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812D3AC

	.align 2
gBattleAnimSpriteTemplate_84024E8:: @ 84024E8
	spr_template 10233, 10233, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812D4B4

	.align 2
gUnknown_08402500:: @ 8402500
	.incbin "baserom.gba", 0x00402500, 0x18

	.align 2
gUnknown_08402518:: @ 8402518
	.incbin "baserom.gba", 0x00402518, 0x28

	.align 2
gUnknown_08402540:: @ 8402540
	.incbin "baserom.gba", 0x00402540, 0x38

	.align 2
gBattleAnimSpriteTemplate_8402578:: @ 8402578
	spr_template 10236, 10236, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812D724

	.align 2
gUnknown_08402590:: @ 8402590
	.incbin "baserom.gba", 0x00402590, 0x30

	.align 2
gUnknown_084025C0:: @ 84025C0
	.incbin "baserom.gba", 0x004025c0, 0x4

	.align 2
gSpriteAnim_84025C4:: @ 84025C4
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 4, 6
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_84025D0:: @ 84025D0
	obj_image_anim_frame 8, 6
	obj_image_anim_end

	.align 2
gSpriteAnim_84025D8:: @ 84025D8
	obj_image_anim_frame 12, 6
	obj_image_anim_end

	.align 2
gSpriteAnimTable_84025E0:: @ 84025E0
	.4byte gSpriteAnim_84025C4
	.4byte gSpriteAnim_84025D0
	.4byte gSpriteAnim_84025D8

	.align 2
gBattleAnimSpriteTemplate_84025EC:: @ 84025EC
	spr_template 10241, 10241, gOamData_837DF2C, gSpriteAnimTable_84025E0, NULL, gDummySpriteAffineAnimTable, sub_812DEAC

	.align 2
gUnknown_08402604:: @ 8402604
	.incbin "baserom.gba", 0x00402604, 0x4

gUnknown_08402608:: @ 8402608
	.incbin "baserom.gba", 0x00402608, 0x8

gUnknown_08402610:: @ 8402610
	.incbin "baserom.gba", 0x00402610, 0x20

	.align 2
gBattleAnimSpriteTemplate_8402630:: @ 8402630
	spr_template 10087, 10087, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812E4F0

	.align 2
gSpriteAnim_8402648:: @ 8402648
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 3, 8, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 2, 8, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 1, 8, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_840266C:: @ 840266C
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 1, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 2, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 3, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 3, 8, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 2, 8, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 1, 8, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_8402690:: @ 8402690
	obj_image_anim_frame 0, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402698:: @ 8402698
	.4byte gSpriteAnim_8402648
	.4byte gSpriteAnim_840266C
	.4byte gSpriteAnim_8402690

	.align 2
gBattleAnimSpriteTemplate_84026A4:: @ 84026A4
	spr_template 10238, 10238, gOamData_837DF24, gSpriteAnimTable_8402698, NULL, gDummySpriteAffineAnimTable, sub_812E7A0

	.align 2
	.incbin "baserom.gba", 0x4026bc, 0x20

	.align 2
gSpriteAnim_84026DC:: @ 84026DC
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 4, 9
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_84026EC:: @ 84026EC
	.4byte gSpriteAnim_84026DC

	.align 2
gBattleAnimSpriteTemplate_84026F0:: @ 84026F0
	spr_template 10239, 10239, gOamData_837DF2C, gSpriteAnimTable_84026EC, NULL, gDummySpriteAffineAnimTable, sub_812EA4C

	.align 2
gBattleAnimSpriteTemplate_8402708:: @ 8402708
	spr_template 10240, 10240, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812EC78

	.align 2
gBattleAnimSpriteTemplate_8402720:: @ 8402720
	spr_template 10227, 10227, gOamData_837DFFC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_8402384, sub_812ED84

	.align 2
gBattleAnimSpriteTemplate_8402738:: @ 8402738
	spr_template 10236, 10236, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812EEA4

	.align 2
gUnknown_08402750:: @ 8402750
	.incbin "baserom.gba", 0x00402750, 0x30

	.align 2
gSpriteAffineAnim_8402780:: @ 8402780
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 8
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 8
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_84027A0:: @ 84027A0
	obj_rot_scal_anim_frame 0xC0, 0xC0, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 8
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 8
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_84027C0:: @ 84027C0
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x8, 0x8, 0, 8
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF8, 0, 8
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_84027E0:: @ 84027E0
	.4byte gSpriteAffineAnim_8402780
	.4byte gSpriteAffineAnim_84027A0
	.4byte gSpriteAffineAnim_84027C0

	.align 2
gBattleAnimSpriteTemplate_84027EC:: @ 84027EC
	spr_template 10242, 10242, gOamData_837DF94, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_84027E0, sub_812F88C

	.align 2
gSpriteAffineAnim_8402804:: @ 8402804
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFA, 0, 16
	obj_rot_scal_anim_frame 0x4, 0x6, 0, 16
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_8402824:: @ 8402824
	obj_rot_scal_anim_frame 0xC0, 0xC0, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x6, 0, 16
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFA, 0, 16
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_8402844:: @ 8402844
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x6, 0, 16
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFA, 0, 16
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_8402864:: @ 8402864
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x8, 0xA, 0, 30
	obj_rot_scal_anim_frame 0xFFF8, 0xFFF6, 0, 16
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_8402884:: @ 8402884
	.4byte gSpriteAffineAnim_8402804
	.4byte gSpriteAffineAnim_8402824
	.4byte gSpriteAffineAnim_8402844
	.4byte gSpriteAffineAnim_8402864

	.align 2
gBattleAnimSpriteTemplate_8402894:: @ 8402894
	spr_template 10242, 10242, gOamData_837DFF4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_8402884, sub_812F948

	.align 2
gUnknown_084028AC:: @ 84028AC
	.incbin "baserom.gba", 0x004028ac, 0x20

gUnknown_084028CC:: @ 84028CC
	.incbin "baserom.gba", 0x004028cc, 0x18

gUnknown_084028E4:: @ 84028E4
	.incbin "baserom.gba", 0x004028e4, 0x30

	.align 2
gSpriteAnim_8402914:: @ 8402914
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_8402920:: @ 8402920
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_840292C:: @ 840292C
	.4byte gSpriteAnim_8402914
	.4byte gSpriteAnim_8402920

	.align 2
gBattleAnimSpriteTemplate_8402934:: @ 8402934
	spr_template 10053, 10053, gOamData_837DF34, gSpriteAnimTable_840292C, NULL, gDummySpriteAffineAnimTable, sub_81300F4

	.align 2
gUnknown_0840294C:: @ 840294C
	.incbin "baserom.gba", 0x0040294c, 0x18

	.align 2
gBattleAnimSpriteTemplate_8402964:: @ 8402964
	spr_template 10252, 10252, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_813051C

	.align 2
	.incbin "baserom.gba", 0x40297c, 0x30

gUnknown_084029AC:: @ 84029AC
	.incbin "baserom.gba", 0x004029ac, 0x18

	.align 2
gBattleAnimSpriteTemplate_84029C4:: @ 84029C4
	spr_template 10247, 10247, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_81307B0

	.align 2
gUnknown_084029DC:: @ 84029DC
	.incbin "baserom.gba", 0x004029dc, 0x18

	.align 2
gBattleAnimSpriteTemplate_84029F4:: @ 84029F4
	spr_template 10255, 10255, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8130A2C

	.align 2
gBattleAnimSpriteTemplate_8402A0C:: @ 8402A0C
	spr_template 10247, 10247, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8130AEC

	.align 2
gBattleAnimSpriteTemplate_8402A24:: @ 8402A24
	spr_template 10258, 10258, gOamData_837E054, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8130F5C

	.align 2
gBattleAnimSpriteTemplate_8402A3C:: @ 8402A3C
	spr_template 10233, 10233, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8131264

	.align 2
	.incbin "baserom.gba", 0x402a54, 0x18

	.align 2
gBattleAnimSpriteTemplate_8402A6C:: @ 8402A6C
	spr_template 10250, 10250, gOamData_837DF3C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8131564

	.align 2
	.incbin "baserom.gba", 0x402a84, 0x18

	.align 2
gSpriteAnim_8402A9C:: @ 8402A9C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402AA8:: @ 8402AA8
	.4byte gSpriteAnim_8402A9C

	.align 2
gSpriteAffineAnim_8402AAC:: @ 8402AAC
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8402AC4:: @ 8402AC4
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_8402ADC:: @ 8402ADC
	.4byte gSpriteAffineAnim_8402AAC
	.4byte gSpriteAffineAnim_8402AC4

	.align 2
gBattleAnimSpriteTemplate_8402AE4:: @ 8402AE4
	spr_template 10277, 10277, gOamData_837DF9C, gSpriteAnimTable_8402AA8, NULL, gSpriteAffineAnimTable_8402ADC, sub_8132370

	.align 2
gSpriteAffineAnim_8402AFC:: @ 8402AFC
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 64
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_8402B0C:: @ 8402B0C
	.4byte gSpriteAffineAnim_8402AFC

	.align 2
gBattleAnimSpriteTemplate_8402B10:: @ 8402B10
	spr_template 10278, 10278, gOamData_837E0BC, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_8402B0C, sub_81323E0

	.align 2
gUnknown_08402B28:: @ 8402B28
	.incbin "baserom.gba", 0x00402b28, 0x1d0

gUnknown_08402CF8:: @ 8402CF8
	.incbin "baserom.gba", 0x00402cf8, 0x10

gUnknown_08402D08:: @ 8402D08
	.incbin "baserom.gba", 0x00402d08, 0x78

gUnknown_08402D80:: @ 8402D80
	obj_tiles 0x08402b78, 384, 0x1595

gUnknown_08402D88:: @ 8402D88
	obj_pal 0x08402b58, 0x1596

gUnknown_08402D90:: @ 8402D90
	.incbin "baserom.gba", 0x00402d90, 0x30

gUnknown_08402DC0:: @ 8402DC0
	.incbin "baserom.gba", 0x00402dc0, 0x48

gUnknown_08402E08:: @ 8402E08
	.incbin "baserom.gba", 0x00402e08, 0x1c

gUnknown_08402E24:: @ 8402E24
	.incbin "baserom.gba", 0x00402e24, 0x15

gUnknown_08402E39:: @ 8402E39
	.incbin "baserom.gba", 0x00402e39, 0x4

gUnknown_08402E3D:: @ 8402E3D
	.incbin "baserom.gba", 0x00402e3d, 0x3

gUnknown_08402E40:: @ 8402E40
	.incbin "baserom.gba", 0x00402e40, 0x40

gUnknown_08402E80:: @ 8402E80
	.incbin "baserom.gba", 0x00402e80, 0x80

@ 8402F00
	.include "data/battle_tower/trainers.s"

@ 8403860
	.include "data/battle_tower/held_items.s"

@ 84038E0
	.include "data/battle_tower/level_50_mons.s"

@ 8404BA0
	.include "data/battle_tower/level_100_mons.s"

gUnknown_08405E60:: @ 8405E60
	.incbin "baserom.gba", 0x00405e60, 0x1e

gUnknown_08405E7E:: @ 8405E7E
	.incbin "baserom.gba", 0x00405e7e, 0x14

gUnknown_08405E92:: @ 8405E92
	.incbin "baserom.gba", 0x00405e92, 0x1e

gUnknown_08405EB0:: @ 8405EB0
	.incbin "baserom.gba", 0x00405eb0, 0x14

gUnknown_08405EC4:: @ 8405EC4
	.incbin "baserom.gba", 0x00405ec4, 0x16

gUnknown_08405EDA:: @ 8405EDA
	.incbin "baserom.gba", 0x00405eda, 0xc

gUnknown_08405EE6:: @ 8405EE6
	.incbin "baserom.gba", 0x00405ee6, 0x232

gUnknown_08406118:: @ 8406118
	.incbin "baserom.gba", 0x00406118, 0x14

gUnknown_0840612C:: @ 840612C
	obj_pal 0x02030400, 0x0001

	.align 2
gUnknown_08406134:: @ 8406134
	.4byte OtherText_Coolness
	.4byte OtherText_Toughness
	.4byte OtherText_Smartness
	.4byte OtherText_Cuteness
	.4byte OtherText_Beauty

gUnknown_08406148:: @ 8406148
	obj_pal 0x08405f18, 0x0200

gUnknown_08406150:: @ 8406150
	obj_pal 0x08405ef8, 0x0000

gUnknown_08406158:: @ 8406158
	.incbin "baserom.gba", 0x00406158, 0x34

gUnknown_0840618C:: @ 840618C
	.incbin "baserom.gba", 0x0040618c, 0x18

	.align 2
gUnknown_084061A4:: @ 84061A4
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
gUnknown_08406288:: @ 8406288
	.4byte PCText_TakeOutItems
	.4byte PCText_StoreItems
	.4byte PCText_ThrowAwayItems
	.4byte MenuText_GoBackToPrev

	.align 2
gUnknown_08406298:: @ 8406298
	.4byte SecretBaseText_ItemStorage
	.4byte sub_8139E40
	.4byte PCText_Mailbox
	.4byte sub_8139E6C
	.4byte SecretBaseText_Decoration
	.4byte sub_8139ED8
	.4byte SecretBaseText_TurnOff
	.4byte sub_8139EF8

gUnknown_084062B8:: @ 84062B8
	.incbin "baserom.gba", 0x004062b8, 0x4

gUnknown_084062BC:: @ 84062BC
	.incbin "baserom.gba", 0x004062bc, 0x4

	.align 2
gUnknown_084062C0:: @ 84062C0
	.4byte PCText_WithdrawItem
	.4byte sub_813A118
	.4byte PCText_DepositItem
	.4byte sub_813A0A0
	.4byte PCText_TossItem
	.4byte sub_813A198
	.4byte UnknownText_Exit
	.4byte sub_813A21C

	.align 2
gUnknown_084062E0:: @ 84062E0
	.4byte sub_813A83C
	.4byte sub_813A878

	.align 2
gUnknown_084062E8:: @ 84062E8
	.4byte sub_813B578
	.4byte sub_813B610

gUnknown_084062F0:: @ 84062F0
	.incbin "baserom.gba", 0x004062f0, 0x8

	.align 2
gUnknown_084062F8:: @ 84062F8
	.4byte OtherText_Read
	.4byte sub_813B428
	.4byte OtherText_MoveToBag
	.4byte sub_813B510
	.4byte OtherText_Give
	.4byte sub_813B630
	.4byte OtherText_Cancel2
	.4byte sub_813B734

gUnknown_08406318:: @ 8406318
	.incbin "baserom.gba", 0x00406318, 0x6

gUnknown_0840631E:: @ 840631E
	.incbin "baserom.gba", 0x0040631e, 0x9

gUnknown_08406327:: @ 8406327
	.incbin "baserom.gba", 0x00406327, 0x3

gUnknown_0840632A:: @ 840632A
	.incbin "baserom.gba", 0x0040632a, 0x6

gUnknown_08406330:: @ 8406330
	.incbin "baserom.gba", 0x00406330, 0x4

gUnknown_08406334:: @ 8406334
	.incbin "baserom.gba", 0x00406334, 0x6

gUnknown_0840633A:: @ 840633A
	.incbin "baserom.gba", 0x0040633a, 0x46
	.incbin "graphics/intro/intro.4bpp.lz"

gUnknown_08406974:: @ 8406974
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

gUnknown_08406B74:: @ 8406B74
	.incbin "baserom.gba", 0x00406b74, 0x3b4

gUnknown_08406F28:: @ 8406F28
	.incbin "baserom.gba", 0x00406f28, 0x334

gUnknown_0840725C:: @ 840725C
	.incbin "baserom.gba", 0x0040725c, 0x2f0

gUnknown_0840754C:: @ 840754C
	.incbin "baserom.gba", 0x0040754c, 0x218

gUnknown_08407764:: @ 8407764
@ replacing .incbin "baserom.gba", 0x00407764, 0x2170
	.incbin "graphics/intro/introgfx.4bpp.lz"

gUnknown_084098D4:: @ 84098D4
	.incbin "graphics/intro/intro3_pokeball.gbapal"

gUnknown_08409AD4:: @ 8409AD4
	.incbin "baserom.gba", 0x00409ad4, 0x130

gUnknown_08409C04:: @ 8409C04
	.incbin "graphics/intro/intro3_pokeball.8bpp.lz"

gUnknown_0840A758:: @ 840A758
	.incbin "baserom.gba", 0x0040a758, 0x20

gUnknown_0840A778:: @ 840A778
	.incbin "baserom.gba", 0x0040a778, 0x6c

gUnknown_0840A7E4:: @ 840A7E4
	.incbin "baserom.gba", 0x0040a7e4, 0x13c
	.incbin "graphics/intro/intro3_misc1.gbapal"
	.incbin "graphics/intro/intro3_misc2.gbapal"
	.incbin "graphics/intro/intro3_misc.4bpp.lz"
	.incbin "graphics/intro/intro1_eon.gbapal"
	.incbin "graphics/intro/intro1_eon.4bpp.lz"
	.incbin "baserom.gba", 0x0040ADE8, 0x38

gUnknown_0840AE20:: @ 840AE20
	.incbin "baserom.gba", 0x0040ae20, 0x60

gUnknown_0840AE80:: @ 840AE80
	.incbin "baserom.gba", 0x0040ae80, 0xd0

gUnknown_0840AF50:: @ 840AF50
	.incbin "baserom.gba", 0x0040af50, 0x24

gUnknown_0840AF74:: @ 840AF74
	.incbin "baserom.gba", 0x0040af74, 0x20

gUnknown_0840AF94:: @ 840AF94
	.incbin "baserom.gba", 0x0040af94, 0x18

gUnknown_0840AFAC:: @ 840AFAC
	.incbin "baserom.gba", 0x0040afac, 0x18

gUnknown_0840AFC4:: @ 840AFC4
	.incbin "baserom.gba", 0x0040afc4, 0x2c

gUnknown_0840AFF0:: @ 840AFF0
	.incbin "baserom.gba", 0x0040aff0, 0x18

gUnknown_0840B008:: @ 840B008
	.incbin "baserom.gba", 0x0040b008, 0x10

gUnknown_0840B018:: @ 840B018
	.incbin "baserom.gba", 0x0040b018, 0x10

gUnknown_0840B028:: @ 840B028
	.incbin "baserom.gba", 0x0040b028, 0x3c

gUnknown_0840B064:: @ 840B064
	.incbin "baserom.gba", 0x0040b064, 0x20

gUnknown_0840B084:: @ 840B084
	.incbin "baserom.gba", 0x0040b084, 0x2c

gUnknown_0840B0B0:: @ 840B0B0
	.incbin "baserom.gba", 0x0040b0b0, 0x2c

gUnknown_0840B0DC:: @ 840B0DC
	.incbin "baserom.gba", 0x0040b0dc, 0x18

gUnknown_0840B0F4:: @ 840B0F4
	.incbin "baserom.gba", 0x0040b0f4, 0x30

gUnknown_0840B124:: @ 840B124
	.incbin "baserom.gba", 0x0040b124, 0x2c

gUnknown_0840B150:: @ 840B150
	.incbin "baserom.gba", 0x0040b150, 0x18

gUnknown_0840B168:: @ 840B168
	.incbin "baserom.gba", 0x0040b168, 0x8

gUnknown_0840B170:: @ 840B170
	.incbin "baserom.gba", 0x0040b170, 0x18

gUnknown_0840B188:: @ 840B188
	.incbin "baserom.gba", 0x0040b188, 0x28

gUnknown_0840B1B0:: @ 840B1B0
	.incbin "baserom.gba", 0x0040b1b0, 0x18

gUnknown_0840B1C8:: @ 840B1C8
	.incbin "baserom.gba", 0x0040b1c8, 0x2c

gUnknown_0840B1F4:: @ 840B1F4
	.incbin "baserom.gba", 0x0040b1f4, 0x18

gUnknown_0840B20C:: @ 840B20C
	.incbin "baserom.gba", 0x0040b20c, 0x10

gUnknown_0840B21C:: @ 840B21C
	.incbin "baserom.gba", 0x0040b21c, 0x10

gUnknown_0840B22C:: @ 840B22C
	.incbin "baserom.gba", 0x0040b22c, 0x10

gUnknown_0840B23C:: @ 840B23C
	.incbin "baserom.gba", 0x0040b23c, 0x1c

gUnknown_0840B258:: @ 840B258
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

gUnknown_0840B2B8:: @ 840B2B8
	.incbin "baserom.gba", 0x0040b2b8, 0xc0

gUnknown_0840B378:: @ 840B378
	.incbin "baserom.gba", 0x0040b378, 0xc

	.align 2
gUnknown_0840B384:: @ 840B384
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

gUnknown_0840B3B4:: @ 840B3B4
	.incbin "baserom.gba", 0x0040b3b4, 0x120

gUnknown_0840B4D4:: @ 840B4D4
	.incbin "baserom.gba", 0x0040b4d4, 0x28

	.align 2
gBattleAnimSpriteTemplate_840B4FC:: @ 840B4FC
	spr_template 10269, 10269, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8141C30

	.align 2
gUnknown_0840B514:: @ 840B514
	.incbin "baserom.gba", 0x0040b514, 0x10

gUnknown_0840B524:: @ 840B524
	.incbin "baserom.gba", 0x0040b524, 0x10

gUnknown_0840B534:: @ 840B534
	.incbin "baserom.gba", 0x0040b534, 0x6

gUnknown_0840B53A:: @ 840B53A
	.incbin "baserom.gba", 0x0040b53a, 0x2a

gUnknown_0840B564:: @ 840B564
	.incbin "baserom.gba", 0x0040b564, 0x6

gUnknown_0840B56A:: @ 840B56A
	.incbin "baserom.gba", 0x0040b56a, 0x12

gUnknown_0840B57C:: @ 840B57C
	.incbin "baserom.gba", 0x0040b57c, 0x24

gUnknown_0840B5A0:: @ 840B5A0
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
gUnknown_0840B69C:: @ 840B69C
	.4byte Unknown_840B5BC
	.4byte Unknown_840B5DC
	.4byte Unknown_840B5FC
	.4byte Unknown_840B61C
	.4byte Unknown_840B63C
	.4byte Unknown_840B65C
	.4byte Unknown_840B67C

gUnknown_0840B6B8:: @ 840B6B8
	.incbin "baserom.gba", 0x0040b6b8, 0xec

gUnknown_0840B7A4:: @ 840B7A4
	.incbin "baserom.gba", 0x0040b7a4, 0x18

gUnknown_0840B7BC:: @ 840B7BC
	.incbin "baserom.gba", 0x0040b7bc, 0x40

gUnknown_0840B7FC:: @ 840B7FC
	.incbin "baserom.gba", 0x0040b7fc, 0x40

gUnknown_0840B83C:: @ 840B83C
	.incbin "baserom.gba", 0x0040b83c, 0xf

gUnknown_0840B84B:: @ 840B84B
	.incbin "baserom.gba", 0x0040b84b, 0xf

gUnknown_0840B85A:: @ 840B85A
	.incbin "baserom.gba", 0x0040b85a, 0xf

gUnknown_0840B869:: @ 840B869
	.incbin "baserom.gba", 0x0040b869, 0xf

gUnknown_0840B878::
	.incbin "baserom.gba", 0x0040B878, 0xF @ unknown

	.include "data/text/credits.s"

gUnknown_0840C5F0:: @ 840C5F0
	.incbin "baserom.gba", 0x0040c5f0, 0x410 @ pointer table to something

gUnknown_0840CA00:: @ 840CA00
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
gUnknown_0840CA54:: @ 840CA54
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
gUnknown_0840CA94:: @ 840CA94
	.4byte Unknown_840CA64
	.4byte Unknown_840CA78
	.4byte Unknown_840CA8C

gUnknown_0840CAA0:: @ 840CAA0
	.incbin "baserom.gba", 0x0040caa0, 0x10

gUnknown_0840CAB0:: @ 840CAB0
	.incbin "baserom.gba", 0x0040cab0, 0x3c

gUnknown_0840CAEC:: @ 840CAEC
	.incbin "baserom.gba", 0x0040caec, 0x18

gUnknown_0840CB04:: @ 840CB04
	.incbin "baserom.gba", 0x0040cb04, 0x8

gUnknown_0840CB0C:: @ 840CB0C
	.incbin "graphics/misc/diploma.gbapal"
	.incbin "baserom.gba", 0x0040cb2c, 0x20

gUnknown_0840CB4C:: @ 840CB4C
	.incbin "baserom.gba", 0x0040cb4c, 0x73c

gUnknown_0840D288:: @ 840D288
	.incbin "graphics/misc/diploma.4bpp.lz"

gExpandedPlaceholder_Empty:: @ 840DC80
	.string "$"

gExpandedPlaceholder_Kun:: @ 840DC81
	.string "$"

gExpandedPlaceholder_Chan:: @ 840DC82
	.string "$"

gExpandedPlaceholder_Sapphire:: @ 840DC83
	.string "SAPPHIRE$"

gExpandedPlaceholder_Ruby:: @ 840DC8C
	.string "RUBY$"

gExpandedPlaceholder_Aqua:: @ 840DC91
	.string "AQUA$"

gExpandedPlaceholder_Magma:: @ 840DC96
	.string "MAGMA$"

gExpandedPlaceholder_Archie:: @ 840DC9C
	.string "ARCHIE$"

gExpandedPlaceholder_Maxie:: @ 840DCA3
	.string "MAXIE$"

gExpandedPlaceholder_Kyogre:: @ 840DCA9
	.string "KYOGRE$"

gExpandedPlaceholder_Groudon:: @ 840DCB0
	.string "GROUDON$"

gExpandedPlaceholder_Brendan:: @ 840DCB8
	.string "BRENDAN$"

gExpandedPlaceholder_May:: @ 840DCC0
	.string "MAY$"

gUnknown_0840DCC4:: @ 840DCC4
SystemText_Egg:
	.string "EGG$"

gUnknown_0840DCC8:: @ 840DCC8
SystemText_Pokemon2:
	.string "POKéMON$"

gUnknown_0840DCD0:: @ 840DCD0
SystemText_NewGame:
	.string "NEW GAME$"

gUnknown_0840DCD9:: @ 840DCD9
SystemText_Continue:
	.string "CONTINUE$"

gUnknown_0840DCE2:: @ 840DCE2
SystemText_Option2:
	.string "OPTION$"

gUnknown_0840DCE9:: @ 840DCE9
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

gUnknown_0840DE81:: @ 840DE81
SystemText_SaveCorrupt:
	.string "The save file is corrupt. The\nprevious save file will be loaded.$"

gUnknown_0840DEC2:: @ 840DEC2
SystemText_SaveDeleted:
	.string " The save file has been deleted...$" @ there's a blank spot at the beginning of this string. No idea why.

gUnknown_0840DEE5:: @ 840DEE5
SystemText_1MSubCircuitNotInstalled:
	.string "The 1M sub-circuit board is\nnot installed.$"

gUnknown_0840DF10:: @ 840DF10
SystemText_InternalBatteryIsDry:
	.string "The internal battery has run dry.\nThe game can be played.\pHowever, clock-based events will\nno longer occur.$"

gUnknown_0840DF7C:: @ 840DF7C
SystemText_Player2:
	.string "PLAYER$"

gUnknown_0840DF83:: @ 840DF83
SystemText_Pokedex2:
	.string "POKéDEX$"

gUnknown_0840DF8B:: @ 840DF8B
SystemText_Time:
	.string "TIME$"

gUnknown_0840DF90:: @ 840DF90
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

gUnknown_0840DFF7:: @ 840DFF7
SystemText_NewPara:
	.string "\p$"

gUnknown_0840DFF9:: @ 840DFF9
DexText_UnknownPoke:
	.string "            ????? POKéMON$" @ why 12 spaces?

gUnknown_0840E013:: @ 840E013
	.incbin "baserom.gba", 0x0040e013, 0xa @ unknown size of dummy pokemon

gUnknown_0840E01D:: @ 840E01D
DexText_UnknownWeight:
	.string "????.? lbs.$"
DexText_Terminator4:
	.string "$"

gUnknown_0840E02A:: @ 840E02A
	.incbin "baserom.gba", 0x0040e02a, 0xb @ unknown cry of dummy pokemon

gUnknown_0840E035:: @ 840E035
DexText_SizeComparedTo:
	.string "SIZE COMPARED TO $"

gUnknown_0840E047:: @ 840E047
DexText_RegisterComplete:
	.string "POKéDEX registration completed.$"

gUnknown_0840E067:: @ 840E067
DexText_Searching:
	.string "Searching...\nPlease wait.$"

gUnknown_0840E081:: @ 840E081
DexText_SearchComplete:
	.string "Search completed.$"

gUnknown_0840E093:: @ 840E093
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

gUnknown_0840E44F:: @ 840E44F
MenuText_WelcomeToHOF:
	.string "Welcome to the HALL OF FAME!$"
MenuText_HOFDexRate:
	.string "Spotted POKéMON: {STR_VAR_1}!\nOwned POKéMON: {STR_VAR_2}!\pPROF. BIRCH’s POKéDEX rating!\pPROF. BIRCH: Let’s see...\p$"

gUnknown_0840E4CD:: @ 840E4CD
MenuText_HOFSaving:
	.string "SAVING...\nDON’T TURN OFF THE POWER.$"

gUnknown_0840E4F1:: @ 840E4F1
MenuText_HOFCorrupt:
	.string "The HALL OF FAME data is corrupt.$"

gUnknown_0840E513:: @ 840E513
MenuText_HOFNumber:
	.string "HALL OF FAME No. $"

gUnknown_0840E525:: @ 840E525
MenuText_HOFCongratulations:
	.string "LEAGUE CHAMPION!\nCONGRATULATIONS!$"

gUnknown_0840E547:: @ 840E547
OtherText_Number2:
	.string "No. $"

gUnknown_0840E54C:: @ 840E54C
OtherText_Level3:
	.string "Lv. $"

gUnknown_0840E551:: @ 840E551
OtherText_IDNumber:
	.string "IDNo. /$"

gUnknown_0840E559:: @ 840E559
OtherText_Name:
	.string "NAME /$"

gUnknown_0840E560:: @ 840E560
OtherText_IDNumber2:
	.string "IDNo. /$" @ identical string for no reason?

gUnknown_0840E568:: @ 840E568
OtherText_BirchInTrouble:
	.string "{HIGHLIGHT WHITE2}{COLOR DARK_GREY}PROF. BIRCH is in trouble!\nRelease a POKéMON and rescue him!$"

gUnknown_0840E5AB:: @ 840E5AB
OtherText_DoYouChoosePoke:
	.string "{HIGHLIGHT WHITE2}{COLOR DARK_GREY}Do you choose this POKéMON?$"

gUnknown_0840E5CD:: @ 840E5CD
OtherText_Poke:
	.string "POKéMON$"

gUnknown_0840E5D5:: @ 840E5D5
SystemText_SaveErrorExchangeBackup:
	.string "Save error.\pPlease exchange the\nbackup memory.$"

gUnknown_0840E604:: @ 840E604
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

gUnknown_0840E63B:: @ 840E63B
OtherText_Walk:
	.string "WALK$"

gUnknown_0840E640:: @ 840E640
UnknownText_Exit:
	.string "EXIT$"

gUnknown_0840E645:: @ 840E645
OtherText_Cancel2:
	.string "CANCEL$"

gUnknown_0840E64C:: @ 840E64C
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

gUnknown_0840E669:: @ 840E669
OtherText_Check:
	.string "CHECK$"

gUnknown_0840E66F:: @ 840E66F
OtherText_None:
	.string "NONE$"

gUnknown_0840E674:: @ 840E674
OtherText_ThreeQuestions2:
	.string "???$"

gUnknown_0840E678:: @ 840E678
OtherText_FiveQuestions:
	.string "?????$"
OtherText_Backslash:
	.string "/$"

gUnknown_0840E680:: @ 840E680
OtherText_OneDash:
	.string "-$"

gUnknown_0840E682:: @ 840E682
OtherText_TwoDashes:
	.string "--$"

gUnknown_0840E685:: @ 840E685
OtherText_ThreeDashes2:
	.string "---$"

gUnknown_0840E689:: @ 840E689
OtherText_MaleSymbol2:
	.string "♂$"

gUnknown_0840E68B:: @ 840E68B
OtherText_FemaleSymbol2:
	.string "♀$"
OtherText_Level2:
	.string "Lv.$"

gUnknown_0840E691:: @ 840E691
OtherText_TallPlus:
	.string "{TALL_PLUS}$"
OtherText_RightArrow:
	.string "{RIGHT_ARROW}$"

gUnknown_0840E697:: @ 840E697
MenuText_GoBackToPrev:
	.string "Go back to the\nprevious menu.$"

gUnknown_0840E6B5:: @ 840E6B5
OtherText_WhatWillYouDo:
	.string "What would you like to do?$"

gUnknown_0840E6D0:: @ 840E6D0
OtherText_xString1:
	.string "×{STR_VAR_1}$"

gUnknown_0840E6D4:: @ 840E6D4
OtherText_Berry2:
	.string " BERRY$"

gUnknown_0840E6DB:: @ 840E6DB
OtherText_Coins2:
	.string "{STR_VAR_1} COINS$"

gUnknown_0840E6E4:: @ 840E6E4
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
gUnknown_0840E740:: @ 840E740
	.4byte OtherText_TheField3
	.4byte OtherText_TheBattle
	.4byte OtherText_ThePokeList
	.4byte OtherText_TheShop
	.4byte OtherText_TheField
	.4byte OtherText_TheField2
	.4byte OtherText_ThePC

gUnknown_0840E75C:: @ 840E75C
OtherText_ReturnTo:
	.string "Return to$"

gUnknown_0840E766:: @ 840E766
OtherText_WhatWillYouDo2:
	.string "What would you\nlike to do?$"

gUnknown_0840E781:: @ 840E781
OtherText_CantWriteMail:
	.string "You can’t write\nMAIL here.$"

gUnknown_0840E79C:: @ 840E79C
OtherText_NoPokemon:
	.string "There is no\nPOKéMON.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840E7B3:: @ 840E7B3
OtherText_SwitchWhichItem:
	.string "Switch with which\nitem?$"

gUnknown_0840E7CB:: @ 840E7CB
OtherText_CantBeHeld:
	.string "{STR_VAR_1} can’t be held.$"

gUnknown_0840E7DD:: @ 840E7DD
OtherText_CantBeHeldHere:
	.string "{STR_VAR_1} can’t be held here.$"

gUnknown_0840E7F4:: @ 840E7F4
OtherText_HowManyToDeposit:
	.string "How many do you\nwant to deposit?$"

gUnknown_0840E815:: @ 840E815
OtherText_DepositedItems:
	.string "Deposited {STR_VAR_2}\n{STR_VAR_1}(s).$"

gUnknown_0840E829:: @ 840E829
OtherText_NoRoomForItems:
	.string "There’s no room to\nstore items.$"

gUnknown_0840E849:: @ 840E849
OtherText_CantStoreSomeoneItem:
	.string "You can’t store\nsomeone else’s item\nin the PC.$"

gUnknown_0840E878:: @ 840E878
OtherText_TooImportant:
	.string "That’s much too\nimportant to toss\nout!$"

gUnknown_0840E89F:: @ 840E89F
OtherText_HowManyToToss:
	.string "Toss out how many?$"

gUnknown_0840E8B2:: @ 840E8B2
OtherText_ThrewAwayItem:
	.string "Threw away {STR_VAR_2}\n{STR_VAR_1}(s).$"

gUnknown_0840E8C7:: @ 840E8C7
OtherText_OkayToThrowAwayPrompt:
	.string "Is it okay to\nthrow away {STR_VAR_2}\n{STR_VAR_1}(s)?$"

gUnknown_0840E8EA:: @ 840E8EA
OtherText_DadsAdvice:
	.string "DAD’s advice...\n{PLAYER}, there’s a time and place for\leverything!{PAUSE_UNTIL_PRESS}$"

gUnknown_0840E929:: @ 840E929
OtherText_CantGetOffBike:
	.string "You can’t dismount your BIKE here.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840E94E:: @ 840E94E
OtherText_ItemfinderResponding:
	.string "Oh!\nThe machine’s responding!\pThere’s an item buried around here!{PAUSE_UNTIL_PRESS}$"

gUnknown_0840E992:: @ 840E992
OtherText_ItemfinderFoundItem:
	.string "The machine’s indicating something\nright underfoot!{PAUSE_UNTIL_PRESS}$"

gUnknown_0840E9C8:: @ 840E9C8
OtherText_NoResponse:
	.string "... ... ... ... Nope!\nThere’s no response.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840E9F5:: @ 840E9F5
OtherText_Coins3:
	.string "Your COINS:\n{STR_VAR_1}{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EA06:: @ 840EA06
OtherText_BootedTM:
	.string "Booted up a TM.$"

gUnknown_0840EA16:: @ 840EA16
OtherText_BootedHM:
	.string "Booted up an HM.$"

gUnknown_0840EA27:: @ 840EA27
OtherText_ContainsMove:
	.string "It contained\n{STR_VAR_1}.\pTeach {STR_VAR_1}\nto a POKéMON?$"

gUnknown_0840EA4F:: @ 840EA4F
OtherText_UsedItem:
	.string "{PLAYER} used the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EA61:: @ 840EA61
OtherText_RepelLingers:
	.string "But the effects of a REPEL lingered\nfrom earlier.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EA95:: @ 840EA95
OtherText_UsedFlute:
	.string "{PLAYER} used the\n{STR_VAR_2}.\pWild POKéMON will be lured.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EAC3:: @ 840EAC3
OtherText_UsedRepel:
	.string "{PLAYER} used the\n{STR_VAR_2}.\pWild POKéMON will be repelled.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EAF4:: @ 840EAF4
OtherText_BoxIsFull:
	.string "The BOX is full.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EB07:: @ 840EB07
OtherText_Size:
	.string "SIZE /$"

gUnknown_0840EB0E:: @ 840EB0E
OtherText_Firm:
	.string "FIRM /$"

gUnknown_0840EB15:: @ 840EB15
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

gUnknown_0840EBED:: @ 840EBED
ContestStatsText_Spicy:
	.string "SPICY$"

gUnknown_0840EBF3:: @ 840EBF3
ContestStatsText_Dry:
	.string "DRY$"

gUnknown_0840EBF7:: @ 840EBF7
ContestStatsText_Sweet:
	.string "SWEET$"

gUnknown_0840EBFD:: @ 840EBFD
ContestStatsText_Bitter:
	.string "BITTER$"

gUnknown_0840EC04:: @ 840EC04
ContestStatsText_Sour:
	.string "SOUR$"
ContestStatsText_Tasty:
	.string "TASTY$"
ContestStatsText_Feel:
	.string "FEEL$"

gUnknown_0840EC14:: @ 840EC14
ContestStatsText_StowCase:
	.string "Stow CASE.$"

gUnknown_0840EC1F:: @ 840EC1F
ContestStatsText_ThrowAwayPrompt:
	.string "Throw away this\n{STR_VAR_1}?$"

gUnknown_0840EC33:: @ 840EC33
ContestStatsText_WasThrownAway:
	.string "The {STR_VAR_1}\nwas thrown away.$"

gUnknown_0840EC4B:: @ 840EC4B
ContestStatsText_NormallyAte:
	.string "{STR_VAR_1} ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EC5C:: @ 840EC5C
ContestStatsText_HappilyAte:
	.string "{STR_VAR_1} happily ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EC75:: @ 840EC75
ContestStatsText_DisdainfullyAte:
	.string "{STR_VAR_1} disdainfully ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"
ContestStatsText_Buy: @ i have a feeling contest things still call these
	.string "BUY$"
ContestStatsText_Sell:
	.string "SELL$"
ContestStatsText_Quit2:
	.string "QUIT$"

gUnknown_0840ECA1:: @ 840ECA1
OtherText_QuitShopping:
	.string "Quit shopping.$"

gUnknown_0840ECB0:: @ 840ECB0
OtherText_HowManyYouWant:
	.string "{STR_VAR_1}? Certainly.\nHow many would you like?$"

gUnknown_0840ECD8:: @ 840ECD8
OtherText_ThatWillBe:
	.string "{STR_VAR_1}? And you wanted {STR_VAR_2}?\nThat will be ¥{STR_VAR_3}.$"

gUnknown_0840ED01:: @ 840ED01
OtherText_ThatWillBe2:
	.string "{STR_VAR_1}, is it?\nThat’ll be ¥{STR_VAR_2}. Do you want it?$"

gUnknown_0840ED2C:: @ 840ED2C
OtherText_ThatWillBe3:
	.string "You wanted {STR_VAR_1}?\nThat’ll be ¥{STR_VAR_2}. Will that be okay?$"

gUnknown_0840ED5E:: @ 840ED5E
OtherText_HereYouGo:
	.string "Here you go!\nThank you very much.$"

gUnknown_0840ED80:: @ 840ED80
OtherText_HereYouGo2:
	.string "Thank you!\nI’ll send it to your home PC.$"

gUnknown_0840EDA9:: @ 840EDA9
OtherText_HereYouGo3:
	.string "Thanks!\nI’ll send it to your PC at home.$"

gUnknown_0840EDD2:: @ 840EDD2
OtherText_NotEnoughMoney:
	.string "You don’t have enough money.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EDF1:: @ 840EDF1
OtherText_NoRoomFor:
	.string "You have no more room for items.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EE14:: @ 840EE14
OtherText_SpaceForIsFull:
	.string "The space for {STR_VAR_1} is full.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EE30:: @ 840EE30
OtherText_AnythingElse:
	.string "Is there anything else I can help\nyou with?$"

gUnknown_0840EE5C:: @ 840EE5C
OtherText_CanIHelpYou:
	.string "Can I help you with anything else?$"

gUnknown_0840EE7F:: @ 840EE7F
OtherText_FreePremierBall:
	.string "I’ll throw in a PREMIER BALL, too.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EEA4:: @ 840EEA4
OtherText_CantBuyThat:
	.string "{STR_VAR_2}? Oh, no.\nI can’t buy that.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EEC4:: @ 840EEC4
OtherText_HowManyToSell:
	.string "{STR_VAR_2}?\nHow many would you like to sell?$"

gUnknown_0840EEE9:: @ 840EEE9
OtherText_CanPay:
	.string "I can pay ¥{STR_VAR_1}.\nWould that be okay?$"

gUnknown_0840EF0C:: @ 840EF0C
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

gUnknown_0840EF72:: @ 840EF72
OtherText_Hp2:
	.string "HP$"

gUnknown_0840EF75:: @ 840EF75
OtherText_SpAtk2:
	.string "SP. ATK$"

gUnknown_0840EF7D:: @ 840EF7D
OtherText_SpDef2:
	.string "SP. DEF$"

gUnknown_0840EF85:: @ 840EF85
OtherText_WontHaveAnyEffect:
	.string "It won’t have any effect.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EFA1:: @ 840EFA1
OtherText_CantUseItemOnPoke:
	.string "This item can’t be used on\nthat POKéMON.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EFCC:: @ 840EFCC
OtherText_CantBeSwitched:
	.string "{STR_VAR_1} can’t be switched\nout!{PAUSE_UNTIL_PRESS}$"

gUnknown_0840EFE8:: @ 840EFE8
OtherText_AlreadyBattle:
	.string "{STR_VAR_1} is already\nin battle!{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F003:: @ 840F003
OtherText_AlreadySelected:
	.string "{STR_VAR_1} has already been\nselected.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F023:: @ 840F023
OtherText_NoEnergyLeft:
	.string "{STR_VAR_1} has no energy\nleft to battle!{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F046:: @ 840F046
OtherText_CantSwitchPokeWithYours:
	.string "You can’t switch {STR_VAR_1}’s\nPOKéMON with one of yours!{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F079:: @ 840F079
OtherText_EGGCantBattle:
	.string "An EGG can’t battle!{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F090:: @ 840F090
OtherText_CantBeUsedBadge:
	.string "This can’t be used until a new\nBADGE is obtained.$"

gUnknown_0840F0C2:: @ 840F0C2
OtherText_NoMoreThreePoke:
	.string "No more than three POKéMON\nmay enter.$"

gUnknown_0840F0E8:: @ 840F0E8
OtherText_SendRemovedMailPrompt:
	.string "Send the removed MAIL to\nyour PC?$"

gUnknown_0840F10A:: @ 840F10A
OtherText_MailWasSent:
	.string "The MAIL was sent to your PC.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F12A:: @ 840F12A
OtherText_MailboxIsFull:
	.string "Your PC’s MAILBOX is full.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F147:: @ 840F147
OtherText_MailRemovedMessageLost:
	.string "If the MAIL is removed, the\nmessage will be lost. Okay?$"

gUnknown_0840F17F:: @ 840F17F
OtherText_MailMustBeRemoved:
	.string "MAIL must be removed before\nholding an item.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F1AE:: @ 840F1AE
OtherText_WasGivenToHold:
	.string "{STR_VAR_1} was given the\n{STR_VAR_2} to hold.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F1CD:: @ 840F1CD
OtherText_AlreadyHolding:
	.string "{STR_VAR_1} is already holding\none {STR_VAR_2}.\pWould you like to switch the\ntwo items?$"

gUnknown_0840F213:: @ 840F213
OtherText_NotHoldingAnything:
	.string "{STR_VAR_1} isn’t\nholding anything.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F230:: @ 840F230
OtherText_ReceivedTheThingFrom:
	.string "Received the {STR_VAR_2}\nfrom {STR_VAR_1}.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F24B:: @ 840F24B
OtherText_MailTaken:
	.string "MAIL was taken from the\nPOKéMON.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F26E:: @ 840F26E
OtherText_TakenAndReplaced:
	.string "The {STR_VAR_2} was taken and\nreplaced with the {STR_VAR_1}.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F29B:: @ 840F29B
OtherText_PokeHoldingItemCantMail:
	.string "This POKéMON is holding an item.\nIt cannot hold MAIL.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F2D3:: @ 840F2D3
OtherText_MailTransferredMailbox:
	.string "MAIL was transferred from\nthe MAILBOX.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F2FC:: @ 840F2FC
OtherText_BagFullCannotRemoveItem:
	.string "The BAG is full. The POKéMON’s\nitem could not be removed.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F338:: @ 840F338
OtherText_LearnedMove:
	.string "{STR_VAR_1} learned\n{STR_VAR_2}!$"

gUnknown_0840F347:: @ 840F347
OtherText_NotCompatible:
	.string "{STR_VAR_1} and {STR_VAR_2}\nare not compatible.\p{STR_VAR_2} can’t be learned.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F37C:: @ 840F37C
OtherText_WantsToLearn:
	.string "{STR_VAR_1} wants to learn the\nmove {STR_VAR_2}.\pHowever, {STR_VAR_1} already\nknows four moves.\pShould a move be deleted and\nreplaced with {STR_VAR_2}?$"

gUnknown_0840F3F0:: @ 840F3F0
OtherText_StopTryingTo:
	.string "Stop trying to teach\n{STR_VAR_2}?$"

gUnknown_0840F409:: @ 840F409
OtherText_DidNotLearnMove2:
	.string "{STR_VAR_1} did not learn the\nmove {STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F429:: @ 840F429
OtherText_WhichMoveToForget2:
	.string "Which move should be forgotten?{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F44B:: @ 840F44B
OtherText_ForgetMove123_2: @ it might look like its a dupe but one's used in a menu while one's for battle
	.string "{PAUSE 32}1, {PAUSE 15}2, and{PAUSE 15}... {PAUSE 15}... {PAUSE 15}... {PAUSE 15}{PLAY_SE SE_KON}Poof!\p{STR_VAR_1} forgot how to\nuse {STR_VAR_2}.\pAnd...{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F49E:: @ 840F49E
OtherText_AlreadyKnows:
	.string "{STR_VAR_1} already knows\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F4B5:: @ 840F4B5
OtherText_HPRestoredBy:
	.string "{STR_VAR_1}’s HP was restored by\n{STR_VAR_2} points.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F4DA:: @ 840F4DA
OtherText_CuredPoisoning:
	.string "{STR_VAR_1} was cured of its\npoisoning.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F4FB:: @ 840F4FB
OtherText_CuredParalysis:
	.string "{STR_VAR_1} was cured of\nparalysis.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F518:: @ 840F518
OtherText_WokeUp:
	.string "{STR_VAR_1} woke up.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F526:: @ 840F526
OtherText_BurnHealed:
	.string "{STR_VAR_1}’s burn was healed.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F53E:: @ 840F53E
OtherText_ThawedOut:
	.string "{STR_VAR_1} was thawed out.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F553:: @ 840F553
OtherText_PPRestored:
	.string "PP was restored.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F566:: @ 840F566
OtherText_RegainedHealth:
	.string "{STR_VAR_1} regained health.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F57C:: @ 840F57C
OtherText_BecameHealthy:
	.string "{STR_VAR_1} became healthy.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F591:: @ 840F591
OtherText_PPIncreased:
	.string "{STR_VAR_1}’s PP increased.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F5A6:: @ 840F5A6
OtherText_ElevatedTo:
	.string "{STR_VAR_1} was elevated to\nLv. {STR_VAR_2}.$"

gUnknown_0840F5C1:: @ 840F5C1
OtherText_WasRaised:
	.string "{STR_VAR_1}’s {STR_VAR_2} was\nraised.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F5D7:: @ 840F5D7
OtherText_SnapConfusion:
	.string "{STR_VAR_1} snapped out of its\nconfusion.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F5FA:: @ 840F5FA
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

gUnknown_0840F7C6:: @ 840F7C6
OtherText_Attack:
	.string "ATTACK$"

gUnknown_0840F7CD:: @ 840F7CD
OtherText_Defense:
	.string "DEFENSE$"

gUnknown_0840F7D5:: @ 840F7D5
OtherText_SpAtk:
	.string "SP. ATK$"

gUnknown_0840F7DD:: @ 840F7DD
OtherText_SpDef:
	.string "SP. DEF$"

gUnknown_0840F7E5:: @ 840F7E5
OtherText_Speed:
	.string "SPEED$"

gUnknown_0840F7EB:: @ 840F7EB
OtherText_HP:
	.string "HP$"

gUnknown_0840F7EE:: @ 840F7EE
OtherText_Terminator18:
	.string "$"

gUnknown_0840F7EF:: @ 840F7EF
OtherText_OriginalTrainer:
	.string "OT/$"

gUnknown_0840F7F3:: @ 840F7F3
OtherText_Type2:
	.string "TYPE/$"

gUnknown_0840F7F9:: @ 840F7F9
OtherText_Power2:
	.string "POWER$"

gUnknown_0840F7FF:: @ 840F7FF
OtherText_Accuracy2:
	.string "ACCURACY$"

gUnknown_0840F808:: @ 840F808
OtherText_Appeal2:
	.string "APPEAL$"

gUnknown_0840F80F:: @ 840F80F
OtherText_Jam2:
	.string "JAM$"

gUnknown_0840F813:: @ 840F813
OtherText_Status:
	.string "STATUS$"

gUnknown_0840F81A:: @ 840F81A
OtherText_ExpPoints:
	.string "EXP. POINTS$"

gUnknown_0840F826:: @ 840F826
OtherText_NextLv:
	.string "NEXT LV.$"

gUnknown_0840F82F:: @ 840F82F
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

gUnknown_0840F884:: @ 840F884
OtherText_EggLong:
	.string "It looks like this EGG will\ntake a long time to hatch.$"

gUnknown_0840F8BB:: @ 840F8BB
OtherText_EggSome:
	.string "What will hatch from this?\nIt will take some time.$"

gUnknown_0840F8EE:: @ 840F8EE
OtherText_EggSoon:
	.string "It moves occasionally.\nIt should hatch soon.$"

gUnknown_0840F91B:: @ 840F91B
OtherText_EggAbout:
	.string "It’s making sounds.\nIt’s about to hatch!$"

gUnknown_0840F944:: @ 840F944
OtherText_CantForgetHMs:
	.string "HM moves can’t be\nforgotten now.$"

gUnknown_0840F965:: @ 840F965
OtherText_PlayersBase:
	.string "’s BASE$"

gUnknown_0840F96D:: @ 840F96D
OtherText_OkayToDeleteFromRegistry:
	.string "Is it okay to delete {STR_VAR_1}\nfrom the REGISTRY?$"

gUnknown_0840F998:: @ 840F998
OtherText_RegisteredDataDeleted:
	.string "The registered data was deleted.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840F9BB:: @ 840F9BB
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

gUnknown_0840FA64:: @ 840FA64
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

gUnknown_0840FAB2:: @ 840FAB2
SecretBaseText_GoldRank:
	.string "GOLD$"

gUnknown_0840FAB7:: @ 840FAB7
SecretBaseText_SilverRank:
	.string "SILVER$"

gUnknown_0840FABE:: @ 840FABE
SecretBaseText_PlaceItHere:
	.string "Place it here?$"

gUnknown_0840FACD:: @ 840FACD
SecretBaseText_CantBePlacedHere:
	.string "It can’t be placed here.$"

gUnknown_0840FAE6:: @ 840FAE6
SecretBaseText_CancelDecorating:
	.string "Cancel decorating?$"

gUnknown_0840FAF9:: @ 840FAF9
SecretBaseText_InUseAlready:
	.string "This is in use already.$"

gUnknown_0840FB11:: @ 840FB11
SecretBaseText_NoMoreDecor:
	.string "No more decorations can be placed.\nThe most that can be placed is {STR_VAR_1}.$"

gUnknown_0840FB57:: @ 840FB57
SecretBaseText_NoMoreDecor2:
	.string "No more decorations can be placed.\nThe most that can be placed is {STR_VAR_1}.$"
SecretBaseText_CantBePlacedHere2:
	.string "This can’t be placed here.\nIt must be on a DESK, etc.$"

gUnknown_0840FBD3:: @ 840FBD3
SecretBaseText_DecorCantPlace:
	.string "This decoration can’t be placed in\nyour own room.$"

gUnknown_0840FC05:: @ 840FC05
SecretBaseText_DecorInUse:
	.string "This decoration is in use.\nIt can’t be thrown away.$"

gUnknown_0840FC39:: @ 840FC39
SecretBaseText_WillBeDiscarded:
	.string "This {STR_VAR_1} will be discarded.\nIs that okay?$"

gUnknown_0840FC62:: @ 840FC62
SecretBaseText_DecorThrownAway:
	.string "The decoration item was thrown away.$"

gUnknown_0840FC87:: @ 840FC87
SecretBaseText_StopPuttingAwayDecor:
	.string "Stop putting away decorations?$"

gUnknown_0840FCA6:: @ 840FCA6
SecretBaseText_NoDecor:
	.string "There is no decoration item here.$"

gUnknown_0840FCC8:: @ 840FCC8
SecretBaseText_ReturnDecor:
	.string "Return this decoration to the PC?$"

gUnknown_0840FCEA:: @ 840FCEA
SecretBaseText_DecorReturned:
	.string "The decoration was returned to the PC.$"

gUnknown_0840FD11:: @ 840FD11
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

gUnknown_0840FD73:: @ 840FD73
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

gUnknown_0840FDF6:: @ 840FDF6
OtherText_NoItems:
	.string "There are no items.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840FE0C:: @ 840FE0C
OtherText_NoMoreRoom:
	.string "There is no more\nroom in the BAG.$"

gUnknown_0840FE2E:: @ 840FE2E
OtherText_HowManyToWithdraw:
	.string "How many do you\nwant to withdraw?$"

gUnknown_0840FE50:: @ 840FE50
OtherText_WithdrewThing:
	.string "Withdrew {STR_VAR_2}\n{STR_VAR_1}(s).$"
OtherText_Read:
	.string "READ$"

gUnknown_0840FE68:: @ 840FE68
OtherText_MoveToBag:
	.string "MOVE TO BAG$"
OtherText_Give:
	.string "GIVE$"

gUnknown_0840FE79:: @ 840FE79
OtherText_NoMailHere:
	.string "There’s no MAIL here.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840FE91:: @ 840FE91
OtherText_WhatWillYouDoMail:
	.string "What would you like to do with\n{STR_VAR_1}’s MAIL?$"

gUnknown_0840FEBB:: @ 840FEBB
OtherText_MessageWillBeLost:
	.string "The message will be lost.\nIs that okay?$"

gUnknown_0840FEE3:: @ 840FEE3
OtherText_BagIsFull:
	.string "The BAG is full.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840FEF6:: @ 840FEF6
OtherText_MailWasReturned:
	.string "The MAIL was returned to the BAG\nwith its message erased.{PAUSE_UNTIL_PRESS}$"

gUnknown_0840FF32:: @ 840FF32
OtherText_Dad:
	.string "DAD$"

gUnknown_0840FF36:: @ 840FF36
OtherText_Mom:
	.string "MOM$"

gUnknown_0840FF3A:: @ 840FF3A
OtherText_Wallace:
	.string "WALLACE$"

gUnknown_0840FF42:: @ 840FF42
OtherText_Steven:
	.string "STEVEN$"

gUnknown_0840FF49:: @ 840FF49
OtherText_Brawly:
	.string "BRAWLY$"

gUnknown_0840FF50:: @ 840FF50
OtherText_Winona:
	.string "WINONA$"

gUnknown_0840FF57:: @ 840FF57
OtherText_Phoebe:
	.string "PHOEBE$"

gUnknown_0840FF5E:: @ 840FF5E
OtherText_Glacia:
	.string "GLACIA$"

gUnknown_0840FF65:: @ 840FF65
ContestText_ContestWinner:
	.string "CONTEST WINNER\n$"

gUnknown_0840FF75:: @ 840FF75
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

gUnknown_08410753:: @ 8410753
PCText_SomeonesPC:
	.string "SOMEONE’S PC$"

gUnknown_08410760:: @ 8410760
PCText_LanettesPC:
	.string "LANETTE’S PC$"

gUnknown_0841076D:: @ 841076D
PCText_PlayersPC:
	.string "{PLAYER}’s PC$"

gUnknown_08410775:: @ 8410775
PCText_HallOfFame:
	.string "HALL OF FAME$"

gUnknown_08410782:: @ 8410782
PCText_LogOff:
	.string "LOG OFF$"

gUnknown_0841078A:: @ 841078A
OtherText_99Times:
	.string "99 times +$"

gUnknown_08410795:: @ 8410795
OtherText_1Minute:
	.string "1 minute +$"

gUnknown_084107A0:: @ 84107A0
OtherText_Seconds:
	.string " seconds$"

gUnknown_084107A9:: @ 84107A9
OtherText_Times:
	.string " times$"
OtherText_Period2:
	.string ".$"

gUnknown_084107B2:: @ 84107B2
OtherText_BigGuy:
	.string "Big guy$"

gUnknown_084107BA:: @ 84107BA
OtherText_BigGirl:
	.string "Big girl$"

gUnknown_084107C3:: @ 84107C3
OtherText_Son:
	.string "son$"

gUnknown_084107C7:: @ 84107C7
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

gUnknown_0841085E:: @ 841085E
OtherText_NowOn:
	.string "Now on:$"

gUnknown_08410866:: @ 8410866
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

gUnknown_08410C1C:: @ 8410C1C
PCText_OnlyOne:
	.string "There is just one POKéMON with you.$"

gUnknown_08410C40:: @ 8410C40
PCText_PartyFull2:
	.string "Your party is full!$"

gUnknown_08410C54:: @ 8410C54
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

gUnknown_08410E22:: @ 8410E22
OtherText_NumberRegistered:
	.string "No. registered$"

gUnknown_08410E31:: @ 8410E31
OtherText_NumberBattles:
	.string "No. of battles$"

gUnknown_08410E40:: @ 8410E40
OtherText_Strategy:
	.string "{PALETTE 5}STRATEGY$"

gUnknown_08410E4C:: @ 8410E4C
OtherText_TrainersPokemon:
	.string "{PALETTE 5}TRAINER’S POKéMON$"

gUnknown_08410E61:: @ 8410E61
OtherText_SelfIntroduction:
	.string "{PALETTE 5}SELF-INTRODUCTION$"

gUnknown_08410E76:: @ 8410E76
OtherText_Nature2:
	.string "NATURE/$"

gUnknown_08410E7E:: @ 8410E7E
OtherText_InParty:
	.string "IN PARTY$"

gUnknown_08410E87:: @ 8410E87
OtherText_Number:
	.string "No. $"

gUnknown_08410E8C:: @ 8410E8C
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

gUnknown_084110EE:: @ 84110EE
OtherText_TextDeletedConfirmPage1:
	.string "All the text being edited will$"

gUnknown_0841110D:: @ 841110D
OtherText_TextDeletedConfirmPage2:
	.string "be deleted. Is that okay?$"

gUnknown_08411127:: @ 8411127
OtherText_QuitEditing:
	.string "Quit editing?$"

gUnknown_08411135:: @ 8411135
OtherText_EditedTextNoSavePage1:
	.string "The edited text will not be saved.$"

gUnknown_08411158:: @ 8411158
OtherText_EditedTextNoSavePage2:
	.string "Is that okay?$"

gUnknown_08411166:: @ 8411166
OtherText_EnterAPhraseOrWord:
	.string "Please enter a phrase or word.$"

gUnknown_08411185:: @ 8411185
OtherText_TextNoDelete:
	.string "The entire text can’t be deleted.$"

gUnknown_084111A7:: @ 84111A7
OtherText_OnlyOnePhrase:
	.string "Only one phrase may be changed.$"

gUnknown_084111C7:: @ 84111C7
OtherText_OriginalSongRestored:
	.string "The original song will be restored.$"

gUnknown_084111EB:: @ 84111EB
OtherText_TrendyAlready:
	.string "That’s trendy already!$"

gUnknown_08411202:: @ 8411202
OtherText_CombineTwoPhrases:
	.string "Combine two words or phrases.$"

gUnknown_08411220:: @ 8411220
OtherText_QuitGivingInfo:
	.string "Quit giving information?$"

gUnknown_08411239:: @ 8411239
OtherText_StopGivingMail:
	.string "Stop giving the POKéMON MAIL?$"

gUnknown_08411257:: @ 8411257
OtherText_Profile:
	.string "PROFILE$"

gUnknown_0841125F:: @ 841125F
OtherText_AtBattleStart:
	.string "At the battle’s start.$"

gUnknown_08411276:: @ 8411276
OtherText_UponWinningBattle:
	.string "Upon winning a battle.$"

gUnknown_0841128D:: @ 841128D
OtherText_UponLosingBattle:
	.string "Upon losing a battle.$"

gUnknown_084112A3:: @ 84112A3
OtherText_TheBardsSong:
	.string "The BARD’s Song$"

gUnknown_084112B3:: @ 84112B3
OtherText_WhatsHipHappening:
	.string "What’s hip and happening?$"

gUnknown_084112CD:: @ 84112CD
OtherText_Interview:
	.string "Interview$"

gUnknown_084112D7:: @ 84112D7
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

gUnknown_0841134B:: @ 841134B
OtherText_Is:
	.string " is$"

gUnknown_0841134F:: @ 841134F
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

gUnknown_08411581:: @ 8411581
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

gUnknown_084115C2:: @ 84115C2
SystemText_WasEnhanced:
	.string "was enhanced!$"

gUnknown_084115D0:: @ 84115D0
SystemText_NothingChanged:
	.string "Nothing changed!$"

gUnknown_084115E1:: @ 84115E1
OtherText_WontEat:
	.string "It won’t eat anymore...$"

gUnknown_084115F9:: @ 84115F9
SystemText_SaveFailedBackupCheck:
	.string "Save failed.\nChecking the backup memory...\nPlease wait.\n{COLOR RED}“Time required: 1 minute”$"

gUnknown_0841164E:: @ 841164E
SystemText_BackupDamagedGameContinue:
	.string "The backup memory is damaged or\nthe internal battery has run dry.\nThe game can be played. However,\nprogress cannot be saved.$"

gUnknown_084116CB:: @ 84116CB
SystemText_GameplayEnded:
	.string "{COLOR RED}“Gameplay cannot be continued.\nReturning to the title screen...”$"

gUnknown_0841170F:: @ 841170F
SystemText_CheckCompleteSaveAttempt:
	.string "Check completed.\nAttempting to save again.\nPlease wait.$"

gUnknown_08411747:: @ 8411747
SystemText_SaveCompletedGameEnd:
	.string "Save completed.\n{COLOR RED}“Gameplay cannot be continued.\nReturning to the title screen.”$"

gUnknown_08411799:: @ 8411799
SystemText_SaveCompletedPressA:
	.string "Save completed.\n{COLOR RED}“Please press the A Button.”$"

gUnknown_084117C9:: @ 84117C9
OtherText_Ferry:
	.string "FERRY$"

gUnknown_084117CF:: @ 84117CF
OtherText_SecretBase:
	.string "SECRET BASE$"

gUnknown_084117DB:: @ 84117DB
OtherText_Hideout:
	.string "HIDEOUT$"

gUnknown_084117E3:: @ 84117E3
SystemText_ResetRTCPrompt:
	.string "Reset RTC?\nA: Confirm, B: Cancel$"

gUnknown_08411804:: @ 8411804
SystemText_PresentTime:
	.string "Present time in game$"

gUnknown_08411819:: @ 8411819
SystemText_PreviousTime:
	.string "Previous time in game$"

gUnknown_0841182F:: @ 841182F
SystemText_PleaseResetTime:
	.string "Please reset the time.$"

gUnknown_08411846:: @ 8411846
SystemText_ClockResetDataSave:
	.string "The clock has been reset.\nData will be saved. Please wait.$"

gUnknown_08411881:: @ 8411881
SystemText_SaveCompleted:
	.string "Save completed.$"

gUnknown_08411891:: @ 8411891
SystemText_SaveFailed:
	.string "Save failed...$"

gUnknown_084118A0:: @ 84118A0
SystemText_NoSaveFileNoTime:
	.string "There is no save file, so the time\ncan’t be set.$"

gUnknown_084118D1:: @ 84118D1
SystemText_ClockAdjustmentUsable:
	.string "The in-game clock adjustment system\nis now useable.$"

gUnknown_08411905:: @ 8411905
SystemText_Saving:
	.string "SAVING...\nDON’T TURN OFF THE POWER.$"

	.align 2
gUnknown_0841192C:: @ 841192C
	.4byte ContestStatsText_VerySoft
	.4byte ContestStatsText_Soft
	.4byte ContestStatsText_Hard
	.4byte ContestStatsText_VeryHard
	.4byte ContestStatsText_SuperHard

gUnknown_08411940:: @ 8411940
	.incbin "baserom.gba", 0x00411940, 0x8

gUnknown_08411948:: @ 8411948
	.incbin "baserom.gba", 0x00411948, 0x18

gUnknown_08411960:: @ 8411960
	.incbin "graphics/misc/clock_small.gbapal"

gUnknown_08411980:: @ 8411980
	.incbin "graphics/misc/clock_small.4bpp.lz"

gUnknown_08411A10:: @ 8411A10
	.incbin "baserom.gba", 0x00411a10, 0x32

gUnknown_08411A42:: @ 8411A42
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
gUnknown_08412050:: @ 8412050
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
gUnknown_084120A4:: @ 84120A4
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
gUnknown_084120EC:: @ 84120EC
Unknown_8412EC:
	.4byte Unknown_84120DC
Unknown_84120F0:
	.incbin "baserom.gba", 0x004120f0, 0xb0

	.align 2
gUnknown_084121A0:: @ 84121A0
	.4byte Unknown_84120DC

	.align 2
gUnknown_084121A4:: @ 84121A4
	.4byte Unknown_84120F0

gUnknown_084121A8:: @ 84121A8
	.incbin "baserom.gba", 0x004121a8, 0x34

gUnknown_084121DC:: @ 84121DC
	obj_tiles 0x08e781c8, 32, 0x39e2

gUnknown_084121E4:: @ 84121E4
	.incbin "baserom.gba", 0x004121e4, 0x18

gUnknown_084121FC:: @ 84121FC
	.incbin "graphics/intro/intro2_grass.gbapal"

gUnknown_0841221C:: @ 841221C
	.incbin "baserom.gba", 0x0041221c, 0x20

gUnknown_0841223C:: @ 841223C
	.incbin "baserom.gba", 0x0041223c, 0x20

gUnknown_0841225C:: @ 841225C
	.incbin "graphics/intro/intro2_grass.4bpp.lz"

gUnknown_084126DC:: @ 84126DC
	.incbin "baserom.gba", 0x004126dc, 0x13c

gUnknown_08412818:: @ 8412818
	.incbin "baserom.gba", 0x00412818, 0x60

gUnknown_08412878:: @ 8412878
	.incbin "baserom.gba", 0x00412878, 0x60

gUnknown_084128D8:: @ 84128D8
	.incbin "graphics/intro/intro2_bgclouds.4bpp.lz"

gUnknown_08412EB4:: @ 8412EB4
	.incbin "baserom.gba", 0x00412eb4, 0x2d0

gUnknown_08413184:: @ 8413184
	.incbin "graphics/intro/intro2_bgclouds.gbapal"

gUnknown_084131A4:: @ 84131A4
	.incbin "baserom.gba", 0x004131a4, 0x20

gUnknown_084131C4:: @ 84131C4
	.incbin "graphics/intro/intro2_bgclouds2.4bpp.lz"

gUnknown_08413300:: @ 8413300
	.incbin "baserom.gba", 0x00413300, 0x20

gUnknown_08413320:: @ 8413320
	.incbin "baserom.gba", 0x00413320, 0x20

gUnknown_08413340:: @ 8413340
	.incbin "graphics/intro/intro2_bgtrees.4bpp.lz"

gUnknown_084139C8:: @ 84139C8
	.incbin "baserom.gba", 0x004139c8, 0x304

gUnknown_08413CCC:: @ 8413CCC
	.incbin "graphics/intro/intro2_bgtrees.gbapal"
	.incbin "graphics/intro/intro2_bgtreessmall.4bpp.lz"

gUnknown_08413E38:: @ 8413E38
	.incbin "baserom.gba", 0x00413e38, 0x40 @ two palettes?

gUnknown_08413E78:: @ 8413E78
	.incbin "graphics/intro/intro2_bgnight.4bpp.lz" @ only used in credits, coupled with intro because bicycle sequence

gUnknown_08414064:: @ 8414064
	.incbin "graphics/intro/intro2_bgnight.gbapal"

gUnknown_08414084:: @ 8414084
	.incbin "baserom.gba", 0x00414084, 0x2AC

	.align 2
gIntro2NightBGTiles:: @ 8414330
	.incbin "graphics/intro/intro2_bgnight2.4bpp.lz"

	.align 1
gIntro2BrendanPalette:: @ 84143B4
	.incbin "graphics/intro/intro2_brendan.gbapal"

	.align 2
gIntro2BrendanTiles:: @ 84143D4
	.incbin "graphics/intro/intro2_brendan.4bpp.lz"

	.align 1
gIntro2MayPalette:: @ 8414F70
	.incbin "graphics/intro/intro2_may.gbapal"

	.align 2
gUnknown_08414F90:: @ 8414F90
	.space 0x1E0

	.align 2
gIntro2MayTiles:: @ 8415170
	.incbin "graphics/intro/intro2_may.4bpp.lz"

	.align 2
gIntro2BicycleTiles:: @ 8415E08
	.incbin "graphics/intro/intro2_bicycle.4bpp.lz"

	.align 1
gIntro2LatiosPalette:: @ 8416234
	.incbin "graphics/intro/intro2_latios.gbapal"

	.align 2
gIntro2LatiosTiles:: @ 8416254
	.incbin "graphics/intro/intro2_latios.4bpp.lz"

	.align 1
gIntro2LatiasPalette:: @ 84166F8
	.incbin "graphics/intro/intro2_latias.gbapal"

	.align 2
gIntro2LatiasTiles:: @ 8416718
	.incbin "graphics/intro/intro2_latias.4bpp.lz"

gUnknown_08416B3C:: @ 8416B3C
	.incbin "baserom.gba", 0x00416b3c, 0x18

gUnknown_08416B54:: @ 8416B54
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
gUnknown_08416B84:: @ 8416B84
	.4byte Unknown_8416B64
	.4byte Unknown_8416B6C
	.4byte Unknown_8416B74
	.4byte Unknown_8416B7C

gUnknown_08416B94:: @ 8416B94
	.incbin "baserom.gba", 0x00416b94, 0x48

gUnknown_08416BDC:: @ 8416BDC
Unknown_8416BDC:
	.incbin "baserom.gba", 0x00416bdc, 0x10
Unknown_8416BEC:
	.incbin "baserom.gba", 0x00416bec, 0x8
Unknown_8416BF4:
	.incbin "baserom.gba", 0x00416bf4, 0x8
Unknown_8416BFC:
	.incbin "baserom.gba", 0x00416bfc, 0x8

	.align 2
gUnknown_08416C04:: @ 8416C04
	.4byte Unknown_8416BEC
	.4byte Unknown_8416BF4
	.4byte Unknown_8416BFC

gUnknown_08416C10:: @ 8416C10
	.incbin "baserom.gba", 0x00416c10, 0x60

gUnknown_08416C70:: @ 8416C70
Unknown_8416C70:
	.incbin "baserom.gba", 0x00416c70, 0x10
Unknown_8416C80:
	.incbin "baserom.gba", 0x00416c80, 0x8

gUnknown_08416C88:: @ 8416C88
	.4byte Unknown_8416C80

gUnknown_08416C8C:: @ 8416C8C
	.incbin "baserom.gba", 0x00416c8c, 0x50

gUnknown_08416CDC:: @ 8416CDC
	.incbin "baserom.gba", 0x00416cdc, 0x18

gUnknown_08416CF4:: @ 8416CF4
	.incbin "baserom.gba", 0x00416cf4, 0x38

gUnknown_08416D2C:: @ 8416D2C
	.incbin "baserom.gba", 0x00416d2c, 0x18

gUnknown_08416D44:: @ 8416D44
	.incbin "baserom.gba", 0x00416d44, 0x38

gUnknown_08416D7C:: @ 8416D7C
	.incbin "baserom.gba", 0x00416d7c, 0x18

gUnknown_08416D94:: @ 8416D94
	.incbin "baserom.gba", 0x00416d94, 0x18

gIntro2BrendanSpriteSheet:: @ 8416DAC
	obj_tiles gIntro2BrendanTiles, 0x3800, 1002
	.space 8

gIntro2MaySpriteSheet:: @ 8416DBC
	obj_tiles gIntro2MayTiles, 0x3800, 1003
	.space 8

gIntro2BicycleSpriteSheet:: @ 8416DCC
	obj_tiles gIntro2BicycleTiles, 0x1000, 1001
	.space 8

gIntro2LatiosSpriteSheet:: @ 8416DDC
	obj_tiles gIntro2LatiosTiles, 0x1000, 1004
	.space 8

gIntro2LatiasSpriteSheet:: @ 8416DEC
	obj_tiles gIntro2LatiasTiles, 0x1000, 1005
	.space 8

gIntro2SpritePalettes:: @ 8416DFC
	obj_pal gIntro2BrendanPalette, 1002
	obj_pal gIntro2MayPalette,     1003
	obj_pal gIntro2LatiosPalette,  1004
	obj_pal gIntro2LatiasPalette,  1005
	.space 8

gUnknown_08416E24:: @ 8416E24
	.incbin "baserom.gba", 0x00416e24, 0x10

gUnknown_08416E34:: @ 8416E34
	.incbin "baserom.gba", 0x00416e34, 0x10
	.incbin "graphics/misc/evo_sparkle.gbapal"
	.incbin "graphics/misc/evo_sparkle.4bpp.lz"

gUnknown_08416E84:: @ 8416E84
	.incbin "baserom.gba", 0x00416e84, 0x10

gUnknown_08416E94:: @ 8416E94
	.incbin "baserom.gba", 0x00416e94, 0x24

gUnknown_08416EB8:: @ 8416EB8
	.incbin "baserom.gba", 0x00416eb8, 0x18

gUnknown_08416ED0:: @ 8416ED0
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
gUnknown_08417068:: @ 8417068
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

gUnknown_084170F4:: @ 84170F4
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
gUnknown_0842C1F4:: @ 842C1F4
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
gUnknown_0842C29C:: @ 842C29C
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

gUnknown_0842C2E6:: @ 842C2E6
MultiText_BerryBlenderMaxSpeedRecord:
	.string "BERRY BLENDER\nMAXIMUM SPEED RECORD!$"

gUnknown_0842C30A:: @ 842C30A
MultiText_2P3P4P:
	.string "2 PLAYERS\n3 PLAYERS\n4 PLAYERS$"

gUnknown_0842C328:: @ 842C328
MultiText_Saving:
	.string "SAVING...\nDON’T TURN OFF THE POWER.$"

gUnknown_0842C34C:: @ 842C34C
MultiText_LinkError:
	.string "{HIGHLIGHT TRANSPARENT}{COLOR WHITE2}Link error...\nCheck your Game Link cable connection,\nand turn the power off and on.$"

gUnknown_0842C3A6:: @ 842C3A6
SystemText_OptionMenu:
	.string "{PALETTE 9}OPTION$"

gUnknown_0842C3B0:: @ 842C3B0
SystemText_TextSpeed:
	.string "{PALETTE 9}TEXT SPEED$"

gUnknown_0842C3BE:: @ 842C3BE
SystemText_BattleScene:
	.string "{PALETTE 9}BATTLE SCENE$"

gUnknown_0842C3CE:: @ 842C3CE
SystemText_BattleStyle:
	.string "{PALETTE 9}BATTLE STYLE$"

gUnknown_0842C3DE:: @ 842C3DE
SystemText_Sound:
	.string "{PALETTE 9}SOUND$"

gUnknown_0842C3E7:: @ 842C3E7
SystemText_Frame:
	.string "{PALETTE 9}FRAME$"

gUnknown_0842C3F0:: @ 842C3F0
SystemText_Cancel:
	.string "{PALETTE 9}CANCEL$"

gUnknown_0842C3FA:: @ 842C3FA
SystemText_ButtonMode:
	.string "{PALETTE 9}BUTTON MODE$"

gUnknown_0842C409:: @ 842C409
SystemText_TextSpeedSlow:
	.string "{PALETTE 15}SLOW$"

gUnknown_0842C411:: @ 842C411
SystemText_Mid:
	.string "{PALETTE 15}MID$"

gUnknown_0842C418:: @ 842C418
SystemText_Fast:
	.string "{PALETTE 15}FAST$"

gUnknown_0842C420:: @ 842C420
SystemText_On:
	.string "{PALETTE 15}ON$"

gUnknown_0842C426:: @ 842C426
SystemText_Off:
	.string "{PALETTE 15}OFF$"

gUnknown_0842C42D:: @ 842C42D
SystemText_Shift:
	.string "{PALETTE 15}SHIFT$"

gUnknown_0842C436:: @ 842C436
SystemText_Set:
	.string "{PALETTE 15}SET$"

gUnknown_0842C43D:: @ 842C43D
SystemText_Mono:
	.string "{PALETTE 15}MONO$"

gUnknown_0842C445:: @ 842C445
SystemText_Stereo:
	.string "{PALETTE 15}STEREO$"

gUnknown_0842C44F:: @ 842C44F
SystemText_Type:
	.string "{PALETTE 15}TYPE$"

gUnknown_0842C457:: @ 842C457
SystemText_Terminator:
	.string "{PALETTE 8}$"

gUnknown_0842C45B:: @ 842C45B
SystemText_Normal:
	.string "{PALETTE 15}NORMAL$"

gUnknown_0842C465:: @ 842C465
SystemText_LR:
	.string "{PALETTE 15}LR$"

gUnknown_0842C46B:: @ 842C46B
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

gUnknown_0842C4A9:: @ 842C4A9
OtherText_SafariStock:
	.string "SAFARI BALLS\nStock: {STR_VAR_1}$"

gUnknown_0842C4C0:: @ 842C4C0
SystemText_LinkStandby:
	.string "Link standby...\n... ... B Button: Cancel$"

gUnknown_0842C4E9:: @ 842C4E9
SystemText_LoadEventPressA:
	.string "Press the A Button to load event.\n... ... B Button: Cancel$"

gUnknown_0842C524:: @ 842C524
SystemText_LoadingEvent:
	.string "Loading event...$"

gUnknown_0842C535:: @ 842C535
SystemText_DontCutLink:
	.string "Don’t remove the Game Link cable.\nDon’t turn off the power.$"

gUnknown_0842C571:: @ 842C571
SystemText_EventLoadSuccess:
	.string "The event was safely loaded.$"
SystemText_Terminator2:
	.string "$"

gUnknown_0842C58F:: @ 842C58F
SystemText_LoadingError:
	.string "Loading error.\nEnding session.$"
SystemText_Terminator3:
	.string "$$$$$$$"

gUnknown_0842C5B5:: @ 842C5B5
OtherText_Hoenn:
	.string "HOENN$"

gUnknown_0842C5BB:: @ 842C5BB
OtherText_OhABite:
	.string "Oh! A bite!$"

gUnknown_0842C5C7:: @ 842C5C7
OtherText_PokeOnHook:
	.string "A POKéMON’s on the hook!{PAUSE_UNTIL_PRESS}$"

gUnknown_0842C5E2:: @ 842C5E2
OtherText_NotANibble:
	.string "Not even a nibble...{PAUSE_UNTIL_PRESS}$"

gUnknown_0842C5F9:: @ 842C5F9
OtherText_ItGotAway:
	.string "It got away...{PAUSE_UNTIL_PRESS}$"
OtherText_Terminator:
	.string "$"

gUnknown_0842C60B:: @ 842C60B
TradeText_WillBeSent:
	.string "{STR_VAR_2} will be sent to {STR_VAR_1}.$"

gUnknown_0842C622:: @ 842C622
TradeText_ByeBye:
	.string "Bye-bye, {STR_VAR_2}!$"

gUnknown_0842C62F:: @ 842C62F
TradeText_SentOverPoke:
	.string "{STR_VAR_1} sent over {STR_VAR_3}.$"

gUnknown_0842C640:: @ 842C640
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

gUnknown_0842C7B6::
TradeText_TradeOkayPrompt:
	.string "Is this trade okay?$"

gUnknown_0842C7CA::
OtherText_Terminator2:
	.string "$"

gUnknown_0842C7CB::
OtherText_NewLine:
	.string "\n$"
OtherText_Escape:
	.string "/$"
OtherText_Level:
	.string "Lv$"
OtherText_ThreeDashes:
	.string "---$"

gUnknown_0842C7D6::
OtherText_FourQuestions:
	.string "????$"

@ 842C7DB
	.include "data/text/easy_chat/group_name_strings.s"

gUnknown_0842C890:: @ 842C890
OtherText_ThreeQuestions:
	.string "???$"

gUnknown_0842C894:: @ 842C894
OtherText_From:
	.string "From $"

gUnknown_0842C89A:: @ 842C89A
OtherText_MixingRecordsWithFriend:
	.string "Mixing records...$"

gUnknown_0842C8AC:: @ 842C8AC
OtherText_MixingComplete:
	.string "Record mixing completed.\nThank you for waiting.$"

gUnknown_0842C8DC:: @ 842C8DC
OtherText_TrainersTrainerCard: @ redundant but couldnt think of a better desc
	.string "’s TRAINER CARD$"

gUnknown_0842C8EC:: @ 842C8EC
OtherText_FirstHOF:
	.string "FIRST HALL OF FAME$"

gUnknown_0842C8FF:: @ 842C8FF
OtherText_LinkCableBattles:
	.string "LINK CABLE BATTLES  W/            L/$"

gUnknown_0842C924:: @ 842C924
OtherText_BattleTowerWinRecord:
	.string "BATTLE TOWER W/{CLEAR_TO 0x72}&{CLEAR_TO 0x98}STRAIGHT$"

gUnknown_0842C943:: @ 842C943
OtherText_ContestRecord:
	.string "CONTESTS W/FRIENDS W/$"

gUnknown_0842C959:: @ 842C959
OtherText_MixingRecord:
	.string "{POKEBLOCK}S W/FRIENDS$"

gUnknown_0842C96A:: @ 842C96A
OtherText_TradeRecord:
	.string "POKéMON TRADES$"

gUnknown_0842C979:: @ 842C979
OtherText_Boy:
	.string "BOY$"

gUnknown_0842C97D:: @ 842C97D
OtherText_Girl:
	.string "GIRL$"
OtherText_Terminator3:
	.string "$"

gUnknown_0842C983:: @ 842C983
OtherText_Player:
	.string "PLAYER$"

gUnknown_0842C98A:: @ 842C98A
OtherText_Badges:
	.string "BADGES$"
	.string "$"

gUnknown_0842C992:: @ 842C992
OtherText_Pokedex:
	.string "POKéDEX$"

gUnknown_0842C99A:: @ 842C99A
OtherText_PlayTime:
	.string "PLAY TIME$"

gUnknown_0842C9A4:: @ 842C9A4
OtherText_SentToPc:
	.string "{STR_VAR_1} was sent to\nthe PC.{PAUSE_UNTIL_PRESS}$"
OtherText_YourName:
	.string "YOUR NAME?$"
OtherText_BoxName:
	.string "BOX NAME?$"
OtherText_PokeName:
	.string "{STR_VAR_1}’s nickname?$"

gUnknown_0842C9E1:: @ 842C9E1
OtherText_Marco:
	.string "MARCO$" @ polo

gUnknown_0842C9E7:: @ 842C9E7
OtherText_Coins:
	.string "{STR_VAR_1} COINS$"

gUnknown_0842C9F0:: @ 842C9F0
OtherText_BattleResults:
	.string "{PLAYER}’s BATTLE RESULTS$"

gUnknown_0842CA04:: @ 842CA04
OtherText_WinRecord:
	.string "TOTAL RECORD W/{STR_VAR_1} L/{STR_VAR_2} D/{STR_VAR_3}$"

gUnknown_0842CA20:: @ 842CA20
OtherText_WinLoseDraw:
	.string "WIN        LOSE        DRAW$"

gUnknown_0842CA3C:: @ 842CA3C
OtherText_SevenDashes:
	.string "-------$"

gUnknown_0842CA44:: @ 842CA44
OtherText_FourDashes:
	.string "----$"

gUnknown_0842CA49:: @ 842CA49
OtherText_BattleTowerResults:
	.string "{PLAYER}’s BATTLE TOWER RESULTS$"

gUnknown_0842CA63:: @ 842CA63
OtherText_Lv50:
	.string "LV 50$"

gUnknown_0842CA69:: @ 842CA69
OtherText_Lv100:
	.string "LV 100$"

gUnknown_0842CA70:: @ 842CA70
OtherText_WinStreak:
	.string "{STR_VAR_1}W STREAK$"

gUnknown_0842CA7B:: @ 842CA7B
OtherText_Current:
	.string "CURRENT$"

gUnknown_0842CA83:: @ 842CA83
OtherText_Record:
	.string "RECORD$"

gUnknown_0842CA8A:: @ 842CA8A
OtherText_Prev:
	.string "PREV.$"

gUnknown_0842CA90:: @ 842CA90
OtherText_QuitGamePrompt:
	.string "Quit the game?$"

gUnknown_0842CA9F:: @ 842CA9F
OtherText_MaxCoins:
	.string "You’ve got 9,999 COINS.$"

gUnknown_0842CAB7:: @ 842CAB7
OtherText_OutOfCoins:
	.string "You’ve run out of COINS.\nGame over!$"

gUnknown_0842CADB:: @ 842CADB
OtherText_DontHaveThreeCoins:
	.string "You don’t have three COINS.$"

gUnknown_0842CAF7:: @ 842CAF7
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

gUnknown_0842CC28:: @ 842CC28
OtherText_NewLine2:
	.string "\n$"

gUnknown_0842CC2A:: @ 842CC2A
OtherText_Cancel:
	.string "CANCEL$"
OtherText_Lv:
	.string "LV$"

gUnknown_0842CC34:: @ 842CC34
OtherText_Egg:
	.string "EGG$"

gUnknown_0842CC38:: @ 842CC38
OtherText_HatchedFromEgg:
	.string "{COLOR WHITE2}{HIGHLIGHT TRANSPARENT}{SHADOW DARK_GREY}{STR_VAR_1} hatched from the EGG!$"

gUnknown_0842CC5A:: @ 842CC5A
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

gUnknown_0842CCC7:: @ 842CCC7
OtherText_TeachWhichMove:
	.string "Teach which move to {STR_VAR_1}?$"

gUnknown_0842CCDF:: @ 842CCDF
OtherText_TeachSpecificMove:
	.string "Teach {STR_VAR_2}?$"

gUnknown_0842CCE9:: @ 842CCE9
OtherText_PokeLearnedMove:
	.string "{STR_VAR_1} learned {STR_VAR_2}.$"

gUnknown_0842CCF8:: @ 842CCF8
OtherText_DeleteOlderMove:
	.string "{STR_VAR_1} is trying to learn\n{STR_VAR_2}.\pBut {STR_VAR_1} can’t learn more\nthan four moves.\pDelete an older move to make\nroom for {STR_VAR_2}?$"

gUnknown_0842CD65:: @ 842CD65
OtherText_StopLearningMove:
	.string "Stop learning {STR_VAR_2}?$"

gUnknown_0842CD77:: @ 842CD77
OtherText_ForgotMove123:
	.string "{PAUSE 32}1, {PAUSE 15}2 {PAUSE 15}...{PAUSE 15}...{PAUSE 15}...{PAUSE 15} {PLAY_SE 0x0038}Poof!\p$"

gUnknown_0842CDA3:: @ 842CDA3
OtherText_ForgotMove:
	.string "{STR_VAR_1} forgot {STR_VAR_3}.\pAnd...\p{STR_VAR_1} learned {STR_VAR_2}.$"
OtherText_DidNotLearnMove:
	.string "{STR_VAR_1} did not learn\n{STR_VAR_2}.$"

gUnknown_0842CDDC:: @ 842CDDC
OtherText_GiveUpTeachingMove:
	.string "Give up trying to teach a new move\nto {STR_VAR_1}?$"

gUnknown_0842CE06:: @ 842CE06
OtherText_WhichMoveToForget:
	.string "Which move should be forgotten?\p$"

gUnknown_0842CE27:: @ 842CE27
OtherText_ClearAllSaveDataPrompt:
	.string "Clear all save data areas?$"

gUnknown_0842CE42:: @ 842CE42
OtherText_ClearingData:
	.string "Clearing data...\nPlease wait.$"

gUnknown_0842CE60:: @ 842CE60
ContestText_AnnounceResults:
	.string "Announcing the results!$"

gUnknown_0842CE78:: @ 842CE78
ContestText_PreliminaryResults:
	.string "The preliminary results!$"

gUnknown_0842CE91:: @ 842CE91
ContestText_Round2Results:
	.string "Round 2 results!$"

gUnknown_0842CEA2:: @ 842CEA2
ContestText_PokeWon:
	.string "{STR_VAR_1}’s {STR_VAR_2} won!$"

gUnknown_0842CEAF:: @ 842CEAF
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

gUnknown_0842D0E6:: @ 842D0E6
OtherText_Terminator4:
	.string "$"

gUnknown_0842D0E7:: @ 842D0E7
OtherText_Nature:
	.string " nature, $"

gUnknown_0842D0F1:: @ 842D0F1
OtherText_Comma:
	.string ",$"

gUnknown_0842D0F3:: @ 842D0F3
OtherText_Met:
	.string " (met).$"

gUnknown_0842D0FB:: @ 842D0FB
OtherText_Egg2:
	.string " (EGG).$"

gUnknown_0842D103:: @ 842D103
OtherText_ObtainedInTrade:
	.string "obtained in a trade.$"

gUnknown_0842D118:: @ 842D118
OtherText_FatefulEncounter:
	.string "fateful encounter.$"

gUnknown_0842D12B:: @ 842D12B
OtherText_Met2:
	.string " (met).$"

gUnknown_0842D133:: @ 842D133
OtherText_EggDayCare:
	.string "An odd POKéMON EGG found\nby the DAY CARE couple.$"

gUnknown_0842D164:: @ 842D164
OtherText_EggNicePlace:
	.string "A peculiar POKéMON EGG\nobtained at the nice place.$"

gUnknown_0842D197:: @ 842D197
OtherText_EggObtainedInTrade:
	.string "A peculiar POKéMON EGG\nobtained in a trade.$"

gUnknown_0842D1C3:: @ 842D1C3
OtherText_EggHotSprings:
	.string "A POKéMON EGG obtained\nat the hot springs.$"

gUnknown_0842D1EE:: @ 842D1EE
OtherText_LinkStandby2:
	.string "Link standby...$"

gUnknown_0842D1FE:: @ 842D1FE
OtherText_YesNo:
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}YES\nNO$"
OtherText_Player2:
	.string "{HIGHLIGHT TRANSPARENT}PLAYER$"
OtherText_Terminator5:
	.string "{HIGHLIGHT TRANSPARENT}$"

gUnknown_0842D21C:: @ 842D21C
OtherText_HoennDex:
	.string "HOENN$"

gUnknown_0842D222:: @ 842D222
OtherText_NationalDex:
	.string "NATIONAL$"

gUnknown_0842D22B:: @ 842D22B
OtherText_DiplomaCertification:
	.string "{HIGHLIGHT TRANSPARENT}Player: {CLEAR 0x10}{COLOR RED}{PLAYER}\n\n{COLOR DARK_GREY}{STR_VAR_1} POKéDEX\nThis document certifies\nthat you have successfully\ncompleted your POKéDEX.\n\n{CLEAR_TO 0x42}{COLOR RED}GAME FREAK$"
OtherText_DiplomaGameFreak:
	.string "{COLOR RED}{HIGHLIGHT TRANSPARENT}GAME FREAK$"

gUnknown_0842D2BC:: @ 842D2BC
OtherText_PLink:
	.string "{STR_VAR_1}P LINK$"

gUnknown_0842D2C5:: @ 842D2C5
OtherText_YesNo2:
	.string "YES\nNO$"
OtherText_Terminating:
	.string "Terminating.$"

gUnknown_0842D2D9:: @ 842D2D9
OtherText_LinkNotFound:
	.string "Link partner(s) not found.\nPlease try again.\p$"

gUnknown_0842D307:: @ 842D307
OtherText_BerryBlenderChoose:
	.string "Starting up the BERRY BLENDER.\pPlease select a BERRY from your BAG\nto put in the BERRY BLENDER.\p$"

gUnknown_0842D368:: @ 842D368
OtherText_PokeBlockMade:
	.string " was made!$"

gUnknown_0842D373:: @ 842D373
OtherText_PressAToStart:
	.string "Press the A Button to start.$"

gUnknown_0842D390:: @ 842D390
OtherText_PleaseWait:
	.string "Please wait a while.$"

gUnknown_0842D3A5:: @ 842D3A5
OtherText_LinkStandby3:
	.string "Link standby...$"

gUnknown_0842D3B5:: @ 842D3B5
OtherText_BlendAnotherBerryPrompt:
	.string "Would you like to blend another BERRY?$"

gUnknown_0842D3DC:: @ 842D3DC
OtherText_OutOfBerries:
	.string "You’ve run out of BERRIES for\nblending in the BERRY BLENDER.\p$"

gUnknown_0842D41A:: @ 842D41A
OtherText_CaseIsFull:
	.string "Your {POKEBLOCK} CASE is full.\p$"

gUnknown_0842D434:: @ 842D434
OtherText_NoBerriesForBlend:
	.string " has no BERRIES to put in\nthe BERRY BLENDER.$"

gUnknown_0842D461:: @ 842D461
OtherText_OtherCaseIsFull:
	.string "’s {POKEBLOCK} CASE is full.\p$"

gUnknown_0842D479:: @ 842D479
OtherText_ResultOfBlending:
	.string "RESULTS OF BLENDING$"
OtherText_BerryUsed:
	.string "BERRY USED$"

gUnknown_0842D498:: @ 842D498
OtherText_Berry:
	.string " BERRY$"

gUnknown_0842D49F:: @ 842D49F
OtherText_RequiredTime:
	.string "REQUIRED TIME$"

gUnknown_0842D4AD:: @ 842D4AD
OtherText_Min:
	.string "MIN.$"

gUnknown_0842D4B2:: @ 842D4B2
OtherText_Sec:
	.string "SEC.$"

gUnknown_0842D4B7:: @ 842D4B7
OtherText_MaxSpeed:
	.string "MAXIMUM SPEED$"

gUnknown_0842D4C5:: @ 842D4C5
OtherText_RPM:
	.string "RPM$"
OtherText_RPMPeriod:
	.string ".$"

gUnknown_0842D4CB:: @ 842D4CB
OtherText_Ranking:
	.string "RANKING$"

gUnknown_0842D4D3:: @ 842D4D3
OtherText_BlockLevelIs:
	.string "The level is $"

gUnknown_0842D4E1:: @ 842D4E1
OtherText_BlockFeelIs:
	.string ", and the feel is $"

gUnknown_0842D4F4:: @ 842D4F4
OtherText_Period:
	.string ".$"

gUnknown_0842D4F6:: @ 842D4F6
OtherText_Day:
	.string "DAY$"
OtherText_DayColon:
	.string ":$"

gUnknown_0842D4FC:: @ 842D4FC
OtherText_OK:
	.string "OK$"

gUnknown_0842D4FF:: @ 842D4FF
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

gUnknown_0842F140:: @ 842F140
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

gUnknown_0842F1C0:: @ 842F1C0
	.incbin "baserom.gba", 0x0042f1c0, 0x80

gUnknown_0842F240:: @ 842F240
	obj_pal 0x0203a360, 0xfff0

gUnknown_0842F248:: @ 842F248
	obj_pal 0x0203a360, 0xfff1

gUnknown_0842F250:: @ 842F250
	.incbin "baserom.gba", 0x0042f250, 0x48

gUnknown_0842F298:: @ 842F298
Unknown_842F298:
	.incbin "baserom.gba", 0x0042f298, 0x2C0
Unknown_842F558:
	.incbin "baserom.gba", 0x0042f558, 0x64

gUnknown_0842F5BC:: @ 842F5BC
	.4byte Unknown_842F558

gUnknown_0842F5C0:: @ 842F5C0
	.incbin "baserom.gba", 0x0042f5c0, 0x100

gUnknown_0842F6C0:: @ 842F6C0
	.incbin "baserom.gba", 0x0042f6c0, 0x98

gUnknown_0842F758:: @ 842F758
	.incbin "baserom.gba", 0x0042f758, 0x28

gUnknown_0842F780:: @ 842F780
	.incbin "baserom.gba", 0x0042f780, 0x8

gUnknown_0842F788:: @ 842F788
	.incbin "baserom.gba", 0x0042f788, 0x8

gUnknown_0842F790:: @ 842F790
	.incbin "baserom.gba", 0x0042f790, 0x8

gUnknown_0842F798:: @ 842F798
OtherText_BerryObtainedDadHasIt:
	.string "Obtained a {STR_VAR_2} BERRY!\nDad has it at PETALBURG GYM.$"

gUnknown_0842F7CA:: @ 842F7CA
OtherText_BerryTransformed:
	.string "The {STR_VAR_1} BERRY transformed into\none {STR_VAR_2} BERRY.$"

gUnknown_0842F7F6:: @ 842F7F6
OtherText_BerryAlreadyObtained:
	.string "The {STR_VAR_1} BERRY has already been\nobtained.$"

gUnknown_0842F81E:: @ 842F81E
OtherText_SpecialRibbonReceived:
	.string "A special RIBBON was awarded to your\nparty POKéMON.$"

gUnknown_0842F852:: @ 842F852
OtherText_DexUpgraded:
	.string "The POKéDEX has been upgraded with\nthe NATIONAL MODE.$"

gUnknown_0842F888:: @ 842F888
OtherText_RareWordAdded:
	.string "A rare word has been added.$"

gUnknown_0842F8A4:: @ 842F8A4
OtherText_PokeWasSentOver:
	.string "{STR_VAR_1} was sent over!$"

gUnknown_0842F8B6:: @ 842F8B6
OtherText_PartyIsFull:
	.string "Your party is full.\n{STR_VAR_1} could not be sent over.$"

gUnknown_0842F8E5:: @ 842F8E5
OtherText_NewTrainerInHoenn:
	.string "A new TRAINER has arrived in HOENN.$"
OtherText_BattleTowerNewAdversary:
	.string "A new adversary has arrived in the\nBATTLE TOWER.$"

gUnknown_0842F93A:: @ 842F93A
OtherText_DataCannotUseVersion:
	.string "This data cannot be used in\nthis version.$"
