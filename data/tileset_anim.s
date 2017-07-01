	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
TilesetAnimTiles_General_0_1: @ 8376D84
	.incbin "data/tilesets/primary/general/anim/0/1.4bpp"

	.align 2
TilesetAnimTiles_General_0_0: @ 8376E04
	.incbin "data/tilesets/primary/general/anim/0/0.4bpp"

	.align 2
TilesetAnimTiles_General_0_2: @ 8376E84
	.incbin "data/tilesets/primary/general/anim/0/2.4bpp"

	.space 32

	.align 2
gTilesetAnimTable_General_0:: @ 8376F24
	.4byte TilesetAnimTiles_General_0_0
	.4byte TilesetAnimTiles_General_0_1
	.4byte TilesetAnimTiles_General_0_0
	.4byte TilesetAnimTiles_General_0_2

	.align 2
TilesetAnimTiles_General_1_0: @ 8376F34
	.incbin "data/tilesets/primary/general/anim/1/0.4bpp"

	.align 2
TilesetAnimTiles_General_1_1: @ 83772F4
	.incbin "data/tilesets/primary/general/anim/1/1.4bpp"

	.align 2
TilesetAnimTiles_General_1_2: @ 83776B4
	.incbin "data/tilesets/primary/general/anim/1/2.4bpp"

	.align 2
TilesetAnimTiles_General_1_3: @ 8377A74
	.incbin "data/tilesets/primary/general/anim/1/3.4bpp"

	.align 2
TilesetAnimTiles_General_1_4: @ 8377E34
	.incbin "data/tilesets/primary/general/anim/1/4.4bpp"

	.align 2
TilesetAnimTiles_General_1_5: @ 83781F4
	.incbin "data/tilesets/primary/general/anim/1/5.4bpp"

	.align 2
TilesetAnimTiles_General_1_6: @ 83785B4
	.incbin "data/tilesets/primary/general/anim/1/6.4bpp"

	.align 2
TilesetAnimTiles_General_1_7: @ 8378974
	.incbin "data/tilesets/primary/general/anim/1/7.4bpp"

	.align 2
gTilesetAnimTable_General_1:: @ 8378D34
	.4byte TilesetAnimTiles_General_1_0
	.4byte TilesetAnimTiles_General_1_1
	.4byte TilesetAnimTiles_General_1_2
	.4byte TilesetAnimTiles_General_1_3
	.4byte TilesetAnimTiles_General_1_4
	.4byte TilesetAnimTiles_General_1_5
	.4byte TilesetAnimTiles_General_1_6
	.4byte TilesetAnimTiles_General_1_7

	.align 2
TilesetAnimTiles_General_2_0: @ 8378D54
	.incbin "data/tilesets/primary/general/anim/2/0.4bpp"

	.align 2
TilesetAnimTiles_General_2_1: @ 8378E94
	.incbin "data/tilesets/primary/general/anim/2/1.4bpp"

	.align 2
TilesetAnimTiles_General_2_2: @ 8378FD4
	.incbin "data/tilesets/primary/general/anim/2/2.4bpp"

	.align 2
TilesetAnimTiles_General_2_3: @ 8379114
	.incbin "data/tilesets/primary/general/anim/2/3.4bpp"

	.align 2
TilesetAnimTiles_General_2_4: @ 8379254
	.incbin "data/tilesets/primary/general/anim/2/4.4bpp"

	.align 2
TilesetAnimTiles_General_2_5: @ 8379394
	.incbin "data/tilesets/primary/general/anim/2/5.4bpp"

	.align 2
TilesetAnimTiles_General_2_6: @ 83794D4
	.incbin "data/tilesets/primary/general/anim/2/6.4bpp"

	.align 2
gTilesetAnimTable_General_2:: @ 8379614
	.4byte TilesetAnimTiles_General_2_0
	.4byte TilesetAnimTiles_General_2_1
	.4byte TilesetAnimTiles_General_2_2
	.4byte TilesetAnimTiles_General_2_3
	.4byte TilesetAnimTiles_General_2_4
	.4byte TilesetAnimTiles_General_2_5
	.4byte TilesetAnimTiles_General_2_6
	.4byte TilesetAnimTiles_General_2_0

	.align 2
TilesetAnimTiles_General_3_0: @ 8379634
	.incbin "data/tilesets/primary/general/anim/3/0.4bpp"

	.align 2
TilesetAnimTiles_General_3_1: @ 83796F4
	.incbin "data/tilesets/primary/general/anim/3/1.4bpp"

	.align 2
TilesetAnimTiles_General_3_2: @ 83797B4
	.incbin "data/tilesets/primary/general/anim/3/2.4bpp"

	.align 2
TilesetAnimTiles_General_3_3: @ 8379874
	.incbin "data/tilesets/primary/general/anim/3/3.4bpp"

	.align 2
gTilesetAnimTable_General_3:: @ 8379934
	.4byte TilesetAnimTiles_General_3_0
	.4byte TilesetAnimTiles_General_3_1
	.4byte TilesetAnimTiles_General_3_2
	.4byte TilesetAnimTiles_General_3_3

	.align 2
TilesetAnimTiles_General_4_0: @ 8379944
	.incbin "data/tilesets/primary/general/anim/4/0.4bpp"

	.align 2
TilesetAnimTiles_General_4_1: @ 8379A84
	.incbin "data/tilesets/primary/general/anim/4/1.4bpp"

	.align 2
TilesetAnimTiles_General_4_2: @ 8379BC4
	.incbin "data/tilesets/primary/general/anim/4/2.4bpp"

	.align 2
TilesetAnimTiles_General_4_3: @ 8379D04
	.incbin "data/tilesets/primary/general/anim/4/3.4bpp"

	.align 2
gTilesetAnimTable_General_4:: @ 8379E44
	.4byte TilesetAnimTiles_General_4_0
	.4byte TilesetAnimTiles_General_4_1
	.4byte TilesetAnimTiles_General_4_2
	.4byte TilesetAnimTiles_General_4_3

	.align 2
TilesetAnimTiles_Lavaridge_0: @ 8379E54
	.incbin "data/tilesets/secondary/lavaridge/anim/0.4bpp"

	.align 2
TilesetAnimTiles_Lavaridge_1: @ 8379ED4
	.incbin "data/tilesets/secondary/lavaridge/anim/1.4bpp"

	.align 2
TilesetAnimTiles_Lavaridge_2: @ 8379F54
	.incbin "data/tilesets/secondary/lavaridge/anim/2.4bpp"

	.align 2
TilesetAnimTiles_Lavaridge_3: @ 8379FD4
	.incbin "data/tilesets/secondary/lavaridge/anim/3.4bpp"

	.align 2
gTilesetAnimTable_Lavaridge:: @ 837A054
	.4byte TilesetAnimTiles_Lavaridge_0
	.4byte TilesetAnimTiles_Lavaridge_1
	.4byte TilesetAnimTiles_Lavaridge_2
	.4byte TilesetAnimTiles_Lavaridge_3

	.align 2
TilesetAnimTiles_Pacifidlog_0_0: @ 837A064
	.incbin "data/tilesets/secondary/pacifidlog/anim/0/0.4bpp"

	.align 2
TilesetAnimTiles_Pacifidlog_0_1: @ 837A424
	.incbin "data/tilesets/secondary/pacifidlog/anim/0/1.4bpp"

	.align 2
TilesetAnimTiles_Pacifidlog_0_2: @ 837A7E4
	.incbin "data/tilesets/secondary/pacifidlog/anim/0/2.4bpp"

	.align 2
gTilesetAnimTable_Pacifidlog_0:: @ 837ABA4
	.4byte TilesetAnimTiles_Pacifidlog_0_0
	.4byte TilesetAnimTiles_Pacifidlog_0_1
	.4byte TilesetAnimTiles_Pacifidlog_0_2
	.4byte TilesetAnimTiles_Pacifidlog_0_1

	.align 2
TilesetAnimTiles_Underwater_0: @ 837ABB4
	.incbin "data/tilesets/secondary/underwater/anim/0.4bpp"

	.align 2
TilesetAnimTiles_Underwater_1: @ 837AC34
	.incbin "data/tilesets/secondary/underwater/anim/1.4bpp"

	.align 2
TilesetAnimTiles_Underwater_2: @ 837ACB4
	.incbin "data/tilesets/secondary/underwater/anim/2.4bpp"

	.align 2
TilesetAnimTiles_Underwater_3: @ 837AD34
	.incbin "data/tilesets/secondary/underwater/anim/3.4bpp"

	.align 2
gTilesetAnimTable_Underwater:: @ 837ADB4
	.4byte TilesetAnimTiles_Underwater_0
	.4byte TilesetAnimTiles_Underwater_1
	.4byte TilesetAnimTiles_Underwater_2
	.4byte TilesetAnimTiles_Underwater_3

	.align 2
TilesetAnimTiles_Pacifidlog_1_0: @ 837ADC4
	.incbin "data/tilesets/secondary/pacifidlog/anim/1/0.4bpp"

	.align 2
TilesetAnimTiles_Pacifidlog_1_1: @ 837AEC4
	.incbin "data/tilesets/secondary/pacifidlog/anim/1/1.4bpp"

	.align 2
TilesetAnimTiles_Pacifidlog_1_2: @ 837AFC4
	.incbin "data/tilesets/secondary/pacifidlog/anim/1/2.4bpp"

	.align 2
TilesetAnimTiles_Pacifidlog_1_3: @ 837B0C4
	.incbin "data/tilesets/secondary/pacifidlog/anim/1/3.4bpp"

	.align 2
TilesetAnimTiles_Pacifidlog_1_4: @ 837B1C4
	.incbin "data/tilesets/secondary/pacifidlog/anim/1/4.4bpp"

	.align 2
TilesetAnimTiles_Pacifidlog_1_5: @ 837B2C4
	.incbin "data/tilesets/secondary/pacifidlog/anim/1/5.4bpp"

	.align 2
TilesetAnimTiles_Pacifidlog_1_6: @ 837B3C4
	.incbin "data/tilesets/secondary/pacifidlog/anim/1/6.4bpp"

	.align 2
TilesetAnimTiles_Pacifidlog_1_7: @ 837B4C4
	.incbin "data/tilesets/secondary/pacifidlog/anim/1/7.4bpp"

	.align 2
gTilesetAnimTable_Pacifidlog_1:: @ 837B5C4
	.4byte TilesetAnimTiles_Pacifidlog_1_0
	.4byte TilesetAnimTiles_Pacifidlog_1_1
	.4byte TilesetAnimTiles_Pacifidlog_1_2
	.4byte TilesetAnimTiles_Pacifidlog_1_3
	.4byte TilesetAnimTiles_Pacifidlog_1_4
	.4byte TilesetAnimTiles_Pacifidlog_1_5
	.4byte TilesetAnimTiles_Pacifidlog_1_6
	.4byte TilesetAnimTiles_Pacifidlog_1_7

	.align 2
TilesetAnimTiles_Mauville_0_0: @ 837B5E4
	.incbin "data/tilesets/secondary/mauville/anim/0/0.4bpp"

	.align 2
TilesetAnimTiles_Mauville_0_1: @ 837B664
	.incbin "data/tilesets/secondary/mauville/anim/0/1.4bpp"

	.align 2
TilesetAnimTiles_Mauville_0_2: @ 837B6E4
	.incbin "data/tilesets/secondary/mauville/anim/0/2.4bpp"

	.align 2
TilesetAnimTiles_Mauville_0_3: @ 837B764
	.incbin "data/tilesets/secondary/mauville/anim/0/3.4bpp"

	.align 2
TilesetAnimTiles_Mauville_0_4: @ 837B7E4
	.incbin "data/tilesets/secondary/mauville/anim/0/4.4bpp"

	.align 2
TilesetAnimTiles_Mauville_1_0: @ 837B864
	.incbin "data/tilesets/secondary/mauville/anim/1/0.4bpp"

	.align 2
TilesetAnimTiles_Mauville_1_1: @ 837B8E4
	.incbin "data/tilesets/secondary/mauville/anim/1/1.4bpp"

	.align 2
TilesetAnimTiles_Mauville_1_2: @ 837B964
	.incbin "data/tilesets/secondary/mauville/anim/1/2.4bpp"

	.align 2
TilesetAnimTiles_Mauville_1_3: @ 837B9E4
	.incbin "data/tilesets/secondary/mauville/anim/1/3.4bpp"

	.align 2
TilesetAnimTiles_Mauville_1_4: @ 837BA64
	.incbin "data/tilesets/secondary/mauville/anim/1/4.4bpp"

	.align 2
gUnknown_0837BAE4:: @ 837BAE4
	.4byte 0x06004C00
	.4byte 0x06004C80
	.4byte 0x06004D00
	.4byte 0x06004D80
	.4byte 0x06004E00
	.4byte 0x06004E80
	.4byte 0x06004F00
	.4byte 0x06004F80

	.align 2
gUnknown_0837BB04:: @ 837BB04
	.4byte 0x06005000
	.4byte 0x06005080
	.4byte 0x06005100
	.4byte 0x06005180
	.4byte 0x06005200
	.4byte 0x06005280
	.4byte 0x06005300
	.4byte 0x06005380

	.align 2
gTilesetAnimTable_Mauville_0A:: @ 837BB24
	.4byte TilesetAnimTiles_Mauville_0_0
	.4byte TilesetAnimTiles_Mauville_0_0
	.4byte TilesetAnimTiles_Mauville_0_1
	.4byte TilesetAnimTiles_Mauville_0_2
	.4byte TilesetAnimTiles_Mauville_0_3
	.4byte TilesetAnimTiles_Mauville_0_3
	.4byte TilesetAnimTiles_Mauville_0_3
	.4byte TilesetAnimTiles_Mauville_0_3
	.4byte TilesetAnimTiles_Mauville_0_3
	.4byte TilesetAnimTiles_Mauville_0_3
	.4byte TilesetAnimTiles_Mauville_0_2
	.4byte TilesetAnimTiles_Mauville_0_1

	.align 2
gTilesetAnimTable_Mauville_1A:: @ 837BB54
	.4byte TilesetAnimTiles_Mauville_1_0
	.4byte TilesetAnimTiles_Mauville_1_0
	.4byte TilesetAnimTiles_Mauville_1_1
	.4byte TilesetAnimTiles_Mauville_1_2
	.4byte TilesetAnimTiles_Mauville_1_3
	.4byte TilesetAnimTiles_Mauville_1_3
	.4byte TilesetAnimTiles_Mauville_1_3
	.4byte TilesetAnimTiles_Mauville_1_3
	.4byte TilesetAnimTiles_Mauville_1_3
	.4byte TilesetAnimTiles_Mauville_1_3
	.4byte TilesetAnimTiles_Mauville_1_2
	.4byte TilesetAnimTiles_Mauville_1_1

	.align 2
gTilesetAnimTable_Mauville_0B:: @ 837BB84
	.4byte TilesetAnimTiles_Mauville_0_0
	.4byte TilesetAnimTiles_Mauville_0_0
	.4byte TilesetAnimTiles_Mauville_0_4
	.4byte TilesetAnimTiles_Mauville_0_4

	.align 2
gTilesetAnimTable_Mauville_1B:: @ 837BB94
	.4byte TilesetAnimTiles_Mauville_1_0
	.4byte TilesetAnimTiles_Mauville_1_0
	.4byte TilesetAnimTiles_Mauville_1_4
	.4byte TilesetAnimTiles_Mauville_1_4

	.align 2
TilesetAnimTiles_Rustboro_0_0: @ 837BBA4
	.incbin "data/tilesets/secondary/rustboro/anim/0/0.4bpp"

	.align 2
TilesetAnimTiles_Rustboro_0_1: @ 837BC24
	.incbin "data/tilesets/secondary/rustboro/anim/0/1.4bpp"

	.align 2
TilesetAnimTiles_Rustboro_0_2: @ 837BCA4
	.incbin "data/tilesets/secondary/rustboro/anim/0/2.4bpp"

	.align 2
TilesetAnimTiles_Rustboro_0_3: @ 837BD24
	.incbin "data/tilesets/secondary/rustboro/anim/0/3.4bpp"

	.align 2
TilesetAnimTiles_Rustboro_0_4: @ 837BDA4
	.incbin "data/tilesets/secondary/rustboro/anim/0/4.4bpp"

	.align 2
TilesetAnimTiles_Rustboro_0_5: @ 837BE24
	.incbin "data/tilesets/secondary/rustboro/anim/0/5.4bpp"

	.align 2
TilesetAnimTiles_Rustboro_0_6: @ 837BEA4
	.incbin "data/tilesets/secondary/rustboro/anim/0/6.4bpp"

	.align 2
TilesetAnimTiles_Rustboro_0_7: @ 837BF24
	.incbin "data/tilesets/secondary/rustboro/anim/0/7.4bpp"

	.align 2
gUnknown_0837BFA4:: @ 837BFA4
	.4byte 0x06005000
	.4byte 0x06005080
	.4byte 0x06005100
	.4byte 0x06005180
	.4byte 0x06005200
	.4byte 0x06005280
	.4byte 0x06005300
	.4byte 0x06005380

	.align 2
gTilesetAnimTable_Rustboro_0:: @ 837BFC4
	.4byte TilesetAnimTiles_Rustboro_0_0
	.4byte TilesetAnimTiles_Rustboro_0_1
	.4byte TilesetAnimTiles_Rustboro_0_2
	.4byte TilesetAnimTiles_Rustboro_0_3
	.4byte TilesetAnimTiles_Rustboro_0_4
	.4byte TilesetAnimTiles_Rustboro_0_5
	.4byte TilesetAnimTiles_Rustboro_0_6
	.4byte TilesetAnimTiles_Rustboro_0_7

	.align 2
TilesetAnimTiles_Rustboro_1_0: @ 837BFE4
	.incbin "data/tilesets/secondary/rustboro/anim/1/0.4bpp"

	.align 2
TilesetAnimTiles_Rustboro_1_1: @ 837C064
	.incbin "data/tilesets/secondary/rustboro/anim/1/1.4bpp"

	.align 2
gTilesetAnimTable_Rustboro_1:: @ 837C0E4
	.4byte TilesetAnimTiles_Rustboro_1_0
	.4byte TilesetAnimTiles_Rustboro_1_1

	.align 2
TilesetAnimTiles_Cave_0: @ 837C0EC
	.incbin "data/tilesets/secondary/cave/anim/0.4bpp"

	.align 2
TilesetAnimTiles_Cave_1: @ 837C16C
	.incbin "data/tilesets/secondary/cave/anim/1.4bpp"

	.align 2
TilesetAnimTiles_Cave_2: @ 837C1EC
	.incbin "data/tilesets/secondary/cave/anim/2.4bpp"

	.align 2
TilesetAnimTiles_Cave_3: @ 837C26C
	.incbin "data/tilesets/secondary/cave/anim/3.4bpp"

	.incbin "data/tilesets/secondary/cave/anim/unused/0.4bpp"
	.incbin "data/tilesets/secondary/cave/anim/unused/1.4bpp"
	.incbin "data/tilesets/secondary/cave/anim/unused/2.4bpp"
	.incbin "data/tilesets/secondary/cave/anim/unused/3.4bpp"

	.space 32

	.align 2
gTilesetAnimTable_Cave:: @ 837C50C
	.4byte TilesetAnimTiles_Cave_0
	.4byte TilesetAnimTiles_Cave_1
	.4byte TilesetAnimTiles_Cave_2
	.4byte TilesetAnimTiles_Cave_3

	.align 2
TilesetAnimTiles_EverGrande_0: @ 837C51C
	.incbin "data/tilesets/secondary/ever_grande/anim/0.4bpp"

	.align 2
TilesetAnimTiles_EverGrande_1: @ 837C59C
	.incbin "data/tilesets/secondary/ever_grande/anim/1.4bpp"

	.align 2
TilesetAnimTiles_EverGrande_2: @ 837C61C
	.incbin "data/tilesets/secondary/ever_grande/anim/2.4bpp"

	.align 2
TilesetAnimTiles_EverGrande_3: @ 837C69C
	.incbin "data/tilesets/secondary/ever_grande/anim/3.4bpp"

	.align 2
TilesetAnimTiles_EverGrande_4: @ 837C71C
	.incbin "data/tilesets/secondary/ever_grande/anim/4.4bpp"

	.align 2
TilesetAnimTiles_EverGrande_5: @ 837C79C
	.incbin "data/tilesets/secondary/ever_grande/anim/5.4bpp"

	.align 2
TilesetAnimTiles_EverGrande_6: @ 837C81C
	.incbin "data/tilesets/secondary/ever_grande/anim/6.4bpp"

	.align 2
TilesetAnimTiles_EverGrande_7: @ 837C89C
	.incbin "data/tilesets/secondary/ever_grande/anim/7.4bpp"

	.space 32

	.align 2
gUnknown_0837C93C:: @ 837C93C
	.4byte 0x06005C00
	.4byte 0x06005C80
	.4byte 0x06005D00
	.4byte 0x06005D80
	.4byte 0x06005E00
	.4byte 0x06005E80
	.4byte 0x06005F00
	.4byte 0x06005F80

	.align 2
gTilesetAnimTable_EverGrande:: @ 837C95C
	.4byte TilesetAnimTiles_EverGrande_0
	.4byte TilesetAnimTiles_EverGrande_1
	.4byte TilesetAnimTiles_EverGrande_2
	.4byte TilesetAnimTiles_EverGrande_3
	.4byte TilesetAnimTiles_EverGrande_4
	.4byte TilesetAnimTiles_EverGrande_5
	.4byte TilesetAnimTiles_EverGrande_6
	.4byte TilesetAnimTiles_EverGrande_7

	.align 2
TilesetAnimTiles_Building_0: @ 837C97C
	.incbin "data/tilesets/primary/building/anim/0.4bpp"

	.align 2
TilesetAnimTiles_Building_1: @ 837C9FC
	.incbin "data/tilesets/primary/building/anim/1.4bpp"

	.align 2
gTilesetAnimTable_Building:: @ 837CA7C
	.4byte TilesetAnimTiles_Building_0
	.4byte TilesetAnimTiles_Building_1

	.align 2
TilesetAnimTiles_SootopolisGym_0_0: @ 837CA84
	.incbin "data/tilesets/secondary/sootopolis_gym/anim/0/0.4bpp"

	.align 2
TilesetAnimTiles_SootopolisGym_0_1: @ 837CC04
	.incbin "data/tilesets/secondary/sootopolis_gym/anim/0/1.4bpp"

	.align 2
TilesetAnimTiles_SootopolisGym_0_2: @ 837CD84
	.incbin "data/tilesets/secondary/sootopolis_gym/anim/0/2.4bpp"

	.align 2
TilesetAnimTiles_SootopolisGym_1_0: @ 837CF04
	.incbin "data/tilesets/secondary/sootopolis_gym/anim/1/0.4bpp"

	.align 2
TilesetAnimTiles_SootopolisGym_1_1: @ 837D184
	.incbin "data/tilesets/secondary/sootopolis_gym/anim/1/1.4bpp"

	.align 2
TilesetAnimTiles_SootopolisGym_1_2: @ 837D404
	.incbin "data/tilesets/secondary/sootopolis_gym/anim/1/2.4bpp"

	.align 2
gTilesetAnimTable_SootopolisGym_0:: @ 837D684
	.4byte TilesetAnimTiles_SootopolisGym_0_0
	.4byte TilesetAnimTiles_SootopolisGym_0_1
	.4byte TilesetAnimTiles_SootopolisGym_0_2

	.align 2
gTilesetAnimTable_SootopolisGym_1:: @ 837D690
	.4byte TilesetAnimTiles_SootopolisGym_1_0
	.4byte TilesetAnimTiles_SootopolisGym_1_1
	.4byte TilesetAnimTiles_SootopolisGym_1_2

	.align 2
TilesetAnimTiles_EliteFour_1_0: @ 837D69C
	.incbin "data/tilesets/secondary/elite_four/anim/1/0.4bpp"

	.align 2
TilesetAnimTiles_EliteFour_1_1: @ 837D71C
	.incbin "data/tilesets/secondary/elite_four/anim/1/1.4bpp"

	.align 2
TilesetAnimTiles_EliteFour_0_0: @ 837D79C
	.incbin "data/tilesets/secondary/elite_four/anim/0/0.4bpp"

	.align 2
TilesetAnimTiles_EliteFour_0_1: @ 837D7BC
	.incbin "data/tilesets/secondary/elite_four/anim/0/1.4bpp"

	.align 2
TilesetAnimTiles_EliteFour_0_2: @ 837D7DC
	.incbin "data/tilesets/secondary/elite_four/anim/0/2.4bpp"

	.align 2
TilesetAnimTiles_EliteFour_0_3: @ 837D7FC
	.incbin "data/tilesets/secondary/elite_four/anim/0/3.4bpp"

	.space 32

	.align 2
gTilesetAnimTable_EliteFour_0:: @ 837D83C
	.4byte TilesetAnimTiles_EliteFour_0_0
	.4byte TilesetAnimTiles_EliteFour_0_1
	.4byte TilesetAnimTiles_EliteFour_0_2
	.4byte TilesetAnimTiles_EliteFour_0_3

	.align 2
gTilesetAnimTable_EliteFour_1:: @ 837D84C
	.4byte TilesetAnimTiles_EliteFour_1_0
	.4byte TilesetAnimTiles_EliteFour_1_1

	.align 2
TilesetAnimTiles_MauvilleGym_0: @ 837D854
	.incbin "data/tilesets/secondary/mauville_gym/anim/0.4bpp"

	.align 2
TilesetAnimTiles_MauvilleGym_1: @ 837DA54
	.incbin "data/tilesets/secondary/mauville_gym/anim/1.4bpp"

	.space 32

	.align 2
gTilesetAnimTable_MauvilleGym:: @ 837DC74
	.4byte TilesetAnimTiles_MauvilleGym_0
	.4byte TilesetAnimTiles_MauvilleGym_1

	.align 2
TilesetAnimTiles_BikeShop_0: @ 837DC7C
	.incbin "data/tilesets/secondary/bike_shop/anim/0.4bpp"

	.align 2
TilesetAnimTiles_BikeShop_1: @ 837DD9C
	.incbin "data/tilesets/secondary/bike_shop/anim/1.4bpp"

	.space 32

	.align 2
gTilesetAnimTable_BikeShop:: @ 837DEDC
	.4byte TilesetAnimTiles_BikeShop_0
	.4byte TilesetAnimTiles_BikeShop_1
