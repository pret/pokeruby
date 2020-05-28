#ifndef FIELDMAP_H
#define FIELDMAP_H

//=========================================================================
//
//
//	仮想フィールドマップ処理関連
//
//
//=========================================================================

#include "map.h"

#undef GLOBAL
#ifdef FIELDMAP_H_GLOBAL
#define GLOBAL	/* */
#else
#define GLOBAL	extern
#endif


//=========================================================================
//	定義
//=========================================================================


typedef struct {
		int Xsize;
		int Ysize;
		u16 * Data;
}VMAP_STATUS;

typedef struct {
		u8	chg_flag:1;		//TRUE--> Map Change, FALSE--> Same Map...
		int diffx;
		int diffy;
}MapChg;


//=========================================================================
//	変数
//=========================================================================

extern VMAP_STATUS VMap;				// 仮想マップデータ
extern MapChg MapChange;


//=========================================================================
//	関数プロトタイプ
//=========================================================================
GLOBAL void MakeNowVirtualMap( void );
GLOBAL void MakeContinueVirtualMap( void );

GLOBAL int CheckMapMove( int site );
GLOBAL int CheckMapLimit(int nextXpos, int nextYpos);
GLOBAL int MoveVMapPosition(int dx, int dy);
GLOBAL const MLink * GetLinkMap(s16 x, s16 y);
const MapTotalData * GetNextLinkMapData(const MLink * Link);

GLOBAL void SetMapCenterPos( u16 x, u16 y );
GLOBAL void GetMapCenterPos(u16* x, u16* y);
GLOBAL void SetNowMapPos( u16 x, u16 y );
GLOBAL void GetNowMapPos(u16* x, u16* y);

//GLOBAL int GetCell(int map_x, int map_y);					//セルデータ全体を取得する
GLOBAL int GetCellAttribute(int px,int py);					//セルアトリビュートを取得する
GLOBAL int GetCellCode(int px, int py);						//セルデータを取得
GLOBAL u8 GetCellHeight(int px, int py);					//セルの高さを取得
GLOBAL u8 GetCellHitCheck(int px, int py);					//セルの進入可否を取得
GLOBAL void SetCell(int map_x, int map_y ,u16 cell);		// 指定位置にセルをセット
GLOBAL void SetCellDirect(int map_x, int map_y ,u16 cell);	// 2002/07/22 by nakahiro
GLOBAL u8 GetCellLayer(int px, int py);						//セル描画のBG階層を取得

GLOBAL u16 GetMapCellAttributeData(u16 code);				//セルコード→セルアトリビュート

GLOBAL void BackupVirtualMap( void );
GLOBAL void RecoverVirtualMap( void );

#undef GLOBAL
#endif /*FIELDMAP_H*/
