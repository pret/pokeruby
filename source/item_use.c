//=========================================================================================
//									アイテム別処理
//								2001/10/26 by nakahiro
//=========================================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "fld_main.h"
#include "script.h"
#include "pokelist.h"
#include "menu.h"
#include "f_pmlist.h"
#include "b_pmlist.h"
#include "map_attr.h"
#include "fieldmap.h"
#include "task.h"
#include "bag.h"
#include "poketool.h"
#include "weather.h"
#include "evobj.h"
#include "jiki.h"
#include "client.h"
#include "gold.h"
#include "item.h"
#include "item_def.h"
#include "seed.h"
#include "base.h"
#include "mapparam.h"
#include "mail.h"
#include "itemtool.h"
#include "fight.h"
#include "fld_tool.h"
#include "cubecase.h"
#include "fld_task.h"
#include "fld_talk.h"
#include "syswork.h"		//OBJCHRWORK参照のため
#include "letter.h"			//TVFishingCount
#include "mus_tool.h"
#include "sxytype.h"
#include "initgame.h"
#include "coin.h"
#include "message.h"
#include "record.h"
#include "server.h"

#include "../data/itemmsg.h"	//アイテム使用メッセージ
#include "../evdata\maparray.h"
#include "../script\saveflag.h"

#include "sysflag.h"

//=========================================================================================
//											シンボル
//=========================================================================================
#define	INFOWINX	0		//情報ｳｨﾝﾄﾞｳX座標
#define	INFOWINY	13		//情報ｳｨﾝﾄﾞｳY座標
#define	INFOWINH	13		//情報ｳｨﾝﾄﾞｳ幅
#define	INFOWINV	7		//情報ｳｨﾝﾄﾞｳ高さ

#define	YESNO_WINX	7		// はい・いいえX座標
#define	YESNO_WINY	7		// はい・いいえY座標
#define	YESNO_WINH	5		// はい・いいえ幅
#define	YESNO_WINV	4		// はい・いいえ高さ

#define	WHITE_CHAR	1

//タスクワーク番号
#define	RETURN_ADR_H	8
#define	RETURN_ADR_L	9
#define	FADE_WORK		10
#define	RETURN_WORK		15

#define GET_ADR_H(n) ( ( (u32)n & 0xffff0000)  >> 16 )
#define GET_ADR_L(n) ( (u32)n & 0x0000ffff) 


//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void BagExitTask(u8);
extern void FieldItemUseInit(void);		//フィールドへ復帰後の処理設定

extern void FieldBagPokeListInit(void);

extern void PokeListStatusRecover( u8, u16, pTaskFunc );
extern void PokeListAllDethRecover( u8, u16, pTaskFunc );

extern void BagItemUseSubSet(void);

//=========================================================================================
//										グローバル変数
//=========================================================================================
extern u16	ReturnItemNo;			//アイテム番号
extern u8	UseFldPokeFlg;			//つかう/もたせる

extern void (*FieldReturnItemUse)(u8);		//フィールド復帰後の飛び先

//フィールド戻り先
void (* const FieldReturn[])() = {
	FieldBagPokeListInit,	// ポケモンリスト
	FieldMainRecover,		// メイン
	CubeCaseInit,			// キューブケース
};


//----------------------------------------------------
//		戻り先アドレスをセットしてバッグを終了
//----------------------------------------------------
static void SetReturnAdrsMain( u8 id )
{
	u8	no;

	if( ReturnItemNo == ITEM_NAZONOMI )
		no = (u8)( TaskTable[id].work[ RETURN_WORK ] - 1 );
	else
		no = ItemFldSysGet( ReturnItemNo ) - 1;

	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( FieldReturn[ no ] );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( FieldReturn[ no ] );
	TaskTable[id].TaskAdrs = BagExitTask;
}

static void SetReturnAddress( u8 id )
{
	SetReturnAdrsMain(id);
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
}

// 便利ボタンから別画面に切り替わる道具用
static void SetReturnAddress2( u8 id )
{
	SetReturnAdrsMain(id);
	FieldFadeControl( FIELD_BLACK_OUT, 0 );
}

//---------------------------------
//		大切なもの用使用処理
//---------------------------------
static void ExtraItemUse( u8 id )
{
	if(TaskTable[id].work[2] != 1){
		pFieldRecoverFunc = FieldItemUseInit;
		SetReturnAddress(id);
	}else	FieldReturnItemUse(id);
}

//----------------------------
//		エラーメッセージ
//----------------------------
static void SetErrorMsgMain( u8 id, u8 flg, const u8 * error_msg )
{
	PM_MsgExpand( MsgExpandBuffer, error_msg );

	if( flg == 0 ){
		NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
		SetTalkMsg( id, MsgExpandBuffer, EndBagItemError, 1 );
	}else{
		SetTalkMsg( id, MsgExpandBuffer, EndFldItemError, 0 );
	}
}

static void SetErrorMsg2( u8 id, u8 flg )
{
	SetErrorMsgMain( id, flg, msg_item_use_error );
}

static void SetErrorMsgCyclingRoad( u8 id, u8 flg )
{
	SetErrorMsgMain( id, flg, msg_cycling_road_error );
}

//----------------------------------
//		アイテムの種類を調べる
//----------------------------------
u8	ItemTypeCheck( u16 no )
{
	if( ItemFldFuncGet( no ) == ITEMPG_FLD_SKILL )
		return	SKILL_ITEM;
	if( ItemFldFuncGet( no ) == ITEMPG_FLD_EVOLUTION )
		return	EVO_ITEM;

	return	DUMMY_ITEM;
}


//=========================================================================================
//										メール
//=========================================================================================
extern void ReturnMailUseInit(void);	// メール使用後の復帰処理
extern void MailViewInit( MAIL_DATA *, pFunc, u8 );

static void FieldBagMailUse( u8 id )
{
	MAIL_DATA	mail;

	if( !(FadeData.fade_sw) ){
		mail.design_no = ReturnItemNo;
		MailViewInit( &mail, ReturnMailUseInit, 0 );
		DelTask(id);
	}
}

void FieldBagMailUseInit( u8 id )
{
	PaletteFadeReq(0xffffffff,0,0,16,0);
	TaskTable[id].TaskAdrs = FieldBagMailUse;
}


//=========================================================================================
//										自転車
//=========================================================================================

static void FieldSetCycle(u8);

//--------------------------------
//		自転車が使用できるか
//--------------------------------
void CheckFieldCycle(u8 id)
{
	s16	px, py;
	u8	attr;

	GetHeroCellPos( &px, &py );
	attr = GetCellAttribute( px, py );

	if( EventFlagCheck( SYS_CYCLING_ROAD ) == TRUE ||
		ATR_IsVBridgeCheck( attr ) == TRUE ||
		ATR_IsHBridgeCheck( attr ) == TRUE ||
		ATR_IsVBoardCheck( attr ) == TRUE ||
		ATR_IsHBoardCheck( attr ) == TRUE )
	{
		SetErrorMsgCyclingRoad( id, TaskTable[id].work[2] );
		return;
	}else if( IsEnableCycleNowMap() == TRUE && CheckRideCycle() == 0 )
	{
		FieldReturnItemUse = FieldSetCycle;
		ExtraItemUse(id);
	}else{
		SetErrorMsg2( id, TaskTable[id].work[2] );
	}
}

//-------------------------
//		自転車セット
//-------------------------
static void FieldSetCycle(u8 id)
{
	if( ItemWorkGet( ReturnItemNo ) == 0 )	MyCycleRequest(MY_MV_BIT_CYCLE_R);
	if( ItemWorkGet( ReturnItemNo ) == 1 )	MyCycleRequest(MY_MV_BIT_CYCLE_S);
	TalkEnd();
	ResetForceEvent();
	DelTask(id);
}



//=========================================================================================
//										つりざお
//=========================================================================================
#include "fld_talk.h"

static void FishingStart( u8 id );		// 主人公アニメへ


//---------------------------------
//		釣り竿が使用できるか
//---------------------------------
static int check_fishing_condition( void )
{
	s16	px,py;
	u16 attr;

	GetHeroFrontCellPos(&px,&py);
	attr = GetCellAttribute(px,py);

	// 滝にはつりができない
	if( ATR_IsWaterFallCheck(attr) ) return FALSE;

	// ダイビング中はつりができない
	if( CheckHeroState(MY_MV_BIT_DIVING) ) return FALSE;

	if( CheckHeroState(MY_MV_BIT_SWIM) == 0 ) {
		// 地上からなみのりできる条件ならつりができる
		if ( CheckHeroAttrNaminoriStart() ) return TRUE;
	} else {
		// なみのり状態から目の前が水で進入可能ならつりができる
		if ( ATR_IsWaterCheck(attr)
				&& GetCellHitCheck(px,py) == 0 ) return TRUE;
		// 波乗り状態で目の前が橋のアトリビュートならつりができる
		if (ATR_BridgeCheck(attr) == TRUE) return TRUE;
	}
	return FALSE;
}

void CheckFieldFishing(u8 id)
{
	if ( check_fishing_condition() == TRUE ) {
		FieldReturnItemUse = FishingStart;
		ExtraItemUse(id);
	}else{
		SetErrorMsg2( id, TaskTable[id].work[2] );
	}
}

//--------------------------
//		主人公アニメへ
//--------------------------
static void FishingStart( u8 id )
{
	SetHeroFishingTask( ItemWorkGet( ReturnItemNo ) );
	DelTask(id);
}


//=========================================================================================
//									ダウジングマシン
//=========================================================================================
static void DowsingStart( u8 id );
static void DowsingMsg( u8 id );
static void DowsingEnd( u8 id );
static u8	DowsingCheck( const SXY_DATA * bg, u8 id );

static void ItemRangeSet( u8 id, s16 rx, s16 ry );
static u8	ItemSiteGet( s16 rx, s16 ry );

static void DowsingHeroSiteChange( u8 site );
static void DowsingSiteChangeWait( u8 id );
static void DowsingPointAnm( u8 id );

static void DowsingOtherMap(u8 id);

#define	WK_RANGE_X		0
#define	WK_RANGE_Y		1
#define	WK_RANGE_FLG	2
#define	WK_CNT			3
#define	WK_SE_CNT		4
#define	WK_HERO_SITE	5

static const u8 dm_point_site[] = { SITE_U, SITE_R, SITE_D, SITE_L };

//--------------------------------
//		"つかう"が選択された
//--------------------------------
void FldItemDowsingMachine( u8 id )
{
	IncRecord( CNT_DOWSING );			//ダウジングマシンを使った回数をカウント
	FieldReturnItemUse = DowsingStart;
	ExtraItemUse(id);
}

//---------------------------------------------
//		アイテムが埋まっているかチェック
//---------------------------------------------
static void DowsingStart( u8 id )
{
	if( DowsingCheck( NowMap.Sxy, id ) == TRUE )
		TaskTable[id].TaskAdrs = DowsingMsg;
	else
		SetTalkMsg( id, msg_dgm_not, DowsingEnd, 0 );
}

//----------------------------------------------
//		音を４回鳴らすしてメッセージ表示
//----------------------------------------------
static void DowsingMsg( u8 id )
{
	u8	item_site;
	u8	site;
	u8	i;

	s16 * wk = TaskTable[id].work;

	if( wk[WK_CNT] == 0 ){
		if( wk[WK_SE_CNT] == 4 ){

			item_site = ItemSiteGet( wk[WK_RANGE_X], wk[WK_RANGE_Y] );
			if( item_site != 0 ){
				DowsingHeroSiteChange( dm_point_site[item_site-1] );
				TaskTable[id].TaskAdrs = DowsingSiteChangeWait;
			}else{
				site = GetHeroSite();
				for( i=0; i<4; i++ ){
					if( site == dm_point_site[i] )
						wk[WK_HERO_SITE] = ( i+1 ) & 3;
				}
				TaskTable[id].TaskAdrs = DowsingPointAnm;
				wk[WK_CNT]       = 0;
				wk[WK_RANGE_FLG] = 0;
			}

			return;
		}
		SePlay( SE_DAUGI );
		wk[WK_SE_CNT]++;
	}

	wk[WK_CNT] = ( wk[WK_CNT] + 1 ) & 0x1f;
}

//----------------
//		終了
//----------------
static void DowsingEnd( u8 id )
{
	NMenuBoxClear( 0, 14, 29, 19 );
	TalkEnd();
	ResetForceEvent();
	DelTask(id);
}

//--------------------------------
//		隠しアイテムチェック
//--------------------------------
static u8 DowsingCheck( const SXY_DATA * bg, u8 id )
{
	s16	i,x,y,px,py;
	u16	flg;

	GetHeroCellPos( &x, &y );

	TaskTable[id].work[WK_RANGE_FLG] = 0;

	for( i=0; i<bg->evBgMax; i++ ){
		if( bg->BgData[i].type == BG_ITEMPICK ){
			flg = ( 0xffff & ( (u32)bg->BgData[i].script >> 16 ) ) + FH_FLAG_START;
			if( EventFlagCheck( flg ) == FALSE ){
				px = ( MAP_LEFT_MARGIN + bg->BgData[i].posX ) - x;
				py = ( MAP_UP_MARGIN + bg->BgData[i].posY ) - y;

				if( px >= -7 && px <= 7 && py >= -5 && py <= 5 )

					ItemRangeSet( id, px, py );

			}
		}
	}

	DowsingOtherMap(id);

	if( TaskTable[id].work[WK_RANGE_FLG] == 1 )
		return	TRUE;
	
	return	FALSE;
}


//--------------------------------
//	隣接マップの隠しアイテムチェック
//--------------------------------
static u8 check_hide_item(const SXY_DATA * sxy, s16 x, s16 y)
{
	const SXY_BG * bg;
	int i, max;
	u16 flg;

	max = sxy->evBgMax;
	bg = sxy->BgData;
	for (i = 0; i < max; i++) {
		if (bg[i].type != BG_ITEMPICK)
			continue;
		if (x == bg[i].posX && y == bg[i].posY) {
			flg = ( 0xffff & ( (u32)bg[i].script >> 16 ) ) + FH_FLAG_START;
			// 取得フラグがFALSE→まだアイテムがある
			if (EventFlagCheck(flg) == FALSE)
				return TRUE;
			else
				return FALSE;
		}
	}
	return FALSE;
}

static u8 check_linkmap_item(const MLink * link, int x, int y)
{
	const MTD * next;
	s16 cx, cy;

	next = GetNextLinkMapData(link);
	switch (link->direction) {
	case SITE_UP:
		cx = x - MAP_LEFT_MARGIN - link->PosDiff;
		cy = next->Screen->Ysize + (y - MAP_UP_MARGIN);
		break;
	case SITE_DOWN:
		cx = x - MAP_LEFT_MARGIN - link->PosDiff;
		cy = y - MAP_UP_MARGIN - NowMap.Screen->Ysize;
		break;
	case SITE_LEFT:
		cx = next->Screen->Xsize + (x - MAP_LEFT_MARGIN);
		cy = y - MAP_UP_MARGIN - link->PosDiff;
		break;
	case SITE_RIGHT:
		cx =  x - MAP_LEFT_MARGIN - NowMap.Screen->Xsize;
		cy = y - MAP_UP_MARGIN - link->PosDiff;
		break;
	default:
		return FALSE;
	}
	return check_hide_item(next->Sxy, cx, cy);
}

static void DowsingOtherMap(u8 id)
{
	s16 x, y;
	s16 sx, sy, ex, ey;
	s16 hx, hy;
	const MLink * link;

	sx = MAP_LEFT_MARGIN;
	sy = MAP_UP_MARGIN;
	ex = MAP_LEFT_MARGIN + NowMap.Screen->Xsize;
	ey = MAP_UP_MARGIN + NowMap.Screen->Ysize;

	GetHeroCellPos(&hx, &hy);
	for (x = hx - 7; x<= hx + 7; x ++) {
		for (y = hy - 5; y <= hy + 5; y ++) {
			if (sx <= x && x < ex && sy <= y && y < ey) continue;
			link = GetLinkMap(x,y);
			if (link == NULL) continue;
			if (check_linkmap_item(link, x, y) == TRUE) {
				ItemRangeSet( id, x - hx, y - hy );
			}
		}
	}
}

//----------------------------------------------
//	アイテムまでの距離をセット
//----------------------------------------------
static void ItemRangeSet( u8 id, s16 rx, s16 ry )
{
	s16   x1, x2, y1, y2;
	s16 * wk = TaskTable[id].work;

	if( wk[WK_RANGE_FLG] == 0 ){
		wk[WK_RANGE_X]   = rx;
		wk[WK_RANGE_Y]   = ry;
		wk[WK_RANGE_FLG] = 1;
		return;
	}

	if( wk[WK_RANGE_X] < 0 )	x1 = wk[WK_RANGE_X] * (-1);
	else						x1 = wk[WK_RANGE_X];
	if( wk[WK_RANGE_Y] < 0 )	y1 = wk[WK_RANGE_Y] * (-1);
	else						y1 = wk[WK_RANGE_Y];

	if( rx < 0 )	x2 = rx * (-1);
	else			x2 = rx;
	if( ry < 0 )	y2 = ry * (-1);
	else			y2 = ry;

	if( x1+y1 > x2+y2 ){
		wk[WK_RANGE_X] = rx;
		wk[WK_RANGE_Y] = ry;
		return;
	}

	if( x1+y1 == x2+y2 ){
		if( y1 > y2 ){
			wk[WK_RANGE_X] = rx;
			wk[WK_RANGE_Y] = ry;
			return;
		}
		if( y1 == y2 ){
			if( wk[WK_RANGE_Y] < ry ){
				wk[WK_RANGE_X] = rx;
				wk[WK_RANGE_Y] = ry;
			}
		}
	}
}

//----------------------------------------------
//	アイテムがある方向を取得
//----------------------------------------------
static u8 ItemSiteGet( s16 rx, s16 ry )
{
	s16	px, py;

	if( rx == 0 && ry == 0 )	return	0;	// その場

	if( rx < 0 )	px = rx * (-1);
	else			px = rx;

	if( ry < 0 )	py = ry * (-1);
	else			py = ry;

	if( px > py ){
		if( rx < 0 )	return	4;	// 左
		else			return	2;	// 右
	}
	if( px < py ){
		if( ry < 0 )	return	1;	// 上
		else			return	3;	// 下
	}

	if( px == py ){
		if( ry < 0 )	return	1;	// 上
		else			return	3;	// 下
	}

	return	0;
}

//----------------------------------------------
//	主人公の向きを変える
//----------------------------------------------
static void DowsingHeroSiteChange( u8 site )
{
	AcmdEnd( EvObjSpWorkAdrs(EV_OBJ_SPID) );			// 自機強制アニメ解除
	AcmdFreeWork( EvObjSpWorkAdrs(EV_OBJ_SPID) );
	EvObjPauseClr( EvObjSpWorkAdrs(EV_OBJ_SPID) );
	HeroAcmdWalkTurn( site );
}

//----------------------------------------------
//	方向転換待ち
//----------------------------------------------
static void DowsingSiteChangeWait( u8 id )
{
	if( AcmdEndChk( EvObjSpWorkAdrs(EV_OBJ_SPID) ) == 1 )
		SetTalkMsg( id, msg_dgm_hit, DowsingEnd, 0 );
}

//----------------------------------------------
//	その場回転
//----------------------------------------------
static void DowsingPointAnm( u8 id )
{
	s16 * wk = TaskTable[id].work;

	if( AcmdEndChk( EvObjSpWorkAdrs(EV_OBJ_SPID) ) == 1 || wk[WK_RANGE_FLG] == 0 ){
		DowsingHeroSiteChange( dm_point_site[ wk[WK_HERO_SITE] ] );
		wk[WK_RANGE_FLG] = 1;
		wk[WK_HERO_SITE] = ( wk[WK_HERO_SITE] + 1 ) & 3;
		wk[WK_CNT]++;
		if( wk[WK_CNT] == 4 )
			SetTalkMsg( id, msg_dgm_hit_point, DowsingEnd, 0 );
	}
}


//=========================================================================================
//									キューブケース
//=========================================================================================
extern void ReturnBagInit(void);

void FldItemCubeCase( u8 id )
{
	if( ItemToolSioCheck() == TRUE ){
		SetErrorMsg2( id, TaskTable[id].work[2] );
		return;
	}

	if(TaskTable[id].work[2] != 1){
		CubeCaseCall( BAG_CUBECASE_ID );	// キューブケース呼び出し
		SetReturnAddress(id);
	}else{
		pFieldRecoverFunc = AddFieldEventEndFadeInTask;
		CubeCaseCall( CNV_CUBECASE_ID );	// キューブケース呼び出し
		SetReturnAddress2(id);
	}
}

//=========================================================================================
//									コインケース
//=========================================================================================
void FldItemCoinCase( u8 id )
{
	PM_NumMsgSet( StrTempBuffer0, G_CheckCoin(), NUM_MODE_LEFT, 4 );
	PM_MsgExpand( MsgExpandBuffer, msg_coincase );

	if( TaskTable[id].work[2] == 0 ){
		NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
		SetTalkMsg( id, MsgExpandBuffer, EndBagItemError, 1 );
	}else{
		SetTalkMsg( id, MsgExpandBuffer, EndFldItemError, 0 );
	}
}


//=========================================================================================
//								メッセージを表示するアイテム
//=========================================================================================
//--------------------
//		終了待ち
//--------------------
static void EndBagUseMsg( u8 id )
{
	if( sys.Trg & A_BUTTON ){
		EndBagItemError(id);
	}
}

static void EndFldUseMsg( u8 id )
{
	if( sys.Trg & A_BUTTON ){
		EndFldItemError(id);
	}
}

//--------------------------------------
//		アイテム使用メッセージ表示
//--------------------------------------
void SetUseMsg( u8 id )
{
	if( TaskTable[id].work[2] == 0 ){
		NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
		SetTalkMsg( id, FldUseItemMsg[ ItemWorkGet(ReturnItemNo) ], EndBagUseMsg, 1 );
	}else{
		SetTalkMsg( id, FldUseItemMsg[ ItemWorkGet(ReturnItemNo) ], EndFldUseMsg, 0 );
	}
};


//=========================================================================================
//											タネ
//=========================================================================================
extern const VM_CODE seed_set_script[];
static void SeedItemUseInit(u8);

//-------------------------------
//		タネが使用できるか
//-------------------------------
void CheckSeedUse( u8 id )
{
	if( SeedSetEnableCheck() == TRUE ){
		FieldReturnItemUse = SeedItemUseInit;
		pFieldRecoverFunc = FieldItemUseInit;

		TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( FieldMainRecover );
		TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( FieldMainRecover );
		TaskTable[id].TaskAdrs = BagExitTask;
		PaletteFadeReq(0xffffffff,0,0,16,0);

	}else{
		ItemFldFuncGet( ReturnItemNo )(id);
	}
}

//---------------------------------------
//		タネを植えるスクリプト起動
//---------------------------------------
static void SeedItemUseInit(u8 no)
{
	SubItem( ReturnItemNo, 1 );
	SetForceEvent();
	StartFieldScript(seed_set_script);
	DelTask(no);
}

//=========================================================================================
//										じょうろ
//=========================================================================================
extern const VM_CODE seed_watering_script[];
static void ZyouroItemUseInit( u8 id );

//---------------------------------------
//---------------------------------------
void CheckZyouroUse( u8 id )
{
	if( ZyouroUseEnableCheck() == TRUE ){
		FieldReturnItemUse = ZyouroItemUseInit;
		ExtraItemUse(id);
	}else{
		SetErrorMsg2( id, TaskTable[id].work[2] );
	}
}

//---------------------------------------
//	じょうろをつかうスクリプトを起動
//---------------------------------------
void ZyouroItemUseInit( u8 id )
{
	SetForceEvent();
	StartFieldScript( seed_watering_script );
	DelTask(id);
}


//=========================================================================================
//										回復アイテム
//=========================================================================================
// フィールドでポケモンに使用する共通処理
static void ItemUseFldPoke( u8 id )
{
	UseFldPokeFlg = PM_ITEM_USE_MODE;
	SetReturnAddress(id);
}

void FldPokeRecoverInit( u8 id )
{
	PokeListItemUseFunc = PokeListStatusRecover;
	ItemUseFldPoke(id);
}


//=========================================================================================
//									全員瀕死回復アイテム
//=========================================================================================
void FldPokeAllDethRecoverInit( u8 id )
{
	u8	i;

	FPokeNo = 0;

	for( i=0; i<TEMOTI_POKEMAX; i++ ){
		if( PokeParaGet( &PokeParaMine[i], ID_monsno ) != 0 &&
			PokeParaGet( &PokeParaMine[i], ID_hp ) == 0 )
		{
			FPokeNo = i;
			break;
		}
	}

	PokeListItemUseFunc = PokeListAllDethRecover;
	UseFldPokeFlg = PM_ITEM_USE_ALLDETH_RCV_MODE;
	SetReturnAddress(id);
}


//=========================================================================================
//										PP回復アイテム
//=========================================================================================
void FldPokePPRecoverInit( u8 id )
{
	PokeListItemUseFunc = PPRecoverInit;
	ItemUseFldPoke(id);
}


//=========================================================================================
//										ポイントアップ
//=========================================================================================
void FldPokeWazaPointUpInit( u8 id )
{
	PokeListItemUseFunc = WazaPointUpInit;
	ItemUseFldPoke(id);
}


//=========================================================================================
//										ふしぎなアメ
//=========================================================================================
void FldPokeListLvUptUpInit( u8 id )
{
	PokeListItemUseFunc = PokeListLvUpInit;
	ItemUseFldPoke(id);
}


//=========================================================================================
//										わざマシン
//=========================================================================================
static void CallSoundEffect(u8);
static void SkillKeyWait1(u8);
static void WazaSetYesNoInit(u8);
static void WazaSetYes(u8);

static const SELECT_ITEM	YesNoFunc = { WazaSetYes, EndBagItemError };

//-----------------------------
//		起動メッセージ表示
//-----------------------------
void SetPokeSkillInit( u8 id )
{
	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );

	if( ReturnItemNo >= ITEM_HIDENMASIN01 )
		SetTalkMsg( id, msg_waza_machine01, CallSoundEffect, 1 );
	else
		SetTalkMsg( id, msg_waza_machine00, CallSoundEffect, 1 );
}

//--------------------------
//		起動音を鳴らす
//--------------------------
static void CallSoundEffect( u8 id )
{
	SePlay( SE_PC_LOGIN );
	TaskTable[id].TaskAdrs = SkillKeyWait1;
}

//-----------------------------
//		メッセージウェイト
//-----------------------------
static void SkillKeyWait1( u8 id )
{
	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON ){
		PM_strcpy( StrTempBuffer0, &WazaNameData[GetWazaNoItem(ReturnItemNo)][0] );
		PM_MsgExpand( MsgExpandBuffer, msg_waza_machine02 );
		SetTalkMsg( id, MsgExpandBuffer, WazaSetYesNoInit, 1 );
	}
}

//------------------------
//		はい・いいえ
//------------------------
static void WazaSetYesNoInit( u8 id )
{
	YesNoSelectInit( YESNO_WINX, YESNO_WINY );
	ItemBGBoxWrite( BG1_data, YESNO_WINX+1, YESNO_WINY+1, YESNO_WINH, YESNO_WINV, WHITE_CHAR );
	SelectToolInit( id, &YesNoFunc );
}
// はい
static void WazaSetYes( u8 id )
{
	PokeListItemUseFunc = ListPokeWazaSet;
	ItemUseFldPoke(id);
}


//=========================================================================================
//										スプレー
//=========================================================================================
static void UseMsgItemNoSet(void)
{
	SubItem( ReturnItemNo, 1 );
	BagItemUseSubSet();
	GetItemName( ReturnItemNo, StrTempBuffer1 );
	PM_MsgExpand( MsgExpandBuffer, msg_item_use );
}

void FldUseSpray( u8 id )
{
	if( GetEventWorkValue( WK_SPRAY_COUNT ) == 0 ){
		SetEventWorkValue( WK_SPRAY_COUNT, (u16)ItemAttackGet( ReturnItemNo ) );
		UseMsgItemNoSet();
		SetTalkMsg( id, MsgExpandBuffer, EndBagItemError, 1 );
	}else{
		SetTalkMsg( id, msg_spray_error, EndBagItemError, 1 );
	}
};


//=========================================================================================
//							ビードロによるエンカウント率変化
//=========================================================================================
static void VidroUseMsgSet(void)
{
//	SubItem( ReturnItemNo, 1 );
	BagItemUseSubSet();
	GetItemName( ReturnItemNo, StrTempBuffer1 );
}


static void FldUseEncountVidroSeWait( u8 id )
{
	TaskTable[id].work[15]++;
	if( TaskTable[id].work[15] < 8 )	return;

	SePlay( SE_BIDORO );
	SetTalkMsg( id, MsgExpandBuffer, EndBagItemError, 1 );
}

void FldUseEncountVidro( u8 id )
{
	// しろいビードロ
	if( ReturnItemNo == ITEM_SIROIBIIDORO ){
		EventFlagSet( SYS_ENC_UP_ITEM );
		EventFlagReset( SYS_ENC_DOWN_ITEM );
		VidroUseMsgSet();
		PM_MsgExpand( MsgExpandBuffer, msg_w_vidro );
		TaskTable[id].TaskAdrs = FldUseEncountVidroSeWait;
		TaskTable[id].work[15] = 0;
		return;
	}

	// くろいビードロ
	if( ReturnItemNo == ITEM_KUROIBIIDORO ){
		EventFlagSet( SYS_ENC_DOWN_ITEM );
		EventFlagReset( SYS_ENC_UP_ITEM );
		VidroUseMsgSet();
		PM_MsgExpand( MsgExpandBuffer, msg_b_vidro );
		TaskTable[id].TaskAdrs = FldUseEncountVidroSeWait;
		TaskTable[id].work[15] = 0;
	}
}


//=========================================================================================
//									あなぬけのひも
//=========================================================================================
//----
#if 1
//----
void EscapeDungionMain( u8 id )
{
	InitHeroLastStatus();
	SetMapChangeAnanuke();
	DelTask( id );
}
//----
#else	// 旧
//----
void EscapeDungionMain( u8 id )
{
	s16 * wk = TaskTable[id].work;

	switch ( wk[0] ) {
	case 0:
		PaletteFadeReq(0xffffffff,0,0,16,0);
		InitHeroLastStatus();
		wk[0]++;
		break;

	case 1:
		if ( FadeData.fade_sw ) break;

		NextMapSetByEscMapID();
		SetNextWorldPosition();
		pFieldRecoverFunc = AddFieldInTask;
		MainProcChange( FieldMainInit );
		DelTask(id);
		break;
	}
}
//----
#endif
//----

static void FldAnanukeMsg(u8 id)
{
	InitEventFlagAtEscape();		//あなをほるによるフラグ初期化
	UseMsgItemNoSet();
	TaskTable[id].work[0] = 0;
	SetTalkMsg( id, MsgExpandBuffer, EscapeDungionMain, 0 );
}

u8 EscapeDungionCheck(void)
{
	if( NowMap.type == MAPTYPE_CAVE ) return TRUE;
	return	FALSE;
}

void FldAnanukeInit(u8 id)
{
	if( EscapeDungionCheck() == TRUE ){
		FieldReturnItemUse = FldAnanukeMsg;
		ExtraItemUse(id);
	}else{
		SetErrorMsg2( id, TaskTable[id].work[2] );
	}
}


//=========================================================================================
//										進化アイテム
//=========================================================================================
void FldUseEvolutionItem( u8 id )
{
	PokeListItemUseFunc = PokeListEvolutionInit;
	ItemUseFldPoke(id);
}


//=========================================================================================
//									モンスターボール（戦闘）
//=========================================================================================
extern void SetBattleReturnAddress(u8);		// 戻り先アドレスをセットしてバッグを終了

void BtlMonsterBallUse(u8 id)
{
	if( BallThrowCheck() == 0 ){
		SubItem( ReturnItemNo, 1 );
		SetBattleReturnAddress( id );
	}else{
		NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
		SetTalkMsg( id, msg_pc_mons_box_max, EndBagItemError, 1 );
	}
}


//=========================================================================================
//								戦闘用ステータスアップアイテム
//=========================================================================================
static void BtlBagUseItamKeyWait( u8 id )
{
	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON )
		SetBattleReturnAddress(id);
}

static void BtlBagUseItemSeWait( u8 id )
{
	TaskTable[id].work[15]++;
	if( TaskTable[id].work[15] < 8 )	return;

	SePlay( SE_KAIFUKU );
	SubItem( ReturnItemNo, 1 );
	SetTalkMsg( id, FightItemUseMsgGet(ReturnItemNo), BtlBagUseItamKeyWait, 1 );
}

void BtlBagUseItem( u8 id )
{
	u16	pos = SelMonsNo[ TempClientNo ];

	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );

	if( StatusRecover( &PokeParaMine[pos], ReturnItemNo, pos, 0 ) != 0 ){
		SetTalkMsg( id, msg_poke_use_error00, EndBagItemError, 1 );
	}else{
		TaskTable[id].TaskAdrs = BtlBagUseItemSeWait;
		TaskTable[id].work[15] = 0;
	}
}



//=========================================================================================
//						ポケモンリストで使用するアイテムの共通処理（戦闘）
//=========================================================================================
static void BtlPokeListItemUseMain( u8 id )
{
	if( !(FadeData.fade_sw) ){
		BagBattlePokeListInit();
		EvObjPalManInit();
		DelTask(id);
	}
}

static void BtlPokeListItemUseInit( u8 id )
{
	TaskTable[id].TaskAdrs = BtlPokeListItemUseMain;
	PaletteFadeReq(0xffffffff,0,0,16,0);
}


//=========================================================================================
//									回復アイテム（戦闘）
//=========================================================================================
void BtlStRecoverItem( u8 id )
{
	PokeListItemUseFunc = PokeListStatusRecover;
	BtlPokeListItemUseInit(id);
}


//=========================================================================================
//								全員瀕死回復アイテム（戦闘）
//=========================================================================================
void BtlAllDethRecoverItem( u8 id )
{
	PokeListItemUseFunc = PokeListAllDethRecover;
	BtlPokeListItemUseInit(id);
}


//=========================================================================================
//									PP回復アイテム（戦闘）
//=========================================================================================
void BtlPPRecoverItem( u8 id )
{
	PokeListItemUseFunc = PPRecoverInit;
	BtlPokeListItemUseInit(id);
}

//=========================================================================================
//									にがいきのみ（戦闘）
//=========================================================================================
void BtlItemUseNigaiKinomi( u8 id )
{
	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );

	if( SetStatusRecover( 0, ReturnItemNo, 0 ) == 0 ){
		SubItem( ReturnItemNo, 1 );
		PokeNickNameSet( &PokeParaMine[0], StrTempBuffer0 );
		PM_MsgExpand( MsgExpandBuffer, msg_konran_rcv );
		SetTalkMsg( id, MsgExpandBuffer, SetBattleReturnAddress, 1 );
	}else{
		SetTalkMsg( id, msg_poke_use_error00, EndBagItemError, 1 );
	}
}

//=========================================================================================
//								ピッピ人形（仮名）（戦闘）
//=========================================================================================
void BtlEscapeItem( u8 id )
{
	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );

	if( ( FightType & FIGHT_TYPE_TRAINER ) == 0 ){
		UseMsgItemNoSet();
		SetTalkMsg( id, MsgExpandBuffer, SetBattleReturnAddress, 1 );
	}else{
		SetErrorMsg2( id, TaskTable[id].work[2] );
	}
}





//=========================================================================================
//								ナゾの実（ RAM木の実 ）
//=========================================================================================
// フィールド
void FldItemUseRAMKinomi( u8 id )
{
	switch( ItemRecoverCheck( ReturnItemNo ) ){

	case ITEM_TYPE_HP_RCV:			// HP回復
	case ITEM_TYPE_DOKU_RCV:		// 毒回復
	case ITEM_TYPE_NEMURI_RCV:		// 眠り回復
	case ITEM_TYPE_YAKEDO_RCV:		// 火傷回復
	case ITEM_TYPE_KOORI_RCV:		// 氷回復
	case ITEM_TYPE_MAHI_RCV:		// 麻痺回復
	case ITEM_TYPE_ALL_ST_RCV:		// ステータス異常全快
	case ITEM_TYPE_HP_UP:			// ドーピングアイテム HP努力値UP
	case ITEM_TYPE_ATC_UP:			// ドーピングアイテム 攻撃努力値UP
	case ITEM_TYPE_DEF_UP:			// ドーピングアイテム 防御努力値UP
	case ITEM_TYPE_AGL_UP:			// ドーピングアイテム 素早さ努力値UP
	case ITEM_TYPE_SPA_UP:			// ドーピングアイテム 特攻努力値UP
	case ITEM_TYPE_SPD_UP:			// ドーピングアイテム 特防努力値UP
		TaskTable[id].work[ RETURN_WORK ] = FIELD_POKELIST;
		FldPokeRecoverInit( id );
		break;

	case ITEM_TYPE_ALLDETH_RCV:	// 全員瀕死回復
		TaskTable[id].work[ RETURN_WORK ] = FIELD_POKELIST;
		FldPokeAllDethRecoverInit(id);
		break;

	case ITEM_TYPE_LV_UP:		// LvUp系
		TaskTable[id].work[ RETURN_WORK ] = FIELD_POKELIST;
		FldPokeListLvUptUpInit( id );
		break;

	case ITEM_TYPE_PP_UP:		// PPUp
	case ITEM_TYPE_PP_3UP:		// PP3Up
		TaskTable[id].work[ RETURN_WORK ] = FIELD_POKELIST;
		FldPokeWazaPointUpInit( id );
		break;

	case ITEM_TYPE_PP_RCV:		// PP回復
		TaskTable[id].work[ RETURN_WORK ] = FIELD_POKELIST;
		FldPokePPRecoverInit( id );
		break;

	default:
		TaskTable[id].work[ RETURN_WORK ] = FIELD_BAG;
		DummyItemUseFunc( id );
	}
}

// 戦闘
void BtlItemUseRAMKinomi( u8 id )
{
	switch( ItemRecoverCheck( ReturnItemNo ) ){

	case ITEM_TYPE_BTL_ST_UP:	// 戦闘用ステータスアップ系
		BtlBagUseItem( id );
		break;

	case ITEM_TYPE_HP_RCV:			// HP回復
	case ITEM_TYPE_DOKU_RCV:		// 毒回復
	case ITEM_TYPE_NEMURI_RCV:		// 眠り回復
	case ITEM_TYPE_YAKEDO_RCV:		// 火傷回復
	case ITEM_TYPE_KOORI_RCV:		// 氷回復
	case ITEM_TYPE_MAHI_RCV:		// 麻痺回復
	case ITEM_TYPE_KONRAN_RCV:		// 混乱回復
	case ITEM_TYPE_MEROMERO_RCV:	// メロメロ回復
	case ITEM_TYPE_ALL_ST_RCV:		// ステータス異常全快
		BtlStRecoverItem( id );
		break;
/*
	case ITEM_TYPE_KONRAN_RCV:	// 混乱回復
		BtlItemUseNigaiKinomi( id );
		break;

	case ITEM_TYPE_ALLDETH_RCV:	// 全員瀕死回復
		BtlAllDethRecoverItem(id);
		break;
*/
	case ITEM_TYPE_PP_RCV:		// PP回復
		BtlPPRecoverItem( id );
		break;

	default:
		DummyItemUseFunc( id );
	}
}


//=========================================================================================
//								使用できないアイテム（仮）
//=========================================================================================
void DummyItemUseFunc( u8 id )
{
	SetErrorMsg2( id, TaskTable[id].work[2] );
}
