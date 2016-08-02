	.align 2
gItems:: @ 83C5564
	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "MASTER BALL$", 14
	.2byte ITEM_MASTER_BALL
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_MasterBall
	.byte 0
	.byte 0
	.byte POCKET_POKE_BALLS
	.byte 0
	.4byte NULL
	.4byte 2
	.4byte ItemUseInBattle_PokeBall
	.4byte 0

	.string "ULTRA BALL$", 14
	.2byte ITEM_ULTRA_BALL
	.2byte 1200 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_UltraBall
	.byte 0
	.byte 0
	.byte POCKET_POKE_BALLS
	.byte 1
	.4byte NULL
	.4byte 2
	.4byte ItemUseInBattle_PokeBall
	.4byte 1

	.string "GREAT BALL$", 14
	.2byte ITEM_GREAT_BALL
	.2byte 600 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_GreatBall
	.byte 0
	.byte 0
	.byte POCKET_POKE_BALLS
	.byte 2
	.4byte NULL
	.4byte 2
	.4byte ItemUseInBattle_PokeBall
	.4byte 2

	.string "POKé BALL$", 14
	.2byte ITEM_POKE_BALL
	.2byte 200 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_PokeBall
	.byte 0
	.byte 0
	.byte POCKET_POKE_BALLS
	.byte 3
	.4byte NULL
	.4byte 2
	.4byte ItemUseInBattle_PokeBall
	.4byte 3

	.string "SAFARI BALL$", 14
	.2byte ITEM_SAFARI_BALL
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_SafariBall
	.byte 0
	.byte 0
	.byte POCKET_POKE_BALLS
	.byte 4
	.4byte NULL
	.4byte 2
	.4byte ItemUseInBattle_PokeBall
	.4byte 4

	.string "NET BALL$", 14
	.2byte ITEM_NET_BALL
	.2byte 1000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_NetBall
	.byte 0
	.byte 0
	.byte POCKET_POKE_BALLS
	.byte 5
	.4byte NULL
	.4byte 2
	.4byte ItemUseInBattle_PokeBall
	.4byte 5

	.string "DIVE BALL$", 14
	.2byte ITEM_DIVE_BALL
	.2byte 1000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_DiveBall
	.byte 0
	.byte 0
	.byte POCKET_POKE_BALLS
	.byte 6
	.4byte NULL
	.4byte 2
	.4byte ItemUseInBattle_PokeBall
	.4byte 6

	.string "NEST BALL$", 14
	.2byte ITEM_NEST_BALL
	.2byte 1000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_NestBall
	.byte 0
	.byte 0
	.byte POCKET_POKE_BALLS
	.byte 7
	.4byte NULL
	.4byte 2
	.4byte ItemUseInBattle_PokeBall
	.4byte 7

	.string "REPEAT BALL$", 14
	.2byte ITEM_REPEAT_BALL
	.2byte 1000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_RepeatBall
	.byte 0
	.byte 0
	.byte POCKET_POKE_BALLS
	.byte 8
	.4byte NULL
	.4byte 2
	.4byte ItemUseInBattle_PokeBall
	.4byte 8

	.string "TIMER BALL$", 14
	.2byte ITEM_TIMER_BALL
	.2byte 1000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TimerBall
	.byte 0
	.byte 0
	.byte POCKET_POKE_BALLS
	.byte 9
	.4byte NULL
	.4byte 2
	.4byte ItemUseInBattle_PokeBall
	.4byte 9

	.string "LUXURY BALL$", 14
	.2byte ITEM_LUXURY_BALL
	.2byte 1000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_LuxuryBall
	.byte 0
	.byte 0
	.byte POCKET_POKE_BALLS
	.byte 10
	.4byte NULL
	.4byte 2
	.4byte ItemUseInBattle_PokeBall
	.4byte 10

	.string "PREMIER BALL$", 14
	.2byte ITEM_PREMIER_BALL
	.2byte 200 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_PremierBall
	.byte 0
	.byte 0
	.byte POCKET_POKE_BALLS
	.byte 11
	.4byte NULL
	.4byte 2
	.4byte ItemUseInBattle_PokeBall
	.4byte 11

	.string "POTION$", 14
	.2byte ITEM_POTION
	.2byte 300 @ price
	.byte 0
	.byte 20
	.4byte gItemDescription_Potion
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "ANTIDOTE$", 14
	.2byte ITEM_ANTIDOTE
	.2byte 100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Antidote
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "BURN HEAL$", 14
	.2byte ITEM_BURN_HEAL
	.2byte 250 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_BurnHeal
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "ICE HEAL$", 14
	.2byte ITEM_ICE_HEAL
	.2byte 250 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_IceHeal
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "AWAKENING$", 14
	.2byte ITEM_AWAKENING
	.2byte 250 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Awakening
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "PARLYZ HEAL$", 14
	.2byte ITEM_PARALYZE_HEAL
	.2byte 200 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_ParalyzeHeal
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "FULL RESTORE$", 14
	.2byte ITEM_FULL_RESTORE
	.2byte 3000 @ price
	.byte 0
	.byte 255
	.4byte gItemDescription_FullRestore
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "MAX POTION$", 14
	.2byte ITEM_MAX_POTION
	.2byte 2500 @ price
	.byte 0
	.byte 255
	.4byte gItemDescription_MaxPotion
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "HYPER POTION$", 14
	.2byte ITEM_HYPER_POTION
	.2byte 1200 @ price
	.byte 0
	.byte 200
	.4byte gItemDescription_HyperPotion
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "SUPER POTION$", 14
	.2byte ITEM_SUPER_POTION
	.2byte 700 @ price
	.byte 0
	.byte 50
	.4byte gItemDescription_SuperPotion
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "FULL HEAL$", 14
	.2byte ITEM_FULL_HEAL
	.2byte 600 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_FullHeal
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "REVIVE$", 14
	.2byte ITEM_REVIVE
	.2byte 1500 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Revive
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "MAX REVIVE$", 14
	.2byte ITEM_MAX_REVIVE
	.2byte 4000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_MaxRevive
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "FRESH WATER$", 14
	.2byte ITEM_FRESH_WATER
	.2byte 200 @ price
	.byte 0
	.byte 50
	.4byte gItemDescription_FreshWater
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "SODA POP$", 14
	.2byte ITEM_SODA_POP
	.2byte 300 @ price
	.byte 0
	.byte 60
	.4byte gItemDescription_SodaPop
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "LEMONADE$", 14
	.2byte ITEM_LEMONADE
	.2byte 350 @ price
	.byte 0
	.byte 80
	.4byte gItemDescription_Lemonade
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "MOOMOO MILK$", 14
	.2byte ITEM_MOOMOO_MILK
	.2byte 500 @ price
	.byte 0
	.byte 100
	.4byte gItemDescription_MoomooMilk
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "ENERGYPOWDER$", 14
	.2byte ITEM_ENERGY_POWDER
	.2byte 500 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_EnergyPowder
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "ENERGY ROOT$", 14
	.2byte ITEM_ENERGY_ROOT
	.2byte 800 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_EnergyRoot
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "HEAL POWDER$", 14
	.2byte ITEM_HEAL_POWDER
	.2byte 450 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HealPowder
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "REVIVAL HERB$", 14
	.2byte ITEM_REVIVAL_HERB
	.2byte 2800 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_RevivalHerb
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "ETHER$", 14
	.2byte ITEM_ETHER
	.2byte 1200 @ price
	.byte 0
	.byte 10
	.4byte gItemDescription_Ether
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_PPRecovery
	.4byte 1
	.4byte ItemUseInBattle_PPRecovery
	.4byte 0

	.string "MAX ETHER$", 14
	.2byte ITEM_MAX_ETHER
	.2byte 2000 @ price
	.byte 0
	.byte 255
	.4byte gItemDescription_MaxEther
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_PPRecovery
	.4byte 1
	.4byte ItemUseInBattle_PPRecovery
	.4byte 0

	.string "ELIXIR$", 14
	.2byte ITEM_ELIXIR
	.2byte 3000 @ price
	.byte 0
	.byte 10
	.4byte gItemDescription_Elixir
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_PPRecovery
	.4byte 1
	.4byte ItemUseInBattle_PPRecovery
	.4byte 0

	.string "MAX ELIXIR$", 14
	.2byte ITEM_MAX_ELIXIR
	.2byte 4500 @ price
	.byte 0
	.byte 255
	.4byte gItemDescription_MaxElixir
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_PPRecovery
	.4byte 1
	.4byte ItemUseInBattle_PPRecovery
	.4byte 0

	.string "LAVA COOKIE$", 14
	.2byte ITEM_LAVA_COOKIE
	.2byte 200 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_LavaCookie
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "BLUE FLUTE$", 14
	.2byte ITEM_BLUE_FLUTE
	.2byte 100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_BlueFlute
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "YELLOW FLUTE$", 14
	.2byte ITEM_YELLOW_FLUTE
	.2byte 200 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_YellowFlute
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "RED FLUTE$", 14
	.2byte ITEM_RED_FLUTE
	.2byte 300 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_RedFlute
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "BLACK FLUTE$", 14
	.2byte ITEM_BLACK_FLUTE
	.2byte 400 @ price
	.byte 0
	.byte 50
	.4byte gItemDescription_BlackFlute
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_BlackWhiteFlute
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "WHITE FLUTE$", 14
	.2byte ITEM_WHITE_FLUTE
	.2byte 500 @ price
	.byte 0
	.byte 150
	.4byte gItemDescription_WhiteFlute
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_BlackWhiteFlute
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "BERRY JUICE$", 14
	.2byte ITEM_BERRY_JUICE
	.2byte 100 @ price
	.byte 1
	.byte 20
	.4byte gItemDescription_BerryJuice
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "SACRED ASH$", 14
	.2byte ITEM_SACRED_ASH
	.2byte 200 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_SacredAsh
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_SacredAsh
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SHOAL SALT$", 14
	.2byte ITEM_SHOAL_SALT
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_ShoalSalt
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SHOAL SHELL$", 14
	.2byte ITEM_SHOAL_SHELL
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_ShoalShell
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "RED SHARD$", 14
	.2byte ITEM_RED_SHARD
	.2byte 200 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_RedShard
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "BLUE SHARD$", 14
	.2byte ITEM_BLUE_SHARD
	.2byte 200 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_BlueShard
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "YELLOW SHARD$", 14
	.2byte ITEM_YELLOW_SHARD
	.2byte 200 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_YellowShard
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "GREEN SHARD$", 14
	.2byte ITEM_GREEN_SHARD
	.2byte 200 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_GreenShard
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HP UP$", 14
	.2byte ITEM_HP_UP
	.2byte 9800 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HPUp
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "PROTEIN$", 14
	.2byte ITEM_PROTEIN
	.2byte 9800 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Protein
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "IRON$", 14
	.2byte ITEM_IRON
	.2byte 9800 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Iron
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "CARBOS$", 14
	.2byte ITEM_CARBOS
	.2byte 9800 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Carbos
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "CALCIUM$", 14
	.2byte ITEM_CALCIUM
	.2byte 9800 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Calcium
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "RARE CANDY$", 14
	.2byte ITEM_RARE_CANDY
	.2byte 4800 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_RareCandy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_RareCandy
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "PP UP$", 14
	.2byte ITEM_PP_UP
	.2byte 9800 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_PPUp
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_PPUp
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "ZINC$", 14
	.2byte ITEM_ZINC
	.2byte 9800 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Zinc
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "PP MAX$", 14
	.2byte ITEM_PP_MAX
	.2byte 9800 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_PPMax
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_PPUp
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "GUARD SPEC.$", 14
	.2byte ITEM_GUARD_SPEC
	.2byte 700 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_GuardSpec
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 2
	.4byte ItemUseInBattle_StatIncrease
	.4byte 0

	.string "DIRE HIT$", 14
	.2byte ITEM_DIRE_HIT
	.2byte 650 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_DireHit
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 2
	.4byte ItemUseInBattle_StatIncrease
	.4byte 0

	.string "X ATTACK$", 14
	.2byte ITEM_X_ATTACK
	.2byte 500 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_XAttack
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 2
	.4byte ItemUseInBattle_StatIncrease
	.4byte 0

	.string "X DEFEND$", 14
	.2byte ITEM_X_DEFEND
	.2byte 550 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_XDefend
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 2
	.4byte ItemUseInBattle_StatIncrease
	.4byte 0

	.string "X SPEED$", 14
	.2byte ITEM_X_SPEED
	.2byte 350 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_XSpeed
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 2
	.4byte ItemUseInBattle_StatIncrease
	.4byte 0

	.string "X ACCURACY$", 14
	.2byte ITEM_X_ACCURACY
	.2byte 950 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_XAccuracy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 2
	.4byte ItemUseInBattle_StatIncrease
	.4byte 0

	.string "X SPECIAL$", 14
	.2byte ITEM_X_SPECIAL
	.2byte 350 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_XSpecial
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 2
	.4byte ItemUseInBattle_StatIncrease
	.4byte 0

	.string "POKé DOLL$", 14
	.2byte ITEM_POKE_DOLL
	.2byte 1000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_PokeDoll
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 2
	.4byte ItemUseInBattle_Escape
	.4byte 0

	.string "FLUFFY TAIL$", 14
	.2byte ITEM_FLUFFY_TAIL
	.2byte 1000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_FluffyTail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 2
	.4byte ItemUseInBattle_Escape
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SUPER REPEL$", 14
	.2byte ITEM_SUPER_REPEL
	.2byte 500 @ price
	.byte 0
	.byte 200
	.4byte gItemDescription_SuperRepel
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_Repel
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "MAX REPEL$", 14
	.2byte ITEM_MAX_REPEL
	.2byte 700 @ price
	.byte 0
	.byte 250
	.4byte gItemDescription_MaxRepel
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_Repel
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "ESCAPE ROPE$", 14
	.2byte ITEM_ESCAPE_ROPE
	.2byte 550 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_EscapeRope
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 2
	.4byte ItemUseOutOfBattle_EscapeRope
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "REPEL$", 14
	.2byte ITEM_REPEL
	.2byte 350 @ price
	.byte 0
	.byte 100
	.4byte gItemDescription_Repel
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_Repel
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SUN STONE$", 14
	.2byte ITEM_SUN_STONE
	.2byte 2100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_SunStone
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_EvolutionStone
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "MOON STONE$", 14
	.2byte ITEM_MOON_STONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_MoonStone
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_EvolutionStone
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "FIRE STONE$", 14
	.2byte ITEM_FIRE_STONE
	.2byte 2100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_FireStone
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_EvolutionStone
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "THUNDERSTONE$", 14
	.2byte ITEM_THUNDER_STONE
	.2byte 2100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_ThunderStone
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_EvolutionStone
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "WATER STONE$", 14
	.2byte ITEM_WATER_STONE
	.2byte 2100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_WaterStone
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_EvolutionStone
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "LEAF STONE$", 14
	.2byte ITEM_LEAF_STONE
	.2byte 2100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_LeafStone
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 1
	.4byte ItemUseOutOfBattle_EvolutionStone
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TINYMUSHROOM$", 14
	.2byte ITEM_TINY_MUSHROOM
	.2byte 500 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TinyMushroom
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "BIG MUSHROOM$", 14
	.2byte ITEM_BIG_MUSHROOM
	.2byte 5000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_BigMushroom
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "PEARL$", 14
	.2byte ITEM_PEARL
	.2byte 1400 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Pearl
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "BIG PEARL$", 14
	.2byte ITEM_BIG_PEARL
	.2byte 7500 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_BigPearl
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "STARDUST$", 14
	.2byte ITEM_STARDUST
	.2byte 2000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Stardust
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "STAR PIECE$", 14
	.2byte ITEM_STAR_PIECE
	.2byte 9800 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_StarPiece
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "NUGGET$", 14
	.2byte ITEM_NUGGET
	.2byte 10000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Nugget
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HEART SCALE$", 14
	.2byte ITEM_HEART_SCALE
	.2byte 100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HeartScale
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "ORANGE MAIL$", 14
	.2byte ITEM_ORANGE_MAIL
	.2byte 50 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_OrangeMail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 0
	.4byte ItemUseOutOfBattle_Mail
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HARBOR MAIL$", 14
	.2byte ITEM_HARBOR_MAIL
	.2byte 50 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HarborMail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 0
	.4byte ItemUseOutOfBattle_Mail
	.4byte 0
	.4byte NULL
	.4byte 1

	.string "GLITTER MAIL$", 14
	.2byte ITEM_GLITTER_MAIL
	.2byte 50 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_GlitterMail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 0
	.4byte ItemUseOutOfBattle_Mail
	.4byte 0
	.4byte NULL
	.4byte 2

	.string "MECH MAIL$", 14
	.2byte ITEM_MECH_MAIL
	.2byte 50 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_MechMail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 0
	.4byte ItemUseOutOfBattle_Mail
	.4byte 0
	.4byte NULL
	.4byte 3

	.string "WOOD MAIL$", 14
	.2byte ITEM_WOOD_MAIL
	.2byte 50 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_WoodMail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 0
	.4byte ItemUseOutOfBattle_Mail
	.4byte 0
	.4byte NULL
	.4byte 4

	.string "WAVE MAIL$", 14
	.2byte ITEM_WAVE_MAIL
	.2byte 50 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_WaveMail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 0
	.4byte ItemUseOutOfBattle_Mail
	.4byte 0
	.4byte NULL
	.4byte 5

	.string "BEAD MAIL$", 14
	.2byte ITEM_BEAD_MAIL
	.2byte 50 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_BeadMail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 0
	.4byte ItemUseOutOfBattle_Mail
	.4byte 0
	.4byte NULL
	.4byte 6

	.string "SHADOW MAIL$", 14
	.2byte ITEM_SHADOW_MAIL
	.2byte 50 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_ShadowMail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 0
	.4byte ItemUseOutOfBattle_Mail
	.4byte 0
	.4byte NULL
	.4byte 7

	.string "TROPIC MAIL$", 14
	.2byte ITEM_TROPIC_MAIL
	.2byte 50 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TropicMail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 0
	.4byte ItemUseOutOfBattle_Mail
	.4byte 0
	.4byte NULL
	.4byte 8

	.string "DREAM MAIL$", 14
	.2byte ITEM_DREAM_MAIL
	.2byte 50 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_DreamMail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 0
	.4byte ItemUseOutOfBattle_Mail
	.4byte 0
	.4byte NULL
	.4byte 9

	.string "FAB MAIL$", 14
	.2byte ITEM_FAB_MAIL
	.2byte 50 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_FabMail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 0
	.4byte ItemUseOutOfBattle_Mail
	.4byte 0
	.4byte NULL
	.4byte 10

	.string "RETRO MAIL$", 14
	.2byte ITEM_RETRO_MAIL
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_RetroMail
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 0
	.4byte ItemUseOutOfBattle_Mail
	.4byte 0
	.4byte NULL
	.4byte 11

	.string "CHERI BERRY$", 14
	.2byte ITEM_CHERI_BERRY
	.2byte 20 @ price
	.byte 2
	.byte 0
	.4byte gItemDescription_CheriBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "CHESTO BERRY$", 14
	.2byte ITEM_CHESTO_BERRY
	.2byte 20 @ price
	.byte 3
	.byte 0
	.4byte gItemDescription_ChestoBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "PECHA BERRY$", 14
	.2byte ITEM_PECHA_BERRY
	.2byte 20 @ price
	.byte 4
	.byte 0
	.4byte gItemDescription_PechaBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "RAWST BERRY$", 14
	.2byte ITEM_RAWST_BERRY
	.2byte 20 @ price
	.byte 5
	.byte 0
	.4byte gItemDescription_RawstBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "ASPEAR BERRY$", 14
	.2byte ITEM_ASPEAR_BERRY
	.2byte 20 @ price
	.byte 6
	.byte 0
	.4byte gItemDescription_AspearBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "LEPPA BERRY$", 14
	.2byte ITEM_LEPPA_BERRY
	.2byte 20 @ price
	.byte 7
	.byte 10
	.4byte gItemDescription_LeppaBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 1
	.4byte ItemUseOutOfBattle_PPRecovery
	.4byte 1
	.4byte ItemUseInBattle_PPRecovery
	.4byte 0

	.string "ORAN BERRY$", 14
	.2byte ITEM_ORAN_BERRY
	.2byte 20 @ price
	.byte 1
	.byte 10
	.4byte gItemDescription_OranBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "PERSIM BERRY$", 14
	.2byte ITEM_PERSIM_BERRY
	.2byte 20 @ price
	.byte 8
	.byte 0
	.4byte gItemDescription_PersimBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "LUM BERRY$", 14
	.2byte ITEM_LUM_BERRY
	.2byte 20 @ price
	.byte 9
	.byte 0
	.4byte gItemDescription_LumBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "SITRUS BERRY$", 14
	.2byte ITEM_SITRUS_BERRY
	.2byte 20 @ price
	.byte 1
	.byte 30
	.4byte gItemDescription_SitrusBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 1
	.4byte ItemUseOutOfBattle_Medicine
	.4byte 1
	.4byte ItemUseInBattle_Medicine
	.4byte 0

	.string "FIGY BERRY$", 14
	.2byte ITEM_FIGY_BERRY
	.2byte 20 @ price
	.byte 10
	.byte 8
	.4byte gItemDescription_FigyBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "WIKI BERRY$", 14
	.2byte ITEM_WIKI_BERRY
	.2byte 20 @ price
	.byte 11
	.byte 8
	.4byte gItemDescription_WikiBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "MAGO BERRY$", 14
	.2byte ITEM_MAGO_BERRY
	.2byte 20 @ price
	.byte 12
	.byte 8
	.4byte gItemDescription_MagoBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "AGUAV BERRY$", 14
	.2byte ITEM_AGUAV_BERRY
	.2byte 20 @ price
	.byte 13
	.byte 8
	.4byte gItemDescription_AguavBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "IAPAPA BERRY$", 14
	.2byte ITEM_IAPAPA_BERRY
	.2byte 20 @ price
	.byte 14
	.byte 8
	.4byte gItemDescription_IapapaBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "RAZZ BERRY$", 14
	.2byte ITEM_RAZZ_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_RazzBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "BLUK BERRY$", 14
	.2byte ITEM_BLUK_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_BlukBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "NANAB BERRY$", 14
	.2byte ITEM_NANAB_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_NanabBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "WEPEAR BERRY$", 14
	.2byte ITEM_WEPEAR_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_WepearBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "PINAP BERRY$", 14
	.2byte ITEM_PINAP_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_PinapBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "POMEG BERRY$", 14
	.2byte ITEM_POMEG_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_PomegBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "KELPSY BERRY$", 14
	.2byte ITEM_KELPSY_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_KelpsyBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "QUALOT BERRY$", 14
	.2byte ITEM_QUALOT_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_QualotBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HONDEW BERRY$", 14
	.2byte ITEM_HONDEW_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HondewBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "GREPA BERRY$", 14
	.2byte ITEM_GREPA_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_GrepaBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TAMATO BERRY$", 14
	.2byte ITEM_TAMATO_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TamatoBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "CORNN BERRY$", 14
	.2byte ITEM_CORNN_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_CornnBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "MAGOST BERRY$", 14
	.2byte ITEM_MAGOST_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_MagostBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "RABUTA BERRY$", 14
	.2byte ITEM_RABUTA_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_RabutaBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "NOMEL BERRY$", 14
	.2byte ITEM_NOMEL_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_NomelBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SPELON BERRY$", 14
	.2byte ITEM_SPELON_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_SpelonBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "PAMTRE BERRY$", 14
	.2byte ITEM_PAMTRE_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_PamtreBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "WATMEL BERRY$", 14
	.2byte ITEM_WATMEL_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_WatmelBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "DURIN BERRY$", 14
	.2byte ITEM_DURIN_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_DurinBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "BELUE BERRY$", 14
	.2byte ITEM_BELUE_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_BelueBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "LIECHI BERRY$", 14
	.2byte ITEM_LIECHI_BERRY
	.2byte 20 @ price
	.byte 15
	.byte 4
	.4byte gItemDescription_LiechiBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "GANLON BERRY$", 14
	.2byte ITEM_GANLON_BERRY
	.2byte 20 @ price
	.byte 16
	.byte 4
	.4byte gItemDescription_GanlonBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SALAC BERRY$", 14
	.2byte ITEM_SALAC_BERRY
	.2byte 20 @ price
	.byte 17
	.byte 4
	.4byte gItemDescription_SalacBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "PETAYA BERRY$", 14
	.2byte ITEM_PETAYA_BERRY
	.2byte 20 @ price
	.byte 18
	.byte 4
	.4byte gItemDescription_PetayaBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "APICOT BERRY$", 14
	.2byte ITEM_APICOT_BERRY
	.2byte 20 @ price
	.byte 19
	.byte 4
	.4byte gItemDescription_ApicotBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "LANSAT BERRY$", 14
	.2byte ITEM_LANSAT_BERRY
	.2byte 20 @ price
	.byte 20
	.byte 4
	.4byte gItemDescription_LansatBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "STARF BERRY$", 14
	.2byte ITEM_STARF_BERRY
	.2byte 20 @ price
	.byte 21
	.byte 4
	.4byte gItemDescription_StarfBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "ENIGMA BERRY$", 14
	.2byte ITEM_ENIGMA_BERRY
	.2byte 20 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_EnigmaBerry
	.byte 0
	.byte 0
	.byte POCKET_BERRIES
	.byte 4
	.4byte ItemUseOutOfBattle_EnigmaBerry
	.4byte 1
	.4byte ItemUseInBattle_EnigmaBerry
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "BRIGHTPOWDER$", 14
	.2byte ITEM_BRIGHT_POWDER
	.2byte 10 @ price
	.byte 22
	.byte 10
	.4byte gItemDescription_BrightPowder
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "WHITE HERB$", 14
	.2byte ITEM_WHITE_HERB
	.2byte 100 @ price
	.byte 23
	.byte 0
	.4byte gItemDescription_WhiteHerb
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "MACHO BRACE$", 14
	.2byte ITEM_MACHO_BRACE
	.2byte 3000 @ price
	.byte 24
	.byte 0
	.4byte gItemDescription_MachoBrace
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "EXP. SHARE$", 14
	.2byte ITEM_EXP_SHARE
	.2byte 3000 @ price
	.byte 25
	.byte 0
	.4byte gItemDescription_ExpShare
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "QUICK CLAW$", 14
	.2byte ITEM_QUICK_CLAW
	.2byte 100 @ price
	.byte 26
	.byte 20
	.4byte gItemDescription_QuickClaw
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SOOTHE BELL$", 14
	.2byte ITEM_SOOTHE_BELL
	.2byte 100 @ price
	.byte 27
	.byte 0
	.4byte gItemDescription_SootheBell
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "MENTAL HERB$", 14
	.2byte ITEM_MENTAL_HERB
	.2byte 100 @ price
	.byte 28
	.byte 0
	.4byte gItemDescription_MentalHerb
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "CHOICE BAND$", 14
	.2byte ITEM_CHOICE_BAND
	.2byte 100 @ price
	.byte 29
	.byte 0
	.4byte gItemDescription_ChoiceBand
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "KING’S ROCK$", 14
	.2byte ITEM_KINGS_ROCK
	.2byte 100 @ price
	.byte 30
	.byte 10
	.4byte gItemDescription_KingsRock
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SILVERPOWDER$", 14
	.2byte ITEM_SILVER_POWDER
	.2byte 100 @ price
	.byte HOLD_EFFECT_BUG_POWER
	.byte 10
	.4byte gItemDescription_SilverPowder
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "AMULET COIN$", 14
	.2byte ITEM_AMULET_COIN
	.2byte 100 @ price
	.byte 32
	.byte 10
	.4byte gItemDescription_AmuletCoin
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "CLEANSE TAG$", 14
	.2byte ITEM_CLEANSE_TAG
	.2byte 200 @ price
	.byte 33
	.byte 0
	.4byte gItemDescription_CleanseTag
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SOUL DEW$", 14
	.2byte ITEM_SOUL_DEW
	.2byte 200 @ price
	.byte 34
	.byte 0
	.4byte gItemDescription_SoulDew
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "DEEPSEATOOTH$", 14
	.2byte ITEM_DEEP_SEA_TOOTH
	.2byte 200 @ price
	.byte 35
	.byte 0
	.4byte gItemDescription_DeepSeaTooth
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "DEEPSEASCALE$", 14
	.2byte ITEM_DEEP_SEA_SCALE
	.2byte 200 @ price
	.byte 36
	.byte 0
	.4byte gItemDescription_DeepSeaScale
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SMOKE BALL$", 14
	.2byte ITEM_SMOKE_BALL
	.2byte 200 @ price
	.byte 37
	.byte 0
	.4byte gItemDescription_SmokeBall
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "EVERSTONE$", 14
	.2byte ITEM_EVERSTONE
	.2byte 200 @ price
	.byte 38
	.byte 0
	.4byte gItemDescription_Everstone
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "FOCUS BAND$", 14
	.2byte ITEM_FOCUS_BAND
	.2byte 200 @ price
	.byte 39
	.byte 10
	.4byte gItemDescription_FocusBand
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "LUCKY EGG$", 14
	.2byte ITEM_LUCKY_EGG
	.2byte 200 @ price
	.byte 40
	.byte 0
	.4byte gItemDescription_LuckyEgg
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SCOPE LENS$", 14
	.2byte ITEM_SCOPE_LENS
	.2byte 200 @ price
	.byte 41
	.byte 0
	.4byte gItemDescription_ScopeLens
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "METAL COAT$", 14
	.2byte ITEM_METAL_COAT
	.2byte 100 @ price
	.byte HOLD_EFFECT_STEEL_POWER
	.byte 10
	.4byte gItemDescription_MetalCoat
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "LEFTOVERS$", 14
	.2byte ITEM_LEFTOVERS
	.2byte 200 @ price
	.byte 43
	.byte 10
	.4byte gItemDescription_Leftovers
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "DRAGON SCALE$", 14
	.2byte ITEM_DRAGON_SCALE
	.2byte 2100 @ price
	.byte 44
	.byte 10
	.4byte gItemDescription_DragonScale
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "LIGHT BALL$", 14
	.2byte ITEM_LIGHT_BALL
	.2byte 100 @ price
	.byte 45
	.byte 0
	.4byte gItemDescription_LightBall
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SOFT SAND$", 14
	.2byte ITEM_SOFT_SAND
	.2byte 100 @ price
	.byte HOLD_EFFECT_GROUND_POWER
	.byte 10
	.4byte gItemDescription_SoftSand
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HARD STONE$", 14
	.2byte ITEM_HARD_STONE
	.2byte 100 @ price
	.byte HOLD_EFFECT_ROCK_POWER
	.byte 10
	.4byte gItemDescription_HardStone
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "MIRACLE SEED$", 14
	.2byte ITEM_MIRACLE_SEED
	.2byte 100 @ price
	.byte HOLD_EFFECT_GRASS_POWER
	.byte 10
	.4byte gItemDescription_MiracleSeed
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "BLACKGLASSES$", 14
	.2byte ITEM_BLACK_GLASSES
	.2byte 100 @ price
	.byte HOLD_EFFECT_DARK_POWER
	.byte 10
	.4byte gItemDescription_BlackGlasses
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "BLACK BELT$", 14
	.2byte ITEM_BLACK_BELT
	.2byte 100 @ price
	.byte HOLD_EFFECT_FIGHTING_POWER
	.byte 10
	.4byte gItemDescription_BlackBelt
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "MAGNET$", 14
	.2byte ITEM_MAGNET
	.2byte 100 @ price
	.byte HOLD_EFFECT_ELECTRIC_POWER
	.byte 10
	.4byte gItemDescription_Magnet
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "MYSTIC WATER$", 14
	.2byte ITEM_MYSTIC_WATER
	.2byte 100 @ price
	.byte HOLD_EFFECT_WATER_POWER
	.byte 10
	.4byte gItemDescription_MysticWater
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SHARP BEAK$", 14
	.2byte ITEM_SHARP_BEAK
	.2byte 100 @ price
	.byte HOLD_EFFECT_FLYING_POWER
	.byte 10
	.4byte gItemDescription_SharpBeak
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "POISON BARB$", 14
	.2byte ITEM_POISON_BARB
	.2byte 100 @ price
	.byte HOLD_EFFECT_POISON_POWER
	.byte 10
	.4byte gItemDescription_PoisonBarb
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "NEVERMELTICE$", 14
	.2byte ITEM_NEVER_MELT_ICE
	.2byte 100 @ price
	.byte HOLD_EFFECT_ICE_POWER
	.byte 10
	.4byte gItemDescription_NeverMeltIce
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SPELL TAG$", 14
	.2byte ITEM_SPELL_TAG
	.2byte 100 @ price
	.byte HOLD_EFFECT_GHOST_POWER
	.byte 10
	.4byte gItemDescription_SpellTag
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TWISTEDSPOON$", 14
	.2byte ITEM_TWISTED_SPOON
	.2byte 100 @ price
	.byte HOLD_EFFECT_PSYCHIC_POWER
	.byte 10
	.4byte gItemDescription_TwistedSpoon
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "CHARCOAL$", 14
	.2byte ITEM_CHARCOAL
	.2byte 9800 @ price
	.byte HOLD_EFFECT_FIRE_POWER
	.byte 10
	.4byte gItemDescription_Charcoal
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "DRAGON FANG$", 14
	.2byte ITEM_DRAGON_FANG
	.2byte 100 @ price
	.byte HOLD_EFFECT_DRAGON_POWER
	.byte 10
	.4byte gItemDescription_DragonFang
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SILK SCARF$", 14
	.2byte ITEM_SILK_SCARF
	.2byte 100 @ price
	.byte HOLD_EFFECT_NORMAL_POWER
	.byte 10
	.4byte gItemDescription_SilkScarf
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "UP-GRADE$", 14
	.2byte ITEM_UP_GRADE
	.2byte 2100 @ price
	.byte 61
	.byte 0
	.4byte gItemDescription_UpGrade
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SHELL BELL$", 14
	.2byte ITEM_SHELL_BELL
	.2byte 200 @ price
	.byte 62
	.byte 8
	.4byte gItemDescription_ShellBell
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SEA INCENSE$", 14
	.2byte ITEM_SEA_INCENSE
	.2byte 9600 @ price
	.byte 52
	.byte 5
	.4byte gItemDescription_SeaIncense
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "LAX INCENSE$", 14
	.2byte ITEM_LAX_INCENSE
	.2byte 9600 @ price
	.byte 22
	.byte 5
	.4byte gItemDescription_LaxIncense
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "LUCKY PUNCH$", 14
	.2byte ITEM_LUCKY_PUNCH
	.2byte 10 @ price
	.byte 63
	.byte 0
	.4byte gItemDescription_LuckyPunch
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "METAL POWDER$", 14
	.2byte ITEM_METAL_POWDER
	.2byte 10 @ price
	.byte 64
	.byte 0
	.4byte gItemDescription_MetalPowder
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "THICK CLUB$", 14
	.2byte ITEM_THICK_CLUB
	.2byte 500 @ price
	.byte 65
	.byte 0
	.4byte gItemDescription_ThickClub
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "STICK$", 14
	.2byte ITEM_STICK
	.2byte 200 @ price
	.byte 66
	.byte 0
	.4byte gItemDescription_Stick
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "RED SCARF$", 14
	.2byte ITEM_RED_SCARF
	.2byte 100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_RedScarf
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "BLUE SCARF$", 14
	.2byte ITEM_BLUE_SCARF
	.2byte 100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_BlueScarf
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "PINK SCARF$", 14
	.2byte ITEM_PINK_SCARF
	.2byte 100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_PinkScarf
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "GREEN SCARF$", 14
	.2byte ITEM_GREEN_SCARF
	.2byte 100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_GreenScarf
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "YELLOW SCARF$", 14
	.2byte ITEM_YELLOW_SCARF
	.2byte 100 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_YellowScarf
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "MACH BIKE$", 14
	.2byte ITEM_MACH_BIKE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_MachBike
	.byte 1
	.byte 1
	.byte POCKET_KEY_ITEMS
	.byte 2
	.4byte ItemUseOutOfBattle_Bike
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "COIN CASE$", 14
	.2byte ITEM_COIN_CASE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_CoinCase
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CoinCase
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "ITEMFINDER$", 14
	.2byte ITEM_ITEMFINDER
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Itemfinder
	.byte 1
	.byte 1
	.byte POCKET_KEY_ITEMS
	.byte 2
	.4byte ItemUseOutOfBattle_Itemfinder
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "OLD ROD$", 14
	.2byte ITEM_OLD_ROD
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_OldRod
	.byte 1
	.byte 1
	.byte POCKET_KEY_ITEMS
	.byte 2
	.4byte ItemUseOutOfBattle_Rod
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "GOOD ROD$", 14
	.2byte ITEM_GOOD_ROD
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_GoodRod
	.byte 1
	.byte 1
	.byte POCKET_KEY_ITEMS
	.byte 2
	.4byte ItemUseOutOfBattle_Rod
	.4byte 0
	.4byte NULL
	.4byte 1

	.string "SUPER ROD$", 14
	.2byte ITEM_SUPER_ROD
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_SuperRod
	.byte 1
	.byte 1
	.byte POCKET_KEY_ITEMS
	.byte 2
	.4byte ItemUseOutOfBattle_Rod
	.4byte 0
	.4byte NULL
	.4byte 2

	.string "S.S. TICKET$", 14
	.2byte ITEM_SS_TICKET
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_SSTicket
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "CONTEST PASS$", 14
	.2byte ITEM_CONTEST_PASS
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_ContestPass
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "WAILMER PAIL$", 14
	.2byte ITEM_WAILMER_PAIL
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_WailmerPail
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 2
	.4byte ItemUseOutOfBattle_WailmerPail
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "DEVON GOODS$", 14
	.2byte ITEM_DEVON_GOODS
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_DevonGoods
	.byte 2
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SOOT SACK$", 14
	.2byte ITEM_SOOT_SACK
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_SootSack
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "BASEMENT KEY$", 14
	.2byte ITEM_BASEMENT_KEY
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_BasementKey
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "ACRO BIKE$", 14
	.2byte ITEM_ACRO_BIKE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_AcroBike
	.byte 1
	.byte 1
	.byte POCKET_KEY_ITEMS
	.byte 2
	.4byte ItemUseOutOfBattle_Bike
	.4byte 0
	.4byte NULL
	.4byte 1

	.string "{POKEBLOCK} CASE$", 14
	.2byte ITEM_POKEBLOCK_CASE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_PokeblockCase
	.byte 1
	.byte 1
	.byte POCKET_KEY_ITEMS
	.byte 3
	.4byte ItemUseOutOfBattle_PokeblockCase
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "LETTER$", 14
	.2byte ITEM_LETTER
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Letter
	.byte 2
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "EON TICKET$", 14
	.2byte ITEM_EON_TICKET
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_EonTicket
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 1

	.string "RED ORB$", 14
	.2byte ITEM_RED_ORB
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_RedOrb
	.byte 2
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "BLUE ORB$", 14
	.2byte ITEM_BLUE_ORB
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_BlueOrb
	.byte 2
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "SCANNER$", 14
	.2byte ITEM_SCANNER
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Scanner
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "GO-GOGGLES$", 14
	.2byte ITEM_GO_GOGGLES
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_GoGoggles
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "METEORITE$", 14
	.2byte ITEM_METEORITE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Meteorite
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "RM. 1 KEY$", 14
	.2byte ITEM_ROOM_1_KEY
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Room1Key
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "RM. 2 KEY$", 14
	.2byte ITEM_ROOM_2_KEY
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Room2Key
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "RM. 4 KEY$", 14
	.2byte ITEM_ROOM_4_KEY
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Room4Key
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "RM. 6 KEY$", 14
	.2byte ITEM_ROOM_6_KEY
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Room6Key
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "STORAGE KEY$", 14
	.2byte ITEM_STORAGE_KEY
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_StorageKey
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "ROOT FOSSIL$", 14
	.2byte ITEM_ROOT_FOSSIL
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_RootFossil
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "CLAW FOSSIL$", 14
	.2byte ITEM_CLAW_FOSSIL
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_ClawFossil
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "DEVON SCOPE$", 14
	.2byte ITEM_DEVON_SCOPE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_DevonScope
	.byte 1
	.byte 0
	.byte POCKET_KEY_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM01$", 14
	.2byte ITEM_TM01
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM01
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM02$", 14
	.2byte ITEM_TM02
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM02
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM03$", 14
	.2byte ITEM_TM03
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM03
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM04$", 14
	.2byte ITEM_TM04
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM04
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM05$", 14
	.2byte ITEM_TM05
	.2byte 1000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM05
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM06$", 14
	.2byte ITEM_TM06
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM06
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM07$", 14
	.2byte ITEM_TM07
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM07
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM08$", 14
	.2byte ITEM_TM08
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM08
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM09$", 14
	.2byte ITEM_TM09
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM09
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM10$", 14
	.2byte ITEM_TM10
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM10
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM11$", 14
	.2byte ITEM_TM11
	.2byte 2000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM11
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM12$", 14
	.2byte ITEM_TM12
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM12
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM13$", 14
	.2byte ITEM_TM13
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM13
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM14$", 14
	.2byte ITEM_TM14
	.2byte 5500 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM14
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM15$", 14
	.2byte ITEM_TM15
	.2byte 7500 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM15
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM16$", 14
	.2byte ITEM_TM16
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM16
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM17$", 14
	.2byte ITEM_TM17
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM17
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM18$", 14
	.2byte ITEM_TM18
	.2byte 2000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM18
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM19$", 14
	.2byte ITEM_TM19
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM19
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM20$", 14
	.2byte ITEM_TM20
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM20
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM21$", 14
	.2byte ITEM_TM21
	.2byte 1000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM21
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM22$", 14
	.2byte ITEM_TM22
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM22
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM23$", 14
	.2byte ITEM_TM23
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM23
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM24$", 14
	.2byte ITEM_TM24
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM24
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM25$", 14
	.2byte ITEM_TM25
	.2byte 5500 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM25
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM26$", 14
	.2byte ITEM_TM26
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM26
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM27$", 14
	.2byte ITEM_TM27
	.2byte 1000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM27
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM28$", 14
	.2byte ITEM_TM28
	.2byte 2000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM28
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM29$", 14
	.2byte ITEM_TM29
	.2byte 2000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM29
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM30$", 14
	.2byte ITEM_TM30
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM30
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM31$", 14
	.2byte ITEM_TM31
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM31
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM32$", 14
	.2byte ITEM_TM32
	.2byte 2000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM32
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM33$", 14
	.2byte ITEM_TM33
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM33
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM34$", 14
	.2byte ITEM_TM34
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM34
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM35$", 14
	.2byte ITEM_TM35
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM35
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM36$", 14
	.2byte ITEM_TM36
	.2byte 1000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM36
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM37$", 14
	.2byte ITEM_TM37
	.2byte 2000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM37
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM38$", 14
	.2byte ITEM_TM38
	.2byte 5500 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM38
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM39$", 14
	.2byte ITEM_TM39
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM39
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM40$", 14
	.2byte ITEM_TM40
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM40
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM41$", 14
	.2byte ITEM_TM41
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM41
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM42$", 14
	.2byte ITEM_TM42
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM42
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM43$", 14
	.2byte ITEM_TM43
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM43
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM44$", 14
	.2byte ITEM_TM44
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM44
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM45$", 14
	.2byte ITEM_TM45
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM45
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM46$", 14
	.2byte ITEM_TM46
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM46
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM47$", 14
	.2byte ITEM_TM47
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM47
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM48$", 14
	.2byte ITEM_TM48
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM48
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM49$", 14
	.2byte ITEM_TM49
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM49
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "TM50$", 14
	.2byte ITEM_TM50
	.2byte 3000 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_TM50
	.byte 0
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HM01$", 14
	.2byte ITEM_HM01
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HM01
	.byte 1
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HM02$", 14
	.2byte ITEM_HM02
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HM02
	.byte 1
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HM03$", 14
	.2byte ITEM_HM03
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HM03
	.byte 1
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HM04$", 14
	.2byte ITEM_HM04
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HM04
	.byte 1
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HM05$", 14
	.2byte ITEM_HM05
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HM05
	.byte 1
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HM06$", 14
	.2byte ITEM_HM06
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HM06
	.byte 1
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HM07$", 14
	.2byte ITEM_HM07
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HM07
	.byte 1
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "HM08$", 14
	.2byte ITEM_HM08
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_HM08
	.byte 1
	.byte 0
	.byte POCKET_TM_HM
	.byte 1
	.4byte ItemUseOutOfBattle_TMHM
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0

	.string "????????$", 14
	.2byte ITEM_NONE
	.2byte 0 @ price
	.byte 0
	.byte 0
	.4byte gItemDescription_Dummy
	.byte 0
	.byte 0
	.byte POCKET_ITEMS
	.byte 4
	.4byte ItemUseOutOfBattle_CannotUse
	.4byte 0
	.4byte NULL
	.4byte 0
