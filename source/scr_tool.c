//====================================================================
//
//						スクリプト関連		02/02/27 nohara							
//
//====================================================================
#include "common.h"
#include "intr.h"
#include "script.h"					//ScriptParameter
#include "pokesio.h"				//GetSioConnectID
#include "calctool.h"				//pp_rand
#include "poketool.h"				//PokeNameData
#include "print.h"					//PM_strcpy
#include "jiki.h"					//GetHeroSexObjCode
#include "fieldmap.h"				//NowMap
#include "fld_talk.h"				//FieldMsgStatusCheck
#include "fld_main.h"				//FieldScriptRecover
#include "menu.h"					//menutool.h
#include "task.h"					//AddTask
#include "itemtool.h"				//AddScrCurActor	2002/07/01 by nakahiro
#include "mapbg.h"					//MakeMapBG
#include "mus_tool.h"				//SePlay
#include "server.h"					//WinLoseFlag
#include "fld_tool.h"				//NextMapSetDirect
#include "../evdata/maparray.h"		//接続用マップID定義
#include "sxytype.h"				//NO_EXIT_ID
#include "syswork.h"
#include "sysflag.h"
#include "mapparam.h"
#include "scr_tool.h"				//MSG_1F
#include "..\script\savework.h"		//WK_SCENE_CYCLE_ROAD
#include "zukan.h"					//ZukanTotal
#include "rtctool.h"				//GameTime
#include "..\msgdata\hyouka.h"		//hyouka.mes
#include "tv_def.h"					//TVのdefine群
#include "tv_tool.h"				//GetNumKeta
#include "..\script\saveflag.h"		//隠しアイテム情報取得用
#include "..\sxydata\hideitem.h"	//隠しアイテム情報取得用
#include "fld_task.h"				//AddScriptFieldInTask
#include "ev_win.h"					//AddScriptPasoMenu
#include "palanm.h"					//FadeData
#include "record.h"
#include "../data/warpsym.h"
#include "saveload.h"
#include "cubecase.h"				//GetLikeCubeName
#include "b_tower.h"				//BattleCardENameGet
#include "weather.h"				//CheckWeatherChange
#include "wea_ctrl.h"				//ID_WEATHER_SRTR
#include "fight.h"				
#include "monsno.def"				//MONSNO_ZIGUZAGUMA
#include "wazano.def"				//WAZANO_TAIATARI
#include "pasocom.h"				//BoxSpacePokemonCheck
#include "message.h"
#include "..\sxydata\park_battle01.sym"//WORKERM1_01_PARK_BATTLE01
#include "cm.h"						//CMEventStartChk
#include "pokescr.h"				//PokeAllKaifuku
#include "evobj.def"				//MY_MV_BIT_CYCLE_S


//====================================================================
//
//
//	ゲームクリア→殿堂入り
//
//
//====================================================================
extern void DendouInit( void );
extern u8 GameClearFlag;

u8 ScrGameClear( void )
{
	int i,flag;

	/* ポケモンのステータスを回復 */
	PokeAllKaifuku();

	if (EventFlagCheck(SYS_GAME_CLEAR) == TRUE) {
		//２回目以降、エンディング早送り可能
		GameClearFlag = 1;
	} else {
		//初回、エンディング早送りできない
		GameClearFlag = 0;
		EventFlagSet( SYS_GAME_CLEAR );
	}

	/* 初回クリア時のプレイ時間を記録 */
	if ( GetRecord( SV_TOTAL_TIME ) == 0 ) {
		u32 clear_time;
		clear_time = ((u32)MyData.playtime_h << 16)
			| (MyData.playtime_m << 8 )
			| (MyData.playtime_s );
		SetRecord( SV_TOTAL_TIME, clear_time );
	}

	/* クリア後の出現位置制御 */
	SetContinueStatus();
	if ( MyData.my_sex == MALE ) {
		SetContinueMapByWarpID( WP_BOY_START );
	} else {
		SetContinueMapByWarpID( WP_GIRL_START );
	}

	/* クリアリボンをつける */
	flag = FALSE;
	for (i=0;i<TEMOTI_POKEMAX;i++) {
		PokemonParam * pp = &PokeParaMine[i];
		if ( PokeParaGet(pp,ID_poke_exist_flag) != 0 
				&& PokeParaGet(pp,ID_egg_exist_flag) == 0
				&& PokeParaGet(pp,ID_champ_ribbon) == 0 )
		{
			u8 set_value[1] = {1};
			PokeParaPut(pp, ID_champ_ribbon, set_value );
			flag = TRUE;
		}
	}
	if ( flag == TRUE ) {
		IncRecord( CNT_RIBBON );			//リボンをもらった回数をカウント
		EventFlagSet( SYS_RIBBON_GET );		//リボンをもらったフラグをセット
	}

	MainProcChange( DendouInit );
	return 0;
}


//====================================================================
//
//	ゲームオーバー処理
//
//====================================================================
u8 GameOver( void )
{
	MainProcChange( GameOverRestart );
	return 0;
}


//====================================================================
//
//	マボロシジマの出現チェック
//
//====================================================================
u32 get_maboroshi_value( void )
{
	u16 rnd_h,rnd_l;
	rnd_h = GetEventWorkValue( WK_MABOROSI_RND_H );
	rnd_l = GetEventWorkValue( WK_MABOROSI_RND_L );
	return (rnd_h<<16) | rnd_l;
}

void set_maboroshi_value( u32 value )
{
	SetEventWorkValue( WK_MABOROSI_RND_H, (value>>16)&0xffff );
	SetEventWorkValue( WK_MABOROSI_RND_L, value&0xffff );
}

//-------------------------------------------------------------------------
//	マボロシジマの発生周期初期化
//-------------------------------------------------------------------------
void MaboroshiCycle_Init( void )
{
	u32 value;
	value = (pp_rand() << 16) | pp_rand();
	set_maboroshi_value( value );
}

//-------------------------------------------------------------------------
//	マボロシジマの発生周期更新
//-------------------------------------------------------------------------
void MaboroshiCycle_Update( u16 diff )
{
	u32 value;
	value = get_maboroshi_value();
	while ( diff > 0 ) {
		value = value * 1103515245L + 12345;
		diff --;
	}
	set_maboroshi_value( value );
}

//--------------------------------------------------------------------
//	スクリプトから、マップ遷移時のみ呼ばれる
//	マボロシジマの出現周期カウンタが０で、かつ移動してきたマップが
//	フィールドマップの場合のみTRUEを返す
//--------------------------------------------------------------------
u8 Maboroshi_Check( void )
{
	int i;
	u16 rnd;

	rnd = (get_maboroshi_value() >> 16) & 0xffff;
	for ( i=0; i<TEMOTI_POKEMAX; i++ ) {
		if ( PokeParaGet(&PokeParaMine[i], ID_monsno) != 0
				&& (PokeParaGet(&PokeParaMine[i], ID_personal_rnd) & 0xffff) == rnd ) {
			return TRUE;
		}
	}
	return FALSE;
}


//====================================================================
//
//	浅瀬の洞窟の満ち引き処理
//
//====================================================================
static const u8 asase_table[24] =
{
	1,1,1,			// 00:00 - 02:59 満潮
	0,0,0,0,0,0,	// 03:00 - 08:59 干潮
	1,1,1,1,1,1,	// 09:00 - 14:59 満潮
	0,0,0,0,0,0,	// 15:00 - 20:59 干潮
	1,1,1,			// 21:00 - 23:59 満潮
};

//--------------------------------------------------------------------
//	浅瀬の洞窟の満ち引き変動チェック
//--------------------------------------------------------------------
void AsaseTideCheck( void )
{
	/* フィールドから移動してきた場合のみチェック */
	if ( MTYPE_IsFieldCheck(GetBeforeMapType()) == FALSE ) return;

	GetGameTime();
	if ( asase_table[GameTime.hour] ) {
		EventFlagSet( SYS_ASASE_TIDE );		//満潮
	} else {
		EventFlagReset( SYS_ASASE_TIDE );	//干潮
	}
}


//====================================================================
//
//	天候変化終了待ち
//
//====================================================================
static void weather_change_wait_task( u8 no )
{
	if ( CheckWeatherChange() ) {
		ContinueFieldScript();
		DelTask(no);
	}
}

void ScrWeatherChangeWait( void )
{
	AddTask( weather_change_wait_task, 80 );
}


//====================================================================
//
//						図鑑評価システム
//
//====================================================================
void ZukanHyouka_Init(void);
void ZukanHyouka_Update(u16);

//--------------------------------------------------------------------
//							初期化
//--------------------------------------------------------------------
void ZukanHyouka_Init( void )
{
	u16 * count = GetEventWorkAdrs( WK_HYOUKA_DAYS );
	*count = 0;
}

//--------------------------------------------------------------------
//							周期更新
//--------------------------------------------------------------------
void ZukanHyouka_Update( u16 diff )
{
	u16 * count = GetEventWorkAdrs( WK_HYOUKA_DAYS );
	*count += diff;
	*count %= 7;
}

//--------------------------------------------------------------------
//					見つけた数・捕まえた数取得
//
//	ScriptParameter0にホウエン図鑑(0)か全国図鑑(1)
//	どちらの値を取得するかを入れておく
//
//  ScriptParameter1に見つけた数が代入される
//  ScriptParameter2に捕まえた数が代入される
//
//	戻り値	現在ホウエン図鑑か全国図鑑か？
//--------------------------------------------------------------------
u16 ScrZukanNumGet()
{
	if( ScriptParameter0 == 0 )
	{
		//ホウエン図鑑
		ScriptParameter1 = ZukanHouenTotal( Z_SEE_CHK );
		ScriptParameter2 = ZukanHouenTotal( Z_GET_CHK );
	}else
	{
		//全国図鑑
		ScriptParameter1 = ZukanTotal( Z_SEE_CHK );
		ScriptParameter2 = ZukanTotal( Z_GET_CHK );
	}

	return (u16)ZukanSpecialFlagCheck();
}

//--------------------------------------------------------------------
//					評価メッセージのポインタ取得
//--------------------------------------------------------------------
const u8 * const GetZukanHyoukaMsg( u16 num )
{
	if( num <= 9 )	return msg_odamaki_01_p03_zukan;
	if( num <= 19 )	return msg_odamaki_01_p04_zukan;
	if( num <= 29 )	return msg_odamaki_01_p05_zukan;
	if( num <= 39 )	return msg_odamaki_01_p06_zukan;
	if( num <= 49 )	return msg_odamaki_01_p07_zukan;
	if( num <= 59 )	return msg_odamaki_01_p08_zukan;
	if( num <= 69 )	return msg_odamaki_01_p09_zukan;
	if( num <= 79 )	return msg_odamaki_01_p10_zukan;
	if( num <= 89 )	return msg_odamaki_01_p11_zukan;
	if( num <= 99 )	return msg_odamaki_01_p12_zukan;
	if( num <= 109 )	return msg_odamaki_01_p13_zukan;
	if( num <= 119 )	return msg_odamaki_01_p14_zukan;
	if( num <= 129 )	return msg_odamaki_01_p15_zukan;
	if( num <= 139 )	return msg_odamaki_01_p16_zukan;
	if( num <= 149 )	return msg_odamaki_01_p17_zukan;
	if( num <= 159 )	return msg_odamaki_01_p18_zukan;
	if( num <= 169 )	return msg_odamaki_01_p19_zukan;
	if( num <= 179 )	return msg_odamaki_01_p21_zukan;
	if( num <= 189 )	return msg_odamaki_01_p22_zukan;
	if( num <= 199 )	return msg_odamaki_01_p23_zukan;

	//隠しポケモンが含まれているかのチェック
	if( num == 200 )
	{
		//ポケモンナンバーを全国にする
		if( ZukanCheck( PokeMonsNo2ZukanNoGet(MONSNO_ZIRAATI), Z_GET_CHK ) ||
				ZukanCheck( PokeMonsNo2ZukanNoGet(MONSNO_DEOKISISU), Z_GET_CHK ) )
		{
			//200匹に隠しポケモンが含まれるので完成してない！
			return msg_odamaki_01_p23_zukan;
		}else
		{
			return msg_odamaki_01_p24_zukan;
		}
	}

	//隠しポケモンが含まれているかのチェック
	if( num == 201 )
	{
		//ポケモンナンバーを全国にする
		if( ZukanCheck( PokeMonsNo2ZukanNoGet(MONSNO_ZIRAATI), Z_GET_CHK ) &&
				ZukanCheck( PokeMonsNo2ZukanNoGet(MONSNO_DEOKISISU), Z_GET_CHK ) )
		{
			//残りの一匹が隠しポケモンではないので完成してない！
			return msg_odamaki_01_p23_zukan;
		}else
		{
			return msg_odamaki_01_p24_zukan;
		}
	}

	//隠しポケモンも含め完成している！
	if( num == 202 )	return msg_odamaki_01_p24_zukan;

	//それ以外
	return msg_odamaki_01_p03_zukan;
}

//--------------------------------------------------------------------
//					評価メッセージ表示
//--------------------------------------------------------------------
void SetZukanHyoukaMsg()
{
	FieldMsgSet( GetZukanHyoukaMsg(ScriptParameter0) );
	return;
}

//====================================================================
//				でんどういりの呼び出し処理・復帰処理
//====================================================================
void ScriptDendouRecover();				//dendou.cから呼ばれる
void ScriptDendouRecover2();
extern void	DendouLookInit(void);
static void script_dendou_fade_watch_task(u8);

//呼び出し処理
void ScrDendouLookInit(void)
{
	MainProcChange(DendouLookInit);
	SetForceEvent();
}

//復帰処理
void ScriptDendouRecover()
{
	MainProcChange( FieldMainRecover );
	pFieldRecoverFunc = ScriptDendouRecover2;
	return;
}

void ScriptDendouRecover2()
{
	SetForceEvent();
	MapBGM_Start();

	//FieldFadeControl(FIELD_BLACK_IN, 0);
	PaletteFadeReq( 0xffffffff, 0, 16, 0, 0 );

	//パソコンメニュー表示
	AddScriptPasoMenu();
	PasoMenuWriteInit2();

	AddTask( script_dendou_fade_watch_task, TSK_PRI_CONTROL );
	return;
}

//-------------------------------------------------------------
//	スクリプト動作中への復帰処理(フェード待ち)
//-------------------------------------------------------------
static void script_dendou_fade_watch_task( u8 my_no )
{
	if( FadeData.fade_sw == 0 ){
		DelTask(my_no);
	};
}


//====================================================================
//				表彰状の呼び出し処理・復帰処理
//====================================================================
extern void	HyousyouEvInit(void);

//呼び出し処理
void ScrHyousyouInit(void)
{
	MainProcChange(HyousyouEvInit);
	SetForceEvent();
}


//====================================================================
//				時計画面(時間確認のみ)の呼び出し処理
//====================================================================
extern void	TokeiLookInit(void);

//呼び出し処理
void ScrTokeiLookInit(void)
{
	sys.pReturnProc = FieldMainRecover;
	MainProcChange(TokeiLookInit);
	SetForceEvent();
}


//====================================================================
//
//		サイクリングロードでのミニゲーム
//
//====================================================================
void CyclingRoadEventStart( void );
u8 CyclingRoadGateChk( void );
void CyclingRoadGoal( void );
void CyclingRoadHitTimeSet(u32,u8);

u8 bicycle_collision_flag = 0;
u8 bicycle_collision_count = 0;
u32 bicycle_start_time = 0;

//--------------------------------------------------------------------
//	パラメータ初期化
//
//　隣接マップ移動時・マップ遷移時・コンティニュー時に呼ばれる
//--------------------------------------------------------------------
void CyclingRoadEventInit( void )
{
	bicycle_collision_flag = 0;
	bicycle_collision_count = 0;
	bicycle_start_time = 0;
}

//--------------------------------------------------------------------
//	サイクリングロードイベント計測開始
//--------------------------------------------------------------------
void CyclingRoadEventStart( void )
{
	bicycle_collision_flag = 1;
	bicycle_collision_count = 0;
	bicycle_start_time = sys.main_timer;
}

//--------------------------------------------------------------------
//	ゲートチェック
//
//	戻り値	0 = 自転車に乗っていない
//			1 = アクションタイプに乗っている
//			2 = スピードタイプに乗っている
//--------------------------------------------------------------------
u8 CyclingRoadGateChk( void )
{
	// 自転車S・Rの状態
	if( CheckHeroState(MY_MV_BIT_CYCLE_S) )
	{
		//こっちがアクション
		return 1;
	}else if( CheckHeroState(MY_MV_BIT_CYCLE_R) )
	{
		//こっちがスピード
		return 2;
	}

	return 0;
}

//--------------------------------------------------------------------
//	ゴール
//	StrTempBuffer0	"～かい" or "９９かい　いじょう！"
//	StrTempBuffer1	"～びょう" or "１ぷん　いじょう!"
//	AnswerWork		得点（０～１０）
//--------------------------------------------------------------------
void set_cycling_score( u32 time, u8 hit )
{
	u8 score;

	//衝突回数をセットする
	if ( hit < BICYCLE_COLLISION_MAX ) {
		PM_NumMsgSet( StrTempBuffer0, hit, NUM_MODE_LEFT, 2 );
		PM_strcat( StrTempBuffer0, str_kai );
	} else {
		PM_strcpy( StrTempBuffer0, str_countover );
	}
	
	//タイムをセットする
	if ( time < 60 * 60 ) {
		PM_NumMsgSet( StrTempBuffer1, time/60, NUM_MODE_SPACE, 2 );
		StrTempBuffer1[2] = ten_;
		PM_NumMsgSet( StrTempBuffer1+3, (time%60)*100/60, NUM_MODE_ZERO, 2 );
		PM_strcat( StrTempBuffer1, str_byou );
	} else {
		PM_strcpy( StrTempBuffer1, str_timeover );
	}

	//得点計算
	score = 0;
	if ( hit == 0 ) {
		score += 5;
	} else if ( hit <= 3 ) {
		score += 4;
	} else if ( hit <= 9 ) {
		score += 3;
	} else if ( hit <= 19 ) {
		score += 2;
	} else if ( hit <= 99 ) {
		score += 1;
	}

	if ( time / 60 <= 10 ) {
		score += 5;
	} else if ( time / 60 <= 15 ) {
		score += 4;
	} else if ( time / 60 <= 20 ) {
		score += 3;
	} else if ( time / 60 <= 40 ) {
		score += 2;
	} else if ( time / 60 <= 59 ) {
		score += 1;
	}

	AnswerWork = score;
}


#if 0

// どこか他のファイルで下記の変数を定義する。
// デバッガ上でこれを書き換えるとデバッグが楽～

extern const u32 debug_cycling_time;
extern const u8 debug_cycling_hit;

void DebugCyclingRoadGoal( void )
{
	set_cycling_score( debug_cycling_time, debug_cycling_hit );
	PM_NumMsgSet( StrTempBuffer2, AnswerWork, NUM_MODE_LEFT, 2 );
}

#endif

void CyclingRoadGoal( void )
{
	u32 diff_time;

	diff_time = sys.main_timer - bicycle_start_time;
	set_cycling_score( diff_time, bicycle_collision_count );

	//記録を保存する
	CyclingRoadHitTimeSet( diff_time, bicycle_collision_count );
}

//記録を保存する
void CyclingRoadHitTimeSet( u32 time, u8 hit )
{
	u16 ret,ret2;
	u32 hozon_time;

	ret  = GetEventWorkValue( WK_CYCLE_ROAD_TIME1 );
	ret2 = GetEventWorkValue( WK_CYCLE_ROAD_TIME2 );
	hozon_time = (ret & 0xffff) + ((ret2 & 0xffff) << 16);

	//hozon_time = 0だったら記録なしということになる！
	if( hozon_time > time || hozon_time == 0 )
	{
		SetEventWorkValue( WK_CYCLE_ROAD_TIME1, (time & 0xffff) );
		SetEventWorkValue( WK_CYCLE_ROAD_TIME2, ((time >> 16) & 0xffff) );
		SetEventWorkValue( WK_CYCLE_ROAD_HIT, hit );
	};

	return;
}

//--------------------------------------------------------------------
//				サイクリングロードの記録をセットする
//
//	戻り値	FALSE = 記録なし
//			TRUE  = 記録あり
//--------------------------------------------------------------------
u8 CyclingRoadRecordSet( void )
{
	u16 ret,ret2;
	u32 hozon_time;

	ret  = GetEventWorkValue( WK_CYCLE_ROAD_TIME1 );
	ret2 = GetEventWorkValue( WK_CYCLE_ROAD_TIME2 );
	hozon_time = (ret & 0xffff) + ((ret2 & 0xffff) << 16);

	if( hozon_time == 0 )	return FALSE;		//記録なし

	ret  = GetEventWorkValue( WK_CYCLE_ROAD_HIT );
	set_cycling_score( hozon_time, (u8)ret );

	return TRUE;
}

//--------------------------------------------------------------------
//	前のマップがゲート(上)でなかったらシーンを戻す
//--------------------------------------------------------------------
void CyclingRoadBeforeMapChk( void )
{
	if( BeforeMapID.div_id == R110 &&
			BeforeMapID.map_id == R110_R0301 )	return;

	//サイクリングロード計測中にリセットした時
	if( GetEventWorkValue( WK_SCENE_CYCLE_ROAD ) == 2 || 
			GetEventWorkValue( WK_SCENE_CYCLE_ROAD ) == 3 )
	{
		SetEventWorkValue( WK_SCENE_CYCLE_ROAD, 0 );
		MapBGM_SetSpecial( 0 );		//BGMも自転車ではなくする
	}

	return;
}


//====================================================================
//
//	アクア号船内の歩数カウント関連
//
//====================================================================

//--------------------------------------------------------------------
//	アクア号内の歩数カウント開始
//--------------------------------------------------------------------
void ShipStepCountStart( void )
{
	u16 * count;

	EventFlagSet( SYS_CRUISE_MODE );
	count = GetEventWorkAdrs( WK_CRUISE_COUNT );
	*count = 0;
}

//--------------------------------------------------------------------
//	アクア号内の歩数カウント終了
//--------------------------------------------------------------------
void ShipStepCountEnd( void )
{
	EventFlagReset( SYS_CRUISE_MODE );
}

//--------------------------------------------------------------------
//	アクア号内の歩数カウントアップ
//--------------------------------------------------------------------
int ShipStepCountCheck( u16 value )
{
	u16 * count;

	if ( EventFlagCheck( SYS_CRUISE_MODE ) == FALSE ) return FALSE;

	count = GetEventWorkAdrs( WK_CRUISE_COUNT );
	*count += value;
	if ( *count >= SHIPMOVE_MAX ) return TRUE;

	return FALSE;
}

//--------------------------------------------------------------------
//	高速船の地図上の位置算出
//	<引数>	デモ中の位置を返すためのワーク
//			（戻り値がSHIPPOS_DEMO以外の時には値は入らない）
//			div_id,map_id		マップ指定ID
//			xpos,ypos			座標
//	<戻り値>
//			ヘッダのMAPPOS_～を参照
//--------------------------------------------------------------------
u8 GetShipWorldPos(u8 * div_id, u8 * map_id, s16 * xpos, s16 * ypos )
{
	u16 * count = GetEventWorkAdrs( WK_CRUISE_COUNT );
	u16 * scene = GetEventWorkAdrs( WK_SCENE_SP_SHIP01 );

	switch ( *scene ) {
	case SHIPSCENE_TAKEOFF_KAINA:		//	1	カイナからアクア号乗船直後
	case SHIPSCENE_ARRIVE_KAINA:		//	8	カイナ到着後
		return SHIPPOS_KAINA_STOP;

	case SHIPSCENE_FREE_KAINA:			//	3	デモ終了後、フリー状態
	case SHIPSCENE_END_DEMO_RIGHT:		//	9	デモ終了（カイナ→キナギ）
		return SHIPPOS_R131;

	case SHIPSCENE_ARRIVE_MINAMO:		//	4	ミナモ到着後
	case SHIPSCENE_TAKEOFF_MINAMO:		//	5	ミナモからアクア号乗船直後
		return SHIPPOS_MINAMO_STOP;

	case SHIPSCENE_FREE_MINAMO:			//	6	フリー状態
	case SHIPSCENE_END_DEMO_LEFT:		//	10	デモ終了（キナギ→カイナ）
		return SHIPPOS_R124;

	case SHIPSCENE_DEMO_RIGHT:			//	2	デモ中（カイナ→キナギ）
		if ( *count < SHIPMOVE_R134 ) {
			*map_id = FIELD_R134;
			*xpos = 19 + *count;
		}
		else if ( *count < SHIPMOVE_R134+SHIPMOVE_R133 ) {
			*map_id = FIELD_R133;
			*xpos = *count - SHIPMOVE_R134;
		}
		else {
			*map_id = FIELD_R132;
			*xpos = *count - SHIPMOVE_R134 - SHIPMOVE_R133;
		}
		break;

	case SHIPSCENE_DEMO_LEFT:			//	7	デモ中（キナギ→カイナ）

		if ( *count <= SHIPMOVE_R132 ) {
			*map_id = FIELD_R132;
			*xpos = SHIPMOVE_R132 - *count;
		}
		else if ( *count <= SHIPMOVE_R132+SHIPMOVE_R133 ) {
			*map_id = FIELD_R133;
			*xpos = SHIPMOVE_R132 + SHIPMOVE_R133 - *count;
		}
		else {
			*map_id = FIELD_R134;
			*xpos = 19 + SHIPMOVE_MAX - *count;
		}
		break;
	}

	*div_id = FIELD;
	*ypos = 20;

	return SHIPPOS_DEMO;
}


//====================================================================
//
//						きのみブレンダー
//
//====================================================================
extern SIOTRAINER_INFO SioTrainerInfo[4];
extern u8 * const tempbuf_list[];
u8 SetBlendCommName();
void SetBlendCommOBJ();

//--------------------------------------------------------------------
//				通信をして取得した名前をセットする
//
//	戻り値	通信人数
//--------------------------------------------------------------------
u8 SetBlendCommName()
{
	u8 my_id,i,num,j=0;

	my_id = GetSioReliableId();			//自分のID
	num   = GetSioReliableNumber();	//通信人数

	for( i=0; i < num ;i++ )
	{
		if( my_id != i )
		{
			PM_strcpy( tempbuf_list[j], 
				SioTrainerInfo[i].name );

			j++;	//tempbuf_listの要素数をずらす
		}

	}

	return num;
}

//--------------------------------------------------------------------
//			通信人数分タネブレンダーの周りにOBJを配置する
//--------------------------------------------------------------------
void SetBlendCommOBJ()
{
	u8 i,code,my_id,site,count=0;
	s16 xpos=0,ypos=0;
	u8 site_buf[4] = { MV_UP, MV_LEFT, MV_DOWN, MV_RIGHT };
	s8 hosei[4][2] = {
		{0,1},		
		{1,0},		
		{0,-1},		
		{-1,0},		
	};

	my_id = GetSioReliableId();			//自分のID
	site  = GetHeroSite();


	switch( site )
	{
		case SITE_L:
			count = 2;
			xpos = Fld.MapXpos-1;
			ypos = Fld.MapYpos;
			break;
		case SITE_U:
			count = 1;
			xpos = Fld.MapXpos;
			ypos = Fld.MapYpos-1;
			break;
		case SITE_R:
			count = 0;
			xpos = Fld.MapXpos+1;
			ypos = Fld.MapYpos;
			break;
		case SITE_D:
			count = 3;
			xpos = Fld.MapXpos;
			ypos = Fld.MapYpos+1;
			break;
	}

	for( i=0; i < ScriptParameter0 ;i++ )
	{
		if( my_id != i )
		{
			code = GetHeroSexObjCode( H_NORMAL, SioTrainerInfo[i].sex );
			EvObjMakeSxyAdd( code,site_buf[count],(0xf0-i),
					xpos+hosei[count][0]+7,
					ypos+hosei[count][1]+7,0 );

			count++;
			if( count == 4 ) count = 0;
		}
	}

	return;
}


//====================================================================
//
//							ジムトラップ
//
//====================================================================

//--------------------------------------------------------------------
//			キンセツジムのスイッチのセルコードを変更する
//--------------------------------------------------------------------
#define GYM03_START_X	(7)				//サーチするスタートのＸ座標
#define GYM03_END_X		(16)			//サーチする終了のＸ座標
#define GYM03_START_Y	(12)			//サーチするスタートのＹ座標
#define GYM03_END_Y		(24)			//サーチする終了のＹ座標

#define GYM03_SWITCH_MAX 3				//キンセツジムのスイッチの数
#define SWITCH_OFF_CELL_CODE	517
#define SWITCH_ON_CELL_CODE		518

typedef struct{
		u8	x;
		u8	y;
}Cell_Pos;

//Xずれ	7	Yずれ 7	足している
const Cell_Pos gym03_switch[GYM03_SWITCH_MAX] = {
	{7,16},{15,18},{11,22},
};

void ScrGYM03SwitchChangeCell();
void ScrGYM03SwitchChangeCell()
{
	u8 i;

	for( i=0; i < GYM03_SWITCH_MAX ;i++ )
	{
		if( i == ScriptParameter0 ) //踏んでいる
			SetCell((int)gym03_switch[i].x, (int)gym03_switch[i].y, SWITCH_ON_CELL_CODE);
		else						//踏んでない
			SetCell((int)gym03_switch[i].x, (int)gym03_switch[i].y, SWITCH_OFF_CELL_CODE);
	}

	return;
}

//--------------------------------------------------------------------
//				キンセツジムのドアのセルコードを変更する
//--------------------------------------------------------------------
//open = 空いてる	close = しまっている
//U = 上のセル		D = 下のセル
//L = 左の扉		R = 右の扉

//床のセルコード
#define DOOR_FLOOR_CELL				(538)

//閉まっているドア横(ドア１)
#define	DOOR1_CLOSE_U_L_CELL		(544)
#define	DOOR1_CLOSE_U_R_CELL		(545)
#define	DOOR1_CLOSE_D_L_CELL		(552)
#define	DOOR1_CLOSE_D_R_CELL		(553)

//閉まっているドア横(ドア２)
#define	DOOR2_CLOSE_U_L_CELL		(546)
#define	DOOR2_CLOSE_U_R_CELL		(547)
#define	DOOR2_CLOSE_D_L_CELL		(554)
#define	DOOR2_CLOSE_D_R_CELL		(555)

//開いているドア横(ドア１)
#define	DOOR1_OPEN_U_L_CELL			(560)
#define	DOOR1_OPEN_U_R_CELL			(561)
#define	DOOR1_OPEN_D_L_CELL			(568)
#define	DOOR1_OPEN_D_R_CELL			(569)

//開いているドア横(ドア２)
#define	DOOR2_OPEN_U_L_CELL			(562)
#define	DOOR2_OPEN_U_R_CELL			(563)
#define	DOOR2_OPEN_D_L_CELL			(570)
#define	DOOR2_OPEN_D_R_CELL			(571)

//閉まっているドア縦(ドア３)
#define	DOOR3_CLOSE_U_CELL			(576)
#define	DOOR3_CLOSE_D_CELL			(584)

//閉まっているドア縦(ドア４)
#define	DOOR4_CLOSE_U_CELL			(577)
#define	DOOR4_CLOSE_D_CELL			(585)

//開いているドア縦(ドア３)
#define	DOOR3_OPEN_U_CELL			(578)
#define	DOOR3_OPEN_D_CELL			(DOOR_FLOOR_CELL)

//開いているドア縦(ドア４)
#define	DOOR4_OPEN_U_CELL			(579)
#define	DOOR4_OPEN_D_CELL			(DOOR_FLOOR_CELL)

//電気マシンの上側(当たり判定なし)
#define DOOR5_CELL					(593)

//電気マシンの上側(当たり判定あり)
#define DOOR6_CELL					(592)

void ScrGYM03DoorChangeCell();
void ScrGYM03DoorChangeCell()
{
	int i,j;

	//for( i=0; i < VMap.Ysize ;i++ )
	for( i=GYM03_START_Y; i < GYM03_END_Y ;i++ )
	{
		//for( j=0; j < VMap.Xsize ;j++ )
		for( j=GYM03_START_X; j < GYM03_END_X ;j++ )
		{
			switch( GetCellCode(j,i) )
			{
				//１--------------------------------------------------------------
				//横ドアを開ける
				case DOOR1_CLOSE_U_L_CELL:
					SetCell(j,i,DOOR1_OPEN_U_L_CELL);
					break;
				case DOOR1_CLOSE_U_R_CELL:
					SetCell(j,i,DOOR1_OPEN_U_R_CELL);
					break;
				case DOOR1_CLOSE_D_L_CELL:
					SetCell(j,i,DOOR1_OPEN_D_L_CELL);
					break;
				case DOOR1_CLOSE_D_R_CELL:
					SetCell(j,i,DOOR1_OPEN_D_R_CELL);
					break;

				//横ドアを閉める
				case DOOR1_OPEN_U_L_CELL:
					SetCell(j,i,DOOR1_CLOSE_U_L_CELL);
					break;
				case DOOR1_OPEN_U_R_CELL:
					SetCell(j,i,DOOR1_CLOSE_U_R_CELL);
					break;
				case DOOR1_OPEN_D_L_CELL:
					SetCell(j,i,DOOR1_CLOSE_D_L_CELL | CELL_HITCHECK_MASK);
					break;
				case DOOR1_OPEN_D_R_CELL:
					SetCell(j,i,DOOR1_CLOSE_D_R_CELL | CELL_HITCHECK_MASK);
					break;

				//２--------------------------------------------------------------
				//横ドアを開ける
				case DOOR2_CLOSE_U_L_CELL:
					SetCell(j,i,DOOR2_OPEN_U_L_CELL);
					break;
				case DOOR2_CLOSE_U_R_CELL:
					SetCell(j,i,DOOR2_OPEN_U_R_CELL);
					break;
				case DOOR2_CLOSE_D_L_CELL:
					SetCell(j,i,DOOR2_OPEN_D_L_CELL);
					break;
				case DOOR2_CLOSE_D_R_CELL:
					SetCell(j,i,DOOR2_OPEN_D_R_CELL);
					break;

				//横ドアを閉める
				case DOOR2_OPEN_U_L_CELL:
					SetCell(j,i,DOOR2_CLOSE_U_L_CELL);
					break;
				case DOOR2_OPEN_U_R_CELL:
					SetCell(j,i,DOOR2_CLOSE_U_R_CELL);
					break;
				case DOOR2_OPEN_D_L_CELL:
					SetCell(j,i,DOOR2_CLOSE_D_L_CELL | CELL_HITCHECK_MASK);
					break;
				case DOOR2_OPEN_D_R_CELL:
					SetCell(j,i,DOOR2_CLOSE_D_R_CELL | CELL_HITCHECK_MASK);
					break;

				//３・４----------------------------------------------------------
				//縦ドアを開ける
				case DOOR3_CLOSE_U_CELL:
					SetCell(j,i,DOOR3_OPEN_U_CELL | CELL_HITCHECK_MASK);
					break;
				case DOOR3_CLOSE_D_CELL:
					SetCell(j,i,DOOR3_OPEN_D_CELL);
					break;
				case DOOR4_CLOSE_U_CELL:
					SetCell(j,i,DOOR4_OPEN_U_CELL | CELL_HITCHECK_MASK);
					break;
				case DOOR4_CLOSE_D_CELL:
					SetCell(j,i,DOOR4_OPEN_D_CELL);
					break;

				//縦ドアを閉める
				case DOOR3_OPEN_U_CELL:
					SetCell(j,i,DOOR3_CLOSE_U_CELL | CELL_HITCHECK_MASK);
					break;
				case DOOR3_OPEN_D_CELL:
				//case DOOR4_OPEN_D_CELL:
					//両方同じセルなので
					if( GetCellCode( j, (i-1) ) == DOOR3_CLOSE_U_CELL )
					{
						SetCell(j,i,DOOR3_CLOSE_D_CELL | CELL_HITCHECK_MASK);
					}else
					{
						SetCell(j,i,DOOR4_CLOSE_D_CELL | CELL_HITCHECK_MASK);
					}
					break;
				case DOOR4_OPEN_U_CELL:
					SetCell(j,i,DOOR4_CLOSE_U_CELL | CELL_HITCHECK_MASK);
					break;

				//５・６----------------------------------------------------------
				//電気マシンの上側のセル書き換え
				case DOOR5_CELL:
					SetCell(j,i,DOOR6_CELL | CELL_HITCHECK_MASK);
					break;
				case DOOR6_CELL:
					SetCell(j,i,DOOR5_CELL);
					break;
			}
		}
	}

	return;
}

//--------------------------------------------------------------------
//						ジムリーダー戦後の処理
//						扉をすべて開ける
//						スイッチを全てONにする
//--------------------------------------------------------------------
void ScrGYM03AllChangeCell();
void ScrGYM03AllChangeCell()
{
	int i,j;

	for( i=0; i < GYM03_SWITCH_MAX ;i++ )
		SetCell((int)gym03_switch[i].x, (int)gym03_switch[i].y, SWITCH_ON_CELL_CODE);


	//for( i=0; i < VMap.Ysize ;i++ )
	for( i=GYM03_START_Y; i < GYM03_END_Y ;i++ )
	{
		//for( j=0; j < VMap.Xsize ;j++ )
		for( j=GYM03_START_X; j < GYM03_END_X ;j++ )
		{
			switch( GetCellCode(j,i) )
			{
				//１--------------------------------------------------------------
				//横ドアを開ける
				case DOOR1_CLOSE_U_L_CELL:
					SetCell(j,i,DOOR1_OPEN_U_L_CELL);
					break;
				case DOOR1_CLOSE_U_R_CELL:
					SetCell(j,i,DOOR1_OPEN_U_R_CELL);
					break;
				case DOOR1_CLOSE_D_L_CELL:
					SetCell(j,i,DOOR1_OPEN_D_L_CELL);
					break;
				case DOOR1_CLOSE_D_R_CELL:
					SetCell(j,i,DOOR1_OPEN_D_R_CELL);
					break;

				//２--------------------------------------------------------------
				//横ドアを開ける
				case DOOR2_CLOSE_U_L_CELL:
					SetCell(j,i,DOOR2_OPEN_U_L_CELL);
					break;
				case DOOR2_CLOSE_U_R_CELL:
					SetCell(j,i,DOOR2_OPEN_U_R_CELL);
					break;
				case DOOR2_CLOSE_D_L_CELL:
					SetCell(j,i,DOOR2_OPEN_D_L_CELL);
					break;
				case DOOR2_CLOSE_D_R_CELL:
					SetCell(j,i,DOOR2_OPEN_D_R_CELL);
					break;

				//３・４----------------------------------------------------------
				//縦ドアを開ける
				case DOOR3_CLOSE_U_CELL:
					SetCell(j,i,DOOR3_OPEN_U_CELL | CELL_HITCHECK_MASK);
					break;
				case DOOR3_CLOSE_D_CELL:
					SetCell(j,i,DOOR3_OPEN_D_CELL);
					break;
				case DOOR4_CLOSE_U_CELL:
					SetCell(j,i,DOOR4_OPEN_U_CELL | CELL_HITCHECK_MASK);
					break;
				case DOOR4_CLOSE_D_CELL:
					SetCell(j,i,DOOR4_OPEN_D_CELL);
					break;

				//６----------------------------------------------------------
				//電気マシンの上側のセル書き換え
				case DOOR6_CELL:
					SetCell(j,i,DOOR5_CELL);
					break;
			}
		}
	}

	return;
}


//====================================================================
//
//						トウカジムのドアアニメ
//
//====================================================================
#define GYM05_DOOR_ANIME_MAX	(5)				//アニメの数
#define CELL_CODE_DIFF			(8)				//セルナンバー差分
#define GYM05_DOOR01_CELL		(536)			//初めにアニメするセルナンバー
static const u8 gym05_door_wait[]={0,1,1,1,1};	//ウェイト時間
static const u16 gym05_door_cell_code[GYM05_DOOR_ANIME_MAX]={GYM05_DOOR01_CELL,537,538,539,540};
static u8 gym05_counter = 0;					//カウンター
static u8 gym05_waitno = 0;						//今のウェイトナンバー

void ScrGYM05DoorAnimeWait();
void GYM05DoorAnimeTask(u8);
static void GYM05DoorAnimePosSelect(u8,u16);
void ScrGYM05DoorChangeCell();

//--------------------------------------------------------------------
//						ドアアニメ(ウェイト有り)
//--------------------------------------------------------------------
void ScrGYM05DoorAnimeWait()
{
	gym05_counter = 0;
	gym05_waitno = 0;
	SePlay(SE_KI_GASYAN);
	AddTask( GYM05DoorAnimeTask, 8 );
	return;
}

void GYM05DoorAnimeTask(u8 id)
{
	if( gym05_door_wait[gym05_waitno] == gym05_counter )
	{
		GYM05DoorAnimePosSelect( (u8)ScriptParameter0, gym05_door_cell_code[gym05_waitno] );

		gym05_counter = 0;
		gym05_waitno++;

		if( gym05_waitno == GYM05_DOOR_ANIME_MAX )
		{
			DelTask(id);
			ContinueFieldScript();
		}

	}else
	{
		gym05_counter++;
	}

	return; 
}

//--------------------------------------------------------------------
//							セルを書きかえる
//
//	引数	no		=	どのドアか	
//			code	=	書きかえるセルコード
//
//--------------------------------------------------------------------
static void GYM05DoorAnimePosSelect( u8 no, u16 code )
{
	u8 i,max = 0;
	u16 x[4];
	u16 y[4];

	switch( no )
	{
		case 1:		//だんぺいの部屋
			max = 2;
			x[0] = 1;
			x[1] = 7;
			y[0] = 104;
			y[1] = 104;
			break;
		case 2:		//ELITEM_01(直接)
			max = 2;
			x[0] = 1;
			x[1] = 7;
			y[0] = 78;
			y[1] = 78;
			break;
		case 3:		//ELITEW_01(間接)
			max = 2;
			x[0] = 1;
			x[1] = 7;
			y[0] = 91;
			y[1] = 91;
			break;
		case 4:		//ELITM_02(力)
			max = 1;
			x[0] = 7;
			y[0] = 39;
			break;
		case 5:		//ELITW_02(スピード)
			max = 2;
			x[0] = 1;
			x[1] = 7;
			y[0] = 52;
			y[1] = 52;
			break;
		case 6:		//ELITM_03(ＨＰ)
			max = 1;
			x[0] = 1;
			y[0] = 65;
			break;
		case 7:		//ELITW_03(能力)
			max = 1;
			x[0] = 7;
			y[0] = 13;
			break;
		case 8:		//ELITM_04(技)
			max = 1;
			x[0] = 1;
			y[0] = 26;
			break;
	}

	for( i=0; i < max ;i++ )
	{
		SetCell( x[i]+MAP_X_MARGIN, y[i]+MAP_Y_MARGIN ,
				code | CELL_HITCHECK_MASK );
		SetCell( x[i]+MAP_X_MARGIN, (y[i] + 1)+MAP_Y_MARGIN ,
				(code + CELL_CODE_DIFF) | CELL_HITCHECK_MASK );
	}

	MakeMapBG();
	return;
}

//--------------------------------------------------------------------
//					ゲームロード時・リーダー倒した時に
//					ドアのセルをウェイトなしで書きかえる
//--------------------------------------------------------------------
void ScrGYM05DoorChangeCell()
{
	GYM05DoorAnimePosSelect( (u8)ScriptParameter0, gym05_door_cell_code[GYM05_DOOR_ANIME_MAX-1] );
	return;
}


//====================================================================
//
//							その他
//
//====================================================================
void ScrMsgExpandBufferSet();
void ScrGetMyPos();
u8 ScrGetID();
void ScrSetName01();
u8 ScrGetWinLoseFlag();
u8 GetNatukidoLevel(void);

//--------------------------------------------------------------------
//							スクリプトから
//					_PROGRAM	EXPANDBUF_MSGで呼ぶ
//--------------------------------------------------------------------
void ScrMsgExpandBufferSet()
{
	FieldMsgSet(MsgExpandBuffer);
}


//--------------------------------------------------------------------
//						自機の位置を取得する
//						ScriptParameter0,1使用
//--------------------------------------------------------------------
void ScrGetMyPos()
{
	ScriptParameter0 = (u16)Fld.MapXpos;
	ScriptParameter1 = (u16)Fld.MapYpos;
}


//--------------------------------------------------------------------
//						IDを取得する(今は下一桁)
//--------------------------------------------------------------------
u8 ScrGetID()
{
	u16 id;
	id = (MyData.ID[1] << 8 | MyData.ID[0] );
	return ( id % 10 );  
}


//--------------------------------------------------------------------
//						お姉ちゃん、お兄ちゃんセット
//--------------------------------------------------------------------
void ScrSetName01()
{
	if( MyData.my_sex == MALE )	//男
	{
		PM_strcpy( StrTempBuffer0, str_onityan );
	}else
	{
		PM_strcpy( StrTempBuffer0, str_onetyan );
	}

	return;
}


//--------------------------------------------------------------------
//						むすこ、むすめセット
//--------------------------------------------------------------------
void ScrSetName02()
{
	if( MyData.my_sex == MALE )	//男
	{
		PM_strcpy( StrTempBuffer0, str_musume );
	}else
	{
		PM_strcpy( StrTempBuffer0, str_musuko );
	}

	return;
}


//--------------------------------------------------------------------
//						戦闘状態を取得する
//--------------------------------------------------------------------
u8 ScrGetWinLoseFlag()
{
	return WinLoseFlag;  
}


//--------------------------------------------------------------------
//					ロープウェイの移動先をセットする
//--------------------------------------------------------------------
void ScrSetRopewayMapID( void )
{
	if( ScriptParameter0 )
		NextMapSetDirect( R112, R112_R0101, NO_EXIT_ID, 6, 4 );
	else
		NextMapSetDirect( R112, R112_R0102, NO_EXIT_ID, 6, 4 );

	return;
}


//--------------------------------------------------------------------
// ワークに入っている値をフラグナンバーとして渡してフラグをセットする
//--------------------------------------------------------------------
void ScrWKFlagSet( void );
void ScrWKFlagSet( void )
{
	EventFlagSet(ScriptParameter0);
	return;
}


#define SPACE_CENTER_COUNT_MAX	(9999)		//カウント最大値
//--------------------------------------------------------------------
//				ゲーム初めてから何週間たったかを取得する
//--------------------------------------------------------------------
u16 ScrGetWeekFromGameStart();
u16 ScrGetWeekFromGameStart()
{
	u16 week;
	week = (GameTime.day / 7);
	if( week > SPACE_CENTER_COUNT_MAX )	
		return SPACE_CENTER_COUNT_MAX;
	else 
		return week;
}


//--------------------------------------------------------------------
//						なつき度のレベルを返す
//
//						t106_r0301
//						t107_r0201
//						c102_r0401で使用中
//--------------------------------------------------------------------
u8 GetNatukidoLevel(void)
{
	u8 ret;
	ret = GetTemotiBtlPokeNum();

	if(PokeParaGet(&PokeParaMine[ret], ID_friend ) == 255 ) return 6;
	if(PokeParaGet(&PokeParaMine[ret], ID_friend ) >= 200 ) return 5;
	if(PokeParaGet(&PokeParaMine[ret], ID_friend ) >= 150 ) return 4;
	if(PokeParaGet(&PokeParaMine[ret], ID_friend ) >= 100 ) return 3;
	if(PokeParaGet(&PokeParaMine[ret], ID_friend ) >=  50 ) return 2;
	if(PokeParaGet(&PokeParaMine[ret], ID_friend ) >=   1 ) return 1;
	return 0;
}


//--------------------------------------------------------------------
//						タウンマップ呼び出し
//--------------------------------------------------------------------
extern void InfoMapInit(pFunc);
static void scr_info_map_start( void )
{
	InfoMapInit(FieldScriptRecover);
}
void ScrInfoMapInit(void)
{
	MainProcChange( scr_info_map_start );
//	InfoMapInit(FieldScriptRecover);
}


//====================================================================
//						パソコンのセルアニメ
//
//					ScriptParameter0にタイプを入れる
//
//====================================================================
#define PASO_CELL_CODE01	5		//光っているパソコン(ポケセン)
#define PASO_CELL_CODE02	4		//光っていないパソコン(ポケセン)
#define PASO_CELL_CODE03	639		//光っているパソコン(自宅 男)
#define PASO_CELL_CODE04	602		//光っていないパソコン(自宅 男)
#define PASO_CELL_CODE05	638		//光っているパソコン(自宅 女)
#define PASO_CELL_CODE06	601		//光っていないパソコン(自宅 女)
#define PASO_ANIME_WAIT		6		//アニメウェイト
#define PASO_ANIME_NUM_MAX	5		//アニメする回数(奇数にする)

//taskwork
enum{
	PASO_ANM_SEQ_WK = 0,			//シーケンスナンバー
	PASO_ANM_TASKNO_WK,				//taskno保存
	PASO_ANM_NUM_WK,				//パソコンアニメ回数
	PASO_ANM_WAIT_WK,				//ウェイトカウンター
	PASO_ANM_CELL_WK,				//セルナンバー判別
};

//--------------------------------------------------------------------
//
//--------------------------------------------------------------------
void PasoAnimeTaskAdd();			//パソコンをつける
void PasoAnimeTaskDel();			//パソコンを消す
void PasoAnimeTask(u8);
void PasoAnimeSeq(TASK_TABLE *);
void PasoAnimeSeqDel();
void PasoAnimeCellSet(s16,s8,s8);	//セルをセットする

//--------------------------------------------------------------------
//						パソコンアニメタスク追加
//--------------------------------------------------------------------
void PasoAnimeTaskAdd()
{
	u8 no;

	//すでに登録されているか
	if( CheckTask( PasoAnimeTask ) == TRUE ) return;

	no = AddTask( PasoAnimeTask, 8 );
	TaskTable[no].work[PASO_ANM_SEQ_WK] = 0;		//シーケンスナンバー
	TaskTable[no].work[PASO_ANM_TASKNO_WK] = no;	//taskno保存
	TaskTable[no].work[PASO_ANM_NUM_WK] = 0;		//パソコンアニメ回数
	TaskTable[no].work[PASO_ANM_WAIT_WK] = 0;		//ウェイトカウンター
	TaskTable[no].work[PASO_ANM_CELL_WK] = 0;		//セルナンバー判別
	return;
}

//--------------------------------------------------------------------
//						パソコンアニメタスク
//--------------------------------------------------------------------
void PasoAnimeTask(u8 id)
{
	TASK_TABLE * task_p;

	task_p = &TaskTable[id];
	switch( task_p->work[PASO_ANM_SEQ_WK] )
	{
		case 0:
			PasoAnimeSeq(task_p);
			break;
		case 1:
			break;
	};
}

void PasoAnimeSeq( TASK_TABLE *task_p )
{
	u8 site;
	s8 hosei_x=0,hosei_y=0;

	//ウェイトカウンターチェック
	if( task_p->work[PASO_ANM_WAIT_WK] == PASO_ANIME_WAIT )
	{
		task_p->work[PASO_ANM_WAIT_WK] = 0;		//クリア

		site = GetHeroSite();

		switch( site )
		{
			case SITE_U:
				hosei_x = 0;
				hosei_y = -1;
				break;
			case SITE_L:
				hosei_x = -1;
				hosei_y = -1;
				break;
			case SITE_R:
				hosei_x = 1;
				hosei_y = -1;
				break;
		};

		//パソコンセルセット(ポケセン・自宅男、自宅女)
		PasoAnimeCellSet( task_p->work[PASO_ANM_CELL_WK], hosei_x, hosei_y );
		MakeMapBG();

		//セル判別を変更
		task_p->work[PASO_ANM_CELL_WK]^=1;

		//パソコンアニメ回数
		task_p->work[PASO_ANM_NUM_WK]++;
		if( task_p->work[PASO_ANM_NUM_WK] == PASO_ANIME_NUM_MAX )
			DelTask(task_p->work[PASO_ANM_TASKNO_WK]);
	}

	//ウェイトカウンター
	task_p->work[PASO_ANM_WAIT_WK]++;

	return; 
}

//--------------------------------------------------------------------
//				パソコンセルセット(ポケセン・自宅男、自宅女)
//--------------------------------------------------------------------
void PasoAnimeCellSet(s16 no, s8 x, s8 y)
{
	u16 cell_code = 0;

	//光っている・光っていないセルコードアニメ
	if( no )
	{
		if( ScriptParameter0 == PASO_POKEMON_CENTER )	
		{
			cell_code = PASO_CELL_CODE02;
		}else if( ScriptParameter0 == PASO_MY_HOME_BOY )
		{
			cell_code = PASO_CELL_CODE04;
		}else if( ScriptParameter0 == PASO_MY_HOME_GIRL )
		{
			cell_code = PASO_CELL_CODE06;
		};
	}else
	{
		if( ScriptParameter0 == PASO_POKEMON_CENTER )	
		{
			cell_code = PASO_CELL_CODE01;
		}else if( ScriptParameter0 == PASO_MY_HOME_BOY )
		{
			cell_code = PASO_CELL_CODE03;
		}else if( ScriptParameter0 == PASO_MY_HOME_GIRL )
		{
			cell_code = PASO_CELL_CODE05;
		}
	}

	SetCell( Fld.MapXpos+x+MAP_X_MARGIN, Fld.MapYpos+y+MAP_Y_MARGIN ,
		cell_code | CELL_HITCHECK_MASK );

	return;
}

//--------------------------------------------------------------------
//						パソコンアニメタスク削除
//--------------------------------------------------------------------
void PasoAnimeTaskDel()
{
	PasoAnimeSeqDel();
	return;
}

void PasoAnimeSeqDel()
{
	u8 site;
	s8 hosei_x=0,hosei_y=0;
	u16 cell_code=0;

	site = GetHeroSite();

	switch( site )
	{
		case SITE_U:
			hosei_x = 0;
			hosei_y = -1;
			break;
		case SITE_L:
			hosei_x = -1;
			hosei_y = -1;
			break;
		case SITE_R:
			hosei_x = 1;
			hosei_y = -1;
			break;
	};

	if( ScriptParameter0 == PASO_POKEMON_CENTER )	
	{
		cell_code = PASO_CELL_CODE02;
	}else if( ScriptParameter0 == PASO_MY_HOME_BOY )
	{
		cell_code = PASO_CELL_CODE04;
	}else if( ScriptParameter0 == PASO_MY_HOME_GIRL )
	{
		cell_code = PASO_CELL_CODE06;
	};

	//元のパソコンのセルに戻す
	SetCell( Fld.MapXpos+hosei_x+MAP_X_MARGIN, Fld.MapYpos+hosei_y+MAP_Y_MARGIN ,
		cell_code | CELL_HITCHECK_MASK );

	MakeMapBG();

	return;
}


//====================================================================
//						ポケモンくじのセルアニメ
//====================================================================
#define NOTE_CELL_CODE01_U	600		//光っているノート(上)
#define NOTE_CELL_CODE01_D	608		//					(下)
#define NOTE_CELL_CODE02_U	669		//光っていないノート(上)
#define NOTE_CELL_CODE02_D	677		//					  (下)
#define NOTE_ANIME_WAIT		6		//アニメウェイト
#define NOTE_ANIME_NUM_MAX	5		//アニメする回数(奇数にする)

//--------------------------------------------------------------------
//
//--------------------------------------------------------------------
void NoteAnimeTaskAdd();			//ノートをつける
void NoteAnimeTask(u8);
void NoteAnimeSeq(TASK_TABLE *);
void NoteAnimeSeqDel();

//--------------------------------------------------------------------
//						ノートアニメタスク追加
//--------------------------------------------------------------------
void NoteAnimeTaskAdd()
{
	u8 no;

	//すでに登録されているか
	if( CheckTask( NoteAnimeTask ) == TRUE ) return;

	no = AddTask( NoteAnimeTask, 8 );
	TaskTable[no].work[PASO_ANM_SEQ_WK] = 0;		//シーケンスナンバー
	TaskTable[no].work[PASO_ANM_TASKNO_WK] = no;	//taskno保存
	TaskTable[no].work[PASO_ANM_NUM_WK] = 0;		//ノートアニメ回数
	TaskTable[no].work[PASO_ANM_WAIT_WK] = 0;		//ウェイトカウンター
	TaskTable[no].work[PASO_ANM_CELL_WK] = 0;		//セルナンバー判別
	return;
}

//--------------------------------------------------------------------
//						ノートアニメタスク
//--------------------------------------------------------------------
void NoteAnimeTask(u8 id)
{
	TASK_TABLE * task_p;

	task_p = &TaskTable[id];

	//シーケンスナンバーによって処理を分ける
	if( task_p->work[PASO_ANM_SEQ_WK] == 0 )
		NoteAnimeSeq(task_p);
}

void NoteAnimeSeq( TASK_TABLE *task_p )
{
	//ウェイトカウンターチェック
	if( task_p->work[PASO_ANM_WAIT_WK] == PASO_ANIME_WAIT )
	{
		task_p->work[PASO_ANM_WAIT_WK] = 0;		//クリア

		//光っている・光っていないセルコードアニメ
		if( task_p->work[PASO_ANM_CELL_WK] )
		{
			SetCell( 11+MAP_X_MARGIN, 1+MAP_Y_MARGIN ,
				NOTE_CELL_CODE02_U | CELL_HITCHECK_MASK );
			SetCell( 11+MAP_X_MARGIN, 2+MAP_Y_MARGIN ,
				NOTE_CELL_CODE02_D | CELL_HITCHECK_MASK );
		}else
		{
			SetCell( 11+MAP_X_MARGIN, 1+MAP_Y_MARGIN ,
				NOTE_CELL_CODE01_U | CELL_HITCHECK_MASK );
			SetCell( 11+MAP_X_MARGIN, 2+MAP_Y_MARGIN ,
				NOTE_CELL_CODE01_D | CELL_HITCHECK_MASK );
		}

		MakeMapBG();

		//セル判別を変更
		task_p->work[PASO_ANM_CELL_WK]^=1;

		//ノートアニメ回数
		task_p->work[PASO_ANM_NUM_WK]++;
		if( task_p->work[PASO_ANM_NUM_WK] == PASO_ANIME_NUM_MAX )
			DelTask(task_p->work[PASO_ANM_TASKNO_WK]);
	}

	//ウェイトカウンター
	task_p->work[PASO_ANM_WAIT_WK]++;

	return; 
}

//--------------------------------------------------------------------
//					ノートセルを元の状態に戻す
//--------------------------------------------------------------------
void NoteAnimeSeqDel()
{
	//元のノートのセルに戻す
	SetCell( 11+MAP_X_MARGIN, 1+MAP_Y_MARGIN ,
		NOTE_CELL_CODE02_U | CELL_HITCHECK_MASK );
	SetCell( 11+MAP_X_MARGIN, 2+MAP_Y_MARGIN ,
		NOTE_CELL_CODE02_D | CELL_HITCHECK_MASK );

	MakeMapBG();

	return;
}


//====================================================================
//						エレベーターよびだし
//====================================================================

//====================================================================
//							extern宣言	
//====================================================================
//extern void AddScrArrowAct(u16,u16,u8);		// スクロール矢印アクター表示
//extern void DelScrArrowAct(u8);				// スクロール矢印アクター表示
//extern void MarkActNoInit();				// マークアクター番号初期化
//extern void MarkPalInit(void);				// マークパレット初期化

//====================================================================
//								定義
//====================================================================
#define ELE_WORK_MAX	20		//エレベーターワーク最大数
#define ELEVATOR_MENU_MAX	(5)	//フロア表示最大数

//フロアウィンドウ座標
#define ELEVATOR_MENUWINX	(0)
#define ELEVATOR_MENUWINY	(0)
#define ELEVATOR_MENUWINX2	(ELEVATOR_MENUWINX+8)
#define ELEVATOR_MENUWINY2	(ELEVATOR_MENUWINY+(ELEVATOR_MENU_MAX*2)+1)

//現在のフロアウィンドウ座標
#define GENZAI_MENUWINX	(20)
#define GENZAI_MENUWINY	(0)
#define GENZAI_MENUWINX2	(GENZAI_MENUWINX+9)
#define GENZAI_MENUWINY2	(GENZAI_MENUWINY+5)

//エレベータ出口座標
#define ELEVATOR_XPOS	2
#define ELEVATOR_YPOS	1

//ゆれ幅
#define ELEVATOR_SHAKE_Y		1		//到着時のゆれ
#define ELEVATOR_SHAKE_Y2		1		//開始時のゆれ
#define ELEVATOR_SHAKE_NUM		23//13//3
#define ELEVATOR_SHAKE_NUM2		1//12
#define ELEVATOR_SHAKE_NUM3		3
#define ELEVATOR_SHAKE_WAIT		9		//到着時のゆれウェイト
#define ELEVATOR_SHAKE_WAIT2	3		//開始時のゆれウェイト

//エレベータ構造体
typedef struct{
	u8  floor;					// フロアデータ
	u8	div;
	u8	map;
	u8	exit;					// NO_EXIT_IDで座標で指定しているのでいらない
}ELEVATOR_WORK;

//====================================================================
//								変数
//====================================================================
static ELEVATOR_WORK	ele[ELE_WORK_MAX];
static u8 floor_max = 0;		//フロアの数
static u8 floor_pos = 0;		//現在のカーソル位置
static u8 act_check = 0;		//アクターをすでに出しているか

//====================================================================
//							メッセージデータ	
//====================================================================
static const u8 * const FloorData[] = { 
	msg1F, msg2F, msg3F, msg4F, msg5F, msg6F, msg7F, msg8F, msg9F, msg10F, msg11F, 
	msgB1F, msgB2F, msgB3F, msgB4F, msgTOP };

//====================================================================
//							プロトタイプ宣言
//====================================================================
//FLAG_CHANGE_LABEL
void ElevatorNowFloorSet();				//現在の階層セット

//階層データセット
void ElevatorSet(u8,u8,u8,u8);			//階層セット

//エレベータ処理
void ElevatorStart();					//エレベーター処理スタート
static void ElevatorFloorSet();			//ウィンドウ作成・task追加など
void ElevatorTask(u8);
static void ElevatorDel(u8);			//終了処理
static u8 ElevatorFloorWrite(u8,u8);	//フロアリスト表示
void AddElevatorMoveTask();				//画面揺らし処理追加
void ElevatorMoveTask(u8);				//画面揺らし処理
static void ElevatorCsrSeq(u8,u8);		//カーソル制御
static void AddArrowU();				//上部カーソル
static void AddArrowD();				//下部カーソル
static void DelArrowUD();				//カーソル削除
void ElevatorNowFloorWrite();			//現在のフロア表示

static void TowerAnimeTaskAdd();			//エレベータセルアニメ
void TowerAnimeTask(u8);
void TowerAnimeSeq(TASK_TABLE *);

//--------------------------------------------------------------------
//							現在の階層セット
//
//					FLAG_CHANGE_LABELのタイミングで呼ぶ
//
/*
					ミナモ以外のエレベータ処理ができたら
					ScriptParameter1に代入するcase処理を追加する
*/
//--------------------------------------------------------------------
void ElevatorNowFloorSet()
{
	u16 no;

	switch( Fld.SpMapID.map_id )
	{
		case C106_R1101:
			no = MSG_1F;
			break;
		case C106_R1102:
			no = MSG_2F;
			break;
		case C106_R1103:
			no = MSG_3F;
			break;
		case C106_R1104:
			no = MSG_4F;
			break;
		case C106_R1105:
			no = MSG_5F;
			break;
		case C106_R1106:
			no = MSG_TOP;
			break;

		//追加する
		//case

		default:
			no = MSG_1F;
	};

	SetEventWorkValue( WK_ELEVATOR_NO, no );
	return;
}

//--------------------------------------------------------------------
//							階層セット
//--------------------------------------------------------------------
void ElevatorSet(u8 floor, u8 div, u8 map, u8 exit)
{
	u8 i; 

	//１回目のみ初期化する
	if( ScriptParameter0 == 0 )
	{
		for( i=0; i < ELE_WORK_MAX ;i++ )
		{
			ele[i].floor = MSG_DMY;
		}
	}

	ele[ScriptParameter0].floor = floor;	//フロアデータ
	ele[ScriptParameter0].div	= div;		//divID
	ele[ScriptParameter0].map	= map;		//mapID
	ele[ScriptParameter0].exit = exit;		//exitID
	ScriptParameter0++;						//要素数インクリメント
};

//--------------------------------------------------------------------
//						エレベータースタート
//--------------------------------------------------------------------
void ElevatorStart()
{
	u8 i=0;

	floor_max = 0;
	floor_pos = 0;

	//END入力
	ElevatorSet( MSG_DMY, 0, 0, 0 );

	//フロアの数
	while(1)
	{
		if( ele[i].floor == MSG_DMY )	break;

		floor_max++;
		i++;
	}

	ElevatorFloorSet();
}

//--------------------------------------------------------------------
//						ウィンドウ・taskの追加など							
//--------------------------------------------------------------------
static void ElevatorFloorSet()
{
	u8 i;

	SetForceEvent();

	//ウィンドウ作成
	if( ELEVATOR_MENU_MAX < floor_max )
	{
		NMenuWinBoxWrite( ELEVATOR_MENUWINX, ELEVATOR_MENUWINY, 
				ELEVATOR_MENUWINX2, ELEVATOR_MENUWINY2 );
		NMenuVCursorInit( ELEVATOR_MENUWINX+1, ELEVATOR_MENUWINY+1, ELEVATOR_MENU_MAX, 0);

		//スクロールカーソル表示
		act_check = 0;
		//MarkActNoInit();
//		MarkPalInit();
		ScrActInit();
		AddMarkPal();
		AddArrowD();
	}else
	{
		NMenuWinBoxWrite( ELEVATOR_MENUWINX, ELEVATOR_MENUWINY, 
				ELEVATOR_MENUWINX2, ELEVATOR_MENUWINY+1+(floor_max*2) );
		NMenuVCursorInit( ELEVATOR_MENUWINX+1, ELEVATOR_MENUWINY+1, floor_max, 0);
	}

	//リスト作成
	for( i=0 ; i < ELEVATOR_MENU_MAX ; i++ )
	{
		if( ele[i].floor == MSG_DMY )	break;

		NMenuMsgWrite( FloorData[ ele[i].floor ], 
				ELEVATOR_MENUWINX+2, ELEVATOR_MENUWINY+1+(i*2) );
	}

	//右上に現在のフロア表示
	ElevatorNowFloorWrite();

	AddTask( ElevatorTask, 8 );
}

//--------------------------------------------------------------------
//						右上に現在のフロア表示
//--------------------------------------------------------------------
void ElevatorNowFloorWrite()
{
	NMenuWinBoxWrite( GENZAI_MENUWINX, GENZAI_MENUWINY, 
				GENZAI_MENUWINX2, GENZAI_MENUWINY2 );
	NMenuMsgWrite( msg_genzai, 
				GENZAI_MENUWINX+1, GENZAI_MENUWINY+1 );
	NMenuMsgWrite( FloorData[ ScriptParameter1 ], 
				GENZAI_MENUWINX+3, GENZAI_MENUWINY+3 );

	return;
}

//--------------------------------------------------------------------
//
//					AnswerWork = TRUE = フロアを選択した
//							   = FALSE = キャンセルした
//							
//--------------------------------------------------------------------
void ElevatorTask(u8 id)
{
	u8 csr_pos=0;
	//u8 no;

	if(sys.Trg == U_KEY)
	{
		if( floor_pos != 0 )
		{
			floor_pos--;
			csr_pos = NMenuVCursorPosGet();
			NMenuVCursorSetNoloop(-1);
			ElevatorFloorWrite(csr_pos, U_KEY);
		}
	}

	if(sys.Trg == D_KEY)
	{
		if( floor_pos != (floor_max-1) )
		{
			floor_pos++;
			csr_pos = NMenuVCursorPosGet();
			NMenuVCursorSetNoloop(1);
			ElevatorFloorWrite(csr_pos, D_KEY);
		}
	}
	
	if( sys.Trg & A_BUTTON )
	{
		SetSpecialMapDirect( 0, ele[floor_pos].div, ele[floor_pos].map, 
				//ele[floor_pos].exit, ELEVATOR_XPOS, ELEVATOR_YPOS );
				NO_EXIT_ID, ELEVATOR_XPOS, ELEVATOR_YPOS );

		//選んだフロアが同じか
		if( ScriptParameter1 == floor_pos )
		{
			AnswerWork = FALSE;
			SePlay(SE_SELECT);
			NMenuBoxClear(0,0,29,12);
			ElevatorDel(id);
		}else
		{
			AnswerWork = TRUE;

			//もう一度エレベーターガールに話したときに
			//現在のフロアが更新されるようにする
			ScriptParameter1 = floor_pos;

			//画面揺らすエフェクト
			AddElevatorMoveTask();

			//受け付けの向きを変える
			EvObjChgSiteId(TargetObjID, Fld.MapID.map_id, Fld.MapID.div_id, SITE_D);

			DelArrowUD();
			NMenuScreenClear();
			DelTask(id);
		}

		return;
	}

	if( sys.Trg & B_BUTTON ){
		AnswerWork = FALSE;
		SePlay(SE_SELECT);
		DelArrowUD();
		NMenuBoxClear(0,0,29,12);
		ElevatorDel(id);
	}
}

//--------------------------------------------------------------------
//							フロアリスト表示						
//
//	戻り値	FALSE = 書き換えてない
//			TRUE  = 書き換えた
//--------------------------------------------------------------------
static u8 ElevatorFloorWrite(u8 csr_pos, u8 key)
{
	u8 i,j,sw=FALSE,start=0;

	//リストの数をチェック
	if( floor_max < ELEVATOR_MENU_MAX )	return FALSE;

	//上キースクロール
	if( key == U_KEY )
	{
		if( csr_pos == 0 )
		{
			start = floor_pos;
			sw = TRUE;
		}
	
	//下キースクロール
	}else if( key == D_KEY )
	{
		if( csr_pos == (ELEVATOR_MENU_MAX-1) )
		{
			//floor_posから描画
			start = (floor_pos-csr_pos);
			sw = TRUE;
		}
	}

	//フロアリスト書き換え
	if( sw )
	{
		//カーソル制御
		ElevatorCsrSeq(start,ELEVATOR_MENU_MAX);

		//空白で描画
		NMenuBoxWrite( ELEVATOR_MENUWINX+2, ELEVATOR_MENUWINY+1, 
			ELEVATOR_MENUWINX2-1, ELEVATOR_MENUWINY2-1 );

		for( i=start,j=0 ; j < ELEVATOR_MENU_MAX ; i++,j++ )
		{
			if( ele[i].floor == MSG_DMY )	break;
	
			//リスト描画
			NMenuMsgWrite( FloorData[ ele[i].floor ], 
				ELEVATOR_MENUWINX+2, ELEVATOR_MENUWINY+1+(j*2) );
		}
	}

	return sw;
}

//--------------------------------------------------------------------
//							カーソル制御
//--------------------------------------------------------------------
static void ElevatorCsrSeq(u8 start, u8 max)
{
	//一番始めを表示していたら上部カーソルを削除する
	if( start == 0 )
	{
		act_check ^= 2;
		DelScrCurActor( MARK_ACT_U_CURSOR );
//		DelScrArrowAct(0);
	}

	//一番始めを表示していなかったら上部カーソルを追加する
	if( start > 0 )
	{
		AddArrowU();
	}

	//最後まで表示していなかったら下部カーソルを追加する
	if( (start+max) < floor_max )
	{
		AddArrowD();
		return;

	//最後まで表示していたら下部カーソルを削除する
	}else if( (start+max) == floor_max )
	{
		act_check ^= 1;
		DelScrCurActor( MARK_ACT_D_CURSOR );
//		DelScrArrowAct(1);
		return;
	}

	return;
}

//--------------------------------------------------------------------
//					エレベーター画面揺らし呼び出し
//--------------------------------------------------------------------
void AddElevatorMoveTask()
{
	u8 no;
	no = AddTask( ElevatorMoveTask, 9 );
	TaskTable[no].work[0] = ELEVATOR_SHAKE_Y;	//ゆれ幅(終了)
	TaskTable[no].work[1] = 0;					//ウェイトカウンタ
	TaskTable[no].work[2] = 0;					//
	TaskTable[no].work[3] = 0;					//開始・待ち・終了
	TaskTable[no].work[4] = ELEVATOR_SHAKE_Y2;	//ゆれ幅(開始)
	TaskTable[no].work[5] = ELEVATOR_SHAKE_WAIT2;//ウェイト時間
	SetMapViewFunc( NULL );

	TowerAnimeTaskAdd();		//セルアニメ
	SePlay(SE_ELEBETA);
}

//--------------------------------------------------------------------
//					エレベーター画面揺らし処理
//--------------------------------------------------------------------
void ElevatorMoveTask(u8 id)
{
	TASK_TABLE * task_p;

	task_p = &TaskTable[id];
	
	task_p->work[1]++;

	if( (task_p->work[1] % task_p->work[5]) == 0 )
	{
		task_p->work[1] = 0;
		task_p->work[2]++;

		switch( task_p->work[3] )
		{
			case 0:
				task_p->work[4] = -task_p->work[4];
				SetMapViewOffset( 0, task_p->work[4] );
				if( task_p->work[2] == ELEVATOR_SHAKE_NUM )
				{
					SePlay(SE_PINPON);	
					ElevatorDel(id);
					MapViewInit();
				}
				break;
				break;
		}
	}

	return;
}

//--------------------------------------------------------------------
//							終了処理
//--------------------------------------------------------------------
void ElevatorDel(u8 id)
{
	DelTask(id);
	ContinueFieldScript();
	return;
}

//--------------------------------------------------------------------
//							上部カーソル表示
//--------------------------------------------------------------------
static void AddArrowU()
{
	//すでに表示されている
	if( (act_check >> 1) == 1 )	return;

	act_check |= 2;
	AddScrCurActor( MARK_ACT_U_CURSOR, ELEVATOR_MENUWINX+36, ELEVATOR_MENUWINY+8 );
//	AddScrArrowAct( ELEVATOR_MENUWINX+36, ELEVATOR_MENUWINY+8, 0);
	return;
}

//--------------------------------------------------------------------
//							下部カーソル表示
//--------------------------------------------------------------------
static void AddArrowD()
{
	//すでに表示されている
	if( (act_check & 1) == 1 )	return;

	act_check |= 1;
	AddScrCurActor( MARK_ACT_D_CURSOR, ELEVATOR_MENUWINX+36, ELEVATOR_MENUWINY+(8*9) );
//	AddScrArrowAct( ELEVATOR_MENUWINX+36, ELEVATOR_MENUWINY+(8*9), 1);
	return;
}


//====================================================================
//					バトルタワーエレベータのセルアニメ
//====================================================================
#define TOWER_CELL_CODE01A	616		//
#define TOWER_CELL_CODE01B	619		//					
#define TOWER_CELL_CODE02A	617		//
#define TOWER_CELL_CODE02B	620		//
#define TOWER_CELL_CODE03A	618		//
#define TOWER_CELL_CODE03B	621		//
#define TOWER_CELL_CODE04A	624		//
#define TOWER_CELL_CODE04B	627		//					
#define TOWER_CELL_CODE05A	625		//
#define TOWER_CELL_CODE05B	628		//
#define TOWER_CELL_CODE06A	626		//
#define TOWER_CELL_CODE06B	629		//
#define TOWER_CELL_CODE07A	632		//
#define TOWER_CELL_CODE07B	635		//					
#define TOWER_CELL_CODE08A	633		//
#define TOWER_CELL_CODE08B	636		//
#define TOWER_CELL_CODE09A	634		//
#define TOWER_CELL_CODE09B	637		//
#define TOWER_ANIME_WAIT	8		//アニメウェイト
#define TOWER_ANIME_NUM_MAX	8		//アニメする回数(偶数にする)

//--------------------------------------------------------------------
//
//--------------------------------------------------------------------

//--------------------------------------------------------------------
//						アニメタスク追加
//--------------------------------------------------------------------
static void TowerAnimeTaskAdd()
{
	u8 no;

	//すでに登録されているか
	if( CheckTask( TowerAnimeTask ) == TRUE ) return;

	no = AddTask( TowerAnimeTask, 8 );
	TaskTable[no].work[PASO_ANM_SEQ_WK] = 0;		//シーケンスナンバー
	TaskTable[no].work[PASO_ANM_TASKNO_WK] = no;	//taskno保存
	TaskTable[no].work[PASO_ANM_NUM_WK] = 0;		//ノートアニメ回数
	TaskTable[no].work[PASO_ANM_WAIT_WK] = 0;		//ウェイトカウンター
	TaskTable[no].work[PASO_ANM_CELL_WK] = 0;		//セルナンバー判別
	return;
}

//--------------------------------------------------------------------
//							アニメタスク
//--------------------------------------------------------------------
void TowerAnimeTask(u8 id)
{
	TASK_TABLE * task_p;
	task_p = &TaskTable[id];
	TowerAnimeSeq(task_p);
}

void TowerAnimeSeq( TASK_TABLE *task_p )
{
	//ウェイトカウンターチェック
	if( task_p->work[PASO_ANM_WAIT_WK] == TOWER_ANIME_WAIT )
	{
		task_p->work[PASO_ANM_WAIT_WK] = 0;		//クリア

		if( task_p->work[PASO_ANM_CELL_WK] )
		{
			SetCell( 0+MAP_X_MARGIN, 0+MAP_Y_MARGIN ,TOWER_CELL_CODE01A | CELL_HITCHECK_MASK );
			SetCell( 1+MAP_X_MARGIN, 0+MAP_Y_MARGIN ,TOWER_CELL_CODE02A | CELL_HITCHECK_MASK );
			SetCell( 2+MAP_X_MARGIN, 0+MAP_Y_MARGIN ,TOWER_CELL_CODE02A | CELL_HITCHECK_MASK );
			SetCell( 3+MAP_X_MARGIN, 0+MAP_Y_MARGIN ,TOWER_CELL_CODE03A | CELL_HITCHECK_MASK );
			SetCell( 0+MAP_X_MARGIN, 1+MAP_Y_MARGIN ,TOWER_CELL_CODE04A | CELL_HITCHECK_MASK );
			SetCell( 1+MAP_X_MARGIN, 1+MAP_Y_MARGIN ,TOWER_CELL_CODE05A | CELL_HITCHECK_MASK );
			SetCell( 2+MAP_X_MARGIN, 1+MAP_Y_MARGIN ,TOWER_CELL_CODE05A | CELL_HITCHECK_MASK );
			SetCell( 3+MAP_X_MARGIN, 1+MAP_Y_MARGIN ,TOWER_CELL_CODE06A | CELL_HITCHECK_MASK );
			SetCell( 0+MAP_X_MARGIN, 2+MAP_Y_MARGIN ,TOWER_CELL_CODE07A | CELL_HITCHECK_MASK );
			SetCell( 1+MAP_X_MARGIN, 2+MAP_Y_MARGIN ,TOWER_CELL_CODE08A | CELL_HITCHECK_MASK );
			SetCell( 2+MAP_X_MARGIN, 2+MAP_Y_MARGIN ,TOWER_CELL_CODE08A | CELL_HITCHECK_MASK );
			SetCell( 3+MAP_X_MARGIN, 2+MAP_Y_MARGIN ,TOWER_CELL_CODE09A | CELL_HITCHECK_MASK );
		}else
		{
			SetCell( 0+MAP_X_MARGIN, 0+MAP_Y_MARGIN ,TOWER_CELL_CODE01B | CELL_HITCHECK_MASK );
			SetCell( 1+MAP_X_MARGIN, 0+MAP_Y_MARGIN ,TOWER_CELL_CODE02B | CELL_HITCHECK_MASK );
			SetCell( 2+MAP_X_MARGIN, 0+MAP_Y_MARGIN ,TOWER_CELL_CODE02B | CELL_HITCHECK_MASK );
			SetCell( 3+MAP_X_MARGIN, 0+MAP_Y_MARGIN ,TOWER_CELL_CODE03B | CELL_HITCHECK_MASK );
			SetCell( 0+MAP_X_MARGIN, 1+MAP_Y_MARGIN ,TOWER_CELL_CODE04B | CELL_HITCHECK_MASK );
			SetCell( 1+MAP_X_MARGIN, 1+MAP_Y_MARGIN ,TOWER_CELL_CODE05B | CELL_HITCHECK_MASK );
			SetCell( 2+MAP_X_MARGIN, 1+MAP_Y_MARGIN ,TOWER_CELL_CODE05B | CELL_HITCHECK_MASK );
			SetCell( 3+MAP_X_MARGIN, 1+MAP_Y_MARGIN ,TOWER_CELL_CODE06B | CELL_HITCHECK_MASK );
			SetCell( 0+MAP_X_MARGIN, 2+MAP_Y_MARGIN ,TOWER_CELL_CODE07B | CELL_HITCHECK_MASK );
			SetCell( 1+MAP_X_MARGIN, 2+MAP_Y_MARGIN ,TOWER_CELL_CODE08B | CELL_HITCHECK_MASK );
			SetCell( 2+MAP_X_MARGIN, 2+MAP_Y_MARGIN ,TOWER_CELL_CODE08B | CELL_HITCHECK_MASK );
			SetCell( 3+MAP_X_MARGIN, 2+MAP_Y_MARGIN ,TOWER_CELL_CODE09B | CELL_HITCHECK_MASK );
		}

		MakeMapBG();

		//セル判別を変更
		task_p->work[PASO_ANM_CELL_WK]^=1;

		//アニメ回数
		task_p->work[PASO_ANM_NUM_WK]++;
		if( task_p->work[PASO_ANM_NUM_WK] == TOWER_ANIME_NUM_MAX )
			DelTask(task_p->work[PASO_ANM_TASKNO_WK]);
	}

	//ウェイトカウンター
	task_p->work[PASO_ANM_WAIT_WK]++;

	return; 
}


//--------------------------------------------------------------------
//							カーソル削除
//--------------------------------------------------------------------
static void DelArrowUD()
{
	if( (act_check & 1) == 1 )
//		DelScrArrowAct(1);
		DelScrCurActor( MARK_ACT_D_CURSOR );
	if( (act_check >> 1) == 1 )
//		DelScrArrowAct(0);
		DelScrCurActor( MARK_ACT_U_CURSOR );
	DelMarkPal();
	return;
}

//--------------------------------------------------------------------
//						隠しアイテム強制フラグオン(取った状態？)
//--------------------------------------------------------------------
//とりあえず、カラクリ大王用
void KarakuriHideItemOff(void)
{
	ScriptParameter0 = 0xffff & ( (u32)kinnotama_1 >> 16 );
	ScriptParameter0 += FH_FLAG_START;
	EventFlagSet(ScriptParameter0);
	return;
}

//--------------------------------------------------------------------
//						隠しアイテム強制フラグオフ(取る前の状態？)
//--------------------------------------------------------------------
//とりあえず、カラクリ大王用
void KarakuriHideItemOn(void)
{
	ScriptParameter0 = 0xffff & ( (u32)kinnotama_1 >> 16 );
	ScriptParameter0 += FH_FLAG_START;
	EventFlagReset(ScriptParameter0);
	return;
}

//--------------------------------------------------------------------
//					だいすきクラブ用かっこよさチェック
//--------------------------------------------------------------------
//0:～199,1:200～
u8 DaisukiClubStyleCheck(void)
{
	if(PokeParaGet(&PokeParaMine[GetTemotiBtlPokeNum()], ID_style ) < 200 ) return 0;
	return 1;
}

//--------------------------------------------------------------------
//					だいすきクラブ用うつくしさチェック
//--------------------------------------------------------------------
//0:～199,1:200～
u8 DaisukiClubBeautifulCheck(void)
{
	if(PokeParaGet(&PokeParaMine[GetTemotiBtlPokeNum()], ID_beautiful ) < 200 ) return 0;
	return 1;
}

//--------------------------------------------------------------------
//					だいすきクラブ用かわいさチェック
//--------------------------------------------------------------------
//0:～199,1:200～
u8 DaisukiClubCuteCheck(void)
{
	if(PokeParaGet(&PokeParaMine[GetTemotiBtlPokeNum()], ID_cute ) < 200 ) return 0;
	return 1;
}

//--------------------------------------------------------------------
//					だいすきクラブ用かしこさチェック
//--------------------------------------------------------------------
//0:～199,1:200～
u8 DaisukiClubCleverCheck(void)
{
	if(PokeParaGet(&PokeParaMine[GetTemotiBtlPokeNum()], ID_clever ) < 200 ) return 0;
	return 1;
}

//--------------------------------------------------------------------
//					だいすきクラブ用たくましさチェック
//--------------------------------------------------------------------
//0:～199,1:200～
u8 DaisukiClubStrongCheck(void)
{
	if(PokeParaGet(&PokeParaMine[GetTemotiBtlPokeNum()], ID_clever ) < 200 ) return 0;
	return 1;
}

//--------------------------------------------------------------------
//					手持ちにくさタイプがいるかチェック(タマゴは無視）
//					AnswerWork = TRUE  :　いる
//					AnswerWork = FALSE :　いない
//--------------------------------------------------------------------
void TypeKusaAllCheck(void)
{
	u8	i;
	u16 no;
	PokemonParam *pp;

	for (i=0;i<TEMOTI_POKEMAX;i++) {
		pp = &PokeParaMine[i];
		if (( PokeParaGet(pp,ID_poke_exist_flag) != 0 )&&( PokeParaGet( pp, ID_tamago_flag ) == 0 )){
			no = PokeParaGet( pp, ID_monsno );
			if( PPD[no].type1 == KUSA_TYPE || PPD[no].type2 == KUSA_TYPE ) {
				AnswerWork = TRUE;
				return;
			}
		}
	}
	AnswerWork = FALSE;
}




//--------------------------------------------------------------------
//							火山灰メニュー
//--------------------------------------------------------------------
#define KAZANBAI_MENU_MAX	5		//表示する数
#define KAZANBAI_MENU_MAX2	8		//メニューの数

//フロアウィンドウ座標
#define KAZANBAI_MENUWINX	(0)
#define KAZANBAI_MENUWINY	(0)
#define KAZANBAI_MENUWINX2	(KAZANBAI_MENUWINX+10)
#define KAZANBAI_MENUWINY2	(KAZANBAI_MENUWINY+(KAZANBAI_MENU_MAX*2)+1)

static const u8 * const KazanbaiMenuData[] = { 
	msg_aoibi, msg_kiirobi, msg_akaibi, msg_shiroibi, 
	msg_kuroibi, msg_kireinaisu, msg_kireinatukue, str_yameru }; 

void AddKazanbaiMenuTask();
void KazanbaiMenuTask(u8);
static u8 KazanbaiMenuWrite(u8,u8);
static void KazanbaiCsrSeq(u8,u8);
static void AddKazanbaiArrowU();
static void AddKazanbaiArrowD();


void AddKazanbaiMenuTask()
{
	u8 i;

	SetForceEvent();

	//ウィンドウ作成
	NMenuWinBoxWrite( KAZANBAI_MENUWINX, KAZANBAI_MENUWINY, 
			KAZANBAI_MENUWINX2, KAZANBAI_MENUWINY2 );
	NMenuVCursorInit( KAZANBAI_MENUWINX+1, KAZANBAI_MENUWINY+1, KAZANBAI_MENU_MAX, 0);

	//スクロールカーソル表示
	act_check = 0;
	//MarkActNoInit();
	//MarkPalInit();
	ScrActInit();
	AddMarkPal();
	AddKazanbaiArrowD();

	//リスト作成
	for( i=0 ; i < KAZANBAI_MENU_MAX ; i++ )
	{
		NMenuMsgWrite( KazanbaiMenuData[i], 
				KAZANBAI_MENUWINX+2, KAZANBAI_MENUWINY+1+(i*2) );
	}

	floor_pos = 0;
	floor_max = KAZANBAI_MENU_MAX2;

	AddTask( KazanbaiMenuTask, 8 );
}

//--------------------------------------------------------------------
//
//					AnswerWork = 選んだ要素数 = 決定した 
//							   = 127		  = キャンセルした
//							
//--------------------------------------------------------------------
void KazanbaiMenuTask(u8 id)
{
	u8 csr_pos=0;

	if(sys.Trg == U_KEY)
	{
		if( floor_pos != 0 )
		{
			floor_pos--;
			csr_pos = NMenuVCursorPosGet();
			NMenuVCursorSetNoloop(-1);
			KazanbaiMenuWrite(csr_pos, U_KEY);
		}
	}

	if(sys.Trg == D_KEY)
	{
		if( floor_pos != (floor_max-1) )
		{
			floor_pos++;
			csr_pos = NMenuVCursorPosGet();
			NMenuVCursorSetNoloop(1);
			KazanbaiMenuWrite(csr_pos, D_KEY);
		}
	}
	
	if( sys.Trg & A_BUTTON )
	{
		AnswerWork = floor_pos;
		SePlay(SE_SELECT);
		DelArrowUD();
		NMenuBoxClear(0,0,29,12);
		ElevatorDel(id);
	}

	if( sys.Trg & B_BUTTON ){
		AnswerWork = 127;
		SePlay(SE_SELECT);
		DelArrowUD();
		NMenuBoxClear(0,0,29,12);
		ElevatorDel(id);
	}
}

//--------------------------------------------------------------------
//							フロアリスト表示						
//
//	戻り値	FALSE = 書き換えてない
//			TRUE  = 書き換えた
//--------------------------------------------------------------------
static u8 KazanbaiMenuWrite(u8 csr_pos, u8 key)
{
	u8 i,j,sw=FALSE,start=0;

	//リストの数をチェック
	if( floor_max < KAZANBAI_MENU_MAX )	return FALSE;

	//上キースクロール
	if( key == U_KEY )
	{
		if( csr_pos == 0 )
		{
			start = floor_pos;
			sw = TRUE;
		}
	
	//下キースクロール
	}else if( key == D_KEY )
	{
		if( csr_pos == (KAZANBAI_MENU_MAX-1) )
		{
			//floor_posから描画
			start = (floor_pos-csr_pos);
			sw = TRUE;
		}
	}

	//フロアリスト書き換え
	if( sw )
	{
		//カーソル制御
		KazanbaiCsrSeq(start,KAZANBAI_MENU_MAX);

		//空白で描画
		NMenuBoxWrite( KAZANBAI_MENUWINX+2, KAZANBAI_MENUWINY+1, 
			KAZANBAI_MENUWINX2-1, KAZANBAI_MENUWINY2-1 );

		for( i=start,j=0 ; j < KAZANBAI_MENU_MAX ; i++,j++ )
		{
			//リスト描画
			NMenuMsgWrite( KazanbaiMenuData[i], 
				KAZANBAI_MENUWINX+2, KAZANBAI_MENUWINY+1+(j*2) );
		}
	}

	return sw;
}
//--------------------------------------------------------------------
//							上部カーソル表示(とりあえず)
//--------------------------------------------------------------------
static void AddKazanbaiArrowU()
{
	//すでに表示されている
	if( (act_check >> 1) == 1 )	return;

	act_check |= 2;
	AddScrCurActor( MARK_ACT_U_CURSOR, ELEVATOR_MENUWINX+44, ELEVATOR_MENUWINY+8 );
	return;
}

//--------------------------------------------------------------------
//							下部カーソル表示(とりあえず)
//--------------------------------------------------------------------
static void AddKazanbaiArrowD()
{
	//すでに表示されている
	if( (act_check & 1) == 1 )	return;

	act_check |= 1;
	AddScrCurActor( MARK_ACT_D_CURSOR, ELEVATOR_MENUWINX+44, ELEVATOR_MENUWINY+(8*11) );
	return;
}

//--------------------------------------------------------------------
//							カーソル制御
//--------------------------------------------------------------------
static void KazanbaiCsrSeq(u8 start, u8 max)
{
	//一番始めを表示していたら上部カーソルを削除する
	if( start == 0 )
	{
		act_check ^= 2;
		DelScrCurActor( MARK_ACT_U_CURSOR );
//		DelScrArrowAct(0);
	}

	//一番始めを表示していなかったら上部カーソルを追加する
	if( start > 0 )
	{
		AddKazanbaiArrowU();
	}

	//最後まで表示していなかったら下部カーソルを追加する
	if( (start+max) < floor_max )
	{
		AddKazanbaiArrowD();
		return;

	//最後まで表示していたら下部カーソルを削除する
	}else if( (start+max) == floor_max )
	{
		act_check ^= 1;
		DelScrCurActor( MARK_ACT_D_CURSOR );
//		DelScrArrowAct(1);
		return;
	}

	return;
}


//====================================================================
//						マップスクロール
//====================================================================
void ScrMapScroolSet()
{
	u8 no;

	no = EvObjMakeSxyAdd( BOY1, MV_DOWN, DMY_OBJ_ID,
					Fld.MapXpos+MAP_X_MARGIN,Fld.MapYpos+MAP_Y_MARGIN,3 );

	EvObjNoBanishOn( no );		//バニッシュオン
	FldScrollActChg( EvObjActNo(no) );		//スクロールアクター変更
	return;
}

void ScrMapScroolReset()
{
	FldScrollActChg( GetHeroActorNumber() );		//スクロールアクター変更
	EvObjDelId( (u8)DMY_OBJ_ID, (u8)Fld.MapID.map_id, (u8)Fld.MapID.div_id );
	return;
}	


//====================================================================
//	ポケモンの性格によって好みのポロックがあることを教えてくれる
//====================================================================
u8 ScrGetLikeCube()
{
	u8 ans,seikaku;
	seikaku = PokeSeikakuGet( &PokeParaMine[GetTemotiBtlPokeNum()] );
	ans = GetLikeCubeName( seikaku, StrTempBuffer0 );
	return ans;
}


extern u8* CopyMapName(u8 *buf, u16 div, u16 size);			//wmap.c
//====================================================================
//				自分の秘密基地があるマップ名取得
//====================================================================
void ScrGetMyBaseMapNo()
{
	CopyMapName( StrTempBuffer0, GetEventWorkValue(WK_BASE_MAPNO), 0);
	return;
}


//====================================================================
//					バトルタワーの連勝数取得
//====================================================================
u16 BattleTowerRenshouGet();
u16 BattleTowerRenshouGet()
{
	return (u16)GetRecord(CNT_TOWER_RENSHOU);
}

//====================================================================
//					カードeトレーナー名前取得
//====================================================================
void ScrBattleCardENameGet();
void ScrBattleCardENameGet()
{
	BattleCardENameGet( StrTempBuffer0 );
	return;
}

#define SLOT_TABLE_MAX	(12)
static const u8 slot_table_num[SLOT_TABLE_MAX] =	{ 12,2,4,5,1,8,7,11,3,10,9,6 };
static const u8 slot_atari_table[SLOT_TABLE_MAX] =	{ 0,1,1,2,2,2,3,3,3,4,4,5 };//通常用
static const u8 slot_atari_table2[SLOT_TABLE_MAX] =	{ 3,3,3,3,3,3,4,4,4,4,5,5 };//カジノデー用
//====================================================================
//						スロットの当たり台取得
//
//					ScriptParameter0に台の値を代入
//====================================================================
u16 ScrSlotAtariGet();
u16 ScrSlotAtariGet()
{
	u32 ret = 0;
	ret = Fld.PopWord[0].now_power + Fld.PopWord[0].random + slot_table_num[ScriptParameter0];

	//カジノデーが開催しているか
	if( CMEventStartChk( CM_CASINO_TYPE ) )
	{
		//カジノデー
		return (u16)slot_atari_table2[ret % SLOT_TABLE_MAX];
	}else
	{
		//通常
		return (u16)slot_atari_table[ret % SLOT_TABLE_MAX];
	}
}

//====================================================================
//					座礁船の１号室のカギ取得チェック
//
//====================================================================
u8	Key1Check(void)
{
	ScriptParameter0 = 0xffff & ( (u32)sp1gousitunokagi_31 >> 16 );
	ScriptParameter0 += FH_FLAG_START;
	if ( EventFlagCheck(ScriptParameter0) == FALSE ) return FALSE;

	return TRUE;
}

//====================================================================
//					座礁船の２号室のカギ取得チェック
//
//====================================================================
u8	Key2Check(void)
{
	ScriptParameter0 = 0xffff & ( (u32)sp2gousitunokagi_32 >> 16 );
	ScriptParameter0 += FH_FLAG_START;
	if ( EventFlagCheck(ScriptParameter0) == FALSE ) return FALSE;


	return TRUE;
}

//====================================================================
//					座礁船の４号室のカギ取得チェック
//
//====================================================================
u8	Key4Check(void)
{
	ScriptParameter0 = 0xffff & ( (u32)sp4gousitunokagi_33 >> 16 );
	ScriptParameter0 += FH_FLAG_START;
	if ( EventFlagCheck(ScriptParameter0) == FALSE ) return FALSE;

	return TRUE;
}

//====================================================================
//					座礁船の６号室のカギ取得チェック
//
//====================================================================
u8	Key6Check(void)
{
	ScriptParameter0 = 0xffff & ( (u32)sp6gousitunokagi_34 >> 16 );
	ScriptParameter0 += FH_FLAG_START;
	if ( EventFlagCheck(ScriptParameter0) == FALSE ) return FALSE;

	return TRUE;
}

//====================================================================
//							がんばリボン関連
//====================================================================
u8	ChkGanbaRibbon(void);
void SetGanbaRibbon(void);
u8 ChkGanbaRibbonParaExp(void);

//--------------------------------------------------------------------
//				手持ちの先頭のポケモンが「がんばリボン」を
//					もっているかのチェック
//--------------------------------------------------------------------
u8 ChkGanbaRibbon(void)
{
	return PokeParaGet( &PokeParaMine[GetTemotiBtlPokeNum()], ID_ganba_ribbon, 0 );
}

//--------------------------------------------------------------------
//			手持ちの先頭のポケモンに「がんばリボン」をつける
//--------------------------------------------------------------------
void SetGanbaRibbon(void)
{
	u8 ribbon;

	//記録カウントアップ
	IncRecord( CNT_RIBBON );

	//リボン貰った
	EventFlagSet( SYS_RIBBON_GET );
	
	ribbon = 1;
	PokeParaPut( &PokeParaMine[GetTemotiBtlPokeNum()], ID_ganba_ribbon, &ribbon );
	return;
}

//--------------------------------------------------------------------
//				手持ちの先頭のポケモンの努力値の合計を取得して
//				マックスかをチェックする
//
//	戻り値	TRUE  = MAX
//			FALSE = MAXではない
//--------------------------------------------------------------------
u8 ChkGanbaRibbonParaExp(void)
{
	u16 ret;
	ret = ParaExpTotalGet( &PokeParaMine[GetTemotiBtlPokeNum()] );

	if( ret >= PARA_EXP_TOTAL_MAX )	return TRUE;
	else return FALSE;
}

//--------------------------------------------------------------------
//			カナシダトンネルで岩砕きを使用しているかチェック
//
// 	WK_SCENE_CAVE_D0201 = 4 = 下側の岩砕いた
//	WK_SCENE_CAVE_D0201 = 5 = 上側の岩砕いた
//
//	戻り値	TRUE  = 発生
//			FALSE = 発生しない
//--------------------------------------------------------------------
u8 ChkKanasidaIwa(void);
u8 ChkKanasidaIwa(void)
{
	//すでにカナシダトンネル開通していたら
	if( EventFlagCheck( FE_KANASIDA_GO ) ) return FALSE;

	if( Fld.MapID.div_id == CAVE && Fld.MapID.map_id == CAVE_D0201 )
	{
		if( EventFlagCheck( FV_IWA_01_CAVE_D0201 ) )
		{
			SetEventWorkValue( WK_SCENE_CAVE_D0201,4 );
			return TRUE;
		}

		if( EventFlagCheck( FV_IWA_02_CAVE_D0201 ) ) 
		{
			SetEventWorkValue( WK_SCENE_CAVE_D0201,5 );
			return TRUE;
		}
	}
	
	return FALSE;
}


//====================================================================
//
//							浅瀬の洞窟
//
//====================================================================
void Asase_Update(u16);

//--------------------------------------------------------------------
//							周期更新
//
//		一日以上経過していたらアイテムを入手できるようにする
//--------------------------------------------------------------------
void Asase_Update( u16 diff )
{
	//一日以上経過した！
	EventFlagSet( SYS_ASASE_ITEM );
	return;
}


//--------------------------------------------------------------------
//		父がミツルに貸すポケモン情報を手持ちの先頭にセットする	
//		呼び出す前に手持ちポケモンを退避させておく
//--------------------------------------------------------------------
void ScrMitsuruPokeSet()
{
	u16 ans;

	PokeParaSet(&PokeParaMine[0], MONSNO_ZIGUZAGUMA, 7, 
			POW_RND,RND_NO_SET, 0, ID_NO_SET, 0);

	ans = 1;
	PokeParaPut( &PokeParaMine[0], ID_speabi, (u8 *)&ans );

	ans = WAZANO_TAIATARI;
	PokeParaPut( &PokeParaMine[0], ID_waza1,  (u8 *)&ans );
	ans = 0;
	PokeParaPut( &PokeParaMine[0], ID_waza2,  (u8 *)&ans );
	PokeParaPut( &PokeParaMine[0], ID_waza3,  (u8 *)&ans );
	PokeParaPut( &PokeParaMine[0], ID_waza4,  (u8 *)&ans );

	return;
}

//--------------------------------------------------------------------
//		初めて手に入れたポケモンが手持ちにいるかチェック
//
//	戻り値	TRUE  = いる
//			FALSE = いない
//--------------------------------------------------------------------
extern u16	FirstPokemonNumGet(u16	index);
u16 ScrFirstPokeNumChk();
u16 ScrFirstPokeNumChk()
{
	u8 i,count;
	u16 ret = 0;
	ret = FirstPokemonNumGet( GetEventWorkValue( WK_FIRST_POKE ) );
	count = PokeCountMineGet();

	for( i=0; i < count ;i++ )
	{
		if( PokeParaGet( &PokeParaMine[i], ID_monsno_egg, 0 ) == ret )
			return TRUE;
	}

	return FALSE;
}



//--------------------------------------------------------------------
//		ボックスに空きがあるか
//
//	戻り値	TRUE  = ある
//			FALSE = ない
//--------------------------------------------------------------------
u8	BoxSpacePokemonCheck(void)
{
	u16 i,j;

	for(i=0;i<BOX_KAZU;i++){
		for(j=0;j<BOX_PM_KAZU;j++){
			if(PokePasoParaGet(&BoxData.PPPBox[i][j],ID_monsno,0)==0){
				return TRUE;
			}
		}
	}
	return FALSE;
}

//--------------------------------------------------------------------
//手持ちのポケモンの中にポケルスに感染しているポケモンがいるかのチェック
//
//	戻り値	TRUE  = いる
//			FALSE = ない
//--------------------------------------------------------------------
u8	ScrTemotiPokerusCheck(void)
{
	//00111111 = 0x3f = ６体分チェック
	if( PokerusCheck( &PokeParaMine[0], 0x3f ) == 0 )	return FALSE;
	else	return TRUE;
}


//====================================================================
//							画面揺らし
//====================================================================
void AddKodaiMoveTask();
void KodaiMoveTask(u8 id);
void KodaiDel(u8 id);

#define KODAI_SHAKE_NUM 8				//揺らす回数
#define KODAI_SHAKE_WAIT 5				//揺らす間隔
//--------------------------------------------------------------------
//							呼び出し
//--------------------------------------------------------------------
void AddKodaiMoveTask()
{
	u8 no;
	no = AddTask( KodaiMoveTask, 9 );
	TaskTable[no].work[0] = ScriptParameter1;	//ゆれ幅Y
	TaskTable[no].work[1] = 0;					//ウェイトカウンタ
	TaskTable[no].work[2] = 0;					//
	TaskTable[no].work[3] = 0;					//開始・待ち・終了
	TaskTable[no].work[4] = ScriptParameter0;	//ゆれ幅X
	TaskTable[no].work[5] = KODAI_SHAKE_WAIT;	//揺らす間隔
	SetMapViewFunc( NULL );
	SePlay(SE_W070);
}

//--------------------------------------------------------------------
//							揺らし処理
//--------------------------------------------------------------------
void KodaiMoveTask(u8 id)
{
	TASK_TABLE * task_p;

	task_p = &TaskTable[id];
	
	task_p->work[1]++;

	if( (task_p->work[1] % task_p->work[5]) == 0 )
	{
		task_p->work[1] = 0;
		task_p->work[2]++;

		switch( task_p->work[3] )
		{
			case 0:
				task_p->work[0] = -task_p->work[0];
				task_p->work[4] = -task_p->work[4];
				SetMapViewOffset( task_p->work[0], task_p->work[4] );
				if( task_p->work[2] == KODAI_SHAKE_NUM )
				{
					KodaiDel(id);
					MapViewInit();
				}
				break;
		}
	}

	return;
}

//--------------------------------------------------------------------
//							終了処理
//--------------------------------------------------------------------
void KodaiDel(u8 id)
{
	DelTask(id);
	ContinueFieldScript();
	return;
}

//--------------------------------------------------------------------
//					隠しの「くろいメガネ」入手しているか	
//--------------------------------------------------------------------
#define HIDE_KUROIMEGANE_NO		96		//FH_FLAG_STARTのオフセット
u16 ChkHideKuroiMegane();
u16 ChkHideKuroiMegane()
{
	return EventFlagCheck( FH_FLAG_START + HIDE_KUROIMEGANE_NO );
}

//--------------------------------------------------------------------
//						ロード１１９の天候操作
//--------------------------------------------------------------------
void SetWeatherR119();
void SetWeatherR119()
{
	/* フィールドから移動してきた場合は何もしない */
	if ( MTYPE_IsFieldCheck(GetBeforeMapType()) == TRUE ) return;

	//日数変化天候コードセット
	SetFieldWeatherValue( ID_WEATHER_SRTR );
	return;
}

//--------------------------------------------------------------------
//						ロード１２３の天候操作
//--------------------------------------------------------------------
void SetWeatherR123();
void SetWeatherR123()
{
	/* フィールドから移動してきた場合は何もしない */
	if ( MTYPE_IsFieldCheck(GetBeforeMapType()) == TRUE ) return;

	//日数変化天候コードセット
	SetFieldWeatherValue( ID_WEATHER_SSRS );
	return;
}


//--------------------------------------------------------------------
//				手持ちの先頭からタマゴではない場所を返す
//--------------------------------------------------------------------
u8 GetTemotiBtlPokeNum();
u8 GetTemotiBtlPokeNum()
{
	u8 i,count;
	count = PokeCountMineGet();

	for( i=0; i < count ;i++ )
	{
		if( PokeParaGet( &PokeParaMine[i], ID_monsno_egg, 0 ) != MONSNO_TAMAGO &&
				PokeParaGet( &PokeParaMine[i], ID_monsno_egg, 0 ) != 0 )
			return i;
	}

	return 0;
}


//--------------------------------------------------------------------
//			リストから選んだナンバーのポケモンナンバーを返す
//--------------------------------------------------------------------
u16 GetListNoPokeNo();
u16 GetListNoPokeNo()
{
	return PokeParaGet( &PokeParaMine[ScriptParameter0], ID_monsno_egg, 0 );
}


//--------------------------------------------------------------------
//					バトルタワーのオーナー追加処理
//--------------------------------------------------------------------
void AddTowerOwner();
void AddTowerOwner()
{
	EvObjWorkAdd( WORKERM1_01_PARK_BATTLE01 );
	return;
}


//--------------------------------------------------------------------
//		アイテムを入手してから１週間以上たったかを取得する
//
//	戻り値	0	  = 一週間以上たっている
//			1 - 6 = 後何日で一週間たつか
//--------------------------------------------------------------------
u16 ScrGetOneWeekFromWazaGet();
u16 ScrGetOneWeekFromWazaGet()
{
	u16 ret;
	ret = GetEventWorkValue( WK_SCENE_T107_R0201 );

	//一週間以上たっているか
	if( (GameTime.day - ret) >= 7 )
	{
		return 0;
	}

	//マイナスの値が出たとき
	if( GameTime.day < 0 )
	{
		//絶対にありえない数
		return 8;
	}

	//後何日かを返す
	return ( 7 - (GameTime.day - ret) );
}

//--------------------------------------------------------------------
//				アイテムを入手した日にちをセットする
//--------------------------------------------------------------------
u16 ScrSetWazaGetGameDays();
u16 ScrSetWazaGetGameDays()
{
	SetEventWorkValue( WK_SCENE_T107_R0201, GameTime.day );
	return GameTime.day;
}

//--------------------------------------------------------------------
//							親名比較
//							
//	戻り値	0=親が同じ
//			1=親が違う
//--------------------------------------------------------------------
u8 ScrOyaNameCmp(u8);
u8 ScrOyaNameCmp(u8 no)
{
	//StrTempBuffer0に格納する
	PokeParaGet( &PokeParaMine[ScriptParameter0], ID_oyaname, StrTempBuffer0 );

	if( PM_strcmp( (u8 *)&MyData.my_name[0], StrTempBuffer0 ) == 0 )
	{
		return 0;
	}

	return 1;
}

//--------------------------------------------------------------------
//					当たりナンバーの文字列取得
//--------------------------------------------------------------------
void ScrPokeLotNumGet();
void ScrPokeLotNumGet()
{
	if( AnswerWork >= 10000 )
	{
		//99999-10000
		SetNumSelectBuf( 0, (int)AnswerWork );
	}else if( AnswerWork >= 1000 )
	{
		//9999-1000
		StrTempBuffer0[0] = n0_;
		PM_NumMsgSet( &StrTempBuffer0[1], (int)AnswerWork, 
				NUM_MODE_LEFT, GetNumKeta((int)AnswerWork) );
	}else if( AnswerWork >= 100 )
	{
		//999-100
		StrTempBuffer0[0] = n0_;
		StrTempBuffer0[1] = n0_;
		PM_NumMsgSet( &StrTempBuffer0[2], (int)AnswerWork, 
				NUM_MODE_LEFT, GetNumKeta((int)AnswerWork) );
	}else if( AnswerWork >= 10 )
	{
		//99-10
		StrTempBuffer0[0] = n0_;
		StrTempBuffer0[1] = n0_;
		StrTempBuffer0[2] = n0_;
		PM_NumMsgSet( &StrTempBuffer0[3], (int)AnswerWork, 
				NUM_MODE_LEFT, GetNumKeta((int)AnswerWork) );
	}else
	{
		//9-0
		StrTempBuffer0[0] = n0_;
		StrTempBuffer0[1] = n0_;
		StrTempBuffer0[2] = n0_;
		StrTempBuffer0[3] = n0_;
		PM_NumMsgSet( &StrTempBuffer0[4], (int)AnswerWork, 
				NUM_MODE_LEFT, GetNumKeta((int)AnswerWork) );
	}

	return;
}


