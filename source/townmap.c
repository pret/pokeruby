/***********************************************************************
**	ホウエン地方全体マップ（分布図、空をとぶ、トレナビ等）
**
**	masao taya
**
***********************************************************************/
#include "common.h"
#include "task.h"
#include "actanm.h"
#include "palanm.h"
#include "intr.h"
#include "calctool.h"
#include "print.h"
#include "fieldmap.h"
#include "fld_main.h"
#include "fld_task.h"
#include "fld_tool.h"
#include "menutool.h"
#include "base.h"
#include "mapparam.h"
#include "ev_flag.h"
#include "sysflag.h"
#include "mapparam.h"
#include "scr_tool.h"
#include "message.h"

#include "mapimg.dat"
#include "townmap.dat"

#include "townmap.h"
#include "mapname.dat"

#include "mappos.def"
#include "mappos.dat"

#include "../evdata/maparray.h"

/*====================================================================*/
/*   定数（画像転送設定等）                                           */
/*====================================================================*/
#define MAP_ADDR(b)   (BG_VRAM + (b) * 0x800)
#define CHAR_ADDR(b)  (BG_VRAM + (b) * 0x4000)

#define MAPIMG_MAP_BLOCK   (28)
#define MAPIMG_CHAR_BLOCK  (2)
#define MAPIMG_MAP_ADDR    MAP_ADDR(MAPIMG_MAP_BLOCK)
#define MAPIMG_CHAR_ADDR   CHAR_ADDR(MAPIMG_CHAR_BLOCK)
#define MAPIMG_PAL         (PA_BG7)
#define MAPIMG_PALSIZE     (0x60)

#define BLOCK_TO_POS(b)  (4+(b)*8)

#define ZOOM_CX       (56)
#define ZOOM_CY       (72)
#define ZOOM_L_LIMIT  (BLOCK_TO_POS(BLOCK_XMIN)-ZOOM_CX)
#define ZOOM_R_LIMIT  (BLOCK_TO_POS(BLOCK_XMAX)-ZOOM_CX)
#define ZOOM_T_LIMIT  (BLOCK_TO_POS(BLOCK_YMIN)-ZOOM_CY)
#define ZOOM_B_LIMIT  (BLOCK_TO_POS(BLOCK_YMAX)-ZOOM_CY)
#define ZOOM_SYNC     (16)

#define ZOOM_TO_XPOS(x)  ((((x)-ZOOM_L_LIMIT)/8)+BLOCK_XMIN)
#define ZOOM_TO_YPOS(y)  ((((y)-ZOOM_T_LIMIT)/8)+BLOCK_YMIN)


#define BLANK_WIDTH  (16*8)

/*====================================================================*/
/*   グローバル変数                                                   */
/*====================================================================*/
static TOWNMAP_WORK * wp = (TOWNMAP_WORK *)UserWork;

/*====================================================================*/
/*   プロトタイプ                                                     */
/*====================================================================*/
static u16   pos_to_mapno(u16 x, u16 y);
//static void  mapno_to_pos(u16 mapno, u16 *px, u16 *py);
static u8    mapno_to_state(u16 mapno);
static u8    key_whole(void);
static u8    key_zoom(void);
static u8    key_whole_wait(void);
static u8    key_zoom_wait(void);
static void  set_bg_affine(s16 ox, s16 oy, s16 cx, s16 cy, u16 xratio, u16 yratio, u8 angle);
static void jiki_modechange_init(void);
static void jiki_modechange_finish(void);
static void zoom_bg_scroll(s16 ox, s16 oy);
static void calc_submap_no(void);
static u16 change_ex_mapno(u16 mapno);
static void set_mapno_and_pos(void);

extern u8* CopyMapName(u8 *buf, u16 div, u16 size);

/***********************************************************************
**	ＢＧ設定、データ初期化等を行う
**
**	work	ワーク領域として使用してよいアドレス
**	mode	初期表示モード（enum TOWNMAP_MODE）
**
***********************************************************************/
void TownMapInit(TOWNMAP_WORK *work, u8 mode)
{
	TownMapInitBegin(work, mode);
	while(1){
		if(!TownMapInitMain()){ break; }
	}
}
/***********************************************************************
**	ＢＧ設定、データ初期化等を行う
**
**	work	ワーク領域として使用してよいアドレス
**	mode	初期表示モード（enum TOWNMAP_MODE）
**
***********************************************************************/
void TownMapInitBegin(TOWNMAP_WORK *work, u8 mode)
{
	wp = work;
	wp->init_prog = 0;
	wp->mode = mode;
	wp->keyfunc = (mode == TOWNMAP_WHOLE)? key_whole : key_zoom;
}
u8 TownMapInitMain(void)
{
	switch(wp->init_prog){
	case 0:
		LZ77UnCompVram((void*)(townmap_Character), (void*)MAPIMG_CHAR_ADDR);
		break;

	case 1:
		LZ77UnCompVram((void*)(townmap_Map), (void*)MAPIMG_MAP_ADDR);
		break;

	case 2:
		PaletteWorkSet(townmap_Palette, MAPIMG_PAL, MAPIMG_PALSIZE);
		break;

	case 3:
		LZ77UnCompWram((void*)cursor_Character, (void*)(wp->cursor_cell));
		break;

	case 4:
		LZ77UnCompWram((void*)zcursor_Character, (void*)(wp->zcursor_cell));
		break;

	case 5:
		set_mapno_and_pos();

		wp->jiki_x = wp->cursor_x;//BLOCK_TO_POS(wp->cursor_x);
		wp->jiki_y = wp->cursor_y;//BLOCK_TO_POS(wp->cursor_y);
		wp->cursor_state = mapno_to_state(wp->mapno);

		wp->mapno = change_ex_mapno(wp->mapno);
		CopyMapName(wp->mapname, wp->mapno, MAPNAME_WIDTH);
		break;

	case 6:
		if(wp->mode == TOWNMAP_WHOLE){
			set_bg_affine(0, 0, 0, 0, 0x100, 0x100, 0);
		}else{
			wp->map_ox = BLOCK_TO_POS(wp->cursor_x) - ZOOM_CX;
			wp->map_oy = BLOCK_TO_POS(wp->cursor_y) - ZOOM_CY;
			wp->zoom_x = wp->cursor_x;
			wp->zoom_y = wp->cursor_y;
			set_bg_affine(wp->map_ox, wp->map_oy, ZOOM_CX, ZOOM_CY, 0x80, 0x80, 0);
		}
		break;

	case 7:
		calc_submap_no();

		TownMapScroll();

		wp->cursor_actor = NULL;
		wp->jiki_actor = NULL;

		wp->cursor_move_cnt = 0;
		wp->jiki_tenmetsu_flg = 0;

		// ＢＧ２
		*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_2
		| MAPIMG_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| MAPIMG_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_LOOP_ON
		| BG_COLOR_256 ;

		wp->init_prog++;
		return 0;

	default:
		return 0;
	}

	wp->init_prog++;
	return 1;
}
/***********************************************************************
**	タウンマップ終了処理（アクター削除）
***********************************************************************/
void TownMapQuit(void)
{
	if(wp->cursor_actor != NULL){
		DelActor(wp->cursor_actor);
		CellDel(wp->cursor_cell_id);
		ObjPalRegNumDel(wp->cursor_pal_id);
	}
	if(wp->jiki_actor != NULL){
		DelActor(wp->jiki_actor);
		CellDel(wp->jiki_cell_id);
		ObjPalRegNumDel(wp->jiki_pal_id);
	}
}
/***********************************************************************
**	キー判定をして、カーソル位置や地域名バッファの更新を行う
**
**	戻り値：1...カーソルの指す地域が更新された／0...それ以外
**
***********************************************************************/
u8 TownMapKeyRead(void)
{
	return (*(wp->keyfunc))();
}
/******************************************
**	キー判定（全体表示時）               **
******************************************/
#define CURSOR_SPEED    (1)
#define CURSOR_MOVE_CNT (4)

static u8 key_whole(void)
{
	u8 ret = MAPKEY_FREE;

	wp->cursor_ax = 0;
	wp->cursor_ay = 0;
	if((sys.Cont & U_KEY) && (wp->cursor_y > BLOCK_YMIN)){
		wp->cursor_ay = -CURSOR_SPEED;
		ret = MAPKEY_MOVE;
	}
	if((sys.Cont & D_KEY) && (wp->cursor_y < BLOCK_YMAX)){
		wp->cursor_ay = CURSOR_SPEED;
		ret = MAPKEY_MOVE;
	}
	if((sys.Cont & L_KEY) && (wp->cursor_x > BLOCK_XMIN)){
		wp->cursor_ax = -CURSOR_SPEED;
		ret = MAPKEY_MOVE;
	}
	if((sys.Cont & R_KEY) && (wp->cursor_x < BLOCK_XMAX)){
		wp->cursor_ax = CURSOR_SPEED;
		ret = MAPKEY_MOVE;
	}
	if(sys.Trg & A_BUTTON){
		ret = MAPKEY_DECIDE;
	}else if(sys.Trg & B_BUTTON){
		ret = MAPKEY_CANCEL;
	}

	if(ret == MAPKEY_MOVE){
		wp->cursor_move_cnt = CURSOR_MOVE_CNT;
		wp->keyfunc = key_whole_wait;
	}

	return ret;
}
static u8 key_whole_wait(void)
{
	if(wp->cursor_move_cnt){
		return MAPKEY_WAIT;
	}else{
		u16 mapno;

		if(wp->cursor_ax > 0){ wp->cursor_x++; }
		if(wp->cursor_ax < 0){ wp->cursor_x--; }
		if(wp->cursor_ay > 0){ wp->cursor_y++; }
		if(wp->cursor_ay < 0){ wp->cursor_y--; }

		mapno = pos_to_mapno(wp->cursor_x, wp->cursor_y);
		wp->cursor_state = mapno_to_state(mapno);
		if(mapno != wp->mapno){
			wp->mapno = mapno;
			CopyMapName(wp->mapname, wp->mapno, MAPNAME_WIDTH);
		}
		calc_submap_no();
		wp->keyfunc = key_whole;

		return MAPKEY_CHANGE;
	}
}
/******************************************
**	キー判定（拡大表示時）               **
******************************************/
static u8 key_zoom(void)
{
	u8 key = MAPKEY_FREE;

	wp->map_aox = 0;
	wp->map_aoy = 0;
	if((sys.Cont & U_KEY) && (wp->map_oy > ZOOM_T_LIMIT)){
		wp->map_aoy = -1;
		key = MAPKEY_MOVE;
	}
	if((sys.Cont & D_KEY) && (wp->map_oy < ZOOM_B_LIMIT)){
		wp->map_aoy = 1;
		key = MAPKEY_MOVE;
	}
	if((sys.Cont & L_KEY) && (wp->map_ox > ZOOM_L_LIMIT)){
		wp->map_aox = -1;
		key = MAPKEY_MOVE;
	}
	if((sys.Cont & R_KEY) && (wp->map_ox < ZOOM_R_LIMIT)){
		wp->map_aox = 1;
		key = MAPKEY_MOVE;
	}
	if(sys.Trg & A_BUTTON){
		key = MAPKEY_DECIDE;
	}
	if(sys.Trg & B_BUTTON){
		key = MAPKEY_CANCEL;
	}


	if(key == MAPKEY_MOVE){
		wp->keyfunc = key_zoom_wait;
		wp->scr_cnt = 0;
	}

	return key;
}
static u8 key_zoom_wait(void)
{
	wp->map_oy += wp->map_aoy;
	wp->map_ox += wp->map_aox;
//	set_bg_affine(wp->map_ox, wp->map_oy, ZOOM_CX, ZOOM_CY, 0x80, 0x80, 0);
	zoom_bg_scroll(wp->map_ox, wp->map_oy);

	if(++(wp->scr_cnt) == 8){
		u16 x = 0, y = 0;
		x = ZOOM_TO_XPOS(wp->map_ox);
		y = ZOOM_TO_YPOS(wp->map_oy);
		if(x != wp->zoom_x || y != wp->zoom_y){
			u16 mapno;

			wp->zoom_x = x;
			wp->zoom_y = y;

			mapno = pos_to_mapno(x, y);
			wp->cursor_state = mapno_to_state(mapno);
			if(mapno != wp->mapno){
				wp->mapno = mapno;
				CopyMapName(wp->mapname, wp->mapno, MAPNAME_WIDTH);
			}
			calc_submap_no();
		}
		wp->scr_cnt = 0;
		wp->keyfunc = key_zoom;
		return MAPKEY_CHANGE;
	}
	return MAPKEY_WAIT;
}
/***********************************************************************
**	モード切り替え初期化
***********************************************************************/
void TownMapModeChangeInit(void)
{
	if(wp->mode == TOWNMAP_WHOLE){
		wp->map_ox = wp->map_oy = 0;
		wp->map_px = wp->map_py = 0;
		wp->map_end_x = BLOCK_TO_POS(wp->cursor_x) - ZOOM_CX;
		wp->map_end_y = BLOCK_TO_POS(wp->cursor_y) - ZOOM_CY;
		wp->map_ax = (wp->map_end_x << 8) / ZOOM_SYNC;
		wp->map_ay = (wp->map_end_y << 8) / ZOOM_SYNC;

		wp->zoom_x = wp->cursor_x;
		wp->zoom_y = wp->cursor_y;

		wp->ratio = (0x100 << 8);
		wp->ratio_add = (-(0x80 << 8)) / ZOOM_SYNC;

	}else{
		wp->map_px = wp->map_ox << 8;
		wp->map_py = wp->map_oy << 8;
		wp->map_end_x = 0;
		wp->map_end_y = 0;
		wp->map_ax = -(wp->map_px / ZOOM_SYNC);
		wp->map_ay = -(wp->map_py / ZOOM_SYNC);

		wp->cursor_x = wp->zoom_x;
		wp->cursor_y = wp->zoom_y;

		wp->ratio = (0x80 << 8);
		wp->ratio_add = (0x80 << 8) / ZOOM_SYNC;
	}
	wp->mc_cnt = 0;
	TownMapDelCursor();

	jiki_modechange_init();
}
/***********************************************************************
**	モード切り替え更新
**
**	戻り値     1 ... 継続中／0 ... 終了
**
***********************************************************************/
u8 TownMapModeChange(void)
{
	u8 ret;

	if(wp->mc_cnt >= ZOOM_SYNC){ return 0; }

	if(++(wp->mc_cnt) == ZOOM_SYNC){
		wp->map_ax = 0;
		wp->map_ay = 0;
		wp->map_ox = wp->map_end_x;
		wp->map_oy = wp->map_end_y;
		wp->ratio = (wp->mode == TOWNMAP_WHOLE)? (0x80<<8) : (0x100<<8);
		wp->mode = !(wp->mode);
		wp->keyfunc = (wp->mode == TOWNMAP_WHOLE)? key_whole : key_zoom;
		TownMapAddCursor(wp->cursor_cell_id, wp->cursor_pal_id);
		jiki_modechange_finish();
		ret = 0;
	}else{
		wp->map_px += wp->map_ax;
		wp->map_py += wp->map_ay;
		wp->map_ox = wp->map_px >> 8;
		wp->map_oy = wp->map_py >> 8;
		wp->ratio += wp->ratio_add;

		// 
		if( (wp->map_ax < 0 && wp->map_ox < wp->map_end_x) ||
			(wp->map_ax > 0 && wp->map_ox > wp->map_end_x)
		){
			wp->map_ox = wp->map_end_x;
			wp->map_ax = 0;
		}
		if( (wp->map_ay < 0 && wp->map_oy < wp->map_end_y) ||
			(wp->map_ay > 0 && wp->map_oy > wp->map_end_y)
		){
			wp->map_oy = wp->map_end_y;
			wp->map_ay = 0;
		}
		if(wp->mode == TOWNMAP_WHOLE){
			if(wp->ratio < (0x80 << 8)){
				wp->ratio = (0x80 << 8);
				wp->ratio_add = 0;
			}
		}else{
			if(wp->ratio > (0x100 << 8)){
				wp->ratio = (0x100 << 8);
				wp->ratio_add = 0;
			}
		}

		ret = 1;
	}
	set_bg_affine(wp->map_ox, wp->map_oy, ZOOM_CX, ZOOM_CY, (wp->ratio>>8), (wp->ratio>>8), 0);

	return ret;
}
/***********************************************************************
**	拡縮ＢＧレジスタへのパラメータセット
**
**	ox, oy          ...  左上座標
**	cx, cy          ...  中心座標
**	xratio, yratio  ...  Ｘ方向、Ｙ方向の拡縮率（0x100 が等倍）
**                       ～0x200（50%）～0x100（100%）～0x80（200%）～
**	angle           ...  角度（0x00 ～ 0xff）
**
***********************************************************************/
static void set_bg_affine(s16 ox, s16 oy, s16 cx, s16 cy, u16 xratio, u16 yratio, u8 angle)
{
	wp->dx = (xratio * sin_cos_table[angle + 64]) >> 8;
	wp->dy = (xratio * -(sin_cos_table[angle])) >> 8;
	wp->dmx = (yratio * sin_cos_table[angle]) >> 8;
	wp->dmy = (yratio * sin_cos_table[angle + 64]) >> 8;
	wp->bg2x = (ox<<8) + (cx << 8) - (cy * wp->dmx + cx * wp->dx);
	wp->bg2y = (oy<<8) + (cy << 8) - (cy * wp->dmy + cx * wp->dy);
	wp->bgscr_req = 1;
}
/***************************************************************
**	計算省略スクロール                                        **
***************************************************************/
static void zoom_bg_scroll(s16 ox, s16 oy)
{
	wp->bg2x = (ox << 8) + (ZOOM_CX<<8) - (ZOOM_CX * 0x80);
	wp->bg2y = (oy << 8) + (ZOOM_CY<<8) - (ZOOM_CY * 0x80);
	wp->bgscr_req = 1;
}
// V Blank 中に呼ぶ
void TownMapScroll(void)
{
	if(wp->bgscr_req){
		*(vs16*)REG_BG2PA = wp->dx;
		*(vs16*)REG_BG2PB = wp->dmx;
		*(vs16*)REG_BG2PC = wp->dy;
		*(vs16*)REG_BG2PD = wp->dmy;
		*(vu32*)REG_BG2X = wp->bg2x;
		*(vu32*)REG_BG2Y = wp->bg2y;
		wp->bgscr_req = 0;
	}
}
/***********************************************************************
**	地図ＢＧの表示オフセットを変える
**
**	work	ワーク領域として使用してよいアドレス
**	mode	初期表示モード（enum TOWNMAP_MODE）
**
***********************************************************************/
void TownMap_SetOfs(s16 xofs, s16 yofs)
{
	set_bg_affine(xofs, yofs, ZOOM_CX, ZOOM_CY, 0x100, 0x100, 0);
	TownMapScroll();
	if(wp->jiki_actor != NULL){
		wp->jiki_actor->dx = -xofs;
		wp->jiki_actor->dy = -yofs;
	}
}

/***************************************************************
**	ブロック座標からマップナンバーを返す                      **
***************************************************************/
static u16 pos_to_mapno(u16 x, u16 y)
{
	if(y < BLOCK_YMIN || y > BLOCK_YMAX ||
	   x < BLOCK_XMIN || x > BLOCK_XMAX)
	{
		return MAPPOS_END;
	}

	y -= BLOCK_YMIN;
	x -= BLOCK_XMIN;

	return PosToMapNoTbl[y][x];
}
/***************************************************************
**	マップナンバ、カーソル＆自機表示位置を計算                **
***************************************************************/
static void set_mapno_ship(void);
static void set_mapno_and_pos(void)
{
	const MapTotalData *mapdata;
	u16 Xsize, Ysize, Xpos, Ypos, FldX, unit;
	u8 map_type;

	// 高速船内部
	if(Fld.MapID.div_id == SP)
	{
		if(Fld.MapID.map_id == SP_SHIP01
		|| Fld.MapID.map_id == SP_SHIP02
		|| Fld.MapID.map_id == SP_SHIP03
		){
			set_mapno_ship();
			return;
		}
	}

	map_type = GetMapTypeByID(Fld.MapID.div_id, Fld.MapID.map_id);

	switch(map_type){
	case MAPTYPE_TOWN:
	case MAPTYPE_CITY:
	case MAPTYPE_ROAD:
	case MAPTYPE_WATER:
	case MAPTYPE_SEA:
	default:
		wp->mapno = NowMap.WorldPos;
		wp->jiki_tenmetsu_ok = 0;
		Xsize = NowMap.Screen->Xsize;
		Ysize = NowMap.Screen->Ysize;
		Xpos = Fld.MapXpos;
		Ypos = Fld.MapYpos;

		if(wp->mapno == MAPPOS_D_HUSHIGI2)
		{
			wp->jiki_tenmetsu_ok = 1;  // 洞窟の真下なので
		}
		break;

	case MAPTYPE_CAVE:
	case MAPTYPE_ICE:
		mapdata = GetTotalMapData(Fld.EscMapID.div_id, Fld.EscMapID.map_id);

		wp->mapno = mapdata->WorldPos;
		wp->jiki_tenmetsu_ok = 1;
		Xsize = mapdata->Screen->Xsize;
		Ysize = mapdata->Screen->Ysize;
		Xpos =  Fld.EscMapID.x;
		Ypos =  Fld.EscMapID.y;
		break;

	case MAPTYPE_BASE:
		mapdata = GetTotalMapData(Fld.SpMapID.div_id, Fld.SpMapID.map_id);

		wp->mapno = mapdata->WorldPos;
		wp->jiki_tenmetsu_ok = 1;
		Xsize = mapdata->Screen->Xsize;
		Ysize = mapdata->Screen->Ysize;
		Xpos =  Fld.SpMapID.x;
		Ypos =  Fld.SpMapID.y;
		break;

	case MAPTYPE_ROOM:
		{
			MapID *map_id;
			wp->mapno = NowMap.WorldPos;

			if(wp->mapno != MAPPOS_SP_POS){
				map_id = &(Fld.EscMapID);
				mapdata = GetTotalMapData(map_id->div_id, map_id->map_id);
	//			mapdata = GetTotalMapData(Fld.EscMapID.div_id, Fld.EscMapID.map_id);
			}else{
				map_id = &(Fld.SpMapID);
				mapdata = GetTotalMapData(map_id->div_id, map_id->map_id);
				wp->mapno = mapdata->WorldPos;
	//			mapdata = GetTotalMapData(Fld.EscMapID.div_id, Fld.EscMapID.map_id);
			}

			


			wp->jiki_tenmetsu_ok = 0;
			Xsize = mapdata->Screen->Xsize;
			Ysize = mapdata->Screen->Ysize;
	//		Xpos =  Fld.EscMapID.x;
	//		Ypos =  Fld.EscMapID.y;
			Xpos =  map_id->x;
			Ypos =  map_id->y;
		}
		break;
	}

	FldX = Xpos;
	unit = Xsize / MapPositionData[wp->mapno].width;
	if(unit==0){ unit = 1; }  // 念のため
	Xpos /= unit;
	if(Xpos >= MapPositionData[wp->mapno].width){
		Xpos = MapPositionData[wp->mapno].width - 1;
	}

	unit = Ysize / MapPositionData[wp->mapno].height;
	if(unit==0){ unit = 1; }  // 念のため
	Ypos /= unit;
	if(Ypos >= MapPositionData[wp->mapno].height){
		Ypos = MapPositionData[wp->mapno].height - 1;
	}

	// 特殊な形状をしている場所は計算誤差を補正する
	switch(wp->mapno){
	case MAPPOS_R_114:
		if(Ypos != 0){ Xpos = 0; }
		break;

	// ルネシティに重ならないように
	case MAPPOS_R_126:
	case MAPPOS_W_126:
		Xpos = 0;
		if(Fld.MapXpos > 32){
			Xpos++;
		}
		if(Fld.MapXpos > 51){
			Xpos++;
		}

		Ypos = 0;
		if(Fld.MapYpos > 37){
			Ypos++;
		}
		if(Fld.MapYpos > 56){
			Ypos++;
		}
		break;

	// R122と繋がっているように見せる
	case MAPPOS_R_121:
		Xpos = 0;
		if(FldX > 14){ Xpos++; }
		if(FldX > 28){ Xpos++; }
		if(FldX > 54){ Xpos++; }
		break;
	}

	wp->cursor_x = MapPositionData[wp->mapno].x + Xpos + BLOCK_XMIN;
	wp->cursor_y = MapPositionData[wp->mapno].y + Ypos + BLOCK_YMIN;
}
/***************************************************************
**	高速船内部でのマップナンバ、カーソル＆自機表示位置を計算  **
***************************************************************/
static void set_mapno_ship(void)
{
	s16 x, y;
	u16 Xpos, Ypos, unit;
	u8  div_id, map_id, state;

	Xpos = Ypos = 0;
	state = GetShipWorldPos(&div_id,&map_id,&x,&y);
	switch(state){
	case SHIPPOS_KAINA_STOP:
		wp->mapno = MAPPOS_C_102;
		break;

	case SHIPPOS_MINAMO_STOP:
		wp->mapno = MAPPOS_C_106;
		break;

	case SHIPPOS_R124:
		wp->mapno = MAPPOS_R_124;
		break;
	case SHIPPOS_R131:
		wp->mapno = MAPPOS_R_131;
		break;

	default:
	case SHIPPOS_DEMO:
		{
			const MapTotalData *mapdata;

			mapdata = GetTotalMapData(div_id,map_id);
			wp->mapno = mapdata->WorldPos;

			unit = mapdata->Screen->Xsize / MapPositionData[wp->mapno].width;
			if(unit == 0){ unit = 1; }
			Xpos = x / unit;
			if(Xpos >= MapPositionData[wp->mapno].width){
				Xpos = MapPositionData[wp->mapno].width - 1;
			}

			unit = mapdata->Screen->Ysize / MapPositionData[wp->mapno].height;
			if(unit==0){ unit = 1; }  // 念のため
			Ypos = y / unit;
			if(Ypos >= MapPositionData[wp->mapno].height){
				Ypos = MapPositionData[wp->mapno].height - 1;
			}
		}
		break;
	}

	wp->jiki_tenmetsu_ok = 0;

	wp->cursor_x = MapPositionData[wp->mapno].x + Xpos + BLOCK_XMIN;
	wp->cursor_y = MapPositionData[wp->mapno].y + Ypos + BLOCK_YMIN;

}
/***************************************************************
**	マップナンバーからカーソル状態を返す                      **
***************************************************************/
static u8 mapno_to_state(u16 mapno)
{
	switch(mapno){
	case MAPPOS_END: return MAPCURSOR_SPACE;
	case MAPPOS_T_101: return (EventFlagCheck(SYS_T101_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_T_102: return (EventFlagCheck(SYS_T102_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_T_103: return (EventFlagCheck(SYS_T103_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_T_104: return (EventFlagCheck(SYS_T104_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_T_105: return (EventFlagCheck(SYS_T105_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_T_106: return (EventFlagCheck(SYS_T106_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_T_107: return (EventFlagCheck(SYS_T107_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_C_101: return (EventFlagCheck(SYS_C101_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_C_102: return (EventFlagCheck(SYS_C102_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_C_103: return (EventFlagCheck(SYS_C103_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_C_104: return (EventFlagCheck(SYS_C104_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_C_105: return (EventFlagCheck(SYS_C105_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_C_106: return (EventFlagCheck(SYS_C106_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_C_107: return (EventFlagCheck(SYS_C107_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_C_108: return (EventFlagCheck(SYS_C108_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_C_109: return (EventFlagCheck(SYS_C109_ARRIVE))? MAPCURSOR_ARRIVE : MAPCURSOR_NOARRIVE;
	case MAPPOS_D_BATTLE: return (EventFlagCheck(SYS_ARRIVE_BATTLETOWER))? MAPCURSOR_FLYING : MAPCURSOR_SPACE;

//  みなみのことうに飛べなくする
//	case MAPPOS_D_KOKORO: return (EventFlagCheck(SYS_ARRIVE_ISLAND))? MAPCURSOR_FLYING : MAPCURSOR_SPACE;
	case MAPPOS_D_KOKORO: return (EventFlagCheck(SYS_ARRIVE_ISLAND))? MAPCURSOR_ROAD : MAPCURSOR_SPACE;

	default: return MAPCURSOR_ROAD;
	}
}
/*********************************************************************
**	ブロック座標から、マップナンバーを返す
**
**	引数    x, y   ブロック座標（ＢＧキャラブロックと同じ）
**
*********************************************************************/
u16 TownMap_BlockToWPos(u16 x, u16 y)
{
	return pos_to_mapno(x, y);
}
/*********************************************************************
**	'すいちゅう'など、そのままでポケナビのマップに表示できない
**   特殊なマップナンバーを、地上のナンバーにして返す
*********************************************************************/
static u16 change_ex_mapno(u16 mapno)
{
	static const u16 ex_mapno[][2] = {
		// 海中,          地上
		{  MAPPOS_W_124,  MAPPOS_R_124 },
		{  MAPPOS_W_126,  MAPPOS_R_126 },
		{  MAPPOS_W_127,  MAPPOS_R_127 },
		{  MAPPOS_W_128,  MAPPOS_R_128 },
		{  MAPPOS_W_RUNE, MAPPOS_C_108 },
		{  MAPPOS_D_HUSHIGI2, MAPPOS_R_128 },
		{  MAPPOS_D_AGITO, MAPPOS_C_106 },
		{  MAPPOS_D_OFURE2, MAPPOS_R_134 },
		{  MAPPOS_D_TOUKA,   MAPPOS_R_104 },
		{  MAPPOS_D_DEKOBOKO, MAPPOS_R_112 },
		{  MAPPOS_D_OKURIBI,  MAPPOS_R_122 },
		{  MAPPOS_D_TOWER,    MAPPOS_R_131 },

		{  MAPPOS_END, MAPPOS_END },  // 終端
	};
	u16 i;

	for(i = 0; ex_mapno[i][0] != MAPPOS_END; i++)
	{
		if(ex_mapno[i][0] == mapno) return ex_mapno[i][1];
	}
	return mapno;
}
/*********************************************************************
**	海底エンカウント時のマップナンバーを、地上のナンバーにして返す
*********************************************************************/
u16  ChangeMarineToGroundMapNo(u16 mapno)
{
	return change_ex_mapno(mapno);
}

/*====================================================================*/
/*  サブマップナンバーの計算                                          */
/*  ※ サブマップナンバー                                             */
/*  同マップナンバー（ロード１１４など）であるブロックのうち、        */
/*  何番目のブロックにあたるか。ブロックの通し番号は、左上から        */
/*  同ライン内にあるブロックに順番に数値が振られ、そのラインに        */
/*  同マップナンバーがなくなれば次のライン、というように計算する。    */
/*                                                                    */
/*  例）  ■■    ←こういう形の道路が        ０１                    */
/*      ■■        あったら、サブマップ    ２３                      */
/*        ■        ナンバーはこうなる→      ４                      */
/*                                                                    */
/*====================================================================*/
static u8 check_submap_beforeline(u16 y);

/*====================================================*/
/*	メイン                                            */
/*====================================================*/
static void calc_submap_no(void)
{
	u16 x, y, no;

	if(wp->mapno == MAPPOS_END){
		wp->map_subno = 0;
		return;
	}

	if(wp->mode == TOWNMAP_WHOLE){
		x = wp->cursor_x;
		y = wp->cursor_y;
	}else{
		x = wp->zoom_x;
		y = wp->zoom_y;
	}

	no = 0;

	while(1){
		while(x > BLOCK_XMIN){
			if(pos_to_mapno(--x, y) == wp->mapno){
				no++;
			}
		}
		if(!check_submap_beforeline(y)){ break; }
		y--;
		x = BLOCK_XMAX+1;

	}

	wp->map_subno = no;
}
/*====================================================*/
/*	１つ上の行に、同マップナンバーのブロックがあるか  */
/*	y   現在の行                                      */
/*====================================================*/
static u8 check_submap_beforeline(u16 y)
{
	u16 x;

	if(!y--){ return 0; }

	for(x = BLOCK_XMIN; x <= BLOCK_XMAX; x++){
		if(pos_to_mapno(x, y) == wp->mapno){ return 1; }
	}
	return 0;
}


/*===================================================================*/
/*  カーソルアクターデータ                                           */
/*===================================================================*/
static const ActOamData CursorOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	1,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	1,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actAnm CursorAnmWhole[]={
	{ OBJ16_16x16 * 0, 20, 0, 0, },
	{ OBJ16_16x16 * 1, 20, 0, 0, },
	{ ACT_ANMLOOP, 0, 0, 0 },
};
static const actAnm CursorAnmZoom[]={
	{ OBJ16_32x32 * 0, 10, 0, 0, },
	{ OBJ16_32x32 * 1, 10, 0, 0, },
	{ OBJ16_32x32 * 2, 10, 0, 0, },
	{ OBJ16_32x32 * 1, 10, 0, 0, },
	{ ACT_ANMLOOP, 0, 0, 0 },
};
static const actAnm *const CursorAnmTbl[]={
	CursorAnmWhole,
	CursorAnmZoom,
};
enum CURSOR_WORK {
	CWK_COUNT,
	CWK_COLOR,
	CWK_PALNUM,
	CWK_PALANM_ON,
};
/*******************************************************
**  デフォルトカーソル（全体表示時）の動作関数        **
*******************************************************/
static void cursor_actmove_whole(actWork *act)
{
/*
	if(FadeData.fade_sw == 0 && act->work[CWK_PALANM_ON]){
		act->work[CWK_COLOR] = sin_cos_table[act->work[CWK_COUNT]];
		act->work[CWK_COLOR] = 2 + (act->work[CWK_COLOR] >> 5) + ((act->work[CWK_COLOR] & 0x80)!=0);

		PaletteWork[act->work[CWK_PALNUM]] = cursor_Palette[act->work[CWK_COLOR]];
		PaletteWorkTrans[act->work[CWK_PALNUM]] = cursor_Palette[act->work[CWK_COLOR]];
		act->work[CWK_COUNT] += 2;
		act->work[CWK_COUNT] &= 0x7f;
	}
*/
	if(wp->cursor_move_cnt){
		act->x += wp->cursor_ax * 2;
		act->y += wp->cursor_ay * 2;
		wp->cursor_move_cnt--;
	}
}
/*******************************************************
**  デフォルトカーソル（拡大表示時）の動作関数        **
*******************************************************/
static void cursor_actmove_zoom(actWork *act)
{
/*
	if(FadeData.fade_sw == 0 && act->work[CWK_PALANM_ON]){
		act->work[CWK_COLOR] = sin_cos_table[act->work[CWK_COUNT]];
		act->work[CWK_COLOR] = 2 + (act->work[CWK_COLOR] >> 5) + ((act->work[CWK_COLOR] & 0x80)!=0);

		PaletteWork[act->work[CWK_PALNUM]] = cursor_Palette[act->work[CWK_COLOR]];
		PaletteWorkTrans[act->work[CWK_PALNUM]] = cursor_Palette[act->work[CWK_COLOR]];
		act->work[CWK_COUNT] += 2;
		act->work[CWK_COUNT] &= 0x7f;
	}
*/
}
/***********************************************************************
**	デフォルトのカーソル画像をアクター登録する
**
**	cell_id   登録に使ってよいセルＩＤ
**	pal_id    登録に使ってよいパレットＩＤ
**
***********************************************************************/
void TownMapAddCursor(u16 cell_id, u16 pal_id)
{
	CellData cell;
	PalData pal = { cursor_Palette, 0 };
	actHeader header = {
		0,
		0,
		&CursorOam,
		CursorAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		cursor_actmove_whole,
	};
	u16 no;

	cell.act_num = cell_id;
	header.cellNo = cell_id;
	wp->cursor_cell_id = cell_id;
	pal.reg_num = pal_id;
	header.palNo = pal_id;
	wp->cursor_pal_id = pal_id;

	if(wp->mode == TOWNMAP_WHOLE){
		cell.ch_data = wp->cursor_cell;
		cell.size = CURSOR_CELL_SIZE;
		header.moveData_p = cursor_actmove_whole;
	}else{
		cell.ch_data = wp->zcursor_cell;
		cell.size = ZCURSOR_CELL_SIZE;
		header.moveData_p = cursor_actmove_zoom;
	}

	CellSet(&cell);
	ObjPalSet(&pal);

	no = AddActor(&header, ZOOM_CX, ZOOM_CY, 0);
	if(no != ACT_MAX){
		wp->cursor_actor = &ActWork[no];

		if(wp->mode == TOWNMAP_ZOOM){
			wp->cursor_actor->oamData.Size = 2;
			wp->cursor_actor->x -= 8;
			wp->cursor_actor->y -= 8;
			ActAnmChg(wp->cursor_actor, 1);
		}else{
			wp->cursor_actor->oamData.Size = 1;
			wp->cursor_actor->x = BLOCK_TO_POS(wp->cursor_x);
			wp->cursor_actor->y = BLOCK_TO_POS(wp->cursor_y);
		}

		wp->cursor_actor->work[CWK_COLOR] = 2;
		wp->cursor_actor->work[CWK_PALNUM] = 256 + (ObjPalNumGet(pal_id) * 16) + 1;
		wp->cursor_actor->work[CWK_PALANM_ON] = 1;
	}
}
/***********************************************************************
**	デフォルトのカーソル画像を削除する
***********************************************************************/
void TownMapDelCursor(void)
{
	if(wp->cursor_actor != NULL){
		DelActor(wp->cursor_actor);
		CellDel(wp->cursor_cell_id);
		ObjPalRegNumDel(wp->cursor_pal_id);
	}
}
/***********************************************************************
**  カーソルのパレットアニメ操作
***********************************************************************/
void TownMap_CursorAnmStart(void)
{
	wp->cursor_actor->work[CWK_PALANM_ON] = 1;
}
void TownMap_CursorAnmStop(void)
{
	wp->cursor_actor->work[CWK_PALANM_ON] = 0;
}

/*===================================================================*/
/*  自機アクター                                                     */
/*===================================================================*/
static const ActOamData JikiOam;
static const actAnm *const JikiAnmTbl[];
static void jiki_actmove_zoom(actWork *act);
static void jiki_actmove_whole(actWork *act);

void TownMapAddJiki(u16 cell_id, u16 pal_id)
{
	CellData cell = { jiki_Character, sizeof(jiki_Character), cell_id };
	PalData pal = { jiki_Palette, pal_id };
	actHeader header = {
		cell_id,
		pal_id,
		&JikiOam,
		JikiAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		DummyActMove,
	};
	u16 no;

	if(MyData.my_sex == FEMALE){
		cell.ch_data = heroine_Character;
		pal.pal_data = heroine_Palette;
	}

	CellSet(&cell);
	ObjPalSet(&pal);

	no = AddActor(&header, 0, 0, 1);
	wp->jiki_actor = &ActWork[no];

	if(wp->mode == TOWNMAP_WHOLE){
		wp->jiki_actor->x = BLOCK_TO_POS(wp->jiki_x);
		wp->jiki_actor->y = BLOCK_TO_POS(wp->jiki_y);
		wp->jiki_actor->move = jiki_actmove_whole;
	}else{
		wp->jiki_actor->x = ((wp->jiki_x - 1) * 16 - 32);
		wp->jiki_actor->y = ((wp->jiki_y - 1) * 16 - 50);
		wp->jiki_actor->move = jiki_actmove_zoom;
	}
}
/***********************************************
**	動作を変更
***********************************************/
static void jiki_modechange_init(void)
{
	if(wp->jiki_actor != NULL){
		wp->jiki_actor->banish = 1;
		wp->jiki_actor->move = DummyActMove; // 何もしない
	}
}
static void jiki_modechange_finish(void)
{
	if(wp->jiki_actor != NULL){
		if(wp->mode == TOWNMAP_ZOOM){
			wp->jiki_actor->x = ((wp->jiki_x - 1) * 16 - 32);
			wp->jiki_actor->y = ((wp->jiki_y - 1) * 16 - 50);

			wp->jiki_actor->move = jiki_actmove_zoom;
			wp->jiki_actor->banish = 0;
		}else{
			wp->jiki_actor->x = BLOCK_TO_POS(wp->jiki_x);
			wp->jiki_actor->y = BLOCK_TO_POS(wp->jiki_y);
			wp->jiki_actor->dx = 0;
			wp->jiki_actor->dy = 0;
			wp->jiki_actor->move = jiki_actmove_whole;
			wp->jiki_actor->banish = 0;
		}
	}
}
/***********************************************
**	動作関数
***********************************************/
static void jiki_tenmetsu(actWork *act);

static void jiki_actmove_zoom(actWork *act)
{
	act->dx = -(wp->map_ox * 2);
	act->dy = -(wp->map_oy * 2);
	act->work[0] = act->y + act->dy + act->cy;
	act->work[1] = act->x + act->dx + act->cx;

	if(act->work[0] < -8 || act->work[0] > 168 ||
	   act->work[1] < -8 || act->work[1] > 248
	)
	{
		act->work[2] = 0;   // 表示位置外
	}else{
		act->work[2] = 1;   // 表示位置内
	}

	if(act->work[2]==1){
		jiki_tenmetsu(act);
	}else{
		act->banish = 1;
	}

}
static void jiki_actmove_whole(actWork *act)
{
	jiki_tenmetsu(act);
}
static void jiki_tenmetsu(actWork *act)
{
	if(wp->jiki_tenmetsu_flg){
		if(++(act->work[7]) > 16)
		{
			act->work[7] = 0;
			act->banish = !(act->banish);
		}
	}else{
		act->banish = 0;
	}
}
/***********************************************
**	正確な座標で表示できないケースなどで
**	自機を点滅させる（マップ切り替え直前位置）
***********************************************/
void TownMap_JikiTenmetsu(void)
{
	if(wp->jiki_tenmetsu_ok)
	{
		wp->jiki_tenmetsu_flg = 1;
	}
}


/***********************************************
**	アクターデータ
***********************************************/
static const ActOamData JikiOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	1,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	2,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actAnm JikiAnm[]={
	{0,5,0,0}, {ACT_ANMEND,0,0,0},
};
static const actAnm *const JikiAnmTbl[]={
	JikiAnm,
};



/*********************************************************************
**
**	地名をバッファにコピー（フィールドでの現在地名表示）
**
**	引数    buf   コピー先バッファ
**          wpos  地区番号
**          size  文字数。指定すると足りない分をスペースで埋める。
**               （つまりバッファサイズは最低 size + 1 必要）
**                この処理が不要なら 0 。
**
**  戻り値  コピー文字列の終端アドレス
**
*********************************************************************/
u8* CopyMapName(u8 *buf, u16 wpos, u16 size)
{
	u8 *cp;

	// ひみつきち
	if(wpos == MAPPOS_BASE_POS){
		cp = MakeBaseName(buf);
	// 通常
	}else if(wpos < MAPPOS_END){
		cp = PM_strcpy(buf, MapPositionData[wpos].name);
	// 無効
	}else{
		if(size == 0){ size = MAPNAME_MAX; }
		return PM_strclear(buf, spc_, size);
	}

	if(size){
		u16 i;
		for(i = (cp - buf); i < size; i++){
			*cp++ = spc_;
		}
		*cp = EOM_;
	}

	return cp;
}
/*********************************************************************
**
**	地名をバッファにコピー（セーブ時ウィンドウ用等）
**
**	引数    buf   コピー先バッファ
**          wpos  地区番号
**
**  戻り値  コピー文字列の終端アドレス
**
*********************************************************************/
u8* ExCopyMapName(u8 *buf, u16 wpos)
{
	switch(wpos){
	case MAPPOS_SP_POS:
		return PM_strcpy(buf,ExMapName_Ship);

	case MAPPOS_BASE_POS:
		return PM_strcpy(buf,ExMapName_Base);

	default:
		return CopyMapName(buf, wpos, 0);
	}
}
/*********************************************************************
**
**	地名をバッファにコピー（ポケモン捕獲場所用）
**
**	引数    buf   コピー先バッファ
**          wpos  地区番号
**
**  戻り値  コピー文字列の終端アドレス
**
*********************************************************************/
u8* StatusMapNameCopy(u8 *buf, u16 wpos)
{
	if(wpos == MAPPOS_D_AGITO){
		return PM_strcpy(buf, ExMapName_Azito);
	}
	return ExCopyMapName(buf, wpos);
}


/***********************************************************************
**	各地域の、地図画面上でのＸＹ座標とサイズを調べる
**
**	mapno   地域ナンバー（MAPPOS_T_101など）
**	x, y, w, h  それぞれＸＹ座標、幅、高さを得る変数へのアドレス
**
***********************************************************************/
void TownMapGetMapPosition(u16 mapno, u16 *x, u16 *y, u16 *w, u16 *h)
{
	*x = MapPositionData[mapno].x;
	*y = MapPositionData[mapno].y;
	*w = MapPositionData[mapno].width;
	*h = MapPositionData[mapno].height;

}

