//=========================================================================================
//									リサイクルおやじ
//								2002/02/18 by nakahiro
//=========================================================================================
#include "common.h"
#include "print.h"
#include "menutool.h"
#include "task.h"
#include "script.h"
#include "gds_main.h"
#include "goods.h"
#include "oyaji.h"
#include "oyaji03.h"
#include "mus_tool.h"
#include "itemtool.h"
#include "message.h"

#include "syswork.h"		//OBJCHRWORK参照のため

#include "../data/gds_sym.h"

//=========================================================================================
//										シンボル
//=========================================================================================
#define	WIN_X		0		// ウィンドウ表示X座標
#define	WIN_Y		1		// ウィンドウ表示Y座標
#define	WIN_H		12		// ウィンドウ幅
#define	WIN_VMAX	11		// ウィンドウ最大高さ

// タスクワーク番号
#define	P_MAX		1		// グッズ数
#define	POS			2		// カーソル位置

//=========================================================================================
//									グローバル変数
//=========================================================================================
// おやじが持ってるデフォルトグッズデータ
// 名前
static const u8 * const def_name[] = {
	recycle_oyaji_name01,
	recycle_oyaji_name02,
	recycle_oyaji_name03,
	recycle_oyaji_name04,
};
// グッズ
static const u8 def_goods[] = {
	GOODS_YOMAWARUDOORU,
	GOODS_BOORUKUSSYON,
	GOODS_TAIYA,
	GOODS_KAWAIIHANA,
};


//------------------------------------
//		リサイクルグッズをソート
//------------------------------------
static void RecycleGoodsSort(void)
{
	u8	i,j;
	u8	no, name[RECYCLE_OYAJI_NAME];
	OYAJIDATA_RECYCLE * dat;

	dat = (OYAJIDATA_RECYCLE *)(Fld.oyaji_work);

	for( i=0; i<RECYCLE_OYAJI_MAX-1; i++ ){
		for( j=i+1; j<RECYCLE_OYAJI_MAX; j++ ){
			if( dat->goods[i] == 0 ){
				no = dat->goods[i];
				dat->goods[i] = dat->goods[j];
				dat->goods[j] = no;

				PM_strcpy( name, &dat->name[RECYCLE_OYAJI_NAME*i] );
				PM_strcpy( &dat->name[RECYCLE_OYAJI_NAME*i], &dat->name[RECYCLE_OYAJI_NAME*j] );
				PM_strcpy( &dat->name[RECYCLE_OYAJI_NAME*j], name );
			}
		}
	}
}

//----------------------------------
//		リサイクルおやじ初期化
//----------------------------------
void InitRecycleOyaji(void)
{
	u8	i;
	OYAJIDATA_RECYCLE * dat;

	dat = (OYAJIDATA_RECYCLE *)(Fld.oyaji_work);
	dat->type = OYAJITYPE_RECYCLE;
	dat->flg  = 0;

	for( i=0; i<RECYCLE_OYAJI_MAX; i++ ){
		PM_strcpy( &dat->name[ RECYCLE_OYAJI_NAME * i ],  def_name[i] );
		dat->goods[i] = def_goods[i];
	};

	RecycleGoodsSort();
}

//---------------------------------------
//		グッズをあげたフラグ初期化
//---------------------------------------
void ResetRGGiveFlag(void)
{
	OYAJIDATA_RECYCLE * dat;

	dat = (OYAJIDATA_RECYCLE *)(Fld.oyaji_work);
	dat->flg = 0;
}

//----------------------------------------------
//		リサイクルボックスへグッズを入れる
//----------------------------------------------
void RecycleBoxIn( u8 goods )
{
//	OYAJIDATA_RECYCLE * dat;

//	dat = (OYAJIDATA_RECYCLE *)(Fld.oyaji_work);
//	Fld.EventWork[WK_RECYCLE_GOODS-SVWK_START] = goods;
	SetEventWorkValue( WK_RECYCLE_GOODS, (u16)goods );
}

//--------------------------------
//		グッズウィンドウ表示
//--------------------------------
static void DrawRecycleGoodsWin( u8 id )
{
	u8	i,j=1,k=0;
	OYAJIDATA_RECYCLE * dat;

	dat = (OYAJIDATA_RECYCLE *)(Fld.oyaji_work);

	for( i=0; i<RECYCLE_OYAJI_MAX; i++ ){
		if( dat->goods[i] != 0 )	j++;
	}

	NMenuWinBoxWrite( WIN_X, WIN_Y, WIN_X+WIN_H, WIN_Y+1+(j<<1) );

	for( i=0; i<RECYCLE_OYAJI_MAX; i++ ){
		if( dat->goods[i] != 0 ){
			if( dat->goods[i] > GOODS_DATA_MAX )
				NMenuMsgWrite( str_hate5, WIN_X+2, WIN_Y+1+(k<<1) );
			else
				NMenuMsgWrite( base_goods[dat->goods[i]].name, WIN_X+2, WIN_Y+1+(k<<1) );
			k++;
		}
	}
	NMenuMsgWrite( str_yameru, WIN_X+2, WIN_Y+1+(k<<1) );
	NMenuVCursorInit( WIN_X+1, WIN_Y+1, j, 0 );
	TaskTable[id].work[P_MAX] = k;
}

//------------------------
//		グッズ選択
//------------------------
static void GetSelectGoods( u8 id, u8 no )
{
	if( no > GOODS_DATA_MAX )	ScriptParameter0 = 0xffff;
	else						ScriptParameter0 = no;

	NMenuBoxClear( WIN_X, WIN_Y, WIN_X+WIN_H, WIN_Y+WIN_VMAX );
	DelTask(id);
	ContinueFieldScript();
}

static void SelectRecycleGoods( u8 id )
{
	OYAJIDATA_RECYCLE * dat;

	dat = (OYAJIDATA_RECYCLE *)(Fld.oyaji_work);

	if( sys.Trg & U_KEY ){
		SePlay(SE_SELECT);
		NMenuVCursorSet( -1 );
		return;
	}
	if( sys.Trg & D_KEY ){
		SePlay(SE_SELECT);
		NMenuVCursorSet( 1 );
		return;
	}
	if( sys.Trg & A_BUTTON ){
		SePlay(SE_SELECT);
		ScriptParameter1 = NMenuVCursorPosGet();
		if( TaskTable[id].work[P_MAX] == ScriptParameter1 ){
			GetSelectGoods( id, 0 );
		}else{
			PM_strcpy( StrTempBuffer0, &dat->name[RECYCLE_OYAJI_NAME*ScriptParameter1] );
			GetSelectGoods( id, dat->goods[ ScriptParameter1 ] );
		}
		return;
	}
	if( sys.Trg & B_BUTTON ){
		SePlay(SE_SELECT);
		GetSelectGoods( id, 0 );
	}
}


//=========================================================================================
//										スクリプト
//=========================================================================================
//--------------------------------------
//	グッズ交換したかチェック
//--------------------------------------
void TradeOyajiTradeCheck(void)
{
	OYAJIDATA_RECYCLE * dat;

	dat = (OYAJIDATA_RECYCLE *)(Fld.oyaji_work);
	AnswerWork = dat->flg;
}

//--------------------------------------
//	グッズを持っているか
//--------------------------------------
void TradeOyajiGoodsMaxCheck(void)
{
	u8	i;

	for( i=0; i<8; i++ ){
		if( GoodsMaxCheck2(i) != 0 ){
			AnswerWork = 0;
			return;
		}
	}
	AnswerWork = 1;
}

//--------------------------------------
//	グッズの項目チェック
//--------------------------------------
void TradeOyajiGoodsGenreCheck(void)
{
	AnswerWork = 0;

	if( base_goods[ ScriptParameter0 ].box == base_goods[ ScriptParameter2 ].box )
		return;

	if( CheckGoodsSpace( base_goods[ ScriptParameter0 ].box ) == -1 ){
		GetGoodsTypeStr( StrTempBuffer1, base_goods[ ScriptParameter0 ].box );
		AnswerWork = 1;
	}
}


//--------------------------------------
// 交換するグッズを選ぶ
//--------------------------------------
void TradeOyajiMyGoodsSelect(void)
{
	AddTask( TradeOyajiMyGoodsSelectInit, 0 );
}

// 選択
void TradeOyajiMyGoodsSet( u8 id )
{
	NMenuBoxClear( 0, 0, 29, 19 );
	DelScrCurActor( MARK_ACT_U_CURSOR );
	DelScrCurActor( MARK_ACT_D_CURSOR );
	DelMarkActorAll( mark_act, 8 );
	DelMarkPal();
	if( GoodsPutCheck() == TRUE ){
		ScriptParameter2 = GoodsType[select_goods_pos];
		PM_strcpy( StrTempBuffer2, base_goods[ ScriptParameter0 ].name );
		PM_strcpy( StrTempBuffer1, base_goods[ ScriptParameter2 ].name );
	}else	ScriptParameter2 = 0xffff;
	DelTask(id);
	ContinueFieldScript();
}
// キャンセル
void TradeOyajiMyGoodsCancel( u8 id )
{
	NMenuBoxClear( 0, 0, 29, 19 );
	ScriptParameter2 = 0;
	DelTask(id);
	ContinueFieldScript();
}

//--------------------------------------
//	グッズを交換
//--------------------------------------
void TradeOyageGoodsTarade(void)
{
	OYAJIDATA_RECYCLE * dat;

	dat = (OYAJIDATA_RECYCLE *)(Fld.oyaji_work);

	SubGoods( (u8)ScriptParameter2 );
	AddGoods( (u8)ScriptParameter0 );

	PM_strcpy( &dat->name[RECYCLE_OYAJI_NAME*ScriptParameter1], MyData.my_name );
	dat->goods[ ScriptParameter1 ] = (u8)ScriptParameter2;
	RecycleGoodsSort();
	dat->flg = 1;
}

//-----------------------------------------
//	リサイクルグッズ選択初期設定
//-----------------------------------------
void InitRecycleWinSelect(void)
{
	u8	id;

	id = AddTask( SelectRecycleGoods, 0 );
	DrawRecycleGoodsWin(id);
}
