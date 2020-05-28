//=========================================================================
//
//		デバック用ソース(ﾃｽﾄ用ともいう)
//														by soga
//=========================================================================

#include "common.h"
#include "poketool.h"
#include "param.h"
#include "menu.h"
#include "task.h"
#include "palanm.h"
#include "con_tool.h"
#include "contest.h"
#include "conres.h"
#include "fight.h"
#include "laster.h"
#include "intr.h"
#include "actanm.h"
#include "fld_main.h"
#include "madefine.h"
#include "wazatool.h"
#include "consio.h"
#include "d_matsu.h"
#include "ev_flag.h"
#include "wazano.def"
#include "conscr.h"
#include "server.h"

//-- 2つセットで --//
#define DEBUG_NUMPRINT
#include "pokesio.h"
#include "multisio.h"
#include "cable.h"

//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern void MenuEnd(void);

//----------------------------------------------------------
//	外部変数
//----------------------------------------------------------
extern u8	(*MenuFunc)();
extern	TALK_WIN	win[4];

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static u8 DebugMenuMain(void);
static u8 BattleTowerStageSet(void);

//----------------------------------------------------------
//	データ
//----------------------------------------------------------

//----------------------------------------------------------
//	メニューデータ
//----------------------------------------------------------
static const u8 stage1_msg[] = {n1_,si_,yyu_,u_,me_,EOM_};
static const u8 stage2_msg[] = {n2_,si_,yyu_,u_,me_,EOM_};
static const u8 stage3_msg[] = {n3_,si_,yyu_,u_,me_,EOM_};
static const u8 stage4_msg[] = {n4_,si_,yyu_,u_,me_,EOM_};
static const u8 stage5_msg[] = {n5_,si_,yyu_,u_,me_,EOM_};
static const u8 stage6_msg[] = {n6_,si_,yyu_,u_,me_,EOM_};
static const u8 stage7_msg[] = {n7_,si_,yyu_,u_,me_,EOM_};
static const u8 stage8_msg[] = {n8_,si_,yyu_,u_,me_,EOM_};

#define MENU_MAX 8
static const MENU_ITEM	SogaDebugMenuList[] =
{
	{stage1_msg, BattleTowerStageSet},
	{stage2_msg, BattleTowerStageSet},
	{stage3_msg, BattleTowerStageSet},
	{stage4_msg, BattleTowerStageSet},
	{stage5_msg, BattleTowerStageSet},
	{stage6_msg, BattleTowerStageSet},
	{stage7_msg, BattleTowerStageSet},
	{stage8_msg, BattleTowerStageSet},
};

//=========================================================================
//	ﾌｨｰﾙﾄﾞﾃﾞﾊﾞｯｸﾒﾆｭｰから呼ばれる関数
//=========================================================================
u8 DebugSogaTest(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, 16, 18);
	NMenuFixListWrite( 2, 1, MENU_MAX, SogaDebugMenuList);
	NMenuVCursorInit( 1, 1, MENU_MAX, 0 );
	MenuFunc = DebugMenuMain;
	return 0;
}

static u8 DebugMenuMain(void)
{
	s8	flag;

	flag = NMenuVCursorControl();
	if( flag == CURSOR_DEFAULT_VALUE )
		return 0;

	if( flag == CURSOR_CANCEL_VALUE )
	{
		MenuEnd();
		return 1;
	}
	ServerWork[0]=flag;
	MenuFunc = SogaDebugMenuList[flag].ptr;
	return 0;
}

//=========================================================================
//	デバックメニュー共通ルーチン
//=========================================================================

u8	BattleTowerStageSet(void)
{
	MyData.BattleTowerWork.BattleTowerSeqNo[0]=3;
	MyData.BattleTowerWork.BattleTowerSeqNo[1]=3;
	MyData.BattleTowerWork.BattleTowerStage[0]=ServerWork[0]+1;
	MyData.BattleTowerWork.BattleTowerStage[1]=ServerWork[0]+1;
	MyData.BattleTowerWork.BattleTowerRound[0]=1;
	MyData.BattleTowerWork.BattleTowerRound[1]=1;
	MenuEnd();
	return 1;
}

