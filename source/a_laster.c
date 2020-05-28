

#if 0	//****************************************
			全ｿｰｽ削除
	



//=========================================================================
//	
//	技エフェクトSub：ラスター
//
//=========================================================================
#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "madefine.h"

#include "wazatool.h"
#include "waza_dat.h"
#include "server.h"
#include "bss.h"
#include "waza_eff.h"
#include "calctool.h"

#include "laster.h"
#include "task.h"

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void WazaTaskLasterInit(u8 id);
static void WazaTaskLasterSet(u8 id);
static void WazaTaskLasterWait(u8 id);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define TARGET_BG	((void*)REG_BG1HOFS)

//----------------------------------------------------------
//	ラスターテーブル
//----------------------------------------------------------
static const HLasterData WazaLasterData = 
{
	(void*)REG_BG1VOFS,
	30,
	90,
	0,
	0,
	600,
};


//-------------------------------------------------------------
//		タスクシーケンス
//-------------------------------------------------------------

//-------------------------------------------------------------
// offset 0:ﾗｽﾀｰ開始ﾗｲﾝ  1:ﾗｽﾀｰ終了ﾗｲﾝ  
//		  2:上位8ﾋﾞｯﾄ、ﾗｽﾀｰ外初期値1 下位8ﾋﾞｯﾄ、ﾗｽﾀｰ外初期値2
//        3:ﾙｰﾌﾟ回数  4:上位8ﾋﾞｯﾄ、H角度初期値 下位8ﾋﾞｯﾄ、H角度増幅値
//        5:H振り幅  6:上位8ﾋﾞｯﾄ、V角度初期値 下位8ﾋﾞｯﾄ、V角度増幅値
//		  7:V振り幅
//-------------------------------------------------------------
void WazaTaskLaster(u8 id)
{
	TaskTable[id].work[0] = WazaEffWork[0];
	TaskTable[id].work[1] = WazaEffWork[1];
	TaskTable[id].work[2] = WazaEffWork[2];
	TaskTable[id].work[3] = WazaEffWork[3];
	TaskTable[id].work[4] = WazaEffWork[4];
	TaskTable[id].work[5] = WazaEffWork[5];
	TaskTable[id].work[6] = WazaEffWork[6];
	TaskTable[id].work[7] = WazaEffWork[7];
	
	TaskTable[id].TaskAdrs = WazaTaskLasterInit;
	TaskTable[id].TaskAdrs(id);
}

static void WazaTaskLasterInit(u8 id)
{
	HLasterData ldata;
	LMD lmd;
	
	if(LasterSys.req == 1)
		return;
	
	ldata.DestAdrs = TARGET_BG;
	ldata.start_line = TaskTable[id].work[0];
	ldata.end_line = TaskTable[id].work[1];
	ldata.init_data1 = TaskTable[id].work[2] >> 8;
	ldata.init_data2 = TaskTable[id].work[2] & 0xff;
	ldata.loop = TaskTable[id].work[3];
//	LasterMake((const HLasterData *)&ldata, 0, TaskTable[id].work[5] >> 8,
//			TaskTable[id].work[5] & 0xff);
	lmd.h_angle = TaskTable[id].work[4] >> 8;
	lmd.h_add_angle = TaskTable[id].work[4] & 0xff;
	lmd.h_furihaba = TaskTable[id].work[5];
	lmd.v_angle = TaskTable[id].work[6] >> 8;
	lmd.v_add_angle = TaskTable[id].work[6] & 0xff;
	lmd.v_furihaba = TaskTable[id].work[7];
	LasterMake(&ldata, &lmd);
	TaskTable[id].TaskAdrs = WazaTaskLasterSet;
}

//----------------------------------------------------------
//	これ以前にﾗｽﾀｰがｾｯﾄされていて終了待ちだった時に、こっち側が
// 先に実行されて、「DelTaskが出来ない」ということになんないように
// わざと1WAIT空けさせてからHdmaSetを行う
//----------------------------------------------------------
static void WazaTaskLasterSet(u8 id)
{
	HdmaSet();
	TaskTable[id].TaskAdrs = WazaTaskLasterWait;
}

static void WazaTaskLasterWait(u8 id)
{
	if(LasterSys.req == 0)
		DelTaskEffect(id);
}






#endif	//**********************************************





