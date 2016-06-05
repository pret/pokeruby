@ the second big chunk of data

	.include "asm/macros.s"
	.include "constants/constants.s"

	.section .rodata

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
	.incbin "baserom.gba", 0x001e79e8, 0x204

	.global gUnknown_081E7BEC
gUnknown_081E7BEC: @ 81E7BEC
	.4byte 0x081e7aa0
	.4byte 0x081e7ac0
	.4byte 0x081e7ad8
	.4byte 0x081e7af0
	.4byte 0x081e7b10
	.4byte 0x081e7b20
	.4byte 0x081e7b94
	.4byte 0x081e7ba4
	.4byte 0x081e7bbc
	.4byte 0x081e7b30
	.4byte 0x081e7bdc

	.global gUnknown_081E7C18
gUnknown_081E7C18: @ 81E7C18
	.incbin "baserom.gba", 0x001e7c18, 0x4c

	.global gUnknown_081E7C64
gUnknown_081E7C64: @ 81E7C64
	.4byte 0x081e7c44
	.4byte 0x081e7c4c
	.4byte 0x081e7c54
	.4byte 0x081e7c5c

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
	.4byte 0x081ec14c
	.4byte 0x081ec150
	.4byte 0x081ec154
	.4byte 0x081ec15c
	.4byte 0x081ec160
	.4byte 0x081ec164
	.4byte 0x081ec168
	.4byte 0x081ec16c
	.4byte 0x081ec174
	.4byte 0x081ec17c
	.4byte 0x081ec180
	.4byte 0x081ec184
	.4byte 0x081ec188
	.4byte 0x081ec18c
	.4byte 0x081ec190
	.4byte 0x081ec194
	.4byte 0x081ec198
	.4byte 0x081ec19c
	.4byte 0x081ec1a0
	.4byte 0x081ec1a4
	.4byte 0x081ec1a8
	.4byte 0x081ec1ac
	.4byte 0x081ec1b0
	.4byte 0x081ec1b4
	.4byte 0x081ec1b8
	.4byte 0x081ec1bc
	.4byte 0x081ec1c0
	.4byte 0x081ec1c4
	.4byte 0x081ec1c8
	.4byte 0x081ec1cc
	.4byte 0x081ec1d0
	.4byte 0x081ec1d4
	.4byte 0x081ec1d8
	.4byte 0x081ec1dc
	.4byte 0x081ec1e0
	.4byte 0x081ec1e4
	.4byte 0x081ec1e8
	.4byte 0x081ec1ec
	.4byte 0x081ec1f0
	.4byte 0x081ec1f4
	.4byte 0x081ec1f8
	.4byte 0x081ec1fc
	.4byte 0x081ec200
	.4byte 0x081ec204
	.4byte 0x081ec208
	.4byte 0x081ec20c
	.4byte 0x081ec210
	.4byte 0x081ec214
	.4byte 0x081ec218
	.4byte 0x081ec21c
	.4byte 0x081ec220
	.4byte 0x081ec224
	.4byte 0x081ec228
	.4byte 0x081ec22c
	.4byte 0x081ec230
	.4byte 0x081ec234
	.4byte 0x081ec238
	.4byte 0x081ec23c
	.4byte 0x081ec240
	.4byte 0x081ec244
	.4byte 0x081ec248
	.4byte 0x081ec24c
	.4byte 0x081ec250
	.4byte 0x081ec254
	.4byte 0x081ec258
	.4byte 0x081ec25c
	.4byte 0x081ec260
	.4byte 0x081ec264
	.4byte 0x081ec268
	.4byte 0x081ec26c
	.4byte 0x081ec270
	.4byte 0x081ec274
	.4byte 0x081ec278
	.4byte 0x081ec27c
	.4byte 0x081ec280
	.4byte 0x081ec284
	.4byte 0x081ec288
	.4byte 0x081ec28c
	.4byte 0x081ec290
	.4byte 0x081ec294
	.4byte 0x081ec298
	.4byte 0x081ec29c
	.4byte 0x081ec2a0

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
	.4byte 0x081ecab4
	.4byte 0x081ecabc
	.4byte 0x081ecac4

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
	.4byte 0x08013fe9
	.4byte 0x080147a1
	.4byte 0x080146f5
	.4byte 0x08014bf5
	.4byte 0x08014d51
	.4byte 0x08014d99
	.4byte 0x08014df9
	.4byte 0x08014ebd
	.4byte 0x08014f81
	.4byte 0x08014fbd
	.4byte 0x0801b595
	.4byte 0x08015035
	.4byte 0x08015095
	.4byte 0x08015061

	.global gUnknown_081FA678
gUnknown_081FA678: @ 81FA678
	.4byte 0x08011dc9
	.4byte 0x08013999
	.4byte 0x08013b65
	.4byte 0x08013b65
	.4byte 0x08013bdd
	.4byte 0x08013c9d
	.4byte 0x08013c49
	.4byte 0x08013c9d
	.4byte 0x08013c9d

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
	.4byte 0x081fa69c
	.4byte BattleText_PoisonStatus
	.4byte 0x081fa6a4
	.4byte BattleText_Sleep
	.4byte 0x081fa6ac
	.4byte BattleText_Paralysis
	.4byte 0x081fa6b4
	.4byte BattleText_Burn
	.4byte 0x081fa6bc
	.4byte BattleText_IceStatus
	.4byte 0x081fa6c4
	.4byte BattleText_Confusion
	.4byte 0x081fa6cc
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

	.global gUnknown_081FA73C
gUnknown_081FA73C: @ 81FA73C
	.4byte 0x0801bc51
	.4byte 0x0801c2bd
	.4byte 0x0801c649
	.4byte 0x0801c69d
	.4byte 0x0801c879
	.4byte 0x0801c9ed
	.4byte 0x0801ccc5
	.4byte 0x0801d5b1
	.4byte 0x0801d761
	.4byte 0x0801d8ed
	.4byte 0x0801da61
	.4byte 0x0801da81
	.4byte 0x0801db4d
	.4byte 0x0801df49
	.4byte 0x0801df9d
	.4byte 0x0801e06d
	.4byte 0x0801e21d
	.4byte 0x0801e25d
	.4byte 0x0801e2a1
	.4byte 0x0801e2fd
	.4byte 0x0801e351
	.4byte 0x0801f615
	.4byte 0x0801f709
	.4byte 0x0801f719
	.4byte 0x0801f729
	.4byte 0x0801f7ad
	.4byte 0x0801fb35
	.4byte 0x0801fb71
	.4byte 0x0801fbd5
	.4byte 0x0801fc4d
	.4byte 0x0801fcc5
	.4byte 0x0801fdb5
	.4byte 0x0801fe2d
	.4byte 0x0801ff25
	.4byte 0x0801ffa9
	.4byte 0x08020005
	.4byte 0x080209b5
	.4byte 0x08020b9d
	.4byte 0x08020bb5
	.4byte 0x08020bcd
	.4byte 0x08020c15
	.4byte 0x08020c35
	.4byte 0x08020cd5
	.4byte 0x08020d7d
	.4byte 0x08020e31
	.4byte 0x08020eb9
	.4byte 0x08020f3d
	.4byte 0x08020f65
	.4byte 0x08020f91
	.4byte 0x08020fbd
	.4byte 0x08021011
	.4byte 0x0802107d
	.4byte 0x080210a9
	.4byte 0x080210e1
	.4byte 0x08021125
	.4byte 0x08021151
	.4byte 0x08021189
	.4byte 0x080211cd
	.4byte 0x0802120d
	.4byte 0x0802122d
	.4byte 0x08021285
	.4byte 0x08021291
	.4byte 0x080212b1
	.4byte 0x080212c9
	.4byte 0x0801c099
	.4byte 0x080212f9
	.4byte 0x08021329
	.4byte 0x08021385
	.4byte 0x080213d1
	.4byte 0x080213f1
	.4byte 0x080214b5
	.4byte 0x08021581
	.4byte 0x080215fd
	.4byte 0x080217f9
	.4byte 0x080222dd
	.4byte 0x0802252d
	.4byte 0x0802257d
	.4byte 0x080225f1
	.4byte 0x08022785
	.4byte 0x08022831
	.4byte 0x08022a99
	.4byte 0x0802331d
	.4byte 0x08023525
	.4byte 0x080237cd
	.4byte 0x0802380d
	.4byte 0x08023849
	.4byte 0x08023885
	.4byte 0x080238b5
	.4byte 0x080238ed
	.4byte 0x08023921
	.4byte 0x08023af9
	.4byte 0x08023e75
	.4byte 0x08023f85
	.4byte 0x08024015
	.4byte 0x08024195
	.4byte 0x08024249
	.4byte 0x08024299
	.4byte 0x080242c9
	.4byte 0x08024391
	.4byte 0x080243c1
	.4byte 0x08024425
	.4byte 0x080244b5
	.4byte 0x0802455d
	.4byte 0x080245f1
	.4byte 0x080246a1
	.4byte 0x080246d9
	.4byte 0x08024855
	.4byte 0x080248c1
	.4byte 0x080248fd
	.4byte 0x08024c4d
	.4byte 0x08024c65
	.4byte 0x08024c85
	.4byte 0x08024cb9
	.4byte 0x08024d15
	.4byte 0x08024d2d
	.4byte 0x08024d71
	.4byte 0x08024e2d
	.4byte 0x08024ee9
	.4byte 0x08024f41
	.4byte 0x08025131
	.4byte 0x0802526d
	.4byte 0x08025389
	.4byte 0x080253e9
	.4byte 0x0802548d
	.4byte 0x08025509
	.4byte 0x080256d1
	.4byte 0x08025725
	.4byte 0x080257dd
	.4byte 0x0802589d
	.4byte 0x0802591d
	.4byte 0x080259ed
	.4byte 0x08025a35
	.4byte 0x08025ae1
	.4byte 0x08025b5d
	.4byte 0x08025bd9
	.4byte 0x08025d01
	.4byte 0x08025ded
	.4byte 0x080262c5
	.4byte 0x08026319
	.4byte 0x0802636d
	.4byte 0x080263dd
	.4byte 0x0802641d
	.4byte 0x08026469
	.4byte 0x08026591
	.4byte 0x0802688d
	.4byte 0x08026a31
	.4byte 0x08026ac1
	.4byte 0x08026b79
	.4byte 0x08026e59
	.4byte 0x08026e95
	.4byte 0x08026eed
	.4byte 0x08027065
	.4byte 0x08027239
	.4byte 0x08027349
	.4byte 0x080273dd
	.4byte 0x08027439
	.4byte 0x080275d9
	.4byte 0x080276dd
	.4byte 0x080278b9
	.4byte 0x08027961
	.4byte 0x08027991
	.4byte 0x080279e5
	.4byte 0x08027add
	.4byte 0x08027bd5
	.4byte 0x08027d19
	.4byte 0x08027e4d
	.4byte 0x08027f45
	.4byte 0x0802813d
	.4byte 0x08028195
	.4byte 0x08028421
	.4byte 0x08028559
	.4byte 0x080285e9
	.4byte 0x08028601
	.4byte 0x08028669
	.4byte 0x08028859
	.4byte 0x08028ad5
	.4byte 0x08028b71
	.4byte 0x08028bfd
	.4byte 0x08028c2d
	.4byte 0x08028ce5
	.4byte 0x08028e61
	.4byte 0x08028ec9
	.4byte 0x08028f7d
	.4byte 0x08029001
	.4byte 0x080290bd
	.4byte 0x0802914d
	.4byte 0x08029271
	.4byte 0x080293e9
	.4byte 0x08029441
	.4byte 0x080294c1
	.4byte 0x08029509
	.4byte 0x0802964d
	.4byte 0x0802967d
	.4byte 0x08029785
	.4byte 0x080298ad
	.4byte 0x08029921
	.4byte 0x08029a49
	.4byte 0x08029c59
	.4byte 0x08029cdd
	.4byte 0x08029d6d
	.4byte 0x08029dad
	.4byte 0x08029e05
	.4byte 0x08029ea1
	.4byte 0x08029eed
	.4byte 0x08029f51
	.4byte 0x08029fc5
	.4byte 0x0802a049
	.4byte 0x0802a0a1
	.4byte 0x0802a0fd
	.4byte 0x0802a171
	.4byte 0x0802a219
	.4byte 0x0802a4b1
	.4byte 0x0802a529
	.4byte 0x0802a5fd
	.4byte 0x0802a655
	.4byte 0x0802a6bd
	.4byte 0x0802a72d
	.4byte 0x0802a799
	.4byte 0x0802a7fd
	.4byte 0x0802a895
	.4byte 0x0802a995
	.4byte 0x0802a9ed
	.4byte 0x0802aa85
	.4byte 0x0802abfd
	.4byte 0x0802ac81
	.4byte 0x0802acfd
	.4byte 0x0802add9
	.4byte 0x0802ae5d
	.4byte 0x0802aeb1
	.4byte 0x0802af69
	.4byte 0x0802b055
	.4byte 0x0802b0c1
	.4byte 0x0802b109
	.4byte 0x0802b1c1
	.4byte 0x0802b28d
	.4byte 0x0802b331
	.4byte 0x0802b3e1
	.4byte 0x0802b4b5
	.4byte 0x0802b51d
	.4byte 0x0802b5b9
	.4byte 0x0802b961
	.4byte 0x0802b9e1
	.4byte 0x0802ba91
	.4byte 0x0802bc91
	.4byte 0x0802bef1
	.4byte 0x0802bf21
	.4byte 0x0802bf49
	.4byte 0x0802bf55

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
	.4byte 0x0802e4d1
	.4byte 0x0802ecf1
	.4byte 0x0802ed79
	.4byte 0x0802f7cd
	.4byte 0x0802f841
	.4byte 0x0802f8a9
	.4byte 0x0802faa1
	.4byte 0x0802fbb5
	.4byte 0x0802fce1
	.4byte 0x0802fdbd
	.4byte 0x0802fe7d
	.4byte 0x0802ff61
	.4byte 0x0802ff81
	.4byte 0x0802ffd1
	.4byte 0x0803002d
	.4byte 0x0803005d
	.4byte 0x080302f5
	.4byte 0x08030359
	.4byte 0x0803037d
	.4byte 0x08030465
	.4byte 0x08030469
	.4byte 0x08030531
	.4byte 0x08030595
	.4byte 0x08030675
	.4byte 0x08030699
	.4byte 0x08030799
	.4byte 0x08030835
	.4byte 0x080308a9
	.4byte 0x08030911
	.4byte 0x0803097d
	.4byte 0x08030989
	.4byte 0x08030a3d
	.4byte 0x08030a6d
	.4byte 0x08030a79
	.4byte 0x08030a8d
	.4byte 0x08030aa1
	.4byte 0x08030ab5
	.4byte 0x08030ac9
	.4byte 0x08030ae5
	.4byte 0x08030b1d
	.4byte 0x08030b35
	.4byte 0x08030b5d
	.4byte 0x08030bcd
	.4byte 0x08030bd9
	.4byte 0x08030c1d
	.4byte 0x08030c4d
	.4byte 0x08030c8d
	.4byte 0x08030cc1
	.4byte 0x08030fad
	.4byte 0x080310a5
	.4byte 0x080310f1
	.4byte 0x08031115
	.4byte 0x08031175
	.4byte 0x080311dd
	.4byte 0x08031239
	.4byte 0x080312a1
	.4byte 0x080312ed

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
	.4byte 0x02008000
	.4byte 0x0200a000
	.4byte 0x0200c000
	.4byte 0x0200e000

	.global gUnknown_081FAF5C
gUnknown_081FAF5C: @ 81FAF5C
	.incbin "baserom.gba", 0x001faf5c, 0xec

	.global gUnknown_081FB048
gUnknown_081FB048: @ 81FB048
	.4byte 0x0803807d
	.4byte 0x0803889d
	.4byte 0x080388a9
	.4byte 0x08039221
	.4byte 0x08039295
	.4byte 0x080393e5
	.4byte 0x080395b5
	.4byte 0x080396d1
	.4byte 0x080398a5
	.4byte 0x080398b1
	.4byte 0x0803995d
	.4byte 0x08039a01
	.4byte 0x08039a0d
	.4byte 0x08039a19
	.4byte 0x08039a25
	.4byte 0x08039a31
	.4byte 0x08039cc9
	.4byte 0x08039d2d
	.4byte 0x08039d39
	.4byte 0x08039d45
	.4byte 0x08039d51
	.4byte 0x08039d5d
	.4byte 0x08039d69
	.4byte 0x08039d75
	.4byte 0x08039d81
	.4byte 0x08039e71
	.4byte 0x08039e7d
	.4byte 0x08039ef1
	.4byte 0x08039f59
	.4byte 0x08039f65
	.4byte 0x08039f71
	.4byte 0x08039f7d
	.4byte 0x08039f89
	.4byte 0x08039f95
	.4byte 0x08039fa1
	.4byte 0x08039fad
	.4byte 0x08039fb9
	.4byte 0x08039fc5
	.4byte 0x08039fe1
	.4byte 0x0803a019
	.4byte 0x0803a031
	.4byte 0x0803a059
	.4byte 0x0803a0c9
	.4byte 0x0803a0d5
	.4byte 0x0803a119
	.4byte 0x0803a149
	.4byte 0x0803a185
	.4byte 0x0803a1b9
	.4byte 0x0803a3dd
	.4byte 0x0803a521
	.4byte 0x0803a56d
	.4byte 0x0803a579
	.4byte 0x0803a5d9
	.4byte 0x0803a641
	.4byte 0x0803a64d
	.4byte 0x0803a659
	.4byte 0x0803a6bd

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

	.incbin "baserom.gba", 0x00209ad8, 0x8d8

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

	.global gUnknown_0820C320
gUnknown_0820C320: @ 820C320
	.4byte TradeText_Summary2
	.4byte 0x0804a9f5 @unknown
	.4byte TradeText_Trade2
	.4byte 0x0804aa01

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

	.global gUnknown_082166A0
gUnknown_082166A0: @ 82166A0
	.4byte 0x08055c69
	.4byte 0x08055c89
	.4byte 0x08055c8d

	.global gUnknown_082166AC
gUnknown_082166AC: @ 82166AC
	.4byte 0x08055cad
	.4byte 0x08055cb1
	.4byte 0x08055cb1
	.4byte 0x08055cb1
	.4byte 0x08055cb1
	.4byte 0x08055cad
	.4byte 0x08055cad
	.4byte 0x08055d19
	.4byte 0x08055d19
	.4byte 0x08055d19
	.4byte 0x08055d19

	.global gUnknown_082166D8
gUnknown_082166D8: @ 82166D8
	.4byte 0x08055d31
	.4byte 0x08055d39

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
	.4byte 0x08057051
	.4byte 0x0805703d
	.4byte 0x0805708d
	.4byte 0x08057079
	.4byte 0x080570a1
	.4byte 0x080570b5
	.4byte 0x080570dd
	.4byte 0x080570c9
	.4byte 0x080570f1
	.4byte 0x08057105
	.4byte 0x0805712d
	.4byte 0x08057119
	.4byte 0x08057141
	.4byte 0x08057155
	.4byte 0x08057679
	.4byte 0x08057771
	.4byte 0x08057785
	.4byte 0x08057841

	.global gUnknown_0830FBA0
gUnknown_0830FBA0: @ 830FBA0
	.4byte 0x080589a1
	.4byte 0x08058a99
	.4byte 0x08058a99
	.4byte 0x08058aad
	.4byte 0x08058ac5
	.4byte 0x08058add
	.4byte 0x08058af5
	.4byte 0x08058b0d
	.4byte 0x08058b25
	.4byte 0x08058b3d
	.4byte 0x08058b55
	.4byte 0x08058ba5
	.4byte 0x08058bbd
	.4byte 0x08058bd5
	.4byte 0x08058bed
	.4byte 0x08058b0d
	.4byte 0x08058c05
	.4byte 0x08058c11
	.4byte 0x08058c1d

	.global gUnknown_0830FBEC
gUnknown_0830FBEC: @ 830FBEC
	.4byte 0x08058ce9
	.4byte 0x08058cfd
	.4byte 0x08058d0d

	.global gUnknown_0830FBF8
gUnknown_0830FBF8: @ 830FBF8
	.4byte 0x08057855
	.4byte 0x08057869
	.4byte 0x0805787d
	.4byte 0x08057891
	.4byte 0x080578a5

	.global gUnknown_0830FC0C
gUnknown_0830FC0C: @ 830FC0C
	.incbin "baserom.gba", 0x0030fc0c, 0x8

	.global gUnknown_0830FC14
gUnknown_0830FC14: @ 830FC14
	.4byte 0x080590cd
	.4byte 0x080590f9
	.4byte 0x0805912d
	.4byte 0x08059165
	.4byte 0x080591c1
	.4byte 0x080591f5
	.4byte 0x080590c9
	.4byte 0x080590c9

	.global gUnknown_0830FC34
gUnknown_0830FC34: @ 830FC34
	.4byte 0x08056f9d
	.4byte 0x08056f85
	.4byte 0x08056f71
	.4byte 0x08056f5d

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
	.4byte 0x08056f9d
	.4byte 0x08056f85
	.4byte 0x08056f71
	.4byte 0x08056f5d

	.global gUnknown_0830FC88
gUnknown_0830FC88: @ 830FC88
	.4byte 0x08059e85
	.4byte 0x08059ea5
	.4byte 0x08059f41

	.global gUnknown_0830FC94
gUnknown_0830FC94: @ 830FC94
	.4byte 0x0805a001

	.global gUnknown_0830FC98
gUnknown_0830FC98: @ 830FC98
	.4byte 0x0805a0d9
	.4byte 0x0805a101
	.4byte 0x0805a179
	.4byte 0x0805a1b9

	.global gUnknown_0830FCA8
gUnknown_0830FCA8: @ 830FCA8
	.incbin "baserom.gba", 0x0030fca8, 0x4

	.global gUnknown_0830FCAC
gUnknown_0830FCAC: @ 830FCAC
	.incbin "baserom.gba", 0x0030fcac, 0x8

	.global gUnknown_0830FCB4
gUnknown_0830FCB4: @ 830FCB4
	.4byte 0x0805a3b5
	.4byte 0x0805a3d5
	.4byte 0x0805a46d
	.4byte 0x0805a491
	.4byte 0x0805a4d9
	.4byte 0x0805a56d
	.4byte 0x0805a5cd
	.4byte 0x0805a5f5
	.4byte 0x0805a64d
	.4byte 0x0805a6b5
	.4byte 0x0805a6dd
	.4byte 0x0805a7bd
	.4byte 0x0805a809
	.4byte 0x0805a859
	.4byte 0x0805a875
	.4byte 0x0805a915

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
	.4byte 0x0805c2f1
	.4byte 0x0805c32d
	.4byte 0x0805c365

@ 830FD48
	.include "data/graphics/field_objects/map_object_graphics.s"

@ 8368528
	.include "data/graphics/field_objects/field_effect_object_graphics.s"

	.global gUnknown_0836DA88
gUnknown_0836DA88: @ 836DA88
	.4byte 0x0805c885
	.4byte 0x0805cde9
	.4byte 0x0805c8ad
	.4byte 0x0805cf29
	.4byte 0x0805cf29
	.4byte 0x0805d0ad
	.4byte 0x0805d0ad
	.4byte 0x0805d231
	.4byte 0x0805d231
	.4byte 0x0805d231
	.4byte 0x0805d231
	.4byte 0x080587b5
	.4byte 0x0805d2d1
	.4byte 0x0805d4f5
	.4byte 0x0805d635
	.4byte 0x0805d775
	.4byte 0x0805d8b5
	.4byte 0x0805d9f5
	.4byte 0x0805db35
	.4byte 0x0805dc75
	.4byte 0x0805ddb5
	.4byte 0x0805def5
	.4byte 0x0805e035
	.4byte 0x0805e175
	.4byte 0x0805e279
	.4byte 0x0805e37d
	.4byte 0x0805e37d
	.4byte 0x0805e37d
	.4byte 0x0805e37d
	.4byte 0x0805e5dd
	.4byte 0x0805e669
	.4byte 0x0805e6f5
	.4byte 0x0805e781
	.4byte 0x0805e80d
	.4byte 0x0805e899
	.4byte 0x0805e925
	.4byte 0x0805e9b1
	.4byte 0x0805ea3d
	.4byte 0x0805eac9
	.4byte 0x0805eb55
	.4byte 0x0805ebe1
	.4byte 0x0805ec6d
	.4byte 0x0805ecf9
	.4byte 0x0805ed85
	.4byte 0x0805ee11
	.4byte 0x0805ee9d
	.4byte 0x0805ef29
	.4byte 0x0805efb5
	.4byte 0x0805f041
	.4byte 0x0805f0cd
	.4byte 0x0805f159
	.4byte 0x0805f1e5
	.4byte 0x0805f271
	.4byte 0x0805f2fd
	.4byte 0x0805f2fd
	.4byte 0x0805f2fd
	.4byte 0x0805f2fd
	.4byte 0x0805f989
	.4byte 0x0805fa05
	.4byte 0x0805f8e1
	.4byte 0x0805f8e1
	.4byte 0x0805f8e1
	.4byte 0x0805f8e1
	.4byte 0x0805fa75
	.4byte 0x0805fb21
	.4byte 0x0805fb21
	.4byte 0x0805fb21
	.4byte 0x0805fb21
	.4byte 0x0805fb91
	.4byte 0x0805fb91
	.4byte 0x0805fb91
	.4byte 0x0805fb91
	.4byte 0x0805fc01
	.4byte 0x0805fc01
	.4byte 0x0805fc01
	.4byte 0x0805fc01
	.4byte 0x0805fc71

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

	.global gUnknown_08375224
gUnknown_08375224: @ 8375224
	.4byte 0x0805c8f1
	.4byte 0x0805c905
	.4byte 0x0805c931
	.4byte 0x0805c96d
	.4byte 0x0805c98d
	.4byte 0x0805c9d9
	.4byte 0x0805ca09

	.global gUnknown_08375240
gUnknown_08375240: @ 8375240
	.incbin "baserom.gba", 0x00375240, 0x4

	.global gUnknown_08375244
gUnknown_08375244: @ 8375244
	.4byte 0x0805caad
	.4byte 0x0805cadd
	.4byte 0x0805caed
	.4byte 0x0805cb01
	.4byte 0x0805cb5d
	.4byte 0x0805cbb9
	.4byte 0x0805cc15
	.4byte 0x0805cc71
	.4byte 0x0805ccad
	.4byte 0x0805cce9
	.4byte 0x0805cd25

	.global gUnknown_08375270
gUnknown_08375270: @ 8375270
	.4byte 0x0805ce2d
	.4byte 0x0805ce41
	.4byte 0x0805ce6d
	.4byte 0x0805ceb1
	.4byte 0x0805cee1

	.global gUnknown_08375284
gUnknown_08375284: @ 8375284
	.4byte 0x0805cf6d
	.4byte 0x0805cf81
	.4byte 0x0805cfad
	.4byte 0x0805cfe9
	.4byte 0x0805d009
	.4byte 0x0805d055
	.4byte 0x0805d085

	.global gUnknown_083752A0
gUnknown_083752A0: @ 83752A0
	.incbin "baserom.gba", 0x003752a0, 0x4

	.global gUnknown_083752A4
gUnknown_083752A4: @ 83752A4
	.4byte 0x0805d0f1
	.4byte 0x0805d105
	.4byte 0x0805d131
	.4byte 0x0805d16d
	.4byte 0x0805d18d
	.4byte 0x0805d1d9
	.4byte 0x0805d209

	.global gUnknown_083752C0
gUnknown_083752C0: @ 83752C0
	.incbin "baserom.gba", 0x003752c0, 0x4

	.global gUnknown_083752C4
gUnknown_083752C4: @ 83752C4
	.4byte 0x0805d275
	.4byte 0x0805d2a1
	.4byte 0x0805d2c1

	.global gUnknown_083752D0
gUnknown_083752D0: @ 83752D0
	.4byte 0x0805d335
	.4byte 0x0805d3ed
	.4byte 0x0805d40d
	.4byte 0x0805d459
	.4byte 0x0805d4a9

	.global gUnknown_083752E4
gUnknown_083752E4: @ 83752E4
	.4byte 0x0805d539
	.4byte 0x0805d54d
	.4byte 0x0805d579
	.4byte 0x0805d5bd
	.4byte 0x0805d5ed

	.global gUnknown_083752F8
gUnknown_083752F8: @ 83752F8
	.4byte 0x0805d679
	.4byte 0x0805d68d
	.4byte 0x0805d6b9
	.4byte 0x0805d6fd
	.4byte 0x0805d72d

	.global gUnknown_0837530C
gUnknown_0837530C: @ 837530C
	.4byte 0x0805d7b9
	.4byte 0x0805d7cd
	.4byte 0x0805d7f9
	.4byte 0x0805d83d
	.4byte 0x0805d86d

	.global gUnknown_08375320
gUnknown_08375320: @ 8375320
	.incbin "baserom.gba", 0x00375320, 0x4

	.global gUnknown_08375324
gUnknown_08375324: @ 8375324
	.4byte 0x0805d8f9
	.4byte 0x0805d90d
	.4byte 0x0805d939
	.4byte 0x0805d97d
	.4byte 0x0805d9ad

	.global gUnknown_08375338
gUnknown_08375338: @ 8375338
	.incbin "baserom.gba", 0x00375338, 0x4

	.global gUnknown_0837533C
gUnknown_0837533C: @ 837533C
	.4byte 0x0805da39
	.4byte 0x0805da4d
	.4byte 0x0805da79
	.4byte 0x0805dabd
	.4byte 0x0805daed

	.global gUnknown_08375350
gUnknown_08375350: @ 8375350
	.incbin "baserom.gba", 0x00375350, 0x4

	.global gUnknown_08375354
gUnknown_08375354: @ 8375354
	.4byte 0x0805db79
	.4byte 0x0805db8d
	.4byte 0x0805dbb9
	.4byte 0x0805dbfd
	.4byte 0x0805dc2d

	.global gUnknown_08375368
gUnknown_08375368: @ 8375368
	.incbin "baserom.gba", 0x00375368, 0x4

	.global gUnknown_0837536C
gUnknown_0837536C: @ 837536C
	.4byte 0x0805dcb9
	.4byte 0x0805dccd
	.4byte 0x0805dcf9
	.4byte 0x0805dd3d
	.4byte 0x0805dd6d

	.global gUnknown_08375380
gUnknown_08375380: @ 8375380
	.incbin "baserom.gba", 0x00375380, 0x4

	.global gUnknown_08375384
gUnknown_08375384: @ 8375384
	.4byte 0x0805ddf9
	.4byte 0x0805de0d
	.4byte 0x0805de39
	.4byte 0x0805de7d
	.4byte 0x0805dead

	.global gUnknown_08375398
gUnknown_08375398: @ 8375398
	.incbin "baserom.gba", 0x00375398, 0x4

	.global gUnknown_0837539C
gUnknown_0837539C: @ 837539C
	.4byte 0x0805df39
	.4byte 0x0805df4d
	.4byte 0x0805df79
	.4byte 0x0805dfbd
	.4byte 0x0805dfed

	.global gUnknown_083753B0
gUnknown_083753B0: @ 83753B0
	.incbin "baserom.gba", 0x003753b0, 0x4

	.global gUnknown_083753B4
gUnknown_083753B4: @ 83753B4
	.4byte 0x0805e079
	.4byte 0x0805e08d
	.4byte 0x0805e0b9
	.4byte 0x0805e0fd
	.4byte 0x0805e12d

	.global gUnknown_083753C8
gUnknown_083753C8: @ 83753C8
	.incbin "baserom.gba", 0x003753c8, 0x4

	.global gUnknown_083753CC
gUnknown_083753CC: @ 83753CC
	.4byte 0x0805e1b9
	.4byte 0x0805e1e5
	.4byte 0x0805e209
	.4byte 0x0805e235

	.global gUnknown_083753DC
gUnknown_083753DC: @ 83753DC
	.incbin "baserom.gba", 0x003753dc, 0x8

	.global gUnknown_083753E4
gUnknown_083753E4: @ 83753E4
	.4byte 0x0805e2bd
	.4byte 0x0805e2e9
	.4byte 0x0805e30d
	.4byte 0x0805e339

	.global gUnknown_083753F4
gUnknown_083753F4: @ 83753F4
	.incbin "baserom.gba", 0x003753f4, 0x8

	.global gUnknown_083753FC
gUnknown_083753FC: @ 83753FC
	.4byte 0x0805e3c1
	.4byte 0x0805e3d5
	.4byte 0x0805e40d
	.4byte 0x0805e4c5

	.global gUnknown_0837540C
gUnknown_0837540C: @ 837540C
	.4byte 0x0805e4ed
	.4byte 0x0805e621
	.4byte 0x0805e5b5

	.global gUnknown_08375418
gUnknown_08375418: @ 8375418
	.incbin "baserom.gba", 0x00375418, 0x4

	.global gUnknown_0837541C
gUnknown_0837541C: @ 837541C
	.4byte 0x0805e4ed
	.4byte 0x0805e6ad
	.4byte 0x0805e5b5

	.global gUnknown_08375428
gUnknown_08375428: @ 8375428
	.4byte 0x02010304

	.global gUnknown_0837542C
gUnknown_0837542C: @ 837542C
	.4byte 0x0805e4ed
	.4byte 0x0805e739
	.4byte 0x0805e5b5

	.global gUnknown_08375438
gUnknown_08375438: @ 8375438
	.incbin "baserom.gba", 0x00375438, 0x4

	.global gUnknown_0837543C
gUnknown_0837543C: @ 837543C
	.4byte 0x0805e4ed
	.4byte 0x0805e7c5
	.4byte 0x0805e5b5

	.global gUnknown_08375448
gUnknown_08375448: @ 8375448
	.incbin "baserom.gba", 0x00375448, 0x4

	.global gUnknown_0837544C
gUnknown_0837544C: @ 837544C
	.4byte 0x0805e4ed
	.4byte 0x0805e851
	.4byte 0x0805e5b5

	.global gUnknown_08375458
gUnknown_08375458: @ 8375458
	.incbin "baserom.gba", 0x00375458, 0x4

	.global gUnknown_0837545C
gUnknown_0837545C: @ 837545C
	.4byte 0x0805e4ed
	.4byte 0x0805e8dd
	.4byte 0x0805e5b5

	.global gUnknown_08375468
gUnknown_08375468: @ 8375468
	.4byte 0x02010403

	.global gUnknown_0837546C
gUnknown_0837546C: @ 837546C
	.4byte 0x0805e4ed
	.4byte 0x0805e969
	.4byte 0x0805e5b5

	.global gUnknown_08375478
gUnknown_08375478: @ 8375478
	.4byte 0x0805e4ed
	.4byte 0x0805e9f5
	.4byte 0x0805e5b5

	.global gUnknown_08375484
gUnknown_08375484: @ 8375484
	.incbin "baserom.gba", 0x00375484, 0x4

	.global gUnknown_08375488
gUnknown_08375488: @ 8375488
	.4byte 0x0805e4ed
	.4byte 0x0805ea81
	.4byte 0x0805e5b5

	.global gUnknown_08375494
gUnknown_08375494: @ 8375494
	.incbin "baserom.gba", 0x00375494, 0x4

	.global gUnknown_08375498
gUnknown_08375498: @ 8375498
	.4byte 0x0805e4ed
	.4byte 0x0805eb0d
	.4byte 0x0805e5b5

	.global gUnknown_083754A4
gUnknown_083754A4: @ 83754A4
	.incbin "baserom.gba", 0x003754a4, 0x4

	.global gUnknown_083754A8
gUnknown_083754A8: @ 83754A8
	.4byte 0x0805e4ed
	.4byte 0x0805eb99
	.4byte 0x0805e5b5

	.global gUnknown_083754B4
gUnknown_083754B4: @ 83754B4
	.incbin "baserom.gba", 0x003754b4, 0x4

	.global gUnknown_083754B8
gUnknown_083754B8: @ 83754B8
	.4byte 0x0805e4ed
	.4byte 0x0805ec25
	.4byte 0x0805e5b5

	.global gUnknown_083754C4
gUnknown_083754C4: @ 83754C4
	.4byte 0x02030401

	.global gUnknown_083754C8
gUnknown_083754C8: @ 83754C8
	.4byte 0x0805e4ed
	.4byte 0x0805ecb1
	.4byte 0x0805e5b5

	.global gUnknown_083754D4
gUnknown_083754D4: @ 83754D4
	.incbin "baserom.gba", 0x003754d4, 0x4

	.global gUnknown_083754D8
gUnknown_083754D8: @ 83754D8
	.4byte 0x0805e4ed
	.4byte 0x0805ed3d
	.4byte 0x0805e5b5

	.global gUnknown_083754E4
gUnknown_083754E4: @ 83754E4
	.incbin "baserom.gba", 0x003754e4, 0x4

	.global gUnknown_083754E8
gUnknown_083754E8: @ 83754E8
	.4byte 0x0805e4ed
	.4byte 0x0805edc9
	.4byte 0x0805e5b5

	.global gUnknown_083754F4
gUnknown_083754F4: @ 83754F4
	.incbin "baserom.gba", 0x003754f4, 0x4

	.global gUnknown_083754F8
gUnknown_083754F8: @ 83754F8
	.4byte 0x0805e4ed
	.4byte 0x0805ee55
	.4byte 0x0805e5b5

	.global gUnknown_08375504
gUnknown_08375504: @ 8375504
	.incbin "baserom.gba", 0x00375504, 0x4

	.global gUnknown_08375508
gUnknown_08375508: @ 8375508
	.4byte 0x0805e4ed
	.4byte 0x0805eee1
	.4byte 0x0805e5b5

	.global gUnknown_08375514
gUnknown_08375514: @ 8375514
	.incbin "baserom.gba", 0x00375514, 0x4

	.global gUnknown_08375518
gUnknown_08375518: @ 8375518
	.4byte 0x0805e4ed
	.4byte 0x0805ef6d
	.4byte 0x0805e5b5

	.global gUnknown_08375524
gUnknown_08375524: @ 8375524
	.incbin "baserom.gba", 0x00375524, 0x4

	.global gUnknown_08375528
gUnknown_08375528: @ 8375528
	.4byte 0x0805e4ed
	.4byte 0x0805eff9
	.4byte 0x0805e5b5

	.global gUnknown_08375534
gUnknown_08375534: @ 8375534
	.incbin "baserom.gba", 0x00375534, 0x4

	.global gUnknown_08375538
gUnknown_08375538: @ 8375538
	.4byte 0x0805e4ed
	.4byte 0x0805f085
	.4byte 0x0805e5b5

	.global gUnknown_08375544
gUnknown_08375544: @ 8375544
	.incbin "baserom.gba", 0x00375544, 0x4

	.global gUnknown_08375548
gUnknown_08375548: @ 8375548
	.4byte 0x0805e4ed
	.4byte 0x0805f111
	.4byte 0x0805e5b5

	.global gUnknown_08375554
gUnknown_08375554: @ 8375554
	.incbin "baserom.gba", 0x00375554, 0x4

	.global gUnknown_08375558
gUnknown_08375558: @ 8375558
	.4byte 0x0805e4ed
	.4byte 0x0805f19d
	.4byte 0x0805e5b5

	.global gUnknown_08375564
gUnknown_08375564: @ 8375564
	.incbin "baserom.gba", 0x00375564, 0x4

	.global gUnknown_08375568
gUnknown_08375568: @ 8375568
	.4byte 0x0805e4ed
	.4byte 0x0805f229
	.4byte 0x0805e5b5

	.global gUnknown_08375574
gUnknown_08375574: @ 8375574
	.incbin "baserom.gba", 0x00375574, 0x4

	.global gUnknown_08375578
gUnknown_08375578: @ 8375578
	.4byte 0x0805e4ed
	.4byte 0x0805f2b5
	.4byte 0x0805e5b5

	.global gUnknown_08375584
gUnknown_08375584: @ 8375584
	.4byte 0x02030104

	.global gUnknown_08375588
gUnknown_08375588: @ 8375588
	.4byte 0x0805f341
	.4byte 0x0805f365
	.4byte 0x0805f3c5

	.global gUnknown_08375594
gUnknown_08375594: @ 8375594
	.4byte 0x0805f3ed
	.4byte 0x0805f3f1
	.4byte 0x0805f439
	.4byte 0x0805f4f1
	.4byte 0x0805f5a9
	.4byte 0x0805f661
	.4byte 0x0805f719
	.4byte 0x0805f761
	.4byte 0x0805f819
	.4byte 0x0805f3ed
	.4byte 0x0805f3ed

	.global gUnknown_083755C0
gUnknown_083755C0: @ 83755C0
	.4byte 0x0805f341
	.4byte 0x0805f925
	.4byte 0x0805f3c5

	.global gUnknown_083755CC
gUnknown_083755CC: @ 83755CC
	.4byte 0x0805faf9

	.global gUnknown_083755D0
gUnknown_083755D0: @ 83755D0
	.4byte 0x0805fb65
	.4byte 0x0805fb05

	.global gUnknown_083755D8
gUnknown_083755D8: @ 83755D8
	.4byte 0x0805fbd5
	.4byte 0x0805fb05

	.global gUnknown_083755E0
gUnknown_083755E0: @ 83755E0
	.4byte 0x0805fc45
	.4byte 0x0805fb05

	.global gUnknown_083755E8
gUnknown_083755E8: @ 83755E8
	.4byte 0x0805fcb5
	.4byte 0x0805fce9
	.4byte 0x0805fd09

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
	.4byte 0x08057631
	.4byte 0x08057611
	.4byte 0x080575ed
	.4byte 0x080575c9

	.global gUnknown_08375694
gUnknown_08375694: @ 8375694
	.4byte 0x08057611
	.4byte 0x08057631
	.4byte 0x080575c9
	.4byte 0x080575ed

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
	.4byte 0x083759a0
	.4byte 0x083759a8
	.4byte 0x083759b0
	.4byte 0x083759b8
	.4byte 0x083759d4
	.4byte 0x083759e0
	.4byte 0x083759ec
	.4byte 0x083759f8
	.4byte 0x08375a04
	.4byte 0x08375a10
	.4byte 0x08375a1c
	.4byte 0x08375a28
	.4byte 0x08375a40
	.4byte 0x08375a4c
	.4byte 0x08375a58
	.4byte 0x08375a64
	.4byte 0x08375a70
	.4byte 0x08375a7c
	.4byte 0x08375a88
	.4byte 0x08375a94
	.4byte 0x08375aa0
	.4byte 0x08375aac
	.4byte 0x08375ab8
	.4byte 0x08375ac4
	.4byte 0x08375ad0
	.4byte 0x08375adc
	.4byte 0x08375ae8
	.4byte 0x08375af4
	.4byte 0x08375b00
	.4byte 0x08375b0c
	.4byte 0x08375b18
	.4byte 0x08375b24
	.4byte 0x08375b30
	.4byte 0x08375b3c
	.4byte 0x08375b48
	.4byte 0x08375b54
	.4byte 0x08375b60
	.4byte 0x08375b6c
	.4byte 0x08375b78
	.4byte 0x08375b84
	.4byte 0x08375b90
	.4byte 0x08375b9c
	.4byte 0x08375ba8
	.4byte 0x08375bb4
	.4byte 0x08375bc0
	.4byte 0x08375bcc
	.4byte 0x08375bd8
	.4byte 0x08375be4
	.4byte 0x08375bf0
	.4byte 0x08375bfc
	.4byte 0x08375c08
	.4byte 0x08375c14
	.4byte 0x08375c20
	.4byte 0x08375c2c
	.4byte 0x08375c38
	.4byte 0x08375c44
	.4byte 0x08375c50
	.4byte 0x08375c5c
	.4byte 0x08375c68
	.4byte 0x08375c74
	.4byte 0x08375c80
	.4byte 0x08375c8c
	.4byte 0x08375c98
	.4byte 0x08375ca0
	.4byte 0x08375ca8
	.4byte 0x08375cb0
	.4byte 0x08375cb8
	.4byte 0x08375cc4
	.4byte 0x08375cd0
	.4byte 0x08375cdc
	.4byte 0x08375ce8
	.4byte 0x08375cf4
	.4byte 0x08375d00
	.4byte 0x08375d0c
	.4byte 0x08375d18
	.4byte 0x08375d24
	.4byte 0x08375d30
	.4byte 0x08375d3c
	.4byte 0x08375d48
	.4byte 0x08375d50
	.4byte 0x08375d5c
	.4byte 0x08375d64
	.4byte 0x08375d6c
	.4byte 0x08375d74
	.4byte 0x08375d7c
	.4byte 0x08375d84
	.4byte 0x08375d8c
	.4byte 0x08375d94
	.4byte 0x08375d9c
	.4byte 0x08375da4
	.4byte 0x08375db0
	.4byte 0x08375dc0
	.4byte 0x08375dd0
	.4byte 0x08375dd8
	.4byte 0x08375de0
	.4byte 0x08375de8
	.4byte 0x08375df0
	.4byte 0x08375dfc
	.4byte 0x08375e08
	.4byte 0x08375e10
	.4byte 0x08375e18
	.4byte 0x08375e20
	.4byte 0x08375e28
	.4byte 0x08375e34
	.4byte 0x08375e40
	.4byte 0x08375e4c
	.4byte 0x08375e58
	.4byte 0x08375e64
	.4byte 0x08375e70
	.4byte 0x08375e7c
	.4byte 0x08375eb8
	.4byte 0x08375ec4
	.4byte 0x08375ed0
	.4byte 0x08375edc
	.4byte 0x08375ee8
	.4byte 0x08375ef4
	.4byte 0x08375f00
	.4byte 0x08375f0c
	.4byte 0x08375f18
	.4byte 0x08375f24
	.4byte 0x08375f30
	.4byte 0x08375f3c
	.4byte 0x08375f48
	.4byte 0x08375f54
	.4byte 0x08375f60
	.4byte 0x08375f6c
	.4byte 0x08375f78
	.4byte 0x08375f84
	.4byte 0x08375f90
	.4byte 0x08375f9c
	.4byte 0x08375fa8
	.4byte 0x08375fb4
	.4byte 0x08375fc0
	.4byte 0x08375fcc
	.4byte 0x08375fd8
	.4byte 0x08375fe4
	.4byte 0x08375ff0
	.4byte 0x08375ffc
	.4byte 0x08060ce1
	.4byte 0x08063475
	.4byte 0x08060cf1
	.4byte 0x08063475
	.4byte 0x08060d01
	.4byte 0x08063475
	.4byte 0x08060d11
	.4byte 0x08063475

	.global gUnknown_083759C0
gUnknown_083759C0: @ 83759C0
	.4byte 0x0805fd49
	.4byte 0x0805fd59
	.4byte 0x0805fd59
	.4byte 0x0805fd69
	.4byte 0x0805fd79
	.4byte 0x08060f3d
	.4byte 0x08060f5d
	.4byte 0x08063475
	.4byte 0x08060f7d
	.4byte 0x08060f9d
	.4byte 0x08063475
	.4byte 0x08060fbd
	.4byte 0x08060fdd
	.4byte 0x08063475
	.4byte 0x08060ffd
	.4byte 0x0806101d
	.4byte 0x08063475
	.4byte 0x0806103d
	.4byte 0x0806105d
	.4byte 0x08063475
	.4byte 0x0806107d
	.4byte 0x0806109d
	.4byte 0x08063475
	.4byte 0x080610bd
	.4byte 0x080610dd
	.4byte 0x08063475
	.4byte 0x080610fd
	.4byte 0x0806111d
	.4byte 0x08063475

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
	.4byte 0x080573d1
	.4byte 0x080573e5
	.4byte 0x080573bd
	.4byte 0x08056f39
	.4byte 0x08057525
	.4byte 0x08056d9d

	.global gUnknown_08376028
gUnknown_08376028: @ 8376028
	.incbin "baserom.gba", 0x00376028, 0x18

	.global gUnknown_08376040
gUnknown_08376040: @ 8376040
	.4byte 0x08056e01
	.4byte 0x08056ded
	.4byte 0x08056dd9
	.4byte 0x08056dc5

	.global gUnknown_08376050
gUnknown_08376050: @ 8376050
	.incbin "baserom.gba", 0x00376050, 0x10

	.global gUnknown_08376060
gUnknown_08376060: @ 8376060
	.4byte 0x02020202 @ are these even pointers?
	.4byte 0x02010201
	.4byte 0x02010201
	.4byte 0x02000001

	.global gUnknown_08376070
gUnknown_08376070: @ 8376070
	.incbin "baserom.gba", 0x00376070, 0x10

	.global gUnknown_08376080
gUnknown_08376080: @ 8376080
	.4byte 0x08063ff9
	.4byte 0x08063ffd
	.4byte 0x0806404d

	.global gUnknown_0837608C
gUnknown_0837608C: @ 837608C
	.incbin "baserom.gba", 0x0037608c, 0x4

	.global gUnknown_08376090
gUnknown_08376090: @ 8376090
	.incbin "baserom.gba", 0x00376090, 0x10

	.global gUnknown_083760A0
gUnknown_083760A0: @ 83760A0
	.4byte 0x08063e49
	.4byte 0x08063e95
	.4byte 0x08063ee1
	.4byte 0x08063f2d
	.4byte 0x08063f79
	.4byte 0x08063f85
	.4byte 0x08063f91
	.4byte 0x08063fa1
	.4byte 0x08063fcd
	.4byte 0x0806409d
	.4byte 0x080640a9
	.4byte 0x080640b9
	.4byte 0x080640c9
	.4byte 0x08064121
	.4byte 0x08064149
	.4byte 0x08064179
	.4byte 0x080641a9
	.4byte 0x080641d9
	.4byte 0x080641e9
	.4byte 0x080641f9
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806454d
	.4byte 0x0806456d
	.4byte 0x0806456d
	.4byte 0x0806456d
	.4byte 0x0806456d
	.4byte 0x0806456d
	.4byte 0x0806456d
	.4byte 0x0806456d
	.4byte 0x0806456d
	.4byte 0x0806456d
	.4byte 0x08064591
	.4byte 0x08064591
	.4byte 0x0806456d
	.4byte 0x08064591
	.4byte 0x08064591
	.4byte 0x080645b9
	.4byte 0x080645b9
	.4byte 0x080645b9
	.4byte 0x080645b9
	.4byte 0x080645dd
	.4byte 0x080645dd

	.global gUnknown_08376180
gUnknown_08376180: @ 8376180
	.4byte 0x083760f0
	.4byte 0x08376130
	.4byte 0x08376150
	.4byte 0x08376168
	.4byte 0x08376178

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
	.incbin "baserom.gba", 0x003762d8, 0x4

	.global gUnknown_083762DC
gUnknown_083762DC: @ 83762DC
	.incbin "baserom.gba", 0x003762dc, 0x14

	.global gUnknown_083762F0
gUnknown_083762F0: @ 83762F0
	.4byte 0x020231cc
	.4byte 0x020232cc
	.4byte 0x020233cc

	.global gUnknown_083762FC
gUnknown_083762FC: @ 83762FC
	.incbin "baserom.gba", 0x003762fc, 0x68

	.global gUnknown_08376364
gUnknown_08376364: @ 8376364
	.4byte 0x080695dd
	.4byte 0x08069f65
	.4byte 0x08069aa1
	.4byte 0x08069865
	.4byte 0x08069dd5
	.4byte 0x080c7701
	.4byte 0x080bcf1d
	.4byte 0x0806a07d

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

	.global gUnknown_08376D24
gUnknown_08376D24: @ 8376D24
	.4byte SystemText_Pokedex
	.4byte 0x08071419
	.4byte SystemText_Pokemon
	.4byte 0x0807144d
	.4byte SystemText_BAG
	.4byte 0x08071479
	.4byte SystemText_Pokenav
	.4byte 0x080714a5
	.4byte SystemText_Player
	.4byte 0x080714d1
	.4byte SystemText_Save
	.4byte 0x080714fd
	.4byte SystemText_Option
	.4byte 0x08071519
	.4byte SystemText_Exit
	.4byte 0x08071555
	.4byte SystemText_Retire
	.4byte 0x08071561
	.4byte SystemText_Player @ duplicate?
	.4byte 0x08071571

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
Unknown_837B5C4:
	.4byte 0x0837adc4
	.4byte 0x0837aec4
	.4byte 0x0837afc4
	.4byte 0x0837b0c4
	.4byte 0x0837b1c4
	.4byte 0x0837b2c4
	.4byte 0x0837b3c4
	.4byte 0x0837b4c4
Unknown_837B5E4:
	.incbin "baserom.gba", 0x0037b5e4, 0x200
Unknown_837B7E4:
	.incbin "baserom.gba", 0x0037b7e4, 0x300

	.global gUnknown_0837BAE4
gUnknown_0837BAE4: @ 837BAE4
	.incbin "baserom.gba", 0x0037bae4, 0x20

	.global gUnknown_0837BB04
gUnknown_0837BB04: @ 837BB04
	.incbin "baserom.gba", 0x0037bb04, 0x20

	.global gUnknown_0837BB24
gUnknown_0837BB24: @ 837BB24
	.4byte 0x0837b5e4
	.4byte 0x0837b5e4
	.4byte 0x0837b664
	.4byte 0x0837b6e4
	.4byte 0x0837b764
	.4byte 0x0837b764
	.4byte 0x0837b764
	.4byte 0x0837b764
	.4byte 0x0837b764
	.4byte 0x0837b764
	.4byte 0x0837b6e4
	.4byte 0x0837b664

	.global gUnknown_0837BB54
gUnknown_0837BB54: @ 837BB54
	.4byte 0x0837b864
	.4byte 0x0837b864
	.4byte 0x0837b8e4
	.4byte 0x0837b964
	.4byte 0x0837b9e4
	.4byte 0x0837b9e4
	.4byte 0x0837b9e4
	.4byte 0x0837b9e4
	.4byte 0x0837b9e4
	.4byte 0x0837b9e4
	.4byte 0x0837b964
	.4byte 0x0837b8e4

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
	.incbin "baserom.gba", 0x0037c95c, 0x120

	.global gUnknown_0837CA7C
gUnknown_0837CA7C: @ 837CA7C
Unknown_837CA7C:
	.4byte 0x0837c97c
	.4byte 0x0837c9fc
Unknown_837CA84:
	.incbin "baserom.gba", 0x0037ca84, 0x180
Unknown_837CC04:
	.incbin "baserom.gba", 0x0037cc04, 0x180
Unknown_837CD84:
	.incbin "baserom.gba", 0x0037cd84, 0x900

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

	.global gUnknown_0837D83C
gUnknown_0837D83C: @ 837D83C
	.4byte Unknown_837D79C
	.4byte Unknown_837D7BC
	.4byte Unknown_837D7DC
	.4byte Unknown_837D7FC

	.global gUnknown_0837D84C
gUnknown_0837D84C: @ 837D84C
	.incbin "baserom.gba", 0x0037d84c, 0x428

	.global gUnknown_0837DC74
gUnknown_0837DC74: @ 837DC74
Unknown_837DC74:
	.4byte 0x0837d854
	.4byte 0x0837da54
Unknown_837DD7C:
	.incbin "baserom.gba", 0x0037dc7c, 0x120
Unknown_837DD9C:
	.incbin "baserom.gba", 0x0037dd9c, 0x140

	.global gUnknown_0837DEDC
gUnknown_0837DEDC: @ 837DEDC
	.4byte Unknown_837DD7C
	.4byte Unknown_837DD9C

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

	.global gUnknown_0837F4B8
gUnknown_0837F4B8: @ 837F4B8
	.4byte 0x08075a11
	.4byte 0x08075a79
	.4byte 0x08075ac5
	.4byte 0x08075bb9
	.4byte 0x08075c35
	.4byte 0x08075c75
	.4byte 0x08075ca9
	.4byte 0x08075cad
	.4byte 0x08075cb1
	.4byte 0x08075db9
	.4byte 0x08075de1
	.4byte 0x0807665d
	.4byte 0x08076a3d
	.4byte 0x08076aa1
	.4byte 0x08076abd
	.4byte 0x08076af1
	.4byte 0x08076b05
	.4byte 0x08076b39
	.4byte 0x08076b79
	.4byte 0x08076bbd
	.4byte 0x08076c09
	.4byte 0x08076ecd
	.4byte 0x08076f11
	.4byte 0x08076f45
	.4byte 0x08076f79
	.4byte 0x0807716d
	.4byte 0x080771a5
	.4byte 0x080771d1
	.4byte 0x08077475
	.4byte 0x08077559
	.4byte 0x08076a79
	.4byte 0x08077611
	.4byte 0x08077685
	.4byte 0x08077709
	.4byte 0x080767c5
	.4byte 0x080768d1
	.4byte 0x0807775d
	.4byte 0x08076c4d
	.4byte 0x08077321
	.4byte 0x080773b5
	.4byte 0x0807779d
	.4byte 0x08077809
	.4byte 0x0807784d
	.4byte 0x080778d1
	.4byte 0x0807790d
	.4byte 0x0807794d
	.4byte 0x080779fd
	.4byte 0x08077a95

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
	.4byte 0x0202f7e8

	.global gUnknown_08396FC8
gUnknown_08396FC8: @ 8396FC8
	.4byte 0x0807cae9
	.4byte 0x0807cb09
	.4byte 0x0807cae9
	.4byte 0x0807cb0d
	.4byte 0x0807de79
	.4byte 0x0807def5
	.4byte 0x0807dec5
	.4byte 0x0807df55
	.4byte 0x0807df9d
	.4byte 0x0807dfcd
	.4byte 0x0807dfc1
	.4byte 0x0807dfd1
	.4byte 0x0807e365
	.4byte 0x0807e401
	.4byte 0x0807e3d1
	.4byte 0x0807e461
	.4byte 0x0807e9c9
	.4byte 0x0807ea85
	.4byte 0x0807ea19
	.4byte 0x0807eac1
	.4byte 0x0807ee81
	.4byte 0x0807efc1
	.4byte 0x0807eef5
	.4byte 0x0807f34d
	.4byte 0x0807f49d
	.4byte 0x0807f52d
	.4byte 0x0807f4fd
	.4byte 0x0807f5ed
	.4byte 0x0807f7f9
	.4byte 0x0807f889
	.4byte 0x0807f859
	.4byte 0x0807f935
	.4byte 0x0807fe9d
	.4byte 0x0807ff4d
	.4byte 0x0807ff1d
	.4byte 0x0807ffc9
	.4byte 0x0807fb25
	.4byte 0x0807fbd9
	.4byte 0x0807fba9
	.4byte 0x0807fc3d
	.4byte 0x0807f49d
	.4byte 0x0807f52d
	.4byte 0x0807f4fd
	.4byte 0x0807f5ed
	.4byte 0x08080431
	.4byte 0x0808046d
	.4byte 0x08080461
	.4byte 0x08080471
	.4byte 0x0807e111
	.4byte 0x0807e175
	.4byte 0x0807e145
	.4byte 0x0807e259
	.4byte 0x0807ef25
	.4byte 0x0807efc1
	.4byte 0x0807ef91
	.4byte 0x0807f34d
	.4byte 0x08080475
	.4byte 0x080804f9
	.4byte 0x080804c9
	.4byte 0x0808056d

	.global gUnknown_083970B8
gUnknown_083970B8: @ 83970B8
	.4byte 0x0807cc25
	.4byte 0x0807ccad
	.4byte 0x0807ceb9
	.4byte 0x0807ceb9

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

	.global gUnknown_0839B488
gUnknown_0839B488: @ 839B488
	.4byte 0x08084109
	.4byte 0x0808414d
	.4byte 0x08084191
	.4byte 0x080841d5

	.global gUnknown_0839B498
gUnknown_0839B498: @ 839B498
	.4byte 0x08084395
	.4byte 0x08084399
	.4byte 0x080843dd
	.4byte 0x0808441d
	.4byte 0x08084479
	.4byte 0x08084535
	.4byte 0x08084579
	.4byte 0x080845ad
	.4byte 0x080845c9
	.4byte 0x080845fd
	.4byte 0x08084655
	.4byte 0x080846c9

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

	.global gUnknown_0839F0D4
gUnknown_0839F0D4: @ 839F0D4
	.4byte 0x080856b1
	.4byte 0x080856c5
	.4byte 0x080856d9
	.4byte 0x080856ed
	.4byte 0x08085701
	.4byte 0x08085705
	.4byte 0x0808572d
	.4byte 0x08085751

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
	.4byte 0x08085df5
	.4byte 0x08085e31
	.4byte 0x08085e6d
	.4byte 0x08085e95

	.global gUnknown_0839F278
gUnknown_0839F278: @ 839F278
	.4byte 0x08085f41
	.4byte 0x08085fb5
	.4byte 0x08085fe5
	.4byte 0x0808600d

	.global gUnknown_0839F288
gUnknown_0839F288: @ 839F288
	.4byte 0x080860bd
	.4byte 0x08086155
	.4byte 0x08086189
	.4byte 0x080862c9
	.4byte 0x080863bd
	.4byte 0x080863d9
	.4byte 0x080863e1
	.4byte 0x08086405

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
	.4byte 0x080867ad
	.4byte 0x08086855
	.4byte 0x08086871
	.4byte 0x080868e5
	.4byte 0x0808699d
	.4byte 0x080869b9
	.4byte 0x080869f9

	.global gUnknown_0839F2E8
gUnknown_0839F2E8: @ 839F2E8
	.4byte 0x08086aa1
	.4byte 0x08086ac1
	.4byte 0x08086b31
	.4byte 0x08086b55
	.4byte 0x08086b65
	.4byte 0x08086b89

	.global gUnknown_0839F300
gUnknown_0839F300: @ 839F300
	.4byte 0x08086cf5
	.4byte 0x08086d71
	.4byte 0x08086db1
	.4byte 0x08086e11
	.4byte 0x08086e51
	.4byte 0x08086eb1
	.4byte 0x08086ed5

	.global gUnknown_0839F31C
gUnknown_0839F31C: @ 839F31C
	.4byte 0x08086fb1
	.4byte 0x08086fd1
	.4byte 0x0808700d
	.4byte 0x08087031
	.4byte 0x08087059

	.global gUnknown_0839F330
gUnknown_0839F330: @ 839F330
	.4byte 0x08087125
	.4byte 0x08087139
	.4byte 0x08087161

	.global gUnknown_0839F33C
gUnknown_0839F33C: @ 839F33C
	.4byte 0x0808722d
	.4byte 0x08087265
	.4byte 0x08087299
	.4byte 0x080872e5
	.4byte 0x080873d9
	.4byte 0x080873f5

	.global gUnknown_0839F354
gUnknown_0839F354: @ 839F354
	.4byte 0x080874cd
	.4byte 0x080874fd
	.4byte 0x08087549
	.4byte 0x0808759d

	.global gUnknown_0839F364
gUnknown_0839F364: @ 839F364
	.4byte 0x080876c9
	.4byte 0x080876f9
	.4byte 0x08087775
	.4byte 0x080877ad
	.4byte 0x080877d5

	.global gUnknown_0839F378
gUnknown_0839F378: @ 839F378
	.4byte 0x080878f5
	.4byte 0x08087915

	.global gUnknown_0839F380
gUnknown_0839F380: @ 839F380
	.incbin "baserom.gba", 0x0039f380, 0x8

	.global gUnknown_0839F388
gUnknown_0839F388: @ 839F388
	.4byte 0x08087aa5
	.4byte 0x08087ac9

	.global gUnknown_0839F390
gUnknown_0839F390: @ 839F390
	.4byte 0x08087bed
	.4byte 0x08087c15
	.4byte 0x08087ca5
	.4byte 0x08087d79

	.global gUnknown_0839F3A0
gUnknown_0839F3A0: @ 839F3A0
	.4byte 0x08087e4d
	.4byte 0x08087ed9
	.4byte 0x08087fdd

	.global gUnknown_0839F3AC
gUnknown_0839F3AC: @ 839F3AC
	.4byte 0x08088151
	.4byte 0x080881c1
	.4byte 0x08088229
	.4byte 0x080882b5
	.4byte 0x080882e5
	.4byte 0x08088339
	.4byte 0x08088381

	.global gUnknown_0839F3C8
gUnknown_0839F3C8: @ 839F3C8
	.4byte 0x080884ad
	.4byte 0x080884e9
	.4byte 0x08088555
	.4byte 0x080885a9
	.4byte 0x080885d9
	.4byte 0x0808860d
	.4byte 0x0808862d

	.global gUnknown_0839F3E4
gUnknown_0839F3E4: @ 839F3E4
	.4byte 0x08088985
	.4byte 0x080889e5
	.4byte 0x08088a31
	.4byte 0x08088a79
	.4byte 0x08088af5

	.global gUnknown_0839F3F8
gUnknown_0839F3F8: @ 839F3F8
Unknown_839F3F8:
	.4byte 0x08088ca1
	.4byte 0x08088cf9
	.4byte 0x08088d3d
	.4byte 0x08088d95
	.4byte 0x08088dd9
	.4byte 0x08088e2d
	.4byte 0x08088eb5
	.4byte 0x08088f11
	.4byte 0x08088f31
Unknown_839F41C:
	.incbin "baserom.gba", 0x0039f41c, 0x18
Unknown_839F434:
	.incbin "baserom.gba", 0x0039f434, 0x18

	.global gUnknown_0839F44C
gUnknown_0839F44C: @ 839F44C
	.4byte Unknown_839F41C
	.4byte Unknown_839F434

	.global gUnknown_0839F454
gUnknown_0839F454: @ 839F454
	.4byte 0x080892a1
	.4byte 0x08089355
	.4byte 0x080893c1
	.4byte 0x08089415
	.4byte 0x0808948d
	.4byte 0x080894c5
	.4byte 0x080894fd

	.global gUnknown_0839F470
gUnknown_0839F470: @ 839F470
	.incbin "baserom.gba", 0x0039f470, 0x24

	.global gUnknown_0839F494
gUnknown_0839F494: @ 839F494
	.4byte OtherText_Summary
	.4byte 0x08089fcd
	.4byte OtherText_Switch2
	.4byte 0x0808a02d
	.4byte OtherText_Item
	.4byte 0x0808a141
	.4byte OtherText_Cancel2
	.4byte 0x0808a919
	.4byte OtherText_Give2
	.4byte 0x0808a631
	.4byte OtherText_Take2
	.4byte 0x0808a689
	.4byte OtherText_Take
	.4byte 0x0808a6b9
	.4byte OtherText_Mail
	.4byte 0x0808a6e9
	.4byte OtherText_Read2
	.4byte 0x0808a811
	.4byte OtherText_Cancel2
	.4byte 0x0808a939
	.4byte 0x081f83e3
	.4byte 0x0808a985
	.4byte 0x081f8aa4
	.4byte 0x0808a985
	.4byte 0x081f8fc5
	.4byte 0x0808a985
	.4byte 0x081f86ae
	.4byte 0x0808a985
	.4byte 0x081f8605
	.4byte 0x0808a985
	.4byte 0x081f8417
	.4byte 0x0808a985
	.4byte 0x081f91e7
	.4byte 0x0808a985
	.4byte 0x081f8993
	.4byte 0x0808a985
	.4byte 0x081f8834
	.4byte 0x0808a985
	.4byte 0x081f87bf
	.4byte 0x0808a985
	.4byte 0x081f91da
	.4byte 0x0808a985
	.4byte 0x081f8db0
	.4byte 0x0808a985
	.4byte 0x081f89fb
	.4byte 0x0808a985
	.4byte 0x081f8ece
	.4byte 0x0808a985

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
	.incbin "baserom.gba", 0x003b4ec4, 0x20

@ 83B4EE4
	.include "data/graphics/pokemon/footprint_table.s"

	.global gUnknown_083B5558
gUnknown_083B5558: @ 83B5558
	.incbin "baserom.gba", 0x003b5558, 0x2c

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

	.global gUnknown_083B5EBC
gUnknown_083B5EBC: @ 83B5EBC
	.4byte 0x08093865
	.4byte 0x080938a9
	.4byte 0x080938cd
	.4byte 0x08093919
	.4byte 0x08093939
	.4byte 0x08093955
	.4byte 0x08093981

	.global gUnknown_083B5ED8
gUnknown_083B5ED8: @ 83B5ED8
	.4byte 0x08093aa1
	.4byte 0x08093af1
	.4byte 0x08093c0d
	.4byte 0x08093c39
	.4byte 0x08093d51

	.global gUnknown_083B5EEC
gUnknown_083B5EEC: @ 83B5EEC
	.4byte 0x08e8cac0
	.4byte 0x08e8d4c0

	.global gUnknown_083B5EF4
gUnknown_083B5EF4: @ 83B5EF4
	.incbin "baserom.gba", 0x003b5ef4, 0x4

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

	.global gUnknown_083B6DB8
gUnknown_083B6DB8: @ 83B6DB8
	.4byte 0x02039360

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
	.4byte 0x0809b151
	.4byte 0x0809b1d9
	.4byte 0x0809b24d

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
	.incbin "baserom.gba", 0x003bc5e8, 0x44

	.global gUnknown_083BC62C
gUnknown_083BC62C: @ 83BC62C
Unknown_83BC62C:
	.4byte 0x083bc5f0
	.4byte 0x083bc5fc
	.4byte 0x083bc608
	.4byte 0x083bc614
	.4byte 0x083bc620
Unknown_83BC640:
	.incbin "baserom.gba", 0x003bc640, 0x10
Unknown_83BC650:
	.incbin "baserom.gba", 0x003bc650, 0x10

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
	.4byte 0x0809fc0d
	.4byte 0x0809feb9

	.global gUnknown_083C1588
gUnknown_083C1588: @ 83C1588
	.4byte 0x0809f63d
	.4byte 0x0809f651
	.4byte 0x0809f665
	.4byte 0x0809f665

	.global gUnknown_083C1598
gUnknown_083C1598: @ 83C1598
	.4byte 0x0809fe6d
	.4byte 0x080a0091
	.4byte 0x080a015d
	.4byte 0x080a015d

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
	.4byte 0x080a59d1
	.4byte 0x080a599d
	.4byte 0x080a7025
	.4byte 0x080a70d9
	.4byte 0x080a6215
	.4byte 0x080a61ed
	.4byte 0x080a6355
	.4byte 0x080a631d
	.4byte 0x080a6919
	.4byte 0x080a68f1
	.4byte 0x080a59d1
	.4byte 0x080a69b9
	.4byte 0x080a6c6d
	.4byte 0x080a6a4d

	.global gUnknown_083C16F4
gUnknown_083C16F4: @ 83C16F4
	.4byte 0x080a5e61
	.4byte 0x080a5e91

	.global gUnknown_083C16FC
gUnknown_083C16FC: @ 83C16FC
	.4byte 0x080a65ad
	.4byte 0x080a6619

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
	.incbin "baserom.gba", 0x003c1cc8, 0x8

	.global gUnknown_083C1CD0
gUnknown_083C1CD0: @ 83C1CD0
	.incbin "baserom.gba", 0x003c1cd0, 0x8

	.global gUnknown_083C1CD8
gUnknown_083C1CD8: @ 83C1CD8
	.incbin "baserom.gba", 0x003c1cd8, 0x8

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
@ not referenced. wont label
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
	.4byte 0x083c9166
	.4byte 0x080a9c1d
	.4byte 0x083c916e
	.4byte 0x080a9bbd
	.4byte 0x083c9190
	.4byte 0x080a9c35
	.4byte 0x083c91a0
	.4byte 0x080a9c41
	.4byte 0x083c91b0
	.4byte 0x080aafdd
	.4byte 0x083c91c2
	.4byte 0x080aafed
	.4byte 0x083c91d6
	.4byte 0x080ab02d

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
	.4byte 0x080aa8c9
	.4byte 0x080aa8d9
	.4byte 0x080aa8e9
	.4byte 0x080aa8f9
	.4byte 0x080aac5d
	.4byte 0x080aac5d
	.4byte 0x080aa931
	.4byte 0x080aa975
	.4byte 0x080aa9b9
	.4byte 0x080aa9fd
	.4byte 0x080aaa41
	.4byte 0x080aaa85
	.4byte 0x080aaaf1
	.4byte 0x080aab31
	.4byte 0x080aab71
	.4byte 0x080aabb1
	.4byte 0x080aabf1
	.4byte 0x080aad45

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
Unknown_83C93B4:
	.4byte 0x083c937c
	.4byte 0x083c9387
	.4byte 0x083c9392
	.4byte 0x083c939d
	.4byte 0x083c93a8
Unknown_83C93C8:
	.incbin "baserom.gba", 0x003c93c8, 0xA
Unknown_83C93D2:
	.incbin "baserom.gba", 0x003c93d2, 0xA
Unknown_83C93DC:
	.incbin "baserom.gba", 0x003c93dc, 0xA
Unknown_83C93E6:
	.incbin "baserom.gba", 0x003c93e6, 0xA

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
	.4byte ContestStatsText_Buy
	.4byte 0x080b2efd
	.4byte ContestStatsText_Sell
	.4byte 0x080b2f31
	.4byte ContestStatsText_Quit2
	.4byte 0x080b2f65

	.global gUnknown_083CC6E8
gUnknown_083CC6E8: @ 83CC6E8
	.incbin "baserom.gba", 0x003cc6e8, 0x3

	.global gUnknown_083CC6EB
gUnknown_083CC6EB: @ 83CC6EB
	.incbin "baserom.gba", 0x003cc6eb, 0x1d

	.global gUnknown_083CC708
gUnknown_083CC708: @ 83CC708
	.4byte 0x080b3bf5
	.4byte 0x080b3d7d

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
	.4byte 0x080B5EA9
	.4byte 0x080B5ED1
	.4byte 0x080B5F01
	.4byte 0x080B5F11
	.4byte 0x080B5F39
	.4byte 0x080B5F71
	.4byte 0x080B5FED
	.4byte 0x080B604D
	.4byte 0x080B606D
	.4byte 0x080B6095

	.global gUnknown_083CE240
gUnknown_083CE240: @ 83CE240
	.4byte 0x080B6109
	.4byte 0x080B6149
	.4byte 0x080B6171
	.4byte 0x080B6195

	.global gUnknown_083CE250
gUnknown_083CE250: @ 83CE250
	.4byte 0x080B626D
	.4byte 0x080B6275

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
	.4byte 0x080b6669
	.4byte 0x080b6681
	.4byte 0x080b66ed
	.4byte 0x080b6759

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

	.global gUnknown_083CE2B4
gUnknown_083CE2B4: @ 83CE2B4
	.4byte 0x080b6b5d
	.4byte 0x080b6b99
	.4byte 0x080b6b9d
	.4byte 0x080b6c09

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
	.4byte 0x080b6e65
	.4byte 0x080b6e69
	.4byte 0x080b6ebd
	.4byte 0x080b6efd

	.global gUnknown_083CE2F0
gUnknown_083CE2F0: @ 83CE2F0
	.4byte 0x080B7661
	.4byte 0x080B7651
	.4byte 0x080B7651
	.4byte 0x080B7671
	.4byte 0x080B7671
	.4byte 0x080B7661

	.global gUnknown_083CE308
gUnknown_083CE308: @ 83CE308
	.incbin "baserom.gba", 0x003ce308, 0x8

	.global gUnknown_083CE310
gUnknown_083CE310: @ 83CE310
	.4byte 0x080b7845
	.4byte 0x080b7839
	.4byte 0x080b7839
	.4byte 0x080b7851
	.4byte 0x080b7851
	.4byte 0x080b7845

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

	.global gUnknown_083CE358
gUnknown_083CE358: @ 83CE358
	.4byte 0x080b78f5
	.4byte 0x080b78f5
	.4byte 0x080b78f9
	.4byte 0x080b78f9

	.global gUnknown_083CE368
gUnknown_083CE368: @ 83CE368
	.4byte 0x080b7921
	.4byte 0x080b7925

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
	.incbin "baserom.gba", 0x003cf584, 0x8

	.global gUnknown_083CF58C
gUnknown_083CF58C: @ 83CF58C
	.incbin "baserom.gba", 0x003cf58c, 0x8

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

	.global gUnknown_083D026C
gUnknown_083D026C: @ 83D026C
	.4byte 0x0202713c

	.global gUnknown_083D0270
gUnknown_083D0270: @ 83D0270
	.4byte 0x02027e6c

	.global gUnknown_083D0274
gUnknown_083D0274: @ 83D0274
	.4byte 0x020281f0

	.global gUnknown_083D0278
gUnknown_083D0278: @ 83D0278
	.4byte 0x020284c8

	.global gUnknown_083D027C
gUnknown_083D027C: @ 83D027C
	.4byte 0x02028508

	.global gUnknown_083D0280
gUnknown_083D0280: @ 83D0280
	.4byte 0x02038738

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

	.global gUnknown_083D13D4
gUnknown_083D13D4: @ 83D13D4
	.4byte SecretBaseText_DelRegist
	.4byte 0x080bca85
	.4byte UnknownText_Exit
	.4byte 0x080bcbf9

	.global gUnknown_083D13E4
gUnknown_083D13E4: @ 83D13E4
	.4byte 0x080bcb91
	.4byte 0x080bcbc1

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
	.4byte 0x020231cc
	.4byte 0x020232cc
	.4byte 0x020233cc

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

	.global gUnknown_083D1490
gUnknown_083D1490: @ 83D1490
	.4byte 0x081a9581
	.4byte 0x081a9694
	.4byte 0x081a971b
	.4byte 0x081a974b
	.4byte 0x081a979f
	.4byte 0x081a97d0

	.global gUnknown_083D14A8
gUnknown_083D14A8: @ 83D14A8
	.4byte 0x081a8917
	.4byte 0x081a8ae5
	.4byte 0x081a8b9d
	.4byte 0x081a8c77
	.4byte 0x081a8d45

	.global gUnknown_083D14BC
gUnknown_083D14BC: @ 83D14BC
	.4byte 0x081a986f

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

	.global gUnknown_083D15D0
gUnknown_083D15D0: @ 83D15D0
	.4byte 0x081aa814
	.4byte 0x081aa8c6
	.4byte 0x081aa9b2
	.4byte 0x081aaa5c
	.4byte 0x081aab11
	.4byte 0x081aabb4
	.4byte 0x081aac47

	.global gUnknown_083D15EC
gUnknown_083D15EC: @ 83D15EC
	.4byte 0x081aa344
	.4byte 0x081aa5f3

	.global gUnknown_083D15F4
gUnknown_083D15F4: @ 83D15F4
	.4byte 0x081abc51
	.4byte 0x081abd94
	.4byte 0x081abdf2

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
Unknown_83D613C:
	.incbin "baserom.gba", 0x003d613c, 0x60
Unknown_83D619C:
	.incbin "baserom.gba", 0x003d619c, 0x20
Unknown_83D61BC:
	.incbin "baserom.gba", 0x003d61bc, 0x20

	.global gUnknown_083D61DC
gUnknown_083D61DC: @ 83D61DC
	.4byte Unknown_83D619C
	.4byte Unknown_83D61BC

	.global gUnknown_083D61E4
gUnknown_083D61E4: @ 83D61E4
	.4byte 0x0808b021
	.4byte 0x080545e5
	.4byte 0x0810b96d

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
	.4byte 0x080e448d
	.4byte 0x080e448d
	.4byte 0x080e46cd
	.4byte 0x080e46cd
	.4byte 0x080e46cd
	.4byte 0x080e448d
	.4byte 0x080e448d
	.4byte 0x080e448d
	.4byte 0x080e49c1
	.4byte 0x080e49c1

	.global gUnknown_083DB594
gUnknown_083DB594: @ 83DB594
	.4byte 0x080e5169
	.4byte 0x080e517d
	.4byte 0x080e51c5
	.4byte 0x080e5271

	.global gUnknown_083DB5A4
gUnknown_083DB5A4: @ 83DB5A4
	.4byte 0x080593ad
	.4byte 0x080593c5
	.4byte 0x080593f5

	.global gUnknown_083DB5B0
gUnknown_083DB5B0: @ 83DB5B0
	.4byte 0x080e56f9
	.4byte 0x080e5709
	.4byte 0x080e5745
	.4byte 0x080e57bd
	.4byte 0x080e57f9
	.4byte 0x080e5835
	.4byte 0x080e5871
	.4byte 0x080e58ad
	.4byte 0x080e5921
	.4byte 0x080e5991
	.4byte 0x080e59a1
	.4byte 0x080e5a31
	.4byte 0x080e5ac1

	.global gUnknown_083DB5E4
gUnknown_083DB5E4: @ 83DB5E4
	.4byte 0x080e5341
	.4byte 0x080e53dd
	.4byte 0x080e5455
	.4byte 0x080e54f5
	.4byte 0x080e559d
	.4byte 0x080e5679
	.4byte 0x080e56d5

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
	.incbin "baserom.gba", 0x003db7f4, 0x3c0

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

	.global gUnknown_083DBC8C
gUnknown_083DBC8C: @ 83DBC8C
	.4byte Unknown_83DBC3C
	.4byte Unknown_83DBC44
	.4byte Unknown_83DBC4C
	.4byte Unknown_83DBC54

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
	.4byte 0x083e178c
	.4byte 0x083e17ed
	.4byte 0x083e1846
	.4byte 0x083e18a3
	.4byte 0x083e1912
	.4byte 0x083e1972
	.4byte 0x083e19cd
	.4byte 0x083e1a21
	.4byte 0x083e1a76
	.4byte 0x083e1ac6
	.4byte 0x083e1b1d
	.4byte 0x083e1b7c
	.4byte 0x083e1bdd
	.4byte 0x083e1c37
	.4byte 0x083e1c87
	.4byte 0x083e1ce1
	.4byte 0x083e1d40
	.4byte 0x083e1d9a
	.4byte 0x083e1e00
	.4byte 0x083e1e5c
	.4byte 0x083e1eb6
	.4byte 0x083e1f13
	.4byte 0x083e1f6f
	.4byte 0x083e1fd6
	.4byte 0x083e202e
	.4byte 0x083e208f
	.4byte 0x083e20ee
	.4byte 0x083e214f
	.4byte 0x083e21ae
	.4byte 0x083e2203
	.4byte 0x083e2260
	.4byte 0x083e22bf
	.4byte 0x083e231d
	.4byte 0x083e237b
	.4byte 0x083e23da
	.4byte 0x083e2425
	.4byte 0x083e247f
	.4byte 0x083e24e3
	.4byte 0x083e2547
	.4byte 0x083e25ab
	.4byte 0x083e260b
	.4byte 0x083e2664
	.4byte 0x083e26bb
	.4byte 0x083e2707
	.4byte 0x083e2759
	.4byte 0x083e27b2
	.4byte 0x083e2810
	.4byte 0x083e2870
	.4byte 0x083e28c9
	.4byte 0x083e2925
	.4byte 0x083e2983
	.4byte 0x083e29d7
	.4byte 0x083e2a3b
	.4byte 0x083e2a9d
	.4byte 0x083e2af3
	.4byte 0x083e2b46
	.4byte 0x083e2ba4
	.4byte 0x083e2c0b
	.4byte 0x083e2c64
	.4byte 0x083e2cc5
	.4byte 0x083e2d20
	.4byte 0x083e2d87
	.4byte 0x083e2de0
	.4byte 0x083e2e47
	.4byte 0x083e2eab
	.4byte 0x083e2f05
	.4byte 0x083e2f62
	.4byte 0x083e2fca
	.4byte 0x083e3031

	.global gUnknown_083E31B0
gUnknown_083E31B0: @ 83E31B0
	.4byte PCText_CheckMap
	.4byte PCText_CheckPoke
	.4byte PCText_CheckTrainer
	.4byte PCText_CheckRibbons
	.4byte PCText_PutAwayNav
	.4byte PCText_NoRibbonWin
	.4byte PCText_NoTrainers

	.global gUnknown_083E31CC
gUnknown_083E31CC: @ 83E31CC
	.4byte PCText_CheckParty
	.4byte PCText_CheckPokeAll
	.4byte PCText_ReturnToNav

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
Unknown_83E5274:
	.4byte 0x083e5224
	.4byte 0x083e522c
	.4byte 0x083e5234
	.4byte 0x083e523c
	.4byte 0x083e5244
	.4byte 0x083e524c
	.4byte 0x083e5254
	.4byte 0x083e525c
	.4byte 0x083e5264
	.4byte 0x083e526c
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
	.incbin "baserom.gba", 0x003e52b4, 0x88

	.global gUnknown_083E533C
gUnknown_083E533C: @ 83E533C
	.4byte 0x083e52bc
	.4byte 0x083e52c4
	.4byte 0x083e52cc
	.4byte 0x083e52d4
	.4byte 0x083e52dc
	.4byte 0x083e52e4
	.4byte 0x083e52ec
	.4byte 0x083e52f4
	.4byte 0x083e52fc
	.4byte 0x083e5304
	.4byte 0x083e530c
	.4byte 0x083e5314
	.4byte 0x083e531c
	.4byte 0x083e5324
	.4byte 0x083e532c
	.4byte 0x083e5334

	.global gUnknown_083E537C
gUnknown_083E537C: @ 83E537C
	.incbin "baserom.gba", 0x003e537c, 0xc

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
	.4byte SecretBaseText_Desk
	.4byte SecretBaseText_Chair
	.4byte SecretBaseText_Plant
	.4byte SecretBaseText_Ornament
	.4byte SecretBaseText_Mat
	.4byte SecretBaseText_Poster
	.4byte SecretBaseText_Doll
	.4byte SecretBaseText_Cushion

	.global gUnknown_083EC604
gUnknown_083EC604: @ 83EC604
	.4byte SecretBaseText_Decorate
	.4byte 0x080ff161
	.4byte SecretBaseText_PutAway
	.4byte 0x08100a0d
	.4byte SecretBaseText_Toss
	.4byte 0x08101701
	.4byte UnknownText_Exit
	.4byte 0x080fe3c5

	.global gUnknown_083EC624
gUnknown_083EC624: @ 83EC624
	.4byte SecretBaseText_PutOutDecor
	.4byte SecretBaseText_StoreChosenDecor
	.4byte SecretBaseText_ThrowAwayDecor
	.4byte MenuText_GoBackToPrev

	.global gUnknown_083EC634
gUnknown_083EC634: @ 83EC634
	.4byte 0x080ff5bd
	.4byte 0x080ff059
	.4byte 0x081017a1
	.4byte 0x080ff059
	.4byte 0x081017a1
	.4byte 0x080ff059
	.4byte 0x08109d05
	.4byte 0x080ff059

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
	.4byte 0x081000c5
	.4byte 0x0810065d

	.global gUnknown_083EC964
gUnknown_083EC964: @ 83EC964
	.4byte 0x0810026d
	.4byte 0x0810065d

	.global gUnknown_083EC96C
gUnknown_083EC96C: @ 83EC96C
	.4byte 0x080ffab1
	.4byte 0x080ffb09
	.4byte 0x08100f89
	.4byte 0x08100fb5

	.global gUnknown_083EC97C
gUnknown_083EC97C: @ 83EC97C
	.incbin "baserom.gba", 0x003ec97c, 0x8

	.global gUnknown_083EC984
gUnknown_083EC984: @ 83EC984
	.incbin "baserom.gba", 0x003ec984, 0x48

	.global gUnknown_083EC9CC
gUnknown_083EC9CC: @ 83EC9CC
	.4byte 0x0810153d
	.4byte 0x08100eed

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
	.4byte 0x08101d5d
	.4byte 0x08101d8d
	.4byte 0x08101db1
	.4byte 0x08101df5
	.4byte 0x08101e11
	.4byte 0x08101e3d
	.4byte 0x08101f45
	.4byte 0x08101f61
	.4byte 0x08101f89
	.4byte 0x08101fa5
	.4byte 0x08102009
	.4byte 0x08102035
	.4byte 0x08102059
	.4byte 0x08102091
	.4byte 0x081020c9
	.4byte 0x081021e1
	.4byte 0x081021fd
	.4byte 0x08102265
	.4byte 0x081022a1
	.4byte 0x081022cd
	.4byte 0x081022f1
	.4byte 0x08102319
	.4byte 0x08102345
	.4byte 0x0810239d
	.4byte 0x081023b9
	.4byte 0x081023e1
	.4byte 0x081023fd
	.4byte 0x08102425
	.4byte 0x08102461

	.global gUnknown_083ECB20
gUnknown_083ECB20: @ 83ECB20
	.4byte 0x08102a9d
	.4byte 0x08102ad1
	.4byte 0x08102b81

	.global gUnknown_083ECB2C
gUnknown_083ECB2C: @ 83ECB2C
	.4byte 0x08102ea1
	.4byte 0x08102ea5
	.4byte 0x08102ec1
	.4byte 0x08102f4d
	.4byte 0x08103009

	.global gUnknown_083ECB40
gUnknown_083ECB40: @ 83ECB40
	.4byte 0x0810305d
	.4byte 0x081032c1
	.4byte 0x081033dd

	.global gUnknown_083ECB4C
gUnknown_083ECB4C: @ 83ECB4C
	.4byte 0x081034f5
	.4byte 0x08103541
	.4byte 0x0810380d

	.global gUnknown_083ECB58
gUnknown_083ECB58: @ 83ECB58
	.incbin "baserom.gba", 0x003ecb58, 0xc

	.global gUnknown_083ECB64
gUnknown_083ECB64: @ 83ECB64
	.4byte 0x08103155
	.4byte 0x081031b5
	.4byte 0x081031b5

	.global gUnknown_083ECB70
gUnknown_083ECB70: @ 83ECB70
	.4byte 0x081032e9
	.4byte 0x081032e9
	.4byte 0x0810333d

	.global gUnknown_083ECB7C
gUnknown_083ECB7C: @ 83ECB7C
	.4byte 0x0810341d
	.4byte 0x0810341d
	.4byte 0x0810347d

	.global gUnknown_083ECB88
gUnknown_083ECB88: @ 83ECB88
	.4byte 0x08103565
	.4byte 0x081035ed
	.4byte 0x08103669

	.global gUnknown_083ECB94
gUnknown_083ECB94: @ 83ECB94
	.4byte 0x08103831
	.4byte 0x08103911
	.4byte 0x08103a79

	.global gUnknown_083ECBA0
gUnknown_083ECBA0: @ 83ECBA0
	.4byte 0x08103c79
	.4byte 0x08103cad
	.4byte 0x08103cc9

	.global gUnknown_083ECBAC
gUnknown_083ECBAC: @ 83ECBAC
	.incbin "baserom.gba", 0x003ecbac, 0x8

	.global gUnknown_083ECBB4
gUnknown_083ECBB4: @ 83ECBB4
	.4byte 0x08104119
	.4byte 0x0810411d
	.4byte 0x08104145
	.4byte 0x081041ad

	.global gUnknown_083ECBC4
gUnknown_083ECBC4: @ 83ECBC4
	.incbin "baserom.gba", 0x003ecbc4, 0x2

	.global gUnknown_083ECBC6
gUnknown_083ECBC6: @ 83ECBC6
	.incbin "baserom.gba", 0x003ecbc6, 0xa

	.global gUnknown_083ECBD0
gUnknown_083ECBD0: @ 83ECBD0
	.4byte 0x0810437d
	.4byte 0x081043ed
	.4byte 0x08104469
	.4byte 0x08104499
	.4byte 0x08104549
	.4byte 0x08104599
	.4byte 0x081045cd
	.4byte 0x0810463d
	.4byte 0x081046c1
	.4byte 0x08104765
	.4byte 0x08104795
	.4byte 0x081047ed
	.4byte 0x08104861
	.4byte 0x081048a9
	.4byte 0x081048cd
	.4byte 0x08104941
	.4byte 0x081049c9
	.4byte 0x08104795
	.4byte 0x081049f9

	.global gUnknown_083ECC1C
gUnknown_083ECC1C: @ 83ECC1C
	.4byte 0x02020101

	.global gUnknown_083ECC20
gUnknown_083ECC20: @ 83ECC20
	.incbin "baserom.gba", 0x003ecc20, 0x8

	.global gUnknown_083ECC28
gUnknown_083ECC28: @ 83ECC28
	.incbin "baserom.gba", 0x003ecc28, 0x8

	.global gUnknown_083ECC30
gUnknown_083ECC30: @ 83ECC30
	.4byte 0x08104b3d
	.4byte 0x08104b61
	.4byte 0x08104b81
	.4byte 0x08104b61
	.4byte 0x08104bc9
	.4byte 0x08104b61
	.4byte 0x08104bfd
	.4byte 0x08104b61
	.4byte 0x08104c45

	.global gUnknown_083ECC54
gUnknown_083ECC54: @ 83ECC54
	.4byte 0x08104ea5

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
	.4byte 0x083ecf98
	.4byte 0x083ecfa8
	.4byte 0x083ecfc4
	.4byte 0x083ecfd0
	.4byte 0x083ecfe8
	.4byte 0x083ed020
	.4byte 0x083ecff8

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
	.4byte 0x083ed57c
	.4byte 0x083ed594
	.4byte 0x083ed5ac
	.4byte 0x083ed5dc
	.4byte 0x083ed5f4
	.4byte 0x083ed654
	.4byte 0x083ed66c
	.4byte 0x083ed684
	.4byte 0x083ed69c
	.4byte 0x083ed6b4
	.4byte 0x083ed5c4
	.4byte 0x083ed5c4
	.4byte 0x083ed5c4
	.4byte 0x083ed5c4
	.4byte 0x083ed60c
	.4byte 0x083ed60c
	.4byte 0x083ed60c
	.4byte 0x083ed60c
	.4byte 0x083ed60c
	.4byte 0x083ed624
	.4byte 0x083ed624
	.4byte 0x083ed624
	.4byte 0x083ed63c
	.4byte 0x083ed63c
	.4byte 0x083ed63c
	.4byte 0x081e2914

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
	.4byte 0x083edcfc
	.4byte 0x083edcfe
	.4byte 0x083edd00
	.4byte 0x083edd02
	.4byte 0x083edd04

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

	.global gUnknown_083EDDA0
gUnknown_083EDDA0: @ 83EDDA0
	.4byte Unknown_83EDD3E
	.4byte Unknown_83EDD5E
	.4byte Unknown_83EDD7E

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

	.global gUnknown_083EDE10
gUnknown_083EDE10: @ 83EDE10
	.4byte Unknown_83EDDB0
	.4byte Unknown_83EDDD0
	.4byte Unknown_83EDDF0
	.4byte 0x08e97788

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

	.global gUnknown_083F60AC
gUnknown_083F60AC: @ 83F60AC
	.4byte OtherText_Cool
	.4byte OtherText_Beauty2
	.4byte OtherText_Cute
	.4byte OtherText_Smart
	.4byte OtherText_Tough

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
	.incbin "baserom.gba", 0x003f6140, 0x4

	.global gUnknown_083F6144
gUnknown_083F6144: @ 83F6144
	.4byte 0x0810752d
	.4byte 0x0810756d
	.4byte 0x081075ad
	.4byte 0x081075ed
	.4byte 0x0810762d
	.4byte 0x08107669
	.4byte 0x081076d1
	.4byte 0x08107739
	.4byte 0x081077a1
	.4byte 0x08107809
	.4byte 0x0810787d
	.4byte 0x081078f1
	.4byte 0x08107965
	.4byte 0x081079d9
	.4byte 0x08107a49
	.4byte 0x08107ab9
	.4byte 0x08107b35
	.4byte 0x08107bb1
	.4byte 0x08107be9
	.4byte 0x08107c21
	.4byte 0x08107c59
	.4byte 0x08107c91
	.4byte 0x08107ce1
	.4byte 0x08107d31
	.4byte 0x08107d81
	.4byte 0x08107dd1
	.4byte 0x08107e11
	.4byte 0x08107e51
	.4byte 0x08107eb5
	.4byte 0x08107f1d
	.4byte 0x08107f85
	.4byte 0x08107ff1
	.4byte 0x08108061
	.4byte 0x081080d1
	.4byte 0x081080f1
	.4byte 0x081081cd
	.4byte 0x081081f5
	.4byte 0x081083d5
	.4byte 0x08108425
	.4byte 0x0810845d
	.4byte 0x08108495
	.4byte 0x081084e1
	.4byte 0x0810852d
	.4byte 0x08108531
	.4byte 0x08108535
	.4byte 0x08108631
	.4byte 0x08108649
	.4byte 0x08108671
	.4byte 0x081087a1
	.4byte 0x0810888d
	.4byte 0x0810895d
	.4byte 0x08108961
	.4byte 0x08108965
	.4byte 0x08108a29
	.4byte 0x08108aed
	.4byte 0x08108b49
	.4byte 0x08108b91
	.4byte 0x08108bd9
	.4byte 0x08108c41
	.4byte 0x08108ca9
	.4byte 0x08108d11
	.4byte 0x08108d79
	.4byte 0x08108e65
	.4byte 0x08108f3d
	.4byte 0x08109011
	.4byte 0x081090e5
	.4byte 0x081091d5
	.4byte 0x081092a9
	.4byte 0x08109331
	.4byte 0x081093b9
	.4byte 0x081093c9
	.4byte 0x0810942d
	.4byte 0x0810943d
	.4byte 0x081094b9
	.4byte 0x0810950d
	.4byte 0x08109555
	.4byte 0x0810959d
	.4byte 0x081095c1
	.4byte 0x08109605
	.4byte 0x0810962d
	.4byte 0x08109655
	.4byte 0x0810967d
	.4byte 0x081096c5
	.4byte 0x081096c9
	.4byte 0x081096cd
	.4byte 0x081096d1
	.4byte 0x081096d5
	.4byte 0x081096d9
	.4byte 0x081096dd
	.4byte 0x0810970d
	.4byte 0x0810972d
	.4byte 0x0810974d
	.4byte 0x08109825
	.4byte 0x08109875

	.global gUnknown_083F62BC
gUnknown_083F62BC: @ 83F62BC
	.incbin "baserom.gba", 0x003f62bc, 0x1c

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

	.global gUnknown_083F7EA8
gUnknown_083F7EA8: @ 83F7EA8
	.4byte 0x080a5b41
	.4byte 0x080545e5
	.4byte 0x0802e425
	.4byte 0x080545e5

	.global gUnknown_083F7EB8
gUnknown_083F7EB8: @ 83F7EB8
	.incbin "baserom.gba", 0x003f7eb8, 0x3c

	.global gUnknown_083F7EF4
gUnknown_083F7EF4: @ 83F7EF4
	.4byte OtherText_Use
	.4byte 0x0810c509
	.4byte OtherText_Toss
	.4byte 0x0810c5c1
	.4byte OtherText_Cancel2
	.4byte 0x0810c749
	.4byte OtherText_Use
	.4byte 0x0810c789
	.4byte OtherText_Use
	.4byte 0x0810c855

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
	.4byte 0x0811755d
	.4byte 0x081175c1

	.global gUnknown_083F8EBC
gUnknown_083F8EBC: @ 83F8EBC
	.4byte 0x0811577d
	.4byte 0x081157ad

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
	.4byte 0x0200c000

	.global gUnknown_083FD70C
gUnknown_083FD70C: @ 83FD70C
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65
	.4byte 0x0811ac65

	.global gUnknown_083FD750
gUnknown_083FD750: @ 83FD750
	.4byte 0x0811acb5
	.4byte 0x0811adad
	.4byte 0x0811af45
	.4byte 0x0811b0f1
	.4byte 0x0811b579
	.4byte 0x0811b7e9
	.4byte 0x0811bcbd
	.4byte 0x0811bea1
	.4byte 0x0811ca5d
	.4byte 0x0811ccdd
	.4byte 0x0811d0b9
	.4byte 0x0811d1c9
	.4byte 0x0811c08d
	.4byte 0x0811c0ad
	.4byte 0x0811c0cd
	.4byte 0x0811c0ed
	.4byte 0x0811c10d

	.global gUnknown_083FD794
gUnknown_083FD794: @ 83FD794
	.4byte 0x0811ab89
	.4byte 0x0811abd9
	.4byte 0x0811ac0d
	.4byte 0x0811ac35

	.global gUnknown_083FD7A4
gUnknown_083FD7A4: @ 83FD7A4
	.4byte 0x0811aced
	.4byte 0x0811ad1d
	.4byte 0x0811ad81

	.global gUnknown_083FD7B0
gUnknown_083FD7B0: @ 83FD7B0
	.4byte 0x0811ade5
	.4byte 0x0811ae71

	.global gUnknown_083FD7B8
gUnknown_083FD7B8: @ 83FD7B8
	.4byte 0x0811af7d
	.4byte 0x0811b001

	.global gUnknown_083FD7C0
gUnknown_083FD7C0: @ 83FD7C0
	.4byte 0x0811b129
	.4byte 0x0811b1d9
	.4byte 0x0811b269
	.4byte 0x0811b2f5
	.4byte 0x0811b381
	.4byte 0x0811b3ed

	.global gUnknown_083FD7D8
gUnknown_083FD7D8: @ 83FD7D8
	.4byte 0x0811b5b1
	.4byte 0x0811b5fd
	.4byte 0x0811b689

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
	.4byte 0x0811b821
	.4byte 0x0811b885
	.4byte 0x0811b90d
	.4byte 0x0811b9f1
	.4byte 0x0811ba71
	.4byte 0x0811bb61
	.4byte 0x0811bbed

	.global gUnknown_083FD814
gUnknown_083FD814: @ 83FD814
	.4byte 0x0811bcf5
	.4byte 0x0811bd61

	.global gUnknown_083FD81C
gUnknown_083FD81C: @ 83FD81C
	.4byte 0x0811bed9
	.4byte 0x0811bf2d
	.4byte 0x0811bfc5

	.global gUnknown_083FD828
gUnknown_083FD828: @ 83FD828
	.4byte 0x0811c165
	.4byte 0x0811c1cd
	.4byte 0x0811c2a5
	.4byte 0x0811c38d
	.4byte 0x0811c401
	.4byte 0x0811c43d
	.4byte 0x0811c4f1
	.4byte 0x0811c5b5
	.4byte 0x0811c5e9
	.4byte 0x0811c631

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
	.4byte 0x0811c935
	.4byte 0x0811c939
	.4byte 0x0811c985
	.4byte 0x0811c9b9
	.4byte 0x0811c935
	.4byte 0x0811c9e5
	.4byte 0x0811c935

	.global gUnknown_083FD89C
gUnknown_083FD89C: @ 83FD89C
	.incbin "baserom.gba", 0x003fd89c, 0x4

	.global gUnknown_083FD8A0
gUnknown_083FD8A0: @ 83FD8A0
	.incbin "baserom.gba", 0x003fd8a0, 0x4

	.global gUnknown_083FD8A4
gUnknown_083FD8A4: @ 83FD8A4
	.4byte 0x0811ca95
	.4byte 0x0811cb21
	.4byte 0x0811cbe9

	.global gUnknown_083FD8B0
gUnknown_083FD8B0: @ 83FD8B0
	.4byte 0x0811cd15
	.4byte 0x0811cda1
	.4byte 0x0811ce15
	.4byte 0x0811ce4d
	.4byte 0x0811ceb1

	.global gUnknown_083FD8C4
gUnknown_083FD8C4: @ 83FD8C4
	.incbin "baserom.gba", 0x003fd8c4, 0x10

	.global gUnknown_083FD8D4
gUnknown_083FD8D4: @ 83FD8D4
	.4byte 0x0811d0f1
	.4byte 0x0811d145
	.4byte 0x0811d19d

	.global gUnknown_083FD8E0
gUnknown_083FD8E0: @ 83FD8E0
	.4byte 0x0811d201
	.4byte 0x0811d261
	.4byte 0x0811d2d9
	.4byte 0x0811d3b1
	.4byte 0x0811d41d

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
	.4byte 0x083fda20
	.4byte 0x083fda40
	.4byte 0x083fda60
	.4byte 0x083fda80
	.4byte 0x083fdaa0

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

	.global gUnknown_084017B0
gUnknown_084017B0: @ 84017B0
	.4byte OtherText_Summary
	.4byte 0x0812265d
	.4byte OtherText_Enter2
	.4byte 0x08122695
	.4byte OtherText_NoEntry
	.4byte 0x08122771
	.4byte UnknownText_Exit
	.4byte 0x08122839
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

	.global gUnknown_08401D9C
gUnknown_08401D9C: @ 8401D9C
	.4byte 0x08123eb9
	.4byte 0x08123f45

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

	.global gUnknown_08401E40
gUnknown_08401E40: @ 8401E40
	.4byte 0x081275a1
	.4byte 0x081275c5

	.global gUnknown_08401E48
gUnknown_08401E48: @ 8401E48
	.4byte 0x08127da1
	.4byte 0x08127dd1
	.4byte 0x08127e31

	.global gUnknown_08401E54
gUnknown_08401E54: @ 8401E54
	.incbin "baserom.gba", 0x00401e54, 0x6

	.global gUnknown_08401E5A
gUnknown_08401E5A: @ 8401E5A
	.incbin "baserom.gba", 0x00401e5a, 0x6

	.global gUnknown_08401E60
gUnknown_08401E60: @ 8401E60
	.4byte 0x08128aa9
	.4byte 0x08128af1
	.4byte 0x08128b0d
	.4byte 0x08128b4d
	.4byte 0x08128b8d
	.4byte 0x08128bcd
	.4byte 0x08128c0d
	.4byte 0x08128c2d
	.4byte 0x08128c6d
	.4byte 0x08128cad
	.4byte 0x08128ced
	.4byte 0x08128d2d
	.4byte 0x08128d51
	.4byte 0x08128d91
	.4byte 0x08128dd1
	.4byte 0x08128e11
	.4byte 0x08128e51
	.4byte 0x08128e91
	.4byte 0x08128ed1
	.4byte 0x08128f11
	.4byte 0x08128f51
	.4byte 0x08128f91
	.4byte 0x08128fbd
	.4byte 0x08129009
	.4byte 0x08129055
	.4byte 0x081290a1
	.4byte 0x081290ed
	.4byte 0x08129115
	.4byte 0x08129161
	.4byte 0x081291ad
	.4byte 0x081291f9
	.4byte 0x08129245
	.4byte 0x08129265
	.4byte 0x081292a5
	.4byte 0x081292e5
	.4byte 0x08129325
	.4byte 0x08129369
	.4byte 0x081293ad
	.4byte 0x081293f1
	.4byte 0x08129435
	.4byte 0x08129471
	.4byte 0x081294b1
	.4byte 0x081294f1
	.4byte 0x08129539
	.4byte 0x08129579
	.4byte 0x081295b9
	.4byte 0x08129639
	.4byte 0x0812967d
	.4byte 0x081296fd
	.4byte 0x08129741
	.4byte 0x08129799
	.4byte 0x081297d9
	.4byte 0x08129819
	.4byte 0x08129859
	.4byte 0x08129899
	.4byte 0x081298f1
	.4byte 0x08129931
	.4byte 0x08129971
	.4byte 0x081299b1
	.4byte 0x081299f1
	.4byte 0x08129a45
	.4byte 0x08129a85
	.4byte 0x08129ac5
	.4byte 0x08129b05
	.4byte 0x08129b45
	.4byte 0x08129bb9
	.4byte 0x08129bfd
	.4byte 0x08129c41
	.4byte 0x08129cb5
	.4byte 0x08129cf9
	.4byte 0x08129d3d
	.4byte 0x08129d99
	.4byte 0x08129ddd
	.4byte 0x08129e21
	.4byte 0x08129e65
	.4byte 0x08129ea5
	.4byte 0x08129ee5
	.4byte 0x08129f25
	.4byte 0x08129f65
	.4byte 0x08129fbd
	.4byte 0x08129ffd
	.4byte 0x0812a03d
	.4byte 0x0812a07d
	.4byte 0x0812a0bd
	.4byte 0x0812a101
	.4byte 0x0812a145
	.4byte 0x0812a189
	.4byte 0x0812a1c5
	.4byte 0x0812a209
	.4byte 0x0812a24d
	.4byte 0x0812a295
	.4byte 0x0812a2d9
	.4byte 0x0812a31d
	.4byte 0x0812a361
	.4byte 0x0812a3a5
	.4byte 0x0812a3e5
	.4byte 0x0812a429
	.4byte 0x0812a46d
	.4byte 0x0812a4b1
	.4byte 0x0812a4f5
	.4byte 0x0812a539
	.4byte 0x0812a579
	.4byte 0x0812a5b9
	.4byte 0x0812a5f9
	.4byte 0x0812a639
	.4byte 0x0812a675
	.4byte 0x0812a6b5
	.4byte 0x0812a6f5
	.4byte 0x0812a735
	.4byte 0x0812a775
	.4byte 0x0812a7c5
	.4byte 0x0812a805
	.4byte 0x0812a845
	.4byte 0x0812a86d
	.4byte 0x0812a899
	.4byte 0x0812a8cd
	.4byte 0x0812a8fd
	.4byte 0x0812a92d
	.4byte 0x0812a979
	.4byte 0x0812a9c5
	.4byte 0x0812aa11
	.4byte 0x0812aa5d
	.4byte 0x0812aaad
	.4byte 0x0812aafd
	.4byte 0x0812ab4d
	.4byte 0x0812ab9d
	.4byte 0x0812abe9
	.4byte 0x0812ac35
	.4byte 0x0812ac55
	.4byte 0x0812ac85
	.4byte 0x0812acfd
	.4byte 0x0812ad51
	.4byte 0x0812ad95
	.4byte 0x0812add9
	.4byte 0x0812ae45
	.4byte 0x0812ae89

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
	.4byte OtherText_Coolness
	.4byte OtherText_Toughness
	.4byte OtherText_Smartness
	.4byte OtherText_Cuteness
	.4byte OtherText_Beauty

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
	.4byte 0x08137a11
	.4byte 0x08138231
	.4byte 0x0813823d
	.4byte 0x08138c91
	.4byte 0x08138c9d
	.4byte 0x08138ca9
	.4byte 0x08138cb5
	.4byte 0x08138d39
	.4byte 0x08138e05
	.4byte 0x08138ed1
	.4byte 0x08138edd
	.4byte 0x08138ee9
	.4byte 0x08138ef5
	.4byte 0x08138f45
	.4byte 0x08138fa1
	.4byte 0x08138fad
	.4byte 0x08139209
	.4byte 0x08139275
	.4byte 0x08139299
	.4byte 0x08139379
	.4byte 0x08139385
	.4byte 0x081393ed
	.4byte 0x0813942d
	.4byte 0x08139439
	.4byte 0x08139445
	.4byte 0x08139545
	.4byte 0x08139551
	.4byte 0x0813955d
	.4byte 0x08139569
	.4byte 0x08139575
	.4byte 0x08139581
	.4byte 0x0813958d
	.4byte 0x08139599
	.4byte 0x081395a5
	.4byte 0x081395b1
	.4byte 0x081395bd
	.4byte 0x081395c9
	.4byte 0x081395d5
	.4byte 0x081395e1
	.4byte 0x081395ed
	.4byte 0x081395f9
	.4byte 0x08139605
	.4byte 0x08139675
	.4byte 0x08139681
	.4byte 0x081396b1
	.4byte 0x081396e1
	.4byte 0x0813971d
	.4byte 0x08139751
	.4byte 0x08139aa1
	.4byte 0x08139b21
	.4byte 0x08139b2d
	.4byte 0x08139b39
	.4byte 0x08139b45
	.4byte 0x08139ba1
	.4byte 0x08139bad
	.4byte 0x08139bb9
	.4byte 0x08139c15

	.global gUnknown_08406288
gUnknown_08406288: @ 8406288
	.4byte PCText_TakeOutItems
	.4byte PCText_StoreItems
	.4byte PCText_ThrowAwayItems
	.4byte MenuText_GoBackToPrev

	.global gUnknown_08406298
gUnknown_08406298: @ 8406298
	.4byte SecretBaseText_ItemStorage
	.4byte 0x08139e41
	.4byte PCText_Mailbox
	.4byte 0x08139e6d
	.4byte SecretBaseText_Decoration
	.4byte 0x08139ed9
	.4byte SecretBaseText_TurnOff
	.4byte 0x08139ef9

	.global gUnknown_084062B8
gUnknown_084062B8: @ 84062B8
	.incbin "baserom.gba", 0x004062b8, 0x4

	.global gUnknown_084062BC
gUnknown_084062BC: @ 84062BC
	.incbin "baserom.gba", 0x004062bc, 0x4

	.global gUnknown_084062C0
gUnknown_084062C0: @ 84062C0
	.4byte PCText_WithdrawItem
	.4byte 0x0813a119
	.4byte PCText_DepositItem
	.4byte 0x0813a0a1
	.4byte PCText_TossItem
	.4byte 0x0813a199
	.4byte UnknownText_Exit
	.4byte 0x0813a21d

	.global gUnknown_084062E0
gUnknown_084062E0: @ 84062E0
	.4byte 0x0813a83d
	.4byte 0x0813a879

	.global gUnknown_084062E8
gUnknown_084062E8: @ 84062E8
	.4byte 0x0813b579
	.4byte 0x0813b611

	.global gUnknown_084062F0
gUnknown_084062F0: @ 84062F0
	.incbin "baserom.gba", 0x004062f0, 0x8

	.global gUnknown_084062F8
gUnknown_084062F8: @ 84062F8
	.4byte OtherText_Read
	.4byte 0x0813b429
	.4byte OtherText_MoveToBag
	.4byte 0x0813b511
	.4byte OtherText_Give
	.4byte 0x0813b631
	.4byte OtherText_Cancel2
	.4byte 0x0813b735

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
	.4byte 0x08140931
	.4byte 0x08140dc5
	.4byte 0x08140c15
	.4byte 0x08140ce9
	.4byte 0x08141059
	.4byte 0x08140c15
	.4byte 0x08140b3d
	.4byte 0x08140ce9
	.4byte 0x08140f25
	.4byte 0x08140a65
	.4byte 0x08140dc5
	.4byte 0x08141165

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
SystemText_IntroBoyNameLandon:
	.string "LANDON$"
SystemText_IntroBoyNameTerry:
	.string "TERRY$"
SystemText_IntroBoyNameSeth:
	.string "SETH$"
SystemText_IntroBoyNameTom:
	.string "TOM$"
SystemText_IntroGirlNameTerra:
	.string "TERRA$"
SystemText_IntroGirlNameKimmy:
	.string "KIMMY$"
SystemText_IntroGirlNameNicola:
	.string "NICOLA$"
SystemText_IntroGirlNameSara:
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

	.align 1
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

	.global gUnknown_084120EC
gUnknown_084120EC: @ 84120EC
Unknown_8412EC:
	.4byte Unknown_84120DC
Unknown_84120F0:
	.incbin "baserom.gba", 0x004120f0, 0xb0

	.global gUnknown_084121A0
gUnknown_084121A0: @ 84121A0
	.4byte Unknown_84120DC

	.global gUnknown_084121A4
gUnknown_084121A4: @ 84121A4
	.4byte Unknown_84120F0

	.global gUnknown_084121A8
gUnknown_084121A8: @ 84121A8
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
	.incbin "baserom.gba", 0x00416f4a, 0x8
Unknown_8416F52:
	.incbin "baserom.gba", 0x00416f52, 0x8
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
	.incbin "baserom.gba", 0x0042f240, 0x8

	.global gUnknown_0842F248
gUnknown_0842F248: @ 842F248
	.incbin "baserom.gba", 0x0042f248, 0x8

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
