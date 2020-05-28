@*******************************************************************
@		fld_eff.s
@*******************************************************************
	
	.text
	.code 32

	.include	"fld_eff.def"

	.global		FldEffSeqTbl

@===================================================================
@		ﾌｨｰﾙﾄﾞｴﾌｪｸﾄｼｰｹﾝｽﾃｰﾌﾞﾙ
@===================================================================
FldEffSeqTbl:
	.long	FldEff_Gyoe							@ 00 びっくりﾏｰｸ
	.long	FldEff_IaiGrass						@ 01 いあいぎり(草)
	.long	FldEff_IaiTree						@ 02 いあいぎり(木)
	.long	FldEff_Shade						@ 03 影
	.long	FldEff_ShortGrassShake				@ 04 草1
	.long	FldEff_Ripple						@ 05 水溜り
	.long	FldEff_HidenCutIn					@ 06 秘伝技ｶｯﾄｲﾝ
	.long	FldEff_Ash							@ 07 灰
	.long	FldEff_PokeSwim						@ 08 波乗りﾎﾟｹﾓﾝ
	.long	FldEff_HidenPokeSwim				@ 09 秘伝技波乗り
	.long	FldEff_Hokori						@ 10 砂埃
	.long	FldEff_CaveBase						@ 11 基地作成（洞窟) 2001/10/22 by nakahiro
	.long	FldEff_ShortGrassFall				@ 12 草3
	.long	FldEff_FootPrint					@ 13 足跡1
	.long	FldEff_SplashSea					@ 14 水飛沫3
	.long	FldEff_Splash						@ 15 水飛沫1
	.long	FldEff_SplashWater					@ 16 水飛沫2
	.long	FldEff_LongGrassShake				@ 17 草4
	.long	FldEff_LongGrassFall				@ 18 草6
	.long	FldEff_ShortGrassEncount			@ 19 草2(ｴﾝｶｳﾝﾄ)
	.long	FldEff_LongGrassEncount				@ 20 草5(ｴﾝｶｳﾝﾄ)
	.long	FldEff_SandEncount					@ 21 砂3(ｴﾝｶｳﾝﾄ)
	.long	FldEff_WaterEncount					@ 22 水3(ｴﾝｶｳﾝﾄ)
	.long	FldEff_SeedEffect					@ 23 種ｴﾌｪｸﾄ
	.long	FldEff_FootPrintDeep				@ 24 足跡2
	.long	FldEff_PcRecover					@ 25 ﾎﾟｹｾﾝｴﾌｪｸﾄ
	.long	FldEff_TreeBase						@ 26 基地作成（木) 2001/12/25 by nakahiro
	.long	FldEff_GrassBase					@ 27 基地作成（草) 2001/12/25 by nakahiro
	.long	FldEff_TrainerHideWood				@ 28 ﾄﾚｰﾅｰ隠れ蓑木
	.long	FldEff_TrainerHideRock				@ 29 ﾄﾚｰﾅｰ隠れ蓑岩
	.long	FldEff_PokeSora						@ 30 そらとびﾎﾟｹﾓﾝ
	.long	FldEff_HidenPokeSora				@ 31 秘伝技空を飛ぶ
	.long	FldEff_HidenPokeSoraEnd				@ 32 秘伝技空を飛ぶ終了
	.long	FldEff_Hatena						@ 33 ﾊﾃﾅﾏｰｸ
	.long	FldEff_Shoal						@ 34 浅瀬
	.long	FldEff_FootPrintCycle				@ 35 足跡3
	.long	FldEff_TrainerHideSand				@ 36 ﾄﾚｰﾅｰ隠れ蓑砂
	.long	FldEff_Iwakudaki					@ 37 岩砕き
	.long	FldEff_Anawohoru					@ 38 穴を掘る
	.long	FldEff_DeepSand						@ 39 深い砂
	.long	FldEff_KairikiSet					@ 40 怪力セット
	.long	FldEff_SmallGrass					@ 41 小さい草
	.long	FldEff_Onsen						@ 42 温泉
	.long	FldEff_Takinobir					@ 43 滝登り
	.long	FldEff_Diving						@ 44 ﾀﾞｲﾋﾞﾝｸﾞ
	.long	FldEff_EcSpinBall					@ 45 回転ﾎﾞｰﾙ
	.long	FldEff_Heart						@ 46 ﾊｰﾄﾏｰｸ
	.long	FldEff_FusenGoods					@ 47 基地・水風船
	.long	FldEff_DoroGoods					@ 48 基地・泥団子
	.long	FldEff_GymSand						@ 49 ｼﾞﾑ砂煙
	.long	FldEff_Gayser						@ 50 間欠泉
	.long	FldEff_Amaikaori					@ 51 技・甘い香り
	.long	FldEff_SndObjGoods					@ 52 基地・砂の置物
	.long	FldEff_Awa							@ 53 泡
	.long	FldEff_Kirari						@ 54 星ｷﾗﾘ
	.long	FldEff_CaveBase2					@ 55 基地作成（洞窟)
	.long	FldEff_TreeBase2					@ 56 基地作成（木)
	.long	FldEff_GrassBase2					@ 57 基地作成（草)
	.long	FldEff_IaiGrass2					@ 58 いあいぎり(草)
	.long	FldEff_HidenCutInMine				@ 59 秘伝技ｶｯﾄｲﾝ手持ち
	.long	FldEff_EvSora						@ 60 点字用「空を飛ぶ」
	.long	FldEff_BasePC						@ 61 基地のパソコン
	.long	FldEff_DendouBall					@ 62 殿堂入りﾎﾞｰﾙ
	.long	FldEff_Teleport						@ 63 テレポート

@===================================================================
@		ｴﾌｪｸﾄｾｯﾄﾃﾞｰﾀ
@===================================================================
@---------------------------------------
@	びっくりﾏｰｸ
@---------------------------------------
FldEff_Gyoe:
	SUB_SET			FeGyoeSet
	SET_END

@---------------------------------------
@	いあいぎり(草・カットイン)
@---------------------------------------
FldEff_IaiGrass:
	SUB_SET			FeGrassCut
	SET_END

@---------------------------------------
@	いあいぎり(木)
@---------------------------------------
FldEff_IaiTree:
	SUB_SET			FeTreeCut
	SET_END

@---------------------------------------
@	影
@---------------------------------------
FldEff_Shade:
	SUB_SET			FeShadeSet
	SET_END

@---------------------------------------
@	短い草揺れ
@---------------------------------------
FldEff_ShortGrassShake:
	PAL_SUB_SET		FeUsePal1,FeShortGrassShakeSet
	SET_END

@---------------------------------------
@	水波紋
@---------------------------------------
FldEff_Ripple:
	PAL_SUB_SET		FeUsePal1,FeRippleSet
	SET_END

@---------------------------------------
@	秘伝技発動ｶｯﾄｲﾝ
@---------------------------------------
FldEff_HidenCutIn:
	SUB_SET			FeHidenCutIn
	SET_END

@---------------------------------------
@	灰
@---------------------------------------
FldEff_Ash:
	PAL_SUB_SET		FeUsePal1,FeAshSet
	SET_END

@---------------------------------------
@	波乗りﾎﾟｹﾓﾝ
@---------------------------------------
FldEff_PokeSwim:
	SUB_SET			FePokeSwimSet
	SET_END

@---------------------------------------
@	秘伝技 波乗り
@---------------------------------------
FldEff_HidenPokeSwim:
	SUB_SET			FeHidenPokeSwim
	SET_END

@---------------------------------------
@	砂埃
@---------------------------------------
FldEff_Hokori:
	PAL_SUB_SET		FeUsePal0,FeHokoriSet
	SET_END

@---------------------------------------
@	基地作成（洞窟・カットイン)
@---------------------------------------
FldEff_CaveBase:
	SUB_SET			FeCaveBase
	SET_END

@---------------------------------------
@	短い草ﾁﾘ
@---------------------------------------
FldEff_ShortGrassFall:
	PAL_SUB_SET		FeUsePal1,FeShortGrassFallSet
	SET_END

@---------------------------------------
@	足跡1
@---------------------------------------
FldEff_FootPrint:
	PAL_SUB_SET		FeUsePal0,FeFootPrintSet
	SET_END

@---------------------------------------
@	水飛沫3
@---------------------------------------
FldEff_SplashSea:
	PAL_SUB_SET		FeUsePal0,FeSplashSeaSet
	SET_END

@---------------------------------------
@	水飛沫1
@---------------------------------------
FldEff_Splash:
	PAL_SUB_SET		FeUsePal0,FeSplashSet
	SET_END

@---------------------------------------
@	水飛沫2
@---------------------------------------
FldEff_SplashWater:
	PAL_SUB_SET		FeUsePal0,FeSplashWaterSet
	SET_END

@---------------------------------------
@	長い草揺れ
@---------------------------------------
FldEff_LongGrassShake:
	PAL_SUB_SET		FeUsePal1,FeLongGrassShakeSet
	SET_END

@---------------------------------------
@	長い草ﾁﾘ
@---------------------------------------
FldEff_LongGrassFall:
	PAL_SUB_SET		FeUsePal1,FeLongGrassFallSet
	SET_END

@---------------------------------------
@	草2
@---------------------------------------
FldEff_ShortGrassEncount:
	PAL_SUB_SET		FeUsePal1,FeShortGrassEncountSet
	SET_END

@---------------------------------------
@	草5
@---------------------------------------
FldEff_LongGrassEncount:
	PAL_SUB_SET		FeUsePal1,FeLongGrassEncountSet
	SET_END

@---------------------------------------
@	砂3
@---------------------------------------
FldEff_SandEncount:
	PAL_SUB_SET		FeUsePal0,FeSandEncountSet
	SET_END

@---------------------------------------
@	水3
@---------------------------------------
FldEff_WaterEncount:
	PAL_SUB_SET		FeUsePal0,FeWaterEncountSet
	SET_END

@---------------------------------------
@	種ｴﾌｪｸﾄ
@---------------------------------------
FldEff_SeedEffect:
	SUB_SET			FeSeedEffectSet
	SET_END

@---------------------------------------
@	足跡1
@---------------------------------------
FldEff_FootPrintDeep:
	PAL_SUB_SET		FeUsePal0,FeFootPrintDeepSet
	SET_END

@---------------------------------------
@	ﾎﾟｹｾﾝ回復ｴﾌｪｸﾄ
@---------------------------------------
FldEff_PcRecover:
	PAL_SET			FePcRecoverPal
	PAL_SUB_SET		FeUsePal0,FePcRecoverSet
	SET_END

@---------------------------------------
@	基地作成（木・カットイン)
@---------------------------------------
FldEff_TreeBase:
	SUB_SET			FeTreeBase
	SET_END

@---------------------------------------
@	基地作成（草・カットイン)
@---------------------------------------
FldEff_GrassBase:
	SUB_SET			FeGrassBase
	SET_END

@---------------------------------------
@	ﾄﾚｰﾅｰ隠れ蓑 木
@---------------------------------------
FldEff_TrainerHideWood:
	SUB_SET			FeTrainerHideWoodSet
	SET_END

@---------------------------------------
@	ﾄﾚｰﾅｰ隠れ蓑 岩
@---------------------------------------
FldEff_TrainerHideRock:
	SUB_SET			FeTrainerHideRockSet
	SET_END

@---------------------------------------
@	そらとびﾎﾟｹﾓﾝ
@---------------------------------------
FldEff_PokeSora:
	SUB_SET			FePokeSoraSet
	SET_END

@---------------------------------------
@	秘伝技空を飛ぶ
@---------------------------------------
FldEff_HidenPokeSora:
	SUB_SET			FeHidenPokeSora
	SET_END

@---------------------------------------
@	秘伝技空を飛ぶ終了
@---------------------------------------
FldEff_HidenPokeSoraEnd:
	SUB_SET			FeHidenPokeSoraEnd
	SET_END

@---------------------------------------
@	ﾊﾃﾅﾏｰｸ
@---------------------------------------
FldEff_Hatena:
	SUB_SET			FeHatenaSet
	SET_END

@---------------------------------------
@	浅瀬
@---------------------------------------
FldEff_Shoal:
	PAL_SUB_SET		FeUsePal0,FeShoalSet
	SET_END

@---------------------------------------
@	足跡3
@---------------------------------------
FldEff_FootPrintCycle:
	PAL_SUB_SET		FeUsePal0,FeFootPrintCycleSet
	SET_END

@---------------------------------------
@	ﾄﾚｰﾅｰ隠れ蓑 砂
@---------------------------------------
FldEff_TrainerHideSand:
	SUB_SET			FeTrainerHideSandSet
	SET_END

@---------------------------------------
@	秘伝技・岩砕き
@---------------------------------------
FldEff_Iwakudaki:
	SUB_SET			FeIwakudaki
	SET_END

@---------------------------------------
@	秘伝技・怪力セット
@---------------------------------------
FldEff_KairikiSet:
	SUB_SET			FeKairikiSet
	SET_END

@---------------------------------------
@	技・穴を掘る
@---------------------------------------
FldEff_Anawohoru:
	SUB_SET			FeAnawohoru
	SET_END

@---------------------------------------
@	深い砂
@---------------------------------------
FldEff_DeepSand:
	PAL_SUB_SET		FeUsePal0,FeDeepSandSet
	SET_END

@---------------------------------------
@	小さい草
@---------------------------------------
FldEff_SmallGrass:
	PAL_SUB_SET		FeUsePal1,FeSmallGrassSet
	SET_END

@---------------------------------------
@	温泉
@---------------------------------------
FldEff_Onsen:
	PAL_SUB_SET		FeUsePal1,FeOnsenSet
	SET_END

@---------------------------------------
@	たきのぼり
@---------------------------------------
FldEff_Takinobir:
	SUB_SET			FeTakinoboriSet
	SET_END

@---------------------------------------
@	ﾀﾞｲﾋﾞﾝｸﾞ
@---------------------------------------
FldEff_Diving:
	SUB_SET			FeDivingSet
	SET_END

@---------------------------------------
@	回転ﾎﾞｰﾙ
@---------------------------------------
FldEff_EcSpinBall:
	PAL_NW_SET		EcBallPalData,
	SUB_SET			FeEcSpinBallSet
	SET_END

@---------------------------------------
@	ﾊｰﾄﾏｰｸ
@---------------------------------------
FldEff_Heart:
	PAL_SUB_SET		FeUsePal0,FeHeartSet
	SET_END

@---------------------------------------
@	基地・水風船
@---------------------------------------
FldEff_FusenGoods:
	SUB_SET			FeFusenGoods
	SET_END

@---------------------------------------
@	基地・泥団子
@---------------------------------------
FldEff_DoroGoods:
	SUB_SET			FeDoroGoods
	SET_END

@---------------------------------------
@	ｼﾞﾑ砂煙
@---------------------------------------
FldEff_GymSand:
	PAL_SUB_SET		GymSandPal,FeGymSandSet
	SET_END

@---------------------------------------
@	間欠泉
@---------------------------------------
FldEff_Gayser:
	PAL_SUB_SET		GymSandPal,FeGayserSet
	SET_END

@---------------------------------------
@	技・甘い香り
@---------------------------------------
FldEff_Amaikaori:
	SUB_SET			FeAmaikaori
	SET_END

@---------------------------------------
@	基地・砂の置物
@---------------------------------------
FldEff_SndObjGoods:
	PAL_SUB_SET		SndObjPal,FeSndObjGoods
	SET_END

@---------------------------------------
@	泡
@---------------------------------------
FldEff_Awa:
	PAL_SUB_SET		FeUsePal0,FeAwaSet
	SET_END

@---------------------------------------
@	星ｷﾗﾘ
@---------------------------------------
FldEff_Kirari:
	PAL_SUB_SET		KirariPal,FeKirariSet
	SET_END

@---------------------------------------
@	基地作成（洞窟)
@---------------------------------------
FldEff_CaveBase2:
	PAL_SUB_SET		CaveBasePal,FeCaveBase2
	SET_END

@---------------------------------------
@	基地作成（木)
@---------------------------------------
FldEff_TreeBase2:
	PAL_SUB_SET		FldBasePal,FeTreeBase2
	SET_END

@---------------------------------------
@	基地作成（草)
@---------------------------------------
FldEff_GrassBase2:
	PAL_SUB_SET		FldBasePal,FeGrassBase2
	SET_END

@---------------------------------------
@	いあいぎり(草)
@---------------------------------------
FldEff_IaiGrass2:
	PAL_SUB_SET		GrassPal,FeGrassCut2
	SET_END

@---------------------------------------
@	秘伝技ｶｯﾄｲﾝ手持ち
@---------------------------------------
FldEff_HidenCutInMine:
	SUB_SET			FeHidenCutInMine
	SET_END

@---------------------------------------
@	点字用「空を飛ぶ」
@---------------------------------------
FldEff_EvSora:
	SUB_SET		FeEvSora
	SET_END

@---------------------------------------
@	基地のパソコン
@---------------------------------------
FldEff_BasePC:
	SUB_SET			FeBasePC
	SET_END

@---------------------------------------
@	殿堂入りﾎﾞｰﾙｴﾌｪｸﾄ
@---------------------------------------
FldEff_DendouBall:
	PAL_SET			FePcRecoverPal
	PAL_SUB_SET		FeDendouScrnPal,FeDendouBallSet
	SET_END

@---------------------------------------
@	技・テレポート
@---------------------------------------
FldEff_Teleport:
	SUB_SET		FeTeleport
	SET_END
