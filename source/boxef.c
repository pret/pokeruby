/***********************************************************************
**	ボックス－スイッチオン・オフエフェクト
**
***********************************************************************/
#include "common.h"
#include "intr.h"
#include "decord.h"
#include "actanm.h"
#include "actor.h"
#include "palanm.h"
#include "boxef.h"

/*======================================
==	定数
======================================*/
#define DEFAULT_LINE_SPEED  (16)
#define DEFAULT_OPEN_SPEED  (20)

enum SCAN_WORK {
	SCANWK_SPEED,
	SCANWK_VECTOR,
	SCANWK_END_XPOS,
	SCANWK_SAVE_XPOS,
	SCANWK_MOVE_END,
};
/*======================================
==	データ
======================================*/
static const u16 scanline_Palette[16];
static const u8 scanline_Character[8*4*4];
static const ActOamData ScanLineOam;
static const actAnm * const ScanLineAnmTbl[];
/*======================================
==	関数プロトタイプ
======================================*/
void HBlank_On(pFunc func);
void HBlank_Off(void);
static void ScanLineOnActMove(actWork *act);
static void ScanLineOffActMove(actWork *act);
static void ScanLine_H_Blank_Intr1(void);
static void ScanLine_H_Blank_Intr2(void);

/*======================================
==	グローバル
======================================*/
static SCAN_WORK *ScanWork = NULL;

/***********************************************************************
**	ボックスオンエフェクト初期化
***********************************************************************/
void InitBoxOnEffect(SCAN_WORK *work)
{
	CellData cell = { scanline_Character, sizeof(scanline_Character), 0 };
	PalData  pal = { scanline_Palette, 0 };
	actHeader header = {
		0,
		0,
		&ScanLineOam,
		ScanLineAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		ScanLineOnActMove,
	};

	u16 i, act_no;

	cell.act_num = work->cell_id;
	header.cellNo = work->cell_id;
	pal.reg_num = work->pal_id;
	header.palNo = work->pal_id;
	CellSet(&cell);
	ObjPalSet(&pal);

	work->line = 1;
	work->del_act_cnt = 0;
	work->prog_no = 0;
	work->pal_mask = (~(0x00010000 << ObjPalNumGet(work->pal_id))) & 0xffff0000;
	if(work->line_speed == 0){
		work->line_speed = DEFAULT_LINE_SPEED;
	}
	if(work->open_speed == 0){
		work->open_speed = DEFAULT_OPEN_SPEED;
	}
	ScanWork = work;

	for(i = 0; i < 8; i++){
		act_no = AddActor(&header, 8+i*32, 80, 0);
		if(act_no == ACT_MAX){
			break;
		}
		ActWork[act_no].work[SCANWK_SPEED] = (i < 4)? -(work->line_speed) : work->line_speed;
	}

	*(vu16*)REG_BLDCNT = BLD_1ST_ALL | BLD_UP_MODE;
	*(vu16*)REG_BLDY = 0x10;


}
/***********************************************************************
**	ボックスオン初期化後、毎 sync 呼び出し
**
**	戻り値  1 ... エフェクト終了
**          0 ... エフェクト継続中（次回も呼び出す必要あり）
**
***********************************************************************/
u8 CheckBoxOnEffect(void)
{
	if(ScanWork->prog_no == 0){
//		PaletteFadeReq(ScanWork->pal_mask, 0, 16, 16, 0xffff);
		ColorConceChange(ScanWork->pal_mask, 16, 0xffff);
		HBlank_On(ScanLine_H_Blank_Intr1);
		ScanWork->prog_no++;
	}

	if(ScanWork->del_act_cnt < 8){
		return 0;
	}

	ScanWork->line += ScanWork->open_speed;
	if(ScanWork->line >= 80){
		ScanWork->line = 80;
		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDY = 0x00;
		HBlank_Off();
		return 1;
	}
	return 0;
}
/***********************************************************************
**	ボックスオフエフェクト初期化
***********************************************************************/
void InitBoxOffEffect(SCAN_WORK *work)
{
	CellData cell = { scanline_Character, sizeof(scanline_Character), 0 };
	PalData  pal = { scanline_Palette, 0 };
	actHeader header = {
		0,
		0,
		&ScanLineOam,
		ScanLineAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		ScanLineOffActMove,
	};

	u16 i, act_no;

	cell.act_num = work->cell_id;
	header.cellNo = work->cell_id;
	pal.reg_num = work->pal_id;
	header.palNo = work->pal_id;
	CellSet(&cell);
	ObjPalSet(&pal);

	work->line = 80;
	work->del_act_cnt = 0;
	work->prog_no = 0;
	work->del_act_cnt = 0;
	work->pal_mask = (~(0x00010000 << ObjPalNumGet(work->pal_id))) & 0xffff0000;
	if(work->line_speed == 0){
		work->line_speed = DEFAULT_LINE_SPEED;
	}
	if(work->open_speed == 0){
		work->open_speed = DEFAULT_OPEN_SPEED;
	}
	ScanWork = work;

	for(i = 0; i < 8; i++){
		if(i < 4){
			act_no = AddActor(&header, -112+(i*32), 80, 0);
			if(act_no == ACT_MAX){ break; }
			ActWork[act_no].work[SCANWK_SPEED] = work->line_speed;
			ActWork[act_no].work[SCANWK_VECTOR] = 1;
		}else{
			act_no = AddActor(&header, 256+((i-4)*32), 80, 0);
			if(act_no == ACT_MAX){ break; }
			ActWork[act_no].work[SCANWK_SPEED] = -(work->line_speed);
			ActWork[act_no].work[SCANWK_VECTOR] = -1;
		}
		ActWork[act_no].work[SCANWK_END_XPOS] = 8 + i * 32;
		ActWork[act_no].work[SCANWK_MOVE_END] = 0;
		ActWork[act_no].banish = 1;
	}

	*(vu16*)REG_BLDCNT = BLD_1ST_ALL | BLD_DOWN_MODE;
	*(vu16*)REG_BLDY = 0x10;

	HBlank_On(ScanLine_H_Blank_Intr2);
}
/***********************************************************************
**	ボックスオフ初期化後、毎 sync 呼び出し
**
**	戻り値  1 ... エフェクト終了
**          0 ... エフェクト継続中（次回も呼び出す必要あり）
**
***********************************************************************/
u8 CheckBoxOffEffect(void)
{
	switch(ScanWork->prog_no){
	case 0:
		ScanWork->line -= ScanWork->open_speed;
		if(ScanWork->line <= 1){
	//		PaletteFadeReq(ScanWork->pal_mask, 0, 16, 16, 0xffff);
			ColorConceChange(ScanWork->pal_mask, 16, 0xffff);

			SetHBlankFunc(ScanLine_H_Blank_Intr1);
			ScanWork->line = 1;
			ScanWork->prog_no++;
		}
		break;

	case 1:
		if(ScanWork->del_act_cnt == 8){
//			PaletteFadeReq(0xffffffff, 0, 16, 16, 0x0000);
			ColorConceChange(0xffffffff, 16, 0x0000);
			ScanWork->prog_no++;
		}
		break;

	case 2:
		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDY = 0x00;
		CellDel(ScanWork->cell_id);
		ObjPalRegNumDel(ScanWork->pal_id);
		HBlank_Off();
		ScanWork->prog_no++;
		return 1;

	default:
		return 1;
	}

	return 0;
}
/***********************************************************************
**	H Blank
***********************************************************************/
static void ScanLine_H_Blank_Intr1(void)
{
	vu16 vcnt = (*(vu16 *)REG_VCOUNT)&0xff;
	if(vcnt == 80){
		*(vu16*)REG_BLDCNT = BLD_BG0_1ST|BLD_BG1_1ST|BLD_BG2_1ST|BLD_BG3_1ST|BLD_UP_MODE;
	}else{
		*(vu16*)REG_BLDCNT = BLD_1ST_ALL | BLD_DOWN_MODE;
	}
}
static void ScanLine_H_Blank_Intr2(void)
{
	vu16 vcnt = (*(vu16 *)REG_VCOUNT)&0xff;
	if(vcnt > (80-ScanWork->line) && vcnt < (80+ScanWork->line)){
		*(vu16*)REG_BLDY = 0x00;
	}else{
		*(vu16*)REG_BLDY = 0x10;
	}
}
/***********************************************************************
**	アクター動作関数
***********************************************************************/
static void ScanLineOnActMove(actWork *act)
{
	act->x += (act->work[SCANWK_SPEED]);
	if(act->x < -8 || act->x > 248){
		DelActor(act);
		ScanWork->del_act_cnt++;
		if(ScanWork->del_act_cnt == 8){
			CellDel(ScanWork->cell_id);
			ObjPalRegNumDel(ScanWork->pal_id);
//			PaletteFadeReq(ScanWork->pal_mask, 0, 0, 0, 0xffff);
			ColorConceChange(ScanWork->pal_mask, 0, 0xffff);
			SetHBlankFunc(ScanLine_H_Blank_Intr2);
		}
	}
}
static void ScanLineOffActMove(actWork *act)
{
	if(act->work[SCANWK_MOVE_END] == 0){
		if(ScanWork->line == 1){
			act->x += act->work[SCANWK_SPEED];
			if(act->x > -16 && act->x < 256){
				act->banish = 0;
			}
			if(act->work[SCANWK_VECTOR] > 0){
				if(act->x >= act->work[SCANWK_END_XPOS]){
					act->work[SCANWK_MOVE_END] = 1;
				}
			}else{
				if(act->x <= act->work[SCANWK_END_XPOS]){
					act->work[SCANWK_MOVE_END] = 1;
				}
			}
			if(act->work[SCANWK_MOVE_END]){
				ScanWork->del_act_cnt++;
				act->x = act->work[SCANWK_END_XPOS];
			}
		}
	}
}
/***********************************************************************
**	H Blank 割り込みオン
**
**	func   割り込み関数
**
***********************************************************************/
void HBlank_On(pFunc func)
{
	*(vu16 *)INTR_CHECK_BUF |= H_BLANK_INTR_FLAG;
	*(vu16 *)REG_STAT |= STAT_H_BLANK_IF_ENABLE;
	REG_IE_SET(H_BLANK_INTR_FLAG);
	sys.IntrCheck |= H_BLANK_INTR_FLAG;
	SetHBlankFunc(func);
}
/***********************************************************************
**	H Blank 割り込みオフ
***********************************************************************/
void HBlank_Off(void)
{
	*(u16 *)INTR_CHECK_BUF &= ~H_BLANK_INTR_FLAG;
	*(vu16 *)REG_STAT &= ~STAT_H_BLANK_IF_ENABLE;
	REG_IE_RESET(H_BLANK_INTR_FLAG);
	sys.IntrCheck &= ~H_BLANK_INTR_FLAG;
	SetHBlankFunc(NULL);
}
//----------------------------------------------------------
//	ＯＡＭデータ
//----------------------------------------------------------
static const ActOamData ScanLineOam = {
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
//----------------------------------------------------------
//	アニメテーブル
//----------------------------------------------------------
/* カーソル */
static const actAnm ScanLineAnm[] = {
	{  0, 5, 0, 0 },
	{  ACT_ANMEND,0,0,0},
};
static const actAnm * const ScanLineAnmTbl[] = {
	ScanLineAnm,
};

/***********************************************************************
**	画像データ
***********************************************************************/
static const u16 scanline_Palette[16] = {
0x6f17 ,0x0000 ,0x2d4a ,0x5652 ,0x5a94 ,0x7b7b ,0x7fff ,0x0000 ,
0x0000 ,0x0000 ,0x0000 ,0x0000 ,0x0000 ,0x0000 ,0x0000 ,0x0000 ,
};
static const u8 scanline_Character[8*4*4] = {
/*  0  */
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
/*  1  */
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
/*  2  */
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
/*  3  */
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,0x11 ,
};
