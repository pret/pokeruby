/***********************************************************************
**	簡易会話（オブジェ処理）
**
**	Masao Taya
**
***********************************************************************/
#include "kaiwa_com.h"
#include "kaiwa_obj.dat"
#include "evobj.h"
#include "madefine.h"
#include "decord.h"

/*============================================*/
/*	セル＆パレットＩＤ                        */
/*============================================*/
enum KAIWA_CELLID {
	CELLID_KAIWACURSOR = 0,
	CELLID_KAIWASQUARE,
	CELLID_KAIWAARROW,
	CELLID_KAIWAPAGECHANGE,
	CELLID_KAIWA_HERO,
	CELLID_KAIWA_INTERVIEWER,
	CELLID_INTERVIEW_BG,
	CELLID_MODE,
};
enum KAIWA_PALID {
	PALID_KAIWACOM = 0,
	PALID_KAIWASQUARE,
	PALID_KAIWA_HERO,
	PALID_KAIWA_INTERVIEWER,
	PALID_INTERVIEW_BG,
	PALID_MODE,
};
/*============================================*/
/*	プロトタイプ                              */
/*============================================*/
static void cursor_init(void);
static void wordcursor_init(void);
static void arrow_init(void);
/*============================================================================*/
/*=  ＯＢＪ初期化                                                            =*/
/*============================================================================*/
void KaiwaObjInit(void)
{
	CellData  cell[] = {
		{ kaiwa_cursor_Character, sizeof(kaiwa_cursor_Character), CELLID_KAIWACURSOR },
		{ square_Character, sizeof(square_Character), CELLID_KAIWASQUARE },
		{ updown_Character, sizeof(updown_Character), CELLID_KAIWAARROW   },
		{ pagechange_Character, sizeof(pagechange_Character), CELLID_KAIWAPAGECHANGE   },
		{ CELL_END, 0, 0 },
	};
	PalData pal[] = {
		{ objcom_Palette, PALID_KAIWACOM },
		{ square_Palette, PALID_KAIWASQUARE },
		{ OBJPAL_END, 0 },
	};

	CellSets(cell);
	ObjPalSets(pal);

	cursor_init();
	wordcursor_init();
	arrow_init();
}
/*============================================================================*/
/*=  カーソルアクター                                                        =*/
/*============================================================================*/
/*------------------------*/
/*  ワーク定義            */
/*------------------------*/
enum CURSOR_WORK {
	CURSORWK_COUNT,
	CURSORWK_STOP,
};
/*------------------------*/
/*  位置計算マクロ        */
/*------------------------*/
#define CALC_CURSOR_Y(y)  ((y)*8 + 8)
#define CALC_CURSOR_X(x)  ((x)*8 + 4)
/*------------------------*/
/*  ヘッダ・関数宣言      */
/*------------------------*/
static void cursor_actmove(actWork *act);
static const actHeader CursorActHeader;
/*------------------------*/
/*  初期化関数            */
/*------------------------*/
static void cursor_init(void)
{
	u16 no;
	no = AddActor(&CursorActHeader, 0, 0, 0);

	ActWork[no].y = CALC_CURSOR_Y(KaiwaWork->cursor_yorg);
	ActWork[no].x = CALC_CURSOR_X(KaiwaWork->cursor_xorg);
	ActWork[no].work[CURSORWK_COUNT] = 0;
	ActWork[no].work[CURSORWK_STOP] = 0;

	KaiwaWork->cursor_actor = &ActWork[no];
}
/*------------------------*/
/*  動作関数              */
/*------------------------*/
static void cursor_actmove(actWork *act)
{
	if(act->work[CURSORWK_STOP]){
		return;
	}

	if(KaiwaWork->cursorpos_update){
		u16 x, y, xofs, i;

		y = KaiwaWork->cursor_ypos;
		x = KaiwaWork->cursor_xpos;
		xofs = 0;
		for(i = 0; i < x; i++){
			xofs += KaiwaWork->cursor_xofs[y][i];
		}

		// 共通メニュー
		if(y == KaiwaWork->cursor_ylimit){
			act->y = CALC_CURSOR_Y(KAIWA_COMMENU_Y + 1);
			act->x = CALC_CURSOR_X(KAIWA_COMMENU_X + 2 + x * 7);
		// 単語選択
		}else{
			act->y = CALC_CURSOR_Y(KaiwaWork->cursor_yorg + y * 2);
			act->x = CALC_CURSOR_X(KaiwaWork->cursor_xorg + xofs + x * 7);
		}

		act->dx = -6;
		act->work[CURSORWK_COUNT] = 0;

	}else{
		if(++(act->work[CURSORWK_COUNT]) > 2){
			act->work[CURSORWK_COUNT] = 0;
			if(++(act->dx) > 0){
				act->dx = -6;
			}
		}
	}
}
/*------------------------*/
/*  カーソル稼働・停止    */
/*------------------------*/
void KaiwaCursorMove(u8 mode)
{
	switch(mode){
	case KAIWA_CURSOR_MOVE:
		KaiwaWork->cursor_actor->work[CURSORWK_STOP] = 0;
		KaiwaWork->cursor_actor->dx = 0;
		KaiwaWork->cursor_actor->banish = 0;
		break;
	case KAIWA_CURSOR_STOP:
		KaiwaWork->cursor_actor->work[CURSORWK_STOP] = 1;
		KaiwaWork->cursor_actor->dx = 0;
		KaiwaWork->cursor_actor->banish = 0;
		break;
	case KAIWA_CURSOR_BANISH:
		KaiwaWork->cursor_actor->work[CURSORWK_STOP] = 1;
		KaiwaWork->cursor_actor->dx = 0;
		KaiwaWork->cursor_actor->banish = 1;
		break;
	}
}
/*------------------------*/
/*  アクターデータ        */
/*------------------------*/
static const ActOamData KaiwaCursorOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	0,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	0,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actHeader CursorActHeader = {
	CELLID_KAIWACURSOR,
	PALID_KAIWACOM,
	&KaiwaCursorOam,
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	cursor_actmove,
};
/*============================================================================*/
/*=  グループ選択用矩形アクター                                              =*/
/*============================================================================*/
static void squareL_actmove(actWork *act);
static void squareR_actmove(actWork *act);

/*============================================*/
/*	レイアウト                                */
/*============================================*/
#define CATEGORYMODE_XORG  (32)
#define CATEGORYMODE_YORG  (96)
#define MENU_MODE_XORG     (216)
#define MENU_MODE_YORG     (96)
#define CHAR3MODE_XORG     (128)
#define CHAR3MODE_YORG     (112)
#define CHAR1MODE_XORG     (32)
#define CHAR1MODE_YORG     (96)

/*------------------------*/
/*  ワーク定義            */
/*------------------------*/
enum SQUARE_WORK{
	SQWK_CNT,
	SQWK_CNT2,
	SQWK_MODE,
	SQWK_PALNO,
	SQWK_TMP,
	SQWK_EVA,
	SQWK_EVB,
};

/*------------------------*/
/*  アクターデータ        */
/*------------------------*/
static const ActOamData SquareOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	1,		//u32 ObjMode:2;          // ＯＢＪモード
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
static const actAnm SquareLAnm[]={
	{  0, 5, 0, 0 }, { ACT_ANMEND, 0, 0, 0 },
	{  8, 5, 0, 0 }, { ACT_ANMEND, 0, 0, 0 },
	{ 16, 5, 0, 0 }, { ACT_ANMEND, 0, 0, 0 },
	{ 24, 5, 0, 0 }, { ACT_ANMEND, 0, 0, 0 },
};
static const actAnm SquareRAnm[]={
	{ 32, 5, 0, 0 }, { ACT_ANMEND, 0, 0, 0 },
	{ 40, 5, 0, 0 }, { ACT_ANMEND, 0, 0, 0 },
	{ 40, 5, 0, 0 }, { ACT_ANMEND, 0, 0, 0 },
	{ 40, 5, 0, 0 }, { ACT_ANMEND, 0, 0, 0 },
};
static const actAnm *const SquareLAnmTbl[]={
	SquareLAnm+0, SquareLAnm+2, SquareLAnm+4, SquareLAnm+6,
};
static const actAnm *const SquareRAnmTbl[]={
	SquareRAnm+0, SquareRAnm+2, SquareRAnm+4, SquareRAnm+6,
};
/* 矩形追加 */
void KaiwaSquareAdd(void)
{
	actHeader header = {
		CELLID_KAIWASQUARE,
		PALID_KAIWASQUARE,
		&SquareOam,
		SquareLAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		squareL_actmove,
	};
	u16 no;

	no = AddActor(&header, 0, 0, 3);
	KaiwaWork->squareL_actor = &ActWork[no];

	header.anmData_p = SquareRAnmTbl;
	header.moveData_p = squareR_actmove;
	no = AddActor(&header, 0, 0, 4);
	KaiwaWork->squareR_actor = &ActWork[no];

	KaiwaWork->squareL_actor->work[SQWK_CNT] = 0;
	KaiwaWork->squareR_actor->work[SQWK_CNT] = 0;
	KaiwaWork->squareL_actor->work[SQWK_PALNO] = 256 + (ObjPalNumGet(PALID_KAIWASQUARE))*16 + 1;
	KaiwaSquareModeChange();
	KaiwaWork->squarepos_update = 1;

	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
}
/* 矩形削除 */
void KaiwaSquareDel(void)
{
	DelActor(KaiwaWork->squareL_actor);
	DelActor(KaiwaWork->squareR_actor);
}
/* 矩形動作モード自動変換 */
void KaiwaSquareModeChange(void)
{
	static u8 mode = 0;

	if(KaiwaWork->group_selmenu_flg){
		mode = SQUARE_MODE_MENU;
	}else if(KaiwaWork->select_mode == KAIWA_SEL_CATEGORY){
		mode = SQUARE_MODE_CATEGORY;
	}else if(KaiwaWork->group_col == 1 && KaiwaWork->group_row == 10){
		mode = SQUARE_MODE_3CHAR;
	}else{
		mode = SQUARE_MODE_1CHAR;
	}

	KaiwaWork->squareL_actor->work[SQWK_MODE] = mode;
	KaiwaWork->squareR_actor->work[SQWK_MODE] = mode;
	ActAnmChg(KaiwaWork->squareL_actor, mode);
	ActAnmChg(KaiwaWork->squareR_actor, mode);

	KaiwaWork->squareL_actor->work[SQWK_EVA] = 8;
	KaiwaWork->squareL_actor->work[SQWK_EVB] = 8;
	KaiwaWork->squareL_actor->work[SQWK_CNT2] = 0;
}
/* 矩形（左）動作関数 */
static void squareL_actmove(actWork *act)
{
// ﾊﾟﾚｯﾄﾌｪｰﾄﾞ
#if 0
	act->work[SQWK_CNT] += 3;
	act->work[SQWK_CNT] &= 0x7f;
	PaletteWorkTrans[act->work[SQWK_PALNO]]
		= PaletteWorkTrans[act->work[SQWK_PALNO] + (sin_cos_table[act->work[SQWK_CNT]] >> 5)];

// 半透明ﾌｪｰﾄﾞ
#else
	act->work[SQWK_CNT]++;
	if(act->work[SQWK_CNT]&1){
		act->work[SQWK_EVA] = 8 + (sin_cos_table[act->work[SQWK_CNT2]]>>5);
	}else{
		act->work[SQWK_EVB] = 8 - (sin_cos_table[act->work[SQWK_CNT2]]>>5);
	}
	act->work[SQWK_CNT2] += 5;
	act->work[SQWK_CNT2] &= 255;
	*(vu16*)REG_BLDALPHA = (act->work[SQWK_EVB]<<8)|act->work[SQWK_EVA];
#endif

	if(KaiwaWork->squarepos_update){
		KaiwaSquareModeChange();

		KaiwaWork->squareL_actor->work[SQWK_EVA] = 8;
		KaiwaWork->squareL_actor->work[SQWK_EVB] = 8;
		KaiwaWork->squareL_actor->work[SQWK_CNT2] = 0;

		switch(act->work[SQWK_MODE]){
		case SQUARE_MODE_CATEGORY:
			act->x = CATEGORYMODE_XORG + KaiwaWork->group_row * 56;
			act->y = CATEGORYMODE_YORG + (KaiwaWork->group_col - KaiwaWork->group_base_col) * 16;
			break;

		case SQUARE_MODE_MENU:
			act->x = MENU_MODE_XORG;
			act->y = MENU_MODE_YORG + KaiwaWork->group_col * 16;
			break;

		case SQUARE_MODE_3CHAR:
			act->x = CHAR3MODE_XORG;
			act->y = CHAR3MODE_YORG;
			break;

		case SQUARE_MODE_1CHAR:
			act->work[SQWK_TMP] = 0;
			if(KaiwaWork->group_row >  4){ act->work[SQWK_TMP]++; }
			if(KaiwaWork->group_row >  9){ act->work[SQWK_TMP]++; }
			if(KaiwaWork->group_row > 12){ act->work[SQWK_TMP]++; }
			act->x = CHAR1MODE_XORG + (KaiwaWork->group_row + act->work[SQWK_TMP]) * 8;
			act->y = CHAR1MODE_YORG + (KaiwaWork->group_col - KaiwaWork->group_base_col) * 16;
			break;
		}
		
	}
}
static void squareR_actmove(actWork *act)
/* 矩形（右）動作関数 */
{
	if(KaiwaWork->squarepos_update){
		if(act->work[SQWK_MODE] == SQUARE_MODE_CATEGORY){
			act->x = KaiwaWork->squareL_actor->x + 32;
			act->y = KaiwaWork->squareL_actor->y;
		}
	}
}
/*============================================================================*/
/*=  単語選択カーソルアクター                                                =*/
/*============================================================================*/
static void wordcursor_actmove(actWork *act);
/*------------------------*/
/*  ワーク定義            */
/*------------------------*/
enum WORDCURSOR_WORK {
	WCWK_COUNT,
	WCWK_STOP,
};
/*------------------------*/
/*  カーソル稼働・停止    */
/*------------------------*/
void KaiwaWordCursorMove(u8 flg)
{
	KaiwaWork->wordcursor_actor->work[WCWK_STOP] = !flg;
	KaiwaWork->wordcursor_actor->dx = 0;
}
/*------------------------*/
/*  カーソル表示・非表示  */
/*------------------------*/
void KaiwaWordCursorDisp(u8 flg)
{
	KaiwaWork->wordcursor_actor->banish = !flg;
	KaiwaWordCursorMove(flg);
	if(flg){
		KaiwaWork->wordcursor_update = 1;
	}
}
/*------------------------*/
/*  アクター初期化        */
/*------------------------*/
static void wordcursor_init(void)
{
	u16 no;

	// 単語選択カーソル
	no = AddActor(&CursorActHeader, 0, 0, 0);
	ActWork[no].work[WCWK_COUNT] = 0;
	ActWork[no].work[WCWK_STOP] = 0;

	KaiwaWork->wordcursor_actor = &ActWork[no];
	KaiwaWork->wordcursor_actor->move = wordcursor_actmove;

	KaiwaWordCursorDisp(0); // 初期状態は非表示
}
/*------------------------*/
/*  位置計算マクロ        */
/*------------------------*/
#define CALC_WORDCURSOR_X(x)  (KAIWA_WORDCURSOR_XORG + (x) * ((KAIWA_WORDLEN_MAX+2)*8))
#define CALC_WORDCURSOR_Y(y)  (KAIWA_WORDCURSOR_YORG + (y) * 16)
/*------------------------*/
/*  動作関数              */
/*------------------------*/
static void wordcursor_actmove(actWork *act)
{
	if(act->work[WCWK_STOP]){
		return;
	}

	if(KaiwaWork->wordcursor_update){

		act->x = CALC_WORDCURSOR_X(KaiwaWork->word_row);
		act->y = CALC_WORDCURSOR_Y(KaiwaWork->word_col - KaiwaWork->word_base_col);

		act->dx = -6;
		act->work[WCWK_COUNT] = 0;

	}else{
		if(++(act->work[WCWK_COUNT]) > 2){
			act->work[WCWK_COUNT] = 0;
			if(++(act->dx) > 0){
				act->dx = -6;
			}
		}
	}
}
/*============================================================================*/
/*=  スクロール矢印＆ページ切り替えマークアクター                            =*/
/*============================================================================*/
/*------------------------*/
/*  定数                  */
/*------------------------*/
#define ARROW_TOP_YPOS     (84)
#define ARROW_BOTTOM_YPOS  (156)
#define ARROW_YPOS_DIFF    (ARROW_BOTTOM_YPOS - ARROW_TOP_YPOS)
#define ARROW_GROUP_XPOS   (100)
#define ARROW_WORD_XPOS    (120)
#define PAGECHANGE_XPOS    (166)
#define PAGECHANGE_YPOS    (80)

/*------------------------*/
/*  動作関数宣言          */
/*------------------------*/
static void arrow_actmove(actWork *act);

/*------------------------*/
/*  ワーク定義            */
/*------------------------*/
enum ARRORW_WORK {
	ARWK_POS,
	ARWK_DISP,
};
/*------------------------*/
/*  アクターデータ        */
/*------------------------*/
static const ActOamData ArrowOam = {
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
	1,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actAnm ArrowAnm[]={
	{  0, 5, 0, 0 }, { ACT_ANMEND, 0, 0, 0 },
	{  4, 5, 0, 0 }, { ACT_ANMEND, 0, 0, 0 },
};
static const actAnm *const ArrowAnmTbl[]={
	ArrowAnm,
	ArrowAnm + 2,
};
static const actAnm PageAnm[]={
	{  0, 5, 0, 0 }, { ACT_ANMEND, 0, 0, 0 },
	{  4, 5, 0, 0 }, { ACT_ANMEND, 0, 0, 0 },
};
static const actAnm *const PageChangeAnmTbl[] = {
	PageAnm,
	PageAnm + 2,
};
/*------------------------*/
/*  表示／非表示          */
/*------------------------*/
void KaiwaArrowHide(void)
{
	u16 i;
	for(i = 0; i < 2; i++){
		KaiwaWork->arrow_actor[i]->banish = 1;
		KaiwaWork->arrow_actor[i]->work[ARWK_DISP] = 0;
		KaiwaWork->pagechange_actor[i]->banish = 1;
		KaiwaWork->pagechange_actor[i]->work[ARWK_DISP] = 0;
	}
	KaiwaWork->arrow_disp = 0;
}
/*------------------------*/
/*  動作モード変更＆表示  */
/*------------------------*/
void KaiwaArrowModeChange(u8 mode)
{
	u16 i, xpos;

	if(mode == ARROW_MODE_GROUP){
		xpos = ARROW_GROUP_XPOS;
		KaiwaWork->arrow_base_col = &(KaiwaWork->group_base_col);
		if(KaiwaWork->select_mode == KAIWA_SEL_CATEGORY){
			KaiwaWork->arrow_max_col = KaiwaWork->category_max_col - 4;
		}else{
			KaiwaWork->arrow_max_col = 0;
		}
	}else{
		xpos = ARROW_WORD_XPOS;
		KaiwaWork->arrow_base_col = &(KaiwaWork->word_base_col);
		KaiwaWork->arrow_max_col = KaiwaWork->word_max_col - KAIWA_WORDWIN_COL;
		for(i = 0; i < 2; i++){
			KaiwaWork->pagechange_actor[i]->banish = 0;
			KaiwaWork->pagechange_actor[i]->work[ARWK_DISP] = 1;
		}
	}
	if(KaiwaWork->arrow_max_col < 0){
		KaiwaWork->arrow_max_col = 0;
	}

	for(i = 0; i < 2; i++){
		KaiwaWork->arrow_actor[i]->x = xpos;
		KaiwaWork->arrow_actor[i]->banish = 0;
		KaiwaWork->arrow_actor[i]->work[ARWK_DISP] = 1;
		ActAnmChg(KaiwaWork->arrow_actor[i], mode);
	}
	KaiwaWork->arrow_disp = 1;
}
/*------------------------*/
/*  アクター初期化        */
/*------------------------*/
static void arrow_init(void)
{
	actHeader header = {
		CELLID_KAIWAARROW,
		PALID_KAIWACOM,
		&ArrowOam,
		ArrowAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		arrow_actmove,
	};
	u16 i, no;

	for(i = 0; i < 2; i++){
		no = AddActor(&header, 0, ARROW_TOP_YPOS + ARROW_YPOS_DIFF * i, 0);
		KaiwaWork->arrow_actor[i] = &ActWork[no];
		KaiwaWork->arrow_actor[i]->work[ARWK_POS] = i;
		KaiwaWork->arrow_actor[i]->Vflip = i;
	}

	header.cellNo = CELLID_KAIWAPAGECHANGE;
	header.anmData_p = PageChangeAnmTbl;

	for(i = 0; i < 2; i++){
		no = AddActor(&header, PAGECHANGE_XPOS + i * 40, PAGECHANGE_YPOS, 0);
		KaiwaWork->pagechange_actor[i] = &ActWork[no];
		KaiwaWork->pagechange_actor[i]->work[ARWK_POS] = i;
		KaiwaWork->pagechange_actor[i]->oamData.Shape = 1;
		KaiwaWork->pagechange_actor[i]->oamData.Size = 1;
		ActAnmChg(KaiwaWork->pagechange_actor[i], i);
	}

	KaiwaArrowModeChange(ARROW_MODE_GROUP);
	KaiwaArrowHide();
}
/*------------------------*/
/*  動作関数              */
/*------------------------*/
static void arrow_actmove(actWork *act)
{
	if(KaiwaWork->arrow_disp == 0){ return; }
	if(act->work[ARWK_DISP] == 0){ return; }

	if(act->work[ARWK_POS] == 0){
		act->banish = ((*(KaiwaWork->arrow_base_col)) == 0);
	}else{
		act->banish = ((*(KaiwaWork->arrow_base_col)) == KaiwaWork->arrow_max_col);
	}
}
/*============================================================================*/
/*=  インタビュー用　主人公＆インタビュアーアクター                          =*/
/*============================================================================*/
static const actHeader InterviewBG_ActHeader;

#define INTERV_BG_X      (64)
#define INTERV_BG_Y      (40)

void KaiwaObjInterviewerAdd(u8 type, u8 layout)
{
	CellData  cell = { interview_bg_Character, OBJ_SIZE16_64x64, CELLID_INTERVIEW_BG };
	PalData   pal =  { interview_bg_Palette, PALID_INTERVIEW_BG };
	u16 code;
	s16 x, y;
	u8  actno;

	switch(layout){
	default:
	case KAIWA_LAYOUT_1x1:
		x = INTERV_BG_X; y = INTERV_BG_Y;
		break;

	case KAIWA_LAYOUT_2x2B:
		x = INTERV_BG_X-28; y = INTERV_BG_Y+8;
		break;
	}


	switch(type){
	default:
	case KAIWA_INTERVIEWER_MAN:     code = INTERVM1; break;
	case KAIWA_INTERVIEWER_WOMAN:   code = INTERVW1; break;
	}

	DecordCellSet(&cell);
	ObjPalSet(&pal);

	actno = AddActor(&InterviewBG_ActHeader, x, y, 1);

	actno = EvObjMakeAddAct(((MyData.my_sex == MALE)? HERO : HEROINE), DummyActMove, x-12, y, 0);
	if(actno != ACT_MAX){
		ActWork[actno].oamData.Priority = 0;
		ActAnmChg(&ActWork[actno], STOP_R_ST);
	}

	actno = EvObjMakeAddAct(code, DummyActMove, x+12, y, 0);
	if(actno != ACT_MAX){
		ActWork[actno].oamData.Priority = 0;
		ActAnmChg(&ActWork[actno], STOP_L_ST);
	}
}

static const ActOamData InterviewBG_Oam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
	3,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	0,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,

};

static const actHeader InterviewBG_ActHeader = {
	CELLID_INTERVIEW_BG,
	PALID_INTERVIEW_BG,
	&InterviewBG_Oam,
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	DummyActMove,
};

/*============================================================================*/
/*=  モード標識                                                              =*/
/*============================================================================*/
#define MODE_X  (224)
#define MODE_Y  (88)

static const actHeader ModeHeader;

void KaiwaModeFlagInit(void)
{
	static const CellData cell = { mode_Character, OBJ_SIZE16_64x32*4, CELLID_MODE };
	static const PalData pal = { mode_Palette, PALID_MODE };
	u8 no;

	DecordCellSet((CellData*)&cell);
	ObjPalSet((PalData*)&pal);

	no = AddActor(&ModeHeader,MODE_X,MODE_Y,0);
	if(no != ACT_MAX)
	{
		KaiwaWork->mode_actor = &ActWork[no];
	}else{
		KaiwaWork->mode_actor = NULL;
	}
}
// モード切り替え
void KaiwaModeFlagChange(void)
{
	if(KaiwaWork->mode_actor != NULL){
		if(KaiwaWork->select_mode==KAIWA_SEL_CATEGORY){
			ActAnmChg(KaiwaWork->mode_actor,1);
		}else{
			ActAnmChg(KaiwaWork->mode_actor,2);
		}
	}
}
// 出現、消去
void KaiwaModeFlagAppear(u8 appear)
{
	if(KaiwaWork->mode_actor != NULL){
		if(appear){
			if(KaiwaWork->select_mode==KAIWA_SEL_CATEGORY){
				ActAnmChg(KaiwaWork->mode_actor,3);
			}else{
				ActAnmChg(KaiwaWork->mode_actor,4);
			}
		}else{
			ActAnmChg(KaiwaWork->mode_actor,5);
		}
	}
}


static const ActOamData ModeOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	1,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
	3,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	0,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,

};

// 初期状態（消えている）
#define MODE_ANM_WAIT     (4)
#define MODE_APPEAR_WAIT  (2)
static const actAnm ModeAnm0[]={
	{OBJ16_64x32*3,3,0,0},
	{ACT_ANMEND,0,0,0}
};
// ｸﾞﾙｰﾌﾟ→あいうえお
static const actAnm ModeAnm1[]={
	{OBJ16_64x32*2,MODE_ANM_WAIT,0,0},
	{OBJ16_64x32*3,MODE_ANM_WAIT,0,0},
	{OBJ16_64x32*2,MODE_ANM_WAIT,0,0},
	{OBJ16_64x32*0,MODE_ANM_WAIT,0,0},
	{ACT_ANMEND,0,0,0}
};
// あいうえお→ｸﾞﾙｰﾌﾟ
static const actAnm ModeAnm2[]={
	{OBJ16_64x32*2,MODE_ANM_WAIT,0,0},
	{OBJ16_64x32*3,MODE_ANM_WAIT,0,0},
	{OBJ16_64x32*2,MODE_ANM_WAIT,0,0},
	{OBJ16_64x32*1,MODE_ANM_WAIT,0,0},
	{ACT_ANMEND,0,0,0}
};
// 初期状態→ｸﾞﾙｰﾌﾟ
static const actAnm ModeAnm3[]={
	{OBJ16_64x32*2,MODE_APPEAR_WAIT,0,0},
	{OBJ16_64x32*1,MODE_APPEAR_WAIT,0,0},
	{ACT_ANMEND,0,0,0}
};
// 初期状態→あいうえお
static const actAnm ModeAnm4[]={
	{OBJ16_64x32*2,MODE_APPEAR_WAIT,0,0},
	{OBJ16_64x32*0,MODE_APPEAR_WAIT,0,0},
	{ACT_ANMEND,0,0,0}
};
// 消える
static const actAnm ModeAnm5[]={
	{OBJ16_64x32*2,MODE_APPEAR_WAIT,0,0},
	{OBJ16_64x32*3,MODE_APPEAR_WAIT,0,0},
	{ACT_ANMEND,0,0,0}
};


static const actAnm *const ModeAnmTbl[]={
	ModeAnm0,
	ModeAnm1,
	ModeAnm2,
	ModeAnm3,
	ModeAnm4,
	ModeAnm5,
};
static const actHeader ModeHeader = {
	CELLID_MODE,
	PALID_MODE,
	&ModeOam,
	ModeAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	DummyActMove,
};

