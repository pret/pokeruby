/***********************************************************************
**	簡易会話（内部ヘッダ）
**
**	Masao Taya
**
***********************************************************************/
#ifndef _KAIWA_COM_H_
#define _KAIWA_COM_H_

/*====================================================================*/
/*	インクルード                                                      */
/*====================================================================*/
#include "common.h"
#include "intr.h"
#include "actanm.h"
#include "actor.h"
#include "palanm.h"
#include "menu.h"
#include "boxsub.h"
#include "calctool.h"
#include "namein.h"  // 名前入力と同じカーソル画像を使うため
#include "kaiwa.h"
#include "kaiwa_bg.h"
#include "kaiwa_code.h"

/*====================================================================*/
/*	定数                                                              */
/*====================================================================*/
#define KAIWA_CODE_MAX     (9)     // コード数の最大値
#define KAIWA_LINE_MAX     (3)     // コード入力欄の最大行数
#define KAIWA_ROW_MAX      (3)     // コード入力欄の最大列数
#define KAIWA_STR_MAX      (8)     // 単語の最大文字数
#define KAIWA_MSGLEN_MAX   (22)    // 表示メッセージの最大文字数（１行あたり）
#define KAIWA_CATEGORYLEN_MAX  (6) // カテゴリ名の最大文字数
#define KAIWA_CATEGORYBUF_SIZE ((KAIWA_CATEGORYLEN_MAX+1)*3)

#define KAIWA_GROUP_COL_MAX  (8)  // カテゴリウィンドウの最大行数

#define KAIWA_WORDLEN_MAX      (7)
#define KAIWA_WORDSPACE_LEN    (2)
#define KAIWA_WORDAREA_LEN     (KAIWA_WORDLEN_MAX+KAIWA_WORDSPACE_LEN)

#define KAIWA_WORDWIN_ROW      (3)
#define KAIWA_WORDLINEBUF_SIZE ((KAIWA_WORDAREA_LEN)*KAIWA_WORDWIN_ROW)
#define KAIWA_WORDWIN_COL_MAX   (86)
#define KAIWA_WORDWIN_COL       (4)
#define KAIWA_WORD_X  (1)
#define KAIWA_WORD_Y  (11)

#define KAIWA_WORDCURSOR_XORG  (20)
#define KAIWA_WORDCURSOR_YORG  (96)

#define KAIWA_WINGRAD_STEP  (9)   // ウィンドウグラデーションの段階数
#define KAIWA_WINGRAD_CNT   (3)   // グラデーションさせる色数

#define KAIWA_INITIAL_CNT  (45)  // あいうえおモードのグループ数
#define KAIWA_INITIAL_WORD_MAX  (120) // あいうえおモードの最大単語数

#define KAIWA_WORDLINE_BUFSIZE   (64)

/*============================================*/
/*	画面レイアウトタイプ                      */
/*============================================*/
enum KAIWA_LAYOUT_TYPE {
	KAIWA_LAYOUT_3x2,
	KAIWA_LAYOUT_3x3,
	KAIWA_LAYOUT_1x1,
	KAIWA_LAYOUT_2x1,
	KAIWA_LAYOUT_2x2,
	KAIWA_LAYOUT_2x2B,  // 2x2 ｲﾝﾀﾋﾞｭｱｰ表示ﾓｰﾄﾞ
};

/*============================================*/
/*	画面レイアウト                            */
/*============================================*/
#define KAIWA_MSGWIN_X1  (3)
#define KAIWA_MSGWIN_Y1  (14)
#define KAIWA_MSGWIN_X2  (26)
#define KAIWA_MSGWIN_Y2  (19)
#define KAIWA_MSG_X  (KAIWA_MSGWIN_X1 + 1)
#define KAIWA_MSG_Y  (KAIWA_MSGWIN_Y1 + 1)

#define KAIWA_COMMENU_X      (1)
#define KAIWA_COMMENU_Y      (9)
#define KAIWA_COMMENU_WIDTH  (28)
#define KAIWA_COMMENU_HEIGHT (4)

#define KAIWA_YESNO_X    (23)
#define KAIWA_YESNO_Y    (8)

#define KAIWA_2x2FRAME_X       (5)
#define KAIWA_2x2FRAME_Y       (3)
#define KAIWA_2x2FRAME_WIDTH   (20)
#define KAIWA_2x2FRAME_HEIGHT  (6)

#define KAIWA_2x2B_FRAME_X       (9)
#define KAIWA_2x2B_FRAME_Y       (3)
#define KAIWA_2x2B_FRAME_WIDTH   (20)
#define KAIWA_2x2B_FRAME_HEIGHT  (6)

#define KAIWA_3x2FRAME_X       (0)
#define KAIWA_3x2FRAME_Y       (3)
#define KAIWA_3x2FRAME_WIDTH   (30)
#define KAIWA_3x2FRAME_HEIGHT  (6)

#define KAIWA_3x3FRAME_X       (0)
#define KAIWA_3x3FRAME_Y       (1)
#define KAIWA_3x3FRAME_WIDTH   (30)
#define KAIWA_3x3FRAME_HEIGHT  (8)

#define KAIWA_1x1FRAME_X       (15)
#define KAIWA_1x1FRAME_Y       (3)
#define KAIWA_1x1FRAME_WIDTH   (11)
#define KAIWA_1x1FRAME_HEIGHT  (4)

#define KAIWA_2x1FRAME_X       (5)
#define KAIWA_2x1FRAME_Y       (2)
#define KAIWA_2x1FRAME_WIDTH   (20)
#define KAIWA_2x1FRAME_HEIGHT  (4)

#define KAIWA_CATEGORY_X   (2)
#define KAIWA_CATEGORY_Y   (11)

#define KAIWA_CATEGORYWIN_X      (1)
#define KAIWA_CATEGORYWIN_Y      (10)
#define KAIWA_CATEGORYWIN_WIDTH  (22)
#define KAIWA_CATEGORYWIN_HEIGHT (10)

/*============================================*/
/*	表示メッセージタイプ                      */
/*============================================*/
enum KAIWA_MSG {
	KAIWA_MSG_INFO,
	KAIWA_MSG_KAKUNIN,
	KAIWA_MSG_ERASE,
	KAIWA_MSG_YAMERU,
	KAIWA_MSG_YAMERU_WARN,
	KAIWA_MSG_KETTEI_WARN,
	KAIWA_MSG_ERASE_WARN,
	KAIWA_MSG_1WORD,
	KAIWA_MSG_POP_WARN,
	KAIWA_MSG_POP_BLANK_WARN,

	KAIWA_MSG_HIDE,
};
/*============================================*/
/*	単語選択モード                            */
/*============================================*/
enum KAIWA_SELECT_MODE {
	KAIWA_SEL_CATEGORY, KAIWA_SEL_CHAR,
};
/*============================================*/
/*	矩形カーソル動作モード                    */
/*============================================*/
enum KAIWA_SQUARE_MODE {
	SQUARE_MODE_CATEGORY,// ７文字
	SQUARE_MODE_MENU,    // ４文字
	SQUARE_MODE_3CHAR,   // ３文字
	SQUARE_MODE_1CHAR,   // １文字
};
/*============================================*/
/*	スクロール矢印動作モード                  */
/*============================================*/
enum KAIWA_ARROW_MODE {
	ARROW_MODE_GROUP,  // グループ選択時
	ARROW_MODE_WORD,   // 単語選択時
};
/*============================================*/
/*	カーソル動作設定                          */
/*============================================*/
enum KAIWA_CURSOR {
	KAIWA_CURSOR_MOVE,
	KAIWA_CURSOR_STOP,
	KAIWA_CURSOR_BANISH,
};


/*====================================================================*/
/*	ワーク領域                                                        */
/*====================================================================*/
typedef struct {
	pFunc ret_func;    // 呼び出し元画面への復帰関数
	u16*  code_addr;   // 会話コード格納アドレス
	u8    mode;        // 入力モード
	u8    layout;       // 画面レイアウトタイプ
	u8    code_size;    // 会話コードサイズ
	u8    interviewer;  // インタビュアータイプ
	u16   code_work[KAIWA_CODE_MAX];  // 編集中コード

	pFunc sub;         // サブプロセス
	u16  prog;         // シークエンスの進捗

	u8   select_mode;  // 単語選択モード（カテゴリ or あいうえお）
	u8   edit_word_no; // 編集中の単語番号
	u16 enable_category_cnt;  // 有効カテゴリ数

	u8  category_tbl[KAIWA_GROUP_COL_MAX][3];
	u8  charcode_tbl[4][14];

	// 隠しカテゴリ出現フラグ
	u8  hidden_category_flg[KWC_HIDDEN_CNT];

	// ７文字制限
	u8   limit7_flg;   // ７文字制限あり／なし
	u8   limitword_cnt[KAIWA_LINE_MAX];

	// カーソル動作
	s8  cursor_xlimit, cursor_ylimit;
	s8  cursor_xpos, cursor_ypos;
	u8  cursorpos_update;
	u16 cursor_xorg, cursor_yorg;
	u8 cursor_xofs[KAIWA_LINE_MAX][KAIWA_ROW_MAX];

	// 矩形カーソル動作
	u8  squarepos_update;

	// アクター
	actWork *cursor_actor;
	actWork *squareL_actor;
	actWork *squareR_actor;
	actWork *wordcursor_actor;
	actWork *arrow_actor[2];
	actWork *pagechange_actor[2];

	// ウィンドウ描画
	u8  trans_rect_flag;
	u16 draw_win_prog, draw_win_cnt;
	u16 draw_win_rectcnt, draw_win_roopcnt;
	TRECT    trect[8];
	SRC_ORG  src_org[8];

	// グループ選択ウィンドウ
	s8  group_col, group_row;                // 現在行，列
	s8  group_max_row[KAIWA_GROUP_COL_MAX];  // 最大列
	s8  group_base_col;                      // 表示基準行
	s8  category_max_col;                    // カテゴリモード時の最大行
	s8  group_selmenu_flg;                   // メニュー選択フラグ
	u8  select_group_num;                    // 選択したグループ番号
	u8 wordcursor_update;

	// スクロール処理
	u16 scroll_vofs, scroll_end_vofs;
	u8  scroll_speed;
	s8  scroll_add;
	s8  scroll_height;
	pFunc scroll_ret_func;

	// マップデータ展開領域
	u16 frame_bg_Map[30*20];  // 1200 bytes
	u16 frame_2x2_Map[20*6];  //  240 bytes
	u16 frame_3x2_Map[30*6];  //  360 bytes
	u16 frame_3x3_Map[30*8];  //  480 bytes
	u16 frame_2x1_Map[20*4];  //  160 bytes
	u16 frame_1x1_Map[11*4];  //   88 bytes
	u16 frame_selwin_Map[30*10];  // 600 bytes
	u16 frame_selwinsub_Map[6*8]; //  96 bytes
	u32 checksum;

	// あいうえおソート
	u16 charsort_work[KWC_MAX];
	u16 charsort_tbl[KAIWA_INITIAL_CNT][KAIWA_INITIAL_WORD_MAX];
	u16 initial_word_cnt[KAIWA_INITIAL_CNT];
	u16 category_word_cnt[KWC_MAX];
	const u8 *word_tbl[KWC_MAX][256];

	// 単語選択ウィンドウ
	s8 word_col, word_row;
	s8 word_max_row[KAIWA_WORDWIN_COL_MAX];
	s8 word_max_col;
	s8 word_base_col;
	u16  word_code_tbl[KAIWA_WORDWIN_COL_MAX][KAIWA_WORDWIN_ROW];

	// ウィンドウグラデーション
	u8  grad_step;
	u16 grad_tbl[KAIWA_WINGRAD_CNT][KAIWA_WINGRAD_STEP];

	// スクロール矢印
	s8 *arrow_base_col;
	u8 arrow_disp;
	s8 arrow_max_col;

	// モード標識
	actWork *mode_actor;

	// ｽｸﾛｰﾙ領域全消去用
	u16  clear_line_prog;
	u16  clear_line_timer;

	// 流行語入力領域
	u16 pop_word[2];

	// メッセージ領域
	u8  info_msg1[KAIWA_MSGLEN_MAX + 1];
	u8  info_msg2[KAIWA_MSGLEN_MAX + 1];
	u8  kakunin_msg1[KAIWA_MSGLEN_MAX + 1];
	u8  kakunin_msg2[KAIWA_MSGLEN_MAX + 1];
	u8  spc_msg[KAIWA_MSGLEN_MAX + 1];

	u8  category_str[KAIWA_CATEGORYBUF_SIZE + 1];
	u8  word_buf[KAIWA_WORDAREA_LEN + 1];
	u8  word_buf2[KAIWA_WORDAREA_LEN + 1];  // 比較用

	u8  wordline_buf[KAIWA_WORDLINE_BUFSIZE];  // １行用
	u8  wordline_buf2[KAIWA_WORDLINE_BUFSIZE];  // １行用

	u8  spaceword_buf[32];
	u8  caption_buf[48];

}KAIWA_WORK;

extern KAIWA_WORK * const KaiwaWork;

/*====================================================================*/
/*	プロトタイプ                                                      */
/*====================================================================*/
// kaiwa_obj.c
void KaiwaObjInit(void);
void KaiwaCursorMove(u8 flg);
void KaiwaSquareAdd(void);
void KaiwaSquareDel(void);
void KaiwaSquareModeChange(void);
void KaiwaWordCursorDisp(u8 flg);
void KaiwaWordCursorMove(u8 flg);
void KaiwaArrowHide(void);
void KaiwaArrowModeChange(u8 mode);
void KaiwaObjInterviewerAdd(u8 type, u8 layout);
void KaiwaModeFlagInit(void);
void KaiwaModeFlagChange(void);
void KaiwaModeFlagAppear(u8 appear);

// kaiwa_bg.c
void KaiwaBGInit(void);
void KaiwaScrollBGParamInit(void);
void KaiwaScrollInit(u8 speed);
void DrawKaiwaComMenu(void);
void DrawKaiwaMsg(u8 type);
void DrawKaiwaGroupName(void);
void ReDrawKaiwaGroupName(void);
void KaiwaDrawWinIni(void);
void DrawKaiwaCategoryName(void);
u8 KaiwaScroll(void);
u8 KaiwaWin_GroupDraw(void);
u8 KaiwaWin_GroupErase(void);
u8 MinimizeKaiwaGroupWin(void);
u8 MaxmizeKaiwaGroupWin(void);
u8 KaiwaWin_GroupToWord(void);
u8 KaiwaWin_WordToGroup(void);
u8 KaiwaWin_WordErase(void);
void ClearKaiwaScrollBG(void);
void DrawKaiwaWordAll(void);
void DrawKaiwaWordScroll(void);
void RectTransMain(void);
void KaiwaBG_DrawCaption(u8 mode);
void WriteEditArea(void);
void WriteEditAreaKakunin(void);
void EraseEditArea(void);

// kaiwa_dat.c
void KaiwaInitWordSort(void);
void KaiwaInitWordPointerTbl(void);
void KaiwaInitWordWindowData(void);
u8* KaiwaCopyCategoryName(u8 *dst, u8 category, u16 spc_len);
u8 * KaiwaCodeToWord(u8 *dst, u16 code, u16 space_len);
u16 KaiwaCodeLen(u16 code);
u8 KaiwaPoke2CategoryCheck(void);
u8 KaiwaIsEnableCategory(u8 category);

#endif /* #ifndef _KAIWA_COM_H_ */

