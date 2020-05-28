//=========================================================================================
//								フィールドエフェクト・甘い香り
//									2002/06/05 by nakahiro
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
#include "palanm.h"
#include "f_pmlist.h"
#include "mus_tool.h"


//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void StartExtraInit(void);	//フィールドエフェクト初期設定
extern void (*ExtraInit)(void);
extern u8	AmaikaoriEncount(void);	// エンカウントチェック

static void SetFeAmaikaori(void);	// 甘い香りエフェクトセット
static void SetAmaikaoriAnm(void);	// 甘い香りエフェクト
static void AmaikaoriAnm(u8);
static void AmaikaoriEnd(u8);


//=========================================================================================
//									グローバル変数
//=========================================================================================
extern const VM_CODE amaikaori_not_encount[];


//=========================================================================================
//									甘い香り処理呼び出し
//=========================================================================================
//----------------------------------------------------
//		ポケモンリストから使用する場合のチェック
//----------------------------------------------------
u8	AmaikaoriCheck(void)
{
	pFieldRecoverFunc = StartExtraInit;
	ExtraInit = SetFeAmaikaori;
	return	TRUE;
}

//-------------------------------------
//		甘い香りエフェクトセット
//-------------------------------------
static void SetFeAmaikaori(void)
{
	FldEffSet( FECODE_Amaikaori );
	FeSetWork[0] = FPokeNo;
}

u32 FeAmaikaori(void)
{
	u8	id;

	id = EffectTaskSet();

	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H(	SetAmaikaoriAnm );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L(	SetAmaikaoriAnm );

	return	0;
}

//------------------------------
//		甘い香りエフェクト
//------------------------------
static void SetAmaikaoriAnm(void)
{
	u8	id;

	SePlay( SE_W230 );
	PaletteFadeReq(
		0xffffffff ^ ( 1 << ( ActWork[ GetHeroActorNumber() ].oamData.Pltt+16 ) ),
		4, 0, 8, 0x1f );
	id = AddTask( AmaikaoriAnm, 0 );
	TaskTable[id].work[0] = 0;
	FeCodeDel( FECODE_Amaikaori );
}

static void AmaikaoriAnm( u8 id )
{
	if( !(FadeData.fade_sw) ){
		if( TaskTable[id].work[0] == 64 ){
			TaskTable[id].work[0] = 0;
			if( AmaikaoriEncount() == TRUE )	DelTask(id);
			else{
				TaskTable[id].TaskAdrs = AmaikaoriEnd;
				PaletteFadeReq(
					0xffffffff ^ ( 1 << ( ActWork[ GetHeroActorNumber() ].oamData.Pltt+16 ) ),
					4, 8, 0, 0x1f );
			}
		}else	TaskTable[id].work[0]++;
	}
}

static void AmaikaoriEnd( u8 id )
{
	if( !(FadeData.fade_sw) ){
		StartFieldScript( amaikaori_not_encount );	// スクリプト起動(タスクで制御)
		DelTask(id);
	}
}
