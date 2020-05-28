//=========================================================================
//	
//	ノーマル系 技エフェクト用ソースファイル２
//
//		ノーマル系の技が多いので、2つ目のファイル
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
#include "decord.h"
#include "contest.h"
#include "cli_def.h"
#include "client_t.h"
#include "poketool.h"
#include "mus_tool.h"
#include "con_tool.h"



//----------------------------------------------------------
//	データ
//----------------------------------------------------------
extern const actAffAnm * const PmAffAnmTblF2[];
extern const actAffAnm * const PmAffAnmTblF[];





//=========================================================================
//
//		ひっかく
//												by matsuda 2002.02.20(水)
//=========================================================================
#define HIKKAKU_ANMWAIT		4
static const actAnm HikkakuAnm[]={
		{OBJ16_32x32*0,HIKKAKU_ANMWAIT,0,0},
		{OBJ16_32x32*1,HIKKAKU_ANMWAIT,0,0},
		{OBJ16_32x32*2,HIKKAKU_ANMWAIT,0,0},
		{OBJ16_32x32*3,HIKKAKU_ANMWAIT,0,0},
		{OBJ16_32x32*4,HIKKAKU_ANMWAIT,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm *const HikkakuAnmTbl[]={
		HikkakuAnm,
};

const	actHeader ActHikkakuHeader={
//	WAZACHR_ID_CGATAKIRI,
//	WAZACHR_ID_CGATAKIRI,
	WAZACHR_ID_HIKKAKU2,
	WAZACHR_ID_HIKKAKU2,
	&WazaOamDataBldNormal[2],
	HikkakuAnmTbl,
	0,
	DummyActAffTbl,
	W_AnmAffWaitDel,
};














//=========================================================================
//
//		「えんまく」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaEnmakuMain(actWork *Xreg);
static void SeqWazaEnmakuInit(actWork *Xreg);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define SMOKE_OFFSET_X	10
#define SMOKE_OFFSET_Y	15

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
const	actHeader ActEnmakuHeader={
	WAZACHR_ID_ENMAKU,
	WAZACHR_ID_ENMAKU,
	&WazaOamDataNormal[6],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaEnmakuInit,
};

const	actHeader ActEnmakuBouruHeader={
	WAZACHR_ID_BOURU,
	WAZACHR_ID_BOURU,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	W_YamanariInitSeq,
};

//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

//-------------------------------------------------------------
// offset 0:Xoffset   1:Yoffset  2:速度(下位8ﾋﾞｯﾄ少数)
//  　 　 3:移動方向(0:右方向 1:左方向)  4:終了するまでの時間
//-------------------------------------------------------------
static void SeqWazaEnmakuInit(actWork *Xreg)
{
	Xreg->x += WazaEffWork[0];
	Xreg->y += WazaEffWork[1];
	if(WazaEffWork[3] == 0)
		Xreg->work[0] = WazaEffWork[2];
	else
		Xreg->work[0] = -WazaEffWork[2];
	Xreg->work[1] = WazaEffWork[4];
	Xreg->move = SeqWazaEnmakuMain;
}

static void SeqWazaEnmakuMain(actWork *Xreg)
{
	if(Xreg->work[1] > 0)
	{
		Xreg->dx = Xreg->work[2] >> 8;
		Xreg->work[2] += Xreg->work[0];
		Xreg->banish ^= 1;
		Xreg->work[1]--;
	}
	else
		DelWazaEffect(Xreg);
}


//=========================================================================
//	煙セット	タスク
//=========================================================================
//----------------------------------------------------------
//	offset:なし
//----------------------------------------------------------
void WazaTaskSmokeSet(u8 id)
{
	s8 offsetX = 8;
	
//	if(MineEnemyCheck(AttackNo))
//		offsetX = -offsetX;
	
	MBSmokeSet(GetWazaEffPos(DefenceNo, PM_X) + offsetX, 
		GetWazaEffPos(DefenceNo, PM_Y)+8, 0);
	DelTaskEffect(id);
}















//=========================================================================
//
//		こころのめ
//												by matsuda 2002.05.13(月)
//=========================================================================
static void HikariInit(actWork *xreg);
static void HikariMain(actWork *xreg);
static void HikariEnd(actWork *xreg);
static void SyuutyuuSenInit(actWork *xreg);

#define	KOKORO_HIKARI_WAIT	90		//光がDelするまでのｳｪｲﾄ

//-- 目 --//
static const actAnm EyeAnm0[]={
	{OBJ16_32x32*0, 40, 0,0},
	{OBJ16_32x32*1, 8, 0,0},
	{OBJ16_32x32*2,	KOKORO_HIKARI_WAIT - 50, 0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const EyeAnmTbl[]={
	EyeAnm0,
};
const	actHeader EyeHeader={
	WAZACHR_ID_EYE,
	WAZACHR_ID_EYE,
	&WazaOamDataNormal[2],
	EyeAnmTbl,
	0,
	DummyActAffTbl,
	W_AnmAffWaitDel,
};

//-- 光 --//
const	actHeader HikariHeader={
	WAZACHR_ID_HIKARI,
	WAZACHR_ID_HIKARI,
	&WazaOamDataBldNormal[3],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	HikariInit,
};

//-- 集中線 --//
const	actHeader SyuutyuuHeader={
	WAZACHR_ID_SYUUTYUU,
	WAZACHR_ID_SYUUTYUU,
	&WazaOamDataAffine[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SyuutyuuSenInit,
};

//----------------------------------------------------------
//	offset: なし
//----------------------------------------------------------
static void HikariInit(actWork *xreg)
{
	xreg->work[0] = KOKORO_HIKARI_WAIT;
	xreg->move = W_WaitSeq;
	xreg->work[1] = 7;
	SetWorkSeq(xreg, HikariMain);
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = xreg->work[1] | ((16-xreg->work[1])<<8);
}

static void HikariMain(actWork *xreg)
{
	*(vu16*)REG_BLDALPHA = xreg->work[1] | ((16-xreg->work[1])<<8);
	xreg->work[1]--;
	if(xreg->work[1] < 0){
		xreg->banish = 1;
		xreg->move = HikariEnd;
	}
}

static void HikariEnd(actWork *xreg)
{
	*(vu16*)REG_BLDCNT = 0;
	*(vu16*)REG_BLDALPHA = 0;
	DelWazaEffect(xreg);
}

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:SyncNum
//----------------------------------------------------------
static void SyuutyuuSenInit(actWork *xreg)
{
	u16 kakudo;
	s16 defence_x, defence_y;
	
	defence_x = GetWazaEffPos(DefenceNo, PM_X);
	defence_y = GetWazaEffPos(DefenceNo, PM_Y);

	WazaDefaultPosSet1(xreg, PM_MODE);
	kakudo = GetKakudo2(xreg->x - defence_x, xreg->y - defence_y);
	kakudo -= 0x2000;	//絵自体が45度を向いてるので補正
	kakudo += 0x10000 / 2;	//絵柄を反転
	if(ContestCheck())		//ｺﾝﾃｽﾄの時のみの特別補正
		kakudo += 0x4000;
	KakusyukuSet(xreg, 0, 0x0100, 0x0100, kakudo);
	
	xreg->work[0] = WazaEffWork[2];
	xreg->work[2] = defence_x;
	xreg->work[4] = defence_y;
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, DelWazaEffect);
}











//=========================================================================
//
//		くろいまなざし
//												by matsuda 2002.04.29(月)
//=========================================================================
static void KuroiMeInit(actWork *xreg);
static void KuroiMeMain(actWork *xreg);
static void KuroiMeFinal(actWork *xreg);
static void KuroiMeEnd(actWork *xreg);
static void KuroiMeEndWait(actWork *xreg);
static void UneunePalAnmMain(u8 id);

#define MANAZASI_AFFLOOP	5
static const actAffAnm KuroiMeAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x180, 0x180, 0, ACT_AFSET },
//	{ -0x8, 0x4, 0, MANAZASI_AFFLOOP},
//	{0x4, -0x8, 0, MANAZASI_AFFLOOP},
	{ -0x20, 0x18, 0, MANAZASI_AFFLOOP},
	{0x18, -0x20, 0, MANAZASI_AFFLOOP},
	{ACT_AFLOOP,1,0,0},
};
static const actAffAnm KuroiMeAff1[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x30, 0x30, 0, ACT_AFSET },
	{0x20, 0x20, 0, (0x100-0x30)/0x20},
	{ACT_AFEND,0,0,0},
};
static const	actAffAnm * const KuroiMeAffTbl[] = {
	KuroiMeAff0,
	KuroiMeAff1,
};
const	actHeader ActKuroiManazasiHeader={
	WAZACHR_ID_MANAZASI,
	WAZACHR_ID_MANAZASI,
	&WazaOamDataBldAffine2[3],
	DummyActAnmTbl,
	0,
	KuroiMeAffTbl,
	KuroiMeInit,
};

//-------------------------------------------------------------
// offset なし
//-------------------------------------------------------------
#define MANAZASI_BLD_UPMAX		15
#define MANAZASI_BLD_DOWNMAX	4
#define KUROI_MANAZASI_WAIT		70
#define MANAZASI_FINAL_WAIT		10
#define MANAZASI_END_WAIT		15
#define KUROIME_DX				1
#define KUROIME_DY				1
static void KuroiMeInit(actWork *xreg)
{
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = 16 << 8;
	xreg->work[0] = 4;
	xreg->move = KuroiMeMain;
}

static void KuroiMeMain(actWork *xreg)
{
	*(vu16*)REG_BLDALPHA = ((16-xreg->work[0]) << 8) | xreg->work[0];
	if(xreg->work[1])
		xreg->work[0]--;
	else
		xreg->work[0]++;
	if(xreg->work[0] == MANAZASI_BLD_UPMAX || xreg->work[0] == MANAZASI_BLD_DOWNMAX)
		xreg->work[1] ^= 1;
	
	if(xreg->work[2]++ > KUROI_MANAZASI_WAIT){
		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDALPHA = 0;
		ActAffAnmChg(xreg, 1);
		xreg->work[2] = 0;
		xreg->banish = 1;
		xreg->aff_pause = 1;
		xreg->move = KuroiMeFinal;
	}
}

static void KuroiMeFinal(actWork *xreg)
{
	if(xreg->work[2]++ < MANAZASI_FINAL_WAIT)
		return;
	
	xreg->banish = 0;
	xreg->aff_pause = 0;
	
	if(xreg->affend_sw)
		xreg->move = KuroiMeEnd;
}

static void KuroiMeEnd(actWork *xreg)
{
	switch(xreg->work[3]){
		case 0:
		case 1:
			xreg->dx = KUROIME_DX;
			xreg->dy = 0;
			break;
		case 2:
		case 3:
			xreg->dx = -KUROIME_DX;
			xreg->dy = 0;
			break;
		case 4:
		case 5:
			xreg->dx = 0;
			xreg->dy = KUROIME_DY;
			break;
		case 6:
		default:
			xreg->dx = 0;
			xreg->dy = -KUROIME_DY;
			break;
	}
	xreg->work[3]++;
	if(xreg->work[3] > 7)
		xreg->work[3] = 0;
	if(xreg->work[4]++ > MANAZASI_END_WAIT){
		xreg->work[0] = 16;
		xreg->work[1] = 0;
		*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
		*(vu16*)REG_BLDALPHA = xreg->work[0];
		xreg->move = KuroiMeEndWait;
	}
}

static void KuroiMeEndWait(actWork *xreg)
{
	*(vu16*)REG_BLDALPHA = ((16-xreg->work[0]) << 8) | xreg->work[0];
	if(xreg->work[1]++ > 1){
		xreg->work[0]--;
		xreg->work[1] = 0;
	}
	if(xreg->work[0] == 0)
		xreg->banish = 1;
	if(xreg->work[0] < 0){
		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDALPHA = 0;
		DelWazaEffect(xreg);
	}
}


//----------------------------------------------------------
//	背景のカラーアニメ
// offset なし	//0:Delするまでのwait
//----------------------------------------------------------
#define UNE_PALANM_WAIT		3

void UneunePalAnmTask(u8 id)
{
//	TaskTable[id].work[0] = WazaEffWork[0];
	TaskTable[id].TaskAdrs = UneunePalAnmMain;
	WazaEffectCount--;	//WAIT_FLAGを途中で使用出来るようにｶｳﾝﾀｰ先にDec
}

static void UneunePalAnmMain(u8 id)
{
	u16 temp;
	int i;
	u8 palno;
	
	palno = GetHaikeiPalNo();
	if(TaskTable[id].work[5]++ == UNE_PALANM_WAIT)
	{
		temp = PaletteWorkTrans[16*palno+1+10];
		for(i = 10; i > 0; i--)
			PaletteWorkTrans[16*palno+1+i]
				 = PaletteWorkTrans[16*palno+1+i-1];
		PaletteWorkTrans[16*palno+1] = temp;
		TaskTable[id].work[5] = 0;
	}
	
//	if(TaskTable[id].work[0]-- == 0)
	if((u16)WazaEffWork[7] == 0xffff)
		//DelTaskEffect(id);
		DelTask(id);	//WazaEffectCounterは既にDecしているので普通にDelする
}

//----------------------------------------------------------
//	背景のカラーアニメ
//		PaletteWorkTransだけでなくPaletteWorkにもパレットのｽﾗｲﾄﾞをさせる
// offset なし	//0:Delするまでのwait
//----------------------------------------------------------
static void UneunePalAnmTwinMain(u8 id);

void UneunePalAnmTwinTask(u8 id)
{
//	TaskTable[id].work[0] = WazaEffWork[0];
	TaskTable[id].TaskAdrs = UneunePalAnmTwinMain;
	WazaEffectCount--;	//WAIT_FLAGを途中で使用出来るようにｶｳﾝﾀｰ先にDec
}

static void UneunePalAnmTwinMain(u8 id)
{
	u16 temp;
	int i;
	u8 palno;
	
	palno = GetHaikeiPalNo();
	if(TaskTable[id].work[5]++ == UNE_PALANM_WAIT)
	{
		temp = PaletteWorkTrans[16*palno+1+10];
		for(i = 10; i > 0; i--)
			PaletteWorkTrans[16*palno+1+i]
				 = PaletteWorkTrans[16*palno+1+i-1];
		PaletteWorkTrans[16*palno+1] = temp;

		temp = PaletteWork[16*palno+1+10];
		for(i = 10; i > 0; i--)
			PaletteWork[16*palno+1+i]
				 = PaletteWork[16*palno+1+i-1];
		PaletteWork[16*palno+1] = temp;

		TaskTable[id].work[5] = 0;
	}
	
//	if(TaskTable[id].work[0]-- == 0)
	if((u16)WazaEffWork[7] == 0xffff)
		//DelTaskEffect(id);
		DelTask(id);	//WazaEffectCounterは既にDecしているので普通にDelする
}












//=========================================================================
//
//		「まきびし」
//														by matsuda
//=========================================================================

/****************************************************

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaMakibisiInit(actWork *Xreg);
static void SeqWazaMakibisiMain(actWork *Xreg);
static void SeqWazaMakibisiEnd(actWork *Xreg);
static void SeqWazaMakibisiBaund(actWork *Xreg);
static void SeqWazaMakibisiMove(actWork *Xreg);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define MAKIBISI_FURIHABA_V	50
#define MAKIBISI_SEC_SP				4			//128を割り切れる数を指定
#define LOOP_NUM_M			(128 / MAKIBISI_SEC_SP)
#define MAKIBISI_DY			21			//Y座標着地ﾎﾟｲﾝﾄの差分
#define BAUND_FURIHABA		15
#define BAUND_SP_X			2			//64を割り切れる数を指定
#define BAUND_SP_Y			(BAUND_SP_X * 2)
#define BAUND_LOOP			(64 / BAUND_SP_X)
#define MAKIBISI_MOVE_SP				0x004a
#define MAKIBISI_MOVE_LOOP			15

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm MakibisiAnm0[]={
	{OBJ16_16x16 * 0, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm MakibisiAnm1[]={
	{OBJ16_16x16 * 1, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm *const MakibisiAnmTbl[]={
	MakibisiAnm0,
	MakibisiAnm1,
};


static const actAffAnm MakibisiAffLeft0[] = 
{
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0, 0, 2, 10},
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm MakibisiAffLeft1[] = 
{
	{ 0, 0, 6, 5},
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm MakibisiAffLeft2[] = 
{
	{ 0, 0, 3, 5},
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm MakibisiAffRight0[] = 
{
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0, 0, -2, 10},
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm MakibisiAffRight1[] = 
{
	{ 0, 0, -6, 5},
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm MakibisiAffRight2[] = 
{
	{ 0, 0, -3, 5},
	{ACT_AFLOOP,0,0,0},
};

static const	actAffAnm * const MakibisiAffTbl[] = 
{
	MakibisiAffLeft0,
	MakibisiAffRight0,
	MakibisiAffLeft1,
	MakibisiAffRight1,
	MakibisiAffLeft2,
	MakibisiAffRight2,
};

const	actHeader ActMakibisiHeader={
	WAZACHR_ID_MAKIBISI,
	WAZACHR_ID_MAKIBISI,
	&WazaOamDataAffine[1],
	DummyActAnmTbl,
	0,
	MakibisiAffTbl,
	SeqWazaMakibisiInit,
};

//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

//-------------------------------------------------------------
// offset 0:X方向へのｵﾌｾｯﾄ 1:地面に落ちたとき転がる方向(0:左 1:右)
//        2:全て終了してからDelするまでのｳｪｲﾄ  3:使用するanmNo
//-------------------------------------------------------------
static void SeqWazaMakibisiInit(actWork *Xreg)
{
	Xreg->x = GetWazaEffPos(AttackNo, PM_X);
	Xreg->y = GetWazaEffPos(AttackNo, PM_Y);
	Xreg->work[0] = LOOP_NUM_M;
	Xreg->work[1] = GetWazaEffPos(AttackNo, PM_X);
	Xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X) + WazaEffWork[0];
	Xreg->work[3] = GetWazaEffPos(AttackNo, PM_Y);
	Xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y) + MAKIBISI_DY;
	W_GetStraightMoveLoop(Xreg);

	Xreg->work[3] = 128;
	Xreg->work[4] = 0;
	Xreg->work[5] = 0;
	Xreg->work[6] = WazaEffWork[2];
	
//	ActAnmChg(Xreg, WazaEffWork[3]);
	if(WazaEffWork[1] == 0)
		ActAffAnmChg(Xreg, 0);
	else
		ActAffAnmChg(Xreg, 1);
	Xreg->work[7] = WazaEffWork[1];
//	Xreg->aff_pause = 1;
	
	Xreg->move=SeqWazaMakibisiMain;
	SeqWazaMakibisiMain(Xreg);
}

static void SeqWazaMakibisiMain(actWork *Xreg)
{
	Xreg->work[4] += Xreg->work[1];
	Xreg->dx = Xreg->work[4] >> 8;
	Xreg->work[5] += Xreg->work[2];
	Xreg->dy = Xreg->work[5] >> 8;
	
	Xreg->dy += SinMove(Xreg->work[3], MAKIBISI_FURIHABA_V);
	Xreg->work[3] = 0xff & (Xreg->work[3] + MAKIBISI_SEC_SP);
	Xreg->work[0]--;
	if(Xreg->work[0] == 0)
	{
		//Xreg->anm_pause = 0;
		if(WazaEffWork[1] == 0)
			ActAffAnmChg(Xreg, 2);
		else
			ActAffAnmChg(Xreg, 3);
		Xreg->x += Xreg->dx;
		Xreg->y += Xreg->dy;
		Xreg->dx = 0;
		Xreg->dy = 0;
		Xreg->work[0] = 0;
		Xreg->work[1] = 64;
		Xreg->work[2] = BAUND_LOOP;
		if(Xreg->work[7] == 0)
			Xreg->work[3] = -BAUND_FURIHABA;
		else
			Xreg->work[3] = BAUND_FURIHABA;

		Xreg->move = SeqWazaMakibisiBaund;
	}
}

static void SeqWazaMakibisiBaund(actWork *Xreg)
{
	if( Xreg->work[2] ) 
	{
		Xreg->dx = SinMove(Xreg->work[0], Xreg->work[3]);
		Xreg->dy = CosMove(Xreg->work[1], BAUND_FURIHABA);

		Xreg->work[0] = 0xff & (Xreg->work[0] + BAUND_SP_X);
		Xreg->work[1] = 0xff & (Xreg->work[1] + BAUND_SP_Y);

		Xreg->work[2]--;
	}
	else
	{
		if(Xreg->work[7] == 0)
		{
			ActAffAnmChg(Xreg, 4);
			Xreg->work[0] = -MAKIBISI_MOVE_SP;
		}
		else
		{
			ActAffAnmChg(Xreg, 5);
			Xreg->work[0] = MAKIBISI_MOVE_SP;
		}
		Xreg->x += Xreg->dx;
		Xreg->y += Xreg->dy;
		Xreg->dx = Xreg->dy = 0;
		Xreg->work[1] = 0;
		Xreg->work[2] = 0;
		Xreg->move = SeqWazaMakibisiMove;
	}
}

static void SeqWazaMakibisiMove(actWork *Xreg)
{
	Xreg->work[1] += Xreg->work[0];
	Xreg->dx = Xreg->work[1] >> 8;
	Xreg->work[2]++;
	if(Xreg->work[2] == MAKIBISI_MOVE_LOOP)
	{
		Xreg->move = SeqWazaMakibisiEnd;
		Xreg->aff_pause = 1;
	}
}

static void SeqWazaMakibisiEnd(actWork *Xreg)
{
	if(Xreg->work[6] == 0)
		W_AffCheckEndSeq(Xreg);
	else
		Xreg->work[6]--;
}
****************************************************/

static void MakibisiInit(actWork *xreg);
static void MakibisiMain(actWork *xreg);
static void MakibisiEndWait(actWork *xreg);

const	actHeader ActMakibisiHeader={
	WAZACHR_ID_MAKIBISI2,
	WAZACHR_ID_MAKIBISI2,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	MakibisiInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:終点Xoffset	3:終点Yoffset	4:Sync回数
//----------------------------------------------------------
#define MAKIBISI_DY		(-50)
#define MAKIBISI_DELWAIT	30
#define MAKIBISI_ENDWAIT	15

static void MakibisiInit(actWork *xreg)
{
	s16 end_x, end_y;
	
	WazaDefaultPosSet2(xreg, PM_MODE);
	GetCenterEffPos(DefenceNo, EFF_MODE, &end_x, &end_y);
	if(MineEnemyCheck(AttackNo))
		WazaEffWork[2] = -WazaEffWork[2];
	xreg->work[0] = WazaEffWork[4];
	xreg->work[2] = end_x + WazaEffWork[2];
	xreg->work[4] = end_y + WazaEffWork[3];
	xreg->work[5] = MAKIBISI_DY;
	YamanariMoveInit(xreg);
	xreg->move = MakibisiMain;
}

static void MakibisiMain(actWork *xreg)
{
	if(YamanariMoveMain(xreg))
	{
		xreg->work[0] = MAKIBISI_DELWAIT;
		xreg->work[1] = 0;
		xreg->move = W_WaitSeq;
		SetWorkSeq(xreg, MakibisiEndWait);
	}
}

static void MakibisiEndWait(actWork *xreg)
{
	if(xreg->work[1] & 1)
		xreg->banish ^= 1;
	if(xreg->work[1]++ == MAKIBISI_ENDWAIT)
		DelWazaEffect(xreg);
}

















//=========================================================================
//
//		「みやぶる」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaMiyaburuInit(actWork *Xreg);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define ANM_WAIT_MI	3

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm MiyaburuAnm0[]={
		{OBJ16_32x32*0,ANM_WAIT_MI,0,0},
		{OBJ16_32x32*1,ANM_WAIT_MI,0,0},
		{OBJ16_32x32*2,ANM_WAIT_MI,0,0},
		{OBJ16_32x32*3,ANM_WAIT_MI,0,0},
		{OBJ16_32x32*4,ANM_WAIT_MI,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm *const MiyaburuAnmTbl[]={
		MiyaburuAnm0,
};
const	actHeader ActMiyaburuHeader={
	WAZACHR_ID_FLASH,
	WAZACHR_ID_FLASH,
	&WazaOamDataNormal[2],
	MiyaburuAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaMiyaburuInit,
};


//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

//-------------------------------------------------------------
// offset 0:Xｵﾌｾｯﾄ  1:Yｵﾌｾｯﾄ
//-------------------------------------------------------------
static void SeqWazaMiyaburuInit(actWork *Xreg)
{
	EffPositionReset(Xreg);
	EffXpositionSet(Xreg, WazaEffWork[0]);
	Xreg->y += WazaEffWork[1];
	Xreg->move = W_AnmEndWait;
	SetWorkSeq(Xreg, DelWazaEffect);
}










//=========================================================================
//
//		ねごと
//														by mori	2002/06/06
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaNegotoInit(actWork *Xreg);


//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm NegotoAnm0[]={
		{OBJ16_16x16*0,3,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm *const NegotoAnmTbl[]={
		NegotoAnm0,
};

static const actAffAnm NegotoAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{-7,-7, -3,16,},
	{ 7, 7, 3,16,},
	{ACT_AFLOOP, 0, 0, 0 },
};


static const actAffAnm * const NegotoAffTbl[] = {
	NegotoAff0,
};

const	actHeader ActNegotoHeader={
	WAZACHR_ID_ZZZ2,
	WAZACHR_ID_ZZZ2,
	&WazaOamDataAffine[2],
	NegotoAnmTbl,
	0,
	NegotoAffTbl,
	SeqWazaNegotoInit,
};


//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

//-------------------------------------------------------------
// WazaEffWork [2]=X増分	[3]=Y増分
//-------------------------------------------------------------
static void SeqWazaNegotoInit(actWork *Xreg)
{
	s16	work;
	
	if(Xreg->work[0]==0){
		EffPositionReset(Xreg);
		EffXpositionSet(Xreg, WazaEffWork[0]);
		if(ContestCheck() == 0){
			if(MineEnemyCheck(AttackNo)==0){						//通常
				Xreg->work[1] = WazaEffWork[2];
				Xreg->work[2] = WazaEffWork[3];
			}else{
				Xreg->work[1] = WazaEffWork[2]*-1;
				Xreg->work[2] = WazaEffWork[3]*-1;
			}
		}else{															//コンテスト
			Xreg->work[1] = WazaEffWork[2]*-1;
			Xreg->work[2] = WazaEffWork[3];
		}
	}
	Xreg->work[0]++;
	work = (Xreg->work[0]*20)&0xff;
	Xreg->work[3] += Xreg->work[1];
	Xreg->work[4] += Xreg->work[2];
	Xreg->dx  = Xreg->work[3]/2;
	Xreg->dy  = (Xreg->work[4]/2)+SinMove(work,5);
	work = (Xreg->x+Xreg->dx);
	
	if(work <0 || work >240){
		DelWazaEffect(Xreg);
	}
}



//=========================================================================
//	ひっさつまえば
//
//														by mori 2002/06/06
//=========================================================================
#define MAEBA_WAIT  (4)

static void HissatuMaebaInit(actWork *act);

static const actAnm HissatuMaebaAnm[] =
{
	{OBJ16_32x32 * 0,  8, 0, 0},
	{OBJ16_32x32 * 1, 16, 0, 0},
	{OBJ16_32x32 * 2, 4, 0, 0},
	{OBJ16_32x32 * 3, 4, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};

static const actAnm * const HissatuMaebaAnmTbl[] = 
{
	HissatuMaebaAnm,
};


static const actAffAnm HissatuMaebaAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0x200, 0x200, 0,ACT_AFSET,},
	{ -32, -32, 0, 8  },
//	{ -32, -32, 0, 8,},
	{ACT_AFEND, 0, 0, 0 },
};


static const actAffAnm * const HissatuMaebaAffTbl[] = {
	HissatuMaebaAff0,
};


const actHeader ActHissatuMaebaHeader = {
	WAZACHR_ID_HAGATA,
	WAZACHR_ID_HAGATA,
	&WazaOamDataAffine2[2],
	HissatuMaebaAnmTbl,
	0,
	HissatuMaebaAffTbl,
	HissatuMaebaInit,
};


static void HissatuMaebaInit(actWork *act)
{
	if(act->anmend_sw){
		DelWazaEffect(act);
	}
}


// =================================================================
// TaskAttackOrDefense		[技エフェクトタスク関数]
// 概要  : 
// 引数  : id
// 戻り値: none
// =================================================================
void TaskAttackOrDefense(u8 id)
{
	if(MineEnemyCheck(DefenceNo)==SIDE_ENEMY){		//食らうのは相手
		WazaEffWork[7] = 0;				
	}else{
		WazaEffWork[7] = 1;
	}
	DelTaskEffect(id);
}

// =================================================================
// TaskDamageOrCure			[技エフェクトタスク関数]
// 概要  : 技の効果がダメージか回復か
// 引数  : id
// 戻り値: none
// =================================================================
void TaskDamageOrCure(u8 id)	
{
	if(WazaEffDamage>0){				//ダメージ
		WazaEffWork[7] = 0;
	}else{								//回復
		WazaEffWork[7] = 1;
	}
	DelTaskEffect(id);
}



//=========================================================================
//
//		アンコール
//												by matsuda 2002.06.05(水)
//=========================================================================
static void AnkooruInit(actWork *xreg);
static void AnkooruMain(actWork *xreg);
static void AnkooruEnd(actWork *xreg);

static void HakusyuInit(actWork *xreg);
static void HakusyuMain(actWork *xreg);
static void HakusyuWinObjInit(actWork *xreg);

#define ANKOORU_AFF_Y		0x0180
#define ANKOORU_AFFLOOP		20
#define ANKOORU_ADDAFF		(0x140/ANKOORU_AFFLOOP)
static const actAffAnm AnkooruAff0[] = 	//ｽﾎﾟｯﾄﾗｲﾄを開く
{
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0, ANKOORU_AFF_Y, 0, ACT_AFSET},
	{ANKOORU_ADDAFF,0,0,ANKOORU_AFFLOOP},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm AnkooruAff1[] = //ｽﾎﾟｯﾄﾗｲﾄを閉じる
{
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ANKOORU_ADDAFF*ANKOORU_AFFLOOP, ANKOORU_AFF_Y, 0, ACT_AFSET},
	{-ANKOORU_ADDAFF,0,0,ANKOORU_AFFLOOP-1},
	{ACT_AFEND,0,0,0},
};
static const	actAffAnm * const AnkooruAffTbl[] = //「おだてる」でも使用
{
	AnkooruAff0,
	AnkooruAff1,
};
const	actHeader AnkooruHeader={
	WAZACHR_ID_SPOTLIGHT,
	WAZACHR_ID_SPOTLIGHT,
	&WazaOamDataAffine2[3],
	DummyActAnmTbl,
	0,
	AnkooruAffTbl,
	AnkooruInit,
};

//-- 拍手 --//
const	actHeader HakusyuHeader={
	WAZACHR_ID_TE,
	WAZACHR_ID_TE,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	HakusyuInit,
};
//-- 拍手 WinObj版 --//
const	actHeader HakusyuWinObjHeader={
	WAZACHR_ID_TE,
	WAZACHR_ID_TE,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	HakusyuWinObjInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset
//----------------------------------------------------------
#define ANKOORU_ADD_DX	0x0075//0x0050
#define ANKOORU_ADD_SYNC	20//30
static void AnkooruInit(actWork *xreg)
{
//	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | (WIN_ALL_ON ^ WIN_BLEND_ON);
	*(vu16*)REG_WINOUT = ((WIN_ALL_ON ^ WIN_BLEND_ON)<<8) | WIN_ALL_ON;//OBJWINBLEND無効
	*(vu16*)REG_DISPCNT |= DISP_OBJWIN_ON;
	Win0H = 0;
	Win0V = 0;
	*(vu16*)REG_WIN0H = Win0H;
	*(vu16*)REG_WIN0V = Win0V;

	WazaDefaultPosSet1(xreg, EFF_MODE);
	xreg->oamData.ObjMode = 2;	//OBJｳｨﾝﾄﾞｳ
	xreg->banish = 1;	//コンテストで一瞬ぐしゃるので
	xreg->move = AnkooruMain;
}

static void AnkooruMain(actWork *xreg)
{
	switch(xreg->work[0])
	{
		case 0:
			xreg->banish = 0;
			if(xreg->affend_sw)
				xreg->work[0]++;
			break;
		case 1:
		case 3:
			xreg->work[1] += ANKOORU_ADD_DX;
			xreg->dx = xreg->work[1]>>8;
			if(xreg->work[2]++ == ANKOORU_ADD_SYNC){
				xreg->work[2] = 0;
				xreg->work[0]++;
			}
			break;
		case 2:
			xreg->work[1] -= ANKOORU_ADD_DX;
			xreg->dx = xreg->work[1]>>8;
			if(xreg->work[2]++ == ANKOORU_ADD_SYNC*2){
				xreg->work[2] = 0;
				xreg->work[0]++;
			}
			break;
		case 4:
			ActAffAnmHoldChg(xreg, 1);
			xreg->work[0]++;
			break;
		case 5:
			if(xreg->affend_sw){
				xreg->banish = 1;
				xreg->move = AnkooruEnd;
			}
			break;
	}
}

static void AnkooruEnd(actWork *xreg)
{
//	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
	*(vu16*)REG_WINOUT = (WIN_ALL_ON<<8) | WIN_ALL_ON;
	*(vu16*)REG_DISPCNT ^= DISP_OBJWIN_ON;
	DelWazaEffect(xreg);
}


//=========================================================================
//	拍手
//=========================================================================
//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:0=左手  1=右手
//	3:0=攻撃側  1=防御側	4:繰り返し回数
//----------------------------------------------------------
#define HAKUSYU_SP		2	//拍手の中心に向かう移動速度
#define HAKUSYU_DX		(HAKUSYU_SP * 6)
static void HakusyuInit(actWork *xreg)
{
	if(WazaEffWork[3] == 0){
		xreg->x = GetWazaEffPos(AttackNo, EFF_X);
		xreg->y = GetWazaEffPos(AttackNo, EFF_Y);
	}
	xreg->x += WazaEffWork[0];
	xreg->y += WazaEffWork[1];

	xreg->oamData.CharNo += 16;
	if(WazaEffWork[2] == 0){	//左手
		xreg->oamData.AffineParamNo = 0x8;	//Hflip
		xreg->dx = -HAKUSYU_DX;
		xreg->work[1] = HAKUSYU_SP;
	}
	else{						//右手
		xreg->dx = HAKUSYU_DX;
		xreg->work[1] = -HAKUSYU_SP;
	}
	
	xreg->work[0] = WazaEffWork[4];
	if(xreg->work[3] != 0xff)	//WinObjでないならデータをｾｯﾄ
		xreg->work[3] = WazaEffWork[2];
	xreg->move = HakusyuMain;
}

static void HakusyuMain(actWork *xreg)
{
	if(xreg->work[2] == 0){
		xreg->dx += xreg->work[1];
		if(xreg->dx == 0){
			xreg->work[2]++;
			if(xreg->work[3] == 0)	//左手の時だけSEを鳴らす
				//SePlayPan(SE_W227, GetWazaEffSePan(WAZA_SE_L));
				SePlayPanCh1(SE_W227, GetWazaEffSePan(WAZA_SE_L));
		}
	}
	else{
		xreg->dx -= xreg->work[1];
		if(abs(xreg->dx) == HAKUSYU_DX){
			xreg->work[0]--;
			xreg->work[2]--;
		}
	}
	
	if(xreg->work[0] == 0)
		DelWazaEffect(xreg);
}

//=========================================================================
//	拍手(WindowOBJ版)
//=========================================================================
//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:0=左手  1=右手
//	3:0=攻撃側  1=防御側	4:繰り返し回数
//----------------------------------------------------------
static void HakusyuWinObjInit(actWork *xreg)
{
	xreg->oamData.ObjMode = 2;
	xreg->work[3] = 0xff;	//WinObjの印
	HakusyuInit(xreg);
}

//=========================================================================
//	コンテストの時に順番制御アイコンにフェードがかからないようにWin2でカバーする
//=========================================================================
void ContWinCaver(u8 id)
{
	if(ContestCheck()){
		*(vu16*)REG_WININ = ((WIN_ALL_ON ^ WIN_BLEND_ON) << 8) | WIN_ALL_ON;
		Win1H = (8*19 << 8) | 240;
		Win1V = 160;
		*(vu16*)REG_WIN1H = Win0H;
		*(vu16*)REG_WIN1V = Win0V;
	}
	DelTaskEffect(id);
}

//----------------------------------------------------------
//	カバーしてたウィンドウを初期化する
//----------------------------------------------------------
void ContWinClose(u8 id)
{
	if(ContestCheck()){
		*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
		Win1H = 0;
		Win1V = 0;
	}
	DelTaskEffect(id);
}












//=========================================================================
//
//		「こうそくスピン」
//																TAYA
//=========================================================================
#define SPIN_ANM_WAIT (2)

//==============================================
//	スピンのたつまきアクター
//	0:(0:攻撃側  1:防御側)  
//	1:Xofs  2:Yofs(始点)  3:Yofs(終点)
//	4:横移動速度  5:縦移動速度
//==============================================
static void SpinActMove(actWork *act);

static void SpinActInit(actWork *act)
{
	if(WazaEffWork[0] == 0){
		act->x = GetWazaEffPos(AttackNo, EFF_X) + WazaEffWork[1];
		act->y = GetWazaEffPos(AttackNo, EFF_Y);
	}else{
		act->x = GetWazaEffPos(DefenceNo, EFF_X) + WazaEffWork[1];
		act->y = GetWazaEffPos(DefenceNo, EFF_Y);
	}

	act->dy = WazaEffWork[2];

	act->work[0] = (WazaEffWork[2] > WazaEffWork[3]);
	act->work[1] = 0;
	act->work[2] = WazaEffWork[4];
	act->work[3] = WazaEffWork[5];
	act->work[4] = WazaEffWork[3];

	act->move = SpinActMove;
}

static void SpinActMove(actWork *act)
{
	act->work[1] += act->work[2];
	act->work[1] &= 0xff;
	act->dx = (sin_cos_table[act->work[1]]) >> 4;

	act->dy += act->work[3];
	if(act->work[0]){
		if(act->dy < act->work[4]){
			DelWazaEffect(act);
		}
	}else{
		if(act->dy > act->work[4]){
			DelWazaEffect(act);
		}
	}
}

static const actAnm SpinAnm[]={
	{OBJ16_32x16*0,SPIN_ANM_WAIT,0,0},
	{OBJ16_32x16*1,SPIN_ANM_WAIT,0,0},
	{OBJ16_32x16*2,SPIN_ANM_WAIT,0,0},
	{ACT_ANMLOOP, 0, 0, 0 },
};
static const actAnm *const SpinAnmTbl[]={
	SpinAnm,
};
const	actHeader ActSpinHeader={
	WAZACHR_ID_SPIN,
	WAZACHR_ID_SPIN,
	&WazaOamDataNormal[6],
	SpinAnmTbl,
	0,
	DummyActAffTbl,
	SpinActInit,
};

//==============================================
//	ポケモンが徐々に消えるor現れるタスク（要ＢＧ化）
//	0:(0:攻撃側  1:防御側)  1:速度
//	2:(0:消える  1:現れる)
//==============================================
static void TaskSpinMain(u8 id);

void TaskSpin(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	LasterData  LD;
	s16 i, ypos, ofs_ini;
	u8  bgno;

	if(WazaEffWork[0] == 0){
		ypos = GetPokeShadowYPos(AttackNo);
		bgno = GetPokeBGNo(AttackNo);
	}else{
		ypos = GetPokeShadowYPos(DefenceNo);
		bgno = GetPokeBGNo(DefenceNo);
	}
	my->work[0] = ypos + 36;    // 0:点滅ライン
	my->work[1] = my->work[0];  // 1:消去ライン
	my->work[2] = ypos - 33;    // 2:ライン上端
	if(my->work[2] < 0){
		my->work[2] = 0;
	}
	my->work[3] = my->work[0];    // 3:ライン下端
	my->work[4] = 8;              // 4:消去ライン始動wait
	my->work[5] = WazaEffWork[1]; // 5:ライン上昇速度
	my->work[6] = 0;              // 6:点滅ｶｳﾝﾀ
	my->work[7] = 0;              // 7:点滅ﾌﾗｸﾞ

	my->work[8] = (bgno==1)? ScrX1 : ScrX2;  // 8:出現ラインのｵﾌｾｯﾄ
	my->work[9] = my->work[8]+240;           // 9:消去ラインのｵﾌｾｯﾄ

	my->work[10] = WazaEffWork[2]; // 10:消去・出現ﾌﾗｸﾞ
	if(WazaEffWork[2] == 0){
		my->work[11] = my->work[9];  // 11: 消去ライン以下のｵﾌｾｯﾄ
		ofs_ini = my->work[8];
	}else{
		my->work[11] = my->work[8];
		ofs_ini = my->work[9];
	}

	my->work[15] = 0;  // 15:終了ﾌﾗｸﾞ

	for(i = my->work[2]; i <= my->work[3]; i++)
	{
		LasterBuffer[0][i] = ofs_ini;
		LasterBuffer[1][i] = ofs_ini;
	}

	LD.DestAdrs = (bgno==1)? (void*)REG_BG1HOFS : (void*)REG_BG2HOFS;

	LD.DMAControl = H_DMA_ENABLE16;
	LD.TransType = LASTER_NORMAL;
	LD.LoopCount = 0;
	LasterDmaSet(LD);

	my->TaskAdrs = TaskSpinMain;
}
static void TaskSpinMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	s16 i;


	my->work[0] -= my->work[5];
	if(my->work[0] < my->work[2])
	{
		my->work[0] = my->work[2];
	}
	if(my->work[4] == 0)
	{
		my->work[1] -= my->work[5];
		if(my->work[1] < my->work[2])
		{
			my->work[1] = my->work[2];
			my->work[15] = 1;
		}
	}
	else
	{
		my->work[4]--;
	}

	if(++(my->work[6]) > 1)
	{
		my->work[6] = 0;
		my->work[7] = !(my->work[7]);
		my->work[12] = (my->work[7])?  my->work[8] : my->work[9];
	}
	for(i = my->work[0]; i < my->work[1]; i++)
	{
		LasterBuffer[0][i] = my->work[12];
		LasterBuffer[1][i] = my->work[12];
	}
	for(i = my->work[1]; i <= my->work[3]; i++)
	{
		LasterBuffer[0][i] = my->work[11];
		LasterBuffer[1][i] = my->work[11];
	}

	if(my->work[15])
	{
		if(my->work[10]){
			LasterSys.TransType=LASTER_END;
		}
		DelTaskEffect(id);
	}
}












//=========================================================================
//
//		「いちゃもん」
//																TAYA
//=========================================================================
#define ICHAMON_FUKIDASI_MAX  (6)
#define ICHAMON_AFF_SYNC  (4)
static const actAffAnm IchamonAffAnm[] = {
	{ -0x0c,  0x08, 0, ICHAMON_AFF_SYNC },
	{  0x14, -0x14, 0, ICHAMON_AFF_SYNC },
	{ -0x08,  0x0c, 0, ICHAMON_AFF_SYNC },
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
extern const actHeader ActFukidashiHeader;

static void TaskIchamonMain(u8 id);
static void IchamonFukidasiMove(actWork *act);
extern void SePlayPan( u16 no, s8 pan );

void TaskIchamon(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = 0;  // 0:ｼｰｹﾝｽ
	my->work[1] = 0;  // 1:ﾌｷﾀﾞｼ数
	my->work[2] = GetWazaEffPos(AttackNo, PM_X);  // 2:
	my->work[3] = GetWazaEffPos(AttackNo, PM_Y);  // 3:
	my->work[4] =  32;  // 4:ﾌｷﾀﾞｼ Xofs
	my->work[5] = -20;  // 5:ﾌｷﾀﾞｼ Yofs
	my->work[6] = 0;    // 6:ｶｳﾝﾀ

	my->work[15] = W_GetPokeActNo(0); // 15:ﾎﾟｹﾓﾝｱｸﾀｰ

	my->TaskAdrs = TaskIchamonMain;
}

static void TaskIchamonMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		{
			u8  act_no;
			s16 x, y;

			x = my->work[2] + ((my->work[1] & 1)? -(my->work[4]) : my->work[4]);
			y = my->work[3] + my->work[5];
			act_no = AddActor(&ActFukidashiHeader, x, y, ICHAMON_FUKIDASI_MAX-my->work[1]);
			SePlayPan(SE_W118, GetWazaEffSePan(WAZA_SE_L));
			if(act_no != ACT_MAX)
			{
				ActWork[act_no].Hflip = (my->work[1] & 1);
				ActWork[act_no].move = DummyActMove;
			}
			if(my->work[1] & 1)
			{
				my->work[4] -= 6;
				my->work[5] -= 6;
			}

			SetPokeKakusyukuAnm(my, my->work[15], IchamonAffAnm);

			my->work[1]++;
			my->work[0] = 1;
		}
		break;

	case 1:
		if(!PokeKakusyukuAnm(my))
		{
			if(my->work[1] == ICHAMON_FUKIDASI_MAX){
				my->work[6] = 8;
				my->work[0] = 3;
			}else{
				if(my->work[1] <= 2){
					my->work[6] = 10;
				}else{
					my->work[6] = 0;
				}
				my->work[0] = 2;
			}
		}
		break;

	case 2:
		if(my->work[6]){
			my->work[6]--;
		}else{
			my->work[0] = 0;
		}
		break;

	// ------------------------------------------

	case 3:
		if(my->work[6]){
			my->work[6]--;
		}else{
			my->work[0] = 4;
		}
		break;

	case 4:
		{
			u16 i, c;

			for(i = 0, c = 0; i < ACT_MAX; i++)
			{
				if(ActWork[i].actHead == &ActFukidashiHeader)
				{
					ActWork[i].work[0] = id;  // 0:ﾀｽｸﾅﾝﾊﾞｰ
					ActWork[i].work[1] = 6;   // 1:ｶｳﾝﾀﾜｰｸﾅﾝﾊﾞｰ
					ActAnmChg(&ActWork[i], 2);
					ActWork[i].move = IchamonFukidasiMove;
					if(++c == ICHAMON_FUKIDASI_MAX)
					{
						break;
					}
				}
			}
			my->work[6] = c;
			my->work[0] = 5;
		}
		break;

	case 5:
		if(my->work[6] == 0){
			DelTaskEffect(id);
		}
		break;
	}

}
static void IchamonFukidasiMove(actWork *act)
{
	if(act->anmend_sw){
		TaskTable[act->work[0]].work[act->work[1]]--;
		DelActor(act);
	}
}





//=========================================================================
//	トライアタック
//
//														by mori 2002/06/07
//=========================================================================

static void TriAttackInit(actWork *act);

static const actAnm TriAttackAnm[] =
{
	{OBJ16_64x64 * 0,  8, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};

static const actAnm * const TriAttackAnmTbl[] = 
{
	TriAttackAnm,
};


static const actAffAnm TriAttackAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{  0,  0, 5, 40  },
	{  0,  0, 10, 10,},
	{  0,  0, 15, 10,},
	{  0,  0, 20, 40  },
	{ACT_AFLOOP, 0, 0, 0 },
};


static const actAffAnm * const TriAttackAffTbl[] = {
	TriAttackAff0,
};


const actHeader ActTriAttackHeader = {
	WAZACHR_ID_TRI,
	WAZACHR_ID_TRI,
	&WazaOamDataAffine2[3],
	TriAttackAnmTbl,
	0,
	TriAttackAffTbl,
	TriAttackInit,
};

static void TriAttackInit(actWork *act)
{
	if(act->work[0]==0){
		WazaDefaultPosSet2(act,EFF_MODE);
	}
	act->work[0]++;
	
	if(act->work[0]<40){
		if(act->work[0]%2==0) 	act->banish = 1;
		else					act->banish = 0;
	}

	if(act->work[0]>30) act->banish = 0;
	
	if(act->work[0]==61){
		SetWorkSeq(act, DelWazaEffect);
		act->x = act->x + act->dx;
		act->y = act->y + act->dy;
		act->dx = 0;
		act->dy = 0;
		act->work[0] = 20;
		act->work[2] = GetWazaEffPos(DefenceNo, PM_X);
		act->work[4] = GetWazaEffPos(DefenceNo, PM_Y);
		act->move = W_StraightSyncMove;
	}

}












//=========================================================================
//
//		まるくなる
//												by matsuda 2002.06.08(土)
//=========================================================================
#define MARUMARU_ANMWAIT	3
static const actAnm MarumaruAnm[]={
	{OBJ16_32x32*0,MARUMARU_ANMWAIT,0,0},
	{OBJ16_32x32*1,MARUMARU_ANMWAIT,0,0},
	{OBJ16_32x32*2,MARUMARU_ANMWAIT,0,0},
	{OBJ16_32x32*3,MARUMARU_ANMWAIT,0,0},
	{OBJ16_32x32*2,MARUMARU_ANMWAIT,1,0},
	{OBJ16_32x32*1,MARUMARU_ANMWAIT,1,0},
	{OBJ16_32x32*0,MARUMARU_ANMWAIT,1,0},
	{ACT_ANMcLOOP, 1, 0, 0 },
	{ACT_ANMEND, 0, 0, 0 },
};
static const actAnm *const MarumaruAnmTbl[]={
	MarumaruAnm,
};
const	actHeader MarumaruHeader={
	WAZACHR_ID_MARUMARU,
	WAZACHR_ID_MARUMARU,
	&WazaOamDataNormal[2],
	MarumaruAnmTbl,
	0,
	DummyActAffTbl,
	W_AnmAffWaitDel,
};


//----------------------------------------------------------
//	「まるくなる」
//	ポケモンを拡縮で動きをつける
// offset	なし
//----------------------------------------------------------
static const actAffAnm MarukuAff[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{-12, 20, 0, 8},
	{12, -20, 0, 8},
	{ACT_AFcLOOP,2, 0,0},
	{ACT_AFEND,0,0,0},
};
void MarukunaruTask(u8 id)
{
	switch(TaskTable[id].work[0]){
		case 0:
			SetPokeKakusyukuAnm(&TaskTable[id], W_GetPokeActNo(0), MarukuAff);
			TaskTable[id].work[0]++;
			break;
		case 1:
			if(!PokeKakusyukuAnm(&TaskTable[id]))
				DelTaskEffect(id);
			break;
	}
}















//=========================================================================
//
//		バトンタッチ
//												by matsuda 2002.06.08(土)
//=========================================================================
static void BatonTattiInit(actWork *xreg);

const	actHeader BatonTattiHeader={
	WAZACHR_ID_MONSBALL,
	WAZACHR_ID_MONSBALL,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	BatonTattiInit,
};

//----------------------------------------------------------
//	offset	なし
//----------------------------------------------------------
#define BATON_AFFLOOP	8
#define BATON_AFFHALF	4
#define BATON_AFF_X		0x60
#define BATON_AFF_Y		(-0x1A)	//(-0xd)
#define BATON_AFF_Y2	(0x30)
#define BATON_AFFWAIT	4
#define BATON_ADD_DY	6
static void BatonTattiInit(actWork *xreg)
{
	u8 poke;
	
	poke = W_GetPokeActNo(0);
	switch(xreg->work[0]){
	case 0:
		xreg->x = GetWazaEffPos(AttackNo, PM_X);
		xreg->y = GetWazaEffPos(AttackNo, PM_Y);
		PokeKakusyukuInit(poke, 0);
		xreg->work[1] = 0x100;	//x
		xreg->work[2] = 0x100;	//y
		xreg->work[0]++;
		break;
	case 1:
		xreg->work[1] += BATON_AFF_X;
		xreg->work[2] += BATON_AFF_Y;
		PokeKakusyukuSet(poke, xreg->work[1], xreg->work[2], 0);
		if(xreg->work[3]++ == BATON_AFFHALF){
			xreg->work[0]++;
		}
	case 2:
		xreg->work[1] += BATON_AFF_X;
		xreg->work[2] += BATON_AFF_Y2;
		PokeKakusyukuSet(poke, xreg->work[1], xreg->work[2], 0);
		if(xreg->work[3]++ == BATON_AFFLOOP){
			xreg->work[3] = 0;
			ActWork[poke].banish = 1;
			PokeKakusyukuEnd(poke);
			xreg->work[0]++;
		}
		break;
	case 3:
		xreg->dy -= BATON_ADD_DY;
		if(xreg->y + xreg->dy < -32)
			DelWazaEffect(xreg);
		break;
	default:
		break;
	}
}










//=========================================================================
//
//		ねがいごと
//												by matsuda 2002.06.08(土)
//=========================================================================
static void NegaigotoSippoInit(actWork *xreg);
static void NegaigotoSippoMain(actWork *xreg);
static void NegaigotoInit(actWork *xreg);
static void NegaigotoMain(actWork *xreg);

const	actHeader NegaigotoHeader={		//レアエフェクトでも使用
	WAZACHR_ID_SHOOTINGSTAR,
	WAZACHR_ID_SHOOTINGSTAR,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	NegaigotoInit,
};

//-- しっぽ部分 --//
const	actHeader NegaigotoSippoHeader={	//レアエフェクトでも使用
	WAZACHR_ID_SHOOTINGSTAR,
	WAZACHR_ID_SHOOTINGSTAR,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	NegaigotoSippoInit,
};

//----------------------------------------------------------
//	offset	なし
//----------------------------------------------------------
#define NEGAIGOTO_SP_X		0x0048	//下位4ビット少数
#define NEGAIGOTO_SP_Y		0x0010	//下位8ビット少数
static void NegaigotoInit(actWork *xreg)
{
	if(MineEnemyCheck(AttackNo))
		xreg->x = -16;
	else
		xreg->x = 240+16;
	xreg->y = 0;
	xreg->move = NegaigotoMain;
}

static void NegaigotoMain(actWork *xreg)
{
	xreg->work[0] += NEGAIGOTO_SP_X;
	if(MineEnemyCheck(AttackNo))
		xreg->dx = xreg->work[0]>>4;
	else
		xreg->dx = - (xreg->work[0]>>4);
	xreg->work[1] += NEGAIGOTO_SP_Y;
	xreg->dy += xreg->work[1]>>8;
	
	if(++xreg->work[2] % 3 == 0)
		AddActorJump(&NegaigotoSippoHeader, xreg->x+xreg->dx, xreg->y+xreg->dy, xreg->pri+1);
	
	if(xreg->x+xreg->dx > 240+32 || xreg->x+xreg->dx < -32)
		DelWazaEffect(xreg);
}

//----------------------------------------------------------
//	しっぽ部分
//----------------------------------------------------------
#define NEGAI_SIPPO_WAIT	30
#define NEGAI_SIPPO_ENDWAIT	60
static void NegaigotoSippoInit(actWork *xreg)
{
	u8 anmno;
	s8 yoffset;
	
	anmno = pp_rand() & 3;
	if(anmno == 0)
		xreg->oamData.CharNo += 4;
	else
		xreg->oamData.CharNo += 5;
	yoffset = pp_rand() & 0x7;
	if(yoffset > 3)
		yoffset = -yoffset;
	xreg->dy = yoffset;
	xreg->move = NegaigotoSippoMain;
}

static void NegaigotoSippoMain(actWork *xreg)
{
	if(++xreg->work[0] < NEGAI_SIPPO_WAIT)
	{
		if(xreg->work[1]++ == 1){
			xreg->banish ^= 1;
			xreg->work[1] = 0;
		}
	}
	else{
		if(xreg->work[1] == 2)
			xreg->banish = 0;
		if(xreg->work[1] == 3){
			xreg->banish = 1;
			xreg->work[1] = -1;
		}
		xreg->work[1]++;
	}
	
	if(xreg->work[0] > NEGAI_SIPPO_ENDWAIT)
		DelActor(xreg);
}












//=========================================================================
//
//		たくわえる
//												by matsuda 2002.06.10(月)
//=========================================================================
//----------------------------------------------------------
//		「たくわえる」を行った時のﾎﾟｹﾓﾝの動き
//	offset なし
//----------------------------------------------------------
#define TAKUWAERU_AFFWAIT	12
#define TAKUWAERU_AFF		8
static const actAffAnm TakuwaeruPokeAff[] = {
	{TAKUWAERU_AFF, -TAKUWAERU_AFF, 0, TAKUWAERU_AFFWAIT},
	{-TAKUWAERU_AFF*2, TAKUWAERU_AFF*2, 0, TAKUWAERU_AFFWAIT},
	{TAKUWAERU_AFF, -TAKUWAERU_AFF, 0, TAKUWAERU_AFFWAIT},
	{ACT_AFcLOOP, 1,0,0},
	{ACT_AFEND,0,0,0},
};

void TakuwaeruTask(u8 id)
{
	if(TaskTable[id].work[0] == 0){
		SetPokeKakusyukuAnm(&TaskTable[id], W_GetPokeActNo(0), TakuwaeruPokeAff);
		TaskTable[id].work[0]++;
	}
	else{
		if(PokeKakusyukuAnm(&TaskTable[id]) == 0)
			DelTaskEffect(id);
	}
}











//=========================================================================
//
//		はきだす
//												by matsuda 2002.06.10(月)
//=========================================================================
//----------------------------------------------------------
//	offset なし
//----------------------------------------------------------
#define HAKIDASU_AFFY	6
#define HAKIDASU_AFFLOOP	20
#define HAKIDASU_BAI	3	//しゃがんだ時の何倍の速度で でかくなるか
#define HAKIDASU_BAILOOP	3
static const actAffAnm HakidasuPokeAff[] = {
	{0, HAKIDASU_AFFY, 0, HAKIDASU_AFFLOOP},
	{0,0,0,20},
	{0, -HAKIDASU_AFFY*HAKIDASU_BAI, 0, HAKIDASU_AFFLOOP/HAKIDASU_BAI},	//元のｻｲｽﾞに戻す
	{-HAKIDASU_AFFY*HAKIDASU_BAI, -HAKIDASU_AFFY*HAKIDASU_BAI, 0, HAKIDASU_BAILOOP},
	{0,0,0,15},
	{4,4, 0, HAKIDASU_AFFY*HAKIDASU_BAI*HAKIDASU_BAILOOP/4},
	{ACT_AFEND,0,0,0},
};

void HakidasuTask(u8 id)
{
	if(TaskTable[id].work[0] == 0){
		SetPokeKakusyukuAnm(&TaskTable[id], W_GetPokeActNo(0), HakidasuPokeAff);
		TaskTable[id].work[0]++;
	}
	else{
		if(PokeKakusyukuAnm(&TaskTable[id]) == 0)
			DelTaskEffect(id);
	}
}













//=========================================================================
//
//		のみこむ
//												by matsuda 2002.06.11(火)
//=========================================================================
static void NomikomuInit(actWork *xreg);

const	actHeader NomikomuHeader={
	WAZACHR_ID_NOMIKOMU,
	WAZACHR_ID_NOMIKOMU,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	NomikomuInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset
//----------------------------------------------------------
#define NOMIKOMU_BALL_SP	0x0900
#define NOMIKOMU_JYUURYOKU	0x0060
static void NomikomuInit(actWork *xreg)
{
	switch(xreg->work[0]){
		case 0:
			WazaDefaultPosSet2(xreg, EFF_MODE);
			xreg->work[1] = NOMIKOMU_BALL_SP;
			xreg->work[2] = GetWazaEffPos(AttackNo,PM_Y);	//add_02.08.27_iwa
			xreg->work[0]++;
			break;
		case 1:
			xreg->dy -= xreg->work[1] >> 8;
			xreg->work[1] -= NOMIKOMU_JYUURYOKU;
//			if(xreg->y+xreg->dy > GetWazaEffPos(AttackNo,EFF_Y)+32)
			if(xreg->y+xreg->dy > xreg->work[2])
				DelWazaEffect(xreg);
			break;
	}
}

//----------------------------------------------------------
//		「のみこむ」動作の時のﾎﾟｹﾓﾝの動き
//	offset なし
//----------------------------------------------------------
#define NOMIKOMU_AFFY	6
#define NOMIKOMU_AFFLOOP	20
#define NOMIKOMU_UP_AFFX	7
#define NOMIKOMU_UP_AFFY	30
#define NOMIKOMU_UP_AFFLOOP	6
#define NOMIKOMU_RET_LOOP	20
#define NOMIKOMU_RET_AFFY	((NOMIKOMU_UP_AFFY*NOMIKOMU_UP_AFFLOOP - NOMIKOMU_AFFY*NOMIKOMU_AFFLOOP) / NOMIKOMU_RET_LOOP)
#define NOMIKOMU_RET_AFFX	(NOMIKOMU_UP_AFFX*NOMIKOMU_UP_AFFLOOP / NOMIKOMU_RET_LOOP)
static const actAffAnm NomikomuPokeAff[] = {
	{0, NOMIKOMU_AFFY, 0, NOMIKOMU_AFFLOOP},
	{0,0,0,20},
	{NOMIKOMU_UP_AFFX,-NOMIKOMU_UP_AFFY,0,NOMIKOMU_UP_AFFLOOP},
	{0,0,0,20},
	{-NOMIKOMU_RET_AFFX,NOMIKOMU_RET_AFFY,0,NOMIKOMU_RET_LOOP},
	{ACT_AFEND,0,0,0},
};

void NomikomuTask(u8 id)
{
	if(TaskTable[id].work[0] == 0){
		SetPokeKakusyukuAnm(&TaskTable[id], W_GetPokeActNo(0), NomikomuPokeAff);
		TaskTable[id].work[0]++;
	}
	else{
		if(PokeKakusyukuAnm(&TaskTable[id]) == 0)
			DelTaskEffect(id);
	}
}
















//=========================================================================
//
//		へんしん
//												by matsuda 2002.06.11(火)
//=========================================================================
//----------------------------------------------------------
//	モザイク化
// offset 0: 0=技ｴﾌｪｸﾄの変身	1=変化(お天気ﾎﾟｹﾓﾝの姿変更など)
//----------------------------------------------------------
#define HENSIN_MOSAIC_WAIT	2
void HensinMosaic(u8 id)
{
	u16 mosaic;
	WazaBgData wazabg;
	u8 client_type;
	u16 *scrn;
	int x, y, ypos;
	u16 temp;

	switch(TaskTable[id].work[0]){
		case 0:
			*(vu16*)REG_MOSAIC = 0;
			if(GetPokeBGNo(AttackNo) == 1)
				(*(vBgCnt *)REG_BG1CNT).Mosaic = 1;
			else
				(*(vBgCnt *)REG_BG2CNT).Mosaic = 1;
			TaskTable[id].work[10] = WazaEffWork[0];
			TaskTable[id].work[0]++;
			break;
		case 1:
			if(TaskTable[id].work[2]++ < HENSIN_MOSAIC_WAIT)
				break;
			TaskTable[id].work[2] = 0;
			TaskTable[id].work[1]++;
			mosaic = TaskTable[id].work[1];
			*(vu16*)REG_MOSAIC = (mosaic<<4) | mosaic;
			if(mosaic == 15)
				TaskTable[id].work[0]++;
			break;
		case 2:
			// 相手ｷｬﾗにｷｬﾗを差し替え  ｺﾝﾃｽﾄの場合はｷｬﾗ差し替えなし
			if(1){	//ContestCheck() == 0){
				HensinChrChange(AttackNo, DefenceNo, TaskTable[id].work[10]);
				GetWazaEffBgAdrs2(&wazabg, AttackNo);
//				DIV_DMACOPY(3, 
//					OBJ_MODE0_VRAM + ActWork[W_GetPokeActNo(0)].oamData.CharNo*32, 
//					wazabg.CharAdrs, 0x0800,32);
//				changed by soga 2002.07.05
				if(ContestCheck())
					client_type = CONT_POKEDECORD_NO;
				else
					client_type = ClientTypeGet(AttackNo);
				DIV_DMACOPY(3, 
					DecordAdrs[client_type]+0x800
					*BattlePokeAnmNo[AttackNo], 
					wazabg.CharAdrs, 0x0800,32);
					
				if(ContestCheck()){	//ｽｸﾘｰﾝﾃﾞｰﾀの反転
					if(ContestPokeFlipCheck(conpara->monsno) !=
						ContestPokeFlipCheck(conpara->hensin_monsno))
					{
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
					if(ContestPokeFlipCheck(conpara->hensin_monsno))
						ActWork[PokemonStruct[AttackNo]].aff_tbl= PmAffAnmTblF2;
					else
						ActWork[PokemonStruct[AttackNo]].aff_tbl = PmAffAnmTblF;
					ActAffAnmChg(&ActWork[PokemonStruct[AttackNo]], 0);
				}
			}
			TaskTable[id].work[0]++;
			break;
		case 3:
			if(TaskTable[id].work[2]++ < HENSIN_MOSAIC_WAIT)
				break;
			TaskTable[id].work[2] = 0;
			TaskTable[id].work[1]--;
			mosaic = TaskTable[id].work[1];
			*(vu16*)REG_MOSAIC = (mosaic<<4) | mosaic;
			if(mosaic == 0)
				TaskTable[id].work[0]++;
			break;
		case 4:
			*(vu16*)REG_MOSAIC = 0;
			if(GetPokeBGNo(AttackNo) == 1)
				(*(vBgCnt *)REG_BG1CNT).Mosaic = 0;
			else
				(*(vBgCnt *)REG_BG2CNT).Mosaic = 0;
			
			//影ﾁｪｯｸ
			if(ContestCheck() == 0 && MineEnemyCheck(AttackNo) == SIDE_ENEMY && TaskTable[id].work[10] == 0)
				PokeShadowSeqSet(AttackNo, Climem[AttackNo].hensin_monsno);
			
			DelTaskEffect(id);
			break;
	}
}

//=========================================================================
//	変化のみのシーケンス
//=========================================================================
//----------------------------------------------------------
//	ポケモンのﾊﾞﾆｯｼｭ状況をチェック
//	ﾊﾞﾆｯｼｭされている時はWazaEffWork[7]に１がｾｯﾄされる
//----------------------------------------------------------
void HengeBanishChk(u8 id)
{
	WazaEffWork[7] = ActWork[PokemonStruct[AttackNo]].banish;
	DelTaskEffect(id);
}

//----------------------------------------------------------
//	変化時のｷｬﾗ転送		west.sから呼ばれます
//----------------------------------------------------------
void WestHengeChrTrans(u8 id)
{
	HensinChrChange(AttackNo, DefenceNo, 1);
	DelTaskEffect(id);
}















//=========================================================================
//
//		あさのひざし
//												by matsuda 2002.06.12(水)
//=========================================================================
enum{
	HIZASI_INIT = 0,
	HIZASI_BLDUP,
	HIZASI_BLDDOWN,
	HIZASI_NEXTWAIT,
	HIZASI_END,
};
//----------------------------------------------------------
//	offset なし
//----------------------------------------------------------
#define HIZASI_ADD_BLD	1
#define HIZASI_BLD_MAX	12
#define HIZASI_NEXTWAIT_SYNC	3
#define HIZASI_OFFSET_TBLMAX	3	//HizasiOffsetXのテーブル数
#define HIZASI_BLD_WAIT		1
static const s8 HizasiOffsetX[] = {-24,24,-4};

void AsanoHizasiTask(u8 id)
{
	WazaBgData wazabg;

	switch(TaskTable[id].work[0]){
		case HIZASI_INIT:
			*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL | BLD_BG1_1ST;
			*(vu16*)REG_BLDALPHA = 16 << 8;

			(*(vBgCnt *)REG_BG1CNT).Size = 0;
			(*(vBgCnt *)REG_BG1CNT).Priority = 1;
	
			if(ContestCheck() == 0)//ｴﾌｪｸﾄの間だけｷｬﾗｸﾀﾍﾞｰｽを変更(ｽｸﾘｰﾝﾃﾞｰﾀの関係で)
				(*(vBgCnt *)REG_BG1CNT).CharBasep = 1;
			
			GetWazaEffBgAdrs(&wazabg);
			DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x1000, 32);
			DecordVram((void*)hizashi_psc_ADRS, wazabg.ScrnAdrs);
			DecordVram((void*)s_hizashi_pch_ADRS, wazabg.CharAdrs);
			DecordPaletteWork((void*)s_hizashi_pcl_ADRS, wazabg.PlttNo*16, 0x20);
			
			//PokePriAllSet(2);	//日差しの下にくるようにﾌﾟﾗｲｵﾘﾃｨを下げる
			if(ContestCheck()){
				ScrnPalRewrite(wazabg.PlttNo, (u32)wazabg.ScrnAdrs, 0, 0);
				ScrX1 = -56;
				ScrY1 = 0;
			}
			else{
				if(MineEnemyCheck(AttackNo))
					ScrX1 = -135;
				else
					ScrX1 = -10;
				ScrY1 = 0;
			}
			TaskTable[id].work[10] = ScrX1;
			TaskTable[id].work[11] = ScrY1;
			TaskTable[id].work[0]++;
			SePlayPan(SE_W234, GetWazaEffSePan(WAZA_SE_L));
			break;
		case HIZASI_BLDUP:
			if(TaskTable[id].work[4]++ < HIZASI_BLD_WAIT)
				break;
			TaskTable[id].work[4] = 0;
			TaskTable[id].work[1] += HIZASI_ADD_BLD;
			if(TaskTable[id].work[1] > HIZASI_BLD_MAX)
				TaskTable[id].work[1] = HIZASI_BLD_MAX;
			*(vu16*)REG_BLDALPHA = 
				((16-TaskTable[id].work[1])<<8) | TaskTable[id].work[1];
			if(TaskTable[id].work[1] == HIZASI_BLD_MAX)
				TaskTable[id].work[0]++;
			break;
		case HIZASI_BLDDOWN:
			TaskTable[id].work[1] -= HIZASI_ADD_BLD;
			if(TaskTable[id].work[1] < 0)
				TaskTable[id].work[1] = 0;
			*(vu16*)REG_BLDALPHA = 
				((16-TaskTable[id].work[1])<<8) | TaskTable[id].work[1];
			if(TaskTable[id].work[1] == 0){
				ScrX1 = TaskTable[id].work[10] + HizasiOffsetX[TaskTable[id].work[2]];
				if(TaskTable[id].work[2]++ == HIZASI_OFFSET_TBLMAX)
					TaskTable[id].work[0] = HIZASI_END;
				else
					//TaskTable[id].work[0] = HIZASI_BLDUP;
					TaskTable[id].work[0] = HIZASI_NEXTWAIT;
			}
			break;
		case HIZASI_NEXTWAIT:
			if(TaskTable[id].work[3]++ == HIZASI_NEXTWAIT_SYNC){
				TaskTable[id].work[3] = 0;
				TaskTable[id].work[0] = HIZASI_BLDUP;
				SePlayPan(SE_W234, GetWazaEffSePan(WAZA_SE_L));
			}
			break;
		case HIZASI_END:
			GetWazaEffBgAdrs(&wazabg);
			DIV_DMACLEAR(3, 0, wazabg.CharAdrs, 0x2000, 32);
			DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
			if(ContestCheck() == 0)
				(*(vBgCnt *)REG_BG1CNT).CharBasep = 0;
			(*(vBgCnt *)REG_BG1CNT).Priority = EFF_BG1_PRI;
//			ActWork[PokemonStruct[AttackNo]].oamData.Priority = 1;
			ScrX1 = 0;
			ScrY1 = 0;
			*(vu16*)REG_BLDCNT = 0;
			*(vu16*)REG_BLDALPHA = 0;
			//PokePriAllSet(1);	//ﾌﾟﾗｲｵﾘﾃｨを元に戻す
			DelTaskEffect(id);
			break;
	}
}


//=========================================================================
//	上昇するキラキラ
//=========================================================================
static void AsakiraInit(actWork *xreg);
static void AsakiraMain(actWork *xreg);
static void AsakiraSippoMain(actWork *xreg);
static void AsakiraEndWait(actWork *xreg);

#define ASAKIRA_ANMWAIT		6
static const actAnm AsakiraAnm0[]={
	{OBJ16_16x16*0, ASAKIRA_ANMWAIT, 0,0},
	{OBJ16_16x16*1, ASAKIRA_ANMWAIT, 0,0},
	{ACT_ANMLOOP,0,0,0}
};
static const actAnm AsakiraAnm1[]={
	{OBJ16_16x16*2, ASAKIRA_ANMWAIT, 0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm AsakiraAnm2[]={
	{OBJ16_16x16*3, ASAKIRA_ANMWAIT, 0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const AsakiraAnmTbl[]={
	AsakiraAnm0,
	AsakiraAnm1,
	AsakiraAnm2,
};
const	actHeader AsakiraHeader={
	WAZACHR_ID_ASAKIRA,
	WAZACHR_ID_ASAKIRA,
	&WazaOamDataNormal[1],
	AsakiraAnmTbl,
	0,
	DummyActAffTbl,
	AsakiraInit,
};

//----------------------------------------------------------
//	0:Delまでのウェイト		1:速度Y(下位8ﾋﾞｯﾄ固定少数)
//----------------------------------------------------------
static void AsakiraInit(actWork *xreg)
{
	s16 x_offs;
	u8 sippo0, sippo1;
	
	x_offs = pp_rand() % 64;
	if(x_offs > 31)
		x_offs = -(x_offs-32);
	xreg->x = GetWazaEffPos(AttackNo, EFF_X) + x_offs;
	xreg->y = GetWazaEffPos(AttackNo, EFF_Y) + 32;
	
	xreg->work[1] = WazaEffWork[0];
	xreg->work[2] = WazaEffWork[1];
	
	sippo0 = AddActor(&AsakiraHeader,xreg->x,xreg->y,xreg->pri+1);	//尻尾
	sippo1 = AddActor(&AsakiraHeader,xreg->x,xreg->y,xreg->pri+1);
	ActAnmChg(&ActWork[sippo0], 1);
	ActAnmChg(&ActWork[sippo1], 2);
	ActWork[sippo0].work[1] = WazaEffWork[0];
	ActWork[sippo0].work[2] = WazaEffWork[1];
	ActWork[sippo1].work[1] = WazaEffWork[0];
	ActWork[sippo1].work[2] = WazaEffWork[1];
	ActWork[sippo0].work[7] = (s16)0xffff;	//尻尾である印
	ActWork[sippo1].work[7] = (s16)0xffff;	//尻尾である印
	ActWork[sippo0].banish = 1;
	ActWork[sippo1].banish = 1;
	ActWork[sippo0].move = AsakiraSippoMain;
	ActWork[sippo1].move = AsakiraSippoMain;
	
	xreg->work[6] = sippo0;		//尻尾のActNo
	xreg->work[7] = sippo1;
	
	xreg->move = AsakiraMain;
}

static void AsakiraMain(actWork *xreg)
{
	xreg->work[3] += xreg->work[2];
	xreg->dy -= xreg->work[3]>>8;
	xreg->work[3] &= 0x00ff;	//少数以外は切り捨てる
	
	if(xreg->work[4] == 0 && xreg->dy < -8){
		ActWork[xreg->work[6]].banish = 0;	//尻尾0をｽﾀｰﾄ
		xreg->work[4]++;
	}
	if(xreg->work[4] == 1 && xreg->dy < -16){
		ActWork[xreg->work[7]].banish = 0;	//尻尾1をｽﾀｰﾄ
		xreg->work[4]++;
	}
	
	if(xreg->work[1]-- == 0){
		xreg->banish = 1;
		xreg->move = AsakiraEndWait;
	}
}

//-- 尻尾が終了するのを待って、尻尾をDelしてから自分もDelする --//
static void AsakiraEndWait(actWork *xreg)
{
	u8 sippo0,sippo1;
	
	sippo0 = xreg->work[6];
	sippo1 = xreg->work[7];
	if(ActWork[xreg->work[6]].move == DummyActMove 
			&& ActWork[xreg->work[7]].move == DummyActMove)
	{
		DelActor(&ActWork[xreg->work[6]]);
		DelActor(&ActWork[xreg->work[7]]);
		DelWazaEffect(xreg);
	}
}

//-- 尻尾部分のメイン --//
static void AsakiraSippoMain(actWork *xreg)
{
	if(xreg->banish)
		return;

	xreg->work[3] += xreg->work[2];
	xreg->dy -= xreg->work[3]>>8;
	xreg->work[3] &= 0x00ff;	//少数以外は切り捨てる
	
	if(xreg->work[1]-- == 0){
		xreg->banish = 1;
		xreg->move = DummyActMove;
	}
}




//=========================================================================
//
//		はめつのねがい
//												by mori 2002.08.01
//=========================================================================
//----------------------------------------------------------
//	offset なし
//
//EVB=3,EVA=8
//----------------------------------------------------------

enum{
	HAMETU_INIT = 0,
	HAMETU_NEXTWAIT,
	HAMETU_BLDUP,
	HAMETU_WAIT,
	HAMETU_BLDDOWN,
	HAMETU_END,
};
#define HAMETU_ADD_BLD	1
#define HAMETU_FIRST_EVB	13
#define HAMETU_BLD_EVB_END	5
#define HAMETU_BLD_EVA	3
#define HAMETU_NEXTWAIT_SYNC	1
#define HAMETU_OFFSET_TBLMAX	4	//HametuOffsetXのテーブル数
#define HAMETU_BLD_WAIT		1
static const s8 HametuOffsetX[] = {120,80,40,0};
static const u8 HametuWait[]    = {0,0,0,0,50,};

void HametunoNegaiTask(u8 id)
{
	WazaBgData wazabg;
	u8 type;

	switch(TaskTable[id].work[0]){
		case HAMETU_INIT:							//初期化
			*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL | BLD_BG1_1ST;
			*(vu16*)REG_BLDALPHA = HAMETU_FIRST_EVB << 8 | HAMETU_BLD_EVA;

			(*(vBgCnt *)REG_BG1CNT).Size = 0;
			(*(vBgCnt *)REG_BG1CNT).Priority = 1;
	
			if(ContestCheck() == 0)//ｴﾌｪｸﾄの間だけｷｬﾗｸﾀﾍﾞｰｽを変更(ｽｸﾘｰﾝﾃﾞｰﾀの関係で)
				(*(vBgCnt *)REG_BG1CNT).CharBasep = 1;
			
			GetWazaEffBgAdrs(&wazabg);
			DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x1000, 32);
			DecordVram((void*)hizashi_psc_ADRS, wazabg.ScrnAdrs);
			DecordVram((void*)s_hizashi_pch_ADRS, wazabg.CharAdrs);
			DecordPaletteWork((void*)s_hizashi_pcl_ADRS, wazabg.PlttNo*16, 0x20);
			
			//PokePriAllSet(2);	//日差しの下にくるようにﾌﾟﾗｲｵﾘﾃｨを下げる
			if(ContestCheck()){
				ScrnPalRewrite(wazabg.PlttNo, (u32)wazabg.ScrnAdrs, 0, 0);
				ScrX1 = -56;
				ScrY1 = 0;
			}
			else{
				type = ClientTypeGet(DefenceNo);
				if(FightCheck()==1){							//2x2の時
					if(type==BSS_CLIENT_ENEMY)	ScrX1 = -155;			//敵
					if(type==BSS_CLIENT_ENEMY2)	ScrX1 = -155+40;		//敵2
					if(type==BSS_CLIENT_MINE)	ScrX1 = -20+40-6;			//味方
					if(type==BSS_CLIENT_MINE2)	ScrX1 = -20;			//味方
				}else{											//1x1の時
					if(type==BSS_CLIENT_ENEMY)	ScrX1 = -135;			//敵
					if(type==BSS_CLIENT_MINE)	ScrX1 = -10;			//味方
				}
				ScrY1 = 0;
			}
			TaskTable[id].work[10] = ScrX1;		//初期座標を保存
			TaskTable[id].work[11] = ScrY1;
			TaskTable[id].work[0]++;
//			SePlayPan(SE_W234, GetWazaEffSePan(WAZA_SE_L));
			break;
		case HAMETU_NEXTWAIT:										//upの前にここで待ち
				TaskTable[id].work[3] = 0;
//				SePlayPan(SE_W234, GetWazaEffSePan(WAZA_SE_L));

				if(MineEnemyCheck(DefenceNo) == SIDE_ENEMY){
					ScrX1 = TaskTable[id].work[10] + HametuOffsetX[TaskTable[id].work[2]];
				}else{
					ScrX1 = TaskTable[id].work[10] - HametuOffsetX[TaskTable[id].work[2]];
				}
				if(TaskTable[id].work[2]++ == HAMETU_OFFSET_TBLMAX)
					TaskTable[id].work[0] = HAMETU_END;
				else
					TaskTable[id].work[0]++;

			break;
		case HAMETU_BLDUP:											//半透明度UP

			TaskTable[id].work[1] -= HAMETU_ADD_BLD;				//透明度を加算していく
			if(TaskTable[id].work[1] < HAMETU_BLD_EVB_END)
				TaskTable[id].work[1] = HAMETU_BLD_EVB_END;
			*(vu16*)REG_BLDALPHA = 									//代入
				(TaskTable[id].work[1]<<8) | HAMETU_BLD_EVA;

			if(TaskTable[id].work[1] == HAMETU_BLD_EVB_END)
				TaskTable[id].work[0]++;
			break;
			
		case HAMETU_WAIT:	
			if(++TaskTable[id].work[3] > HametuWait[TaskTable[id].work[2]]) TaskTable[id].work[0]++;
			break;
			
		case HAMETU_BLDDOWN:										//半透明度DOWN
			TaskTable[id].work[1] += HAMETU_ADD_BLD;
			if(TaskTable[id].work[1] > HAMETU_FIRST_EVB)	TaskTable[id].work[1] = HAMETU_FIRST_EVB;
			*(vu16*)REG_BLDALPHA = 
				(TaskTable[id].work[1]<<8) | HAMETU_BLD_EVA;
				
			if(TaskTable[id].work[1] == HAMETU_FIRST_EVB){	//ネクスト判定
					TaskTable[id].work[0] = HAMETU_NEXTWAIT;
			}
			break;
			
		case HAMETU_END:											//終了
			GetWazaEffBgAdrs(&wazabg);
			DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
			if(ContestCheck() == 0)
				(*(vBgCnt *)REG_BG1CNT).CharBasep = 0;
			(*(vBgCnt *)REG_BG1CNT).Priority = EFF_BG1_PRI;
//			ActWork[PokemonStruct[AttackNo]].oamData.Priority = 1;
			ScrX1 = 0;
			ScrY1 = 0;
			*(vu16*)REG_BLDCNT = 0;
			*(vu16*)REG_BLDALPHA = 0;
			//PokePriAllSet(1);	//ﾌﾟﾗｲｵﾘﾃｨを元に戻す
			DelTaskEffect(id);
			break;
	}
}













//=========================================================================
//
//		やつあたり
//												by matsuda 2002.06.13(木)
//=========================================================================
//----------------------------------------------------------
//	なつき度31～100
//	offset なし
//----------------------------------------------------------
static const actAffAnm YatuatariAffAnm[] = {
	{0,-15, 0, 7},
	{0,15, 0, 7},
//	{0,0,0, 5},
	{ACT_AFcLOOP,2,0,0},
	{ ACT_AFEND, 0, 0, 0 },
};

void Yatuatari2Task(u8 id)
{
	if(TaskTable[id].work[0]==0){
		SetPokeKakusyukuAnm(&TaskTable[id], W_GetPokeActNo(0), YatuatariAffAnm);
		TaskTable[id].work[0]++;
	}
	else{
		if(!PokeKakusyukuAnm(&TaskTable[id]))
			DelTaskEffect(id);
	}
}

//----------------------------------------------------------
//	なつき度最高状態
// offset 0:Xoffset	1:Yoffset
//----------------------------------------------------------
static void YatuatariIkariInit(actWork *xreg);

const actHeader YatuatariIkariHeader = {
	WAZACHR_ID_IKARI,
	WAZACHR_ID_IKARI,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	YatuatariIkariInit,
};

#define YATUATARI_IKARI_DX	0x00a0
#define YATUATARI_IKARI_DY	0x0080
#define YATUATARI_IKARI_WAIT	20
static void YatuatariIkariInit(actWork *xreg)
{
	if(xreg->work[0] == 0){
		WazaDefaultPosSet2(xreg, EFF_MODE);
		xreg->work[0]++;
	}
	else if(xreg->work[0]++ > YATUATARI_IKARI_WAIT){
		xreg->work[1] += YATUATARI_IKARI_DX;
		xreg->work[2] += YATUATARI_IKARI_DY;
		if(MineEnemyCheck(AttackNo))
			xreg->dx = -(xreg->work[1] >> 8);
		else
			xreg->dx = xreg->work[1] >> 8;
		xreg->dy += xreg->work[2] >> 8;
		if(xreg->dy > 64)
			DelWazaEffect(xreg);
	}
}















//=========================================================================
//
//	あまえる
//																	TAYA
//=========================================================================

static void TaskPokeSwingMain(u8 id);

//================================================
//	0:(0:攻撃側  1:防御側)  1:スイングする回数
//	2:速度（遅 0～2 速）
//================================================
void TaskPokeSwing(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	u8 client;

	if(WazaEffWork[1] == 0)
	{
		DelTaskEffect(id);
		return;
	}

	if(WazaEffWork[2] < 0){ WazaEffWork[2] = 0; }
	if(WazaEffWork[2] > 2){ WazaEffWork[2] = 2; }

	my->work[0] = 0;  // 0:ｼｰｹﾝｽ
	my->work[1] = 0;  // 1:ｶｳﾝﾀ
	my->work[2] = 0;  // 2:角度

	my->work[3] = 8 - WazaEffWork[2]*2;         // 3:最大角度までのsync数
	my->work[4] = 0x100 + WazaEffWork[2]*0x80;  // 4:1syncごとの角度増分
	my->work[5] = 2 + WazaEffWork[2];           // 5:1syncごとのＸ補正値

	my->work[6] = WazaEffWork[1] - 1;  // 6:ﾙｰﾌﾟ回数
	my->work[15] = W_GetPokeActNo(WazaEffWork[0]);  // 15:ﾎﾟｹｱｸﾀｰ

	// 自分側・敵側で動きを反転
	client = (WazaEffWork[0]==0)? AttackNo : DefenceNo;
	if(MineEnemyCheck(client) == SIDE_ENEMY)
	{
		my->work[4] *= -1;
		my->work[5] *= -1;
	}

	PokeKakusyukuInit(my->work[15], 0);

	my->TaskAdrs = TaskPokeSwingMain;
}


static void TaskPokeSwingMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];


	switch(my->work[0]){
	case 0:
		ActWork[my->work[15]].dx += my->work[5];

		my->work[2] -= my->work[4];
		PokeKakusyukuSet(my->work[15], 0x100, 0x100, my->work[2]);
		W_AdjustKaitenYPos(my->work[15]);

		if(++(my->work[1]) >= my->work[3])
		{
			my->work[1] = 0;
			my->work[0]++;
		}
		break;

	case 1:
		ActWork[my->work[15]].dx -= my->work[5];

		my->work[2] += my->work[4];
		PokeKakusyukuSet(my->work[15], 0x100, 0x100, my->work[2]);
		W_AdjustKaitenYPos(my->work[15]);

		if(++(my->work[1]) >= (my->work[3]*2))
		{
			my->work[1] = 0;
			my->work[0]++;
		}
		break;

	case 2:
		ActWork[my->work[15]].dx += my->work[5];

		my->work[2] -= my->work[4];
		PokeKakusyukuSet(my->work[15], 0x100, 0x100, my->work[2]);
		W_AdjustKaitenYPos(my->work[15]);

		if(++(my->work[1]) >= my->work[3])
		{
			if(my->work[6]){
				my->work[6]--;
				my->work[1] = 0;
				my->work[0] = 0;
			}else{
				my->work[0]++;
			}
		}
		break;

	case 3:
		PokeKakusyukuEnd(my->work[15]);
		DelTaskEffect(id);
		break;
	}
}



//=========================================================================
//	あまいかおり
//
//														by mori 2002/06/14
//=========================================================================

static void ActAmaiKaoriInit(actWork *Xreg);
static void ActAmaiKaoriMain(actWork *Xreg);

static const actAnm AmaikaoriAnm0[] =
{
	{OBJ16_8x8 * 0,  8, 0, 0},
	{OBJ16_8x8 * 1,  8, 0, 0},
	{OBJ16_8x8 * 2,  8, 0, 0},
	{OBJ16_8x8 * 3,  8, 0, 0},
	{OBJ16_8x8 * 3,  8, 0, 1},
	{OBJ16_8x8 * 2,  8, 0, 1},
	{OBJ16_8x8 * 0,  8, 0, 1},
	{OBJ16_8x8 * 1,  8, 0, 1},
	{ACT_ANMLOOP, 0, 0, 0},
};

static const actAnm AmaikaoriAnm1[] =
{
	{OBJ16_8x8 * 0,  8, 1, 0},
	{OBJ16_8x8 * 1,  8, 1, 0},
	{OBJ16_8x8 * 2,  8, 1, 0},
	{OBJ16_8x8 * 3,  8, 1, 0},
	{OBJ16_8x8 * 3,  8, 1, 1},
	{OBJ16_8x8 * 2,  8, 1, 1},
	{OBJ16_8x8 * 0,  8, 1, 1},
	{OBJ16_8x8 * 1,  8, 1, 1},
	{ACT_ANMLOOP, 0, 0, 0},
};

static const actAnm AmaikaoriAnm2[] =
{
	{OBJ16_8x8 * 0,  8, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};

static const actAnm * const AmaikaoriAnmTbl[] = 
{
	AmaikaoriAnm0,
	AmaikaoriAnm1,
	AmaikaoriAnm2,
};



const actHeader ActAmaikaoriHeader = {
	WAZACHR_ID_HANABIRA3,
	WAZACHR_ID_HANABIRA3,
	&WazaOamDataNormal[0],
	AmaikaoriAnmTbl,
	0,
	DummyActAffTbl,
	ActAmaiKaoriInit,
};


// =================================================================
// ActAmaiKaoriInit
// 概要  : あまいかおりのはなびら
// 引数  : WazaEffWork[0]:開始時の高さのオフセット
//	     : WazaEffWork[1]:アニメ番号
//	     : WazaEffWork[2]:回転し始めるまでのsync数
// 戻り値: none
//
// =================================================================
static void ActAmaiKaoriInit(actWork *Xreg)
{
	if(MineEnemyCheck(AttackNo)==SIDE_MINE){
		Xreg->x = 0;
		Xreg->y    = WazaEffWork[0];
	}else{
		Xreg->x = 240;
		Xreg->y    = WazaEffWork[0]-30;
	}
	Xreg->work[2] = WazaEffWork[2];
	ActAnmChg(Xreg,WazaEffWork[1]);
	Xreg->move = ActAmaiKaoriMain;
}

static const s8 kaitentbl[][2]={
	{12,24},{16,22},{19,19},{21,16},{23,12},{22,7},{19,4},{16,1},
	{11,0},{6,1},{4,4},{1,7},{0,12},{2,17},{4,19},{8,22},
};

static void ActAmaiKaoriMain(actWork *Xreg)
{
	Xreg->work[0] += 3;
	if(MineEnemyCheck(AttackNo)==SIDE_MINE){
		Xreg->x += 5;
		Xreg->y -= 1;
		if(Xreg->x > 240){
			DelWazaEffect(Xreg);
		}
		Xreg->dy = SinMove((Xreg->work[0]&0xff),16);
//		if(Xreg->work[0]>=Xreg->work[2]){
//			if(Xreg->work[1]<16){
//				Xreg->dx  = (kaitentbl[Xreg->work[1]][0]-12)*2;
//				Xreg->dy += (kaitentbl[Xreg->work[1]][1]-24)*2;
//			}
//			Xreg->work[1]++;
//		}
	}else{
		Xreg->x -= 5;
		Xreg->y += 1;
		if(Xreg->x < 0){
			DelWazaEffect(Xreg);
		}
		Xreg->dy = CosMove((Xreg->work[0]&0xff),16);
//		if(Xreg->work[0]>=Xreg->work[2]){
//			if(Xreg->work[1]<16){
//				Xreg->dx  = (kaitentbl[15-Xreg->work[1]][0]-12)*2;
//				Xreg->dy += (kaitentbl[15-Xreg->work[1]][1]-24)*2;
//			}
//			Xreg->work[1]++;
//		}
	}
}


//=========================================================================
//
//	じたばた
//																	TAYA
//=========================================================================

//================================================
//	0:(0:攻撃側  1:防御側)  
//================================================
#define JITABATA_SYNC        (32)
#define JITABATA_THETA_SPEED (0x200)
#define JITABATA_THETA_MAX   (0x800)

#define JITABATA_LOOP  (1)
#define JITABATA_SPEED (3)

static void TaskJitabata2Main(u8 id);

void TaskJitabata2(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = 0; // 0:ｼｰｹﾝｽ
	my->work[1] = 0; // 1:ｶｳﾝﾀ
	my->work[2] = 0; // 2:角度
	my->work[3] = 0;

	my->work[12] = JITABATA_SYNC;
	my->work[13] = JITABATA_THETA_MAX / JITABATA_SYNC;
	my->work[14] = JITABATA_THETA_MAX;

	my->work[15] = W_GetPokeActNo(WazaEffWork[0]);
	PokeKakusyukuInit(my->work[15], 0);

	my->TaskAdrs = TaskJitabata2Main;
}
static void TaskJitabata2Main(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		my->work[2] += JITABATA_THETA_SPEED;
		if(my->work[2] >= my->work[14])
		{
			s16 diff, cnt, rem;

			diff = my->work[14] - my->work[2];
			cnt = diff / (my->work[14] * 2);
			rem = diff % (my->work[14] * 2);
			if((cnt & 1) == 0){
				my->work[2] = my->work[14] - rem;
				my->work[0] = 1;
			}else{
				my->work[2] = -(my->work[14]) + rem;
			}
		}
		break;

	case 1:
		my->work[2] -= JITABATA_THETA_SPEED;
		if(my->work[2] <= -(my->work[14]))
		{
			s16 diff, cnt, rem;

			diff = my->work[14] - my->work[2];
			cnt = diff / (my->work[14] * 2);
			rem = diff % (my->work[14] * 2);
			if((cnt & 1) == 0){
				my->work[2] = -(my->work[14]) + rem;
				my->work[0] = 0;
			}else{
				my->work[2] = my->work[14] - rem;
			}
		}
		break;

	case 2:
		PokeKakusyukuEnd(my->work[15]);
		DelTaskEffect(id);
		return;
	}

	PokeKakusyukuSet(my->work[15], 0x100, 0x100, my->work[2]);
	W_AdjustKaitenYPos(my->work[15]);
	ActWork[my->work[15]].dx = -(my->work[2] / 0x40);


	if(++(my->work[1]) > 8)
	{
		if(my->work[12]){
			my->work[12]--;
			my->work[14] -= my->work[13];
			if(my->work[14] < 0x10){
				my->work[14] = 0x10;
			}
		}else{
			my->work[0] = 2;
		}
	}

}












//=========================================================================
//
//		いたみわけ
//												by matsuda 2002.06.15(土)
//=========================================================================
static void ItamiwakeInit(actWork *xreg);

#define ITAMIWAKE_ANMWAIT	5
static const actAnm ItamiwakeAnm0[]={
	{OBJ16_16x16*0, ITAMIWAKE_ANMWAIT, 0,0},
	{OBJ16_16x16*1, 9, 0,0},
	{OBJ16_16x16*2, ITAMIWAKE_ANMWAIT, 0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const ItamiwakeAnmTbl[]={
	ItamiwakeAnm0,
};
const	actHeader ItamiwakeHeader={
	WAZACHR_ID_HIT1,
	WAZACHR_ID_HIT1,
	&WazaOamDataNormal[1],
	ItamiwakeAnmTbl,
	0,
	DummyActAffTbl,
	ItamiwakeInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:0=攻撃側 1=防御側
//----------------------------------------------------------
#define ITAMIWAKE_INIT_SP_X		0x0080
#define ITAMIWAKE_INIT_SP_Y		0x0300
#define ITAMIWAKE_KASOKUDO_X	0x00c0
#define ITAMIWAKE_KASOKUDO_Y	0x0080
static void ItamiwakeInit(actWork *xreg)
{
	if(xreg->work[0] == 0){
		if(WazaEffWork[2] == 0){
			xreg->x = GetWazaEffPos(AttackNo, PM_X);
			xreg->y = GetWazaEffPos(AttackNo, PM_Y);
		}
		xreg->x += WazaEffWork[0];
		xreg->y += WazaEffWork[1];
		xreg->work[1] = ITAMIWAKE_INIT_SP_X;
		xreg->work[2] = ITAMIWAKE_INIT_SP_Y;
		xreg->work[3] = WazaEffWork[1];
		xreg->work[0]++;
		return;
	}
	
	xreg->dx = xreg->work[1] >> 8;
	xreg->dy += xreg->work[2] >> 8;
	if(xreg->work[4] == 0 && xreg->dy > -xreg->work[3]){
		xreg->work[4] = 1;
		xreg->work[2] = -xreg->work[2] / 3 * 2;	//3分の2
	}
	
	xreg->work[1] += ITAMIWAKE_KASOKUDO_X;
	xreg->work[2] += ITAMIWAKE_KASOKUDO_Y;
	
	if(xreg->anmend_sw)
		DelWazaEffect(xreg);
}


//----------------------------------------------------------
//	ポケモンをつぶす
// 0: 0=攻撃側	1=防御側	1:つぶしパターンNo
//----------------------------------------------------------
#define ITAMIWAKE_ENDWAIT	12
#define ITAMIWAKE_BURU_DX	2
#define ITAMI_BURU_WAIT		2
void ItamiwakeTask(u8 id)
{
	u8 poke;
	
	if(TaskTable[id].work[0] == 0){
		if(WazaEffWork[0] == 0)
			TaskTable[id].work[11] = AttackNo;
		else
			TaskTable[id].work[11] = DefenceNo;
		poke = W_GetPokeActNo(WazaEffWork[0]);
		TaskTable[id].work[10] = poke;
		PokeKakusyukuInit(poke, 0);
		
		switch(WazaEffWork[1]){
			case 0:
				PokeKakusyukuSet(poke, 0x00e0, 0x0140, 0);
				PokeKakusyukuYHosei(poke);
				break;
			case 1:
				PokeKakusyukuSet(poke, 0x00d0, 0x0130, 15<<8);
				PokeKakusyukuYHosei(poke);
				if(ContestCheck() || MineEnemyCheck(TaskTable[id].work[11])==SIDE_MINE)
					ActWork[poke].dy += 16;
				break;
			case 2:
				PokeKakusyukuSet(poke, 0x00d0, 0x0130, (-15)<<8);
				PokeKakusyukuYHosei(poke);
				if(ContestCheck() || MineEnemyCheck(TaskTable[id].work[11])==SIDE_MINE)
					ActWork[poke].dy += 16;
				break;
		}
		ActWork[poke].dx = ITAMIWAKE_BURU_DX;
		TaskTable[id].work[0]++;
	}
	else{
		poke = TaskTable[id].work[10];
		if(TaskTable[id].work[2]++ == ITAMI_BURU_WAIT){
			TaskTable[id].work[2] = 0;
			ActWork[poke].dx = -ActWork[poke].dx;
		}
		
		if(TaskTable[id].work[1]++ == ITAMIWAKE_ENDWAIT){
			PokeKakusyukuEnd(poke);
			ActWork[poke].dx = 0;
			ActWork[poke].dy = 0;
			DelTaskEffect(id);
		}
	}
}












//=========================================================================
//
//		おだてる
//												by matsuda 2002.06.17(月)
//=========================================================================
static void KamifubukiInit(actWork *xreg);
static void KamifubukiMain(actWork *xreg);
static void OdateruSpotInit(actWork *xreg);
static void OdateruSpotMain(actWork *xreg);

const	actHeader KamifubukiHeader={
	WAZACHR_ID_KAMIFUBUKI,
	WAZACHR_ID_KAMIFUBUKI,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	KamifubukiInit,
};

//-- ｽﾎﾟｯﾄﾗｲﾄ --//
const	actHeader OdateruSpotHeader={
	WAZACHR_ID_SPOTLIGHT,
	WAZACHR_ID_SPOTLIGHT,
	&WazaOamDataAffine2[3],
	DummyActAnmTbl,
	0,
	AnkooruAffTbl,
	OdateruSpotInit,
};

//----------------------------------------------------------
//	0:初期速度X(下位8ﾋﾞｯﾄ少数：正のみ)	1:初期速度Y(下位8ﾋﾞｯﾄ少数：正のみ)
//	2:初期位置(0:画面左端	1:画面右端)
//----------------------------------------------------------
#define KAMIFUBUKI_DEFAULT_X	0x05e0
#define KAMIFUBUKI_DEFAULT_Y	0x0480
#define KAMIFUBUKI_SUB_X	0x0016
#define KAMIFUBUKI_SUB_Y	0x0030
#define KAMIFUBUKI_ENDWAIT	30
static void KamifubukiInit(actWork *xreg)
{
	u8 anm_offset;
	u16 x_offset, y_offset;
	
	anm_offset = pp_rand() % 12;
	xreg->oamData.CharNo += anm_offset;
	
	x_offset = pp_rand() & 0x01ff;
	y_offset = pp_rand() & 0x00ff;
	if(x_offset & 1)
		xreg->work[0] = KAMIFUBUKI_DEFAULT_X + x_offset;
	else
		xreg->work[0] = KAMIFUBUKI_DEFAULT_X - x_offset;
	if(y_offset & 1)
		xreg->work[1] = KAMIFUBUKI_DEFAULT_Y + y_offset;
	else
		xreg->work[1] = KAMIFUBUKI_DEFAULT_Y - y_offset;
	xreg->work[2] = WazaEffWork[0];
	if(WazaEffWork[0] == 0)
		xreg->x = -8;
	else
		xreg->x = 248;
	xreg->y = 160-56;
	xreg->move = KamifubukiMain;
}

static void KamifubukiMain(actWork *xreg)
{
	if(xreg->work[2] == 0){
		xreg->dx += xreg->work[0] >> 8;
		xreg->dy -= xreg->work[1] >> 8;
	}
	else{
		xreg->dx -= xreg->work[0] >> 8;
		xreg->dy -= xreg->work[1] >> 8;
	}
	xreg->work[0] -= KAMIFUBUKI_SUB_X;
	xreg->work[1] -= KAMIFUBUKI_SUB_Y;
	if(xreg->work[0] < 0)
		xreg->work[0] = 0;
	
	if(xreg->work[3]++ == KAMIFUBUKI_ENDWAIT)
		DelWazaEffect(xreg);
}


//----------------------------------------------------------
//	スポットライト
//	0:Xoffset	1:Yoffset	2:Delまでのウェイト
//----------------------------------------------------------
static void OdateruSpotInit(actWork *xreg)
{
//	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | (WIN_ALL_ON ^ WIN_BLEND_ON);
	*(vu16*)REG_WINOUT = ((WIN_ALL_ON ^ WIN_BLEND_ON)<<8) | WIN_ALL_ON;//OBJWINBLEND無効
	*(vu16*)REG_DISPCNT |= DISP_OBJWIN_ON;
	Win0H = 0;
	Win0V = 0;
	*(vu16*)REG_WIN0H = Win0H;
	*(vu16*)REG_WIN0V = Win0V;

	xreg->work[0] = WazaEffWork[2];
	WazaDefaultPosSet1(xreg, EFF_MODE);
	xreg->oamData.ObjMode = 2;	//OBJｳｨﾝﾄﾞｳ
	xreg->banish = 1;			//ｺﾝﾃｽﾄで一瞬ぐしゃるので
	xreg->move = OdateruSpotMain;
}

static void OdateruSpotMain(actWork *xreg)
{
	switch(xreg->work[1]){
		case 0:
			xreg->banish = 0;
			if(xreg->affend_sw)
				xreg->work[1]++;
			break;
		case 1:
			if(--xreg->work[0] == 0)
			{
				ActAffAnmHoldChg(xreg,1);
				xreg->work[1]++;
			}
			break;
		case 2:
			if(xreg->affend_sw){
				xreg->banish = 1;
				xreg->work[1]++;
			}
			break;
		case 3:
//			*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
			*(vu16*)REG_WINOUT = (WIN_ALL_ON<<8) | WIN_ALL_ON;
			*(vu16*)REG_DISPCNT ^= DISP_OBJWIN_ON;
			DelWazaEffect(xreg);
			break;
	}
}











//=========================================================================
//
//		きしかいせい
//												by matsuda 2002.06.19(水)
//=========================================================================
static void KisikaiseiInit(actWork *xreg);
static void KisikaiseiOpen(actWork *xreg);

const	actHeader KisikaiseiHeader={
	WAZACHR_ID_NOMIKOMU,
	WAZACHR_ID_NOMIKOMU,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	KisikaiseiInit,
};

//----------------------------------------------------------
//	0:SyncNum	1:初期角度
//----------------------------------------------------------
#define KISIKAISEI_ADD_X		0x0400
#define KISIKAISEI_ADD_Y		0x0100
#define KISIKAISEI_ADDSEC		9
static void KisikaiseiInit(actWork *xreg)
{
	xreg->x = GetWazaEffPos(AttackNo, PM_X);
	xreg->y = GetWazaEffPos(AttackNo, PM_Y);
	
	xreg->work[0] = WazaEffWork[0];
	xreg->work[1] = WazaEffWork[1];
	xreg->move = KisikaiseiOpen;
	xreg->move(xreg);
}

static void KisikaiseiOpen(actWork *xreg)
{
	xreg->dx = SinMove(xreg->work[1], xreg->work[2]>>8);
	xreg->dy = CosMove(xreg->work[1], xreg->work[3]>>8);
	xreg->work[1] = 0xff & (xreg->work[1] + KISIKAISEI_ADDSEC);
	
#if 1	//円が小さい時だと体にめりこんでるようで変なので
	if((xreg->work[1] >= 0 && xreg->work[1] < 64) || xreg->work[1] > 195)
		xreg->pri = GetPokeSoftPri(AttackNo) - 1;
	else
		xreg->pri = GetPokeSoftPri(AttackNo) + 1;
#endif

	if(xreg->work[5] == 0){
		xreg->work[2] += KISIKAISEI_ADD_X;
		xreg->work[3] += KISIKAISEI_ADD_Y;
		if(++xreg->work[4] == xreg->work[0]){
			xreg->work[4] = 0;
			xreg->work[5] = 1;
		}
	}
	else if(xreg->work[5] == 1){
		xreg->work[2] -= KISIKAISEI_ADD_X;
		xreg->work[3] -= KISIKAISEI_ADD_Y;
		if(++xreg->work[4] == xreg->work[0])
			DelWazaEffect(xreg);
	}
}












//=========================================================================
//
//		なりきり
//												by matsuda 2002.06.20(木)
//=========================================================================
static void NarikiriMainTask(u8 id);
static void NarikiriFinish(u8 id);

//----------------------------------------------------------
//	offset	なし
//----------------------------------------------------------
#define NARIKIRI_POKE_OFFS_X	20
#define NARIKIRI_BLD_END		10
#define NARIKIRI_BLD_WAIT		2
#define NARIKIRI_FINISH_AFF_SYNC	8
#define NARIKIRI_FINISH_AFFX	(-(0x80 / NARIKIRI_FINISH_AFF_SYNC))
#define NARIKIRI_FINISH_AFFY	(0x400 / NARIKIRI_FINISH_AFF_SYNC)
void NarikiriTask(u8 id)
{
	u32 personal_rnd, id_no;
	u16 monsno;
	s16 x,y, x_offs;
	u8 pri, muki;
	u8 attack_poke, narikiri_poke;
	
	attack_poke = W_GetPokeActNo(0);
	if(ContestCheck()){
		muki = 1;
//		personal_rnd = conpara->personal_rnd;
		personal_rnd = conpara->hensin_personal_rnd;
		id_no = conpara->id_no;
		monsno = conpara->hensin_monsno;
		x_offs = NARIKIRI_POKE_OFFS_X;
		pri = GetPokeBGPri(AttackNo);
	}
	else if(MineEnemyCheck(AttackNo)){
		muki = 0;
		personal_rnd = PokeParaGet(&PokeParaMine[SelMonsNo[DefenceNo]], 
			ID_personal_rnd);
		id_no = PokeParaGet(&PokeParaMine[SelMonsNo[DefenceNo]], ID_id_no);
		if(Climem[DefenceNo].hensin_monsno == 0){
			if(MineEnemyCheck(DefenceNo) == SIDE_MINE)
				monsno = PokeParaGet(&PokeParaMine[SelMonsNo[DefenceNo]], ID_monsno);
			else
				monsno = PokeParaGet(&PokeParaEnemy[SelMonsNo[DefenceNo]], ID_monsno);
		}
		else
			monsno = Climem[DefenceNo].hensin_monsno;
		x_offs = NARIKIRI_POKE_OFFS_X;
//		pri = GetPokeBGPri(AttackNo) + 1;
		pri = GetPokeBGPri(AttackNo);	//chg_02.08.28_iwasawa
	}
	else{
		muki = 1;
		personal_rnd = PokeParaGet(&PokeParaEnemy[SelMonsNo[DefenceNo]], 
			ID_personal_rnd);
		id_no = PokeParaGet(&PokeParaEnemy[SelMonsNo[DefenceNo]], ID_id_no);
		if(Climem[DefenceNo].hensin_monsno == 0){
			if(MineEnemyCheck(DefenceNo) == SIDE_MINE)
				monsno = PokeParaGet(&PokeParaMine[SelMonsNo[DefenceNo]], ID_monsno);
			else
				monsno = PokeParaGet(&PokeParaEnemy[SelMonsNo[DefenceNo]], ID_monsno);
		}
		else
			monsno = Climem[DefenceNo].hensin_monsno;
		x_offs = -NARIKIRI_POKE_OFFS_X;
		pri = GetPokeBGPri(AttackNo);
	}
	x = GetWazaEffPos(AttackNo, EFF_X);	//ActWork[attack_poke].x;
	y = GetWazaEffPos(AttackNo, EFF_Y);	//ActWork[attack_poke].y;
	narikiri_poke = WazaEffPokeActSet(monsno, muki, 0, x+x_offs, y, 5, personal_rnd, id_no);
	ActWork[narikiri_poke].oamData.Priority = pri;
	ActWork[narikiri_poke].oamData.ObjMode = 1;	//半透明ﾌﾗｸﾞON
	PaletteWorkClear(0x7fff, ActWork[narikiri_poke].oamData.Pltt*16+16*16, 0x20);//ﾊﾟﾚｯﾄを白く
	ActWork[narikiri_poke].oamData.Priority = pri;
	//-- BLD --//
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = ((16-TaskTable[id].work[1])<<8) | TaskTable[id].work[1];
	
	TaskTable[id].work[0] = narikiri_poke;
	TaskTable[id].TaskAdrs = NarikiriMainTask;
}

static void NarikiriMainTask(u8 id)
{
	u8 poke;
	
	if(TaskTable[id].work[10]++ < NARIKIRI_BLD_WAIT)
		return;
	
	TaskTable[id].work[10] = 0;
	TaskTable[id].work[1]++;
	*(vu16*)REG_BLDALPHA = ((16-TaskTable[id].work[1])<<8) | TaskTable[id].work[1];
	if(TaskTable[id].work[1] == NARIKIRI_BLD_END){
		poke = TaskTable[id].work[0];
//		if(ContestCheck())
//			TaskTable[id].work[10] = -0x100;
//		else
			TaskTable[id].work[10] = 0x0100;
		TaskTable[id].work[11] = 0x0100;
		TaskTable[id].TaskAdrs = NarikiriFinish;
	}
}

static void NarikiriFinish(u8 id)
{
	u8 narikiri_poke;
	
	narikiri_poke = TaskTable[id].work[0];
	TaskTable[id].work[10] += NARIKIRI_FINISH_AFFX;
	TaskTable[id].work[11] += NARIKIRI_FINISH_AFFY;
	ActWork[narikiri_poke].oamData.AffineMode |= 2;	//倍角ﾌﾗｸﾞON
	KakusyukuSet(&ActWork[narikiri_poke], 1, TaskTable[id].work[10], TaskTable[id].work[11], 0);
	if(TaskTable[id].work[12]++ == NARIKIRI_FINISH_AFF_SYNC){
		KakusyukuEnd(&ActWork[narikiri_poke]);
		WazaEffPokeActDel(&ActWork[narikiri_poke]);
		TaskTable[id].TaskAdrs = W_BldClearTaskEnd;
	}
}










//=========================================================================
//
//		とける
//																	taya
//=========================================================================
static void TaskTokeruMain(u8 id);
//==============================================
//	0（0:攻撃側 1:防御側）
//==============================================
void TaskTokeru(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	LasterData  LD;
	s16 i, line, xpos, ypos;
	u8 client;

	client = (WazaEffWork[0]==0)? AttackNo : DefenceNo;

	my->work[0] = 0;  // 0:ｼｰｹﾝｽ
	my->work[1] = 0;  // 1:ｶｳﾝﾀ
	my->work[2] = 0;
	my->work[3] = 0x10;
	my->work[4] = 0x00;
	my->work[5] = client;

	my->work[6] = 0x20;
	my->work[7] = 0x00;
	my->work[8] = 0x18;
	if(MineEnemyCheck(client)==SIDE_ENEMY)
	{
		my->work[8] *= -1;
	}



	my->work[13] = GetPokeShadowYPos(client) - 34;  // 13:ｴﾌｪｸﾄ上限ﾗｲﾝ
	if(my->work[13] < 0){
		my->work[13] = 0;
	}
	my->work[14] = my->work[13] + 66;                  // 14:ｴﾌｪｸﾄ下限ﾗｲﾝ
	my->work[15] = W_GetPokeActNo(WazaEffWork[0]); // 15:ﾎﾟｹﾓﾝｱｸﾀｰNo

//	LasterWorkInit();

	if(GetPokeBGNo(client) == 1){
		LD.DestAdrs = (void*)REG_BG1HOFS;
		*(vu16 *)REG_BLDCNT = BLD_BG1_1ST | BLD_A_BLEND_MODE | BLD_2ND_ALL;
		xpos = ScrX1;
		ypos = ScrY1;
	}else{
		LD.DestAdrs = (void*)REG_BG2HOFS;
		*(vu16 *)REG_BLDCNT = BLD_BG2_1ST | BLD_A_BLEND_MODE | BLD_2ND_ALL;
		xpos = ScrX2;
		ypos = ScrY2;
	}

	for(i = 0, line = 0; i < 160; i++, line += 2)
	{
		LasterBuffer[0][line] = xpos;
		LasterBuffer[1][line] = xpos;
		LasterBuffer[0][line+1] = ypos;
		LasterBuffer[1][line+1] = ypos;
	}

	LD.DMAControl = H_DMA_ENABLE32;
	LD.TransType = LASTER_NORMAL;
	LD.LoopCount = 0;
	LasterDmaSet(LD);

	

	my->TaskAdrs = TaskTokeruMain;
}
static void TaskTokeruMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	s16 y, yp, c, p;
	s16 xofs, yofs, i, line;
	s16 scr_x, scr_y;

	if(GetPokeBGNo(my->work[5]) == 1){
		scr_x = ScrX1;
		scr_y = ScrY1;
	}else{
		scr_x = ScrX2;
		scr_y = ScrY2;
	}

	switch(my->work[0]){
	case 0:
		line = my->work[14]*2;
		yp = 0;
		y  = 0;
		c  = 0;
		yofs = 0;

		my->work[1] += 2;
		my->work[1] &= 0xff;
		p = my->work[1];

		my->work[9] = (63<<5) / my->work[6];
		my->work[10] = -((my->work[7]*2) / my->work[9]);
		my->work[11] = my->work[7];
		xofs = my->work[11] >> 5;
		my->work[12] = xofs;
		for(i = my->work[14]; i > my->work[13]; i--)
		{
			

			LasterBuffer[LasterSys.BufFlag][line+1] = scr_y + (c-y);
			LasterBuffer[LasterSys.BufFlag][line] = scr_x + xofs + (sin_cos_table[p] >> 5);

			p = (p+10)&0xff;

			my->work[11] += my->work[10];
			xofs = my->work[11] >> 5;
			my->work[12] = xofs;
			c++;
			line -= 2;
			yp += my->work[6];
			y = yp >> 5;
//			if(y > 63){ break; }
			yofs = (c-y)&0xff;
		}
		for(line = i * 2; line >= 0; line -= 2)
		{
			LasterBuffer[0][line] = scr_x+240;
			LasterBuffer[1][line] = scr_x+240;
		}

		my->work[6] += 1;
		if(my->work[6] >= 0x40)
		{
			my->work[6] = 0x40;
			my->work[2]++;
			if(my->work[2] & 1){
				my->work[3]--;
			}else{
				my->work[4]++;
			}
			*(vu16 *)REG_BLDALPHA = (my->work[4]<<8) | my->work[3];

			if(my->work[3] == 0x00 && my->work[4] == 0x10)
			{
				my->work[2] = 0;
				my->work[3] = 0;
				my->work[0]++;
			}
		}else{
			my->work[7] += my->work[8];
		}
		break;

	case 1:
		if(++(my->work[2]) > 12)
		{
			LasterSys.TransType=LASTER_END;
			my->work[2] = 0;
			my->work[0]++;
		}
		break;

	case 2:
		my->work[2]++;
		if(my->work[2] & 1){
			my->work[3]++;
		}else{
			my->work[4]--;
		}
		*(vu16 *)REG_BLDALPHA = (my->work[4]<<8) | my->work[3];
		if(my->work[3] == 0x10 && my->work[4] == 0x00)
		{
			my->work[2] = 0;
			my->work[3] = 0;
			my->work[0]++;
		}
		break;

	case 3:
		DelTaskEffect(id);
		break;
	}
}






//=========================================================================
//
//		あくび
//																	taya
//=========================================================================
static void TaskAkubiMain(u8 id);

#define AKUBI_YOKOYURE_WIDTH (1)
#define AKUBI_YOKOYURE_WAIT  (1)

static const actAffAnm AkubiAffAnm[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x10,  0x00,  0,  4  },
	{ 0x00, -0x03,  0, 16  },
	{ 0x04,  0x00,  0,  4  },
	{ 0x00,  0x00,  0, 24  },
	{-0x05,  0x03,  0, 16  },
	{ACT_AFEND,0,0,0},
};

//==============================================
//	0（0:攻撃側 1:防御側）
//==============================================
void TaskAkubi(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = 0;

	my->work[15] = W_GetPokeActNo(WazaEffWork[0]);

	SetPokeKakusyukuAnm(my, my->work[15], AkubiAffAnm);
	TaskTable[id].TaskAdrs = TaskAkubiMain;
}
static void TaskAkubiMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0]++;
	if(my->work[0] > 20 && my->work[0] < 44){
		if(++(my->work[1]) > AKUBI_YOKOYURE_WAIT){
			my->work[1] = 0;
			my->work[2]++;
			if(my->work[2] & 1){
				ActWork[my->work[15]].dx = AKUBI_YOKOYURE_WIDTH;
			}else{
				ActWork[my->work[15]].dx = -AKUBI_YOKOYURE_WIDTH;
			}
		}
	}else{
		ActWork[my->work[15]].dx = 0;
	}

	if(!PokeKakusyukuAnm(&TaskTable[id])){
		DelTaskEffect(id);
	}
}


//==============================================
//	0:大きさ(0～2)
//==============================================
void W_ActStraightSet(actWork *act, s16 sx, s16 sy, s16 ex, s16 ey, u16 sync)
{
	act->x = sx;
	act->y = sy;
	act->work[4] = sx<<4;
	act->work[5] = sy<<4;
	act->work[6] = ((ex-sx)<<4)/sync;
	act->work[7] = ((ey-sy)<<4)/sync;
}
void W_ActStraightMove(actWork *act)
{
	act->work[4] += act->work[6];
	act->work[5] += act->work[7];
	act->x = (act->work[4]>>4);
	act->y = (act->work[5]>>4);
}

#define AKUBI_MOVE_SYNC (64)

static void AkubiActMove(actWork *act);

static void AkubiActInit(actWork *act)
{
	s16 ex, ey;

	ex = act->x;
	ey = act->y;
	EffPositionReset(act);
	ActAffAnmChg(act, WazaEffWork[0]);

	W_ActStraightSet(act, act->x, act->y, ex, ey, AKUBI_MOVE_SYNC);
	act->work[0] = 0;
	act->move = AkubiActMove;
}

static void AkubiActMove(actWork *act)
{
	u16 w;

	act->work[0]++;
	w = (act->work[0]*8)&0xff;

	W_ActStraightMove(act);
	act->dy = SinMove(w,8);

	if(act->work[0] > 58)
	{
		act->work[1]++;
		if(act->work[1] > 1)
		{
			act->work[1] = 0;
			act->work[2]++;
			act->banish = act->work[2] & 1;
			if(act->work[2] > 3)
			{
				W_AffCheckEndSeq(act);
			}
		}
	}
}


static const actAffAnm akubi_affanm0[] = {
	{ 0x80, 0x80, 0, ACT_AFSET },
	{-0x08,-0x08, 0, 8         },
	{ 0x08, 0x08, 0, 8         },
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm akubi_affanm1[] = {
	{ 0xC0, 0xC0, 0, ACT_AFSET },
	{ 0x08, 0x08, 0, 8         },
	{-0x08,-0x08, 0, 8         },
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm akubi_affanm2[] = {
	{ 0x100, 0x100, 0, ACT_AFSET },
	{ 0x08, 0x08, 0, 8         },
	{-0x08,-0x08, 0, 8         },
	{ACT_AFLOOP,0,0,0},
};

static const	actAffAnm * const AkubiAffAnmTbl[] = {
	akubi_affanm0,
	akubi_affanm1,
	akubi_affanm2,
};

const actHeader ActAkubi = {
	WAZACHR_ID_AKUBI,
	WAZACHR_ID_AKUBI,
	&WazaOamDataAffine[2],
	DummyActAnmTbl,
	0,
	AkubiAffAnmTbl,
	AkubiActInit,
};


//=========================================================================
//
//		けむりだま
//															iwasawa
//=========================================================================

//-------------------------------------------------------------------------
//	0:アニメパターン,1:Xoffset,2:Yoffset,3:寿命
//
//-------------------------------------------------------------------------
extern void SeqWazaEffectEnd(actWork *xreg);
static void SeqKemuridamaInit(actWork *xreg)
{
	//寿命を保存
	xreg->work[0] = WazaEffWork[3];
	ActAffAnmChg(xreg,WazaEffWork[0]);

	//Xオフセットの反転
	if(MineEnemyCheck(DefenceNo)){	//ディフェンスが手前にいるとき
		WazaEffWork[1] = -WazaEffWork[1];
	}
	xreg->x = GetWazaEffPos(AttackNo,PM_X)+WazaEffWork[1];
	xreg->y = GetWazaEffPos(AttackNo,PM_Y)+WazaEffWork[2];

	xreg->move = SeqWazaEffectEnd;
}

static const actAffAnm kemuri_affanm0[] = {
	{ 0x80, 0x80, 0, ACT_AFSET },
	{-0x04,-0x06, 0, 16        },
	{ 0x04, 0x06, 0, 16        },
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm kemuri_affanm1[] = {
	{ 0xC0, 0xC0, 0, ACT_AFSET },
	{ 0x04, 0x06, 0, 16        },
	{-0x04,-0x06, 0, 16        },
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm kemuri_affanm2[] = {
	{ 0x100, 0x100, 0, ACT_AFSET },
	{ 0x04, 0x06, 0, 16          },
	{-0x04,-0x06, 0, 16          },
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm kemuri_affanm3[] = {
	{ 0x100, 0x100, 0, ACT_AFSET },
	{ 0x08, 0x0A, 0, 30          },
	{-0x08,-0x0A, 0, 16          },
	{ACT_AFLOOP,0,0,0},
};
static const	actAffAnm * const KemuriAffAnmTbl[] = {
	kemuri_affanm0,
	kemuri_affanm1,
	kemuri_affanm2,
	kemuri_affanm3,
};
const actHeader ActKemuridamaHeader = {
	WAZACHR_ID_AKUBI,
	WAZACHR_ID_AKUBI,
	&WazaOamDataAffine2[2],
	DummyActAnmTbl,
	0,
	KemuriAffAnmTbl,
	SeqKemuridamaInit,
};


//=========================================================================
//
//		きあいのはちまき
//															iwasawa
//=========================================================================
#define KH_CNT	0
#define KH_WCNT	1
#define KH_XV	2
#define KH_YV	3
#define KH_XW	4
#define KH_YW	5
#define KH_FLG	6
#define KH_WK0	7
#define KH_WK1	8
#define KH_WK2	9
#define KH_WK3	10
#define KH_ST	12
#define KH_WAIT	13
#define KH_SYNC	14
#define KH_PMNO	15

static void TaskKiainoHatimakiEnd(u8 id)
{
	u16 dx = 0,dy = 0;
	
	TaskTable[id].work[KH_CNT]--;	//カウンタマイナス

	//震える処理
	if(	TaskTable[id].work[KH_FLG] & 0x8000 && 
		TaskTable[id].work[KH_WCNT]-- == 0)
	{
		if(TaskTable[id].work[KH_WK2] == 0){
			TaskTable[id].work[KH_WK2] = TaskTable[id].work[KH_XW];
			TaskTable[id].work[KH_XW] = -TaskTable[id].work[KH_XW];
		}else{
			TaskTable[id].work[KH_WK2] = 0;
		}
		if(TaskTable[id].work[KH_WK3] == 0){
			TaskTable[id].work[KH_WK3] = TaskTable[id].work[KH_YW];
			TaskTable[id].work[KH_YW] = -TaskTable[id].work[KH_YW];
		}else{
			TaskTable[id].work[KH_WK3] = 0;
		}
		//ウェイトを復帰
		TaskTable[id].work[KH_WCNT] = TaskTable[id].work[KH_WAIT];
	}
	
	dx = TaskTable[id].work[KH_WK0];
	dy = TaskTable[id].work[KH_WK1];
	
	if(TaskTable[id].work[KH_XV] & 0x8000){
		ActWork[TaskTable[id].work[KH_PMNO]].dx = 
			-(dx >> 8) + TaskTable[id].work[KH_WK2];
	}
	else{
		ActWork[TaskTable[id].work[KH_PMNO]].dx = 
			(dx >> 8) + TaskTable[id].work[KH_WK2];
	}
	if(TaskTable[id].work[KH_YV] & 0x8000){
		ActWork[TaskTable[id].work[KH_PMNO]].dy = 
			-(dy >> 8) + TaskTable[id].work[KH_WK3];
	}
	else{
		ActWork[TaskTable[id].work[KH_PMNO]].dy = 
			(dy >> 8) + TaskTable[id].work[KH_WK3];
	}

	if(TaskTable[id].work[KH_CNT] > 0)  return;
	
	//タスクの削除
	DelTask(id);
	WazaEffectCount--;
}
static void TaskKiainoHatimakiMain(u8 id)
{
	u16	dx = 0,dy = 0;
	
	TaskTable[id].work[KH_CNT]--;	//カウンタマイナス

	//震える処理
	if(	TaskTable[id].work[KH_FLG] & 0x8000 && 
		TaskTable[id].work[KH_WCNT]-- == 0)
	{
		if(TaskTable[id].work[KH_WK2] == 0){
			TaskTable[id].work[KH_WK2] = TaskTable[id].work[KH_XW];
			TaskTable[id].work[KH_XW] = -TaskTable[id].work[KH_XW];
		}else{
			TaskTable[id].work[KH_WK2] = 0;
		}
		if(TaskTable[id].work[KH_WK3] == 0){
			TaskTable[id].work[KH_WK3] = TaskTable[id].work[KH_YW];
			TaskTable[id].work[KH_YW] = -TaskTable[id].work[KH_YW];
		}else{
			TaskTable[id].work[KH_WK3] = 0;
		}
		//ウェイトを復帰
		TaskTable[id].work[KH_WCNT] = TaskTable[id].work[KH_WAIT];
	}
	
	//現在のオフセット取得
	dx = TaskTable[id].work[KH_WK0] + (TaskTable[id].work[KH_XV]&0x7FFF);
	dy = TaskTable[id].work[KH_WK1] + (TaskTable[id].work[KH_YV]&0x7FFF);
	
	if(TaskTable[id].work[KH_XV] & 0x8000){
		ActWork[TaskTable[id].work[KH_PMNO]].dx = 
			-(dx >> 8) + TaskTable[id].work[KH_WK2];
	}
	else{
		ActWork[TaskTable[id].work[KH_PMNO]].dx = 
			(dx >> 8) + TaskTable[id].work[KH_WK2];
	}
	if(TaskTable[id].work[KH_YV] & 0x8000){
		ActWork[TaskTable[id].work[KH_PMNO]].dy = 
			-(dy >> 8) + TaskTable[id].work[KH_WK3];
	}
	else{
		ActWork[TaskTable[id].work[KH_PMNO]].dy = 
			(dy >> 8) + TaskTable[id].work[KH_WK3];
	}
	TaskTable[id].work[KH_WK0] = dx;
	TaskTable[id].work[KH_WK1] = dy;
	
	if(TaskTable[id].work[KH_CNT] > 0)  return;

	TaskTable[id].work[KH_CNT] = 30;
	TaskTable[id].work[KH_WAIT] = 0;
	TaskTable[id].TaskAdrs = TaskKiainoHatimakiEnd;
}
//-------------------------------------------------------------------------
//	0:sync,
//	1:Xの速度(下位8bit固定少数),2:Yの速度(下位8bit固定少数)
//	3:震えさせるかさせないか(on:震えさせる)
//	4:震える幅X,5:震える幅Y,6,震えるときのWait
//--------------------------------------------------------------------------
void TaskKiainoHatimakiInit(u8 id)
{
	//ポケモンのアクターナンバを保存
	TaskTable[id].work[KH_PMNO] = PokemonStruct[AttackNo];

	//移動にかけるSyncを保存
	TaskTable[id].work[KH_CNT]	=
	TaskTable[id].work[KH_SYNC] = WazaEffWork[0];
	
	//震えるときのウェイトを保存
	TaskTable[id].work[KH_WAIT] = WazaEffWork[6];
		
	//フラグの保存
	if(WazaEffWork[3]) TaskTable[id].work[KH_FLG] |= 0x8000;
	
	//移動スピードを、攻撃側の位置によって反転
	if(MineEnemyCheck(AttackNo)){
		TaskTable[id].work[KH_XV] = WazaEffWork[1];
		TaskTable[id].work[KH_YV] = WazaEffWork[2];
	}else{
		if(WazaEffWork[1] & 0x8000)
			TaskTable[id].work[KH_XV] = (WazaEffWork[1]&0x7FFF);
		else
			TaskTable[id].work[KH_XV] = (WazaEffWork[1]|0x8000);
		
		if(WazaEffWork[2] & 0x8000)
			TaskTable[id].work[KH_YV] = (WazaEffWork[2]&0x7FFF);
		else
			TaskTable[id].work[KH_YV] = (WazaEffWork[2]|0x8000);
	}

	//移動用ワークとして初期化
	TaskTable[id].work[KH_WK0] = 
	TaskTable[id].work[KH_WK1] = 0;
	
	//ぶるぶる震える用のパラメータを保存
	TaskTable[id].work[KH_XW] = WazaEffWork[4];
	TaskTable[id].work[KH_YW] = WazaEffWork[5];

	//次のタスクへ
	TaskTable[id].TaskAdrs = TaskKiainoHatimakiMain;
}





//=========================================================================
//
//		がむしゃら
//																	taya
//=========================================================================
#define GAMUSYARA_SYNC  (6)
#define GAMUSYARA_RATIO (0x10)

static const actAffAnm GamusyaraAffAnm[] = {
	{ -GAMUSYARA_RATIO,  GAMUSYARA_RATIO, 0,  GAMUSYARA_SYNC   },
	{  GAMUSYARA_RATIO, -GAMUSYARA_RATIO, 0,  GAMUSYARA_SYNC*2 },
	{ -GAMUSYARA_RATIO,  GAMUSYARA_RATIO, 0,  GAMUSYARA_SYNC   },
	{ ACT_AFEND, 0, 0, 0 },
};

static void TaskGamusyaraMain(u8 id);
static void gamusyara_add_ase(u8 task_id, u8 pos);


//==============================================
//	0:(0:攻撃側 1:防御側)  1:回数
//==============================================
void TaskGamusyara(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	u8  client;

	if(WazaEffWork[1] == 0)
	{
		DelTaskEffect(id);
	}

	my->work[0] = 0;   // 0:ｼｰｹﾝｽ
	my->work[1] = 0;   // 1:ｶｳﾝﾀｰ
	my->work[2] = 0;   // 2:汗ｱｸﾀｰ数
	my->work[3] = WazaEffWork[1];  // 3:ﾙｰﾌﾟ回数

	client = (WazaEffWork[0]==0)? AttackNo : DefenceNo;
	my->work[4] = GetWazaEffPos(client, EFF_X);  // 4:中心X
	my->work[5] = GetWazaEffPos(client, EFF_Y);  // 5:中心Y
	my->work[6] = GetPokeSoftPri(client);        // 6:ﾌﾟﾗｲｵﾘﾃｨ

	my->work[15] = W_GetPokeActNo(WazaEffWork[0]);
	SetPokeKakusyukuAnm(my, my->work[15], GamusyaraAffAnm);
	my->TaskAdrs = TaskGamusyaraMain;
}


static void TaskGamusyaraMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		my->work[1]++;
		if(my->work[1] == GAMUSYARA_SYNC)
		{
			gamusyara_add_ase(id, 1);
		}
		if(my->work[1] == GAMUSYARA_SYNC * 3)
		{
			gamusyara_add_ase(id, 0);
		}

		if(!PokeKakusyukuAnm(my))
		{
			if(--(my->work[3]) == 0){
				my->work[0]++;
			}else{
				my->work[1] = 0;
				SetPokeKakusyukuAnm(my, my->work[15], GamusyaraAffAnm);
			}
		}
		break;

	case 1:
		if(my->work[2]==0)
		{
			DelTaskEffect(id);
		}
		break;
	}
}

//===========================================
//  task  ﾀｽｸﾃｰﾌﾞﾙ
//  pos   出現位置（0:上  1:下）
//===========================================

static const actHeader AseHeader;

#define ASE_U_XOFS  (18)
#define ASE_U_YOFS  (-20)
#define ASE_D_XOFS  (30)
#define ASE_D_YOFS  (20)
#define ASE_XDIFF   (4)
#define ASE_YDIFF   (6)

static void gamusyara_add_ase(u8 id, u8 pos)
{
	TASK_TABLE *task;
	s16 xpos[4];
	s16 ypos[2];
	s8  xofs, yofs;
	u8 no, i;

	task = &TaskTable[id];

	if(pos == 0){
		xofs = ASE_U_XOFS;
		yofs = ASE_U_YOFS;
	}else{
		xofs = ASE_D_XOFS;
		yofs = ASE_D_YOFS;
	}

	xpos[0] = task->work[4] - xofs;
	xpos[1] = task->work[4] - xofs - ASE_XDIFF;
	xpos[2] = task->work[4] + xofs;
	xpos[3] = task->work[4] + xofs + ASE_XDIFF;
	ypos[0] = task->work[5] + yofs;
	ypos[1] = task->work[5] + yofs + ASE_YDIFF;

	for(i = 0; i < 4; i++)
	{
		no = AddActor(&AseHeader, xpos[i], ypos[i&1], task->work[6]-5);
		if(no != ACT_MAX)
		{
			ActWork[no].work[0] = 0;  // 0:ｶｳﾝﾀ
			ActWork[no].work[1] = (i<2)? -2 : 2;  // 1:x speed
			ActWork[no].work[2] = -1; // 2: y speed
			ActWork[no].work[3] = id; // 3: TaskID
			ActWork[no].work[4] = 2;  // 4: work No
			task->work[2]++;
		}
	}
}
static void ase_actmove(actWork *act)
{
	act->x += act->work[1];
	act->y += act->work[2];
	if(++(act->work[0]) > 6)
	{
		TaskTable[act->work[3]].work[act->work[4]]--;
		DelActor(act);
	}
}


static const actHeader AseHeader = {
	WAZACHR_ID_ASE2,
	WAZACHR_ID_ASE2,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	ase_actmove,
};










//=========================================================================
//
//	からげんき
//																	taya
//=========================================================================
#define KARAGENKI_EVY  (8)
#define KARAGENKI_FADE_MAX  (24)
static void TaskKaraGenkiFadeMain(u8 id);

static const u16 KaraGenkiFadeTbl[KARAGENKI_FADE_MAX] = {
	0x073c,0x16bc,0x225b,0x2ddb,0x3d5a,0x48fa,0x5479,0x6419,
	0x5c19,0x5019,0x4019,0x3419,0x281a,0x181a,0x0c1a,0x001b,
	0x003b,0x00bb,0x013b,0x019b,0x021c,0x027c,0x02fc,0x037d,
};

//====================================
// 0:(0:攻撃側  1:防御側)  1:sync数
//====================================
void TaskKaraGenkiFade(u8 id)
{
	u8 pokeno;

	TaskTable[id].work[0] = 0;
	TaskTable[id].work[1] = WazaEffWork[1];

	pokeno = W_GetPokeActNo(WazaEffWork[0]);
	TaskTable[id].work[2] = 256 + ActWork[pokeno].oamData.Pltt * 16;

	TaskTable[id].TaskAdrs = TaskKaraGenkiFadeMain;

}
static void TaskKaraGenkiFadeMain(u8 id)
{
//	SoftFade(u16 start_pal, u16 end_pal, u8 evy, u16 next_rgb)
	if(TaskTable[id].work[1]){
		SoftFade(
			TaskTable[id].work[2], 16, KARAGENKI_EVY,
			KaraGenkiFadeTbl[TaskTable[id].work[0]]);

		if(++(TaskTable[id].work[0]) >= KARAGENKI_FADE_MAX)
		{
			TaskTable[id].work[0] = 0;
		}

		TaskTable[id].work[1]--;

	}else{
		SoftFade(TaskTable[id].work[2], 16, 0, 0);
		DelTaskEffect(id);
	}


}










//=========================================================================
//
//		リフレッシュ
//												by matsuda 2002.07.03(水)
//=========================================================================
#if 1	//++++++ 共通ルーチンを使用するように変更 2002.07.29(月) +++++++++++

//----------------------------------------------------------
//	0: 1=相方にも出す、0=相方には出さない
//----------------------------------------------------------
#define REF_BLDMAX		10
#define REF_BLDWAIT		2
#define REF_BLDMAXWAIT	30
void RefleshTask(u8 id)
{
	KurinukiEffectSet(id, 0, 0x01a0, AttackNo, WazaEffWork[0], REF_BLDMAX, 
		REF_BLDWAIT, REF_BLDMAXWAIT, (void*)s_ref_pch_ADRS, 
		(void*)s_ref_psc_ADRS, (void*)s_ref_pcl_ADRS);
}

#else	//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

static void RefleshMainTask(u8 id);
//----------------------------------------------------------
//	なし
//----------------------------------------------------------
#define REFLESH_ADD_Y	0x01a0
#define REFLESH_BLDWAIT	2
void RefleshTask(u8 id)
{
	u8 pokeact, winact;
	u16 monsno;
	WazaBgData wazabg;
	u8 client_no;
	
	client_no = AttackNo;
	
	Win0H = 0;
	Win0V = 0;
	*(vu16*)REG_WIN0H = Win0H;
	*(vu16*)REG_WIN0V = Win0V;
	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
	*(vu16*)REG_WINOUT = (WIN_ALL_ON << 8) | 0x3d;
	*(vu16*)REG_DISPCNT |= DISP_OBJWIN_ON;
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL | BLD_BG1_1ST;
	*(vu16*)REG_BLDALPHA = 16 << 8;

	(*(vBgCnt *)REG_BG1CNT).Priority = 0;
	(*(vBgCnt *)REG_BG1CNT).Size = 0;
	(*(vBgCnt *)REG_BG1CNT).Loop = 1;
	if(ContestCheck() == 0)//ｴﾌｪｸﾄの間だけｷｬﾗｸﾀﾍﾞｰｽを変更(ｽｸﾘｰﾝﾃﾞｰﾀの関係で)
		(*(vBgCnt *)REG_BG1CNT).CharBasep = 1;

	if(ContestCheck()){
		monsno = conpara->monsno;
	}
	else{
		if(MineEnemyCheck(client_no))
			monsno = PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]], ID_monsno);
		else
			monsno = PokeParaGet(&PokeParaMine[SelMonsNo[client_no]], ID_monsno);
	}

	//-- WinObj --//
	pokeact = PokemonStruct[client_no];		//W_GetPokeActNo(0);
	winact = PokeWinObjMake(client_no, pokeact, monsno);
	
	//-- 光エフェクト --//
	GetWazaEffBgAdrs(&wazabg);
	DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x1000, 32);
	DecordVram((void*)s_ref_psc_ADRS, wazabg.ScrnAdrs);
	if(ContestCheck())
		ScrnPalRewrite(wazabg.PlttNo, (u32)wazabg.ScrnAdrs, 0, 0);
	DecordVram((void*)s_ref_pch_ADRS, wazabg.CharAdrs);
	DecordPaletteWork((void*)s_ref_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	
	ScrX1 = -ActWork[pokeact].x + 32;
	ScrY1 = -ActWork[pokeact].y + 32-64;
	TaskTable[id].work[1] = REFLESH_ADD_Y;
	TaskTable[id].work[0] = winact;
	TaskTable[id].TaskAdrs = RefleshMainTask;
}

static void RefleshMainTask(u8 id)
{
	WazaBgData wazabg;
	
	TaskTable[id].work[13] += TaskTable[id].work[1];
	ScrY1 += (u16)TaskTable[id].work[13] >> 8;
	TaskTable[id].work[13] &= 0x00ff;
	switch(TaskTable[id].work[15]){
		case 0:
			if(TaskTable[id].work[11]++ < REFLESH_BLDWAIT)
				break;
			TaskTable[id].work[11] = 0;
			TaskTable[id].work[12]++;
			*(vu16*)REG_BLDALPHA = ((16-TaskTable[id].work[12])<<8) | TaskTable[id].work[12];
			if(TaskTable[id].work[12] == 10)
				TaskTable[id].work[15]++;
			break;
		case 1:
			TaskTable[id].work[10]++;
			if(TaskTable[id].work[10] == 30)
				TaskTable[id].work[15]++;
			break;
		case 2:
			if(TaskTable[id].work[11]++ < REFLESH_BLDWAIT)
				break;
			TaskTable[id].work[11] = 0;
			TaskTable[id].work[12]--;
			*(vu16*)REG_BLDALPHA = ((16-TaskTable[id].work[12])<<8) | TaskTable[id].work[12];
			if(TaskTable[id].work[12] == 0){
				PokeBGDropClear(0);
				Win0H = 0;
				Win0V = 0;
				*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
				*(vu16*)REG_WINOUT = (WIN_ALL_ON << 8) | WIN_ALL_ON;
				if(ContestCheck() == 0)
					(*(vBgCnt *)REG_BG1CNT).CharBasep = 0;
				*(vu16*)REG_DISPCNT ^= DISP_OBJWIN_ON;
				*(vu16*)REG_BLDCNT = 0;
				*(vu16*)REG_BLDALPHA = 0;
//				AffineDelActor(&ActWork[TaskTable[id].work[0]]);
				DelActor(&ActWork[TaskTable[id].work[0]]);
				GetWazaEffBgAdrs(&wazabg);
				DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
				(*(vBgCnt *)REG_BG1CNT).Loop = 0;
				DelTaskEffect(id);
			}
			break;
	}
}
#endif	//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++










//=========================================================================
//
//		ほえる
//												by matsuda 2002.07.09(火)
//=========================================================================
static void HoeruInit(actWork *xreg);
static void HoeruMain(actWork *xreg);

#define HOERU_ANMWAIT	3
static const actAnm HoeruAnm0[]={	//斜め向き
	{OBJ16_32x32*0, HOERU_ANMWAIT, 0,0},
	{OBJ16_32x32*1, HOERU_ANMWAIT, 0,0},
	{ACT_ANMLOOP,0,0,0}
};
static const actAnm HoeruAnm1[]={	//真横向き
	{OBJ16_32x32*2, HOERU_ANMWAIT, 0,0},
	{OBJ16_32x32*3, HOERU_ANMWAIT, 0,0},
	{ACT_ANMLOOP,0,0,0}
};
static const actAnm *const HoeruAnmTbl[]={
	HoeruAnm0,
	HoeruAnm1,
};
const	actHeader HoeruHeader={
	WAZACHR_ID_HOERU,
	WAZACHR_ID_HOERU,
	&WazaOamDataNormal[2],
	HoeruAnmTbl,
	0,
	DummyActAffTbl,
	HoeruInit,
};

//----------------------------------------------------------
//	offset 0:Xｵﾌｾｯﾄ  1:Yｵﾌｾｯﾄ	2:上下反転ﾌﾗｸﾞ(0:上　1:下  2:真中)
//----------------------------------------------------------
#define HOERU_ENDWAIT	13
#define HOERU_ADD_X		0x0280
#define HOERU_ADD_Y		0x0280
static void HoeruInit(actWork *xreg)
{
	if(MineEnemyCheck(AttackNo) == SIDE_ENEMY)
		WazaEffWork[0] = -WazaEffWork[0];
	xreg->x = GetWazaEffPos(AttackNo, EFF_X) + WazaEffWork[0];
	xreg->y = GetWazaEffPos(AttackNo, EFF_Y) + WazaEffWork[1];

	if(WazaEffWork[2] == 0){
		xreg->work[0] = HOERU_ADD_X;
		xreg->work[1] = -HOERU_ADD_Y;
	}
	else if(WazaEffWork[2] == 1){
		xreg->Vflip = 1;
		xreg->work[0] = HOERU_ADD_X;
		xreg->work[1] = HOERU_ADD_Y;
	}
	else{
		ActAnmChg(xreg, 1);
		xreg->work[0] = HOERU_ADD_X;
	}
	
	if(MineEnemyCheck(AttackNo)){
		xreg->work[0] = -xreg->work[0];
		xreg->Hflip = 1;
	}
	
	xreg->move = HoeruMain;
}

static void HoeruMain(actWork *xreg)
{
	xreg->work[6] += xreg->work[0];
	xreg->work[7] += xreg->work[1];
	xreg->dx = xreg->work[6] >> 8;
	xreg->dy = xreg->work[7] >> 8;
	
	if(xreg->work[5]++ == HOERU_ENDWAIT)
		DelWazaEffect(xreg);
}







//=========================================================================
//
//		へびにらみ
//														taya  2002.07.10
//=========================================================================
#define HEBINIRAMI_STEP  (12)
#define HEBINIRAMI_CONTEST_STEP  (8)

#define HEBINIRAMI_WAIT  (3)
#define HEBINIRAMI_ACTWAIT  (HEBINIRAMI_WAIT*HEBINIRAMI_STEP)
#define HEBINIRAMI_SHISEN_OFS  (3)
#define HEBINIRAMI_CONTEST_SHISEN_OFS  (3)

static void TaskHebiNiramiMain(u8 id);
static void get_step_pos(s16 x1, s16 y1, s16 x2, s16 y2, u8 step, u8 num, s16 *x, s16 *y);
static void HebiniramiActMove(actWork *act);

static const actHeader HebiNiramiHeader = {
	WAZACHR_ID_SHISEN,
	WAZACHR_ID_SHISEN,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	HebiniramiActMove,
};

//=========================================
// 0:(0:攻撃側→防御側  1:防御側→攻撃側)
//=========================================
void TaskHebiNirami(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	if(ContestCheck()){
		my->work[5] = HEBINIRAMI_CONTEST_STEP;
		my->work[6] = HEBINIRAMI_CONTEST_SHISEN_OFS;
		my->work[7] = 1;
	}else{
		my->work[5] = HEBINIRAMI_STEP;
		my->work[6] = HEBINIRAMI_SHISEN_OFS;
		my->work[7] = 0;
	}

	if(MineEnemyCheck(AttackNo)==SIDE_MINE){
		my->work[11] = GetWazaEffPos(AttackNo,PM_X) + (W_GetPokeSize(AttackNo,POKESIZE_HEIGHT)/4);
	}else{
		my->work[11] = GetWazaEffPos(AttackNo,PM_X) - (W_GetPokeSize(AttackNo,POKESIZE_HEIGHT)/4);
	}

	my->work[12] = GetWazaEffPos(AttackNo,PM_Y) - (W_GetPokeSize(AttackNo,POKESIZE_HEIGHT)/4);

	my->work[13] = GetWazaEffPos(DefenceNo, PM_X);
	my->work[14] = GetWazaEffPos(DefenceNo, PM_Y);

	my->TaskAdrs = TaskHebiNiramiMain;
}

static void TaskHebiNiramiMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		if(++(my->work[1]) > HEBINIRAMI_WAIT)
		{
			s16 x, y;
			u8  i, no;

			my->work[1] = 0;

			get_step_pos(my->work[11],my->work[12],my->work[13],my->work[14],
				my->work[5], my->work[2], &x, &y);

			for(i = 0; i < 2; i++){
				no = AddActor(&HebiNiramiHeader, x, y, C_POKE1PRI+5);
				if(no != ACT_MAX){
					// バトル
					if(my->work[7]==0){
						if(i == 0){
							ActWork[no].dx = ActWork[no].dy = -(my->work[6]);
						}else{
							ActWork[no].dx = ActWork[no].dy = my->work[6];
						}
					// ｺﾝﾃｽﾄ
					}else{
						if(i == 0){
							ActWork[no].dx = -(my->work[6]);
							ActWork[no].dy = (my->work[6]);
						}else{
							ActWork[no].dx = my->work[6];
							ActWork[no].dy = -(my->work[6]);
						}
					}
					ActWork[no].work[0] = 0;
					ActWork[no].work[1] = id; // このﾀｽｸの
					ActWork[no].work[2] = 10; // このﾜｰｸをｶｳﾝﾀとして使う
					my->work[10]++;
				}
			}

			if(my->work[2] == my->work[5])
			{
				my->work[0]++;
			}
			my->work[2]++;
		}
		break;

	case 1:
		if(my->work[10]==0)
		{
			DelTaskEffect(id);
		}
		break;
	}
}
//------------------------------------------------------
//  (x1,y1)～(x2,y2)への直線を step 段階に分割して、
//その num 段階目の座標を x, y へ渡す
//------------------------------------------------------
static void get_step_pos(s16 x1, s16 y1, s16 x2, s16 y2, u8 step, u8 num, s16 *x, s16 *y)
{
	if(num == 0){
		*x = x1;
		*y = y1;
	}else if(num >= step){
		*x = x2;
		*y = y2;
	}else{
		s32  xs, ys;

		step--;
		xs = (x1<<8) + ((((x2-x1)<<8) / step) * num);
		ys = (y1<<8) + ((((y2-y1)<<8) / step) * num);
		*x = xs >> 8;
		*y = ys >> 8;
	}
}
static void HebiniramiActMove(actWork *act)
{
	if(++(act->work[0]) > HEBINIRAMI_ACTWAIT)
	{
		TaskTable[act->work[1]].work[act->work[2]]--;
		DelActor(act);
	}
}








//=========================================================================
//
//		ねこのて
//														taya  2002.07.11
//=========================================================================
static void NekoteActInit(actWork *act);

const actHeader NekoteHeader = {
	WAZACHR_ID_NEKOTE,
	WAZACHR_ID_NEKOTE,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	NekoteActInit,
};

//=======================================================
//  0:始点X  1:始点Y  2:終点X  3:終点Y  4:移動sync数
//=======================================================
static void NekoteActInit(actWork *act)
{
	act->x = WazaEffWork[0];
	act->y = WazaEffWork[1];
	act->work[2] = WazaEffWork[2];
	act->work[4] = WazaEffWork[3];
	act->work[0] = WazaEffWork[4];

	SetWorkSeq(act, DelWazaEffect);
	act->move = W_StraightSyncMove4;

}










//=========================================================================
//
//		たまなげ
//														taya 2002.07.11
//=========================================================================
static void TaskTamanageMain(u8 id);
static const actHeader TamanageHeader;

#define TAMANAGE_MOVE_SYNC  (16)
#define TAMANAGE_YAMANARI_HEIGHT  (-32)

void TaskTamanage(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[11] = GetWazaEffPos(AttackNo, PM_X);
	my->work[12] = GetWazaEffPos(AttackNo, PM_Y);
	my->work[13] = GetWazaEffPos(DefenceNo, PM_X);
	my->work[14] = GetWazaEffPos(DefenceNo, PM_Y) + (W_GetPokeSize(DefenceNo,POKESIZE_HEIGHT) / 4);
//	my->work[15] = AddActor(&TamanageHeader,my->work[11],my->work[12],C_POKE1PRI+5);
	my->work[15] = AddActor(&TamanageHeader,my->work[11],my->work[12],GetPokeSoftPri(DefenceNo)-5);
	if(my->work[15] != ACT_MAX){
		ActWork[my->work[15]].work[0] = TAMANAGE_MOVE_SYNC;
		ActWork[my->work[15]].work[2] = my->work[13];
		ActWork[my->work[15]].work[4] = my->work[14];
		ActWork[my->work[15]].work[5] = TAMANAGE_YAMANARI_HEIGHT;
		YamanariMoveInit(&ActWork[my->work[15]]);
		if(MineEnemyCheck(AttackNo)==SIDE_ENEMY){
			ActAffAnmChg(&ActWork[my->work[15]], 1);
		}
		my->TaskAdrs = TaskTamanageMain;
	}else{
		DelTaskEffect(id);
	}
}


static void TaskTamanageMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		if(++(my->work[1]) > 1)
		{
			my->work[1] = 0;
			YamanariMoveMain(&ActWork[my->work[15]]);
			if(++(my->work[2]) >= (TAMANAGE_MOVE_SYNC / 2)){
				my->work[0]++;
			}
		}
		break;

	case 1:
		if(YamanariMoveMain(&ActWork[my->work[15]])){
			my->work[1] = 0;
			my->work[2] = 0;
			my->work[0]++;
		}
		break;

	case 2:
		my->work[1]++;
		if(my->work[1] > 1){
			my->work[1] = 0;
			my->work[2]++;
			ActWork[my->work[15]].banish = (my->work[2] & 1);
			if(my->work[2] == 16)
			{
				AffineWorkNumDel(ActWork[my->work[15]].oamData.AffineParamNo);
				DelActor(&ActWork[my->work[15]]);
				my->work[0]++;
			}
		}
		break;

	case 3:
		DelTaskEffect(id);
		break;
	}

}

static const actAffAnm tamanage_affanm0[] = {
	{ 0x00, 0x00, -4, 24         },
	{ACT_AFEND,0,0,0},
};
static const actAffAnm tamanage_affanm1[] = {
	{ 0x100, 0x100, -64, ACT_AFSET         },
	{ 0x00, 0x00, 4, 24         },
	{ACT_AFEND,0,0,0},
};

static const	actAffAnm * const TamanageAffAnmTbl[] = {
	tamanage_affanm0,
	tamanage_affanm1,
};

static const actHeader TamanageHeader = {
	WAZACHR_ID_TAMANAGE,
	WAZACHR_ID_TAMANAGE,
	&WazaOamDataAffine[2],
	DummyActAnmTbl,
	0,
	TamanageAffAnmTbl,
	DummyActMove,
};







//=========================================================================
//
//		きつけ
//														taya 2002.07.11
//=========================================================================

//=================================================
// てのひら
//  0:(0:攻撃側 1:防御側)  1:(0:左側  1:右側)  2:回数
//=================================================
static void KitsukeHandActMove(actWork *act);

static void KitsukeHandActInit(actWork *act)
{
	u8 client = (WazaEffWork[0] == 0)? AttackNo : DefenceNo;

	act->oamData.CharNo += 16;
	act->work[6] = WazaEffWork[2];
	act->work[7] = (WazaEffWork[1]==0)? -1 : 1;
	act->y = GetWazaEffPos(client, PM_Y);
	if(WazaEffWork[1] == 0){
		act->oamData.AffineParamNo |= 0x08;  // 反転
		act->x = W_GetPokeSize(client,POKESIZE_LEFT)-8;
	}else{
		act->x = W_GetPokeSize(client,POKESIZE_RIGHT)+8;
	}

	act->move = KitsukeHandActMove;
}
static void KitsukeHandActMove(actWork *act)
{
	switch(act->work[0]){
	case 0:
		if(++(act->work[1])> 1){
			act->work[1] = 0;
			act->dx += (1 * act->work[7]);
			if(++(act->work[2]) == 12)
			{
				act->work[0]++;
			}
		}
		break;

	case 1:
		if(++(act->work[1])==8)
		{
			act->work[1] = 0;
			act->work[0]++;
		}
		break;

	case 2:
		act->dx -= (4*act->work[7]);
		if(++(act->work[1]) == 6){  // 4*6=24
			act->work[1] = 0;
			act->work[0]++;
		}
		break;

	case 3:
		act->dx += (3*act->work[7]);
		if(++(act->work[1]) == 8){ // 3*8=24
			if(--(act->work[6])){
				act->work[1] = 0;
				act->work[0]--;
			}else{
				DelWazaEffect(act);
			}
		}
		break;

	}
}


const actHeader KitsukeHandActor = {
	WAZACHR_ID_TE,
	WAZACHR_ID_TE,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	KitsukeHandActInit,
};
//=================================================
// のびる動き   0:(0:攻撃側 1:防御側)  1:回数
//=================================================
static void TaskKitsukeNobiMain(u8 id);

static const actAffAnm KitsukeNobiAnm[] = {
	{ 0x00, -0x10,  0, 6        },
//	{ 0x00,  0x00,  0, 6        },
	{ 0x00,  0x10,  0, 6        },
//	{ 0x00,  0x00,  0, 6        },
	{ACT_AFEND,0,0,0},
};

void TaskKitsukeNobi(u8 id)
{
	if(WazaEffWork[0] == 0){
		DelTaskEffect(id);
		return;
	}
	TaskTable[id].work[0] = WazaEffWork[1];
	TaskTable[id].work[15] = W_GetPokeActNo(WazaEffWork[0]);

	SetPokeKakusyukuAnm(&TaskTable[id], TaskTable[id].work[15], KitsukeNobiAnm);
	TaskTable[id].TaskAdrs = TaskKitsukeNobiMain;
}

static void TaskKitsukeNobiMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	if(++(my->work[1]) > 1)
	{
		my->work[1] = 0;
		if(!(my->work[2] & 1)){
			ActWork[my->work[15]].dx = 2;
		}else{
			ActWork[my->work[15]].dx = -2;
		}
	}

	if(!PokeKakusyukuAnm(my)){
		ActWork[my->work[15]].dx = 0;
		if(--(my->work[0])){
			SetPokeKakusyukuAnm(&TaskTable[id], TaskTable[id].work[15], KitsukeNobiAnm);
			my->work[1] = 0;
			my->work[2] = 0;
		}else{
			DelTaskEffect(id);
		}
	}
}
//=================================================
// めざめアクター
// 0:(0:攻撃側 1:防御側)  1:点滅間隔  2:点滅回数
//=================================================
#define KITSUKE_MEZAME_YPOS_MIN  (8)

static void KitsukeMezameActMove(actWork *act);

static void KitsukeMezameActInit(actWork *act)
{
	if(WazaEffWork[0]==0){
		act->x = GetWazaEffPos(AttackNo,PM_X);
		act->y = W_GetPokeSize(AttackNo,POKESIZE_TOP);
	}else{
		act->x = GetWazaEffPos(DefenceNo,PM_X);
		act->y = W_GetPokeSize(DefenceNo,POKESIZE_TOP);
	}
	if(act->y < KITSUKE_MEZAME_YPOS_MIN){
		act->y = KITSUKE_MEZAME_YPOS_MIN;
	}
	act->work[0] = 0;
	act->work[1] = WazaEffWork[1];
	act->work[2] = 0;
	act->work[3] = WazaEffWork[2];
	act->move = KitsukeMezameActMove;
}
static void KitsukeMezameActMove(actWork *act)
{
	if(++(act->work[0]) >= act->work[1]){
		act->work[0] = 0;
		act->work[2] = (act->work[2]+1)&1;
		act->banish = act->work[2];
		if(act->work[2]){
			if(--(act->work[3])==0){
				DelWazaEffect(act);
			}
		}
	}
}

const actHeader KitsukeMezameHeader = {
	WAZACHR_ID_KITSUKE,
	WAZACHR_ID_KITSUKE,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	KitsukeMezameActInit,
};










//=========================================================================
//
//		てだすけ
//														taya 2002.07.12
//=========================================================================
#define TEDASUKE_CY     (56)
#define TEDASUKE_CX     (120)
#define TEDASUKE_XDIFF  (20)

static void TedasukeActMove(actWork *act);

//===============================================
//  0:(0:左側  1:右側)
//===============================================
static void TedasukeActInit(actWork *act)
{
	if(WazaEffWork[0]==0){
		act->oamData.AffineParamNo |= 0x08;  // 左右反転
		act->x = TEDASUKE_CX - TEDASUKE_XDIFF;
		act->work[7] = 1;
	}else{
		act->x = TEDASUKE_CX + TEDASUKE_XDIFF;
		act->work[7] = -1;
	}
	act->y = TEDASUKE_CY;
	act->move = TedasukeActMove;
}
static void TedasukeActMove(actWork *act)
{
	switch(act->work[0]){
	case 0:
		act->y -= (2 * act->work[7]);
		if(act->work[1] & 1){
			act->x -= (2 * act->work[7]);
		}
		if(++(act->work[1]) == 9){
			act->work[1] = 0;
			act->work[0]++;
		}
		break;

	case 1:
		if(++(act->work[1]) == 4)
		{
			act->work[1] = 0;
			act->work[0]++;
		}
		break;

	case 2:
		act->work[1]++;
		act->y += (3 * act->work[7]);
		act->dx = (sin_cos_table[act->work[1]*10] >> 3) * act->work[7];
		if(act->work[1] == 12){
			act->work[1] = 0;
			act->work[0]++;
		}
		break;

	case 3:
		if(++(act->work[1]) == 2)
		{
			act->work[1] = 0;
			act->work[0]++;
		}
		break;

	case 4:
		act->work[1]++;
		act->y -= (3 * act->work[7]);
		act->dx = (sin_cos_table[act->work[1]*10] >> 3) * act->work[7];
		if(act->work[1] == 12){
			act->work[0]++;
		}
		break;

	case 5:
		act->work[1]++;
		act->y += (3 * act->work[7]);
		act->dx = (sin_cos_table[act->work[1]*10] >> 3) * act->work[7];
		if(act->work[1] == 15){
			act->oamData.CharNo += 16;
		}
		if(act->work[1] == 18){
			act->work[1] = 0;
			act->work[0]++;
		}
		break;

	case 6:
		act->x += (6*act->work[7]);
		if(++(act->work[1]) == 9)
		{
			act->work[1] = 0;
			act->work[0]++;
		}
		break;

	case 7:
		act->x += (2*act->work[7]);
		if(++(act->work[1]) == 1)
		{
			act->work[1] = 0;
			act->work[0]++;
		}
		break;

	case 8:
		act->x -= (3*act->work[7]);
		if(++(act->work[1]) == 5)
		{
			DelWazaEffect(act);
		}
		break;

	}
}

const actHeader ActTedasuke = 
{
	WAZACHR_ID_TE,
	WAZACHR_ID_TE,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	TedasukeActInit,
};


// ての動きに合わせてﾎﾟｹﾓﾝを動かすﾀｽｸ
static void TaskTedasukeMain(u8 id);
void TaskTedasuke(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[15] = W_GetPokeActNo(0);

	if(ContestCheck()==0){
		// 2vs2
		if(FightCheck()==1){
			s16  my_x, ai_x;
			my_x = GetWazaEffPos(AttackNo,EFF_X);
			ai_x = GetWazaEffPos(AttackNo^2,EFF_X);
			if(my_x > ai_x){
				my->work[14] = 1;
			}else{
				my->work[14] = -1;
			}
		// 1vs1
		}else{
			if(MineEnemyCheck(AttackNo)==SIDE_MINE){
				my->work[14] = -1;
			}else{
				my->work[14] = 1;
			}
		}
	}else{
		// ｺﾝﾃｽﾄ
		my->work[14] = 1;
	}

	my->TaskAdrs = TaskTedasukeMain;
}
static void TaskTedasukeMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		if(++(my->work[1]) == 13){
			my->work[1] = 0;
			my->work[0]++;
		}
		break;

	case 1:
		ActWork[my->work[15]].dx -= (3*my->work[14]);
		if(++(my->work[1]) == 6){
			my->work[1] = 0;
			my->work[0]++;
		}
		break;

	case 2:
		ActWork[my->work[15]].dx += (3*my->work[14]);
		if(++(my->work[1]) == 6){
			my->work[1] = 0;
			my->work[0]++;
		}
		break;

	case 3:
		if(++(my->work[1])==2){
			my->work[1] = 0;
			if(my->work[2]==0){
				my->work[2]++;
				my->work[0] = 1;
			}else{
				my->work[0]++;
			}
		}
		break;

	case 4:
		ActWork[my->work[15]].dx += (1*my->work[14]);
		if(++(my->work[1]) == 3){
			my->work[1] = 0;
			my->work[0]++;
		}
		break;

	case 5:
		if(++(my->work[1])==6){
			my->work[1] = 0;
			my->work[0]++;
		}
		break;

	case 6:
		ActWork[my->work[15]].dx -= (4*my->work[14]);
		if(++(my->work[1]) == 5){
			my->work[1] = 0;
			my->work[0]++;
		}
		break;

	case 7:
		ActWork[my->work[15]].dx += (4*my->work[14]);
		if(++(my->work[1]) == 5){
			my->work[1] = 0;
			my->work[0]++;
		}
		break;

	case 8:
		ActWork[my->work[15]].dx = 0;
		DelTaskEffect(id);
		break;

	}

}





//=========================================================================
//
//		みやぶる
//														taya 2002.07.12
//=========================================================================
#define MIYABURU_MOVE_SYNC  (12)
#define MIYABURU_MOVE_WAIT  (4)
#define MIYABURU_OFS        (4)

static void LoupeActMove(actWork *act);

//===============================================
//  0:(0:攻撃側  1:防御側)
//===============================================
static void LoupeActInit(actWork *act)
{

	if(WazaEffWork[0]==0){
		WazaDefaultPosSet2(act, PM_MODE);
		act->work[7] = AttackNo;
	}else{
		act->work[7] = DefenceNo;
	}

	// 敵方に出す時は左右反転
	if(MineEnemyCheck(act->work[7])==SIDE_ENEMY)
	{
		act->oamData.AffineParamNo = 0x08;
	}
	

	act->oamData.Priority = GetPokeBGPri(act->work[7]);
	act->oamData.ObjMode = 1;
	act->move = LoupeActMove;
	
}

static void LoupeActMove(actWork *act)
{
	switch(act->work[5]){
	case 0:
		{
			s16 x, y;
			switch(act->work[6]){
			default:
				act->work[6] = 0;
			case 0:
			case 4:
				x = W_GetPokeSize(act->work[7], POKESIZE_RIGHT) - MIYABURU_OFS;
				y = W_GetPokeSize(act->work[7], POKESIZE_BOTTOM) - MIYABURU_OFS;
				break;
			case 1:
				x = W_GetPokeSize(act->work[7], POKESIZE_RIGHT) - MIYABURU_OFS;
				y = W_GetPokeSize(act->work[7], POKESIZE_TOP) + MIYABURU_OFS;
				break;
			case 2:
				x = W_GetPokeSize(act->work[7], POKESIZE_LEFT) +MIYABURU_OFS;
				y = W_GetPokeSize(act->work[7], POKESIZE_BOTTOM) - MIYABURU_OFS;
				break;
			case 3:
				x = W_GetPokeSize(act->work[7], POKESIZE_LEFT) +MIYABURU_OFS;
				y = W_GetPokeSize(act->work[7], POKESIZE_TOP) - MIYABURU_OFS;
				break;
			case 5:
				x = GetWazaEffPos(act->work[7], PM_X);
				y = GetWazaEffPos(act->work[7], PM_Y);
				break;
			}
			if(act->work[6] == 4){
				act->work[0] = MIYABURU_MOVE_SYNC * 2;
			}else if(act->work[6] == 5){
				act->work[0] = MIYABURU_MOVE_SYNC / 2;
			}else{
				act->work[0] = MIYABURU_MOVE_SYNC;
			}
			act->work[1] = act->x;
			act->work[2] = x;
			act->work[3] = act->y;
			act->work[4] = y;
			W_GetStraightSyncParam(act);
			act->work[5]++;
		}
		break;

	case 1:
		if(W_ParallelSync(act)){
			switch(act->work[6]){
			default:
				act->x += act->dx;
				act->y += act->dy;
				act->dx = act->dy = 0;
				act->work[0] = 0;
				act->work[5]++;
				act->work[6]++;
				break;

			case 4:
				act->x += act->dx;
				act->y += act->dy;
				act->dx = act->dy = 0;
				act->work[5] = 0;
				act->work[6]++;
				break;

			case 5:
				act->work[0] = 0;
				act->work[1] = 0x10;
				act->work[2] = 0x00;
				act->work[5] = 3;
				break;
			}
		}
		break;

	case 2:
		if(++(act->work[0]) == MIYABURU_MOVE_WAIT)
		{
			act->work[5] = 0;
		}
		break;

	case 3:
		if((act->work[0]&1)==0){
			act->work[1]--;
		}else{
			act->work[2]++;
		}
		*(vu16*)REG_BLDALPHA = ((act->work[2]<<8)|act->work[1]);
		if(++(act->work[0])==32){
			act->banish = 1;
			act->work[5]++;
		}
		break;

	case 4:
		DelWazaEffect(act);
		break;
	}
}

const actHeader LoupeHeader = {
	WAZACHR_ID_LOUPE,
	WAZACHR_ID_LOUPE,
	&WazaOamDataBldNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	LoupeActInit,
};


//=========================================================================
//
//		コメットパンチ
//														mori 2002.07.17
//=========================================================================
static void CometPanchiInit(actWork *Xreg);
extern void MeroHeartInit(actWork *xreg);

const	actHeader CometPanchiHeader={
	WAZACHR_ID_SHOOTINGSTAR,
	WAZACHR_ID_SHOOTINGSTAR,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	CometPanchiInit,
};

const	actHeader CometPanchi2Header={
	WAZACHR_ID_SHOOTINGSTAR,
	WAZACHR_ID_SHOOTINGSTAR,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	MeroHeartInit,
};


static void CometPanchiMain(actWork *Xreg)
{
	Xreg->dx = ((Xreg->work[2] - Xreg->work[0])*Xreg->work[5])/Xreg->work[4];
	Xreg->dy = ((Xreg->work[3] - Xreg->work[1])*Xreg->work[5])/Xreg->work[4];

	if((Xreg->work[5] & 0x1) == 0){
		AddActor(&NegaigotoSippoHeader,Xreg->x+Xreg->dx, Xreg->y+Xreg->dy,5);
	}
	if(Xreg->work[5]==Xreg->work[4]){
		DelWazaEffect(Xreg);
	}
	Xreg->work[5]++;
}


// =================================================================
// CometPanchiInit
// 概要  : 落ちてくる彗星
// 引数  : [0]:Xoffset [1]:YOffset [2]:Sync数 [3]:攻撃側か防御側か(0,1)
// 戻り値: none
// =================================================================
static void CometPanchiInit(actWork *Xreg)
{
	u16 x,y;
//	WazaEffWork[4] = WazaEffWork[2];
//	WazaEffWork[5] = WazaEffWork[3];
//	WazaEffWork[2] = 0;
//	WazaEffWork[3] = 0;
//	WazaEffWork[6] = 1;

	x = GetWazaEffPos(DefenceNo, PM_X);
	y = GetWazaEffPos(DefenceNo, PM_Y);
	
	if(MineEnemyCheck(DefenceNo) == SIDE_MINE || ContestCheck()){
		Xreg->work[0] = Xreg->x-WazaEffWork[0];
		Xreg->work[2] = Xreg->x-WazaEffWork[2];
	}else{
		Xreg->work[0] = Xreg->x+WazaEffWork[0];
		Xreg->work[2] = Xreg->x+WazaEffWork[2];
	}
	Xreg->work[1] = Xreg->y+WazaEffWork[1];
	Xreg->work[3] = Xreg->y+WazaEffWork[3];
	Xreg->work[4] = WazaEffWork[4];
	Xreg->x = Xreg->work[0];
	Xreg->y = Xreg->work[1];

//	Xreg->move = W_OffsetSpaceMove;
	Xreg->move = CometPanchiMain;
}











//=========================================================================
//
//		みがわり
//												by matsuda 2002.07.22(月)
//=========================================================================
static void MigawariMainTask(u8 id);

//----------------------------------------------------------
//	offset	なし
//----------------------------------------------------------
#define MIGAWARI_AFFLOOP	8
#define MIGAWARI_AFF_X		0x60
#define MIGAWARI_AFF_Y		(-0xd)
#define MIGAWARI_AFFWAIT	4
#define MIGAWARI_ADD_DY	6
void MigawariTask(u8 id)
{
	u8 poke;
	int i;
	
	poke = W_GetPokeActNo(0);
	if(TaskTable[id].work[0]==0){
		PokeKakusyukuInit(poke, 0);
		TaskTable[id].work[1] = 0x100;	//x
		TaskTable[id].work[2] = 0x100;	//y
		TaskTable[id].work[0]++;
	}
	else if(TaskTable[id].work[0] == 1){
		TaskTable[id].work[1] += MIGAWARI_AFF_X;
		TaskTable[id].work[2] += MIGAWARI_AFF_Y;
		PokeKakusyukuSet(poke, TaskTable[id].work[1], TaskTable[id].work[2], 0);
		if(TaskTable[id].work[3]++ == MIGAWARI_AFFLOOP){
			TaskTable[id].work[3] = 0;
			PokeKakusyukuEnd(poke);
			ActWork[poke].banish = 1;
			TaskTable[id].work[0]++;
		}
	}
	else{
		MigawariChange(AttackNo, 0, poke);
		if(ContestCheck()){
			ActWork[PokemonStruct[AttackNo]].aff_tbl = PmAffAnmTblF2;
			ActAffAnmChg(&ActWork[PokemonStruct[AttackNo]], 0);
		}
		
		for(i = 0; i < TASK_WORK_MAX; i++)
			TaskTable[id].work[i] = 0;
		TaskTable[id].TaskAdrs = MigawariMainTask;
	}
}

#define MIGAWARI_RAKKA_INTI_SP		0x0000	//初期落下速度
#define MIGAWARI_RAKKA_SP			0x0070	//落下加速度
#define MIGAWARI_BAUND_SUB			0x0800	//ﾊﾞｳﾝﾄﾞ時の速度減算分
static void MigawariMainTask(u8 id)
{
	u8 poke;
	
	poke = W_GetPokeActNo(0);
	switch(TaskTable[id].work[0]){
		case 0:
			ActWork[poke].dy = -200;	//-ActWork[poke].y -32;
			ActWork[poke].dx = 200;	//身代わりｷｬﾗが画面外の時はX座標も画面外にしとく
			ActWork[poke].banish = 0;
			TaskTable[id].work[10] = MIGAWARI_RAKKA_INTI_SP;
			TaskTable[id].work[0]++;
			break;
		case 1:
			TaskTable[id].work[10] += MIGAWARI_RAKKA_SP;
			ActWork[poke].dy += TaskTable[id].work[10] >> 8;
			if(ActWork[poke].y + ActWork[poke].dy >= -32)
				ActWork[poke].dx = 0;
				
			if(ActWork[poke].dy > 0)
				ActWork[poke].dy = 0;
			if(ActWork[poke].dy == 0){
				SePlayPan(SE_W145B, GetWazaEffSePan(WAZA_SE_L));
				TaskTable[id].work[10] -= MIGAWARI_BAUND_SUB;
				TaskTable[id].work[0]++;
			}
			break;
		case 2:
			TaskTable[id].work[10] -= MIGAWARI_RAKKA_SP;
			if(TaskTable[id].work[10] < 0)
				TaskTable[id].work[10] = 0;
			ActWork[poke].dy -= TaskTable[id].work[10] >> 8;
			if(TaskTable[id].work[10] == 0)
				TaskTable[id].work[0]++;
			break;
		case 3:
			TaskTable[id].work[10] += MIGAWARI_RAKKA_SP;
			ActWork[poke].dy += TaskTable[id].work[10] >> 8;
			if(ActWork[poke].dy > 0)
				ActWork[poke].dy = 0;
			if(ActWork[poke].dy == 0){
				SePlayPan(SE_W145B, GetWazaEffSePan(WAZA_SE_L));
				DelTaskEffect(id);
			}
			break;
	}
}








//=========================================================================
//
//		とおせんぼう
//														TAYA 2002.07.22
//=========================================================================
#define TOSENBOU_SPEED  (10)
static void TosenbouActMove(actWork *act);

//===========================================
//  ﾜｰｸ設定不要
//===========================================
static void TosenbouActInit(actWork *act)
{
	s16 yofs;

	if(MineEnemyCheck(DefenceNo) == SIDE_MINE){
		act->pri = GetPokeSoftPri(DefenceNo) - 2;
		yofs = -144;
	}else{
		act->pri = GetPokeSoftPri(DefenceNo) + 2;
		yofs = -96;
	}

	act->y = GetWazaEffPos(DefenceNo, PM_Y);
	act->dy = yofs;

	act->move = TosenbouActMove;
}
static void TosenbouActMove(actWork *act)
{
	switch(act->work[0]){
	case 0:
		act->dy += TOSENBOU_SPEED;
		if(act->dy >= 0){
			SePlayPan(SE_W166, GetWazaEffSePan(WAZA_SE_R));
			act->dy = 0;
			act->work[0]++;
		}
		break;

	case 1:
		act->work[1] += 4;
		act->dy = -(sin_cos_table[act->work[1]] >> 3);
		if(act->work[1] >= 128){
			SePlayPan(SE_W166, GetWazaEffSePan(WAZA_SE_R));
			act->work[1] = 0;
			act->dy = 0;
			act->work[0]++;
		}
		break;

	case 2:
		act->work[1] += 6;
		act->dy = -(sin_cos_table[act->work[1]] >> 4);
		if(act->work[1] >= 128){
			act->work[1] = 0;
			act->dy = 0;
			act->work[0]++;
		}
		break;

	case 3:
		if(++(act->work[1]) > 8){
			SePlayPan(SE_W043, GetWazaEffSePan(WAZA_SE_R));
			act->work[1] = 0;
			act->work[0]++;
		}
		break;

	case 4:
		if(++(act->work[1]) > 8){
			act->work[1] = 0;
			act->work[2]++;
			act->banish = (act->work[2] & 1);
			if(act->work[2] == 7)
			{
				DelWazaEffect(act);
			}
		}
		break;
	}
}
const actHeader ActTosenbou = {
	WAZACHR_ID_HUUINBATSU,
	WAZACHR_ID_HUUINBATSU,
	&WazaOamDataNormal[3],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	TosenbouActInit,
};









//=========================================================================
//
//		かぎわける
//														TAYA 2002.07.26
//=========================================================================
#define KAGIWAKE_HABA  (24)
#define KAGIWAKE_COUNT_WORK (0)
#define KAGIWAKE_COS_SPEED  (16)
static void TaskKagiwakeruMain(u8 id);
static void KagiwakeActMove(actWork *act);

//========================================
// ﾜｰｸ設定不要
//========================================
void TaskKagiwakeru(u8 id)
{
	s16 num1, num2;

	if(ContestCheck()){
		DelTaskEffect(id);
		return;
	}

	num1 = W_PokeZanzouMake(1);
	if(num1 < 0){
		DelTaskEffect(id);
		return;
	}
	num2 = W_PokeZanzouMake(1);
	if(num2 < 0){
		W_PokeZanzouDel(&ActWork[num1]);
		DelTaskEffect(id);
		return;
	}

	ActWork[num2].dx += KAGIWAKE_HABA;
	ActWork[num1].dx -= KAGIWAKE_HABA;
	ActWork[num2].work[0] = 0;
	ActWork[num1].work[0] = 0;
	ActWork[num2].work[1] = 0;
	ActWork[num1].work[1] = 0;
	ActWork[num2].work[2] = 0;
	ActWork[num1].work[2] = 0;

	ActWork[num2].work[3] = KAGIWAKE_COS_SPEED;
	ActWork[num1].work[3] = -KAGIWAKE_COS_SPEED;
	ActWork[num2].work[4] = 0;   // CosMove
	ActWork[num1].work[4] = 128; // CosMove
	ActWork[num2].work[5] = KAGIWAKE_HABA;
	ActWork[num1].work[5] = KAGIWAKE_HABA;

	ActWork[num2].work[6] = id;
	ActWork[num1].work[6] = id;
	ActWork[num2].work[7] = KAGIWAKE_COUNT_WORK;
	ActWork[num1].work[7] = KAGIWAKE_COUNT_WORK;

	TaskTable[id].work[KAGIWAKE_COUNT_WORK] = 2;

	ActWork[num2].banish = 0;
	ActWork[num1].banish = 1;

	ActWork[num2].oamData.ObjMode = 0;
	ActWork[num1].oamData.ObjMode = 0;
	ActWork[num2].move = KagiwakeActMove;
	ActWork[num1].move = KagiwakeActMove;

	TaskTable[id].TaskAdrs = TaskKagiwakeruMain;
}
static void TaskKagiwakeruMain(u8 id)
{
	if(TaskTable[id].work[KAGIWAKE_COUNT_WORK] == 0){
		DelTaskEffect(id);
	}
}
static void KagiwakeActMove(actWork *act)
{
	if(++(act->work[1]) > 1){
		act->work[1] = 0;
		act->banish ^= 1;
	}

	act->work[4] += act->work[3];
	act->work[4] &= 0xff;
	act->dx = CosMove(act->work[4],act->work[5]);

	switch(act->work[0]){
	case 0:
		if(++(act->work[2]) == 60){
			act->work[2] = 0;
			act->work[0]++;
		}
		break;

	case 1:
		if(++(act->work[2]) > 0){
			act->work[2] = 0;
			act->work[5] -=  2;
			if(act->work[5]<0){
				TaskTable[act->work[6]].work[act->work[7]]--;
				W_PokeZanzouDel(act);
			}
		}
	}
}


// =================================================================
// TaskOngaeshiCheck
// 概要  : おんがえし分岐チェック
// 引数  : no
// 戻り値: none
// =================================================================
void TaskOngaeshiCheck(u8 no)
{
	WazaEffWork[7] = 0;
	if(WazaEffNatukido<=60)								WazaEffWork[7] = 0;
	if(WazaEffNatukido>60 && WazaEffNatukido<=91)		WazaEffWork[7] = 1;
	if(WazaEffNatukido>91 && WazaEffNatukido<=200)		WazaEffWork[7] = 2;
	if(WazaEffNatukido>200)								WazaEffWork[7] = 3;
	
	DelTaskEffect(no);
}










//=========================================================================
//
//		よこどり
//				相手の横を通過した時にWazaEffWork[7]に0xffffを入れる
//												by matsuda 2002.07.29(月)
//=========================================================================
//----------------------------------------------------------
//	offset なし
//----------------------------------------------------------
#define YOKODORI_SP		0x0800
void YokodoriTask(u8 id)
{
	u8 poke, dmmyact;
	s16 x,y,xpos;
	u32 personal_rnd, id_no;
	u16 monsno;
	u8 muki,pri;
	
	switch(TaskTable[id].work[0]){
		case 0:		//攻撃ポケモンを画面外へ移動
			poke = W_GetPokeActNo(0);
			TaskTable[id].work[1] += YOKODORI_SP;
			if(MineEnemyCheck(AttackNo) == SIDE_MINE)
				ActWork[poke].dx += TaskTable[id].work[1] >> 8;
			else
				ActWork[poke].dx -= TaskTable[id].work[1] >> 8;
			TaskTable[id].work[1] &= 0x00ff;
			xpos = ActWork[poke].x + ActWork[poke].dx;
			if(xpos > 240+32 || xpos < -32){
				TaskTable[id].work[1] = 0;
				TaskTable[id].work[0]++;
			}
			break;
		case 1:		//相手側に出る自分のｱｸﾀｰをｾｯﾄ
			if(ContestCheck()){
				personal_rnd = conpara->personal_rnd;
				id_no = conpara->id_no;
				monsno = conpara->monsno;
				pri = GetPokeSoftPri(AttackNo);
				muki = 0;
				x = -32;
				y = GetWazaEffPos(DefenceNo, EFF_Y);
			}
			else if(MineEnemyCheck(AttackNo) == SIDE_MINE){
				personal_rnd = PokeParaGet(&PokeParaMine[SelMonsNo[AttackNo]], 
					ID_personal_rnd);
				id_no = PokeParaGet(&PokeParaMine[SelMonsNo[AttackNo]], ID_id_no);
				if(Climem[AttackNo].hensin_monsno == 0)
					monsno = PokeParaGet(&PokeParaMine[SelMonsNo[AttackNo]], ID_monsno);
				else
					monsno = Climem[AttackNo].hensin_monsno;
				pri = ActWork[W_GetPokeActNo(1)].pri + 1;
				muki = 0;
				x = 240+32;
				y = GetWazaEffPos(DefenceNo, EFF_Y);
			}
			else{
				personal_rnd = PokeParaGet(&PokeParaEnemy[SelMonsNo[AttackNo]], 
					ID_personal_rnd);
				id_no = PokeParaGet(&PokeParaEnemy[SelMonsNo[AttackNo]], ID_id_no);
				if(Climem[AttackNo].hensin_monsno == 0)
					monsno = PokeParaGet(&PokeParaEnemy[SelMonsNo[AttackNo]], ID_monsno);
				else
					monsno = Climem[AttackNo].hensin_monsno;
				pri = ActWork[W_GetPokeActNo(1)].pri - 1;
				muki = 1;
				x = -32;
				y = GetWazaEffPos(DefenceNo, EFF_Y);
			}
			dmmyact = WazaEffPokeActSet(monsno, muki, 0, x, y, pri, personal_rnd,id_no);
			if(Climem[AttackNo].hensin_monsno != 0)
				SoftFade(ActWork[dmmyact].oamData.Pltt*16+16*16, 16, HENSIN_EVY, 0x7fff);
			TaskTable[id].work[15] = dmmyact;
			TaskTable[id].work[0]++;
			break;
		case 2:		//相手側を横切る
			dmmyact = TaskTable[id].work[15];
			TaskTable[id].work[1] += YOKODORI_SP;
			if(MineEnemyCheck(AttackNo) == SIDE_MINE)
				ActWork[dmmyact].dx -= TaskTable[id].work[1] >> 8;
			else
				ActWork[dmmyact].dx += TaskTable[id].work[1] >> 8;
			TaskTable[id].work[1] &= 0x00ff;
			xpos = ActWork[dmmyact].x + ActWork[dmmyact].dx;
			
			//相手の後ろを横切りチェック
			if(TaskTable[id].work[14] == 0){
				if(MineEnemyCheck(AttackNo)==SIDE_MINE){
					if(xpos < GetWazaEffPos(DefenceNo, EFF_X)){
						TaskTable[id].work[14]++;
						WazaEffWork[7] = (s16)0xffff;
					}
				}
				else{
					if(xpos > GetWazaEffPos(DefenceNo, EFF_X)){
						TaskTable[id].work[14]++;
						WazaEffWork[7] = (s16)0xffff;
					}
				}
			}
			
			if(xpos < -32 || xpos > 240+32){
				TaskTable[id].work[1] = 0;
				TaskTable[id].work[0]++;
			}
			break;
		case 3:		//自分側の位置にｽﾗｲﾄﾞｲﾝで戻る
			poke = W_GetPokeActNo(0);
			dmmyact = TaskTable[id].work[15];
			WazaEffPokeActDel(&ActWork[dmmyact]);
			if(MineEnemyCheck(AttackNo) == SIDE_MINE)
				ActWork[poke].dx = -ActWork[poke].x - 32;
			else
				ActWork[poke].dx = 240-ActWork[poke].x + 32;
			TaskTable[id].work[0]++;
			break;
		case 4:
			poke = W_GetPokeActNo(0);
			TaskTable[id].work[1] += YOKODORI_SP;
			if(MineEnemyCheck(AttackNo) == SIDE_MINE){
				ActWork[poke].dx += TaskTable[id].work[1] >> 8;
				if(ActWork[poke].dx+ActWork[poke].x >= GetWazaEffPos(AttackNo,EFF_X))
					ActWork[poke].dx = 0;
			}
			else{
				ActWork[poke].dx -= TaskTable[id].work[1] >> 8;
				if(ActWork[poke].dx+ActWork[poke].x <= GetWazaEffPos(AttackNo,EFF_X))
					ActWork[poke].dx = 0;
			}
			TaskTable[id].work[1] &= 0x00ff;
			
			if(ActWork[poke].dx == 0)
				DelTaskEffect(id);
			break;
	}
}

//----------------------------------------------------------
//	袋
//	offset なし
//		WazaEffWork[7]に0xffffが入ってくるまで待機してる
//----------------------------------------------------------
static void YokodoriFukuroInit(actWork *xreg);

const	actHeader YokodoriFukuroHeader={
	WAZACHR_ID_FUKURO3,
	WAZACHR_ID_FUKURO3,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	YokodoriFukuroInit,
};

#define YOKODORIFUKURO_SP_X			0x0100
#define YOKODORIFUKURO_ADDSEC		5
#define YOKODORIFUKURO_FURIHABA_Y	(-32)
static void YokodoriFukuroInit(actWork *xreg)
{
	switch(xreg->work[7]){
		case 0:
			if(WazaEffWork[7] == (s16)0xffff){
				SePlayPan(SE_W233, GetWazaEffSePan(WAZA_SE_R));
				xreg->y = GetWazaEffPos(DefenceNo, EFF_Y) + 16;
				xreg->work[0] = YOKODORIFUKURO_FURIHABA_Y;
				xreg->work[7]++;
				xreg->banish = 0;
				if(MineEnemyCheck(AttackNo) == SIDE_ENEMY && ContestCheck()==0)
					xreg->pri = ActWork[W_GetPokeActNo(1)].pri - 1;
			}
			else
				xreg->banish = 1;
			break;
		case 1:
			xreg->dy = SinMove(xreg->work[1], xreg->work[0]);
			xreg->work[1] += YOKODORIFUKURO_ADDSEC;
			if(xreg->work[1] > 127){
				xreg->work[0] /= 2;
				xreg->work[3]++;
				xreg->work[1] -= 127;
			}
			xreg->work[2] += YOKODORIFUKURO_SP_X;
			if(MineEnemyCheck(AttackNo) == SIDE_MINE)
				xreg->dx -= xreg->work[2] >> 8;
			else
				xreg->dx += xreg->work[2] >> 8;
			xreg->work[2] &= 0x00ff;
			
			if(xreg->work[3] == 2)
				DelWazaEffect(xreg);
	}
}



//=========================================================================
//	パーティアタック時のよこどり
//=========================================================================
#define YOKODORI_PARTY_SP	6
void YokodoriPartyMoveTask(u8 id)
{
	u8 poke;
	s16 st_x;
	s16 end_x;
	
	switch(TaskTable[id].work[15]){
		case 0:
			st_x = GetWazaEffPos(AttackNo, EFF_X);
			end_x = GetWazaEffPos(DefenceNo, EFF_X);
			TaskTable[id].work[0] = YOKODORI_PARTY_SP;
			if(st_x > end_x)
				TaskTable[id].work[0] *= -1;
			TaskTable[id].work[1] = st_x;
			TaskTable[id].work[2] = end_x;
			TaskTable[id].work[15]++;
			break;
		case 1:
			poke = PokemonStruct[AttackNo];
			ActWork[poke].dx += TaskTable[id].work[0];
			if(TaskTable[id].work[0] > 0){
				if(ActWork[poke].x+ActWork[poke].dx >= TaskTable[id].work[2])
					TaskTable[id].work[15]++;
			}
			else{
				if(ActWork[poke].x+ActWork[poke].dx <= TaskTable[id].work[2])
					TaskTable[id].work[15]++;
			}
			break;
		case 2:
			TaskTable[id].work[0] *= -1;
			TaskTable[id].work[15]++;
			break;
		case 3:
			poke = PokemonStruct[AttackNo];
			ActWork[poke].dx += TaskTable[id].work[0];
			if(TaskTable[id].work[0] < 0){
				if(ActWork[poke].x+ActWork[poke].dx <= TaskTable[id].work[1])
					TaskTable[id].work[15]++;
			}
			else{
				if(ActWork[poke].x+ActWork[poke].dx >= TaskTable[id].work[1])
					TaskTable[id].work[15]++;
			}
			break;
		case 4:
		default:
			poke = PokemonStruct[AttackNo];
			ActWork[poke].dx = 0;
			DelTaskEffect(id);
			break;
	}
}












//=========================================================================
//
//	フラフラダンス
//																	TAYA
//=========================================================================
#define FURA_ANGLE_ADD    (0xc0)
#define FURA_ANGLE_SYNC   (16)
#define FURA_XHOSEI       (1)

enum FURA_WORK {
	FURA_SEQ,
	FURA_TIMER,
	FURA_TIMER2,
	FURA_POKEACTNO,
	FURA_VEC,
	FURA_POKE_X,
	FURA_POKE_Y,
	FURA_DX,
	FURA_DY,
	FURA_SIN_POS,
	FURA_SIN_VEC,
	FURA_SIN_POS2,
	FURA_WAIT1,
	FURA_WAIT2,
};

static void TaskFurafuraDanceMain(u8 id);

void TaskFurafuraDance(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[FURA_POKEACTNO] = W_GetPokeActNo(0);
	my->work[FURA_VEC] = (MineEnemyCheck(AttackNo)==SIDE_MINE)? 1 : -1;
	my->work[FURA_POKE_Y] = ActWork[my->work[FURA_POKEACTNO]].y;
	my->work[FURA_POKE_X] = ActWork[my->work[FURA_POKEACTNO]].x;
	my->work[FURA_SIN_POS] = 0;
	my->work[FURA_SIN_POS2] = 0;
	my->work[FURA_SIN_VEC] = 1;

	my->work[FURA_WAIT1] = 0;

//	PokeKakusyukuInit(my->work[FURA_POKEACTNO], 0);

	my->TaskAdrs = TaskFurafuraDanceMain;
}
static void TaskFurafuraDanceMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[FURA_SEQ]){
	case 0:
		my->work[FURA_SIN_POS2] = (my->work[FURA_SIN_POS2] + 8) & 0xff;
		ActWork[my->work[FURA_POKEACTNO]].dx = (sin_cos_table[my->work[FURA_SIN_POS2]] >> 5);

		my->work[FURA_SIN_POS] = (my->work[FURA_SIN_POS] + 2) & 0xff;
		ActWork[my->work[FURA_POKEACTNO]].x = my->work[FURA_POKE_X] + ((sin_cos_table[my->work[FURA_SIN_POS]] >> 3)*my->work[FURA_VEC]);
		if(my->work[FURA_SIN_POS] == 0){
			ActWork[my->work[FURA_POKEACTNO]].x = my->work[FURA_POKE_X];
			my->work[FURA_SEQ]++;
		}
		break;

	case 1:
		my->work[FURA_SIN_POS2] = (my->work[FURA_SIN_POS2] + 8) & 0xff;
		ActWork[my->work[FURA_POKEACTNO]].dx = (sin_cos_table[my->work[FURA_SIN_POS2]] >> 5);
		if(my->work[FURA_SIN_POS2] == 0){
			ActWork[my->work[FURA_POKEACTNO]].dx = 0;
			my->work[FURA_SEQ]++;
		}
		break;

	case 2:
		DelTaskEffect(id);
		break;
	}
}



//=========================================================================
//  
//  はたきおとす
//
//														mori 2002.8.1
//=========================================================================

static void SeqWazaHatakiOtosuInit(actWork *Xreg);

const actAnm HatakiOtosuAnm0[]={
		{OBJ16_64x64*0,4,0,0},
		{OBJ16_64x64*1,4,0,0},
		{ACT_ANMEND,0,0,0}
};

const actAnm *const HatakiOtosuAnmTbl[]={
		HatakiOtosuAnm0,
};


static const actAffAnm	HatakiOtosuAff0[]={
	{0x100,0x100,0,ACT_AFSET},
	{0,0,-4,8},
	{ACT_AFEND,0,0,0},
};

static const actAffAnm	HatakiOtosuAff1[]={
	{-0x100,0x100,0,ACT_AFSET},
	{0,0,4,8},
	{ACT_AFEND,0,0,0},
};

static const actAffAnm *const HatakiOtosuAffTbl[]={
	HatakiOtosuAff0,
	HatakiOtosuAff1,
};

const actHeader ActHatakiOtosuHeader = {	//add matsuda 01/06/19
	WAZACHR_ID_HATAKU2,
	WAZACHR_ID_HATAKU2,
	&WazaOamDataAffine[3],
	HatakiOtosuAnmTbl,
	0,
//	DummyActAffTbl,
	HatakiOtosuAffTbl,
	SeqWazaHatakiOtosuInit,
};

static void SeqWazaHatakiOtosuMain(actWork *Xreg)
{
	
	if(MineEnemyCheck(DefenceNo) == SIDE_MINE){
		Xreg->work[1] += Xreg->work[0];
		Xreg->work[1] &= 0xff;
//		Xreg->dx--;
//		Xreg->dy++;
	}else{
		Xreg->work[1] += Xreg->work[0];
		Xreg->work[1] &= 0xff;
//		Xreg->dx++;
//		Xreg->dy++;
	}
	Xreg->dx = CosMove(Xreg->work[1],20);
	Xreg->dy = SinMove(Xreg->work[1],20);
	if(Xreg->anmend_sw){
//	if(Xreg->work[2] >200){
		DelWazaEffect(Xreg);
	}
	Xreg->work[2]++;
}
//----------------------------------------------------------
//	
//----------------------------------------------------------
static void SeqWazaHatakiOtosuInit(actWork *Xreg)
{
	if(MineEnemyCheck(DefenceNo) == SIDE_MINE)
	{
		Xreg->x-=WazaEffWork[0];
		Xreg->y+=WazaEffWork[1];
		Xreg->work[0] = -11;
		Xreg->work[1] = 0x40*3;
		ActAffAnmChg(Xreg,1);
//		ActAnmChg(Xreg,1);
	}else{
		Xreg->work[0] = 11;
		Xreg->work[1] = 0x40*3;
		Xreg->x+=WazaEffWork[0];
		Xreg->y+=WazaEffWork[1];
	}
	Xreg->move = SeqWazaHatakiOtosuMain;
}



















//=========================================================================
//  
//  リサイクル
//
//															TAYA
//=========================================================================
#define RECYCLE_YPOS_MIN  (16)

static void RecycleActMove(actWork *act);

static void RecycleActInit(actWork *act)
{
	act->x = GetWazaEffPos(AttackNo, PM_X);
	act->y = W_GetPokeSize(AttackNo, POKESIZE_TOP);
	if(act->y < RECYCLE_YPOS_MIN)
	{
		act->y = RECYCLE_YPOS_MIN;
	}
	act->work[6] = 0x00;  // eva
	act->work[7] = 0x10;  // evb
	act->move = RecycleActMove;

//	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL | BLD_OBJ_1ST;
	*(vu16*)REG_BLDALPHA = (act->work[7]<<8)|act->work[6];
}
static void RecycleActMove(actWork *act)
{
	switch(act->work[2]){
	case 0:
		if(++(act->work[0]) > 1)
		{
			act->work[0] = 0;
			if((act->work[1]&1)==0){
				if(act->work[6] < 0x10) { act->work[6]++; }
			}else{
				if(act->work[7]) { act->work[7]--; }
			}
			act->work[1]++;
			*(vu16*)REG_BLDALPHA = (act->work[7]<<8)|act->work[6];
			if(act->work[7] == 0x00)
			{
				act->work[2]++;
			}
		}
		break;

	case 1:
		if(++(act->work[0]) == 10)
		{
			act->work[0] = 0;
			act->work[1] = 0;
			act->work[2]++;
		}
		break;

	case 2:
		if(++(act->work[0]) > 1)
		{
			act->work[0] = 0;
			if((act->work[1]&1)==0){
				if(act->work[6]){ act->work[6]--; }
			}else{
				if(act->work[7] < 0x10){ act->work[7]++; }
			}
			act->work[1]++;
			*(vu16*)REG_BLDALPHA = (act->work[7]<<8)|act->work[6];
			if(act->work[7] == 0x10)
			{
				act->work[2]++;
			}
		}
		break;


	case 3:
		W_AffCheckEndSeq(act);
		break;
	}
}
static const actAffAnm	RecycleAffAnm[]={
	{0,0,-4,64},
	{ACT_AFLOOP,0,0,0},
};

static const actAffAnm *const RecycleAffTbl[]={
	RecycleAffAnm,
};

const actHeader RecycleHeader = {
	WAZACHR_ID_RECYCLE,
	WAZACHR_ID_RECYCLE,
	&WazaOamDataBldAffine[3],
	DummyActAnmTbl,
	0,
	RecycleAffTbl,
	RecycleActInit,
};


//=========================================================================
//  
//  ウェザーボール
//
//															mori
//=========================================================================
void TaskWeatherBallCheck(u8 no)
{
	WazaEffWork[7] = 0;	//なし
	if(WazaEffWeather&FIELD_CONDITION_HIDERING) 				WazaEffWork[7] = 1;
	else if(WazaEffWeather&FIELD_CONDITION_AMEHURI) 		WazaEffWork[7] = 2;
	else if(WazaEffWeather&FIELD_CONDITION_SUNAARASHIING) 	WazaEffWork[7] = 3;
	else if(WazaEffWeather&FIELD_CONDITION_ARARE) 			WazaEffWork[7] = 4;
	DelTaskEffect(no);
}









//=========================================================================
//
//		なまける
//																	taya
//=========================================================================
static void TaskNamakeruMain(u8 id);

static const actAffAnm NamakeruAffAnm[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x00,  0x10,  0,  4  },
	{-0x02,  0x00,  0,  8  },
	{ 0x00,  0x04,  0,  4  },
	{ 0x00,  0x00,  0, 24  },
	{ 0x01, -0x05,  0, 16  },
	{ACT_AFEND,0,0,0},
};

//==============================================
//	0（0:攻撃側 1:防御側）
//==============================================
void TaskNamakeru(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = 0;

	my->work[15] = W_GetPokeActNo(WazaEffWork[0]);

	SetPokeKakusyukuAnm(my, my->work[15], NamakeruAffAnm);
	TaskTable[id].TaskAdrs = TaskNamakeruMain;
}
static void TaskNamakeruMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0]++;
	if(my->work[0] > 16 && my->work[0] < 40){
		if(++(my->work[1]) > 2){
			my->work[1] = 0;
			my->work[2]++;
			if(my->work[2] & 1){
				ActWork[my->work[15]].dx = AKUBI_YOKOYURE_WIDTH;
			}else{
				ActWork[my->work[15]].dx = -AKUBI_YOKOYURE_WIDTH;
			}
		}
	}else{
		ActWork[my->work[15]].dx = 0;
	}

	if(!PokeKakusyukuAnm(&TaskTable[id])){
		DelTaskEffect(id);
	}
}
