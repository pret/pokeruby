//******************************************************************
//          op_demo.c                                                  
//                                                                  
//          Copyright (C) 2001 GAME FREAK inc.
//******************************************************************
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "mus_tool.h"
#include "task.h"
#include "op_demo.dat"
#include "decord.h"
#include "calctool.h"
#include "poketool.h"
#include "objdata.h"
#include "monsno.def"
#include "pm_aff.h"
#include "laster.h"

#include "initgame.h"
#include "svld_ini.h"
#include "svld_sys.h"
#include "config.h"

#ifdef GCDOWNLOAD
#include "multisio.h"
#include "intr.h"
#include "pkjb_downloader.h"
PKJBDownParam pkjb_param;
#endif GCDOWNLOAD


extern	void	TitleInit(void);
extern	void	affineWorkSet(u8 num,u16 H_X,u16 V_X,u16 H_Y,u16 V_Y);
static	u16		OPdemoPokeActorSet(u16 pnum,s16 x,s16 y,u16 decord_p,u8 side);
static	u16		OPdemoTrainerActorSet(u16 tnum,s16 x,s16 y,u16 decord_p);

extern	const	CellData	CycDemoOBJcellBoy[];
extern	const	CellData	CycDemoOBJcellJitensya[];
extern	const	CellData	CycDemoOBJcellGirl[];
extern	const	CellData	CycDemoOBJcellRatios[];
extern	const	CellData	CycDemoOBJcellRatias[];
extern	const	PalData		CycDemoOBJpal[];

extern	u8	CycDemoBoySet(s16 x,s16 y);
extern	u8	CycDemoGirlSet(s16 x,s16 y);
extern	u8	CycDemoRatiosSet(s16 x,s16 y);
extern	u8	CycDemoRatiasSet(s16 x,s16 y);
extern	s16	cyc_demo_y;
extern	s16	cyc_demo_dy;

void			OPdemoInit(void);
void			OPdemoMain(void);
void			GoTitle(void);

static	void	RegInit(void);

static	void	OPdemo_Scene1InitTask(u8 id);
static	void	OPdemo_Scene1Init2Task(u8 id);
static	void	OPdemo_Scene1MainTask(u8 id);
static	void	OPdemo_Scene1MapScrollTask(u8 id);
static	void	OPdemo_Scene1EndWaitTask(u8 id);

static	void	OPdemo_Scene2InitTask(u8 id);
static	void	OPdemo_Scene2Init2Task(u8 id);
static	void	OPdemo_Scene2MainTask(u8 id);
static	void	OPdemo_Scene2EndWaitTask(u8 id);

static	void	OPdemo_Scene3InitTask(u8 id);
static	void	OPdemo_Scene3MainTask(u8 id);
static	void	OPdemo_Scene3EndWaitTask(u8 id);

static	void	OPdemo_Scene4InitTask(u8 id);
static	void	OPdemo_Scene4Init2Task(u8 id);
static	void	OPdemo_Scene4MainTask(u8 id);
static	void	OPdemo_Scene4EndWaitTask(u8 id);

static	void	OPdemo_Scene5InitTask(u8 id);
static	void	OPdemo_Scene5MainTask(u8 id);
static	void	OPdemo_Scene5EndWaitTask(u8 id);

#define	OPD_GF_TIMER	(0)

static	const u8 copy_light_str1[] = {
0x02,0x03,0x04,0x05,0x01,0x01,0x01,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,
};
static	const u8 copy_light_str2[] = {
0x02,0x0D,0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,
};
static	const u8 copy_light_str3[] = {
0x02,0x0D,0x0E,0x0F,0x10,0x11,0x12,0x1A,0x1B,0x1C,0x1D,0x1E,0x1F,0x20,0x21,
};
static	const u8 copy_light_str4[] = {
0x02,0x0D,0x0E,0x0F,0x10,0x11,0x12,0x22,0x23,0x24,0x25,0x26,0x27,0x28,0x29,0x2A,
};

u32	WaitWork;
u16	OPdemoMode = {0};
u16	OPdemoFlag = {0};

/********************************************************************/
/*                                                                  */
/*				割り込み											*/
/*                                                                  */
/********************************************************************/
static void VInterFunc( void )
{
	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
}

/********************************************************************/
/*                                                                  */
/*				メイン												*/
/*                                                                  */
/********************************************************************/
void	OPdemoMain(void)
{
											//キー判定よりもtaskが先にあるのは
	MainTask();								//最初の一回だけキー入力の前に通信初期化をさせたいから
	JumpActor();
	SetActor();
	PaletteAnime();

	if((sys.Trg)&&(!FadeData.fade_sw)){
		MainProcChange(GoTitle);
		return;
	}

	if(WaitWork!= 0xffffffff)	WaitWork++;
}

/********************************************************************/
/*                                                                  */
/*				終了												*/
/*                                                                  */
/********************************************************************/
void	GoTitle(void)
{
	if(!(PaletteAnime())){
		MainProcChange(TitleInit);
	}
}

/********************************************************************/
/*                                                                  */
/*				ロゴ画面作成										*/
/*                                                                  */
/********************************************************************/
void	MaruC_logoMake(u16 cgx_offs,u16 scr_offs,u16 pal_offs)
{
	u16	i;

	LZ77UnCompVram((void*)cp_light_LZ,(void*)(BG_VRAM + cgx_offs));
	PaletteWorkSet(cp_light_Palette,pal_offs,0x20);
	for(i=0;i<32*32;i++)	*(u16*)(BG_VRAM + scr_offs + i*2) = 0x01;
	for(i=0;i<14;i++)	*(u16*)(BG_VRAM + scr_offs + 6*64 + (i+7)*2) = copy_light_str1[i];
	for(i=0;i<14;i++)	*(u16*)(BG_VRAM + scr_offs + 8*64 + (i+7)*2) = copy_light_str2[i];
	for(i=0;i<15;i++)	*(u16*)(BG_VRAM + scr_offs +10*64 + (i+7)*2) = copy_light_str3[i];
	for(i=0;i<16;i++)	*(u16*)(BG_VRAM + scr_offs +12*64 + (i+7)*2) = copy_light_str4[i];
}

/********************************************************************/
/*                                                                  */
/*				初期化												*/
/*                                                                  */
/********************************************************************/
#ifdef GCDOWNLOAD
void PKJBSioIntr(void)
{
  PKJBDownJoyIntr(&pkjb_param);
}
#endif GCDOWNLOAD

static	u8	OPdemoInitSub(void)
{
	switch(sys.InitSeqWork){
	case 0:
		SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)

		*(vu16 *)REG_BLDCNT		= 0;	//半透明設定
		*(vu16 *)REG_BLDALPHA	= 0;
		*(vu16 *)REG_BLDY		= 0;
		*(vu16 *)PLTT			= 0x7FFF;
		*(vu16 *)REG_DISPCNT	= 0;
		*(vu16 *)REG_BG0HOFS	= 0;
		*(vu16 *)REG_BG0VOFS	= 0; 

		DmaClear(3, 0, VRAM, VRAM_SIZE,           16);	// VRAM   初期化
		DmaClear(3, 0, OAM,  OAM_SIZE,            32);	// OAM    初期化
		DmaClear(3, 0, PLTT+2, PLTT_SIZE-2,       16);	// ﾊﾟﾚｯﾄ  初期化(BackGround>白)

		PaletteAnimeInit();
		MaruC_logoMake(0x0000,0x3800,PA_BG0);

		LasterInit();									// HDMA初期化
		InitTask();										// ﾀｽｸ  初期化
		InitActor();									// ｱｸﾀｰ初期化
		ObjPalManInit();								// ｵﾌﾞｼﾞｪﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ初期化

		PaletteFadeReq(0xffffffff,0,16,0,0xffff);

		*(vu16 *)REG_BG0CNT = BG_COLOR_16					//16色選択
							| BG_SCREEN_SIZE_0				// スクリーンサイズ
							| BG_PRIORITY_0					//BG優先順位
							| 7 << BG_SCREEN_BASE_SHIFT		//スクリーンベースブロック
							| 0 << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック

		REG_IE_SET( V_BLANK_INTR_FLAG );// VBLANK割込許可
		*(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;

		SetVBlankFunc(VInterFunc);			//割込み関数設定(VBLANK)

		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0				// BGモード 
							|	DISP_OBJ_CHAR_1D_MAP	// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							|	DISP_BG0_ON				// BG0有効
							;
#ifdef	GCDOWNLOAD
		SetSioFunc(PKJBSioIntr);
		PKJBDownInit(&pkjb_param);
#endif	GCDOWNLOAD

	default:
		//ロゴ表示期間
		PaletteAnime();
		sys.InitSeqWork++;
#ifdef	GCDOWNLOAD
		PKJBDownMainFrame(&pkjb_param);
#endif	GCDOWNLOAD
		break;
	case 140:
#ifdef	GCDOWNLOAD
	  /* 通信中はシーケンスを進めないようにする */
	  PKJBDownMainFrame(&pkjb_param);
	  if(PKJBDownCheckDLStart(&pkjb_param) == 1)	break;
#endif	GCDOWNLOAD
		PaletteFadeReq(0xffffffff,0,0,16,0);
		sys.InitSeqWork++;
		break;
	case 141:
		if(!(PaletteAnime())){
			AddTask(OPdemo_Scene1InitTask, 0);
			MainProcChange(OPdemoMain);
#ifdef	GCDOWNLOAD
			if(PKJBDownCheckDLStart(&pkjb_param)){
			  PKJBDownTryBoot(&pkjb_param);
			} else {
			  PKJBDownStop();
			  SetSioFunc(Multi_SioIntr);      // 通信割り込み
			}
#endif	GCDOWNLOAD
			return 0;
		}
		break;
	}
	return 1;
}

//デモ開始（一周目）
void	OPdemoInit(void)
{
	if(OPdemoInitSub())	return;

	InitGameWork();

	//データロード＆データ存在確認
	SaveLoadSysInit();
	PokeAGBLoad(POKEAGB_LDALL);
	if((SaveDataCheckInfo == SVLD_RET_NULL)			//バックアップなし（初期）
 	||(SaveDataCheckInfo == SVLD_RET_DESTROY)){	//バックアップ完全破壊（復旧不可）
		//セーブ初期化
		SysSaveDataInit();
	}
	pokStereoMono(MyData.sound_mode);		// サウンド設定
}

//デモ開始（二周目以降）
void	OPdemoInitReturn(void)
{
	OPdemoInitSub();
}

/********************************************************************/
/*                                                                  */
/*				メイン処理（タスク）								*/
/*                                                                  */
/********************************************************************/
#define	SIZUKU_AFF		(0x200)
#define	SIZUKU_X		(236)
#define	SIZUKU_Y		(-14)

#define	OPD_S1_MAP0Y	(40)
#define	OPD_S1_MAP1Y	(24)
#define	OPD_S1_MAP2Y	(80)
#define	OPD_S1_MAP3Y	(0)

#define	OPD_S1_MAP0SP	(0x18000)
#define	OPD_S1_MAP1SP	(0x10000)
#define	OPD_S1_MAP2SP	(0x0c000)

/*------------------------------------------------------------------*/
/*				シーン１（雨上がり背景）							*/
/*------------------------------------------------------------------*/
static	const CellData		OpDemoS1Cell[];
static	const CellData		OpDemoS1_2Cell[];
static	const PalData		OpDemoS1Pal[];
static	const actHeader		SizukuActHeader;
static const actHeader		PokeSilActHeader;
static	u8	SizukuActSet(s16 x,s16 y,u16 aff,u16 affnum,u16 end_y,u8 type);
static	u8	GFpreActSet(s16 x,s16 y,u8 taskID);
static	void	OPdemoOBJfadeInOutTask(u8 id);

static	void	OPdemo_Scene1InitTask(u8 id)
{
	SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)

	OPdemoMode = (pp_rand()&0x0001);	//デモ表示性別決定（０＝男、１＝女）

	RegInit();
	*(vu16 *)REG_BG3VOFS	= OPD_S1_MAP3Y;
	*(vu16 *)REG_BG2VOFS	= OPD_S1_MAP2Y;
	*(vu16 *)REG_BG1VOFS	= OPD_S1_MAP1Y;
	*(vu16 *)REG_BG0VOFS	= OPD_S1_MAP0Y;

	LZ77UnCompVram((void*)opd_gimg_LZ,(void*)(BG_VRAM + 0x0000));		//BG0 CGX転送

	LZ77UnCompVram((void*)opd_s1_0_LZ,(void*)(BG_VRAM + 0x8000));	//BG0 MAP転送
	DIV_DMACLEAR(3,0,BG_VRAM + 0x8800,0x0800,16);					//BG0 MAPクリア転送
	LZ77UnCompVram((void*)opd_s1_1_LZ,(void*)(BG_VRAM + 0x9000));	//BG1 MAP転送
	DIV_DMACLEAR(3,0,BG_VRAM + 0x9800,0x0800,16);					//BG1 MAPクリア転送
	LZ77UnCompVram((void*)opd_s1_2_LZ,(void*)(BG_VRAM + 0xa000));	//BG2 MAP転送
	DIV_DMACLEAR(3,0,BG_VRAM + 0xa800,0x0800,16);					//BG2 MAPクリア転送
	LZ77UnCompVram((void*)opd_s1_3_LZ,(void*)(BG_VRAM + 0xb000));	//BG3 MAP転送
	DIV_DMACLEAR(3,0,BG_VRAM + 0xb800,0x0800,16);					//BG3 MAPクリア転送
	PaletteWorkSet(opd_bg_Palette,PA_BG0,0x200);
	*(vu16 *)REG_BG3CNT = BG_COLOR_16 | BG_SCREEN_SIZE_2 | BG_PRIORITY_3	
						| 22 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
	*(vu16 *)REG_BG2CNT = BG_COLOR_16 | BG_SCREEN_SIZE_2 | BG_PRIORITY_2			
						| 20 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
	*(vu16 *)REG_BG1CNT = BG_COLOR_16 | BG_SCREEN_SIZE_2 | BG_PRIORITY_1		
						| 18 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT ;
	*(vu16 *)REG_BG0CNT = BG_COLOR_16 | BG_SCREEN_SIZE_2 | BG_PRIORITY_0		
						| 16 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT ;

	DecordCellSet((CellData*)OpDemoS1Cell);
	DecordCellSet((CellData*)OpDemoS1_2Cell);
	ObjPalSets((PalData*)OpDemoS1Pal);
	CpuCopy(&PaletteWork[PA_OBJ0+PA_COL0],&PaletteWork[PA_OBJ15+PA_COL0],0x20,16);
	CpuCopy(&PaletteWork[PA_OBJ0+PA_COL0],&PaletteWork[PA_OBJ14+PA_COL1],0x1e,16);
	CpuCopy(&PaletteWork[PA_OBJ0+PA_COL0],&PaletteWork[PA_OBJ13+PA_COL2],0x1c,16);
	CpuCopy(&PaletteWork[PA_OBJ0+PA_COL0],&PaletteWork[PA_OBJ12+PA_COL3],0x1a,16);
	CpuCopy(&PaletteWork[PA_OBJ0+PA_COL0],&PaletteWork[PA_OBJ11+PA_COL4],0x18,16);
	CpuCopy(&PaletteWork[PA_OBJ0+PA_COL0],&PaletteWork[PA_OBJ10+PA_COL5],0x16,16);
	CpuCopy(&PaletteWork[PA_OBJ0+PA_COL0],&PaletteWork[PA_OBJ9 +PA_COL6],0x14,16);

	TaskTable[id].work[0] = SizukuActSet(SIZUKU_X,SIZUKU_Y,SIZUKU_AFF,1,15*8,0);
	TaskTable[id].TaskAdrs	= OPdemo_Scene1Init2Task;
}
static	void	OPdemo_Scene1Init2Task(u8 id)
{
	PaletteFadeReq(0xffffffff,0,16,0,0);
	SetVBlankFunc(VInterFunc);			//割込み関数設定(VBLANK)

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0	| DISP_OBJ_CHAR_1D_MAP
							| DISP_BG0_ON | DISP_BG1_ON | DISP_BG2_ON | DISP_BG3_ON	
							| DISP_OBJ_ON ;
	TaskTable[id].TaskAdrs	= OPdemo_Scene1MainTask;

	WaitWork = 0;
	m4aSongNumStart(MUS_DEMO1);
	Multi_SioGameInit();				//通信コネクタチェック用に一回呼び出し

}

static	void	OPdemo_Scene1MainTask(u8 id)
{
	u8	taskID;

	if(WaitWork == 0x004c){
		ActWork[TaskTable[id].work[0]].work[0] = 1;
	}
	if(WaitWork == 0x00fb){
		ActWork[TaskTable[id].work[0]].work[0] = 2;
	}
	if(WaitWork == 0x0170){
		SizukuActSet(48,0,0x400,5,14*8,1);
	}
	if(WaitWork == 0x0180){
		SizukuActSet(200,60,0x400,9,16*8,1);
	}
	if(WaitWork == 0x0230){
		taskID = AddTask(OPdemoOBJfadeInOutTask, 0);
		GFpreActSet(120,80,taskID);
	}
	if(WaitWork > 0x02e3){
		TaskTable[id].work[1] = OPD_S1_MAP2Y;
		TaskTable[id].work[2] = 0;
		TaskTable[id].work[3] = OPD_S1_MAP1Y;
		TaskTable[id].work[4] = 0;
		TaskTable[id].work[5] = OPD_S1_MAP0Y;
		TaskTable[id].work[6] = 0;
		TaskTable[id].TaskAdrs	= OPdemo_Scene1MapScrollTask;
	}
}

static	void	OPdemo_Scene1MapScrollTask(u8 id)
{
	u8	actnum;
	s32	y;

	if(WaitWork < 0x0388){
		y = (TaskTable[id].work[1] << 16) + (TaskTable[id].work[2]&0xffff);
		y -= OPD_S1_MAP2SP;
		TaskTable[id].work[1] = (y >> 16) & 0xffff;
		TaskTable[id].work[2] = y & 0xffff;
		*(vu16 *)REG_BG2VOFS = TaskTable[id].work[1]; 

		y = (TaskTable[id].work[3] << 16) + (TaskTable[id].work[4]&0xffff);
		y -= OPD_S1_MAP1SP;
		TaskTable[id].work[3] = (y >> 16) & 0xffff;
		TaskTable[id].work[4] = y & 0xffff;
		*(vu16 *)REG_BG1VOFS = TaskTable[id].work[3]; 

		y = (TaskTable[id].work[5] << 16) + (TaskTable[id].work[6]&0xffff);
		y -= OPD_S1_MAP0SP;
		TaskTable[id].work[5] = (y >> 16) & 0xffff;
		TaskTable[id].work[6] = y & 0xffff;
		*(vu16 *)REG_BG0VOFS = TaskTable[id].work[5]; 

		if(WaitWork == 0x0370){
			actnum = AddActor( &PokeSilActHeader,200,160,10);
			ActWork[actnum].banish = 1;
		}
	}else{
		if(WaitWork >= 0x03f0){
			PaletteFadeReq(0xffffffff,0,0,16,0xffff);
			TaskTable[id].TaskAdrs	= OPdemo_Scene1EndWaitTask;
		}
	}
}

static	void	OPdemo_Scene1EndWaitTask(u8 id)
{
	if(WaitWork >= 0x0403){
		TaskTable[id].TaskAdrs	= OPdemo_Scene2InitTask;
	}
}

/*------------------------------------------------------------------*/
/*				シーン２（自転車駆け抜け）							*/
/*------------------------------------------------------------------*/
static void			OpdemoJikiActMove(actWork* aw);
static void			OpdemoPokeActMove(actWork* aw);
static const actAnm* const	OpdemoJikiAnmTbl[];
extern void			CycDemoBGSet(u8 mode);
extern void			CycDemoRegSet(u8 mode);
extern u8			CycDemoBGScrollSet(u8 mode,u16 BG1sp,u16 BG2sp,u16 BG3sp);
extern	void		CycDemoBGEffect(u8 mode);

static	void	OPdemo_Scene2InitTask(u8 id)
{
	/* 分割１ */
	RegInit();
	SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)

	InitActor();									// ｱｸﾀｰ初期化
	ObjPalManInit();								// ｵﾌﾞｼﾞｪﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ初期化
	cyc_demo_y = 0;
	cyc_demo_dy = 0;

#if (PM_VERSION == VERSION_SAPPHIRE)
	CycDemoBGSet(0);
#elif (PM_VERSION == VERSION_RUBY)
	CycDemoBGSet(1);
#endif
	TaskTable[id].TaskAdrs	= OPdemo_Scene2Init2Task;
}
static	void	OPdemo_Scene2Init2Task(u8 id)
{
	/* 分割２ */
	u8	actnum;

	if(!OPdemoMode){	//性別（０＝男、１＝女）
		DecordCellSet((CellData*)CycDemoOBJcellBoy);
	}else{
		DecordCellSet((CellData*)CycDemoOBJcellGirl);
	}
	DecordCellSet((CellData*)CycDemoOBJcellJitensya);
#if (PM_VERSION == VERSION_SAPPHIRE)
	DecordCellSet((CellData*)CycDemoOBJcellRatias);
#elif (PM_VERSION == VERSION_RUBY)
	DecordCellSet((CellData*)CycDemoOBJcellRatios);
#endif
	ObjPalSets((PalData*)CycDemoOBJpal);

	if(!OPdemoMode){	//性別（０＝男、１＝女）
		actnum = CycDemoBoySet(240+32,100);
	}else{
		actnum = CycDemoGirlSet(240+32,100);
	}
	ActWork[actnum].move = OpdemoJikiActMove;
	ActWork[actnum].anm_tbl = OpdemoJikiAnmTbl;
	TaskTable[id].work[1] = actnum;

#if (PM_VERSION == VERSION_SAPPHIRE)
	actnum = CycDemoRatiasSet(-64,60);
#elif (PM_VERSION == VERSION_RUBY)
	actnum = CycDemoRatiosSet(-64,60);
#endif
	ActWork[actnum].move = OpdemoPokeActMove;
	TaskTable[id].work[2] = actnum;

	PaletteFadeReq(0xffffffff,0,16,0,0xffff);
	SetVBlankFunc(VInterFunc);			//割込み関数設定(VBLANK)
#if (PM_VERSION == VERSION_SAPPHIRE)
	TaskTable[id].work[0] = CycDemoBGScrollSet(0,0x4000,0x0040,0x0010);
	CycDemoRegSet(0);
#elif (PM_VERSION == VERSION_RUBY)
	TaskTable[id].work[0] = CycDemoBGScrollSet(1,0x4000,0x0400,0x0010);
	CycDemoRegSet(1);
#endif
	TaskTable[id].TaskAdrs	= OPdemo_Scene2MainTask;
}

static	void	OPdemo_Scene2MainTask(u8 id)
{
//	if(WaitWork >= 0x06ed){
	if(WaitWork >= 0x0720){
		PaletteFadeReq(0xffffffff,16,0,16,0xffff);
		TaskTable[id].TaskAdrs	= OPdemo_Scene2EndWaitTask;
	}
	if(WaitWork == 0x0455)	ActWork[TaskTable[id].work[1]].work[0] = 1;
	if(WaitWork == 0x04be)	ActWork[TaskTable[id].work[1]].work[0] = 0;
	if(WaitWork == 0x0572)	ActWork[TaskTable[id].work[2]].work[0] = 1;
	if(WaitWork == 0x0576)	ActWork[TaskTable[id].work[1]].work[0] = 2;
	if(WaitWork == 0x0632)	ActWork[TaskTable[id].work[1]].work[0] = 3;
	if(WaitWork == 0x06bf)	ActWork[TaskTable[id].work[1]].work[0] = 4;

	cyc_demo_dy = SinMove((u8)((TaskTable[id].work[3]>>2)&0x7f),0x30);
	
	if(TaskTable[id].work[3] < 0x200)	TaskTable[id].work[3]++;
#if (PM_VERSION == VERSION_SAPPHIRE)
	CycDemoBGEffect(0);
#elif (PM_VERSION == VERSION_RUBY)
	CycDemoBGEffect(1);
#endif
}

static	void	OPdemo_Scene2EndWaitTask(u8 id)
{
//	if(WaitWork >= 0x07b5){
	if(WaitWork >= 0x0815){
		DelTask(TaskTable[id].work[0]);
		TaskTable[id].TaskAdrs	= OPdemo_Scene3InitTask;
	}
}

/*------------------------------------------------------------------*/
/*				シーン３（バトル場ＩＮ）							*/
/*------------------------------------------------------------------*/
void	BGAffineCalcSet(u16 x,u16 y,u16 ratio,u16 theta);

static	void	OPdemo_Scene3InitTask(u8 id)
{
	RegInit();

	LZ77UnCompVram((void*)opdemo3_LZ,(void*)(BG_VRAM + 0x0000));//BG3 CGX転送
	LZ77UnCompVram((void*)opd_s3_LZ,(void*)(BG_VRAM + 0x4000));	//BG3 SCR転送
	PaletteWorkSet(opdemo3_Palette,PA_BG0,0x200);

	TaskTable[id].work[0] = 0;
	TaskTable[id].work[1] = 0;
	TaskTable[id].work[2] = 0;
	TaskTable[id].work[3] = 0;
	BGAffineCalcSet(120,80,TaskTable[id].work[1],TaskTable[id].work[0]);

	InitActor();									// ｱｸﾀｰ初期化
	ObjPalManInit();								// ｵﾌﾞｼﾞｪﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ初期化

	PaletteFadeReq(0xffffffff,0,16,0,0xffff);
	*(vu16 *)REG_BG2CNT = BG_COLOR_256 | BG_SCREEN_SIZE_1 | BG_PRIORITY_3	
						| 8 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
						| BG_LOOP_OFF;

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_1	| DISP_OBJ_CHAR_1D_MAP
							| DISP_BG2_ON 
							| DISP_OBJ_ON ;
	TaskTable[id].TaskAdrs	= OPdemo_Scene3MainTask;
	WaitWork = 0;
	m4aSongNumStart(MUS_T_BATTLE);
}

static	void	OPdemo_Scene3MainTask(u8 id)
{
	TaskTable[id].work[0]+=0x0400;

	if(TaskTable[id].work[1] < 0x6c0){
		TaskTable[id].work[1] += TaskTable[id].work[2];
		TaskTable[id].work[2]++;
	}else{
		TaskTable[id].TaskAdrs	= OPdemo_Scene3EndWaitTask;
	}
	BGAffineCalcSet(120,80,0x10000/TaskTable[id].work[1],TaskTable[id].work[0]);
	if(WaitWork == 0x02c){
		PaletteFadeReq(0xffffffff,0,0,16,0xffff);
	}
}

static	void	OPdemo_Scene3EndWaitTask(u8 id)
{
	if(WaitWork >= 0x03c){
		TaskTable[id].TaskAdrs	= OPdemo_Scene4InitTask;
	}
}


/*------------------------------------------------------------------*/
/*				シーン４（バトルＢＧレイアウト）					*/
/*------------------------------------------------------------------*/
#define	BATTLE_BACK_COLOR	(0x37f7)
static	const CellData		OpDemoS4Cell[];
static	const PalData		OpDemoS4Pal[];
static	const CellData		OpDemoS5Cell[];
static	const PalData		OpDemoS5Pal[];
static	void	OPdemo_Scene5ScrollTask(u8 id);
static	void	OPdemoBattleBackColorSet(u8 mode);

static	void	OPdemo_Scene4InitTask(u8 id)
{
	/* 分割１ */
	u16	i;

	RegInit();

	for(i=0;i<0x20;i++){
		*(u8*)(UserWork+0x0000+i) = 0;		//ＢＧキャラ０＝ＮＵＬＬ
		*(u8*)(UserWork+0x0020+i) = 0x11;	//ＢＧキャラ１＝白（パレット１）
		*(u8*)(UserWork+0x0040+i) = 0x22;	//ＢＧキャラ２＝黒（パレット２）
	}
	DIV_DMACOPY(3, &UserWork[0x00000], BG_VRAM, 0x0060,16)	//BG CGX転送
	for(i=0;i<0x280;i++)	*(u16*)(BG_VRAM + 0x3000+i*2) = 0xf001;		//BG3 MAP転送（背景）
	for(i=0;i<0x080;i++)	*(u16*)(BG_VRAM + 0x3800+0x0000+i*2) = 0xf002;//BG0 MAP転送（マスク上）
	for(i=0;i<0x180;i++)	*(u16*)(BG_VRAM + 0x3800+0x0100+i*2) = 0xf000;//BG0 MAP転送（クリア）
	for(i=0;i<0x080;i++)	*(u16*)(BG_VRAM + 0x3800+0x0400+i*2) = 0xf002;//BG0 MAP転送（マスク上）
	PaletteWork[PA_BG15 + PA_COL0] = 0x7fff;
	PaletteWorkTrans[PA_BG15 + PA_COL0] = 0x7fff;
	OPdemoBattleBackColorSet(1);
	PaletteWork[PA_BG15 + PA_COL2] = 0;
	PaletteWorkTrans[PA_BG15 + PA_COL2] = 0;
	LZ77UnCompVram((void*)opd_ch4_LZ,(void*)(BG_VRAM + 0x4000));	//BG2 CGX転送
	LZ77UnCompVram((void*)opd_s4_LZ,(void*)(BG_VRAM + 0x7000));		//BG2 MAP転送
	PaletteWorkSet(opdemo4_Palette,PA_BG0,0x20);

	InitActor();									// ｱｸﾀｰ初期化
	ObjPalManInit();								// ｵﾌﾞｼﾞｪﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ初期化
	ObjPalManStart = 8;								// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始
	DecordCellSet((CellData*)OpDemoS4Cell);
	DecordCellSet((CellData*)OpDemoS5Cell);
	DecordPalSet((PalData*)OpDemoS4Pal);
	ObjPalSets((PalData*)OpDemoS5Pal);

	TaskTable[id].TaskAdrs	= OPdemo_Scene4Init2Task;
}

static	void	OPdemo_Scene4Init2Task(u8 id)
{
	/* 分割２ */
	*(vu16 *)REG_WIN0H	= (0*0x100)+240;
	*(vu16 *)REG_WIN0V	= (0*0x100)+160;
	*(vu16 *)REG_WININ	= 0x001c;
	*(vu16 *)REG_WINOUT	= 0x001d;

	*(vu16 *)REG_BG3CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_3	
						| 6 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
	*(vu16 *)REG_BG0CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_0			
						| 7 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0	| DISP_OBJ_CHAR_1D_MAP
							| DISP_BG0_ON | DISP_BG3_ON	
							| DISP_WIN0_ON| DISP_OBJ_ON ;

	TaskTable[id].work[15] = AddTask(OPdemo_Scene5ScrollTask, 0);	//スクロールタスクセット
	TaskTable[TaskTable[id].work[15]].work[0] = 0;	//スクロールタスク設定（OFF）

	TaskTable[id].work[0] = 0;
	TaskTable[id].TaskAdrs	= OPdemo_Scene4MainTask;
}

static	void	OPdemo_Scene4MainTask(u8 id)
{
	if(TaskTable[id].work[0] != 32){
		TaskTable[id].work[0]+=4;
		*(vu16 *)REG_WIN0V	= (TaskTable[id].work[0]*0x100)+(160 - TaskTable[id].work[0]);
	}else{
		*(vu16 *)REG_WIN0V	= (32*0x100)+128;
		TaskTable[id].TaskAdrs	= OPdemo_Scene4EndWaitTask;
	}
}

static	void	OPdemo_Scene4EndWaitTask(u8 id)
{
	TaskTable[id].TaskAdrs	= OPdemo_Scene5InitTask;
}

/*------------------------------------------------------------------*/
/*				シーン５（バトル開始）								*/
/*------------------------------------------------------------------*/
static void			OpdemoBattlePokeE1ActMove(actWork* aw);
static void			OpdemoBattlePokeM1ActMove(actWork* aw);
static void			OpdemoBattlePokeE2ActMove(actWork* aw);
static void			OpdemoBattlePokeM2ActMove(actWork* aw);
static void			OpdemoBattleMineActMove(actWork* aw);
static void			Ef_HakaiActSet(u8 pokeact);
static void			Ef_OnibiActSet(u8 pokeact);
static void			Ef_KaenActSet(u8 pokeact);
static void			Ef_PonpuActSet(u8 pokeact);
static const actHeader		MballActHeader;
static const actHeader		Ef_BombActHeader;

static	void	OPdemo_Scene5InitTask(u8 id)
{
	OPdemoFlag = 0;
	TaskTable[id].TaskAdrs	= OPdemo_Scene5MainTask;
}

static	void	OPdemo_Scene5MainTask(u8 id)
{
	u8	actnum;

	if(WaitWork == 0x050){
		actnum = OPdemoPokeActorSet(MONSNO_SAMEHADAA,240,160,5,POKE_FRONT);	//敵１出現
		ActWork[actnum].move = OpdemoBattlePokeE1ActMove;
		ActWork[actnum].work[1] = 1;	//AffineWork位置
		ActWork[actnum].work[2] = 0;	//向き（Ｘ加減算用）
	}
	if(WaitWork == 0x098){
		actnum = OPdemoPokeActorSet(MONSNO_YOMAWARU,0,160,4,POKE_FRONT);	//敵２出現
		ActWork[actnum].move = OpdemoBattlePokeE1ActMove;
		ActWork[actnum].work[1] = 2;	//AffineWork位置
		ActWork[actnum].work[2] = 1;	//向き（Ｘ加減算用）
	}
	if(WaitWork == 0x0db){
		OPdemoBattleBackColorSet(0);
		actnum = OPdemoTrainerActorSet(OPdemoMode,240+32,96,6);
		ActWork[actnum].move = OpdemoBattleMineActMove;
		TaskTable[id].work[1] = actnum;
	}
	if(WaitWork == 0x130){
		TaskTable[TaskTable[id].work[15]].work[0] = 4;	//スクロールタスク設定
		ActWork[TaskTable[id].work[1]].work[0] = 2;	//ボール投げる
	}
	if(WaitWork == 0x180){
		TaskTable[TaskTable[id].work[15]].work[0] = 0;	//スクロールタスク設定（OFF）
		ActWork[TaskTable[id].work[1]].work[0] = 4;	//ボール消去（味方ポケモン出現）
	}
	if(WaitWork == 0x190){
		PaletteFadeReq(0x00ff0000,0,16,0,0x7eff);
	}
	if(WaitWork == 0x1b0){
		ActWork[TaskTable[id].work[1]].work[0] = 5;	//味方落下
	}
	if(WaitWork == 0x1ce){
		ActWork[TaskTable[id].work[1]].work[0] = 6;	//味方消去
		TaskTable[TaskTable[id].work[15]].work[0] = 2;	//スクロールタスク設定
	}
	if(WaitWork == 0x1cf){
		OPdemoBattleBackColorSet(1);
		actnum = OPdemoPokeActorSet(MONSNO_SAMEHADAA,240-32,8,5,POKE_FRONT);	//敵１接近
		ActWork[actnum].move = OpdemoBattlePokeE2ActMove;
		TaskTable[id].work[2] = actnum;	
		Ef_HakaiActSet(actnum);
	}
	if(WaitWork == 0x21b){
		actnum = OPdemoPokeActorSet(MONSNO_YOMAWARU,248,16,4,POKE_FRONT);	//敵２接近
		ActWork[actnum].move = OpdemoBattlePokeE2ActMove;
		TaskTable[id].work[3] = actnum;	
		Ef_OnibiActSet(actnum);
	}
	if(WaitWork == 0x26f){
		ActWork[TaskTable[id].work[2]].work[0] = 2;	//敵一時消去
		ActWork[TaskTable[id].work[3]].work[0] = 2;	//敵一時消去
		TaskTable[TaskTable[id].work[15]].work[0] = 3;	//スクロールタスク設定
	}
	if(WaitWork == 0x270){
		OPdemoBattleBackColorSet(0);
		actnum = OPdemoPokeActorSet(MONSNO_MIZUGOROU,32,160-8,0,POKE_BACK);		//味方１接近
		
		ActWork[actnum].move = OpdemoBattlePokeM2ActMove;
		TaskTable[id].work[4] = actnum;	
		Ef_PonpuActSet(actnum);
	}
	if(WaitWork == 0x2bc){
		actnum = OPdemoPokeActorSet(MONSNO_ATYAMO,-8,160-16,1,POKE_BACK);	//味方２接近
		ActWork[actnum].move = OpdemoBattlePokeM2ActMove;
		TaskTable[id].work[5] = actnum;	
		Ef_KaenActSet(actnum);
	}
	if(WaitWork == 0x308){
		OPdemoFlag = 1;
		ActWork[TaskTable[id].work[4]].work[0] = 2;	//味方一時消去
		ActWork[TaskTable[id].work[5]].work[0] = 2;	//味方一時消去
		TaskTable[TaskTable[id].work[15]].work[0] = 0;	//スクロールタスク設定（OFF）
	}
	if(WaitWork == 0x30d){
		OPdemoBattleBackColorSet(2);
		ActWork[TaskTable[id].work[2]].work[0] = 3;	//敵復帰
		ActWork[TaskTable[id].work[3]].work[0] = 3;	//敵復帰
		ActWork[TaskTable[id].work[4]].work[0] = 3;	//味方復帰
		ActWork[TaskTable[id].work[5]].work[0] = 3;	//味方復帰
		actnum = AddActor( &Ef_BombActHeader,120,80,15);
		ActWork[actnum].banish = 1;
	}
	if(WaitWork == 0x320)	SePlay(SE_OP_BASYU);
	if(WaitWork == 0x392-0x040){	//フェード差分（-0x040）
		PaletteFadeReq(0xffffffff,4,0,16,0xffff);
	}
	if(WaitWork == 0x392+0x020){	//ウェイト（0x020）
		TaskTable[id].TaskAdrs	= OPdemo_Scene5EndWaitTask;
	}
}

static	void	OPdemo_Scene5EndWaitTask(u8 id)
{
	DelTask(id);
	MainProcChange(GoTitle);
}

static	void	OPdemo_Scene5ScrollTask(u8 id)
{
	TaskTable[id].work[15]++;		//タイマー

	switch(TaskTable[id].work[0]){
	case 0:		//OFF 初期化
		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0	| DISP_OBJ_CHAR_1D_MAP
								| DISP_BG0_ON | DISP_BG3_ON	
								| DISP_WIN0_ON| DISP_OBJ_ON ;
		*(vu16 *)REG_BG2CNT = 0;
		TaskTable[id].work[0] = 0xff;
	case 0xff:	//OFF待機
		break;
	case 2:		//ななめスクロール（左上→右下） 初期化
		PaletteFadeReq(0x00000001,0,16,0,0xffff);
		*(vu16 *)REG_BG2CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_3	
							| 14 << BG_SCREEN_BASE_SHIFT | 1 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0	| DISP_OBJ_CHAR_1D_MAP
								| DISP_BG0_ON | DISP_BG2_ON	| DISP_BG3_ON	
								| DISP_WIN0_ON| DISP_OBJ_ON ;
		TaskTable[id].work[1] = 0;
		TaskTable[id].work[2] = 0;
		TaskTable[id].work[0] = 20;
	case 20:	//ななめスクロール（左上→右下）
		*(vu16 *)REG_BG2VOFS = TaskTable[id].work[1];
		*(vu16 *)REG_BG2HOFS = TaskTable[id].work[2];
		TaskTable[id].work[1] += 6;
		TaskTable[id].work[2] -= 8;
		break;

	case 3:		//ななめスクロール（右下→左上） 初期化
		PaletteFadeReq(0x00000001,0,16,0,0xffff);
		*(vu16 *)REG_BG2CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_3	
							| 14 << BG_SCREEN_BASE_SHIFT | 1 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0	| DISP_OBJ_CHAR_1D_MAP
								| DISP_BG0_ON | DISP_BG2_ON	| DISP_BG3_ON	
								| DISP_WIN0_ON| DISP_OBJ_ON ;
		TaskTable[id].work[1] = 0;
		TaskTable[id].work[2] = 0;
		TaskTable[id].work[0] = 30;
	case 30:	//ななめスクロール（右下→左上）
		*(vu16 *)REG_BG2VOFS = TaskTable[id].work[1];
		*(vu16 *)REG_BG2HOFS = TaskTable[id].work[2];
		TaskTable[id].work[1] -= 6;
		TaskTable[id].work[2] += 8;
		break;

	case 4:		//ななめスクロール（右下→左上：スピードダウン） 初期化
		PaletteFadeReq(0x00000001,5,0,16,BATTLE_BACK_COLOR);
		*(vu16 *)REG_BG2CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_3	
							| 14 << BG_SCREEN_BASE_SHIFT | 1 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0	| DISP_OBJ_CHAR_1D_MAP
								| DISP_BG0_ON | DISP_BG2_ON	| DISP_BG3_ON	
								| DISP_WIN0_ON| DISP_OBJ_ON ;
		TaskTable[id].work[1] = 0;
		TaskTable[id].work[2] = 0;
		TaskTable[id].work[3] = 8;
		TaskTable[id].work[0] = 40;
	case 40:	//ななめスクロール（右下→左上：スピードダウン）
		*(vu16 *)REG_BG2VOFS = TaskTable[id].work[1];
		*(vu16 *)REG_BG2HOFS = TaskTable[id].work[2];
		TaskTable[id].work[1] -= TaskTable[id].work[3];
		TaskTable[id].work[2] += TaskTable[id].work[3];

		if((!(TaskTable[id].work[15]&0x0007))&&(TaskTable[id].work[3])){
			TaskTable[id].work[3]--;
		}
		break;
	}
}


/********************************************************************/
/*                                                                  */
/*				メイン処理（サブ）									*/
/*                                                                  */
/********************************************************************/
static	void	RegInit(void)
{
	*(vu16 *)REG_DISPCNT	= 0;
	*(vu16 *)REG_BG3HOFS	= 0;
	*(vu16 *)REG_BG3VOFS	= 0;
	*(vu16 *)REG_BG2HOFS	= 0;
	*(vu16 *)REG_BG2VOFS	= 0;
	*(vu16 *)REG_BG1HOFS	= 0;
	*(vu16 *)REG_BG1VOFS	= 0;
	*(vu16 *)REG_BG0HOFS	= 0;
	*(vu16 *)REG_BG0VOFS	= 0;
	*(vu16 *)REG_BLDCNT		= 0;
	*(vu16 *)REG_BLDALPHA	= 0;
	*(vu16 *)REG_BLDY		= 0;
}


extern	const u16 TitleColEffTbl[0x20];

static	void	OPdemoOBJfadeInOutTask(u8 id)
{
	u8	offs;

	switch(TaskTable[id].work[0]){

	default:
	case 0:
		*(vu16 *)REG_BLDCNT		= 0x3f50;	//半透明設定開始
		*(vu16 *)REG_BLDALPHA	= 0x1000;
		*(vu16 *)REG_BLDY		= 0;

		TaskTable[id].work[1] = 0x40;
		TaskTable[id].work[0] = 1;
		break;
	case 1:
		if(TaskTable[id].work[1]){
			TaskTable[id].work[1]--;
			offs = (TaskTable[id].work[1])/2;
			*(vu16 *)REG_BLDALPHA = TitleColEffTbl[offs];
		}else{
			*(vu16 *)REG_BLDALPHA = TitleColEffTbl[0];
			TaskTable[id].work[1] = 0x80;
			TaskTable[id].work[0]++;
		}
		break;
	case 2:
		if(TaskTable[id].work[1]){
			TaskTable[id].work[1]--;
		}else{
			TaskTable[id].work[1] = 0;
			TaskTable[id].work[0]++;
		}
		break;
	case 3:
		if(TaskTable[id].work[1] < (0x20-1)*2){
			TaskTable[id].work[1]++;
			offs = (TaskTable[id].work[1])/2;
			*(vu16 *)REG_BLDALPHA = TitleColEffTbl[offs];
		}else{
			*(vu16 *)REG_BLDALPHA = TitleColEffTbl[0x20-1];
			TaskTable[id].work[1] = 0x10;	//EASYWAIT
			TaskTable[id].work[0]++;
		}
		break;
	case 4:
		if(TaskTable[id].work[1]){
			TaskTable[id].work[1]--;
		}else{
			*(vu16 *)REG_BLDCNT		= 0;	//半透明設定初期化
			*(vu16 *)REG_BLDALPHA	= 0;
			*(vu16 *)REG_BLDY		= 0;
			DelTask(id);
		}
		break;
	}
}

void	BGAffineCalcSet(u16 x,u16 y,u16 ratio,u16 theta)
{
	BgAffineSrcData		src;
	BgAffineDestData	dest;

	src.SrcCenterX	= (128<<8);
	src.SrcCenterY	= (128<<8);
	src.DispCenterX	= x;
	src.DispCenterY	= y;
	src.RatioX		= ratio;
	src.RatioY		= ratio;
	src.Theta		= theta;

	BgAffineSet(&src, &dest, 1);

	*(u16*)REG_BG2PA	= dest.H_DiffX;
	*(u16*)REG_BG2PB	= dest.V_DiffX;
	*(u16*)REG_BG2PC	= dest.H_DiffY;
	*(u16*)REG_BG2PD	= dest.V_DiffY;
	*(s32*)REG_BG2X_L	= dest.StartX;
	*(s32*)REG_BG2Y_L	= dest.StartY;
}

/*==================================================================*/
/*				ポケモン＆トレーナー設定							*/
extern	const u32	DendouDecordAdrs[];
extern	void		DendouPokeActHeaderMake(u16 palID,u8 setnum);
extern	void		DendouTrainerActHeaderMake(u16 palID,u8 setnum);
static	const actAnm *const OpMineAnmTbl[];
/*==================================================================*/
static	u16		OPdemoPokeActorSet(u16 pnum,s16 x,s16 y,u16 decord_p,u8 side)
{
	u8	actnum;

	switch(side){
	default:
	case POKE_FRONT:
		DecordPokeCellMakeRndFB( &PM2FObjDataCell[pnum],pm2fpara[pnum].size,pm2fpara[pnum].patcnt,
								(void *)0x2000000,(void *)DendouDecordAdrs[decord_p],
								pnum,0,POKE_FRONT);
		break;
	case POKE_BACK:
		DecordPokeCellMakeRndFB( &PM2BObjDataCell[pnum],pm2bpara[pnum].size,pm2bpara[pnum].patcnt,
								(void *)0x2000000,(void *)DendouDecordAdrs[decord_p],
								pnum,0,POKE_BACK);
		break;
	}
	DecordPaletteWork( (void*)PokePalGetPara(pnum,0,0x0000ffff),PA_OBJ0+(decord_p*16),0x20 );

	DendouPokeActHeaderMake( decord_p,decord_p );
	actnum = AddActor( &PokeActHeader, x, y, (decord_p+1)*4 );
	ActWork[actnum].oamData.Pltt = decord_p;
	ActWork[actnum].oamData.Priority = 1;

	return actnum;
}

static	u16		OPdemoTrainerActorSet(u16 tnum,s16 x,s16 y,u16 decord_p)
{
	u8	actnum;

	DecordPokeCellMake( &TRBObjDataCell[tnum],trbpara[tnum].size,trbpara[tnum].patcnt,
						(void *)0x2000000,(void *)DendouDecordAdrs[decord_p],tnum);
	DecordPaletteWork( (void*)(TRBObjDataPal[tnum].pal_data),PA_OBJ0+(decord_p*16),0x20 );

	DendouTrainerActHeaderMake(decord_p,decord_p);
	PokeActHeader.anmData_p = OpMineAnmTbl;

	actnum = AddActor( &PokeActHeader, x, y, 1 );
	ActWork[actnum].oamData.Pltt = decord_p;
	ActWork[actnum].oamData.Priority = 1;

	return actnum;
}

/*==================================================================*/
/*				バトルシーン背景設定								*/
/*==================================================================*/
static	void	OPdemoBattleBackColorSet(u8 mode)
{
	u16	col;

	switch(mode){
	default:
	case 0:
		col = 0x3FF6;	//緑
		break;
	case 1:
		col = 0x31DF;	//朱色
		break;
	case 2:
		col = 0x518C;	//青
		break;
	}
	PaletteWork[PA_BG15 + PA_COL1] = col;
	PaletteWorkTrans[PA_BG15 + PA_COL1] = col;
}












/********************************************************************/
/*                                                                  */
/*				ＯＢＪアクター										*/
/*                                                                  */
/********************************************************************/
/********************************************************************/
/*                                                                  */
/*				世界観デモＯＢＪ									*/
/*                                                                  */
/********************************************************************/
#define	CELLID_OPDEMO_S1_SIZUKU	(2000)
#define	PALID_OPDEMO_S1_SIZUKU	(2000)
/*------------------------------------------------------------------*/
/*				雫													*/
/*------------------------------------------------------------------*/
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static const ActOamData		SizukuOam = {160,0,0,0,0,0,0,0,2,0,0,0,0};
static const actAnm			SizukuAnm1[] = {{0x10,8,0,0},{ACT_ANMEND,0,0,0}};	//上半分
static const actAnm			SizukuAnm2[] = {{0x18,8,0,0},{ACT_ANMEND,0,0,0}};	//下半分
static const actAnm			SizukuAnm3[] = {{0x00,8,0,0},{ACT_ANMEND,0,0,0}};	//光
static const actAnm			SizukuAnm4[] = {{0x30,8,0,0},{ACT_ANMEND,0,0,0}};	//波紋
static const actAnm* const	SizukuAnmTbl[]={SizukuAnm1,SizukuAnm2,SizukuAnm3,SizukuAnm4};

static void		HamonActMove(actWork* aw);
static void		SizukuActMoveTrace(actWork* aw);
static	void	SizukuActWait(actWork* aw);
static	void	SizukuActMove(actWork* aw);
static	void	SizukuActStop(actWork* aw);
static	void	SizukuActFallWait(actWork* aw);
static	void	SizukuActFall(actWork* aw);
static	void	SizukuActSimpleFall(actWork* aw);

#define	PAL_ANM_OFFS (0x080)
static void		HamonActMove(actWork* aw)
{
	u8	pal;

	if(aw->work[2] >= 0x00c0){
		if(aw->work[3]){
			aw->work[3]--;
			return;
		}
		aw->banish	= 0;
		affineWorkSet(aw->work[1],aw->work[2],0,0,aw->work[2]);
		aw->work[2] = aw->work[2]*95/100;
		pal = 9 + ((aw->work[2]-0x0c0)/PAL_ANM_OFFS);
		if(pal > 15)	pal = 15;
		aw->oamData.Pltt = pal;
	}else{
		DelActor(aw);
	}
}

static void		SizukuActMoveTrace(actWork* aw)
{
	if(ActWork[aw->work[7]].work[7]){
		aw->banish	= 1;
		aw->x	= aw->x + aw->dx;
		aw->y	= aw->y + aw->dy;
		ActAnmChg(aw,3);
		aw->work[2]	= 0x400;
		aw->work[3]	= (aw->work[1]&3)*8;
		aw->move = HamonActMove;
		aw->oamData.Shape = 1;
		aw->oamData.Size = 3;
		actCenterCalc(aw,1,3,2);
		return;
	}
	aw->dx	= ActWork[aw->work[7]].dx;
	aw->dy	= ActWork[aw->work[7]].dy;
	aw->x	= ActWork[aw->work[7]].x;
	aw->y	= ActWork[aw->work[7]].y;
}

static	void	SizukuActWait(actWork* aw)
{
	if(aw->work[0]){
		aw->move = SizukuActMove;
	}
}

static	void	SizukuActMove(actWork* aw)
{
	u16	atheta,mtheta,affinex,affiney;
	s16	asin,acos,msin,mcos;
	s16	adx,ady,admx,admy;

	if(aw->x <= 120-4){
		aw->y += aw->dy;
		aw->dy = 0;
		aw->x += 4;
		aw->dx = -4;
		aw->work[4] = 0x80;//雫work
		aw->move = SizukuActStop;
		return;
	}
	mtheta	= aw->work[4];	//雫work
	msin = sin_cos_table[(u8)mtheta];
	mcos = sin_cos_table[(u8)(mtheta+0x40)];
	aw->work[4]+= 2;	//雫work

	aw->dy = 0x08*msin/0x100;	//雫DY

	aw->x--;
	if(aw->x & 0x01) aw->y++;

	atheta	= 0x10*(-mcos)/0x100;
	
	affinex	= aw->work[2];
	affiney	= aw->work[3];

	asin = sin_cos_table[(u8)(atheta-0x10)];
	acos = sin_cos_table[(u8)(atheta+0x40-0x10)];

	adx		=  acos * affinex/0x100;
	ady		= -asin * affiney/0x100;
	admx	=  asin * affinex/0x100;
	admy	=  acos * affiney/0x100;

	affineWorkSet(aw->work[1]+0,affinex,0,0,affiney);
	affineWorkSet(aw->work[1]+1,adx,admx,ady,admy);
	affineWorkSet(aw->work[1]+2,adx,admx,ady*2,admy*2);
}

static	void	SizukuActStop(actWork* aw)
{
	u16	theta;

	affineWorkSet(aw->work[1]+0,aw->work[6]+0x40,0,0,aw->work[6]+0x40);
	affineWorkSet(aw->work[1]+1,aw->work[6]+0x40,0,0,aw->work[6]+0x40);
	affineWorkSet(aw->work[1]+2,aw->work[6]+0x40,0,0,aw->work[6]+0x40);
	if(aw->work[4] != 0x40){
		aw->work[4] -= 8;
		theta	= aw->work[4];	//雫work
		
		aw->dx = 0x04*sin_cos_table[(u8)(theta+0x40)]/0x100;
		aw->dy = 0x04*sin_cos_table[(u8)theta]/0x100;
	}else{
		aw->work[4]	= 0;
		aw->move = SizukuActFallWait;
	}
}

static	void	SizukuActFallWait(actWork* aw)
{
	u16	theta;

	if(aw->work[0] != 2){
		aw->work[4]+=8;
		theta = (0x10*sin_cos_table[(u8)(aw->work[4])]/0x100)+0x40;
		
		aw->dx = 0x04*sin_cos_table[(u8)(theta+0x40)]/0x100;
		aw->dy = 0x04*sin_cos_table[(u8)theta]/0x100;
	}else{
		aw->move = SizukuActFall;
	}
}

static	void	SizukuActFall(actWork* aw)
{
	if(aw->y < aw->work[5]){
		aw->y += 4;
	}else{
		aw->work[7]	= 1;
		aw->banish	= 1;
		aw->x	= aw->x + aw->dx;
		aw->y	= aw->y + aw->dy;
		ActAnmChg(aw,3);
		aw->work[2]	= 0x400;
		aw->work[3]	= (aw->work[1]&3)*8;
		aw->move = HamonActMove;
		aw->oamData.Shape = 1;
		aw->oamData.Size = 3;
		actCenterCalc(aw,1,3,2);
	}
}

static	void	SizukuActSimpleFall(actWork* aw)
{
	if(aw->y < aw->work[5]){
		aw->y += 4;
	}else{
		aw->work[7]	= 1;
		aw->banish	= 1;
		aw->x	= aw->x + aw->dx;
		aw->y	= aw->y + aw->dy;
		ActAnmChg(aw,3);
		aw->work[2]	= 0x400;
		aw->work[3]	= (aw->work[1]&3)*8;
		aw->move = HamonActMove;
		aw->oamData.Shape = 1;
		aw->oamData.Size = 3;
		actCenterCalc(aw,1,3,2);
	}
}

static const actHeader		SizukuActHeader ={
CELLID_OPDEMO_S1_SIZUKU,PALID_OPDEMO_S1_SIZUKU,&SizukuOam,
SizukuAnmTbl,ACT_NTRANS,DummyActAffTbl,SizukuActWait,
};

static	u8	SizukuActSet(s16 x,s16 y,u16 aff,u16 affnum,u16 end_y,u8 type)
{
	u8	actnum,actnum2;

	// 「雫」設定
	actnum = AddActor(&SizukuActHeader,x,y,0);	//光
	ActWork[actnum].work[0] = 0;
	ActWork[actnum].work[7] = 0;
	ActWork[actnum].work[1] = affnum;
	ActWork[actnum].work[2] = aff;
	ActWork[actnum].work[3] = aff;
	ActWork[actnum].work[5] = end_y;
	ActWork[actnum].work[6] = aff;
	ActWork[actnum].oamData.AffineMode = 3;	//アフィンマネージャーを起動させない
	ActWork[actnum].oamData.AffineParamNo = affnum;
	actCenterCalc(&ActWork[actnum],0,2,2);
	ActAnmChg(&ActWork[actnum],2);
	if(!type)	ActWork[actnum].move = SizukuActWait;
	else		ActWork[actnum].move = SizukuActSimpleFall;
	actnum2 = actnum;

	actnum = AddActor(&SizukuActHeader,x,y,0);	//上半分
	ActWork[actnum].work[7] = actnum2;
	ActWork[actnum].work[1] = affnum+1;
	ActWork[actnum].oamData.AffineMode = 3;	//アフィンマネージャーを起動させない
	ActWork[actnum].oamData.AffineParamNo = affnum+1;
	actCenterCalc(&ActWork[actnum],0,2,2);
	ActWork[actnum].move = SizukuActMoveTrace;

	actnum = AddActor(&SizukuActHeader,x,y,0);	//下半分
	ActWork[actnum].work[7] = actnum2;
	ActWork[actnum].work[1] = affnum+2;
	ActAnmChg(&ActWork[actnum],1);
	ActWork[actnum].oamData.AffineMode = 3;	//アフィンマネージャーを起動させない
	ActWork[actnum].oamData.AffineParamNo = affnum+2;
	actCenterCalc(&ActWork[actnum],0,2,2);
	ActWork[actnum].move = SizukuActMoveTrace;

	affineWorkSet(affnum+0,aff+0x20,0,0,aff+0x20);
	affineWorkSet(affnum+1,aff+0x20,0,0,aff+0x20);
	affineWorkSet(affnum+2,aff+0x20,0,0,(aff+0x20)*2);

	return	actnum2;
}

/*------------------------------------------------------------------*/
/*				自機												*/
/*------------------------------------------------------------------*/
static const actAnm			OpdemoJikiAnm0[] = {
{0x00,4,0,0},{0x40,4,0,0},{0x80,4,0,0},{0xc0,4,0,0},{ACT_ANMLOOP,0,0,0}
};
static const actAnm			OpdemoJikiAnm1[] = {
{0x00,8,0,0},{0x40,8,0,0},{0x80,8,0,0},{0xc0,8,0,0},{ACT_ANMLOOP,0,0,0}
};
static const actAnm			OpdemoJikiAnm2[] = {
{0x100,4,0,0},{0x140,4,0,0},{0x180,4,0,0},{ACT_ANMEND,0,0,0}
};
static const actAnm			OpdemoJikiAnm3[] = {
{0x180,16,0,0},{0x140,16,0,0},{0x100,16,0,0},{ACT_ANMEND,0,0,0}
};
static const actAnm* const	OpdemoJikiAnmTbl[]={
OpdemoJikiAnm0,OpdemoJikiAnm1,OpdemoJikiAnm2,OpdemoJikiAnm3,
};

static void			OpdemoJikiActMove(actWork* aw)
{
	switch(aw->work[0]){
	case 0:
		ActAnmChkChg(aw,0);
		aw->x-=1;
		break;
	case 1:
		ActAnmChkChg(aw,0);
		if(!(WaitWork&0x0007)) aw->x++;
		break;
	case 2:
		ActAnmChkChg(aw,2);
		if((aw->x > 120)&&(!(WaitWork&0x0007)))		break;
		aw->x+=1;
		break;
	case 3:
		ActAnmChkChg(aw,3);
		break;
	case 4:
		ActAnmChkChg(aw,0);
		if(aw->x >-32){
			aw->x-=2;
		}
		break;
	}
	//上下揺れ
	if(!(WaitWork&0x0007)){	//タイマー判定使用
		if(aw->dy){
			aw->dy = 0;
		}else{
			switch(pp_rand()&0x03){
			case 0:
				aw->dy = -1;
				break;
			case 1:
				aw->dy = 1;
				break;
			case 2:
			case 3:
				aw->dy = 0;
				break;
			}
		}
	}
}

/*------------------------------------------------------------------*/
/*				ポケモン											*/
/*------------------------------------------------------------------*/
static void			OpdemoPokeActMove(actWork* aw)
{
	switch(aw->work[0]){
	case 0:
		break;
	case 1:
		if((aw->dx + aw->x) < 240+64)	aw->dx+=8;
		else	aw->work[0] = 2;
		break;
	case 2:
		if((aw->dx + aw->x) > 120) aw->dx--;
		else	aw->work[0] = 3;
		break;
	case 3:
		if(aw->dx > 0) aw->dx-=2;
		break;
	}
	aw->dy = SinMove((u8)aw->work[1],0x08) - cyc_demo_dy;
	aw->work[1] += 4;
}

/*------------------------------------------------------------------*/
/*				ＧＡＭＥＦＲＥＡＫpresents							*/
/*------------------------------------------------------------------*/
#define	CELLID_OPDEMO_S1_GFPRE	(2001)
#define	PALID_OPDEMO_S1_GFPRE	(2001)
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static const ActOamData		GFpreOam1 = {160,0,0,0,0,0,0,0,1,0,0,0,0};
static const ActOamData		GFpreOam2 = {160,0,0,0,0,0,0,0,0,0,0,0,0};
static const ActOamData		GFpreOam3 = {160,0,0,0,0,2,0,0,3,0,0,0,0};
static const actAnm			GFpreAnm0[] = {{0x50,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm1[] = {{0x54,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm2[] = {{0x58,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm3[] = {{0x5c,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm4[] = {{0x60,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm5[] = {{0x64,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm6[] = {{0x68,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm10[] = {{0x70,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm11[] = {{0x71,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm12[] = {{0x72,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm13[] = {{0x73,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm14[] = {{0x74,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm15[] = {{0x75,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm			GFpreAnm16[] = {{0x80,8,0,0},{ACT_ANMEND,0,0,0}};

static const actAnm* const	GFpreAnmTbl1[]={
GFpreAnm0,GFpreAnm1,GFpreAnm2,GFpreAnm3,GFpreAnm4,GFpreAnm5,GFpreAnm6,
};
static const actAnm* const	GFpreAnmTbl2[]={
GFpreAnm10,GFpreAnm11,GFpreAnm12,GFpreAnm13,GFpreAnm14,GFpreAnm15,
};
static const actAnm* const	GFpreAnmTbl3[]={GFpreAnm16};

static const s16	GFprePosTbl1[][2]={
{0,-72,},	//G
{1,-56,},	//A
{2,-40,},	//M
{3,-24,},	//E
{4,  8,},	//F
{5, 24,},	//R
{3, 40,},	//E
{1, 56,},	//A
{6, 72,},	//K
};
static const s16	GFprePosTbl2[][2]={
{0,-28,},	//p
{1,-20,},	//r
{2,-12,},	//e
{3,- 4,},	//s
{2,  4,},	//e
{4, 12,},	//n
{5, 20,},	//t
{3, 28,},	//s
};

static void		GFpreActMove(actWork* aw)
{
	switch(TaskTable[aw->work[0]].work[0]){
	case 0:
		aw->banish = 1;
		break;
	default:
		aw->banish = 0;
		break;
	case 4:
		DelActor(aw);
		break;
	}
}

static const actHeader		GFpreActHeader1 ={
CELLID_OPDEMO_S1_SIZUKU,PALID_OPDEMO_S1_GFPRE,&GFpreOam1,
GFpreAnmTbl1,ACT_NTRANS,DummyActAffTbl,GFpreActMove,
};
static const actHeader		GFpreActHeader2 ={
CELLID_OPDEMO_S1_SIZUKU,PALID_OPDEMO_S1_GFPRE,&GFpreOam2,
GFpreAnmTbl2,ACT_NTRANS,DummyActAffTbl,GFpreActMove,
};
static const actHeader		GFpreActHeader3 ={
CELLID_OPDEMO_S1_SIZUKU,PALID_OPDEMO_S1_GFPRE,&GFpreOam3,
GFpreAnmTbl3,ACT_NTRANS,DummyActAffTbl,GFpreActMove,
};


static	u8	GFpreActSet(s16 x,s16 y,u8 taskID)
{
	u16	i;
	u8	actnum;

	for(i=0;i<9;i++){
		actnum = AddActor(&GFpreActHeader1,x+GFprePosTbl1[i][1],y-4,0);
		ActWork[actnum].work[0] = taskID;
		ActAnmChg(&ActWork[actnum],GFprePosTbl1[i][0]);
	}
	for(i=0;i<8;i++){
		actnum = AddActor(&GFpreActHeader2,x+GFprePosTbl2[i][1],y+12,0);
		ActWork[actnum].work[0] = taskID;
		ActAnmChg(&ActWork[actnum],GFprePosTbl2[i][0]);
	}
	actnum = AddActor(&GFpreActHeader3,120,y-4,0);
	ActWork[actnum].work[0] = taskID;

	return	actnum;
}

/*------------------------------------------------------------------*/
/*				ポケモンシルエット（最初のみ）						*/
/*------------------------------------------------------------------*/
#define	CELLID_OPDEMO_S1_POKESIL	(2002)
#define	PALID_OPDEMO_S1_POKESIL		(2002)
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static const ActOamData		OpdemoPokeSilOam1 = {160,0,0,0,0,1,0,0,3,0,0,0,0};
static const actAnm			OpdemoPokeSilAnm0[] = {{0x00,10,0,0},{ACT_ANMLOOP,0,0,0}};
static const actAnm* const	OpdemoPokeSilAnmTbl[]={OpdemoPokeSilAnm0};

static void			OpdemoPokeSilActMove(actWork* aw)
{
	s16	asin,acos;
	s16	adx,ady,admx,admy;

	aw->work[7]++;	//タイマー

	switch(aw->work[0]){
	default:
	case 0:
		aw->oamData.AffineMode = 3;	//アフィンマネージャーを起動させない
		aw->oamData.AffineParamNo = 1;
		actCenterCalc(aw,1,3,3);
		aw->banish	= 0;
		aw->work[0]	= 1;
		aw->work[1] = 0x80;
		aw->work[2] = -0x18;
		aw->work[3] = 0;
		break;
	case 1:
		if(aw->work[3] < 0x50){
			aw->dy = -SinMove((u8)(aw->work[3]),120);
			aw->dx = -(SinMove((u8)(aw->work[3]),140));
			if(aw->work[3] > 0x40)	aw->oamData.Priority = 3;
		}
		asin = sin_cos_table[(u8)(aw->work[2])];
		acos = sin_cos_table[(u8)(aw->work[2]+0x40)];

		adx		=  acos * aw->work[1]/0x100;
		ady		= -asin * aw->work[1]/0x100;
		admx	=  asin * aw->work[1]/0x100;
		admy	=  acos * aw->work[1]/0x100;
		affineWorkSet(1,adx,admx,ady,admy);

		if(aw->work[1] < 0x100){
			aw->work[1] += 0x08;
		}else{
			aw->work[1] += 0x20;
		}
		if(aw->work[2] < 0x18)	aw->work[2] += 1;
		if(aw->work[3] < 0x40){
			aw->work[3] += 2;
		}else{
			if(!(aw->work[7] & 0x0003)) aw->work[3] += 1;	//超ゆっくり
		}
		break;
	}
}

static const actHeader		PokeSilActHeader ={
CELLID_OPDEMO_S1_POKESIL,PALID_OPDEMO_S1_POKESIL,&OpdemoPokeSilOam1,
OpdemoPokeSilAnmTbl,ACT_NTRANS,DummyActAffTbl,OpdemoPokeSilActMove,
};

/*------------------------------------------------------------------*/
/*				セル＆パレット設定データ							*/
/*------------------------------------------------------------------*/
static	const	CellData	OpDemoS1Cell[] = {
	{ opdemo1_LZ,	0x1400	,CELLID_OPDEMO_S1_SIZUKU },
	{ CELL_END, 0, 0 }
};
static	const	CellData	OpDemoS1_2Cell[] = {
	{ rat_s_ch_LZ,	0x400	,CELLID_OPDEMO_S1_POKESIL },
	{ CELL_END, 0, 0 }
};
static	const	PalData		OpDemoS1Pal[] = {
	{ opdemo1_Palette	,PALID_OPDEMO_S1_SIZUKU },
	{ opdemo2_Palette	,PALID_OPDEMO_S1_GFPRE },
	{ rat_s_cl_Palette	,PALID_OPDEMO_S1_POKESIL },
	{ OBJPAL_END, 0 },
};

/********************************************************************/
/*                                                                  */
/*				バトルデモＯＢＪ									*/
/*                                                                  */
/********************************************************************/
/*------------------------------------------------------------------*/
/*				ポケモン敵１										*/
/*------------------------------------------------------------------*/
static void			OpdemoBattlePokeE1ActMove(actWork* aw)
{
	u16	aff;

	switch(aw->work[0]){
	default:
	case 0:
		if(aw->work[2]){
			aw->Hflip = 1;
		}else{
			aw->Hflip = 0;
		}
		aw->work[0] = 1;
	case 1:
		if(aw->y > 96){
			aw->y -= 4;
			if(aw->work[2])	aw->x += 2;
			else			aw->x -= 2;
		}else{
			aw->work[0]++;
			aw->work[3] = 0x8;
		}
		break;
	case 2:
		if(aw->work[3]){
			aw->work[3]--;
		}else{
			aw->work[0]++;
			aw->work[3] = 0;
		}
		break;
	case 3:
		aw->oamData.AffineMode = 3;
		aw->oamData.AffineParamNo = aw->work[1];
		actCenterCalc(aw,0,3,3);
		if(aw->work[2])	affineWorkSet(aw->work[1],-0x100,0,0,0x100);
		else			affineWorkSet(aw->work[1],0x100,0,0,0x100);
		aw->work[0]++;
		aw->work[4] = 0;
		break;
	case 4:
		aw->work[4] += 1;

		if(((aw->y + aw->dy) > -32)&&((aw->x + aw->dx) > -64)){
			aw->dy = -(aw->work[4]*aw->work[4])/8;
			if(aw->work[2])	aw->dx += aw->work[4];
			else			aw->dx -= aw->work[4];
			if(aw->work[3] < 0x80)	aw->work[3]+=8;
			aff = 0x100 - aw->work[3];
			if(aw->work[2])	affineWorkSet(aw->work[1],-aff,0,0,aff);
			else			affineWorkSet(aw->work[1],aff,0,0,aff);
		}else{
			DelActor(aw);
		}
		break;
	}
}

/*------------------------------------------------------------------*/
/*				ポケモン味方１										*/
/*------------------------------------------------------------------*/
static void			OpdemoBattlePokeM1ActMove(actWork* aw)
{
	switch(aw->work[0]){
	default:
	case 0:
		aw->banish = 0;
		aw->oamData.AffineMode = 1;
		aw->oamData.AffineParamNo = aw->work[1];
		aw->work[3] = 0x800;
		aw->work[0] = 1;
	case 1:
		if(aw->work[3] > 0x100){
			aw->work[3] -= 0x080;
			if(aw->work[2]){
				affineWorkSet(aw->work[1],-(aw->work[3]),0,0,aw->work[3]);
			}else{
				affineWorkSet(aw->work[1],aw->work[3],0,0,aw->work[3]);
			}
		}else{
			if(aw->work[2]){
				affineWorkSet(aw->work[1],-0x100,0,0,0x100);
			}else{
				affineWorkSet(aw->work[1],0x100,0,0,0x100);
			}
			aw->work[0]++;
		}
	case 2:
		break;
	case 3:
		aw->work[4]++;
		aw->dy = aw->work[4]*aw->work[4]/32;
		if(aw->work[2]){
			aw->dx = (aw->work[4]/4);
		}else{
			aw->dx = -(aw->work[4]/4);
		}
		break;
	}
}

/*------------------------------------------------------------------*/
/*				自機												*/
/*------------------------------------------------------------------*/
static	const actAnm OpMineAnm1[]={{3,0,0,0},{ACT_ANMEND,0,0,0}};
static	const actAnm OpMineAnm2[]={{0,8,0,0},{ACT_ANMEND,0,0,0}};
static	const actAnm OpMineAnm3[]={{1,8,0,0},{2,8,0,0},{ACT_ANMEND,0,0,0}};
static	const actAnm *const OpMineAnmTbl[]={OpMineAnm1,OpMineAnm2,OpMineAnm3};
static void			StarEffectActSet(u16 x,u16 y);

static void			OpdemoBattleMineActMove(actWork* aw)
{
	s16	x,y;

	switch(aw->work[0]){
	default:
	case 0:
		if(aw->x > 40){
			aw->x -= 4;
		}else{
			ActAnmChg(aw,1);
			aw->work[6] = AddActor(&MballActHeader,16,104,100);	//ボール１
			aw->work[7] = AddActor(&MballActHeader,12,106,101);	//ボール２
			aw->work[0] = 1;
		}
	case 1:
		break;
	case 2:
		ActAnmChg(aw,2);
		ActWork[aw->work[6]].work[0] = 1;	//ボール１投げる（軌道１）
		ActWork[aw->work[7]].work[0] = 2;	//ボール２投げる（軌道２）
		aw->work[0]++;
		break;
	case 3:
		if(aw->y > 160){
			aw->banish = 1;
			aw->work[0] = 1;
		}else{
			aw->y +=2;
			aw->x -=1;
		}
		break;
	case 4:
		//ポケモン１出現
		x = ActWork[aw->work[6]].x + ActWork[aw->work[6]].dx;
		y = ActWork[aw->work[6]].y + ActWork[aw->work[6]].dy;
		DelActor(&ActWork[aw->work[6]]);	//ボール１消去

		aw->work[6] = OPdemoPokeActorSet(MONSNO_ATYAMO,x,y,2,POKE_FRONT);
		ActWork[aw->work[6]].move = OpdemoBattlePokeM1ActMove;
		ActWork[aw->work[6]].banish	= 1;
		ActWork[aw->work[6]].work[1]= 1;	//AffineWork位置
		ActWork[aw->work[6]].work[2]= 1;	//向き
		StarEffectActSet(x,y);

		//ポケモン２出現
		x = ActWork[aw->work[7]].x + ActWork[aw->work[7]].dx;
		y = ActWork[aw->work[7]].y + ActWork[aw->work[7]].dy;
		DelActor(&ActWork[aw->work[7]]);	//ボール２消去

		aw->work[7] = OPdemoPokeActorSet(MONSNO_MIZUGOROU,x,y,3,POKE_FRONT);
		ActWork[aw->work[7]].move = OpdemoBattlePokeM1ActMove;
		ActWork[aw->work[7]].banish	= 1;
		ActWork[aw->work[7]].work[1]= 2;	//AffineWork位置
		ActWork[aw->work[7]].work[2]= 0;	//向き
		StarEffectActSet(x,y);

		PaletteFadeReq(0x00ff0000,0,16,16,0x7eff);
		aw->work[0] = 1;
		break;
	case 5:
		ActWork[aw->work[6]].work[0] = 3;	//ポケモン１落下
		ActWork[aw->work[7]].work[0] = 3;	//ポケモン２落下
		break;
	case 6:
		DelActor(&ActWork[aw->work[6]]);	//ポケモン１消去
		DelActor(&ActWork[aw->work[7]]);	//ポケモン２消去
		DelActor(aw);
		break;
	}
}

/*------------------------------------------------------------------*/
/*				ポケモン敵２										*/
/*------------------------------------------------------------------*/
static void			OpdemoBattlePokeE2ActMove(actWork* aw)
{
	switch(aw->work[0]){
	default:
	case 0:
		if(aw->dx > -56){
			aw->dx -= 8;
			aw->dy += 6;
		}else{
			aw->work[6] = aw->x;	//Ｘ座標バックアップ
			aw->work[7] = aw->y;	//Ｙ座標バックアップ
			aw->x += aw->dx;
			aw->y += aw->dy;
			aw->dx = 0;
			aw->dy = 0;
			aw->work[0] = 1;
			aw->work[1] = 0;
		}
		break;
	case 1:
		if(!(aw->work[1] & 0x0001)){
			if(aw->work[1] & 0x0002){
				aw->dx = -1;
				aw->dy =  1;
			}else{
				aw->dx = 0;
				aw->dy = 0;
			}
		}
		aw->work[1]++;
		break;
	case 2:
		aw->banish = 1;
		aw->x = aw->work[6];	//Ｘ座標復帰
		aw->y = aw->work[7];	//Ｙ座標復帰
		aw->dx = 0;
		aw->dy = 0;
		break;
	case 3:
		aw->banish = 0;
		aw->work[1]++;
	case 4:
		if(aw->dx > -56){
			aw->dx -= 4;
			aw->dy += 3;
		}else{
			aw->x += aw->dx;
			aw->y += aw->dy;
			aw->dx = 0;
			aw->dy = 0;
			aw->work[0] = 1;
		}
		break;
	}
}

/*------------------------------------------------------------------*/
/*				ポケモン味方２										*/
/*------------------------------------------------------------------*/
static void			OpdemoBattlePokeM2ActMove(actWork* aw)
{
	switch(aw->work[0]){
	default:
	case 0:
		if(aw->dx < 56){
			aw->dx += 8;
			aw->dy -= 6;
		}else{
			aw->work[6] = aw->x;	//Ｘ座標バックアップ
			aw->work[7] = aw->y;	//Ｙ座標バックアップ
			aw->x += aw->dx;
			aw->y += aw->dy;
			aw->dx = 0;
			aw->dy = 0;
			aw->work[0] = 1;
			aw->work[1] = 0;
		}
		break;
	case 1:
		if(!(aw->work[1] & 0x0001)){
			if(aw->work[1] & 0x0002){
				aw->dx =  1;
				aw->dy = -1;
			}else{
				aw->dx = 0;
				aw->dy = 0;
			}
		}
		aw->work[1]++;
		break;
	case 2:
		aw->banish = 1;
		aw->x = aw->work[6];	//Ｘ座標復帰
		aw->y = aw->work[7];	//Ｙ座標復帰
		aw->dx = 0;
		aw->dy = 0;
		break;
	case 3:
		aw->banish = 0;
		aw->work[1]++;
	case 4:
		if(aw->dx < 56){
			aw->dx += 4;
			aw->dy -= 3;
		}else{
			aw->x += aw->dx;
			aw->y += aw->dy;
			aw->dx = 0;
			aw->dy = 0;
			aw->work[0] = 1;
		}
		break;
	}
}

/*------------------------------------------------------------------*/
/*				モンスターボール									*/
/*------------------------------------------------------------------*/
#define	CELLID_OPDEMO_S4_BALL	(2002)
#define	PALID_OPDEMO_S4_BALL	(2002)
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static const ActOamData		MballOam = {160,0,0,0,0,0,0,0,1,0,1,0,0};
static const actAnm			MballAnm1[] = {{0x00,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm* const	MballAnmTbl[]={MballAnm1};

static void			MballActMove(actWork* aw)
{
	u16	asin,acos;

	aw->work[7]++;		//タイマー

	switch(aw->work[0]){
	default:
	case 0:
		break;
	case 1:
		aw->oamData.AffineMode = 1;
		aw->oamData.AffineParamNo = 1;
		aw->work[0] = 10;
		aw->work[4] = 0x24;	//回転速度
	case 10:
		if(aw->x > 120+24){
		}else{
			aw->x +=4;
			aw->y --;
			aw->dy = -SinMove((u8)aw->work[2],24);
			aw->work[2] += 4;
		}
		aw->work[3] -= aw->work[4];	//回転角度
		if(aw->work[7]&0x0001){
			if(aw->work[4])	aw->work[4]--;	//回転速度下げる
		}
		asin = sin_cos_table[(u8)(aw->work[3])];
		acos = sin_cos_table[(u8)(aw->work[3]+0x40)];
		affineWorkSet(1,acos,asin,-asin,acos);
		break;
	case 2:
		aw->oamData.AffineMode = 1;
		aw->oamData.AffineParamNo = 2;
		aw->work[0] = 20;
		aw->work[4] = 0x24;	//回転速度
	case 20:
		if(aw->x > 120-24){
		}else{
			aw->x +=3;
			aw->y --;
			aw->dy = -SinMove((u8)aw->work[2],24);
			aw->work[2] += 4;
		}
		aw->work[3] -= aw->work[4];	//回転角度
		if(aw->work[7]&0x0001){
			if(aw->work[4])	aw->work[4]--;	//回転速度下げる
		}
		asin = sin_cos_table[(u8)(aw->work[3])];
		acos = sin_cos_table[(u8)(aw->work[3]+0x40)];
		affineWorkSet(2,acos,asin,-asin,acos);
		break;
	}
}

static const actHeader		MballActHeader ={
CELLID_OPDEMO_S4_BALL,PALID_OPDEMO_S4_BALL,&MballOam,
MballAnmTbl,ACT_NTRANS,DummyActAffTbl,MballActMove,
};

/*------------------------------------------------------------------*/
/*				モンスターボール出現エフェクト						*/
/*------------------------------------------------------------------*/
#define	CELLID_OPDEMO_S5_STAR	(2003)
#define	PALID_OPDEMO_S5_STAR	(2003)
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static const ActOamData		StarOam = {160,0,0,0,0,0,0,0,0,0,1,0,0};
static const actAnm			StarAnm1[] = {{0x01,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm* const	StarAnmTbl[]={StarAnm1};

static void			StarActMove(actWork* aw)
{
	u16	asin,acos,r;

	aw->work[7]++;		//タイマー
	
	if(aw->work[7]&0x0001){
		aw->banish = 0;
	}else{
		aw->banish = 1;
	}

	if(aw->work[2] >= 0x40){
		DelActor(aw);
	}else{
		aw->work[2] += 2;
		r = SinMove((u8)(aw->work[2]),40);
		aw->dx = CosMove((u8)(aw->work[0]*0x20),r);
		aw->dy = SinMove((u8)(aw->work[0]*0x20),r);

		if(!aw->work[0]){	//回転計算はひとつだけ
			aw->work[3] -= aw->work[1];	//回転角度
			if(aw->work[7]&0x0001){
				if(aw->work[1])	aw->work[1]--;	//回転速度下げる
			}
			asin = sin_cos_table[(u8)(aw->work[3])];
			acos = sin_cos_table[(u8)(aw->work[3]+0x40)];
			affineWorkSet(16,acos,asin,-asin,acos);
		}
	}
}

static const actHeader		StarActHeader ={
CELLID_OPDEMO_S5_STAR,PALID_OPDEMO_S5_STAR,&StarOam,
StarAnmTbl,ACT_NTRANS,DummyActAffTbl,StarActMove,
};

static void			StarEffectActSet(u16 x,u16 y)
{
	u8	i,actnum;

	for(i=0;i<8;i++){
		actnum = AddActor(&StarActHeader,x,y,0);
		ActWork[actnum].oamData.AffineMode = 1;
		ActWork[actnum].oamData.AffineParamNo = 16;
		ActWork[actnum].work[0] = i;
		ActWork[actnum].work[1] = 0x20;	//回転速度
	}
}

/*------------------------------------------------------------------*/
/*				技エフェクト										*/
/*------------------------------------------------------------------*/
#define	CELLID_OPDEMO_S5_EFF	(2004)
#define	PALID_OPDEMO_S5_EFF		(2004)
/*------------------------------------------------------------------*/
//「はかいこうせん」
#define	HAKAI_THETA		(0x68)
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static const ActOamData		Ef_HakaiOam = {160,0,0,0,0,0,0,0,0,0,1,0,0};
static const actAnm			Ef_HakaiAnm1[] = {{0x0e,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm* const	Ef_HakaiAnmTbl[]={Ef_HakaiAnm1};

static void			Ef_HakaiSubActMove(actWork* aw)
{
	if(OPdemoFlag){
		DelActor(aw);
		return;
	}
	//エフェクト表示は対象ポケモン（actnum = aw->work[0]）に依存
	aw->banish = ActWork[aw->work[0]].banish;
	if(aw->work[7] < 12)	aw->work[7]++;		//拡散タイマー
	
	aw->work[6] += 4;	//距離増加
	aw->x = (sin_cos_table[(u8)(aw->work[3]+0x40)]*aw->work[6]/0x100) + aw->work[4];
	aw->y = (sin_cos_table[(u8)(aw->work[3]+0x00)]*aw->work[6]/0x100) + aw->work[5];
	aw->dy = (sin_cos_table[(u8)(aw->work[1]+0x00)]*aw->work[7]/0x100);
	aw->work[1] += 0x10;	//回転角増加
	if(aw->y > aw->work[2]) DelActor(aw);
}

static const actHeader		Ef_HakaiSubActHeader ={
CELLID_OPDEMO_S5_STAR,PALID_OPDEMO_S5_EFF,&Ef_HakaiOam,
Ef_HakaiAnmTbl,ACT_NTRANS,DummyActAffTbl,Ef_HakaiSubActMove,
};

static void			Ef_HakaiActMove(actWork* aw)
{
	u8	i,actnum;
	u16	x,y;

	if(OPdemoFlag){
		DelActor(aw);
		return;
	}
	aw->work[7]++;		//タイマー
	
	aw->banish = 1;		//本体は常に表示ＯＦＦ

	//エフェクト発生は対象ポケモン（actnum = aw->work[0]Seq）に依存
	if(ActWork[aw->work[0]].work[0]==1){
		if(!(aw->work[7]&0x0003)){		//タイマー
			//Ｘ座標指定（依存ポケモン＋OFFSET）
			x = aw->work[1] + ActWork[aw->work[0]].x;
			//Ｙ座標指定（依存ポケモン＋OFFSET）
			y = aw->work[2] + ActWork[aw->work[0]].y;

			for(i=0;i<3;i++){
				actnum = AddActor(&Ef_HakaiSubActHeader,x,y,ActWork[aw->work[0]].pri-1);
				if(actnum != ACT_MAX){
					ActWork[actnum].work[0] = aw->work[0];	//依存対象ポケモンactnum
					ActWork[actnum].work[1] = ((aw->work[7]>>2)&0x0007)*0x20 + i*85;//スタート角
					ActWork[actnum].work[2] = aw->work[3];	//消去指定
					ActWork[actnum].work[3] = HAKAI_THETA;
					ActWork[actnum].work[4] = x;
					ActWork[actnum].work[5] = y;
					ActWork[actnum].work[6] = 0;		//距離
				}
			}
		}
	}
}

static const actHeader		Ef_HakaiActHeader ={
CELLID_OPDEMO_S5_STAR,PALID_OPDEMO_S5_EFF,&Ef_HakaiOam,
Ef_HakaiAnmTbl,ACT_NTRANS,DummyActAffTbl,Ef_HakaiActMove,
};

static void			Ef_HakaiActSet(u8 pokeact)
{
	u8	actnum;

	actnum = AddActor(&Ef_HakaiActHeader,0,0,0);	//「はかいこうせん」エフェクト
	if(actnum != ACT_MAX){
		ActWork[actnum].work[0] = pokeact;	//依存ポケモン(actnum)設定
		ActWork[actnum].work[1] = -12;	//発射位置Ｘ（ポケモンからのOFFSET）
		ActWork[actnum].work[2] =  0;	//発射位置Ｙ（ポケモンからのOFFSET）
		ActWork[actnum].work[3] = 136;	//エフェクト消去位置Ｙ
	}
}

/*------------------------------------------------------------------*/
//「おにび」
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static const ActOamData		Ef_OnibiOam = {160,0,0,0,0,0,0,0,1,0,1,0,0};
static const actAnm			Ef_OnibiAnm1[] = {{0x06,8,0,0},{0x06,8,1,0},{ACT_ANMLOOP,0,0,0}};
static const actAnm* const	Ef_OnibiAnmTbl[]={Ef_OnibiAnm1};

static void			Ef_OnibiActMove(actWork* aw)
{
	if(OPdemoFlag){
		DelActor(aw);
		return;
	}
	//エフェクト表示は対象ポケモン（actnum = aw->work[0]）に依存
	aw->banish = ActWork[aw->work[0]].banish;
	aw->work[7]++;		//タイマー
	if(aw->work[3]<40)	aw->work[3]+=2;	//徐々に広げる
	
	//Ｘ座標指定（依存ポケモン＋回転）
	aw->x = ActWork[aw->work[0]].x + ActWork[aw->work[0]].dx
			+(sin_cos_table[(u8)(aw->work[1]+0x40)]*aw->work[3]/0x100);
	//Ｙ座標指定（依存ポケモン＋回転）
	aw->y = ActWork[aw->work[0]].y + ActWork[aw->work[0]].dy
			+(sin_cos_table[(u8)(aw->work[1]+0x00)]*aw->work[3]/0x200);
	aw->work[1] += 0x02;	//回転角増加

	aw->dy = (sin_cos_table[(u8)(aw->work[2]+0x00)]*8/0x100);
	aw->work[2] += 0x08;	//上下運動角増加

	if((aw->work[1]&0x00ff)<0x80)	aw->pri = ActWork[aw->work[0]].pri-1;
	else					aw->pri = ActWork[aw->work[0]].pri+1;
}

static const actHeader		Ef_OnibiActHeader ={
CELLID_OPDEMO_S5_STAR,PALID_OPDEMO_S5_EFF,&Ef_OnibiOam,
Ef_OnibiAnmTbl,ACT_NTRANS,DummyActAffTbl,Ef_OnibiActMove,
};

static void			Ef_OnibiActSet(u8 pokeact)
{
	u8	i,actnum;

	for(i=0;i<8;i++){
		actnum = AddActor(&Ef_OnibiActHeader,ActWork[pokeact].x,ActWork[pokeact].y,0);
		if(actnum != ACT_MAX){
			ActWork[actnum].work[0] = pokeact;
			ActWork[actnum].work[1] = i*0x20;//スタート角
		}
	}
}

/*------------------------------------------------------------------*/
//「かえんほうしゃ」
#define	KAEN_THETA		(0xe8)
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static const ActOamData		Ef_KaenOam = {160,0,0,0,0,0,0,0,1,0,1,0,0};
static const actAnm			Ef_KaenAnm1[] = {{0x0a,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm* const	Ef_KaenAnmTbl[]={Ef_KaenAnm1};

static void			Ef_KaenSubActMove(actWork* aw)
{
	u8	aff_offs;

	if(OPdemoFlag){
		DelActor(aw);
		return;
	}
	//エフェクト表示は対象ポケモン（actnum = aw->work[0]）に依存
	aw->banish = ActWork[aw->work[0]].banish;
	aw->work[7]++;		//タイマー
	
	aw->work[6] += 8;	//距離増加
	aw->x = (sin_cos_table[(u8)(aw->work[3]+0x40)]*aw->work[6]/0x100) + aw->work[4];
	aw->y = (sin_cos_table[(u8)(aw->work[3]+0x00)]*aw->work[6]/0x100) + aw->work[5];
	aff_offs = aw->work[6]/16;	//拡縮パラメータオフセット
	if(aff_offs > 9)	aff_offs = 9;
	aw->oamData.AffineParamNo = 18 + aff_offs;

	if(aw->work[6] > 160){
		DelActor(aw);
	}
}

static const actHeader		Ef_KaenSubActHeader ={
CELLID_OPDEMO_S5_STAR,PALID_OPDEMO_S5_EFF,&Ef_KaenOam,
Ef_KaenAnmTbl,ACT_NTRANS,DummyActAffTbl,Ef_KaenSubActMove,
};

static	const u8	KaenThetaTbl[] = {0xe6,0xeb,0xe4,0xea,0xe5,0xe9,0xe7,0xe8};

static void			Ef_KaenActMove(actWork* aw)
{
	u8	actnum;
	u16	x,y;

	if(OPdemoFlag){
		DelActor(aw);
		return;
	}
	aw->work[7]++;		//タイマー
	
	aw->banish = 1;		//本体は常に表示ＯＦＦ

	//エフェクト発生は対象ポケモン（actnum = aw->work[0]Seq）に依存
	if(ActWork[aw->work[0]].work[0]==1){
		if(!(aw->work[7]&0x0001)){		//タイマー
			//Ｘ座標指定（依存ポケモン＋OFFSET）
			x = aw->work[1] + ActWork[aw->work[0]].x;
			//Ｙ座標指定（依存ポケモン＋OFFSET）
			y = aw->work[2] + ActWork[aw->work[0]].y;

			actnum = AddActor(&Ef_KaenSubActHeader,x,y,ActWork[aw->work[0]].pri+1);
			if(actnum != ACT_MAX){
				ActWork[actnum].oamData.AffineMode = 3;
				ActWork[actnum].oamData.AffineParamNo = 18;
				actCenterCalc(&ActWork[actnum],0,1,3);
				ActWork[actnum].work[0] = aw->work[0];	//依存対象ポケモンactnum
				ActWork[actnum].work[3] = KaenThetaTbl[(aw->work[7]>>1)&0x0007];
				ActWork[actnum].work[4] = x;
				ActWork[actnum].work[5] = y;
				ActWork[actnum].work[6] = 0;		//距離
			}
		}
	}
}

static const actHeader		Ef_KaenActHeader ={
CELLID_OPDEMO_S5_STAR,PALID_OPDEMO_S5_EFF,&Ef_KaenOam,
Ef_KaenAnmTbl,ACT_NTRANS,DummyActAffTbl,Ef_KaenActMove,
};

static	const u16	KaenAffineTable[] = {
0x200,0x1c0,0x180,0x140,0x100,0x0e0,0x0c0,0x0a0,0x080,0x080,
};

static void			Ef_KaenActSet(u8 pokeact)
{
	u8	i,actnum;

	actnum = AddActor(&Ef_KaenActHeader,0,0,0);	//「かえんほうしゃ」エフェクト
	if(actnum != ACT_MAX){
		ActWork[actnum].work[0] = pokeact;	//依存ポケモン(actnum)設定
		ActWork[actnum].work[1] =  0;	//発射位置Ｘ（ポケモンからのOFFSET）
		ActWork[actnum].work[2] =  8;	//発射位置Ｙ（ポケモンからのOFFSET）
		ActWork[actnum].work[3] = 24;	//エフェクト消去位置Ｙ
	}
	for(i=0;i<10;i++){
		affineWorkSet(18+i,KaenAffineTable[i],0,0,KaenAffineTable[i]);
	}
}

/*------------------------------------------------------------------*/
//「ハイドロポンプ」
#define	PONPU_THETA		(0xe8)
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static const ActOamData		Ef_PonpuOam = {160,0,0,0,0,0,0,0,1,0,1,0,0};
static const actAnm			Ef_PonpuAnm1[] = {{0x02,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm* const	Ef_PonpuAnmTbl[]={Ef_PonpuAnm1};

static void			Ef_PonpuSubActMove(actWork* aw)
{
	if(OPdemoFlag){
		DelActor(aw);
		return;
	}
	//エフェクト表示は対象ポケモン（actnum = aw->work[0]）に依存
	aw->banish = ActWork[aw->work[0]].banish;
	aw->work[7]++;		//タイマー
	
	aw->work[6] += 8;	//距離増加
	aw->x = (sin_cos_table[(u8)(aw->work[3]+0x40)]*aw->work[6]/0x100) + aw->work[4];
	aw->y = (sin_cos_table[(u8)(aw->work[3]+0x00)]*aw->work[6]/0x100) + aw->work[5];
	aw->dy = (sin_cos_table[(u8)(aw->work[1]+0x00)]*4/0x100);
	aw->work[1] += 0x10;	//回転角増加
	if(aw->y < aw->work[2]){
		DelActor(aw);
	}
}

static const actHeader		Ef_PonpuSubActHeader ={
CELLID_OPDEMO_S5_STAR,PALID_OPDEMO_S5_EFF,&Ef_PonpuOam,
Ef_PonpuAnmTbl,ACT_NTRANS,DummyActAffTbl,Ef_PonpuSubActMove,
};

static void			Ef_PonpuActMove(actWork* aw)
{
	u8	actnum;
	u16	x,y,ratio;

	if(OPdemoFlag){
		DelActor(aw);
		return;
	}
	aw->work[7]++;		//タイマー
	
	aw->banish = 1;		//本体は常に表示ＯＦＦ

	//エフェクト発生は対象ポケモン（actnum = aw->work[0]Seq）に依存
	if(ActWork[aw->work[0]].work[0]==1){
		if(!(aw->work[7]&0x0001)){		//タイマー
			//Ｘ座標指定（依存ポケモン＋OFFSET）
			x = aw->work[1] + ActWork[aw->work[0]].x;
			//Ｙ座標指定（依存ポケモン＋OFFSET）
			y = aw->work[2] + ActWork[aw->work[0]].y;

			actnum = AddActor(&Ef_PonpuSubActHeader,x,y,ActWork[aw->work[0]].pri+1);
			if(actnum != ACT_MAX){
				ActWork[actnum].oamData.AffineMode = 3;
				ActWork[actnum].oamData.AffineParamNo = 17;
				actCenterCalc(&ActWork[actnum],0,1,3);
				ActWork[actnum].work[0] = aw->work[0];	//依存対象ポケモンactnum
				ActWork[actnum].work[1] = ((aw->work[7]>>2)&0x0007)*0x20;//スタート角
				ActWork[actnum].work[2] = aw->work[3];	//消去指定
				ActWork[actnum].work[3] = PONPU_THETA;
				ActWork[actnum].work[4] = x;
				ActWork[actnum].work[5] = y;
				ActWork[actnum].work[6] = 0;		//距離
			}
		}
		if(aw->work[6] < 0x70)	aw->work[6]+=4;		//Affineタイマー
	}
	ratio = 0x100 - ((sin_cos_table[(u8)(aw->work[6])]*0x80/0x100));
	affineWorkSet(17,ratio,0,0,ratio);
}

static const actHeader		Ef_PonpuActHeader ={
CELLID_OPDEMO_S5_STAR,PALID_OPDEMO_S5_EFF,&Ef_PonpuOam,
Ef_PonpuAnmTbl,ACT_NTRANS,DummyActAffTbl,Ef_PonpuActMove,
};

static void			Ef_PonpuActSet(u8 pokeact)
{
	u8	actnum;

	actnum = AddActor(&Ef_PonpuActHeader,0,0,0);	//「ハイドロポンプ」エフェクト
	if(actnum != ACT_MAX){
		ActWork[actnum].work[0] = pokeact;	//依存ポケモン(actnum)設定
		ActWork[actnum].work[1] =  0;	//発射位置Ｘ（ポケモンからのOFFSET）
		ActWork[actnum].work[2] = 12;	//発射位置Ｙ（ポケモンからのOFFSET）
		ActWork[actnum].work[3] = 24;	//エフェクト消去位置Ｙ
	}
}

/*------------------------------------------------------------------*/
/*				爆発エフェクト										*/
/*------------------------------------------------------------------*/
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static const ActOamData		Ef_BombOam = {160,0,0,0,0,0,0,0,3,0,1,0,0};
static const actAnm			Ef_BombAnm1[] = {{0x10,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm* const	Ef_BombAnmTbl[]={Ef_BombAnm1};

static void			Ef_BombActMove(actWork* aw)
{
	u16	ratio;

	switch(aw->work[0]){
	default:
	case 0:
		aw->banish = 0;
		aw->oamData.AffineMode = 3;
		aw->oamData.AffineParamNo = 18;
		actCenterCalc(aw,0,3,3);
		aw->work[1] = 0x00;		//Affineタイマー
		aw->work[0] = 1;
	case 1:
		aw->work[7]++;
		if(aw->work[7]&0x0001){
			aw->banish = 1;
		}else{
			aw->banish = 0;
			if(aw->work[1] < 0x40)	aw->work[1]++;		//Affineタイマー
		}
		ratio = 0x100 - ((sin_cos_table[(u8)(aw->work[1])]*0x80/0x100));
		affineWorkSet(18,ratio,0,0,ratio);
		break;
	}
}

static const actHeader		Ef_BombActHeader ={
CELLID_OPDEMO_S5_STAR,PALID_OPDEMO_S5_STAR,&Ef_BombOam,
Ef_BombAnmTbl,ACT_NTRANS,DummyActAffTbl,Ef_BombActMove,
};


/*------------------------------------------------------------------*/
/*				セル＆パレット設定データ							*/
/*------------------------------------------------------------------*/
static	const	CellData	OpDemoS4Cell[] = {
	{ (void*)b_ani0_pch_ADRS,	0x0100	,CELLID_OPDEMO_S4_BALL },
	{ CELL_END, 0, 0 }
};
static	const	CellData	OpDemoS5Cell[] = {
	{ (void*)opdemo5_LZ,	0x0a00	,CELLID_OPDEMO_S5_STAR },
	{ CELL_END, 0, 0 }
};
static	const	PalData		OpDemoS4Pal[] = {
	{ (void*)b_ani0_pcl_ADRS	,PALID_OPDEMO_S4_BALL },
	{ OBJPAL_END, 0 },
};
static	const	PalData		OpDemoS5Pal[] = {
	{ opdemo5_1_Palette	,PALID_OPDEMO_S5_STAR },
	{ opdemo5_2_Palette	,PALID_OPDEMO_S5_EFF },
	{ OBJPAL_END, 0 },
};





