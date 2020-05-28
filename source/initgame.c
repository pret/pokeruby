//=========================================================================
//
//
//	ゲームスタート設定
//
//
//=========================================================================


#include "common.h"
#include "print.h"
#include "item.h"
#include "fld_tool.h"
#include "calctool.h"
#include "playtime.h"
#include "poketool.h"
#include "ev_flag.h"
#include "seed.h"
#include "zukan.h"
#include "script.h"
#include "sysflag.h"
#include "score.h"			//InitTaisenScore
#include "goods.h"			// 2002/06/21 by nakahiro
#include "my_pc.h"			// 2002/06/28 by nakahiro
#include "mv_poke.h"		// 2002/06/28 by nakahiro
#include "pokelot.h"		// 2002/07/04  taya
#include "pokescr.h"
#include "sxytype.h"
#include "../evdata/maparray.h"
#include "monsno.def"
#include "scr_tool.h"
#include "ev_time.h"
#include "cubecase.h"
#include "svld_ini.h"
#include "svld_sys.h"
#include "rtctool.h"

#define	__INITGAME_H_GLOBAL__
#include "initgame.h"

//-----------------------------------------------------------------
//-----------------------------------------------------------------





extern const VM_CODE ev_flag_on[];
extern const VM_CODE ev_flag_game_over_set[];	//
extern const VM_CODE ev_hagi_fune_reset[];		//ハギの船の位置を直す

extern void GetPocketItem(void);	//デバッグ用にアイテムを持たせる
extern void SetDummyCube(void);		// 手持ちにダミーキューブを加える 02/02/26 by nakahiro
extern void InitPocketItem(void);	// バッグの初期化
extern void BagCountInit(void);		// バッグのカウンタ初期化
extern void InitBoxData(void);      // ボックスデータ初期化  2001/10/04 taya
extern void InitKaiwaData(void);    // ボックスダミーポケモンデータセット 2001/11/29 taya

extern void TVDataAllInit(void);	// ＴＶデータの初期化
extern void TVCameraAllInit(void);	// インタビュアー＆カメラマンの初期化
extern void InitAllBase(void);			// 秘密基地データの初期化

extern void DebugMenuFlagSet(void);	//デバッグ用メニューフラグセット

extern void ContestDataInit(void);	//コンテストデータ初期化 by matsuda 2001.10.26(金)

extern void RecordInit(void);		//ゲーム内記録カウンタ初期化

extern void OyajiInit(void);		// おやじデータ初期化  taya 2001/12/18
extern void PopWord_Init(void);		// 流行語初期化

extern u16 NowWordGetUnknown(void);	//

extern u8 TemotiPokeAdd(u16 monsno, u8 lv, u16, u8 *, u8 *, u8);
extern void InitPortraitData(void);	//似顔絵ﾃﾞｰﾀ初期化

extern void TaneOyajiInit(void);	// タネ交換おやじ初期化
extern void FanAllInit(void);		// ファン企画初期化

u8	FirstSaveFlag = 0;			//最初からゲームをはじめたかどうかのフラグ

//#ifdef	PM_DEBUG
u8	DebugMainFlag = 0;	
//#endif

#ifdef	FESTA_VER_ROM
u8	FestaModeFlag = 0;
#endif

//=========================================================================
//	データ初期化サブルーチン
//=========================================================================

//-----------------------------------------------------------------
//	ID(32ビット長）をセットする
//	<引数>
//		id_value	IDナンバー(u32の値)
//		set_pos		格納場所のアドレス(u8の配列)
//-----------------------------------------------------------------
void ID_Set( u32 id_value, u8 * set_pos )
{
	set_pos[0] = id_value & 0xff;
	set_pos[1] = (id_value >> 8 ) & 0xff;
	set_pos[2] = (id_value >> 16 ) & 0xff;
	set_pos[3] = (id_value >> 24 ) & 0xff;
}

//-----------------------------------------------------------------
//	ID(u8×4）をコピーする
//	<引数>		to		コピー先アドレス
//				from	コピー元アドレス
//-----------------------------------------------------------------
void ID_Copy( u8 * to, u8 * from )
{
	int i;
	for ( i=0;i<4;i++ ) {
		to[i] = from[i];
	}
}

//-----------------------------------------------------------------
//-----------------------------------------------------------------
static void id_init( void )
{

	u32 id;
	id = ( pp_rand() << 16 ) | pp_rand();
	ID_Set( id, MyData.ID );
}

static void config_init( void )
{
	MyData.msg_speed = 1;	
	MyData.window_type = 0;
	MyData.sound_mode = 0;
	MyData.btl_type = 0;
	MyData.btl_eff_sw = 0;
	MyData.tnavi_zoom = 0;
}

static void zukan_init( void )
{
	ZukanDebugFlag = 0;
	memset( (MyData.Zukan.zukan_get_flag), 0x00, POKE_ZUKAN_LEN );
	memset( (MyData.Zukan.zukan_see_flag), 0x00, POKE_ZUKAN_LEN );
}


static const PORTRAIT_DATA portrait_dmy = {
	0,			//u32 personal_rnd;		//個性乱数
	0,			//u32 idno;				//ポケモンＩＤ
	0,			//u16 monsno;				//ポケモンナンバー
	0,			//u8	pict_type;			//絵の種類
	{EOM_,},	//u8	nickname[11];		//ポケモンの名前
	{EOM_,},	//u8	oyaname[11];		//親の名前
};

static void portrait_init( void )
{
	int i;

	InitPortraitData();
	for ( i=8; i<PORTRAIT_MAX; i++ ) {
		Fld.PortraitData[i] = portrait_dmy;
	}
}

static void BattleTowerWorkInit( void )
{
	CpuClear( 0, &(MyData.BattleTowerWork), sizeof(BATTLE_TOWER_WORK), 32 );
}

#ifdef	PM_DEBUG
//-------------------------------------------------------------
// マップ切替機構（debug用）
//-------------------------------------------------------------
static const s8 DebugMap[][2] = 
{
	{ SP,			SP_TRUCK	},
	{ T102,			T102_PC02	},
	{ FIELD,		FIELD_T101	},
	{ T101,			T101_R0102	},
};

void DebugSetNextMap(void)
{
	u8 no;
	for ( no=0; no<NELEMS(DebugMap); no++ ) {
		if ( DebugMap[no][0] == Fld.MapID.div_id 
				&& DebugMap[no][1] == Fld.MapID.map_id ) break;
	}
	no++;
	if ( no >= NELEMS(DebugMap) ) no = 0;
	NextMapSetDirect( DebugMap[no][0], DebugMap[no][1], NO_EXIT_ID, -1, -1 );
}
#endif

//-------------------------------------------------------------
//	ゲーム開始時のマップ設定
//-------------------------------------------------------------
void InitStartMap(void)
{
	NextMapSetDirect(SP, SP_TRUCK, NO_EXIT_ID, -1, -1);
	SetNextWorldPosition();
}

//=========================================================================
//
//	プレイヤーシステムセーブデータエリアのクリア
//
//=========================================================================
void SysSaveDataInit( void )
{
	CpuClear( 0x00, &MyData, sizeof(MyData), 16 );
	config_init();
}

//=========================================================================
//
//	ゲーム進行用ワークエリアの初期化
//	※セーブされないワークの初期化
//
//=========================================================================
void InitGameWork( void )
{
	FirstSaveFlag = 0;			//最初からゲームをはじめたかどうかのフラグ

#ifdef	PM_DEBUG
	DebugMainFlag = 0;			//デバッグモードOFF(Default)
#endif

#ifdef	FESTA_VER_ROM
	FestaModeFlag = 0;			//フェスタモードOFF
#endif	

	ZukanWorkInit();
	PokeParaMineInit();			//add soga 2001.07.27
	PokeParaEnemyInit();		//add soga 2001.07.27

	BagCountInit();				// 2002/09/06 by nakahiro
}


//=========================================================================
//
//	通常ゲーム開始データを設定
//
//=========================================================================

void InitGame( void )
{

	//セーブデータが存在せず、ゲームを開始した場合はＲＴＣをクリアする
	if (SaveDataCheckInfo == SVLD_RET_NULL ||
			SaveDataCheckInfo == SVLD_RET_DESTROY) {
		RTC_Reset();
	}
//	非セーブワークのクリア

	FirstSaveFlag = 1;			//最初からゲームをはじめたかどうかのフラグ

	PokeParaMineInit();	
	PokeParaEnemyInit();

//	MyDataのクリア
	ZukanFirstInit();
	BattleTowerWorkInit();

//	Fldのクリア
	memset( (void *)&Fld, 0x00, sizeof(Fld) );
	MailWorkInit();

	/* プレイヤーシステムデータ　*/

	MyData.save_flag = 0;
	id_init();							//ＩＤ初期化
	PlayTimeInit();
//	config_init();						//コンフィグ項目初期化
	zukan_init();						//ずかんフラグ初期化

	/* ゲーム進行データ */
	EventDataInit();					//ゲーム進行フラグ
	TVDataAllInit();					//TVイベント
	TVCameraAllInit();					//インタビュアー＆カメラマン
	InitAllBase();						//秘密基地
	SeedBedInit();						//タネ
	Fld.my_gold = 3000;					//お金
	ContestDataInit();					//コンテスト
	RecordInit();						//ゲーム内記録カウント
	portrait_init();
	InitTaisenScore();					//対戦成績クリア
	KinokokoSizeOyajiRecordInit();				//おおきさオヤジ記録初期化
	NamazoSizeOyajiRecordInit();				//おおきさオヤジ記録初期化
	
	/* ポケモンデータ */
	PokeCountMine = 0;					//手持ちポケモンなし
	PokeParaMineInit();					//手持ちポケモンクリア
	InitBoxData();						//ポケモン預かりボックスクリア

	MvPokeDataInit();					// 移動ポケモンデータクリア
	MvPokeMoveDataInit();

	/* どうぐデータ */
	Fld.cnv_btn = 0;					//便利ボタン登録クリア
	InitPocketItem();					//バッグをクリア
	MyPC_DefItemSet();					//自宅PCにアイテムをセット

	/* ポロックデータ */
	AllCubeParamInit();     // 手持ちポロックデータクリア

	/* グッズデータ */
	GoodsAllInit();						// 手持ちグッズクリア

	/* 簡易会話データ 2001/11/29 Taya */
	InitKaiwaData();

	/* おやじデータ */
	OyajiInit();

	/* 流行語データ */
	PopWord_Init();

	/* ファン企画データ */
	FanAllInit();

	/* ポケモンくじデータ */
	InitPokeLot();

	InitStartMap();						//ゲーム開始位置セット
	DoSpecialScript( ev_flag_on );		// 特殊スクリプトでイベントフラグを設定

}



//=========================================================================
//
//	デバッグモードでのゲーム開始を設定
//
//=========================================================================

#ifdef	PM_DEBUG
static const u8 str_foreign_name[] = {
	K__,R__,Ouml_,T__,E__,EOM_
//	M__,I__,N__,I__,K__,R__,Ouml_,T__,E__,EOM_
//	T__,Y__,P__,H__,L__,O__,S__,I__,O__,N__,EOM_
};

extern void SetDummyBoxData(void);  // ボックスダミーポケモンデータセット 2001/11/13 taya

void DebugInitGame( int type )
{
	DebugMainFlag = 1;			//デバッグモードOFF

	InitGame();

	/* プレイヤーシステムデータ　*/
	Fld.my_gold = 999999;							//お金

	/* ゲーム進行データ */
	EventFlagSet( SYS_POKEMON_GET );
	EventFlagSet( SYS_ZUKAN_GET );
	EventFlagSet( SYS_POKEGEAR_GET );
	EventFlagSet( SYS_B_DASH );				//Bボタンダッシュ許可

	/* ポケモンデータ */
	TemotiPokeAdd(MONSNO_KIMORI, 99,0,NULL,NULL,0 );		// ドンキーLv99
	if ( type == DEBUG_START_FOREIGNER ) {
		PokeParaPut(&PokeParaMine[0],ID_nickname, str_foreign_name );
	}

	SetDummyBoxData();  // ボックスにダミーデータをセット 2001/11/13 taya

	/* どうぐデータ */
	GetPocketItem();		// アイテムを持たせる
	SetDummyCube();			// 手持ちにダミーキューブを加える 02/02/26 by nakahiro

	/* おやじデータ */
	EventFlagSet(SYS_NOW_OYAJI_MEET);	// ナウイおやじに会った
	NowWordGetUnknown();				// １つだけ言葉を覚える

	DebugMenuFlagSet();

	InitTimeEvent();				//時間イベント起動
}
#endif	PM_DEBUG

//=========================================================================
//
//	ポケモンフェスタ用モードでゲームを開始
//
//=========================================================================

#ifdef	FESTA_VER_ROM

static const u8 str_festa_male[] = { HI_,RO_,EOM_ };
static const u8 str_festa_female[] = { A_,KI_,EOM_ };

void FestaInitGame( void )
{
	FestaModeFlag = 1;
	InitGame();

												// ランダムで個人情報入力
	if ( pp_rand() & 0x80 ) {
		PM_strcpy( MyData.my_name, str_festa_male );
		MyData.my_sex = MALE;
	} else {
		PM_strcpy( MyData.my_name, str_festa_female );
		MyData.my_sex = FEMALE;
	}

	AddItem( ITEM_KIZUGUSURI, 20 );				//手持ちのきずぐすり×２０
	AddItem( ITEM_PIIPIIEIDO, 10 );
	AddItem( ITEM_GENKINOKAKERA, 5 );

	TemotiPokeAdd( MONSNO_SAMEHADAA,12,0,NULL,NULL,0 );	//手持ち１：サメハダー
	TemotiPokeAdd( MONSNO_KAKUREON,14,0,NULL,NULL,0 );	//手持ち２：カクレオン

	NextMapSetDirect( TEST, TEST_NEWTOWN, -1, 17, 35 );
	SetNextWorldPosition();
}
#endif


//=========================================================================
//
//	ゲームオーバー時のパラメータ設定
//
//=========================================================================
extern void PokeAllKaifuku(void);

void RestartGame( void )
{
	DoSpecialScript( ev_flag_game_over_set );

	Fld.my_gold /= 2;
	PokeAllKaifuku();
	InitEventFlagAtGameOver();

	NextMapSetByTelMapID();
	SetNextWorldPosition();
}


//=========================================================================
//
//
//
//=========================================================================

//-----------------------------------------------------------------
//	そらをとぶ時のフラグリセット
//-----------------------------------------------------------------
void InitEventFlagAtFlying( void )
{
	InitHeroLastStatus();
	EventFlagReset( SYS_CYCLING_ROAD );
	EventFlagReset( SYS_CRUISE_MODE );
	EventFlagReset( SYS_SAFARI_MODE );
	EventFlagReset( SYS_USE_WAZA_KAIRIKI );
	EventFlagReset( SYS_USE_WAZA_FLASH );
}

//-----------------------------------------------------------------
//	テレポート時のフラグリセット
//-----------------------------------------------------------------
void InitEventFlagAtTeleport( void )
{
	InitHeroLastStatus();
	EventFlagReset( SYS_CYCLING_ROAD );
	EventFlagReset( SYS_CRUISE_MODE );
	EventFlagReset( SYS_SAFARI_MODE );
	EventFlagReset( SYS_USE_WAZA_KAIRIKI );
	EventFlagReset( SYS_USE_WAZA_FLASH );
	DoSpecialScript( ev_hagi_fune_reset );	//ハギの船の位置を直す
}

//-----------------------------------------------------------------
//	あなぬけ時のフラグリセット
//-----------------------------------------------------------------
void InitEventFlagAtEscape( void )
{
	InitHeroLastStatus();
	EventFlagReset( SYS_CYCLING_ROAD );
	EventFlagReset( SYS_CRUISE_MODE );
	EventFlagReset( SYS_SAFARI_MODE );
	EventFlagReset( SYS_USE_WAZA_KAIRIKI );
	EventFlagReset( SYS_USE_WAZA_FLASH );
}

//-----------------------------------------------------------------
//	ゲームオーバー時のフラグリセット
//-----------------------------------------------------------------
void InitEventFlagAtGameOver( void )
{
	InitHeroLastStatus();
	EventFlagReset( SYS_CYCLING_ROAD );
	EventFlagReset( SYS_CRUISE_MODE );
	EventFlagReset( SYS_SAFARI_MODE );
	EventFlagReset( SYS_USE_WAZA_KAIRIKI );
	EventFlagReset( SYS_USE_WAZA_FLASH );
}

//-----------------------------------------------------------------
//	コンティニュー時のフラグリセット
//-----------------------------------------------------------------
void InitEventFlagAtContnue( void )
{
//	EventFlagReset( SYS_CYCLING_ROAD );
//	EventFlagReset( SYS_CRUISE_MODE );
	EventFlagReset( SYS_SAFARI_MODE );
//	EventFlagReset( SYS_USE_WAZA_KAIRIKI );
//	EventFlagReset( SYS_USE_WAZA_FLASH );
	InitFieldVoice();
	CyclingRoadEventInit();
	MvPokeHeroPosSet();
	MvPokeMoveRnd();
}

