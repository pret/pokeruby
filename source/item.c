//=========================================================================
//							アイテム関連
//									2001/09/06 by nakahiro
//=========================================================================
#include "common.h"
#include "fntequ.h"
#include "menu.h"

#include "bag.h"
#include "item.h"
#include "seed.h"
#include "message.h"

#include "../data/itemsym.h"

#include "item_def.h"			//アイテムデファイン
#include "../data/itemname.h"	//アイテム名
#include "../data/itemeqp.h"	//装備効果
#include "../data/iteminfo.h"	//アイテム説明
#include "../data/itemdata.h"	//アイテムデータ

extern POCKET	pocket[];		//ポケットデータ
extern u8		ItemPoint;		//アイテムの場所

//-------------------------------------------------------------------------
//							アイテム名取得
//	引数 : u16  item = アイテムNo
//		 : u8 * str  = アイテム名格納場所
//-------------------------------------------------------------------------
void GetItemName( u16 item, u8 * str )
{
	const SEED_PARAM * p;

	if( item == ITEM_NAZONOMI ){
		p = GetSeedParam( item - SEED_START_NO );
		PM_strcpy( str, p->name );
		PM_strcat( str, str_XXnomi );
	}else{
		PM_strcpy( str, ItemNameGet( item ) );
	}
}

//-------------------------------------------------------------------------
//						ポケットの空きを調べる
//　引数　：p    = ポケットの番号
//　戻り値：あり = 空き位置
//          なし = -1
//-------------------------------------------------------------------------
s8	PocketSpace(u8 p)
{
	u8	i;

	for( i=0; i<pocket[ p ].max; i++){
		if(	pocket[ p ].item[i].item == 0 )
			return	i;
	}

	return	-1;
}

//-------------------------------------------------------------------------
//						ポケットに何かあるかを調べる
//　引数　：p    = ポケットの番号
//　戻り値：あり = TRUE
//          なし = FALSE
//-------------------------------------------------------------------------
u8	PocketCheck( u8 p )
{
	u8	i;

	for( i=0; i<pocket[ p-1 ].max; i++){
		if(	pocket[ p-1 ].item[i].item != 0 )
			return	TRUE;
	}

	return	FALSE;
}

//-------------------------------------------------------------------------
//							アイテムチェック
//　引数　：item = アイテム番号
//          no   = チェックする個数
//　戻り値：あり = TRUE
//          なし = FALSE
//-------------------------------------------------------------------------
u8	ItemCheck( u16 item, u16 no )
{
	u8	i;
	u8	pocketNo;

	if( ItemPocketGet( item ) == 0 )	return FALSE;

	pocketNo = ItemPocketGet( item ) - 1;

	for( i=0; i<pocket[ pocketNo ].max; i++ ){
		if(	pocket[ pocketNo ].item[i].item == item ){
			
			if( pocket[ pocketNo ].item[i].no >= no	)
				return	TRUE;

			no -= pocket[ pocketNo ].item[i].no;

			if( no == 0 )	return	TRUE;
		}
	}

	return	FALSE;


/*
	u8	i;
	u8	pocketNo;

	if( ItemPocketGet( item ) == 0 )	return FALSE;

	pocketNo = ItemPocketGet( item ) - 1;

	for( i=0; i<pocket[ pocketNo ].max; i++){
		if(	pocket[ pocketNo ].item[i].item == item
			&& pocket[ pocketNo ].item[i].no >= no	)
		{
			return	TRUE;
		}
	}

	return	FALSE;
*/

}

//-------------------------------------------------------------------------
//					アイテムを加えられるかチェック
//　引数　：item  = アイテム番号
//          add   = 加える個数
//　戻り値：TRUE  = 成功
//          FALSE = 失敗
//-------------------------------------------------------------------------
u8	AddItemCheck( u16 item, u16 add )
{
	u8	i;
	u8	pocketNo;
	u16	max;

	if( ItemPocketGet( item ) == 0 )	return FALSE;

	pocketNo = ItemPocketGet( item ) - 1;

	if( pocketNo != SEED_POCKET-1 )	max = 99;
	else							max = 999;

	// 同じアイテムがあるか
	for( i=0; i<pocket[ pocketNo ].max; i++ ){

		if(	pocket[ pocketNo ].item[i].item == item ){

			// 加えた時に所持数がmaxを超えない時
			if( pocket[ pocketNo ].item[i].no + add <= max )	return	TRUE;

			// maxを超える時
			else{
				// 技・木の実ポケットはmax以上持てない
				if( pocketNo == SKILL_POCKET-1 || pocketNo == SEED_POCKET-1 )
					return	FALSE;

				add = add - ( max - pocket[ pocketNo ].item[i].no );
				if( add == 0 )	break;
			}
		}
	}

	// 空きに入れる
	if( add != 0 ){
		for( i=0; i<pocket[ pocketNo ].max; i++ ){
			if(	pocket[ pocketNo ].item[i].item == 0 ){
				if( add > max )	add = add - max;
				else{
					add = 0;
					break;
				}
			}
		}
		if( add != 0 )	return	FALSE;
	}

	return	TRUE;
}


//-------------------------------------------------------------------------
//							アイテムを加える
//　引数　：item  = アイテム番号
//          add   = 加える個数
//　戻り値：TRUE  = 成功
//          FALSE = 失敗
//-------------------------------------------------------------------------
u8	AddItem( u16 item, u16 add )
{
	MINEITEM	dummy[ MY_SKILL_ITEM_MAX ];		// 最も大きいポケット
	u8	i;
	u8	pocketNo;
	u16	max;

	if( ItemPocketGet( item ) == 0 )	return FALSE;

	pocketNo = ItemPocketGet( item ) - 1;

	memcpy( dummy, pocket[pocketNo].item, sizeof(MINEITEM) * pocket[pocketNo].max );

	if( pocketNo != SEED_POCKET-1 )	max = 99;
	else							max = 999;

	// 同じアイテムがあるか
	for( i=0; i<pocket[ pocketNo ].max; i++ ){

		if(	dummy[i].item == item ){

			// 加えた時に所持数がmaxを超えない時
			if( dummy[i].no + add <= max )
			{
//				pocket[ pocketNo ].item[i].no += add;
				dummy[i].no += add;
				memcpy( pocket[pocketNo].item, dummy, sizeof(MINEITEM) * pocket[pocketNo].max );
				return	TRUE;

			// maxを超える時
			}else{
				// 技・木の実ポケットはmax以上持てない
				if( pocketNo == SKILL_POCKET-1 || pocketNo == SEED_POCKET-1 )
					return	FALSE;

				add = add - ( max - dummy[i].no );
				dummy[i].no = max;
				if( add == 0 )	break;
			}
		}
	}

	// 空きに入れる
	if( add != 0 ){
		for( i=0; i<pocket[ pocketNo ].max; i++ ){
			if(	dummy[i].item == 0 ){
				dummy[i].item = item;
				if( add > max ){
					add = add - max;
					dummy[i].no = max;
				}else{
					dummy[i].no = add;
					add = 0;
					break;
				}
			}
		}
		if( add != 0 )	return	FALSE;
	}

	memcpy( pocket[pocketNo].item, dummy, sizeof(MINEITEM) * pocket[pocketNo].max );

	return	TRUE;
}

//-------------------------------------------------------------------------
//							アイテムを減らす
//　引数  ：item  = アイテム番号
//          sub   = 減らす個数
//　戻り値：TRUE  = 成功
//          FALSE = 失敗
//-------------------------------------------------------------------------
u8	SubItem( u16 item, u16 sub )
{
	u8	i;
	u8	pocketNo;
	u16	max = 0;

	if( ItemPocketGet( item ) == 0 )	return FALSE;
	if( item == 0 )	return FALSE;

	pocketNo = ItemPocketGet( item ) - 1;

	// 指定アイテムの総数を調べる
	for( i=0; i<pocket[ pocketNo ].max; i++){
		if(	pocket[ pocketNo ].item[i].item == item )
			max += pocket[ pocketNo ].item[i].no;
	}

	if( max < sub )	return	FALSE;
	
	if( pocket[ pocketNo ].max > ItemPoint ){
		if(	pocket[ pocketNo ].item[ ItemPoint ].item == item ){

			if( pocket[ pocketNo ].item[ ItemPoint ].no >= sub ){
				pocket[ pocketNo ].item[ ItemPoint ].no -= sub;
				sub = 0;
			}else{
				sub -= pocket[ pocketNo ].item[ ItemPoint ].no;
				pocket[ pocketNo ].item[ ItemPoint ].no = 0;
			}

			if( pocket[ pocketNo ].item[ ItemPoint ].no == 0 )
				pocket[ pocketNo ].item[ ItemPoint ].item = 0;

			if( sub == 0 )	return	TRUE;
		}
	}

	for( i=0; i<pocket[ pocketNo ].max; i++){
		if(	pocket[ pocketNo ].item[i].item == item ){

			if( pocket[ pocketNo ].item[i].no >= sub ){
				pocket[ pocketNo ].item[i].no -= sub;
				sub = 0;
			}else{
				sub -= pocket[ pocketNo ].item[i].no;
				pocket[ pocketNo ].item[i].no = 0;
			}

			if( pocket[ pocketNo ].item[i].no == 0 )
				pocket[ pocketNo ].item[i].item = 0;

			if( sub == 0 )	break;
		}
	}

	return	TRUE;


/*
	u8	i;
	u8	pocketNo;

	if( ItemPocketGet( item ) == 0 )	return FALSE;
	if( item == 0 )	return FALSE;

	pocketNo = ItemPocketGet( item ) - 1;

	if( pocket[ pocketNo ].max > ItemPoint ){
		if(	pocket[ pocketNo ].item[ ItemPoint ].item == item &&
			pocket[ pocketNo ].item[ ItemPoint ].no >= sub )
		{
			pocket[ pocketNo ].item[ ItemPoint ].no -= sub;
			if( pocket[ pocketNo ].item[ ItemPoint ].no==0 )
				pocket[ pocketNo ].item[ ItemPoint ].item = 0;
			return	TRUE;
		}
	}

	for( i=0 ; i<pocket[ pocketNo ].max ; i++){
		if(	pocket[ pocketNo ].item[i].item == item
			&& pocket[ pocketNo ].item[i].no >= sub	)
		{
			pocket[ pocketNo ].item[i].no -= sub;
			if( pocket[ pocketNo ].item[i].no==0 )
				pocket[ pocketNo ].item[i].item = 0;
			return	TRUE;
		}
	}

	return	FALSE;
*/

}

//-------------------------------------------------------------------------
//					アイテム番号からポケット番号を取得
//　引数  ：item  = アイテム番号
//　戻り値：ポケット番号
//-------------------------------------------------------------------------
u8	GetPocketNo( u16 item )
{
	return	ItemPocketGet( item );
}

//-------------------------------------------------------------------------
//						アイテムデータを初期化
//	引数　：* data = アイテムデータポインタ
//			max    = 初期化数
//-------------------------------------------------------------------------
void ItemDataInit( MINEITEM * data, u8 max )
{
	u16	i;

	for( i=0; i<max; i++ ){
		data[i].item = 0;
		data[i].no = 0;
	}
}

//-------------------------------------------------------------------------
//						パソコンの空きを調べる
//　戻り値：あり = 空き位置
//          なし = -1
//-------------------------------------------------------------------------
s8 CheckPCBoxItemSpace(void)
{
	s8	i;

	for( i=0; i<MY_PCBOX_ITEM_MAX; i++){
		if(	Fld.MyPCBoxItem[i].item == 0 )
			return	i;
	}

	return	-1;
}

//-------------------------------------------------------------------------
//						パソコンに何かあるか調べる
//　戻り値：種類数
//-------------------------------------------------------------------------
u8 CheckPCBoxItem(void)
{
	u8	i, p = 0;

	for( i=0; i<MY_PCBOX_ITEM_MAX; i++){
		if(	Fld.MyPCBoxItem[i].item != 0 )
			p++;
	}

	return	p;
}

//-------------------------------------------------------------------------
//						パソコンのアイテムチェック
//　引数　：item = アイテム番号
//          no   = チェックする個数
//　戻り値：あり = TRUE
//          なし = FALSE
//-------------------------------------------------------------------------
u8 PCBoxItemCheck( u16 item, u16 no )
{
	u8	i;

	for( i=0; i<MY_PCBOX_ITEM_MAX; i++){
		if(	Fld.MyPCBoxItem[i].item == item &&
			Fld.MyPCBoxItem[i].no >= no	)
		{
			return	TRUE;
		}
	}

	return	FALSE;
}

//-------------------------------------------------------------------------
//						パソコンにアイテムを加える
//　引数　：item  = アイテム番号
//          add   = 加える個数
//　戻り値：TRUE  = 成功
//          FALSE = 失敗
//-------------------------------------------------------------------------
u8 AddPCBoxItem( u16 item, u16 add )
{
	MINEITEM	dummy[ MY_PCBOX_ITEM_MAX ];
	u8	i;
	s8	no;

	memcpy( dummy, Fld.MyPCBoxItem, sizeof(MINEITEM) * MY_PCBOX_ITEM_MAX );

	// 同じアイテムがあるか
	for( i=0; i<MY_PCBOX_ITEM_MAX; i++ ){

		if(	dummy[i].item == item ){

			// 加えた時に所持数がmaxを超えない時
			if( dummy[i].no + add <= 999 )
			{
//				Fld.MyPCBoxItem[i].no += add;
				dummy[i].no += add;
				memcpy( Fld.MyPCBoxItem, dummy, sizeof(MINEITEM) * MY_PCBOX_ITEM_MAX );
				return	TRUE;

			// maxを超える時
			}else{
				add = add - ( 999 - dummy[i].no );
				dummy[i].no = 999;
				if( add == 0 )	break;
			}
		}
	}

	// 空きに入れる
	if( add != 0 ){
		no = CheckPCBoxItemSpace();
		if( no == -1 )	return	FALSE;
		dummy[no].item = item;
		dummy[no].no   = add;
	}

	memcpy( Fld.MyPCBoxItem, dummy, sizeof(MINEITEM) * MY_PCBOX_ITEM_MAX );

	return	TRUE;
}

//-------------------------------------------------------------------------
//						パソコンのアイテムを減らす
//　引数  ：pos   = 位置
//          sub   = 減らす個数
//-------------------------------------------------------------------------
void SubPCBoxItem( u8 pos, u16 sub )
{
	Fld.MyPCBoxItem[pos].no -= sub;

	if( Fld.MyPCBoxItem[pos].no == 0 ){
		Fld.MyPCBoxItem[pos].item = 0;
		PCBoxItemSortZERO();
	}
}

//-------------------------------------------------------------------------
//						パソコンのスペースを詰める
//	引数 : p = ポケットデータ
//-------------------------------------------------------------------------
void PCBoxItemSortZERO(void)
{
	MINEITEM	copy;
	u16	i,j;

	for( i=0; i<MY_PCBOX_ITEM_MAX-1; i++ ){
		for( j=i+1; j<MY_PCBOX_ITEM_MAX; j++ ){
			if( Fld.MyPCBoxItem[i].item == 0 ){
				copy = Fld.MyPCBoxItem[i];
				Fld.MyPCBoxItem[i] = Fld.MyPCBoxItem[j];
				Fld.MyPCBoxItem[j] = copy;
			}
		}
	}
}




//-------------------------------------------------------------------------
//							便利ボタンの交換		//nohara 02/01/16
//-------------------------------------------------------------------------
void ChangeCnvbtn();
void ChangeCnvbtn()
{
	switch( Fld.cnv_btn )
	{
		case ITEM_MAHHAZITENSYA:
			Fld.cnv_btn = ITEM_DAATOZITENSYA;
			break;
		case ITEM_DAATOZITENSYA:
			Fld.cnv_btn = ITEM_MAHHAZITENSYA;
			break;

		//追加していく
	}
}




//=======================================================================================
//								アイテムデータ取得関数
//=======================================================================================

//------------------------------------------------------------------------------
//	ルビー / サファイア で正しいアイテムかどうかチェック
//------------------------------------------------------------------------------
static u16 ItemNumberCheck( u16 item )
{
	if( item > ITEM_DATA_MAX )	return	0;
	return	item;
}

//------------------------------------------------------------------------------
//	アイテム名取得						ItemData[ item ].name[ ITEMNAME_LEN ];
//
//	引数   : u16 item = アイテム番号
//	戻り値 : アイテム名のポインタ
//------------------------------------------------------------------------------
u8 * ItemNameGet( u16 item )
{
	return	(u8 *)ItemData[ ItemNumberCheck( item ) ].name;
}

//------------------------------------------------------------------------------
//	アイテムシンボル取得					ItemData[ item ].symbol;
//	引数   : u16 item = アイテム番号
//	戻り値 : アイテムシンボル
//------------------------------------------------------------------------------
u16 ItemSymbolGet( u16 item )
{
	return	ItemData[ ItemNumberCheck( item ) ].symbol;
}

//------------------------------------------------------------------------------
//	アイテムの値段取得						ItemData[ item ].price;
//
//	引数   : u16 item = アイテム番号
//	戻り値 : 値段
//------------------------------------------------------------------------------
u16 ItemPriceGet( u16 item )
{
	return	ItemData[ ItemNumberCheck( item ) ].price;
}

//------------------------------------------------------------------------------
//	アイテム装備効果取得					ItemData[ item ].eqp;
//
//	引数   : u16 item = アイテム番号
//	戻り値 : 装備効果番号
//------------------------------------------------------------------------------
u8 ItemEquipGet( u16 item )
{
	return	ItemData[ ItemNumberCheck( item ) ].eqp;
}

//------------------------------------------------------------------------------
//	アイテム威力取得						ItemData[ item ].atc;
//
//	引数   : u16 item = アイテム番号
//	戻り値 : 威力
//------------------------------------------------------------------------------
u8 ItemAttackGet( u16 item )
{
	return	ItemData[ ItemNumberCheck( item ) ].atc;
}

//------------------------------------------------------------------------------
//	アイテム説明メッセージ取得				ItemData[ item ].msg;
//
//	引数   : u16 item = アイテム番号
//	戻り値 : 説明のポインタ
//------------------------------------------------------------------------------
u8 * ItemMessageGet( u16 item )
{
	return	(u8 *)ItemData[ ItemNumberCheck( item ) ].msg;
}

//------------------------------------------------------------------------------
//	アイテム重要フラグ取得					ItemData[ item ].imp;
//
//	引数   : u16 item = アイテム番号
//	戻り値 : 重要フラグ
//------------------------------------------------------------------------------
u8 ItemEventGet( u16 item )
{
	return	ItemData[ ItemNumberCheck( item ) ].imp;
}

//------------------------------------------------------------------------------
//	アイテム便利ボタン登録フラグ取得		ItemData[ item ].cnv_btn;
//
//	引数   : u16 item = アイテム番号
//	戻り値 : 便利ボタン登録フラグ
//------------------------------------------------------------------------------
u8 ItemCnvButtonGet( u16 item )
{
	return	ItemData[ ItemNumberCheck( item ) ].cnv_btn;
}

//------------------------------------------------------------------------------
//	アイテム保存ポケット番号取得			ItemData[ item ].pocket;
//
//	引数   : u16 item = アイテム番号
//	戻り値 : 保存ポケット番号
//------------------------------------------------------------------------------
u8 ItemPocketGet( u16 item )
{
	return	ItemData[ ItemNumberCheck( item ) ].pocket;
}

//------------------------------------------------------------------------------
//	アイテムフィールド使用場面取得			ItemData[ item ].fld;
//
//	引数   : u16 item = アイテム番号
//	戻り値 : フィールド使用場面番号
//------------------------------------------------------------------------------
u8 ItemFldSysGet( u16 item )
{
	return	ItemData[ ItemNumberCheck( item ) ].fld;
}

//------------------------------------------------------------------------------
//	アイテム使用フィールドプログラム取得	ItemData[ item ].fld_func
//
//	引数   : u16 item = アイテム番号
//	戻り値 : フィールドプログラムアドレス
//------------------------------------------------------------------------------
void_func_u8 ItemFldFuncGet( u16 item )
{
	return	ItemData[ ItemNumberCheck( item ) ].fld_func;
}

//------------------------------------------------------------------------------
//	アイテムバトル使用場面取得				ItemData[ item ].btl;
//
//	引数   : u16 item = アイテム番号
//	戻り値 : バトル使用場面番号
//------------------------------------------------------------------------------
u8 ItemBtlSysGet( u16 item )
{
	return	ItemData[ ItemNumberCheck( item ) ].btl;
}

//------------------------------------------------------------------------------
//	アイテム使用バトルプログラム取得		ItemData[ item ].btl_func
//
//	引数   : u16 item = アイテム番号
//	戻り値 : バトルプログラムアドレス
//------------------------------------------------------------------------------
void_func_u8 ItemBtlFuncGet( u16 item )
{
	return	ItemData[ ItemNumberCheck( item ) ].btl_func;
}

//------------------------------------------------------------------------------
//	アイテムワーク取得						ItemData[ item ].work;
//
//	引数   : u16 item = アイテム番号
//	戻り値 : ワーク内の番号
//------------------------------------------------------------------------------
u8 ItemWorkGet( u16 item )
{
	return	ItemData[ ItemNumberCheck( item ) ].work;
}
