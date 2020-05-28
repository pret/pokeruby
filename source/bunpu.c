/******************************************************************************/
/* ポケモン分布図表示                                                         */
/*                                                                            */
/*                                                                      taya  */
/******************************************************************************/
#include "common.h"
#include "task.h"
#include "actanm.h"
#include "palanm.h"
#include "intr.h"
#include "calctool.h"
#include "fld_main.h"
#include "fld_tool.h"
#include "fld_eff.h"
#include "print.h"
#include "menutool.h"
#include "f_pmlist.h"
#include "config.h"
#include "mv_poke.h"

#include "bunpu.dat"
#include "ecnt_dat.h"
#include "mapparam.h"
#include "townmap.h"
#include "mappos.def"
#include "sysflag.h"
#include "ev_flag.h"
#include "mus_tool.h"

#include "../evdata/maparray.h"

/***********************************************************************
*   定数                                                               *
***********************************************************************/
#define ENCNT_DATA_MAX    (64)
#define CAVE_ENCNT_MAX   (32)

#define POKENAME_WIN_X1  (16)
#define POKENAME_WIN_X2  (29)
#define POKENAME_WIN_Y1  (0)
#define POKENAME_WIN_Y2  (3)

#define PLACENAME_WIN_X1 (18)
#define PLACENAME_WIN_X2 (29)
#define PLACENAME_WIN_Y1 (15)
#define PLACENAME_WIN_Y2 (18)

#define BUNPU_YOFS  (-8)

#if( PM_VERSION == VERSION_SAPPHIRE )
	#define MOVE_POKENO    MONSNO_RATHIASU
#elif ( PM_VERSION == VERSION_RUBY )
	#define MOVE_POKENO    MONSNO_RATHIOSU
#endif

// このﾃｰﾌﾞﾙにあるﾎﾟｹﾓﾝﾅﾝﾊﾞｰが来たら、分布表示しない
static const u16 IgnorePokeNo[] = {
	MONSNO_SOONANO,
};

// このﾃｰﾌﾞﾙにあるﾎﾟｹﾓﾝﾅﾝﾊﾞｰが来たら、強制ｾｯﾄ
static const u16 KoteiPokeNo[][3] = {
	{ MONSNO_HINBASU,  FIELD, FIELD_R119 },
	{ MONSNO_END,0,0},
};

// このﾃｰﾌﾞﾙにある洞窟は、到達ﾌﾗｸﾞがｵﾌなら表示しない
static const u16 ArriveCheckCave[][2] = {
	{ MAPPOS_D_TOWER,   SYS_ARRIVE_SORANOHASHIRA },
	{ MAPPOS_D_HUSHIGI, SYS_ARRIVE_SUBMARINECAVE },
	{ MAPPOS_END,0},
};


enum PALID {
	PALID_CURSOR,
	PALID_JIKI,
	PALID_CAVE,
	PALID_FUMEI,
};

enum CELLID {
	CELLID_CURSOR,
	CELLID_JIKI,
	CELLID_CAVE,
	CELLID_FUMEI,
};

/***********************************************************************
*   構造体定義                                                         *
***********************************************************************/
/*------------------------------------*/
/* エンカウントデータ                 */
/*------------------------------------*/
typedef struct {
	u8  div_id;
	u8  map_id;
	u16 mapno;
}ENCNT_DATA;

/***********************************************************************
*  グローバル変数                                                      *
***********************************************************************/
extern const MAPENCOUNT EncountTbl[];
extern const u8 PokeNameData[][6];

/***********************************************************************
*  ワーク領域                                                          *
***********************************************************************/
typedef struct {
	pFunc  sub;
	pFunc  return_func;
	pFunc  return_func2;
	u16   prog;
	u16   pokeno;

	ENCNT_DATA  encnt_tbl[ENCNT_DATA_MAX];
	u16  road_encnt_cnt;
	u16  cave_encnt_cnt;

	u16 bg_init_seq;
	u16 bunpu_bg_map[32*20];
	u16 bunpu_fade_wait;
	u16 bunpu_fade_pos;
	u16 eva_pos, evb_pos;
	u8  bunpu_fade_mode;
	u8  bunpu_fade_banish;

	u16  cave_encnt_pos[CAVE_ENCNT_MAX];
	actWork *cave_encnt_actor[CAVE_ENCNT_MAX];
	u16  cave_encnt_actcnt;

	u8    *ret_flg;
	TOWNMAP_WORK  mapwk;

	u8 noarrive_mapname[32];
	u8 pokename_buf[32];

	actWork *fumei_actor[3];
	u8  fumei_cell[0x20*48];  // 

}BUNPU_WORK;
static BUNPU_WORK * const Work = (BUNPU_WORK*)UserWork;

/***********************************************************************
*  プロトタイプ                                                        *
***********************************************************************/
static void bunpu_init_proc(void);
static void bunpu_main(void);
static void bunpu_v_intr(void);
static void change_sub(pFunc sub);

static void init_bunpu_bg_begin(void);
static u8   init_bunpu_bg(void);
static void init_bunpu_fade(void);
static void update_bunpu_fade(void);
static void add_bunpu_actor(void);
static void del_bunpu_actor(void);

static void make_fumei_cell(void);
static void add_fumei_actor(void);

//static void write_placename(void);

/*---------------------------------*/
/*  サブプロセス                   */
/*---------------------------------*/
static void sub_fadein(void);
static void sub_area_select(void);
static void sub_fadeout(void);
static void sub_fadeout2(void);

/*======================================================================
==	分布図初期化
==	pokeno    ポケモンナンバー
==	ret_func  復帰関数アドレス
======================================================================*/
void BunpuzuInit(u16 pokeno, pFunc ret_func, pFunc ret_func2)
{
	Work->return_func = ret_func;
	Work->return_func2 = ret_func2;
	Work->pokeno = pokeno;

	MainProcChange(bunpu_init_proc);
}
/*====================================================*/
/*  分布図初期化ｼｰｹﾝｽ                                 */
/*====================================================*/
static void bunpu_init_proc(void)
{
	switch(sys.InitSeqWork){
	case 0:
		SetVBlankFunc(NULL);
#if 0
		*(vu16 *)REG_DISPCNT = 0;
#else
		*(vu16 *)REG_DISPCNT = DISP_MODE_0|DISP_BG1_ON|DISP_WIN01_ON;
#endif

		PaletteAnimeInit();
		InitActor();
		InitTask();
		CellManAllInit();
		ObjPalManInit();

		*(vu16 *)REG_BG0HOFS = 0;
		*(vu16 *)REG_BG0VOFS = BUNPU_YOFS;
//		*(vu16 *)REG_BG1HOFS = 0;	//変更 TETSU
//		*(vu16 *)REG_BG1VOFS = 0;	//変更 TETSU
		*(vu16 *)REG_BG2VOFS = 0;
		*(vu16 *)REG_BG2HOFS = 0;
		*(vu16 *)REG_BG3HOFS = 0;
		*(vu16 *)REG_BG3VOFS = 0;

		

		break;

	case 1:
		TownMapInit(&(Work->mapwk), TOWNMAP_WHOLE);
		PM_strclear(Work->noarrive_mapname, spc_, MAPNAME_WIDTH);
//		TownMapAddCursor(CELLID_CURSOR, PALID_CURSOR);
//		TownMap_CursorAnmStop();
		break;

	case 2:
		init_bunpu_bg_begin();
		break;

	case 3:
		if(init_bunpu_bg()){
			return;
		}
		break;

	case 4:
		TownMapAddJiki(CELLID_JIKI, PALID_JIKI);
		TownMap_SetOfs(0, BUNPU_YOFS);
		SetVBlankFunc(bunpu_v_intr);
		break;

	case 5:
#if 0
		PaletteFadeReq(0xffffffff, 0, 16, 0, 0x0000);
#else
		PaletteFadeReq(0xffffffeb, 0, 16, 0, 0x0000);	//変更 TETSU
#endif
		break;

	case 6:
#if 1
		*(vu16 *)REG_BLDCNT = BLD_BG0_1ST | BLD_A_BLEND_MODE | BLD_2ND_ALL;
#else
//		*(vu16 *)REG_BLDCNT = BLD_BG0_1ST | BLD_A_BLEND_MODE | BLD_2ND_ALL;	//変更 TETSU
#endif
		init_bunpu_fade();

		*(vu16 *)REG_DISPCNT = DISP_MODE_1 | DISP_OBJ_CHAR_1D_MAP 
		| DISP_BG0_ON
		| DISP_BG1_ON		//メニュー（図鑑から継続）
		| DISP_BG2_ON
		| DISP_WIN01_ON
		| DISP_OBJ_ON
		;

		break;

	case 7:
		change_sub(sub_fadein);
		MainProcChange(bunpu_main);
		return;
	}

	sys.InitSeqWork++;
}
/*============================================================*/
/*	V Blank                                                   */
/*============================================================*/
static void bunpu_v_intr(void)
{
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
}
/*============================================================*/
/*	メインプロセス                                            */
/*============================================================*/
static void bunpu_main(void)
{
	(*(Work->sub))();
	update_bunpu_fade();
	JumpActor();
	SetActor();
	PaletteAnime();
}
/*============================================================*/
/*	サブプロセス切り替え                                      */
/*  sub  切り替えるサブプロセス                               */
/*============================================================*/
static void change_sub(pFunc sub)
{
	Work->sub = sub;
	Work->prog = 0;
}

/*============================================================*/
/*	地域名用ウィンドウを描画                                  */
/*============================================================*/
/*
static void init_placename_win(void)
{
	NMenuWinBoxWrite(PLACENAME_WIN_X1, PLACENAME_WIN_Y1, PLACENAME_WIN_X2, PLACENAME_WIN_Y2);
	write_placename();
}
*/
/*============================================================*/
/*	地域名用ウィンドウを更新                                  */
/*============================================================*/
/*
static void write_placename(void)
{
	if(Work->mapwk.cursor_state != MAPCURSOR_NOARRIVE){
		NMenuMsgWrite(Work->mapwk.mapname, PLACENAME_WIN_X1+1, PLACENAME_WIN_Y1+1);
	}else{
		NMenuMsgWrite(Work->noarrive_mapname, PLACENAME_WIN_X1+1, PLACENAME_WIN_Y1+1);
	}
}
*/
/******************************************************************************/
/*                                                                            */
/*  分布ＢＧ                                                                  */
/*                                                                            */
/******************************************************************************/
#define MAP_ADDR(b)   (BG_VRAM + (b) * 0x800)
#define CHAR_ADDR(b)  (BG_VRAM + (b) * 0x4000)

#define BUNPU_MAP_BLOCK  (30)
#define BUNPU_CHAR_BLOCK (3)
#define BUNPU_MAP_ADDR   MAP_ADDR(BUNPU_MAP_BLOCK)
#define BUNPU_CHAR_ADDR  CHAR_ADDR(BUNPU_CHAR_BLOCK)

#define BUNPU_PAL    (PA_BG0)
#define BUNPU_PALNO  (0)

static void make_encnt_tbl(u16 pokeno);
static void make_bunpu_map(void);

/*============================================================*/
/*	初期化                                                    */
/*	pokeno   分布図を表示するポケモンナンバー                 */
/*============================================================*/
static void init_bunpu_bg_begin(void)
{
	Work->bg_init_seq = 0;
}
static u8 init_bunpu_bg(void)
{
	switch(Work->bg_init_seq){
	case 0:
		make_encnt_tbl(Work->pokeno);
		break;

	case 1:
		make_bunpu_map();
		break;

	case 2:
		LZ77UnCompVram(bunpu_Character, (void*)BUNPU_CHAR_ADDR);
		break;

	case 3:
		DmaArrayCopy(3, Work->bunpu_bg_map, BUNPU_MAP_ADDR, 16);
		break;

	case 4:
		PaletteWorkSet(bunpu_Palette, BUNPU_PAL, 0x20);
		break;

	case 5:
		*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_1
		| BUNPU_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| BUNPU_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;
		Work->bg_init_seq++;
		return 0;

	default:
		return 0;
	}

	Work->bg_init_seq++;
	return 1;
}



/*============================================================*/
/*	エンカウントデータテーブルを作成                          */
/*	pokeno  ポケモンナンバー                                  */
/*============================================================*/
static u8 check_mapencnt_poke(const MAPENCOUNT *mapencnt, u16 pokeno);
static u8 check_encnt_poke(const ENCOUNTDATA *encnt, u16 pokeno, u16 max);
static void add_fierd_encnt_data(u16 div_id, u16 map_id);
static void add_cave_encnt_data(u16 div_id, u16 map_id);


static void make_encnt_tbl(u16 pokeno)
{
	// 通常ポケモン
	if(pokeno != MOVE_POKENO){
		u16 i;

		Work->road_encnt_cnt = 0;
		Work->cave_encnt_cnt = 0;

		for(i = 0; i < NELEMS(IgnorePokeNo); i++)
		{
			if(IgnorePokeNo[i] == pokeno){ return; }
		}

		for(i = 0; KoteiPokeNo[i][0] != MONSNO_END; i++)
		{
			if(pokeno==KoteiPokeNo[i][0])
			{
				switch(KoteiPokeNo[i][1]){
				case FIELD:
					add_fierd_encnt_data(KoteiPokeNo[i][1],KoteiPokeNo[i][2]);
					break;
				case PARK:
				case CAVE:
					add_cave_encnt_data(KoteiPokeNo[i][1],KoteiPokeNo[i][2]);
					break;
				}
			}
			
		}

		for(i = 0; EncountTbl[i].div_id != ENCOUNT_DATA_MAX; i++){
			if(check_mapencnt_poke(&EncountTbl[i], pokeno)){
				switch(EncountTbl[i].div_id){
				case FIELD:
					add_fierd_encnt_data(EncountTbl[i].div_id, EncountTbl[i].map_id);
					break;

				case PARK:
				case CAVE:
					add_cave_encnt_data(EncountTbl[i].div_id, EncountTbl[i].map_id);
					break;
				}
			}
		}
	// 移動ポケモン
	}else{
		const MapTotalData *map;

		Work->cave_encnt_cnt = 0;

		if(MvPokeData->encount){
			MvPokeNowPosGet(&(Work->encnt_tbl[0].div_id), &(Work->encnt_tbl[0].map_id));
			map = GetTotalMapData(Work->encnt_tbl[0].div_id, Work->encnt_tbl[0].map_id);
			Work->encnt_tbl[0].mapno = map->WorldPos;

			Work->road_encnt_cnt = 1;
		}else{
			Work->road_encnt_cnt = 0;
		}
	}
}
// ﾌｨｰﾙﾄﾞのｴﾝｶｳﾝﾄﾃﾞｰﾀ１件登録
static void add_fierd_encnt_data(u16 div_id, u16 map_id)
{
	const MapTotalData *map;

	if(Work->road_encnt_cnt < ENCNT_DATA_MAX){
		Work->encnt_tbl[Work->road_encnt_cnt].div_id = div_id;
		Work->encnt_tbl[Work->road_encnt_cnt].map_id = map_id;
		map = GetTotalMapData(div_id, map_id);
		Work->encnt_tbl[Work->road_encnt_cnt].mapno = ChangeMarineToGroundMapNo(map->WorldPos);
		Work->road_encnt_cnt++;
	}
}
// 洞窟のｴﾝｶｳﾝﾄﾃﾞｰﾀ１件登録
static void add_cave_encnt_data(u16 div_id, u16 map_id)
{
	const MapTotalData *map;
	u16 i;

	if(Work->cave_encnt_cnt < CAVE_ENCNT_MAX)
	{
		map = GetTotalMapData(div_id, map_id);
		if(map->WorldPos < MAPPOS_END)
		{
			// 到達ﾌﾗｸﾞをﾁｪｯｸ
			for(i = 0; ArriveCheckCave[i][0] != MAPPOS_END; i++)
			{
				if(map->WorldPos == ArriveCheckCave[i][0])
				{
					if(EventFlagCheck(ArriveCheckCave[i][1])==FALSE)
					{
						return;
					}
				}
			}
			for(i = 0; i < Work->cave_encnt_cnt; i++)
			{
				if(Work->cave_encnt_pos[i] == map->WorldPos){
					break;
				}
			}
			if(i == Work->cave_encnt_cnt){
				Work->cave_encnt_pos[i] = map->WorldPos;
				Work->cave_encnt_cnt++;
			}
		}
	}

}
/*============================================================*/
/*	MAPENCOUNT データから、指定されたポケモンが出現するか判定 */
/*	mapencnt  MAPENCOUNTデータ                                */
/*	pokeno    ポケモンナンバー                                */
/*	return:  出現する  1,   出現しない 0                      */
/*============================================================*/
static u8 check_mapencnt_poke(const MAPENCOUNT *mapencnt, u16 pokeno)
{
	if(check_encnt_poke(mapencnt->ground, pokeno, 12)){ return 1; }
	if(check_encnt_poke(mapencnt->water, pokeno, 5)){ return 1; }
	if(check_encnt_poke(mapencnt->fish, pokeno, 12)){ return 1; }
	if(check_encnt_poke(mapencnt->rock, pokeno, 5)){ return 1; }

	return 0;
}
/*============================================================*/
/*	ENCOUNTDATAデータから、指定されたポケモンが出現するか判定 */
/*	encnt     ENCOUNTDATAデータ配列                           */
/*	pokeno    ポケモンナンバー                                */
/*	max       配列数                                          */
/*	return:  出現する  1,   出現しない 0                      */
/*============================================================*/
static u8 check_encnt_poke(const ENCOUNTDATA *encnt, u16 pokeno, u16 max)
{
	u16 i;
	if(encnt != NULL){
		for(i = 0; i < max; i++){
			if(encnt->data[i].pokeNo == pokeno){ return 1; }
		}
	}
	return 0;
}
/*============================================================*/
/*	分布ＢＧのマップデータを作成                              */
/*============================================================*/
#define BUNPU_OFF  (0)     // 分布なし
#define BUNPU_ON   (0xffff)// 分布あり
#define ON_RIGHT   (1)     // 分布ありの左
#define ON_LEFT    (2)     // 分布ありの右
#define ON_DOWN    (4)     // 分布ありの下
#define ON_UP      (8)     // 分布ありの上
#define ON_LU      (16)    // 分布ありの左上
#define ON_LD      (32)    // 分布ありの左下
#define ON_RU      (64)    // 分布ありの右上
#define ON_RD      (128)   // 分布ありの右下

static void make_bunpu_map(void)
{
#if 0
	u16 i, x, y, pos, L, H;
#else
	static u16 i = 0, x = 0, y = 0, pos = 0, L = 0, H = 0;
#endif

	// ゼロクリア
	for(i = 0; i < 32*20; i++){
		Work->bunpu_bg_map[i] = BUNPU_OFF;
	}

	// 分布しているブロックに１をセット
	for(i = 0; i < Work->road_encnt_cnt; i++){
		pos = 0;
		for(y = 0; y < 20; y++){
			for(x = 0; x < 32; x++){
				if(TownMap_BlockToWPos(x, y) == Work->encnt_tbl[i].mapno){
					Work->bunpu_bg_map[pos] = BUNPU_ON;
				}
				pos++;
			}
		}
	}

	// 分布ブロックの周囲に特殊コードを設定
	pos = 0;
	for(y = 0; y < 20; y++){
		for(x = 0; x < 32; x++){
			if(Work->bunpu_bg_map[pos] == BUNPU_ON){
				if(x != 0 && Work->bunpu_bg_map[pos-1] != BUNPU_ON){
					Work->bunpu_bg_map[pos-1] |= ON_LEFT;
				}
				if(x != 31 && Work->bunpu_bg_map[pos+1] != BUNPU_ON){
					Work->bunpu_bg_map[pos+1] |= ON_RIGHT;
				}
				if(y != 0 && Work->bunpu_bg_map[pos-32] != BUNPU_ON){
					Work->bunpu_bg_map[pos-32] |= ON_UP;
				}
				if(y != 19 && Work->bunpu_bg_map[pos+32] != BUNPU_ON){
					Work->bunpu_bg_map[pos+32] |= ON_DOWN;
				}
				if(x != 0 && y != 0 && Work->bunpu_bg_map[pos-33] != BUNPU_ON){
					Work->bunpu_bg_map[pos-33] |= ON_LU;
				}
				if(x != 31 && y != 0 && Work->bunpu_bg_map[pos-31] != BUNPU_ON){
					Work->bunpu_bg_map[pos-31] |= ON_RU;
				}
				if(x != 0 && y != 19 && Work->bunpu_bg_map[pos+31] != BUNPU_ON){
					Work->bunpu_bg_map[pos+31] |= ON_LD;
				}
				if(x != 31 && y != 19 && Work->bunpu_bg_map[pos+33] != BUNPU_ON){
					Work->bunpu_bg_map[pos+33] |= ON_RD;
				}

//				Work->bunpu_bg_map[pos] |= (BUNPU_PALNO << 24);
			}
			pos++;
		}
	}

	// ﾊﾟﾚｯﾄﾅﾝﾊﾞｰをセットしつつ、特殊コード整理
	//  ※画像データの並びとも関係しているので、プログラムだけでは
	//    何をしているのか分からないと思います  TAYA
	for(i = 0; i < 32*20; i++)
	{
		if(Work->bunpu_bg_map[i] == BUNPU_ON)
		{
			Work->bunpu_bg_map[i] = 16;
		}
		else if(Work->bunpu_bg_map[i] != BUNPU_OFF)
		{
			if(Work->bunpu_bg_map[i] & ON_LEFT)
			{
				Work->bunpu_bg_map[i] &= ~(ON_LU | ON_LD);
			}
			if(Work->bunpu_bg_map[i] & ON_RIGHT)
			{
				Work->bunpu_bg_map[i] &= ~(ON_RU | ON_RD);
			}
			if(Work->bunpu_bg_map[i] & ON_UP)
			{
				Work->bunpu_bg_map[i] &= ~(ON_LU | ON_RU);
			}
			if(Work->bunpu_bg_map[i] & ON_DOWN)
			{
				Work->bunpu_bg_map[i] &= ~(ON_LD | ON_RD);
			}

			L = Work->bunpu_bg_map[i] & 0x0f;
			H = Work->bunpu_bg_map[i] & 0xf0;

			if(H==0){ continue; }
			Work->bunpu_bg_map[i] &= 0x0f;

			switch(L){
			case BUNPU_OFF:
				if(H){ Work->bunpu_bg_map[i] += (16+(H>>4)); } break;

			case ON_LEFT:
				if(H){ Work->bunpu_bg_map[i] += (30+(H>>4)); }break;

			case ON_RIGHT:
				if(H){ Work->bunpu_bg_map[i] += (32+(H>>6)); } break;

			case ON_UP:
				if(H){
					u8 mask = 0;
					if(H&ON_RD){ mask |= 1; }
					if(H&ON_LD){ mask |= 2; }
					Work->bunpu_bg_map[i] += (32+mask);
				}
				break;

			case ON_DOWN:
				if(H){
					u8 mask = 0;
					if(H&ON_RU){ mask |= 1; }
					if(H&ON_LU){ mask |= 2; }
					Work->bunpu_bg_map[i] += (33+mask);
				}
				break;

			case ON_LEFT|ON_DOWN:
			case ON_RIGHT|ON_DOWN:
				Work->bunpu_bg_map[i] += 39;
				break;

			case ON_LEFT|ON_UP:
			case ON_RIGHT|ON_UP:
				Work->bunpu_bg_map[i] += 37;
				break;
			
			}

		}
		Work->bunpu_bg_map[i] |= (BUNPU_PALNO<<24);
	}



//	Work->bunpu_bg_map[pos] |= (BUNPU_PALNO << 24);
}

/***********************************************************************
**	分布ＢＧの半透明フェード                                          **
***********************************************************************/
#define BUNPU_FADE_WAIT  (0)
#define BUNPU_FADE_MAX   (15)
#define CAVEACTOR_TENMETSU_WAIT  (12)

/*============================================================*/
/*	分布ＢＧの半透明フェード初期化                            */
/*============================================================*/
static void init_bunpu_fade(void)
{
	if(Work->cave_encnt_cnt != 0 && Work->road_encnt_cnt == 0){
		Work->bunpu_fade_mode = 1;
	}else{
		Work->bunpu_fade_mode = 0;
	}

	Work->bunpu_fade_wait = 0;
	Work->bunpu_fade_pos = 0;
	Work->eva_pos = 0;
	Work->evb_pos = 64;
	Work->bunpu_fade_banish = 1;

	*(vu16 *)REG_BLDCNT = BLD_BG0_1ST | BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16 *)REG_BLDALPHA = 0x1000;
	update_bunpu_fade();
}
/*============================================================*/
/*	分布ＢＧの半透明フェード更新（毎sync）                    */
/*============================================================*/
static void update_bunpu_fade(void)
{
	// ﾛｰﾄﾞｴﾝｶｳﾝﾄ(BG)ﾌｪｰﾄﾞ
	if(Work->bunpu_fade_mode == 0){
		if(Work->bunpu_fade_wait == 0){
			u16 eva, evb;

			Work->bunpu_fade_pos++;
			if(Work->bunpu_fade_pos & 1){
				Work->eva_pos += 4;
				Work->eva_pos &= 127;
			}else{
				Work->evb_pos += 4;
				Work->evb_pos &= 127;
			}

			eva = sin_cos_table[Work->eva_pos] >> 4;
			evb = sin_cos_table[Work->evb_pos] >> 4;

			*(vu16 *)REG_BLDALPHA = (evb << 8) | eva;

			Work->bunpu_fade_wait = BUNPU_FADE_WAIT;

			if(Work->bunpu_fade_pos == 64)
			{
				Work->bunpu_fade_pos = 0;
				if(Work->cave_encnt_cnt){
					Work->bunpu_fade_mode = 1;
				}
			}

		}else{
			Work->bunpu_fade_wait--;
		}

	// 洞窟ｴﾝｶｳﾝﾄ(OBJ)点滅
	}else{
		if(++(Work->bunpu_fade_wait) > CAVEACTOR_TENMETSU_WAIT){
			u16 i;
			Work->bunpu_fade_wait = 0;
			Work->bunpu_fade_banish++;
			for(i = 0; i < Work->cave_encnt_cnt; i++)
			{
				Work->cave_encnt_actor[i]->banish = (Work->bunpu_fade_banish & 1);
			}
			if(Work->bunpu_fade_banish >= 5)
			{
				Work->bunpu_fade_banish = 1;
				if(Work->road_encnt_cnt){
					Work->bunpu_fade_mode = 0;
				}
			}
		}
	}
}

/******************************************************************************/
/*                                                                            */
/*  サブプロセス                                                              */
/*                                                                            */
/******************************************************************************/
/*============================================================*/
/*	フェードイン                                              */
/*============================================================*/
static void sub_fadein(void)
{
	switch(Work->prog){
	case 0:
		Work->prog++;
		break;

	case 1:
		if(!PaletteAnime()){
//		if(FadeData.fade_sw == 0){
	//		TownMap_CursorAnmStart();
			change_sub(sub_area_select);
		}
		break;

	}
}
/***********************************************
**	地域選択                                  **
***********************************************/
static void sub_area_select(void)
{
	switch(Work->prog){
	case 0:
#if 0	//変更 TETSU
		if(sys.Trg & (A_BUTTON|B_BUTTON)){
			change_sub(sub_fadeout);
		}
		break;
#else
		if(sys.Trg & B_BUTTON){
			change_sub(sub_fadeout);
			break;
		}
		if((sys.Trg & R_KEY)||((sys.Trg & R_BUTTON)&&(MyData.key_config == CNT_MD_LR))){
			change_sub(sub_fadeout2);
		}
		break;
#endif


#if 0	// taya ↓よく見たら要らない
		switch(TownMapKeyRead()){
		case MAPKEY_FREE:
		case MAPKEY_WAIT:
			break;

		case MAPKEY_MOVE:
			break;

		case MAPKEY_CHANGE:
//			write_placename();
			break;

		case MAPKEY_DECIDE:
		case MAPKEY_CANCEL:
			change_sub(sub_fadeout);
			break;
		}
#endif
	}
}
/*============================================================*/
/*	フェードアウト                                            */
/*============================================================*/
static void sub_fadeout(void)
{
	switch(Work->prog){
	case 0:
//		PaletteFadeReq(0xffffffff,0,0,16,0x0000);	//変更 TETSU
		PaletteFadeReq(0xffffffeb,0,0,16,0x0000);	// 図鑑との連動のため、2,4番に触らない
		Work->prog++;
		break;

	case 1:
		if(!PaletteAnime()){
//		if(FadeData.fade_sw == 0){

			TownMapQuit();
			MainProcChange(Work->return_func);
		}
		break;
	}
}
static void sub_fadeout2(void)
{
	switch(Work->prog){
	case 0:
		PaletteFadeReq(0xffffffeb,0,0,16,0x0000);
		Work->prog++;
		break;

	case 1:
		if(!PaletteAnime()){
//		if(FadeData.fade_sw == 0){

			TownMapQuit();
			MainProcChange(Work->return_func2);
		}
		break;
	}
}

/*====================================================================*/
/*                                                                    */
/*  分布図の動作をタスク化したもの                                    */
/*                                                                    */
/*====================================================================*/
static void TaskBunpuzuInit(u8 id);
static void TaskBunpuzuMain(u8 id);

/*======================================================================
==	初期化
==	pokeno    ポケモンナンバー
==	flg       結果通知用フラグアドレス
==            0 ... 動作中
==            1 ... Ｂボタンアウト
==            2 ... 右キーアウト
==
======================================================================*/
void BunpuzuTaskInit(u16 pokeno, u8 *flg)
{
	u8 id;

	Work->pokeno = pokeno;
	Work->ret_flg = flg;
	*flg = 0;

	id = AddTask(TaskBunpuzuInit, 0);
	TaskTable[id].work[0] = 0;

}

static void TaskBunpuzuInit(u8 id)
{
	switch(TaskTable[id].work[0]){
	case 0:
//		SetVBlankFunc(NULL);

		*(vu16 *)REG_DISPCNT = DISP_MODE_0|DISP_BG1_ON|DISP_WIN01_ON;

		*(vu16 *)REG_BG0HOFS = 0;
		*(vu16 *)REG_BG0VOFS = BUNPU_YOFS;
		*(vu16 *)REG_BG2VOFS = 0;
		*(vu16 *)REG_BG2HOFS = 0;
		*(vu16 *)REG_BG3HOFS = 0;
		*(vu16 *)REG_BG3VOFS = 0;
		break;

	case 1:
		PaletteAnimeInit();
		InitActor();
		ObjPalManInit();
		break;


	case 2:
		TownMapInit(&(Work->mapwk), TOWNMAP_WHOLE);
		PM_strclear(Work->noarrive_mapname, spc_, MAPNAME_WIDTH);
		break;

	case 3:
		init_bunpu_bg_begin();
		break;

	case 4:
		if(init_bunpu_bg()){
			return;
		}
		break;

	case 5:
		TownMapAddJiki(CELLID_JIKI, PALID_JIKI);
		TownMap_SetOfs(0, BUNPU_YOFS);
//		SetVBlankFunc(bunpu_v_intr);
		break;

	case 6:
		add_bunpu_actor();
		break;

	case 7:
		make_fumei_cell();
		break;

	case 8:
		add_fumei_actor();
		break;

	case 9:
		PaletteFadeReq(0xffffffeb, 0, 16, 0, 0x0000);
		break;

	case 10:
		*(vu16 *)REG_BLDCNT = BLD_BG0_1ST | BLD_A_BLEND_MODE | BLD_2ND_ALL;
		init_bunpu_fade();

		*(vu16 *)REG_DISPCNT = DISP_MODE_1 | DISP_OBJ_CHAR_1D_MAP 
		| DISP_BG0_ON
		| DISP_BG1_ON		//メニュー（図鑑から継続）
		| DISP_BG2_ON
		| DISP_WIN01_ON
		| DISP_OBJ_ON
		;
		break;

	case 11:
		TaskTable[id].TaskAdrs = TaskBunpuzuMain;
		TaskTable[id].work[0] = 0;
		return;
	}

	TaskTable[id].work[0]++;
}
static void TaskBunpuzuMain(u8 id)
{
	update_bunpu_fade();

	switch(TaskTable[id].work[0]){
	default:
		TaskTable[id].work[0] = 0;

	case 0:
		if(FadeData.fade_sw)	return;
		break;
	case 1:
		if(sys.Trg & B_BUTTON){
			TaskTable[id].work[1] = 1;
			SePlay(SE_PC_OFF);
			break;
		}
		if((sys.Trg & R_KEY)||((sys.Trg & R_BUTTON)&&(MyData.key_config == CNT_MD_LR))){
			TaskTable[id].work[1] = 2;
			SePlay(SE_Z_PAGE);
			break;
		}
		return;

	case 2:
		PaletteFadeReq(0xffffffeb,0,0,16,0x0000);
		break;

	case 3:
		if(FadeData.fade_sw)	return;

		del_bunpu_actor();

		*(Work->ret_flg) = TaskTable[id].work[1];
		DelTask(id);
		return;
	}

	TaskTable[id].work[0]++;
}







/*============================================================*/
/*	洞窟ｴﾝｶｳﾝﾄのｱｸﾀｰ                                          */
/*============================================================*/
static const actHeader bunpuHeader;
static const u16 cave_Palette[16];
static const u8 cave_Character[8*4*4];

static void add_bunpu_actor(void)
{
	static const CellData cell = {
		cave_Character, sizeof(cave_Character), CELLID_CAVE,
	};
	static const PalData pal = {
		cave_Palette , PALID_CAVE
	};


	s16 x, y, i, pos, actcnt;
	u8  no;

	CellSet(&cell);
	ObjPalSet(&pal);

	actcnt = 0;
	for(i = 0; i < Work->cave_encnt_cnt; i++)
	{
		pos = Work->cave_encnt_pos[i];
		x = 4 + ((BLOCK_XMIN + MapPositionData[pos].x) * 8);
		y = 4 + ((BLOCK_YMIN + MapPositionData[pos].y) * 8) - BUNPU_YOFS;
		x += ((MapPositionData[pos].width - 1) * 4);
		y += ((MapPositionData[pos].height - 1) * 4);
		no = AddActor(&bunpuHeader, x, y, 0);
		if(no != ACT_MAX){
			ActWork[no].banish = 1;
			Work->cave_encnt_actor[actcnt++] = &ActWork[no];
		}
	}
	Work->cave_encnt_actcnt = actcnt;
}
static void del_bunpu_actor(void)
{
	u16 i;

	CellDel(CELLID_CAVE);
	ObjPalRegNumDel(PALID_CAVE);

	for(i = 0; i < Work->cave_encnt_actcnt; i++){
		DelActor(Work->cave_encnt_actor[i]);
	}

	CellDel(CELLID_FUMEI);
	ObjPalRegNumDel(PALID_FUMEI);
	for(i = 0; i < 3; i++){
		if(Work->fumei_actor[i]!=NULL){
			DelActor(Work->fumei_actor[i]);
		}
	}
}
static const ActOamData bunpuOam = {
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
static const actHeader bunpuHeader = {
	CELLID_CAVE,
	PALID_CAVE,
	&bunpuOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	DummyActMove,
};

static const u16 cave_Palette[16] = {
0x02da ,0x0000 ,0x001f ,0x18df ,0x319f ,0x4e7f ,0x673f ,0x7fff ,
0x1bff ,0x7fed ,0x7ff5 ,0x0000 ,0x0000 ,0x0000 ,0x0000 ,0x0000 ,
};

static const u8 cave_Character[8*4*4] = {
/*  0  */
0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,
0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x30 ,0x22 ,
0x00 ,0x00 ,0x43 ,0x44 ,0x00 ,0x30 ,0x44 ,0x44 ,
0x00 ,0x20 ,0x44 ,0x44 ,0x00 ,0x20 ,0x44 ,0x44 ,
/*  1  */
0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,
0x00 ,0x00 ,0x00 ,0x00 ,0x22 ,0x03 ,0x00 ,0x00 ,
0x44 ,0x34 ,0x00 ,0x00 ,0x44 ,0x44 ,0x03 ,0x00 ,
0x44 ,0x44 ,0x02 ,0x00 ,0x44 ,0x44 ,0x02 ,0x00 ,
/*  2  */
0x00 ,0x20 ,0x44 ,0x44 ,0x00 ,0x20 ,0x44 ,0x44 ,
0x00 ,0x30 ,0x44 ,0x44 ,0x00 ,0x00 ,0x43 ,0x44 ,
0x00 ,0x00 ,0x30 ,0x22 ,0x00 ,0x00 ,0x00 ,0x00 ,
0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,
/*  3  */
0x44 ,0x44 ,0x02 ,0x00 ,0x44 ,0x44 ,0x02 ,0x00 ,
0x44 ,0x44 ,0x03 ,0x00 ,0x44 ,0x34 ,0x00 ,0x00 ,
0x22 ,0x03 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,
0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,
};

/*============================================================*/
/*	'せいそくち  ふめい'アクター                              */
/*============================================================*/
#define FUMEI_ACT_X   (160)
#define FUMEI_ACT_Y   (140)

static const u16 fumei_Palette[16];
static const u8 fumei_Character[0x1cc];
static const actHeader FumeiHeader;

static void make_fumei_cell(void)
{
	static const PalData pal = { fumei_Palette, PALID_FUMEI };
	CellData cell = { Work->fumei_cell, sizeof(Work->fumei_cell), CELLID_FUMEI };

	LZ77UnCompWram(fumei_Character,Work->fumei_cell);

	CellSet(&cell);
	ObjPalSet(&pal);
}
static void add_fumei_actor(void)
{
	u16 i;
	u8 no;

	if(Work->road_encnt_cnt!=0
	|| Work->cave_encnt_cnt!=0)
	{
		for(i = 0; i < 3; i++){
			Work->fumei_actor[i] = NULL;
		}
	}
	else
	{
		for(i = 0; i < 3; i++)
		{
			no = AddActor(&FumeiHeader,FUMEI_ACT_X+i*32,FUMEI_ACT_Y,0);
			if(no != ACT_MAX){
				ActWork[no].oamData.CharNo += (i*16);
				Work->fumei_actor[i] = &ActWork[no];
			}else{
				Work->fumei_actor[i] = NULL;
			}
		}
	}
}
static const ActOamData FumeiOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	2,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	1,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actHeader FumeiHeader = {
	CELLID_FUMEI,
	PALID_FUMEI,
	&FumeiOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	DummyActMove,
};
static const u16 fumei_Palette[16]={
	0x025e,0x0000,0x6f5b,0x001f,0x3bff,0x03e0,0x7fe0,0x0000,
	0x0000,0x0000,0x7fff,0x6f5b,0x354c,0x6251,0x18c5,0x3d0a,
};
// 48 chars
static const u8 fumei_Character[0x1cc] = {
0x10,0x00,0x06,0x00,

0x20,0x00,0x00,0x00,0x01,0xef,0xee,0xee,0xf0,0xde,0x02,0xdd,0xdd,0xe0,0xcd,0xcc,
0xcc,0x40,0x03,0xbb,0x0c,0xe0,0xcd,0xbc,0xaa,0x10,0x03,0x10,0x1e,0xee,0xee,0x00,
0xee,0xee,0xdd,0xdd,0xdd,0xdd,0xcc,0xcc,0x81,0x30,0x01,0xbb,0xbb,0xbb,0xbb,0xaa,
0xaa,0x30,0x01,0xff,0xf0,0x1f,0xf0,0x1f,0xf0,0x1f,0x70,0x1f,0x50,0x67,0xf0,0x03,
0x30,0x03,0x50,0x27,0x90,0x10,0x01,0x1a,0xa2,0x30,0x01,0x11,0x11,0x11,0x21,0x0e,
0x1a,0x22,0x12,0x22,0x10,0x0b,0xa0,0x20,0x00,0x01,0x21,0x81,0x20,0x03,0x1a,0xa2,
0x21,0xaa,0x2a,0x21,0x00,0x0b,0xd4,0x10,0x0e,0x70,0x3f,0x11,0x00,0x15,0x22,0x00,
0x12,0x1a,0x22,0x9e,0x00,0x19,0xa2,0xaa,0x10,0x47,0xf0,0x73,0xb0,0x03,0x30,0x71,
0x2a,0xc0,0x20,0x69,0x10,0x03,0x2a,0x11,0x11,0xa2,0xaa,0x22,0x70,0x22,0x60,0x77,
0x10,0x63,0x60,0x03,0x1a,0xa2,0x22,0x12,0xbb,0x00,0x57,0x2a,0x00,0x5e,0x50,0x01,
0x00,0xa6,0x22,0x40,0x94,0x30,0x03,0x5e,0x12,0x00,0x3f,0x2a,0x70,0x3f,0x70,0x6b,
0x11,0x73,0x31,0x7f,0xf0,0x1f,0xfe,0xff,0xff,0x11,0x93,0x11,0x3b,0x50,0x27,0x11,
0x33,0x51,0x3f,0x0f,0xff,0xff,0xff,0xff,0x11,0x53,0xf0,0x1f,0xf0,0x1f,0xf0,0x1f,
0xff,0xb0,0x1f,0xf1,0x9f,0xf1,0xbf,0xf0,0x1f,0xf0,0x1f,0xf0,0x1f,0xf0,0x1f,0xf0,
0x1f,0xfe,0xd0,0x01,0x11,0x61,0x01,0x40,0x41,0x9f,0x10,0x06,0xd0,0x1d,0x01,0xb3,
0xa2,0x7e,0x1a,0x01,0x7f,0x21,0x8f,0x11,0x4b,0xf0,0x44,0xf0,0x01,0x91,0xff,0x12,
0xcd,0x00,0x54,0x40,0x66,0xaa,0x12,0x00,0x63,0x11,0xd3,0xa1,0x11,0x97,0xf0,0x00,
0x03,0x30,0x08,0x10,0x11,0x60,0x57,0x1a,0x21,0x22,0x21,0xef,0x01,0xcf,0x41,0xbd,
0x00,0x91,0x11,0x00,0x38,0x01,0xd2,0xf0,0x5d,0xf0,0x01,0xa3,0x20,0x3f,0x22,0x12,
0x16,0x21,0x21,0x21,0x10,0x03,0x02,0x22,0x3f,0x22,0x11,0x00,0x3c,0x71,0xfe,0x60,
0x01,0xf1,0x9f,0xf1,0xbf,0xf0,0x1f,0xff,0xf0,0x1f,0xf0,0x1f,0xf0,0x1f,0xf1,0xff,
0xf1,0x9f,0xf1,0xbf,0xf0,0x1f,0x70,0x1f,0x00,0xfe,0x00,0xdd,0xdd,0xed,0x0f,0xcc,
0xcc,0x29,0xfc,0x0e,0x10,0x03,0xbb,0x00,0x03,0xaa,0xcb,0x30,0x03,0xfb,0x50,0x63,
0xf0,0x01,0x30,0x01,0xb1,0xdf,0x33,0xb9,0x1a,0x01,0xe3,0x01,0x2d,0xfe,0x20,0x01,
0xf3,0xdf,0xc3,0xdf,0x40,0x67,0xf0,0x03,0xf0,0x7f,0xf0,0x01,0x00,0x60,0x00,0x50,
0x67,0x20,0x01,0x11,0x22,0x21,0x12,0x21,0x0f,0x12,0x22,0x2a,0x22,0x71,0xff,0xf3,
0xdf,0xb3,0xdf,0xf0,0x73,0xff,0xf0,0x7f,0xf0,0x01,0xf0,0xff,0xf1,0x9f,0xf1,0xbf,
0xf0,0x1f,0x00,0x1f,0x40,0x67,0xc3,0x11,0x73,0x51,0x7f,0xff,0xff,0xef,0x0f,0x11,
0x93,0xf0,0x6d,0x80,0xf0,0x01,0x00,0x00,
};
