
//======================================================
//    waza_eff.c                                           
//                                                      
//    Copyright (C) 2001 GAME FREAK inc.
//======================================================

#include "common.h"
#include "madefine.h"	//add
#include "actor.h"
#include "actanm.h"
#include "decord.h"
#include "waza_eff.dat"
#include "bss.h"
#include "server.h"
#include "task.h"
#include "mus_tool.h"

#define	__WAZA_EFF_H_	//中のextern宣言は無視するためのdefine
#include "waza_eff.h"
#include "waza_dat.h"

#include "fight.h"		//add 2001.07.30(月) by matsuda
#include "wazatool.h"
#include "fight_ef.h"
#include "palanm.h"
#include "objdata.h"
#include "poketool.h"
#include "ef_tool.h"
#include "contest.h"
#include "client.h"
#include "gauge.h"
#include "cli_def.h"
#include "con_tool.h"

//-- 2つセットで --//
#define DEBUG_NUMPRINT
#include "pokesio.h"

#define SE_TIMEOVER 90

void	WazaEffectSet(u16);
void	WazaEffectAct(void);
void	DelWazaEffect(actWork *);
void	DelTaskEffect(u8);
void	WEST_CHAR_SET(void);
void	WEST_CHAR_DEL(void);
void	WEST_ADD_ACTOR(void);
void	WEST_WAIT(void);
void	WEST_WAIT_FLAG(void);
void	WEST_LOOP_LABEL(void);
void	WEST_LOOP(void);
void	WEST_SEQEND(void);
void	WEST_ADD_TASK(void);
void	WEST_SE(void);
void	WEST_POKEBG(void);
void	WEST_POKEBG_RESET(void);
void	WEST_BLDALPHA_SET(void);
void	WEST_BLDALPHA_RESET(void);
void	WEST_SEQ_CALL(void);
void	WEST_END_CALL(void);
void	WEST_WORK_SET(void);
void	WEST_TURN_CHK(void);
void	WEST_TURN_JP(void);
void	WEST_SEQ_JP(void);
void	WEST_HAIKEI_CHG(void);
void	WEST_HAIKEI_CHKCHG(void);
void	WEST_HAIKEI_RECOVER(void);
void	WEST_SEPLAY_PAN(void);
void	WEST_SEPAN(void);
void	WEST_SEPAN_FLOW(void);
void	WEST_SE_REPEAT(void);
void	WEST_SE_WAITPLAY(void);
void	WEST_BLDCNT_SET(void);
void	WEST_SE_TASK(void);
void	WEST_SEWAIT_FLAG(void);
void	WEST_WORKCHK_JP(void);
void	WEST_CONTEST_CHK_JP(void);
void	WEST_BGPRI_GAPSET(void);
void PokeBGDrop(u8 client_no, u8 bgno);
u8 ContestCheck(void);
u8 PokeBG2taimeCheck(u8 client_no);
void WazaHaikeiChange(u8 id);
void	WEST_HAIKEI_HALF_WAIT(void);
void	WEST_HAIKEI_CHG_WAIT(void);
void	WEST_HAIKEI_SET(void);
void	WEST_SEPAN_FLOWFIX(void);
void	WEST_SEPAN_FLOW_AF(void);
void	WEST_BGPRI_GAPSET2(void);
void	WEST_BGPRI_GAPSET3(void);

static void EffectBGClear(u8 id);
static void AutoPokeTailingSeq(u8 id);
static void ContPokeScrnSwap(void);
static void SePanFlowSeq(u8 id);
static void SeRepeatSeq(u8 id);
static void SeWaitPlaySeq(u8 id);
//static void WEST_BGMFADEIN_WAIT(void);
//static void WEST_BGMFADEOUT_WAIT(void);
void WazaEffectCommonSet(u32 *EffTblAdrs, u16 seqno, u8 fade_flg);
void	WEST_POKEBG_DROP(void);
void	WEST_POKEBG_DROP_RESET(void);
static void DropEffectBGClear(u8 id);
void	WEST_POKE_BANISH_ON(void);
void	WEST_POKE_BANISH_OFF(void);
void	WEST_PARTY_ATTACK_BGOFF(void);
void	WEST_PARTY_ATTACK_BGEND(void);
void	WEST_SE_STOP(void);
void BtlEffectHaikeiSet(u16 haikei_id);
void BtlEffectHaikeiRecover(void);

extern	u32	WazaEffSeqTbl[];
extern	u16 WazaEffBGMFadeNo[];

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define	ID_BACKUP	8
#define WAZA_EFF_BGMFADE		2	//BGMがﾌｪｰﾄﾞしていく速度(数字が小さいほど速い)
#define WAZA_EFF_BGMFADE_INWAIT	60	//BGMがﾌｪｰﾄﾞｲﾝ終了を取る関数がないので、適当にｳｪｲﾄを入れてみる

//----------------------------------------------------------
//	グローバル変数
//----------------------------------------------------------
u8	*WazaEffectSeqAdrs=0;
u8	*WazaEffectSeqAdrsTemp = 0;
pFunc WazaEffectSequence=0;
s8	WazaEffectWait=0;
u8	WazaEffectFlag=0;
u8	WazaEffectCount=0;
u8	WazaSeCount=0;
WazaKoukaCount	*pwkc = NULL;
s32 WazaEffDamage = 0;
u16 WazaEffPower = 0;
u16	WazaEffCharID[ID_BACKUP];
u8 WazaEffNatukido = 0;
u16 WazaEffWeather = 0;
s16	WazaEffWork[8];
u16 WazaSeTimeOverCheck;		//SEに終端がない時用のチェック
u8 EffBgID[2] = {};
u8 WazaCounter = 0;	//技ｴﾌｪｸﾄに対してのｶｳﾝﾀｰが入る
					//(0ﾀｰﾝ目のｿｰﾗｰﾋﾞｰﾑだとか、何発往復ﾋﾞﾝﾀをやるだとか)
u8 HaikeiChgFlg = 0;	//1:元背景ﾌｪｰﾄﾞｱｳﾄ中、2:背景差し替えたものをﾌｪｰﾄﾞｲﾝ中
u16 EffWazaNo = 0;	//今出している技エフェクトの技No
u8 AttackNo = 0;
u8 DefenceNo = 0;
u16 WazaEffMonsNo[CLIENT_MAX] = {};
s8 WazaEffPan = 0;

//=========================================================================
//	技エフェクトで使用するワークの初期化
//=========================================================================
void	WazaEffectWorkInit(void)
{
	int i;
	
	WazaEffectWait=0;
	WazaEffectFlag=0;
	WazaEffectCount=0;
	WazaSeCount=0;
	pwkc = NULL;
	WazaEffDamage = 0;
	WazaEffPower = 0;
	WazaEffNatukido = 0;
	for(i=0;i<ID_BACKUP;i++){
		WazaEffCharID[i]=0xffff;
	}
	for(i = 0; i < 8; i++)
		WazaEffWork[i] = 0;
	EffBgID[0] = 0xff;
	EffBgID[1] = 0xff;
	WazaCounter = 0;	//技ｴﾌｪｸﾄに対してのｶｳﾝﾀｰが入る
	HaikeiChgFlg = 0;	//1:元背景ﾌｪｰﾄﾞｱｳﾄ中、2:背景差し替えたものをﾌｪｰﾄﾞｲﾝ中
	EffWazaNo = 0;	//今出している技エフェクトの技No
	AttackNo = 0;
	DefenceNo = 0;
	WazaEffPan = 0;
}

//======================================================
//	技エフェクトの動作シーケンスセット
//======================================================

void	WazaEffectSet(u16 wazano)
{
	AttackNo = AttackClient;
	DefenceNo = DefenceClient;
	WazaEffectCommonSet(WazaEffSeqTbl, wazano, 1);
}

//----------------------------------------------------------
//	fade_flg = 1:seqnoによってBGMのﾌｪｰﾄﾞあり	0:BGMのﾌｪｰﾄﾞなし(全て音量半分)
//----------------------------------------------------------
void WazaEffectCommonSet(u32 *EffTblAdrs, u16 seqno, u8 fade_flg)
{
	int	i;
//	u8 bgm_fade = 0;

	if(ContestCheck() == 0){
		PokePriAllInit();	//ﾎﾟｹﾓﾝﾌﾟﾗｲｵﾘﾃｨ初期化
		//エフェクトの最中はゲージが邪魔にならないようにﾌﾟﾗｲｵﾘﾃｨを高くしておく
		GaugeHardPriSet(0);
		//PokeParaGetが重いので頻繁に使用するﾃﾞｰﾀは先にﾜｰｸに取っておく
		for(i = 0; i < CLIENT_MAX; i++){
			if(MineEnemyCheck(i))
				WazaEffMonsNo[i] = PokeParaGet(&PokeParaEnemy[SelMonsNo[i]], ID_monsno);
			else
				WazaEffMonsNo[i] = PokeParaGet(&PokeParaMine[SelMonsNo[i]], ID_monsno);
		}
	}
	else{
		for(i = 0; i < CLIENT_MAX; i++)
			WazaEffMonsNo[i] = conpara->monsno;
	}
	
	if(fade_flg == 0)
		EffWazaNo = 0;
	else
		EffWazaNo = seqno;
	
	for(i = 0; i < 8; i++)
		WazaEffWork[i] = 0;
	EffBgID[0] = 0xff;
	EffBgID[1] = 0xff;

	WazaEffectSeqAdrs=(u8*)EffTblAdrs[seqno];
	WazaEffectFlag=1;
	WazaEffectWait=0;
	WazaEffectSequence=&WazaEffectAct;
	for(i=0;i<ID_BACKUP;i++){
		WazaEffCharID[i]=0xffff;
	}
	
	//特定の技エフェクトでは音量を半分にする
	if(fade_flg){
		for(i = 0; WazaEffBGMFadeNo[i] != 0xffff; i++){
			if(seqno == WazaEffBGMFadeNo[i]){
				m4aMPlayVolumeControl(&m4a_mplay000,0xffff,128);
				break;
			}
		}
	}

	//add by matsuda 2002.08.23(金)
	Win0H = 0;
	Win0V = 0;
	Win1H = 0;
	Win1V = 0;
}


void	DelWazaEffect(actWork *Xreg)
{
	AffineDelActor(Xreg);	//add by matsuda 2002.01.18(金)
	DelActor(Xreg);
	WazaEffectCount--;
}

void	DelTaskEffect(u8 id)
{
	DelTask(id);
	WazaEffectCount--;
}

void DelSeTask(u8 id)
{
	DelTask(id);
	WazaSeCount--;
}

//----------------------------------------------------------
//----------------------------------------------------------

const pFunc WazaEffectSeqTbl[] =
{
	WEST_CHAR_SET,
	WEST_CHAR_DEL,
	WEST_ADD_ACTOR,
	WEST_ADD_TASK,
	WEST_WAIT,
	WEST_WAIT_FLAG,
	WEST_LOOP_LABEL,
	WEST_LOOP,
	WEST_SEQEND,
	WEST_SE,
	WEST_POKEBG,
	WEST_POKEBG_RESET,
	WEST_BLDALPHA_SET,
	WEST_BLDALPHA_RESET,
	WEST_SEQ_CALL,
	WEST_END_CALL,
	WEST_WORK_SET,
	WEST_TURN_CHK,
	WEST_TURN_JP,
	WEST_SEQ_JP,
	WEST_HAIKEI_CHG,
	WEST_HAIKEI_RECOVER,
	WEST_HAIKEI_HALF_WAIT,
	WEST_HAIKEI_CHG_WAIT,
	WEST_HAIKEI_SET,
	WEST_SEPLAY_PAN,
	WEST_SEPAN,
	WEST_SEPAN_FLOW,
	WEST_SE_REPEAT,
	WEST_SE_WAITPLAY,
	WEST_BLDCNT_SET,
	WEST_SE_TASK,
	WEST_SEWAIT_FLAG,
	WEST_WORKCHK_JP,
	WEST_POKEBG_DROP,
	WEST_POKEBG_DROP_RESET,
	WEST_CONTEST_CHK_JP,
	WEST_HAIKEI_CHKCHG,
	WEST_SEPAN_FLOWFIX,
	WEST_SEPAN_FLOW_AF,
	WEST_BGPRI_GAPSET,
	WEST_BGPRI_GAPSET2,
	WEST_BGPRI_GAPSET3,
	WEST_POKE_BANISH_ON,
	WEST_POKE_BANISH_OFF,
	WEST_PARTY_ATTACK_BGOFF,
	WEST_PARTY_ATTACK_BGEND,
	WEST_SE_STOP,
};

//======================================================
//	技エフェクトの動作シーケンス
//======================================================

void	WazaEffectCharIDSet(u16 id)
{
	int	i;
	for(i=0;i<ID_BACKUP;i++){
		if((u16)(WazaEffCharID[i]==0xffff)){
			WazaEffCharID[i]=id;
			return;
		}	
	}
}

void	WazaEffectCharIDReset(u16 id)
{
	int	i;
	for(i=0;i<ID_BACKUP;i++){
		if(WazaEffCharID[i]==id){
			WazaEffCharID[i]=0xffff;
			return;
		}	
	}
}

void	WEST_WAIT_ACT(void)
{
	if(WazaEffectWait<=0){
		WazaEffectSequence=WazaEffectAct;
		WazaEffectWait = 0;
	}
	else
		WazaEffectWait--;
}

void	WazaEffectAct()
{
	do{
		WazaEffectSeqTbl[*WazaEffectSeqAdrs]();
	}while(WazaEffectWait == 0 && WazaEffectFlag != 0);
}

void	WEST_CHAR_SET(void)
{
	u16	id;
	WazaEffectSeqAdrs++;
	id=*WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
	DecordCellSet((CellData *)&WazaEffDataCell[id-WAZACHR_ID_FAST_NUMBER]);
	DecordPalSet((PalData *)&WazaEffDataPal[id-WAZACHR_ID_FAST_NUMBER]);
	WazaEffectSeqAdrs+=2;
	WazaEffectCharIDSet(id-WAZACHR_ID_FAST_NUMBER);

	//-- CHAR_SETした時は自動的に1Syncｳｪｲﾄを入れるようにした 2002.02.28(木) --//
	WazaEffectWait = 1;
	WazaEffectSequence=WEST_WAIT_ACT;
}

void	WEST_CHAR_DEL(void)
{
	u16	id;
	WazaEffectSeqAdrs++;
	id=*WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
	CellDel(WazaEffDataCell[id-WAZACHR_ID_FAST_NUMBER].act_num);
	ObjPalRegNumDel(WazaEffDataCell[id-WAZACHR_ID_FAST_NUMBER].act_num);
	WazaEffectSeqAdrs+=2;
	WazaEffectCharIDReset(id-WAZACHR_ID_FAST_NUMBER);
}

void	WEST_ADD_ACTOR(void)
{
	actHeader	*headAdrs;
	u8	pri;
	int	i,j;
	s8 add_pri;
	s16 pri2;
	
	WazaEffectSeqAdrs++;

	headAdrs=(actHeader *)(*WazaEffectSeqAdrs+
			(*(WazaEffectSeqAdrs+1)<<8)+
			(*(WazaEffectSeqAdrs+2)<<16)+
			(*(WazaEffectSeqAdrs+3)<<24));

	WazaEffectSeqAdrs+=4;

	pri=*WazaEffectSeqAdrs;
	WazaEffectSeqAdrs++;

	j=*WazaEffectSeqAdrs;
	WazaEffectSeqAdrs++;

	for(i=0;i<j;i++){
		WazaEffWork[i]=*WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
		WazaEffectSeqAdrs+=2;
	}
	
	if(pri & 0x80){
		//Defence
		pri ^= 0x80;
		if(pri >= 64)
			add_pri = pri - 64;
		else
			add_pri = -pri;
		pri2 = GetPokeSoftPri(DefenceNo) + add_pri;
	}else{
		//Attack
		if(pri >= 64)
			add_pri = pri - 64;
		else
			add_pri = -pri;
		pri2 = GetPokeSoftPri(AttackNo) + add_pri;
	}
	if(pri2 < 3)
		pri2 = 3;
	
//	AddActorJump(headAdrs,WazaEffPos[FightType][ClientTypeGet(DefenceNo)].x,
//		WazaEffPos[FightType][ClientTypeGet(DefenceNo)].y,pri);
//		changed by soga 2001.09.26
	AddActorJump(headAdrs,
//		WazaEffPos[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(DefenceNo)].x,
//		WazaEffPos[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(DefenceNo)].y,pri);
		GetWazaEffPos(DefenceNo, PM_X), GetWazaEffPos(DefenceNo, PM_Y),pri2);
	WazaEffectCount++;
}

void	WEST_ADD_TASK(void)
{
	pTaskFunc	Adrs;
	u8		pri;
	int		i,j;

	WazaEffectSeqAdrs++;

	Adrs=(pTaskFunc )(*WazaEffectSeqAdrs+
			(*(WazaEffectSeqAdrs+1)<<8)+
			(*(WazaEffectSeqAdrs+2)<<16)+
			(*(WazaEffectSeqAdrs+3)<<24));

	WazaEffectSeqAdrs+=4;

	pri=*WazaEffectSeqAdrs;

	WazaEffectSeqAdrs++;

	j=*WazaEffectSeqAdrs;

	WazaEffectSeqAdrs++;

	for(i=0;i<j;i++){
		WazaEffWork[i]=*WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
		WazaEffectSeqAdrs+=2;
	}

	i=AddTask(Adrs,pri);
	Adrs(i);
	WazaEffectCount++;
}

void	WEST_WAIT(void)
{
	WazaEffectSeqAdrs++;
	WazaEffectWait=*WazaEffectSeqAdrs;
	if(WazaEffectWait == 0)		// 2002.01.30(水)
		WazaEffectWait = -1;	//waitの値が0の時は1syncで抜けれるように-1を入れておく
	WazaEffectSeqAdrs++;
	WazaEffectSequence=WEST_WAIT_ACT;
}

void	WEST_WAIT_FLAG(void)
{
	if(WazaEffectCount==0){
		WazaEffectSeqAdrs++;
		WazaEffectWait = 0;	//add by matsuda 2002.01.22(火)
	}
	else	//add by matsuda 2002.01.22(火)
		WazaEffectWait = 1;
}

void	WEST_LOOP_LABEL(void)
{
}

void	WEST_LOOP(void)
{
}

void	WEST_SEQEND(void)
{
	int	i;
	u8 bgm_fade = 0;
	
	if(WazaEffectCount != 0 || WazaSeCount != 0  
		|| EffBgID[0] != 0xff || EffBgID[1] != 0xff)
	{
		WazaSeTimeOverCheck = 0;
		WazaEffectWait = 1;
		return;
	}
	
	if(SeEndCheck()){								//2002.08.19 by 森　SEが終端がなかった時用に
		WazaSeTimeOverCheck++;						//エフェクトが終わっても３秒以上鳴るようだったら切る処理
		if(WazaSeTimeOverCheck > SE_TIMEOVER){
			m4aMPlayStop( &m4a_mplay001 );
			m4aMPlayStop( &m4a_mplay002 );
		}else{
			WazaEffectWait = 1;
			return;
		}
	}
	WazaSeTimeOverCheck = 0;
	
	for(i=0;i<ID_BACKUP;i++){
		if((u16)(WazaEffCharID[i]!=0xffff)){
			CellDel(WazaEffDataCell[WazaEffCharID[i]].act_num);
			ObjPalRegNumDel(WazaEffDataCell[WazaEffCharID[i]].act_num);
			WazaEffCharID[i]=0xffff;
		}
	}

	if(bgm_fade == 0){
		m4aMPlayVolumeControl(&m4a_mplay000,0xffff,256);
		if(ContestCheck() == 0){
			PokePriAllInit();	//ﾎﾟｹﾓﾝﾌﾟﾗｲｵﾘﾃｨ初期化
			GaugeHardPriSet(GAUGE_OAM_PRI);	//高くしていたﾌﾟﾗｲｵﾘﾃｨを元に戻す
		}
		WazaEffectFlag=0;
	}
}

//----------------------------------------------------------
//	効果音を鳴らす	2001.10.30(火) by matsuda
//----------------------------------------------------------
void	WEST_SE(void)
{
	u16	id;
	
	WazaEffectSeqAdrs++;
	id=*WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
	SePlay(id);
	WazaEffectSeqAdrs+=2;
}

//----------------------------------------------------------
//	ポケモンをBGに落とす
//	0=攻撃側　1=防御側　2=攻撃側(仲間含む)　3=防御側(仲間含む)
//----------------------------------------------------------
void	WEST_POKEBG(void)
{
	u8 flag, client_no;
	u8 pokeact, id;
	u8 bg_no;
	u8 client_type;
	
	WazaEffectSeqAdrs++;
	
	flag = *WazaEffectSeqAdrs;
	
	if(flag == 0)	//2002.06.19(水) 0,1番でも2体ともBGに落とすように変更
		flag = 2;
	else if(flag == 1)
		flag = 3;
		
	if(flag == 0 || flag == 2)
		client_no = AttackNo;
	else
		client_no = DefenceNo;
	
	//***************************************************
	//**********	BG1		*****************************
	//***************************************************
	if(PokeBG2taimeCheck(client_no))
	{
		client_type = ClientTypeGet(client_no);
		if(client_type == BSS_CLIENT_MINE2 || client_type == BSS_CLIENT_ENEMY || ContestCheck())
			bg_no = 0;	//ﾌﾟﾗｲｵﾘﾃｨの関係上、1体目、又はｺﾝﾃｽﾄならBG1に落す
		else
			bg_no = 1;
		PokeBGDrop(client_no, bg_no);
		//-- OBJﾎﾟｹﾓﾝ自動追尾ｽｸﾛｰﾙ --//
		pokeact = PokemonStruct[client_no];
		id = AddTask(AutoPokeTailingSeq, 10);
		TaskTable[id].work[0] = pokeact;
		TaskTable[id].work[1] = ActWork[pokeact].x + ActWork[pokeact].dx;
		TaskTable[id].work[2] = ActWork[pokeact].y + ActWork[pokeact].dy;
		if(bg_no == 0){
			TaskTable[id].work[3] = ScrX1;
			TaskTable[id].work[4] = ScrY1;
		}else{
			TaskTable[id].work[3] = ScrX2;
			TaskTable[id].work[4] = ScrY2;
		}
		TaskTable[id].work[5] = bg_no;	//何枚めのﾌﾘｰBGか
		TaskTable[id].work[6] = client_no;
		EffBgID[0] = id;
	}
	//***************************************************
	//**********	BG1ここまで    **********************
	//***************************************************

	//***************************************************
	//**********	BG2		*****************************
	//***************************************************
	client_no ^= 2;
//	if(flag > 1 && 
//		( ! (ClientPokeExistCheck(client_no) == 0 
//			|| SelMonsNo[client_no] == SelMonsNo[client_no^2])))
	if(flag > 1 && PokeBG2taimeCheck(client_no))
	{
		client_type = ClientTypeGet(client_no);
		if(client_type == BSS_CLIENT_MINE2 || client_type == BSS_CLIENT_ENEMY || ContestCheck())
			bg_no = 0;	//ﾌﾟﾗｲｵﾘﾃｨの関係上、1体目、又はｺﾝﾃｽﾄならBG1に落す
		else
			bg_no = 1;
		PokeBGDrop(client_no, bg_no);
		//-- OBJﾎﾟｹﾓﾝ自動追尾ｽｸﾛｰﾙ --//
		pokeact = PokemonStruct[client_no];
		id = AddTask(AutoPokeTailingSeq, 10);
		TaskTable[id].work[0] = pokeact;
		TaskTable[id].work[1] = ActWork[pokeact].x + ActWork[pokeact].dx;
		TaskTable[id].work[2] = ActWork[pokeact].y + ActWork[pokeact].dy;
		if(bg_no == 0){
			TaskTable[id].work[3] = ScrX1;
			TaskTable[id].work[4] = ScrY1;
		}else{
			TaskTable[id].work[3] = ScrX2;
			TaskTable[id].work[4] = ScrY2;
		}
		TaskTable[id].work[5] = bg_no;	//何枚めのﾌﾘｰBGか
		TaskTable[id].work[6] = client_no;
		EffBgID[1] = id;
	}
	//***************************************************
	//**********	BG2ここまで    **********************
	//***************************************************
	
	WazaEffectSeqAdrs++;
}

//=========================================================================
//	2体目のﾎﾟｹﾓﾝも画面に出ているかﾁｪｯｸする
//	引数:2体目のﾎﾟｹﾓﾝのClientNo
//	0:出てない	1:出ている
//=========================================================================
u8 PokeBG2taimeCheck(u8 client_no)
{
	if(ContestCheck()){
		if(client_no == AttackNo)
			return 1;
		else
			return 0;
	}
		
	if(ClientPokeExistCheck(client_no)){
		if(ContestCheck())
			return 1;
		else if(Climem[client_no].act_banish == 0 || ActWork[PokemonStruct[client_no]].banish == 0)
			return 1;
		else
			return 0;
	}
	else
		return 0;
}

//=========================================================================
//	ポケモンを指定BGに落とす	※監視タスク付きVersion
// 0:攻撃側ﾎﾟｹﾓﾝをBG1に落す					1:防御側ﾎﾟｹﾓﾝをBG1に落す
// 2:攻撃側ﾎﾟｹﾓﾝとその相方をBG1とBG2に落す	3:防御側ﾎﾟｹﾓﾝとその相方をBG1とBG2に落す
//=========================================================================
void PokeBGDrop(u8 client_no, u8 bgno)
{
	u8 pokeact;
	vu8 dma_wait;
	WazaBgData wazabg;
	u8 client_type;
	
	if(bgno == 0)
	{
		GetWazaEffBgAdrs(&wazabg);
		DIV_DMACLEAR(3, 0, wazabg.CharAdrs, 0x2000, 32);
		dma_wait = 0;	dma_wait = 0;
		//DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
		//戦闘はﾎﾟｹﾓﾝのｷｬﾗが入ってる可能性が高いので、最後のｷｬﾗを空白として使用
		DIV_DMACLEAR(3, 0x2000/0x20 - 1, wazabg.ScrnAdrs, 0x1000, 16);
		
		(*(vBgCnt *)REG_BG1CNT).Priority = 2;
		(*(vBgCnt *)REG_BG1CNT).Size = 1;
		(*(vBgCnt *)REG_BG1CNT).Loop = 0;
		
		pokeact = PokemonStruct[client_no];
		ScrX1 = -(ActWork[pokeact].x+ActWork[pokeact].dx) + 32;
		if(ContestCheck()){
			if(ContestPokeFlipCheck(conpara->monsno))
				ScrX1 -= 1;	//なぜか1ﾄﾞｯﾄずれるので(ﾎﾟｹﾓﾝを反転してるせい?)
		}
		ScrY1 = -(ActWork[pokeact].y+ActWork[pokeact].dy) + 32;
		ActWork[PokemonStruct[client_no]].banish = 1;

		//BGに落とした瞬間の絵が見えてしまうので、あらかじめ画面外にしておく
		*(vu16 *)REG_BG1HOFS = ScrX1;//240+64;
		*(vu16 *)REG_BG1VOFS = ScrY1;//160+64;
		PaletteWorkSet(&PaletteWork[16*16+client_no*16], 16*wazabg.PlttNo, 0x20);
		DIV_DMACOPY(3, &PaletteWork[16*16+client_no*16], BG_PLTT+(16*wazabg.PlttNo)*2, 0x20, 32);
	//	BattleMonsOBJ2BG(0, 0, client_no, 8);
//		MonsOBJ2BG(0, 0, ClientTypeGet(client_no), wazabg.PlttNo, 
//			BTL_BG_CHARADRS1, BTL_BG_SCRNBASE1);
		if(ContestCheck())
			client_type = BSS_CLIENT_MINE;
		else
			client_type = ClientTypeGet(client_no);
		MonsOBJ2BG(0, 0, client_type, wazabg.PlttNo, 
			wazabg.CharAdrs-(void*)BG_VRAM, (wazabg.ScrnAdrs-(void*)BG_VRAM)/0x800,
			(*(vBgCnt *)REG_BG1CNT).CharBasep);
		if(ContestCheck())
			ContPokeScrnSwap();
	}
	else
	{
		DIV_DMACLEAR(3, 0, BG_VRAM + BTL_BG_CHARADRS2, 0x2000, 32);
		dma_wait = 0;	dma_wait = 0;
		DIV_DMACLEAR(3, 0, BG_VRAM + 0x800*BTL_BG_SCRNBASE2, 0x800, 32);
		(*(vBgCnt *)REG_BG2CNT).Priority = 2;
		(*(vBgCnt *)REG_BG2CNT).Size = 1;
		(*(vBgCnt *)REG_BG2CNT).Loop = 0;

		pokeact = PokemonStruct[client_no];
		ScrX2 = -(ActWork[pokeact].x+ActWork[pokeact].dx) + 32;
		ScrY2 = -(ActWork[pokeact].y+ActWork[pokeact].dy) + 32;
		ActWork[PokemonStruct[client_no]].banish = 1;

		//BGに落とした瞬間の絵が見えてしまうので、あらかじめ画面外にしておく
		*(vu16 *)REG_BG2HOFS = ScrX2;//240+64;
		*(vu16 *)REG_BG2VOFS = ScrY2;//160+64;
		
		PaletteWorkSet(&PaletteWork[16*16+client_no*16], 16*BTL_BG_PAL2, 0x20);
		DIV_DMACOPY(3, &PaletteWork[16*16+client_no*16], BG_PLTT+32*BTL_BG_PAL2, 0x20, 32);
		MonsOBJ2BG(0, 0, ClientTypeGet(client_no), BTL_BG_PAL2, 
			BTL_BG_CHARADRS2, BTL_BG_SCRNBASE2, (*(vBgCnt *)REG_BG2CNT).CharBasep);
	}
}

//----------------------------------------------------------
//	ｺﾝﾃｽﾄ時、ﾎﾟｹﾓﾝは反転してるのでBGに落とした時、ｽｸﾘｰﾝﾃﾞｰﾀのｽﾜｯﾌﾟを行う
//----------------------------------------------------------
static void ContPokeScrnSwap(void)
{
	WazaBgData wazabg;
	u16 *scrn;
	int x, y, ypos;
	u16 temp;
	
	if(ContestPokeFlipCheck(conpara->monsno) == 0)
		return;
	
	GetWazaEffBgAdrs(&wazabg);
	scrn = wazabg.ScrnAdrs;
	
	for(y = 0; y < 8; y++){
		for(x = 0; x < (8/2); x++){
			ypos = y*0x20;
			temp = scrn[x + ypos];
			scrn[x + ypos] = scrn[(7-x) + ypos];
			scrn[(7-x) + ypos] = temp;
		}
	}
	for(y = 0; y < 8; y++){
		for(x = 0; x < 8; x++)
			scrn[x + y*0x20] ^= 0x0400;	//Hflip
	}
}

//----------------------------------------------------------
//	ｺﾝﾃｽﾄ時、背景切り替えを行った時にｽｸﾘｰﾝﾃﾞｰﾀが戦闘とは違うので
//	ｺﾝﾃｽﾄ用に書き換える。
//----------------------------------------------------------
//----------------------------------------------------------
//	BGｴﾌｪｸﾄのｽｸﾘｰﾝﾃﾞｰﾀで、戦闘とｺﾝﾃｽﾄではﾊﾟﾚｯﾄ位置が違うので
//	ｽｸﾘｰﾝﾃﾞｰﾀを書き換える
//	pal_no = pal_noで指定したﾊﾟﾚｯﾄにｽｸﾘｰﾝﾃﾞｰﾀ全てを書き換える(0～15)
//	CharNoOffset = ｷｬﾗNoにこの値だけ足しこむ
//----------------------------------------------------------
void ScrnPalRewrite(u16 pal_no, u32 ScrnBaseAdrs, u32 CharNoOffset, u8 scrn_num)
{
	u16 *scrn;
	u8 x,y;
	u8 end_y;
	
	if(scrn_num == 0)
		end_y = 32;
	else
		end_y = 64;
		
	pal_no <<= 12;
	for(y = 0; y < end_y; y++){
		for(x = 0; x < 32; x++){
			scrn = (u16*)(ScrnBaseAdrs+((y*32+x)*2));
			//scrn->CharNo += 0x0100;
			//scrn->Pltt = pal_no;
			*scrn &= 0x0fff;	//palno clear
			*scrn |= pal_no;
			*scrn += CharNoOffset;
		}
	}
}

//=========================================================================
//	BGに落としたポケモンのVRAMをクリアーする
//	(ﾎﾟｹﾓﾝのｱｸﾀｰのbanishは元に戻してないので自分で戻すこと!)
//=========================================================================
void PokeBGDropClear(u8 bgno)
{
	vu8 dma_wait;
	WazaBgData wazabg;
	
	GetWazaEffBgAdrs(&wazabg);
	if(bgno == 0 || ContestCheck())
	{
		
		DIV_DMACLEAR(3, 0, wazabg.CharAdrs, 0x2000, 32);
		dma_wait = 0;	dma_wait = 0;
		DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
		ScrX1 = 0;
		ScrY1 = 0;
	}
	else
	{
		DIV_DMACLEAR(3, 0, BG_VRAM + BTL_BG_CHARADRS2, 0x2000, 32);
		dma_wait = 0;	dma_wait = 0;
		DIV_DMACLEAR(3, 0, BG_VRAM + 0x800*BTL_BG_SCRNBASE2, 0x800, 32);
		ScrX2 = 0;
		ScrY2 = 0;
	}
}

//=========================================================================
//	ｴﾌｪｸﾄBGを指定したﾎﾟｹﾓﾝの動きに合わせて自動スクロールさせる
//	ﾊﾟﾚｯﾄの同期も行う
// offset	0:ﾎﾟｹﾓﾝのActNo	1:ﾎﾟｹﾓﾝのX座標初期値   2:ﾎﾟｹﾓﾝのY座標初期値
//			3:ScrXの初期値	4:ScrYの初期値
//			5:何枚目のﾌﾘｰBGか(0:0枚目(BG1)  1:1枚目(BG2))
//=========================================================================
static void AutoPokeTailingSeq(u8 id)
{
	u8 pokeact;
	s16 offsetX, offsetY;
	u8 client_no;
	WazaBgData wazabg;
	
	pokeact = TaskTable[id].work[0];
	client_no = TaskTable[id].work[6];
	GetWazaEffBgAdrs(&wazabg);
	offsetX = TaskTable[id].work[1] - (ActWork[pokeact].x+ActWork[pokeact].dx);
	offsetY = TaskTable[id].work[2] - (ActWork[pokeact].y+ActWork[pokeact].dy);
	if(TaskTable[id].work[5] == 0)
	{
		ScrX1 = TaskTable[id].work[3] + offsetX;
		ScrY1 = TaskTable[id].work[4] + offsetY;
//		DIV_DMACOPY(3, &PaletteWorkTrans[16*16+client_no*16],
//			&PaletteWorkTrans[16*BTL_BG_PAL1], 0x20,32);
		DIV_DMACOPY(3, &PaletteWorkTrans[16*16+client_no*16],
			&PaletteWorkTrans[16*wazabg.PlttNo], 0x20,32);
	}
	else
	{
		ScrX2 = TaskTable[id].work[3] + offsetX;
		ScrY2 = TaskTable[id].work[4] + offsetY;
		DIV_DMACOPY(3, &PaletteWorkTrans[16*16+client_no*16],
			&PaletteWorkTrans[16*BTL_BG_PAL2], 0x20,32);
	}
}



//----------------------------------------------------------
//	BGを消してポケモンを元に戻す
//	0=攻撃側　1=防御側　2=攻撃側(仲間含む)　3=防御側(仲間含む)
//----------------------------------------------------------
void	WEST_POKEBG_RESET(void)
{
	u8 flag, client_no;
	u8 id;
	
	WazaEffectSeqAdrs++;

	flag = *WazaEffectSeqAdrs;
	if(flag == 0)	//2002.06.19(水) 0,1番でも2体ともBGに落とすように変更
		flag = 2;
	else if(flag == 1)
		flag = 3;

	if(flag == 0 || flag == 2)
		client_no = AttackNo;
	else
		client_no = DefenceNo;

	if(EffBgID[0] != 0xff)
		ActWork[PokemonStruct[client_no]].banish = 0;
	
	//-- BG2枚目 --//
//	if(flag > 1 && PokeBG2taimeCheck(client_no^2))	2002.07.16(火)
	if(flag > 1 && EffBgID[1] != 0xff)
	{
		ActWork[PokemonStruct[client_no^2]].banish = 0;
	}
	else
		flag = 0;	//1枚目のﾀｽｸのみをDelするようにﾌﾗｸﾞを変更
	
	id = AddTask(EffectBGClear, 5);
	TaskTable[id].work[0] = flag;
	TaskTable[id].work[2] = client_no;
	WazaEffectSeqAdrs++;
}

static void EffectBGClear(u8 id)
{
	u8 client_type, bg_no;
	
	if(TaskTable[id].work[1]++ == 0)	//1wait
		return;
	client_type = ClientTypeGet(TaskTable[id].work[2]);
	if(client_type == BSS_CLIENT_MINE2 || client_type == BSS_CLIENT_ENEMY || ContestCheck())
		bg_no = 0;	//ﾌﾟﾗｲｵﾘﾃｨの関係上、1体目、又はｺﾝﾃｽﾄならBG1に落す
	else
		bg_no = 1;
	
	if(EffBgID[0] != 0xff){
		PokeBGDropClear(bg_no);
		DelTask(EffBgID[0]);
		EffBgID[0] = 0xff;
	}
	
	if(TaskTable[id].work[0] > 1)
	{
		PokeBGDropClear(bg_no ^ 1);
		DelTask(EffBgID[1]);
		EffBgID[1] = 0xff;
	}
	DelTask(id);
}

//=========================================================================
//	ポケモンをBGに落す	※監視タスクなしVersion
// 0:攻撃側ﾎﾟｹﾓﾝをBG1に落す					1:防御側ﾎﾟｹﾓﾝをBG1に落す
// 2:攻撃側ﾎﾟｹﾓﾝとその相方をBG1とBG2に落す	3:防御側ﾎﾟｹﾓﾝとその相方をBG1とBG2に落す
//=========================================================================
void	WEST_POKEBG_DROP(void)
{
	u8 flag, client_no;
	u8 client_type, bg_no;
	
	WazaEffectSeqAdrs++;
	
	flag = *WazaEffectSeqAdrs;
	if(flag == 0)	//2002.06.19(水) 0,1番でも2体ともBGに落とすように変更
		flag = 2;
	else if(flag == 1)
		flag = 3;

	if(flag == 0 || flag == 2)
		client_no = AttackNo;
	else
		client_no = DefenceNo;
	
	//-- BG1 --//
	if(PokeBG2taimeCheck(client_no)){
		client_type = ClientTypeGet(client_no);
		if(client_type == BSS_CLIENT_MINE2 || client_type == BSS_CLIENT_ENEMY || ContestCheck())
			bg_no = 0;	//ﾌﾟﾗｲｵﾘﾃｨの関係上、1体目、又はｺﾝﾃｽﾄならBG1に落す
		else
			bg_no = 1;
		PokeBGDrop(client_no, bg_no);
		ActWork[PokemonStruct[client_no]].banish = 0;
	}
	
	//-- BG2 --//
	client_no ^= 2;
	if(flag > 1 && PokeBG2taimeCheck(client_no)){
		client_type = ClientTypeGet(client_no);
		if(client_type == BSS_CLIENT_MINE2 || client_type == BSS_CLIENT_ENEMY || ContestCheck())
			bg_no = 0;	//ﾌﾟﾗｲｵﾘﾃｨの関係上、1体目、又はｺﾝﾃｽﾄならBG1に落す
		else
			bg_no = 1;
		PokeBGDrop(client_no, bg_no);
		ActWork[PokemonStruct[client_no]].banish = 0;
	}
	
	WazaEffectSeqAdrs++;
}

//----------------------------------------------------------
//	POKEBG_DROPを使用してBGに落したポケモンを元に戻す
// POKEBG_DROPと同じ引数を指定
//----------------------------------------------------------
void	WEST_POKEBG_DROP_RESET(void)
{
	u8 flag, client_no;
	u8 id;
	
	WazaEffectSeqAdrs++;

	flag = *WazaEffectSeqAdrs;
	if(flag == 0)	//2002.06.19(水) 0,1番でも2体ともBGに落とすように変更
		flag = 2;
	else if(flag == 1)
		flag = 3;

	if(flag == 0 || flag == 2)
		client_no = AttackNo;
	else
		client_no = DefenceNo;

	if(PokeBG2taimeCheck(client_no))
		ActWork[PokemonStruct[client_no]].banish = 0;
	
	//-- BG2枚目 --//
	if(flag > 1 && PokeBG2taimeCheck(client_no^2))
//	if(flag > 1) && EffBgID[1] != 0xff)
		ActWork[PokemonStruct[client_no^2]].banish = 0;
	else
		flag = 0;	//1枚目のﾀｽｸのみをDelするようにﾌﾗｸﾞを変更
	
	id = AddTask(DropEffectBGClear, 5);
	TaskTable[id].work[0] = flag;
	TaskTable[id].work[2] = client_no;
	
	WazaEffectSeqAdrs++;
}

static void DropEffectBGClear(u8 id)
{
	u8 client_type, bg_no;
	u8 client_no;
	
	if(TaskTable[id].work[1]++ == 0)	//1wait
		return;

	client_no = TaskTable[id].work[2];
	client_type = ClientTypeGet(client_no);
	if(client_type == BSS_CLIENT_MINE2 || client_type == BSS_CLIENT_ENEMY || ContestCheck())
		bg_no = 0;	//ﾌﾟﾗｲｵﾘﾃｨの関係上、1体目、又はｺﾝﾃｽﾄならBG1に落す
	else
		bg_no = 1;

	if(PokeBG2taimeCheck(client_no))
		PokeBGDropClear(bg_no);
	if(TaskTable[id].work[0] > 1 && PokeBG2taimeCheck(client_no ^2))
		PokeBGDropClear(bg_no^1);
	DelTask(id);
}

//----------------------------------------------------------
//	半透明レジスタセット
//----------------------------------------------------------
void	WEST_BLDALPHA_SET(void)
{
	u16 eva;
	u16 evb;
	
	WazaEffectSeqAdrs++;
	eva = *WazaEffectSeqAdrs;
	WazaEffectSeqAdrs++;
	evb = (*WazaEffectSeqAdrs) << 8;
	WazaEffectSeqAdrs++;
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
//	*(vu16*)REG_BLDALPHA = 0xc | (0x8<<8);	//7 | (9<<8);
	*(vu16*)REG_BLDALPHA = eva | evb;
}

//----------------------------------------------------------
//	BLDコントロールレジスタセット
//----------------------------------------------------------
void	WEST_BLDCNT_SET(void)
{
	u16 work1;
	u16 work2;
	
	WazaEffectSeqAdrs++;
	work1 = *WazaEffectSeqAdrs;
	WazaEffectSeqAdrs++;
	work2 = (*WazaEffectSeqAdrs) << 8;
	WazaEffectSeqAdrs++;
	*(vu16*)REG_BLDCNT = work1 | work2;
}

//----------------------------------------------------------
//	半透明レジスタを初期化する
//----------------------------------------------------------
void	WEST_BLDALPHA_RESET(void)
{
	WazaEffectSeqAdrs++;
	*(vu16*)REG_BLDCNT = 0;
	*(vu16*)REG_BLDALPHA = 0;
}

//----------------------------------------------------------
//	関数ｺｰﾙを使用する
//----------------------------------------------------------
void	WEST_SEQ_CALL(void)
{
	WazaEffectSeqAdrs++;
	WazaEffectSeqAdrsTemp = WazaEffectSeqAdrs + 4;
	WazaEffectSeqAdrs = (u8*)(*WazaEffectSeqAdrs+
			(*(WazaEffectSeqAdrs+1)<<8)+
			(*(WazaEffectSeqAdrs+2)<<16)+
			(*(WazaEffectSeqAdrs+3)<<24));
}

//----------------------------------------------------------
//	関数ｺｰﾙで呼び出された時のEndｺｰﾄﾞ(これで呼び出し元に復帰)
//----------------------------------------------------------
void	WEST_END_CALL(void)
{
	WazaEffectSeqAdrs = WazaEffectSeqAdrsTemp;
}


//----------------------------------------------------------
//	WazaEffWorkに値をセットする
//		ｾｯﾄする配列の添え字：ｾｯﾄする値
//----------------------------------------------------------
void	WEST_WORK_SET(void)
{
	u8 soeji;
	s16 work;

	WazaEffectSeqAdrs++;
	soeji = *WazaEffectSeqAdrs;
	WazaEffectSeqAdrs++;
	work = *WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
	WazaEffectSeqAdrs += 2;
	WazaEffWork[soeji] = work;
}

//----------------------------------------------------------
//	ﾀｰﾝが偶数か奇数か調べて、別々のﾙｰﾁﾝにSEQ_JPで飛ぶ
//	(偶数なら最初の、奇数なら後のｱﾄﾞﾚｽに飛ぶ)
//----------------------------------------------------------
void	WEST_TURN_CHK(void)
{
	WazaEffectSeqAdrs++;
	
	if(WazaCounter & 1)
		WazaEffectSeqAdrs += 4;

	WazaEffectSeqAdrs = (u8*)(*WazaEffectSeqAdrs+
			(*(WazaEffectSeqAdrs+1)<<8)+
			(*(WazaEffectSeqAdrs+2)<<16)+
			(*(WazaEffectSeqAdrs+3)<<24));
}

//----------------------------------------------------------
//	WazaCounterが指定された値と同じならばSEQ_JPする
//----------------------------------------------------------
void	WEST_TURN_JP(void)
{
	u8 turn;
	
	WazaEffectSeqAdrs++;

	turn = *WazaEffectSeqAdrs;
	WazaEffectSeqAdrs++;
	
	if(turn == WazaCounter)
	{
		WazaEffectSeqAdrs = (u8*)(*WazaEffectSeqAdrs+
				(*(WazaEffectSeqAdrs+1)<<8)+
				(*(WazaEffectSeqAdrs+2)<<16)+
				(*(WazaEffectSeqAdrs+3)<<24));
	}
	else
		WazaEffectSeqAdrs += 4;
}

//----------------------------------------------------------
//	指定ｱﾄﾞﾚｽにジャンプする
//----------------------------------------------------------
void	WEST_SEQ_JP(void)
{
	WazaEffectSeqAdrs++;
	
	WazaEffectSeqAdrs = (u8*)(*WazaEffectSeqAdrs+
			(*(WazaEffectSeqAdrs+1)<<8)+
			(*(WazaEffectSeqAdrs+2)<<16)+
			(*(WazaEffectSeqAdrs+3)<<24));
}

//----------------------------------------------------------
//	ｺﾝﾃｽﾄか通常の戦闘かﾁｪｯｸする
//	戻り値: 0 = 通常戦闘		1 = ｺﾝﾃｽﾄ
//----------------------------------------------------------
u8 ContestCheck(void)
{
	if(sys.FieldBattleFlag == 0)
		return 1;
	return 0;
}

//----------------------------------------------------------
//	背景グラフィックデータを差し替え
//----------------------------------------------------------
void	WEST_HAIKEI_CHG(void)
{
	u8 haikei_id;
	u8 id;
	
	WazaEffectSeqAdrs++;
	
/*
	if(ContestCheck())		//現状は何もしないで終了
	{
		WazaEffectSeqAdrs++;
		return;
	}
*/

	haikei_id = *WazaEffectSeqAdrs;
	WazaEffectSeqAdrs++;
	id = AddTask(WazaHaikeiChange, 5);
	TaskTable[id].work[0] = haikei_id;
	
	//--  --//
//	WazaEffectCount++;
	HaikeiChgFlg = 1;
}

//----------------------------------------------------------
//	自機側用、敵側用、ｺﾝﾃｽﾄ用の背景IDを指定して背景グラフィックデータを差し替え
//	自機側背景ID、敵側背景ID、ｺﾝﾃｽﾄ背景ID
//----------------------------------------------------------
void	WEST_HAIKEI_CHKCHG(void)
{
	u8 mine_haikei;
	u8 enemy_haikei;
	u8 contest_haikei;
	u8 id;
	
	WazaEffectSeqAdrs++;
	
	mine_haikei = WazaEffectSeqAdrs[0];
	enemy_haikei = WazaEffectSeqAdrs[1];
	contest_haikei = WazaEffectSeqAdrs[2];
	WazaEffectSeqAdrs += 3;
	id = AddTask(WazaHaikeiChange, 5);
	if(ContestCheck())
		TaskTable[id].work[0] = contest_haikei;
	else if(MineEnemyCheck(DefenceNo) == SIDE_MINE)	//AttackNo))
		TaskTable[id].work[0] = enemy_haikei;
	else
		TaskTable[id].work[0] = mine_haikei;
	
	//--  --//
//	WazaEffectCount++;
	HaikeiChgFlg = 1;
}

//-- 差し替え実行処理:タスク --//

void WazaHaikeiChange(u8 id)
{
	s16 haikei_id;
	
	if(TaskTable[id].work[10] == 0){
		HardFadeReq(0xe8, 0, 0, 16, 0);
		TaskTable[id].work[10]++;
		return;
	}
	
	if(FadeData.fade_sw == 0 && TaskTable[id].work[10] == 1){
		//BGを変える前に1Syncｳｪｲﾄを入れる
		//(外部で行っている元絵に対してのﾊﾟﾚｯﾄｱﾆﾒ等を止めるﾀｲﾐﾝｸﾞを作るため)
		TaskTable[id].work[10]++;
		HaikeiChgFlg = 2;
	}else if(FadeData.fade_sw == 0 && TaskTable[id].work[10] == 2){
		haikei_id = TaskTable[id].work[0];
		if(haikei_id == -1){
			BtlEffectHaikeiRecover();
		#if TUUSHIN_DEBUG
			if(FightType&FIGHT_TYPE_TUUSHIN)
				DebugNumPrintInit(14,3,26,2);
		#endif
		}
		else
		{	//ｴﾌｪｸﾄ用の背景に差し替える
			BtlEffectHaikeiSet(haikei_id);
		}
		HardFadeReq(0xe8, 0, 16,0, 1);
		TaskTable[id].work[10]++;
//		HaikeiChgFlg = 2;
		return;
	}
	
	if(FadeData.fade_sw == 0 && TaskTable[id].work[10] == 3){
		DelTask(id);
//		WazaEffectCount--;
		HaikeiChgFlg = 0;
	}
}

//----------------------------------------------------------
//	指定した背景IDのデータをｾｯﾄする
//----------------------------------------------------------
void BtlEffectHaikeiSet(u16 haikei_id)
{
	if(ContestCheck()){
		//DecordVram(WazaEffHaikei[haikei_id].scr_adrs, (void *)SCREEN_BASE26_ADDR);
		//ScrnPalRewrite(GetHaikeiPalNo(), SCREEN_BASE26_ADDR, 0x0100);
		DecordWram(WazaEffHaikei[haikei_id].scr_adrs, 
			(void*)&UserWork[WAZAEFF_USERWORK]);
		ScrnPalRewrite(GetHaikeiPalNo(), (u32)&UserWork[WAZAEFF_USERWORK], 0x0100, 0);
		DIV_DMACOPY(3, (void*)&UserWork[WAZAEFF_USERWORK], (void*)SCREEN_BASE26_ADDR,
			0x800, 32);
		
		DecordVram(WazaEffHaikei[haikei_id].chr_adrs, (void *)CHAR_BASE0_ADDR+0x2000);
		DecordPaletteWork(WazaEffHaikei[haikei_id].col_adrs, GetHaikeiPalNo()*16, 0x20);
	}
	else{
		DecordVram(WazaEffHaikei[haikei_id].scr_adrs, (void *)BG_VRAM+26*0x800);
		DecordVram(WazaEffHaikei[haikei_id].chr_adrs, (void *)BG_VRAM+16*0x800);
		DecordPaletteWork(WazaEffHaikei[haikei_id].col_adrs, PA_BG2, 0x20);
	}
}

//----------------------------------------------------------
//	変更された背景を元に戻す
//----------------------------------------------------------
void BtlEffectHaikeiRecover(void)
{
	//元のBGに戻す
	if(ContestCheck())
		ContestHaikeiRecover();
	else
		FightBG3Set();
}

//----------------------------------------------------------
//	差し替えた背景グラフィックを元に戻す
//----------------------------------------------------------
void	WEST_HAIKEI_RECOVER(void)
{
	u8 id;
	
	WazaEffectSeqAdrs++;
	
//	if(ContestCheck())		//現状は何もしないで終了
//		return;
	
	id = AddTask(WazaHaikeiChange, 5);
	TaskTable[id].work[0] = -1;	//元に戻すというﾌﾗｸﾞ
	
	//--  --//
	//WazaEffectCount++;
	HaikeiChgFlg = 1;
}


//----------------------------------------------------------
//	元背景がﾌｪｰﾄﾞｱｳﾄされるまでｳｪｲﾄ
//----------------------------------------------------------
void	WEST_HAIKEI_HALF_WAIT(void)
{
/*	if(ContestCheck())		//現状は何もしないで終了
	{
		WazaEffectSeqAdrs++;
		return;
	}
*/
	if(HaikeiChgFlg == 2){
		WazaEffectSeqAdrs++;
		WazaEffectWait = 0;
	}else
		WazaEffectWait = 1;
}

//----------------------------------------------------------
//	背景が完全に差し変わるまでｳｪｲﾄ
//----------------------------------------------------------
void	WEST_HAIKEI_CHG_WAIT(void)
{
/*	if(ContestCheck())		//現状は何もしないで終了
	{
		WazaEffectSeqAdrs++;
		return;
	}
*/
	if(HaikeiChgFlg == 0){
		WazaEffectSeqAdrs++;
		WazaEffectWait = 0;
	}else
		WazaEffectWait = 1;
}

//----------------------------------------------------------
//	背景を瞬時に差し替え
//	haikei_id
//----------------------------------------------------------
void	WEST_HAIKEI_SET(void)
{
	u8 haikei_id;
	
	WazaEffectSeqAdrs++;

	haikei_id = *WazaEffectSeqAdrs;
	BtlEffectHaikeiSet(haikei_id);
	WazaEffectSeqAdrs++;
}

//----------------------------------------------------------
//	攻撃側の位置、コンテストなのかを調べてSEのパンの値を取得する
//----------------------------------------------------------
s8	GetWazaEffSePan(s8 pan)
{
//	u8 at_x, de_x;
//	u8 at_side, de_side;

	if(ContestCheck()==0 && CliSys[AttackNo].status_eff)
	{//ｽﾃｰﾀｽ異常ｴﾌｪｸﾄ
		if(MineEnemyCheck(AttackNo))
			pan = WAZA_SE_R;
		else
			pan = WAZA_SE_L;
	}
	else{
		if(ContestCheck()){
			if(AttackNo==DefenceNo && AttackNo == CONT_MINE_CLIENT && pan == WAZA_SE_R)
				;
			else
				pan = -pan;
		}
		else if(MineEnemyCheck(AttackNo) == SIDE_MINE){
			if(MineEnemyCheck(DefenceNo) == SIDE_MINE){
				if(pan == WAZA_SE_R)
					pan = WAZA_SE_L;
				else if(pan != WAZA_SE_L)
					pan = -pan;
			}
		}
		else{
			if(MineEnemyCheck(DefenceNo) == SIDE_ENEMY){
				if(pan == WAZA_SE_L)
					pan = WAZA_SE_R;
//				else if(pan != WAZA_SE_R)
//					pan = -pan;
			}
			else
				pan = -pan;
		}
	}
	
	if(pan > WAZA_SE_R)
		pan = WAZA_SE_R;
	else if(pan < WAZA_SE_L)
		pan = WAZA_SE_L;
	
	return pan;
}

//----------------------------------------------------------
//	攻撃側が自分か敵かでﾊﾟﾝを反転
//----------------------------------------------------------
s8	GetSePanAttack(s8 pan)
{
	if(ContestCheck()==0 && CliSys[AttackNo].status_eff)
	{//ｽﾃｰﾀｽ異常ｴﾌｪｸﾄ
		if(MineEnemyCheck(AttackNo))
			pan = WAZA_SE_R;
		else
			pan = WAZA_SE_L;
	}
	else{
		if(MineEnemyCheck(AttackNo) || ContestCheck())
			pan = -pan;
	}
	return pan;
}

//-- Panの値のOverﾁｪｯｸ --//
s16 SePanOverCheck(s16 now_pan)
{
	if(now_pan > WAZA_SE_R)
		now_pan = WAZA_SE_R;
	else if(now_pan < WAZA_SE_L)
		now_pan = WAZA_SE_L;
	return now_pan;
}

//-- Panの開始点と終点を比較してAddPanの＋－を決める --//
s16 GetWazaEffAddPan(s16 start_pan, s16 end_pan, s16 add_pan)
{
	s16 pan;
	
	if(start_pan < end_pan)
		pan = abs(add_pan);
	else if(start_pan > end_pan)
		pan = -abs(add_pan);
	else
		pan = 0;
	return pan;
}

//----------------------------------------------------------
//	panを指定して効果音を鳴らす
//	SE番号、pan	※自ｷｬﾗ側の攻撃時の時のpan指定。敵側の時は反転されます。
//----------------------------------------------------------
void	WEST_SEPLAY_PAN(void)
{
	u16	seid;
	s8 pan;
	
	WazaEffectSeqAdrs++;
	seid=*WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
	pan = WazaEffectSeqAdrs[2];
	pan = GetWazaEffSePan(pan);
	SePlayPan(seid, pan);
	WazaEffectSeqAdrs+=3;
}

//----------------------------------------------------------
//	panのみをｾｯﾄ
//----------------------------------------------------------
void	WEST_SEPAN(void)
{
	s8 pan;
	
	WazaEffectSeqAdrs++;
	pan = WazaEffectSeqAdrs[0];
	pan = GetWazaEffSePan(pan);
	SePan(pan);
	WazaEffectSeqAdrs++;
}

//----------------------------------------------------------
//	SEを鳴らしてpanの値を一定間隔で変更していく
//	SE番号、
//	start_pan, end_pan：panの初期値と最終値
//	add_pan：一度にpan値に加算していく値
//	wait：pan値を変更したら、waitSync分待って、またpanの値を変更します
//----------------------------------------------------------
void	WEST_SEPAN_FLOW(void)
{
	u16 seid;
	s8 start_pan, end_pan;
	s8 add_pan;
	u8 wait;
	u8 id;
	
	WazaEffectSeqAdrs++;
	seid=*WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
	start_pan = WazaEffectSeqAdrs[2];
	end_pan = WazaEffectSeqAdrs[3];
	add_pan = WazaEffectSeqAdrs[4];
	wait = WazaEffectSeqAdrs[5];
	
	start_pan = GetWazaEffSePan(start_pan);
	end_pan = GetWazaEffSePan(end_pan);
	add_pan = GetWazaEffAddPan(start_pan, end_pan, add_pan);//GetWazaEffSePan(add_pan);
	id = AddTask(SePanFlowSeq, 1);
	TaskTable[id].work[0] = start_pan;
	TaskTable[id].work[1] = end_pan;
	TaskTable[id].work[2] = add_pan;
	TaskTable[id].work[3] = wait;
	TaskTable[id].work[4] = start_pan;
	
	SePlayPan(seid, start_pan);
	WazaSeCount++;
	WazaEffectSeqAdrs += 6;
}

static void SePanFlowSeq(u8 id)
{
	s16 start_pan, end_pan, add_pan, now_pan;
	u8 end_flg = 0;
	
	if(TaskTable[id].work[8]++ < TaskTable[id].work[3])
		return;
	TaskTable[id].work[8] = 0;
	start_pan = TaskTable[id].work[0];
	end_pan = TaskTable[id].work[1];
	add_pan = TaskTable[id].work[2];
	now_pan = TaskTable[id].work[4];
	now_pan += add_pan;
	TaskTable[id].work[4] = now_pan;
	
	if(add_pan == 0)
		end_flg++;
	else if(start_pan < end_pan){
		if(now_pan >= end_pan)
			end_flg++;
	}else{
		if(now_pan <= end_pan)
			end_flg++;
	}
	
	if(end_flg){
		now_pan = end_pan;
		DelTask(id);
		WazaSeCount--;
	}
	SePan(now_pan);
}

//----------------------------------------------------------
//	SEを鳴らしてpanの値を一定間隔で変更していく
//	敵、味方でpanの値を反転しない
//	SE番号、
//	start_pan, end_pan：panの初期値と最終値
//	add_pan：一度にpan値に加算していく値
//	wait：pan値を変更したら、waitSync分待って、またpanの値を変更します
//----------------------------------------------------------
void	WEST_SEPAN_FLOWFIX(void)
{
	u16 seid;
	s8 start_pan, end_pan;
	s8 add_pan;
	u8 wait;
	u8 id;
	
	WazaEffectSeqAdrs++;
	seid=*WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
	start_pan = WazaEffectSeqAdrs[2];
	end_pan = WazaEffectSeqAdrs[3];
	add_pan = WazaEffectSeqAdrs[4];
	wait = WazaEffectSeqAdrs[5];
	
	id = AddTask(SePanFlowSeq, 1);
	TaskTable[id].work[0] = start_pan;
	TaskTable[id].work[1] = end_pan;
	TaskTable[id].work[2] = add_pan;
	TaskTable[id].work[3] = wait;
	TaskTable[id].work[4] = start_pan;
	
	SePlayPan(seid, start_pan);
	WazaSeCount++;
	WazaEffectSeqAdrs += 6;
}

//----------------------------------------------------------
//	SEを鳴らしてpanの値を一定間隔で変更していく
//	ﾊﾟｰﾃｨｱﾀｯｸの事は考えずに、単純に自分、敵、どちらの攻撃かでPanの値を反転する
//	SE番号、
//	start_pan, end_pan：panの初期値と最終値
//	add_pan：一度にpan値に加算していく値
//	wait：pan値を変更したら、waitSync分待って、またpanの値を変更します
//----------------------------------------------------------
void	WEST_SEPAN_FLOW_AF(void)
{
	u16 seid;
	s8 start_pan, end_pan;
	s8 add_pan;
	u8 wait;
	u8 id;
	
	WazaEffectSeqAdrs++;
	seid=*WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
	start_pan = WazaEffectSeqAdrs[2];
	end_pan = WazaEffectSeqAdrs[3];
	add_pan = WazaEffectSeqAdrs[4];
	wait = WazaEffectSeqAdrs[5];
	
	start_pan = GetSePanAttack(start_pan);
	end_pan = GetSePanAttack(end_pan);
	add_pan = GetSePanAttack(add_pan);
	id = AddTask(SePanFlowSeq, 1);
	TaskTable[id].work[0] = start_pan;
	TaskTable[id].work[1] = end_pan;
	TaskTable[id].work[2] = add_pan;
	TaskTable[id].work[3] = wait;
	TaskTable[id].work[4] = start_pan;
	
	SePlayPan(seid, start_pan);
	WazaSeCount++;
	WazaEffectSeqAdrs += 6;
}

//----------------------------------------------------------
//	SEを一定間隔でならしつづける
//	SE番号、pan、wait、繰り返し回数(1ｵﾘｼﾞﾝ)
//----------------------------------------------------------
void	WEST_SE_REPEAT(void)
{
	u16 seid;
	s8 pan;
	u8 wait, repeat;
	u8 id;
	
	WazaEffectSeqAdrs++;
	seid=*WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
	pan = WazaEffectSeqAdrs[2];
	wait = WazaEffectSeqAdrs[3];
	repeat = WazaEffectSeqAdrs[4];
	pan = GetWazaEffSePan(pan);
	id = AddTask(SeRepeatSeq, 1);
	TaskTable[id].work[0] = seid;
	TaskTable[id].work[1] = pan;
	TaskTable[id].work[2] = wait;
	TaskTable[id].work[3] = repeat;
	TaskTable[id].work[8] = wait;
	TaskTable[id].TaskAdrs(id);
	
	WazaSeCount++;
	WazaEffectSeqAdrs += 5;
}

static void SeRepeatSeq(u8 id)
{
	u16 seid;
	s8 pan;
	u8 repeat;
	
	if(TaskTable[id].work[8]++ < TaskTable[id].work[2])
		return;
	TaskTable[id].work[8] = 0;
	seid = TaskTable[id].work[0];
	pan = TaskTable[id].work[1];
	repeat = --TaskTable[id].work[3];
	
	SePlayPan(seid, pan);
	if(repeat == 0){
		DelTask(id);
		WazaSeCount--;
	}
}

//----------------------------------------------------------
//	wait分待ってからSEを鳴らす
//	SE番号、pan、wait
//----------------------------------------------------------
void	WEST_SE_WAITPLAY(void)
{
	u16 seid;
	s8 pan;
	u8 wait;
	u8 id;
	
	WazaEffectSeqAdrs++;
	seid=*WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
	pan = WazaEffectSeqAdrs[2];
	wait = WazaEffectSeqAdrs[3];
	pan = GetWazaEffSePan(pan);
	id = AddTask(SeWaitPlaySeq, 1);
	TaskTable[id].work[0] = seid;
	TaskTable[id].work[1] = pan;
	TaskTable[id].work[2] = wait;
	
	WazaSeCount++;
	WazaEffectSeqAdrs += 4;
}

static void SeWaitPlaySeq(u8 id)
{
	u16 seid;
	s8 pan;
	
	if(TaskTable[id].work[2]-- > 0)
		return;
	seid = TaskTable[id].work[0];
	pan = TaskTable[id].work[1];
	SePlayPan(seid, pan);
	DelTask(id);
	WazaSeCount--;
}

//=========================================================================
//	SE用のADD_TASK命令
//=========================================================================
void	WEST_SE_TASK(void)
{
	pTaskFunc	Adrs;
	int		i,j;

	WazaEffectSeqAdrs++;

	Adrs=(pTaskFunc )(*WazaEffectSeqAdrs+
			(*(WazaEffectSeqAdrs+1)<<8)+
			(*(WazaEffectSeqAdrs+2)<<16)+
			(*(WazaEffectSeqAdrs+3)<<24));

	WazaEffectSeqAdrs+=4;

	j=*WazaEffectSeqAdrs;

	WazaEffectSeqAdrs++;

	for(i=0;i<j;i++){
		WazaEffWork[i]=*WazaEffectSeqAdrs|(*(WazaEffectSeqAdrs+1)<<8);
		WazaEffectSeqAdrs+=2;
	}

	i=AddTask(Adrs,1);
	Adrs(i);
	WazaSeCount++;
}

//=========================================================================
//	SEが鳴り終わるまでウェイト
//=========================================================================
void	WEST_SEWAIT_FLAG(void)
{
	if(WazaSeCount){
		WazaSeTimeOverCheck = 0;
		WazaEffectWait = 1;
		return;
	}
	
	if(SeEndCheck()){
		WazaSeTimeOverCheck++;
		if(WazaSeTimeOverCheck > SE_TIMEOVER){
			m4aMPlayStop( &m4a_mplay001 );
			m4aMPlayStop( &m4a_mplay002 );
			WazaSeTimeOverCheck = 0;
		}else{
			WazaEffectWait = 1;
			return;
		}
	}
	else{
		WazaSeTimeOverCheck = 0;
		WazaEffectSeqAdrs++;
		WazaEffectWait = 0;
	}
}

//=========================================================================
//	指定したWazaEffWork[?]と値が同じならばSEQ_JPする
// 参照するWazaEffWorkの添え字、比較する値、ジャンプ先ｱﾄﾞﾚｽ
//=========================================================================
void	WEST_WORKCHK_JP(void)
{
	u8 soeji;
	s16 work;
	
	WazaEffectSeqAdrs++;

	soeji = WazaEffectSeqAdrs[0];
	work = WazaEffectSeqAdrs[1] | (WazaEffectSeqAdrs[2]<<8);
	if(work == WazaEffWork[soeji])
	{
		WazaEffectSeqAdrs = (u8*)(WazaEffectSeqAdrs[3]+
				(WazaEffectSeqAdrs[4]<<8)+
				(WazaEffectSeqAdrs[5]<<16)+
				(WazaEffectSeqAdrs[6]<<24));
	}
	else
		WazaEffectSeqAdrs += 7;
}

//=========================================================================
//	コンテストだった場合、指定ｱﾄﾞﾚｽにジャンプする
//=========================================================================
void	WEST_CONTEST_CHK_JP(void)
{
	WazaEffectSeqAdrs++;
	
	if(ContestCheck()){
		WazaEffectSeqAdrs = (u8*)(*WazaEffectSeqAdrs+
				(*(WazaEffectSeqAdrs+1)<<8)+
				(*(WazaEffectSeqAdrs+2)<<16)+
				(*(WazaEffectSeqAdrs+3)<<24));
	}
	else
		WazaEffectSeqAdrs += 4;
}

//=========================================================================
//	BGのﾌﾟﾗｲｵﾘﾃｨに差をつける(BG1=PRI1、BG2=PRI2)
//	which = 0:攻撃側をBGに落してる　1:防御側をBGに落してる
//=========================================================================
void	WEST_BGPRI_GAPSET(void)
{
	u8 which;
	u8 client_type;
	
	which = WazaEffectSeqAdrs[1];
	WazaEffectSeqAdrs += 2;
	
	if(which)
		client_type = ClientTypeGet(DefenceNo);
	else
		client_type = ClientTypeGet(AttackNo);

	if((ContestCheck() == 0) && 
			(client_type == BSS_CLIENT_MINE || client_type == BSS_CLIENT_ENEMY2)){
		(*(vBgCnt *)REG_BG1CNT).Priority = 1;
		(*(vBgCnt *)REG_BG2CNT).Priority = 2;
	}
}

//=========================================================================
//	BGのﾌﾟﾗｲｵﾘﾃｨに強制的に差をつける(BG1=PRI1、BG2=PRI2)
//=========================================================================
void	WEST_BGPRI_GAPSET2(void)
{
	WazaEffectSeqAdrs++;
	
	if(ContestCheck() == 0){
		(*(vBgCnt *)REG_BG1CNT).Priority = 1;
		(*(vBgCnt *)REG_BG2CNT).Priority = 2;
	}
}

//=========================================================================
//	BGのﾌﾟﾗｲｵﾘﾃｨに差をつける(BG1=PRI1、BG2=PRI2)
//	※ﾊﾟｰﾃｨｱﾀｯｸの時は差はつけない
//	which = 0:攻撃側をBGに落してる　1:防御側をBGに落してる
//=========================================================================
void	WEST_BGPRI_GAPSET3(void)
{
	u8 which;
	u8 client_type;
	
	which = WazaEffectSeqAdrs[1];
	WazaEffectSeqAdrs += 2;
	
	if(MineEnemyCheck(AttackNo) == MineEnemyCheck(DefenceNo))
		return;
	
	if(which)
		client_type = ClientTypeGet(DefenceNo);
	else
		client_type = ClientTypeGet(AttackNo);

	if((ContestCheck() == 0) && 
			(client_type == BSS_CLIENT_MINE || client_type == BSS_CLIENT_ENEMY2)){
		(*(vBgCnt *)REG_BG1CNT).Priority = 1;
		(*(vBgCnt *)REG_BG2CNT).Priority = 2;
	}
}


//=========================================================================
//	ポケモンアクターのbanishフラグを立てる
//	0=攻撃側　1=防御側　2=攻撃側相方　3=防御側相方
//=========================================================================
void	WEST_POKE_BANISH_ON(void)
{
	u8 poke;
	
	poke = W_GetPokeActNo(WazaEffectSeqAdrs[1]);
	if(poke != 0xff)
		ActWork[poke].banish = 1;
	WazaEffectSeqAdrs += 2;
}

//=========================================================================
//	ポケモンアクターのbanishフラグをオフする
//	0=攻撃側　1=防御側　2=攻撃側相方　3=防御側相方
//=========================================================================
void	WEST_POKE_BANISH_OFF(void)
{
	u8 poke;
	
	poke = W_GetPokeActNo(WazaEffectSeqAdrs[1]);
	if(poke != 0xff)
		ActWork[poke].banish = 0;
	WazaEffectSeqAdrs += 2;
}

//=========================================================================
//	パーティアタック時でBG落しをしている時に、攻撃側or防御側のBGをオフして
//	ポケモンアクターのﾊﾞﾆｯｼｭもオフにする。
//	0 = 攻撃側のBGをオフ	1 = 防御側のBGをオフ
//=========================================================================
void	WEST_PARTY_ATTACK_BGOFF(void)
{
	u8 which;
	u8 poke, bgno;
	
	which = WazaEffectSeqAdrs[1];
	WazaEffectSeqAdrs += 2;
	
	if(ContestCheck() || FightCheck() == 0)
		return;
	if(MineEnemyCheck(AttackNo) != MineEnemyCheck(DefenceNo))
		return;
	
	if(which == 0){
		bgno = GetPokeBGNo(AttackNo);
		poke = W_GetPokeActNo(0);
	}
	else{
		bgno = GetPokeBGNo(DefenceNo);
		poke = W_GetPokeActNo(1);
	}
	
	if(poke == 0xff)
		return;
	
	ActWork[poke].banish = 0;
	if(bgno == 2)
		ActWork[poke].oamData.Priority = 3;	//ﾌﾟﾗｲｵﾘﾃｨが低い方がOBJに戻っても
										//ﾌﾟﾗｲｵﾘﾃｨ関係を維持出来るようにOAMを下げる

	if(bgno == 1)
		PokeBGDropClear(0);
	else
		PokeBGDropClear(1);
}

//=========================================================================
//	PARTY_ATTACK_BGOFFを使用した時の終了処理
//	引数：PARTY_ATTACK_BGOFFと同じ番号を指定
//=========================================================================
void	WEST_PARTY_ATTACK_BGEND(void)
{
	u8 which;
	u8 poke, bgno;
	
	which = WazaEffectSeqAdrs[1];
	WazaEffectSeqAdrs += 2;
	
	if(ContestCheck() || FightCheck() == 0)
		return;
	if(MineEnemyCheck(AttackNo) != MineEnemyCheck(DefenceNo))
		return;
	
	if(which == 0){
		bgno = GetPokeBGNo(AttackNo);
		poke = W_GetPokeActNo(0);
	}
	else{
		bgno = GetPokeBGNo(DefenceNo);
		poke = W_GetPokeActNo(1);
	}
	
	if(poke == 0xff)
		return;
	
	if(bgno == 2)
		ActWork[poke].oamData.Priority = POKE_OAM_PRI;
}


//=========================================================================
//	SE_STOP
//=========================================================================
void	WEST_SE_STOP(void)
{
	m4aMPlayStop( &m4a_mplay001 );
	m4aMPlayStop( &m4a_mplay002 );
	WazaEffectSeqAdrs++;
}


