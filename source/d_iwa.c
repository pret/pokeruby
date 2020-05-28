//<d_iwa.c>
//////////////////////////////////////////////////
//
//	PMAGB　デバッグ用メインルーチン
//
/////////////////////////////////////////////////
#ifdef PM_DEBUG

#include "common.h"
#include "actor.h"		//アクターシステム用メインヘッダ
#include "actanm.h"		//アクターシステム・アニメーションヘッダ
#include "palanm.h"		//パレットアニメーション用ヘッダ
#include "intr.h"		//割り込み制御用ヘッダ
#include "madefine.h"
#include "task.h"
#include "print.h"
#include "menu.h"
#include "fld_main.h"
#include "fld_task.h"
#include "script.h"

#include "d_ropeway.h"
#include "ev_flag.h"
#include "evobj.h"

typedef struct
{
	u8	uc_main;	//メイン
	u8	uc_next;	//次に飛ぶタスク
	u8	uc_ret;		//戻り先
	u8	uc_err;		//エラーが起こったときに飛ぶ

	u8	uc_flg;		//タスク管理用のフラグエリア
}_d_iwa_tsk;

//デバッグシステムでグローバルに使用する値をパック
typedef struct
{
	u8	uc_flg;				//汎用フラグエリア
	u8	uc_stPalFade;		//パレットフェードアニメーションのステータス
	
	_d_iwa_tsk	tsk;

	u16	us_aScreen[4][1024];
}_d_iwa_main;

//CellID
typedef const enum
{
	DIWA_CELL0 = 1000,
	DIWA_CELL1,
	DIWA_CELL2,
	DIWA_CELL3,
	DIWA_CELL4,
	DIWA_CELL5,
}DIwa_CellID;

extern u8	MailViewSet(void);
extern u8	(*MenuFunc)();

extern u8	g_rlt_debug_sw;
extern void RouletteSet(void);	//ルーレット呼び出し
extern const VM_CODE ev_roulette_p01_c103_r0401[];
extern const VM_CODE ev_roulette_p02_c103_r0401[];
u8 RouletteSetUp1(void){
	g_rlt_debug_sw = 1;
	StartFieldScript( ev_roulette_p01_c103_r0401 );
	MenuEnd();
	return 1;
}
u8 RouletteSetUp3(void){
	g_rlt_debug_sw = 1;
	StartFieldScript( ev_roulette_p02_c103_r0401 );
	MenuEnd();
	return 1;
}
////////////////////////////////////////////////////////
//	グローバルシステムデータ
////////////////////////////////////////////////////////
static const u8	str_ropeUp[] = {RO_,bou_,PU_,U_,EE_,I_,U__,EOM_};
static const u8 str_ropeDown[] = {RO_,bou_,PU_,U_,EE_,I_,D__,EOM_};
static const u8 str_roulette1[] = {RU_,bou_,RE_,TTU_,TO_,n1_,EOM_};
static const u8 str_roulette3[] = {RU_,bou_,RE_,TTU_,TO_,n3_,EOM_};
static const u8	str_test[] = {ME_,bou_,RU_,V__,I__,E__,U__,EOM_};
static const MENU_ITEM	sg_diwa_menu[] =
{
	{ str_ropeUp,   DemoRopewaySetUp },		//00:ロープウェイデモ(のぼり)
	{ str_ropeDown, DemoRopewaySetDown},	//01:ロープウェイデモ(くだり)
	{ str_roulette1, RouletteSetUp1 },		//02:ルーレット
	{ str_roulette3, RouletteSetUp3 },		//03:ルーレット
	{ str_test,		MailViewSet },			//04:メール表示
};

//////////////////////////////////////////////////////////
//アクターシステム用データ
//////////////////////////////////////////////////////////
static const	CellData TestDataCell[];
static const	PalData TestDataPal[];
static const	actHeader TestHeader[];

/*-----------------------------------------
	デバッグメニュー	キー取得

	static u8 DebugIwasawaKey(void);
-----------------------------------------------*/
static u8 DebugIwasawaKey(void){

	MENUFUNC	func;

	if(sys.Trg == U_KEY)	NMenuVCursorSet(-1);
	if(sys.Trg == D_KEY)	NMenuVCursorSet(1);
	
	if(sys.Trg == A_BUTTON){
		func = sg_diwa_menu[ NMenuVCursorPosGet() ].ptr;
		return	func();
	}
	else if(sys.Trg == (A_BUTTON | R_BUTTON))
	{
		ScriptParameter0 = 1;
		func = sg_diwa_menu[ NMenuVCursorPosGet() ].ptr;
		return	func();
	}

	if(sys.Trg == B_BUTTON){
		MenuEnd();
		return	1;
	}

	return	0;
}

/*--------------------------------------
	デバッグシステム突入ルーチン

	u8 DebugIwasawaTest(void);
----------------------------------------*/
u8 DebugIwasawaTest(void)
{
	ScriptParameter0 = 0;
	NMenuScreenClear();								//メニュー設定
	NMenuWinBoxWrite( 19, 0, 29, 12 );				//ウィンドウ表示
	NMenuFixListWrite( 21, 1, 5, sg_diwa_menu );	//メニュー表示
	NMenuVCursorInit( 20, 1, 5, 0 );				//カーソル初期設定

	MenuFunc = DebugIwasawaKey;
	
	return 0;
}

#endif	//ifdef PM_DEBUG
