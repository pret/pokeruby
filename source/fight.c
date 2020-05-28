
//======================================================
//    fight.c                                           
//                                                      
//    Copyright (C) 2001 GAME FREAK inc.
//======================================================

#include "common.h"
#include "intr.h"		//add
#include "madefine.h"	//add
#include "decord.h"
#include "bss.h"
#include "server.h"
#include "client.h"
#include "client_t.h"
#include "actanm.h"
#include "actanm.def"
#include "print.h"		//add
#include "palanm.h"		//add
#include "task.h"		//add
#include "laster.h"		//add

#include "objdata.h"		//add
#include "multisio.h"		//add
#include "pokesio.h"
#include "cable.h"

#include "poketool.h"
#include "calctool.h"
#include "field.h"
#include "ev_fight.h"
#include "ev_flag.h"
#include "waza_tbl.h"
#include "fld_main.h"
#include "gauge.h"
#include "b_tower.h"
#include "..\data\itemsym.h"
#include "trainer.dat"
#include "window.h"
#include "monsname.h"		//add
#include "wazaname.h"		//add
#include "pokelist.h"
#include "mus_tool.h"
#include "mapparam.h"
#include "fightmsg.h"

#define __FIGHT_H_		//add
#include "fight.h"		//add

#define H_BLANK_ENABLE	0

#define	EFFECT_WAIT	0x02

#define	RESET_KEY	(R_BUTTON|SELECT_BUTTON)
#define	ANMONOFF_KEY	(L_BUTTON|SELECT_BUTTON)

#define RECV_CHG	1

#define RETRY_TIME	50

const	u16		ServerVersion=0x100;		//version 1.00


void		InitEncount(void);
void		MainEncount(void);
void		InitFight(void);
void		InitFight2(void);
void		InitFight4Comm(void);
void		MainFightWait2Comm(void);
void		MainFightWait4Comm(void);
void		MainFight(void);
void		FightREGSet(void);
void		FightBG3Set(void);
void		FightBGSetAll(void);
u8			FightBGSet(u8);
void		FightWindowChrSet(void);
void		FightEndWindowInit(void);
void		FightEndWindowMain(void);
void		FightEndWindowSequence(void);

u8		TrainerDataSet(PokemonParam *,u16);

const	actHeader EncountEffect;

void	SeqEncountEffectInit(actWork *);
void	SeqEncountEffectMain(actWork *);

void	SeqFightAppearInit(void);
void	SeqFightAppearMain(void);
void	SeqFightMain(void);

void	fight_h_blank_intr(void);
void	fight_v_blank_intr(void);
extern	void	DebugFightInit(void);

extern	actHeader MineHeader; 
extern	actHeader PokeFTbl[];
extern	actHeader PokeBTbl[];
extern	void SeqEnemyPokeDamageInit(actWork *);

extern	u8	GetFightGroundType(void);

extern	const u8	CasetteVersion;

void	SeqVSMoveInit(actWork *);
void	SeqVSMove(actWork *);

//-----------------------------------------------------------
//test
extern  const u8 testdata[][256];
extern  u8		multisiotestdata[256];

#if TUUSHIN_DEBUG
extern	void kanshi_num_set(u32 w0, u32 w1);
#endif

//-----------------------------------------------------------
u16		ScrX0;
u16		ScrY0;
u16		ScrX1;
u16		ScrY1;
u16		ScrX2;
u16		ScrY2;
u16		ScrX3;
u16		ScrY3;

u16		Win0H;
u16		Win0V;
u16		Win1H;
u16		Win1V;

TALK_WIN	FightMsg;
TALK_WIN	TuushinWin1;
TALK_WIN	TuushinWin2;
u8	FightMsgBuf[300] ={};
//u8	FightMsgBuf[64];
u8	EvStrBuf0[16];
u8	EvStrBuf1[16];

int		FightEffectCount;

actHeader FightObjHeader[4];		//一応マックス４体なので

u16		FightType=0;

u8		GroundNo;

u32		TuushinWaitWork=0;

MultiPokeListData MPLD[3]={};

void		InitEncount(void)
{
		u8		actno;

		InitActor();
		actno = AddActor(&EncountEffect,0,0,0);
		ActWork[actno].banish=1;
		MainProcChange(MainEncount);
}

void		MainEncount(void)
{
		JumpActor();
		SetActor();
}

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
const ActOamData VObjOamData = {
	0,		//u32 VPos:8;             // Ｙ座標
	3,		//u32 AffineMode:2;       // アフィンモード
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

const ActOamData SObjOamData = {
	0,		//u32 VPos:8;             // Ｙ座標
	3,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
	3,		//u32 Size:2;             // ＯＢＪサイズ

	0x40,	//u32 CharNo:10;          // キャラクタＮｏ
	0,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};

static const actAffAnm VSAffAnm0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x80,	0x80, 0, ACT_AFSET },		// 0
	{ACT_AFEND,0,0,0},					// 終了
};

static const actAffAnm VSAffAnm1[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x80,	0x80, 0, ACT_AFSET },		// 0
	{ 0x18,	0x18,	0, 0x80	},			// 1
	{ 0x18,	0x18,	0, 0x80	},			// 1
	{ACT_AFEND,0,0,0},					// 終了
};

static const	actAffAnm * const VSAffTbl[] = {
	VSAffAnm0,
	VSAffAnm1,
};

const	actHeader VObjHeader= 
{
	10000,	//登録番号
	10000,	//登録番号
	&VObjOamData,
	DummyActAnmTbl,
	0,
	VSAffTbl,
	SeqVSMoveInit
};

const	actHeader SObjHeader= 
{
	10000,	//登録番号
	10000,	//登録番号
	&SObjOamData,
	DummyActAnmTbl,
	0,
	VSAffTbl,
	SeqVSMoveInit
};

const CellData VSObjDataCell[]={
	{(void *)win_t_o_pch_ADRS,OBJ_SIZE16_64x64*2,10000},
};

//----------------------------------------------------------
//		背景データテーブル
//----------------------------------------------------------

const	BGChrTable BGCT[]={
	{
	(void *)ground1_pch_ADRS,
	(void *)ground1_psc_ADRS,
	(void *)ec_ani1_pch_ADRS,
	(void *)ec_ani1_psc_ADRS,
	(void *)ground1_pcl_ADRS,
	},
	{
	(void *)ground2_pch_ADRS,
	(void *)ground2_psc_ADRS,
	(void *)ec_ani2_pch_ADRS,
	(void *)ec_ani2_psc_ADRS,
	(void *)ground2_pcl_ADRS,
	},
	{
	(void *)ground3_pch_ADRS,
	(void *)ground3_psc_ADRS,
	(void *)ec_ani3_pch_ADRS,
	(void *)ec_ani3_psc_ADRS,
	(void *)ground3_pcl_ADRS,
	},
	{
	(void *)ground4_pch_ADRS,
	(void *)ground4_psc_ADRS,
	(void *)ec_ani4_pch_ADRS,
	(void *)ec_ani4_psc_ADRS,
	(void *)ground4_pcl_ADRS,
	},
	{
	(void *)ground5_pch_ADRS,
	(void *)ground5_psc_ADRS,
	(void *)ec_ani5_pch_ADRS,
	(void *)ec_ani5_psc_ADRS,
	(void *)ground5_pcl_ADRS,
	},
	{
	(void *)ground6_pch_ADRS,
	(void *)ground6_psc_ADRS,
	(void *)ec_ani6_pch_ADRS,
	(void *)ec_ani6_psc_ADRS,
	(void *)ground6_pcl_ADRS,
	},
	{
	(void *)ground7_pch_ADRS,
	(void *)ground7_psc_ADRS,
	(void *)ec_ani7_pch_ADRS,
	(void *)ec_ani7_psc_ADRS,
	(void *)ground7_pcl_ADRS,
	},
	{
	(void *)ground8_pch_ADRS,
	(void *)ground8_psc_ADRS,
	(void *)ec_ani8_pch_ADRS,
	(void *)ec_ani8_psc_ADRS,
	(void *)ground8_pcl_ADRS,
	},
	{
	(void *)ground0_pch_ADRS,
	(void *)ground0_psc_ADRS,
	(void *)ec_ani0_pch_ADRS,
	(void *)ec_ani0_psc_ADRS,
	(void *)ground10_pcl_ADRS,
	},
	{
	(void *)ground0_pch_ADRS,
	(void *)ground0_psc_ADRS,
	(void *)ec_ani0_pch_ADRS,
	(void *)ec_ani0_psc_ADRS,
	(void *)ground9_pcl_ADRS,
	},
};

//----------------------------------------------------------
//		背景ラスターテーブル
//----------------------------------------------------------

const	LasterData	FightHLaster={
	(void *)REG_BG3HOFS,	//ﾃﾞｰﾀ転送先ｱﾄﾞﾚｽ(REG_BG0VOFS等)
	H_DMA_ENABLE16,			//16ビット転送
	LASTER_NORMAL,			//転送タイプ（0:リクエストなし1:ノーマル2:ループ型）
	0						//転送タイプがループの時のカウント
};


void	FightREGSet(void)
{

#if H_BLANK_ENABLE
//	*(vu16 *)REG_IE |= V_BLANK_INTR_FLAG | H_BLANK_INTR_FLAG;
	REG_IE_SET( V_BLANK_INTR_FLAG | H_BLANK_INTR_FLAG );
	*(vu16 *)REG_STAT = STAT_V_BLANK_IF_ENABLE | STAT_H_BLANK_IF_ENABLE;
#else
//	*(vu16 *)REG_IE |= V_BLANK_INTR_FLAG ;
	REG_IE_SET( V_BLANK_INTR_FLAG );
	*(vu16 *)REG_STAT = STAT_V_BLANK_IF_ENABLE ;
#endif

	*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_0
	| 24 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF;

	*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_0
	| 28 << BG_SCREEN_BASE_SHIFT | 1 << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF;

	*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_1 | BG_PRIORITY_1
	| 30 << BG_SCREEN_BASE_SHIFT | 1 << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF;

	*(vu16 *)REG_BG3CNT = BG_SCREEN_SIZE_1 | BG_PRIORITY_3
	| 26 << BG_SCREEN_BASE_SHIFT | 2 << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF;

   	*(vu16 *)REG_BLDCNT   = 0;	//半透明設定
   	*(vu16 *)REG_BLDALPHA = 0;
   	*(vu16 *)REG_BLDY	  = 0;

#if TUUSHIN_DEBUG
	if(FightType&FIGHT_TYPE_TUUSHIN)
		*(vu16 *)REG_DISPCNT=DISP_MODE_0|
							 DISP_BG0_ON|DISP_BG1_ON|DISP_BG2_ON|DISP_BG3_ON|DISP_OBJ_ON|
							 DISP_OBJ_CHAR_1D_MAP;
	else
		*(vu16 *)REG_DISPCNT=DISP_MODE_0|
							 DISP_BG0_ON|DISP_BG1_ON|DISP_BG2_ON|DISP_BG3_ON|DISP_OBJ_ON|
							 DISP_OBJ_CHAR_1D_MAP|DISP_WIN0_ON|DISP_OBJWIN_ON;
#else
		*(vu16 *)REG_DISPCNT=DISP_MODE_0|
							 DISP_BG0_ON|DISP_BG1_ON|DISP_BG2_ON|DISP_BG3_ON|DISP_OBJ_ON|
							 DISP_OBJ_CHAR_1D_MAP|DISP_WIN0_ON|DISP_OBJWIN_ON;
#endif

}

#if 0
static const u16 PM_Print_Palette[16] = {
0x0000,		//透明色
0x2529,		//黒
0x001F,		//赤
0x03E0,		//緑
0x7C00,		//青
0x03FF,		//黄色
0x7FE0,		//水色
0x7C1F,		//紫
0x675a,0x0000,0x0000,0x779c,0x7fff,0x7f33,0x72ef,0x7fff,
};
#endif

void		FightWindowChrSet(void)
{
	NWinFrameInit(0x12);
	NWinFrameDataSetFight(&FightMsg,1);
	NWinFrameInit(0x22);
	NWinFrameDataSetFight(&FightMsg,1);
	PaletteWork[PA_BG5+PA_COL13]=0x2529;
	PaletteWork[PA_BG5+PA_COL14]=0x7fff;
	PaletteWork[PA_BG5+PA_COL15]=0x675a;
	CpuCopy(&PaletteWork[PA_BG5+PA_COL13], &PaletteWorkTrans[PA_BG5+PA_COL13], 6, 16);
	BattleWinPaint();
}

void	FightBG3Set(void)
{
	if((FightType&FIGHT_TYPE_TUUSHIN)||
	   (FightType&FIGHT_TYPE_BATTLE_TOWER)||
	   (FightType&FIGHT_TYPE_CARD_E)){
		DecordVram((void *)ground0_pch_ADRS,(void *)BG_VRAM+0x8000);
		DecordVram((void *)ground0_psc_ADRS,(void *)BG_VRAM+26*0x0800);
		DecordPaletteWork((void *)ground0_pcl_ADRS,PA_BG2,0x60);
	}
	else if(FightType&FIGHT_TYPE_HAIKEI_SET){
		if(CasetteVersion==VERSION_RUBY){
			DecordVram((void *)ground8_pch_ADRS,(void *)BG_VRAM+0x8000);
			DecordVram((void *)ground8_psc_ADRS,(void *)BG_VRAM+26*0x0800);
			DecordPaletteWork((void *)ground12_pcl_ADRS,PA_BG2,0x60);
		}
		else{
			DecordVram((void *)ground5_pch_ADRS,(void *)BG_VRAM+0x8000);
			DecordVram((void *)ground5_psc_ADRS,(void *)BG_VRAM+26*0x0800);
			DecordPaletteWork((void *)ground11_pcl_ADRS,PA_BG2,0x60);
		}
	}
	else if((FightType&FIGHT_TYPE_TRAINER)&&(TD[FieldTrainerID].type==TRTYPE_ZIMURIIDAA)){
		DecordVram((void *)ground0_pch_ADRS,(void *)BG_VRAM+0x8000);
		DecordVram((void *)ground0_psc_ADRS,(void *)BG_VRAM+26*0x0800);
		DecordPaletteWork((void *)ground14_pcl_ADRS,PA_BG2,0x60);
	}
	else if((FightType&FIGHT_TYPE_TRAINER)&&(TD[FieldTrainerID].type==TRTYPE_TYANPION)){
		DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
		DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
		DecordPaletteWork((void *)ground21_pcl_ADRS,PA_BG2,0x60);
	}
	else{
		switch(GetBattleBGType()){		//現在のマップの戦闘背景指定を返す
			case BATTLEBGTYPE_NONE:
				DecordVram(BGCT[GroundNo].ch_data1,(void *)BG_VRAM+0x8000);
				DecordVram(BGCT[GroundNo].sc_data1,(void *)BG_VRAM+26*0x0800);
				DecordPaletteWork(BGCT[GroundNo].cl_data,PA_BG2,0x60);
				break;
			case BATTLEBGTYPE_GYM:
				DecordVram((void *)ground0_pch_ADRS,(void *)BG_VRAM+0x8000);
				DecordVram((void *)ground0_psc_ADRS,(void *)BG_VRAM+26*0x0800);
				DecordPaletteWork((void *)ground13_pcl_ADRS,PA_BG2,0x60);
				break;
			case BATTLEBGTYPE_RUBY_AZITO:
				DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
				DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
				DecordPaletteWork((void *)ground16_pcl_ADRS,PA_BG2,0x60);
				break;
			case BATTLEBGTYPE_SAPPHIRE_AZITO:
				DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
				DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
				DecordPaletteWork((void *)ground15_pcl_ADRS,PA_BG2,0x60);
				break;
			case BATTLEBGTYPE_BIG4_KAGETSU:
				DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
				DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
				DecordPaletteWork((void *)ground17_pcl_ADRS,PA_BG2,0x60);
				break;
			case BATTLEBGTYPE_BIG4_FUYOU:
				DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
				DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
				DecordPaletteWork((void *)ground18_pcl_ADRS,PA_BG2,0x60);
				break;
			case BATTLEBGTYPE_BIG4_PURIMU:
				DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
				DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
				DecordPaletteWork((void *)ground19_pcl_ADRS,PA_BG2,0x60);
				break;
			case BATTLEBGTYPE_BIG4_GENZI:
				DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
				DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
				DecordPaletteWork((void *)ground20_pcl_ADRS,PA_BG2,0x60);
				break;
			case BATTLEBGTYPE_WHITE_ROOM:
				DecordVram((void *)ground0_pch_ADRS,(void *)BG_VRAM+0x8000);
				DecordVram((void *)ground0_psc_ADRS,(void *)BG_VRAM+26*0x0800);
				DecordPaletteWork((void *)ground0_pcl_ADRS,PA_BG2,0x60);
				break;
		}
	}
}

void	FightBGSetAll(void)
{
	DecordVram((void *)batt_bg1_pch_ADRS,(void *)BG_VRAM);
	DecordVram((void *)batt_bg1_psc_ADRS,(void *)BG_VRAM+24*0x800);
	DecordPaletteWork((void *)batt_bg1_pcl_ADRS,PA_BG0,0x40);

	FightWindowChrSet();

	FightBG3Set();
#if TUUSHIN_DEBUG
	if(FightType&FIGHT_TYPE_TUUSHIN)
		DebugNumPrintInit(14,3,26,2);
#endif
}

enum{
	WM_SEQNO=0,
	WM_ANGLE1,
	WM_ANGLE2,
	WM_CONDMINE,
	WM_CONDENEMY,
	WM_WORK0,
	WM_WORK1,
	WM_WORK2,
};

static void BallPutAct(u8 no,u8 id,void *adrs)
{
	int	i;
	u16	cond=0;
	u16	buf[6];

	if(FightType&FIGHT_TYPE_4_2vs2){
		if(TaskTable[no].work[WM_WORK0]){
			switch(id){
				case 0:
					cond=TaskTable[no].work[WM_CONDMINE]&0x3f;
					break;
				case 1:
					cond=(TaskTable[no].work[WM_CONDENEMY]&0xfc0)>>6;
					break;
				case 2:
					cond=(TaskTable[no].work[WM_CONDMINE]&0xfc0)>>6;
					break;
				case 3:
					cond=TaskTable[no].work[WM_CONDENEMY]&0x3f;
					break;
			}
		}
		else{
			switch(id){
				case 0:
					cond=TaskTable[no].work[WM_CONDMINE]&0x3f;
					break;
				case 1:
					cond=TaskTable[no].work[WM_CONDENEMY]&0x3f;
					break;
				case 2:
					cond=(TaskTable[no].work[WM_CONDMINE]&0xfc0)>>6;
					break;
				case 3:
					cond=(TaskTable[no].work[WM_CONDENEMY]&0xfc0)>>6;
					break;
			}
		}

		for(i=0;i<3;i++)
			buf[i]=((cond&(0x03<<i*2))>>i*2)+0x6001;
	
		CpuCopy(buf,adrs,6,16);
	}
	else{
//		if(id==GetSioConnectId())
		if(id==UserWork[TUUSHIN_ID])
			cond=TaskTable[no].work[WM_CONDMINE];
		else
			cond=TaskTable[no].work[WM_CONDENEMY];

		for(i=0;i<6;i++)
			buf[i]=((cond&(0x03<<i*2))>>i*2)+0x6001;
	
		CpuCopy(buf,adrs,12,16);
	}
}

static void FightWinLoseMsgPut(void)
{
	if(WinLoseFlag==FIGHT_DRAW){
		MsgPutSet(&FightMsg,
				  FightDrawMsg,
				  0xa0,13,2);
		MsgPut(&FightMsg);
	}
	else if(FightType&FIGHT_TYPE_4_2vs2){
		if(WinLoseFlag==FIGHT_WIN){
			switch(SioTrainerInfo[UserWork[TUUSHIN_ID]].StandPos){
				case 1:
				case 3:
					MsgPutSet(&FightMsg,
							  FightWinMsg,
							  0xa0,21,2);
					MsgPut(&FightMsg);
					MsgPutSet(&FightMsg,
							  FightLoseMsg,
							  0xa8,6,2);
					MsgPut(&FightMsg);
					break;
				case 0:
				case 2:
					MsgPutSet(&FightMsg,
							  FightWinMsg,
							  0xa0,6,2);
					MsgPut(&FightMsg);
					MsgPutSet(&FightMsg,
							  FightLoseMsg,
							  0xa8,21,2);
					MsgPut(&FightMsg);
					break;
			}
		}
		else{
			switch(SioTrainerInfo[UserWork[TUUSHIN_ID]].StandPos){
				case 1:
				case 3:
					MsgPutSet(&FightMsg,
							  FightWinMsg,
							  0xa0,6,2);
					MsgPut(&FightMsg);
					MsgPutSet(&FightMsg,
							  FightLoseMsg,
							  0xa8,21,2);
					MsgPut(&FightMsg);
					break;
				case 0:
				case 2:
					MsgPutSet(&FightMsg,
							  FightWinMsg,
							  0xa0,21,2);
					MsgPut(&FightMsg);
					MsgPutSet(&FightMsg,
							  FightLoseMsg,
							  0xa8,6,2);
					MsgPut(&FightMsg);
			}
		}
	}
	else{
		if(WinLoseFlag==FIGHT_WIN){
			if(SioTrainerInfo[UserWork[TUUSHIN_ID]].StandPos){
				MsgPutSet(&FightMsg,
						  FightWinMsg,
						  0xa0,21,2);
				MsgPut(&FightMsg);
				MsgPutSet(&FightMsg,
						  FightLoseMsg,
						  0xa8,6,2);
				MsgPut(&FightMsg);
			}
			else{
				MsgPutSet(&FightMsg,
						  FightWinMsg,
						  0xa0,6,2);
				MsgPut(&FightMsg);
				MsgPutSet(&FightMsg,
						  FightLoseMsg,
						  0xa8,21,2);
				MsgPut(&FightMsg);
			}
		}
		else{
			if(SioTrainerInfo[UserWork[TUUSHIN_ID]].StandPos){
				MsgPutSet(&FightMsg,
						  FightWinMsg,
						  0xa0,6,2);
				MsgPut(&FightMsg);
				MsgPutSet(&FightMsg,
						  FightLoseMsg,
						  0xa8,21,2);
				MsgPut(&FightMsg);
			}
			else{
				MsgPutSet(&FightMsg,
						  FightWinMsg,
						  0xa0,21,2);
				MsgPut(&FightMsg);
				MsgPutSet(&FightMsg,
						  FightLoseMsg,
						  0xa8,6,2);
				MsgPut(&FightMsg);
			}
		}
	}
}

enum{
	WM_SEQ_INIT=0,
	WM_SEQ_ADD_ACTOR,
	WM_SEQ_MOVE,
};


void	WindowMove(u8 no)
{
	int	i;
	u8	id1=0;
	u8	id2=0;
	u8	pal=0;

	switch(TaskTable[no].work[WM_SEQNO]){
		case WM_SEQ_INIT:
			if(FightType&FIGHT_TYPE_4_2vs2){
				for(i=0;i<4;i++){
					switch(SioTrainerInfo[i].StandPos){
						case 0:
							MsgPutSet(&TuushinWin1,
									  SioTrainerInfo[i].name,
									  0x20,2,2);
							MsgPut(&TuushinWin1);
							BallPutAct(no,
									   SioTrainerInfo[i].StandPos,
									   (void *)BG_VRAM+28*0x800+0x40*4+0x02*2);
							break;
						case 1:
							MsgPutSet(&TuushinWin2,
									  SioTrainerInfo[i].name,
									  0x40,2,2);
							MsgPut(&TuushinWin2);
							BallPutAct(no,
									   SioTrainerInfo[i].StandPos,
									   (void *)BG_VRAM+30*0x800+0x40*4+0x02*2);
							break;
						case 2:
							MsgPutSet(&TuushinWin1,
									  SioTrainerInfo[i].name,
									  0x60,2,6);
							MsgPut(&TuushinWin1);
							BallPutAct(no,
									   SioTrainerInfo[i].StandPos,
									   (void *)BG_VRAM+28*0x800+0x40*8+0x02*2);
							break;
						case 3:
							MsgPutSet(&TuushinWin2,
									  SioTrainerInfo[i].name,
									  0x80,2,6);
							MsgPut(&TuushinWin2);
							BallPutAct(no,
									   SioTrainerInfo[i].StandPos,
									   (void *)BG_VRAM+30*0x800+0x40*8+0x02*2);
							break;
					}
				}
			}
			else{
//				id1=GetSioConnectId();
				id1=UserWork[TUUSHIN_ID];
				id2=id1^1;
				if(SioTrainerInfo[id1].StandPos){
//					id2=GetSioConnectId();
					id2=UserWork[TUUSHIN_ID];
					id1=id2^1;
				}
				MsgPutSet(&TuushinWin1,
						  SioTrainerInfo[id1].name,
						  0x20,2,3);
				MsgPut(&TuushinWin1);
				BallPutAct(no,id1,(void *)BG_VRAM+28*0x800+0x40*7+0x02*2);
				MsgPutSet(&TuushinWin2,
						  SioTrainerInfo[id2].name,
						  0x40,2,3);
				MsgPut(&TuushinWin2);
				BallPutAct(no,id2,(void *)BG_VRAM+30*0x800+0x40*7+0x02*2);
			}
			TaskTable[no].work[WM_SEQNO]++;
			break;
		case WM_SEQ_ADD_ACTOR:
			pal=ObjPalNumSet(10000);
			PaletteWork[PA_OBJ0+pal*16+PA_COL15]=
				PaletteWorkTrans[PA_OBJ0+pal*16+PA_COL15]=0x7fff;
			UserWork[VS_ACTOR_0]=AddActor(&VObjHeader,108,80,0);
			UserWork[VS_ACTOR_1]=AddActor(&SObjHeader,132,80,0);
			ActWork[UserWork[VS_ACTOR_0]].banish=1;
			ActWork[UserWork[VS_ACTOR_1]].banish=1;
			TaskTable[no].work[WM_SEQNO]++;
			break;
		case WM_SEQ_MOVE:
			if(TaskTable[no].work[WM_WORK0]){
				ScrX1=-20-((128*Sin_360_Get(TaskTable[no].work[WM_ANGLE1]))/0x1000);
				ScrX2=-140-((128*Sin_360_Get(TaskTable[no].work[WM_ANGLE2]))/0x1000);
				ScrY1=-36;
				ScrY2=-36;
			}
			else{
				ScrX1=-20-((128*Sin_360_Get(TaskTable[no].work[WM_ANGLE1]))/0x1000);
				ScrY1=(-36-128)+((128*Cos_360_Get(TaskTable[no].work[WM_ANGLE1]))/0x1000);
				ScrX2=-140-((128*Sin_360_Get(TaskTable[no].work[WM_ANGLE2]))/0x1000);
				ScrY2=(-36-128)+((128*Cos_360_Get(TaskTable[no].work[WM_ANGLE2]))/0x1000);
			}
			if(TaskTable[no].work[WM_ANGLE2]){
				TaskTable[no].work[WM_ANGLE2]-=2;
				TaskTable[no].work[WM_ANGLE1]+=2;
			}
			else{
				if(TaskTable[no].work[WM_WORK0])
					FightWinLoseMsgPut();
				SePlay(SE_W231);
				DelTask(no);
				ActWork[UserWork[VS_ACTOR_0]].banish=0;
				ActWork[UserWork[VS_ACTOR_1]].banish=0;
				ActWork[UserWork[VS_ACTOR_1]].oamData.CharNo+=0x40;
				ActWork[UserWork[VS_ACTOR_0]].work[0]=0;
				ActWork[UserWork[VS_ACTOR_1]].work[0]=1;
				ActWork[UserWork[VS_ACTOR_0]].work[1]=ActWork[UserWork[VS_ACTOR_0]].x;
				ActWork[UserWork[VS_ACTOR_1]].work[1]=ActWork[UserWork[VS_ACTOR_1]].x;
				ActWork[UserWork[VS_ACTOR_0]].work[2]=0;
				ActWork[UserWork[VS_ACTOR_1]].work[2]=0;
			}
			break;
	}
}

void	FightEffectBGSet()
{
//	if((FightType&FIGHT_TYPE_TUUSHIN)&&
//	  ((FightType&FIGHT_TYPE_4_2vs2))){
	if(FightType&FIGHT_TYPE_TUUSHIN){
		DecordVram((void *)win_t_pch_ADRS,(void *)BG_VRAM+0x4000);
		DecordVram((void *)win_t_psc_ADRS,(void *)BG_VRAM+28*0x0800);
		DecordVram((void *)win_t_psc_ADRS,(void *)BG_VRAM+30*0x0800);
		DecordVram((void *)win_t_o_pch_ADRS,(void *)OBJ_MODE0_VRAM);
		DecordPaletteWork((void *)win_t_pcl_ADRS,PA_BG6,0x20);
		*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_1 | BG_PRIORITY_0
		| 28 << BG_SCREEN_BASE_SHIFT | 1 << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 | BG_MOS_OFF;
		*(vu16*)REG_WININ = 0x0036;
		*(vu16*)REG_WINOUT = 0x0036;
		ScrY1=-164;
		ScrY2=-164;
		DecordCellSet((void *)VSObjDataCell);
	}
	else{
		if((FightType&FIGHT_TYPE_TUUSHIN)||
		   (FightType&FIGHT_TYPE_BATTLE_TOWER)||
		   (FightType&FIGHT_TYPE_CARD_E)){
			DecordVram((void *)ec_ani0_pch_ADRS,(void *)BG_VRAM+0x4000);
			DecordVram((void *)ec_ani0_psc_ADRS,(void *)BG_VRAM+28*0x0800);
		}
		else if(FightType&FIGHT_TYPE_HAIKEI_SET){
			if(CasetteVersion==VERSION_RUBY){
				DecordVram((void *)ec_ani8_pch_ADRS,(void *)BG_VRAM+0x4000);
				DecordVram((void *)ec_ani8_psc_ADRS,(void *)BG_VRAM+28*0x0800);
			}
			else{
				DecordVram((void *)ec_ani4_pch_ADRS,(void *)BG_VRAM+0x4000);
				DecordVram((void *)ec_ani4_psc_ADRS,(void *)BG_VRAM+28*0x0800);
			}
		}
		else if((FightType&FIGHT_TYPE_TRAINER)&&
				(TD[FieldTrainerID].type==TRTYPE_ZIMURIIDAA)){
			DecordVram((void *)ec_ani0_pch_ADRS,(void *)BG_VRAM+0x4000);
			DecordVram((void *)ec_ani0_psc_ADRS,(void *)BG_VRAM+28*0x0800);
		}
		else if((FightType&FIGHT_TYPE_TRAINER)&&
				(TD[FieldTrainerID].type==TRTYPE_TYANPION)){
			DecordVram((void *)ec_ani0_pch_ADRS,(void *)BG_VRAM+0x4000);
			DecordVram((void *)ec_ani0_psc_ADRS,(void *)BG_VRAM+28*0x0800);
		}
		else{
			switch(GetBattleBGType()){		//現在のマップの戦闘背景指定を返す
				case BATTLEBGTYPE_NONE:
					DecordVram(BGCT[GroundNo].ch_data2,(void *)BG_VRAM+0x4000);
					DecordVram(BGCT[GroundNo].sc_data2,(void *)BG_VRAM+28*0x0800);
					break;
				default:
					DecordVram((void *)ec_ani0_pch_ADRS,(void *)BG_VRAM+0x4000);
					DecordVram((void *)ec_ani0_psc_ADRS,(void *)BG_VRAM+28*0x0800);
					break;
			}
		}
	}
}

u8		FightBGSet(u8 no)
{
	u8	ret=0;

	switch(no){
		case 0:
			DecordVram((void *)batt_bg1_pch_ADRS,(void *)BG_VRAM);
			break;
		case 1:
			DecordVram((void *)batt_bg1_psc_ADRS,(void *)BG_VRAM+24*0x800);
			break;
		case 2:
			DecordPaletteWork((void *)batt_bg1_pcl_ADRS,PA_BG0,0x40);
			break;
		case 3:
			if((FightType&FIGHT_TYPE_TUUSHIN)||
			   (FightType&FIGHT_TYPE_BATTLE_TOWER)||
			   (FightType&FIGHT_TYPE_CARD_E))
				DecordVram((void *)ground0_pch_ADRS,(void *)BG_VRAM+0x8000);
			else if(FightType&FIGHT_TYPE_HAIKEI_SET){
				if(CasetteVersion==VERSION_RUBY)
					DecordVram((void *)ground8_pch_ADRS,(void *)BG_VRAM+0x8000);
				else
					DecordVram((void *)ground5_pch_ADRS,(void *)BG_VRAM+0x8000);
			}
			else if((FightType&FIGHT_TYPE_TRAINER)&&
					(TD[FieldTrainerID].type==TRTYPE_ZIMURIIDAA))
				DecordVram((void *)ground0_pch_ADRS,(void *)BG_VRAM+0x8000);
			else if((FightType&FIGHT_TYPE_TRAINER)&&
					(TD[FieldTrainerID].type==TRTYPE_TYANPION))
				DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
			else{
				switch(GetBattleBGType()){		//現在のマップの戦闘背景指定を返す
					case BATTLEBGTYPE_NONE:
						DecordVram(BGCT[GroundNo].ch_data1,(void *)BG_VRAM+0x8000);
						break;
					case BATTLEBGTYPE_GYM:
						DecordVram((void *)ground0_pch_ADRS,(void *)BG_VRAM+0x8000);
						break;
					case BATTLEBGTYPE_RUBY_AZITO:
						DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
						break;
					case BATTLEBGTYPE_SAPPHIRE_AZITO:
						DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
						break;
					case BATTLEBGTYPE_BIG4_KAGETSU:
						DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
						break;
					case BATTLEBGTYPE_BIG4_FUYOU:
						DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
						break;
					case BATTLEBGTYPE_BIG4_PURIMU:
						DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
						break;
					case BATTLEBGTYPE_BIG4_GENZI:
						DecordVram((void *)ground15_pch_ADRS,(void *)BG_VRAM+0x8000);
						break;
					case BATTLEBGTYPE_WHITE_ROOM:
						DecordVram((void *)ground0_pch_ADRS,(void *)BG_VRAM+0x8000);
						break;
				}
			}
			break;
		case 4:
			if((FightType&FIGHT_TYPE_TUUSHIN)||
			   (FightType&FIGHT_TYPE_BATTLE_TOWER)||
			   (FightType&FIGHT_TYPE_CARD_E))
				DecordVram((void *)ground0_psc_ADRS,(void *)BG_VRAM+26*0x0800);
			else if(FightType&FIGHT_TYPE_HAIKEI_SET){
				if(CasetteVersion==VERSION_RUBY)
					DecordVram((void *)ground8_psc_ADRS,(void *)BG_VRAM+26*0x0800);
				else
					DecordVram((void *)ground5_psc_ADRS,(void *)BG_VRAM+26*0x0800);
			}
			else if((FightType&FIGHT_TYPE_TRAINER)&&
					(TD[FieldTrainerID].type==TRTYPE_ZIMURIIDAA))
				DecordVram((void *)ground0_psc_ADRS,(void *)BG_VRAM+26*0x0800);
			else if((FightType&FIGHT_TYPE_TRAINER)&&
					(TD[FieldTrainerID].type==TRTYPE_TYANPION))
				DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
			else{
				switch(GetBattleBGType()){		//現在のマップの戦闘背景指定を返す
					case BATTLEBGTYPE_NONE:
						DecordVram(BGCT[GroundNo].sc_data1,(void *)BG_VRAM+26*0x0800);
						break;
					case BATTLEBGTYPE_GYM:
						DecordVram((void *)ground0_psc_ADRS,(void *)BG_VRAM+26*0x0800);
						break;
					case BATTLEBGTYPE_RUBY_AZITO:
						DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
						break;
					case BATTLEBGTYPE_SAPPHIRE_AZITO:
						DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
						break;
					case BATTLEBGTYPE_BIG4_KAGETSU:
						DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
						break;
					case BATTLEBGTYPE_BIG4_FUYOU:
						DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
						break;
					case BATTLEBGTYPE_BIG4_PURIMU:
						DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
						break;
					case BATTLEBGTYPE_BIG4_GENZI:
						DecordVram((void *)ground15_psc_ADRS,(void *)BG_VRAM+26*0x0800);
						break;
					case BATTLEBGTYPE_WHITE_ROOM:
						DecordVram((void *)ground0_psc_ADRS,(void *)BG_VRAM+26*0x0800);
						break;
				}
			}
			break;
		case 5:
			if((FightType&FIGHT_TYPE_TUUSHIN)||
			   (FightType&FIGHT_TYPE_BATTLE_TOWER)||
			   (FightType&FIGHT_TYPE_CARD_E))
				DecordPaletteWork((void *)ground0_pcl_ADRS,PA_BG2,0x60);
			else if(FightType&FIGHT_TYPE_HAIKEI_SET){
				if(CasetteVersion==VERSION_RUBY)
					DecordPaletteWork((void *)ground12_pcl_ADRS,PA_BG2,0x60);
				else
					DecordPaletteWork((void *)ground11_pcl_ADRS,PA_BG2,0x60);
			}
			else if((FightType&FIGHT_TYPE_TRAINER)&&
					(TD[FieldTrainerID].type==TRTYPE_ZIMURIIDAA))
				DecordPaletteWork((void *)ground14_pcl_ADRS,PA_BG2,0x60);
			else if((FightType&FIGHT_TYPE_TRAINER)&&
					(TD[FieldTrainerID].type==TRTYPE_TYANPION))
				DecordPaletteWork((void *)ground21_pcl_ADRS,PA_BG2,0x60);
			else{
				switch(GetBattleBGType()){		//現在のマップの戦闘背景指定を返す
					case BATTLEBGTYPE_NONE:
						DecordPaletteWork(BGCT[GroundNo].cl_data,PA_BG2,0x60);
						break;
					case BATTLEBGTYPE_GYM:
						DecordPaletteWork((void *)ground13_pcl_ADRS,PA_BG2,0x60);
						break;
					case BATTLEBGTYPE_RUBY_AZITO:
						DecordPaletteWork((void *)ground16_pcl_ADRS,PA_BG2,0x60);
						break;
					case BATTLEBGTYPE_SAPPHIRE_AZITO:
						DecordPaletteWork((void *)ground15_pcl_ADRS,PA_BG2,0x60);
						break;
					case BATTLEBGTYPE_BIG4_KAGETSU:
						DecordPaletteWork((void *)ground17_pcl_ADRS,PA_BG2,0x60);
						break;
					case BATTLEBGTYPE_BIG4_FUYOU:
						DecordPaletteWork((void *)ground18_pcl_ADRS,PA_BG2,0x60);
						break;
					case BATTLEBGTYPE_BIG4_PURIMU:
						DecordPaletteWork((void *)ground19_pcl_ADRS,PA_BG2,0x60);
						break;
					case BATTLEBGTYPE_BIG4_GENZI:
						DecordPaletteWork((void *)ground20_pcl_ADRS,PA_BG2,0x60);
						break;
					case BATTLEBGTYPE_WHITE_ROOM:
						DecordPaletteWork((void *)ground0_pcl_ADRS,PA_BG2,0x60);
						break;
				}
			}
			break;
		case 6:
			FightWindowChrSet();
			break;
		default:
#if TUUSHIN_DEBUG
			if(FightType&FIGHT_TYPE_TUUSHIN)
				DebugNumPrintInit(14,3,26,2);
#endif
			ret=1;
			break;
	}
	return	ret;
}

void	InitFight(void)
{
	if(FightType&FIGHT_TYPE_4_2vs2){
		BSSTuushinStart();
		MainProcChange(InitFight4Comm);
		ServerWork[0]=0;				//シーケンスナンバーワーク
	}
	else
		InitFight2();
}

void	InitFight2(void)
{
		int	i;

		SetHBlankFunc(NULL);
		SetVBlankFunc(NULL);

		CpuClear(0,VRAM,(VRAM_END-VRAM),32);
		*(vu16*)REG_MOSAIC = 0;

		*(vu16*)REG_WIN0H = 0x00f0;
		*(vu16*)REG_WIN0V = 0x5051;
		*(vu16*)REG_WININ = 0;
		*(vu16*)REG_WINOUT =0;

		Win0H = 0x00f0;
		Win0V = 0x5051;

		LasterWorkInit();
		for(i=0;i<80;i++){
			LasterBuffer[0][i]=ENCOUNT_DX;
			LasterBuffer[1][i]=ENCOUNT_DX;
		}
		for(;i<160;i++){
			LasterBuffer[0][i]=-ENCOUNT_DX;
			LasterBuffer[1][i]=-ENCOUNT_DX;
		}
		LasterDmaSet(FightHLaster);

		PrintScreenInit(FIGHT_TYPE);
		PaletteAnimeInit();

		ScrX0=0;
		ScrY0=0;
		ScrX1=0;
		ScrY1=0;
		ScrX2=0;
		ScrY2=0;
		ScrX3=0;
		ScrY3=0;

#ifdef PM_DEBUG
		if((DebugFightFlag&DEBUG_FIGHT_DEBUG)==0)
#endif
			GroundNo=GetFightGroundType();

		MsgControlInit(&FightMsg,FIGHT_TYPE);	//change 2001.07.12(木) by matsuda
		MsgControlInit(&TuushinWin1,TUUSHINWIN1_TYPE);	//change 2001.07.12(木) by matsuda
		MsgControlInit(&TuushinWin2,TUUSHINWIN2_TYPE);	//change 2001.07.12(木) by matsuda

		FightREGSet();
		FightBGSetAll();

		InitActor();
		InitTask();

		//一応草は別にしておく
		FightEffectBGSet();

		ObjPalManInit();
		ObjPalManStart=4;	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始 ここに移動 by matsuda 2001.09.26(水)

#if H_BLANK_ENABLE
		SetHBlankFunc(fight_h_blank_intr);
#endif
		SetVBlankFunc(fight_v_blank_intr);

		BSSInit();

		if(FightType&FIGHT_TYPE_4_2vs2)
			MainProcChange(MainFightWait4Comm);
		else
			MainProcChange(MainFightWait2Comm);
#ifdef PM_DEBUG
		if(((FightType&FIGHT_TYPE_TUUSHIN)==0)&&((DebugFightFlag&DEBUG_FIGHT_DEBUG)==0)){
#else
		if((FightType&FIGHT_TYPE_TUUSHIN)==0){
#endif
			TrainerDataSet(&PokeParaEnemy[0],FieldTrainerID);
			PokeItemSet();
		}

		sys.FieldBattleFlag=1;			//戦闘中Flagを立てる

		for(i=0;i<6;i++)
			FriendCalc(&PokeParaMine[i],FRIEND_BOSS_BATTLE);
		ServerWork[0]=0;				//シーケンスナンバーワーク
}

static	void	GetPokemonCondition(void)
{
	int	i;
	u16	cond=0;
	u16	monsno;
	u16	hp;
	u32	condition;

	for(i=0;i<6;i++){
		monsno=PokeParaGet(&PokeParaMine[i],ID_monsno_egg);
		hp=PokeParaGet(&PokeParaMine[i],ID_hp);
		condition=PokeParaGet(&PokeParaMine[i],ID_condition);
		if((monsno)&&(monsno!=MONSNO_TAMAGO)&&(hp)&&(condition==0))
			cond|=(1<<(i*2));
		if((monsno)&&(hp)&&((monsno==MONSNO_TAMAGO)||(condition)))
			cond|=(2<<(i*2));
		if((monsno)&&(monsno!=MONSNO_TAMAGO)&&(hp==0))
			cond|=(3<<(i*2));
	}
	UserWork[2]=cond&0xff;
	UserWork[3]=(cond&0xff00)>>8;
}

static void GetRamSeedData(void)
{
	FightRamSeed	*TFRS;
	int	i;

	TFRS=(FightRamSeed *)&UserWork[4];

	for(i=0;i<SEED_NAME_SIZE+EOM_SIZE;i++)
		TFRS->name[i]=Fld.RamSeed.param.name[i];
	for(i=0;i<18;i++)
		TFRS->item_param[i]=Fld.RamSeed.item_param[i];
	TFRS->item_equip=Fld.RamSeed.item_equip;
	TFRS->item_power=Fld.RamSeed.item_power;
}
 
static void SetRamSeedData()
{
	FightRamSeed	*TFRS=0;
	int	i,j,max;
	u8	clientno;

	if((FightType&FIGHT_TYPE_TUUSHIN)==0){
		for(i=0;i<SEED_NAME_SIZE+EOM_SIZE;i++){
			FRS[0].name[i]=Fld.RamSeed.param.name[i];
			FRS[2].name[i]=Fld.RamSeed.param.name[i];
		}
		for(i=0;i<18;i++){
			FRS[0].item_param[i]=Fld.RamSeed.item_param[i];
			FRS[2].item_param[i]=Fld.RamSeed.item_param[i];
		}
		FRS[0].item_equip=Fld.RamSeed.item_equip;
		FRS[2].item_equip=Fld.RamSeed.item_equip;
		FRS[0].item_power=Fld.RamSeed.item_power;
		FRS[2].item_power=Fld.RamSeed.item_power;
	}
	else{
		if(FightType&FIGHT_TYPE_4_2vs2)
			max=4;
		else
			max=2;
		for(i=0;i<max;i++){
			TFRS=(FightRamSeed *)&RecvPoolBuf[i][2];
			clientno=SioTrainerInfo[i].StandPos;
			for(j=0;j<SEED_NAME_SIZE+EOM_SIZE;j++)
				FRS[clientno].name[j]=TFRS->name[j];
			for(j=0;j<18;j++)
				FRS[clientno].item_param[j]=TFRS->item_param[j];
			FRS[clientno].item_equip=TFRS->item_equip;
			FRS[clientno].item_power=TFRS->item_power;
		}
	}
}

enum{
	MFW_TUUSHIN_CHECK=0,
	MFW_VER_CHECK,
	MFW_POKEDATA_SEND1,
	MFW_POKEDATA_RECV1,
	MFW_POKEDATA_SEND2,
	MFW_POKEDATA_RECV2,
	MFW_POKEDATA_SEND3,
	MFW_POKEDATA_RECV3,
	MFW_NEXT_JOB,
	MFW_CLIENT_INIT,
};

void	MainFightWait2Comm(void)
{
	int	i;
	u8	no;
	u8	id;
	u8	id2;

	MainTask();
	JumpActor();
	SetActor();

	id=GetSioConnectId();
	UserWork[TUUSHIN_ID]=id;
	id2=id^1;

	switch(ServerWork[0]){
		case MFW_TUUSHIN_CHECK:					//通信対戦かどうかチェック
			if((FightType&FIGHT_TYPE_TUUSHIN)&&(pokemon_sio_flag==0)) break;
			if(FightType&FIGHT_TYPE_TUUSHIN){
				if(SplitDataSendStatus()){
					UserWork[0]=ServerVersion&0xff;
					UserWork[1]=(ServerVersion&0xff00)>>8;
					GetPokemonCondition();
					GetRamSeedData();
#ifdef PM_DEBUG
					if(DebugFightFlag&DEBUG_FIGHT_DEBUG){
						for(i=0;i<2;i++){
							SioTrainerInfo[i].StandPos=i;
							SioTrainerInfo[i].ninshou=NINSHOU_BATTLEROOM;
						}
					}
#endif
					SplitDataSendStart(GetAnotherSendTo(),(u8 *)&UserWork[0],4+sizeof(FightRamSeed));
					ServerWork[0]=MFW_VER_CHECK;
				}
			}
			else{
				FightType|=FIGHT_TYPE_OYA;
				ServerWork[0]=MFW_NEXT_JOB;
				SetRamSeedData();
			}
			break;
		case MFW_VER_CHECK:						//
			if((SplitDataResult()&0x03)!=0x03) break;	//すべての端末からの返答を待つ
			SplitDataResultReset();
			for(i=0;i<2;i++){
				if((RecvPoolBuf[i][0]>=ServerVersion)&&
				   (i!=id)&&
				   (i<id))
					break;
			}
#if TUUSHIN_DEBUG
			if(i==2){
				FightType|=FIGHT_TYPE_OYA|FIGHT_TYPE_TRAINER;
				kanshi_num_set(1,0);
			}
			else
				FightType|=FIGHT_TYPE_TRAINER;
#else
			if(i==2)
				FightType|=FIGHT_TYPE_OYA|FIGHT_TYPE_TRAINER;
			else
				FightType|=FIGHT_TYPE_TRAINER;
#endif
			SetRamSeedData();
			no=AddTask(WindowMove,0);
			TaskTable[no].work[WM_ANGLE1]=270;
			TaskTable[no].work[WM_ANGLE2]=90;
			TaskTable[no].work[WM_WORK0]=0;
			TaskTable[no].work[WM_CONDMINE]=UserWork[2]|(UserWork[3]<<8);
			TaskTable[no].work[WM_CONDENEMY]=RecvPoolBuf[id2][1];
			ServerWork[0]++;
			break;
		case MFW_POKEDATA_SEND1:
			if(SplitDataSendStatus()){
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[0],sizeof(PokemonParam)*2);
				ServerWork[0]++;
			}
			break;
		case MFW_POKEDATA_RECV1:
			if((SplitDataResult()&0x03)!=0x03) break;	//すべての端末からの返答を待つ
			SplitDataResultReset();
			memcpy(&PokeParaEnemy[0],&RecvPoolBuf[id2][0],sizeof(PokemonParam)*2);
			ServerWork[0]++;
			break;
		case MFW_POKEDATA_SEND2:
			if(SplitDataSendStatus()){
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[2],sizeof(PokemonParam)*2);
				ServerWork[0]++;
			}
			break;
		case MFW_POKEDATA_RECV2:
			if((SplitDataResult()&0x03)!=0x03) break;	//すべての端末からの返答を待つ
			SplitDataResultReset();
			memcpy(&PokeParaEnemy[2],&RecvPoolBuf[id2][0],sizeof(PokemonParam)*2);
			ServerWork[0]++;
			break;
		case MFW_POKEDATA_SEND3:
			if(SplitDataSendStatus()){
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[4],sizeof(PokemonParam)*2);
				ServerWork[0]++;
			}
			break;
		case MFW_POKEDATA_RECV3:
			if((SplitDataResult()&0x03)!=0x03) break;	//すべての端末からの返答を待つ
			SplitDataResultReset();
			memcpy(&PokeParaEnemy[4],&RecvPoolBuf[id2][0],sizeof(PokemonParam)*2);
			ServerWork[0]++;
			break;
		case MFW_NEXT_JOB:						//
			BSSBoot();
			ServerWork[0]++;
			ServerWork[1]=0;
			ServerWork[2]=0;
			break;
		case MFW_CLIENT_INIT:
			if(ClientDivInit(&ServerWork[1],&ServerWork[2])){
				PushFirstProc=sys.pFirstProc;
				sys.pFirstProc=ServerMain;
				MainProcChange(MainFight);
				if(FightType&FIGHT_TYPE_TUUSHIN){
					FieldTrainerID=TUUSHIN_TRAINER;
					FightType|=FIGHT_TYPE_TUUSHIN_OK;
				}
			}
			break;
	}
}

#if 0
enum{
	MFW_TUUSHIN_CHECK=0,
	MFW_VER_CHECK_INIT,
	MFW_VER_CHECK,
	MFW_SEND_WAIT_INIT,
	MFW_SEND_WAIT,
	MFW_SERVER_BOOT_WAIT,
	MFW_POKEDATA_SEND_C1,
	MFW_POKEDATA_SEND_C2,
	MFW_POKEDATA_SEND_C3,
	MFW_POKEDATA_RECV_C,
	MFW_POKEDATA_RECV_P1,
	MFW_POKEDATA_RECV_P2,
	MFW_POKEDATA_RECV_P3,
	MFW_NEXT_JOB_WAIT,
	MFW_NEXT_JOB,
	MFW_CLIENT_INIT,
};

void	MainFightWait2Comm(void)
{
#ifdef PM_DEBUG
	int	i;
#endif
	u8	no;
	u8	id;
	u8	id2;

	MainTask();
	JumpActor();
	SetActor();

//	id=GetSioConnectId();
	id=UserWork[TUUSHIN_ID];
	id2=id^1;

	switch(ServerWork[0]){
		case MFW_TUUSHIN_CHECK:					//通信対戦かどうかチェック
			if((FightType&FIGHT_TYPE_TUUSHIN)&&(pokemon_sio_flag==0)) break;
			if(FightType&FIGHT_TYPE_TUUSHIN){
				ServerWork[0]=MFW_VER_CHECK_INIT;
				ServerWork[1]=10;
				UserWork[0]=ServerVersion&0xff;
				UserWork[1]=(ServerVersion&0xff00)>>8;
				GetPokemonCondition();
				GetRamSeedData();
#ifdef PM_DEBUG
				if(DebugFightFlag&DEBUG_FIGHT_DEBUG){
					for(i=0;i<2;i++)
						SioTrainerInfo[i].StandPos=i;
				}
#endif
			}
			else{
				FightType|=FIGHT_TYPE_OYA;
				ServerWork[0]=MFW_NEXT_JOB;
				SetRamSeedData();
			}
			break;
		case MFW_VER_CHECK_INIT:
			if(--ServerWork[1]==0)
				ServerWork[0]++;
		case MFW_VER_CHECK:						//
			if(id==0)
				ServerWork[0]=MFW_SEND_WAIT_INIT;
			else{
				if(SplitDataSendStatus()){
//					SplitDataSendStart(GetAnotherSendTo(),(u8 *)&ServerVersion,4);
					SplitDataSendStart(GetAnotherSendTo(),(u8 *)&UserWork[0],4+sizeof(FightRamSeed));
					ServerWork[0]=MFW_SERVER_BOOT_WAIT;
				}
			}
			break;
		case MFW_SEND_WAIT_INIT:
			if((SplitDataResult()&no2bittbl[id2])==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
#if RECV_CHG
				if(RecvPoolBuf[id2][0]<=ServerVersion){
#else
				if(RecvPoolBuf[id][0]<=ServerVersion){
#endif
					UserWork[0]=0;
					UserWork[1]=0;
					FightType|=FIGHT_TYPE_OYA|FIGHT_TYPE_TRAINER;
				}
				else{
					UserWork[0]=1;
					UserWork[1]=0;
				}
				no=AddTask(WindowMove,0);
				TaskTable[no].work[WM_ANGLE1]=270;
				TaskTable[no].work[WM_ANGLE2]=90;
				TaskTable[no].work[WM_WORK0]=0;
				TaskTable[no].work[WM_CONDMINE]=UserWork[2]|(UserWork[3]<<8);
				TaskTable[no].work[WM_CONDENEMY]=RecvPoolBuf[id2][1];
				ServerWork[0]++;
			}
			break;
		case MFW_SEND_WAIT:
			if(SplitDataSendStatus()){
				GetRamSeedData();
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&UserWork[0],4+sizeof(FightRamSeed));
				ServerWork[0]=MFW_POKEDATA_RECV_P1;
			}
			break;
		case MFW_SERVER_BOOT_WAIT:
			if((SplitDataResult()&no2bittbl[id2])==0) break;
			SplitDataResultReset();
#if RECV_CHG
			if(RecvPoolBuf[id2][0]==1)
#else
			if(RecvPoolBuf[id][0]==1)
#endif
				FightType|=FIGHT_TYPE_OYA|FIGHT_TYPE_TRAINER;
			no=AddTask(WindowMove,0);
			TaskTable[no].work[WM_ANGLE1]=270;
			TaskTable[no].work[WM_ANGLE2]=90;
			TaskTable[no].work[WM_WORK0]=0;
			TaskTable[no].work[WM_CONDMINE]=UserWork[2]|(UserWork[3]<<8);
			TaskTable[no].work[WM_CONDENEMY]=RecvPoolBuf[id2][1];
			ServerWork[0]=MFW_POKEDATA_SEND_C1;
			break;
		case MFW_POKEDATA_SEND_C1:
			if(SplitDataSendStatus()){
				SetRamSeedData();
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[0],sizeof(PokemonParam)*2);
				ServerWork[0]++;
			}
			break;
		case MFW_POKEDATA_SEND_C2:
			if((SplitDataResult()&no2bittbl[id2])==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
#if RECV_CHG
				memcpy(&PokeParaEnemy[0],&RecvPoolBuf[id2][0],sizeof(PokemonParam)*2);
#else
				memcpy(&PokeParaEnemy[0],&RecvPoolBuf[id][0],sizeof(PokemonParam)*2);
#endif
				ServerWork[0]++;
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[2],sizeof(PokemonParam)*2);
			}
			break;
		case MFW_POKEDATA_SEND_C3:
			if((SplitDataResult()&no2bittbl[id2])==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
#if RECV_CHG
				memcpy(&PokeParaEnemy[2],&RecvPoolBuf[id2][0],sizeof(PokemonParam)*2);
#else
				memcpy(&PokeParaEnemy[2],&RecvPoolBuf[id][0],sizeof(PokemonParam)*2);
#endif
				ServerWork[0]++;
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[4],sizeof(PokemonParam)*2);
			}
			break;
		case MFW_POKEDATA_RECV_C:
			if((SplitDataResult()&no2bittbl[id2])==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
#if RECV_CHG
				memcpy(&PokeParaEnemy[4],&RecvPoolBuf[id2][0],sizeof(PokemonParam)*2);
#else
				memcpy(&PokeParaEnemy[4],&RecvPoolBuf[id][0],sizeof(PokemonParam)*2);
#endif
				ServerWork[0]=MFW_NEXT_JOB;
			}
			break;
		case MFW_POKEDATA_RECV_P1:
			if((SplitDataResult()&no2bittbl[id2])==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
				SetRamSeedData();
#if RECV_CHG
				memcpy(&PokeParaEnemy[0],&RecvPoolBuf[id2][0],sizeof(PokemonParam)*2);
#else
				memcpy(&PokeParaEnemy[0],&RecvPoolBuf[id][0],sizeof(PokemonParam)*2);
#endif
				ServerWork[0]++;
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[0],sizeof(PokemonParam)*2);
			}
			break;
		case MFW_POKEDATA_RECV_P2:
			if((SplitDataResult()&no2bittbl[id2])==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
#if RECV_CHG
				memcpy(&PokeParaEnemy[2],&RecvPoolBuf[id2][0],sizeof(PokemonParam)*2);
#else
				memcpy(&PokeParaEnemy[2],&RecvPoolBuf[id][0],sizeof(PokemonParam)*2);
#endif
				ServerWork[0]++;
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[2],sizeof(PokemonParam)*2);
			}
			break;
		case MFW_POKEDATA_RECV_P3:
			if((SplitDataResult()&no2bittbl[id2])==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
#if RECV_CHG
				memcpy(&PokeParaEnemy[4],&RecvPoolBuf[id2][0],sizeof(PokemonParam)*2);
#else
				memcpy(&PokeParaEnemy[4],&RecvPoolBuf[id][0],sizeof(PokemonParam)*2);
#endif
				ServerWork[0]++;
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[4],sizeof(PokemonParam)*2);
			}
			break;
		case MFW_NEXT_JOB_WAIT:					//
			if((SplitDataResult()&no2bittbl[id])==0) break;
			SplitDataResultReset();
			ServerWork[0]++;
			break;
		case MFW_NEXT_JOB:						//
			BSSBoot();
//			MainProcChange(MainFight);
//			FightType|=FIGHT_TYPE_TUUSHIN_OK;
			ServerWork[0]++;
			ServerWork[1]=0;
			ServerWork[2]=0;
			break;
		case MFW_CLIENT_INIT:
			if(ClientDivInit(&ServerWork[1],&ServerWork[2])){
				PushFirstProc=sys.pFirstProc;
				sys.pFirstProc=ServerMain;
				MainProcChange(MainFight);
				if(FightType&FIGHT_TYPE_TUUSHIN){
					FieldTrainerID=TUUSHIN_TRAINER;
					FightType|=FIGHT_TYPE_TUUSHIN_OK;
				}
			}
			break;
	}
}
#endif

void GetMultiPokeListData()
{
	int	i;

	for(i=0;i<3;i++){
		MPLD[i].monsno=PokeParaGet(&PokeParaMine[i],ID_monsno);
		MPLD[i].itemno=PokeParaGet(&PokeParaMine[i],ID_item);
		PokeParaGet(&PokeParaMine[i],ID_nickname,MPLD[i].nickname);
		MPLD[i].level=PokeParaGet(&PokeParaMine[i],ID_level);
		MPLD[i].hp=PokeParaGet(&PokeParaMine[i],ID_hp);
		MPLD[i].hpmax=PokeParaGet(&PokeParaMine[i],ID_hpmax);
		MPLD[i].condition=PokeParaGet(&PokeParaMine[i],ID_condition);
		MPLD[i].personal_rnd=PokeParaGet(&PokeParaMine[i],ID_personal_rnd);
		MPLD[i].sex=PokeSexGet(&PokeParaMine[i]);
	}
	memcpy(&UserWork[0],&MPLD[0],sizeof(MultiPokeListData)*3);
}

enum{
	IF4C_TUUSHIN_CHECK=0,
	IF4C_MULTI_POKELIST_INIT,
	IF4C_MULTI_POKELIST,
	IF4C_MULTI_POKELIST_END,
};

void	InitFight4Comm(void)
{
	int	i;
	pFunc	*MFW4CProc;
	u16		*FightTypeTemp;
	u8	id;

	id=GetSioConnectId();
	UserWork[TUUSHIN_ID]=id;

	MFW4CProc=(pFunc *)&UserWork[MFW4CPROC];
	FightTypeTemp=(u16 *)&UserWork[FIGHT_TYPE_TEMP];

	MainTask();
	JumpActor();
	SetActor();

	switch(ServerWork[0]){
		case IF4C_TUUSHIN_CHECK:
			if(pokemon_sio_flag==0) break;
#ifdef PM_DEBUG
			if(DebugFightFlag&DEBUG_FIGHT_DEBUG){
				for(i=0;i<4;i++){
					SioTrainerInfo[i].StandPos=i;
					SioTrainerInfo[i].ninshou=NINSHOU_BATTLEROOM;
				}
			}
#endif
			if(SplitDataSendStatus()){
				GetMultiPokeListData();
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&UserWork[0],sizeof(MultiPokeListData)*3);
				ServerWork[0]++;
			}
			break;
		case IF4C_MULTI_POKELIST_INIT:
			if((SplitDataResult()&0x0f)!=0x0f) break;	//すべての端末からの返答を待つ
			SplitDataResultReset();

			for(i=0;i<4;i++){
				if(i!=id){
					if((((SioTrainerInfo[i].StandPos&1)==0)&&
					    ((SioTrainerInfo[id].StandPos&1)==0))||
					    ((SioTrainerInfo[i].StandPos&1)&&
						 (SioTrainerInfo[id].StandPos&1)))
						memcpy(&MPLD[0],&RecvPoolBuf[i][0],sizeof(MultiPokeListData)*3);
				}
			}
			ServerWork[0]++;
			*MFW4CProc=sys.pReturnProc;
			*FightTypeTemp=FightType;
			sys.pReturnProc=InitFight4Comm;
			PokeListCall( SCROLL_POKELIST_ID, SINGLE_LIST );
			break;
		case IF4C_MULTI_POKELIST:
			if(FadeData.fade_sw == 0){
				ServerWork[0]++;
				SetSioEndDataStart();
			}
			break;
		case IF4C_MULTI_POKELIST_END:
			if(pokemon_sio_flag==0){
				FightType=*FightTypeTemp;
				sys.pReturnProc=*MFW4CProc;
				MainProcChange(InitFight2);
			}
			break;
	}
}


enum{
	MFW4_TUUSHIN_CHECK=0,
	MFW4_VER_CHECK,
	MFW4_POKEDATA_SEND1,
	MFW4_POKEDATA_RECV1,
	MFW4_POKEDATA_SEND2,
	MFW4_POKEDATA_RECV2,
	MFW4_NEXT_JOB,
	MFW4_CLIENT_INIT,
};

void	MainFightWait4Comm(void)
{
	int	i;
	u8	id;
	u8	no;

	id=GetSioConnectId();
	UserWork[TUUSHIN_ID]=id;

	MainTask();
	JumpActor();
	SetActor();

	switch(ServerWork[0]){
		case MFW4_TUUSHIN_CHECK:					//通信対戦かどうかチェック
			if(pokemon_sio_flag==0) break;
#ifdef PM_DEBUG
			if(DebugFightFlag&DEBUG_FIGHT_DEBUG){
				for(i=0;i<4;i++){
					SioTrainerInfo[i].StandPos=i;
					SioTrainerInfo[i].ninshou=NINSHOU_BATTLEROOM;
				}
			}
#endif
			if(SplitDataSendStatus()){
				UserWork[0]=ServerVersion&0xff;
				UserWork[1]=(ServerVersion&0xff00)>>8;
				GetPokemonCondition();
				GetRamSeedData();
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&UserWork[0],4+sizeof(FightRamSeed));
				ServerWork[0]++;
			}
			break;
		case MFW4_VER_CHECK:
			if((SplitDataResult()&0x0f)!=0x0f) break;	//すべての端末からの返答を待つ
			SplitDataResultReset();
			for(i=0;i<4;i++){
				if((RecvPoolBuf[i][0]>=ServerVersion)&&
				   (i!=id)&&
				   (i<id))
					break;
			}
#if TUUSHIN_DEBUG
			if(i==4){
				FightType|=FIGHT_TYPE_OYA|FIGHT_TYPE_TRAINER;
				kanshi_num_set(1,0);
			}
			else
				FightType|=FIGHT_TYPE_TRAINER;
#else
			if(i==4)
				FightType|=FIGHT_TYPE_OYA|FIGHT_TYPE_TRAINER;
			else
				FightType|=FIGHT_TYPE_TRAINER;
#endif
			SetRamSeedData();
			memcpy(&UserWork[0x1d000],&PokeParaMine[0],sizeof(PokemonParam)*3);
			no=AddTask(WindowMove,0);
			TaskTable[no].work[WM_ANGLE1]=270;
			TaskTable[no].work[WM_ANGLE2]=90;
			TaskTable[no].work[WM_WORK0]=0;
			TaskTable[no].work[WM_CONDMINE]=0;
			TaskTable[no].work[WM_CONDENEMY]=0;
			for(i=0;i<4;i++){
				switch(SioTrainerInfo[i].StandPos){
					case 0:
						TaskTable[no].work[WM_CONDMINE]|=RecvPoolBuf[i][1]&0x3f;
						break;
					case 1:
						TaskTable[no].work[WM_CONDENEMY]|=RecvPoolBuf[i][1]&0x3f;
						break;
					case 2:
						TaskTable[no].work[WM_CONDMINE]|=(RecvPoolBuf[i][1]&0x3f)<<6;
						break;
					case 3:
						TaskTable[no].work[WM_CONDENEMY]|=(RecvPoolBuf[i][1]&0x3f)<<6;
						break;
				}
			}
			PokeParaMineInit();
			PokeParaEnemyInit();
			ServerWork[0]++;
		case MFW4_POKEDATA_SEND1:
			if(SplitDataSendStatus()){
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&UserWork[0x1d000],sizeof(PokemonParam)*2);
				ServerWork[0]++;
			}
			break;
		case MFW4_POKEDATA_RECV1:
			if((SplitDataResult()&0x0f)!=0x0f) break;	//すべての端末からの返答を待つ
			SplitDataResultReset();
			for(i=0;i<4;i++){
				if(i==id){
					switch(SioTrainerInfo[i].StandPos){
						case 0:
						case 3:
							memcpy(&PokeParaMine[0],RecvPoolBuf[i],sizeof(PokemonParam)*2);
							break;
						case 1:
						case 2:
							memcpy(&PokeParaMine[3],RecvPoolBuf[i],sizeof(PokemonParam)*2);
							break;
					}
				}
				else{
					if(
					   (
					   ((SioTrainerInfo[i].StandPos&1)==0)&&
					   ((SioTrainerInfo[id].StandPos&1)==0)
					   )
					   ||
					   (
					   (SioTrainerInfo[i].StandPos&1)&&
					   (SioTrainerInfo[id].StandPos&1)
					   )
					  ){
						switch(SioTrainerInfo[i].StandPos){
							case 0:
							case 3:
								memcpy(&PokeParaMine[0],RecvPoolBuf[i],sizeof(PokemonParam)*2);
								break;
							case 1:
							case 2:
								memcpy(&PokeParaMine[3],RecvPoolBuf[i],sizeof(PokemonParam)*2);
								break;
						}
					}
					else{
						switch(SioTrainerInfo[i].StandPos){
							case 0:
							case 3:
								memcpy(&PokeParaEnemy[0],RecvPoolBuf[i],sizeof(PokemonParam)*2);
								break;
							case 1:
							case 2:
								memcpy(&PokeParaEnemy[3],RecvPoolBuf[i],sizeof(PokemonParam)*2);
								break;
						}
					}
				}
			}
			ServerWork[0]++;
			break;
		case MFW4_POKEDATA_SEND2:
			if(SplitDataSendStatus()){
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&UserWork[0x1d000+sizeof(PokemonParam)*2],sizeof(PokemonParam));
				ServerWork[0]++;
			}
			break;
		case MFW4_POKEDATA_RECV2:
			if((SplitDataResult()&0x0f)!=0x0f) break;	//すべての端末からの返答を待つ
			SplitDataResultReset();
			for(i=0;i<4;i++){
				if(i==id){
					switch(SioTrainerInfo[i].StandPos){
						case 0:
						case 3:
							memcpy(&PokeParaMine[2],RecvPoolBuf[i],sizeof(PokemonParam));
							break;
						case 1:
						case 2:
							memcpy(&PokeParaMine[5],RecvPoolBuf[i],sizeof(PokemonParam));
							break;
					}
				}
				else{
					if(
					   (
					   ((SioTrainerInfo[i].StandPos&1)==0)&&
					   ((SioTrainerInfo[id].StandPos&1)==0)
					   )
					   ||
					   (
					   (SioTrainerInfo[i].StandPos&1)&&
					   (SioTrainerInfo[id].StandPos&1)
					   )
					  ){
						switch(SioTrainerInfo[i].StandPos){
							case 0:
							case 3:
								memcpy(&PokeParaMine[2],RecvPoolBuf[i],sizeof(PokemonParam));
								break;
							case 1:
							case 2:
								memcpy(&PokeParaMine[5],RecvPoolBuf[i],sizeof(PokemonParam));
								break;
						}
					}
					else{
						switch(SioTrainerInfo[i].StandPos){
							case 0:
							case 3:
								memcpy(&PokeParaEnemy[2],RecvPoolBuf[i],sizeof(PokemonParam));
								break;
							case 1:
							case 2:
								memcpy(&PokeParaEnemy[5],RecvPoolBuf[i],sizeof(PokemonParam));
								break;
						}
					}
				}
			}
			ServerWork[0]++;
			break;
		case MFW4_NEXT_JOB:
			BSSBoot();
			ServerWork[0]++;
			ServerWork[1]=0;
			ServerWork[2]=0;
			break;
		case MFW4_CLIENT_INIT:
			if(ClientDivInit(&ServerWork[1],&ServerWork[2])){
				PushFirstProc=sys.pFirstProc;
				sys.pFirstProc=ServerMain;
				MainProcChange(MainFight);
				if(FightType&FIGHT_TYPE_TUUSHIN){
					FieldTrainerID=TUUSHIN_TRAINER;
					FightType|=FIGHT_TYPE_TUUSHIN_OK;
				}
			}
			break;
	}
}

#if 0
enum{
	MFW_TUUSHIN_CHECK=0,
	MFW_VER_CHECK,
	MFW_SEND_WAIT_INIT,
	MFW_SEND_WAIT,
	MFW_SERVER_BOOT_WAIT,
	MFW_POKEDATA_SEND_C1,
	MFW_POKEDATA_SEND_C2,
	MFW_POKEDATA_SEND_C3,
	MFW_POKEDATA_RECV_C1,
	MFW_POKEDATA_RECV_C2,
	MFW_POKEDATA_RECV_C3,
	MFW_POKEDATA_RECV_P1,
	MFW_POKEDATA_RECV_P2,
	MFW_POKEDATA_RECV_P3,
	MFW_POKEDATA_SEND_P1,
	MFW_POKEDATA_SEND_P2,
	MFW_POKEDATA_SEND_P3,
	MFW_NEXT_JOB,
};

void	MainFightWait(void)
{
	u8	id;

	id=GetSioConnectId();

#if 1
	switch(ServerWork[0]){
		case MFW_TUUSHIN_CHECK:					//通信対戦かどうかチェック
			if((FightType&FIGHT_TYPE_TUUSHIN)&&(pokemon_sio_flag==0)) break;
			if(FightType&FIGHT_TYPE_TUUSHIN) ServerWork[0]=MFW_VER_CHECK;
			else{
//				FightType|=FIGHT_TYPE_OYA|FIGHT_TYPE_TRAINER;
				FightType|=FIGHT_TYPE_OYA;
				ServerWork[0]=MFW_NEXT_JOB;
			}

			break;
		case MFW_VER_CHECK:						//
			if(id==0) ServerWork[0]=MFW_SEND_WAIT_INIT;
			else{
				if(SplitDataSendStatus()){
					SplitDataSendStart(GetAnotherSendTo(),(u8 *)&ServerVersion,2);
					ServerWork[0]=MFW_SERVER_BOOT_WAIT;
				}
			}
			break;
		case MFW_SEND_WAIT_INIT:
			if(SplitDataResult()==0) break;
			SplitDataResultReset();
			if(RecvPoolBuf[id][0]<=ServerVersion){
				ServerWork[1]=0;
				FightType|=FIGHT_TYPE_OYA|FIGHT_TYPE_TRAINER;
			}
			else{
				ServerWork[1]=1;
			}
				ServerWork[0]++;
		case MFW_SEND_WAIT:
			if(SplitDataSendStatus()){
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&ServerWork[1],1);
				ServerWork[0]=MFW_POKEDATA_RECV_P1;
			}
			break;
		case MFW_SERVER_BOOT_WAIT:
			if(SplitDataResult()==0) break;
			SplitDataResultReset();
			if(RecvPoolBuf[id][0]==1)
				FightType|=FIGHT_TYPE_OYA|FIGHT_TYPE_TRAINER;
			ServerWork[0]=MFW_POKEDATA_SEND_C1;
			break;
		case MFW_POKEDATA_SEND_C1:
			if(SplitDataSendStatus()){
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[0],200);
				ServerWork[0]++;
			}
			break;
		case MFW_POKEDATA_SEND_C2:
			if(SplitDataResult()==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[2],200);
				ServerWork[0]++;
			}
			break;
		case MFW_POKEDATA_SEND_C3:
			if(SplitDataResult()==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[4],200);
				ServerWork[0]++;
			}
			break;
		case MFW_POKEDATA_RECV_C1:
			if(SplitDataResult()==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
#if RECV_CHG
				memcpy(&PokeParaEnemy[0],&RecvPoolBuf2[id2][0],200);
#else
				memcpy(&PokeParaEnemy[0],&RecvPoolBuf[id][0],200);
#endif
				ServerWork[0]++;
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&ServerVersion,2);
			}
			break;
		case MFW_POKEDATA_RECV_C2:
			if(SplitDataResult()==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
#if RECV_CHG
				memcpy(&PokeParaEnemy[2],&RecvPoolBuf2[id2][0],200);
#else
				memcpy(&PokeParaEnemy[2],&RecvPoolBuf[id][0],200);
#endif
				ServerWork[0]++;
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&ServerVersion,2);
			}
			break;
		case MFW_POKEDATA_RECV_C3:
			if(SplitDataResult()==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
#if RECV_CHG
				memcpy(&PokeParaEnemy[4],&RecvPoolBuf2[id2][0],200);
#else
				memcpy(&PokeParaEnemy[4],&RecvPoolBuf[id][0],200);
#endif
				ServerWork[0]=MFW_NEXT_JOB;
			}
			break;
		case MFW_POKEDATA_RECV_P1:
			if(SplitDataResult()==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
#if RECV_CHG
				memcpy(&PokeParaEnemy[0],&RecvPoolBuf2[id2][0],200);
#else
				memcpy(&PokeParaEnemy[0],&RecvPoolBuf[id][0],200);
#endif
				ServerWork[0]++;
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&ServerVersion,2);
			}
			break;
		case MFW_POKEDATA_RECV_P2:
			if(SplitDataResult()==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
#if RECV_CHG
				memcpy(&PokeParaEnemy[2],&RecvPoolBuf2[id2][0],200);
#else
				memcpy(&PokeParaEnemy[2],&RecvPoolBuf[id][0],200);
#endif
				ServerWork[0]++;
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&ServerVersion,2);
			}
			break;
		case MFW_POKEDATA_RECV_P3:
			if(SplitDataResult()==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
#if RECV_CHG
				memcpy(&PokeParaEnemy[4],&RecvPoolBuf2[id2][0],200);
#else
				memcpy(&PokeParaEnemy[4],&RecvPoolBuf[id][0],200);
#endif
				ServerWork[0]++;
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&ServerVersion,2);
			}
			break;
		case MFW_POKEDATA_SEND_P1:
			if(SplitDataSendStatus()){
				SplitDataResultReset();
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[0],200);
				ServerWork[0]++;
			}
			break;
		case MFW_POKEDATA_SEND_P2:
			if(SplitDataResult()==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&PokeParaMine[2],200);
				ServerWork[0]++;
			}
			break;
		case MFW_POKEDATA_SEND_P3:
			if(SplitDataResult()==0) break;
			if(SplitDataSendStatus()){
				SplitDataResultReset();
				ServerWork[0]++;
			}
			break;
		case MFW_NEXT_JOB:						//
			BSSBoot();
			MainProcChange(MainFight);
			break;
#else
	switch(ServerWork[0]){
		case MFW_TUUSHIN_CHECK:					//通信対戦かどうかチェック
			if(FightType&FIGHT_TYPE_TUUSHIN) ServerWork[0]=MFW_VER_CHECK;
			else{
				FightType|=FIGHT_TYPE_OYA|FIGHT_TYPE_TRAINER;
				ServerWork[0]=MFW_NEXT_JOB;
			}
			break;
		case MFW_VER_CHECK:						//
			if(GetSioConnectId()==0){
				FightType|=FIGHT_TYPE_OYA|FIGHT_TYPE_TRAINER;
				ServerWork[0]=MFW_NEXT_JOB;
			}
			else{
				FightType|=FIGHT_TYPE_TRAINER;
				ServerWork[0]=MFW_NEXT_JOB;
			}
			break;
		case MFW_SEND_WAIT:
			break;
		case MFW_SERVER_BOOT_WAIT:
			break;
		case MFW_NEXT_JOB:						//
			BSSBoot();
			MainProcChange(MainFight);
			break;
#endif
	}
}
#endif

#if 0
void	MainFight(void)
{
	if(FightType&FIGHT_TYPE_TUUSHIN){
//		if((SplitDataSendStatus())&&(TuushinWaitWork==0)){
			JumpActor();
//			if(TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]==
//			   TaskTable[TuushinReqTaskNo].work[REQ_BUF_GET]){
//				ServerSequence();
//				for(ClientNo=0;ClientNo<ClientSetMax;ClientNo++)
//					ClientSequence[ClientNo]();
//			}
			SetActor();

#ifdef	PM_DEBUG
			if(((sys.Cont&RESET_KEY)==RESET_KEY)&&
			    (DebugMainFlag)){
				AnswerWork=WinLoseFlag=FIGHT_WIN;
				sys.FieldBattleFlag=0;			//戦闘中Flagをおとす
				LasterSys.TransType=LASTER_END;
				sys.pFirstProc=PushFirstProc;
				PokeParaEnemyInit();
				m4aSongNumStop(SE_HINSI);		//HP少ないアラームをとめる
				MainProcChange(sys.pReturnProc);
			}
#endif
			BattleTalkMsgPut(&FightMsg);
			PaletteAnime();
//		}
		MainTask();
//		if(TuushinWaitWork)
//			TuushinWaitWork--;
	}
	else{
			JumpActor();
//			ServerSequence();
//			for(ClientNo=0;ClientNo<ClientSetMax;ClientNo++)
//				ClientSequence[ClientNo]();
			SetActor();

#ifdef	PM_DEBUG
			if(((sys.Cont&RESET_KEY)==RESET_KEY)&&
			    (DebugMainFlag)){
				AnswerWork=WinLoseFlag=FIGHT_WIN;
				sys.FieldBattleFlag=0;			//戦闘中Flagをおとす
				LasterSys.TransType=LASTER_END;
				sys.pFirstProc=PushFirstProc;
				PokeParaEnemyInit();
				m4aSongNumStop(SE_HINSI);		//HP少ないアラームをとめる
				if(FightType&FIGHT_TYPE_TUUSHIN)
					MainProcChange(FieldCommRecover);
				else
					MainProcChange(sys.pReturnProc);
			}
#endif
			BattleTalkMsgPut(&FightMsg);
			PaletteAnime();
			MainTask();
	}
}
#else
void	MainFight(void)
{
	JumpActor();
	SetActor();

#ifdef	PM_DEBUG
	if((sys.Cont&RESET_KEY)==RESET_KEY){
		AnswerWork=WinLoseFlag=FIGHT_WIN;
		sys.FieldBattleFlag=0;			//戦闘中Flagをおとす
		LasterSys.TransType=LASTER_END;
		sys.pFirstProc=PushFirstProc;
		PokeParaEnemyInit();
		m4aSongNumStop(SE_HINSI);		//HP少ないアラームをとめる
		if(FightType&FIGHT_TYPE_TUUSHIN)
			MainProcChange(FieldCommRecover);
		else
			MainProcChange(sys.pReturnProc);
	}
#endif
	BattleTalkMsgPut(&FightMsg);
	PaletteAnime();
	MainTask();
}
#endif


//エンカウントエフェクトルーチン

void	SeqEncountEffectInit(actWork *Xreg)
{
		Xreg->work[0]=0;			//エフェクトシーケンスナンバー
		Xreg->move=SeqEncountEffectMain;
}

void	SeqEncountEffectMain(actWork *Xreg)
{
		int		i,pos1,pos2;
		u16		*UW;

		UW=(u16 *)&UserWork;

		switch(Xreg->work[0]){
				case	0:				//エフェクト初期化
						Xreg->work[0]++;
						Xreg->work[1]=0;					//スタートポジション
						Xreg->work[2]=1+0x20*20;			//スタートポジション2
						Xreg->work[3]=0;					//オフセット
						Xreg->work[4]=1;					//ウェイト
				case	1:
						if(--Xreg->work[4]==0){
								Xreg->work[4]=EFFECT_WAIT;		//ウェイト
								pos1=Xreg->work[1]+Xreg->work[3]*0x20;
								pos2=Xreg->work[2]-Xreg->work[3]*0x20;
								for(i=0;i<30;i+=2){
										*(UW+pos1+i)=0x3d;
										*(UW+pos2+i)=0x3d;
								}
								if(++Xreg->work[3]==21){
										Xreg->work[0]++;
										Xreg->work[1]=0x20;			//ウェイト
								}
						}
						break;
				case	2:
						if(--Xreg->work[1]==20) 
							MainProcChange(InitFight);
						break;
		}
}

u8	TrainerDataSet(PokemonParam *PP,u16 ID)
{
	TrainerTypeNormalData	*TTND;
	TrainerTypeWazaData		*TTWD;
	TrainerTypeItemData		*TTID;
	TrainerTypeMultiData	*TTMD;
	int	i,j,work=0;
	u32	rnd;
	u8	pow;

	if(ID==ORUSUBAN_TRAINER) return 0;

	if((FightType&FIGHT_TYPE_TRAINER)&&
	  ((FightType&FIGHT_TYPE_BATTLE_TOWER)==0)&&
	  ((FightType&FIGHT_TYPE_CARD_E)==0)){
		PokeParaEnemyInit();
		for(i=0;i<TD[ID].monscount;i++){
			if(TD[ID].fighttype==FIGHT_TYPE_2vs2)
				rnd=128;
			else{
				if(TD[ID].sex&0x80)
					rnd=120;
				else
					rnd=136;
			}
			j=0;
			while(TD[ID].name[j]!=EOM_){
				work+=TD[ID].name[j];
				j++;
			}
			switch(TD[ID].datatype){
				case DATATYPE_NORMAL:
					TTND=(TrainerTypeNormalData *)TD[ID].TPD;
					j=0;
					while(PokeNameData[TTND[i].monsno][j]!=EOM_){
						work+=PokeNameData[TTND[i].monsno][j];
						j++;
					}
					rnd=(work<<8)+rnd;
					pow=TTND[i].pow*31/255;
					PokeParaSet(&PP[i],
								TTND[i].monsno,
								TTND[i].level,
								pow,
								RND_SET,
								rnd,
								ID_NO_RARE,
								0);
					break;
				case DATATYPE_WAZA:
					TTWD=(TrainerTypeWazaData *)TD[ID].TPD;
					j=0;
					while(PokeNameData[TTWD[i].monsno][j]!=EOM_){
						work+=PokeNameData[TTWD[i].monsno][j];
						j++;
					}
					rnd=(work<<8)+rnd;
					pow=TTWD[i].pow*31/255;
					PokeParaSet(&PP[i],
								TTWD[i].monsno,
								TTWD[i].level,
								pow,
								RND_SET,
								rnd,
								ID_NO_RARE,
								0);
					for(j=0;j<4;j++){
						PokeParaPut(&PP[i],ID_waza1+j,(u8 *)&TTWD[i].waza[j]);
						PokeParaPut(&PP[i],ID_pp1+j,(u8 *)&WTD[TTWD[i].waza[j]].pp);
					}
					break;
				case DATATYPE_ITEM:
					TTID=(TrainerTypeItemData *)TD[ID].TPD;
					j=0;
					while(PokeNameData[TTID[i].monsno][j]!=EOM_){
						work+=PokeNameData[TTID[i].monsno][j];
						j++;
					}
					rnd=(work<<8)+rnd;
					pow=TTID[i].pow*31/255;
					PokeParaSet(&PP[i],
								TTID[i].monsno,
								TTID[i].level,
								pow,
								RND_SET,
								rnd,
								ID_NO_RARE,
								0);
					PokeParaPut(&PP[i],ID_item,(u8 *)&TTID[i].itemno);
					break;
				case DATATYPE_MULTI:
					TTMD=(TrainerTypeMultiData *)TD[ID].TPD;
					j=0;
					while(PokeNameData[TTMD[i].monsno][j]!=EOM_){
						work+=PokeNameData[TTMD[i].monsno][j];
						j++;
					}
					rnd=(work<<8)+rnd;
					pow=TTMD[i].pow*31/255;
					PokeParaSet(&PP[i],
								TTMD[i].monsno,
								TTMD[i].level,
								pow,
								RND_SET,
								rnd,
								ID_NO_RARE,
								0);
					PokeParaPut(&PP[i],ID_item,(u8 *)&TTMD[i].itemno);
					for(j=0;j<4;j++){
						PokeParaPut(&PP[i],ID_waza1+j,(u8 *)&TTMD[i].waza[j]);
						PokeParaPut(&PP[i],ID_pp1+j,(u8 *)&WTD[TTMD[i].waza[j]].pp);
					}
					break;
			}
		}
		FightType|=TD[ID].fighttype;
	}
//	else if(FightType&FIGHT_TYPE_BATTLE_TOWER)
//		BattleTowerPokemonSet();

	return TD[ID].monscount;
}

//==============================================================
//                    割り込みルーチン
//==============================================================

//--------------------------------------------------------------
//                    Ｈブランク関数
//--------------------------------------------------------------

void	fight_h_blank_intr(void)
{
	u16	vpos;

	vpos = (*(vu16 *)REG_VCOUNT);
	if( (vpos>=111) && (vpos<=159) )
//	if(vpos==111)
		*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_0
		| 24 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 | BG_MOS_OFF;

}

//--------------------------------------------------------------
//                    Ｖブランク関数
//--------------------------------------------------------------

void fight_v_blank_intr(void)
{
#if 0
		*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_3
		| 24 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 | BG_MOS_OFF;
#endif
		pp_rand();
		*(vu16 *)REG_BG0HOFS = ScrX0;
		*(vu16 *)REG_BG0VOFS = ScrY0;
		*(vu16 *)REG_BG1HOFS = ScrX1;
		*(vu16 *)REG_BG1VOFS = ScrY1;
		*(vu16 *)REG_BG2HOFS = ScrX2;
		*(vu16 *)REG_BG2VOFS = ScrY2;
		*(vu16 *)REG_BG3HOFS = ScrX3;
		*(vu16 *)REG_BG3VOFS = ScrY3;
		*(vu16*)REG_WIN0H=Win0H;
		*(vu16*)REG_WIN0V=Win0V;
		*(vu16*)REG_WIN1H=Win1H;
		*(vu16*)REG_WIN1V=Win1V;
		actOAMtrans();
		actDMAtrans();
		PaletteFadeTrans();
		LasterVblank();

}

const	actHeader EncountEffect = 
{
	0,	//登録番号
	0,	//登録番号
	&DummyActOam,
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	SeqEncountEffectInit
};

//======================================================================
//
//		通信対戦開始前ウインドウ表示のVS表示
//
//======================================================================

void	SeqVSMoveInit(actWork *Xreg)
{
}

void	SeqVSMoveWait(actWork *Xreg)
{
	if(Xreg->work[0])
		Xreg->x=Xreg->work[1]+((Xreg->work[2]&0xff00)>>8);
	else
		Xreg->x=Xreg->work[1]-((Xreg->work[2]&0xff00)>>8);

	Xreg->work[2]+=0x180;

	if(Xreg->affend_sw){
		CellDel(10000);
		ObjPalRegNumDel(10000);
		AffineDelActor(Xreg);
		DelActor(Xreg);
	}
}

void	SeqVSMove(actWork *Xreg)
{
	ActAffAnmChg(Xreg,1);
	Xreg->move=SeqVSMoveWait;
	SePlay(SE_BT_START);
}

//======================================================================
//
//		通信対戦終了後の勝敗ウインドウ表示
//
//======================================================================

static void GetPokeConditionWinLose(u8 no)
{
	int	i;
	u16	monsno;
	u16	hp;
	u32	condition;
	int	cond;
	u8	id;
	PokemonParam *PP1=0,*PP2=0;

//	id=GetSioConnectId();
	id=UserWork[TUUSHIN_ID];

	if(FightType&FIGHT_TYPE_4_2vs2){
		switch(SioTrainerInfo[id].StandPos){
			case 0:
			case 2:
				PP1=&PokeParaMine[0];
				PP2=&PokeParaEnemy[0];
				break;
			case 1:
			case 3:
				PP1=&PokeParaEnemy[0];
				PP2=&PokeParaMine[0];
				break;
		}
	}
	else{
		PP1=&PokeParaMine[0];
		PP2=&PokeParaEnemy[0];
	}

	cond=0;
	for(i=0;i<6;i++){
		monsno=PokeParaGet(&PP1[i],ID_monsno_egg);
		hp=PokeParaGet(&PP1[i],ID_hp);
		condition=PokeParaGet(&PP1[i],ID_condition);
		if((monsno)&&(monsno!=MONSNO_TAMAGO)&&(hp)&&(condition==0))
			cond|=(1<<(i*2));
		if((monsno)&&(hp)&&((monsno==MONSNO_TAMAGO)||(condition)))
			cond|=(2<<(i*2));
		if((monsno)&&(monsno!=MONSNO_TAMAGO)&&(hp==0))
			cond|=(3<<(i*2));
	}

	TaskTable[no].work[WM_CONDMINE]=cond;

	cond=0;
	for(i=0;i<6;i++){
		monsno=PokeParaGet(&PP2[i],ID_monsno_egg);
		hp=PokeParaGet(&PP2[i],ID_hp);
		condition=PokeParaGet(&PP2[i],ID_condition);
		if((monsno)&&(monsno!=MONSNO_TAMAGO)&&(hp)&&(condition==0))
			cond|=(1<<(i*2));
		if((monsno)&&(hp)&&((monsno==MONSNO_TAMAGO)||(condition)))
			cond|=(2<<(i*2));
		if((monsno)&&(monsno!=MONSNO_TAMAGO)&&(hp==0))
			cond|=(3<<(i*2));
	}

	TaskTable[no].work[WM_CONDENEMY]=cond;
}

void	FightEndWindowInit(void)
{
	int	i;
	u8	no;

	SetHBlankFunc(NULL);
	SetVBlankFunc(NULL);

	CpuClear(0,VRAM,(VRAM_END-VRAM),32);
	*(vu16*)REG_MOSAIC = 0;

	*(vu16*)REG_WIN0H = 0x00f0;
	*(vu16*)REG_WIN0V = 0x5051;
	*(vu16*)REG_WININ = 0;
	*(vu16*)REG_WINOUT =0;

	Win0H = 0x00f0;
	Win0V = 0x5051;

	LasterWorkInit();
	for(i=0;i<80;i++){
		LasterBuffer[0][i]=ENCOUNT_DX;
		LasterBuffer[1][i]=ENCOUNT_DX;
	}
	for(;i<160;i++){
		LasterBuffer[0][i]=-ENCOUNT_DX;
		LasterBuffer[1][i]=-ENCOUNT_DX;
	}

	PrintScreenInit(FIGHT_TYPE);
	PaletteAnimeInit();

	ScrX0=0;
	ScrY0=0;
	ScrX1=0;
	ScrY1=0;
	ScrX2=0;
	ScrY2=0;
	ScrX3=0;
	ScrY3=0;

	MsgControlInit(&FightMsg,FIGHT_TYPE);	//change 2001.07.12(木) by matsuda
	MsgControlInit(&TuushinWin1,TUUSHINWIN1_TYPE);	//change 2001.07.12(木) by matsuda
	MsgControlInit(&TuushinWin2,TUUSHINWIN2_TYPE);	//change 2001.07.12(木) by matsuda

	FightREGSet();
	DecordPaletteWork((void *)batt_bg1_pcl_ADRS,PA_BG0,0x40);
	FightWindowChrSet();

	InitActor();
	InitTask();

	FightEffectBGSet();
	*(vu16*)REG_WINOUT = 0x0037;

	ObjPalManInit();
	ObjPalManStart=4;	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始 ここに移動 by matsuda 2001.09.26(水)

	SetVBlankFunc(fight_v_blank_intr);

	no=AddTask(WindowMove,0);
	TaskTable[no].work[WM_ANGLE1]=270;
	TaskTable[no].work[WM_ANGLE2]=90;
	TaskTable[no].work[WM_WORK0]=1;
	GetPokeConditionWinLose(no);
	MainProcChange(FightEndWindowMain);
	ServerWork[0]=0;
}

void	FightEndWindowMain(void)
{
	FightEndWindowSequence();
	JumpActor();
	SetActor();
	PaletteAnime();
	MainTask();
}

void	FightEndWindowSequence(void)
{
	switch(ServerWork[0]){
		case 0:
			ServerWork[1]=0xff;
			ServerWork[0]++;
			break;
		case 1:
			if(--ServerWork[1]==0){
				PaletteFadeReq(0xffffffff, 0, 0, 16, 0);
				ServerWork[0]++;
			}
			break;
		case 2:
			if(FadeData.fade_sw == 0)
				MainProcChange(sys.pReturnProc);
			break;
	}
}

