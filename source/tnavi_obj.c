/***********************************************************************
**	トレナビ（ＯＢＪ処理）
***********************************************************************/
#include "tnavi_com.h"
#include "decord.h"
#include "objdata.h"
#include "a_enemy.h"
#include "marking.h"
#include "mus_tool.h"
#include "MaDefine.h"
#include "ev_fight.h"
#include "poketool.h"
#include "boxsub.h"
#include "tnavi_obj.dat"

/*============================================*/
/*	レイアウト                                */
/*============================================*/
#define MAINMENU_X     (166)
#define MAINMENU_Y     (30)
#define MAINMENU_YDIFF (32)

#define CONDITIONMENU_X         (166)
#define CONDITIONMENU_Y         (30)
#define CONDITIONMENU_YDIFF     (32)
#define CONDITION_MODORUMENU_Y  (126)

#define SEARCHMENU_X         (166)
#define SEARCHMENU_Y         (30)
#define SEARCHMENU_XDIFF     (48)
#define SEARCHMENU_YDIFF     (32)

#define BALL_X     (226)
#define BALL_Y     (8)
#define BALL_YDIFF (20)

#define POKE_X     (38)
#define POKE_Y     (104)

#define MENU_X       (166)
#define TAG_Y       (30)
#define MENU_DIFF_Y  (30)
#define TAG_HIDE_X  (256)
#define TAG_DISP_X  (152)

/*=================================================*/
/*	セルＩＤ、パレットＩＤ、アクタープライオリティ */
/*=================================================*/
enum TNAVI_CELLID {
	CELLID_TAG = 0,
	CELLID_LABEL,
	CELLID_LABEL_SEARCH,
	CELLID_BALL,
	CELLID_DOT,
	CELLID_MODORU,
	CELLID_POKEIMG,
	CELLID_MAPCURSOR,
	CELLID_MAPJIKI,
	CELLID_LISTCURSOR,
	CELLID_LISTARROW,
	CELLID_RIBBON1,
	CELLID_RIBBON2,
	CELLID_RIBBON3,
	CELLID_RIBBON4,
	CELLID_RIBBON5,
	CELLID_RIBBON6,
	CELLID_RIBBON7,
	CELLID_RIBBON8,
	CELLID_RIBBON9,
	CELLID_RIBBON10,
	CELLID_RIBBON11,
	CELLID_RIBBON12,
	CELLID_KIRA,
	CELLID_ICON,
	CELLID_LAMP,
	CELLID_OBI,

	// 最後に置くこと↓
	CELLID_MARK_STATE, 
	CELLID_MARK_WIN,

};
enum TNAVI_PALID {
	PALID_TAG = 0,
	PALID_TAG2,
	PALID_LABEL,
	PALID_LABEL2,
	PALID_CONDITION,
	PALID_CONDITION_OFF,
	PALID_POKEIMG,
	PALID_MAPCURSOR,
	PALID_MAPJIKI,
	PALID_LISTCURSOR,
	PALID_RIBBON1,
	PALID_RIBBON2,
	PALID_RIBBON3,
	PALID_RIBBON4,
	PALID_RIBBON5,
	PALID_KIRA,
	PALID_ICON,
	PALID_LAMP,
	PALID_OBI,

	// 最後に置くこと↓
	PALID_MARK_WIN,
	PALID_MARK_WIN2,
	PALID_MARK_STATE,
};
enum TNAVI_ACTPRI {
	ACTPRI_NAVIICON = 0,
	ACTPRI_RIBBON100,
	ACTPRI_RIBBON50,
};

/*====================================================================*/
/*   メニュータグ                                                     */
/*====================================================================*/
static void add_tagimg_cell(u8 type);
static void add_tagimg_pal(u8 type);

static void add_label_cell(u8 type);
static void add_label_actor(u8 type);

static u8 check_tag_wait(void);
static void del_tag_actor(actWork *act);
static u8 check_tag_moved_nosel(void);
static u8 check_tag_moved_sel(void);
static void tag_selanm_on(void);
static void tag_selanm_off(void);
static void tag_delanm_on(void);
static void tag_delanm_off(void);

static void tagmove_select(actWork *act);
static void tagmove_appear(actWork *act);
static void tagmove_disappear(actWork *act);

static const actHeader TagHeader;
static const actAffAnm * const TagAffineTbl[];

enum TAG_WORK {
	TAGWK_ROW,
	TAGWK_COL,
	TAGWK_DISP_X,
	TAGWK_HIDE_X,
	TAGWK_AX,
	TAGWK_EX,
};
#define TAG_MAX    (6)
#define TAG_SPEED  (8)
#define TAGDEL_16

/*******************************************************
**  全初期化                                          **
*******************************************************/
void TNaviObj_TagInitBegin(void)
{
	NaviWork->divide_prog = 0;
	if(NaviWork->comm_flg == FALSE)
	{
		while(1){
			if(!TNaviObj_TagInit()){ return; }
		}
	}
}
u8 TNaviObj_TagInit(void)
{
	switch(NaviWork->divide_prog){
	case 0:
		{
			u16 i, j;
			for(i = 0; i < TAG_MAX; i++){
				for(j = 0; j < 4; j++){
					NaviWork->tag_actor[i][j] = NULL;
				}
			}
			NaviWork->tag_effect = 0;
		}
		break;

	case 1:
		LZ77UnCompWram(maintag_Character, NaviWork->maintag_char);
		break;

	case 2:
		LZ77UnCompWram(contag_Character, NaviWork->contag_char);
		break;

	case 3:
		LZ77UnCompWram(schtag_Character, NaviWork->schtag_char);
		return 0;
	}

	NaviWork->divide_prog++;

	return 1;
}
/*******************************************************
**  出現                                              **
*******************************************************/
void TNaviObj_AddTagInit_Begin(u8 type)
{
	NaviWork->divide_prog = 0;
	if(NaviWork->comm_flg == FALSE)
	{
		while(1)
		{
			if(!TNaviObj_AddTagInit(type)){ return; }
		}
	}
}
// 出現初期化  type   メニュータイプ（enum MENU_TYPE）
u8 TNaviObj_AddTagInit(u8 type)
{
	switch(NaviWork->divide_prog){
	case 0:
		add_tagimg_cell(type);
		break;

	case 1:
		add_tagimg_pal(type);
		break;

	case 2:
		{
			u16 i, j, c, no;
			u16 yofs, ydiff, win_y;

			switch(type){
			case MENUTYPE_MAIN:
				yofs = 42; ydiff = 20; NaviWork->tag_cnt = 5; break;
			case MENUTYPE_CONDITION:
				yofs = 56; ydiff = 20; NaviWork->tag_cnt = 3; break;
			case MENUTYPE_SEARCH:
				yofs = 40; ydiff = 16; NaviWork->tag_cnt = 6; break;
			default:
				return 0;
			}

			c = 0;
			for(i = 0; i < NaviWork->tag_cnt; i++){
				win_y = (yofs+ydiff*i)-8;
				NaviWork->tag_win_v[i] = (win_y << 8) | (win_y + 17);

				if(type==MENUTYPE_MAIN)
				{
					if(NaviWork->mainmenu_contents[i] == MAINMENU_NULL)
					{
						for(j = 0; j < 4; j++){
							NaviWork->tag_actor[i][j]=NULL;
						}
						continue;
					}
					c = (NaviWork->mainmenu_contents[i] - 1)*4;
				}

				for(j = 0; j < 4; j++){
					no = AddActor(&TagHeader, TAG_HIDE_X+j*32, yofs+ydiff*i, 0);
					if(no != ACT_MAX){
						NaviWork->tag_actor[i][j] = &ActWork[no];
						NaviWork->tag_actor[i][j]->work[TAGWK_ROW] = i;
						NaviWork->tag_actor[i][j]->work[TAGWK_COL] = j;
						NaviWork->tag_actor[i][j]->work[TAGWK_DISP_X] = TAG_DISP_X+j*32;
						NaviWork->tag_actor[i][j]->work[TAGWK_HIDE_X] = TAG_HIDE_X+j*32;
						ActAnmChg(NaviWork->tag_actor[i][j], c++);
						if(type==MENUTYPE_SEARCH || type==MENUTYPE_MAIN)
						{
							if( i >= 3 ){
								NaviWork->tag_actor[i][j]->oamData.Pltt = ObjPalNumGet(PALID_TAG2);
							}
						}
					}else{
						return 0;
					}
				}

			}
		}
		break;

	default:
		return 0;
	}

	NaviWork->divide_prog++;
	return 1;
}
// 出現開始
void TNaviObj_AddTagRun(void)
{
	u16 i, j;
	for(i = 0; i < NaviWork->tag_cnt; i++){
		for(j = 0; j < 4; j++){
			if(NaviWork->tag_actor[i][j] != NULL){
				NaviWork->tag_actor[i][j]->move = tagmove_appear;
			}
		}
	}
	SePlay(SE_WIN_OPEN);
}
// 出現待ち（０で終了）
u8 TNaviObj_AddTagWait(void)
{
	if(check_tag_wait()){
		tag_selanm_on();
		return 0;
	}
	return 1;
}
u8 TNaviObj_MoveTagWait(void)
{
	return (check_tag_wait())? 0 : 1;
}
/*******************************************************
**  削除                                              **
*******************************************************/
// 削除開始
void TNaviObj_DelTagInit(void)
{
	u16 i, j;

	NaviWork->tag_prog = 0;
	tag_selanm_off();

	for(i = 0; i < NaviWork->tag_cnt; i++){
		if(i == NaviWork->menu_sel){ continue; }
		for(j = 0; j < 4; j++){
			if(NaviWork->tag_actor[i][j] != NULL){
				NaviWork->tag_actor[i][j]->move = tagmove_disappear;
			}
		}
	}
}
// 削除待ち（０で終了）
u8 TNaviObj_DelTagWait(void)
{
	switch(NaviWork->tag_prog){
	case 0:
		if(check_tag_moved_nosel()){
			u16 i;
			actWork *act;
			for(i = 0; i < 4; i++){
				act = NaviWork->tag_actor[NaviWork->menu_sel][i];
				act->oamData.AffineMode = 3;
				act->aff_tbl = TagAffineTbl;
				AffineNumSet(act);
				act->work[TAGWK_AX] = i * 4 - 6;
			#ifdef TAGDEL_16
				act->work[TAGWK_AX] /= 2;
			#endif
				act->work[TAGWK_EX] = act->work[TAGWK_AX] * 8;
				act->move = tagmove_disappear;
			}
			tag_delanm_on();
			NaviWork->tag_prog++;
		}
		break;

	case 1:
		if(check_tag_moved_sel()){
			tag_delanm_off();
			CellDel(CELLID_TAG);
			ObjPalRegNumDel(PALID_TAG);
			ObjPalRegNumDel(PALID_TAG2);
			return 0;
		}
	}
	return 1;
}
/*******************************************************
**  エフェクト                                        **
*******************************************************/
void TNaviObj_TagEffect(void)
{
	// 選択タグのみ光る
	if(NaviWork->tag_effect == 1){
		*(vu16*)REG_WIN0V = NaviWork->tag_win_v[NaviWork->menu_sel];
		*(vu16 *)REG_BLDY = (sin_cos_table[NaviWork->tag_effect_cnt] >> 5);
		NaviWork->tag_effect_cnt += 3;
		NaviWork->tag_effect_cnt &= 0x7f;
		return;
	}
	// 透明化（8syncで完全）
	if(NaviWork->tag_effect == 2){
		static const u16 bld_tbl[] = {
#ifdef TAGDEL_16
			0x0408,0x0408,0x0507,0x0507,0x0606,0x0606,0x0805,0x0805,
			0x0a04,0x0a04,0x0c03,0x0c03,0x0e02,0x0e02,0x1000,0x1000
#else
			0x0408,0x0507,0x0606,0x0805,0x0a04,0x0c03,0x0e02,0x1000
#endif
		};
	
		*(vu16*)REG_BLDALPHA = bld_tbl[NaviWork->tag_effect_cnt];

#ifdef TAGDEL_16
		if(NaviWork->tag_effect_cnt < 15){
#else
		if(NaviWork->tag_effect_cnt < 7){
#endif
			NaviWork->tag_effect_cnt++;
		}
		return;
	}
}
void TNaviObj_TagEffectStop(void)
{
	tag_selanm_off();
}
static void win_on(void)
{
	*(vu16*)REG_WIN0H = (119 << 8) | 240;
	*(vu16*)REG_WIN0V = NaviWork->tag_win_v[NaviWork->menu_sel];
	*(vu16*)REG_WININ = 0x003f;   // 内部：特殊効果有効
	*(vu16*)REG_WINOUT = 0x001f;  // 外部：特殊効果無効
	*(vu16 *)REG_DISPCNT |= DISP_WIN0_ON;
}
static void win_off(void)
{
	*(vu16 *)REG_DISPCNT &= ~DISP_WIN0_ON;
}
static void tag_selanm_on(void)
{
	if(NaviWork->tag_effect == 0){
		NaviWork->tag_effect = 1;
		NaviWork->tag_effect_cnt = 0;
		*(vu16 *)REG_BLDCNT = BLD_UP_MODE | BLD_OBJ_1ST;
		*(vu16 *)REG_BLDY = 0;
		win_on();
	}
}
static void tag_selanm_off(void)
{
	NaviWork->tag_effect = 0;
	*(vu16 *)REG_BLDCNT = 0;
	win_off();
}
static void tag_delanm_on(void)
{
	if(NaviWork->tag_effect == 0){
		u16  i;
		win_off();
		for(i = 0; i < 4; i++){
			NaviWork->tag_actor[NaviWork->menu_sel][i]->oamData.ObjMode = 1;
		}
		NaviWork->tag_effect = 2;
		NaviWork->tag_effect_cnt = 0;
		*(vu16 *)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
		*(vu16*)REG_BLDALPHA = 0x0010;
	}
}
static void tag_delanm_off(void)
{
	NaviWork->tag_effect = 0;
	*(vu16 *)REG_BLDCNT = 0;
}

/***********************************************
**	タグ動作：出現
***********************************************/
static void tagmove_appear(actWork *act)
{
	act->x -= TAG_SPEED;
	if(act->x <= act->work[TAGWK_DISP_X]){
		act->x = act->work[TAGWK_DISP_X];
		act->move = tagmove_select;
	}
}
/***********************************************
**	タグ動作：消去
***********************************************/
static void tagmove_disappear(actWork *act)
{
	if(act->work[TAGWK_ROW] == NaviWork->menu_sel){
		if(act->work[TAGWK_EX]){
			act->x += act->work[TAGWK_AX];
			act->work[TAGWK_EX] -= act->work[TAGWK_AX];
		}
		if(act->affend_sw){
			del_tag_actor(act);
			return;
		}
		
	}else{
		act->x += TAG_SPEED;
		if(act->x >= act->work[TAGWK_HIDE_X]){
			del_tag_actor(act);
		}
	}
}
/***********************************************
**	タグ動作：選択
***********************************************/
static void tagmove_select(actWork *act)
{
	if(act->work[TAGWK_ROW] == NaviWork->menu_sel){
		if(act->dx > -16){
			act->dx -= 4;
		}
	}else{
		if(act->dx < 0){
			act->dx += 4;
		}
	}
}
/***********************************************
**	タグが選択待機状態にあるか？
***********************************************/
static u8 check_tag_wait(void)
{
	u16 i, j;
	for(i = 0; i < NaviWork->menu_cnt; i++){
		for(j = 0; j < 4; j++){
			if(NaviWork->tag_actor[i][j] != NULL){
				if( NaviWork->tag_actor[i][j]->dx != 0 && 
				    NaviWork->tag_actor[i][j]->dx != -16
				){
					return 0;
				}
			}else{
				return 1;
			}
		}
	}
	return 1;
}
/***********************************************
**	選択中のタグ以外消去されているか？
***********************************************/
static u8 check_tag_moved_nosel(void)
{
	u16 i,j;
	for(i = 0; i < NaviWork->tag_cnt; i++){
		if(i == NaviWork->menu_sel){ continue; }
		for(j = 0; j < 4; j++){
			if(NaviWork->tag_actor[i][j] != NULL){
				return 0;
			}
		}
	}
	return 1;
}
/***********************************************
**	選択中のタグが消去されているか？
***********************************************/
static u8 check_tag_moved_sel(void)
{
	u16 i;
	for(i = 0; i < 4; i++){
		if(NaviWork->tag_actor[NaviWork->menu_sel][i] != NULL){
			return 0;
		}
	}
	return 1;
}
/***********************************************
**	タグアクター消去（ワークのポインタをNULL）
***********************************************/
static void del_tag_actor(actWork *act)
{
	NaviWork->tag_actor[act->work[TAGWK_ROW]][act->work[TAGWK_COL]] = NULL;
	if(act->affend_sw){
		AffineWorkNumDel(act->oamData.AffineParamNo);
	}
	DelActor(act);
}
/***********************************************
**	セル登録                                  **
***********************************************/
static void add_tagimg_cell(u8 type)
{
//	s16 cellno;

	switch(type){
	case MENUTYPE_MAIN:
		NaviWork->tag_cell.ch_data = NaviWork->maintag_char;
		NaviWork->tag_cell.size = sizeof(NaviWork->maintag_char);
		NaviWork->tag_cell.act_num = CELLID_TAG;
		break;
	case MENUTYPE_CONDITION:
		NaviWork->tag_cell.ch_data = NaviWork->contag_char;
		NaviWork->tag_cell.size = sizeof(NaviWork->contag_char);
		NaviWork->tag_cell.act_num = CELLID_TAG;
		break;
	case MENUTYPE_SEARCH:
		NaviWork->tag_cell.ch_data = NaviWork->schtag_char;
		NaviWork->tag_cell.size = sizeof(NaviWork->schtag_char);
		NaviWork->tag_cell.act_num = CELLID_TAG;
		break;
	default:
		return;
	}
	CellSet(&(NaviWork->tag_cell));

}
/***********************************************
**	パレット登録                             **
***********************************************/
static void add_tagimg_pal(u8 type)
{
	PalData  Pal;

	switch(type){
	case MENUTYPE_MAIN:
		Pal.pal_data = maintag1_Palette;
		Pal.reg_num = PALID_TAG;
		ObjPalSet(&Pal);

		Pal.pal_data = maintag2_Palette;
		Pal.reg_num = PALID_TAG2;
		break;

	case MENUTYPE_CONDITION:
		Pal.pal_data = contag_Palette;
		Pal.reg_num = PALID_TAG;
		break;

	case MENUTYPE_SEARCH:
		Pal.pal_data = schtag1_Palette;
		Pal.reg_num = PALID_TAG;
		ObjPalSet(&Pal);

		Pal.pal_data = schtag2_Palette;
		Pal.reg_num = PALID_TAG2;

		break;

	default:
		return;
	}

	ObjPalSet(&Pal);
}
/***********************************************
**	アクターデータ                            **
***********************************************/
static const ActOamData MenuOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	1,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	2,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	1,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actAnm MenuAnm[]={
	{0,5,0,0}, {ACT_ANMEND,0,0,0},
	{8,5,0,0}, {ACT_ANMEND,0,0,0},
	{16,5,0,0}, {ACT_ANMEND,0,0,0},
	{24,5,0,0}, {ACT_ANMEND,0,0,0},

	{32,5,0,0}, {ACT_ANMEND,0,0,0},
	{40,5,0,0}, {ACT_ANMEND,0,0,0},
	{48,5,0,0}, {ACT_ANMEND,0,0,0},
	{56,5,0,0}, {ACT_ANMEND,0,0,0},

	{64,5,0,0}, {ACT_ANMEND,0,0,0},
	{72,5,0,0}, {ACT_ANMEND,0,0,0},
	{80,5,0,0}, {ACT_ANMEND,0,0,0},
	{88,5,0,0}, {ACT_ANMEND,0,0,0},

	{96,5,0,0}, {ACT_ANMEND,0,0,0},
	{104,5,0,0}, {ACT_ANMEND,0,0,0},
	{112,5,0,0}, {ACT_ANMEND,0,0,0},
	{120,5,0,0}, {ACT_ANMEND,0,0,0},

	{128,5,0,0}, {ACT_ANMEND,0,0,0},
	{136,5,0,0}, {ACT_ANMEND,0,0,0},
	{144,5,0,0}, {ACT_ANMEND,0,0,0},
	{152,5,0,0}, {ACT_ANMEND,0,0,0},

	{160,5,0,0}, {ACT_ANMEND,0,0,0},
	{168,5,0,0}, {ACT_ANMEND,0,0,0},
	{176,5,0,0}, {ACT_ANMEND,0,0,0},
	{184,5,0,0}, {ACT_ANMEND,0,0,0},
};
static const actAnm *const MenuAnmTbl[]={
	MenuAnm +  0,  MenuAnm + 2, MenuAnm +  4, MenuAnm +  6,
	MenuAnm +  8, MenuAnm + 10, MenuAnm + 12, MenuAnm + 14,
	MenuAnm + 16, MenuAnm + 18, MenuAnm + 20, MenuAnm + 22,
	MenuAnm + 24, MenuAnm + 26, MenuAnm + 28, MenuAnm + 30,
	MenuAnm + 32, MenuAnm + 34, MenuAnm + 36, MenuAnm + 38,
	MenuAnm + 40, MenuAnm + 42, MenuAnm + 44, MenuAnm + 46,
};
static const actAffAnm TagAffAnm[] = {
#ifdef TAGDEL_16
	{ 16, 16, 0, 16 }, // 16 sync で倍に拡大
#else
	{ 32, 32, 0, 8 }, // 8 sync で倍に拡大
#endif
	{ ACT_AFEND, 0, 0, 0 },
};
static const actAffAnm * const TagAffineTbl[] = {
	TagAffAnm,
};
static const actHeader TagHeader = {
	CELLID_TAG,
	PALID_TAG,
	&MenuOam,
	MenuAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	DummyActMove,
};
/*====================================================================*/
/*   再戦ランプ                                                       */
/*====================================================================*/
#define LAMP_X  (12)
#define LAMP_Y  (96)
#define LAMP_ONOFF_INTERVAL  (6)

static const actHeader LampHeader;
/***********************************************
**	登録                                      **
***********************************************/
void TNaviObj_AddLamp(void)
{
	NaviWork->revenge_lamp_actor = NULL;

	if(CheckRevengerByMapID(Fld.MapID.div_id, Fld.MapID.map_id)==TRUE){
		static const CellData cell = {
			revenge_lamp_Character, sizeof(revenge_lamp_Character), CELLID_LAMP
		};
		static const PalData pal = {
			revenge_lamp_Palette, PALID_LAMP
		};
		u16 no;

		CellSet(&cell);
		ObjPalSet(&pal);

		no = AddActor(&LampHeader, LAMP_X, LAMP_Y, 0);
		if(no != ACT_MAX)
		{
			NaviWork->revenge_lamp_actor = &ActWork[no];
		}else{
			CellDel(CELLID_LAMP);
			ObjPalRegNumDel(PALID_LAMP);
		}
	}
}
/***********************************************
**	削除                                      **
***********************************************/
void TNaviObj_DelLamp(void)
{
	if(NaviWork->revenge_lamp_actor != NULL)
	{
		DelActor(NaviWork->revenge_lamp_actor);
		CellDel(CELLID_LAMP);
		ObjPalRegNumDel(PALID_LAMP);
		NaviWork->revenge_lamp_actor = NULL;
	}
}

/***********************************************
**	動作関数                                  **
***********************************************/
static void lamp_actmove(actWork *act)
{
	if(++(act->work[0]) > LAMP_ONOFF_INTERVAL)
	{
		act->work[0] = 0;
		act->banish = !(act->banish);
	}
}
/***********************************************
**	アクターデータ                            **
***********************************************/
static const ActOamData LampOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	1,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	2,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	1,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actHeader LampHeader = {
	CELLID_LAMP,
	PALID_LAMP,
	&LampOam,
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	lamp_actmove,
};




/*====================================================================*/
/*   ラベル                                                           */
/*====================================================================*/
static const actHeader LabelHeader;
static const actHeader Label2Header;  // ﾊﾟﾚｯﾄID違い
static const actHeader SchLabelHeader;
static const actHeader SchLabel2Header;  // ﾊﾟﾚｯﾄID違い

static void labelmove_appear(actWork *act);
static void labelmove_disappear(actWork *act);
static void labelmove_map(actWork *act);

/*******************************************************
**  圧縮キャラデータをワークに展開                    **
*******************************************************/
void TNaviObj_LabelInitBegin(void)
{
	NaviWork->divide_prog = 0;
	if(NaviWork->comm_flg == FALSE)
	{
		while(1)
		{
			if(!TNaviObj_LabelInit()){ return; }
		}
	}
}
u8 TNaviObj_LabelInit(void)
{
	switch(NaviWork->divide_prog){
	case 0:
		LZ77UnCompWram(mainlabel_Character, NaviWork->mainlabel_Character);
		break;

	case 1:
		LZ77UnCompWram(conlabel_Character, NaviWork->conlabel_Character);
		break;

	case 2:
		LZ77UnCompWram(ribonlabel_Character, NaviWork->ribonlabel_Character);
		break;

	case 3:
		LZ77UnCompWram(maplabel_Character, NaviWork->maplabel_Character);
		break;

	case 4:
		LZ77UnCompWram(schlabel1_Character, NaviWork->schlabel1_Character);
		break;

	case 5:
		LZ77UnCompWram(schlabel2_Character, NaviWork->schlabel2_Character);
		break;

	case 6:
		LZ77UnCompWram(trlabel_Character, NaviWork->trlabel_Character);
		break;

	case 7:
		{
			static const PalData  pal[] = {
				{ label_Palette, PALID_LABEL },
				{ label2_Palette, PALID_LABEL2 },
				{ OBJPAL_END, 0 },
			};
			ObjPalSets(pal);
		}
		break;

	default:
		return 0;
	}

	NaviWork->divide_prog++;

	return 1;
}

enum LABEL_WORK {
	LBWK_AX,
	LBWK_EX,
	LBWK_NUM,
	LBWK_TYPE,
};
static void add_label_cell(u8 type)
{
	CellData cell;

	switch(type){
	case LABEL_MAIN:
		cell.ch_data = NaviWork->mainlabel_Character;
		cell.size = sizeof(NaviWork->mainlabel_Character);
		cell.act_num = CELLID_LABEL;
		break;
	case LABEL_CONDITION:
		cell.ch_data = NaviWork->conlabel_Character;
		cell.size = sizeof(NaviWork->conlabel_Character);
		cell.act_num = CELLID_LABEL;
		break;
	case LABEL_TRAINER:
		cell.ch_data = NaviWork->trlabel_Character;
		cell.size = sizeof(NaviWork->trlabel_Character);
		cell.act_num = CELLID_LABEL;
		break;
	case LABEL_RIBBON:
		cell.ch_data = NaviWork->ribonlabel_Character;
		cell.size = sizeof(NaviWork->ribonlabel_Character);
		cell.act_num = CELLID_LABEL;
		break;
	case LABEL_MAP:
		cell.ch_data = NaviWork->maplabel_Character;
		cell.size = sizeof(NaviWork->maplabel_Character);
		cell.act_num = CELLID_LABEL;
		break;
	case LABEL_SEARCH:
		cell.ch_data = NaviWork->schlabel1_Character + 0x200*0;
		cell.size = 0x200;
		cell.act_num = CELLID_LABEL_SEARCH;
		break;
	case LABEL_SEARCH_STOCK:
		cell.ch_data = NaviWork->schlabel1_Character + 0x200*1;
		cell.size = 0x200;
		cell.act_num = CELLID_LABEL_SEARCH;
		break;
	case LABEL_SEARCH_BEAUTY:
		cell.ch_data = NaviWork->schlabel1_Character + 0x200*2;
		cell.size = 0x200;
		cell.act_num = CELLID_LABEL_SEARCH;
		break;
	case LABEL_SEARCH_CUTE:
		cell.ch_data = NaviWork->schlabel1_Character + 0x200*3;
		cell.size = 0x200;
		cell.act_num = CELLID_LABEL_SEARCH;
		break;
	case LABEL_SEARCH_STRONG:
		cell.ch_data = NaviWork->schlabel2_Character + 0x200*1;
		cell.size = 0x200;
		cell.act_num = CELLID_LABEL_SEARCH;
		break;
	case LABEL_SEARCH_CLEVER:
		cell.ch_data = NaviWork->schlabel2_Character + 0x200*0;
		cell.size = 0x200;
		cell.act_num = CELLID_LABEL_SEARCH;
		break;
	case LABEL_SEARCH_STYLE:
		cell.ch_data = NaviWork->schlabel2_Character + 0x200*2;
		cell.size = 0x200;
		cell.act_num = CELLID_LABEL_SEARCH;
		break;
	default:
		return;
	}

	CellSet(&cell);
}
static void add_label_actor(u8 type)
{
	s16 x, y, ax, ex, diff_x;
	u16 i, no;
	const actHeader *header;
	actWork **act;


	header = NULL;
	switch(type){
	case LABEL_MAIN: 
	case LABEL_CONDITION:
	case LABEL_RIBBON:
	case LABEL_TRAINER:
		x = -96; y = 49 - NaviWork->combg_vofs; ax = 8; ex = 32; diff_x = 64;
		act = NaviWork->label_actor;
		if(type != LABEL_TRAINER){
			header = &LabelHeader;
		}else{
			header = &Label2Header;
		}
		break;

	case LABEL_MAP:
		x = 272; y = 49 - NaviWork->combg_vofs; ax = -8; ex = 152; diff_x = 64;
		header = &LabelHeader;
		act = NaviWork->label_actor;
		break;

	case LABEL_SEARCH:
	case LABEL_SEARCH_STOCK:
	case LABEL_SEARCH_BEAUTY:
	case LABEL_SEARCH_CUTE:
		header = &SchLabelHeader;

	case LABEL_SEARCH_STRONG:
	case LABEL_SEARCH_CLEVER:
	case LABEL_SEARCH_STYLE:
		if(header == NULL){
			header = &SchLabel2Header;
		}
		x = -96; y = 68 - NaviWork->combg_vofs; ax = 8; ex = 16; diff_x = 32;
		act = NaviWork->sch_label_actor;
		break;

	default:
		return;
	}

	for(i = 0; i < 2; i++){
		no = AddActor(header, x + i * diff_x, y, 0);
		if(no != ACT_MAX){
			ActWork[no].work[LBWK_AX] = ax;
			ActWork[no].work[LBWK_EX] = ex + i * diff_x;
			ActWork[no].work[LBWK_NUM] = i;
			ActWork[no].work[LBWK_TYPE] = type;
			if(type == LABEL_MAP && i == 1){
				u16 anm = (NaviWork->mapwk.mode == TOWNMAP_WHOLE)? 1 : 2;
				ActAnmChg(ActWork+no, anm);
			}else{
				ActAnmChg(ActWork+no, i);
			}

			if(type < LABEL_MAP && i == 1){
				ActWork[no].oamData.Shape = 0;
				ActWork[no].oamData.Size = 2;
			}

			*(act+i) = &ActWork[no];
		}
	}
}
/***********************************************
**	動作関数                                  **
***********************************************/
static void labelmove_appear(actWork *act)
{
	s16 x = act->x;
	act->x += act->work[LBWK_AX];
	if((x <= act->work[LBWK_EX] && act->x >= act->work[LBWK_EX]) ||
	   (x >= act->work[LBWK_EX] && act->x <= act->work[LBWK_EX])
	){
		act->x = act->work[LBWK_EX];
		if(act->work[LBWK_TYPE] == LABEL_MAP && act->work[LBWK_NUM] == 1){
			act->move = labelmove_map;
		}else{
			act->move = DummyActMove;
		}
	}
}
static void labelmove_disappear(actWork *act)
{
	act->x -= act->work[LBWK_AX];
	if(act->x < -32 || act->x > 272){
		if(act->work[LBWK_NUM] == 1){
			if(act->work[LBWK_TYPE] < LABEL_SEARCH){
				CellDel(CELLID_LABEL);
			}else{
				CellDel(CELLID_LABEL_SEARCH);
			}
		}
		DelActor(act);
	}
}
static void labelmove_map(actWork *act)
{
	ActAnmChg(act, ((NaviWork->mapwk.mode == TOWNMAP_WHOLE)? 1 : 2));
}
/***********************************************
**	ラベル登録
***********************************************/
void TNaviObj_AddLabel_Begin(u8 type)
{
	NaviWork->divide_prog = 0;
	if(NaviWork->comm_flg == FALSE)
	{
		while(1){
			if(!TNaviObj_AddLabel(type)){ return; }
		}
	}
}
u8 TNaviObj_AddLabel(u8 type)
{
	switch(NaviWork->divide_prog){
	case 0:
		add_label_cell(type);
		break;

	case 1:
		add_label_actor(type);
		NaviWork->divide_prog++;
		return 0;

	default:
		return 0;
	}
	NaviWork->divide_prog++;
	return 1;
}
/***********************************************
**	ラベル削除（待つ必要あり）
***********************************************/
void TNaviObj_DelLabel(u8 type)
{
	u16 i;
	if(type < LABEL_SEARCH){
		for(i = 0; i < 2; i++){
			NaviWork->label_actor[i]->move = labelmove_disappear;
		}
	}else{
		for(i = 0; i < 2; i++){
			NaviWork->sch_label_actor[i]->move = labelmove_disappear;
		}
	}
}
/***********************************************
**	ラベル削除（待つ必要なし）
***********************************************/
void TNaviObj_DelLabelNow(u8 type)
{
	u16 i;
	if(type < LABEL_SEARCH){
		CellDel(CELLID_LABEL);
		for(i = 0; i < 2; i++){
			DelActor(NaviWork->label_actor[i]);
		}
	}else{
		CellDel(CELLID_LABEL_SEARCH);
		for(i = 0; i < 2; i++){
			DelActor(NaviWork->sch_label_actor[i]);
		}
	}
}
/***********************************************
**	アクターデータ                            **
***********************************************/
static const ActOamData LabelOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	1,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	3,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	1,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actAnm LabelAnm[]={
	{0,5,0,0}, {ACT_ANMEND,0,0,0},
	{32,5,0,0}, {ACT_ANMEND,0,0,0},
	{64,5,0,0}, {ACT_ANMEND,0,0,0},
};
static const actAnm *const LabelAnmTbl[]={
	LabelAnm + 0, LabelAnm + 2, LabelAnm + 4,
};
static const actHeader LabelHeader = {
	CELLID_LABEL,
	PALID_LABEL,
	&LabelOam,
	LabelAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	labelmove_appear,
};
static const actHeader Label2Header = {
	CELLID_LABEL,
	PALID_LABEL2,
	&LabelOam,
	LabelAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	labelmove_appear,
};
static const ActOamData SchLabelOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	1,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	2,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	1,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actAnm SchLabelAnm[]={
	{0,5,0,0}, {ACT_ANMEND,0,0,0},
	{8,5,0,0}, {ACT_ANMEND,0,0,0},
};
static const actAnm *const SchLabelAnmTbl[]={
	SchLabelAnm + 0, SchLabelAnm + 2,
};
static const actHeader SchLabelHeader = {
	CELLID_LABEL_SEARCH,
	PALID_LABEL,
	&SchLabelOam,
	SchLabelAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	labelmove_appear,
};
static const actHeader SchLabel2Header = {
	CELLID_LABEL_SEARCH,
	PALID_LABEL2,
	&SchLabelOam,
	SchLabelAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	labelmove_appear,
};

/*====================================================================*/
/*   ホウエンマップ                                                   */
/*====================================================================*/
#define MINIMAP_X  (184)

/***********************************************
**  登録
***********************************************/
void TNaviObj_AddMap(void)
{
	TownMapAddCursor(CELLID_MAPCURSOR, PALID_MAPCURSOR);
	TownMapAddJiki(CELLID_MAPJIKI, PALID_MAPJIKI);
	TownMap_JikiTenmetsu();
}
/***********************************************
**  削除
***********************************************/
void TNaviObj_DelMap(void)
{
	TownMapQuit();
}
/*====================================================================*/
/*   ポケモン画像                                                     */
/*====================================================================*/
static const ActOamData TNaviPokeOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	3,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	1,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
// 動作関数
static void pokeimg_actmove(actWork *act)
{
	act->x = POKE_X + NaviWork->pokewin_vofs;
}
// ポケモン画像領域を更新
void TNaviObj_UpdatePokeImg(u8 num)
{
	if(NaviWork->poke_actor == NULL){
		CellData cell = {
			NULL,
			0x800,
			CELLID_POKEIMG,
		};
		actHeader header = {
			CELLID_POKEIMG,
			PALID_POKEIMG,
			&TNaviPokeOam,
			DummyActAnmTbl,
			ACT_NTRANS,
			DummyActAffTbl,
			pokeimg_actmove,  // 移動しない
		};
		PalData pal = {
			NULL,
			PALID_POKEIMG,
		};
		u16 no;

		cell.ch_data = (const u8*)(NaviWork->PokeCell[num]);
		pal.pal_data = (const u16*)(NaviWork->PokePal[num]);

		NaviWork->pokeimg_palno = ObjPalSet(&pal);
		NaviWork->pokeimg_cellno = CellSet(&cell);

		no = AddActor(&header, POKE_X, POKE_Y, 0);
		if(no != ACT_MAX){
			NaviWork->poke_actor = &ActWork[no];
		}else{
			CellDel(CELLID_POKEIMG);
			ObjPalRegNumDel(PALID_POKEIMG);
			NaviWork->poke_actor = NULL;
			return;
		}

		NaviWork->pokeimg_celladr = (u8*)OBJ_MODE0_VRAM + (NaviWork->pokeimg_cellno * 32);
		NaviWork->pokeimg_palno = 256 + NaviWork->pokeimg_palno * 16;

	}else{
		DIV_DMACOPY(3, NaviWork->PokeCell[num], NaviWork->pokeimg_celladr, 0x800, 16);
		PaletteWorkSet(NaviWork->PokePal[num], NaviWork->pokeimg_palno, 32);
	}


}
// 削除処理
void TNaviObj_PokeImgDel(void)
{
	if(NaviWork->poke_actor != NULL){
		DelActor(NaviWork->poke_actor);
		CellDel(CELLID_POKEIMG);
		ObjPalRegNumDel(PALID_POKEIMG);
		NaviWork->poke_actor = NULL;
	}
}

//=============================================================
// ポケモンアクター処理を流用してトレーナーアクターも処理する
//=============================================================
#define TRAINER_X  (40)
#define TRAINER_Y  (104)


static void trainer_actmove(actWork *act);

void TNaviObj_UpdateTrainerImg(u8 work_no)
{
	TNaviObj_UpdatePokeImg(work_no);
	NaviWork->trainer_actor = NaviWork->poke_actor;
	NaviWork->trainer_actor->move = trainer_actmove;
//	NaviWork->poke_actor = NULL;
}
void TNaviObj_TrainerImgDel(void)
{
	if(NaviWork->trainer_actor != NULL){
		DelActor(NaviWork->trainer_actor);
		CellDel(CELLID_POKEIMG);
		ObjPalRegNumDel(PALID_POKEIMG);
		NaviWork->trainer_actor = NULL;
		NaviWork->poke_actor = NULL;
	}
}

// 動作関数
static void trainer_actmove(actWork *act)
{
	act->x = TRAINER_X + NaviWork->trainer_hofs;
	act->y = TRAINER_Y;
}


/*====================================================================*/
/*   リスト画面                                                       */
/*====================================================================*/
#define LIST_CURSOR_X  (108)
#define LIST_CURSOR_Y  (16)
#define LIST_ARROW_X      (168)
#define LIST_ARROW_Y      (8)
#define LIST_ARROW_YDIFF  (128)

static const actHeader ListCursorHeader;
static const actHeader ListArrowHeader;

/***********************************************
**	初期化
**	mode  モード指定（enum LIST_MODE)
***********************************************/
void TNaviObj_ListInit(u8 mode)
{
	CellData  cell[] = {
		{ listcursor_Character, sizeof(listcursor_Character), CELLID_LISTCURSOR },
		{ listarrow_Character, sizeof(listarrow_Character), CELLID_LISTARROW  },
		{ CELL_END, 0, 0 }
	};
	PalData  pal = { condition_listcursor_Palette, PALID_LISTCURSOR };
	u16 no, i;

	switch(mode){
	case LISTMODE_RIBBON:
	case LISTMODE_TRAINER:
		pal.pal_data = ribon_listcursor_Palette;
		break;
	}

	CellSets(cell);
	ObjPalSet(&pal);

	no = AddActor(&ListCursorHeader, LIST_CURSOR_X, 0, 0);
	if(no != ACT_MAX){
		NaviWork->listcursor_actor = &ActWork[no];
	}else{
		NaviWork->listcursor_actor = NULL;
		return;
	}

	for(i = 0; i < 2; i++)
	{
		no = AddActor(&ListArrowHeader, LIST_ARROW_X, LIST_ARROW_Y + LIST_ARROW_YDIFF*i, 0);
		if(no != ACT_MAX){
			NaviWork->listarrow_actor[i] = &ActWork[no];
			ActWork[no].banish = 1;
			ActWork[no].work[0] = 0;  // 0:syncｶｳﾝﾀ
			ActWork[no].work[1] = 0;  // 1:移動ｶｳﾝﾀ
			ActWork[no].work[2] = (i==0)? -1 : 1;  // 2:移動方向
			ActWork[no].work[3] = i;  // 3:上下識別子
			ActWork[no].work[4] = 1;  // 4:表示更新ﾌﾗｸﾞ
			ActAnmChg(&ActWork[no], i);
		}else{
			NaviWork->listarrow_actor[i] = NULL;
		}
	}
}
/***********************************************
**	削除
***********************************************/
void TNaviObj_ListDel(void)
{
	u16 i;

	if(NaviWork->listcursor_actor != NULL){
		DelActor(NaviWork->listcursor_actor);
		CellDel(CELLID_LISTCURSOR);
		ObjPalRegNumDel(PALID_LISTCURSOR);
		NaviWork->listcursor_actor = NULL;
	}

	for(i = 0; i < 2; i ++)
	{
		if(NaviWork->listarrow_actor[i] != NULL)
		{
			DelActor(NaviWork->listarrow_actor[i]);
			NaviWork->listarrow_actor[i] = NULL;
		}
	}
	CellDel(CELLID_LISTARROW);

}
/***********************************************
**	動作関数                                  **
***********************************************/
// カーソル
static void listcursor_actmove(actWork *act)
{
	act->y = LIST_CURSOR_Y + NaviWork->list_cursor_pos * 16;
}
// 上下矢印
static void listarrow_actmove(actWork *act)
{
	if(NaviWork->list_scroll_flg){
		// 状況によって出たり消えたり
		if(act->work[4]){
			if(act->work[3] == 0){
				act->banish = (NaviWork->list_top == 0);
			}else{
				act->banish = (NaviWork->list_bottom == NaviWork->list_max);
			}
			act->work[4] = 0;
		}
		// ふらふら上下移動
		if(++(act->work[0]) > 4)
		{
			act->work[0] = 0;
			act->work[1]++;
			if(act->work[1] < 5){
				act->dy += act->work[2];
			}else{
				act->work[1] = 0;
				act->dy = 0;
			}
		}
	}
}
/***********************************************
**	矢印の表示更新                            **
***********************************************/
void TNaviObj_ArrowUpdate(void)
{
	u16 i;
	for(i = 0; i < 2; i++){
		if(NaviWork->listarrow_actor[i] != NULL)
		{
			NaviWork->listarrow_actor[i]->work[4] = 1;
		}
	}
}
/***********************************************
**	カーソル・矢印の banish フラグ操作        **
***********************************************/
void TNaviObj_ListObjBanish(u8 flg)
{
	NaviWork->listcursor_actor->banish = flg;
	if(NaviWork->list_scroll_flg){
		if(flg == 1){
			NaviWork->listarrow_actor[0]->banish = flg;
			NaviWork->listarrow_actor[1]->banish = flg;
		}else{
			NaviWork->listarrow_actor[0]->work[4] = 1;
			NaviWork->listarrow_actor[1]->work[4] = 1;
		}
	}
}


/***********************************************
**	アクターデータ                            **
***********************************************/
static const ActOamData ListCursorOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	2,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	0,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	2,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actHeader ListCursorHeader = {
	CELLID_LISTCURSOR,
	PALID_LISTCURSOR,
	&ListCursorOam,
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	listcursor_actmove,
};
static const actAnm ListArrowAnm[]={
	{OBJ16_16x8*0,3,0,0}, { ACT_ANMEND },
	{OBJ16_16x8*1,3,0,0}, { ACT_ANMEND },
};
static const actAnm *const ListArrowAnmTbl[]={
	ListArrowAnm+0,
	ListArrowAnm+2,
};



static const ActOamData ListArrowOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	1,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	0,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	2,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actHeader ListArrowHeader = {
	CELLID_LISTARROW,
	PALID_LISTCURSOR,
	&ListArrowOam,
	ListArrowAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	listarrow_actmove,
};
/*====================================================================*/
/*   てもちコンディション                                             */
/*====================================================================*/
static const ActOamData BallOam = {
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
static const actAnm BallAnm[]={
	{0,5,0,0}, {ACT_ANMEND,0,0,0},
	{4,5,0,0}, {ACT_ANMEND,0,0,0},
};
static const actAnm *const BallAnmTbl[]={
	BallAnm + 0,
	BallAnm + 2,
};
// 動作関数
enum CONDITION_OBJ_WORK {
	COWK_NUM,
};
static void ball_actmove(actWork *act)
{
	if(act->work[COWK_NUM] == NaviWork->condition_poke_sel){
		ActAnmChg(act, 0);
	}else{
		ActAnmChg(act, 1);
	}
}

static void modoru_actmove(actWork *act)
{
	if(NaviWork->condition_poke_sel == NaviWork->condition_poke_cnt - 1){
		act->oamData.Pltt = ObjPalNumGet(PALID_CONDITION);
	}else{
		act->oamData.Pltt = ObjPalNumGet(PALID_CONDITION_OFF);
	}
}
/***************************************
** 初期化
***************************************/
void TNaviObj_StockConInit(void)
{
	CellData  cell[] = {
		{ ball_Character, sizeof(ball_Character), CELLID_BALL },
		{ dot_Character, sizeof(dot_Character), CELLID_DOT },
		{ modoru_Character, sizeof(modoru_Character), CELLID_MODORU },
		{ CELL_END, 0, 0 },
	};
	PalData pal[] = {
		{ condition_obj_Palette, PALID_CONDITION },
		{ condition_off_Palette, PALID_CONDITION_OFF },
		{ OBJPAL_END, 0 },
	};
	actHeader header = {
		CELLID_BALL,
		PALID_CONDITION,
		&BallOam,
		BallAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		ball_actmove,
	};
	u16 i, no;

	CellSets(cell);
	ObjPalSets(pal);

	for(i = 0; i < NaviWork->condition_poke_cnt - 1; i++){
		no = AddActor(&header, BALL_X, BALL_Y + i * BALL_YDIFF, 0);
		if(no != ACT_MAX){
			NaviWork->condition_actor[i] = &ActWork[no];
			NaviWork->condition_actor[i]->work[COWK_NUM] = i;
		}else{
			NaviWork->condition_actor[i] = NULL;
		}
	}

	header.cellNo = CELLID_DOT;
	header.moveData_p = DummyActMove;
	for( ; i < TEMOTI_POKEMAX; i++){
		no = AddActor(&header, BALL_X+4, BALL_Y + i * BALL_YDIFF, 0);
		if(no != ACT_MAX){
			NaviWork->condition_actor[i] = &ActWork[no];
			NaviWork->condition_actor[i]->oamData.Size = 0;
		}else{
			NaviWork->condition_actor[i] = NULL;
		}
	}

	header.cellNo = CELLID_MODORU;
	header.moveData_p = modoru_actmove;
	no = AddActor(&header, BALL_X-4, BALL_Y + i * BALL_YDIFF, 0);
	if(no != ACT_MAX){
		NaviWork->condition_actor[i] = &ActWork[no];
		NaviWork->condition_actor[i]->oamData.Shape = 1;
		NaviWork->condition_actor[i]->oamData.Size = 2;
	}else{
		NaviWork->condition_actor[i] = NULL;
	}
}
// 削除処理
void TNaviObj_StockConDel(void)
{
	u16 i;
	for(i = 0; i < (TEMOTI_POKEMAX+1); i++){
		if(NaviWork->condition_actor[i] != NULL){
			DelActor(NaviWork->condition_actor[i]);
			NaviWork->condition_actor[i] = NULL;
		}
	}
}
/*====================================================================*/
/*   サーチコンディション                                             */
/*====================================================================*/
static const u16 mark_state_pal[16] = {
	0x7b77,0x7314,0x7335,0x7fff,0x7bbc,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

static void mark_state_actmove(actWork *act);

#define MARK_STATE_X  (192)
#define MARK_STATE_Y  (32)
#define MARK_WIN_X    (176)
#define MARK_WIN_Y    (32)

/***********************************************
**	初期化
***********************************************/
void TNaviObj_SearchConditionInit(void)
{
	actWork *act;

	NaviWork->markwork.cell_id = CELLID_MARK_WIN;
	NaviWork->markwork.pal_id = PALID_MARK_WIN;
	MarkingWorkInit(&(NaviWork->markwork));
	MarkingCellMakeNow();

	act = MarkingStateAnmObjAdd(CELLID_MARK_STATE, PALID_MARK_STATE, mark_state_pal);
	act->oamData.Priority = 3;
	act->x = MARK_STATE_X;
	act->y = MARK_STATE_Y;
	act->move = mark_state_actmove;
	NaviWork->mark_state_actor = act;
}
/***********************************************
**	終了
***********************************************/
void TNaviObj_SearchConditionQuit(void)
{
	DelActor(NaviWork->mark_state_actor);
	CellDel(CELLID_MARK_STATE);
	ObjPalRegNumDel(PALID_MARK_STATE);
}
/***********************************************
**	動作関数
***********************************************/
static void mark_state_actmove(actWork *act)
{
	ActAnmChg(act, NaviWork->poke_mark[NaviWork->PokeSelNow]);
}
/***********************************************
**	マーク選択の開始
***********************************************/
void TNaviObj_MarkingInit(void)
{
//	NaviWork->markwork.cell_id = CELLID_MARK_WIN;
//	NaviWork->markwork.pal_id = PALID_MARK_WIN;
//	NaviWork->markwork.mark = NaviWork->poke_mark[NaviWork->PokeSelNow];
	MarkingWindowDisp(NaviWork->poke_mark[NaviWork->PokeSelNow], MARK_WIN_X, MARK_WIN_Y);
}
/***********************************************
**	マーク選択の終了
***********************************************/
void TNaviObj_MarkingQuit(void)
{
	POKE_SORT_DATA *data;

	data = &(NaviWork->sort_data[NaviWork->condition_poke_sel]);
	NaviWork->poke_mark[NaviWork->PokeSelNow] = NaviWork->markwork.mark;
	TNaviSub_PokeMarkSet(data->box, data->poke, NaviWork->markwork.mark);
	MarkingWindowQuit();
}
/*====================================================================*/
/*   リボン画面                                                       */
/*====================================================================*/
static void ribbon_cell_add_begin(void);
static u8   ribbon_cell_add(void);
static actWork* ribbon_act_add(u16 x, u16 y);

enum CURSOR_WORK {
	CWK_COUNT,
	CWK_COLOR,
	CWK_PALNUM,
};
#define RIBBON_OX  (96)
#define RIBBON_OY  (40)

/****************************************************************
**	リボンセルデータをワークに作成しておく（トレナビ初期化時）
****************************************************************/

static void ribbon_cellmake_sub_begin(void);
static u8 ribbon_cellmake_sub(void);
#define RIBBON_CELLMAKE_UNIT  (2)  // １度にいくつのセルデータを作成するか？

void TNaviObj_RibbonCellMake_Begin(void)
{
	NaviWork->divide_prog = 0;
	if(NaviWork->comm_flg == FALSE)
	{
		while(1){
			if(!TNaviObj_RibbonCellMake()){ return; }
		}
	}
}
u8 TNaviObj_RibbonCellMake(void)
{
	switch(NaviWork->divide_prog){
	case 0:
		LZ77UnCompWram((void*)ribbon_Character, (void*)(NaviWork->ribbon_cell_work));
		break;

	case 1:
		ribbon_cellmake_sub_begin();
		NaviWork->divide_prog++;
	case 2:
		if(ribbon_cellmake_sub())
		{
			return 1;
		}
		break;

	default:
		return 0;
	}

	NaviWork->divide_prog++;
	return 1;
}
static void ribbon_cellmake_sub_begin(void)
{
	NaviWork->ribbon_cell_prog = 0;
	if(NaviWork->comm_flg == FALSE)
	{
		while(1){
			if(!ribbon_cellmake_sub()){ return; }
		}
	}
}
static u8 ribbon_cellmake_sub(void)
{
	u16 i;
	u8 *src, *dst;
	u8 x, y, xch, ych;

	if(NaviWork->ribbon_cell_prog >= RIBBON_SHAPE_MAX)
	{
		return 0;
	}

	for(i = 0; i < RIBBON_CELLMAKE_UNIT; i++){
		src = &(NaviWork->ribbon_cell_work[NaviWork->ribbon_cell_prog * (8*32)]);
		dst = &(NaviWork->ribbon_cell[NaviWork->ribbon_cell_prog * (16*32)]);

		for(ych = 0; ych < 4; ych++)
		{
			CpuFastCopy(src, dst, 32*2);
			dst += (32*2);
			src += (32*1);
			for(xch = 0; xch < 2; xch++)
			{
				for(y = 0; y < 8; y++)
				{
					src += 4;
					for(x = 0; x < 4; x++)
					{
						src--;
						*dst++ = ((*src)<<4) | (((*src)>>4)&0x0f);
					}
					src += 4;
				}
				src -= (32*2);
			}
			src += (32*3);
		}
		NaviWork->ribbon_cell_prog++;
		if(NaviWork->ribbon_cell_prog >= RIBBON_SHAPE_MAX)
		{
			break;
		}
	}

	if(NaviWork->ribbon_cell_prog >= RIBBON_SHAPE_MAX)
	{
		return 0;
	}

	return 1;
}
/****************************************************************
**	リボン画面初期化
****************************************************************/
void TNaviObj_RibbonInit_Begin(void)
{
	NaviWork->divide_prog = 0;
	if(NaviWork->comm_flg == FALSE)
	{
		while(1){
			if(!TNaviObj_RibbonInit()){ return; }
		}
	}
}
u8 TNaviObj_RibbonInit(void)
{
	switch(NaviWork->divide_prog){
	case 0:
		NaviWork->ribbon_actor = NULL;
		NaviWork->ribbon_anm_flg = 0;
		break;

	case 1:
		TNaviObj_UpdatePokeImg(0);
		break;

	case 2:
		ribbon_cell_add_begin();
		NaviWork->divide_prog++;
	case 3:
		if(ribbon_cell_add()){
			return 1;
		}
		break;

	default:
		return 0;
	}

	NaviWork->divide_prog++;
	return 1;
}
/***********************************************
**	リボンセルデータ登録
***********************************************/
static void ribbon_cell_add_begin(void)
{
	NaviWork->ribbon_cell_prog = 0;
	if(NaviWork->comm_flg == FALSE){
		while(1){
			if(!ribbon_cell_add()){ return; }
		}
	}
}
static  u8 ribbon_cell_add(void)
{
	CellData cell;

	if(NaviWork->ribbon_cell_prog >= RIBBON_SHAPE_MAX)
	{
		return 0;
	}

	cell.ch_data = &(NaviWork->ribbon_cell[NaviWork->ribbon_cell_prog * OBJ_SIZE16_32x32]);
	cell.size = OBJ_SIZE16_32x32;
	cell.act_num = CELLID_RIBBON1 + NaviWork->ribbon_cell_prog;

	CellSet(&cell);

	if(NaviWork->ribbon_cell_prog < RIBBON_COLOR_MAX)
	{
		PalData pal;

		pal.pal_data = &(ribbon_Palette[NaviWork->ribbon_cell_prog * 16]);
		pal.reg_num = PALID_RIBBON1 + NaviWork->ribbon_cell_prog;
		ObjPalSet(&pal);
	}

	NaviWork->ribbon_cell_prog++;
	if(NaviWork->ribbon_cell_prog >= RIBBON_SHAPE_MAX)
	{
		return 0;
	}

	return 1;
}

/**************************************************************
**	リボンアクター登録
**************************************************************/

const u16 RibbonCellPalData[RIBBON_NUM_MAX][2] = {
//  {CellNo,PallNo },    ↓enum RIBBON_TYPE の順番と一致
	{    0,      0 },  // チャンプリボン

	{    1,      0 },  // クールリボンノーマル
	{    2,      0 },  // クールリボンスーパー
	{    3,      0 },  // クールリボンハイパー
	{    4,      0 },  // クールリボンマスター

	{    1,      1 },  // ビューティリボンノーマル
	{    2,      1 },  // ビューティリボンスーパー
	{    3,      1 },  // ビューティリボンハイパー
	{    4,      1 },  // ビューティリボンマスター

	{    1,      2 },  // キュートリボンノーマル
	{    2,      2 },  // キュートリボンスーパー
	{    3,      2 },  // キュートリボンハイパー
	{    4,      2 },  // キュートリボンマスター

	{    1,      3 },  // ジーニアスリボンノーマル
	{    2,      3 },  // ジーニアスリボンスーパー
	{    3,      3 },  // ジーニアスリボンハイパー
	{    4,      3 },  // ジーニアスリボンマスター

	{    1,      4 },  // パワフルリボンノーマル
	{    2,      4 },  // パワフルリボンスーパー
	{    3,      4 },  // パワフルリボンハイパー
	{    4,      4 },  // パワフルリボンマスター

	{    5,      0 },  // ウィニングリボン
	{    6,      0 },  // ビクトリーリボン
	{    7,      1 },  // ブロマイドリボン
	{    8,      2 },  // がんばリボン

	{    9,      1 },  // マリンリボン
	{    9,      3 },  // ランドリボン
	{    9,      4 },  // スカイリボン

	{   10,      3 },  // カントリーリボン
	{   10,      4 },  // ナショナルリボン

	{   11,      0 },  // アースリボン
	{   11,      1 },  // ワールドリボン
};

static const actHeader RibonHeader;
static const actAffAnm * const RibonAffTbl[];

#define RIBBON_ACTADD_UNIT  (4) // 一度に登録するアクター数

static actWork* ribbon_act_add(u16 x, u16 y)
{
	actHeader header;
	u16 num;
	u8  type, actno;

	if(y < (RIBBON_FRAME_Y-1)){
		num = (y*RIBBON_FRAME_X) + x;
	}else{
		num = (NaviWork->ribbon_cnt - NaviWork->event_ribbon_cnt) + x;
	}

	type = NaviWork->ribbon_type[num];
	header = RibonHeader;

	header.cellNo = RibbonCellPalData[type][0] + CELLID_RIBBON1;
	header.palNo = RibbonCellPalData[type][1] + PALID_RIBBON1;

	actno = AddActor(&header, RIBBON_OX+x*16, RIBBON_OY+y*16, ACTPRI_RIBBON50);
	if(actno != ACT_MAX){
		return &ActWork[actno];
	}

	return NULL;
}
/***********************************************
**	拡大リボン表示
***********************************************/
void TNaviObj_RibbonDisp(void)
{
	NaviWork->ribbon_actor = ribbon_act_add(NaviWork->ribbon_cursor_x, NaviWork->ribbon_cursor_y);
	if(NaviWork->ribbon_actor != NULL)
	{
		ActAffAnmChg(NaviWork->ribbon_actor, 1);
		NaviWork->ribbon_anm_flg = 1;
	}
	else
	{
		NaviWork->ribbon_anm_flg = 0;
	}
}
/***********************************************
**	拡大リボン表示待ち（0で終了）
***********************************************/
u8 TNaviObj_RibbonDispWait(void)
{
	if(NaviWork->ribbon_anm_flg){
		NaviWork->ribbon_anm_flg =  !(NaviWork->ribbon_actor->affend_sw);
		return NaviWork->ribbon_anm_flg;
	}
	return 0;
}
/***********************************************
**	拡大リボン消去
***********************************************/
void TNaviObj_RibbonErase(void)
{
	if(NaviWork->ribbon_actor != NULL){
		ActAffAnmChg(NaviWork->ribbon_actor, 2);
		NaviWork->ribbon_anm_flg = 1;
	}else{
		NaviWork->ribbon_anm_flg = 0;
	}
}
/***********************************************
**	拡大リボン消去待ち（0で終了）
***********************************************/
u8 TNaviObj_RibbonEraseWait(void)
{
	if(NaviWork->ribbon_anm_flg){
		NaviWork->ribbon_anm_flg =  !(NaviWork->ribbon_actor->affend_sw);
		if(NaviWork->ribbon_anm_flg == 0)
		{
			AffineWorkNumDel(NaviWork->ribbon_actor->oamData.AffineParamNo);
			DelActor(NaviWork->ribbon_actor);
			NaviWork->ribbon_actor = NULL;
		}
		return NaviWork->ribbon_anm_flg;
	}
	return 0;
}

/***********************************************
**	リボン終了
***********************************************/
void TNaviObj_RibbonQuit(void)
{
	u16 i;

	if(NaviWork->ribbon_actor != NULL)
	{
		AffineWorkNumDel(NaviWork->ribbon_actor->oamData.AffineParamNo);
		DelActor(NaviWork->ribbon_actor);
		NaviWork->ribbon_actor = NULL;
	}

	for(i = 0; i < RIBBON_SHAPE_MAX; i++)
	{
		CellDel(CELLID_RIBBON1 + i);
	}

	for(i = 0; i < RIBBON_COLOR_MAX; i++)
	{
		ObjPalRegNumDel(PALID_RIBBON1 + i);
	}

	TNaviObj_PokeImgDel();
}

/*********************************************/
/*  アクターデータ                           */
/*********************************************/
static const ActOamData RibonOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	1,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	2,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	0,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};

static const actAffAnm RibbonAff0[] = {  // 50%表示
	{ 0x80, 0x80, 0, ACT_AFSET },
	{ ACT_AFEND, 0, 0, 0 },
};
static const actAffAnm RibbonAff1[] = {  // 50%→4syncで100%
	{ 0x80, 0x80, 0, ACT_AFSET },
	{ 0x20, 0x20, 0, 4   },
	{ ACT_AFEND, 0, 0, 0 },
};
static const actAffAnm RibbonAff2[] = {  // 100%→4syncで50%
	{ 0x100, 0x100, 0, ACT_AFSET },
	{ -0x20, -0x20, 0, 4   },
	{ ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm * const RibbonAffTbl[] = {
	RibbonAff0, RibbonAff1, RibbonAff2,
};
static const actHeader RibonHeader = {
	CELLID_RIBBON1,
	PALID_RIBBON1,
	&RibonOam,
	DummyActAnmTbl,
	ACT_NTRANS,
	RibbonAffTbl,
	DummyActMove,
};

/*====================================================================*/
/*   毛並み用キラキラエフェクト                                       */
/*====================================================================*/
#define KIRA_CX  (40)
#define KIRA_CY  (104)

static const actHeader KiraHeader;
static void kira_setmove(u8 lv, u8 init);
static void kira_anm_restart();

/***************************************
**	初期化
***************************************/
void TNaviObj_KiraInit(void)
{
	CellData cell= { kira_Character, sizeof(kira_Character), CELLID_KIRA };
	PalData pal = { kira_Palette, PALID_KIRA };
	u16 i;

	CellSet(&cell);
	ObjPalSet(&pal);
	for(i = 0; i < KIRA_MAX; i++){
		NaviWork->kira_actor[i] = NULL;
	}
}
/***************************************
**	終了
***************************************/
void TNaviObj_KiraQuit(void)
{
	TNaviObj_KiraStop();
	CellDel(CELLID_KIRA);
	ObjPalRegNumDel(PALID_KIRA);
}
/***************************************
**	開始
***************************************/
void TNaviObj_KiraStart(void)
{
	u16 no, lv, i;
	POKE_SORT_DATA *data;

	data = &(NaviWork->sort_data[NaviWork->condition_poke_sel]);
	if(data->enable == 0){ return; }

	lv = NaviWork->poke_fur[NaviWork->PokeSelNow];
	for(i = 0; i < lv+1; i++){
		no = AddActor(&KiraHeader, 0, 0, 0);
		if(no != ACT_MAX){
			NaviWork->kira_actor[i] = &ActWork[no];
			NaviWork->kira_actor[i]->banish = 1;
		}else{
			break;
		}
	}

	kira_setmove(lv, 1);
}
/***************************************
**	停止
***************************************/
void TNaviObj_KiraStop(void)
{
	u16 i;
	for(i = 0; i < KIRA_MAX; i++){
		if(NaviWork->kira_actor[i] != NULL){
			DelActor(NaviWork->kira_actor[i]);
			NaviWork->kira_actor[i] = NULL;
		}else{
			break;
		}
	}
}
/***************************************
**	動作関数
***************************************/
enum KIRA0_WORK{
	K0WK_POS, K0WK_TIMER, K0WK_LEVEL, K0WK_NUM,
};
// 一定時間待機後、エフェクトをリスタート
static void kira_actmove_timer(actWork *act)
{
	if(++(act->work[K0WK_TIMER]) > 60){
		act->work[K0WK_TIMER] = 0;
		kira_setmove(act->work[K0WK_LEVEL], 0);
	}
}
// アニメ終了したらリスタート
static void kira_actmove_restart(actWork *act)
{
	if(act->anmend_sw){
		act->work[K0WK_TIMER] = 0;
		act->move = kira_actmove_timer;
	}
}
// キラキラ位置セット
static void set_kiraact_pos(actWork *act)
{
	static const s16 pos_tbl[][2] = {
/*
		{   0, -35 },{  10, -33 },{  20, -28 },{  28, -20 },
		{  33, -10 },{  35,   0 },{  33,  10 },{  28,  20 },
		{  20,  28 },{  10,  33 },{   0,  35 },{ -10,  33 },
		{ -20,  28 },{ -28,  20 },{ -33,  10 },{ -35,   0 },
		{ -33, -10 },{ -28, -20 },{ -20, -28 },{ -10, -33 },
*/
		{   0, -35 },{  20, -28 },{  33, -10 },{  33,  10 },
		{  20,  28 },{   0,  35 },{ -20,  28 },{ -33,  10 },
		{ -33, -10 },{ -20, -28 },
	};

	if(NaviWork->poke_actor != NULL){
		act->x = NaviWork->poke_actor->x + NaviWork->poke_actor->dx + pos_tbl[act->work[K0WK_POS]][0];
		act->y = NaviWork->poke_actor->y + NaviWork->poke_actor->dy + pos_tbl[act->work[K0WK_POS]][1];
	}else{
		act->x = KIRA_CX + pos_tbl[act->work[K0WK_POS]][0];
		act->y = KIRA_CY + pos_tbl[act->work[K0WK_POS]][1];
	}
}
// エフェクト中
static void kira_actmove_0(actWork *act)
{
	if(act->work[K0WK_TIMER]){
		act->work[K0WK_TIMER]--;
		if(act->work[K0WK_TIMER]){
			return;
		}
		ActAnmOffsChg(act, 0);
		act->banish = 0;
	}

	set_kiraact_pos(act);

	if(act->anmend_sw){
		act->banish = 1;
		if(act->work[K0WK_NUM] == act->work[K0WK_LEVEL]){
			if(act->work[K0WK_LEVEL] == FUR_LV_MAX){
				kira_anm_restart();
				act->move = kira_actmove_restart;
			}else{
				act->move = kira_actmove_timer;
			}
		}else{
			act->move = DummyActMove;
		}
	}

}
/***************************************
**	動作関数を決定
***************************************/
static void kira_setmove(u8 lv, u8 init)
{
	// 今は全レベルで同じ動作
	u16 i;
	for(i = 0; i < KIRA_MAX; i++){
		if(NaviWork->kira_actor[i] != NULL){
			NaviWork->kira_actor[i]->work[K0WK_POS] = i;
			NaviWork->kira_actor[i]->work[K0WK_TIMER] = i * 16 + 1;
			NaviWork->kira_actor[i]->work[K0WK_LEVEL] = lv;
			NaviWork->kira_actor[i]->work[K0WK_NUM] = i;

			if(init == 0 || lv != FUR_LV_MAX){
				NaviWork->kira_actor[i]->move = kira_actmove_0;
			}else{
				set_kiraact_pos(NaviWork->kira_actor[i]);
				kira_anm_restart();
				NaviWork->kira_actor[i]->move = kira_actmove_restart;
				NaviWork->kira_actor[i]->banish = 0;
			}
		}
	}



}
/***************************************
**	アニメのリスタート
***************************************/
static void kira_anm_restart()
{
	u16 i;
	for(i = 0; i < KIRA_MAX; i++){
		if(NaviWork->kira_actor[i] != NULL){
			ActAnmOffsChg(NaviWork->kira_actor[i], 0);
			NaviWork->kira_actor[i]->banish = 0;
		}
	}
}
static const ActOamData KiraOam = {
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
	0,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actAnm KiraAnm[]={
	{0,5,0,0},
	{4,5,0,0},
	{8,5,0,0},
	{12,5,0,0},
	{16,5,0,0},
	{20,5,0,0},
	{24,5,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm *const KiraAnmTbl[]={
	KiraAnm + 0, KiraAnm + 2, KiraAnm + 4, KiraAnm + 6,
	KiraAnm + 8, KiraAnm + 10, KiraAnm + 12,
};
static const actHeader KiraHeader = {
	CELLID_KIRA,
	PALID_KIRA,
	&KiraOam,
	KiraAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	kira_actmove_0,
};
/*====================================================================*/
/*   トレナビアイコン                                                 */
/*====================================================================*/
#define NAVIICON_X  (218)
#define NAVIICON_Y  (14)

static const actHeader IconHeader;

void TNaviObj_AddIcon_Begin(void)
{
	NaviWork->divide_prog = 0;
	if(NaviWork->comm_flg == FALSE){
		while(1){
			if(!TNaviObj_AddIcon()){ return; }
		}
	}
}
u8 TNaviObj_AddIcon(void)
{
	switch(NaviWork->divide_prog){
	case 0:
		LZ77UnCompWram(naviicon_Character, (void*)(NaviWork->PokeCellWork));
		break;

	case 1:
		{
			CellData cell = { (const u8*)(NaviWork->PokeCellWork), OBJ_SIZE16_32x32*8, CELLID_ICON };
			CellSet(&cell);
		}
		break;

	case 2:
		{
			PalData pal = { naviicon_Palette, PALID_ICON };
			u8  palno;

			ObjPalSet(&pal);

			palno = ObjPalNumGet(PALID_ICON);
			NaviWork->fade_bit = 0xfffffffd & ~(1 << (16+palno));
		}
		break;

	case 3:
		{
			u16 no;

			no = AddActor(&IconHeader, NAVIICON_X, NAVIICON_Y, ACTPRI_NAVIICON);
			if(no != ACT_MAX){
				NaviWork->icon_actor = &ActWork[no];
				NaviWork->icon_actor->work[0] = 0;
			}else{
				NaviWork->icon_actor = NULL;
			}
		}
		NaviWork->divide_prog++;
		return 0;

	default:
		return 0;
	}

	NaviWork->divide_prog++;
	return 1;
}
//=====================================
//  動作関数
//=====================================
static void navi_icon_actmove(actWork *act)
{
	act->dy = -(NaviWork->combg_vofs);
	if(act->dy <= -32){
		if(act->work[0] == 0){
			act->banish = 1;
			act->work[0] = 1;
		}
	}else{
		if(act->work[0] == 1){
			act->banish = 0;
			act->work[0] = 0;
		}
	}
}
//=====================================
//  アニメ
//=====================================
#define ICON_ANM_WAIT  (12)
static const actAnm NaviIconAnm[]={
	{OBJ16_32x32*0,ICON_ANM_WAIT,0,0},
	{OBJ16_32x32*1,ICON_ANM_WAIT,0,0},
	{OBJ16_32x32*2,ICON_ANM_WAIT,0,0},
	{OBJ16_32x32*3,ICON_ANM_WAIT,0,0},
	{OBJ16_32x32*4,ICON_ANM_WAIT,0,0},
	{OBJ16_32x32*5,ICON_ANM_WAIT,0,0},
	{OBJ16_32x32*6,ICON_ANM_WAIT,0,0},
	{OBJ16_32x32*7,ICON_ANM_WAIT,0,0},
	{ACT_ANMLOOP,0,0,0}
};
static const actAnm *const NaviIconAnmTbl[]={
	NaviIconAnm,
};



static const ActOamData IconOam = {
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
	0,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actHeader IconHeader = {
	CELLID_ICON,
	PALID_ICON,
	&IconOam,
	NaviIconAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	navi_icon_actmove,
};
/*====================================================================*/
/*   トレーナーアイの帯                                               */
/*====================================================================*/
#define OBI_YORG  (32)
#define OBI_XORG  (120)
#define OBI_CELL_SIZE   (0x20*16*4)
static const actHeader ObiHeader;

void MakeTEyeObj(u8 *str)
{
	static const PalData pal = { obi_Palette, PALID_OBI };
	CellData cell = { NaviWork->PokeCell[0], OBI_CELL_SIZE, CELLID_OBI };
	u16 i,no,char_no;

	BoxDrawFont_32x16(str, NaviWork->PokeCell[0], DRAWTYPE_16NOTRANS, 0x01, NaviWork->PokeCellWork);

	CellSet(&cell);
	ObjPalSet(&pal);

	char_no = 0;
	for(i = 0; i < OBI_XMAX; i++)
	{
		no = AddActor(&ObiHeader,OBI_XORG+i*32,OBI_YORG-16,0);
		if(no != ACT_MAX){
			ActWork[no].oamData.CharNo += char_no;
			NaviWork->obi_actor[i] = &ActWork[no];
		}else{
			NaviWork->obi_actor[i] = NULL;
		}
		char_no += 8;
	}

}
void DelTEyeObj(void)
{
	u16 i;

	for(i = 0; i < OBI_XMAX; i++)
	{
		if(NaviWork->obi_actor[i] != NULL){
			DelActor(NaviWork->obi_actor[i]);
		}
	}
	CellDel(CELLID_OBI);
	ObjPalRegNumDel(PALID_OBI);

}
void TEyeObjStrChange(u8 *str)
{
	u16 charno;

	BoxDrawFont_32x16(str, NaviWork->PokeCell[0], DRAWTYPE_16NOTRANS, 0x01, NaviWork->PokeCellWork);
	charno = CellCharNumGet(CELLID_OBI);
	if(charno != 0xffff){
		DIV_DMACOPY(3,NaviWork->PokeCell,OBJ_MODE0_VRAM+charno*0x20, OBI_CELL_SIZE, 32);
	}
}

static const ActOamData ObiOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	1,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	2,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	3,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actHeader ObiHeader = {
	CELLID_OBI,
	PALID_OBI,
	&ObiOam,
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	DummyActMove,
};
