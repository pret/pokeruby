	.align 2

gMapObjectGraphicsInfo_BrendanNormal: ; 83718D4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_BrendanMayNormal
	.4byte gMapObjectPicTable_BrendanNormal
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BrendanMachBike: ; 83718F8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_BIKE_TIRE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_BrendanMachBike
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BrendanAcroBike: ; 837191C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_BIKE_TIRE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_AcroBike
	.4byte gMapObjectPicTable_BrendanAcroBike
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BrendanSurfing: ; 8371940
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_DISABLE_REFLECTION_PALETTE_LOAD | (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Surfing
	.4byte gMapObjectPicTable_BrendanSurfing
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BrendanFieldMove: ; 8371964
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_FieldMove
	.4byte gMapObjectPicTable_BrendanFieldMove
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_QuintyPlump: ; 8371988
	.2byte 0xFFFF ; tiles tag
	.2byte 0x110B ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_L << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_QuintyPlump
	.4byte gMapObjectPicTable_QuintyPlump
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_LittleBoy1: ; 83719AC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_LittleBoy1
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_LittleGirl1: ; 83719D0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_LittleGirl1
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Boy1: ; 83719F4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Boy1
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Girl1: ; 8371A18
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Girl1
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Boy2: ; 8371A3C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Boy2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Girl2: ; 8371A60
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Girl2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_LittleBoy2: ; 8371A84
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_LittleBoy2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_LittleGirl2: ; 8371AA8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_LittleGirl2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Boy3: ; 8371ACC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Boy3
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Girl3: ; 8371AF0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Girl3
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Boy4: ; 8371B14
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Boy4
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Woman1: ; 8371B38
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Woman1
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_FatMan: ; 8371B5C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_FatMan
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Woman2: ; 8371B80
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Woman2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Man1: ; 8371BA4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Man1
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Woman3: ; 8371BC8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Woman3
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_OldMan1: ; 8371BEC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_OldMan1
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_OldWoman1: ; 8371C10
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_OldWoman1
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Man2: ; 8371C34
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Man2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Woman4: ; 8371C58
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Woman4
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Man3: ; 8371C7C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Man3
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Woman5: ; 8371CA0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Woman5
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Cook: ; 8371CC4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Cook
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Woman6: ; 8371CE8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Woman6
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_OldMan2: ; 8371D0C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_OldMan2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_OldWoman2: ; 8371D30
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_OldWoman2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Camper: ; 8371D54
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Camper
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Picnicker: ; 8371D78
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Picnicker
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Man4: ; 8371D9C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Man4
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Woman7: ; 8371DC0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Woman7
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Youngster: ; 8371DE4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Youngster
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BugCatcher: ; 8371E08
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_BugCatcher
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_PsychicM: ; 8371E2C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_PsychicM
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_SchoolKidM: ; 8371E50
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_SchoolKidM
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Maniac: ; 8371E74
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Maniac
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_HexManiac: ; 8371E98
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_HexManiac
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Woman8: ; 8371EBC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Woman8
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_SwimmerM: ; 8371EE0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_SwimmerM
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_SwimmerF: ; 8371F04
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_SwimmerF
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BlackBelt: ; 8371F28
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_BlackBelt
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Beauty: ; 8371F4C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Beauty
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Scientist1: ; 8371F70
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Scientist1
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Lass: ; 8371F94
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Lass
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Gentleman: ; 8371FB8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Gentleman
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Sailor: ; 8371FDC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Sailor
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Fisherman: ; 8372000
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Fisherman
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RunningTriathleteM: ; 8372024
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_RunningTriathleteM
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RunningTriathleteF: ; 8372048
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_RunningTriathleteF
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_TuberF: ; 837206C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_TuberF
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_TuberM: ; 8372090
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_TuberM
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Hiker: ; 83720B4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Hiker
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_CyclingTriathleteM: ; 83720D8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_BIKE_TIRE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_AcroBike
	.4byte gMapObjectPicTable_CyclingTriathleteM
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_CyclingTriathleteF: ; 83720FC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_BIKE_TIRE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_AcroBike
	.4byte gMapObjectPicTable_CyclingTriathleteF
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Nurse: ; 8372120
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Nurse
	.4byte gMapObjectPicTable_Nurse
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_ItemBall: ; 8372144
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_ItemBall
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BerryTree: ; 8372168
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte NULL ; OAM tables
	.4byte gMapObjectImageAnimTable_BerryTree
	.4byte gMapObjectPicTable_PechaBerryTree
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BerryTreeEarlyStages: ; 837218C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_BerryTree
	.4byte gMapObjectPicTable_PechaBerryTree
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BerryTreeLateStages: ; 83721B0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_BerryTree
	.4byte gMapObjectPicTable_PechaBerryTree
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_ProfBirch: ; 83721D4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_ProfBirch
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Man5: ; 83721F8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Man5
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Man6: ; 837221C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Man6
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_ReporterM: ; 8372240
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_ReporterM
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_ReporterF: ; 8372264
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_ReporterF
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Bard: ; 8372288
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MauvilleOldMan1
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Hipster: ; 83722AC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MauvilleOldMan1
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Trader: ; 83722D0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MauvilleOldMan1
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Storyteller: ; 83722F4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MauvilleOldMan2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Giddy: ; 8372318
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MauvilleOldMan2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_UnusedMauvilleOldMan1: ; 837233C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MauvilleOldMan2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_UnusedMauvilleOldMan2: ; 8372360
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MauvilleOldMan2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_UnusedNatuDoll: ; 8372384
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_UnusedNatuDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_UnusedMagnemiteDoll: ; 83723A8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_UnusedMagnemiteDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_UnusedSquirtleDoll: ; 83723CC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_UnusedSquirtleDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_UnusedWooperDoll: ; 83723F0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_UnusedWooperDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_UnusedPikachuDoll: ; 8372414
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_UnusedPikachuDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_UnusedPorygon2Doll: ; 8372438
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_UnusedPorygon2Doll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_CuttableTree: ; 837245C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_CuttableTree
	.4byte gMapObjectPicTable_CuttableTree
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MartEmployee: ; 8372480
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MartEmployee
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RooftopSaleWoman: ; 83724A4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_RooftopSaleWoman
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Teala: ; 83724C8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Teala
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BreakableRock: ; 83724EC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_BreakableRock
	.4byte gMapObjectPicTable_BreakableRock
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_PushableBoulder: ; 8372510
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_PushableBoulder
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MrBrineysBoat: ; 8372534
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MrBrineysBoat
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MayNormal: ; 8372558
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_BrendanMayNormal
	.4byte gMapObjectPicTable_MayNormal
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MayMachBike: ; 837257C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_BIKE_TIRE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MayMachBike
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MayAcroBike: ; 83725A0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_BIKE_TIRE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_AcroBike
	.4byte gMapObjectPicTable_MayAcroBike
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MaySurfing: ; 83725C4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_DISABLE_REFLECTION_PALETTE_LOAD | (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Surfing
	.4byte gMapObjectPicTable_MaySurfing
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MayFieldMove: ; 83725E8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_FieldMove
	.4byte gMapObjectPicTable_MayFieldMove
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Truck: ; 837260C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x110D ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 1152 ; image size
	.2byte 48 ; width
	.2byte 48 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_Truck
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_Truck
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MachokeCarryingBox: ; 8372630
	.2byte 0xFFFF ; tiles tag
	.2byte 0x110E ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MachokeCarryingBox
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MachokeFacingAway: ; 8372654
	.2byte 0xFFFF ; tiles tag
	.2byte 0x110E ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MachokeFacingAway
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BirchsBag: ; 8372678
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BirchsBag
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Poochyena: ; 837269C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x110F ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Poochyena
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Artist: ; 83726C0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Artist
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RivalBrendanNormal: ; 83726E4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_BrendanMayNormal
	.4byte gMapObjectPicTable_BrendanNormal
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RivalBrendanMachBike: ; 8372708
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_BIKE_TIRE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_BrendanMachBike
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RivalBrendanAcroBike: ; 837272C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_BIKE_TIRE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_AcroBike
	.4byte gMapObjectPicTable_BrendanAcroBike
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RivalBrendanSurfing: ; 8372750
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_DISABLE_REFLECTION_PALETTE_LOAD | (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Surfing
	.4byte gMapObjectPicTable_BrendanSurfing
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RivalBrendanFieldMove: ; 8372774
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_FieldMove
	.4byte gMapObjectPicTable_BrendanFieldMove
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RivalMayNormal: ; 8372798
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_BrendanMayNormal
	.4byte gMapObjectPicTable_MayNormal
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RivalMayMachBike: ; 83727BC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_BIKE_TIRE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MayMachBike
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RivalMayAcroBike: ; 83727E0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_BIKE_TIRE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_AcroBike
	.4byte gMapObjectPicTable_MayAcroBike
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RivalMaySurfing: ; 8372804
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_DISABLE_REFLECTION_PALETTE_LOAD | (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Surfing
	.4byte gMapObjectPicTable_MaySurfing
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RivalMayFieldMove: ; 8372828
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_FieldMove
	.4byte gMapObjectPicTable_MayFieldMove
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Cameraman: ; 837284C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Cameraman
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BrendanUnderwater: ; 8372870
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1115 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_DISABLE_REFLECTION_PALETTE_LOAD | (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_BrendanUnderwater
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MayUnderwater: ; 8372894
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1115 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_DISABLE_REFLECTION_PALETTE_LOAD | (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MayUnderwater
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MovingBox: ; 83728B8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1112 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_MovingBox
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_CableCar: ; 83728DC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1113 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 2048 ; image size
	.2byte 64 ; width
	.2byte 64 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_64x64
	.4byte gMapObjectSubspriteTables_CableCar
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_CableCar
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Scientist2: ; 8372900
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Scientist2
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Man7: ; 8372924
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Man7
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_AquaMemberM: ; 8372948
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_AquaMemberM
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_AquaMemberF: ; 837296C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_AquaMemberF
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MagmaMemberM: ; 8372990
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MagmaMemberM
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MagmaMemberF: ; 83729B4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MagmaMemberF
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Sidney: ; 83729D8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Sidney
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Phoebe: ; 83729FC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Phoebe
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Glacia: ; 8372A20
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Glacia
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Drake: ; 8372A44
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Drake
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Roxanne: ; 8372A68
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Roxanne
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Brawly: ; 8372A8C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Brawly
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Wattson: ; 8372AB0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Wattson
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Flannery: ; 8372AD4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Flannery
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Norman: ; 8372AF8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Norman
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Winona: ; 8372B1C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Winona
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Liza: ; 8372B40
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Liza
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Tate: ; 8372B64
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Tate
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Wallace: ; 8372B88
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Wallace
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Steven: ; 8372BAC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Steven
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Wally: ; 8372BD0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Wally
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_LittleBoy3: ; 8372BF4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_LittleBoy3
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BrendanFishing: ; 8372C18
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Fishing
	.4byte gMapObjectPicTable_BrendanFishing
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MayFishing: ; 8372C3C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Fishing
	.4byte gMapObjectPicTable_MayFishing
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_HotSpringsOldWoman: ; 8372C60
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_HotSpringsOldWoman
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_SSTidal: ; 8372C84
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1114 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 1920 ; image size
	.2byte 96 ; width
	.2byte 40 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_8x8
	.4byte gMapObjectSubspriteTables_SSTidal
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_SSTidal
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_SubmarineShadow: ; 8372CA8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x111A ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 1408 ; image size
	.2byte 88 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_8x8
	.4byte gMapObjectSubspriteTables_SubmarineShadow
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_SubmarineShadow
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_PichuDoll: ; 8372CCC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_PichuDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_PikachuDoll: ; 8372CF0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_PikachuDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MarillDoll: ; 8372D14
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_MarillDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_TogepiDoll: ; 8372D38
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_TogepiDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_CyndaquilDoll: ; 8372D5C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_CyndaquilDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_ChikoritaDoll: ; 8372D80
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_ChikoritaDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_TotodileDoll: ; 8372DA4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_TotodileDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_JigglypuffDoll: ; 8372DC8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_JigglypuffDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MeowthDoll: ; 8372DEC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_MeowthDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_ClefairyDoll: ; 8372E10
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_ClefairyDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_DittoDoll: ; 8372E34
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_DittoDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_SmoochumDoll: ; 8372E58
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_SmoochumDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_TreeckoDoll: ; 8372E7C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_TreeckoDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_TorchicDoll: ; 8372EA0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_TorchicDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MudkipDoll: ; 8372EC4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_MudkipDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_DuskullDoll: ; 8372EE8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_DuskullDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_WynautDoll: ; 8372F0C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_WynautDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BaltoyDoll: ; 8372F30
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BaltoyDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_KecleonDoll: ; 8372F54
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_KecleonDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_AzurillDoll: ; 8372F78
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_AzurillDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_SkittyDoll: ; 8372F9C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_SkittyDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_SwabluDoll: ; 8372FC0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_SwabluDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_GulpinDoll: ; 8372FE4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_GulpinDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_LotadDoll: ; 8373008
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_LotadDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_SeedotDoll: ; 837302C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_SeedotDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_PikaCushion: ; 8373050
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_PikaCushion
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_RoundCushion: ; 8373074
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_RoundCushion
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_KissCushion: ; 8373098
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_KissCushion
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_ZigzagCushion: ; 83730BC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_ZigzagCushion
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_SpinCushion: ; 83730E0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_SpinCushion
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_DiamondCushion: ; 8373104
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_DiamondCushion
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BallCushion: ; 8373128
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BallCushion
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_GrassCushion: ; 837314C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_GrassCushion
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_FireCushion: ; 8373170
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_FireCushion
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_WaterCushion: ; 8373194
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_WaterCushion
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BigSnorlaxDoll: ; 83731B8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BigSnorlaxDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BigRhydonDoll: ; 83731DC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BigRhydonDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BigLaprasDoll: ; 8373200
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BigLaprasDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BigVenusaurDoll: ; 8373224
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BigVenusaurDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BigCharizardDoll: ; 8373248
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BigCharizardDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BigBlastoiseDoll: ; 837326C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BigBlastoiseDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BigWailmerDoll: ; 8373290
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BigWailmerDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BigRegirockDoll: ; 83732B4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BigRegirockDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BigRegiceDoll: ; 83732D8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BigRegiceDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BigRegisteelDoll: ; 83732FC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BigRegisteelDoll
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Latias: ; 8373320
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_LatiasLatios
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Latios: ; 8373344
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_LatiasLatios
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Boy5: ; 8373368
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Boy5
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_ContestJudge: ; 837338C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_ContestJudge
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BrendanWatering: ; 83733B0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_BrendanWatering
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MayWatering: ; 83733D4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 0 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_MayWatering
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_BrendanDecorating: ; 83733F8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1100 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_BrendanDecorating
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_MayDecorating: ; 837341C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_MayDecorating
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Archie: ; 8373440
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Archie
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Maxie: ; 8373464
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Maxie
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Kyogre1: ; 8373488
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Kyogre
	.4byte gMapObjectRotScalAnimTable_KyogreGroudon

	.align 2

gMapObjectGraphicsInfo_Groudon1: ; 83734AC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Groudon
	.4byte gMapObjectRotScalAnimTable_KyogreGroudon

	.align 2

gMapObjectGraphicsInfo_Fossil: ; 83734D0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte F_INANIMATE | (SHADOW_SIZE_S << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_NONE
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Inanimate
	.4byte gMapObjectPicTable_Fossil
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Regirock: ; 83734F4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Regi
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Regice: ; 8373518
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Regi
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Registeel: ; 837353C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Regi
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Skitty: ; 8373560
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Skitty
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Kecleon1: ; 8373584
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Kecleon
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Kyogre2: ; 83735A8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1116 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Kyogre
	.4byte gMapObjectRotScalAnimTable_KyogreGroudon

	.align 2

gMapObjectGraphicsInfo_Groudon2: ; 83735CC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1118 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Groudon
	.4byte gMapObjectRotScalAnimTable_KyogreGroudon

	.align 2

gMapObjectGraphicsInfo_Rayquaza: ; 83735F0
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 512 ; image size
	.2byte 32 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 4 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_32x32
	.4byte gMapObjectSubspriteTables_32x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Rayquaza
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Zigzagoon: ; 8373614
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Zigzagoon
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Pikachu: ; 8373638
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Pikachu
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Azumarill: ; 837365C
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Azumarill
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Wingull: ; 8373680
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Wingull
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Kecleon2: ; 83736A4
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1105 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Kecleon
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_TuberMSwimming: ; 83736C8
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1104 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 3 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_TuberMSwimming
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Azurill: ; 83736EC
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1103 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 128 ; image size
	.2byte 16 ; width
	.2byte 16 ; height
	.byte (SHADOW_SIZE_M << 4) | 2 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x16
	.4byte gMapObjectSubspriteTables_16x16
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Azurill
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_Mom: ; 8373710
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1106 ; palette tag
	.2byte 0x11FF ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 5 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_Standard
	.4byte gMapObjectPicTable_Mom
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_LinkBrendan: ; 8373734
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_BrendanMayNormal
	.4byte gMapObjectPicTable_BrendanNormal
	.4byte gDummyObjectRotScalAnimTable

	.align 2

gMapObjectGraphicsInfo_LinkMay: ; 8373758
	.2byte 0xFFFF ; tiles tag
	.2byte 0x1110 ; palette tag
	.2byte 0x1102 ; palette tag 2
	.2byte 256 ; image size
	.2byte 16 ; width
	.2byte 32 ; height
	.byte (SHADOW_SIZE_M << 4) | 10 ; flags, shadow size, palette slot
	.byte TRACKS_FOOT
	.2byte 0 ; padding
	.4byte gFieldObjectBaseOam_16x32
	.4byte gMapObjectSubspriteTables_16x32
	.4byte gMapObjectImageAnimTable_BrendanMayNormal
	.4byte gMapObjectPicTable_MayNormal
	.4byte gDummyObjectRotScalAnimTable
