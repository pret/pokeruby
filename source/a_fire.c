//=========================================================================
//	
//	炎系 技エフェクト
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
#include "mus_tool.h"
#include "cli_def.h"
#include "bss.h"

#include "ef_tool.h"




//=========================================================================
//
//		「ほのおのパンチ」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaHonooInit(actWork *Xreg);
static void SeqWazaHonooSubInit(actWork *Xreg);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define	ANM_WAIT_P	4
#define HONOO_FURIHABA			60
#define HONOO_ADD_SEC			9
#define	HONOO_SUB_FURIHABA		(-0x0200)
#define HONOO_LOOP				(abs((HONOO_FURIHABA << 8) / HONOO_SUB_FURIHABA))

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm HonoonoPantiAnm0[]={
//		{OBJ16_32x32*0,ANM_WAIT_P,0,0},
		{OBJ16_32x32*1,ANM_WAIT_P,0,0},
		{OBJ16_32x32*2,ANM_WAIT_P,0,0},
		{OBJ16_32x32*3,ANM_WAIT_P,0,0},
//		{OBJ16_32x32*4,ANM_WAIT_P,0,0},
		{ACT_ANMLOOP,0,0,0}
};
static const actAnm HonoonoPantiAnm1[]={
//		{OBJ16_32x32*0,ANM_WAIT_P,1,1},
		{OBJ16_32x32*1,ANM_WAIT_P,1,1},
		{OBJ16_32x32*2,ANM_WAIT_P,1,1},
		{OBJ16_32x32*3,ANM_WAIT_P,1,1},
//		{OBJ16_32x32*4,ANM_WAIT_P,1,1},
		{ACT_ANMLOOP,0,0,0}
};
static const actAnm *const HonoonoPantiAnmTbl[]={
		HonoonoPantiAnm0,
		HonoonoPantiAnm1,
};
const	actHeader ActHonoonoPantiHeader={
	WAZACHR_ID_FIRE,
	WAZACHR_ID_FIRE,
	&WazaOamDataNormal[2],
	HonoonoPantiAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaHonooInit,
};

const	actHeader ActHonoonoPantiSubHeader={
	WAZACHR_ID_FIRE,
	WAZACHR_ID_FIRE,
	&WazaOamDataNormal[2],
	HonoonoPantiAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaHonooSubInit,
};

//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------
//=========================================================================
//	offset 0:角度初期値
//=========================================================================
static void SeqWazaHonooInit(actWork *Xreg)
{
	Xreg->work[0] = WazaEffWork[0];
	Xreg->work[1] = HONOO_FURIHABA;
	Xreg->work[2] = HONOO_ADD_SEC;
	Xreg->work[3] = HONOO_LOOP;
	Xreg->work[4] = HONOO_SUB_FURIHABA;
	
	SetWorkSeq(Xreg, DelWazaEffect);
	Xreg->move = PMObjKaiten2;
	Xreg->move(Xreg);
}


//----------------------------------------------------------
//	サブ(ﾊﾟﾝﾁの後、飛び散る炎)
// offset 0:Xoffset  1:Yoffset
//		  2:dxに足す値(固定少数)  3:dyに足す値(固定少数)
// 		  4:ﾙｰﾌﾟ回数
//----------------------------------------------------------
static void SeqWazaHonooSubInit(actWork *Xreg)
{
	EffXpositionSet(Xreg, WazaEffWork[0]);
	Xreg->y += WazaEffWork[1];

	Xreg->work[0] = WazaEffWork[4];
	Xreg->work[1] = WazaEffWork[2];
	Xreg->work[2] = WazaEffWork[3];
	Xreg->move = W_ParallelMove2Seq;
	SetWorkSeq(Xreg, DelWazaEffect);
}












//=========================================================================
//
//		「せいなるほのお」
//														by mori
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaSeinaruHonooInit( actWork * Xreg );
static void SeqWazaSeinaruHonoo2Init( actWork * Xreg );
static void SeqWazaSeinaruHonoo( actWork * Xreg );

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm SeinaruHonooAnm[]={		//ほのお
		{OBJ16_32x32*0,3,0,0},			
		{OBJ16_32x32*1,3,0,0},
		{OBJ16_32x32*2,3,0,0},
		{OBJ16_32x32*3,3,0,0},
		{OBJ16_32x32*4,3,0,0},
		{OBJ16_32x32*5,3,0,0},
		{OBJ16_32x32*6,3,0,0},
		{OBJ16_32x32*7,3,0,0},
		{ACT_ANMLOOP,0,0,0}
};

static const actAnm *const SeinaruHonooAnmTbl[]={
		SeinaruHonooAnm,
};

static const actAnm SeinaruHonoo2Anm[]={		//ほのお
		{OBJ16_32x32*0,5,0,0},			
		{OBJ16_32x32*1,5,0,0},
		{OBJ16_32x32*2,5,0,0},
		{OBJ16_32x32*3,5,0,0},
		{OBJ16_32x32*4,5,0,0},
		{ACT_ANMLOOP,0,0,0}
};
static const actAnm *const SeinaruHonoo2AnmTbl[]={
		SeinaruHonoo2Anm,
};

static const actAffAnm SeinaruAffanm[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x32, 0x100, 0, ACT_AFSET },		// 0
	{ 32, 0, 0,  7},					//横方向に拡大
	{ACT_AFEND,0,0,0},					// 終了
};

static const	actAffAnm * const SeinaruAfftbl[] = {
	SeinaruAffanm,
};


const	actHeader ActSeinaruHonooHeader={	//拡縮で現れる炎
	WAZACHR_ID_MERAMERA,
	WAZACHR_ID_MERAMERA,
	&WazaOamDataAffine[2],
	SeinaruHonooAnmTbl,
	0,
	SeinaruAfftbl,
	SeqWazaSeinaruHonooInit,

};

const	actHeader ActSeinaruHonoo2Header={	//そのままの炎
	WAZACHR_ID_MERAMERA,
	WAZACHR_ID_MERAMERA,
	&WazaOamDataNormal[2],
	SeinaruHonooAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaSeinaruHonooInit,

};

const	actHeader ActSeinaruHonoo3Header={	//地面からつきあがる炎
	WAZACHR_ID_HIBASIRA,
	WAZACHR_ID_HIBASIRA,
	&WazaOamDataNormal[2],
	SeinaruHonoo2AnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaSeinaruHonoo2Init,

};


const	actHeader ActSeinaruHonoo4Header={	//ちいさい炎
	WAZACHR_ID_FIRE,
	WAZACHR_ID_FIRE,
	&WazaOamDataNormal[2],
	SeinaruHonoo2AnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaSeinaruHonoo2Init,

};



//---------------------------------------------------------------
//	アクターシーケンス
//---------------------------------------------------------------
//----------------------------------------------------------
//	聖なるほのお	初期化
//	WazaEffWork[0]:	X
//	WazaEffWork[1]:	Y
//	WazaEffWork[2]:	ウェイト数
//	WazaEffWork[3]:	移動しつづけるウェイト数
//	WazaEffWork[4]:	移動量X
//	WazaEffWork[5]:	移動用Y
//----------------------------------------------------------
static void SeqWazaSeinaruHonoo2Init( actWork * Xreg )
{
	EffPositionReset(Xreg);

	if(MineEnemyCheck(AttackNo))
	{
		Xreg->x -= WazaEffWork[0];
		Xreg->y += WazaEffWork[1];
		Xreg->work[2] = -WazaEffWork[4];		//Ｘ移動
	}
	else									//自分に攻撃
	{
		Xreg->x += WazaEffWork[0];
		Xreg->y += WazaEffWork[1];
		Xreg->work[2] = WazaEffWork[4];		//Ｘ移動
	}

	Xreg->work[1] = WazaEffWork[2];		//ウェイト
	Xreg->work[4] = WazaEffWork[3];		//移動しつづける時間
	Xreg->work[3] = WazaEffWork[5];		//Ｙ移動
	Xreg->move = SeqWazaSeinaruHonoo;
}

//----------------------------------------------------------
//	聖なるほのお２	初期化
//	WazaEffWork[0]:	X
//	WazaEffWork[1]:	Y
//	WazaEffWork[2]:	ウェイト数
//	WazaEffWork[3]:	移動しつづけるウェイト数
//	WazaEffWork[4]:	移動量X
//	WazaEffWork[5]:	移動用Y
//----------------------------------------------------------
static void SeqWazaSeinaruHonooInit( actWork * Xreg )
{
	if(MineEnemyCheck(AttackNo))
	{
		Xreg->x -= WazaEffWork[0];
		Xreg->y += WazaEffWork[1];
		Xreg->work[2] = WazaEffWork[4];		//Ｘ移動
	}
	else									//自分に攻撃
	{
		Xreg->x += WazaEffWork[0];
		Xreg->y += WazaEffWork[1];
		Xreg->work[2] = -WazaEffWork[4];		//Ｘ移動
	}

	Xreg->work[1] = WazaEffWork[2];		//ウェイト
	Xreg->work[4] = WazaEffWork[3];		//移動しつづける時間
	Xreg->work[3] = WazaEffWork[5];		//Ｙ移動
	Xreg->move = SeqWazaSeinaruHonoo;
}

//----------------------------------------------------------
//	聖なるほのお
// offset:なし
//----------------------------------------------------------
static void SeqWazaSeinaruHonoo( actWork * Xreg )
{
	Xreg->work[0]++;
	
	if(Xreg->work[0]<Xreg->work[4]){
		Xreg->dx += Xreg->work[2];
		Xreg->dy += Xreg->work[3];
	}
	if(Xreg->work[0] == Xreg->work[1])
		W_AffCheckEndSeq(Xreg);
//		DelWazaEffect(Xreg);
}















//=========================================================================
//
//		「ほのおのうず」
//														by nohara
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
void SeqWazaUzuInit(actWork *Xreg);
void SeqWazaUzuKaiten(actWork *Xreg);

//----------------------------------------------------------
//	定数
//----------------------------------------------------------
#define UZU_PRI	8
#define PRI_CHANGE	10000		//振り幅2
#define ANM_WAIT	6

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm uzu_anm0[] =
{
	{OBJ16_32x32 * 1, ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 2, ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 3, ANM_WAIT, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm * const UzuAnmTbl[] = 
{
	uzu_anm0,
};
const	actHeader ActUzuHeader={
	WAZACHR_ID_FIRE,
	WAZACHR_ID_FIRE,
	&WazaOamDataNormal[2],
	UzuAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaUzuInit,
};

//-------------------------------------------------------------
//  アクターシーケンス
//-------------------------------------------------------------
void SeqWazaUzuInit(actWork *Xreg)
{
	EffPositionReset(Xreg);

	if(MineEnemyCheck(AttackNo))
		Xreg->x -= WazaEffWork[0];
	else
	{
		Xreg->x += WazaEffWork[0];
		Xreg->pri = UZU_PRI;	
	}

	Xreg->y += WazaEffWork[1];

	Xreg->work[0] = WazaEffWork[2];		//角度
	Xreg->work[1] = WazaEffWork[3];		//振り幅
	Xreg->work[2] = WazaEffWork[4];		//角度増加量
	Xreg->work[3] = WazaEffWork[5];		//LOOP

	Xreg->work[4] = WazaEffWork[6];		//振り幅増加量
	Xreg->work[5] = 0;					//計算用

	//SetWorkSeq(Xreg, W_AffCheckEndSeq);
	//Xreg->move = PMObjKaiten2;
	
	Xreg->move = SeqWazaUzuKaiten;		//途中でpri直す
}

void SeqWazaUzuKaiten(actWork *Xreg)
{
	if( Xreg->work[3] ) 
	{
		if( Xreg->work[5] > PRI_CHANGE )	
			Xreg->pri = 1;

		//円を描く
		Xreg->dx = SinMove(Xreg->work[0], Xreg->work[1] + (Xreg->work[5] >> 8));
		Xreg->dy = CosMove(Xreg->work[0], Xreg->work[1] + (Xreg->work[5] >> 8));

		//角度変化
		Xreg->work[0]+=Xreg->work[2];
		Xreg->work[5] += Xreg->work[4];

		if( Xreg->work[0] > 255 )
			Xreg->work[0]-=256;
		else if( Xreg->work[0] < 0 )
			Xreg->work[0]+=256;

		Xreg->work[3]--;
	}else
	{
		W_AffCheckEndSeq(Xreg);
	}
}










//=========================================================================
//
//		にほんばれ
//												by matsuda 2002.02.13(水)
//=========================================================================
static void NihonbareInit(actWork *xreg);
//static void NihonbareMain(actWork *xreg);

#define NIHONBARE_SYNC		60	//40

static const actAffAnm NihonbareAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x50, 0x50, 0, ACT_AFSET },
//	{ 2, 2, 20, 1},
	{ 2, 2, 10, 1},
	{ACT_AFLOOP,1,0,0},
};

static const	actAffAnm * const NihonbareAffTbl[] = {
	NihonbareAff0,
};
const	actHeader ActNihonbareHeader={
	WAZACHR_ID_HIZASI,
	WAZACHR_ID_HIZASI,
	&WazaOamDataBldAffine[2],
	DummyActAnmTbl,
	0,
	NihonbareAffTbl,
	NihonbareInit,
};

//----------------------------------------------------------
//	offsetなし
//----------------------------------------------------------
static void NihonbareInit(actWork *xreg)
{
	xreg->x = 0;
	xreg->y = 0;
	xreg->work[0] = NIHONBARE_SYNC;
	xreg->work[2] = 140;	//120;//GetWazaEffPos(AttackNo, PM_X);
	xreg->work[4] = 80;		//70;	//GetWazaEffPos(AttackNo, PM_Y);
#if 1
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, DelWazaEffect);
}
#else
	W_GetStraightSyncParam(xreg);
	xreg->move = NihonbareMain;
}

static void NihonbareMain(actWork *xreg)
{
	xreg->work[0] = 1;
	W_ParallelSync(xreg);
	if(xreg->x + xreg->dx > 240 || xreg->y + xreg->dy > 160)
		DelWazaEffect(xreg);
}
#endif








//=========================================================================
//
//		ひのこ
//												by matsuda 2002.02.15(金)
//=========================================================================
static void HinokoSubInit(actWork *xreg);

#define FIRE_ANMWAIT		4
static const actAnm FireAnm0[] =
{
	{OBJ16_32x32 * 0, FIRE_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 1, FIRE_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 2, FIRE_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 3, FIRE_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 4, FIRE_ANMWAIT, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
const actAnm * const FireAnmTbl[] = 
{
	FireAnm0,
};

//-- 飛んでいく火 --//
const	actHeader ActHinokoHeader={
	WAZACHR_ID_FIRE,
	WAZACHR_ID_FIRE,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	W_StraightMoveInit,
};

//-- 地を這う火 --//
const	actHeader ActHinokoSubHeader={
	WAZACHR_ID_FIRE,
	WAZACHR_ID_FIRE,
	&WazaOamDataNormal[2],
	FireAnmTbl,
	0,
	DummyActAffTbl,
	HinokoSubInit,
};

static void HinokoSubInit(actWork *xreg)
{
	if(MineEnemyCheck(AttackNo) == MineEnemyCheck(DefenceNo)){
		if(AttackNo == ClientNoGet(BSS_CLIENT_MINE2) ||
				AttackNo == ClientNoGet(BSS_CLIENT_ENEMY2))
			WazaEffWork[2] = -WazaEffWork[2];
	}
	xreg->move = W_OffsetSpaceMove;
	xreg->move(xreg);	//ｺﾝﾃｽﾄで中心にいる時のが一瞬見えてしまうのですぐ実行
}








//=========================================================================
//
//		やけど継続エフェクト
//												by matsuda 2002.09.03(火)
//=========================================================================
static void YakedoInit(actWork *xreg);

const	actHeader YakedoHeader={
	WAZACHR_ID_FIRE,
	WAZACHR_ID_FIRE,
	&WazaOamDataNormal[2],
	FireAnmTbl,
	0,
	DummyActAffTbl,
	YakedoInit,
};

static void YakedoInit(actWork *xreg)
{
	WazaEffWork[0] = -WazaEffWork[0];
	WazaEffWork[2] = -WazaEffWork[2];
	xreg->move = W_OffsetSpaceMove;
}













//=========================================================================
//
//		だいもんじ
//												by matsuda 2002.02.18(月)
//=========================================================================
static void DaimonjiInit(actWork *xreg);
static void DaimonjiStartWait(actWork *xreg);
static void DaimonjiMove(actWork *xreg);
static void DaimonjiEndWait(actWork *xreg);
static void DaimonjiCircle(actWork *xreg);

#define DAIMONJI_STARTWAIT	17
#define DAIMONJI_ENDWAIT	30
#define DAIMONJI_SYNC		25
#define DAIMONJI_FURIHABA_X	28
#define DAIMONJI_FURIHABA_Y	DAIMONJI_FURIHABA_X
#define DAIMONJI_SEC		20

const	actHeader ActDaimonjiHeader={
	WAZACHR_ID_FIRE,
	WAZACHR_ID_FIRE,
	&WazaOamDataNormal[2],
	FireAnmTbl,
	0,
	DummyActAffTbl,
	DaimonjiInit,
};
//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:初期角度
//----------------------------------------------------------
static void DaimonjiInit(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[7] = WazaEffWork[2];
	xreg->work[0] = 0;
	xreg->move = DaimonjiStartWait;
}

//-- 動き出すまでｳｪｲﾄ --//
static void DaimonjiStartWait(actWork *xreg)
{
	DaimonjiCircle(xreg);
	if(xreg->work[0]++ == DAIMONJI_STARTWAIT)
	{
//		xreg->x += xreg->dx;
//		xreg->y += xreg->dy;
//		xreg->dx = xreg->dy = 0;
		xreg->work[0] = DAIMONJI_SYNC;
		xreg->work[1] = xreg->x;
		xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X);
		xreg->work[3] = xreg->y;
		xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y);
		W_GetStraightSyncParam(xreg);
		xreg->move = DaimonjiMove;
	}
}

//-- 相手に向かって飛んでいく --//
static void DaimonjiMove(actWork *xreg)
{
	if(W_ParallelSync(xreg))
	{
		xreg->work[0] = 0;
		xreg->x = GetWazaEffPos(DefenceNo, PM_X);
		xreg->y = GetWazaEffPos(DefenceNo, PM_Y);
		xreg->dx = xreg->dy = 0;
		xreg->move = DaimonjiEndWait;
		xreg->move(xreg);
	}
	else
	{
		//-- ↓ここは "+=" なのでｻﾌﾞﾙｰﾁﾝは使えない --//
		xreg->dx += SinMove(xreg->work[7], DAIMONJI_FURIHABA_X);
		xreg->dy += CosMove(xreg->work[7], DAIMONJI_FURIHABA_Y);
		xreg->work[7] = 0xff & (xreg->work[7] + DAIMONJI_SEC);
	}
}

//-- しばらく相手の所で回り続けて消える --//
static void DaimonjiEndWait(actWork *xreg)
{
	DaimonjiCircle(xreg);
	if(xreg->work[0]++ == DAIMONJI_ENDWAIT)
		DelWazaEffect(xreg);
}

//-- サブルーチン --//
//-- 円を描く --//
static void DaimonjiCircle(actWork *xreg)
{
	xreg->dx = SinMove(xreg->work[7], DAIMONJI_FURIHABA_X);
	xreg->dy = CosMove(xreg->work[7], DAIMONJI_FURIHABA_Y);
	xreg->work[7] = 0xff & (xreg->work[7] + DAIMONJI_SEC);
}


//=========================================================================
//	だいもんじの「大」の部分	※野原君が書いたのをそのまま使用
//=========================================================================
//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define ANM_WAIT_D		6

void SeqWazaDaimon2Init(actWork *Xreg);		//「大」の字

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
const actAnm Daimon_anm0[] =
{
	{OBJ16_32x32 * 2, ANM_WAIT_D, 0, 0},
	{OBJ16_32x32 * 3, ANM_WAIT_D, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
const actAnm * const DaimonAnmTbl[] = 
{
	Daimon_anm0,
};
static const actAffAnm daimon_aff_anm0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0, 0, 0, 1 },						// ｳｪｲﾄ
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const actAffAnm daimon_aff_anm1[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0xa0, 0xa0, 0, ACT_AFSET },		// 小さくする
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const	actAffAnm * const daimon_aff_tbl[] = {
	daimon_aff_anm0,
	daimon_aff_anm1,
};
const	actHeader ActDaimon2Header={
	WAZACHR_ID_FIRE,
	WAZACHR_ID_FIRE,
	&WazaOamDataNormal[2],
	DaimonAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaDaimon2Init,
};

//-------------------------------------------------------------
//  アクターシーケンス 「大」の字を描く
//-------------------------------------------------------------
void SeqWazaDaimon2Init(actWork *Xreg)
{
	Xreg->x += WazaEffWork[0];
	Xreg->y += WazaEffWork[1];

	Xreg->work[0] = WazaEffWork[2];		//LOOP
	Xreg->work[1] = WazaEffWork[3];		//speed
	Xreg->work[2] = WazaEffWork[4];		//speed

	SetWorkSeq(Xreg, DelWazaEffect);
	Xreg->move = W_ParallelMoveSeq;
}










//=========================================================================
//
//		かえんぐるま
//												by matsuda 2002.02.18(月)
//=========================================================================
static void KaenGurumaInit(actWork *xreg);
static void KaenGurumaMain(actWork *xreg);
static void KaenGurumaMainInit(actWork *xreg);

#define KAENGURUMA_SEC				10
#define KAENGURUMA_ADD_FURIHABA		0x00d0

const	actHeader ActKaenGurumaHeader={
	WAZACHR_ID_FIRE,
	WAZACHR_ID_FIRE,
	&WazaOamDataNormal[2],
	FireAnmTbl,
	0,
	DummyActAffTbl,
	KaenGurumaInit,
};

extern void SeqWazaBallAttackInit(actWork *Xreg);
const	actHeader ActWeatherFireHeader={
	WAZACHR_ID_FIRE,
	WAZACHR_ID_FIRE,
	&WazaOamDataNormal[2],
	FireAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaBallAttackInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:Delするまでのｳｪｲﾄ
//	3:開始までのｳｪｲﾄ(ｱﾆﾒをずらすため皆同一にｽﾀｰﾄさせて、ｳｪｲﾄで差をつける)
//----------------------------------------------------------
static void KaenGurumaInit(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[1] = WazaEffWork[2];
	xreg->work[0] = WazaEffWork[3];
	xreg->banish = 1;
	xreg->move = W_WaitSeq;
	SetWorkSeq(xreg, KaenGurumaMainInit);
}

static void KaenGurumaMainInit(actWork *xreg)
{
	xreg->banish = 0;
	xreg->work[0] = xreg->work[1];
	xreg->work[1] = 0;
	xreg->move = KaenGurumaMain;
	xreg->move(xreg);
}

static void KaenGurumaMain(actWork *xreg)
{
	xreg->dx = SinMove(xreg->work[1], xreg->work[2] >> 8);
	xreg->dy = CosMove(xreg->work[1], xreg->work[2] >> 8);
	xreg->work[1] = 0xff & (xreg->work[1] + KAENGURUMA_SEC);
	xreg->work[2] += KAENGURUMA_ADD_FURIHABA;
	if(xreg->work[0]-- == 0)
		DelWazaEffect(xreg);
}



//=========================================================================
//	ふんか
//
//																taya
//=========================================================================
#define HUNKA_HURUE_WIDTH  (3)
#define HUNKA_HURUE_WAIT   (1)

#define HUNKA_TATEYURE_HEIGHT  (3)
#define HUNKA_TATEYURE_WAIT    (1)

#define HUNKA_1ST_X     (0xe0)
#define HUNKA_1ST_Y     (0x200)
#define HUNKA_1ST_SYNC  (32)
#define HUNKA_TAME_SYNC (4)
#define HUNKA_2ND_X_MINE   (0x180)
#define HUNKA_2ND_Y_MINE   (0xc0)
#define HUNKA_2ND_X_ENEMY  (0x180)
#define HUNKA_2ND_Y_ENEMY  (0xf0)
#define HUNKA_2ND_SYNC  (6)

#define HUNKA_POKEDOWN_HEIGHT (8)
#define HUNKA_POKEDOWN_WAIT   (HUNKA_1ST_SYNC / HUNKA_POKEDOWN_HEIGHT)

#define HUNKA_3RD_SYNC  (HUNKA_POKEDOWN_HEIGHT)


static void TaskHunkaActionMain(u8 id);
static void add_hunka_iwa_actor(u8 actno, u8 taskno, u8 workno);

//==============================================
//	ポケモン動作初期化（ワーク設定不要）
//==============================================
void TaskHunkaActiton(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[15] = W_GetPokeActNo(0);
	my->work[0] = 0;
	my->work[1] = 0;
	my->work[2] = 0;
	my->work[3] = 0;
	my->work[4] = ActWork[my->work[15]].y;       // 4:初期Ｙ座標
	my->work[5] = MineEnemyCheck(AttackNo);  // 5:自分側・相手側で処理を分ける
	my->work[6] = 0;  // 6: 岩ｱｸﾀｰのｶｳﾝﾀ


	PokeKakusyukuInit(my->work[15], 0);

	my->TaskAdrs = TaskHunkaActionMain;
}
//==============================================
//	メイン
//==============================================
static void TaskHunkaActionMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	// 拡縮セット（縮む）
	case 0:
		SetPokeKakusyukuStep(my, my->work[15], 0x100, 0x100, HUNKA_1ST_X, HUNKA_1ST_Y, HUNKA_1ST_SYNC);
		my->work[0]++;

	case 1:
		// ガタガタ震える
		if(++(my->work[1]) > HUNKA_HURUE_WAIT){
			my->work[1] = 0;
			my->work[2]++;
			if(my->work[2] & 1){
				ActWork[my->work[15]].dx = HUNKA_HURUE_WIDTH;
			}else{
				ActWork[my->work[15]].dx = -HUNKA_HURUE_WIDTH;
			}
		}
		// 相手側なら徐々にＹ座標を下げる
		if(my->work[5]){
			if(++(my->work[3]) > HUNKA_POKEDOWN_WAIT){
				my->work[3] = 0;
				ActWork[my->work[15]].y++;
			}
		}
		// 拡縮進行（縮む）
		if(!PokeKakusyukuStep(my)){
			PokeKakusyukuYHosei(my->work[15]);
			ActWork[my->work[15]].dx = 0;
			my->work[1] = 0;
			my->work[2] = 0;
			my->work[3] = 0;
			my->work[0]++;
		}
		break;

	case 2:
		// 少し待ち後、拡縮セット（伸びる）
		if(++(my->work[1]) > HUNKA_TAME_SYNC){
			if(my->work[5]){
				SetPokeKakusyukuStep(my, my->work[15], HUNKA_1ST_X, HUNKA_1ST_Y, HUNKA_2ND_X_ENEMY, HUNKA_2ND_Y_ENEMY, HUNKA_2ND_SYNC);
			}else{
				SetPokeKakusyukuStep(my, my->work[15], HUNKA_1ST_X, HUNKA_1ST_Y, HUNKA_2ND_X_MINE, HUNKA_2ND_Y_MINE, HUNKA_2ND_SYNC);
			}
			my->work[1] = 0;
			my->work[0]++;
		}
		break;

	case 3:
		// 拡縮進行（伸びる）
		if(!PokeKakusyukuStep(my)){
			add_hunka_iwa_actor(my->work[15], id, 6);
			my->work[0]++;
		}
		break;

	case 4:
		// 縦にガクガク震える
		if(++(my->work[1]) > HUNKA_TATEYURE_WAIT){
			my->work[1] = 0;
			my->work[2]++;
			if(my->work[2] & 1){
				ActWork[my->work[15]].dy += HUNKA_TATEYURE_HEIGHT;
			}else{
				ActWork[my->work[15]].dy -= HUNKA_TATEYURE_HEIGHT;
			}
		}
		// 少し待ち後、拡縮セット（戻る）
		if(++(my->work[3]) > 24){
			if(my->work[5]){
				SetPokeKakusyukuStep(my, my->work[15], HUNKA_2ND_X_ENEMY, HUNKA_2ND_Y_ENEMY, 0x100, 0x100, 8);
			}else{
				SetPokeKakusyukuStep(my, my->work[15], HUNKA_2ND_X_MINE, HUNKA_2ND_Y_MINE, 0x100, 0x100, 8);
			}
			if(my->work[2] & 1){
				ActWork[my->work[15]].dy -= HUNKA_TATEYURE_HEIGHT;
			}
			my->work[1] = 0;
			my->work[2] = 0;
			my->work[3] = 0;
			my->work[0]++;
		}
		break;

	case 5:
		// 相手側なら下げたＹ座標を徐々に戻す
		if(my->work[5]){
			ActWork[my->work[15]].y--;
		}
		// 拡縮進行（戻る）
		if(!PokeKakusyukuStep(my)){
			ActWork[my->work[15]].y = my->work[4];
			PokeKakusyukuEnd(my->work[15]);
			my->work[2] = 0;
			my->work[0]++;
		}
		break;

	case 6:
		// 岩が全部消えたら終了
		if(my->work[6] == 0){
			DelTaskEffect(id);
		}
		break;
	}
}
//======================================================================
//	岩ｱｸﾀｰ（小）登録
//======================================================================
#define HUNKA_IWA_S_MAX     (7)
#define HUNKA_IWA_S_ANMMAX  (5)

static void hunka_iwa_s_actmove(actWork *act);

static const actHeader HunkaIwaS_Header = {
	WAZACHR_ID_HUNKA,
	WAZACHR_ID_HUNKA,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	hunka_iwa_s_actmove,
};

static const s16 iwa_s_pow[HUNKA_IWA_S_MAX][2] = {
	{  -2, -5 },
	{  -1, -1 },
	{   3, -6 },
	{   4, -2 },
	{   2, -8 },
	{  -5, -5 },
	{   4, -7 },
};

static u16 calc_poke_top(u8 actno);
static void parabora_move_init(actWork *act, s16 xpow, s16 ypow);
static void parabora_move(actWork *act);

static void add_hunka_iwa_actor(u8 pokeact, u8 taskno, u8 workno)
{
	u16 i, actno, anmno, y, x;
	s8  xv;

	y = calc_poke_top(pokeact);
	x = ActWork[pokeact].x;

	if(MineEnemyCheck(AttackNo) == 0){
		x -= 12;
		xv = 1;
	}else{
		x += 16;
		xv = -1;
	}

	for(i = 0, anmno = 0; i < HUNKA_IWA_S_MAX; i++)
	{
		actno = AddActor(&HunkaIwaS_Header, x, y, 2);
		if(actno != ACT_MAX)
		{
			ActWork[actno].oamData.CharNo += ((16*4) + (4*anmno));
			if(++anmno >= HUNKA_IWA_S_ANMMAX){ anmno = 0; }
			parabora_move_init(&ActWork[actno], iwa_s_pow[i][0] * xv,iwa_s_pow[i][1]);
			ActWork[actno].work[6] = taskno;
			ActWork[actno].work[7] = workno;
			TaskTable[taskno].work[workno]++;
		}
	}
}

static void hunka_iwa_s_actmove(actWork *act)
{
	parabora_move(act);
	if(act->banish){
		TaskTable[act->work[6]].work[act->work[7]]--;
		DelActor(act);
	}
}

//=================================
//	ﾎﾟｹﾓﾝｱｸﾀｰの頂上部Ｙ座標を計算
//=================================
static u16 calc_poke_top(u8 actno)
{
	s16 y;
	y = ActWork[actno].y + ActWork[actno].dy + ActWork[actno].cy;
	if(MineEnemyCheck(AttackNo) == 0){
		y += 74;
	}else{
		y += 44;
	}
	return y;
}
static void parabora_move_init(actWork *act, s16 xpow, s16 ypow)
{
	act->work[0] = 0;
	act->work[1] = 0;
	act->work[2] = act->x << 3;
	act->work[3] = act->y << 3;
	act->work[4] = xpow << 3;
	act->work[5] = ypow << 3;

}
#define PARA_SYNC (2)
static void parabora_move(actWork *act)
{
	if(++(act->work[0]) > PARA_SYNC){
		u16 g;
		act->work[0] = 0;
		act->work[1]++;
		g = (u16)(act->work[1]);
		act->work[3] += (g * g);
	}

	act->work[2] += act->work[4];
	act->x = act->work[2] >> 3;

	act->work[3] += act->work[5];
	act->y = act->work[3] >> 3;

	// 画面から消えたら banish
	if( act->x < -8  ||
	    act->x > 248 ||
	    act->y < -8  ||
	    act->y > 120
	){
		act->banish = 1;
	}
}

//======================================================================
//	岩ｱｸﾀｰ（大）登録
//======================================================================
#define HUNKA_IWA_L_YURE_HEIGHT  (3)
#define HUNKA_IWA_L_YURE_WAIT    (1)

static void HunkaIwaL_ActInit(actWork *act);
static void HunkaIwaL_ActMove(actWork *act);

const actHeader ActHunkaIwaL_Header = {
	WAZACHR_ID_HUNKA,
	WAZACHR_ID_HUNKA,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	HunkaIwaL_ActInit,
};
//===============================================
//	初期化
//	0:X座標  1:Y座標  2:落下開始までのwait
//	3:着地Y座標  4:ｱﾆﾒﾅﾝﾊﾞｰ
//===============================================
static void HunkaIwaL_ActInit(actWork *act)
{
	act->x = WazaEffWork[0];
	act->y = WazaEffWork[1];
	act->work[0] = 0;
	act->work[1] = 0;
	act->work[2] = 0;
	act->work[6] = WazaEffWork[2];
	act->work[7] = WazaEffWork[3];
	act->oamData.CharNo += (WazaEffWork[4] * 16);
	act->move = HunkaIwaL_ActMove;
}
static void HunkaIwaL_ActMove(actWork *act)
{
	switch(act->work[0]){
	case 0:
		if(act->work[6]){
			act->work[6]--;
			break;
		}
		act->work[0]++;

	case 1:
		act->y += 8;
		if(act->y >= act->work[7]){
			act->y = act->work[7];
			act->work[0]++;
		}
		break;

	case 2:
		if(++(act->work[1]) > HUNKA_IWA_L_YURE_WAIT){
			act->work[1] = 0;
			act->work[2]++;
			if(act->work[2] & 1){
				act->dy = -HUNKA_IWA_L_YURE_HEIGHT;
			}else{
				act->dy = HUNKA_IWA_L_YURE_HEIGHT;
			}
		}
		if(++(act->work[3]) > 16){
			DelWazaEffect(act);
		}
		break;
	}
}















//=========================================================================
//
//		おにび
//												by matsuda 2002.06.07(金)
//=========================================================================
static void OniballMove(actWork *xreg);
static void OniballInit(actWork *xreg);
static void OnibiInit(actWork *xreg);

//-- 飛んでいく玉 --//
#define ONIBALL_ANMWAIT		5
static const actAnm OniballAnm0[]={
	{OBJ16_16x16*0, ONIBALL_ANMWAIT,0,0},
	{OBJ16_16x16*1, ONIBALL_ANMWAIT,0,0},
	{OBJ16_16x16*2, ONIBALL_ANMWAIT,0,0},
	{OBJ16_16x16*3, ONIBALL_ANMWAIT,0,0},
	{ACT_ANMLOOP,0,0,0}
};
static const actAnm OniballAnm1[]={	//多間接部分1
	{OBJ16_16x16*4, ONIBALL_ANMWAIT,0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm OniballAnm2[]={	//多間接部分2
	{OBJ16_16x16*5, ONIBALL_ANMWAIT,0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm OniballAnm3[]={	//多間接部分3
	{OBJ16_16x16*5, ONIBALL_ANMWAIT,0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const OniballAnmTbl[]={
	OniballAnm0,
	OniballAnm1,
	OniballAnm2,
	OniballAnm3,
};
const	actHeader OniballHeader={
	WAZACHR_ID_ONIBALL,
	WAZACHR_ID_ONIBALL,
	&WazaOamDataNormal[1],
	OniballAnmTbl,
	0,
	DummyActAffTbl,
	OniballInit,
};

//-- 渦巻く火 --//
#define ONIBI_ANMWAIT		5
static const actAnm OnibiAnm0[]={
	{OBJ16_32x32*0, ONIBI_ANMWAIT,0,0},
	{OBJ16_32x32*1, ONIBI_ANMWAIT,0,0},
	{OBJ16_32x32*2, ONIBI_ANMWAIT,0,0},
	{OBJ16_32x32*3, ONIBI_ANMWAIT,0,0},
	{ACT_ANMLOOP,0,0,0}
};
static const actAnm *const OnibiAnmTbl[]={
	OnibiAnm0,
};
const	actHeader OnibiHeader={
	WAZACHR_ID_ONIBI,
	WAZACHR_ID_ONIBI,
	&WazaOamDataNormal[2],
	OnibiAnmTbl,
	0,
	DummyActAffTbl,
	OnibiInit,
};

//----------------------------------------------------------
//	飛んでいく玉
//	0:Xoffset	1:Yoffset	2:玉属性(0:本体		1，2，3:多間接1，2，3)
//----------------------------------------------------------
#define ONIBALL_UP_SP	0x00C0	//0x0040
#define ONIBALL_UP_FURIHABA	4
#define ONIBALL_UP_ADDSEC	4
#define ONIBALL_UP_SYNC		0//40
#define ONIBALL_UP_WAIT		30
#define ONIBALL_MOVE_SP		0x0100
#define ONIBALL_MOVE_FURIHABA	16
#define ONIBALL_MOVE_ADDSEC		4
static void OniballInit(actWork *xreg)
{
	switch(xreg->work[0]){
		case 0:
			WazaDefaultPosSet2(xreg, EFF_MODE);
			ActAnmChg(xreg, WazaEffWork[2]);
			xreg->work[7] = WazaEffWork[2];
			if(MineEnemyCheck(AttackNo))
				xreg->work[4] = ONIBALL_UP_FURIHABA;
			else
				xreg->work[4] = -ONIBALL_UP_FURIHABA;
			
			xreg->oamData.Priority = GetPokeBGPri(DefenceNo);	//add_0827_iwa
			xreg->work[0]++;
			break;
		case 1:
			xreg->work[1] += ONIBALL_UP_SP;
			if(MineEnemyCheck(AttackNo))
				xreg->dy = -(xreg->work[1]>>8);
			else
				xreg->dy = (xreg->work[1]>>8);
			xreg->dx = SinMove(xreg->work[2], xreg->work[4]);
			xreg->work[2] = 0xff & (xreg->work[2] + ONIBALL_UP_ADDSEC);
			if(xreg->work[3]++ == ONIBALL_UP_SYNC){
				xreg->work[3] = 0;
				xreg->work[0]++;
			}
			break;
		case 2:
			xreg->dx = SinMove(xreg->work[2], xreg->work[4]);
			xreg->work[2] = 0xff & (xreg->work[2] + ONIBALL_UP_ADDSEC);
			if(xreg->work[3]++ == ONIBALL_UP_WAIT){
				xreg->x += xreg->dx;
				xreg->y += xreg->dy;
				xreg->dx = xreg->dy = 0;
				xreg->work[0] = ONIBALL_MOVE_SP;
				xreg->work[1] = xreg->x;
				xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X);
				xreg->work[3] = xreg->y;
				xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y);
				W_GetStraightSpParam(xreg);
				xreg->move = OniballMove;
			}
	}
}

static void OniballMove(actWork *xreg)
{
	s16 before, after;
	
	if(W_ParallelSync(xreg) == 0){
		xreg->dx += SinMove(xreg->work[5], ONIBALL_MOVE_FURIHABA);
		before = xreg->work[5];
		xreg->work[5] = 0xff & (xreg->work[5] + ONIBALL_MOVE_ADDSEC);
		after = xreg->work[5];
		if((before == 0 || before > 196) && (after > 0)){
			if(xreg->work[7] == 0)
				SePlayPan(SE_W172, WazaEffPan);
		}
	}
	else
		DelWazaEffect(xreg);
}


//----------------------------------------------------------
//	飛び散る火
//	0:初期角度
//----------------------------------------------------------
#define ONIBI_ADD_FURIHABA_X	0x0180
#define ONIBI_ADD_FURIHABA_Y	0x00a0
#define ONIBI_ADDSEC			7
#define ONIBI_SYNC				30
static void OnibiInit(actWork *xreg)
{
	if(xreg->work[0] == 0){
		xreg->work[1] = WazaEffWork[0];
		xreg->work[0]++;
	}
	
	xreg->work[3] += ONIBI_ADD_FURIHABA_X;
	xreg->work[4] += ONIBI_ADD_FURIHABA_Y;
	xreg->dx = SinMove(xreg->work[1], xreg->work[3] >> 8);
	xreg->dy = CosMove(xreg->work[1], xreg->work[4] >> 8);
	xreg->work[1] = 0xff & (xreg->work[1] + ONIBI_ADDSEC);

	if(sys.FieldBattleFlag){
		if(xreg->work[1] < 64 || xreg->work[1] > 195)
	//		xreg->pri = C_POKE1PRI - 1;
			xreg->oamData.Priority = GetPokeBGPri(DefenceNo);	//chg_0827_iwa
		else
	//		xreg->pri = C_POKE1PRI + 1;
			xreg->oamData.Priority = GetPokeBGPri(DefenceNo)+1;
	}else{
		if(xreg->work[1] < 64 || xreg->work[1] > 195)
			xreg->pri = C_POKE1PRI - 1;
		else
			xreg->pri = C_POKE1PRI + 1;
	}
	
	xreg->work[2]++;
	if(xreg->work[2] > ONIBI_SYNC / 3 * 2)
		xreg->banish ^= 1;
	if(xreg->work[2] == ONIBI_SYNC)
		DelWazaEffect(xreg);
}

















//=========================================================================
//
//	ねっぷう
//															by taya
//=========================================================================

//===============================================
// 敵があとずさる動き
//（ﾜｰｸ設定不要）
//===============================================
static void TaskNeppuuMoveMain(u8 id);
#define NEPPUU_YURE_WIDTH  (2)
#define NEPPUU_MOVE_SPEED  (2)
void TaskNeppuuMove(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[12] = (MineEnemyCheck(AttackNo)==SIDE_MINE)? 1 : -1;
	my->work[13] = 1 + PokeBG2taimeCheck(DefenceNo^2);  // 何体動かす？
	my->work[14] = W_GetPokeActNo(1);  // １体目ｱｸﾀｰﾅﾝﾊﾞｰ
	my->work[15] = W_GetPokeActNo(3);  // ２体目ｱｸﾀｰﾅﾝﾊﾞｰ


	my->TaskAdrs = TaskNeppuuMoveMain;
}

static void TaskNeppuuMoveMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		my->work[10] += (NEPPUU_MOVE_SPEED * my->work[12]);  // 10:x
		if(++(my->work[1]) > 1){
			my->work[1] = 0;
			my->work[2]++;
			if(my->work[2] & 1){
				my->work[11] = NEPPUU_YURE_WIDTH;  // 11:dx
			}else{
				my->work[11] = -NEPPUU_YURE_WIDTH;
			}
		}
		for(my->work[3] = 0; my->work[3] < my->work[13]; my->work[3]++)
		{
			ActWork[my->work[14 + my->work[3]]].dx = (my->work[10] + my->work[11]);
		}
		if(++(my->work[9]) == 16)
		{
			my->work[9] = 0;
			my->work[0]++;
		}
		break;

	case 1:
		if(++(my->work[1]) > 4){
			my->work[1] = 0;
			my->work[2]++;
			if(my->work[2] & 1){
				my->work[11] = NEPPUU_YURE_WIDTH;  // 11:dx
			}else{
				my->work[11] = -NEPPUU_YURE_WIDTH;
			}
		}
		for(my->work[3] = 0; my->work[3] < my->work[13]; my->work[3]++)
		{
			ActWork[my->work[14 + my->work[3]]].dx = (my->work[10] + my->work[11]);
		}
		if(++(my->work[9]) == 96)
		{
			my->work[9] = 0;
			my->work[0]++;
		}
		break;


	case 2:
		my->work[10] -= (NEPPUU_MOVE_SPEED * my->work[12]);  // 10:x
		if(++(my->work[1]) > 1){
			my->work[1] = 0;
			my->work[2]++;
			if(my->work[2] & 1){
				my->work[11] = NEPPUU_YURE_WIDTH;  // 11:dx
			}else{
				my->work[11] = -NEPPUU_YURE_WIDTH;
			}
		}
		for(my->work[3] = 0; my->work[3] < my->work[13]; my->work[3]++)
		{
			ActWork[my->work[14 + my->work[3]]].dx = (my->work[10] + my->work[11]);
		}
		if(++(my->work[9]) == 16)
		{
			my->work[0]++;
		}
		break;

	case 3:
		for(my->work[3] = 0; my->work[3] < my->work[13]; my->work[3]++)
		{
			ActWork[my->work[14 + my->work[3]]].dx = 0;
		}
		DelTaskEffect(id);
		break;

	}
}
// 技ＢＧを指定色にﾌｪｰﾄﾞさせる
// 0:evy  1:rgb
void NepuuBGFade(u8 id)
{
	WazaBgData wazabg;

	GetWazaEffBgAdrs(&wazabg);
	SoftFade(wazabg.PlttNo*16, 16, WazaEffWork[0], WazaEffWork[1]);

	DelTaskEffect(id);
}
