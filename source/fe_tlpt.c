//=========================================================================================
//								フィールドエフェクト・テレポート
//									2002/08/24 by nakahiro
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
#include "fld_task.h"
#include "fld_tool.h"
#include "mapparam.h"


//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void StartExtraInit(void);	//フィールドエフェクト初期設定
extern void (*ExtraInit)(void);

static void SetFeTeleport(void);
static void SetTeleportEff(void);

//=========================================================================================
//									グローバル変数
//=========================================================================================

//-------------------------------------------
//	チェック
//-------------------------------------------
u8 TeleportCheck(void)
{
	if( MTYPE_IsEnableFlyCheck( NowMap.type ) == TRUE ){
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeTeleport;
		return	TRUE;
	}

	return	FALSE;
}

//-------------------------------------------
//	エフェクトセット
//-------------------------------------------
static void SetFeTeleport(void)
{
	InitEventFlagAtTeleport();		//テレポートによるフラグ初期化
	FldEffSet( FECODE_Teleport );
	FeSetWork[0] = FPokeNo;
}

u32 FeTeleport(void)
{
	u8	id;

	id = EffectTaskSet();

	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H(	SetTeleportEff );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L(	SetTeleportEff );

//	InitHeroLastStatus();
	SetHeroMoveRequest( MY_MV_BIT_NORMAL );

	return	0;
}

//-------------------------------------------
//	エフェクト処理
//-------------------------------------------
//----
#if 1
//----
static void SetTeleportEff( void )
{
	FeCodeDel( FECODE_Teleport );
	SetMapChangeTeleport();
}
//----
#else	// 旧
//----
static void SetTeleportEff(void)		// 仮
{
	FeCodeDel( FECODE_Teleport );
	NextMapSetByTelMapID();
	AddMapChangeWarpTask();
}
//----
#endif
//----
