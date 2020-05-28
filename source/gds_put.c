//=========================================================================================
//									秘密基地・グッズを置く
//						base_gds.c を分割	2002/02/07 by nakahiro
//=========================================================================================
#include "common.h"
#include "fieldmap.h"
#include "fld_main.h"
#include "script.h"
#include "task.h"
#include "menu.h"
#include "mapbg.h"
#include "palanm.h"
#include "map_attr.h"
#include "itemtool.h"
#include "gds_main.h"
#include "gds_get.h"
#include "goods.h"
#include "mus_tool.h"
#include "message.h"
#include "weather.h"
#include "fld_task.h"

#include "../data/gds_sym.h"

#include "syswork.h"
#include "../script/savework.h"		//OBJCHRWORK参照のため
#include "../script/saveflag.h"		//FE_...

//=========================================================================================
//									シンボル定義
//=========================================================================================
#define	GOODS_OBJ_PAL	3000		// OBJパレット番号

#define	MAP_MAIN_CHAR	NowMap.Screen->MainCharData
#define	MAP_CHAR_DATA	NowMap.Screen->SubCharData

//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern u16	GetMapCellAttributeData(u16);

// A_BUTTON
extern void GoodsGetSet(u8);
// B_BUTTON
extern void GoodsGetCancel(u8);


static void GoodsPutFadeTask(u8);			// グッズ配置へ
static void GoodsSetInit(GoodsOBJ *,u8);	// グッズ配置初期設定
static void GoodsSizeSet(u8);				// グッズのサイズを設定
static void GoodsSetHero(u8,GoodsOBJ *);	// グッズを置く主人公をセット
static void ReturnGoodsMove(u8);			// グッズ移動へ戻る
static void GoodsDataInit(GoodsOBJ *);		// グッズデータ初期化
static void SetBGCellObj(GoodsOBJ *);		// BGセルOBJを作成
static void MakeGoodsActOamData(u8);		// グッズアクターOamData作成
static void MakeCellObj2(GoodsOBJ *);		// セルからキャラを取得
static void MakeCellObjPal(u16 *,u16);		// パレット取得
void ClearMoveParam(void);			// パラメータ初期化
static void PutGoodsCheck(u8);				// グッズ配置確認処理
static void CancelPutInit(u8);				// 置くのをやめる処理
static void PutCancelYes(u8);				// YES
static void PutGoodsInit(u8);				// グッズが置けるとき
static void PutGoodsYes(u8);				// YES
static void NoGoodsMsgWait(u8);				// メッセージウェイト後、グッズ移動
static void GoodsSetMap(u8);				// グッズを配置
static void ReturnGoodsInit(u8);			// グッズ選択へ戻る
static void ReturnBoxFade(u8);				// フェードアウト処理
static void ReturnGoodsSelect(void);		// グッズ選択へ復帰
static void InitGoodsAct(actWork *);		// アクター初期処理
static void GoodsActMove(actWork *);		// 点滅

static void GoodsPutSet(u8);				// スクロール中の処理 ( A_BUTTON )
static void GoodsPutCancel(u8);				// スクロール中の処理 ( B_BUTTON )


//=========================================================================================
//									グローバル変数
//=========================================================================================
extern const VM_CODE obj_goods_set_init[];

static GoodsOBJ	goods_obj = {};		 // 選択グッズデータ

static s16	ObjPosX = 0;
static s16	ObjPosY = 0;

// BGセルからOBJを作成するためのテーブル
static const u8	ptn16x16[] = { 0,1,2,3 };
static const u8	ptn48x16[] = { 0,1,2,3,4,5,8,9,10,11,12,13 };
static const u8	ptn32x32[] = { 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 };
static const u8	ptn16x48[] = { 0,1,4,5,8,9,12,13,16,17,20,21 };
static const u8	ptnShort[] = { 0,1,2,3,4,5,6,7 };
static const u8	ptnLong[]  = { 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31 };
static const u8	ptn48x48[] = { 0,1,2,3,4,5,8,9,10,11,12,13,16,17,18,19,20,21,24,25,26,27,28,29,32,33,34,35, 36,37,40,41,42,43,44,45 };
static const u8	ptn48x32[] = {
	 0, 1,  2, 3,  4, 5,
	 8, 9, 10,11, 12,13,
	16,17, 18,19, 20,21,
	24,25, 26,27, 28,29 };

static const u8	num16x16[] = { 0,0,0,0 };
static const u8	num32x16[] = { 0,0,1,1,0,0,1,1 };
static const u8	num48x16[] = { 0,0,1,1,2,2,0,0,1,1,2,2 };
static const u8	num64x32[] = { 0,0,1,1,2,2,3,3,0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,4,4,5,5,6,6,7,7 };
static const u8	num32x32[] = { 0,0,1,1,0,0,1,1,2,2,3,3,2,2,3,3 };
static const u8	num16x32[] = { 0,0,0,0,1,1,1,1 };
static const u8	num16x48[] = { 0,0,0,0,1,1,1,1,2,2,2,2 };
static const u8	num32x64[] = { 0,0,1,1,0,0,1,1,2,2,3,3,2,2,3,3,4,4,5,5,4,4,5,5,6,6,7,7,6,6,7,7 };
static const u8	num48x48[] = { 0,0,1,1,2,2,0,0,1,1,2,2,3,3,4,4,5,5,3,3,4,4,5,5,6,6,7,7,8,8,6,6,7,7,8,8 };
static const u8	num48x32[] = { 0,0,1,1,2,2,0,0,1,1,2,2,3,3,4,4,5,5,3,3,4,4,5,5 };

static const u8	pls16x16[] = { 4,5,6,7 };
static const u8	pls32x16[] = { 4,5,4,5,6,7,6,7 };
static const u8	pls48x16[] = { 4,5,4,5,4,5,6,7,6,7,6,7 };
static const u8	pls64x32[] = { 4,5,4,5,4,5,4,5,6,7,6,7,6,7,6,7,4,5,4,5,4,5,4,5,6,7,6,7,6,7,6,7 };
static const u8	pls32x32[] = { 4,5,4,5,6,7,6,7,4,5,4,5,6,7,6,7 };
static const u8	pls16x32[] = { 4,5,6,7,4,5,6,7 };
static const u8	pls16x48[] = { 4,5,6,7,4,5,6,7,4,5,6,7 };
static const u8	pls32x64[] = { 4,5,4,5,6,7,6,7,4,5,4,5,6,7,6,7,4,5,4,5,6,7,6,7,4,5,4,5,6,7,6,7 };
static const u8	pls48x48[] = { 4,5,4,5,4,5,6,7,6,7,6,7,4,5,4,5,4,5,6,7,6,7,6,7,4,5,4,5,4,5,6,7,6,7,6,7 };
static const u8	pls48x32[] = { 4,5,4,5,4,5,6,7,6,7,6,7,4,5,4,5,4,5,6,7,6,7,6,7 };

static const BgObjTbl	bg_obj_tbl[] =
{
	{ ptn16x16, num16x16, pls16x16,  4 },	// 16x16
	{ ptnShort, num32x16, pls32x16,  8 },	// 32x16
	{ ptn48x16, num48x16, pls48x16, 12 },	// 48x16
	{ ptnLong,  num64x32, pls64x32, 32 },	// 64x32
	{ ptn32x32, num32x32, pls32x32, 16 },	// 32x32
	{ ptnShort, num16x32, pls16x32,  8 },	// 16x32
	{ ptn16x48, num16x48, pls16x48, 12 },	// 16x48
	{ ptnLong,  num32x64, pls32x64, 32 },	// 32x64
	{ ptn48x48, num48x48, pls48x48, 36 },	// 48x48
	{ ptn48x32, num48x32, pls48x32, 24 }	// 48x32
};

// サイズごとのデータ
static const GoodsSizeData	GoodsSize[] =
{
	{ 0, 1, 120,  80-2 },		// 16x16	ok
	{ 1, 2, 128,  80-2 },		// 32x16	ok
	{ 1, 3, 144,  88-2 },		// 48x16	ok
	{ 1, 3, 144,  72-2 },		// 64x32	ok
	{ 0, 2, 128,  72-2 },		// 32x32	ok
	{ 2, 2, 120,  72-2 },		// 16x32	ok
	{ 2, 3, 128,  88-2 },		// 16x48	ok
	{ 2, 3, 128,  56-2 },		// 32x64
	{ 0, 3, 144,  72-2 },		// 48x48	ok
	{ 1, 3, 144,  72-2 },		// 48x32	ok
};

u8	scr_act = 0;			// スクロール基準アクター
u8	hero_act = 0;			// 主人公アクター番号
static u8	scr_flg = 0;	// スクロールフラグ

// アクターデータ
static ActOamData goods_oam = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

static const actAnm goods_anm[] =
{
	{ 0, 0, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0},
};

static const actAnm * const GoodsAnmTbl[] = 
{
	goods_anm,
};

static const actAnmData goods_celltrans[] =
{
	{ (const u8 *)goods_obj.CharData, 0x40 * 8 * 4 },
};


static const actHeader ActGoodsHeader =
{
	ACT_TMODE,
	GOODS_OBJ_PAL,
	&goods_oam,
	GoodsAnmTbl,
	goods_celltrans,
	DummyActAffTbl,
	InitGoodsAct,
};

const PalData GoodsPal = { &goods_obj.PalData[0], GOODS_OBJ_PAL };

// はい・いいえ処理
static const SELECT_ITEM	YesNoSelectFunc[] =
{
	{ PutGoodsYes,   ReturnGoodsMove      },	// 00:置く
	{ PutCancelYes,  ReturnGoodsMove      },	// 01:置くのをやめる
};

// メニューごとの処理
static const SELECT_ITEM	ScrollSelectFunc[] =
{
	{ GoodsPutSet, GoodsPutCancel },	// 00:グッズを置く
	{ GoodsGetSet, GoodsGetCancel },	// 01:グッズを戻す
};


//=========================================================================================
//										メイン処理
//=========================================================================================
//---------------------
//		初期設定
//---------------------
void GoodsPutInit( u8 id )
{
	if( GoodsMaxCheckAll() == 0 ){
		SetTalkMsg( id, msg_no_goods00, NoGoods2, 0 );
		return;
	}

	TaskTable[id].work[ SCENE_NO ] = 0;
	type_pos = 0;
	GoodsTypeSelectInit(id);
}

//--------------------------------------------
//	特殊なグッズに高さセット
//--------------------------------------------
// おおきなだい
static const u8 height_ookinadai[] = {
	4, 4, 4, 4,
	0, 3, 3, 0
};
// すべりだい
static const u8 height_suberidai[] = {
	4, 4,
	4, 4,
	0, 4,
	3, 0
};

static u16 SpGoodsHeightSet( u8 g_id, u8 no )
{
	u16	mask = 0xffff;

	switch( g_id ){
	case GOODS_OOKINADAI:
		mask = (u16)height_ookinadai[no];
		return	( mask << CELL_HEIGHT_SHIFT );
	case GOODS_SUBERIDAI:
		mask = (u16)height_suberidai[no];
		return	( mask << CELL_HEIGHT_SHIFT );
	}
	return	mask;
}

//----------------------
//		セルセット
//----------------------
static void SetGoodsCell2( u16 x, u16 y, u8 h, u8 v, u16 no )
{
	u16	i,j;
	s16	px,py;
	u16	mask,goods_atb,height;
	u8	wall;

	for( i=0; i<v; i++ ){
		py = y-v+1+i;
		for( j=0; j<h; j++ ){
			px = x+j;

			goods_atb = GetMapCellAttributeData( base_goods[ no ].cell[ i*h+j ] + 512 );

			if(	ATR_IsBaseNoWalkCheck( goods_atb & 0xfff ) == TRUE ||
				( base_goods[no].type != WALK && ( goods_atb >> 12 ) != 0 ) )
			{
				mask = CELL_HITCHECK_MASK;
			}else	mask = 0;

			if( base_goods[no].type != WALL &&
				ATR_IsGoodsPutWallCheck( GetCellAttribute( px, py ) ) == TRUE )
			{
				wall = 1;
			}else	wall = 0;

			height = SpGoodsHeightSet( base_goods[no].id, i*h+j );
			if( height != 0xffff )
				SetCellDirect(
					px, py,
					( base_goods[no].cell[i*h+j]+512+wall ) | mask | height );
			else
				SetCell( px, py, ( base_goods[no].cell[i*h+j]+512+wall ) | mask );
		}
	}
}

void SetGoodsCell( u16 x, u16 y, u16 no )
{
	switch( base_goods[no].size ){
	case size_16x16:
		SetGoodsCell2( x, y, 1, 1, no );
		break;
	case size_32x16:
		SetGoodsCell2( x, y, 2, 1, no );
		break;
	case size_48x16:
		SetGoodsCell2( x, y, 3, 1, no );
		break;
	case size_64x32:
		SetGoodsCell2( x, y, 4, 2, no );
		break;
	case size_32x32:
		SetGoodsCell2( x, y, 2, 2, no );
		break;
	case size_16x32:
		SetGoodsCell2( x, y, 1, 2, no );
		break;
	case size_16x48:
		SetGoodsCell2( x, y, 1, 3, no );
		break;
	case size_32x64:
		SetGoodsCell2( x, y, 2, 4, no );
		break;
	case size_48x48:
		SetGoodsCell2( x, y, 3, 3, no );
		break;
	case size_48x32:
		SetGoodsCell2( x, y, 3, 2, no );
		break;
	}
}

//02/03/04 changed nohara
#define		GOODS_FLAG_START	(FE_BASE_GOODS_FLAG01)
//-----------------------------
//		OBJのグッズを置く
//-----------------------------
void PutOBJGoods(void)
{
	u8	i,j;

	for( j=0; j<14 ;j++ ){

		if( EventFlagCheck(GOODS_FLAG_START+j) == TRUE ){

			EventFlagReset(GOODS_FLAG_START+j);

			for( i=0; i<(NowMap.Sxy->ObjMax); i++){
				if( NowMap.Sxy->ObjData[i].ev_flag == (GOODS_FLAG_START+j) )
					break;
			}

			SetEventWorkValue(
					OBJCHRWORK1+NowMap.Sxy->ObjData[i].obj_code-WKOBJCODE1,
					goods_obj.goods->cell[0] );

			ScriptParameter1 = NowMap.Sxy->ObjData[i].id;
			ScriptParameter2 = ObjPosX;
			ScriptParameter3 = ObjPosY;

			EvObjAddId( (u8)ScriptParameter1, (u8)Fld.MapID.map_id, (u8)Fld.MapID.div_id );
			EvObjPosAllChgId(
				(u8)ScriptParameter1, (u8)Fld.MapID.map_id, (u8)Fld.MapID.div_id,
				(s16)ScriptParameter2, (s16)ScriptParameter3 );
			EvObjSxyIdPosChange( (u8)ScriptParameter1, (u8)Fld.MapID.map_id, (u8)Fld.MapID.div_id );

			return;
		}
	}
}

//----------------------------
//		グッズを置けるか
//----------------------------
static u8 PutSpaceCheck(void)
{
	u16	i;

	for( i=0; i<FURNITURE->max; i++ ){
		if( FURNITURE->id[i] == 0 )
			return	TRUE;
	}
	return	FALSE;
}

//--------------------------------
//		グッズを選択したとき
//--------------------------------
void GoodsSelectPut( u8 id )
{
	if( FURNITURE->type == MY_ROOM_GOODS_TYPE &&
		type_pos != GOODS_DOLL_FOLDER && type_pos != GOODS_CUSHION_FOLDER )
	{
		DelGoodsWindow();
		DelGoodsTypeInfoWin();
		SetTalkMsg( id, msg_goods_put06, SelectGoodsPutNot, 0 );
		return;
	}

	if( GoodsPutCheck() == TRUE ){
		if( PutSpaceCheck() == TRUE ){
//			PaletteFadeReq(0xffffffff,0,0,16,0);
			FieldFadeControl( FIELD_BLACK_OUT, 0 );
			TaskTable[id].work[ FADE_WORK ] = 0;
			TaskTable[id].TaskAdrs = GoodsPutFadeTask;
		}else{
			DelGoodsWindow();
			DelGoodsTypeInfoWin();
			PM_NumMsgSet( StrTempBuffer0, FURNITURE->max, NUM_MODE_SPACE, 2 );
			if( FURNITURE->type == BASE_GOODS_TYPE )
				PM_MsgExpand( MsgExpandBuffer, msg_goods_put04 );
			else
				PM_MsgExpand( MsgExpandBuffer, msg_goods_put14 );
			SetTalkMsg( id, MsgExpandBuffer, SelectGoodsPutNot, 0 );
		}
	}else{
		DelGoodsWindow();
		DelGoodsTypeInfoWin();
		SetTalkMsg( id, msg_goods_put03, SelectGoodsPutNot, 0 );
	}
}

// 置かれていない
static void GoodsPutFadeTask( u8 id )
{
	switch( TaskTable[id].work[ FADE_WORK ] ){
	case 0:
		if( !( FadeData.fade_sw ) ){
			GoodsFuncGlobalPosition(id);
			DelScrCurActor( MARK_ACT_U_CURSOR );
			DelScrCurActor( MARK_ACT_D_CURSOR );
			DelMarkActorAll( mark_act, 8 );
			DelMarkPal();
			TaskTable[id].work[ FADE_WORK ] = 1;
		}
		break;
	case 1:
		FadeData.trans_stop = 1;
		GoodsSetInit( &goods_obj, GoodsType[ select_goods_pos ] );
		GoodsSizeSet( id );
		GoodsSetHero( id, &goods_obj );
//		PaletteFadeReq(0xffffffff,0,16,0,0);
		FieldFadeBlackInSet();
		FadeData.trans_stop = 0;
		TaskTable[id].work[ FADE_WORK ] = 2;
		break;
	case 2:
//		if( !( FadeData.fade_sw ) ){
		if( FieldFadeinCheck() == 1 ){
			TaskTable[id].work[ MENU_NO ] = 0;
			ReturnGoodsMove(id);
		}
	}
}

//--------------------------------
//		グッズ配置初期設定
//--------------------------------
static void GoodsSetInit( GoodsOBJ * g, u8 no )
{
	DelGoodsWindow();
	DelGoodsTypeInfoWin();

	GoodsDataInit(g);

	g->goods = &base_goods[ no ];

	if( g->goods->type != DESK_TOP ){

		SetBGCellObj(g);

		MakeGoodsActOamData( g->goods->size );

		MakeCellObj2(g);
		MakeCellObjPal(
			g->PalData,
			(MAP_CHAR_DATA->CellCharData[g->goods->cell[0]*8+7]) >> 12 );

		ObjPalSet( (PalData *)&GoodsPal );

		scr_act = ActWork[ scroll.work ].work[0];

		scroll.work = AddActor(
			&ActGoodsHeader,
			GoodsSize[g->goods->size].posX,
			GoodsSize[g->goods->size].posY,
			0 );
	}else{

		scr_act = ActWork[ scroll.work ].work[0];

		scroll.work = EvObjMakeAddAct(
			g->goods->cell[0],
			InitGoodsAct,
			GoodsSize[g->goods->size].posX,
			GoodsSize[g->goods->size].posY,
			1	);
		ActWork[scroll.work].oamData.Priority = 1;
	}

}

//--------------------------------------
//		グッズを置く主人公をセット
//--------------------------------------
static void GoodsSetHero( u8 id, GoodsOBJ * g )
{
	u8	h,x;

	h = TaskTable[id].work[ GOODS_H ];

	x = GoodsSize[ g->goods->size ].posX+( h << 4 )-8*( h-1 );
	if( g->goods->size == size_48x16 ||
		g->goods->size == size_48x48 ||
		g->goods->size == size_48x32 )
	{
		x -= 8;
	}

	if( MyData.my_sex == 0 ){
		hero_act = EvObjMakeAddAct( HEROREMODEL, DummyActMove, x, 72, 0 );
	}else{
		hero_act = EvObjMakeAddAct( HINEREMODEL, DummyActMove, x, 72, 0 );
	}

	ActWork[ hero_act ].oamData.Priority = 1;
	DelActor( &ActWork[ scr_act ] );	// 主人公OBJ消去
	scr_act = scroll.work;
}

//---------------------------------
//		グッズのサイズを設定
//---------------------------------
static void GoodsSizeSet( u8 id )
{
	switch( base_goods[ GoodsType[select_goods_pos] ].size ){
	case size_16x16:
		TaskTable[id].work[ GOODS_H ] = 1;
		TaskTable[id].work[ GOODS_V ] = 1;
		break;
	case size_32x16:
		TaskTable[id].work[ GOODS_H ] = 2;
		TaskTable[id].work[ GOODS_V ] = 1;
		break;
	case size_48x16:
		TaskTable[id].work[ GOODS_H ] = 3;
		TaskTable[id].work[ GOODS_V ] = 1;
		break;
	case size_64x32:
		TaskTable[id].work[ GOODS_H ] = 4;
		TaskTable[id].work[ GOODS_V ] = 2;
		break;
	case size_32x32:
		TaskTable[id].work[ GOODS_H ] = 2;
		TaskTable[id].work[ GOODS_V ] = 2;
		break;
	case size_16x32:
		TaskTable[id].work[ GOODS_H ] = 1;
		TaskTable[id].work[ GOODS_V ] = 2;
		break;
	case size_16x48:
		TaskTable[id].work[ GOODS_H ] = 1;
		TaskTable[id].work[ GOODS_V ] = 3;
		TaskTable[id].work[ CELL_POSY ]++;
		break;
	case size_32x64:
		TaskTable[id].work[ GOODS_H ] = 2;
		TaskTable[id].work[ GOODS_V ] = 4;
		break;
	case size_48x48:
		TaskTable[id].work[ GOODS_H ] = 3;
		TaskTable[id].work[ GOODS_V ] = 3;
		break;
	case size_48x32:
		TaskTable[id].work[ GOODS_H ] = 3;
		TaskTable[id].work[ GOODS_V ] = 2;
		break;
	}
}

//------------------------------
//		スクロール中の処理
//------------------------------
// A_BUTTON
static void GoodsPutSet( u8 id )
{
	TaskTable[id].work[ BUTTON_FLG ] = 0;
	ActWork[ scr_act ].work[7] = 1;
	ActWork[ hero_act ].work[7] = 1;
	ClearMoveParam();
	PutGoodsCheck(id);
}
// B_BUTTON
static void GoodsPutCancel( u8 id )
{
	TaskTable[id].work[ BUTTON_FLG ] = 0;
	ActWork[ scr_act ].work[7] = 1;
	ActWork[ hero_act ].work[7] = 1;
	ClearMoveParam();
	SetTalkMsg( id, msg_goods_put02, CancelPutInit, 0 );	// 送りメッセージ
}

//---------------------------------
//		グッズが置けるか確認
//---------------------------------
// お留守番キャラ位置
static u8 PutPosCharCheck( u8 atb, u16 ref_atb )
{
	if( !( ATR_IsBaseCharCheck(atb) == TRUE && ref_atb == 0 ) )
		return	FALSE;
	return	TRUE;

}

// 主人公の位置
static u8 PutPosHeroCheck( u8 id, s16 px, s16 py, u16 ref_atb )
{
	if( px == TaskTable[id].work[HERO_POSX]+MAP_LEFT_MARGIN &&
		py == TaskTable[id].work[HERO_POSY]+MAP_UP_MARGIN &&
		ref_atb != 0 )
	{
		return	FALSE;
	}

	return	TRUE;
}

// FLOOR,WALK専用チェック
static u8 FloorWalkCheck( u16 atb, const GoodsData * g )
{
	// お留守番キャラ位置
	if( ATR_IsBaseCharCheck( atb ) == TRUE )	return	FALSE;

	// じょうぶないた
	if( g->id == GOODS_ZYOUBUNAITA && ATR_IsGoodsPutIta( atb ) == TRUE )
		return	TRUE;

	// 普通に置ける場所以外
	if( ATR_IsGoodsPutFloorCheck( atb ) == FALSE )
		return	FALSE;

	return	TRUE;
}

// メイン
static u8 PutPosMainCheck( u8 id, const GoodsData * g )
{
	u8	i,j;
	u8	V,H,atb;
	s16	px,py;
	u16	ref;

	V = TaskTable[id].work[ GOODS_V ];
	H = TaskTable[id].work[ GOODS_H ];

	switch( g->type ){
	case FLOOR:
	case WALK:
		for( i=0; i<V; i++ ){
			py = TaskTable[id].work[CELL_POSY]-i;
			for( j=0; j<H; j++ ){
				px = TaskTable[id].work[CELL_POSX]+j;
				atb = GetCellAttribute( px, py );
				ref = GetMapCellAttributeData( g->cell[ (V-1-i)*H+j ]+512 ) & 0xf000;

				if( FloorWalkCheck( atb, g ) == FALSE )
					return	FALSE;

				if( PutPosHeroCheck( id, px, py, ref ) == FALSE )	return	FALSE;

				atb = EvObjHitCheck( px, py, 0 );
				if( atb != 0 && atb != EV_OBJ_MAX )		return	FALSE;
			}
		}

		break;

	case CORNER:
		for( i=0; i<V-1; i++ ){
			py = TaskTable[id].work[CELL_POSY]-i;
			for( j=0; j<H; j++ ){
				px = TaskTable[id].work[CELL_POSX]+j;
				atb = GetCellAttribute( px, py );
				ref = GetMapCellAttributeData( g->cell[ (V-1-i)*H+j ]+512 ) & 0xf000;

				if( ATR_IsGoodsPutFloorCheck( atb ) == FALSE &&
					PutPosCharCheck( atb, ref ) == FALSE )
				{
					return	FALSE;
				}
				if( PutPosHeroCheck( id, px, py, ref ) == FALSE )	return	FALSE;
				if( EvObjHitCheck( px, py, 0 ) != EV_OBJ_MAX )	return	FALSE;
			}
		}

		py = TaskTable[id].work[CELL_POSY]-V+1;
		for( j=0; j<H; j++ ){
			px = TaskTable[id].work[CELL_POSX]+j;
			atb = GetCellAttribute( px, py );
			ref = GetMapCellAttributeData( g->cell[j]+512 ) & 0xf000;

			if( ATR_IsGoodsPutFloorCheck( atb ) == FALSE &&
				ATR_IsGoodsPutWallCheck( atb ) == FALSE )
//				&& ATR_IsGoodsNotPutWalkCheck( atb ) == FALSE )//&&
//				PutPosCharCheck( atb, ref ) == FALSE )
			{
				return	FALSE;
			}
			if( PutPosHeroCheck( id, px, py, ref ) == FALSE )	return	FALSE;

			atb = EvObjHitCheck( px, py, 0 );
			if( atb != 0 && atb != EV_OBJ_MAX )		return	FALSE;
		}

		break;

	case WALL:
		for( i=0; i<V; i++ ){
			py = TaskTable[id].work[CELL_POSY]-i;
			for( j=0; j<H; j++ ){
				px = TaskTable[id].work[CELL_POSX]+j;
				if( ATR_IsGoodsPutWallCheck( GetCellAttribute(px,py) ) == FALSE )
					return	FALSE;
			}
		}
		break;

	case DESK_TOP:
		py = TaskTable[id].work[CELL_POSY];
		for( j=0; j<H; j++ ){
			px  = TaskTable[id].work[CELL_POSX]+j;
			atb = GetCellAttribute( px, py );
			if( g->size == size_16x32 ){
				if( ATR_IsBigDollPutCheck( atb ) == FALSE )
					return	FALSE;
			}else{
				if( ATR_IsGoodsPutGoodsCheck( atb ) == FALSE &&
					ATR_IsBigDollPutCheck( atb ) == FALSE )
				{
					return	FALSE;
				}
			}
			if( EvObjHitCheck( px, py, 0 ) != EV_OBJ_MAX )	return	FALSE;
		}
	}

	return	TRUE;
}

//-------------------------------
//		グッズ配置確認処理
//-------------------------------
static void PutGoodsCheck( u8 id )
{
	u8	no;

	no = GoodsType[select_goods_pos];

	if( PutPosMainCheck( id, &base_goods[no] ) == TRUE ){
		SetTalkMsg( id, msg_goods_put00, PutGoodsInit, 0 );	// 置ける
	}else{
		SePlay( SE_HAZURE );
		SetTalkMsg( id, msg_goods_put01, NoGoodsMsgWait, 0 );
	}
}

// 置けるとき
static void PutGoodsInit( u8 id )
{
	YesNoSelectInit( YESNO_WINX, YESNO_WINY );
	SelectToolInit( id, &YesNoSelectFunc[0] );
}
// YES
static void PutGoodsYes( u8 id )
{
	NMenuBoxClear( 0, 0, 29, 19 );
	GoodsSetMap(id);	// グッズを配置

	if( base_goods[ GoodsType[ select_goods_pos ] ].type != DESK_TOP ){
		SetGoodsCell(
			TaskTable[id].work[CELL_POSX],
			TaskTable[id].work[CELL_POSY],
			GoodsType[ select_goods_pos ] );
	}else{
		ObjPosX = TaskTable[id].work[CELL_POSX]-MAP_LEFT_MARGIN;
		ObjPosY = TaskTable[id].work[CELL_POSY]-MAP_UP_MARGIN;
		StartFieldScript( obj_goods_set_init );
	}

	ActWork[scr_act].y += 2;

	ReturnGoodsInit(id);
}

//-------------------------
//		グッズを配置
//-------------------------
static void GoodsSetMap( u8 id )
{
	u16	i;

	for( i=0; i<FURNITURE->max; i++ ){
		if( FURNITURE->id[i] == 0 ){
			FURNITURE->id[i] = GoodsType[ select_goods_pos ];
			FURNITURE->pos[i] =
				( ( TaskTable[id].work[CELL_POSX]-MAP_LEFT_MARGIN ) << 4 ) +
				( TaskTable[id].work[CELL_POSY]-MAP_UP_MARGIN );
			break;
		}
	}

	if( FURNITURE->type == BASE_GOODS_TYPE ){
		for( i=0; i<16; i++ ){
			if( set_goods[i] == 0 ){
				set_goods[i] = select_goods_pos + 1;
				break;
			}
		}
	}else{
		for( i=0; i<12; i++ ){
			if( set_room[i] == 0 ){
				set_room[i] = select_goods_pos + 1;
				break;
			}
		}
	}
}



//-------------------------------
//		置くのをやめる処理
//-------------------------------
static void CancelPutInit( u8 id )
{
	YesNoSelectInit( YESNO_WINX, YESNO_WINY );
	SelectToolInit( id, &YesNoSelectFunc[1] );
}
// YES
static void PutCancelYes( u8 id )
{
	NMenuBoxClear( 0, 0, 29, 19 );
	ReturnGoodsInit(id);
}

//-----------------------------
//		グッズ選択へ戻る
//-----------------------------
static void ReturnGoodsInit( u8 id )
{
//	PaletteFadeReq(0xffffffff,0,0,16,0);
	FieldFadeControl( FIELD_BLACK_OUT, 0 );
	TaskTable[id].work[ FADE_WORK ] = 0;
	TaskTable[id].TaskAdrs = ReturnBoxFade;
}

// フェードアウト処理
static void ReturnBoxFade( u8 id )
{
	switch( TaskTable[id].work[ FADE_WORK ] ){
	case 0:
		SetForceEvent();
		if( !( FadeData.fade_sw ) ){
			SetHeroGlobalPosition(id);
			TaskTable[id].work[ FADE_WORK ] = 1;
		}
		break;
	case 1:
		Del_GDS_CursorPal();
		ObjPalRegNumDel( GOODS_OBJ_PAL );
		pFieldRecoverFunc = ReturnGoodsSelect;
		MainProcChange( FieldMainRecover );
		DelTask(id);
	}
}

// グッズ選択へ復帰
static void ReturnGoodsSelect2( u8 id )
{
	if( FieldFadeinCheck() == 1 )
		TaskTable[id].TaskAdrs = GoodsSelectTask;
}
static void ReturnGoodsSelect(void)
{
	u8	id;

	SetForceEvent();
	AddMarkPal();
	FieldFadeBlackInSet();
	id = AddTask( ReturnGoodsSelect2, 8 );
	GoodsSelectParamInit(id);
}




//=========================================================================================
//										スクロール
//=========================================================================================
// スクロールチェック
static u8 ScrollCheck( u8 id )
{
	s16 * wk = TaskTable[id].work;

	if( scr_flg == 1 ){
		if( wk[CELL_POSY]-wk[GOODS_V]+1-MAP_UP_MARGIN < 0 ){
			wk[ CELL_POSY ]++;
			return	FALSE;
		}
	}
	if( scr_flg == 2 ){
		if( wk[CELL_POSY]-MAP_UP_MARGIN >= NowMap.Screen->Ysize ){
			wk[ CELL_POSY ]--;
			return	FALSE;
		}
	}
	if( scr_flg == 3 ){
		if( wk[CELL_POSX]-MAP_LEFT_MARGIN < 0 ){
			wk[ CELL_POSX ]++;
			return	FALSE;
		}
	}
	if( scr_flg == 4 ){
		if( wk[CELL_POSX]+wk[GOODS_H]-1-MAP_LEFT_MARGIN >= NowMap.Screen->Xsize ){
			wk[ CELL_POSX ]--;
			return	FALSE;
		}
	}

	return	TRUE;
}

// 次回移動のためのキーチェック
static u8 KeyCheck(void)
{
	if( ( sys.Cont & PLUS_KEY_MASK ) == U_KEY )	return	TRUE;
	if( ( sys.Cont & PLUS_KEY_MASK ) == D_KEY )	return	TRUE;
	if( ( sys.Cont & PLUS_KEY_MASK ) == L_KEY )	return	TRUE;
	if( ( sys.Cont & PLUS_KEY_MASK ) == R_KEY )	return	TRUE;
	return	FALSE;
}

// パラメータ初期化
void ClearMoveParam(void)
{
	scr_flg = 0;
	ActWork[ scr_act ].work[2] = 0;
	ActWork[ scr_act ].work[3] = 0;
}

// メイン
void GoodsMoveTask( u8 id )
{
	if( ActWork[ scr_act ].work[4] == 0 ){

		if( TaskTable[id].work[ BUTTON_FLG ] == 1 ){
			ScrollSelectFunc[ TaskTable[id].work[ MENU_NO ] ].set_func(id);
			return;
		}
		if( TaskTable[id].work[ BUTTON_FLG ] == 2 ){
			ScrollSelectFunc[ TaskTable[id].work[ MENU_NO ] ].cancel_func(id);
			return;
		}

		if( ( sys.Cont & PLUS_KEY_MASK ) == U_KEY ){
			scr_flg = 1;
			ActWork[ scr_act ].work[2] = 0;
			ActWork[ scr_act ].work[3] = -2;
			TaskTable[id].work[ CELL_POSY ]--;
		}
		if( ( sys.Cont & PLUS_KEY_MASK ) == D_KEY ){
			scr_flg = 2;
			ActWork[ scr_act ].work[2] = 0;
			ActWork[ scr_act ].work[3] = 2;
			TaskTable[id].work[ CELL_POSY ]++;
		}
		if( ( sys.Cont & PLUS_KEY_MASK ) == L_KEY ){
			scr_flg = 3;
			ActWork[ scr_act ].work[2] = -2;
			ActWork[ scr_act ].work[3] = 0;
			TaskTable[id].work[ CELL_POSX ]--;
		}
		if( ( sys.Cont & PLUS_KEY_MASK ) == R_KEY ){
			scr_flg = 4;
			ActWork[ scr_act ].work[2] = 2;
			ActWork[ scr_act ].work[3] = 0;
			TaskTable[id].work[ CELL_POSX ]++;
		}

		if( KeyCheck() == FALSE || ScrollCheck(id) == FALSE ){
			ClearMoveParam();
		}
	}

	if( scr_flg != 0 ){
		ActWork[ scr_act ].work[4]++;
		ActWork[ scr_act ].work[4] &= 7;
	}

	if( TaskTable[id].work[ BUTTON_FLG ] == 0 ){
		if( sys.Trg & A_BUTTON )	TaskTable[id].work[ BUTTON_FLG ] = 1;
		if( sys.Trg & B_BUTTON )	TaskTable[id].work[ BUTTON_FLG ] = 2;
	}
}

//----------------------------
//		グッズ移動へ戻る
//----------------------------
static void ReturnGoodsMove( u8 id )
{
	NMenuBoxClear( 0, 0, 29, 19 );
	ActWork[ scr_act ].work[7] = 0;
	TaskTable[id].work[ BUTTON_FLG ] = 0;
	TaskTable[id].TaskAdrs = GoodsMoveTask;
}

//---------------------------------------------
//		メッセージウェイト後、グッズ移動
//---------------------------------------------
static void NoGoodsMsgWait( u8 id )
{
	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON )
		ReturnGoodsMove(id);
}


//=========================================================================================
//									OBJ作成処理
//=========================================================================================
//-------------------------------
//		グッズデータ初期化
//-------------------------------
static void GoodsDataInit( GoodsOBJ * g )
{
	u16	i;

	for( i=0; i<64*8*4; i++ )
		g->CharData[i] = 0;

	for( i=0; i<64; i++ )
		g->new_cell[i] = 0;
}

//----------------------------------
//		セルからキャラを取得
//----------------------------------
//パレット取得
static void MakeCellObjPal( u16 * data, u16 pal )
{
	u16	i;

	for( i=0; i<16; i++ ){
		data[i] = MAP_MAIN_CHAR->ColorData[(pal<<4)+i];
	}
}

//キャラを作成
static void MakeCellObj( u8 * data, u16 char_no )
{
	u16	i;
	u8	dumy[32];
	u8	flip;

	flip = char_no >> 10;
	if( char_no != 0 )	char_no = ( char_no & 0x3ff );

	for( i=0; i<32; i++ ){
		dumy[i] = MAP_MAIN_CHAR->CharData[(char_no<<5)+i];
	}

	switch( flip ){
	case 0:		// flip なし
		for( i=0; i<32; i++ )
			data[i] = dumy[i];
		break;
	case 1:		// Hflip
		for( i=0; i<8; i++ ){
			data[i*4]   = (dumy[(i+1)*4-1]>>4)+((dumy[(i+1)*4-1] & 0xf)<<4);
			data[i*4+1] = (dumy[(i+1)*4-2]>>4)+((dumy[(i+1)*4-2] & 0xf)<<4);
			data[i*4+2] = (dumy[(i+1)*4-3]>>4)+((dumy[(i+1)*4-3] & 0xf)<<4);
			data[i*4+3] = (dumy[(i+1)*4-4]>>4)+((dumy[(i+1)*4-4] & 0xf)<<4);
		}
		break;
	case 2:		// Vflip
		for( i=0; i<8; i++ ){
			data[i*4]   = dumy[(7-i)*4];
			data[i*4+1] = dumy[(7-i)*4+1];
			data[i*4+2] = dumy[(7-i)*4+2];
			data[i*4+3] = dumy[(7-i)*4+3];
		}
		break;
	case 3:		// HVflip
		for( i=0; i<32; i++ )
			data[i] = (dumy[31-i]>>4)+((dumy[31-i] & 0xf)<<4);
	}
}
static void MakeCellObj2( GoodsOBJ * g )
{
	u16	i;

	for( i=0; i<64; i++ )
		MakeCellObj( &g->CharData[i<<5], g->new_cell[i] );
}

//-------------------------------------
//		各サイズごとにセルを作成
//-------------------------------------
static u16 GetCahrNo( u16 char_no )
{
	return	( MAP_CHAR_DATA->CellCharData[ char_no ] ) & 0xfff;
}

static void SetBGCellObj( GoodsOBJ * g )
{
	u8	i;
	u8	size = 0;

	size = g->goods->size;

	for( i=0; i<bg_obj_tbl[size].loop; i++ ){
		g->new_cell[ bg_obj_tbl[size].ptn[i] ] = GetCahrNo(
			g->goods->cell[ bg_obj_tbl[size].num[i] ] * 8 + bg_obj_tbl[size].pls[i] );
	}
}

//--------------------------------------
//		グッズアクターOamData作成
//--------------------------------------
static void MakeGoodsActOamData( u8 no )
{
	goods_oam.VPos          = 0;					// Vﾎﾟｼﾞｼｮﾝ
	goods_oam.AffineMode    = 0;					// 拡大縮小ﾓｰﾄﾞ設定
	goods_oam.ObjMode       = 0;					// OBJﾓｰﾄﾞ設定(NORMAL)
	goods_oam.Mosaic        = 0;					// ﾓｻﾞｲｸ設定(OFF)
	goods_oam.ColorMode     = 0;					// ｶﾗｰﾓｰﾄﾞ設定(16色)
	goods_oam.Shape         = GoodsSize[no].type;	// OBJ形状設定
	goods_oam.HPos          = 0;					// Hﾎﾟｼﾞｼｮﾝ
	goods_oam.AffineParamNo = 0;					// 拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
	goods_oam.Size          = GoodsSize[no].size;	// OBJサイズ設定
	goods_oam.CharNo        = 0;					// ｷｬﾗｸﾀｰ数
	goods_oam.Priority      = 1;					// 表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第2優先)
	goods_oam.Pltt          = 0;					// ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ
}


//=========================================================================================
//										アクター処理
//=========================================================================================
//------------------------------
//		アクター初期処理
//------------------------------
static void InitGoodsAct( actWork * act )
{
	act->work[2] = 0;
	act->work[3] = 0;
	act->work[4] = 0;
	act->work[5] = 0;
	act->work[6] = 0;
	act->work[7] = 0;
	act->move = GoodsActMove;
}

//-----------------
//		点滅
//-----------------
static void GoodsActMove( actWork * act )
{
	if( act->work[7] == 0 ){
		if( act->work[6] < 0xf ){
			act->banish = 0;
		}else{
			act->banish = 1;
		}

		act->work[6] = ( act->work[6]+1 ) & 0x1f;
	}else{
		act->banish = 0;
	}
}
