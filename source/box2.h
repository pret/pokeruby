/**********************************************************************/
/*  パソコンボックス統合版                                            */
/**********************************************************************/
#ifndef _BOX_2_H_
#define _BOX_2_H_

#include "MaDefine.h"
#include "boxsel.h"
#include "boxef.h"
#include "maptrans.h"
#include "marking.h"
#include "pokeicon.h"
#include "pasocom.h"
#include "pokelist.h"
#include "poketool.h"
#include "box_mode.h"
#include "monsno.def"

/*====================================================================*/
/*  ｸﾞﾛｰﾊﾞﾙ変数                                                       */
/*====================================================================*/
#ifdef PM_DEBUG
extern u8 BoxDebugMode;
#endif

/*====================================================================*/
/*  マクロ・定数                                                      */
/*====================================================================*/
#define MAP_ADDR(b)   (BG_VRAM + (b) * 0x800)
#define CHAR_ADDR(b)  (BG_VRAM + (b) * 0x4000)

#define BOX_MENU_MAX   (7)  // １度に表示できるメニュー項目数
#define NON_POKE       (0)

// 他画面に制御が移っている時のポケモンデータ一時保存領域
extern PokemonParam  PokeParaTmp;
#define POKETMP_ADDR  ((PokemonParam*)&PokeParaTmp)

/*-- レイアウト --*/
#define ICON_WIDTH     (24)
#define ICON_HEIGHT    (24)
#define TRAYICON_XORG  (100)
#define TRAYICON_YORG  (44)
#define MINEICON_XORG  (152)
#define MINEICON_YORG  (16)
#define TOPICON_XPOS   (104)
#define TOPICON_YPOS   (MINEICON_YORG+ICON_WIDTH*2)

#define MINEBOX_SCROLL_SYNC   (20)
#define MINEBOX_MAP_WIDTH     (12)
#define MINEBOX_MAP_HEIGHT    (22)
#define MINEBOX_CURSOR_MAXPOS (TEMOTI_POKEMAX)

#define MINEBOX_MODORU_XPOS  (MINEICON_XORG)
#define MINEBOX_MODORU_YPOS  (144)

/*-- トレイ --*/
#define TRAY_BODY_CHARS    (20)
#define TRAY_MARGIN_CHARS  (4)
#define TRAY_XCHARS        (TRAY_BODY_CHARS+TRAY_MARGIN_CHARS)  // 24
#define TRAY_SCROLL_WIDTH  (TRAY_XCHARS*8)    // 192
#define TRAY_SCROLL_SPEED  (6)  // TRAY_SCROLL_WIDTH の約数にすること！
#define TRAY_SCROLL_SYNC   (TRAY_SCROLL_WIDTH/TRAY_SCROLL_SPEED)
#define TRAY_NEXT_APPEAR_SYNC   ((TRAY_MARGIN_CHARS*8)/TRAY_SCROLL_SPEED)

/*-- カーソル --*/
#define CURSOR_ICON_DIFF    (12)  // カーソル－アイコン座標差
#define CURSOR_SHADOW_DIFF  (20)  // カーソル－影座標差
#define CURSOR_TUKAMU_DIPTH (8)   // 「つかむ」時に何ドット下がる？
#define CURSOR_CATCTHICON_DIFF  (CURSOR_ICON_DIFF-CURSOR_TUKAMU_DIPTH) // つかんだアイコンとの座標差

/*-- アイコンセルマネージャ --*/
#define ICON_CELLMAN_MAX  (40)  // アイコンセルマネージャで管理できるアイコン数
#define CELLMAN_CHAR_ST  (ICON_CELLMAN_MAX*16)  // 従来のセルマネージャで管理できるキャラナンバ開始値


/*-- マップ転送 --*/
#define MAP_TRANS_MAX     (8)

/*-- セルＩＤ --*/
enum CELL_ID {
	CELLID_CURSOR = 0,
	CELLID_SHADOW,
	CELLID_STATUS_POKE,
	CELLID_BOXNAME,
	CELLID_NEXTBOXNAME,
	CELLID_WAVE,
	CELLID_ARROW,

	CELLID_BOXSEL,   // 選択ウィンドウ用に３つ必要
	CELLID_BOXSEL2,
	CELLID_BOXSEL3,

	CELLID_MARKING,  // マーキングウィンドウ用に３つ必要
	CELLID_MARKING2,
	CELLID_MARKING3,
	CELLID_MARKING_STATE, // マーキング状態表示用

	CELLID_SCANLINE,
	CELLID_ICON_MIN,  // アイコン用セルＩＤの最小値
};
/*-- パレットＩＤ --*/
enum PAL_ID {
	PALID_CURSOR = (PALID_POKEICON_5+1),
	PALID_STATUS_POKE,
	PALID_BOXNAME,
	PALID_NEXTBOXNAME,
	PALID_BOXSEL,

	PALID_MARKING,   // マーキングウィンドウ用に２つ必要
	PALID_MARKING2,

	PALID_OBJCOM,
	PALID_MARKING_STATE,
	PALID_ARROW,
	PALID_SCANLINE,
	PALID_QUICK_CURSOR,
};
/*-- キーリード結果 --*/
enum CURSOR_ACT {
	ACT_NOTHING,      // 動作なし
	ACT_CURSOR_MOVE,  // 通常移動
	ACT_TRAY_CHANGE,  // トレイ切り替え
	ACT_WALLPAPER,    // 壁紙変更
	ACT_BOXOFF,       // スイッチオフ確認
	ACT_MINEBOX_ON,   // てもちボックス表示
	ACT_MINEBOX_OFF,  // てもちボックス消去→トレイ
	ACT_TRAYMENU,     // トレイメニュー表示
	ACT_POKEMENU,     // ポケモンメニュー表示
	ACT_SCROLL_NEXT,  // トレイスクロール次へ
	ACT_SCROLL_PREV,  // トレイスクロール前へ
	ACT_DIRECT_AZUKERU,   // メニューを介さず「あずける」
	ACT_DIRECT_TURETEIKU, // メニューを介さず「つれていく」
	ACT_DIRECT_TUKAMU,    // メニューを介さず「つかむ」
	ACT_DIRECT_IREKAERU,  // メニューを介さず「いれかえる」
	ACT_DIRECT_OKU,       // メニューを介さず「おく」
	ACT_ISCONTINUE,   // 継続しますか？の確認ﾒｯｾｰｼﾞ
};

/*-- BGﾊﾟﾚｯﾄ --*/
#define STATUS_OFF_PAL    PA_BG0   // ｽﾃｰﾀｽｳｨﾝﾄﾞｳ（輝度ﾀﾞｳﾝ)
#define STATUS_PAL        PA_BG1   // ｽﾃｰﾀｽｳｨﾝﾄﾞｳ
#define MINE_PAL          PA_BG2   // 手持ちﾎﾞｯｸｽ
#define CLOSE_PAL         PA_BG3   // とじるﾎﾞﾀﾝ

#define TRAY_PAL_MAX     (3)     // １枚の壁紙で使えるﾊﾟﾚｯﾄ本数
#define TRAY_PAL_NUM     (4)     // 
#define TRAY_PAL         PA_BG4  // ここから(TRAY_PAL_MAX*2)だけ使用

#define MALE_PAL          PA_BG11  // ♂マーク
#define FEMALE_PAL        PA_BG12  // ♀マーク

#define BG_PAL            PA_BG13  // 背景
#define FONT_PAL          PA_BG15  // ﾌｫﾝﾄ


/*-- アクタープライオリティ --*/
enum ACTPRI {
	ACTPRI_STATUSPOKE,
	ACTPRI_MARKING,
	ACTPRI_WAVE,
	ACTPRI_BOXSEL,    // 選択ウィンドウ用に３つ必要
	ACTPRI_BOXSEL_2,  // 
	ACTPRI_BOXSEL_3,  //
	ACTPRI_CURSOR,
	ACTPRI_CATCHICON,
	ACTPRI_BOXSEL_WINDOW,
	ACTPRI_BOXSEL_CENTERTAB,
	ACTPRI_BOXSEL_SIDETAB,
	ACTPRI_MINEICON,
	ACTPRI_MINESHADOW,
	ACTPRI_TRAYICON,
	ACTPRI_TRAYSHADOW = ACTPRI_TRAYICON+YOKO_KAZU+1,
	ACTPRI_ARROW,
	ACTPRI_CLOSEBUTTON,
	ACTPRI_BOXNAME,
};

/*-- カーソル命令 --*/
enum CURSOR_OP {
	CURSOR_OP_TUKAMU,
	CURSOR_OP_OKU,
	CURSOR_OP_IREKAERU,
	CURSOR_OP_AZUKERU,
	CURSOR_OP_NIGASU,
	CURSOR_OP_TURETEIKU,
};

/*-- アイコンタイプ --*/
enum ICONTYPE {
	ICONTYPE_MINE,
	ICONTYPE_TRAY,
	ICONTYPE_CATCH,
};

/*-- 画面切り替え --*/
enum CHANGEMAIN {
	CHANGEMAIN_YOUSU,  // ようすをみる
	CHANGEMAIN_NAMAE,  // なまえ
};

/*-- メニュー --*/
enum MENU {
	MENU_YAMERU = 0,
	MENU_AZUKERU,
	MENU_TURETEIKU,
	MENU_TUKAMU,
	MENU_IREKAERU,
	MENU_OKU,
	MENU_YOUSUMIRU,
	MENU_NIGASU,
	MENU_MARKING,
	MENU_BOXCHANGE,
	MENU_WALLPAPER,
	MENU_BOXNAME,
	MENU_WPTHEME0,
	MENU_WPTHEME1,
	MENU_WPTHEME2,
	MENU_WPTHEME3,
	MENU_WPTYPE0_0,  // ←壁紙メニューは連続して置くこと！
	MENU_WPTYPE0_1,
	MENU_WPTYPE0_2,
	MENU_WPTYPE0_3,
	MENU_WPTYPE1_0,
	MENU_WPTYPE1_1,
	MENU_WPTYPE1_2,
	MENU_WPTYPE1_3,
	MENU_WPTYPE2_0,
	MENU_WPTYPE2_1,
	MENU_WPTYPE2_2,
	MENU_WPTYPE2_3,
	MENU_WPTYPE3_0,
	MENU_WPTYPE3_1,
	MENU_WPTYPE3_2,
	MENU_WPTYPE3_3,
						  // ------------------------------------

	MENU_DEBUG_POKESET,  // デバッグ用
};

/*====================================================================*/
/*  構造体定義                                                        */
/*====================================================================*/
typedef struct {
	u16 monsno;
	s16 x;
	s16 y;
	u16 pokeno;
	s16 w1;
	s16 w2;
	u8 oampri;
	u8 actpri;
}SCROLLICON_ADDPARAM;

#define SCROLLICON_ADD_MAX  (TATE_KAZU)

/*====================================================================*/
/*  ワーク領域                                                        */
/*====================================================================*/
typedef struct {
	// サブプロセス
	pFunc  sub_proc;
	u8     prog;
	u8     mode;  // 動作モード（あずける・つれていく・せいりする）
	u8     changemain_mode;  // 画面切り替えモード（ようすをみる・なまえ）


	// 背景スクロール
	u8  bg_scr_cnt;
	u16 background_v;
	u16 background_h;

	// スイッチオン・オフエフェクト
	SCAN_WORK  scanwk;

	// てもち
	MAP_TRANS_WORK  mtwk;
	MAP_TRANS_PARAM mtparam[MAP_TRANS_MAX];
	u16 mine_map[MINEBOX_MAP_WIDTH*MINEBOX_MAP_HEIGHT];
	u16 mine_sy;
	u16 mine_height;
	s8  mine_h_add;
	u8  mine_on_cnt;
	u8  gotomine_prog;

	// とじるボタン
	u8  close_anm_on;
	u8  close_anm_timer;
	u8  close_anm_state;

	// トレイ
	s16 scr_boxno;
	u16 tray_h;
	s16 tray_scroll_speed;
	u16 tray_scroll_cnt;
	u8  tray_trans_pos;

	u8  tray_iconadd_box;
	s16 tray_iconadd_line;
	s16 tray_iconadd_lineadd;
	s16 tray_iconadd_xorg;
	s16 tray_iconadd_x;
	s16 tray_iconadd_xadd;
	s16 tray_iconadd_y;
	s16 tray_iconadd_timer;

	u8  fontobj_cell[0x200];  // 32x16 obj x 2
	u8  fontobj_work[0x200];
	u8  boxname_toggle;
	u16 boxname_pal[16];
	u16 boxname_palno, nextboxname_palno;
	actWork *boxname_actor[2];
	actWork *nextboxname_actor[2];
	actWork *arrow_actor[2];
	u32 tray_fade_mask;
	SCROLLICON_ADDPARAM  scricon_addparam[SCROLLICON_ADD_MAX];
	u16                  scricon_req_cnt;

	// 壁紙変更
	s16  wp_theme, wp_type;
	u16  wpbg_work[20*18];
	u8   wp_prog;

	// アイコン操作
	actWork *catch_icon;
	actWork *mine_icon[TEMOTI_POKEMAX];
	actWork *tray_icon[BOX_PM_KAZU];
	actWork **swap_icon;
	actWork **nigasu_icon;
	u16  icon_cell_cnt[ICON_CELLMAN_MAX];
	u16  icon_cell_use[ICON_CELLMAN_MAX];
	u8   icon_swap_prog;
	u8   tsume_move_icons;

	u16  icon_scroll_timer;
	s16  icon_scroll_xpos;
	s16  icon_scroll_speed;
	u16  icon_scroll_actcnt;
	u8   icon_scroll_line;
	s8   icon_scroll_vec;
	u8   icon_scroll_seq;
	u8   icon_scroll_box;


	// メニュー
	MENU_ITEM  menu[BOX_MENU_MAX];
	u8         menu_cnt;
	u8         menu_maxlen;
	u16        menu_x1, menu_y1;

	// カーソル
	actWork *cursor_actor;
	actWork *shadow_actor;

	s32  cursor_x, cursor_y, cursor_ax, cursor_ay;
	s16  cursor_end_x, cursor_end_y;
	u16  cursor_move_sync;
	s8   cursor_vloop;
	s8   cursor_hloop;
	s8   cursor_nextmode;
	s8   cursor_nextpos;
	u8   mine_pos_save;
	u8   cursor_vflip;
	u8   cursor_palno[2];

	void* status_pal_addr;
	u32   status_rnd;
	u16   status_monsno;
	u16   status_itemno;
	u16   status_hp;
	u8    point_poke_update;
	u8    status_mark;
	u8    status_lv;
	u8    status_tamago_flg;
	u8    status_pokename[MONS_NAME_SIZE+EOM_SIZE];
	u8    status_str[3][36];

	u8 (* cursor_op)(void);
	u8  cursor_op_prog;
	u8  swap_poke_box;

	// マーキング
	actWork *marking_actor;
	actWork *wave_actor[2];
	u8      *marking_char_addr;
	MARKING_WORK  MarkWork;

	// ボックス選択ウィンドウ
	BOXSEL_WORK SelWork;

	// つかんでいるポケモンのデータ
	PokemonParam     PP;
	PokemonParam     PPtmp;  // いれかえ用

	// 逃がせるチェック
	u8  nigaseru_chk_result;
	u8  nigaseru_chk_end;
	u8  nigaseru_naminori_chk;
	u8  nigaseru_diving_chk;
	s8  nigaseru_chk_box;
	s8  nigaseru_chk_pos;
	s8  nigaseru_target_box;
	s8  nigaseru_target_pos;
	u16 nigaseru_chk_prog;
	u16 nigaseru_chk_wazano[3];

	// ようすをみるパラメータ
	u8  yousu_array_max;
	u8  yousu_array_pos;
	u8  yousu_type;
	void *yousu_array_addr;

	// 文字列処理
	u8 msg_buf[40];
	u8 boxname_buf[40];
	u8 nigashita_pokename[MONS_NAME_SIZE+EOM_SIZE];

	// デバッグ用ポケモンセットモードフラグ
	u8  DebugPokeSetMode;

	// ポケモン画像
	u16  status_poke_palno;
	u32  status_poke_celladrs;
	actWork *status_poke_actor;
	u16 PokePal[16*4];      // ポワワ用に４体分
	u8  PokeCell[0x2000];   // ポワワ用に４体分
	u8  PokeCellWork[0x800];

}BOX2WORK;

extern BOX2WORK * const Work;

/*====================================================================*/
/*  プロトタイプ                                                      */
/*====================================================================*/
/*-- box2.c --*/
u8 GetCurrentBox(void);

/*-- box2_tray.c --*/
void InitBoxTray(u8 current_box);
void BoxTray_InitScroll(u8 box_no);
u8 BoxTray_WaitScroll(void);
void BoxTray_WallPaperChangeInit(u8 wp_no);
u8 BoxTray_WallPaperChangeWait(void);
void BoxArrowMove(u8 on);

/*-- box2_icon.c --*/
void InitBox2Icon(void);
void AddTrayIcon(u8 box);
void AddMineIcon(u8 disp);
void DelMineIcon(u8 pos);
void DelMineIconAll(void);
void ScrollMineIcon(s16 vector);
void TrayIconScrollOut(s16 vector);
void TrayIconScrollIn(u8 box, u8 line, s16 xpos, s16 speed);
void TrayIconScrollIn2(u8 box, u8 x, u8 y, u8 wait, s16 speed);
void BoxIconCatch(u8 icon_type, u8 pos);
void BoxIconPut(u8 box, u8 pos);
void BoxIconSwapInit(u8 box, u8 pos);
u8 BoxIconSwapWait(void);
void BoxIcon_TrayUpdate(u8 pos);
void BoxIcon_DelCatch(void);
void BoxIcon_NigasuInit(u8 icon_type, u8 pos);
u8 BoxIcon_NigasuWait(void);
void BoxIcon_NigasuFinish(void);
void BoxIcon_ModoruInit(void);
u8 BoxIcon_ModoruWait(void);

void RecoverBoxCatchIcon(void);
void BoxIconCellTrans(void);
void BoxIcon_TumeInit(void);
u8 BoxIcon_TumeWait(void);

void TrayIconScrollInit(u8 box, s8 vec);
u8  TrayIconScrollWait(void);



/*-- box2_cursor.c --*/
void InitBoxCursor(void);
void RecoverBoxCursor(void);
u8 BoxCursorKeyRead(void);
u8 BoxCursorMoveWait(void);
void BoxCursorMoveToMine(void);
void BoxCursorMoveToTray(u8 pos);
void BoxDispMenu(void);
s16 BoxSelectMenu(void);
void BoxCursorOP_Init(u8 op);
u8 BoxCursorOP_Exe(void);
u8 BoxAzukeruInit(u8 box);
void BoxAzukeruFinish(void);
s16 BoxTumeMineData(void);
void BoxNigasuAnmInit(void);
u8 BoxNigasuAnmWait(void);
void BoxNigasuFinish(void);
void BoxSetTmpPokeData(void);
void BoxGetTmpPokeData(void);
void BoxSetMarkingParam(u8 mark);
u8 CheckCatchIcon(void);
u8 CheckLastOneMine(void);
u8 CheckIrekaeOK(void);
u8 CheckArrowMoveState(void);
u8 CheckBoxCursorOnCloseButton(void);
void TrayReturnPosInit(void);
void TrayReturnPosSave(void);
u8 TrayReturnPosLoad(void);
actWork* MakeBoxArrowActor(u16 x, u16 y, u8 vector, u8 oampri, u8 actpri);
void BoxUpdateStatusParam(void);
void BoxNigaseruCheckInit(void);
s8  BoxNigaseruCheck(void);
void BoxModoruFinish(void);
void BoxYousuParamSet(void);
void BoxYousuParamRecover(void);

/*-- box2_menu.c --*/
void BoxMenuInit(void);
void BoxMenuAdd(u8 menu_type);
void BoxMenuDisp(void);
s16 BoxMenuSelect(void);
s8 BoxMenuCheck(u8 pos);

#endif
