	.include "include/macros.inc"
	.include "include/macros/field_effect_script.inc"
	.include "constants/constants.inc"

	.section script_data, "aw", %progbits

	.align 2
gFieldEffectScriptPointers:: @ 81D9B34
	.4byte gFieldEffectScript_ExclamationMarkIcon
	.4byte gFieldEffectScript_UseCutOnGrass
	.4byte gFieldEffectScript_UseCutOnTree
	.4byte gFieldEffectScript_Shadow
	.4byte gFieldEffectScript_TallGrass
	.4byte gFieldEffectScript_Ripple
	.4byte gFieldEffectScript_FieldMoveShowMon
	.4byte gFieldEffectScript_Ash
	.4byte gFieldEffectScript_SurfBlob
	.4byte gFieldEffectScript_UseSurf
	.4byte gFieldEffectScript_Dust
	.4byte gFieldEffectScript_UseSecretPowerCave
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
	.4byte gFieldEffectScript_PokecenterHeal
	.4byte gFieldEffectScript_UseSecretPowerTree
	.4byte gFieldEffectScript_UseSecretPowerShrub
	.4byte gFieldEffectScript_TreeDisguise
	.4byte gFieldEffectScript_MountainDisguise
	.4byte gFieldEffectScript_NPCFlyOut
	.4byte gFieldEffectScript_UseFly
	.4byte gFieldEffectScript_FlyIn
	.4byte gFieldEffectScript_QuestionMarkIcon
	.4byte gFieldEffectScript_FeetInFlowingWater
	.4byte gFieldEffectScript_BikeTireTracks
	.4byte gFieldEffectScript_SandDisguise
	.4byte gFieldEffectScript_UseRockSmash
	.4byte gFieldEffectScript_UseDig
	.4byte gFieldEffectScript_SandPile
	.4byte gFieldEffectScript_UseStrength
	.4byte gFieldEffectScript_ShortGrass
	.4byte gFieldEffectScript_HotSpringsWater
	.4byte gFieldEffectScript_UseWaterfall
	.4byte gFieldEffectScript_UseDive
	.4byte gFieldEffectScript_Pokeball
	.4byte gFieldEffectScript_HeartIcon
	.4byte gFieldEffectScript_Nop47
	.4byte gFieldEffectScript_Nop48
	.4byte gFieldEffectScript_PopOutOfAsh
	.4byte gFieldEffectScript_LavaridgeGymWarp
	.4byte gFieldEffectScript_SweetScent
	.4byte gFieldEffectScript_SandPillar
	.4byte gFieldEffectScript_Bubbles
	.4byte gFieldEffectScript_Sparkle
	.4byte gFieldEffectScript_SecretPowerCave
	.4byte gFieldEffectScript_SecretPowerTree
	.4byte gFieldEffectScript_SecretPowerShrub
	.4byte gFieldEffectScript_CutGrass
	.4byte gFieldEffectScript_FieldMoveShowMonInit
	.4byte gFieldEffectScript_UseFlyAncientTomb
	.4byte gFieldEffectScript_SecretBasePCTurnOn
	.4byte gFieldEffectScript_HallOfFameRecord
	.4byte gFieldEffectScript_UseTeleport

gFieldEffectScript_ExclamationMarkIcon: @ 81D9C34
	callnative FldEff_ExclamationMarkIcon
	end

gFieldEffectScript_UseCutOnGrass: @ 81D9C3A
	callnative FldEff_UseCutOnGrass
	end

gFieldEffectScript_UseCutOnTree: @ 81D9C40
	callnative FldEff_UseCutOnTree
	end

gFieldEffectScript_Shadow: @ 81D9C46
	callnative FldEff_Shadow
	end

gFieldEffectScript_TallGrass: @ 81D9C4C
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, FldEff_TallGrass
	end

gFieldEffectScript_Ripple: @ 81D9C56
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, FldEff_Ripple
	end

gFieldEffectScript_FieldMoveShowMon: @ 81D9C60
	callnative FldEff_FieldMoveShowMon
	end

gFieldEffectScript_Ash: @ 81D9C66
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, FldEff_Ash
	end

gFieldEffectScript_SurfBlob: @ 81D9C70
	callnative FldEff_SurfBlob
	end

gFieldEffectScript_UseSurf: @ 81D9C76
	callnative FldEff_UseSurf
	end

gFieldEffectScript_Dust: @ 81D9C7C
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_Dust
	end

gFieldEffectScript_UseSecretPowerCave: @ 81D9C86
	callnative FldEff_UseSecretPowerCave
	end

gFieldEffectScript_JumpTallGrass: @ 81D9C8C
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, FldEff_JumpTallGrass
	end

gFieldEffectScript_SandFootprints: @ 81D9C96
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_SandFootprints
	end

gFieldEffectScript_JumpBigSplash: @ 81D9CA0
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_JumpBigSplash
	end

gFieldEffectScript_Splash: @ 81D9CAA
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_Splash
	end

gFieldEffectScript_JumpSmallSplash: @ 81D9CB4
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_JumpSmallSplash
	end

gFieldEffectScript_LongGrass: @ 81D9CBE
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, FldEff_LongGrass
	end

gFieldEffectScript_JumpLongGrass: @ 81D9CC8
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, FldEff_JumpLongGrass
	end

gFieldEffectScript_Unknown19: @ 81D9CD2
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, FldEff_Unknown19
	end

gFieldEffectScript_Unknown20: @ 81D9CDC
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, FldEff_Unknown20
	end

gFieldEffectScript_Unknown21: @ 81D9CE6
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_Unknown21
	end

gFieldEffectScript_Unknown22: @ 81D9CF0
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_Unknown22
	end

gFieldEffectScript_BerryTreeGrowthSparkle: @ 81D9CFA
	callnative FldEff_BerryTreeGrowthSparkle
	end

gFieldEffectScript_DeepSandFootprints: @ 81D9D00
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_DeepSandFootprints
	end

gFieldEffectScript_PokecenterHeal: @ 81D9D0A
	loadfadedpal gFieldEffectObjectPaletteInfo4
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_PokecenterHeal
	end

gFieldEffectScript_UseSecretPowerTree: @ 81D9D19
	callnative FldEff_UseSecretPowerTree
	end

gFieldEffectScript_UseSecretPowerShrub: @ 81D9D1F
	callnative FldEff_UseSecretPowerShrub
	end

gFieldEffectScript_TreeDisguise: @ 81D9D25
	callnative FldEff_TreeDisguise
	end

gFieldEffectScript_MountainDisguise: @ 81D9D2B
	callnative FldEff_MountainDisguise
	end

gFieldEffectScript_NPCFlyOut: @ 81D9D31
	callnative FldEff_NPCFlyOut
	end

gFieldEffectScript_UseFly: @ 81D9D37
	callnative FldEff_UseFly
	end

gFieldEffectScript_FlyIn: @ 81D9D3D
	callnative FldEff_FlyIn
	end

gFieldEffectScript_QuestionMarkIcon: @ 81D9D43
	callnative FldEff_QuestionMarkIcon
	end

gFieldEffectScript_FeetInFlowingWater: @ 81D9D49
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_FeetInFlowingWater
	end

gFieldEffectScript_BikeTireTracks: @ 81D9D53
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_BikeTireTracks
	end

gFieldEffectScript_SandDisguise: @ 81D9D5D
	callnative FldEff_SandDisguise
	end

gFieldEffectScript_UseRockSmash: @ 81D9D63
	callnative FldEff_RockSmash
	end

gFieldEffectScript_UseStrength: @ 81D9D69
	callnative FldEff_UseStrength
	end

gFieldEffectScript_UseDig: @ 81D9D6F
	callnative FldEff_UseDig
	end

gFieldEffectScript_SandPile: @ 81D9D75
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_SandPile
	end

gFieldEffectScript_ShortGrass: @ 81D9D7F
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, FldEff_ShortGrass
	end

gFieldEffectScript_HotSpringsWater: @ 81D9D89
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo1, FldEff_HotSpringsWater
	end

gFieldEffectScript_UseWaterfall: @ 81D9D93
	callnative FldEff_UseWaterfall
	end

gFieldEffectScript_UseDive: @ 81D9D99
	callnative FldEff_UseDive
	end

gFieldEffectScript_Pokeball: @ 81D9D9F
	loadpal gFieldEffectObjectPaletteInfo10
	callnative FldEff_Pokeball
	end

gFieldEffectScript_HeartIcon: @ 81D9DAA
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_HeartIcon
	end

gFieldEffectScript_Nop47: @ 81D9DB4
	callnative FldEff_Nop47
	end

gFieldEffectScript_Nop48: @ 81D9DBA
	callnative FldEff_Nop48
	end

gFieldEffectScript_PopOutOfAsh: @ 81D9DC0
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo2, FldEff_PopOutOfAsh
	end

gFieldEffectScript_LavaridgeGymWarp: @ 81D9DCA
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo2, FldEff_LavaridgeGymWarp
	end

gFieldEffectScript_SweetScent: @ 81D9DD4
	callnative FldEff_SweetScent
	end

gFieldEffectScript_SandPillar: @ 81D9DDA
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo9, FldEff_SandPillar
	end

gFieldEffectScript_Bubbles: @ 81D9DE4
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo0, FldEff_Bubbles
	end

gFieldEffectScript_Sparkle: @ 81D9DEE
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo3, FldEff_Sparkle
	end

gFieldEffectScript_SecretPowerCave: @ 81D9DF8
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo7, FldEff_SecretPowerCave
	end

gFieldEffectScript_SecretPowerTree: @ 81D9E02
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo8, FldEff_SecretPowerTree
	end

gFieldEffectScript_SecretPowerShrub: @ 81D9E0C
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo8, FldEff_SecretPowerShrub
	end

gFieldEffectScript_CutGrass: @ 81D9E16
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo6, FldEff_CutGrass
	end

gFieldEffectScript_FieldMoveShowMonInit: @ 81D9E20
	callnative FldEff_FieldMoveShowMonInit
	end

gFieldEffectScript_UseFlyAncientTomb: @ 81D9E26
	callnative FldEff_UseFlyAncientTomb
	end

gFieldEffectScript_SecretBasePCTurnOn: @ 81D9E2C
	callnative FldEff_SecretBasePCTurnOn
	end

gFieldEffectScript_HallOfFameRecord: @ 81D9E32
	loadfadedpal gFieldEffectObjectPaletteInfo4
	loadfadedpal_callnative gFieldEffectObjectPaletteInfo5, FldEff_HallOfFameRecord
	end

gFieldEffectScript_UseTeleport: @ 81D9E41
	callnative FldEff_UseTeleport
	end
