/***********************************************************************
**	「そらをとぶ」地域選択
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
#include "fld_main.h"
#include "fld_tool.h"
#include "fld_eff.h"
#include "print.h"
#include "menutool.h"
#include "f_pmlist.h"
#include "record.h"		//そらをとぶの回数をカウントするため
#include "message.h"
#include "townmap.h"
#include "sysflag.h"
#include "ev_flag.h"
#include "sxytype.h"
#include "pm_str.h"

#include "flying.dat"  // 画像データ

/* ↓３つセットで↓ */
#include "../data/warpsym.h"
#include "../evdata/maparray.h"
#include "warppos.dat"

extern const u8 MapNoRectTbl[][2];

/*====================================================================*/
/*   画像データ                                                       */
/*====================================================================*/
static const u16 frame_Palette[16];
static const u8 frame_Character[0x38];
static const u8 frame_Map[0xb8];
static const u16 mapobj_Palette[16];
static const u8 mapobj_Character[0xd4];

/*====================================================================*/
/*   定数（画像転送設定等）                                           */
/*====================================================================*/
#define MAP_ADDR(b)   (BG_VRAM + (b) * 0x800)
#define CHAR_ADDR(b)  (BG_VRAM + (b) * 0x4000)

#define FRAME_MAP_BLOCK   (30)
#define FRAME_CHAR_BLOCK  (3)
#define FRAME_MAP_ADDR    MAP_ADDR(FRAME_MAP_BLOCK)
#define FRAME_CHAR_ADDR   CHAR_ADDR(FRAME_CHAR_BLOCK)
#define FRAME_PAL         (PA_BG1)

// マップオブジェのセルサイズ
#define MAPOBJ_CELLSIZE  (0x20*14)

// 地名表示枠
#define MAPNAME_X  (18)
#define MAPNAME_Y  (16)

#define MAPNAME_MAXLEN  (10)

// どこへとびますか？文字列
#define MSG_X  (1)
#define MSG_Y  (18)

enum CELLID{
	CELLID_CURSOR,
	CELLID_JIKI,
	CELLID_MAPOBJ,
};


//===============================================
// ２行目文字列
//===============================================
static const u8 * const SaiyuuSubStr[] = {
	PokemonLeagueStr,
	PokemonCenterStr,
};

static const struct {
	const u8 * const *str;
	u16   map_no;
	u16   sysflag;
}SubStrTbl[] = {
	{ SaiyuuSubStr, MAPPOS_C_109, SYS_ARRIVE_LEAGUE },
};

/*====================================================================*/
/*   ワーク領域                                                       */
/*====================================================================*/
typedef struct {
	pFunc sub;
	u16   prog;
	u16   now_mapno;   // 現在位置

	TOWNMAP_WORK  mapwk;

	u8  mapobj_cell[MAPOBJ_CELLSIZE];

	u8  noarrive_mapname[MAPNAME_MAX+1];  // 訪れていない地名表示
	u8  mapname_buf[MAPNAME_MAX+1];

	u8    fDecide;

}FLYING_WORK;

static FLYING_WORK * const Work = (FLYING_WORK*)UserWork;

/*====================================================================*/
/*   プロトタイプ                                                     */
/*====================================================================*/
static void flying_main(void);
static void flying_v_intr(void);
static void change_sub(pFunc sub);
static void write_mapname(void);
static void mapobj_set(void);

/*---------------------------------*/
/*  サブプロセス                   */
/*---------------------------------*/
static void sub_fadein(void);
static void sub_area_select(void);
static void sub_fadeout(void);

/***********************************************************************
**	初期化
***********************************************************************/
void FlyingInit(void)
{
	switch(sys.InitSeqWork){
	case 0:
		SetVBlankFunc(NULL);
		*(vu16*)REG_DISPCNT = 0;
		*(vu16 *)REG_BG0HOFS = 0;
		*(vu16 *)REG_BG0VOFS = 0;
		*(vu16 *)REG_BG1HOFS = 0;
		*(vu16 *)REG_BG1VOFS = 0;
		*(vu16 *)REG_BG2VOFS = 0;
		*(vu16 *)REG_BG2HOFS = 0;
		*(vu16 *)REG_BG3HOFS = 0;
		*(vu16 *)REG_BG3VOFS = 0;

		PaletteAnimeInit();
		InitActor();
		CellManAllInit();
		ObjPalManInit();
		break;

	case 1:
		PrintScreenInit(PASOBOXMENU_TYPE);
		break;

	case 2:
		NMenuScreenInit(PASOBOXMENU_TYPE);
		NMenuScreenClear();
		break;

	case 3:
		TownMapInit(&(Work->mapwk), TOWNMAP_WHOLE);
		TownMapAddCursor(CELLID_CURSOR, CELLID_CURSOR);
		TownMapAddJiki(CELLID_JIKI, CELLID_JIKI);
		Work->now_mapno = Work->mapwk.mapno;

		PM_strclear(Work->noarrive_mapname, spc_, MAPNAME_WIDTH );
		write_mapname();
		break;

	case 4:
		LZ77UnCompVram((void*)frame_Character, (void*)FRAME_CHAR_ADDR);
		break;

	case 5:
		LZ77UnCompVram((void*)frame_Map, (void*)FRAME_MAP_ADDR);
		break;

	case 6:
		PaletteWorkSet(frame_Palette, FRAME_PAL, 0x20);
		NMenuMsgWrite(SoraWoTobu_Msg0, MSG_X, MSG_Y);
		break;

	case 7:
		mapobj_set();
		break;

	case 8:
		ColorConceChange(0xffffffff,16,0x0000);
		SetVBlankFunc(flying_v_intr);
		break;

	case 9:
		*(vu16 *)REG_BLDCNT = 0;

		// フレーム
		*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_1
		| FRAME_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| FRAME_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16;

		*(vu16 *)REG_DISPCNT = DISP_MODE_1 | DISP_OBJ_CHAR_1D_MAP 
		| DISP_BG0_ON
		| DISP_BG1_ON
		| DISP_BG2_ON
	//	| DISP_BG3_ON
		| DISP_OBJ_ON
		;

		change_sub(sub_fadein);
		MainProcChange(flying_main);
		
		break;

	default:
		return;
	}

	sys.InitSeqWork++;
}
/***********************************************************************
**	V Blank                                                           **
***********************************************************************/
static void flying_v_intr(void)
{
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
}
/***********************************************************************
**	メインプロセス                                                    **
***********************************************************************/
static void flying_main(void)
{
	(*(Work->sub))();
	JumpActor();
	SetActor();
}
/***********************************************************************
**	サブプロセス切り替え                                              **
***********************************************************************/
static void change_sub(pFunc sub)
{
	Work->sub = sub;
	Work->prog = 0;
}
/***********************************************************************
**	地名描画                                                          **
***********************************************************************/
static void write_mapname(void)
{
	if(Work->mapwk.cursor_state == MAPCURSOR_ARRIVE
	|| Work->mapwk.cursor_state == MAPCURSOR_FLYING)
	{
		u16 i;
		u8  subline_flg = 0;

		for(i = 0; i < NELEMS(SubStrTbl); i++)
		{
			if(Work->mapwk.mapno == SubStrTbl[i].map_no)
			{
				if(EventFlagCheck(SubStrTbl[i].sysflag))
				{
					s16 ofs;

					ofs = MAPNAME_MAXLEN - PM_strlen(SubStrTbl[i].str[Work->mapwk.map_subno]);
					if(ofs < 0){ ofs = 0; }
					subline_flg = 1;

					NMenuWinBoxWrite(MAPNAME_X, MAPNAME_Y-2, MAPNAME_X+MAPNAME_MAXLEN+1, MAPNAME_Y+3);
					NMenuMsgWrite(Work->mapwk.mapname, MAPNAME_X+1, MAPNAME_Y-1);
					NMenuMsgWrite(SubStrTbl[i].str[Work->mapwk.map_subno], MAPNAME_X+ofs+1, MAPNAME_Y+1);
				}
				break;
			}
		}

		if(subline_flg == 0)
		{
			NMenuWinBoxWrite(MAPNAME_X, MAPNAME_Y, MAPNAME_X+MAPNAME_MAXLEN+1, MAPNAME_Y+3);
			NMenuMsgWrite(Work->mapwk.mapname, MAPNAME_X+1, MAPNAME_Y+1);
			NMenuBoxClear(MAPNAME_X, MAPNAME_Y-2, MAPNAME_X+MAPNAME_MAXLEN+1, MAPNAME_Y-1);
		}


	}else{
		NMenuWinBoxWrite(MAPNAME_X, MAPNAME_Y, MAPNAME_X+MAPNAME_MAXLEN+1, MAPNAME_Y+3);
		NMenuMsgWrite(Work->noarrive_mapname, MAPNAME_X+1, MAPNAME_Y+1);
		NMenuBoxClear(MAPNAME_X, MAPNAME_Y-2, MAPNAME_X+MAPNAME_MAXLEN+1, MAPNAME_Y-1);
	}
}
/***********************************************************************
**	マップオブジェを登録                                              **
***********************************************************************/
static void add_town_obj(void);
static void add_ex_obj(void);
static void mapobj_actmove(actWork *act);

static const actHeader MapObjHeader;

static void mapobj_set(void)
{
	static const PalData  pal = { mapobj_Palette, CELLID_MAPOBJ };
	CellData cell;

	LZ77UnCompWram((void*)mapobj_Character, (void*)(Work->mapobj_cell));
	cell.ch_data = Work->mapobj_cell;
	cell.size = MAPOBJ_CELLSIZE;
	cell.act_num = CELLID_MAPOBJ;

	CellSet(&cell);
	ObjPalSet(&pal);

	add_town_obj();
	add_ex_obj();
}
//===========================================
//  タウン、シティのオブジェ
//===========================================
static void add_town_obj(void)
{	
	u16 i, flg, type, no;
	u16 x, y, w, h;

	flg = SYS_T101_ARRIVE;
	for(i = MAPPOS_T_101; i <= MAPPOS_C_109; i++)
	{
		TownMapGetMapPosition(i, &x, &y, &w, &h);

		x = ((BLOCK_XMIN+x) * 8) + 4;//(w * 4);
		y = ((BLOCK_YMIN+y) * 8) + 4;//(h * 4);

		// 横長
		if(w == 2){
			type = 1;
		// 縦長
		}else if(h == 2){
			type = 2;
		// １ブロック
		}else{
			type = 0;
		}

		no = AddActor(&MapObjHeader,x,y,10);
		if(no != ACT_MAX){
			ActWork[no].oamData.Shape = type;
			if(EventFlagCheck(flg)){
				ActWork[no].move = mapobj_actmove;
			}else{
				type += 3;
			}
			ActAnmChg(&ActWork[no], type);
			ActWork[no].work[0] = i;
		}

		flg++;
	}

}
//===========================================
//  島など特殊な場所のオブジェ
//===========================================
static void add_ex_obj(void)
{
	static const u16 FlgPosTbl[][2] = {
		{ SYS_ARRIVE_BATTLETOWER,  MAPPOS_D_BATTLE },  // バトルタワー
		{ 0xffff,                  MAPPOS_END      },  // 終端
	};
	u16 i, no;
	u16 x, y, w, h;

	for(i = 0; FlgPosTbl[i][1] != MAPPOS_END; i++){
		if(EventFlagCheck(FlgPosTbl[i][0])){
			TownMapGetMapPosition(FlgPosTbl[i][1],&x,&y,&w,&h);
			x = ((BLOCK_XMIN+x) * 8);
			y = ((BLOCK_YMIN+y) * 8);
			no = AddActor(&MapObjHeader,x,y,10);
			if(no != ACT_MAX){
				ActWork[no].oamData.Size = 1;
				ActWork[no].move = mapobj_actmove;
				ActAnmChg(&ActWork[no], 6);
				ActWork[no].work[0] = FlgPosTbl[i][1];
			}
		}
	}
}

static void mapobj_actmove(actWork *act)
{
	if(Work->mapwk.mapno == act->work[0]){
		if(++(act->work[1]) > 16){
			act->work[1] = 0;
			act->banish = !(act->banish);
		}
	}else{
		act->work[1] = 16;
		act->banish = 0;
	}
}

static const ActOamData MapObjOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	0,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	2,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actAnm MapObjAnm[]={
	{ 0, 5, 0, 0, }, { ACT_ANMEND, 0,0,0 },
	{ 1, 5, 0, 0, }, { ACT_ANMEND, 0,0,0 },
	{ 3, 5, 0, 0, }, { ACT_ANMEND, 0,0,0 },
	{ 5, 5, 0, 0, }, { ACT_ANMEND, 0,0,0 },
	{ 6, 5, 0, 0, }, { ACT_ANMEND, 0,0,0 },
	{ 8, 5, 0, 0, }, { ACT_ANMEND, 0,0,0 },
	{ 10, 5, 0, 0, }, { ACT_ANMEND, 0,0,0 },
};
static const actAnm *const MapObjAnmTbl[]={
	MapObjAnm+0, MapObjAnm+2, MapObjAnm+4,
	MapObjAnm+6, MapObjAnm+8, MapObjAnm+10,
	MapObjAnm+12,
};

static const actHeader MapObjHeader = {
	CELLID_MAPOBJ,
	CELLID_MAPOBJ,
	&MapObjOam,
	MapObjAnmTbl,
	0,
	DummyActAffTbl,
	DummyActMove,
};

/*====================================================================*/
/*  サブプロセス                                                      */
/*====================================================================*/
/***********************************************
**	フェードイン                              **
***********************************************/
static void sub_fadein(void)
{
	switch(Work->prog){
	case 0:
		PaletteFadeReq(0xffffffff,0,16,0,0x0000);
		Work->prog++;
		break;

	case 1:
		if(!PaletteAnime()){
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
		switch(TownMapKeyRead()){
		case MAPKEY_FREE:
		case MAPKEY_WAIT:
			break;

		case MAPKEY_MOVE:
			break;

		case MAPKEY_CHANGE:
			write_mapname();
			break;

		case MAPKEY_DECIDE:
			if(Work->mapwk.cursor_state == MAPCURSOR_ARRIVE
			|| Work->mapwk.cursor_state == MAPCURSOR_FLYING
			){
				m4aSongNumStart(SE_SELECT);
				Work->fDecide = 1;
				change_sub(sub_fadeout);
			}
			break;

		case MAPKEY_CANCEL:
			m4aSongNumStart(SE_SELECT);
			Work->fDecide = 0;
			change_sub(sub_fadeout);
			break;
		}
	}
}
/***********************************************
**	フェードアウト                            **
***********************************************/
static void sub_fadeout(void)
{
	switch(Work->prog){
	case 0:
		PaletteFadeReq(0xffffffff,0,0,16,0x0000);
		Work->prog++;
		break;

	case 1:
		if(!PaletteAnime()){
			TownMapQuit();
			if(Work->fDecide){
				// そらをとぶ復帰
				switch(Work->mapwk.mapno){
				case MAPPOS_D_KOKORO:
					NextMapSetByWarpID(WP_KOKORO);
					break;

				case MAPPOS_D_BATTLE:
					NextMapSetByWarpID(WP_BATTLE_TOWER);
					break;

				case MAPPOS_T_101:
					NextMapSetByWarpID((MyData.my_sex==MALE)? WP_T101_BOY : WP_T101_GIRL);
					break;

				case MAPPOS_C_109:
					{
						u8 id;
						if(EventFlagCheck(SYS_ARRIVE_LEAGUE) && Work->mapwk.map_subno == 0)
						{
							id = WP_FIELD_C109;
						}
						else
						{
							id = WP_C109_PC01;
						}
						NextMapSetByWarpID(id);
					}
					break;

				default:
					if(WarpPosition[Work->mapwk.mapno][2] != 0)
					{
						NextMapSetByWarpID(WarpPosition[Work->mapwk.mapno][2]);
					}
					else
					{
						NextMapSetByID(
							WarpPosition[Work->mapwk.mapno][0],
							WarpPosition[Work->mapwk.mapno][1],
							NO_EXIT_ID );
					}
					break;
				}

				SetFieldFlyInStart();

			}else{

				// ポケモンリストへ復帰
				MainProcChange(ReturnFldPokeSora);
			}
		}
		break;
	}
}







#ifdef PM_DEBUG
/***********************************************************************
**	デバッグ用マップ表示
***********************************************************************/
static void debug_write_mapname(void)
{
	u16 i;
	u8  subline_flg = 0;

	for(i = 0; i < NELEMS(SubStrTbl); i++)
	{
		if(Work->mapwk.mapno == SubStrTbl[i].map_no)
		{
			if(EventFlagCheck(SubStrTbl[i].sysflag))
			{
				s16 ofs;

				ofs = MAPNAME_MAXLEN - PM_strlen(SubStrTbl[i].str[Work->mapwk.map_subno]);
				if(ofs < 0){ ofs = 0; }
				subline_flg = 1;

				NMenuWinBoxWrite(MAPNAME_X, MAPNAME_Y-2, MAPNAME_X+MAPNAME_MAXLEN+1, MAPNAME_Y+3);
				NMenuMsgWrite(Work->mapwk.mapname, MAPNAME_X+1, MAPNAME_Y-1);
				NMenuMsgWrite(SubStrTbl[i].str[Work->mapwk.map_subno], MAPNAME_X+ofs+1, MAPNAME_Y+1);
			}
			break;
		}
	}

	if(subline_flg == 0)
	{
		NMenuWinBoxWrite(MAPNAME_X, MAPNAME_Y, MAPNAME_X+MAPNAME_MAXLEN+1, MAPNAME_Y+3);
		NMenuMsgWrite(Work->mapwk.mapname, MAPNAME_X+1, MAPNAME_Y+1);
		NMenuBoxClear(MAPNAME_X, MAPNAME_Y-2, MAPNAME_X+MAPNAME_MAXLEN+1, MAPNAME_Y-1);
	}
}
static void sub_debug(void)
{
	switch(Work->prog){
	case 0:
		PaletteFadeReq(0xffffffff,0,16,0,0x0000);
		Work->prog++;
		break;

	case 1:
		if(!PaletteAnime()){
			Work->prog++;
		}
		break;

	case 2:
		switch(TownMapKeyRead()){
		case MAPKEY_MOVE:
			break;

		case MAPKEY_CHANGE:
			debug_write_mapname();
			break;

		case MAPKEY_DECIDE:
			if(Work->mapwk.cursor_state != MAPCURSOR_SPACE){
				m4aSongNumStart(SE_SELECT);
				Work->fDecide = 1;
				change_sub(sub_fadeout);
			}
			break;

		case MAPKEY_CANCEL:
			m4aSongNumStart(SE_SELECT);
			PaletteFadeReq(0xffffffff,0,0,16,0x0000);
			Work->prog++;
			break;
		}
		break;

	case 3:
		if(!PaletteAnime()){
			MainProcChange(FieldMenuRecover);
		}
		break;

	// ----- ここから下は拡大・縮小デバッグ用 --------------------------

	case 4:
		if(TownMapKeyRead()){
			debug_write_mapname();
			break;
		}
		if(sys.Trg & A_BUTTON){
			TownMapDelCursor();
			TownMapModeChangeInit();
			Work->prog++;
		}
		break;

	case 5:
		if(!TownMapModeChange()){
			TownMapAddCursor(0, 0);
			Work->prog++;
		}
		break;

	case 6:
		if(TownMapKeyRead()){
			debug_write_mapname();
//			break;
		}
		if(sys.Trg & A_BUTTON){
			TownMapDelCursor();
			TownMapModeChangeInit();
			Work->prog++;
		}
		break;

	case 7:
		if(!TownMapModeChange()){
			TownMapAddCursor(0, 0);
			Work->prog = 3;
		}
		break;
	}
}
void FlyingInitDebug(void)
{
	FlyingInit();

	if(sys.pMainProc == flying_main){
		TownMap_JikiTenmetsu();
		change_sub(sub_debug);
		debug_write_mapname();
	}
}
#endif






