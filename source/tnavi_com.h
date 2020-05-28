/***********************************************************************
**	トレナビ（内部ヘッダ）
***********************************************************************/
#ifndef _TNAVI_COM_H_
#define _TNAVI_COM_H_

#include "common.h"
#include "intr.h"
#include "actanm.h"
#include "actor.h"
#include "palanm.h"
#include "menu.h"
#include "calctool.h"
#include "pokelist.h"
#include "wmap.h"
#include "pasocom.h"
#include "townmap.h"
#include "marking.h"
#include "cubedemo.h"
#include "trainer.h"
#include "ev_fight.h"
#include "../data/revenge.h"

/*====================================================================*/
/*  構造体定義                                                        */
/*====================================================================*/
typedef struct {
	u16 x, y;
}POS;

typedef struct {
	u8   param; // 能力値
	u8   box;   // ボックスナンバー（ == BOX_KAZU だったら手持ち）
	u16  poke :  5;    // ボックス内の番号
	u16  rank :  9;    // 順位
	u16  enable : 1;  // 有効/無効フラグ

	u16  dmy : 1;
}POKE_SORT_DATA;

typedef struct {
	u16  id;    // ゲーム内共通のトレーナーＩＤ
	u16  Wpos;  // 存在する地域
	u8   regist_id;  // トレナビ内のみの通し番号
	u8   revenge_flag;  // 再戦フラグ状態
}TRAINER_EYE_DATA;


/*====================================================================*/
/*  定数                                                              */
/*====================================================================*/
// レーダーチャート領域
#define RADOR_TOP     (56)
#define RADOR_BOTTOM  (121)
#define RADOR_HEIGHT  ((RADOR_BOTTOM-RADOR_TOP)+1)
#define RADOR_CX      (155)
#define RADOR_CY      (91)
#define RADOR_PARAM_MAX  (RADOR_CY - RADOR_TOP)
#define RADOR_PARAM_STEP  ((256<<8)/RADOR_PARAM_MAX)

// メニューＢＧのフェードステップ数
#define MENUBG_FADE_STEP   (16)
#define MENUBG_FADE_PALCNT (2)
#define MENUBG_FADE_PALMAX ((MENUBG_FADE_STEP*MENUBG_FADE_PALCNT-1)*2)

// メニュー数
#define MAINMENU_NUM       (4)
#define CONDITIONMENU_NUM  (2)
#define SEARCHMENU_NUM     (5)

// モーフィングステップ数
#define MORPH_STEP  (10)

// ソートするポケモンの最大数
#define SORT_POKE_MAX   ((BOX_KAZU*BOX_PM_KAZU)+TEMOTI_POKEMAX)

// １ページあたりのリスト最大数
#define SEARCH_POKE_DISP_MAX  (5)
#define LIST_MAX    (8)
#define LIST_STR_MAX  (17)  // １行あたりの最大文字数

#define LIST_BUF_SIZE  (64)


// 各種文字列サイズ
#define POKELIST_MAXLEN  (12)
#define CATEGORY_MAXLEN  (5)
#define RANKSTR_MAXLEN   (7)
#define MENUINFO_MAXLEN  (22)

// リボン画面の表示個数
#define RIBBON_FRAME_X  (9)
#define RIBBON_FRAME_Y  (4)

// リボンオブジェのセルサイズ、形状パターン、最大アクター数
#define RIBBON_SHAPE_MAX   (12)
#define RIBBON_COLOR_MAX   (5)
#define RIBBON_CELL_SIZE   (8*4*16*RIBBON_SHAPE_MAX)
#define RIBBON_NUM_MAX     (32)

#define RIBBON_INFO_MAXLEN  (16)

// キラキラエフェクトのアクター数
#define FUR_LV_MAX (9)   // 毛並みレベルの最大値
#define KIRA_MAX   (10)

// マップ画面の情報文字数
#define MAPINFO_MAXLEN  (10)

// ミニマップのマップデータを展開しておくワーク
#define MINIMAP_WORK_SIZE   (200)  // 10x10 map
#define MINIMAP_WORK_NUM    (22)   // ワーク数
#define MINIMAP_TOWN_MAX    (16)   // タウン・シティ数
#define MINIMAP_PTN_MAX     (2)    // １つのタウン・シティが持つ最大ブロック数

// トレーナーアイ
#define TRAINER_EYE_MAX    (REVENGE_DATA_MAX+8+4+1)  // 登録できるトレーナー数（再戦、リーダー、四天王、チャンピオン）
#define OBI_XMAX  (4)
#define OBI_YMAX  (4)

// 性別マークのパレット転送設定
#define TNAVI_MALE_PAL     (PA_BG11)
#define TNAVI_FEMALE_PAL   (PA_BG12)



// メインメニューのコンテンツ管理
#define MAINMENU_CONTENTS_MAX  (5)
enum MAINMENU_CONTENTS {
	MAINMENU_NULL,
	MAINMENU_MAP,
	MAINMENU_CONDITION,
	MAINMENU_TRAINER,
	MAINMENU_RIBBON,
	MAINMENU_END,
};

// ポケモンパラメータ取得タイプ
enum PARAM_TYPE { PARAM_STOCK, PARAM_BOX };

// メニュー画面タイプ
enum MENU_TYPE {
	MENUTYPE_MAIN, MENUTYPE_CONDITION, MENUTYPE_SEARCH, 
};
// メニューオブジェ動作タイプ
enum MENU_MOVE {
	MM_HIDE, MM_DISP, MM_APPEAR, MM_DISAPPEAR
};

// コンディション画面タイプ
enum CONDITIOM_MODE {
	CONDITION_MODE_STOCK, CONDITION_MODE_SEARCH
};

// リストキーリード結果
enum LISTKEY {
	LISTKEY_NOMOVE, LISTKEY_MOVE, LISTKEY_SCROLL,
};
// リストモード
enum LISTMODE {
	LISTMODE_CONDITION, LISTMODE_RIBBON, LISTMODE_TRAINER,
};
// メニュー描画指定
enum COMBG_MENU_TYPE{
	COMMENU_CONDITION_LIST,
	COMMENU_CONDITION_STOCK,
	COMMENU_CONDITION_SEARCH,
	COMMENU_CONDITION_MARKING,
	COMMENU_RIBBON_LIST,
	COMMENU_RIBBON_SELECT,
	COMMENU_RIBBON_VIEW,
	COMMENU_MAP_ZOOM,
	COMMENU_MAP_WHOLE,
	COMMENU_TRAINER_LIST,
	COMMENU_TRAINER_DATA,
	COMMENU_RIBBON_DETAIL,
};
// ラベルタイプ
enum LABEL_TYPE {
	LABEL_MAIN, LABEL_CONDITION, LABEL_RIBBON,
	LABEL_TRAINER, LABEL_MAP, 
	LABEL_SEARCH,LABEL_SEARCH_STOCK,
	LABEL_SEARCH_STYLE, LABEL_SEARCH_BEAUTY, LABEL_SEARCH_CUTE,
	LABEL_SEARCH_CLEVER, LABEL_SEARCH_STRONG,
	LABEL_NO,
};

// リボンタイプ
enum RIBBON_TYPE {
	CHAMP_RIBBON,
	COOL_RIBBON1, COOL_RIBBON2, COOL_RIBBON3, COOL_RIBBON4,
	BEAUTY_RIBBON1, BEAUTY_RIBBON2, BEAUTY_RIBBON3, BEAUTY_RIBBON4,
	CUTE_RIBBON1, CUTE_RIBBON2, CUTE_RIBBON3, CUTE_RIBBON4,
	GENIUS_RIBBON1, GENIUS_RIBBON2, GENIUS_RIBBON3, GENIUS_RIBBON4,
	POWERFUL_RIBBON1, POWERFUL_RIBBON2, POWERFUL_RIBBON3, POWERFUL_RIBBON4,
	WINNING_RIBBON, VICTORY_RIBBON, BROMIDE_RIBBON, GANBA_RIBBON, 
	MARINE_RIBBON, LAND_RIBBON, SKY_RIBBON, COUNTRY_RIBBON, NATIONAL_RIBBON,
	EARTH_RIBBON, WORLD_RIBBON,
};
#define EVENT_RIBBON_BORDER    (MARINE_RIBBON)
#define IS_EVENT_RIBBON(type)  ((type)>=EVENT_RIBBON_BORDER)

// リボン画面キーリード結果
enum RIBBON_KEYREAD {
	RIBBON_KEY_DEFAULT,  // 何もしない
	RIBBON_KEY_CHANGE,   // 表示リボン変更
	RIBBON_KEY_UP,       // ポケモン変更（リスト上へ）
	RIBBON_KEY_DOWN,     // ポケモン変更（リスト下へ）
};


/*====================================================================*/
/*  ワーク領域定義                                                    */
/*====================================================================*/
typedef struct {
	u16  PokePal[TEMOTI_POKEMAX][16*4];  // パレット展開領域（ポワワ用に４体分）

	// サブプロセスと、プロセス内の進捗度
	pFunc sub_proc;
	u16   prog;
	u16   divide_prog;  // 各処理分割用

	// メニュー帯・トレナビアイコンを除いたフェード用bit
	u32   fade_bit;

	// 共通ＢＧスクロール
	s16   combg_vofs;

	// タグ
	s8       tag_cnt;
	u8       tag_prog;
	u8       tag_next;
	u8       tag_effect;
	u16      tag_effect_cnt;
	u16      tag_win_v[6];
	actWork *tag_actor[6][4];
	CellData tag_cell;
	u8       maintag_char[8*4*32*5];  // 5120
	u8       contag_char[8*4*32*3];   // 3072
	u8       schtag_char[8*4*32*6];   // 6144

	// ラベル
	actWork *label_actor[2];
	actWork *sch_label_actor[2];
	u8       mainlabel_Character[8*4*48];   // 1536
	u8       conlabel_Character[8*4*48];    // 1536
	u8       trlabel_Character[8*4*48];     // 1536
	u8       ribonlabel_Character[8*4*48];  // 1536
	u8       maplabel_Character[8*4*96];    // 3072
	u8       schlabel1_Character[8*4*64];   // 2048
	u8       schlabel2_Character[8*4*48];   // 1536

	// アイコン・再戦ランプ
	actWork *icon_actor;
	actWork *revenge_lamp_actor;

	// メニュー背景
	u16 menubg_scroll_cnt;
	u16 menubg_hofs;
	u16 menubg_taskno;
	u16 menubg_draw_map;
	s16 menubg_draw_line;
	u8  menubg_draw_req;

	// 通信中フラグ＆初期化終了フラグ
	u8 init_end;
	u8 comm_flg;

	// メニュー選択
	s8   menu_sel;
	s8   menu_cnt;
	u8   menu_move_type;
	u8   menu_move_cnt;
	u8   menu_fEnable;
	u8   mainmenu_contents[MAINMENU_CONTENTS_MAX];
	u16  menu_move_timer;
	actWork *menu_actor[8];

	// メインメニュー
	s8  mainmenu_sel;
	actWork *mainmenu_actor[MAINMENU_NUM];

	// コンディションメニュー
	s8 conditionmenu_sel;
	actWork *conditionmenu_actor[CONDITIONMENU_NUM];

	// サーチメニュー
	s8 searchmenu_sel;
	actWork *searchmenu_actor[SEARCHMENU_NUM];

	// メニュー切り替え
	u8 change_menu_type;
	u8 change_menu_sel;
	u8 change_menu_prog;
//	u8 change_menu_cnt;
	u8 change_menu_label;

	// ホウエンマップ
	TOWNMAP_WORK  mapwk;
	u16  mapinfo_vofs;
	u16  minimapinfo_timer;
	u8   minimapinfo_xpos;
	u8   minimapinfo_state;
	u8   minimapinfo_enable;
	u8   mapinfo_buf[MAPINFO_MAXLEN+1];


	// コンディション画面
	u8 condition_mode;
	actWork *mark_state_actor;
	MARKING_WORK  markwork;

	// ポケモンウィンドウ
	u16 pokewin_prog;
	s16 pokewin_vofs;
	actWork *poke_actor;

	// サーチリスト画面
	s16 list_cursor_pos;   // カーソル位置（0 origin)
	s16 list_rank;         // 
	s16 list_top;          // 表示されている先頭行
	s16 list_bottom;       // 表示されている終端行
	s16 list_max;          // 表示できる最大行
	s16 list_vofs;
	s16 list_ypos;
	s16 list_scroll_spd;
	s16 list_scroll_height;
	u16 wl_sortno;
	u16 wl_ypos;
	u16 wl_ribonflg;
	u16 wl_count;
	u16 wl_prog;
	u8  list_buf[LIST_BUF_SIZE];
	u8  list_ribbon_flg;
	u8  list_scroll_flg;    // 件数が表示最大を超えているか？
	u8  list_mode;
	u8  list_kirikae_ok;
	actWork *listcursor_actor;
	actWork *listarrow_actor[2];

	// コンディション画面
	u8 sort_ID;
	s16 condition_poke_cnt;
	s16 condition_poke_sel;
	u8  condition_change_prog;
	u8 (*condition_change_func)(void);
	actWork *condition_actor[TEMOTI_POKEMAX+1];

	// キラキラエフェクト
	actWork *kira_actor[KIRA_MAX];

	// ポケモンデータ
	u8   stock_poke_cnt;   // 手持ちポケモン数
	u8   poke_name[3][64]; // ポケモン名、レベル等の文字列データ
	u8   box_name[3][24];  // ボックス名
	u8   poke_fur[3];      // 毛並み
	u8   poke_mark[3];     // マーキング
	u8   pokename_enable[3];

	// ポケモンソート
	POKE_SORT_DATA  sort_data[SORT_POKE_MAX];
	u16  sort_cnt;
	u8  sort_box;
	u8  sort_poke;
	s8  search_ribbon_result;

	// ソート後のポケモン切り替え
	s8 PokeSelNow, PokeSelNext, PokeSelPrev;
	s8 PokeSelBlank;
	s16  condition_blank_poke;

	// コンディションパラメータ
	u8   poke_param[3+1][5];    // レーダーオフ時の値を入れるため、１つ余分に確保
	POS  point[3+1][5];         // 同上
	POS  point_morph[MORPH_STEP][5];
	POS  rador_point[5];

	// レーダーチャート
	u16 rwin_x[RADOR_HEIGHT][2];
	u16 lwin_x[RADOR_HEIGHT][2];
	u16 bottom_cy;
	u16 morph_cnt;
	u8  calc_win_flag;
	u8  laster_init_prog;

	// リボン画面
	actWork *ribbon_actor;
	u16 ribbon_map_work[32*20];

	u8  ribbon_cell_work[RIBBON_CELL_SIZE/2];
	u8  ribbon_cell[RIBBON_CELL_SIZE];

//	u8  ribon_frame[RIBBON_FRAME_Y][RIBBON_FRAME_X];
	u8  ribbon_type[RIBBON_NUM_MAX];
	u8  ribbon_info_buf[2][RIBBON_INFO_MAXLEN+EOM_SIZE];
	u8  ribbon_cnt;
	u8  event_ribbon_cnt;

	u8  ribbon_cursor_x;
	u8  ribbon_cursor_y;
	u8  ribbon_anm_flg;
	u8  ribbon_cell_prog;
	s8  ribbon_change_vector;
	u8  ribbon_change_subprog;
	u8  ribbon_xlimit[RIBBON_FRAME_Y]; // 各行ごとの横移動最大幅

	// ミニマップワーク領域
	u8  minimap_prog;
	u8  minimap_workno;
	u8  minimap_work[MINIMAP_WORK_NUM][MINIMAP_WORK_SIZE];
	u8* minimap_map[MINIMAP_TOWN_MAX][MINIMAP_PTN_MAX];

	// メニューＢＧフェード
	u16 menubg_fade_pos;
	u16 menubg_fade_nextpos;
	s16 menubg_pos_add;
	u16 menubg_fade_pal[MENUBG_FADE_PALMAX];

	// トレーナーアイ
	actWork *trainer_actor;
	actWork *obi_actor[OBI_XMAX];
	TRAINER_EYE_DATA   trainer_data[TRAINER_EYE_MAX];
	const u8* trainer_info[4];
	u8    trainer_winbuf[24];
	u8    trainer_timei_buf[32];
	u16   trainer_count;
	s16   trainer_hofs;
	u16   tr_prog;
	u8    revenge_icon_timer;
	u8    revenge_icon_flg;

	// ＢＧ初期化用進捗
	u16  initbg_prog;

	// ﾌｫﾝﾄ用ﾍﾞｰｽﾊﾟﾚｯﾄ
	u8   font_base_pal;

	// キューブデモ用ワーク
	CUBEDEMO_WORK  CubeDemoWork;

	// ポケモン画像領域
	u8  fUp;
	u16  pokeimg_monsno[3];
	u16  pokeimg_palno;
	u16  pokeimg_cellno;
	u8  *pokeimg_celladr;
	u8 PokeCell[3][0x2000];     // 画像領域
	u8 PokeCellWork[0x800];    // 作業領域

}TNAVI_WORK;

extern TNAVI_WORK * const NaviWork;

/*====================================================================*/
/*  プロトタイプ                                                      */
/*====================================================================*/
/* tnabi_bg.c */
void TNaviBG_ResetProg(void);
void TNaviBG_InitCommon_Begin(void);
u8 TNaviBG_InitCommon(void);
void TNaviBG_MenuWriteCommon(u8 type);
u8 TNaviBG_ScrollUpCommon(void);
u8 TNaviBG_ScrollDownCommon(void);

void TNaviBG_InitMenu_Begin(u8 type);
u8 TNaviBG_InitMenu(u8 type);
void TNaviBG_WriteMenuInfo(u8 type, u8 no);
void TNaviBG_MenuScrollInit(void);
void TNaviBG_MenuScrollQuit(void);

void TNaviBG_MenuBG_Draw(void);
void TNaviBG_MenuBG_RefleshReq(u8 type);
u8 TNaviBG_MenuBG_RefleshWait(void);

u8 TNaviBG_RibonInit(void);
void TNaviBG_WriteRibonInfo(void);

void TNaviBG_InitMapMode_Begin(void);
u8 TNaviBG_InitMapMode(void);
void TNaviBG_MapInfoWrite(void);
void TNaviBG_MapExpUpdate(void);
u8 TNaviBG_MapInfoScroll(u8 mode);

void TNaviBG_ConditionInit_Begin(void);
u8 TNaviBG_ConditionInit(void);
void TNaviBG_RadorOn(u8 on);
void TNaviBG_WriteConditionData(u16 num);
void TNaviBG_ListInit_Begin(u8 mode);
u8 TNaviBG_ListInit(void);
void TNaviBG_ListScrollInit(s16 line);
u8 TNaviBG_ListScrollWait(void);
void TNaviBG_WriteListRank(void);
void  MakePalFadeData(const u16 *from, const u16 *to, u8 step, u8 colors, u16 *dst);

u8 TNaviBG_PokeWinUp(void);
u8 TNaviBG_PokeWinDown(void);

void TNaviBG_EraseTrainerList_Begin(void);
u8   TNaviBG_EraseTrainerList(void);
void TNaviBG_EraseTrainerInfo_Begin(void);
u8   TNaviBG_EraseTrainerInfo(void);
void TNaviBG_ToDataScroll_Init(void);
void TNaviBG_ToListScroll_Init(void);
u8 TNaviBG_TrainerList_Scroll(void);
void TNaviBG_WriteTrainerList_Begin(void);
u8   TNaviBG_WriteTrainerList(void);
void TNaviBG_MinimapInfoTrans(void);
void TNaviBG_PokeSeikakuWrite(void);
void TNaviBG_RibbonMapMake(void);
void TNaviBG_RibbonMapTrans(void);
void TNaviBG_WriteRibbonPokeInfo(void);
void TNaviBG_EraceRibbonPokeInfo(void);
void TNaviBG_UpdateTrainerTimei(u8 sort_no);
void TNaviSub_TrainerChangeInit(s8 vector);
u8 TNaviSub_TrainerChange(void);
void TNaviSub_MakeTrainerStr(u8 *buf, u16 sort_no);
u8 TNaviBG_CubeDemoInit(void);
void TNaviBG_UpdateTrainerName(void);
void TNaviBG_WriteRibbonCount(void);

/* tnavi_obj.c */
void TNaviObj_TagInitBegin(void);
u8   TNaviObj_TagInit(void);
void TNaviObj_AddTagInit_Begin(u8 type);
u8   TNaviObj_AddTagInit(u8 type);
void TNaviObj_AddTagRun(void);
u8 TNaviObj_AddTagWait(void);
void TNaviObj_DelTagInit(void);
u8 TNaviObj_DelTagWait(void);
void TNaviObj_TagEffect(void);
void TNaviObj_TagEffectStop(void);
u8 TNaviObj_MoveTagWait(void);
void TNaviObj_LabelInitBegin(void);
u8 TNaviObj_LabelInit(void);
void TNaviObj_AddLabel_Begin(u8 type);
u8 TNaviObj_AddLabel(u8 type);
void TNaviObj_DelLabel(u8 type);
void TNaviObj_DelLabelNow(u8 type);

void TNaviObj_AddMap(void);
void TNaviObj_DelMap(void);
void TNaviObj_UpdatePokeImg(u8 num);
void TNaviObj_PokeImgDel(void);
void TNaviObj_ListInit(u8 mode);
void TNaviObj_ListDel(void);

void TNaviObj_StockConInit(void);
void TNaviObj_StockConDel(void);

void TNaviObj_SearchConditionInit(void);
void TNaviObj_SearchConditionQuit(void);
void TNaviObj_MarkingInit(void);
void TNaviObj_MarkingQuit(void);

void TNaviObj_RibbonInit_Begin(void);
u8 TNaviObj_RibbonInit(void);
void TNaviObj_RibbonQuit(void);
void TNaviObj_RibbonDisp(void);
u8 TNaviObj_RibbonDispWait(void);
void TNaviObj_RibbonErase(void);
u8 TNaviObj_RibbonEraseWait(void);

void TNaviObj_KiraInit(void);
void TNaviObj_KiraQuit(void);
void TNaviObj_KiraStart(void);
void TNaviObj_KiraStop(void);

void TNaviObj_AddIcon_Begin(void);
u8  TNaviObj_AddIcon(void);

void TNaviObj_AddLamp(void);
void TNaviObj_DelLamp(void);
void TNaviObj_ArrowUpdate(void);
void TNaviObj_UpdateTrainerImg(u8 work_no);
void TNaviObj_TrainerImgDel(void);

void TNaviObj_RibbonCellMake_Begin(void);
u8 TNaviObj_RibbonCellMake(void);
void TNaviObj_ListObjBanish(u8 flg);

void MakeTEyeObj(u8 *str);
void DelTEyeObj(void);
void TEyeObjStrChange(u8 *str);


/* tnavi_sub.c */
u32 TNaviSub_PokeParaGet(u16 box, u16 poke, int id, u8 *buf);
void TNaviSub_ConditionInitStock(void);
void TNaviSub_ConditionInitSort(void);
void TNaviSub_ConditionInInit(void);
u8 TNaviSub_ConditionIn(void);
void TNaviSub_ConditionOutInit(void);
u8 TNaviSub_ConditionOut(void);
void TNaviSub_ConditionChangeInit(u8 fUp);
void TNaviSub_CalcRador(void);
u8 TNaviSub_ConditionChange(void);
void TNaviSub_ConditionSortInit(void);
u8 TNaviSub_ConditionSort(void);
u8* TNaviSub_CopyPokeDatStr(u8 *buf, u16 sort_no, u8 ribon_flg);
u8 TNaviSub_ListKeyRead(void);
void TNaviSub_ListRecover(void);
void TNaviSub_PokeMarkSet(u16 box, u16 poke, u8 mark);
void TNaviSub_RibbonSortInit(void);
u8 TNaviSub_RibbonSort(void);
void TNaviSub_RibbonDataInit(void);
u8 TNaviSub_RibonKeyRead(void);
u8* TNaviSub_CopyRankStr(u8 *buf, u16 rank);
u8* TNaviSub_CopyPosStr(u8 *buf, u16 pos);
void TNaviSub_LadorLasterInitBegin(void);
u8 TNaviSub_LadorLasterInitMain(void);
void TNaviSub_LadorLasterQuit(void);
void TNaviSub_ParamToPos(u8 *param, POS *pos);
void TNaviSub_SetRadorPoint(POS *point);
void TNaviSub_InitMorph(POS *begin, POS *end);
u8 TNaviSub_ProgMorph(void);
void TNaviSub_TrainerDataInit(void);
void TNaviSub_TrainerListInit(void);
u8 TNaviSub_TrainerImgIn(void);
u8 TNaviSub_TrainerImgOut(void);
void TNaviBG_WriteTrainerInfo_Begin(void);
u8 TNaviBG_WriteTrainerInfo(void);
void TNaviSub_RevengeIconEff_Init(void);
void TNaviSub_RevengeIconEff(void);
void TNaviSub_RevengeIconEff_Quit(void);
void TNaviSub_RevengeIconEff_Mode(u8 mode);
void TNaviSub_UpdateFurLv(u8 no);
void CubeDemo_CalcRador(u8 up);
void TNaviSub_RibbonPokeCheckInit(void);
u8 TNaviSub_RibbonPokeCheck(void);
void TNaviSub_RibbonPokeChangeInit(s8 vector);
u8 TNaviSub_RibbonPokeChange(void);
void TNaviSub_DecordTrainerCell(u8 work_no);

/* map_inst.h */
const u8* GetAreaInstitution(u8 mapno, u8 subno, u8 num);

#endif /* #ifndef _TNAVI_COM_H_ */

