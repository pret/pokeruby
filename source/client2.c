
//=================================================================
//    client2.c                                           
//                                                      
//    Copyright (C) 2000 GAME FREAK inc.
//=================================================================

#include "common.h"
#include "bss.h"		//add
#include "calctool.h"
#include "ef_tool.h"
#include "poketool.h"		//add

#include "client.h"
#include "client_t.h"
#include "decord.h"
#include "objdata.h"
#include "actanm.h"
#include "actor.h"
#include "cli_def.h"
#include "a_mine.h"
#include "cli_ef.h"
#include "pm_aff.h"
#include "server.h"
#include "a_status.h"
#include "waza_eff.h"
#include "task.h"
#include "wazano.def"
#include "mus_tool.h"


//=========================================================================
//	プロトタイプ宣言
//=========================================================================
void CA_PokeAppearWait(actWork *actst);
void CAS_TrainerSlideIn(actWork *actst);
void CAC_PokeAppearDifferentInit(actWork *actst, u8);
static u8 MigawariFightEffPutChk(u8 eff_no);

//=========================================================================
//	外部ﾃﾞｰﾀ宣言
//=========================================================================

//=========================================================================
//	データ
//=========================================================================
extern actHeader TRBTbl[];

//=========================================================================
//
//	プログラム
//
//=========================================================================


//=========================================================================
//	CA = ｸﾗｲｱﾝﾄｱｸﾀｰ
//	CAC = ｸﾗｲｱﾝﾄｱｸﾀｰｺｰﾙ(ｸﾗｲｱﾝﾄｱｸﾀｰからｺｰﾙされるﾙｰﾁﾝ)
//	CAS = ｸﾗｲｱﾝﾄｱｸﾀｰｻﾌﾞ(ｸﾗｲｱﾝﾄｱｸﾀｰでｱｯﾄﾞｱｸﾀｰされたｱｸﾀｰのmove関数)
//=========================================================================

//=========================================================================
//	ﾎﾟｹﾓﾝ ﾎﾞｰﾙから登場
// 終了したときはActWork[戻り値].move == DummyActMoveになる
//=========================================================================
//----------------------------------------------------------
//	ｴﾌｪｸﾄ終了まで監視
//----------------------------------------------------------
void CA_PokeAppearWait(actWork *actst)
{
	u8 pokeact;
	
	pokeact = actst->work[1];
//	if(ActWork[actst->work[0]].act_sw == 0 && ActWork[pokeact].affend_sw == 1)
	if(ActWork[pokeact].affend_sw == 1 && ActWork[pokeact].banish == 0)
	{
		if(ActWork[pokeact].anm_pause == 1)	//ﾎﾟｹﾓﾝｱﾆﾒｰｼｮﾝまだ
		{
			ActWork[pokeact].anm_pause = 0;	//ﾎﾟｹﾓﾝｱﾆﾒ開始
		}
		else if(ActWork[pokeact].anmend_sw == 1)	//ﾎﾟｹﾓﾝｱﾆﾒｰｼｮﾝ終了
		{
//			AllDelActor(&ActWork[actst->work[0]]);	//ﾓﾝｽﾀｰﾎﾞｰﾙDEL
			ActWork[pokeact].move = SeqMinePokeWaitInit;
			ActAffAnmChg(&ActWork[pokeact], PAB_NORMAL);
			actst->move = DummyActMove;
		}
	}
}
//----------------------------------------------------------
//	ﾎﾟｹﾓﾝのｱｸﾀｰを拡縮用に変更
// front_back = 0:手前(味方ポケモン)　　1:奥(敵ポケモン)
//----------------------------------------------------------
void CAC_PokeAppearDifferentInit(actWork *actst, u8 front_back)
{
	actst->anm_pause = 1;
	actst->move = DummyActMove;
//	actst->oamData.AffineMode = 1;
//	actst->aff_tbl = BallPokeAffTbl;
//	AffineNumSet(actst);
	if(front_back == 0)
		ActAffAnmChg(actst, PAB_BALLOUT);
	else
		ActAffAnmChg(actst, PAF_BALLOUT);
	ActAnm(actst);			//ﾊﾞﾄﾙではこの後にJumpActorを通らないため
}

//=========================================================================
//	ﾄﾚｰﾅｰ登場ｴﾌｪｸﾄ
//=========================================================================
//----------------------------------------------------------
//	ﾄﾚｰﾅｰｽﾗｲﾄﾞ移動
//----------------------------------------------------------
void CAS_TrainerSlideIn(actWork *actst)
{
	if(EncountEffectFlag&ENCOUNT_EFFECT_FLAG_OBJSTOP) return;	//移動のストッパー
	actst->dx += actst->work[0];
	if(actst->dx == 0)
	{
		actst->move = DummyActMove;
	}
}

















//=========================================================================
//
//		全クライアント共通ルーチン
//												by matsuda 2002.05.29(水)
//=========================================================================

//----------------------------------------------------------
//	ステータス異常ｴﾌｪｸﾄをｾｯﾄする	※全ｸﾗｲｱﾝﾄ共通ﾙｰﾁﾝ
//----------------------------------------------------------
void ClientStatusEffSet(u8 condition_flg, u32 condition)
{
	CliSys[ClientNo].status_eff = 1;
	
	if(condition_flg == 0){
		if(condition == CONDITION_KOORI)
			//SetKooriStatusEffect(ClientNo);
			SetStatusEffect(ClientNo, STEFF_KOORI);
		else if(condition == CONDITION_DOKU || (condition & CONDITION_DOKUDOKU))
			SetStatusEffect(ClientNo, STEFF_DOKU);
		else if(condition == CONDITION_YAKEDO)
			SetStatusEffect(ClientNo, STEFF_YAKEDO);
		else if(condition & CONDITION_NEMURI)
			SetStatusEffect(ClientNo, STEFF_NEMURI);
		else if(condition == CONDITION_MAHI)
			SetStatusEffect(ClientNo, STEFF_MAHI);
		else
			CliSys[ClientNo].status_eff = 0;
	}
	else
	{	//condition2
		if(condition & CONDITION2_MEROMERO)		//condition2
			SetStatusEffect(ClientNo, STEFF_MEROMERO);
		else if(condition & CONDITION2_KONRAN)
			SetStatusEffect(ClientNo, STEFF_KONRAN);
		else if(condition & CONDITION2_NOROI)
			SetStatusEffect(ClientNo, STEFF_NOROI);
		else if(condition & CONDITION2_AKUMU)
			SetStatusEffect(ClientNo, STEFF_AKUMU);
		else if(condition & CONDITION2_SHIME)
			SetStatusEffect(ClientNo, STEFF_SIMETUKE);
		else
			CliSys[ClientNo].status_eff = 0;
	}
}











//=========================================================================
//
//		戦闘エフェクトセット(サーバーから呼ばれる技ｴﾌｪｸﾄ、ｽﾃｰﾀｽ異常ｴﾌｪｸﾄ以外のｴﾌｪｸﾄ)
//												by matsuda 2002.07.02(火)
//=========================================================================
extern u32 FightEffSeqTbl[];

static void FightEffectEndCheck(u8 id);

u8 SetFightEffect(u8 client_no, u8 attack, u8 defence, u8 eff_no, u16 data)
{
	u8 id;
	u8	ret=0;
	
	//てんきやのエフェクトでみがわりが出ているときは、AnmNoだけ代入してエフェクトは出さない
	if((eff_no==FE_ID_HENGE)&&(data&BW_MIGAWARI_FLAG)){
		BattlePokeAnmNo[client_no]=(data&BW_MIGAWARI_FLAG_OFF);
		return 1;
	}
	//身代わり時は、｢身代わりｷｬﾗ気絶ｴﾌｪｸﾄ」以外は出さない 2002.08.27(火) matsuda
	if(Climem[client_no].migawari == 1 && MigawariFightEffPutChk(eff_no) == 0)
		return 1;
	//身代わり状態で、ﾊﾞﾆｯｼｭﾌﾗｸﾞが立っていて気絶エフェクトならば、ｴﾌｪｸﾄは出さない
	if(Climem[client_no].migawari == 1 && eff_no == FE_ID_MIGAWARI_KIZETU
			&& ActWork[PokemonStruct[client_no]].banish){
		MigawariChange(client_no, 1, PokemonStruct[client_no]);
		MigawariFlgReset(client_no);
		return 1;
	}
	
	AttackNo = attack;
	DefenceNo = defence;
	
	BtlWork->work[0] = data;
	WazaEffectCommonSet(FightEffSeqTbl, eff_no, 0);
	id = AddTask(FightEffectEndCheck, 10);
	TaskTable[id].work[0] = client_no;
	CliSys[TaskTable[id].work[0]].fight_eff = 1;

	return	ret;
}

static void FightEffectEndCheck(u8 id)
{
	WazaEffectSequence();
	if(WazaEffectFlag == 0){
		CliSys[TaskTable[id].work[0]].fight_eff = 0;
		DelTask(id);
	}
}

//-- 身代わりが出ている時に出していい技かチェック --//
static u8 MigawariFightEffPutChk(u8 eff_no)
{
	switch(eff_no){
		case FE_ID_MIGAWARI_KIZETU:
		case FE_ID_AMAGOI:
		case FE_ID_NIHONBARE:
		case FE_ID_SUNAARASI:
		case FE_ID_ARARE:
		case FE_ID_YOKODORI:
			return 1;
		default:
			return 0;
	}
}







//=========================================================================
//
//		その他の戦闘エフェクトセット(ﾚﾍﾞﾙｱｯﾌﾟやﾎﾞｰﾙｹﾞｯﾄなど)
//												by matsuda 2002.07.02(火)
//=========================================================================
extern u32 EtcEffSeqTbl[];

static void EtcEffectEndCheck(u8 id);

void SetEtcEffect(u8 client_no, u8 attack, u8 defence, u8 eff_no)
{
	u8 id;
	
	AttackNo = attack;
	DefenceNo = defence;
	
	WazaEffectCommonSet(EtcEffSeqTbl, eff_no, 0);
	id = AddTask(EtcEffectEndCheck, 10);
	TaskTable[id].work[0] = client_no;
	CliSys[TaskTable[id].work[0]].etc_eff = 1;
}

static void EtcEffectEndCheck(u8 id)
{
	WazaEffectSequence();
	if(WazaEffectFlag == 0){
		CliSys[TaskTable[id].work[0]].etc_eff = 0;
		DelTask(id);
	}
}







//=========================================================================
//
//		技ｴﾌｪｸﾄを出してもいいかチェック
//												by matsuda 2002.07.05(金)
//=========================================================================
//----------------------------------------------------------
//	戻り値：0=技を出してもOK	1=技を出しては駄目
//----------------------------------------------------------
u8 PutWazaEffectCheck(u16 wazano, u8 waza_counter)
{
#if 0	// Serverで管理するようになった 2002.07.25(木)
	u8 ret = 0;
	
	//相手ﾎﾟｹﾓﾝがﾊﾞﾆｯｼｭ状態ならｴﾌｪｸﾄを出さない
	if(ActWork[PokemonStruct[DefenceClient]].banish == 1){
		if(wazano == WAZANO_SORAWOTOBU || wazano == WAZANO_ANAWOHORU){
			if(waza_counter == 0)
				ret = 0;	//相手に攻撃するわけではないので出せる
			else
				ret = 1;
		}
		else
			ret = 1;
	}
	return ret;
#else
	return 0;
#endif
}







//=========================================================================
//
//		SEが鳴っている時の終了待ち(ﾀｲﾑｱｳﾄ処理込み)
//	戻り値: 1=SEが鳴っている  0=SEが鳴っていない(ﾀｲﾑｱｳﾄ含む)
//												by matsuda 2002.09.01(日)
//=========================================================================
u8 ClientSEWait(u8 client_no)
{
	u8 wait = 0;
	
	if(SeEndCheck()){
		CliSys[client_no].setime_wait++;
		if(CliSys[ClientNo].setime_wait < EFF_SETIME_OUT_COUNT)
			wait = 1;
		else{
			m4aMPlayStop( &m4a_mplay001 );
			m4aMPlayStop( &m4a_mplay002 );
		}
	}
	
	if(wait)	//SEが鳴り終わるまで待つ
		return 1;
	CliSys[client_no].setime_wait = 0;
	return 0;
}

