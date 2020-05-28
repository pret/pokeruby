//======================================================
//    fld_main.c                                           
//                                                      
//    Copyright (C) 2000 GAME FREAK inc.
//======================================================


#include "common.h"
#include "field.h"
#include "intr.h"
#include "screen.h"
#include "fld_talk.h"
#include "task.h"
#include "initgame.h"


#define FLD_MAIN_H_GLOBAL
#include "fld_main.h"

#define MAP_H_GLOBAL
#include "map.h"


#include "fld_sio.h"
#include "mul_play.h"

#include "evobj.h"
#include "fieldmap.h"
#include "mapchr.h"		/* InitNowMapVisual */
#include "mapbg.h"
#include "mapparam.h"	// マップタイプコード

#include "bg_anm.h"
#include "palanm.h"
#include "jiki.h"
#include "saveload.h"
#include "fld_tool.h"
#include "fld_task.h"
#include "script.h"
#include "ev_check.h"
#include "ev_flag.h"
#include "weather.h"
#include "wea_ctrl.h"
#include "laster.h"
#include "mapname.h"
#include "menu.h"
#include "playtime.h"		/* PlayTimeStart */
#include "ev_trai.h"		/* EvTrainerSightCheck */
#include "record.h"			/* IncRecord */
#include "ev_time.h"		/* UpdateTimeEvent */
#include "fld_menu.h"		/* StartFieldMenuEvent */
#include "mus_tool.h"

#include "multisio.h"
#include "pokesio.h"
#include "map_attr.h"
#include "ev_sub.h"
#include "ev_comm.h"		//CommExitSet
#include "seed.h"			//CheckSeedInScreen
#include "r_door.h"			//DoorObjSet
#include "scr_tool.h"		//CyclingRoadEventInit
#include "safari.h"			//ClearFieldSafariMode

#include "scroll.tbl"					// 移動ベクターデータ


//------------------------- 外部参照 -----------------------------
extern u16 RecvData[];

extern SIOTRAINER_INFO SioTrainerInfo[];

//------------------------- データ -----------------------------




//---------------------- 変数 --------------------------

pFunc pFieldRecoverFunc;		// フィールド復帰処理の関数ポインタ


//---------------------- ローカル変数 --------------------------





//-------------------- サブルーチン宣言 ------------------------
static void Field_clear_intr(void);
static void Field_set_intr(void);
static void init_laster( void );
static void set_disp_register( void );


static void FieldMainCommStart(void);

static void field_start_init( u8 * seq );
static int make_normal_field(u8 * seq, int is_comm_mode);
static int make_comm_field( u8 * seq );
static int recover_comm_field( u8 * seq );
static int recover_normal_field( u8 * seq );

static void FieldInitControlData(int is_comm_mode);
static void FieldInitScreen( void );
static void FieldSetScreen(void);

static void init_comm_info( void );

static void init_normal_obj(void);
static void recover_normal_obj( void );
static void init_normal_scroll( void );
static void init_comm_obj(void);
static void init_comm_scroll( void );
static void recover_comm_scroll( void );
static void init_comm_player( void );
static void recover_comm_player( void );

void NormalFieldControl( void );

void CommFieldControl( void );




extern void FirstTruckEventStart( void );	//最初のトラック内エフェクト開始


extern u8 BaseNameDraw(void);
//-------------------------------------------------------------
//-------------------------------------------------------------
typedef int (*COMM_CTRL_FUNC)(int);

u8 comm_player_num;			//通信同期時の人数
u8 comm_my_id;				//通信同期時の自分のID
u16 my_command;				//通信時の動作コード受け渡し用変数

static u8 comm_status[COMM_PLAYER_MAX];
static COMM_CTRL_FUNC comm_ctrl_func;

static u8 field_recv_fifo_clear_flag;	//受信FIFO解消モード制御フラグ

static void update_all_comm_control( u16 * Recv, int my_id );
static void clear_all_comm_status( void );
static int check_all_comm_status( u16 mode );
static int check_any_comm_status( u16 mode );

static void clear_recv_data( u16 * Recv );
static void set_send_data( u16 cmd );



//==================================================================================
//
//	通信デバッグ関連
//
//==================================================================================

#if defined(FIELD_TUUSHIN_DEBUG) && defined(PM_DEBUG)

extern void DebugNumPrintInit2(u8 pal, u8 select, u8 screen, u8 chara);
extern void kanshi_network(u8 taskno);

u8 debug_comm_info[DB_INFO_MAX][COMM_PLAYER_MAX] = {};

u16 debug_player_cmd[COMM_PLAYER_MAX] = {};


//-------------------------------------------------------------
//-------------------------------------------------------------
void DebugNumPrintInitField( void )
{
	DebugNumPrintInit2(
		12,					//palette
		MSG_BG_NO,			//BG
		MSG_SCRN_BASE,		//scrn offset
		MSG_CHR_BASE		//chr offset
	);

	if ( CheckTask(kanshi_network) ) return;
	AddTask(kanshi_network,0);
}

//-------------------------------------------------------------
//-------------------------------------------------------------
static void debug_info_init( void )
{
	int i,j;
	for(i=0;i<COMM_PLAYER_MAX;i++) {
		debug_player_cmd[i] = 0;
		for(j=0;j<DB_INFO_MAX;j++) {
			debug_comm_info[j][i] = 0;
		}
	}
}

//-------------------------------------------------------------
//-------------------------------------------------------------
static void debug_info_set( void )
{
	int i;

	for(i=0;i<comm_player_num;i++){
		if ( RecvData[i] == INVALID_DATA ) {
			debug_comm_info[0][i]++;
		}
		if ( sys.Cont & L_BUTTON ) {
			debug_player_cmd[i] = (debug_comm_info[1][i] << 8) | debug_comm_info[0][i];
		} else if ( sys.Cont & B_BUTTON ) {
			debug_player_cmd[i] = (comm_status[i] << 8 ) | ( RecvData[i] & 0xff );
		} else {
			debug_player_cmd[i] = (debug_comm_info[2][i] << 8) | debug_comm_info[3][i];
		}
	}
}
#endif

#if defined(FIELD_TUUSHIN_DEBUG) && defined(PM_DEBUG)

#define DEBUG_SIO_PRINT_INIT()	DebugNumPrintInitField()
#define DEBUG_SIO_INFO_SET()	debug_info_set()
#define DEBUG_SIO_INFO_INIT()	debug_info_init()
#define DEBUG_SIO_INFO_INC(type,id)	{ debug_comm_info[(type)][(id)]++; }

#else

#define	DEBUG_SIO_PRINT_INIT()
#define DEBUG_SIO_INFO_SET()
#define DEBUG_SIO_INFO_INIT()
#define DEBUG_SIO_INFO_INC(type,id)

#endif




static int comm_normal_control( int );
static int comm_event_control( int );
static int comm_rfifo_event_control( int n );
static int comm_sfifo_event_control( int n );
static int comm_start_control( int );
static int comm_exit_control( int );

//==================================================================================
//                       メインルーチン
//==================================================================================

static void init_field_mode( void )
{
	ClearFieldSafariMode();
}

//-------------------------------------------------------------
//	フィールド通信モードかどうかのチェック
//	※今は関数ポインタを見ているがフラグに変更するかも
//-------------------------------------------------------------
int IsFieldCommMode( void )
{
	if ( sys.pFirstProc == CommFieldControl ) {
		return TRUE;
	} else {
		return FALSE;
	}
}


//==============================================================
//	フィールドメインシーケンス
//==============================================================

//-------------------------------------------------------------
//	通常時のフィールドイベント制御
//-------------------------------------------------------------
void MineControl( u16 key_trg, u16 key_cont )
{
	EV_REQUEST my_req;

	HeroMvStateSet();					// 自機動作状況ｾｯﾄ

	ClearRequest( &my_req );
	SetRequest( &my_req, key_trg, key_cont );

	if ( CheckForceEvent() == FALSE ) {
		if ( CheckRequest( &my_req ) == TRUE ) {
			SetForceEvent();
			EraseMapName();
		} else {
			HeroMoveControl( my_req.Site, key_trg, key_cont );	// 自機動作制御
		}
	}
}

void NormalFieldControl( void )
{
	if ( sys.pMainProc != FieldMain ) return;
	MineControl( sys.Trg, sys.Cont );
}




//-------------------------------------------------------------
//		フィールド　メイン
//-------------------------------------------------------------
static void FieldMainCore(void)
{
	ControlFieldScript();
	MainTask();

	JumpActor();	
	ControlFieldScroll();
	MapViewControl();
	SetActor();	
	PaletteAnime();
	MapBGanimeMain();
}

void FieldEffectMain(void)
{
	FieldMainCore();
}

void FieldMain(void)
{
	u8 sw;
	sw = FadeData.fade_sw;

	if (sw) SetVBlankFunc( NULL );

	FieldMainCore();

	if (sw) Field_set_intr();
}


//==============================================================
//	フィールド初期化シーケンス
//==============================================================
//-------------------------------------------------------------
//	制御プロセスの切り替え
//-------------------------------------------------------------
void SetControlFunc( pFunc fnc )
{
	sys.pFirstProc = fnc;
}

//-------------------------------------------------------------
//	通信制御部分の切り替え
//-------------------------------------------------------------
void SetControlCommFunc( COMM_CTRL_FUNC func )
{
	comm_ctrl_func = func;
}

//-------------------------------------------------------------
//	初期化用コールバック関数の呼び出し
//-------------------------------------------------------------
void call_recover_sub(void)
{
	if ( pFieldRecoverFunc != NULL ) {
		pFieldRecoverFunc();
	} else {
		AddFieldInTask();
	}
	pFieldRecoverFunc = NULL;
}


//==================================================================================
//
//	フィールド開始メイン処理
//
//==================================================================================
//--------------------------------------------------------------
//	フィールド開始：通常ゲームスタート
//--------------------------------------------------------------
void NormalGameStart( void )
{
	Field_clear_intr();
	BGM_PlayStop();

	init_field_mode();
	InitGame();
	InitHeroLastStatus();	//自機形態の情報を初期化
	PlayTimeStart();
	InitFieldScript();
	ResetForceEvent();

	pFieldRecoverFunc = FirstTruckEventStart;
	field_start_init( &sys.InitSeqWork );

	Field_set_intr();
	SetControlFunc( NormalFieldControl );
	MainProcChange( FieldMain );
}

#ifdef	PM_DEBUG
//--------------------------------------------------------------
//	フィールド開始：デバッグゲームスタート
//--------------------------------------------------------------
void DebugGameStart(void)
{
	Field_clear_intr();
	BGM_PlayStop();

	init_field_mode();

	InitHeroLastStatus();	//自機形態の情報を初期化
	PlayTimeStart();
	InitFieldScript();
	ResetForceEvent();

	if ( sys.Cont & R_BUTTON ) {
		pFieldRecoverFunc = FirstTruckEventStart;
	} else {
		pFieldRecoverFunc = AddFieldBlackInTask;
	}
	field_start_init( &sys.InitSeqWork );

	Field_set_intr();
	SetControlFunc( NormalFieldControl );
	MainProcChange( FieldMain );
}
#endif	PM_DEBUG




//--------------------------------------------------------------
//	フィールド開始:ゲームオーバー後の再開
//--------------------------------------------------------------
void GameOverRestart(void)
{
	u8 count;

	sys.InitSeqWork ++;
	if (sys.InitSeqWork < 120)
		return;

	Field_clear_intr();
	BGM_PlayStop();

	init_field_mode();
	RestartGame();
	InitHeroLastStatus();	//自機形態の情報を初期化
	InitFieldScript();
	ResetForceEvent();

	pFieldRecoverFunc = AddFieldBlackInTask;
	count = 0;
	field_start_init(&count);

	Field_set_intr();
	SetControlFunc( NormalFieldControl );
	MainProcChange( FieldMain );
}

//--------------------------------------------------------------
//	フィールド開始：マップ遷移直後
//--------------------------------------------------------------
extern void ChangeEffectInit(void);

static void FieldMainStart( void );

void FieldMainInit(void)
{
	Field_clear_intr();

	InitFieldScript();
	ResetForceEvent();
	SetControlFunc( NULL );
	MainProcChange( ChangeEffectInit );
	sys.pReturnProc = FieldMainStart;		//	フィールド開始メイン処理
}


static void FieldMainStart(void)
{
	field_start_init( &sys.InitSeqWork );

	Field_set_intr();
	SetControlFunc( NormalFieldControl );
	MainProcChange( FieldMain );
}


//--------------------------------------------------------------
//	フィールド開始：マップ遷移直後（コンテスト専用）
//--------------------------------------------------------------
void FieldContestInit( void )
{
	if ( sys.InitSeqWork == 0 ) {
		Field_clear_intr();

		InitFieldScript();
		ResetForceEvent();
		SetControlFunc( NULL );
	}

	if (make_normal_field(&sys.InitSeqWork, TRUE) == FALSE)
		return;

	Field_set_intr();
	SetControlFunc( NormalFieldControl );
	MainProcChange( FieldMain );
}


//--------------------------------------------------------------
//	フィールド開始：マップ遷移直後（通信部屋用）
//--------------------------------------------------------------
void FieldMainCommInit(void)
{
	Field_clear_intr();

	pFieldRecoverFunc = AddCommFieldStartTask;
//	pFieldRecoverFunc = AddCommFieldInTask;
	MainProcChange( FieldMainCommStart );
}

static void FieldMainCommStart(void)
{
	if ( make_comm_field( &sys.InitSeqWork ) == FALSE ) return;

	Field_set_intr();
	SetControlFunc( CommFieldControl );
	SetControlCommFunc( comm_normal_control );
	MainProcChange( FieldMain );
}

//==============================================================
//	フィールド復帰メイン処理
//==============================================================
static void return_normal_field( void );
static void return_comm_field( void );



void FieldMainRecover(void)
{
	if ( IsFieldCommMode() == TRUE ) {
		MainProcChange( return_comm_field );
	} else {
		Field_clear_intr();
		MainProcChange( return_normal_field );
	}
}

//--------------------------------------------------------------
//--------------------------------------------------------------
static void return_normal_field(void)
{

	if ( recover_normal_field( &sys.InitSeqWork ) == FALSE ) return;

	Field_set_intr();
	MainProcChange( FieldMain );
}



//--------------------------------------------------------------
//--------------------------------------------------------------
static void return_comm_field( void )
{
	if ( FieldRecvFifoClearWait() ) return;

	if ( recover_comm_field( &sys.InitSeqWork ) == FALSE ) return;

	MainProcChange( FieldMain );
}

//--------------------------------------------------------------
//	フィールド復帰：イベントから通信同期状態に復帰
//--------------------------------------------------------------
void FieldCommRecover(void)
{
	Field_clear_intr();
	BGM_PlayStop();

	clear_all_comm_status();
	SetControlFunc( CommFieldControl );
	SetControlCommFunc( comm_normal_control );
	pFieldRecoverFunc = AddCommFieldInTask;

	InitFieldScript();
	ResetForceEvent();
	
	FieldMainRecover();
}

//--------------------------------------------------------------
//	フィールド復帰：メニュー選択への復帰
//--------------------------------------------------------------
void FieldMenuRecover(void)
{
	Field_clear_intr();

	pFieldRecoverFunc = AddFieldMenuInTask;
	FieldMainRecover();
}

//--------------------------------------------------------------
//	フィールド復帰：スクリプトを再開
//--------------------------------------------------------------
void FieldScriptRecoverBGMNotStart( void )
{
	Field_clear_intr();

	pFieldRecoverFunc = AddScriptFieldInBGMNotStartTask;
	FieldMainRecover();
}

//--------------------------------------------------------------
//	フィールド復帰：スクリプトを再開
//--------------------------------------------------------------
void FieldScriptRecover( void )
{
	Field_clear_intr();

	pFieldRecoverFunc = AddScriptFieldInTask;
	FieldMainRecover();
}

//--------------------------------------------------------------
//	フィールド復帰：なにもしない
//--------------------------------------------------------------
void FieldNormalRecover( void )
{
	Field_clear_intr();

	pFieldRecoverFunc = AddFieldBlackInTask;
	FieldMainRecover();
}

//--------------------------------------------------------------
//	フィールド復帰：セーブデータからコンティニュー
//--------------------------------------------------------------
static void continue_recover_func( void )
{
	if ( NowMap.disp_sw == 1 && BaseNameDraw() == TRUE ) {
		DispMapName();
	}
	AddFieldBlackInTask();
}

void ContinueGameStart(void)
{
	Field_clear_intr();
	BGM_PlayStop();

#ifdef	PM_DEBUG
	if ( sys.Cont & R_BUTTON ) DebugMainFlag = ON;
#endif

	init_field_mode();

	RecoverNowMapData();		//NowMapのリカバリ処理
	SxyObjDataRecover();		//バイナリアドレスずれ防止
	EvObjPauseClrAll();			//セーブ時のポーズ情報を解除

	UpdateTimeEvent();				//時間イベントフラグ制御
	InitEventFlagAtContnue();		//フラグ・ワークの更新

	MakeContinueVirtualMap();

	PlayTimeStart();
	InitFieldScript();
	ResetForceEvent();

	if ( CheckContinueStatus() == 1 ) {
		InitContinueStatus();
		NextMapSetByContinueMapID();
		SetNextWorldPosition();
		MainProcChange( FieldMainInit );
		return;
	}

	pFieldRecoverFunc = continue_recover_func;

	SetControlFunc( NormalFieldControl );
	FieldMainRecover();
}


//==================================================================================
//                    割り込みルーチン
//==================================================================================

static void Field_v_blank_intr(void);

//--------------------------------------------------------------
//		割り込み許可の設定
//--------------------------------------------------------------
static void Field_clear_intr(void)
{
	REG_IE_CHG( V_BLANK_INTR_FLAG, H_BLANK_INTR_FLAG );
	SetVBlankFunc(NULL);
	SetHBlankFunc(NULL);
}

static void Field_set_intr(void)
{
	SetVBlankFunc( Field_v_blank_intr );
}

//--------------------------------------------------------------
//                    Ｖブランク関数
//--------------------------------------------------------------
static void Field_v_blank_intr(void)
{
		actOAMtrans();
		actDMAtrans();
		
		LasterVblank();
		MapBGVsync();

		PaletteFadeTrans();
		BGanimeDMAtrans();
}


//--------------------------------------------------------------
//					H-DMA関連
//--------------------------------------------------------------

static const LasterData FieldHLaster = {
	(void *)REG_WIN0H,		//ﾃﾞｰﾀ転送先ｱﾄﾞﾚｽ(REG_BG0VOFS等)
	H_DMA_ENABLE16,			//32ビット転送
	LASTER_NORMAL,			//転送タイプ（0:リクエストなし1:ノーマル2:ループ型）
	0						//転送タイプがループの時のカウント
};

static void init_laster( void )
{
	int r;
	r = GetBright();
	if ( r != 0 ) {
		MakeFieldLasterData(r);
		LasterDmaSet( FieldHLaster );
	}
}


//==================================================================================
//                      初期化ルーチン
//==================================================================================

//--------------------------------------------------------------
//	通信時のマップ遷移直後の初期化
//--------------------------------------------------------------
static int make_comm_field( u8 * seq )
{
	switch ( *seq ) {
	case 0:
		Field_clear_intr();
		InitFieldScript();
		ResetForceEvent();
		clear_all_comm_status();
		FieldInitScreen();
		(*seq)++;break;

	case 1:
		FieldInitData(TRUE);
		(*seq)++;break;

	case 2:
		FieldInitControlData(TRUE);
		(*seq)++;break;

	case 3:
		init_comm_info();
		init_comm_obj();
		init_comm_player();
		init_comm_scroll();
		(*seq)++;break;

	case 4:
	/*	FieldSetScreen(); */
		init_laster();							//ラスター（HDMA)設定
		set_disp_register();					//表示関連レジスタ設定
		PrintScreenInit(DEFAULT_TYPE);			//MSG表示設定
		NMenuScreenInit(FIELD_MENU_TYPE);		//メニューシステム設定
		(*seq)++;break;

	case 5:
	/*	InitNowMapVisual(); */
		InitMapBG();				// BG 初期化( 座標,ﾀﾞﾐｰVram 初期化 )
		(*seq)++;break;
	case 6:
		TransMapChar1stData(NowMap.Screen);
		(*seq)++;break;
	case 7:
		TransMapChar2ndData(NowMap.Screen);
		(*seq)++;break;
	case 8:
		TransMapPaletteData(NowMap.Screen);
		(*seq)++;break;
	case 9:
		MakeMapBG();						// ﾀﾞﾐｰVram 展開
		(*seq)++;break;
	case 10:
		MapBGanimeInit();
		(*seq)++;break;

	case 11:
		DEBUG_SIO_PRINT_INIT();
		(*seq)++;break;

	case 12:
		call_recover_sub();
		(*seq)++;break;

	case 13:
		return TRUE;
	}
	return FALSE;
}


//--------------------------------------------------------------
//	通常のマップ遷移直後の初期化
//	<引数>	seq				シーケンス保持のワークアドレス
//			is_comm_mode	通信中かどうか
//							（通信コンテスト中のみ）
//--------------------------------------------------------------
static int make_normal_field(u8 * seq, int is_comm_mode)
{
	switch ( *seq ) {
	case 0:
		Field_clear_intr();
		FieldInitData(is_comm_mode);
		(*seq)++;break;

	case 1:
		FieldInitScreen();
		(*seq)++;break;

	case 2:
		FieldInitControlData(is_comm_mode);
		(*seq)++;break;

	case 3:
		init_normal_obj();
		init_normal_scroll();
		(*seq)++;break;

	case 4:
	/*	FieldSetScreen(); */
		init_laster();							//ラスター（HDMA)設定
		set_disp_register();					//表示関連レジスタ設定
		PrintScreenInit(DEFAULT_TYPE);			//MSG表示設定
		NMenuScreenInit(FIELD_MENU_TYPE);		//メニューシステム設定
		(*seq)++;break;

	case 5:
	/*	InitNowMapVisual();						//マップ表示など */
		InitMapBG();
		(*seq)++;break;
	case 6:
		TransMapChar1stData(NowMap.Screen);
		(*seq)++;break;
	case 7:
		TransMapChar2ndData(NowMap.Screen);
		(*seq)++;break;
	case 8:
		TransMapPaletteData(NowMap.Screen);
		(*seq)++;break;
	case 9:
		MakeMapBG();
		(*seq)++;break;
	case 10:
		MapBGanimeInit();
		(*seq)++;break;

	case 11:
		if ( NowMap.disp_sw == 1 && BaseNameDraw() == TRUE ) {
			DispMapName();
		}
		(*seq)++;break;
	case 12:
		call_recover_sub();
		(*seq)++;break;
	case 13:
		return TRUE;
	}

	return FALSE;
}


//--------------------------------------------------------------
//	通常時のフィールド復帰初期化
//--------------------------------------------------------------
static int recover_normal_field( u8 * seq )
{
	switch ( *seq ) {
	case 0:
		FieldInitScreen();
		FieldInitControlData(FALSE);
		recover_normal_obj();
		init_normal_scroll();
		(*seq)++;break;

	case 1:
		FieldSetScreen();
		(*seq)++;break;

	case 2:
		call_recover_sub();
		(*seq)++;break;

	case 3:
		return TRUE;
	}
	return FALSE;
}

//--------------------------------------------------------------
//	通信時のフィールド復帰初期化
//--------------------------------------------------------------
static int recover_comm_field( u8 * seq ) {

	switch ( *seq ) {

	case 0:
		Field_clear_intr();
		FieldInitScreen();
		(*seq)++;break;

	case 1:
		FieldInitControlData(TRUE);
		(*seq)++;break;

	case 2:
		recover_comm_player();
		recover_normal_obj();
		recover_comm_scroll();
		(*seq)++;break;

	case 3:
/* static void FieldSetScreen(void) */
		init_laster();							//ラスター（HDMA)設定
		set_disp_register();					//表示関連レジスタ設定
		PrintScreenInit(DEFAULT_TYPE);			//MSG表示設定
		NMenuScreenInit(FIELD_MENU_TYPE);		//メニューシステム設定
		(*seq)++;break;

	case 4:
	/*	InitNowMapVisual();						//マップ表示など */
		InitMapBG();				// BG 初期化( 座標,ﾀﾞﾐｰVram 初期化 )
		(*seq)++;break;
	case 5:
		TransMapChar1stData(NowMap.Screen);
		(*seq)++;break;
	case 6:
		TransMapChar2ndData(NowMap.Screen);
		(*seq)++;break;
	case 7:
		TransMapPaletteData(NowMap.Screen);
		(*seq)++;break;
	case 8:
		MakeMapBG();						// ﾀﾞﾐｰVram 展開
		(*seq)++;break;
	case 9:
		MapBGanimeInit();
		(*seq)++;break;

	case 10:
		(*seq)++;break;

	case 11:
		DEBUG_SIO_PRINT_INIT();
		(*seq)++;break;
	case 12:
		call_recover_sub();
		(*seq)++;break;
	
	case 13:
		Field_set_intr();
		(*seq)++;
		return TRUE;
	}
	return FALSE;
}


static void field_start_init( u8 * seq )
{
	while ( make_normal_field(seq, FALSE) == FALSE );
}

//--------------------------------------------------------------
// VRAM＆表示レジスタ初期化
//--------------------------------------------------------------
static void FieldInitScreen( void )
{
    *(vu16 *)REG_DISPCNT =	0;
	LasterInit();
//	DmaStop(0);								//HDMA 処理停止
	DIV_DMACLEAR(3, 0, PLTT+2,PLTT_SIZE-2, 16);
	DIV_DMACLEAR(3, 0, VRAM,VRAM_SIZE, 16);		// 全VRAM初期化
	actOAMinit(0, 128);		//ｼｽﾃﾑOAMｸﾘｱ
	actOAMtrans();
}

//--------------------------------------------------------------
// 表示レジスタセット
//--------------------------------------------------------------
static void FieldSetScreen(void)
{
	init_laster();							//ラスター（HDMA)設定
	set_disp_register();					//表示関連レジスタ設定
	PrintScreenInit(DEFAULT_TYPE);			//MSG表示設定
	NMenuScreenInit(FIELD_MENU_TYPE);		//メニューシステム設定
	InitNowMapVisual();						//マップ表示など
}

static void set_disp_register( void )
{
		*(vu16*)REG_MOSAIC	= 0;
		*(vu16*)REG_WININ	= 0x1f1f;
		*(vu16*)REG_WINOUT	= 0x0101;
		*(vu16*)REG_WIN0H	= 0x00ff;
		*(vu16*)REG_WIN0V	= 0x00ff;
		*(vu16*)REG_WIN1H	= 0xffff;
		*(vu16*)REG_WIN1V	= 0xffff;


		*(vu16*)REG_BLDCNT =
			//	BGblend1stValue[MSG_BG_NO] |
				BGblend2ndValue[MAP_UP_BG_NO] |
				BGblend2ndValue[MAP_LOW_BG_NO] |
				BGblend2ndValue[MAP_BTM_BG_NO] |
				BLD_OBJ_2ND | BLD_A_BLEND_MODE;
	
		*(vu16*)REG_BLDALPHA = 0x070d;


		*(RegBGHofs[MSG_BG_NO]) = 0;
		*(RegBGVofs[MSG_BG_NO]) = 0;
		*(RegBGctrl[MSG_BG_NO]) = 0;

		*(RegBGHofs[MAP_UP_BG_NO]) = 0;
		*(RegBGVofs[MAP_UP_BG_NO]) = 0;
		*(RegBGctrl[MAP_UP_BG_NO]) =
				BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_MOS_ON
				| MAP_UP_BG_PRI << BG_PRIORITY_SHIFT
				| MAP_UP_SCRN_BASE << BG_SCREEN_BASE_SHIFT
				| MAP_UP_CHR_BASE << BG_CHAR_BASE_SHIFT
				;

		*(RegBGHofs[MAP_LOW_BG_NO]) = 0;
		*(RegBGVofs[MAP_LOW_BG_NO]) = 0;
		*(RegBGctrl[MAP_LOW_BG_NO]) =
				BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_MOS_ON
				| MAP_LOW_BG_PRI << BG_PRIORITY_SHIFT
				| MAP_LOW_SCRN_BASE << BG_SCREEN_BASE_SHIFT
				| MAP_LOW_CHR_BASE << BG_CHAR_BASE_SHIFT
				;

		*(RegBGHofs[MAP_BTM_BG_NO]) = 0;
		*(RegBGVofs[MAP_BTM_BG_NO]) = 0;
		*(RegBGctrl[MAP_BTM_BG_NO]) =
				BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_MOS_ON
				| MAP_BTM_BG_PRI << BG_PRIORITY_SHIFT
				| MAP_BTM_SCRN_BASE << BG_SCREEN_BASE_SHIFT
				| MAP_BTM_CHR_BASE << BG_CHAR_BASE_SHIFT
				;

    	*(vu16 *)REG_DISPCNT =	DISP_MODE_0
				| DISP_OBJ_HOFF
				| DISP_WIN0_ON
				| DISP_WIN1_ON
				| DISP_OBJ_CHAR_1D_MAP
				| DISP_OBJ_ON
				| BGvisibleSwitch[MAP_UP_BG_NO]
				| BGvisibleSwitch[MAP_LOW_BG_NO]
				| BGvisibleSwitch[MSG_BG_NO]
				| BGvisibleSwitch[MAP_BTM_BG_NO]
				;

};


//--------------------------------------------------------------
// フィールド開始時初期設定
//--------------------------------------------------------------

//-------------------------------------------------------------
//
//	フィールド制御システムの初期化
//
//	※実際の画面反映などはこの中では行わない。
//	　ここで初期化したデータは制御システムが
//	　呼び出されるタイミングで間接的に反映する
//
//-------------------------------------------------------------
static void FieldInitControlData(int is_comm_mode)
{
	InitTask();						// タスクシステム初期化
	InitActor();					// Actorシステム初期化
	PaletteAnimeInit();				// パレットシステム初期化
	LasterWorkInit();				// ラスターシステム初期化

	InitFieldScroll();				// Scroll制御初期化
	MapViewInit();					// 視界制御初期化

 	EvObjGraphicInit(0);			// 絵関連初期化
	FeCodeInit();					// ﾌｨｰﾙﾄﾞｴﾌｪｸﾄｺｰﾄﾞ
	FieldMsgInit();					// メッセージウィンドウ制御初期化
	WeatherInit();
	UpdateFieldWeatherDirect();

	if (is_comm_mode == FALSE) {
		InitMapEffectControl();		// 灰、つり橋、etc.の制御初期化
	}

	InitControlScriptCheck();
}




//-------------------------------------------------------------
//-------------------------------------------------------------
static void init_comm_obj(void)
{
	FieldActOX = 0;
	FieldActOY = 0;
	EvObjInit();									// Ev 用 ｱｸﾀｰ初期化
	/* 通常の自機のセットをおこなわない */
	EvObjAddControl(0,0);							// ﾌｨｰﾙﾄﾞｱｸﾀｰｾｯﾄ

	ObjControlScriptCheck();
}

static void init_normal_obj(void)
{
	u16 x,y;
	const HERO_INIT_INFO * first;

	FieldActOX = 0;
	FieldActOY = 0;
	EvObjInit();									// Ev 用 ｱｸﾀｰ初期化

	GetMapCenterPos(&x,&y);
	first = GetHeroFirstStatus();					// 自機状態情報を取得
	SetJikiActor(x, y, first->site, MyData.my_sex);	// 自機Actor( 中心座標 )
	SetHeroMoveRequest(first->form);				// 自機の形態を指定
	InitHeroLastStatus();							// 自機状態情報を初期化

	EvObjAddControl(0,0);							// ﾌｨｰﾙﾄﾞｱｸﾀｰｾｯﾄ
	CheckSeedInScreen();							// きのみの成長抑止チェック

	ObjControlScriptCheck();
}

static void recover_normal_obj( void )
{
	EvObjRecover(0,0);								// ｲﾍﾞﾝﾄ OBJ 復帰
	DoorObjSet();
}

static void init_normal_scroll( void )
{
	EvObjScrSwOn(MyMoveState.evobjno);		// ﾌｨｰﾙﾄﾞ OBJ ｽｸﾛｰﾙﾒｲﾝ
	SetFieldScroll(MyMoveState.actno);		// Scrollセット(自機)
}

static void init_comm_scroll( void )
{
	SetFieldScroll( GetPlayerActorNumber( comm_my_id ) );		// Scrollセット(自機)
}

static void recover_comm_scroll( void )
{
	SetFieldScroll( GetPlayerActorNumber( comm_my_id ) );		// Scrollセット(自機)
}

//-------------------------------------------------------------
//	初期化時のセット
//-------------------------------------------------------------
static void init_comm_info( void )
{
	u16 x,y;

	//画面中心位置を変更
	GetMapCenterPos(&x,&y);
	SetMapCenterPos( x+comm_my_id, y );
}

static void init_comm_player( void )
{
	u16 i;
	u16 x,y;
	GetMapCenterPos(&x,&y);
	x -= comm_my_id;

	for( i=0; i<comm_player_num; i++ ) {
		SetPlayer( i, x+i, y, SioTrainerInfo[i].sex );
		SetPlayerActor( i );
	}

	clear_recv_data(RecvData);
}

//-------------------------------------------------------------
//	復帰時のセット
//-------------------------------------------------------------
static void recover_comm_player( void )
{
	u16 i;

	for( i=0; i<comm_player_num; i++ ) {
		SetPlayerActor( i );
	}
}




//-------------------------------------------------------------
//-------------------------------------------------------------

extern void AddDebugMenuTask(void);		// デバッグメニュー起動

//==================================================================================
//
//	通信時のフィールドメイン制御
//
//==================================================================================

enum{
	MPSTAT_NOTHING = 0x80,
	MPSTAT_EVENT,
	MPSTAT_WAIT,
	MPSTAT_EXIT,
};

enum{
	FLD_COMM_START = 0x10,

	FLD_COMM_NOTHING,
	FLD_COMM_MOVE_DOWN,
	FLD_COMM_MOVE_UP,
	FLD_COMM_MOVE_LEFT,
	FLD_COMM_MOVE_RIGHT,
	FLD_COMM_EVENT_WAIT,
	FLD_COMM_EVENT_EXIT,
	FLD_COMM_EVENT_MENU,
	FLD_COMM_EVENT_TALK,
	FLD_COMM_CLEAR_EVENT,
	FLD_COMM_EVENT_RFIFO,
	FLD_COMM_EVENT_SFIFO,
	FLD_COMM_EVENT_CANCEL,

	FLD_COMM_END,

};


typedef struct {
	u8 number;
	u8 is_myself;
	u8 mv_state;
	u8 site;
	EV_POS	pos;
	u16 attr;
}P_STAT;


static u16 conv_cmd_to_HCMD( u16 cmd );

extern const VM_CODE ev_comm_exit[];
extern const VM_CODE ev_comm_exit_check[];
extern const VM_CODE ev_comm_exit_start[];

extern const VM_CODE ev_comm_look_normal_card[];
extern const VM_CODE ev_comm_look_special_card[];
extern const VM_CODE ev_comm_talk_busy[];


static void get_p_stat( int number, int my_id, P_STAT * ps );

static int comm_fifo_event_check( const P_STAT * ps );
static int comm_menu_event_check( const P_STAT * ps );
static const VM_CODE * comm_pos_event_check( const P_STAT * ps );
static int comm_exit_event_check( const P_STAT * ps );
static const VM_CODE * comm_talk_event_check( const P_STAT * ps );
static u16 comm_get_site_by_pos_event( const VM_CODE * scr );

static void comm_fifo_event_start( void );
static void comm_menu_event_start( void );
static void comm_pos_event_start( const VM_CODE * script );
static void comm_exit_event_start( void );
static void comm_talk_event_start( const VM_CODE * script );
static void comm_end_event_start( void );

static u16 get_send_cmd_by_key( int number );


//ﾌﾟﾚｲﾔｰのﾄﾞｯﾄ単位の移動量を取得
//s16 GetPlayerMoveAmount( u8 num );
//In: num	; 自機ﾜｰｸﾅﾝﾊﾞ
//Out: s16; 現在の移動量(0~16)




//-------------------------------------------------------------
//-------------------------------------------------------------
static void clear_all_comm_status( void )
{
	int i;
	for (i=0;i<COMM_PLAYER_MAX; i++ ) {
		comm_status[i] = MPSTAT_NOTHING;
	}

	DEBUG_SIO_INFO_INIT();
}
//-------------------------------------------------------------
//-------------------------------------------------------------
static int check_all_comm_status( u16 mode )
{
	int i,member;
	member = comm_player_num;
	for ( i=0; i<member; i++ ) {
		if ( comm_status[i] != mode ) return FALSE;
	}
	return TRUE;
}

//-------------------------------------------------------------
//-------------------------------------------------------------
static int check_any_comm_status( u16 mode )
{
	int i,member;
	member = comm_player_num;
	for ( i=0; i<member; i++ ) {
		if ( comm_status[i] == mode ) return TRUE;
	}
	return FALSE;
}




//-------------------------------------------------------------
//-------------------------------------------------------------
static void update_comm_status( int number, u16 data, const P_STAT * ps, u16 * cmd )
{

	if ( comm_status[number] == MPSTAT_NOTHING ) {

		const VM_CODE * scr;
		scr = comm_pos_event_check(ps);
		if ( scr != NULL ) {
			*cmd = comm_get_site_by_pos_event(scr);
			comm_status[number] = MPSTAT_EVENT;
			if ( ps->is_myself ) {
				SetControlCommFunc( comm_event_control );
				comm_pos_event_start( scr );
			}
			return;
		}

		if ( check_any_comm_status( MPSTAT_EXIT ) == TRUE ) {
			comm_status[number] = MPSTAT_EVENT;
			if ( ps->is_myself ) {
				SetControlCommFunc( comm_event_control );
				comm_end_event_start();
			}
			return;
		}

		
		switch ( data ) {
		case FLD_COMM_EVENT_MENU:
			if ( comm_menu_event_check(ps) == FALSE ) break;

			comm_status[number] = MPSTAT_EVENT;
			if ( ps->is_myself ) {
				SetControlCommFunc( comm_event_control );
				comm_menu_event_start();
			}
			break;

		case FLD_COMM_MOVE_DOWN:
			if ( comm_exit_event_check(ps) == TRUE ) {
				comm_status[number] = MPSTAT_EVENT;
				if ( ps->is_myself ) {
					SetControlCommFunc( comm_event_control );
					comm_exit_event_start();
				}
				break;
			}
			break;

		case FLD_COMM_EVENT_TALK:
			scr = comm_talk_event_check(ps);
			if ( scr == NULL ) break;

			comm_status[number] = MPSTAT_EVENT;
			if ( ps->is_myself ) {
				SetControlCommFunc( comm_event_control );
				comm_talk_event_start(scr); 
			}
			break;

		case FLD_COMM_EVENT_RFIFO:
			DEBUG_SIO_INFO_INC(3,number);
			if ( comm_fifo_event_check(ps) == FALSE ) break;

			comm_status[number] = MPSTAT_EVENT;
			if ( ps->is_myself ) {
				SetControlCommFunc( comm_rfifo_event_control );
				comm_fifo_event_start(); 
			}
			break;

		case FLD_COMM_EVENT_SFIFO:
			DEBUG_SIO_INFO_INC(2,number);
			if ( comm_fifo_event_check(ps) == FALSE ) break;

			comm_status[number] = MPSTAT_EVENT;
			if ( ps->is_myself ) {
				SetControlCommFunc( comm_sfifo_event_control );
				comm_fifo_event_start(); 
			}
			break;

		}
	}


	switch ( data ) {

	case FLD_COMM_EVENT_EXIT:
		comm_status[number] = MPSTAT_EXIT;
		break;

	case FLD_COMM_EVENT_WAIT:
		comm_status[number] = MPSTAT_WAIT;
		break;

	case FLD_COMM_CLEAR_EVENT:
		comm_status[number] = MPSTAT_NOTHING;
		if ( ps->is_myself ) {
			SetControlCommFunc( comm_normal_control );
		}
		break;

	case FLD_COMM_EVENT_CANCEL:
		if ( comm_status[number] == MPSTAT_WAIT ) {
			comm_status[number] = MPSTAT_EVENT;
		}
		break;
	}
}


//-------------------------------------------------------------
//-------------------------------------------------------------
static void update_all_comm_control( u16 * Recv, int my_id )
{
	int i;
	u16 code;
	u16 cmd;
	P_STAT p_stat;

	for (i=0;i<COMM_PLAYER_MAX; i++ ) {

		code = Recv[i];
		cmd = HCMD_NOTHING;
		get_p_stat( i, my_id, &p_stat );
		update_comm_status( i, code, &p_stat, &cmd );

		if ( comm_status[i] == MPSTAT_NOTHING ) {
			cmd = conv_cmd_to_HCMD(code);
		}
		UpdatePlayer( i, cmd );
	}
}

//-------------------------------------------------------------
//-------------------------------------------------------------
static void set_send_data( u16 cmd )
{
	if ( FLD_COMM_START < cmd && cmd < FLD_COMM_END ) {
		my_command = cmd;
	} else {
		my_command = FLD_COMM_NOTHING;
	}
}

//-------------------------------------------------------------
//	キー入力からコマンドを生成
//-------------------------------------------------------------
static u16 get_send_cmd_by_key( int number )
{
	if ( sys.Cont & U_KEY ) return FLD_COMM_MOVE_UP;
	if ( sys.Cont & D_KEY ) return FLD_COMM_MOVE_DOWN;
	if ( sys.Cont & L_KEY ) return FLD_COMM_MOVE_LEFT;
	if ( sys.Cont & R_KEY ) return FLD_COMM_MOVE_RIGHT;
	if ( sys.Trg & START_BUTTON ) return FLD_COMM_EVENT_MENU;
	if ( sys.Trg & A_BUTTON ) return FLD_COMM_EVENT_TALK;
	return FLD_COMM_NOTHING;
}

//-------------------------------------------------------------
//	通信コード→プレイヤー動作コードの変換
//-------------------------------------------------------------

static u16 conv_cmd_to_HCMD( u16 cmd )
{
	switch ( cmd ) {
	case FLD_COMM_MOVE_RIGHT: return HCMD_RIGHT;
	case FLD_COMM_MOVE_LEFT: return HCMD_LEFT;
	case FLD_COMM_MOVE_UP: return HCMD_UP;
	case FLD_COMM_MOVE_DOWN: return HCMD_DOWN;

	default:
		return HCMD_NOTHING;
	}
}

//-------------------------------------------------------------
//-------------------------------------------------------------
static void clear_recv_data( u16 * Recv )
{
	int i;
	for ( i=0 ; i<COMM_PLAYER_MAX; i++ ) {
		Recv[i] = FLD_COMM_NOTHING;
	}
}


//==============================================================
//	制御メイン
//	※ sys.pFirstProcに設定され、sys.pMainProcより先に呼ばれる
//==============================================================

void CommFieldControl( void )
{
	int n;
	u16 cmd;

	DEBUG_SIO_INFO_SET();

	n = comm_my_id;

	update_all_comm_control(RecvData, n);

	cmd = comm_ctrl_func(n);

	set_send_data( cmd );

	clear_recv_data(RecvData);
}

//-------------------------------------------------------------
//	通信中メイン（通常）
//-------------------------------------------------------------
int comm_normal_control( int n )
{
	u16 cmd;

	if ( CheckForceEvent() == TRUE ) {
		cmd = FLD_COMM_NOTHING;
	}
	else if ( M_s.RecvBuf.Size > FLD_RFIFO_CLEAR_VALUE ) {
		cmd = FLD_COMM_EVENT_RFIFO;
	}
	else if ( M_s.SendBuf.Size > FLD_SFIFO_CLEAR_VALUE ) {
		cmd = FLD_COMM_EVENT_SFIFO;
	}
	else {
		cmd = get_send_cmd_by_key(n);
	}

	return( cmd );
}

//-------------------------------------------------------------
//	通信中メイン（イベント中）
//-------------------------------------------------------------
int comm_event_end_control( int n )
{
	return( FLD_COMM_NOTHING );
}

int comm_event_control( int n )
{
	u16 cmd;

	if ( CheckForceEvent() == TRUE ) {
		cmd = FLD_COMM_NOTHING;
	} else {
		cmd = FLD_COMM_CLEAR_EVENT;
		SetControlCommFunc(comm_event_end_control);
	}
	return( cmd );
}

//-------------------------------------------------------------
//	通信中メイン（FIFO解消中)
//	※システムレベルの動作だがイベントとして扱っている
//-------------------------------------------------------------
//受信FIFO解消
int comm_rfifo_event_control( int n )
{
	u16 cmd;

	if ( M_s.RecvBuf.Size > FLD_RFIFO_LIMIT_VALUE ) {
		cmd = FLD_COMM_NOTHING;
	} else {
		cmd = FLD_COMM_CLEAR_EVENT;
		ResetForceEvent();
		SetControlCommFunc(comm_event_end_control);
	}
	return( cmd );
}

//送信FIFO解消
int comm_sfifo_event_control( int n )
{
	u16 cmd;

	if ( M_s.SendBuf.Size > FLD_SFIFO_LIMIT_VALUE ) {
		cmd = FLD_COMM_NOTHING;
	} else {
		cmd = FLD_COMM_CLEAR_EVENT;
		ResetForceEvent();
		SetControlCommFunc(comm_event_end_control);
	}
	return( cmd );
}

//-------------------------------------------------------------
//	通信中メイン（交換・対戦etc...開始待ち）
//-------------------------------------------------------------
int comm_start_cancel_control( int n )
{
	return ( FLD_COMM_NOTHING );
}

int comm_start_wait_control( int n )
{
	if ( comm_status[n] == MPSTAT_WAIT ) {
		if ( sys.Trg & B_BUTTON ) {
			SetControlCommFunc( comm_start_cancel_control );
			return FLD_COMM_EVENT_CANCEL;
		}
	}
	return( FLD_COMM_NOTHING );
}

int comm_start_control( int n )
{
	SetControlCommFunc( comm_start_wait_control );
	return( FLD_COMM_EVENT_WAIT );
}

//-------------------------------------------------------------
//	通信中メイン（終了待ち)
//-------------------------------------------------------------
int comm_exit_end_control( int n )
{
	return( FLD_COMM_NOTHING );
}

int comm_exit_wait_control( int n )
{
	if ( check_all_comm_status( MPSTAT_EXIT ) == TRUE ) {
		StartFieldScript( ev_comm_exit );
		SetControlCommFunc( comm_exit_end_control );
	}
	return( FLD_COMM_NOTHING );
}

int comm_exit_control( int n )
{
	SetControlCommFunc( comm_exit_wait_control );
	return( FLD_COMM_EVENT_EXIT );
}

//==============================================================
//==============================================================
//-------------------------------------------------------------
//イベント開始待ちチェック
//	<戻り値>
//	0		待ち状態
//	1		イベント開始
//	2		イベントキャンセル（出口処理へ）
//-------------------------------------------------------------
int CommEventWaitCheck( void )
{
	/* だれかが外に出た */
	if ( check_any_comm_status( MPSTAT_EXIT ) == TRUE ) return 2;

	/* 開始待ちだがまだ開始コードを受信していない */
	if ( comm_ctrl_func == comm_start_wait_control
			&& comm_status[comm_my_id] != MPSTAT_WAIT ) return 0;

	/* キャンセルコードを受信した */
	if ( comm_ctrl_func == comm_start_cancel_control
			&& comm_status[comm_my_id] == MPSTAT_EVENT ) return 2;

	return check_all_comm_status( MPSTAT_WAIT );
}

//-------------------------------------------------------------
//	通信終了チェック
//	<戻り値>	TRUE	だれかがやめるをえらんだ
//				FALSE
//-------------------------------------------------------------
int CommEventEndCheck( void )
{
	return check_any_comm_status( MPSTAT_EXIT );
}

//-------------------------------------------------------------
//イベント開始待ちスタート
//-------------------------------------------------------------
int CommEventWaitStart( void )
{
	SetControlCommFunc( comm_start_control );
	return 0;
}

//-------------------------------------------------------------
//イベント開始待ちキャンセル
//-------------------------------------------------------------
int CommEventWaitCancel( void )
{
	SetControlCommFunc( comm_event_control );
	return 0;
}

//-------------------------------------------------------------
//通信終了スタート
//-------------------------------------------------------------
int CommExitWaitStart( void )
{
	SetControlCommFunc( comm_exit_control );
	return 0;
}

//==============================================================
//	簡易イベント起動チェック
//==============================================================
//-------------------------------------------------------------
//	プレイヤー状態を設定
//-------------------------------------------------------------
static void get_p_stat( int number, int my_id, P_STAT * ps )
{
	s16 x,y;

	ps->number = number;
	ps->is_myself = ( number==my_id ) ? TRUE : FALSE ;
	ps->mv_state = Player[number].mv_status;
	ps->site = GetPlayerSite( number );
	GetPlayerPos( number, &x, &y );
	ps->pos.x = x;
	ps->pos.y = y;
	ps->pos.z = GetPlayerHeight( number );
	ps->attr = GetCellAttribute( x, y );
}



//	FIFO解消イベントチェック
static int comm_fifo_event_check( const P_STAT * ps )
{
	if ( ps->mv_state == EV_M_END || ps->mv_state == EV_M_OFF ) return TRUE;
	return FALSE;
}

//	メニューイベントチェック
static int comm_menu_event_check( const P_STAT * ps )
{
	if ( ps->mv_state == EV_M_END || ps->mv_state == EV_M_OFF ) return TRUE;
	return FALSE;
}

//	POSイベントチェック
static const VM_CODE * comm_pos_event_check( const P_STAT * ps )
{
	if ( ps->mv_state != EV_M_END ) return NULL;
	return EventPosEasyCheck( &(ps->pos) );
}

//	出口イベントチェック
static int comm_exit_event_check( const P_STAT * ps )
{
	if ( ps->mv_state == EV_M_END || ps->mv_state == EV_M_OFF ) {
		if ( ATR_ExitMatDownEnableCheck(ps->attr) && ps->site == SITE_DOWN ) {
			return TRUE;
		}
	}
	return FALSE;
}

//	話しかけイベントチェック
//	※CommSetTalkTrainerInfoで対象を指定している。注意
static const VM_CODE * comm_talk_event_check( const P_STAT * ps )
{
	const VM_CODE * event;
	EV_POS	ev_pos;
	u8 no;

	if ( ps->mv_state != EV_M_OFF && ps->mv_state != EV_M_END ) return NULL;
	ev_pos = ps->pos;
	ev_pos.x += SiteVector[ps->site].dx;
	ev_pos.y += SiteVector[ps->site].dy;
	ev_pos.z = 0;

	no = CheckTalkPlayer(ev_pos.x,ev_pos.y);
	if ( no != COMM_PLAYER_MAX ) {
		if (ps->is_myself == FALSE) {
			//なんでもいいけど自分じゃないのでOKサインとしてスクリプトを返す
			return ev_comm_talk_busy;
		}
		else if ( comm_status[no] != MPSTAT_NOTHING ) {
			//取り込み中
			return ev_comm_talk_busy;
		}
		else if ( CommSetTalkTrainerInfo(no) == 0 ) {
			//単なるカード
			return ev_comm_look_normal_card;
		}
		else {
			//ランク付きカードだ！
			return ev_comm_look_special_card;
		}
	}

	event = EvObjEasyTalkCheck(&ev_pos,ps->attr,ps->site);

	return event;
}

//==============================================================
//	POSイベントの種類で強制的に向かせる方向を取得する
//==============================================================
extern const u8	ev_comm_battle0_start[];
extern const u8	ev_comm_battle1_start[];
extern const u8	ev_comm_trade0_start[];
extern const u8	ev_comm_trade1_start[];
extern const u8	ev_comm_record0_start[];
extern const u8	ev_comm_record2_start[];
extern const u8	ev_comm_record1_start[];
extern const u8	ev_comm_record3_start[];
extern const u8	ev_comm_multi_battle0_start[];
extern const u8	ev_comm_multi_battle2_start[];
extern const u8	ev_comm_multi_battle1_start[];
extern const u8	ev_comm_multi_battle3_start[];

static u16 comm_get_site_by_pos_event( const VM_CODE * scr )
{
	if (scr == ev_comm_multi_battle0_start)	return HCMD_RIGHT_SITE;
	if (scr == ev_comm_multi_battle1_start)	return HCMD_LEFT_SITE;
	if (scr == ev_comm_multi_battle2_start)	return HCMD_RIGHT_SITE;
	if (scr == ev_comm_multi_battle3_start)	return HCMD_LEFT_SITE;

	if (scr == ev_comm_record0_start)		return HCMD_RIGHT_SITE;
	if (scr == ev_comm_record1_start)		return HCMD_LEFT_SITE;
	if (scr == ev_comm_record2_start)		return HCMD_RIGHT_SITE;
	if (scr == ev_comm_record3_start)		return HCMD_LEFT_SITE;

	if (scr == ev_comm_battle0_start)		return HCMD_RIGHT_SITE;
	if (scr == ev_comm_battle1_start)		return HCMD_LEFT_SITE;

	if (scr == ev_comm_trade0_start)		return HCMD_RIGHT_SITE;
	if (scr == ev_comm_trade1_start)		return HCMD_LEFT_SITE;

	return HCMD_NOTHING;
}

//==============================================================
//	通信中イベント起動
//==============================================================
// FIFO解消イベント
static void comm_fifo_event_start( void )
{
	SetForceEvent();
}

// メニューイベント
static void comm_menu_event_start( void )
{
	SePlay(SE_WIN_OPEN);
	StartFieldMenuEvent();
	SetForceEvent();
}

// POSイベント
static void comm_pos_event_start( const VM_CODE * script )
{
	SePlay( SE_SELECT );
	StartFieldScript( script );
	SetForceEvent();
}

//出口イベント
static void comm_exit_event_start( void )
{
	SePlay(SE_WIN_OPEN);
	StartFieldScript( ev_comm_exit_check );
	SetForceEvent();
}

//話しかけイベント
static void comm_talk_event_start( const VM_CODE * script )
{
	SePlay( SE_SELECT );
	StartFieldScript( script );
	SetForceEvent();
}

//終了イベント
static void comm_end_event_start( void )
{
	StartFieldScript( ev_comm_exit_start );
	SetForceEvent();
}


//==============================================================
//
//	FIFO解消可能かどうかのチェック
//
//==============================================================
extern int IsMultiSioFieldSyncMode(void);	//cable2.c

//-------------------------------------------------------------
//受信FIFOの解消待ち
//<戻り値>	TRUE	解消待ち中
//			FALSE	解消待ち終了
//-------------------------------------------------------------
int FieldRecvFifoClearWait( void )
{
	if ( IsFieldCommMode() == FALSE ) return FALSE;

	if ( M_s.RecvBuf.Size > FLD_RFIFO_LIMIT_VALUE ) {
		field_recv_fifo_clear_flag = TRUE;
	} else {
		field_recv_fifo_clear_flag = FALSE;
	}
	return field_recv_fifo_clear_flag;
}

//-------------------------------------------------------------
//受信FIFOの解消を許可するか?
//-------------------------------------------------------------
int IsEnableClearRecvFifo( void )
{
	if ( IsFieldCommMode() != TRUE ) return FALSE;
	if ( IsMultiSioFieldSyncMode() != TRUE ) return FALSE;

	// FIFO解消モード中！
	if ( comm_ctrl_func == comm_rfifo_event_control ) return TRUE;

	// イベント中
	if ( comm_ctrl_func == comm_event_control ) {
		u8 flag = field_recv_fifo_clear_flag;
		field_recv_fifo_clear_flag = FALSE;
		if ( flag == TRUE ) {
			return TRUE;
		}

		if ( FadeData.fade_sw == 1 && FadeData.fade_end == 1 ) {
			return TRUE;
		}
	}

	return FALSE;
}

//-------------------------------------------------------------
//送信FIFOの解消を許可するか?
//-------------------------------------------------------------
int IsEnableClearSendFifo( void )
{
	if ( IsFieldCommMode() != TRUE ) return FALSE;
	if ( IsMultiSioFieldSyncMode() != TRUE ) return FALSE;

	// FIFO解消モード中！
	if ( comm_ctrl_func == comm_sfifo_event_control ) {
		return TRUE;
	}

	return FALSE;
}

//-------------------------------------------------------------
//メイン処理のスキップを許可するか?
//-------------------------------------------------------------
int IsEnableSkipFieldMain( void )
{
	if ( IsMultiSioFieldSyncMode() == FALSE ) return FALSE;
	DEBUG_SIO_INFO_INC(1,comm_my_id);
	return TRUE;
}

