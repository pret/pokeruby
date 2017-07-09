	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 1
gUnknown_083E562C:: @ 83E562C
	.2byte 0x6ACD, 0x51A5
	.2byte 0x45FC, 0x38D4

	.align 2
gMailGraphicsTable:: @ 83E5634
	.4byte gMailPalette_Orange
	.4byte gMailTiles_Orange
	.4byte gMailTilemap_Orange
	.2byte 0x2C0
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.4byte gMailPalette_Harbor
	.4byte gMailTiles_Harbor
	.4byte gMailTilemap_Harbor
	.2byte 0x2E0
	.2byte 0
	.2byte 0x7FFF
	.2byte 0x4631

	.4byte gMailPalette_Glitter
	.4byte gMailTiles_Glitter
	.4byte gMailTilemap_Glitter
	.2byte 0x400
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.4byte gMailPalette_Mech
	.4byte gMailTiles_Mech
	.4byte gMailTilemap_Mech
	.2byte 0x1E0
	.2byte 0
	.2byte 0x7FFF
	.2byte 0x4631

	.4byte gMailPalette_Wood
	.4byte gMailTiles_Wood
	.4byte gMailTilemap_Wood
	.2byte 0x2E0
	.2byte 0
	.2byte 0x7FFF
	.2byte 0x4631

	.4byte gMailPalette_Wave
	.4byte gMailTiles_Wave
	.4byte gMailTilemap_Wave
	.2byte 0x300
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.4byte gMailPalette_Bead
	.4byte gMailTiles_Bead
	.4byte gMailTilemap_Bead
	.2byte 0x140
	.2byte 0
	.2byte 0x7FFF
	.2byte 0x4631

	.4byte gMailPalette_Shadow
	.4byte gMailTiles_Shadow
	.4byte gMailTilemap_Shadow
	.2byte 0x300
	.2byte 0
	.2byte 0x7FFF
	.2byte 0x4631

	.4byte gMailPalette_Tropic
	.4byte gMailTiles_Tropic
	.4byte gMailTilemap_Tropic
	.2byte 0x220
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.4byte gMailPalette_Dream
	.4byte gMailTiles_Dream
	.4byte gMailTilemap_Dream
	.2byte 0x340
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.4byte gMailPalette_Fab
	.4byte gMailTiles_Fab
	.4byte gMailTilemap_Fab
	.2byte 0x2A0
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.4byte gMailPalette_Retro
	.4byte gMailTiles_Retro
	.4byte gMailTilemap_Retro
	.2byte 0x520
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.align 2
Unknown_3E5724: @ 83E5724
	.4byte 0xC
	.4byte 0xC
	.4byte 0xC

gUnknown_083E5730:: @ 83E5730
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 16, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724

	.align 2
Unknown_3E5790: @ 83E5790
	.4byte 0x8
	.4byte 0x8
	.4byte 0x8
	.4byte 0x8
	.4byte 0x4

	.align 2
gUnknown_083E57A4:: @ 83E57A4
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 16, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 16, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 16, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 16, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790

.ifdef DEBUG
Str_8411540::
	.string "レイアウトを　にほんごで　ひょうじ？$" @ Display using Japanese layout?

Str_8411553:
	.string "にほんご　$" @ Japanese

Str_8411559:
	.string "かいがい　$" @ Overseas

	.align 2
_8411560::
	.4byte Str_8411553
	.4byte Str_8411559

Str_8411568::
	.string "イメージ　タイプを　えらんでね$" @ Choose an image type

@ 0x8411578
	.string "{STR_VAR_1}$"

Str_841157B:
	.string "オレンジ　$" @ Orange

Str_8411581:
	.string "ハーバー　$" @ Harbor

Str_8411587:
	.string "キラキラ　$" @ Glitter

Str_841158D:
	.string "メカニカル$" @ Mech

Str_8411593:
	.string "ウッディー$" @ Wood

Str_8411599:
	.string "クロス　　$" @ Wave

Str_841159F:
	.string "トレジャー$" @ Bead

Str_84115A5:
	.string "シャドウ　$" @ Shadow

Str_84115AB:
	.string "トロピカル$" @ Tropic

Str_84115B1:
	.string "ドリーム　$" @ Dream

Str_84115B7:
	.string "ミラクル　$" @ Fab

Str_84115BD:
	.string "レトロ　　$" @ Retro

	.align 2
_84115C4::
	.4byte Str_841157B
	.4byte Str_8411581
	.4byte Str_8411587
	.4byte Str_841158D
	.4byte Str_8411593
	.4byte Str_8411599
	.4byte Str_841159F
	.4byte Str_84115A5
	.4byte Str_84115AB
	.4byte Str_84115B1
	.4byte Str_84115B7
	.4byte Str_84115BD

Str_84115F4:
	.string "メールをみる$" @ View Mail

Str_84115FB:
	.string "メールとうろく$" @ Register Mail

Str_8411603:
	.string "もたせる$" @ Give to Pokémon

Str_8411608::
	.string "メールをけす$" @ Delete Mail
.endif

@ XXX: what is this?
	.align 2
	.4byte 0x2000000

.ifdef DEBUG
Str_841160F::
	.string "{STR_VAR_1}　{STR_VAR_2}$"

Str_841161A::
	.string "メール{STR_VAR_1}　{STR_VAR_2}$"

Str_8411623::
	.string "メール{STR_VAR_1}を　だれに　もたせる？$"

Str_8411634::
	.string "000　{STR_VAR_1}$"

Str_841163B::
	.string "せいきの　データが　とうろくずみ　です\n"
	.string "しんき　とうろく　できません$"

Str_841165E::
	.string "せいきに　とうろくされたメールデータは\n"
	.string "へんこう　できません$"

Str_841167D::
	.string "メール{STR_VAR_1}　とうろく　かいじょ$"

Str_841168D::
	.string "デバッグメニューから　とうろくした\n"
	.string "メール　いがいは　けせません$"

Str_84116AE::
	.string "メール{STR_VAR_1}　{STR_VAR_2}　{STR_VAR_3}$"

	.align 2
_84116BC::
	.4byte Str_84115F4, 0x0
	.4byte Str_84115FB, 0x0
	.4byte Str_8411603, 0x0
	.4byte Str_8411608, 0x0
.endif
