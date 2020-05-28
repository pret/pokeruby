//=========================================================================
//	
//	ゴースト系 技エフェクト
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
#include "task.h"
#include "laster.h"
#include "cli_def.h"
#include "ef_tool.h"
#include "fight.h"
#include "palanm.h"
#include "contest.h"
#include "mus_tool.h"

//=========================================================================
//
//		あやしいひかり
//												by matsuda 2002.05.29(水)
//=========================================================================
static void AyasiiHikariInit(actWork *xreg);
static void AyasiiHikariMain(actWork *xreg);
static void AyasiiHikariEndWait(actWork *xreg);
static void AyasiiHikariBld(actWork *xreg);
static void AyasiiHikari2Init(actWork *xreg);
static void AyasiiHikari2Main(actWork *xreg);

#define AYASII_THETA		10
#define AYASIIHIKARI_AFF	30
#define AYASII_AFFLOOP		5
static const actAffAnm AyasiiHikariAff[] = 
{
	{ AYASIIHIKARI_AFF, AYASIIHIKARI_AFF, AYASII_THETA, AYASII_AFFLOOP},
	{-AYASIIHIKARI_AFF, -AYASIIHIKARI_AFF, AYASII_THETA, AYASII_AFFLOOP},
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm * const AyasiiHikariAffTbl[] = {
	AyasiiHikariAff,
};

const	actHeader AyasiiHikariHeader={
	WAZACHR_ID_AYASIIHIKARI,
	WAZACHR_ID_AYASIIHIKARI,
//	&WazaOamDataBldAffine2[1],
	&WazaOamDataAffine2[1],
	DummyActAnmTbl,
	0,
	AyasiiHikariAffTbl,
	AyasiiHikariInit,
};

//-- 最後クルクル回る動き --//
const	actHeader AyasiiHikari2Header={
	WAZACHR_ID_AYASIIHIKARI,
	WAZACHR_ID_AYASIIHIKARI,
	&WazaOamDataBldNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	AyasiiHikari2Init,
};

//----------------------------------------------------------
//	offset	0:Xoffset	1:Yoffset	2:X速度(固定少数)
//----------------------------------------------------------
#define AYASII_ADD_SEC	5
#define AYASII_FURIHABA_X	10
#define AYASII_FURIHABA_Y	15
#define AYASII_BLD_WAIT	0
static void AyasiiHikariInit(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[0] = WazaEffWork[2];
	xreg->work[1] = xreg->x;
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X);
	xreg->work[3] = xreg->y;
	xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y);
	//W_GetStraightSyncParam(xreg);
	W_GetStraightSpParam(xreg);
	xreg->move = AyasiiHikariMain;

	xreg->work[6] = 16;
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = xreg->work[6];
}

static void AyasiiHikariMain(actWork *xreg)
{
	s16 before, after;
	
	AyasiiHikariBld(xreg);

	if(W_ParallelSync(xreg)){
		xreg->move = AyasiiHikariEndWait;
		return;
	}
	
	xreg->dx += SinMove(xreg->work[5], AYASII_FURIHABA_X);
	xreg->dy += CosMove(xreg->work[5], AYASII_FURIHABA_Y);
	before = xreg->work[5];
	xreg->work[5] = 0xff & (xreg->work[5] + AYASII_ADD_SEC);
	after = xreg->work[5];
	if((before == 0 || before > 196) && (after > 0))
		SePlayPan(SE_W109, WazaEffPan);
}

static void AyasiiHikariEndWait(actWork *xreg)
{
	s16 before, after;

	xreg->work[0] = 1;
	W_ParallelSync(xreg);
	xreg->dx += SinMove(xreg->work[5], AYASII_FURIHABA_X);
	xreg->dy += CosMove(xreg->work[5], AYASII_FURIHABA_Y);
	before = xreg->work[5];
	xreg->work[5] = 0xff & (xreg->work[5] + AYASII_ADD_SEC);
	after = xreg->work[5];
	if((before == 0 || before > 196) && (after > 0))
		SePlay(SE_W109);
	
	if(xreg->work[6] == 0){
		xreg->banish = 1;
		xreg->move = W_BldClearEnd;
	}
	else
		AyasiiHikariBld(xreg);
}

//-- 「あやしいひかり」でのBLD計算 --//
static void AyasiiHikariBld(actWork *xreg)
{
	if(xreg->work[6] >= 0x0100){	//消えてる時間を少し長くするようにｳｪｲﾄを入れる
		xreg->work[6]++;
		if(xreg->work[6] == 0x0100+13)
			xreg->work[6] = 0;
		return;
	}
	
	if((xreg->work[7]++ & 0xff) == AYASII_BLD_WAIT)
	{
		xreg->work[7] &= 0xff00;
		if(xreg->work[7] & 0x0100)
			xreg->work[6]++;
		else
			xreg->work[6]--;
		*(vu16*)REG_BLDALPHA = ((16-xreg->work[6])<<8) | xreg->work[6];
		if(xreg->work[6] == 0 || xreg->work[6] == 16)
			xreg->work[7] ^= 0x0100;
		if(xreg->work[6] == 0)
			xreg->work[6] = 0x0100;
	}
}

//----------------------------------------------------------
//	offset	0:Xoffset	1:Yoffset
//----------------------------------------------------------
#define AYASII_KURU_FURIHABA_X		32
#define AYASII_KURU_FURIHABA_Y		8
#define AYASII_KURU_SEC				19
#define AYASII_KURU_ENDWAIT			60
#define AYASII_KURU_DY				0x0050
static void AyasiiHikari2Init(actWork *xreg)
{
	WazaDefaultPosSet1(xreg, PM_MODE);
	xreg->move = AyasiiHikari2Main;
	xreg->move(xreg);
}

static void AyasiiHikari2Main(actWork *xreg)
{
	xreg->dx = SinMove(xreg->work[0], AYASII_KURU_FURIHABA_X);
	xreg->dy = CosMove(xreg->work[0], AYASII_KURU_FURIHABA_Y);
	if(xreg->work[0] > 64 && xreg->work[0] < 196)	//ﾎﾟｹﾓﾝの後ろに回す
		xreg->oamData.Priority = 2;
	else
		xreg->oamData.Priority = 1;
	
	xreg->work[0] = 0xff & (xreg->work[0] + AYASII_KURU_SEC);
	
	xreg->work[2] += AYASII_KURU_DY;
	xreg->dy += xreg->work[2] >> 8;
	
	if(xreg->work[7]++ == AYASII_KURU_ENDWAIT)
		DelWazaEffect(xreg);
}









//=========================================================================
//
//		ナイトヘッド
//												by matsuda 2002.03.19(火)
//=========================================================================
static void NightHeadMain(u8 id);
static void NightHeadPut(u8 id);
//----------------------------------------------------------
//	offset 0:縮小開始までのwait
//----------------------------------------------------------
#define NIGHT_DEFAULT_RATHIO	(0x80)	//初期Affine値
#define NIGHT_ADD_RATHIO		(0x8)	//毎Sync減算していくAffine値

void NightHeadTask(u8 id)
{
	u8 pokeact;
	
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;// | BLD_BG1_1ST;
	*(vu16*)REG_BLDALPHA = 16 << 8;
	pokeact = W_GetPokeActNo(0);
	PokeKakusyukuInit(pokeact, 1);
	PokeKakusyukuSet(pokeact, NIGHT_DEFAULT_RATHIO, NIGHT_DEFAULT_RATHIO, 0);
	ActWork[pokeact].banish = 0;	//BG落としﾙｰﾁﾝで消されてるので
	TaskTable[id].work[0] = NIGHT_DEFAULT_RATHIO;
	TaskTable[id].work[1] = WazaEffWork[0];
	TaskTable[id].work[2] = 0;		//eva
	TaskTable[id].work[3] = 16;		//evb
	TaskTable[id].TaskAdrs = NightHeadPut;
}

static void NightHeadPut(u8 id)
{
	if(++TaskTable[id].work[10] == 3)
	{
		TaskTable[id].work[10] = 0;
		TaskTable[id].work[2]++;
		TaskTable[id].work[3]--;
		*(vu16*)REG_BLDALPHA = (TaskTable[id].work[3] << 8) | TaskTable[id].work[2];
		if(TaskTable[id].work[2] == 9)
			TaskTable[id].TaskAdrs = NightHeadMain;
	}
}

static void NightHeadMain(u8 id)
{
	u8 pokeact;
	
	if(TaskTable[id].work[1] > 0){
		TaskTable[id].work[1]--;
		return;
	}
	
	pokeact = W_GetPokeActNo(0);
	TaskTable[id].work[0] += NIGHT_ADD_RATHIO;
	if(TaskTable[id].work[0] < 0x100)
		PokeKakusyukuSet(pokeact, TaskTable[id].work[0], TaskTable[id].work[0], 0);
	else{
		PokeKakusyukuEnd(pokeact);
		DelTaskEffect(id);
		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDALPHA = 0;
	}
}












//=========================================================================
//
//		シャドーボール
//												by matsuda 2002.03.20(水)
//=========================================================================
static void ShadowBallActInit(actWork *act);
static void ShadowBallActMove(actWork *act);

static const actAffAnm ShadowBallAff[] = 
{
	{ 0, 0, 10, 1},
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm * const ShadowBallAffTbl[] = {
	ShadowBallAff,
};
const	actHeader ShadowBallHeader={
	WAZACHR_ID_SHADOWBALL,
	WAZACHR_ID_SHADOWBALL,
	&WazaOamDataAffine[2],
	DummyActAnmTbl,
	0,
	ShadowBallAffTbl,
//	W_StraightMoveInit,
	ShadowBallActInit,
};

//====================================================
//  0:攻撃→中間までのsync   1:中間でのwait
//  2:中間→防御までのsync
//====================================================
static void ShadowBallActInit(actWork *act)
{
	s16 ex,ey;

	ex = act->x;
	ey = act->y;
	act->x = GetWazaEffPos(AttackNo,PM_X);
	act->y = GetWazaEffPos(AttackNo,PM_Y);

	act->work[0] = 0;
	act->work[1] = WazaEffWork[0];
	act->work[2] = WazaEffWork[1];
	act->work[3] = WazaEffWork[2];

	act->work[4] = act->x << 4;
	act->work[5] = act->y << 4;
	act->work[6] = ((ex-act->x)<<4)/(WazaEffWork[0]*2);
	act->work[7] = ((ey-act->y)<<4)/(WazaEffWork[0]*2);

	act->move = ShadowBallActMove;
}
static void ShadowBallActMove(actWork *act)
{
	switch(act->work[0]){
	case 0:
		act->work[4]+=act->work[6];
		act->work[5]+=act->work[7];
		act->x = act->work[4]>>4;
		act->y = act->work[5]>>4;
		if(--(act->work[1])<=0)
		{
			act->work[0]++;
		}
		break;

	case 1:
		if(--(act->work[2])<=0){
			act->work[1] = GetWazaEffPos(DefenceNo,PM_X);
			act->work[2] = GetWazaEffPos(DefenceNo,PM_Y);
			act->work[4] = act->x << 4;
			act->work[5] = act->y << 4;
			act->work[6] = ((act->work[1]-act->x)<<4) / act->work[3];
			act->work[7] = ((act->work[2]-act->y)<<4) / act->work[3];
			act->work[0]++;
		}
		break;

	case 2:
		act->work[4]+=act->work[6];
		act->work[5]+=act->work[7];
		act->x = act->work[4]>>4;
		act->y = act->work[5]>>4;
		if(--(act->work[3])<=0)
		{
			act->x = GetWazaEffPos(DefenceNo,PM_X);
			act->y = GetWazaEffPos(DefenceNo,PM_Y);
			act->work[0]++;
		}
		break;


	case 3:
		W_AffCheckEndSeq(act);
		break;
	}
}










//=========================================================================
//
//		したでなめる
//												by matsuda 2002.03.20(水)
//=========================================================================
static void SitadeNameruSeq(actWork *xreg);
static void SitadeNameruMain(actWork *xreg);

#define SITA_ANMWAIT	2
static const actAnm SitaAnm0[]={
	{OBJ16_16x32*0, SITA_ANMWAIT, 0,0},
	{OBJ16_16x32*1, SITA_ANMWAIT, 0,0},
	{OBJ16_16x32*2, SITA_ANMWAIT, 0,0},
	{OBJ16_16x32*3, SITA_ANMWAIT, 0,0},
	{OBJ16_16x32*4, SITA_ANMWAIT, 0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const SitaAnmTbl[]={
	SitaAnm0,
};
const	actHeader SitadeNameruHeader={
	WAZACHR_ID_SITA,
	WAZACHR_ID_SITA,
	&WazaOamDataNormal[10],
	SitaAnmTbl,
	0,
	DummyActAffTbl,
	SitadeNameruSeq,
};

//----------------------------------------------------------
//	offset	0:Xoffset	1:Yoffset
//----------------------------------------------------------
#define SITA_TENMETU_WAIT	2
#define SITA_NEXT_WAIT		5	//何回点滅させたら次の点滅間隔に進むか
static void SitadeNameruSeq(actWork *xreg)
{
	WazaDefaultPosSet1(xreg, PM_MODE);
	xreg->move = SitadeNameruMain;
}

static void SitadeNameruMain(actWork *xreg)
{
	u8 next_flg = 0, end_flg = 0;
	
	if(xreg->anmend_sw == 0)
		return;
	
	if(xreg->banish == 0)
		xreg->banish = 1;
		
	switch(xreg->work[0]){
		case 0:
			if(xreg->work[1] == SITA_TENMETU_WAIT*1)
				next_flg++;
			break;
		case 1:
			if(xreg->work[1] == SITA_TENMETU_WAIT*2)
				next_flg++;
			break;
/*		case 2:
			if(xreg->work[1] == SITA_TENMETU_WAIT*3)
				next_flg++;
			break;
*/
		default:
			end_flg++;
	}
	
	if(next_flg){
		xreg->banish ^= 1;
		xreg->work[2]++;
		xreg->work[1] = 0;
		if(xreg->work[2] == SITA_NEXT_WAIT){
			xreg->work[2] = 0;
			xreg->work[0]++;
		}
	}else if(end_flg)
		DelWazaEffect(xreg);
	else
		xreg->work[1]++;
}



//=========================================================================
//
//		あくむ
//																	TAYA
//=========================================================================
#define AKUMU_ZANZOU_MOVE_SYNC  (80)
#define AKUMU_ZANZOU_AX  (-0x90)
#define AKUMU_ZANZOU_AY  (0x70)

static void TaskAkumuMain(u8 id);

//==============================================
//	初期化タスク（ワーク初期化不要）
//==============================================
void TaskAkumu(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = W_PokeZanzouMake(1);  // 0:残像ｱｸﾀｰﾅﾝﾊﾞ
	if(my->work[0] < 0){
		DelTaskEffect(id);
		return;
	}

	my->work[1] = 0;                    // 1:ｶｳﾝﾀ
	my->work[2] = 0x0f;                 // 2:eva
	my->work[3] = 0x02;                 // 3:evb
	my->work[4] = 0;                    // 4:終了ﾌﾗｸﾞ

	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = (my->work[3] << 8) | my->work[2];


	ActWork[my->work[0]].work[0] = AKUMU_ZANZOU_MOVE_SYNC;
	if(MineEnemyCheck(DefenceNo) == SIDE_MINE){
		ActWork[my->work[0]].work[1] = AKUMU_ZANZOU_AX;
		ActWork[my->work[0]].work[2] = AKUMU_ZANZOU_AY;
	}else{
		ActWork[my->work[0]].work[1] = -AKUMU_ZANZOU_AX;
		ActWork[my->work[0]].work[2] = -AKUMU_ZANZOU_AY;
	}

	ActWork[my->work[0]].work[3] = 0;
	ActWork[my->work[0]].work[4] = 0;

	SetWorkSeq(&(ActWork[my->work[0]]), DummyActMove);
	ActWork[my->work[0]].move = W_ParallelMove2Seq;

	my->TaskAdrs = TaskAkumuMain;
}
//==============================================
//	メインタスク
//==============================================
static void TaskAkumuMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[4]){
	case 0:
		// 半透明度更新
		my->work[1]++;
		my->work[5] = my->work[1] & 3;
		if(my->work[5] == 1){
			if(my->work[2] > 0){ my->work[2]--; }
		}
		if(my->work[5] == 3){
			if(my->work[3] < 0x10){ my->work[3]++; }
		}
		*(vu16*)REG_BLDALPHA = (my->work[3] << 8) | my->work[2];

		if(my->work[2] == 0x00 && my->work[3] == 0x10){
			if(my->work[1] > AKUMU_ZANZOU_MOVE_SYNC){
				W_PokeZanzouDel(&ActWork[my->work[0]]);
				my->work[4] = 1;
			}
		}
		break;

	case 1:
		// 残像が消えるまで
		if(++(my->work[6]) > 1){
			*(vu16*)REG_BLDCNT = 0;
			*(vu16*)REG_BLDALPHA = 0;
			my->work[4]++;
		}
		break;

	case 2:
		DelTaskEffect(id);
		break;
	}

}


//=========================================================================
//
//		うらみ
//																	TAYA
//=========================================================================
#define URAMI_EVA_MIN  (0)
#define URAMI_EVB_MAX  (0x10)
#define URAMI_PALID    (WAZACHR_ID_SPOON)  // ﾊﾞｯﾃｨﾝｸﾞしなさそうなIDを適当に使用

static void TaskUramiInit(u8 id);
static void TaskUramiMain(u8 id);
static void TaskUramiQuit(u8 id);

//==============================================
//	初期化タスク
//（防御側ポケモンＢＧ落とし後に使用）
//==============================================
void TaskUrami(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[15] = 0;
	my->TaskAdrs = TaskUramiInit;
	my->TaskAdrs(id);
}
static void TaskUramiInit(u8 id)
{
	u8 bgno;
	TASK_TABLE *my = &TaskTable[id];

	bgno = GetPokeBGNo(DefenceNo);

	switch(my->work[15]){
	case 0:
		my->work[14] = ObjPalNumSet(URAMI_PALID);  // 14:残像用ﾊﾟﾚｯﾄﾅﾝﾊﾞ
		if(my->work[14] == 0xff){
			DelTaskEffect(id);
			return;
		}
		my->work[0] = W_PokeZanzouMake(1);  // 0:残像ｱｸﾀｰﾅﾝﾊﾞ
		if(my->work[0] < 0){
			ObjPalRegNumDel(URAMI_PALID);
			DelTaskEffect(id);
			return;
		}
		ActWork[my->work[0]].oamData.Pltt = my->work[14];
		ActWork[my->work[0]].oamData.ObjMode = 0;
		ActWork[my->work[0]].oamData.Priority = 3;//bgno+1;  // BGの下にしておく

		my->work[1] = 0;                    // 1:ｶｳﾝﾀ
		my->work[2] = 0x00;                 // 2:eva
		my->work[3] = 0x10;                 // 3:evb
		my->work[13] = W_GetPokeActNo(1);   //13:ﾎﾟｹﾓﾝｱｸﾀｰﾅﾝﾊﾞ
		my->work[4] = (ActWork[my->work[13]].oamData.Pltt+16)*16;  // 4:ﾎﾟｹﾓﾝﾊﾟﾚｯﾄﾅﾝﾊﾞ

		if(bgno == 1){
			*(vu16*)REG_DISPCNT &= (~DISP_BG1_ON);
		}else{
			*(vu16*)REG_DISPCNT &= (~DISP_BG2_ON);
		}

		break;

	case 1:
		my->work[14] = (my->work[14] + 16) * 16;
		CpuCopy(&PaletteWork[my->work[4]], &PaletteWorkTrans[my->work[14]], 0x20, 32);
		SoftFade(my->work[4], 16, 0x0a, 0x3c0d);
		break;

	case 2:
		{
			s16 startline;

			startline = ActWork[my->work[13]].y + ActWork[my->work[13]].dy - 32;
			if(startline < 0){
				startline = 0;
			}
			if(bgno == 1){
				my->work[10] = LasterScrollSet(startline,startline+64, 2, 6, 0, LS_BG1H, LS_HOSEI_ON);
			}else{
				my->work[10] = LasterScrollSet(startline,startline+64, 2, 6, 0, LS_BG2H, LS_HOSEI_ON);
			}
		}
		break;

	case 3:
		if(bgno == 1){
			*(vu16*)REG_BLDCNT = BLD_BG1_1ST | BLD_A_BLEND_MODE | BLD_2ND_ALL;
		}else{
			*(vu16*)REG_BLDCNT = BLD_BG2_1ST | BLD_A_BLEND_MODE | BLD_2ND_ALL;
		}
		*(vu16*)REG_BLDALPHA = 0x1000;
		break;

	case 4:
		if(bgno == 1){
			*(vu16*)REG_DISPCNT |= DISP_BG1_ON;
		}else{
			*(vu16*)REG_DISPCNT |= DISP_BG2_ON;
		}
		my->TaskAdrs = TaskUramiMain;
		break;
	}

	my->work[15]++;
}

//==============================================
//	メインタスク
//==============================================
static void TaskUramiMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	// 半透明度更新
	my->work[1]++;
	my->work[5] = my->work[1] & 1;
	if(my->work[5] == 0){
		my->work[2] = (sin_cos_table[my->work[1]] / 18);
	}
	if(my->work[5] == 1){
		my->work[3] = URAMI_EVB_MAX - (sin_cos_table[my->work[1]] / 18);
	}
	*(vu16*)REG_BLDALPHA = (my->work[3] << 8) | my->work[2];

	if(my->work[1] == 128){
		my->work[15] = 0;
		my->TaskAdrs = TaskUramiQuit;
		my->TaskAdrs(id);
	}
}
//==============================================
//	終了タスク
//==============================================
static void TaskUramiQuit(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	u8 bgno = GetPokeBGNo(DefenceNo);

	switch(my->work[15]){
	case 0:
		LasterSys.TransType=LASTER_END;
		my->work[14] = W_GetPokeActNo(1);
		if(bgno == 1){
			*(vu16*)REG_DISPCNT &= (~DISP_BG1_ON);
		}else{
			*(vu16*)REG_DISPCNT &= (~DISP_BG2_ON);
		}
		break;

	case 1:
		SoftFade(my->work[4], 16, 0x00, 0x3c0d);
		break;

	case 2:
		ActWork[my->work[14]].banish = 1;
		W_PokeZanzouDel(&ActWork[my->work[0]]);
		ObjPalRegNumDel(URAMI_PALID);

		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDALPHA = 0;

		if(bgno == 1){
			*(vu16*)REG_DISPCNT |= DISP_BG1_ON;
		}else{
			*(vu16*)REG_DISPCNT |= DISP_BG2_ON;
		}

		DelTaskEffect(id);

	}

	my->work[15]++;
}



//=========================================================================
//
//	みちずれ（影アクター動作）
//																	TAYA
//=========================================================================
#define MITIZURE_DECIMAL_BIT  (4)

static void MitizureInitSeq(actWork *act);
static void MitizureActMove(actWork *act);

static const actAffAnm MitizureAffAnm[] = 
{
	{ 0x200, 0x200, 0, ACT_AFSET },
	{ ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm * const MitizureAffAnmTbl[] = {
	MitizureAffAnm,
};

const actHeader ActMitizureHeader={
	WAZACHR_ID_MITIZURE,
	WAZACHR_ID_MITIZURE,
//	&WazaOamDataBldNormal[6],
//	&WazaOamDataNormal[6],
	&WazaOamDataBldNormal[7],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	MitizureInitSeq,
};

//==============================================
//	初期化
//	0:(0:攻撃側→防御側  1:防御側→攻撃側）
//	1:何syncかけて移動するか？
//==============================================
static void MitizureInitSeq(actWork *act)
{
	s16  sx, sy, ex, ey, dif_x, dif_y;

	if(WazaEffWork[0] == 0){
		sx = GetWazaEffPos(AttackNo, EFF_X);
		sy = GetWazaEffPos(AttackNo, EFF_Y) + 28;
		ex = GetWazaEffPos(DefenceNo, EFF_X);
		ey = GetWazaEffPos(DefenceNo, EFF_Y) + 28;
	}else{
		sx = GetWazaEffPos(DefenceNo, EFF_X);
		sy = GetWazaEffPos(DefenceNo, EFF_Y) + 28;
		ex = GetWazaEffPos(AttackNo, EFF_X);
		ey = GetWazaEffPos(AttackNo, EFF_Y) + 28;
	}

	dif_x = ex - sx;
	dif_y = ey - sy;

	act->work[0] = sx << MITIZURE_DECIMAL_BIT;
	act->work[1] = sy << MITIZURE_DECIMAL_BIT;
	act->work[2] = (dif_x << MITIZURE_DECIMAL_BIT) / WazaEffWork[1];
	act->work[3] = (dif_y << MITIZURE_DECIMAL_BIT) / WazaEffWork[1];
	act->work[4] = WazaEffWork[1];
	act->work[5] = ex;
	act->work[6] = ey;
	act->work[7] = act->work[4] / 2;

	act->oamData.Priority = 2;
	act->x = sx;
	act->y = sy;
	act->move = MitizureActMove;
	act->banish = 1;

#if 0
	{
		// 白だと見えづらいため、一時的に色を変える
		u16 palno = ObjPalNumGet(WAZACHR_ID_MITIZURE);
		palno = 256 + palno*16 + 1;
		PaletteWorkTrans[palno] = 0x44e0;
		PaletteWorkTrans[palno+1] = 0x3cc0;

	}
#endif

}
static void MitizureActMove(actWork *act)
{
	if(act->work[4]){
//		act->banish = !(act->banish);
		act->work[0] += act->work[2];
		act->work[1] += act->work[3];
		act->x = (act->work[0] >> MITIZURE_DECIMAL_BIT);
		act->y = (act->work[1] >> MITIZURE_DECIMAL_BIT);
		act->work[4]--;
		if(act->work[4] == 0){
			act->work[0] = 0;
//			act->oamData.ObjMode = 1;
		}
//	}else{
//		act->banish = !(act->banish);
//		if(++(act->work[0]) == 64){
//			W_AffCheckEndSeq(act);
//			DelWazaEffect(act);
//		}
//		DelWazaEffect(act);
	}
}



//==============================================
//	攻撃側→敵全員に影を飛ばす
//	0:何syncかけて移動するか？
//==============================================
static void TaskMitizureShadowMain(u8 id);

void TaskMitizureShadow(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	s16 x, y, ex, ey, i;
	u8 no;

	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = 0x1000;

	my->work[5] = 0;
	my->work[6] = 0;
	my->work[7] = 0;
	my->work[8] = 0x00;  // 8:eva
	my->work[9] = 0x10;  // 9:evb
	my->work[10] = WazaEffWork[0];  // 10:ｶｳﾝﾀｰ

	x = GetWazaEffPos(AttackNo, PM_X);
	y = W_GetPokeSize(AttackNo, POKESIZE_BOTTOM);

	// バトル時は、攻撃ﾎﾟｹ以外全部をﾁｪｯｸ
	if(ContestCheck() == 0){
		for(i = 0; i < 4; i++)
		{
			if(i == AttackNo){ continue; }
			if(i == (AttackNo^2)){ continue; }
			if(PokeBG2taimeCheck(i))
			{
				no = AddActor(&ActMitizureHeader, x, y, CAI_POKE2PRI+5); // どのﾎﾟｹﾓﾝよりも低いﾌﾟﾗｲｵﾘﾃｨ
				if(no != ACT_MAX)
				{
					ex = GetWazaEffPos(i, PM_X);
					ey = W_GetPokeSize(i, POKESIZE_BOTTOM);
					ActWork[no].work[0] = x << 4;
					ActWork[no].work[1] = y << 4;
					ActWork[no].work[2] = ((ex-x)<<4) / WazaEffWork[1];
					ActWork[no].work[3] = ((ey-y)<<4) / WazaEffWork[1];
					ActWork[no].work[4] = WazaEffWork[1];
					ActWork[no].work[5] = ex;
					ActWork[no].work[6] = ey;
	//				ActWork[no].work[7] = act->work[4] / 2;
					ActWork[no].move = MitizureActMove;

					my->work[13+my->work[12]] = no;  // 13～:ｱｸﾀｰﾅﾝﾊﾞｰ
					my->work[12]++;  // 12:ｱｸﾀｰｶｳﾝﾀ
				}
			}
		}
	// ｺﾝﾃｽﾄ時は、仮想敵位置に１つだけ飛ばす
	}else{
			no = AddActor(&ActMitizureHeader, x, y, CAI_POKE2PRI+5); // どのﾎﾟｹﾓﾝよりも低いﾌﾟﾗｲｵﾘﾃｨ
			if(no != ACT_MAX)
			{
				ex = CON_DEFENCE_X;
				ey = CON_DEFENCE_Y;
				ActWork[no].work[0] = x << 4;
				ActWork[no].work[1] = y << 4;
				ActWork[no].work[2] = ((ex-x)<<4) / WazaEffWork[1];
				ActWork[no].work[3] = ((ey-y)<<4) / WazaEffWork[1];
				ActWork[no].work[4] = WazaEffWork[1];
				ActWork[no].work[5] = ex;
				ActWork[no].work[6] = ey;
				ActWork[no].move = MitizureActMove;

				my->work[13] = no;  // 13～:ｱｸﾀｰﾅﾝﾊﾞｰ
				my->work[12] = 1;
			}
	}

	my->TaskAdrs = TaskMitizureShadowMain;
}
static void TaskMitizureShadowMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		// 半透明度更新
		if(my->work[6]==0){
			if(++(my->work[5]) > 1){
				my->work[5] = 0;
				my->work[7]++;
				if(my->work[7]&1){
					if(my->work[8]<0x10){ my->work[8]++; }
				}else{
					if(my->work[9]){ my->work[9]--; }
				}
				*(vu16*)REG_BLDALPHA = (my->work[9]<<8)|my->work[8];
				if(my->work[7] >= 24){
					my->work[7] = 0;
					my->work[6] = 1;
				}
			}
		}
		// 影の移動待ち
		if(my->work[10]){
			my->work[10]--;
		}else{
			// 影の移動終了＆半透明更新も終了で次へ
			if(my->work[6]){
				my->work[0]++;
			}
		}
		break;

	case 1:
		// 半透明度更新
		if(++(my->work[5]) > 1)
		{
			my->work[5] = 0;
			my->work[7]++;
			if(my->work[7]&1){
				if(my->work[8]){ my->work[8]--; }
			}else{
				if(my->work[9]<0x10){ my->work[9]++; }
			}
			*(vu16*)REG_BLDALPHA = (my->work[9]<<8)|my->work[8];
			// 完全に透明で影ｱｸﾀｰ削除
			if(my->work[8]==0x00 && my->work[9] == 0x10)
			{
				u16 i;
				for(i = 0; i < my->work[12]; i++)
				{
					DelActor(&(ActWork[my->work[13+i]]));
				}
				my->work[0]++;
			}
		}
		break;

	case 2:
		if(++(my->work[5]) > 0){
			my->work[0]++;
		}
		break;

	case 3:
		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDALPHA = 0;

		DelTaskEffect(id);
		break;
	}
}











//=========================================================================
//
//		のろい
//												by matsuda 2002.05.21(火)
//=========================================================================
static void NoroiMain(u8 id);
static void NoroiPalFadeWait(u8 id);
static void KugiSeq(actWork *xreg);
static void KugiMain(actWork *xreg);
static void KugiFadeOut(actWork *xreg);
static void KugiFadeOutEnd(actWork *xreg);
static void DokuroSeq(actWork *xreg);
static void DokuroEndSeq(actWork *xreg);

//----------------------------------------------------------
//		画面をｳｨﾝﾄﾞｳで真っ黒にする
//	offset なし
//----------------------------------------------------------
#define NOROI_WIN_SYNC		16
void NoroiTask(u8 id)
{
	s16 LeftOffset, RightOffset, UpOffset, DownOffset;
	s16 default_x, default_y;
	
	Win0H = 0;
	Win0V = 0;
	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
	*(vu16*)REG_WINOUT = (WIN_ALL_ON << 8) | (WIN_ALL_ON ^ WIN_BLEND_ON);//BLEND無効
	*(vu16 *)REG_BLDCNT = BLD_BG3_1ST | BLD_DOWN_MODE;
	*(vu16 *)REG_BLDY = 16;		//ｳｨﾝﾄﾞｳの中は真っ黒にする
	
	if(MineEnemyCheck(AttackNo) || ContestCheck())	//左上から出す
		default_x = 40;
	else												//右上から出す
		default_x = 200;
	default_y = 40;
	
	Win0H = default_x | (default_x<<8);
	Win0V = default_y | (default_y<<8);
	
	LeftOffset = default_x - 0;
	RightOffset = 240 - default_x;
	UpOffset = default_y - 0;
	DownOffset = (160-8*6) - default_y;
	
	TaskTable[id].work[1] = LeftOffset;
	TaskTable[id].work[2] = RightOffset;
	TaskTable[id].work[3] = UpOffset;
	TaskTable[id].work[4] = DownOffset;
	TaskTable[id].work[5] = default_x;
	TaskTable[id].work[6] = default_y;
	TaskTable[id].TaskAdrs = NoroiMain;
}

static void NoroiMain(u8 id)
{
	s16 LeftOffset, RightOffset, UpOffset, DownOffset;
	s16 default_x, default_y;
	s16 sync;
	u16 LeftPos, RightPos, UpPos, DownPos;
	u16 haikei_pal;
	
	sync = TaskTable[id].work[0]++;
	LeftOffset = TaskTable[id].work[1];
	RightOffset = TaskTable[id].work[2];
	UpOffset = TaskTable[id].work[3];
	DownOffset = TaskTable[id].work[4];
	default_x = TaskTable[id].work[5];
	default_y = TaskTable[id].work[6];
	
	if(sync < NOROI_WIN_SYNC){
		LeftPos = default_x - ((double)LeftOffset / NOROI_WIN_SYNC * sync);
		RightPos = default_x + ((double)RightOffset / NOROI_WIN_SYNC * sync);
		UpPos = default_y - ((double)UpOffset / NOROI_WIN_SYNC * sync);
		DownPos = default_y + ((double)DownOffset / NOROI_WIN_SYNC * sync);
	}else{
		LeftPos = 0;
		RightPos = 240;
		UpPos = 0;
		DownPos = 160-8*6;
		
		//-- 釘を半透明処理が使えるようにﾊﾟﾚｯﾄ自体のﾌｪｰﾄﾞもしておく --//
		haikei_pal = GetBattleFadeBit(1,0,0,0,0,0,0);
		PaletteFadeReq(haikei_pal, 0,16,16,0x0000);
		TaskTable[id].TaskAdrs = NoroiPalFadeWait;
	}
	Win0H = (LeftPos<<8) | RightPos;
	Win0V = (UpPos<<8) | DownPos;
}

static void NoroiPalFadeWait(u8 id)
{
	if(FadeData.fade_sw == 0){
		//-- レジスタ等を元に戻す --//
		Win0H = 0;
		Win0V = 0;
		*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
		*(vu16*)REG_WINOUT = (WIN_ALL_ON << 8) | (WIN_ALL_ON);
		*(vu16 *)REG_BLDCNT = 0;
		*(vu16 *)REG_BLDY = 0;
		
		DelTaskEffect(id);
	}
}

//----------------------------------------------------------
//	くぎ
//----------------------------------------------------------
const	actHeader KugiHeader={
	WAZACHR_ID_KUGI2,
	WAZACHR_ID_KUGI2,
	&WazaOamDataBldNormal[6],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	KugiSeq,
};

//----------------------------------------------------------
//	offset	なし
//----------------------------------------------------------
#define KUGI_OFFSET_X	(-24)
#define KUGI_SP_X		2
#define KUGI_FARST_WAIT	60
#define KUGI_NEXT_WAIT	40
#define KUGI_END_WAIT	30
static void KugiSeq(actWork *xreg)
{
	s16 offsetX, speed;
	
	WazaDefaultPosSet2(xreg, PM_MODE);
	
	if(MineEnemyCheck(AttackNo) == 0){
		offsetX = -KUGI_OFFSET_X;
		speed = -KUGI_SP_X;
		xreg->oamData.AffineParamNo = 8;	//Hflip ON
	}else{
		offsetX = KUGI_OFFSET_X;
		speed = KUGI_SP_X;
	}
	xreg->x += offsetX;
	xreg->work[1] = speed;
	xreg->work[0] = KUGI_FARST_WAIT;
	xreg->move = KugiMain;
}

static void KugiMain(actWork *xreg)
{
	if(xreg->work[0] > 0){
		xreg->work[0]--;
		return;
	}
	
	xreg->dx += xreg->work[1];
	if(xreg->dx >= 8 || xreg->dx <= -8){
		xreg->x += xreg->dx;
		xreg->dx = 0;
		xreg->oamData.CharNo += 8;
		xreg->work[2]++;
		if(xreg->work[2] == 3){
			xreg->work[0] = KUGI_END_WAIT;
			xreg->move = W_WaitSeq;
			SetWorkSeq(xreg, KugiFadeOut);
		}else{
			xreg->work[0] = KUGI_NEXT_WAIT;
		}
	}
}

static void KugiFadeOut(actWork *xreg)
{
	if(xreg->work[0] == 0){
		//初期化処理
		*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
		*(vu16*)REG_BLDALPHA = 16;
		xreg->work[0]++;
		xreg->work[1] = 0;
		xreg->work[2] = 0;
	}
	else if(xreg->work[1] < 2){
		//wait
		xreg->work[1]++;
	}
	else{
		xreg->work[1] = 0;
		xreg->work[2]++;
		*(vu16*)REG_BLDALPHA = (16-xreg->work[2]) | (xreg->work[2]<<8);
		if(xreg->work[2] == 16){
			xreg->banish = 1;
			xreg->move = KugiFadeOutEnd;
		}
	}
}

static void KugiFadeOutEnd(actWork *xreg)
{
	*(vu16*)REG_BLDCNT = 0;
	*(vu16*)REG_BLDALPHA = 0;

	Win0H = 0;
	Win0V = 0;
//	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
//	*(vu16*)REG_WINOUT = (WIN_ALL_ON << 8) | (WIN_ALL_ON ^ WIN_BLEND_ON);//BLEND無効
//	*(vu16 *)REG_BLDCNT = BLD_BG3_1ST | BLD_DOWN_MODE;
//	*(vu16 *)REG_BLDY = 16;		//ｳｨﾝﾄﾞｳの中は真っ黒にする

	DelWazaEffect(xreg);
}


//----------------------------------------------------------
//	どくろ
//----------------------------------------------------------
const	actHeader DokuroHeader={
	WAZACHR_ID_NOROI,
	WAZACHR_ID_NOROI,
	&WazaOamDataBldNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	DokuroSeq,
};

//-- 悪魔 --//
const	actHeader AkumuHeader={
	WAZACHR_ID_DEVIL,
	WAZACHR_ID_DEVIL,
	&WazaOamDataBldNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	DokuroSeq,
};

//----------------------------------------------------------
//	offset	なし
//----------------------------------------------------------
#define DOKURO_FURIHABA_X	12
#define DOKURO_ADDSEC		6
#define DOKURO_DY			0x0100
#define DOKURO_SYNC_END		30
static void DokuroSeq(actWork *xreg)
{
	u16 alpha_u, alpha_d;

	xreg->dx = SinMove(xreg->work[0], DOKURO_FURIHABA_X);
	if(MineEnemyCheck(AttackNo))
		xreg->dx = -xreg->dx;
	xreg->work[0] = 0xff & (xreg->work[0] + DOKURO_ADDSEC);
	xreg->work[1] += DOKURO_DY;
	xreg->dy = -(xreg->work[1] >> 8);
	
	xreg->work[7]++;
	if(xreg->work[7] == 1){
		xreg->work[6] = 11 | (5 << 8);
		*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
		*(vu16*)REG_BLDALPHA = xreg->work[6];
	}
	else if(xreg->work[7] > DOKURO_SYNC_END){
		if(xreg->work[2]++ % 1 == 0){
			alpha_u = xreg->work[6] >> 8;
			alpha_d = xreg->work[6] & 0xff;
			if(++alpha_u > 16)
				alpha_u = 16;
			if(--(s16)alpha_d < 0)
				alpha_d = 0;
			
			*(vu16*)REG_BLDALPHA = (alpha_u << 8) | alpha_d;
			xreg->work[6] = (alpha_u << 8) | alpha_d;
			if(alpha_u == 16 && alpha_d == 0){
				xreg->banish = 1;
				xreg->move = DokuroEndSeq;
			}
		}
	}
}

static void DokuroEndSeq(actWork *xreg)
{
	*(vu16*)REG_BLDCNT = 0;
	*(vu16*)REG_BLDALPHA = 0;
	DelWazaEffect(xreg);
}

















//=========================================================================
//
//		おんねん
//														taya  2002.07.11
//=========================================================================
static void TaskOnnenMain(u8 id);
static const actHeader OnnenHeader;
extern void W_ActStraightSet(actWork *act, s16 sx, s16 sy, s16 ex, s16 ey, u16 sync);
extern void W_ActStraightMove(actWork *act);

#define ONNEN_ACTMAX         (6)   // 火の玉個数
#define ONNEN_ACTADD_WAIT    (16)   // 火の玉追加間隔
#define ONNEN_ACTMOVE_SYNC   (40)  // 火の玉到達sync
#define ONNEN_ACTMOVE_WAIT   (40)  // 相手に到達してからの待ち
#define ONNEN_ACTMOVE2_WAIT   (0)   // 火の玉グルグル移動wait
#define ONNEN_ACTMOVE2_SPEED  (2)   // 火の玉グルグル移動速度

#define ONNEN_EVA_MAX  (0x0e)
#define ONNEN_EVB_MIN  (0x04)

#define ONNEN_ACTANGLE_DIFF   (256/ONNEN_ACTMAX)
#define ONNEN_ACTANGLE_SPEED  (2)

enum ONNEN_WORK {
	ONNEN_SEQ,
	ONNEN_CNT,
	ONNEN_CNT2,
	ONNEN_EVA,
	ONNEN_EVB,
	ONNEN_OAMPRI,
	ONNEN_ACTPRI,
	ONNEN_ACTCNT,
	ONNEN_ACTDEL_FLG,
	ONNEN_X1,
	ONNEN_Y1,
	ONNEN_MOVE_WIDTH,
};

//=========================================
// ﾜｰｸ設定不要（防御側BG落としが必要）
//=========================================
void TaskOnnen(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[ONNEN_SEQ] = 0;
	my->work[ONNEN_CNT] = ONNEN_ACTADD_WAIT;

	my->work[ONNEN_X1] = GetWazaEffPos(AttackNo, PM_X);
	my->work[ONNEN_Y1] = GetPokeShadowYPos(AttackNo);
	my->work[ONNEN_MOVE_WIDTH] = (W_GetPokeSize(AttackNo, POKESIZE_WIDTH) / 2) + 8;
	my->work[ONNEN_ACTCNT] = 0;

	my->work[ONNEN_OAMPRI] = GetPokeBGPri(AttackNo);
	my->work[ONNEN_ACTPRI] = GetPokeSoftPri(AttackNo)-2;

	my->work[ONNEN_EVA] = 0x00;
	my->work[ONNEN_EVB] = 0x10;
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = 0x1000;

	my->work[ONNEN_ACTDEL_FLG] = 0;

	my->TaskAdrs = TaskOnnenMain;

}
static void TaskOnnenMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[ONNEN_SEQ]){
	case 0:
		{
			u16 i, angle;
			u8 no;
			angle = 0;
			for(i = 0; i < ONNEN_ACTMAX; i++)
			{
				no = AddActor(&OnnenHeader,my->work[ONNEN_X1],my->work[ONNEN_Y1],my->work[ONNEN_ACTPRI]);
				if(no != ACT_MAX)
				{
					ActWork[no].work[0] = id;
					ActWork[no].work[1] = (MineEnemyCheck(AttackNo)==SIDE_MINE);
					ActWork[no].work[2] = (ONNEN_ACTANGLE_DIFF*i)&0xff;
					ActWork[no].work[3] = my->work[ONNEN_MOVE_WIDTH];
					ActWork[no].work[5] = i * 6;
					my->work[ONNEN_ACTCNT]++;
				}
			}
			my->work[ONNEN_SEQ]++;
		}
		break;

	case 1:
		my->work[ONNEN_CNT]++;
		if(my->work[ONNEN_CNT]&1){
			if(my->work[ONNEN_EVA] < ONNEN_EVA_MAX){ my->work[ONNEN_EVA]++; }
		}else{
			if(my->work[ONNEN_EVB] > ONNEN_EVB_MIN){ my->work[ONNEN_EVB]--; }
		}
		if(my->work[ONNEN_EVA]==ONNEN_EVA_MAX && my->work[ONNEN_EVB]==ONNEN_EVB_MIN)
		{
			my->work[ONNEN_CNT] = 0;
			my->work[ONNEN_SEQ]++;
		}
		*(vu16*)REG_BLDALPHA = (my->work[ONNEN_EVB]<<8)|my->work[ONNEN_EVA];
		break;

	case 2:
		if(++(my->work[ONNEN_CNT]) > 30){
			my->work[ONNEN_CNT] = 0;
			my->work[ONNEN_SEQ]++;
		}
		break;

	case 3:
		my->work[ONNEN_CNT]++;
		if(my->work[ONNEN_CNT]&1){
			if(my->work[ONNEN_EVA] > 0x00){ my->work[ONNEN_EVA]--; }
		}else{
			if(my->work[ONNEN_EVB] < 0x10){ my->work[ONNEN_EVB]++; }
		}
		if(my->work[ONNEN_EVA]==0x00 && my->work[ONNEN_EVB]==0x10)
		{
			my->work[ONNEN_ACTDEL_FLG] = 1;
			my->work[ONNEN_SEQ]++;
		}
		*(vu16*)REG_BLDALPHA = (my->work[ONNEN_EVB]<<8)|my->work[ONNEN_EVA];
		break;

	case 4:
		if(my->work[ONNEN_ACTCNT]==0){
			my->work[ONNEN_SEQ]++;
		}
		break;

	case 5:
		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDALPHA = 0x0000;
		DelTaskEffect(id);
		break;
	}
}
//------------------------------------------
// 自分の周囲をグルグル
//------------------------------------------
static void OnnenActMove(actWork *act)
{
	// work[0] には制御ﾀｽｸのIDが入っている

	if(act->work[1] == 0){  // 右移動
		act->work[2] += ONNEN_ACTANGLE_SPEED;
	}else{                  // 左移動
		act->work[2] -= ONNEN_ACTANGLE_SPEED;
	}
	act->work[2] &= 0xff;

	act->dx = SinMove(act->work[2],act->work[3]);

	// ＯＡＭﾌﾟﾗｲｵﾘﾃｨ上げ下げ
	if(act->work[2] > 64 && act->work[2] < 192)
	{
		act->oamData.Priority = TaskTable[act->work[0]].work[ONNEN_OAMPRI] + 1;
	}
	else
	{
		act->oamData.Priority = TaskTable[act->work[0]].work[ONNEN_OAMPRI];
	}

	act->work[5]++;
	act->work[6] = (act->work[5]*8)&0xff;
	act->dy = SinMove(act->work[6],7);


	if(TaskTable[act->work[0]].work[ONNEN_ACTDEL_FLG])
	{
		TaskTable[act->work[0]].work[ONNEN_ACTCNT]--;
		DelActor(act);
	}
}

#define ONNEN_ANMWAIT  (4)

static const actAnm OnnenAnm[]={
	{OBJ16_16x32*0, ONNEN_ANMWAIT, 0,0},
	{OBJ16_16x32*1, ONNEN_ANMWAIT, 0,0},
	{OBJ16_16x32*2, ONNEN_ANMWAIT, 0,0},
	{OBJ16_16x32*3, ONNEN_ANMWAIT, 0,0},
	{ACT_ANMLOOP,0,0,0}
};
static const actAnm *const OnnenAnmTbl[]={
	OnnenAnm,
};

static const actHeader OnnenHeader = {
	WAZACHR_ID_ONNEN,
	WAZACHR_ID_ONNEN,
	&WazaOamDataBldNormal[10],
	OnnenAnmTbl,
	0,
	DummyActAffTbl,
	OnnenActMove,
};
