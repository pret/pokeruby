
#ifndef __CLI_NUM_H__
#define __CLI_NUM_H__


enum
{							//
	//モンスターボール
	CELLID_MonsterBall = 55000,		//ﾓﾝｽﾀｰボール
	CELLID_SuperBall,				//ｽｰﾊﾟｰﾎﾞｰﾙ
	CELLID_SafariBall,				//ｻﾌｧﾘﾎﾞｰﾙ
	CELLID_HyperBall,				//ﾊｲﾊﾟｰﾎﾞｰﾙ
	CELLID_MasterBall,				//ﾏｽﾀｰﾎﾞｰﾙ
	CELLID_NetBall,					//ﾈｯﾄﾎﾞｰﾙ
	CELLID_DiveBall,				//ﾀﾞｲﾌﾞﾎﾞｰﾙ
	CELLID_NestBall,				//ﾈｽﾄﾎﾞｰﾙ
	CELLID_RepeatBall,				//ﾘﾋﾟｰﾄﾎﾞｰﾙ
	CELLID_TimerBall,				//ﾀｲﾏｰﾎﾞｰﾙ
	CELLID_GoujyasuBall,			//ｺﾞｰｼﾞｬｽﾎﾞｰﾙ
	CELLID_PremiaBall,				//ﾌﾟﾚﾐｱﾎﾞｰﾙ

	CELLID_SpeedBall,		//		白ぼんぐり
	CELLID_LvBall,			//		赤ぼんぐり
	CELLID_LureBall,		//青	青ぼんぐり
	CELLID_HebyBall,		//灰	黒ぼんぐり
	CELLID_LoveLoveBall,	//赤	桃ぼんぐり
	CELLID_FriendBall,		//黄	みどぼんぐり
	CELLID_MoonBall,		//灰	きぼんぐり

	//煙(ﾓﾝｽﾀｰﾎﾞｰﾙから出てくるときの)
	CELLID_MBSmoke,

	//光(ﾓﾝｽﾀｰﾎﾞｰﾙから出てくるときの)
	CELLID_MBHikari,
	CELLID_SuperHikari,
	CELLID_SafariHikari,
	CELLID_HyperHikari,
	CELLID_MasterHikari,
	CELLID_NetHikari,
	CELLID_DiveHikari,
	CELLID_NestHikari,
	CELLID_RepeatHikari,
	CELLID_TimerHikari,
	CELLID_GoojyasuHikari,
	CELLID_PremiaHikari,
	
	//自分側のﾄﾚｰﾅｰ
	MINE_TRAINER_PALID,
	MINE_TRAINER_PALID2,
	
//----------------------------------------------------------
//	ﾃｽﾄ用
//----------------------------------------------------------
	CELLID_tesgauge,
	CELLID_bg_gauge1,
	CELLID_bg_gauge2,
	CELLID_bg_gauge3,
	CELLID_bg_gauge4,
//----------------------------------------------------------
//	ゲージ
//----------------------------------------------------------
	CELLID_BattleGaugeMine1,
	CELLID_BattleGaugeMine2,
	CELLID_BattleGaugeEnemy1,
	CELLID_BattleGaugeEnemy2,
	CELLID_BattleGaugeCursor,
	CELLID_BattleGaugeParts0,
	CELLID_BattleGaugeParts1,
	CELLID_BattleGaugeParts2,
	CELLID_BattleGaugeParts3,
	CELLID_BattleGaugeColor,
	CELLID_EffGaugeColor,		//ｴﾌｪｸﾄ用のｶﾗｰ add by matsuda 2002.07.05(金)
	CELLID_EffGaugePartsColor,		//ｴﾌｪｸﾄ用のｶﾗｰ add by matsuda 2002.07.05(金)
	CELLID_BattleGaugeSafari,			//add by soga 2002.06.01
	CELLID_MINE_TEMOTIGAUGE,
	CELLID_ENEMY_TEMOTIGAUGE,
	CELLID_MINE2_TEMOTIGAUGE,
	CELLID_ENEMY2_TEMOTIGAUGE,
	CELLID_MINE_TEMOTIGAUGE_PAL,
	CELLID_ENEMY_TEMOTIGAUGE_PAL,
	CELLID_MINE_TEMOTIBALL_PAL,
	CELLID_ENEMY_TEMOTIBALL_PAL,
	CELLID_MINE_TEMOTIBALL,
	CELLID_ENEMY_TEMOTIBALL,
	
//----------------------------------------------------------
//	パタパタキャラ(ﾎﾟｹﾓﾝﾘｽﾄ)
//----------------------------------------------------------
	CELLID_PataChr1,
	CELLID_PataChr2,
	CELLID_PataChr3,
	CELLID_PataChr4,
	CELLID_PataChr5,
	CELLID_PataChr6,
	CELLID_PataChr7,
	CELLID_PataChr8,
	CELLID_PataChr9,
	CELLID_PataChr10,
	CELLID_PataChr11,
	CELLID_PataChr12,
	CELLID_PataChr13,
	CELLID_PataChr14,
	CELLID_PataChr15,
	CELLID_PataChr16,
	CELLID_PataChr17,
	CELLID_PataChr18,
	CELLID_PataChr19,
	CELLID_PataChr20,
	CELLID_PataChr21,
	CELLID_PataChr22,
	CELLID_PataChr23,
	CELLID_PataChr24,
	CELLID_PataChr25,
	CELLID_PataChr26,
	CELLID_PataChr27,
	CELLID_PataChr28,
	CELLID_PataChr29,
	CELLID_PataChr30,
	CELLID_PataChr31,
	CELLID_PataChr32,
	CELLID_PataChr33,
	CELLID_PataChr34,
	CELLID_PataChr35,
	CELLID_PataChr36,
	CELLID_PataChr37,
	CELLID_PataChr38,

//----------------------------------------------------------
//	新規ﾊﾟﾀﾊﾟﾀｷｬﾗ
//----------------------------------------------------------
//----------------------------------------------------------
//	パタパタキャラ(ﾎﾟｹﾓﾝﾘｽﾄ)
//----------------------------------------------------------
	CELLID_TestPataChr0,
	CELLID_TestPataChr1,
	CELLID_TestPataChr2,
	CELLID_TestPataChr3,
	CELLID_TestPataChr4,
	CELLID_TestPataChr5,
	CELLID_TestPataChr6,
	CELLID_TestPataChr7,
	CELLID_TestPataChr8,
	CELLID_TestPataChr9,
	CELLID_TestPataChr10,
	CELLID_TestPataChr11,
	CELLID_TestPataChr12,

//----------------------------------------------------------
//	ポケモンリスト
//----------------------------------------------------------
	CELLID_PokeListGauge1,	//ｹﾞｰｼﾞ
	CELLID_PokeListGauge2,	//ｹﾞｰｼﾞ
	CELLID_PokeListGauge3,	//ｹﾞｰｼﾞ
	CELLID_PokeListGauge4,	//ｹﾞｰｼﾞ
	CELLID_PokeListGauge5,	//ｹﾞｰｼﾞ
	CELLID_PokeListGauge6,	//ｹﾞｰｼﾞ
	
	CELLID_PokeCursor,		//カーソル
	CELLID_ItemIcon,		//ｱｲﾃﾑｱｲｺﾝ

	CELLID_Pokemonlist0,	// "ポケモンリスト"1
	CELLID_Pokemonlist1,	// "ポケモンリスト"2
	CELLID_Pokemonlist2,	// "ポケモンリスト"3

//----------------------------------------------------------
//	技リスト
//----------------------------------------------------------
	CELLID_CSR8x16,

//----------------------------------------------------------
//	技エフェクト
//----------------------------------------------------------
	CELLID_WAZAPOKE0,
	CELLID_WAZAPOKE1,
	CELLID_WAZAPOKE2,
	CELLID_WAZAPOKE3,

//----------------------------------------------------------
//	ポケモンの影
//----------------------------------------------------------
	CELLID_POKESHADOW,
};


#endif	//__CLI_NUM_H__
