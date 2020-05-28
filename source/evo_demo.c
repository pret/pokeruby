//******************************************************************
//          evo_demo.c                                                  
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
#include "decord.h"
#include "calctool.h"
#include "print.h"
#include "menu.h"
#include "window.h"
#include "objdata.h"
#include "poketool.h"
#include "monsno.def"

static	const u16 evo_Palette[16] = {
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
0x2946,0x35AA,0x420D,0x4E71,0x5AD4,0x6738,0x739B,0x7FFF,
};
static	const u8 evo_obj_LZ[0x20] = {
0x10,0x20,0x00,0x00,

0x00,0x00,0xed,0xde,0x00,0xe0,0xff,0xff,0x0e,0x00,0xfd,0xff,0xff,0xdf,0xfe,0xff,
0xff,0xef,0xf0,0x10,0x03,0x10,0x0b,0x10,0x13,0x10,0x1b,0x00,
};

extern	u16		pp_rand(void);
extern	void	affineWorkSet(u8 num,u16 H_X,u16 V_X,u16 H_Y,u16 V_Y);

#define	EVO_MAINWAIT	(0x20)

//メインタスクワーク定義
#define	EVD1_EVOENDSW	(0)
#define	EVD1_ACTBEFORE	(1)
#define	EVD1_ACTAFTER	(2)
#define	EVD1_WAIT_1		(13)
#define	EVD1_WAIT_2		(14)
#define	EVD1_WAIT		(15)

//ＯＢＪワーク（光）定義
#define	EVD_O_L1_SEQ	(0)
#define	EVD_O_L1_SPEEDX	(3)
#define	EVD_O_L1_SPEEDY	(4)
#define	EVD_O_L1_RADIUS	(5)
#define	EVD_O_L1_THETA	(6)
#define	EVD_O_L1_WAIT	(7)

//ＯＢＪ定義
#define	POKE_X		(120)	//ポケモンＸ座標
#define	POKE_Y		(56)	//ポケモンＹ座標
#define	LIGHT1_X	(120)	//光１Ｘ座標
#define	LIGHT1_Y	(56+32)	//光１Ｙ座標
#define	LIGHT2_X	(120)	//光２Ｘ座標
#define	LIGHT2_Y	(56-48)	//光２Ｙ座標
#define	CELLID_EVODEMOLIGHT	(1001)
#define	PALID_EVODEMOLIGHT	(1001)

/********************************************************************/
/*                                                                  */
/*				ＯＢＪコントロール									*/
/*                                                                  */
/********************************************************************/
/*------------------------------------------------------------------*/
/*				光のつぶ											*/
/*------------------------------------------------------------------*/
static	const CellData	EvoDemoCell[] = {
	{ (void*)evo_obj_LZ,	0x020	,CELLID_EVODEMOLIGHT },
	{ CELL_END, 0, 0 }
};
static	const PalData	EvoDemoPal[] = {
	{ evo_Palette,PALID_EVODEMOLIGHT },
	{ OBJPAL_END, 0 },
};
//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static const ActOamData		EVOdemoLightOam = {160,0,0,0,0,0,0,0,0,0,1,0,0};
static const actAnm			EVOdemoLightAnm0[] = {{0x00,8,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm* const	EVOdemoLightAnmTbl[] = {EVOdemoLightAnm0};
static	void	EVOdemoLightActMove(actWork* aw){}

static	const actHeader		EVOdemoLightActHeader ={
CELLID_EVODEMOLIGHT,PALID_EVODEMOLIGHT,&EVOdemoLightOam,
EVOdemoLightAnmTbl,ACT_NTRANS,DummyActAffTbl,EVOdemoLightActMove,
};

static	const u16	EVOdemoLightAffineTbl[] = {
0x03c0,0x0380,0x0340,0x0300,0x02c0,0x0280,0x0240,0x0200,0x01c0,0x0180,0x0140,0x0100,
};
static	void	EVOdemoLightAffineInit(void)
{
	u16	i;

	for(i=0;i<12;i++){
		affineWorkSet(i+20,EVOdemoLightAffineTbl[i],0,0,EVOdemoLightAffineTbl[i]);
	}
}

/*------------------------------------------------------------------*/
/*				光のつぶ（パターン１）								*/
/*------------------------------------------------------------------*/
static	void	EVOdemoLight1ActMove(actWork* aw)
{
	u8	affinenum;

	if(aw->y > LIGHT2_Y){
		aw->y	= LIGHT1_Y - (aw->work[EVD_O_L1_WAIT] * aw->work[EVD_O_L1_WAIT]/(16*5));
		aw->dy = SinMove((u8)aw->work[EVD_O_L1_THETA],aw->work[EVD_O_L1_RADIUS])/4;
		aw->dx = CosMove((u8)aw->work[EVD_O_L1_THETA],aw->work[EVD_O_L1_RADIUS]);
		aw->work[EVD_O_L1_THETA]+=4;
		if(aw->work[EVD_O_L1_WAIT] & 0x0001)	aw->work[EVD_O_L1_RADIUS]--;
		aw->work[EVD_O_L1_WAIT]++;
		if(aw->dy > 0)	aw->pri = 1;
		else			aw->pri = 20;
		affinenum = (aw->work[EVD_O_L1_RADIUS]*12/48)+20;
		if(affinenum >= 32)	affinenum = 31;
		aw->oamData.AffineParamNo = affinenum;
	}else{
		DelActor(aw);
	}
}

static	void	EVOdemoLight1Set(u8 theta)
{
	u8	actnum;

	actnum = AddActor( &EVOdemoLightActHeader,LIGHT1_X,LIGHT1_Y,0);
	if(actnum != ACT_MAX){
		ActWork[actnum].work[EVD_O_L1_RADIUS]	= 48;
		ActWork[actnum].work[EVD_O_L1_THETA]	= theta;
		ActWork[actnum].work[EVD_O_L1_WAIT]		= 0;
		ActWork[actnum].oamData.AffineMode = 1;	//アフィンマネージャーを起動させない
		ActWork[actnum].oamData.AffineParamNo = 31;
		ActWork[actnum].move = EVOdemoLight1ActMove;
	}
}

/*------------------------------------------------------------------*/
/*				光のつぶ（パターン２）								*/
/*------------------------------------------------------------------*/
static	void	EVOdemoLight2ActMove(actWork* aw)
{
	if(aw->y < LIGHT1_Y){
		aw->y	= LIGHT2_Y + (aw->work[EVD_O_L1_WAIT] * aw->work[EVD_O_L1_WAIT]/5);
		aw->dy = SinMove((u8)aw->work[EVD_O_L1_THETA],aw->work[EVD_O_L1_RADIUS])/4;
		aw->dx = CosMove((u8)aw->work[EVD_O_L1_THETA],aw->work[EVD_O_L1_RADIUS]);
		aw->work[EVD_O_L1_RADIUS] = 8 + SinMove((u8)(aw->work[EVD_O_L1_WAIT]*4),40);
		aw->work[EVD_O_L1_WAIT]++;
	}else{
		DelActor(aw);
	}
}

static	void	EVOdemoLight2Set(u8 theta)
{
	u8	actnum;

	actnum = AddActor( &EVOdemoLightActHeader,LIGHT1_X,LIGHT2_Y,0);
	if(actnum != ACT_MAX){
		ActWork[actnum].work[EVD_O_L1_RADIUS]	= 8;
		ActWork[actnum].work[EVD_O_L1_THETA]	= theta;
		ActWork[actnum].work[EVD_O_L1_WAIT]		= 0;
		ActWork[actnum].oamData.AffineMode = 1;	//アフィンマネージャーを起動させない
		ActWork[actnum].oamData.AffineParamNo = 25;
		ActWork[actnum].pri = 1;
		ActWork[actnum].move = EVOdemoLight2ActMove;
	}
}

/*------------------------------------------------------------------*/
/*				光のつぶ（パターン３）								*/
/*------------------------------------------------------------------*/
static	void	EVOdemoLight3ActMove(actWork* aw)
{
	if(aw->work[EVD_O_L1_RADIUS] > 8){
		aw->dy = SinMove((u8)aw->work[EVD_O_L1_THETA],aw->work[EVD_O_L1_RADIUS]);
		aw->dx = CosMove((u8)aw->work[EVD_O_L1_THETA],aw->work[EVD_O_L1_RADIUS]);
		aw->work[EVD_O_L1_RADIUS] -= aw->work[EVD_O_L1_SPEEDX]; 
		aw->work[EVD_O_L1_THETA] += 4;
	}else{
		DelActor(aw);
	}
}

static	void	EVOdemoLight3Set(u8 theta,u8 speed)
{
	u8	actnum;

	actnum = AddActor( &EVOdemoLightActHeader,POKE_X,POKE_Y,0);
	if(actnum != ACT_MAX){
		ActWork[actnum].work[EVD_O_L1_SPEEDX]	= speed;
		ActWork[actnum].work[EVD_O_L1_RADIUS]	= 120;
		ActWork[actnum].work[EVD_O_L1_THETA]	= theta;
		ActWork[actnum].work[EVD_O_L1_WAIT]		= 0;
		ActWork[actnum].oamData.AffineMode = 1;	//アフィンマネージャーを起動させない
		ActWork[actnum].oamData.AffineParamNo = 31;
		ActWork[actnum].pri = 1;
		ActWork[actnum].move = EVOdemoLight3ActMove;
	}
}

/*------------------------------------------------------------------*/
/*				光のつぶ（パターン４）								*/
/*------------------------------------------------------------------*/
static	void	EVOdemoLight4ActMove(actWork* aw)
{
	u8	affinenum;

	if(!(aw->work[EVD_O_L1_WAIT] & 0x0003))	aw->y++;

	if(aw->work[EVD_O_L1_THETA] < 0x80){
		aw->dy = -SinMove((u8)aw->work[EVD_O_L1_THETA],aw->work[EVD_O_L1_RADIUS]);
		aw->x  = POKE_X + (aw->work[EVD_O_L1_SPEEDX] * aw->work[EVD_O_L1_WAIT])/3;
		aw->work[EVD_O_L1_THETA]+=1;
		affinenum = 31 - (aw->work[EVD_O_L1_THETA]*12/0x80);
		if(aw->work[EVD_O_L1_THETA] > 0x40){
			aw->pri = 1;
		}else{
			aw->banish = 0;
			aw->pri = 20;
			if((aw->work[EVD_O_L1_THETA] > 0x70)&&(aw->work[EVD_O_L1_THETA] & 1)){
				aw->banish = 1;
			}
		}
		if(affinenum < 20)	affinenum = 20;
		aw->oamData.AffineParamNo = affinenum;
		aw->work[EVD_O_L1_WAIT]++;
	}else{
		DelActor(aw);
	}
}

static	const s16	EVOdemoLight4Tbl[][2] = {
{-4,0x10},{-3,0x30},{-2,0x50},{-1,0x70},{1,0x70},{2,0x50},{3,0x30},{4,0x10},
};

static	void	EVOdemoLight4Set(u8 pat)
{
	u8	actnum;

	actnum = AddActor( &EVOdemoLightActHeader,POKE_X,POKE_Y,0);
	if(actnum != ACT_MAX){
		ActWork[actnum].work[EVD_O_L1_SPEEDX]	= 3 - pp_rand()%0x0007;
		ActWork[actnum].work[EVD_O_L1_RADIUS]	= (pp_rand()&0x003f)+0x30;
		ActWork[actnum].work[EVD_O_L1_WAIT]		= 0;
		ActWork[actnum].oamData.AffineMode = 1;	//アフィンマネージャーを起動させない
		ActWork[actnum].oamData.AffineParamNo = 31;
		ActWork[actnum].pri = 20;
		ActWork[actnum].move = EVOdemoLight4ActMove;
	}
}






static	void	EvoPartsDemoPart1InitTask(u8 id);
static	void	EvoPartsDemoPart1MainTask(u8 id);
static	void	EvoPartsDemoPart1WaitTask(u8 id);
static	void	EvoPartsDemoPart2InitTask(u8 id);
static	void	EvoPartsDemoPart2MainTask(u8 id);
static	void	EvoPartsDemoPart2WaitTask(u8 id);
static	void	EvoPartsDemoPart3InitTask(u8 id);
static	void	EvoPartsDemoPart3MainTask(u8 id);
static	void	EvoPartsDemoPart3WaitTask(u8 id);
static	void	EvoPartsDemoPart4InitTask(u8 id);
static	void	EvoPartsDemoPart4InitTaskSio(u8 id);
static	void	EvoPartsDemoPart4MainTask(u8 id);
static	void	EvoPartsDemoPart4MainTaskSio(u8 id);
static	void	EvoPartsDemoPart4WaitTask(u8 id);
//******************************************************************
/********************************************************************/
/*                                                                  */
/*				初期化												*/
/*                                                                  */
/********************************************************************/
void	EvoDemoPartsInit(void)
{
	DecordCellSet((CellData*)EvoDemoCell);
	ObjPalSets((PalData*)EvoDemoPal);
}

/********************************************************************/
/*                                                                  */
/*				メイン処理（タスク）								*/
/*                                                                  */
/********************************************************************/
/*------------------------------------------------------------------*/
/*				パート１（進化開始エフェクトその１）				*/
/*------------------------------------------------------------------*/
u8		EvoPartsDemoPart1Set(u16 before_poke_pal)
{
	u8	taskID;

	taskID = AddTask(EvoPartsDemoPart1InitTask, 0);
	TaskTable[taskID].work[EVD1_ACTBEFORE] = before_poke_pal;

	return taskID;
}

static	void	EvoPartsDemoPart1InitTask(u8 id)
{
	u32	pal_bit;

	EVOdemoLightAffineInit();
	TaskTable[id].work[EVD1_WAIT] = 0;
	pal_bit = (0x00000003 << TaskTable[id].work[EVD1_ACTBEFORE]);
	PaletteFadeReq(pal_bit,10,0,16,0x7fff);
	TaskTable[id].TaskAdrs	= EvoPartsDemoPart1MainTask;
	SePlay(SE_W025);
}

static	void	EvoPartsDemoPart1MainTask(u8 id)
{
	u8	i;

	if(TaskTable[id].work[EVD1_WAIT] < 0x040){
		if(!(TaskTable[id].work[EVD1_WAIT] & 0x07)){
			for(i=0;i<4;i++){
				EVOdemoLight1Set(((TaskTable[id].work[EVD1_WAIT]&0x0078)<<1)+(i*0x40));
			}
		}
		TaskTable[id].work[EVD1_WAIT]++;
	}else{
		TaskTable[id].work[EVD1_WAIT] = 0x60;
		TaskTable[id].TaskAdrs	= EvoPartsDemoPart1WaitTask;
	}
}

static	void	EvoPartsDemoPart1WaitTask(u8 id)
{
	if(TaskTable[id].work[EVD1_WAIT]){
		TaskTable[id].work[EVD1_WAIT]--;
	}else{
		DelTask(id);
	}
}

/*------------------------------------------------------------------*/
/*				パート２（進化開始エフェクトその２）				*/
/*------------------------------------------------------------------*/
u8		EvoPartsDemoPart2Set(void)
{
	u8	taskID;

	taskID = AddTask(EvoPartsDemoPart2InitTask, 0);

	return taskID;
}

static	void	EvoPartsDemoPart2InitTask(u8 id)
{
	EVOdemoLightAffineInit();
	TaskTable[id].work[EVD1_WAIT] = 0;
	TaskTable[id].TaskAdrs	= EvoPartsDemoPart2MainTask;
	SePlay(SE_W062B);
}

static	void	EvoPartsDemoPart2MainTask(u8 id)
{
	u8	i;

	if(TaskTable[id].work[EVD1_WAIT] < 0x60){
		if(TaskTable[id].work[EVD1_WAIT] < 6){
			for(i=0;i<9;i++)	EVOdemoLight2Set(i*0x10);
		}
		TaskTable[id].work[EVD1_WAIT]++;
	}else{
		TaskTable[id].TaskAdrs	= EvoPartsDemoPart2WaitTask;
	}
}

static	void	EvoPartsDemoPart2WaitTask(u8 id)
{
	DelTask(id);
}

/*------------------------------------------------------------------*/
/*				パート３（進化終了エフェクトその１）				*/
/*------------------------------------------------------------------*/
u8		EvoPartsDemoPart3Set(void)
{
	u8	taskID;

	taskID = AddTask(EvoPartsDemoPart3InitTask, 0);

	return taskID;
}

static	void	EvoPartsDemoPart3InitTask(u8 id)
{
	EVOdemoLightAffineInit();
	TaskTable[id].work[EVD1_WAIT] = 0;
	TaskTable[id].TaskAdrs	= EvoPartsDemoPart3MainTask;
	SePlay(SE_REAPOKE);
}

static	void	EvoPartsDemoPart3MainTask(u8 id)
{
	u8	i;

	if(TaskTable[id].work[EVD1_WAIT] < 0x30){
		if(TaskTable[id].work[EVD1_WAIT] == 0){
			for(i=0;i<16;i++)	EVOdemoLight3Set(i*0x10,4);
		}
		if(TaskTable[id].work[EVD1_WAIT] == 0x20){
			for(i=0;i<16;i++)	EVOdemoLight3Set(i*0x10,8);
		}
		TaskTable[id].work[EVD1_WAIT]++;
	}else{
		TaskTable[id].TaskAdrs	= EvoPartsDemoPart3WaitTask;
	}
}

static	void	EvoPartsDemoPart3WaitTask(u8 id)
{
	DelTask(id);
}

/*------------------------------------------------------------------*/
/*				パート４（進化終了エフェクトその２）				*/
/*------------------------------------------------------------------*/
//通常
/*------------------------------------------------------------------*/
u8		EvoPartsDemoPart4Set(u16 aftermonsno)
{
	u8	taskID;

	taskID = AddTask(EvoPartsDemoPart4InitTask, 0);
	TaskTable[taskID].work[EVD1_ACTAFTER] = aftermonsno;

	return taskID;
}

static	void	EvoPartsDemoPart4InitTask(u8 id)
{
	EVOdemoLightAffineInit();
	TaskTable[id].work[EVD1_WAIT] = 0;
	CpuCopy(&PaletteWorkTrans[PA_BG2],&PaletteWork[PA_BG2],0x60,16);
	PaletteFadeReq(0xfff9001c,0,0,16,0x7fff);
	TaskTable[id].TaskAdrs	= EvoPartsDemoPart4MainTask;
	SePlay(SE_W080);
}

static	void	EvoPartsDemoPart4MainTask(u8 id)
{
	u8	i;

	if(TaskTable[id].work[EVD1_WAIT] < 0x80){
		switch(TaskTable[id].work[EVD1_WAIT]){
		case 0:
			//最初だけ多く
			for(i=0;i<8;i++)	EVOdemoLight4Set(i);
			break;
		case 0x20:
			//フェードイン開始
			PaletteFadeReq(0xffff001c,16,16,0,0x7fff);
			break;
		default:
			if(TaskTable[id].work[EVD1_WAIT] < 50){
				EVOdemoLight4Set(pp_rand()&0x0007);
			}
			break;
		}
		TaskTable[id].work[EVD1_WAIT]++;
	}else{
		TaskTable[id].TaskAdrs	= EvoPartsDemoPart4WaitTask;
	}
}

static	void	EvoPartsDemoPart4WaitTask(u8 id)
{
	if(FadeData.fade_sw)	return;

	DelTask(id);
}

//通信
/*------------------------------------------------------------------*/
u8		EvoPartsDemoPart4SetSio(u16 aftermonsno)
{
	u8	taskID;

	taskID = AddTask(EvoPartsDemoPart4InitTaskSio, 0);
	TaskTable[taskID].work[EVD1_ACTAFTER] = aftermonsno;

	return taskID;
}

static	void	EvoPartsDemoPart4InitTaskSio(u8 id)
{
	EVOdemoLightAffineInit();
	TaskTable[id].work[EVD1_WAIT] = 0;
	CpuCopy(&PaletteWorkTrans[PA_BG2],&PaletteWork[PA_BG2],0x60,16);
	PaletteFadeReq(0xfff90001,0,0,16,0x7fff);
	TaskTable[id].TaskAdrs	= EvoPartsDemoPart4MainTaskSio;
	SePlay(SE_W080);
}

static	void	EvoPartsDemoPart4MainTaskSio(u8 id)
{
	u8	i;

	if(TaskTable[id].work[EVD1_WAIT] < 0x80){
		switch(TaskTable[id].work[EVD1_WAIT]){
		case 0:
			//最初だけ多く
			for(i=0;i<8;i++)	EVOdemoLight4Set(i);
			break;
		case 0x20:
			//フェードイン開始
			PaletteFadeReq(0xffff0001,16,16,0,0x7fff);
			break;
		default:
			if(TaskTable[id].work[EVD1_WAIT] < 50){
				EVOdemoLight4Set(pp_rand()&0x0007);
			}
			break;
		}
		TaskTable[id].work[EVD1_WAIT]++;
	}else{
		TaskTable[id].TaskAdrs	= EvoPartsDemoPart4WaitTask;
	}
}







/*------------------------------------------------------------------*/
/*				メインエフェクト（進化エフェクト）					*/
static	void	EvoMainDemoInitTask(u8 id);
static	void	EvoMainDemoMainTask(u8 id);
static	void	EvoMainDemoMain1Task(u8 id);
static	void	EvoMainDemoWaitTask(u8 id);
static	void	EvoMainDemoCancelTask(u8 id);

static	void	EvoMainDemoPokeMove(actWork* aw){}
//メインエフェクトタスクワーク定義
#define	EVD_ACT_BEFORE	(1)
#define	EVD_ACT_AFTER	(2)
#define	EVD_AFF_BEFORE	(3)
#define	EVD_AFF_AFTER	(4)
#define	EVD_MODE		(5)
#define	EVD_SP			(6)
#define	EVD_SW			(7)
#define	EVD_CANCEL		(8)
#define	EVD_WAIT		(15)
/*------------------------------------------------------------------*/
u8		EvoMainDemoSet(u8 act1,u8 act2)
{
	u8	taskID;
	u16	i,aff_val;
	u16	pal[16];

	for(i=0;i<16;i++)	pal[i] = 0x7fff;

	taskID = AddTask(EvoMainDemoInitTask, 0);
	TaskTable[taskID].work[EVD_ACT_BEFORE]	= act1;
	TaskTable[taskID].work[EVD_ACT_AFTER]	= act2;
	TaskTable[taskID].work[EVD_AFF_BEFORE]	= 0x100;//初期拡縮率
	TaskTable[taskID].work[EVD_AFF_AFTER]	= 0x10;	//初期拡縮率
	aff_val = 0x10000/TaskTable[taskID].work[EVD_AFF_BEFORE];
	affineWorkSet(30,aff_val,0,0,aff_val);
	aff_val = 0x10000/TaskTable[taskID].work[EVD_AFF_AFTER];
	affineWorkSet(31,aff_val,0,0,aff_val);

	ActWork[act1].move = EvoMainDemoPokeMove;
	ActWork[act1].oamData.AffineMode = 1;	//アフィンマネージャーを起動させない
	ActWork[act1].oamData.AffineParamNo = 30;
	ActWork[act1].banish = 0;
	CpuCopy(pal,&PaletteWorkTrans[PA_OBJ0 + ActWork[act1].oamData.Pltt * 16],0x20,16);

	ActWork[act2].move = EvoMainDemoPokeMove;
	ActWork[act2].oamData.AffineMode = 1;	//アフィンマネージャーを起動させない
	ActWork[act2].oamData.AffineParamNo = 31;
	ActWork[act2].banish = 0;
	CpuCopy(pal,&PaletteWorkTrans[PA_OBJ0 + ActWork[act2].oamData.Pltt * 16],0x20,16);

	TaskTable[taskID].work[EVD_CANCEL] = 0;	//進化キャンセルフラグ

	return taskID;
}

static	void	EvoMainDemoInitTask(u8 id)
{
	TaskTable[id].work[EVD_MODE]	= 0;
	TaskTable[id].work[EVD_SP]		= 0x8;
	TaskTable[id].TaskAdrs	= EvoMainDemoMainTask;
}

static	void	EvoMainDemoMainTask(u8 id)
{
	if(TaskTable[id].work[EVD_CANCEL]){
		EvoMainDemoCancelTask(id);
//		TaskTable[id].TaskAdrs	= EvoMainDemoCancelTask;
		return;
	}
	if(TaskTable[id].work[EVD_SP] == 0x80){
		EvoMainDemoWaitTask(id);
//		TaskTable[id].TaskAdrs	= EvoMainDemoWaitTask;
		return;
	}
	TaskTable[id].work[EVD_SP] += 2;
	TaskTable[id].work[EVD_MODE]^=1;
	TaskTable[id].TaskAdrs	= EvoMainDemoMain1Task;
//	SePlay(SE_W060B);
}

static	void	EvoMainDemoMain1Task(u8 id)
{
	u8	end_flag;
	u16	aff_val;

	if(TaskTable[id].work[EVD_CANCEL]){
		TaskTable[id].TaskAdrs	= EvoMainDemoCancelTask;
		return;
	}
	end_flag = 0;

	if(!TaskTable[id].work[EVD_MODE]){
		if(TaskTable[id].work[EVD_AFF_BEFORE] < (0x100 - TaskTable[id].work[EVD_SP])){
			TaskTable[id].work[EVD_AFF_BEFORE] += TaskTable[id].work[EVD_SP];
		}else{
			TaskTable[id].work[EVD_AFF_BEFORE] = 0x100;
			end_flag++;
		}
		if(TaskTable[id].work[EVD_AFF_AFTER] > (0x10 + TaskTable[id].work[EVD_SP])){
			TaskTable[id].work[EVD_AFF_AFTER] -= TaskTable[id].work[EVD_SP];
		}else{
			TaskTable[id].work[EVD_AFF_AFTER] = 0x10;
			end_flag++;
		}
	}else{
		if(TaskTable[id].work[EVD_AFF_AFTER] < (0x100 - TaskTable[id].work[EVD_SP])){
			TaskTable[id].work[EVD_AFF_AFTER] += TaskTable[id].work[EVD_SP];
		}else{
			TaskTable[id].work[EVD_AFF_AFTER] = 0x100;
			end_flag++;
		}
		if(TaskTable[id].work[EVD_AFF_BEFORE] > (0x10 + TaskTable[id].work[EVD_SP])){
			TaskTable[id].work[EVD_AFF_BEFORE] -= TaskTable[id].work[EVD_SP];
		}else{
			TaskTable[id].work[EVD_AFF_BEFORE] = 0x10;
			end_flag++;
		}
	}
	aff_val = 0x10000/TaskTable[id].work[EVD_AFF_BEFORE];
	affineWorkSet(30,aff_val,0,0,aff_val);
	aff_val = 0x10000/TaskTable[id].work[EVD_AFF_AFTER];
	affineWorkSet(31,aff_val,0,0,aff_val);

	if(end_flag == 2){
		TaskTable[id].TaskAdrs	= EvoMainDemoMainTask;
	}
}

static	void	EvoMainDemoWaitTask(u8 id)
{
	ActWork[TaskTable[id].work[EVD_ACT_BEFORE]].oamData.AffineMode = 0;
	ActWork[TaskTable[id].work[EVD_ACT_BEFORE]].oamData.AffineParamNo = 0;
	ActWork[TaskTable[id].work[EVD_ACT_BEFORE]].banish	= 1;
	ActWork[TaskTable[id].work[EVD_ACT_AFTER]].oamData.AffineMode = 0;
	ActWork[TaskTable[id].work[EVD_ACT_AFTER]].oamData.AffineParamNo = 0;
	ActWork[TaskTable[id].work[EVD_ACT_AFTER]].banish	= 0;

	DelTask(id);
}

static	void	EvoMainDemoCancelTask(u8 id)
{
	ActWork[TaskTable[id].work[EVD_ACT_BEFORE]].oamData.AffineMode = 0;
	ActWork[TaskTable[id].work[EVD_ACT_BEFORE]].oamData.AffineParamNo = 0;
	ActWork[TaskTable[id].work[EVD_ACT_BEFORE]].banish	= 0;
	ActWork[TaskTable[id].work[EVD_ACT_AFTER]].oamData.AffineMode = 0;
	ActWork[TaskTable[id].work[EVD_ACT_AFTER]].oamData.AffineParamNo = 0;
	ActWork[TaskTable[id].work[EVD_ACT_AFTER]].banish	= 1;

	DelTask(id);
}























