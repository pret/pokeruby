
//======================================================
//    bss.c                                           
//                                                      
//    Copyright (C) 2000 GAME FREAK inc.
//======================================================

#include "common.h"
#include "server.h"
#include "client.h"
#include "clientai.h"
#include "clientcl.h"
#include "clientclm.h"
#include "c_safari.h"
#include "c_demo.h"
#include "param.h"
#include "waza_eff.h"
#include "fight.h"
#include "gauge.h"
#include "client_t.h"
#include "multisio.h"		//add
#include "pokesio.h"
#include "cable.h"
#include "task.h"
#include "poketool.h"
#include "calctool.h"
#include "palanm.h"
#include "wazano.def"
#include "monsno.def"
#include "fightmsg.h"
#include "b_pmlist.h"
#include "waza_ai.h"
#include "tokusyu.def"

#define	__BSS_H_
#include "bss.h"

#define CLIENT_NO_DEBUG	0
#define	WAIT_TUUSHIN	1

#define RECV_CHG		0

#define CLIENT_BIT_YUUSEN 0

//------------------------- データ -----------------------------

//---------------------- グローバル変数 --------------------------

vu32		DebugWork;
vu32		DebugWork2;

u8		TuushinReqTaskNo=0;
u8		TuushinRecvTaskNo=0;
u8		RecvTuushinFlag=0;

WazaEffectWork	WEW={0};

u8	BSSComTbl[256];

//-------------------- サブルーチン宣言 ------------------------

void	BSSInit(void);
void	BSSBoot(void);
void	BSSNormalBoot(void);
void	BSSCloneBoot(void);
void	BSSIOInterface(u8,u8 *,u16);
void	SelMonsNoGet(void);
void	BSSTuushinStart(void);

void	BSS_POKEPARA_GET_SET(u8,u8,u8);
void	BSS_POKEPARA_GET2_SET(u8,u8,u8);
void	BSS_POKEPARA_PUT_SET(u8,u8,u8,u8,u8 *);
void	BSS_POKEPARA_PUT2_SET(u8,u8,u8,u8 *);
void	BSS_POKE_ENCOUNT_SET(u8);
void	BSS_POKE_APPEAR_SET(u8,u8,u8);
void	BSS_POKE_RETURN_SET(u8,u8);
void	BSS_TRAINER_ENCOUNT_SET(u8);
void	BSS_TRAINER_APPEAR_SET(u8);
void	BSS_TRAINER_RETURN_SET(u8);
void	BSS_POKE_KIZETSU_SET(u8);
void	BSS_POKE_ZENMETU_SET(u8);
void	BSS_GET_SUCCESS_SET(u8);
void	BSS_GET_FAIL_SET(u8,u8);
void	BSS_POKE_LEVELUP_SET(u8,u8,u8 *);
void	BSS_WAZA_EFFECT_SET(u8,u16,u8,u16,s32,u8,u8 *);
//void	BSS_MESSAGE_SET(u8,u8,u8 *);
void	BSS_MESSAGE_SET(u8,u16);
void	BSS_ALERT_MESSAGE_SET(u8,u16);
void	BSS_COMMAND_SELECT_SET(u8,u8,u16);
void	BSS_COMMAND_SELECT_COPY_SET(u8,u8);
void	BSS_WAZA_SELECT_SET(u8,u8,u8,u8 *);
void	BSS_ITEM_SELECT_SET(u8,u8 *);
void	BSS_POKE_SELECT_SET(u8,u8,u8,u8,u8 *);
void	BSS_ESCAPE_SET(u8);
void	BSS_HP_GAUGE_SET(u8,s16);
void	BSS_EXP_GAUGE_SET(u8,u8,s16);
void	BSS_STATUS_SET_SET(u8,u32,u32);
void	BSS_STATUS_EFFECT_SET(u8,u8,u32);
void	BSS_STATUS_CLEAR_SET(u8,u8);
void	BSS_DATA_TRANS_SET(u8,u16,u8 *);
void	BSS_DATA_RAM_TRANS_SET(u8,u32,u16,u8 *);
void	BSS_BGM_TRANS_SET(u8,u16,u8 *);
void	BSS_VOICE_TRANS_SET(u8,u16,u8 *);
void	BSS_SELECT_RETURN_SET(u8,u8,u16);
void	BSS_POKE_RESHUFFLE_SET(u8,u8,u8 *);
void	BSS_USE_ITEM_SET(u8,u16);
void	BSS_USE_BALL_SET(u8,u16);
void	BSS_LOOPCOUNT_CLEAR_SET(u8);
void	BSS_LOOPCOUNT_SET_SET(u8,u8);
void	BSS_SWITCHFLAG_CLEAR_SET(u8);
void	BSS_SWITCHFLAG_SET_SET(u8);
void	BSS_POKEDAMAGE_BLINK_SET(u8);
void	BSS_GAUGE_OFF_SET(u8);
void	BSS_SE_PLAY_SET(u8,u16);
void	BSS_ME_PLAY_SET(u8,u16);
void	BSS_VOICE_PLAY_SET(u8);
void	BSS_ENCOUNT_EFFECT_SET(u8,u8);
void	BSS_POKE_SENDOUT_SET(u8);
void	BSS_BALL_GAUGE_SET_SET(u8,u8 *,u8);
void	BSS_BALL_GAUGE_OFF_SET(u8);
void	BSS_GAUGE_YURE_STOP_SET(u8);
void	BSS_VANISH_ON_OFF_SET(u8,u8);
void	BSS_FIGHT_EFFECT_SET(u8,u8,u16);
void	BSS_TUUSHIN_WAIT_SET(u8,u8);
void	BSS_CSRPOS_CLEAR_SET(u8,u8);
void	BSS_FIGHT_END_SET(u8,u8);

void	TuushinAddTask(void);

void	TuushinReqSet(u8,u16,u8 *);
void	TuushinReqTask(u8);
void	TuushinRecvSet(void);
void	TuushinRecvTask(u8);

extern	const	WazaTblDat	WTD[];

extern	void	JidouNinshouWatchDog(u8);
extern	void	kanshi_network(u8);
extern SIOTRAINER_INFO SioTrainerInfo[4];

//----------------------------------------------------------
//	プロトタイプ宣言	関数＆ﾃﾞｰﾀ
//----------------------------------------------------------

//==============================================================
//                       メインルーチン
//==============================================================

void	BSSTuushinStart(void)
{
	if(FightType&FIGHT_TYPE_TUUSHIN){
		PokemonMultiSioInit();
		AddTask(JidouNinshouWatchDog,0);
		TuushinAddTask();
#ifdef PM_DEBUG
#if TUUSHIN_DEBUG
		AddTask(kanshi_network,0);
#endif
#endif
	}
}

void	BSSInit(void)
{
		int	i;

		ServerSequence=ServerDummy;
		for(i=0;i<CLIENT_MAX;i++){
			ClientSequence[i]=ClientDummy;
			ClientType[i]=0xff;
			CommandCsrPos[i]=0;
			WazaCsrPos[i]=0;
		}

		BSSTuushinStart();

		ClientBit=0;

		WazaEffectWorkInit();
		PokeAnmNoInit();
		WazaAIInit();			//トレーナーAIワーク初期化

		//ガイドバトルモンスターセット（暫定）
		if(FightType&FIGHT_TYPE_GUIDE){
			PokeParaEnemyInit();
			PokeParaSet(&PokeParaEnemy[0],MONSNO_POTIENA,2,POW_RND,RND_NO_SET,0,ID_NO_SET,0);
			i=0;
			PokeParaPut(&PokeParaEnemy[0],ID_item,(u8 *)&i);
		}

		TuushinWaitWork=0;
		PokeSelFlag=0;		//ポケモン入れ替えフラグ
#ifdef PM_DEBUG
	if(DebugFightFlag&DEBUG_FIGHT_AUTO){
		UserWork[DEBUG_KEY_CONTROL0]=0;
		UserWork[DEBUG_KEY_CONTROL1]=0;
		UserWork[DEBUG_KEY_CONTROL2]=0;
		DebugWork++;
	}
#endif
}

void	BSSBoot(void)
{
	int	i;

//通信時はサーバのﾊﾞｰｼﾞｮﾝを見て起動するかしないかを判断
	if(FightType&FIGHT_TYPE_TUUSHIN){
		BSSCloneBoot();
	}
	else{
		BSSNormalBoot();
	}
	SelMonsNoGet();

	if((FightType&FIGHT_TYPE_4_2vs2)==0){
		for(i=0;i<ClientSetMax;i++)
			ServerListRowInit(i,0);
	}

	// ↓処理軽減の為 ClientDivInit関数内でやるようにした
//	BattleGaugeCellPalSet();//ｹﾞｰｼﾞｷｬﾗ、ﾊﾟﾚｯﾄｾｯﾄ
//	GaugeArrowActorSet();	//ゲージ矢印の初期化
}

void	BSSNormalBoot(void)
{
	if((FightType & FIGHT_TYPE_2vs2)==FIGHT_TYPE_1vs1){
		ServerSequence=ServerInit;
		if(FightType&FIGHT_TYPE_SAFARI)
			ClientSequence[0]=ClientSInit;
		else if(FightType&FIGHT_TYPE_GET_DEMO)
			ClientSequence[0]=ClientDInit;
		else
			ClientSequence[0]=ClientInit;
		ClientType[0]=SIDE_MINE;
		ClientSequence[1]=ClientAIInit;
		ClientType[1]=SIDE_ENEMY;
		ClientSetMax=2;
	}
	else{
		ServerSequence=ServerInit;
		ClientSequence[0]=ClientInit;
		ClientType[0]=BSS_CLIENT_MINE;
		ClientSequence[1]=ClientAIInit;
		ClientType[1]=BSS_CLIENT_ENEMY;
		ClientSequence[2]=ClientInit;
		ClientType[2]=BSS_CLIENT_MINE2;
		ClientSequence[3]=ClientAIInit;
		ClientType[3]=BSS_CLIENT_ENEMY2;
		ClientSetMax=4;
	}
}

void	BSSCloneBoot(void)
{
	int	i;
	u8	id;

	if((FightType & FIGHT_TYPE_2vs2)==FIGHT_TYPE_1vs1){
		if(FightType&FIGHT_TYPE_OYA){
			ServerSequence=ServerInit;
			ClientSequence[0]=ClientInit;
			ClientType[0]=SIDE_MINE;
			ClientSequence[1]=ClientCLInit;
			ClientType[1]=SIDE_ENEMY;
			ClientSetMax=2;
		}
		else{
			ClientSequence[1]=ClientInit;
			ClientType[1]=SIDE_MINE;
			ClientSequence[0]=ClientCLInit;
			ClientType[0]=SIDE_ENEMY;
			ClientSetMax=2;
		}
	}
	else if((FightType & (FIGHT_TYPE_2vs2|FIGHT_TYPE_4_2vs2))==FIGHT_TYPE_2vs2){
		if(FightType&FIGHT_TYPE_OYA){
			ServerSequence=ServerInit;
			ClientSequence[0]=ClientInit;
			ClientType[0]=BSS_CLIENT_MINE;
			ClientSequence[1]=ClientCLInit;
			ClientType[1]=BSS_CLIENT_ENEMY;
			ClientSequence[2]=ClientInit;
			ClientType[2]=BSS_CLIENT_MINE2;
			ClientSequence[3]=ClientCLInit;
			ClientType[3]=BSS_CLIENT_ENEMY2;
			ClientSetMax=4;
		}
		else{
			ClientSequence[1]=ClientInit;
			ClientType[1]=BSS_CLIENT_MINE;
			ClientSequence[0]=ClientCLInit;
			ClientType[0]=BSS_CLIENT_ENEMY;
			ClientSequence[3]=ClientInit;
			ClientType[3]=BSS_CLIENT_MINE2;
			ClientSequence[2]=ClientCLInit;
			ClientType[2]=BSS_CLIENT_ENEMY2;
			ClientSetMax=4;
		}
	}
	else{
//暫定
#if 0
		for(i=0;i<3;i++){
			if(PokeParaGet(&PokeParaMine[i],ID_monsno)==0)
				break;
		}
		if(i!=3){
			memcpy(&PokeParaMine[i],&PokeParaMine[3],300);
			PokeParaPut(&PokeParaMine[i+3],ID_monsno,0);
		}
		for(j=0;j<3;j++){
			if(PokeParaGet(&PokeParaEnemy[j],ID_monsno)==0)
				break;
		}
		if(j!=3){
			memcpy(&PokeParaEnemy[j],&PokeParaEnemy[3],300);
			PokeParaPut(&PokeParaEnemy[j+3],ID_monsno,0);
		}
		PokeCountMineGet();
		PokeCountEnemyGet();
		SelMonsNo[0]=0;
		SelMonsNo[1]=0;
		SelMonsNo[2]=i;
		SelMonsNo[3]=j;
		id=GetSioConnectId();
		switch(id){
			case 0:
				ServerSequence=ServerInit;
				ClientSequence[0]=ClientInit;
				ClientType[0]=BSS_CLIENT_MINE;
				ClientSequence[1]=ClientCLInit;
				ClientType[1]=BSS_CLIENT_ENEMY;
				ClientSequence[2]=ClientCLMInit;
				ClientType[2]=BSS_CLIENT_MINE2;
				ClientSequence[3]=ClientCLInit;
				ClientType[3]=BSS_CLIENT_ENEMY2;
				break;
			case 1:
				ClientSequence[0]=ClientCLMInit;
				ClientType[0]=BSS_CLIENT_MINE;
				ClientSequence[1]=ClientCLInit;
				ClientType[1]=BSS_CLIENT_ENEMY;
				ClientSequence[2]=ClientInit;
				ClientType[2]=BSS_CLIENT_MINE2;
				ClientSequence[3]=ClientCLInit;
				ClientType[3]=BSS_CLIENT_ENEMY2;
				break;
			case 2:
				ClientSequence[0]=ClientCLInit;
				ClientType[0]=BSS_CLIENT_ENEMY;
				ClientSequence[1]=ClientInit;
				ClientType[1]=BSS_CLIENT_MINE;
				ClientSequence[2]=ClientCLInit;
				ClientType[2]=BSS_CLIENT_ENEMY2;
				ClientSequence[3]=ClientCLMInit;
				ClientType[3]=BSS_CLIENT_MINE2;
				break;
			case 3:
				ClientSequence[0]=ClientCLInit;
				ClientType[0]=BSS_CLIENT_ENEMY;
				ClientSequence[1]=ClientCLMInit;
				ClientType[1]=BSS_CLIENT_MINE;
				ClientSequence[2]=ClientCLInit;
				ClientType[2]=BSS_CLIENT_ENEMY2;
				ClientSequence[3]=ClientInit;
				ClientType[3]=BSS_CLIENT_MINE2;
				break;
		}
#else
		id=GetSioConnectId();
		if(FightType&FIGHT_TYPE_OYA)
			ServerSequence=ServerInit;
		for(i=0;i<4;i++){
			switch(SioTrainerInfo[i].StandPos){
				case 0:
				case 3:
					ServerListRowInit(SioTrainerInfo[i].StandPos,0);
					break;
				case 1:
				case 2:
					ServerListRowInit(SioTrainerInfo[i].StandPos,1);
					break;
			}
			if(i==id){
				ClientSequence[SioTrainerInfo[i].StandPos]=ClientInit;
				switch(SioTrainerInfo[i].StandPos){
					case 0:
					case 3:
						ClientType[SioTrainerInfo[i].StandPos]=BSS_CLIENT_MINE;
						SelMonsNo[SioTrainerInfo[i].StandPos]=0;
						break;
					case 1:
					case 2:
						ClientType[SioTrainerInfo[i].StandPos]=BSS_CLIENT_MINE2;
						SelMonsNo[SioTrainerInfo[i].StandPos]=3;
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
					ClientSequence[SioTrainerInfo[i].StandPos]=ClientCLMInit;
					switch(SioTrainerInfo[i].StandPos){
						case 0:
						case 3:
							ClientType[SioTrainerInfo[i].StandPos]=BSS_CLIENT_MINE;
							SelMonsNo[SioTrainerInfo[i].StandPos]=0;
							break;
						case 1:
						case 2:
							ClientType[SioTrainerInfo[i].StandPos]=BSS_CLIENT_MINE2;
							SelMonsNo[SioTrainerInfo[i].StandPos]=3;
							break;
					}
				}
				else{
					ClientSequence[SioTrainerInfo[i].StandPos]=ClientCLInit;
					switch(SioTrainerInfo[i].StandPos){
						case 0:
						case 3:
							ClientType[SioTrainerInfo[i].StandPos]=BSS_CLIENT_ENEMY;
							SelMonsNo[SioTrainerInfo[i].StandPos]=0;
							break;
						case 1:
						case 2:
							ClientType[SioTrainerInfo[i].StandPos]=BSS_CLIENT_ENEMY2;
							SelMonsNo[SioTrainerInfo[i].StandPos]=3;
							break;
					}
				}
			}
		}
#endif
		ClientSetMax=4;
	}
}

void	SelMonsNoGet(void)
{
	int	i,j;

	if(FightType&FIGHT_TYPE_4_2vs2) return;

	for(i=0;i<ClientSetMax;i++){
		for(j=0;j<6;j++){
			if(i<2){
				if((ClientType[i]&1)==0){			//自分側
					if((PokeParaGet(&PokeParaMine[j],ID_hp)!=0)&&
					   (PokeParaGet(&PokeParaMine[j],ID_monsno_egg)!=0)&&
					   (PokeParaGet(&PokeParaMine[j],ID_monsno_egg)!=MONSNO_TAMAGO)&&
					   (PokeParaGet(&PokeParaMine[j],ID_tamago_flag)==0)){
						SelMonsNo[i]=j;
						break;
					}
				}
				else{								//敵側
					if((PokeParaGet(&PokeParaEnemy[j],ID_hp)!=0)&&
					   (PokeParaGet(&PokeParaEnemy[j],ID_monsno_egg)!=0)&&
					   (PokeParaGet(&PokeParaEnemy[j],ID_monsno_egg)!=MONSNO_TAMAGO)&&
					   (PokeParaGet(&PokeParaEnemy[j],ID_tamago_flag)==0)){
						SelMonsNo[i]=j;
						break;
					}
				}
			}
			else{
				if((ClientType[i]&1)==0){	//自分側
					if((PokeParaGet(&PokeParaMine[j],ID_hp)!=0)&&
					   (PokeParaGet(&PokeParaMine[j],ID_monsno)!=0)&&
					   (PokeParaGet(&PokeParaMine[j],ID_monsno_egg)!=MONSNO_TAMAGO)&&
					   (PokeParaGet(&PokeParaMine[j],ID_tamago_flag)==0)&&
					   (SelMonsNo[i-2]!=j)){
						SelMonsNo[i]=j;
						break;
					}
				}
				else{								//敵側
					if((PokeParaGet(&PokeParaEnemy[j],ID_hp)!=0)&&
					   (PokeParaGet(&PokeParaEnemy[j],ID_monsno_egg)!=0)&&
					   (PokeParaGet(&PokeParaEnemy[j],ID_monsno_egg)!=MONSNO_TAMAGO)&&
					   (PokeParaGet(&PokeParaEnemy[j],ID_tamago_flag)==0)&&
					   (SelMonsNo[i-2]!=j)){
						SelMonsNo[i]=j;
						break;
					}
				}
			}
		}
	}
}

#if 1
void	BSSIOInterface(u8 access,u8 *Buf,u16 byte)
{
		int	i;

	if(FightType&FIGHT_TYPE_TUUSHIN){
//		if(((access==BSS_CLIENT)&&(FightType&FIGHT_TYPE_OYA))==0){
			TuushinReqSet(access,byte,Buf);
			return;
//		}
	}
	switch(access){
		case BSS_SERVER:
			for(i=0;i<byte;i++){
				ServerBuffer[ClientNo][i]=*Buf;
				Buf++;
			}
			break;
		case BSS_CLIENT:
			for(i=0;i<byte;i++){
				ClientBuffer[ClientNo][i]=*Buf;
				Buf++;
			}
			break;
	}
}
#else
void	BSSIOInterface(u8 access,u8 *Buf,u16 byte)
{
		int	i;

	switch(access){
		case BSS_SERVER:
			for(i=0;i<byte;i++){
				ServerBuffer[ClientNo][i]=*Buf;
				Buf++;
			}
			break;
		case BSS_CLIENT:
			for(i=0;i<byte;i++){
				ClientBuffer[ClientNo][i]=*Buf;
				Buf++;
			}
			break;
	}
	if(FightType&FIGHT_TYPE_TUUSHIN){
		if(((access==BSS_CLIENT)&&(FightType&FIGHT_TYPE_OYA))==0)
			TuushinReqSet(access,byte,Buf);
	}
}
#endif

void	TuushinAddTask(void)
{
	TuushinReqTaskNo=AddTask(TuushinReqTask,0);
	TaskTable[TuushinReqTaskNo].work[REQ_SEQ_NO]=0;
	TaskTable[TuushinReqTaskNo].work[REQ_BUF_OVER]=0;
	TaskTable[TuushinReqTaskNo].work[REQ_BUF_WAIT]=0;
	TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]=0;
	TaskTable[TuushinReqTaskNo].work[REQ_BUF_GET]=0;
	TuushinRecvTaskNo=AddTask(TuushinRecvTask,0);
	TaskTable[TuushinRecvTaskNo].work[RECV_BUF_OVER]=0;
	TaskTable[TuushinRecvTaskNo].work[RECV_BUF_WAIT]=0;
	TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]=0;
	TaskTable[TuushinRecvTaskNo].work[RECV_BUF_GET]=0;
	RecvTuushinFlag=0;
	CpuClear(0,&UserWork[TUUSHIN_TASK_BUF_START],0x2000,16);
}

#define	HEAD_SIZE	8

void	TuushinReqSet(u8 access,u16 byte,u8 *Buf)
{
	int	i;
	int	size;

	size=byte+(4-(byte%4));

	if(TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]+HEAD_SIZE+size+1>TUUSHIN_TASK_BUF_SIZE){
		TaskTable[TuushinReqTaskNo].work[REQ_BUF_OVER]=
			TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET];
		TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]=0;
	}
	UserWork[TUUSHIN_TASK_BUF_START+TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]+0]=access;
	UserWork[TUUSHIN_TASK_BUF_START+TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]+1]=ClientNo;
	UserWork[TUUSHIN_TASK_BUF_START+TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]+2]=AttackClient;
	UserWork[TUUSHIN_TASK_BUF_START+TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]+3]=DefenceClient;
	UserWork[TUUSHIN_TASK_BUF_START+TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]+4]=size&0xff;
	UserWork[TUUSHIN_TASK_BUF_START+TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]+5]=(size&0xff00)>>8;
	UserWork[TUUSHIN_TASK_BUF_START+TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]+6]=NoReshuffleClient;
	UserWork[TUUSHIN_TASK_BUF_START+TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]+7]=TsuikaClient;

	for(i=0;i<byte;i++)
		UserWork[TUUSHIN_TASK_BUF_START+TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]+HEAD_SIZE+i]=Buf[i];
	TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]=
	TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]+size+HEAD_SIZE;
//	UserWork[TUUSHIN_TASK_BUF_START+TaskTable[TuushinReqTaskNo].work[REQ_BUF_SET]+0]=0x00;
}

enum{
	TRT_1000SYNCWAIT_INIT=0,
	TRT_1000SYNCWAIT,
	TRT_MULTISIO_WAIT,
	TRT_SEND_WAIT,
	TRT_SEND_ACT,
	TRT_SEND_AFTER,
};

#if 1
void	TuushinReqTask(u8 no)
{
//	u8	clientno;
	u16	byte;
//	int	i;

	switch(TaskTable[no].work[REQ_SEQ_NO]){
		case TRT_1000SYNCWAIT_INIT:
			TaskTable[no].work[REQ_WORK0]=100;
			TaskTable[no].work[REQ_SEQ_NO]++;
			break;
		case TRT_1000SYNCWAIT:
			if(--TaskTable[no].work[REQ_WORK0]==0){
				TaskTable[no].work[REQ_SEQ_NO]++;
			}
			break;
		case TRT_MULTISIO_WAIT:
			if(GetSioRealConnectNumber()>=(FightType&FIGHT_TYPE_4_2vs2)?4:2){			//接続人数を先に確認
//			if(GetSioRealConnectNumber()==4){			//接続人数を先に確認
				if(GetMyConnectIsParent()){			//親子関係を確認
					MultiSioSignalDecision();
					TaskTable[no].work[REQ_SEQ_NO]++;
				}else{
					TaskTable[no].work[REQ_SEQ_NO]++;
				}
			}
#if 0
			if(GetMyConnectIsParent()==1){
				if(GetSioRealConnectNumber()==2){
					MultiSioSignalDecision();
					TaskTable[no].work[REQ_SEQ_NO]++;
				}
			}
			else
				TaskTable[no].work[REQ_SEQ_NO]++;
#endif
			break;

		case TRT_SEND_WAIT:
			if(TaskTable[no].work[REQ_BUF_GET]!=
			   TaskTable[no].work[REQ_BUF_SET]){
				if(TaskTable[no].work[REQ_BUF_WAIT]==0){
					if(TaskTable[no].work[REQ_BUF_GET]>
					   TaskTable[no].work[REQ_BUF_SET]){
						if(TaskTable[no].work[REQ_BUF_GET]==
							TaskTable[no].work[REQ_BUF_OVER]){
							TaskTable[no].work[REQ_BUF_OVER]=0;
							TaskTable[no].work[REQ_BUF_GET]=0;
						}
					}
					byte=
					UserWork[TUUSHIN_TASK_BUF_START+
							 TaskTable[no].work[REQ_BUF_GET]+4]|
				   (UserWork[TUUSHIN_TASK_BUF_START+
						 	 TaskTable[no].work[REQ_BUF_GET]+5]<<8);
					byte+=HEAD_SIZE;
#if 1
					SplitDataSendStart(GetAnotherSendTo(),
								(u8 *)&UserWork[TUUSHIN_TASK_BUF_START+
								TaskTable[no].work[REQ_BUF_GET]],
//								byte+HEAD_SIZE);
								byte);
#else
					for(i=0;i<byte;i++)
						UserWork[0x1d000+i]=UserWork[TUUSHIN_TASK_BUF_START+
						   TaskTable[no].work[REQ_BUF_GET]+i];
					SplitDataSendStart(GetAnotherSendTo(),
								(u8 *)&UserWork[0x1d000],
								byte);
#endif
					TaskTable[no].work[REQ_SEQ_NO]++;
//					TuushinWaitWork=10;
				}
				else
					TaskTable[no].work[REQ_BUF_WAIT]--;
			}
			break;
		case TRT_SEND_ACT:
//			if((SplitDataSendStatus())&&(TuushinWaitWork==0)){
			if(SplitDataSendStatus()){
				byte=UserWork[TUUSHIN_TASK_BUF_START+
					 TaskTable[no].work[REQ_BUF_GET]+4]|
			   (UserWork[TUUSHIN_TASK_BUF_START+
						 TaskTable[no].work[REQ_BUF_GET]+5]<<8);

#if 0
				clientno=UserWork[TUUSHIN_TASK_BUF_START+
						 TaskTable[no].work[REQ_BUF_GET]+1];

				switch(UserWork[TUUSHIN_TASK_BUF_START+
							TaskTable[no].work[REQ_BUF_GET]+0]){
					case BSS_SERVER:
//						memcpy(ServerBuffer[clientno],
//							   &UserWork[TUUSHIN_TASK_BUF_START+
//							   TaskTable[no].work[REQ_BUF_GET]+HEAD_SIZE],
//							   byte);
//						ClientBit&=((no2bittbl[clientno]<<4)^0xffffffff);
//						ClientBitSet2(clientno);
						break;
					case BSS_CLIENT:
//						memcpy(ClientBuffer[clientno],
//							   &UserWork[TUUSHIN_TASK_BUF_START+
//							   TaskTable[no].work[REQ_BUF_GET]+HEAD_SIZE],
//							   byte);
						break;
				}
#endif

				TaskTable[no].work[REQ_BUF_WAIT]=WAIT_TUUSHIN;
				TaskTable[no].work[REQ_BUF_GET]=
				TaskTable[no].work[REQ_BUF_GET]+byte+HEAD_SIZE;
				TaskTable[no].work[REQ_SEQ_NO]=TRT_SEND_WAIT;
			}
			break;
		case TRT_SEND_AFTER:
			if(--TaskTable[no].work[REQ_BUF_WAIT]==0){
				TaskTable[no].work[REQ_BUF_WAIT]=WAIT_TUUSHIN;
				TaskTable[no].work[REQ_SEQ_NO]=TRT_SEND_WAIT;
			}
			break;
	}
}
#else
void	TuushinReqTask(u8 no)
{
	u16	byte;

	if(TaskTable[no].work[REQ_BUF_GET]!=
	   TaskTable[no].work[REQ_BUF_SET]){
		if(TaskTable[no].work[REQ_BUF_WAIT]==0){
			byte=
			UserWork[TUUSHIN_TASK_BUF_START+
					 TaskTable[no].work[REQ_BUF_GET]+4]|
		   (UserWork[TUUSHIN_TASK_BUF_START+
				 	 TaskTable[no].work[REQ_BUF_GET]+5]<<8);
			SplitDataSendStart(GetAnotherSendTo(),
						(u8 *)&UserWork[TUUSHIN_TASK_BUF_START+
						TaskTable[no].work[REQ_BUF_GET]],
						byte+HEAD_SIZE);
			TaskTable[no].work[REQ_BUF_WAIT]=WAIT_TUUSHIN;
			TaskTable[no].work[REQ_BUF_GET]=
			TaskTable[no].work[REQ_BUF_GET]+byte+HEAD_SIZE;
			if(TaskTable[no].work[REQ_BUF_GET]>
			   TaskTable[no].work[REQ_BUF_SET]){
				if(UserWork[TUUSHIN_TASK_BUF_START+
				   TaskTable[no].work[REQ_BUF_GET]]==0xff)
					TaskTable[no].work[REQ_BUF_GET]=0;
			}
		}
		else
			TaskTable[no].work[REQ_BUF_WAIT]--;
	}
}
#endif

#if 0
#define	RECV_HEAD_SIZE	8

void	TuushinRecvSet(void)
{
	u8	id;
	u8	id2;
	u16	byte;
	int	i;
	u8	*adr1,*adr2;

	if((FightType&FIGHT_TYPE_TUUSHIN)==0) return;

	id=GetSioConnectId();
	id2=id^1;

	if((SplitDataResult()&no2bittbl[id2])==0) return;
	SplitDataResultReset();					//通信終了フラグをクリア

	byte=RecvPoolBuf[id2][2];
	if(TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]+RECV_HEAD_SIZE+1+byte>TUUSHIN_TASK_BUF_SIZE){
		UserWork[RECV_TASK_BUF_START+TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]+0]=0xff;
		TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]=0;
	}
//	memcpy(&UserWork[RECV_TASK_BUF_START+TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]+0],
//		   &RecvPoolBuf[id2][0],byte+RECV_HEAD_SIZE);
	adr1=(u8 *)&UserWork[RECV_TASK_BUF_START+TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]+0];
	adr2=(u8 *)&RecvPoolBuf[id2][0];
	for(i=0;i<byte+RECV_HEAD_SIZE;i++)
		adr1[i]=adr2[i];

	TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]=
	TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]+byte+RECV_HEAD_SIZE;
	UserWork[RECV_TASK_BUF_START+TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]+0]=0x00;
}

void	TuushinRecvTask(u8 no)
{
	u8	clientno;
	u16	byte;

#if 0
	if(TaskTable[no].work[RECV_BUF_WAIT]){
		TaskTable[no].work[RECV_BUF_WAIT]--;
	}
	else{
#endif
	if(TaskTable[no].work[RECV_BUF_GET]!=TaskTable[no].work[RECV_BUF_SET]){
		clientno=UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+1];
//		if((ClientBit&no2bittbl[clientno])&&
//		(UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+0]!=BSS_CLIENT))
//			return;
		byte=
		UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+4]|
		(UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+5]<<8);

		switch(UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+0]){
			case BSS_SERVER:
				memcpy(ServerBuffer[clientno],
					   &UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+RECV_HEAD_SIZE],
					   byte);
				ClientBitSet2(clientno);
				AttackClient=UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+2];
				DefenceClient=UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+3];
				TaskTable[no].work[RECV_BUF_WAIT]=200;
				break;
			case BSS_CLIENT:
				memcpy(ClientBuffer[clientno],
					   &UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+RECV_HEAD_SIZE],
					   byte);
				break;
		}
		TaskTable[no].work[RECV_BUF_GET]=
		TaskTable[no].work[RECV_BUF_GET]+byte+RECV_HEAD_SIZE;
		if(TaskTable[no].work[RECV_BUF_GET]>TaskTable[no].work[RECV_BUF_SET]){
			if(UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]]==0xff)
				TaskTable[no].work[RECV_BUF_GET]=0;
		}
	}
//	}
}
#else
#define	RECV_HEAD_SIZE	8

void	TuushinRecvSet(void)
{
	u8	id;
	u16	byte;
	int	i;
	u8	*adr1,*adr2;
	u8	clientno,clientbit;

	if(pokemon_sio_flag==0) return;
	if((FightType&FIGHT_TYPE_TUUSHIN_OK)==0) return;
	if(SioTrainerInfo[0].ninshou==NINSHOU_BATTLEROOM){
		for(id=0;id<GetConnectSioMenberNum();id++){
			if(SplitDataResult()&no2bittbl[id]){
				SplitDataResultReset2(id);					//通信終了フラグをクリア
	
				clientbit=RecvPoolBuf[id][0]&0xff;
				clientno=(RecvPoolBuf[id][0]&0xff00)>>8;
	
#if	 CLIENT_BIT_YUUSEN
				if(clientbit==BSS_CLIENT_BIT){
					ClientBit&=((no2bittbl[clientno]<<(4*id))^0xffffffff);
				}
				else{
#endif
					byte=RecvPoolBuf[id][2];
					if(TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]+RECV_HEAD_SIZE+1+byte>TUUSHIN_TASK_BUF_SIZE){
						TaskTable[TuushinRecvTaskNo].work[RECV_BUF_OVER]=
							TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET];
						TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]=0;
					}
					adr1=(u8 *)&UserWork[RECV_TASK_BUF_START+TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]+0];
					adr2=(u8 *)&RecvPoolBuf[id][0];
					for(i=0;i<byte+RECV_HEAD_SIZE;i++)
						adr1[i]=adr2[i];
		
					TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]=
					TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]+byte+RECV_HEAD_SIZE;
//					UserWork[RECV_TASK_BUF_START+TaskTable[TuushinRecvTaskNo].work[RECV_BUF_SET]+0]=0x00;
#if CLIENT_BIT_YUUSEN
				}
#endif
			}
		}
	}
}

void	TuushinRecvTask(u8 no)
{
	u8	id;
	u8	clientno;
	u16	byte;

	if(TaskTable[no].work[RECV_BUF_GET]!=TaskTable[no].work[RECV_BUF_SET]){
		if(TaskTable[no].work[RECV_BUF_GET]>TaskTable[no].work[RECV_BUF_SET]){
			if(TaskTable[no].work[RECV_BUF_GET]==TaskTable[no].work[RECV_BUF_OVER]){
				TaskTable[no].work[RECV_BUF_OVER]=0;
				TaskTable[no].work[RECV_BUF_GET]=0;
			}
		}
		clientno=UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+1];
		byte=
		UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+4]|
		(UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+5]<<8);

		switch(UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+0]){
			case BSS_SERVER:
				if(ClientBit&no2bittbl[clientno]) return;
				memcpy(ServerBuffer[clientno],
					   &UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+RECV_HEAD_SIZE],
					   byte);
				ClientBitSet2(clientno);
				if((FightType&FIGHT_TYPE_OYA)==0){
					AttackClient=UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+2];
					DefenceClient=UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+3];
					NoReshuffleClient=UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+6];
					TsuikaClient=UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+7];
				}
				break;
			case BSS_CLIENT:
				memcpy(ClientBuffer[clientno],
					   &UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+RECV_HEAD_SIZE],
					   byte);
				break;
			case BSS_CLIENT_BIT:
				id=UserWork[RECV_TASK_BUF_START+TaskTable[no].work[RECV_BUF_GET]+RECV_HEAD_SIZE];
				ClientBit&=((no2bittbl[clientno]<<(4*id))^0xffffffff);
				break;
		}
		TaskTable[no].work[RECV_BUF_GET]=
			TaskTable[no].work[RECV_BUF_GET]+byte+RECV_HEAD_SIZE;
	}
}
#endif

void	BSS_POKEPARA_GET_SET(u8 access,u8 para,u8 num)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_POKEPARA_GET;
		BSSComTbl[1]=para;
		BSSComTbl[2]=num;
		BSSComTbl[3]=0;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_POKEPARA_GET2_SET(u8 access,u8 adrofs,u8 byte)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_POKEPARA_GET2;
		BSSComTbl[1]=adrofs;
		BSSComTbl[2]=byte;
		BSSComTbl[3]=0;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_POKEPARA_PUT_SET(u8 access,u8 para,u8 num,u8 byte,u8 *data)
{
		int	i;
//		u8	BSSComTbl[256];

		BSSComTbl[0]=BSS_POKEPARA_PUT;
		BSSComTbl[1]=para;
		BSSComTbl[2]=num;
		for(i=0;i<byte;i++){
			BSSComTbl[3+i]=*data;
			data++;
		}

		BSSIOInterface(access,BSSComTbl,byte+3);
}

void	BSS_POKEPARA_PUT2_SET(u8 access,u8 adrofs,u8 byte,u8 *data)
{
		int	i;
//		u8	BSSComTbl[256];

		BSSComTbl[0]=BSS_POKEPARA_PUT2;
		BSSComTbl[1]=adrofs;
		BSSComTbl[2]=byte;
		for(i=0;i<byte;i++){
			BSSComTbl[3+i]=*data;
			data++;
		}

		BSSIOInterface(access,BSSComTbl,byte+3);
}

void	BSS_POKE_ENCOUNT_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_POKE_ENCOUNT;
		BSSComTbl[1]=BSS_POKE_ENCOUNT;
		BSSComTbl[2]=BSS_POKE_ENCOUNT;
		BSSComTbl[3]=BSS_POKE_ENCOUNT;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_POKE_APPEAR_SET(u8 access,u8 no,u8 flag)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_POKE_APPEAR;
		BSSComTbl[1]=no;
		BSSComTbl[2]=flag;
		BSSComTbl[3]=BSS_POKE_APPEAR;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_POKE_RETURN_SET(u8 access,u8 flag)
{
//		u8	BSSComTbl[2];

		BSSComTbl[0]=BSS_POKE_RETURN;
		BSSComTbl[1]=flag;

		BSSIOInterface(access,BSSComTbl,2);
}

void	BSS_TRAINER_ENCOUNT_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_TRAINER_ENCOUNT;
		BSSComTbl[1]=BSS_TRAINER_ENCOUNT;
		BSSComTbl[2]=BSS_TRAINER_ENCOUNT;
		BSSComTbl[3]=BSS_TRAINER_ENCOUNT;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_TRAINER_APPEAR_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_TRAINER_APPEAR;
		BSSComTbl[1]=BSS_TRAINER_APPEAR;
		BSSComTbl[2]=BSS_TRAINER_APPEAR;
		BSSComTbl[3]=BSS_TRAINER_APPEAR;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_TRAINER_RETURN_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_TRAINER_RETURN;
		BSSComTbl[1]=BSS_TRAINER_RETURN;
		BSSComTbl[2]=BSS_TRAINER_RETURN;
		BSSComTbl[3]=BSS_TRAINER_RETURN;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_POKE_KIZETSU_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_POKE_KIZETSU;
		BSSComTbl[1]=BSS_POKE_KIZETSU;
		BSSComTbl[2]=BSS_POKE_KIZETSU;
		BSSComTbl[3]=BSS_POKE_KIZETSU;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_POKE_ZENMETSU_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_POKE_ZENMETSU;
		BSSComTbl[1]=BSS_POKE_ZENMETSU;
		BSSComTbl[2]=BSS_POKE_ZENMETSU;
		BSSComTbl[3]=BSS_POKE_ZENMETSU;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_GET_SUCCESS_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_GET_SUCCESS;
		BSSComTbl[1]=BSS_GET_SUCCESS;
		BSSComTbl[2]=BSS_GET_SUCCESS;
		BSSComTbl[3]=BSS_GET_SUCCESS;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_GET_FAIL_SET(u8 access,u8 getdata)
{
//		u8	BSSComTbl[2];

		BSSComTbl[0]=BSS_GET_FAIL;
		BSSComTbl[1]=getdata;

		BSSIOInterface(access,BSSComTbl,2);
}

void	BSS_POKE_LEVELUP_SET(u8 access,u8 paracnt,u8 *data)
{
		int	i;
//		u8	BSSComTbl[256];

		BSSComTbl[0]=BSS_POKE_LEVELUP;
		BSSComTbl[1]=paracnt;
		for(i=0;i<paracnt*3;i++){
			BSSComTbl[2+i]=*data;
			data++;
		}

		BSSIOInterface(access,BSSComTbl,2+paracnt*3);
}

void	BSS_WAZA_EFFECT_SET(u8 access,u16 wazano,u8 cnt,u16 pow,s32 damage,u8 friend,u8 *wazacnt)
{
//		u8	BSSComTbl[16+sizeof(WazaKoukaCount)];

		BSSComTbl[0]=BSS_WAZA_EFFECT;
		BSSComTbl[1]=wazano&0xff;
		BSSComTbl[2]=(wazano&0xff00)>>8;
		BSSComTbl[3]=cnt;
		BSSComTbl[4]=pow&0xff;
		BSSComTbl[5]=(pow&0xff00)>>8;
		BSSComTbl[6]=(damage&0x000000ff)>> 0;
		BSSComTbl[7]=(damage&0x0000ff00)>> 8;
		BSSComTbl[8]=(damage&0x00ff0000)>>16;
		BSSComTbl[9]=(damage&0xff000000)>>24;
		BSSComTbl[10]=friend;
		BSSComTbl[11]=WazaSeqLoopCount;
		if((SpecialAbirityCheck(SPEABI_HAVE_SPEABI,0,TOKUSYU_NOOTENKI,0,0)==0)&&
		   (SpecialAbirityCheck(SPEABI_HAVE_SPEABI,0,TOKUSYU_EAROKKU,0,0)==0)){
			BSSComTbl[12]=FieldCondition&0xff;
			BSSComTbl[13]=(FieldCondition&0xff00)>>8;
		}
		else{
			BSSComTbl[12]=0;
			BSSComTbl[13]=0;
		}
		BSSComTbl[14]=0;	//4バイト境界補正
		BSSComTbl[15]=0;	//4バイト境界補正
		memcpy(&BSSComTbl[16],wazacnt,sizeof(WazaKoukaCount));

		BSSIOInterface(access,BSSComTbl,16+sizeof(WazaKoukaCount));
}

#if 0
void	BSS_MESSAGE_SET(u8 access,u8 byte,u8 *data)
{
		int	i;
//		u8	BSSComTbl[256];

		BSSComTbl[0]=BSS_MESSAGE;
		BSSComTbl[1]=byte;
		for(i=0;i<byte;i++){
			BSSComTbl[2+i]=*data;
			data++;
		}

		BSSIOInterface(access,BSSComTbl,2+byte);
}
#else
void	BSS_MESSAGE_SET(u8 access,u16 MsgID)
{
		int	i;
		FightMsgStruct	*FMS;
//		u8	BSSComTbl[sizeof(FightMsgStruct)+4];

		BSSComTbl[0]=BSS_MESSAGE;
		BSSComTbl[1]=WinLoseFlag;
		BSSComTbl[2]=(MsgID&0x00ff)>>0;
		BSSComTbl[3]=(MsgID&0xff00)>>8;
		FMS=(FightMsgStruct *)&BSSComTbl[4];

		FMS->WazaNo=WazaNo;
		FMS->WazaNoTmp=WazaNoTmp;
		FMS->ItemNo=ItemNo;
		FMS->SpeabiNo=SpeabiNo;
		FMS->ClientNoWork=UserWork[CLIENT_NO_WORK];
		FMS->SelMonsWork=UserWork[SEL_MONS_WORK];
		FMS->MessageOffset=UserWork[MESSAGE_OFFSET];
		FMS->ItemClient=ItemClient;
		FMS->WazaType=WTD[WazaNo].wazatype;
		for(i=0;i<4;i++)
			FMS->Speabi[i]=PSP[i].speabino;
		for(i=0;i<16;i++){
			FMS->EvStrBuf0[i]=EvStrBuf0[i];
			FMS->EvStrBuf1[i]=EvStrBuf1[i];
		}
		BSSIOInterface(access,BSSComTbl,sizeof(FightMsgStruct)+4);
}
#endif

void	BSS_ALERT_MESSAGE_SET(u8 access,u16 MsgID)
{
		int	i;
		FightMsgStruct	*FMS;
//		u8	BSSComTbl[sizeof(FightMsgStruct)+4];

		BSSComTbl[0]=BSS_ALERT_MESSAGE;
		BSSComTbl[1]=BSS_ALERT_MESSAGE;
		BSSComTbl[2]=(MsgID&0x00ff)>>0;
		BSSComTbl[3]=(MsgID&0xff00)>>8;
		FMS=(FightMsgStruct *)&BSSComTbl[4];

		FMS->WazaNo=WazaNo;
		FMS->WazaNoTmp=WazaNoTmp;
		FMS->ItemNo=ItemNo;
		FMS->SpeabiNo=SpeabiNo;
		FMS->ClientNoWork=UserWork[CLIENT_NO_WORK];
		FMS->SelMonsWork=UserWork[SEL_MONS_WORK];
		for(i=0;i<4;i++)
			FMS->Speabi[i]=PSP[i].speabino;
		for(i=0;i<16;i++){
			FMS->EvStrBuf0[i]=EvStrBuf0[i];
			FMS->EvStrBuf1[i]=EvStrBuf1[i];
		}
		BSSIOInterface(access,BSSComTbl,sizeof(FightMsgStruct)+4);
}

void	BSS_COMMAND_SELECT_SET(u8 access,u8 select,u16 item)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_COMMAND_SELECT;
		BSSComTbl[1]=select;
		BSSComTbl[2]=item&0xff;
		BSSComTbl[3]=(item&0xff00)>>8;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_COMMAND_SELECT_COPY_SET(u8 access,u8 client_no)
{
//		u8	BSSComTbl[2];

		BSSComTbl[0]=BSS_COMMAND_SELECT_COPY;
		BSSComTbl[1]=client_no;

		BSSIOInterface(access,BSSComTbl,2);
}

void	BSS_WAZA_SELECT_SET(u8 access,u8 pokesel,u8 type,u8 *buf)
{
		int	i;
//		u8	BSSComTbl[4+sizeof(WazaList)];

		BSSComTbl[0]=BSS_WAZA_SELECT;
		BSSComTbl[1]=pokesel;
		BSSComTbl[2]=type;
		BSSComTbl[3]=0;				//４バイト境界対策

		for(i=0;i<sizeof(WazaList);i++)
			BSSComTbl[4+i]=buf[i];

		BSSIOInterface(access,BSSComTbl,4+sizeof(WazaList));
}

void	BSS_ITEM_SELECT_SET(u8 access,u8 *pokelist)
{
		int	i;
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_ITEM_SELECT;
		for(i=0;i<3;i++)
			BSSComTbl[1+i]=pokelist[i];

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_POKE_SELECT_SET(u8 access,u8 type,u8 nochg,u8 speabino,u8 *pokelist)
{
		int	i;
//		u8	BSSComTbl[8];

		BSSComTbl[0]=BSS_POKE_SELECT;
		BSSComTbl[1]=type;
		BSSComTbl[2]=nochg;
		BSSComTbl[3]=speabino;
		for(i=0;i<3;i++)
			BSSComTbl[4+i]=pokelist[i];

		BSSIOInterface(access,BSSComTbl,8);
}

void	BSS_ESCAPE_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_ESCAPE;
		BSSComTbl[1]=BSS_ESCAPE;
		BSSComTbl[2]=BSS_ESCAPE;
		BSSComTbl[3]=BSS_ESCAPE;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_HP_GAUGE_SET(u8 access,s16 para)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_HP_GAUGE;
		BSSComTbl[1]=0;
		BSSComTbl[2]=para&0xff;
		BSSComTbl[3]=(para&0xff00)>>8;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_EXP_GAUGE_SET(u8 access,u8 no,s16 para)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_EXP_GAUGE;
		BSSComTbl[1]=no;
		BSSComTbl[2]=para&0xff;
		BSSComTbl[3]=(para&0xff00)>>8;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_STATUS_SET_SET(u8 access,u32 status,u32 status2)
{
//		u8	BSSComTbl[9];

		BSSComTbl[0]=BSS_STATUS_SET;
		BSSComTbl[1]=(status&0x000000ff)>> 0;
		BSSComTbl[2]=(status&0x0000ff00)>> 8;
		BSSComTbl[3]=(status&0x00ff0000)>>16;
		BSSComTbl[4]=(status&0xff000000)>>24;
		BSSComTbl[5]=(status2&0x000000ff)>> 0;
		BSSComTbl[6]=(status2&0x0000ff00)>> 8;
		BSSComTbl[7]=(status2&0x00ff0000)>>16;
		BSSComTbl[8]=(status2&0xff000000)>>24;

		BSSIOInterface(access,BSSComTbl,9);
}

void	BSS_STATUS_EFFECT_SET(u8 access,u8 type,u32 status)
{
//		u8	BSSComTbl[6];

		BSSComTbl[0]=BSS_STATUS_EFFECT;
		BSSComTbl[1]=type;
		BSSComTbl[2]=(status&0x000000ff)>> 0;
		BSSComTbl[3]=(status&0x0000ff00)>> 8;
		BSSComTbl[4]=(status&0x00ff0000)>>16;
		BSSComTbl[5]=(status&0xff000000)>>24;

		BSSIOInterface(access,BSSComTbl,6);
}

void	BSS_STATUS_CLEAR_SET(u8 access,u8 status)
{
//		u8	BSSComTbl[2];

		BSSComTbl[0]=BSS_STATUS_CLEAR;
		BSSComTbl[1]=status;

		BSSIOInterface(access,BSSComTbl,2);
}

void	BSS_DATA_TRANS_SET(u8 access,u16 byte,u8 *data)
{
		int	i;
//		u8	BSSComTbl[256];

		BSSComTbl[0]=BSS_DATA_TRANS;
		BSSComTbl[1]=BSS_DATA_TRANS;
		BSSComTbl[2]=byte&0xff;
		BSSComTbl[3]=(byte&0xff00)>>8;

		for(i=0;i<byte;i++){
			BSSComTbl[4+i]=*data;
			data++;
		}

		BSSIOInterface(access,BSSComTbl,4+byte);
}

void	BSS_DATA_RAM_TRANS_SET(u8 access,u32 adrs,u16 byte,u8 *data)
{
		int	i;
//		u8	BSSComTbl[256];

		BSSComTbl[0]=BSS_DATA_RAM_TRANS;
		BSSComTbl[1]=(adrs&0x000000ff)>> 0;
		BSSComTbl[2]=(adrs&0x0000ff00)>> 8;
		BSSComTbl[3]=(adrs&0x00ff0000)>>16;
		BSSComTbl[4]=(adrs&0xff000000)>>24;
		BSSComTbl[5]=byte&0xff;
		BSSComTbl[6]=(byte&0xff00)>>8;

		for(i=0;i<byte;i++){
			BSSComTbl[7+i]=*data;
			data++;
		}

		BSSIOInterface(access,BSSComTbl,7+byte);
}

void	BSS_BGM_TRANS_SET(u8 access,u16 byte,u8 *data)
{
		int	i;
//		u8	BSSComTbl[256];

		BSSComTbl[0]=BSS_BGM_TRANS;
		BSSComTbl[1]=byte&0xff;
		BSSComTbl[2]=(byte&0xff00)>>8;

		for(i=0;i<byte;i++){
			BSSComTbl[3+i]=*data;
			data++;
		}

		BSSIOInterface(access,BSSComTbl,3+byte);
}

void	BSS_VOICE_TRANS_SET(u8 access,u16 byte,u8 *data)
{
		int	i;
//		u8	BSSComTbl[256];

		BSSComTbl[0]=BSS_VOICE_TRANS;
		BSSComTbl[1]=byte&0xff;
		BSSComTbl[2]=(byte&0xff00)>>8;

		for(i=0;i<byte;i++){
			BSSComTbl[3+i]=*data;
			data++;
		}

		BSSIOInterface(access,BSSComTbl,3+byte);
}

void	BSS_SELECT_RETURN_SET(u8 access,u8 id,u16 para)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_SELECT_RETURN;
		BSSComTbl[1]=id;
		BSSComTbl[2]=para&0xff;
		BSSComTbl[3]=(para&0xff00)>>8;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_POKE_RESHUFFLE_SET(u8 access,u8 flag,u8 *listrow)
{
		int	i;
//		u8	BSSComTbl[6];

		BSSComTbl[0]=BSS_POKE_RESHUFFLE;
		BSSComTbl[1]=flag;

		for(i=0;i<3;i++)
			BSSComTbl[2+i]=listrow[i];

		BSSIOInterface(access,BSSComTbl,5);
}

void	BSS_USE_ITEM_SET(u8 access,u16 itemno)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_USE_ITEM;
		BSSComTbl[1]=itemno&0xff;
		BSSComTbl[2]=(itemno&0xff00)>>8;
		BSSComTbl[3]=0;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_USE_BALL_SET(u8 access,u16 ballno)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_USE_BALL;
		BSSComTbl[1]=ballno&0xff;
		BSSComTbl[2]=(ballno&0xff00)>>8;
		BSSComTbl[3]=0;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_LOOPCOUNT_CLEAR_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_LOOPCOUNT_CLEAR;
		BSSComTbl[1]=BSS_LOOPCOUNT_CLEAR;
		BSSComTbl[2]=BSS_LOOPCOUNT_CLEAR;
		BSSComTbl[3]=BSS_LOOPCOUNT_CLEAR;
		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_LOOPCOUNT_SET_SET(u8 access,u8 cnt)
{
//		u8	BSSComTbl[2];

		BSSComTbl[0]=BSS_LOOPCOUNT_SET;
		BSSComTbl[1]=cnt;
		BSSIOInterface(access,BSSComTbl,2);
}

void	BSS_SWITCHFLAG_CLEAR_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_SWITCHFLAG_CLEAR;
		BSSComTbl[1]=BSS_SWITCHFLAG_CLEAR;
		BSSComTbl[2]=BSS_SWITCHFLAG_CLEAR;
		BSSComTbl[3]=BSS_SWITCHFLAG_CLEAR;
		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_SWITCHFLAG_SET_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_SWITCHFLAG_SET;
		BSSComTbl[1]=BSS_SWITCHFLAG_SET;
		BSSComTbl[2]=BSS_SWITCHFLAG_SET;
		BSSComTbl[3]=BSS_SWITCHFLAG_SET;
		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_POKEDAMAGE_BLINK_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_POKEDAMAGE_BLINK;
		BSSComTbl[1]=BSS_POKEDAMAGE_BLINK;
		BSSComTbl[2]=BSS_POKEDAMAGE_BLINK;
		BSSComTbl[3]=BSS_POKEDAMAGE_BLINK;
		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_GAUGE_OFF_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_GAUGE_OFF;
		BSSComTbl[1]=BSS_GAUGE_OFF;
		BSSComTbl[2]=BSS_GAUGE_OFF;
		BSSComTbl[3]=BSS_GAUGE_OFF;
		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_SE_PLAY_SET(u8 access,u16 no)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_SE_PLAY;
		BSSComTbl[1]=no&0xff;
		BSSComTbl[2]=(no&0xff00)>>8;
		BSSComTbl[3]=0;
		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_ME_PLAY_SET(u8 access,u16 no)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_ME_PLAY;
		BSSComTbl[1]=no&0xff;
		BSSComTbl[2]=(no&0xff00)>>8;
		BSSComTbl[3]=0;
		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_VOICE_PLAY_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_VOICE_PLAY;
		BSSComTbl[1]=BSS_VOICE_PLAY;
		BSSComTbl[2]=BSS_VOICE_PLAY;
		BSSComTbl[3]=BSS_VOICE_PLAY;
		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_ENCOUNT_EFFECT_SET(u8 access,u8 no)
{
//		u8	BSSComTbl[2];

		BSSComTbl[0]=BSS_ENCOUNT_EFFECT;
		BSSComTbl[1]=no;
		BSSIOInterface(access,BSSComTbl,2);
}

void	BSS_POKE_SENDOUT_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_POKE_SENDOUT;
		BSSComTbl[1]=BSS_POKE_SENDOUT;
		BSSComTbl[2]=BSS_POKE_SENDOUT;
		BSSComTbl[3]=BSS_POKE_SENDOUT;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_BALL_GAUGE_SET_SET(u8 access,u8 *buf,u8 flag)
{
		int	i;
//		u8	BSSComTbl[52];

		BSSComTbl[0]=BSS_BALL_GAUGE_SET;
		BSSComTbl[1]=(flag&0x7f);				//自分側に出すか出さないかのフラグ	
		BSSComTbl[2]=(flag&0x80)>>7;			//初回かそうでないか
		BSSComTbl[3]=BSS_BALL_GAUGE_SET;

		for(i=0;i<48;i++)
			BSSComTbl[i+4]=buf[i];

		BSSIOInterface(access,BSSComTbl,52);
}

void	BSS_BALL_GAUGE_OFF_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_BALL_GAUGE_OFF;
		BSSComTbl[1]=BSS_BALL_GAUGE_OFF;
		BSSComTbl[2]=BSS_BALL_GAUGE_OFF;
		BSSComTbl[3]=BSS_BALL_GAUGE_OFF;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_GAUGE_YURE_STOP_SET(u8 access)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_GAUGE_YURE_STOP;
		BSSComTbl[1]=BSS_GAUGE_YURE_STOP;
		BSSComTbl[2]=BSS_GAUGE_YURE_STOP;
		BSSComTbl[3]=BSS_GAUGE_YURE_STOP;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_VANISH_ON_OFF_SET(u8 access,u8 flag)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_VANISH_ON_OFF;
		BSSComTbl[1]=flag;
		BSSComTbl[2]=BSS_VANISH_ON_OFF;
		BSSComTbl[3]=BSS_VANISH_ON_OFF;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_FIGHT_EFFECT_SET(u8 access,u8 id,u16 work)
{
//		u8	BSSComTbl[4];

		BSSComTbl[0]=BSS_FIGHT_EFFECT;
		BSSComTbl[1]=id;
		BSSComTbl[2]=work&0xff;
		BSSComTbl[3]=(work&0xff00)>>8;

		BSSIOInterface(access,BSSComTbl,4);
}

void	BSS_TUUSHIN_WAIT_SET(u8 access,u8 flag)
{
//		u8	BSSComTbl[2];

		BSSComTbl[0]=BSS_TUUSHIN_WAIT;
		BSSComTbl[1]=flag;

		BSSIOInterface(access,BSSComTbl,2);
}

void	BSS_CSRPOS_CLEAR_SET(u8 access,u8 flag)
{
//		u8	BSSComTbl[2];

		BSSComTbl[0]=BSS_CSRPOS_CLEAR;
		BSSComTbl[1]=flag;

		BSSIOInterface(access,BSSComTbl,2);
}

void	BSS_FIGHT_END_SET(u8 access,u8 flag)
{
//		u8	BSSComTbl[2];

		BSSComTbl[0]=BSS_FIGHT_END;
		BSSComTbl[1]=flag;

		BSSIOInterface(access,BSSComTbl,2);
}

