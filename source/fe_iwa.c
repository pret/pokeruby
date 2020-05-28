//=========================================================================================
//								フィールドエフェクト・岩砕き
//									2002/02/20 by nakahiro
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
#include "mus_tool.h"
#include "f_pmlist.h"
#include "record.h"


//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void StartExtraInit(void);	//フィールドエフェクト初期設定
extern void (*ExtraInit)(void);

static void SetFeIwakudaki(void);	// いわくだきエフェクトセット
static void SetIwakudakiAnm(void);	// 岩消去アニメセット

//=========================================================================================
//									グローバル変数
//=========================================================================================
extern const VM_CODE pokelist_iwakudaki_sutart[];

extern u8	TargetObjNo;


//=========================================================================================
//									いわくだき処理呼び出し
//=========================================================================================
//------------------------------------------------------
//		デバッグメニューから使用する場合のチェック
//------------------------------------------------------
#ifdef	PM_DEBUG

void TestIwakudaki(void)
{
	if( CheckFrontOBJCode( CRUSHROCK1 ) == TRUE ){
		FPokeNo = 0;
		SetFeIwakudaki();
		return;
	}

	ResetForceEvent();
}

#endif	PM_DEBUG

//----------------------------------------------------
//		ポケモンリストから使用する場合のチェック
//----------------------------------------------------
u8	IwakudakiCheck(void)
{
	if( CheckFrontOBJCode( CRUSHROCK1 ) == TRUE ){
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeIwakudaki;
		return	TRUE;
	}

	return	FALSE;
}

//--------------------------------------
//		いわくだきエフェクトセット
//--------------------------------------
static void SetFeIwakudaki(void)
{
	FeSetWork[0] = FPokeNo;
	StartFieldScript( pokelist_iwakudaki_sutart );
}

u32 FeIwakudaki(void)
{
	u8	id;

	id = EffectTaskSet();

	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H(	SetIwakudakiAnm );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L(	SetIwakudakiAnm );

	IncRecord( CNT_HIDEN_IWAKUDAKI );

	return	0;
}

//------------------------------
//		岩消去アニメセット
//------------------------------
static void SetIwakudakiAnm(void)
{
	SePlay( SE_W088 );
	FeCodeDel( FECODE_Iwakudaki );
	ContinueFieldScript();
}
