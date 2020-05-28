/***********************************************************************
**	トレナビ（メイン）
***********************************************************************/
#include "tnavi_com.h"
#include "fld_main.h"
#include "poketool.h"
#include "objdata.h"
#include "a_enemy.h"
#include "decord.h"
#include "mus_tool.h"
#include "laster.h"
#include "fld_sio.h"
#include "ev_flag.h"
#include "sysflag.h"

/*==============================================
==	定数
==============================================*/
enum DISPCNT_MODE {
	DISPMODE_MENU,
	DISPMODE_MAP,
	DISPMODE_CONDITION,
	DISPMODE_RIBON,
	DISPMODE_LIST,
	DISPMODE_TRAINEREYE,
};

#define TNAVI_FADE_WAIT  (-1)

/*==============================================
==	グローバル変数
==============================================*/
TNAVI_WORK * const NaviWork = (TNAVI_WORK*)UserWork;

/*==============================================
==	プロトタイプ
==============================================*/
static void TNaviMain(void);
static void TNaviVBlankIntr(void);
static void TNavi_ConditionVIntr(void);
static void TNavi_MapVIntr(void);
static void change_sub(pFunc func);

/* 計算等 */
static void init_data(void);
static void change_menu_init(u8 menu_type, u8 sel, u8 label);
static u8 change_menu(void);

static u8 menu_key_control(void);
static u8 mainmenu_key_control(void);
static void dispcnt_off(void);
static void dispcnt_off_menu(void);
static void dispcnt_on(u8 mode);

/* サブプロセス */
static void sub_fwd_mainmenu(void);
static void sub_conmenu_to_mainmenu(void);
static void sub_mainmenu(void);

static void sub_mainmenu_to_conditionmenu(void);
static void sub_conditionmenu(void);
static void sub_searchmenu_to_conditionmenu(void);
static void sub_ret_condition_menu(void);
static void sub_fwd_list_condition(void);

static void sub_conditionmenu_to_searchmenu(void);
static void sub_searchmenu(void);
static void sub_ret_searchmenu(void);
static void sub_fwd_searchlist(void);
static void sub_searchlist(void);
static void sub_ret_search_list(void);

static void sub_fwd_map(void);
static void sub_map(void);

static void sub_fwd_stock_condition(void);
static void sub_condition(void);

static void sub_fwd_ribonlist(void);
static void sub_ribonlist(void);
static void sub_ribon_list_to_main(void);
static void sub_list_to_ribon(void);
static void sub_ribon(void);
static void sub_ret_ribonlist(void);

static void sub_fwd_trainereye(void);
static void sub_trainerlist(void);
static void sub_trainerlist_to_main(void);
static void sub_trainer_data(void);

static void sub_fadeout(void);



/*====================================================================*/
/*   プロセス初期化                                                   */
/*====================================================================*/
static void TNaviInit_Comb(void);

void TNaviInit(void)
{
	switch(sys.InitSeqWork){
	default:
		sys.InitSeqWork = 0;

	case 0:
		// 通信中フラグ
		NaviWork->comm_flg = IsFieldCommMode();
		if(NaviWork->comm_flg == FALSE)
		{
			NaviWork->init_end = 0;
			sys.InitSeqWork++;
			MainProcChange(TNaviInit_Comb);
		}
		break;

	case 1:
		SetVBlankFunc(NULL);
		break;

	case 2:
		PaletteAnimeInit();
		break;

	case 3:
		InitActor();
		break;

	case 4:
		ObjPalManInit();
		break;

	case 5:
		InitTask();
		break;

	case 6:
		LasterInit();
		break;

	case 7:
		TNaviObj_TagInitBegin();
		sys.InitSeqWork++;
	case 8:
		if(TNaviObj_TagInit()){
			return;
		}
		break;

	case 9:
		TNaviObj_LabelInitBegin();
		sys.InitSeqWork++;
	case 10:
		if(TNaviObj_LabelInit()){
			return;
		}
		break;

	case 11:
		TNaviObj_RibbonCellMake_Begin();
		sys.InitSeqWork++;
	case 12:
		if(TNaviObj_RibbonCellMake()){
			return;
		}
		break;

	case 13:
		init_data();
		change_sub(sub_fwd_mainmenu);
		break;

	case 14:
		NaviWork->init_end = 1;

		SePlay(SE_PN_ON);

		MainProcChange(TNaviMain);
		SetVBlankFunc(TNaviVBlankIntr);
		break;
	}

	sys.InitSeqWork++;
}
//===========================================
// 分割せずに初期化
//===========================================
static void TNaviInit_Comb(void)
{
	while(NaviWork->init_end == 0)
	{
		TNaviInit();
	}
}
/*====================================================================*/
/*  データ初期化                                                      */
/*====================================================================*/
static void init_mainmenu_contents(void);

// 初期化メイン
static void init_data(void)
{
	u16 i;

	KeyRepeatStartWait= 20;

	NaviWork->stock_poke_cnt = PokeCountMineGet();
	NaviWork->mainmenu_sel = 0;
	NaviWork->calc_win_flag = 0;
	NaviWork->poke_actor = NULL;
	NaviWork->trainer_actor = NULL;

	// レーダー座標データの終端
	for(i = 0; i < 5; i++){
		NaviWork->poke_param[3][i] = 0;
		NaviWork->point[3][i].x = RADOR_CX;
		NaviWork->point[3][i].y = RADOR_CY;
	}

	NaviWork->mapwk.bgscr_req = 0;

	// メインメニューコンテンツの初期化
	init_mainmenu_contents();
}
//===========================================
// メインメニューコンテンツの初期化
//===========================================
static void init_mainmenu_contents(void)
{
	NaviWork->mainmenu_contents[0] = MAINMENU_MAP;
	NaviWork->mainmenu_contents[1] = MAINMENU_CONDITION;
	NaviWork->mainmenu_contents[2] = MAINMENU_TRAINER;

//  ↓リボンのみ、フラグを見て判断する
	if(EventFlagCheck(SYS_RIBBON_GET)){
		NaviWork->mainmenu_contents[3] = MAINMENU_RIBBON;
	}else{
		NaviWork->mainmenu_contents[3] = MAINMENU_NULL;
	}


	NaviWork->mainmenu_contents[4] = MAINMENU_END;
}
/*====================================================================*/
/*   V Blank                                                          */
/*====================================================================*/
// メニュー画面
static void TNaviVBlankIntr(void)
{
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
	TNaviObj_TagEffect();
}
// マップ画面
static void TNavi_MapVIntr(void)
{
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
	TownMapScroll();
	TNaviBG_MinimapInfoTrans();
}
// コンディション画面
static void TNavi_ConditionVIntr(void)
{
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
	TNaviSub_CalcRador();
	LasterVblank();
}
// トレーナーアイ画面
static void TNavi_EyeVIntr(void)
{
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
	TNaviSub_RevengeIconEff();
}
// アクターだけを転送（NULLだとｱｲｺﾝが表示されないため）
static void TNavi_ActVIntr(void)
{
	actOAMtrans();
	actDMAtrans();
}
/*====================================================================*/
/*   メインプロセス                                                   */
/*====================================================================*/
static void TNaviMain(void)
{
	(*(NaviWork->sub_proc))();
	JumpActor();
	SetActor();
	MainTask();
	PaletteAnime();
}
/*============================================*/
/*  サブプロセス変更                          */
/*============================================*/
static void change_sub(pFunc func)
{
	NaviWork->sub_proc = func;
	NaviWork->prog = 0;
}
/*============================================*/
/*  初期状態→メインメニューへ                */
/*============================================*/
static void sub_fwd_mainmenu(void)
{
	switch(NaviWork->prog){
	case 0:
		SetVBlankFunc(NULL);
		*(vu16*)REG_DISPCNT = 0;

		NaviWork->menu_sel = NaviWork->mainmenu_sel;
		NaviWork->menu_cnt = 5;
		NaviWork->prog++;
		break;

	case 1:
		TNaviObj_AddIcon_Begin();
		NaviWork->prog++;
	case 2:
		if(!TNaviObj_AddIcon()){
			NaviWork->prog++;
		}
		break;

	case 3:
		TNaviObj_AddLamp();
		NaviWork->prog++;
		break;

	case 4:
		TNaviBG_InitCommon_Begin();
		NaviWork->prog++;
	case 5:
		if(!TNaviBG_InitCommon()){
			TNaviBG_ResetProg();
			NaviWork->prog++;
		}
		break;

	case 6:
		TNaviBG_InitMenu_Begin(MENUTYPE_MAIN);
		NaviWork->prog++;
	case 7:
		if(!TNaviBG_InitMenu(MENUTYPE_MAIN)){
			NaviWork->prog++;
		}
		break;

	case 8:
		TNaviObj_AddTagInit_Begin(MENUTYPE_MAIN);
		NaviWork->prog++;
	case 9:
		if(!TNaviObj_AddTagInit(MENUTYPE_MAIN)){
			NaviWork->prog++;
		}
		break;

	case 10:
		SetVBlankFunc(TNaviVBlankIntr);
		NaviWork->prog++;
		break;

	case 11:
		PaletteFadeReq(0xffffffff, 0, 16, 0, 0x0000);
		NaviWork->prog++;
		break;

	case 12:
		dispcnt_on(DISPMODE_MENU);
		NaviWork->prog++;
		break;

	case 13:
		if(FadeData.fade_sw == 0){
			NaviWork->prog++;
		}
		break;

	case 14:
		TNaviObj_AddLabel_Begin(LABEL_MAIN);
		NaviWork->prog++;
	case 15:
		if(!TNaviObj_AddLabel(LABEL_MAIN)){
			NaviWork->prog++;
		}
		break;

	case 16:
		TNaviObj_AddTagRun();
		NaviWork->prog++;
		break;

	case 17:
		if(!TNaviObj_AddTagWait()){
			TNaviBG_WriteMenuInfo(MENUTYPE_MAIN, 0);
			change_sub(sub_mainmenu);
		}
		break;
	}
}
/*============================================*/
/*  他画面アウト状態→メインメニュー          */
/*============================================*/
static void sub_ret_mainmenu(void)
{
	switch(NaviWork->prog){
	case 0:
		if(!TNaviBG_ScrollDownCommon()){
			SetVBlankFunc(TNavi_ActVIntr);
			dispcnt_off_menu();
			NaviWork->menu_sel = NaviWork->mainmenu_sel;
			NaviWork->menu_cnt = 5;
			TNaviBG_ResetProg();
			NaviWork->prog++;
		}
		break;

	case 1:
		TNaviBG_InitMenu_Begin(MENUTYPE_MAIN);
		NaviWork->prog++;
	case 2:
		if(!TNaviBG_InitMenu(MENUTYPE_MAIN)){
			NaviWork->prog++;
		}
		break;

	case 3:
		TNaviObj_AddTagInit_Begin(MENUTYPE_MAIN);
		NaviWork->prog++;
	case 4:
		if(!TNaviObj_AddTagInit(MENUTYPE_MAIN)){
			NaviWork->prog++;
		}
		break;

	case 5:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 6:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 16, 0, 0x0000);
		SetVBlankFunc(TNaviVBlankIntr);
		NaviWork->prog++;
		break;

	case 7:
		dispcnt_on(DISPMODE_MENU);
		NaviWork->prog++;
		break;

	case 8:
		if(FadeData.fade_sw == 0){
			NaviWork->prog++;
		}
		break;

	case 9:
		TNaviObj_AddLamp();
		NaviWork->prog++;
		break;

	case 10:
		TNaviObj_AddLabel_Begin(LABEL_MAIN);
		NaviWork->prog++;
	case 11:
		if(!TNaviObj_AddLabel(LABEL_MAIN)){
			NaviWork->prog++;
		}
		break;

	case 12:
		TNaviObj_AddTagRun();
		NaviWork->prog++;
		break;

	case 13:
		if(!TNaviObj_AddTagWait()){
			TNaviBG_WriteMenuInfo(MENUTYPE_MAIN, NaviWork->menu_sel);
			change_sub(sub_mainmenu);
		}
		break;

	}
}
/*============================================*/
/*  コンディションメニュー→メインメニュー    */
/*============================================*/
static void sub_conmenu_to_mainmenu(void)
{
	switch(NaviWork->prog){
	case 0:
		TNaviObj_DelLabel(LABEL_CONDITION);
		change_menu_init(MENUTYPE_MAIN, NaviWork->mainmenu_sel, LABEL_MAIN);
		NaviWork->prog++;
		break;

	case 1:
		if(!change_menu()){
			change_sub(sub_mainmenu);
		}
		break;
	}
}
/*============================================*/
/*  メインメニュー                            */
/*============================================*/
static void sub_mainmenu(void)
{
	switch(NaviWork->prog){
	case 0:
		if(mainmenu_key_control()){
			SePlay(SE_SELECT);
			TNaviBG_WriteMenuInfo(MENUTYPE_MAIN, NaviWork->menu_sel);
			break;
		}
		if(sys.Trg & A_BUTTON){
			NaviWork->mainmenu_sel = NaviWork->menu_sel;
			switch(NaviWork->mainmenu_contents[NaviWork->mainmenu_sel]){
			case MAINMENU_MAP:
				SePlay(SE_SELECT);
				change_sub(sub_fwd_map);
				break;
			case MAINMENU_CONDITION:
				SePlay(SE_SELECT);
				change_sub(sub_mainmenu_to_conditionmenu);
				break;
			case MAINMENU_END:
				NaviWork->prog = 1;
				break;
			case MAINMENU_RIBBON: NaviWork->prog = 2; break;
			case MAINMENU_TRAINER: NaviWork->prog = 6; break;
			}
			break;
		}
		if(sys.Trg & B_BUTTON){
			NaviWork->prog = 1;
			break;
		}
		break;

	// スイッチオフ
	case 1:
		TNaviObj_TagEffectStop();
		change_sub(sub_fadeout);
		break;

	// きねんリボン
	case 2:
		TNaviSub_RibbonPokeCheckInit();
		NaviWork->prog++;
	case 3:
		if(!TNaviSub_RibbonPokeCheck()){
			NaviWork->prog++;
		}
		break;
	case 4:
		if(FieldRecvFifoClearWait() == FALSE){
			if(NaviWork->search_ribbon_result){
				SePlay(SE_SELECT);
				change_sub(sub_fwd_ribonlist);
			}else{
				SePlay(SE_HAZURE);
				TNaviBG_WriteMenuInfo(MENUTYPE_MAIN, 5);
				NaviWork->prog = 0xff;
			}
		}
		break;

	// トレーナーアイ
	case 6:
		TNaviSub_TrainerListInit();
		if(NaviWork->trainer_count){
			SePlay(SE_SELECT);
			change_sub(sub_fwd_trainereye);
		}else{
			SePlay(SE_HAZURE);
			TNaviBG_WriteMenuInfo(MENUTYPE_MAIN, 6);
			NaviWork->prog = 0xff;
		}
		break;

	// 警告後のキー待ち
	case 0xff:
		if(mainmenu_key_control()){
			SePlay(SE_SELECT);
			TNaviBG_WriteMenuInfo(MENUTYPE_MAIN, NaviWork->menu_sel);
			NaviWork->prog = 0;
			break;
		}
		if(sys.Trg & (A_BUTTON|B_BUTTON)){
			TNaviBG_WriteMenuInfo(MENUTYPE_MAIN, NaviWork->menu_sel);
			NaviWork->prog = 0;
		}
		break;

	}

}
/*============================================*/
/*  メインメニュー→マップ画面へ              */
/*============================================*/
static void sub_fwd_map(void)
{
	switch(NaviWork->prog){
	case 0:
		TNaviObj_DelTagInit();
		TNaviObj_DelLabel(LABEL_MAIN);
		NaviWork->prog++;
		break;

	case 1:
		if(!TNaviObj_DelTagWait()){
			TNaviBG_MenuWriteCommon((MyData.tnavi_zoom)? COMMENU_MAP_ZOOM : COMMENU_MAP_WHOLE);
			NaviWork->prog++;
		}
		break;

	case 2:
		if(!TNaviBG_ScrollUpCommon()){
			PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
			NaviWork->prog++;
		}
		break;

	case 3:
		if(FadeData.fade_sw == 0){
			SetVBlankFunc(NULL);
			dispcnt_off();
			NaviWork->prog++;
		}
		break;

	case 4:
		TNaviObj_DelLamp();
		NaviWork->prog++;
		break;

	case 5:
		TNaviBG_MenuScrollQuit();
		NaviWork->prog++;
		break;

	case 6:
		TNaviBG_InitMapMode_Begin();
		NaviWork->prog++;
	case 7:
		if(!TNaviBG_InitMapMode()){
			NaviWork->prog++;
		}
		break;

	case 8:
		TNaviObj_AddLabel_Begin(LABEL_MAP);
		NaviWork->prog++;
	case 9:
		if(!TNaviObj_AddLabel(LABEL_MAP)){
			NaviWork->prog++;
		}
		break;

	case 10:
		TNaviObj_AddMap();
		SetVBlankFunc(TNavi_MapVIntr);
		NaviWork->prog++;
		break;

	case 11:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 12:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 16, 0, 0x0000);
		NaviWork->prog++;
		break;

	case 13:
		dispcnt_on(DISPMODE_MAP);
		NaviWork->prog++;
		break;

	case 14:
		if(FadeData.fade_sw == 0){
			change_sub(sub_map);
		}
		break;

	}
}
/*============================================*/
/*  マップ画面                                */
/*============================================*/
static void sub_map(void)
{
	enum {
		MAP_KEYWAIT,
		MAP_MODECHANGE, MAP_MODECHANGE_1, MAP_MODECHANGE_2, 
		MAP_RETMENU, MAP_RETMENU_1, MAP_RETMENU_2,
	};

	switch(NaviWork->prog){
	case MAP_KEYWAIT:
		switch(TownMapKeyRead()){
		case MAPKEY_MOVE:
			break;

		case MAPKEY_CHANGE:
			TNaviBG_MapInfoWrite();
			break;

		case MAPKEY_DECIDE:
			SePlay(SE_SELECT);
			NaviWork->prog = MAP_MODECHANGE;
			break;

		case MAPKEY_CANCEL:
			SePlay(SE_SELECT);
			NaviWork->prog = MAP_RETMENU;
			break;
		}
		break;

	case MAP_MODECHANGE:
		if(NaviWork->mapwk.mode == TOWNMAP_WHOLE){
			TownMapModeChangeInit();
			NaviWork->prog++;
		}else{
			if(!TNaviBG_MapInfoScroll(1)){
				TownMapModeChangeInit();
				NaviWork->prog++;
			}
		}
		break;

	case MAP_MODECHANGE_1:
		if(!TownMapModeChange()){
			if(NaviWork->mapwk.mode == TOWNMAP_WHOLE){
				TNaviBG_MapExpUpdate();
				NaviWork->prog = MAP_KEYWAIT;
			}else{
				NaviWork->prog++;
			}
		}
		break;

	case MAP_MODECHANGE_2:
		if(!TNaviBG_MapInfoScroll(0)){
			TNaviBG_MapExpUpdate();
			NaviWork->prog = MAP_KEYWAIT;
		}
		break;

	case MAP_RETMENU:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
		NaviWork->prog++;
		break;

	case MAP_RETMENU_1:
		if(FadeData.fade_sw == 0){
			TNaviObj_DelMap();
			TNaviObj_DelLabel(LABEL_MAP);
			MyData.tnavi_zoom = (NaviWork->mapwk.mode == TOWNMAP_ZOOM);
			change_sub(sub_ret_mainmenu);
		}
		break;
	}
}
/*============================================*/
/*  メインメニュー→コンディションメニューへ  */
/*============================================*/
static void sub_mainmenu_to_conditionmenu(void)
{
	switch(NaviWork->prog){
	case 0:
		TNaviObj_DelLabel(LABEL_MAIN);
		change_menu_init(MENUTYPE_CONDITION, 0, LABEL_CONDITION);
		NaviWork->prog++;
		break;

	case 1:
		if(!change_menu()){
			change_sub(sub_conditionmenu);
		}
		break;
	}
}
/*============================================*/
/*  コンディションメニュー                    */
/*============================================*/
static void sub_conditionmenu(void)
{
	switch(NaviWork->prog){
	case 0:
		if(menu_key_control()){
			SePlay(SE_SELECT);
			TNaviBG_WriteMenuInfo(MENUTYPE_CONDITION, NaviWork->menu_sel);
			break;
		}
		if(sys.Trg & A_BUTTON){
			SePlay(SE_SELECT);
			NaviWork->conditionmenu_sel = NaviWork->menu_sel;
			switch(NaviWork->conditionmenu_sel){
			case 0: change_sub(sub_fwd_stock_condition); break;
			case 1: change_sub(sub_conditionmenu_to_searchmenu); break;
			case 2: change_sub(sub_conmenu_to_mainmenu); break;
			}
			break;
		}
		if(sys.Trg & B_BUTTON){
			SePlay(SE_SELECT);
			NaviWork->conditionmenu_sel = 2;
			NaviWork->menu_sel = 2;
			NaviWork->prog++;
			break;
		}
		break;

	case 1:
		if(!TNaviObj_MoveTagWait()){
			change_sub(sub_conmenu_to_mainmenu);
		}
		break;

	}
}
/*============================================*/
/*  コンディションメニュー→サーチメニュー    */
/*============================================*/
static void sub_conditionmenu_to_searchmenu(void)
{
	switch(NaviWork->prog){
	case 0:
		change_menu_init(MENUTYPE_SEARCH, 0, LABEL_SEARCH);
		NaviWork->prog++;
		break;

	case 1:
		if(!change_menu()){
			change_sub(sub_searchmenu);
		}
		break;
	}
}
/*============================================*/
/*  サーチメニュー→コンディションメニュー    */
/*============================================*/
static void sub_searchmenu_to_conditionmenu(void)
{
	switch(NaviWork->prog){
	case 0:
		TNaviObj_DelLabel(LABEL_SEARCH);
		change_menu_init(MENUTYPE_CONDITION, NaviWork->conditionmenu_sel, LABEL_NO);
		NaviWork->prog++;
		break;

	case 1:
		if(!change_menu()){
			change_sub(sub_conditionmenu);
			TNaviBG_WriteMenuInfo(MENUTYPE_CONDITION, NaviWork->menu_sel);
		}
		break;
	}
}
/*============================================*/
/*  コンディションメニューへ復帰              */
/*============================================*/
static void sub_ret_condition_menu(void)
{
	switch(NaviWork->prog){
	case 0:
		if(!TNaviBG_ScrollDownCommon()){
			SetVBlankFunc(TNavi_ActVIntr);
			dispcnt_off_menu();
			NaviWork->menu_sel = NaviWork->conditionmenu_sel;
			NaviWork->menu_cnt = 3;
			TNaviBG_ResetProg();
			NaviWork->prog++;
		}
		break;

	case 1:
		TNaviBG_InitMenu_Begin(MENUTYPE_CONDITION);
		NaviWork->prog++;
	case 2:
		if(!TNaviBG_InitMenu(MENUTYPE_CONDITION)){
			NaviWork->prog++;
		}
		break;

	case 3:
		TNaviObj_AddTagInit_Begin(MENUTYPE_CONDITION);
		NaviWork->prog++;
	case 4:
		if(!TNaviObj_AddTagInit(MENUTYPE_CONDITION)){
			NaviWork->prog++;
		}
		break;

	case 5:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 6:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 16, 0, 0x0000);
		SetVBlankFunc(TNaviVBlankIntr);
		NaviWork->prog++;
		break;

	case 7:
		dispcnt_on(DISPMODE_MENU);
		NaviWork->prog++;
		break;

	case 8:
		TNaviObj_AddLamp();
		NaviWork->prog++;
		break;

	case 9:
		if(FadeData.fade_sw == 0){
			NaviWork->prog++;
		}
		break;

	case 10:
		TNaviObj_AddLabel_Begin(LABEL_CONDITION);
		NaviWork->prog++;
	case 11:
		if(!TNaviObj_AddLabel(LABEL_CONDITION)){
			NaviWork->prog++;
		}
		break;

	case 12:
		TNaviObj_AddTagRun();
		NaviWork->prog++;
		break;

	case 13:
		if(!TNaviObj_AddTagWait()){
			TNaviBG_WriteMenuInfo(MENUTYPE_CONDITION, NaviWork->menu_sel);
			change_sub(sub_conditionmenu);
		}
		break;
	}
}
/*============================================*/
/*  サーチメニュー                            */
/*============================================*/
static void sub_searchmenu(void)
{
	switch(NaviWork->prog){
	case 0:
		if(menu_key_control()){
			SePlay(SE_SELECT);
			TNaviBG_WriteMenuInfo(MENUTYPE_SEARCH, NaviWork->menu_sel);
			return;
		}

		if(sys.Trg & A_BUTTON){
			SePlay(SE_SELECT);
			switch(NaviWork->menu_sel){
			case 0: NaviWork->sort_ID = ID_style; break;
			case 1: NaviWork->sort_ID = ID_beautiful; break;
			case 2: NaviWork->sort_ID = ID_cute; break;
			case 3: NaviWork->sort_ID = ID_clever; break;
			case 4: NaviWork->sort_ID = ID_strong; break;
			case 5: change_sub(sub_searchmenu_to_conditionmenu); return;
			}
			NaviWork->searchmenu_sel = NaviWork->menu_sel;
			NaviWork->condition_mode = CONDITION_MODE_SEARCH;
			change_sub(sub_fwd_searchlist);
			return;
		}

		if(sys.Trg & B_BUTTON){
			SePlay(SE_SELECT);
			NaviWork->menu_sel = 5;
			NaviWork->prog++;
			break;
		}
		break;

	case 1:
		if(!TNaviObj_MoveTagWait()){
			change_sub(sub_searchmenu_to_conditionmenu);
		}
		break;
	}
}
/*============================================*/
/*  サーチリスト→サーチメニュー              */
/*============================================*/
static void sub_ret_searchmenu(void)
{
	switch(NaviWork->prog){
	case 0:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
		NaviWork->prog++;
		break;

	case 1:
		if(FadeData.fade_sw == 0){
			NaviWork->prog++;
		}
		break;

	case 2:
		if(!TNaviBG_ScrollDownCommon()){
			SetVBlankFunc(TNavi_ActVIntr);
			NaviWork->prog++;
		}
		break;

	case 3:
		dispcnt_off_menu();
		TNaviObj_ListDel();
		NaviWork->prog++;
		break;

	case 4:
		TNaviObj_DelLabelNow(LABEL_CONDITION);
		NaviWork->prog++;
		break;

	case 5:
		TNaviObj_DelLabelNow(LABEL_SEARCH);
		NaviWork->prog++;
		break;

	case 6:
		NaviWork->menu_sel = NaviWork->searchmenu_sel;
		NaviWork->menu_cnt = 6;
		TNaviBG_ResetProg();
		NaviWork->prog++;
		break;

	case 7:
		TNaviBG_InitMenu_Begin(MENUTYPE_SEARCH);
		NaviWork->prog++;
	case 8:
		if(!TNaviBG_InitMenu(MENUTYPE_SEARCH)){
			NaviWork->prog++;
		}
		break;

	case 9:
		TNaviObj_AddTagInit_Begin(MENUTYPE_SEARCH);
		NaviWork->prog++;
	case 10:
		if(!TNaviObj_AddTagInit(MENUTYPE_SEARCH)){
			NaviWork->prog++;
		}
		break;

	case 11:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 12:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 16, 0, 0x0000);
		SetVBlankFunc(TNaviVBlankIntr);
		NaviWork->prog++;
		break;

	case 13:
		dispcnt_on(DISPMODE_MENU);
		NaviWork->prog++;
		break;

	case 14:
		TNaviObj_AddLamp();
		NaviWork->prog++;
		break;

	case 15:
		if(FadeData.fade_sw == 0){
			NaviWork->prog++;
		}
		break;

	case 16:
		TNaviObj_AddLabel_Begin(LABEL_CONDITION);
		NaviWork->prog++;
	case 17:
		if(!TNaviObj_AddLabel(LABEL_CONDITION)){
			NaviWork->divide_prog = 0;
			NaviWork->prog++;
		}
		break;

	case 18:
		TNaviObj_AddLabel_Begin(LABEL_SEARCH);
		NaviWork->prog++;
	case 19:
		if(!TNaviObj_AddLabel(LABEL_SEARCH)){
			TNaviObj_AddTagRun();
			NaviWork->prog++;
		}
		break;

	case 20:
		if(!TNaviObj_AddTagWait()){
			TNaviBG_WriteMenuInfo(MENUTYPE_SEARCH, NaviWork->menu_sel);
			change_sub(sub_searchmenu);
		}
		break;
	}
}
/*============================================*/
/*  サーチメニュー→サーチリスト              */
/*============================================*/
static void sub_fwd_searchlist(void)
{
	switch(NaviWork->prog){
	case 0:
		TNaviObj_DelTagInit();
		TNaviObj_DelLabel(LABEL_CONDITION);
		TNaviObj_DelLabel(LABEL_SEARCH);
		NaviWork->prog++;
		break;

	case 1:
		if(!TNaviObj_DelTagWait()){
			TNaviBG_MenuWriteCommon(COMMENU_CONDITION_LIST);
			NaviWork->prog++;
		}
		break;

	case 2:
		if(!TNaviBG_ScrollUpCommon()){
			PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
			NaviWork->prog++;
		}
		break;

	case 3:
		if(FadeData.fade_sw == 0){
			SetVBlankFunc(NULL);
			dispcnt_off();
			TNaviBG_MenuScrollQuit();
			NaviWork->prog++;
		}
		break;

	case 4:
		TNaviObj_DelLamp();
		NaviWork->prog++;
		break;

	case 5:
		TNaviSub_ConditionSortInit();
		NaviWork->prog++;
	case 6:
		if(!TNaviSub_ConditionSort()){
			NaviWork->prog+=2;
		}else{
			NaviWork->prog++;
		}
		break;
	case 7:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog--;
		}
		break;

	case 8:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 9:
		TNaviBG_ListInit_Begin(LISTMODE_CONDITION);
		NaviWork->prog++;
	case 10:
		if(!TNaviBG_ListInit()){
			NaviWork->prog++;
		}
		break;

	case 11:
		TNaviObj_ListInit(LISTMODE_CONDITION);
		NaviWork->prog++;
		break;

	case 12:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 13:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 16, 0, 0x0000);
		SetVBlankFunc(TNaviVBlankIntr);
		NaviWork->prog++;
		break;

	case 14:
		dispcnt_on(DISPMODE_LIST);
		NaviWork->prog++;
		break;

	case 15:
		if(FadeData.fade_sw == 0){
			NaviWork->divide_prog = 0;
			NaviWork->prog++;
		}
		break;

	case 16:
		TNaviObj_AddLabel_Begin(LABEL_CONDITION);
		NaviWork->prog++;
	case 17:
		if(!TNaviObj_AddLabel(LABEL_CONDITION)){
			NaviWork->divide_prog = 0;
			NaviWork->prog++;
		}
		break;

	case 18:
		TNaviObj_AddLabel_Begin(LABEL_SEARCH_STYLE + NaviWork->searchmenu_sel);
		NaviWork->prog++;
	case 19:
		if(!TNaviObj_AddLabel(LABEL_SEARCH_STYLE + NaviWork->searchmenu_sel)){
			change_sub(sub_searchlist);
		}
		break;
	}
}
/*============================================*/
/*  サーチリスト                              */
/*============================================*/
static void sub_searchlist(void)
{
	switch(NaviWork->prog){

	case 0:
		switch(TNaviSub_ListKeyRead()){
		case LISTKEY_MOVE:
			SePlay(SE_SELECT);
			TNaviBG_WriteListRank();
			return;

		case LISTKEY_SCROLL:
			SePlay(SE_SELECT);
			NaviWork->prog++;
			return;
		}
		if(sys.Trg & A_BUTTON){
			SePlay(SE_SELECT);
			change_sub(sub_fwd_list_condition);
			return;
		}
		if(sys.Trg & B_BUTTON){
			SePlay(SE_SELECT);
			change_sub(sub_ret_searchmenu);
			return;
		}
		break;

	case 1:
		if(!TNaviBG_ListScrollWait()){
			TNaviBG_WriteListRank();
			TNaviObj_ArrowUpdate();
			NaviWork->prog++;
		}
		break;

	case 2:
		if(FieldRecvFifoClearWait()==FALSE){
			NaviWork->prog=0;
		}
		break;
	}
}
/*============================================*/
/*  サーチリストへ復帰                        */
/*============================================*/
static void sub_ret_search_list(void)
{
	switch(NaviWork->prog){
	case 0:
		SetVBlankFunc(NULL);
		NaviWork->prog++;
		break;

	case 1:
		dispcnt_off();
		TNaviSub_ListRecover();
		NaviWork->prog++;
		break;

	case 2:
		TNaviBG_MenuWriteCommon(COMMENU_CONDITION_LIST);
		NaviWork->prog++;
		break;

	case 3:
		TNaviBG_ListInit_Begin(LISTMODE_CONDITION);
		NaviWork->prog++;
	case 4:
		if(!TNaviBG_ListInit()){
			NaviWork->prog++;
		}
		break;

	case 5:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 6:
		TNaviObj_ListInit(LISTMODE_CONDITION);
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 16, 0, 0x0000);
		SetVBlankFunc(TNaviVBlankIntr);
		NaviWork->prog++;
		break;

	case 7:
		dispcnt_on(DISPMODE_LIST);
		NaviWork->prog++;
		break;

	case 8:
		if(FadeData.fade_sw == 0){
			change_sub(sub_searchlist);
		}
		break;
	}
}
/*============================================*/
/*  サーチリスト→コンディション              */
/*============================================*/
static void sub_fwd_list_condition(void)
{
	switch(NaviWork->prog){
	case 0:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
		NaviWork->prog++;
		break;

	case 1:
		if(FadeData.fade_sw == 0){

			SetVBlankFunc(NULL);
			dispcnt_off();
			TNaviObj_ListDel();
			NaviWork->prog++;
		}
		break;

	case 2:
		if(FieldRecvFifoClearWait()==FALSE){
			NaviWork->prog++;
		}
		break;

	case 3:
		TNaviSub_ConditionInitSort();
		NaviWork->prog++;
		break;

	case 4:
		TNaviBG_ConditionInit_Begin();
		NaviWork->prog++;
	case 5:
		if(!TNaviBG_ConditionInit()){
			NaviWork->prog++;
		}
		break;

	case 6:
		TNaviObj_SearchConditionInit();
		TNaviBG_MenuWriteCommon(COMMENU_CONDITION_SEARCH);
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 16, 0, 0x0000);
		SetVBlankFunc(TNavi_ConditionVIntr);
		NaviWork->prog++;
		break;

	case 7:
		dispcnt_on(DISPMODE_CONDITION);
		NaviWork->prog++;
		break;

	case 8:
		if(FadeData.fade_sw == 0){
			change_sub(sub_condition);
		}
		break;

	}
}
/*===============================================*/
/*  コンディションメニュー→てもちコンディション */
/*===============================================*/
static void sub_fwd_stock_condition(void)
{
	switch(NaviWork->prog){
	case 0:
		TNaviObj_DelTagInit();
		TNaviObj_DelLabel(LABEL_CONDITION);
		NaviWork->prog++;
		break;

	case 1:
		if(!TNaviObj_DelTagWait()){
			TNaviBG_MenuWriteCommon(COMMENU_CONDITION_STOCK);
			NaviWork->prog++;
		}
		break;

	case 2:
		if(!TNaviBG_ScrollUpCommon()){
			PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
			NaviWork->prog++;
		}
		break;

	case 3:
		if(FadeData.fade_sw == 0){
			SetVBlankFunc(NULL);
			dispcnt_off();
			TNaviBG_MenuScrollQuit();
			NaviWork->condition_mode = CONDITION_MODE_STOCK;
			NaviWork->prog++;
		}
		break;

	case 4:
		TNaviObj_DelLamp();
		NaviWork->prog++;
		break;

	case 5:
		NaviWork->font_base_pal = 2;
		TNaviSub_ConditionInitStock();
		NaviWork->prog++;
		break;

	case 6:
		TNaviBG_ConditionInit_Begin();
		NaviWork->prog++;
	case 7:
		if(!TNaviBG_ConditionInit()){
			NaviWork->prog++;
		}
		break;

	case 8:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 9:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 10:
		TNaviObj_StockConInit();
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 16, 0, 0x0000);
		SetVBlankFunc(TNavi_ConditionVIntr);
		NaviWork->prog++;
		break;

	case 11:
		dispcnt_on(DISPMODE_CONDITION);
		NaviWork->prog++;
		break;

	case 12:
		if(FadeData.fade_sw == 0){
			NaviWork->prog++;
		}
		break;

	case 13:
		TNaviObj_AddLabel_Begin(LABEL_CONDITION);
		NaviWork->prog++;
	case 14:
		if(!TNaviObj_AddLabel(LABEL_CONDITION)){
			NaviWork->prog++;
		}
		break;

	case 15:
		TNaviObj_AddLabel_Begin(LABEL_SEARCH_STOCK);
		NaviWork->prog++;
	case 16:
		if(!TNaviObj_AddLabel(LABEL_SEARCH_STOCK)){
			change_sub(sub_condition);
		}
		break;
	}
}
/*====================================*/
/*  コンディション画面                */
/*====================================*/
static void sub_condition(void)
{
	enum {
		IN, 
		LASTER_INIT,
		IN_WAIT1, IN_WAIT2,
		KEYWAIT,
		CHANGE_WAIT,
		FIFO_WAIT,
		MARKING_INIT, MARKING_WAIT,
		OUT, OUT_WAIT,
		FADEOUT,
	};

	switch(NaviWork->prog){
	case IN:
		TNaviSub_ConditionInInit();
		TNaviSub_LadorLasterInitBegin();
		NaviWork->prog = LASTER_INIT;
		break;

	case LASTER_INIT:
		if(!TNaviSub_LadorLasterInitMain()){
			NaviWork->prog = IN_WAIT1;
		}
		break;

	case IN_WAIT1:
		TNaviBG_RadorOn(1);
		NaviWork->prog = IN_WAIT2;
		break;

	case IN_WAIT2:
		if(!TNaviSub_ConditionIn()){
			TNaviObj_KiraInit();
			TNaviObj_KiraStart();
			NaviWork->prog = KEYWAIT;
		}
		break;

	case KEYWAIT:
		if(sys.Cont & U_KEY){
			if(NaviWork->list_kirikae_ok){
				if(NaviWork->condition_mode == CONDITION_MODE_STOCK
				|| NaviWork->condition_poke_sel != 0)
				{
					SePlay(SE_SELECT);
					TNaviSub_ConditionChangeInit(1);
					TNaviObj_KiraStop();
					NaviWork->prog = CHANGE_WAIT;
					break;
				}
			}
		}
		if(sys.Cont & D_KEY){
			if(NaviWork->list_kirikae_ok){
				if( NaviWork->condition_mode == CONDITION_MODE_STOCK
				||	NaviWork->condition_poke_sel < NaviWork->list_max){
					SePlay(SE_SELECT);
					TNaviSub_ConditionChangeInit(0);
					TNaviObj_KiraStop();
					NaviWork->prog = CHANGE_WAIT;
					break;
				}
			}
		}
		if(sys.Trg&B_BUTTON){
			SePlay(SE_SELECT);
			TNaviSub_ConditionOutInit();
			TNaviObj_KiraStop();
			NaviWork->prog = OUT;
			break;
		}
		if(sys.Trg & A_BUTTON){
			if(NaviWork->condition_mode == CONDITION_MODE_STOCK){
				if(NaviWork->condition_poke_sel == NaviWork->condition_poke_cnt - 1){
					SePlay(SE_SELECT);
					NaviWork->prog = OUT;
					break;
				}
			}else{
				if(NaviWork->comm_flg==0){
					SePlay(SE_SELECT);
					NaviWork->prog = MARKING_INIT;
				}
			}
		}
		break;

	case CHANGE_WAIT:
		if(!TNaviSub_ConditionChange()){
			TNaviObj_KiraStart();
			NaviWork->prog = FIFO_WAIT;
		}
		break;

	case FIFO_WAIT:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog = KEYWAIT;
		}
		break;

	case MARKING_INIT:
		TNaviBG_MenuWriteCommon(COMMENU_CONDITION_MARKING);
		TNaviObj_MarkingInit();
		NaviWork->prog = MARKING_WAIT;
		break;

	case MARKING_WAIT:
		if(!MarkingControl()){
			TNaviBG_MenuWriteCommon(COMMENU_CONDITION_SEARCH);
			TNaviObj_MarkingQuit();
			NaviWork->prog =KEYWAIT;
		}
		break;

	case OUT:
		if(!TNaviSub_ConditionOut()){
			TNaviBG_RadorOn(0);
			TNaviObj_PokeImgDel();
			PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
			NaviWork->prog = FADEOUT;
		}
		break;

	case FADEOUT:
		if(FadeData.fade_sw == 0){
			TNaviObj_KiraQuit();
			TNaviSub_LadorLasterQuit();
			if(NaviWork->condition_mode == CONDITION_MODE_STOCK){
				TNaviObj_StockConDel();
				TNaviObj_DelLabelNow(LABEL_CONDITION);
				TNaviObj_DelLabelNow(LABEL_SEARCH_STOCK);
				change_sub(sub_ret_condition_menu);
			}else{
				TNaviObj_SearchConditionQuit();
				change_sub(sub_ret_search_list);
			}
		}
		break;
	}

}
/*============================================*/
/*  メインメニュー→リボンリストへ            */
/*============================================*/
static void sub_fwd_ribonlist(void)
{
	switch(NaviWork->prog){
	case 0:
		TNaviObj_DelTagInit();
		TNaviObj_DelLabel(LABEL_MAIN);
		NaviWork->prog++;
		break;

	case 1:
		if(!TNaviObj_DelTagWait()){
			TNaviBG_MenuWriteCommon(COMMENU_RIBBON_LIST);
			NaviWork->prog++;
		}
		return;

	case 2:
		if(!TNaviBG_ScrollUpCommon()){
			PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
			NaviWork->prog++;
		}
		break;

	case 3:
		if(FadeData.fade_sw == 0){
			SetVBlankFunc(NULL);
			dispcnt_off();
			TNaviBG_MenuScrollQuit();
			NaviWork->prog++;
		}
		break;

	case 4:
		TNaviObj_DelLamp();
		NaviWork->prog++;
		break;

	case 5:
		TNaviSub_RibbonSortInit();
		NaviWork->prog++;
	case 6:
		if(!TNaviSub_RibbonSort()){
			NaviWork->prog += 2;
		}else{
			NaviWork->prog++;
		}
		break;
	case 7:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog--;
		}
		break;


	case 8:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 9:
		TNaviBG_ListInit_Begin(LISTMODE_RIBBON);
		NaviWork->prog++;
	case 10:
		if(!TNaviBG_ListInit()){
			NaviWork->prog++;
		}
		break;

	case 11:
		TNaviObj_AddLabel_Begin(LABEL_RIBBON);
		NaviWork->prog++;
	case 12:
		if(!TNaviObj_AddLabel(LABEL_RIBBON)){
			NaviWork->prog++;
		}
		break;

	case 13:
		TNaviObj_ListInit(LISTMODE_RIBBON);
		NaviWork->prog++;
		break;

	case 14:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 15:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 16, 0, 0x0000);
		SetVBlankFunc(TNaviVBlankIntr);
		NaviWork->prog++;
		break;

	case 16:
		dispcnt_on(DISPMODE_LIST);
		NaviWork->prog++;
		break;

	case 17:
		if(FadeData.fade_sw == 0){
			change_sub(sub_ribonlist);
		}
		break;
	}
}
/*============================================*/
/*  リボンリスト                              */
/*============================================*/
static void sub_ribonlist(void)
{
	switch(NaviWork->prog){
	case 0:
		switch(TNaviSub_ListKeyRead()){
		case LISTKEY_MOVE:
			SePlay(SE_SELECT);
			TNaviBG_WriteListRank();
			return;

		case LISTKEY_SCROLL:
			SePlay(SE_SELECT);
			NaviWork->prog++;
			return;
		}
		if(sys.Trg & A_BUTTON){
			SePlay(SE_SELECT);
			change_sub(sub_list_to_ribon);
			return;
		}
		if(sys.Trg & B_BUTTON){
			SePlay(SE_SELECT);
			change_sub(sub_ribon_list_to_main);
			return;
		}
		break;

	case 1:
		if(!TNaviBG_ListScrollWait()){
			TNaviBG_WriteListRank();
			TNaviObj_ArrowUpdate();
			NaviWork->prog++;
		}
		break;

	case 2:
		if(FieldRecvFifoClearWait()==FALSE){
			NaviWork->prog=0;
		}
		break;
	}
}
/*====================================*/
/*  リボンリスト→メインメニュー      */
/*====================================*/
static void sub_ribon_list_to_main(void)
{
	switch(NaviWork->prog){
	case 0:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
		NaviWork->prog++;
		break;

	case 1:
		if(FadeData.fade_sw == 0){
			TNaviObj_ListDel();
			TNaviObj_DelLabelNow(LABEL_RIBBON);
			NaviWork->prog++;
		}
		break;

	case 2:
		change_sub(sub_ret_mainmenu);
		break;
	}
}
/*====================================*/
/*  リボンリスト→リボン画面          */
/*====================================*/
static void sub_list_to_ribon(void)
{
	switch(NaviWork->prog){
	case 0:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
		NaviWork->prog++;
		break;

	case 1:
		if(FadeData.fade_sw == 0){

			SetVBlankFunc(NULL);
			dispcnt_off();
			TNaviObj_ListDel();
			NaviWork->prog++;
		}
		break;

	case 2:
		TNaviSub_RibbonDataInit();
		TNaviBG_ResetProg();
		NaviWork->prog++;
		break;

	case 3:
		if(!TNaviBG_RibonInit()){
			NaviWork->prog++;
		}
		break;

	case 4:
		TNaviBG_MenuWriteCommon(COMMENU_RIBBON_SELECT);
		TNaviObj_RibbonInit_Begin();
		NaviWork->prog++;
	case 5:
		if(!TNaviObj_RibbonInit()){
			NaviWork->prog++;
		}
		break;

	case 6:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 7:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 16, 0, 0x0000);
		SetVBlankFunc(TNaviVBlankIntr);
		NaviWork->prog++;
		break;

	case 8:
		dispcnt_on(DISPMODE_RIBON);
		NaviWork->prog++;
		break;

	case 9:
		if(FadeData.fade_sw == 0){
			NaviWork->prog++;
		}
		break;

	case 10:
		if(!TNaviBG_PokeWinUp()){
			change_sub(sub_ribon);
		}
		break;
	}
}
/*====================================*/
/*  リボン画面                        */
/*====================================*/
extern void PokeHyoGen(void);			// 020508_tomo
extern pFunc HGret;						// 020507_tomo
static void sub_ribon(void)
{
	switch(NaviWork->prog){
	// ポケモン切り替えモード -----------------------------
	case 0:
		TNaviBG_WriteRibbonCount();
		NaviWork->prog++;
		break;

	case 1:
		if(sys.Repeat & U_KEY){
			if(NaviWork->condition_poke_sel != 0){
				SePlay(SE_SELECT);
				TNaviSub_RibbonPokeChangeInit(-1);
				NaviWork->prog++;
				break;
			}
		}
		if(sys.Repeat & D_KEY){
			if(NaviWork->condition_poke_sel < NaviWork->list_max){
				SePlay(SE_SELECT);
				TNaviSub_RibbonPokeChangeInit(1);
				NaviWork->prog++;
				break;
			}
		}
		if(sys.Trg&A_BUTTON){
			SePlay(SE_SELECT);
			TNaviBG_MenuWriteCommon(COMMENU_RIBBON_DETAIL);
			NaviWork->prog = 4;
			break;
		}
		if(sys.Trg & B_BUTTON){
			SePlay(SE_SELECT);
			change_sub(sub_ret_ribonlist);
			break;
		}
		break;

	case 2:
		if(!TNaviSub_RibbonPokeChange()){
			NaviWork->prog++;
		}
		break;

	case 3:
		if(FieldRecvFifoClearWait()==FALSE){
			NaviWork->prog=0;
		}
		break;

	// リボン詳細モード ------------------------------------
	case 4:
		TNaviObj_RibbonDisp();
		NaviWork->prog++;
		break;

	case 5:
		if(!TNaviObj_RibbonDispWait()){
			TNaviBG_WriteRibonInfo();
//			TNaviBG_WriteRibbonPokeInfo();
			NaviWork->prog++;
		}
		break;

	case 6:
		switch(TNaviSub_RibonKeyRead()){
		case RIBBON_KEY_DEFAULT:
			break;

		case RIBBON_KEY_CHANGE:
			SePlay(SE_SELECT);
			TNaviObj_RibbonErase();
			NaviWork->prog = 7;
			return;
		}

		if(sys.Trg & B_BUTTON){
			SePlay(SE_SELECT);
			TNaviObj_RibbonErase();
			NaviWork->prog = 8;
			break;
		}
		break;

	// リボン消去待ち→次を表示
	case 7:
		if(!TNaviObj_RibbonEraseWait()){
			NaviWork->prog = 4;
		}
		break;

	// リボン消去待ち→切り替えモードへ
	case 8:
		if(!TNaviObj_RibbonEraseWait()){
			TNaviBG_MenuWriteCommon(COMMENU_RIBBON_SELECT);
			NaviWork->prog = 0;
		}
		break;
	}
}
/*====================================*/
/*  リボン画面→リボンリスト          */
/*====================================*/
static void sub_ret_ribonlist(void)
{
	switch(NaviWork->prog){
	case 0:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
		NaviWork->prog++;
		break;

	case 1:
		if(FadeData.fade_sw == 0){
			SetVBlankFunc(NULL);
			dispcnt_off();
			TNaviObj_RibbonQuit();
			TNaviBG_ResetProg();
			NaviWork->prog++;
		}
		break;

	case 2:
		TNaviSub_ListRecover();
		TNaviBG_ListInit_Begin(LISTMODE_RIBBON);
		NaviWork->prog++;
	case 3:
		if(!TNaviBG_ListInit()){
			NaviWork->prog++;
		}
		break;

	case 4:
		TNaviBG_MenuWriteCommon(COMMENU_RIBBON_LIST);
		TNaviObj_ListInit(LISTMODE_RIBBON);
		SetVBlankFunc(TNaviVBlankIntr);
		NaviWork->prog++;
		break;

	case 5:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 6:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 16, 0, 0x0000);
		NaviWork->prog++;
		break;

	case 7:
		dispcnt_on(DISPMODE_LIST);
		NaviWork->prog++;
		break;

	case 8:
		if(FadeData.fade_sw == 0){
			change_sub(sub_ribonlist);
		}
		break;
	}
}
/*====================================*/
/*  メインメニュー→トレーナーリスト  */
/*====================================*/
static void sub_fwd_trainereye(void)
{
	switch(NaviWork->prog){
	case 0:
		TNaviObj_DelTagInit();
		TNaviObj_DelLabel(LABEL_MAIN);
		NaviWork->prog++;
		break;

	case 1:
		if(!TNaviObj_DelTagWait()){
			TNaviBG_MenuWriteCommon(COMMENU_TRAINER_LIST);
			NaviWork->prog++;
		}
		return;

	case 2:
		if(!TNaviBG_ScrollUpCommon()){
			PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
			NaviWork->prog++;
		}
		break;

	case 3:
		if(FadeData.fade_sw == 0){
			SetVBlankFunc(NULL);
			dispcnt_off();
			TNaviBG_MenuScrollQuit();
			TNaviBG_ResetProg();
			NaviWork->prog++;
		}
		break;

	case 4:
		TNaviObj_DelLamp();
		NaviWork->prog++;
		break;

	case 5:
		TNaviBG_ListInit_Begin(LISTMODE_TRAINER);
		NaviWork->prog++;
	case 6:
		if(!TNaviBG_ListInit()){
			NaviWork->prog++;
		}
		break;

	case 7:
		TNaviObj_AddLabel_Begin(LABEL_TRAINER);
		NaviWork->prog++;
	case 8:
		if(!TNaviObj_AddLabel(LABEL_TRAINER)){
			NaviWork->prog++;
		}
		break;

	case 9:
		TNaviObj_ListInit(LISTMODE_TRAINER);
		NaviWork->prog++;
		break;

	case 10:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog++;
		}
		break;

	case 11:
		TNaviSub_RevengeIconEff_Init();
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 16, 0, 0x0000);
		SetVBlankFunc(TNavi_EyeVIntr);
		NaviWork->prog++;
		break;

	case 12:
		dispcnt_on(DISPMODE_TRAINEREYE);
		NaviWork->prog++;
		break;

	case 13:
		if(FadeData.fade_sw == 0){
			change_sub(sub_trainerlist);
		}
		break;
	}
}
/*====================================*/
/*  トレーナーアイ（リスト）          */
/*====================================*/
static void sub_trainerlist(void)
{
	switch(NaviWork->prog){
	case 0:
		switch(TNaviSub_ListKeyRead()){
		case LISTKEY_MOVE:
			SePlay(SE_SELECT);
			TNaviBG_UpdateTrainerTimei(NaviWork->list_rank);
			return;

		case LISTKEY_SCROLL:
			SePlay(SE_SELECT);
			NaviWork->prog++;
			return;
		}
		if(sys.Trg & A_BUTTON){
			SePlay(SE_SELECT);
			change_sub(sub_trainer_data);
			return;
		}
		if(sys.Trg & B_BUTTON){
			SePlay(SE_SELECT);
			change_sub(sub_trainerlist_to_main);
			return;
		}
		break;

	case 1:
		if(!TNaviBG_ListScrollWait()){
			TNaviBG_UpdateTrainerTimei(NaviWork->list_rank);
			TNaviObj_ArrowUpdate();
			NaviWork->prog++;
		}
		break;

	case 2:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->prog = 0;
		}
		break;

	}
}
/*====================================*/
/*  トレーナーアイ（データ）          */
/*====================================*/
static void sub_trainer_data(void)
{
	switch(NaviWork->prog){
	case 0:
		TNaviObj_ListObjBanish(1);
		TNaviBG_MenuWriteCommon(COMMENU_TRAINER_DATA);
		TNaviBG_EraseTrainerList_Begin();
		NaviWork->prog++;
		break;

	case 1:
		if(!TNaviBG_EraseTrainerList()){
			NaviWork->prog++;
		}
		break;

	case 2:
		TNaviBG_ToDataScroll_Init();
		NaviWork->prog++;
		break;

	case 3:
		if(!TNaviBG_TrainerList_Scroll()){
			TNaviSub_RevengeIconEff_Mode(1);
			NaviWork->prog++;
		}
		break;

	case 4:
		TNaviSub_TrainerDataInit();
		NaviWork->prog++;
		break;

	case 5:
		TNaviSub_MakeTrainerStr(NaviWork->list_buf, NaviWork->list_rank);
		MakeTEyeObj(NaviWork->list_buf);
		NaviWork->prog++;
		break;

	case 6:
		TNaviBG_WriteTrainerInfo_Begin();
		NaviWork->prog++;
	case 7:
		if(TNaviSub_TrainerImgIn() == 0
		&& TNaviBG_WriteTrainerInfo() == 0
		){
			NaviWork->prog++;
		}
		break;

	case 8:
		if(sys.Cont&U_KEY){
			if(NaviWork->condition_poke_sel != 0){
				SePlay(SE_SELECT);
				TNaviSub_TrainerChangeInit(-1);
				NaviWork->prog = 16;
				break;
			}
		}
		if(sys.Cont&D_KEY){
			if(NaviWork->condition_poke_sel < NaviWork->list_max){
				SePlay(SE_SELECT);
				TNaviSub_TrainerChangeInit(1);
				NaviWork->prog = 16;
				break;
			}
		}
		if(sys.Trg&B_BUTTON){
			SePlay(SE_SELECT);
			DelTEyeObj();
			TNaviBG_EraseTrainerInfo_Begin();
			NaviWork->prog++;
			break;
		}
		break;

	case 9:
		if(TNaviSub_TrainerImgOut() == 0
		&& TNaviBG_EraseTrainerInfo() == 0
		){
			TNaviSub_RevengeIconEff_Mode(0);
			TNaviObj_TrainerImgDel();
			NaviWork->prog++;
		}
		break;

	case 10:
		TNaviSub_ListRecover();
		NaviWork->prog++;
		break;

	case 11:
		TNaviBG_ToListScroll_Init();
		NaviWork->prog++;
		break;

	case 12:
		if(!TNaviBG_TrainerList_Scroll()){
			NaviWork->prog++;
		}
		break;

	case 13:
		TNaviBG_WriteTrainerList_Begin();
		NaviWork->prog++;
		break;

	case 14:
		if(!TNaviBG_WriteTrainerList()){
			NaviWork->prog++;
		}
		break;

	case 15:
		TNaviBG_MenuWriteCommon(COMMENU_TRAINER_LIST);
		TNaviObj_ListObjBanish(0);
		change_sub(sub_trainerlist);
		break;

	// トレーナー切り替え待ち
	case 16:
		if(!TNaviSub_TrainerChange()){
			NaviWork->prog++;
		}
		break;

	case 17:
		if(FieldRecvFifoClearWait()==FALSE){
			NaviWork->prog=8;
		}
		break;

	}
}
/*====================================*/
/*  トレーナーリスト→メインメニュー  */
/*====================================*/
static void sub_trainerlist_to_main(void)
{
	switch(NaviWork->prog){
	case 0:
		PaletteFadeReq(NaviWork->fade_bit, TNAVI_FADE_WAIT, 0, 16, 0x0000);
		NaviWork->prog++;
		break;

	case 1:
		if(FadeData.fade_sw == 0){
			TNaviObj_ListDel();
			TNaviObj_DelLabelNow(LABEL_RIBBON);
			TNaviSub_RevengeIconEff_Quit();
			NaviWork->prog++;
		}
		break;

	case 2:
		change_sub(sub_ret_mainmenu);
		break;
	}
}
/*====================================*/
/*  フェードアウト                    */
/*====================================*/
static void sub_fadeout(void)
{
	if(NaviWork->prog == 0){
		SePlay(SE_PN_OFF);
		PaletteFadeReq(0xffffffff, 0, 0, 16, 0x0000);
		NaviWork->prog++;
		return;
	}
	if(FadeData.fade_sw == 0){
		TNaviSub_LadorLasterQuit();
		FieldMenuRecover();
	}
}

static void change_menu_init(u8 menu_type, u8 sel, u8 label)
{
	TNaviObj_DelTagInit();
	NaviWork->change_menu_type = menu_type;
	NaviWork->change_menu_sel = sel;
	NaviWork->change_menu_prog = 0;
	NaviWork->change_menu_label = label;
}
static u8 change_menu(void)
{
	switch(NaviWork->change_menu_prog){
	case 0:
		if(!TNaviObj_DelTagWait()){
			if(NaviWork->change_menu_label != LABEL_NO){
				NaviWork->change_menu_prog = 1;
			}else{
				NaviWork->change_menu_prog = 3;
			}
		}
		break;

	case 1:
		TNaviObj_AddLabel_Begin(NaviWork->change_menu_label);
		NaviWork->change_menu_prog++;
	case 2:
		if(!TNaviObj_AddLabel(NaviWork->change_menu_label)){
			NaviWork->change_menu_prog++;
		}
		break;

	case 3:
		NaviWork->menu_sel = NaviWork->change_menu_sel;
		switch(NaviWork->change_menu_type){
		case MENUTYPE_MAIN: NaviWork->menu_cnt = 5; break;
		case MENUTYPE_CONDITION: NaviWork->menu_cnt = 3; break;
		case MENUTYPE_SEARCH: NaviWork->menu_cnt = 6; break;
		}
		TNaviObj_AddTagInit_Begin(NaviWork->change_menu_type);
		NaviWork->change_menu_prog++;
	case 4:
		if(!TNaviObj_AddTagInit(NaviWork->change_menu_type)){
			NaviWork->change_menu_prog++;
		}
		break;

	case 5:
		if(FieldRecvFifoClearWait() == FALSE){
			NaviWork->change_menu_prog++;
		}
		break;

	case 6:
		TNaviObj_AddTagRun();
		TNaviBG_MenuBG_RefleshReq(NaviWork->change_menu_type);
		NaviWork->change_menu_prog++;
		break;

	case 7:
		if(!TNaviObj_AddTagWait()){
			TNaviBG_WriteMenuInfo(NaviWork->change_menu_type, NaviWork->menu_sel);
			NaviWork->change_menu_prog++;
		}
		break;

	case 8:
		if(!TNaviBG_MenuBG_RefleshWait()){
			NaviWork->change_menu_prog++;
			return 0;
		}
		break;

	default:
		return 0;
	}
	return 1;
}
/***********************************************************************
**	メニュー選択時のキーリード
**
**  戻り値   1 ... キー入力あり /  0 ... キー入力なし
***********************************************************************/
// メインメニュー用
static u8 mainmenu_key_control(void)
{
	if(sys.Trg & U_KEY){

		do{
			if(--(NaviWork->menu_sel) < 0){
				NaviWork->menu_sel = NaviWork->menu_cnt - 1;
			}
		}while(NaviWork->mainmenu_contents[NaviWork->menu_sel] == MAINMENU_NULL);

		return 1;
	}
	if(sys.Trg & D_KEY){

		do{
			if(++(NaviWork->menu_sel) >= NaviWork->menu_cnt){
				NaviWork->menu_sel = 0;
			}
		}while(NaviWork->mainmenu_contents[NaviWork->menu_sel] == MAINMENU_NULL);

		return 1;
	}
	return 0;
}
// その他メニュー用
static u8 menu_key_control(void)
{
	if(sys.Trg & U_KEY){
		if(--(NaviWork->menu_sel) < 0){
			NaviWork->menu_sel = NaviWork->menu_cnt - 1;
		}
		return 1;
	}
	if(sys.Trg & D_KEY){
		if(++(NaviWork->menu_sel) >= NaviWork->menu_cnt){
			NaviWork->menu_sel = 0;
		}
		return 1;
	}
	return 0;
}
/***********************************************************************
**	各画面切り替え時の、REG_DISPCNT値操作
***********************************************************************/
// 全体オフ
static void dispcnt_off(void)
{
	*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_BG1_ON;
}
// メニュー画面復帰時オフ
static void dispcnt_off_menu(void)
{
	*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_BG1_ON | DISP_OBJ_CHAR_1D_MAP | DISP_OBJ_ON;
}
// 表示オン（モード指定）
static void dispcnt_on(u8 mode)
{
	switch(mode){
	case DISPMODE_MENU:
		*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP 
		| DISP_BG0_ON
		| DISP_BG1_ON
		| DISP_BG2_ON
		| DISP_BG3_ON
		| DISP_OBJ_ON
		;
		break;

	case DISPMODE_MAP:
		*(vu16 *)REG_DISPCNT = DISP_MODE_1 | DISP_OBJ_CHAR_1D_MAP 
		| DISP_BG0_ON
		| DISP_BG1_ON
		| DISP_BG2_ON
		| DISP_OBJ_ON
		;
		break;

	case DISPMODE_RIBON:
	case DISPMODE_LIST:
		*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP 
		| DISP_BG0_ON
		| DISP_BG1_ON
		| DISP_BG2_ON
		| DISP_BG3_ON
		| DISP_OBJ_ON
		;
		break;

	case DISPMODE_CONDITION:
		*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP 
		| DISP_BG0_ON
		| DISP_BG1_ON
	//	| DISP_BG2_ON    // 最初は表示しない
		| DISP_BG3_ON
		| DISP_OBJ_ON
		| DISP_WIN01_ON
		;
		break;

	case DISPMODE_TRAINEREYE:
		*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP 
		| DISP_BG0_ON
		| DISP_BG1_ON
		| DISP_BG2_ON
		| DISP_BG3_ON
		| DISP_OBJ_ON
		| DISP_WIN0_ON
		;

	}

}

