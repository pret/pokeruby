//=========================================================================================
//								秘密基地　入り口作成エフェクト
//									2001/10/22 by nakahiro
//=========================================================================================
#include "common.h"
#include "fieldmap.h"
#include "jiki.h"
#include "script.h"
#include "map_attr.h"
#include "mapbg.h"
#include "task.h"
#include "fld_main.h"
#include "fntequ.h"
#include "ev_flag.h"
#include "MaDefine.h"
#include "base.h"
#include "fe_extra.h"
#include "fe_base.h"
#include "mus_tool.h"
#include "palanm.h"
#include "f_pmlist.h"
#include "pm_str.h"
#include "message.h"

#include "syswork.h"
#include "..\script\savework.h"

#include "../objdata/base_ef1.ach"
#include "../objdata/base_ef1.acl"
#include "../objdata/base_ef2.ach"
#include "../objdata/base_ef3.ach"
#include "../objdata/base_ef0.acl"

#include "../objdata/snd_obj.ach"


//=========================================================================================
//										シンボル定義
//=========================================================================================
#define TREE_L_MAKE_CELL_CODE	0x96	//木の部屋（左）が作れる場所のセルコード
#define TREE_L_BASE_CELL_CODE	0x97	//木の部屋（左）のセルコード
#define TREE_R_MAKE_CELL_CODE	0x9c	//木の部屋（右）が作れる場所のセルコード
#define TREE_R_BASE_CELL_CODE	0x9d	//木の部屋（右）のセルコード

#define	CAVE_EFFECT_CNT		40		// 洞窟のエフェクトカウント
#define	TREE_EFFECT_CNT		40		// ロープのエフェクトカウント
#define	GRASS_EFFECT_CNT	40		// カマのエフェクトカウント

#define EFFECT_POSX		ActWork[MyMoveState.actno].oamData.HPos		//表示基準X位置
#define EFFECT_POSY		ActWork[MyMoveState.actno].oamData.VPos		//表示基準Y位置

#define	FE_WORK_SE		4
#define	FE_WORK_XPOS	5
#define	FE_WORK_YPOS	6
#define	FE_WORK_ANM		7

//=========================================================================================
//									　プロトタイプ宣言
//=========================================================================================
extern void BaseCheck(void);
extern void BaseSetCell(void);				// セルを張りかえる
extern void StartExtraInit(void);	//フィールドエフェクト初期設定
extern void (*ExtraInit)(void);

static void SetFeCaveBase(void);
static void SetCaveBaseAnm(void);
static void InitCaveBaseAnm( actWork * );	// アクター初期設定
static void WaitCaveBaseAnm( actWork * );	// アニメ終了待ち
static void EndCaveBaseAnm( actWork * );	// アクター処理終了

static void SetFeTreeBase(void);
static void SetTreeBaseAnm(void);
static void InitTreeBaseAnm( actWork * );	// アクター初期設定
static void WaitTreeBaseAnm( actWork * );	// アニメ終了待ち
static void EndTreeBaseAnm( actWork * );	// アクター処理終了

static void SetFeGrassBase(void);
static void SetGrassBaseAnm(void);
static void InitGrassBaseAnm( actWork * );	// アクター初期設定
static void WaitGrassBaseAnm( actWork * );	// アニメ終了待ち
static void EndGrassBaseAnm( actWork * );	// アクター処理終了

//=========================================================================================
//									グローバル変数
//=========================================================================================
extern const VM_CODE pokelist_base_make_wall[];
extern const VM_CODE pokelist_base_make_tree[];
extern const VM_CODE pokelist_base_make_grass[];

extern u16 base_Palette[];

static const ActOamData base_oam =
{
	0,		//Vﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾓｰﾄﾞ設定
	0,		//OBJﾓｰﾄﾞ設定(NORMAL)
	0,		//ﾓｻﾞｲｸ設定(OFF)
	0,		//ｶﾗｰﾓｰﾄﾞ設定(16色)
	0,		//OBJ形状設定(正方形)

	0,		//Hﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
	1,		//OBJサイズ設定	16x16

	0,		//ｷｬﾗｸﾀｰ数
	2,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第3優先)
	0,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ

	0,		//AffineParam
};

static const actAnm cave_base_anm[] =
{
	{ 0, 8, 0, 0 },
	{ 1, 8, 0, 0 },
	{ 2, 8, 0, 0 },
	{ 3, 8, 0, 0 },
	{ 4, 8, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0},
};
static const actAnm tree_base_anm00[] =
{
	{ 0, 8, 0, 0 },
	{ 1, 8, 0, 0 },
	{ 2, 8, 0, 0 },
	{ 3, 8, 0, 0 },
	{ 4, 8, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0},
};
static const actAnm tree_base_anm01[] =
{
	{ 4, 8, 0, 0 },
	{ 3, 8, 0, 0 },
	{ 2, 8, 0, 0 },
	{ 1, 8, 0, 0 },
	{ 0, 8, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0},
};
static const actAnm tree_base_anm02[] =
{
	{ 0, 8, 1, 0 },
	{ 1, 8, 1, 0 },
	{ 2, 8, 1, 0 },
	{ 3, 8, 1, 0 },
	{ 4, 8, 1, 0 },
	{ ACT_ANMEND, 0, 0, 0},
};
static const actAnm tree_base_anm03[] =
{
	{ 4, 8, 1, 0 },
	{ 3, 8, 1, 0 },
	{ 2, 8, 1, 0 },
	{ 1, 8, 1, 0 },
	{ 0, 8, 1, 0 },
	{ ACT_ANMEND, 0, 0, 0},
};
static const actAnm grass_base_anm[] =
{
	{ 0, 8, 0, 0 },
	{ 1, 8, 0, 0 },
	{ 2, 8, 0, 0 },
	{ 3, 8, 0, 0 },
	{ 4, 8, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0},
};

static const actAnm * const CaveBaseAnmTbl[] = {
	cave_base_anm,
};
static const actAnm * const TreeBaseAnmTbl[] = 
{
	tree_base_anm00,
	tree_base_anm01,
	tree_base_anm02,
	tree_base_anm03,
};
static const actAnm * const GrassBaseAnmTbl[] = 
{
	grass_base_anm,
};

static const actAnmData cave_base_celltrans[] =
{
	{ (const u8 *)base_ef1_Character,         0x20 * 4 },
	{ (const u8 *)base_ef1_Character + 0x080, 0x20 * 4 },
	{ (const u8 *)base_ef1_Character + 0x100, 0x20 * 4 },
	{ (const u8 *)base_ef1_Character + 0x180, 0x20 * 4 },
	{ (const u8 *)base_ef1_Character + 0x200, 0x20 * 4 },
};
static const actAnmData tree_base_celltrans[] =
{
	{ (const u8 *)base_ef3_Character,         0x20 * 4 },
	{ (const u8 *)base_ef3_Character + 0x080, 0x20 * 4 },
	{ (const u8 *)base_ef3_Character + 0x100, 0x20 * 4 },
	{ (const u8 *)base_ef3_Character + 0x180, 0x20 * 4 },
	{ (const u8 *)base_ef3_Character + 0x200, 0x20 * 4 },
};
static const actAnmData grass_base_celltrans[] =
{
	{ (const u8 *)base_ef2_Character,         0x20 * 4 },
	{ (const u8 *)base_ef2_Character + 0x080, 0x20 * 4 },
	{ (const u8 *)base_ef2_Character + 0x100, 0x20 * 4 },
	{ (const u8 *)base_ef2_Character + 0x180, 0x20 * 4 },
	{ (const u8 *)base_ef2_Character + 0x200, 0x20 * 4 },
};

static const actHeader ActCaveBaseHeader =
{
	ACT_TMODE,
	FE_CaveBase_PalID,
	&base_oam,
	CaveBaseAnmTbl,
	cave_base_celltrans,
	DummyActAffTbl,
	InitCaveBaseAnm,
};
static const actHeader ActTreeBaseHeader =
{
	ACT_TMODE,
	FE_FldBase_PalID,
	&base_oam,
	TreeBaseAnmTbl,
	tree_base_celltrans,
	DummyActAffTbl,
	InitTreeBaseAnm,
};
static const actHeader ActGrassBaseHeader =
{
	ACT_TMODE,
	FE_FldBase_PalID,
	&base_oam,
	GrassBaseAnmTbl,
	grass_base_celltrans,
	DummyActAffTbl,
	InitGrassBaseAnm,
};

const PalData CaveBasePal =
{
	&base_ef1_Palette[0],FE_CaveBase_PalID
};
const PalData FldBasePal =
{
	&base_ef0_Palette[0], FE_FldBase_PalID
};


//========================================================================================
//========================================================================================

//-------------------------------------------------------
//	リストから使用した場合に基地情報を取得
//-------------------------------------------------------
static void ListUseSetBaseNo(void)
{
	GetBaseNo( &hiden_pos, NowMap.Sxy );	// 基地番号取得
	BaseCheck();							// 配列番号取得
}

//-----------------------------------
//		エフェクト表示位置設定
//-----------------------------------
static void SetFePos(void)
{
	switch( FeSetWork[ FE_SITE ] ){
	case SITE_D:
		FeSetWork[ FE_WORK_XPOS ] = 8;
		FeSetWork[ FE_WORK_YPOS ] = 40;
		break;
	case SITE_U:
		FeSetWork[ FE_WORK_XPOS ] = 8;
		FeSetWork[ FE_WORK_YPOS ] = 8;
		break;
	case SITE_L:
		FeSetWork[ FE_WORK_XPOS ] = -8;
		FeSetWork[ FE_WORK_YPOS ] = 24;
		break;
	case SITE_R:
		FeSetWork[ FE_WORK_XPOS ] = 24;
		FeSetWork[ FE_WORK_YPOS ] = 24;
	}
}

//------------------------------------------------------
//		デバッグメニューから使用する場合のチェック
//------------------------------------------------------
#ifdef	PM_DEBUG

void TestHimitunotikara(void)
{
	u16	atb;

	MyBaseCheck();
	if( AnswerWork == 1 ){
		ResetForceEvent();
		return;
	}

	if( GetHeroSite() != SITE_U ){
		ResetForceEvent();
		return;
	}

	GetHeroFrontCellPos( &hiden_pos.x, &hiden_pos.y );
	atb = GetCellAttribute( hiden_pos.x, hiden_pos.y );

	// 洞窟
	if( ATR_IsMakeScoopBaseCheck( atb ) == TRUE ){
		ListUseSetBaseNo();
		FPokeNo = 0;
		SetFeCaveBase();
		return;
	}
	// 木
	if( ATR_IsMakeRopeBaseCheck( atb ) == TRUE ){
		ListUseSetBaseNo();
		FPokeNo = 0;
		SetFeTreeBase();
		return;
	}
	// 草
	if( ATR_IsMakeKamaBaseCheck( atb ) == TRUE ){
		ListUseSetBaseNo();
		FPokeNo = 0;
		SetFeGrassBase();
		return;
	}

	ResetForceEvent();
}

#endif	PM_DEBUG


//----------------------------------------------------
//		ポケモンリストから使用する場合のチェック
//----------------------------------------------------
u8	HimitunotikaraCheck(void)
{
	u16	atb;

	MyBaseCheck();
	if( AnswerWork == 1 )	return	FALSE;

	if( GetHeroSite() != SITE_U )	return	FALSE;

	GetHeroFrontCellPos( &hiden_pos.x, &hiden_pos.y );
	atb = GetCellAttribute( hiden_pos.x, hiden_pos.y );

	// 洞窟
	if( ATR_IsMakeScoopBaseCheck( atb ) == TRUE ){
		ListUseSetBaseNo();
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeCaveBase;
		return	TRUE;
	}
	// 木
	if( ATR_IsMakeRopeBaseCheck( atb ) == TRUE ){
		ListUseSetBaseNo();
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeTreeBase;
		return	TRUE;
	}
	// 草
	if( ATR_IsMakeKamaBaseCheck( atb ) == TRUE ){
		ListUseSetBaseNo();
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeGrassBase;
		return	TRUE;
	}

	return	FALSE;
}

//========================================================================================
//									壁を掘って作成
//========================================================================================
static void SetFeCaveBase(void)
{
	FeSetWork[0] = FPokeNo;
	StartFieldScript( pokelist_base_make_wall );
}

u32 FeCaveBase(void)
{
	u8	id;

	id = EffectTaskSet();

	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H(	SetCaveBaseAnm );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L(	SetCaveBaseAnm );

	return	0;
}

//-------------------------------
//		エフェクト呼び出し
//-------------------------------
static void SetCaveBaseAnm( void )
{
	FeCodeDel( FECODE_CaveBase );
	FldEffSet( FECODE_CaveBase2 );
}

u32 FeCaveBase2(void)
{
	SetFePos();
	AddActor(
		&ActCaveBaseHeader,
		EFFECT_POSX+FeSetWork[ FE_WORK_XPOS ],
		EFFECT_POSY+FeSetWork[ FE_WORK_YPOS ],
		EVOBJ_LOW_ACTPRI0 );

	return	0;
}

//-----------------------------
//		アクター初期設定
//-----------------------------
static void InitCaveBaseAnm( actWork * act )
{
	SePlay( SE_W088 );
	act->work[0] = 0;
	act->move = WaitCaveBaseAnm;
}

//-----------------------------
//		アニメ終了待ち
//-----------------------------
static void WaitCaveBaseAnm( actWork * act )
{
	if( act->work[0] < CAVE_EFFECT_CNT ){
		act->work[0]++;
		if( act->work[0] == ( CAVE_EFFECT_CNT >> 1 ) )
			BaseSetCell();
	}else{
		act->work[0] = 0;
		act->move = EndCaveBaseAnm;
	}
}

//-----------------------------
//		アクター処理終了
//-----------------------------
static void EndCaveBaseAnm( actWork * act )
{
	FeDelActCode( act, FECODE_CaveBase2 );
	ContinueFieldScript();
}

//=========================================================================================
//									木の上に作成
//=========================================================================================
static void SetFeTreeBase(void)
{
	FeSetWork[0] = FPokeNo;
	StartFieldScript( pokelist_base_make_tree );
}

u32 FeTreeBase(void)
{
	u8	id;

	id = EffectTaskSet();

	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H(	SetTreeBaseAnm );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L(	SetTreeBaseAnm );

	return	0;
}

//------------------------------------------------
//		エフェクト呼び出し
//------------------------------------------------
static void SetTreeBaseAnm(void)
{
	FeCodeDel( FECODE_TreeBase );
	FldEffSet( FECODE_TreeBase2 );
}

u32 FeTreeBase2(void)
{
	s16 atb;
	
	atb = GetCellAttribute( hiden_pos.x, hiden_pos.y ) & 0xfff;

	//木の部屋を作成
	if( atb == TREE_L_MAKE_CELL_CODE )	FeSetWork[ FE_WORK_ANM ] = 0;
	if( atb == TREE_R_MAKE_CELL_CODE )	FeSetWork[ FE_WORK_ANM ] = 2;

	SetFePos();
	AddActor(
		&ActTreeBaseHeader,
		EFFECT_POSX+FeSetWork[ FE_WORK_XPOS ],
		EFFECT_POSY+FeSetWork[ FE_WORK_YPOS ],
		EVOBJ_LOW_ACTPRI0 );
	if( FeSetWork[ FE_WORK_ANM ] == 1 || FeSetWork[ FE_WORK_ANM ] == 3 )
		BaseSetCell();

	return	0;
}


//-----------------------------
//		アクター初期設定
//-----------------------------
static void InitTreeBaseAnm( actWork * act )
{
	SePlay( SE_W010 );
	act->anm_no = FeSetWork[ FE_WORK_ANM ];
	act->work[0] = 0;
	act->move = WaitTreeBaseAnm;
}

//-----------------------------
//		アニメ終了待ち
//-----------------------------
static void WaitTreeBaseAnm( actWork * act )
{
	act->work[0]++;

	if( act->work[0] >= TREE_EFFECT_CNT ){
		if( FeSetWork[ FE_WORK_ANM ] == 0 || FeSetWork[ FE_WORK_ANM ] == 2 )
			BaseSetCell();
		act->work[0] = 0;
		act->move = EndTreeBaseAnm;
	}
}

//-----------------------------
//		アクター処理終了
//-----------------------------
static void EndTreeBaseAnm( actWork * act )
{
	FeDelActCode( act, FECODE_TreeBase2 );
	ContinueFieldScript();
}

//=========================================================================================
//									草を刈って作成
//=========================================================================================
static void SetFeGrassBase(void)
{
	FeSetWork[0] = FPokeNo;
	StartFieldScript( pokelist_base_make_grass );
}

u32 FeGrassBase(void)
{
	u8	id;

	id = EffectTaskSet();

	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H(	SetGrassBaseAnm );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L(	SetGrassBaseAnm );

	return	0;
}

//------------------------------------------------
//		エフェクト呼び出し
//------------------------------------------------
static void SetGrassBaseAnm(void)
{
	FeCodeDel( FECODE_GrassBase );
	FldEffSet( FECODE_GrassBase2 );
}

u32 FeGrassBase2(void)
{
	SetFePos();
	AddActor(
		&ActGrassBaseHeader,
		EFFECT_POSX+FeSetWork[ FE_WORK_XPOS ],
		EFFECT_POSY+FeSetWork[ FE_WORK_YPOS ],
		EVOBJ_LOW_ACTPRI0 );

	return	0;
}

//-----------------------------
//		アクター初期設定
//-----------------------------
static void InitGrassBaseAnm( actWork * act )
{
	SePlay( SE_W077 );
	act->work[0] = 0;
	act->move = WaitGrassBaseAnm;
}

//-----------------------------
//		アニメ終了待ち
//-----------------------------
static void WaitGrassBaseAnm( actWork * act )
{
	if( act->work[0] < GRASS_EFFECT_CNT ){
		act->work[0]++;
		if( act->work[0] == (GRASS_EFFECT_CNT>>1) )
			BaseSetCell();
	}else{
		act->work[0] = 0;
		act->move = EndGrassBaseAnm;
	}
}

//-----------------------------
//		アクター処理終了
//-----------------------------
static void EndGrassBaseAnm( actWork * act )
{
	FeDelActCode( act, FECODE_GrassBase2 );
	ContinueFieldScript();
}


//=========================================================================================

//=========================================================================================
//										パソコン
//=========================================================================================
#define	WK_PC_CELL_POSX		0
#define	WK_PC_CELL_POSY		1
#define	WK_PC_ANM_CNT		2

#define	LOG_ON_ANM1			4
#define	LOG_ON_ANM2			( LOG_ON_ANM1 * 2 )
#define	LOG_ON_ANM3			( LOG_ON_ANM1 * 3 )
#define	LOG_ON_ANM4			( LOG_ON_ANM1 * 4 )
#define	LOG_ON_ANM5			( LOG_ON_ANM1 * 5 )

#define	BASE_PC_ON_CELL			548
#define	BASE_MY_PC_OFF_CELL		544
#define	BASE_OTHER_PC_OFF_CELL	545

static void BasePC_LogOn( u8 id );

//---------------------------------------
//	エフェクトスタート
//---------------------------------------
u32 FeBasePC(void)
{
	s16	px, py;
	u8	id;
	
//	SetForceEvent();

	GetHeroFrontCellPos( &px, &py );

	id = AddTask( BasePC_LogOn, 0 );

	TaskTable[id].work[ WK_PC_CELL_POSX ] = px;
	TaskTable[id].work[ WK_PC_CELL_POSY ] = py;
	TaskTable[id].work[ WK_PC_ANM_CNT ]   = 0;

	return	0;
}

static void BasePC_LogOn( u8 id )
{
	s16 * wk = TaskTable[id].work;

	switch( wk[ WK_PC_ANM_CNT] ){
	case LOG_ON_ANM1:
	case LOG_ON_ANM3:
		SetCell( wk[ WK_PC_CELL_POSX ], wk[ WK_PC_CELL_POSY ], BASE_PC_ON_CELL );
		RewriteSingleBG( wk[ WK_PC_CELL_POSX ], wk[ WK_PC_CELL_POSY ] );
		break;

	case LOG_ON_ANM2:
	case LOG_ON_ANM4:
		SetCell( wk[ WK_PC_CELL_POSX ], wk[ WK_PC_CELL_POSY ], BASE_MY_PC_OFF_CELL );
		RewriteSingleBG( wk[ WK_PC_CELL_POSX ], wk[ WK_PC_CELL_POSY ] );
		break;

	case LOG_ON_ANM5:
		SetCell( wk[ WK_PC_CELL_POSX ], wk[ WK_PC_CELL_POSY ], BASE_PC_ON_CELL );
		RewriteSingleBG( wk[ WK_PC_CELL_POSX ], wk[ WK_PC_CELL_POSY ] );
		FeCodeDel( FECODE_BasePC );
		ContinueFieldScript();
		DelTask(id);
		return;
	}

	wk[ WK_PC_ANM_CNT ]++;
}


//---------------------------------------
//	パソコンOFF
//---------------------------------------
void BasePCOffAnm(void)
{
	s16	px, py;

	GetHeroFrontCellPos( &px, &py );

	SePlay( SE_PC_OFF );

	if( GetEventWorkValue( WK_BASE_POSNO ) == 0 )
		SetCell( px, py, BASE_MY_PC_OFF_CELL | CELL_HITCHECK_MASK );
	else
		SetCell( px, py, BASE_OTHER_PC_OFF_CELL | CELL_HITCHECK_MASK );

	RewriteSingleBG( px, py );
}



//=========================================================================================

//=========================================================================================
//									グッズエフェクト
//=========================================================================================
//=========================================================================================
//=========================================================================================
//									水風船・泥団子
//=========================================================================================
static void BreakGoodsBGAnm( u8 id );
static void BreakSePlay( s16 cell );

enum {
	WK_CELL_NO = 0,		// セル番号
	WK_ANM_XPOS,		// BGアニメのX座標
	WK_ANM_YPOS,		// BGアニメのY座標
	WK_ANM_CNT,			// BGアニメカウント
	WK_CELL_PLUS,		// セルオフセット
};

//--------------------------------------------------
//	初期設定
//--------------------------------------------------
void SetBreakGoodsEffect( s16 cell, s16 px, s16 py )
{
	u8	id;

	id = AddTask( BreakGoodsBGAnm, 0 );
	TaskTable[id].work[WK_CELL_NO]   = cell;
	TaskTable[id].work[WK_ANM_XPOS]  = px;
	TaskTable[id].work[WK_ANM_YPOS]  = py;
	TaskTable[id].work[WK_ANM_CNT]   = 0;
	TaskTable[id].work[WK_CELL_PLUS] = 1;
}

//--------------------------------------------------
//	BGアニメタスク
//--------------------------------------------------
static void BreakGoodsBGAnm( u8 id )
{
	s16 * wk = TaskTable[id].work;

	if( wk[WK_ANM_CNT] == 6 )	wk[WK_ANM_CNT] = 0;
	else						wk[WK_ANM_CNT]++;

	if( wk[WK_ANM_CNT] == 0 ){
		if( wk[WK_CELL_PLUS] == 2 )	BreakSePlay( wk[WK_CELL_NO] );
		SetCell( wk[WK_ANM_XPOS], wk[WK_ANM_YPOS], wk[WK_CELL_NO]+wk[WK_CELL_PLUS] );
		RewriteSingleBG( wk[ WK_ANM_XPOS ], wk[ WK_ANM_YPOS ] );
		if( wk[WK_CELL_PLUS] == 3 ){
			DelTask(id);
			return;
		}
		wk[WK_CELL_PLUS]++;
	}
}

//--------------------------------------------------
//	SEを再生
//--------------------------------------------------
static void BreakSePlay( s16 cell )
{
	switch( cell ){
	case GOODS_FUSEN1:
		SePlay( SE_FUUSEN1 );
		break;
	case GOODS_FUSEN2:
		SePlay( SE_FUUSEN2 );
		break;
	case GOODS_FUSEN3:
		SePlay( SE_FUUSEN3 );
		break;
	case GOODS_DORO:
		SePlay( SE_TOY_DANGO );
	}
}


//--------------------------------------------------
//	フィールドエフェクト（未使用）
//--------------------------------------------------
// 水風船エフェクト
u32 FeFusenGoods(void)
{
	return	0;
}
// 泥団子エフェクト
u32 FeDoroGoods(void)
{
	return	0;
}


//========================================================================================
//									つきやぶれるドア
//========================================================================================
#define	GOODS_DOOR_U	622
#define	GOODS_DOOR_D	630

static void BreakDoorMain( s16 x, s16 y )
{
	SePlay( SE_TOY_KABE );
	SetCell( x, y,   GOODS_DOOR_D );
	SetCell( x, y-1, GOODS_DOOR_U );
	RewriteSingleBG( x, y );
	RewriteSingleBG( x, y-1 );
}

static void BreakDoorTask( u8 id )
{
	if( TaskTable[id].work[0] == 7 ){
		BreakDoorMain( TaskTable[id].work[1], TaskTable[id].work[2] );
		DelTask(id);
	}else	TaskTable[id].work[0]++;
}

void BaseBreakDoor( s16 x, s16 y )
{
	u8	id = 0;
	u8	site;

	site = GetHeroSite();

	if( site == SITE_D ){
		BreakDoorMain( x, y );
		return;
	}
	if( site == SITE_U ){
		id = AddTask( BreakDoorTask, 5 );
		TaskTable[id].work[0] = 0;
		TaskTable[id].work[1] = x;
		TaskTable[id].work[2] = y;
	}
}

//========================================================================================
//										音マット
//========================================================================================
#define	GOODS_SOUND_CODE_C	632		// 「ド」
#define	GOODS_SOUND_CODE_D	633		// 「レ」
#define	GOODS_SOUND_CODE_E	634		// 「ミ」
#define	GOODS_SOUND_CODE_F	635		// 「ファ」
#define	GOODS_SOUND_CODE_G	636		// 「ソ」
#define	GOODS_SOUND_CODE_A	637		// 「ラ」
#define	GOODS_SOUND_CODE_B	638		// 「シ」
#define	GOODS_SOUND_CODE_C2	691		// 「ド2」

static void SoundMatMain( u8 id )
{
	if( TaskTable[id].work[1] == 7 ){
		switch( TaskTable[id].work[0] ){
		case GOODS_SOUND_CODE_C:
			SePlay( SE_TOY_C );
			break;
		case GOODS_SOUND_CODE_D:
			SePlay( SE_TOY_D );
			break;
		case GOODS_SOUND_CODE_E:
			SePlay( SE_TOY_E );
			break;
		case GOODS_SOUND_CODE_F:
			SePlay( SE_TOY_F );
			break;
		case GOODS_SOUND_CODE_G:
			SePlay( SE_TOY_G );
			break;
		case GOODS_SOUND_CODE_A:
			SePlay( SE_TOY_A );
			break;
		case GOODS_SOUND_CODE_B:
			SePlay( SE_TOY_B );
			break;
		case GOODS_SOUND_CODE_C2:
			SePlay( SE_TOY_C1 );
		}
		DelTask(id);
	}else	TaskTable[id].work[1]++;
}

void BaseSoundMat( s16 code )
{
	u8	id;

	id = AddTask( SoundMatMain, 5 );
	TaskTable[id].work[0] = code;
	TaskTable[id].work[1] = 0;
}


//========================================================================================
//										きらきらマット
//========================================================================================
static void KiraKiraMatActMove( actWork * act )
{
	act->work[0]++;
	if( act->work[0] == 8 )
		SePlay( SE_W215 );

	if( act->work[0] >= 32 )
		DelActor( act );
}

void BaseKiraKiraMat(void)
{
	s16	x, y;
	u8	no;

	x = EvObj[MyMoveState.evobjno].gx;
	y = EvObj[MyMoveState.evobjno].gy;

	MapCellSizePosDiffOffs( &x, &y, 8, 4 );

	no = AddActorBottom( EvActHeadGet(EVACT_SEEDEFFECT), x, y, 0 );

	if( no != ACT_MAX ){
		ActWork[no].scr = 1;
		ActWork[no].oamData.Priority = 1;
		ActWork[no].oamData.Pltt = OTHERS_OBJ_PALNO_3;
		ActWork[no].move = KiraKiraMatActMove;
		ActWork[no].work[0] = 0;
	}
}


//=========================================================================================
//									砂の置物
//=========================================================================================
#define	SNDOBJ_EFFECT_CNT	18
#define	SNDOBJ_END_CELL		652
#define	SNDOBJ_UP_FLOOR		644

static void SndObjBreakAnm01( actWork * act );
static void SndObjBreakAnm02( actWork * act );
static void SndObjBreakAnm03( actWork * act );

static const ActOamData snd_obj_oam =
{
	0,		//Vﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾓｰﾄﾞ設定
	0,		//OBJﾓｰﾄﾞ設定(NORMAL)
	0,		//ﾓｻﾞｲｸ設定(OFF)
	0,		//ｶﾗｰﾓｰﾄﾞ設定(16色)
	2,		//OBJ形状設定(縦長方形)

	0,		//Hﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
	2,		//OBJサイズ設定	16x32

	0,		//ｷｬﾗｸﾀｰ数
	2,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第3優先)
	0,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ

	0,		//AffineParam
};

static const actAnm snd_break_anm[] =
{
	{ 0, 6, 0, 0 },
	{ 1, 6, 0, 0 },
	{ 2, 6, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0},
};
static const actAnm * const SndBreakAnmTbl[] = 
{
	snd_break_anm,
};

static const actAnmData snd_obj_celltrans[] =
{
	{ (const u8 *)snd_obj_Character,         0x20 * 8 },
	{ (const u8 *)snd_obj_Character + 0x100, 0x20 * 8 },
	{ (const u8 *)snd_obj_Character + 0x200, 0x20 * 8 },
};


static const actHeader ActSndObjHeader = {
	ACT_TMODE,
	FE_SndObjGoods_PalID,
	&snd_obj_oam,
	SndBreakAnmTbl,
	snd_obj_celltrans,
	DummyActAffTbl,
	SndObjBreakAnm01,
};

const PalData SndObjPal  = { &base_Palette[16*5],  FE_SndObjGoods_PalID  };


//------------------------------
//		砂の置物エフェクト
//------------------------------
u32 FeSndObjGoods(void)
{
	s16	px, py;

	SetForceEvent();

	GetHeroFrontCellPos( &px, &py );

	FeSetWork[ FE_WORK_XPOS ] = px;
	FeSetWork[ FE_WORK_YPOS ] = py;

	switch( GetHeroSite() ){
	case SITE_D:
		AddActor( &ActSndObjHeader, EFFECT_POSX+8, EFFECT_POSY+32, 0 );
		break;
	case SITE_U:
		AddActor( &ActSndObjHeader, EFFECT_POSX+8, EFFECT_POSY, EVOBJ_LOW_ACTPRI0 );
		break;
	case SITE_L:
		AddActor( &ActSndObjHeader, EFFECT_POSX-8, EFFECT_POSY+16, EVOBJ_LOW_ACTPRI0 );
		break;
	case SITE_R:
		AddActor( &ActSndObjHeader, EFFECT_POSX+24, EFFECT_POSY+16, EVOBJ_LOW_ACTPRI0 );
	}

	return	0;
}

//-----------------------------
//		アクター初期設定
//-----------------------------
static void SndObjBreakAnm01( actWork * act )
{
	SePlay( SE_W088 );

	if( GetCellCode( FeSetWork[ FE_WORK_XPOS ], FeSetWork[ FE_WORK_YPOS ]-1 ) == GOODS_SAND_WALL ){
		SetCell( FeSetWork[ FE_WORK_XPOS ], FeSetWork[ FE_WORK_YPOS ]-1, GOODS_DUMMY2 | CELL_HITCHECK_MASK );
	}else
		SetCell( FeSetWork[ FE_WORK_XPOS ], FeSetWork[ FE_WORK_YPOS ]-1, SNDOBJ_UP_FLOOR );
	SetCell( FeSetWork[ FE_WORK_XPOS ], FeSetWork[ FE_WORK_YPOS ], GOODS_DUMMY );
	RewriteSingleBG( FeSetWork[ FE_WORK_XPOS ], FeSetWork[ FE_WORK_YPOS ]-1 );
	RewriteSingleBG( FeSetWork[ FE_WORK_XPOS ], FeSetWork[ FE_WORK_YPOS ] );
	act->work[0] = 0;
	act->move = SndObjBreakAnm02;
}

//-----------------------------
//		アニメ終了待ち
//-----------------------------
static void SndObjBreakAnm02( actWork * act )
{
	if( act->work[0] < SNDOBJ_EFFECT_CNT ){
		act->work[0]++;
	}else{
		SetCell(
			FeSetWork[FE_WORK_XPOS], FeSetWork[FE_WORK_YPOS],
			SNDOBJ_END_CELL | CELL_HITCHECK_MASK );
		RewriteSingleBG( FeSetWork[ FE_WORK_XPOS ], FeSetWork[ FE_WORK_YPOS ] );
		act->work[0] = 0;
		act->move = SndObjBreakAnm03;
	}
}

//-----------------------------
//		アクター処理終了
//-----------------------------
static void SndObjBreakAnm03( actWork * act )
{
	FeDelActCode( act, FECODE_SndObjGoods );
	ContinueFieldScript();
}


//=========================================================================================
//								金の盾・銀の盾・おもちゃのテレビ
//=========================================================================================
#define	KINNOTATE_CELL_CODE			822		//「金の盾」のセルコード
#define	GINNOTATE_CELL_CODE			734		//「銀の盾」のセルコード
#define	TEREBI_CELL_CODE			756		//「テレビ」のセルコード
#define	MARUI_TEREBI_CELL_CODE		757		//「まるいテレビ」のセルコード
#define	KAWAII_TEREBI_CELL_CODE		758		//「かわいいテレビ」のセルコード

//------------------------------------------
//	セルコードチェック
//------------------------------------------
void BaseGoodsTateCheck(void)
{
	s16	px, py;

	GetHeroFrontCellPos( &px, &py );

	switch( GetCellCode( px, py ) ){
	case KINNOTATE_CELL_CODE:		//「金の盾」のセルコード
		PM_NumMsgSet( StrTempBuffer0, 100, NUM_MODE_LEFT, 3 );
		PM_strcpy( StrTempBuffer1, str_goods_tate00 );
		AnswerWork = 0;
		break;

	case GINNOTATE_CELL_CODE:		//「銀の盾」のセルコード
		PM_NumMsgSet( StrTempBuffer0, 50, NUM_MODE_LEFT, 2 );
		PM_strcpy( StrTempBuffer1, str_goods_tate01 );
		AnswerWork = 0;
		break;

	case TEREBI_CELL_CODE:			//「テレビ」のセルコード
		AnswerWork = 1;
		break;

	case MARUI_TEREBI_CELL_CODE:	//「まるいテレビ」のセルコード
		AnswerWork = 2;
		break;

	case KAWAII_TEREBI_CELL_CODE:	//「かわいいテレビ」のセルコード
		AnswerWork = 3;
	}
}
