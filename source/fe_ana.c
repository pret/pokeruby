//=========================================================================================
//								フィールドエフェクト・穴を掘る
//									2002/02/25 by nakahiro
//=========================================================================================
#include "common.h"
#include "map_attr.h"
#include "fieldmap.h"
#include "mapbg.h"
#include "task.h"
#include "jiki.h"
#include "fld_main.h"
#include "fntequ.h"
#include "script.h"
#include "ev_check.h"
#include "ev_flag.h"
#include "MaDefine.h"
#include "fe_extra.h"
#include "initgame.h"
#include "f_pmlist.h"
#include "sysflag.h"
#include "tenji.h"


//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void StartExtraInit(void);	//フィールドエフェクト初期設定
extern void (*ExtraInit)(void);
extern u8 EscapeDungionCheck(void);
extern void EscapeDungionMain(u8);

static void SetFeAnawohoru(void);
static void SetAnawohoruEff(void);

//=========================================================================================
//									グローバル変数
//=========================================================================================

//---------------------
//		チェック
//---------------------
u8	AnawohoruCheck(void)
{
	if( EscapeDungionCheck() == TRUE ){
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeAnawohoru;
		return	TRUE;
	}

	return	FALSE;
}

//-----------------------------------
//		穴を掘るエフェクトセット
//-----------------------------------
static void SetFeAnawohoru(void)
{
	InitEventFlagAtEscape();		//あなをほるによるフラグ初期化
	FldEffSet( FECODE_Anawohoru );
	FeSetWork[0] = FPokeNo;
}

u32 FeAnawohoru(void)
{
	u8	id;

	id = EffectTaskSet();

	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H(	SetAnawohoruEff );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L(	SetAnawohoruEff );

	if( !( TenjiAnawohoruChk() ) )
		SetHeroMoveRequest( MY_MV_BIT_NORMAL );

	return	0;
}

//---------------------------
//		エフェクト処理
//---------------------------
static void SetAnawohoruEff(void)		// 仮
{
	u8	id;

	FeCodeDel( FECODE_Anawohoru );

	//点字の洞窟だったら
	if( TenjiAnawohoruChk() )
	{
		TenjiAnawohoruSet();
	}else
	{
		id = AddTask( EscapeDungionMain, 8 );
		TaskTable[id].work[0] = 0;
	}

//	ResetForceEvent();
}

