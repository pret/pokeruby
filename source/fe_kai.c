//=========================================================================================
//								フィールドエフェクト・怪力（発動）
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
#include "mus_tool.h"
#include "script.h"
#include "ev_check.h"
#include "ev_flag.h"
#include "MaDefine.h"
#include "fe_extra.h"
#include "poketool.h"
#include "pm_str.h"
#include "f_pmlist.h"
#include "tenji.h"
#include "pokelist.h"


//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void StartExtraInit(void);	// フィールドエフェクト初期設定
extern void (*ExtraInit)(void);

static void SetFeKairiki(void);		// 怪力エフェクトセット
static void SetFeKairiki2(void);	// 怪力エフェクトセット（点字用）
static void SetKairikiAnm(void);	// 怪力発揮アニメセット

//=========================================================================================
//									グローバル変数
//=========================================================================================
extern const VM_CODE pokelist_kairiki_start[];

extern u8	TargetObjNo;

//=========================================================================================
//									怪力処理呼び出し
//=========================================================================================
//--------------------------------
//		デバッグメニューから
//--------------------------------
#ifdef	PM_DEBUG

void TestKairiki(void)
{
	//点字の洞窟チェック
	if( TenjiKairikiChk() )
	{
		FPokeNo = 0;
		AnswerWork = 0;
		SetFeKairiki2();
		return;
	}

	if( CheckFrontOBJCode( PUSHROCK1 ) == TRUE ){
		FPokeNo = 0;
		AnswerWork = 0;
		SetFeKairiki();
		return;
	}

	ResetForceEvent();
}

#endif	PM_DEBUG

//----------------------------------------------------
//		ポケモンリストから使用する場合のチェック
//----------------------------------------------------
u8	KairikiCheck(void)
{
	//点字の洞窟チェック
	if( TenjiKairikiChk() )
	{
		AnswerWork = FPokeNo;
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeKairiki2;
		return	TRUE;
	}

	if( CheckFrontOBJCode( PUSHROCK1 ) == TRUE ){
		AnswerWork = FPokeNo;
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeKairiki;
		return	TRUE;
	}

	return	FALSE;
}

//--------------------------------------
//		怪力エフェクトセット
//--------------------------------------
static void SetFeKairiki(void)
{
	FeSetWork[0] = FPokeNo;
	StartFieldScript( pokelist_kairiki_start );
}

// 点字用
static void SetFeKairiki2(void)
{
	FeSetWork[0] = FPokeNo;
	FldEffSet( FECODE_KairikiSet );
}

u32 FeKairikiSet(void)
{
	u8	id;

	id = EffectTaskSet();

	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H(	SetKairikiAnm );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L(	SetKairikiAnm );

	PokeNickNameSet( &PokeParaMine[FeSetWork[0]], StrTempBuffer0 );

	return	0;
}

//------------------------------
//		怪力発動アニメセット
//------------------------------
static void SetKairikiAnm(void)
{
	//点字の洞窟チェック
	if( TenjiKairikiChk() ){
		TenjiKairikiSet();
	}else{
		FeCodeDel( FECODE_KairikiSet );
		ContinueFieldScript();
	}
}

