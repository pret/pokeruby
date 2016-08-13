	.include "asm/macros.s"
	.include "constants/constants.s"

	.section script_data, "aw", %progbits

	.align 2
gFieldEffectScriptPointers:: @ 81D9B34
	.4byte gFieldEffectScript_ExclamationMarkIcon1
	.4byte gFieldEffectScript_UseCutOnTallGrass
	.4byte gFieldEffectScript_UseCutOnTree
	.4byte gFieldEffectScript_Shadow
	.4byte gFieldEffectScript_TallGrass
	.4byte gFieldEffectScript_Ripple
	.4byte gFieldEffectScript_FieldMoveShowMon
	.4byte gFieldEffectScript_Ash
	.4byte gFieldEffectScript_SurfBlob
	.4byte gFieldEffectScript_UseSurf
	.4byte gFieldEffectScript_Dust
	.4byte gFieldEffectScript_Unknown11
	.4byte gFieldEffectScript_JumpTallGrass
	.4byte gFieldEffectScript_SandFootprints
	.4byte gFieldEffectScript_JumpBigSplash
	.4byte gFieldEffectScript_Splash
	.4byte gFieldEffectScript_JumpSmallSplash
	.4byte gFieldEffectScript_LongGrass
	.4byte gFieldEffectScript_JumpLongGrass
	.4byte gFieldEffectScript_Unknown19
	.4byte gFieldEffectScript_Unknown20
	.4byte gFieldEffectScript_Unknown21
	.4byte gFieldEffectScript_Unknown22
	.4byte gFieldEffectScript_BerryTreeGrowthSparkle
	.4byte gFieldEffectScript_DeepSandFootprints
	.4byte gFieldEffectScript_Unknown25
	.4byte gFieldEffectScript_Unknown26
	.4byte gFieldEffectScript_Unknown27
	.4byte gFieldEffectScript_TreeDisguise
	.4byte gFieldEffectScript_MountainDisguise
	.4byte gFieldEffectScript_Unknown30
	.4byte gFieldEffectScript_UseFly
	.4byte gFieldEffectScript_FlyIn
	.4byte gFieldEffectScript_ExclamationMarkIcon2
	.4byte gFieldEffectScript_FeetInFlowingWater
	.4byte gFieldEffectScript_BikeTireTracks
	.4byte gFieldEffectScript_SandDisguise
	.4byte gFieldEffectScript_UseRockSmash
	.4byte gFieldEffectScript_Unknown38
	.4byte gFieldEffectScript_Unknown39
	.4byte gFieldEffectScript_Unknown40
	.4byte gFieldEffectScript_ShortGrass
	.4byte gFieldEffectScript_HotSpringsWater
	.4byte gFieldEffectScript_Unknown43
	.4byte gFieldEffectScript_Unknown44
	.4byte gFieldEffectScript_Pokeball
	.4byte gFieldEffectScript_HeartIcon
	.4byte gFieldEffectScript_Unknown47
	.4byte gFieldEffectScript_Unknown48
	.4byte gFieldEffectScript_PopOutOfAsh
	.4byte gFieldEffectScript_Unknown50
	.4byte gFieldEffectScript_SweetScent
	.4byte gFieldEffectScript_Unknown52
	.4byte gFieldEffectScript_Bubbles
	.4byte gFieldEffectScript_Unknown54
	.4byte gFieldEffectScript_Unknown55
	.4byte gFieldEffectScript_Unknown56
	.4byte gFieldEffectScript_Unknown57
	.4byte gFieldEffectScript_Unknown58
	.4byte gFieldEffectScript_FieldMoveShowMonInit
	.4byte gFieldEffectScript_Unknown60
	.4byte gFieldEffectScript_Unknown61
	.4byte gFieldEffectScript_Unknown62
	.4byte gFieldEffectScript_Unknown63

gFieldEffectScript_ExclamationMarkIcon1: @ 81D9C34
	field_eff_callnative oei_exclamation_mark
	field_eff_end

gFieldEffectScript_UseCutOnTallGrass: @ 81D9C3A
	field_eff_callnative sub_80A2604
	field_eff_end

gFieldEffectScript_UseCutOnTree: @ 81D9C40
	field_eff_callnative sub_80A2654
	field_eff_end

gFieldEffectScript_Shadow: @ 81D9C46
	field_eff_callnative oei_shadow
	field_eff_end

gFieldEffectScript_TallGrass: @ 81D9C4C
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, oei_grass_normal
	field_eff_end

gFieldEffectScript_Ripple: @ 81D9C56
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, oei_ripples
	field_eff_end

gFieldEffectScript_FieldMoveShowMon: @ 81D9C60
	field_eff_callnative sub_8088068
	field_eff_end

gFieldEffectScript_Ash: @ 81D9C66
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, oei_ash
	field_eff_end

gFieldEffectScript_SurfBlob: @ 81D9C70
	field_eff_callnative sub_8127E58
	field_eff_end

gFieldEffectScript_UseSurf: @ 81D9C76
	field_eff_callnative sub_8088914
	field_eff_end

gFieldEffectScript_Dust: @ 81D9C7C
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_81281B4
	field_eff_end

gFieldEffectScript_Unknown11: @ 81D9C86
	field_eff_callnative sub_80C63BC
	field_eff_end

gFieldEffectScript_JumpTallGrass: @ 81D9C8C
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_8126F80
	field_eff_end

gFieldEffectScript_SandFootprints: @ 81D9C96
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127428
	field_eff_end

gFieldEffectScript_JumpBigSplash: @ 81D9CA0
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, oei_water_drop_tall
	field_eff_end

gFieldEffectScript_Splash: @ 81D9CAA
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127610
	field_eff_end

gFieldEffectScript_JumpSmallSplash: @ 81D9CB4
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127740
	field_eff_end

gFieldEffectScript_LongGrass: @ 81D9CBE
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_8127080
	field_eff_end

gFieldEffectScript_JumpLongGrass: @ 81D9CC8
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_8127220
	field_eff_end

gFieldEffectScript_Unknown19: @ 81D9CD2
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_8127B14
	field_eff_end

gFieldEffectScript_Unknown20: @ 81D9CDC
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_8127B80
	field_eff_end

gFieldEffectScript_Unknown21: @ 81D9CE6
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127BEC
	field_eff_end

gFieldEffectScript_Unknown22: @ 81D9CF0
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127C58
	field_eff_end

gFieldEffectScript_BerryTreeGrowthSparkle: @ 81D9CFA
	field_eff_callnative sub_8128450
	field_eff_end

gFieldEffectScript_DeepSandFootprints: @ 81D9D00
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_812749C
	field_eff_end

gFieldEffectScript_Unknown25: @ 81D9D0A
	field_eff_loadfadedpal gFieldEffectObjectPaletteInfo4
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8085D80
	field_eff_end

gFieldEffectScript_Unknown26: @ 81D9D19
	field_eff_callnative sub_80C64C8
	field_eff_end

gFieldEffectScript_Unknown27: @ 81D9D1F
	field_eff_callnative sub_80C662C
	field_eff_end

gFieldEffectScript_TreeDisguise: @ 81D9D25
	field_eff_callnative ShowTreeDisguiseFieldEffect
	field_eff_end

gFieldEffectScript_MountainDisguise: @ 81D9D2B
	field_eff_callnative ShowMountainDisguiseFieldEffect
	field_eff_end

gFieldEffectScript_Unknown30: @ 81D9D31
	field_eff_callnative sub_8088B68
	field_eff_end

gFieldEffectScript_UseFly: @ 81D9D37
	field_eff_callnative sub_8088C40
	field_eff_end

gFieldEffectScript_FlyIn: @ 81D9D3D
	field_eff_callnative sub_808925C
	field_eff_end

gFieldEffectScript_ExclamationMarkIcon2: @ 81D9D43
	field_eff_callnative sub_8084824
	field_eff_end

gFieldEffectScript_FeetInFlowingWater: @ 81D9D49
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127820
	field_eff_end

gFieldEffectScript_BikeTireTracks: @ 81D9D53
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127510
	field_eff_end

gFieldEffectScript_SandDisguise: @ 81D9D5D
	field_eff_callnative ShowSandDisguiseFieldEffect
	field_eff_end

gFieldEffectScript_UseRockSmash: @ 81D9D63
	field_eff_callnative oei_rocksmash
	field_eff_end

gFieldEffectScript_Unknown40: @ 81D9D69
	field_eff_callnative sub_811AA54
	field_eff_end

gFieldEffectScript_Unknown38: @ 81D9D6F
	field_eff_callnative sub_810B5F8
	field_eff_end

gFieldEffectScript_Unknown39: @ 81D9D75
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8128224
	field_eff_end

gFieldEffectScript_ShortGrass: @ 81D9D7F
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_8127290
	field_eff_end

gFieldEffectScript_HotSpringsWater: @ 81D9D89
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_81279D8
	field_eff_end

gFieldEffectScript_Unknown43: @ 81D9D93
	field_eff_callnative sub_8086F2C
	field_eff_end

gFieldEffectScript_Unknown44: @ 81D9D99
	field_eff_callnative sub_80870B0
	field_eff_end

gFieldEffectScript_Pokeball: @ 81D9D9F
	field_eff_loadpal gFieldEffectObjectPaletteInfo10
	field_eff_callnative sub_811B6B4
	field_eff_end

gFieldEffectScript_HeartIcon: @ 81D9DAA
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_808485C
	field_eff_end

gFieldEffectScript_Unknown47: @ 81D9DB4
	field_eff_callnative sub_80C69BC
	field_eff_end

gFieldEffectScript_Unknown48: @ 81D9DBA
	field_eff_callnative sub_80C69C0
	field_eff_end

gFieldEffectScript_PopOutOfAsh: @ 81D9DC0
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo2, sub_8087828
	field_eff_end

gFieldEffectScript_Unknown50: @ 81D9DCA
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo2, sub_80875D4
	field_eff_end

gFieldEffectScript_SweetScent: @ 81D9DD4
	field_eff_callnative sub_812BFF0
	field_eff_end

gFieldEffectScript_Unknown52: @ 81D9DDA
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo9, sub_80C6D3C
	field_eff_end

gFieldEffectScript_Bubbles: @ 81D9DE4
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_81283AC
	field_eff_end

gFieldEffectScript_Unknown54: @ 81D9DEE
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo3, sub_8128700
	field_eff_end

gFieldEffectScript_Unknown55: @ 81D9DF8
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo7, sub_80C63FC
	field_eff_end

gFieldEffectScript_Unknown56: @ 81D9E02
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo8, sub_80C6508
	field_eff_end

gFieldEffectScript_Unknown57: @ 81D9E0C
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo8, sub_80C666C
	field_eff_end

gFieldEffectScript_Unknown58: @ 81D9E16
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo6, sub_80A2698
	field_eff_end

gFieldEffectScript_FieldMoveShowMonInit: @ 81D9E20
	field_eff_callnative sub_80880C4
	field_eff_end

gFieldEffectScript_Unknown60: @ 81D9E26
	field_eff_callnative sub_81475E0
	field_eff_end

gFieldEffectScript_Unknown61: @ 81D9E2C
	field_eff_callnative sub_80C6718
	field_eff_end

gFieldEffectScript_Unknown62: @ 81D9E32
	field_eff_loadfadedpal gFieldEffectObjectPaletteInfo4
	field_eff_loadfadedpal_callnative gFieldEffectObjectPaletteInfo5, sub_8085ED4
	field_eff_end

gFieldEffectScript_Unknown63: @ 81D9E41
	field_eff_callnative sub_814A3D4
	field_eff_end
