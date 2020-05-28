//======================================================
//    fld_menu.c                                           
//                                                      
//    Copyright (C) 2000 GAME FREAK inc.
//======================================================



#include "common.h"

#define	__FLD_MENU_H_GLOBAL__
#include "fld_menu.h"

#include "menu.h"
#include "fld_main.h"
#include "palanm.h"
#include "task.h"
#include "script.h"
#include "weather.h"
#include "sysflag.h"
#include "ev_flag.h"
#include "report.h"
#include "zukan.h"
#include "pokesio.h"
#include "mus_tool.h"
#include "mystatus.h"
#include "evobj.h"
#include "jiki.h"
#include "safari.h"
#include "initgame.h"
#include "record.h"
#include "fld_talk.h"
#include "fld_task.h"



//------------------------- 定義 -----------------------------

//フィールドメニュー表示に関する定義
enum {
	FLDMENU_X1 = 22,			//メニュー左端Ｘ座標
	FLDMENU_X2 = 29,			//メニュー右端Ｘ座標
	FLDMENU_Y1 = 0,				//メニュー上端Ｙ座標
	FLDMENU_Y2 = FLDMENU_Y1 + 3,

	FLDMENU_MSGX = FLDMENU_X1 + 2,
	FLDMENU_MSGY = FLDMENU_Y1 + 2,
	FLDMENU_CSRX = FLDMENU_X1 + 1,
	FLDMENU_CSRY = FLDMENU_Y1 + 2,

	FLDMENU_MSGHEIGHT = 2,		//8x16フォントでの一行の高さ

	FIELD_MENU_MAX = 9,			//メニュー項目最大数
};

//サファリゾーンの情報ウィンドウに関する定義
enum {
	SAFARIWIN_X1 = 0,
	SAFARIWIN_Y1 = 0,
	SAFARIWIN_X2 = 9,
	SAFARIWIN_Y2 = 5,

	SAFARIWIN_MSGX = SAFARIWIN_X1 + 1,
	SAFARIWIN_MSGY = SAFARIWIN_Y1 + 1,
};

//------------------------- データ -----------------------------


// フィールドメニュー用データ

static const u8 str_zukan[]    = {zu_,ka_,n_,EOM_};
static const u8 str_pokemon[]  = {PO_,KE_,MO_,N_,EOM_};
static const u8 str_bag[]      = {BA_,TTU_,GU_,EOM_};
static const u8 str_pokegear[] = {PO_,KE_,NA_,BI_,EOM_};
static const u8 str_hero[]     = {I_MSG_,MY_NAME_BUF,EOM_};
static const u8 str_report[]   = {RE_,PO_,bou_,TO_,EOM_};
static const u8 str_config[]   = {se_,ttu_,te_,i_,EOM_};
static const u8 str_close[]    = {to_,zi_,ru_,EOM_};
static const u8 str_retire[]   = {RI_,TA_,I_,A_,EOM_};


// サファリ用表示データ
static const u8 str_safari_window[] =
{
	SA_,HU_,AA_,RI_,BO_,bou_,RU_,
	CR_,
	no_,ko_,ri_,spc_,I_MSG_,STR_TEMP_BUF0,KO_,
	EOM_,
};



//------------------------- 変数 -----------------------------

u8	(*MenuFunc)();		//メニュー制御関数のポインタ


static u8 fieldPick = 0;						//選択中メニュー位置
static u8 fieldMax = 0;							//メニュー表示行数
static u8 fieldMenuList[ FIELD_MENU_MAX ] = {};	//メニュー項目保持リスト




//-------------------- サブルーチン宣言 ------------------------

extern void TNaviInit(void);

extern void FieldMenuPokeListInit(void);
extern void ConfigInit(void);	//せってい
extern void FieldMenuBagInit(void);		//バッグ


static void FieldMenuInit(void);

static void MakeFieldMenuCom(void);
static void make_normal_menu_command(void);
static void make_comm_menu_command(void);
static void make_safari_menu_command(void);
#ifdef	FESTA_VER_ROM
static void make_festa_menu_command(void);
#endif

static u8 NormalMenuSelect(void);

static u8 Menu00(void);
static u8 Menu01(void);
static u8 Menu02(void);
static u8 Menu03(void);
static u8 Menu04(void);
static u8 Menu05(void);
static u8 Menu06(void);
static u8 Menu07(void);
static u8 Menu08(void);
static u8 Menu09(void);


// セーブ関連
static u8 FieldSaveSeqMainInit(void);
static u8 FieldSaveSeqMainFunc(void);



static const MENU_ITEM	FieldMenuItem[]=
{
	{ str_zukan,	Menu00 },	//00:ずかん
	{ str_pokemon,	Menu01 },	//01:ポケモン
	{ str_bag,		Menu02 },	//02:バッグ
	{ str_pokegear,	Menu03 },	//03:トレナビ
	{ str_hero,		Menu04 },	//04:ヒーロー
	{ str_report,	Menu05 },	//05:レポート
	{ str_config,	Menu06 },	//06:せってい
	{ str_close,	Menu07 },	//07:とじる
	{ str_retire,	Menu08 },	//08:リタイア
	{ str_hero,		Menu09 },	//09:通信時のトレーナーカード
};

//==================================================================================
//                       メインルーチン
//==================================================================================

//==============================================================
//
//	メニューリスト項目の設定処理
//
//==============================================================

//-----------------------------------------
//		デバッグ用メニューフラグセット
//-----------------------------------------
void DebugMenuFlagSet(void)
{
	EventFlagSet( SYS_ZUKAN_GET );
	EventFlagSet( SYS_POKEMON_GET );
	EventFlagSet( SYS_POKEGEAR_GET );
}

//------------------------------
//		メニューリスト作成
//------------------------------
static void MakeFieldMenuCom(void)
{
	fieldMax = 0;

#ifdef	FESTA_VER_ROM
	if ( FestaModeFlag == TRUE ) {
		make_festa_menu_command();
		return;
	}
#endif
	if ( IsFieldCommMode() == TRUE ) {
		make_comm_menu_command();			//通信時メニュー
	}
	else if ( IsFieldSafariMode() == TRUE ) {
		make_safari_menu_command();			//サファリモード時メニュー
	}
	else {
		make_normal_menu_command();			//通常時メニュー
	}
}

static void FieldMenuComSet( u8 no )
{
	MenuComSet( fieldMenuList, &fieldMax, no );
}


/* 通常時のメニューリスト作成 */
static void make_normal_menu_command(void)
{
	//ずかん
	if( EventFlagCheck( SYS_ZUKAN_GET ) == ON )
		FieldMenuComSet( 0 );

	//ポケモン
	if( EventFlagCheck( SYS_POKEMON_GET ) == ON )
		FieldMenuComSet( 1 );

	FieldMenuComSet( 2 );	//バッグ

	//ポケギア
	if( EventFlagCheck( SYS_POKEGEAR_GET ) == ON )
		FieldMenuComSet( 3 );

	FieldMenuComSet( 4 );	//主人公
	FieldMenuComSet( 5 );	//レポート
	FieldMenuComSet( 6 );	//せってい
	FieldMenuComSet( 7 );	//とじる
}

/* サファリモード時のメニューリスト作成 */
static void make_safari_menu_command( void )
{
	FieldMenuComSet( 8 );	//リタイア
	FieldMenuComSet( 0 );	//ずかん
	FieldMenuComSet( 1 );	//ポケモン
	FieldMenuComSet( 2 );	//バッグ
	FieldMenuComSet( 4 );	//主人公
	FieldMenuComSet( 6 );	//せってい
	FieldMenuComSet( 7 );	//とじる
}

/* 通信時のメニューリスト作成 */
static void make_comm_menu_command(void)
{
	FieldMenuComSet( 1 );	//ポケモン
	FieldMenuComSet( 2 );	//バッグ
	if (EventFlagCheck(SYS_POKEGEAR_GET) == TRUE)
		FieldMenuComSet( 3 );	//ポケナビ
	FieldMenuComSet( 9 );	//通信時の主人公
	FieldMenuComSet( 6 );	//せってい
	FieldMenuComSet( 7 );	//とじる
}

#ifdef	FESTA_VER_ROM
static void make_festa_menu_command(void)
{
	FieldMenuComSet( 1 );	//ポケモン
	FieldMenuComSet( 2 );	//バッグ
	FieldMenuComSet( 4 );	//主人公
	FieldMenuComSet( 7 );	//とじる
}
#endif


//==============================================================
//
//	メニュー画面生成処理
//
//==============================================================
//-----------------------------------------
//　サファリで残りボールの数を表示
//-----------------------------------------
static void MakeSafariInfoWindow( void )
{
	PM_NumMsgSet( StrTempBuffer0, SafariBallCount, NUM_MODE_SPACE, 2 );
	NMenuWinBoxWrite( SAFARIWIN_X1, SAFARIWIN_Y1, SAFARIWIN_X2, SAFARIWIN_Y2 );
	NMenuMsgWrite( str_safari_window, SAFARIWIN_MSGX, SAFARIWIN_MSGY );
}

//-----------------------------------------
//	メニューリストの分割表示
//
//<引数>	count	現在の表示行
//			step	一度に表示する行数
//
//※下記の呼び出しを分解した関数のと等価
//	NMenuFreeListWrite( FLDMENU_MSGX, FLDMENU_MSGY,
//	fieldMax,FieldMenuItem,fieldMenuList);
//-----------------------------------------
static int list_item_write( s16 * count, int step )
{
	int n;

	n = *count;

	while ( TRUE ) {
		NMenuMsgWrite( ( FieldMenuItem[fieldMenuList[n]] ).msg,
				FLDMENU_MSGX, FLDMENU_MSGY+(n*FLDMENU_MSGHEIGHT) );
		n++;
		if ( n >= fieldMax ) {
			*count = n;
			return TRUE;
		}
		step --;
		if ( step == 0 ) {
			*count = n;
			return FALSE;
		}
	}
}

//-----------------------------------------
//	メニュー生成処理メイン
//
//	※通信時の処理落ちを避けるため、分割して
//	　処理するようになっている
//-----------------------------------------
static int make_field_menu( s16 * wk1, s16 *wk2 )
{
	switch ( *wk1 ) {
	case 0:
		++ *wk1; break;

	case 1:
#if defined(FIELD_TUUSHIN_DEBUG) && defined(PM_DEBUG)
		DebugNumPrintInitField();
#endif
		MakeFieldMenuCom();
		++ *wk1; break;

	case 2:
		NMenuWinBoxWrite( FLDMENU_X1, FLDMENU_Y1,
				FLDMENU_X2, FLDMENU_Y2 + (fieldMax*FLDMENU_MSGHEIGHT) );
		*wk2 = 0;
		++ *wk1; break;

	case 3:
		if ( IsFieldSafariMode() ) MakeSafariInfoWindow();
		++ *wk1; break;

	case 4:
		if ( list_item_write( wk2, 2 ) == FALSE ) break;
		++ *wk1; break;

	case 5:
		fieldPick = NMenuVCursorInit(FLDMENU_CSRX,FLDMENU_CSRY,fieldMax,fieldPick);
		return TRUE;
	}
	return FALSE;
}


//-----------------------------------------
//	一気にフィールドメニューを生成
//-----------------------------------------
static void FieldMenuInit(void)
{
	s16 wk1,wk2;
	wk1 = 0; wk2 = 0;

	while ( make_field_menu( &wk1, &wk2 ) == FALSE );
}

//-----------------------------------------
//	フィールドメニュー生成タスク
//-----------------------------------------
static void make_field_menu_task( u8 no )
{
	s16 * wk = TaskTable[no].work;

	if ( make_field_menu( &wk[0], &wk[1] ) == TRUE ) {
		wk[0] = 0;
		ChangeBackTask(no);
	}
}

//-----------------------------------------
//	フィールドメニュー生成後、指定タスクに制御を渡す
//	<引数>	ret		タスク関数アドレス
//-----------------------------------------
void FieldMenuInitTaskSet( pTaskFunc ret )
{
	u8 no;

	NMenuScreenInit(FIELD_MENU_TYPE);
	no = AddTask( make_field_menu_task, TSK_PRI_EFFECT );
	ChangeTask( no, make_field_menu_task, ret );
}


//==============================================================
//
//		フィールドメニュー制御
//
//==============================================================
//-----------------------------------------
//	フィールドメニュー制御タスク
//-----------------------------------------
void FieldMenuFuncTask(u8 no)
{
	TASK_TABLE * my = &TaskTable[no];

	switch( my->work[0] ) {
	case 0:
		MenuFunc = NormalMenuSelect;
		my->work[0]++;
		break;

	case 1:
		if(MenuFunc()==1)DelTask(no);
	}
}

//-----------------------------------------
//	メニュー生成→メニュータスクに制御を渡す
//-----------------------------------------
void StartFieldMenuEvent(void)
{
	if ( IsFieldCommMode() == FALSE ) {
		/* 通常はOBJの動作をとめる */
		EvObjPauseAll();
		HeroAcmdForceStop();
		SetHeroMoveStateInit();
	}

	FieldMenuInitTaskSet( FieldMenuFuncTask );
	SetForceEvent();
}



//-------------------------------------------------------------
//						ｷｰﾁｪｯｸ
//-------------------------------------------------------------
static u8 NormalMenuSelect(void)
{
	if( sys.Trg & U_KEY )
	{
		SePlay(SE_SELECT);
		fieldPick = NMenuVCursorSet(-1);
	}
	if( sys.Trg & D_KEY )
	{
		SePlay(SE_SELECT);
		fieldPick = NMenuVCursorSet(1);
	}

	if( sys.Trg & A_BUTTON )
	{
		SePlay(SE_SELECT);

		if( FieldMenuItem[ fieldMenuList[fieldPick] ].ptr == Menu00 &&
			ZukanTotal( Z_SEE_CHK ) == 0	)
		{
			return	0;
		}

		MenuFunc = FieldMenuItem[fieldMenuList[fieldPick]].ptr;

		if( MenuFunc != Menu05 && MenuFunc != Menu07 && MenuFunc != Menu08 )
			FieldFadeControl(FIELD_FADE_OUT, 0);

		return	0;
	}

	if( sys.Trg & B_BUTTON || sys.Trg & START_BUTTON )
	{
		MenuEnd();
		return	1;
	}

	return	0;
}



//ずかん
static u8	Menu00(void)
{
	if(!(FadeData.fade_sw)){
		IncRecord( CNT_POKEDEX );		//ずかんを見た回数をカウント
		StopRainSound();
		MainProcChange( ZukanInit);
		return	1;
	}

	return	0;
}
//ポケモン
static u8	Menu01(void)
{
	if(!(FadeData.fade_sw)){
		StopRainSound();
		MainProcChange( FieldMenuPokeListInit);
		return 1;
	}

	return	0;
}
//バッグ
static u8	Menu02(void)
{
	if(!(FadeData.fade_sw)){
		StopRainSound();
		MainProcChange( FieldMenuBagInit);
		return	1;
	}

	return	0;
}
//ポケギア
static u8	Menu03(void)
{
	if(!(FadeData.fade_sw)){
		StopRainSound();
		MainProcChange( TNaviInit);
		return 1;
	}

	return	0;
}
//ヒーロー
static u8	Menu04(void)
{
	if(!(FadeData.fade_sw)){
		StopRainSound();
		SetTrainerCardPlayer( FieldMenuRecover );
		return	1;
	}

	return	0;
}
//レポート
static u8	Menu05(void)
{
	MenuFunc = FieldSaveSeqMainInit;
	return 0;
}
//せってい
static u8	Menu06(void)
{
	if(!(FadeData.fade_sw)){
		StopRainSound();
		MainProcChange( ConfigInit);
		sys.pReturnProc = FieldMenuRecover;
		return	1;
	}

	return	0;
}
//とじる
u8	Menu07(void)
{
	MenuEnd();
	return	1;
}

//リタイア
u8	Menu08(void)
{
	MenuEnd();
	SafariCancelAskStart();
	return 1;
}

u8	Menu09(void)
{
	if(!(FadeData.fade_sw)){
		StopRainSound();
		SetTrainerCardFriend(comm_my_id, FieldMenuRecover);
		return	1;
	}

	return	0;
}

//============================================
//			ポケモンレポート処理
//============================================

//--------------------------
//	セーブ制御関数
//--------------------------
static u8 FieldSaveSeqMainInit(void)
{
	SaveSeqInit();
	MenuFunc = FieldSaveSeqMainFunc;
	return 0;
}

static u8 FieldSaveSeqMainFunc(void)
{
	switch( SaveSeqMain() ){

	case 0:
		return 0;

	case SAVE_CANCEL:/* キャンセル→メニューに戻る */
	
		NMenuScreenClear();
		FieldMenuInit();
		MenuFunc = NormalMenuSelect;
		return 0;

	case SAVE_SUCCESS:/* セーブ成功→フィールドに戻る */
	case SAVE_FAILURE:/* セーブ失敗→フィールドに戻る */
	
		NMenuScreenClear();
		TalkEnd();
		ResetForceEvent();
		return 1;
	
	default:
		return 0;
	};
}

