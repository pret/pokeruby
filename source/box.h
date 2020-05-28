/***********************************************************************
**	ボックス画面共通定数
***********************************************************************/
#ifndef  _BOX_H_
#define  _BOX_H_


#include "pokeicon.h"
#include "print.h"
#include "menutool.h"
#include "pasocom.h"
#include "boxef.h"
#include "boxsel.h"

/*====================================================================*/
/* ボックス初期化                                                     */
/*====================================================================*/
u8 InitBoxCallMenu(void);
void InitBoxTureteiku(void);
void InitBoxAzukeru(void);
void InitBoxSeiri(void);

// デバッグメニューからの呼び出し用
u8 InitBoxTureteiku_debug(void);
u8 InitBoxAzukeru_debug(void);
u8 InitBoxSeiri_debug(void);

//----------------------------------------------------------
//	ワーク構造体
//----------------------------------------------------------
typedef struct {
	u8   buf[256];
	u8   label_buf[512];
	u16  wp_cnt;

	u8 eva, evb, bldy;
	s8 select_menu;
	u8 comeback_flg;        // 他画面からの復帰かどうか？
	u8 boxmode;             //

// マーキング関連
	u16 mark_map_buf[8];
	u16 mark_win_map_buf[8];
	s8  mark_cursor, mark_cursor_before;
	u8  mark_bit, mark_bit_before;

	// 2001/09/28 ～

// box.c ---------------------------------------------------------------
	u8 ProgNo;              //  1 bytes  各プロセスの進捗状況
	MENU_ITEM  BoxMenu[5];  // 40 bytes  メニューアイテム用バッファ
	u8 MsgPokeName[11];     // 11 bytes  メッセージ表示に使うポケモン名バッファ
	u8 CatchSelectNo;       //  1 bytes  ポケモンを掴んだ時の選択番号

	u8 MineOn;              //  1 bytes  手持ち表示オン／オフ指定
	u8 MineCnt;             //  1 bytes  手持ち表示ウェイトカウント
	u8 MineDispEnd;         //  1 bytes  手持ち表示処理終了フラグ

	u8 BoxBGTransPos;       //  1 bytes  ボックス壁紙転送領域（0 or 1）

	u8 kabegami_thema;
	// total = 57 bytes

	SCAN_WORK scan_work;

// boxobj.c ------------------------------------------------------------
	actWork *ButtonActor[2];      //  8 bytes  切り替えボタンアクター
	actWork *WaveActor[2];        //  8 bytes  波形アクター
	actWork *CloseButtonActor[3]; // 12 bytes  閉じるボタンアクター
	actWork *StatusPokeActor;     //  4 bytes  ステータスポケモンアクター
	actWork *ShadowActor;         //  4 bytes  カーソル影アクター
	actWork *BoxNameActor[2];     //  8 bytes  ボックス名アクター
	actWork *NextBoxNameActor[2]; //  8 bytes  スクロール後ボックス名アクター

	u16 StatusPoke_PalID;         //  2 bytes  ステータスポケモンパレットＩＤ
	u16 StatusPoke_BeforeNo;      //  2 bytes  ステータスポケモン前回表示モンスター

	// カーソル移動処理
	u8 ModeChangeReserve;         //  1 bytes  カーソル動作モード変更予約フラグ
	u8 ReserveMode;               //  1 bytes  予約カーソル動作モード
	u8 ReserveSel;                //  1 bytes  予約カーソル選択番号
	s32 CursorAx,CursorAy,CursorPx,CursorPy;  // 16 bytes  カーソル位置＆速度
	u8 FrameMenuNo;               //  1 bytes  フレーム上での位置
	u8 CursorMoving;              //  1 bytes  カーソル移動中フラグ
	u8 CursorNextNo;              //  1 bytes  カーソル移動先ナンバー
	u8 CursorNextMode;            //  1 bytes  カーソル移動後のモード

	u8 *BoxNameCGXAddr;           //  4 bytes ボックス名アクターのＣＧＸアドレス
	u8 *NextBoxNameCGXAddr;       //  4 bytes スクロール後ボックス名アクターのＣＧＸアドレス
	u16 BoxNamePalNo;             //  2 bytes ボックス名アクター用パレットナンバー
	u16 NextBoxNamePalNo;         //  2 bytes スクロール後ボックス名アクターパレットナンバー
	u32 BoxNamePalMask;           //  4 bytes ボックス名パレットアニメ用マスク
	u32 NextBoxNamePalMask;       //  4 bytes スクロール後ボックス名パレットアニメ用マスク

	// total = 67 bytes

// boxsel.c ------------------------------------------------------------
	BOXSEL_WORK  SelWork;
#if 0
	actWork *SelActor;            //  4 bytes  選択ボックス本体アクター
	actWork *SelSideActor[4];     // 16 bytes  選択ボックスふちアクター
	actWork *SelTabActor[3];      // 12 bytes  選択ボックスタブアクター
	u8 SelBoxNo;                  //  1 bytes  現在の選択ボックスナンバー
	s8 BoxPmCnt;                  //  1 bytes  選択ボックスにいるポケモン数
#endif
	// total = 34 bytes

// boxicon.c -----------------------------------------------------------
	actWork *MineIcon[6];          //  24 bytes  手持ちアイコンアクター
	actWork *BoxIcon[BOX_PM_KAZU]; // 120 bytes  ボックスアイコンアクター
	u8 CellID_Cnt[410];            // 410 bytes  同種アイコン登録カウンタ

	// アイコン＆ボックス画像スクロール処理
	s8 ScrollSpeed;       // 1 bytes  スクロール方向
	u8 ScrollTargetBox;   // 1 bytes  スクロール先ボックスナンバー
	u8 ScrollIconLines;   // 1 bytes  スクロール時アイコン消去ライン数
	u8 ScrollWait;        // 1 bytes  スクロール時ウェイトタイマー
	u8 ScrollEnd;         // 1 bytes  スクロール終了フラグ
	u16 ScrollCnt;        // 2 bytes  スクロールドット数カウンタ

	// total = 561 bytes

	// ステータスポケモン画像用領域（構造体終端に置くこと＆偶数アドレスから開始すること）
	u16 dmy;
	u8 PokeCellWork[0x800]; // ポケモンセル画像展開用領域
	u8 PokeCell[0x800*7];     // ポケモンセル画像用領域

}BOX_WORK;

extern BOX_WORK* const BoxWork;

//----------------------------------------------------------
//	定数
//----------------------------------------------------------
#define NON_POKE          (0)   // 無効ポケモンナンバー
#define BOX_SCROLL_SPEED  (4)   // ボックススクロール速度
#define BOX_SCROLL_WIDTH  (168)  // ボックススクロール幅

// セルＩＤ＆パレットＩＤ
enum BOX_CELL_ID {
	CELLID_STATUS_POKE = 0,
	CELLID_BOXCURSOR,
	CELLID_BUTTON,
	CELLID_CLOSEBUTTON,
	CELLID_WAVE,
	CELLID_SHADOW,
	CELLID_BOXSEL,
	CELLID_BOXSELSIDE,
	CELLID_BOXSELTAB,
	CELLID_BOXNAME,
	CELLID_NEXTBOXNAME,
	CELLID_SCANLINE,

	CELLID_ICON_MIN,  // アイコンに使用するセルナンバーの最低値
};
enum BOX_PAL_ID {
	PALID_BOXCURSOR =  (PALID_POKEICON_5 + 1),
	PALID_BOXSEL,
	PALID_BOXNAME,
	PALID_NEXTBOXNAME,
	PALID_SCANLINE,
};
// カーソル動作モード
enum CURSOR_MODE {
	CURSORMODE_MINE,
	CURSORMODE_BOX,
	CURSORMODE_FRAME,
	CURSORMODE_BOXSEL,
};
// カーソルアクションパターン
enum CURSOR_ACTION {
	CURSORACTION_CATCH,
	CURSORACTION_RELEASE,
	CURSORACTION_SWAP,
};
// ボタンアクションパターン
enum BUTTON_ACTION {
	BUTTONACTION_WAIT,
	BUTTONACTION_NORMAL,
	BUTTONACTION_SCROLL_L,
	BUTTONACTION_SCROLL_R,
};

/*===============================================*/
/* ＳＥ                                          */
/*===============================================*/
#define BOXSE_CURSOR_MOVE  (SE_SELECT)
#define BOXSE_WIN_OPEN     (SE_WIN_OPEN)
#define BOXSE_PC_ON        (SE_PC_LOGIN)
#define BOXSE_PC_OFF       (SE_PC_OFF)
#define BOXSE_TRAY_CHANGE  (SE_SELECT)
#define BOXSE_WARN         (SE_WALL_HIT)
//#define BOXSE_CHATCH       (
//#define BOXSE_RELEASE      (
//#define BOXSE_SWAP         (

/*===============================================*/
/* プライオリティ                                */
/*===============================================*/
#define  STATUS_POKE_PRI    (0)
#define  STATUS_POKE_ACTPRI (0)

#define  BOXSEL_PRI            (1)
#define  BOXSEL_ACTPRI         (3)
#define  BOXSEL_TAB_ACTPRI     (BOXSEL_ACTPRI+1)
#define  BOXSEL_SIDETAB_ACTPRI (BOXSEL_TAB_ACTPRI+1)

#define  CURSOR_PRI         (1)
#define  CURSOR_ACTPRI      (1)
#define  CATCHICON_PRI      (1)
#define  CATCHICON_ACTPRI   (2)

#define  MINEICON_PRI       (1)
#define  MINEICON_ACTPRI    (BOXSEL_SIDETAB_ACTPRI+1)
#define  MINESHADOW_ACTPRI  (MINEICON_ACTPRI+1)
#define  BOXICON_PRI        (2)
#define  BOXICON_ACTPRI     (MINESHADOW_ACTPRI+1)
#define  BOXSHADOW_ACTPRI   (BOXICON_ACTPRI+YOKO_KAZU+1)

#define  BOX_CHANGE_BUTTON_PRI     (2)
#define  BOX_CHANGE_BUTTON_ACTPRI  (BOXSHADOW_ACTPRI+1)

#define  CLOSEBUTTON_PRI       (3)
#define  CLOSEBUTTON_ACTPRI    (BOX_CHANGE_BUTTON_ACTPRI+1)

#define  BOXNAME_PRI     (2)
#define  BOXNAME_ACTPRI  (CLOSEBUTTON_ACTPRI)

/*===============================================*/
/* レイアウト                                    */
/*===============================================*/
// アイコン
#define  ICON_HEIGHT (24)
#define  ICON_WIDTH  (24)

#define  MINE_ICON_XPOS      (148)   // 手持ちポケモンの１番アイコンを表示するＸ座標
#define  MINE_ICON_YPOS      (26)    // 手持ちポケモンの１番アイコンを表示するＹ座標
#define  MINE_TOP_ICON_XPOS  (102)   // 手持ちポケモンの０番アイコンを表示するＸ座標
#define  MINE_TOP_ICON_YPOS  (MINE_ICON_YPOS + 24*2)   // 手持ちポケモンの０番アイコンを表示するＹ座標
#define  BOX_ICON_XPOS       (100)   // ボックスの先頭（左上）アイコンＸ座標
#define  BOX_ICON_YPOS       (44)    // ボックスの先頭（左上）アイコンＹ座標

// メニューウィンドウ
#define  BOX_MENU_X1      (20)   // ウィンドウ作製時の x1 値
#define  BOX_MENU_WIDTH   (6)    // メニューの最大文字数
#define  BOX_MENU_X2      (BOX_MENU_X1+BOX_MENU_WIDTH+3) // ウィンドウ作製時の x2 値
#define  BOX_MENU_Y2      (15)   // メニューウィンドウ作製時の y2 値

// メッセージウィンドウ
#define  BOX_MSGWND_X1    (10)
#define  BOX_MSGWND_X2    (29)
#define  BOX_MSGWND_Y1    (16)
#define  BOX_MSGWND_Y2    (19)
#define  BOX_MSG_X        (BOX_MSGWND_X1+1)
#define  BOX_MSG_Y        (BOX_MSGWND_Y1+1)

// フレームオブジェ
#define  BOX_FRAMEOBJ_XPOS   (92)   // 左へ切り替えボタンＸ座標
#define  BOX_FRAMEOBJ_YPOS   (26)   // 左へ切り替えボタンＹ座標
#define  FRAMEOBJ_INTERVAL   (70)


// ステータスウィンドウ
#define STATUS_POKE_X   (40) // 左の等倍ポケ表示するX座標
#define STATUS_POKE_Y   (48) //左の等倍ポケ表示するY座標
#define BOX_WAVE_XPOS   (8)
#define BOX_WAVE_DIFFX  (64)
#define BOX_WAVE_YPOS   (8)

// カーソル
#define CURSOR_ICON_DIFF_X        (-8)   // カーソルとアイコンのＸ座標差
#define CURSOR_ICON_DIFF_Y        (-24)  // カーソルとアイコンのＹ座標差
#define CURSOR_CATCH_DOWN_HEIGHT  (8)    // つかまえる時に移動する高さ
#define CURSOR_SHADOW_DIFF_X      (8)    // カーソルと影のＸ座標差
#define CURSOR_SHADOW_DIFF_Y      (32)   // カーソルと影のＹ座標差

// とじるボタン
#define CLOSEBUTTON_Y      (8)
#define CLOSEBUTTON_CX     (200)
#define CLOSEBUTTON_X      (CLOSEBUTTON_CX-24)

// ボックス名
#define  BOXNAMELABEL_X    (136)
#define  BOXNAMELABEL_Y    (28)

#endif /* #ifndef _BOX_H_ */
