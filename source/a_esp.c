//=========================================================================
//	
//	エスパー系 技エフェクト
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
#include "poketool.h"

#include "task.h"
#include "bss.h"
#include "palanm.h"
#include "cli_def.h"
#include "fight.h"
#include "laster.h"
#include "mus_tool.h"


//=========================================================================
//
//		じこあんじ
//												by matsuda 2002.05.21(火)
//=========================================================================
#define JIKOANJI_ADDAFF		(-2)
#define JIKOANJI_LOOP		(abs(0x00f0	/ JIKOANJI_ADDAFF))
#define JIKOANJI_ADDSEC		(-10)
static const actAffAnm JikoanjiAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0x0100, 0x0100, 0, ACT_AFSET},
	{JIKOANJI_ADDAFF, JIKOANJI_ADDAFF, JIKOANJI_ADDSEC, JIKOANJI_LOOP},
	{ACT_AFEND,0,0,0},
};
static const	actAffAnm * const JikoanjiAffTbl[] = {
	JikoanjiAff0,
};
const	actHeader JikoanjiHeader={
	WAZACHR_ID_UZU,
	WAZACHR_ID_UZU,
	&WazaOamDataBldAffine[3],
	DummyActAnmTbl,
	0,
	JikoanjiAffTbl,
	W_AnmAffWaitDel,
};


















//=========================================================================
//
//		リフレクター、ひかりのかべ、ミラーコート、バリア
//												by matsuda 2002.02.20(水)
//=========================================================================
static void MirrorInit(actWork *xreg);
static void MirrorFadeIn(actWork *xreg);
static void MirrorMain(actWork *xreg);
static void MirrorFadeOut(actWork *xreg);
static void MirrorEnd(actWork *xreg);

const actHeader ActMirror0Header = 		//緑
{
	WAZACHR_ID_MIRROR0,
	WAZACHR_ID_MIRROR0,
	&WazaOamDataBldNormal[3],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	MirrorInit,
};
const actHeader ActMirror1Header = 		//青
{
	WAZACHR_ID_MIRROR1,
	WAZACHR_ID_MIRROR1,
	&WazaOamDataBldNormal[3],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	MirrorInit,
};
const actHeader ActMirror2Header = 		//赤
{
	WAZACHR_ID_MIRROR2,
	WAZACHR_ID_MIRROR2,
	&WazaOamDataBldNormal[3],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	MirrorInit,
};
const actHeader ActMirror3Header = 		//灰
{
	WAZACHR_ID_MIRROR3,
	WAZACHR_ID_MIRROR3,
	&WazaOamDataBldNormal[3],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	MirrorInit,
};
const actHeader ActMirror4Header = 		//黄
{
	WAZACHR_ID_MIRROR4,
	WAZACHR_ID_MIRROR4,
	&WazaOamDataBldNormal[3],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	MirrorInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:WAZACHR_ID
//----------------------------------------------------------
#define MIRROR_BLD_MAX	13
#define MIRROR_PALWAIT	1
#define MIRROR_2VS2_MINE_X	72
#define MIRROR_2VS2_MINE_Y	80
#define MIRROR_2VS2_ENEMY_X	176
#define MIRROR_2VS2_ENEMY_Y	40

static void MirrorInit(actWork *xreg)
{
	u8 pal_no;
	u8 bg_no, client_no;
	
	//敵と自分の間の領域に出すためBGより低くする
	if(MineEnemyCheck(AttackNo) == SIDE_MINE || ContestCheck()){
//		xreg->oamData.Priority = GetPokeBGPri(AttackNo)+1;
		xreg->oamData.Priority = POKE_OAM_PRI;//GetPokeBGPri(AttackNo);
		xreg->pri = 200;
	}
	
	if(ContestCheck() == 0){
		//常にENEMY側をBGに落す
		client_no = ClientNoGet(BSS_CLIENT_ENEMY);
		if(GetPokeBGNo(client_no) == 1)
			bg_no = 0;	//ﾌﾟﾗｲｵﾘﾃｨの関係上、1体目、又はｺﾝﾃｽﾄならBG1に落す
		else
			bg_no = 1;

		if(PokeBG2taimeCheck(client_no))
			PokeBGDrop(client_no, bg_no);
		if(PokeBG2taimeCheck(client_no^2))
			PokeBGDrop(client_no^2, bg_no^1);
	}
	
	if(ContestCheck() == 0 && FightCheck()){	//2vs2対戦の時は座標を固定
		if(MineEnemyCheck(AttackNo) == SIDE_MINE){
			xreg->x = MIRROR_2VS2_MINE_X;
			xreg->y = MIRROR_2VS2_MINE_Y;
		}
		else{
			xreg->x = MIRROR_2VS2_ENEMY_X;
			xreg->y = MIRROR_2VS2_ENEMY_Y;
		}
	}
	else{
		//WazaDefaultPosSet2(xreg, EFF_MODE);
		if(MineEnemyCheck(AttackNo))
			WazaEffWork[0] = -WazaEffWork[0];
		xreg->x = GetWazaEffPos(AttackNo, EFF_X) + WazaEffWork[0];
		xreg->y = GetWazaEffPos(AttackNo, EFF_Y) + WazaEffWork[1];
	}
	
	if(ContestCheck())
		xreg->y += 9;	//審判にかぶらないように下げる
		
	pal_no = ObjPalNumGet(WazaEffWork[2]);
	xreg->work[0] = pal_no * 16 + 16*16;
	xreg->move = MirrorFadeIn;
	xreg->move(xreg);
}

static void MirrorFadeIn(actWork *xreg)
{
	*(vu16*)REG_BLDALPHA = xreg->work[3] | ((16-xreg->work[3]) << 8);
	if(xreg->work[3] == MIRROR_BLD_MAX)
		xreg->move = MirrorMain;
	else
		xreg->work[3]++;
}

static void MirrorMain(actWork *xreg)
{
	int i;
	u16 temp_color;
	u16 palno;
	
	if(xreg->work[1]++ == MIRROR_PALWAIT)
	{
		xreg->work[1] = 0;
		
		palno = xreg->work[0];
		temp_color = PaletteWorkTrans[palno + 8];
		for(i = 8; i > 0; i--)
			PaletteWorkTrans[palno+i] = PaletteWorkTrans[palno+i-1];
		PaletteWorkTrans[palno+1] = temp_color;
		
		if(++xreg->work[2] == 16)	//ﾊﾟﾚｯﾄｱﾆﾒを2週したかﾁｪｯｸ
			xreg->move = MirrorFadeOut;
	}
}

static void MirrorFadeOut(actWork *xreg)
{
	u8 client_no;
	
	*(vu16*)REG_BLDALPHA = xreg->work[3] | ((16-xreg->work[3]) << 8);
	if(xreg->work[3]-- == 0){
		if(ContestCheck() == 0){
			//常にENEMY側をBGに落す
			client_no = ClientNoGet(BSS_CLIENT_ENEMY);
			if(PokeBG2taimeCheck(client_no))
				ActWork[PokemonStruct[client_no]].banish = 0;
			if(PokeBG2taimeCheck(client_no^2))
				ActWork[PokemonStruct[client_no^2]].banish = 0;
		}
		
		xreg->banish = 1;
		xreg->move = MirrorEnd;
//		DelWazaEffect(xreg);
	}
}

static void MirrorEnd(actWork *xreg)
{
	u8 client_no, bg_no;

	if(ContestCheck() == 0){
		//常にENEMY側をBGに落す
		client_no = ClientNoGet(BSS_CLIENT_ENEMY);
		if(GetPokeBGNo(client_no) == 1)
			bg_no = 0;	//ﾌﾟﾗｲｵﾘﾃｨの関係上、1体目、又はｺﾝﾃｽﾄならBG1に落す
		else
			bg_no = 1;

		if(PokeBG2taimeCheck(client_no))
			PokeBGDropClear(bg_no);
		if(PokeBG2taimeCheck(client_no^2))
			PokeBGDropClear(bg_no^1);
	}
	xreg->move = DelWazaEffect;
}


//----------------------------------------------------------
//	壁と一緒に出す光
//----------------------------------------------------------
static void MirrorHikariInit(actWork *xreg);

//-- 「キランッ」と光るやつ --//
#define LKIRAN_WAIT		3
static const actAnm lkiranAnm0[]={
	{OBJ16_32x32 * 0, LKIRAN_WAIT, 0, 0},
	{OBJ16_32x32 * 1, LKIRAN_WAIT, 0, 0},
	{OBJ16_32x32 * 2, LKIRAN_WAIT, 0, 0},
	{OBJ16_32x32 * 3, LKIRAN_WAIT, 0, 0},
	{OBJ16_32x32 * 4, LKIRAN_WAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm *const LkiranAnmTbl[]={
		lkiranAnm0,
};
const	actHeader ActLKiranHeader={
	WAZACHR_ID_L_HIKARI,
	WAZACHR_ID_L_HIKARI,
	&WazaOamDataNormal[2],
	LkiranAnmTbl,
	0,
	DummyActAffTbl,
	MirrorHikariInit,
};

//-- 「キラキラ」光るやつ --//
#define SKIRAN_WAIT		5
static const actAnm skiranAnm0[]={
	{OBJ16_16x16 * 0, SKIRAN_WAIT, 0, 0},
	{OBJ16_16x16 * 1, SKIRAN_WAIT, 0, 0},
	{OBJ16_16x16 * 2, SKIRAN_WAIT, 0, 0},
	{OBJ16_16x16 * 3, SKIRAN_WAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm *const skiranAnmTbl[]={
		skiranAnm0,
};
const	actHeader ActSKiranHeader={
	WAZACHR_ID_S_HIKARI,
	WAZACHR_ID_S_HIKARI,
	&WazaOamDataNormal[1],
	skiranAnmTbl,
	0,
	DummyActAffTbl,
	MirrorHikariInit,
};

//----------------------------------------------------------
// offset 0:Xoffset  1:Yoffset  2: 0=攻撃側に出す  1=防御側に出す
//		  3:座標ﾓｰﾄﾞ(0:PMﾓｰﾄﾞ	1:EFFﾓｰﾄﾞ)
//----------------------------------------------------------
static void MirrorHikariInit(actWork *xreg)
{
	u8 mode;
	
	if(xreg->work[0] == 0)	//flag
	{
		if(WazaEffWork[3] == 0)
			mode = PM_MODE;
		else
			mode = EFF_MODE;
		
		if(ContestCheck() == 0 && FightCheck()){	//2vs2対戦の時は座標を固定
			if(MineEnemyCheck(AttackNo) == SIDE_MINE){
				xreg->x = MIRROR_2VS2_MINE_X - WazaEffWork[0];
				xreg->y = MIRROR_2VS2_MINE_Y + WazaEffWork[1];
			}
			else{
				xreg->x = MIRROR_2VS2_ENEMY_X + WazaEffWork[0];
				xreg->y = MIRROR_2VS2_ENEMY_Y + WazaEffWork[1];
			}
		}
		else{
			if(WazaEffWork[2] == 0)
				WazaDefaultPosSet2(xreg, mode);
			else
				WazaDefaultPosSet1(xreg, mode);
		}
		
		xreg->work[0]++;	//初回flag on
	}
	else
	{
		if(xreg->anmend_sw == 1 || xreg->affend_sw == 1)
			W_AffCheckEndSeq(xreg);
	}
}














//=========================================================================
//
//		サイケこうせん
//												by matsuda 2002.02.21(木)
//=========================================================================
const	actHeader ActSaikeKousenHeader={
	WAZACHR_ID_ONPA,
	WAZACHR_ID_ONPA,
	&WazaOamDataNormal[10],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	W_StraightMoveInit,
};



//=========================================================================
//
//		スプーンまげ
//																by taya
//=========================================================================
#define SPOON_WAIT_LL  (60)
#define SPOON_WAIT_L   (22)
#define SPOON_WAIT_M   (20)
#define SPOON_WAIT_S   (5)
#define SPOON_WAIT_SS  (3)
#define SPOON_XOFS     (40)
#define SPOON_YOFS     (10)

static void WazaSpoonInit(actWork *Xreg);

static const actAnm SpoonAnm0[]={
	{OBJ16_16x32 * 1, SPOON_WAIT_LL, 1, 0},
	{OBJ16_16x32 * 2, SPOON_WAIT_S, 1, 0},
	{OBJ16_16x32 * 1, SPOON_WAIT_S, 1, 0},
	{OBJ16_16x32 * 0, SPOON_WAIT_S, 1, 0},
	{OBJ16_16x32 * 1, SPOON_WAIT_L, 1, 0},
	{ACT_ANMcLOOP, 0, 0, 0 },
	{OBJ16_16x32 * 2, SPOON_WAIT_S, 1, 0},
	{OBJ16_16x32 * 1, SPOON_WAIT_S, 1, 0},
	{OBJ16_16x32 * 0, SPOON_WAIT_S, 1, 0},
	{OBJ16_16x32 * 1, SPOON_WAIT_S, 1, 0},
	{ACT_ANMcLOOP, 1, 0, 0 },
	{OBJ16_16x32 * 1, SPOON_WAIT_L, 1, 0},
	{OBJ16_16x32 * 3, SPOON_WAIT_SS, 1, 0},
	{OBJ16_16x32 * 4, SPOON_WAIT_SS, 1, 0},
	{OBJ16_16x32 * 5, SPOON_WAIT_L, 1, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm SpoonAnm1[]={
	{OBJ16_16x32 * 1, SPOON_WAIT_LL, 0, 0},
	{OBJ16_16x32 * 2, SPOON_WAIT_S, 0, 0},
	{OBJ16_16x32 * 1, SPOON_WAIT_S, 0, 0},
	{OBJ16_16x32 * 0, SPOON_WAIT_S, 0, 0},
	{OBJ16_16x32 * 1, SPOON_WAIT_L, 0, 0},
	{ACT_ANMcLOOP, 0, 0, 0 },
	{OBJ16_16x32 * 2, SPOON_WAIT_S, 0, 0},
	{OBJ16_16x32 * 1, SPOON_WAIT_S, 0, 0},
	{OBJ16_16x32 * 0, SPOON_WAIT_S, 0, 0},
	{OBJ16_16x32 * 1, SPOON_WAIT_S, 0, 0},
	{ACT_ANMcLOOP, 1, 0, 0 },
	{OBJ16_16x32 * 1, SPOON_WAIT_L, 0, 0},
	{OBJ16_16x32 * 3, SPOON_WAIT_SS, 0, 0},
	{OBJ16_16x32 * 4, SPOON_WAIT_SS, 0, 0},
	{OBJ16_16x32 * 5, SPOON_WAIT_L, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm *const SpoonAnmTbl[]={
	SpoonAnm0,
	SpoonAnm1,
};

const actHeader ActSpoonHeader = {
	WAZACHR_ID_SPOON,
	WAZACHR_ID_SPOON,
	&WazaOamDataNormal[10],
	SpoonAnmTbl,
	0,
	DummyActAffTbl,
	WazaSpoonInit,
};

//==============================================
//	初期化（ワーク初期化不要）
//==============================================
static void WazaSpoonInit(actWork *Xreg)
{
	Xreg->x = GetWazaEffPos(AttackNo, PM_X);
	Xreg->y = GetWazaEffPos(AttackNo, PM_Y);

	if(MineEnemyCheck(AttackNo)){
		ActAnmChg(Xreg, 1);
		Xreg->x -= SPOON_XOFS;
		Xreg->y += SPOON_YOFS;
		Xreg->work[1] = -1;
	}else{
		Xreg->x += SPOON_XOFS;
		Xreg->y -= SPOON_YOFS;
		Xreg->work[1] = 1;
	}

	SetWorkSeq(Xreg, DelWazaEffect);
	Xreg->move = W_AnmEndWait;
}

//=========================================================================
//
//	ドわすれ
//																by taya
//=========================================================================
#define DOWASURE_WAIT   (6)
#define DOWASURE_WAIT_L (18)
#define DOWASURE_XOFS  (40)
#define DOWASURE_MINE_YOFS   (2)
#define DOWASURE_ENEMY_YOFS  (14)

#define DOWASURE_YPOS_MIN  (16)

static void DoWasureInit(actWork *Xreg);
static void DoWasureLeanInit(actWork *Xreg);
static void DoWasureLean(actWork *Xreg);

static const actAnm DoWasureAnm[]={
	{OBJ16_32x32 * 0, DOWASURE_WAIT, 0, 0 },
	{OBJ16_32x32 * 1, DOWASURE_WAIT, 0, 0 },
	{OBJ16_32x32 * 2, DOWASURE_WAIT, 0, 0 },
	{OBJ16_32x32 * 3, DOWASURE_WAIT, 0, 0 },
	{OBJ16_32x32 * 4, DOWASURE_WAIT, 0, 0 },
	{OBJ16_32x32 * 5, DOWASURE_WAIT, 0, 0 },
	{OBJ16_32x32 * 6, DOWASURE_WAIT_L, 0, 0 },
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm *const DoWasureAnmTbl[]={
	DoWasureAnm,
};
static const actAffAnm DoWasureAffAnm[] = {
	{ 0x00, 0x00,  4,  4 },
	{ 0x00, 0x00, -4,  8 },
	{ 0x00, 0x00,  4,  4 },
	{ACT_AFcLOOP,  2, 0, 0 },
	{ACT_AFEND, 0, 0, 0 },
};
static const actAffAnm *const DoWasureAffAnmTbl[] = {
	DoWasureAffAnm,
};

const actHeader ActDoWasureHeader = {
	WAZACHR_ID_HATENA,
	WAZACHR_ID_HATENA,
	&WazaOamDataNormal[2],
	DoWasureAnmTbl,
	0,
	DummyActAffTbl,
	DoWasureInit,
};

//==============================================
//	初期化（ワーク初期化不要）
//==============================================
static void DoWasureInit(actWork *Xreg)
{
	s16 xofs, yofs;
/*
	if(MineEnemyCheck(AttackNo) == ){
		Xreg->x = GetWazaEffPos(AttackNo, PM_X) + DOWASURE_XOFS;
		Xreg->y = GetWazaEffPos(AttackNo, PM_Y) - DOWASURE_MINE_YOFS;
	}else{
		Xreg->x = GetWazaEffPos(AttackNo, PM_X) - DOWASURE_XOFS;
		Xreg->y = GetWazaEffPos(AttackNo, PM_Y) - DOWASURE_ENEMY_YOFS;
	}
*/

	xofs = W_GetPokeSize(AttackNo,POKESIZE_WIDTH) / 2;
	yofs = - (W_GetPokeSize(AttackNo,POKESIZE_HEIGHT) / 2);
	if(MineEnemyCheck(AttackNo)==SIDE_ENEMY){
		xofs *= -1;
	}

	Xreg->x = GetWazaEffPos(AttackNo, PM_X) + xofs;
	Xreg->y = GetWazaEffPos(AttackNo, PM_Y) + yofs;
	if(Xreg->y < DOWASURE_YPOS_MIN){
		Xreg->y = DOWASURE_YPOS_MIN;
	}


	SetWorkSeq(Xreg, DoWasureLeanInit);
	Xreg->move = W_AnmEndWait;
}
//==============================================
//	傾け初期化
//==============================================
static void DoWasureLeanInit(actWork *Xreg)
{
	Xreg->oamData.AffineMode = 1;
	Xreg->aff_tbl = DoWasureAffAnmTbl;
	Xreg->work[0] = 0;
	AffineNumSet(Xreg);
	Xreg->move = DoWasureLean;
}
//==============================================
//	傾け中
//==============================================
static void DoWasureLean(actWork *Xreg)
{
	switch(Xreg->work[0]){
	case 0:
		if(Xreg->affend_sw){
			AffineWorkNumDel(Xreg->oamData.AffineParamNo);
			Xreg->oamData.AffineMode = 0;
			Xreg->work[1] = DOWASURE_WAIT_L;
			Xreg->work[0]++;
		}
		break;

	case 1:
		if(!(Xreg->work[1]--)){
			DelWazaEffect(Xreg);
		}
		break;

	}
}

//=========================================================================
//
//	ヨガのポーズ
//																by TAYA
//=========================================================================
static const actAffAnm YogaAffAnm[] = {
	{ -0x08,  0x0a, 0, 16 },
	{  0x12, -0x12, 0, 16 },
	{ -0x14,  0x10, 0, 8  },
	{ ACT_AFEND, 0, 0, 0 },
};


#define YOGA_1ST_XRATIO   (0x80)
#define YOGA_1ST_YRATIO   (0x1a0)
#define YOGA_1ST_SYNC     (16)
#define YOGA_2ND_XRATIO   (0x1a0)
#define YOGA_2ND_YRATIO   (0x80)
#define YOGA_2ND_SYNC     (16)
#define YOGA_3RD_SYNC     (8)

static void TaskYogaNoPoseMain(u8 id);
void PokeKakusyukuYHosei(u8 pokeact);

//=======================================================
//	初期化タスク（ワーク初期化不要）
//=======================================================
void TaskYogaNoPose(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = W_GetPokeActNo(0);
	SetPokeKakusyukuAnm(my, my->work[0], YogaAffAnm);

	my->TaskAdrs = TaskYogaNoPoseMain;
}
//=======================================================
//	メインタスク
//=======================================================
static void TaskYogaNoPoseMain(u8 id)
{
	if(!PokeKakusyukuAnm(&TaskTable[id])){
		DelTaskEffect(id);
	}
}


//=========================================================================
//
//	テレポート
//																by taya
//=========================================================================
#define TELEPORT_AFF_SYNC (20)
#define TELEPORT_FLY_SPD  (8)
#define TELEPORT_FLYSYNC_ENEMY  (4)
#define TELEPORT_FLYSYNC_MINE   (8)

static const actAffAnm TeleportAffAnm[] = {
	{ 64,  -4, 0, TELEPORT_AFF_SYNC },
	{ 0, 0, 0,  200  },  // 細長くなったままの状態を保つ空ループ
	{ ACT_AFEND, 0, 0, 0 },
};


static void TaskTeleportMain(u8 id);

//=======================================================
//	初期化タスク（ワーク初期化不要）
//=======================================================
void TaskTeleport(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = W_GetPokeActNo(0);
	my->work[1] = 0;
	my->work[2] = 0;
	my->work[3] = MineEnemyCheck(AttackNo)? TELEPORT_FLYSYNC_ENEMY : TELEPORT_FLYSYNC_MINE;

	SetPokeKakusyukuAnm(my, my->work[0], TeleportAffAnm);

	my->TaskAdrs = TaskTeleportMain;
}
//=======================================================
//	メインタスク
//=======================================================
static void TaskTeleportMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[1]){
	case 0:
		PokeKakusyukuAnm(my);
		if(++(my->work[2]) >= TELEPORT_AFF_SYNC)
		{
			my->work[1]++;
		}
		break;

	case 1:
		if(my->work[3]){
			ActWork[my->work[0]].dy -= TELEPORT_FLY_SPD;
			my->work[3]--;
		}else{
			ActWork[my->work[0]].banish = 1;
			ActWork[my->work[0]].x = 272;   // 戦闘終了時のﾌｪｰﾄﾞｱｳﾄでも表示させない
			PokeKakusyukuEnd(my->work[0]);  // 拡縮ｱﾆﾒを最後まで行わないので。
			DelTaskEffect(id);
		}
		break;

	}
}




//=========================================================================
//
//	ふういん
//																by taya
//=========================================================================
#define HUUIN_MARU_OFS  (20)
#define HUUIN_MARU_WAIT  (8)
#define HUUIN_BATSU_WAIT  (60)

static void TaskHuuinMain(u8 id);

static const actHeader HuuinMaruHeader = {
	WAZACHR_ID_HUUIN,
	WAZACHR_ID_HUUIN,
	&WazaOamDataBldNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	DummyActMove,
};

//=================================
//  小さい丸×５(ﾜｰｸ初期化不要)
//=================================
void TaskHuuin(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	u16 w, h;

	my->work[3] = 0x10;
	my->work[4] = 0x00;

	my->work[13] = GetWazaEffPos(AttackNo, PM_X);
	my->work[14] = GetWazaEffPos(AttackNo, PM_Y);

	w = W_GetPokeSize(AttackNo, POKESIZE_WIDTH) / 3;
	h = W_GetPokeSize(AttackNo, POKESIZE_HEIGHT) / 3;
	my->work[12] = (w > h)? w : h;

	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = 0x0010;

	my->TaskAdrs = TaskHuuinMain;
}
static void TaskHuuinMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		if(++(my->work[1]) > HUUIN_MARU_WAIT){
			u8 no;
			my->work[1] = 0;
			no = AddActor(&HuuinMaruHeader,my->work[13],my->work[14],0);
			my->work[8+my->work[2]] = no;
			if(no != ACT_MAX){
				switch(my->work[2]){
				case 0: ActWork[no].dx =  (my->work[12]); ActWork[no].dy = -(my->work[12]); break;
				case 1: ActWork[no].dx = -(my->work[12]); ActWork[no].dy =  (my->work[12]); break;
				case 2: ActWork[no].dx =  (my->work[12]); ActWork[no].dy =  (my->work[12]); break;
				case 3: ActWork[no].dx = -(my->work[12]); ActWork[no].dy = -(my->work[12]); break;
				default: break;
				}
			}
			if(++(my->work[2]) == 5)
			{
				my->work[0]++;
			}
		}
		break;

	case 1:
		if(my->work[1] & 1){
			my->work[3]--;
		}else{
			my->work[4]++;
		}
		*(vu16*)REG_BLDALPHA = (my->work[4]<<8)|my->work[3];
		if(++(my->work[1])==32)
		{
			u16 i;
			for(i = 8; i <= 12; i++)
			{
				if(my->work[i]!=ACT_MAX){
					DelActor(&(ActWork[my->work[i]]));
				}
			}
			my->work[0]++;
		}
		break;

	case 2:
		my->work[0]++;
		break;

	case 3:
		*(vu16*)REG_BLDALPHA = 0;
		*(vu16*)REG_BLDCNT = 0;
		DelTaskEffect(id);
		break;
	}
}
//=================================
//  大きい×マーク
//  0:(0:攻撃側  1:防御側)  1:wait
//=================================
static void HuuinBatsuActInit(actWork *act);

const actHeader HuuinBatsuHeader = {
	WAZACHR_ID_HUUINBATSU,
	WAZACHR_ID_HUUINBATSU,
	&WazaOamDataNormal[3],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	HuuinBatsuActInit,
};

static void HuuinBatsuActMain(actWork *act)
{
	if(act->work[1] > act->work[0]-10){
		act->banish = act->work[1]&1;
	}
	if(act->work[1]==act->work[0]){
		DelWazaEffect(act);
	}
	act->work[1]++;
}
static void HuuinBatsuActInit(actWork *act)
{
//	WazaDefaultPosSet1(act, PM_MODE);
	if(WazaEffWork[0]==0){
		act->x = GetWazaEffPos(AttackNo,PM_X);
		act->y = GetWazaEffPos(AttackNo,PM_Y);
	}

	act->work[0] = WazaEffWork[1];
	act->move = HuuinBatsuActMain;
}






//=========================================================================
//
//	スキルスワップ
//																by taya
//=========================================================================
#define SWAP_BALL_MAX   (12)
#define SWAP_BALL_WAIT  (6)
#define SWAP_BALL_YAMANARI_HEIGHT  (10)
#define SWAP_BALL_MOVE_SYNC  (16)


static void TaskSkillSwapMain(u8 id);
static void SwapActInit(actWork *act);

static const actAffAnm SwapAffAnm0[] = {
	{-0x08,-0x08, 0, 8 },
	{ 0x08, 0x08, 0, 8 },
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm SwapAffAnm1[] = {
	{ 0xf0, 0xf0, 0, ACT_AFSET },
	{-0x08,-0x08, 0, 6 },
	{ 0x08, 0x08, 0, 8 },
	{-0x08,-0x08, 0, 2 },
	{ACT_AFLOOP,1,0,0},
};
static const actAffAnm SwapAffAnm2[] = {
	{ 0xd0, 0xd0, 0, ACT_AFSET },
	{-0x08,-0x08, 0, 4 },
	{ 0x08, 0x08, 0, 8 },
	{-0x08,-0x08, 0, 4 },
	{ACT_AFLOOP,1,0,0},
};
static const actAffAnm SwapAffAnm3[] = {
	{ 0xb0, 0xb0, 0, ACT_AFSET },
	{-0x08,-0x08, 0, 2 },
	{ 0x08, 0x08, 0, 8 },
	{-0x08,-0x08, 0, 6 },
	{ACT_AFLOOP,1,0,0},
};

static const	actAffAnm * const SwapAffAnmTbl[] = {
	SwapAffAnm0,
	SwapAffAnm1,
	SwapAffAnm2,
	SwapAffAnm3,
};

static const actHeader SwapHeader = {
	WAZACHR_ID_SWAP,
	WAZACHR_ID_SWAP,
	&WazaOamDataAffine[1],
	DummyActAnmTbl,
	0,
	SwapAffAnmTbl,
	SwapActInit,
};

//==============================================
// 0:(0:攻撃側→防御側  1:防御側→攻撃側)
//==============================================
void TaskSkillSwap(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	if(ContestCheck()){
		if(WazaEffWork[0] == 1){
			my->work[10] = -SWAP_BALL_YAMANARI_HEIGHT;
			my->work[11] = W_GetPokeSize(DefenceNo, POKESIZE_RIGHT) - 8;
			my->work[12] = W_GetPokeSize(DefenceNo, POKESIZE_TOP) + 8;
			my->work[13] = W_GetPokeSize(AttackNo, POKESIZE_RIGHT) - 8;
			my->work[14] = W_GetPokeSize(AttackNo, POKESIZE_TOP) + 8;
		}else{
			my->work[10] = SWAP_BALL_YAMANARI_HEIGHT;
			my->work[11] = W_GetPokeSize(AttackNo, POKESIZE_LEFT) + 8;
			my->work[12] = W_GetPokeSize(AttackNo, POKESIZE_BOTTOM) - 8;
			my->work[13] = W_GetPokeSize(DefenceNo, POKESIZE_LEFT) + 8;
			my->work[14] = W_GetPokeSize(DefenceNo, POKESIZE_BOTTOM) - 8;
		}
	}else{
		if(WazaEffWork[0] == 1){
			my->work[10] = -SWAP_BALL_YAMANARI_HEIGHT;
			my->work[11] = W_GetPokeSize(DefenceNo, POKESIZE_LEFT) + 8;
			my->work[12] = W_GetPokeSize(DefenceNo, POKESIZE_TOP) + 8;
			my->work[13] = W_GetPokeSize(AttackNo, POKESIZE_LEFT) + 8;
			my->work[14] = W_GetPokeSize(AttackNo, POKESIZE_TOP) + 8;
		}else{
			my->work[10] = SWAP_BALL_YAMANARI_HEIGHT;
			my->work[11] = W_GetPokeSize(AttackNo, POKESIZE_RIGHT) - 8;
			my->work[12] = W_GetPokeSize(AttackNo, POKESIZE_BOTTOM) - 8;
			my->work[13] = W_GetPokeSize(DefenceNo, POKESIZE_RIGHT) - 8;
			my->work[14] = W_GetPokeSize(DefenceNo, POKESIZE_BOTTOM) - 8;
		}
	}

	my->work[1] = SWAP_BALL_WAIT;
	my->TaskAdrs = TaskSkillSwapMain;
}

static void TaskSkillSwapMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		if(++(my->work[1]) > SWAP_BALL_WAIT)
		{
			u8 no;

			my->work[1] = 0;
			no = AddActor(&SwapHeader, my->work[11], my->work[12], 0);
			if(no != ACT_MAX){
				ActWork[no].work[0] = SWAP_BALL_MOVE_SYNC;
				ActWork[no].work[2] = my->work[13];
				ActWork[no].work[4] = my->work[14];
				ActWork[no].work[5] = my->work[10];
				YamanariMoveInit(&ActWork[no]);
				ActAffAnmChg(&ActWork[no], (my->work[2] & 3));
			}
			if(++(my->work[2]) == SWAP_BALL_MAX)
			{
				my->work[0]++;
			}
		}
		break;

	case 1:
		if(++(my->work[1]) >= (SWAP_BALL_MOVE_SYNC+2)){
			DelTaskEffect(id);
		}
		break;
	}
}
//-----------------------------------------
// ボールの動作関数
//-----------------------------------------
static void SwapActInit(actWork *act)
{
	if(YamanariMoveMain(act)){
		AffineWorkNumDel( act->oamData.AffineParamNo );
		DelActor(act);
	}
}








//=========================================================================
//
//		ラスターパージ
//														TAYA  2002.07.20
//=========================================================================

static const actAffAnm LusterAffAnm[] = {
	{ 0x20, 0x20, 0, ACT_AFSET },
	{ 0x04, 0x04, 0, 120 },
	{ACT_AFEND,1,0,0 },
};

static const	actAffAnm * const LusterAffAnmTbl[] = {
	LusterAffAnm,
};

//	0:Xoffset  1:Yoffset  2: 0=攻撃側に出す  1=防御側に出す
//	 3:座標ﾓｰﾄﾞ(0:PMﾓｰﾄﾞ1:EFFﾓｰﾄﾞ)
const actHeader LusterHeader = {
	WAZACHR_ID_PURGE,
	WAZACHR_ID_PURGE,
	&WazaOamDataBldAffine2[3],
	DummyActAnmTbl,
	0,
	LusterAffAnmTbl,
	W_AnmAffWaitDel,
};




















//=========================================================================
//
//		じんつうりき
//														TAYA  2002.07.22
//=========================================================================

//===========================================
// BG状態の相手をﾗｽﾀｰで歪ませる
//===========================================
static void TaskJintuRikiMain(u8 id);
void TaskJintuRiki(u8 id)
{
	LasterData  LD;
	TASK_TABLE *my = &TaskTable[id];
	s16 i;


	my->work[14] = GetPokeShadowYPos(DefenceNo) - 32; // 14:ｴﾌｪｸﾄ開始Y
	switch(WazaEffWork[0]){
	case 0:
		my->work[11] = 2;   // 11:sin_cos_tableの添え字ｽﾃｯﾌﾟ
		my->work[12] = 5;   // 12:sin_cos_table値の右ｼﾌﾄ
		my->work[13] = 64;  // 13:sin_cos_tableの添え字開始値
		my->work[15] = my->work[14] + 64;  // 15:ｴﾌｪｸﾄ終了Y
		break;
	case 1:
		my->work[11] = 2;
		my->work[12] = 5;
		my->work[13] = 192;
		my->work[15] = my->work[14] + 64;
		break;
	case 2:
		my->work[11] = 4;
		my->work[12] = 4;
		my->work[13] = 0;
		my->work[15] = my->work[14] + 64;
	}

	if(my->work[14]<0){
		my->work[14] = 0;
	}

	if(GetPokeBGNo(DefenceNo) == 1)
	{
		my->work[10] = ScrX1;  // 10:BG基準X
		LD.DestAdrs = (void*)REG_BG1HOFS;
	}
	else
	{
		my->work[10] = ScrX2;
		LD.DestAdrs = (void*)REG_BG2HOFS;
	}

	for(i = my->work[14]; i <= (my->work[14] + 64); i++)
	{
		LasterBuffer[0][i] = my->work[10];
		LasterBuffer[1][i] = my->work[10];
	}

	LD.DMAControl = H_DMA_ENABLE16;
	LD.TransType = LASTER_NORMAL;
	LD.LoopCount = 0;
	LasterDmaSet(LD);

	my->TaskAdrs = TaskJintuRikiMain;

}
static void TaskJintuRikiMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		{
			s16 i, c, x;
			c = my->work[13];
			for(i = my->work[14]; i <= my->work[15]; i++){
				x = (sin_cos_table[c] >> my->work[12]);
				if(x > 0){
					x += (my->work[1] & 3);
				}else if(x < 0){
					x -= (my->work[1] & 3);
				}
				LasterBuffer[0][i] = my->work[10] + x;
				LasterBuffer[1][i] = my->work[10] + x;
				c += my->work[11];
			}

			if(++(my->work[1]) >= 24){
				my->work[0]++;
			}
		}
		break;

	case 1:
		LasterSys.TransType = LASTER_END;
		my->work[0]++;
		break;

	case 2:
		DelTaskEffect(id);
		break;
	}
}


//===========================================
// 残像を出す
// 0:(0:攻撃側  1:防御側)
//===========================================
static void TaskJintuRikiZanzouMain(u8 id);
void TaskJintuRikiZanzou(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	s16 actno, affno;


	affno = AffineWorkNumGet();
	if(affno == 0xff){
		DelTaskEffect(id);
		return;
	}

	actno = W_PokeZanzouMake(WazaEffWork[0]);
	if(actno < 0){
		AffineWorkNumDel(affno);
		DelTaskEffect(id);
		return;
	}

	ActWork[actno].move = DummyActMove;
	ActWork[actno].oamData.AffineMode = 3;
	ActWork[actno].oamData.AffineParamNo = affno;
	ActWork[actno].aff_pause = 1;
	ActWork[actno].pri++;
	PokeKakusyukuSet(actno, 0x100, 0x100, 0);

	actCenterCalc(&ActWork[actno], ActWork[actno].oamData.Shape,
			ActWork[actno].oamData.Size, ActWork[actno].oamData.AffineMode);

	my->work[13] = W_GetPokeActNo(WazaEffWork[0]);
	my->work[14] = affno;
	my->work[15] = actno;

	my->TaskAdrs = TaskJintuRikiZanzouMain;
}
static void TaskJintuRikiZanzouMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		my->work[1] += 4;
		my->work[2] = 0x100 - (sin_cos_table[my->work[1]] >> 1);
		PokeKakusyukuSet(my->work[15], my->work[2], my->work[2], 0);
		ZanzouKakusyukuYHosei(my->work[15], my->work[13]);
		if(my->work[1] == 48){
			my->work[0]++;
		}
		break;

	case 1:
		my->work[1] -= 4;
		my->work[2] = 0x100 - (sin_cos_table[my->work[1]] >> 1);
		PokeKakusyukuSet(my->work[15], my->work[2], my->work[2], 0);
		ZanzouKakusyukuYHosei(my->work[15], my->work[13]);
		if(my->work[1] == 0){
			my->work[0]++;
		}
		break;

	case 2:
		W_PokeZanzouDel(&ActWork[my->work[15]]);
		my->work[0]++;
		break;

	case 3:
		AffineWorkNumDel(my->work[14]);
		DelTaskEffect(id);
		break;
	}
}











//=========================================================================
//
//		サイコブースト
//												by matsuda 2002.08.01(木)
//=========================================================================
static void SaicoBoostInit(actWork *xreg);

static const actAffAnm SaicoBoostAffAnm0[] = {
	{ 0x20, 0x20, 0, ACT_AFSET },	//小さい状態から大きく
	{0x10,0x10, 0, 17},
	
	{ACT_AFcLOOP, 0,0,0},			//ゆっくり
	{-0x8, -0x8, 0, 10},
	{0x8, 0x8, 0, 10},
	{ACT_AFcLOOP, 4,0,0},

	{ACT_AFcLOOP, 0,0,0},			//激しく
	{-0x10, -0x10, 0, 5},
	{0x10, 0x10, 0, 5},
	{ACT_AFcLOOP, 7,0,0},
	
//	{-0x10, 0x18, 0, 20},			//細長くなって消える
	
	{ACT_AFEND,0,0,0},
};
static const actAffAnm SaicoBoostAffAnm1[] = {	//細長くなって消える
	{-0x14, 0x18, 0, 15},
	{ACT_AFEND,0,0,0},
};
static const	actAffAnm * const SaicoBoostAffTbl[] = {
	SaicoBoostAffAnm0,
	SaicoBoostAffAnm1,
};
const actHeader SaicoBoostHeader = {
	WAZACHR_ID_JUUDEN2,
	WAZACHR_ID_JUUDEN2,
	&WazaOamDataBldAffine2[3],
	DummyActAnmTbl,
	0,
	SaicoBoostAffTbl,
	SaicoBoostInit,
};

//----------------------------------------------------------
//	offset	なし
//----------------------------------------------------------
#define SAICOBOOST_BLDWAIT	2
#define SAICOBOOST_ADDY		0x0380	//上昇していく時の速度
static void SaicoBoostInit(actWork *xreg)
{
	switch(xreg->work[0]){
		case 0:
			xreg->x = GetWazaEffPos(AttackNo, EFF_X);
			xreg->y = GetWazaEffPos(AttackNo, EFF_Y);
			if(ContestCheck())
				xreg->y += 12;	//審査員に被らないように下げる
			xreg->work[1] = 0x8;
			*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
			*(vu16*)REG_BLDALPHA = ((16-xreg->work[1]) << 8) | xreg->work[1];
			xreg->work[0]++;
			break;
		case 1:
			if(xreg->affend_sw){
				SePlayPan(SE_W100, GetWazaEffSePan(WAZA_SE_L));
				ActAffAnmHoldChg(xreg, 1);
				xreg->work[0]++;
			}
			break;
		case 2:
			if(xreg->work[2]++ >= SAICOBOOST_BLDWAIT){
				xreg->work[2] = 0;
				
				xreg->work[1]--;
				*(vu16*)REG_BLDALPHA = ((16-xreg->work[1]) << 8) | xreg->work[1];
				
				if(xreg->work[1] == 0){
					xreg->work[0]++;
					xreg->banish = 1;
				}
			}

			xreg->work[3] += SAICOBOOST_ADDY;
			xreg->dy -= xreg->work[3] >> 8;
			xreg->work[3] &= 0x00ff;
			break;
		case 3:
			*(vu16*)REG_BLDCNT = 0;
			*(vu16*)REG_BLDALPHA = 0;
			DelWazaEffect(xreg);
			break;
	}
}


