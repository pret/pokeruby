//=========================================================================================
//							フィールドエフェクト・居合斬り/岩砕き
//									2002/02/21 by nakahiro
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
#include "f_pmlist.h"
#include "mapparam.h"

//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
static void CutIn01(u8);
static void CutIn02(u8);
static void CutIn03(u8);
static void CutIn04(u8);

//=========================================================================================
//									グローバル変数
//=========================================================================================
EV_POS	hiden_pos = { 0, 0, 0 };

//-------------------------------------
//		目の前のキャラをチェック
//-------------------------------------
u8 CheckFrontOBJCode( u8 obj )
{
	u8	no;

	GetHeroFrontCellPos( &hiden_pos.x, &hiden_pos.y );

	hiden_pos.z = GetHeroHeight();
	no = EvObjHitCheck( hiden_pos.x, hiden_pos.y, hiden_pos.z );

	if( EvObj[no].obj_code != obj )
		return	FALSE;

	TargetObjID = EvObjId(no);

	return	TRUE;
}

//-----------------------------
//		エフェクトセット
//-----------------------------
u8 EffectTaskSet(void)
{
	GetHeroFrontCellPos( &hiden_pos.x, &hiden_pos.y );
	return	AddTask( CutIn01, 8 );
}

//--------------------------------------
//		カットイン -> エフェクト
//--------------------------------------
static void CutIn01( u8 id )
{
	EventOBJ * ev;
	
	SetForceEvent();
	
	MyMoveState.mv_pause = 1;

	ev = &EvObj[ MyMoveState.evobjno ];

	if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 )	return;

	if( NowMap.type == MAPTYPE_WATER ){
		FldEffSet( FECODE_HidenCutInMine );
		TaskTable[id].TaskAdrs = CutIn03;
		return;
	}

	ChangeHeroActorHiden();
	AcmdSet( ev, AC_ANM_END_WAIT );

	TaskTable[id].TaskAdrs = CutIn02;
}

static void CutIn02( u8 id )
{
	EventOBJ *ev;
	
	ev = &EvObj[ MyMoveState.evobjno ];

	if( AcmdEndChk(ev) == 1 ){
		FldEffSet( FECODE_HidenCutInMine );
		TaskTable[id].TaskAdrs = CutIn03;
	}
}

static void CutIn03( u8 id )
{
	if( FeCodeChk( FECODE_HidenCutIn ) == 0 ){
		FeSetWork[ FE_SITE ] = GetHeroSite();			// 向き
		if( FeSetWork[FE_SITE] == SITE_D )	FeSetWork[ FE_PAT ] = STOP_D_ST;
		if( FeSetWork[FE_SITE] == SITE_U )	FeSetWork[ FE_PAT ] = STOP_U_ST;
		if( FeSetWork[FE_SITE] == SITE_L )	FeSetWork[ FE_PAT ] = STOP_L_ST;
		if( FeSetWork[FE_SITE] == SITE_R )	FeSetWork[ FE_PAT ] = STOP_R_ST;

		EvObjChgParam( &EvObj[MyMoveState.evobjno], MyMoveStateFlagObjCode() );
		ActAnmChg( &ActWork[MyMoveState.actno], (u8)FeSetWork[ FE_PAT ] );

		FeCodeDel( FECODE_HidenCutIn );

		TaskTable[id].TaskAdrs = CutIn04;
	}
}

static void CutIn04( u8 id )
{
	void (*func)(void);

	func = (void *)RETURN_ADR( 
			TaskTable[id].work[RETURN_ADR_H],
			TaskTable[id].work[RETURN_ADR_L] );
	func();
	MyMoveState.mv_pause = 0;
	DelTask(id);
}
