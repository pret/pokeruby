//========================================================================================
//									手持ちグッズ関連
//									2001/06/18 by nakahiro
//========================================================================================
#include "common.h"
#include "gds_main.h"
#include "goods.h"

#include "../data/gds_sym.h"

const GOODS_BOX goods_box[] =
{
	{ Fld.FurnitureDesk,    GOODS_DESK_MAX    },	// つくえ
	{ Fld.FurnitureChair,   GOODS_CHAIR_MAX   },	// いす
	{ Fld.FurniturePlant,   GOODS_PLANT_MAX   },	// 鉢植え
	{ Fld.FurnitureEtc,     GOODS_ETC_MAX     },	// がらくた
	{ Fld.FurnitureMat,     GOODS_MAT_MAX     },	// マット
	{ Fld.FurniturePoster,  GOODS_POSTER_MAX  },	// ポスター
	{ Fld.FurnitureDoll,    GOODS_DOLL_MAX    },	// ぬいぐるみ
	{ Fld.FurnitureCushion, GOODS_CUSHION_MAX },	// クッション
};


//--------------------------------
//		場所ごとに初期化
//	引数   : u8 id = グッズの種類
//--------------------------------
void GoodsBoxInit( u8 id )
{
	u8	i;

	for( i=0; i<goods_box[id].max; i++ )
		goods_box[id].box[i] = 0;
}

//--------------------------------
//			初期化
//--------------------------------
void GoodsAllInit(void)
{
	u8	i;

	for( i=0; i<=GOODS_CUSHION_FOLDER; i++ )
		GoodsBoxInit(i);
}

//--------------------------------
//			空きを調べる
//	引数   : u8 id = グッズの種類
//	戻り値 : s8 i  = 場所
//			 -1    = 空き無し
//--------------------------------
s8 CheckGoodsSpace( u8 id )
{
	s8	i;

	for( i=0; i<(s8)goods_box[id].max; i++ ){
		if( goods_box[id].box[i] == 0 )	return	i;
	}
	return	-1;
}

//------------------------------------
//		指定グッズをもっているか
//	引数   : u8 id = グッズ番号
//	戻り値 : TRUE  = あり
//			 FALSE = なし
//------------------------------------
u8 CheckGoodsMine( u8 id )
{
	u8	i;
	u8	box = base_goods[id].box;

	for( i=0; i<goods_box[ box ].max; i++ ){
		if( goods_box[ box ].box[i] == id )
			return	TRUE;
	}
	return	FALSE;
}


//----------------------------------
//			手持ちに加える
//	引数   : u8 no = グッズ番号
//	戻り値 : TRUE  = 成功
//			 FALSE = 失敗
//----------------------------------
u8 AddGoods( u8 no )
{
	s8	pos = 0;

	if( no == 0 )	return	FALSE;

	pos = CheckGoodsSpace( base_goods[no].box );
	if( pos == -1 )	return	FALSE;

	goods_box[ base_goods[no].box ].box[ pos ] = no;
	return	TRUE;
}

//----------------------------------
//			手持ちに加えられるかチェック
//			※02/07/14追加（@Tomomichi Ohta@)
//	引数   : u8 no = グッズ番号
//	戻り値 : TRUE  = 成功
//			 FALSE = 失敗
//----------------------------------
u8 AddGoodsCheck( u8 no )
{
	s8	pos = 0;

	if( no == 0 )	return	FALSE;

	pos = CheckGoodsSpace( base_goods[no].box );
	if( pos == -1 )	return	FALSE;

	return	TRUE;
}

//----------------------------------
//			手持ちから減らす
//	引数   : u8 no = グッズ番号
//	戻り値 : TRUE  = 成功
//			 FALSE = 失敗
//----------------------------------
s8 SubGoods( u8 no )
{
	u8	i = 0;

	if( no == 0 )	return	FALSE;

	for( i=0; i<goods_box[ base_goods[no].box ].max; i++ ){
		if( goods_box[ base_goods[no].box ].box[i] == no ){
			goods_box[ base_goods[no].box ].box[i] = 0;
			GoodsSort2( base_goods[no].box );
			return	TRUE;
		}
	}
	return	FALSE;
}

//---------------------------------
//			グッズソート
//	引数 : u8 id = グッズの種類
//---------------------------------
void GoodsSort2( u8 id )
{
	u8	i,j;
	u8	copy;

	for( i=0; i<goods_box[id].max; i++ ){
		for( j=i+1; j<goods_box[id].max; j++ ){
			if( goods_box[id].box[j] != 0 &&
				( goods_box[id].box[i] == 0 || goods_box[id].box[i] > goods_box[id].box[j] ) )
			{
				copy = goods_box[id].box[i];
				goods_box[id].box[i] = goods_box[id].box[j];
				goods_box[id].box[j] = copy;
			}
		}
	}
}

//------------------------------------
//			グッズ数チェック
//	引数   : u8 id = グッズの種類
//	戻り値 : その種類の手持ちグッズ数
//-------------------------------------
u8 GoodsMaxCheck2( u8 id )
{
	u8	i, max = 0;

	for( i=0; i<goods_box[id].max; i++ ){
		if( goods_box[id].box[i] != 0 )		max++;
	}
	return	max;
}

//------------------------------------
//	　手持ちグッズの総数をチェック
//	戻り値 : 手持ちグッズ数
//------------------------------------
u8 GoodsMaxCheckAll(void)
{
	u8	i, cnt = 0;

	for( i=GOODS_DESK_FOLDER; i<=GOODS_CUSHION_FOLDER; i++ )
		cnt += GoodsMaxCheck2(i);

	return	cnt;
}



//========================================================================================

//----------------------------------
//		デバッグ用グッズセット
//----------------------------------
#ifdef	PM_DEBUG
void DebugGoodsSet2(void)
{
	u8	i;

	for( i=0; i<=GOODS_DATA_MAX; i++ )
		AddGoods(i);
}
#endif	PM_DEBUG
