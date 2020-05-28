/***********************************************************************
**	マーキングＯＢＪ操作
**	masao taya
***********************************************************************/
#include "common.h"
#include "intr.h"
#include "actanm.h"
#include "actor.h"
#include "palanm.h"
#include "marking.h"
#include "marking.dat"
#include "boxsub.h"
#include "mus_tool.h"

#include "print.h"
#include "window.h"

/*======================================
==	consts
======================================*/
static const u8 kettei_str[] = { ke_, ttu_, te_, i_, EOM_ };

/*======================================
==	globals
======================================*/
static MARKING_WORK *wp = NULL;

/*======================================
==	prots
======================================*/
static void add_obj(s16 x, s16 y, u16 cell_id, u16 pal_id);
extern const NWIN_DATA * get_nwin_type( u8 type );

/*====================================================================*/
/*  マーキングウィンドウ                                              */
/*====================================================================*/

/***************************************************************
**	初期化
***************************************************************/
void MarkingWorkInit(MARKING_WORK *work)
{
	wp = work;
}
/***************************************************************
**  セルデータ作成
***************************************************************/
void MarkingCellMakeInit(void)
{
	const NWIN_DATA *win;

	win = get_nwin_type(MyData.window_type);
	wp->win_char = win->char_addr;
	wp->win_pltt = win->pltt_addr;
	wp->cellmake_line = 0;

	CpuClear(0,wp->win_cell,sizeof(wp->win_cell),16);
}
// 0:終了  1:継続中
u8 MarkingCellMake(void)
{
	u8 *dst = &(wp->win_cell[wp->cellmake_line*32*8]);
	u16 i;

	switch(wp->cellmake_line){
	case 0:
		CpuFastCopy((void*)(wp->win_char+(32*0)), (void*)dst, 32);
		for(i = 0; i < 6; i++){
			CpuFastCopy((void*)(wp->win_char+(32*1)), (void*)(dst+(i+1)*32), 32);
		}
		CpuFastCopy((void*)(wp->win_char+(32*2)), (void*)(dst+7*32), 32);
		wp->cellmake_line++;
		break;

	default:
		CpuFastCopy((void*)(wp->win_char+(32*3)), (void*)dst, 32);
		for(i = 0; i < 6; i++){
			CpuFastCopy((void*)(wp->win_char+(32*4)), (void*)(dst+(i+1)*32), 32);
		}
		CpuFastCopy((void*)(wp->win_char+(32*5)), (void*)(dst+7*32), 32);
		wp->cellmake_line++;
		break;

	case 13:
		CpuFastCopy((void*)(wp->win_char+(32*6)), (void*)dst, 32);
		for(i = 0; i < 6; i++){
			CpuFastCopy((void*)(wp->win_char+(32*7)), (void*)(dst+(i+1)*32), 32);
		}
		CpuFastCopy((void*)(wp->win_char+(32*8)), (void*)(dst+7*32), 32);
		wp->cellmake_line++;
		return 0;
		break;

	case 14:
		return 0;

	}
	return 1;
}
// 即終了
void MarkingCellMakeNow(void)
{
	MarkingCellMakeInit();
	while(1){
		if(!MarkingCellMake()){ break; }
	}
}
/***************************************************************
**	ウィンドウ表示（ｾﾙ&ﾊﾟﾚｯﾄｾｯﾄ）
***************************************************************/
void MarkingWindowDisp(u8 mark, s16 x, s16 y)
{
	u16 i;
	wp->cursor = 0;

	wp->mark = mark;
	for(i = 0; i < 4; i++){
		wp->mark_work[i] = ((wp->mark & (1 << i)) != 0);
	}

	add_obj(x, y, wp->cell_id, wp->pal_id);
}
/***************************************************************
**	終了
***************************************************************/
void MarkingWindowQuit(void)
{
	u16 i;

	for(i = 0; i < 3; i++){
		CellDel(wp->cell_id + i);
	}
	ObjPalRegNumDel(wp->pal_id);
	ObjPalRegNumDel(wp->pal_id+1);

	for(i = 0; i < 2; i++){
		if(wp->win_actor[i] != NULL){
			DelActor(wp->win_actor[i]);
		}else{
			return;
		}
	}

	for(i = 0; i < 4; i++){
		if(wp->mark_actor[i] != NULL){
			DelActor(wp->mark_actor[i]);
		}else{
			return;
		}
	}

	if(wp->cursor_actor != NULL){
		DelActor(wp->cursor_actor);
	}

	if(wp->kettei_actor != NULL){
		DelActor(wp->kettei_actor);
	}
	
}
/***************************************************************
**	ウィンドウ操作
**
**	return   0 ... 終了   1 ... 継続
***************************************************************/
u8  MarkingControl(void)
{
	if(sys.Trg & U_KEY){
		SePlay(SE_SELECT);
		if(--(wp->cursor) < 0){ wp->cursor = 5; };
		return 1;
	}
	if(sys.Trg & D_KEY){
		SePlay(SE_SELECT);
		if(++(wp->cursor) > 5){ wp->cursor = 0; };
		return 1;
	}
	if(sys.Trg & A_BUTTON){
		SePlay(SE_SELECT);
		switch(wp->cursor){
		case 4:  // けってい
			{
				u16 i;
				wp->mark = 0;
				for(i = 0; i < 4; i++){
					wp->mark |= (wp->mark_work[i] << i);
				}
				return 0;
			}
			break;

		case 5:  // やめる
			return 0;

		default:
			wp->mark_work[wp->cursor] = !(wp->mark_work[wp->cursor]);
			return 1;
		}
	}
	if(sys.Trg & B_BUTTON){
		SePlay(SE_SELECT);
		return 0;
	}
	return 1;
}
/***************************************************************
**	ウィンドウ操作に使うＯＢＪ登録
***************************************************************/
static void win_actmove(actWork *act);
static void mark_actmove(actWork *act);
static void cursor_actmove(actWork *act);

static const actAnm *const MarkAnmTbl[];
static const actAnm *const WinAnmTbl[];
static const ActOamData MarkOam;
static const ActOamData WinOam;

static void add_obj(s16 x, s16 y, u16 cell_id, u16 pal_id)
{
	CellData  cell[] = {
		{ wp->win_cell, sizeof(wp->win_cell), cell_id },
		{ mark_Character, sizeof(mark_Character), cell_id + 1 },
//		{ mark_cursor_Character, sizeof(mark_cursor_Character), cell_id + 2 },
		{ CELL_END, 0, 0 },
	};
	PalData pal[] = {
		{ wp->win_pltt, pal_id    },
		{ mark_Palette, pal_id + 1},
		{ OBJPAL_END, 0 }
	};
	actHeader header = {
		cell_id,
		pal_id,
		&WinOam,
		WinAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		win_actmove,
	};
	u16 no, i;

	CellSets(cell);
	ObjPalSets(pal);

// ウィンドウ
	for(i = 0; i < 2; i++){
		no = AddActor(&header, x + 32, y + 32, 1);
		if(no != ACT_MAX){
			wp->win_actor[i] = &ActWork[no];
			ActAnmChg(wp->win_actor[i], i);
		}else{
			wp->win_actor[i] = NULL;
			return;
		}
	}
//	wp->win_actor[1]->oamData.Shape = 1;
	wp->win_actor[1]->y = y + 96;

// マーク
	header.cellNo++;
	header.palNo++;
	header.anmData_p = MarkAnmTbl;
	header.moveData_p = mark_actmove;
	header.oamData_p = &MarkOam;
	for(i = 0; i < 4; i++){
		no = AddActor(&header, x + 32, y + 16 + i * 16, 0);
		if(no != ACT_MAX){
			wp->mark_actor[i] = &ActWork[no];
			wp->mark_actor[i]->work[0] = i;
		}else{
			wp->mark_actor[i] = NULL;
			return;
		}
	}

// けってい、やめる
	header.moveData_p = DummyActMove;
	no = AddActor(&header, 0,0,0);
	if(no != ACT_MAX){
		wp->kettei_actor = &(ActWork[no]);
		wp->kettei_actor->oamData.Shape = 0;
		wp->kettei_actor->oamData.Size = 2;
		ActAnmChg(wp->kettei_actor, 9);
		wp->kettei_actor->x = x+32;
		wp->kettei_actor->y = y + 16 + 4 * 16;

		actCenterCalc(wp->kettei_actor, 1, 2, 0);

	}else{
		wp->kettei_actor =NULL;
	}

	header.moveData_p = cursor_actmove;
	no = AddActor(&header, x + 12, 0, 0);
	if(no != ACT_MAX){
		wp->cursor_actor = &ActWork[no];
		wp->cursor_actor->work[0] = y + 16;
		ActAnmChg(wp->cursor_actor, 8);
	}else{
		wp->cursor_actor = NULL;
	}

}
static const ActOamData WinOam = {
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
static const ActOamData MarkOam = {
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
static const actAnm MarkAnm[]={
	{0,5,0,0}, {ACT_ANMEND,0,0,0},
	{1,5,0,0}, {ACT_ANMEND,0,0,0},
	{2,5,0,0}, {ACT_ANMEND,0,0,0},
	{3,5,0,0}, {ACT_ANMEND,0,0,0},
	{4,5,0,0}, {ACT_ANMEND,0,0,0},
	{5,5,0,0}, {ACT_ANMEND,0,0,0},
	{6,5,0,0}, {ACT_ANMEND,0,0,0},
	{7,5,0,0}, {ACT_ANMEND,0,0,0},
	{8,5,0,0}, {ACT_ANMEND,0,0,0},  // ｶｰｿﾙ
	{9,5,0,0}, {ACT_ANMEND,0,0,0},  // "けってい"
};
static const actAnm *const MarkAnmTbl[]={
	MarkAnm + 0,
	MarkAnm + 2,
	MarkAnm + 4,
	MarkAnm + 6,
	MarkAnm + 8,
	MarkAnm + 10,
	MarkAnm + 12,
	MarkAnm + 14,
	MarkAnm + 16,
	MarkAnm + 18,
};
static const actAnm WinAnm[] = {
	{0,5,0,0}, {ACT_ANMEND,0,0,0},
	{64,5,0,0},{ACT_ANMEND,0,0,0},
};
static const actAnm *const WinAnmTbl[] = {
	WinAnm+0, WinAnm+2,
};
/***************************************************************
**	ウィンドウ用ＯＢＪ動作関数
***************************************************************/
static void win_actmove(actWork *act)
{
	// なにもしない
}
static void mark_actmove(actWork *act)
{
	if(wp->mark_work[act->work[0]]){
		ActAnmChg(act, act->work[0]*2 + 1);
	}else{
		ActAnmChg(act, act->work[0]*2);
	}
}
static void cursor_actmove(actWork *act)
{
	act->y = act->work[0] + wp->cursor * 16;
}
/*====================================================================*/
/*  マーキング状態表示ＯＢＪ                                          */
/*====================================================================*/
#define MARKING_CHAR_SIZE  (0x20 * 4)

static const ActOamData MarkStateOam;
static const actAnm *const MarkStateAnmTbl[];
static actWork* add_making_state_actor(u16 cell_id, u16 pal_id, const u16 *pal_addr, u16 patern);


/*==============================================
==	アニメ切り替えアクター登録
==============================================*/
actWork* MarkingStateAnmObjAdd(u16 cell_id, u16 pal_id, const u16 *pal_addr)
{
	if(pal_addr == NULL){
		pal_addr = mark_state_Palette;
	}
	return add_making_state_actor(cell_id, pal_id, pal_addr, 16);
}
/*==============================================
==	キャラ転送切り替えアクターの登録
==============================================*/
actWork* MarkingStateObjAdd(u16 cell_id, u16 pal_id, const u16 *pal_addr)
{
	if(pal_addr == NULL){
		pal_addr = mark_state_Palette;
	}
	return add_making_state_actor(cell_id, pal_id, pal_addr, 1);
}
/*==============================================
==	アクター登録メイン
==============================================*/
static actWork* add_making_state_actor(u16 cell_id, u16 pal_id, const u16 *pal_addr, u16 patern)
{
	CellData  cell = { mark_state_Character, MARKING_CHAR_SIZE, cell_id };
	PalData pal = { pal_addr, pal_id };
	actHeader header = {
		cell_id,
		pal_id,
		&MarkStateOam,
		MarkStateAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		win_actmove,
	};
	u16 no;

	cell.size = MARKING_CHAR_SIZE * patern;
	CellSet(&cell);
	ObjPalSet(&pal);

	no = AddActor(&header, 0, 0, 0);
	if(no != ACT_MAX){
		return &ActWork[no];
	}
	return NULL;
}
/*==============================================
==	指定アドレスにキャラ転送
==	mark  マーキング状態
==	addr  転送先アドレス
==============================================*/
void MarkingCharDataCopy(u8 mark, u8 *addr)
{
	const u8 *src = mark_state_Character + (MARKING_CHAR_SIZE * mark);
	DmaCopy(3, src, addr, MARKING_CHAR_SIZE, 16);
}

/*====================================================================*/
/*  マーキング状態表示ＯＢＪ                                          */
/*====================================================================*/
static const ActOamData MarkStateOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	1,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	1,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	0,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};

static const actAnm MarkStateAnm[]={
	{0,5,0,0}, {ACT_ANMEND,0,0,0},
	{4,5,0,0}, {ACT_ANMEND,0,0,0},
	{8,5,0,0}, {ACT_ANMEND,0,0,0},
	{12,5,0,0}, {ACT_ANMEND,0,0,0},
	{16,5,0,0}, {ACT_ANMEND,0,0,0},
	{20,5,0,0}, {ACT_ANMEND,0,0,0},
	{24,5,0,0}, {ACT_ANMEND,0,0,0},
	{28,5,0,0}, {ACT_ANMEND,0,0,0},
	{32,5,0,0}, {ACT_ANMEND,0,0,0},
	{36,5,0,0}, {ACT_ANMEND,0,0,0},
	{40,5,0,0}, {ACT_ANMEND,0,0,0},
	{44,5,0,0}, {ACT_ANMEND,0,0,0},
	{48,5,0,0}, {ACT_ANMEND,0,0,0},
	{52,5,0,0}, {ACT_ANMEND,0,0,0},
	{56,5,0,0}, {ACT_ANMEND,0,0,0},
	{60,5,0,0}, {ACT_ANMEND,0,0,0},
};
static const actAnm *const MarkStateAnmTbl[]={
	MarkStateAnm +  0, MarkStateAnm +  2,  MarkStateAnm +  4, MarkStateAnm +  6,
	MarkStateAnm +  8, MarkStateAnm + 10,  MarkStateAnm + 12, MarkStateAnm + 14,
	MarkStateAnm + 16, MarkStateAnm + 18,  MarkStateAnm + 20, MarkStateAnm + 22,
	MarkStateAnm + 24, MarkStateAnm + 26,  MarkStateAnm + 28, MarkStateAnm + 30,
};
