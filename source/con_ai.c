//======================================================
//                                                      
//    con_ai.c                                           
//                                                      
//    Copyright (C) 2002 GAME FREAK inc.
//======================================================

#include "common.h"
#include "calctool.h"
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
//#include "tr_ai.h"
//#include "waza_ai.def"
//#include "server.h"
//#include "server.def"
//#include "ai_def.def"

#include "contest.h"
#include "con_tool.h"
#include "con_waza.h"

//---------------------- グローバル変数 --------------------------

extern u8		*AISeqAdrs;

//-------------------- プロトタイプ宣言 ------------------------
void	ConWazaAIInit(u8);
u8		ConWazaAIMain(void);
void	ConWazaAISequence(void);
static u8 GetBrdNo(u8 appeal_no);
void	AI_C_INCDEC(void);
void AI_C_LD_TURN(void);
void AI_C_IF_TURN_UNDER(void);
void AI_C_IF_TURN_OVER(void);
void AI_C_IF_TURN_EQUAL(void);
void AI_C_IFN_TURN_EQUAL(void);
void AI_C_LD_TENSYON(void);
void AI_C_IF_TENSYON_UNDER(void);
void AI_C_IF_TENSYON_OVER(void);
void AI_C_IF_TENSYON_EQUAL(void);
void AI_C_IFN_TENSYON_EQUAL(void);
void AI_C_LD_ORDER(void);
void AI_C_IF_ORDER_UNDER(void);
void AI_C_IF_ORDER_OVER(void);
void AI_C_IF_ORDER_EQUAL(void);
void AI_C_IFN_ORDER_EQUAL(void);
void AI_C_LD_BONUS(void);
void AI_C_IF_BONUS_UNDER(void);
void AI_C_IF_BONUS_OVER(void);
void AI_C_IF_BONUS_EQUAL(void);
void AI_C_IFN_BONUS_EQUAL(void);
void AI_C_LD_AP(void);
void AI_C_IF_AP_UNDER(void);
void AI_C_IF_AP_OVER(void);
void AI_C_IF_AP_EQUAL(void);
void AI_C_IFN_AP_EQUAL(void);
void AI_C_LD_BP(void);
void AI_C_IF_BP_UNDER(void);
void AI_C_IF_BP_OVER(void);
void AI_C_IF_BP_EQUAL(void);
void AI_C_IFN_BP_EQUAL(void);
void AI_C_LD_CONTYPE(void);
void AI_C_IF_CONTYPE_EQUAL(void);
void AI_C_IFN_CONTYPE_EQUAL(void);
void AI_C_LD_WAZATENSYON(void);
void AI_C_IF_WAZATENSYON_UNDER(void);
void AI_C_IF_WAZATENSYON_OVER(void);
void AI_C_IF_WAZATENSYON_EQUAL(void);
void AI_C_IFN_WAZATENSYON_EQUAL(void);
void AI_C_LD_APNO(void);
void AI_C_IF_APNO_EQUAL(void);
void AI_C_IFN_APNO_EQUAL(void);
void AI_C_LD_WAZACLASS(void);
void AI_C_IF_WAZACLASS_EQUAL(void);
void AI_C_IFN_WAZACLASS_EQUAL(void);
void AI_C_LD_APTOP(void);
void AI_C_IF_APTOP_EQUAL(void);
void AI_C_LD_BOUGAITOP(void);
void AI_C_IF_BOUGAITOP_EQUAL(void);
void AI_C_LD_WAZAAP(void);
void AI_C_IF_WAZAAP_UNDER(void);
void AI_C_IF_WAZAAP_OVER(void);
void AI_C_IF_WAZAAP_EQUAL(void);
void AI_C_IFN_WAZAAP_EQUAL(void);
void AI_C_LD_BOUGAI(void);
void AI_C_IF_BOUGAI_UNDER(void);
void AI_C_IF_BOUGAI_OVER(void);
void AI_C_IF_BOUGAI_EQUAL(void);
void AI_C_IFN_BOUGAI_EQUAL(void);
void AI_C_LD_CONTI(void);
void AI_C_IF_CONTI_UNDER(void);
void AI_C_IF_CONTI_OVER(void);
void AI_C_IF_CONTI_EQUAL(void);
void AI_C_IFN_CONTI_EQUAL(void);
void AI_C_LD_COMBO1(void);
void AI_C_IF_COMBO1_EQUAL(void);
void AI_C_IFN_COMBO1_EQUAL(void);
void AI_C_LD_COMBO2(void);
void AI_C_IF_COMBO2_EQUAL(void);
void AI_C_IFN_COMBO2_EQUAL(void);
void AI_C_LD_COMBOOCCUR(void);
void AI_C_IF_COMBOOCCUR_EQUAL(void);
void AI_C_IFN_COMBOOCCUR_EQUAL(void);
void AI_C_LD_RIVALBONUS(void);
void AI_C_IF_RIVALBONUS_UNDER(void);
void AI_C_IF_RIVALBONUS_OVER(void);
void AI_C_IF_RIVALBONUS_EQUAL(void);
void AI_C_IFN_RIVALBONUS_EQUAL(void);
void AI_C_LD_RIVALCOMBO1(void);
void AI_C_IF_RIVALCOMBO1_UNDER(void);
void AI_C_IF_RIVALCOMBO1_OVER(void);
void AI_C_IF_RIVALCOMBO1_EQUAL(void);
void AI_C_IFN_RIVALCOMBO1_EQUAL(void);
void AI_C_LD_STATUS(void);
void AI_C_IF_STATUS_EQUAL(void);
void AI_C_IFN_STATUS_EQUAL(void);
void AI_C_LD_COMBOCONTI(void);
void AI_C_IF_COMBOCONTI_EQUAL(void);
void AI_C_IFN_COMBOCONTI_EQUAL(void);
void AI_C_LD_APCOMP(void);
void AI_C_IF_APCOMP_UNDER(void);
void AI_C_IF_APCOMP_OVER(void);
void AI_C_IF_APCOMP_EQUAL(void);
void AI_C_IFN_APCOMP_EQUAL(void);
void AI_C_LD_BPCOMP(void);
void AI_C_IF_BPCOMP_UNDER(void);
void AI_C_IF_BPCOMP_OVER(void);
void AI_C_IF_BPCOMP_EQUAL(void);
void AI_C_IFN_BPCOMP_EQUAL(void);
void AI_C_LD_APNOHISTORY(void);
void AI_C_IF_APNOHISTORY_UNDER(void);
void AI_C_IF_APNOHISTORY_OVER(void);
void AI_C_IF_APNOHISTORY_EQUAL(void);
void AI_C_IFN_APNOHISTORY_EQUAL(void);
void AI_C_LD_TENSYONHISTORY(void);
void AI_C_IF_TENSYONHISTORY_UNDER(void);
void AI_C_IF_TENSYONHISTORY_OVER(void);
void AI_C_IF_TENSYONHISTORY_EQUAL(void);
void AI_C_IFN_TENSYONHISTORY_EQUAL(void);
void AI_C_LD_CLASSHISTORY(void);
void AI_C_IF_CLASSHISTORY_EQUAL(void);
void AI_C_IFN_CLASSHISTORY_EQUAL(void);
void	AI_C_LDWK_RESURT(void);
void	AI_C_LDWK_NUM(void);
void	AI_C_ADDSUBLDWK_NUM(void);
void	AI_C_ADDSUBLDWK_WK(void);
void	AI_C_LDWK_WK(void);
void AI_C_IF_WKCOMPNUM_UNDER(void);
void AI_C_IF_WKCOMPNUM_OVER(void);
void AI_C_IF_WKCOMPNUM_EQUAL(void);
void AI_C_IFN_WKCOMPNUM_EQUAL(void);
void AI_C_IF_WKCOMPWK_UNDER(void);
void AI_C_IF_WKCOMPWK_OVER(void);
void AI_C_IF_WKCOMPWK_EQUAL(void);
void AI_C_IFN_WKCOMPWK_EQUAL(void);
void AI_C_IF_RANDCOMPNUM_UNDER(void);
void AI_C_IF_RANDCOMPNUM_OVER(void);
void AI_C_JUMP(void);
void	AI_C_CALL(void);
void	AI_C_AIEND(void);
void	C_AIPushAdrsSet(u8 *adrs);
u8	C_AIPopAdrsAct(void);
void AI_C_LD_ALLWAZA_TENSYONCHECK(void);
void AI_C_IF_ALLWAZA_TENSYONCHECK_EQUAL(void);
void AI_C_IFN_ALLWAZA_TENSYONCHECK_EQUAL(void);
void AI_C_LD_WAZANOCHECK(void);
void AI_C_IF_WAZANOCHECK_EQUAL(void);
void AI_C_IFN_WAZANOCHECK_EQUAL(void);


//-------------------- AIコマンド宣言 ------------------------

const pFunc	ConAISequenceTbl[]={
	AI_C_INCDEC,
	AI_C_LD_TURN,
	AI_C_IF_TURN_UNDER,
	AI_C_IF_TURN_OVER,
	AI_C_IF_TURN_EQUAL,
	AI_C_IFN_TURN_EQUAL,
	AI_C_LD_TENSYON,
	AI_C_IF_TENSYON_UNDER,
	AI_C_IF_TENSYON_OVER,
	AI_C_IF_TENSYON_EQUAL,
	AI_C_IFN_TENSYON_EQUAL,
	AI_C_LD_ORDER,
	AI_C_IF_ORDER_UNDER,
	AI_C_IF_ORDER_OVER,
	AI_C_IF_ORDER_EQUAL,
	AI_C_IFN_ORDER_EQUAL,
	AI_C_LD_BONUS,
	AI_C_IF_BONUS_UNDER,
	AI_C_IF_BONUS_OVER,
	AI_C_IF_BONUS_EQUAL,
	AI_C_IFN_BONUS_EQUAL,
	AI_C_LD_AP,
	AI_C_IF_AP_UNDER,
	AI_C_IF_AP_OVER,
	AI_C_IF_AP_EQUAL,
	AI_C_IFN_AP_EQUAL,
	AI_C_LD_BP,
	AI_C_IF_BP_UNDER,
	AI_C_IF_BP_OVER,
	AI_C_IF_BP_EQUAL,
	AI_C_IFN_BP_EQUAL,
	AI_C_LD_CONTYPE,
	AI_C_IF_CONTYPE_EQUAL,
	AI_C_IFN_CONTYPE_EQUAL,
	AI_C_LD_WAZATENSYON,
	AI_C_IF_WAZATENSYON_UNDER,
	AI_C_IF_WAZATENSYON_OVER,
	AI_C_IF_WAZATENSYON_EQUAL,
	AI_C_IFN_WAZATENSYON_EQUAL,
	AI_C_LD_APNO,
	AI_C_IF_APNO_EQUAL,
	AI_C_IFN_APNO_EQUAL,
	AI_C_LD_WAZACLASS,
	AI_C_IF_WAZACLASS_EQUAL,
	AI_C_IFN_WAZACLASS_EQUAL,
	AI_C_LD_APTOP,
	AI_C_IF_APTOP_EQUAL,
	AI_C_LD_BOUGAITOP,
	AI_C_IF_BOUGAITOP_EQUAL,
	AI_C_LD_WAZAAP,
	AI_C_IF_WAZAAP_UNDER,
	AI_C_IF_WAZAAP_OVER,
	AI_C_IF_WAZAAP_EQUAL,
	AI_C_IFN_WAZAAP_EQUAL,
	AI_C_LD_BOUGAI,
	AI_C_IF_BOUGAI_UNDER,
	AI_C_IF_BOUGAI_OVER,
	AI_C_IF_BOUGAI_EQUAL,
	AI_C_IFN_BOUGAI_EQUAL,
	AI_C_LD_CONTI,
	AI_C_IF_CONTI_UNDER,
	AI_C_IF_CONTI_OVER,
	AI_C_IF_CONTI_EQUAL,
	AI_C_IFN_CONTI_EQUAL,
	AI_C_LD_COMBO1,
	AI_C_IF_COMBO1_EQUAL,
	AI_C_IFN_COMBO1_EQUAL,
	AI_C_LD_COMBO2,
	AI_C_IF_COMBO2_EQUAL,
	AI_C_IFN_COMBO2_EQUAL,
	AI_C_LD_COMBOOCCUR,
	AI_C_IF_COMBOOCCUR_EQUAL,
	AI_C_IFN_COMBOOCCUR_EQUAL,
	AI_C_LD_RIVALBONUS,
	AI_C_IF_RIVALBONUS_UNDER,
	AI_C_IF_RIVALBONUS_OVER,
	AI_C_IF_RIVALBONUS_EQUAL,
	AI_C_IFN_RIVALBONUS_EQUAL,
	AI_C_LD_RIVALCOMBO1,
	AI_C_IF_RIVALCOMBO1_UNDER,
	AI_C_IF_RIVALCOMBO1_OVER,
	AI_C_IF_RIVALCOMBO1_EQUAL,
	AI_C_IFN_RIVALCOMBO1_EQUAL,
	AI_C_LD_STATUS,
	AI_C_IF_STATUS_EQUAL,
	AI_C_IFN_STATUS_EQUAL,
	AI_C_LD_COMBOCONTI,
	AI_C_IF_COMBOCONTI_EQUAL,
	AI_C_IFN_COMBOCONTI_EQUAL,
	AI_C_LD_APCOMP,
	AI_C_IF_APCOMP_UNDER,
	AI_C_IF_APCOMP_OVER,
	AI_C_IF_APCOMP_EQUAL,
	AI_C_IFN_APCOMP_EQUAL,
	AI_C_LD_BPCOMP,
	AI_C_IF_BPCOMP_UNDER,
	AI_C_IF_BPCOMP_OVER,
	AI_C_IF_BPCOMP_EQUAL,
	AI_C_IFN_BPCOMP_EQUAL,
	AI_C_LD_APNOHISTORY,
	AI_C_IF_APNOHISTORY_UNDER,
	AI_C_IF_APNOHISTORY_OVER,
	AI_C_IF_APNOHISTORY_EQUAL,
	AI_C_IFN_APNOHISTORY_EQUAL,
	AI_C_LD_TENSYONHISTORY,
	AI_C_IF_TENSYONHISTORY_UNDER,
	AI_C_IF_TENSYONHISTORY_OVER,
	AI_C_IF_TENSYONHISTORY_EQUAL,
	AI_C_IFN_TENSYONHISTORY_EQUAL,
	AI_C_LD_CLASSHISTORY,
	AI_C_IF_CLASSHISTORY_EQUAL,
	AI_C_IFN_CLASSHISTORY_EQUAL,
	AI_C_LDWK_RESURT,
	AI_C_LDWK_NUM,
	AI_C_ADDSUBLDWK_NUM,
	AI_C_ADDSUBLDWK_WK,
	AI_C_LDWK_WK,
	AI_C_IF_WKCOMPNUM_UNDER,
	AI_C_IF_WKCOMPNUM_OVER,
	AI_C_IF_WKCOMPNUM_EQUAL,
	AI_C_IFN_WKCOMPNUM_EQUAL,
	AI_C_IF_WKCOMPWK_UNDER,
	AI_C_IF_WKCOMPWK_OVER,
	AI_C_IF_WKCOMPWK_EQUAL,
	AI_C_IFN_WKCOMPWK_EQUAL,
	AI_C_IF_RANDCOMPNUM_UNDER,
	AI_C_IF_RANDCOMPNUM_OVER,
	AI_C_JUMP,
	AI_C_CALL,
	AI_C_AIEND,
	AI_C_LD_ALLWAZA_TENSYONCHECK,
	AI_C_IF_ALLWAZA_TENSYONCHECK_EQUAL,
	AI_C_IFN_ALLWAZA_TENSYONCHECK_EQUAL,
	AI_C_LD_WAZANOCHECK,
	AI_C_IF_WAZANOCHECK_EQUAL,
	AI_C_IFN_WAZANOCHECK_EQUAL,
};

//----------------------------------------------------------
//	extern宣言
//----------------------------------------------------------
extern	u32	BreederAITbl[];


//-------------------- AIシーケンスナンバー宣言 ------------------------

enum{
	CONAI_SEQ_THINK_INIT=0,
	CONAI_SEQ_THINK,
	CONAI_SEQ_END,
};

//--------------------------------------------------------------
//		AI用ワークの初期化
//--------------------------------------------------------------

void	ConWazaAIInit(u8 aibrd)
{
	int	i;
	
	memset(CONAI, 0, sizeof(ConAIWorkTbl));

	for(i = 0; i < 4; i++)
		CONAI->AI_WAZAPOINT[i]=100;
	CONAI->AI_Brd = aibrd;
	CONAI->PushAdrsCnt=0;
/*
//	この辺は暫定
	AttackClient=ClientNo;
	DefenceClient=ClientNo^1;
*/

	CONAI->AI_THINK_BIT = BreederParam[CONAI->AI_Brd].ai;
}

u8		ConWazaAIMain(void)
{
	int	i;
	u8	point;
	u8	pos;

	//WazaNoStock();

	while(CONAI->AI_THINK_BIT){
		if(CONAI->AI_THINK_BIT&1){
			CONAI->AI_SEQNO=CONAI_SEQ_THINK_INIT;
			ConWazaAISequence();
		}
		CONAI->AI_THINK_BIT >>= 1;
		CONAI->AI_THINK_NO++;
		CONAI->AI_WAZAPOS = 0;
	}
	
	do{
		pos=pp_rand()&0x03;
		point=CONAI->AI_WAZAPOINT[pos];
		for(i=0;i<4;i++){
			if(point < CONAI->AI_WAZAPOINT[i])
				break;
		}
	}while(i!=4);
	
	return pos;
}

void	ConWazaAISequence(void)
{
	while(CONAI->AI_SEQNO!=CONAI_SEQ_END){
		switch(CONAI->AI_SEQNO){
			case CONAI_SEQ_THINK_INIT:
				AISeqAdrs=(u8 *)BreederAITbl[CONAI->AI_THINK_NO];
				//if(PSP[AttackClient].pp[CONAI->AI_WAZAPOS]==0)
				if(BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS] == 0)
					CONAI->AI_WAZANO=0;
				else
					//CONAI->AI_WAZANO=PSP[AttackClient].waza[CONAI->AI_WAZAPOS];
					CONAI->AI_WAZANO=BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS];
				CONAI->AI_SEQNO++;
				break;
			case CONAI_SEQ_THINK:
				if(CONAI->AI_WAZANO!=0)
					ConAISequenceTbl[*AISeqAdrs]();
				else{
					CONAI->AI_WAZAPOINT[CONAI->AI_WAZAPOS]=0;
					CONAI->AI_STATUSFLAG|=CONAI_STATUSFLAG_END;
				}
				
				//終了ﾌﾗｸﾞチェック
				if(CONAI->AI_STATUSFLAG&CONAI_STATUSFLAG_END){
					CONAI->AI_WAZAPOS++;
					if(CONAI->AI_WAZAPOS<4)
						CONAI->AI_SEQNO=CONAI_SEQ_THINK_INIT;
					else
						CONAI->AI_SEQNO++;
					CONAI->AI_STATUSFLAG&=CONAI_STATUSFLAG_END_OFF;
				}
				break;
			case CONAI_SEQ_END:
				break;
		}
	}
}

//----------------------------------------------------------
//	アピールNo(ｱﾋﾟｰﾙする順番)からﾌﾞﾘｰﾀﾞｰNoを取得する
//----------------------------------------------------------
static u8 GetBrdNo(u8 appeal_no)
{
	int i;
	
	for(i = 0; i < BREEDER_MAX; i++){
		if(CONWAZA->Sort[i] == appeal_no)
			break;
	}
	return i;
}



//--------------------- AIコマンドルーチン群 ------------------------

//------------------------------------------------------------
//	ポイント加減算
//------------------------------------------------------------

//C_INCDEC				value
void	AI_C_INCDEC(void)
{
	s16 point;
	
	point = CONAI->AI_WAZAPOINT[CONAI->AI_WAZAPOS];
	point +=(s8)(AISeqAdrs[1]);
	if(point > 255)
		point = 255;
	else if(point < 0)
		point = 0;
	CONAI->AI_WAZAPOINT[CONAI->AI_WAZAPOS] = point;
	AISeqAdrs+=2;
}

//----------------------------------------------------------
//	現在のﾀｰﾝ数で分岐
//----------------------------------------------------------

//C_LD_TURN
void AI_C_LD_TURN(void)
{
	CONAI->RetWork = consys->turn;
	AISeqAdrs++;
}

//C_IF_TURN_UNDER		value,adrs
void AI_C_IF_TURN_UNDER(void)
{
	AI_C_LD_TURN();
	if(CONAI->RetWork < AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_TURN_OVER		value,adrs
void AI_C_IF_TURN_OVER(void)
{
	AI_C_LD_TURN();
	if(CONAI->RetWork > AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_TURN_EQUAL		value,adrs
void AI_C_IF_TURN_EQUAL(void)
{
	AI_C_LD_TURN();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_TURN_EQUAL		value,adrs
void AI_C_IFN_TURN_EQUAL(void)
{
	AI_C_LD_TURN();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	現在の場のテンションで分岐
//----------------------------------------------------------

//C_LD_TENSYON
void AI_C_LD_TENSYON(void)
{
	CONAI->RetWork = consys->tensyon;
	AISeqAdrs++;
}

//C_IF_TENSYON_UNDER		value,adrs
void AI_C_IF_TENSYON_UNDER(void)
{
	AI_C_LD_TENSYON();
	if(CONAI->RetWork < AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_TENSYON_OVER		value,adrs
void AI_C_IF_TENSYON_OVER(void)
{
	AI_C_LD_TENSYON();
	if(CONAI->RetWork > AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_TENSYON_EQUAL		value,adrs
void AI_C_IF_TENSYON_EQUAL(void)
{
	AI_C_LD_TENSYON();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_TENSYON_EQUAL		value,adrs
void AI_C_IFN_TENSYON_EQUAL(void)
{
	AI_C_LD_TENSYON();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	自分のアピールする順番で分岐
//----------------------------------------------------------

//C_LD_ORDER
void AI_C_LD_ORDER(void)
{
	CONAI->RetWork = CONWAZA->Sort[CONAI->AI_Brd];
	AISeqAdrs++;
}

//C_IF_ORDER_UNDER		value,adrs
void AI_C_IF_ORDER_UNDER(void)
{
	AI_C_LD_ORDER();
	if(CONAI->RetWork < AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_ORDER_OVER		value,adrs
void AI_C_IF_ORDER_OVER(void)
{
	AI_C_LD_ORDER();
	if(CONAI->RetWork > AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_ORDER_EQUAL		value,adrs
void AI_C_IF_ORDER_EQUAL(void)
{
	AI_C_LD_ORDER();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_ORDER_EQUAL		value,adrs
void AI_C_IFN_ORDER_EQUAL(void)
{
	AI_C_LD_ORDER();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	自分のﾎﾞｰﾅｽ状態で分岐
//----------------------------------------------------------

//C_LD_BONUS
void AI_C_LD_BONUS(void)
{
	CONAI->RetWork = apsys[CONAI->AI_Brd].bonus / 10;
	AISeqAdrs++;
}

//C_IF_BONUS_UNDER		value,adrs
void AI_C_IF_BONUS_UNDER(void)
{
	AI_C_LD_BONUS();
	if(CONAI->RetWork < AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_BONUS_OVER		value,adrs
void AI_C_IF_BONUS_OVER(void)
{
	AI_C_LD_BONUS();
	if(CONAI->RetWork > AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_BONUS_EQUAL		value,adrs
void AI_C_IF_BONUS_EQUAL(void)
{
	AI_C_LD_BONUS();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_BONUS_EQUAL		value,adrs
void AI_C_IFN_BONUS_EQUAL(void)
{
	AI_C_LD_BONUS();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	自分のAP値を取得して分岐
//----------------------------------------------------------

//C_LD_AP
void AI_C_LD_AP(void)
{
	CONAI->RetWork = apsys[CONAI->AI_Brd].total_ap;
	AISeqAdrs++;
}

//C_IF_AP_UNDER		s16value,adrs
void AI_C_IF_AP_UNDER(void)
{
	AI_C_LD_AP();
	if(CONAI->RetWork < (s16)(AISeqAdrs[0] | (AISeqAdrs[1] << 8)))
		AISeqAdrs = (u8*)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs += 6;
}

//C_IF_AP_OVER		s16value,adrs
void AI_C_IF_AP_OVER(void)
{
	AI_C_LD_AP();
	if(CONAI->RetWork > (s16)(AISeqAdrs[0] | (AISeqAdrs[1] << 8)))
		AISeqAdrs = (u8*)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs += 6;
}

//C_IF_AP_EQUAL		s16value,adrs
void AI_C_IF_AP_EQUAL(void)
{
	AI_C_LD_AP();
	if(CONAI->RetWork == (s16)(AISeqAdrs[0] | (AISeqAdrs[1] << 8)))
		AISeqAdrs = (u8*)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs += 6;
}

//C_IFN_AP_EQUAL		s16value,adrs
void AI_C_IFN_AP_EQUAL(void)
{
	AI_C_LD_AP();
	if(CONAI->RetWork != (s16)(AISeqAdrs[0] | (AISeqAdrs[1] << 8)))
		AISeqAdrs = (u8*)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs += 6;
}

//----------------------------------------------------------
//	自分のBP値で分岐
//----------------------------------------------------------

//C_LD_BP
void AI_C_LD_BP(void)
{
	CONAI->RetWork = ContBP[CONAI->AI_Brd];
	AISeqAdrs++;
}

//C_IF_BP_UNDER		s16value,adrs
void AI_C_IF_BP_UNDER(void)
{
	AI_C_LD_BP();
	if(CONAI->RetWork < (s16)(AISeqAdrs[0] | (AISeqAdrs[1] << 8)))
		AISeqAdrs = (u8*)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs += 6;
}

//C_IF_BP_OVER		s16value,adrs
void AI_C_IF_BP_OVER(void)
{
	AI_C_LD_BP();
	if(CONAI->RetWork > (s16)(AISeqAdrs[0] | (AISeqAdrs[1] << 8)))
		AISeqAdrs = (u8*)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs += 6;
}

//C_IF_BP_EQUAL		s16value,adrs
void AI_C_IF_BP_EQUAL(void)
{
	AI_C_LD_BP();
	if(CONAI->RetWork == (s16)(AISeqAdrs[0] | (AISeqAdrs[1] << 8)))
		AISeqAdrs = (u8*)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs += 6;
}

//C_IFN_BP_EQUAL		s16value,adrs
void AI_C_IFN_BP_EQUAL(void)
{
	AI_C_LD_BP();
	if(CONAI->RetWork != (s16)(AISeqAdrs[0] | (AISeqAdrs[1] << 8)))
		AISeqAdrs = (u8*)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs += 6;
}

//----------------------------------------------------------
//	出場しているｺﾝﾃｽﾄタイプで分岐
//----------------------------------------------------------

//C_LD_CONTYPE
void AI_C_LD_CONTYPE(void)
{
	CONAI->RetWork = ContestKind;
	AISeqAdrs++;
}

//C_IF_CONTYPE_EQUAL		value,adrs
void AI_C_IF_CONTYPE_EQUAL(void)
{
	AI_C_LD_CONTYPE();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_CONTYPE_EQUAL		value,adrs
void AI_C_IFN_CONTYPE_EQUAL(void)
{
	AI_C_LD_CONTYPE();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	サーチしている技を出した時、変化するテンション値で分岐
//----------------------------------------------------------

//C_LD_WAZATENSYON
void AI_C_LD_WAZATENSYON(void)
{
	s8 tensyon;
	
	tensyon = TensyonCheck(BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS]);
	CONAI->RetWork = tensyon;
	AISeqAdrs++;
}

//C_IF_WAZATENSYON_UNDER		value,adrs
void AI_C_IF_WAZATENSYON_UNDER(void)
{
	AI_C_LD_WAZATENSYON();
	if(CONAI->RetWork < (s8)AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_WAZATENSYON_OVER		value,adrs
void AI_C_IF_WAZATENSYON_OVER(void)
{
	AI_C_LD_WAZATENSYON();
	if(CONAI->RetWork > (s8)AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_WAZATENSYON_EQUAL		value,adrs
void AI_C_IF_WAZATENSYON_EQUAL(void)
{
	AI_C_LD_WAZATENSYON();
	if(CONAI->RetWork == (s8)AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_WAZATENSYON_EQUAL		value,adrs
void AI_C_IFN_WAZATENSYON_EQUAL(void)
{
	AI_C_LD_WAZATENSYON();
	if(CONAI->RetWork != (s8)AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	サーチしている技のアピールNoを取得して分岐
//----------------------------------------------------------

//C_LD_APNO
void AI_C_LD_APNO(void)
{
	u8 apno;
	u16 wazano;
	
	wazano = BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS];
	apno = ConWazaTbl[wazano].apno;
	CONAI->RetWork = apno;
	AISeqAdrs++;
}

//C_IF_APNO_EQUAL		value,adrs
void AI_C_IF_APNO_EQUAL(void)
{
	AI_C_LD_APNO();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_APNO_EQUAL		value,adrs
void AI_C_IFN_APNO_EQUAL(void)
{
	AI_C_LD_APNO();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	サーチしている技のアピール分類を取得して分岐
//----------------------------------------------------------

//C_LD_WAZACLASS
void AI_C_LD_WAZACLASS(void)
{
	u8 class;
	u16 wazano;
	
	wazano = BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS];
	class = WazaKoukaTbl[ConWazaTbl[wazano].apno].class;
	CONAI->RetWork = class;
	AISeqAdrs++;
}

//C_IF_WAZACLASS_EQUAL		value,adrs
void AI_C_IF_WAZACLASS_EQUAL(void)
{
	AI_C_LD_WAZACLASS();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_WAZACLASS_EQUAL		value,adrs
void AI_C_IFN_WAZACLASS_EQUAL(void)
{
	AI_C_LD_WAZACLASS();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	サーチしている技が持っている技の中で一番AP値が高いかどうかチェック分岐
//----------------------------------------------------------

//C_LD_APTOP
void AI_C_LD_APTOP(void)
{
	u8 ap;
	u16 wazano;
	int i;
	
	wazano = BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS];
	ap = WazaKoukaTbl[ConWazaTbl[wazano].apno].ap;
	for(i = 0; i < 4; i++){
		wazano = BreederParam[CONAI->AI_Brd].waza[i];
		if(wazano == 0)
			continue;
		if(ap < WazaKoukaTbl[ConWazaTbl[wazano].apno].ap)
			break;
	}
	if(i == 4)
		CONAI->RetWork = 1;
	else
		CONAI->RetWork = 0;
	AISeqAdrs++;
}

//C_IF_AP_EQUAL		adrs
void AI_C_IF_APTOP_EQUAL(void)
{
	AI_C_LD_APTOP();
	if(CONAI->RetWork)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//----------------------------------------------------------
//	サーチしている技が持っている技の中で一番妨害値が高いかどうかチェック分岐
//----------------------------------------------------------

//C_LD_BOUGAITOP
void AI_C_LD_BOUGAITOP(void)
{
	u8 bougai;
	u16 wazano;
	int i;
	
	wazano = BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS];
	bougai = WazaKoukaTbl[ConWazaTbl[wazano].apno].bougai;
	for(i = 0; i < 4; i++){
		wazano = BreederParam[CONAI->AI_Brd].waza[i];
		if(wazano == 0)
			continue;
		if(bougai < WazaKoukaTbl[ConWazaTbl[wazano].apno].bougai)
			break;
	}
	if(i == 4)
		CONAI->RetWork = 1;
	else
		CONAI->RetWork = 0;
	AISeqAdrs++;
}

//C_IF_BOUGAITOP_EQUAL		adrs
void AI_C_IF_BOUGAITOP_EQUAL(void)
{
	AI_C_LD_BOUGAITOP();
	if(CONAI->RetWork)
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	サーチしている技のアピール値を取得して分岐
//----------------------------------------------------------

//C_LD_WAZAAP
void AI_C_LD_WAZAAP(void)
{
	u8 ap;
	u16 wazano;
	
	wazano = BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS];
	ap = WazaKoukaTbl[ConWazaTbl[wazano].apno].ap / METER_ONE_AP;
	CONAI->RetWork = ap;
	AISeqAdrs++;
}

//C_IF_WAZAAP_UNDER		value,adrs
void AI_C_IF_WAZAAP_UNDER(void)
{
	AI_C_LD_WAZAAP();
	if(CONAI->RetWork < AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_WAZAAP_OVER		value,adrs
void AI_C_IF_WAZAAP_OVER(void)
{
	AI_C_LD_WAZAAP();
	if(CONAI->RetWork > AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_WAZAAP_EQUAL		value,adrs
void AI_C_IF_WAZAAP_EQUAL(void)
{
	AI_C_LD_WAZAAP();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_WAZAAP_EQUAL		value,adrs
void AI_C_IFN_WAZAAP_EQUAL(void)
{
	AI_C_LD_WAZAAP();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	サーチしている技の妨害値を取得して分岐
//----------------------------------------------------------

//C_LD_BOUGAI
void AI_C_LD_BOUGAI(void)
{
	u8 bougai;
	u16 wazano;
	
	wazano = BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS];
	bougai = WazaKoukaTbl[ConWazaTbl[wazano].apno].bougai / METER_ONE_AP;
	CONAI->RetWork = bougai;
	AISeqAdrs++;
}

//C_IF_BOUGAI_UNDER		value,adrs
void AI_C_IF_BOUGAI_UNDER(void)
{
	AI_C_LD_BOUGAI();
	if(CONAI->RetWork < AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_BOUGAI_OVER		value,adrs
void AI_C_IF_BOUGAI_OVER(void)
{
	AI_C_LD_BOUGAI();
	if(CONAI->RetWork > AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_BOUGAI_EQUAL		value,adrs
void AI_C_IF_BOUGAI_EQUAL(void)
{
	AI_C_LD_BOUGAI();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_BOUGAI_EQUAL		value,adrs
void AI_C_IFN_BOUGAI_EQUAL(void)
{
	AI_C_LD_BOUGAI();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	サーチしている技の連続使用回数を取得して分岐
//----------------------------------------------------------

//C_LD_CONTI
void AI_C_LD_CONTI(void)
{
	u16 now_waza,old_waza;
	u8 ret;
	
	now_waza = BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS];
	old_waza = apsys[CONAI->AI_Brd].use_wazaold;
	if(now_waza != old_waza)
		ret = 0;
	else
		ret = apsys[CONAI->AI_Brd].conti_count + 1;
	CONAI->RetWork = ret;
	AISeqAdrs++;
}

//C_IF_CONTI_UNDER		value,adrs
void AI_C_IF_CONTI_UNDER(void)
{
	AI_C_LD_CONTI();
	if(CONAI->RetWork < AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_CONTI_OVER		value,adrs
void AI_C_IF_CONTI_OVER(void)
{
	AI_C_LD_CONTI();
	if(CONAI->RetWork > AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_CONTI_EQUAL		value,adrs
void AI_C_IF_CONTI_EQUAL(void)
{
	AI_C_LD_CONTI();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_CONTI_EQUAL		value,adrs
void AI_C_IFN_CONTI_EQUAL(void)
{
	AI_C_LD_CONTI();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	サーチしている技と他の持ち技を比較してｺﾝﾎﾞ出来るかどうかﾁｪｯｸする分岐1
//----------------------------------------------------------

//C_LD_COMBO1
void AI_C_LD_COMBO1(void)
{
	u16 wazano;
	u8 ret = 0;
	int i;
	
	wazano = BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS];
	for(i = 0; i < 4; i++){
		if(BreederParam[CONAI->AI_Brd].waza[i] == 0)
			continue;
		ret = ComboCheck(wazano, BreederParam[CONAI->AI_Brd].waza[i]);
		if(ret)
			break;
	}
	if(ret)
		ret = 1;
	CONAI->RetWork = ret;
	AISeqAdrs++;
}

//C_IF_COMBO1_EQUAL		adrs
//ｺﾝﾎﾞが成立したらジャンプ
void AI_C_IF_COMBO1_EQUAL(void)
{
	AI_C_LD_COMBO1();
	if(CONAI->RetWork)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IFN_COMBO1_EQUAL		adrs
//ｺﾝﾎﾞが成立しなかったらジャンプ
void AI_C_IFN_COMBO1_EQUAL(void)
{
	AI_C_LD_COMBO1();
	if(CONAI->RetWork == 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//----------------------------------------------------------
//	サーチしている技と他の持ち技を比較してｺﾝﾎﾞ出来るかどうかﾁｪｯｸする分岐2
//----------------------------------------------------------

//C_LD_COMBO2
void AI_C_LD_COMBO2(void)
{
	u16 wazano;
	u8 ret = 0;
	int i;
	
	wazano = BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS];
	for(i = 0; i < 4; i++){
		if(BreederParam[CONAI->AI_Brd].waza[i] == 0)
			continue;
		ret = ComboCheck(BreederParam[CONAI->AI_Brd].waza[i], wazano);
		if(ret)
			break;
	}
	if(ret)
		ret = 1;
	CONAI->RetWork = ret;
	AISeqAdrs++;
}

//C_IF_COMBO2_EQUAL		adrs
//ｺﾝﾎﾞが成立する技があったらジャンプ
void AI_C_IF_COMBO2_EQUAL(void)
{
	AI_C_LD_COMBO2();
	if(CONAI->RetWork)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IFN_COMBO2_EQUAL		adrs
//ｺﾝﾎﾞが成立する技がなかったらジャンプ
void AI_C_IFN_COMBO2_EQUAL(void)
{
	AI_C_LD_COMBO2();
	if(CONAI->RetWork == 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//----------------------------------------------------------
//	サーチしている技でｺﾝﾎﾞが発生するかで分岐
//----------------------------------------------------------

//C_LD_COMBOOCCUR
void AI_C_LD_COMBOOCCUR(void)
{
	u16 wazano;
	u8 ret = 0;
	
	wazano = BreederParam[CONAI->AI_Brd].waza[CONAI->AI_WAZAPOS];
	if(apsys[CONAI->AI_Brd].use_wazaold != 0)
		ret = ComboCheck(apsys[CONAI->AI_Brd].use_wazaold, wazano);
	if(ret)
		ret = 1;
	CONAI->RetWork = ret;
	AISeqAdrs++;
}

//C_IF_COMBOOCCUR_EQUAL		adrs
void AI_C_IF_COMBOOCCUR_EQUAL(void)
{
	AI_C_LD_COMBOOCCUR();
	if(CONAI->RetWork)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IFN_COMBOOCCUR_EQUAL	adrs
void AI_C_IFN_COMBOOCCUR_EQUAL(void)
{
	AI_C_LD_COMBOOCCUR();
	if(CONAI->RetWork == 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//----------------------------------------------------------
//	各ポケモンのボーナス状態をチェック
//----------------------------------------------------------

//C_LD_RIVALBONUS	appealno
void AI_C_LD_RIVALBONUS(void)
{
	u8 brd;
	
	brd = GetBrdNo(AISeqAdrs[1]);
	CONAI->RetWork = apsys[brd].bonus / 10;
	AISeqAdrs += 2;
}

//C_IF_RIVALBONUS_UNDER		appealno,value,adrs
void AI_C_IF_RIVALBONUS_UNDER(void)
{
	AI_C_LD_RIVALBONUS();
	if(CONAI->RetWork < AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_RIVALBONUS_OVER		appealno,value,adrs
void AI_C_IF_RIVALBONUS_OVER(void)
{
	AI_C_LD_RIVALBONUS();
	if(CONAI->RetWork > AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_RIVALBONUS_EQUAL		appealno,value,adrs
void AI_C_IF_RIVALBONUS_EQUAL(void)
{
	AI_C_LD_RIVALBONUS();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_RIVALBONUS_EQUAL		appealno,value,adrs
void AI_C_IFN_RIVALBONUS_EQUAL(void)
{
	AI_C_LD_RIVALBONUS();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	各ポケモンのコンボ1状態をチェック
//----------------------------------------------------------

//C_LD_RIVALCOMBO1	appealno
void AI_C_LD_RIVALCOMBO1(void)
{
	u8 brd;
	u8 ret = 0;
	
	brd = GetBrdNo(AISeqAdrs[1]);
	if(Combo1TermCheck(brd) && ConWazaTbl[apsys[brd].use_wazaold].combo1 != 0)
		ret = 1;
	CONAI->RetWork = ret;
	AISeqAdrs += 2;
}

//C_IF_RIVALCOMBO1_UNDER		appealno,value,adrs
void AI_C_IF_RIVALCOMBO1_UNDER(void)
{
	AI_C_LD_RIVALCOMBO1();
	if(CONAI->RetWork < AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_RIVALCOMBO1_OVER		appealno,value,adrs
void AI_C_IF_RIVALCOMBO1_OVER(void)
{
	AI_C_LD_RIVALCOMBO1();
	if(CONAI->RetWork > AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_RIVALCOMBO1_EQUAL		appealno,value,adrs
void AI_C_IF_RIVALCOMBO1_EQUAL(void)
{
	AI_C_LD_RIVALCOMBO1();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_RIVALCOMBO1_EQUAL		appealno,value,adrs
void AI_C_IFN_RIVALCOMBO1_EQUAL(void)
{
	AI_C_LD_RIVALCOMBO1();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	各ポケモンの状態チェック
//	参加できる状態＝１	参加できない状態(休み)＝０
//----------------------------------------------------------

//C_LD_STATUS	appealno
void AI_C_LD_STATUS(void)
{
	u8 brd;
	u8 ret;
	
	brd = GetBrdNo(AISeqAdrs[1]);
	ret = YasumiTurnCheck(brd);
	if(ret)
		CONAI->RetWork = 0;
	else
		CONAI->RetWork = 1;
	AISeqAdrs += 2;
}

//C_IF_STATUS_EQUAL		appealno,adrs
void AI_C_IF_STATUS_EQUAL(void)
{
	AI_C_LD_STATUS();
	if(CONAI->RetWork)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IFN_STATUS_EQUAL		appealno,adrs
void AI_C_IFN_STATUS_EQUAL(void)
{
	AI_C_LD_STATUS();
	if(CONAI->RetWork == 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//----------------------------------------------------------
//	各ポケモンのコンボ発生チェック
//----------------------------------------------------------

//C_LD_COMBOCONTI	appealno
void AI_C_LD_COMBOCONTI(void)
{
	u8 brd;
	
	brd = GetBrdNo(AISeqAdrs[1]);
	CONAI->RetWork = apsys[brd].combo_conti_flg;
	AISeqAdrs += 2;
}

//C_IF_COMBOCONTI_EQUAL		appealno,adrs
void AI_C_IF_COMBOCONTI_EQUAL(void)
{
	AI_C_LD_COMBOCONTI();
	if(CONAI->RetWork)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IFN_COMBOCONTI_EQUAL		appealno,adrs
void AI_C_IFN_COMBOCONTI_EQUAL(void)
{
	AI_C_LD_COMBOCONTI();
	if(CONAI->RetWork == 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//----------------------------------------------------------
//	各ポケモンの現在のAP値と自分のAP値を比較分岐
//----------------------------------------------------------

//C_LD_APCOMP	appealno
void AI_C_LD_APCOMP(void)
{
	u8 brd;
	
	brd = GetBrdNo(AISeqAdrs[1]);
	CONAI->RetWork = apsys[brd].total_ap - apsys[CONAI->AI_Brd].total_ap;
	AISeqAdrs += 2;
}

//C_IF_APCOMP_UNDER		appealno,adrs
void AI_C_IF_APCOMP_UNDER(void)
{
	AI_C_LD_APCOMP();
	if(CONAI->RetWork < 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IF_APCOMP_OVER		appealno,adrs
void AI_C_IF_APCOMP_OVER(void)
{
	AI_C_LD_APCOMP();
	if(CONAI->RetWork > 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IF_APCOMP_EQUAL		appealno,adrs
void AI_C_IF_APCOMP_EQUAL(void)
{
	AI_C_LD_APCOMP();
	if(CONAI->RetWork == 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IFN_APCOMP_EQUAL		appealno,adrs
void AI_C_IFN_APCOMP_EQUAL(void)
{
	AI_C_LD_APCOMP();
	if(CONAI->RetWork != 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//----------------------------------------------------------
//	各ポケモンの現在のBP値と自分のBP値を比較分岐
//----------------------------------------------------------

//C_LD_BPCOMP	appealno
void AI_C_LD_BPCOMP(void)
{
	u8 brd;
	
	brd = GetBrdNo(AISeqAdrs[1]);
	CONAI->RetWork = ContBP[brd] - ContBP[CONAI->AI_Brd];
	AISeqAdrs += 2;
}

//C_IF_BPCOMP_UNDER		appealno,adrs
void AI_C_IF_BPCOMP_UNDER(void)
{
	AI_C_LD_BPCOMP();
	if(CONAI->RetWork < 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IF_BPCOMP_OVER		appealno,adrs
void AI_C_IF_BPCOMP_OVER(void)
{
	AI_C_LD_BPCOMP();
	if(CONAI->RetWork > 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IF_BPCOMP_EQUAL		appealno,adrs
void AI_C_IF_BPCOMP_EQUAL(void)
{
	AI_C_LD_BPCOMP();
	if(CONAI->RetWork == 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IFN_BPCOMP_EQUAL		appealno,adrs
void AI_C_IFN_BPCOMP_EQUAL(void)
{
	AI_C_LD_BPCOMP();
	if(CONAI->RetWork != 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//----------------------------------------------------------
//	各ポケモンの前のターンまでの技から、アピールNoを取得して分岐
//----------------------------------------------------------

//C_LD_APNOHISTORY	appealno,turn
void AI_C_LD_APNOHISTORY(void)
{
	u8 brd;
	u8 turn;
	u16 wazano;
	
	brd = GetBrdNo(AISeqAdrs[1]);
	turn = AISeqAdrs[2];
	wazano = consys->WazaHistory[turn][brd];
	CONAI->RetWork = ConWazaTbl[wazano].apno;
	AISeqAdrs += 3;
}

//C_IF_APNOHISTORY_UNDER	appealno,turn,apno,adrs
void AI_C_IF_APNOHISTORY_UNDER(void)
{
	AI_C_LD_APNOHISTORY();
	if(CONAI->RetWork < AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_APNOHISTORY_OVER		appealno,turn,apno,adrs
void AI_C_IF_APNOHISTORY_OVER(void)
{
	AI_C_LD_APNOHISTORY();
	if(CONAI->RetWork > AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_APNOHISTORY_EQUAL	appealno,turn,apno,adrs
void AI_C_IF_APNOHISTORY_EQUAL(void)
{
	AI_C_LD_APNOHISTORY();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_APNOHISTORY_EQUAL	appealno,turn,apno,adrs
void AI_C_IFN_APNOHISTORY_EQUAL(void)
{
	AI_C_LD_APNOHISTORY();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	各ポケモンの前のターンまでの技から、ｱﾋﾟｰﾙﾀｲﾌﾟで変化したﾃﾝｼｮﾝ値を取得して分岐
//----------------------------------------------------------

//C_LD_TENSYONHISTORY	appealno,turn
void AI_C_LD_TENSYONHISTORY(void)
{
	u8 brd;
	u8 turn;
	s8 tensyon;
	
	brd = GetBrdNo(AISeqAdrs[1]);
	turn = AISeqAdrs[2];
	tensyon = consys->TensyonHistory[turn][brd];
	CONAI->RetWork = tensyon;
	AISeqAdrs += 3;
}

//C_IF_TENSYONHISTORY_UNDER	appealno,turn,tensyon,adrs
void AI_C_IF_TENSYONHISTORY_UNDER(void)
{
	AI_C_LD_TENSYONHISTORY();
	if(CONAI->RetWork < AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_TENSYONHISTORY_OVER		appealno,turn,tensyon,adrs
void AI_C_IF_TENSYONHISTORY_OVER(void)
{
	AI_C_LD_TENSYONHISTORY();
	if(CONAI->RetWork > AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IF_TENSYONHISTORY_EQUAL	appealno,turn,tensyon,adrs
void AI_C_IF_TENSYONHISTORY_EQUAL(void)
{
	AI_C_LD_TENSYONHISTORY();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_TENSYONHISTORY_EQUAL	appealno,turn,tensyon,adrs
void AI_C_IFN_TENSYONHISTORY_EQUAL(void)
{
	AI_C_LD_TENSYONHISTORY();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//----------------------------------------------------------
//	各ポケモンの前のターンまでの技から、ｱﾋﾟｰﾙ分類を取得して分岐
//----------------------------------------------------------

//C_LD_CLASSHISTORY	appealno,turn
void AI_C_LD_CLASSHISTORY(void)
{
	u8 brd;
	u8 turn;
	u16 wazano;
	
	brd = GetBrdNo(AISeqAdrs[1]);
	turn = AISeqAdrs[2];
	wazano = consys->WazaHistory[turn][brd];
	CONAI->RetWork = WazaKoukaTbl[ConWazaTbl[wazano].apno].class;
	AISeqAdrs += 3;
}

//C_IF_CLASSHISTORY_EQUAL	appealno,turn,class,adrs
void AI_C_IF_CLASSHISTORY_EQUAL(void)
{
	AI_C_LD_CLASSHISTORY();
	if(CONAI->RetWork == AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//C_IFN_CLASSHISTORY_EQUAL	appealno,turn,class,adrs
void AI_C_IFN_CLASSHISTORY_EQUAL(void)
{
	AI_C_LD_CLASSHISTORY();
	if(CONAI->RetWork != AISeqAdrs[0])
		AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
	else
		AISeqAdrs += 5;
}

//------------------------------------------------------------
//	格納アドレスに値を入れる
//------------------------------------------------------------

//結果をﾜｰｸに代入する
//C_LDWK_RESURT			work
void	AI_C_LDWK_RESURT(void)
{
	CONAI->work[AISeqAdrs[1]] = CONAI->RetWork;
	AISeqAdrs += 2;
}

//ﾜｰｸに値を代入する
//C_LDWK_NUM			work,value
void	AI_C_LDWK_NUM(void)
{
	CONAI->work[AISeqAdrs[1]] = AISeqAdrs[2] | (AISeqAdrs[3]<<8);
	AISeqAdrs += 4;
}

//ﾜｰｸに値を加減算して代入
//C_ADDSUBLDWK_NUM			work,value
void	AI_C_ADDSUBLDWK_NUM(void)
{
	CONAI->work[AISeqAdrs[1]] += (s8)AISeqAdrs[2] | (AISeqAdrs[3]<<8);
	AISeqAdrs += 4;
}

//ﾜｰｸにﾜｰｸを加減算して代入
//C_ADDSUBLDWK_WK			work,work
void	AI_C_ADDSUBLDWK_WK(void)
{
	CONAI->work[AISeqAdrs[1]] += CONAI->work[AISeqAdrs[2]];
	AISeqAdrs += 3;
}

//ﾜｰｸにﾜｰｸを代入
//C_LDWK_WK			work,work
void	AI_C_LDWK_WK(void)
{
	CONAI->work[AISeqAdrs[1]] += CONAI->work[AISeqAdrs[2]];
	AISeqAdrs += 3;
}

//----------------------------------------------------------
//	ワークと値を比較して分岐
//----------------------------------------------------------

//C_IF_WKCOMPNUM_UNDER	work,value,adrs
void AI_C_IF_WKCOMPNUM_UNDER(void)
{
	if(CONAI->work[AISeqAdrs[1]] < (AISeqAdrs[2] | (AISeqAdrs[3]<<8)))
		AISeqAdrs = (u8*)((AISeqAdrs[4]<< 0)|
						 (AISeqAdrs[5]<< 8)|
						 (AISeqAdrs[6]<<16)|
						 (AISeqAdrs[7]<<24));
	else
		AISeqAdrs += 8;
}

//C_IF_WKCOMPNUM_OVER	work,value,adrs
void AI_C_IF_WKCOMPNUM_OVER(void)
{
	if(CONAI->work[AISeqAdrs[1]] > (AISeqAdrs[2] | (AISeqAdrs[3]<<8)))
		AISeqAdrs = (u8*)((AISeqAdrs[4]<< 0)|
						 (AISeqAdrs[5]<< 8)|
						 (AISeqAdrs[6]<<16)|
						 (AISeqAdrs[7]<<24));
	else
		AISeqAdrs += 8;
}

//C_IF_WKCOMPNUM_EQUAL	work,value,adrs
void AI_C_IF_WKCOMPNUM_EQUAL(void)
{
	if(CONAI->work[AISeqAdrs[1]] == (AISeqAdrs[2] | (AISeqAdrs[3]<<8)))
		AISeqAdrs = (u8*)((AISeqAdrs[4]<< 0)|
						 (AISeqAdrs[5]<< 8)|
						 (AISeqAdrs[6]<<16)|
						 (AISeqAdrs[7]<<24));
	else
		AISeqAdrs += 8;
}

//C_IFN_WKCOMPNUM_EQUAL	work,value,adrs
void AI_C_IFN_WKCOMPNUM_EQUAL(void)
{
	if(CONAI->work[AISeqAdrs[1]] != (AISeqAdrs[2] | (AISeqAdrs[3]<<8)))
		AISeqAdrs = (u8*)((AISeqAdrs[4]<< 0)|
						 (AISeqAdrs[5]<< 8)|
						 (AISeqAdrs[6]<<16)|
						 (AISeqAdrs[7]<<24));
	else
		AISeqAdrs += 8;
}

//----------------------------------------------------------
//	ワークとワークを比較して分岐
//----------------------------------------------------------

//C_IF_WKCOMPWK_UNDER	work,work,adrs
void AI_C_IF_WKCOMPWK_UNDER(void)
{
	if(CONAI->work[AISeqAdrs[1]] < CONAI->work[AISeqAdrs[2]])
		AISeqAdrs = (u8*)((AISeqAdrs[3]<< 0)|
						 (AISeqAdrs[4]<< 8)|
						 (AISeqAdrs[5]<<16)|
						 (AISeqAdrs[6]<<24));
	else
		AISeqAdrs += 7;
}

//C_IF_WKCOMPWK_OVER	work,work,adrs
void AI_C_IF_WKCOMPWK_OVER(void)
{
	if(CONAI->work[AISeqAdrs[1]] > CONAI->work[AISeqAdrs[2]])
		AISeqAdrs = (u8*)((AISeqAdrs[3]<< 0)|
						 (AISeqAdrs[4]<< 8)|
						 (AISeqAdrs[5]<<16)|
						 (AISeqAdrs[6]<<24));
	else
		AISeqAdrs += 7;
}

//C_IF_WKCOMPWK_EQUAL	work,work,adrs
void AI_C_IF_WKCOMPWK_EQUAL(void)
{
	if(CONAI->work[AISeqAdrs[1]] == CONAI->work[AISeqAdrs[2]])
		AISeqAdrs = (u8*)((AISeqAdrs[3]<< 0)|
						 (AISeqAdrs[4]<< 8)|
						 (AISeqAdrs[5]<<16)|
						 (AISeqAdrs[6]<<24));
	else
		AISeqAdrs += 7;
}

//C_IFN_WKCOMPWK_EQUAL	work,work,adrs
void AI_C_IFN_WKCOMPWK_EQUAL(void)
{
	if(CONAI->work[AISeqAdrs[1]] != CONAI->work[AISeqAdrs[2]])
		AISeqAdrs = (u8*)((AISeqAdrs[3]<< 0)|
						 (AISeqAdrs[4]<< 8)|
						 (AISeqAdrs[5]<<16)|
						 (AISeqAdrs[6]<<24));
	else
		AISeqAdrs += 7;
}

//----------------------------------------------------------
//	ランダム値を取得して分岐
//	0～255の範囲でランダム値を取得して、値と比較し分岐
//----------------------------------------------------------

//C_IF_RANDCOMPNUM_UNDER	value,adrs
void AI_C_IF_RANDCOMPNUM_UNDER(void)
{
	if((pp_rand() & 0xff) < CONAI->work[AISeqAdrs[1]])
		AISeqAdrs = (u8*)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs += 6;
}

//C_IF_RANDCOMPNUM_OVER		value,adrs
void AI_C_IF_RANDCOMPNUM_OVER(void)
{
	if((pp_rand() & 0xff) > CONAI->work[AISeqAdrs[1]])
		AISeqAdrs = (u8*)((AISeqAdrs[2]<< 0)|
						 (AISeqAdrs[3]<< 8)|
						 (AISeqAdrs[4]<<16)|
						 (AISeqAdrs[5]<<24));
	else
		AISeqAdrs += 6;
}

//----------------------------------------------------------
//	無条件でジャンプする
//----------------------------------------------------------
//C_JUMP		adrs
void AI_C_JUMP(void)
{
	AISeqAdrs = (u8*)((AISeqAdrs[1]<< 0)|
						 (AISeqAdrs[2]<< 8)|
						 (AISeqAdrs[3]<<16)|
						 (AISeqAdrs[4]<<24));
}

//------------------------------------------------------------
//	サブルーチン呼び出し
//------------------------------------------------------------
//C_CALL		adrs
void	AI_C_CALL(void)
{
	C_AIPushAdrsSet(AISeqAdrs+5);
	AISeqAdrs=(u8 *)(AISeqAdrs[1]<< 0|
					 AISeqAdrs[2]<< 8|
					 AISeqAdrs[3]<<16|
					 AISeqAdrs[4]<<24);
}

//----------------------------------------------------------
//	終了ｺｰﾄﾞ & サブルーチン終端ｺｰﾄﾞ
//----------------------------------------------------------
//C_AIEND
void	AI_C_AIEND(void)
{
	if(C_AIPopAdrsAct()) return;
	CONAI->AI_STATUSFLAG|=CONAI_STATUSFLAG_END;
}

//--------------------- AI用サブルーチン群 ------------------------

void	C_AIPushAdrsSet(u8 *adrs)
{
	CONAI->PushAdrsBuf[CONAI->PushAdrsCnt++]=adrs;
}

u8	C_AIPopAdrsAct(void)
{
	if(CONAI->PushAdrsCnt){
		CONAI->PushAdrsCnt--;
		AISeqAdrs=CONAI->PushAdrsBuf[CONAI->PushAdrsCnt];
		return 1;
	}
	else
		return 0;
}


//----------------------------------------------------------
//	手持ちの技の中にﾃﾝｼｮﾝを上げる技があるか調べて分岐
//----------------------------------------------------------

//C_LD_ALLWAZA_TENSYONCHECK
void AI_C_LD_ALLWAZA_TENSYONCHECK(void)
{
	int i;
	u8 ret = 0;
	
	for(i = 0; i < 4; i++){
		if(BreederParam[CONAI->AI_Brd].waza[i] == 0)
			continue;
		if(TensyonCheck(BreederParam[CONAI->AI_Brd].waza[i]) == 1){
			ret = 1;
			break;
		}
	}
	
	CONAI->RetWork = ret;
	AISeqAdrs++;
}

//C_IF_ALLWAZA_TENSYONCHECK_EQUAL		adrs
void AI_C_IF_ALLWAZA_TENSYONCHECK_EQUAL(void)
{
	AI_C_LD_ALLWAZA_TENSYONCHECK();
	if(CONAI->RetWork)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IFN_ALLWAZA_TENSYONCHECK_EQUAL		adrs
void AI_C_IFN_ALLWAZA_TENSYONCHECK_EQUAL(void)
{
	AI_C_LD_ALLWAZA_TENSYONCHECK();
	if(CONAI->RetWork == 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//----------------------------------------------------------
//	技Noを渡して手持ちの技の中にあるかどうかで分岐
//----------------------------------------------------------

//C_LD_WAZANOCHECK
void AI_C_LD_WAZANOCHECK(void)
{
	int i;
	u8 ret = 0;
	u16 wazano;
	
	wazano = AISeqAdrs[1] | (AISeqAdrs[2]<<8);
	for(i = 0; i < 4; i++){
		if(BreederParam[CONAI->AI_Brd].waza[i] == wazano){
			ret = 1;
			break;
		}
	}
	
	CONAI->RetWork = ret;
	AISeqAdrs += 3;
}

//C_IF_WAZANOCHECK_EQUAL		adrs
void AI_C_IF_WAZANOCHECK_EQUAL(void)
{
	AI_C_LD_WAZANOCHECK();
	if(CONAI->RetWork)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

//C_IFN_WAZANOCHECK_EQUAL		adrs
void AI_C_IFN_WAZANOCHECK_EQUAL(void)
{
	AI_C_LD_WAZANOCHECK();
	if(CONAI->RetWork == 0)
		AISeqAdrs = (u8*)((AISeqAdrs[0]<< 0)|
						 (AISeqAdrs[1]<< 8)|
						 (AISeqAdrs[2]<<16)|
						 (AISeqAdrs[3]<<24));
	else
		AISeqAdrs += 4;
}

