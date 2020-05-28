//**********************************************************************
//		fld_eff.h
//**********************************************************************
#ifndef	FLD_EFF_H
#define	FLD_EFF_H

#undef	EXT
#ifdef 	FLD_EFF_H_PROTO
#define	EXT	/**/
#else
#define	EXT extern
#endif

/*------------------------------------------*/
/*	ﾌｨｰﾙﾄﾞｴﾌｪｸﾄ 呼び出し ｺｰﾄﾞ				*/
/*------------------------------------------*/
#define	FECODE_Gyoe					0x00				/* 001 ｷﾞｮｴｰ				*/
#define	FECODE_IaiGrass				0x01				/* 001 いあいぎり(草)		*/
#define	FECODE_IaiTree				0x02				/* 002 いあいぎり(木)		*/
#define FECODE_Shade				0x03				/* 003 影					*/
#define FECODE_ShortGrassShake		0x04				/* 004 短い草揺れ			*/
#define FECODE_Ripple				0x05				/* 005 水溜り				*/
#define FECODE_HidenCutIn			0x06				/* 006 秘伝技ｶｯﾄｲﾝ			*/
#define FECODE_Ash					0x07				/* 007 灰					*/
#define FECODE_PokeSwim				0x08				/* 008 波乗りﾎﾟｹﾓﾝ			*/
#define FECODE_HidenPokeSwim		0x09				/* 009 秘伝技波乗り			*/
#define FECODE_Hokori				0x0a				/* 010 砂埃					*/
#define FECODE_CaveBase				0x0b				/* 011 基地作成（洞窟）		*/
#define FECODE_ShortGrassFall		0x0c				/* 012 短い草ﾁﾘ				*/
#define FECODE_FootPrint			0x0d				/* 013 足跡					*/
#define FECODE_SplashSea			0x0e				/* 014 水飛沫3				*/
#define FECODE_Splash				0x0f				/* 015 水飛沫1				*/
#define FECODE_SplashWater			0x10				/* 016 水飛沫2				*/
#define FECODE_LongGrassShake		0x11				/* 017 長い草揺れ			*/
#define FECODE_LongGrassFall		0x12				/* 018 長い草ﾁﾘ				*/
#define FECODE_ShortGrassEncount	0x13				/* 019 短い草ｴﾝｶｳﾝﾄ			*/
#define FECODE_LongGrassEncount		0x14				/* 020 長い草ｴﾝｶｳﾝﾄ			*/
#define FECODE_SandEncount			0x15				/* 021 砂ｴﾝｶｳﾝﾄ				*/
#define FECODE_WaterEncount			0x16				/* 022 水ｴﾝｶｳﾝﾄ				*/
#define FECODE_SeedEffect			0x17				/* 023 種ｴﾌｪｸﾄ				*/
#define FECODE_FootPrintDeep		0x18				/* 024 足跡					*/
#define FECODE_PcRecover			0x19				/* 025 ﾎﾟｹｾﾝ回復ｴﾌｪｸﾄ		*/
#define FECODE_TreeBase				0x1a				/* 026 基地作成（木）		*/
#define FECODE_GrassBase			0x1b				/* 027 基地作成（草）		*/
#define FECODE_TrainerHideWood		0x1c				/* 028 ﾄﾚｰﾅｰ隠れ蓑木		*/
#define FECODE_TrainerHideRock		0x1d				/* 029 ﾄﾚｰﾅｰ隠れ蓑岩		*/
#define FECODE_PokeSora				0x1e				/* 030 そらとびﾎﾟｹﾓﾝ		*/
#define FECODE_HidenPokeSora		0x1f				/* 031 秘伝技空を飛ぶ		*/
#define	FECODE_HidenPokeSoraEnd		0x20				/* 032 秘伝技空を飛ぶ終了	*/
#define FECODE_Hatena				0x21				/* 033 ﾊﾃﾅﾏｰｸ				*/
#define	FECODE_Shoal				0x22				/* 034 浅瀬					*/
#define FECODE_FootPrintCycle		0x23				/* 035 足跡					*/
#define FECODE_TrainerHideSand		0x24				/* 036 ﾄﾚｰﾅｰ隠れ蓑砂		*/
#define FECODE_Iwakudaki			0x25				/* 037 秘伝技・岩砕き		*/
#define FECODE_Anawohoru			0x26				/* 038 技・穴を掘る			*/
#define FECODE_DeepSand				0x27				/* 039 深い砂				*/
#define FECODE_KairikiSet			0x28				/* 040 秘伝技・怪力セット	*/
#define FECODE_SmallGrass			0x29				/* 041 小さい草				*/
#define FECODE_Onsen				0x2a				/* 042 温泉					*/
#define FECODE_Takinobori			0x2b				/* 043 滝登り				*/
#define FECODE_Diving				0x2c				/* 044 ﾀﾞｲﾋﾞﾝｸﾞ				*/
#define FECODE_EcActBall			0x2d				/* 045 ｴﾝｶｳﾝﾄﾎﾞｰﾙ			*/
#define FECODE_Heart				0x2e				/* 046 ﾊｰﾄﾏｰｸ				*/
#define FECODE_Fusen				0x2f				/* 047 基地・水風船			*/
#define FECODE_Doro					0x30				/* 048 基地・泥団子			*/
#define FECODE_GymSand				0x31				/* 049 ｼﾞﾑ砂煙				*/
#define FECODE_Gayser				0x32				/* 050 間欠泉				*/
#define FECODE_Amaikaori			0x33				/* 051 技・甘い香り			*/
#define	FECODE_SndObjGoods			0x34				/* 052 基地・砂の置物		*/
#define FECODE_Awa					0x35				/* 053 泡					*/
#define FECODE_Kirari				0x36				/* 054 星ｷﾗﾘ				*/
#define FECODE_CaveBase2			0x37				/* 055 基地作成（洞窟）		*/
#define FECODE_TreeBase2			0x38				/* 056 基地作成（木）		*/
#define FECODE_GrassBase2			0x39				/* 057 基地作成（草）		*/
#define	FECODE_IaiGrass2			0x3a				/* 058 いあいぎり(草)		*/
#define FECODE_HidenCutInMine		0x3b				/* 059 秘伝技ｶｯﾄｲﾝ手持ち	*/
#define FECODE_EvSora				0x3c				/* 060 点字用「空を飛ぶ」	*/
#define FECODE_BasePC				0x3d				/* 061 基地のパソコン		*/
#define FECODE_DendouBall			0x3e				/* 062 殿堂入りﾎﾞｰﾙ			*/
#define FECODE_Teleport				0x3f				/* 063 技・テレポート		*/

#define FECODE_END					0xff				/* 255 終了ｺｰﾄﾞ				*/

#ifndef ASM_CPP											/* C ｿｰｽ					*/
//------------------------------------------
//	ﾌｨｰﾙﾄﾞﾊﾟﾚｯﾄID 規定値
//------------------------------------------
#define	FLD_PalID_FE_START		0x1000					// ﾌｨｰﾙﾄﾞｴﾌｪｸﾄ用ﾊﾟﾚｯﾄID
#define	FLD_PalID_FE_END		0x10ff

#define	FLD_PalID_EVOBJ_START	0x1100					// ﾌｨｰﾙﾄﾞOBJ用ﾊﾟﾚｯﾄID
#define	FLD_PalID_EVOBJ_END		0x11ff

#define	FLD_PalID_WEATHER_START	0x1200					// 天候用ﾊﾟﾚｯﾄID
#define	FLD_PalID_WEATHER_END	0x12ff

//------------------------------------------
//	ﾌｨｰﾙﾄﾞｴﾌｪｸﾄ ﾊﾟﾚｯﾄ ID
//------------------------------------------
enum
{
	FE_Grass_PalID = FLD_PalID_FE_START,				// 草
	FE_StandHero_PalID,									// 立ちﾋｰﾛｰ
	FE_StandHeroine_PalID,								// 立ちﾋﾛｲﾝ
	FE_CaveBase_PalID,									// 基地作成(洞窟)2001/10/22 by nakahiro
	FE_Use0_PalID,										// ﾌｨｰﾙﾄﾞｴﾌｪｸﾄ専用ﾊﾟﾚｯﾄ0
	FE_Use1_PalID,										// ﾌｨｰﾙﾄﾞｴﾌｪｸﾄ専用ﾊﾟﾚｯﾄ1
	FE_StandOdamaki_PalID,								// 立ち博士
	FE_PcRecover_PalID,									// ﾎﾟｹｾﾝ回復ｴﾌｪｸﾄ
	FE_FldBase_PalID,									// 基地作成　2001/12/25 by nakahiro
	FE_EcBall_PalID,									// ﾎﾞｰﾙ
	FE_EcTrainer_PalID,									// ﾄﾚｰﾅｰ
	FE_FusenGoods_PalID,								// 基地・水風船
	FE_DoroGoods_PalID,									// 基地・泥団子
	FE_GymSand_PalID,									// ｼﾞﾑ砂嵐,間欠泉
	FE_SndObjGoods_PalID,								// 基地・砂の置物
	FE_Kirari_PalID,									// 星ｷﾗﾘ
	FE_DendouScrn_PalID,								// 殿堂入り
};

//------------------------------------------
//	ﾌｨｰﾙﾄﾞ ｾﾙ ID 規定値
//------------------------------------------
#define	FLD_CellID_FE_START			0x1000				// ﾌｨｰﾙﾄﾞｴﾌｪｸﾄ用ｾﾙID
#define	FLD_CellID_FE_END			0x10ff

#define	FLD_CellID_EVOBJ_START		0x1100				// ｲﾍﾞﾝﾄOBJ用ｾﾙID
#define	FLD_CellID_EVOBJ_END		0x11ff

#define FLD_CellID_WEATHER_START	0x1200				// 天候用ｾﾙID
#define FLD_CellID_WEATHER_END		0x12ff

//------------------------------------------
//	ﾌｨｰﾙﾄﾞｴﾌｪｸﾄ ｾﾙ ID
//------------------------------------------
enum
{
	FE_DMY_CELLID = FLD_CellID_FE_START,
};

//------------------------------------------
//	ｸﾞﾛｰﾊﾞﾙ
//------------------------------------------
EXT s32	FeSetWork[8];									// ｾｯﾄﾜｰｸ

//------------------------------------------
//	関数定義
//------------------------------------------
EXT	u32	FldEffSet(u8);									// ｴﾌｪｸﾄ呼び出し

EXT void FeDelAct(actWork*);							// ｴﾌｪｸﾄｱｸﾀｰ削除
EXT void FeDelActCode(actWork*,u8);						// ｱｸﾀｰ削除,ｺｰﾄﾞ削除

EXT void FeCodeInit(void);								// ｴﾌｪｸﾄｺｰﾄﾞ初期化
EXT void FeCodeSet(u8);									// ｴﾌｪｸﾄｺｰﾄﾞｾｯﾄ
EXT void FeCodeDel(u8);									// ｺｰﾄﾞ削除
EXT u8 FeCodeChk(u8);									// ｴﾌｪｸﾄｺｰﾄﾞﾁｪｯｸ

EXT u8 SetStandTrainerActor(u8,s16,s16,u8,void*);		// 立ち姿ﾄﾚｰﾅｰｱｸﾀｰｾｯﾄ
EXT void SetStandTrainerVram(u8,u16,void*);				// 立ち姿ﾄﾚｰﾅVRAMｾｯﾄ
EXT u8 StandOdamakiSet(s16,s16,u8);						// 博士立ちｱｸﾀｾｯﾄ

EXT u8 FePokeSet(u16,s16,s16,u8);						// ﾎﾟｹﾓﾝOBJｾｯﾄ
EXT u8 FePokeRareSet(u16,u32,u32,s16,s16,u8);			// ﾎﾟｹﾓﾝOBJｾｯﾄ
EXT void FePokeDel(actWork*);							// ﾎﾟｹﾓﾝOBJ削除

EXT void ColorFadeUp(u16,u8,u8,u8);						// ｶﾗｰﾌｪｰﾄﾞｱｯﾌﾟ
EXT void ColorFadeDown(u16,u8,u8,u8);					// ｶﾗｰﾌｪｰﾄﾞﾀﾞｳﾝ

EXT void SetFieldFlyInStart(void);
EXT void FieldInitFallTask(void);						// 落とし穴落下最初の処理
EXT void FieldInitWarpTask(void);						// ワープ後の処理

EXT void SetMapChangeEscalatorTask(u8,u8);				// ｴｽｶﾚｰﾀ移動処理ﾀｽｸｾｯﾄ
EXT void SetMapChangeGayser(u8);						// 間欠泉ﾀｽｸｾｯﾄ
EXT void SetMapChangeHidePitFall(u8);					// 隠し穴ﾀｽｸｾｯﾄ
EXT void SetMapChangeAnanuke(void);						// 穴抜けﾀｽｸｾｯﾄ
EXT void SetMapChangeTeleport(void);					// ﾃﾚﾎﾟｰﾄﾀｽｸｾｯﾄ

EXT void FeGayserActMove(actWork*);						// 間欠泉ｱｸﾀｰ
EXT void FeGymSandActMove(actWork*);					// ｼﾞﾑ砂煙ｱｸﾀｰ

#endif	// ASM_CPP
#undef	EXT
#endif	// FLD_EFF_H

