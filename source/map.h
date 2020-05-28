#ifndef __MAP_H__
#define __MAP_H__

//=========================================================================
//
//
//	マップ関連定義
//
//	
//=========================================================================

#include "evobj.h"
#include "sxy.h"
#include "mapscrn.h"

#undef GLOBAL
#ifdef MAP_H_GLOBAL
#define GLOBAL	/* */
#else
#define	GLOBAL	extern
#endif


//=========================================================================
//	定義
//=========================================================================

//------------------------------------------------------------
//------------------------------------------------------------
#define CELL_SIZE	16

// 仮想画面関連定義
#define	X_MARGIN		7
#define	Y_MARGIN		5
#define	VIEW_UP_MARGIN	2

#define SCR_CELL_X	(15)
#define SCR_CELL_Y	(12)
#define	SCR_BG_CELL_X	(SCR_CELL_X)
#define SCR_BG_CELL_Y	(14)

#define CENTER_X_MARGIN	(X_MARGIN)
#define CENTER_Y_MARGIN	(Y_MARGIN+VIEW_UP_MARGIN)

#define MAP_X_MARGIN	(CENTER_X_MARGIN)
#define MAP_Y_MARGIN	(CENTER_Y_MARGIN)

#define MAP_LEFT_MARGIN		MAP_X_MARGIN
#define MAP_RIGHT_MARGIN	8
#define MAP_UP_MARGIN		MAP_Y_MARGIN
#define MAP_DOWN_MARGIN		7


#define MAP_OUT_MARGIN		2

//------------------------------------------------------------
//	フィールドマップ接続用定義
//------------------------------------------------------------
enum{
	MAPSITE_NOTHING,       	//000
	MAPSITE_DOWN,          	//001
	MAPSITE_UP,            	//002
	MAPSITE_LEFT,          	//003
	MAPSITE_RIGHT,         	//004
	SITE_BELOW,			/* もぐる方向 */
	SITE_ABOVE,			/* 浮かぶ方向 */
};

//------------------------------------------------------------
// イベントデータ(仮）
//------------------------------------------------------------
typedef u8 EV_DATA;

//------------------------------------------------------------
// フィールドマップ接続データ
//------------------------------------------------------------
typedef struct{
		u8 direction;
		int PosDiff;
		u8 div_id;
		u8 map_id;
}MLink;

typedef struct{
		int count;
		const MLink * Links;
}MapLinkData;



//------------------------------------------------------------
//	マップ総合データ構造体定義
//------------------------------------------------------------
typedef struct MapTotal{
		const MapScreenData * Screen;		// マップスクリーンデータへのポインタ
		const SXY_DATA * Sxy;				// ＳＸＹデータへのポインタ
		const EV_DATA * Event;				// イベントデータへのポインタ
		const MapLinkData * Link;			// マップリンク情報へのポインタ
		u16		BGMNo;						// ＢＧＭのナンバー
		u16		screen_id;					// マップスクリーンデータのID
		u8		WorldPos;					// ワールドマップ上の位置情報
		u8		lighting;					// 明るさ指定
		u8		weather;					// 天候指定
		u8		type;						// 分類
		u8		wx,wy;						// ワールドマップ上での位置指定
		u8		disp_sw;					// 地名表示のオン・オフ
		u8		battle_bg;					// 戦闘背景の指定
}MapTotalData;

typedef MapTotalData MTD;



//Scroll 制御用、暫定
typedef struct {
	int dx;
	int dy;
}Vector;


#define NOT_MOVE_VALUE (-1)
#include "scroll.ndw"


//=========================================================================
//	変数
//=========================================================================

extern const Vector SiteVector[];

/* 現在のマップ総合データ構造体 */
extern MapTotalData NowMap;

#undef GLOBAL
#endif /*__MAP_H__*/
