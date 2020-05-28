/***********************************************************************
**	ホウエン地方全体マップ（分布図、空をとぶ、トレナビ等）
**
**	masao taya
**
***********************************************************************/
#ifndef _TOWNMAP_H_
#define _TOWNMAP_H_

#include "MaDefine.h"
#include "mappos.h"

/*============================================================*/
/*   定数                                                     */
/*============================================================*/

/* 表示モード */
enum TOWNMAP_MODE {
	TOWNMAP_WHOLE,  // 全体表示
	TOWNMAP_ZOOM,   // 拡大表示
};

/* カーソルが指している場所 */
enum TOWNMAP_CURSOR {
	MAPCURSOR_SPACE,    // 空白（何も無い場所）
	MAPCURSOR_ROAD,     // ロード
	MAPCURSOR_ARRIVE,   // 訪れたことのある街
	MAPCURSOR_NOARRIVE, // 訪れたことのない街
	MAPCURSOR_FLYING,   // 訪れたことのある街以外の場所（とんでいける）
};

/* キー判定の戻り値 */
enum TOWNMAP_KEY {
	MAPKEY_FREE,    // 何も押されていない
	MAPKEY_MOVE,    // カーソル移動開始
	MAPKEY_WAIT,    // カーソル移動待ち
	MAPKEY_CHANGE,  // カーソル移動終了
	MAPKEY_DECIDE,  // Ａボタン
	MAPKEY_CANCEL,  // Ｂボタン
};

/* 地域名の文字数 */
#define MAPNAME_MAX     (18)   // 文字列長の最大
#define MAPNAME_WIDTH   (10)   // 表示キャラ数最大


#define CURSOR_CELL_SIZE   (OBJ_SIZE16_16x16 * 2)
#define ZCURSOR_CELL_SIZE  (OBJ_SIZE16_32x32 * 3)

/* マップのブロック数（カーソルサイズ = １ブロック） */
#define BLOCK_XMIN    (1)
#define BLOCK_XMAX    (28)
#define BLOCK_YMIN    (2)
#define BLOCK_YMAX    (16)
#define BLOCK_WIDTH   (BLOCK_XMAX-BLOCK_XMIN+1)
#define BLOCK_HEIGHT  (BLOCK_YMAX-BLOCK_YMIN+1)


/*============================================================*/
/*   ワーク領域                                               */
/*============================================================*/

typedef struct {
	// --- 外部で参照する
	u8   mapname[MAPNAME_MAX+1]; // カーソルが指している場所の地名
	u16  mapno;                  // カーソルが指している場所の地域番号
	u8   cursor_state;           // カーソルが指している場所の状態（enum TOWNMAP_CURSOR)
	u8   map_subno;              // カーソルがさしている場所のサブナンバー

	// ---- 内部でのみ使用
	u8 (*keyfunc)(void);
	actWork * cursor_actor;
	actWork *jiki_actor;

	u32 bg2x, bg2y;
	s32 dx,dy,dmx,dmy;
	s32  map_px, map_py, map_ax, map_ay;
	s32  ratio, ratio_add;

	u16  cursor_x;
	u16  cursor_y;
	u16  cursor_cell_id;
	u16  cursor_pal_id;
	s16  map_ox;
	s16  map_oy;
	s16  map_end_x;
	s16  map_end_y;
	u16  zoom_x;
	u16  zoom_y;
	s16  map_aoy;
	s16  map_aox;
	u16  scr_cnt;
	u16  mc_cnt;
	u16  jiki_cell_id;
	u16  jiki_pal_id;
	u16  jiki_x;
	u16  jiki_y;

	u8   mode;
	u8   init_prog;
	s8   cursor_move_cnt, cursor_ax, cursor_ay;

	u8 bgscr_req;
	u8 jiki_tenmetsu_flg;
	u8 jiki_tenmetsu_ok;

	u8  buf[256];

	u8  cursor_cell[CURSOR_CELL_SIZE];
	u8  zcursor_cell[ZCURSOR_CELL_SIZE];

}TOWNMAP_WORK;

/*============================================================*/
/*   プロトタイプ                                             */
/*============================================================*/
void TownMapInit(TOWNMAP_WORK *work, u8 mode);
u8 TownMapInitMain(void);
void TownMapInitBegin(TOWNMAP_WORK *work, u8 mode);

u8   TownMapKeyRead(void);
void TownMapAddCursor(u16 cell_id, u16 pal_id);
void TownMapAddJiki(u16 cell_id, u16 pal_id);
void TownMapDelCursor(void);
void TownMapQuit(void);
void TownMapModeChangeInit(void);
u8   TownMapModeChange(void);
void TownMapScroll(void);
u16 TownMap_BlockToWPos(u16 x, u16 y);
void TownMap_CursorAnmStart(void);
void TownMap_CursorAnmStop(void);
void TownMap_SetOfs(s16 xofs, s16 yofs);
void TownMap_JikiTenmetsu(void);
void TownMapGetMapPosition(u16 mapno, u16 *x, u16 *y, u16 *w, u16 *h);
u16  ChangeMarineToGroundMapNo(u16 mapno);

#endif
