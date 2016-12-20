	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_0830FD14:: @ 830FD14
	.byte 1, 1, 6, 7, 8, 9, 6, 7, 8, 9, 11, 11, 0, 0, 0, 0

	.align 2
gSpriteTemplate_830FD24:: @ 830FD24
	spr_template 0, 0xFFFF, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, ObjectCB_CameraObject

	.align 2
gUnknown_0830FD3C:: @ 830FD3C
	.4byte CameraObject_0
	.4byte CameraObject_1
	.4byte CameraObject_2

@ 830FD48
	.include "data/graphics/field_objects/map_object_graphics.inc"

@ 8368528
	.include "data/graphics/field_objects/field_effect_object_graphics.inc"

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
	.byte 0
	.byte 0
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0

gUnknown_0836DC09:: @ 836DC09
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_NORTH
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_NORTH
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_NORTH
	.byte DIR_WEST
	.byte DIR_SOUTH
	.byte DIR_EAST
	.byte DIR_WEST
	.byte DIR_NORTH
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_EAST
	.byte DIR_NORTH
	.byte DIR_WEST
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_SOUTH

@ 836DC58
	.include "data/graphics/field_objects/map_object_graphics_info_pointers.inc"

@ 836DFC0
	.include "data/graphics/field_objects/field_effect_object_template_pointers.inc"

@ 836E050
	.include "data/graphics/field_objects/map_object_pic_tables.inc"

@ 83708C8
	.include "data/graphics/field_objects/map_object_anims.inc"

@ 83711C4
	.include "data/graphics/field_objects/base_oam.inc"

@ 8371204
	.include "data/graphics/field_objects/map_object_subsprites.inc"

@ 83718D4
	.include "data/graphics/field_objects/map_object_graphics_info.inc"

	.align 2
gUnknown_0837377C:: @ 837377C
	obj_pal gMapObjectPalette0, 0x1103
	obj_pal gMapObjectPalette1, 0x1104
	obj_pal gMapObjectPalette2, 0x1105
	obj_pal gMapObjectPalette3, 0x1106
	obj_pal gMapObjectPalette4, 0x1107
	obj_pal gMapObjectPalette5, 0x1108
	obj_pal gMapObjectPalette6, 0x1109
	obj_pal gMapObjectPalette7, 0x110A
	obj_pal gMapObjectPalette8, 0x1100
	obj_pal gMapObjectPalette9, 0x1101
	obj_pal gMapObjectPalette10, 0x1102
	obj_pal gMapObjectPalette11, 0x1115
	obj_pal gMapObjectPalette12, 0x110B
	obj_pal gMapObjectPalette13, 0x110C
	obj_pal gMapObjectPalette14, 0x110D
	obj_pal gMapObjectPalette15, 0x110E
	obj_pal gMapObjectPalette16, 0x110F
	obj_pal gMapObjectPalette17, 0x1110
	obj_pal gMapObjectPalette18, 0x1111
	obj_pal gMapObjectPalette19, 0x1112
	obj_pal gMapObjectPalette20, 0x1113
	obj_pal gMapObjectPalette21, 0x1114
	obj_pal gMapObjectPalette22, 0x1116
	obj_pal gMapObjectPalette23, 0x1117
	obj_pal gMapObjectPalette24, 0x1118
	obj_pal gMapObjectPalette25, 0x1119
	obj_pal gMapObjectPalette26, 0x111A
	null_obj_pal

	.align 1
Palettes_837385C:
	.2byte 0x1101
	.2byte 0x1101
	.2byte 0x1101
	.2byte 0x1101

	@ unused?
	.2byte 0x1111
	.2byte 0x1111
	.2byte 0x1111
	.2byte 0x1111

	.align 1
Palettes_837386C:
	.2byte 0x1115
	.2byte 0x1115
	.2byte 0x1115
	.2byte 0x1115

	.align 2
gUnknown_08373874:: @ 8373874
	paired_pals 0x1100, Palettes_837385C
	paired_pals 0x1110, Palettes_837385C
	paired_pals 0x1115, Palettes_837386C
	paired_pals 0x11FF, NULL

	.align 1
Palettes_8373894:
	.2byte 0x110C
	.2byte 0x110C
	.2byte 0x110C
	.2byte 0x110C

	.align 1
Palettes_837389C:
	.2byte 0x110D
	.2byte 0x110D
	.2byte 0x110D
	.2byte 0x110D

	.align 1
Palettes_83738A4:
	.2byte 0x110E
	.2byte 0x110E
	.2byte 0x110E
	.2byte 0x110E

	.align 1
Palettes_83738AC:
	.2byte 0x1112
	.2byte 0x1112
	.2byte 0x1112
	.2byte 0x1112

	.align 1
Palettes_83738B4:
	.2byte 0x1113
	.2byte 0x1113
	.2byte 0x1113
	.2byte 0x1113

	.align 1
Palettes_83738BC:
	.2byte 0x1114
	.2byte 0x1114
	.2byte 0x1114
	.2byte 0x1114

	.align 1
Palettes_83738C4:
	.2byte 0x111A
	.2byte 0x111A
	.2byte 0x111A
	.2byte 0x111A

	.align 1
Palettes_83738CC:
	.2byte 0x1117
	.2byte 0x1117
	.2byte 0x1117
	.2byte 0x1117

	.align 1
Palettes_83738D4:
	.2byte 0x1119
	.2byte 0x1119
	.2byte 0x1119
	.2byte 0x1119

	.align 1
Palettes_83738DC:
	.2byte 0x1109
	.2byte 0x1109
	.2byte 0x1109
	.2byte 0x1109

	.align 2
gUnknown_083738E4:: @ 83738E4
	paired_pals 0x1100, Palettes_837385C
	paired_pals 0x1110, Palettes_837385C
	paired_pals 0x110B, Palettes_8373894
	paired_pals 0x110D, Palettes_837389C
	paired_pals 0x110E, Palettes_83738A4
	paired_pals 0x1112, Palettes_83738AC
	paired_pals 0x1113, Palettes_83738B4
	paired_pals 0x1114, Palettes_83738BC
	paired_pals 0x1116, Palettes_83738CC
	paired_pals 0x1118, Palettes_83738D4
	paired_pals 0x1105, Palettes_83738DC
	paired_pals 0x111A, Palettes_83738C4
	paired_pals 0x11FF, NULL

	.align 1
Unknown_837394C:
	.2byte 0x1100
	.2byte 0x1101
	.2byte 0x1103
	.2byte 0x1104
	.2byte 0x1105
	.2byte 0x1106
	.2byte 0x1107
	.2byte 0x1108
	.2byte 0x1109
	.2byte 0x110A

	.align 1
Unknown_8373960:
	.2byte 0x1100
	.2byte 0x1101
	.2byte 0x1103
	.2byte 0x1104
	.2byte 0x1105
	.2byte 0x1106
	.2byte 0x1107
	.2byte 0x1108
	.2byte 0x1109
	.2byte 0x110A

	.align 1
Unknown_8373974:
	.2byte 0x1100
	.2byte 0x1101
	.2byte 0x1103
	.2byte 0x1104
	.2byte 0x1105
	.2byte 0x1106
	.2byte 0x1107
	.2byte 0x1108
	.2byte 0x1109
	.2byte 0x110A

	.align 1
Unknown_8373988:
	.2byte 0x1100
	.2byte 0x1101
	.2byte 0x1103
	.2byte 0x1104
	.2byte 0x1105
	.2byte 0x1106
	.2byte 0x1107
	.2byte 0x1108
	.2byte 0x1109
	.2byte 0x110A

	.align 2
gUnknown_0837399C:: @ 837399C
	.4byte Unknown_837394C
	.4byte Unknown_8373960
	.4byte Unknown_8373974
	.4byte Unknown_8373988

@ 83739AC
	.include "data/graphics/field_objects/berry_tree_graphics_tables.inc"

@ 8374524
	.include "data/graphics/field_objects/field_effect_objects.inc"

	.align 1
gUnknown_0837520C:: @ 837520C
	.2byte 0x20, 0x40, 0x60, 0x80, 0x20, 0x40, 0x80, 0xC0

	.align 1
gUnknown_0837521C:: @ 837521C
	.2byte 0x20, 0x30, 0x40, 0x50

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
	.byte DIR_SOUTH, DIR_NORTH, DIR_WEST, DIR_EAST

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
	.byte DIR_SOUTH, DIR_NORTH

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
	.byte DIR_WEST, DIR_EAST

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
	.byte DIR_NORTH, DIR_WEST

	.align 2
gUnknown_08375324:: @ 8375324
	.4byte sub_805D8F8
	.4byte sub_805D90C
	.4byte sub_805D938
	.4byte sub_805D97C
	.4byte sub_805D9AC

gUnknown_08375338:: @ 8375338
	.byte DIR_NORTH, DIR_EAST

	.align 2
gUnknown_0837533C:: @ 837533C
	.4byte sub_805DA38
	.4byte sub_805DA4C
	.4byte sub_805DA78
	.4byte sub_805DABC
	.4byte sub_805DAEC

gUnknown_08375350:: @ 8375350
	.byte DIR_SOUTH, DIR_WEST

	.align 2
gUnknown_08375354:: @ 8375354
	.4byte sub_805DB78
	.4byte sub_805DB8C
	.4byte sub_805DBB8
	.4byte sub_805DBFC
	.4byte sub_805DC2C

gUnknown_08375368:: @ 8375368
	.byte DIR_SOUTH, DIR_EAST

	.align 2
gUnknown_0837536C:: @ 837536C
	.4byte sub_805DCB8
	.4byte sub_805DCCC
	.4byte sub_805DCF8
	.4byte sub_805DD3C
	.4byte sub_805DD6C

gUnknown_08375380:: @ 8375380
	.byte DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_SOUTH

	.align 2
gUnknown_08375384:: @ 8375384
	.4byte sub_805DDF8
	.4byte sub_805DE0C
	.4byte sub_805DE38
	.4byte sub_805DE7C
	.4byte sub_805DEAC

gUnknown_08375398:: @ 8375398
	.byte DIR_SOUTH, DIR_NORTH, DIR_EAST, DIR_SOUTH

	.align 2
gUnknown_0837539C:: @ 837539C
	.4byte sub_805DF38
	.4byte sub_805DF4C
	.4byte sub_805DF78
	.4byte sub_805DFBC
	.4byte sub_805DFEC

gUnknown_083753B0:: @ 83753B0
	.byte DIR_NORTH, DIR_WEST, DIR_EAST, DIR_NORTH

	.align 2
gUnknown_083753B4:: @ 83753B4
	.4byte sub_805E078
	.4byte sub_805E08C
	.4byte sub_805E0B8
	.4byte sub_805E0FC
	.4byte sub_805E12C

gUnknown_083753C8:: @ 83753C8
	.byte DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_SOUTH

	.align 2
gUnknown_083753CC:: @ 83753CC
	.4byte sub_805E1B8
	.4byte sub_805E1E4
	.4byte sub_805E208
	.4byte sub_805E234

gUnknown_083753DC:: @ 83753DC
	.byte DIR_SOUTH, DIR_EAST, DIR_WEST, DIR_SOUTH, DIR_NORTH

	.align 2
gUnknown_083753E4:: @ 83753E4
	.4byte sub_805E2BC
	.4byte sub_805E2E8
	.4byte sub_805E30C
	.4byte sub_805E338

gUnknown_083753F4:: @ 83753F4
	.byte DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH

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
	.byte DIR_NORTH, DIR_EAST, DIR_WEST, DIR_SOUTH

	.align 2
gUnknown_0837541C:: @ 837541C
	.4byte sub_805E4EC
	.4byte sub_805E6AC
	.4byte sub_805E5B4

	.align 2
gUnknown_08375428:: @ 8375428
	.byte DIR_EAST, DIR_WEST, DIR_SOUTH, DIR_NORTH

gUnknown_0837542C:: @ 837542C
	.4byte sub_805E4EC
	.4byte sub_805E738
	.4byte sub_805E5B4

gUnknown_08375438:: @ 8375438
	.byte DIR_SOUTH, DIR_NORTH, DIR_EAST, DIR_WEST

	.align 2
gUnknown_0837543C:: @ 837543C
	.4byte sub_805E4EC
	.4byte sub_805E7C4
	.4byte sub_805E5B4

gUnknown_08375448:: @ 8375448
	.byte DIR_WEST, DIR_SOUTH, DIR_NORTH, DIR_EAST

	.align 2
gUnknown_0837544C:: @ 837544C
	.4byte sub_805E4EC
	.4byte sub_805E850
	.4byte sub_805E5B4

gUnknown_08375458:: @ 8375458
	.byte DIR_NORTH, DIR_WEST, DIR_EAST, DIR_SOUTH

	.align 2
gUnknown_0837545C:: @ 837545C
	.4byte sub_805E4EC
	.4byte sub_805E8DC
	.4byte sub_805E5B4

gUnknown_08375468:: @ 8375468
	.byte DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_NORTH

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
	.byte DIR_EAST, DIR_SOUTH, DIR_NORTH, DIR_WEST

	.align 2
gUnknown_08375488:: @ 8375488
	.4byte sub_805E4EC
	.4byte sub_805EA80
	.4byte sub_805E5B4

gUnknown_08375494:: @ 8375494
	.byte DIR_WEST, DIR_NORTH, DIR_SOUTH, DIR_EAST

	.align 2
gUnknown_08375498:: @ 8375498
	.4byte sub_805E4EC
	.4byte sub_805EB0C
	.4byte sub_805E5B4

gUnknown_083754A4:: @ 83754A4
	.byte DIR_NORTH, DIR_SOUTH, DIR_EAST, DIR_WEST

	.align 2
gUnknown_083754A8:: @ 83754A8
	.4byte sub_805E4EC
	.4byte sub_805EB98
	.4byte sub_805E5B4

gUnknown_083754B4:: @ 83754B4
	.byte DIR_EAST, DIR_WEST, DIR_NORTH, DIR_SOUTH

	.align 2
gUnknown_083754B8:: @ 83754B8
	.4byte sub_805E4EC
	.4byte sub_805EC24
	.4byte sub_805E5B4

gUnknown_083754C4:: @ 83754C4
	.byte DIR_SOUTH, DIR_EAST, DIR_WEST, DIR_NORTH

	.align 2
gUnknown_083754C8:: @ 83754C8
	.4byte sub_805E4EC
	.4byte sub_805ECB0
	.4byte sub_805E5B4

gUnknown_083754D4:: @ 83754D4
	.byte DIR_EAST, DIR_NORTH, DIR_SOUTH, DIR_WEST

	.align 2
gUnknown_083754D8:: @ 83754D8
	.4byte sub_805E4EC
	.4byte sub_805ED3C
	.4byte sub_805E5B4

gUnknown_083754E4:: @ 83754E4
	.byte DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST

	.align 2
gUnknown_083754E8:: @ 83754E8
	.4byte sub_805E4EC
	.4byte sub_805EDC8
	.4byte sub_805E5B4

gUnknown_083754F4:: @ 83754F4
	.byte DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH

	.align 2
gUnknown_083754F8:: @ 83754F8
	.4byte sub_805E4EC
	.4byte sub_805EE54
	.4byte sub_805E5B4

gUnknown_08375504:: @ 8375504
	.byte DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH

	.align 2
gUnknown_08375508:: @ 8375508
	.4byte sub_805E4EC
	.4byte sub_805EEE0
	.4byte sub_805E5B4

gUnknown_08375514:: @ 8375514
	.byte DIR_NORTH, DIR_WEST, DIR_SOUTH, DIR_EAST

	.align 2
gUnknown_08375518:: @ 8375518
	.4byte sub_805E4EC
	.4byte sub_805EF6C
	.4byte sub_805E5B4

gUnknown_08375524:: @ 8375524
	.byte DIR_SOUTH, DIR_EAST, DIR_NORTH, DIR_WEST

	.align 2
gUnknown_08375528:: @ 8375528
	.4byte sub_805E4EC
	.4byte sub_805EFF8
	.4byte sub_805E5B4

gUnknown_08375534:: @ 8375534
	.byte DIR_WEST, DIR_SOUTH, DIR_EAST, DIR_NORTH

	.align 2
gUnknown_08375538:: @ 8375538
	.4byte sub_805E4EC
	.4byte sub_805F084
	.4byte sub_805E5B4

gUnknown_08375544:: @ 8375544
	.byte DIR_EAST, DIR_NORTH, DIR_WEST, DIR_SOUTH

	.align 2
gUnknown_08375548:: @ 8375548
	.4byte sub_805E4EC
	.4byte sub_805F110
	.4byte sub_805E5B4

gUnknown_08375554:: @ 8375554
	.byte DIR_NORTH, DIR_EAST, DIR_SOUTH, DIR_WEST

	.align 2
gUnknown_08375558:: @ 8375558
	.4byte sub_805E4EC
	.4byte sub_805F19C
	.4byte sub_805E5B4

gUnknown_08375564:: @ 8375564
	.byte DIR_SOUTH, DIR_WEST, DIR_NORTH, DIR_EAST

	.align 2
gUnknown_08375568:: @ 8375568
	.4byte sub_805E4EC
	.4byte sub_805F228
	.4byte sub_805E5B4

gUnknown_08375574:: @ 8375574
	.byte DIR_WEST, DIR_NORTH, DIR_EAST, DIR_SOUTH

	.align 2
gUnknown_08375578:: @ 8375578
	.4byte sub_805E4EC
	.4byte sub_805F2B4
	.4byte sub_805E5B4

	.align 2
gUnknown_08375584:: @ 8375584
	.byte DIR_EAST, DIR_SOUTH, DIR_WEST, DIR_NORTH

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
	.byte 0x00, 0x00, 0x01, 0x02, 0x03, 0x00, 0x00, 0x01, 0x01

gUnknown_083755FD:: @ 83755FD
	.byte 0x04, 0x04, 0x05, 0x06, 0x07, 0x04, 0x04, 0x05, 0x05

gUnknown_08375606:: @ 8375606
	.byte 0x08, 0x08, 0x09, 0x0A, 0x0B, 0x08, 0x08, 0x09, 0x09

gUnknown_0837560F:: @ 837560F
	.byte 0x0C, 0x0C, 0x0D, 0x0E, 0x0F, 0x0C, 0x0C, 0x0D, 0x0D

gUnknown_08375618:: @ 8375618
	.byte 0x10, 0x10, 0x11, 0x12, 0x13, 0x10, 0x10, 0x11, 0x11

gUnknown_08375621:: @ 8375621
	.byte 0x14, 0x14, 0x15, 0x16, 0x17, 0x14, 0x14, 0x15, 0x15

gUnknown_0837562A:: @ 837562A
	.byte 0x14, 0x14, 0x15, 0x16, 0x17, 0x14, 0x14, 0x15, 0x15

gUnknown_08375633:: @ 8375633
	.byte 0x18, 0x18, 0x19, 0x1A, 0x1B, 0x18, 0x18, 0x19, 0x19

gUnknown_0837563C:: @ 837563C
	.byte 0x1C, 0x1C, 0x1D, 0x1E, 0x1F, 0x1C, 0x1C, 0x1D, 0x1D

gUnknown_08375645:: @ 8375645
	.byte 0x20, 0x20, 0x21, 0x22, 0x23, 0x20, 0x20, 0x21, 0x21

gUnknown_0837564E:: @ 837564E
	.byte 0x24, 0x24, 0x25, 0x26, 0x27, 0x24, 0x24, 0x25, 0x25

gUnknown_08375657:: @ 8375657
	.byte 0x00, 0x00, 0x01, 0x02, 0x03, 0x00, 0x00, 0x01, 0x01

gUnknown_08375660:: @ 8375660
	.byte 0x04, 0x04, 0x05, 0x06, 0x07, 0x04, 0x04, 0x05, 0x05

gUnknown_08375669:: @ 8375669
	.byte 0x08, 0x08, 0x09, 0x0A, 0x0B, 0x08, 0x08, 0x09, 0x09

gUnknown_08375672:: @ 8375672
	.byte 0x14, 0x14, 0x15, 0x16, 0x17, 0x14, 0x14, 0x15, 0x15

gUnknown_0837567B:: @ 837567B
	.byte 0x08, 0x08, 0x07, 0x09, 0x0A, 0x08, 0x08, 0x07, 0x07

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

	.align 1
gDirectionToVector:: @ 83756A4
	.2byte  0,  0
	.2byte  0,  1
	.2byte  0, -1
	.2byte -1,  0
	.2byte  1,  0
	.2byte -1,  1
	.2byte  1,  1
	.2byte -1, -1
	.2byte  1, -1

gUnknown_083756C8:: @ 83756C8
	.byte 0x00, 0x00, 0x01, 0x02, 0x03

gUnknown_083756CD:: @ 83756CD
	.byte 0x04, 0x04, 0x05, 0x06, 0x07

gUnknown_083756D2:: @ 83756D2
	.byte 0x08, 0x08, 0x09, 0x0A, 0x0B

gUnknown_083756D7:: @ 83756D7
	.byte 0x15, 0x15, 0x16, 0x17, 0x18

gUnknown_083756DC:: @ 83756DC
	.byte 0x29, 0x29, 0x2A, 0x2B, 0x2C

gUnknown_083756E1:: @ 83756E1
	.byte 0x2D, 0x2D, 0x2E, 0x2F, 0x30

gUnknown_083756E6:: @ 83756E6
	.byte 0x31, 0x31, 0x32, 0x33, 0x34

gUnknown_083756EB:: @ 83756EB
	.byte 0x35, 0x35, 0x36, 0x37, 0x38

gUnknown_083756F0:: @ 83756F0
	.byte 0x0C, 0x0C, 0x0D, 0x0E, 0x0F

gUnknown_083756F5:: @ 83756F5
	.byte 0x46, 0x46, 0x47, 0x48, 0x49

gUnknown_083756FA:: @ 83756FA
	.byte 0x4B, 0x4B, 0x4A, 0x4D, 0x4C

gUnknown_083756FF:: @ 83756FF
	.byte 0x42, 0x42, 0x43, 0x44, 0x45

gUnknown_08375704:: @ 8375704
	.byte 0x3A, 0x3A, 0x3B, 0x3C, 0x3D

gUnknown_08375709:: @ 8375709
	.byte 0x19, 0x19, 0x1A, 0x1B, 0x1C

gUnknown_0837570E:: @ 837570E
	.byte 0x1D, 0x1D, 0x1E, 0x1F, 0x20

gUnknown_08375713:: @ 8375713
	.byte 0x21, 0x21, 0x22, 0x23, 0x24

gUnknown_08375718:: @ 8375718
	.byte 0x25, 0x25, 0x26, 0x27, 0x28

gUnknown_0837571D:: @ 837571D
	.byte 0x62, 0x62, 0x63, 0x64, 0x65

gUnknown_08375722:: @ 8375722
	.byte 0x66, 0x66, 0x67, 0x68, 0x69

gUnknown_08375727:: @ 8375727
	.byte 0x6A, 0x6A, 0x6B, 0x6C, 0x6D

gUnknown_0837572C:: @ 837572C
	.byte 0x6E, 0x6E, 0x6F, 0x70, 0x71

gUnknown_08375731:: @ 8375731
	.byte 0x72, 0x72, 0x73, 0x74, 0x75

gUnknown_08375736:: @ 8375736
	.byte 0x76, 0x76, 0x77, 0x78, 0x79

gUnknown_0837573B:: @ 837573B
	.byte 0x7A, 0x7A, 0x7B, 0x7C, 0x7D

gUnknown_08375740:: @ 8375740
	.byte 0x7E, 0x7E, 0x7F, 0x80, 0x81

gUnknown_08375745:: @ 8375745
	.byte 0x82, 0x82, 0x83, 0x84, 0x85

gUnknown_0837574A:: @ 837574A
	.byte 0x86, 0x86, 0x87, 0x88, 0x89

gUnknown_0837574F:: @ 837574F
	.byte 2, 1, 4, 3, 8, 7, 6, 5

gUnknown_08375757:: @ 8375757
	.byte 2, 1, 4, 3, 1, 2, 3, 4, 3, 4, 2, 1, 4, 3, 1, 2

gUnknown_08375767:: @ 8375767
	.byte 2, 1, 4, 3, 1, 2, 3, 4, 4, 3, 1, 2, 3, 4, 2, 1

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

	.align 2
Unknown_83759A8:
	.4byte sub_8060CF0
	.4byte sub_8063474

	.align 2
Unknown_83759B0:
	.4byte sub_8060D00
	.4byte sub_8063474

	.align 2
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

	.align 2
Unknown_83759D4:
	.4byte sub_8060F3C
	.4byte sub_8060F5C
	.4byte sub_8063474

	.align 2
Unknown_83759E0:
	.4byte sub_8060F7C
	.4byte sub_8060F9C
	.4byte sub_8063474

	.align 2
Unknown_83759EC:
	.4byte sub_8060FBC
	.4byte sub_8060FDC
	.4byte sub_8063474

	.align 2
Unknown_83759F8:
	.4byte sub_8060FFC
	.4byte sub_806101C
	.4byte sub_8063474

	.align 2
Unknown_8375A04:
	.4byte sub_806103C
	.4byte sub_806105C
	.4byte sub_8063474

	.align 2
Unknown_8375A10:
	.4byte sub_806107C
	.4byte sub_806109C
	.4byte sub_8063474

	.align 2
Unknown_8375A1C:
	.4byte sub_80610BC
	.4byte sub_80610DC
	.4byte sub_8063474

	.align 2
Unknown_8375A28:
	.4byte sub_80610FC
	.4byte sub_806111C
	.4byte sub_8063474

	.align 1
gUnknown_08375A34:: @ 8375A34
	.2byte 0, 1, 1

	.align 1
gUnknown_08375A3A:: @ 8375A3A
	.2byte 0, 0, 1

	.align 2
Unknown_8375A40:
	.4byte sub_80613A8
	.4byte sub_80613D4
	.4byte sub_8063474

	.align 2
Unknown_8375A4C:
	.4byte sub_8061400
	.4byte sub_806142C
	.4byte sub_8063474

	.align 2
Unknown_8375A58:
	.4byte sub_8061458
	.4byte sub_8061484
	.4byte sub_8063474

	.align 2
Unknown_8375A64:
	.4byte sub_80614B0
	.4byte sub_80614DC
	.4byte sub_8063474

	.align 2
Unknown_8375A70:
	.4byte sub_806152C
	.4byte sub_8061510
	.4byte sub_8063470

	.align 2
Unknown_8375A7C:
	.4byte sub_806154C
	.4byte sub_8061510
	.4byte sub_8063470

	.align 2
Unknown_8375A88:
	.4byte sub_806156C
	.4byte sub_8061510
	.4byte sub_8063470

	.align 2
Unknown_8375A94:
	.4byte sub_806158C
	.4byte sub_8061510
	.4byte sub_8063470

	.align 2
Unknown_8375AA0:
	.4byte sub_80615AC
	.4byte sub_8061510
	.4byte sub_8063470

	.align 2
Unknown_8375AAC:
	.4byte sub_80615CC
	.4byte sub_80615EC
	.4byte sub_8063474

	.align 2
Unknown_8375AB8:
	.4byte sub_806160C
	.4byte sub_806162C
	.4byte sub_8063474

	.align 2
Unknown_8375AC4:
	.4byte sub_806164C
	.4byte sub_806166C
	.4byte sub_8063474

	.align 2
Unknown_8375AD0:
	.4byte sub_806168C
	.4byte sub_80616AC
	.4byte sub_8063474

	.align 2
Unknown_8375ADC:
	.4byte sub_8061778
	.4byte sub_806173C
	.4byte sub_8063474

	.align 2
Unknown_8375AE8:
	.4byte sub_80617B0
	.4byte sub_806173C
	.4byte sub_8063474

	.align 2
Unknown_8375AF4:
	.4byte sub_80617E8
	.4byte sub_806173C
	.4byte sub_8063474

	.align 2
Unknown_8375B00:
	.4byte sub_8061820
	.4byte sub_806173C
	.4byte sub_8063474

	.align 2
Unknown_8375B0C:
	.4byte sub_8061858
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B18:
	.4byte sub_8061890
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B24:
	.4byte sub_80618C8
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B30:
	.4byte sub_8061900
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B3C:
	.4byte sub_8061938
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B48:
	.4byte sub_8061970
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B54:
	.4byte sub_80619A8
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B60:
	.4byte sub_80619E0
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B6C:
	.4byte sub_8061A18
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B78:
	.4byte sub_8061A50
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B84:
	.4byte sub_8061A88
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B90:
	.4byte sub_8061AC0
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B9C:
	.4byte sub_8061AF8
	.4byte sub_8061B18
	.4byte sub_8063474

	.align 2
Unknown_8375BA8:
	.4byte sub_8061B38
	.4byte sub_8061B58
	.4byte sub_8063474

	.align 2
Unknown_8375BB4:
	.4byte sub_8061B78
	.4byte sub_8061B98
	.4byte sub_8063474

	.align 2
Unknown_8375BC0:
	.4byte sub_8061BB8
	.4byte sub_8061BD8
	.4byte sub_8063474

	.align 2
Unknown_8375BCC:
	.4byte sub_8061BF8
	.4byte sub_8061C18
	.4byte sub_8063474

	.align 2
Unknown_8375BD8:
	.4byte sub_8061C38
	.4byte sub_8061C58
	.4byte sub_8063474

	.align 2
Unknown_8375BE4:
	.4byte sub_8061C78
	.4byte sub_8061C98
	.4byte sub_8063474

	.align 2
Unknown_8375BF0:
	.4byte sub_8061CB8
	.4byte sub_8061CD8
	.4byte sub_8063474

	.align 2
Unknown_8375BFC:
	.4byte sub_8061CF8
	.4byte sub_8061D18
	.4byte sub_8063474

	.align 2
Unknown_8375C08:
	.4byte sub_8061D38
	.4byte sub_8061D58
	.4byte sub_8063474

	.align 2
Unknown_8375C14:
	.4byte sub_8061D78
	.4byte sub_8061D98
	.4byte sub_8063474

	.align 2
Unknown_8375C20:
	.4byte sub_8061DB8
	.4byte sub_8061DD8
	.4byte sub_8063474

	.align 2
Unknown_8375C2C:
	.4byte do_run_south_anim
	.4byte sub_8061E18
	.4byte sub_8063474

	.align 2
Unknown_8375C38:
	.4byte do_run_north_anim
	.4byte sub_8061E58
	.4byte sub_8063474

	.align 2
Unknown_8375C44:
	.4byte do_run_west_anim
	.4byte sub_8061E98
	.4byte sub_8063474

	.align 2
Unknown_8375C50:
	.4byte do_run_east_anim
	.4byte sub_8061ED8
	.4byte sub_8063474

	.align 2
Unknown_8375C5C:
	.4byte sub_8061F24
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375C68:
	.4byte sub_8061F90
	.4byte sub_8061FB0
	.4byte sub_8063474

	.align 2
Unknown_8375C74:
	.4byte sub_8061FD8
	.4byte sub_8061FF8
	.4byte sub_8063474

	.align 2
Unknown_8375C80:
	.4byte sub_8062020
	.4byte sub_8062040
	.4byte sub_8063474

	.align 2
Unknown_8375C8C:
	.4byte sub_8062068
	.4byte sub_8062088
	.4byte sub_8063474

	.align 2
Unknown_8375C98:
	.4byte sub_80620B0
	.4byte sub_8063474

	.align 2
Unknown_8375CA0:
	.4byte sub_806210C
	.4byte sub_8063474

	.align 2
Unknown_8375CA8:
	.4byte sub_8062170
	.4byte sub_8063474

	.align 2
Unknown_8375CB0:
	.4byte sub_8062180
	.4byte sub_8063474

	.align 2
Unknown_8375CB8:
	.4byte sub_8062190
	.4byte sub_80621BC
	.4byte sub_8063474

	.align 2
Unknown_8375CC4:
	.4byte sub_80621E8
	.4byte sub_8062214
	.4byte sub_8063474

	.align 2
Unknown_8375CD0:
	.4byte sub_8062240
	.4byte sub_806226C
	.4byte sub_8063474

	.align 2
Unknown_8375CDC:
	.4byte sub_8062298
	.4byte sub_80622C4
	.4byte sub_8063474

	.align 2
Unknown_8375CE8:
	.4byte sub_80622F0
	.4byte sub_806231C
	.4byte sub_8063474

	.align 2
Unknown_8375CF4:
	.4byte sub_8062348
	.4byte sub_8062374
	.4byte sub_8063474

	.align 2
Unknown_8375D00:
	.4byte sub_80623A0
	.4byte sub_80623CC
	.4byte sub_8063474

	.align 2
Unknown_8375D0C:
	.4byte sub_80623F8
	.4byte sub_8062424
	.4byte sub_8063474

	.align 2
Unknown_8375D18:
	.4byte sub_8062450
	.4byte sub_806247C
	.4byte sub_8063474

	.align 2
Unknown_8375D24:
	.4byte sub_80624A8
	.4byte sub_80624D4
	.4byte sub_8063474

	.align 2
Unknown_8375D30:
	.4byte sub_8062500
	.4byte sub_806252C
	.4byte sub_8063474

	.align 2
Unknown_8375D3C:
	.4byte sub_8062558
	.4byte sub_8062584
	.4byte sub_8063474

	.align 2
Unknown_8375D48:
	.4byte sub_80625B0
	.4byte sub_8063474

	.align 2
Unknown_8375D50:
	.4byte sub_80625C8
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375D5C:
	.4byte sub_80625D8
	.4byte sub_8063470

	.align 2
Unknown_8375D64:
	.4byte sub_80625E8
	.4byte sub_8063470

	.align 2
Unknown_8375D6C:
	.4byte sub_80625F8
	.4byte sub_8063470

	.align 2
Unknown_8375D74:
	.4byte sub_8062608
	.4byte sub_8063470

	.align 2
Unknown_8375D7C:
	.4byte sub_8062634
	.4byte sub_8063470

	.align 2
Unknown_8375D84:
	.4byte sub_8062644
	.4byte sub_8063470

	.align 2
Unknown_8375D8C:
	.4byte do_exclamation_mark_bubble_1
	.4byte sub_8063470

	.align 2
Unknown_8375D94:
	.4byte do_exclamation_mark_bubble_2
	.4byte sub_8063470

	.align 2
Unknown_8375D9C:
	.4byte do_heart_bubble
	.4byte sub_8063470

	.align 2
Unknown_8375DA4:
	.4byte sub_80626C0
	.4byte sub_8062704
	.4byte sub_8063470

	.align 2
Unknown_8375DB0:
	.4byte sub_8062724
	.4byte sub_8062740
	.4byte sub_8062764
	.4byte sub_8063470

	.align 2
Unknown_8375DC0:
	.4byte sub_80627A0
	.4byte sub_80627BC
	.4byte sub_80627E0
	.4byte sub_8063470

	.align 2
Unknown_8375DD0:
	.4byte sub_806281C
	.4byte sub_8063470

	.align 2
Unknown_8375DD8:
	.4byte sub_806282C
	.4byte sub_8063470

	.align 2
Unknown_8375DE0:
	.4byte sub_806283C
	.4byte sub_8063470

	.align 2
Unknown_8375DE8:
	.4byte sub_806286C
	.4byte sub_8063470

	.align 2
Unknown_8375DF0:
	.4byte sub_806289C
	.4byte sub_80628D0
	.4byte sub_8063474

	.align 2
Unknown_8375DFC:
	.4byte sub_80628FC
	.4byte sub_8062930
	.4byte sub_8063474

	.align 2
Unknown_8375E08:
	.4byte sub_806299C
	.4byte sub_8063474

	.align 2
Unknown_8375E10:
	.4byte sub_80629AC
	.4byte sub_8063474

	.align 2
Unknown_8375E18:
	.4byte sub_80629BC
	.4byte sub_8063474

	.align 2
Unknown_8375E20:
	.4byte sub_80629CC
	.4byte sub_8063474

	.align 2
Unknown_8375E28:
	.4byte sub_80629DC
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E34:
	.4byte sub_8062A00
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E40:
	.4byte sub_8062A24
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E4C:
	.4byte sub_8062A48
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E58:
	.4byte sub_8062A6C
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E64:
	.4byte sub_8062A90
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E70:
	.4byte sub_8062AB4
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E7C:
	.4byte sub_8062AD8
	.4byte sub_8061F3C
	.4byte sub_8063474
	.4byte sub_8062AFC
	.4byte sub_8061F3C
	.4byte sub_8063474
	.4byte sub_8062B20
	.4byte sub_8061F3C
	.4byte sub_8063474
	.4byte sub_8062B44
	.4byte sub_8061F3C
	.4byte sub_8063474
	.4byte sub_8062B68
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375EB8:
	.4byte sub_8062BD0
	.4byte sub_8062BFC
	.4byte sub_8063474

	.align 2
Unknown_8375EC4:
	.4byte sub_8062C28
	.4byte sub_8062C54
	.4byte sub_8063474

	.align 2
Unknown_8375ED0:
	.4byte sub_8062C80
	.4byte sub_8062CAC
	.4byte sub_8063474

	.align 2
Unknown_8375EDC:
	.4byte sub_8062CD8
	.4byte sub_8062D04
	.4byte sub_8063474

	.align 2
Unknown_8375EE8:
	.4byte sub_8062D30
	.4byte sub_8062D5C
	.4byte sub_8063474

	.align 2
Unknown_8375EF4:
	.4byte sub_8062D88
	.4byte sub_8062DB4
	.4byte sub_8063474

	.align 2
Unknown_8375F00:
	.4byte sub_8062DE0
	.4byte sub_8062E0C
	.4byte sub_8063474

	.align 2
Unknown_8375F0C:
	.4byte sub_8062E38
	.4byte sub_8062E64
	.4byte sub_8063474

	.align 2
Unknown_8375F18:
	.4byte sub_8062E90
	.4byte sub_8062EBC
	.4byte sub_8063474

	.align 2
Unknown_8375F24:
	.4byte sub_8062EE8
	.4byte sub_8062F14
	.4byte sub_8063474

	.align 2
Unknown_8375F30:
	.4byte sub_8062F40
	.4byte sub_8062F6C
	.4byte sub_8063474

	.align 2
Unknown_8375F3C:
	.4byte sub_8062F98
	.4byte sub_8062FC4
	.4byte sub_8063474

	.align 2
Unknown_8375F48:
	.4byte sub_8062FF0
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375F54:
	.4byte sub_8063028
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375F60:
	.4byte sub_8063060
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375F6C:
	.4byte sub_8063098
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375F78:
	.4byte sub_8063108
	.4byte sub_8063128
	.4byte sub_8063474

	.align 2
Unknown_8375F84:
	.4byte sub_8063148
	.4byte sub_8063168
	.4byte sub_8063474

	.align 2
Unknown_8375F90:
	.4byte sub_8063188
	.4byte sub_80631A8
	.4byte sub_8063474

	.align 2
Unknown_8375F9C:
	.4byte sub_80631C8
	.4byte sub_80631E8
	.4byte sub_8063474

	.align 2
Unknown_8375FA8:
	.4byte sub_8063238
	.4byte sub_8063258
	.4byte sub_8063474

	.align 2
Unknown_8375FB4:
	.4byte sub_8063278
	.4byte sub_8063298
	.4byte sub_8063474

	.align 2
Unknown_8375FC0:
	.4byte sub_80632B8
	.4byte sub_80632D8
	.4byte sub_8063474

	.align 2
Unknown_8375FCC:
	.4byte sub_80632F8
	.4byte sub_8063318
	.4byte sub_8063474

	.align 2
Unknown_8375FD8:
	.4byte sub_8063370
	.4byte sub_8063390
	.4byte sub_8063474

	.align 2
Unknown_8375FE4:
	.4byte sub_80633B0
	.4byte sub_80633D0
	.4byte sub_8063474

	.align 2
Unknown_8375FF0:
	.4byte sub_80633F0
	.4byte sub_8063410
	.4byte sub_8063474

	.align 2
Unknown_8375FFC:
	.4byte sub_8063430
	.4byte sub_8063450
	.4byte sub_8063474
