	.include "asm/macros.s"
	.include "asm/macros/field_effect_script.s"
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
	callnative oei_exclamation_mark
	end

gFieldEffectScript_UseCutOnTallGrass: @ 81D9C3A
	callnative sub_80A2604
	end

gFieldEffectScript_UseCutOnTree: @ 81D9C40
	callnative sub_80A2654
	end

gFieldEffectScript_Shadow: @ 81D9C46
	callnative oei_shadow
	end

gFieldEffectScript_TallGrass: @ 81D9C4C
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, oei_grass_normal
	end

gFieldEffectScript_Ripple: @ 81D9C56
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, oei_ripples
	end

gFieldEffectScript_FieldMoveShowMon: @ 81D9C60
	callnative sub_8088068
	end

gFieldEffectScript_Ash: @ 81D9C66
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, oei_ash
	end

gFieldEffectScript_SurfBlob: @ 81D9C70
	callnative sub_8127E58
	end

gFieldEffectScript_UseSurf: @ 81D9C76
	callnative sub_8088914
	end

gFieldEffectScript_Dust: @ 81D9C7C
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_81281B4
	end

gFieldEffectScript_Unknown11: @ 81D9C86
	callnative sub_80C63BC
	end

gFieldEffectScript_JumpTallGrass: @ 81D9C8C
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_8126F80
	end

gFieldEffectScript_SandFootprints: @ 81D9C96
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127428
	end

gFieldEffectScript_JumpBigSplash: @ 81D9CA0
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, oei_water_drop_tall
	end

gFieldEffectScript_Splash: @ 81D9CAA
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127610
	end

gFieldEffectScript_JumpSmallSplash: @ 81D9CB4
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127740
	end

gFieldEffectScript_LongGrass: @ 81D9CBE
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_8127080
	end

gFieldEffectScript_JumpLongGrass: @ 81D9CC8
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_8127220
	end

gFieldEffectScript_Unknown19: @ 81D9CD2
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_8127B14
	end

gFieldEffectScript_Unknown20: @ 81D9CDC
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_8127B80
	end

gFieldEffectScript_Unknown21: @ 81D9CE6
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127BEC
	end

gFieldEffectScript_Unknown22: @ 81D9CF0
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127C58
	end

gFieldEffectScript_BerryTreeGrowthSparkle: @ 81D9CFA
	callnative sub_8128450
	end

gFieldEffectScript_DeepSandFootprints: @ 81D9D00
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_812749C
	end

gFieldEffectScript_Unknown25: @ 81D9D0A
	loadfadedpal gFieldEffectObjectPaletteInfo4
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_PokecenterHeal
	end

gFieldEffectScript_Unknown26: @ 81D9D19
	callnative sub_80C64C8
	end

gFieldEffectScript_Unknown27: @ 81D9D1F
	callnative sub_80C662C
	end

gFieldEffectScript_TreeDisguise: @ 81D9D25
	callnative ShowTreeDisguiseFieldEffect
	end

gFieldEffectScript_MountainDisguise: @ 81D9D2B
	callnative ShowMountainDisguiseFieldEffect
	end

gFieldEffectScript_Unknown30: @ 81D9D31
	callnative sub_8088B68
	end

gFieldEffectScript_UseFly: @ 81D9D37
	callnative sub_8088C40
	end

gFieldEffectScript_FlyIn: @ 81D9D3D
	callnative sub_808925C
	end

gFieldEffectScript_ExclamationMarkIcon2: @ 81D9D43
	callnative sub_8084824
	end

gFieldEffectScript_FeetInFlowingWater: @ 81D9D49
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127820
	end

gFieldEffectScript_BikeTireTracks: @ 81D9D53
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8127510
	end

gFieldEffectScript_SandDisguise: @ 81D9D5D
	callnative ShowSandDisguiseFieldEffect
	end

gFieldEffectScript_UseRockSmash: @ 81D9D63
	callnative oei_rocksmash
	end

gFieldEffectScript_Unknown40: @ 81D9D69
	callnative sub_811AA54
	end

gFieldEffectScript_Unknown38: @ 81D9D6F
	callnative sub_810B5F8
	end

gFieldEffectScript_Unknown39: @ 81D9D75
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_8128224
	end

gFieldEffectScript_ShortGrass: @ 81D9D7F
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_8127290
	end

gFieldEffectScript_HotSpringsWater: @ 81D9D89
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, sub_81279D8
	end

gFieldEffectScript_Unknown43: @ 81D9D93
	callnative sub_8086F2C
	end

gFieldEffectScript_Unknown44: @ 81D9D99
	callnative sub_80870B0
	end

gFieldEffectScript_Pokeball: @ 81D9D9F
	loadpal gFieldEffectObjectPaletteInfo10
	callnative sub_811B6B4
	end

gFieldEffectScript_HeartIcon: @ 81D9DAA
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_808485C
	end

gFieldEffectScript_Unknown47: @ 81D9DB4
	callnative sub_80C69BC
	end

gFieldEffectScript_Unknown48: @ 81D9DBA
	callnative sub_80C69C0
	end

gFieldEffectScript_PopOutOfAsh: @ 81D9DC0
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo2, sub_8087828
	end

gFieldEffectScript_Unknown50: @ 81D9DCA
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo2, sub_80875D4
	end

gFieldEffectScript_SweetScent: @ 81D9DD4
	callnative sub_812BFF0
	end

gFieldEffectScript_Unknown52: @ 81D9DDA
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo9, sub_80C6D3C
	end

gFieldEffectScript_Bubbles: @ 81D9DE4
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, sub_81283AC
	end

gFieldEffectScript_Unknown54: @ 81D9DEE
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo3, sub_8128700
	end

gFieldEffectScript_Unknown55: @ 81D9DF8
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo7, sub_80C63FC
	end

gFieldEffectScript_Unknown56: @ 81D9E02
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo8, sub_80C6508
	end

gFieldEffectScript_Unknown57: @ 81D9E0C
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo8, sub_80C666C
	end

gFieldEffectScript_Unknown58: @ 81D9E16
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo6, sub_80A2698
	end

gFieldEffectScript_FieldMoveShowMonInit: @ 81D9E20
	callnative sub_80880C4
	end

gFieldEffectScript_Unknown60: @ 81D9E26
	callnative sub_81475E0
	end

gFieldEffectScript_Unknown61: @ 81D9E2C
	callnative sub_80C6718
	end

gFieldEffectScript_Unknown62: @ 81D9E32
	loadfadedpal gFieldEffectObjectPaletteInfo4
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo5, FldEff_HallOfFameRecord
	end

gFieldEffectScript_Unknown63: @ 81D9E41
	callnative sub_814A3D4
	end
