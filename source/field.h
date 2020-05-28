//=========================================================================
//	
//	フィールド関連リソース定義
//
//=========================================================================

#ifndef FIELD_H
#define FIELD_H

//=========================================================================
//	定義
//=========================================================================
//#define name value


//------------------------------------------------------------------------
//
// 表示リソース割り振りのための定義
//
//------------------------------------------------------------------------

// ＢＧの割り当て
#define	MSG_BG_NO		0
#define	EFFECT_BG_NO	1
#define MAP_UP_BG_NO	1
#define MAP_LOW_BG_NO	2
#define MAP_BTM_BG_NO	3

// ＢＧのプライオリティ
#define MSG_BG_PRI		0
#define	EFFECT_BG_PRI	3
#define MAP_UP_BG_PRI	1
#define MAP_LOW_BG_PRI	2
#define MAP_BTM_BG_PRI	3

// キャラエリアの割り当て
#define MSG_CHR_BASE		2
#define EFFECT_CHR_BASE		0
#define MAP_UP_CHR_BASE		0
#define MAP_LOW_CHR_BASE	0
#define MAP_BTM_CHR_BASE	0

// スクリーンエリアの割り当て
#define MSG_SCRN_BASE		31
#define EFFECT_SCRN_BASE	30
#define MAP_UP_SCRN_BASE	29
#define MAP_LOW_SCRN_BASE	28
#define MAP_BTM_SCRN_BASE	30

#define BASE_CHR_ADRS(n)	( BG_VRAM + n * 0x4000 )
#define BASE_SCRN_ADRS(n)	( BG_VRAM + n * 0x0800 )

#define NAME_LEN		10

#define	WATER_CHR_CODE	(0x14 | (3 << BG_SC_PLTT_SHIFT) )

// マップキャラの常駐・非常駐
#define MAP_CHR_1ST_SIZE	0x200	// 常駐キャラ数
#define	MAP_CHR_2ND_SIZE	0x200	// 非常駐キャラ数
#define MAP_CHR_1ST_NO		0x000	// 常駐キャラ開始ナンバー
#define MAP_CHR_2ND_NO		0x200	// 非常駐キャラ開始ナンバー

// マップパレットの常駐・非常駐
#define	MAP_PLTT_1ST_SIZE	0x06	// 常駐パレット数
#define	MAP_PLTT_2ND_SIZE	0x06	// 非常駐パレット数
#define MAP_PLTT_1ST_NO		0x00	// 常駐パレット開始ナンバー
#define MAP_PLTT_2ND_NO		0x06	// 非常駐パレット開始ナンバー

// マップセルの常駐・非常駐
#define	MAP_CELL_1ST_SIZE	0x200	//常駐セルの数
#define	MAP_CELL_2ND_SIZE	0x200	//常駐セルの数
#define	MAP_CELL_1ST_NO		0x000	//非常駐セルの開始ナンバー
#define	MAP_CELL_2ND_NO		0x200	//非常駐セルの開始ナンバー

// フォント使用領域の割り当て
#define NWIN_CHR_START_NO	0x000
#define KWIN_CHR_START_NO	0x200



//=========================================================================
//	変数
//=========================================================================

#endif	/*FIELD_H*/

