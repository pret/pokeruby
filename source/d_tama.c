#ifdef	PM_DEBUG
//=========================================================================
//
//	デバッグ・テスト用プログラム
//
//
//	for tama only
//=========================================================================
//
#include "common.h"
#include "intr.h"
#include "task.h"
#include "print.h"
#include "pm_str.h"
#include "fld_talk.h"
#include "map.h"
#include "fieldmap.h"
#include "pm_str.h"
#include "saveload.h"
#include "field.h"
#include "palanm.h"
#include "fld_main.h"
#include "menu.h"
#include "fld_task.h"
#include "script.h"
#include "rtctool.h"
#include "fld_tool.h"
#include "ev_check.h"
#include "jiki.h"
#include "item.h"
#include "mus_tool.h"
#include "sysflag.h"
#include "poketool.h"
#include "tr_tbl.h"
#include "b_tower.h"
#include "initgame.h"
#include "window.h"
#include "laster.h"

#include "../data/warpsym.h"
#include "../script/saveflag.h"

extern const VM_CODE test_tama_script[];


static vu32 timer_count;
static vu32 run_count;

//=========================================================================
//
//=========================================================================

//------------------------------------------
//------------------------------------------


//------------------------------------------
//------------------------------------------

//------------------------------------------
//------------------------------------------

void DebugProgramProfile(void);
//void DebugTaisenScore(void);


//=========================================================================
//
//=========================================================================





//=========================================================================
//
//	デバッグメニューからの呼び出し部分
//
//=========================================================================
u8 DebugTamadaTest(void)
{

		MenuEnd();

//		DebugTaisenScore();
//		StartFieldScript(test_tama_script);
	//	EventFlagSet( FE_DENSETU_OPEN );
		DebugProgramProfile();
		return (1);

};


#if 0
static void wait_abkey_task( u8 no )
{
	s16 * wk = TaskTable[no].work;
	if ( wk[0] < 20 ) {
		wk[0] ++;
	} else {
		if ( sys.Trg & A_BUTTON ) {
			NMenuScreenClear();
			ResetForceEvent();
			DelTask(no);
		}
	}
}

//=========================================================================
//=========================================================================
void DebugTaisenScore(void)
{
	TestTaisenScore();
	PutTaisenScoreWindow();
	AddTask(wait_abkey_task, TSK_PRI_EFFECT);
	SetForceEvent();
}
#endif

//=========================================================================
//
//	実行速度計測の仕組み
//
//=========================================================================
static const u8 msg_prof_result[] = {
	I_MSG_,STR_TEMP_BUF0,ka_,i_,spc_,zi_,ttu_,ko_,u_,
	CR_,
	I_MSG_,STR_TEMP_BUF1,ta_,n_,i_,zi_,ka_,n_,spc_,si_,yyo_,u_,hi_,
	EOM_
};

extern void TestRtcRead(void);

static void profile_task(u8 no)
{
	int i;
	u16 ime_bak;
	s16 * twk;

	twk = TaskTable[no].work;

	switch (twk[0]) {

	case 0:
		m4aSoundVSyncOff();
		twk[0]++;
		break;

	case 1:
		ime_bak = *(vu16*)REG_IME;
		*(vu16*)REG_IME = 0;

		*(vu16*)REG_TM2CNT = 0;
		*(vu32*)REG_TM2CNT = TMR_ENABLE | TMR_PRESCALER_1024CK;
	//	*(vu32*)REG_TM2CNT = TMR_ENABLE | TMR_PRESCALER_64CK;

		for(i=0;i<50000;i++){
			//計測するルーチンの呼び出し
		//	*(vu16 *)REG_DMA0CNT_H = 0;
			DmaSet(	0,
					LasterBuffer[0],
					(void*)REG_WIN0H,
					H_DMA_ENABLE16);
			DmaStop(0);
		//	*(vu16 *)REG_DMA0CNT_H = 0;
		//	LasterInit();
//			EvObjDmyAddAct(CAPBOY1,i,i+6,6,3,0);
		//	TestRtcRead();
		}

		*(vu16 *)REG_TM2CNT_H = 0;
		timer_count = *(vu16 *)REG_TM2CNT_L;
		*(vu16 *)REG_TM2CNT = 0; 

		*(vu16 *)REG_IME = ime_bak;

		run_count = i;
		m4aSoundVSyncOn();

		twk[0]++;
		break;

	case 2:
		SePlay( SE_PIN );
		
		PM_NumMsgSet(StrTempBuffer0, run_count, NUM_MODE_SPACE, 8);
		PM_NumMsgSet(StrTempBuffer1, timer_count, NUM_MODE_SPACE, 8);
		NMenuTalkWinWrite();
		NMenuMsgWrite(msg_prof_result, MWIN_MSGXPOS, MWIN_MSGYPOS);
		twk[0]++;
		break;

	case 3:
		if (sys.Trg & A_BUTTON) {
			NMenuScreenClear();
			ResetForceEvent();
			DelTask(no);
		}
		break;
	}
}

void DebugProgramProfile(void)
{
	AddTask(profile_task, TSK_PRI_CONTROL);
	SetForceEvent();
}

//=========================================================================
//=========================================================================

extern void BattleCardECheckSumMake(StockBattleCardETrainer *);
void BattleCardEDataMake( StockBattleCardETrainer * SBTT_CardE, const u8 * name, u32 id )
{
	int	i,j;

	SBTT_CardE->trainerno = id % TR_END;
	ID_Set(id, SBTT_CardE->id);
	OyaNameCopy(SBTT_CardE->name, name);

	j=7;
	for(i=0;i<6;i++){
		SBTT_CardE->aisatukaiwa[i]=Fld.kaiwa_battle[i];
		SBTT_CardE->winkaiwa[i]=j;
		SBTT_CardE->losekaiwa[i]=j+6;
		j++;
	}

	for(i=0;i<3;i++){
		PokemonParam * p = &PokeParaMine[i];
		StockBattleTowerPokemon * sbtp = &(SBTT_CardE->SBTP[i]);
		PokeParaGetStock(p, sbtp);
	}
	BattleCardECheckSumMake(SBTT_CardE);
}


#endif	PM_DEBUG
