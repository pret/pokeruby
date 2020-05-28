//=========================================================================
//	
//
//	ワープ飛び先データ関連
//
//
//	2001.01.24	GAME FREAK Inc.
//=========================================================================

#include "common.h"

#include "map.h"
#include "../evdata/maparray.h"

#define __WARPDATA_H_GLOBAL_
#include "warpdata.h"

static const WARP_POS WarpPosTable[];

#include "../data/warptbl.c"

#define WARP_DATA_MAX	NELEMS(WarpPosTable)

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...


//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;

//=========================================================================
//	所属ＩＤとマップＩＤからワープとび先指定を返す
//	<引数>		div_id	所属ＩＤ
//				map_id	マップＩＤ	
//	<戻り値>	0以外	飛び先指定ナンバー
//				0		指定なし
//=========================================================================
int GetWarpNoByMapID( u16 div_id, u16 map_id )
{
	int i;

	for ( i=0; i<WARP_DATA_MAX; i++ ) {
		if ( WarpPosTable[i].div_id == div_id &&
				WarpPosTable[i].map_id == map_id ) {
			return i+1;
		}
	}
	return 0;
}

//=========================================================================
//	所属ＩＤとマップＩＤからワープとび先データを返す
//	<引数>		div_id	所属ＩＤ
//				map_id	マップＩＤ	
//	<戻り値>	NULL以外	飛び先データアドレス
//				NULL		指定なし
//=========================================================================
const WARP_POS * GetWarpPosByMapID( u16 div_id, u16 map_id )
{
	int num;

	num = GetWarpNoByMapID( div_id, map_id );
	if ( num == 0 ) return NULL;

	return &WarpPosTable[num-1];
}

const WARP_POS * GetWarpPosByNo( int number )
{
	if ( number == 0 ) return NULL;
	if ( number > WARP_DATA_MAX ) return NULL;
	return &WarpPosTable[number-1];
}


