//=========================================================================
//	W_ParallelMoveSeq2-W_AffCheckEndSeqを実行		by nohara 01/05/30
//
//	こうそくスピン ころがる まるくなる
//	わるあがき れんぞくパンチ
//	みきり みねうち あばれる
//	マッハパンチ にどげり とびげり とびひざげり
//	たきのぼり たたきつける クラブハンマー おいうち
//	やつあたり いたみわけ ボーンラッシュ かえんぐるま
//	とっしん メガトンパンチ メガトンキック
//	じばく だいばくはつ すいとる
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
#include "task.h"
#include "palanm.h"
#include "ef_tool.h"
#include "cli_def.h"

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
void SeqWazaMineInit(actWork *Xreg);	//自分の方にでる
void SeqWazaEnemyInit(actWork *Xreg);	//相手の方にでる
void SeqWazaMikiriInit(actWork *Xreg);

//----------------------------------------------------------
//	定数定義
//----------------------------------------------------------
#define MIKIRI_WAIT		3
#define MINEUTI_WAIT	5

//注意
//Mine HflipをAttackがEnemyの時してる
//Enemy ActAnmChgをWazaEffWork[6]にいれてる

//----------------------------------------------------------
//	tamaころがるの玉	tama2まるくなるの玉	tama3ウェザーボール
//----------------------------------------------------------
static const actAnm moveTamaAnm[]={
	{OBJ16_16x16 * 0, 3, 0, 0},
	{OBJ16_16x16 * 1, 3, 0, 0},
	{OBJ16_16x16 * 2, 3, 0, 0},
	{OBJ16_16x16 * 3, 3, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm *const moveTamaAnmTbl[]={
		moveTamaAnm,
};
const	actHeader ActMoveTamaHeader={
	WAZACHR_ID_TAMA,
	WAZACHR_ID_TAMA,
	&WazaOamDataNormal[1],
	moveTamaAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaEnemyInit,
};
const	actHeader ActMoveTama2Header={
	WAZACHR_ID_TAMA,
	WAZACHR_ID_TAMA,
	&WazaOamDataNormal[1],
	moveTamaAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaMineInit,
};


//----------------------------------------------------------
//
//	ウェザーボール
//
//----------------------------------------------------------
static const actAnm WeatherBallAnm[]={
	{OBJ16_32x32 * 0, 3, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm *const WeatherBallAnmTbl[]={
		WeatherBallAnm,
};

static void SeqWazaUpThrowInit(actWork *Xreg);
const	actHeader ActMoveTama3Header={
	WAZACHR_ID_WBALL,
	WAZACHR_ID_WBALL,
	&WazaOamDataNormal[2],
	WeatherBallAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaUpThrowInit,
};


void SeqWazaBallAttackInit(actWork *Xreg);
const	actHeader ActMoveTama4Header={
	WAZACHR_ID_WBALL,
	WAZACHR_ID_WBALL,
	&WazaOamDataNormal[2],
	WeatherBallAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaBallAttackInit,
};

//----------------------------------------------------------
//	みきりのキラ みねうちのキラ
//----------------------------------------------------------
static const actAnm MikiriAnm[]={
	{OBJ16_32x32 * 0, MIKIRI_WAIT, 0, 0},
	{OBJ16_32x32 * 1, MIKIRI_WAIT, 0, 0},
	{OBJ16_32x32 * 2, MIKIRI_WAIT, 0, 0},
	{OBJ16_32x32 * 3, MIKIRI_WAIT, 0, 0},
	{OBJ16_32x32 * 4, MIKIRI_WAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm *const MikiriAnmTbl[]={
		MikiriAnm,
};
const	actHeader ActKiraHeader={
	WAZACHR_ID_L_HIKARI,
	WAZACHR_ID_L_HIKARI,
	&WazaOamDataNormal[2],
	MikiriAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaMikiriInit,
};


//----------------------------------------------------------
//	キック
//----------------------------------------------------------
const	actHeader ActKeriHeader={
	WAZACHR_ID_ANIMALLEG,
	WAZACHR_ID_ANIMALLEG,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaEnemyInit,
};

//----------------------------------------------------------
//	ダメージの絵
//----------------------------------------------------------
const actAnm movehit_anm0[] =
{
	{OBJ16_32x32 * 0, 5, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
const actAnm movehit_anm1[] =
{
//	{OBJ16_32x32 * 1, 5, 0, 0},
	{OBJ16_32x32 * 0, 5, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
const actAnm movehit_anm2[] =
{
	{OBJ16_32x32 * 0, 5, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
const actAnm * const MovehitAnmTbl[] = 
{
	movehit_anm0,
	movehit_anm1,
	movehit_anm2,
};
// 後々これらは削除する		2002.05.10(金) by matsuda
const actHeader ActMovehitHeader = 
{
	WAZACHR_ID_HITMARK,
	WAZACHR_ID_HITMARK,
	&WazaOamDataNormal[2],
	MovehitAnmTbl,
	ACT_NTRANS,		//非転送アニメ
	DummyActAffTbl,
	SeqWazaEnemyInit,
};

//----------------------------------------------------------
//	すいとるの玉
//----------------------------------------------------------
static const actAnm suitoruTamaAnm0[]={
	{OBJ16_16x16 * 0, 15, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm *const suitoruTamaAnmTbl[]={
		suitoruTamaAnm0,
};
static const actAffAnm suitoru_aff_anm0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x60, 0x60, 0, ACT_AFSET },				// 
	{ 2, 2, 0, 1 },						// 
	{ACT_AFLOOP,1,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const	actAffAnm * const suitoru_aff_tbl[] = {
	suitoru_aff_anm0,
};
const	actHeader ActSuitoruTamaHeader={
	WAZACHR_ID_TAMA,
	WAZACHR_ID_TAMA,
	&WazaOamDataAffine2[1],
	suitoruTamaAnmTbl,
	0,
	suitoru_aff_tbl,
	SeqWazaMineInit,
};

//-------------------------------------------------------------
//  アクターシーケンス
//-------------------------------------------------------------
//-------------------------------------------------------------
//  自分側にでる
//-------------------------------------------------------------
void SeqWazaMineInit(actWork *Xreg)
{
	EffPositionReset(Xreg);
	if(MineEnemyCheck(AttackNo))
	{
		Xreg->x -= WazaEffWork[0];
		WazaEffWork[3] =-WazaEffWork[3];
		Xreg->Hflip = 1;		//注意
	}
	else
		Xreg->x += WazaEffWork[0];

	Xreg->y += WazaEffWork[1];

	Xreg->work[0] = WazaEffWork[2];		//LOOP
	Xreg->work[1] = WazaEffWork[3];		//work[2]は計算用
	Xreg->work[3] = WazaEffWork[4];		//work[4]も
	Xreg->work[5] = WazaEffWork[5];		//表示on,offの間隔

	SetWorkSeq(Xreg, W_AffCheckEndSeq);
	Xreg->move=W_ParallelMoveSeq2;

}

//-------------------------------------------------------------
//  相手側にでる
//-------------------------------------------------------------
void SeqWazaEnemyInit(actWork *Xreg)
{
	if(MineEnemyCheck(AttackNo))
	{
		Xreg->x -= WazaEffWork[0];
		WazaEffWork[3]*=-1;
	}
	else
		Xreg->x += WazaEffWork[0];

	Xreg->y += WazaEffWork[1];

	Xreg->work[0] = WazaEffWork[2];		//loop
	Xreg->work[1] = WazaEffWork[3];		//work[2]は計算用
	Xreg->work[3] = WazaEffWork[4];		//work[4]も
	Xreg->work[5] = WazaEffWork[5];		//表示on,offの間隔

	ActAnmChg(Xreg,WazaEffWork[6]);

	SetWorkSeq(Xreg, W_AffCheckEndSeq);
	Xreg->move=W_ParallelMoveSeq2;
}


//----------------------------------------------------------
//	add by matsuda
// offset 0:Xoffset  1:Yoffset
//----------------------------------------------------------
void SeqWazaMikiriInit(actWork *Xreg)
{
	EffPositionReset(Xreg);
//	EffXpositionSet(Xreg, WazaEffWork[0]);
	if(MineEnemyCheck(AttackNo))
		Xreg->x -= WazaEffWork[0];
	else
		Xreg->x += WazaEffWork[0];
	Xreg->y += WazaEffWork[1];
	Xreg->move = W_AnmEndWait;
	SetWorkSeq(Xreg, DelWazaEffect);
}


//======================================================================
//	マッハパンチ
//																taya
//======================================================================
#define MACHPUNCH_SPD   (8)
#define MACHPUNCH_ZANZOU_PALID  (WAZACHR_ID_SPOON)  // 残像用のﾊﾟﾚｯﾄﾅﾝﾊﾞ取得用に、間違いなく使わないであろうIDを使用している
static void TaskMachPunchMain(u8 id);
static void machpunch_zanzou_add(TASK_TABLE *my, u8 task_id);

//==============================================
//	初期化タスク（0:影色  1:影evy）
//==============================================
void TaskMachPunch(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	u16 palno, poke_palno;

	my->work[0] = W_GetPokeActNo(0);  // 0:ﾎﾟｹﾓﾝｱｸﾀｰﾅﾝﾊﾞ
	my->work[1] = MineEnemyCheck(AttackNo)? -MACHPUNCH_SPD : MACHPUNCH_SPD;  // 1:移動速度
	my->work[2] = 0;  // 2:ｼｰｹﾝｽ
	my->work[3] = 0;  // 3:移動ｶｳﾝﾀ
	ActWork[my->work[0]].dx -= my->work[0];

	
	my->work[4] = ObjPalNumSet(MACHPUNCH_ZANZOU_PALID); // 4:残像ﾊﾟﾚｯﾄﾅﾝﾊﾞ
	my->work[5] = 0;  // 5:残像の数
	palno = (my->work[4] + 16) * 16;
	poke_palno = (ActWork[my->work[0]].oamData.Pltt + 16) * 16;

	my->work[6] = GetPokeSoftPri(AttackNo);
	if(my->work[6] == C_POKE2PRI || my->work[6] == CAI_POKE1PRI)
	{
		my->work[6] = 2;  // 6:残像のOAMﾌﾟﾗｲｵﾘﾃｨ
	}
	else
	{
		my->work[6] = 3;
	}

	CpuCopy(&PaletteWork[poke_palno], &PaletteWorkTrans[palno], 0x20, 32);
	SoftFade(palno, 16, WazaEffWork[1], WazaEffWork[0]);

	my->TaskAdrs = TaskMachPunchMain;

}
//==============================================
//	メインタスク
//==============================================
static void TaskMachPunchMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[2]){
	case 0:
		machpunch_zanzou_add(my, id);
		ActWork[my->work[0]].dx += my->work[1];
		if(++(my->work[3]) == 5){
			my->work[3]--;
			my->work[2]++;
		}
		break;

	case 1:
		machpunch_zanzou_add(my, id);
		ActWork[my->work[0]].dx -= my->work[1];
		if(--(my->work[3]) == 0){
			ActWork[my->work[0]].dx = 0;
			my->work[2]++;
		}
		break;

	case 2:
		// 残像アクターが全て消えたら終了
		if(my->work[5] == 0){
			ObjPalRegNumDel(MACHPUNCH_ZANZOU_PALID);
			DelTaskEffect(id);
		}
		break;
	}
}
//==============================================================
//	マッハパンチ用残像アクターを１体表示
//==============================================================
static void machpunch_zanzou_actmove(actWork *act);
static void machpunch_zanzou_add(TASK_TABLE *my, u8 task_id)
{
	s16 actno = W_PokeZanzouMake(0);
	if(actno < 0){ return; }
	ActWork[actno].oamData.Priority = my->work[6];
	ActWork[actno].oamData.Pltt = my->work[4];
	ActWork[actno].work[0] = 8;  // 残像の寿命sync数
	ActWork[actno].work[1] = task_id;  // ｶｳﾝﾀﾃﾞｸﾘﾒﾝﾄ時のため
	ActWork[actno].work[2] = actno;    // 
	ActWork[actno].dx = ActWork[my->work[0]].dx;
	ActWork[actno].move = machpunch_zanzou_actmove;
	my->work[5]++;
}
//==============================================================
//	マッハパンチ用残像アクターの動作関数
//==============================================================
static void machpunch_zanzou_actmove(actWork *act)
{
	if(--(act->work[0]) == 0){
		TaskTable[act->work[1]].work[5]--;
		W_PokeZanzouDel(act);
	}
}



// =================================================================
// SeqWazaUpThrowMain
// 概要  : ウェザーボールを天高く投げる（ウェザーボール用処理）
// 引数  : Xreg
// 戻り値: none
// =================================================================
static void SeqWazaUpThrowMain(actWork *Xreg);

static void SeqWazaUpThrowInit(actWork *Xreg)
{
	Xreg->x = GetWazaEffPos(AttackNo,PM_X);
	Xreg->y = GetWazaEffPos(AttackNo,PM_Y);

	if(MineEnemyCheck(AttackNo) == SIDE_MINE){
		Xreg->work[0] =  5;
	}else{
		Xreg->work[0] = -10;
	}
	Xreg->work[1] = -40;
	Xreg->move = SeqWazaUpThrowMain;
}

static void SeqWazaUpThrowMain(actWork *Xreg)
{
	Xreg->work[2] += Xreg->work[0];
	Xreg->work[3] += Xreg->work[1];
	Xreg->dx  = Xreg->work[2]/10;
	Xreg->dy  = Xreg->work[3]/10;
//	if(Xreg->work[0]>0)	Xreg->work[0]++;
//	else				Xreg->work[0]--;
	if(Xreg->work[1] < -20)
		Xreg->work[1]++;

	if((Xreg->y+Xreg->dy)<-32)
		DelWazaEffect(Xreg);
}


// =================================================================
// SeqWazaBallAttackInit
// 概要  : 落ちて当たるボール
// 引数  : [0]:Xoffset [1]:YOffset [2]:Sync数 [3]:攻撃側か防御側か(0,1)
//		   [4]:終了Xofset [5]:終了Yoffset
// 戻り値: none
// =================================================================
#define HURI_X_HABA	(30)

static void SeqWazaBallAttackMain(actWork *Xreg);
 void SeqWazaBallAttackInit(actWork *Xreg)
{
//	if(Xreg->aff_tbl != DummyActAffTbl)
//		if(MineEnemyCheck(DefenceNo) == SIDE_MINE)
//			ActAffAnmChg(Xreg,1);

	Xreg->work[0] = WazaEffWork[2];
	Xreg->work[2] = Xreg->x + WazaEffWork[4];
	Xreg->work[4] = Xreg->y + WazaEffWork[5];

	if(MineEnemyCheck(DefenceNo) == SIDE_MINE){
		Xreg->x = Xreg->x+HURI_X_HABA+WazaEffWork[4];
		Xreg->y    = -20+WazaEffWork[5];
	}else{
		Xreg->x = Xreg->x-HURI_X_HABA+WazaEffWork[4];
		Xreg->y    = -80+WazaEffWork[5];
	}
	
	Xreg->move = W_StraightSyncMove;
	SetWorkSeq(Xreg, DelWazaEffect);
}

static void SeqWazaBallAttackMain(actWork *Xreg)
{
	
}

