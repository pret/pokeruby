/***********************************************************************
**	簡易会話（メイン）
**
**	Masao Taya
**
***********************************************************************/
#define  KAIWA_MAIN
#include "kaiwa_com.h"

#include "ev_flag.h"
#include "script.h"
#include "sysflag.h"
#include "task.h"
#include "fld_main.h"
#include "oyaji.h"
#include "tv_def.h"
#include "popword.h"
#include "mus_tool.h"
#include "message.h"

/***********************************************************************
**	定数
***********************************************************************/
#define KAIWA_SCROLL_SPEED_DEFAULT  (2)
#define KAIWA_SCROLL_SPEED_FAST     (4)

// ふしぎなできごと　キーワード
static const u16 FUSHIGI_KEYWORD[] = {
0x143a,    // ふしぎ
0x1817,    // できごと
0x2023,    // わくわく
0x200f,    // ドキドキ
};

// そだて名人の「いいことば」キーワード
#define NICEWORD_MAX  (5)
static const u16 NICEWORD_KEYWORD[NICEWORD_MAX][2] = {
	{ 0x1421, 0x0618 },   // すごい, しょうぶ
	{ 0x061f, 0x2204 },   // チャレンジ, コンテスト
	{ 0x1422, 0x0197 },   // すごすぎ, ラティアス
	{ 0x0415, 0x0198 },   // かっこいい，ラティオス
	{ 0x281e, 0x2818 },   // モーレツ, ハッスル
};


/***********************************************************************
**	グローバル変数
***********************************************************************/
KAIWA_WORK * const KaiwaWork = (KAIWA_WORK*)(&(UserWork[0x1000]));
extern u8 CategoryWordCntTbl[];
extern u8	(*MenuFunc)();

/***********************************************************************
**	プロトタイプ
***********************************************************************/
static void KaiwaInit(void);
static void KaiwaMain(void);
static void KaiwaVBlankIntr(void);
static void change_sub(pFunc sub);
static void clear_code_work(void);
static u8 get_square_pos(void);
static u8 get_wordcursor_pos(void);
static void adjust_square_row(void);
static void calc_select_group_num(void);
static u8 set_dicide_word(void);
static void save_code(void);
static void update_limit_flg(void);
static void init_codework(void);
static void set_code(u16 num, u16 code);
static u8 count_changed_word(void);
static void adjust_wordcursor_row(void);
static void set_popword_buffer(void);
static void menu_clear(void);
static void draw_caption(void);
static u8 check_fushigi(void);
static u8 check_niceword(void);
static u8 check_all_blank(void);

// サブプロセス ---------------------
static void sub_kaiwa_in(void);
static void sub_kaiwa_mainmenu(void);
static void sub_init_mainmenu(void);
static void sub_erase(void);
static void sub_yameru(void);
static void sub_kettei(void);
static void sub_sel_group_ini(void);
static void sub_sel_group_main(void);
static void sub_groupmode_change(void);
static void sub_return_mainmenu(void);
static void sub_group_to_word(void);
static void sub_sel_word(void);
static void sub_word_decide(void);
static void sub_word_to_group(void);
static void sub_scroll(void);
static void sub_fadeout(void);


/***********************************************************************
**	スクリプトからの呼び出し
***********************************************************************/
void KaiwaInput(void)
{
	u16 *addr;
	u8  interviewer = KAIWA_INTERVIEWER_NOTHING;

	switch(ScriptParameter0){
	case KAIWA_MODE_SELF: addr = Fld.kaiwa_self; break;
	case KAIWA_MODE_BATTLE_START: addr = Fld.kaiwa_battle; break;
	case KAIWA_MODE_BATTLE_WON: addr = Fld.kaiwa_win; break;
	case KAIWA_MODE_BATTLE_LOST: addr = Fld.kaiwa_lose; break;

	case KAIWA_MODE_MAIL:
		addr = Fld.MailData[ScriptParameter1].msg;
		break;

	case KAIWA_MODE_SONG:
	{
		OYAJIDATA_SINGER *data = (OYAJIDATA_SINGER*)(Fld.oyaji_work);
		u16 i;
		for(i = 0; i < SONG_WORD_MAX; i++){
			data->new_word[i] = data->word[i];
		}
		addr = data->new_word;
		break;
	}

	case KAIWA_MODE_HAGAKI:
		addr = ((TV_Letter_Work*)(&(Fld.tv_event[ScriptParameter1])))->easytalk;
//		interviewer = KAIWA_INTERVIEWER_MAN;
		interviewer = ScriptParameter2;
		break;

	case KAIWA_MODE_INTERVIEW:
		addr = &(((TV_Club_Work*)(&(Fld.tv_event[ScriptParameter1])))->easytalk_no[ScriptParameter2]);
		interviewer = KAIWA_INTERVIEWER_WOMAN;
		break;

	case KAIWA_MODE_GYMREADER:
		addr = &(((TV_GYM_Work*)(&(Fld.tv_event[ScriptParameter1])))->easytalk_no);
		interviewer = KAIWA_INTERVIEWER_MAN;
		break;

	// 流行語入力時は、会話入力モードのワークエリアに一時保存させる
	case KAIWA_MODE_POPULAR:
		addr = NULL;
		break;

	case KAIWA_MODE_FIELDBATTLE:
		addr = (&(Fld.tv_camera.easytalk_no));
		*addr = KAIWA_CODE_BLANK;
		interviewer = KAIWA_INTERVIEWER_WOMAN;
		break;

	case KAIWA_MODE_CONTEST:
		addr = &(((TV_Con_Work*)(&(Fld.tv_event[ScriptParameter1])))->easytalk_no[ScriptParameter2]);
		interviewer = KAIWA_INTERVIEWER_MAN;
		break;

	case KAIWA_MODE_TOWER:
		addr = &(((TV_Tower_Work*)(&(Fld.tv_event[ScriptParameter1])))->easytalk_no);
		interviewer = KAIWA_INTERVIEWER_WOMAN;
		break;

	case KAIWA_MODE_NICEWORD:
		KaiwaWork->pop_word[0] = KAIWA_CODE_BLANK;
		KaiwaWork->pop_word[1] = KAIWA_CODE_BLANK;
		addr = KaiwaWork->pop_word;
		break;

	default:
		return;
	}

	KaiwaInputBegin(ScriptParameter0, addr, FieldScriptRecoverBGMNotStart, interviewer);
}

/***********************************************************************
**	他画面からの呼び出し（ブラックアウトの状態で呼び出してください）
**
**  mode         入力モード（kaiwa_code.hに定義)
**  addr         会話コードを格納するアドレス（初期値を反映します）
**  ret_func     復帰関数
**  interviewer  インタビュアータイプ（kaiwa_code.hに定義）
**
***********************************************************************/
void KaiwaInputBegin(u8 mode, u16 *addr, pFunc ret_func, u8 interviewer)
{
	KaiwaWork->ret_func = ret_func;
	KaiwaWork->code_addr = addr;
	KaiwaWork->mode = mode;
	KaiwaWork->interviewer = interviewer;

	/* 流行語入力時はワークエリアに会話コードを保存しておく */
	if(KaiwaWork->mode == KAIWA_MODE_POPULAR){
		KaiwaWork->code_addr = KaiwaWork->pop_word;
		KaiwaWork->pop_word[0] = Fld.PopWord[0].word[0];
		KaiwaWork->pop_word[1] = Fld.PopWord[0].word[1];
	}

	MainProcChange(KaiwaInit);
}
/*====================================================================*/
/*  初期化                                                            */
/*====================================================================*/
static void init_data(void);
static void init_category_tbl(void);
static void init_charcode_tbl(void);
static void init_msg(void);

/***************************************************************
**	プロセス初期化
***************************************************************/
static void KaiwaInit(void)
{
	switch(sys.InitSeqWork){
	case 0:
	default:
		*(vu16 *)REG_DISPCNT = 0;
		SetVBlankFunc(NULL);
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
		init_data();
		break;

	case 4:
		KaiwaBGInit();
		break;

	case 5:
		KaiwaObjInit();
		KaiwaModeFlagInit();
		break;

	case 6:
		draw_caption();
		change_sub(sub_kaiwa_in);
		SetVBlankFunc(KaiwaVBlankIntr);
		break;

	case 7:
		PaletteFadeReq(0xffffffff, 0, 16, 0, 0x0000);
		break;

	case 8:
		*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP 
		| DISP_BG0_ON
		| DISP_BG1_ON
		| DISP_BG2_ON
		| DISP_BG3_ON
		| DISP_OBJ_ON
		;
		MainProcChange(KaiwaMain);
		EventFlagSet(SYS_KAIWA_USED);
		break;

	}
	sys.InitSeqWork++;
}
/**************************************************************
**	各種データ初期化
**************************************************************/
static void init_data(void)
{
	static const u8 Layout[] = {
		KAIWA_LAYOUT_2x2,   // 自己紹介
		KAIWA_LAYOUT_3x2,   // 対戦開始
		KAIWA_LAYOUT_3x2,   // 対戦勝ち
		KAIWA_LAYOUT_3x2,   // 対戦負け
		KAIWA_LAYOUT_3x3,   // メール
		KAIWA_LAYOUT_2x2B,   // はがき
		KAIWA_LAYOUT_3x2,   // 替え歌
		KAIWA_LAYOUT_1x1,   // インタビュー
		KAIWA_LAYOUT_1x1,   // ジムリーダー後
		KAIWA_LAYOUT_2x1,   // 流行
		KAIWA_LAYOUT_1x1,   // フィールド戦闘後
		KAIWA_LAYOUT_1x1,   // コンテスト後
		KAIWA_LAYOUT_1x1,   // バトルタワーインタビュー
		KAIWA_LAYOUT_2x1,   // いいことば
	};

	KaiwaWork->layout = Layout[KaiwaWork->mode];

	switch(KaiwaWork->layout){
	case KAIWA_LAYOUT_2x2:
		KaiwaWork->cursor_xlimit = 2;
		KaiwaWork->cursor_ylimit = 2;
		KaiwaWork->cursor_xorg = KAIWA_2x2FRAME_X + 2;
		KaiwaWork->cursor_yorg = KAIWA_2x2FRAME_Y + 1;
		break;

	case KAIWA_LAYOUT_2x2B:
		KaiwaWork->cursor_xlimit = 2;
		KaiwaWork->cursor_ylimit = 2;
		KaiwaWork->cursor_xorg = KAIWA_2x2B_FRAME_X + 2;
		KaiwaWork->cursor_yorg = KAIWA_2x2B_FRAME_Y + 1;
		break;

	case KAIWA_LAYOUT_3x2:
		KaiwaWork->cursor_xlimit = 3;
		KaiwaWork->cursor_ylimit = 2;
		KaiwaWork->cursor_xorg = KAIWA_3x2FRAME_X + 2;
		KaiwaWork->cursor_yorg = KAIWA_3x2FRAME_Y + 1;
		break;

	case KAIWA_LAYOUT_3x3:
		KaiwaWork->cursor_xlimit = 3;
		KaiwaWork->cursor_ylimit = 3;
		KaiwaWork->cursor_xorg = KAIWA_3x3FRAME_X + 2;
		KaiwaWork->cursor_yorg = KAIWA_3x3FRAME_Y + 1;
		break;

	case KAIWA_LAYOUT_1x1:
		KaiwaWork->cursor_xlimit = 1;
		KaiwaWork->cursor_ylimit = 1;
		KaiwaWork->cursor_xorg = KAIWA_1x1FRAME_X + 2;
		KaiwaWork->cursor_yorg = KAIWA_1x1FRAME_Y + 1;
		break;

	case KAIWA_LAYOUT_2x1:
		KaiwaWork->cursor_xlimit = 2;
		KaiwaWork->cursor_ylimit = 1;
		KaiwaWork->cursor_xorg = KAIWA_2x1FRAME_X + 2;
		KaiwaWork->cursor_yorg = KAIWA_2x1FRAME_Y + 1;
		break;
	}
	KaiwaWork->code_size = KaiwaWork->cursor_xlimit * KaiwaWork->cursor_ylimit;
	KaiwaWork->cursor_xpos = KaiwaWork->cursor_ypos = 0;
	KaiwaWork->cursorpos_update = 0;

	KaiwaWork->select_mode = KAIWA_SEL_CATEGORY;
	KaiwaWork->scroll_vofs = 0;
	KaiwaWork->scroll_speed = KAIWA_SCROLL_SPEED_DEFAULT;


	init_category_tbl();
	KaiwaInitWordSort();
	KaiwaInitWordPointerTbl();

	init_codework();
	init_charcode_tbl();
	init_msg();
}
/**************************************************************
**	カテゴリテーブルの初期化
**************************************************************/
static void init_category_tbl(void)
{
	u16 i, j, c, on;

	c = 0;
	for(i = 0; ; i++){
		for(j = 0; j < 3; j++){
			KaiwaWork->category_tbl[i][j] = c++;
			if(c == KWC_BORDER){ break; }
		}
		if(c == KWC_BORDER){ break; }
	}
	KaiwaWork->enable_category_cnt = KWC_BORDER;
	while(c < KWC_MAX){
		on = KaiwaIsEnableCategory(c);
		if(on){
			if(++j > 2){
				i++;
				j = 0;
			}
			KaiwaWork->category_tbl[i][j] = c;
			KaiwaWork->hidden_category_flg[c-KWC_BORDER] = 1;
			KaiwaWork->enable_category_cnt++;
		}else{
			KaiwaWork->hidden_category_flg[c-KWC_BORDER] = 0;
		}
		c++;
	}
	KaiwaWork->category_max_col = (KaiwaWork->enable_category_cnt+2) / 3;
}
/**************************************************************
**	あいうえおグループインデックスの初期化
**************************************************************/
static void init_charcode_tbl(void)
{
	u16 col, row, code;
	code = 1;
	for(col = 0; col < 4; col++){
		for(row = 0; row < 5; row++){
			KaiwaWork->charcode_tbl[col][row] = code++;
		}
	}
	for(col = 0; col < 4; col++){
		if(col == 3){ code = (ra_ - a_) + 1; }
		for(row = 5; row < 10; row++){
			KaiwaWork->charcode_tbl[col][row] = code++;
		}
	}
	code = (ya_ - a_) + 1;
	for(row = 10; row < 13; row++){
		KaiwaWork->charcode_tbl[0][row] = code++;
	}
	KaiwaWork->charcode_tbl[0][13] = (wa_ - a_) + 1;

	KaiwaWork->charcode_tbl[1][10] = 0;
}
/**************************************************************
**	表示メッセージの初期化
**************************************************************/
static void init_msg(void)
{
	static const struct MSG_TBL{
		const u8 * const msg1;
		const u8 * const msg2;
		u8  use2line;
	}msg_tbl[] = {
	// 説明メッセージ
		{ KaiwaMsg_self_info1,   KaiwaMsg_self_info2,   1 }, // 自己紹介
		{ KaiwaMsg_battle_info1, KaiwaMsg_battle_info2, 1 }, // 自己紹介、対戦開始、勝ち、負け、
		{ KaiwaMsg_mail_info1,   KaiwaMsg_mail_info2,   1 }, // メール
		{ KaiwaMsg_inter_info1,  KaiwaMsg_inter_info2,  1 }, // インタビュー、ジムリーダー、フィールド戦闘後、コンテスト後、はがき
		{ KaiwaMsg_song_info1,   KaiwaMsg_song_info2,   1 }, // 替え歌
		{ KaiwaMsg_pop_info1,    KaiwaMsg_pop_info2,    1 }, // 流行語

	// 確認メッセージ
		{ KaiwaMsg_jiko_kakunin1,   KaiwaMsg_kakunin2,    0 }, // 自己紹介
		{ KaiwaMsg_begin_kakunin1,  KaiwaMsg_kakunin2,    1 }, // 対戦開始
		{ KaiwaMsg_won_kakunin1,    KaiwaMsg_kakunin2,    1 }, // 対戦勝ち
		{ KaiwaMsg_lost_kakunin1,   KaiwaMsg_kakunin2,    1 }, // 対戦負け
		{ KaiwaMsg_mail_kakunin1,   KaiwaMsg_kakunin2,    1 }, // メール
		{ KaiwaMsg_hagaki_kakunin1, KaiwaMsg_kakunin2,    1 }, // はがき
		{ KaiwaMsg_song_kakunin1,   KaiwaMsg_kakunin2,    0 }, // 替え歌
		{ KaiwaMsg_inter_kakunin1,  KaiwaMsg_kakunin2,    0 }, // インタビュー、ジムリーダー、フィールド戦闘、コンテスト後
		{ KaiwaMsg_pop_kakunin1,    KaiwaMsg_kakunin2,    0 }, // 流行語

		{ KaiwaMsg_nice1, KaiwaMsg_nice2, 1 },  // いいことば説明
		{ KaiwaMsg_inter4_info1, KaiwaMsg_mail_info2, 0 },  // ハガキ説明
	};

	static const u8 msg_index_tbl[KAIWA_MODE_MAX][2] = {
		{ 0,  6 },  // 自己紹介
		{ 1,  7 },  // 対戦開始
		{ 1,  8 },  // 対戦勝ち
		{ 1,  9 },  // 対戦負け
		{ 2, 10 },  // メール
		{16, 13 },  // はがき
		{ 4, 12 },  // 替え歌
		{ 3, 13 },  // インタビュー
		{ 3, 13 },  // ジムリーダー後
		{ 5, 14 },  // 流行語
		{ 3, 13 },  // フィールド戦闘後
		{ 3, 13 },  // コンテスト後
		{ 3, 13 },  // バトルタワー
		{15, 13 },  // いいことば
	};

	u8 *dst[] = {
		KaiwaWork->info_msg1,
		KaiwaWork->info_msg2,
		KaiwaWork->kakunin_msg1,
		KaiwaWork->kakunin_msg2,
	};

	const struct MSG_TBL *msg;
	u8 *cp;
	u16 i;

	for(i = 0; i < 2; i++){
		msg = msg_tbl + msg_index_tbl[KaiwaWork->mode][i];
		cp = PM_strcpy(dst[i * 2], msg->msg1);
		if(msg->use2line){
			PM_strcpy(dst[i * 2 + 1], msg->msg2);
		}else{
			*cp++ = spc_;
			PM_strcpy(cp, msg->msg2);
			*(dst[i * 2 + 1]) = EOM_;
		}
	}

	for(i = 0; i < KAIWA_MSGLEN_MAX; i++){
		KaiwaWork->spc_msg[i] = spc_;
	}
	KaiwaWork->spc_msg[i] = EOM_;

	PM_strclear(KaiwaWork->spaceword_buf, spc_, 28);
}
/***************************************************************
**	会話データ領域の初期化
***************************************************************/
void InitKaiwaData(void)
{
	u16 i, j;

	// プロフィール
	Fld.kaiwa_self[0] = 0x020e;  // ポケモン
	Fld.kaiwa_self[1] = 0x1228;  // だいすき
	Fld.kaiwa_self[2] = 0x020b;  // トレーナー
	Fld.kaiwa_self[3] = 0x101f;  // でーす！

	// バトルタワー対戦メッセージ
	Fld.kaiwa_battle[0] = 0x0603;    // かくご
	Fld.kaiwa_battle[1] = 0x1405;    // いい
	Fld.kaiwa_battle[2] = 0x0c02;    // ！？
	Fld.kaiwa_battle[3] = 0x0e0e;    // さあ
	Fld.kaiwa_battle[4] = 0x0803;    // いくよ
	Fld.kaiwa_battle[5] = 0x0c01;    // ！！

	for(i = 0; i < 6; i++){
		Fld.kaiwa_win[i] = KAIWA_CODE_BLANK;
		Fld.kaiwa_lose[i] = KAIWA_CODE_BLANK;
	}

	for(i = 0; i < MAIL_STOCK_MAX; i++){
		for(j = 0; j < 9; j++){
			Fld.MailData[i].msg[j] = KAIWA_CODE_BLANK;
		}
	}

	// 隠し単語・カテゴリフラグを全てオフ
	for(i = 0; i < 64; i++){
		Fld.kaiwa_word_flag[i] = 0;
	}

}
/***********************************************************************
**	シークエンスの変更
**
**  seq   変更後のシークエンス
**
***********************************************************************/
static void change_sub(pFunc sub)
{
	KaiwaWork->sub = sub;
	KaiwaWork->prog = 0;
}

/***********************************************************************
**	グループ選択ウィンドウの行数、列数、現在位置などを初期化
***********************************************************************/
static void init_groupwin_param(void)
{
	if(KaiwaWork->select_mode == KAIWA_SEL_CATEGORY){
		u16 i;

		for(i = 0; i < KaiwaWork->category_max_col; i++){
			KaiwaWork->group_max_row[i] = 3;
		}
		KaiwaWork->group_max_row[i-1] = KaiwaWork->enable_category_cnt % 3;
		if(KaiwaWork->group_max_row[i-1]==0){ KaiwaWork->group_max_row[i-1] = 3; }

	}else{
		KaiwaWork->group_max_row[0] = 14;
		KaiwaWork->group_max_row[1] = 11;
		KaiwaWork->group_max_row[2] = 10;
		KaiwaWork->group_max_row[3] = 10;
	}
	KaiwaWork->group_col = 0;
	KaiwaWork->group_row = 0;
	KaiwaWork->group_base_col = 0;
	KaiwaWork->group_selmenu_flg = 0;

	KaiwaScrollBGParamInit();
}
/***********************************************************************
**	単語選択ウィンドウの行数、列数、現在位置などを初期化
***********************************************************************/
static void init_wordwin_param(void)
{
	KaiwaInitWordWindowData();

	if(KaiwaWork->select_mode == KAIWA_SEL_CATEGORY){
		u16 category, i;

		category = KaiwaWork->select_group_num;
		KaiwaWork->word_max_col = (KaiwaWork->category_word_cnt[category] + (KAIWA_WORDWIN_ROW-1)) / KAIWA_WORDWIN_ROW;
		for(i = 0; i < KaiwaWork->word_max_col; i++){
			KaiwaWork->word_max_row[i] = KAIWA_WORDWIN_ROW;
		}
		i--;
		KaiwaWork->word_max_row[i] = KaiwaWork->category_word_cnt[category] % KAIWA_WORDWIN_ROW;
		if(KaiwaWork->word_max_row[i] == 0){
			KaiwaWork->word_max_row[i] = KAIWA_WORDWIN_ROW;
		}

	}else{
		u16 initial, i;

		initial = KaiwaWork->select_group_num;
		KaiwaWork->word_max_col = (KaiwaWork->initial_word_cnt[initial] + (KAIWA_WORDWIN_ROW-1)) / KAIWA_WORDWIN_ROW;
		for(i = 0; i < KaiwaWork->word_max_col; i++){
			KaiwaWork->word_max_row[i] = KAIWA_WORDWIN_ROW;
		}
		i--;
		KaiwaWork->word_max_row[i] = KaiwaWork->initial_word_cnt[initial] % KAIWA_WORDWIN_ROW;
		if(KaiwaWork->word_max_row[i] == 0){
			KaiwaWork->word_max_row[i] = KAIWA_WORDWIN_ROW;
		}
	}

	KaiwaWork->word_col = 0;
	KaiwaWork->word_row = 0;
	KaiwaWork->word_base_col = 0;

	KaiwaScrollBGParamInit();
}
/***********************************************************************
**	モード別のキャプション描画
***********************************************************************/
static void draw_caption(void)
{
	switch(KaiwaWork->mode){
	case KAIWA_MODE_SELF:
	case KAIWA_MODE_BATTLE_START:
	case KAIWA_MODE_BATTLE_WON:
	case KAIWA_MODE_BATTLE_LOST:
	case KAIWA_MODE_SONG:
	case KAIWA_MODE_POPULAR:
	case KAIWA_MODE_NICEWORD:
	default:
		KaiwaBG_DrawCaption(KaiwaWork->mode);
		break;


	// インタビュアー画像を表示するほう
	case KAIWA_MODE_HAGAKI:
	case KAIWA_MODE_INTERVIEW:
	case KAIWA_MODE_GYMREADER:
	case KAIWA_MODE_FIELDBATTLE:
	case KAIWA_MODE_CONTEST:
	case KAIWA_MODE_TOWER:
		KaiwaBG_DrawCaption(KaiwaWork->mode);
		KaiwaObjInterviewerAdd(KaiwaWork->interviewer, KaiwaWork->layout);
		break;

//	case KAIWA_MODE_MAIL:

	}
}
/*====================================================================*/
/*  ループ                                                            */
/*====================================================================*/
/*-------------------------------*/
/* v blank                       */
/*-------------------------------*/
static void KaiwaVBlankIntr(void)
{
	*(vu16*)REG_BG3VOFS = KaiwaWork->scroll_vofs;
	actOAMtrans();
	actDMAtrans();
	RectTransMain();
	PaletteFadeTrans();
}
/*-------------------------------*/
/* main                          */
/*-------------------------------*/
static void KaiwaMain(void)
{
	KaiwaWork->sub();
	JumpActor();
	SetActor();
}
/*-------------------------------*/
/* フェードイン                  */
/*-------------------------------*/
static void sub_kaiwa_in(void)
{
	if(!PaletteAnime()){
		change_sub(sub_init_mainmenu);
	}
}
/*-------------------------------*/
/* メイン初期化                  */
/*-------------------------------*/
static void sub_init_mainmenu(void)
{
	KaiwaArrowHide();
	KaiwaCursorMove(KAIWA_CURSOR_MOVE);
	DrawKaiwaMsg(KAIWA_MSG_INFO);
	change_sub(sub_kaiwa_mainmenu);
}
/*-------------------------------*/
/* メインメニュー                */
/*-------------------------------*/
static u8 get_cursor_pos(void);

static void sub_kaiwa_mainmenu(void)
{
	KaiwaWork->cursorpos_update = get_cursor_pos();
	if(KaiwaWork->cursorpos_update){
		SePlay(SE_SELECT);  // カーソル移動音
	}

	if(sys.Trg & A_BUTTON){
		SePlay(SE_SELECT);  // 決定音

		// 共通メニュー選択
		if(KaiwaWork->cursor_ypos == KaiwaWork->cursor_ylimit){
			switch(KaiwaWork->cursor_xpos){
			case 0: change_sub(sub_erase); return;
			case 1: change_sub(sub_yameru); return;
			case 2: change_sub(sub_kettei); return;
			}
		// 単語選択
		}else{
			KaiwaWork->edit_word_no = KaiwaWork->cursor_ypos * KaiwaWork->cursor_xlimit + KaiwaWork->cursor_xpos;
			update_limit_flg();
			change_sub(sub_sel_group_ini); return;
		}
	}
	if(sys.Trg & B_BUTTON){
		change_sub(sub_yameru); return;
	}

}
/*-------------------------------*/
/* ぜんぶけす                    */
/*-------------------------------*/
static void sub_erase(void)
{
	switch(KaiwaWork->prog){
	case 0:
		KaiwaCursorMove(KAIWA_CURSOR_BANISH);

		// 替え歌モード時はアラートメッセージ
		if(KaiwaWork->mode == KAIWA_MODE_SONG){
			DrawKaiwaMsg(KAIWA_MSG_ERASE_WARN);
			KaiwaWork->prog = 100;
			break;
		}

		DrawKaiwaMsg(KAIWA_MSG_ERASE);
		YesNoSelectInit(KAIWA_YESNO_X, KAIWA_YESNO_Y);
		NMenuVCursorSet(1);
		KaiwaWork->prog++;
		break;

	case 1:
		switch(YesNoSelectMain()){
		case CURSOR_YES_VALUE:
			clear_code_work();
			EraseEditArea();
			WriteEditArea();
			KaiwaWork->prog++;
			break;

		case CURSOR_CANCEL_VALUE:
		case CURSOR_NO_VALUE:
			KaiwaWork->prog++;
			break;
		}
		break;

	case 2:
		menu_clear();
		change_sub(sub_init_mainmenu);
		break;

	case 100:
		if(sys.Trg & (A_BUTTON|B_BUTTON)){
			change_sub(sub_init_mainmenu);
		}
		break;
	}
}
/*-------------------------------*/
/* やめる                        */
/*-------------------------------*/
static void sub_yameru(void)
{
	switch(KaiwaWork->prog){
	case 0:
		KaiwaCursorMove(KAIWA_CURSOR_BANISH);
		DrawKaiwaMsg(KAIWA_MSG_YAMERU);
		YesNoSelectInit(KAIWA_YESNO_X, KAIWA_YESNO_Y);
		NMenuVCursorSet(1);

		// １回しか確認しないモード
		if(KaiwaWork->mode == KAIWA_MODE_POPULAR
		|| KaiwaWork->mode == KAIWA_MODE_MAIL
		|| KaiwaWork->mode == KAIWA_MODE_INTERVIEW
		|| KaiwaWork->mode == KAIWA_MODE_GYMREADER
		|| KaiwaWork->mode == KAIWA_MODE_FIELDBATTLE
		|| KaiwaWork->mode == KAIWA_MODE_CONTEST
		|| KaiwaWork->mode == KAIWA_MODE_TOWER
		|| KaiwaWork->mode == KAIWA_MODE_HAGAKI
		|| KaiwaWork->mode == KAIWA_MODE_NICEWORD
		){
			KaiwaWork->prog = 2;
			break;
		}
		KaiwaWork->prog++;
		break;

	case 1:
		switch(YesNoSelectMain()){
		case CURSOR_YES_VALUE:
			DrawKaiwaMsg(KAIWA_MSG_YAMERU_WARN);
			YesNoSelectInit(KAIWA_YESNO_X, KAIWA_YESNO_Y);
			NMenuVCursorSet(1);
			KaiwaWork->prog++;
			break;

		case CURSOR_CANCEL_VALUE:
		case CURSOR_NO_VALUE:
			KaiwaWork->prog = 0xff;
			break;
		}
		break;

	case 2:
		switch(YesNoSelectMain()){
		case CURSOR_YES_VALUE:
			AnswerWork = 0;
			change_sub(sub_fadeout);
			break;

		case CURSOR_CANCEL_VALUE:
		case CURSOR_NO_VALUE:
			KaiwaWork->prog = 0xff;
			break;
		}
		break;

	case 0xff:
		menu_clear();
		change_sub(sub_init_mainmenu);
	}
}
/*-------------------------------*/
/* けってい                      */
/*-------------------------------*/
static void sub_kettei(void)
{
	switch(KaiwaWork->prog){
	case 0:
		KaiwaCursorMove(KAIWA_CURSOR_BANISH);

		// 単語が１つも入力されていなかったら決定させない（全モード）
		if(check_all_blank())
		{
			DrawKaiwaMsg(KAIWA_MSG_KETTEI_WARN);
			KaiwaWork->prog = 10;
			break;
		}

		// 流行語入力時
		if(KaiwaWork->mode == KAIWA_MODE_POPULAR){
			// １単語も変わっていなかったら決定させない
			if(!count_changed_word()){
				DrawKaiwaMsg(KAIWA_MSG_POP_WARN);
				KaiwaWork->prog = 10;
				break;
			}
			// 入力に空白があったら決定させない
			if(KaiwaWork->code_work[0]==KAIWA_CODE_BLANK ||
			   KaiwaWork->code_work[1]==KAIWA_CODE_BLANK){
				DrawKaiwaMsg(KAIWA_MSG_POP_BLANK_WARN);
				KaiwaWork->prog = 10;
				break;
			}
		}

		// メール入力時
		if(KaiwaWork->mode == KAIWA_MODE_MAIL)
		{
			// １単語も変わっていなかったらキャンセル扱い
			if(!count_changed_word()){
				change_sub(sub_yameru);
				return;
			}
		}
		DrawKaiwaMsg(KAIWA_MSG_KAKUNIN);

		WriteEditAreaKakunin();

		YesNoSelectInit(KAIWA_YESNO_X, KAIWA_YESNO_Y);
		NMenuVCursorSet(0);
		KaiwaWork->prog++;
		break;

	case 1:
		switch(YesNoSelectMain()){
		case CURSOR_YES_VALUE:
			AnswerWork = (count_changed_word() != 0);
			save_code();
			if(KaiwaWork->mode == KAIWA_MODE_SELF)
			{
				ScriptParameter0 = check_fushigi();
			}
			if(KaiwaWork->mode == KAIWA_MODE_POPULAR){
				set_popword_buffer();
				ScriptParameter0 = PopWord_Add(KaiwaWork->pop_word);
			}
			if(KaiwaWork->mode == KAIWA_MODE_NICEWORD){
				// １単語しか入力されていない場合も未入力と同じ処理をさせる
				if(KaiwaWork->code_work[0] == KAIWA_CODE_BLANK
				|| KaiwaWork->code_work[1] == KAIWA_CODE_BLANK
				){
					AnswerWork = 0;
				}
				ScriptParameter0 = check_niceword();
			}
			change_sub(sub_fadeout);
			break;

		case CURSOR_CANCEL_VALUE:
		case CURSOR_NO_VALUE:
			menu_clear();
			if(KaiwaWork->mode == KAIWA_MODE_SONG){
				if(count_changed_word() > 0){
					KaiwaWork->prog = 100;
					break;
				}
			}
			WriteEditArea();
			change_sub(sub_init_mainmenu);
			break;
		}
		break;

	// 流行語モードで条件を満たさない場合
	case 10:
		if(sys.Trg & (A_BUTTON|B_BUTTON)){
			change_sub(sub_init_mainmenu);
		}
		break;

	// 替え歌モードで１単語変換後に「いいえ」を選択
	case 100:
		DrawKaiwaMsg(KAIWA_MSG_1WORD);
//		YesNoSelectInit(KAIWA_YESNO_X, KAIWA_YESNO_Y);
//		NMenuVCursorSet(1);
		KaiwaWork->prog++;

	case 101:
		if(sys.Trg & (A_BUTTON)){
			KaiwaWork->prog++;
		}
		break;

	case 102:
		init_codework();
		WriteEditArea();
		change_sub(sub_init_mainmenu);
		break;
	}
}
/*-------------------------------*/
/* グループ選択（初期化）        */
/*-------------------------------*/
static void sub_sel_group_ini(void)
{
	switch(KaiwaWork->prog){
	case 0:
		KaiwaCursorMove(KAIWA_CURSOR_STOP);
		DrawKaiwaMsg(KAIWA_MSG_HIDE);
		init_groupwin_param();
		DrawKaiwaGroupName();
		KaiwaDrawWinIni();
		KaiwaWork->prog++;
		break;

	case 1:
		if(KaiwaWin_GroupDraw()){
			KaiwaModeFlagAppear(1);
			KaiwaSquareAdd();
			KaiwaArrowModeChange(ARROW_MODE_GROUP);
			change_sub(sub_sel_group_main);
		}
		break;
	}
}
/*-------------------------------*/
/* グループ選択（メイン）        */
/*-------------------------------*/
static void sub_sel_group_main(void)
{
	KaiwaWork->squarepos_update = get_square_pos();
	if(KaiwaWork->scroll_height){
		SePlay(SE_SELECT);  // カーソル移動音
		KaiwaWork->scroll_ret_func = sub_sel_group_main;
		change_sub(sub_scroll);
		return;
	}
	if(KaiwaWork->squarepos_update){
		SePlay(SE_SELECT);  // カーソル移動音
	}

	if(sys.Trg & A_BUTTON){
		SePlay(SE_SELECT);  // 決定音

		if(KaiwaWork->group_selmenu_flg){
			switch(KaiwaWork->group_col){
			case 1: change_sub(sub_groupmode_change); break;
			case 3: change_sub(sub_return_mainmenu); break;
			case 2:
				if(KaiwaWork->mode != KAIWA_MODE_SONG){
					set_code(KaiwaWork->edit_word_no, KAIWA_CODE_BLANK);
					update_limit_flg();
					WriteEditArea();
				}
				break;
			}
		}else{
			calc_select_group_num();
			change_sub(sub_group_to_word);
		}
		return;
	}
	if(sys.Trg & B_BUTTON){
		change_sub(sub_return_mainmenu);
		return;
	}
	if(sys.Trg & SELECT_BUTTON){
		change_sub(sub_groupmode_change);
		return;
	}
}
/*-------------------------------*/
/* グループ選択からメインへ戻る  */
/*-------------------------------*/
static void sub_return_mainmenu(void)
{
	switch(KaiwaWork->prog){
	case 0:
		KaiwaSquareDel();
		KaiwaDrawWinIni();
		KaiwaArrowHide();
		KaiwaModeFlagAppear(0);
		KaiwaWork->prog++;
		break;

	// モード標識消去待ち
	case 1:
	case 2:
		KaiwaWork->prog++;
		break;

	case 3:
		if(KaiwaWin_GroupErase()){
			KaiwaWork->prog++;
		}
		break;

	case 4:
		change_sub(sub_init_mainmenu);
		break;
	}
}
/*-------------------------------*/
/* グループ選択モード切替        */
/*-------------------------------*/
static void sub_groupmode_change(void)
{
	switch(KaiwaWork->prog){
	case 0:
		KaiwaSquareDel();
		KaiwaDrawWinIni();
		KaiwaArrowHide();
		KaiwaWork->prog++;
		KaiwaModeFlagChange();
		break;

	case 1:
		if(MinimizeKaiwaGroupWin()){
			KaiwaWork->select_mode = (KaiwaWork->select_mode == KAIWA_SEL_CATEGORY)? 
				KAIWA_SEL_CHAR : KAIWA_SEL_CATEGORY;
			init_groupwin_param();
			DrawKaiwaGroupName();
			KaiwaDrawWinIni();
			KaiwaWork->prog++;
		}
		break;

	default:
		KaiwaWork->prog++;
		break;

	case 8:
		if(MaxmizeKaiwaGroupWin()){
			KaiwaSquareAdd();
			KaiwaArrowModeChange(ARROW_MODE_GROUP);
			change_sub(sub_sel_group_main);
		}
		break;
	}
}
/*-------------------------------*/
/* グループ選択→単語選択移行    */
/*-------------------------------*/
static void sub_group_to_word(void)
{
#define WAIT (8)

	switch(KaiwaWork->prog){
	default:
		KaiwaWork->prog++;
		break;

	case WAIT:
		KaiwaModeFlagAppear(0);
		KaiwaSquareDel();
		ClearKaiwaScrollBG();
		init_wordwin_param();
		KaiwaArrowHide();
		KaiwaDrawWinIni();
		KaiwaWork->prog++;
		break;

	case WAIT+1:
		if(KaiwaWin_GroupToWord()){
			DrawKaiwaWordAll();
			KaiwaWork->prog++;
		}
		break;

	case WAIT+2:
		KaiwaWordCursorDisp(1);
		KaiwaArrowModeChange(ARROW_MODE_WORD);
		change_sub(sub_sel_word);
		break;

	case WAIT+3:
		break;
	}
#undef WAIT
}
/*-------------------------------*/
/* 単語選択メイン                */
/*-------------------------------*/
static void sub_sel_word(void)
{
	KaiwaWork->wordcursor_update = get_wordcursor_pos();
	if(KaiwaWork->scroll_height){
		SePlay(SE_SELECT);  // カーソル移動音
		KaiwaWork->scroll_ret_func = sub_sel_word;
		change_sub(sub_scroll);
		return;
	}
	if(KaiwaWork->wordcursor_update){
		SePlay(SE_SELECT);  // カーソル移動音
	}

	if(sys.Trg & A_BUTTON){
		SePlay(SE_SELECT);  // 決定音
		change_sub(sub_word_decide);
		return;
	}
	if(sys.Trg & B_BUTTON){
		change_sub(sub_word_to_group);
		return;
	}
}
/*-------------------------------*/
/* 単語決定                      */
/*-------------------------------*/
static void sub_word_decide(void)
{
	switch(KaiwaWork->prog){
	case 0:
		if(!set_dicide_word()){
			change_sub(sub_sel_word);
			return;
		}
		KaiwaArrowHide();
		KaiwaWordCursorDisp(0);
		KaiwaWork->prog++;
		break;

	case 1:
//		ClearKaiwaScrollBG();
		KaiwaWork->prog++;
		break;

	case 2:
		KaiwaDrawWinIni();
		KaiwaWork->prog++;
		break;

	case 3:
		if(KaiwaWin_WordErase()){
			KaiwaWork->prog++;
		}
		break;

	case 4:
		if(KaiwaWork->mode == KAIWA_MODE_SONG){
			if(count_changed_word() > 0){
				change_sub(sub_kettei);
				break;
			}
		}
		change_sub(sub_init_mainmenu);
		break;
	}
}
/*-------------------------------*/
/* 単語選択→グループ選択        */
/*-------------------------------*/
static void sub_word_to_group(void)
{
	switch(KaiwaWork->prog){
	case 0:
		KaiwaWordCursorDisp(0);
		KaiwaArrowHide();
		KaiwaWork->prog++;
		break;

	case 1:
		ClearKaiwaScrollBG();
		KaiwaDrawWinIni();
		KaiwaWork->prog++;
		break;

	case 2:
		if(KaiwaWin_WordToGroup()){
			KaiwaModeFlagAppear(1);
			ReDrawKaiwaGroupName();
			KaiwaWork->prog++;
		}
		break;

	case 3:
		KaiwaSquareAdd();
		KaiwaArrowModeChange(ARROW_MODE_GROUP);
		KaiwaWork->prog++;
		break;

	case 4:
		change_sub(sub_sel_group_main);
		break;
	}
}
/*-------------------------------*/
/* スクロール                    */
/*-------------------------------*/
static void sub_scroll(void)
{
	switch(KaiwaWork->prog){
	case 0:
		if(KaiwaWork->scroll_ret_func == sub_sel_group_main){
			DrawKaiwaCategoryName();
		}else{
			DrawKaiwaWordScroll();
		}
		KaiwaScrollInit(KaiwaWork->scroll_speed);
		KaiwaWork->prog++;
		break;

	case 1:
		if(KaiwaScroll()){
			if(KaiwaWork->scroll_ret_func == sub_sel_group_main){
				DrawKaiwaCategoryName();
				KaiwaWork->group_base_col += KaiwaWork->scroll_height;
				adjust_square_row();
				KaiwaWork->squarepos_update = 1;
			}else{
				DrawKaiwaWordScroll();
				KaiwaWork->word_base_col += KaiwaWork->scroll_height;
				adjust_wordcursor_row();
				KaiwaWork->wordcursor_update = 1;
			}
			KaiwaWork->scroll_speed = KAIWA_SCROLL_SPEED_DEFAULT;
			change_sub(KaiwaWork->scroll_ret_func);
		}
		break;
	}
}
/*-------------------------------*/
/* フェードアウト                */
/*-------------------------------*/
static void sub_fadeout(void)
{
	switch(KaiwaWork->prog){
	case 0:
		PaletteFadeReq(0xffffffff, 0, 0, 16, 0x0000);
		KaiwaWork->prog++;
		break;

	case 1:
		if(!PaletteAnime()){
			MainProcChange(KaiwaWork->ret_func);
		}
		break;
	}
}


/***********************************************************************
**	７文字制限フラグを更新
***********************************************************************/
static void update_limit_flg(void)
{
//	if(KaiwaWork->layout == KAIWA_LAYOUT_3x2 &&
	if(KaiwaWork->mode == KAIWA_MODE_BATTLE_START &&
	   KaiwaWork->limitword_cnt[KaiwaWork->cursor_ypos] == 2 &&
	   KaiwaCodeLen(KaiwaWork->code_work[KaiwaWork->edit_word_no]) != 7)
	{
		KaiwaWork->limit7_flg = 1;
	}else{
		KaiwaWork->limit7_flg = 0;
	}
}
/***********************************************************************
**	カーソル位置計算
**
**  戻り値  1 ... カーソル位置変更あり  0 ... 変更なし
***********************************************************************/
static u8 get_cursor_pos(void)
{
	u8 move_updown = 0;

	// スタートボタンで「けってい」にカーソル移動
	if(sys.Trg & START_BUTTON){
		KaiwaWork->cursor_ypos = KaiwaWork->cursor_ylimit;
		KaiwaWork->cursor_xpos = 2;
		return 1;
	}

	if(sys.Repeat & U_KEY){
		if(--(KaiwaWork->cursor_ypos) < 0){
			KaiwaWork->cursor_ypos = KaiwaWork->cursor_ylimit;
		}
		move_updown = 1;
	}else if(sys.Repeat & D_KEY){
		if(++(KaiwaWork->cursor_ypos) > KaiwaWork->cursor_ylimit){
			KaiwaWork->cursor_ypos = 0;
		}
		move_updown = 1;
	}
	if(move_updown){
		if(KaiwaWork->layout == KAIWA_LAYOUT_1x1){
			if(KaiwaWork->cursor_ypos == KaiwaWork->cursor_ylimit){
				KaiwaWork->cursor_xpos = 2;
			}else{
				KaiwaWork->cursor_xpos = 0;
			}
			return 1;
		}
		if(KaiwaWork->cursor_xpos >= KaiwaWork->cursor_xlimit){
			KaiwaWork->cursor_xpos = KaiwaWork->cursor_xlimit - 1;
		}
		return 1;
	}

	if(sys.Repeat & L_KEY){
		if(--(KaiwaWork->cursor_xpos) < 0){
			if(KaiwaWork->cursor_ypos == KaiwaWork->cursor_ylimit){
				KaiwaWork->cursor_xpos = 2;
			}else{
				KaiwaWork->cursor_xpos = KaiwaWork->cursor_xlimit - 1;
			}
		}
		return 1;
	}
	if(sys.Repeat & R_KEY){
		if(KaiwaWork->cursor_ypos == KaiwaWork->cursor_ylimit){
			if(++(KaiwaWork->cursor_xpos) > 2){
				KaiwaWork->cursor_xpos = 0;
			}
		}else{
			if(++(KaiwaWork->cursor_xpos) >= KaiwaWork->cursor_xlimit){
				KaiwaWork->cursor_xpos = 0;
			}
		}
		return 1;
	}
	return 0;
}
/***********************************************************************
**	矩形位置計算
**
**  戻り値  1 ... 矩形位置変更あり  0 ... 変更なし
***********************************************************************/
static u8 get_square_pos(void)
{
	u8 move_LR, move_UD;

	move_LR = 0;

	// メニュー選択時
	if(KaiwaWork->group_selmenu_flg){
		if(sys.Repeat & U_KEY){
			if(--(KaiwaWork->group_col) < 1){
				KaiwaWork->group_col = 3;
			}
			return 1;
		}
		if(sys.Repeat & D_KEY){
			if(++(KaiwaWork->group_col) > 3){
				KaiwaWork->group_col = 1;
			}
			return 1;
		}
	// あいうえおモード時
	}else if(KaiwaWork->select_mode == KAIWA_SEL_CHAR){
		move_UD = 0;
		if(sys.Repeat & U_KEY){
			if(--(KaiwaWork->group_col) < 0){
				KaiwaWork->group_col = 3;
			}
			move_UD = 1;
		}else if(sys.Repeat & D_KEY){
			if(++(KaiwaWork->group_col) > 3){
				KaiwaWork->group_col = 0;
			}
			move_UD = 1;
		}
		if(move_UD){
			adjust_square_row();
			return 1;
		}
	// カテゴリモード時
	}else{

		move_UD = 0;

		KaiwaWork->scroll_height = 0;
		if(sys.Repeat & U_KEY){
			if(KaiwaWork->group_col){
				KaiwaWork->group_col--;
			}else{
				return 0;
			}
			if(KaiwaWork->group_col < KaiwaWork->group_base_col){
				KaiwaWork->scroll_height = -1;
			}
			move_UD = 1;
		}else if(sys.Repeat & D_KEY){
			if(KaiwaWork->group_col < (KaiwaWork->category_max_col - 1)){
				KaiwaWork->group_col++;
			}else{
				return 0;
			}
			if(KaiwaWork->group_col > (KaiwaWork->group_base_col + 3)){
				KaiwaWork->scroll_height = 1;
			}
			move_UD = 1;
		}
		if(move_UD){
			if(KaiwaWork->scroll_height){ return 0; } // スクロール中は位置計算しない
			adjust_square_row();
			return 1;
		}
	}

	if(sys.Repeat & L_KEY){
		if(KaiwaWork->group_row){
			KaiwaWork->group_row--;
		}else{
			KaiwaWork->group_row = KaiwaWork->group_max_row[KaiwaWork->group_col];
		}
		move_LR = 1;
	}else if(sys.Repeat & R_KEY){
		if(KaiwaWork->group_selmenu_flg ||
		   KaiwaWork->group_row == KaiwaWork->group_max_row[KaiwaWork->group_col])
		{
			KaiwaWork->group_row = 0;
		}else{
			KaiwaWork->group_row++;
		}
		move_LR = 1;
	}

	if(move_LR){
		u8 before_sel_menu = KaiwaWork->group_selmenu_flg;
		KaiwaWork->group_selmenu_flg = (KaiwaWork->group_row == KaiwaWork->group_max_row[KaiwaWork->group_col]);
		if(KaiwaWork->group_selmenu_flg){
			KaiwaWork->group_col -= KaiwaWork->group_base_col;
			if(KaiwaWork->group_col == 0){
				KaiwaWork->group_col = 1;
				KaiwaWork->group_row = KaiwaWork->group_max_row[KaiwaWork->group_col];
			}
		}else if(before_sel_menu){
			KaiwaWork->group_col += KaiwaWork->group_base_col;
			if(KaiwaWork->group_row){
				KaiwaWork->group_row = KaiwaWork->group_max_row[KaiwaWork->group_col] - 1;
			}
		}
		return 1;
	}

	return 0;
}
/***********************************************************************
**	矩形Ｙ座標を正しい位置に補正
***********************************************************************/
static void adjust_square_row(void)
{
	if(KaiwaWork->group_row >= KaiwaWork->group_max_row[KaiwaWork->group_col]){
		KaiwaWork->group_row = KaiwaWork->group_max_row[KaiwaWork->group_col] - 1;
	}
}
/***********************************************************************
**	現在カーソルが選択している番号を計算
***********************************************************************/
static void calc_select_group_num(void)
{
	if(KaiwaWork->select_mode == KAIWA_SEL_CATEGORY){
		KaiwaWork->select_group_num = KaiwaWork->category_tbl[KaiwaWork->group_col][KaiwaWork->group_row];
	}else{
		KaiwaWork->select_group_num = KaiwaWork->charcode_tbl[KaiwaWork->group_col][KaiwaWork->group_row];
	}
}
/***********************************************************************
**	単語選択ウィンドウ位置計算
**
**  戻り値  1 ... 矩形位置変更あり  0 ... 変更なし
***********************************************************************/
static u8 get_wordcursor_pos(void)
{
	u8 updown_move = 0;

	KaiwaWork->scroll_height = 0;

	if(sys.Repeat & U_KEY){
		if(KaiwaWork->word_col){
			KaiwaWork->word_col--;
		}else{
			return 0;
		}
		if(KaiwaWork->word_col < KaiwaWork->word_base_col){
			KaiwaWork->scroll_height = -1;
			return 0;
		}
		updown_move = 1;
	}else if(sys.Repeat & D_KEY){
		if(KaiwaWork->word_col < (KaiwaWork->word_max_col - 1)){
			KaiwaWork->word_col++;
		}else{
			return 0;
		}
		if(KaiwaWork->word_col >= (KaiwaWork->word_base_col + KAIWA_WORDWIN_COL)){
			KaiwaWork->scroll_height = 1;
			return 0;
		}
		updown_move = 1;
	}
	if(updown_move){
		adjust_wordcursor_row();
		return 1;
	}


	if(sys.Repeat & L_KEY){
		if(--(KaiwaWork->word_row) < 0){
			KaiwaWork->word_row = KaiwaWork->word_max_row[KaiwaWork->word_col] - 1;
		}
		return 1;
	}

	if(sys.Repeat & R_KEY){
		if(++(KaiwaWork->word_row) >= KaiwaWork->word_max_row[KaiwaWork->word_col]){
			KaiwaWork->word_row = 0;
		}
		return 1;
	}

	if(sys.Trg & START_BUTTON){
		if(KaiwaWork->word_base_col){
			KaiwaWork->scroll_height = -(KaiwaWork->word_base_col);
			if(KaiwaWork->scroll_height < -(KAIWA_WORDWIN_COL)){
				KaiwaWork->scroll_height = -(KAIWA_WORDWIN_COL);
			}
		}
		KaiwaWork->word_col += KaiwaWork->scroll_height;
		KaiwaWork->scroll_speed = KAIWA_SCROLL_SPEED_FAST;
		return 0;
	}

	if(sys.Trg & SELECT_BUTTON){
		if(KaiwaWork->word_base_col < (KaiwaWork->word_max_col - KAIWA_WORDWIN_COL)){
			KaiwaWork->scroll_height = (KaiwaWork->word_max_col - KAIWA_WORDWIN_COL) - KaiwaWork->word_base_col;
			if(KaiwaWork->scroll_height > KAIWA_WORDWIN_COL){
				KaiwaWork->scroll_height = KAIWA_WORDWIN_COL;
			}
		}
		KaiwaWork->word_col += KaiwaWork->scroll_height;
		KaiwaWork->scroll_speed = KAIWA_SCROLL_SPEED_FAST;
		return 0;
	}

	return 0;
}
/***********************************************************************
**	単語選択カーソルを正しい位置に補正
***********************************************************************/
static void adjust_wordcursor_row(void)
{
	if(KaiwaWork->word_row >= KaiwaWork->word_max_row[KaiwaWork->word_col]){
		KaiwaWork->word_row = KaiwaWork->word_max_row[KaiwaWork->word_col] - 1;
	}
}
/***********************************************************************
**	編集中の文字コードを全て削除
**
**  戻り値  1 ... カーソル位置変更あり  0 ... 変更なし
***********************************************************************/
static void clear_code_work(void)
{
	u16 i;
	for(i = 0; i < KaiwaWork->code_size; i++){
		set_code(i, KAIWA_CODE_BLANK);
	}
}
/***********************************************************************
**	編集中の文字コードを保存
***********************************************************************/
static void save_code(void)
{
	u16 i;

	for(i = 0; i < KaiwaWork->code_size; i++){
		KaiwaWork->code_addr[i] = KaiwaWork->code_work[i];
	}
}
/***********************************************************************
**	単語決定＆メインウィンドウに反映
**  戻り値  1 ... 正常終了   0 ... 文字制限オーバー
***********************************************************************/
static u8 set_dicide_word(void)
{
	u16 code;

	code = KaiwaWork->word_code_tbl[KaiwaWork->word_col][KaiwaWork->word_row];

	if(KaiwaWork->limit7_flg &&
	   KaiwaWork->limitword_cnt[KaiwaWork->cursor_ypos] >= 2 &&
	   KaiwaCodeLen(code) == 7 )
	{
		return 0;
	}

	set_code(KaiwaWork->edit_word_no, code);
	WriteEditArea();

	return 1;
}
/***********************************************************************
**	会話コードワークを初期化
***********************************************************************/
static void init_codework(void)
{
	u16 x, y, cnt, len;

	cnt = 0;
	for(y = 0; y < KaiwaWork->cursor_ylimit; y++){
		KaiwaWork->limitword_cnt[y] = 0;
		for(x = 0; x < KaiwaWork->cursor_xlimit; x++){
			KaiwaWork->code_work[cnt] = KaiwaWork->code_addr[cnt];
			len = KaiwaCodeLen(KaiwaWork->code_work[cnt]);
			len = (len > 5)? len - 5 : 0;
			if(len == 2){KaiwaWork->limitword_cnt[y]++; }
			KaiwaWork->cursor_xofs[y][x] = len;
			cnt++;
		}
	}
}
/***********************************************************************
**	会話コードワークに値をセット
**  num    番号
**  code   会話コード
***********************************************************************/
static void set_code(u16 num, u16 code)
{
	u16 x, y, old_len, new_len;

	y = num / KaiwaWork->cursor_xlimit;
	x = num % KaiwaWork->cursor_xlimit;

	old_len = KaiwaCodeLen(KaiwaWork->code_work[num]);
	new_len = KaiwaCodeLen(code);

	if(old_len == 7 && new_len != 7){
		KaiwaWork->limitword_cnt[y]--;
	}
	if(old_len != 7 && new_len == 7){
		KaiwaWork->limitword_cnt[y]++;
	}

	new_len = (new_len > 5)? (new_len-5) : 0;
	KaiwaWork->cursor_xofs[y][x] = new_len;

	KaiwaWork->code_work[num] = code;
}
/***********************************************************************
**	初期状態から変更された単語数をカウント
**  戻り値  変更された単語数
***********************************************************************/
static u8 count_changed_word(void)
{
	u16 i, cnt = 0;
	for(i = 0; i < KaiwaWork->code_size; i++){
		u8 *cp1, *cp2;

		KaiwaCodeToWord(KaiwaWork->word_buf, KaiwaWork->code_addr[i], 0);
		KaiwaCodeToWord(KaiwaWork->word_buf2, KaiwaWork->code_work[i], 0);
		cp1 = KaiwaWork->word_buf;
		cp2 = KaiwaWork->word_buf2;

		while(*cp1 == *cp2){
			if(*cp1 == EOM_){ break; }
			cp1++;
			cp2++;
		}
		if(*cp1 != *cp2){
			cnt++;
		}
	}
	return cnt;
}
/***********************************************************************
**	領域全てがブランクになっているかチェック
**  戻り値  1:全てブランク   0:何か入力されている
***********************************************************************/
static u8 check_all_blank(void)
{
	u16 i;
	for(i = 0; i < KaiwaWork->code_size; i++){
		if(KaiwaWork->code_work[i] != KAIWA_CODE_BLANK){
			return 0;
		}
	}
	return 1;
}

/***********************************************************************
**	ふしぎなできごとキーワードかどうかチェック
***********************************************************************/
static u8 check_fushigi(void)
{
	u8 *cp1, *cp2;
	u16 i;
	for(i = 0; i < NELEMS(FUSHIGI_KEYWORD); i++){
		KaiwaCodeToWord(KaiwaWork->word_buf, KaiwaWork->code_work[i], 0);
		KaiwaCodeToWord(KaiwaWork->word_buf2, FUSHIGI_KEYWORD[i], 0);
		cp1 = KaiwaWork->word_buf;
		cp2 = KaiwaWork->word_buf2;

		while(*cp1 != EOM_ && *cp2 != EOM_){
			if(*cp1++ != *cp2++){ return 0; }
		}
		if(*cp1 != EOM_ || *cp2 != EOM_){ return 0; }
	}

	return 1;

}
/***********************************************************************
**	そだて名人の「いいことば」に該当するかチェック
**  return  0:該当しない  1～5:該当した番号
***********************************************************************/
static u8 check_niceword(void)
{
	u8 *cp1, *cp2;
	u16 i;

	for(i = 0; i < NICEWORD_MAX; i++)
	{
		cp1 = KaiwaCodeToWord(KaiwaWork->wordline_buf, KaiwaWork->code_work[0], 0);
		*cp1++ = spc_;
		KaiwaCodeToWord(cp1, KaiwaWork->code_work[1], 0);

		cp1 = KaiwaCodeToWord(KaiwaWork->wordline_buf2, NICEWORD_KEYWORD[i][0], 0);
		*cp1++ = spc_;
		KaiwaCodeToWord(cp1, NICEWORD_KEYWORD[i][1], 0);

		cp1 = KaiwaWork->wordline_buf;
		cp2 = KaiwaWork->wordline_buf2;

		while(*cp1 != EOM_ && *cp2 != EOM_){
			if(*cp1++ != *cp2++){ break; }
		}
		if(*cp1 != EOM_ || *cp2 != EOM_){ continue; }

		return i + 1;
	}
	return 0;
}
/***********************************************************************
**	スクリプト用のバッファに最新流行語、新流行語をコピーする
***********************************************************************/
static void set_popword_buffer(void)
{
	u8 *cp;

	cp = KaiwaCodeToWord(StrTempBuffer1, KaiwaWork->pop_word[0], 0);
	*cp++ = spc_;
	KaiwaCodeToWord(cp, KaiwaWork->pop_word[1], 0);
}
/***********************************************************************
**	メニュー表示をクリア
***********************************************************************/
static void menu_clear(void)
{
	SePlay(SE_SELECT);
	NMenuScreenClear();
}
