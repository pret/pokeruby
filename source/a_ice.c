//=========================================================================
//	
//	氷系 技エフェクト
//
//=========================================================================
#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "madefine.h"
#include "wazatool.h"
#include "waza_dat.h"
#include "waza_eff.h"
#include "server.h"
#include "calctool.h"

#include "decord.h"
#include "fight.h"
#include "bss.h"
#include "cli_def.h"


#include "weather_dat.h"
//#include "..\scaddata\b_mis.asc"



//=========================================================================
//
//		「こなゆき」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaKonayukiMain(actWork *Xreg);
static void SeqWazaKonayukiInit(actWork *Xreg);
//static void SeqWazaKooriInit(actWork *Xreg);
//static void SeqWazaKooriMain(actWork *Xreg);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm KonayukiAnm[]={
	{OBJ16_8x8 * 0, 5, 1, 0},
	{OBJ16_8x8 * 1, 5, 1, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm *const KonayukiAnmTbl[]={
	KonayukiAnm,
};

const	actHeader ActKonayukiHeader={
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataNormal[0],
//	KonayukiAnmTbl,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaKonayukiInit,
};
//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
/*
const	actHeader ActKoori2Header={
	WAZACHR_ID_KOORI2,
	WAZACHR_ID_KOORI2,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaKooriInit,
};
*/

//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

//-------------------------------------------------------------
// offset 0:始点Xのｵﾌｾｯﾄ  1:始点Yのｵﾌｾｯﾄ  2:終点Xのｵﾌｾｯﾄ  3:終点Yのｵﾌｾｯﾄ
//        4:速度  5:振り幅  6:秒を進める速度
//-------------------------------------------------------------
static void SeqWazaKonayukiInit(actWork *Xreg)
{
	s16 end_x, end_y, start_x, start_y;
	
	Xreg->oamData.CharNo += 7;
	
	end_x = GetWazaEffPos(DefenceNo, PM_X);
	end_y = GetWazaEffPos(DefenceNo, PM_Y);
	start_x = GetWazaEffPos(AttackNo, PM_X);
	start_y = GetWazaEffPos(AttackNo, PM_Y);
	
	Xreg->work[0] = WazaEffWork[4];
	Xreg->work[1] = start_x + WazaEffWork[0];
	Xreg->work[2] = end_x + WazaEffWork[2];
	Xreg->work[3] = start_y + WazaEffWork[1];
	Xreg->work[4] = end_y + WazaEffWork[3];
	W_GetStraightMoveSp(Xreg);
	while(1)	//終点を画面外で取る
	{
		if(end_x > (240+32) || end_x < (0-32))	//完全に画面外にする為に一応32
			break;
		if(end_y > (160+32) || end_y < (0-32))
			break;
		end_x += Xreg->work[1];
		end_y += Xreg->work[2];
	}
	Xreg->work[1] = -Xreg->work[1];		//符号反転
	Xreg->work[2] = -Xreg->work[2];
	while(1)	//始点も画面外で取る
	{
		if(start_x > (240+32) || start_x < (0-32))
			break;
		if(start_y > (160+32) || start_y < (0-32))
			break;
		start_x += Xreg->work[1];
		start_y += Xreg->work[2];
	}
	
	Xreg->x = start_x;
	Xreg->y = start_y;
	Xreg->work[0] = WazaEffWork[4];
	Xreg->work[1] = start_x;
	Xreg->work[2] = end_x;
	Xreg->work[3] = start_y;
	Xreg->work[4] = end_y;
	W_GetStraightMoveSp(Xreg);
	
	Xreg->work[3] = WazaEffWork[5];
	Xreg->work[4] = WazaEffWork[6];
	Xreg->move=SeqWazaKonayukiMain;
}

static void SeqWazaKonayukiMain(actWork *Xreg)
{
	if(Xreg->work[0])
	{
		Xreg->work[5] += Xreg->work[1];
		Xreg->work[6] += Xreg->work[2];
		Xreg->dx = Xreg->work[5];
		Xreg->dy = Xreg->work[6];
		Xreg->dx += SinMove(Xreg->work[7], Xreg->work[3]);
		Xreg->dy += SinMove(Xreg->work[7], Xreg->work[3]);
		Xreg->work[7] = 0xff & (Xreg->work[7] + Xreg->work[4]);
		Xreg->work[0]--;
	}
	else
		DelWazaEffect(Xreg);
}










//=========================================================================
//
//		「れいとうパンチ」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaReitouSubInit(actWork *Xreg);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define ANM_WAIT	5

#define REITOU_FURIHABA			60
#define REITOU_ADD_SEC			9
#define	REITOU_SUB_FURIHABA		(-0x0200)
#define REITOU_LOOP				(abs((REITOU_FURIHABA << 8) / REITOU_SUB_FURIHABA))

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
/*
static const actAnm ReitouPanchAnm0[]={
		{OBJ16_32x32*0,ANM_WAIT,0,0},
		{OBJ16_32x32*1,ANM_WAIT,0,0},
		{OBJ16_32x32*2,ANM_WAIT,0,0},
		{OBJ16_32x32*3,ANM_WAIT,0,0},
		{OBJ16_32x32*4,ANM_WAIT,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm *const ReitouPanchAnmTbl[]={
		ReitouPanchAnm0,
};

const	actHeader ActReitouPanchHeader={
	WAZACHR_ID_OBAKE,
	WAZACHR_ID_OBAKE,
	&WazaOamDataNormal[2],
	ReitouPanchAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaReitouPanchInit,
};
*/
//---------------------------------------
static const actAnm YukiAnm0[]={		//大きめの氷
		{OBJ16_8x8*0,1,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm YukiAnm1[]={		//中くらいの氷
		{OBJ16_8x8*4,1,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm YukiAnm2[]={		//小さな氷
		{OBJ16_8x8*6,1,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm YukiAnm3[]={		//雪
		{OBJ16_8x8*7,1,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm YukiAnm4[]={		//斜め向きの大き目の雪
		{OBJ16_8x8*8,1,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm YukiAnm5[]={		//泡？
		{OBJ16_8x8*0xc,6,0,0},
		{OBJ16_8x8*0xd,6,0,0},
		{ACT_ANMLOOP,0,0,0}
};
const actAnm *const YukiAnmTbl[]={
		YukiAnm0,
		YukiAnm1,
		YukiAnm2,
		YukiAnm3,
		YukiAnm4,
		YukiAnm5,
};

static const actAffAnm ReitouPantiAff0[] =
{
	{ 0,0,40,1},
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm * const ReitouPantiAffTbl[] = {
	ReitouPantiAff0,
};

const	actHeader ActReitouPantiHeader={	//中くらいの氷
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataBldAffine2[8],
	&YukiAnmTbl[1],
	0,
	ReitouPantiAffTbl,
	SeqWazaReitouSubInit,
};
const	actHeader ActReitouSubHeader={	//小さめの氷
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataBldNormal[0],
	&YukiAnmTbl[2],
	0,
	DummyActAffTbl,
	SeqWazaReitouSubInit,
};


//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------
/*
//-------------------------------------------------------------
// offset 0:Xｵﾌｾｯﾄ  1:Yｵﾌｾｯﾄ
//-------------------------------------------------------------
static void SeqWazaReitouPanchInit(actWork *Xreg)
{
	Xreg->x += WazaEffWork[0];
	Xreg->y += WazaEffWork[1];
	SetWorkSeq(Xreg, DelWazaEffect);
	Xreg->move = W_AnmEndWait;
}

*/

//=========================================================================
//	offset 0:角度初期値
//=========================================================================
static void SeqWazaReitouSubInit(actWork *Xreg)
{
	Xreg->work[0] = WazaEffWork[0];
	Xreg->work[1] = REITOU_FURIHABA;
	Xreg->work[2] = REITOU_ADD_SEC;
	Xreg->work[3] = REITOU_LOOP;
	Xreg->work[4] = REITOU_SUB_FURIHABA;
	
	SetWorkSeq(Xreg, DelWazaEffect);
	Xreg->move = PMObjKaiten2;
	Xreg->move(Xreg);
}





//=========================================================================
//
//		れいとうビーム
//												by matsuda 2002.01.21(月)
//=========================================================================
static void ReitouBeemSeq(actWork *xreg);

static const actAffAnm ReitouBeemAff0[] =
{
	{ 0,0,10,1},
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm * const ReitouBeemAffTbl[] = {
	ReitouBeemAff0,
};
/*
const	actHeader ActReitouBeem0Header={	//大きい氷
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataBldAffine[1],
	&YukiAnmTbl[0],
	0,
	ReitouBeemAffTbl,
	ReitouBeemSeq,
};
*/
const	actHeader ActReitouBeem1Header={	//中くらいの氷
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataBldAffine[8],
	&YukiAnmTbl[1],
	0,
	ReitouBeemAffTbl,
	ReitouBeemSeq,
};
const	actHeader ActReitouBeem2Header={	//小さめの氷
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataBldNormal[0],
	&YukiAnmTbl[2],
	0,
	DummyActAffTbl,
	ReitouBeemSeq,
};
//----------------------------------------------------------
//	0:始点Xｵﾌｾｯﾄ  1:始点Yｵﾌｾｯﾄ   2:終点Xｵﾌｾｯﾄ   3:終点Yｵﾌｾｯﾄ
//  4:到達までのVsync回数
//----------------------------------------------------------
static void ReitouBeemSeq(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X);
	if(MineEnemyCheck(AttackNo))
		xreg->work[2] -= WazaEffWork[2];
	else
		xreg->work[2] += WazaEffWork[2];
	xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y) + WazaEffWork[3];
	xreg->work[0] = WazaEffWork[4];
	SetWorkSeq(xreg, DelWazaEffect);
	xreg->move = W_StraightSyncMove;
}







//=========================================================================
//
//		凍らせる追加効果を持つ技の共通ｴﾌｪｸﾄ
//												by matsuda 2002.01.18(金)
//=========================================================================
static void IceKoukaInitSeq(actWork *xreg);
static void IceKoukaAffWaitSeq(actWork *xreg);

#define ICE_ADDAFF		5
#define ICE_AFFLOOP		10
static const actAffAnm IceKoukaAff0[] =
{
	{ 0x100-ICE_ADDAFF*ICE_AFFLOOP, 0x100-ICE_ADDAFF*ICE_AFFLOOP, 0, ACT_AFSET},
	{ ICE_ADDAFF, ICE_ADDAFF, 0, ICE_AFFLOOP},
	{0,0,0,6},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm * const IceKoukaAffTbl[] = {
	IceKoukaAff0,
};
const	actHeader ActIceKoukaHeader={
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataBldAffine[8],
	&YukiAnmTbl[1],
	0,
	IceKoukaAffTbl,
	IceKoukaInitSeq,
};
const	actHeader ActIceKouka2Header={
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataBldAffine[0],
	&YukiAnmTbl[2],
	0,
	IceKoukaAffTbl,
	IceKoukaInitSeq,
};

//----------------------------------------------------------
//	0:Xoffset  1:Yoffset	2:0=ﾉｰﾏﾙ、 1=2体選択モード
//----------------------------------------------------------
static void IceKoukaInitSeq(actWork *xreg)
{
	if(WazaEffWork[2] == 0)
		WazaDefaultPosSet1(xreg, PM_MODE);
	else{
		GetCenterEffPos(DefenceNo, PM_MODE, &xreg->x, &xreg->y);
		if(MineEnemyCheck(AttackNo))
			WazaEffWork[0] = -WazaEffWork[0];
		xreg->x += WazaEffWork[0];
		xreg->y += WazaEffWork[1];
	}
	SetWorkSeq(xreg, IceKoukaAffWaitSeq);
	xreg->move = W_AffEndWait;
}

static void IceKoukaAffWaitSeq(actWork *xreg)
{
	xreg->banish ^= 1;
	if(++xreg->work[0] == 20)
		W_AffCheckEndSeq(xreg);
}











//=========================================================================
//
//		こごえるかぜ
//												by matsuda 2002.01.23(水)
//=========================================================================
static void KogoeruInit(actWork *xreg);
static void KogoeruArcInit(actWork *xreg);
static void KogoeruArcMain(actWork *xreg);
static void KogoeruEndMove(actWork *xreg);

const	actHeader ActKogoeruHeader={	//小さ目の雪
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataNormal[0],
	&YukiAnmTbl[3],
	0,
	DummyActAffTbl,
	KogoeruInit,
};

#define KOGOERU_ADDSEC		(256/16)	//角度増加量
#define KOGOERU_LOOP			(16*2)
#define KOGOERU_FURIHABA_X	-20
#define KOGOERU_FURIHABA_Y	15

//----------------------------------------------------------
//	0:Xoffset 1:Yoffset 2:終点Xoffset 3:終点Yoffset	4:移動速度(下位4ﾋﾞｯﾄ固定少数)
//	5:0=ノーマル  1=2体選択モード
//----------------------------------------------------------
static void KogoeruInit(actWork *xreg)
{
	s16 work[ACTOR_WORK_MAX];
	int i;
	
	WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[0] = WazaEffWork[4];
	xreg->work[1] = xreg->x;
	xreg->work[3] = xreg->y;
	if(WazaEffWork[5] == 0){
		xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X);
		xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y) + WazaEffWork[3];
	}
	else
		GetCenterEffPos(DefenceNo, PM_MODE, &xreg->work[2], &xreg->work[4]);
	if(MineEnemyCheck(AttackNo))
		xreg->work[2] -= WazaEffWork[2];
	else
		xreg->work[2] += WazaEffWork[2];

	//-- 画面外座標に持っていく --//
	for(i = 0; i < ACTOR_WORK_MAX; i++)
		work[i] = xreg->work[i];
	W_GetStraightSpParam4(xreg);
	xreg->work[1] ^= 1;		//移動方向反転
	xreg->work[2] ^= 1;
	for(;;){
		xreg->work[0] = 1;
		W_ParallelSync4(xreg);
		if(xreg->x + xreg->dx > 256 || xreg->x + xreg->dx < -16 ||
				xreg->y + xreg->dy > 160 || xreg->y + xreg->dy < -16)
			break;
	}
	xreg->x += xreg->dx;
	xreg->y += xreg->dy;
	xreg->dx = xreg->dy = 0;
	for(i = 0; i < ACTOR_WORK_MAX; i++)
		xreg->work[i] = work[i];
	//-- ------------------- --//

	xreg->move = W_StraightSpMove4;
	SetWorkSeq(xreg, KogoeruArcInit);
}

static void KogoeruArcInit(actWork *xreg)
{
	s16 furihabaX;
	
	xreg->x += xreg->dx;
	xreg->y += xreg->dy;
	xreg->dx = xreg->dy = 0;
	xreg->work[0] = 128;
	
	if(MineEnemyCheck(AttackNo))
		furihabaX = -KOGOERU_FURIHABA_X;
	else
		furihabaX = KOGOERU_FURIHABA_X;
	xreg->work[3] = SinMove(xreg->work[0], furihabaX);
	xreg->work[4] = CosMove(xreg->work[0], KOGOERU_FURIHABA_Y);
	xreg->work[5] = 0;
	xreg->move = KogoeruArcMain;
	xreg->move(xreg);
}

static void KogoeruArcMain(actWork *xreg)
{
	s16 furihabaX;

	if(MineEnemyCheck(AttackNo))
		furihabaX = -KOGOERU_FURIHABA_X;
	else
		furihabaX = KOGOERU_FURIHABA_X;

	if( xreg->work[5] < KOGOERU_LOOP)
	{
		//円を描く
		xreg->dx = SinMove(xreg->work[0], furihabaX) - xreg->work[3];
		xreg->dy = CosMove(xreg->work[0], KOGOERU_FURIHABA_Y) - xreg->work[4];
		//角度変化
		xreg->work[0] = 0xff & (xreg->work[0] + KOGOERU_ADDSEC);
		xreg->work[5]++;
	}else
	{
		xreg->x += xreg->dx;
		xreg->y += xreg->dy;
		xreg->dx = xreg->dy = 0;
		xreg->work[3] = xreg->work[4] = 0;
		xreg->move = KogoeruEndMove;
	}
}

static void KogoeruEndMove(actWork *xreg)
{
	xreg->work[0] = 1;	//計算だけしてもらいたいので常にwork[0]に値を入れておく
	W_ParallelSync4(xreg);
	if(xreg->x+xreg->dx > 256 || xreg->x+xreg->dx < -16
		|| xreg->y+xreg->dy > 256 || xreg->y+xreg->dy < -16)
		DelWazaEffect(xreg);
}












//=========================================================================
//
//		ふぶき
//												by matsuda 2002.01.28(月)
//=========================================================================
static void FubukiInit(actWork *xreg);
static void FubukiMain(actWork *xreg);

const	actHeader ActFubukiHeader={
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataNormal[1],
	&YukiAnmTbl[4],
	0,
	DummyActAffTbl,
	FubukiInit,
};

//-- 「こなゆき」 --//
const	actHeader KonayukiHeader={
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataNormal[0],
	&YukiAnmTbl[3],
	0,
	DummyActAffTbl,
	FubukiInit,
};

//----------------------------------------------------------
//	0:始点Xoffset	1:始点Yoffset	2:終点Xoffset	3:終点Yoffset
//	4:速度(下位4ﾋﾞｯﾄ少数)	5:振り幅Y
//	6:秒速度	7:0=ノーマル  1=2体選択モード
//----------------------------------------------------------
static void FubukiInit(actWork *xreg)
{
	s16 work[ACTOR_WORK_MAX];
	int i;
	
	WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[0] = WazaEffWork[4];
	xreg->work[1] = xreg->x;
	xreg->work[3] = xreg->y;
	if(WazaEffWork[7] == 0){
		xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X);
		xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y);
	}
	else
		GetCenterEffPos(DefenceNo, PM_MODE, &xreg->work[2], &xreg->work[4]);
		
	if(MineEnemyCheck(AttackNo))
		xreg->work[2] -= WazaEffWork[2];
	else
		xreg->work[2] += WazaEffWork[2];
	xreg->work[4] += WazaEffWork[3];
//	W_GetStraightSyncParam(xreg);
	W_GetStraightSpParam4(xreg);
	
	//-- 画面外座標に持っていく --//
	for(i = 0; i < ACTOR_WORK_MAX; i++)
		work[i] = xreg->work[i];
	xreg->work[1] ^= 1;		//移動方向反転
	xreg->work[2] ^= 1;
	for(;;){
		xreg->work[0] = 1;
		//W_ParallelSync(xreg);
		W_ParallelSync4(xreg);
		if(xreg->x + xreg->dx > 256 || xreg->x + xreg->dx < -16 ||
				xreg->y + xreg->dy > 160 || xreg->y + xreg->dy < -16)
			break;
	}
	xreg->x += xreg->dx;
	xreg->y += xreg->dy;
	xreg->dx = xreg->dy = 0;
	for(i = 0; i < ACTOR_WORK_MAX; i++)
		xreg->work[i] = work[i];
	//-- ------------------- --//
	
	xreg->work[5] = WazaEffWork[5];
	xreg->work[6] = WazaEffWork[6];
	xreg->move = FubukiMain;
}

static void FubukiMain(actWork *xreg)
{
	//W_ParallelSync(xreg);
	W_ParallelSync4(xreg);
	if(xreg->work[0] == 0)
		xreg->work[0] = 1;
	
	xreg->dy += SinMove(xreg->work[7], xreg->work[5]);
	xreg->work[7] = 0xff & (xreg->work[7]+xreg->work[6]);
	
	if(xreg->work[0] == 1 && (xreg->x + xreg->dx > 256 || xreg->x + xreg->dx < -16 ||
		xreg->y + xreg->dy > 160 || xreg->y + xreg->dy < -16))
	{
		DelWazaEffect(xreg);
	}
}













//=========================================================================
//
//		素早さが下がる氷属性の技の共通エフェクト
//												by matsuda 2002.02.06(水)
//=========================================================================
static void IceSpeedKoukaInit(actWork *xreg);

#define ICESPEEDKOUKA_ANMWAIT	5
static const actAnm IceSpeedKoukaAnm0[]={
		{OBJ16_8x16*0,ICESPEEDKOUKA_ANMWAIT,0,0},
		{OBJ16_8x16*1,ICESPEEDKOUKA_ANMWAIT,0,0},
		{OBJ16_8x16*2,ICESPEEDKOUKA_ANMWAIT,0,0},
		{OBJ16_8x16*3,ICESPEEDKOUKA_ANMWAIT,0,0},
		{OBJ16_8x16*2,ICESPEEDKOUKA_ANMWAIT,0,0},
		{OBJ16_8x16*1,ICESPEEDKOUKA_ANMWAIT,0,0},
		{OBJ16_8x16*0,ICESPEEDKOUKA_ANMWAIT,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm *const IceSpeedKoukaAnmTbl[]={
		IceSpeedKoukaAnm0,
};
const	actHeader ActIceSpeedKoukaHeader={
	WAZACHR_ID_TURARA,
	WAZACHR_ID_TURARA,
	&WazaOamDataBldNormal[8],
	IceSpeedKoukaAnmTbl,
	0,
	DummyActAffTbl,
	IceSpeedKoukaInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:0=ﾉｰﾏﾙ、1=2体選択モード
//----------------------------------------------------------
static void IceSpeedKoukaInit(actWork *xreg)
{
	if(xreg->work[0] == 0){
		if(WazaEffWork[2] == 0)
			WazaDefaultPosSet1(xreg, EFF_MODE);
		else{
			GetCenterEffPos(DefenceNo, EFF_MODE, &xreg->x, &xreg->y);
			if(MineEnemyCheck(AttackNo))
				WazaEffWork[0] = -WazaEffWork[0];
			xreg->x += WazaEffWork[0];
			xreg->y += WazaEffWork[1];
		}
		xreg->work[0]++;
	}
	else if(xreg->anmend_sw)
		DelWazaEffect(xreg);
}












//=========================================================================
//
//		しろいきり
//												by matsuda 2002.02.14(木)
//=========================================================================
static void SiroiKiriInit(actWork *xreg);
static void SiroiKiriMain(actWork *xreg);

#define SIROIKIRI_ANMWAIT	8
static const actAnm KiriAnm0[]={
		{OBJ16_32x16*0,SIROIKIRI_ANMWAIT,0,0},
		{OBJ16_32x16*1,SIROIKIRI_ANMWAIT,0,0},
		{ACT_ANMLOOP,0,0,0}
};
static const actAnm *const KiriAnmTbl[]={
		KiriAnm0,
};
const	actHeader ActSiroiKiriHeader={
	WAZACHR_ID_KIRI2,
	WAZACHR_ID_KIRI2,
	&WazaOamDataBldNormal[6],
	KiriAnmTbl,
	0,
	DummyActAffTbl,
	SiroiKiriInit,
};

//-- スモッグ --//
const	actHeader ActSumogguHeader={
	WAZACHR_ID_DOKUGIRI,
	WAZACHR_ID_DOKUGIRI,
	&WazaOamDataBldNormal[6],
	KiriAnmTbl,
	0,
	DummyActAffTbl,
	SiroiKiriInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:終点Yｵﾌｾｯﾄ	3:Sync回数
//	4:0=攻撃側に出す  1=防御側に出す	5:0=ﾋｯﾄ範囲一人、1=2体選択
//----------------------------------------------------------
#define KIRI_FURIHABA_X		32
#define KIRI_FURIHABA_Y		(-6)
#define KIRI_DEFAULT_SEC	64
#define KIRI_ADDSEC			3

#define KIRI_2PCHK			0	//２体かどうかチェックする
#define KIRI_2PDISPCHK		1	//２Ｐが画面内にいるかどうかチェックする
static void SiroiKiriInit(actWork *xreg)
{
	if(WazaEffWork[4] == 0){
		if(WazaEffWork[5] == 0)
			WazaDefaultPosSet2(xreg, EFF_MODE);
		else{
	#if KIRI_2PCHK
		#if KIRI_2PDISPCHK
			if(PokeBG2taimeCheck(AttackNo^2)){
		#else
			if(ClientPokeExistCheck(AttackNo^2)){
		#endif
				GetCenterEffPos(AttackNo, EFF_MODE, &xreg->x, &xreg->y);
				if(MineEnemyCheck(AttackNo))
					xreg->x -= WazaEffWork[0];
				else
					xreg->x += WazaEffWork[0];
				xreg->y += WazaEffWork[1];			
			}else{	//２体に出さないとき
				WazaEffWork[5] = 0;
				WazaDefaultPosSet2(xreg, EFF_MODE);
			}
	#else					
			GetCenterEffPos(AttackNo, EFF_MODE, &xreg->x, &xreg->y);
			if(MineEnemyCheck(AttackNo))
				xreg->x -= WazaEffWork[0];
			else
				xreg->x += WazaEffWork[0];
			xreg->y += WazaEffWork[1];
	#endif			
		}
		xreg->work[7] = AttackNo;
	}
	else{
		if(WazaEffWork[5] == 0)
			WazaDefaultPosSet1(xreg, EFF_MODE);
		else{
			GetCenterEffPos(DefenceNo, EFF_MODE, &xreg->x, &xreg->y);
			if(MineEnemyCheck(DefenceNo))
				xreg->x -= WazaEffWork[0];
			else
				xreg->x += WazaEffWork[0];
			xreg->y += WazaEffWork[1];
		}
		xreg->work[7] = DefenceNo;
	}

	if(WazaEffWork[5] == 0 || FightCheck()==0)
		xreg->work[6] = KIRI_FURIHABA_X;
	else
		xreg->work[6] = KIRI_FURIHABA_X * 2;
		
	if(MineEnemyCheck(DefenceNo) == SIDE_MINE)
		xreg->y += MINE_SIDE_OFFSET_Y;
	
	xreg->work[0] = WazaEffWork[3];
	xreg->work[1] = xreg->x;
	xreg->work[2] = xreg->x;
	xreg->work[3] = xreg->y;
	xreg->work[4] = xreg->y + WazaEffWork[2];
	W_GetStraightSyncParam(xreg);
	xreg->work[5] = KIRI_DEFAULT_SEC;
	xreg->move = SiroiKiriMain;
	xreg->move(xreg);
}

static void SiroiKiriMain(actWork *xreg)
{
	if(W_ParallelSync(xreg) == 0)
	{
		xreg->dx += SinMove(xreg->work[5], xreg->work[6]);
		xreg->dy += CosMove(xreg->work[5], KIRI_FURIHABA_Y);
	
		if(xreg->work[5] > 63 && xreg->work[5] < 192)
			//xreg->oamData.Priority = 1;
			xreg->oamData.Priority = GetPokeBGPri(xreg->work[7]);
		else
			//xreg->oamData.Priority = 2;
			xreg->oamData.Priority = GetPokeBGPri(xreg->work[7]) + 1;
		xreg->work[5] = 0xff & (xreg->work[5] + KIRI_ADDSEC);
	}
	else
		DelWazaEffect(xreg);
}


//=========================================================================
//
//		すなあらし
//												by matsuda 2002.07.23(火)
//=========================================================================
static void KuroikiriMain(u8 id);

//----------------------------------------------------------
//	フェードインしてくる砂嵐用の背景
//	offset	なし
//----------------------------------------------------------
#define KUROIKIRI_HAIKEI_CHGWAIT		3	//背景ﾌｪｰﾄﾞｲﾝ、ｱｳﾄ時のｳｪｲﾄ
#define KUROIKIRI_HAIKEI_ENDWAIT		80	//背景ﾌｪｰﾄﾞｱｳﾄするまでのｳｪｲﾄ
#define KUROIKIRI_BLDMAX				9
void KuroikiriInitTask(u8 id)
{
	WazaBgData wazabg;
	
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL | BLD_BG1_1ST;
	*(vu16*)REG_BLDALPHA = 16 << 8;

	(*(vBgCnt *)REG_BG1CNT).Priority = 1;
	(*(vBgCnt *)REG_BG1CNT).Size = 0;
	
	if(ContestCheck() == 0)//ｴﾌｪｸﾄの間だけｷｬﾗｸﾀﾍﾞｰｽを変更(ｽｸﾘｰﾝﾃﾞｰﾀの関係で)
		(*(vBgCnt *)REG_BG1CNT).CharBasep = 1;
	ScrX1 = 0;
	ScrY1 = 0;
	*(vu16 *)REG_BG1HOFS = ScrX1;
	*(vu16 *)REG_BG1VOFS = ScrY1;
	GetWazaEffBgAdrs(&wazabg);
	DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x1000, 32);
//	DecordVram((void*)s_arashi_psc_ADRS, wazabg.ScrnAdrs);
//	DecordVram((void*)s_arashi_pch_ADRS, wazabg.CharAdrs);
//	DecordPaletteWork((void*)s_arashi_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	DIV_DMAARRAYCOPY(3, weather_mist_Character, wazabg.CharAdrs, 16);
//	DIV_DMAARRAYCOPY(3, b_mis_Map, wazabg.ScrnAdrs, 16);
	DecordVram((void*)b_mist_psc_ADRS, wazabg.ScrnAdrs);
	PaletteWorkSet((void*)weather_common_Palette, wazabg.PlttNo*16, 0x20);

	if(ContestCheck())
		ScrnPalRewrite(wazabg.PlttNo, (u32)wazabg.ScrnAdrs, 0, 0);

	TaskTable[id].TaskAdrs = KuroikiriMain;
}

static const u8 BldContTbl[]={
	0,1,2,2,2,2,3,4,4,4,5,6,6,6,6,7,8,8,8,9,
};

static void KuroikiriMain(u8 id)
{
	WazaBgData wazabg;

	ScrX1 += -1;
	ScrY1 += 0;
	switch(TaskTable[id].work[12])
	{
		case 0:			//透明度変化
			if(TaskTable[id].work[10]++ == KUROIKIRI_HAIKEI_CHGWAIT){
				TaskTable[id].work[10] = 0;
				
				TaskTable[id].work[9]++;
				TaskTable[id].work[11] = BldContTbl[TaskTable[id].work[9]];
				*(vu16*)REG_BLDALPHA = 
					(16-TaskTable[id].work[11])<<8 | TaskTable[id].work[11];
				if(TaskTable[id].work[11] == KUROIKIRI_BLDMAX){
					TaskTable[id].work[12]++;
					TaskTable[id].work[11] = 0;
				}
			}
			break;
		case 1:			//透明度固定
			if(TaskTable[id].work[11]++ == KUROIKIRI_HAIKEI_ENDWAIT){
				TaskTable[id].work[11] = KUROIKIRI_BLDMAX;
				TaskTable[id].work[12]++;
			}
			break;
		case 2:
			if(TaskTable[id].work[10]++ == KUROIKIRI_HAIKEI_CHGWAIT){
				TaskTable[id].work[10] = 0;
				
				TaskTable[id].work[11]--;
				*(vu16*)REG_BLDALPHA = 
					(16-TaskTable[id].work[11])<<8 | TaskTable[id].work[11];
				if(TaskTable[id].work[11] == 0){
					TaskTable[id].work[12]++;
					TaskTable[id].work[11] = 0;
				}
			}
			break;
		case 3:		//エフェクト用背景消去
			GetWazaEffBgAdrs(&wazabg);
			DIV_DMACLEAR(3, 0, wazabg.CharAdrs, 0x2000, 32);
			DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
			if(ContestCheck() == 0)
				(*(vBgCnt *)REG_BG1CNT).CharBasep = 0;
			TaskTable[id].work[12]++;
		case 4:		//終了
			ScrX1 = 0;
			ScrY1 = 0;
			*(vu16*)REG_BLDCNT = 0;
			*(vu16*)REG_BLDALPHA = 0;
			(*(vBgCnt *)REG_BG1CNT).Priority = EFF_BG1_PRI;
			DelTaskEffect(id);
			break;
	}
}

//=========================================================================
//
//		ミストボール	
//												by iwasawa 2002.09.11(火)
//=========================================================================
static void MistBallMain(u8 id);
//----------------------------------------------------------
//	W_StraightMoveInitの引数をとる
//	offset	0:Xoffset	1:Yoffset	2:終点Xoffset	3:終点Yoffset
//	4:Sync回数		5:座標ﾓｰﾄﾞ:上位8ﾋﾞｯﾄ=始点  下位8ﾋﾞｯﾄ=終点(0:PMﾓｰﾄﾞ	1:EFFﾓｰﾄﾞ)
//----------------------------------------------------------
static void MistBallInit(actWork *xreg)
{
	xreg->x = GetWazaEffPos(AttackNo,PM_X);
	xreg->y = GetWazaEffPos(AttackNo,PM_Y);
	xreg->move = W_StraightMoveInit;
}
const actHeader MistBallHeader = {
	WAZACHR_ID_MIZU2,
	WAZACHR_ID_MIZU2,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	MistBallInit,
};
//----------------------------------------------------------
//	フェードインしてくるくろいきり用の背景
//	offset	なし
//----------------------------------------------------------
#define MISTBALL_HAIKEI_ENDWAIT		80	//背景ﾌｪｰﾄﾞｲﾝ、ｱｳﾄ時のｳｪｲﾄ
#define MISTBALL_BLDMAX				5
void MistBallInitTask(u8 id)
{
	WazaBgData wazabg;
	
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL | BLD_BG1_1ST;
	*(vu16*)REG_BLDALPHA = 16 << 8;

	(*(vBgCnt *)REG_BG1CNT).Priority = 1;
	(*(vBgCnt *)REG_BG1CNT).Size = 0;
	
	if(ContestCheck() == 0)//ｴﾌｪｸﾄの間だけｷｬﾗｸﾀﾍﾞｰｽを変更(ｽｸﾘｰﾝﾃﾞｰﾀの関係で)
		(*(vBgCnt *)REG_BG1CNT).CharBasep = 1;

	ScrX1 = 0;
	ScrY1 = 0;
	*(vu16 *)REG_BG1HOFS = ScrX1;
	*(vu16 *)REG_BG1VOFS = ScrY1;
	GetWazaEffBgAdrs(&wazabg);
	DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x1000, 32);
	DIV_DMAARRAYCOPY(3, weather_mist_Character, wazabg.CharAdrs, 16);
	DecordVram((void*)b_mist_psc_ADRS, wazabg.ScrnAdrs);
	PaletteWorkSet((void*)weather_common_Palette, wazabg.PlttNo*16, 0x20);

	
	if(ContestCheck())
		ScrnPalRewrite(wazabg.PlttNo, (u32)wazabg.ScrnAdrs, 0, 0);
	
	TaskTable[id].work[15] = -1;

	TaskTable[id].TaskAdrs = MistBallMain;
}
static const u8 MistBldContTbl[]={
	0,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,
};
static void MistBallMain(u8 id)
{
	WazaBgData wazabg;

	ScrX1 += TaskTable[id].work[15];
	ScrY1 += 0;
	switch(TaskTable[id].work[12])
	{
		case 0:			//透明度変化
			TaskTable[id].work[9]++;
			TaskTable[id].work[11] = MistBldContTbl[TaskTable[id].work[9]];
			*(vu16*)REG_BLDALPHA = 
				(17-TaskTable[id].work[11])<<8 | TaskTable[id].work[11];
			if(TaskTable[id].work[11] == MISTBALL_BLDMAX){
				TaskTable[id].work[12]++;
				TaskTable[id].work[11] = 0;
			}
			break;
		case 1:			//透明度固定
			if(TaskTable[id].work[11]++ == MISTBALL_HAIKEI_ENDWAIT){
				TaskTable[id].work[11] = MISTBALL_BLDMAX;
				TaskTable[id].work[12]++;
			}
			break;
		case 2:
			if(TaskTable[id].work[10]++ == KUROIKIRI_HAIKEI_CHGWAIT){
				TaskTable[id].work[10] = 0;
				
				TaskTable[id].work[11]--;
				*(vu16*)REG_BLDALPHA = 
					(16-TaskTable[id].work[11])<<8 | TaskTable[id].work[11];
				if(TaskTable[id].work[11] == 0){
					TaskTable[id].work[12]++;
					TaskTable[id].work[11] = 0;
				}
			}
			break;
		case 3:		//エフェクト用背景消去
			GetWazaEffBgAdrs(&wazabg);
			DIV_DMACLEAR(3, 0, wazabg.CharAdrs, 0x2000, 32);
			DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
			if(ContestCheck() == 0)
				(*(vBgCnt *)REG_BG1CNT).CharBasep = 0;
			TaskTable[id].work[12]++;
		case 4:		//終了
			ScrX1 = 0;
			ScrY1 = 0;
			*(vu16*)REG_BLDCNT = 0;
			*(vu16*)REG_BLDALPHA = 0;
			(*(vBgCnt *)REG_BG1CNT).Priority = EFF_BG1_PRI;
			DelTaskEffect(id);
			break;
	}
}


//======================================================================
//	139:どくガス
//
//											add 02.08.01	by iwasawa
//======================================================================
static void SeqDokugasuMove(actWork* xreg);
#define DGASU_SYNC2	80
#define DGASU_SYNC3	0x0300
#define DGASU_WIDTH	0x00000010
#define DGASU_OFSY2	0x1D
#define DGASU_OFSY3	0x4
//----------------------------------------------------------------------
//	どくガス初期化
//	0:Sync回数 1:Xoffset	2:Yoffset	3:終点Xoffset	4:終点Yoffset
//	5:Yofs2;Sync2 6:Yofs3;Sync3 7:モード(EFF_MODE:0,PM_MODE:1)
//----------------------------------------------------------------------
static void SeqDokugasuInit(actWork *xreg)
{
	//移動用のパラメータを生成
	xreg->work[0] = WazaEffWork[0];

	//AttackよりDefenceが右にいた場合､フラグを立てる
	if(GetWazaEffPos(AttackNo,PM_X) < GetWazaEffPos(DefenceNo,PM_X)){
		xreg->work[7] = 0x8000;
	}
	//ディフェンスの位置によって、オフセットをひっくり返す
	if(!(ClientType[DefenceNo] & 1)){
		WazaEffWork[1] = -WazaEffWork[1];
		WazaEffWork[3] = -WazaEffWork[3];
		if(	(xreg->work[7] & 0x8000) && 
			(!(ClientType[AttackNo] & 1))) xreg->pri = ActWork[W_GetPokeActNo(1)].pri+1;
		xreg->work[6] = 1;
	}
	xreg->x = GetWazaEffPos(AttackNo,PM_X);
	xreg->y = GetWazaEffPos(AttackNo,PM_Y);
	if(WazaEffWork[7]){
		xreg->work[1] = xreg->x+WazaEffWork[1];
		xreg->work[2] = GetWazaEffPos(DefenceNo,PM_X)+WazaEffWork[3];
		xreg->work[3] = xreg->y+WazaEffWork[2];
		xreg->work[4] = GetWazaEffPos(DefenceNo,PM_Y)+WazaEffWork[4];
	
		//ディフェンスポケモンのBGプライオリティを保存
		(u16)xreg->work[7] |= ((u16)GetPokeBGPri(DefenceNo)) << 8;
	}else{
		xreg->work[1] = xreg->x+WazaEffWork[1];
		xreg->work[2] = GetWazaEffPos(DefenceNo,EFF_X)+WazaEffWork[3];
		xreg->work[3] = xreg->y+WazaEffWork[2];
		xreg->work[4] = GetWazaEffPos(DefenceNo,EFF_Y)+WazaEffWork[4];
		
		//ディフェンスポケモンのBGプライオリティを保存
		(u16)xreg->work[7] |= ((u16)GetPokeBGPri(DefenceNo)) << 8;
	}

	//コンテストだったら、プライオリティを調整
	if(ContestCheck()){
		xreg->work[6] = 1;
		xreg->pri = 128;
	}

	W_GetStraightSyncParam(xreg);
	xreg->move = SeqDokugasuMove;
}
static void SeqDokugasuMove(actWork* xreg)
{
	switch(xreg->work[7] & 0x00FF)
	{
	case 0:
		W_ParallelSync(xreg);
		
		xreg->dx += (DGASU_WIDTH*_Sin(xreg->work[5]))>>8;
		if(xreg->work[6]){
			xreg->work[5] = (xreg->work[5]-8)&0xFF;
		}else{
			xreg->work[5] = (xreg->work[5]+8)&0xFF;
		}
		if(xreg->work[0] > 0) return;
	
		//移動が終了したら
		xreg->work[0] = DGASU_SYNC2;
		xreg->work[1] = xreg->x = GetWazaEffPos(DefenceNo,EFF_X);
		
		xreg->work[2] = xreg->work[1];
		xreg->work[3] = xreg->y += xreg->dy;
		xreg->work[4] = xreg->y + DGASU_OFSY2;
		xreg->work[7] += 1;
		//ディフェンスがどちらがわにいるか？
		if(sys.FieldBattleFlag){
			if(ClientType[DefenceNo] & 1){	//奥
				xreg->work[5] = 192+12;
			}else{							//手前
				xreg->work[5] = 64+16;	
			}
		}else{
			xreg->work[5] = 64+16;
		}
		xreg->dy = 0;
		xreg->dx = (_Sin(xreg->work[5])*32) >> 8;
		xreg->work[5] = (xreg->work[5]+2) & 0xFF;	
		
		W_GetStraightSyncParam(xreg);
		break;
	case 1:
		W_ParallelSync(xreg);
		xreg->dx += (_Sin(xreg->work[5])*32) >> 8;
		xreg->dy += (_Cos(xreg->work[5])*-3) >> 8;

		//回り込みのためのプライオリティ操作
		if(sys.FieldBattleFlag){
			if(xreg->work[5] > 63 && xreg->work[5] < 192)
				xreg->oamData.Priority = (xreg->work[7] >> 8);
			else
				xreg->oamData.Priority = (xreg->work[7] >> 8)+1;
	
			xreg->work[5] = (xreg->work[5]+4) & 0xFF;	
		}else{
			if(xreg->work[5] > 63 && xreg->work[5] < 192)
				xreg->pri = 128;
			else
				xreg->pri = 128+12;
			
			xreg->work[5] = (xreg->work[5]-4) & 0xFF;	
		}	
		if(xreg->work[0] > 0) return;
		
		xreg->work[0] = DGASU_SYNC3;
		xreg->work[1] = xreg->x += xreg->dx;
		xreg->work[3] = xreg->y += xreg->dy;
		xreg->work[4] = xreg->y + DGASU_OFSY3;
			
		//ディフェンスがどちらがわにいるかで終点を決める
		if(sys.FieldBattleFlag){
			if(ClientType[DefenceNo] & 1)	xreg->work[2] = 256;
			else							xreg->work[2] = -16;
		}else{
			xreg->work[2] = -16;
		}
		xreg->work[7] += 1;
		
		xreg->dx = xreg->dy = 0;
//		W_GetStraightSyncParam(xreg);
		W_GetStraightSpParam(xreg);
		break;
	case 2:
		if(!W_ParallelSync(xreg)) return;

		if(xreg->oamData.AffineMode & 1){
			AffineWorkNumDel(xreg->oamData.AffineParamNo);
			xreg->oamData.AffineMode = 0;
		}
		DelActor(xreg);
		WazaEffectCount--;
		break;
	}
	return;
}
//--どくガス--スモッグキャラ流用//
const actHeader ActDokugasuHeader = {
	WAZACHR_ID_DOKUGIRI,
	WAZACHR_ID_DOKUGIRI,
	&WazaOamDataBldNormal[6],
	KiriAnmTbl,
	0,
	DummyActAffTbl,
	SeqDokugasuInit,
};

















//=========================================================================
//
//		あられ
//													taya  2002.07.24
//=========================================================================
#define ARALE_ADD_MAX         (10)  // 全部で何組？
#define ARALE_CONT_MAX        (3)   // １組に何個？
#define ARALE_ADDACT_WAIT1    (2)   // １組登録の間隔
#define ARALE_ADDACT_WAIT2    (1)   // １個登録の間隔

#define ARALE_XSPEED  (4)
#define ARALE_YSPEED  (8)
#define ARALE_XY_RATIO  (ARALE_YSPEED/ARALE_XSPEED)  // 割り切れるように

enum ARALE_TYPE {
	ARALE_LU,
	ARALE_RD,
	ARALE_FREE,
};

typedef struct {
	s32 x :10;
	s32 y :10;
	s32 client_type :8;
	s32 arale_type :4;
}ARALE_POS;

static const ARALE_POS AralePosTbl[ARALE_ADD_MAX] = 
{
	{  100, 120, 0, ARALE_FREE },
	{   85, 120, BSS_CLIENT_MINE, ARALE_LU  },  // 味方１の左上
	{  242, 120, BSS_CLIENT_ENEMY, ARALE_RD },  // 敵１の右下
	{   66, 120, BSS_CLIENT_MINE2, ARALE_RD  },  // 味方２の右下
	{  182, 120, BSS_CLIENT_ENEMY2, ARALE_LU },  // 敵２の左上
	{   60, 120, 0, ARALE_FREE },
	{  214, 120, BSS_CLIENT_ENEMY, ARALE_LU },  // 敵１の左上
	{  113, 120, BSS_CLIENT_MINE, ARALE_RD  },  // 味方１の右下
	{  210, 120, BSS_CLIENT_ENEMY2, ARALE_RD },  // 敵２の右下
	{   38, 120, BSS_CLIENT_MINE2, ARALE_LU  },  // 味方２の左上

};

enum ARALE_WORK {
	AW_SEQ,
	AW_ACTCNT,
	AW_CONT_ACTCNT,
	AW_ADDACT_CNT,
	AW_TIMER,
	AW_ACT_TIMER,
};

static void TaskAraleMain(u8 id);
static void AraleIceMove(actWork *act);
static u8 arale_addact(u8 pos, u8 anm, u8 task_id, u8 work_no);
static const actHeader AraleHeader;

void TaskArale(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
//	FightCheck();
	my->TaskAdrs = TaskAraleMain;
}
static void TaskAraleMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[AW_SEQ]){
	case 0:
		if(++(my->work[AW_TIMER]) > ARALE_ADDACT_WAIT1){
			my->work[AW_TIMER] = 0;
			my->work[AW_ACT_TIMER] = 0;
			my->work[AW_CONT_ACTCNT] = 0;
			my->work[AW_SEQ]++;
		}
		break;

	case 1:
		if(my->work[AW_ACT_TIMER] == 0)
		{
			if(arale_addact(my->work[AW_ADDACT_CNT], my->work[AW_CONT_ACTCNT], id, AW_ACTCNT))
			{
				my->work[AW_ACTCNT]++;
			}

			if(++(my->work[AW_CONT_ACTCNT]) == ARALE_CONT_MAX)
			{
				if(++(my->work[AW_ADDACT_CNT]) == ARALE_ADD_MAX)
				{
					my->work[AW_SEQ]++;
				}
				else
				{
					my->work[AW_SEQ]--;
				}
			}else{
				my->work[AW_ACT_TIMER] = ARALE_ADDACT_WAIT2;
			}
		}
		else
		{
			my->work[AW_ACT_TIMER]--;
		}
		break;

	case 2:
		if(my->work[AW_ACTCNT] == 0)
		{
			DelTaskEffect(id);
		}
		break;
	}

}
//========================================================
//  あられｱｸﾀｰ１つ登録
//  pos  位置情報ﾃｰﾌﾞﾙ参照
//  anm  ｱﾆﾒﾅﾝﾊﾞｰ
//  task_id  管理ﾀｽｸID
//  work_no  ｱｸﾀｰｶｳﾝﾀとして使用しているﾜｰｸﾅﾝﾊﾞｰ
//
//  return:  1:登録成功  0:登録失敗（ｱｸﾀｰｵｰﾊﾞｰ)
//========================================================
static u8 arale_addact(u8 pos, u8 anm, u8 task_id, u8 work_no)
{
	s16 x, y, end_x, end_y;
	u8  no, hit_flg = 0;

	if(AralePosTbl[pos].arale_type == ARALE_FREE){
		end_x = AralePosTbl[pos].x;
		end_y = AralePosTbl[pos].y;
	}else{
		no = ClientNoGet(AralePosTbl[pos].client_type);
		if(PokeBG2taimeCheck(no)){
			hit_flg = 1;
			end_x = GetWazaEffPos(no, PM_X);
			end_y = GetWazaEffPos(no, PM_Y);
			switch(AralePosTbl[pos].arale_type){
			case ARALE_LU:
				end_x -= (W_GetPokeSize(no, POKESIZE_WIDTH) / 6);
				end_y -= (W_GetPokeSize(no, POKESIZE_HEIGHT) / 6);
				break;
			case ARALE_RD:
				end_x += (W_GetPokeSize(no, POKESIZE_WIDTH) / 6);
				end_y += (W_GetPokeSize(no, POKESIZE_HEIGHT) / 6);
				break;
			}
		}else{
			end_x = AralePosTbl[pos].x;
			end_y = AralePosTbl[pos].y;
		}
	}

	x = end_x - ((end_y-(-8))/ARALE_XY_RATIO);
	y = -8;

	no = AddActor(&AraleHeader,x,y,C_POKE2PRI - 2); // どのﾎﾟｹﾓﾝよりも高いﾌﾟﾗｲｵﾘﾃｨ
	if(no == ACT_MAX){
		return 0;
	}

	ActAffAnmChg(&ActWork[no], anm);
	ActWork[no].work[0] = hit_flg;
	ActWork[no].work[3] = end_x;
	ActWork[no].work[4] = end_y;
	ActWork[no].work[5] = anm;
	ActWork[no].work[6] = task_id;
	ActWork[no].work[7] = work_no;

	return 1;
}


static void AraleActMove(actWork *act)
{
	act->x += ARALE_XSPEED;
	act->y += ARALE_YSPEED;
	if(act->x >= act->work[3]
	|| act->y >= act->work[4]
	){
		if(act->work[0] == 1 && act->work[5] == 0)  // ｸﾞﾙｰﾌﾟ先頭のｱｸﾀｰ
		{
			act->work[0] = AddActor(&ActIceKoukaHeader, act->work[3], act->work[4], act->pri);
			if(act->work[0] != ACT_MAX)
			{
				ActWork[act->work[0]].move = AraleIceMove;
				ActWork[act->work[0]].work[6] = act->work[6];
				ActWork[act->work[0]].work[7] = act->work[7];
			}
			AffineWorkNumDel(act->oamData.AffineParamNo);
			DelActor(act);
		}
		else                   // それ以外
		{
			TaskTable[act->work[6]].work[act->work[7]]--;
			AffineWorkNumDel(act->oamData.AffineParamNo);
			DelActor(act);
		}
	}
}

static void AraleIceMove(actWork *act)
{
//	act->banish ^= 1;
	if(++act->work[0] == 20)
	{
		TaskTable[act->work[6]].work[act->work[7]]--;
		AffineWorkNumDel(act->oamData.AffineParamNo);
		DelActor(act);
	}
}

static const actAffAnm AraleAffAnm[] =
{
	{ 0x100,0x100,0,ACT_AFSET},{ACT_AFEND,0,0,0},
	{ 0xf0,0xf0,0,ACT_AFSET},{ACT_AFEND,0,0,0},
	{ 0xe0,0xe0,0,ACT_AFSET},{ACT_AFEND,0,0,0},
	{ 0x150,0x150,0,ACT_AFSET},{ACT_AFEND,0,0,0},
};
static const actAffAnm * const AraleAffAnmTbl[] = {
	AraleAffAnm+0,
	AraleAffAnm+2,
	AraleAffAnm+4,
	AraleAffAnm+6,
};
static const actHeader AraleHeader = {
	WAZACHR_ID_ARALE,
	WAZACHR_ID_ARALE,
	&WazaOamDataAffine[1],
	DummyActAnmTbl,
	0,
	AraleAffAnmTbl,
	AraleActMove,
};




extern void SeqWazaBallAttackInit(actWork *Xreg);
const actHeader ActWeatherArareHeader = {
	WAZACHR_ID_ARALE,
	WAZACHR_ID_ARALE,
	&WazaOamDataAffine[1],
	DummyActAnmTbl,
	0,
	&AraleAffAnmTbl[3],
	SeqWazaBallAttackInit,
};







//=========================================================================
//
//		アイスボール
//												by matsuda 2002.08.02(金)
//=========================================================================
static void IceBallInit(actWork *xreg);
static void IceBallMain(actWork *xreg);
static void IceCrashInit(actWork *xreg);
static void IceCrashMain(actWork *xreg);

#define ICEBALL_ANMWAIT		4
static const actAnm IceBallAnm0[]={
	{OBJ16_32x32*0,1,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm IceBallAnm1[]={
	{OBJ16_32x32*1,ICEBALL_ANMWAIT,0,0},
	{OBJ16_32x32*2,ICEBALL_ANMWAIT,0,0},
	{OBJ16_32x32*3,ICEBALL_ANMWAIT,0,0},
	{OBJ16_32x32*4,ICEBALL_ANMWAIT,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm *const IceBallAnmTbl[]={
	IceBallAnm0,
	IceBallAnm1,
};

static const actAffAnm IceBallAff0[] =
{
	{ 0xe0, 0xe0, 0, ACT_AFSET},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm IceBallAff1[] =
{
	{ 0x118, 0x118, 0, ACT_AFSET},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm IceBallAff2[] =
{
	{ 0x150, 0x150, 0, ACT_AFSET},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm IceBallAff3[] =
{
	{ 0x180, 0x180, 0, ACT_AFSET},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm IceBallAff4[] =
{
	{ 0x1c0, 0x1c0, 0, ACT_AFSET},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm * const IceBallAffTbl[] = {
	IceBallAff0,
	IceBallAff1,
	IceBallAff2,
	IceBallAff3,
	IceBallAff4,
};
const actHeader IceBallHeader = {
	WAZACHR_ID_ICE,
	WAZACHR_ID_ICE,
	&WazaOamDataAffine2[2],
	IceBallAnmTbl,
	0,
	IceBallAffTbl,
	IceBallInit,
};

const	actHeader IceCrashHeader={	//アイスボールで使用
	WAZACHR_ID_YUKI2,
	WAZACHR_ID_YUKI2,
	&WazaOamDataNormal[0],
	&YukiAnmTbl[2],
	0,
	DummyActAffTbl,
	IceCrashInit,
};

//----------------------------------------------------------
//	offset	0:Xoffset	1:Yoffset	2:終点Xoffset	3:終点Yoffset	4:Sync回数
//			5:Y振り幅
//----------------------------------------------------------
static void IceBallInit(actWork *xreg)
{
	u8 afftbl;
	
	afftbl = pwkc->korogarucnttmp - pwkc->korogarucnt - 1;
	if(afftbl > 4)
		afftbl = 4;
	ActAffAnmChg(xreg, afftbl);
	
	WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[0] = WazaEffWork[4];
	if(MineEnemyCheck(AttackNo))
		WazaEffWork[2] = -WazaEffWork[2];
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X) + WazaEffWork[2];
	xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y) + WazaEffWork[3];
	xreg->work[5] = WazaEffWork[5];
	YamanariMoveInit(xreg);
	xreg->move = IceBallMain;
}

static void IceBallMain(actWork *xreg)
{
	if(YamanariMoveMain(xreg)){
		ActAnmChg(xreg, 1);
		xreg->move = W_AnmEndWait;
		SetWorkSeq(xreg, DelWazaEffect);
	}
}


//----------------------------------------------------------
//	0:Xoffset	1:Yoffset
//----------------------------------------------------------
#define ICECRASH_ENDWAIT		20
#define ICECRASH_SP_X		0x0100
#define ICECRASH_SP_Y		0x0280
static void IceCrashInit(actWork *xreg)
{
	s16 x_offs, y_offs;
	
	xreg->oamData.CharNo += 0x8;
	WazaDefaultPosSet1(xreg, PM_MODE);
	x_offs = ICECRASH_SP_X + (pp_rand() & 0xff);
	y_offs = pp_rand() & 0x01ff;
	if(y_offs >= 0x0100)
		y_offs = -(y_offs-0x0100);
	xreg->work[1] = x_offs;
	xreg->work[2] = y_offs;
	xreg->move = IceCrashMain;
}

static void IceCrashMain(actWork *xreg)
{
	xreg->work[3] += xreg->work[1];
	xreg->work[4] += xreg->work[2];
	if(xreg->work[1] & 1)
		xreg->dx = -(xreg->work[3] >> 8);
	else
		xreg->dx = xreg->work[3] >> 8;
	xreg->dy = xreg->work[4] >> 8;
	
	if(xreg->work[0]++ == ICECRASH_ENDWAIT)
		DelWazaEffect(xreg);
}


//----------------------------------------------------------
//	今、何回目の攻撃か取得する
//	WazaEffWork[?]に結果が入ります。(0～4)
//	0:結果を入れるWazaEffWorkの添え字
//----------------------------------------------------------
void IceBallTurnWorkSet(u8 id)
{
	u8 soeji;
	
	soeji = WazaEffWork[0];
	WazaEffWork[soeji] = pwkc->korogarucnttmp - pwkc->korogarucnt - 1;
	DelTaskEffect(id);
}


