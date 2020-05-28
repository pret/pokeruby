/***********************************************************************
**	トレナビ（ＢＧ処理）
***********************************************************************/
#include "tnavi_com.h"
#include "boxsub.h"
#include "wmap.h"
#include "ev_fight.h"
#include "record.h"
#include "poketool.h"
#include "message.h"

#include "tnavi_bg.dat"
#include "tnavi_map.dat"
#include "ribbonmsg.dat"
#include "teyeinfo.dat"


/*====================================================================*/
/*   定数（画像転送設定等）                                           */
/*====================================================================*/
#define MAP_ADDR(b)   (BG_VRAM + (b) * 0x800)
#define CHAR_ADDR(b)  (BG_VRAM + (b) * 0x4000)

// トップフレーム
#define  TOPFRAME_MAP_BLOCK    (6)
#define  TOPFRAME_CHAR_BLOCK   (0)
#define  TOPFRAME_MAP_ADDR     MAP_ADDR(TOPFRAME_MAP_BLOCK)
#define  TOPFRAME_CHAR_ADDR    CHAR_ADDR(TOPFRAME_CHAR_BLOCK)
#define  TOPFRAME_PAL          (PA_BG0)


#define  POKENAME_X   (13)
#define  POKENAME_Y   (1)
#define  BOXNAME_X  (13)
#define  BOXNAME_Y  (3)

#define  LIST_X       (13)
#define  LIST_Y       (1)

#define  LIST_RANK_X  (1)
#define  LIST_RANK_Y  (6)

#define  LIST_DATA_X  (1)
#define  LIST_DATA_Y  (9)

#define  LIST_PLACE_X  (0)
#define  LIST_PLACE_Y  (5)


// サーチ結果表示画面
#define  SEARCHBG_MAP_BLOCK   (15)
#define  SEARCHBG_CHAR_BLOCK  (2)
#define  SEARCHBG_MAP_ADDR    MAP_ADDR(SEARCHBG_MAP_BLOCK)
#define  SEARCHBG_CHAR_ADDR   (CHAR_ADDR(SEARCHBG_CHAR_BLOCK) + 0x5000)
#define  SEARCHBG_PAL         (PA_BG2)
#define  SEARCH_FONT_PAL      (PA_BG15)

#define  SEARCH_POKENAME_X   (15)
#define  SEARCH_POKENAME_Y   (2)

#define  SEARCH_CATEGORY_X   (13)
#define  SEARCH_CATEGORY_Y   (16)
#define  SEARCH_RANK_X  (22)
#define  SEARCH_RANK_Y  (16)

// 毛並みグラデーションステップ数
#define  FUR_GRADATION_STEP  (11)


enum INFOBG_MODE {
	INFOBG_MAP, INFOBG_CONDITION, INFOBG_RIBON
};


/*====================================================================*/
/*   プロトタイプ                                                     */
/*====================================================================*/
static void init_pokewin_bg_begin(void);
static u8 init_pokewin_bg(u8 ribon_flg);
static void init_list_begin(void);
static u8   init_list_main(void);
static void write_list_line(u16 sort_no, u16 ypos);
static void write_list_line_trainer(u16 sort_no, u16 ypos);
static void write_list_init(u16 sort_no,  u16 ypos, u16 count);
static u8 write_list_main(void);
static void make_menubg_fadetbl(u8 prog);
static void set_menubg_pal(u8 type);
static void write_battle_career(u8 line);
static void erace_battle_career(void);
/*====================================================================*/
/*   初期化                                                           */
/*====================================================================*/
// オフセット値をリセット
static void bgofs_reset(void)
{
	*(vu16 *)REG_BG0HOFS = 0;
	*(vu16 *)REG_BG0VOFS = 0;
//	*(vu16 *)REG_BG1HOFS = 0;
//	*(vu16 *)REG_BG1VOFS = 0;
	*(vu16 *)REG_BG2VOFS = 0;
	*(vu16 *)REG_BG2HOFS = 0;
	*(vu16 *)REG_BG3HOFS = 0;
	*(vu16 *)REG_BG3VOFS = 0;
}
// 初期化進捗をリセット
void TNaviBG_ResetProg(void)
{
	NaviWork->initbg_prog = 0;
}
/*====================================================================*/
/*   共通ＢＧ                                                         */
/*====================================================================*/
// 画像データ転送設定
#define COMBG_MAP_BLOCK   (27)
#define COMBG_CHAR_BLOCK  (3)
#define COMBG_MAP_ADDR    MAP_ADDR(COMBG_MAP_BLOCK)
#define COMBG_CHAR_ADDR   CHAR_ADDR(COMBG_CHAR_BLOCK)
#define COMBG_PAL         PA_BG1

// メニュー描画ブロック
#define AMENU_X  (0)
#define AMENU_Y  (22)
#define BMENU_X  (12)
#define BMENU_Y  (22)

/***********************************************
**	初期化
***********************************************/
void TNaviBG_InitCommon_Begin(void)
{
	NaviWork->initbg_prog = 0;
	if(NaviWork->comm_flg == FALSE){
		while(1){
			if(!TNaviBG_InitCommon()){ return; }
		}
	}
}
u8 TNaviBG_InitCommon(void)
{
	switch(NaviWork->initbg_prog){
	case 0:
		LZ77UnCompVram((void*)combg_Character, (void*)COMBG_CHAR_ADDR);
		break;

	case 1:
		LZ77UnCompVram((void*)combg_Map, (void*)COMBG_MAP_ADDR);
		break;

	case 2:
		PaletteWorkSet(combg_Palette, COMBG_PAL, 0x20);
		break;

	case 3:
		make_menubg_fadetbl(0);
		make_menubg_fadetbl(1);
		make_menubg_fadetbl(2);
		break;

	case 4:
		NaviWork->combg_vofs = 0;
		*(vu16 *)REG_BG1HOFS = 0;
		*(vu16 *)REG_BG1VOFS = 0;

		*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_0
		| COMBG_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| COMBG_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;

		NaviWork->initbg_prog++;
		return 0;

	default:
		return 0;
	}

	NaviWork->initbg_prog++;

	return 1;
}
/***********************************************
**	スクロール  （０が帰ったら終了）
***********************************************/
#define COMBG_SCROLL_SPEED (2)
#define COMBG_VOFS_MAX     (32)
u8 TNaviBG_ScrollUpCommon(void)
{
	u8 ret = 1;
	if(NaviWork->combg_vofs == COMBG_VOFS_MAX){ return 0; }
	NaviWork->combg_vofs += COMBG_SCROLL_SPEED;
	if(NaviWork->combg_vofs >= COMBG_VOFS_MAX){
		NaviWork->combg_vofs = COMBG_VOFS_MAX;
		ret = 0;
	}
	*(vu16*)REG_BG1VOFS = NaviWork->combg_vofs;
	return ret;
}
u8 TNaviBG_ScrollDownCommon(void)
{
	u8 ret = 1;
	if(NaviWork->combg_vofs == 0){ return 0; }
	NaviWork->combg_vofs -= COMBG_SCROLL_SPEED;
	if(NaviWork->combg_vofs <= 0){
		NaviWork->combg_vofs = 0;
		ret = 0;
	}
	*(vu16*)REG_BG1VOFS = NaviWork->combg_vofs;
	return ret;

}
/***********************************************
**	メニュー描画
***********************************************/
void TNaviBG_MenuWriteCommon(u8 type)
{
	BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X, AMENU_Y, com_nomenu_map, 0, 0, 17, 2, 17);

	switch(type){
	case COMMENU_CONDITION_LIST:
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X, AMENU_Y, com_condition_map, 0, 0, 12, 2, 12);
		BoxTransMap((u16*)COMBG_MAP_ADDR, BMENU_X, BMENU_Y, com_modoru_map, 0, 0, 5, 2, 5);
		break;
	case COMMENU_CONDITION_STOCK:
//		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X, AMENU_Y, com_nomenu_map, 0, 0, 12, 2, 12);
//		BoxTransMap((u16*)COMBG_MAP_ADDR, BMENU_X, BMENU_Y, com_nomenu_map, 0, 0, 5, 2, 12);
		break;
	case COMMENU_RIBBON_SELECT:
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X, AMENU_Y, com_detail_map, 0, 0, 12, 2, 12);
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X+9, BMENU_Y, com_modoru_map, 0, 0, 5, 2, 5);
		break;
	case COMMENU_RIBBON_DETAIL:
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X+9, BMENU_Y, com_modoru_map, 0, 0, 5, 2, 5);
		break;
	case COMMENU_CONDITION_SEARCH:
		if(NaviWork->comm_flg==0){
			BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X, AMENU_Y, com_marking_map, 0, 0, 12, 2, 12);
			BoxTransMap((u16*)COMBG_MAP_ADDR, BMENU_X, BMENU_Y, com_modoru_map, 0, 0, 5, 2, 5);
		}else{
			BoxTransMap((u16*)COMBG_MAP_ADDR, BMENU_X, BMENU_Y, com_modoru_map, 0, 0, 5, 2, 5);
		}
		break;
	case COMMENU_CONDITION_MARKING:
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X, AMENU_Y, com_selmark_map, 0, 0, 12, 2, 12);
		BoxTransMap((u16*)COMBG_MAP_ADDR, BMENU_X, BMENU_Y, com_yameru_map, 0, 0, 5, 2, 5);
		break;
	case COMMENU_RIBBON_LIST:
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X, AMENU_Y, com_ribon_map, 0, 0,  8, 2, 12);
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X+9, BMENU_Y, com_modoru_map, 0, 0, 5, 2, 5);
		break;
	case COMMENU_MAP_ZOOM:
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X, AMENU_Y, com_whole_map, 0, 0, 12, 2, 12);
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X+7, BMENU_Y, com_modoru_map, 0, 0, 5, 2, 5);
		break;
	case COMMENU_MAP_WHOLE:
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X, AMENU_Y, com_zoom_map, 0, 0, 12, 2, 12);
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X+7, BMENU_Y, com_modoru_map, 0, 0, 5, 2, 5);
		break;
	case COMMENU_TRAINER_LIST:
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X, AMENU_Y, com_detail_map, 0, 0, 12, 2, 12);
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X+8, BMENU_Y, com_modoru_map, 0, 0, 5, 2, 5);
		break;
	case COMMENU_TRAINER_DATA:
		BoxTransMap((u16*)COMBG_MAP_ADDR, AMENU_X+8, BMENU_Y, com_modoru_map, 0, 0, 5, 2, 5);
		break;
	}
}
/*====================================================================*/
/*   メニュー画面                                                     */
/*====================================================================*/
#define MENUINFO_MAP_BLOCK  (31)
#define MENUINFO_CHAR_BLOCK (0)
#define MENUINFO_MAP_ADDR   MAP_ADDR(MENUINFO_MAP_BLOCK)
#define MENUINFO_CHAR_ADDR  (CHAR_ADDR(MENUINFO_CHAR_BLOCK)+0x5000)
#define MENUINFO_PAL        PA_BG15

#define MENUBG_MAP_BLOCK  (28)
#define MENUBG_CHAR_BLOCK (2)
#define MENUBG_MAP_ADDR   MAP_ADDR(MENUBG_MAP_BLOCK)
#define MENUBG_CHAR_ADDR  CHAR_ADDR(MENUBG_CHAR_BLOCK)
#define MENUBG_PAL        PA_BG3

#define NAVIIMAGE_MAP_BLOCK  (29)
#define NAVIIMAGE_CHAR_BLOCK (2)
#define NAVIIMAGE_MAP_ADDR   MAP_ADDR(NAVIIMAGE_MAP_BLOCK)
#define NAVIIMAGE_CHAR_ADDR  (CHAR_ADDR(NAVIIMAGE_CHAR_BLOCK)+0x20)
#define NAVIIMAGE_PAL        PA_BG4

void TNaviBG_InitMenu_Begin(u8 type)
{
	NaviWork->initbg_prog = 0;
	if(NaviWork->comm_flg == FALSE){
		while(1){
			if(!TNaviBG_InitMenu(type)){ return; }
		}
	}
}
u8 TNaviBG_InitMenu(u8 type)
{
	switch(NaviWork->initbg_prog){
	case 0:
		bgofs_reset();
		break;

	case 1:
		PrintScreenInit(PASOBOXMENU_TYPE);
		break;

	case 2:
		NMenuScreenInitStart(PASOBOXMENU_TYPE);
		break;

	case 3:
		if(!NMenuScreenInitMain()){
			return 1;
		}
		break;

	case 4:
		DIV_DMAARRAYCOPY(3, menu_info_Character, MENUINFO_CHAR_ADDR, 16);
		break;

	case 5:
		LZ77UnCompVram((void*)menu_info_Map, (void*)MENUINFO_MAP_ADDR);
		break;

	case 6:
		DIV_DMAARRAYCOPY(3, menu_bg_Character, MENUBG_CHAR_ADDR, 16);
		break;

	case 7:
		LZ77UnCompVram((void*)menu_bg_Map, (void*)MENUBG_MAP_ADDR);
		break;

	case 8:
		LZ77UnCompVram((void*)navi_image_Map, (void*)NAVIIMAGE_MAP_ADDR);
		break;

	case 9:
		LZ77UnCompVram((void*)navi_image_Character, (void*)NAVIIMAGE_CHAR_ADDR);
		break;

	case 10:
		set_menubg_pal(type);
		PaletteWorkSet(menu_info_Palette, MENUINFO_PAL, 0x20);
		PaletteWorkSet(navi_image_Palette, NAVIIMAGE_PAL, 0x20);
		TNaviBG_MenuScrollInit();
		break;

	case 11:
		// ＢＧ０（説明テキスト）
		*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_1
		| MENUINFO_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| MENUINFO_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;

		// ＢＧ２（トレナビイメージ）
		*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_2
		| NAVIIMAGE_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| NAVIIMAGE_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;

		// ＢＧ３（背景）
		*(vu16 *)REG_BG3CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_3
		| MENUBG_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| MENUBG_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;

		*(vu16 *)REG_BLDCNT = 0;
		NaviWork->initbg_prog++;
		return 0;

	default:
		return 0;
	}

	NaviWork->initbg_prog++;
	return 1;

}
/***************************************************************
**	メニュー情報を描画
**
**	type   メニュータイプ（enum MENU_TYPE）
**  no     メニューナンバー
**
***************************************************************/
#define MENUINFO_X  (4)
#define MENUINFO_Y  (17)

void TNaviBG_WriteMenuInfo(u8 type, u8 no)
{
	static const u8 * const main_info[] = {
		PNMenuMsg00,
		PNMenuMsg01,
		PNMenuMsg02,
		PNMenuMsg03,
		PNMenuMsg04,
		PNMenuMsg05,
		PNMenuMsg06,
	};
	static const u8 * const condition_info[] = {
		PNMenuMsg07,
		PNMenuMsg08,
		PNMenuMsg09,
	};
	static const u8 * const search_info[] = {
		PNMenuMsg10,
		PNMenuMsg11,
		PNMenuMsg12,
		PNMenuMsg13,
		PNMenuMsg14,
		PNMenuMsg15,
	};

	const u8 *src = NULL;

	switch(type){
	case MENUTYPE_MAIN: src = main_info[no]; break;
	case MENUTYPE_CONDITION: src = condition_info[no]; break;
	case MENUTYPE_SEARCH: src = search_info[no]; break;
	}

	NMenuMsgWrite(src, MENUINFO_X, MENUINFO_Y);
}
/***************************************************************
**	背景色書き換え
***************************************************************/
/*==============================================
==	初期化
==	type  メニュータイプ
==============================================*/
void TNaviBG_MenuBG_RefleshReq(u8 type)
{
	if(type == MENUTYPE_SEARCH){
		type = MENUTYPE_CONDITION;
	}

	NaviWork->menubg_fade_nextpos = (type*(MENUBG_FADE_PALCNT * (MENUBG_FADE_STEP-1)));

	if(NaviWork->menubg_fade_pos < NaviWork->menubg_fade_nextpos){
		NaviWork->menubg_pos_add = MENUBG_FADE_PALCNT;
	}else if(NaviWork->menubg_fade_pos > NaviWork->menubg_fade_nextpos){
		NaviWork->menubg_pos_add = -MENUBG_FADE_PALCNT;
	}else{
		NaviWork->menubg_pos_add = 0;
	}

	return;
}
/*==============================================
==	更新
==	return:  終了 0,  継続中 1
==============================================*/
u8 TNaviBG_MenuBG_RefleshWait(void)
{
	u16 *src;

	if(NaviWork->menubg_fade_pos == NaviWork->menubg_fade_nextpos){
		return 0;
	}

	NaviWork->menubg_fade_pos += NaviWork->menubg_pos_add;

	src = NaviWork->menubg_fade_pal;
	src += NaviWork->menubg_fade_pos;
	// ↑
	// これを,
	// src = NaviWork->menubg_fade_pal + NaviWork->menubg_fade_pos; とやったり、
	// src = &(NaviWork->menubg_fade_pal[NaviWork->menubg_fade_pos]); とやると
	// 環境によってうまく動かないことがある
	// （srcに、本来の値より20000h 大きい値が入る）

	PaletteWorkSet(src, MENUBG_PAL+1, MENUBG_FADE_PALCNT*2);
	return 1;
}
/***************************************************************
**	メニュータイプに合わせてフェードデータ初期化
***************************************************************/
static void set_menubg_pal(u8 type)
{
	u16 *src;

	if(type == MENUTYPE_SEARCH){
		type = MENUTYPE_CONDITION;
	}

	NaviWork->menubg_fade_pos = (type*(MENUBG_FADE_PALCNT * (MENUBG_FADE_STEP-1)));
	src = NaviWork->menubg_fade_pal + NaviWork->menubg_fade_pos;
	PaletteWorkSet(src, MENUBG_PAL+1, MENUBG_FADE_PALCNT*2);
}
/***************************************************************
**	背景のフェードデータを作成
***************************************************************/
static void make_menubg_fadetbl(u8 prog)
{
	u16 i, from, to, *dst;

	switch(prog){
	case 0:
		for(i = 0; i < MENUBG_FADE_PALMAX; i++){
			NaviWork->menubg_fade_pal[i] = 0;
		}
		return;


	case 1:
		from = 1;
		to = from + MENUBG_FADE_PALCNT;
		dst = NaviWork->menubg_fade_pal;
		MakePalFadeData(
			menu_bg_Palette+from, menu_bg_Palette+to,
			MENUBG_FADE_STEP, MENUBG_FADE_PALCNT, dst);
		break;

	case 2:
		from = 1 + MENUBG_FADE_PALCNT;
		to = from + MENUBG_FADE_PALCNT * 2;
		dst = NaviWork->menubg_fade_pal + (MENUBG_FADE_PALCNT * (MENUBG_FADE_STEP-1));
		MakePalFadeData(
			menu_bg_Palette+from, menu_bg_Palette+to,
			MENUBG_FADE_STEP, MENUBG_FADE_PALCNT, dst);
		break;

	default:
		return;
	}
}
/*====================================================================*/
/*  フェードデータ作成                                                */
/*                                                                    */
/*	from    フェード０段階のパレットデータアドレス                    */
/*  to      フェード最終段階のパレットデータアドレス                  */
/*  step    フェードステップ数                                        */
/*  colors  色数                                                      */
/*  dst     フェードデータ出力先アドレス                              */
/*          ※ step x colors x 2 bytes の領域が必要                   */
/*                                                                    */
/*  step = 8, colors = 2 の場合、dst に以下のデータが出力される       */
/*                                                                    */
/*  from[0],from[1],fade1[0],fade1[1],...,fade6[1],to[0],to[1],       */
/*                                                                    */
/*====================================================================*/
#define GET_R(c) ((c)&0x1f)
#define GET_G(c) (((c)>>5)&0x1f)
#define GET_B(c) (((c)>>10)&0x1f)
#define RGB(r,g,b) (((b)<<10)| ((g)<<5) | (r))

void  MakePalFadeData(const u16 *from, const u16 *to, u8 step, u8 colors, u16 *dst)
{
	u16 c, s, r, g, b, *d;
	s32 fr,fg,fb, tr,tg,tb, sr,sg,sb;

	for(c = 0; c < colors; c++){
		fr = (GET_R(*from) << 8);
		fg = (GET_G(*from) << 8);
		fb = (GET_B(*from) << 8);
		tr = (GET_R(*to) << 8);
		tg = (GET_G(*to) << 8);
		tb = (GET_B(*to) << 8);

		sr = (tr - fr) / step;
		sg = (tg - fg) / step;
		sb = (tb - fb) / step;

		d = dst;
		for(s = 0; s < (step-1); s++){
			r = fr >> 8;
			g = fg >> 8;
			b = fb >> 8;
			*d = RGB(r,g,b);
			d += colors;
			fr += sr;
			fg += sg;
			fb += sb;
		}
		r = tr >> 8;
		g = tg >> 8;
		b = tb >> 8;
		*d = RGB(r,g,b);

		from++;
		to++;
		dst++;
	}
}
/***************************************************************
**	メニュー背景のスクロール
***************************************************************/
// オフセット値更新
static void menubg_hofs_inc(void)
{
	NaviWork->menubg_scroll_cnt++;
	NaviWork->menubg_scroll_cnt &= 1;
	if(NaviWork->menubg_scroll_cnt){
		NaviWork->menubg_hofs++;
	}
	*(vu16 *)REG_BG3HOFS = NaviWork->menubg_hofs;
}
// スクロール用タスク
static void menubg_scroll_task(u8 task_no)
{
	if(TaskTable[task_no].work[0] == 0){
		menubg_hofs_inc();
	}else{
		if(NaviWork->menubg_hofs & 7){
			menubg_hofs_inc();
		}else{
			NaviWork->menubg_hofs = 0;
			NaviWork->menubg_scroll_cnt = 0;
			*(vu16 *)REG_BG3HOFS = 0;
		}
	}
}
// スクロール初期化（開始する）
void TNaviBG_MenuScrollInit(void)
{
	NaviWork->menubg_hofs = 0;
	NaviWork->menubg_scroll_cnt = 0;
	NaviWork->menubg_taskno = AddTask(menubg_scroll_task, 80);
}
// スクロール終了
void TNaviBG_MenuScrollQuit(void)
{
	if(CheckTask(menubg_scroll_task)){
		DelTask(NaviWork->menubg_taskno);
	}
}

/*====================================================================*/
/*   ホウエンマップ                                                   */
/*====================================================================*/

#define MAPEXP_MAP_BLOCK  (29)
#define MAPEXP_CHAR_BLOCK (0)
#define MAPEXP_MAP_ADDR   MAP_ADDR(MAPEXP_MAP_BLOCK)
#define MAPEXP_CHAR_ADDR  (CHAR_ADDR(MAPEXP_CHAR_BLOCK)+0x5000)
#define MAPEXP_PAL        PA_BG1

#define MAPINFO_WIN_X1    (16)
#define MAPINFO_WIN_Y1    (15)
#define MAPINFO_WIN_X2    (29)
#define MAPINFO_WIN_Y2    (29)
#define MAPINFO_X1        (MAPINFO_WIN_X1+1)
#define MAPINFO_Y1        (MAPINFO_WIN_Y1+1)
#define MAPINFO_X2        (MAPINFO_WIN_X2-1)
#define MAPINFO_Y2        (MAPINFO_WIN_Y2-1)

#define MAPINFO_WIN_WIDTH  (MAPINFO_WIN_X2-MAPINFO_WIN_X1+1)

#define MAPINFO_VOFS_MAX  (96)
#define MAPINFO_SCR_SPD   (8)

#define MAPINST_MAX     (4)

#define MINIMAP_CHAR_BLOCK  (0)
#define MINIMAP_CHAR_ADDR   (CHAR_ADDR(MINIMAP_CHAR_BLOCK)+0x5000)
#define MINIMAP_MAP_BLOCK   (31)
#define MINIMAP_MAP_ADDR    MAP_ADDR(MINIMAP_MAP_BLOCK)
#define MINIMAP_PAL         PA_BG3
#define MINIMAP_X           (MAPINFO_WIN_X1+2)
#define MINIMAP_Y           (MAPINFO_WIN_Y1+3)


static void init_minimap_begin(void);
static u8 init_minimap_main(void);

static void minimapinfo_init(void);
static void minimapinfo_start(void);
static void minimapinfo_stop(void);

/***************************************************************
**	初期化
***************************************************************/
void TNaviBG_InitMapMode_Begin(void)
{
	NaviWork->initbg_prog = 0;
	if(NaviWork->comm_flg == FALSE){
		while(1){
			if(!TNaviBG_InitMapMode()){ return; }
		}
	}
}

u8 TNaviBG_InitMapMode(void)
{
	switch(NaviWork->initbg_prog){
	case 0:
		bgofs_reset();
		break;

	case 1:
		PrintScreenInit(PASOBOXMENU_TYPE);
		break;

	case 2:
		NMenuScreenInitStart(PASOBOXMENU_TYPE);
		break;

	case 3:
		if(!NMenuScreenInitMain()){
			return 1;
		}
		break;

	case 4:
		NMenuScreenClear();
		break;

	case 5:
		TownMapInitBegin(&(NaviWork->mapwk), (MyData.tnavi_zoom)? TOWNMAP_ZOOM : TOWNMAP_WHOLE);
		break;

	case 6:
		if(TownMapInitMain()){
			return 1;
		}
		break;

	case 7:
		LZ77UnCompVram((void*)minimap_Character, (void*)MINIMAP_CHAR_ADDR);
		break;

	case 8:
		PaletteWorkSet(minimap_Palette, MINIMAP_PAL, 0x20);
		init_minimap_begin();
		break;

	case 9:
		if(init_minimap_main()){
			return 1;
		}
		break;

	case 10:
		NMenuWinBoxWrite(MAPINFO_WIN_X1, MAPINFO_WIN_Y1, 
			MAPINFO_WIN_X2, MAPINFO_WIN_Y2);
		TNaviBG_MapInfoWrite();
		break;

	case 11:
		if(NaviWork->mapwk.mode == TOWNMAP_WHOLE){
			NaviWork->mapinfo_vofs = 0;
			*(vu16 *)REG_BG0VOFS = 0;
		}else{
			NaviWork->mapinfo_vofs = MAPINFO_VOFS_MAX;
			*(vu16 *)REG_BG0VOFS = MAPINFO_VOFS_MAX;
		}

		*(vu16 *)REG_BG0CNT &= ~BG_PRIORITY_0;
		*(vu16 *)REG_BG0CNT |= BG_PRIORITY_1;
		*(vu16 *)REG_BLDCNT = 0;
		break;

	default:
		return 0;
	}

	NaviWork->initbg_prog++;
	return 1;
}
/***************************************************************
**	最新の地名情報をＢＧに描画
***************************************************************/
void TNaviBG_MapInfoWrite(void)
{
	u16 i, y;
	const u8 *name;

	NMenuBoxWrite(MAPINFO_X1, MAPINFO_Y1, MAPINFO_X2, MAPINFO_Y2-1);

	switch(NaviWork->mapwk.cursor_state){
	case MAPCURSOR_ROAD:
	case MAPCURSOR_FLYING:
		NMenuMsgWrite(NaviWork->mapwk.mapname, MAPINFO_X1, MAPINFO_Y1);

		y = MAPINFO_Y1 + 2;
		for(i = 0; i < MAPINST_MAX; i++){
			name = GetAreaInstitution(NaviWork->mapwk.mapno, NaviWork->mapwk.map_subno, i);
			if(name == NULL){ break; }
			PM_strcpy_clear(NaviWork->mapinfo_buf, name, spc_, MAPINFO_MAXLEN);
			NMenuMsgWrite(NaviWork->mapinfo_buf, MAPINFO_X1, y);
			y += 2;
		}
		NMenuBoxWrite(MAPINFO_X1, y, MAPINFO_X2, MAPINFO_Y2-2);
		break;

	case MAPCURSOR_ARRIVE:
		NMenuMsgWrite(NaviWork->mapwk.mapname, MAPINFO_X1, MAPINFO_Y1);
		{
			u16 map, sub;

			map = NaviWork->mapwk.mapno;
			sub = NaviWork->mapwk.map_subno;

			if(NaviWork->minimap_map[map][sub] != NULL){
				BoxTransMap((u16*)MINIMAP_MAP_ADDR, MINIMAP_X, MINIMAP_Y,
					(const u16*)(NaviWork->minimap_map[map][sub]), 0, 0, 10, 10, 10);
				break;
			}
		}
		break;

	case MAPCURSOR_NOARRIVE:
		NMenuMsgWrite(NaviWork->mapwk.mapname, MAPINFO_X1, MAPINFO_Y1);
		break;

	case MAPCURSOR_SPACE:
		break;
	}

	if(NaviWork->mapwk.cursor_state == MAPCURSOR_ARRIVE){
		minimapinfo_start();
	}else{
		minimapinfo_stop();
	}

}
/***************************************************************
**	操作方法・モード表示ＢＧを更新
***************************************************************/
void TNaviBG_MapExpUpdate(void)
{
	if(NaviWork->mapwk.mode == TOWNMAP_WHOLE){
		TNaviBG_MenuWriteCommon(COMMENU_MAP_WHOLE);
	}else{
		TNaviBG_MenuWriteCommon(COMMENU_MAP_ZOOM);
	}
}
/***************************************************************
**	地名情報ＢＧスクロール
**
**	mode     1...下降／0...上昇
**
**	戻り値   1...継続／0...終了
***************************************************************/
u8 TNaviBG_MapInfoScroll(u8 mode)
{
	u8 ret = 1;

	if(mode){
		if(NaviWork->mapinfo_vofs > MAPINFO_SCR_SPD){
			NaviWork->mapinfo_vofs -= MAPINFO_SCR_SPD;
		}else{
			NaviWork->mapinfo_vofs = 0;
			ret = 0;
		}
	}else{
		NaviWork->mapinfo_vofs += MAPINFO_SCR_SPD;
		if(NaviWork->mapinfo_vofs >= MAPINFO_VOFS_MAX){
			NaviWork->mapinfo_vofs = MAPINFO_VOFS_MAX;
			ret = 0;
		}
	}
	*(vu16 *)REG_BG0VOFS = NaviWork->mapinfo_vofs;
	return ret;
}
/***************************************************************
**	ミニマップのマップデータをワークに展開しておく
***************************************************************/
static void init_minimap_begin(void)
{
	NaviWork->minimap_prog = 0;
	NaviWork->minimap_workno = 0;

	minimapinfo_init();
}

static u8 init_minimap_main(void)
{
	static const u8* const CompedMapTbl[MINIMAP_TOWN_MAX][MINIMAP_PTN_MAX] = {
		{  misiro_Map,   NULL },
		{  kotoki_Map,   NULL },
		{  muro_Map,     NULL },
		{  fuen_Map,     NULL },
		{  hazituge_Map, NULL },
		{  sidake_Map,   NULL },
		{  kinagi_Map,   NULL },

		{  touka_Map,      NULL },
		{  kaina_n_Map,    kaina_s_Map},
		{  kinsetu_w_Map,  kinsetu_e_Map},
		{  kanazumi_n_Map, kanazumi_s_Map },
		{  hiwamaki_Map,   NULL },
		{  minamo_w_Map,   minamo_e_Map },
		{  tokusane_w_Map, tokusane_e_Map},
		{  rune_Map,       NULL },
		{  saiyuu_n_Map,   saiyuu_s_Map },
	};
	u16 i, t, work_no;

	if(NaviWork->minimap_prog >= MINIMAP_TOWN_MAX){
		return 0;
	}

	t = NaviWork->minimap_prog;
	work_no = NaviWork->minimap_workno;
	for(i = 0; i < MINIMAP_PTN_MAX; i++){
		if(CompedMapTbl[t][i] != NULL){
			LZ77UnCompVram((void*)CompedMapTbl[t][i], (void*)(NaviWork->minimap_work[work_no]));
			NaviWork->minimap_map[t][i] = NaviWork->minimap_work[work_no];
			work_no++;
		}else{
			NaviWork->minimap_map[t][i] = NULL;
		}
	}
	NaviWork->minimap_prog++;
	if(NaviWork->minimap_prog >= MINIMAP_TOWN_MAX){
		return 0;
	}

	NaviWork->minimap_workno = work_no;

	return 1;
}
/***************************************************************
**	ミニマップの説明テキストをスクロールさせる
***************************************************************/
static void minimapinfo_init(void)
{
	NaviWork->minimapinfo_enable = 0;
	NaviWork->minimapinfo_xpos = 47;
	NaviWork->minimapinfo_state = 0;
	NaviWork->minimapinfo_timer = 0;
}
static void minimapinfo_start(void)
{
	NaviWork->minimapinfo_enable = 1;

	if(NaviWork->minimapinfo_state == 1){
		NaviWork->minimapinfo_state = 2;
	}
}
static void minimapinfo_stop(void)
{
	BoxTransMap((u16*)MINIMAP_MAP_ADDR, MAPINFO_WIN_X1+1, MAPINFO_WIN_Y2-1,
			minimapinfo_erase_Map, 0, 0, 12, 1, 12);
	NaviWork->minimapinfo_enable = 0;
}
void TNaviBG_MinimapInfoTrans(void)
{
	switch(NaviWork->minimapinfo_state){
	case 0:
		{
			u16 width;

			if(++(NaviWork->minimapinfo_xpos) >= 48){
				NaviWork->minimapinfo_xpos = 0;
			}
			width = 48 - NaviWork->minimapinfo_xpos;
			if(width > 12){ width = 12; }

			if(NaviWork->minimapinfo_enable){
				BoxTransMap((u16*)MINIMAP_MAP_ADDR, MAPINFO_WIN_X1+1, MAPINFO_WIN_Y2-1,
						minimapinfo_Map, NaviWork->minimapinfo_xpos, 0, width, 1, 48);

				if(width < 12)
				{
					BoxTransMap((u16*)MINIMAP_MAP_ADDR, MAPINFO_WIN_X1+1+width, MAPINFO_WIN_Y2-1,
							minimapinfo_Map, 0, 0, (12-width), 1, 48);
				}
			}

			if((NaviWork->minimapinfo_xpos % 12) == 0)
			{
				NaviWork->minimapinfo_state = 1;
				NaviWork->minimapinfo_timer = 0;
			}
		}
		break;

	case 1:
		if(++(NaviWork->minimapinfo_timer) > 120)
		{
			NaviWork->minimapinfo_timer = 0;
			NaviWork->minimapinfo_state = 0;
		}
		break;

//	case 2:
//		BoxTransMap((u16*)MINIMAP_MAP_ADDR, MAPINFO_WIN_X1+1, MAPINFO_WIN_Y2-1,
//				minimapinfo_erase_Map, 0, 0, 12, 1, 12);
//		NaviWork->minimapinfo_state = 0;
//		NaviWork->minimapinfo_enable = 0;
//		break;

	case 2:
		{
			u16 width;

			width = 48 - NaviWork->minimapinfo_xpos;
			if(width > 12){ width = 12; }

			BoxTransMap((u16*)MINIMAP_MAP_ADDR, MAPINFO_WIN_X1+1, MAPINFO_WIN_Y2-1,
					minimapinfo_Map, NaviWork->minimapinfo_xpos, 0, width, 1, 48);

			if(width < 12)
			{
				BoxTransMap((u16*)MINIMAP_MAP_ADDR, MAPINFO_WIN_X1+1+width, MAPINFO_WIN_Y2-1,
						minimapinfo_Map, 0, 0, (12-width), 1, 48);
			}
			NaviWork->minimapinfo_state = 1;
		}

	}
}

/*====================================================================*/
/*   コンディション画面                                               */
/*====================================================================*/
// コンディション画面
#define  RADOR_B_MAP_BLOCK  (30)
#define  RADOR_B_CHAR_BLOCK (0)
#define  RADOR_B_MAP_ADDR   MAP_ADDR(RADOR_B_MAP_BLOCK)
#define  RADOR_B_CHAR_ADDR  (CHAR_ADDR(RADOR_B_CHAR_BLOCK)+0x5000)
#define  RADOR_B_PAL        PA_BG2

#define  RADOR_F_MAP_BLOCK  (23)
#define  RADOR_F_CHAR_BLOCK (0)
#define  RADOR_F_MAP_ADDR   MAP_ADDR(RADOR_F_MAP_BLOCK)
#define  RADOR_F_PAL        PA_BG3

static void init_radorw_win_param(void);

void TNaviBG_ConditionInit_Begin(void)
{
	NaviWork->initbg_prog = 0;
	if(NaviWork->comm_flg == FALSE){
		while(1){
			if(!TNaviBG_ConditionInit()){ return; }
		}
	}
}
u8 TNaviBG_ConditionInit(void)
{
	switch(NaviWork->initbg_prog){
	case 0:
		bgofs_reset();
		NaviWork->font_base_pal = 2;
		break;

	case 1:
		PrintScreenInit(TNAVI_TYPE);
		break;

	case 2:
		NMenuScreenInitStart(TNAVI_TYPE);
		break;

	case 3:
		if(!NMenuScreenInitMain()){
			return 1;
		}
		break;

	case 4:
		NMenuScreenClear();
		break;

	case 5:
		init_pokewin_bg_begin();
		break;

	case 6:
		if(init_pokewin_bg(0)){
			return 1;
		}
		break;

	case 7:
		// ＢＧ３（レーダー背景）
		LZ77UnCompVram((void*)rador_b_Character, (void*)RADOR_B_CHAR_ADDR);
		break;

	case 8:
		LZ77UnCompVram((void*)rador_b_Map, (void*)RADOR_B_MAP_ADDR);
		PaletteWorkSet(rador_b_Palette, RADOR_B_PAL, 0x20);
		break;

	case 9:
		if(NaviWork->condition_mode == CONDITION_MODE_SEARCH){
			BoxTransMap((u16*)RADOR_B_MAP_ADDR, LIST_RANK_X-1, LIST_RANK_Y-1, rador_rankbg_map, 0, 0, 9, 4, 9);
		}
		break;

	case 10:
		// ＢＧ２（レーダー）
		LZ77UnCompVram((void*)rador_f_Map, (void*)RADOR_F_MAP_ADDR);
		break;

	case 11:
		PaletteWorkSet(rador_f_Palette, RADOR_F_PAL, 0x20);
		PaletteWorkSet(rador_male_Palette, TNAVI_MALE_PAL, 0x20);
		PaletteWorkSet(rador_female_Palette, TNAVI_FEMALE_PAL, 0x20);
		init_radorw_win_param();
		break;

	case 12:
		TNaviBG_WriteConditionData(NaviWork->PokeSelNow);
		break;

	case 13:
		*(vu16 *)REG_BG3CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_3
		| RADOR_B_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| RADOR_B_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;

		*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_2
		| RADOR_F_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| RADOR_F_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;


		*(vu16 *)REG_BLDCNT = BLD_BG2_1ST | BLD_A_BLEND_MODE | BLD_BG3_2ND;
		*(vu16 *)REG_BLDALPHA = 0x040b;
		break;

	default:
		return 0;
	}
	NaviWork->initbg_prog++;
	return 1;
}
/***************************************
** レーダー表示オン・オフ
***************************************/
void TNaviBG_RadorOn(u8 on)
{
	if(on){
		*(vu16 *)REG_DISPCNT |= DISP_BG2_ON;
	}else{
		*(vu16 *)REG_DISPCNT &= ~DISP_BG2_ON;
	}
}
// ウィンドウパラメータ初期化
static void init_radorw_win_param(void)
{
	*(vu16*)REG_WIN0H = 240;
	*(vu16*)REG_WIN1H = RADOR_CX;
	*(vu16*)REG_WIN0V = (RADOR_TOP << 8) | RADOR_BOTTOM;
	*(vu16*)REG_WIN1V = (RADOR_TOP << 8) | RADOR_BOTTOM;
	*(vu16*)REG_WININ = 0x3f3f;   // 内部：全て表示
	*(vu16*)REG_WINOUT = 0x001B;  // 外部：BG2 以外を全て表示
}
/***************************************
** ポケモン名等のデータ描画
***************************************/
void TNaviBG_WriteConditionData(u16 num)
{
	NMenuMsgWrite(NaviWork->poke_name[num], POKENAME_X, POKENAME_Y);
	if(NaviWork->pokename_enable[num]){

		BoxTransMap((u16*)RADOR_B_MAP_ADDR, POKENAME_X+8, POKENAME_Y,
			rador_lv_map, 0, 0, 1, 2, 2);

	}

	if(NaviWork->condition_mode == CONDITION_MODE_SEARCH){
		NMenuMsgWrite(NaviWork->box_name[num], BOXNAME_X, BOXNAME_Y);
		TNaviSub_CopyRankStr(NaviWork->list_buf, NaviWork->sort_data[NaviWork->condition_poke_sel].rank);
		NMenuMsgWrite(NaviWork->list_buf, LIST_RANK_X, LIST_RANK_Y);
	}
}
/*====================================================================*/
/*   リスト                                                           */
/*====================================================================*/
#define SLFRAME_MAP_BLOCK   (29)
#define SLFRAME_CHAR_BLOCK  (2)
#define SLFRAME_MAP_ADDR    MAP_ADDR(SLFRAME_MAP_BLOCK)
#define SLFRAME_CHAR_ADDR   CHAR_ADDR(SLFRAME_CHAR_BLOCK)
#define SLFRAME_PAL         PA_BG3

#define SL_SCRTXT_MAP_BLOCK   (30)
#define SL_SCRTXT_CHAR_BLOCK  (0)

#define LISTCHAR_CHAR_ADDR  (CHAR_ADDR(SL_SCRTXT_CHAR_BLOCK)+0x5000)

#define SL_TEXT_PAL         PA_BG2
#define LISTCHAR_PAL        PA_BG4

#define TRAINER_DATA_PAL   PA_BG5

#define LIST_FONT_TYPE  (TNAVI4_TYPE)

/***************************************
**	初期化
***************************************/
void TNaviBG_ListInit_Begin(u8 mode)
{
	NaviWork->divide_prog = 0;
	NaviWork->list_mode = mode;
	if(NaviWork->comm_flg == FALSE){
		while(1){
			if(!TNaviBG_ListInit()){ return; }
		}
	}
}
u8 TNaviBG_ListInit(void)
{
	switch(NaviWork->divide_prog){
	case 0:
		bgofs_reset();
		NaviWork->list_ribbon_flg = (NaviWork->list_mode==LISTMODE_RIBBON);
		NaviWork->font_base_pal = SL_TEXT_PAL>>4;
		break;

	case 1:
		PrintScreenInit(LIST_FONT_TYPE);
		break;

	case 2:
		NMenuScreenInitStart(LIST_FONT_TYPE);
		break;

	case 3:
		if(!NMenuScreenInitMain()){
			return 1;
		}
		break;

	case 4:
		NMenuScreenClear();
		break;

	case 5:
		// ＢＧ２（フレーム）
		LZ77UnCompVram((void*)listframe_Map, (void*)SLFRAME_MAP_ADDR);
		break;

	case 6:
		LZ77UnCompVram((void*)listframe_Character, (void*)SLFRAME_CHAR_ADDR);
		break;

	case 7:
		// ＢＧ２（フレーム）
		PaletteWorkSet(listtxt_Palette, SL_TEXT_PAL, 0x20);
		PaletteWorkSet(listtxt_Palette, PA_BG15, 0x20);
		PaletteWorkSet(listchar_Palette, LISTCHAR_PAL, 0x20);

		if(NaviWork->list_mode == LISTMODE_CONDITION){
			PaletteWorkSet(slistframe_Palette, SLFRAME_PAL, 0x20);
			PaletteWork[0] = slistframe_Palette[5];

			PaletteWorkSet(list_male_Palette, TNAVI_MALE_PAL, 0x20);
			PaletteWorkSet(list_female_Palette, TNAVI_FEMALE_PAL, 0x20);

		}else if(NaviWork->list_mode == LISTMODE_RIBBON){
			PaletteWorkSet(rlistframe_Palette, SLFRAME_PAL, 0x20);
			PaletteWork[0] = rlistframe_Palette[5];

			PaletteWorkSet(list_male_Palette, TNAVI_MALE_PAL, 0x20);
			PaletteWorkSet(list_female_Palette, TNAVI_FEMALE_PAL, 0x20);

		}else{
			PaletteWorkSet(tlistframe_Palette, SLFRAME_PAL, 0x20);
			PaletteWork[0] = tlistframe_Palette[5];
			PaletteWorkSet(trainer_data_Palette, TRAINER_DATA_PAL, 0x20);
		}
		break;

	case 8:
		if(NaviWork->list_mode != LISTMODE_TRAINER){
			BoxTransMap((u16*)SLFRAME_MAP_ADDR, LIST_RANK_X-1, LIST_RANK_Y-1, list_rankwin_Map, 0, 0, 9, 4, 9);
		}else{
			BoxTransMap((u16*)SLFRAME_MAP_ADDR, LIST_PLACE_X, LIST_PLACE_Y-1, list_placewin_Map, 0, 0, 12, 10, 12);
			BoxTransMap((u16*)SLFRAME_MAP_ADDR, LIST_DATA_X-1, LIST_DATA_Y-1, list_datawin_Map, 0, 0, 12, 10, 12);
		}
		break;

	case 9:
		LZ77UnCompVram((void*)listchar_Character, (void*)LISTCHAR_CHAR_ADDR);
		break;

	case 10:
		// ＢＧ０（固定テキスト）
		DIV_DMACLEAR(3, 0, MAP_ADDR(31), 0x800, 16);
		break;

	case 11:
		init_list_begin();
		break;

	case 12:
		if(init_list_main()){
			return 1;
		}
		break;

	case 13:
		if(NaviWork->list_mode != LISTMODE_TRAINER){
			TNaviBG_WriteListRank();
		}else{
			write_battle_career(0);
			TNaviBG_UpdateTrainerTimei(NaviWork->list_rank);
		}
		break;

	case 14:
		*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_2
		| SLFRAME_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| SLFRAME_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;

		*(vu16 *)REG_BG3CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_3
		| 30 << BG_SCREEN_BASE_SHIFT
		| 0 << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;

		*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_1
		| 31 << BG_SCREEN_BASE_SHIFT
		| 0 << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;

		*(vu16 *)REG_BG3VOFS = 248;
		NaviWork->list_vofs = 248;
		NaviWork->list_ypos = 0;

		*(vu16 *)REG_BLDCNT = 0;
		NaviWork->initbg_prog++;
		return 0;

	default:
		return 0;
	}
	NaviWork->divide_prog++;
	return 1;
}
/***********************************************
**	リスト文字列スクロール
***********************************************/
void TNaviBG_ListScrollInit(s16 line)
{
	s16 ypos, sort_no;

	NaviWork->list_scroll_height = line * 16;
	NaviWork->list_scroll_spd = (line == 1 || line == -1)? 4 : 8;
	if(line < 0){
		NaviWork->list_scroll_spd *= -1;
		ypos = NaviWork->list_ypos + line*2;
		sort_no = NaviWork->list_top + line;
		if(sort_no < 0){
			sort_no += (NaviWork->list_max + 1);
		}
		line *= -1;
	}else{
		ypos = NaviWork->list_ypos + LIST_MAX*2;
		sort_no = NaviWork->list_bottom + 1;
	}

	if(sort_no > NaviWork->list_max){
		sort_no = 0;
	}
	ypos &= 31;

	write_list_init(sort_no, ypos, line);
}
u8 TNaviBG_ListScrollWait(void)
{
	if(write_list_main()){ return 1; }

	if(NaviWork->list_scroll_height == 0){
		return 0;
	}
	NaviWork->list_scroll_height -= NaviWork->list_scroll_spd;
	NaviWork->list_vofs += NaviWork->list_scroll_spd;
	NaviWork->list_vofs &= 0xff;
	*(vu16 *)REG_BG3VOFS = NaviWork->list_vofs;
	if(NaviWork->list_scroll_height == 0){
		NaviWork->list_ypos = ((NaviWork->list_vofs + 8) & 0xff) / 8;
		return 0;
	}
	return 1;
}
/***********************************************
**	順位文字列を描画
***********************************************/
void TNaviBG_WriteListRank(void)
{
	switch(NaviWork->list_mode){
	case LISTMODE_CONDITION:
		TNaviSub_CopyRankStr(NaviWork->list_buf, NaviWork->sort_data[NaviWork->list_rank].rank);
		break;
	case LISTMODE_RIBBON:
		TNaviSub_CopyPosStr(NaviWork->list_buf, NaviWork->list_rank+1);
		break;
	default:
		return;
	}

	NMenuContextChange(TNAVI2_TYPE);
	NMenuMsgWrite(NaviWork->list_buf, LIST_RANK_X, LIST_RANK_Y);
}
/***********************************************
**	カーソル位置／登録トレーナー数文字列を描画
**  line  ... 何行目を書く？
**            0     ... 全部
**            1～4  ... 各行のみ
***********************************************/
static void write_battle_career(u8 line)
{
	NMenuContextChange(TNAVI2_TYPE);

	switch(line){
	case 0:
	case 1:
		NMenuMsgWrite(TrainerEyeMsg0, LIST_DATA_X, LIST_DATA_Y);
		if(line != 0){ break; }

	case 2:
		PM_NumMsgSet(NaviWork->list_buf, NaviWork->list_max+1, NUM_MODE_SPACE, 5);
		NMenuMsgWrite(NaviWork->list_buf, LIST_DATA_X+4, LIST_DATA_Y+2);
		if(line != 0){ break; }

	case 3:
		NMenuMsgWrite(TrainerEyeMsg1, LIST_DATA_X, LIST_DATA_Y+4);
		if(line != 0){ break; }

	case 4:
		{
			u32 rec = GetRecord(CNT_TRAINER_BATTLE);
			if(rec > 99999){
				rec = 99999;
			}
			PM_NumMsgSet(NaviWork->list_buf, rec, NUM_MODE_SPACE, 5);
			NMenuMsgWrite(NaviWork->list_buf, LIST_DATA_X+4, LIST_DATA_Y+6);
		}
		break;
	}
}
static void erace_battle_career(void)
{
	u16 i;

	PM_strclear(NaviWork->trainer_winbuf,spc_,9);
	NMenuContextChange(TNAVI2_TYPE);
	for(i = 0; i < 4; i++){
		NMenuMsgWrite(NaviWork->trainer_winbuf, LIST_DATA_X, LIST_DATA_Y+i*2);
	}
}

/***********************************************************************
**	リスト用文字列を描画
***********************************************************************/
static void init_list_begin(void)
{
	s16 record;

	record = (NaviWork->list_bottom - NaviWork->list_top) + 1;

	// 件数が表示MAXに満たない時、空行を描く
	if(record < LIST_MAX){
		s16 y = record * 2;
		PM_strclear(NaviWork->list_buf, spc_, LIST_STR_MAX);
		while(y < LIST_MAX*2){
			NMenuMsgWrite(NaviWork->list_buf, LIST_X, y);
			y += 2;
		}
	}

	write_list_init(NaviWork->list_top, 0, record);

}
static u8 init_list_main(void)
{
	return write_list_main();
}
#define WRITE_LIST_MAX  (2) // １度に何件のリストデータを書くか？
static void write_list_init(u16 sort_no,  u16 ypos, u16 count)
{
	NaviWork->wl_sortno = sort_no;
	NaviWork->wl_ypos = ypos;
	NaviWork->wl_count = count;
	NaviWork->wl_prog = 0;
}
static u8 write_list_main(void)
{
	static void (* const func_tbl[])(u16, u16) = {
		write_list_line,
		write_list_line,
		write_list_line_trainer,
	};

	u16 i;

	if(NaviWork->wl_count == 0){ return 0; }

	for(i = 0; i < WRITE_LIST_MAX; i++){
		(func_tbl[NaviWork->list_mode])(NaviWork->wl_sortno, NaviWork->wl_ypos);
		if(--(NaviWork->wl_count) == 0){
			return 0;
		}
		if(++(NaviWork->wl_sortno) > NaviWork->list_max){
			NaviWork->wl_sortno = 0;
		}
		NaviWork->wl_ypos = (NaviWork->wl_ypos + 2) & 31;
		break;
	}

	return 1;

}

static void write_list_line(u16 sort_no, u16 ypos)
{
	u8 ribbon_flg;

	ribbon_flg = (NaviWork->list_ribbon_flg==0)? 2 : 1;

	NaviWork->list_buf[0] = spc_;
	TNaviSub_CopyPokeDatStr(NaviWork->list_buf+1, sort_no, ribbon_flg);

	NMenuContextChange(LIST_FONT_TYPE);
	NMenuMsgWrite(NaviWork->list_buf, LIST_X, ypos);
	BoxTransMap((u16*)MAP_ADDR(30), LIST_X+9, ypos, list_lv_Map, 0, 0, 1, 2, 1);
}
static void write_list_line_trainer(u16 sort_no, u16 ypos)
{
	TNaviSub_MakeTrainerStr(NaviWork->list_buf, sort_no);
	ypos &= 31;

	NMenuContextChange(LIST_FONT_TYPE);
	NMenuMsgWrite(NaviWork->list_buf, LIST_X, ypos);

	if(sort_no < NaviWork->trainer_count && NaviWork->trainer_data[sort_no].revenge_flag){
		BoxTransMap((u16*)MAP_ADDR(30), LIST_X+16, ypos, list_lamp_Map, 0, 0, 1, 2, 1);
	}else{
		BoxTransMap((u16*)MAP_ADDR(30), LIST_X+16, ypos, erace_lamp_Map, 0, 0, 1, 2, 1);
	}
}
/*===========================================================*/
/* トレーナーアイのリスト←→データ画面切り替え処理          */
/*===========================================================*/

//=================================================
//  リスト上から順に消去：初期化
//=================================================
void TNaviBG_EraseTrainerList_Begin(void)
{
	NaviWork->tr_prog = 0;
	NaviWork->divide_prog = 0;
	PM_strclear(NaviWork->list_buf, spc_, LIST_STR_MAX);
}
//=================================================
//  リスト上から順に消去：実行
//=================================================
u8   TNaviBG_EraseTrainerList(void)
{
	if(NaviWork->tr_prog > LIST_MAX){ return 0; }

	if(++(NaviWork->divide_prog) > 1)
	{
		u16 ypos;

		NaviWork->divide_prog = 0;

		if(NaviWork->tr_prog < LIST_MAX){

			ypos = (NaviWork->list_ypos + NaviWork->tr_prog * 2) & 31;

			if(NaviWork->tr_prog != NaviWork->list_cursor_pos){
				NMenuContextChange(LIST_FONT_TYPE);
				NMenuMsgWrite(NaviWork->list_buf, LIST_X, ypos);
			}

			if(NaviWork->tr_prog==0){
				erace_battle_career();
			}

//			if(NaviWork->tr_prog >= 4){
//				ypos = LIST_DATA_Y + (NaviWork->tr_prog - 4) * 2;
//				NMenuContextChange(TNAVI2_TYPE);
//				NMenuMsgWrite(NaviWork->trainer_winbuf, LIST_DATA_X, ypos);
//			}
			NaviWork->tr_prog++;

		}else{
			u16 i;
			NMenuContextChange(LIST_FONT_TYPE);
			ypos = (NaviWork->list_ypos + LIST_MAX*2) & 31;
			for(i = 0; i < LIST_MAX; i++){
				NMenuMsgWrite(NaviWork->list_buf, LIST_X, ypos);
				ypos = (ypos + 2) & 31;
			}
			NaviWork->tr_prog++;
			return 0;
		}
	}

	return 1;
//	ypos = NaviWork->list_ypos + LIST_MAX*2;
}
//=================================================
//  リスト上から順に表示
//=================================================
void TNaviBG_WriteTrainerList_Begin(void)
{
	NaviWork->tr_prog = 0;
	NaviWork->divide_prog = 0;

}
u8  TNaviBG_WriteTrainerList(void)
{
	if(NaviWork->tr_prog >= 8){ return 0; }

	if(++(NaviWork->divide_prog) > 1){
		NaviWork->divide_prog = 0;
		NMenuContextChange(LIST_FONT_TYPE);

		write_list_line_trainer(
			NaviWork->list_top +  NaviWork->tr_prog,
			NaviWork->list_ypos + NaviWork->tr_prog * 2
		);

		if(++(NaviWork->tr_prog) >= 8)
		{
			write_battle_career(0);
			return 0;
		}
	}
	return 1;
}
//=================================================
//  データ上から順に表示
//=================================================

void TNaviBG_WriteTrainerInfo_Begin(void)
{
	const u8 *cp;
	u16 num, i;

	NaviWork->divide_prog = 0;
	NaviWork->tr_prog = 0;

	num = NaviWork->trainer_data[NaviWork->list_rank].regist_id;

	cp = NaviWork->trainer_info[0] = EyeMsgTbl[num];
	for(i = 0; i < 3; i++){
		while(*cp != EOM_){ cp++; }
		NaviWork->trainer_info[i+1] = ++cp;
	}
}
u8 TNaviBG_WriteTrainerInfo(void)
{
	if(NaviWork->tr_prog == 7){ return 0; }

	if(++(NaviWork->divide_prog) > 1)
	{
		u16 ypos;

		NaviWork->divide_prog = 0;
		NMenuContextChange(LIST_FONT_TYPE);
		ypos = (NaviWork->list_ypos+2+NaviWork->tr_prog*2) & 31;


		switch(NaviWork->tr_prog){
		case 0:
			NMenuMsgWrite(TrainerEyeCaption0, LIST_X, ypos);
			break;
		case 1:
			NaviWork->list_buf[0] = spc_;
			PM_strcpy_clear(NaviWork->list_buf+1, NaviWork->trainer_info[0], spc_, 15);
			NMenuMsgWrite(NaviWork->list_buf, LIST_X, ypos);
			break;
		case 2:
			NMenuMsgWrite(TrainerEyeCaption1, LIST_X, ypos);
			break;
		case 3:
			NaviWork->list_buf[0] = spc_;
			PM_strcpy_clear(NaviWork->list_buf+1, NaviWork->trainer_info[1], spc_, 15);
			NMenuMsgWrite(NaviWork->list_buf, LIST_X, ypos);
			break;
		case 4:
			NMenuMsgWrite(TrainerEyeCaption2, LIST_X, ypos);
			break;
		case 5:
			NaviWork->list_buf[0] = spc_;
			PM_strcpy_clear(NaviWork->list_buf+1, NaviWork->trainer_info[2], spc_, 15);
			NMenuMsgWrite(NaviWork->list_buf, LIST_X, ypos);
			break;
		case 6:
			NaviWork->list_buf[0] = spc_;
			PM_strcpy_clear(NaviWork->list_buf+1, NaviWork->trainer_info[3], spc_, 15);
			NMenuMsgWrite(NaviWork->list_buf, LIST_X, ypos);
			return 0;

		default:
			return 0;
		}
		NaviWork->tr_prog++;
	}
	return 1;
}
//=================================================
//  データ上から順に消去
//=================================================
void TNaviBG_EraseTrainerInfo_Begin(void)
{
	NaviWork->divide_prog = 0;
	NaviWork->tr_prog = 0;

	PM_strclear(NaviWork->list_buf, spc_, 16);
}
u8 TNaviBG_EraseTrainerInfo(void)
{
	if(NaviWork->tr_prog >= 7)
	{
		return 0;
	}

	if(++(NaviWork->divide_prog) > 1)
	{
		u16 ypos;
		NaviWork->divide_prog = 0;
		ypos = (NaviWork->list_ypos+2+NaviWork->tr_prog*2)&31;
		NMenuContextChange(LIST_FONT_TYPE);
		NMenuMsgWrite(NaviWork->list_buf, LIST_X, ypos);
		NaviWork->tr_prog++;
	}
	return 1;
}
//=================================================
//  データ表示←→リスト表示切り替えスクロール
//=================================================
void TNaviBG_ToDataScroll_Init(void)
{

	s16 line;
	line = NaviWork->list_cursor_pos;
	NaviWork->list_scroll_height = line * 16;
	NaviWork->list_scroll_spd = (line == 1)? 4 : 8;
}

void TNaviBG_ToListScroll_Init(void)
{
	s16 line;
	line = NaviWork->list_cursor_pos * -1;
	NaviWork->list_scroll_height = line * 16;
	NaviWork->list_scroll_spd = (line == -1)? -4 : -8;
}
u8 TNaviBG_TrainerList_Scroll(void)
{
	return TNaviBG_ListScrollWait();
}
//=================================================
//  トレーナーがいる地名を表示
//=================================================
extern u8* CopyMapName(u8 *buf, u16 div, u16 size);

void TNaviBG_UpdateTrainerTimei(u8 sort_no)
{
	u8* cp;
	u16 len, i;

	cp = CopyMapName(NaviWork->list_buf, NaviWork->trainer_data[sort_no].Wpos, 0);
	len = cp - NaviWork->list_buf;

	for(i = 0; (i+len) < 10; i++){
		NaviWork->trainer_timei_buf[i] = spc_;
	}
	PM_strcpy(NaviWork->trainer_timei_buf+i, NaviWork->list_buf);

	NMenuContextChange(TNAVI2_TYPE);
	NMenuMsgWrite(NaviWork->trainer_timei_buf,LIST_PLACE_X,LIST_PLACE_Y);
}
//=================================================
//  再戦ランプのオン・オフを切り替え（データ画面）
//=================================================
void TNaviBG_UpdateTrainerName(void)
{
	write_list_line_trainer(NaviWork->list_rank, NaviWork->list_ypos);
}

/*====================================================================*/
/*   リボン画面                                                       */
/*====================================================================*/
#define RIBBONBG_MAP_BLOCK   (23)
#define RIBBONBG_CHAR_BLOCK  (2)
#define RIBBONBG_MAP_ADDR    MAP_ADDR(RIBBONBG_MAP_BLOCK)
#define RIBBONBG_CHAR_ADDR   CHAR_ADDR(RIBBONBG_CHAR_BLOCK)
#define RIBBONBG_PAL         PA_BG2

#define REDUCT_RIBBON_CHARNO_BEGIN    (16)  // 縮小ﾘﾎﾞﾝｷｬﾗ展開先ｷｬﾗﾅﾝﾊﾞｰ
#define REDUCT_RIBBON_CHAR_ADDR       (RIBBONBG_CHAR_ADDR)+(REDUCT_RIBBON_CHARNO_BEGIN*32)
#define REDUCT_RIBBON_PAL             PA_BG3
#define REDUCT_RIBBON_PALNO           3

#define REDUCT_RIBBON_CELLX   (11)
#define REDUCT_RIBBON_CELLY   (4)

#define RIBBONBG_POKENAME_X (14)
#define RIBBONBG_POKENAME_Y (1)
#define RIBBONBG_INFO_X     (12)
#define RIBBONBG_INFO_Y     (13)
#define RIBBONBG_INFO_X2    (27)
#define RIBBONBG_INFO_Y2    (16)
#define RIBBONBG_RANK_X     (1)
#define RIBBONBG_RANK_Y     (5)


/***********************************************
**	初期化
***********************************************/
u8 TNaviBG_RibonInit(void)
{
	switch(NaviWork->initbg_prog){
	case 0:
		bgofs_reset();
		NaviWork->font_base_pal = 15;
		break;

	case 1:
		PrintScreenInit(TNAVI3_TYPE);
		break;

	case 2:
		NMenuScreenInitStart(TNAVI3_TYPE);
		break;

	case 3:
		if(!NMenuScreenInitMain()){
			return 1;
		}
		break;

	case 4:
		NMenuScreenClear();
		break;

	case 5:
		// ＢＧ０（ポケモンウィンドウ）
		init_pokewin_bg_begin();
		break;

	case 6:
		if(init_pokewin_bg(1)){
			return 1;
		}
		break;

	case 7:
//		LZ77UnCompVram((void*)ribonbg_Map, (void*)RIBBONBG_MAP_ADDR);
		LZ77UnCompWram((void*)ribonbg_Map, (void*)(NaviWork->ribbon_map_work));
		break;

	case 8:
		TNaviBG_RibbonMapMake();
		break;

	case 9:
		TNaviBG_RibbonMapTrans();
		break;

	case 10:
		LZ77UnCompVram((void*)ribonbg_Character, (void*)RIBBONBG_CHAR_ADDR);
		break;

	case 11:
		LZ77UnCompVram((void*)reduction_ribbon_Character, (void*)REDUCT_RIBBON_CHAR_ADDR);
		break;

	case 12:
		PaletteWorkSet(ribonbg_Palette, RIBBONBG_PAL, 0x20);
		PaletteWorkSet(ribonbg_font_Palette, PA_BG15, 0x20);
		PaletteWorkSet(ribbon_Palette, REDUCT_RIBBON_PAL, 0x20*5);
		PaletteWorkSet(ribonbg_male_Palette, TNAVI_MALE_PAL, 0x20);
		PaletteWorkSet(ribonbg_female_Palette, TNAVI_FEMALE_PAL, 0x20);
		break;

	case 13:
		TNaviBG_WriteRibbonPokeInfo();
		break;

	case 14:
		// BG2 ﾃｷｽﾄ
		*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_2
		| 30 << BG_SCREEN_BASE_SHIFT
		| 0  << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;

		// BG3 背景
		*(vu16 *)REG_BG3CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_3
		| RIBBONBG_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| RIBBONBG_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;

		*(vu16 *)REG_BLDCNT = 0;
		NaviWork->initbg_prog++;
		return 0;

	default:
		return 0;
	}

	NaviWork->initbg_prog++;
	return 1;

}
//======================================================
// 縮小リボン用マップデータ作成
//======================================================
//#define REDUCT_RIBBON_CELLX   (4)
//#define REDUCT_RIBBON_CELLY   (11)
//extern const u16 RibbonCellPalData[RIBBON_NUM_MAX][2];

#define MAPDATA_MAKE(p,c,h,v)  (((p)<<12) | ((v)<<11) | ((h)<<10) | (c))

void TNaviBG_RibbonMapMake(void)
{
	u16 i, mapno;
	u8  type, palno, charno, gameribbon_cnt;

	mapno = (REDUCT_RIBBON_CELLY * 32) + REDUCT_RIBBON_CELLX;
	gameribbon_cnt = NaviWork->ribbon_cnt - NaviWork->event_ribbon_cnt;

	//リボンの領域をクリア
	for(i = 0; i < RIBBON_FRAME_Y*2; i++){
		CpuClear(0x2000,&(NaviWork->ribbon_map_work[mapno+i*32]),2*2*RIBBON_FRAME_X,16);
	}

	for(i = 0; i < gameribbon_cnt; i++){
		type = NaviWork->ribbon_type[i];
		palno = REDUCT_RIBBON_PALNO + RibbonCellPalData[type][1];
		charno = REDUCT_RIBBON_CHARNO_BEGIN + RibbonCellPalData[type][0] * 2;
		NaviWork->ribbon_map_work[mapno] = MAPDATA_MAKE(palno,charno,0,0);
		NaviWork->ribbon_map_work[mapno+1] = MAPDATA_MAKE(palno,charno,1,0);
		NaviWork->ribbon_map_work[mapno+32] = MAPDATA_MAKE(palno,charno+1,0,0);
		NaviWork->ribbon_map_work[mapno+33] = MAPDATA_MAKE(palno,charno+1,1,0);
		if(((i+1)%9)==0){
			mapno += 48;
		}else{
			mapno += 2;
		}
	}

	mapno = ((REDUCT_RIBBON_CELLY + 6)* 32) + REDUCT_RIBBON_CELLX;
	for(i = 0; i < NaviWork->event_ribbon_cnt; i++)
	{
		type = NaviWork->ribbon_type[gameribbon_cnt + i];
		palno = REDUCT_RIBBON_PALNO + RibbonCellPalData[type][1];
		charno = REDUCT_RIBBON_CHARNO_BEGIN + RibbonCellPalData[type][0] * 2;
		NaviWork->ribbon_map_work[mapno] = MAPDATA_MAKE(palno,charno,0,0);
		NaviWork->ribbon_map_work[mapno+1] = MAPDATA_MAKE(palno,charno,1,0);
		NaviWork->ribbon_map_work[mapno+32] = MAPDATA_MAKE(palno,charno+1,0,0);
		NaviWork->ribbon_map_work[mapno+33] = MAPDATA_MAKE(palno,charno+1,1,0);
		mapno += 2;
	}
}
void TNaviBG_RibbonMapTrans(void)
{
	DIV_DMACOPY(3,NaviWork->ribbon_map_work,RIBBONBG_MAP_ADDR,2*32*20,32);
	PaletteWork[0] = ribonbg_Palette[14];  // 最下ＢＧが透過してしまうため
}
/***********************************************
**	ポケモン名、ランク文字列描画
***********************************************/
void TNaviBG_WriteRibbonPokeInfo(void)
{
	NMenuMsgWrite(NaviWork->poke_name[0], RIBBONBG_POKENAME_X, RIBBONBG_POKENAME_Y);
	BoxTransMap((u16*)RIBBONBG_MAP_ADDR, RIBBONBG_POKENAME_X+8, RIBBONBG_POKENAME_Y, ribonbg_lv_Map, 0, 0, 1, 2, 1);

	TNaviSub_CopyPosStr(NaviWork->list_buf, NaviWork->list_rank+1);

	NMenuMsgWrite(NaviWork->list_buf, RIBBONBG_RANK_X, RIBBONBG_RANK_Y);
}
void TNaviBG_EraceRibbonPokeInfo(void)
{
	PM_strclear(NaviWork->list_buf,spc_,16);
	NMenuMsgWrite(NaviWork->list_buf,RIBBONBG_POKENAME_X,RIBBONBG_POKENAME_Y);
	NMenuMsgWrite(NaviWork->list_buf,RIBBONBG_INFO_X,RIBBONBG_INFO_Y);
	NMenuMsgWrite(NaviWork->list_buf,RIBBONBG_INFO_X,RIBBONBG_INFO_Y+2);
}
/***********************************************
**	カーソルの指している説明テキスト描画
***********************************************/
void TNaviBG_WriteRibonInfo(void)
{
	static u16 type = 0;

	// 最下行以外なら通常リボン
	if(NaviWork->ribbon_cursor_y < (RIBBON_FRAME_Y-1)){
		type = NaviWork->ribbon_cursor_y*RIBBON_FRAME_X + NaviWork->ribbon_cursor_x;
		type = NaviWork->ribbon_type[type];

		PM_strcpy_clear(NaviWork->ribbon_info_buf[0], RibbonMsgTbl[type][0], spc_, RIBBON_INFO_MAXLEN);
		PM_strcpy_clear(NaviWork->ribbon_info_buf[1], RibbonMsgTbl[type][1], spc_, RIBBON_INFO_MAXLEN);

	// 最下行ならイベントリボン
	}else{
//		type = NaviWork->event_ribbon_cnt - NaviWork->ribbon_cnt;
		type = NaviWork->ribbon_cnt - NaviWork->event_ribbon_cnt;
		type = NaviWork->ribbon_type[type + NaviWork->ribbon_cursor_x];
		type = Fld.ExRibbonNo[type-EVENT_RIBBON_BORDER];
		if(type>0){
			type--;
			PM_strcpy_clear(NaviWork->ribbon_info_buf[0], EventRibbonInfoTbl[type][0], spc_, RIBBON_INFO_MAXLEN);
			PM_strcpy_clear(NaviWork->ribbon_info_buf[1], EventRibbonInfoTbl[type][1], spc_, RIBBON_INFO_MAXLEN);
		}else{
			PM_strclear(NaviWork->ribbon_info_buf[0], spc_, RIBBON_INFO_MAXLEN);
			PM_strclear(NaviWork->ribbon_info_buf[1], spc_, RIBBON_INFO_MAXLEN);
		}

	}

	NMenuMsgWrite(NaviWork->ribbon_info_buf[0], RIBBONBG_INFO_X, RIBBONBG_INFO_Y);
	NMenuMsgWrite(NaviWork->ribbon_info_buf[1], RIBBONBG_INFO_X, RIBBONBG_INFO_Y+2);
}
/***********************************************
**	選択しているポケモンのリボン個数を表示
***********************************************/
void TNaviBG_WriteRibbonCount(void)
{
	u8 *cp;

	NMenuBoxClear(RIBBONBG_INFO_X, RIBBONBG_INFO_Y, RIBBONBG_INFO_X2, RIBBONBG_INFO_Y2);

	cp = PM_strcpy(NaviWork->list_buf, PN_ribbon_str);
	*cp++ = spc_;
	cp = PM_NumMsgSet(cp,NaviWork->sort_data[NaviWork->condition_poke_sel].param,NUM_MODE_LEFT,2);
	*cp++ = ko_;
	*cp = EOM_;
	NMenuMsgWrite(NaviWork->list_buf, RIBBONBG_INFO_X, RIBBONBG_INFO_Y);
}

/*====================================================================*/
/*   ポケモンウィンドウ（コンディション・リボン共用）                 */
/*====================================================================*/
#define  POKEWIN_MAP_BLOCK   (29)
#define  POKEWIN_CHAR_BLOCK  (3)
#define  POKEWIN_MAP_ADDR    MAP_ADDR(POKEWIN_MAP_BLOCK)
#define  POKEWIN_CHAR_ADDR   (CHAR_ADDR(POKEWIN_CHAR_BLOCK)+0x2000)
#define  POKEWIN_PAL         (PA_BG13)
/**************************************/
/* 初期化                             */
/**************************************/
static void init_pokewin_bg_begin(void)
{
	NaviWork->pokewin_prog = 0;
}
static u8 init_pokewin_bg(u8 ribon_flg)
{
	switch(NaviWork->pokewin_prog){
	case 0:
//		DIV_DMACLEAR(3, 0, POKEWIN_MAP_ADDR, 0x800, 16);
		break;

	case 1:
		LZ77UnCompVram((void*)pokewin_Map, (void*)POKEWIN_MAP_ADDR);
		break;

	case 2:
		DIV_DMAARRAYCOPY(3, pokewin_Character, POKEWIN_CHAR_ADDR, 16);
		break;

	case 3:
		if(ribon_flg==0){
			PaletteWorkSet(pokewin_Palette, POKEWIN_PAL, 0x20);
		}else{
			PaletteWorkSet(ribon_pokewin_Palette, POKEWIN_PAL, 0x20);
		}
		NaviWork->pokewin_vofs = -80;

	// ＢＧ０（ポケモンウィンドウ）
		*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_1
		| POKEWIN_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| POKEWIN_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;

		NaviWork->pokewin_prog++;
		return 0;

	default:
		return 0;
	}

	NaviWork->pokewin_prog++;
	return 1;


}
/****************************************
** ポケモンウィンドウスクロール
****************************************/
#define POKEWIN_SPEED  (16)
u8 TNaviBG_PokeWinUp(void)
{
	NaviWork->pokewin_vofs += POKEWIN_SPEED;
	if(NaviWork->pokewin_vofs > 0){
		NaviWork->pokewin_vofs = 0;
	}
//	*(vu16 *)REG_BG0VOFS = NaviWork->pokewin_vofs;
	return NaviWork->pokewin_vofs != 0;
}
u8 TNaviBG_PokeWinDown(void)
{
	NaviWork->pokewin_vofs -= POKEWIN_SPEED;
	if(NaviWork->pokewin_vofs < -80){
		NaviWork->pokewin_vofs = -80;
	}
//	*(vu16 *)REG_BG0VOFS = NaviWork->pokewin_vofs;
	return NaviWork->pokewin_vofs != -80;
}



/*====================================================================*/
/*   キューブデモ用ＢＧ初期化                                         */
/*====================================================================*/
#define SEIKAKU_X  (0)
#define SEIKAKU_Y  (14)
#define SEIKAKU_WIN_X  (0)
#define SEIKAKU_WIN_Y  (SEIKAKU_Y-1)

u8 TNaviBG_CubeDemoInit(void)
{
	switch(NaviWork->initbg_prog){
	case 0:
		bgofs_reset();
		NaviWork->font_base_pal = 2;
		break;

	case 1:
		init_pokewin_bg_begin();
		break;

	case 2:
		if(init_pokewin_bg(0)){
			return 1;
		}
		break;

	case 3:
		// ＢＧ３（レーダー背景）
		LZ77UnCompVram((void*)rador_b_Character, (void*)RADOR_B_CHAR_ADDR);
		break;

	case 4:
		LZ77UnCompVram((void*)rador_b_Map, (void*)RADOR_B_MAP_ADDR);
		PaletteWorkSet(rador_b_Palette, RADOR_B_PAL, 0x20);
		break;

	case 5:
		BoxTransMap((u16*)RADOR_B_MAP_ADDR, SEIKAKU_WIN_X, SEIKAKU_WIN_Y, rador_seikaku_win_map, 0, 0,11, 4, 11);
		break;

	case 6:
		// ＢＧ２（レーダー）
		LZ77UnCompVram((void*)rador_f_Map, (void*)RADOR_F_MAP_ADDR);
		break;

	case 7:
		PaletteWorkSet(rador_f_Palette, RADOR_F_PAL, 0x20);
		PaletteWorkSet(rador_male_Palette, TNAVI_MALE_PAL, 0x20);
		PaletteWorkSet(rador_female_Palette, TNAVI_FEMALE_PAL, 0x20);
		init_radorw_win_param();
		break;

	case 8:
		TNaviBG_WriteConditionData(NaviWork->PokeSelNow);
		break;

	case 9:
		*(vu16 *)REG_BG3CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_3
		| RADOR_B_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| RADOR_B_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;

		*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_2
		| RADOR_F_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
		| RADOR_F_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 ;


		*(vu16 *)REG_BLDCNT = BLD_BG2_1ST | BLD_A_BLEND_MODE | BLD_BG3_2ND;
		*(vu16 *)REG_BLDALPHA = 0x040b;
		break;

	default:
		return 0;
	}
	NaviWork->initbg_prog++;
	return 1;
}
/*====================================================================*/
/*   選択されているポケモンの性格文字列を描画（キューブデモ）         */
/*====================================================================*/
extern const u8 * const SeikakuMsgTbl[];
extern u8 CubedemoSelnoToPokeno(u8 selno);

void TNaviBG_PokeSeikakuWrite(void)
{
	if(NaviWork->sort_data[NaviWork->condition_poke_sel].enable){
		u8 *cp;
		u8 pokeno, msg_no;

		pokeno = CubedemoSelnoToPokeno(NaviWork->condition_poke_sel);
		msg_no = PokeSeikakuGet(PokeParaMine + pokeno);

		cp = PM_strcpy(NaviWork->list_buf, CubeDemoSeikakuStr);
		PM_strcpy_clear(cp, SeikakuMsgTbl[msg_no], spc_, 5);

	}else{
		PM_strclear(NaviWork->list_buf, spc_, 10);
	}

	NMenuMsgWrite(NaviWork->list_buf, SEIKAKU_X, SEIKAKU_Y);
}
