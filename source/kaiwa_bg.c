/***********************************************************************
**	簡易会話（ＢＧ操作）
**
**	Masao Taya
**
***********************************************************************/

#include "kaiwa_com.h"
#include "kaiwa_bg.dat"
#include "message.h"

/*============================================*/
/*	スクロールＢＧの VOFFSET 基準値           */
/*============================================*/
#define KAIWA_SCROLLBG_BASE_VOFS   (8)
#define KAIWA_SCROLLBG_BASE_BLOCK  (1)

/*============================================*/
/*	画像データ転送設定                        */
/*============================================*/
#define MAP_ADDR(b)   (BG_VRAM + (b) * 0x800)
#define CHAR_ADDR(b)  (BG_VRAM + (b) * 0x4000)

#define KAIWA_MENUBG_MAP_BLOCK   (14)
#define KAIWA_MENUBG_CHAR_BLOCK  (0)
#define KAIWA_MENUBG_MAP_ADDR    (MAP_ADDR(KAIWA_MENUBG_MAP_BLOCK))
#define KAIWA_MENUBG_CHAR_ADDR   (CHAR_ADDR(KAIWA_MENUBG_CHAR_BLOCK) + 0x6000)
#define KAIWA_MENUBG_PAL          (PA_BG0)
#define KAIWA_CAPTION_PAL         (PA_BG1)

#define KAIWA_SCROLLBG_MAP_BLOCK   (15)
#define KAIWA_SCROLLBG_CHAR_BLOCK  (0)
#define KAIWA_SCROLLBG_MAP_ADDR    (MAP_ADDR(KAIWA_SCROLLBG_MAP_BLOCK))
#define KAIWA_SCROLLBG_CHAR_ADDR   (CHAR_ADDR(KAIWA_SCROLLBG_CHAR_BLOCK) + 0x6800)
#define KAIWA_SCROLLBG_PAL         (PA_BG2)
#define KAIWA_SCROLLBG_DISABLE_PAL (PA_BG3)
#define KAIWA_DISABLE_BCOL         (0x7fff)
#define KAIWA_DISABLE_FCOL         (0x6f5b)//(0x1084)
#define KAIWA_DISABLE_SCOL         (0x739c)


#define KAIWA_FRAMEBG_MAP_BLOCK   (26)
#define KAIWA_FRAMEBG_CHAR_BLOCK  (2)
#define KAIWA_FRAMEBG_MAP_ADDR    (MAP_ADDR(KAIWA_FRAMEBG_MAP_BLOCK))
#define KAIWA_FRAMEBG_CHAR_ADDR   (CHAR_ADDR(KAIWA_FRAMEBG_CHAR_BLOCK))
#define KAIWA_FRAMEBG_PAL         (PA_BG4)

#define GROUPMODE_X  (24)
#define GROUPMODE_Y  (9)
#define GROUPMODE_WIDTH   (6)
#define GROUPMODE_HEIGHT  (3)



/*============================================*/
/*	グラデーションさせる色番号等の情報        */
/*============================================*/
#define KAIWA_WINGRAD_BEGIN  (17)  // グラデーションさせるの色番号（先頭）
#define KAIWA_WINGRAD_END    (20) // グラデーション後の色番号（先頭）

/*==============================================
==	プロトタイプ
==============================================*/
static void draw_kaiwa_main_frame(void);
static void copy_categoryname_line(u8 *buf, u16 col);
static void write_scroll_bg(u8 *src, u16 x, u16 y);
static u8 trans_rect(void);
static void setrect_groupmenu_draw(void);
static void setrect_groupmenu_erase(void);
static void setrect_groupmainV_draw(void);
static void setrect_groupmainV_erase(void);
static void setrect_groupmainH_draw(void);
static void setrect_groupmainH_erase(void);
static void setrect_group_to_word_1(void);
static void setrect_group_to_word_2(void);
static void setrect_word_to_group_1(void);
static void setrect_word_to_group_2(void);
static void setrect_word_erase(void);
static void init_win_gradation(void);
static void prog_win_gradation(s8 step);
static void clear_kaiwaword_line(u16 col);

/***********************************************************************
**	ＢＧ初期化
***********************************************************************/
void KaiwaBGInit(void)
{
	*(vu16 *)REG_BG0HOFS = 0;
	*(vu16 *)REG_BG0VOFS = 0;
	*(vu16 *)REG_BG1HOFS = 0;
	*(vu16 *)REG_BG1VOFS = 0;
	*(vu16 *)REG_BG2VOFS = 0;
	*(vu16 *)REG_BG2HOFS = 0;
	*(vu16 *)REG_BG3HOFS = 0;
	*(vu16 *)REG_BG3VOFS = KAIWA_SCROLLBG_BASE_VOFS;

// ＢＧ０（ウィンドウ）
	*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_0
	| 31 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF;

// ＢＧ１（フレーム）
	*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_1
	| KAIWA_FRAMEBG_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
	| KAIWA_FRAMEBG_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 ;


	// 未圧縮の形で参照していたマップデータを圧縮したため
	// ワークに展開する
	LZ77UnCompWram((void*)frame_bg_Map, KaiwaWork->frame_bg_Map);
	LZ77UnCompWram((void*)frame_2x2_Map, KaiwaWork->frame_2x2_Map);
	LZ77UnCompWram((void*)frame_3x2_Map, KaiwaWork->frame_3x2_Map);
	LZ77UnCompWram((void*)frame_3x3_Map, KaiwaWork->frame_3x3_Map);
	LZ77UnCompWram((void*)frame_1x1_Map, KaiwaWork->frame_1x1_Map);
	LZ77UnCompWram((void*)frame_2x1_Map, KaiwaWork->frame_2x1_Map);
	LZ77UnCompWram((void*)frame_selwin_Map, KaiwaWork->frame_selwin_Map);
	LZ77UnCompWram((void*)frame_selwinsub_Map, KaiwaWork->frame_selwinsub_Map);


	LZ77UnCompVram((void*)frame_Character, (void*)KAIWA_FRAMEBG_CHAR_ADDR);
	BoxTransMap((u16*)KAIWA_FRAMEBG_MAP_ADDR, 0, 0, KaiwaWork->frame_bg_Map, 0, 0, 30, 20, 30);
	PaletteWorkSet(frame_Palette, KAIWA_FRAMEBG_PAL, 0x40);


// ＢＧ２（固定文字）
	*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_2
	| KAIWA_MENUBG_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
	| KAIWA_MENUBG_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 ;
	DIV_DMACLEAR(3, 0, KAIWA_MENUBG_MAP_ADDR, 0x800, 16);
	DIV_DMAARRAYCOPY(3, menu_Character, KAIWA_MENUBG_CHAR_ADDR, 16);
	LZ77UnCompVram((void*)menu_clear_Map, (void*)KAIWA_MENUBG_MAP_ADDR);

	PaletteWorkSet(menu_Palette, KAIWA_MENUBG_PAL, 0x20);
	PaletteWorkSet(caption_Palette, KAIWA_CAPTION_PAL, 0x20);

// ＢＧ３（スクロール文字）
	*(vu16 *)REG_BG3CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_3
	| KAIWA_SCROLLBG_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
	| KAIWA_SCROLLBG_CHAR_BLOCK << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 ;
	DIV_DMACLEAR(3, 0, KAIWA_SCROLLBG_MAP_ADDR, 0x800, 32);
	PaletteWorkSet(scrollbg_Palette, KAIWA_SCROLLBG_PAL, 0x20);

	PaletteWork[KAIWA_SCROLLBG_DISABLE_PAL + 15] = KAIWA_DISABLE_BCOL;
	PaletteWork[KAIWA_SCROLLBG_DISABLE_PAL + 1] = KAIWA_DISABLE_FCOL;
	PaletteWork[KAIWA_SCROLLBG_DISABLE_PAL + 8] = KAIWA_DISABLE_SCOL;
	PaletteWorkTrans[KAIWA_SCROLLBG_DISABLE_PAL + 15] = KAIWA_DISABLE_BCOL;
	PaletteWorkTrans[KAIWA_SCROLLBG_DISABLE_PAL + 1] = KAIWA_DISABLE_FCOL;
	PaletteWorkTrans[KAIWA_SCROLLBG_DISABLE_PAL + 8] = KAIWA_DISABLE_SCOL;

// 
	KaiwaWork->trans_rect_flag = 0;
	init_win_gradation();
	draw_kaiwa_main_frame();
	DrawKaiwaMsg(KAIWA_MSG_INFO);
	WriteEditArea();


	*(vu16 *)REG_BLDCNT = 0;
}
/***********************************************************************
**	ウィンドウのグラデーション用色情報テーブルを初期化
***********************************************************************/
#define GET_R(c) ((c)&0x1f)
#define GET_G(c) (((c)>>5)&0x1f)
#define GET_B(c) (((c)>>10)&0x1f)
#define TO_INT(f)  (((f)>>8)&0x1f)
#define RGB(r,g,b) ((TO_INT(b)<<10)|(TO_INT(g)<<5)|(TO_INT(r)))
static void init_win_gradation(void)
{
	u16  i, j, s;
	s32  b[3], e[3], step[3];
//	static s32  b[3] = {}, e[3] = {}, step[3] = {};

	for(i = 0; i < KAIWA_WINGRAD_CNT; i++){
		b[0] = (GET_R(frame_Palette[KAIWA_WINGRAD_BEGIN + i]) << 8);
		e[0] = (GET_R(frame_Palette[KAIWA_WINGRAD_END + i]) << 8);
		b[1] = (GET_G(frame_Palette[KAIWA_WINGRAD_BEGIN + i]) << 8);
		e[1] = (GET_G(frame_Palette[KAIWA_WINGRAD_END + i]) << 8);
		b[2] = (GET_B(frame_Palette[KAIWA_WINGRAD_BEGIN + i]) << 8);
		e[2] = (GET_B(frame_Palette[KAIWA_WINGRAD_END + i]) << 8);

		for(j = 0; j < 3; j++){
			step[j] = (e[j] - b[j]) / (KAIWA_WINGRAD_STEP - 1);
		}

		for(s = 0; s < (KAIWA_WINGRAD_STEP - 1); s++){
			KaiwaWork->grad_tbl[i][s] = RGB(b[0], b[1], b[2]);
			for(j = 0; j < 3; j++){
				b[j] += step[j];
			}
		}
		KaiwaWork->grad_tbl[i][s] = RGB(e[0], e[1], e[2]);
	}
	KaiwaWork->grad_step = 0;
}
/***********************************************************************
**	ウィンドウのグラデーション実行
**  step ... 段階の増減値
***********************************************************************/
static void prog_win_gradation(s8 step)
{
	u16 i;

	KaiwaWork->grad_step += step;

	for(i = 0; i < KAIWA_WINGRAD_CNT; i++){
		PaletteWork[KAIWA_FRAMEBG_PAL+KAIWA_WINGRAD_BEGIN+i]
			= KaiwaWork->grad_tbl[i][KaiwaWork->grad_step];
		PaletteWorkTrans[KAIWA_FRAMEBG_PAL+KAIWA_WINGRAD_BEGIN+i]
			= KaiwaWork->grad_tbl[i][KaiwaWork->grad_step];
	}
}
/***********************************************************************
**	グラデーションポインタをリセット
***********************************************************************/
static void reset_win_gradation(void)
{
	KaiwaWork->grad_step = 0;
	prog_win_gradation(0);
}
/***********************************************************************
**	メッセージとウィンドウ枠を描画
**
**  type  メッセージタイプ（enum KAIWA_MSG)
***********************************************************************/
void DrawKaiwaMsg(u8 type)
{
	NMenuContextChange(PASOBOXMENU_TYPE);

	if(type==KAIWA_MSG_HIDE){
		NMenuBoxClear(KAIWA_MSGWIN_X1, KAIWA_MSGWIN_Y1, KAIWA_MSGWIN_X2, KAIWA_MSGWIN_Y2);
		return;
	}

	NMenuWinBoxWrite(KAIWA_MSGWIN_X1, KAIWA_MSGWIN_Y1, KAIWA_MSGWIN_X2, KAIWA_MSGWIN_Y2);
//	NMenuMsgWrite(KaiwaWork->spc_msg, KAIWA_MSG_X, KAIWA_MSG_Y);
//	NMenuMsgWrite(KaiwaWork->spc_msg, KAIWA_MSG_X, KAIWA_MSG_Y+2);
//	NMenuBoxWrite(KAIWA_MSGWIN_X1, KAIWA_MSGWIN_Y1, KAIWA_MSGWIN_X2, KAIWA_MSGWIN_Y2);

	switch(type){
	case KAIWA_MSG_INFO:
		NMenuMsgWrite(KaiwaWork->info_msg1, KAIWA_MSG_X, KAIWA_MSG_Y);
		NMenuMsgWrite(KaiwaWork->info_msg2, KAIWA_MSG_X, KAIWA_MSG_Y+2);
		break;

	case KAIWA_MSG_KAKUNIN:
		NMenuMsgWrite(KaiwaWork->kakunin_msg1, KAIWA_MSG_X, KAIWA_MSG_Y);
		NMenuMsgWrite(KaiwaWork->kakunin_msg2, KAIWA_MSG_X, KAIWA_MSG_Y+2);
		break;

	case KAIWA_MSG_ERASE:
		NMenuMsgWrite(KaiwaMsg0, KAIWA_MSG_X, KAIWA_MSG_Y);
		NMenuMsgWrite(KaiwaMsg1, KAIWA_MSG_X, KAIWA_MSG_Y+2);
		break;

	case KAIWA_MSG_YAMERU:
		switch(KaiwaWork->mode){
		case KAIWA_MODE_POPULAR:
			NMenuMsgWrite(KaiwaMsg11, KAIWA_MSG_X, KAIWA_MSG_Y);
			break;
		case KAIWA_MODE_MAIL:
			NMenuMsgWrite(KaiwaMsg12, KAIWA_MSG_X, KAIWA_MSG_Y);
			break;
		default:
			NMenuMsgWrite(KaiwaMsg2, KAIWA_MSG_X, KAIWA_MSG_Y);
			break;
		}
		break;

	case KAIWA_MSG_YAMERU_WARN:
		NMenuMsgWrite(KaiwaMsg3, KAIWA_MSG_X, KAIWA_MSG_Y);
		NMenuMsgWrite(KaiwaMsg4, KAIWA_MSG_X, KAIWA_MSG_Y+2);
		break;

	case KAIWA_MSG_KETTEI_WARN:
		NMenuMsgWrite(KaiwaMsg5, KAIWA_MSG_X, KAIWA_MSG_Y);
		break;

	case KAIWA_MSG_ERASE_WARN:
		NMenuMsgWrite(KaiwaMsg6, KAIWA_MSG_X, KAIWA_MSG_Y);
		break;

	case KAIWA_MSG_1WORD:
		NMenuMsgWrite(KaiwaMsg7, KAIWA_MSG_X, KAIWA_MSG_Y);
		NMenuMsgWrite(KaiwaMsg8, KAIWA_MSG_X, KAIWA_MSG_Y+2);
		break;

	case KAIWA_MSG_POP_WARN:
		NMenuMsgWrite(KaiwaMsg9, KAIWA_MSG_X, KAIWA_MSG_Y);
		break;

	case KAIWA_MSG_POP_BLANK_WARN:
		NMenuMsgWrite(KaiwaMsg10, KAIWA_MSG_X, KAIWA_MSG_Y);
		break;
	}
}
/***********************************************************************
**	モード別のキャプションを描画
***********************************************************************/
void KaiwaBG_DrawCaption(u8 mode)
{
	const u8 *cp;
	u16 ofs;

	switch(mode){
	case KAIWA_MODE_SELF: cp = KaiwaCaption_self; break;
	case KAIWA_MODE_BATTLE_START: cp = KaiwaCaption_battle; break;
	case KAIWA_MODE_BATTLE_WON: cp = KaiwaCaption_win; break;
	case KAIWA_MODE_BATTLE_LOST: cp = KaiwaCaption_lose; break;
	case KAIWA_MODE_SONG: cp = KaiwaCaption_song; break;
	case KAIWA_MODE_POPULAR: cp = KaiwaCaption_pop; break;

	case KAIWA_MODE_HAGAKI:
	case KAIWA_MODE_INTERVIEW:
	case KAIWA_MODE_GYMREADER:
	case KAIWA_MODE_FIELDBATTLE:
	case KAIWA_MODE_CONTEST:
	case KAIWA_MODE_TOWER:
		cp = KaiwaCaption_interview; break;
		break;

	case KAIWA_MODE_NICEWORD:
		cp = KaiwaCaption_niceword; break;

	default:
		cp = NULL;
		break;
	}

	KaiwaWork->caption_buf[0]=CTRL_;
	KaiwaWork->caption_buf[1]=C_PAL_;
	KaiwaWork->caption_buf[2]=KAIWA_CAPTION_PAL>>4;
	PM_strclear(KaiwaWork->caption_buf+3, spc_, 30);

	if(cp != NULL){
		ofs = (30 - PM_strlen(cp)) / 2;
		ofs += 3; // 制御コード分

		cp = PM_strcpy(KaiwaWork->caption_buf+ofs, cp);
		*((u8*)cp) = spc_;
	}

	NMenuContextChange(KAIWA2_TYPE);
	NMenuMsgWrite(KaiwaWork->caption_buf, 0, 0);
	NMenuContextChange(PASOBOXMENU_TYPE);
}
/***********************************************************************
**	会話編集用のメインフレームを描画
***********************************************************************/
static void draw_kaiwa_main_frame(void)
{
	switch(KaiwaWork->layout){
	case KAIWA_LAYOUT_2x2:
		BoxTransMap((u16*)KAIWA_FRAMEBG_MAP_ADDR, KAIWA_2x2FRAME_X, KAIWA_2x2FRAME_Y,
			KaiwaWork->frame_2x2_Map, 0, 0, KAIWA_2x2FRAME_WIDTH, KAIWA_2x2FRAME_HEIGHT, KAIWA_2x2FRAME_WIDTH);
		break;

	case KAIWA_LAYOUT_2x2B:
		BoxTransMap((u16*)KAIWA_FRAMEBG_MAP_ADDR, KAIWA_2x2B_FRAME_X, KAIWA_2x2B_FRAME_Y,
			KaiwaWork->frame_2x2_Map, 0, 0, KAIWA_2x2FRAME_WIDTH, KAIWA_2x2FRAME_HEIGHT, KAIWA_2x2FRAME_WIDTH);
		break;

	case KAIWA_LAYOUT_3x2:
		BoxTransMap((u16*)KAIWA_FRAMEBG_MAP_ADDR, KAIWA_3x2FRAME_X, KAIWA_3x2FRAME_Y,
			KaiwaWork->frame_3x2_Map, 0, 0, KAIWA_3x2FRAME_WIDTH, KAIWA_3x2FRAME_HEIGHT, KAIWA_3x2FRAME_WIDTH);
		break;

	case KAIWA_LAYOUT_3x3:
		BoxTransMap((u16*)KAIWA_FRAMEBG_MAP_ADDR, KAIWA_3x3FRAME_X, KAIWA_3x3FRAME_Y,
			KaiwaWork->frame_3x3_Map, 0, 0, KAIWA_3x3FRAME_WIDTH, KAIWA_3x3FRAME_HEIGHT, KAIWA_3x3FRAME_WIDTH);
		break;

	case KAIWA_LAYOUT_1x1:
		BoxTransMap((u16*)KAIWA_FRAMEBG_MAP_ADDR, KAIWA_1x1FRAME_X, KAIWA_1x1FRAME_Y,
			KaiwaWork->frame_1x1_Map, 0, 0, KAIWA_1x1FRAME_WIDTH, KAIWA_1x1FRAME_HEIGHT, KAIWA_1x1FRAME_WIDTH);
		break;

	case KAIWA_LAYOUT_2x1:
		BoxTransMap((u16*)KAIWA_FRAMEBG_MAP_ADDR, KAIWA_2x1FRAME_X, KAIWA_2x1FRAME_Y,
			KaiwaWork->frame_2x1_Map, 0, 0, KAIWA_2x1FRAME_WIDTH, KAIWA_2x1FRAME_HEIGHT, KAIWA_2x1FRAME_WIDTH);
		break;
	}
}
/***********************************************************************
**	編集中の会話文を描画
***********************************************************************/
static void draw_kaiwa_sub(u16 yofs, u16 xofs);

void WriteEditArea(void)
{
	NMenuContextChange(KAIWA2_TYPE);

	switch(KaiwaWork->layout){
	case KAIWA_LAYOUT_2x2:
		draw_kaiwa_sub(KAIWA_2x2FRAME_Y+1, KAIWA_2x2FRAME_X+3);
		break;

	case KAIWA_LAYOUT_2x2B:
		draw_kaiwa_sub(KAIWA_2x2B_FRAME_Y+1, KAIWA_2x2B_FRAME_X+3);
		break;

	case KAIWA_LAYOUT_3x2:
		draw_kaiwa_sub(KAIWA_3x2FRAME_Y+1, KAIWA_3x2FRAME_X+3);
		break;

	case KAIWA_LAYOUT_3x3:
		draw_kaiwa_sub(KAIWA_3x3FRAME_Y+1, KAIWA_3x3FRAME_X+3);
		break;

	case KAIWA_LAYOUT_1x1:
		draw_kaiwa_sub(KAIWA_1x1FRAME_Y+1, KAIWA_1x1FRAME_X+3);
		break;

	case KAIWA_LAYOUT_2x1:
		draw_kaiwa_sub(KAIWA_2x1FRAME_Y+1, KAIWA_2x1FRAME_X+3);
		break;
	}
	NMenuContextChange(PASOBOXMENU_TYPE);
}
static void draw_kaiwa_sub(u16 yofs, u16 xofs)
{
	u16 x, y, xb, yb, c = 0;

	yb = yofs;
	for(y = 0; y < KaiwaWork->cursor_ylimit; y++){
		xb = xofs;
		for(x = 0; x < KaiwaWork->cursor_xlimit; x++){
			if(KaiwaWork->code_work[c] != KAIWA_CODE_BLANK){
				KaiwaCodeToWord(KaiwaWork->word_buf, KaiwaWork->code_work[c],
					KAIWA_WORDAREA_LEN);
				NMenuMsgWrite(KaiwaWork->word_buf, xb, yb);
				xb += (KAIWA_WORDLEN_MAX + KaiwaWork->cursor_xofs[y][x]);
			}else{
				BoxTransMap((u16*)KAIWA_MENUBG_MAP_ADDR, xb, yb, menu_blank_Map, 0, 0, 9, 2, 9);
				xb += KAIWA_WORDLEN_MAX;
			}
			c++;
		}
		yb += 2;
	}
}
//==============================================================
// 確認時の会話文を描画
//==============================================================
static void write_kakuninmsg_sub(u16 x, u16 y);

void WriteEditAreaKakunin(void)
{
	NMenuContextChange(KAIWA2_TYPE);

	switch(KaiwaWork->layout){
	case KAIWA_LAYOUT_2x2:
		write_kakuninmsg_sub(KAIWA_2x2FRAME_Y+1, KAIWA_2x2FRAME_X+3);
		break;

	case KAIWA_LAYOUT_2x2B:
		write_kakuninmsg_sub(KAIWA_2x2B_FRAME_Y+1, KAIWA_2x2B_FRAME_X+3);
		break;

	case KAIWA_LAYOUT_3x2:
		write_kakuninmsg_sub(KAIWA_3x2FRAME_Y+1, KAIWA_3x2FRAME_X+3);
		break;

	case KAIWA_LAYOUT_3x3:
		write_kakuninmsg_sub(KAIWA_3x3FRAME_Y+1, KAIWA_3x3FRAME_X+3);
		break;

	case KAIWA_LAYOUT_1x1:
		write_kakuninmsg_sub(KAIWA_1x1FRAME_Y+1, KAIWA_1x1FRAME_X+3);
		break;

	case KAIWA_LAYOUT_2x1:
		write_kakuninmsg_sub(KAIWA_2x1FRAME_Y+1, KAIWA_2x1FRAME_X+3);
		break;
	}
	NMenuContextChange(PASOBOXMENU_TYPE);
}
static void write_kakuninmsg_sub(u16 yofs, u16 xofs)
{
	u8 *cp, c;
	u8 x, y;
	u16 len;

	c = 0;
	for(y = 0; y < KaiwaWork->cursor_ylimit; y++){
		cp = KaiwaWork->wordline_buf;
		for(x = 0; x < KaiwaWork->cursor_xlimit; x++){
			if(KaiwaWork->code_work[c] != KAIWA_CODE_BLANK){
				cp = KaiwaCodeToWord(cp, KaiwaWork->code_work[c], 0);
				*cp++ = spc_;
			}
			c++;
		}
		len = KaiwaWork->cursor_xlimit * KAIWA_WORDAREA_LEN;
		len -= (cp - KaiwaWork->wordline_buf);
		PM_strclear(cp, spc_, len);
		NMenuMsgWrite(KaiwaWork->wordline_buf, xofs, yofs);
		yofs+=2;
	}

}
/***********************************************************************
** 編集エリアを全消去
***********************************************************************/
void EraseEditArea(void)
{
	u16 y, height, i;

	NMenuContextChange(KAIWA2_TYPE);

	switch(KaiwaWork->layout){
	case KAIWA_LAYOUT_2x2:
		y = KAIWA_2x2FRAME_Y+1;
		height = 2;
		break;

	case KAIWA_LAYOUT_2x2B:
		y = KAIWA_2x2B_FRAME_Y+1;
		height = 2;
		break;

	case KAIWA_LAYOUT_3x2:
		y = KAIWA_3x2FRAME_Y+1;
		height = 2;
		break;

	case KAIWA_LAYOUT_3x3:
		y = KAIWA_3x3FRAME_Y+1;
		height = 3;
		break;

	case KAIWA_LAYOUT_1x1:
		y = KAIWA_1x1FRAME_Y+1;
		height = 1;
		break;

	case KAIWA_LAYOUT_2x1:
		y = KAIWA_2x1FRAME_Y+1;
		height = 1;
		break;

	default:
		return;
	}

	PM_strclear(KaiwaWork->wordline_buf, spc_, 30);
	for(i = 0; i < height; i++)
	{
		NMenuMsgWrite(KaiwaWork->wordline_buf, 0, y);
		y += 2;
	}


	NMenuContextChange(PASOBOXMENU_TYPE);
}

/***********************************************************************
** グループ名を描画
***********************************************************************/
void DrawKaiwaGroupName(void)
{
	NMenuContextChange(KAIWA_TYPE);
	// カテゴリ選択モード
	if(KaiwaWork->select_mode == KAIWA_SEL_CATEGORY){
		u16 y;
		for(y = 0; y < KaiwaWork->category_max_col; y++){
			copy_categoryname_line(KaiwaWork->category_str, y);
			write_scroll_bg(KaiwaWork->category_str, KAIWA_CATEGORY_X, KAIWA_CATEGORY_Y + y*2);
		}
	// あいうえおモード
	}else{
		u8  code, *cp;
		u16 i, j, y;
		for(y = 0; y < 4; y++){
			code = a_ + y * 5;
			cp = KaiwaWork->category_str;
			for(i = 0; i < 2 ; i++){
				for(j = 0; j < 5; j++){
					*cp++ = code++;
				}
				*cp++ = spc_;
				code += ((y != 3)? 15 : 18);
			}
			if(y == 0){
				*cp = ya_; *(cp+1) = yu_; *(cp+2) = yo_;
				*(cp+3) = spc_; *(cp+4) = wa_;
				cp += 5;
			}
			if(y == 1){
				*cp = so_; *(cp+1) = no_; *(cp+2) = ta_;
				cp += 3;
			}
			while(cp < (KaiwaWork->category_str + KAIWA_CATEGORYBUF_SIZE)){
				*cp++ = spc_;
			}
			*cp = EOM_;
			write_scroll_bg(KaiwaWork->category_str, KAIWA_CATEGORY_X, KAIWA_CATEGORY_Y + y*2);
		}
	}
}
/***********************************************************************
** グループ名を再描画（単語選択からの復帰）
***********************************************************************/
void ReDrawKaiwaGroupName(void)
{
	KaiwaScrollBGParamInit();
	if(KaiwaWork->select_mode == KAIWA_SEL_CATEGORY){
		KaiwaWork->scroll_vofs += (KaiwaWork->group_base_col * 16);
	}
	DrawKaiwaGroupName();
}
/***********************************************************************
** スクロールＢＧのオフセット値初期化
***********************************************************************/
void KaiwaScrollBGParamInit(void)
{
	KaiwaWork->scroll_vofs = KAIWA_SCROLLBG_BASE_VOFS;
}
/***********************************************************************
** スクロールＢＧに文字描画
**
**  str   文字列
**  x, y  描画座標
**
***********************************************************************/
static void write_scroll_bg(u8 *str, u16 x, u16 y)
{
	y = (y + KAIWA_SCROLLBG_BASE_BLOCK) & 0x1F;
	NMenuMsgWrite(str, x, y);
}
/***********************************************************************
** １行分のカテゴリ名を整形してバッファにコピー
**
**	buf  コピー先バッファ
**  col  コピーする行
**
***********************************************************************/
static void copy_categoryname_line(u8 *buf, u16 col)
{
	u16 cnt, row;

	cnt = col * 3;
	for(row = 0; row < 3; row++){
		buf = KaiwaCopyCategoryName(buf, KaiwaWork->category_tbl[col][row], KAIWA_CATEGORYLEN_MAX+1);
		if(++cnt >= KaiwaWork->enable_category_cnt){
			u16 i;
			i = (2-row) * (KAIWA_CATEGORYLEN_MAX+1);
			while(i--){
				*buf++ = spc_;
			}
			*buf = EOM_;
			break;
		}
	}
}
/***********************************************************************
** スクロール用ＢＧクリア
***********************************************************************/
void ClearKaiwaScrollBG(void)
{
//	DIV_DMACLEAR(3, 0, KAIWA_SCROLLBG_MAP_ADDR, 0x800, 32);

	u16 i; 
	NMenuContextChange(KAIWA_TYPE);

	for(i = 0; i < 16; i++)
	{
		clear_kaiwaword_line(i);
	}

//	DIV_DMACLEAR(3, 0x4012, KAIWA_SCROLLBG_MAP_ADDR, 0x800, 16);
}
/***********************************************************************
**  単語描画
***********************************************************************/
/* １行 */
static void draw_kaiwaword_line(u16 col)
{
	u16 row;

	clear_kaiwaword_line(col);

	PM_strclear(KaiwaWork->word_buf, spc_, 2);
	if(KaiwaWork->limit7_flg){
		for(row = 0; row < KaiwaWork->word_max_row[col]; row++){
			if(KaiwaCodeLen(KaiwaWork->word_code_tbl[col][row]) == 7){
				NMenuContextChange(KAIWADISABLE_TYPE);
			}else{
				NMenuContextChange(KAIWA_TYPE);
			}
			KaiwaCodeToWord(KaiwaWork->word_buf+2, KaiwaWork->word_code_tbl[col][row], KAIWA_WORDLEN_MAX);
			write_scroll_bg(KaiwaWork->word_buf, KAIWA_WORD_X+row*KAIWA_WORDAREA_LEN, KAIWA_WORD_Y + col*2);
		}
	}else{
		NMenuContextChange(KAIWA_TYPE);
		for(row = 0; row < KaiwaWork->word_max_row[col]; row++){
			KaiwaCodeToWord(KaiwaWork->word_buf+2, KaiwaWork->word_code_tbl[col][row], KAIWA_WORDLEN_MAX);
			write_scroll_bg(KaiwaWork->word_buf, KAIWA_WORD_X+row*KAIWA_WORDAREA_LEN, KAIWA_WORD_Y + col*2);
		}
	}

}
/*  １行クリア  */
static void clear_kaiwaword_line(u16 col)
{
	write_scroll_bg(KaiwaWork->spaceword_buf, KAIWA_WORD_X, KAIWA_WORD_Y + col*2);
}


/* 可視範囲全部 */
void DrawKaiwaWordAll(void)
{
	u16 i, max;

	max = (KaiwaWork->word_max_col < KAIWA_WORDWIN_COL)? KaiwaWork->word_max_col : KAIWA_WORDWIN_COL;
	for(i = 0; i < max; i++){
		draw_kaiwaword_line(KaiwaWork->word_base_col + i);
	}
	while(i < KAIWA_WORDWIN_COL)
	{
		clear_kaiwaword_line(i++);
	}
}
/* スクロール領域 */
void DrawKaiwaWordScroll(void)
{
	u16 col, cnt;

	if(KaiwaWork->scroll_height > 0){
		cnt = KaiwaWork->scroll_height;
		col = KaiwaWork->word_base_col + KAIWA_WORDWIN_COL;
	}else{
		cnt = -(KaiwaWork->scroll_height);
		col = KaiwaWork->word_base_col - cnt;
	}
	while(cnt--){
		draw_kaiwaword_line(col++);
	}
}
/***********************************************************************
** スクロール用のカテゴリ名描画
***********************************************************************/
void DrawKaiwaCategoryName(void)
{
	u16 y, i, max, col;

	NMenuContextChange(KAIWA_TYPE);

	if(KaiwaWork->scroll_height < 0){
		max = -(KaiwaWork->scroll_height);
		col = KaiwaWork->group_base_col - max;
	}else{
		max = KaiwaWork->scroll_height;
		col = KaiwaWork->group_base_col + 4;
	}
	y = KAIWA_CATEGORY_Y + (col * 2);

	for(i = 0; i < max; i++){
		copy_categoryname_line(KaiwaWork->category_str, col);
		write_scroll_bg(KaiwaWork->category_str, KAIWA_CATEGORY_X, y);
		y += 2;
		col++;
	}
}
/***********************************************************************
** スクロール初期化
***********************************************************************/
void KaiwaScrollInit(u8 speed)
{
	KaiwaWork->scroll_end_vofs = (KaiwaWork->scroll_vofs + (KaiwaWork->scroll_height * 16)) & 0xff;
	KaiwaWork->scroll_add = (KaiwaWork->scroll_height < 0)? -(speed) : speed;
}
/***********************************************************************
** スクロール処理
** 戻り値   1 ... 終了  0 ... 継続
***********************************************************************/
u8 KaiwaScroll(void)
{
	KaiwaWork->scroll_vofs += KaiwaWork->scroll_add;
	KaiwaWork->scroll_vofs &= 0xff;
	return KaiwaWork->scroll_vofs == KaiwaWork->scroll_end_vofs;
}
/***********************************************************************
** グループ名選択モードを消去
***********************************************************************/
static void erase_group_mode(void)
{
	BoxTransMap((u16 *)KAIWA_FRAMEBG_MAP_ADDR, GROUPMODE_X, GROUPMODE_Y, 
	KaiwaWork->frame_bg_Map, GROUPMODE_X, GROUPMODE_Y, GROUPMODE_WIDTH, GROUPMODE_HEIGHT, 30);
}
/***********************************************************************
** ウィンドウ描画・消去処理の初期化
***********************************************************************/
void KaiwaDrawWinIni(void)
{
	KaiwaWork->draw_win_prog = 0;
}
/***********************************************************************
** グループ表示枠の描画処理
**
** 戻り値  1 ... 終了  0 ... 継続
***********************************************************************/
u8 KaiwaWin_GroupDraw(void)
{
	switch(KaiwaWork->draw_win_prog){
	case 0:
		setrect_groupmainH_draw();
		KaiwaWork->draw_win_prog++;

	case 1:
		if(trans_rect()){
			setrect_groupmainV_draw();
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 2:
		if(trans_rect()){
			setrect_groupmenu_draw();
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 3:
		if(trans_rect()){
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 4:
//		draw_group_mode();
		KaiwaWork->draw_win_prog++;
		break;

	case 5:
		return 1;
	}
		
	return 0;
}
/***********************************************************************
** グループ表示枠の消去処理
**
** 戻り値  1 ... 終了  0 ... 継続
**
***********************************************************************/
u8 KaiwaWin_GroupErase(void)
{
	switch(KaiwaWork->draw_win_prog){
	case 0:
		erase_group_mode();
		setrect_groupmenu_erase();
		KaiwaWork->draw_win_prog++;

	case 1:
		if(trans_rect()){
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 2:
		setrect_groupmainV_erase();
		KaiwaWork->draw_win_prog++;

	case 3:
		if(trans_rect()){
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 4:
		setrect_groupmainH_erase();
		KaiwaWork->draw_win_prog++;

	case 5:
		if(trans_rect()){
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 6:
		return 1;
	}
	return 0;
}
/***********************************************************************
** グループ表示ウィンドウの最小化
** 戻り値  1 ... 終了  0 ... 継続
***********************************************************************/
u8 MinimizeKaiwaGroupWin(void)
{
	switch(KaiwaWork->draw_win_prog){
	case 0:
		erase_group_mode();
		setrect_groupmainV_erase();
		KaiwaWork->draw_win_prog++;

	case 1:
		if(trans_rect()){
			return 1;
		}
	}
	return 0;
}
/***********************************************************************
** グループ表示ウィンドウの最大化
** 戻り値  1 ... 終了  0 ... 継続
***********************************************************************/
u8 MaxmizeKaiwaGroupWin(void)
{
	switch(KaiwaWork->draw_win_prog){
	case 0:
//		BoxTransMap((u16 *)KAIWA_FRAMEBG_MAP_ADDR, GROUPMODE_X, GROUPMODE_Y, 
//		KaiwaWork->frame_bg_Map, GROUPMODE_X, GROUPMODE_Y, 10, 1, 30);

		setrect_groupmainV_draw();
		KaiwaWork->draw_win_prog++;

	case 1:
		if(trans_rect()){
//			draw_group_mode();
			return 1;
		}
	}
	return 0;
}
/***********************************************************************
** グループ選択ウィンドウから単語選択ウィンドウへの切り替え動作
** 戻り値  1 ... 終了  0 ... 継続
***********************************************************************/
u8 KaiwaWin_GroupToWord(void)
{
	switch(KaiwaWork->draw_win_prog){
	case 0:
		erase_group_mode();
		setrect_groupmenu_erase();
		KaiwaWork->draw_win_prog++;
		break;

	case 1:
		if(trans_rect()){
			setrect_group_to_word_1();
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 2:
		prog_win_gradation(1);
		if(trans_rect()){
			setrect_group_to_word_2();
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 3:
		prog_win_gradation(1);
		if(trans_rect()){
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 4:
		return 1;
	}
	return 0;
}
/***********************************************************************
** 単語選択ウィンドウからグループ選択ウィンドウへの切り替え動作
** 戻り値  1 ... 終了  0 ... 継続
***********************************************************************/
u8 KaiwaWin_WordToGroup(void)
{
	switch(KaiwaWork->draw_win_prog){
	case 0:
		setrect_word_to_group_1();
		KaiwaWork->draw_win_prog++;

	case 1:
		prog_win_gradation(-1);
		if(trans_rect()){
			setrect_word_to_group_2();
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 2:
		prog_win_gradation(-1);
		if(trans_rect()){
			setrect_groupmenu_draw();
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 3:
		if(trans_rect()){
//			draw_group_mode();
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 4:
		return 1;
	}
	return 0;
}
/***********************************************************************
**	単語選択ウィンドウ消去
**
**	戻り値  1 ... 終了  0 ... 継続
***********************************************************************/
u8 KaiwaWin_WordErase(void)
{
	switch(KaiwaWork->draw_win_prog){
	case 0:
		setrect_word_erase();
		KaiwaWork->draw_win_prog++;

	case 1:
		if(trans_rect()){
			KaiwaWork->draw_win_prog++;
		}
		break;

	case 2:
		reset_win_gradation();
		return 1;
	}
	return 0;
}
/***********************************************************************
**	矩形データ更新＆転送
**
**	戻り値  1 ... 終了  0 ... 継続
***********************************************************************/
static u8 trans_rect(void)
{
	if(KaiwaWork->draw_win_roopcnt){
		u16 i;

		for(i = 0; i < KaiwaWork->draw_win_rectcnt; i++){
			ProgTransRect(&(KaiwaWork->trect[i]));
			ProgSrcOrg(&(KaiwaWork->src_org[i]));
		}
		KaiwaWork->trans_rect_flag = 1;
		KaiwaWork->draw_win_roopcnt--;
		return 0;
	}
	return 1;
}
/*======================================================================
==	矩形データセット関数                                              ==
======================================================================*/
/* グループメインウィンドウ表示（横） */
static void setrect_groupmainH_draw(void)
{
	InitTransRect(&(KaiwaWork->trect[0]), 13, 14, 13, 15, -2, 0, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[0]), 0, 0, 0, 0, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[1]), 12, 14, 12, 15,  0, 0, 2, 0);
	InitSrcOrg(&(KaiwaWork->src_org[1]), 30, 0, -2, 0, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[2]), 13, 15, 13, 16, -2, 0, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[2]), 0, 9, 0, 0, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[3]), 12, 15, 12, 16,  0, 0, 2, 0);
	InitSrcOrg(&(KaiwaWork->src_org[3]), 30, 9, -2, 0, KaiwaWork->frame_selwin_Map, 30);

	KaiwaWork->draw_win_rectcnt = 4;
	KaiwaWork->draw_win_roopcnt = 6;
}
/* グループメインウィンドウ消去（横） */
static void setrect_groupmainH_erase(void)
{
	InitTransRect(&(KaiwaWork->trect[0]),  1, 14, 13, 15,  2, 0, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[0]), 0, 0, 0, 0, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[1]), 12, 14, 24, 15,  0, 0, -2, 0);
	InitSrcOrg(&(KaiwaWork->src_org[1]), 18, 0, 2, 0, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[2]), 1, 15, 13, 16, 2, 0, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[2]), 0, 9, 0, 0, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[3]), 12, 15, 24, 16,  0, 0, -2, 0);
	InitSrcOrg(&(KaiwaWork->src_org[3]), 18, 9, 2, 0, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[4]),  1, 14, 1, 15,  0, 0, 2, 0);
	InitSrcOrg(&(KaiwaWork->src_org[4]), 1, 14, 0, 0, KaiwaWork->frame_bg_Map, 30);

	InitTransRect(&(KaiwaWork->trect[5]),  24, 14, 24, 15,  -2, 0, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[5]), 24, 14, -2, 0, KaiwaWork->frame_bg_Map, 30);

	InitTransRect(&(KaiwaWork->trect[6]),  1, 15, 1, 16,  0, 0, 2, 0);
	InitSrcOrg(&(KaiwaWork->src_org[6]), 1, 15, 0, 0, KaiwaWork->frame_bg_Map, 30);

	InitTransRect(&(KaiwaWork->trect[7]),  24, 15, 24, 16,  -2, 0, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[7]), 24, 15, -2, 0, KaiwaWork->frame_bg_Map, 30);

	KaiwaWork->draw_win_rectcnt = 8;
	KaiwaWork->draw_win_roopcnt = 6;
}
/* グループメインウィンドウ表示（縦） */
static void setrect_groupmainV_draw(void)
{
	InitTransRect(&(KaiwaWork->trect[0]), 1, 14, 13, 15, 0, -1, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[0]), 0, 0, 0, 0, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[1]), 12, 14, 24, 15, 0, -1, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[1]), 18, 0, 0, 0, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[2]), 1, 15, 13, 16, 0, 0, 0, 1);
	InitSrcOrg(&(KaiwaWork->src_org[2]), 0, 9, 0, -1, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[3]), 12, 15, 24, 16, 0, 0, 0, 1);
	InitSrcOrg(&(KaiwaWork->src_org[3]), 18, 9, 0, -1, KaiwaWork->frame_selwin_Map, 30);

	KaiwaWork->draw_win_rectcnt = 4;
	KaiwaWork->draw_win_roopcnt = 4;
}
/* グループメインウィンドウ消去（縦） */
static void setrect_groupmainV_erase(void)
{
	InitTransRect(&(KaiwaWork->trect[0]), 1, 10, 13, 15, 0, 1, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[0]), 0, 0, 0, 0, KaiwaWork->frame_selwin_Map, 30);
	InitTransRect(&(KaiwaWork->trect[1]), 12, 10, 24, 15, 0, 1, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[1]), 18, 0, 0, 0, KaiwaWork->frame_selwin_Map, 30);
	InitTransRect(&(KaiwaWork->trect[2]), 1, 15, 13, 20, 0, 0, 0, -1);
	InitSrcOrg(&(KaiwaWork->src_org[2]), 0, 5, 0, 1, KaiwaWork->frame_selwin_Map, 30);
	InitTransRect(&(KaiwaWork->trect[3]), 12, 15, 24, 20, 0, 0, 0, -1);
	InitSrcOrg(&(KaiwaWork->src_org[3]), 18, 5, 0, 1, KaiwaWork->frame_selwin_Map, 30);


	InitTransRect(&(KaiwaWork->trect[4]), 1, 10, 24, 10, 0, 0, 0, 1);
	InitSrcOrg(&(KaiwaWork->src_org[4]), 1, 10, 0, 0, KaiwaWork->frame_bg_Map, 30);
	InitTransRect(&(KaiwaWork->trect[5]), 1, 20, 24, 20, 0, -1, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[5]), 1, 20, 0, -1, KaiwaWork->frame_bg_Map, 30);

	KaiwaWork->draw_win_rectcnt = 6;
	KaiwaWork->draw_win_roopcnt = 4;
}
/* グループメニューウィンドウ表示 */
static void setrect_groupmenu_draw(void)
{
	InitTransRect(&(KaiwaWork->trect[0]), 24, 12, 25, 20, 0, 0, 1, 0);
	InitSrcOrg(&(KaiwaWork->src_org[0]), 5, 0, -1, 0, KaiwaWork->frame_selwinsub_Map, 6);
	KaiwaWork->draw_win_rectcnt = 1;
	KaiwaWork->draw_win_roopcnt = 5;
}
/* グループメニューウィンドウ消去 */
static void setrect_groupmenu_erase(void)
{
	InitTransRect(&(KaiwaWork->trect[0]), 24, 12, 30, 20, 0, 0, -1, 0);
	InitSrcOrg(&(KaiwaWork->src_org[0]), 0, 0, 1, 0, KaiwaWork->frame_selwinsub_Map, 6);
	InitTransRect(&(KaiwaWork->trect[1]), 30, 12, 31, 20, -1, 0, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[1]), 30, 12, -1, 0, KaiwaWork->frame_bg_Map, 30);
	KaiwaWork->draw_win_rectcnt = 2;
	KaiwaWork->draw_win_roopcnt = 6;
}
/* グループ選択ウィンドウ→単語選択ウィンドウ移行 */
static void setrect_group_to_word_1(void)
{
	InitTransRect(&(KaiwaWork->trect[0]), 12, 10, 24, 20, 0, 0, 1, 0);
	InitSrcOrg(&(KaiwaWork->src_org[0]), 18, 0, -1, 0, KaiwaWork->frame_selwin_Map, 30);
	KaiwaWork->draw_win_rectcnt = 1;
	KaiwaWork->draw_win_roopcnt = 5;
}
static void setrect_group_to_word_2(void)
{
	InitTransRect(&(KaiwaWork->trect[0]), 0, 10, 30, 20, 0, 0, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[0]), 0, 0, 0, 0, KaiwaWork->frame_selwin_Map, 30);
	KaiwaWork->draw_win_rectcnt = 1;
	KaiwaWork->draw_win_roopcnt = 1;
}
/* 単語選択ウィンドウ→グループ選択ウィンドウ移行 */
static void setrect_word_to_group_1(void)
{
	InitTransRect(&(KaiwaWork->trect[0]), 0, 10, 2, 20, 1, 0, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[0]), 0, 0, 0, 0, KaiwaWork->frame_selwin_Map, 30);
	InitTransRect(&(KaiwaWork->trect[1]), 28, 10, 30, 20, 0, 0, -1, 0);
	InitSrcOrg(&(KaiwaWork->src_org[1]), 28, 0, 1, 0, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[2]), 0, 10, 0, 20, 0, 0, 1, 0);
	InitSrcOrg(&(KaiwaWork->src_org[2]), 0, 10, 0, 0, KaiwaWork->frame_bg_Map, 30);
	InitTransRect(&(KaiwaWork->trect[3]), 30, 10, 30, 20, -1, 0, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[3]), 30, 10, -1, 0, KaiwaWork->frame_bg_Map, 30);

	KaiwaWork->draw_win_rectcnt = 4;
	KaiwaWork->draw_win_roopcnt = 1;
}
static void setrect_word_to_group_2(void)
{
	InitTransRect(&(KaiwaWork->trect[0]), 22, 10, 29, 20, 0, 0, -1, 0);
	InitSrcOrg(&(KaiwaWork->src_org[0]), 23, 0, 1, 0, KaiwaWork->frame_selwin_Map, 30);
	InitTransRect(&(KaiwaWork->trect[1]), 29, 10, 29, 20, -1, 0, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[1]), 29, 10, -1, 0, KaiwaWork->frame_bg_Map, 30);
	KaiwaWork->draw_win_rectcnt = 2;
	KaiwaWork->draw_win_roopcnt = 5;
}
/* 単語選択ウィンドウ消去 */
static void setrect_word_erase(void)
{
	InitTransRect(&(KaiwaWork->trect[0]), 0, 10, 30, 15, 0, 1, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[0]), 0, 0, 0, 0, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[1]), 0, 15, 30, 20, 0, 0, 0, -1);
	InitSrcOrg(&(KaiwaWork->src_org[1]), 0, 5, 0, 1, KaiwaWork->frame_selwin_Map, 30);

	InitTransRect(&(KaiwaWork->trect[2]), 0, 10, 30, 10, 0, 0, 0, 1);
	InitSrcOrg(&(KaiwaWork->src_org[2]), 0, 10, 0, 0, KaiwaWork->frame_bg_Map, 30);

	InitTransRect(&(KaiwaWork->trect[3]), 0, 20, 30, 20, 0, -1, 0, 0);
	InitSrcOrg(&(KaiwaWork->src_org[3]), 0, 20, 0, -1, KaiwaWork->frame_bg_Map, 30);

	KaiwaWork->draw_win_rectcnt = 4;
	KaiwaWork->draw_win_roopcnt = 5;
}
/*============================================================================*/
/*= 伸縮矩形関連                                                             =*/
/*============================================================================*/
void InitTransRect(TRECT *rect, u16 left, u16 top, u16 right, u16 bottom, u16 al, u16 at, u16 ar, u16 ab)
{
	rect->left = left; rect->right = right;
	rect->top = top;   rect->bottom = bottom;
	rect->al = al; rect->ar = ar;
	rect->at = at; rect->ab = ab;
}
void ProgTransRect(TRECT *rect)
{
	rect->left += rect->al;
	rect->right += rect->ar;
	rect->top += rect->at;
	rect->bottom += rect->ab;
}
void InitSrcOrg(SRC_ORG *src, u16 left, u16 top, u16 al, u16 at, const u16* addr, u16 xblocks)
{
	src->left = left;
	src->top = top;
	src->al = al; src->at = at;
	src->addr = addr;
	src->xblocks = xblocks;
}
void ProgSrcOrg(SRC_ORG *src)
{
	src->left += src->al;
	src->top += src->at;
}
// v sync 中に呼ばれる
void RectTransMain(void)
{
	if(KaiwaWork->trans_rect_flag){
		u16 i;
		for(i = 0; i < KaiwaWork->draw_win_rectcnt; i++){
			RectTransMap((u16 *)KAIWA_FRAMEBG_MAP_ADDR,
				&(KaiwaWork->trect[i]), &(KaiwaWork->src_org[i]));
		}
		KaiwaWork->trans_rect_flag = 0;
	}
}
void RectTransMap(u16 *dest, TRECT *area, SRC_ORG* src)
{
	s16 width, height;

	width = area->right-area->left;
	height = area->bottom - area->top;
	if((width > 0) && (height > 0)){
		BoxTransMap(dest, area->left, area->top, src->addr, src->left, src->top, width, height, src->xblocks);
	}
}
void RectClearMap(u16 *dest, TRECT *area)
{
	s16 width, height;
	width = area->right-area->left;
	height = area->bottom - area->top;
	if((width > 0) && (height > 0)){
		BoxClearMap(dest, area->left, area->top, width, height);
	}
}

