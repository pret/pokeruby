//=========================================================================
//	
//	水系 技エフェクト
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


#include "fight.h"
#include "calctool.h"
#include "task.h"
#include "decord.h"
#include "palanm.h"
#include "poketool.h"

#include "bss2.h"
#include "cli_def.h"
#include "laster.h"

//=========================================================================
//
//		「あまごい」2001/10/30
//														by mori
//=========================================================================

#include "..\scaddata\ef_30b.ach"
#include "..\scaddata\ef_30b.asc"

//----------------------------------------------------------
//	EXTERN宣言
//----------------------------------------------------------
extern BgAffineSrcData  Bg2Aff;

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
void WazaTaskAmagoi(u8 id);
static void SeqWazaAmagoiInit(actWork *Xreg);
static void SeqWazaAmagoi(actWork *Xreg);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------


//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm AmagoiAnm[]={		//かみなり２
		{OBJ16_16x32*0,2,0,0},			
		{OBJ16_16x32*1,2,0,0},
		{OBJ16_16x32*2,2,0,0},
		{OBJ16_16x32*3,6,0,0},
		{OBJ16_16x32*4,2,0,0},
		{OBJ16_16x32*5,2,0,0},
		{OBJ16_16x32*6,2,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm *const AmagoiAnmTbl[]={
		AmagoiAnm,
};

const	actHeader ActWazaAmagoiHeader={
	WAZACHR_ID_AMAGOI,
	WAZACHR_ID_AMAGOI,
	&WazaOamDataNormal[10],
	AmagoiAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaAmagoiInit,

};




//-------------------------------------------------------------
//		タスクシーケンス
//-------------------------------------------------------------
//----------------------------------------------------------
//  あまごい（あめふり）
//----------------------------------------------------------
void WazaTaskAmagoi(u8 taskno)
{
	u8 x,y;

	if(TaskTable[taskno].work[0]==0){
		TaskTable[taskno].work[1] = WazaEffWork[0];	//
		TaskTable[taskno].work[2] = WazaEffWork[1]; //雨の頻度（通常４・雨を多くするなら２）
		TaskTable[taskno].work[3] = WazaEffWork[2];	//何ｺﾏ実行するか
	}
	
	TaskTable[taskno].work[0]++;
	
	if((TaskTable[taskno].work[0]%TaskTable[taskno].work[2])==1){	//縦揺れ
		x=pp_rand()%240;
		y=pp_rand()%80;
		AddActor(&ActWazaAmagoiHeader,x,y,4);
	}
	
	if(TaskTable[taskno].work[0]==TaskTable[taskno].work[3]){
		DelTaskEffect(taskno);
	}
}

//---------------------------------------------------------------
//	アクターシーケンス
//---------------------------------------------------------------
//----------------------------------------------------------
//  あまごい（雨）
//	work[0]:初期位置ｘ
//	work[1]:初期位置ｙ
//----------------------------------------------------------
static void SeqWazaAmagoiInit( actWork * Xreg )
{
//	Xreg->x = WazaEffWork[0];
//	Xreg->y = WazaEffWork[1];
	Xreg->move = SeqWazaAmagoi;
}

//----------------------------------------------------------
//	あまごい（雨）
// offset:なし
//----------------------------------------------------------
static void SeqWazaAmagoi( actWork * Xreg )
{
	if(++Xreg->work[0]<14){
		Xreg->dx++;
		Xreg->dy+=4;
	}
	if(Xreg->anmend_sw == 1)
		DelActor(Xreg);
//		DelWazaEffect(Xreg);
}




//=========================================================================
//
//		「バブルこうせん」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaBaburuInit(actWork *Xreg);
static void SeqWazaBaburuReturn(actWork *Xreg);
static void SeqWazaBaburuEndWait(actWork *Xreg);
static void SeqWazaBaburuMain(actWork *Xreg);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define DEL_WAIT		10
#define AFFINE_ONE		(-60)
#define ANM_WAIT		5

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAffAnm BaburuAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{-5,-5,0,10},
	{5,5,0,10},
	{ACT_AFLOOP, 0, 0, 0 },
};
static const actAffAnm * const BaburuAffTbl[] = {
	BaburuAff0,
};

static const actAnm BaburuAnm[]={
		{OBJ16_16x16*0,1,0,0},
		{OBJ16_16x16*1,ANM_WAIT,0,0},
		{OBJ16_16x16*2,ANM_WAIT,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm *const BaburuAnmTbl[]={
		BaburuAnm,
};

const	actHeader ActBaburuHeader={
	WAZACHR_ID_AWA,
	WAZACHR_ID_AWA,
	&WazaOamDataBldAffine[1],
	BaburuAnmTbl,
	0,
	BaburuAffTbl,
	SeqWazaBaburuInit,
};


//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

//----------------------------------------------------------
//	0:Xoffset 1:Yoffset
//	2:X振り幅(泡の速度に影響する。泡をバラけさせるのにも影響)
//  3:Y振り幅  4:初期角度	(←2つ 最終的な曲がり角度に影響)
//	5:秒速度(固定少数) 泡の速度に影響
//	6:Sync回数(ｴﾌｪｸﾄ全体の長さ。泡の速度に影響)
//----------------------------------------------------------
static void SeqWazaBaburuInit(actWork *xreg)
{
	u8 banish_act;
	
//	WazaDefaultPosSet2(xreg, PM_MODE);
	if(MineEnemyCheck(AttackNo))
	{
		xreg->x = GetWazaEffPos(AttackNo, PM_X) - WazaEffWork[0];
		xreg->y = GetWazaEffPos(AttackNo, PM_Y) + WazaEffWork[1];
	}
	else
	{
		xreg->x = GetWazaEffPos(AttackNo, PM_X) + WazaEffWork[0];
		xreg->y = GetWazaEffPos(AttackNo, PM_Y) + WazaEffWork[1];
	}

	xreg->anm_pause = 1;

	if(MineEnemyCheck(AttackNo))
		WazaEffWork[2] = -WazaEffWork[2];
	
	xreg->work[0] = WazaEffWork[6];
	xreg->work[1] = xreg->x;
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X);
	xreg->work[3] = xreg->y;
	xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y);
	//W_GetStraightMoveLoop(xreg);
	W_GetStraightSyncParam(xreg);
//	xreg->work[0] = xreg->work[1];
//	xreg->work[1] = xreg->work[2];
	xreg->work[5] = AddBanishActor(DummyActMove);	//ﾜｰｸが足りないので
	banish_act = xreg->work[5];
	
	//円周上から始めるためのｵﾌｾｯﾄ
	xreg->x -= SinMove((u8)WazaEffWork[4], WazaEffWork[2]);
	xreg->y -= CosMove((u8)WazaEffWork[4], WazaEffWork[3]);

/*	
	xreg->work[2] = WazaEffWork[2];	//振り幅X
	xreg->work[3] = WazaEffWork[3];	//振り幅Y
	xreg->work[4] = WazaEffWork[5];	//秒速度
	xreg->work[5] = ((u8)WazaEffWork[4]) << 8;	//初期角度
	xreg->oamData.AffineParam = WazaEffWork[6];	//Sync回数
*/
	ActWork[banish_act].work[0] = WazaEffWork[2];	//振り幅X
	ActWork[banish_act].work[1] = WazaEffWork[3];	//振り幅Y
	ActWork[banish_act].work[2] = WazaEffWork[5];	//秒速度
	ActWork[banish_act].work[3] = ((u8)WazaEffWork[4]) << 8;	//初期角度
	ActWork[banish_act].work[4] = WazaEffWork[6];	//Sync回数
	
	xreg->move = SeqWazaBaburuMain;
	xreg->move(xreg);
}

static void SeqWazaBaburuMain(actWork *xreg)
{
	u8 loop;
	u16 nowsec;
	u8 banish_act;
	
	banish_act = xreg->work[5];
	loop = ActWork[banish_act].work[4];
	nowsec = (u16)ActWork[banish_act].work[3];

	xreg->work[0] = 1;
	W_ParallelSync(xreg);

	xreg->dx += SinMove(nowsec>>8, ActWork[banish_act].work[0]);
	xreg->dy += CosMove(nowsec>>8, ActWork[banish_act].work[1]);

	nowsec += ActWork[banish_act].work[2];
	ActWork[banish_act].work[3] = nowsec;
	
	if(--loop > 0)
		ActWork[banish_act].work[4] = loop;
	else{
		xreg->move = SeqWazaBaburuReturn;
		DelActor(&ActWork[banish_act]);
	}
/*
	loop = xreg->oamData.AffineParam;
	nowsec = (u16)xreg->work[5];
	xreg->dx = SinMove(nowsec >> 8, xreg->work[2]);
	xreg->dy = CosMove(nowsec >> 8, xreg->work[3]);

	nowsec += xreg->work[4];
	xreg->work[5] = nowsec;
	xreg->work[6] += xreg->work[0];
	xreg->work[7] += xreg->work[1];
	xreg->dx += xreg->work[6] >> 8;
	xreg->dy += xreg->work[7] >> 8;
	if(--loop > 0)
		xreg->oamData.AffineParam = loop;
	else
		xreg->move = SeqWazaBaburuReturn;
*/
}

static void SeqWazaBaburuReturn(actWork *Xreg)
{
	Xreg->anm_pause = 0;
	Xreg->move = W_AnmEndWait;
	SetWorkSeq(Xreg, SeqWazaBaburuEndWait);
}

static void SeqWazaBaburuEndWait(actWork *Xreg)
{
	Xreg->work[0] = DEL_WAIT;
	Xreg->move = W_WaitSeq;
	SetWorkSeq(Xreg, W_AffCheckEndSeq);
}







//=========================================================================
//
//		オーロラビーム
//												by matsuda 2002.01.21(月)
//=========================================================================
static void OororaBeemInit(actWork *xreg);
static void OororaBeemMain(actWork *xreg);

static const actAnm OororaBeemAnm0[]={
		{OBJ16_16x8*0,1,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm OororaBeemAnm1[]={
		{OBJ16_16x8*2,1,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm *const OororaBeemAnmTbl[]={
		OororaBeemAnm0,
		OororaBeemAnm1,
};

static const actAffAnm OororaBeemAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0,0,0,1},
	{0x60, 0x60, 0,1},
	{ACT_AFEND,0,0,0},
};
static const	actAffAnm * const OororaBeemAffTbl[] = {
	OororaBeemAff0,
};

const	actHeader ActOororaBeemHeader={
	WAZACHR_ID_WAKKA,
	WAZACHR_ID_WAKKA,
//	&WazaOamDataNormal[8],
	&WazaOamDataAffine2[8],
	OororaBeemAnmTbl,
	0,
//	DummyActAffTbl,
	OororaBeemAffTbl,
	OororaBeemInit,
};

//----------------------------------------------------------
//		わっかの本体
//	0:始点Xｵﾌｾｯﾄ	1:始点Yｵﾌｾｯﾄ	2:終点Xｵﾌｾｯﾄ	3:終点Yｵﾌｾｯﾄ
//	4:Sync回数
//----------------------------------------------------------
#define WAKKA_CHANGE_NUM	0xffff

static void OororaBeemInit(actWork *xreg)
{
	s16 offsetX;
	
	WazaDefaultPosSet2(xreg, PM_MODE);
	if(MineEnemyCheck(AttackNo))
		offsetX = -WazaEffWork[2];
	else
		offsetX = WazaEffWork[2];

	xreg->work[0] = WazaEffWork[4];
	xreg->work[1] = xreg->x;
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X) + offsetX;
	xreg->work[3] = xreg->y;
	xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y) + WazaEffWork[3];
	W_GetStraightSyncParam(xreg);
	xreg->move = OororaBeemMain;
	xreg->aff_pause = 1;
	xreg->move(xreg);
}

static void OororaBeemMain(actWork *xreg)
{
	if((u16)WazaEffWork[7] == WAKKA_CHANGE_NUM)
	{
		ActAnmChg(xreg, 1);
		xreg->aff_pause = 0;
	}
	if(W_ParallelSync(xreg))
		DelWazaEffect(xreg);
}


//----------------------------------------------------------
//	オーロラビーム全体を管理するﾀｽｸ
//	0:このﾀｽｸを消すまでのwait
//----------------------------------------------------------
#define OORORA_COLOR_WAIT	3

static void OororaBeemControlMain(u8 id);

void OororaBeemControlTask(u8 id)
{
	TaskTable[id].work[0] = WazaEffWork[0];
	TaskTable[id].work[2] = ObjPalNumGet(WAZACHR_ID_WAKKA) * 16 + 16*16;
	TaskTable[id].TaskAdrs = OororaBeemControlMain;
}

static void OororaBeemControlMain(u8 id)
{
	int i;
	u16 palno, temp;
	
	if(++TaskTable[id].work[10] == OORORA_COLOR_WAIT)
	{
		TaskTable[id].work[10] = 0;
		
		palno = TaskTable[id].work[2] + 1;
		temp = PaletteWorkTrans[palno];
		for(i = 1; i < 8; i++)
			PaletteWorkTrans[palno+i-1] = PaletteWorkTrans[palno+i];
		PaletteWorkTrans[palno+i-1] = temp;
	}
	
	if(++TaskTable[id].work[11] == TaskTable[id].work[0])
		DelTaskEffect(id);
}











//=========================================================================
//
//		ハイドロポンプ
//												by matsuda 2002.01.28(月)
//=========================================================================
static void HaidoroInit(actWork *xreg);
static void HaidoroMain(actWork *xreg);
void HaidoriKakudoTask(u8 id);
static void HaidoroKakudoMain(u8 id);

#define HAIDORO_SYNC	30
#define	HAIDORO_FAINAL_KAKUDO	210	//最終的な角度(敵に当った時の角度)
#define HAIDORO_ANMWAIT		1
static const actAnm HaidoroAnm0[]={
		{OBJ16_16x16*0,HAIDORO_ANMWAIT,0,0},
		{OBJ16_16x16*1,HAIDORO_ANMWAIT,0,0},
		{OBJ16_16x16*2,HAIDORO_ANMWAIT,0,0},
		{OBJ16_16x16*3,HAIDORO_ANMWAIT,0,0},
		{ACT_ANMLOOP,0,0,0}
};
const actAnm *const HaidoroAnmTbl[]={
		HaidoroAnm0,
};

const	actHeader ActHaidoroHeader={
	WAZACHR_ID_HAIDORO,
	WAZACHR_ID_HAIDORO,
	&WazaOamDataBldNormal[1],
	HaidoroAnmTbl,
	0,
	DummyActAffTbl,
	HaidoroInit,
};

//-- マッドショット --//
const	actHeader MaddoSyottoHeader={
	WAZACHR_ID_MADDO,
	WAZACHR_ID_MADDO,
	&WazaOamDataBldNormal[1],
	HaidoroAnmTbl,
	0,
	DummyActAffTbl,
	HaidoroInit,
};

//-- シグナルビーム --//
const	actHeader SignalBeemRedHeader={
	WAZACHR_ID_SIGNALRED,
	WAZACHR_ID_SIGNALRED,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	HaidoroInit,
};
const	actHeader SignalBeemGreenHeader={
	WAZACHR_ID_SIGNALGREEN,
	WAZACHR_ID_SIGNALGREEN,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	HaidoroInit,
};

//-- かえんほうしゃ --//
#define KAEN_ANMWAIT		2
static const actAnm KaenAnm0[] =
{
	{OBJ16_32x32 * 1, KAEN_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 2, KAEN_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 3, KAEN_ANMWAIT, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm * const KaenAnmTbl[] = 
{
	KaenAnm0,
};
const actHeader ActKaenHousyaHeader = 
{
	WAZACHR_ID_FIRE,
	WAZACHR_ID_FIRE,
	&WazaOamDataNormal[2],
	KaenAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	HaidoroInit,
};

//-- サイコウェーブ --//
extern const	actAffAnm * const TyouOnpaAffTbl[];
const	actHeader ActSaikoWaveHeader={
	WAZACHR_ID_ONPA_B,
	WAZACHR_ID_ONPA_B,
	&WazaOamDataAffine2[10],
	DummyActAnmTbl,
	0,
	TyouOnpaAffTbl,
	HaidoroInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:初期角度	3:振り幅Y
//----------------------------------------------------------
static void HaidoroInit(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[0] = HAIDORO_SYNC;
	xreg->work[1] = xreg->x;
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X);
	xreg->work[3] = xreg->y;
	xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y);
	W_GetStraightSyncParam(xreg);
	xreg->work[5] = (HAIDORO_FAINAL_KAKUDO << 8) / xreg->work[0];
	xreg->work[7] = WazaEffWork[3];
	
	if(WazaEffWork[7] > 127)	//WazaEffWork[7]は↓にある管理ﾀｽｸで制御されてる
	{
		xreg->work[6] = (WazaEffWork[7]-127) << 8;
		xreg->work[7] = -xreg->work[7];
	}
	else
		xreg->work[6] = WazaEffWork[7] << 8;
	
	xreg->move = HaidoroMain;
	xreg->move(xreg);
}

static void HaidoroMain(actWork *xreg)
{
	if(W_ParallelSync(xreg))
		DelWazaEffect(xreg);
	
	xreg->dy += SinMove(xreg->work[6] >> 8, xreg->work[7]);
	if(((xreg->work[6] + xreg->work[5]) >> 8) > 127)
	{
		xreg->work[6] = 0;
		xreg->work[7] = -xreg->work[7];
	}
	else
		xreg->work[6] += xreg->work[5];
}

//----------------------------------------------------------
//	初期角度を管理するﾀｽｸ
//	0:終了までのWait
//----------------------------------------------------------
void HaidoriKakudoTask(u8 id)
{
	TaskTable[id].work[0] = WazaEffWork[0];
	WazaEffWork[7] = 0;
	TaskTable[id].TaskAdrs = HaidoroKakudoMain;
}

static void HaidoroKakudoMain(u8 id)
{
	WazaEffWork[7]+=3;
	WazaEffWork[7] &= 0xff;
	if(--TaskTable[id].work[0] == 0)
		DelTaskEffect(id);
}


//=========================================================================
//
//		ハイドロカノン
//												by mori 2002.07.30
//=========================================================================
static void HydroCanonInit(actWork *xreg);
static void HydroCanonMain(actWork *xreg);
static void HydroCanonInit2(actWork *xreg);
//-- ハイドロカノン --//
static const actAffAnm HydroCanonAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{3,3,10,50},
	{0,0,0,10},
	{-20,-20,-10,20},
	{ACT_AFEND,0,0,0},
};

static const actAffAnm HydroCanonAff1[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0x150,0x150,0,ACT_AFSET},
	{ACT_AFEND,0,0,0},
};

static const	actAffAnm * const HydroCanonAffTbl[] = {
	 HydroCanonAff0,
	 HydroCanonAff1,
};


const	actHeader ActHydroCanonHeader={
	WAZACHR_ID_HAIDORO,
	WAZACHR_ID_HAIDORO,
	&WazaOamDataBldAffine2[1],
	HaidoroAnmTbl,
	0,
	HydroCanonAffTbl,
	HydroCanonInit,
};

const	actHeader ActHydroCanonHeader2={
	WAZACHR_ID_HAIDORO,
	WAZACHR_ID_HAIDORO,
	&WazaOamDataBldAffine2[1],
	HaidoroAnmTbl,
	0,
	&HydroCanonAffTbl[1],
	HydroCanonInit2,
};


static void HydroCanonInit(actWork *xreg)
{
	u8 work;
	
	xreg->x       = GetWazaEffPos(AttackNo, EFF_X);
	xreg->y       = GetWazaEffPos(AttackNo, EFF_Y);
	xreg->dy      = -10;
	work = GetPokeSoftPri(AttackNo);
	if(ContestCheck()==0){
		if(MineEnemyCheck(AttackNo) == SIDE_MINE ){
			xreg->dx  = 10;
			xreg->pri = work+2;
		}else{
			xreg->dx  = -10;
			xreg->pri = work-2;
		}
	}else{
			xreg->dx  = -10;
			xreg->pri = work+2;
	}
	xreg->move = HydroCanonMain;
}

static void HydroCanonMain(actWork *xreg)
{
	if(xreg->affend_sw)
		DelWazaEffect(xreg);
}

static void HydroCanonInit2(actWork *xreg)
{
	u8 st_mode, end_mode;

	if(MineEnemyCheck(AttackNo) == MineEnemyCheck(DefenceNo)){	//パーティアタック専用処理
		WazaEffWork[0] *= -1;
		
		if(ClientTypeGet(AttackNo)==BSS_CLIENT_MINE || ClientTypeGet(AttackNo)==BSS_CLIENT_ENEMY){
			WazaEffWork[0] *= -1;
		}
	}
	
	if((WazaEffWork[5] & 0xff00) == 0)
		st_mode = PM_MODE;
	else
		st_mode = EFF_MODE;
	if((WazaEffWork[5] & 0x00ff) == 0)
		end_mode = PM_Y;
	else
		end_mode = EFF_Y;
	
	WazaDefaultPosSet2(xreg, st_mode);
	if(MineEnemyCheck(AttackNo))
		WazaEffWork[2] = -WazaEffWork[2];
	xreg->work[0] = WazaEffWork[4];
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X) + WazaEffWork[2];
	xreg->work[4] = GetWazaEffPos(DefenceNo, end_mode) + WazaEffWork[3];
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, DelWazaEffect);
	
}






//=========================================================================
//
//		みずでっぽう
//												by matsuda 2002.02.06(水)
//=========================================================================
static const actAnm MizuSuitekiAnm0[]={		//丸い水
		{OBJ16_16x16*0,1,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm MizuSuitekiAnm1[]={		//水滴
		{OBJ16_16x16*1,1,0,0},
		{ACT_ANMEND,0,0,0}
};
const actAnm *const MizuSuitekiAnmTbl[]={
		MizuSuitekiAnm0,
		MizuSuitekiAnm1,
};

const	actHeader ActMizuDeppouHeader={
	WAZACHR_ID_MIZU2,
	WAZACHR_ID_MIZU2,
	&WazaOamDataBldNormal[1],
	MizuSuitekiAnmTbl,
	0,
	DummyActAffTbl,
	W_YamanariInitSeq,
};

//=========================================================================
//	みずでっぽうの水滴
//=========================================================================
static void MizuSuitekiInit(actWork *xreg);

extern const	actAffAnm * const HedoroSuitekiAffTbl[];

const	actHeader ActMizuSuitekiHeader={
	WAZACHR_ID_MIZU2,
	WAZACHR_ID_MIZU2,
	&WazaOamDataBldAffine2[1],
	&MizuSuitekiAnmTbl[1],
	0,
	HedoroSuitekiAffTbl,
	MizuSuitekiInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:終点Xoffset	3:終点Yoffset	4:Sync回数
//----------------------------------------------------------
static void MizuSuitekiInit(actWork *xreg)
{
	WazaDefaultPosSet1(xreg, PM_MODE);
	xreg->work[0] = WazaEffWork[4];
	xreg->work[2] = xreg->x + WazaEffWork[2];
	xreg->work[4] = xreg->y + WazaEffWork[4];
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, DelWazaEffect);
}











//=========================================================================
//
//		クラブハンマー
//												by matsuda 2002.02.06(水)
//=========================================================================
static void KurabuAwaInit(actWork *xreg);
static void KurabuAwaMain(actWork *xreg);

//-- クラブハンマーで使用する泡 --//
extern const actAnm *const YukiAnmTbl[];
const actHeader ActKurabuAwaHeader = 
{
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataNormal[0],
	&YukiAnmTbl[5],
	ACT_NTRANS,
	DummyActAffTbl,
	KurabuAwaInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:Sync回数	3: 0=攻撃側 1=防御側
//----------------------------------------------------------
#define KURABUAWA_SEC			11
#define KURABUAWA_FURIHABA		4
#define KURABUAWA_DY			(0x0030)	//上昇ｽﾋﾟｰﾄﾞ(固定少数)
static void KurabuAwaInit(actWork *xreg)
{
	if(WazaEffWork[3])
		WazaDefaultPosSet1(xreg, PM_MODE);
	else
		WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[7] = WazaEffWork[2];
	xreg->move = KurabuAwaMain;
}

static void KurabuAwaMain(actWork *xreg)
{
	xreg->work[0] = 0xff & (xreg->work[0] + KURABUAWA_SEC);
	xreg->dx = SinMove(xreg->work[0], KURABUAWA_FURIHABA);
	
	xreg->work[1] += KURABUAWA_DY;
	xreg->dy = -(xreg->work[1] >> 8);
	
	if(xreg->work[7]-- == 0)
		DelWazaEffect(xreg);
}













//=========================================================================
//
//		なみのり、だくりゅう
//												by matsuda 2002.02.06(水)
//=========================================================================
static void WazaNaminoriMain(u8 id);

#define NAMI_LASTER_USE

#ifdef NAMI_LASTER_USE
static void NaminoriLasterTask(u8 id);
#endif

#define NAMINORI_ADD_X		(2)
#define NAMINORI_ADD_Y		1

//----------------------------------------------------------
//	offset	0: 0=なみのり、 1=だくりゅう
//----------------------------------------------------------
void WazaNaminoriTask(u8 id)
{
	WazaBgData wazabg;
	u16 *scr_x, *scr_y;
	vu8 dma_wait;

#ifdef NAMI_LASTER_USE
	u8  task_id;
#endif
	
	scr_x = &ScrX1;
	scr_y = &ScrY1;

	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL | BLD_BG1_1ST;
	*(vu16*)REG_BLDALPHA = 16 << 8;	//(0x0e) | (4 << 8);
	(*(vBgCnt *)REG_BG1CNT).Priority = 1;
	(*(vBgCnt *)REG_BG1CNT).Size = 1;

	GetWazaEffBgAdrs(&wazabg);
	
	DIV_DMACLEAR(3, 0, wazabg.CharAdrs, 0x2000, 32);
	dma_wait = 0;	dma_wait = 0;
	DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x1000, 32);
	if(ContestCheck() == 0){
		//波乗りの間だけｷｬﾗｸﾀﾍﾞｰｽを変更(ｽｸﾘｰﾝﾃﾞｰﾀの関係で)
		(*(vBgCnt *)REG_BG1CNT).CharBasep = 1;
		if(MineEnemyCheck(AttackNo)==SIDE_ENEMY)
			DecordVram((void*)s_tsuna1_psc_ADRS, wazabg.ScrnAdrs);
		else
			DecordVram((void*)s_tsuna2_psc_ADRS, wazabg.ScrnAdrs);
	}
	else{	//ｺﾝﾃｽﾄ
		DecordVram((void*)s_tsuna3_psc_ADRS, wazabg.ScrnAdrs);
		ScrnPalRewrite(wazabg.PlttNo, (u32)wazabg.ScrnAdrs, 0, 1);
	}
	DecordVram((void*)s_tsuna_pch_ADRS, wazabg.CharAdrs);
	if(WazaEffWork[0] == 0)
		DecordPaletteWork((void*)s_tsuna_pcl_ADRS, 16*wazabg.PlttNo, 0x20);
	else
		DecordPaletteWork((void*)dakuryuu_pcl_ADRS, 16*wazabg.PlttNo, 0x20);

#ifdef NAMI_LASTER_USE
	task_id = AddTask(NaminoriLasterTask,TaskTable[id].pri+1);
	TaskTable[id].work[15] = task_id;
	TaskTable[task_id].work[0] = 0;
	TaskTable[task_id].work[1] = 0x1000;//(*(vu16*)REG_DISPCNT) |   DISP_BG1_ON;
	TaskTable[task_id].work[2] = 0x1000;//(*(vu16*)REG_DISPCNT) & (~DISP_BG1_ON);
#endif

	if(ContestCheck()){
		*scr_x = -240+64+32 + 64;
		*scr_y = -112+64;
		TaskTable[id].work[0] = NAMINORI_ADD_X;
		TaskTable[id].work[1] = NAMINORI_ADD_Y;
#ifdef NAMI_LASTER_USE
		TaskTable[task_id].work[3] = 0;     // 上限を広げる
#endif
	}else if(MineEnemyCheck(AttackNo)==SIDE_ENEMY){
		*scr_x = -224;
//		*scr_x = -240+64+32;
		*scr_y = 32*8;	//32;
		TaskTable[id].work[0] = NAMINORI_ADD_X;
		TaskTable[id].work[1] = -NAMINORI_ADD_Y;
#ifdef NAMI_LASTER_USE
		TaskTable[task_id].work[3] = 1;     // 下限を広げる
#endif
	}else{
		*scr_x = 0;
		*scr_y = -112+64;
		TaskTable[id].work[0] = -NAMINORI_ADD_X;
		TaskTable[id].work[1] = NAMINORI_ADD_Y;
#ifdef NAMI_LASTER_USE
		TaskTable[task_id].work[3] = 0;     // 上限を広げる
#endif
	}
	*(vu16 *)REG_BG1HOFS = *scr_x;
	*(vu16 *)REG_BG1VOFS = *scr_y;

#ifdef NAMI_LASTER_USE
	if(TaskTable[task_id].work[3]==0){
		TaskTable[task_id].work[4] = 48;  //4:上限
		TaskTable[task_id].work[5] = 112;  //5:下限
	}else{
		TaskTable[task_id].work[4] = 0;
		TaskTable[task_id].work[5] = 0;
	}
#endif

	//-- 波乗りの下にくるように一時的にﾌﾟﾗｲｵﾘﾃｨを下げる --//
	//PokePriAllSet(2);

	TaskTable[id].work[6] = 1;	//初回はすぐにBLDをいじるように
	TaskTable[id].TaskAdrs = WazaNaminoriMain;
}

static void WazaNaminoriMain(u8 id)
{
	vu8 dma_wait;
	u16 temp;
	u8 i;
	u16 *scrX, *scrY;
	WazaBgData wazabg;
	
	scrX = &ScrX1;
	scrY = &ScrY1;
	*scrX += TaskTable[id].work[0];
	*scrY += TaskTable[id].work[1];
	
	GetWazaEffBgAdrs(&wazabg);
	
	TaskTable[id].work[2] += TaskTable[id].work[1];	//現在位置把握のため

	if(TaskTable[id].work[5]++ == 3)
	{
		temp = PaletteWorkTrans[16*wazabg.PlttNo+1+6];
		for(i = 6; i > 0; i--)
			PaletteWorkTrans[16*wazabg.PlttNo+1+i]
				 = PaletteWorkTrans[16*wazabg.PlttNo+1+i-1];
		PaletteWorkTrans[16*wazabg.PlttNo+1] = temp;
		TaskTable[id].work[5] = 0;
	}
	
	TaskTable[id].work[6]++;
	if(TaskTable[id].work[6] > 1)
	{
		TaskTable[id].work[6] = 0;
		TaskTable[id].work[3]++;
		if(TaskTable[id].work[3] < 14)
		{
//			*(vu16*)REG_BLDALPHA = (TaskTable[id].work[3])|((16-TaskTable[id].work[3]) << 8);
			TaskTable[TaskTable[id].work[15]].work[1] = (s16)((TaskTable[id].work[3])|((16-TaskTable[id].work[3]) << 8));
			TaskTable[id].work[4]++;
		}
	
//		if((TaskTable[id].work[2] > 50 || TaskTable[id].work[2] < -50)
//			&& TaskTable[id].work[4] > 0)
		if(TaskTable[id].work[3] > 54)
		{
			TaskTable[id].work[4]--;
//			*(vu16*)REG_BLDALPHA=(TaskTable[id].work[4]) | ((16-TaskTable[id].work[4]) << 8);
			TaskTable[TaskTable[id].work[15]].work[1] = (s16)((TaskTable[id].work[4]) | ((16-TaskTable[id].work[4]) << 8));
		}
	}
	
//	if(TaskTable[id].work[2] > 112+64 || TaskTable[id].work[2] < -112-64)
	if(((TaskTable[TaskTable[id].work[15]].work[1]) & 0x1f) == 0)
	{
		DIV_DMACLEAR(3, 0, wazabg.CharAdrs, 0x2000, 32);
		dma_wait = 0;	dma_wait = 0;
		DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x1000, 32);
		if(ContestCheck() == 0)
			(*(vBgCnt *)REG_BG1CNT).CharBasep = 0;
		*scrX = 0;
		*scrY = 0;
		//-- 一時的に下げていたﾌﾟﾗｲｵﾘﾃｨを元に戻す --//
		//PokePriAllSet(1);

		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDALPHA = 0;

		TaskTable[TaskTable[id].work[15]].work[15] = 0xffff;  // ﾀｽｸを終了させる
		DelTaskEffect(id);
	}
}
#ifdef NAMI_LASTER_USE
static void NaminoriLasterTask(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	s16 i;

	switch(my->work[0]){
	case 0:
		{
			LasterData LD;


			for(i = 0; i < my->work[4]; i++){
				LasterBuffer[0][i]=LasterBuffer[1][i]= (u16)my->work[2];
			}
			for(i = my->work[4] ; i < my->work[5]; i++){
				LasterBuffer[0][i]=LasterBuffer[1][i]= (u16)my->work[1];
			}
			for(i = my->work[5] ;  i < 160; i++){
				LasterBuffer[0][i]=LasterBuffer[1][i]= (u16)my->work[2];
			}

			if(my->work[4] == 0){
				LasterBuffer[0][i]=LasterBuffer[1][i]= (u16)my->work[1];
			}else{
				LasterBuffer[0][i]=LasterBuffer[1][i]=(u16)my->work[2];
			}


			LD.DestAdrs = (void*)REG_BLDALPHA;
			LD.DMAControl = H_DMA_ENABLE16;
			LD.TransType = LASTER_NORMAL;
			LD.LoopCount = 0;

			LasterDmaSet(LD);

			my->work[0]++;
		}
		break;

	case 1:
		if(my->work[3]==0){
			my->work[4] -= NAMINORI_ADD_Y;
			if(my->work[4] <= 0)
			{
				my->work[4] = 0;
				my->work[0]++;
			}
		}else{
			my->work[5] += NAMINORI_ADD_Y;
			if(my->work[5] >= 112)
			{
				my->work[0]++;
			}
		}
		for(i = 0; i < my->work[4]; i++){
			LasterBuffer[LasterSys.BufFlag][i] = (u16)(my->work[2]);
		}
		for(i = my->work[4] ; i < my->work[5]; i++){
			LasterBuffer[LasterSys.BufFlag][i] = (u16)(my->work[1]);
		}
		for(i = my->work[5] ;  i < 160; i++){
			LasterBuffer[LasterSys.BufFlag][i] = (u16)(my->work[2]);
		}
/*
		if(my->work[4] == 0){
			LasterBuffer[0][i]=LasterBuffer[1][i]= my->work[1];
		}else{
			LasterBuffer[0][i]=LasterBuffer[1][i]= my->work[2];
		}
*/
		break;

	case 2:
		for(i = 0; i < my->work[4]; i++){
			LasterBuffer[LasterSys.BufFlag][i] = (u16)(my->work[2]);
		}
		for(i = my->work[4] ; i < my->work[5]; i++){
			LasterBuffer[LasterSys.BufFlag][i] = (u16)(my->work[1]);
		}
		for(i = my->work[5] ;  i < 160; i++){
			LasterBuffer[LasterSys.BufFlag][i] = (u16)(my->work[2]);
		}
		if(my->work[15]==(s16)(0xffff)){
			LasterInit();
//			*(vu16*)REG_DISPCNT = (u16)(my->work[1]);
			DelTask(id);
		}
		break;
	}
}
#endif

/******************************************************************
//----------------------------------------------------------
//  手抜きMAPﾃﾞｰﾀ左右反転ﾙｰﾁﾝ
//----------------------------------------------------------
static void flip_screen(u16* buf)
{
	
	int i,w;
	u16 linebuf[32],*p;
	
	for(i=0;i<32*2;i++){			//縦６４セル（５１２ドット）に限定
		p = (u16*)&buf[i*32];		//横３２セル（２５６ドット）に限定
		for(w=0;w<32;w++){
			linebuf[w] = p[w];
		}
		for(w=0;w<32;w++){
			p[w] = linebuf[31-w]|0x0400;
		}
	}

}
//----------------------------------------------------------
//  なみのり
//----------------------------------------------------------
void WazaTaskNaminori(u8 taskno)
{
	u16 color[256];
	s16 AttackSide;
	u16 *bgbuf;
	
	bgbuf = (u16*)UserWork;
	if((ClientTypeGet(AttackNo)&1)==SIDE_MINE){
		AttackSide = 0;
	}else{
		AttackSide = 1;
	}


	if(TaskTable[taskno].work[0]==0){
		TaskTable[taskno].work[1] = WazaEffWork[0];	//
		TaskTable[taskno].work[2] = WazaEffWork[1]; //雨の頻度（通常４・雨を多くするなら２）
		TaskTable[taskno].work[3] = WazaEffWork[2];	//何ｺﾏ実行するか
		DecordWram((void*)ef_30b_pcl_ADRS,(void *)color);
//		DecordVram((void*)ef_30b_pch_ADRS,(void *)BG_VRAM+3*0x4000);	//
//		DecordVram((void*)ef_30b_psc_ADRS,(void *)BG_VRAM+31*0x800);	//screen31,chara3
		DIV_DMAARRAYCOPY(3,ef_30b_Character,BG_VRAM+2*0x4000,16);
		DIV_DMAARRAYCOPY(3,ef_30b_Map,bgbuf,16);
		if(AttackSide) flip_screen(bgbuf);
		DIV_DMACOPY(3,bgbuf,BG_VRAM+30*0x800,32*64*2,16);
		PaletteWorkSet(&color[12*16],12*16,32);
   		*(vu16 *)REG_BLDCNT   = BLD_BG3_1ST|BLD_BG1_2ND|BLD_BG2_2ND|BLD_OBJ_2ND|BLD_A_BLEND_MODE;	//半透明設定
   		*(vu16 *)REG_BLDALPHA = 0x080c;
   		*(vu16 *)REG_BLDY	  = 0;
		*(vu16 *)REG_DISPCNT  |= DISP_BG3_ON;
		

	}
	TaskTable[taskno].work[0]++;
	ScrY3 = (sin_cos_table[TaskTable[taskno].work[0]])+30;

	
	

//	if(TaskTable[taskno].work[0]>TaskTable[taskno].work[3]-8){
//		*(vu16 *)REG_BLDALPHA = 0x000c+((TaskTable[taskno].work[3]-TaskTable[taskno].work[0])*0x1000);
//	}
	if(TaskTable[taskno].work[0]==TaskTable[taskno].work[3]){
		DelTaskEffect(taskno);
		DIV_DMACLEAR(3,0,BG_VRAM+2*0x4000,0x20*32*2,16);
		DIV_DMACLEAR(3,0,BG_VRAM+30*0x800,0x400,16);
		ScrY3 = 0;
   		*(vu16 *)REG_BLDCNT   = 0;		//半透明設定オフ
	}
	

}
************************************************/















//=========================================================================
//
//		たきのぼり
//												by matsuda 2002.06.20(木)
//=========================================================================
static void TakiSuitekiInit(actWork *xreg);
static void TakiSuitekiMain(actWork *xreg);

const	actHeader TakiSuitekiHeader={
	WAZACHR_ID_MIZU2,
	WAZACHR_ID_MIZU2,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	TakiSuitekiInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset
//----------------------------------------------------------
#define TAKISUITEKI_ENDWAIT		20
#define TAKISUITEKI_SP_X		0x0100
#define TAKISUITEKI_SP_Y		0x0140
static void TakiSuitekiInit(actWork *xreg)
{
	s16 x_offs, y_offs;
	
	xreg->oamData.CharNo += 0x8;
	WazaDefaultPosSet1(xreg, PM_MODE);
	x_offs = TAKISUITEKI_SP_X + (pp_rand() & 0xff);
	y_offs = pp_rand() & 0x01ff;
	if(y_offs >= 0x0100)
		y_offs = -(y_offs-0x0100);
	xreg->work[1] = x_offs;
	xreg->work[2] = y_offs;
	xreg->move = TakiSuitekiMain;
}

static void TakiSuitekiMain(actWork *xreg)
{
	xreg->work[3] += xreg->work[1];
	xreg->work[4] += xreg->work[2];
	if(xreg->work[1] & 1)
		xreg->dx = -(xreg->work[3] >> 8);
	else
		xreg->dx = xreg->work[3] >> 8;
	xreg->dy = xreg->work[4] >> 8;
	
	if(xreg->work[0]++ == TAKISUITEKI_ENDWAIT)
		DelWazaEffect(xreg);
}

















//=========================================================================
//	しおふき
//
//																taya
//=========================================================================
#define SHIO_HURUE_WIDTH  (3)
#define SHIO_HURUE_WAIT   (1)

#define SHIO_TATEYURE_HEIGHT  (3)
#define SHIO_TATEYURE_WAIT    (1)

#define SHIO_1ST_X     (0xe0)
#define SHIO_1ST_Y     (0x200)
#define SHIO_1ST_SYNC      (32)

#define SHIO_ADDACT_WAIT  (1)

#define SHIO_TAME_UNIT    (2)

#define SHIO_2ND_X   (0x180)
#define SHIO_2ND_Y   (0xe0)
#define SHIO_2ND_SYNC     (8)

#define SHIO_ACTNUM_MIN   (48)
#define SHIO_ACTNUM_UNIT  (12)


static u8 calc_siofuki_lv(void);
static void add_shio_actor(TASK_TABLE *my, u8 id);
static void TaskShiofukiMain(u8 id);

enum SIOFUKI_WORK {
	SW_SEQ,
	SW_LEVEL,
	SW_ACTCNT,
	SW_C1,
	SW_C2,
	SW_POKE_Y,
};

//==============================================
//	ポケモン動作初期化（ワーク設定不要）
//==============================================
void TaskShiofuki(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[15] = W_GetPokeActNo(0);  // 15:ﾎﾟｹﾓﾝｱｸﾀｰﾅﾝﾊﾞｰ

//	my->work[SW_ACT_Y] = GetWazaEffPos(AttackNo, PM_Y);
	my->work[SW_POKE_Y] = ActWork[my->work[15]].y;
	my->work[SW_LEVEL] = calc_siofuki_lv();

	PokeKakusyukuInit(my->work[15], 0);

	my->TaskAdrs = TaskShiofukiMain;
}
//==============================================
//	メイン
//==============================================
static void TaskShiofukiMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[SW_SEQ]){
	// 拡縮セット（縮む）
	case 0:
		SetPokeKakusyukuStep(my, my->work[15], 0x100, 0x100, SHIO_1ST_X, SHIO_1ST_Y, SHIO_1ST_SYNC);
		my->work[SW_SEQ]++;

	case 1:
		// （最大レベル時のみ）ガタガタ震える
		if(++(my->work[SW_C1]) > SHIO_HURUE_WAIT){
			my->work[SW_C1] = 0;
			my->work[SW_C2]++;
			if(my->work[SW_C2] & 1){
				ActWork[my->work[15]].dx = SHIO_HURUE_WIDTH;
				ActWork[my->work[15]].y++;
			}else{
				ActWork[my->work[15]].dx = -SHIO_HURUE_WIDTH;
			}
		}
		// 拡縮進行（縮む）
		if(!PokeKakusyukuStep(my)){
			PokeKakusyukuYHosei(my->work[15]);
			ActWork[my->work[15]].dx = 0;
			my->work[SW_C1] = 0;
			my->work[SW_C2] = 0;
			my->work[SW_SEQ]++;
		}
		break;

	case 2:
		// 少し待ち後、拡縮セット（伸びる）
		if(++(my->work[SW_C1]) > 4){
			SetPokeKakusyukuStep(my, my->work[15], SHIO_1ST_X, SHIO_1ST_Y, SHIO_2ND_X, SHIO_2ND_Y, SHIO_2ND_SYNC);
			my->work[SW_C1] = 0;
			my->work[SW_SEQ]++;
		}
		break;

	case 3:
		// 拡縮進行（伸びる）
		if(!PokeKakusyukuStep(my)){
//			add_hunka_iwa_actor(my->work[15], id, 6);
			my->work[SW_C1] = 0;
			my->work[SW_C2] = 0;
			my->work[SW_SEQ]++;
		}
		break;

	case 4:
		add_shio_actor(my, id);
		my->work[SW_SEQ]++;

	case 5:
		// 縦にガクガク震える
		if(++(my->work[SW_C1]) > SHIO_TATEYURE_WAIT){
			my->work[SW_C1] = 0;
			my->work[SW_C2]++;
			if(my->work[SW_C2] & 1){
				ActWork[my->work[15]].dy += 2;
			}else{
				ActWork[my->work[15]].dy -= 2;
			}
			if(my->work[SW_C2]==10){  // 偶数で
				SetPokeKakusyukuStep(my, my->work[15], SHIO_2ND_X, SHIO_2ND_Y, 0x100, 0x100, SHIO_1ST_SYNC/4);
				my->work[SW_C1] = 0;
				my->work[SW_C2] = 0;
				my->work[SW_SEQ]++;
			}
		}
		break;

	case 6:
		// 拡縮進行（戻る）
		ActWork[my->work[15]].y--;
		if(!PokeKakusyukuStep(my)){
			PokeKakusyukuEnd(my->work[15]);
			ActWork[my->work[15]].y = my->work[SW_POKE_Y];
			my->work[SW_C2] = 0;
			my->work[SW_SEQ]++;
		}
		break;

	case 7:
		// 水が全部消えたら終了
		if(my->work[SW_ACTCNT] == 0){
			DelTaskEffect(id);
		}
		break;
	}
}
//=======================================
// しおふきのレベル計算(0～3)
//=======================================
static u8 calc_siofuki_lv(void)
{
	PokemonParam *pp;
	u16 maxhp, hp;
	u8 i;

	if(MineEnemyCheck(AttackNo)==SIDE_MINE){
		pp = PokeParaMine + SelMonsNo[AttackNo];
	}else{
		pp = PokeParaEnemy + SelMonsNo[AttackNo];
	}

	maxhp = PokeParaGet(pp, ID_hpmax);
	hp = PokeParaGet(pp, ID_hp);

	maxhp /= 4;
	for(i = 0; i < 3; i++)
	{
		if(hp < (maxhp * (i+1))){
			return i;
		}
	}

	return 3;
}
//===============================================================
// しおふきアクター
//===============================================================
#define SHIOACT_MAX       (20)

static const actHeader ShioHeader;
static void ShioActMove(actWork *act);

static void add_shio_actor(TASK_TABLE *my, u8 id)
{
	s16 x, y, step, i, angle;
	u8  no, pri;

	x = GetWazaEffPos(AttackNo, PM_X);
	y = GetWazaEffPos(AttackNo, PM_Y);
	angle = 172;
	pri = GetPokeSoftPri(AttackNo) - 1;
	step = (4-my->work[SW_LEVEL]);
	if(step <= 0){ step = 1; }  // あり得ないけど念のため


	for(i = 0; i < SHIOACT_MAX; i += step)
	{
		no = AddActor(&ShioHeader, x, y, pri);
		if(no != ACT_MAX)
		{
			ActWork[no].work[1] = i;
			ActWork[no].work[2] = x << 4;
			ActWork[no].work[3] = y << 4;
			ActWork[no].work[4] = CosMove(angle, 64);
			ActWork[no].work[5] = SinMove(angle, 64);

			ActWork[no].work[6] = id;
			ActWork[no].work[7] = SW_ACTCNT;

			// バラけさせる
			if(my->work[SW_ACTCNT]&1){
				ShioActMove(&ActWork[no]);
			}

			my->work[SW_ACTCNT]++;

		}
		angle += (2*step);
		angle &= 0xff;
	}
}
static void ShioActMove(actWork *act)
{
	switch(act->work[0]){
	case 0:
		act->work[4] += ((act->work[1] % 6)*3);
		act->work[5] += ((act->work[1] % 3)*3);
		act->work[0]++;
		/* fall throw */
	case 1:
		act->work[2]+=act->work[4];
		act->work[3]+=act->work[5];
		act->x = act->work[2] >>4;
		act->y = act->work[3] >>4;
		if(act->x < -8 || act->x > 248 || act->y < -8 || act->y > 120)
		{
			TaskTable[act->work[6]].work[act->work[7]]--;
			DelActor(act);
		}
		break;
	}
}

static const actHeader ShioHeader = 
{
	WAZACHR_ID_SIOFUKI,
	WAZACHR_ID_SIOFUKI,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	ShioActMove,
};


//==============================================
//	水滴が防御側に降ってくるタスク
//==============================================
static void add_shio2_actor(TASK_TABLE *my, u8 id);
#define SHIO2_ACTSPEED  (8)

enum SHIO2_WORK {
	S2W_SEQ,
	S2W_LEVEL,
	S2W_TIMER,
	S2W_TIMER2,
	S2W_XMIN,
	S2W_XMAX,
	S2W_YLINE,
	S2W_X,
	S2W_Y,
	S2W_ACTCNT,
	S2W_HIT,
	S2W_ACTNUM,
	S2W_ACTNUM_MAX,
	S2W_QUAKE_FLG,
};
static void TaskShiofuki2ndMain(u8 id);
extern void TaskQuake(u8 id);


void TaskShiofuki2nd(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[S2W_LEVEL] = calc_siofuki_lv();

	if(MineEnemyCheck(AttackNo)==SIDE_MINE){
		my->work[S2W_XMIN] = CAI_POKE2X - 16;
		my->work[S2W_YLINE] = CAI_POKE_Y;
	}else{
		my->work[S2W_XMIN] = C_POKE1X - 16;
		my->work[S2W_YLINE] = C_POKE_Y;
	}
	my->work[S2W_XMAX] = 98;
	my->work[S2W_X] = my->work[S2W_XMIN] + (my->work[S2W_XMAX]/2);

	my->work[S2W_ACTNUM_MAX] = 5 + my->work[S2W_LEVEL] * 5;

	my->TaskAdrs = TaskShiofuki2ndMain;
}
static void TaskShiofuki2ndMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[S2W_SEQ]){
	case 0:
		if(++(my->work[S2W_TIMER]) > 2){
			my->work[S2W_TIMER]=0;
			add_shio2_actor(my,id);
		}
		// 最初の１つが着弾
		if(my->work[S2W_HIT])
		{
			if(my->work[S2W_QUAKE_FLG]==0){
				u8 no;
				WazaEffWork[0] = 1;
				WazaEffWork[1] = 0;
				WazaEffWork[2] = 12;
				no = AddTask(TaskQuake,80);
				if(no!=0xff){
					(TaskTable[no].TaskAdrs)(no);
					WazaEffectCount++;
				}
				WazaEffWork[0] = 3;
				no = AddTask(TaskQuake,80);
				if(no!=0xff){
					(TaskTable[no].TaskAdrs)(no);
					WazaEffectCount++;
				}
				my->work[S2W_QUAKE_FLG]=1;
			}
		}
		// 全弾登録完了
		if(my->work[S2W_ACTNUM] >= my->work[S2W_ACTNUM_MAX])
		{
			my->work[S2W_SEQ]++;
		}
		break;

	case 1:
		if(my->work[S2W_ACTCNT]==0)
		{
			DelTaskEffect(id);
		}
		break;
	}

}
static void shio2_actmove(actWork *act);
static void shiohit_move(actWork *act);

extern const actHeader ActMizuHitHeader;

static void add_shio2_actor(TASK_TABLE *my, u8 id)
{
	s16 y;
	u8 no;

	y = my->work[S2W_YLINE] + ((sin_cos_table[my->work[S2W_Y]] + 3) >> 4);
	no = AddActor(&ShioHeader, my->work[S2W_X], 0, 0);
	if(no != ACT_MAX)
	{
		ActWork[no].move = shio2_actmove;
		ActWork[no].work[5] = y;
		ActWork[no].work[6] = id;
		ActWork[no].work[7] = S2W_ACTCNT;
		my->work[S2W_ACTCNT]++;
	}
	my->work[S2W_ACTNUM]++;

	my->work[S2W_Y] = (my->work[S2W_Y] + 39) & 0xff;
	my->work[S2W_X] = my->work[S2W_XMIN]+((my->work[S2W_X] * 1103515245L + 12345) % my->work[S2W_XMAX]);

}
static void shio2_actmove(actWork *act)
{
	switch(act->work[0]){
	case 0:
		act->y += SHIO2_ACTSPEED;
		if(act->y >= act->work[5]){
			TaskTable[act->work[6]].work[S2W_HIT]=1;
			act->work[1] = AddActor(&ActMizuHitHeader,act->x,act->y,1);
			if(act->work[1] != ACT_MAX)
			{
				ActAffAnmChg(&(ActWork[act->work[1]]), 3);
				ActWork[act->work[1]].work[6] = act->work[6];
				ActWork[act->work[1]].work[7] = act->work[7];
				ActWork[act->work[1]].move = shiohit_move;
			}
			DelActor(act);
		}
		break;
	}
}
static void shiohit_move(actWork *act)
{
	if(++(act->work[1]) > 1){
		act->work[1] = 0;
		act->banish ^= 1;
		if(++(act->work[2])==12){
			TaskTable[act->work[6]].work[act->work[7]]--;
			AffineWorkNumDel(act->oamData.AffineParamNo);
			DelActor(act);
		}
	}
}






//=========================================================================
//	みずあそび
//
//														taya 2002.07.26
//=========================================================================
#define MIZUASOBI_MOVE_SYNC     (16)
#define MIZUASOBI_YAMAHABA_MIN  (-32)
#define MIZUASOBI_XSPEED  (6)
#define MIZUASOBI_YSPEED  (-2)

static void TaskMizuAsobiMain(u8 id);
static void MizuAsobiActMove(actWork *act);
static void add_mizuasobi_actor(TASK_TABLE *my);

enum MIZUASOBI_WORK {
	MW_SEQ,
	MW_TIMER,
	MW_ACT_TIMER,
	MW_SX,
	MW_SY,
	MW_EX,
	MW_EY,
	MW_VEC,
	MW_ACTCNT,
	MW_YAMAHABA,
	MW_SUITEKI_SW,
	MW_SUITEKI_ACTNO,
	MW_RETURN_CNT,
	MW_ENDFLG,
	MW_SEED,
};

//==============================================
// 初期化（ﾜｰｸ設定不要)
//==============================================

void TaskMizuAsobi(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[MW_SX] = GetWazaEffPos(AttackNo, PM_X);
	my->work[MW_SY] = GetWazaEffPos(AttackNo, PM_Y);

	my->work[MW_VEC] = (MineEnemyCheck(AttackNo)==SIDE_MINE)? 1 : -1;

	if(ContestCheck()){
		my->work[MW_VEC] *= -1;
	}

	my->work[MW_EX] = my->work[MW_SX] + (8 * my->work[MW_VEC]);
	my->work[MW_EY] = my->work[MW_SY] - (8 * my->work[MW_VEC]);

	my->work[MW_YAMAHABA] = MIZUASOBI_YAMAHABA_MIN;

	my->work[MW_TIMER] = 0;
	my->work[MW_SEQ] = 0;

	my->TaskAdrs = TaskMizuAsobiMain;
}
//==============================================
// ﾒｲﾝﾀｽｸ
//==============================================
static void TaskMizuAsobiMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[MW_SEQ]){
	case 0:
		add_mizuasobi_actor(my);
		if(my->work[MW_SUITEKI_SW]){
			my->work[MW_SEQ]++;
		}
		break;

	case 1:
		add_mizuasobi_actor(my);
		if(++(my->work[MW_TIMER]) > 16){
			my->work[MW_TIMER] = 0;
			my->work[MW_SEQ]++;
		}
		break;

	case 2:
		add_mizuasobi_actor(my);
		my->work[MW_EX] += (MIZUASOBI_XSPEED * my->work[MW_VEC]);
		if(my->work[MW_EX] > 256 || my->work[MW_EX] < -16)
		{
			if(++(my->work[MW_RETURN_CNT]) >= 3)
			{
				my->work[MW_ENDFLG] = 1;
				my->work[MW_SEQ] = 6;
				my->work[MW_TIMER] = 0;
				break;
			}
			my->work[MW_TIMER] = 0;
			my->work[MW_SEQ]++;
		}
		break;

	case 3:
		add_mizuasobi_actor(my);
		my->work[MW_EY] += (MIZUASOBI_YSPEED * my->work[MW_VEC]);
		if(++(my->work[MW_TIMER]) >= 8)
		{
			my->work[MW_SEQ]++;
		}
		break;

	case 4:
		add_mizuasobi_actor(my);
		my->work[MW_EX] -= (MIZUASOBI_XSPEED * my->work[MW_VEC]);
		if(my->work[MW_EX] > 256 || my->work[MW_EX] < -16)
		{
			my->work[MW_RETURN_CNT]++;
			my->work[MW_TIMER] = 0;
			my->work[MW_SEQ]++;
		}
		break;

	case 5:
		add_mizuasobi_actor(my);
		my->work[MW_EY] += (MIZUASOBI_YSPEED * my->work[MW_VEC]);
		if(++(my->work[MW_TIMER]) >= 8)
		{
			my->work[MW_SEQ] = 2;
		}
		break;


	case 6:
		if(my->work[MW_ACTCNT]==0){
			my->work[MW_SEQ]++;
		}
		break;

	default:
		DelTaskEffect(id);
		break;
	}
}
//==============================================
// ｱｸﾀｰ１個追加
//==============================================
static void add_mizuasobi_actor(TASK_TABLE *my)
{
	if(++(my->work[MW_ACT_TIMER]) > 1){
		u8 no;

		my->work[MW_ACT_TIMER] = 0;
		no = AddActor(&ShioHeader,my->work[MW_SX],my->work[MW_SY],10);
		if(no != ACT_MAX){
			ActWork[no].work[0] = MIZUASOBI_MOVE_SYNC;
			ActWork[no].work[2] = my->work[MW_EX];
			ActWork[no].work[4] = my->work[MW_EY];
			ActWork[no].work[5] = my->work[MW_YAMAHABA];
			YamanariMoveInit(&ActWork[no]);
			ActWork[no].move = MizuAsobiActMove;
			my->work[MW_ACTCNT]++;
		}
	}
}
//==============================================
// ｱｸﾀｰ動作関数
//==============================================
static void MizuAsobiActMove2nd(actWork *act);

static void MizuAsobiActMove(actWork *act)
{
	if(YamanariMoveMain(act)){
		act->x += act->dx;
		act->y += act->dy;
		act->work[0] = 6;
		act->work[2] = act->x + ((pp_rand() & 0x1f) - 16);
		act->work[4] = act->y + ((pp_rand() & 0x1f) - 16);
		act->work[5] = -((pp_rand()&0x07)+1);
		YamanariMoveInit(act);
		act->move = MizuAsobiActMove2nd;
	}
}
static void MizuAsobiActMove2nd(actWork *act)
{
	if(YamanariMoveMain(act)){
		u16 i;
		for(i = 0; i < TASK_MAX; i++){
			if(TaskTable[i].TaskAdrs == TaskMizuAsobiMain)
			{
				TaskTable[i].work[MW_SUITEKI_SW] = 1;
				TaskTable[i].work[MW_ACTCNT]--;
				DelActor(act);
			}
		}
	}
}


//=========================================================================
//
//		みずのはどう
//												mori 2002.07.30
//=========================================================================
static void ActMizuAwaMoveInit(actWork *Xreg);
static void ActMizuAwaMoveMain(actWork *Xreg);

static const actAnm MizuAnm0[]={		//丸い水
		{OBJ16_8x8*8,1,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm MizuAnm1[]={		//水滴
		{OBJ16_8x8*9,1,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm MizuAnm2[]={		//水滴
		{OBJ16_16x16*1,1,0,0},
		{ACT_ANMEND,0,0,0}
};
const actAnm *const MizuAnmTbl[]={
		MizuAnm0,
		MizuAnm1,
		MizuAnm2,
};


static const actAffAnm MizuAbukuAff0[]={
	{0x100,0x100,0,ACT_AFSET},
	{-10,-10,0,15},
	{ACT_AFEND,0,0,0},
};

static const actAffAnm MizuAbukuAff1[]={
	{0xe0,0xe0,0,ACT_AFSET},
	{-8,-8,0,15},
	{ACT_AFEND,0,0,0},
};

static const actAffAnm MizuAbukuAff2[]={
	{0x150,0x150,0,ACT_AFSET},
	{0,0,0,15},
	{ACT_AFEND,0,0,0},
};
const	actAffAnm * const MizuAbukuAffTbl[] = {
	MizuAbukuAff0,
	MizuAbukuAff1,
	MizuAbukuAff2,
};


const	actHeader ActMizuAwaHeader={
	WAZACHR_ID_MIZU2,
	WAZACHR_ID_MIZU2,
	&WazaOamDataNormal[0],
	MizuAnmTbl,
	0,
	DummyActAffTbl,
	ActMizuAwaMoveInit,
};

static void ActAbukuMoveInit(actWork *Xreg);
const actHeader ActAbukuHeader={
	WAZACHR_ID_MIZU2,
	WAZACHR_ID_MIZU2,
	&WazaOamDataAffine[0],
	MizuAnmTbl,
	0,
	MizuAbukuAffTbl,
	ActAbukuMoveInit,
};

/*----------ウェザーボール用-----------------*/
extern void SeqWazaBallAttackInit(actWork *Xreg);
const actHeader ActWeatherMizuHeader={
	WAZACHR_ID_MIZU2,
	WAZACHR_ID_MIZU2,
	&WazaOamDataAffine[1],
	&MizuAnmTbl[2],
	0,
	&MizuAbukuAffTbl[2],
	SeqWazaBallAttackInit,
};

//=========================================================================
//  水中の泡
//
//
//  0:X初期位置 1:Y初期位置 2:上るスピード	3:Sin揺れ幅	4:Sinｽﾋﾟｰﾄﾞ 5:生存時間
//	6:泡の種類（0か1）
//=========================================================================
static void ActMizuAwaMoveInit(actWork *Xreg)
{
	Xreg->x       = WazaEffWork[0];
	Xreg->y       = WazaEffWork[1];
	Xreg->work[0] = WazaEffWork[2];
	Xreg->work[1] = WazaEffWork[3];
	Xreg->work[2] = WazaEffWork[4];
	Xreg->work[3] = WazaEffWork[5];
	Xreg->move    = ActMizuAwaMoveMain;
}


static void ActMizuAwaMoveMain(actWork *Xreg)
{
	Xreg->work[4] -= Xreg->work[0];
	Xreg->dy = Xreg->work[4]/10;
	Xreg->work[5] += Xreg->work[1];
	Xreg->work[5] &= 0xff;
	Xreg->dx  = SinMove(Xreg->work[5],Xreg->work[2]);

	if(--Xreg->work[3]==0){
		DelWazaEffect(Xreg);
	}
}

// =================================================================
// ActAbukuMoveInit
// 概要  : みずのはどうの音波に生み出されるあぶく
// 引数  : 0:生存時間	1:X移動量(少数4bit) 2:Y移動量(少数4bit)
// 戻り値: none
// =================================================================
static void ActAbukuMoveInit(actWork *Xreg)
{
	Xreg->work[3] += Xreg->work[1];
	Xreg->work[4] += Xreg->work[2];
	Xreg->dx = Xreg->work[3]>>7;
	Xreg->dy = Xreg->work[4]>>7;
	if(--Xreg->work[0]==0){
		AffineDelActor(Xreg);
		DelActor(Xreg);
	}
}


// =================================================================
// ActMizunoHadouMoveInit
// 概要  : みずのはどう（泡をだしながら飛んでいく）
// 引数  : 0:Xoffset 1:Yoffset 2:何Syncで到達するか	
//		   3:何syncごとにあぶくを出すか
// 戻り値: 
// =================================================================
static void ActMizunoHadouMoveMain(actWork *Xreg);
static void ActAbukuSet(actWork *Xreg, s32 wx, s32 wy);
void ActMizunoHadouMoveInit(actWork *Xreg)
{
	WazaDefaultPosSet2(Xreg, PM_MODE);
	Xreg->work[1] = GetWazaEffPos(DefenceNo, PM_X);
	Xreg->work[2] = GetWazaEffPos(DefenceNo, PM_Y);
	Xreg->work[3] = WazaEffWork[2];
	Xreg->work[4] = WazaEffWork[3];
	Xreg->move    = ActMizunoHadouMoveMain;
}

static void ActMizunoHadouMoveMain(actWork *Xreg)
{
	s32 wx,wy;
	wx = Xreg->work[1] - Xreg->x;
	wy = Xreg->work[2] - Xreg->y;
	Xreg->dx = (wx*Xreg->work[0])/Xreg->work[3];
	Xreg->dy = (wy*Xreg->work[0])/Xreg->work[3];

	if(++Xreg->work[5] == Xreg->work[4]){
		Xreg->work[5] = 0;
		ActAbukuSet(Xreg,wx,wy);
	}

	if(Xreg->work[3]==Xreg->work[0]){
		DelWazaEffect(Xreg);
	}
	Xreg->work[0]++;
}


static void ActAbukuSet(actWork *Xreg, s32 wx, s32 wy)
{
	s16 x,y,my,i,flag=1,vx,vy;
	u8 no;
	
	my = Xreg->work[0]/2;
	x = Xreg->x + Xreg->dx;
	y = Xreg->y + Xreg->dy;
	if(wy<0) flag *=-1;
	vx = wy+pp_rand()%10-5;
	vy = -wx+pp_rand()%10-5;
	
	for(i=0;i<1;i++){
		no = AddActor(&ActAbukuHeader,x,y+my,128+2);
		ActWork[no].work[0] = 20;
		ActWork[no].work[1] =  vx;
		ActWork[no].pri = GetPokeSoftPri(AttackNo)-1;
		if(vy<0){
			ActWork[no].work[2] = -vy;
		}else{
			ActWork[no].work[2] = vy;
		}
	}
	for(i=0;i<1;i++){
		no = AddActor(&ActAbukuHeader,x,y-my,128+2);
		ActWork[no].work[0] = 20;
		ActWork[no].work[1] = vx;
		ActWork[no].pri = GetPokeSoftPri(AttackNo)-1;
		if(vy>0){
			ActWork[no].work[2] = -vy;
		}else{
			ActWork[no].work[2] = vy;
		}

	}

}
