
//======================================================
//		fight_ef.c	by soga 2001.11.15
//======================================================

#include "common.h"
#include "server.h"
#include "fight.h"
#include "task.h"
#include "laster.h"
#include "fight_ef.h"
#include "client_t.h"
#include "palanm.h"
#include "bss.h"
#include "calctool.h"
#include "poketool.h"
#include "wazatool.h"

#define BGCNTON 1

void	EncountEffectSet(u8);
void	LasterScrollMake(void);
void	BattleMonsOBJ2BG(u8 posx,u8 posy,u8 clientno,u8 palno);
void	MonsOBJ2BG(u8 posx,u8 posy,u8 clientno,u8 palno,u16 chradrs,u8 scrbase, u8 chrabase);
void	MonsOBJ2BG2(u8 posx,u8 posy,u8 clientno,u8 patno,u8 palno,u16 chradrs,u8 scrbase, u8 chrabase);

void	EE_Kusa(u8);
void	EE_SunaMizuUmi(u8);
void	EE_All(u8);
void	EE_Tuushin(u8);
void	FightEffectDelTask(u8);

const	pTaskFunc	EncountEffectTbl[]={
	EE_Kusa,		//GROUND_KUSA=0,
	EE_Kusa,		//GROUND_LONGKUSA,
	EE_SunaMizuUmi,	//GROUND_SUNA,
	EE_SunaMizuUmi,	//GROUND_MIZU,
	EE_SunaMizuUmi,	//GROUND_UMI,
	EE_Kusa,		//GROUND_IKE,
	EE_Kusa,		//GROUND_IWA,
	EE_Kusa,		//GROUND_DOUKUTSU,
	EE_All,			//GROUND_ROOM,
	EE_All,			//GROUND_ALL,
};

void	EncountEffectSet(u8	EffNo)
{
	u8	no;

	if(FightType&FIGHT_TYPE_TUUSHIN)
		no=AddTask(EE_Tuushin,0);
	else if(FightType&FIGHT_TYPE_HAIKEI_SET){
		if(CasetteVersion==VERSION_RUBY)
			no=AddTask(EncountEffectTbl[EffNo],0);
		else{
			EffNo=GROUND_MIZU;
			no=AddTask(EE_SunaMizuUmi,0);
		}
	}
	else
		no=AddTask(EncountEffectTbl[EffNo],0);
	TaskTable[no].work[EFF_SEQ]=0;
	TaskTable[no].work[EFF_EFFNO]=EffNo;
	TaskTable[no].work[EFF_WORK0]=0;
	TaskTable[no].work[EFF_WORK1]=0;
	TaskTable[no].work[EFF_WORK2]=0;
	TaskTable[no].work[EFF_WORK3]=0;
	TaskTable[no].work[EFF_WORK4]=0;
}

void	FightEffectDelTask(u8 no)
{
	DelTask(no);
	ScrX1=0;
	ScrY1=0;
	ScrX2=0;
	ScrY2=0;
	*(vu16 *)REG_BLDCNT   = 0;	//半透明設定
   	*(vu16 *)REG_BLDALPHA = 0;
  	*(vu16 *)REG_BLDY	  = 0;
  	*(vu16 *)REG_WININ	  = 0x3f3f;
  	*(vu16 *)REG_WINOUT	  = 0x3f3f;
}

//==================================================
//		草地でのエンカウントエフェクト
//==================================================

void	EE_Kusa(u8 no)
{
	int	i;

	ScrX1+=6;
	switch(TaskTable[no].work[EFF_SEQ]){
		case 0:				//OBJのキャラ展開を待つ
			if(FightType&FIGHT_TYPE_TUUSHIN){
#if 0
				for(i=0;i<ClientSetMax;i++){
					if((ClientBit&no2bittbl[i])==0) break;
				}
				if(i==ClientSetMax)
					TaskTable[no].work[EFF_SEQ]++;
#endif
				TaskTable[no].work[EFF_WORK0]=16;
				TaskTable[no].work[EFF_SEQ]++;
			}
			else{
				TaskTable[no].work[EFF_WORK0]=1;
				TaskTable[no].work[EFF_SEQ]++;
			}
			break;
		case 1:				//WindowOpen
			if(--TaskTable[no].work[EFF_WORK0]==0){
				TaskTable[no].work[EFF_SEQ]++;
				*(vu16*)REG_WININ = 0x003f;
			}
			break;
		case 2:				//WindowOpen
			Win0V-=0x100;
			Win0V++;
			if((Win0V&0xff00)==0x3000){
				TaskTable[no].work[EFF_SEQ]++;
				TaskTable[no].work[EFF_WORK0]=ENCOUNT_DX;
				TaskTable[no].work[EFF_WORK1]=0x20;
				//OBJ横移動のストッパー解除
				EncountEffectFlag&=ENCOUNT_EFFECT_FLAG_OBJSTOP_OFF;	
			}
			break;
		case 3:				//オープン途中でちょっとため
			if(TaskTable[no].work[EFF_WORK1])
				TaskTable[no].work[EFF_WORK1]--;
			else{
				if(TaskTable[no].work[EFF_EFFNO]==1){
					if(ScrY1!=0xffb0) ScrY1-=2;
				}
				else{
					if(ScrY1!=0xffc8) ScrY1-=1;
				}
			}
			if(Win0V&0xff00){
				Win0V-=0x400;
				Win0V+=4;
			}
			if(TaskTable[no].work[EFF_WORK0])
				TaskTable[no].work[EFF_WORK0]-=ENCOUNT_SPEED;
			for(i=0;i<80;i++)
				LasterBuffer[LasterSys.BufFlag][i]=TaskTable[no].work[EFF_WORK0];
			for(;i<160;i++)
				LasterBuffer[LasterSys.BufFlag][i]=-TaskTable[no].work[EFF_WORK0];
			if(TaskTable[no].work[EFF_WORK0]==0){
				LasterSys.TransType=LASTER_END;			//ラスタースクロールストップ
				TaskTable[no].work[EFF_SEQ]++;
				CpuClear(0,BG_VRAM+28*0x800,0x800,32);
#if BGCNTON
				*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_0
				| 28 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
				| BG_COLOR_16 | BG_MOS_OFF;
				*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_1 | BG_PRIORITY_0
				| 30 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
				| BG_COLOR_16 | BG_MOS_OFF;
#endif
			}
			break;
		case 4:
			FightEffectDelTask(no);
			break;
	}
}

//==================================================
//		砂、水でのエンカウントエフェクト
//==================================================

void	EE_SunaMizuUmi(u8 no)
{
	int	i;

	switch(TaskTable[no].work[EFF_EFFNO]){
		case 2:
		case 4:
			ScrX1+=8;
			break;
		case 3:
			ScrX1+=6;
			break;
	}

	if(TaskTable[no].work[EFF_EFFNO]==4){
		ScrY1=((8*Cos_360_Get(TaskTable[no].work[EFF_WORK4]))/0x1000)-8;
		if(TaskTable[no].work[EFF_WORK4]<180)
			TaskTable[no].work[EFF_WORK4]+=4;
		else
			TaskTable[no].work[EFF_WORK4]+=6;
		if(TaskTable[no].work[EFF_WORK4]==360)
			TaskTable[no].work[EFF_WORK4]=0;
	}

	switch(TaskTable[no].work[EFF_SEQ]){
		case 0:				//OBJのキャラ展開を待つ
			TaskTable[no].work[EFF_WORK2]=0x0010;
			if(FightType&FIGHT_TYPE_TUUSHIN){
				TaskTable[no].work[EFF_WORK0]=16;
				TaskTable[no].work[EFF_SEQ]++;
			}
			else{
				TaskTable[no].work[EFF_WORK0]=1;
				TaskTable[no].work[EFF_SEQ]++;
			}
			break;
		case 1:				//WindowOpen
			if(--TaskTable[no].work[EFF_WORK0]==0){
				TaskTable[no].work[EFF_SEQ]++;
				*(vu16*)REG_WININ = 0x003f;
			}
			break;
		case 2:				//WindowOpen
			Win0V-=0x100;
			Win0V++;
			if((Win0V&0xff00)==0x3000){
				TaskTable[no].work[EFF_SEQ]++;
				TaskTable[no].work[EFF_WORK0]=ENCOUNT_DX;
				TaskTable[no].work[EFF_WORK1]=0x20;
				TaskTable[no].work[EFF_WORK3]=0x01;
				//OBJ横移動のストッパー解除
				EncountEffectFlag&=ENCOUNT_EFFECT_FLAG_OBJSTOP_OFF;	
			}
			break;
		case 3:				//オープン途中でちょっとため
			if(TaskTable[no].work[EFF_WORK1]){
				TaskTable[no].work[EFF_WORK1]--;
				if(TaskTable[no].work[EFF_WORK1]==0){
					*(vu16 *)REG_BLDCNT   = 0x1842;	//半透明設定
				   	*(vu16 *)REG_BLDALPHA = 0x000f;
				  	*(vu16 *)REG_BLDY	  = 0;
				}
			}
			else{
				if((TaskTable[no].work[EFF_WORK2]&0x1f)&&
				   (--TaskTable[no].work[EFF_WORK3]==0)){
					TaskTable[no].work[EFF_WORK2]+=0x100;
					TaskTable[no].work[EFF_WORK2]--;
					TaskTable[no].work[EFF_WORK3]=0x04;
				}
			}
			if(Win0V&0xff00){
				Win0V-=0x400;
				Win0V+=4;
			}
			if(TaskTable[no].work[EFF_WORK0])
				TaskTable[no].work[EFF_WORK0]-=ENCOUNT_SPEED;
			for(i=0;i<80;i++)
				LasterBuffer[LasterSys.BufFlag][i]=TaskTable[no].work[EFF_WORK0];
			for(;i<160;i++)
				LasterBuffer[LasterSys.BufFlag][i]=-TaskTable[no].work[EFF_WORK0];
			if(TaskTable[no].work[EFF_WORK0]==0){
				LasterSys.TransType=LASTER_END;			//ラスタースクロールストップ
				TaskTable[no].work[EFF_SEQ]++;
				CpuClear(0,BG_VRAM+28*0x800,0x800,32);
#if BGCNTON
				*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_0
				| 28 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
				| BG_COLOR_16 | BG_MOS_OFF;
				*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_1 | BG_PRIORITY_0
				| 30 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
				| BG_COLOR_16 | BG_MOS_OFF;
#endif
			}
			break;
		case 4:
			FightEffectDelTask(no);
			break;
	}
	if(TaskTable[no].work[EFF_SEQ]!=4)
		*(vu16 *)REG_BLDALPHA = (u16)TaskTable[no].work[EFF_WORK2];
}

//==================================================
//		オールマイティでのエンカウントエフェクト
//==================================================

void	EE_All(u8 no)
{
	int	i;

	ScrX1+=8;
	switch(TaskTable[no].work[EFF_SEQ]){
		case 0:				//OBJのキャラ展開を待つ
			*(vu16 *)REG_BLDCNT   = 0x1842;	//半透明設定
		   	*(vu16 *)REG_BLDALPHA = 0x0808;
		  	*(vu16 *)REG_BLDY	  = 0;
			TaskTable[no].work[EFF_WORK2]=0x0808;
			if(FightType&FIGHT_TYPE_TUUSHIN){
				TaskTable[no].work[EFF_WORK0]=16;
				TaskTable[no].work[EFF_SEQ]++;
			}
			else{
				TaskTable[no].work[EFF_WORK0]=1;
				TaskTable[no].work[EFF_SEQ]++;
			}
			break;
		case 1:				//WindowOpen
			if(--TaskTable[no].work[EFF_WORK0]==0){
				TaskTable[no].work[EFF_SEQ]++;
				*(vu16*)REG_WININ = 0x003f;
			}
			break;
		case 2:				//WindowOpen
			Win0V-=0x100;
			Win0V++;
			if((Win0V&0xff00)==0x3000){
				TaskTable[no].work[EFF_SEQ]++;
				TaskTable[no].work[EFF_WORK0]=ENCOUNT_DX;
				TaskTable[no].work[EFF_WORK1]=0x20;
				TaskTable[no].work[EFF_WORK3]=0x01;
				//OBJ横移動のストッパー解除
				EncountEffectFlag&=ENCOUNT_EFFECT_FLAG_OBJSTOP_OFF;	
			}
			break;
		case 3:				//オープン途中でちょっとため
			if(TaskTable[no].work[EFF_WORK1])
				TaskTable[no].work[EFF_WORK1]--;
			else{
				if((TaskTable[no].work[EFF_WORK2]&0x0f)&&
				   (--TaskTable[no].work[EFF_WORK3]==0)){
					TaskTable[no].work[EFF_WORK2]+=0x100;
					TaskTable[no].work[EFF_WORK2]--;
					TaskTable[no].work[EFF_WORK3]=0x06;
				}
			}
			if(Win0V&0xff00){
				Win0V-=0x400;
				Win0V+=4;
			}
			if(TaskTable[no].work[EFF_WORK0])
				TaskTable[no].work[EFF_WORK0]-=ENCOUNT_SPEED;
			for(i=0;i<80;i++)
				LasterBuffer[LasterSys.BufFlag][i]=TaskTable[no].work[EFF_WORK0];
			for(;i<160;i++)
				LasterBuffer[LasterSys.BufFlag][i]=-TaskTable[no].work[EFF_WORK0];
			if(TaskTable[no].work[EFF_WORK0]==0){
				LasterSys.TransType=LASTER_END;			//ラスタースクロールストップ
				TaskTable[no].work[EFF_SEQ]++;
				CpuClear(0,BG_VRAM+28*0x800,0x800,32);
#if BGCNTON
				*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_0
				| 28 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
				| BG_COLOR_16 | BG_MOS_OFF;
				*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_1 | BG_PRIORITY_0
				| 30 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
				| BG_COLOR_16 | BG_MOS_OFF;
#endif
			}
			break;
		case 4:
			FightEffectDelTask(no);
			break;
	}
	if(TaskTable[no].work[EFF_SEQ]!=4)
		*(vu16 *)REG_BLDALPHA = (u16)TaskTable[no].work[EFF_WORK2];
}

//==================================================
//		通信対戦でのエンカウントエフェクト
//==================================================

extern	void	SeqVSMove(actWork *);

void	EE_Tuushin(u8 no)
{
	int	i;

	if((TaskTable[no].work[EFF_SEQ]>1)&&(TaskTable[no].work[EFF_WORK2]==0)){
		if((ScrX1&0x8000)||(ScrX1<80)){
			ScrX1+=3;
			ScrX2-=3;
		}
		else{
			CpuClear(0,BG_VRAM+28*0x800,0x800,32);
			CpuClear(0,BG_VRAM+30*0x800,0x800,32);
			TaskTable[no].work[EFF_WORK2]=1;
		}
	}

	switch(TaskTable[no].work[EFF_SEQ]){
		case 0:				//OBJのキャラ展開を待つ
			TaskTable[no].work[EFF_WORK0]=16;
			TaskTable[no].work[EFF_SEQ]++;
			break;
		case 1:				//WindowOpen
			if(--TaskTable[no].work[EFF_WORK0]==0){
				TaskTable[no].work[EFF_SEQ]++;
				ActWork[UserWork[VS_ACTOR_0]].oamData.ObjMode=2;
				ActWork[UserWork[VS_ACTOR_0]].move=SeqVSMove;
				ActWork[UserWork[VS_ACTOR_1]].oamData.ObjMode=2;
				ActWork[UserWork[VS_ACTOR_1]].move=SeqVSMove;
				*(vu16*)REG_WININ = 0x003f;
				*(vu16*)REG_WINOUT =0x3f06;
			}
			break;
		case 2:				//WindowOpen
			Win0V-=0x100;
			Win0V++;
			if((Win0V&0xff00)==0x3000){
				TaskTable[no].work[EFF_SEQ]++;
				TaskTable[no].work[EFF_WORK0]=ENCOUNT_DX;
				TaskTable[no].work[EFF_WORK1]=0x20;
				//OBJ横移動のストッパー解除
				EncountEffectFlag&=ENCOUNT_EFFECT_FLAG_OBJSTOP_OFF;	
			}
			break;
		case 3:				//オープン途中でちょっとため
			if(Win0V&0xff00){
				Win0V-=0x400;
				Win0V+=4;
			}
			if(TaskTable[no].work[EFF_WORK0])
				TaskTable[no].work[EFF_WORK0]-=ENCOUNT_SPEED;
			for(i=0;i<80;i++)
				LasterBuffer[LasterSys.BufFlag][i]=TaskTable[no].work[EFF_WORK0];
			for(;i<160;i++)
				LasterBuffer[LasterSys.BufFlag][i]=-TaskTable[no].work[EFF_WORK0];
			if(TaskTable[no].work[EFF_WORK0]==0){
				LasterSys.TransType=LASTER_END;			//ラスタースクロールストップ
				TaskTable[no].work[EFF_SEQ]++;
#if BGCNTON
				*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_0
				| 28 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
				| BG_COLOR_16 | BG_MOS_OFF;
				*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_1 | BG_PRIORITY_0
				| 30 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
				| BG_COLOR_16 | BG_MOS_OFF;
#endif
			}
			break;
		case 4:
			FightEffectDelTask(no);
			break;
	}
}

//==================================================
//		OBJをBGに落とす処理
//==================================================


void	BattleMonsOBJ2BG(u8 posx,u8 posy,u8 clientno,u8 palno)
{
	MonsOBJ2BG(posx,posy,clientno,palno,BATTLE_CHR_BASE*0x4000,
		BATTLE_SCR_BASE, BATTLE_CHR_BASE);
}

void	MonsOBJ2BG(u8 posx,u8 posy,u8 clienttype,u8 palno,u16 chradrs,u8 scrbase, u8 chrabase)
{
	int	x,y;
	int	no;
	u8	clientno;

	clientno=ClientNoGet(clienttype);

	DmaCopy(3,DecordAdrs[clienttype]+0x800*BattlePokeAnmNo[clientno],BG_VRAM+chradrs,0x800,16);

	no=chradrs/0x20 - chrabase*0x4000/0x20;
	
	for(y=posy;y<posy+8;y++){
		for(x=posx;x<(posx+8);x++){
			*(vu16 *)(BG_VRAM+scrbase*0x800+x*2+y*0x40)=no|(palno<<12);
			no++;
		}
	}
}

//進化デモ専用
void	MonsOBJ2BG2(u8 posx,u8 posy,u8 clientno,u8 patno,u8 palno,u16 chradrs,u8 scrbase, u8 chrabase)
{
	int	x,y;
	int	no;

	DmaCopy(3,DecordAdrs[clientno]+0x800*patno,BG_VRAM+chradrs,0x800,16);

	no=chradrs/0x20 - chrabase*0x4000/0x20;
	
	for(y=posy;y<posy+8;y++){
		for(x=posx;x<(posx+8);x++){
			*(vu16 *)(BG_VRAM+scrbase*0x800+x*2+y*0x40)=no|(palno<<12);
			no++;
		}
	}
}
