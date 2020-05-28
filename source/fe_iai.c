//=========================================================================================
//								フィールドエフェクト・居合斬り
//									2001/5/25 by nakahiro
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
#include "fld_talk.h"
#include "f_pmlist.h"
#include "record.h"

//=========================================================================================
//										シンボル
//=========================================================================================
#define	G_GRASS_CELL		13		// フィールドの草
#define	TREE_L_GRASS_CELL	454		// 木の裏の草　左
#define	TREE_R_GRASS_CELL	455		// 木の裏の草　右
#define	LONG_U_GRASS_CELL	21		// 長い草　上
#define	LONG_D_GRASS_CELL	520		// 長い草　下
#define	BASE_L_GRASS_CELL	641		// 草の秘密基地　左
#define	BASE_C_GRASS_CELL	642		// 草の秘密基地　中央
#define	BASE_R_GRASS_CELL	643		// 草の秘密基地　右
#define	D1_ASH_GRASS_CELL	518		// 送り火山の草　灰無し
#define	D2_ASH_GRASS_CELL	519		// 送り火山の草　灰有り
#define	F1_ASH_GRASS_CELL	522		// フィールドの草　灰無し
#define	F2_ASH_GRASS_CELL	530		// フィールドの草　灰有り
#define	MORI_D_GRASS_CELL	 37		// 森の下の草

#define	GREEN_CELL			1		// フィールド
#define	TREE_L_CELL			462		// 木の裏　左
#define	TREE_R_CELL			463		// 木の裏　右
#define	BASE_L_CELL			633		// 草の秘密基地　左
#define	BASE_C_CELL			634		// 草の秘密基地　中央
#define	BASE_R_CELL			635		// 草の秘密基地　右
#define	D_ASH_CELL			625		// 送り火山　灰有り
#define	F_ASH_CELL			536		// フィールド　灰有り
#define	MORI_D_CELL			 14		// 森の下


#define IAIGIRIXPOS	ActWork[MyMoveState.actno].oamData.HPos	// 表示基準X位置
#define IAIGIRIYPOS	ActWork[MyMoveState.actno].oamData.VPos	// 表示基準Y位置

#define CUT_LOOP	3
#define	GRASS_ACT	( (u8*)&UserWork[0x1fff0] )

//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void SetForceEvent( void );
extern void ResetForceEvent( void );
extern s16 SinMove(s16, s16);
extern s16 CosMove(s16, s16);
extern void	ControlFieldScroll(void);
extern void StartExtraInit(void);		//フィールドエフェクト初期設定
extern void (*ExtraInit)(void);

static void SetGrassCutAct(void);
static void SetTreeCutAct(void);

static void SetFeGrassCut(void);
static void SetFeTreeCut(void);

//=========================================================================================
//									グローバル変数
//=========================================================================================
extern const VM_CODE pokelist_iai_tree[];

//=========================================================================================
//									いあいぎり処理呼び出し
//=========================================================================================
//------------------------------------------------------
//		デバッグメニューから使用する場合のチェック
//------------------------------------------------------
#ifdef	PM_DEBUG

void TestIaigiri(void)
{
	u8	attr;
	u8	i, j;
	s16	px,py;

	// 木を斬る
	if( CheckFrontOBJCode( TREE1 ) == TRUE ){
		FPokeNo = 0;
		SetFeTreeCut();
		return;
	}

	GetHeroCellPos( &hiden_pos.x, &hiden_pos.y );

	// 草を斬る
	for( i=0; i<CUT_LOOP; i++ ){
		py = hiden_pos.y - 1 + i;
		for( j=0; j<CUT_LOOP; j++ ){
			px = hiden_pos.x - 1 + j;
			if( GetCellHeight( px, py ) == hiden_pos.z ){
				attr = GetCellAttribute( px, py );
				if( ATR_IsGrassCheck( attr ) == TRUE ||
					ATR_AshGrassCheck( attr ) == TRUE )
				{
					FPokeNo = 0;
					SetFeGrassCut();
					return;
				}
			}
		}
	}

	ResetForceEvent();
}

#endif	PM_DEBUG

//----------------------------------------------------
//		ポケモンリストから使用する場合のチェック
//----------------------------------------------------
u8	IaigiriCheck(void)
{
	u8	attr;
	u8	i, j;
	s16	px,py;

	// 木を斬る
	if( CheckFrontOBJCode( TREE1 ) == TRUE ){
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeTreeCut;
		return	TRUE;
	}

	GetHeroCellPos( &hiden_pos.x, &hiden_pos.y );

	// 草を斬る
	for( i=0; i<CUT_LOOP; i++ ){
		py = hiden_pos.y - 1 + i;
		for( j=0; j<CUT_LOOP; j++ ){
			px = hiden_pos.x - 1 + j;
			if( GetCellHeight( px, py ) == hiden_pos.z ){
				attr = GetCellAttribute( px, py );
				if( ATR_IsGrassCheck( attr ) == TRUE ||
					ATR_AshGrassCheck( attr ) == TRUE )
				{
					pFieldRecoverFunc = StartExtraInit;
					ExtraInit = SetFeGrassCut;
					return	TRUE;
				}
			}
		}
	}

	return	FALSE;
}

//--------------------------------------
//		いあいぎりエフェクトセット
//--------------------------------------
// 草
static void SetFeGrassCut(void)
{
	FldEffSet( FECODE_IaiGrass );
	FeSetWork[0] = FPokeNo;
}

u32 FeGrassCut(void)
{
	u8 id;

	id = EffectTaskSet();

	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H(	SetGrassCutAct );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L(	SetGrassCutAct );

	IncRecord( CNT_HIDEN_IAIGIRI );
	return	0;
}

// 木
static void SetFeTreeCut(void)
{
	FeSetWork[0] = FPokeNo;
	StartFieldScript( pokelist_iai_tree );	// スクリプト起動(タスクで制御)
}

u32 FeTreeCut(void)
{
	u8	id;

	id = EffectTaskSet();

	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H(	SetTreeCutAct );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L(	SetTreeCutAct );

	IncRecord( CNT_HIDEN_IAIGIRI );
	return	0;
}


//=========================================================================================
//										草を斬る
//=========================================================================================
static void InitFldGrassAnm( actWork * );		// アクター初期設定
static void NextFldGrassAnm( actWork * );		// アクター移動処理
static void EndFldGrassAnm( actWork * );		// アクター処理終了
static void ChangeGrassCell( s16, s16 );		// 地面のセルに書き換える
static void LongGrassArrangeH( s16, s16 );		// 長い草用補正処理

extern const u8		objgrass_Character[];
extern const u16	objgrass_Palette[];

static const ActOamData fld_grass_oam =
{
	0,		//Vﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾓｰﾄﾞ設定
	0,		//OBJﾓｰﾄﾞ設定(NORMAL)
	0,		//ﾓｻﾞｲｸ設定(OFF)
	0,		//ｶﾗｰﾓｰﾄﾞ設定(16色)
	0,		//OBJ形状設定(正方形)

	0,		//Hﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
	0,		//OBJサイズ設定	8x8

	1,		//ｷｬﾗｸﾀｰ数
	1,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第2優先)
	1,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ				// ﾊﾟﾚｯﾄ1

	0,		//AffineParam
};

static const actAnm fld_grass_anm[] =
{
	{OBJ16_8x8 * 0, 30, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm * const FldGrassAnmTbl[] = 
{
	fld_grass_anm,
};
static const actAnmData a_grass_celltrans[] =
{
	{ (const u8 *)objgrass_Character, 0x20*1 }
};
const PalData GrassPal = { objgrass_Palette, FE_Grass_PalID };

static const actHeader ActFldGrassHeader =
{
	ACT_TMODE,
	FE_Grass_PalID,
	&fld_grass_oam,
	FldGrassAnmTbl,
	a_grass_celltrans,
	DummyActAffTbl,
	InitFldGrassAnm,
};

//------------------------------------------
//	居合い斬りエフェクト呼び出し
//------------------------------------------
static void SetGrassCutAct(void)
{
	FeCodeDel( FECODE_IaiGrass );
	FldEffSet( FECODE_IaiGrass2 );
}

//------------------------------------------
//	居合い斬りエフェクト
//------------------------------------------
u32 FeGrassCut2(void)
{
	u8	i = 0, j = 0;
	u8	attr = 0;
	s16	posx = 0, posy = 0;
	u8	site;

	SePlay( SE_W015 );

	site = FeSetWork[ FE_SITE ] - 1;

	GetHeroCellPos( &hiden_pos.x, &hiden_pos.y );

	// セル書き換え
	for( i=0; i<CUT_LOOP; i++ ){
		posy = hiden_pos.y - 1 + i;
		for( j=0; j<CUT_LOOP; j++ ){
			posx = hiden_pos.x - 1 + j;
			if( GetCellHeight( posx, posy ) == hiden_pos.z ){
				attr = GetCellAttribute( posx, posy );
				if( ATR_IsIaiGrassCheck( attr ) == TRUE ){
					ChangeGrassCell( posx, posy );
					EvObjMapPosMvFlagOn( posx, posy );
				}
			}
		}
	}

	LongGrassArrangeH( hiden_pos.x-1, hiden_pos.y-2 );

	MakeMapBG();

	// アクターセット
	for( i=0; i<8; i++ ){
		GRASS_ACT[i] = AddActor( &ActFldGrassHeader,
								 IAIGIRIXPOS + 8,
								 IAIGIRIYPOS + 20, 0 );
		ActWork[ GRASS_ACT[i] ].work[2] = 32*i;
	}

	return	0;
}

//------------------------------------------
//	地面のセルに書き換える
//------------------------------------------
static void ChangeGrassCell( s16 x, s16 y )
{
	switch( GetCellCode( x, y ) ){
	case G_GRASS_CELL:			// フィールドの草
	case LONG_U_GRASS_CELL:		// 長い草　上
	case LONG_D_GRASS_CELL:		// 長い草　下
		SetCell( x, y, GREEN_CELL );
		break;
	case TREE_L_GRASS_CELL:		// 木の裏の草　左
		SetCell( x, y, TREE_L_CELL );
		break;
	case TREE_R_GRASS_CELL:		// 木の裏の草　右
		SetCell( x, y, TREE_R_CELL );
		break;
	case BASE_L_GRASS_CELL:		// 草の秘密基地　左
		SetCell( x, y, BASE_L_CELL );
		break;
	case BASE_C_GRASS_CELL:		// 草の秘密基地　中央
		SetCell( x, y, BASE_C_CELL );
		break;
	case BASE_R_GRASS_CELL:		// 草の秘密基地　右
		SetCell( x, y, BASE_R_CELL );
		break;
	case D1_ASH_GRASS_CELL:		// 送り火山の草　灰無し
	case D2_ASH_GRASS_CELL:		// 送り火山の草　灰有り
		SetCell( x, y, D_ASH_CELL );
		break;
	case F1_ASH_GRASS_CELL:		// フィールドの草　灰無し
	case F2_ASH_GRASS_CELL:		// フィールドの草　灰有り
		SetCell( x, y, F_ASH_CELL );
		break;
	case MORI_D_GRASS_CELL:		// 森の下の草
		SetCell( x, y, MORI_D_CELL );
	}
}

//------------------------------------------
//	長い草用補正処理
//------------------------------------------
static u8 LG_UpCheck( s16 px, s16 py )
{
	u16	cell;

	cell = GetCellCode( px, py );

	if( cell == GREEN_CELL )	return	1;
	if( cell == BASE_L_CELL )	return	2;
	if( cell == BASE_C_CELL	)	return	3;
	if( cell == BASE_R_CELL )	return	4;
	return	0;
}

static void LongGrassArrangeH( s16 px, s16 py )
{
	s16	x, y, i;

	y = py + 3;
	for( i=0; i<CUT_LOOP; i++ ){
		// 上
		x = px + i;
		if( GetCellCode( x, py ) == LONG_U_GRASS_CELL ){
			switch( LG_UpCheck( x, py+1 ) ){
			case 1:
				SetCell( x, py+1, LONG_D_GRASS_CELL );
				break;
			case 2:
				SetCell( x, py+1, BASE_L_GRASS_CELL );
				break;
			case 3:
				SetCell( x, py+1, BASE_C_GRASS_CELL );
				break;
			case 4:
				SetCell( x, py+1, BASE_R_GRASS_CELL );
			}
		}

		// 下
		if( GetCellCode( x, y ) == GREEN_CELL ){
			if( GetCellCode( x, y+1 ) == LONG_D_GRASS_CELL )
				SetCell( x, y+1, GREEN_CELL );
			if( GetCellCode( x, y+1 ) == BASE_L_GRASS_CELL )
				SetCell( x, y+1, BASE_L_CELL );
			if( GetCellCode( x, y+1 ) == BASE_C_GRASS_CELL )
				SetCell( x, y+1, BASE_C_CELL );
			if( GetCellCode( x, y+1 ) == BASE_R_GRASS_CELL )
				SetCell( x, y+1, BASE_R_CELL );
		}
	}
}

//------------------------------------------
//	アクター初期設定
//------------------------------------------
static void InitFldGrassAnm( actWork * act )
{
	act->work[0] = 8;
	act->work[1] = 0;
	act->work[3] = 0;
	act->move = NextFldGrassAnm;
}

//------------------------------------------
//	アクター移動処理
//------------------------------------------
static void NextFldGrassAnm( actWork * act )
{
	act->dx = SinMove( act->work[2], act->work[0] );
	act->dy = CosMove( act->work[2], act->work[0] );
	act->work[2] = ( act->work[2] + 8 ) & 0xff;

	act->work[0] += ( 1 + ( act->work[3] >> 2 ) );
	act->work[3]++;

	if( act->work[1] != 28 )	act->work[1]++;
	else						act->move = EndFldGrassAnm;
}

//------------------------------------------
//	アクター処理終了
//------------------------------------------
static void EndFldGrassAnm( actWork * act )
{
	u8	i;

	for( i=1; i<8; i++ )
		DelActor( &ActWork[ GRASS_ACT[i] ] );
	FeDelActCode( &ActWork[ GRASS_ACT[0] ], FECODE_IaiGrass2 );
	TalkEnd();
	ResetForceEvent();
}


//=========================================================================================
//										木を斬る
//=========================================================================================
static void SetTreeCutAct(void)
{
	SePlay( SE_W015 );
	FeCodeDel( FECODE_IaiTree );
	ContinueFieldScript();
}
