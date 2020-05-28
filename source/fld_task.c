//=========================================================================
//	
//	フィールド制御用タスク関連
//
//	2001.06.08 by tama
//=========================================================================


#include "common.h"
#include "task.h"

#include "fld_main.h"
#include "evobj.h"
#include "jiki.h"
#include "map_attr.h"
#include "palanm.h"
#include "fieldmap.h"
#include "fld_tool.h"
#include "initgame.h"
#include "weather.h"
#include "mapbg.h"
#include "ev_flag.h"
#include "script.h"
#include "mus_tool.h"
#include "mapparam.h"
#include "ev_comm.h"
#include "laster.h"
#include "calctool.h"
#include "pokesio.h"
#include "screen.h"
#include "print.h"
#include "menu.h"
#include "fld_menu.h"

#define FLD_TASK_H_GLOBAL
#include "fld_task.h"


// GetBright() で取得できる値と対応している
const u16 BrightRange[] = { 200, 72, 56, 40, 24 };

const int FIELD_BRIGHT_MAX = NELEMS(BrightRange) - 1;

//==============================================================
//
//	フェード設定関数
//
//==============================================================

static int pal_fadein_wait(void);
static int pal_fadeout_wait(void);
//-------------------------------------------------------------
//-------------------------------------------------------------
//白のパレットで塗りつぶし
void SetFieldPaletteWhite(void)
{
	CpuFastClear(0x7fff7fff, PaletteWorkTrans, PLTT_SIZE);
}

//黒のパレットで塗りつぶし
void SetFieldPaletteBlack(void)
{
	CpuFastClear(0, PaletteWorkTrans, PLTT_SIZE);
}


extern u8	FieldFadeOutCheck(u8 NowType,u8 NextType);
extern u8	FieldFadeInCheck(u8 NowType,u8 NextType);
//-------------------------------------------------------------
//	現在のマップと前のマップのタイプからフェードインをセット
//-------------------------------------------------------------
void FieldFadeInSet( void )
{
	switch( FieldFadeInCheck( GetBeforeMapType(), GetNowMapType() ) ) 
	{
	case 0:
		FieldFadeControl( FIELD_BLACK_IN, 0);
		//黒のパレットで塗りつぶし
		SetFieldPaletteBlack();
		break;
	case 1:
		FieldFadeControl( FIELD_WHITE_IN, 0);
		//白のパレットで塗りつぶし
		SetFieldPaletteWhite();
		break;
	}
}

//-------------------------------------------------------------
//	黒からのフェードインをセット
//	※転送問題の解消のためPaletteWorkTransを直接初期化している
//-------------------------------------------------------------
void FieldFadeBlackInSet( void )
{
	FieldFadeControl( FIELD_BLACK_IN, 0);
	SetFieldPaletteBlack();
}

//-------------------------------------------------------------
//	現在のマップと次のマップのタイプからフェードアウトをセット
//-------------------------------------------------------------
void FieldFadeOutSet( void )
{
	switch( FieldFadeOutCheck( GetNowMapType(), (GetNextMapData())->type ) )
	{
	case 0:
		FieldFadeControl( FIELD_BLACK_OUT, 0);
		break;
	case 1:
		FieldFadeControl( FIELD_WHITE_OUT, 0);
		break;
	}
}

//==============================================================
//
//==============================================================

static void ChangeHeroVisible(u8 sw)
{
	SetHeroObjVanish( !sw );
}

//==============================================================
//
//	マップ復帰制御関連
//
//==============================================================
static void CtrlTask_NormalIn(u8 my_no);
static void CtrlTask_DoorOut(u8 my_no);
static void CtrlTask_StepOut(u8 my_no);

// 通信同期関連
extern u8 AddNinshouRoomTask(void);

// ドアアニメーション関連
extern s8 AddCloseDoorAnimeTask(int px,int py);
extern s8 AddOpenDoorAnimeTask(int px,int py);
extern void OpenDoorCellSet( int px, int py );
extern void CloseDoorCellSet( int px, int py );
//	ドアの種類でＳＥのタイプを判別
extern u16 GetDoorSENumber(int px, int py);

extern u8 EvWaitHeroMoveEnd(void);

//-------------------------------------------------------------
//	スクリプト動作中への復帰処理
//-------------------------------------------------------------
static void script_fade_watch_task( u8 my_no )
{
	if (pal_fadein_wait() == TRUE) {
		DelTask(my_no);
		ContinueFieldScript();
	};
}

void AddScriptFieldInTask(void)
{
	SetForceEvent();
	MapBGM_Start();
	FieldFadeBlackInSet();
	AddTask( script_fade_watch_task, TSK_PRI_CONTROL );
}

void AddScriptFieldInBGMNotStartTask(void)
{
	SetForceEvent();
//	MapBGM_Start();
	FieldFadeBlackInSet();
	AddTask( script_fade_watch_task, TSK_PRI_CONTROL );
}

//-------------------------------------------------------------
//	フィールド通信同期時の復帰処理
//-------------------------------------------------------------
static void comm_fade_watch_task( u8 no )
{
	TASK_TABLE *my;

	my = &TaskTable[no];

	switch (my->work[0]) {

	case 0:
		my->work[1] = AddNinshouRoomTask();
		my->work[0]++;
		break;

	case 1:
		if (TaskTable[my->work[1]].occ == 1) break;
		FieldFadeInSet();
		my->work[0]++;
		break;
		
	case 2:
		if (pal_fadein_wait() == TRUE) {
			ResetForceEvent();
			DelTask(no);
		}
		break;
	}
}

void AddCommFieldInTask(void)
{
	SetForceEvent();
	MapBGM_Start();
	SetFieldPaletteBlack();
	AddTask( comm_fade_watch_task, TSK_PRI_CONTROL );
}


static void comm_start_task( u8 no )
{
	TASK_TABLE *my;

	my = &TaskTable[no];

	switch (my->work[0]) {

	case 0:
//		my->work[1] = AddNinshouRoomTask();
		SetSioSynchronize();
		my->work[0]++;
		break;

	case 1:
//		if (TaskTable[my->work[1]].occ == 1) break;
		if(SplitDataSendStatus()==0) break;
		FieldFadeInSet();
		my->work[0]++;
		break;
		
	case 2:
		if (pal_fadein_wait() == TRUE) {
			MultiSioFieldSyncStart();
			ResetForceEvent();
			DelTask(no);
		}
		break;
	}
}

void AddCommFieldStartTask(void)
{
	SetForceEvent();
	MapBGM_Start();
	SetFieldPaletteBlack();
	AddTask( comm_start_task, TSK_PRI_CONTROL );
}

//-------------------------------------------------------------
// フィールド出現演出用のタスクセット
//-------------------------------------------------------------
static void add_step_out_task( void )
{
	pTaskFunc task;
	u16 attr;
	s16 px, py;

	GetHeroCellPos( &px, &py );
	attr = GetCellAttribute( px, py );

	if ( ATR_DoorEffectCheck( attr ) == TRUE ) {
		task = CtrlTask_DoorOut;
	}
	else if ( ATR_IsWallExitCheck( attr ) == TRUE ) {
		task = CtrlTask_StepOut;
	}
	else {
		task = CtrlTask_NormalIn;
	}
	
	AddTask( task, TSK_PRI_CONTROL );
}


void AddFieldInTask(void)
{
	MapBGM_Start();
	FieldFadeInSet();
	add_step_out_task();
	SetForceEvent();
}


void AddFieldBlackInTask( void )
{
	MapBGM_Start();
	FieldFadeBlackInSet();
	add_step_out_task();
	SetForceEvent();
}

//-------------------------------------------------------------
// ワープ後のフィールド出現演出用のタスクセット	02/02/28 nohara
//-------------------------------------------------------------
void AddFieldInWarpTask(void)
{
	MapBGM_Start();
	FieldFadeInSet();
	SePlay( SE_TK_WARPOUT );	//AddFieldInTask()との違いはここのみ
	AddTask( CtrlTask_NormalIn, TSK_PRI_CONTROL);
	SetForceEvent();
}

//----------------------------
//制御タスク：ドアから出る
//----------------------------
enum{
		DOOROUT_INIT,
		DOOROUT_FADEWAIT,
		DOOROUT_ANMWAIT,
		DOOROUT_CLOSEWAIT,
		DOOROUT_END,
};

static void CtrlTask_DoorOut(u8 my_no)
{
	TASK_TABLE * my = &TaskTable[my_no];
	s16 * px = &(my->work[2]);	/* 出現X位置 */
	s16 * py = &(my->work[3]);	/* 出現Y位置 */

	switch( my->work[0] )
	{
		case DOOROUT_INIT:
			ChangeHeroVisible(OFF);
			EvObjPauseAll();
			GetHeroCellPos( px, py );
			OpenDoorCellSet( *px, *py );
			my->work[0] = DOOROUT_FADEWAIT;
			break;

		/* フェードインを待つ */
		case DOOROUT_FADEWAIT:
			if (pal_fadein_wait() == FALSE) break;

			ChangeHeroVisible(ON);
			AcmdSet( EvObjSpWorkAdrs(EV_OBJ_SPID), AC_WALK_D_1 );
			my->work[0] = DOOROUT_ANMWAIT;
			break;

		/* 自機の移動アニメを待つ */
		case DOOROUT_ANMWAIT:
			if( EvWaitHeroMoveEnd() == FALSE )break;

			my->work[1] = AddCloseDoorAnimeTask(*px,*py);
			AcmdEnd( EvObjSpWorkAdrs(EV_OBJ_SPID) );
			my->work[0] = DOOROUT_CLOSEWAIT;
			break;

		/* ドアが閉まるアニメを待つ */
		case DOOROUT_CLOSEWAIT:
			if(my->work[1] >= 0 && TaskTable[my->work[1]].occ == 1)break;

			EvObjPauseClrAll();
			my->work[0] = DOOROUT_END;
			break;

		case DOOROUT_END:
			ResetForceEvent();
			DelTask(my_no);
			break;

	};
};

//----------------------------
//制御タスク：出現時に一歩前に出る
//----------------------------
enum{
		STEPOUT_INIT,
		STEPOUT_FADEWAIT,
		STEPOUT_ANMWAIT,
		STEPOUT_END,
};

static void CtrlTask_StepOut(u8 my_no)
{
	TASK_TABLE * my = &TaskTable[my_no];
	s16 * px = &(my->work[2]);	/* 出現X位置 */
	s16 * py = &(my->work[3]);	/* 出現Y位置 */

	switch( my->work[0] )
	{
		case STEPOUT_INIT:
			ChangeHeroVisible( OFF );
			EvObjPauseAll();
			GetHeroCellPos( px, py );
			my->work[0] = STEPOUT_FADEWAIT;
			break;
		/* フェードインを待つ */
		case STEPOUT_FADEWAIT:
			if (pal_fadein_wait() == FALSE) break;
			ChangeHeroVisible(ON);
			AcmdSet( EvObjSpWorkAdrs(EV_OBJ_SPID), AcmdCodeWalk1(GetHeroSite()) );
			my->work[0] = STEPOUT_ANMWAIT;
			break;
		/* 自機の移動アニメを待つ */
		case STEPOUT_ANMWAIT:
			if( EvWaitHeroMoveEnd() == FALSE )break;
			EvObjPauseClrAll();
			my->work[0] = STEPOUT_END;
			break;
		case STEPOUT_END:
			ResetForceEvent();
			DelTask(my_no);
			break;
	};
}

//----------------------------
//制御タスク：フィールド出現
//----------------------------
enum{
		MAPIN_INIT,
		MAPIN_FADEWAIT,
		MAPIN_END,
};

static void CtrlTask_NormalIn(u8 my_no)
{

	switch (TaskTable[my_no].work[0]) {

	case 0:
		EvObjPauseAll();
		SetForceEvent();
		TaskTable[my_no].work[0]++;
		break;

	case 1:
		if (pal_fadein_wait() == FALSE) 
			break;

		EvObjPauseClrAll();
		ResetForceEvent();
		DelTask(my_no);
		break;
	}
}

//-------------------------------------------------------------
//	フィールドメニューへ復帰
//-------------------------------------------------------------

static void CtrlTask_MenuIn(u8);

//----------------------------
//	制御タスク：メニュー復帰
//----------------------------
static void CtrlTask_MenuIn(u8 my_no)
{
	if (pal_fadein_wait() == TRUE) {
		DelTask(my_no);
		AddTask(FieldMenuFuncTask,TSK_PRI_EFFECT);
	}
}


void AddFieldMenuInTask(void)
{
	FieldFadeBlackInSet();
	FieldMenuInitTaskSet( CtrlTask_MenuIn );
	SetForceEvent();
}

//-------------------------------------------------------------
//	フィールド復帰→イベント終了
//-------------------------------------------------------------
extern void TalkEnd(void);

static void event_end_fade_watch_task( u8 my_no )
{
	if (pal_fadein_wait() == TRUE) {
		ResetForceEvent();
		DelTask(my_no);
		TalkEnd();
	};
}

//----------------------------
//	制御タスク：フィールド復帰→イベント終了
//----------------------------
void AddFieldEventEndFadeInTask(void)
{
	SetForceEvent();
//	MapBGM_Start();
	FieldFadeBlackInSet();
	AddTask( event_end_fade_watch_task, TSK_PRI_CONTROL );
}

//----------------------------
//	制御タスク：フィールド復帰→イベント終了
//----------------------------
void AddFieldEncountEndFadeInTask(void)
{
	SetForceEvent();
	MapBGM_Start();
	FieldFadeBlackInSet();
	AddTask( event_end_fade_watch_task, TSK_PRI_CONTROL );
}

//==============================================================
//
//	マップ遷移制御関連
//
//==============================================================

static void CtrlTask_MapChange(u8 my_no);
static void CtrlTask_DoorIn( u8 my_no );

//-------------------------------------------------------------
//-------------------------------------------------------------
static int pal_fadeout_wait(void)
{
	return FadeData.fade_sw;
}
//-------------------------------------------------------------
//-------------------------------------------------------------
static int pal_fadein_wait(void)
{
	if (FieldFadeinCheck() == 1)
		return TRUE;
	else
		return FALSE;
}

//-------------------------------------------------------------
// マップ遷移の移行コントロール用タスクセット
//-------------------------------------------------------------
void AddMapChangeTask(void)
{
	SetForceEvent();
	MapBGM_FadeOutSet();
	FieldFadeOutSet();
	StopRainSound();
	SePlay( SE_KAIDAN );
	pFieldRecoverFunc = AddFieldInTask;
	AddTask(CtrlTask_MapChange,TSK_PRI_CONTROL);
};

//-------------------------------------------------------------
// マップ遷移の移行コントロール用タスクセット(SEなし)
//-------------------------------------------------------------
void AddMapChangeSeNotTask(void)
{
	SetForceEvent();
	MapBGM_FadeOutSet();
	FieldFadeOutSet();
	StopRainSound();
	pFieldRecoverFunc = AddFieldInTask;
	AddTask(CtrlTask_MapChange,TSK_PRI_CONTROL);
};

//-------------------------------------------------------------
//ドアに入ってマップ遷移する時のコントロールタスクセット
//-------------------------------------------------------------
void AddDoorMapChangeTask( void )
{
	SetForceEvent();
	pFieldRecoverFunc = AddFieldInTask;
	AddTask( CtrlTask_DoorIn, TSK_PRI_CONTROL );
}

//-------------------------------------------------------------
//落とし穴落下時のｺﾝﾄﾛｰﾙﾀｽｸｾｯﾄ
//-------------------------------------------------------------
void AddMapChangeFallTask( void )
{
	AddMapChangeSeNotTask();
	pFieldRecoverFunc = FieldInitFallTask;
}

//-------------------------------------------------------------
//	ｴｽｶﾚｰﾀ移動時のｺﾝﾄﾛｰﾙﾀｽｸｾｯﾄ
//-------------------------------------------------------------
void AddMapChangeEscalatorTask( u8 attr )
{
	SetForceEvent();
	SetMapChangeEscalatorTask( attr, TSK_PRI_CONTROL );
}

//-------------------------------------------------------------
//	間欠泉のｺﾝﾄﾛｰﾙﾀｽｸｾｯﾄ
//-------------------------------------------------------------
void AddMapChangeGayserTask( void )
{
	SetForceEvent();
	SetMapChangeGayser( TSK_PRI_CONTROL );
}

//-------------------------------------------------------------
//	間欠泉のｺﾝﾄﾛｰﾙﾀｽｸｾｯﾄ
//-------------------------------------------------------------
void AddMapChangeHidePitFallTask( void )
{
	SetForceEvent();
	SetMapChangeHidePitFall( TSK_PRI_CONTROL );
}

//-------------------------------------------------------------
//ワープ(トクサネジム)のｺﾝﾄﾛｰﾙﾀｽｸｾｯﾄ
//-------------------------------------------------------------
void AddMapChangeWarpTask( void )
{
	SetForceEvent();
	MapBGM_FadeOutSet();
	FieldFadeOutSet();
	SePlay( SE_TK_WARPIN );
	AddTask(CtrlTask_MapChange,TSK_PRI_CONTROL);
	pFieldRecoverFunc = AddFieldInWarpTask;
}

//-------------------------------------------------------------
//	高速船デモモードへ遷移するコントロールタスクセット
//-------------------------------------------------------------
extern void AddFieldShipInTask(void);
void AddMapChangeShipTask( void )
{
	SetForceEvent();
//	MapBGM_FadeOutSet();
	FieldFadeOutSet();
	AddTask(CtrlTask_MapChange,TSK_PRI_CONTROL);
	pFieldRecoverFunc = AddFieldShipInTask;
}

//-------------------------------------------------------------
//通信部屋に遷移する際のコントロールタスクセット
//-------------------------------------------------------------
static void CtrlTask_CommMapChange(u8 my_no)
{
	TASK_TABLE * my = &TaskTable[my_no];

	switch( my->work[0] )
	{
	case 0:
		SetForceEvent();
		my->work[0] ++;
		break;

	case 1:
		if( pal_fadeout_wait() != 0 )break;
		if( MapBGM_FadeWait() == FALSE )break;
		my->work[0] ++;
		break;

	case 2:
		SetNextWorldPosition();
		MainProcChange( FieldMainCommInit );
		DelTask(my_no);
		break;
	}
}

void AddCommMapChangeTask(void)
{
	SetForceEvent();
	MapBGM_FadeOutSet();
	FieldFadeOutSet();
	SePlay( SE_KAIDAN );
	AddTask(CtrlTask_CommMapChange,TSK_PRI_CONTROL);
}


//-------------------------------------------------------------
//	マップ遷移タスクセット（通信部屋から終了して出る場合）
//-------------------------------------------------------------
extern u8 pokemon_sio_flag;

static void CtrlTask_CommEndMapChange( u8 no )
{
	s16 * wk = TaskTable[no].work;

	switch ( wk[0] ) {
	case 0:
		MultiSioFunctionClear();
		FieldFadeControl( FIELD_BLACK_OUT, 0 );
		MapBGM_FadeOutSet();
		SePlay( SE_KAIDAN );
		wk[0]++; break;
	case 1:
		if ( pal_fadeout_wait() != 0 ) break;
		if ( MapBGM_FadeWait() == FALSE ) break;
		SetSioEndDataStart();
		wk[0]++; break;
	case 2:
		if ( pokemon_sio_flag == 0 ) {
			SetNextWorldPosition();
			MainProcChange( FieldMainInit );
			DelTask( no );
		}
	}
}

void AddCommEndMapChangeTask( void )
{
	AddTask( CtrlTask_CommEndMapChange, TSK_PRI_CONTROL );
}

#ifdef	PM_DEBUG
//-------------------------------------------------------------
// デバッグ用マップ切り替えタスクのセット
//-------------------------------------------------------------
void AddDebugMapChangeTask(void)
{
	DebugSetNextMap();
	AddMapChangeTask();
	SetForceEvent();
}
#endif	PM_DEBUG

//----------------------------
//制御タスク：マップ変更
//※このタスクを呼ぶ前にpFieldRecoverFuncを
//　セットしておかなければいけない
//----------------------------
static void CtrlTask_MapChange(u8 my_no)
{
	TASK_TABLE * my = &TaskTable[my_no];

	switch( my->work[0] )
	{
	case 0:
		EvObjPauseAll();
		SetForceEvent();
		my->work[0] ++;
		break;

	case 1:
		if( pal_fadeout_wait() != 0 )break;
		if( MapBGM_FadeWait() == FALSE )break;
		my->work[0] ++;
		break;

	case 2:
	//	ここで解除するとタイミングにより問題が発生するのでポーズのまま
	//	EvObjPauseClrAll();
		SetNextWorldPosition();
		MainProcChange( FieldMainInit );
		DelTask(my_no);
		break;
	}
}


//----------------------------
//制御タスク：ドアに入る
//----------------------------
enum{
	DOORIN_INIT,
	DOORIN_OPENWAIT,
	DOORIN_ANMWAIT,
	DOORIN_CLOSEWAIT,
	DOORIN_END,
};

static void CtrlTask_DoorIn( u8 my_no )
{
	TASK_TABLE * my = &TaskTable[my_no];
	s16 * px = &(my->work[2]);	/* 出現X位置 */
	s16 * py = &(my->work[3]);	/* 出現Y位置 */

	switch( my->work[0] )
	{
		case DOORIN_INIT:
			EvObjPauseAll();
			GetHeroCellPos( px, py );
		//	SePlay( SE_DOOR );
			SePlay(GetDoorSENumber(*px, *py-1));
			my->work[1] = AddOpenDoorAnimeTask( *px, *py - 1 );
			my->work[0] = DOORIN_OPENWAIT;
			break;

		/* ドアの開くアニメーションを待つ */
		case DOORIN_OPENWAIT:
			if(my->work[1] >= 0 && TaskTable[my->work[1]].occ == 1)break;

			AcmdFree( EvObjSpWorkAdrs(EV_OBJ_SPID) );
			AcmdSet( EvObjSpWorkAdrs(EV_OBJ_SPID), AC_WALK_U_1 );
			my->work[0] = DOORIN_ANMWAIT;
			break;

		/* 自機の移動アニメを待つ */
		case DOORIN_ANMWAIT:
			if( EvWaitHeroMoveEnd() == FALSE )break;

			my->work[1] = AddCloseDoorAnimeTask( *px, *py - 1 );
			AcmdEnd( EvObjSpWorkAdrs(EV_OBJ_SPID) );
			ChangeHeroVisible(OFF);
			my->work[0] = DOORIN_CLOSEWAIT;
			break;

		/* ドアが閉まるアニメを待つ */
		case DOORIN_CLOSEWAIT:
			if(my->work[1] >= 0 && TaskTable[my->work[1]].occ == 1)break;

//			EvObjPauseClrAll();
			my->work[0] = DOORIN_END;
			break;

		case DOORIN_END:
			MapBGM_FadeOutSet();
			FieldFadeOutSet();
			StopRainSound();
			my->work[0] = 0;
			my->TaskAdrs = CtrlTask_MapChange;
			break;

	};
};


//----------------------------
//制御タスク:通信コンテスト用マップ切り替え
//----------------------------
static void CtrlTask_MapChangeContest(u8 my_no)
{
	TASK_TABLE * my = &TaskTable[my_no];

	switch ( my->work[0] ) {
	case 0:
		EvObjPauseAll();
		SetForceEvent();
		my->work[0] ++;
		break;

	case 1:
		if( pal_fadeout_wait() != 0 )break;
		if( MapBGM_FadeWait() == FALSE )break;
		my->work[0] ++;
		break;

	case 2:
	//	EvObjPauseClrAll();
		SetNextWorldPosition();
		MainProcChange( FieldContestInit );
		DelTask(my_no);
		break;
	}
}

//-------------------------------------------------------------
// マップ遷移のタスクセット：通信コンテスト用
//-------------------------------------------------------------
void AddContestMapChangeTask(void)
{
	SetForceEvent();
	MapBGM_FadeOutSet();
	FieldFadeOutSet();
	StopRainSound();
	SePlay( SE_KAIDAN );
	pFieldRecoverFunc = AddFieldBlackInTask;
	AddTask(CtrlTask_MapChangeContest,TSK_PRI_CONTROL);
}



//=========================================================================
//
//	フィールド視界制御
//
//	※AGBのウィンドウ機能を使用して円形の視界制限演出を行う
//	　フラッシュ、ムロジムのトラップに使用
//
//=========================================================================

static void make_circle_data( u16 * buf, int xc, int yc, int r );

enum{
	SCRN_CENTER_X = 120,
	SCRN_CENTER_Y = 80,
};

//--------------------------------------------------------------
//	ラスターバッファに円形データをセット
//--------------------------------------------------------------
static void set_pos_data( u16 * buf, int offset, int l_value, int r_value )
{
	if (offset < 0 || offset > 160) return;

	if ( l_value < 0 ) l_value = 0;
	if ( l_value > 255 ) l_value = 255;
	if ( r_value < 0 ) r_value = 0;
	if ( r_value > 255 ) r_value = 255;

	buf[offset] = ( l_value << 8 ) | r_value;
}

static void make_circle_data( u16 * buf, int xc, int yc, int r )
{
	int x,y;

	x = r; y = 0;

	while ( x >= y ) {
		set_pos_data(buf,yc-y,xc-x,xc+x);
		set_pos_data(buf,yc+y,xc-x,xc+x);
		set_pos_data(buf,yc-x,xc-y,xc+y);
		set_pos_data(buf,yc+x,xc-y,xc+y);

		r -= (y<<1) - 1;
		y++;
		if ( r < 0 ) {
			r += (x-1) << 1;
			x--;
		}
	}
}

//--------------------------------------------------------------
//	視界変更の演出用タスク
//--------------------------------------------------------------
enum{
	HDWK_SEQ,		//シーケンス
	HDWK_X,			//表示中心Ｘ座標
	HDWK_Y,			//表示中心Ｙ座標
	HDWK_R,			//現在の半径
	HDWK_R_END,		//到達半径
	HDWK_DIFF,		//視界の広がり修正値
	HDWK_SWITCH,	//TRUEのとき演出終了時にラスターも終了させる
};

static void laster_change_task( u8 no )
{
	s16 *wk = TaskTable[no].work;

	switch ( wk[HDWK_SEQ] ) {
	case 0:
		make_circle_data( LasterBuffer[LasterSys.BufFlag],
				wk[HDWK_X], wk[HDWK_Y], wk[HDWK_R] );
		wk[HDWK_SEQ] = 1;
		break;

	case 1:
		make_circle_data( LasterBuffer[LasterSys.BufFlag],
				wk[HDWK_X], wk[HDWK_Y], wk[HDWK_R] );
		wk[HDWK_SEQ] = 0;
		wk[HDWK_R] += wk[HDWK_DIFF];
		if ( wk[HDWK_R] > wk[HDWK_R_END] ) {
			if ( wk[HDWK_SWITCH] == TRUE ) {
				LasterInit();	//HDMAを停止
				wk[HDWK_SEQ] = 2;
				break;
			} else {
				DelTask(no);
			}
		}
		break;

	case 2:
		LasterWorkInit();
		DelTask(no);
		return;
	}
}

static void laster_end_wait_task( u8 no )
{
	if ( CheckTask( laster_change_task ) ) return;
	ContinueFieldScript();
	DelTask(no);
}

static void add_laster_end_wait_task( void )
{
	if ( CheckTask( laster_end_wait_task ) ) return;
	AddTask( laster_end_wait_task, TSK_PRI_EFFECT );
}

static u8 add_laster_change_task( int x, int y, int start, int end, int sw, u8 speed )
{
	u8 no;
	s16 * wk;
	no = AddTask( laster_change_task, TSK_PRI_EFFECT );
	wk = TaskTable[no].work;
	wk[HDWK_R] = start;
	wk[HDWK_R_END] = end;
	wk[HDWK_X] = x;
	wk[HDWK_Y] = y;
	wk[HDWK_SWITCH] = sw;
	if ( start < end ) {
		wk[HDWK_DIFF] = 1 * speed;
	} else {
		wk[HDWK_DIFF] = -1 * speed;
	}
	return no;
}

//==============================================================
//
//	視界を大きくする演出開始
//
//==============================================================
void StartFieldLasterChange( u8 next )
{
	u8 start,sw;
	start = GetBright();
	sw = ( next == 0 ) ? TRUE : FALSE ;

	add_laster_change_task( SCRN_CENTER_X, SCRN_CENTER_Y,
			BrightRange[start],BrightRange[next], sw, 1 );
	add_laster_end_wait_task();
	SetForceEvent();
}

//==============================================================
//
//	最初の視界制限ウィンドウ用データ生成
//
//==============================================================
void MakeFieldLasterData( u8 r )
{
	if ( r == 0 ) return;
	make_circle_data( (LasterBuffer[0]), SCRN_CENTER_X, SCRN_CENTER_Y, BrightRange[r] );
	CpuFastCopy(  &(LasterBuffer[0]), &(LasterBuffer[1]), sizeof(LasterBuffer[0]) );
}


//=========================================================================
//
//
//		宝玉のエフェクト
//
//
//	※文字表示用のパレットを塗りつぶし､空白文字で画面を覆い尽くす。
//	　その文字表示ＢＧとその他のＢＧ／ＯＢＪとの間にαブレンドを行っている
//=========================================================================

//--------------------------------------------------------------
//--------------------------------------------------------------
static const LasterData eff_laster_data =
{
	(void *)REG_WIN0H,
	H_DMA_ENABLE16,
	LASTER_NORMAL,
	0,
};


//--------------------------------------------------------------
//--------------------------------------------------------------
enum{
	EFF_TYPE_RED = 0,
	EFF_TYPE_BLUE,
};

//タスクのワーク使用定義
enum{
	WK_SEQ = 0,
	WK_TYPE,
	WK_XPOS,
	WK_YPOS,
	WK_COUNT,
	WK_FLAG,

	SV_REG_DISPCNT,
	SV_REG_BLDCNT,
	SV_REG_BLDALPHA,
	SV_REG_WININ,
	SV_REG_WINOUT,
};

//タスク動作シーケンス定義
enum{
	SEQ_JEWEL_INIT,
	SEQ_JEWEL_LASTER_START,
	SEQ_JEWEL_LASTER_WAIT,
	SEQ_JEWEL_SHAKE_INIT,
	SEQ_JEWEL_SHAKE,
	SEQ_JEWEL_FINISH,
	SEQ_JEWEL_ERASE_INIT,
	SEQ_JEWEL_ERASE,
};

//--------------------------------------------------------------
//	宝玉エフェクト用パレット変更
//	※フィールドで文字表示に使用しているパレットを変更する
//--------------------------------------------------------------
static void set_jewel_color( u8 col )
{
	int i;
	u16 pal[1];

	if ( col == EFF_TYPE_RED ) {
		pal[0] = 0x001f;
	} else {
		pal[0] = 0x7c00;
	}
	for (i=0;i<16;i++) PaletteWorkSet( pal, F_PAL*16+i, 2 );
}
//--------------------------------------------------------------
//--------------------------------------------------------------
static u8 decrease_blend( u16 sw )
{
	u8 eva,evb;
	eva = 0xff & *(vu16*)REG_BLDALPHA;
	evb = *(vu16*)REG_BLDALPHA >> 8;
	if ( sw ) {
		if ( eva > 0 ) eva --;
	} else {
		if ( evb < 0x10 ) evb ++;
	}
	*(vu16*)REG_BLDALPHA = eva | ( evb << 8 );
	if ( eva == 0 && evb == 0x10 ) {
		return TRUE;
	} else {
		return FALSE;
	}
}

//--------------------------------------------------------------
//--------------------------------------------------------------
static void jewel_effect_task( u8 no )
{
	s16 * wk = TaskTable[no].work;

	switch ( wk[WK_SEQ] ) {
	case SEQ_JEWEL_INIT:
		wk[SV_REG_DISPCNT] = *(vu16*)REG_DISPCNT;
		wk[SV_REG_BLDCNT] = *(vu16*)REG_BLDCNT;
		wk[SV_REG_BLDALPHA] = *(vu16*)REG_BLDALPHA;
		wk[SV_REG_WININ] = *(vu16*)REG_WININ;
		wk[SV_REG_WINOUT] = *(vu16*)REG_WINOUT;

		*(vu16*)REG_DISPCNT &= DISP_WIN1_ON^0xffff;
		*(vu16*)REG_BLDCNT |= BGblend1stValue[MSG_BG_NO];
		*(vu16*)REG_BLDALPHA = 0x070c;
		*(vu16*)REG_WININ = WIN_ALL_ON;
		*(vu16*)REG_WINOUT = WIN_BG1_ON | WIN_BG2_ON | WIN_BG3_ON | WIN_OBJ_ON ;

		make_circle_data( (LasterBuffer[0]), wk[WK_XPOS], wk[WK_YPOS], 1 );
		CpuFastCopy(  &(LasterBuffer[0]), &(LasterBuffer[1]), sizeof(LasterBuffer[0]) );
		LasterDmaSet( eff_laster_data );
		wk[WK_SEQ] =SEQ_JEWEL_LASTER_START;
		break;

	case SEQ_JEWEL_LASTER_START:
		NMenuBoxWrite( 0,0,29,19 );
		set_jewel_color( wk[WK_TYPE] );
		add_laster_change_task( wk[WK_XPOS], wk[WK_YPOS], 1, 160, TRUE, 2 );
		wk[WK_SEQ] = SEQ_JEWEL_LASTER_WAIT;
		break;
	
	case SEQ_JEWEL_LASTER_WAIT:
		if ( CheckTask(laster_change_task) ) break;
		ContinueFieldScript();		//ひとまず制御をスクリプトに返す
		wk[WK_SEQ] = SEQ_JEWEL_SHAKE_INIT;
		break;

	case SEQ_JEWEL_SHAKE_INIT:
		MapViewInit();
		SetMapViewFunc(NULL);
		wk[WK_FLAG] = 0;
		wk[WK_COUNT] = 4;
		wk[WK_SEQ] = SEQ_JEWEL_SHAKE;
		break;

	case SEQ_JEWEL_SHAKE:
		wk[WK_COUNT] --;
		if ( wk[WK_COUNT] == 0 ) {
			wk[WK_COUNT] = 4;
			wk[WK_FLAG] ^= 1;
			SetMapViewOffset( 0, (wk[WK_FLAG]?4:-4) );
		}
		break;


	case SEQ_JEWEL_ERASE_INIT:
		MapViewInit();
		wk[WK_COUNT] = 8;
		wk[WK_SEQ] = SEQ_JEWEL_ERASE;
		break;

	case SEQ_JEWEL_ERASE:
		wk[WK_COUNT] --;
		if ( wk[WK_COUNT] != 0 ) break;
		wk[WK_COUNT] = 8;
		wk[WK_FLAG] ^= 1;
		if ( decrease_blend(wk[WK_FLAG]) == TRUE ) {
			wk[WK_SEQ] = SEQ_JEWEL_FINISH;
		}
		break;
		
	case SEQ_JEWEL_FINISH:

		NMenuBoxClear( 0,0,29,19 );
		PrintPaletteInit( FIELD_MENU_TYPE );

		*(vu16*)REG_WIN0H = 0x00ff;

		*(vu16*)REG_DISPCNT = (u16)(wk[SV_REG_DISPCNT]);
		*(vu16*)REG_BLDCNT = (u16)(wk[SV_REG_BLDCNT]);
		*(vu16*)REG_BLDALPHA = (u16)(wk[SV_REG_BLDALPHA]);
		*(vu16*)REG_WININ = (u16)(wk[SV_REG_WININ]);
		*(vu16*)REG_WINOUT = (u16)(wk[SV_REG_WINOUT]);

		ContinueFieldScript();
		DelTask(no);
		break;
	}
}


//--------------------------------------------------------------
//	宝玉エフェクト開始
//	<引数>	AnswerWork
//					0	赤い光、相手リーダー中心
//					1	青い光、相手リーダー中心
//					2	赤い光、主人公中心
//					3	青い光、主人公中心
//
//	※光が画面全体を覆ったあと､FinishJewelEffectを
//	　よぶまで待機状態になる
//--------------------------------------------------------------
void StartJewelEffect( void )
{
	s16 * wk;
	u8 no;
	no = AddTask(jewel_effect_task,TSK_PRI_EFFECT);
	wk = TaskTable[no].work;
	if ( AnswerWork == 0 ) {
		wk[WK_TYPE] = EFF_TYPE_RED;
		wk[WK_XPOS] = SCRN_CENTER_X - CELL_SIZE;
		wk[WK_YPOS] = SCRN_CENTER_Y;
	} else if ( AnswerWork == 1 ) {
		wk[WK_TYPE] = EFF_TYPE_BLUE;
		wk[WK_XPOS] = SCRN_CENTER_X - CELL_SIZE;
		wk[WK_YPOS] = SCRN_CENTER_Y;
	} else if ( AnswerWork == 2 ) {
		wk[WK_TYPE] = EFF_TYPE_RED;
		wk[WK_XPOS] = SCRN_CENTER_X;
		wk[WK_YPOS] = SCRN_CENTER_Y;
	} else {
		wk[WK_TYPE] = EFF_TYPE_BLUE;
		wk[WK_XPOS] = SCRN_CENTER_X;
		wk[WK_YPOS] = SCRN_CENTER_Y;
	}

}

//--------------------------------------------------------------
//	宝玉エフェクト終了
//--------------------------------------------------------------
void FinishJewelEffect( void )
{
	u8 no = CheckTaskNo(jewel_effect_task);
	TaskTable[no].work[WK_SEQ] = SEQ_JEWEL_ERASE_INIT;
}

//=========================================================================
//
//	ＢＧＭフェードアウト→終了処理
//
//=========================================================================
static void bgm_end_wait_task(u8 no);
//--------------------------------------------------------------
//--------------------------------------------------------------
void FieldBGMFadeOutEnd(void)
{
	MapBGM_FadeOutEndSet();
	AddTask(bgm_end_wait_task, TSK_PRI_EFFECT);
}

//--------------------------------------------------------------
//--------------------------------------------------------------
static void bgm_end_wait_task(u8 no)
{
	if (MapBGM_FadeWait() == TRUE) {
		DelTask(no);
		ContinueFieldScript();
	}
}

