//======================================================
//                                                      
//    waza_ai.c                                           
//                                                      
//    Copyright (C) 2002 GAME FREAK inc.
//======================================================

#include "common.h"
#include "calctool.h"		//add
#include "actor.h"
#include "decord.h"
#include "poketool.h"
#include "fight.h"
#include "agbmons.h"
#include "print.h"
#include "pm_str.h"
#include "trainer.h"
#include "task.h"
#include "wazano.def"
#include "item.h"
#include "tokusyu.def"
#include "tr_ai.h"
#include "waza_ai.def"
#include "server.h"
#include "server.def"
#include "ai_def.def"
#include "ev_fight.h"
#include "wazatool.h"
#include "monsno.def"

//---------------------- グローバル変数 --------------------------

u8		*AISeqAdrs=0;

//-------------------- サブルーチン宣言 ------------------------

void	WazaAIInit(void);
void	WazaAIInit2(void);
u8		WazaAIMain(void);
void	WazaAISequence(void);
void	WazaNoStock(void);
void	WazaNoStockClear(u8);
void	TokusyuNoSet(u8,u8);
void	SoubiItemSet(u8,u8);

void	AI_IF_RND_UNDER(void);
void	AI_IF_RND_OVER(void);
void	AI_IF_RND_EQUAL(void);
void	AI_IFN_RND_EQUAL(void);
void	AI_INCDEC(void);
void	AI_IF_HP_UNDER(void);
void	AI_IF_HP_OVER(void);
void	AI_IF_HP_EQUAL(void);
void	AI_IFN_HP_EQUAL(void);
void	AI_IF_COND(void);
void	AI_IFN_COND(void);
void	AI_IF_COND2(void);
void	AI_IFN_COND2(void);
void	AI_IF_WAZAKOUKA(void);
void	AI_IFN_WAZAKOUKA(void);
void	AI_IF_SIDE_CONDITION(void);
void	AI_IFN_SIDE_CONDITION(void);
void	AI_IF_UNDER(void);
void	AI_IF_OVER(void);
void	AI_IF_EQUAL(void);
void	AI_IFN_EQUAL(void);
void	AI_IF_UNDER_ADRS(void);
void	AI_IF_OVER_ADRS(void);
void	AI_IF_EQUAL_ADRS(void);
void	AI_IFN_EQUAL_ADRS(void);
void	AI_IF_WAZANO(void);
void	AI_IFN_WAZANO(void);
void	AI_IF_TABLE_1BYTE_JUMP(void);
void	AI_IFN_TABLE_1BYTE_JUMP(void);
void	AI_IF_TABLE_2BYTE_JUMP(void);
void	AI_IFN_TABLE_2BYTE_JUMP(void);
void	AI_IF_HAVE_DAMAGE_WAZA(void);
void	AI_IFN_HAVE_DAMAGE_WAZA(void);
void	AI_CHECK_TURN(void);
void	AI_CHECK_TYPE(void);
void	AI_CHECK_IRYOKU(void);
void	AI_COMP_POWER(void);
void	AI_CHECK_LAST_WAZA(void);
void	AI_IF_WAZA_TYPE(void);
void	AI_IFN_WAZA_TYPE(void);
void	AI_IF_FIRST(void);
void	AI_IFN_FIRST(void);
void	AI_ALL_WAZA_CHECK(void);
void	AI_WAZA_LOOP(void);
void	AI_CHECK_BENCH_COUNT(void);
void	AI_CHECK_WAZANO(void);
void	AI_CHECK_WAZASEQNO(void);
void	AI_CHECK_TOKUSYU(void);
void	AI_CHECK_AISYOU(void);
void	AI_CHECK_WAZA_AISYOU(void);
void	AI_IF_WAZA_STRONG(void);
void	AI_IFN_WAZA_STRONG(void);
void	AI_IF_BENCH_COND(void);
void	AI_IFN_BENCH_COND(void);
void	AI_CHECK_WEATHER(void);
void	AI_IF_WAZA_SEQNO_JUMP(void);
void	AI_IFN_WAZA_SEQNO_JUMP(void);
void	AI_IF_PARA_UNDER(void);
void	AI_IF_PARA_OVER(void);
void	AI_IF_PARA_EQUAL(void);
void	AI_IFN_PARA_EQUAL(void);
void	AI_IF_WAZA_HINSHI(void);
void	AI_IFN_WAZA_HINSHI(void);
void	AI_IF_HAVE_WAZA(void);
void	AI_IFN_HAVE_WAZA(void);
void	AI_IF_HAVE_WAZA_SEQNO(void);
void	AI_IFN_HAVE_WAZA_SEQNO(void);
void	AI_IF_POKE_CHECK_STATE(void);
void	AI_IF_WAZA_CHECK_STATE(void);
void	AI_ESCAPE(void);
void	AI_SAFARI_ESCAPE_JUMP(void);
void	AI_SAFARI(void);
void	AI_CHECK_SOUBIITEM(void);
void	AI_CHECK_POKESEX(void);
void	AI_CHECK_NEKODAMASI(void);
void	AI_CHECK_TAKUWAERU(void);
void	AI_CHECK_FIGHT_TYPE(void);
void	AI_CHECK_RECYCLE_ITEM(void);
void	AI_CHECK_WORKWAZA_TYPE(void);
void	AI_CHECK_WORKWAZA_POW(void);
void	AI_CHECK_WORKWAZA_SEQNO(void);
void	AI_CHECK_MAMORU_COUNT(void);
void	AI_SET_VALUE(void);
void	AI_SET_WORK(void);
void	AI_ADD_VALUE(void);
void	AI_ADD_WORK(void);
void	AI_SUB_VALUE(void);
void	AI_SUB_WORK(void);
void	AI_GOSUB(void);
void	AI_JUMP(void);
void	AI_AIEND(void);
void	AI_IF_LEVEL(void);
void	AI_IF_CHOUHATSU(void);
void	AI_IFN_CHOUHATSU(void);

void	AIPushAdrsSet(u8 *adrs);
void	AIPushAdrsAct(void);
u8		AIPopAdrsAct(void);

//-------------------- extern宣言 ------------------------

#ifdef PM_DEBUG
extern	u32	AIBitWork;
#endif

extern	const	WazaTblDat	WTD[];

//-------------------- AIコマンド宣言 ------------------------

const pFunc	AISequenceTbl[]={
	AI_IF_RND_UNDER,
	AI_IF_RND_OVER,
	AI_IF_RND_EQUAL,
	AI_IFN_RND_EQUAL,
	AI_INCDEC,
	AI_IF_HP_UNDER,
	AI_IF_HP_OVER,
	AI_IF_HP_EQUAL,
	AI_IFN_HP_EQUAL,
	AI_IF_COND,
	AI_IFN_COND,
	AI_IF_COND2,
	AI_IFN_COND2,
	AI_IF_WAZAKOUKA,
	AI_IFN_WAZAKOUKA,
	AI_IF_SIDE_CONDITION,
	AI_IFN_SIDE_CONDITION,
	AI_IF_UNDER,
	AI_IF_OVER,
	AI_IF_EQUAL,
	AI_IFN_EQUAL,
	AI_IF_UNDER_ADRS,
	AI_IF_OVER_ADRS,
	AI_IF_EQUAL_ADRS,
	AI_IFN_EQUAL_ADRS,
	AI_IF_WAZANO,
	AI_IFN_WAZANO,
	AI_IF_TABLE_1BYTE_JUMP,
	AI_IFN_TABLE_1BYTE_JUMP,
	AI_IF_TABLE_2BYTE_JUMP,
	AI_IFN_TABLE_2BYTE_JUMP,
	AI_IF_HAVE_DAMAGE_WAZA,
	AI_IFN_HAVE_DAMAGE_WAZA,
	AI_CHECK_TURN,
	AI_CHECK_TYPE,
	AI_CHECK_IRYOKU,
	AI_COMP_POWER,
	AI_CHECK_LAST_WAZA,
	AI_IF_WAZA_TYPE,
	AI_IFN_WAZA_TYPE,
	AI_IF_FIRST,
	AI_IFN_FIRST,
	AI_ALL_WAZA_CHECK,
	AI_WAZA_LOOP,
	AI_CHECK_BENCH_COUNT,
	AI_CHECK_WAZANO,
	AI_CHECK_WAZASEQNO,
	AI_CHECK_TOKUSYU,
	AI_CHECK_AISYOU,
	AI_CHECK_WAZA_AISYOU,
	AI_IF_WAZA_STRONG,
	AI_IFN_WAZA_STRONG,
	AI_IF_BENCH_COND,
	AI_IFN_BENCH_COND,
	AI_CHECK_WEATHER,
	AI_IF_WAZA_SEQNO_JUMP,
	AI_IFN_WAZA_SEQNO_JUMP,
	AI_IF_PARA_UNDER,
	AI_IF_PARA_OVER,
	AI_IF_PARA_EQUAL,
	AI_IFN_PARA_EQUAL,
	AI_IF_WAZA_HINSHI,
	AI_IFN_WAZA_HINSHI,
	AI_IF_HAVE_WAZA,
	AI_IFN_HAVE_WAZA,
	AI_IF_HAVE_WAZA_SEQNO,
	AI_IFN_HAVE_WAZA_SEQNO,
	AI_IF_POKE_CHECK_STATE,
	AI_IF_WAZA_CHECK_STATE,
	AI_ESCAPE,
	AI_SAFARI_ESCAPE_JUMP,
	AI_SAFARI,
	AI_CHECK_SOUBIITEM,
	AI_CHECK_POKESEX,
	AI_CHECK_NEKODAMASI,
	AI_CHECK_TAKUWAERU,
	AI_CHECK_FIGHT_TYPE,
	AI_CHECK_RECYCLE_ITEM,
	AI_CHECK_WORKWAZA_TYPE,
	AI_CHECK_WORKWAZA_POW,
	AI_CHECK_WORKWAZA_SEQNO,
	AI_CHECK_MAMORU_COUNT,
	AI_SET_VALUE,
	AI_SET_WORK,
	AI_ADD_VALUE,
	AI_ADD_WORK,
	AI_SUB_VALUE,
	AI_SUB_WORK,
	AI_GOSUB,
	AI_JUMP,
	AI_AIEND,
	AI_IF_LEVEL,
	AI_IF_CHOUHATSU,
	AI_IFN_CHOUHATSU,
};

//-------------------- AIシーケンスナンバー宣言 ------------------------

enum{
	AI_SEQ_THINK_INIT=0,
	AI_SEQ_THINK,
	AI_SEQ_END,
};

//--------------------------------------------------------------
//		AI用ワークの初期化
//--------------------------------------------------------------

//最初に1回だけ初期化するワークを指定
void	WazaAIInit(void)
{
	int	i;
	u8	*adr;

	adr=(u8 *)AIWT2;
	for(i=0;i<sizeof(AIWorkTbl2);i++)
		adr[i]=0;

	if((FightType&FIGHT_TYPE_TRAINER)&&
	   (FieldTrainerID!=ORUSUBAN_TRAINER)&&
	  ((FightType&FIGHT_TYPE_NO_ITEM_AI)==0)){
		for(i=0;i<4;i++){
			if(TD[FieldTrainerID].item[i]!=0){
				AIWT2->AI_HAVEITEM[AIWT2->AI_ITEMCNT]=TD[FieldTrainerID].item[i];
				AIWT2->AI_ITEMCNT++;
			}
		}
	}

	WazaAIInit2();
}

void	WazaAIInit2(void)
{
	int	i;
	u8	wazabit;
	u8	*adr;

	adr=(u8 *)AIWT;
	for(i=0;i<sizeof(AIWorkTbl);i++)
		adr[i]=0;

	for(i=0;i<4;i++)
		AIWT->AI_WAZAPOINT[i]=100;

	wazabit=WaruagakiWazaNoCheck(ClientNo,0,0xff);	//全てをチェック

	for(i=0;i<4;i++){
		if(wazabit&no2bittbl[i])
			AIWT->AI_WAZAPOINT[i]=0;
		AIWT->AI_DAMAGELOSS[i]=100-(pp_rand()%16);
	}

	AI_PUSH_ADRS->PushAdrsCnt=0;

//	この辺は暫定
	AttackClient=ClientNo;
	if(FightType&FIGHT_TYPE_2vs2){
		DefenceClient=pp_rand()&2;
		if(NoReshuffleClient&no2bittbl[DefenceClient])
			DefenceClient^=2;
	}
	else
		DefenceClient=ClientNo^1;

#ifdef PM_DEBUG
	if(FightType&FIGHT_TYPE_SAFARI)
		AIWT->AI_THINK_BIT=AI_THINK_BIT_SAFARI;
	else if(FightType&FIGHT_TYPE_MV_POKE)
		AIWT->AI_THINK_BIT=AI_THINK_BIT_MV_POKE;
	else if(FightType&FIGHT_TYPE_GUIDE)
		AIWT->AI_THINK_BIT=AI_THINK_BIT_GUIDE;		//とりあえずガイドバトルだけ
	else if(FightType&(FIGHT_TYPE_BATTLE_TOWER|FIGHT_TYPE_CARD_E))
		AIWT->AI_THINK_BIT=0x07;
	else if(FieldTrainerID==ORUSUBAN_TRAINER)
		AIWT->AI_THINK_BIT=0x07;
	else
		AIWT->AI_THINK_BIT=TD[FieldTrainerID].aitbl;

	if(DebugFightFlag&DEBUG_FIGHT_AI_DEBUG)
			AIWT->AI_THINK_BIT=AIBitWork;
#else
	if(FightType&FIGHT_TYPE_SAFARI)
		AIWT->AI_THINK_BIT=AI_THINK_BIT_SAFARI;
	else if(FightType&FIGHT_TYPE_MV_POKE)
		AIWT->AI_THINK_BIT=AI_THINK_BIT_MV_POKE;
	else if(FightType&FIGHT_TYPE_GUIDE)
		AIWT->AI_THINK_BIT=AI_THINK_BIT_GUIDE;		//とりあえずガイドバトルだけ
	else
		AIWT->AI_THINK_BIT=TD[FieldTrainerID].aitbl;
#endif

}

u8		WazaAIMain(void)
{
	int	i;
	u8	point[4];
	u8	poswork[4];
	u8	poscnt;
	u8	pos;

	WazaNoStock();

	while(AIWT->AI_THINK_BIT){
		if(AIWT->AI_THINK_BIT&1){
			AIWT->AI_SEQNO=AI_SEQ_THINK_INIT;
			WazaAISequence();
		}
		AIWT->AI_THINK_BIT=AIWT->AI_THINK_BIT>>1;
		AIWT->AI_THINK_NO++;
		AIWT->AI_WAZAPOS=0;
	}
	if(AIWT->AI_STATUSFLAG&AI_STATUSFLAG_ESCAPE)
		pos=AI_ENEMY_ESCAPE;
	else if(AIWT->AI_STATUSFLAG&AI_STATUSFLAG_SAFARI)
		pos=AI_ENEMY_SAFARI;
	else{
		poscnt=1;
		point[0]=AIWT->AI_WAZAPOINT[0];
		poswork[0]=0;
		for(i=1;i<4;i++){
			if(point[0]<AIWT->AI_WAZAPOINT[i]){
				poscnt=1;
				point[0]=AIWT->AI_WAZAPOINT[i];
				poswork[0]=i;
			}
			if(point[0]==AIWT->AI_WAZAPOINT[i]){
				point[poscnt]=AIWT->AI_WAZAPOINT[i];
				poswork[poscnt++]=i;
			}
		}
		pos=poswork[pp_rand()%poscnt];
	}
	return pos;
}

void	WazaAISequence(void)
{
	while(AIWT->AI_SEQNO!=AI_SEQ_END){
		switch(AIWT->AI_SEQNO){
			case AI_SEQ_THINK_INIT:
				AISeqAdrs=(u8 *)TrainerAITbl[AIWT->AI_THINK_NO];
				if(PSP[AttackClient].pp[AIWT->AI_WAZAPOS]==0)
					AIWT->AI_WAZANO=0;
				else
					AIWT->AI_WAZANO=PSP[AttackClient].waza[AIWT->AI_WAZAPOS];
				AIWT->AI_SEQNO++;
				break;
			case AI_SEQ_THINK:
				if(AIWT->AI_WAZANO!=0)
					AISequenceTbl[*AISeqAdrs]();
				else{
					AIWT->AI_WAZAPOINT[AIWT->AI_WAZAPOS]=0;
					AIWT->AI_STATUSFLAG|=AI_STATUSFLAG_END;
				}
				if(AIWT->AI_STATUSFLAG&AI_STATUSFLAG_END){
					AIWT->AI_WAZAPOS++;
					if((AIWT->AI_WAZAPOS<4)&&((AIWT->AI_STATUSFLAG&AI_STATUSFLAG_FINISH)==0)){
						AIWT->AI_SEQNO=AI_SEQ_THINK_INIT;
//						AIWT->AI_WAZAPOS=0;
					}
					else
						AIWT->AI_SEQNO++;
					AIWT->AI_STATUSFLAG&=AI_STATUSFLAG_END_OFF;
				}
				break;
			case AI_SEQ_END:
				break;
		}
	}
}

void	WazaNoStock(void)
{
	int	i;

	for(i=0;i<8;i++){
		if(AIWT2->AI_DEFENCE_USE_WAZA[DefenceClient>>1][i]==0){
			AIWT2->AI_DEFENCE_USE_WAZA[DefenceClient>>1][i]=
				WazaNoUse[DefenceClient];
			break;
		}
	}
}

void	WazaNoStockClear(u8 clientno)
{
	int	i;

	for(i=0;i<8;i++)
		AIWT2->AI_DEFENCE_USE_WAZA[clientno>>1][i]=0;
}

void	TokusyuNoSet(u8 clientno,u8 tokusyuno)
{
	if(MineEnemyCheck(clientno)==SIDE_MINE)
		AIWT2->AI_TOKUSYUNO[ClientTypeGet(clientno)&1]=tokusyuno;
}

void	SoubiItemSet(u8 clientno,u8 eqp)
{
	if(MineEnemyCheck(clientno)==SIDE_MINE)
		AIWT2->AI_SOUBIITEM[ClientTypeGet(clientno)&1]=eqp;
}

//--------------------- AIコマンドルーチン群 ------------------------

//------------------------------------------------------------
//	ランダム分岐
//------------------------------------------------------------

//IF_RND_UNDER		value,adrs
void	AI_IF_RND_UNDER(void)
{
	if((pp_rand()%256)<AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//IF_RND_OVER			value,adrs
void	AI_IF_RND_OVER(void)
{
	if((pp_rand()%256)>AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//IF_RND_EQUAL		value,adrs
void	AI_IF_RND_EQUAL(void)
{
	if((pp_rand()%256)==AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//IFN_RND_EQUAL		value,adrs
void	AI_IFN_RND_EQUAL(void)
{
	if((pp_rand()%256)!=AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//------------------------------------------------------------
//	ポイント加減算
//------------------------------------------------------------

//INCDEC				value
void	AI_INCDEC(void)
{
	AIWT->AI_WAZAPOINT[AIWT->AI_WAZAPOS]+=(s8)(AISeqAdrs[1]);
	if(AIWT->AI_WAZAPOINT[AIWT->AI_WAZAPOS]<0)
		AIWT->AI_WAZAPOINT[AIWT->AI_WAZAPOS]=0;
	AISeqAdrs+=2;
}

//------------------------------------------------------------
//	HPでの分岐
//------------------------------------------------------------

//IF_HP_UNDER			side,value,adrs
void	AI_IF_HP_UNDER(void)
{
	u8	clientno;
	u32	hp;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	hp=PSP[clientno].hp*100/PSP[clientno].hpmax;

	if(hp<AISeqAdrs[2])
		AISeqAdrs=(u8 *)((AISeqAdrs[3]<< 0)|
						 (AISeqAdrs[4]<< 8)|
						 (AISeqAdrs[5]<<16)|
						 (AISeqAdrs[6]<<24));
	else
		AISeqAdrs+=7;
}

//IF_HP_OVER			side,value,adrs
void	AI_IF_HP_OVER(void)
{
	u8	clientno;
	u32	hp;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	hp=PSP[clientno].hp*100/PSP[clientno].hpmax;

	if(hp>AISeqAdrs[2])
		AISeqAdrs=(u8 *)((AISeqAdrs[3]<< 0)|
						 (AISeqAdrs[4]<< 8)|
						 (AISeqAdrs[5]<<16)|
						 (AISeqAdrs[6]<<24));
	else
		AISeqAdrs+=7;
}

//IF_HP_EQUAL			side,value,adrs
void	AI_IF_HP_EQUAL(void)
{
	u8	clientno;
	u32	hp;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	hp=PSP[clientno].hp*100/PSP[clientno].hpmax;

	if(hp==AISeqAdrs[2])
		AISeqAdrs=(u8 *)((AISeqAdrs[3]<< 0)|
						 (AISeqAdrs[4]<< 8)|
						 (AISeqAdrs[5]<<16)|
						 (AISeqAdrs[6]<<24));
	else
		AISeqAdrs+=7;
}

//IFN_HP_EQUAL			side,value,adrs
void	AI_IFN_HP_EQUAL(void)
{
	u8	clientno;
	u32	hp;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	hp=PSP[clientno].hp*100/PSP[clientno].hpmax;

	if(hp!=AISeqAdrs[2])
		AISeqAdrs=(u8 *)((AISeqAdrs[3]<< 0)|
						 (AISeqAdrs[4]<< 8)|
						 (AISeqAdrs[5]<<16)|
						 (AISeqAdrs[6]<<24));
	else
		AISeqAdrs+=7;
}

//------------------------------------------------------------
//	状態異常をチェック
//------------------------------------------------------------
//IF_COND				side,condition,adrs
void	AI_IF_COND(void)
{
	u8	clientno;
	u32	condition;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	condition=(AISeqAdrs[2]<< 0)|
			  (AISeqAdrs[3]<< 8)|
			  (AISeqAdrs[4]<<16)|
			  (AISeqAdrs[5]<<24);

	if(PSP[clientno].condition&condition)
		AISeqAdrs=(u8 *)((AISeqAdrs[6]<< 0)|
						 (AISeqAdrs[7]<< 8)|
						 (AISeqAdrs[8]<<16)|
						 (AISeqAdrs[9]<<24));
	else
		AISeqAdrs+=10;
}

//IFN_COND				side,condition,adrs
void	AI_IFN_COND(void)
{
	u8	clientno;
	u32	condition;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	condition=(AISeqAdrs[2]<< 0)|
			  (AISeqAdrs[3]<< 8)|
			  (AISeqAdrs[4]<<16)|
			  (AISeqAdrs[5]<<24);

	if((PSP[clientno].condition&condition)==0)
		AISeqAdrs=(u8 *)((AISeqAdrs[6]<< 0)|
						 (AISeqAdrs[7]<< 8)|
						 (AISeqAdrs[8]<<16)|
						 (AISeqAdrs[9]<<24));
	else
		AISeqAdrs+=10;
}

//IF_COND2			side,condition,adrs
void	AI_IF_COND2(void)
{
	u8	clientno;
	u32	condition;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	condition=(AISeqAdrs[2]<< 0)|
			  (AISeqAdrs[3]<< 8)|
			  (AISeqAdrs[4]<<16)|
			  (AISeqAdrs[5]<<24);

	if(PSP[clientno].condition2&condition)
		AISeqAdrs=(u8 *)((AISeqAdrs[6]<< 0)|
						 (AISeqAdrs[7]<< 8)|
						 (AISeqAdrs[8]<<16)|
						 (AISeqAdrs[9]<<24));
	else
		AISeqAdrs+=10;
}

//IFN_COND2			side,condition,adrs
void	AI_IFN_COND2(void)
{
	u8	clientno;
	u32	condition;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	condition=(AISeqAdrs[2]<< 0)|
			  (AISeqAdrs[3]<< 8)|
			  (AISeqAdrs[4]<<16)|
			  (AISeqAdrs[5]<<24);

	if((PSP[clientno].condition2&condition)==0)
		AISeqAdrs=(u8 *)((AISeqAdrs[6]<< 0)|
						 (AISeqAdrs[7]<< 8)|
						 (AISeqAdrs[8]<<16)|
						 (AISeqAdrs[9]<<24));
	else
		AISeqAdrs+=10;
}

//IF_WAZAKOUKA		side,condition,adrs
void	AI_IF_WAZAKOUKA(void)
{
	u8	clientno;
	u32	condition;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	condition=(AISeqAdrs[2]<< 0)|
			  (AISeqAdrs[3]<< 8)|
			  (AISeqAdrs[4]<<16)|
			  (AISeqAdrs[5]<<24);

	if(WazaKouka[clientno]&condition)
		AISeqAdrs=(u8 *)((AISeqAdrs[6]<< 0)|
						 (AISeqAdrs[7]<< 8)|
						 (AISeqAdrs[8]<<16)|
						 (AISeqAdrs[9]<<24));
	else
		AISeqAdrs+=10;
}

//IFN_WAZAKOUKA		side,condition,adrs
void	AI_IFN_WAZAKOUKA(void)
{
	u8	clientno;
	u32	condition;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	condition=(AISeqAdrs[2]<< 0)|
			  (AISeqAdrs[3]<< 8)|
			  (AISeqAdrs[4]<<16)|
			  (AISeqAdrs[5]<<24);

	if((WazaKouka[clientno]&condition)==0)
		AISeqAdrs=(u8 *)((AISeqAdrs[6]<< 0)|
						 (AISeqAdrs[7]<< 8)|
						 (AISeqAdrs[8]<<16)|
						 (AISeqAdrs[9]<<24));
	else
		AISeqAdrs+=10;
}

//IF_SIDE_CONDITION		side,condition,adrs

void	AI_IF_SIDE_CONDITION(void)
{
	u8	clientno;
	u8	dir;
	u32	condition;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	dir=ClientTypeGet(clientno)&1;

	condition=(AISeqAdrs[2]<< 0)|
			  (AISeqAdrs[3]<< 8)|
			  (AISeqAdrs[4]<<16)|
			  (AISeqAdrs[5]<<24);

	if(SideCondition[dir]&condition)
		AISeqAdrs=(u8 *)((AISeqAdrs[6]<< 0)|
						 (AISeqAdrs[7]<< 8)|
						 (AISeqAdrs[8]<<16)|
						 (AISeqAdrs[9]<<24));
	else
		AISeqAdrs+=10;
}

//IFN_SIDE_CONDITION	side,condition,adrs
void	AI_IFN_SIDE_CONDITION(void)
{
	u8	clientno;
	u8	dir;
	u32	condition;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	dir=ClientTypeGet(clientno)&1;

	condition=(AISeqAdrs[2]<< 0)|
			  (AISeqAdrs[3]<< 8)|
			  (AISeqAdrs[4]<<16)|
			  (AISeqAdrs[5]<<24);

	if((SideCondition[dir]&condition)==0)
		AISeqAdrs=(u8 *)((AISeqAdrs[6]<< 0)|
						 (AISeqAdrs[7]<< 8)|
						 (AISeqAdrs[8]<<16)|
						 (AISeqAdrs[9]<<24));
	else
		AISeqAdrs+=10;
}

//------------------------------------------------------------
//	計算結果による分岐
//------------------------------------------------------------

//IF_UNDER			value,adrs
void	AI_IF_UNDER(void)
{
	if(AIWT->AI_CALC_WORK<AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//IF_OVER				value,adrs
void	AI_IF_OVER(void)
{
	if(AIWT->AI_CALC_WORK>AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//IF_EQUAL			value,adrs
void	AI_IF_EQUAL(void)
{
	if(AIWT->AI_CALC_WORK==AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//IFN_EQUAL			value,adrs
void	AI_IFN_EQUAL(void)
{
	if(AIWT->AI_CALC_WORK!=AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//------------------------------------------------------------
//	計算結果による分岐
//------------------------------------------------------------

//IF_UNDER_ADRS		adrs1,adrs2
void	AI_IF_UNDER_ADRS(void)
{
	u8	*work;

	work=(u8 *)((AISeqAdrs[1]<< 0)|
				(AISeqAdrs[2]<< 8)|
				(AISeqAdrs[3]<<16)|
				(AISeqAdrs[4]<<24));

	if(AIWT->AI_CALC_WORK<work[0])
		AISeqAdrs=(u8 *)((AISeqAdrs[5]<< 0)|
						 (AISeqAdrs[6]<< 8)|
						 (AISeqAdrs[7]<<16)|
						 (AISeqAdrs[8]<<24));
	else
		AISeqAdrs+=9;
}

//IF_OVER_ADRS		adrs1,adrs2
void	AI_IF_OVER_ADRS(void)
{
	u8	*work;

	work=(u8 *)((AISeqAdrs[1]<< 0)|
				(AISeqAdrs[2]<< 8)|
				(AISeqAdrs[3]<<16)|
				(AISeqAdrs[4]<<24));

	if(AIWT->AI_CALC_WORK>work[0])
		AISeqAdrs=(u8 *)((AISeqAdrs[5]<< 0)|
						 (AISeqAdrs[6]<< 8)|
						 (AISeqAdrs[7]<<16)|
						 (AISeqAdrs[8]<<24));
	else
		AISeqAdrs+=9;
}

//IF_EQUAL_ADRS		adrs1,adrs2
void	AI_IF_EQUAL_ADRS(void)
{
	u8	*work;

	work=(u8 *)((AISeqAdrs[1]<< 0)|
				(AISeqAdrs[2]<< 8)|
				(AISeqAdrs[3]<<16)|
				(AISeqAdrs[4]<<24));

	if(AIWT->AI_CALC_WORK==work[0])
		AISeqAdrs=(u8 *)((AISeqAdrs[5]<< 0)|
						 (AISeqAdrs[6]<< 8)|
						 (AISeqAdrs[7]<<16)|
						 (AISeqAdrs[8]<<24));
	else
		AISeqAdrs+=9;
}

//IFN_EQUAL_ADRS		adrs1,adrs2
void	AI_IFN_EQUAL_ADRS(void)
{
	u8	*work;

	work=(u8 *)((AISeqAdrs[1]<< 0)|
				(AISeqAdrs[2]<< 8)|
				(AISeqAdrs[3]<<16)|
				(AISeqAdrs[4]<<24));

	if(AIWT->AI_CALC_WORK!=work[0])
		AISeqAdrs=(u8 *)((AISeqAdrs[5]<< 0)|
						 (AISeqAdrs[6]<< 8)|
						 (AISeqAdrs[7]<<16)|
						 (AISeqAdrs[8]<<24));
	else
		AISeqAdrs+=9;
}

//------------------------------------------------------------
//	技ナンバーのチェック（今の技ナンバーをワークに入れる）
//------------------------------------------------------------

//IF_WAZANO		wazano,adrs
void	AI_IF_WAZANO(void)
{
	u16	wazano;

	wazano=AISeqAdrs[1]|(AISeqAdrs[2]<<8);

	if(AIWT->AI_WAZANO==wazano)
		AISeqAdrs=(u8 *)((AISeqAdrs[3]<< 0)|
						 (AISeqAdrs[4]<< 8)|
						 (AISeqAdrs[5]<<16)|
						 (AISeqAdrs[6]<<24));
	else
		AISeqAdrs+=7;
}

//IFN_WAZANO	wazano,adrs
void	AI_IFN_WAZANO(void)
{
	u16	wazano;

	wazano=AISeqAdrs[1]|(AISeqAdrs[2]<<8);

	if(AIWT->AI_WAZANO!=wazano)
		AISeqAdrs=(u8 *)((AISeqAdrs[3]<< 0)|
						 (AISeqAdrs[4]<< 8)|
						 (AISeqAdrs[5]<<16)|
						 (AISeqAdrs[6]<<24));
	else
		AISeqAdrs+=7;
}

//------------------------------------------------------------
//	指定されたテーブルを参照して一致、不一致で分岐
//------------------------------------------------------------

//IF_TABLE_1BYTE_JUMP		tableadrs,jumpadrs	
void	AI_IF_TABLE_1BYTE_JUMP(void)
{
	u8	*data;

	data=(u8 *)((AISeqAdrs[1]<< 0)|
				(AISeqAdrs[2]<< 8)|
				(AISeqAdrs[3]<<16)|
				(AISeqAdrs[4]<<24));

	while(*data!=0xff){
		if(AIWT->AI_CALC_WORK==*data){
			AISeqAdrs=(u8 *)((AISeqAdrs[5]<< 0)|
							 (AISeqAdrs[6]<< 8)|
							 (AISeqAdrs[7]<<16)|
							 (AISeqAdrs[8]<<24));
			return;
		}
		data++;
	}
	AISeqAdrs+=9;
}

//IFN_TABLE_1BYTE_JUMP	tableadrs,jumpadrs
void	AI_IFN_TABLE_1BYTE_JUMP(void)
{
	u8	*data;

	data=(u8 *)((AISeqAdrs[1]<< 0)|
				(AISeqAdrs[2]<< 8)|
				(AISeqAdrs[3]<<16)|
				(AISeqAdrs[4]<<24));

	while(*data!=0xff){
		if(AIWT->AI_CALC_WORK==*data){
			AISeqAdrs+=9;
			return;
		}
		data++;
	}
	AISeqAdrs=(u8 *)((AISeqAdrs[5]<< 0)|
					 (AISeqAdrs[6]<< 8)|
					 (AISeqAdrs[7]<<16)|
					 (AISeqAdrs[8]<<24));
}

//IF_TABLE_2BYTE_JUMP		tableadrs,jumpadrs
void	AI_IF_TABLE_2BYTE_JUMP(void)
{
	u16	*data;

	data=(u16 *)((AISeqAdrs[1]<< 0)|
				 (AISeqAdrs[2]<< 8)|
				 (AISeqAdrs[3]<<16)|
				 (AISeqAdrs[4]<<24));

	while(*data!=0xffff){
		if(AIWT->AI_CALC_WORK==*data){
			AISeqAdrs=(u8 *)((AISeqAdrs[5]<< 0)|
							 (AISeqAdrs[6]<< 8)|
							 (AISeqAdrs[7]<<16)|
							 (AISeqAdrs[8]<<24));
			return;
		}
		data++;
	}
	AISeqAdrs+=9;
}

//IFN_TABLE_2BYTE_JUMP	tableadrs,jumpadrs
void	AI_IFN_TABLE_2BYTE_JUMP(void)
{
	u16	*data;

	data=(u16 *)((AISeqAdrs[1]<< 0)|
				 (AISeqAdrs[2]<< 8)|
				 (AISeqAdrs[3]<<16)|
				 (AISeqAdrs[4]<<24));

	while(*data!=0xffff){
		if(AIWT->AI_CALC_WORK==*data){
			AISeqAdrs+=9;
			return;
		}
		data++;
	}
	AISeqAdrs=(u8 *)((AISeqAdrs[5]<< 0)|
					 (AISeqAdrs[6]<< 8)|
					 (AISeqAdrs[7]<<16)|
					 (AISeqAdrs[8]<<24));
}

//------------------------------------------------------------
//	自分がダメージ技をもっているかチェックして分岐
//------------------------------------------------------------

void	AI_IF_HAVE_DAMAGE_WAZA(void)
{
	int	i;

	for(i=0;i<4;i++){
		if((PSP[AttackClient].waza[i]!=0)&&(WTD[PSP[AttackClient].waza[i]].damage))
			break;
	}

	if(i==4)
		AISeqAdrs+=5;
	else
		AISeqAdrs=(u8 *)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
}

void	AI_IFN_HAVE_DAMAGE_WAZA(void)
{
	int	i;

	for(i=0;i<4;i++){
		if((PSP[AttackClient].waza[i]!=0)&&(WTD[PSP[AttackClient].waza[i]].damage))
			break;
	}

	if(i!=4)
		AISeqAdrs+=5;
	else
		AISeqAdrs=(u8 *)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
}

//------------------------------------------------------------
//	ターンのチェック（今何ターン目かをワークに入れる）
//------------------------------------------------------------

//CHECK_TURN
void	AI_CHECK_TURN(void)
{
	AIWT->AI_CALC_WORK=FTW.FightTurn;
	AISeqAdrs++;
}

//------------------------------------------------------------
//	タイプのチェック(ポケモンあるいは技のタイプをワークに入れる）
//------------------------------------------------------------

//CHECK_TYPE			side
void	AI_CHECK_TYPE(void)
{
	switch(AISeqAdrs[1]){
		case	CHECK_ATTACK_TYPE1:
			AIWT->AI_CALC_WORK=PSP[AttackClient].type1;
			break;
		case	CHECK_DEFENCE_TYPE1:
			AIWT->AI_CALC_WORK=PSP[DefenceClient].type1;
			break;
		case	CHECK_ATTACK_TYPE2:
			AIWT->AI_CALC_WORK=PSP[AttackClient].type2;
			break;
		case	CHECK_DEFENCE_TYPE2:
			AIWT->AI_CALC_WORK=PSP[DefenceClient].type2;
			break;
		case	CHECK_WAZA:
			AIWT->AI_CALC_WORK=WTD[AIWT->AI_WAZANO].wazatype;
			break;
	}
	AISeqAdrs+=2;
}

//------------------------------------------------------------
//	攻撃技かどうかのチェック（技の威力をワークに入れる)
//------------------------------------------------------------

//CHECK_IRYOKU
void	AI_CHECK_IRYOKU(void)
{
	AIWT->AI_CALC_WORK=WTD[AIWT->AI_WAZANO].damage;
	AISeqAdrs++;
}

//------------------------------------------------------------
//	威力が一番高いかのチェック
//------------------------------------------------------------

const u16	NoCompPowerSeqNo[]={
	7,
	8,
	39,
	75,
	80,
	145,
	151,
	161,
	170,
	182,
	190,
	204,
	0xffff,
};

//COMP_POWER
void	AI_COMP_POWER(void)
{
	int	i=0,j;
	s32	damage[4];

	j=0;
	while(NoCompPowerSeqNo[j]!=0xffff){
		if(WTD[AIWT->AI_WAZANO].battleeffect==NoCompPowerSeqNo[j])
			break;
		j++;
	}

	if((WTD[AIWT->AI_WAZANO].damage>1)&&(NoCompPowerSeqNo[j]==0xffff)){
		DamagePowWork=0;
		UserWork[DAMAGE_TYPE_WORK]=0;
		UserWork[DAMAGE_VALUE]=1;
		WazaStatusFlag=0;
		CriticalValue=1;

		for(i=0;i<4;i++){
			j=0;
			while(NoCompPowerSeqNo[j]!=0xffff){
				if(WTD[PSP[AttackClient].waza[i]].battleeffect==NoCompPowerSeqNo[j])
				break;
				j++;
			}
			if((PSP[AttackClient].waza[i]!=0)&&
			   (NoCompPowerSeqNo[j]==0xffff)&&
			   (WTD[PSP[AttackClient].waza[i]].damage>1)){
				WazaNo=PSP[AttackClient].waza[i];
				DamageCalcAct(AttackClient,DefenceClient);
				TypeCheckAct(WazaNo,AttackClient,DefenceClient);
				damage[i]=WazaDamage*AIWT->AI_DAMAGELOSS[i]/100;
				if(damage[i]==0)
					damage[i]=1;
			}
			else
				damage[i]=0;
		}
		for(i=0;i<4;i++){
			if(damage[i]>damage[AIWT->AI_WAZAPOS]) break;
		}
		if(i==4)
			AIWT->AI_CALC_WORK=COMP_POWER_TOP;
		else
			AIWT->AI_CALC_WORK=COMP_POWER_NOTOP;
	}
	else
		AIWT->AI_CALC_WORK=COMP_POWER_NONE;
	
	AISeqAdrs++;
}

//------------------------------------------------------------
//	前のターンに使った技のチェック（技のナンバーをワークに入れる）
//------------------------------------------------------------

//CHECK_LAST_WAZA	side
void	AI_CHECK_LAST_WAZA(void)
{
	if(AISeqAdrs[1]==CHECK_ATTACK)
		AIWT->AI_CALC_WORK=WazaNoUse[AttackClient];
	else
		AIWT->AI_CALC_WORK=WazaNoUse[DefenceClient];

	AISeqAdrs+=2;
}

//------------------------------------------------------------
//	格納された技のタイプチェック
//------------------------------------------------------------

//IF_WAZA_TYPE		type,adrs
void	AI_IF_WAZA_TYPE(void)
{
	if(AISeqAdrs[1]==AIWT->AI_CALC_WORK)
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//IFN_WAZA_TYPE		type,adrs
void	AI_IFN_WAZA_TYPE(void)
{
	if(AISeqAdrs[1]!=AIWT->AI_CALC_WORK)
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//------------------------------------------------------------
//	どちらが先行かのチェック
//------------------------------------------------------------

//IF_FIRST			side,adrs
void	AI_IF_FIRST(void)
{
	if(AgiCalc(AttackClient,DefenceClient,1)==AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//IFN_FIRST			side,adrs
void	AI_IFN_FIRST(void)
{
	if(AgiCalc(AttackClient,DefenceClient,1)!=AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//------------------------------------------------------------
//	持っている技のオールチェックループ
//------------------------------------------------------------

//ALL_WAZA_CHECK			//ループの開始
void	AI_ALL_WAZA_CHECK(void)
{
}

//WAZA_LOOP				//ループ地点
void	AI_WAZA_LOOP(void)
{
}

//------------------------------------------------------------
//	控えが何体いるかチェック（数をワークに入れる）
//------------------------------------------------------------

//CHECK_BENCH_COUNT			side
void	AI_CHECK_BENCH_COUNT(void)
{
	int	i;
	u8	clientno;
	PokemonParam	*PP;
	u8	sel1,sel2;

	AIWT->AI_CALC_WORK=0;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	if(MineEnemyCheck(clientno)==SIDE_MINE)
		PP=&PokeParaMine[0];
	else
		PP=&PokeParaEnemy[0];

	if(FightType&FIGHT_TYPE_2vs2){
		sel1=SelMonsNo[clientno];
		sel2=SelMonsNo[ClientNoGet(ClientTypeGet(clientno)^2)];
	}
	else
		sel1=sel2=SelMonsNo[clientno];

	for(i=0;i<6;i++){
		if((i!=sel1)&&
		   (i!=sel2)&&
		   (PokeParaGet(&PP[i],ID_hp)!=0)&&
		   (PokeParaGet(&PP[i],ID_monsno_egg)!=0)&&
		   (PokeParaGet(&PP[i],ID_monsno_egg)!=MONSNO_TAMAGO))
			AIWT->AI_CALC_WORK++;
	}
	AISeqAdrs+=2;
}

//------------------------------------------------------------
//	現在の技ナンバーのチェック
//------------------------------------------------------------

//CHECK_WAZANO
void	AI_CHECK_WAZANO(void)
{
	AIWT->AI_CALC_WORK=AIWT->AI_WAZANO;
	AISeqAdrs++;
}

//------------------------------------------------------------
//	現在の技ナンバーのシーケンスナンバーのチェック
//------------------------------------------------------------

//CHECK_WAZASEQNO
void	AI_CHECK_WAZASEQNO(void)
{
	AIWT->AI_CALC_WORK=WTD[AIWT->AI_WAZANO].battleeffect;
	AISeqAdrs++;
}

//------------------------------------------------------------
//	特殊能力のチェック（特殊能力ナンバーをワークに入れる）
//------------------------------------------------------------

//CHECK_TOKUSYU		side
void	AI_CHECK_TOKUSYU(void)
{
	u8	clientno;
	u8	dir;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	if(MineEnemyCheck(clientno)==SIDE_MINE){
		dir=ClientTypeGet(clientno)&1;
		if(AIWT2->AI_TOKUSYUNO[dir])
			AIWT->AI_CALC_WORK=AIWT2->AI_TOKUSYUNO[dir];
		else{
			if((PSP[clientno].speabino==TOKUSYU_KAGEHUMI)||
			   (PSP[clientno].speabino==TOKUSYU_ZIRYOKU)||
			   (PSP[clientno].speabino==TOKUSYU_ARIZIGOKU))
				AIWT->AI_CALC_WORK=PSP[clientno].speabino;
			else{
				if((PPD[PSP[clientno].monsno].speabi1!=0)&&
				   (PPD[PSP[clientno].monsno].speabi2!=0)){
					if(pp_rand()&1)
						AIWT->AI_CALC_WORK=PPD[PSP[clientno].monsno].speabi1;
					else
						AIWT->AI_CALC_WORK=PPD[PSP[clientno].monsno].speabi2;
				}
				else if(PPD[PSP[clientno].monsno].speabi1)
					AIWT->AI_CALC_WORK=PPD[PSP[clientno].monsno].speabi1;
				else
					AIWT->AI_CALC_WORK=PPD[PSP[clientno].monsno].speabi2;
			}
		}
	}
	else
		AIWT->AI_CALC_WORK=PSP[clientno].speabino;

	AISeqAdrs+=2;
}

//------------------------------------------------------------
//	自分と相手の相性チェック
//------------------------------------------------------------

//CHECK_AISYOU
void	AI_CHECK_AISYOU(void)
{
	int	i;

	DamagePowWork=0;
	UserWork[DAMAGE_TYPE_WORK]=0;
	UserWork[DAMAGE_VALUE]=1;
	WazaStatusFlag=0;
	CriticalValue=1;
	AIWT->AI_CALC_WORK=AISYOU_0BAI;

	for(i=0;i<4;i++){
		WazaDamage=AISYOU_1BAI;
		WazaNo=PSP[AttackClient].waza[i];
		if(WazaNo){
			TypeCheckAct(WazaNo,AttackClient,DefenceClient);
			if(WazaDamage==AISYOU_15BAI*2)
				WazaDamage=AISYOU_2BAI;
			if(WazaDamage==AISYOU_15BAI*4)
				WazaDamage=AISYOU_4BAI;
			if(WazaDamage==AISYOU_15BAI/2)
				WazaDamage=AISYOU_1_2BAI;
			if(WazaDamage==AISYOU_15BAI/4)
				WazaDamage=AISYOU_1_4BAI;
			if(WazaStatusFlag&WAZASTATUSFLAG_KOUKANAI)
				WazaDamage=0;

			if(AIWT->AI_CALC_WORK<WazaDamage)
				AIWT->AI_CALC_WORK=WazaDamage;
		}
	}

	AISeqAdrs++;
}

//------------------------------------------------------------
//	技のタイプと相手の相性をチェック
//------------------------------------------------------------
//CHECK_WAZA_AISYOU
void	AI_CHECK_WAZA_AISYOU(void)
{
	u8	aisyou;

	DamagePowWork=0;
	UserWork[DAMAGE_TYPE_WORK]=0;
	UserWork[DAMAGE_VALUE]=1;
	WazaStatusFlag=0;
	CriticalValue=1;
	WazaDamage=AISYOU_1BAI;
	WazaNo=AIWT->AI_WAZANO;
	TypeCheckAct(WazaNo,AttackClient,DefenceClient);
	if(WazaDamage==AISYOU_15BAI*2)
		WazaDamage=AISYOU_2BAI;
	if(WazaDamage==AISYOU_15BAI*4)
		WazaDamage=AISYOU_4BAI;
	if(WazaDamage==AISYOU_15BAI/2)
		WazaDamage=AISYOU_1_2BAI;
	if(WazaDamage==AISYOU_15BAI/4)
		WazaDamage=AISYOU_1_4BAI;
	if(WazaStatusFlag&WAZASTATUSFLAG_KOUKANAI)
		WazaDamage=0;

	aisyou=WazaDamage;
	if(aisyou==AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//------------------------------------------------------------
//	格納された技が強い技かどうかチェック
//------------------------------------------------------------

//IF_WAZA_STRONG		adrs
void	AI_IF_WAZA_STRONG(void)
{
}

//IFN_WAZA_STRONG		adrs
void	AI_IFN_WAZA_STRONG(void)
{
}

//------------------------------------------------------------
//	控えの状態チェック
//------------------------------------------------------------

//IF_BENCH_COND		side,condition,adrs
void	AI_IF_BENCH_COND(void)
{
	PokemonParam	*PP;
	int	i;
	u8	clientno;
	u32	cond;
	u32	condition;
	u16	monsno;
	u16	hp;

	if(AISeqAdrs[1]==CHECK_ATTACK){
		PP=&PokeParaEnemy[0];
		clientno=AttackClient;
	}
	else{
		PP=&PokeParaMine[0];
		clientno=DefenceClient;
	}

	cond=(AISeqAdrs[2]<< 0)|
		 (AISeqAdrs[3]<< 8)|
		 (AISeqAdrs[4]<<16)|
		 (AISeqAdrs[5]<<24);

	for(i=0;i<6;i++){
		monsno=PokeParaGet(&PP[i],ID_monsno);
		hp=PokeParaGet(&PP[i],ID_hp);
		condition=PokeParaGet(&PP[i],ID_condition);
		if((monsno!=0)&&
		   (monsno!=MONSNO_TAMAGO)&&
		   (hp)&&
		   (condition==cond)){
			AISeqAdrs=(u8 *)((AISeqAdrs[6]<< 0)|
							 (AISeqAdrs[7]<< 8)|
							 (AISeqAdrs[8]<<16)|
							 (AISeqAdrs[9]<<24));
			return;
		}
	}
	AISeqAdrs+=10;
}

//IFN_BENCH_COND		side,condition,adrs
void	AI_IFN_BENCH_COND(void)
{
	PokemonParam	*PP;
	int	i;
	u8	clientno;
	u32	cond;
	u32	condition;
	u16	monsno;
	u16	hp;

	if(AISeqAdrs[1]==CHECK_ATTACK){
		PP=&PokeParaEnemy[0];
		clientno=AttackClient;
	}
	else{
		PP=&PokeParaMine[0];
		clientno=DefenceClient;
	}

	cond=(AISeqAdrs[2]<< 0)|
		 (AISeqAdrs[3]<< 8)|
		 (AISeqAdrs[4]<<16)|
		 (AISeqAdrs[5]<<24);

	for(i=0;i<6;i++){
		monsno=PokeParaGet(&PP[i],ID_monsno);
		hp=PokeParaGet(&PP[i],ID_hp);
		condition=PokeParaGet(&PP[i],ID_condition);
		if((monsno!=0)&&
		   (monsno!=MONSNO_TAMAGO)&&
		   (hp)&&
		   (condition==cond)){
			AISeqAdrs+=10;
		}
	}
	AISeqAdrs=(u8 *)((AISeqAdrs[6]<< 0)|
					 (AISeqAdrs[7]<< 8)|
					 (AISeqAdrs[8]<<16)|
					 (AISeqAdrs[9]<<24));
}

//------------------------------------------------------------
//	天候チェック（天候ナンバーをワークに入れる）
//------------------------------------------------------------

//CHECK_WEATHER
void	AI_CHECK_WEATHER(void)
{
	if(FieldCondition&FIELD_CONDITION_AMEHURI)
		AIWT->AI_CALC_WORK=WEATHER_AME;
	if(FieldCondition&FIELD_CONDITION_SUNAARASHIING)
		AIWT->AI_CALC_WORK=WEATHER_SUNAARASHI;
	if(FieldCondition&FIELD_CONDITION_HIDERING)
		AIWT->AI_CALC_WORK=WEATHER_HARE;
	if(FieldCondition&FIELD_CONDITION_ARARE)
		AIWT->AI_CALC_WORK=WEATHER_ARARE;

	AISeqAdrs++;
}

//------------------------------------------------------------
//	技のシーケンスナンバーをチェックして、分岐
//------------------------------------------------------------

//IF_WAZA_SEQNO_JUMP	seqno,adrs
void	AI_IF_WAZA_SEQNO_JUMP(void)
{
	if(WTD[AIWT->AI_WAZANO].battleeffect==AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//IFN_WAZA_SEQNO_JUMP	seqno,adrs
void	AI_IFN_WAZA_SEQNO_JUMP(void)
{
	if(WTD[AIWT->AI_WAZANO].battleeffect!=AISeqAdrs[1])
		AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs+=6;
}

//------------------------------------------------------------
//	自分や相手のパラメータ変化値を参照して分岐
//------------------------------------------------------------

//IF_PARA_UNDER		side,para,value,adrs
void	AI_IF_PARA_UNDER(void)
{
	u8	clientno;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	if(PSP[clientno].abiritycnt[AISeqAdrs[2]]<AISeqAdrs[3])
		AISeqAdrs=(u8 *)((AISeqAdrs[4]<< 0)|
						 (AISeqAdrs[5]<< 8)|
						 (AISeqAdrs[6]<<16)|
						 (AISeqAdrs[7]<<24));
	else
		AISeqAdrs+=8;
}

//IF_PARA_OVER		side,para,value,adrs
void	AI_IF_PARA_OVER(void)
{
	u8	clientno;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	if(PSP[clientno].abiritycnt[AISeqAdrs[2]]>AISeqAdrs[3])
		AISeqAdrs=(u8 *)((AISeqAdrs[4]<< 0)|
						 (AISeqAdrs[5]<< 8)|
						 (AISeqAdrs[6]<<16)|
						 (AISeqAdrs[7]<<24));
	else
		AISeqAdrs+=8;
}

//IF_PARA_EQUAL		side,para,value,adrs
void	AI_IF_PARA_EQUAL(void)
{
	u8	clientno;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	if(PSP[clientno].abiritycnt[AISeqAdrs[2]]==AISeqAdrs[3])
		AISeqAdrs=(u8 *)((AISeqAdrs[4]<< 0)|
						 (AISeqAdrs[5]<< 8)|
						 (AISeqAdrs[6]<<16)|
						 (AISeqAdrs[7]<<24));
	else
		AISeqAdrs+=8;
}

//IFN_PARA_EQUAL	side,para,value,adrs
void	AI_IFN_PARA_EQUAL(void)
{
	u8	clientno;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	if(PSP[clientno].abiritycnt[AISeqAdrs[2]]!=AISeqAdrs[3])
		AISeqAdrs=(u8 *)((AISeqAdrs[4]<< 0)|
						 (AISeqAdrs[5]<< 8)|
						 (AISeqAdrs[6]<<16)|
						 (AISeqAdrs[7]<<24));
	else
		AISeqAdrs+=8;
}

//------------------------------------------------------------
//	技のダメージ計算をして相手が瀕死になるかチェックして分岐
//------------------------------------------------------------

//IF_WAZA_HINSHI		adrs
void	AI_IF_WAZA_HINSHI(void)
{
	if(WTD[AIWT->AI_WAZANO].damage>1){
		DamagePowWork=0;
		UserWork[DAMAGE_TYPE_WORK]=0;
		UserWork[DAMAGE_VALUE]=1;
		WazaStatusFlag=0;
		CriticalValue=1;
		WazaNo=AIWT->AI_WAZANO;
		DamageCalcAct(AttackClient,DefenceClient);
		TypeCheckAct(WazaNo,AttackClient,DefenceClient);
		WazaDamage=WazaDamage*AIWT->AI_DAMAGELOSS[AIWT->AI_WAZAPOS]/100;
		if(WazaDamage==0)
			WazaDamage=1;
		if(PSP[DefenceClient].hp<=WazaDamage)
			AISeqAdrs=(u8 *)((AISeqAdrs[1]<< 0)|
							 (AISeqAdrs[2]<< 8)|
							 (AISeqAdrs[3]<<16)|
							 (AISeqAdrs[4]<<24));
		else
			AISeqAdrs+=5;
	}
	else
		AISeqAdrs+=5;
}

//IFN_WAZA_HINSHI		adrs
void	AI_IFN_WAZA_HINSHI(void)
{
	if(WTD[AIWT->AI_WAZANO].damage>1){
		DamagePowWork=0;
		UserWork[DAMAGE_TYPE_WORK]=0;
		UserWork[DAMAGE_VALUE]=1;
		WazaStatusFlag=0;
		CriticalValue=1;
		WazaNo=AIWT->AI_WAZANO;
		DamageCalcAct(AttackClient,DefenceClient);
		TypeCheckAct(WazaNo,AttackClient,DefenceClient);
		WazaDamage=WazaDamage*AIWT->AI_DAMAGELOSS[AIWT->AI_WAZAPOS]/100;
		if(PSP[DefenceClient].hp>WazaDamage)
			AISeqAdrs=(u8 *)((AISeqAdrs[1]<< 0)|
							 (AISeqAdrs[2]<< 8)|
							 (AISeqAdrs[3]<<16)|
							 (AISeqAdrs[4]<<24));
		else
			AISeqAdrs+=5;
	}
	else
		AISeqAdrs+=5;
}

//------------------------------------------------------------
//	特定の技を持っているかのチェックをして分岐
//------------------------------------------------------------
//IF_HAVE_WAZA		side,wazano,adrs
void	AI_IF_HAVE_WAZA(void)
{
	int	i;
	u16	*wazano;

	wazano=(u16 *)&AISeqAdrs[2];

	switch(AISeqAdrs[1]){
		case CHECK_ATTACK:
//		case CHECK_ATTACK_TYPE1:
		case CHECK_ATTACK_TYPE2:
			for(i=0;i<4;i++){
				if(PSP[AttackClient].waza[i]==*wazano)
					break;
			}
			if(i==4)
				AISeqAdrs+=8;
			else
				AISeqAdrs=(u8 *)((AISeqAdrs[4]<< 0)|
								 (AISeqAdrs[5]<< 8)|
								 (AISeqAdrs[6]<<16)|
								 (AISeqAdrs[7]<<24));
			break;
		case CHECK_DEFENCE:
//		case CHECK_DEFENCE_TYPE1:
		case CHECK_DEFENCE_TYPE2:
			for(i=0;i<8;i++){
				if(AIWT2->AI_DEFENCE_USE_WAZA[DefenceClient>>1][i]==*wazano)
					break;
			}
			if(i==8)
				AISeqAdrs+=8;
			else
				AISeqAdrs=(u8 *)((AISeqAdrs[4]<< 0)|
								 (AISeqAdrs[5]<< 8)|
								 (AISeqAdrs[6]<<16)|
								 (AISeqAdrs[7]<<24));
			break;
	}
}

//IFN_HAVE_WAZA		side,wazano,adrs
void	AI_IFN_HAVE_WAZA(void)
{
	int	i;
	u16	*wazano;

	wazano=(u16 *)&AISeqAdrs[2];

	switch(AISeqAdrs[1]){
		case CHECK_ATTACK:
//		case CHECK_ATTACK_TYPE1:
		case CHECK_ATTACK_TYPE2:
			for(i=0;i<4;i++){
				if(PSP[AttackClient].waza[i]==*wazano)
					break;
			}
			if(i!=4)
				AISeqAdrs+=8;
			else
				AISeqAdrs=(u8 *)((AISeqAdrs[4]<< 0)|
								 (AISeqAdrs[5]<< 8)|
								 (AISeqAdrs[6]<<16)|
								 (AISeqAdrs[7]<<24));
			break;
		case CHECK_DEFENCE:
//		case CHECK_DEFENCE_TYPE1:
		case CHECK_DEFENCE_TYPE2:
			for(i=0;i<8;i++){
				if(AIWT2->AI_DEFENCE_USE_WAZA[DefenceClient>>1][i]==*wazano)
					break;
			}
			if(i!=8)
				AISeqAdrs+=8;
			else
				AISeqAdrs=(u8 *)((AISeqAdrs[4]<< 0)|
								 (AISeqAdrs[5]<< 8)|
								 (AISeqAdrs[6]<<16)|
								 (AISeqAdrs[7]<<24));
			break;
	}
}

//------------------------------------------------------------
//	特定の技シーケンスを持っているかのチェックをして分岐
//------------------------------------------------------------
//IF_HAVE_WAZA_SEQNO		side,seqno,adrs
void	AI_IF_HAVE_WAZA_SEQNO(void)
{
	int	i;

	switch(AISeqAdrs[1]){
		case CHECK_ATTACK:
//		case CHECK_ATTACK_TYPE1:
		case CHECK_ATTACK_TYPE2:
			for(i=0;i<4;i++){
				if((PSP[AttackClient].waza[i]!=0)&&
				   (WTD[PSP[AttackClient].waza[i]].battleeffect==AISeqAdrs[2]))
					break;
			}
			if(i==4)
				AISeqAdrs+=7;
			else
				AISeqAdrs=(u8 *)((AISeqAdrs[3]<< 0)|
								 (AISeqAdrs[4]<< 8)|
								 (AISeqAdrs[5]<<16)|
								 (AISeqAdrs[6]<<24));
			break;
		case CHECK_DEFENCE:
//		case CHECK_DEFENCE_TYPE1:
		case CHECK_DEFENCE_TYPE2:
			for(i=0;i<8;i++){
				if((PSP[AttackClient].waza[i]!=0)&&
				   (WTD[AIWT2->AI_DEFENCE_USE_WAZA[DefenceClient>>1][i]].battleeffect==AISeqAdrs[2]))
					break;
			}
			for(i=0;i<8;i++){
					break;
			}
			if(i==8)
				AISeqAdrs+=7;
			else
				AISeqAdrs=(u8 *)((AISeqAdrs[3]<< 0)|
								 (AISeqAdrs[4]<< 8)|
								 (AISeqAdrs[5]<<16)|
								 (AISeqAdrs[6]<<24));
			break;
	}
}

//IFN_HAVE_WAZA_SEQNO		side,seqno,adrs
void	AI_IFN_HAVE_WAZA_SEQNO(void)
{
	int	i;

	switch(AISeqAdrs[1]){
		case CHECK_ATTACK:
//		case CHECK_ATTACK_TYPE1:
		case CHECK_ATTACK_TYPE2:
			for(i=0;i<4;i++){
				if((PSP[AttackClient].waza[i]!=0)&&
				   (WTD[PSP[AttackClient].waza[i]].battleeffect==AISeqAdrs[2]))
					break;
			}
			if(i!=4)
				AISeqAdrs+=7;
			else
				AISeqAdrs=(u8 *)((AISeqAdrs[3]<< 0)|
								 (AISeqAdrs[4]<< 8)|
								 (AISeqAdrs[5]<<16)|
								 (AISeqAdrs[6]<<24));
			break;
		case CHECK_DEFENCE:
//		case CHECK_DEFENCE_TYPE1:
		case CHECK_DEFENCE_TYPE2:
			for(i=0;i<8;i++){
				if((AIWT2->AI_DEFENCE_USE_WAZA[DefenceClient>>1][i]!=0)&&
				   (WTD[AIWT2->AI_DEFENCE_USE_WAZA[DefenceClient>>1][i]].battleeffect==AISeqAdrs[2]))
					break;
			}
			for(i=0;i<8;i++){
					break;
			}
			if(i!=8)
				AISeqAdrs+=7;
			else
				AISeqAdrs=(u8 *)((AISeqAdrs[3]<< 0)|
								 (AISeqAdrs[4]<< 8)|
								 (AISeqAdrs[5]<<16)|
								 (AISeqAdrs[6]<<24));
			break;
	}
}

//------------------------------------------------------------
//	ポケモンの状態をチェックをして分岐（かなしばりとか、アンコールとか）
//------------------------------------------------------------

//IF_POKE_CHECK_STATE		side,id,adrs
void	AI_IF_POKE_CHECK_STATE(void)
{
	u8	clientno;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	switch(AISeqAdrs[2]){
		case STATE_KANASIBARI:
			if(WKC[clientno].kanashibariwazano)
				AISeqAdrs=(u8 *)((AISeqAdrs[3]<< 0)|
								 (AISeqAdrs[4]<< 8)|
								 (AISeqAdrs[5]<<16)|
								 (AISeqAdrs[6]<<24));
			else
				AISeqAdrs+=7;
			break;
		case STATE_ENCORE:
			if(WKC[clientno].encorewazano)
				AISeqAdrs=(u8 *)((AISeqAdrs[3]<< 0)|
								 (AISeqAdrs[4]<< 8)|
								 (AISeqAdrs[5]<<16)|
								 (AISeqAdrs[6]<<24));
			else
				AISeqAdrs+=7;
			break;
		default:
			AISeqAdrs+=7;
			break;
	}
}

//------------------------------------------------------------
//	技の状態をチェックをして分岐
//------------------------------------------------------------

//IF_WAZA_CHECK_STATE		id,adrs
void	AI_IF_WAZA_CHECK_STATE(void)
{
	switch(AISeqAdrs[1]){
		case STATE_KANASIBARI:
			if(WKC[ClientNo].kanashibariwazano==AIWT->AI_WAZANO)
				AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
								 (AISeqAdrs[3]<< 8)|
								 (AISeqAdrs[4]<<16)|
								 (AISeqAdrs[5]<<24));
			else
				AISeqAdrs+=6;
			break;
		case STATE_ENCORE:
			if(WKC[ClientNo].encorewazano==AIWT->AI_WAZANO)
				AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
								 (AISeqAdrs[3]<< 8)|
								 (AISeqAdrs[4]<<16)|
								 (AISeqAdrs[5]<<24));
			else
				AISeqAdrs+=6;
			break;
		default:
			AISeqAdrs+=6;
			break;
	}
}

//------------------------------------------------------------
//	にげるをせんたく
//------------------------------------------------------------

//ESCAPE
void	AI_ESCAPE(void)
{
	AIWT->AI_STATUSFLAG|=(AI_STATUSFLAG_END|AI_STATUSFLAG_ESCAPE|AI_STATUSFLAG_FINISH);
}

//------------------------------------------------------------
//	サファリゾーンでの逃げる確率を計算して逃げるときのアドレスを指定
//------------------------------------------------------------

//SAFARI_ESCAPE_JUMP
void	AI_SAFARI_ESCAPE_JUMP(void)
{
	u8	rate;
	u8	rnd;
	
	rate=UserWork[SAFARI_ESCAPE_COUNT]*5;
	rnd=pp_rand()%100;

	if(rnd<rate)
		AISeqAdrs=(u8 *)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs+=5;
}

//------------------------------------------------------------
//	サファリゾーンでの特殊アクションを選択
//------------------------------------------------------------

//SAFARI
void	AI_SAFARI(void)
{
	AIWT->AI_STATUSFLAG|=(AI_STATUSFLAG_END|AI_STATUSFLAG_SAFARI|AI_STATUSFLAG_FINISH);
}

//------------------------------------------------------------
//		装備アイテムのチェック
//------------------------------------------------------------

//CHECK_SOUBIITEM		side
void	AI_CHECK_SOUBIITEM(void)
{
	u8	clientno;
	u8	dir;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	if(MineEnemyCheck(clientno)==SIDE_MINE){
		dir=ClientTypeGet(clientno)&1;
		AIWT->AI_CALC_WORK=AIWT2->AI_SOUBIITEM[dir];
	}
	else
		AIWT->AI_CALC_WORK=ItemEquipGet(PSP[clientno].item);

	AISeqAdrs+=2;
}

//------------------------------------------------------------
//		ポケモンの性別のチェック
//------------------------------------------------------------

//CHECK_POKESEX		side
void	AI_CHECK_POKESEX(void)
{
	u8	clientno;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	AIWT->AI_CALC_WORK=PokeSexGetMonsNo(PSP[clientno].monsno,PSP[clientno].personal_rnd);

	AISeqAdrs+=2;
}

//------------------------------------------------------------
//		ねこだましカウンタのチェック
//------------------------------------------------------------

//CHECK_NEKODAMASI	side
void	AI_CHECK_NEKODAMASI(void)
{
	u8	clientno;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	AIWT->AI_CALC_WORK=WKC[clientno].nekodamashicnt;			//ネコだましカウンタ

	AISeqAdrs+=2;
}

//------------------------------------------------------------
//		たくわえるカウンタのチェック
//------------------------------------------------------------

//CHECK_TAKUWAERU		side
void	AI_CHECK_TAKUWAERU(void)
{
	u8	clientno;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	AIWT->AI_CALC_WORK=WKC[clientno].takuwaerucnt;			//たくわえるカウンター

	AISeqAdrs+=2;
}

//------------------------------------------------------------
//		戦闘タイプのチェック
//------------------------------------------------------------

//CHECK_FIGHT_TYPE
void	AI_CHECK_FIGHT_TYPE(void)
{
	AIWT->AI_CALC_WORK=FightType&FIGHT_TYPE_2vs2;
	AISeqAdrs++;
}

//------------------------------------------------------------
//		リサイクルできるアイテムのチェック
//------------------------------------------------------------

//CHECK_RECYCLE_ITEM	side
void	AI_CHECK_RECYCLE_ITEM(void)
{
	u8	clientno;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	AIWT->AI_CALC_WORK=UserWork[RECYCLE_WORK+clientno*2];

	AISeqAdrs+=2;
}

//------------------------------------------------------------
//	ワークに入っている技ナンバーのタイプをチェック
//------------------------------------------------------------

//CHECK_WORKWAZA_TYPE
void	AI_CHECK_WORKWAZA_TYPE(void)
{
	AIWT->AI_CALC_WORK=WTD[AIWT->AI_CALC_WORK].wazatype;
	AISeqAdrs++;
}

//------------------------------------------------------------
//	ワークに入っている技ナンバーの威力をチェック
//------------------------------------------------------------

//CHECK_WORKWAZA_POW
void	AI_CHECK_WORKWAZA_POW(void)
{
	AIWT->AI_CALC_WORK=WTD[AIWT->AI_CALC_WORK].damage;
	AISeqAdrs++;
}

//------------------------------------------------------------
//	ワークに入っている技ナンバーのシーケンスナンバーをチェック
//------------------------------------------------------------

//CHECK_WORKWAZA_SEQNO
void	AI_CHECK_WORKWAZA_SEQNO(void)
{
	AIWT->AI_CALC_WORK=WTD[AIWT->AI_CALC_WORK].battleeffect;
	AISeqAdrs++;
}

//------------------------------------------------------------
//	まもるカウンタをチェック
//------------------------------------------------------------

//CHECK_MAMORU_COUNT		side
void	AI_CHECK_MAMORU_COUNT(void)
{
	u8	clientno;

	if(AISeqAdrs[1]==CHECK_ATTACK)
		clientno=AttackClient;
	else
		clientno=DefenceClient;

	AIWT->AI_CALC_WORK=WKC[clientno].successcnt;

	AISeqAdrs+=2;
}

//------------------------------------------------------------
//	格納アドレスに値を入れる
//------------------------------------------------------------

//SET_VALUE		work,value
void	AI_SET_VALUE(void)
{
}

//SET_WORK		dest,src
void	AI_SET_WORK(void)
{
}

//ADD_VALUE		work,value
void	AI_ADD_VALUE(void)
{
}

//ADD_WORK		dest,src
void	AI_ADD_WORK(void)
{
}

//SUB_VALUE		work,value
void	AI_SUB_VALUE(void)
{
}

//SUB_WORK		dest,src
void	AI_SUB_WORK(void)
{
}

//------------------------------------------------------------
//	汎用的な命令群
//------------------------------------------------------------

void	AI_GOSUB(void)
{
	AIPushAdrsSet(AISeqAdrs+5);
	AISeqAdrs=(u8 *)(AISeqAdrs[1]<< 0|
					 AISeqAdrs[2]<< 8|
					 AISeqAdrs[3]<<16|
					 AISeqAdrs[4]<<24);
}

void	AI_JUMP(void)
{
	AISeqAdrs=(u8 *)((AISeqAdrs[1]<< 0)|
					 (AISeqAdrs[2]<< 8)|
					 (AISeqAdrs[3]<<16)|
					 (AISeqAdrs[4]<<24));
}

void	AI_AIEND(void)
{
	if(AIPopAdrsAct()) return;
	AIWT->AI_STATUSFLAG|=AI_STATUSFLAG_END;
}

//------------------------------------------------------------
//	お互いのレベルをチェックして分岐
//------------------------------------------------------------

//IF_LEVEL		value,adrs
void	AI_IF_LEVEL(void)
{
	switch(AISeqAdrs[1]){
		case LEVEL_ATTACK:
			if(PSP[AttackClient].level>PSP[DefenceClient].level)
				AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
								 (AISeqAdrs[3]<< 8)|
								 (AISeqAdrs[4]<<16)|
								 (AISeqAdrs[5]<<24));
			else
				AISeqAdrs+=6;
			break;
		case LEVEL_DEFENCE:
			if(PSP[AttackClient].level<PSP[DefenceClient].level)
				AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
								 (AISeqAdrs[3]<< 8)|
								 (AISeqAdrs[4]<<16)|
								 (AISeqAdrs[5]<<24));
			else
				AISeqAdrs+=6;
			break;
		case LEVEL_EQUAL:
			if(PSP[AttackClient].level==PSP[DefenceClient].level)
				AISeqAdrs=(u8 *)((AISeqAdrs[2]<< 0)|
								 (AISeqAdrs[3]<< 8)|
								 (AISeqAdrs[4]<<16)|
								 (AISeqAdrs[5]<<24));
			else
				AISeqAdrs+=6;
			break;
	}
}

//------------------------------------------------------------
//	挑発状態かチェックして分岐
//------------------------------------------------------------

//IF_CHOUHATSU	adrs
void	AI_IF_CHOUHATSU(void)
{
	if(WKC[DefenceClient].chouhatsucnt)
		AISeqAdrs=(u8 *)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs+=5;
}

//IFN_CHOUHATSU	adrs
void	AI_IFN_CHOUHATSU(void)
{
	if(WKC[DefenceClient].chouhatsucnt==0)
		AISeqAdrs=(u8 *)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs+=5;
}


//--------------------- AI用サブルーチン群 ------------------------

void	AIPushAdrsSet(u8 *adrs)
{
	AI_PUSH_ADRS->PushAdrsBuf[AI_PUSH_ADRS->PushAdrsCnt++]=adrs;
}

void	AIPushAdrsAct()
{
	AI_PUSH_ADRS->PushAdrsBuf[AI_PUSH_ADRS->PushAdrsCnt++]=AISeqAdrs;
}

u8	AIPopAdrsAct()
{
	if(AI_PUSH_ADRS->PushAdrsCnt){
		AI_PUSH_ADRS->PushAdrsCnt--;
		AISeqAdrs=AI_PUSH_ADRS->PushAdrsBuf[AI_PUSH_ADRS->PushAdrsCnt];
		return 1;
	}
	else
		return 0;
}

