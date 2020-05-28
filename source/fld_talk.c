//=========================================================================
//
//	フィールドでのメッセージウィンドウ制御
//
//	2001.03.28 by tama
//
//=========================================================================

#include "common.h"
#include "print.h"
#include "window.h"

#include "field.h"

#define FLD_TALK_H_GLOBAL
#include "fld_talk.h"

#include "evobj.h"
#include "evobjmv.h"
#include "jiki.h"
#include "task.h"

#include "palanm.h"
#include "screen.h"
#include "menutool.h"
#include "ev_check.h"
#include "script.h"


static u8 field_msg_status;

static TALK_WIN	fld_win = {};


static void field_msg_set(const u8 * msg_adrs );
static void field_kaiwa_msg_set( void );

//=========================================================================
//	メッセージウィンドウ関連
//=========================================================================

//-------------------------------------------------------------------------
//	初期化処理
//-------------------------------------------------------------------------
void FieldMsgInit(void)
{
	field_msg_status = FLDMSG_STAT_OFF;
	KWinFrameInit( MenuKWinStartNo );
	MsgControlInit( &fld_win, FIELD_MENU_TYPE );
};

//-------------------------------------------------------------------------
//	メッセージ表示の制御
//	※　メインループからタスクとして常に呼ばれる
//-------------------------------------------------------------------------
static void field_msg_task(u8 no)
{
	TASK_TABLE * my = &TaskTable[no];

	switch(my->work[0]){

	case 0:
		KWinFrameChrSet( &fld_win );
		my->work[0]++;
		break;

	case 1:
		KWinFrameScrnWrite( &fld_win );
		my->work[0]++;
		break;

	case 2:
		switch( field_msg_status ){
		case FLDMSG_STAT_NORMAL:
			if( TalkMsgPut( &fld_win ) == 0 ) return;
			break;

		case FLDMSG_STAT_NOSKIP:
			if( NoSkipTalkMsgPut( &fld_win ) == 0 ) return;
			break;
		}
		field_msg_status = FLDMSG_STAT_OFF;
		DelTask(no);
	};
}

static void add_field_msg_task( void )
{
	AddTask( field_msg_task, 80 );
}

static void del_field_msg_task( void )
{
	u8 no;
	no = CheckTaskNo( field_msg_task );
	if ( no == NOT_EXIST_TASK_ID ) return;
	DelTask(no);
}

//-------------------------------------------------------------------------
//　メッセージ表示のセット
//-------------------------------------------------------------------------
u8 FieldMsgSet( const u8 * msg_adrs )
{
	if(field_msg_status != FLDMSG_STAT_OFF) return FALSE;

	field_msg_set( msg_adrs );
	field_msg_status = FLDMSG_STAT_NORMAL;
	return TRUE;
}

//-------------------------------------------------------------------------
//　メッセージ表示のセット（MSG送りなし）
//-------------------------------------------------------------------------
u8 FieldMsgSetNoSkip( const u8 * msg_adrs )
{
	if(field_msg_status != FLDMSG_STAT_OFF) return FALSE;

	field_msg_status = FLDMSG_STAT_NOSKIP;
	field_msg_set( msg_adrs );
	return TRUE;
}

//-------------------------------------------------------------------------
//　メッセージ表示の強制セット（デバッグ用）
//-------------------------------------------------------------------------
u8 FieldMsgSetForce( const u8 * msg_adrs )
{
	field_msg_status = FLDMSG_STAT_NOSKIP;
	field_msg_set( msg_adrs );
	return TRUE;	/* 戻り値に意味はない。とりあえず */
}

//-------------------------------------------------------------------------
//	簡易会話データ表示をセット
//-------------------------------------------------------------------------
u8 FieldKaiwaMsgSet( void )
{
	if(field_msg_status != FLDMSG_STAT_OFF) return FALSE;

	field_msg_status = FLDMSG_STAT_NORMAL;
	field_kaiwa_msg_set();
	return TRUE;
}

//-------------------------------------------------------------------------
//<引数>
//	msg_adrs	メッセージデータアドレス
//-------------------------------------------------------------------------
static void field_msg_set(const u8 * msg_adrs )
{
	PM_MsgExpand(MsgExpandBuffer, msg_adrs);
	TalkMsgSet( &fld_win, MsgExpandBuffer, MenuFontStartNo, MWIN_MSGXPOS, MWIN_MSGYPOS );
	add_field_msg_task();
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static void field_kaiwa_msg_set( void )
{
	// MsgExpandBuffer に簡易会話内容を展開
	TalkMsgSet( &fld_win, MsgExpandBuffer, MenuFontStartNo, MWIN_MSGXPOS, MWIN_MSGYPOS );
	add_field_msg_task();
}

//-------------------------------------------------------------------------
//	フィールドメッセージウィンドウをクリア
//-------------------------------------------------------------------------
void FieldMsgClear( void )
{
	del_field_msg_task();
	KWinFrameClear( &fld_win );
	field_msg_status = FLDMSG_STAT_OFF;
}

//-------------------------------------------------------------------------
// メッセージの状態を返す
//-------------------------------------------------------------------------
u8 FieldMsgStatusCheck(void)
{
		return field_msg_status;
};

//-------------------------------------------------------------------------
//	メッセージの終了待ち
//	<戻り値>
//	TRUE	MSG表示終了
//	FALSE	MSG表示中
//-------------------------------------------------------------------------
u8 FieldMsgWait(void)
{
		if(field_msg_status == FLDMSG_STAT_OFF)return TRUE;
		return FALSE;
};

//-------------------------------------------------------------------------
//	フィールドメッセージをキャンセル
//	※ウィンドウ内を消去
//-------------------------------------------------------------------------
void FieldMsgCancel(void)
{
	del_field_msg_task();
	KWinFrameScrnWrite( &fld_win );
	field_msg_status = FLDMSG_STAT_OFF;
}

//=========================================================================
//	フィールドＯＢＪ制御関連
//=========================================================================

u8 EvWaitHeroMoveEnd(void)
{
		if(MyMoveState.mv_state == EV_M_ON)return FALSE;
		return TRUE;
};

//-------------------------------------------------------------------------
//	会話開始初期化：自機の動作終了待ち処理
//-------------------------------------------------------------------------
static void talk_start_task(u8 no)
{
	TASK_TABLE * my;
	my = &TaskTable[no];

	if( EvWaitHeroMoveEnd() == FALSE ) return;

	HeroAcmdForceStop();
	DelTask(no);
}

u8 EvWaitTalkStart( void )
{
	if( CheckTask( talk_start_task ) )return FALSE;
	SetHeroMoveStateInit();		//自機状態（ダニエルとか…）のクリア
	return TRUE;
}

void AddTalkStartTask( void )
{
	EvObjPauseAll();
	AddTask( talk_start_task, 80 );
}


//-------------------------------------------------------------------------
//	会話開始初期化：話しかけた対象のＯＢＪと自機の動作終了待ち処理
//-------------------------------------------------------------------------
enum{
	HERO_STOP_FLAG,
	TARGET_STOP_FLAG,
};

static void talk_obj_start_task(u8 no)
{
	TASK_TABLE * my = &TaskTable[no];

	if( my->work[HERO_STOP_FLAG] == 0 && EvWaitHeroMoveEnd() == TRUE ){
		HeroAcmdForceStop();				//自機が動作終了していればポーズ
		my->work[HERO_STOP_FLAG] = 1;
	}

	if( my->work[TARGET_STOP_FLAG] == 0 && EvObj[TargetObjNo].move_sw == 0 ){
		EvObjPause( &EvObj[TargetObjNo] );		//対象が話しかけ可能な状態ならポーズ
		my->work[TARGET_STOP_FLAG] = 1;
	};

	if( my->work[HERO_STOP_FLAG] == 0 || my->work[TARGET_STOP_FLAG] == 0 ) return;

	DelTask(no);
}

u8 EvWaitTalkObjStart( void )
{
	if( CheckTask( talk_obj_start_task ) )return FALSE;
	SetHeroMoveStateInit();		//自機状態（ダニエルとか…）のクリア
	return TRUE;
}

void AddTalkObjStartTask( void )
{
	u8 no;

	EvObjPauseAlmost( TargetObjNo );			//自機と対象以外をポーズ
	no = AddTask( talk_obj_start_task, 80 );
	if( EvObj[TargetObjNo].move_sw == 0 ){		//対象が話しかけ可能な状態ならポーズ
		EvObjPause( &EvObj[TargetObjNo] );
		TaskTable[no].work[TARGET_STOP_FLAG] = 1;
	}
}

//-------------------------------------------------------------------------
//	会話終了
//-------------------------------------------------------------------------
void TalkEnd(void)
{
	AcmdEnd(EvObjSpWorkAdrs(EV_OBJ_SPID));			// 自機強制アニメ解除
	AnmCmdFree();
	EvObjPauseClrAll();
}

void TalkObjEnd(void)
{
	if (EvObj[TargetObjNo].sw == 1) AcmdEnd(&EvObj[TargetObjNo]);
	AcmdEnd(EvObjSpWorkAdrs(EV_OBJ_SPID));			// 自機強制アニメ解除
	AnmCmdFree();
	EvObjPauseClrAll();
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
void SetTalkObjSiteToHero( void )
{
	AcmdCodeTurnSiteSet( &EvObj[TargetObjNo], TalkSiteWork );
}

void ResetTalkObjSite( void )
{
	AcmdFree(&EvObj[TargetObjNo]);
}
