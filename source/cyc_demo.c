//******************************************************************
//          cyc_demo.c                                                  
//                                                                  
//          自転車デモ用関数
//          Copyright (C) 2001 GAME FREAK inc.
//******************************************************************
#include "common.h"
#include "intr.h"
#include "task.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "poketool.h"
#include "calctool.h"
#include "decord.h"

s16	cyc_demo_y  = {0};
s16	cyc_demo_dy = {0};
s16	cyc_demo_actdel_sw = {0};
/********************************************************************/
/*				データ												*/
/********************************************************************/
#include "cyc_demo.dat"

static	const CellData	CycDemoKUMOCell[];
void 	CycDemoKUMOSet(void);
static	const CellData	CycDemoMORICell[];
void 	CycDemoMORISet(void);
static	const CellData	CycDemoMATICell[];
void 	CycDemoMATISet(void);
/********************************************************************/
/*				キャラ転送											*/
/********************************************************************/
void	CycDemoBGSet(u8 mode)
{
	LZ77UnCompVram((void*)hill_bch_LZ,(void*)(BG_VRAM+0x4000));
	LZ77UnCompVram((void*)hill_bsc_LZ,(void*)(BG_VRAM+0x7800));
	PaletteWorkSet(hill_bcl_Palette,PA_BG15,0x20);

	switch(mode){
	
	default:
	case 0:
		//海（昼）
		LZ77UnCompVram((void*)sea_bch_LZ,(void*)(BG_VRAM+0x0000));
		LZ77UnCompVram((void*)sea_bsc_LZ,(void*)(BG_VRAM+0x3000));	//２枚分
		PaletteWorkSet(sea_bcl_Palette,PA_BG0,0x60);

		DecordCellSet((CellData*)CycDemoKUMOCell);
		PaletteWorkSet(sea_ocl_Palette,PA_OBJ0,0x20);	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ管理外
		CycDemoKUMOSet();
		break;
	case 1:
		//山（昼）
		LZ77UnCompVram((void*)moun_bch_LZ,(void*)(BG_VRAM+0x0000));
		LZ77UnCompVram((void*)moun_bsc_LZ,(void*)(BG_VRAM+0x3000));	//２枚分
		PaletteWorkSet(moun_bcl_Palette,PA_BG0,0x20);

		DecordCellSet((CellData*)CycDemoMORICell);
		PaletteWorkSet(moun_ocl_Palette,PA_OBJ0,0x20);	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ管理外
		CycDemoMORISet();
		break;
	}
	cyc_demo_actdel_sw = 0;
	ObjPalManStart = 8;			// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始
}

/********************************************************************/
/*				表示レジスタ設定									*/
/********************************************************************/
void	CycDemoRegSet(u8 mode)
{
	switch(mode){
	
	default:
	case 0:
		*(vu16 *)REG_BG3CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_3	
						| 6 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_BG2CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_2			
						| 7 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_BG1CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_1			
						| 15 << BG_SCREEN_BASE_SHIFT | 1 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_DISPCNT =	  DISP_MODE_0	| DISP_OBJ_CHAR_1D_MAP
								| DISP_BG1_ON | DISP_BG2_ON | DISP_BG3_ON
								| DISP_OBJ_ON ;
		break;
	case 1:
		*(vu16 *)REG_BG3CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_3	
						| 6 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_BG2CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_2			
						| 7 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_BG1CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_1			
						| 15 << BG_SCREEN_BASE_SHIFT | 1 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_DISPCNT =	  DISP_MODE_0	| DISP_OBJ_CHAR_1D_MAP
								| DISP_BG1_ON | DISP_BG2_ON	| DISP_BG3_ON
								| DISP_OBJ_ON ;
		break;
	case 2:
		*(vu16 *)REG_BG3CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_3	
						| 6 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_BG2CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_2			
						| 7 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_BG1CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_1			
						| 15 << BG_SCREEN_BASE_SHIFT | 1 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_DISPCNT =	  DISP_MODE_0	| DISP_OBJ_CHAR_1D_MAP
								| DISP_BG1_ON | DISP_BG2_ON | DISP_BG3_ON
								| DISP_OBJ_ON ;
		break;
	}
}

/********************************************************************/
/*				キャラ転送（エンディング用）						*/
/********************************************************************/
void	CycDemoEndBGSet(u8 mode)
{
	LZ77UnCompVram((void*)hill_bch_LZ,(void*)(BG_VRAM+0x4000));
	LZ77UnCompVram((void*)hill_bsc_LZ,(void*)(BG_VRAM+0x7800));

	switch(mode){
	
	default:
	case 0:
		//海（昼）
		PaletteWorkSet(hill_bcl_Palette,PA_BG15,0x20);

		LZ77UnCompVram((void*)sea_bch_LZ,(void*)(BG_VRAM+0x0000));
		LZ77UnCompVram((void*)sea_bsc_LZ,(void*)(BG_VRAM+0x3000));	//２枚分
		PaletteWorkSet(sea_bcl_Palette,PA_BG0,0x60);

		DecordCellSet((CellData*)CycDemoKUMOCell);
		LZ77UnCompVram((void*)sea_och_LZ,(void*)(OBJ_MODE0_VRAM));
		PaletteWorkSet(sea_ocl_Palette,PA_OBJ0,0x20);	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ管理外
		CycDemoKUMOSet();
		break;
	case 1:
		//海（夕）
		PaletteWorkSet(hill2_bcl_Palette,PA_BG15,0x20);

		LZ77UnCompVram((void*)sea_bch_LZ,(void*)(BG_VRAM+0x0000));
		LZ77UnCompVram((void*)sea_bsc_LZ,(void*)(BG_VRAM+0x3000));	//２枚分
		PaletteWorkSet(sea2_bcl_Palette,PA_BG0,0x60);

		DecordCellSet((CellData*)CycDemoKUMOCell);
		LZ77UnCompVram((void*)sea_och_LZ,(void*)(OBJ_MODE0_VRAM));
		PaletteWorkSet(sea2_ocl_Palette,PA_OBJ0,0x20);	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ管理外
		CycDemoKUMOSet();
		break;
	case 2:
		//山（夕）
		PaletteWorkSet(hill2_bcl_Palette,PA_BG15,0x20);

		LZ77UnCompVram((void*)moun_bch_LZ,(void*)(BG_VRAM+0x0000));
		LZ77UnCompVram((void*)moun_bsc_LZ,(void*)(BG_VRAM+0x3000));	//２枚分
		PaletteWorkSet(moun2_bcl_Palette,PA_BG0,0x20);

		DecordCellSet((CellData*)CycDemoMORICell);
		PaletteWorkSet(moun2_bcl_Palette,PA_OBJ0,0x20);	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ管理外
		CycDemoMORISet();
		break;
	case 3:
		//山（夜）
		PaletteWorkSet(hill2_bcl_Palette,PA_BG15,0x20);

		LZ77UnCompVram((void*)moun_bch_LZ,(void*)(BG_VRAM+0x0000));
		LZ77UnCompVram((void*)moun_bsc_LZ,(void*)(BG_VRAM+0x3000));	//２枚分
		PaletteWorkSet(moun2_bcl_Palette,PA_BG0,0x20);

		DecordCellSet((CellData*)CycDemoMORICell);
		PaletteWorkSet(moun2_bcl_Palette,PA_OBJ0,0x20);	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ管理外
		CycDemoMORISet();
		break;
	case 4:
		//街（夜）
		PaletteWorkSet(hill3_bcl_Palette,PA_BG15,0x20);

		LZ77UnCompVram((void*)city_bch_LZ,(void*)(BG_VRAM+0x0000));
		LZ77UnCompVram((void*)city_bsc_LZ,(void*)(BG_VRAM+0x3000));	//２枚分
		PaletteWorkSet(city_bcl_Palette,PA_BG0,0x40);

		DecordCellSet((CellData*)CycDemoMATICell);
		PaletteWorkSet(city_ocl_Palette,PA_OBJ0,0x20);	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ管理外
		CycDemoMATISet();
		break;
	}
	ObjPalManStart = 8;			// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始
	cyc_demo_actdel_sw = 0;
}

/********************************************************************/
/*				表示レジスタ設定（エンディング用）					*/
/********************************************************************/
void	CycDemoEndRegSet(u8 mode)
{
	*(vu16 *)REG_BG3CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_3	
					| 6 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
	*(vu16 *)REG_BG2CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_2			
					| 7 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
	*(vu16 *)REG_BG1CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_1			
					| 15 << BG_SCREEN_BASE_SHIFT | 1 << BG_CHAR_BASE_SHIFT;
	*(vu16 *)REG_DISPCNT =	  DISP_MODE_0	| DISP_OBJ_CHAR_1D_MAP
							| DISP_BG0_ON | DISP_BG1_ON | DISP_BG2_ON | DISP_BG3_ON
							| DISP_OBJ_ON ;
}





/********************************************************************/
/*				スクロールセット									*/
void	CycDemoBGScrollTask(u8 id);
#define	CYCDEMO_MODE		(0)
#define	CYCDEMO_BG1_SPEED	(1)
#define	CYCDEMO_BG1_X		(2)
#define	CYCDEMO_BG1_X_FLOAT	(3)
#define	CYCDEMO_BG2_SPEED	(4)
#define	CYCDEMO_BG2_X		(5)
#define	CYCDEMO_BG2_X_FLOAT	(6)
#define	CYCDEMO_BG3_SPEED	(7)
#define	CYCDEMO_BG3_X		(8)
#define	CYCDEMO_BG3_X_FLOAT	(9)
/********************************************************************/
u8	CycDemoBGScrollSet(u8 mode,u16 BG1sp,u16 BG2sp,u16 BG3sp)
{
	u8	taskID;

	taskID = AddTask(CycDemoBGScrollTask, 0);
	TaskTable[taskID].work[CYCDEMO_MODE]		= mode;

	TaskTable[taskID].work[CYCDEMO_BG1_SPEED]	= BG1sp;
	TaskTable[taskID].work[CYCDEMO_BG1_X]		= 0;
	TaskTable[taskID].work[CYCDEMO_BG1_X_FLOAT] = 0;
	TaskTable[taskID].work[CYCDEMO_BG2_SPEED]	= BG2sp;
	TaskTable[taskID].work[CYCDEMO_BG2_X]		= 0;
	TaskTable[taskID].work[CYCDEMO_BG2_X_FLOAT] = 0;
	TaskTable[taskID].work[CYCDEMO_BG3_SPEED]	= BG3sp;
	TaskTable[taskID].work[CYCDEMO_BG3_X]		= 8;
	TaskTable[taskID].work[CYCDEMO_BG3_X_FLOAT] = 0;
	CycDemoBGScrollTask(taskID);		//１ループ（データ反映）させる

	return taskID;
}

/********************************************************************/
/*				スクロール											*/
/********************************************************************/
void	CycDemoBGScrollTask(u8 id)
{
	s32	xl;
	s32	sp;

	if(TaskTable[id].work[CYCDEMO_BG1_SPEED]){
		xl = (TaskTable[id].work[CYCDEMO_BG1_X] << 16)
			+ (TaskTable[id].work[CYCDEMO_BG1_X_FLOAT]&0x0000ffff);
		sp = ((u16)(TaskTable[id].work[CYCDEMO_BG1_SPEED]&0x0000ffff))<<4;
		xl -= sp;
		TaskTable[id].work[CYCDEMO_BG1_X]		= ((xl>>16) & 0x0000ffff);
		TaskTable[id].work[CYCDEMO_BG1_X_FLOAT] = (xl & 0x0000ffff);
		*(vu16 *)REG_BG1HOFS = TaskTable[id].work[CYCDEMO_BG1_X];
		*(vu16 *)REG_BG1VOFS = cyc_demo_y + cyc_demo_dy;
	}
	if(TaskTable[id].work[CYCDEMO_BG2_SPEED]){
		xl = (TaskTable[id].work[CYCDEMO_BG2_X] << 16)
			+ (TaskTable[id].work[CYCDEMO_BG2_X_FLOAT]&0x0000ffff);
		sp = ((u16)(TaskTable[id].work[CYCDEMO_BG2_SPEED]&0x0000ffff))<<4;
		xl -= sp;
		TaskTable[id].work[CYCDEMO_BG2_X]		= ((xl>>16) & 0x0000ffff);
		TaskTable[id].work[CYCDEMO_BG2_X_FLOAT] = (xl & 0x0000ffff);
		*(vu16 *)REG_BG2HOFS = TaskTable[id].work[CYCDEMO_BG2_X];
		if(TaskTable[id].work[CYCDEMO_MODE]){
			*(vu16 *)REG_BG2VOFS = cyc_demo_y + cyc_demo_dy;
		}else{
			*(vu16 *)REG_BG2VOFS = cyc_demo_y;
		}
	}
	if(TaskTable[id].work[CYCDEMO_BG3_SPEED]){
		xl = (TaskTable[id].work[CYCDEMO_BG3_X] << 16)
			+ (TaskTable[id].work[CYCDEMO_BG3_X_FLOAT]&0x0000ffff);
		sp = ((u16)(TaskTable[id].work[CYCDEMO_BG3_SPEED]&0x0000ffff))<<4;
		xl -= sp;
		TaskTable[id].work[CYCDEMO_BG3_X]		= ((xl>>16) & 0x0000ffff);
		TaskTable[id].work[CYCDEMO_BG3_X_FLOAT] = (xl & 0x0000ffff);
		*(vu16 *)REG_BG3HOFS = TaskTable[id].work[CYCDEMO_BG3_X];
		*(vu16 *)REG_BG3VOFS = cyc_demo_y;
	}
}





/********************************************************************/
/*				パレットアニメ（エフェクト）						*/
/********************************************************************/
void	CycDemoBGEffect(u8 mode)
{
	u16	pal1,pal2;

	switch(mode){
	
	default:
	case 0:
		//海：水平線パレットアニメ
		if((!(sys.main_timer & 0x0003))&&(!FadeData.fade_sw)){	//タイマー
			if(sys.main_timer & 0x0004){
				pal1 = PaletteWork[PA_BG0 + PA_COL9];
				pal2 = PaletteWork[PA_BG0 + PA_COL10];
			}else{
				pal1 = PaletteWork[PA_BG0 + PA_COL10];
				pal2 = PaletteWork[PA_BG0 + PA_COL9];
			}
			PaletteWorkSet(&pal1,PA_BG0 + PA_COL9,0x02);
			PaletteWorkSet(&pal2,PA_BG0 + PA_COL10,0x02);
		}
		break;
	case 1:
		//山：なし
		break;
	case 2:
		//海：星パレットアニメ
		if((!(sys.main_timer & 0x0003))&&(!FadeData.fade_sw)){	//タイマー
			if(sys.main_timer & 0x0004){
				pal1 = 0x3D27;
				pal2 = 0x0295;
			}else{
				pal1 = 0x031C;
				pal2 = 0x3D27;
			}
			PaletteWorkSet(&pal1,PA_BG0 + PA_COL12,0x02);
			PaletteWorkSet(&pal2,PA_BG0 + PA_COL13,0x02);
		}
		break;
	}
}





/********************************************************************/
/*                                                                  */
/*				ＯＢＪアクター（背景）								*/
/*                                                                  */
/********************************************************************/
typedef struct {
u8	anmno:4;
u8	shape:2;
u8	size:2;
u8	x;
u8	y;
u8	pri;
u16	sp;

}CYCDEMOOBJ_SETDATA;

#define	CELLID_CYCDEMO	(2000)
/*------------------------------------------------------------------*/
/*				動作												*/
/*------------------------------------------------------------------*/
#define	CYCDEMO_OBJ_MODE	(0)
#define	CYCDEMO_OBJ_SPEED	(1)
#define	CYCDEMO_OBJ_X_FLOAT	(2)
static void		CycDemoBackActMove(actWork* aw)
{
	s32	xl;
	s32	sp;

	if(cyc_demo_actdel_sw){
		DelActor(aw);
		return;
	}
	xl = (aw->x << 16) + (aw->work[CYCDEMO_OBJ_X_FLOAT]&0x0000ffff);
	sp = (u16)(aw->work[CYCDEMO_OBJ_SPEED]&0x0000ffff);
	xl += sp;
	aw->x = ((xl>>16) & 0x0000ffff);
	aw->work[CYCDEMO_OBJ_X_FLOAT] = (xl & 0x0000ffff);
	if(aw->x >= 256)	aw->x = -32;

	if(aw->work[CYCDEMO_MODE]){
		aw->dy = -(cyc_demo_y + cyc_demo_dy);
	}else{
		aw->dy = -cyc_demo_y;
	}
}

/*------------------------------------------------------------------*/
/*				ヘッダ												*/
/*------------------------------------------------------------------*/
static const actHeader		CycDemoBackActHeader ={
CELLID_CYCDEMO,ACT_OAMPAL,&DummyActOam,DummyActAnmTbl,ACT_NTRANS,DummyActAffTbl,
CycDemoBackActMove,
};

/*------------------------------------------------------------------*/
/*				設定												*/
/*------------------------------------------------------------------*/
static	void	CycDemoBackActSet
(u8 mode,const CYCDEMOOBJ_SETDATA* dattbl,const actAnm * const * anmtbl,u8 cnt)
{
	u8	i,actnum;

	for(i=0;i<cnt;i++){
		actnum = AddActor(	&CycDemoBackActHeader,
							dattbl[i].x,
							dattbl[i].y,
							dattbl[i].pri);
		actCenterCalc(&ActWork[actnum],dattbl[i].shape,dattbl[i].size,0);
		ActWork[actnum].oamData.Priority = 3;
		ActWork[actnum].oamData.Shape = dattbl[i].shape;
		ActWork[actnum].oamData.Size = dattbl[i].size;
		ActWork[actnum].oamData.Pltt = 0;
		ActWork[actnum].anm_tbl = anmtbl;
		ActAnmChg(&ActWork[actnum],dattbl[i].anmno);
		ActWork[actnum].work[CYCDEMO_OBJ_MODE]	= mode;
		ActWork[actnum].work[CYCDEMO_OBJ_SPEED]	= dattbl[i].sp;
		ActWork[actnum].work[CYCDEMO_OBJ_X_FLOAT] = 0;
	}
}


/*------------------------------------------------------------------*/
/*				海ＯＢＪ（雲）										*/
/*------------------------------------------------------------------*/
static	const CellData	CycDemoKUMOCell[] = {{sea_och_LZ,0x400,CELLID_CYCDEMO},{CELL_END,0,0}};

static const actAnm			CycDemoKUMOAnm0[] = {{0x00,30,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			CycDemoKUMOAnm1[] = {{0x10,30,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			CycDemoKUMOAnm2[] = {{0x14,30,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			CycDemoKUMOAnm3[] = {{0x16,30,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm* const	CycDemoKUMOAnmTbl[]={
CycDemoKUMOAnm0,CycDemoKUMOAnm1,CycDemoKUMOAnm2,CycDemoKUMOAnm3,
};

static	const CYCDEMOOBJ_SETDATA	CycDemoKUMOSetTable[] ={
	{0,0,2, 72, 80-48,100,0x0c00},{0,0,2,158, 80-48,100,0x0c00},
	{1,0,1,192, 88-48,101,0x0800},{1,0,1, 56, 88-48,101,0x0800},
	{2,1,0,100, 92-48,102,0x0400},{2,1,0,152, 92-48,102,0x0400},
	{3,1,0,  8, 94-48,103,0x0100},{3,1,0, 56, 94-48,103,0x0100},{3,1,0,240, 94-48,103,0x0100},
};

void 	CycDemoKUMOSet(void)
{
	CycDemoBackActSet(0,CycDemoKUMOSetTable,CycDemoKUMOAnmTbl,9);
}

/*------------------------------------------------------------------*/
/*				山ＯＢＪ（森）										*/
/*------------------------------------------------------------------*/
static	const CellData	CycDemoMORICell[] = {{moun_och_LZ,0x400,CELLID_CYCDEMO},{CELL_END,0,0}};

static const actAnm			CycDemoMORIAnm0[] = {{0x00,30,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			CycDemoMORIAnm1[] = {{0x10,30,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			CycDemoMORIAnm2[] = {{0x18,30,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm* const	CycDemoMORIAnmTbl[]={
CycDemoMORIAnm0,CycDemoMORIAnm1,CycDemoMORIAnm2,
};

static	const CYCDEMOOBJ_SETDATA	CycDemoMORISetTable[] ={
	{0,0,2, 16,88,100,0x2000},{0,0,2, 80,88,100,0x2000},
	{0,0,2,144,88,100,0x2000},{0,0,2,208,88,100,0x2000},
	{1,2,2, 40,88,101,0x1000},{1,2,2,104,88,101,0x1000},
	{1,2,2,168,88,101,0x1000},{1,2,2,232,88,101,0x1000},
	{2,2,2, 56,88,102,0x0800},{2,2,2,120,88,102,0x0800},
	{2,2,2,184,88,102,0x0800},{2,2,2,248,88,102,0x0800},
};

void 	CycDemoMORISet(void)
{
	CycDemoBackActSet(1,CycDemoMORISetTable,CycDemoMORIAnmTbl,12);
}

/*------------------------------------------------------------------*/
/*				街ＯＢＪ（家）										*/
/*------------------------------------------------------------------*/
static	const CellData	CycDemoMATICell[] = {{city_och_LZ,0x400,CELLID_CYCDEMO},{CELL_END,0,0}};

static const actAnm			CycDemoMATIAnm0[] = {{0x00,30,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm* const	CycDemoMATIAnmTbl[]={CycDemoMATIAnm0};

static	const CYCDEMOOBJ_SETDATA	CycDemoMATISetTable[] ={
	{0,0,2, 24,88,100,0x1000},{0,0,2, 64,88,100,0x1000},
	{0,0,2,104,88,100,0x1000},{0,0,2,144,88,100,0x1000},
	{0,0,2,184,88,100,0x1000},{0,0,2,224,88,100,0x1000},
};

void 	CycDemoMATISet(void)
{
	CycDemoBackActSet(1,CycDemoMATISetTable,CycDemoMATIAnmTbl,6);
}





/*------------------------------------------------------------------*/
/*				自機												*/
/*------------------------------------------------------------------*/
#define	CELLID_CYCDEMO_JITENSYA	(1001)
#define	CELLID_CYCDEMO_BOY	(1002)
#define	PALID_CYCDEMO_BOY	(1002)
#define	CELLID_CYCDEMO_GIRL	(1003)
#define	PALID_CYCDEMO_GIRL	(1003)
//人
static const ActOamData		CycDemoJikiOam = {160,0,0,0,0,0,0,0,3,0,1,0,0};
static const actAnm			CycDemoJikiAnm0[] = {
{0x00,8,0,0},{0x40,8,0,0},{0x80,8,0,0},{0xc0,8,0,0},
{ACT_ANMLOOP,0,0,0}
};
static const actAnm* const	CycDemoJikiAnmTbl[]={CycDemoJikiAnm0};
static void					CycDemoJikiActMove(actWork* aw){}

const actHeader		CycDemoBoyActHeader ={
CELLID_CYCDEMO_BOY,PALID_CYCDEMO_BOY,&CycDemoJikiOam,
CycDemoJikiAnmTbl,ACT_NTRANS,DummyActAffTbl,CycDemoJikiActMove,
};

const actHeader		CycDemoGirlActHeader ={
CELLID_CYCDEMO_GIRL,PALID_CYCDEMO_GIRL,&CycDemoJikiOam,
CycDemoJikiAnmTbl,ACT_NTRANS,DummyActAffTbl,CycDemoJikiActMove,
};

//自転車
static const ActOamData		CycDemoJitensyaOam = {160,0,0,0,0,1,0,0,3,0,1,0,0};
static const actAnm			CycDemoJitensyaAnm0[] = {
{0x00,8,0,0},{0x20,8,0,0},{0x40,8,0,0},{0x60,8,0,0},
{ACT_ANMLOOP,0,0,0}
};
static const actAnm* const	CycDemoJitensyaAnmTbl[]={CycDemoJitensyaAnm0};

static void					CycDemoJitensyaActMove(actWork* aw)
{
	aw->banish	= ActWork[aw->work[0]].banish;
	aw->x		= ActWork[aw->work[0]].x;
	aw->y		= ActWork[aw->work[0]].y+8;
	aw->dx		= ActWork[aw->work[0]].dx;
	aw->dy		= ActWork[aw->work[0]].dy;
}
const actHeader		CycDemoBoyJitenActHeader ={
CELLID_CYCDEMO_JITENSYA,PALID_CYCDEMO_BOY,&CycDemoJitensyaOam,
CycDemoJitensyaAnmTbl,ACT_NTRANS,DummyActAffTbl,CycDemoJitensyaActMove,
};

const actHeader		CycDemoGirlJitenActHeader ={
CELLID_CYCDEMO_JITENSYA,PALID_CYCDEMO_GIRL,&CycDemoJitensyaOam,
CycDemoJitensyaAnmTbl,ACT_NTRANS,DummyActAffTbl,CycDemoJitensyaActMove,
};

u8	CycDemoBoySet(s16 x,s16 y)
{
	u8	actnum,actnum2;

	actnum = AddActor(&CycDemoBoyActHeader,x,y,0);
	actnum2 = AddActor(&CycDemoBoyJitenActHeader,x,y+8,1);
	ActWork[actnum2].work[0] = actnum;

	return	actnum;
}

u8	CycDemoGirlSet(s16 x,s16 y)
{
	u8	actnum,actnum2;

	actnum = AddActor(&CycDemoGirlActHeader,x,y,0);
	actnum2 = AddActor(&CycDemoGirlJitenActHeader,x,y+8,1);
	ActWork[actnum2].work[0] = actnum;

	return	actnum;
}

/*------------------------------------------------------------------*/
/*				ポケモン											*/
/*------------------------------------------------------------------*/
#define	CELLID_CYCDEMO_RATIOS	(1004)
#define	PALID_CYCDEMO_RATIOS	(1004)
#define	CELLID_CYCDEMO_RATIAS	(1005)
#define	PALID_CYCDEMO_RATIAS	(1005)
static const ActOamData		CycDemoPokeOam = {160,0,0,0,0,0,0,0,3,0,1,0,0};
static const actAnm			CycDemoPokeAnm0[] = {{0x00,16,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			CycDemoPokeAnm1[] = {{0x40,16,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm* const	CycDemoPokeAnmTbl[]={CycDemoPokeAnm0,CycDemoPokeAnm1};

static void					CycDemoPokeActMove1(actWork* aw)
{
}
static void					CycDemoPokeActMove2(actWork* aw)
{
	aw->banish	= ActWork[aw->work[0]].banish;
	aw->y		= ActWork[aw->work[0]].y;
	aw->dx		= ActWork[aw->work[0]].dx;
	aw->dy		= ActWork[aw->work[0]].dy;
}
const actHeader		CycDemoRatiosActHeader ={
CELLID_CYCDEMO_RATIOS,PALID_CYCDEMO_RATIOS,&CycDemoPokeOam,
CycDemoPokeAnmTbl,ACT_NTRANS,DummyActAffTbl,CycDemoPokeActMove1,
};
const actHeader		CycDemoRatiasActHeader ={
CELLID_CYCDEMO_RATIAS,PALID_CYCDEMO_RATIAS,&CycDemoPokeOam,
CycDemoPokeAnmTbl,ACT_NTRANS,DummyActAffTbl,CycDemoPokeActMove1,
};

u8	CycDemoRatiosSet(s16 x,s16 y)
{
	u8	actnum,actnum2;

	actnum = AddActor(&CycDemoRatiosActHeader,x-32,y,2);
	actnum2 = AddActor(&CycDemoRatiosActHeader,x+32,y,2);
	ActWork[actnum2].work[0] = actnum;
	ActAnmChg(&ActWork[actnum2],1);
	ActWork[actnum2].move = CycDemoPokeActMove2;

	return	actnum;
}

u8	CycDemoRatiasSet(s16 x,s16 y)
{
	u8	actnum,actnum2;

	actnum = AddActor(&CycDemoRatiasActHeader,x-32,y,2);
	actnum2 = AddActor(&CycDemoRatiasActHeader,x+32,y,2);
	ActWork[actnum2].work[0] = actnum;
	ActAnmChg(&ActWork[actnum2],1);
	ActWork[actnum2].move = CycDemoPokeActMove2;

	return	actnum;
}

/*------------------------------------------------------------------*/
/*				セル＆パレット設定データ							*/
/*------------------------------------------------------------------*/
const	CellData	CycDemoOBJcellBoy[] = {
	{ cyc01_ch_LZ,	0x3800	,CELLID_CYCDEMO_BOY },
	{ CELL_END, 0, 0 }
};
const	CellData	CycDemoOBJcellGirl[] = {
	{ cyc11_ch_LZ,	0x3800	,CELLID_CYCDEMO_GIRL },
	{ CELL_END, 0, 0 }
};
const	CellData	CycDemoOBJcellJitensya[] = {
	{ cyc02_ch_LZ,	0x1000	,CELLID_CYCDEMO_JITENSYA },
	{ CELL_END, 0, 0 }
};
const	CellData	CycDemoOBJcellRatios[] = {
	{ ratio_ch_LZ,	0x1000	,CELLID_CYCDEMO_RATIOS },
	{ CELL_END, 0, 0 }
};
const	CellData	CycDemoOBJcellRatias[] = {
	{ ratia_ch_LZ,	0x1000	,CELLID_CYCDEMO_RATIAS },
	{ CELL_END, 0, 0 }
};
const	PalData		CycDemoOBJpal[] = {
	{ cyc0_cl_Palette	,PALID_CYCDEMO_BOY },
	{ cyc1_cl_Palette	,PALID_CYCDEMO_GIRL },
	{ ratio_cl_Palette	,PALID_CYCDEMO_RATIOS },
	{ ratia_cl_Palette	,PALID_CYCDEMO_RATIAS },
	{ OBJPAL_END, 0 },
};

/*------------------------------------------------------------------*/
/*				エンディング用データ								*/
const	CellData	CycDemoOBJcellBoyEnd[] = {
	{ cyc01_ch_LZ,	0x2000	,CELLID_CYCDEMO_BOY },
	{ CELL_END, 0, 0 }
};
const	CellData	CycDemoOBJcellGirlEnd[] = {
	{ cyc11_ch_LZ,	0x2000	,CELLID_CYCDEMO_GIRL },
	{ CELL_END, 0, 0 }
};


