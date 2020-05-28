//=========================================================================
//
//		技エフェクトのサウンド関係
//
//=========================================================================
#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "madefine.h"
#include "wazatool.h"
#include "waza_dat.h"
#include "waza_eff.h"
#include "server.h"
#include "calctool.h"

#include "bss.h"
#include "cli_ef.h"
#include "laster.h"
#include "task.h"
#include "pm_aff.h"
#include "gauge.h"
#include "client.h"
#include "ef_tool.h"
#include "fight.h"
#include "palanm.h"
#include "mus_tool.h"
#include "contest.h"
#include "poketool.h"
#include "mus_tool.h"




//=========================================================================
//	「だいもんじ」用
//=========================================================================
static void DaimonjiSEPlayMain(u8 id);
static void DaimonjiSEPlayDai(u8 id);
//----------------------------------------------------------
//	0:SEID0		1:SEID1
//----------------------------------------------------------
#define DAIMONJI_SE1_WAIT		10		//一定間隔で鳴らし続けるSEのｳｪｲﾄ
#define DAIMONJI_LAST_SE_WAIT	110		//最後に「大」が出る時のSEを鳴らすまでのｳｪｲﾄ
#define DAIMONJI_ADD_SEPAN		2		//パンを進めていく速度
#define DAIMONJI_SE_DAI_WAIT	5		//「大」のSEが出る感覚のｳｪｲﾄ
void DaimonjiSEPlay(u8 id)
{
	s8 start_pan, end_pan, add_pan;
	
	TaskTable[id].work[0] = WazaEffWork[0];
	TaskTable[id].work[1] = WazaEffWork[1];
	start_pan = GetWazaEffSePan(WAZA_SE_L);	//start
	end_pan = GetWazaEffSePan(WAZA_SE_R);	//end
	add_pan = GetWazaEffAddPan(start_pan, end_pan, DAIMONJI_ADD_SEPAN);
//	if(start_pan > end_pan)
//		add_pan = -add_pan;
	TaskTable[id].work[2] = start_pan;
	TaskTable[id].work[3] = end_pan;
	TaskTable[id].work[4] = add_pan;

	TaskTable[id].work[10] = DAIMONJI_SE1_WAIT;
	TaskTable[id].TaskAdrs = DaimonjiSEPlayMain;
}

static void DaimonjiSEPlayMain(u8 id)
{
	s16 now_pan, end_pan;
	s8 add_pan;
	
	now_pan = TaskTable[id].work[2];
	end_pan = TaskTable[id].work[3];
	add_pan = TaskTable[id].work[4];
	
	if(TaskTable[id].work[11]++ == DAIMONJI_LAST_SE_WAIT){
		TaskTable[id].work[10] = DAIMONJI_SE_DAI_WAIT;
		TaskTable[id].work[11] = 0;
		TaskTable[id].TaskAdrs = DaimonjiSEPlayDai;
		return;
	}
	
	if(TaskTable[id].work[10]++ == DAIMONJI_SE1_WAIT){
		TaskTable[id].work[10] = 0;
		
		SePlayPan(TaskTable[id].work[0], now_pan);
	}

	now_pan += add_pan;
	now_pan = SePanOverCheck(now_pan);
	TaskTable[id].work[2] = now_pan;
}

static void DaimonjiSEPlayDai(u8 id)
{
	s8 pan;
	
	if(TaskTable[id].work[10]++ == DAIMONJI_SE_DAI_WAIT)
	{
		TaskTable[id].work[10] = 0;
		pan = GetWazaEffSePan(WAZA_SE_R);
		SePlayPan(TaskTable[id].work[1], pan);
		if(++TaskTable[id].work[11] == 2)
			DelSeTask(id);
	}
}








//=========================================================================
//	同じSEを何度も鳴らしつつ、パンの位置をずらしていく
//=========================================================================
static void SeRepeatPanMoveMain(u8 id);
//----------------------------------------------------------
//	0:SEID0		1:start_pan		2:end_pan
//	3:add_pan	4:繰り返し回数	5:pan_wait	6:sewait
//----------------------------------------------------------
void SeRepeatPanMove(u8 id)
{
	u16 seid;
	s8 start_pan, end_pan, add_pan;
	u8 repeat, pan_wait, sewait;
	
	seid = WazaEffWork[0];
	start_pan = WazaEffWork[1];
	end_pan = WazaEffWork[2];
	add_pan = WazaEffWork[3];
	repeat = WazaEffWork[4];
	pan_wait = WazaEffWork[5];
	sewait = WazaEffWork[6];
	
	start_pan = GetWazaEffSePan(start_pan);
	end_pan = GetWazaEffSePan(end_pan);
	add_pan = GetWazaEffAddPan(start_pan, end_pan, add_pan);
	
	TaskTable[id].work[0] = seid;
	TaskTable[id].work[1] = start_pan;
	TaskTable[id].work[2] = end_pan;
	TaskTable[id].work[3] = add_pan;
	TaskTable[id].work[4] = repeat;
	TaskTable[id].work[5] = pan_wait;
	TaskTable[id].work[6] = sewait;
	
	TaskTable[id].work[10] = 0;	//pan_wait
	TaskTable[id].work[11] = start_pan;	//now_pan
	TaskTable[id].work[12] = sewait;
	TaskTable[id].TaskAdrs = SeRepeatPanMoveMain;
	TaskTable[id].TaskAdrs(id);
}

static void SeRepeatPanMoveMain(u8 id)
{
	s16 now_pan, end_pan;
	s8 add_pan;
	
	now_pan = TaskTable[id].work[11];
	end_pan = TaskTable[id].work[2];
	add_pan = TaskTable[id].work[3];
	
	if(TaskTable[id].work[12]++ == TaskTable[id].work[6]){
		TaskTable[id].work[12] = 0;
		SePlayPan(TaskTable[id].work[0], TaskTable[id].work[11]);
		TaskTable[id].work[4]--;
		if(TaskTable[id].work[4] == 0){
			DelSeTask(id);
			return;
		}
	}

	// pan
	if(TaskTable[id].work[10]++ == TaskTable[id].work[5]){
		TaskTable[id].work[10] = 0;
		TaskTable[id].work[11] += TaskTable[id].work[3];
		TaskTable[id].work[11] = SePanOverCheck(TaskTable[id].work[11]);
	}
}












//=========================================================================
//
//		ポケモンの鳴き声を鳴らす
//												by matsuda 2002.07.08(月)
//=========================================================================
//----------------------------------------------------------
//	0: 0=攻撃ﾎﾟｹﾓﾝの鳴き声  1=防御ﾎﾟｹﾓﾝ  2=攻撃ﾎﾟｹﾓﾝ相方  3=防御ﾎﾟｹﾓﾝ相方
//	1:VoiceNo(2=ほえる  3=遠吠え 0xff=鳴き声)
//----------------------------------------------------------
void PokeVoicePlayTask(u8 id)
{
	s8 pan;
	u16 monsno = 0;
	u8 client;
	
	pan = GetWazaEffSePan(WAZA_SE_L);
	if(ContestCheck()){
		if(WazaEffWork[0] == 0)
			monsno = conpara->monsno;
		else
			DelTaskEffect(id);
	}
	else{
		if(WazaEffWork[0] == 0)
			client = AttackNo;
		else if(WazaEffWork[0] == 1)
			client = DefenceNo;
		else if(WazaEffWork[0] == 2)
			client = AttackNo ^ 2;
		else
			client = DefenceNo ^2;
		
		if(WazaEffWork[0] == 1 || WazaEffWork[0] == 3){
			if(PokeBG2taimeCheck(client) == 0){
				DelTaskEffect(id);
				return;
			}
		}
		
		if(MineEnemyCheck(client))
			monsno = PokeParaGet(&PokeParaEnemy[SelMonsNo[client]], ID_monsno);
		else
			monsno = PokeParaGet(&PokeParaMine[SelMonsNo[client]], ID_monsno);
	}
	
	if(monsno != 0){
		if(WazaEffWork[1] == 0xff)
			VoicePlay(monsno, pan);
		else
			VoicePlay3(monsno, pan, WazaEffWork[1]);
	}
	DelTaskEffect(id);
}










//=========================================================================
//
//		ハイパーボイス用鳴き声
//												by matsuda 2002.08.21(水)
//=========================================================================
//----------------------------------------------------------
//	OFFSET なし
//----------------------------------------------------------
void HyperVoicePlayTask(u8 id)
{
	s8 pan;
	u16 monsno = 0;
	
	pan = GetWazaEffSePan(WAZA_SE_L);
	if(ContestCheck()){
		monsno = conpara->monsno;
	}
	else{
		monsno = WazaEffMonsNo[AttackNo];
	}
	
	if(monsno != 0)
		VoicePlay3(monsno, pan, 4);
	DelTaskEffect(id);
}






//=========================================================================
//
//		CH1のみでSEを鳴らす
//												by matsuda 2002.08.23(金)
//=========================================================================
//----------------------------------------------------------
//	0:SEID	1:pan
//----------------------------------------------------------
void SePlayCh1Task(u8 id)
{
	SePlayPanCh1(WazaEffWork[0], GetWazaEffSePan(WazaEffWork[1]));
	DelTaskEffect(id);
}

//=========================================================================
//
//		CH2のみでSEを鳴らす
//												by matsuda 2002.08.23(金)
//=========================================================================
//----------------------------------------------------------
//	0:SEID	1:pan
//----------------------------------------------------------
void SePlayCh2Task(u8 id)
{
	SePlayPanCh2(WazaEffWork[0], GetWazaEffSePan(WazaEffWork[1]));
	DelTaskEffect(id);
}











//=========================================================================
//	SEは鳴らさずにPANの値だけを進めていく
//	現在のPan値はWazaEffPanに入っています。
//=========================================================================
static void SePanFlowMain(u8 id);
//----------------------------------------------------------
//	0:start_pan		1:end_pan	2:add_pan	3:pan_wait
//----------------------------------------------------------
void SePanFlowTask(u8 id)
{
	s8 start_pan, end_pan, add_pan;
	s16 pan_wait;
	
	start_pan = WazaEffWork[0];
	end_pan = WazaEffWork[1];
	add_pan = WazaEffWork[2];
	pan_wait = WazaEffWork[3];
	
	start_pan = GetWazaEffSePan(start_pan);
	end_pan = GetWazaEffSePan(end_pan);
	add_pan = GetWazaEffAddPan(start_pan, end_pan, add_pan);
	
//	TaskTable[id].work[0] = seid;
	TaskTable[id].work[1] = start_pan;
	TaskTable[id].work[2] = end_pan;
	TaskTable[id].work[3] = add_pan;
//	TaskTable[id].work[4] = repeat;
	TaskTable[id].work[5] = pan_wait;
//	TaskTable[id].work[6] = sewait;
	
	TaskTable[id].work[10] = 0;	//pan_wait
	TaskTable[id].work[11] = start_pan;	//now_pan
//	TaskTable[id].work[12] = sewait;
	TaskTable[id].TaskAdrs = SePanFlowMain;
	TaskTable[id].TaskAdrs(id);
}

static void SePanFlowMain(u8 id)
{
	s16 now_pan, end_pan;
	s8 add_pan;
	
	now_pan = TaskTable[id].work[11];
	end_pan = TaskTable[id].work[2];
	add_pan = TaskTable[id].work[3];
	
	// pan
	if(TaskTable[id].work[10]++ == TaskTable[id].work[5]){
		TaskTable[id].work[10] = 0;
		TaskTable[id].work[11] += TaskTable[id].work[3];
		TaskTable[id].work[11] = SePanOverCheck(TaskTable[id].work[11]);
	}

//	SePan(TaskTable[id].work[11]);
	WazaEffPan = TaskTable[id].work[11];
	if(TaskTable[id].work[11] == TaskTable[id].work[2])
		DelTaskEffect(id);
}

