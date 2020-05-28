//=========================================================================================
//								フィールドエフェクト・フラッシュ
//									2002/02/27 by nakahiro
//=========================================================================================
#include "common.h"
#include "map_attr.h"
#include "fieldmap.h"
#include "mapbg.h"
#include "task.h"
#include "jiki.h"
#include "fld_main.h"
#include "fntequ.h"
#include "mus_tool.h"
#include "script.h"
#include "ev_check.h"
#include "ev_flag.h"
#include "MaDefine.h"
#include "fe_extra.h"
#include "fld_tool.h"
#include "sysflag.h"	/* SYS_USE_WAZA_FLASH */
#include "f_pmlist.h"


//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void StartExtraInit(void);	//フィールドエフェクト初期設定
extern void (*ExtraInit)(void);
extern u8 EscapeDungionCheck(void);
extern const VM_CODE ev_hiden_flash_script[];

static void SetFeFlash(void);
static void SetFlashEff(void);

//=========================================================================================
//									グローバル変数
//=========================================================================================
//--------------------------------
//		デバッグメニューから
//--------------------------------
#ifdef	PM_DEBUG

void TestFlash(void)
{
	if( NowMap.lighting == 1 && EventFlagCheck(SYS_USE_WAZA_FLASH)==FALSE ) {
		SetFeFlash();
		return;
	}

	ResetForceEvent();
}

#endif	PM_DEBUG

//---------------------
//		チェック
//---------------------
u8	FlashCheck(void)
{
//	if( EscapeDungionCheck() == TRUE ){
	if( NowMap.lighting == 1 && EventFlagCheck(SYS_USE_WAZA_FLASH)==FALSE ) {
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeFlash;
		return	TRUE;
	}

	return	FALSE;
}

//--------------------------------------
//		フラッシュエフェクトセット
//--------------------------------------
static void SetFeFlash(void)
{
	u8	id;

//	*(vu16 *)REG_WINOUT = 0x0011;
	id = EffectTaskSet();

	FeSetWork[0] = FPokeNo;

	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H(	SetFlashEff );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L(	SetFlashEff );
}

//---------------------------
//		エフェクト処理
//---------------------------
static void SetFlashEff(void)
{
//	*(vu16 *)REG_WINOUT = 0x0001;
	SePlay( SE_W115 );
	EventFlagSet( SYS_USE_WAZA_FLASH );
//	SetBright( 1 );
	StartFieldScript( ev_hiden_flash_script );
//	ResetForceEvent();
}
