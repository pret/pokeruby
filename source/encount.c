//=========================================================================
//
//
//	フィールドエンカウント
//
//
//=========================================================================

#include "common.h"
#include "field.h"
#include "task.h"
#include "print.h"
#include "poketool.h"
#include "script.h"
#include "fld_main.h"
#include "fld_task.h"
#include "fieldmap.h"
#include "palanm.h"
#include "server.h"
#include "evobj.h"
#include "jiki.h"
#include "fld_tool.h"
#include "mus_tool.h"
#include "mapparam.h"
#include "fight.h"
#include "map_attr.h"
#include "weather.h"
#include "laster.h"
#include "pokescr.h"
#include "record.h"
#include "syswork.h"
#include "ec_eff.h"
#include "ev_fight.h"		//IsGameOverCheck
#include "ev_check.h"

#include "trainer.h"
#include "tr_enum.h"
#include "monsno.def"
#include "safari.h"			//SafariEncountEnd	IsFieldSafariMode
#include "../evdata/maparray.h"
#include "wea_ctrl.h"
#include "trainer.def"

#define	__ENCOUNT_H_GLOBAL__
#include "encount.h"




static void encount_task_set(u8 enc_type, u16 music);
static void EncountFightEnd( void );
static void ScrEncountFightEnd(void);

static void start_normal_encount( void );
static void start_safari_encount( void );

static u8 get_wild_effect( void );
static u8 get_trainer_effect( void );

//=========================================================================
//
//	エンカウント制御タスク
//
//=========================================================================

extern int CheckFieldPoisonEffect( void );

//------------------------------------------
//	エンカウントエフェクト→戦闘へ
//------------------------------------------
static void encount_task( u8 no )
{
	s16 * twk = TaskTable[no].work;

	switch ( twk[0] ) {

	case 0:
		//毒のエフェクトがある場合は終了を待つ
		if ( CheckFieldPoisonEffect() == FALSE ) {
			SetEcEffect( twk[1] );
			twk[0] ++;
		}
		break;

	case 1:
		if ( CheckEcEffect() == TRUE ) {
			MainProcChange( InitFight );
			InitEncountStep();				//エンカウントの歩数制限初期化
			PoisonStepInit();				//毒ダメージ制御の歩数初期化
			DelTask( no );
		}
		break;
	}
}

static void encount_task_set(u8 enc_type, u16 music)
{
	u8 no;
	no = AddTask(encount_task,1);
	TaskTable[no].work[1] = enc_type;
	FightBGMSet2(music);
}

//=========================================================================
//
//	野性ポケモンエンカウントチェック～戦闘開始
//
//=========================================================================

//------------------------------------------
//	通常エンカウント開始
//------------------------------------------
void StartWildEncountEvent( void )
{
	if ( IsFieldSafariMode() ) {
		start_safari_encount();
	} else {
		start_normal_encount();
	}
}

//------------------------------------------
//	野生ポケモンエンカウント開始
//------------------------------------------
static void start_normal_encount( void )
{
	SetForceEvent();
	EvObjPauseAll();
	SetHeroMoveStateInit();
	sys.pReturnProc = EncountFightEnd;
	FightType = FIGHT_TYPE_1vs1;
	encount_task_set(get_wild_effect(), 0);
	IncRecord( CNT_BATTLE );
	IncRecord( CNT_WILD_BATTLE );
}

//------------------------------------------
//	移動ポケモンエンカウント開始
//------------------------------------------
void StartMvPokeEncountEvent( void )
{
	SetForceEvent();
	EvObjPauseAll();
	SetHeroMoveStateInit();
	sys.pReturnProc = EncountFightEnd;
	FightType = FIGHT_TYPE_1vs1 | FIGHT_TYPE_MV_POKE;
	encount_task_set(get_wild_effect(), 0);
	IncRecord( CNT_BATTLE );
	IncRecord( CNT_WILD_BATTLE );
}

//------------------------------------------
//	サファリエンカウント開始
//------------------------------------------
static void start_safari_encount( void )
{
	SetForceEvent();
	EvObjPauseAll();
	SetHeroMoveStateInit();
	sys.pReturnProc = SafariEncountEnd;		//復帰先メインシーケンス
	FightType = FIGHT_TYPE_1vs1 | FIGHT_TYPE_SAFARI;
	encount_task_set(get_wild_effect(), 0);
//	IncRecord( CNT_BATTLE );		サファリはカウントしないよ
//	IncRecord( CNT_WILD_BATTLE );
}

//=========================================================================
//	トレーナーエンカウント開始
//=========================================================================
void StartTrainerEncountEvent( void )
{
	encount_task_set(get_trainer_effect(), 0);
	IncRecord( CNT_BATTLE );
	IncRecord( CNT_TRAINER_BATTLE );
}


//=========================================================================
//	捕獲デモ開始
//	※スクリプトからプログラム呼び出しで起動
//=========================================================================
void StartCaptureDemoEncountEvent( void )
{
	//非レアカラー、性別♂で固定するため専用のポケモンセット関数を呼ぶ
	PokeParaSetDemo( &PokeParaEnemy[0], MONSNO_RARUTOSU, 5 );

	SetForceEvent();
	sys.pReturnProc = FieldScriptRecover;		//復帰先メインシーケンス
	FightType = FIGHT_TYPE_1vs1 | FIGHT_TYPE_GET_DEMO;
	encount_task_set(EC_BGSHIFT, 0);
}

//=========================================================================
//	スクリプトからの野生ポケモン戦呼び出し
//=========================================================================
void StartScriptEncountEvent( void )
{
	SetForceEvent();
	sys.pReturnProc = ScrEncountFightEnd;
	FightType = FIGHT_TYPE_1vs1;
	encount_task_set(get_wild_effect(), 0);
	IncRecord( CNT_BATTLE );
	IncRecord( CNT_WILD_BATTLE );
}

//=========================================================================
//	特別なポケモンとの戦闘呼び出し（ラティアス・ラティオス）
//	※エンカウントＭＳＧが違う
//=========================================================================
void StartKokoroPokeEncountEvent( void )
{
	SetForceEvent();
	sys.pReturnProc = ScrEncountFightEnd;
	FightType = FIGHT_TYPE_1vs1 | FIGHT_TYPE_SPECIAL;
	encount_task_set(get_wild_effect(), 0);
	IncRecord( CNT_BATTLE );
	IncRecord( CNT_WILD_BATTLE );
}

//=========================================================================
//	特別なポケモンとの戦闘呼び出し（タイクーン）
//	※エンカウントＭＳＧ＆ＢＧＭが違う
//	※エンカウントエフェクト指定あり
//=========================================================================
void StartSpPokeEncountEvent( void )
{
	SetForceEvent();
	sys.pReturnProc = ScrEncountFightEnd;
	FightType = FIGHT_TYPE_1vs1 | FIGHT_TYPE_SPECIAL;
	encount_task_set(EC_MOSAIC, MUS_BATTLE34);
	IncRecord( CNT_BATTLE );
	IncRecord( CNT_WILD_BATTLE );
}

//=========================================================================
//	古代ポケモンとの戦闘呼び出し
//	※エンカウントＭＳＧ＆戦闘背景＆ＢＧＭが違う
//	※エンカウントエフェクト指定あり
//=========================================================================
void StartKodaiPokeEncountEvent( void )
{
	SetForceEvent();
	sys.pReturnProc = ScrEncountFightEnd;
	FightType = FIGHT_TYPE_1vs1 | FIGHT_TYPE_HAIKEI_SET | FIGHT_TYPE_SPECIAL;

	if (CasetteVersion == VERSION_RUBY)
		encount_task_set(EC_SCREENCUT, MUS_BATTLE34);
	else
		encount_task_set(EC_SWELL, MUS_BATTLE34);

	IncRecord( CNT_BATTLE );
	IncRecord( CNT_WILD_BATTLE );
}

//=========================================================================
//	点字ポケモンとの戦闘呼び出し
//	※エンカウントＭＳＧ＆ＢＧＭが違う
//	※エンカウントエフェクト指定あり
//=========================================================================
void StartTenjiPokeEncountEvent( void )
{
	SetForceEvent();
	sys.pReturnProc = ScrEncountFightEnd;
	FightType = FIGHT_TYPE_1vs1 | FIGHT_TYPE_TENJI | FIGHT_TYPE_SPECIAL;
	encount_task_set(EC_BLACKCOATING, MUS_BATTLE36);
	IncRecord( CNT_BATTLE );
	IncRecord( CNT_WILD_BATTLE );
}

//=========================================================================
//
//	戦闘後の復帰処理
//
//=========================================================================

//------------------------------------------
//野生エンカウント後の判定処理
//------------------------------------------
static void EncountFightEnd(void)
{
	CpuClear(0,BG_PLTT,16*16*2,16);
	actOAMinit(0,128);

	if ( IsGameOverCheck(WinLoseFlag) == TRUE ) {
		MainProcChange( GameOverRestart);

	}else{
		MainProcChange( FieldMainRecover);
		pFieldRecoverFunc = AddFieldEncountEndFadeInTask;//OBJポーズを解除
	};
}

//------------------------------------------
//	スクリプトでのポケモン対戦判定処理
//------------------------------------------
static void ScrEncountFightEnd(void)
{
	CpuClear(0,BG_PLTT,16*16*2,16);
	actOAMinit(0,128);

	if ( IsGameOverCheck(WinLoseFlag) == TRUE ) {
		MainProcChange( GameOverRestart );

	}else{
		MainProcChange( FieldScriptRecover );
	}
}



//=========================================================================
//	戦闘時の地形タイプを取得する
//
//	<戻り値>	地形タイプ（fight.hで定義)
//=========================================================================

u8 GetFightGroundType( void )
{
	s16 mx, my;
	u16 attr;

	GetHeroCellPos( &mx, &my );
	attr = GetCellAttribute( mx, my );
	if( ATR_ShortGrassCheck(attr) )return GROUND_KUSA;
	if( ATR_LongGrassCheck(attr) )return GROUND_LONGKUSA;
	if( ATR_IsSandCheck(attr) )return GROUND_SUNA;

	switch( NowMap.type ){
	case MAPTYPE_TOWN:			/* 町 */
	case MAPTYPE_CITY:			/* 街 */
	case MAPTYPE_ROAD:			/* 道路 */
		break;

	case MAPTYPE_CAVE:			/* 洞窟 */
		if (ATR_InDoorEncountCheck(attr)) return GROUND_ROOM;
		if (ATR_IsWaterCheck(attr)) return GROUND_IKE;
		return GROUND_DOUKUTSU;

	case MAPTYPE_BASE:			/* 秘密基地 */
		return GROUND_ROOM;

	case MAPTYPE_ROOM:			/* 部屋 */
		return GROUND_ROOM;

	case MAPTYPE_WATER:			/*  水中　*/
		return GROUND_MIZU;

	case MAPTYPE_SEA:			/* 海 */
		if( ATR_IsWaterCheck(attr) ) return GROUND_UMI;
		return GROUND_ALL;

	case MAPTYPE_ICE:			/* 氷 */
		break;
	}

	if (ATR_IsSeaCheck(attr) ) return GROUND_UMI;
	if (ATR_IsWaterCheck(attr) ) return GROUND_IKE;
	if (ATR_IsRockCheck(attr) ) return GROUND_IWA;

	//以下は特殊処理
	if (CheckHeroState(MY_MV_BIT_SWIM)) {
		if (ATR_GetBridgeCode(attr)) return GROUND_IKE;
		if (ATR_BridgeCheck(attr) == TRUE) return GROUND_UMI;
	}
	if (Fld.MapID.div_id == FIELD && Fld.MapID.map_id == FIELD_R113)
		return GROUND_SUNA;

	if (GetFieldWeatherValue() == WEATHER_STORM)
		return GROUND_SUNA;

	return GROUND_ALL;
}




//=========================================================================
//
//		エンカウントエフェクトの種類を決定
//
//=========================================================================
enum{
	ENCPOS_FIELD = 0,
	ENCPOS_DUNGEON,
	ENCPOS_WIPE,
	ENCPOS_WATER,

	ENCLEVEL_LOW	= 0,
	ENCLEVEL_HIGH	= 1,
};

//------------------------------------------
//	野生エンカウント用テーブル
//------------------------------------------
static const u8 wild_encount_table[4][2] =
{
	{		//FIELD
	EC_BGSHIFT,												// BGｼﾌﾄ		9
	EC_WHITELINE,											// ﾎﾜｲﾄﾗｲﾝ		10
	},
	{		//DUNGEON
	EC_LINEWINDOW,											// 時計回り		5
	EC_BLACKCOATING,										// ﾌﾞﾗｯｸｺｰﾃｨﾝｸﾞ	12
	},
	{		//DUNGEON(WIPE)
	EC_MOSAIC,												// ﾓｻﾞｲｸ		11
	EC_BLACKCOATING,										// ﾌﾞﾗｯｸｺｰﾃｨﾝｸﾞ	12
	},
	{		//WATER
	EC_CURTAIN,												// ｶｰﾃﾝ			7
	EC_SWELL,												// 波うねり		6
	},
};

//------------------------------------------
//	トレーナーエンカウント用テーブル
//------------------------------------------
static const u8 trainer_encount_table[4][2] =
{
	{		//FIELD
	EC_SPINBALL,											// 回転ﾎﾞｰﾙ		4
	EC_SCREENCUT,											// 画面切り		13
	},
	{		//DUNGEON
	EC_VSIN,												// Vｻｲﾝｶｰﾌﾞ		2
	EC_BALL,												// ﾓﾝｽﾀｰﾎﾞｰﾙ	3
	},
	{		//DUNGEON(WIPE)
	EC_MOSAIC,												// ﾓｻﾞｲｸ		11
	EC_BLACKCOATING,										// ﾌﾞﾗｯｸｺｰﾃｨﾝｸﾞ	12
	},
	{		//WATER
	EC_HSIN,												// Hｻｲﾝｶｰﾌﾞ		1
	EC_SWELL,												// 波うねり		6
	}
};

//------------------------------------------
//	地形を判別
//------------------------------------------
static u8 get_encount_pos_type( void )
{
	s16 mx, my;
	u16 attr;

	GetHeroCellPos( &mx, &my );
	attr = GetCellAttribute( mx, my );

	if (GetBright() != 0) return ENCPOS_WIPE;

	if( ATR_IsWaterCheck(attr) ) return ENCPOS_WATER;

	switch( NowMap.type ){
	case MAPTYPE_CAVE:			/* 洞窟 */
		return ENCPOS_DUNGEON;

	case MAPTYPE_WATER:			/* 水中 */
		return ENCPOS_WATER;
	}

	return ENCPOS_FIELD;
}

//------------------------------------------
//	プレイヤー手持ちポケモンのレベル取得
//------------------------------------------
static u8 get_player_mons_level( u8 count )
{
	int i;
	u32 ret;
	u8 level;

	level = 0;
	for ( i=0; i<TEMOTI_POKEMAX; i++ ) {
		ret = PokeParaGet(&PokeParaMine[i],ID_monsno_egg);
		if ( ret == MONSNO_TAMAGO || ret == 0 ) continue;
		if ( PokeParaGet(&PokeParaMine[i],ID_hp) == 0 ) continue;
		level += PokeParaGet(&PokeParaMine[i],ID_level);
		count --;
		if ( count == 0 ) break;
	}
	return level;
}

//------------------------------------------
//	トレーナー手持ちポケモンのレベル取得
//------------------------------------------
static u8 get_trainer_mons_level(u16 trainer_id, u8 count)
{
	const TrainerTypeNormalData * TTND;
	const TrainerTypeWazaData * TTWD;
	const TrainerTypeItemData * TTID;
	const TrainerTypeMultiData * TTMD;
	u8 level, i;
	u8 num;

	num = TD[trainer_id].monscount;
	if (num < count)
		count = num;

	level = 0;

	switch (TD[trainer_id].datatype) {
	case DATATYPE_NORMAL:
		TTND = (const TrainerTypeNormalData*)TD[trainer_id].TPD;
		for (i=0; i<count; i++)
			level += TTND[i].level;
		break;

	case DATATYPE_WAZA:
		TTWD = (const TrainerTypeWazaData*)TD[trainer_id].TPD;
		for (i=0; i<count; i++)
			level += TTWD[i].level;
		break;

	case DATATYPE_ITEM:
		TTID = (const TrainerTypeItemData*)TD[trainer_id].TPD;
		for (i=0; i<count; i++)
			level += TTID[i].level;
		break;

	case DATATYPE_MULTI:
		TTMD = (const TrainerTypeMultiData*)TD[trainer_id].TPD;
		for (i=0; i<count; i++)
			level += TTMD[i].level;
		break;
	}

	return level;
}

//------------------------------------------
//野生エンカウントエフェクトの種類を取得
//------------------------------------------
static u8 get_wild_effect( void )
{
	u8 enemy_level,my_level;
	u8 pos;

	pos = get_encount_pos_type();
	enemy_level = PokeParaGet(&PokeParaEnemy[0],ID_level);
	my_level = get_player_mons_level(1);

	if ( enemy_level < my_level ) {
		return wild_encount_table[pos][ENCLEVEL_LOW];
	} else {
		return wild_encount_table[pos][ENCLEVEL_HIGH];
	}
}

//------------------------------------------
//トレーナーエンカウントの種類を取得
//------------------------------------------
static u8 get_trainer_effect( void )
{
	u8 enemy_level,my_level;
	u8 pos,num;

//	if ( GetBright() != 0 ) return EC_MOSAIC;

	/* 特殊なトレーナー関連 */
	if ( FieldTrainerID == ORUSUBAN_TRAINER ) {
		return EC_CUTIN;
	}
	else if ( TD[FieldTrainerID].type == TRTYPE_SITENNOU ) {
		/*　四天王の場合 */
		if (FieldTrainerID == BIG4M_01) return EC_PMLG_KAGETSU;
		if (FieldTrainerID == BIG4W_02) return EC_PMLG_FUYOU;
		if (FieldTrainerID == BIG4W_03) return EC_PMLG_PURIMU;
		if (FieldTrainerID == BIG4M_04) return EC_PMLG_GENJI;
		return EC_CUTIN;
	}
	else if ( TD[FieldTrainerID].type == TRTYPE_TYANPION ) {
		/* チャンピオンの場合 */
		return EC_PMLG_CHAMP;
	}

	if ( TD[FieldTrainerID].fighttype == FIGHT_TYPE_2vs2 ) {
		num = 2;
	} else {
		num = 1;
	}

	pos = get_encount_pos_type();

	enemy_level = get_trainer_mons_level(FieldTrainerID, num);
	my_level = get_player_mons_level(num);

	if ( enemy_level < my_level ) {
		return trainer_encount_table[pos][ENCLEVEL_LOW];
	} else {
		return trainer_encount_table[pos][ENCLEVEL_HIGH];
	}
}

//------------------------------------------
//エンカウントエフェクトタイプ取得
//※バトルタワーなど特殊トレーナー用
//<戻り値>	エフェクト指定（ec_eff.hで定義）
//------------------------------------------
u8 GetSpTrainerEncountEffect(void)
{
	u8 enemy_level, my_level;

	enemy_level = PokeParaGet(&PokeParaEnemy[0], ID_level);
	my_level = get_player_mons_level(1);
	if (enemy_level < my_level) {
		return EC_SPINBALL;
	} else {
		return EC_BALL;
	}
}

//=========================================================================
//
//		最初の戦闘　イベント
//
//=========================================================================

extern u16	FirstPokemonNumGet(u16	index);
extern void OpPokeSelEvInit( void );


static void FirstBattleInit( void );
static void FirstBattleStart( void );
static void FirstBattleEnd( void );

/* 最初の３体のポケモン選択へ遷移 */
void PokeSelEventStart( void )
{
	MainProcChange( OpPokeSelEvInit);
	sys.pReturnProc = FirstBattleInit;
}

/* ポケモン選択後、エンカウントエフェクトへ */
static void FirstBattleInit( void )
{
	u16 * save_work = GetEventWorkAdrs( WK_FIRST_POKE );
	*save_work = AnswerWork;
	TemotiPokeAdd( FirstPokemonNumGet(AnswerWork), 5, 0, NULL, NULL, 0 );
	InitTask();
//	MusicPlay(MUS_SUIKUN);
	FightBGMSet();
	MainProcChange( FirstBattleStart);
//	SetEcEffect( EC_MOSAIC );
	SetEcEffect1stBattle( EC_MOSAIC );
}

/* エンカウント待ち→戦闘へ */
static void FirstBattleStart( void )
{
	PaletteAnime();
	MainTask();
	if ( CheckEcEffect() == TRUE ) {
		FightType = FIGHT_TYPE_1vs1 | FIGHT_TYPE_GUIDE;
		sys.pReturnProc = FirstBattleEnd;			//復帰先メインシーケンス
		MainProcChange(InitFight);					//戦闘シーケンスに遷移！
		InitEncountStep();				//エンカウントの歩数制限初期化
		PoisonStepInit();				//毒ダメージ制御の歩数初期化
		IncRecord( CNT_BATTLE );
		IncRecord( CNT_WILD_BATTLE );
	}
}

/* 戦闘から復帰、スクリプトに制御を戻す */
static void FirstBattleEnd( void )
{
	MapBGM_ClearSpecial();
	MainProcChange( FieldScriptRecover);
}



