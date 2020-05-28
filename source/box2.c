/**********************************************************************/
/*  パソコンボックス統合版  -メイン-                                  */
/**********************************************************************/
#include "common.h"
#include "intr.h"
#include "decord.h"
#include "actanm.h"
#include "actor.h"
#include "palanm.h"
#include "param.h"
#include "poketool.h"
#include "objdata.h"
#include "p_status.h"
#include "print.h"
#include "menu.h"
#include "namein.h"
#include "fld_main.h"
#include "task.h"
#include "mus_tool.h"
#include "message.h"

#include "boxsub.h"
#include "box2_bg.dat"
#include "box2.h"


/**********************************************************************/
/*  定数                                                              */
/**********************************************************************/
enum MSG {
	MSG_YAMERU,
	MSG_TRAYMENU,
	MSG_WP_THEME,
	MSG_WP_TYPE,
	MSG_POKEMENU,
	MSG_CHANGEBOX,
	MSG_AZUKERUBOX,
	MSG_AZUKETA,
	MSG_BOXFULL,
	MSG_NIGASU,
	MSG_NIGASITA,
	MSG_BAIBAI,
	MSG_MARKING,
	MSG_LASTONE_MINE,
	MSG_STOCK_FULL,
	MSG_ICONCATCH_WARN,
	MSG_BOXON_WARN,
	MSG_TAMAGO_NIGASU,
	MSG_ISCONTINUE,
	MSG_MODOTTA,
	MSG_SINPAI,
	MSG_TENTEN,
	MSG_OFF_MAIL,
};

/**********************************************************************/
/*  グローバル変数                                                    */
/**********************************************************************/
BOX2WORK * const Work = (BOX2WORK*)UserWork;  // ワーク領域

static u8 DispMine = 0;              // てもちボックスが表示されているか？
static u8 BoxMode = BOX_MODE_SEIRI;  // 動作モード
static u8 AzukeruBoxNo = 0;          // 「あずける」のデフォルトボックスナンバー
static u8 RecoverType = 0;
enum RECOVER_TYPE {
	RECOVER_YOUSU,  // ようすをみるから復帰
	RECOVER_NAME,   // ボックス名入力から復帰
};

// 他画面へ制御が移る間、ポケモンデータを保持しておく領域
PokemonParam  PokeParaTmp = {};


// デバッグモード用 ----------------------------
#ifdef PM_DEBUG

u8 BoxDebugMode = 0;
static pFunc DebugReturnFunc = NULL;
static PokemonPasoParam *DebugPokeAddr = NULL;
static void sub_debug_pokeset(void);

//#define ICON_CELLMAN_CHK      // ｱｲｺﾝｾﾙﾏﾈｰｼﾞｬ監視ﾀｽｸを有効にする

#ifdef ICON_CELLMAN_CHK
static void IconCellManChkTask(u8 id);
#endif

#endif
// ---------------------------------------------

/**********************************************************************/
/*  プロトタイプ                                                      */
/**********************************************************************/
void InitBox(void);
static void RecoverBox(void);
static void box_vblank_intr(void);
static void box_main(void);
static void change_sub(pFunc sub);
static void disp_message(u8 msg);
static void disp_yesno_box(u8 pos);
static void clear_message(void);
static void update_mine_mapdata();
static void update_mine();

/*-- サブプロセス -- */
static void sub_switch_on(void);
static void sub_fade_on(void);
static void sub_switch_off(void);
static void sub_root(void);

static void sub_mine_on(void);
static void sub_mine_off(void);

static void sub_pokemenu(void);
static void sub_tukamu(void);
static void sub_oku(void);
static void sub_irekaeru(void);
static void sub_tureteiku(void);
static void sub_azukeru(void);
static void sub_nigasu(void);
static void sub_yousu(void);
//static void sub_waza(void);
static void sub_marking(void);
static void sub_tumewait(void);

static void sub_traymenu(void);
static void sub_change_wallpaper(void);
static void sub_boxchange(void);
static void sub_boxname(void);
static void sub_is_continue(void);


/*-- ステータスウィンドウ -- */
static void init_status(void);
static void update_status(void);
static void update_status_eff(void);

/*-- てもちウィンドウ -- */
static void init_mine(void);
static void mine_on_init(void);
static u8 mine_on_wait(void);
static void mine_off_init(void);
static u8 mine_off_wait(void);
static void goto_mine_init(void);
static u8 goto_mine_wait(void);

/*-- とじるボタン --*/
static void closebutton_anm(void);
static void start_closebutton_anm(void);
static void stop_closebutton_anm(void);

/*-- 背景画像 -- */
static void init_background(void);
static void scroll_background(void);

/*-- メニュー表示 -- */
static void dispmenu_wp_theme(void);
static void dispmenu_wp_type(u8 theme);

/**********************************************************************/
/*  初期化・復帰                                                      */
/**********************************************************************/
/*==============================================
==	メインプロセスを初期化ルーチンに置換
==	mode   動作モード（enum BOX_MODE）
==============================================*/
void BoxIn(u8 mode)
{
	BoxMode = mode;
	Work->mode = mode;
	MainProcChange(InitBox);
}
/*==============================================
==	ＢＧオフセット初期化
==============================================*/
static void init_bgofs(void)
{
	*(vu16 *)REG_BG0HOFS = 0;
	*(vu16 *)REG_BG0VOFS = 0;
	*(vu16 *)REG_BG1HOFS = 0;
	*(vu16 *)REG_BG1VOFS = 0;
	*(vu16 *)REG_BG2VOFS = 0;
	*(vu16 *)REG_BG2HOFS = 0;
	*(vu16 *)REG_BG3HOFS = 0;
	*(vu16 *)REG_BG3VOFS = 0;
}
/*==============================================
==	各種マネージャー初期化
==============================================*/
static void init_managers(void)
{
	PaletteAnimeInit();
	InitActor();
	CellManAllInit();
	ObjPalManInit();
	InitTask();

	ObjDataTransSt = CELLMAN_CHAR_ST;

	MapTransInit(&(Work->mtwk), Work->mtparam, MAP_TRANS_MAX);
	KeyRepeatStartWait = 20;
}
/*==============================================
==	ボックスパラメータ初期化
==============================================*/
static void init_params(void)
{
	TrayReturnPosInit();
	DispMine = (Work->mode == BOX_MODE_AZUKERU);
	AzukeruBoxNo = 0;
//	CurrentBox = 0;
}
/*==============================================
==	DISPCNT 初期化
==============================================*/
static void init_dispcnt(void)
{
	*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP 
	| DISP_BG0_ON
	| DISP_BG1_ON
	| DISP_BG2_ON
	| DISP_BG3_ON
	| DISP_OBJ_ON
	;
}
/*==============================================
==	初期化メイン
==============================================*/
void InitBox(void)
{
	switch(sys.InitSeqWork){
	case 0:
		SetVBlankFunc(NULL);
		*(vu16 *)REG_DISPCNT = 0;
		init_managers();

#ifdef PM_DEBUG
		BoxDebugMode = 0;
#endif
		break;

	case 1:
		PrintScreenInit(PASOBOXMENU_TYPE);
		break;

	case 2:
		NMenuScreenInit(PASOBOXMENU_TYPE);
		NMenuScreenClear();
		break;

	case 3:
		init_bgofs();
		init_params();
		break;

	case 4:
		InitBox2Icon();
		InitBoxCursor();
		break;

	case 5:
		init_background();
		break;

	case 6:
		init_status();
		break;

	case 7:
		init_mine();
		break;

	case 8:
		InitBoxTray(BoxData.CurrentBoxNo);

		Work->MarkWork.cell_id = CELLID_MARKING;
		Work->MarkWork.pal_id = PALID_MARKING;
		MarkingWorkInit(&(Work->MarkWork));
		MarkingCellMakeNow();
		break;

	case 9:
		init_dispcnt();
		change_sub(sub_switch_on);
		MainProcChange(box_main);
		SetVBlankFunc(box_vblank_intr);
		break;

	default:
		return;
	}

	sys.InitSeqWork++;
}
/*==============================================
==	復帰メイン
==============================================*/
static void RecoverBox(void)
{
	switch(sys.InitSeqWork){
	case 0:
		SetVBlankFunc(NULL);
		*(vu16 *)REG_DISPCNT = 0;
		Work->mode = BoxMode;
		init_managers();
		if(RecoverType == RECOVER_NAME){
			BoxGetTmpPokeData();
		}
		if(RecoverType == RECOVER_YOUSU){
			BoxYousuParamRecover();
		}
		break;

	case 1:
		PrintScreenInit(PASOBOXMENU_TYPE);
		break;

	case 2:
		NMenuScreenInit(PASOBOXMENU_TYPE);
		NMenuScreenClear();
		break;

	case 3:
		init_bgofs();
		break;

	case 4:
		InitBox2Icon();
		RecoverBoxCursor();
		break;

	case 5:
		init_background();
		break;

	case 6:
		init_status();
		break;

	case 7:
		init_mine();
		break;

	case 8:
		InitBoxTray(BoxData.CurrentBoxNo);

		Work->MarkWork.cell_id = CELLID_MARKING;
		Work->MarkWork.pal_id = PALID_MARKING;
		MarkingWorkInit(&(Work->MarkWork));
		MarkingCellMakeNow();
		break;

	case 9:
		PaletteFadeReq(0xffffffff, 0, 16, 0, 0x0000);
		SetVBlankFunc(box_vblank_intr);
		break;

	case 10:
		init_dispcnt();
		change_sub(sub_fade_on);
		MainProcChange(box_main);
		break;

	default:
		return;
	}

	sys.InitSeqWork++;
}
#ifdef PM_DEBUG
/*==============================================
==	デバッグ用ポケモンセットモードの初期化
==============================================*/
static void debug_box_init(void)
{
	BoxMode = BOX_MODE_TURETEIKU;
	Work->mode = BOX_MODE_TURETEIKU;
	InitBox();

	if(sys.pMainProc == box_main){
		BoxDebugMode = 1;
	}
}
void InitBox_DebugPokeSet(PokemonPasoParam *ppp, pFunc ret_func)
{
	DebugReturnFunc = ret_func;
	DebugPokeAddr = ppp;

	MainProcChange(debug_box_init);
}
/*==============================================
==	デバッグ用ポケモンセット
==============================================*/
extern void BoxDebugPokeSet(PokemonPasoParam *ppp);
static void sub_debug_pokeset(void)
{
	switch(Work->prog){
	case 0:
		BoxDebugPokeSet(DebugPokeAddr);
		PaletteFadeReq(0xffffffff,0,0,16,0x0000);
		Work->prog++;
		break;

	case 1:
		if(!PaletteAnime()){
			(*DebugReturnFunc)();
		}
		break;
	}
}

#endif
/**********************************************************************/
/*  メインプロセス                                                    */
/**********************************************************************/

/*==============================================
==	V Blank
==============================================*/
static void box_vblank_intr(void)
{
	*(vu16 *)REG_BG2HOFS = Work->tray_h;
	*(vu16 *)REG_BG3HOFS = Work->background_h;
	*(vu16 *)REG_BG3VOFS = Work->background_v;

	actOAMtrans();
	actDMAtrans();
	MapTrans();
	PaletteFadeTrans();
}
/*==============================================
==	メインループ
==============================================*/
// 通常メイン
static void box_main(void)
{
	(*(Work->sub_proc))();

#ifdef ICON_CELLMAN_CHK
	MainTask();
#endif


	scroll_background();
	closebutton_anm();
	JumpActor();
	SetActor();
}
// 他画面へ切り替えるためだけのメイン
static void box_changemain(void)
{
	switch(Work->changemain_mode){
	case CHANGEMAIN_YOUSU:
		PokeStatusCall2(Work->yousu_array_addr, Work->yousu_array_pos, Work->yousu_array_max, RecoverBox, Work->yousu_type);
		break;

	case CHANGEMAIN_NAMAE:
		NameIn(NAMEIN_BOX, (u8 *)(BoxData.BoxName[BoxData.CurrentBoxNo]), 0, 0, 0, RecoverBox);
		break;
	}
}

/*==============================================
==	サブプロセス切り替え
==============================================*/
static void change_sub(pFunc sub)
{
	Work->sub_proc = sub;
	Work->prog = 0;
}
/**********************************************************************/
/*  サブプロセス                                                      */
/**********************************************************************/

/*==============================================
==	スイッチオン
==============================================*/
static void sub_switch_on(void)
{
	switch(Work->prog){
	case 0:
		ColorConceChange(0xffffffff,16,0x0000);
		Work->prog++;
		break;

	case 1:
		SePlay(SE_PC_LOGIN);
		Work->scanwk.cell_id = CELLID_SCANLINE;
		Work->scanwk.pal_id =  PALID_SCANLINE;
		Work->scanwk.line_speed = 0;
		Work->scanwk.open_speed = 0;
		InitBoxOnEffect(&(Work->scanwk));
//		PaletteFadeReq(0xffffffff,0,0,0,0x0000);
		ColorConceChange(0xffffffff,0,0x0000);
		Work->prog++;
		break;

	case 2:
		if(CheckBoxOnEffect()){

#ifdef ICON_CELLMAN_CHK
			AddTask(IconCellManChkTask, 80);
#endif

			change_sub(sub_root);
		}
		break;
	}
}
/*==============================================
==	フェードオン（復帰時）
==============================================*/
static void sub_fade_on(void)
{
	if(!PaletteAnime()){

#ifdef ICON_CELLMAN_CHK
		AddTask(IconCellManChkTask, 80);
#endif

		change_sub(sub_root);
	}
}
/*==============================================
==	ルート
==============================================*/
static void sub_root(void)
{
	enum STATE {
		KEY_READ,
		CURSOR_WAIT,
		SCROLL_WAIT,
		WARN_WAIT,
		LASTONE_MSG,
		OFFMAIL_MSG,
		MESSAGE_WAIT,
	};

	switch(Work->prog){
	case KEY_READ:
		switch(BoxCursorKeyRead()){
		case ACT_CURSOR_MOVE:
			SePlay(SE_SELECT);
			Work->prog = CURSOR_WAIT;
			break;

		case ACT_MINEBOX_ON:
			if(Work->mode != BOX_MODE_SEIRI){
				disp_message(MSG_BOXON_WARN);
				Work->prog = WARN_WAIT;
				break;
			}
			TrayReturnPosInit();
			change_sub(sub_mine_on);
			break;

		case ACT_MINEBOX_OFF:
			if(Work->mode == BOX_MODE_SEIRI){
				// ポケモン掴んでいる＆メールを持ってる場合は警告
				if(CheckCatchIcon() && MailItemNoCheck(Work->status_itemno))
				{
					Work->prog = OFFMAIL_MSG;
					break;
				}
				change_sub(sub_mine_off);
			}
			break;

		case ACT_BOXOFF:
#ifdef PM_DEBUG
			if(BoxDebugMode){ break; }
#endif
			change_sub(sub_switch_off); break;

		case ACT_ISCONTINUE:
#ifdef PM_DEBUG
			if(BoxDebugMode){ break; }
#endif
			change_sub(sub_is_continue); break;

		case ACT_TRAYMENU:
			SePlay(SE_SELECT);
			change_sub(sub_traymenu); break;

		case ACT_POKEMENU:
			SePlay(SE_SELECT);
			change_sub(sub_pokemenu); break;

		case ACT_SCROLL_NEXT:
			{
				SePlay(SE_SELECT);

				Work->scr_boxno = BoxData.CurrentBoxNo + 1;
				if(Work->scr_boxno >= BOX_KAZU){ Work->scr_boxno = 0; }
				BoxTray_InitScroll(Work->scr_boxno);
				Work->prog = SCROLL_WAIT;
			}
			break;

		case ACT_SCROLL_PREV:
			{
				SePlay(SE_SELECT);

				Work->scr_boxno = BoxData.CurrentBoxNo - 1;
				if(Work->scr_boxno < 0){ Work->scr_boxno = BOX_KAZU - 1; }
				BoxTray_InitScroll(Work->scr_boxno);
				Work->prog = SCROLL_WAIT;
			}
			break;

		case ACT_DIRECT_AZUKERU:
			if(CheckLastOneMine()){
				Work->prog = LASTONE_MSG;
				break;
			}
			if(MailItemNoCheck(Work->status_itemno)){
				Work->prog = OFFMAIL_MSG;
				break;
			}
			SePlay(SE_SELECT);
			change_sub(sub_azukeru);
			break;

		case ACT_DIRECT_TUKAMU:
			if(CheckLastOneMine()){
				Work->prog = LASTONE_MSG;
				break;
			}
			SePlay(SE_SELECT);
			change_sub(sub_tukamu);
			break;

		case ACT_DIRECT_IREKAERU: 
			if(!CheckIrekaeOK()){
				Work->prog = LASTONE_MSG;
				break;
			}
			SePlay(SE_SELECT);
			change_sub(sub_irekaeru);
			break;

		case ACT_DIRECT_TURETEIKU:
			SePlay(SE_SELECT);
			change_sub(sub_tureteiku); break;

		case ACT_DIRECT_OKU:
			SePlay(SE_SELECT);
			change_sub(sub_oku); break;

		}/* switch(BoxCursorKeyRead()) */
		break;

	case CURSOR_WAIT:
		if(!BoxCursorMoveWait()){
			if(CheckBoxCursorOnCloseButton()){
				start_closebutton_anm();
			}else{
				stop_closebutton_anm();
			}
			if(Work->point_poke_update){
				update_status_eff();
			}
			Work->prog = KEY_READ;
		}
		break;

	case SCROLL_WAIT:
		if(!BoxTray_WaitScroll()){
			BoxData.CurrentBoxNo = Work->scr_boxno;
			if(DispMine == 0 && CheckCatchIcon() == 0){
				BoxUpdateStatusParam();
				update_status_eff();
			}
			Work->prog = KEY_READ;
		}
		break;

	case WARN_WAIT:
		if(sys.Trg&(A_BUTTON|B_BUTTON|PLUS_KEY_MASK)){
			clear_message();
			Work->prog = KEY_READ;
		}
		break;

	case LASTONE_MSG:
		SePlay(SE_HAZURE);
		disp_message(MSG_LASTONE_MINE);
		Work->prog = MESSAGE_WAIT;
		break;

	case OFFMAIL_MSG:
		SePlay(SE_HAZURE);
		disp_message(MSG_OFF_MAIL);
		Work->prog = MESSAGE_WAIT;
		break;


	case MESSAGE_WAIT:
		if(sys.Trg & (A_BUTTON|B_BUTTON|PLUS_KEY_MASK)){
			clear_message();
			change_sub(sub_root);
		}
		break;


	}
}
/*==============================================
==	てもちボックス表示
==============================================*/
static void sub_mine_on(void)
{
	switch(Work->prog){
	case 0:
		goto_mine_init();
		Work->prog++;
		break;

	case 1:
		if(!goto_mine_wait()){
			change_sub(sub_root);
		}
		break;
	}
}
/*==============================================
==	てもちボックス消去
==============================================*/
static void sub_mine_off(void)
{
	switch(Work->prog){
	case 0:
		SePlay(SE_SELECT);
		mine_off_init();
		Work->prog++;
		break;

	case 1:
		if(!mine_off_wait()){
			BoxCursorMoveToTray(TrayReturnPosLoad());
			Work->prog++;
		}
		break;

	case 2:
		if(!BoxCursorMoveWait()){
			if(Work->point_poke_update){
				update_status_eff();
			}
			change_sub(sub_root);
		}
		break;
	}
}
/*==============================================
==	ポケモンメニューメイン
==============================================*/
static void sub_pokemenu(void)
{
	enum PROG {
		INIT,
		SELECT,
		LASTONE_MSG,
		OFFMAIL_MSG,
		TAMAGONIGASU_MSG,
		MESSAGE_WAIT,
	};

	switch(Work->prog){
	case INIT:
		disp_message(MSG_POKEMENU);
		BoxMenuDisp();
		Work->prog = SELECT;
		break;

	case SELECT:
		switch(BoxMenuSelect()){
		case MENU_YAMERU:
		case CURSOR_CANCEL_VALUE:
			clear_message();
			change_sub(sub_root);
			break;

		case MENU_TUKAMU:
			if(CheckLastOneMine()){
				Work->prog = LASTONE_MSG;
				break;
			}
			SePlay(SE_SELECT);
			clear_message();
			change_sub(sub_tukamu);
			break;

		case MENU_OKU:
			SePlay(SE_SELECT);
			clear_message();
			change_sub(sub_oku);
			break;

		case MENU_IREKAERU:
			if(!CheckIrekaeOK()){
				Work->prog = LASTONE_MSG;
				break;
			}
			SePlay(SE_SELECT);
			clear_message();
			change_sub(sub_irekaeru);
			break;

		case MENU_TURETEIKU:
			SePlay(SE_SELECT);
			clear_message();
			change_sub(sub_tureteiku);
			break;

		case MENU_AZUKERU:
			if(CheckLastOneMine()){
				Work->prog = LASTONE_MSG;
				break;
			}
			if(MailItemNoCheck(Work->status_itemno)){
				Work->prog = OFFMAIL_MSG;
				break;
			}
			SePlay(SE_SELECT);
			clear_message();
			change_sub(sub_azukeru);
			break;

		case MENU_NIGASU:
			if(CheckLastOneMine()){
				Work->prog = LASTONE_MSG;
				break;
			}
			if(Work->status_tamago_flg){
				Work->prog = TAMAGONIGASU_MSG;
				break;
			}
			if(MailItemNoCheck(Work->status_itemno)){
				Work->prog = OFFMAIL_MSG;
				break;
			}
			SePlay(SE_SELECT);
			change_sub(sub_nigasu);
			break;

		case MENU_YOUSUMIRU:
			SePlay(SE_SELECT);
			change_sub(sub_yousu); break;

//		case MENU_WAZA:
//			change_sub(sub_waza); break;

		case MENU_MARKING:
			SePlay(SE_SELECT);
			change_sub(sub_marking); break;
			break;

#ifdef PM_DEBUG
		case MENU_DEBUG_POKESET:
			SePlay(SE_SELECT);
			clear_message();
			change_sub(sub_debug_pokeset);
			break;
#endif

		}
		break;

	case LASTONE_MSG:
		SePlay(SE_HAZURE);
		disp_message(MSG_LASTONE_MINE);
		Work->prog = MESSAGE_WAIT;
		break;

	case TAMAGONIGASU_MSG:
		SePlay(SE_HAZURE);
		disp_message(MSG_TAMAGO_NIGASU);
		Work->prog = MESSAGE_WAIT;
		break;

	case OFFMAIL_MSG:
		SePlay(SE_HAZURE);
		disp_message(MSG_OFF_MAIL);
		Work->prog = MESSAGE_WAIT;
		break;

	case MESSAGE_WAIT:
		if(sys.Trg & (A_BUTTON|B_BUTTON|PLUS_KEY_MASK)){
			clear_message();
			change_sub(sub_root);
		}
		break;
	}

}
/*==============================================
==	「つかむ」
==============================================*/
static void sub_tukamu(void)
{
	switch(Work->prog){
	case 0:
		BoxCursorOP_Init(CURSOR_OP_TUKAMU);
		Work->prog++;
		break;

	case 1:
		if(!BoxCursorOP_Exe()){
			if(DispMine){
				change_sub(sub_tumewait);
			}else{
				change_sub(sub_root);
			}
		}
		break;
	}
}
/*==============================================
==	「おく」
==============================================*/
static void sub_oku(void)
{
	switch(Work->prog){
	case 0:
		BoxCursorOP_Init(CURSOR_OP_OKU);
		Work->prog++;
		break;


	case 1:
		if(!BoxCursorOP_Exe()){
			if(DispMine){
				change_sub(sub_tumewait);
			}else{
				change_sub(sub_root);
			}
		}
		break;
	}
}
/*==============================================
==	「いれかえる」
==============================================*/
static void sub_irekaeru(void)
{
	switch(Work->prog){
	case 0:
		BoxCursorOP_Init(CURSOR_OP_IREKAERU);
		Work->prog++;
		break;

	case 1:
		if(!BoxCursorOP_Exe()){
			update_status_eff();
			change_sub(sub_root);
		}
		break;
	}
}
/*==============================================
==	「つれていく」
==============================================*/
static void sub_tureteiku(void)
{
	switch(Work->prog){
	case 0:
		if(PokeCountMineGet() == TEMOTI_POKEMAX){
			disp_message(MSG_STOCK_FULL);
			Work->prog = 1;
			break;
		}

		TrayReturnPosSave();
		BoxCursorOP_Init(CURSOR_OP_TUKAMU);
		Work->prog = 2;
		break;

	// 警告表示後のキー待ち
	case 1:
		if(sys.Trg & (A_BUTTON|B_BUTTON|PLUS_KEY_MASK)){
			clear_message();
			change_sub(sub_root);
		}
		break;

	// 通常処理
	case 2:
		if(!BoxCursorOP_Exe()){
			goto_mine_init();
			Work->prog++;
//			change_sub(sub_mine_on);
		}
		break;

	case 3:
		if(!goto_mine_wait()){
			BoxCursorOP_Init(CURSOR_OP_OKU);
			Work->prog++;
		}
		break;

	case 4:
		if(!BoxCursorOP_Exe()){
			update_mine();
			Work->prog++;
		}
		break;

	case 5:
		change_sub(sub_mine_off);
		break;
	}
}
/*==============================================
==	「あずける」
==============================================*/
static void sub_azukeru(void)
{
	switch(Work->prog){
	case 0:
		disp_message(MSG_AZUKERUBOX);
		InitBoxSelWindow(&(Work->SelWork), CELLID_BOXSEL, PALID_BOXSEL, ACTPRI_BOXSEL);
//		BeginBoxSel(0);
		BeginBoxSel(AzukeruBoxNo);
		Work->prog++;
		break;

	case 1:
		{
			u8 box = BoxSelControl();
			switch(box){
			case BOXSEL_NEVER:
				break;

			case BOXSEL_CANCEL:
				clear_message();
				EndBoxSel();
				QuitBoxSelWindow();
				change_sub(sub_root);
				break;

			default:
				if(BoxAzukeruInit(box)){
					clear_message();
					EndBoxSel();
					QuitBoxSelWindow();
					Work->prog = 2;
				}else{
					disp_message(MSG_BOXFULL);
					Work->prog = 4;
				}
				AzukeruBoxNo = box;
				break;
			}

		}
		break;

	// あずけた
	case 2:
		BoxTumeMineData();
		BoxIcon_TumeInit();
		Work->prog++;
		break;

	case 3:
		if(!BoxIcon_TumeWait()){
			BoxAzukeruFinish();
			update_status_eff();
			update_mine();
			change_sub(sub_root);
		}
		break;

	// ボックスがいっぱい
	case 4:
		if(sys.Trg & (A_BUTTON|B_BUTTON)){
			disp_message(MSG_AZUKERUBOX);
			Work->prog = 1;
		}
		break;

	}
}
/*==============================================
==	「にがす」  
==============================================*/
static void sub_nigasu(void)
{
	switch(Work->prog){
	case 0:
		disp_message(MSG_NIGASU);
		disp_yesno_box(1);
		Work->prog++;

	case 1:
		switch(NMenuVCursorControlNoloop()){
		case CURSOR_NO_VALUE:
		case CURSOR_CANCEL_VALUE:
			clear_message();
			change_sub(sub_root);
			break;

		case CURSOR_YES_VALUE:
			clear_message();
			BoxNigaseruCheckInit();
			BoxNigasuAnmInit();
			Work->prog++;
			break;
		}
		break;

	case 2:
		BoxNigaseruCheck();
		if(!BoxNigasuAnmWait()){
			s8 ret;
			while(1){
				ret = BoxNigaseruCheck();
				if(ret == 1){
					Work->prog++;
					break;
				}
				if(ret == 0){
					Work->prog = 8;
					break;
				}
			}

		}
		break;

	case 3:
		BoxNigasuFinish();
		update_status();
		disp_message(MSG_NIGASITA);
		Work->prog++;
		break;

	case 4:
		if(sys.Trg & (A_BUTTON|B_BUTTON)){
			disp_message(MSG_BAIBAI);
			Work->prog++;
		}
		break;

	case 5:
		if(sys.Trg & (A_BUTTON|B_BUTTON)){
			clear_message();
			if(DispMine){
				BoxTumeMineData();
				BoxIcon_TumeInit();
				Work->prog++;
			}else{
				Work->prog = 7;
			}
		}
		break;

	case 6:
		if(!BoxIcon_TumeWait()){
			BoxUpdateStatusParam();
			update_status_eff();
			update_mine();
			Work->prog++;
		}
		break;

	case 7:
		change_sub(sub_root);
		break;

	// 戻ってくる
	case 8:
		disp_message(MSG_NIGASITA);
		Work->prog++;
		break;

	case 9:
		if(sys.Trg&(A_BUTTON|B_BUTTON)){
			disp_message(MSG_TENTEN);
			Work->prog++;
		}
		break;

	case 10:
		if(sys.Trg&(A_BUTTON|B_BUTTON)){
			clear_message();
			BoxIcon_ModoruInit();
			Work->prog++;
		}
		break;

	case 11:
		if(!BoxIcon_ModoruWait()){
			BoxModoruFinish();
			disp_message(MSG_MODOTTA);
			Work->prog++;
		}
		break;

	case 12:
		if(sys.Trg&(A_BUTTON|B_BUTTON)){
			disp_message(MSG_SINPAI);
			Work->prog++;
		}
		break;

	case 13:
		if(sys.Trg&(A_BUTTON|B_BUTTON)){
			clear_message();
			change_sub(sub_root);
		}
		break;

	}
}
/*==============================================
==	「ようすをみる」
==============================================*/
static void sub_yousu(void)
{
	switch(Work->prog){
	case 0:
		BoxYousuParamSet();
		PaletteFadeReq(0xffffffff,0,0,16,0x0000);
		Work->prog++;
		break;

	case 1:
		if(!PaletteAnime()){
			RecoverType = RECOVER_YOUSU;
			Work->changemain_mode = CHANGEMAIN_YOUSU;
			MainProcChange(box_changemain);
		}
		break;
	}
}
/*==============================================
==	「マーキング」
==============================================*/
static void sub_marking(void)
{
	switch(Work->prog){
	case 0:
		disp_message(MSG_MARKING);
		Work->MarkWork.mark = Work->status_mark;
		MarkingWindowDisp(Work->status_mark, 176, 16);
		Work->prog++;
		break;

	case 1:
		if(!MarkingControl()){
			MarkingWindowQuit();
			clear_message();
			BoxSetMarkingParam(Work->MarkWork.mark);
			update_status();
			change_sub(sub_root);
		}
		break;
	}
}
/*==============================================
==	てもちポケモンの空きを詰めてからルート復帰
==============================================*/
static void sub_tumewait(void)
{
	switch(Work->prog){
	case 0:
		BoxTumeMineData();
		BoxIcon_TumeInit();
		Work->prog++;
		break;

	case 1:
		if(!BoxIcon_TumeWait()){
			update_mine();
			change_sub(sub_root);
		}
		break;
	}
}
/*==============================================
==	トレイメニューメイン
==============================================*/
static void sub_traymenu(void)
{
	switch(Work->prog){
	case 0:
		disp_message(MSG_TRAYMENU);
		BoxMenuDisp();
		Work->prog++;
		break;

	case 1:
		switch(BoxMenuSelect()){
		case MENU_YAMERU:
		case CURSOR_CANCEL_VALUE:
			BoxArrowMove(1);
			clear_message();
			change_sub(sub_root);
			break;

		case MENU_BOXNAME:
			SePlay(SE_SELECT);
			change_sub(sub_boxname);
			break;

		case MENU_WALLPAPER:
			SePlay(SE_SELECT);
			clear_message();
			change_sub(sub_change_wallpaper);
			break;

		case MENU_BOXCHANGE:
			SePlay(SE_SELECT);
			clear_message();
			change_sub(sub_boxchange);
			break;
		}
	}
}
/*==============================================
==	壁紙変更
==============================================*/
static void sub_change_wallpaper(void)
{
	switch(Work->prog){
	case 0:
		dispmenu_wp_theme();
		disp_message(MSG_WP_THEME);
		Work->prog++;
		break;

	case 1:
		Work->wp_theme = BoxMenuSelect();
		switch(Work->wp_theme){
		case CURSOR_CANCEL_VALUE:
			BoxArrowMove(1);
			clear_message();
			change_sub(sub_root);
			break;

		case MENU_WPTHEME0:
		case MENU_WPTHEME1:
		case MENU_WPTHEME2:
		case MENU_WPTHEME3:
			SePlay(SE_SELECT);
			Work->wp_theme -= MENU_WPTHEME0;
			dispmenu_wp_type(Work->wp_theme);
			disp_message(MSG_WP_TYPE);
			Work->prog++;
		}
		break;

	case 2:
		Work->wp_type = BoxMenuSelect();
		switch(Work->wp_type){
		case CURSOR_DEFAULT_VALUE:
			break;

		case CURSOR_CANCEL_VALUE:
			clear_message();
			Work->prog = 0;
			break;

		default:
			SePlay(SE_SELECT);
			clear_message();
			Work->wp_type -= MENU_WPTYPE0_0;
			BoxTray_WallPaperChangeInit(Work->wp_type);
			Work->prog++;
			break;
		}
		break;

	case 3:
		if(!BoxTray_WallPaperChangeWait()){
			BoxArrowMove(1);
			change_sub(sub_root);
		}
		break;
	}
}
/*==============================================
==	ボックス切り替え
==============================================*/
static void sub_boxchange(void)
{
	switch(Work->prog){
	case 0:
		disp_message(MSG_CHANGEBOX);
		InitBoxSelWindow(&(Work->SelWork), CELLID_BOXSEL, PALID_BOXSEL, ACTPRI_BOXSEL);
		BeginBoxSel(BoxData.CurrentBoxNo);
		Work->prog++;
		break;

	case 1:
		Work->scr_boxno = BoxSelControl();
		switch(Work->scr_boxno){
		case BOXSEL_NEVER:
			break;

		default:
			clear_message();
			EndBoxSel();
			QuitBoxSelWindow();

			if(Work->scr_boxno == BOXSEL_CANCEL ||
			   Work->scr_boxno == BoxData.CurrentBoxNo)
			{
				BoxArrowMove(1);
				change_sub(sub_root);
			}else{
				Work->prog++;
			}
			break;
		}
		break;

	case 2:
		BoxTray_InitScroll(Work->scr_boxno);
		Work->prog++;
		break;

	case 3:
		if(!BoxTray_WaitScroll()){
			BoxData.CurrentBoxNo = Work->scr_boxno;
			change_sub(sub_root);
		}
		break;
	}
}
/*==============================================
==	ボックス名入力へ切り替え
==============================================*/
static void sub_boxname(void)
{
	switch(Work->prog){
	case 0:
		BoxSetTmpPokeData();
		PaletteFadeReq(0xffffffff,0,0,16,0x0000);
		Work->prog++;
		break;

	case 1:
		if(!PaletteAnime()){
			RecoverType = RECOVER_NAME;
			Work->changemain_mode = CHANGEMAIN_NAMAE;
			MainProcChange(box_changemain);
		}
		break;
	}
}
/*==============================================
==	スイッチオフ
==============================================*/
extern void FieldBoxMenuRecover(void);
static void sub_switch_off(void)
{
	switch(Work->prog){
	case 0:
		if(CheckCatchIcon()){
			SePlay(SE_HAZURE);
			disp_message(MSG_ICONCATCH_WARN);
			Work->prog = 1;
			break;
		}
		SePlay(SE_SELECT);
		disp_message(MSG_YAMERU);
		disp_yesno_box(0);
		Work->prog = 2;
		break;

	// 警告表示後のキー待ち
	case 1:
		if(sys.Trg&(A_BUTTON|B_BUTTON|PLUS_KEY_MASK)){
			clear_message();
			change_sub(sub_root);
		}
		break;

	// 通常処理
	case 2:
		switch(NMenuVCursorControlNoloop()){
		case CURSOR_NO_VALUE:
		case CURSOR_CANCEL_VALUE:
			clear_message();
			change_sub(sub_root);
			break;

		case CURSOR_YES_VALUE:
			SePlay(SE_PC_OFF);
			clear_message();
			Work->prog++;
			break;
		}
		break;

	case 3:
		Work->scanwk.cell_id = CELLID_SCANLINE;
		Work->scanwk.pal_id =  PALID_SCANLINE;
		Work->scanwk.line_speed = 20;
		Work->scanwk.open_speed = 0;
		InitBoxOffEffect(&(Work->scanwk));
		Work->prog++;
		break;

	case 4:
		if(CheckBoxOffEffect()){
			PokeCountMine = PokeCountMineGet();
			MainProcChange(FieldBoxMenuRecover);
		}
		break;
	}
}
/*==============================================
==	継続しますか？
==============================================*/
static void sub_is_continue(void)
{
	switch(Work->prog){
	case 0:
		if(CheckCatchIcon()){
			SePlay(SE_HAZURE);
			disp_message(MSG_ICONCATCH_WARN);
			Work->prog = 1;
			break;
		}
		SePlay(SE_SELECT);
		disp_message(MSG_ISCONTINUE);
		disp_yesno_box(0);
		Work->prog = 2;
		break;

	// 警告表示後のキー待ち
	case 1:
		if(sys.Trg&(A_BUTTON|B_BUTTON|PLUS_KEY_MASK)){
			clear_message();
			change_sub(sub_root);
		}
		break;

	// 通常処理
	case 2:
		switch(NMenuVCursorControlNoloop()){
		case CURSOR_YES_VALUE:
			clear_message();
			change_sub(sub_root);
			break;


		case CURSOR_NO_VALUE:
		case CURSOR_CANCEL_VALUE:
			SePlay(SE_PC_OFF);
			clear_message();
			Work->prog++;
			break;
		}
		break;

	case 3:
		Work->scanwk.cell_id = CELLID_SCANLINE;
		Work->scanwk.pal_id =  PALID_SCANLINE;
		Work->scanwk.line_speed = 20;
		Work->scanwk.open_speed = 0;
		InitBoxOffEffect(&(Work->scanwk));
		Work->prog++;
		break;

	case 4:
		if(CheckBoxOffEffect()){
			PokeCountMine = PokeCountMineGet();
			MainProcChange(FieldBoxMenuRecover);
		}
		break;
	}
}
/**********************************************************************/
/*  背景                                                              */
/**********************************************************************/
#define BG_CHAR_BLOCK (3)
#define BG_MAP_BLOCK  (30)
#define BG_CHAR_ADDR  (CHAR_ADDR(BG_CHAR_BLOCK)+0x2000)
#define BG_MAP_ADDR   MAP_ADDR(BG_MAP_BLOCK)

/*==============================================
==	初期化
==============================================*/
static void init_background(void)
{
	Work->bg_scr_cnt = 0;
	Work->background_v = 0;
	Work->background_h = 0;

	*(vu16 *)REG_BG3CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_3
	| BG_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
	| BG_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 ;

	DIV_DMAARRAYCOPY(3, box_bg_Character, BG_CHAR_ADDR, 16);
	LZ77UnCompVram((void*)box_bg_Map, (void*)BG_MAP_ADDR);
	PaletteWorkSet(box_bg_Palette, BG_PAL, 16);
}
/*==============================================
==	スクロール実行
==============================================*/
static void scroll_background(void)
{
	if(++(Work->bg_scr_cnt) > 1){
		Work->bg_scr_cnt = 0;
		Work->background_v--;
		Work->background_h++;
	}
}
/**********************************************************************/
/*  ステータスウィンドウ                                              */
/**********************************************************************/
#define STATUS_CHAR_BLOCK (0)
#define STATUS_MAP_BLOCK  (31)
#define STATUS_CHAR_ADDR  (CHAR_ADDR(STATUS_CHAR_BLOCK)+0x5000)
#define STATUS_MAP_ADDR   MAP_ADDR(STATUS_MAP_BLOCK)

#define STATUS_POKE_X  (40)
#define STATUS_POKE_Y  (48)

#define STATUS_STR_X   (1)
#define STATUS_STR_Y   (11)

#define MARKING_X   (40)
#define MARKING_Y   (144)

#define WAVE_X      (8)
#define WAVE_Y      (9)
#define WAVE_DIFFX  (63)

#define UPDATE_MOSAIC_INI  (10)  // モザイクサイズ初期値
#define UPDATE_MOSAIC_UNIT (1)   // モザイクサイズ更新値

static const actHeader WaveActHeader;
static void init_status_poke_actor(void);
static void init_marking_actor(void);
static void init_wave_actor(void);
static void update_status_poke_image(u16 monsno, u32 rnd);
static void update_status_poke_param(void);
static void update_status_effect(void);

/*==============================================
==	初期化
==============================================*/
static void init_status(void)
{
	static const PalData pal = {
		box_objcom_Palette, PALID_OBJCOM
	};

	LZ77UnCompVram((void*)status_Character, (void*)STATUS_CHAR_ADDR);
	LZ77UnCompVram((void*)status_Map, (void*)STATUS_MAP_ADDR);
	PaletteWorkSet(status_Palette, STATUS_PAL, 0x20);
	PaletteWorkSet(status_off_Palette, STATUS_OFF_PAL, 0x20);
	PaletteWorkSet(MalePalette, MALE_PAL, 0x20);
	PaletteWorkSet(FemalePalette, FEMALE_PAL, 0x20);



	ObjPalSet(&pal);

	init_status_poke_actor();
	init_marking_actor();
	init_wave_actor();
//	Work->status_poke_actor = NULL;
	update_status();
}
/*==============================================
==	マーキング状態表示用アクター初期化
==============================================*/
static void init_marking_actor(void)
{
//	Work->marking_actor = MarkingStateObjAdd(CELLID_MARKING_STATE, PALID_OBJCOM, box_objcom_Palette);
	Work->marking_actor = MarkingStateObjAdd(CELLID_MARKING_STATE, PALID_MARKING_STATE, NULL);
	Work->marking_actor->oamData.Priority = 0;
	Work->marking_actor->pri = ACTPRI_MARKING;
	Work->marking_actor->x = MARKING_X;
	Work->marking_actor->y = MARKING_Y;
	Work->marking_char_addr = (u8 *)OBJ_MODE0_VRAM + (CellCharNumGet(CELLID_MARKING_STATE) * 0x20);
}
/*==============================================
==	エフェクト用波形アクター初期化
==============================================*/
static void init_wave_actor(void)
{
	CellData cell = { wave_Character, sizeof(wave_Character), CELLID_WAVE };
	u16 i, no;

	CellSet(&cell);
	for(i = 0; i < 2; i++){
		no = AddActor(&WaveActHeader, WAVE_X+i*WAVE_DIFFX, WAVE_Y, ACTPRI_WAVE);
		Work->wave_actor[i] = &ActWork[no];
	}
}
/*==============================================
==	更新（即時）
==============================================*/
static void update_status(void)
{
	update_status_poke_image(Work->status_monsno, Work->status_rnd);
	update_status_poke_param();
	update_status_effect();
}
/*==============================================
==	更新（エフェクトあり）
==============================================*/
static void statuspoke_mosaic_wait(actWork *act);

static void update_status_eff(void)
{
	update_status();
	if(Work->status_poke_actor == NULL){
		return;
	}
	Work->status_poke_actor->oamData.Mosaic = 1;
	Work->status_poke_actor->work[0] = UPDATE_MOSAIC_INI;
	Work->status_poke_actor->work[1] = UPDATE_MOSAIC_UNIT;
	Work->status_poke_actor->move = statuspoke_mosaic_wait;
	*(vu16*)REG_MOSAIC = (Work->status_poke_actor->work[0] << 12) | (Work->status_poke_actor->work[0] << 8);
}
//------------------------------------
// エフェクト中アクターの動作関数
//------------------------------------
static void statuspoke_mosaic_wait(actWork *act)
{
	act->work[0] -= act->work[1];
	if(act->work[0] < 0){ act->work[0] = 0; }
	*(vu16*)REG_MOSAIC = (act->work[0] << 12) | (act->work[0] << 8);
	if(act->work[0] == 0){
		act->oamData.Mosaic = 0;
		act->move = DummyActMove;
	}
}
/*==============================================
==	更新（ポケモン画像）
==	u16 monsno  ポケモンナンバー
==	u32 rnd     個性乱数
==============================================*/
static const ActOamData StatusPokeOam;

static void init_status_poke_actor(void)
{
	u16 i;

	CellData cell = {
		(const u8*)(Work->PokeCell),
		0x800,
		CELLID_STATUS_POKE,
	};
	PalData  pal = {
		(const u16*)(Work->PokePal),
		PALID_STATUS_POKE
	};
	actHeader header = {
		CELLID_STATUS_POKE,
		PALID_STATUS_POKE,
		&StatusPokeOam,
		DummyActAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		DummyActMove,
	};
	u16 actno;

	for(i = 0; i < OBJ_SIZE16_64x64; i++){
		Work->PokeCell[i] = 0;
	}
	for(i = 0; i < 16; i++){
		Work->PokePal[i] = 0;
	}

	Work->status_poke_actor = NULL;

	do{
		u16 cellno, palno;

		cellno = CellSet(&cell);
		if(cellno == 0){ break; }

		palno = ObjPalSet(&pal);
		if(palno == 0xff){ break; }

		actno = AddActor(&header, STATUS_POKE_X, STATUS_POKE_Y, ACTPRI_STATUSPOKE);
		if(actno == ACT_MAX) break;

		Work->status_poke_actor = &ActWork[actno];
		Work->status_poke_palno = 256 + palno * 16;
		Work->status_poke_celladrs = (u32)((u8*)OBJ_MODE0_VRAM + cellno * 32);

	}while(0);

	if(Work->status_poke_actor == NULL){
		CellDel(CELLID_STATUS_POKE);
		ObjPalRegNumDel(PALID_STATUS_POKE);
	}
}
static void update_status_poke_image(u16 monsno, u32 rnd)
{
	if(Work->status_poke_actor != NULL){
		if(monsno != NON_POKE){
			DecordPokeCellMakeBuchi(&(PM2FObjDataCell[monsno]), pm2fpara[monsno].size, 1,
				(void *)(Work->PokeCellWork),(void *)(Work->PokeCell), monsno,  rnd);

//			LZ77UnCompWram(((PalData *)(&PM2NObjDataPal[monsno]))->pal_data, (void *)(Work->PokePal));
			LZ77UnCompWram(Work->status_pal_addr, (void *)(Work->PokePal));

			CpuCopy(Work->PokeCell, Work->status_poke_celladrs, OBJ_SIZE16_64x64, 32);
			PaletteWorkSet(Work->PokePal, Work->status_poke_palno, 0x20);

			Work->status_poke_actor->banish = 0;

		}else{
			Work->status_poke_actor->banish = 1;
		}

	}
}
/*==============================================
==	更新（ポケモン名等のパラメータ）
==============================================*/
static void update_status_poke_param(void)
{
	const u16 *lv_map;
	u16 i;

	NMenuContextChange(PASOBOXSTATUS_TYPE);
	for(i = 0; i < 3; i++){
		NMenuMsgWrite(Work->status_str[i], STATUS_STR_X, STATUS_STR_Y+i*2);
	}
	NMenuContextChange(PASOBOXMENU_TYPE);

	if(Work->status_monsno != NON_POKE){
		if(Work->status_tamago_flg){
			lv_map = status_lv_off_Map;
		}else{
			lv_map = (Work->status_lv < 100)? status_lv_on_Map : NULL;
		}
		MarkingCharDataCopy(Work->status_mark, Work->marking_char_addr);
		Work->marking_actor->banish = 0;
	}else{
		lv_map = status_lv_off_Map;
		Work->marking_actor->banish = 1;
	}

	if(lv_map != NULL){
		MapTransReq((u16*)STATUS_MAP_ADDR, 6, 11, lv_map, 0, 0, 1, 2, 1);
	}

}
/*==============================================
==	更新（波形などのエフェクト）
==============================================*/
static void update_status_effect(void)
{
	u16 i;

	if(Work->status_monsno != NON_POKE){
		MapTransReq((u16*)STATUS_MAP_ADDR, 1, 0, status_on_Map, 0, 0, 8, 2, 8);

		for(i = 0; i < 2; i++){
			ActAnmChkChg(Work->wave_actor[i], i * 2 + 1);
		}

	}else{
		MapTransReq((u16*)STATUS_MAP_ADDR, 1, 0, status_off_Map, 0, 0, 8, 2, 8);
		for(i = 0; i < 2; i++){
			ActAnmChg(Work->wave_actor[i], i * 2);
		}
	}
}

/**********************************************************************/
/*  てもちポケモンウィンドウ・とじるボタン                            */
/**********************************************************************/
#define MINE_CHAR_BLOCK (0)
#define MINE_MAP_BLOCK  (15)
#define MINE_CHAR_ADDR  (CHAR_ADDR(MINE_CHAR_BLOCK)+0x6800)
#define MINE_MAP_ADDR   MAP_ADDR(MINE_MAP_BLOCK)

#define CLOSE_ANM_WAIT  (30)

static void trans_closebutton_map(u8 on);

/*==============================================
==	初期化
==============================================*/
static void init_mine(void)
{
	*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_1
	| MINE_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
	| MINE_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 ;

	LZ77UnCompVram((void*)mine_Character, (void*)MINE_CHAR_ADDR);
	LZ77UnCompVram((void*)mine_Map, (void*)(Work->mine_map));

	PaletteWorkSet(mine_Palette, MINE_PAL, 0x20);
	PaletteWorkSet(close_Palette, CLOSE_PAL, 0x20);
	DIV_DMACLEAR(3, 0, MINE_MAP_ADDR, 0x800, 16);

	update_mine_mapdata();

	if(DispMine){
		trans_closebutton_map(1);
		AddMineIcon(1);
		MapTransReq((u16*)MINE_MAP_ADDR, 10, 0, Work->mine_map, 0, 0, 12, 22, 12);
	}else{
		MapTransReq((u16*)MINE_MAP_ADDR, 10, 0, Work->mine_map, 0, 20, 12, 2, 12);
		trans_closebutton_map(1);
	}

	Work->close_anm_on = 0;
}
/*==============================================
==	ボックス表示の初期化
==	on   表示 1,  消去 0
==============================================*/
static void mine_on_init(void)
{
	Work->mine_sy = 20;
	Work->mine_height = 2;
	Work->mine_on_cnt = 0;
	AddMineIcon(0);
}
/*==============================================
==	ボックス表示待ち
==	return:  終了 0,  継続中 1
==============================================*/
static u8 mine_on_wait(void)
{
	if(Work->mine_on_cnt == MINEBOX_SCROLL_SYNC){ return 0; }

	Work->mine_sy--;
	Work->mine_height++;
	MapTransReq((u16*)MINE_MAP_ADDR, 10, 0, Work->mine_map, 0, Work->mine_sy, 12, Work->mine_height, 12);
	ScrollMineIcon(8);

	if(++(Work->mine_on_cnt) == MINEBOX_SCROLL_SYNC){
		DispMine = 1;
		return 0;
	}

	return 1;
}
/*==============================================
==	ボックス消去の初期化
==============================================*/
static void mine_off_init(void)
{
	Work->mine_sy = 0;
	Work->mine_height = 22;
	Work->mine_on_cnt = 0;
}
/*==============================================
==	ボックス消去待ち
==	return:  終了 0,  継続中 1
==============================================*/
static u8 mine_off_wait(void)
{
	if(Work->mine_on_cnt == MINEBOX_SCROLL_SYNC){ return 0; }

	Work->mine_sy++;
	Work->mine_height--;
	MapTransReq((u16*)MINE_MAP_ADDR, 10, 0, Work->mine_map, 0, Work->mine_sy, 12, Work->mine_height, 12);
	MapClearReq((u16*)MINE_MAP_ADDR, 10, Work->mine_height, 12, 1);
	ScrollMineIcon(-8);

	if(++(Work->mine_on_cnt) == MINEBOX_SCROLL_SYNC){
		DispMine = 0;
		DelMineIconAll();
		BoxTumeMineData();
		MapTransReq((u16*)MINE_MAP_ADDR, 21, 0, close_on_Map, 0, 0, 1, 2, 9);
		return 0;
	}
	return 1;
}
/*==============================================
==	とじるボタンマップデータ転送
==	on  点滅オン・オフ（0 or 1）
==============================================*/
static void trans_closebutton_map(u8 on)
{
	if(on){
		MapTransReq((u16*)MINE_MAP_ADDR, 21, 0, close_on_Map, 0, 0, 9, 2, 9);
	}else{
		MapTransReq((u16*)MINE_MAP_ADDR, 21, 0, close_off_Map, 0, 0, 9, 2, 9);
	}
}
/*==============================================
==	とじるボタン点滅開始
==============================================*/
static void start_closebutton_anm(void)
{
	Work->close_anm_on = 1;
	Work->close_anm_timer = CLOSE_ANM_WAIT;
	Work->close_anm_state = 1;
}
/*==============================================
==	とじるボタン点滅終了
==============================================*/
static void stop_closebutton_anm(void)
{
	if(Work->close_anm_on){
		Work->close_anm_on = 0;
		trans_closebutton_map(1);
	}
}
/*==============================================
==	とじるボタン点滅実行
==============================================*/
static void closebutton_anm(void)
{
	if(Work->close_anm_on){
		if(++(Work->close_anm_timer) > CLOSE_ANM_WAIT){
			Work->close_anm_timer = 0;
			Work->close_anm_state = !(Work->close_anm_state);
			trans_closebutton_map(Work->close_anm_state);
		}
	}
}
/*==============================================
==	てもちボックスのマップデータを更新
==============================================*/
static void update_mine_mapdata_sub(u8 pos, u8 on);
static void update_mine_mapdata()
{
	u8 i, on;

	for(i = 1; i < TEMOTI_POKEMAX; i++){
		on = (NON_POKE != PokeParaGet(PokeParaMine + i, ID_monsno));
		update_mine_mapdata_sub(i, on);
	}
}
static void update_mine_mapdata_sub(u8 pos, u8 on)
{
	u16 x, y, p;
	const u16 *src;

	src = (on)? mine_icon_on_map : mine_icon_off_map;
	p = 7 + (1 + (pos-1)*3)*MINEBOX_MAP_WIDTH;

	for(y = 0; y < 3; y++){
		for(x = 0; x < 4; x++){
			Work->mine_map[p+x] = src[x];
		}
		src += 4;
		p += MINEBOX_MAP_WIDTH;
	}

}
/*==============================================
==	てもちボックスの画像を更新（フル表示時のみ）
==============================================*/
static void update_mine(void)
{
	update_mine_mapdata();
	MapTransReq((u16*)MINE_MAP_ADDR, 10, 0, Work->mine_map, 0, 0, 12, 22, 12);
}
/*==============================================
==	カーソルをてもちボックスへ移動（初期化）
==============================================*/
static void goto_mine_init(void)
{
	Work->gotomine_prog = 0;
	SePlay(SE_WIN_OPEN);
	mine_on_init();
}
/*==============================================
==	カーソルをてもちボックスへ移動（終了待ち）
==============================================*/
static u8 goto_mine_wait(void)
{
	switch(Work->gotomine_prog){
	case 0:
		if(!mine_on_wait()){
			BoxCursorMoveToMine();
			Work->gotomine_prog++;
		}
		break;

	case 1:
		if(!BoxCursorMoveWait()){
			if(Work->point_poke_update){
				update_status_eff();
			}
			Work->gotomine_prog++;
		}
		break;

	case 2:
		return 0;
	}
	return 1;
}

/**********************************************************************/
/*  メッセージ                                                        */
/**********************************************************************/
#define  MSGWND_X1    (10)
#define  MSGWND_X2    (29)
#define  MSGWND_Y1    (16)
#define  MSGWND_Y2    (19)
#define  MSG_X        (MSGWND_X1+1)
#define  MSG_Y        (MSGWND_Y1+1)

#define  YESNOWND_X  (23)
#define  YESNOWND_Y  (10)


/*==============================================
==	メッセージ表示
==	msg  メッセージタイプ
==============================================*/
static void disp_message(u8 msg)
{
	#define MESSAGE_MAXLEN  (18)
	enum MSGTYPE {
		MSGTYPE_NORMAL,
		MSGTYPE_FOODER,
		MSGTYPE_HEADER,
		MSGTYPE_BETWEEN,
		MSGTYPE_NIGASHITA_FOODER,
		MSGTYPE_NIGASHITA_HEADER,
		MSGTYPE_NIGASHITA_BETWEEN,
	};

	static const struct {
		const u8 *msg;
		u8        type;
	}msgtbl[] = {
		{ BoxMsg00, MSGTYPE_NORMAL  },
		{ BoxMsg01, MSGTYPE_NORMAL  },
		{ BoxMsg02, MSGTYPE_NORMAL  },
		{ BoxMsg03, MSGTYPE_NORMAL  },
		{ BoxMsg04, MSGTYPE_FOODER  },
		{ BoxMsg05, MSGTYPE_NORMAL  },
		{ BoxMsg06, MSGTYPE_NORMAL  },
		{ BoxMsg07, MSGTYPE_FOODER  },
		{ BoxMsg08, MSGTYPE_NORMAL  },
		{ BoxMsg09, MSGTYPE_NORMAL  },
		{ BoxMsg10, MSGTYPE_NIGASHITA_FOODER  },
		{ BoxMsg11, MSGTYPE_NIGASHITA_BETWEEN },
		{ BoxMsg12, MSGTYPE_NORMAL  },
		{ BoxMsg13, MSGTYPE_NORMAL  },
		{ BoxMsg14, MSGTYPE_NORMAL  },
		{ BoxMsg15, MSGTYPE_NORMAL  },
		{ BoxMsg16, MSGTYPE_NORMAL  },
		{ BoxMsg17, MSGTYPE_NORMAL  },
		{ BoxMsg18, MSGTYPE_NORMAL  },
		{ BoxMsg19, MSGTYPE_FOODER  },
		{ BoxMsg20, MSGTYPE_NORMAL  },
		{ BoxMsg21, MSGTYPE_NORMAL  },
		{ BoxMsg22, MSGTYPE_NORMAL  },
	};
	u8 *cp;

	NMenuWinBoxWrite(MSGWND_X1, MSGWND_Y1, MSGWND_X2, MSGWND_Y2);

	switch(msgtbl[msg].type){
	case MSGTYPE_HEADER:
		cp = PM_strcpy(Work->msg_buf, msgtbl[msg].msg);
		cp = PM_strcpy(cp, Work->status_pokename);
		break;

	case MSGTYPE_NIGASHITA_HEADER:
		cp = PM_strcpy(Work->msg_buf, msgtbl[msg].msg);
		cp = PM_strcpy(cp, Work->nigashita_pokename);
		break;

	case MSGTYPE_FOODER:
		cp = PM_strcpy(Work->msg_buf, Work->status_pokename);
		cp = PM_strcpy(cp, msgtbl[msg].msg);
		break;
	case MSGTYPE_NIGASHITA_FOODER:
		cp = PM_strcpy(Work->msg_buf, Work->nigashita_pokename);
		cp = PM_strcpy(cp, msgtbl[msg].msg);
		break;

	case MSGTYPE_BETWEEN:{
		const u8 *fooder_p = msgtbl[msg].msg + PM_strlen(msgtbl[msg].msg) + 1;
		cp = PM_strcpy(Work->msg_buf, msgtbl[msg].msg);
		cp = PM_strcpy(cp, Work->status_pokename);
		cp = PM_strcpy(cp, fooder_p);
		break;
		}
	case MSGTYPE_NIGASHITA_BETWEEN:{
		const u8 *fooder_p = msgtbl[msg].msg + PM_strlen(msgtbl[msg].msg) + 1;
		cp = PM_strcpy(Work->msg_buf, msgtbl[msg].msg);
		cp = PM_strcpy(cp, Work->nigashita_pokename);
		cp = PM_strcpy(cp, fooder_p);
		break;
		}

	case MSGTYPE_NORMAL:
	default:
		cp = PM_strcpy(Work->msg_buf, msgtbl[msg].msg);
		break;

	}

	while(cp < &(Work->msg_buf[MESSAGE_MAXLEN])){ *cp++ = spc_; }
	*cp = EOM_;

	NMenuMsgWrite(Work->msg_buf, MSG_X, MSG_Y);
}
/*==============================================
==	「はい」「いいえ」選択表示
==	pos  デフォルトカーソル位置
==============================================*/
static void disp_yesno_box(u8 pos)
{
	YesNoSelectInit(YESNOWND_X, YESNOWND_Y);
	NMenuVCursorSet(pos);
}
/*==============================================
==	メッセージ消去
==============================================*/
static void clear_message(void)
{
	NMenuBoxClear(MSGWND_X1, MSGWND_Y1, MSGWND_X2, MSGWND_Y2);
	NMenuBoxClear(YESNOWND_X, YESNOWND_Y, 29, 15);
}
/**********************************************************************/
/*  メニュー                                                          */
/**********************************************************************/
/*======================================
==	壁紙テーマ選択メニュー
======================================*/
static void dispmenu_wp_theme(void)
{
	BoxMenuInit();
	BoxMenuAdd(MENU_WPTHEME0);
	BoxMenuAdd(MENU_WPTHEME1);
	BoxMenuAdd(MENU_WPTHEME2);
	BoxMenuAdd(MENU_WPTHEME3);
	BoxMenuDisp();
}
/*======================================
==	壁紙タイプ選択メニュー
==	theme  テーマ番号
======================================*/
static void dispmenu_wp_type(u8 theme)
{
	BoxMenuInit();

	switch(theme){
	case 0:
		BoxMenuAdd(MENU_WPTYPE0_0);
		BoxMenuAdd(MENU_WPTYPE0_1);
		BoxMenuAdd(MENU_WPTYPE0_2);
		BoxMenuAdd(MENU_WPTYPE0_3);
		break;
	case 1:
		BoxMenuAdd(MENU_WPTYPE1_0);
		BoxMenuAdd(MENU_WPTYPE1_1);
		BoxMenuAdd(MENU_WPTYPE1_2);
		BoxMenuAdd(MENU_WPTYPE1_3);
		break;
	case 2:
		BoxMenuAdd(MENU_WPTYPE2_0);
		BoxMenuAdd(MENU_WPTYPE2_1);
		BoxMenuAdd(MENU_WPTYPE2_2);
		BoxMenuAdd(MENU_WPTYPE2_3);
		break;
	case 3:
		BoxMenuAdd(MENU_WPTYPE3_0);
		BoxMenuAdd(MENU_WPTYPE3_1);
		BoxMenuAdd(MENU_WPTYPE3_2);
		BoxMenuAdd(MENU_WPTYPE3_3);
		break;
	}

	BoxMenuDisp();

}
/**********************************************************************/
/*  ボックスパラメータ参照                                            */
/**********************************************************************/
u8 GetCurrentBox(void)
{
	return BoxData.CurrentBoxNo;
}


/**********************************************************************/
/*  アクターデータ                                                    */
/**********************************************************************/
/*==============================================
==	ステータスポケモン
==============================================*/
static const ActOamData StatusPokeOam = {
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
	0,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
/*==============================================
==	波形エフェクト
==============================================*/
static const ActOamData WaveOam = {
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
	0,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};

#define WAVE_ANM_WAIT  (8)
static const actAnm WaveAnm_LStop[]={
	{ 0, 5, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};
static const actAnm WaveAnm_LMove[]={
	{  2, WAVE_ANM_WAIT, 0, 0 },
	{  4, WAVE_ANM_WAIT, 0, 0 },
	{  6, WAVE_ANM_WAIT, 0, 0 },
	{ ACT_ANMLOOP, 0, 0, 0 }
};
static const actAnm WaveAnm_RStop[] = {
	{  8, 5, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};
static const actAnm WaveAnm_RMove[]={
	{ 10, WAVE_ANM_WAIT, 0, 0 },
	{  4, WAVE_ANM_WAIT, 0, 0 },
	{ 12, WAVE_ANM_WAIT, 0, 0 },
	{ ACT_ANMLOOP, 0, 0, 0 }
};


static const actAnm *const WaveAnmTbl[]={
	WaveAnm_LStop,
	WaveAnm_LMove,
	WaveAnm_RStop,
	WaveAnm_RMove,
};

static const actHeader WaveActHeader = {
	CELLID_WAVE,
	PALID_OBJCOM,
	&WaveOam,
	WaveAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	DummyActMove,
};















#ifdef ICON_CELLMAN_CHK
static void IconCellManChkTask(u8 id)
{
	static u8 buf[16];
	TASK_TABLE *my = &TaskTable[id];
	u16 c1, c2, i;

	switch(my->work[0]){
	case 0:
		c1 = 0;
		c2 = 0;
		for(i = 0; i < ICON_CELLMAN_MAX; i++)
		{
			if(Work->icon_cell_use[i] != NON_POKE){ c1++; }
			if(Work->icon_cell_cnt[i] != 0){ c2++; }
		}

		if(c1 > ICON_CELLMAN_MAX || c1 != c2)
		{
			u8 *cp;
			cp = PM_NumMsgSet(buf,c1,NUM_MODE_SPACE,2);
			*cp++ = sura_;
			cp = PM_NumMsgSet(buf,c2,NUM_MODE_SPACE,2);
			my->work[0]=1;
		}
		else
		{
			PM_NumMsgSet(buf,c1,NUM_MODE_LEFT,2);
		}
		NMenuMsgWrite(buf,1,15);
		break;

	case 1:
		NMenuMsgWrite(buf,1,15);
		break;
	}

}
#endif
