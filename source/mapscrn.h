#ifndef __MAPSCRN_H__
#define __MAPSCRN_H__

//=========================================================================
//
//	MAPSCRN.H
//
//	マップキャラ、セル、スクリーンの型定義
//	
//=========================================================================

#undef GLOBAL
#ifdef MAPSCRN_H_GLOBAL
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================


//------------------------------------------------------------
// マップスクリーンデータの内訳
//  4ビット：高さ情報
//  2ビット：ヒットチェック
// 10ビット：セルナンバー
//------------------------------------------------------------
#define CELL_HEIGHT_MASK	0xf000
#define	CELL_HITCHECK_MASK	0x0c00
#define CELL_CODE_MASK		0x03ff

#define	CELL_HEIGHT_SHIFT	12
#define CELL_HITCHECK_SHIFT	10

// マップの高さ定義
#define MAP_HEIGHT_FREE			0x00
#define MAP_HEIGHT_WATER		0x01
#define MAP_HEIGHT_GROUND		0x04
#define MAP_HEIGHT_ROOF			0x07
#define MAP_HEIGHT_HOLD			0x0f

//範囲外セルの定義
#define OUTRANGE_CELL	(0xffff&CELL_CODE_MASK)


//------------------------------------------------------------
// セルアトリビュートデータの内訳
// 8ビット：通常セルアトリビュート
// 4ビット：未使用
// 4ビット：BG反映フラグ（==1で下2層に反映する）
// 残り：未使用
//------------------------------------------------------------
#define CELLATTR_DATA_MASK	0x00ff
#define CELLATTR_LAYER_MASK	0xf000
#define CELLATTR_LAYER_SHIFT 12


enum{
	MAP_CGX_NORMAL = 0,		/* 非圧縮マップデータ */
	MAP_CGX_COMPRESS,		/* 圧縮マップデータ */

	MAP_PLTT_NORMAL = 0,	/* 非圧縮パレットデータ */
	MAP_PLTT_NORMALSUB,		/* 非圧縮パレットデータ(非常駐） */
	MAP_PLTT_COMPRESS,		/* 圧縮パレットデータ */
};

//------------------------------------------------------------
//	マップキャラデータ
//------------------------------------------------------------
typedef struct {
	u8 char_type;						// CGXデータ形式
	u8 pltt_type;						// PLTTデータ形式
	const u8 * CharData;				// CGXデータアドレス
	const u16 * ColorData;				// パレットデータアドレス
	const u16 * CellCharData;			// セルを構成するキャラのテーブル
	const u16 * CellAttrData;			// セルに対応するアトリビュートのテーブル
	void (*BGanime)(void);				// BGアニメ初期化関数へのポインタ
}MapCharData;

//------------------------------------------------------------
//	マップスクリーンデータ
//------------------------------------------------------------
typedef struct {
	int Xsize;							// スクリーンのＸサイズ
	int Ysize;							// スクリーンのＹサイズ
	const u16 * OutRangeCell;			// 範囲外セルを構成するデータ
	const u16 * ScreenData;				// スクリーンを構成するセルデータ
	const MapCharData * MainCharData;	// 使用常駐キャラデータの指定
	const MapCharData * SubCharData;	// 使用非常駐キャラデータの指定
}MapScreenData;



#undef GLOBAL
#endif	/*__MAPSCRN_H__*/

